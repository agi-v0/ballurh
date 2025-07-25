import { useEffect, useState } from 'react'

type Breakpoint = 'mobile' | 'tablet' | 'desktop'

const BREAKPOINTS = {
  mobile: 0,
  tablet: 640,
  desktop: 1024,
} as const

export const useBreakpoint = (): Breakpoint => {
  const [breakpoint, setBreakpoint] = useState<Breakpoint>('mobile')

  useEffect(() => {
    const checkBreakpoint = () => {
      const width = window.innerWidth
      if (width >= BREAKPOINTS.desktop) {
        setBreakpoint('desktop')
      } else if (width >= BREAKPOINTS.tablet) {
        setBreakpoint('tablet')
      } else {
        setBreakpoint('mobile')
      }
    }

    // Check on mount and add listener
    checkBreakpoint()
    window.addEventListener('resize', checkBreakpoint)

    // Cleanup
    return () => window.removeEventListener('resize', checkBreakpoint)
  }, [])

  return breakpoint
}
