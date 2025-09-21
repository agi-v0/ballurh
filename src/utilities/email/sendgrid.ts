import sendgrid, { type MailDataRequired } from '@sendgrid/mail'
import { render } from '@react-email/render'
import ProfitabilityReportEmail, {
  type ProfitabilityReportEmailProps,
} from 'react-email/emails/profitability-report'

export type SendEmailInput = {
  to: string | string[]
  subject: string
  html?: string
  text?: string
  template?: 'profitability-report'
  templateProps?: ProfitabilityReportEmailProps
  from?: string
  replyTo?: string | string[]
  cc?: string | string[]
  bcc?: string | string[]
}

export type SendEmailResult = {
  messageId: string | null
}

export async function sendEmail({
  to,
  subject,
  html,
  text,
  template,
  templateProps,
  from,
  replyTo,
  cc,
  bcc,
}: SendEmailInput): Promise<SendEmailResult> {
  const apiKey = process.env.SENDGRID_API_KEY
  if (!apiKey) {
    throw new Error('Missing SENDGRID_API_KEY env var')
  }

  sendgrid.setApiKey(apiKey)

  const sender = from ?? process.env.SENDGRID_EMAIL
  if (!sender) {
    throw new Error('Missing sender email. Provide `from` or configure SENDGRID_EMAIL')
  }

  let htmlContent = html

  if (template === 'profitability-report') {
    const props = (templateProps ?? {}) as ProfitabilityReportEmailProps
    const emailComponent = ProfitabilityReportEmail(props)
    htmlContent = await render(emailComponent)
  }

  const message = {
    from: sender,
    to,
    subject,
  } as MailDataRequired

  if (replyTo) {
    message.replyTo = replyTo as MailDataRequired['replyTo']
  }

  if (cc) {
    message.cc = cc as MailDataRequired['cc']
  }

  if (bcc) {
    message.bcc = bcc as MailDataRequired['bcc']
  }

  if (htmlContent) {
    message.html = htmlContent
  } else if (text) {
    message.text = text
  } else {
    throw new Error('Provide `html`, `text`, or a supported template')
  }

  const [response] = await sendgrid.send(message)
  const headers = response.headers ?? {}

  const messageId =
    (headers['x-message-id'] as string | undefined) ??
    (headers['X-Message-Id'] as string | undefined) ??
    null

  return { messageId }
}
