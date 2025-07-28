'use client'

import React from 'react'
import { Media } from '@/components/MediaResponsive'
import { FeaturesBlock } from '@/payload-types'
import { Icon } from '@iconify-icon/react'
import { BlockHeader } from '@/components/BlockHeader'
import { motion } from 'motion/react'
import { containerVariants, itemsFling } from '@/utilities/motion'

export const Features07: React.FC<FeaturesBlock> = ({ columns, blockImage, blockHeader }) => {
  if (!columns || columns.length === 0) return null

  return (
    <div className="gap-md container flex flex-col rounded-3xl py-section-small">
      <div className="gap-md flex flex-col">
        {blockHeader && <BlockHeader {...blockHeader} className="px-0" />}
        <motion.div
          variants={containerVariants}
          initial="hidden"
          whileInView="visible"
          viewport={{ once: true, amount: 0.3 }}
        >
          {blockImage && (
            <Media
              resource={blockImage}
              className="h-auto w-full overflow-hidden rounded-3xl lg:basis-1/2"
              imgClassName="aspect-video h-auto w-full object-cover"
            />
          )}
        </motion.div>
      </div>
      <hr className="border-border" />
      <motion.div
        className="gap-xs grid grid-cols-2 md:grid-cols-2 lg:grid-cols-4"
        style={{ '--columns': `repeat(${columns.length}, minmax(0, 1fr))` } as React.CSSProperties}
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
              className="gap-sm p-sm flex flex-col items-start rounded-3xl bg-background-neutral"
              variants={itemsFling}
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
                  <h3 className="text-body-md font-medium text-base-primary">{content.title}</h3>
                )}
                {content?.subtitle && (
                  <p className="text-body-sm text-base-secondary">{content.subtitle}</p>
                )}
              </div>
            </motion.div>
          )
        })}
      </motion.div>
    </div>
  )
}
