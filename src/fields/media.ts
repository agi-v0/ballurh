import deepMerge from '@/utilities/deepMerge'
import type { Field } from 'payload'

type MediaType = (options?: { mediaOverrides?: Partial<Field> }) => Field
type MediaGroupType = (options?: {
  mediaOverrides?: Partial<Field>
  overrides?: Partial<Field>
}) => Field

const media: MediaType = ({ mediaOverrides = {} } = {}) => {
  const generatedMediaField: Field = {
    name: 'light',
    type: 'upload',
    relationTo: 'media',
  }
  return deepMerge(generatedMediaField, mediaOverrides)
}

export const mediaGroup: MediaGroupType = ({ mediaOverrides, overrides = {} } = {}) => {
  const generatedMediaGroupField: Field = {
    name: 'media',
    label: false,
    type: 'group',
    admin: {
      hideGutter: true,
    },
    fields: [
      media({ mediaOverrides: { name: 'light', ...(mediaOverrides || {}) } }),
      media({ mediaOverrides: { name: 'dark', ...(mediaOverrides || {}) } }),
    ],
  }
  return deepMerge(generatedMediaGroupField, overrides)
}
