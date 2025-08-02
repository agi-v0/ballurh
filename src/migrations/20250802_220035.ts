import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-vercel-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   CREATE TYPE "public"."enum_pages_hero_list_style" AS ENUM('bullet', 'numbered', 'icons');
  CREATE TYPE "public"."enum__pages_v_version_hero_list_style" AS ENUM('bullet', 'numbered', 'icons');
  CREATE TABLE IF NOT EXISTS "pages_hero_list_items" (
  	"_order" integer NOT NULL,
  	"_parent_id" uuid NOT NULL,
  	"id" varchar PRIMARY KEY NOT NULL,
  	"icon" varchar
  );
  
  CREATE TABLE IF NOT EXISTS "pages_hero_list_items_locales" (
  	"text" varchar,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" varchar NOT NULL
  );
  
  CREATE TABLE IF NOT EXISTS "_pages_v_version_hero_list_items" (
  	"_order" integer NOT NULL,
  	"_parent_id" uuid NOT NULL,
  	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
  	"icon" varchar,
  	"_uuid" varchar
  );
  
  CREATE TABLE IF NOT EXISTS "_pages_v_version_hero_list_items_locales" (
  	"text" varchar,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" uuid NOT NULL
  );
  
  ALTER TABLE "pages" ALTER COLUMN "hero_type" SET DEFAULT 'mediumImpact';
  ALTER TABLE "_pages_v" ALTER COLUMN "version_hero_type" SET DEFAULT 'mediumImpact';
  ALTER TABLE "pages" ADD COLUMN "hero_list_style" "enum_pages_hero_list_style" DEFAULT 'bullet';
  ALTER TABLE "_pages_v" ADD COLUMN "version_hero_list_style" "enum__pages_v_version_hero_list_style" DEFAULT 'bullet';
  DO $$ BEGIN
   ALTER TABLE "pages_hero_list_items" ADD CONSTRAINT "pages_hero_list_items_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "pages_hero_list_items_locales" ADD CONSTRAINT "pages_hero_list_items_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages_hero_list_items"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "_pages_v_version_hero_list_items" ADD CONSTRAINT "_pages_v_version_hero_list_items_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "_pages_v_version_hero_list_items_locales" ADD CONSTRAINT "_pages_v_version_hero_list_items_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v_version_hero_list_items"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  CREATE INDEX IF NOT EXISTS "pages_hero_list_items_order_idx" ON "pages_hero_list_items" USING btree ("_order");
  CREATE INDEX IF NOT EXISTS "pages_hero_list_items_parent_id_idx" ON "pages_hero_list_items" USING btree ("_parent_id");
  CREATE UNIQUE INDEX IF NOT EXISTS "pages_hero_list_items_locales_locale_parent_id_unique" ON "pages_hero_list_items_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX IF NOT EXISTS "_pages_v_version_hero_list_items_order_idx" ON "_pages_v_version_hero_list_items" USING btree ("_order");
  CREATE INDEX IF NOT EXISTS "_pages_v_version_hero_list_items_parent_id_idx" ON "_pages_v_version_hero_list_items" USING btree ("_parent_id");
  CREATE UNIQUE INDEX IF NOT EXISTS "_pages_v_version_hero_list_items_locales_locale_parent_id_unique" ON "_pages_v_version_hero_list_items_locales" USING btree ("_locale","_parent_id");`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "pages_hero_list_items" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "pages_hero_list_items_locales" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_pages_v_version_hero_list_items" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_pages_v_version_hero_list_items_locales" DISABLE ROW LEVEL SECURITY;
  DROP TABLE "pages_hero_list_items" CASCADE;
  DROP TABLE "pages_hero_list_items_locales" CASCADE;
  DROP TABLE "_pages_v_version_hero_list_items" CASCADE;
  DROP TABLE "_pages_v_version_hero_list_items_locales" CASCADE;
  ALTER TABLE "pages" ALTER COLUMN "hero_type" SET DEFAULT 'lowImpact';
  ALTER TABLE "_pages_v" ALTER COLUMN "version_hero_type" SET DEFAULT 'lowImpact';
  ALTER TABLE "pages" DROP COLUMN IF EXISTS "hero_list_style";
  ALTER TABLE "_pages_v" DROP COLUMN IF EXISTS "version_hero_list_style";
  DROP TYPE "public"."enum_pages_hero_list_style";
  DROP TYPE "public"."enum__pages_v_version_hero_list_style";`)
}
