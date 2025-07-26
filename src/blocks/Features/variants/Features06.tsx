'use client'
import React from 'react'
import { Media } from '@/components/MediaResponsive'
import { FeaturesBlock } from '@/payload-types'
import { Icon } from '@iconify-icon/react'
import { BlockHeader } from '@/components/BlockHeader'
import { motion } from 'motion/react'
import { containerVariants, itemsFling } from '@/utilities/motion'

export const Features06: React.FC<FeaturesBlock> = ({ columns, blockImage, blockHeader }) => {
  if (!columns || columns.length === 0) return null
  return (
    <div className="py-xl w-full bg-background-neutral-subtle">
      <div className="container py-section-small">
        <motion.div
          variants={containerVariants}
          initial="hidden"
          whileInView="visible"
          viewport={{ once: true, amount: 0.3 }}
          className="rounded-space-sm gap-xs flex flex-col bg-background-neutral p-4"
        >
          <div className="gap-xs flex flex-col md:flex-row">
            <div className="gap-md mt-xs px-xs flex w-full flex-col lg:basis-1/2">
              {blockHeader && (
                <BlockHeader
                  {...blockHeader}
                  richTextClassName="auto-rows-auto"
                  className="h-full grid-cols-1 grid-rows-[auto_1fr_auto] px-0"
                  type="start"
                />
              )}
            </div>
            {blockImage && (
              <Media
                resource={blockImage}
                className="h-auto w-full overflow-hidden rounded-lg lg:basis-1/2"
                imgClassName="aspect-square h-auto w-full object-cover"
              />
            )}
          </div>
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
                  variants={itemsFling}
                >
                  {icon && (
                    <div className="p-xs inline rounded-full bg-background-neutral-subtle">
                      <Icon
                        className="size-sm text-base-secondary"
                        height="none"
                        icon={`material-symbols:${icon}`}
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
        </motion.div>
      </div>
    </div>
  )
}
