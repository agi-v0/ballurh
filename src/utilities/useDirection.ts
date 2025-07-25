'use client'

import { useEffect, useState } from 'react'

type Direction = 'ltr' | 'rtl'

export function useDirection(): Direction {
  const [direction, setDirection] = useState<Direction>('ltr')

  useEffect(() => {
    const dir = document.documentElement.dir || 'ltr'
    setDirection(dir as Direction)

    // Optional: Observe changes to the dir attribute
    // const observer = new MutationObserver((mutations) => {
    //   mutations.forEach((mutation) => {
    //     if (mutation.type === 'attributes' && mutation.attributeName === 'dir') {
    //       setDirection((document.documentElement.dir || 'ltr') as Direction)
    //     }
    //   })
    // })

    // observer.observe(document.documentElement, {
    //   attributes: true,
    // })

    // return () => observer.disconnect()
  }, [])

  return direction
}
