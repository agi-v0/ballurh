import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-vercel-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   CREATE TYPE "public"."enum_testimonialsBlock_bg_color" AS ENUM('lightTeal', 'violet', 'gray', 'inverted');
  CREATE TYPE "public"."enum__testimonialsBlock_v_bg_color" AS ENUM('lightTeal', 'violet', 'gray', 'inverted');
  ALTER TABLE "testimonialsBlock" ADD COLUMN "bg_color" "enum_testimonialsBlock_bg_color" DEFAULT 'gray';
  ALTER TABLE "_testimonialsBlock_v" ADD COLUMN "bg_color" "enum__testimonialsBlock_v_bg_color" DEFAULT 'gray';`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "testimonialsBlock" DROP COLUMN IF EXISTS "bg_color";
  ALTER TABLE "_testimonialsBlock_v" DROP COLUMN IF EXISTS "bg_color";
  DROP TYPE "public"."enum_testimonialsBlock_bg_color";
  DROP TYPE "public"."enum__testimonialsBlock_v_bg_color";`)
}
