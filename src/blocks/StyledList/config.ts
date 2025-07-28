import { iconPickerField } from '@/fields/iconPickerField'
import type { Block } from 'payload'
import remixIcons from '@/fields/iconPickerField/remix-icons.json'

export const StyledList: Block = {
  slug: 'styledListBlock',
  interfaceName: 'StyledListBlock',
  dbName: 'styledListBlock',
  labels: {
    singular: 'Styled List',
    plural: 'Styled Lists',
  },
  fields: [
    {
      name: 'listStyle',
      type: 'select',
      defaultValue: 'bullet',
      options: [
        {
          label: 'Bullets',
          value: 'bullet',
        },
        {
          label: 'Numbers',
          value: 'numbered',
        },
        {
          label: 'Icons',
          value: 'icons',
        },
      ],
    },
    {
      name: 'items',
      type: 'array',
      required: true,
      minRows: 1,
      fields: [
        {
          name: 'text',
          type: 'text',
          required: true,
          localized: true,
        },
        iconPickerField({
          name: 'icon',
          label: 'Icon',
          icons: remixIcons,
          admin: {
            condition: (data, siblingData, { blockData }) => blockData.listStyle === 'icons',
            description:
              'Select an icon from the Remix icon library. You can preview all available icons at https://remixicon.com/',
          },
        }),
      ],
    },
  ],
}
