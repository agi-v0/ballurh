import type { CollectionSlug, GlobalSlug, Payload, PayloadRequest, File } from 'payload'
import type { Header, Form, Footer, Category } from '@/payload-types'

import { contactForm as contactFormData } from './contact-form'
import { contact as contactPageData } from './contact-page'
import { home } from './home'
import { imageLogo } from './image-logo'
import { imageHero1 } from './image-hero-1'
import { seedCustomers } from './customers'
import { image169 } from './image-16-9'
import { image43 } from './image-4-3'
import { imageSquare } from './image-square'

import { seedFeaturesShowcasePage } from './features-showcase-page'
import { seedArchiveBlockDemo } from './archive-block-demo'
import { seedCTABlockDemo } from './cta-block-demo'
import { seedBlogBlockDemo } from './blog-block-demo'
import { seedDividerBlockDemo } from './divider-block-demo'
import { seedCustomHtmlDemo } from './custom-html-demo'
import { seedRichTextDemo } from './rich-text-demo'
import { seedFAQBlockDemo } from './faq-block-demo'
import { seedGalleryBlockDemo } from './gallery-block-demo'
import { seedFormBlockDemo } from './form-block-demo'
// @ts-ignore
import { seedPricingBlockDemo } from './pricing-block-demo'

import { seedTestimonialsBlockDemo } from './testimonials-block-demo'
import { seedLogosBlockDemo } from './logos-block-demo'
import { seedMetricsBlockDemo } from './metrics-block-demo'

import { seedBlocksDemoIndex } from './blocks-demo-index'

import { seedFAQs } from './faq'
import { seedBlogPosts } from './blog-posts'

const collections: CollectionSlug[] = [
  'pages',
  'blog-posts',
  'users',
  'customers',
  'categories',
  'faq',
  'media',
  'forms',
  'form-submissions',
  'search',
  // 'changelog',
  // 'integrations',
  // 'logos',
  // 'solutions',
]
const globals: GlobalSlug[] = ['header', 'footer']

const NEXT_PUBLIC_SERVER_URL = process.env.VERCEL_PROJECT_PRODUCTION_URL
  ? `https://${process.env.VERCEL_PROJECT_PRODUCTION_URL}`
  : process.env.NEXT_PUBLIC_SERVER_URL || 'http://localhost:3000'

console.log('NEXT_PUBLIC_SERVER_URL', NEXT_PUBLIC_SERVER_URL)

// Next.js revalidation errors are normal when seeding the database without a server running
// i.e. running `yarn seed` locally instead of using the admin UI within an active app
// The app is not running to revalidate the pages and so the API routes are not available
// These error messages can be ignored: `Error hitting revalidate route for...`

export const seed = async ({
  payload,
  req,
}: {
  payload: Payload
  req: PayloadRequest
}): Promise<void> => {
  payload.logger.info('Seeding database...')

  // we need to clear the media directory before seeding
  // as well as the collections and globals
  // this is because while `yarn seed` drops the database
  // the custom `/api/seed` endpoint does not
  payload.logger.info(`— Clearing collections and globals...`)

  // clear the database
  await Promise.all([
    payload.updateGlobal({
      slug: 'header',
      data: {
        tabs: [],
        cta: [],
      },
      depth: 0,
      context: {
        disableRevalidate: true,
      },
    }),
    payload.updateGlobal({
      slug: 'footer',
      data: {
        columns: [],
      },
      depth: 0,
      context: {
        disableRevalidate: true,
      },
    }),
  ])
  await Promise.all(
    collections.map((collection) => payload.db.deleteMany({ collection, req, where: {} })),
  )

  await Promise.all(
    collections
      .filter((collection) => Boolean(payload.collections[collection].config.versions))
      .map((collection) => payload.db.deleteVersions({ collection, req, where: {} })),
  )

  payload.logger.info(`— Seeding demo author and user...`)

  await payload.delete({
    collection: 'users',
    depth: 0,
    where: {
      email: {
        equals: 'demo-author@example.com',
      },
    },
  })

  const demoAuthor = await payload.create({
    collection: 'users',
    data: {
      name: 'Demo Author',
      email: 'demo-author@example.com',
      password: 'password',
    },
    req,
  })

  payload.logger.info('— Seeding categories...')

  //Parent Categories
  const parentCategoriesData = [
    { collection: 'categories', data: { title: 'Ecosystems', slug: 'ecosystems' } },
    { collection: 'categories', data: { title: 'Marketplace', slug: 'marketplace' } },
    { collection: 'categories', data: { title: 'Media', slug: 'media' } },
    { collection: 'categories', data: { title: 'Blog', slug: 'blog' } },
    { collection: 'categories', data: { title: 'Other', slug: 'other' } },
  ]

  await Promise.all(
    parentCategoriesData.map(async (op) => {
      return await payload.create({
        collection: op.collection as CollectionSlug,
        data: op.data,
        depth: 0,
      })
    }),
  )
  const parentCategories = await payload.find({
    collection: 'categories',
    where: {
      slug: {
        in: ['ecosystems', 'marketplace', 'media', 'blog', 'other'],
      },
    },
  })
  const parentCategoriesMap = parentCategories.docs.reduce(
    (acc, category) => {
      acc[category?.slug ?? ''] = category
      return acc
    },
    {} as Record<string, Category>,
  )

  const ecosystems = parentCategoriesMap['ecosystems']
  const marketplace = parentCategoriesMap['marketplace']
  const media = parentCategoriesMap['media']
  const blog = parentCategoriesMap['blog']
  const other = parentCategoriesMap['other']

  payload.logger.info('✓ Seeded parent categories...')

  //Child categories
  const childCategoriesData = [
    // Media Categories
    {
      collection: 'categories',
      data: {
        title: 'App Icons',
        breadcrumbs: [
          {
            label: 'App Icons',
            url: '/media/app-icons',
          },
          {
            label: 'Media',
            url: '/media',
          },
        ],
        slug: 'app-icons',
        parent: media.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'Hero Images',
        slug: 'hero-images',
        breadcrumbs: [
          {
            label: 'App Icons',
            url: '/media/app-icons',
          },
          {
            label: 'Media',
            url: '/media',
          },
        ],
        parent: media.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'Feature Images',
        slug: 'feature-images',
        breadcrumbs: [
          {
            label: 'Feature Images',
            url: '/media/feature-images',
          },
          {
            label: 'Media',
            url: '/media',
          },
        ],
        parent: media.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'Blog Images',
        slug: 'blog-images',
        breadcrumbs: [
          {
            label: 'Blog Images',
            url: '/media/blog-images',
          },
          {
            label: 'Media',
            url: '/media',
          },
        ],
        parent: media.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'OG Images',
        slug: 'og-images',
        breadcrumbs: [
          {
            label: 'OG Images',
            url: '/media/og-images',
          },
          {
            label: 'Media',
            url: '/media',
          },
        ],
        parent: media.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'Customer Logos',
        slug: 'customer-logos',
        breadcrumbs: [
          {
            label: 'Customer Logos',
            url: '/media/customer-logos',
          },
          {
            label: 'Media',
            url: '/media',
          },
        ],
        parent: media.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'Team Photos',
        slug: 'team-photos',
        breadcrumbs: [
          {
            label: 'Team Photos',
            url: '/media/team-photos',
          },
          {
            label: 'Media',
            url: '/media',
          },
        ],
        parent: media.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'Backgrounds',
        slug: 'backgrounds',
        breadcrumbs: [
          {
            label: 'Backgrounds',
            url: '/media/backgrounds',
          },
          {
            label: 'Media',
            url: '/media',
          },
        ],
        parent: media.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'Lottie',
        slug: 'lottie',
        breadcrumbs: [
          {
            label: 'Lottie',
            url: '/media/lottie',
          },
          {
            label: 'Media',
            url: '/media',
          },
        ],
        parent: media.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'Videos',
        slug: 'videos',
        breadcrumbs: [
          {
            label: 'Videos',
            url: '/media/videos',
          },
          {
            label: 'Media',
            url: '/media',
          },
        ],
        parent: media.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'Illustrations',
        slug: 'illustrations',
        breadcrumbs: [
          {
            label: 'Illustrations',
            url: '/media/illustrations',
          },
          {
            label: 'Media',
            url: '/media',
          },
        ],
        parent: media.id,
      },
    },
    // Integrations Categories
    {
      collection: 'categories',
      data: {
        title: 'بوابات الدفع',
        slug: 'payment-gateways',
        breadcrumbs: [
          {
            label: 'Payment Gateways',
            url: '/marketplace/payment-gateways',
          },
          {
            label: 'Marketplace',
            url: '/marketplace',
          },
        ],
        parent: marketplace.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'تطبيقات التوصيل',
        slug: 'delivery-platforms',
        breadcrumbs: [
          {
            label: 'Delivery Platforms',
            url: '/marketplace/delivery-platforms',
          },
          {
            label: 'Marketplace',
            url: '/marketplace',
          },
        ],
        parent: marketplace.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'برامج المحاسبة',
        slug: 'accounting-software',
        breadcrumbs: [
          {
            label: 'Accounting Software',
            url: '/marketplace/accounting-software',
          },
          {
            label: 'Marketplace',
            url: '/marketplace',
          },
        ],
        parent: marketplace.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'إدارة المخزون',
        slug: 'inventory-management',
        breadcrumbs: [
          {
            label: 'Inventory Management',
            url: '/marketplace/inventory-management',
          },
          {
            label: 'Marketplace',
            url: '/marketplace',
          },
        ],
        parent: marketplace.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'برامج الولاء',
        slug: 'loyalty-programs',
        breadcrumbs: [
          {
            label: 'Loyalty Programs',
            url: '/marketplace/loyalty-programs',
          },
          {
            label: 'Marketplace',
            url: '/marketplace',
          },
        ],
        parent: marketplace.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'التجارة الإلكترونية',
        slug: 'ecommerce-platforms',
        breadcrumbs: [
          {
            label: 'E-commerce Platforms',
            url: '/marketplace/ecommerce-platforms',
          },
          {
            label: 'Marketplace',
            url: '/marketplace',
          },
        ],
        parent: marketplace.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'أدوات التسويق',
        slug: 'marketing-tools',
        breadcrumbs: [
          {
            label: 'Marketing Tools',
            url: '/marketplace/marketing-tools',
          },
          {
            label: 'Marketplace',
            url: '/marketplace',
          },
        ],
        parent: marketplace.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'إدارة الموظفين',
        slug: 'staff-management',
        breadcrumbs: [
          {
            label: 'Staff Management',
            url: '/marketplace/staff-management',
          },
          {
            label: 'Marketplace',
            url: '/marketplace',
          },
        ],
        parent: marketplace.id,
      },
    },
    // Ecosystems Categories
    {
      collection: 'categories',
      data: {
        title: 'البيع',
        breadcrumbs: [
          { label: 'sell', url: '/ecosystems/sell' },
          { label: 'Ecosystems', url: '/ecosystems' },
        ],
        slug: 'sell',

        parent: ecosystems.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'التشغيل',
        breadcrumbs: [
          { label: 'operate', url: '/ecosystems/operate' },
          { label: 'Ecosystems', url: '/ecosystems' },
        ],
        slug: 'operate',

        parent: ecosystems.id,
      },
    },
    {
      collection: 'categories',
      data: {
        title: 'الإدارة',
        breadcrumbs: [
          { label: 'manage', url: '/ecosystems/manage' },
          { label: 'Ecosystems', url: '/ecosystems' },
        ],
        slug: 'manage',
        parent: ecosystems.id,
      },
    },
  ]

  // await Promise.all(
  //   childCategoriesData.map(async (op) => {
  //     return await payload.create({
  //       collection: op.collection as CollectionSlug,
  //       data: op.data,
  //       depth: 0,
  //       locale: 'ar',
  //     })
  //   }),
  // )
  for (const op of childCategoriesData) {
    await payload.create({
      collection: op.collection as CollectionSlug,
      data: op.data,
      depth: 0,
      // locale: 'ar',
      // context: {
      //   locale: 'ar',
      // },
    })
  }

  payload.logger.info('✓ Seeded child categories...')

  const categories = await payload.find({
    collection: 'categories',
    where: {
      slug: {
        in: ['app-icons', 'sell', 'operate', 'manage'],
      },
    },
  })
  const categoriesMap = categories.docs.reduce(
    (acc, category) => {
      acc[category?.slug ?? ''] = category
      return acc
    },
    {} as Record<string, Category>,
  )

  const appIconsCategory = categoriesMap['app-icons']
  const sellCategory = categoriesMap['sell']
  const operateCategory = categoriesMap['operate']
  const manageCategory = categoriesMap['manage']

  // Fetch integration categories
  const integrationCategories = await payload.find({
    collection: 'categories',
    where: {
      slug: {
        in: [
          'payment-gateways',
          'delivery-platforms',
          'accounting-software',
          'inventory-management',
          'loyalty-programs',
          'ecommerce-platforms',
          'marketing-tools',
          'staff-management',
        ],
      },
    },
  })

  const integrationCategoriesMap = integrationCategories.docs.reduce(
    (acc, category) => {
      acc[category?.slug ?? ''] = category
      return acc
    },
    {} as Record<string, Category>,
  )

  const customerLogosCategory = (
    await payload.find({
      collection: 'categories',
      where: {
        slug: {
          equals: 'customer-logos',
        },
      },
    })
  ).docs[0]

  payload.logger.info('— Seeding media...')

  const [
    // image1Buffer,
    // image2Buffer,
    // image3Buffer,
    logoBuffer,
    hero1Buffer,
    image169Buffer,
    image43Buffer,
    imageSquareBuffer,
  ] = await Promise.all([
    // fetchFileByURL(
    //   'https://raw.githubusercontent.com/payloadcms/payload/refs/heads/main/templates/website/src/endpoints/seed/image-post1.webp',
    // ),
    // fetchFileByURL(
    //   'https://raw.githubusercontent.com/payloadcms/payload/refs/heads/main/templates/website/src/endpoints/seed/image-post2.webp',
    // ),
    // fetchFileByURL(
    //   'https://raw.githubusercontent.com/payloadcms/payload/refs/heads/main/templates/website/src/endpoints/seed/image-post3.webp',
    // ),
    fetchFileByURL(`${NEXT_PUBLIC_SERVER_URL}/logo.png`),
    fetchFileByURL(`${NEXT_PUBLIC_SERVER_URL}/placeholder.png`),
    fetchFileByURL(`${NEXT_PUBLIC_SERVER_URL}/placeholder-16x9.png`),
    fetchFileByURL(`${NEXT_PUBLIC_SERVER_URL}/placeholder-4x3.png`),
    fetchFileByURL(`${NEXT_PUBLIC_SERVER_URL}/placeholder-1x1.png`),
  ])

  const [
    // image1Doc,
    // image2Doc,
    // image3Doc,
    logoDoc,
    hero1Doc,
    image169Doc,
    image43Doc,
    imageSquareDoc,
  ] = await Promise.all([
    // payload.create({
    //   collection: 'media',
    //   data: image1,
    //   file: image1Buffer,
    // }),
    // payload.create({
    //   collection: 'media',
    //   data: image2,
    //   file: image2Buffer,
    // }),
    // payload.create({
    //   collection: 'media',
    //   data: image3,
    //   file: image3Buffer,
    // }),
    payload.create({
      collection: 'media',
      data: imageLogo,
      file: logoBuffer,
    }),
    payload.create({
      collection: 'media',
      data: imageHero1,
      file: hero1Buffer,
    }),
    payload.create({
      collection: 'media',
      data: image169,
      file: image169Buffer,
    }),
    payload.create({
      collection: 'media',
      data: image43,
      file: image43Buffer,
    }),
    payload.create({
      collection: 'media',
      data: imageSquare,
      file: imageSquareBuffer,
    }),
  ])

  await payload.update({
    id: imageSquareDoc.id,
    collection: 'media',
    data: {
      category: [appIconsCategory.id],
    },
    // locale: 'ar',
  })

  if (sellCategory?.id == null || operateCategory?.id == null || manageCategory?.id == null) {
    throw new Error('One or more required category IDs are missing')
  }

  // payload.logger.info('— Seeding solutions...')
  // const solutionsSlugToIdMap = await seedSolutions(
  //   payload,
  //   req,
  //   { imageSquareId: imageSquareDoc?.id },
  //   {
  //     sellCategoryId: sellCategory?.id,
  //     operateCategoryId: operateCategory?.id,
  //     manageCategoryId: manageCategory?.id,
  //   },
  // )

  // payload.logger.info(`— Seeding integrations...`)
  // const integrationsSlugToIdMap = await seedIntegrations(
  //   payload,
  //   req,
  //   imageSquareDoc?.id,
  //   [sellCategory, operateCategory, manageCategory],
  //   integrationCategoriesMap,
  // )

  payload.logger.info(`— Seeding contact form...`)
  const contactForm = (await payload.create({
    collection: 'forms',
    depth: 0,
    data: contactFormData,
  })) as Form

  payload.logger.info(`— Seeding pages...`)
  const featuresShowcasePageData = seedFeaturesShowcasePage({
    image169: image169Doc,
    image43: image43Doc,
    imageSquare: imageSquareDoc,
  })

  // Block demo pages
  const blocksDemoIndexData = seedBlocksDemoIndex({
    image169: image169Doc,
    image43: image43Doc,
    imageSquare: imageSquareDoc,
  })

  const archiveBlockDemoData = seedArchiveBlockDemo(
    {
      image169: image169Doc,
      image43: image43Doc,
      imageSquare: imageSquareDoc,
    },
    {
      sellCategory,
      operateCategory,
      manageCategory,
    },
  )

  const ctaBlockDemoData = seedCTABlockDemo(
    {
      image169: image169Doc,
      image43: image43Doc,
      imageSquare: imageSquareDoc,
    },
    contactForm,
  )

  payload.logger.info(`— Seeding FAQs...`)
  const allFAQs = await seedFAQs(payload, req, {
    sellCategory,
    operateCategory,
    manageCategory,
    otherCategory: other,
  })

  payload.logger.info(`— Seeding blog posts...`)
  await seedBlogPosts(payload, req, {
    heroImages: [image169Doc],
    blockImage: imageSquareDoc,
    author: demoAuthor,
    blogCategory: blog,
  })

  // Fetch data for demo pages
  payload.logger.info(`— Fetching blog posts for demo pages...`)
  const blogPostsResponse = await payload.find({
    collection: 'blog-posts',
    depth: 1,
    limit: 10,
    sort: '-publishedAt',
  })
  const allBlogPosts = blogPostsResponse.docs

  payload.logger.info(`— Fetching customers for demo pages...`)
  // Seed Customers (replaces both testimonials and case studies)
  const { customers, slugToIdMap: customersSlugToIdMap } = await seedCustomers({
    payload,
    req,
    image1: image43Doc,
    logo: logoDoc,
    imageSquare: imageSquareDoc,
    image169: image169Doc,
    // solutionsSlugToIdMap,
    // integrationsSlugToIdMap,
  })

  const allCustomers = customers

  // payload.logger.info(`— Seeding changelog...`)
  // await seedChangelog(payload, req)

  payload.logger.info(`— Fetching logos for demo pages...`)
  const logosResponse = await payload.find({
    collection: 'media',
    where: {
      category: {
        equals: customerLogosCategory.id,
      },
    },
    depth: 0,
    limit: 50,
  })
  let allLogos = logosResponse.docs
  // Fallback if no logos category or not enough logos
  if (allLogos.length < 24) {
    const moreMedia = await payload.find({ collection: 'media', limit: 50 })
    allLogos = [...allLogos, ...moreMedia.docs]
  }

  const blogBlockDemoData = seedBlogBlockDemo(
    {
      image169: image169Doc,
      image43: image43Doc,
      imageSquare: imageSquareDoc,
    },
    allBlogPosts,
  )

  const dividerBlockDemoData = seedDividerBlockDemo({
    image169: image169Doc,
    image43: image43Doc,
    imageSquare: imageSquareDoc,
  })

  const customHtmlDemoData = seedCustomHtmlDemo({
    image169: image169Doc,
    image43: image43Doc,
    imageSquare: imageSquareDoc,
  })

  // const mediaBlockDemoData = seedMediaBlockDemo({
  //   image169: image169Doc,
  //   image43: image43Doc,
  //   imageSquare: imageSquareDoc,
  // })

  const richTextDemoData = seedRichTextDemo({
    image169: image169Doc,
    image43: image43Doc,
    imageSquare: imageSquareDoc,
  })

  const faqBlockDemoData = seedFAQBlockDemo(
    {
      image169: image169Doc,
      image43: image43Doc,
      imageSquare: imageSquareDoc,
    },
    allFAQs,
  )

  const galleryBlockDemoData = seedGalleryBlockDemo({
    image169: image169Doc,
    image43: image43Doc,
    imageSquare: imageSquareDoc,
  })

  const formBlockDemoData = seedFormBlockDemo(
    {
      image169: image169Doc,
      image43: image43Doc,
      imageSquare: imageSquareDoc,
    },
    contactForm,
  )

  const testimonialsBlockDemoData = seedTestimonialsBlockDemo(
    {
      image169: image169Doc,
    },
    allCustomers,
  )

  const logosBlockDemoData = seedLogosBlockDemo({
    image169: image169Doc,
    logos: allLogos,
  })

  const metricsBlockDemoData = seedMetricsBlockDemo({
    image169: image169Doc,
    image43: image43Doc,
    imageSquare: imageSquareDoc,
    logos: allLogos,
  })

  // const marketplaceBlockDemoData = seedMarketplaceBlockDemo({
  //   image169: image169Doc,
  //   filterCategory: integrationCategoriesMap['payment-gateways']?.id,
  // })

  const pagesData = [
    {
      data: home({
        heroImage: hero1Doc,
        metaImage: image169Doc,
        image169: image169Doc,
        image43: image43Doc,
        imageSquare: imageSquareDoc,
      }),
      key: 'home',
    },
    {
      data: contactPageData({ contactForm }),
      key: 'contact',
    },
    {
      data: featuresShowcasePageData,
      key: 'features',
    },
    {
      data: blocksDemoIndexData,
      key: 'blocks-demo-index',
    },
    {
      data: archiveBlockDemoData,
      key: 'archive-block-demo',
    },
    {
      data: ctaBlockDemoData,
      key: 'cta-block-demo',
    },
    {
      data: blogBlockDemoData,
      key: 'blog-block-demo',
    },
    {
      data: dividerBlockDemoData,
      key: 'divider-block-demo',
    },
    {
      data: customHtmlDemoData,
      key: 'custom-html-demo',
    },
    // {
    //   data: mediaBlockDemoData,
    //   key: 'media-block-demo',
    // },
    {
      data: richTextDemoData,
      key: 'rich-text-demo',
    },
    {
      data: faqBlockDemoData,
      key: 'faq-block-demo',
    },
    {
      data: galleryBlockDemoData,
      key: 'gallery-block-demo',
    },
    {
      data: formBlockDemoData,
      key: 'form-block-demo',
    },
    {
      data: testimonialsBlockDemoData,
      key: 'testimonials-block-demo',
    },
    {
      data: logosBlockDemoData,
      key: 'logos-block-demo',
    },
    {
      data: metricsBlockDemoData,
      key: 'metrics-block-demo',
    },
    // {
    //   data: seedCarouselShowcasePage({
    //     image169: image169Doc,
    //     image43: image43Doc,
    //     imageSquare: imageSquareDoc,
    //   }),
    //   key: 'carousel-showcase',
    // },
    // {
    //   data: marketplaceBlockDemoData,
    //   key: 'marketplace-block-demo',
    // },
  ]

  // Create pages sequentially to identify any validation errors
  for (const page of pagesData) {
    payload.logger.info(`Creating page: ${page.key}`)
    try {
      await payload.create({
        collection: 'pages',
        depth: 0,
        data: page.data,
        // locale: page.locale,
      })
      payload.logger.info(`✓ Successfully created page: ${page.key}`)
    } catch (error) {
      payload.logger.error(
        `❌ Failed to create page "${page.key}": ${error instanceof Error ? error.message : String(error)}`,
      )
      throw error // Re-throw to stop seeding process
    }
  }

  payload.logger.info(`— Seeding globals...`)

  const headerData: Header = {
    id: '',
    tabs: [
      {
        enableDirectLink: false,
        enableDropdown: false,
        descriptionLinks: [],
        navItems: [],

        label: 'الحلول',
        link: { type: 'custom', newTab: null, url: '/' },
        description:
          'كل أدواتك في منظومة مرنة. استكشف حلول البيع، التشغيل، والإدارة المصممة لتلبية احتياجاتك.',
      },
      {
        enableDirectLink: false,
        enableDropdown: true,
        descriptionLinks: [],
        navItems: [
          {
            style: 'list' as const,
            defaultLink: { link: { type: 'reference', newTab: false, url: null, icon: null, label: '' }, description: null }, // prettier-ignore
            featuredLink: { tag: null, label: null, links: [] },
            listLinks: {
              tag: 'الأنشطة',
              links: [
                { link: { type: 'custom', newTab: false, url: '/restaurants', label: 'للمطاعم', description: null, icon: 'utensils' } }, // prettier-ignore
                { link: { type: 'custom', newTab: false, url: '/retail', label: 'للبيع بالتجزئة', description: null, icon: 'scan-barcode' } }, // prettier-ignore
                { link: { type: 'custom', newTab: false, url: '/express-services', label: 'للخدمات السريعة', description: null, icon: 'fuel' } }, // prettier-ignore
              ],
            },
          },
          {
            style: 'list' as const,
            defaultLink: { link: { type: 'reference', newTab: false, url: null, icon: null, label: '' }, description: null }, // prettier-ignore
            featuredLink: { tag: null, label: null, links: [] },
            listLinks: {
              tag: 'الميزات',
              links: [
                { link: { type: 'custom', newTab: false, url: '/features/control', label: 'للبساطة والتحكم', description: null, icon: 'package-open' } }, // prettier-ignore
                { link: { type: 'custom', newTab: false, url: '/solutions/branches', label: 'لتعدد الفروع', description: null, icon: 'map-pin' } }, // prettier-ignore
                { link: { type: 'custom', newTab: false, url: '/integrations', label: 'للربط مع أدواتك', description: null, icon: 'puzzle' } }, // prettier-ignore
                { link: { type: 'custom', newTab: false, url: '/blog/increasing-profits-with-marnpos', label: 'للزيادة أرباحك', description: null, icon: 'bar-chart-big' } }, // prettier-ignore
              ],
            },
          },
        ],
        label: 'لماذا مرن',
        link: { type: 'reference', newTab: null, url: null },
        description:
          'ليش أصحاب المشاريع يختارون مرن؟ اكتشف قيمنا وكيف نسهّل عليك الشغل وتكبير مشروعك.',
      },
      {
        enableDirectLink: true,
        enableDropdown: false,
        descriptionLinks: [],
        navItems: [],
        label: 'التطبيقات',
        link: { type: 'custom', newTab: false, url: '/integrations' },
        description: 'اربط مرن مع تطبيقات الدفع، التوصيل، والمحاسبة. سهّل شغلك وربط كل شيء ببعضه.',
      },
      {
        enableDirectLink: true, // Changed from false in original to true based on structure
        enableDropdown: true,
        descriptionLinks: [],
        navItems: [
          {
            style: 'list' as const,
            defaultLink: { link: { type: 'reference', newTab: false, url: null, icon: null, label: '' }, description: null }, // prettier-ignore
            featuredLink: { tag: null, label: null, links: [] },
            listLinks: {
              tag: 'منشوراتنا',
              links: [
                { link: { type: 'custom', newTab: false, url: '/blog', label: 'المدونة', description: null, icon: 'newspaper' } }, // prettier-ignore
                { link: { type: 'custom', newTab: false, url: '/customers', label: 'قصص النجاح', description: null, icon: 'trophy' } }, // prettier-ignore
              ],
            },
          },
          {
            style: 'list' as const,
            defaultLink: { link: { type: 'reference', newTab: false, url: null, icon: null, label: '' }, description: null }, // prettier-ignore
            featuredLink: { tag: null, label: null, links: [] },
            listLinks: {
              tag: 'عن مرن',
              links: [
                { link: { type: 'custom', newTab: false, url: '/about', label: 'عن مرن', description: null, icon: 'marn-icon' } }, // prettier-ignore
                { link: { type: 'custom', newTab: false, url: '/contact-us', label: 'تواصل معنا', description: null, icon: 'phone' } }, // prettier-ignore
                { link: { type: 'custom', newTab: false, url: 'https://marn.gitbook.io/marn-developers/', label: 'المطورين', description: null, icon: 'code' } }, // prettier-ignore
              ],
            },
          },
        ],
        label: 'الموارد',
        link: { type: 'custom', newTab: false, url: '/resources' }, // Changed from /contact based on label
        description:
          'كل ما تحتاج تعرفه عن مرن وأصحاب المشاريع اللي يستخدمونه—من مقالات ونصائح، إلى قصص وتجارب حقيقية، وحتى التواصل معنا',
      },
    ],
    cta: [
      { link: { type: 'custom', newTab: null, url: '/', label: 'دخول التاجر', color: 'neutral', variant: 'secondary' } }, // prettier-ignore
      { link: { type: 'custom', newTab: false, url: '/contact-us', label: 'تواصل معنا', color: 'neutral', variant: 'primary' } }, // prettier-ignore
    ],
  }
  // Footer Data
  const footerData: Footer = {
    id: '',
    columns: [
      {
        label: 'روابط',
        navItems: [],
      },
      // ... Add other footer columns if needed, based on original Footer global structure
    ],
  }

  await Promise.all([
    payload.logger.info('Updating global – header'),
    payload.updateGlobal({
      slug: 'header',
      data: headerData,
      locale: 'ar',
      req,
    }),
    payload.logger.info('Updating global – footer'),
    payload.updateGlobal({
      slug: 'footer',
      data: footerData,
      locale: 'ar',
      req,
    }),
  ])

  payload.logger.info('Seeded database successfully!')
}

async function fetchFileByURL(url: string): Promise<File> {
  const res = await fetch(url, {
    credentials: 'include',
    method: 'GET',
  })

  if (!res.ok) {
    throw new Error(`Failed to fetch file from ${url}, status: ${res.status}`)
  }

  const data = await res.arrayBuffer()

  return {
    name: url.split('/').pop() || `file-${Date.now()}`,
    data: Buffer.from(data),
    mimetype: `image/${url.split('.').pop()}`,
    size: data.byteLength,
  }
}
