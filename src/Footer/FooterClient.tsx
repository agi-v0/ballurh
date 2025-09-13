import type { Footer } from '@/payload-types'
import { Button } from '@/components/ui/button'
import { Link } from '@/i18n/navigation'

import { CMSLink } from '@/components/Link'
import Logo from '@/components/ui/logo'

import Instagram from '@/icons/instagram'
import X from '@/icons/x'
import LinkedIn from '@/icons/linkedin'
import { useTranslations } from 'next-intl'
import { Input, InputWrapper } from '@/components/ui/input'
import { MailIcon } from 'lucide-react'
import TikTok from '@/icons/tiktok'

const socialLinks = [
  // {
  //   label: 'Facebook',
  //   url: 'https://www.facebook.com/marnpos',
  //   icon: Facebook,
  // },
  {
    label: 'Instagram',
    url: 'https://www.instagram.com/ballurhapp',
    icon: Instagram,
  },
  {
    label: 'X',
    url: 'https://x.com/ballurhapp',
    icon: X,
  },
  {
    label: 'TikTok',
    url: 'https://www.tiktok.com/@ballurhapp',
    icon: TikTok,
  },
  {
    label: 'LinkedIn',
    url: 'https://www.linkedin.com/company/ballurhapp',
    icon: LinkedIn,
  },
  // {
  //   label: 'Youtube',
  //   url: 'https://www.youtube.com/channel/UC-9-kyTW8ZkZNDHQJ6FgpwQ',
  //   icon: Youtube,
  // },
]

type Props = {
  columns: Footer['columns']
  currentYear: number
  locale: string
}

export function FooterClient({ columns, currentYear, locale }: Props) {
  /* live transform */

  const t = useTranslations('Footer')

  return (
    <div className="bg-background pt-space-7">
      <div className="container">
        <footer className="relative z-2 w-full py-space-4">
          <div className="flex flex-col">
            <div
              id="newsletter"
              className="col-span-full flex w-full flex-col items-start gap-4 py-space-5 md:flex-row md:justify-between"
            >
              <div className="flex flex-col gap-2">
                <p className="text-main font-semibold text-base-primary">{t('newsletterTitle')}</p>
                <p className="text-small text-base-secondary">{t('newsletterDescription')}</p>
              </div>
              <div className="flex w-full max-w-96 items-center gap-2">
                <InputWrapper>
                  <MailIcon size={16} aria-hidden="true" />
                  <Input
                    placeholder={t('newsletterPlaceholder')}
                    className="text-base placeholder:text-sm"
                    type="email"
                    autoComplete="email"
                  />
                </InputWrapper>
                <Button variant="primary" type="submit" className="text-base">
                  {t('newsletterButton')}
                </Button>
              </div>
            </div>
            {/* <div id="theme" className="flex flex-row items-center gap-4">
                <LanguageSwitcher locale={locale} />
                <ThemeSelector locale={locale} />
              </div> */}

            <div className="flex flex-row items-center justify-between gap-4 py-space-5">
              <div id="social" className="flex w-full flex-row items-center gap-2">
                <p className="text-sm font-medium whitespace-nowrap text-base-tertiary">
                  {t('followUs')}
                </p>
                <div className="flex w-full flex-row items-start justify-between lg:justify-start">
                  {socialLinks.map(({ label, url, icon: Icon }, i) => (
                    <Button
                      key={i}
                      variant="ghost"
                      color="neutral"
                      size="icon"
                      className="hover:bg-transparent"
                      asChild
                    >
                      <Link
                        href={url}
                        className="text-base-tertiary hover:text-base-primary"
                        aria-label={label}
                      >
                        <Icon className="size-5" />
                      </Link>
                    </Button>
                  ))}
                </div>
              </div>
              <nav className="">
                {columns?.map(({ label, navItems }, i) => {
                  return (
                    <div key={i} className="flex flex-row gap-4">
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
          </div>
        </footer>

        <div className="col-span-full grid w-full grid-cols-1 items-center gap-4 py-space-7 md:grid-cols-3">
          <p className="order-2 text-xs text-base-tertiary md:order-1 md:justify-self-start md:text-sm">
            {t('allRightsReserved', { year: currentYear })}
          </p>
          <Link
            href="/"
            className="order-1 text-base-tertiary transition-colors hover:text-brand md:order-2 md:justify-self-center"
            aria-label={locale === 'ar' ? 'الصفحة الرئيسية لبلورة' : 'Ballurh home'}
          >
            <Logo className="h-6 w-auto" locale={locale} />
          </Link>

          <div className="order-3 flex gap-4 md:justify-self-end">
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
