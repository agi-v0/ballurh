import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "callToActionBlock" ALTER COLUMN "type" SET DATA TYPE text;
  ALTER TABLE "callToActionBlock" ALTER COLUMN "type" SET DEFAULT '01'::text;
  DROP TYPE "public"."enum_callToActionBlock_type";
  CREATE TYPE "public"."enum_callToActionBlock_type" AS ENUM('01', '02', '03', '04', '05');
  ALTER TABLE "callToActionBlock" ALTER COLUMN "type" SET DEFAULT '01'::"public"."enum_callToActionBlock_type";
  ALTER TABLE "callToActionBlock" ALTER COLUMN "type" SET DATA TYPE "public"."enum_callToActionBlock_type" USING "type"::"public"."enum_callToActionBlock_type";
  ALTER TABLE "_callToActionBlock_v" ALTER COLUMN "type" SET DATA TYPE text;
  ALTER TABLE "_callToActionBlock_v" ALTER COLUMN "type" SET DEFAULT '01'::text;
  DROP TYPE "public"."enum__callToActionBlock_v_type";
  CREATE TYPE "public"."enum__callToActionBlock_v_type" AS ENUM('01', '02', '03', '04', '05');
  ALTER TABLE "_callToActionBlock_v" ALTER COLUMN "type" SET DEFAULT '01'::"public"."enum__callToActionBlock_v_type";
  ALTER TABLE "_callToActionBlock_v" ALTER COLUMN "type" SET DATA TYPE "public"."enum__callToActionBlock_v_type" USING "type"::"public"."enum__callToActionBlock_v_type";`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TYPE "public"."enum_callToActionBlock_type" ADD VALUE '06';
  ALTER TYPE "public"."enum_callToActionBlock_type" ADD VALUE '07';
  ALTER TYPE "public"."enum__callToActionBlock_v_type" ADD VALUE '06';
  ALTER TYPE "public"."enum__callToActionBlock_v_type" ADD VALUE '07';`)
}
