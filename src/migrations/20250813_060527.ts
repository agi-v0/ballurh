import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "pages_locales" ADD COLUMN "disable_page" boolean DEFAULT false;
  ALTER TABLE "_pages_v_locales" ADD COLUMN "version_disable_page" boolean DEFAULT false;`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "pages_locales" DROP COLUMN "disable_page";
  ALTER TABLE "_pages_v_locales" DROP COLUMN "version_disable_page";`)
}
