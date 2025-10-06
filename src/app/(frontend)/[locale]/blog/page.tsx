import type { Metadata } from 'next/types'
import type { Page as PageType, BlogPost, Category } from '@/payload-types'

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
import { Link } from '@/i18n/navigation'
import RecentBlogPosts from '@/components/RecentBlogPosts'

export const dynamic = 'force-static'

type Args = {
  params: Promise<{
    locale?: 'ar' | 'en' | undefined
  }>
}

export default async function Page({ params: paramsPromise }: Args) {
  const { locale = 'ar' } = await paramsPromise
  const slug = 'blog'
  const payload = await getPayload({ config: configPromise })

  let page: PageType | null

  page = await queryPageBySlug({
    slug,
    locale,
  })

  const hero = page?.hero ?? { type: 'none' }
  const layout = page?.layout ?? []

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
  })

  const categories: Category[] = []

  posts.docs.forEach((post) => {
    post.categories?.forEach((category) => {
      if (typeof category === 'object' && category !== null) {
        if (!categories.some((c) => c.id === category.id)) {
          categories.push(category)
        }
      }
    })
  })

  // if (!page) {
  //   return <PayloadRedirects url={url} />
  // }

  return (
    <article className="overflow-x-clip bg-background">
      <PageClient />

      <RenderHero {...hero} />

      {/* <RenderBlocks blocks={layout as any} locale={locale} /> */}
      {/* <h2 className="mb-space-sm text-h2 font-medium">{t('allArticles')}</h2> */}

      <div className="container flex flex-row items-center justify-between py-space-7">
        {categories.length > 0 && (
          <div className="flex flex-wrap gap-2">
            <Link
              href="/blog"
              className="bg-transparent-neutral h-8 rounded-full px-2.5 py-1.5 text-sm font-medium text-base-primary outline transition-colors hover:bg-background-neutral-subtle hover:text-base-secondary"
            >
              {locale === 'ar' ? 'الكل' : 'All'}
            </Link>
            {categories?.map((category, index) => {
              return (
                <Link
                  href={`/blog/category/${category.slug}`}
                  key={index}
                  className="rounded-full bg-transparent px-4 py-2 text-sm font-medium text-base-primary transition-colors hover:bg-background-neutral hover:text-base-secondary hover:outline"
                >
                  {category.title}
                </Link>
              )
            })}
          </div>
        )}
      </div>
      <RecentBlogPosts posts={posts.docs.slice(0, 5) as any} relationTo="blog" />

      <CollectionArchive posts={posts.docs as BlogPost[]} relationTo="blog" />

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
