import type { Block, Field } from 'payload'

import { blockHeader } from '@/components/BlockHeader/config'

const fields: Field[] = [
  {
    name: 'type',
    type: 'select',
    options: [
      { value: '01', label: 'Testimonials Block 01 (Center)' },
      { value: '02', label: 'Testimonials Block 02 (Align start)' },
      { value: '03', label: 'Testimonials Block 03 (Carousel) [NOT READY]' },
      // Add other layout options here later (e.g., Slider)
    ],
    required: true,
    defaultValue: '01',
  },
  {
    name: 'bgColor',
    label: 'Background color',
    type: 'select',
    options: [
      { value: 'lightTeal', label: 'Light teal' },
      { value: 'violet', label: 'Violet' },
      { value: 'gray', label: 'Gray' },
      { value: 'inverted', label: 'Inverted' },
      // Add other layout options here later (e.g., Slider)
    ],
    required: true,
    defaultValue: 'gray',
  },
  {
    name: 'selectedTestimonials',
    type: 'relationship',
    label: 'Select Testimonials',
    relationTo: 'customers',
    hasMany: true,
    admin: {
      description:
        'Select specific testimonials to display. Leave blank to show the 5 most recently updated testimonials.',
    },
    defaultValue: async ({ req }) => {
      const { docs } = await req.payload.find({
        collection: 'customers',
        limit: 10,
        sort: 'updatedAt',
      })

      return docs.map((customer) => customer.id)
    },
  },
]

export const TestimonialsBlock: Block = {
  slug: 'testimonialsBlock',
  interfaceName: 'TestimonialsBlock',
  labels: {
    singular: 'Testimonials',
    plural: 'Testimonials',
  },
  fields: [
    blockHeader,
    {
      type: 'group',
      label: 'Block Content',
      fields,
    },
  ],
  dbName: 'testimonialsBlock',
}
