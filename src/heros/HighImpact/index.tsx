import React from 'react'

import type { Page } from '@/payload-types'

import { CMSLink } from '@/components/Link'
import { Media } from '@/components/MediaResponsive'
import RichText from '@/components/RichText'
import { Icon } from '@iconify-icon/react/dist/iconify.mjs'
import { cn } from '@/utilities/ui'
import { getLocale } from 'next-intl/server'
import { Badge } from '@/components/ui/badge'
import { getCachedAnnouncement } from '@/utilities/getAnnouncement'

const listClassMap = {
  bullet: 'list-disc ',
  numbered: 'list-decimal ',
  icons: '',
} as const

const StyledList: React.FC<{
  list: {
    style?: ('bullet' | 'numbered' | 'icons') | null
    items?:
      | {
          text: string
          icon?: string | null
          id?: string | null
        }[]
      | null
  }
  className?: string
}> = ({ list, className }) => {
  const { style, items } = list
  switch (style) {
    case 'icons':
      return (
        <ul className={cn('space-y-3', listClassMap[style], className)}>
          {list.items?.map((item, index) => (
            <li
              key={item.id || `item-${index}`}
              className="flex list-none items-center gap-3 text-base-secondary"
            >
              {item.icon && (
                <Icon icon={`ri:${item.icon}`} className="flex-shrink-0" height={20} width={20} />
              )}
              <span className="mt-0">{item.text}</span>
            </li>
          ))}
        </ul>
      )
    case 'bullet':
    case 'numbered':
      return (
        <ul className={cn('space-y-2', listClassMap[style], className)}>
          {list?.items?.map((item, index) => (
            <li key={item.id || `item-${index}`} className="text-base-secondary">
              {item.text}
            </li>
          ))}
        </ul>
      )
    default:
      return null
  }
}

export const HighImpactHero: React.FC<Page['hero']> = async ({ links, media, richText, list }) => {
  const locale = await getLocale()
  const announcement = await getCachedAnnouncement(locale)()

  // const { setHeaderTheme } = useHeaderTheme()

  // useEffect(() => {
  //   setHeaderTheme('dark')
  // })

  return (
    <div className="container grid min-h-screen w-full grid-cols-8 items-center justify-center max-lg:mt-header-plus-admin-bar lg:grid-cols-16 lg:py-0">
      <div className="relative z-1 col-span-8 my-10 flex flex-col items-start gap-6 md:gap-10 lg:col-span-7 lg:my-16">
        {announcement && (
          <CMSLink
            {...announcement.link}
            label={null}
            className="flex flex-row items-center gap-1.5 font-medium text-base-primary"
          >
            <Badge color="gray" size="md" label="تحديث" />
            <div className="text-sm">{announcement.text}</div>
          </CMSLink>
        )}
        {richText && <RichText className="[&>p]:text-large" data={richText} enableGutter={false} />}
        {Array.isArray(links) && links.length > 0 && (
          <ul className="flex max-w-full flex-wrap gap-1">
            {links.map(({ link }, i) => {
              return (
                <li key={i}>
                  <CMSLink {...link} size="lg" className="text-(length:--text-main)" />
                </li>
              )
            })}
          </ul>
        )}
        {list?.items?.length && list?.items?.length > 0 && (
          <StyledList list={list} className="max-lg:hidden lg:block" />
        )}
      </div>
      <div className="relative z-0 col-span-8 block select-none lg:col-start-10">
        {media && typeof media === 'object' && (
          <Media
            className="relative aspect-1728/1117 h-[350px] w-auto md:h-auto md:w-full lg:h-[70vh] lg:w-auto"
            imgClassName="rounded-2xl object-cover object-right outline-4 outline-ring/50"
            priority
            media={media}
          />
        )}
        <div className="absolute end-[15%] top-1/2 -z-1 aspect-square h-auto w-screen -translate-x-1/2 -translate-y-1/2 rounded-full bg-[radial-gradient(ellipse_50.00%_50.00%_at_50.00%_50.00%,_rgba(236,_255,_249,_0)_75%,_#D2F9EC_100%)] mask-b-from-50% mask-b-to-95% ltr:translate-x-1/2" />
      </div>
      {list?.items?.length && list?.items?.length > 0 && (
        <StyledList
          list={list}
          className="col-span-8 mt-10 flex-row gap-4 max-md:block md:flex lg:hidden"
        />
      )}
    </div>
  )
}
