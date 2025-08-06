'use client'
import Cal from '@calcom/embed-react'

interface CalEmbedProps {
  calLink: string
  locale: string
}

const CalEmbed: React.FC<CalEmbedProps> = ({ calLink, locale }) => {
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
        locale,
      }}
    />
  )
}

export default CalEmbed
