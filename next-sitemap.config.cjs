const SITE_URL =
  process.env.NEXT_PUBLIC_SERVER_URL ||
  process.env.VERCEL_PROJECT_PRODUCTION_URL ||
  'https://example.com'

/** @type {import('next-sitemap').IConfig} */
module.exports = {
  siteUrl: SITE_URL,
  generateRobotsTxt: true,
  exclude: [
    '/sitemap-ar.xml',
    '/sitemap-en.xml',
    '/sitemap-ar-pages.xml',
    // '/sitemap-en-pages.xml', test
    '/sitemap-ar-posts.xml',
    '/sitemap-en-posts.xml',
    '/*',
    '/blog/*',
  ],
  robotsTxtOptions: {
    policies: [
      {
        userAgent: '*',
        disallow: '/admin/*',
      },
    ],
    // additionalSitemaps: [`${SITE_URL}/sitemap-ar.xml`, `${SITE_URL}/sitemap-en.xml`],
  },
}
