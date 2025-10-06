import type { Metadata } from 'next/types'
import type { Page as PageType } from '@/payload-types'

import { CollectionArchive } from '@/components/CollectionArchive'
import { PageRange } from '@/components/PageRange'
import { Pagination } from '@/components/Pagination'
import configPromise from '@payload-config'
import { getPayload } from 'payload'
import React, { cache } from 'react'
import PageClient from './page.client'
import { notFound } from 'next/navigation'
import { draftMode } from 'next/headers'
import { RenderHero } from '@/heros/RenderHero'
import { RenderBlocks } from '@/blocks/RenderBlocks'
import { generateMeta } from '@/utilities/generateMeta'

export const revalidate = 600
export const dynamic = 'force-static'

type Args = {
  params: Promise<{
    pageNumber: string
    locale?: 'ar' | 'en' | undefined
  }>
}

export default async function Page({ params: paramsPromise }: Args) {
  const { pageNumber, locale = 'ar' } = await paramsPromise
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

  const sanitizedPageNumber = Number(pageNumber)

  if (!Number.isInteger(sanitizedPageNumber)) notFound()

  const posts = await payload.find({
    collection: 'blog-posts',
    locale: locale,
    depth: 1,
    limit: 12,
    page: sanitizedPageNumber,
    overrideAccess: false,
  })

  return (
    <article className="overflow-x-clip bg-background">
      <PageClient />

      <RenderHero {...hero} />

      {/* {sanitizedPageNumber === 1 && <RenderBlocks blocks={layout as any} locale={locale} />} */}

      <CollectionArchive posts={posts.docs} relationTo="blog" />

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

export async function generateStaticParams({
  params: { locale },
}: {
  params: { locale?: 'ar' | 'en' | undefined }
}) {
  const payload = await getPayload({ config: configPromise })
  const { totalDocs } = await payload.count({
    collection: 'blog-posts',
    locale: locale,
    overrideAccess: false,
  })

  const totalPages = Math.ceil(totalDocs / 10)

  const pages: { pageNumber: string }[] = []

  for (let i = 1; i <= totalPages; i++) {
    pages.push({ pageNumber: String(i) })
  }

  return pages
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
