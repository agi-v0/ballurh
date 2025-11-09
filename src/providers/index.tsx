import React from 'react'

// import { HeaderThemeProvider } from './HeaderTheme'
// import { ThemeProvider } from './Theme'
import { NextIntlClientProvider, useLocale } from 'next-intl'
import { ClientProviders } from './client-providers'

export const Providers: React.FC<{
  children: React.ReactNode
}> = ({ children }) => {
  const locale = useLocale()
  return (
    <NextIntlClientProvider>
      {/* <Direction.Provider dir="rtl"> */}
      {/* <ThemeProvider> */}
      {/* <HeaderThemeProvider> */}
      <ClientProviders locale={locale}>{children}</ClientProviders>
      {/* </HeaderThemeProvider> */}
      {/* </ThemeProvider> */}
    </NextIntlClientProvider>
  )
}
