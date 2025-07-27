'use client'
import React from 'react'
import { FeaturesBlock } from '@/payload-types'
import { Media } from '@/components/MediaResponsive'
import { cn } from '@/utilities/ui'
// import { AppReference } from '@/components/AppReference'
import RichText from '@/components/RichText'
import { motion, stagger, Variants } from 'motion/react'
import { Badge } from '@/components/ui/badge'

export const Features01: React.FC<FeaturesBlock> = ({ columns }) => {
  if (!columns?.length) return null

  const rows: FeaturesBlock['columns'][] = []

  let i = 0
  while (i < columns.length) {
    if (columns[i]?.size === 'full') {
      // If column is full-width, add it as a single-item row
      rows.push([columns[i]])
      i += 1
    } else {
      // Otherwise add up to two columns per row
      const row = columns.slice(i, i + 2)
      rows.push(row)
      i += 2
    }
  }
  const containerVariants: Variants = {
    hidden: {
      opacity: 1,
      transition: {
        staggerChildren: 0.1,
        type: 'spring',
        stiffness: 900,
        damping: 80,
        mass: 10,
      },
    },
    visible: {
      opacity: 1,
      transition: {
        staggerChildren: 0.1,
        type: 'spring',
        stiffness: 900,
        damping: 80,
        mass: 10,
      },
    },
  }

  const itemVariants: Variants = {
    hidden: { opacity: 0, y: 50, x: 0 },
    visible: {
      opacity: 1,
      y: 0,
      x: 0,
      transition: {
        type: 'spring',
        stiffness: 800,
        damping: 100,
        mass: 4,
      },
    },
  }

  return (
    <motion.div
      variants={containerVariants}
      initial="hidden"
      whileInView="visible"
      viewport={{ once: true, amount: 0.2 }}
      transition={{
        delayChildren: stagger(0.2),
      }}
      className="container grid grid-cols-1 gap-4 bg-background py-section-small"
    >
      {rows.map((row, index) => (
        <motion.div
          key={index}
          className={cn('grid w-full grid-cols-1 gap-4', {
            'md:grid-cols-2': row?.length === 2,
          })}
        >
          {row?.map((column, index) => {
            const { badge, richTextContent, image, size = 'half', stat } = column // Removed 'content' as it's unused
            return (
              <motion.div
                key={index}
                variants={itemVariants}
                className={cn(
                  'flex w-full flex-col overflow-hidden rounded-3xl border bg-teal-100 shadow-xs',
                  {
                    'lg:flex-row': size === 'full' || row?.length === 1,
                  },
                )}
              >
                <div
                  className={cn('flex flex-col justify-between gap-6 p-(--text-h3)', {
                    'pe-4': size == 'full',
                  })}
                >
                  <div>
                    {badge?.label && (
                      <Badge size="lg" {...badge} className="col-span-2 mb-6 border-none p-0" />
                    )}
                    {richTextContent && (
                      <RichText
                        data={richTextContent}
                        className="mx-0 w-full"
                        enableGutter={false}
                      />
                    )}
                  </div>
                  {size === 'full' && stat && (
                    <p className="flex flex-row items-center gap-6 rounded-full bg-teal-950 px-6 py-4">
                      <span className="text-h3 whitespace-nowrap text-inverted-primary">
                        {stat.value}
                      </span>
                      <span className="text-main text-pretty text-inverted-tertiary">
                        {stat.label}
                      </span>
                    </p>
                  )}
                </div>
                {image && (
                  <Media
                    resource={image}
                    className="group h-auto w-full overflow-hidden rounded-lg"
                    imgClassName="h-auto w-full object-cover"
                  />
                )}
                {size !== 'full' && stat && (
                  <p className="mx-(--text-h3) mb-(--text-h3) flex flex-row items-center gap-6 rounded-full bg-teal-950 px-6 py-4">
                    <span className="text-h3 whitespace-nowrap text-inverted-primary">
                      {stat.value}
                    </span>
                    <span className="text-main text-pretty text-inverted-tertiary">
                      {stat.label}
                    </span>
                  </p>
                )}
              </motion.div>
            )
          })}
        </motion.div>
      ))}
    </motion.div>
  )
}
