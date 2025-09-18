'use server'

import { FormData } from '@/components/ProfitCalculator/schema'
import { getPayload } from 'payload'
import type { ProfitabilityReportEmailProps } from 'react-email/emails/profitability-report'
import config from '@payload-config'
import PostHogClient from '@/posthog.js'
import { ProfitCalculatorEvents } from './events'

const round = (num: number) => Math.round((num + Number.EPSILON) * 100) / 100

const formatCurrency = (amount: number, currency = 'USD') =>
  new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'SAR',
    maximumFractionDigits: 0,
  }).format(amount)

const formatPercent = (value: number) => {
  const normalized = value > 1 ? value / 100 : value
  return new Intl.NumberFormat('en', {
    style: 'percent',
    maximumFractionDigits: 1,
  }).format(normalized)
}

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
    monthlySales = '0',
    monthlyOrders = '',
    // deliverySalesPercentage = 0.25,
    avgCommissionRate = 0.25,
    foodCostPercentage = 0.3,
    monthlyAdBudget = 0,
    deliveryFeeBorne = 10,
    // monthlyDisputes = 0,
    name = '',
    email = '',
    phone = '',
    businessName = '',
  } = data

  const first_name = name.split(' ')[0]
  const last_name = name.split(' ').toSpliced(0, 1).join(' ')

  await posthog.identify({
    distinctId: email,
    properties: {
      email,
      first_name,
      last_name,
      phone,
      business_name: businessName,
    },
  })
  await posthog.capture({
    event: ProfitCalculatorEvents.SUBMITTED,
    distinctId: email,
  })
  await posthog.shutdown()

  // const monthlySalesNumber = Number(monthlySales)
  const onlinePaymentRate = 0.025
  const disputesRate = 0.05

  const monthlySalesNumber = Number(monthlySales)
  const monthlyOnlinePaymentAmount = monthlySalesNumber * onlinePaymentRate
  const monthlySalesCommissionsAmount = monthlySalesNumber * avgCommissionRate
  const monthlyDisputesAmount = monthlySalesNumber * disputesRate
  const transactionCommissions = avgCommissionRate + onlinePaymentRate + disputesRate
  const totalMonthlyTransactionExpenses =
    monthlyOnlinePaymentAmount + monthlySalesCommissionsAmount + monthlyDisputesAmount

  const monthlyOrdersNumber = Number(monthlyOrders)
  const monthlyDeliverySurchargeAmount = monthlyOrdersNumber * deliveryFeeBorne

  const totalMonthlyMarketingAmount = monthlyDeliverySurchargeAmount + Number(monthlyAdBudget)
  const marketingSalesPercentage = round(totalMonthlyMarketingAmount / monthlySalesNumber)
  const totalMonthlyExpenseAmounts = totalMonthlyTransactionExpenses + totalMonthlyMarketingAmount

  const totalExpensesPctOfSales = round(totalMonthlyExpenseAmounts / monthlySalesNumber)

  const monthlyNetSalesNumber = monthlySalesNumber - totalMonthlyExpenseAmounts
  const priceMarkupToCoverAppFee = round(1 / (1 - totalExpensesPctOfSales)) - 1

  const netProfitRate = round(1 - totalExpensesPctOfSales - foodCostPercentage)
  const netProfitNumber = round(netProfitRate * monthlySalesNumber)
  const profitPlus15 = round(netProfitNumber * 1.15)
  const profitPlus30 = round(netProfitNumber * 1.3)
  const savedDisputes = round(monthlyDisputesAmount * 0.7)

  // console.log('netProfitNumber: ', netProfitNumber)

  const fields = [
    { name: 'firstname', value: name },
    { name: 'email', value: email },
    { name: 'mobilephone', value: phone },
    { name: 'brand_name', value: businessName },
    { name: 'business_type', value: business_type.get(activityType) },
    { name: 'number_of_locations', value: physicalBranchesCount },
    { name: 'has_cloud_brands', value: hasCloudBrands },
    { name: 'number_of_cloud_brands', value: cloudBrandsCount },
    { name: 'annual_sales_revenue', value: monthlySales },
    { name: 'monthly_orders', value: monthlyOrders },
    // { name: 'delivery_app_sales_percentage', value: deliverySalesPercentage * 100 },
    { name: 'delivery_app_commission_percentage', value: avgCommissionRate * 100 },
    { name: 'food_cost', value: foodCostPercentage * 100 },
    { name: 'monthly_advertising', value: monthlyAdBudget },
    { name: 'monthly_disputes', value: monthlyDisputesAmount },
    { name: 'annual_disputes', value: monthlyDisputesAmount * 12 },
    { name: 'delivery_fees', value: deliveryFeeBorne },
    { name: 'calculated_profit', value: netProfitNumber },
    { name: 'calculated_profit_rate', value: netProfitRate * 100 },
    { name: 'calculated_profit_15_percent', value: round(netProfitNumber * 0.15) },
    { name: 'calculated_profit_30_percent', value: round(netProfitNumber * 0.3) },
    { name: 'calculated_profit_plus_15', value: profitPlus15 },
    { name: 'calculated_profit_plus_30', value: profitPlus30 },
    { name: 'disputes_minus_70', value: savedDisputes },
  ]

  let savedOk = false
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
    savedOk = true
  } catch (error) {
    console.error('Error processing request:', error)
  }

  // Send profitability report email to the lead
  try {
    const apiKey = process.env.RESEND_API_KEY
    const from = process.env.RESEND_EMAIL
    if (!apiKey) {
      console.warn('Skipping email: Missing RESEND_API_KEY')
      return { success: savedOk, message: 'Data saved, email skipped (missing API key)' }
    }

    const pnl: {
      label: string
      amount: string // positive numbers; expenses will be shown with minus styling
      type: 'revenue' | 'expense'
    }[] = [
      { label: 'المبيعات الشهرية', amount: formatCurrency(monthlySalesNumber), type: 'revenue' },
      {
        label: 'عدد الطلبات الشهرية من تطبيقات التوصيل ',
        amount: monthlyOrdersNumber.toString(),
        type: 'revenue',
      },
      {
        label: 'مبلغ المدفوعات الالكترونية',
        amount: formatCurrency(monthlyOnlinePaymentAmount),
        type: 'expense',
      },
      {
        label: 'مبلغ العمولات على المبيعات',
        amount: formatCurrency(monthlySalesCommissionsAmount),
        type: 'expense',
      },
      {
        label: 'منازعات واستردادات (مبلغ التعويضات)',
        amount: formatCurrency(round(monthlyDisputesAmount)),
        type: 'expense',
      },
      {
        label: 'اجمالى التسويق',
        amount: formatCurrency(totalMonthlyMarketingAmount),
        type: 'expense',
      },

      // {
      //   label: 'صافى المبيعات المحققة',
      //   amount: formatCurrency(monthlyNetSalesNumber),
      //   type: 'revenue',
      // },
      // {
      //   label: 'كم لازم ترفع اسعارك عشان تغطي كامل تكلفة نسبة التطبيق',
      //   amount: formatPercent(priceMarkupToCoverAppFee),
      //   type: 'revenue',
      // },
    ]

    const pnlFooter: {
      label: string
      amount: string // positive numbers; expenses will be shown with minus styling
      type: 'revenue' | 'expense'
    }[] = [
      {
        label: 'اجمالى العمولات & التعويضات & التسويق',
        amount: formatCurrency(totalMonthlyExpenseAmounts),
        type: 'expense',
      },
      {
        label: 'نسبة النفقات من المبيعات',
        amount: formatPercent(totalExpensesPctOfSales),
        type: 'expense',
      },
      // {
      //   label: 'صافى المبيعات المحققة',
      //   amount: formatCurrency(monthlyNetSalesNumber),
      //   type: 'revenue',
      // },
      { label: 'صافي الربح', amount: formatCurrency(netProfitNumber), type: 'revenue' },
      {
        label: 'نسبة صافي الربح من المبيعات',
        amount: formatPercent(netProfitRate),
        type: 'revenue',
      },
    ]
    console.log(pnl)
    const recs: ProfitabilityReportEmailProps['recommendations'] = []
    const markupPct = Math.round(priceMarkupToCoverAppFee * 100)
    if (avgCommissionRate > 0.25) {
      recs.push({
        title: 'تغطية عمولة التطبيقات بالتسعير',
        description: `استخدم إستراتيجية تسعير تدرّجية لتغطية الرسوم. الزيادة الموصى بها لتغطية الرسوم الحالية: حوالي ${markupPct}% على العناصر المناسبة دون التأثير على الطلب.`,
        impact: 'high',
      })
    }
    if (foodCostPercentage > 0.3) {
      recs.push({
        title: 'خفض تكلفة المواد الغذائية',
        description:
          'راجع حصص الوصفات واتفاقيات المورّدين، وراقب نسبة الهدر أسبوعيًا. استهدف نسبة تكلفة بين 25% و28% للأطباق الأساسية.',
        impact: 'medium',
      })
    }
    if (marketingSalesPercentage > 0.1) {
      recs.push({
        title: 'تحسين إنفاق التسويق',
        description:
          'حوّل الميزانية نحو القنوات الأعلى مردودًا، واربِط الحملات بمؤشرات واضحة مثل CAC وROAS. اختبر عروضًا تعتمد على هامش الربح لا على الخصم العام.',
        impact: 'medium',
      })
    }

    const SITE_URL =
      process.env.NEXT_PUBLIC_SERVER_URL ||
      process.env.VERCEL_PROJECT_PRODUCTION_URL ||
      'https://example.com'

    const emailProps: ProfitabilityReportEmailProps = {
      restaurantName: businessName || 'مطعمك',
      periodLabel: 'هذا الشهر',
      profit: netProfitNumber,
      profitRate: netProfitRate, // 0–1
      expenseRate: totalExpensesPctOfSales,
      savedDisputes,
      ctaUrl: `${SITE_URL}/ar/meeting`,
      ctaLabel: 'احجز مكالمة',
      pnl,
      pnlFooter,
      recommendations: recs.length ? recs : undefined,
    }

    const subject = `تقرير الربحية — ${businessName || 'مطعمك'}`

    // Prefer sending via our Next route for consistency

    const baseEnv = process.env.NEXT_PUBLIC_SERVER_URL || process.env.VERCEL_PROJECT_PRODUCTION_URL
    const baseUrl = baseEnv
      ? baseEnv.startsWith('http')
        ? baseEnv
        : `https://${baseEnv}`
      : 'http://localhost:3000'

    const resp = await fetch(`${baseUrl}/next/send-email`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        to: email,
        subject,
        template: 'profitability-report',
        templateProps: emailProps,
        from,
      }),
    })
    if (!resp.ok) {
      throw new Error('send-email route failed:')
    }
    console.log(pnl)
    return { success: savedOk, message: 'Data saved and email sent' }
  } catch (error) {
    console.error('Error sending profitability email:', error)
    return { success: savedOk, message: 'Data saved, email sending failed' }
  }
}
