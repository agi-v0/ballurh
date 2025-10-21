import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "archiveBlock_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "callToActionBlock_locales" ALTER COLUMN "rich_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "faqBlock_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "featuresBlock_columns_locales" ALTER COLUMN "rich_text_content" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "featuresBlock_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "galleryBlock_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "logosBlock_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "metricsBlock_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "richTextBlock_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "richTextBlock_locales" ALTER COLUMN "content" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "teamBlock_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "testimonialsBlock_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "pages_locales" ALTER COLUMN "hero_rich_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_archiveBlock_v_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_callToActionBlock_v_locales" ALTER COLUMN "rich_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_faqBlock_v_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_featuresBlock_v_columns_locales" ALTER COLUMN "rich_text_content" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_featuresBlock_v_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_galleryBlock_v_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_logosBlock_v_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_metricsBlock_v_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_richTextBlock_v_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_richTextBlock_v_locales" ALTER COLUMN "content" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_teamBlock_v_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_testimonialsBlock_v_locales" ALTER COLUMN "block_header_header_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_pages_v_locales" ALTER COLUMN "version_hero_rich_text" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "blog_posts_locales" ALTER COLUMN "content" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_blog_posts_v_locales" ALTER COLUMN "version_content" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "news_locales" ALTER COLUMN "content" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_news_v_locales" ALTER COLUMN "version_content" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "customers_locales" ALTER COLUMN "testimonial_quote" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "customers_locales" ALTER COLUMN "case_study_content" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_customers_v_locales" ALTER COLUMN "version_testimonial_quote" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;
  ALTER TABLE "_customers_v_locales" ALTER COLUMN "version_case_study_content" SET DEFAULT '{"root":{"children":[{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1}],"direction":null,"format":"","indent":0,"type":"root","version":1}}'::jsonb;`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "archiveBlock_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "callToActionBlock_locales" ALTER COLUMN "rich_text" DROP DEFAULT;
  ALTER TABLE "faqBlock_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "featuresBlock_columns_locales" ALTER COLUMN "rich_text_content" DROP DEFAULT;
  ALTER TABLE "featuresBlock_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "galleryBlock_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "logosBlock_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "metricsBlock_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "richTextBlock_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "richTextBlock_locales" ALTER COLUMN "content" DROP DEFAULT;
  ALTER TABLE "teamBlock_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "testimonialsBlock_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "pages_locales" ALTER COLUMN "hero_rich_text" DROP DEFAULT;
  ALTER TABLE "_archiveBlock_v_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "_callToActionBlock_v_locales" ALTER COLUMN "rich_text" DROP DEFAULT;
  ALTER TABLE "_faqBlock_v_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "_featuresBlock_v_columns_locales" ALTER COLUMN "rich_text_content" DROP DEFAULT;
  ALTER TABLE "_featuresBlock_v_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "_galleryBlock_v_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "_logosBlock_v_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "_metricsBlock_v_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "_richTextBlock_v_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "_richTextBlock_v_locales" ALTER COLUMN "content" DROP DEFAULT;
  ALTER TABLE "_teamBlock_v_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "_testimonialsBlock_v_locales" ALTER COLUMN "block_header_header_text" DROP DEFAULT;
  ALTER TABLE "_pages_v_locales" ALTER COLUMN "version_hero_rich_text" DROP DEFAULT;
  ALTER TABLE "blog_posts_locales" ALTER COLUMN "content" DROP DEFAULT;
  ALTER TABLE "_blog_posts_v_locales" ALTER COLUMN "version_content" DROP DEFAULT;
  ALTER TABLE "news_locales" ALTER COLUMN "content" DROP DEFAULT;
  ALTER TABLE "_news_v_locales" ALTER COLUMN "version_content" DROP DEFAULT;
  ALTER TABLE "customers_locales" ALTER COLUMN "testimonial_quote" DROP DEFAULT;
  ALTER TABLE "customers_locales" ALTER COLUMN "case_study_content" DROP DEFAULT;
  ALTER TABLE "_customers_v_locales" ALTER COLUMN "version_testimonial_quote" DROP DEFAULT;
  ALTER TABLE "_customers_v_locales" ALTER COLUMN "version_case_study_content" DROP DEFAULT;`)
}
