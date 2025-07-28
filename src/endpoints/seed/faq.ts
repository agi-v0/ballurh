import type { Payload, PayloadRequest } from 'payload'
import type { Category, Faq } from '@/payload-types'

export async function seedFAQs(
  payload: Payload,
  req: PayloadRequest,
  categories: {
    sellCategory?: Category
    operateCategory?: Category
    manageCategory?: Category
    otherCategory?: Category
  },
): Promise<Faq[]> {
  const faqsData = [
    // بيع - Selling FAQs
    {
      question: 'كيف أقوم بمعالجة عملية دفع جديدة؟',
      answer: {
        root: {
          type: 'root',
          children: [
            {
              type: 'paragraph',
              version: 1,
              children: [
                {
                  type: 'text',
                  text: 'لمعالجة عملية دفع جديدة، اذهب إلى شاشة الكاشير، أضف المنتجات المطلوبة، ثم اضغط على زر "تحصيل". يمكنك اختيار طريقة الدفع (نقدي، بطاقة، أو محفظة رقمية) وإتمام المعاملة.',
                  format: '' as const,
                  style: '',
                },
              ],
              direction: 'rtl' as const,
              format: '' as const,
              indent: 0,
            },
          ],
          direction: 'rtl' as const,
          format: '' as const,
          indent: 0,
          version: 1,
        },
      },
      category: categories.sellCategory?.id,
    },
    {
      question: 'هل يمكنني إلغاء أو استرداد عملية بيع؟',
      answer: {
        root: {
          type: 'root',
          children: [
            {
              type: 'paragraph',
              version: 1,
              children: [
                {
                  type: 'text',
                  text: 'نعم، يمكنك إلغاء أو استرداد عمليات البيع من خلال قائمة "المبيعات" في لوحة التحكم. ابحث عن المعاملة المطلوبة واختر "استرداد" أو "إلغاء" حسب حالة المعاملة.',
                  format: '' as const,
                  style: '',
                },
              ],
              direction: 'rtl' as const,
              format: '' as const,
              indent: 0,
            },
          ],
          direction: 'rtl' as const,
          format: '' as const,
          indent: 0,
          version: 1,
        },
      },
      category: categories.sellCategory?.id,
    },
    {
      question: 'كيف أتعامل مع العروض والخصومات؟',
      answer: {
        root: {
          type: 'root',
          children: [
            {
              type: 'paragraph',
              version: 1,
              children: [
                {
                  type: 'text',
                  text: 'يمكنك إعداد العروض والخصومات من قسم "العروض" في لوحة التحكم. يمكنك إنشاء خصومات بنسبة مئوية أو مبلغ ثابت، وتحديد فترة صلاحية العرض والمنتجات المشمولة.',
                  format: '' as const,
                  style: '',
                },
              ],
              direction: 'rtl' as const,
              format: '' as const,
              indent: 0,
            },
          ],
          direction: 'rtl' as const,
          format: '' as const,
          indent: 0,
          version: 1,
        },
      },
      category: categories.sellCategory?.id,
    },

    // تشغيل - Operations FAQs
    {
      question: 'كيف أضيف منتج جديد إلى النظام؟',
      answer: {
        root: {
          type: 'root',
          children: [
            {
              type: 'paragraph',
              version: 1,
              children: [
                {
                  type: 'text',
                  text: 'لإضافة منتج جديد، اذهب إلى قسم "المنتجات" في لوحة التحكم، اضغط على "إضافة منتج جديد"، أدخل اسم المنتج، السعر، الباركود (اختياري)، والفئة، ثم احفظ التغييرات.',
                  format: '' as const,
                  style: '',
                },
              ],
              direction: 'rtl' as const,
              format: '' as const,
              indent: 0,
            },
          ],
          direction: 'rtl' as const,
          format: '' as const,
          indent: 0,
          version: 1,
        },
      },
      category: categories.operateCategory?.id,
    },
    {
      question: 'كيف أتابع كميات المخزون؟',
      answer: {
        root: {
          type: 'root',
          children: [
            {
              type: 'paragraph',
              version: 1,
              children: [
                {
                  type: 'text',
                  text: 'يمكنك متابعة المخزون من قسم "المخزون" في لوحة التحكم. يعرض النظام الكميات الحالية لكل منتج، وينبهك عند انخفاض الكمية عن الحد الأدنى المحدد مسبقاً.',
                  format: '' as const,
                  style: '',
                },
              ],
              direction: 'rtl' as const,
              format: '' as const,
              indent: 0,
            },
          ],
          direction: 'rtl' as const,
          format: '' as const,
          indent: 0,
          version: 1,
        },
      },
      category: categories.operateCategory?.id,
    },
    {
      question: 'كيف أدير طلبات التوصيل والطلبات الحضورية؟',
      answer: {
        root: {
          type: 'root',
          children: [
            {
              type: 'paragraph',
              version: 1,
              children: [
                {
                  type: 'text',
                  text: 'يمكنك إدارة جميع الطلبات من محطة الطلبات. يظهر النظام الطلبات الحضورية وطلبات التوصيل في شاشة موحدة، مع إمكانية تتبع حالة كل طلب وتحديث المراحل.',
                  format: '' as const,
                  style: '',
                },
              ],
              direction: 'rtl' as const,
              format: '' as const,
              indent: 0,
            },
          ],
          direction: 'rtl' as const,
          format: '' as const,
          indent: 0,
          version: 1,
        },
      },
      category: categories.operateCategory?.id,
    },

    // إدارة - Management FAQs
    {
      question: 'كيف أطلع على تقارير المبيعات؟',
      answer: {
        root: {
          type: 'root',
          children: [
            {
              type: 'paragraph',
              version: 1,
              children: [
                {
                  type: 'text',
                  text: 'اذهب إلى قسم "التحليلات" في لوحة التحكم لمشاهدة تقارير مفصلة عن المبيعات، الأرباح، والمنتجات الأكثر مبيعاً. يمكنك تصفية التقارير حسب التاريخ، الفرع، أو فئة المنتج.',
                  format: '' as const,
                  style: '',
                },
              ],
              direction: 'rtl' as const,
              format: '' as const,
              indent: 0,
            },
          ],
          direction: 'rtl' as const,
          format: '' as const,
          indent: 0,
          version: 1,
        },
      },
      category: categories.manageCategory?.id,
    },
    {
      question: 'كيف أدير فروع متعددة؟',
      answer: {
        root: {
          type: 'root',
          children: [
            {
              type: 'paragraph',
              version: 1,
              children: [
                {
                  type: 'text',
                  text: 'من قسم "الفروع" يمكنك إضافة فروع جديدة، تعيين مديري الفروع، ومتابعة أداء كل فرع منفصلاً. كما يمكنك مزامنة المنتجات والأسعار بين الفروع.',
                  format: '' as const,
                  style: '',
                },
              ],
              direction: 'rtl' as const,
              format: '' as const,
              indent: 0,
            },
          ],
          direction: 'rtl' as const,
          format: '' as const,
          indent: 0,
          version: 1,
        },
      },
      category: categories.manageCategory?.id,
    },
    {
      question: 'كيف أدير بيانات العملاء وبرامج الولاء؟',
      answer: {
        root: {
          type: 'root',
          children: [
            {
              type: 'paragraph',
              version: 1,
              children: [
                {
                  type: 'text',
                  text: 'من قسم "العملاء" يمكنك حفظ بيانات العملاء، تتبع مشترياتهم، وإعداد برامج الولاء. يمكنك منح نقاط للعملاء وإنشاء مكافآت تلقائية بناءً على قيمة المشتريات.',
                  format: '' as const,
                  style: '',
                },
              ],
              direction: 'rtl' as const,
              format: '' as const,
              indent: 0,
            },
          ],
          direction: 'rtl' as const,
          format: '' as const,
          indent: 0,
          version: 1,
        },
      },
      category: categories.manageCategory?.id,
    },

    // عام - General FAQs
    {
      question: 'هل يمكن استخدام النظام بدون إنترنت؟',
      answer: {
        root: {
          type: 'root',
          children: [
            {
              type: 'paragraph',
              version: 1,
              children: [
                {
                  type: 'text',
                  text: 'نعم، النظام يعمل في وضع عدم الاتصال. يمكنك تسجيل المبيعات والعمليات محلياً، وسيقوم النظام بمزامنة البيانات تلقائياً عند عودة الاتصال بالإنترنت.',
                  format: '' as const,
                  style: '',
                },
              ],
              direction: 'rtl' as const,
              format: '' as const,
              indent: 0,
            },
          ],
          direction: 'rtl' as const,
          format: '' as const,
          indent: 0,
          version: 1,
        },
      },
      category: categories.otherCategory?.id,
    },
    {
      question: 'كيف أربط النظام مع تطبيقات التوصيل؟',
      answer: {
        root: {
          type: 'root',
          children: [
            {
              type: 'paragraph',
              version: 1,
              children: [
                {
                  type: 'text',
                  text: 'يمكنك ربط النظام مع تطبيقات التوصيل من قسم "التطبيقات" في لوحة التحكم. نحن نتكامل مع معظم تطبيقات التوصيل المحلية والعالمية مثل هنقرستيشن، طلبات، وأوبر إيتس.',
                  format: '' as const,
                  style: '',
                },
              ],
              direction: 'rtl' as const,
              format: '' as const,
              indent: 0,
            },
          ],
          direction: 'rtl' as const,
          format: '' as const,
          indent: 0,
          version: 1,
        },
      },
      category: categories.otherCategory?.id,
    },
    {
      question: 'كيف أحمّل النظام على أجهزة متعددة؟',
      answer: {
        root: {
          type: 'root',
          children: [
            {
              type: 'paragraph',
              version: 1,
              children: [
                {
                  type: 'text',
                  text: 'يمكنك تحميل تطبيق مرن على أي عدد من الأجهزة (تابلت، جوال، أو حاسوب) وتسجيل الدخول بنفس الحساب. سيتم مزامنة البيانات تلقائياً بين جميع الأجهزة.',
                  format: '' as const,
                  style: '',
                },
              ],
              direction: 'rtl' as const,
              format: '' as const,
              indent: 0,
            },
          ],
          direction: 'rtl' as const,
          format: '' as const,
          indent: 0,
          version: 1,
        },
      },
      category: categories.otherCategory?.id,
    },
    {
      question: 'ماذا أفعل إذا واجهت مشكلة تقنية؟',
      answer: {
        root: {
          type: 'root',
          children: [
            {
              type: 'paragraph',
              version: 1,
              children: [
                {
                  type: 'text',
                  text: 'في حال واجهت أي مشكلة تقنية، يمكنك التواصل مع فريق الدعم الفني على مدار 24/7 من خلال الدردشة المباشرة في التطبيق، أو الاتصال على رقم الدعم، أو إرسال بريد إلكتروني.',
                  format: '' as const,
                  style: '',
                },
              ],
              direction: 'rtl' as const,
              format: '' as const,
              indent: 0,
            },
          ],
          direction: 'rtl' as const,
          format: '' as const,
          indent: 0,
          version: 1,
        },
      },
      category: categories.otherCategory?.id,
    },
  ]

  // Create FAQs in parallel
  const faqPromises = faqsData.map(async (faqData) => {
    try {
      return await payload.create({
        collection: 'faq',
        depth: 0,
        data: faqData,
        req,
      })
    } catch (error) {
      payload.logger.error(
        `Failed to create FAQ "${faqData.question}": ${error instanceof Error ? error.message : String(error)}`,
      )
      return null
    }
  })

  const faqResults = await Promise.all(faqPromises)
  const faqs = faqResults.filter((faq) => faq !== null)

  payload.logger.info(`✓ Seeded ${faqs.length} FAQs`)

  return faqs
}
