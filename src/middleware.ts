import createMiddleware from 'next-intl/middleware'
import { NextRequest, NextResponse } from 'next/server'
import { routing } from './i18n/routing'
import { mediaCacheMiddleware } from './middleware/media-cache'

// Create the internationalization middleware
const intlMiddleware = createMiddleware(routing)

// Combined middleware function
export default function middleware(request: NextRequest) {
  // First, check if this is a media request and add cache headers
  const mediaResponse = mediaCacheMiddleware(request)
  if (mediaResponse) {
    return mediaResponse
  }

  // If not a media request, apply the internationalization middleware
  return intlMiddleware(request)
}

export const config = {
  // Match all pathnames except for
  // - … if they start with `/api`, `/trpc`, `/_next` or `/_vercel`
  // - … the ones containing a dot (e.g. `favicon.ico`)
  // Removed api: This allows the middleware to process API routes (including /api/media/file/...)
  // Removed .*\\..*: This allows the middleware to process URLs with file extensions (like /media/image.png)
  matcher: '/((?!admin|next|ingest|trpc|_next|_vercel).*)',
}
