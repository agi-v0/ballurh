import type { Payload } from 'payload'
import { type HubspotField } from './buildProfitCalculationArtifacts'

type HubspotResponse = {
  ok: boolean
  error?: string
}

type SubmissionRecord = {
  field: string
  value: string
}

export function mapFieldsToSubmission(fields: HubspotField[]): SubmissionRecord[] {
  return fields.map((field) => ({
    field: field.name,
    value: field.value?.toString() ?? '',
  }))
}

export async function submitHubspot(fields: HubspotField[]): Promise<HubspotResponse> {
  const portalId = process.env.HUBSPOT_PORTAL_ID
  const formId = process.env.HUBSPOT_FORM_ID

  if (!portalId || !formId) {
    console.warn('Skipping HubSpot submission: Missing HUBSPOT_PORTAL_ID or HUBSPOT_FORM_ID')
    return { ok: false, error: 'missing-hubspot-config' }
  }

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
      const body = await response.text()
      console.error('HubSpot submission failed:', body)
      return { ok: false, error: body }
    }

    return { ok: true }
  } catch (error) {
    console.error('Error submitting to HubSpot:', error)
    return { ok: false, error: error instanceof Error ? error.message : 'unknown-error' }
  }
}

export async function saveSubmission(
  payload: Payload,
  fields: HubspotField[],
  formTitle = 'Profit calculator',
): Promise<boolean> {
  try {
    const {
      docs: [form],
    } = await payload.find({
      collection: 'forms',
      depth: 0,
      limit: 1,
      pagination: false,
      where: { title: { equals: formTitle } },
      fallbackLocale: false,
      showHiddenFields: true,
    })

    if (!form) {
      console.error(`Form with title "${formTitle}" not found`)
      return false
    }

    await payload.create({
      collection: 'form-submissions',
      data: {
        form: form.id,
        submissionData: mapFieldsToSubmission(fields),
      },
    })

    return true
  } catch (error) {
    console.error('Error saving submission to Payload CMS:', error)
    return false
  }
}
