import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "featuresBlock_columns_locales" ADD COLUMN "stat_value" varchar;
  ALTER TABLE "featuresBlock_locales" ADD COLUMN "stat_value" varchar;
  ALTER TABLE "metricsBlock_stats_locales" ADD COLUMN "value" varchar;
  ALTER TABLE "_featuresBlock_v_columns_locales" ADD COLUMN "stat_value" varchar;
  ALTER TABLE "_featuresBlock_v_locales" ADD COLUMN "stat_value" varchar;
  ALTER TABLE "_metricsBlock_v_stats_locales" ADD COLUMN "value" varchar;
  ALTER TABLE "customers_testimonial_stats_locales" ADD COLUMN "value" varchar;
  ALTER TABLE "_customers_v_version_testimonial_stats_locales" ADD COLUMN "value" varchar;
  ALTER TABLE "featuresBlock_columns" DROP COLUMN IF EXISTS "stat_value";
  ALTER TABLE "featuresBlock" DROP COLUMN IF EXISTS "stat_value";
  ALTER TABLE "metricsBlock_stats" DROP COLUMN IF EXISTS "value";
  ALTER TABLE "_featuresBlock_v_columns" DROP COLUMN IF EXISTS "stat_value";
  ALTER TABLE "_featuresBlock_v" DROP COLUMN IF EXISTS "stat_value";
  ALTER TABLE "_metricsBlock_v_stats" DROP COLUMN IF EXISTS "value";
  ALTER TABLE "customers_testimonial_stats" DROP COLUMN IF EXISTS "value";
  ALTER TABLE "_customers_v_version_testimonial_stats" DROP COLUMN IF EXISTS "value";`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "featuresBlock_columns" ADD COLUMN "stat_value" varchar;
  ALTER TABLE "featuresBlock" ADD COLUMN "stat_value" varchar;
  ALTER TABLE "metricsBlock_stats" ADD COLUMN "value" varchar;
  ALTER TABLE "_featuresBlock_v_columns" ADD COLUMN "stat_value" varchar;
  ALTER TABLE "_featuresBlock_v" ADD COLUMN "stat_value" varchar;
  ALTER TABLE "_metricsBlock_v_stats" ADD COLUMN "value" varchar;
  ALTER TABLE "customers_testimonial_stats" ADD COLUMN "value" varchar;
  ALTER TABLE "_customers_v_version_testimonial_stats" ADD COLUMN "value" varchar;
  ALTER TABLE "featuresBlock_columns_locales" DROP COLUMN IF EXISTS "stat_value";
  ALTER TABLE "featuresBlock_locales" DROP COLUMN IF EXISTS "stat_value";
  ALTER TABLE "metricsBlock_stats_locales" DROP COLUMN IF EXISTS "value";
  ALTER TABLE "_featuresBlock_v_columns_locales" DROP COLUMN IF EXISTS "stat_value";
  ALTER TABLE "_featuresBlock_v_locales" DROP COLUMN IF EXISTS "stat_value";
  ALTER TABLE "_metricsBlock_v_stats_locales" DROP COLUMN IF EXISTS "value";
  ALTER TABLE "customers_testimonial_stats_locales" DROP COLUMN IF EXISTS "value";
  ALTER TABLE "_customers_v_version_testimonial_stats_locales" DROP COLUMN IF EXISTS "value";`)
}
