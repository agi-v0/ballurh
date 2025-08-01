import type { Metadata } from 'next/types'
import type { Page as PageType, BlogPost, Category } from '@/payload-types'

import { CollectionArchive } from '@/components/CollectionArchive'
import { PageRange } from '@/components/PageRange'
import { Pagination } from '@/components/Pagination'
import configPromise from '@payload-config'
import { getPayload } from 'payload'
import React, { cache } from 'react'

import { RenderHero } from '@/heros/RenderHero'
import { RenderBlocks } from '@/blocks/RenderBlocks'
import { draftMode } from 'next/headers'
import { generateMeta } from '@/utilities/generateMeta'
import { Link } from '@/i18n/navigation'
import RecentBlogPosts from '@/components/RecentBlogPosts'
import ProfitabilityCalculator from '@/components/MultistepForm'

type Args = {
  params: Promise<{
    locale?: 'ar' | 'en' | undefined
  }>
}

export default async function Page({ params: paramsPromise }: Args) {
  const { locale = 'ar' } = await paramsPromise
  const slug = 'blog'
  const payload = await getPayload({ config: configPromise })

  //   if (!page) {
  //     page = null
  //   }

  // if (!page) {
  //   return <PayloadRedirects url={url} />
  // }

  return (
    <article className="overflow-x-clip bg-background">
      <div className="container flex min-h-screen w-full flex-col pt-header-plus-admin-bar pb-4">
        <ProfitabilityCalculator />
      </div>
    </article>
  )
}
