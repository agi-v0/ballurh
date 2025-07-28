import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-vercel-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   CREATE TABLE IF NOT EXISTS "categories_locales" (
  	"title" varchar NOT NULL,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" uuid NOT NULL
  );
  
  DO $$ BEGIN
   ALTER TABLE "categories_locales" ADD CONSTRAINT "categories_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."categories"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  CREATE UNIQUE INDEX IF NOT EXISTS "categories_locales_locale_parent_id_unique" ON "categories_locales" USING btree ("_locale","_parent_id");
  ALTER TABLE "categories" DROP COLUMN IF EXISTS "title";
  ALTER TABLE "public"."featuresBlock" ALTER COLUMN "type" SET DATA TYPE text;
  DROP TYPE "public"."enum_featuresBlock_type" CASCADE;
  CREATE TYPE "public"."enum_featuresBlock_type" AS ENUM('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '14');
  ALTER TABLE "public"."featuresBlock" ALTER COLUMN "type" SET DATA TYPE "public"."enum_featuresBlock_type" USING "type"::"public"."enum_featuresBlock_type";
  ALTER TABLE "public"."_featuresBlock_v" ALTER COLUMN "type" SET DATA TYPE text;
  DROP TYPE "public"."enum__featuresBlock_v_type" CASCADE;
  CREATE TYPE "public"."enum__featuresBlock_v_type" AS ENUM('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '14');
  ALTER TABLE "public"."_featuresBlock_v" ALTER COLUMN "type" SET DATA TYPE "public"."enum__featuresBlock_v_type" USING "type"::"public"."enum__featuresBlock_v_type";`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TYPE "public"."enum_featuresBlock_type" ADD VALUE '13' BEFORE '14';
  ALTER TYPE "public"."enum_featuresBlock_type" ADD VALUE '15';
  ALTER TYPE "public"."enum_featuresBlock_type" ADD VALUE '16';
  ALTER TYPE "public"."enum_featuresBlock_type" ADD VALUE '17';
  ALTER TYPE "public"."enum__featuresBlock_v_type" ADD VALUE '13' BEFORE '14';
  ALTER TYPE "public"."enum__featuresBlock_v_type" ADD VALUE '15';
  ALTER TYPE "public"."enum__featuresBlock_v_type" ADD VALUE '16';
  ALTER TYPE "public"."enum__featuresBlock_v_type" ADD VALUE '17';
  DROP TABLE "categories_locales" CASCADE;
  ALTER TABLE "categories" ADD COLUMN "title" varchar NOT NULL;`)
}
