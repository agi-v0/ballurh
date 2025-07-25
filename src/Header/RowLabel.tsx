'use client'
import { Header } from '@/payload-types'
import { RowLabelProps, useRowLabel } from '@payloadcms/ui'

export const RowLabel: React.FC<RowLabelProps> = () => {
  const data = useRowLabel<NonNullable<NonNullable<Header['tabs']>[number]['navItems']>[number]>()

  const label =
    data?.data?.defaultLink?.link?.label || data?.data?.style
      ? `Nav item ${data.rowNumber !== undefined ? data.rowNumber + 1 : ''}: ${data?.data?.defaultLink?.link?.label || data?.data?.style}`
      : 'Row'

  return <div>{label}</div>
}
