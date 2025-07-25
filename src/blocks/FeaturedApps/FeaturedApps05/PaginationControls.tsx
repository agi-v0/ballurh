'use client'

import React from 'react'
import { Button } from '@/components/ui/button'
import { ArrowLeftIcon, ArrowRightIcon } from 'lucide-react'

interface PaginationControlsProps {
  currentPage: number
  totalPages: number
  onPageChange: (page: number) => void
}

export const PaginationControls: React.FC<PaginationControlsProps> = ({
  currentPage,
  totalPages,
  onPageChange,
}) => {
  const handlePrev = () => {
    if (currentPage > 1) {
      onPageChange(currentPage - 1)
    }
  }

  const handleNext = () => {
    if (currentPage < totalPages) {
      onPageChange(currentPage + 1)
    }
  }

  if (totalPages <= 1) {
    return null // Don't render controls if there's only one page
  }

  return (
    <div className="mb-2 flex flex-row gap-2">
      {/* Previous Button */}
      <Button
        variant="secondary"
        color="neutral"
        size="icon"
        className="rounded-full"
        onClick={handlePrev}
        disabled={currentPage <= 1}
        aria-label="Previous page"
      >
        {/* Using Right Arrow for Prev in RTL */}
        <ArrowRightIcon className="size-4" />
      </Button>
      {/* Next Button */}
      <Button
        variant="secondary"
        color="neutral"
        size="icon"
        className="rounded-full"
        onClick={handleNext}
        disabled={currentPage >= totalPages}
        aria-label="Next page"
      >
        {/* Using Left Arrow for Next in RTL */}
        <ArrowLeftIcon className="size-4" />
      </Button>
      {/* Optional: Display current page / total pages */}
      {/* <span className="text-sm text-gray-500 self-center">
        Page {currentPage} of {totalPages}
      </span> */}
    </div>
  )
}
