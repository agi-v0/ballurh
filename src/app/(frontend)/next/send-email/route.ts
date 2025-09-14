import { NextResponse } from 'next/server'
import { Resend } from 'resend'
import { z } from 'zod'
import ProfitabilityReportEmail, {
  type ProfitabilityReportEmailProps,
} from '@/components/ProfitCalculator/profitabilityReportEmail'

export const runtime = 'nodejs'

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
    const apiKey = process.env.RESEND_API_KEY
    if (!apiKey) {
      return NextResponse.json({ error: 'Missing RESEND_API_KEY env var' }, { status: 500 })
    }

    const resend = new Resend(apiKey)
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

    const payload: any = {
      from,
      to,
      subject,
      replyTo: replyTo as any,
      cc: cc as any,
      bcc: bcc as any,
    }

    if (template === 'profitability-report') {
      const props = (templateProps ?? {}) as ProfitabilityReportEmailProps
      payload.react = ProfitabilityReportEmail(props)
    } else {
      payload.html = html
      payload.text = text
    }

    const { data, error } = await resend.emails.send(payload)

    if (error) {
      return NextResponse.json({ error: error.message || 'Failed to send email' }, { status: 502 })
    }

    return NextResponse.json({ id: data?.id, status: 'sent' })
  } catch (err: unknown) {
    const message = err instanceof Error ? err.message : 'Unexpected error'
    console.log('message: ', message)
    return NextResponse.json({ error: message }, { status: 500 })
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
