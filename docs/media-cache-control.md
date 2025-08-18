# Media File Cache Control

This document describes the cache control implementation for media files using Next.js middleware.

## Overview

The media cache middleware intercepts requests to media files and adds appropriate cache control headers based on file type. This improves performance by reducing server load and improving user experience. The middleware works for both development (local files) and production (S3 files).

## Cache Strategies

### Images and Static Assets
- **File types**: `.jpg`, `.jpeg`, `.png`, `.webp`, `.gif`, `.svg`, `.ico`
- **Browser cache**: 1 year (`max-age=31536000`)
- **CDN cache**: 1 year (`s-maxage=31536000`)
- **Stale-while-revalidate**: 1 day (`stale-while-revalidate=86400`)
- **Immutable**: Applied to static files served from `public/` (e.g., `/favicon.ico`, `/media/image.png` in dev)
- **Reasoning**: Images rarely change and benefit from long-term caching; `immutable` is added for true static assets

### Videos and Audio
- **File types**: `.mp4`, `.webm`, `.mp3`, `.wav`
- **Browser cache**: 1 day (`max-age=86400`)
- **CDN cache**: 1 day (`s-maxage=86400`)
- **Stale-while-revalidate**: 1 hour (`stale-while-revalidate=3600`)
- **Reasoning**: Video/audio files are larger and may be updated occasionally

### Documents and Other Files
- **File types**: `.pdf`, `.txt`, `.css`, `.js`, `.json`, `.xml`
- **Browser cache**: 1 hour (`max-age=3600`)
- **CDN cache**: 1 hour (`s-maxage=3600`)
- **Stale-while-revalidate**: 5 minutes (`stale-while-revalidate=300`)
- **Reasoning**: These files may be updated more frequently

### Default
- **Browser cache**: 30 minutes (`max-age=1800`)
- **CDN cache**: 30 minutes (`s-maxage=1800`)
- **Stale-while-revalidate**: 1 minute (`stale-while-revalidate=60`)
- **Applied to**: Any file type not explicitly handled

## Features

### Middleware-based Approach
The cache control is implemented using Next.js middleware, which:
- Works for both development and production environments
- Automatically applies to all media file requests
- Doesn't interfere with Payload's existing media serving mechanism
- Adds headers before the request reaches the final handler

### CDN Compatibility
The cache headers are designed to work optimally with CDNs:
- **`s-maxage`**: Explicitly controls CDN cache duration
- **`stale-while-revalidate`**: Provides resilience during cache misses
- **`public`**: Ensures CDNs can cache the content
- **`immutable`**: Applied to static files for optimal long-term caching (compatible with most modern CDNs)

### Supported File Patterns
The middleware recognizes media requests from:
- `/api/media/file/filename.ext` (Payload API routes)
- `/media/filename.ext` (Static files in public directory, dev-only for media)
- Any root URL with common static file extensions (e.g., `/favicon.ico`, `/apple-icon.png`)

## Headers Set

### Cache Control
- `Cache-Control`: Varies by file type and whether it's a static file (see strategies above)

### Media Files
- `Accept-Ranges`: Set to `bytes` for video and audio files to support range requests

## Usage

The middleware automatically applies cache headers to all media file requests. No special configuration is needed.

### Examples
```bash
# Payload API media files
GET /api/media/file/image.png

# Static media files (dev-only for /media/)
GET /media/video.mp4

# Other static files from public/
GET /favicon.ico
GET /apple-icon.png

# Any file with media extension
GET /uploads/document.pdf
```

## Testing

You can test the cache control headers using curl:

```bash
# Test Payload API media files
curl -I http://localhost:3000/api/media/file/image.png

# Test static media files
curl -I http://localhost:3000/media/video.mp4

# Test other static files (should include immutable)
curl -I http://localhost:3000/favicon.ico

# Check cache headers
curl -I http://localhost:3000/api/media/file/document.pdf
```

## Implementation Details

The middleware is implemented in `src/middleware/media-cache.ts` and integrated into the main middleware in `src/middleware.ts`. The implementation includes:

- File extension detection for determining cache strategies
- Detection of static files from public/ (root paths with extensions, not API routes)
- Addition of `immutable` for static files
- Middleware integration with Next.js internationalization
- Automatic header injection for all media requests
- Support for both development and production environments

## Performance Benefits

1. **Reduced server load**: Cached files don't require server processing
2. **Faster page loads**: Images and assets load faster from cache
3. **Bandwidth savings**: Repeated requests don't download the same content
4. **Better user experience**: Faster loading times improve perceived performance
