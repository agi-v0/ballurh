'use client'
import { DirectionProvider } from '@radix-ui/react-direction'

export const ClientProviders: React.FC<{
  children: React.ReactNode
}> = ({ children }) => {
  return <DirectionProvider dir="rtl">{children}</DirectionProvider>
}
