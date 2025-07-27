import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-vercel-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   CREATE TYPE "public"."enum_featuresBlock_columns_stat_indicator" AS ENUM('increase', 'decrease', 'noChange');
  CREATE TYPE "public"."enum__featuresBlock_v_columns_stat_indicator" AS ENUM('increase', 'decrease', 'noChange');
  ALTER TABLE "featuresBlock_columns_locales" ADD COLUMN "stat_label" varchar;
  ALTER TABLE "featuresBlock_columns_locales" ADD COLUMN "stat_value" varchar;
  ALTER TABLE "featuresBlock_columns_locales" ADD COLUMN "stat_indicator" "enum_featuresBlock_columns_stat_indicator" DEFAULT 'noChange';
  ALTER TABLE "_featuresBlock_v_columns_locales" ADD COLUMN "stat_label" varchar;
  ALTER TABLE "_featuresBlock_v_columns_locales" ADD COLUMN "stat_value" varchar;
  ALTER TABLE "_featuresBlock_v_columns_locales" ADD COLUMN "stat_indicator" "enum__featuresBlock_v_columns_stat_indicator" DEFAULT 'noChange';`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "featuresBlock_columns_locales" DROP COLUMN IF EXISTS "stat_label";
  ALTER TABLE "featuresBlock_columns_locales" DROP COLUMN IF EXISTS "stat_value";
  ALTER TABLE "featuresBlock_columns_locales" DROP COLUMN IF EXISTS "stat_indicator";
  ALTER TABLE "_featuresBlock_v_columns_locales" DROP COLUMN IF EXISTS "stat_label";
  ALTER TABLE "_featuresBlock_v_columns_locales" DROP COLUMN IF EXISTS "stat_value";
  ALTER TABLE "_featuresBlock_v_columns_locales" DROP COLUMN IF EXISTS "stat_indicator";
  DROP TYPE "public"."enum_featuresBlock_columns_stat_indicator";
  DROP TYPE "public"."enum__featuresBlock_v_columns_stat_indicator";`)
}
