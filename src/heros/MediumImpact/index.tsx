import React from 'react'

import type { Page } from '@/payload-types'

import { CMSLink } from '@/components/Link'
import { Media } from '@/components/MediaResponsive'
import RichText from '@/components/RichText'
import { Badge } from '@/components/ui/badge'

export const MediumImpactHero: React.FC<Page['hero']> = ({ links, media, badge, richText }) => {
  return (
    <div className="mt-header-plus-admin-bar py-10">
      <div className="container mb-8 flex flex-col items-center">
        {badge?.label && <Badge size="lg" {...badge} className="mx-auto mb-6 border-none" />}
        {richText && (
          <RichText className="mb-6 max-w-4xl text-center" data={richText} enableGutter={false} />
        )}

        {Array.isArray(links) && links.length > 0 && (
          <ul className="flex gap-4">
            {links.map(({ link }, i) => {
              return (
                <li key={i}>
                  <CMSLink {...link} />
                </li>
              )
            })}
          </ul>
        )}
      </div>
      <div className="container">
        {media && typeof media === 'object' && (
          <div>
            <Media className="-mx-4 md:-mx-8 2xl:-mx-16" imgClassName="" priority media={media} />
          </div>
        )}
      </div>
    </div>
  )
}
