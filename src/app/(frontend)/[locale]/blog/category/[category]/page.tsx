import type { Metadata } from 'next/types'
import type { Page as PageType, BlogPost } from '@/payload-types'

import { CollectionArchive } from '@/components/CollectionArchive'
import { PageRange } from '@/components/PageRange'
import { Pagination } from '@/components/Pagination'
import configPromise from '@payload-config'
import { getPayload } from 'payload'
import React, { cache } from 'react'
import PageClient from './page.client'
import { RenderHero } from '@/heros/RenderHero'
import { RenderBlocks } from '@/blocks/RenderBlocks'
import { draftMode } from 'next/headers'
import { generateMeta } from '@/utilities/generateMeta'

export const dynamic = 'force-static'
export const revalidate = 600

type Args = {
  params: Promise<{
    category: string
    locale?: 'ar' | 'en' | undefined
  }>
}

export async function generateStaticParams() {
  const locales = ['en', 'ar']
  const params: { category: string; locale: 'ar' | 'en' }[] = []
  const payload = await getPayload({ config: configPromise })

  for (const locale of locales) {
    const categories = await payload.find({
      collection: 'categories',
      locale: locale as 'ar' | 'en',
      where: {
        'parent.slug': {
          equals: 'blog',
        },
      },
      pagination: false,
    })

    for (const category of categories.docs) {
      params.push({
        category: category.slug || '',
        locale: locale as 'ar' | 'en',
      })
    }
  }

  return params
}

export default async function Page({ params: paramsPromise }: Args) {
  const { category, locale = 'ar' } = await paramsPromise
  const slug = 'blog'
  const payload = await getPayload({ config: configPromise })

  let page: PageType | null

  page = await queryPageBySlug({
    slug,
    locale,
  })

  const { hero, layout } = page

  if (!page) {
    page = null
  }

  const posts = await payload.find({
    collection: 'blog-posts',
    depth: 1,
    limit: 12,
    overrideAccess: false,
    select: {
      title: true,
      slug: true,
      categories: true,
      meta: true,
      content: true,
      publishedAt: true,
    },
    where: {
      'categories.slug': {
        equals: category,
      },
    },
  })

  // if (!page) {
  //   return <PayloadRedirects url={url} />
  // }

  return (
    <article className="overflow-x-clip bg-background">
      <PageClient />

      <RenderHero {...hero} />

      <RenderBlocks blocks={layout as any} locale={locale} />

      <div className="container mb-8">
        <PageRange
          collection="blog-posts"
          currentPage={posts.page}
          limit={12}
          totalDocs={posts.totalDocs}
        />
      </div>

      <CollectionArchive posts={posts.docs as BlogPost[]} />

      <div className="container">
        {posts.totalPages > 1 && posts.page && (
          <Pagination page={posts.page} totalPages={posts.totalPages} />
        )}
      </div>
    </article>
  )
}

export async function generateMetadata({ params: paramsPromise }: Args): Promise<Metadata> {
  const { locale = 'ar' } = await paramsPromise
  const slug = 'blog'

  const page = await queryPageBySlug({
    slug,
    locale,
  })

  return generateMeta({ doc: page })
}

const queryPageBySlug = cache(async ({ slug, locale }: { slug: string; locale?: 'ar' | 'en' }) => {
  const { isEnabled: draft } = await draftMode()

  const payload = await getPayload({ config: configPromise })

  const result = await payload.find({
    collection: 'pages',
    locale: locale,
    draft,
    limit: 1,
    pagination: false,
    overrideAccess: draft,
    where: {
      slug: {
        equals: slug,
      },
    },
  })

  return result.docs?.[0] || null
})
