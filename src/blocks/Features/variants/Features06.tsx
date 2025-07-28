'use client'
import React, { useRef } from 'react'
import { Media } from '@/components/MediaResponsive'
import { FeaturesBlock } from '@/payload-types'
import { Icon } from '@iconify-icon/react'
import { BlockHeader } from '@/components/BlockHeader'
import { motion, useInView, Variants } from 'motion/react'

const containerVariants: Variants = {
  hidden: {
    opacity: 0,
    scale: 0.95,
  },
  visible: {
    opacity: 1,
    scale: 1,
    transition: {
      staggerChildren: 0.2,
      ease: [0.175, 0.885, 0.32, 1.275],
    },
  },
}
const statContainerVariants: Variants = {
  hidden: {
    opacity: 0,
    scale: 0,
  },
  visible: {
    opacity: 1,
    scale: 1,
    transition: {
      staggerChildren: 0.2,
      ease: [0.175, 0.885, 0.32, 1.275],
    },
  },
}

const itemVariants: Variants = {
  hidden: { opacity: 0, y: 50 },
  visible: {
    opacity: 1,
    y: 0,
    transition: {
      ease: [0.175, 0.885, 0.32, 1.275],
    },
  },
}

export const Features06: React.FC<FeaturesBlock> = ({ columns, blockImage, stat, blockHeader }) => {
  // if (!columns || columns.length === 0) return null
  const statRef = useRef<HTMLParagraphElement>(null)
  const statInView = useInView(statRef, { once: true, amount: 0.4 })

  return (
    <div className="container py-section-small">
      <motion.div
        variants={containerVariants}
        initial="hidden"
        whileInView="visible"
        viewport={{ once: true, amount: 0.3 }}
        className="relative flex flex-col overflow-hidden rounded-3xl border bg-violet-100 shadow-xs"
      >
        <div className="gap-md mt-xs flex w-full flex-col px-space-7 pt-space-8">
          {blockHeader && (
            <BlockHeader
              {...blockHeader}
              // richTextClassName="auto-rows-auto"
              className="max-w-lg px-0 pt-0!"
              type="center"
            />
          )}
        </div>
        {columns && columns.length > 0 && (
          <motion.div
            className="gap-xs p-xs grid grid-cols-2 md:grid-cols-(--columns)"
            style={
              { '--columns': `repeat(${columns.length}, minmax(0, 1fr))` } as React.CSSProperties
            }
            variants={containerVariants}
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true, amount: 0.3 }}
          >
            {columns.map((column, index) => {
              const { content, icon } = column
              return (
                <motion.div
                  key={index}
                  className="gap-sm flex flex-col items-start"
                  variants={itemVariants}
                >
                  {icon && (
                    <div className="p-xs inline rounded-full bg-background-neutral-subtle">
                      <Icon
                        className="size-sm text-base-secondary"
                        height="none"
                        icon={`ri:${icon}`}
                        color="currentColor"
                      />
                    </div>
                  )}
                  <div className="flex flex-col gap-2">
                    {content?.title && (
                      <h3 className="text-body-md font-medium text-base-primary">
                        {content.title}
                      </h3>
                    )}
                    {content?.subtitle && (
                      <p className="text-body-sm text-base-secondary">{content.subtitle}</p>
                    )}
                  </div>
                </motion.div>
              )
            })}
          </motion.div>
        )}
        <div ref={statRef} className="relative flex flex-col-reverse items-center">
          {stat && (
            <motion.p
              variants={statContainerVariants}
              initial="hidden"
              animate={statInView ? 'visible' : 'hidden'}
              style={{
                transformOrigin: 'bottom',
              }}
              className="mx-4 mb-4 flex items-center justify-center gap-4 rounded-full bg-teal-950 px-6 py-4 md:absolute md:start-space-7 md:top-0 md:m-0 md:aspect-square md:size-48 md:flex-col md:gap-0 md:px-4 md:text-center lg:size-64 xl:start-32"
            >
              <motion.span
                variants={itemVariants}
                className="text-h3 font-semibold whitespace-nowrap text-inverted-primary"
              >
                {stat.value}
              </motion.span>
              <motion.span
                variants={itemVariants}
                className="text-main text-pretty text-inverted-tertiary md:text-sm lg:text-main"
              >
                {stat.label}
              </motion.span>
            </motion.p>
          )}
          {blockImage && (
            <Media
              resource={blockImage}
              className="h-auto w-full"
              imgClassName="h-auto w-full object-cover"
            />
          )}
        </div>
      </motion.div>
    </div>
  )
}
