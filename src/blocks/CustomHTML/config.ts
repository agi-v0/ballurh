import type { Block } from 'payload'
import { blockHeader } from '@/components/BlockHeader/config'

export const CustomHtmlBlock: Block = {
  slug: 'customHtmlBlock',
  labels: {
    singular: 'Custom HTML',
    plural: 'Custom HTML',
  },
  interfaceName: 'CustomHtmlBlock',
  dbName: 'customHtmlBlock',
  fields: [
    blockHeader,
    {
      name: 'htmlContent',
      label: 'HTML Content',
      type: 'code',
      required: true,
      admin: {
        language: 'html',
        description: 'Enter the custom HTML code to be rendered on the page.',
      },
    },
  ],
}
