import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   CREATE TYPE "public"."enum_news_status" AS ENUM('draft', 'published');
  CREATE TYPE "public"."enum__news_v_version_status" AS ENUM('draft', 'published');
  CREATE TYPE "public"."enum__news_v_published_locale" AS ENUM('en', 'ar');
  CREATE TABLE "news_populated_authors" (
  	"_order" integer NOT NULL,
  	"_parent_id" uuid NOT NULL,
  	"id" varchar PRIMARY KEY NOT NULL,
  	"name" varchar
  );
  
  CREATE TABLE "news" (
  	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
  	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
  	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
  	"_status" "enum_news_status" DEFAULT 'draft'
  );
  
  CREATE TABLE "news_locales" (
  	"title" varchar,
  	"hero_image_id" uuid,
  	"content" jsonb,
  	"meta_title" varchar,
  	"meta_image_id" uuid,
  	"meta_description" varchar,
  	"published_at" timestamp(3) with time zone,
  	"slug" varchar,
  	"slug_lock" boolean DEFAULT true,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" uuid NOT NULL
  );
  
  CREATE TABLE "news_rels" (
  	"id" serial PRIMARY KEY NOT NULL,
  	"order" integer,
  	"parent_id" uuid NOT NULL,
  	"path" varchar NOT NULL,
  	"locale" "_locales",
  	"news_id" uuid,
  	"categories_id" uuid,
  	"users_id" uuid
  );
  
  CREATE TABLE "_news_v_version_populated_authors" (
  	"_order" integer NOT NULL,
  	"_parent_id" uuid NOT NULL,
  	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
  	"_uuid" varchar,
  	"name" varchar
  );
  
  CREATE TABLE "_news_v" (
  	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
  	"parent_id" uuid,
  	"version_updated_at" timestamp(3) with time zone,
  	"version_created_at" timestamp(3) with time zone,
  	"version__status" "enum__news_v_version_status" DEFAULT 'draft',
  	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
  	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
  	"snapshot" boolean,
  	"published_locale" "enum__news_v_published_locale",
  	"latest" boolean
  );
  
  CREATE TABLE "_news_v_locales" (
  	"version_title" varchar,
  	"version_hero_image_id" uuid,
  	"version_content" jsonb,
  	"version_meta_title" varchar,
  	"version_meta_image_id" uuid,
  	"version_meta_description" varchar,
  	"version_published_at" timestamp(3) with time zone,
  	"version_slug" varchar,
  	"version_slug_lock" boolean DEFAULT true,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" uuid NOT NULL
  );
  
  CREATE TABLE "_news_v_rels" (
  	"id" serial PRIMARY KEY NOT NULL,
  	"order" integer,
  	"parent_id" uuid NOT NULL,
  	"path" varchar NOT NULL,
  	"locale" "_locales",
  	"news_id" uuid,
  	"categories_id" uuid,
  	"users_id" uuid
  );
  
  ALTER TABLE "archiveBlock_block_header_links" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "archiveBlock_block_header_links_locales" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "archiveBlock" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "archiveBlock_locales" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "customHtmlBlock_block_header_links" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "customHtmlBlock_block_header_links_locales" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "customHtmlBlock" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "customHtmlBlock_locales" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "formBlock" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_archiveBlock_v_block_header_links" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_archiveBlock_v_block_header_links_locales" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_archiveBlock_v" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_archiveBlock_v_locales" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_customHtmlBlock_v_block_header_links" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_customHtmlBlock_v_block_header_links_locales" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_customHtmlBlock_v" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_customHtmlBlock_v_locales" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_formBlock_v" DISABLE ROW LEVEL SECURITY;
  DROP TABLE "archiveBlock_block_header_links" CASCADE;
  DROP TABLE "archiveBlock_block_header_links_locales" CASCADE;
  DROP TABLE "archiveBlock" CASCADE;
  DROP TABLE "archiveBlock_locales" CASCADE;
  DROP TABLE "customHtmlBlock_block_header_links" CASCADE;
  DROP TABLE "customHtmlBlock_block_header_links_locales" CASCADE;
  DROP TABLE "customHtmlBlock" CASCADE;
  DROP TABLE "customHtmlBlock_locales" CASCADE;
  DROP TABLE "formBlock" CASCADE;
  DROP TABLE "_archiveBlock_v_block_header_links" CASCADE;
  DROP TABLE "_archiveBlock_v_block_header_links_locales" CASCADE;
  DROP TABLE "_archiveBlock_v" CASCADE;
  DROP TABLE "_archiveBlock_v_locales" CASCADE;
  DROP TABLE "_customHtmlBlock_v_block_header_links" CASCADE;
  DROP TABLE "_customHtmlBlock_v_block_header_links_locales" CASCADE;
  DROP TABLE "_customHtmlBlock_v" CASCADE;
  DROP TABLE "_customHtmlBlock_v_locales" CASCADE;
  DROP TABLE "_formBlock_v" CASCADE;
  ALTER TABLE "payload_locked_documents_rels" ADD COLUMN "news_id" uuid;
  ALTER TABLE "news_populated_authors" ADD CONSTRAINT "news_populated_authors_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."news"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "news_locales" ADD CONSTRAINT "news_locales_hero_image_id_media_id_fk" FOREIGN KEY ("hero_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "news_locales" ADD CONSTRAINT "news_locales_meta_image_id_media_id_fk" FOREIGN KEY ("meta_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "news_locales" ADD CONSTRAINT "news_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."news"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "news_rels" ADD CONSTRAINT "news_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."news"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "news_rels" ADD CONSTRAINT "news_rels_news_fk" FOREIGN KEY ("news_id") REFERENCES "public"."news"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "news_rels" ADD CONSTRAINT "news_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "news_rels" ADD CONSTRAINT "news_rels_users_fk" FOREIGN KEY ("users_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_news_v_version_populated_authors" ADD CONSTRAINT "_news_v_version_populated_authors_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_news_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_news_v" ADD CONSTRAINT "_news_v_parent_id_news_id_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."news"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "_news_v_locales" ADD CONSTRAINT "_news_v_locales_version_hero_image_id_media_id_fk" FOREIGN KEY ("version_hero_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "_news_v_locales" ADD CONSTRAINT "_news_v_locales_version_meta_image_id_media_id_fk" FOREIGN KEY ("version_meta_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "_news_v_locales" ADD CONSTRAINT "_news_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_news_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_news_v_rels" ADD CONSTRAINT "_news_v_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."_news_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_news_v_rels" ADD CONSTRAINT "_news_v_rels_news_fk" FOREIGN KEY ("news_id") REFERENCES "public"."news"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_news_v_rels" ADD CONSTRAINT "_news_v_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_news_v_rels" ADD CONSTRAINT "_news_v_rels_users_fk" FOREIGN KEY ("users_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;
  CREATE INDEX "news_populated_authors_order_idx" ON "news_populated_authors" USING btree ("_order");
  CREATE INDEX "news_populated_authors_parent_id_idx" ON "news_populated_authors" USING btree ("_parent_id");
  CREATE INDEX "news_updated_at_idx" ON "news" USING btree ("updated_at");
  CREATE INDEX "news_created_at_idx" ON "news" USING btree ("created_at");
  CREATE INDEX "news__status_idx" ON "news" USING btree ("_status");
  CREATE INDEX "news_hero_image_idx" ON "news_locales" USING btree ("hero_image_id","_locale");
  CREATE INDEX "news_meta_meta_image_idx" ON "news_locales" USING btree ("meta_image_id");
  CREATE INDEX "news_slug_idx" ON "news_locales" USING btree ("slug","_locale");
  CREATE UNIQUE INDEX "news_locales_locale_parent_id_unique" ON "news_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX "news_rels_order_idx" ON "news_rels" USING btree ("order");
  CREATE INDEX "news_rels_parent_idx" ON "news_rels" USING btree ("parent_id");
  CREATE INDEX "news_rels_path_idx" ON "news_rels" USING btree ("path");
  CREATE INDEX "news_rels_locale_idx" ON "news_rels" USING btree ("locale");
  CREATE INDEX "news_rels_news_id_idx" ON "news_rels" USING btree ("news_id","locale");
  CREATE INDEX "news_rels_categories_id_idx" ON "news_rels" USING btree ("categories_id","locale");
  CREATE INDEX "news_rels_users_id_idx" ON "news_rels" USING btree ("users_id","locale");
  CREATE INDEX "_news_v_version_populated_authors_order_idx" ON "_news_v_version_populated_authors" USING btree ("_order");
  CREATE INDEX "_news_v_version_populated_authors_parent_id_idx" ON "_news_v_version_populated_authors" USING btree ("_parent_id");
  CREATE INDEX "_news_v_parent_idx" ON "_news_v" USING btree ("parent_id");
  CREATE INDEX "_news_v_version_version_updated_at_idx" ON "_news_v" USING btree ("version_updated_at");
  CREATE INDEX "_news_v_version_version_created_at_idx" ON "_news_v" USING btree ("version_created_at");
  CREATE INDEX "_news_v_version_version__status_idx" ON "_news_v" USING btree ("version__status");
  CREATE INDEX "_news_v_created_at_idx" ON "_news_v" USING btree ("created_at");
  CREATE INDEX "_news_v_updated_at_idx" ON "_news_v" USING btree ("updated_at");
  CREATE INDEX "_news_v_snapshot_idx" ON "_news_v" USING btree ("snapshot");
  CREATE INDEX "_news_v_published_locale_idx" ON "_news_v" USING btree ("published_locale");
  CREATE INDEX "_news_v_latest_idx" ON "_news_v" USING btree ("latest");
  CREATE INDEX "_news_v_version_version_hero_image_idx" ON "_news_v_locales" USING btree ("version_hero_image_id","_locale");
  CREATE INDEX "_news_v_version_meta_version_meta_image_idx" ON "_news_v_locales" USING btree ("version_meta_image_id");
  CREATE INDEX "_news_v_version_version_slug_idx" ON "_news_v_locales" USING btree ("version_slug","_locale");
  CREATE UNIQUE INDEX "_news_v_locales_locale_parent_id_unique" ON "_news_v_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX "_news_v_rels_order_idx" ON "_news_v_rels" USING btree ("order");
  CREATE INDEX "_news_v_rels_parent_idx" ON "_news_v_rels" USING btree ("parent_id");
  CREATE INDEX "_news_v_rels_path_idx" ON "_news_v_rels" USING btree ("path");
  CREATE INDEX "_news_v_rels_locale_idx" ON "_news_v_rels" USING btree ("locale");
  CREATE INDEX "_news_v_rels_news_id_idx" ON "_news_v_rels" USING btree ("news_id","locale");
  CREATE INDEX "_news_v_rels_categories_id_idx" ON "_news_v_rels" USING btree ("categories_id","locale");
  CREATE INDEX "_news_v_rels_users_id_idx" ON "_news_v_rels" USING btree ("users_id","locale");
  ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_news_fk" FOREIGN KEY ("news_id") REFERENCES "public"."news"("id") ON DELETE cascade ON UPDATE no action;
  CREATE INDEX "payload_locked_documents_rels_news_id_idx" ON "payload_locked_documents_rels" USING btree ("news_id");
  DROP TYPE "public"."enum_archiveBlock_block_header_type";
  DROP TYPE "public"."enum_archiveBlock_block_header_badge_type";
  DROP TYPE "public"."enum_archiveBlock_populate_by";
  DROP TYPE "public"."enum_archiveBlock_relation_to";
  DROP TYPE "public"."enum_customHtmlBlock_block_header_type";
  DROP TYPE "public"."enum_customHtmlBlock_block_header_badge_type";
  DROP TYPE "public"."enum__archiveBlock_v_block_header_type";
  DROP TYPE "public"."enum__archiveBlock_v_block_header_badge_type";
  DROP TYPE "public"."enum__archiveBlock_v_populate_by";
  DROP TYPE "public"."enum__archiveBlock_v_relation_to";
  DROP TYPE "public"."enum__customHtmlBlock_v_block_header_type";
  DROP TYPE "public"."enum__customHtmlBlock_v_block_header_badge_type";`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   CREATE TYPE "public"."enum_archiveBlock_block_header_type" AS ENUM('center', 'split', 'start');
  CREATE TYPE "public"."enum_archiveBlock_block_header_badge_type" AS ENUM('label', 'reference');
  CREATE TYPE "public"."enum_archiveBlock_populate_by" AS ENUM('collection', 'selection');
  CREATE TYPE "public"."enum_archiveBlock_relation_to" AS ENUM('blog-posts');
  CREATE TYPE "public"."enum_customHtmlBlock_block_header_type" AS ENUM('center', 'split', 'start');
  CREATE TYPE "public"."enum_customHtmlBlock_block_header_badge_type" AS ENUM('label', 'reference');
  CREATE TYPE "public"."enum__archiveBlock_v_block_header_type" AS ENUM('center', 'split', 'start');
  CREATE TYPE "public"."enum__archiveBlock_v_block_header_badge_type" AS ENUM('label', 'reference');
  CREATE TYPE "public"."enum__archiveBlock_v_populate_by" AS ENUM('collection', 'selection');
  CREATE TYPE "public"."enum__archiveBlock_v_relation_to" AS ENUM('blog-posts');
  CREATE TYPE "public"."enum__customHtmlBlock_v_block_header_type" AS ENUM('center', 'split', 'start');
  CREATE TYPE "public"."enum__customHtmlBlock_v_block_header_badge_type" AS ENUM('label', 'reference');
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
  	"relation_to" "enum_archiveBlock_relation_to" DEFAULT 'blog-posts',
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
  
  CREATE TABLE "customHtmlBlock_block_header_links" (
  	"_order" integer NOT NULL,
  	"_parent_id" varchar NOT NULL,
  	"id" varchar PRIMARY KEY NOT NULL,
  	"link_type" "link_type" DEFAULT 'reference',
  	"link_new_tab" boolean,
  	"link_url" varchar,
  	"link_color" "link_color" DEFAULT 'neutral',
  	"link_variant" "link_variant" DEFAULT 'primary'
  );
  
  CREATE TABLE "customHtmlBlock_block_header_links_locales" (
  	"link_label" varchar,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" varchar NOT NULL
  );
  
  CREATE TABLE "customHtmlBlock" (
  	"_order" integer NOT NULL,
  	"_parent_id" uuid NOT NULL,
  	"_path" text NOT NULL,
  	"id" varchar PRIMARY KEY NOT NULL,
  	"block_header_type" "enum_customHtmlBlock_block_header_type" DEFAULT 'center',
  	"block_header_badge_type" "enum_customHtmlBlock_block_header_badge_type",
  	"block_header_badge_color" "badge_color" DEFAULT 'blue',
  	"block_header_badge_icon" varchar,
  	"block_header_badge_icon_position" "badge_icon_position" DEFAULT 'flex-row',
  	"html_content" varchar,
  	"block_name" varchar
  );
  
  CREATE TABLE "customHtmlBlock_locales" (
  	"block_header_badge_label" varchar,
  	"block_header_header_text" jsonb,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" varchar NOT NULL
  );
  
  CREATE TABLE "formBlock" (
  	"_order" integer NOT NULL,
  	"_parent_id" uuid NOT NULL,
  	"_path" text NOT NULL,
  	"id" varchar PRIMARY KEY NOT NULL,
  	"form_id" uuid,
  	"enable_intro" boolean,
  	"intro_content" jsonb,
  	"block_name" varchar
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
  	"relation_to" "enum__archiveBlock_v_relation_to" DEFAULT 'blog-posts',
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
  
  CREATE TABLE "_customHtmlBlock_v_block_header_links" (
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
  
  CREATE TABLE "_customHtmlBlock_v_block_header_links_locales" (
  	"link_label" varchar,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" uuid NOT NULL
  );
  
  CREATE TABLE "_customHtmlBlock_v" (
  	"_order" integer NOT NULL,
  	"_parent_id" uuid NOT NULL,
  	"_path" text NOT NULL,
  	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
  	"block_header_type" "enum__customHtmlBlock_v_block_header_type" DEFAULT 'center',
  	"block_header_badge_type" "enum__customHtmlBlock_v_block_header_badge_type",
  	"block_header_badge_color" "badge_color" DEFAULT 'blue',
  	"block_header_badge_icon" varchar,
  	"block_header_badge_icon_position" "badge_icon_position" DEFAULT 'flex-row',
  	"html_content" varchar,
  	"_uuid" varchar,
  	"block_name" varchar
  );
  
  CREATE TABLE "_customHtmlBlock_v_locales" (
  	"block_header_badge_label" varchar,
  	"block_header_header_text" jsonb,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" uuid NOT NULL
  );
  
  CREATE TABLE "_formBlock_v" (
  	"_order" integer NOT NULL,
  	"_parent_id" uuid NOT NULL,
  	"_path" text NOT NULL,
  	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
  	"form_id" uuid,
  	"enable_intro" boolean,
  	"intro_content" jsonb,
  	"_uuid" varchar,
  	"block_name" varchar
  );
  
  ALTER TABLE "news_populated_authors" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "news" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "news_locales" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "news_rels" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_news_v_version_populated_authors" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_news_v" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_news_v_locales" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_news_v_rels" DISABLE ROW LEVEL SECURITY;
  DROP TABLE "news_populated_authors" CASCADE;
  DROP TABLE "news" CASCADE;
  DROP TABLE "news_locales" CASCADE;
  DROP TABLE "news_rels" CASCADE;
  DROP TABLE "_news_v_version_populated_authors" CASCADE;
  DROP TABLE "_news_v" CASCADE;
  DROP TABLE "_news_v_locales" CASCADE;
  DROP TABLE "_news_v_rels" CASCADE;
  ALTER TABLE "payload_locked_documents_rels" DROP CONSTRAINT "payload_locked_documents_rels_news_fk";
  
  DROP INDEX "payload_locked_documents_rels_news_id_idx";
  ALTER TABLE "archiveBlock_block_header_links" ADD CONSTRAINT "archiveBlock_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."archiveBlock"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "archiveBlock_block_header_links_locales" ADD CONSTRAINT "archiveBlock_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."archiveBlock_block_header_links"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "archiveBlock" ADD CONSTRAINT "archiveBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."customers"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "archiveBlock_locales" ADD CONSTRAINT "archiveBlock_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."archiveBlock"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "customHtmlBlock_block_header_links" ADD CONSTRAINT "customHtmlBlock_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."customHtmlBlock"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "customHtmlBlock_block_header_links_locales" ADD CONSTRAINT "customHtmlBlock_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."customHtmlBlock_block_header_links"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "customHtmlBlock" ADD CONSTRAINT "customHtmlBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."customers"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "customHtmlBlock_locales" ADD CONSTRAINT "customHtmlBlock_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."customHtmlBlock"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "formBlock" ADD CONSTRAINT "formBlock_form_id_forms_id_fk" FOREIGN KEY ("form_id") REFERENCES "public"."forms"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "formBlock" ADD CONSTRAINT "formBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."customers"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_archiveBlock_v_block_header_links" ADD CONSTRAINT "_archiveBlock_v_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_archiveBlock_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_archiveBlock_v_block_header_links_locales" ADD CONSTRAINT "_archiveBlock_v_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_archiveBlock_v_block_header_links"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_archiveBlock_v" ADD CONSTRAINT "_archiveBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_customers_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_archiveBlock_v_locales" ADD CONSTRAINT "_archiveBlock_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_archiveBlock_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_customHtmlBlock_v_block_header_links" ADD CONSTRAINT "_customHtmlBlock_v_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_customHtmlBlock_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_customHtmlBlock_v_block_header_links_locales" ADD CONSTRAINT "_customHtmlBlock_v_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_customHtmlBlock_v_block_header_links"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_customHtmlBlock_v" ADD CONSTRAINT "_customHtmlBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_customers_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_customHtmlBlock_v_locales" ADD CONSTRAINT "_customHtmlBlock_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_customHtmlBlock_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_formBlock_v" ADD CONSTRAINT "_formBlock_v_form_id_forms_id_fk" FOREIGN KEY ("form_id") REFERENCES "public"."forms"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "_formBlock_v" ADD CONSTRAINT "_formBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_customers_v"("id") ON DELETE cascade ON UPDATE no action;
  CREATE INDEX "archiveBlock_block_header_links_order_idx" ON "archiveBlock_block_header_links" USING btree ("_order");
  CREATE INDEX "archiveBlock_block_header_links_parent_id_idx" ON "archiveBlock_block_header_links" USING btree ("_parent_id");
  CREATE UNIQUE INDEX "archiveBlock_block_header_links_locales_locale_parent_id_unique" ON "archiveBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX "archiveBlock_order_idx" ON "archiveBlock" USING btree ("_order");
  CREATE INDEX "archiveBlock_parent_id_idx" ON "archiveBlock" USING btree ("_parent_id");
  CREATE INDEX "archiveBlock_path_idx" ON "archiveBlock" USING btree ("_path");
  CREATE UNIQUE INDEX "archiveBlock_locales_locale_parent_id_unique" ON "archiveBlock_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX "customHtmlBlock_block_header_links_order_idx" ON "customHtmlBlock_block_header_links" USING btree ("_order");
  CREATE INDEX "customHtmlBlock_block_header_links_parent_id_idx" ON "customHtmlBlock_block_header_links" USING btree ("_parent_id");
  CREATE UNIQUE INDEX "customHtmlBlock_block_header_links_locales_locale_parent_id_unique" ON "customHtmlBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX "customHtmlBlock_order_idx" ON "customHtmlBlock" USING btree ("_order");
  CREATE INDEX "customHtmlBlock_parent_id_idx" ON "customHtmlBlock" USING btree ("_parent_id");
  CREATE INDEX "customHtmlBlock_path_idx" ON "customHtmlBlock" USING btree ("_path");
  CREATE UNIQUE INDEX "customHtmlBlock_locales_locale_parent_id_unique" ON "customHtmlBlock_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX "formBlock_order_idx" ON "formBlock" USING btree ("_order");
  CREATE INDEX "formBlock_parent_id_idx" ON "formBlock" USING btree ("_parent_id");
  CREATE INDEX "formBlock_path_idx" ON "formBlock" USING btree ("_path");
  CREATE INDEX "formBlock_form_idx" ON "formBlock" USING btree ("form_id");
  CREATE INDEX "_archiveBlock_v_block_header_links_order_idx" ON "_archiveBlock_v_block_header_links" USING btree ("_order");
  CREATE INDEX "_archiveBlock_v_block_header_links_parent_id_idx" ON "_archiveBlock_v_block_header_links" USING btree ("_parent_id");
  CREATE UNIQUE INDEX "_archiveBlock_v_block_header_links_locales_locale_parent_id_unique" ON "_archiveBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX "_archiveBlock_v_order_idx" ON "_archiveBlock_v" USING btree ("_order");
  CREATE INDEX "_archiveBlock_v_parent_id_idx" ON "_archiveBlock_v" USING btree ("_parent_id");
  CREATE INDEX "_archiveBlock_v_path_idx" ON "_archiveBlock_v" USING btree ("_path");
  CREATE UNIQUE INDEX "_archiveBlock_v_locales_locale_parent_id_unique" ON "_archiveBlock_v_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX "_customHtmlBlock_v_block_header_links_order_idx" ON "_customHtmlBlock_v_block_header_links" USING btree ("_order");
  CREATE INDEX "_customHtmlBlock_v_block_header_links_parent_id_idx" ON "_customHtmlBlock_v_block_header_links" USING btree ("_parent_id");
  CREATE UNIQUE INDEX "_customHtmlBlock_v_block_header_links_locales_locale_parent_id_unique" ON "_customHtmlBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX "_customHtmlBlock_v_order_idx" ON "_customHtmlBlock_v" USING btree ("_order");
  CREATE INDEX "_customHtmlBlock_v_parent_id_idx" ON "_customHtmlBlock_v" USING btree ("_parent_id");
  CREATE INDEX "_customHtmlBlock_v_path_idx" ON "_customHtmlBlock_v" USING btree ("_path");
  CREATE UNIQUE INDEX "_customHtmlBlock_v_locales_locale_parent_id_unique" ON "_customHtmlBlock_v_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX "_formBlock_v_order_idx" ON "_formBlock_v" USING btree ("_order");
  CREATE INDEX "_formBlock_v_parent_id_idx" ON "_formBlock_v" USING btree ("_parent_id");
  CREATE INDEX "_formBlock_v_path_idx" ON "_formBlock_v" USING btree ("_path");
  CREATE INDEX "_formBlock_v_form_idx" ON "_formBlock_v" USING btree ("form_id");
  ALTER TABLE "payload_locked_documents_rels" DROP COLUMN "news_id";
  DROP TYPE "public"."enum_news_status";
  DROP TYPE "public"."enum__news_v_version_status";
  DROP TYPE "public"."enum__news_v_published_locale";`)
}
