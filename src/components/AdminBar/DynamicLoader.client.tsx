'use client'

import type { PayloadAdminBarProps } from 'payload-admin-bar'
import dynamic from 'next/dynamic'
import React from 'react'

// Dynamically import AdminBar with SSR disabled
const DynamicAdminBar = dynamic(() => import('./index').then((mod) => mod.AdminBar), {
  ssr: false,
  // Optional: Add a loading component that preserves height if needed
  // loading: () => <div style={{ height: 'var(--admin-bar-height, 0px)' }} />,
})

// Define props for the loader component
interface DynamicAdminBarLoaderProps {
  adminBarProps?: PayloadAdminBarProps
}

// The client component that renders the dynamically loaded AdminBar
export const DynamicAdminBarLoader: React.FC<DynamicAdminBarLoaderProps> = ({ adminBarProps }) => {
  return <DynamicAdminBar adminBarProps={adminBarProps} />
}
