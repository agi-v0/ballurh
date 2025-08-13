'use client'

import type { StaticImageData } from 'next/image'

import { cn } from '@/utilities/ui'
import NextImage from 'next/image'
import { useTheme } from '@/providers/Theme'
import React from 'react'

import type { Props as MediaProps } from '../types'

import { cssVariables } from '@/cssVariables'
import { getMediaUrl } from '@/utilities/getMediaUrl'
import { Media } from '@/payload-types'

const { breakpoints } = cssVariables

// A base64 encoded image to use as a placeholder while the image is loading
const placeholderBlur =
  'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAAACXBIWXMAAAsTAAALEwEAmpwYAAABHElEQVR4nGO4dfsuTRHDqAW3Ry24O2rBrUFlwYWLl4+fOI2MqGnBk6fP581frKCkoq6po66po6CkYufgdOHiZWpa0N07gZGVU1BYTFBYjJGVU1NLl2oWXLh4+d27D3mFxYLCYpJSspJSsoLCYiZmllQIoidPn0PQli3b1TV1hITF4Ra4eXg9efqcUguWrVjZ2taRlJyupKwGd76klCwzO29JaQWlFly4eFlH3xgS7nCj4Wj33v1UsMDQ1AzTdEZWzozMHIKmk2kBIyunm4cXwfRDtAVGptz8wpCkCbEpKTn94sWrRCY/wha4uXsqKKmYmFm4uXuWlFZs2bqTmJAhIRVdABcPFy5ehqfXoVzY3Rq14PaoBbdGLbhNsgUAf0Sx5YDnbO4AAAAASUVORK5CYII='

const buildSrcSet = (m?: Media | string | null) => {
  if (!m || typeof m === 'string') return undefined
  const toPair = (url?: string | null, w?: number | null) =>
    url && w ? `${getMediaUrl(url)} ${w}w` : undefined

  return [
    toPair(m.sizes?.thumbnail?.url, m.sizes?.thumbnail?.width),
    toPair(m.sizes?.small?.url, m.sizes?.small?.width),
    toPair(m.sizes?.medium?.url, m.sizes?.medium?.width),
    toPair(m.sizes?.large?.url, m.sizes?.large?.width),
    toPair(m.url, m.width), // original
  ]
    .filter(Boolean)
    .join(', ')
}

export const ImageMedia: React.FC<MediaProps> = (props) => {
  const {
    fill,
    imgClassName,
    priority,
    resource,
    media,
    alt: altFromProps,
    size: sizeFromProps,
    src: srcFromProps,
    loading: loadingFromProps,
  } = props
  const { theme } = useTheme()

  let width: number | undefined
  let height: number | undefined
  let alt = altFromProps
  let src: StaticImageData | string = srcFromProps || ''
  let darkSrc: string = ''
  const mobileSrc: string = ''
  const mobileDarkSrc: string = ''
  let blurhash: string = placeholderBlur

  const { light: lightFromDesktop, dark: darkFromDesktop } = media?.desktop || {}
  const { light: lightFromMobile, dark: darkFromMobile } = media?.mobile || {}

  const desktopSizes = '(min-width: 768px) 50vw, 100vw'
  const mobileSizes = '100vw'

  //temporarily switch off compatibility with old resource type
  if (!src && resource && typeof resource === 'object') {
    const {
      alt: altFromResource,
      filename: fullFilename,
      height: fullHeight,
      url,
      width: fullWidth,
      blurhash: blurhashFromResource,
      updatedAt: cacheTag,
    } = resource

    width = fullWidth!
    height = fullHeight!
    alt = altFromResource || ''
    blurhash = blurhashFromResource || placeholderBlur
    src = getMediaUrl(url, cacheTag)
    darkSrc = getMediaUrl(url, cacheTag)
  }

  const primary = (media?.desktop?.light ??
    media?.desktop?.dark ??
    media?.mobile?.light ??
    media?.mobile?.dark) as Media

  width = primary?.width ?? undefined
  height = primary?.height ?? undefined
  alt = altFromProps ?? primary?.alt ?? ''
  blurhash = primary?.blurhash ?? placeholderBlur
  const primaryURL = getMediaUrl(primary?.url)

  const loading = loadingFromProps || (!priority ? 'lazy' : undefined)

  // NOTE: this is used by the browser to determine which image to download at different screen sizes
  const sizes = sizeFromProps
    ? sizeFromProps
    : Object.entries(breakpoints)
        .map(([, value]) => `(max-width: ${value}px) ${value * 2}w`)
        .join(', ')

  if (!src && !darkSrc) return null

  const isDark = theme === 'dark'

  const srcToUse = isDark && darkSrc ? darkSrc : src
  const mobileSrcToUse = isDark && mobileDarkSrc ? mobileDarkSrc : mobileSrc

  return (
    <picture>
      {/* 1 — mobile, dark */}
      {darkFromMobile && (
        <source
          media="(max-width: 767px) and (prefers-color-scheme: dark)"
          srcSet={buildSrcSet(darkFromMobile)}
          sizes={mobileSizes}
        />
      )}

      {/* 2 — mobile, light */}
      {lightFromMobile && (
        <source
          media="(max-width: 767px)"
          srcSet={buildSrcSet(lightFromMobile)}
          sizes={mobileSizes}
        />
      )}

      {/* 3 — desktop, dark */}
      {darkFromDesktop && (
        <source
          media="(prefers-color-scheme: dark)"
          srcSet={buildSrcSet(darkFromDesktop)}
          sizes={desktopSizes}
        />
      )}

      {/* 4 — desktop, light */}
      {lightFromDesktop && <source srcSet={buildSrcSet(lightFromDesktop)} sizes={desktopSizes} />}

      <NextImage
        alt={alt || altFromProps || ''}
        src={primaryURL}
        fill={fill}
        width={!fill ? width : undefined}
        height={!fill ? height : undefined}
        placeholder={width && width >= 40 ? 'blur' : 'empty'}
        blurDataURL={blurhash || placeholderBlur}
        priority={priority}
        quality={100}
        loading={loading}
        sizes={sizes}
        className={cn(imgClassName)}
      />
    </picture>
  )
}
