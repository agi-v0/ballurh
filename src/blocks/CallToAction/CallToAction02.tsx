'use client'
import React from 'react'
import { motion, Variants } from 'motion/react'
import { itemsFling } from '@/utilities/motion'
import { cn } from '@/utilities/ui'

import type { CallToActionBlock } from '@/payload-types'
import type { CMSLinkType } from '@/components/Link'

import RichText from '@/components/RichText'
import { CMSLink } from '@/components/Link'
import { Icon } from '@iconify-icon/react'

type CallToActionProps = CallToActionBlock & {
  className?: string
}

const containerVariants: Variants = {
  hidden: { opacity: 0, y: 20, scale: 0.95 }, // opacity could be 0
  visible: {
    opacity: 1,
    y: 0,
    scale: 1,
    transition: {
      staggerChildren: 0.1,
      type: 'spring',
      stiffness: 800,
      damping: 100,
      mass: 4,
    },
  },
}

export const CallToAction02: React.FC<CallToActionProps> = ({
  links,
  richText,
  list,
  className,
}) => {
  return (
    <div
      data-theme="dark"
      className={cn('relative container overflow-hidden py-space-7', className)}
    >
      <motion.div
        className="relative flex flex-col items-center gap-space-7 overflow-hidden rounded-3xl bg-teal-950 px-space-7 py-space-7 shadow-xs"
        variants={containerVariants}
        initial="hidden"
        whileInView="visible"
        viewport={{ once: true, amount: 0.3 }}
      >
        <motion.div className="z-1 flex flex-col items-center gap-6">
          {richText && (
            <motion.div variants={itemsFling}>
              <RichText
                className="mb-0 max-w-4xl text-center"
                data={richText}
                enableGutter={false}
              />
            </motion.div>
          )}
          <motion.div variants={itemsFling} className="flex flex-col gap-8">
            {(links || []).map(({ link }, i) => {
              return (
                <CMSLink
                  key={i}
                  size="lg"
                  {...(link as CMSLinkType)}
                  className="bg-orange-500 text-inverted-primary outline-offset-2 hover:bg-white hover:text-inverted-primary hover:outline-2 hover:outline-white/20"
                />
              )
            })}
          </motion.div>
        </motion.div>

        {list && (
          <motion.div
            className="z-1 flex w-full flex-col items-center gap-4 md:flex-row md:justify-center"
            style={
              { '--columns': `repeat(${list?.length}, minmax(0, 1fr))` } as React.CSSProperties
            }
          >
            {list.map((column, index) => {
              const { title, icon } = column
              return (
                <motion.div
                  key={index}
                  variants={itemsFling}
                  className="flex flex-row items-center gap-2"
                >
                  {icon && (
                    <Icon
                      className="size-4 text-base-tertiary"
                      height="none"
                      icon={`ri:${icon}`}
                      color="currentColor"
                    />
                  )}
                  {title && <h3 className="text-small text-base-tertiary">{title}</h3>}
                </motion.div>
              )
            })}
          </motion.div>
        )}
      </motion.div>
    </div>
  )
}
