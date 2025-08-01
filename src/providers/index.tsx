import React from 'react'

import { HeaderThemeProvider } from './HeaderTheme'
import { ThemeProvider } from './Theme'
import { NextIntlClientProvider } from 'next-intl'
import { ClientProviders } from './client-providers'

export const Providers: React.FC<{
  children: React.ReactNode
}> = ({ children }) => {
  return (
    <NextIntlClientProvider>
      {/* <Direction.Provider dir="rtl"> */}
      {/* <ThemeProvider> */}
      {/* <HeaderThemeProvider> */}
      <ClientProviders>{children}</ClientProviders>
      {/* </HeaderThemeProvider> */}
      {/* </ThemeProvider> */}
    </NextIntlClientProvider>
  )
}
