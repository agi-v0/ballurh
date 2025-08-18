import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "blogBlock" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "blogBlock_locales" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_blogBlock_v" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "_blogBlock_v_locales" DISABLE ROW LEVEL SECURITY;
  DROP TABLE "blogBlock" CASCADE;
  DROP TABLE "blogBlock_locales" CASCADE;
  DROP TABLE "_blogBlock_v" CASCADE;
  DROP TABLE "_blogBlock_v_locales" CASCADE;
  ALTER TABLE "archiveBlock" DROP CONSTRAINT "archiveBlock_parent_id_fk";
  
  ALTER TABLE "customHtmlBlock" DROP CONSTRAINT "customHtmlBlock_parent_id_fk";
  
  ALTER TABLE "formBlock" DROP CONSTRAINT "formBlock_parent_id_fk";
  
  ALTER TABLE "pages_rels" DROP CONSTRAINT "pages_rels_categories_fk";
  
  ALTER TABLE "_archiveBlock_v" DROP CONSTRAINT "_archiveBlock_v_parent_id_fk";
  
  ALTER TABLE "_customHtmlBlock_v" DROP CONSTRAINT "_customHtmlBlock_v_parent_id_fk";
  
  ALTER TABLE "_formBlock_v" DROP CONSTRAINT "_formBlock_v_parent_id_fk";
  
  ALTER TABLE "_pages_v_rels" DROP CONSTRAINT "_pages_v_rels_categories_fk";
  
  ALTER TABLE "metricsBlock" ALTER COLUMN "type" SET DATA TYPE text;
  ALTER TABLE "metricsBlock" ALTER COLUMN "type" SET DEFAULT '01'::text;
  DROP TYPE "public"."enum_metricsBlock_type";
  CREATE TYPE "public"."enum_metricsBlock_type" AS ENUM('01', '02');
  ALTER TABLE "metricsBlock" ALTER COLUMN "type" SET DEFAULT '01'::"public"."enum_metricsBlock_type";
  ALTER TABLE "metricsBlock" ALTER COLUMN "type" SET DATA TYPE "public"."enum_metricsBlock_type" USING "type"::"public"."enum_metricsBlock_type";
  ALTER TABLE "_metricsBlock_v" ALTER COLUMN "type" SET DATA TYPE text;
  ALTER TABLE "_metricsBlock_v" ALTER COLUMN "type" SET DEFAULT '01'::text;
  DROP TYPE "public"."enum__metricsBlock_v_type";
  CREATE TYPE "public"."enum__metricsBlock_v_type" AS ENUM('01', '02');
  ALTER TABLE "_metricsBlock_v" ALTER COLUMN "type" SET DEFAULT '01'::"public"."enum__metricsBlock_v_type";
  ALTER TABLE "_metricsBlock_v" ALTER COLUMN "type" SET DATA TYPE "public"."enum__metricsBlock_v_type" USING "type"::"public"."enum__metricsBlock_v_type";
  DROP INDEX "pages_rels_categories_id_idx";
  DROP INDEX "_pages_v_rels_categories_id_idx";
  ALTER TABLE "archiveBlock" ADD CONSTRAINT "archiveBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."customers"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "customHtmlBlock" ADD CONSTRAINT "customHtmlBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."customers"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "formBlock" ADD CONSTRAINT "formBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."customers"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_archiveBlock_v" ADD CONSTRAINT "_archiveBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_customers_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_customHtmlBlock_v" ADD CONSTRAINT "_customHtmlBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_customers_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_formBlock_v" ADD CONSTRAINT "_formBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_customers_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "pages_rels" DROP COLUMN "categories_id";
  ALTER TABLE "_pages_v_rels" DROP COLUMN "categories_id";
  DROP TYPE "public"."enum_blogBlock_type";
  DROP TYPE "public"."enum__blogBlock_v_type";`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   CREATE TYPE "public"."enum_blogBlock_type" AS ENUM('featuredPost', '2-columns');
  CREATE TYPE "public"."enum__blogBlock_v_type" AS ENUM('featuredPost', '2-columns');
  ALTER TYPE "public"."enum_metricsBlock_type" ADD VALUE '03';
  ALTER TYPE "public"."enum__metricsBlock_v_type" ADD VALUE '03';
  CREATE TABLE "blogBlock" (
  	"_order" integer NOT NULL,
  	"_parent_id" uuid NOT NULL,
  	"_path" text NOT NULL,
  	"id" varchar PRIMARY KEY NOT NULL,
  	"type" "enum_blogBlock_type" DEFAULT 'featuredPost',
  	"featured_post_id" uuid,
  	"block_name" varchar
  );
  
  CREATE TABLE "blogBlock_locales" (
  	"recent_posts_list_title" varchar,
  	"recent_posts_list_description" varchar,
  	"editors_picks_list_title" varchar,
  	"editors_picks_list_description" varchar,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" varchar NOT NULL
  );
  
  CREATE TABLE "_blogBlock_v" (
  	"_order" integer NOT NULL,
  	"_parent_id" uuid NOT NULL,
  	"_path" text NOT NULL,
  	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
  	"type" "enum__blogBlock_v_type" DEFAULT 'featuredPost',
  	"featured_post_id" uuid,
  	"_uuid" varchar,
  	"block_name" varchar
  );
  
  CREATE TABLE "_blogBlock_v_locales" (
  	"recent_posts_list_title" varchar,
  	"recent_posts_list_description" varchar,
  	"editors_picks_list_title" varchar,
  	"editors_picks_list_description" varchar,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" uuid NOT NULL
  );
  
  ALTER TABLE "archiveBlock" DROP CONSTRAINT "archiveBlock_parent_id_fk";
  
  ALTER TABLE "customHtmlBlock" DROP CONSTRAINT "customHtmlBlock_parent_id_fk";
  
  ALTER TABLE "formBlock" DROP CONSTRAINT "formBlock_parent_id_fk";
  
  ALTER TABLE "_archiveBlock_v" DROP CONSTRAINT "_archiveBlock_v_parent_id_fk";
  
  ALTER TABLE "_customHtmlBlock_v" DROP CONSTRAINT "_customHtmlBlock_v_parent_id_fk";
  
  ALTER TABLE "_formBlock_v" DROP CONSTRAINT "_formBlock_v_parent_id_fk";
  
  ALTER TABLE "pages_rels" ADD COLUMN "categories_id" uuid;
  ALTER TABLE "_pages_v_rels" ADD COLUMN "categories_id" uuid;
  ALTER TABLE "blogBlock" ADD CONSTRAINT "blogBlock_featured_post_id_blog_posts_id_fk" FOREIGN KEY ("featured_post_id") REFERENCES "public"."blog_posts"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "blogBlock" ADD CONSTRAINT "blogBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "blogBlock_locales" ADD CONSTRAINT "blogBlock_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."blogBlock"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_blogBlock_v" ADD CONSTRAINT "_blogBlock_v_featured_post_id_blog_posts_id_fk" FOREIGN KEY ("featured_post_id") REFERENCES "public"."blog_posts"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "_blogBlock_v" ADD CONSTRAINT "_blogBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_blogBlock_v_locales" ADD CONSTRAINT "_blogBlock_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_blogBlock_v"("id") ON DELETE cascade ON UPDATE no action;
  CREATE INDEX "blogBlock_order_idx" ON "blogBlock" USING btree ("_order");
  CREATE INDEX "blogBlock_parent_id_idx" ON "blogBlock" USING btree ("_parent_id");
  CREATE INDEX "blogBlock_path_idx" ON "blogBlock" USING btree ("_path");
  CREATE INDEX "blogBlock_featured_post_idx" ON "blogBlock" USING btree ("featured_post_id");
  CREATE UNIQUE INDEX "blogBlock_locales_locale_parent_id_unique" ON "blogBlock_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX "_blogBlock_v_order_idx" ON "_blogBlock_v" USING btree ("_order");
  CREATE INDEX "_blogBlock_v_parent_id_idx" ON "_blogBlock_v" USING btree ("_parent_id");
  CREATE INDEX "_blogBlock_v_path_idx" ON "_blogBlock_v" USING btree ("_path");
  CREATE INDEX "_blogBlock_v_featured_post_idx" ON "_blogBlock_v" USING btree ("featured_post_id");
  CREATE UNIQUE INDEX "_blogBlock_v_locales_locale_parent_id_unique" ON "_blogBlock_v_locales" USING btree ("_locale","_parent_id");
  ALTER TABLE "pages_rels" ADD CONSTRAINT "pages_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_pages_v_rels" ADD CONSTRAINT "_pages_v_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "archiveBlock" ADD CONSTRAINT "archiveBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "customHtmlBlock" ADD CONSTRAINT "customHtmlBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "formBlock" ADD CONSTRAINT "formBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_archiveBlock_v" ADD CONSTRAINT "_archiveBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_customHtmlBlock_v" ADD CONSTRAINT "_customHtmlBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_formBlock_v" ADD CONSTRAINT "_formBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE cascade ON UPDATE no action;
  CREATE INDEX "pages_rels_categories_id_idx" ON "pages_rels" USING btree ("categories_id","locale");
  CREATE INDEX "_pages_v_rels_categories_id_idx" ON "_pages_v_rels" USING btree ("categories_id","locale");`)
}
