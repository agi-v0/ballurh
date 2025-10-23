'use client'

import type { PayloadAdminBarProps, PayloadMeUser } from 'payload-admin-bar'

import { cn } from '@/utilities/ui'
import { useSelectedLayoutSegments } from 'next/navigation'
import { PayloadAdminBar } from 'payload-admin-bar'
import React, { useState, useEffect, useRef } from 'react'
import { useRouter } from 'next/navigation'

// import './index.scss'

import { getClientSideURL } from '@/utilities/getURL'
import { CollectionSlug } from 'payload'

const baseClass = 'admin-bar'

const collectionLabels = {
  pages: {
    plural: 'Pages',
    singular: 'Page',
  },
  'blog-posts': {
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
  let collection: CollectionSlug
  switch (segments[0]) {
    case 'blog':
      collection = 'blog-posts'
      break
    default:
      collection = 'pages'
  }
  const router = useRouter()
  const ref = useRef<HTMLDivElement>(null)

  const onAuthChange = React.useCallback((user: PayloadMeUser) => {
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
        'z-10 w-full bg-black text-white',
        'h-10 max-md:hidden md:block',
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
          collectionLabels={collectionLabels[collection] || collectionLabels['pages']}
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
