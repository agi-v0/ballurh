import type { Metadata } from 'next/types'

import React from 'react'

import ProfitabilityCalculator from '@/components/ProfitCalculator'
import { getTranslations } from 'next-intl/server'

type Args = {
  params: Promise<{
    locale: string
  }>
}

export async function generateMetadata({ params }: Args) {
  const { locale } = await params
  const t = await getTranslations({ locale, namespace: 'profitCalculator' })

  return {
    title: t('meta.title'),
    description: t('meta.description'),
    keywords: ['profit', 'calculator', 'business', 'profitability', 'calculation'],
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
        en: '/en/profit-calculator',
        ar: '/ar/profit-calculator',
      },
    },
  }
}

export default async function Page({ params: paramsPromise }: Args) {
  //   if (!page) {
  //     page = null
  //   }

  // if (!page) {
  //   return <PayloadRedirects url={url} />
  // }

  return (
    <article className="overflow-x-clip bg-background">
      <div className="container flex min-h-screen w-full flex-col pt-header-plus-admin-bar pb-4">
        <ProfitabilityCalculator />
      </div>
    </article>
  )
}
