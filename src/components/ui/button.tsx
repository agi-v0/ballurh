import { cn } from '@/utilities/ui'
import { Slot as SlotPrimitive } from 'radix-ui'
import { type VariantProps, cva } from 'class-variance-authority'
import * as React from 'react'

const buttonVariants = cva(
  'inline-flex items-center justify-center gap-2 rounded-xl text-sm font-medium whitespace-nowrap ring-offset-background transition-colors focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 focus-visible:outline-hidden disabled:pointer-events-none disabled:opacity-50',
  {
    defaultVariants: {
      size: 'default',
      variant: 'primary',
      color: 'neutral',
    },
    variants: {
      size: {
        clear: '',
        default: 'h-10 px-4 py-2',
        icon: 'h-10 w-10',
        lg: 'h-12 rounded-xl px-5 text-(length:--text-main)',
        sm: 'h-9 px-3',
      },
      variant: {
        primary: '',
        secondary: '',
        tertiary: '',
        ghost: '',
        link: '',
        destructive: '',
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
        className:
          'bg-brand text-base-primary hover:bg-teal-950 hover:text-white active:bg-teal-950 active:text-white',
      },
      {
        color: 'brand',
        variant: 'secondary',
        className:
          'border border-border bg-transparent text-base-secondary hover:bg-background-neutral',
      },
      {
        color: 'brand',
        variant: 'tertiary',
        className: 'bg-teal-500/10 text-teal-600 hover:bg-teal-500/30 active:bg-teal-500/30',
      },
      {
        color: 'brand',
        variant: 'ghost',
        className: 'text-teal-600 hover:bg-teal-500/10 active:bg-teal-500/10',
      },
      {
        color: 'brand',
        variant: 'link',
        className: 'p-0 text-teal-600 hover:text-teal-600/90 active:text-teal-600/90',
      },
      {
        color: 'neutral',
        variant: 'primary',
        className:
          'border bg-teal-950 text-white shadow-xs hover:bg-brand hover:text-base-primary active:bg-brand',
      },
      {
        color: 'neutral',
        variant: 'secondary',
        className:
          'border border-border bg-transparent text-base-secondary hover:bg-background-neutral active:bg-background-neutral',
      },
      {
        color: 'neutral',
        variant: 'tertiary',
        className: 'bg-neutral/10 text-base-secondary hover:bg-neutral/20 active:bg-neutral/20',
      },
      {
        color: 'neutral',
        variant: 'ghost',
        className: 'text-base-secondary hover:bg-neutral/10 active:bg-neutral/10',
      },
      {
        color: 'neutral',
        variant: 'link',
        className:
          'p-0 text-base-secondary hover:text-base-secondary/90 active:text-base-secondary/90',
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
  return (
    <Comp
      className={cn(buttonVariants({ className, size, variant, color }))}
      ref={ref}
      {...props}
    />
  )
}

export { Button, buttonVariants }
