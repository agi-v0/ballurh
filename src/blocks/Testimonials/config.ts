import type { Block, Field } from 'payload'

import { blockHeader } from '@/components/BlockHeader/config'

const fields: Field[] = [
  {
    name: 'type',
    type: 'select',
    options: [
      { value: '01', label: 'Testimonials Modular Grid (Hero) [NOT READY]' },
      { value: '02', label: 'Testimonials Block 01 (Featured)' },
      { value: '03', label: 'Testimonials Block 02 (Carousel)' },
      // Add other layout options here later (e.g., Slider)
    ],
    required: true,
    defaultValue: '01',
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
  fields: [blockHeader, ...fields],
  dbName: 'testimonialsBlock',
}
