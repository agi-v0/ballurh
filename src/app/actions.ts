'use server'

import { FormData } from '@/components/ProfitCalculator/schema'

const round = (num: number) => Math.round((num + Number.EPSILON) * 100) / 100
// const annualSalesOptions = [
//   'أقل من 500,000',
//   '500,000 - 750,000',
//   '750,000 - 1,250,000',
//   '1,250,000 - 2,000,000',
//   'أكثر من 2,000,000',
// ]

const getSales = (str: string) => {
  switch (str) {
    case 'أقل من 500,000':
      return 250000
    case '500,000 - 750,000':
      return 625000
    case '750,000 - 1,250,000':
      return 1000000
    case '1,250,000 - 2,000,000':
      return 1625000
    case 'أكثر من 2,000,000':
      return 2000000
    default:
      return 500000
  }
}

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
    const annualSalesNumber = getSales(annualSales)
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

    // console.log('totalAnnualProfit: ', totalAnnualProfit)

    // Simulate a network delay for 2 seconds
    // await new Promise((resolve) => setTimeout(resolve, 2000))

    return { success: true, message: 'Data received successfully', totalAnnualProfit }
  } catch (error) {
    console.error('Error processing request:', error)
    return { success: false, message: 'Error processing request' }
  }
}
