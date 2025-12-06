'use server'

import { FormData } from '@/components/ProfitCalculator/schema'
import { getPayload } from 'payload'
import config from '@payload-config'
import PostHogClient from '@/posthog.js'
import { ProfitCalculatorEvents } from './events'
import { buildProfitCalculationArtifacts } from '@/utilities/buildProfitCalculationArtifacts'
import { submitHubspot, saveSubmission } from '@/utilities/profitCalcFormSubmission'
import { sendEmail } from '@/utilities/email/sendgrid'

export async function calculateProfit(data: FormData) {
  const payload = await getPayload({ config })
  const posthog = PostHogClient()

  const { name = '', email = '', phone = '', businessName = '' } = data

  const first_name = name.split(' ')[0]
  const last_name = name.split(' ').toSpliced(0, 1).join(' ')

  try {
    posthog.identify({
      distinctId: email,
      properties: {
        email,
        first_name,
        last_name,
        phone,
        business_name: businessName,
      },
    })
    posthog.capture({
      event: ProfitCalculatorEvents.SUBMITTED,
      distinctId: email,
    })
    await posthog.shutdown()
  } catch (error) {
    console.error('Error processing request:', error)
  }

  const { hubspotFields, emailProps } = buildProfitCalculationArtifacts(data)

  await submitHubspot(hubspotFields)

  let savedOk = false
  try {
    savedOk = await saveSubmission(payload, hubspotFields)
  } catch (error) {
    console.error('Error processing request:', error)
  }

  const apiKey = process.env.SENDGRID_API_KEY
  if (!apiKey) {
    console.warn('Skipping email: Missing SENDGRID_API_KEY')
    return { success: savedOk, message: 'Data saved, email skipped (missing API key)' }
  }

  const subject = `${first_name}، هذا تقرير حاسبة الربحية من بلورة`

  try {
    await sendEmail({
      from: process.env.SENDGRID_EMAIL,
      to: email,
      subject,
      template: 'profitability-report',
      templateProps: emailProps,
    })
    return { success: savedOk, message: 'Data saved and email sent' }
  } catch (error) {
    console.error('Error sending profitability email:', error)
    return { success: savedOk, message: 'Data saved, email sending failed' }
  }
}
