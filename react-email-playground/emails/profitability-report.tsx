import {
  Body,
  Button,
  Column,
  Container,
  Head,
  Heading,
  Hr,
  Html,
  Preview,
  Row,
  Section,
  Text,
} from '@react-email/components'

type PnlItem = {
  label: string
  amount: string // positive numbers; expenses will be shown with minus styling
  type: 'revenue' | 'expense'
}

export type ProfitabilityReportEmailProps = {
  restaurantName?: string
  periodLabel?: string // e.g. "September 2025"
  profit?: number // net profit amount
  profitRate?: number // e.g. 0.18 (18%) or 18 (18%)
  expenseRate?: number // e.g. 0.18 (18%) or 18 (18%)
  savedDisputes?: number
  ctaUrl?: string
  ctaLabel?: string
  pnl?: PnlItem[]
  pnlFooter?: PnlItem[]
  recommendations?: Recommendation[]
}

type Recommendation = {
  title?: string
  description: string
  impact?: 'high' | 'medium' | 'low'
}

const defaultPnl: PnlItem[] = [
  { label: 'المبيعات الشهرية', amount: 'SAR 100,000', type: 'revenue' },
  {
    label: 'عدد الطلبات الشهرية من تطبيقات التوصيل ',
    amount: '850',
    type: 'revenue',
  },
  {
    label: 'مبلغ المدفوعات الالكترونية',
    amount: 'SAR 2,500',
    type: 'expense',
  },
  {
    label: 'مبلغ العمولات على المبيعات',
    amount: 'SAR 25,000',
    type: 'expense',
  },
  {
    label: 'منازعات واستردادات (مبلغ التعويضات)',
    amount: 'SAR 5,000',
    type: 'expense',
  },
  { label: 'اجمالى التسويق', amount: 'SAR 10,500', type: 'expense' },
  {
    label: 'اجمالى العمولات & التعويضات & التسويق',
    amount: 'SAR 43,000',
    type: 'expense',
  },
]

const defaultPnlFooter: PnlItem[] = [
  // {
  //   label: 'صافى المبيعات المحققة',
  //   amount: 'SAR 57,000',
  //   type: 'revenue',
  // },
  // {
  //   label: 'كم لازم ترفع اسعارك عشان تغطي كامل تكلفة نسبة التطبيق',
  //   amount: '75%',
  //   type: 'revenue',
  // },
  { label: 'صافي الربح', amount: 'SAR 27,000', type: 'revenue' },
  { label: 'نسبة صافي الربح من المبيعات', amount: '27%', type: 'revenue' },
  { label: 'نسبة النفقات من المبيعات', amount: '27%', type: 'expense' },
]

const defaultRecommendations: Recommendation[] = [
  {
    title: 'تحسين مزيج المنتجات (Menu Engineering)',
    description:
      'ركّز على الأطباق عالية الهامش وقلّل من العناصر ذات الطلب المنخفض أو الهامش المنخفض. أبرز الأطباق الرابحة في القائمة وعرّف الفريق عليها.',
    impact: 'high',
  },
  {
    title: 'جدولة العمالة حسب الطلب',
    description:
      'استخدم بيانات المبيعات لتعديل الجداول في أوقات الذروة والهدوء. خفّض الساعات غير المنتجة وامنح مرونة أكبر في توزيع المهام.',
    impact: 'medium',
  },
  {
    title: 'التفاوض مع المورّدين ومراقبة الهدر',
    description:
      'راجع الأسعار مع المورّدين بانتظام، وحسِّن حصص التحضير لتقليل الهدر. طبّق جردًا أسبوعيًا سريعًا لعناصر COGS الحساسة.',
    impact: 'medium',
  },
]

export function ProfitabilityReportEmail(props: ProfitabilityReportEmailProps) {
  const restaurantName = props.restaurantName ?? 'مطعمك'
  const periodLabel = props.periodLabel ?? 'هذا الشهر'
  const pnl = props.pnl ?? defaultPnl
  const pnlFooter = props.pnlFooter ?? defaultPnlFooter
  const recommendations = props.recommendations ?? defaultRecommendations
  const hasRecommendations = recommendations.length > 0

  const totalRevenue = pnl
    .filter((i) => i.type === 'revenue')
    .reduce((sum, i) => sum + parseInt(i.amount), 0)
  const totalExpenses = pnl
    .filter((i) => i.type === 'expense')
    .reduce((sum, i) => sum + parseInt(i.amount), 0)
  const computedProfit = totalRevenue - totalExpenses

  const parsedProfit = props.profit ?? 45000
  const parsedProfitRate = props.profitRate ?? 0.3
  const parsedSavedDisputes = props.savedDisputes ?? 4500

  const parsedExpenseRate = props.expenseRate ?? 0.3

  const profit = parsedProfit.toLocaleString('en-US', {
    style: 'currency',
    currency: 'SAR',
    maximumFractionDigits: 0,
  })

  const savedDisputes = parsedSavedDisputes.toLocaleString('en-US', {
    style: 'currency',
    currency: 'SAR',
    maximumFractionDigits: 0,
  })

  const profitRate = `${parsedProfitRate * 100}%`

  const expenseRate = `${parsedExpenseRate * 100}%`

  const profitRateWithBallurh = `${Math.round(parsedProfitRate * 1.3 * 100)}% - ${Math.round(parsedProfitRate * 1.15 * 100)}%`
  const profitWithBallurh = `${Math.round(parsedProfit * 1.3).toLocaleString('en', { style: 'currency', maximumFractionDigits: 0, currency: 'sar' })} - ${Math.round(parsedProfit * 1.15).toLocaleString('en', { style: 'currency', maximumFractionDigits: 0, currency: 'sar' })}`
  console.log('parsed profit: ', profit)

  const ctaUrl = props.ctaUrl ?? 'https://example.com/dashboard/reports'
  const ctaLabel = props.ctaLabel ?? 'عرض التقرير الكامل'

  return (
    <Html dir="rtl">
      <Head />
      <Preview> — تقرير الربحية لـ{restaurantName} صار جاهز!</Preview>
      <Body style={main} dir="rtl">
        <Container style={container}>
          <Section style={box}>
            <Text style={eyebrow}>{restaurantName}</Text>
            <Heading as="h1">تقرير الربحية</Heading>
            <Text style={subTitle}>{periodLabel}</Text>
            <Text style={subTitle}> نتائج الربح والخسارة بناءا على مدخلاتك بشكل وسطي هي:</Text>
            <Text style={{ ...subTitle, color: '#b42318' }}>
              تنبيه: الأرقام التالية مبنية على مدخلاتك في نموذج حاسبة الربحية فقط، وهي تقديرات
              تقريبية ولم يتم التحقق منها كمخرجات مالية رسمية.
            </Text>
            {/* <div style={kpiCard}>
              <Text style={kpiLabel}>الربح المُقدّر</Text>
              <Text
                style={{
                  ...kpiValue,
                  color: parsedProfit >= 0 ? '#0a7c4a' : '#b42318',
                }}
              >
                {profit}
              </Text>
            </div>

            <div style={kpiCard}>
              <Text style={kpiLabel}>نسبة الربح</Text>
              <Text style={kpiValue}>{profitRate}</Text>
            </div> */}
            {/* <Hr style={hr} /> */}
            <Heading as="h2">بيان الأرباح والخسائر</Heading>
            <table style={table} cellPadding={0} cellSpacing={0}>
              <thead>
                <tr>
                  <th style={thLeft}>الفئة</th>
                  <th style={thRight}>المبلغ</th>
                </tr>
              </thead>
              <tbody>
                {pnl
                  .filter((i) => i.type === 'revenue')
                  .map((item, idx) => (
                    <tr key={`rev-${idx}`}>
                      <td style={tdLeft}>{item.label}</td>
                      <td style={{ ...tdRight, color: '#0a7c4a' }}>{item.amount}</td>
                    </tr>
                  ))}
                {/* <tr>
                  <td style={{ ...tdLeft, fontWeight: 600 }}>إجمالي الإيرادات</td>
                  <td style={{ ...tdRight, fontWeight: 600 }}>{totalRevenue}</td>
                </tr> */}
                <tr>
                  <td colSpan={2} style={spacerRow}></td>
                </tr>
                {pnl
                  .filter((i) => i.type === 'expense')
                  .map((item, idx) => (
                    <tr key={`exp-${idx}`}>
                      <td style={tdLeft}>{item.label}</td>
                      <td style={{ ...tdRight, color: '#b42318' }}>{item.amount}-</td>
                    </tr>
                  ))}
                {/* <tr>
                  <td style={{ ...tdLeft, fontWeight: 600 }}>إجمالي المصروفات</td>
                  <td style={{ ...tdRight, fontWeight: 600 }}>-{totalExpenses}</td>
                </tr> */}
                <tr>
                  <td colSpan={2} style={spacerRow}></td>
                </tr>
                {pnlFooter.map((item, idx) => (
                  <tr key={`footer-${idx}`}>
                    <td style={{ ...tdLeft, fontWeight: 700 }}>{item.label}</td>
                    <td
                      style={{
                        ...tdRight,
                        fontWeight: 700,
                        color: item.type === 'revenue' ? '#0a7c4a' : '#b42318',
                      }}
                    >
                      {`${item.amount}${item.type === 'expense' ? '-' : ''}`}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
            <br />
            <Heading as="h3">مع بلّورة، صافي ربحك ممكن يكون </Heading>
            <div
              style={{
                backgroundColor: '#ecfff9',
                borderRadius: '8px',
                margin: '20px 0',
                padding: '16px',
              }}
            >
              <Text style={kpiLabel}>صافي الربح</Text>
              <Text
                dir="ltr"
                style={{
                  ...kpiValue,
                  textAlign: 'right',
                  fontSize: '24px',
                  margin: '4px 0 16px 0',
                }}
              >
                {profitWithBallurh}
              </Text>
              <Text style={kpiLabel}>نسبة الربح</Text>
              <Text
                dir="ltr"
                style={{
                  ...kpiValue,
                  textAlign: 'right',
                  fontSize: '24px',
                  margin: '4px 0 16px 0',
                }}
              >
                {profitRateWithBallurh}
              </Text>
              <Text style={kpiLabel}>التعويضات المستردة</Text>
              <Text
                dir="ltr"
                style={{
                  ...kpiValue,
                  textAlign: 'right',
                  fontSize: '24px',
                  margin: '4px 0 16px 0',
                }}
              >
                {savedDisputes}
              </Text>
              <Text style={{ ...kpiLabel, marginTop: '8px' }}>
                تقدير افتراضي يعتمد على نفس بيانات نموذج حاسبة الربحية؛ نتائجك الفعلية قد تختلف
                وتتطلب مراجعة مالية مختصة.
              </Text>
            </div>
            {hasRecommendations && (
              <>
                <Text style={sectionTitle}>توصيات لتحسين الربحية</Text>
                {recommendations.map((rec, idx) => {
                  const impactLabel =
                    rec.impact === 'high'
                      ? 'مرتفع'
                      : rec.impact === 'medium'
                        ? 'متوسط'
                        : rec.impact === 'low'
                          ? 'منخفض'
                          : undefined
                  const impactColors =
                    rec.impact === 'high'
                      ? { backgroundColor: '#ecfdf5', color: '#065f46' } // green
                      : rec.impact === 'medium'
                        ? { backgroundColor: '#fffbeb', color: '#92400e' } // amber
                        : rec.impact === 'low'
                          ? { backgroundColor: '#f3f4f6', color: '#374151' } // gray
                          : undefined
                  return (
                    <div key={`rec-${idx}`} style={recCard}>
                      {rec.title && <Text style={recTitleText}>{rec.title}</Text>}
                      <Text style={recBodyText}>{rec.description}</Text>
                      {impactLabel && (
                        <span style={{ ...chip, ...(impactColors || {}) }}>
                          تأثير: {impactLabel}
                        </span>
                      )}
                    </div>
                  )
                })}
                <Hr style={hr} />
              </>
            )}
            <Text style={paragraph}>
              هل تريد خطة مخصّصة لزيادة هامش الربح بناءً على بيانات مطعمك؟ احجز مكالمة مجانية لمدة
              30 دقيقة لنراجع التقرير معك ونقترح خطوات عملية قابلة للتنفيذ.
            </Text>
            <Button style={button} href={ctaUrl}>
              {ctaLabel}
            </Button>
            <Hr style={hr} />
            <Text style={footer}>
              وصلتك هذه الرسالة لأنك قدّمت نموذج «حاسبة الربحية» لـ {restaurantName}. إذا لم تطلب
              هذا التقرير فتجاهل الرسالة، ولأي استفسار يُمكنك الرد على هذه الرسالة.
            </Text>
          </Section>
        </Container>
      </Body>
    </Html>
  )
}

export default ProfitabilityReportEmail

const main = {
  backgroundColor: '#f1f5f9',
  fontFamily:
    '-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Ubuntu,sans-serif',
}

const container = {
  backgroundColor: '#ffffff',
  margin: '0 auto',
  padding: '16px 16px 48px',
  marginBottom: '64px',
}

const box = {}

const eyebrow = {
  color: '#FF5C35',
  fontSize: '12px',
  letterSpacing: '0.08em',
  textTransform: 'uppercase' as const,
  margin: '0 0 6px 0',
}

const title = {
  color: '#06262D',
  fontSize: '24px',
  fontWeight: 700,
  margin: '0',
}

const subTitle = {
  color: '#5b6b7a',
  fontSize: '14px',
  margin: '4px 0 16px 0',
}

const sectionTitle = {
  color: '#06262D',
  fontSize: '16px',
  fontWeight: 600,
  margin: '8px 0 12px 0',
}

const kpiRow = {
  margin: '12px 0 8px 0',
}

const kpiCard = {
  backgroundColor: '#f8fafc',
  borderRadius: '8px',
  padding: '12px',
  margin: '0 0 8px 0px',
}

const kpiLabel = {
  color: '#5b6b7a',
  fontSize: '12px',
  margin: 0,
}

const kpiValue = {
  fontSize: '20px',
  fontWeight: 700,
  margin: '2px 0 0 0',
  color: '#06262d',
}

const table = {
  width: '100%',
  borderCollapse: 'collapse' as const,
  marginTop: '8px',
}

const thLeft = {
  textAlign: 'start' as const, // RTL: right
  color: '#5b6b7a',
  fontSize: '12px',
  fontWeight: 600,
  padding: '8px 0',
  borderBottom: '1px solid #e6ebf1',
}

const thRight = {
  textAlign: 'end' as const, // RTL: left
  color: '#5b6b7a',
  fontSize: '12px',
  fontWeight: 600,
  padding: '8px 0',
  borderBottom: '1px solid #e6ebf1',
}

const tdLeft = {
  padding: '10px 0',
  fontSize: '14px',
  color: '#17202a',
  textAlign: 'start' as const, // RTL: right
  borderBottom: '1px solid #f1f5f9',
}

const tdRight = {
  padding: '10px 0',
  fontSize: '14px',
  textAlign: 'end' as const, // RTL: left
  color: '#17202a',
  borderBottom: '1px solid #f1f5f9',
}

const spacerRow = {
  padding: '6px 0',
}

const paragraph = {
  color: '#525f7f',
  fontSize: '14px',
  lineHeight: '22px',
  textAlign: 'right' as const,
}

const button = {
  backgroundColor: '#06262D',
  borderRadius: '12px',
  color: '#fff',
  fontSize: '16px',
  fontWeight: 500,
  textDecoration: 'none',
  textAlign: 'center' as const,
  display: 'block',
  padding: '12px',
  marginTop: '12px',
}

const hr = {
  borderColor: '#e6ebf1',
  margin: '20px 0',
}

const footer = {
  color: '#8898aa',
  fontSize: '12px',
  lineHeight: '16px',
}

const recCard = {
  backgroundColor: '#f1f5f9',
  borderRadius: '8px',
  padding: '12px',
  margin: '8px 0',
}

const recTitleText = {
  color: '#17202a',
  fontSize: '14px',
  fontWeight: 600,
  margin: '0 0 4px 0',
}

const recBodyText = {
  color: '#525f7f',
  fontSize: '13px',
  lineHeight: '20px',
  margin: 0,
  textAlign: 'right' as const,
}

const chip = {
  display: 'inline-block',
  borderRadius: '9999px',
  padding: '2px 8px',
  fontSize: '12px',
  fontWeight: 700,
  marginTop: '6px',
}
