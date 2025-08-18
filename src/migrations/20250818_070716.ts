import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   DROP INDEX "_pages_v_version_hero_media_desktop_version_hero_media_desktop_light_idx";
  DROP INDEX "_pages_v_version_hero_media_desktop_version_hero_media_desktop_dark_idx";
  DROP INDEX "_pages_v_version_hero_media_mobile_version_hero_media_mobile_light_idx";
  DROP INDEX "_pages_v_version_hero_media_mobile_version_hero_media_mobile_dark_idx";
  DROP INDEX "customers_testimonial_company_testimonial_company_company_logo_idx";
  DROP INDEX "customers_testimonial_author_info_testimonial_author_info_avatar_idx";
  DROP INDEX "_customers_v_version_testimonial_version_testimonial_featured_image_idx";
  DROP INDEX "_customers_v_version_testimonial_company_version_testimonial_company_company_logo_idx";
  DROP INDEX "_customers_v_version_testimonial_author_info_version_testimonial_author_info_avatar_idx";
  CREATE INDEX "_pages_v_version_hero_media_desktop_version_hero_media_d_idx" ON "_pages_v_locales" USING btree ("version_hero_media_desktop_light_id","_locale");
  CREATE INDEX "_pages_v_version_hero_media_desktop_version_hero_media_1_idx" ON "_pages_v_locales" USING btree ("version_hero_media_desktop_dark_id","_locale");
  CREATE INDEX "_pages_v_version_hero_media_mobile_version_hero_media_mo_idx" ON "_pages_v_locales" USING btree ("version_hero_media_mobile_light_id","_locale");
  CREATE INDEX "_pages_v_version_hero_media_mobile_version_hero_media__1_idx" ON "_pages_v_locales" USING btree ("version_hero_media_mobile_dark_id","_locale");
  CREATE INDEX "customers_testimonial_company_testimonial_company_compan_idx" ON "customers" USING btree ("testimonial_company_company_logo_id");
  CREATE INDEX "customers_testimonial_author_info_testimonial_author_inf_idx" ON "customers" USING btree ("testimonial_author_info_avatar_id");
  CREATE INDEX "_customers_v_version_testimonial_version_testimonial_fea_idx" ON "_customers_v" USING btree ("version_testimonial_featured_image_id");
  CREATE INDEX "_customers_v_version_testimonial_company_version_testimo_idx" ON "_customers_v" USING btree ("version_testimonial_company_company_logo_id");
  CREATE INDEX "_customers_v_version_testimonial_author_info_version_tes_idx" ON "_customers_v" USING btree ("version_testimonial_author_info_avatar_id");`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   DROP INDEX "_pages_v_version_hero_media_desktop_version_hero_media_d_idx";
  DROP INDEX "_pages_v_version_hero_media_desktop_version_hero_media_1_idx";
  DROP INDEX "_pages_v_version_hero_media_mobile_version_hero_media_mo_idx";
  DROP INDEX "_pages_v_version_hero_media_mobile_version_hero_media__1_idx";
  DROP INDEX "customers_testimonial_company_testimonial_company_compan_idx";
  DROP INDEX "customers_testimonial_author_info_testimonial_author_inf_idx";
  DROP INDEX "_customers_v_version_testimonial_version_testimonial_fea_idx";
  DROP INDEX "_customers_v_version_testimonial_company_version_testimo_idx";
  DROP INDEX "_customers_v_version_testimonial_author_info_version_tes_idx";
  CREATE INDEX "_pages_v_version_hero_media_desktop_version_hero_media_desktop_light_idx" ON "_pages_v_locales" USING btree ("version_hero_media_desktop_light_id","_locale");
  CREATE INDEX "_pages_v_version_hero_media_desktop_version_hero_media_desktop_dark_idx" ON "_pages_v_locales" USING btree ("version_hero_media_desktop_dark_id","_locale");
  CREATE INDEX "_pages_v_version_hero_media_mobile_version_hero_media_mobile_light_idx" ON "_pages_v_locales" USING btree ("version_hero_media_mobile_light_id","_locale");
  CREATE INDEX "_pages_v_version_hero_media_mobile_version_hero_media_mobile_dark_idx" ON "_pages_v_locales" USING btree ("version_hero_media_mobile_dark_id","_locale");
  CREATE INDEX "customers_testimonial_company_testimonial_company_company_logo_idx" ON "customers" USING btree ("testimonial_company_company_logo_id");
  CREATE INDEX "customers_testimonial_author_info_testimonial_author_info_avatar_idx" ON "customers" USING btree ("testimonial_author_info_avatar_id");
  CREATE INDEX "_customers_v_version_testimonial_version_testimonial_featured_image_idx" ON "_customers_v" USING btree ("version_testimonial_featured_image_id");
  CREATE INDEX "_customers_v_version_testimonial_company_version_testimonial_company_company_logo_idx" ON "_customers_v" USING btree ("version_testimonial_company_company_logo_id");
  CREATE INDEX "_customers_v_version_testimonial_author_info_version_testimonial_author_info_avatar_idx" ON "_customers_v" USING btree ("version_testimonial_author_info_avatar_id");`)
}
