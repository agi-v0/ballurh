'use client'

import React, { useState, useCallback } from 'react'
import type { Integration, Media as MediaType } from '@/payload-types'
import { CMSLink } from '../../../components/Link'
import { Media } from '@/components/MediaResponsive'
import { PaginationControls } from './PaginationControls'

type PopulatedApp = Partial<Integration>

interface AppListData {
  docs: PopulatedApp[]
  totalDocs: number
  limit: number
  totalPages: number
  page: number
  pagingCounter: number
  hasPrevPage: boolean
  hasNextPage: boolean
  prevPage: number | null
  nextPage: number | null
}

interface AppsListClientWrapperProps {
  initialData: AppListData
  media?: MediaType | string | number | null
}

export const AppsListClientWrapper: React.FC<AppsListClientWrapperProps> = ({
  initialData,
  media,
}) => {
  const [appsData, setAppsData] = useState<AppListData>(initialData)
  const [isLoading, setIsLoading] = useState<boolean>(false)
  const [currentPage, setCurrentPage] = useState<number>(initialData.page ?? 1)

  const fetchApps = useCallback(async (page: number) => {
    setIsLoading(true)
    try {
      const response = await fetch(`/next/apps?page=${page}&locale=ar`)
      if (!response.ok) {
        throw new Error('Failed to fetch apps')
      }
      const data: AppListData = await response.json()
      setAppsData(data)
      setCurrentPage(data.page ?? 1)
    } catch (error) {
      console.error('Error fetching apps client-side:', error)
    } finally {
      setIsLoading(false)
    }
  }, [])

  const handlePageChange = (newPage: number) => {
    if (newPage !== currentPage) {
      setCurrentPage(newPage)
      fetchApps(newPage)
    }
  }

  const AppList = () => (
    <>
      {appsData.docs.map(({ name, tagline, icon, link }, index) => {
        if (!name) return null
        return (
          <CMSLink
            {...link}
            key={name + index}
            label={null}
            variant="inline"
            className="px-xs hover:bg-background-neutral flex h-fit w-full flex-row items-center justify-start gap-4 rounded-3xl whitespace-normal transition-colors hover:no-underline"
          >
            {/* Pass resource directly if it matches MediaProps resource type */}
            {icon && typeof icon === 'object' && (
              <Media
                key={`media-${name}-${index}`}
                priority
                resource={icon as MediaType}
                className="flex-none overflow-hidden rounded-lg"
                imgClassName="size-12"
              /> // Cast icon
            )}
            <div className="flex w-full flex-col py-4" key={`info-${name}-${index}`}>
              <p className="text-body-lg text-base-primary font-medium">{name}</p>
              <p className="text-body-md text-base-secondary font-normal">{tagline}</p>
            </div>
          </CMSLink>
        )
      })}
    </>
  )

  return (
    <div className="py-xl container">
      <div className="gap-xs grid grid-cols-1 md:grid-cols-2">
        <div className="lg:pe-md flex flex-col">
          <PaginationControls
            totalPages={appsData.totalPages ?? 1}
            currentPage={currentPage}
            onPageChange={handlePageChange}
          />

          {isLoading && <p>Loading...</p>}
          {!isLoading && <AppList />}
          {!isLoading && appsData.docs.length === 0 && <p>No apps found.</p>}
        </div>

        <div className="aspect-square h-auto w-full select-none">
          {media && typeof media === 'object' && (
            <Media imgClassName="rounded-3xl object-cover" resource={media} />
          )}
        </div>
      </div>
    </div>
  )
}
