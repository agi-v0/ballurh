import deepMerge from '@/utilities/deepMerge'
import type { Field } from 'payload'

type StatsType = (options?: { overrides?: Partial<Field> }) => Field

export const stats: StatsType = ({ overrides } = {}) => {
  const generatedStatsField: Field = {
    name: 'stats',
    type: 'array',
    fields: [
      {
        type: 'row',
        fields: [
          {
            name: 'label',
            type: 'text',
            // required: true,
            admin: {
              width: '50%',
              description: 'Label for the stat',
            },
            localized: true,
          },
          {
            name: 'value',
            type: 'text',
            localized: true,

            // required: true,
            admin: {
              width: '50%',
              description: 'Value for the stat. Example: 85% or 250 SAR',
            },
          },
        ],
      },
      {
        type: 'select',
        label: 'Indicator',
        name: 'indicator',
        options: [
          { label: 'Increase', value: 'increase' },
          { label: 'Decrease', value: 'decrease' },
          { label: 'None', value: 'noChange' },
        ],
        defaultValue: 'noChange',
        admin: {
          description: 'Whether the value is an increase or decrease',
        },
      },
    ],
  }
  return deepMerge(generatedStatsField, overrides)
}
