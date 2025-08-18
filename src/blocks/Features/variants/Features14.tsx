import React from 'react'
import { FeaturesBlock } from '@/payload-types'
import { Media } from '@/components/MediaResponsive'
import { Card, CardContent } from '@/components/ui/card'

export const Features14: React.FC<FeaturesBlock> = ({ columns, link, CTALabel }) => {
  if (!columns?.length) return null
  const limitedColumns = columns.slice(0, 3)
  return (
    <div className="container py-space-7">
      <div className="mx-auto grid grid-cols-1 gap-4 md:grid-cols-3">
        {limitedColumns.map((column, index) => {
          return (
            <Card key={index} className="group overflow-hidden bg-background-neutral !p-0">
              <CardContent className="grid grid-cols-2 items-center gap-0 rounded-none p-0 md:grid-cols-1">
                {column.image && (
                  <div className="relative h-auto w-full">
                    <Media
                      resource={column.image}
                      className="h-auto w-full p-4"
                      imgClassName="aspect-square h-auto w-full rounded-3xl object-cover"
                    />
                    <div className="absolute inset-0 z-2 bg-teal-600 opacity-100 mix-blend-overlay duration-300 ease-out group-hover:opacity-100 lg:opacity-0" />
                  </div>
                )}
                {column.content && (
                  <div className="not-prose flex flex-col items-center gap-2 px-4 pt-2 pb-4 text-start md:text-center">
                    <h3 className="text-h4 font-semibold text-base-primary group-hover:text-teal-700">
                      {column.content?.title}
                    </h3>
                    {column.content.subtitle && (
                      <p className="text-main text-base-tertiary">{column.content?.subtitle}</p>
                    )}
                  </div>
                )}
              </CardContent>
            </Card>
          )
        })}
      </div>
    </div>
  )
}
