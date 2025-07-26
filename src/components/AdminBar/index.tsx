'use client'

import type { PayloadAdminBarProps } from 'payload-admin-bar'

import { cn } from '@/utilities/ui'
import { useSelectedLayoutSegments } from 'next/navigation'
import { PayloadAdminBar } from 'payload-admin-bar'
import React, { useState, useEffect, useRef } from 'react'
import { useRouter } from 'next/navigation'

import './index.scss'

import { getClientSideURL } from '@/utilities/getURL'

const baseClass = 'admin-bar'

const collectionLabels = {
  pages: {
    plural: 'Pages',
    singular: 'Page',
  },
  posts: {
    plural: 'Posts',
    singular: 'Post',
  },
}

const Title: React.FC = () => <span>Dashboard</span>

export const AdminBar: React.FC<{
  adminBarProps?: PayloadAdminBarProps
}> = (props) => {
  const { adminBarProps } = props || {}
  const segments = useSelectedLayoutSegments()
  const [show, setShow] = useState(false)
  const collection = collectionLabels?.[segments?.[1]] ? segments?.[1] : 'pages'
  const router = useRouter()
  const ref = useRef<HTMLDivElement>(null)

  const onAuthChange = React.useCallback((user) => {
    setShow(!!user?.id)
  }, [])

  useEffect(() => {
    if (show) {
      const height = ref.current?.clientHeight
      document.documentElement.style.setProperty('--admin-bar-height', `${height}px`)
    } else {
      document.documentElement.style.setProperty('--admin-bar-height', '0rem')
    }
    return () => {
      document.documentElement.style.setProperty('--admin-bar-height', '0rem')
    }
  }, [show])

  return (
    <div
      ref={ref}
      className={cn(
        baseClass,
        'z-[10] w-full bg-black text-white',
        'h-0 md:h-10',
        // '-fixed -top-0 -left-0',
        {
          block: show,
          hidden: !show,
        },
      )}
    >
      <div className="container h-full">
        <PayloadAdminBar
          {...adminBarProps}
          className="h-full py-0 text-white"
          classNames={{
            controls: 'font-medium text-white me-2.5 mr-0',
            logo: 'text-white me-2.5 mr-0',
            user: 'text-white me-2.5 mr-0',
          }}
          cmsURL={getClientSideURL()}
          collection={collection}
          collectionLabels={{
            plural: collectionLabels[collection]?.plural || 'Pages',
            singular: collectionLabels[collection]?.singular || 'Page',
          }}
          logo={<Title />}
          onAuthChange={onAuthChange}
          onPreviewExit={() => {
            fetch('/next/exit-preview').then(() => {
              router.push('/')
              router.refresh()
            })
          }}
          style={{
            backgroundColor: 'transparent',
            padding: 0,
            position: 'relative',
            zIndex: 'unset',
          }}
        />
      </div>
    </div>
  )
}
