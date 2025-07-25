import React from 'react'
import { getPayload, TypedLocale } from 'payload'
import config from '@payload-config'

import { FeaturedAppsBlock, Integration, Media } from '@/payload-types'

import { FeaturedApps03 } from './FeaturedApps03'
import { FeaturedApps04 } from './FeaturedApps04'
import { FeaturedApps05 } from './FeaturedApps05'
import { AppsGridHero } from './AppsGridHero'
import { FeaturedApps06 } from './FeaturedApps06'
// import { AppsCarouselClient } from './FeaturedApps01'

const appsBlocks = {
  '01': AppsGridHero,
  // featuredApps02: FeaturedApps02,
  '03': FeaturedApps03,
  '04': FeaturedApps04,
  '05': FeaturedApps05,
  '06': FeaturedApps06,
}

type FeaturedAppsBlockWithLocale = FeaturedAppsBlock & {
  locale: TypedLocale
}

export const RenderFeaturedAppsBlock: React.FC<FeaturedAppsBlockWithLocale> = async (props) => {
  const { type, apps, blockHeader, media, cards, locale } = props || {}
  if (!type) return null

  // let appsList = apps?.map((ref) => (typeof ref.value === 'object' ? ref.value : '')) || []
  let appsList: Integration[] =
    apps?.filter((ref) => typeof ref.value === 'object').map((ref) => ref.value as Integration) ||
    []

  const payload = await getPayload({ config })

  if (!appsList || appsList.length == 0) {
    const result = await payload.find({
      collection: 'integrations',
      locale: locale || 'ar',
      draft: false,
      where: {
        id: {
          in: apps?.map((app) => app.value),
        },
      },
      limit: 13,
      depth: 2,
      sort: '-updatedAt',
    })
    appsList = result.docs
  }

  const AppsBlockToRender = appsBlocks[type as keyof typeof appsBlocks]

  if (!AppsBlockToRender) return null

  return (
    <AppsBlockToRender
      apps={appsList}
      media={media as Media}
      blockHeader={blockHeader}
      locale={locale}
      cards={cards}
    />
  )
}
