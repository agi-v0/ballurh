import { blockHeader } from '@/components/BlockHeader/config'
import { logos } from '@/fields/logos'
import { stats } from '@/fields/stats'
import { Block } from 'payload'

export const MetricsBlock: Block = {
  slug: 'metricsBlock',
  labels: {
    singular: 'Metrics',
    plural: 'Metrics',
  },
  interfaceName: 'MetricsBlock',
  dbName: 'metricsBlock',
  fields: [
    blockHeader,
    {
      name: 'type',
      type: 'select',
      defaultValue: '01',
      required: true,
      options: [
        { label: '01 - Grid', value: '01' },
        { label: '02 - Grid with Image', value: '02' },
        { label: '03 - Table', value: '03' },
      ],
    },
    {
      name: 'blockImage',
      type: 'group',
      label: false,
      admin: {
        hideGutter: true,
        condition: (data, siblingData) => ['02'].includes(siblingData.type),
      },
      fields: [
        {
          name: 'media',
          type: 'upload',
          relationTo: 'media',
          label: 'Media',
        },
      ],
      localized: true,
    },

    stats(),

    {
      name: 'table',
      type: 'group',
      label: 'Table',
      localized: true,
      admin: {
        condition: (data, siblingData) => siblingData.type === '03',
        description: 'Create a structured table with defined columns and rows',
      },
      fields: [
        {
          name: 'title',
          type: 'text',
          label: 'Table Title',
          localized: true,
        },
        {
          name: 'headers',
          type: 'array',
          label: 'Table Headers',
          fields: [
            {
              name: 'header',
              type: 'text',
              required: true,
              localized: true,
            },
            {
              name: 'width',
              type: 'select',
              options: [
                { label: 'Auto', value: 'auto' },
                { label: 'Small (20%)', value: 'w-1/5' },
                { label: 'Medium (33%)', value: 'w-1/3' },
                { label: 'Large (50%)', value: 'w-1/2' },
                { label: 'Extra Large (66%)', value: 'w-2/3' },
              ],
              required: true,
              defaultValue: 'auto',
            },
          ],
          admin: {
            description: 'Define the column headers for your table',
          },
        },
        {
          name: 'rows',
          type: 'array',
          label: 'Table Rows',
          fields: [
            {
              name: 'cells',
              type: 'array',
              label: 'Row Cells',
              fields: [
                {
                  name: 'content',
                  type: 'text',
                  localized: true,
                  admin: {
                    description:
                      'Add "check" or "close" to show a checkmark or x in the cell. Add a solution slug to show a solution badge in the cell.',
                  },
                },
                {
                  name: 'isHeader',
                  type: 'checkbox',
                  label: 'Is Header Cell',
                  defaultValue: false,
                },
              ],
              admin: {
                description: 'Add content for each cell in this row.',
              },
            },
            {
              name: 'children',
              type: 'array',
              label: 'Nested Rows',
              fields: [
                {
                  name: 'cells',
                  type: 'array',
                  label: 'Child Row Cells',
                  fields: [
                    {
                      name: 'content',
                      type: 'text',
                      localized: true,
                      admin: {
                        description:
                          'Add "check" or "close" to show a checkmark or x in the cell. Add a solution slug to show a solution badge in the cell.',
                      },
                    },
                  ],
                },
              ],
              admin: {
                description: 'Add nested/child rows that will be collapsible under this row.',
              },
            },
            {
              name: 'isExpandable',
              type: 'checkbox',
              label: 'Is Expandable',
              defaultValue: false,
              admin: {
                description: 'Check if this row should show expand/collapse functionality',
              },
            },
          ],
          admin: {
            description: 'Add rows to your table with structured cell data',
          },
        },
        {
          name: 'styling',
          type: 'group',
          label: 'Table Styling',
          fields: [
            {
              name: 'striped',
              type: 'checkbox',
              label: 'Striped Rows',
              defaultValue: true,
            },
            {
              name: 'bordered',
              type: 'checkbox',
              label: 'Show Borders',
              defaultValue: true,
            },
            {
              name: 'compact',
              type: 'checkbox',
              label: 'Compact Layout',
              defaultValue: false,
            },
          ],
        },
      ],
    },
    {
      name: 'enableLogos',
      type: 'checkbox',
    },
    {
      type: 'collapsible',
      label: 'Logos',
      admin: {
        initCollapsed: true,
        condition: (data, siblingData) => siblingData.enableLogos,
      },
      fields: [
        {
          name: 'logos',
          label: false,
          type: 'group',
          admin: {
            hideGutter: true,
          },
          fields: [
            {
              name: 'headline',
              type: 'text',
              label: 'Headline',
              required: false,
              localized: true,
              admin: {
                placeholder: 'e.g., As Featured In, Our Partners',
              },
            },
            logos({}),
          ],
        },
      ],
    },
  ],
}
