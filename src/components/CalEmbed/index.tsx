'use client'
import { useEffect } from 'react'
import Cal from '@calcom/embed-react'
import { useSearchParams } from 'next/navigation'
import { useStateMachine } from 'little-state-machine'
import { ContactStore, updateContactInfo } from '../ProfitCalculator/store'
import '@/components/ProfitCalculator/store'

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
  const { actions, getState } = useStateMachine({ actions: { updateContactInfo } })
  const contactInfo = (getState() as ContactStore).contactInfo

  useEffect(() => {
    const onMessage = (e: MessageEvent) => {
      if (!e.origin.endsWith('cal.com')) return
      if (e.data?.originator !== 'CAL') return
      if (e.data?.namespace && e.data.namespace !== 'pcal') return

      const { type, data } = e.data as {
        type?: string
        data?: any
      }

      // Persist attendee details when a booking completes
      if (type === 'bookingSuccessful') {
        const responses = data?.booking?.responses || {}
        const name = responses?.name ?? data?.name ?? ''
        const email = responses?.email ?? data?.email ?? ''
        const phone = responses?.attendeePhoneNumber ?? data?.phone ?? ''
        const businessName = responses?.brand_name ?? data?.brand_name ?? ''

        actions.updateContactInfo({
          name: `${name.firstName} ${name.lastName}`,
          email,
          phone,
          businessName,
        })
      }
    }
    window.addEventListener('message', onMessage)
    return () => window.removeEventListener('message', onMessage)
  }, [actions])

  return (
    <Cal
      calLink={calLink}
      namespace="pcal"
      style={{
        width: '100%',
        height: '100%',
        overflow: 'scroll',
      }}
      config={{
        layout: 'month_view',
        theme: 'light',
        name: contactInfo.name || '',
        email: contactInfo.email || '',
        attendeePhoneNumber: contactInfo.phone
          ? contactInfo.phone.startsWith('+966')
            ? contactInfo.phone
            : '+966' + contactInfo.phone.slice(1)
          : '+966',
        brand_name: contactInfo.businessName || '',
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
