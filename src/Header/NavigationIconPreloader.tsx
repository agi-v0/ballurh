import Image from 'next/image'
import type { Header as HeaderType } from '@/payload-types'
import React from 'react'

// Component to preload all navigation images
export function NavigationImagePreloader({ tabs }: { tabs: HeaderType['tabs'] }) {
  const imageUrls = React.useMemo(() => {
    const urls: string[] = []

    if (!tabs) return urls

    for (const tab of tabs) {
      if (tab.navItems) {
        for (const navItem of tab.navItems) {
          if (navItem.listLinks?.links) {
            for (const subLink of navItem.listLinks.links) {
              if (
                subLink.link.type === 'reference' &&
                subLink.link.reference?.value &&
                typeof subLink.link.reference.value === 'object'
              ) {
                const referenceValue = subLink.link.reference.value as any
                if (referenceValue.icon?.url) {
                  urls.push(referenceValue.icon.url)
                }
              }
            }
          }
        }
      }
    }

    return urls
  }, [tabs])

  return (
    <div className="sr-only" aria-hidden="true">
      {imageUrls.map((url, index) => (
        <Image
          key={`preload-${index}`}
          src={url}
          alt=""
          width={40}
          height={40}
          sizes="40px"
          priority
          style={{ display: 'none' }}
        />
      ))}
    </div>
  )
}
