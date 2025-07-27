import React from 'react'
import { FeaturesBlock } from '@/payload-types'
import { Badge } from '@/components/ui/badge'
import { Media } from '@/components/MediaResponsive'
import { cn } from '@/utilities/ui'
import RichText from '@/components/RichText'

import { CMSLink } from '@/components/Link'

const colSpanClass = {
  full: 'md:col-span-4 lg:col-span-12',
  half: 'md:col-span-2 lg:col-span-6',
  oneThird: 'md:col-span-2 lg:col-span-4',
  twoThirds: 'md:col-span-2 lg:col-span-2',
  sixtyPercent: '',
  fortyPercent: '',
}

export const Features03: React.FC<FeaturesBlock> = ({ columns }) => {
  if (!columns?.length) return null

  return (
    <div className="py-xl gap-md container grid grid-cols-1 bg-background md:grid-cols-4 lg:grid-cols-12">
      {columns.map((column, index) => {
        const { image, size = 'full', richTextContent } = column
        const lgColSpanClass = colSpanClass[size || 'full']

        return (
          <div key={index} className={cn('col-span-full', lgColSpanClass)}>
            <div
              className={cn('gap-sm flex flex-col', {
                'md:flex-row md:items-center md:justify-start': size === 'full',
              })}
            >
              {image && (
                <Media
                  resource={image}
                  className={cn('overflow-hidden rounded-3xl', {
                    'lg:basis-1/2': size === 'full', // Adjust width for full-size columns
                    'w-full': size !== 'full', // Full width for non-full-size columns
                  })}
                  imgClassName="aspect-video h-auto w-full object-cover"
                />
              )}
              <div
                className={cn('gap-sm flex flex-col items-start', {
                  'md:px-md w-full lg:basis-1/2': size === 'full',
                  'md:px-sm': size !== 'full',
                })}
              >
                {column.enableBadge && column.badge && <Badge {...column.badge} />}
                {richTextContent && <RichText data={richTextContent} />}
                {column.enableCta && column.link?.label && (
                  <CMSLink className="mt-auto w-fit" size="lg" {...column.link} />
                )}
              </div>
            </div>
          </div>
        )
      })}
    </div>
  )
}
