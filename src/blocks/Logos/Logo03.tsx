import React from 'react'
import type { Media as MediaType } from '@/payload-types'
import { Media } from '@/components/MediaResponsive'
import { cn } from '@/utilities/ui'
import RichText from '@/components/RichText'
import { BlockHeader as BlockHeaderType } from '@/payload-types'

interface Logo03Props {
  logos: MediaType[]
  className?: string
  blockHeader: BlockHeaderType
}

export const Logo03: React.FC<Logo03Props> = ({ logos, blockHeader, className }) => {
  if (!logos || logos.length === 0) {
    return null
  }

  return (
    <div className={cn('container w-full py-section-small', className)}>
      <div className="grid grid-cols-1 gap-8 md:grid-cols-2">
        {blockHeader?.headerText && (
          <RichText
            data={blockHeader.headerText}
            enableGutter={false}
            className="mx-0 opacity-60 [&>p]:text-large [&>p]:font-medium [&>p]:text-base-primary"
          />
        )}
        <div className="flex flex-row items-center justify-between gap-space-8 md:justify-end">
          {logos.map((logo, index) => {
            return (
              typeof logo === 'object' &&
              logo !== null && (
                <Media
                  key={logo.id || index}
                  resource={logo}
                  imgClassName="h-space-8 w-auto object-contain opacity-60"
                />
              )
            )
          })}
        </div>
      </div>
    </div>
  )
}
