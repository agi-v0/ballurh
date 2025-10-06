import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "pages_rels" ADD COLUMN "news_id" uuid;
  ALTER TABLE "_pages_v_rels" ADD COLUMN "news_id" uuid;
  ALTER TABLE "customers_rels" ADD COLUMN "news_id" uuid;
  ALTER TABLE "_customers_v_rels" ADD COLUMN "news_id" uuid;
  ALTER TABLE "redirects_rels" ADD COLUMN "news_id" uuid;
  ALTER TABLE "settings_rels" ADD COLUMN "news_id" uuid;
  ALTER TABLE "header_rels" ADD COLUMN "news_id" uuid;
  ALTER TABLE "footer_rels" ADD COLUMN "news_id" uuid;
  ALTER TABLE "pages_rels" ADD CONSTRAINT "pages_rels_news_fk" FOREIGN KEY ("news_id") REFERENCES "public"."news"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_pages_v_rels" ADD CONSTRAINT "_pages_v_rels_news_fk" FOREIGN KEY ("news_id") REFERENCES "public"."news"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "customers_rels" ADD CONSTRAINT "customers_rels_news_fk" FOREIGN KEY ("news_id") REFERENCES "public"."news"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "_customers_v_rels" ADD CONSTRAINT "_customers_v_rels_news_fk" FOREIGN KEY ("news_id") REFERENCES "public"."news"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "redirects_rels" ADD CONSTRAINT "redirects_rels_news_fk" FOREIGN KEY ("news_id") REFERENCES "public"."news"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "settings_rels" ADD CONSTRAINT "settings_rels_news_fk" FOREIGN KEY ("news_id") REFERENCES "public"."news"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "header_rels" ADD CONSTRAINT "header_rels_news_fk" FOREIGN KEY ("news_id") REFERENCES "public"."news"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "footer_rels" ADD CONSTRAINT "footer_rels_news_fk" FOREIGN KEY ("news_id") REFERENCES "public"."news"("id") ON DELETE cascade ON UPDATE no action;
  CREATE INDEX "pages_rels_news_id_idx" ON "pages_rels" USING btree ("news_id","locale");
  CREATE INDEX "_pages_v_rels_news_id_idx" ON "_pages_v_rels" USING btree ("news_id","locale");
  CREATE INDEX "customers_rels_news_id_idx" ON "customers_rels" USING btree ("news_id");
  CREATE INDEX "_customers_v_rels_news_id_idx" ON "_customers_v_rels" USING btree ("news_id");
  CREATE INDEX "redirects_rels_news_id_idx" ON "redirects_rels" USING btree ("news_id");
  CREATE INDEX "settings_rels_news_id_idx" ON "settings_rels" USING btree ("news_id");
  CREATE INDEX "header_rels_news_id_idx" ON "header_rels" USING btree ("news_id");
  CREATE INDEX "footer_rels_news_id_idx" ON "footer_rels" USING btree ("news_id");`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "pages_rels" DROP CONSTRAINT "pages_rels_news_fk";
  
  ALTER TABLE "_pages_v_rels" DROP CONSTRAINT "_pages_v_rels_news_fk";
  
  ALTER TABLE "customers_rels" DROP CONSTRAINT "customers_rels_news_fk";
  
  ALTER TABLE "_customers_v_rels" DROP CONSTRAINT "_customers_v_rels_news_fk";
  
  ALTER TABLE "redirects_rels" DROP CONSTRAINT "redirects_rels_news_fk";
  
  ALTER TABLE "settings_rels" DROP CONSTRAINT "settings_rels_news_fk";
  
  ALTER TABLE "header_rels" DROP CONSTRAINT "header_rels_news_fk";
  
  ALTER TABLE "footer_rels" DROP CONSTRAINT "footer_rels_news_fk";
  
  DROP INDEX "pages_rels_news_id_idx";
  DROP INDEX "_pages_v_rels_news_id_idx";
  DROP INDEX "customers_rels_news_id_idx";
  DROP INDEX "_customers_v_rels_news_id_idx";
  DROP INDEX "redirects_rels_news_id_idx";
  DROP INDEX "settings_rels_news_id_idx";
  DROP INDEX "header_rels_news_id_idx";
  DROP INDEX "footer_rels_news_id_idx";
  ALTER TABLE "pages_rels" DROP COLUMN "news_id";
  ALTER TABLE "_pages_v_rels" DROP COLUMN "news_id";
  ALTER TABLE "customers_rels" DROP COLUMN "news_id";
  ALTER TABLE "_customers_v_rels" DROP COLUMN "news_id";
  ALTER TABLE "redirects_rels" DROP COLUMN "news_id";
  ALTER TABLE "settings_rels" DROP COLUMN "news_id";
  ALTER TABLE "header_rels" DROP COLUMN "news_id";
  ALTER TABLE "footer_rels" DROP COLUMN "news_id";`)
}
