'use client'

import React, { useMemo } from 'react'
import Link from 'next/link'

import { usePathname } from '@/i18n/navigation'

import { cn } from '@/utilities/ui'
import { buttonVariants } from '@/components/ui/button'

interface LanguageToggleButtonProps {
  locale?: string
  className?: string
}

export const LanguageToggleButton: React.FC<LanguageToggleButtonProps> = ({
  locale,
  className,
}) => {
  const pathname = usePathname()

  const nextLocale = useMemo(() => {
    if (!locale) return undefined
    return locale === 'ar' ? 'en' : 'ar'
  }, [locale])

  const targetPath = useMemo(() => {
    if (!pathname || !locale || !nextLocale) return undefined

    const segments = pathname.split('/')

    if (segments[1] === locale) {
      segments[1] = nextLocale
    } else {
      segments.splice(1, 0, nextLocale)
    }

    const joined = segments.join('/')

    if (joined.length > 1 && joined.endsWith('/')) {
      return joined.slice(0, -1)
    }

    return joined
  }, [locale, nextLocale, pathname])

  if (!locale || !nextLocale || !targetPath) return null

  return (
    <Link
      href={targetPath}
      className={cn(
        buttonVariants({ size: 'default', variant: 'ghost', color: 'neutral' }),
        'rounded-xl border-none bg-transparent text-sm text-base-secondary hover:bg-neutral/10 focus-visible:ring-0 focus-visible:ring-offset-0',
        className,
      )}
    >
      {locale === 'ar' ? 'EN' : 'العربية'}
    </Link>
  )
}
