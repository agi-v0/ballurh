import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "featuresBlock" DROP CONSTRAINT "featuresBlock_block_image_id_media_id_fk";
  
  ALTER TABLE "_featuresBlock_v" DROP CONSTRAINT "_featuresBlock_v_block_image_id_media_id_fk";
  UPDATE "featuresBlock" SET "type" = '08' WHERE "type" = '14';
  UPDATE "_featuresBlock_v" SET "type" = '08' WHERE "type" = '14';
  ALTER TABLE "featuresBlock" ALTER COLUMN "type" SET DATA TYPE text;
  ALTER TABLE "featuresBlock" ALTER COLUMN "type" SET DEFAULT '01'::text;
  DROP TYPE "public"."enum_featuresBlock_type";
  CREATE TYPE "public"."enum_featuresBlock_type" AS ENUM('01', '02', '03', '04', '05', '06', '07', '08');
  ALTER TABLE "featuresBlock" ALTER COLUMN "type" SET DEFAULT '01'::"public"."enum_featuresBlock_type";
  ALTER TABLE "featuresBlock" ALTER COLUMN "type" SET DATA TYPE "public"."enum_featuresBlock_type" USING "type"::"public"."enum_featuresBlock_type";
  ALTER TABLE "_featuresBlock_v" ALTER COLUMN "type" SET DATA TYPE text;
  ALTER TABLE "_featuresBlock_v" ALTER COLUMN "type" SET DEFAULT '01'::text;
  DROP TYPE "public"."enum__featuresBlock_v_type";
  CREATE TYPE "public"."enum__featuresBlock_v_type" AS ENUM('01', '02', '03', '04', '05', '06', '07', '08');
  ALTER TABLE "_featuresBlock_v" ALTER COLUMN "type" SET DEFAULT '01'::"public"."enum__featuresBlock_v_type";
  ALTER TABLE "_featuresBlock_v" ALTER COLUMN "type" SET DATA TYPE "public"."enum__featuresBlock_v_type" USING "type"::"public"."enum__featuresBlock_v_type";
  DROP INDEX "featuresBlock_block_image_idx";
  DROP INDEX "_featuresBlock_v_block_image_idx";
  ALTER TABLE "featuresBlock_locales" ADD COLUMN "block_image_id" uuid;
  ALTER TABLE "_featuresBlock_v_locales" ADD COLUMN "block_image_id" uuid;
  ALTER TABLE "featuresBlock_locales" ADD CONSTRAINT "featuresBlock_locales_block_image_id_media_id_fk" FOREIGN KEY ("block_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "_featuresBlock_v_locales" ADD CONSTRAINT "_featuresBlock_v_locales_block_image_id_media_id_fk" FOREIGN KEY ("block_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  CREATE INDEX "featuresBlock_block_image_idx" ON "featuresBlock_locales" USING btree ("block_image_id","_locale");
  CREATE INDEX "_featuresBlock_v_block_image_idx" ON "_featuresBlock_v_locales" USING btree ("block_image_id","_locale");
  
  -- transfer data using upsert to handle existing records
  UPDATE "featuresBlock_locales" 
  SET "block_image_id" = fb."block_image_id"
  FROM "featuresBlock" fb
  WHERE "featuresBlock_locales"."_parent_id" = fb."id" 
    AND "featuresBlock_locales"."_locale" = 'en'
    AND fb."block_image_id" IS NOT NULL;

  -- for Arabic locale (if you have Arabic data)
  UPDATE "featuresBlock_locales" 
  SET "block_image_id" = fb."block_image_id"
  FROM "featuresBlock" fb
  WHERE "featuresBlock_locales"."_parent_id" = fb."id" 
    AND "featuresBlock_locales"."_locale" = 'ar'
    AND fb."block_image_id" IS NOT NULL;

  ALTER TABLE "featuresBlock_columns_locales" DROP COLUMN "tab_label";
  ALTER TABLE "featuresBlock" DROP COLUMN "block_image_id";
  ALTER TABLE "_featuresBlock_v_columns_locales" DROP COLUMN "tab_label";
  ALTER TABLE "_featuresBlock_v" DROP COLUMN "block_image_id";`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TYPE "public"."enum_featuresBlock_type" ADD VALUE '09';
  ALTER TYPE "public"."enum_featuresBlock_type" ADD VALUE '10';
  ALTER TYPE "public"."enum_featuresBlock_type" ADD VALUE '11';
  ALTER TYPE "public"."enum_featuresBlock_type" ADD VALUE '12';
  ALTER TYPE "public"."enum_featuresBlock_type" ADD VALUE '14';
  ALTER TYPE "public"."enum__featuresBlock_v_type" ADD VALUE '09';
  ALTER TYPE "public"."enum__featuresBlock_v_type" ADD VALUE '10';
  ALTER TYPE "public"."enum__featuresBlock_v_type" ADD VALUE '11';
  ALTER TYPE "public"."enum__featuresBlock_v_type" ADD VALUE '12';
  ALTER TYPE "public"."enum__featuresBlock_v_type" ADD VALUE '14';
  UPDATE "featuresBlock" SET "type" = '14' WHERE "type" = '08';
  UPDATE "_featuresBlock_v" SET "type" = '14' WHERE "type" = '08';
  ALTER TABLE "featuresBlock_locales" DROP CONSTRAINT "featuresBlock_locales_block_image_id_media_id_fk";
  
  ALTER TABLE "_featuresBlock_v_locales" DROP CONSTRAINT "_featuresBlock_v_locales_block_image_id_media_id_fk";
  
  DROP INDEX "featuresBlock_block_image_idx";
  DROP INDEX "_featuresBlock_v_block_image_idx";
  ALTER TABLE "featuresBlock_columns_locales" ADD COLUMN "tab_label" varchar;
  ALTER TABLE "featuresBlock" ADD COLUMN "block_image_id" uuid;
  ALTER TABLE "_featuresBlock_v_columns_locales" ADD COLUMN "tab_label" varchar;
  ALTER TABLE "_featuresBlock_v" ADD COLUMN "block_image_id" uuid;
  ALTER TABLE "featuresBlock" ADD CONSTRAINT "featuresBlock_block_image_id_media_id_fk" FOREIGN KEY ("block_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "_featuresBlock_v" ADD CONSTRAINT "_featuresBlock_v_block_image_id_media_id_fk" FOREIGN KEY ("block_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  CREATE INDEX "featuresBlock_block_image_idx" ON "featuresBlock" USING btree ("block_image_id");
  CREATE INDEX "_featuresBlock_v_block_image_idx" ON "_featuresBlock_v" USING btree ("block_image_id");
  ALTER TABLE "featuresBlock_locales" DROP COLUMN "block_image_id";
  ALTER TABLE "_featuresBlock_v_locales" DROP COLUMN "block_image_id";`)
}
