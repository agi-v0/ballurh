'use client'
import { useHeaderTheme } from '@/providers/HeaderTheme'
import React, { useEffect } from 'react'

import type { Page } from '@/payload-types'

import { CMSLink } from '@/components/Link'
import { Media } from '@/components/MediaResponsive'
import RichText from '@/components/RichText'

export const HighImpactHero: React.FC<Page['hero']> = ({ links, media, richText }) => {
  // const { setHeaderTheme } = useHeaderTheme()

  // useEffect(() => {
  //   setHeaderTheme('dark')
  // })

  return (
    <div className="relative grid min-h-screen w-full grid-cols-8 items-center justify-center px-(--gutter-h) py-10 max-lg:mt-header-plus-admin-bar lg:grid-cols-16 lg:py-0">
      <div className="relative z-1 col-span-8 mb-10 flex flex-col lg:col-span-6 lg:mb-0">
        {richText && (
          <RichText className="mb-6 [&>p]:text-large" data={richText} enableGutter={false} />
        )}
        {Array.isArray(links) && links.length > 0 && (
          <ul className="flex gap-1">
            {links.map(({ link }, i) => {
              return (
                <li key={i}>
                  <CMSLink {...link} size="lg" className="text-(length:--text-main)" />
                </li>
              )
            })}
          </ul>
        )}
      </div>
      <div className="relative col-span-8 block select-none lg:col-start-8">
        {media && typeof media === 'object' && (
          <Media
            fill
            className="relative z-1 aspect-[1728/1117] h-[350px] w-auto md:h-auto md:w-full lg:h-[70vh] lg:w-auto"
            imgClassName="rounded-2xl object-cover object-right outline-4 outline-ring/50"
            priority
            media={media}
          />
        )}
        <div className="absolute top-1/2 left-[15%] z-0 aspect-square h-auto w-screen -translate-x-1/2 -translate-y-1/2 rounded-full bg-[radial-gradient(ellipse_50.00%_50.00%_at_50.00%_50.00%,_rgba(236,_255,_249,_0)_75%,_#D2F9EC_100%)]" />
      </div>
    </div>
  )
}
