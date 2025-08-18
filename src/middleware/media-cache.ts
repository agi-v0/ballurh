import { NextRequest, NextResponse } from 'next/server'

// Content type mapping for cache strategies
const CONTENT_TYPES: Record<string, string> = {
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.png': 'image/png',
  '.webp': 'image/webp',
  '.gif': 'image/gif',
  '.svg': 'image/svg+xml',
  '.pdf': 'application/pdf',
  '.mp4': 'video/mp4',
  '.webm': 'video/webm',
  '.mp3': 'audio/mpeg',
  '.wav': 'audio/wav',
  '.ico': 'image/x-icon',
  '.txt': 'text/plain',
  '.css': 'text/css',
  '.js': 'application/javascript',
  '.json': 'application/json',
  '.xml': 'application/xml',
}

// Cache strategies based on file type
const getCacheStrategy = (ext: string, isStaticFile: boolean): string => {
  // Images and static assets get long cache
  if (['.jpg', '.jpeg', '.png', '.webp', '.gif', '.svg', '.ico'].includes(ext)) {
    let strategy = 'public, max-age=31536000, s-maxage=31536000, stale-while-revalidate=86400'
    if (isStaticFile) {
      strategy += ', immutable' // Add immutable for static files from public/
    }
    return strategy
  }

  // Videos and audio get medium cache
  if (['.mp4', '.webm', '.mp3', '.wav'].includes(ext)) {
    return 'public, max-age=86400, s-maxage=86400, stale-while-revalidate=3600'
  }

  // Documents and other files get shorter cache
  if (['.pdf', '.txt', '.css', '.js', '.json', '.xml'].includes(ext)) {
    return 'public, max-age=3600, s-maxage=3600, stale-while-revalidate=300'
  }

  // Default cache strategy
  return 'public, max-age=1800, s-maxage=1800, stale-while-revalidate=60'
}

export function mediaCacheMiddleware(request: NextRequest) {
  const url = request.nextUrl
  const pathname = url.pathname

  // Check if this is a media file request
  // Match patterns like:
  // - /api/media/file/filename.ext
  // - /media/filename.ext (for static files)
  // - Any path ending with common media extensions
  const isMediaRequest =
    pathname.startsWith('/api/media/file/') ||
    pathname.startsWith('/media/') ||
    /\.(jpg|jpeg|png|webp|gif|svg|ico|pdf|mp4|webm|mp3|wav|txt|css|js|json|xml)$/i.test(pathname)

  if (!isMediaRequest) {
    return null // Let the request continue normally
  }

  // Determine if this is a static file from public/ (root paths with extensions, not API routes)
  const isStaticFile = !pathname.startsWith('/api/') && /\.\w+$/.test(pathname)

  // Extract file extension from the pathname
  const ext = pathname.split('.').pop()?.toLowerCase() || ''
  const cacheStrategy = getCacheStrategy(`.${ext}`, isStaticFile)

  // Create a response that will be modified by the middleware
  const response = NextResponse.next()

  // Add cache control headers
  response.headers.set('Cache-Control', cacheStrategy)

  // Add other useful headers for media files
  if (['.mp4', '.webm', '.mp3', '.wav'].includes(`.${ext}`)) {
    response.headers.set('Accept-Ranges', 'bytes')
  }

  return response
}
