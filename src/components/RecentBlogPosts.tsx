import React from 'react'
import type { BlogPost, Category } from '@/payload-types'
import Link from 'next/link'
import { cn } from '@/utilities/ui'
import { formatDateTime } from '@/utilities/formatDateTime'
import { useLocale } from 'next-intl'

export type RecentBlogPostsProps = {
  posts: BlogPost[]
  relationTo: 'blog' | 'news'
}

export const RecentBlogPosts: React.FC<RecentBlogPostsProps> = ({ posts, relationTo }) => {
  const locale = useLocale()
  const dataTimeFormat = locale === 'en' ? 'en-US' : 'ar-SA'
  if (!posts || posts.length === 0) return null
  const [featured, ...rest] = posts
  return (
    <section className="container py-section-small">
      {/* Categories row (optional, can be passed as prop if needed) */}
      {/* <div className="flex flex-row gap-2 items-center justify-center mb-6">
        {categories.map((cat) => (
          <span key={cat.id} className="bg-background-button-ghost rounded-full px-3 py-1.5 text-sm text-base-secondary">
            {cat.title}
          </span>
        ))}
      </div> */}
      <div className="grid grid-cols-4 gap-space-7 lg:grid-cols-16 lg:gap-0">
        {/* Featured post */}
        <div className="relative col-span-4 flex flex-1 flex-col gap-4 overflow-hidden rounded-3xl lg:col-span-10">
          {featured.heroImage &&
            typeof featured.heroImage !== 'string' &&
            featured.heroImage.url && (
              <div
                className="aspect-video h-auto w-full rounded-3xl bg-cover bg-center"
                style={{ backgroundImage: `url('${featured.heroImage.url}')` }}
              />
            )}
          <div className="flex flex-col gap-2">
            <div className="flex flex-row items-center gap-1.5 text-right text-sm text-base-tertiary">
              {featured.publishedAt && (
                <span>{formatDateTime(featured.publishedAt, dataTimeFormat)}</span>
              )}
              {featured.categories &&
                featured.categories.length > 0 &&
                typeof featured.categories[0] === 'object' && (
                  <span className="font-medium text-blr-orange">
                    • {(featured.categories[0] as Category).title}
                  </span>
                )}
            </div>
            <Link
              href={`/blog/${featured.slug || ''}`}
              className="block text-start text-h3 font-semibold text-base-primary transition-colors hover:text-brand"
            >
              {featured.title}
              <span className="absolute inset-0" />
            </Link>
          </div>
        </div>
        {/* Other posts */}
        <div className="col-span-4 flex min-w-0 flex-col gap-6 lg:col-span-5 lg:col-start-12">
          {rest.map((post) => {
            return (
              <div key={post.id} className="flex flex-col gap-3">
                <div className="flex flex-row items-center gap-1.5 text-start text-sm text-base-tertiary">
                  {post.publishedAt && (
                    <span>{formatDateTime(post.publishedAt, dataTimeFormat)} •</span>
                  )}
                  {post.categories &&
                    post.categories.length > 0 &&
                    typeof post.categories[0] === 'object' && (
                      <span className="text-blr-orange uppercase">
                        {(post.categories[0] as Category).title}
                      </span>
                    )}
                </div>
                <Link
                  href={relationTo + '/' + (post.slug || '')}
                  className="block text-start text-main font-medium text-base-primary transition-colors hover:text-base-secondary"
                >
                  {post.title}
                </Link>
              </div>
            )
          })}
        </div>
      </div>
    </section>
  )
}

export default RecentBlogPosts
