'use client'
import Cal from '@calcom/embed-react'
import { useSearchParams } from 'next/navigation'

interface CalEmbedProps {
  calLink: string
  locale: string
}

const CalEmbed: React.FC<CalEmbedProps> = ({ calLink, locale }) => {
  const urlParams = useSearchParams()
  const utm_id = urlParams.get('utm_id')
  const utm_source = urlParams.get('utm_source')
  const utm_medium = urlParams.get('utm_medium')
  const utm_campaign = urlParams.get('utm_campaign')
  const utm_content = urlParams.get('utm_content')
  const utm_term = urlParams.get('utm_term')

  return (
    <Cal
      calLink={calLink}
      style={{
        width: '100%',
        height: '100%',
        overflow: 'scroll',
      }}
      config={{
        layout: 'month_view',
        theme: 'light',
        utm_id: utm_id || '',
        utm_source: utm_source || '',
        utm_medium: utm_medium || '',
        utm_campaign: utm_campaign || '',
        utm_content: utm_content || '',
        utm_term: utm_term || '',
        locale,
      }}
    />
  )
}

export default CalEmbed
