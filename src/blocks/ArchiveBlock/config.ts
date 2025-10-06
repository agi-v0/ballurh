import type { Block } from 'payload'

import { blockHeader } from '@/components/BlockHeader/config'

export const ArchiveBlock: Block = {
  slug: 'archiveBlock',
  labels: {
    singular: 'Archive',
    plural: 'Archives',
  },
  interfaceName: 'ArchiveBlock',
  dbName: 'archiveBlock',
  fields: [
    blockHeader,
    {
      type: 'group',
      label: 'Block Content',
      fields: [
        {
          name: 'populateBy',
          type: 'select',
          defaultValue: 'collection',
          options: [
            {
              label: 'Collection',
              value: 'collection',
            },
            {
              label: 'Individual Selection',
              value: 'selection',
            },
          ],
        },
        {
          name: 'relationTo',
          type: 'select',
          admin: {
            condition: (_, siblingData) => siblingData.populateBy === 'collection',
          },
          defaultValue: 'blog',
          label: 'Collections To Show',
          options: [
            {
              label: 'Posts',
              value: 'blog',
            },
            {
              label: 'News',
              value: 'news',
            },
          ],
        },
        {
          name: 'categories',
          type: 'relationship',
          admin: {
            condition: (_, siblingData) => siblingData.populateBy === 'collection',
          },
          hasMany: true,
          label: 'Categories To Show',
          relationTo: 'categories',
        },
        {
          name: 'limit',
          type: 'number',
          admin: {
            condition: (_, siblingData) => siblingData.populateBy === 'collection',
            step: 1,
          },
          defaultValue: 10,
          label: 'Limit',
        },
        {
          name: 'selectedDocs',
          type: 'relationship',
          admin: {
            condition: (_, siblingData) => siblingData.populateBy === 'selection',
          },
          hasMany: true,
          label: 'Selection',
          relationTo: ['blog-posts'],
        },
      ],
    },
  ],
}
