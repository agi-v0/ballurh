import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "settings" RENAME COLUMN "announcement_bar_link_type" TO "announcement_link_type";
  ALTER TABLE "settings" RENAME COLUMN "announcement_bar_link_new_tab" TO "announcement_link_new_tab";
  ALTER TABLE "settings" RENAME COLUMN "announcement_bar_link_url" TO "announcement_link_url";
  ALTER TABLE "settings_locales" RENAME COLUMN "announcement_bar_text" TO "announcement_text";
  ALTER TABLE "settings_locales" RENAME COLUMN "announcement_bar_link_label" TO "announcement_link_label";
  ALTER TABLE "settings" ADD COLUMN "announcement_enable_announcement" boolean DEFAULT false;
  ALTER TABLE "settings_locales" ADD COLUMN "announcement_badge" varchar;`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "settings" RENAME COLUMN "announcement_link_type" TO "announcement_bar_link_type";
  ALTER TABLE "settings" RENAME COLUMN "announcement_link_new_tab" TO "announcement_bar_link_new_tab";
  ALTER TABLE "settings" RENAME COLUMN "announcement_link_url" TO "announcement_bar_link_url";
  ALTER TABLE "settings_locales" RENAME COLUMN "announcement_text" TO "announcement_bar_text";
  ALTER TABLE "settings_locales" RENAME COLUMN "announcement_link_label" TO "announcement_bar_link_label";
  ALTER TABLE "settings" DROP COLUMN "announcement_enable_announcement";
  ALTER TABLE "settings_locales" DROP COLUMN "announcement_badge";`)
}
