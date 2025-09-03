import { getTranslations } from 'next-intl/server'

import CalEmbed from '@/components/CalEmbed'
import { Icon } from '@iconify-icon/react/dist/iconify.mjs'
import { Suspense } from 'react'

type Args = {
  params: Promise<{
    locale: string
  }>
}

export const dynamic = 'force-static'

export async function generateMetadata({ params }: Args) {
  const { locale } = await params
  const t = await getTranslations({ locale, namespace: 'bookMeeting' })

  return {
    title: t('meta.title'),
    description: t('meta.description'),
    keywords: ['meeting', 'booking', 'appointment', 'schedule', 'consultation'],
    openGraph: {
      title: t('meta.title'),
      description: t('meta.description'),
      type: 'website',
      locale: locale,
    },
    twitter: {
      card: 'summary',
      title: t('meta.title'),
      description: t('meta.description'),
    },
    robots: {
      index: true,
      follow: true,
    },
    alternates: {
      languages: {
        en: '/en/meeting',
        ar: '/ar/meeting',
      },
    },
  }
}

export default async function MeetingPage({ params }: Args) {
  const { locale } = await params
  const t = await getTranslations({ locale, namespace: 'bookMeeting' })
  const calLink = process.env.NEXT_PUBLIC_CAL_LINK || 'default/username'

  return (
    <div className="container mx-auto mt-header-plus-admin-bar space-y-space-7">
      <h1 className="text-center text-h2 font-semibold">{t('title')}</h1>
      <Suspense>
        <CalEmbed calLink={calLink} locale={locale} />
      </Suspense>
      <div className="rounded-3xl bg-background-neutral p-6">
        <h2 className="mb-4 text-lg font-semibold">{t('instructions.title')}</h2>
        <div className="space-y-3 text-base-secondary">
          <p className="flex items-start">
            <span className="me-3 flex h-6 w-6 flex-shrink-0 items-center justify-center rounded-full bg-blr-light-green-2 text-sm font-medium text-teal-800 dark:bg-teal-900 dark:text-teal-200">
              1
            </span>
            {t('instructions.step1')}
          </p>

          <p className="flex items-start">
            <span className="me-3 flex h-6 w-6 flex-shrink-0 items-center justify-center rounded-full bg-blr-light-green-2 text-sm font-medium text-teal-800 dark:bg-teal-900 dark:text-teal-200">
              2
            </span>
            {t('instructions.step3')}
          </p>
          <p className="flex items-start">
            <span className="me-3 flex h-6 w-6 flex-shrink-0 items-center justify-center rounded-full bg-blr-light-green-2 text-sm font-medium text-teal-800 dark:bg-teal-900 dark:text-teal-200">
              3
            </span>
            {t('instructions.step4')}
          </p>
        </div>
        <div className="mt-4 flex flex-row items-center gap-2 rounded-md bg-background p-3">
          <Icon icon="ri:information-line" className="size-4 text-base-secondary" height="none" />
          <p className="text-sm text-base-secondary">
            <span className="font-semibold">{t('instructions.note.title')}</span>{' '}
            {t('instructions.note.text')}
          </p>
        </div>
      </div>
    </div>
  )
}
