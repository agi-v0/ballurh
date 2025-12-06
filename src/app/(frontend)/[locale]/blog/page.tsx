import type { Metadata } from 'next/types'
import type { Page as PageType, BlogPost, Category } from '@/payload-types'

import { CollectionArchive } from '@/components/CollectionArchive'
import { PageRange } from '@/components/PageRange'
import { Pagination } from '@/components/Pagination'
import configPromise from '@payload-config'
import { CollectionSlug, getPayload } from 'payload'
import React, { cache } from 'react'
import PageClient from './page.client'
import { RenderHero } from '@/heros/RenderHero'
import { RenderBlocks } from '@/blocks/RenderBlocks'
import RecentBlogPosts from '@/components/RecentBlogPosts'
import { draftMode } from 'next/headers'
import { generateMeta } from '@/utilities/generateMeta'
import { Link } from '@/i18n/navigation'
import { setRequestLocale } from 'next-intl/server'
import { PayloadRedirects } from '@/components/PayloadRedirects'

type Args = {
  params: Promise<{
    locale?: 'ar' | 'en' | undefined
  }>
}

export default async function Page({ params: paramsPromise }: Args) {
  const { locale = 'ar' } = await paramsPromise
  const slug = 'blog'
  const url = `/${locale}/${slug}`

  setRequestLocale(locale)

  let page: PageType | null

  page = await queryPageBySlug({
    slug,
    locale,
  })

  const hero = page?.hero ?? { type: 'none' }
  const layout = page?.layout ?? []

  const posts = await queryPosts({
    collection: 'blog-posts',
    locale,
  })

  const categories: Category[] = []

  ;(posts.docs as BlogPost[]).forEach((post) => {
    post.categories?.forEach((category) => {
      if (typeof category === 'object' && category !== null) {
        if (!categories.some((c) => c.id === category.id)) {
          categories.push(category)
        }
      }
    })
  })

  if (!page) {
    return <PayloadRedirects url={url} />
  }

  return (
    <article className="overflow-x-clip bg-background">
      <PageClient />

      <RenderHero {...hero} />

      {/* <RenderBlocks blocks={layout as any} locale={locale} /> */}
      {/* <h2 className="mb-space-sm text-h2 font-medium">{t('allArticles')}</h2> */}

      {categories.length > 0 && (
        <div className="container flex flex-row flex-wrap items-center gap-2">
          <Link
            href="/blog"
            className="bg-transparent-neutral h-8 rounded-full px-2.5 py-1.5 text-sm font-medium text-base-primary outline transition-colors hover:bg-blr-light-green-2 hover:text-base-secondary"
          >
            {locale === 'ar' ? 'الكل' : 'All'}
          </Link>
          {categories?.map((category, index) => {
            return (
              <Link
                href={`/blog/category/${category.slug}`}
                key={index}
                className="rounded-full bg-transparent px-4 py-2 text-sm font-medium text-base-primary transition-colors hover:bg-blr-light-green-2 hover:text-base-secondary"
              >
                {category.title}
              </Link>
            )
          })}
        </div>
      )}
      <RecentBlogPosts posts={posts.docs.slice(0, 5) as any} relationTo="blog" />

      <CollectionArchive posts={posts.docs.slice(1) as BlogPost[]} relationTo="blog" />

      <div className="container my-space-8 flex flex-col items-center justify-between gap-4 md:flex-row">
        {posts.totalPages > 1 && posts.page && (
          <Pagination className="my-0" page={posts.page} totalPages={posts.totalPages} />
        )}
        <PageRange
          className="w-fit shrink-0"
          collection="blog-posts"
          currentPage={posts.page}
          limit={12}
          totalDocs={posts.totalDocs}
        />
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
const queryPosts = cache(
  async ({ collection, locale }: { collection: CollectionSlug; locale?: 'ar' | 'en' }) => {
    const { isEnabled: draft } = await draftMode()

    const payload = await getPayload({ config: configPromise })

    const result = await payload.find({
      collection,
      depth: 1,
      limit: 12,
      overrideAccess: false,
      locale,
      draft,
      sort: '-publishedAt',
      select: {
        title: true,
        slug: true,
        heroImage: true,
        categories: true,
        meta: true,
        content: true,
        publishedAt: true,
      },
    })

    return result
  },
)
