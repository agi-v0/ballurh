'use client'
import React from 'react'
import { cn } from '@/utilities/ui'
import { Button } from '@/components/ui/button'

interface AnimatedToggleProps {
  isOpen: boolean
  onClick: () => void
  className?: string
  size?: number
}

export const AnimatedToggle: React.FC<AnimatedToggleProps> = ({
  isOpen,
  onClick,
  className,
  size = 24,
}) => {
  const shift = (5 / 24) * 100
  return (
    <Button
      variant="tertiary"
      size="icon"
      color="neutral"
      onClick={onClick}
      className={cn(className)}
      aria-expanded={isOpen}
      aria-label={isOpen ? 'Close menu' : 'Open menu'}
    >
      <svg
        width={size}
        height={size}
        viewBox="0 0 24 24"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
      >
        {/* Top line */}
        <path
          d="M4 7L20 7"
          style={{
            transformBox: 'view-box', // make percentages relative to the 24×24 view-box
            transformOrigin: '50% 50%', // centre of the icon
            transform: isOpen
              ? `rotate(45deg) translateY(${shift}%)` // NOTE: translate is **last** → applied **first**
              : 'rotate(0deg) translateY(0)',
            transition: 'transform .2s ease',
          }}
          stroke="currentColor"
          strokeWidth={2}
          strokeLinecap="round"
        />
        {/* Middle line */}
        <path
          d="M4 12L20 12"
          className={cn(
            'transition-all duration-200 ease-in-out',
            isOpen ? 'opacity-0' : 'opacity-100',
          )}
          stroke="currentColor"
          strokeWidth={2}
          strokeLinecap="round"
        />
        {/* Bottom line */}
        <path
          d="M4 17L20 17"
          style={{
            transformBox: 'view-box',
            transformOrigin: '50% 50%',
            transform: isOpen
              ? `rotate(-45deg) translateY(-${shift}%)`
              : 'rotate(0deg) translateY(0)',
            transition: 'transform .2s ease ',
            transitionDelay: '100ms',
          }}
          stroke="currentColor"
          strokeWidth={2}
          strokeLinecap="round"
        />
      </svg>
    </Button>
  )
}
