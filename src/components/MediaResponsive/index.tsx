import React, { Fragment } from 'react'

import type { Props } from './types'

import { ImageMedia } from './ImageMedia'
import { VideoMedia } from './VideoMedia'

export const Media: React.FC<Props> = (props) => {
  const { className, htmlElement = 'div', resource, media } = props

  const isVideo =
    (typeof media?.desktop?.light === 'object' &&
      media?.desktop?.light?.mimeType?.includes('video')) ||
    (typeof media?.desktop?.dark === 'object' && media?.desktop?.dark?.mimeType?.includes('video'))

  const Tag = (htmlElement as any) || Fragment

  return (
    <Tag
      {...(htmlElement !== null
        ? {
            className,
          }
        : {})}
    >
      {isVideo ? <VideoMedia {...props} /> : <ImageMedia {...props} />}
    </Tag>
  )
}
