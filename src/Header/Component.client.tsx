'use client'
import React, { useEffect, useRef, useState } from 'react'
import type { Header as HeaderType } from '@/payload-types'
import { Link } from '@/i18n/navigation'
import { usePathname } from 'next/navigation'

import { cn } from '@/utilities/ui'
import Logo from '@/components/ui/logo'

// Assuming DesktopNav and MobileNav will be refactored similarly
import { DesktopNav } from './DesktopNav'
import { MobileNav, AnimatedToggle } from './MobileNav'
import { motion, useMotionValueEvent, useScroll } from 'motion/react'
import { AnimatePresence } from 'motion/react'
import { AdminBar } from '@/components/AdminBar'
import { PayloadAdminBarProps } from 'payload-admin-bar'

interface AdminBarProps {
  adminBarProps: PayloadAdminBarProps
  locale?: string
}

export const HeaderClient: React.FC<HeaderType & AdminBarProps> = ({
  cta,
  tabs,
  adminBarProps,
  locale,
}) => {
  const [isMobileNavOpen, setIsMobileNavOpen] = useState(false)
  const [hideBackground, setHideBackground] = useState(true)
  const lastScrollY = useRef(0)

  const pathname = usePathname()

  const { scrollY } = useScroll()
  const [scrollDirection, setScrollDirection] = useState('down')
  const [y, setY] = useState(0)

  useMotionValueEvent(scrollY, 'change', (current) => {
    const diff = current - (scrollY.getPrevious() ?? 0)
    setScrollDirection(diff > 0 ? 'down' : 'up')
    setY(current)
  })

  useEffect(() => {
    setIsMobileNavOpen(false)
  }, [pathname])

  useEffect(() => {
    if (isMobileNavOpen) {
      setHideBackground(false)
    } else {
      setHideBackground(y < 30)
    }
  }, [y, isMobileNavOpen])

  useEffect(() => {
    if (isMobileNavOpen) {
      lastScrollY.current = window.scrollY
      document.body.style.overflow = 'hidden'
      document.body.style.height = '100vh'
    } else {
      document.body.style.overflow = ''
      document.body.style.height = 'auto'
      window.scrollTo(0, lastScrollY.current)
    }
    return () => {
      document.body.style.overflow = ''
      document.body.style.height = 'auto'
    }
  }, [isMobileNavOpen])

  return (
    <header
      className={cn(
        'fixed top-0 left-0 z-10 w-full max-w-screen border-0 border-border bg-transparent transition-colors duration-300',
        '-md:top-[var(--admin-bar-height,0px)]',
        hideBackground && 'before:opacity-0 after:opacity-0',
        isMobileNavOpen && 'border-none bg-background',
        y > 20 && 'border-b bg-background/60 backdrop-blur-sm',
      )}
    >
      <AdminBar adminBarProps={adminBarProps} />
      {/* Main container with flex layout */}
      <div
        className={cn(
          'relative container flex h-(--header-height) flex-row items-center justify-between gap-6 transition-colors',
        )}
      >
        <div className="z-50">
          <Link
            href="/"
            className="flex-shrink-0 text-base-primary transition-colors hover:text-brand"
          >
            <Logo className="h-6 w-auto ltr:h-5" locale={locale} />
          </Link>
        </div>

        <DesktopNav
          cta={cta}
          tabs={tabs}
          locale={locale}
          className="hidden lg:relative lg:flex lg:w-full lg:items-center lg:justify-end"
        />

        <div className="flex flex-shrink-0 justify-end lg:hidden">
          <AnimatedToggle
            isOpen={isMobileNavOpen}
            onClick={() => setIsMobileNavOpen((prev) => !prev)}
            size={24}
          />
        </div>
      </div>

      {/* Conditionally rendered Mobile Nav Dropdown */}
      {/* Animate presence will be added later with framer-motion */}
      <AnimatePresence mode="wait">
        {isMobileNavOpen && (
          <motion.div
            key="mobile-nav-content"
            initial={{ opacity: 0, x: '100%', filter: 'blur(20px)' }}
            animate={{ opacity: 1, x: '0%', filter: 'blur(0px)' }}
            exit={{ opacity: 0, x: '-100%', filter: 'blur(20px)' }}
            transition={{
              ease: [0.25, 0.46, 0.45, 0.94],
            }}
            className={cn(
              'fixed inset-x-0 top-[var(--header-height)] bottom-0 z-50 overflow-y-auto bg-background px-(--gutter-h) pb-(--gutter-h) lg:hidden',
              // 'animate-in slide-in-from-top-4 duration-300 ease-out',
            )}
          >
            <MobileNav cta={cta} tabs={tabs} onLinkClick={() => setIsMobileNavOpen(false)} />
          </motion.div>
        )}
      </AnimatePresence>
    </header>
  )
}
