import React from 'react'
import type { BlogPost, Category } from '@/payload-types'
import Link from 'next/link'
import { cn } from '@/utilities/ui'

export type RecentBlogPostsProps = {
  posts: BlogPost[]
}

function formatDate(dateString?: string | null) {
  if (!dateString) return ''
  const date = new Date(dateString)
  return date
    .toLocaleDateString('en-GB', {
      day: '2-digit',
      month: 'short',
      year: 'numeric',
    })
    .replace(/ /g, ' ')
    .toUpperCase()
}

export const RecentBlogPosts: React.FC<RecentBlogPostsProps> = ({ posts }) => {
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
      <div className="grid grid-cols-4 gap-space-7 lg:grid-cols-16">
        {/* Featured post */}
        <div className="col-span-4 flex flex-1 flex-col gap-4 overflow-hidden rounded-3xl lg:col-span-12">
          {featured.meta?.image &&
            typeof featured.meta.image !== 'string' &&
            featured.meta.image.url && (
              <div
                className="aspect-video h-auto w-full rounded-3xl bg-cover bg-center"
                style={{ backgroundImage: `url('${featured.meta.image.url}')` }}
              />
            )}
          <div className="flex flex-col gap-2">
            {/* <div className="flex flex-row items-center gap-1.5 text-right text-sm text-base-tertiary">
              <span>{formatDate(featured.publishedAt)}</span>•
              {featured.categories &&
                featured.categories.length > 0 &&
                typeof featured.categories[0] === 'object' && (
                  <span className="font-medium text-teal-500">
                    {(featured.categories[0] as Category).title}
                  </span>
                )}
            </div> */}
            <Link
              href={`/blog/${featured.slug || ''}`}
              className="block text-start text-h3 font-semibold text-base-primary transition-colors hover:text-base-secondary"
            >
              {featured.title}
            </Link>
          </div>
        </div>
        {/* Other posts */}
        <div className="col-span-4 flex min-w-0 flex-col gap-6">
          {rest.map((post) => (
            <div key={post.id} className="flex flex-col gap-3">
              <div className="flex flex-row items-center gap-1.5 text-start text-sm text-base-tertiary">
                <span>{formatDate(post.publishedAt)}</span>•
                {post.categories &&
                  post.categories.length > 0 &&
                  typeof post.categories[0] === 'object' && (
                    <span className="text-[#d08700]">{(post.categories[0] as Category).title}</span>
                  )}
              </div>
              <Link
                href={`/blog/${post.slug || ''}`}
                className="block text-start text-main font-medium text-base-primary transition-colors hover:text-base-secondary"
              >
                {post.title}
              </Link>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}

export default RecentBlogPosts
