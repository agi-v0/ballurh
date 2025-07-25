import type { Field, TextField } from 'payload'
import { ComponentType } from 'react'

export const iconPickerField = (
  options?: {
    icons?: Record<string, string | ComponentType>
  } & Partial<TextField>,
): Field => {
  const { icons, ...rest } = options || {}

  return {
    ...rest,
    name: rest?.name || 'iconPicker',
    type: 'text',
    admin: {
      ...rest?.admin,
      components: {
        ...rest?.admin?.components,
        Field: {
          clientProps: {
            icons: icons,
          },
          path: '@/fields/iconPickerField/iconPicker#IconPickerFieldComponent',
        },
      },
    },
    label: rest?.label || 'Icon Picker',
  } as TextField
}
