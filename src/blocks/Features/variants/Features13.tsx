'use client'
import React from 'react'
import { FeaturesBlock } from '@/payload-types'
import { motion } from 'motion/react'
import { containerVariants, itemsFling } from '@/utilities/motion'

import { cn } from '@/utilities/ui'

import { Card, CardContent } from '@/components/ui/card'
import { Icon } from '@iconify-icon/react'

export const Features13: React.FC<FeaturesBlock> = ({ columns }) => {
  if (!columns || columns.length === 0) return null

  return (
    <motion.div
      className="py-xl gap-xs container grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3"
      variants={containerVariants}
      initial="hidden"
      whileInView="visible"
      viewport={{ once: true, amount: 0.3 }}
    >
      {columns.map((column, index) => {
        const iconName = column.icon as string
        return (
          <motion.div key={index} variants={itemsFling}>
            <Card className="rounded-space-sm p-md bg-card h-full w-full flex-grow border-0">
              <CardContent className={cn('gap-md flex flex-col justify-start p-0')}>
                {column.icon && (
                  <Icon
                    className="text-base-secondary size-md"
                    icon={`material-symbols:${iconName}`}
                    height="none"
                    color="currentColor"
                  />
                )}
                {column.content?.title && (
                  <div className="flex flex-col gap-2">
                    <h3 className="text-body-lg text-base-primary font-medium">
                      {column.content?.title}
                    </h3>
                    <p className="text-body-md text-base-tertiary">{column.content?.subtitle}</p>
                  </div>
                )}
              </CardContent>
            </Card>
          </motion.div>
        )
      })}
    </motion.div>
  )
}
