'use server'

import { FormData } from '@/components/ProfitCalculator/schema'
import { getPayload } from 'payload'
import config from '@payload-config'
import PostHogClient from '@/posthog.js'
import { ProfitCalculatorEvents } from './events'

const round = (num: number) => Math.round((num + Number.EPSILON) * 100) / 100

const annualSalesOptions = new Map([
  ['Less than 500,000', 250000],
  ['500,000 - 750,000', 625000],
  ['750,000 - 1,250,000', 1000000],
  ['1,250,000 - 2,000,000', 1625000],
  ['More than 2,000,000', 2000000],
])

const business_type = new Map([
  ['restaurant', 'Restaurant / Café'],
  ['cloudKitchen', 'Dark Kitchen / Dark Store'],
  ['hybridRestaurant', 'Hybrid Model'],
])

export async function calculateProfit(data: FormData) {
  const payload = await getPayload({ config })
  const posthog = PostHogClient()

  // console.log('Received data:', data)
  const {
    activityType = 'hybridRestaurant',
    physicalBranchesCount = 1,
    hasCloudBrands = 'لا',
    cloudBrandsCount = 1,
    annualSales = 'أقل من 500,000',
    monthlyOrders = '',
    deliverySalesPercentage = 0.25,
    avgCommissionRate = 0.25,
    foodCostPercentage = 0.3,
    monthlyAdBudget = '',
    deliveryFeeBorne = 10,
    monthlyDisputes = 0,
    name = '',
    email = '',
    phone = '',
    businessName = '',
  } = data

  await posthog.identify({
    distinctId: email,
    properties: { email, name, phone, businessName },
  })
  await posthog.capture({
    event: ProfitCalculatorEvents.SUBMITTED,
    distinctId: email,
    properties: { email, name, phone, businessName },
  })
  await posthog.shutdown()

  // const annualSalesNumber = Number(annualSales)
  const annualSalesNumber = annualSalesOptions.get(annualSales) ?? 250000
  const onlinePaymentRate = 0.025
  const annualOnlinePaymentAmount = onlinePaymentRate * annualSalesNumber
  const annualSalesCommissionsAmount = annualSalesNumber * avgCommissionRate
  const compensationRate = 0.02
  const annualCompensationAmount = compensationRate * annualSalesNumber
  const totalPerOrderRates = avgCommissionRate + onlinePaymentRate + compensationRate
  const totalAnnualPerOrderAmounts =
    annualOnlinePaymentAmount + annualSalesCommissionsAmount + annualCompensationAmount
  const monthlyOrdersNumber = Number(monthlyOrders)
  const monthlyDeliverySurchargeAmount = monthlyOrdersNumber * deliveryFeeBorne
  const totalMonthlyMarketingAmount = monthlyDeliverySurchargeAmount + Number(monthlyAdBudget)
  const totalAnnualMarketingAmount = totalMonthlyMarketingAmount
  const marketingSalesPercentage = round(totalAnnualMarketingAmount / annualSalesNumber)
  const totalAnnualExpenseAmounts = totalAnnualPerOrderAmounts + totalAnnualMarketingAmount
  const totalCommCompMarketingPctOfSales = round(totalAnnualExpenseAmounts / annualSalesNumber)

  const annualNetSalesNumber = annualSalesNumber - totalAnnualExpenseAmounts
  const priceMarkupToCoverAppFee = round(1 / (1 - totalCommCompMarketingPctOfSales)) - 1
  const totalProfitRate = round(1 - totalCommCompMarketingPctOfSales - foodCostPercentage)
  const totalAnnualProfit = round(totalProfitRate * annualSalesNumber)
  const savedDisputes = round(monthlyDisputes * 0.7)

  // console.log('totalAnnualProfit: ', totalAnnualProfit)

  const fields = [
    { name: 'firstname', value: name },
    { name: 'email', value: email },
    { name: 'mobilephone', value: phone },
    { name: 'brand_name', value: businessName },
    { name: 'business_type', value: business_type.get(activityType) },
    { name: 'number_of_locations', value: physicalBranchesCount },
    { name: 'has_cloud_brands', value: hasCloudBrands },
    { name: 'number_of_cloud_brands', value: cloudBrandsCount },
    { name: 'annual_sales_revenue', value: annualSales },
    { name: 'monthly_orders', value: monthlyOrders },
    { name: 'estimated_percentage_of_sales', value: deliverySalesPercentage * 100 },
    { name: 'average_percentage_pay_to_delivery_apps', value: avgCommissionRate * 100 },
    { name: 'food_cost', value: foodCostPercentage * 100 },
    { name: 'monthly_advertising', value: monthlyAdBudget },
    { name: 'monthly_disputes', value: monthlyDisputes },
    { name: 'delivery_fees', value: deliveryFeeBorne },
    { name: 'calculated_profit_rate', value: totalProfitRate * 100 },
    { name: 'calculated_profitability', value: totalAnnualProfit },
  ]

  try {
    // Submit to HubSpot
    const portalId = process.env.HUBSPOT_PORTAL_ID
    const formId = process.env.HUBSPOT_FORM_ID
    const response = await fetch(
      `https://api.hsforms.com/submissions/v3/integration/submit/${portalId}/${formId}`,
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ fields }),
      },
    )

    if (!response.ok) {
      console.error('HubSpot submission failed:', await response.text())
    }
  } catch (error) {
    console.error('Error submitting to HubSpot:', error)
  }

  try {
    const {
      docs: [form],
    } = await payload.find({
      collection: 'forms', // required
      depth: 0,
      limit: 1,
      pagination: false,
      where: { title: { equals: 'Profit calculator' } },
      fallbackLocale: false,
      showHiddenFields: true,
    })

    await payload.create({
      collection: 'form-submissions',
      data: {
        form: form.id,
        submissionData: fields?.map((field) => ({
          field: field.name,
          value: field.value?.toString() ?? '',
        })),
      },
    })

    return { success: true, message: 'Data saved successfully' }
  } catch (error) {
    console.error('Error processing request:', error)
    return { success: false, message: 'Error processing request' }
  }
}
