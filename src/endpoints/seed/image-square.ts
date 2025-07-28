import type { Media } from '@/payload-types'

export const imageSquare: Omit<Media, 'createdAt' | 'id' | 'updatedAt'> = {
  alt: 'Marn placeholder square',
}
