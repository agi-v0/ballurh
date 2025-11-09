'use client'
import { DirectionProvider } from '@radix-ui/react-direction'
import { Locale } from 'next-intl'

export const ClientProviders: React.FC<{
  children: React.ReactNode
  locale: Locale
}> = ({ children, locale }) => {
  return <DirectionProvider dir={locale === 'ar' ? 'rtl' : 'ltr'}>{children}</DirectionProvider>
}
