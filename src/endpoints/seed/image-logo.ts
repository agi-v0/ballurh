import type { Media } from '@/payload-types'

export const imageLogo: Omit<Media, 'createdAt' | 'id' | 'updatedAt'> = {
  alt: 'Marn Logo',
}
