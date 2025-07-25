import { blockHeader } from '@/components/BlockHeader/config'
import { logos } from '@/fields/logos'

import type { Block } from 'payload'

export const LogosBlock: Block = {
  slug: 'logosBlock',
  labels: {
    singular: 'Logos',
    plural: 'Logos',
  },
  interfaceName: 'LogoBlock',
  dbName: 'logosBlock',
  fields: [
    blockHeader,
    {
      name: 'type',
      type: 'select',
      required: true,
      options: [
        { value: '01', label: '01 - Infinite Slider' },
        { value: '02', label: '02 - Grid (12 Logos)' },
        { value: '03', label: '03 - Grid (24 Logos)' },
      ],
    },
    logos(),
  ],
}
