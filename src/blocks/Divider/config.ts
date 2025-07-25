import type { Block } from 'payload'

export const DividerBlock: Block = {
  slug: 'dividerBlock',
  labels: {
    singular: 'Divider',
    plural: 'Dividers',
  },
  interfaceName: 'DividerBlock',
  dbName: 'dividerBlock',
  fields: [
    {
      name: 'size',
      type: 'select',
      options: [
        { value: 'small', label: 'Small' },
        { value: 'medium', label: 'Medium' },
        { value: 'large', label: 'Large' },
      ],
      defaultValue: 'small',
      required: true,
    },
    {
      name: 'enableDivider',
      type: 'checkbox',
      defaultValue: true,
      required: true,
    },
  ],
}
