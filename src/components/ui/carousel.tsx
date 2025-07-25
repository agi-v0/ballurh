'use client'

import {
  Children,
  ReactNode,
  createContext,
  useContext,
  useEffect,
  useMemo,
  useRef,
  useState,
} from 'react'
import { motion, Transition, useMotionValue } from 'motion/react'
import { cn } from '@/utilities/ui'
import { ChevronLeft, ChevronRight } from 'lucide-react'
import { useDirection } from '@/utilities/useDirection'
import { Button } from './button'

/** Tailwind breakpoint → min-width mapping */
const BREAKPOINTS: [string, number][] = [
  ['sm', 640],
  ['md', 768],
  ['lg', 1024],
  ['xl', 1280],
  ['2xl', 1536],
]

/** Hook: resolve slidesPerView (number or map) against current viewport */
function useSlidesPerView(slidesPerView: number | Record<string, number>): number {
  const [current, setCurrent] = useState<number>(
    typeof slidesPerView === 'number' ? slidesPerView : (Object.values(slidesPerView)[0] ?? 1),
  )

  useEffect(() => {
    let rafId: number | null = null

    function update() {
      let value: number

      if (typeof slidesPerView === 'number') {
        value = slidesPerView
      } else if (typeof window === 'undefined') {
        // SSR: fallback to smallest‐breakpoint value
        const entries = Object.entries(slidesPerView)
          .map(([key, val]) => {
            const bp = BREAKPOINTS.find(([b]) => b === key)
            return bp ? [bp[1], val] : null
          })
          .filter(Boolean) as [number, number][]
        entries.sort((a, b) => a[0] - b[0])
        value = entries[0]?.[1] ?? 1
      } else {
        const width = window.innerWidth
        const valid = Object.entries(slidesPerView)
          .map(([key, val]) => {
            const bp = BREAKPOINTS.find(([b]) => b === key)
            return bp ? [bp[0], bp[1], val] : null
          })
          .filter(Boolean) as [string, number, number][]
        valid.sort((a, b) => a[1] - b[1])

        if (valid.length === 0) {
          value = Object.values(slidesPerView)[0]
        } else {
          const matches = valid.filter(([, min]) => width >= min)
          if (matches.length > 0) {
            // pick the largest matching breakpoint
            value = matches[matches.length - 1][2]
          } else {
            // below smallest: fallback to smallest's value
            value = valid[0][2]
          }
        }
      }

      setCurrent(value)
    }
    function throttledUpdate() {
      if (rafId !== null) return
      rafId = requestAnimationFrame(() => {
        update()
        rafId = null
      })
    }
    update()
    window.addEventListener('resize', throttledUpdate)
    return () => {
      window.removeEventListener('resize', throttledUpdate)
      if (rafId !== null) cancelAnimationFrame(rafId)
    }
  }, [slidesPerView])

  return current
}

export type CarouselContextType = {
  index: number
  setIndex: (newIndex: number) => void
  itemsCount: number
  setItemsCount: (count: number) => void
  disableDrag: boolean
  slidesPerView: number
  pagesCount: number // derived
  prevDisabled: boolean // derived
  nextDisabled: boolean // derived
}

const CarouselContext = createContext<CarouselContextType | undefined>(undefined)

function useCarousel() {
  const ctx = useContext(CarouselContext)
  if (!ctx) {
    throw new Error('useCarousel must be used within a CarouselProvider')
  }
  return ctx
}

export type CarouselProviderProps = {
  children: ReactNode
  initialIndex?: number
  onIndexChange?: (newIndex: number) => void
  disableDrag?: boolean
  slidesPerView?: number | Record<string, number>
}

function CarouselProvider({
  children,
  initialIndex = 0,
  onIndexChange,
  disableDrag = false,
  slidesPerView = 1,
}: CarouselProviderProps) {
  const [index, setIndex] = useState(initialIndex)
  const [itemsCount, setItemsCount] = useState(0)
  const resolved = useSlidesPerView(slidesPerView)
  const pagesCount = useMemo(() => Math.max(itemsCount - resolved + 1, 1), [itemsCount, resolved])

  const handleSetIndex = (newIdx: number) => {
    setIndex(newIdx)
    onIndexChange?.(newIdx)
  }

  useEffect(() => {
    setIndex(initialIndex)
  }, [initialIndex])

  // Clamp index when pagesCount shrinks (e.g., slidesPerView grows)
  useEffect(() => {
    if (index + 1 > pagesCount) {
      handleSetIndex(Math.max(pagesCount - 1, 0))
    }
  }, [pagesCount, index])

  return (
    <CarouselContext.Provider
      value={{
        index,
        setIndex: handleSetIndex,
        itemsCount,
        setItemsCount,
        disableDrag,
        slidesPerView: resolved,
        pagesCount,
        prevDisabled: index === 0,
        nextDisabled: index + 1 === pagesCount,
      }}
    >
      {children}
    </CarouselContext.Provider>
  )
}

export type CarouselProps = {
  children: ReactNode
  className?: string
  initialIndex?: number
  index?: number
  onIndexChange?: (newIndex: number) => void
  disableDrag?: boolean
  /** Number or map of Tailwind breakpoints → slides per view */
  slidesPerView?: number | Record<string, number>
}

function Carousel({
  children,
  className,
  initialIndex = 0,
  index: externalIndex,
  onIndexChange,
  disableDrag = false,
  slidesPerView = 1,
}: CarouselProps) {
  const [internalIndex, setInternalIndex] = useState<number>(initialIndex)
  const isControlled = externalIndex !== undefined
  const currentIndex = isControlled ? externalIndex : internalIndex

  const handleIndexChange = (newIdx: number) => {
    if (!isControlled) setInternalIndex(newIdx)
    onIndexChange?.(newIdx)
  }

  return (
    <CarouselProvider
      initialIndex={currentIndex}
      onIndexChange={handleIndexChange}
      disableDrag={disableDrag}
      slidesPerView={slidesPerView}
    >
      <div className={cn('group/hover relative', className)}>{children}</div>
    </CarouselProvider>
  )
}

export type CarouselNavigationProps = {
  className?: string
  classNameButton?: string
  alwaysShow?: boolean
}

function CarouselNavigation({ className, classNameButton, alwaysShow }: CarouselNavigationProps) {
  const { index, setIndex, pagesCount, prevDisabled, nextDisabled } = useCarousel()
  const direction = useDirection()

  const PreviousIcon = direction === 'rtl' ? ChevronRight : ChevronLeft
  const NextIcon = direction === 'rtl' ? ChevronLeft : ChevronRight

  if (!alwaysShow && pagesCount <= 1) return null // respect the prop

  return (
    <div
      className={cn('pointer-events-none absolute flex w-full justify-between gap-2', className)}
    >
      <Button
        type="button"
        aria-label="Previous slide"
        variant="secondary"
        color="neutral"
        size="icon"
        className={cn('pointer-events-auto rounded-full', classNameButton)}
        disabled={prevDisabled}
        onClick={() => {
          if (!prevDisabled) setIndex(index - 1)
        }}
      >
        <PreviousIcon className="size-4" />
      </Button>

      <Button
        type="button"
        aria-label="Next slide"
        variant="secondary"
        color="neutral"
        size="icon"
        className={cn('pointer-events-auto rounded-full', classNameButton)}
        disabled={nextDisabled}
        onClick={() => {
          if (!nextDisabled) setIndex(index + 1)
        }}
      >
        <NextIcon className="size-4" />
      </Button>
    </div>
  )
}

export type CarouselIndicatorProps = {
  className?: string
  classNameButton?: string
}

function CarouselIndicator({ className, classNameButton }: CarouselIndicatorProps) {
  const { index, setIndex, pagesCount } = useCarousel()
  if (pagesCount <= 1) return null

  return (
    <div
      className={cn(
        'pointer-events-none absolute z-1 flex w-full items-center justify-center',
        className,
      )}
    >
      <div className="flex space-x-2">
        {Array.from({ length: pagesCount }, (_, i) => (
          <button
            key={i}
            type="button"
            aria-label={`Go to slide ${i + 1}`}
            onClick={() => setIndex(i)}
            className={cn(
              'pointer-events-auto h-2 w-2 rounded-full transition-opacity duration-300',
              index === i ? 'bg-button-neutral' : 'bg-button-neutral/30',
              classNameButton,
            )}
          />
        ))}
      </div>
    </div>
  )
}

export type CarouselContentProps = {
  children: ReactNode
  className?: string
  transition?: Transition
}

function CarouselContent({ children, className, transition }: CarouselContentProps) {
  const { index, setIndex, setItemsCount, disableDrag, slidesPerView } = useCarousel()
  const dragX = useMotionValue(0)
  const containerRef = useRef<HTMLDivElement>(null)
  const itemsLength = Children.count(children)
  const direction = useDirection()

  // keep track of total slides
  useEffect(() => {
    if (itemsLength) setItemsCount(itemsLength)
  }, [itemsLength, setItemsCount])

  const onDragEnd = () => {
    const x = dragX.get()
    const threshold = 10
    const isNext = direction === 'rtl' ? x >= threshold : x <= -threshold
    const isPrev = direction === 'rtl' ? x <= -threshold : x >= threshold

    const maxIndex = Math.max(itemsLength - slidesPerView, 0)
    if (isNext && index < maxIndex) setIndex(index + 1)
    else if (isPrev && index > 0) setIndex(index - 1)
  }

  return (
    <motion.div
      drag={disableDrag ? false : 'x'}
      dragConstraints={disableDrag ? undefined : { left: 0, right: 0 }}
      dragMomentum={disableDrag ? undefined : false}
      style={{ x: dragX }}
      animate={{
        transform: `translateX(${direction === 'rtl' ? '' : '-'}${index * (100 / slidesPerView)}%)`,
      }}
      onDragEnd={disableDrag ? undefined : onDragEnd}
      transition={
        transition || {
          damping: 18,
          stiffness: 90,
          type: 'spring',
          duration: 0.2,
        }
      }
      className={cn(
        'flex items-stretch',
        !disableDrag && 'cursor-grab active:cursor-grabbing',
        className,
      )}
      ref={containerRef}
    >
      {children}
    </motion.div>
  )
}

export type CarouselItemProps = {
  children: ReactNode
  className?: string
}

function CarouselItem({ children, className }: CarouselItemProps) {
  const { slidesPerView } = useCarousel()
  const basis = 100 / slidesPerView

  return (
    <motion.div
      className={cn('flex items-center overflow-hidden', className)}
      style={{
        flexBasis: `${basis}%`,
        flexGrow: 0,
        flexShrink: 0,
        maxWidth: `${basis}%`,
        minWidth: 0,
      }}
    >
      {children}
    </motion.div>
  )
}

export {
  Carousel,
  CarouselContent,
  CarouselNavigation,
  CarouselIndicator,
  CarouselItem,
  useCarousel,
}
