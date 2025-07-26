import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-vercel-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "pages_locales" ADD COLUMN "hero_media_mobile_light_id" uuid;
  ALTER TABLE "pages_locales" ADD COLUMN "hero_media_mobile_dark_id" uuid;
  ALTER TABLE "_pages_v_locales" ADD COLUMN "version_hero_media_mobile_light_id" uuid;
  ALTER TABLE "_pages_v_locales" ADD COLUMN "version_hero_media_mobile_dark_id" uuid;
  DO $$ BEGIN
   ALTER TABLE "pages_locales" ADD CONSTRAINT "pages_locales_hero_media_mobile_light_id_media_id_fk" FOREIGN KEY ("hero_media_mobile_light_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "pages_locales" ADD CONSTRAINT "pages_locales_hero_media_mobile_dark_id_media_id_fk" FOREIGN KEY ("hero_media_mobile_dark_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "_pages_v_locales" ADD CONSTRAINT "_pages_v_locales_version_hero_media_mobile_light_id_media_id_fk" FOREIGN KEY ("version_hero_media_mobile_light_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "_pages_v_locales" ADD CONSTRAINT "_pages_v_locales_version_hero_media_mobile_dark_id_media_id_fk" FOREIGN KEY ("version_hero_media_mobile_dark_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  CREATE INDEX IF NOT EXISTS "pages_hero_media_mobile_hero_media_mobile_light_idx" ON "pages_locales" USING btree ("hero_media_mobile_light_id","_locale");
  CREATE INDEX IF NOT EXISTS "pages_hero_media_mobile_hero_media_mobile_dark_idx" ON "pages_locales" USING btree ("hero_media_mobile_dark_id","_locale");
  CREATE INDEX IF NOT EXISTS "_pages_v_version_hero_media_mobile_version_hero_media_mobile_light_idx" ON "_pages_v_locales" USING btree ("version_hero_media_mobile_light_id","_locale");
  CREATE INDEX IF NOT EXISTS "_pages_v_version_hero_media_mobile_version_hero_media_mobile_dark_idx" ON "_pages_v_locales" USING btree ("version_hero_media_mobile_dark_id","_locale");`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "pages_locales" DROP CONSTRAINT "pages_locales_hero_media_mobile_light_id_media_id_fk";
  
  ALTER TABLE "pages_locales" DROP CONSTRAINT "pages_locales_hero_media_mobile_dark_id_media_id_fk";
  
  ALTER TABLE "_pages_v_locales" DROP CONSTRAINT "_pages_v_locales_version_hero_media_mobile_light_id_media_id_fk";
  
  ALTER TABLE "_pages_v_locales" DROP CONSTRAINT "_pages_v_locales_version_hero_media_mobile_dark_id_media_id_fk";
  
  DROP INDEX IF EXISTS "pages_hero_media_mobile_hero_media_mobile_light_idx";
  DROP INDEX IF EXISTS "pages_hero_media_mobile_hero_media_mobile_dark_idx";
  DROP INDEX IF EXISTS "_pages_v_version_hero_media_mobile_version_hero_media_mobile_light_idx";
  DROP INDEX IF EXISTS "_pages_v_version_hero_media_mobile_version_hero_media_mobile_dark_idx";
  ALTER TABLE "pages_locales" DROP COLUMN IF EXISTS "hero_media_mobile_light_id";
  ALTER TABLE "pages_locales" DROP COLUMN IF EXISTS "hero_media_mobile_dark_id";
  ALTER TABLE "_pages_v_locales" DROP COLUMN IF EXISTS "version_hero_media_mobile_light_id";
  ALTER TABLE "_pages_v_locales" DROP COLUMN IF EXISTS "version_hero_media_mobile_dark_id";`)
}
