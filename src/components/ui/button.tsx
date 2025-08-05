import { cn } from '@/utilities/ui'
import { Slot as SlotPrimitive } from 'radix-ui'
import { type VariantProps, cva } from 'class-variance-authority'
import * as React from 'react'

const buttonVariants = cva(
  'inline-flex items-center justify-center gap-2 rounded-xl text-sm font-medium whitespace-nowrap ring-offset-background transition-colors focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 focus-visible:outline-hidden disabled:pointer-events-none disabled:opacity-50',
  {
    defaultVariants: {
      size: 'default',
      variant: 'default',
      color: 'neutral',
    },
    variants: {
      size: {
        clear: '',
        default: 'h-10 px-4 py-2',
        icon: 'h-10 w-10',
        lg: 'h-12 rounded-xl px-5 text-main',
        sm: 'h-9 px-3',
      },
      variant: {
        default: '',
        destructive: '',
        ghost: '',
        link: '',
        outline: '',
        primary: '',
        secondary: '',
        tertiary: '',
      },
      color: {
        neutral: '',
        brand: '',
      },
    },
    compoundVariants: [
      {
        color: 'brand',
        variant: 'primary',
        className: 'bg-brand text-white hover:bg-brand/90',
      },
      {
        color: 'brand',
        variant: 'secondary',
        className: 'border-input bg-transparent text-base-secondary hover:bg-background-neutral',
      },
      {
        color: 'brand',
        variant: 'tertiary',
        className: 'bg-brand/10 text-brand-secondary hover:bg-brand/30',
      },
      {
        color: 'brand',
        variant: 'ghost',
        className: 'text-brand-secondary hover:bg-brand/10',
      },
      {
        color: 'brand',
        variant: 'link',
        className: 'p-0 text-brand-primary hover:text-brand-primary/90',
      },
      {
        color: 'neutral',
        variant: 'primary',
        className:
          'border bg-teal-950 text-white shadow-xs hover:bg-orange-500 hover:text-base-primary',
      },
      {
        color: 'neutral',
        variant: 'secondary',
        className:
          'border-input bg-transparent text-base-secondary hover:border-neutral/20 hover:bg-background-neutral',
      },
      {
        color: 'neutral',
        variant: 'tertiary',
        className: 'bg-neutral/10 text-base-secondary hover:bg-neutral/30',
      },
      {
        color: 'neutral',
        variant: 'ghost',
        className: 'text-base-secondary hover:bg-neutral/10',
      },
      {
        color: 'neutral',
        variant: 'link',
        className: 'p-0 text-base-secondary hover:text-base-secondary/90',
      },
    ],
  },
)

export interface ButtonProps
  extends Omit<React.ButtonHTMLAttributes<HTMLButtonElement>, 'color'>,
    VariantProps<typeof buttonVariants> {
  asChild?: boolean
  ref?: React.Ref<HTMLButtonElement>
}

const Button: React.FC<ButtonProps> = ({
  asChild = false,
  className,
  size,
  variant,
  ref,
  color = 'neutral',
  ...props
}) => {
  const Comp = asChild ? SlotPrimitive.Slot : 'button'
  return <Comp className={cn(buttonVariants({ className, size, variant }))} ref={ref} {...props} />
}

export { Button, buttonVariants }
