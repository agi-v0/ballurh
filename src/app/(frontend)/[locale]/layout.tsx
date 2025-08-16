import type { Metadata } from 'next'
import localFont from 'next/font/local'
import { hasLocale } from 'next-intl'
import { notFound } from 'next/navigation'
import { routing } from '@/i18n/routing'

import { cn } from '@/utilities/ui'
import { GeistMono } from 'geist/font/mono'
import { GeistSans } from 'geist/font/sans'
import React from 'react'

import { AdminBar } from '@/components/AdminBar'
import { Footer } from '@/Footer/Component'
import { Header } from '@/Header/Component'
import { Providers } from '@/providers'
import { InitTheme } from '@/providers/Theme/InitTheme'
import { mergeOpenGraph } from '@/utilities/mergeOpenGraph'
import { draftMode } from 'next/headers'

import { GoogleTagManager } from '@next/third-parties/google'

import './globals.css'
import { getServerSideURL } from '@/utilities/getURL'
import { setRequestLocale } from 'next-intl/server'

// export function generateStaticParams() {
//   return routing.locales.map((locale) => ({ locale }))
// }

const aktivGrotesk = localFont({
  src: '/fonts/AktivGroteskVF.woff2',
  weight: '100 900',
  display: 'swap',
  variable: '--font-aktive-grotesk',
})

export default async function RootLayout({
  children,
  params,
}: {
  children: React.ReactNode
  params: Promise<{ locale: string }>
}) {
  const { isEnabled } = await draftMode()
  // Ensure that the incoming `locale` is valid
  const { locale } = await params

  if (!hasLocale(routing.locales, locale)) {
    notFound()
  }
  // Enable static rendering
  setRequestLocale(locale)

  return (
    <html
      className={aktivGrotesk.className}
      lang={locale}
      dir={locale === 'ar' ? 'rtl' : 'ltr'}
      suppressHydrationWarning
    >
      <GoogleTagManager gtmId="GTM-M8ZHLQGR" />
      <head>
        {/* <InitTheme /> */}
        <link
          rel="icon"
          href="/favicon-dark.svg"
          type="image/svg+xml"
          sizes="16x16 32x32 64x64"
          media="(prefers-color-scheme: light)"
        />
        <link
          rel="icon"
          href="/favicon-light.svg"
          type="image/svg+xml"
          sizes="16x16 32x32 64x64"
          media="(prefers-color-scheme: dark)"
        />
        <link rel="apple-touch-icon" href="/apple-icon.png" type="image/png" sizes="180x180" />
      </head>
      <body>
        <Providers>
          {/* <AdminBar
            adminBarProps={{
              preview: isEnabled,
            }}
          /> */}

          <Header adminBarProps={{ preview: isEnabled }} />
          {children}
          <Footer />
        </Providers>
      </body>
    </html>
  )
}

export const metadata: Metadata = {
  metadataBase: new URL(getServerSideURL()),
  openGraph: mergeOpenGraph(),
  twitter: {
    card: 'summary_large_image',
    creator: '@payloadcms',
  },
}
