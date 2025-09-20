import { NextResponse } from 'next/server'
import sendgrid, { type MailDataRequired, ResponseError } from '@sendgrid/mail'
import { render } from '@react-email/render'
import { z } from 'zod'
import ProfitabilityReportEmail, {
  type ProfitabilityReportEmailProps,
} from 'react-email/emails/profitability-report'

export const runtime = 'nodejs'

const isValidStatus = (value: number) => Number.isInteger(value) && value >= 100 && value <= 599

function extractErrorInfo(err: unknown) {
  if (err instanceof ResponseError) {
    const code = typeof err.code === 'number' ? err.code : Number.parseInt(String(err.code), 10)
    return {
      message: err.message,
      status: isValidStatus(code) ? code : 500,
      details: err.response?.body ?? null,
    }
  }

  if (err && typeof err === 'object') {
    const maybeStatus = (err as { status?: unknown; statusCode?: unknown; code?: unknown }).status ??
      (err as { status?: unknown; statusCode?: unknown; code?: unknown }).statusCode ??
      (err as { status?: unknown; statusCode?: unknown; code?: unknown }).code

    const statusNumber =
      typeof maybeStatus === 'number'
        ? maybeStatus
        : typeof maybeStatus === 'string'
          ? Number.parseInt(maybeStatus, 10)
          : undefined

    if (typeof statusNumber === 'number' && isValidStatus(statusNumber)) {
      return {
        message: err instanceof Error ? err.message : 'Unexpected error occurred',
        status: statusNumber,
        details: null,
      }
    }
  }

  if (err instanceof Error) {
    return {
      message: err.message,
      status: 500,
      details: null,
    }
  }

  return {
    message: typeof err === 'string' ? err : 'Unexpected error occurred',
    status: 500,
    details: null,
  }
}

const bodySchema = z
  .object({
    to: z.union([z.string(), z.array(z.string()).nonempty()]),
    subject: z.string().min(1, 'Subject is required'),
    html: z.string().optional(),
    text: z.string().optional(),
    template: z.literal('profitability-report').optional(),
    templateProps: z.record(z.string(), z.unknown()).optional(),
    from: z.string().optional(),
    replyTo: z.union([z.string(), z.array(z.string()).nonempty()]).optional(),
    cc: z.union([z.string(), z.array(z.string()).nonempty()]).optional(),
    bcc: z.union([z.string(), z.array(z.string()).nonempty()]).optional(),
  })
  .refine((val) => Boolean(val.html || val.text || val.template), {
    message: 'Provide html, text, or a supported template',
    path: ['html'],
  })

export async function POST(req: Request) {
  try {
    const apiKey = process.env.SENDGRID_API_KEY
    if (!apiKey) {
      return NextResponse.json({ error: 'Missing SENDGRID_API_KEY env var' }, { status: 500 })
    }

    sendgrid.setApiKey(apiKey)

    const json = await req.json().catch(() => ({}))
    const parsed = bodySchema.safeParse(json)

    if (!parsed.success) {
      return NextResponse.json(
        {
          error: 'Invalid request body',
          details: parsed.error.flatten(),
        },
        { status: 400 },
      )
    }

    const { to, subject, html, text, from, replyTo, cc, bcc, template, templateProps } = parsed.data

    const message = {
      from,
      to,
      replyTo,
      subject,
    } as MailDataRequired

    if (cc) {
      message.cc = cc as MailDataRequired['cc']
    }

    if (bcc) {
      message.bcc = bcc as MailDataRequired['bcc']
    }

    let htmlContent = html

    if (template === 'profitability-report') {
      const props = (templateProps ?? {}) as ProfitabilityReportEmailProps
      const emailComponent = ProfitabilityReportEmail(props)
      htmlContent = await render(emailComponent)
    }

    if (htmlContent) {
      message.html = htmlContent
    }

    const [response] = await sendgrid.send(message)

    const headers = response.headers ?? {}
    const messageId =
      (headers['x-message-id'] as string | undefined) ??
      (headers['X-Message-Id'] as string | undefined)

    return NextResponse.json({ status: 'sent', messageId: messageId ?? null })
  } catch (err: unknown) {
    const { message, status, details } = extractErrorInfo(err)

    console.error('Failed to send email via SendGrid:', { error: err })

    const body = details !== null ? { error: message, details } : { error: message }
    return NextResponse.json(body, { status })
  }
}

export async function GET() {
  return NextResponse.json(
    {
      ok: true,
      message:
        'Use POST with JSON { to, subject, html|text } or { to, subject, template: "profitability-report", templateProps: { ... } }',
    },
    { status: 200 },
  )
}
