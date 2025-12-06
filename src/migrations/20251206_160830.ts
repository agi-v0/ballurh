import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   CREATE TABLE "payload_kv" (
  	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
  	"key" varchar NOT NULL,
  	"data" jsonb NOT NULL
  );
  
  ALTER TABLE "payload_locked_documents_rels" DROP CONSTRAINT "payload_locked_documents_rels_payload_jobs_fk";
  
  ALTER TABLE "header_tabs_nav_items_featured_link_links_locales" DROP CONSTRAINT "header_tabs_nav_items_featured_link_links_locales_parent_id_fk";
  
  DROP INDEX "archiveBlock_block_header_links_locales_locale_parent_id_unique";
  DROP INDEX "featuresBlock_block_header_links_locales_locale_parent_id_unique";
  DROP INDEX "galleryBlock_block_header_links_locales_locale_parent_id_unique";
  DROP INDEX "galleryBlock_interactive_gallery_locales_locale_parent_id_unique";
  DROP INDEX "logosBlock_block_header_links_locales_locale_parent_id_unique";
  DROP INDEX "metricsBlock_block_header_links_locales_locale_parent_id_unique";
  DROP INDEX "richTextBlock_block_header_links_locales_locale_parent_id_unique";
  DROP INDEX "testimonialsBlock_block_header_links_locales_locale_parent_id_unique";
  DROP INDEX "_pages_v_version_hero_list_items_locales_locale_parent_id_unique";
  DROP INDEX "_archiveBlock_v_block_header_links_locales_locale_parent_id_unique";
  DROP INDEX "_faqBlock_v_block_header_links_locales_locale_parent_id_unique";
  DROP INDEX "_featuresBlock_v_block_header_links_locales_locale_parent_id_unique";
  DROP INDEX "_galleryBlock_v_block_header_links_locales_locale_parent_id_unique";
  DROP INDEX "_galleryBlock_v_interactive_gallery_locales_locale_parent_id_unique";
  DROP INDEX "_logosBlock_v_block_header_links_locales_locale_parent_id_unique";
  DROP INDEX "_metricsBlock_v_block_header_links_locales_locale_parent_id_unique";
  DROP INDEX "_richTextBlock_v_block_header_links_locales_locale_parent_id_unique";
  DROP INDEX "_teamBlock_v_block_header_links_locales_locale_parent_id_unique";
  DROP INDEX "_testimonialsBlock_v_block_header_links_locales_locale_parent_id_unique";
  DROP INDEX "_customers_v_version_testimonial_stats_locales_locale_parent_id_unique";
  DROP INDEX "payload_locked_documents_rels_payload_jobs_id_idx";
  DROP INDEX "header_tabs_description_links_locales_locale_parent_id_unique";
  DROP INDEX "header_tabs_nav_items_featured_link_links_locales_locale_parent_id_unique";
  DROP INDEX "header_tabs_nav_items_list_links_links_locales_locale_parent_id_unique";
  CREATE UNIQUE INDEX "payload_kv_key_idx" ON "payload_kv" USING btree ("key");
  ALTER TABLE "header_tabs_nav_items_featured_link_links_locales" ADD CONSTRAINT "header_tabs_nav_items_featured_link_links_locales_parent__fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."header_tabs_nav_items_featured_link_links"("id") ON DELETE cascade ON UPDATE no action;
  CREATE UNIQUE INDEX "archiveBlock_block_header_links_locales_locale_parent_id_uni" ON "archiveBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "featuresBlock_block_header_links_locales_locale_parent_id_un" ON "featuresBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "galleryBlock_block_header_links_locales_locale_parent_id_uni" ON "galleryBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "galleryBlock_interactive_gallery_locales_locale_parent_id_un" ON "galleryBlock_interactive_gallery_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "logosBlock_block_header_links_locales_locale_parent_id_uniqu" ON "logosBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "metricsBlock_block_header_links_locales_locale_parent_id_uni" ON "metricsBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "richTextBlock_block_header_links_locales_locale_parent_id_un" ON "richTextBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "testimonialsBlock_block_header_links_locales_locale_parent_i" ON "testimonialsBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_pages_v_version_hero_list_items_locales_locale_parent_id_un" ON "_pages_v_version_hero_list_items_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_archiveBlock_v_block_header_links_locales_locale_parent_id_" ON "_archiveBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_faqBlock_v_block_header_links_locales_locale_parent_id_uniq" ON "_faqBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_featuresBlock_v_block_header_links_locales_locale_parent_id" ON "_featuresBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_galleryBlock_v_block_header_links_locales_locale_parent_id_" ON "_galleryBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_galleryBlock_v_interactive_gallery_locales_locale_parent_id" ON "_galleryBlock_v_interactive_gallery_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_logosBlock_v_block_header_links_locales_locale_parent_id_un" ON "_logosBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_metricsBlock_v_block_header_links_locales_locale_parent_id_" ON "_metricsBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_richTextBlock_v_block_header_links_locales_locale_parent_id" ON "_richTextBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_teamBlock_v_block_header_links_locales_locale_parent_id_uni" ON "_teamBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_testimonialsBlock_v_block_header_links_locales_locale_paren" ON "_testimonialsBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_customers_v_version_testimonial_stats_locales_locale_parent" ON "_customers_v_version_testimonial_stats_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "header_tabs_description_links_locales_locale_parent_id_uniqu" ON "header_tabs_description_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "header_tabs_nav_items_featured_link_links_locales_locale_par" ON "header_tabs_nav_items_featured_link_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "header_tabs_nav_items_list_links_links_locales_locale_parent" ON "header_tabs_nav_items_list_links_links_locales" USING btree ("_locale","_parent_id");
  ALTER TABLE "payload_locked_documents_rels" DROP COLUMN "payload_jobs_id";`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "payload_kv" DISABLE ROW LEVEL SECURITY;
  DROP TABLE "payload_kv" CASCADE;
  ALTER TABLE "header_tabs_nav_items_featured_link_links_locales" DROP CONSTRAINT "header_tabs_nav_items_featured_link_links_locales_parent__fk";
  
  DROP INDEX "archiveBlock_block_header_links_locales_locale_parent_id_uni";
  DROP INDEX "featuresBlock_block_header_links_locales_locale_parent_id_un";
  DROP INDEX "galleryBlock_block_header_links_locales_locale_parent_id_uni";
  DROP INDEX "galleryBlock_interactive_gallery_locales_locale_parent_id_un";
  DROP INDEX "logosBlock_block_header_links_locales_locale_parent_id_uniqu";
  DROP INDEX "metricsBlock_block_header_links_locales_locale_parent_id_uni";
  DROP INDEX "richTextBlock_block_header_links_locales_locale_parent_id_un";
  DROP INDEX "testimonialsBlock_block_header_links_locales_locale_parent_i";
  DROP INDEX "_pages_v_version_hero_list_items_locales_locale_parent_id_un";
  DROP INDEX "_archiveBlock_v_block_header_links_locales_locale_parent_id_";
  DROP INDEX "_faqBlock_v_block_header_links_locales_locale_parent_id_uniq";
  DROP INDEX "_featuresBlock_v_block_header_links_locales_locale_parent_id";
  DROP INDEX "_galleryBlock_v_block_header_links_locales_locale_parent_id_";
  DROP INDEX "_galleryBlock_v_interactive_gallery_locales_locale_parent_id";
  DROP INDEX "_logosBlock_v_block_header_links_locales_locale_parent_id_un";
  DROP INDEX "_metricsBlock_v_block_header_links_locales_locale_parent_id_";
  DROP INDEX "_richTextBlock_v_block_header_links_locales_locale_parent_id";
  DROP INDEX "_teamBlock_v_block_header_links_locales_locale_parent_id_uni";
  DROP INDEX "_testimonialsBlock_v_block_header_links_locales_locale_paren";
  DROP INDEX "_customers_v_version_testimonial_stats_locales_locale_parent";
  DROP INDEX "header_tabs_description_links_locales_locale_parent_id_uniqu";
  DROP INDEX "header_tabs_nav_items_featured_link_links_locales_locale_par";
  DROP INDEX "header_tabs_nav_items_list_links_links_locales_locale_parent";
  ALTER TABLE "payload_locked_documents_rels" ADD COLUMN "payload_jobs_id" uuid;
  ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_payload_jobs_fk" FOREIGN KEY ("payload_jobs_id") REFERENCES "public"."payload_jobs"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "header_tabs_nav_items_featured_link_links_locales" ADD CONSTRAINT "header_tabs_nav_items_featured_link_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."header_tabs_nav_items_featured_link_links"("id") ON DELETE cascade ON UPDATE no action;
  CREATE UNIQUE INDEX "archiveBlock_block_header_links_locales_locale_parent_id_unique" ON "archiveBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "featuresBlock_block_header_links_locales_locale_parent_id_unique" ON "featuresBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "galleryBlock_block_header_links_locales_locale_parent_id_unique" ON "galleryBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "galleryBlock_interactive_gallery_locales_locale_parent_id_unique" ON "galleryBlock_interactive_gallery_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "logosBlock_block_header_links_locales_locale_parent_id_unique" ON "logosBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "metricsBlock_block_header_links_locales_locale_parent_id_unique" ON "metricsBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "richTextBlock_block_header_links_locales_locale_parent_id_unique" ON "richTextBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "testimonialsBlock_block_header_links_locales_locale_parent_id_unique" ON "testimonialsBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_pages_v_version_hero_list_items_locales_locale_parent_id_unique" ON "_pages_v_version_hero_list_items_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_archiveBlock_v_block_header_links_locales_locale_parent_id_unique" ON "_archiveBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_faqBlock_v_block_header_links_locales_locale_parent_id_unique" ON "_faqBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_featuresBlock_v_block_header_links_locales_locale_parent_id_unique" ON "_featuresBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_galleryBlock_v_block_header_links_locales_locale_parent_id_unique" ON "_galleryBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_galleryBlock_v_interactive_gallery_locales_locale_parent_id_unique" ON "_galleryBlock_v_interactive_gallery_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_logosBlock_v_block_header_links_locales_locale_parent_id_unique" ON "_logosBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_metricsBlock_v_block_header_links_locales_locale_parent_id_unique" ON "_metricsBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_richTextBlock_v_block_header_links_locales_locale_parent_id_unique" ON "_richTextBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_teamBlock_v_block_header_links_locales_locale_parent_id_unique" ON "_teamBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_testimonialsBlock_v_block_header_links_locales_locale_parent_id_unique" ON "_testimonialsBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "_customers_v_version_testimonial_stats_locales_locale_parent_id_unique" ON "_customers_v_version_testimonial_stats_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX "payload_locked_documents_rels_payload_jobs_id_idx" ON "payload_locked_documents_rels" USING btree ("payload_jobs_id");
  CREATE UNIQUE INDEX "header_tabs_description_links_locales_locale_parent_id_unique" ON "header_tabs_description_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "header_tabs_nav_items_featured_link_links_locales_locale_parent_id_unique" ON "header_tabs_nav_items_featured_link_links_locales" USING btree ("_locale","_parent_id");
  CREATE UNIQUE INDEX "header_tabs_nav_items_list_links_links_locales_locale_parent_id_unique" ON "header_tabs_nav_items_list_links_links_locales" USING btree ("_locale","_parent_id");`)
}
