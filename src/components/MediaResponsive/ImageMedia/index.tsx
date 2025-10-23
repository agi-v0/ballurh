import type { StaticImageData } from 'next/image'

import { cn } from '@/utilities/ui'
import NextImage, { getImageProps } from 'next/image'
import React from 'react'

import type { Props as MediaProps } from '../types'

import { cssVariables } from '@/cssVariables'
import { getMediaUrl } from '@/utilities/getMediaUrl'
import { Media } from '@/payload-types'

const { breakpoints } = cssVariables

// A base64 encoded image to use as a placeholder while the image is loading
const placeholderBlur =
  'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAAACXBIWXMAAAsTAAALEwEAmpwYAAABHElEQVR4nGO4dfsuTRHDqAW3Ry24O2rBrUFlwYWLl4+fOI2MqGnBk6fP581frKCkoq6po66po6CkYufgdOHiZWpa0N07gZGVU1BYTFBYjJGVU1NLl2oWXLh4+d27D3mFxYLCYpJSspJSsoLCYiZmllQIoidPn0PQli3b1TV1hITF4Ra4eXg9efqcUguWrVjZ2taRlJyupKwGd76klCwzO29JaQWlFly4eFlH3xgS7nCj4Wj33v1UsMDQ1AzTdEZWzozMHIKmk2kBIyunm4cXwfRDtAVGptz8wpCkCbEpKTn94sWrRCY/wha4uXsqKKmYmFm4uXuWlFZs2bqTmJAhIRVdABcPFy5ehqfXoVzY3Rq14PaoBbdGLbhNsgUAf0Sx5YDnbO4AAAAASUVORK5CYII='

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

  let width: number | undefined
  let height: number | undefined
  let alt = altFromProps
  // NOTE: legacy props `src` / `resource` are still accepted for backward compatibility
  let src: StaticImageData | string = srcFromProps || ''
  // These are retained only for backward-compat: if the caller provides explicit `src` / `resource`
  // we’ll still honour them, otherwise the new `primary` logic below is used.
  let blurhash: string = placeholderBlur

  const { light: lightFromDesktop, dark: darkFromDesktop } = media?.desktop || {}
  const { light: lightFromMobile, dark: darkFromMobile } = media?.mobile || {}

  //temporarily switch off compatibility with old resource type
  if (!src && resource && typeof resource === 'object') {
    const {
      alt: altFromResource,
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
  }

  const primary = (media?.desktop?.light ??
    media?.desktop?.dark ??
    media?.mobile?.light ??
    media?.mobile?.dark ??
    resource) as Media

  width = primary?.width ?? undefined
  height = primary?.height ?? undefined
  alt = altFromProps ?? primary?.alt ?? ''
  blurhash = primary?.blurhash ?? placeholderBlur
  const primaryURL = getMediaUrl(primary?.url, primary?.updatedAt) ?? src

  // If no primary URL is available we can’t render anything meaningful
  if (!primaryURL) return null

  const hasArtDirectionSources = Boolean(darkFromMobile || lightFromMobile || darkFromDesktop)

  const shouldPreload = Boolean(priority && !hasArtDirectionSources)
  const fetchPriorityValue = shouldPreload ? 'high' : undefined
  const loading = loadingFromProps ?? (shouldPreload ? 'eager' : 'lazy')

  // NOTE: this is used by the browser to determine which image to download at different screen sizes
  const sizes = sizeFromProps
    ? sizeFromProps
    : `${Object.entries(breakpoints)
        .sort(([, a], [, b]) => a - b)
        .map(([, value]) => `(max-width: ${value}px) 100vw`)
        .join(', ')}, 100vw`

  const resolveMedia = (variant?: Media | string | null) =>
    typeof variant === 'object' && variant ? variant : undefined

  const buildOptimizedSource = (
    variant: Media | string | null | undefined,
    mediaQuery: string | undefined,
    key: string,
  ) => {
    const resolved = resolveMedia(variant)
    if (!resolved?.url || !resolved.width || !resolved.height) return null

    const { props: imageProps } = getImageProps({
      alt: resolved.alt || alt || '',
      src: getMediaUrl(resolved.url, resolved.updatedAt),
      width: resolved.width,
      height: resolved.height,
      sizes,
    })

    return (
      <source key={key} media={mediaQuery} srcSet={imageProps.srcSet} sizes={imageProps.sizes} />
    )
  }

  // Fallback behaviour for explicit `src` passed in props (rare in new code paths)
  // Currently unused but retained for backward compatibility purposes.
  return (
    <picture>
      {/* 1 — mobile, dark */}
      {buildOptimizedSource(
        darkFromMobile,
        '(max-width: 767px) and (prefers-color-scheme: dark)',
        'mobile-dark',
      )}

      {/* 2 — mobile, light */}
      {buildOptimizedSource(lightFromMobile, '(max-width: 767px)', 'mobile-light')}

      {/* 3 — desktop, dark */}
      {buildOptimizedSource(darkFromDesktop, '(prefers-color-scheme: dark)', 'desktop-dark')}

      {/* 4 — desktop, light */}
      {buildOptimizedSource(lightFromDesktop, undefined, 'desktop-light')}
      <NextImage
        alt={alt || altFromProps || ''}
        src={primaryURL}
        fill={fill}
        width={!fill ? width : undefined}
        height={!fill ? height : undefined}
        placeholder={width && width >= 40 ? 'blur' : 'empty'}
        blurDataURL={blurhash || placeholderBlur}
        priority={shouldPreload}
        fetchPriority={fetchPriorityValue}
        loading={loading}
        sizes={sizes}
        className={cn(imgClassName)}
      />
    </picture>
  )
}
