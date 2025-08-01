'use client'
import React from 'react'
import { FeaturesBlock } from '@/payload-types'
import { motion } from 'motion/react'
import { containerVariants, itemsFling } from '@/utilities/motion'

import { cn } from '@/utilities/ui'

import { Card, CardContent, CardTitle } from '@/components/ui/card'
import { Icon } from '@iconify-icon/react'

export const Features03: React.FC<FeaturesBlock> = ({ columns }) => {
  if (!columns || columns.length === 0) return null

  return (
    <motion.div
      className="container grid grid-cols-1 gap-2 py-space-7 sm:grid-cols-2 md:grid-cols-3"
      variants={containerVariants}
      initial="hidden"
      whileInView="visible"
      viewport={{ once: true, amount: 0.3 }}
    >
      {columns.map((column, index) => {
        const iconName = column.icon as string
        return (
          <motion.div key={index} variants={itemsFling}>
            <Card className="h-full w-full grow rounded-3xl border-0 bg-card p-6 shadow-none">
              {column.content?.title && (
                <CardTitle className="mb-2 flex flex-row items-center gap-2">
                  {column.icon && (
                    <Icon
                      className="size-5 text-base-secondary"
                      icon={`ri:${iconName}`}
                      height="none"
                      color="currentColor"
                    />
                  )}
                  <h3 className="text-main font-semibold text-base-primary">
                    {column.content.title}
                  </h3>
                </CardTitle>
              )}
              {column.content?.subtitle && (
                <CardContent className="flex flex-col justify-start gap-4 p-0 ps-[calc(0.5rem+1.25rem)]">
                  <p className="text-main text-base-tertiary">{column.content?.subtitle}</p>
                </CardContent>
              )}
            </Card>
          </motion.div>
        )
      })}
    </motion.div>
  )
}
