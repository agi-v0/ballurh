import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-vercel-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   CREATE TYPE "public"."enum_featuresBlock_stat_indicator" AS ENUM('increase', 'decrease', 'noChange');
  CREATE TYPE "public"."enum__featuresBlock_v_stat_indicator" AS ENUM('increase', 'decrease', 'noChange');
  ALTER TABLE "featuresBlock" ADD COLUMN "stat_value" varchar;
  ALTER TABLE "featuresBlock" ADD COLUMN "stat_indicator" "enum_featuresBlock_stat_indicator" DEFAULT 'noChange';
  ALTER TABLE "featuresBlock_locales" ADD COLUMN "stat_label" varchar;
  ALTER TABLE "_featuresBlock_v" ADD COLUMN "stat_value" varchar;
  ALTER TABLE "_featuresBlock_v" ADD COLUMN "stat_indicator" "enum__featuresBlock_v_stat_indicator" DEFAULT 'noChange';
  ALTER TABLE "_featuresBlock_v_locales" ADD COLUMN "stat_label" varchar;`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "featuresBlock" DROP COLUMN IF EXISTS "stat_value";
  ALTER TABLE "featuresBlock" DROP COLUMN IF EXISTS "stat_indicator";
  ALTER TABLE "featuresBlock_locales" DROP COLUMN IF EXISTS "stat_label";
  ALTER TABLE "_featuresBlock_v" DROP COLUMN IF EXISTS "stat_value";
  ALTER TABLE "_featuresBlock_v" DROP COLUMN IF EXISTS "stat_indicator";
  ALTER TABLE "_featuresBlock_v_locales" DROP COLUMN IF EXISTS "stat_label";
  DROP TYPE "public"."enum_featuresBlock_stat_indicator";
  DROP TYPE "public"."enum__featuresBlock_v_stat_indicator";`)
}
