import React from 'react'
import { DividerBlock } from '@/payload-types'

export const RenderDividerBlock: React.FC<DividerBlock> = (props) => {
  const { size, enableDivider } = props
  return (
    <div
      data-size={size}
      className="container data-[size=large]:py-[calc(var(--spacing-space-7)*3)] data-[size=medium]:py-[calc(var(--spacing-space-7)*2)] data-[size=small]:py-space-7"
    >
      {enableDivider && <hr className="w-full border-border" />}
    </div>
  )
}
