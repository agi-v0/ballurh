import { HeaderClient } from './Component.client'
import { getCachedGlobal } from '@/utilities/getGlobals'
import React from 'react'

import type { Header } from '@/payload-types'
import { PayloadAdminBarProps } from 'payload-admin-bar'

import { getLocale } from 'next-intl/server'

export async function Header({ adminBarProps }: { adminBarProps: PayloadAdminBarProps }) {
  const locale = await getLocale()
  const headerData = await getCachedGlobal('header', 2, locale)()
  return <HeaderClient {...headerData} adminBarProps={adminBarProps} locale={locale} />
}
