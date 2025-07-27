import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-vercel-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   CREATE TYPE "public"."enum_teamBlock_block_header_type" AS ENUM('center', 'split', 'start');
  CREATE TYPE "public"."enum_teamBlock_block_header_badge_type" AS ENUM('label', 'reference');
  CREATE TYPE "public"."enum__teamBlock_v_block_header_type" AS ENUM('center', 'split', 'start');
  CREATE TYPE "public"."enum__teamBlock_v_block_header_badge_type" AS ENUM('label', 'reference');
  CREATE TABLE IF NOT EXISTS "teamBlock_block_header_links" (
  	"_order" integer NOT NULL,
  	"_parent_id" varchar NOT NULL,
  	"id" varchar PRIMARY KEY NOT NULL,
  	"link_type" "link_type" DEFAULT 'reference',
  	"link_new_tab" boolean,
  	"link_url" varchar,
  	"link_color" "link_color" DEFAULT 'neutral',
  	"link_variant" "link_variant" DEFAULT 'primary'
  );
  
  CREATE TABLE IF NOT EXISTS "teamBlock_block_header_links_locales" (
  	"link_label" varchar,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" varchar NOT NULL
  );
  
  CREATE TABLE IF NOT EXISTS "teamBlock_team" (
  	"_order" integer NOT NULL,
  	"_parent_id" varchar NOT NULL,
  	"id" varchar PRIMARY KEY NOT NULL,
  	"image_id" uuid,
  	"social_linkedin" varchar,
  	"social_x" varchar
  );
  
  CREATE TABLE IF NOT EXISTS "teamBlock_team_locales" (
  	"name" varchar,
  	"position" varchar,
  	"bio" varchar,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" varchar NOT NULL
  );
  
  CREATE TABLE IF NOT EXISTS "teamBlock" (
  	"_order" integer NOT NULL,
  	"_parent_id" uuid NOT NULL,
  	"_path" text NOT NULL,
  	"id" varchar PRIMARY KEY NOT NULL,
  	"block_header_type" "enum_teamBlock_block_header_type" DEFAULT 'center',
  	"block_header_badge_type" "enum_teamBlock_block_header_badge_type",
  	"block_header_badge_color" "badge_color" DEFAULT 'blue',
  	"block_header_badge_icon" varchar,
  	"block_header_badge_icon_position" "badge_icon_position" DEFAULT 'flex-row',
  	"block_name" varchar
  );
  
  CREATE TABLE IF NOT EXISTS "teamBlock_locales" (
  	"block_header_badge_label" varchar,
  	"block_header_header_text" jsonb,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" varchar NOT NULL
  );
  
  CREATE TABLE IF NOT EXISTS "_teamBlock_v_block_header_links" (
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
  
  CREATE TABLE IF NOT EXISTS "_teamBlock_v_block_header_links_locales" (
  	"link_label" varchar,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" uuid NOT NULL
  );
  
  CREATE TABLE IF NOT EXISTS "_teamBlock_v_team" (
  	"_order" integer NOT NULL,
  	"_parent_id" uuid NOT NULL,
  	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
  	"image_id" uuid,
  	"social_linkedin" varchar,
  	"social_x" varchar,
  	"_uuid" varchar
  );
  
  CREATE TABLE IF NOT EXISTS "_teamBlock_v_team_locales" (
  	"name" varchar,
  	"position" varchar,
  	"bio" varchar,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" uuid NOT NULL
  );
  
  CREATE TABLE IF NOT EXISTS "_teamBlock_v" (
  	"_order" integer NOT NULL,
  	"_parent_id" uuid NOT NULL,
  	"_path" text NOT NULL,
  	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
  	"block_header_type" "enum__teamBlock_v_block_header_type" DEFAULT 'center',
  	"block_header_badge_type" "enum__teamBlock_v_block_header_badge_type",
  	"block_header_badge_color" "badge_color" DEFAULT 'blue',
  	"block_header_badge_icon" varchar,
  	"block_header_badge_icon_position" "badge_icon_position" DEFAULT 'flex-row',
  	"_uuid" varchar,
  	"block_name" varchar
  );
  
  CREATE TABLE IF NOT EXISTS "_teamBlock_v_locales" (
  	"block_header_badge_label" varchar,
  	"block_header_header_text" jsonb,
  	"id" serial PRIMARY KEY NOT NULL,
  	"_locale" "_locales" NOT NULL,
  	"_parent_id" uuid NOT NULL
  );
  
  DO $$ BEGIN
   ALTER TABLE "teamBlock_block_header_links" ADD CONSTRAINT "teamBlock_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."teamBlock"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "teamBlock_block_header_links_locales" ADD CONSTRAINT "teamBlock_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."teamBlock_block_header_links"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "teamBlock_team" ADD CONSTRAINT "teamBlock_team_image_id_media_id_fk" FOREIGN KEY ("image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "teamBlock_team" ADD CONSTRAINT "teamBlock_team_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."teamBlock"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "teamBlock_team_locales" ADD CONSTRAINT "teamBlock_team_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."teamBlock_team"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "teamBlock" ADD CONSTRAINT "teamBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "teamBlock_locales" ADD CONSTRAINT "teamBlock_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."teamBlock"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "_teamBlock_v_block_header_links" ADD CONSTRAINT "_teamBlock_v_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_teamBlock_v"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "_teamBlock_v_block_header_links_locales" ADD CONSTRAINT "_teamBlock_v_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_teamBlock_v_block_header_links"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "_teamBlock_v_team" ADD CONSTRAINT "_teamBlock_v_team_image_id_media_id_fk" FOREIGN KEY ("image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "_teamBlock_v_team" ADD CONSTRAINT "_teamBlock_v_team_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_teamBlock_v"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "_teamBlock_v_team_locales" ADD CONSTRAINT "_teamBlock_v_team_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_teamBlock_v_team"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "_teamBlock_v" ADD CONSTRAINT "_teamBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  DO $$ BEGIN
   ALTER TABLE "_teamBlock_v_locales" ADD CONSTRAINT "_teamBlock_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_teamBlock_v"("id") ON DELETE cascade ON UPDATE no action;
  EXCEPTION
   WHEN duplicate_object THEN null;
  END $$;
  
  CREATE INDEX IF NOT EXISTS "teamBlock_block_header_links_order_idx" ON "teamBlock_block_header_links" USING btree ("_order");
  CREATE INDEX IF NOT EXISTS "teamBlock_block_header_links_parent_id_idx" ON "teamBlock_block_header_links" USING btree ("_parent_id");
  CREATE UNIQUE INDEX IF NOT EXISTS "teamBlock_block_header_links_locales_locale_parent_id_unique" ON "teamBlock_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX IF NOT EXISTS "teamBlock_team_order_idx" ON "teamBlock_team" USING btree ("_order");
  CREATE INDEX IF NOT EXISTS "teamBlock_team_parent_id_idx" ON "teamBlock_team" USING btree ("_parent_id");
  CREATE INDEX IF NOT EXISTS "teamBlock_team_image_idx" ON "teamBlock_team" USING btree ("image_id");
  CREATE UNIQUE INDEX IF NOT EXISTS "teamBlock_team_locales_locale_parent_id_unique" ON "teamBlock_team_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX IF NOT EXISTS "teamBlock_order_idx" ON "teamBlock" USING btree ("_order");
  CREATE INDEX IF NOT EXISTS "teamBlock_parent_id_idx" ON "teamBlock" USING btree ("_parent_id");
  CREATE INDEX IF NOT EXISTS "teamBlock_path_idx" ON "teamBlock" USING btree ("_path");
  CREATE UNIQUE INDEX IF NOT EXISTS "teamBlock_locales_locale_parent_id_unique" ON "teamBlock_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX IF NOT EXISTS "_teamBlock_v_block_header_links_order_idx" ON "_teamBlock_v_block_header_links" USING btree ("_order");
  CREATE INDEX IF NOT EXISTS "_teamBlock_v_block_header_links_parent_id_idx" ON "_teamBlock_v_block_header_links" USING btree ("_parent_id");
  CREATE UNIQUE INDEX IF NOT EXISTS "_teamBlock_v_block_header_links_locales_locale_parent_id_unique" ON "_teamBlock_v_block_header_links_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX IF NOT EXISTS "_teamBlock_v_team_order_idx" ON "_teamBlock_v_team" USING btree ("_order");
  CREATE INDEX IF NOT EXISTS "_teamBlock_v_team_parent_id_idx" ON "_teamBlock_v_team" USING btree ("_parent_id");
  CREATE INDEX IF NOT EXISTS "_teamBlock_v_team_image_idx" ON "_teamBlock_v_team" USING btree ("image_id");
  CREATE UNIQUE INDEX IF NOT EXISTS "_teamBlock_v_team_locales_locale_parent_id_unique" ON "_teamBlock_v_team_locales" USING btree ("_locale","_parent_id");
  CREATE INDEX IF NOT EXISTS "_teamBlock_v_order_idx" ON "_teamBlock_v" USING btree ("_order");
  CREATE INDEX IF NOT EXISTS "_teamBlock_v_parent_id_idx" ON "_teamBlock_v" USING btree ("_parent_id");
  CREATE INDEX IF NOT EXISTS "_teamBlock_v_path_idx" ON "_teamBlock_v" USING btree ("_path");
  CREATE UNIQUE INDEX IF NOT EXISTS "_teamBlock_v_locales_locale_parent_id_unique" ON "_teamBlock_v_locales" USING btree ("_locale","_parent_id");`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   DROP TABLE "teamBlock_block_header_links" CASCADE;
  DROP TABLE "teamBlock_block_header_links_locales" CASCADE;
  DROP TABLE "teamBlock_team" CASCADE;
  DROP TABLE "teamBlock_team_locales" CASCADE;
  DROP TABLE "teamBlock" CASCADE;
  DROP TABLE "teamBlock_locales" CASCADE;
  DROP TABLE "_teamBlock_v_block_header_links" CASCADE;
  DROP TABLE "_teamBlock_v_block_header_links_locales" CASCADE;
  DROP TABLE "_teamBlock_v_team" CASCADE;
  DROP TABLE "_teamBlock_v_team_locales" CASCADE;
  DROP TABLE "_teamBlock_v" CASCADE;
  DROP TABLE "_teamBlock_v_locales" CASCADE;
  DROP TYPE "public"."enum_teamBlock_block_header_type";
  DROP TYPE "public"."enum_teamBlock_block_header_badge_type";
  DROP TYPE "public"."enum__teamBlock_v_block_header_type";
  DROP TYPE "public"."enum__teamBlock_v_block_header_badge_type";`)
}
