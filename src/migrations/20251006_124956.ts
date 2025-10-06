import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   CREATE TYPE "public"."enum_archiveBlock_block_header_type" AS ENUM('center', 'split', 'start');
  CREATE TYPE "public"."enum_archiveBlock_block_header_badge_type" AS ENUM('label', 'reference');
  CREATE TYPE "public"."enum_archiveBlock_populate_by" AS ENUM('collection', 'selection');
  CREATE TYPE "public"."enum_archiveBlock_relation_to" AS ENUM('blog', 'news');
  CREATE TYPE "public"."enum__archiveBlock_v_block_header_type" AS ENUM('center', 'split', 'start');
  CREATE TYPE "public"."enum__archiveBlock_v_block_header_badge_type" AS ENUM('label', 'reference');
  CREATE TYPE "public"."enum__archiveBlock_v_populate_by" AS ENUM('collection', 'selection');
  CREATE TYPE "public"."enum__archiveBlock_v_relation_to" AS ENUM('blog', 'news');
  CREATE TABLE "archiveBlock_block_header_links" (
  	"_order" integer NOT NULL,
  	"_parent_id" varchar NOT NULL,
  	"id" varchar PRIMARY KEY NOT NULL,
  	"link_type" "link_type" DEFAULT 'reference',
  	"link_new_tab" boolean,
  	"link_url" varchar,
  	"link_color" "link_color" DEFAULT 'neutral',
  	"link_variant" "link_variant" DEFAULT 'primary'
  );
  
  CREATE TABLE "archiveBlock_block_header_links_locales" (
  	"link_label" varchar,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" varchar NOT NULL
  );
  
  CREATE TABLE "archiveBlock" (
  	"_order" integer NOT NULL,
  	"_parent_id" uuid NOT NULL,
  	"_path" text NOT NULL,
  	"id" varchar PRIMARY KEY NOT NULL,
  	"block_header_type" "enum_archiveBlock_block_header_type" DEFAULT 'center',
  	"block_header_badge_type" "enum_archiveBlock_block_header_badge_type",
  	"block_header_badge_color" "badge_color" DEFAULT 'blue',
  	"block_header_badge_icon" varchar,
  	"block_header_badge_icon_position" "badge_icon_position" DEFAULT 'flex-row',
  	"populate_by" "enum_archiveBlock_populate_by" DEFAULT 'collection',
  	"relation_to" "enum_archiveBlock_relation_to" DEFAULT 'blog',
  	"limit" numeric DEFAULT 10,
  	"block_name" varchar
  );
  
  CREATE TABLE "archiveBlock_locales" (
  	"block_header_badge_label" varchar,
  	"block_header_header_text" jsonb,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" varchar NOT NULL
  );
  
  CREATE TABLE "_archiveBlock_v_block_header_links" (
  	"_order" integer NOT NULL,
  	"_parent_id" uuid NOT NULL,
  	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
  	"link_type" "link_type" DEFAULT 'reference',
  	"link_new_tab" boolean,
  	"link_url" varchar,
  	"link_color" "link_color" DEFAULT 'neutral',
  	"link_variant" "link_variant" DEFAULT 'primary',
  	"_uuid" varchar
  );
  
  CREATE TABLE "_archiveBlock_v_block_header_links_locales" (
  	"link_label" varchar,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" uuid NOT NULL
  );
  
  CREATE TABLE "_archiveBlock_v" (
  	"_order" integer NOT NULL,
  	"_parent_id" uuid NOT NULL,
  	"_path" text NOT NULL,
  	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
  	"block_header_type" "enum__archiveBlock_v_block_header_type" DEFAULT 'center',
  	"block_header_badge_type" "enum__archiveBlock_v_block_header_badge_type",
  	"block_header_badge_color" "badge_color" DEFAULT 'blue',
  	"block_header_badge_icon" varchar,
  	"block_header_badge_icon_position" "badge_icon_position" DEFAULT 'flex-row',
  	"populate_by" "enum__archiveBlock_v_populate_by" DEFAULT 'collection',
  	"relation_to" "enum__archiveBlock_v_relation_to" DEFAULT 'blog',
  	"limit" numeric DEFAULT 10,
  	"_uuid" varchar,
  	"block_name" varchar
  );
  
  CREATE TABLE "_archiveBlock_v_locales" (
  	"block_header_badge_label" varchar,
  	"block_header_header_text" jsonb,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" uuid NOT NULL
  );
  
  ALTER TABLE "pages_rels" ADD COLUMN "categories_id" uuid;
  ALTER TABLE "_pages_v_rels" ADD COLUMN "categories_id" uuid;
  ALTER TABLE "archiveBlock_block_header_links" ADD CONSTRAINT "archiveBlock_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."archiveBlock"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "archiveBlock_block_header_links_locales" ADD CONSTRAINT "archiveBlock_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."archiveBlock_block_header_links"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "archiveBlock" ADD CONSTRAINT "archiveBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "archiveBlock_locales" ADD CONSTRAINT "archiveBlock_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."archiveBlock"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_archiveBlock_v_block_header_links" ADD CONSTRAINT "_archiveBlock_v_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_archiveBlock_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_archiveBlock_v_block_header_links_locales" ADD CONSTRAINT "_archiveBlock_v_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_archiveBlock_v_block_header_links"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_archiveBlock_v" ADD CONSTRAINT "_archiveBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_archiveBlock_v_locales" ADD CONSTRAINT "_archiveBlock_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_archiveBlock_v"("id") ON DELETE cascade ON UPDATE no action;
  CREATE INDEX "archiveBlock_block_header_links_order_idx" ON "archiveBlock_block_header_links" USING btree ("_order");
  CREATE INDEX "archiveBlock_block_header_links_parent_id_idx" ON "archiveBlock_block_header_links" USING btree ("_parent_id");
  CREATE UNIQUE INDEX "archiveBlock_block_header_links_locales_locale_parent_id_unique" ON "archiveBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX "archiveBlock_order_idx" ON "archiveBlock" USING btree ("_order");
  CREATE INDEX "archiveBlock_parent_id_idx" ON "archiveBlock" USING btree ("_parent_id");
  CREATE INDEX "archiveBlock_path_idx" ON "archiveBlock" USING btree ("_path");
  CREATE UNIQUE INDEX "archiveBlock_locales_locale_parent_id_unique" ON "archiveBlock_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX "_archiveBlock_v_block_header_links_order_idx" ON "_archiveBlock_v_block_header_links" USING btree ("_order");
  CREATE INDEX "_archiveBlock_v_block_header_links_parent_id_idx" ON "_archiveBlock_v_block_header_links" USING btree ("_parent_id");
  CREATE UNIQUE INDEX "_archiveBlock_v_block_header_links_locales_locale_parent_id_unique" ON "_archiveBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX "_archiveBlock_v_order_idx" ON "_archiveBlock_v" USING btree ("_order");
  CREATE INDEX "_archiveBlock_v_parent_id_idx" ON "_archiveBlock_v" USING btree ("_parent_id");
  CREATE INDEX "_archiveBlock_v_path_idx" ON "_archiveBlock_v" USING btree ("_path");
  CREATE UNIQUE INDEX "_archiveBlock_v_locales_locale_parent_id_unique" ON "_archiveBlock_v_locales" USING btree ("_locale","_parent_id");
  ALTER TABLE "pages_rels" ADD CONSTRAINT "pages_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_pages_v_rels" ADD CONSTRAINT "_pages_v_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE cascade ON UPDATE no action;
  CREATE INDEX "pages_rels_categories_id_idx" ON "pages_rels" USING btree ("categories_id","locale");
  CREATE INDEX "_pages_v_rels_categories_id_idx" ON "_pages_v_rels" USING btree ("categories_id","locale");`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "archiveBlock_block_header_links" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "archiveBlock_block_header_links_locales" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "archiveBlock" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "archiveBlock_locales" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_archiveBlock_v_block_header_links" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_archiveBlock_v_block_header_links_locales" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_archiveBlock_v" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_archiveBlock_v_locales" DISABLE ROW LEVEL SECURITY;
  DROP TABLE "archiveBlock_block_header_links" CASCADE;
  DROP TABLE "archiveBlock_block_header_links_locales" CASCADE;
  DROP TABLE "archiveBlock" CASCADE;
  DROP TABLE "archiveBlock_locales" CASCADE;
  DROP TABLE "_archiveBlock_v_block_header_links" CASCADE;
  DROP TABLE "_archiveBlock_v_block_header_links_locales" CASCADE;
  DROP TABLE "_archiveBlock_v" CASCADE;
  DROP TABLE "_archiveBlock_v_locales" CASCADE;
  ALTER TABLE "pages_rels" DROP CONSTRAINT "pages_rels_categories_fk";
  
  ALTER TABLE "_pages_v_rels" DROP CONSTRAINT "_pages_v_rels_categories_fk";
  
  DROP INDEX "pages_rels_categories_id_idx";
  DROP INDEX "_pages_v_rels_categories_id_idx";
  ALTER TABLE "pages_rels" DROP COLUMN "categories_id";
  ALTER TABLE "_pages_v_rels" DROP COLUMN "categories_id";
  DROP TYPE "public"."enum_archiveBlock_block_header_type";
  DROP TYPE "public"."enum_archiveBlock_block_header_badge_type";
  DROP TYPE "public"."enum_archiveBlock_populate_by";
  DROP TYPE "public"."enum_archiveBlock_relation_to";
  DROP TYPE "public"."enum__archiveBlock_v_block_header_type";
  DROP TYPE "public"."enum__archiveBlock_v_block_header_badge_type";
  DROP TYPE "public"."enum__archiveBlock_v_populate_by";
  DROP TYPE "public"."enum__archiveBlock_v_relation_to";`)
}
