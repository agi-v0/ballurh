import type { FormData } from '@/components/ProfitCalculator/schema'
import type { ProfitabilityReportEmailProps } from 'react-email/emails/profitability-report'

const businessTypeLabels = new Map([
  ['restaurant', 'Restaurant / Café'],
  ['cloudKitchen', 'Dark Kitchen / Dark Store'],
  ['hybridRestaurant', 'Hybrid Model'],
])

type HubspotField = {
  name: string
  value: unknown
}

type ProfitMetrics = {
  monthlySalesNumber: number
  monthlyOrdersNumber: number
  monthlyOnlinePaymentAmount: number
  monthlySalesCommissionsAmount: number
  monthlyDisputesAmount: number
  monthlyDeliverySurchargeAmount: number
  monthlyAdBudgetNumber: number
  totalMonthlyMarketingAmount: number
  totalMonthlyTransactionExpenses: number
  totalMonthlyExpenseAmounts: number
  marketingSalesPercentage: number
  totalExpensesPctOfSales: number
  priceMarkupToCoverAppFee: number
  transactionCommissions: number
  monthlyNetSalesNumber: number
  netProfitRate: number
  netProfitNumber: number
  profitPlus15: number
  profitPlus30: number
  savedDisputes: number
}

const round = (num: number) => Math.round((num + Number.EPSILON) * 100) / 100

const formatCurrency = (amount: number, currency = 'SAR') =>
  new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency,
    maximumFractionDigits: 0,
  }).format(amount)

const formatPercent = (value: number) => {
  const normalized = value > 1 ? value / 100 : value
  return new Intl.NumberFormat('en', {
    style: 'percent',
    maximumFractionDigits: 1,
  }).format(normalized)
}

export type ProfitCalculationArtifacts = {
  hubspotFields: HubspotField[]
  metrics: ProfitMetrics
  emailProps: ProfitabilityReportEmailProps
}

export function buildProfitCalculationArtifacts(data: FormData): ProfitCalculationArtifacts {
  const {
    activityType = 'hybridRestaurant',
    physicalBranchesCount = 1,
    hasCloudBrands = 'لا',
    cloudBrandsCount = 1,
    monthlySales = '0',
    monthlyOrders = '',
    avgCommissionRate = 0.25,
    foodCostPercentage = 0.3,
    monthlyAdBudget = 0,
    deliveryFeeBorne = 10,
    name = '',
    email = '',
    phone = '',
    businessName = '',
  } = data

  const monthlySalesNumber = Number(monthlySales)
  const monthlyOrdersNumber = Number(monthlyOrders)
  const monthlyAdBudgetNumber = Number(monthlyAdBudget)

  const onlinePaymentRate = 0.025
  const disputesRate = 0.05

  const monthlyOnlinePaymentAmount = monthlySalesNumber * onlinePaymentRate
  const monthlySalesCommissionsAmount = monthlySalesNumber * avgCommissionRate
  const monthlyDisputesAmount = monthlySalesNumber * disputesRate
  const totalMonthlyTransactionExpenses =
    monthlyOnlinePaymentAmount + monthlySalesCommissionsAmount + monthlyDisputesAmount

  const monthlyDeliverySurchargeAmount = monthlyOrdersNumber * deliveryFeeBorne

  const totalMonthlyMarketingAmount = monthlyDeliverySurchargeAmount + monthlyAdBudgetNumber
  const marketingSalesPercentage = round(totalMonthlyMarketingAmount / monthlySalesNumber)
  const totalMonthlyExpenseAmounts = totalMonthlyTransactionExpenses + totalMonthlyMarketingAmount

  const totalExpensesPctOfSales = round(totalMonthlyExpenseAmounts / monthlySalesNumber)

  const priceMarkupToCoverAppFee = round(1 / (1 - totalExpensesPctOfSales)) - 1
  const transactionCommissions = avgCommissionRate + onlinePaymentRate + disputesRate
  const monthlyNetSalesNumber = monthlySalesNumber - totalMonthlyExpenseAmounts

  const netProfitRate = round(1 - totalExpensesPctOfSales - foodCostPercentage)
  const netProfitNumber = round(netProfitRate * monthlySalesNumber)
  const profitPlus15 = round(netProfitNumber * 1.15)
  const profitPlus30 = round(netProfitNumber * 1.3)
  const savedDisputes = round(monthlyDisputesAmount * 0.7)

  const metrics: ProfitMetrics = {
    monthlySalesNumber,
    monthlyOrdersNumber,
    monthlyOnlinePaymentAmount,
    monthlySalesCommissionsAmount,
    monthlyDisputesAmount,
    monthlyDeliverySurchargeAmount,
    monthlyAdBudgetNumber,
    totalMonthlyMarketingAmount,
    totalMonthlyTransactionExpenses,
    totalMonthlyExpenseAmounts,
    marketingSalesPercentage,
    totalExpensesPctOfSales,
    priceMarkupToCoverAppFee,
    transactionCommissions,
    monthlyNetSalesNumber,
    netProfitRate,
    netProfitNumber,
    profitPlus15,
    profitPlus30,
    savedDisputes,
  }

  const hubspotFields: HubspotField[] = [
    { name: 'firstname', value: name },
    { name: 'email', value: email },
    { name: 'mobilephone', value: phone },
    { name: 'brand_name', value: businessName },
    { name: 'business_type', value: businessTypeLabels.get(activityType) },
    { name: 'number_of_locations', value: physicalBranchesCount },
    { name: 'has_cloud_brands', value: hasCloudBrands },
    { name: 'number_of_cloud_brands', value: cloudBrandsCount },
    { name: 'annual_sales_revenue', value: monthlySales },
    { name: 'monthly_orders', value: monthlyOrders },
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

  const pnl: ProfitabilityReportEmailProps['pnl'] = [
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
  ]

  const pnlFooter: ProfitabilityReportEmailProps['pnlFooter'] = [
    // {
    //   label: 'اجمالى العمولات & التعويضات & التسويق',
    //   amount: formatCurrency(totalMonthlyExpenseAmounts),
    //   type: 'expense',
    // },
    {
      label: 'نسبة المصروفات من المبيعات',
      amount: formatPercent(totalExpensesPctOfSales),
      type: 'expense',
    },
    { label: 'صافي الربح', amount: formatCurrency(netProfitNumber), type: 'revenue' },
    {
      label: 'نسبة صافي الربح من المبيعات',
      amount: formatPercent(netProfitRate),
      type: 'revenue',
    },
  ]

  const recommendations: ProfitabilityReportEmailProps['recommendations'] = []
  const markupPct = Math.round(metrics.priceMarkupToCoverAppFee * 100)

  if (avgCommissionRate > 0.25) {
    recommendations.push({
      title: 'تغطية عمولة التطبيقات بالتسعير',
      description: `استخدم إستراتيجية تسعير تدرّجية لتغطية الرسوم. الزيادة الموصى بها لتغطية الرسوم الحالية: حوالي ${markupPct}% على العناصر المناسبة دون التأثير على الطلب.`,
      impact: 'high',
    })
  }

  if (foodCostPercentage > 0.3) {
    recommendations.push({
      title: 'خفض تكلفة المواد الغذائية',
      description:
        'راجع حصص الوصفات واتفاقيات المورّدين، وراقب نسبة الهدر أسبوعيًا. استهدف نسبة تكلفة بين 25% و28% للأطباق الأساسية.',
      impact: 'medium',
    })
  }

  if (metrics.marketingSalesPercentage > 0.1) {
    recommendations.push({
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

  const date = new Date()

  const emailProps: ProfitabilityReportEmailProps = {
    username: name,
    restaurantName: businessName || 'مطعمك',
    periodLabel: `${date.getMonth} ${date.getFullYear}`,
    profit: metrics.netProfitNumber,
    profitRate: metrics.netProfitRate,
    expenseRate: metrics.totalExpensesPctOfSales,
    savedDisputes: metrics.savedDisputes,
    ctaUrl: `${SITE_URL}/ar/meeting`,
    ctaLabel: 'احجز إجتماع',
    pnl,
    pnlFooter,
    recommendations: recommendations.length ? recommendations : undefined,
  }

  return { metrics, hubspotFields, emailProps }
}

export type { HubspotField, ProfitMetrics }
