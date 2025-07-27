import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-vercel-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   ALTER TYPE "public"."badge_color" ADD VALUE 'outline';`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "public"."archiveBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."callToActionBlock" ALTER COLUMN "badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."customHtmlBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."faqBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."featuresBlock_columns" ALTER COLUMN "badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."featuresBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."galleryBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."logosBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."metricsBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."richTextBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."testimonialsBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."pages" ALTER COLUMN "hero_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."_archiveBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."_callToActionBlock_v" ALTER COLUMN "badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."_customHtmlBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."_faqBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."_featuresBlock_v_columns" ALTER COLUMN "badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."_featuresBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."_galleryBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."_logosBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."_metricsBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."_richTextBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."_testimonialsBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE text;
  ALTER TABLE "public"."_pages_v" ALTER COLUMN "version_hero_badge_color" SET DATA TYPE text;
  DROP TYPE "public"."badge_color";
  CREATE TYPE "public"."badge_color" AS ENUM('blue', 'red', 'green', 'yellow', 'gray', 'inverted');
  ALTER TABLE "public"."archiveBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."callToActionBlock" ALTER COLUMN "badge_color" SET DATA TYPE "public"."badge_color" USING "badge_color"::"public"."badge_color";
  ALTER TABLE "public"."customHtmlBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."faqBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."featuresBlock_columns" ALTER COLUMN "badge_color" SET DATA TYPE "public"."badge_color" USING "badge_color"::"public"."badge_color";
  ALTER TABLE "public"."featuresBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."galleryBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."logosBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."metricsBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."richTextBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."testimonialsBlock" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."pages" ALTER COLUMN "hero_badge_color" SET DATA TYPE "public"."badge_color" USING "hero_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."_archiveBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."_callToActionBlock_v" ALTER COLUMN "badge_color" SET DATA TYPE "public"."badge_color" USING "badge_color"::"public"."badge_color";
  ALTER TABLE "public"."_customHtmlBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."_faqBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."_featuresBlock_v_columns" ALTER COLUMN "badge_color" SET DATA TYPE "public"."badge_color" USING "badge_color"::"public"."badge_color";
  ALTER TABLE "public"."_featuresBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."_galleryBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."_logosBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."_metricsBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."_richTextBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."_testimonialsBlock_v" ALTER COLUMN "block_header_badge_color" SET DATA TYPE "public"."badge_color" USING "block_header_badge_color"::"public"."badge_color";
  ALTER TABLE "public"."_pages_v" ALTER COLUMN "version_hero_badge_color" SET DATA TYPE "public"."badge_color" USING "version_hero_badge_color"::"public"."badge_color";`)
}
