import type { Block } from 'payload'
import { blockHeader } from '@/components/BlockHeader/config'

export const TeamBlock: Block = {
  slug: 'teamBlock',
  labels: {
    singular: 'Team',
    plural: 'Team',
  },
  interfaceName: 'TeamBlock',
  dbName: 'teamBlock',
  fields: [
    blockHeader,
    {
      type: 'group',
      label: 'Block Content',
      fields: [
        {
          name: 'team',
          type: 'array',
          label: 'Team members',
          fields: [
            {
              name: 'name',
              type: 'text',

              localized: true,
            },
            {
              name: 'position',
              label: 'Job title',
              type: 'text',
              localized: true,
            },
            {
              name: 'bio',
              type: 'text',
              localized: true,
            },

            {
              name: 'image',
              type: 'upload',
              relationTo: 'media',
              label: 'Image',
            },

            {
              label: 'Social media',
              type: 'collapsible',
              fields: [
                {
                  type: 'group',
                  label: false,
                  name: 'social',
                  fields: [
                    {
                      name: 'linkedin',
                      type: 'text',
                    },
                    {
                      name: 'x',
                      type: 'text',
                    },
                  ],
                },
              ],
            },
          ],
        },
      ],
    },
  ],
}
