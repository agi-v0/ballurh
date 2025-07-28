import type { Payload, PayloadRequest, RequiredDataFromCollectionSlug } from 'payload'
import type { Media, Integration, Category } from '@/payload-types'

type IntegrationDataArgs = {
  imageSquare?: Media | string // Allow ID or full object
  ecosystems?: Category[]
}

// Function to generate a single integration object
const createIntegrationObject = (
  details: Partial<RequiredDataFromCollectionSlug<'integrations'>> & {
    slug: string
    title: string
    name: string
  },
  args: IntegrationDataArgs,
): RequiredDataFromCollectionSlug<'integrations'> => {
  const { imageSquare } = args
  return {
    icon: imageSquare,
    tagline: details.tagline || `Tagline for ${details.title}`,
    summary: details.summary || {
      root: {
        type: 'root',
        format: '',
        indent: 0,
        version: 1,
        children: [
          {
            type: 'paragraph',
            format: '',
            indent: 0,
            version: 1,
            children: [
              {
                mode: 'normal',
                text: `Summary text for ${details.title}.`,
                type: 'text',
                style: '',
                detail: 0,
                format: 0,
                version: 1,
              },
            ],
            direction: 'rtl',
            textStyle: '',
            textFormat: 0,
          },
        ],
        direction: 'rtl',
      },
    },
    link: details.link || {
      type: 'custom',
      newTab: null,
      url: `/integrations/${details.slug}`,
      label: details.name,
    },

    hero: details.hero || {
      root: {
        type: 'root',
        format: '',
        indent: 0,
        version: 1,
        children: [
          {
            type: 'paragraph',
            format: '',
            indent: 0,
            version: 1,
            children: [
              {
                mode: 'normal',
                text: `Content for ${details.title}.`,
                type: 'text',
                style: '',
                detail: 0,
                format: 0,
                version: 1,
              },
            ],
            direction: null,
            textStyle: '',
            textFormat: 0,
          },
        ],
        direction: null,
      },
    },
    company: details.company || {
      name: details.title,
      email: `contact@${details.slug}.com`,
      phone: undefined,
    },
    docsLink: details.docsLink || {
      type: 'custom',
      url: `/docs/${details.slug}`,
      label: `Documentation for ${details.title}`,
    },
    categories: details.categories || [],
    layout: [],
    _status: 'published',
    ...details,
  }
}

export const seedIntegrations = async (
  payload: Payload,
  req: PayloadRequest,
  imageSquareId: string,
  ecosystems: Category[],
  integrationCategories: Record<string, Category>,
): Promise<Record<string, string>> => {
  const integrationsToSeed = [
    // Loyalty & Rewards Platforms
    createIntegrationObject(
      {
        title: 'Bonat',
        name: 'بونات',
        slug: 'bonat',
        tagline: 'منصة ولاء شاملة لزيادة المبيعات واستهداف العملاء',
        summary: {
          root: {
            type: 'root',
            format: '',
            indent: 0,
            version: 1,
            children: [
              {
                type: 'paragraph',
                format: '',
                indent: 0,
                version: 1,
                children: [
                  {
                    mode: 'normal',
                    text: 'بونات هي منصة ولاء متقدمة تساعد التجار على زيادة مبيعاتهم من خلال برامج نقاط وخصومات مخصصة. تتكامل مع أنظمة نقاط البيع لتوفير تجربة سلسة للعملاء والتجار.',
                    type: 'text',
                    style: '',
                    detail: 0,
                    format: 0,
                    version: 1,
                  },
                ],
                direction: 'rtl',
                textStyle: '',
                textFormat: 0,
              },
            ],
            direction: 'rtl',
          },
        },
        company: {
          name: 'Bonat',
          email: 'info@bonat.sa',
          phone: '+966 11 234 5678',
        },
        ecosystem: ecosystems?.slice(0, 1).map((cat) => cat.id) || [],
        categories: integrationCategories['loyalty-programs']
          ? [integrationCategories['loyalty-programs'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    createIntegrationObject(
      {
        title: 'Nugttah',
        name: 'نقطة',
        slug: 'nugttah',
        tagline: 'حلول ولاء العملاء وحلول التجار المرنة',
        summary: {
          root: {
            type: 'root',
            format: '',
            indent: 0,
            version: 1,
            children: [
              {
                type: 'paragraph',
                format: '',
                indent: 0,
                version: 1,
                children: [
                  {
                    mode: 'normal',
                    text: 'نقطة منصة ولاء شاملة تقدم برامج نقاط مرنة، تحليلات متقدمة، وحملات تسويقية مستهدفة. تساعد التجار على الاحتفاظ بالعملاء وزيادة قيمة الطلبات من خلال نظام نقاط متطور.',
                    type: 'text',
                    style: '',
                    detail: 0,
                    format: 0,
                    version: 1,
                  },
                ],
                direction: 'rtl',
                textStyle: '',
                textFormat: 0,
              },
            ],
            direction: 'rtl',
          },
        },
        company: {
          name: 'Nugttah',
          email: 'info@nugttah.com',
          phone: '+966 11 456 7890',
        },
        ecosystem: ecosystems?.slice(0, 1).map((cat) => cat.id) || [],
        categories: integrationCategories['loyalty-programs']
          ? [integrationCategories['loyalty-programs'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    createIntegrationObject(
      {
        title: 'Mukafaat',
        name: 'مكافآت',
        slug: 'mukafaat',
        tagline: 'برامج ولاء العملاء الرائدة في المملكة العربية السعودية',
        summary: {
          root: {
            type: 'root',
            format: '',
            indent: 0,
            version: 1,
            children: [
              {
                type: 'paragraph',
                format: '',
                indent: 0,
                version: 1,
                children: [
                  {
                    mode: 'normal',
                    text: 'مكافآت هي شركة رائدة في برامج ولاء العملاء منذ 2010، تخدم أكثر من 500 منفذ و100 عميل راضٍ. تقدم حلول ولاء شاملة تشمل النقاط والهدايا والخصومات مع تكامل مع أنظمة نقاط البيع الرائدة.',
                    type: 'text',
                    style: '',
                    detail: 0,
                    format: 0,
                    version: 1,
                  },
                ],
                direction: 'rtl',
                textStyle: '',
                textFormat: 0,
              },
            ],
            direction: 'rtl',
          },
        },
        company: {
          name: 'Mukafaat Marketing Solutions',
          email: 'info@mukafaatms.com',
          phone: '+966 920 000 849',
        },
        ecosystem: ecosystems?.slice(0, 1).map((cat) => cat.id) || [],
        categories: integrationCategories['loyalty-programs']
          ? [integrationCategories['loyalty-programs'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    // Restaurant Ordering & Management
    createIntegrationObject(
      {
        title: 'iWaiter',
        name: 'آي ويتر',
        slug: 'iwaiter',
        tagline: 'الحل الرقمي الرائد للطلب والدفع في قطاع الضيافة',
        summary: {
          root: {
            type: 'root',
            format: '',
            indent: 0,
            version: 1,
            children: [
              {
                type: 'paragraph',
                format: '',
                indent: 0,
                version: 1,
                children: [
                  {
                    mode: 'normal',
                    text: 'آي ويتر يوفر حلول رقمية متكاملة للمطاعم والمقاهي تشمل الطلب عبر QR، الدفع الرقمي، الحجوزات، وإدارة قوائم الانتظار. يقلل التكاليف بنسبة 30% ويزيد كفاءة العمليات.',
                    type: 'text',
                    style: '',
                    detail: 0,
                    format: 0,
                    version: 1,
                  },
                ],
                direction: 'rtl',
                textStyle: '',
                textFormat: 0,
              },
            ],
            direction: 'rtl',
          },
        },
        company: {
          name: 'iWaiter',
          email: 'info@iwaiter.net',
          phone: '+966 500 937 188',
        },
        ecosystem: ecosystems?.slice(1, 2).map((cat) => cat.id) || [],
        categories: integrationCategories['staff-management']
          ? [integrationCategories['staff-management'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    // Food Delivery Platforms
    createIntegrationObject(
      {
        title: 'Jahez',
        name: 'جاهز',
        slug: 'jahez',
        tagline: 'منصة توصيل الطعام الرائدة في المملكة العربية السعودية',
        summary: {
          root: {
            type: 'root',
            format: '',
            indent: 0,
            version: 1,
            children: [
              {
                type: 'paragraph',
                format: '',
                indent: 0,
                version: 1,
                children: [
                  {
                    mode: 'normal',
                    text: 'جاهز هي منصة توصيل الطعام الرائدة في السعودية مع حصة سوقية 33%. تأسست في 2016 وتخدم البحرين والكويت أيضاً. توفر تكامل سلس مع أنظمة نقاط البيع وحلول لوجستية متقدمة.',
                    type: 'text',
                    style: '',
                    detail: 0,
                    format: 0,
                    version: 1,
                  },
                ],
                direction: 'rtl',
                textStyle: '',
                textFormat: 0,
              },
            ],
            direction: 'rtl',
          },
        },
        company: {
          name: 'Jahez Group',
          email: 'info@jahez.net',
          phone: '+966 800 124 1220',
        },
        ecosystem: ecosystems?.slice(2, 3).map((cat) => cat.id) || [],
        categories: integrationCategories['delivery-platforms']
          ? [integrationCategories['delivery-platforms'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    // Payment Gateways
    createIntegrationObject(
      {
        title: 'STC Pay',
        name: 'إس تي سي باي',
        slug: 'stc-pay',
        tagline: 'أول شركة تقنية مالية مرخصة في المملكة والمحفظة الرقمية الأكبر',
        summary: {
          root: {
            type: 'root',
            format: '',
            indent: 0,
            version: 1,
            children: [
              {
                type: 'paragraph',
                format: '',
                indent: 0,
                version: 1,
                children: [
                  {
                    mode: 'normal',
                    text: 'إس تي سي باي هي أول شركة تقنية مالية مرخصة من البنك المركزي السعودي وأكبر محفظة رقمية في الشرق الأوسط. تحولت إلى STC Bank وتقدم خدمات مصرفية رقمية شاملة مع تكامل POS متقدم.',
                    type: 'text',
                    style: '',
                    detail: 0,
                    format: 0,
                    version: 1,
                  },
                ],
                direction: 'rtl',
                textStyle: '',
                textFormat: 0,
              },
            ],
            direction: 'rtl',
          },
        },
        company: {
          name: 'Saudi Digital Payment Company',
          email: 'support@stcpay.com.sa',
          phone: '+966 800 118 0008',
        },
        ecosystem: ecosystems?.slice(3, 4).map((cat) => cat.id) || [],
        categories: integrationCategories['payment-gateways']
          ? [integrationCategories['payment-gateways'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    createIntegrationObject(
      {
        title: 'MOYASAR',
        name: 'ميسار',
        slug: 'moyasar',
        tagline: 'بوابة الدفع الإلكتروني الأسهل في المملكة العربية السعودية',
        summary: {
          root: {
            type: 'root',
            format: '',
            indent: 0,
            version: 1,
            children: [
              {
                type: 'paragraph',
                format: '',
                indent: 0,
                version: 1,
                children: [
                  {
                    mode: 'normal',
                    text: 'ميسار شركة تقنية مالية سعودية تقدم حلول دفع شاملة للشركات والأفراد. توفر APIs متقدمة، SDKs للجوال، وتكامل سهل مع منصات التجارة الإلكترونية. مرخصة ومراقبة من البنك المركزي السعودي.',
                    type: 'text',
                    style: '',
                    detail: 0,
                    format: 0,
                    version: 1,
                  },
                ],
                direction: 'rtl',
                textStyle: '',
                textFormat: 0,
              },
            ],
            direction: 'rtl',
          },
        },
        company: {
          name: 'Moyasar Financial Company',
          email: 'support@moyasar.com',
          phone: '+966 800 111 1848',
        },
        ecosystem: ecosystems?.slice(3, 4).map((cat) => cat.id) || [],
        categories: integrationCategories['payment-gateways']
          ? [integrationCategories['payment-gateways'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    // Additional integrations with shorter descriptions for variety
    createIntegrationObject(
      {
        title: 'Order',
        name: 'أوردر',
        slug: 'order',
        tagline: 'منصة طلبات رقمية للمطاعم والمقاهي',
        company: {
          name: 'Order',
          email: 'info@order.sa',
          phone: '+966 11 234 5678',
        },
        ecosystem: ecosystems?.slice(1, 2).map((cat) => cat.id) || [],
        categories: integrationCategories['staff-management']
          ? [integrationCategories['staff-management'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    createIntegrationObject(
      {
        title: 'Kawkab',
        name: 'كوكب',
        slug: 'kawkab',
        tagline: 'حلول تقنية متكاملة للمطاعم',
        company: {
          name: 'Kawkab',
          email: 'info@kawkab.sa',
          phone: '+966 11 345 6789',
        },
        ecosystem: ecosystems?.slice(1, 2).map((cat) => cat.id) || [],
        categories: integrationCategories['staff-management']
          ? [integrationCategories['staff-management'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    createIntegrationObject(
      {
        title: 'Ok Menu',
        name: 'أوكي منيو',
        slug: 'ok-menu',
        tagline: 'قوائم رقمية ذكية للمطاعم',
        company: {
          name: 'Ok Menu',
          email: 'info@okmenu.sa',
          phone: '+966 11 456 7890',
        },
        ecosystem: ecosystems?.slice(1, 2).map((cat) => cat.id) || [],
        categories: integrationCategories['staff-management']
          ? [integrationCategories['staff-management'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    createIntegrationObject(
      {
        title: 'Taker',
        name: 'تيكر',
        slug: 'taker',
        tagline: 'نظام طلبات متقدم للمطاعم',
        company: {
          name: 'Taker',
          email: 'info@taker.sa',
          phone: '+966 11 567 8901',
        },
        ecosystem: ecosystems?.slice(1, 2).map((cat) => cat.id) || [],
        categories: integrationCategories['staff-management']
          ? [integrationCategories['staff-management'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    createIntegrationObject(
      {
        title: 'Hesaab',
        name: 'حساب',
        slug: 'hesaab',
        tagline: 'حلول محاسبية ومالية للمطاعم',
        company: {
          name: 'Hesaab',
          email: 'info@hesaab.sa',
          phone: '+966 11 678 9012',
        },
        ecosystem: ecosystems?.slice(4, 5).map((cat) => cat.id) || [],
        categories: integrationCategories['accounting-software']
          ? [integrationCategories['accounting-software'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    createIntegrationObject(
      {
        title: 'ADD',
        name: 'أضف',
        slug: 'add',
        tagline: 'منصة إضافات وخدمات للمطاعم',
        company: {
          name: 'ADD',
          email: 'info@add.sa',
          phone: '+966 11 789 0123',
        },
        ecosystem: ecosystems?.slice(1, 2).map((cat) => cat.id) || [],
        categories: integrationCategories['staff-management']
          ? [integrationCategories['staff-management'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    createIntegrationObject(
      {
        title: 'VOM',
        name: 'فوم',
        slug: 'vom',
        tagline: 'حلول إدارة المطاعم المتقدمة',
        company: {
          name: 'VOM',
          email: 'info@vom.sa',
          phone: '+966 11 890 1234',
        },
        ecosystem: ecosystems?.slice(1, 2).map((cat) => cat.id) || [],
        categories: integrationCategories['staff-management']
          ? [integrationCategories['staff-management'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    createIntegrationObject(
      {
        title: 'MSEGAT',
        name: 'مسجات',
        slug: 'msegat',
        tagline: 'خدمات الرسائل النصية والتسويق الرقمي',
        company: {
          name: 'MSEGAT',
          email: 'info@msegat.sa',
          phone: '+966 11 901 2345',
        },
        ecosystem: ecosystems?.slice(5, 6).map((cat) => cat.id) || [],
        categories: integrationCategories['marketing-tools']
          ? [integrationCategories['marketing-tools'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    createIntegrationObject(
      {
        title: 'Deliverect',
        name: 'ديليفيركت',
        slug: 'deliverect',
        tagline: 'منصة تكامل طلبات التوصيل العالمية',
        company: {
          name: 'Deliverect',
          email: 'info@deliverect.com',
          phone: '+966 11 012 3456',
        },
        ecosystem: ecosystems?.slice(2, 3).map((cat) => cat.id) || [],
        categories: integrationCategories['delivery-platforms']
          ? [integrationCategories['delivery-platforms'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    createIntegrationObject(
      {
        title: 'Grubtech',
        name: 'جروب تك',
        slug: 'grubtech',
        tagline: 'تقنيات متقدمة لقطاع المطاعم والتوصيل',
        company: {
          name: 'Grubtech',
          email: 'info@grubtech.com',
          phone: '+966 11 123 4567',
        },
        ecosystem: ecosystems?.slice(2, 3).map((cat) => cat.id) || [],
        categories: integrationCategories['delivery-platforms']
          ? [integrationCategories['delivery-platforms'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),

    createIntegrationObject(
      {
        title: 'Fruits 360',
        name: 'فروتس 360',
        slug: 'fruits-360',
        tagline: 'منصة توصيل الفواكه والخضروات الطازجة',
        company: {
          name: 'Fruits 360',
          email: 'info@fruits360.sa',
          phone: '+966 11 234 5678',
        },
        ecosystem: ecosystems?.slice(2, 3).map((cat) => cat.id) || [],
        categories: integrationCategories['delivery-platforms']
          ? [integrationCategories['delivery-platforms'].id]
          : [],
      },
      { imageSquare: imageSquareId },
    ),
  ]

  // Create integrations one by one
  for (const integrationData of integrationsToSeed) {
    await payload.create({
      collection: 'integrations',
      depth: 0,
      data: integrationData,
      req,
    })
  }

  // Fetch the created integrations to build the slugToIdMap
  const { docs: createdIntegrations } = await payload.find({
    collection: 'integrations',
    where: {
      slug: {
        in: integrationsToSeed.map((int) => int.slug),
      },
    },
    limit: integrationsToSeed.length,
    depth: 0,
  })

  const slugToIdMap: Record<string, string> = {}
  createdIntegrations.forEach((doc) => {
    const integrationDoc = doc as Integration
    if (integrationDoc.slug && integrationDoc.id) {
      slugToIdMap[integrationDoc.slug] = integrationDoc.id
    }
  })

  payload.logger.info(`✓ Seeded ${createdIntegrations.length} integrations`)
  return slugToIdMap
}
