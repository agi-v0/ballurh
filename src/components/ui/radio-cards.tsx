'use client'

import * as React from 'react'
import { RadioGroup, RadioGroupItem } from '@/components/ui/radio-group'
import { Card } from '@/components/ui/card'
import { cn } from '@/utilities/ui'

export interface RadioCardGroupProps extends React.ComponentPropsWithoutRef<typeof RadioGroup> {}

export const RadioCardGroup: React.FC<RadioCardGroupProps> = ({ className, ...props }) => {
  return <RadioGroup className={cn('grid gap-4', className)} {...props} />
}
RadioCardGroup.displayName = 'RadioCardGroup'

export interface RadioCardProps extends React.ComponentPropsWithoutRef<typeof RadioGroupItem> {
  children: React.ReactNode
}

export const RadioCard: React.FC<RadioCardProps> = ({ className, children, ...props }) => {
  return (
    <RadioGroupItem asChild {...props}>
      <Card
        className={cn(
          'cursor-pointer rounded-md border border-input p-4 focus-within:ring-2 focus-within:ring-ring focus-within:ring-offset-2',
          'data-[state=checked]:border-primary data-[state=checked]:bg-primary/10',
          className,
        )}
      >
        {children}
      </Card>
    </RadioGroupItem>
  )
}
RadioCard.displayName = 'RadioCard'
