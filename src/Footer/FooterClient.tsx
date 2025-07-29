'use client'
import type { Footer } from '@/payload-types'

import { Button } from '@/components/ui/button'
import { Link } from '@/i18n/navigation'
import { ThemeSelector } from '@/providers/Theme/ThemeSelector'
// import { LanguageSwitcher } from '@/providers/LanguageSelector02/index'
import { CMSLink } from '@/components/Link'
import Logo from '@/components/ui/logo'

import Facebook from '@/icons/facebook'
import Instagram from '@/icons/instagram'
import X from '@/icons/x'
import TikTok from '@/icons/tiktok'
import LinkedIn from '@/icons/linkedin'
import Youtube from '@/icons/youtube'
import zatca from '@/components/Graphics/zatca.svg'
import sama from '@/components/Graphics/sama.svg'
import { useTranslations } from 'next-intl'
import { Input } from '@/components/ui/input'
import { MailIcon } from 'lucide-react'
import Image from 'next/image'

const socialLinks = [
  {
    label: 'Facebook',
    url: 'https://www.facebook.com/marnpos',
    icon: Facebook,
  },
  {
    label: 'Instagram',
    url: 'https://www.instagram.com/marnpos',
    icon: Instagram,
  },
  {
    label: 'X',
    url: 'https://www.x.com/marnpos',
    icon: X,
  },
  {
    label: 'TikTok',
    url: 'https://www.tiktok.com/@marnpos',
    icon: TikTok,
  },
  {
    label: 'LinkedIn',
    url: 'https://www.linkedin.com/company/marnpos',
    icon: LinkedIn,
  },
  {
    label: 'Youtube',
    url: 'https://www.youtube.com/channel/UC-9-kyTW8ZkZNDHQJ6FgpwQ',
    icon: Youtube,
  },
]

type Props = {
  columns: Footer['columns']
  currentYear: number
  locale: string
}

/* ─── knobs ──────────────────────────────────────────────────────────────── */
const MAX_PEEK = 300 // absolute cap in px
const TOUCH_GAIN = 1.2 // multiplier per px of finger travel
const WHEEL_GAIN = 45 // multiplier per wheel tick ≈ 1
const WHEEL_IDLE = 65 // ms gap that ends a wheel gesture
/* ────────────────────────────────────────────────────────────────────────── */

export function FooterClient({ columns, currentYear, locale }: Props) {
  /* live transform */

  const t = useTranslations('Footer')

  return (
    <div className="pt-md bg-background">
      <div className="container">
        <div className="relative">
          <footer className="py-md relative z-2 w-full rounded-3xl bg-background-neutral will-change-transform">
            <div className="container grid grid-cols-1 gap-4 max-lg:gap-y-8 lg:grid-cols-12">
              <div className="flex flex-wrap items-start gap-4 lg:col-span-4">
                <div id="newsletter" className="md:pe-md flex w-full flex-col gap-3">
                  <p className="text-sm font-medium text-base-tertiary">{t('newsletterTitle')}</p>
                  <p className="-mt-1 text-sm text-base-secondary">{t('newsletterDescription')}</p>
                  <div className="flex w-full max-w-96 items-center space-x-2">
                    <div className="relative w-full">
                      <Input
                        className="peer h-11 rounded-full ps-9 text-sm"
                        placeholder={t('newsletterPlaceholder')}
                        type="email"
                      />
                      <div className="pointer-events-none absolute inset-y-0 start-0 flex items-center justify-center ps-3 text-base-quaternary peer-focus:text-base-secondary peer-disabled:opacity-50">
                        <MailIcon size={16} aria-hidden="true" />
                      </div>
                    </div>
                    <Button variant="primary" size="lg" type="submit">
                      {t('newsletterButton')}
                    </Button>
                  </div>
                </div>
                <div id="social" className="flex w-full flex-col gap-2">
                  <p className="text-sm font-medium text-base-tertiary">{t('followUs')}</p>
                  <div className="flex w-full flex-row items-start justify-between gap-2 lg:justify-start">
                    {socialLinks.map(({ label, url, icon: Icon }, i) => (
                      <Button
                        key={i}
                        variant="tertiary"
                        color="neutral"
                        size="icon"
                        // className="bg-transparent hover:bg-transparent"
                        asChild
                      >
                        <Link href={url} className="group">
                          <Icon className="size-5 group-hover:text-base-primary" />
                        </Link>
                      </Button>
                    ))}
                  </div>
                </div>
                <div id="compliance" className="flex w-full flex-col gap-3">
                  <p className="text-sm font-medium text-base-tertiary">{t('compliance')}</p>
                  <div className="flex w-full flex-row items-center justify-start gap-8 lg:justify-start">
                    <Image
                      src={sama}
                      className="h-12 w-auto opacity-50 invert dark:invert-0"
                      alt="SAMA"
                      unoptimized
                    />
                    <Image
                      src={zatca}
                      className="h-12 w-auto opacity-50 invert dark:invert-0"
                      alt="ZATCA"
                      unoptimized
                    />
                  </div>
                </div>
                <div id="theme" className="flex flex-row items-center gap-4">
                  {/* <LanguageSwitcher locale={locale} /> */}
                  <ThemeSelector locale={locale} />
                </div>
              </div>
              <nav className="pb-site grid grid-cols-2 gap-4 md:col-span-2 md:grid-cols-3 lg:col-span-6 lg:col-start-7">
                {columns?.map(({ label, navItems }, i) => {
                  return (
                    <div key={i} className="grid grid-cols-1">
                      <p className="mb-1 text-sm font-medium text-base-tertiary">{label}</p>
                      {navItems?.map(({ link }, j) => {
                        return (
                          <CMSLink
                            key={j}
                            variant="inline"
                            className="h-auto justify-start rounded-none px-0 py-2 text-sm font-medium hover:text-base-primary hover:no-underline"
                            {...link}
                          />
                        )
                      })}
                    </div>
                  )
                })}
              </nav>
            </div>
          </footer>

          <div className="px-site pointer-events-none absolute bottom-0 z-0 container mx-auto w-full">
            <Link href="/" className="flex h-auto w-full justify-center">
              <Logo className="h-auto w-full text-base-primary/10" />
            </Link>
          </div>
        </div>

        <div className="col-span-full flex w-full flex-row items-start justify-between gap-1 py-4">
          <p className="text-xs text-base-tertiary md:text-sm">
            {t('allRightsReserved', { year: currentYear })}
          </p>
          <div className="flex gap-4">
            <Link
              href="/terms"
              className="text-xs text-base-tertiary hover:text-base-secondary md:text-sm"
            >
              {t('termsAndConditions')}
            </Link>
            <Link
              href="/privacy"
              className="text-xs text-base-tertiary hover:text-base-secondary md:text-sm [&_path]:shadow-border"
            >
              {t('privacyPolicy')}
            </Link>
          </div>
        </div>
      </div>
    </div>
  )
}
