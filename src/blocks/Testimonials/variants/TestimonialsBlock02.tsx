'use client'
import React from 'react'
import { motion } from 'motion/react'

import { Customer } from '@/payload-types'
import RichText from '@/components/RichText'
import { Media } from '@/components/MediaResponsive'
import { cn } from '@/utilities/ui'
// import { LinkBlock } from '@/components/LinkBlock'
import { containerVariants, itemsFling } from '@/utilities/motion'
import { Stat } from '../stat'

interface Props {
  testimonials: Customer[]
  linkLabel: string
  bgColor: BgColor
}

const bgColors = {
  lightTeal: 'bg-teal-100',
  violet: 'bg-violet-100',
  gray: 'bg-background-neutral-subtle',
  inverted: 'bg-teal-950',
} as const

type BgColor = keyof typeof bgColors

export const TestimonialsBlock02: React.FC<Props> = ({ testimonials, bgColor, linkLabel }) => {
  const testimonial = testimonials?.[0]
  if (!testimonial) {
    return null
  }

  // Extract data from the Customer structure
  const { testimonial: testimonialData, slug, enableCaseStudy } = testimonial
  const { quote, featuredImage, stats, company, authorInfo } = testimonialData

  const { companyLogo } = company

  return (
    <section
      data-theme={bgColor !== 'inverted' ? 'light' : 'dark'}
      className={`${bgColors[bgColor]} py-section-small`}
    >
      <motion.div
        initial="hidden"
        whileInView="visible"
        viewport={{ once: true, amount: 0.3 }}
        variants={containerVariants}
        className="container overflow-hidden px-space-7"
      >
        <motion.div
          variants={itemsFling} // Animate the main card as one item
          className=""
        >
          <div className="flex flex-col justify-start gap-4">
            <div className="gap-md flex grow flex-col justify-start">
              {companyLogo && (
                <Media resource={companyLogo} imgClassName="h-8 w-auto opacity-50 dark:invert" />
              )}
              {quote && (
                <RichText
                  data={quote}
                  enableProse={false}
                  enableGutter={false}
                  className="mx-0 text-(length:--text-h3) font-semibold text-base-primary"
                />
              )}
            </div>
            {authorInfo && (
              <div className="flex flex-row items-center gap-4">
                {authorInfo.avatar && (
                  <Media
                    resource={authorInfo.avatar}
                    fill
                    className="relative size-12 overflow-hidden rounded-full"
                    imgClassName="object-cover"
                  />
                )}
                <div>
                  <p className="text-body-sm font-medium text-base-primary">{authorInfo.name}</p>
                  <p className="text-body-sm text-base-secondary">{authorInfo.title}</p>
                </div>
              </div>
            )}
          </div>
        </motion.div>
        {stats && stats.length > 0 && (
          <div className="mt-space-7 grid grid-cols-2 gap-4 lg:grid-cols-4">
            {stats.map((stat, index) => (
              <motion.div key={stat.id || index} variants={itemsFling}>
                {<Stat stat={stat} index={index} className="bg-transparent" />}
              </motion.div>
            ))}

            {/* <motion.div
              variants={itemsFling}
              className={cn('h-full w-full overflow-hidden', {
                'col-span-2': stats.length < 3,
              })}
            >
              <LinkBlock
                link={{
                  type: 'custom',
                  newTab: null,
                  url: enableCaseStudy ? `/customers/${slug}` : '/customers',
                  label: linkLabel,
                  color: 'neutral',
                  variant: 'primary',
                }}
                label={linkLabel}
                className="h-full w-full"
              />
            </motion.div> */}
          </div>
        )}
      </motion.div>
    </section>
  )
}
