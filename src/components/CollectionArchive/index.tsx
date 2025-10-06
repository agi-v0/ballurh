import { cn } from '@/utilities/ui'
import React from 'react'

import { Card, CardPostData } from '@/components/Card'

export type Props = {
  posts: CardPostData[]
  relationTo: 'blog' | 'news'
}

export const CollectionArchive: React.FC<Props> = (props) => {
  const { posts, relationTo } = props

  return (
    <div className={cn('container')}>
      <div className="flex flex-col gap-space-7">
        {posts?.map((result, index) => {
          if (typeof result === 'object' && result !== null) {
            return (
              <div className="" key={index}>
                <Card className="h-full" doc={result} relationTo={relationTo} showCategories />
              </div>
            )
          }
          return null
        })}
      </div>
    </div>
  )
}
