import type { Metadata } from 'next'

import { RelatedPosts } from '@/blocks/RelatedPosts/Component'
import { PayloadRedirects } from '@/components/PayloadRedirects'
import configPromise from '@payload-config'
import { getPayload } from 'payload'
import { draftMode } from 'next/headers'
import React, { cache } from 'react'
import RichText from '@/components/RichText'

import { PostHero } from '@/heros/PostHero'
import { generateMeta } from '@/utilities/generateMeta'
import PageClient from './page.client'
import { LivePreviewListener } from '@/components/LivePreviewListener'

import { blogConverters } from '@/components/RichText/blogConverters'
import { BlogSidebar } from '@/components/BlogSidebar'

export const dynamic = 'force-static'

export async function generateStaticParams() {
  const payload = await getPayload({ config: configPromise })
  const locales = ['en', 'ar']
  const params: { slug: string; locale: 'ar' | 'en' }[] = []
  for (const locale of locales) {
    const pages = await payload.find({
      collection: 'news',
      locale: locale as 'ar' | 'en',
      draft: false,
      limit: 1000,
      overrideAccess: false,
      pagination: false,
      select: {
        slug: true,
      },
    })
    pages.docs
      ?.filter((doc) => {
        return doc.slug && doc.slug !== 'home'
      })
      .map((doc) => {
        params.push({
          slug: encodeURIComponent(doc.slug || ''),
          locale: locale as 'ar' | 'en',
        })
      })
  }

  return params
}

type Args = {
  params: Promise<{
    slug?: string
    locale?: 'ar' | 'en' | undefined
  }>
}

export default async function Post({ params: paramsPromise }: Args) {
  const payload = await getPayload({ config: configPromise })
  const { isEnabled: draft } = await draftMode()
  const { slug = '', locale = 'ar' } = await paramsPromise
  const url = `/${locale}/news/` + decodeURIComponent(slug)
  const post = await queryPostBySlug({ slug, locale })

  if (!post) return <PayloadRedirects url={url} />

  return (
    <article className="pt-header-plus-admin-bar pb-16">
      <PageClient />

      {/* Allows redirects for valid pages too */}
      <PayloadRedirects disableNotFound url={url} />

      {draft && <LivePreviewListener />}

      <PostHero post={post} />

      <div className="container mx-auto flex w-full gap-4 pt-8">
        <div className="relative flex w-full items-center justify-center will-change-transform">
          <div className="z-2 flex w-full flex-col-reverse gap-space-7 *:py-(--text-h1) lg:flex-row lg:items-start">
            <RichText
              className="mx-0 w-full max-w-4xl basis-2/3"
              data={post.content}
              enableProse
              enableGutter={false}
              converters={blogConverters}
            />
            <BlogSidebar post={post} />
          </div>
        </div>
        {post.relatedPosts && post.relatedPosts.length > 0 && (
          <RelatedPosts
            className="col-span-3 col-start-1 mt-12 max-w-[52rem] grid-rows-[2fr] lg:grid lg:grid-cols-subgrid"
            docs={post.relatedPosts.filter((post) => typeof post === 'object')}
            relationTo="news"
          />
        )}
      </div>
    </article>
  )
}

export async function generateMetadata({ params: paramsPromise }: Args): Promise<Metadata> {
  const { slug = '', locale = 'ar' } = await paramsPromise
  const post = await queryPostBySlug({ slug, locale })
  return generateMeta({ doc: post })
}

const queryPostBySlug = cache(
  async ({ slug, locale }: { slug: string; locale?: 'ar' | 'en' | undefined }) => {
    const { isEnabled: draft } = await draftMode()

    const payload = await getPayload({ config: configPromise })

    const post = await payload.find({
      collection: 'news',
      locale: locale,
      draft,
      limit: 1,
      overrideAccess: draft,
      pagination: false,
      where: {
        slug: {
          equals: decodeURIComponent(slug),
        },
      },
    })

    //authors avatars are not populated in the post, so we need to get them from the users collection
    const authors = await payload.find({
      collection: 'users',
      select: {
        name: true,
        avatar: true,
      },
      where: {
        id: { in: post?.docs?.[0]?.populatedAuthors?.map((author) => author.id) },
      },
      pagination: false,
    })

    if (post.docs[0]) {
      post.docs[0].populatedAuthors = authors.docs || []
    }

    return post.docs?.[0] || null
  },
)
