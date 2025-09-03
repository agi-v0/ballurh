import createMiddleware from 'next-intl/middleware'
import { NextRequest, NextResponse } from 'next/server'
import { routing } from './i18n/routing'
import { mediaCacheMiddleware } from './middleware/media-cache'

// Create the internationalization middleware
const intlMiddleware = createMiddleware(routing)

// Combined middleware function
export default function middleware(request: NextRequest) {
  // const mediaResponse = mediaCacheMiddleware(request)
  // if (mediaResponse) {
  //   return mediaResponse
  // }

  return intlMiddleware(request)
}

export const config = {
  // Match all pathnames except for:
  // - admin, next, ingest, trpc, _next, _vercel
  // - All /api/ paths EXCEPT those starting with /api/media/
  // Removed .*\\..*: This allows the middleware to process URLs with file extensions (like /media/image.png)
  // matcher: '/((?!admin|next|ingest|trpc|_next|_vercel|api(?!/media/)).*)',
  // Match all pathnames except for
  // - … if they start with `/admin`, `/api`, `/next`, `/_next` or `/_vercel`
  // - … the ones containing a dot (e.g. `favicon.ico`)
  matcher: '/((?!admin|api|next|ingest|_next|_vercel|.*\\..*).*)',
}
