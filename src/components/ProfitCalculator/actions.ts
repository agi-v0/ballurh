'use server'

import { FormData } from '@/components/ProfitCalculator/schema'

const round = (num: number) => Math.round((num + Number.EPSILON) * 100) / 100

const annualSalesOptions = new Map([
  ['أقل من 500,000', 250000],
  ['500,000 - 750,000', 625000],
  ['750,000 - 1,250,000', 1000000],
  ['1,250,000 - 2,000,000', 1625000],
  ['أكثر من 2,000,000', 2000000],
])

export async function calculateProfit(data: FormData) {
  try {
    console.log('Received data:', data)
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
      name = '',
      email = '',
      phone = '',
      businessName = '',
    } = data

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

    // Submit to HubSpot
    const portalId = process.env.HUBSPOT_PORTAL_ID
    const formId = process.env.HUBSPOT_FORM_ID

    if (portalId && formId) {
      const fields = [
        { name: 'name', value: name },
        { name: 'email', value: email },
        { name: 'phone', value: phone },
        { name: 'company', value: businessName },
        { name: 'activity_type', value: activityType },
        { name: 'physical_branches_count', value: String(physicalBranchesCount) },
        { name: 'has_cloud_brands', value: hasCloudBrands },
        { name: 'cloud_brands_count', value: String(cloudBrandsCount) },
        { name: 'annual_sales', value: annualSales },
        { name: 'monthly_orders', value: monthlyOrders },
        { name: 'delivery_sales_percentage', value: String(deliverySalesPercentage) },
        { name: 'avg_commission_rate', value: String(avgCommissionRate) },
        { name: 'food_cost_percentage', value: String(foodCostPercentage) },
        { name: 'monthly_ad_budget', value: monthlyAdBudget },
        { name: 'delivery_fee_borne', value: String(deliveryFeeBorne) },
      ]
      // https://forms-eu1.hsforms.com/submissions/v3/public/submit/formsnext/multipart/139527855/ff7deea6-2c30-44ca-b0f3-b00da8a46c07
      try {
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
    }

    // console.log('totalAnnualProfit: ', totalAnnualProfit)

    // Simulate a network delay for 2 seconds
    // await new Promise((resolve) => setTimeout(resolve, 2000))

    return { success: true, message: 'Data received successfully', totalAnnualProfit }
  } catch (error) {
    console.error('Error processing request:', error)
    return { success: false, message: 'Error processing request' }
  }
}
