import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-postgres'

// Ensure locale rows exist then backfill localized images for features columns and blockImage
export async function up({ db }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
    -- Ensure current locales rows exist for featuresBlock
    INSERT INTO "featuresBlock_locales" ("_parent_id", "_locale")
    SELECT f."id", 'en'
    FROM "featuresBlock" f
    WHERE NOT EXISTS (
      SELECT 1 FROM "featuresBlock_locales" fl
      WHERE fl."_parent_id" = f."id" AND fl."_locale" = 'en'
    );

    INSERT INTO "featuresBlock_locales" ("_parent_id", "_locale")
    SELECT f."id", 'ar'
    FROM "featuresBlock" f
    WHERE NOT EXISTS (
      SELECT 1 FROM "featuresBlock_locales" fl
      WHERE fl."_parent_id" = f."id" AND fl."_locale" = 'ar'
    );

    INSERT INTO "_featuresBlock_v_locales" ("_parent_id", "_locale")
    SELECT v."id", 'en'
    FROM "_featuresBlock_v" v
    WHERE NOT EXISTS (
      SELECT 1 FROM "_featuresBlock_v_locales" vl
      WHERE vl."_parent_id" = v."id" AND vl."_locale" = 'en'
    );

    INSERT INTO "_featuresBlock_v_locales" ("_parent_id", "_locale")
    SELECT v."id", 'ar'
    FROM "_featuresBlock_v" v
    WHERE NOT EXISTS (
      SELECT 1 FROM "_featuresBlock_v_locales" vl
      WHERE vl."_parent_id" = v."id" AND vl."_locale" = 'ar'
    );

    -- Ensure columns locales rows exist for both current and version tables
    INSERT INTO "featuresBlock_columns_locales" ("_parent_id", "_locale")
    SELECT c."id", 'en'
    FROM "featuresBlock_columns" c
    WHERE NOT EXISTS (
      SELECT 1 FROM "featuresBlock_columns_locales" cl
      WHERE cl."_parent_id" = c."id" AND cl."_locale" = 'en'
    );

    INSERT INTO "featuresBlock_columns_locales" ("_parent_id", "_locale")
    SELECT c."id", 'ar'
    FROM "featuresBlock_columns" c
    WHERE NOT EXISTS (
      SELECT 1 FROM "featuresBlock_columns_locales" cl
      WHERE cl."_parent_id" = c."id" AND cl."_locale" = 'ar'
    );

    INSERT INTO "_featuresBlock_v_columns_locales" ("_parent_id", "_locale")
    SELECT c."id", 'en'
    FROM "_featuresBlock_v_columns" c
    WHERE NOT EXISTS (
      SELECT 1 FROM "_featuresBlock_v_columns_locales" cl
      WHERE cl."_parent_id" = c."id" AND cl."_locale" = 'en'
    );

    INSERT INTO "_featuresBlock_v_columns_locales" ("_parent_id", "_locale")
    SELECT c."id", 'ar'
    FROM "_featuresBlock_v_columns" c
    WHERE NOT EXISTS (
      SELECT 1 FROM "_featuresBlock_v_columns_locales" cl
      WHERE cl."_parent_id" = c."id" AND cl."_locale" = 'ar'
    );

    -- 1) Current columns: copy image_id from AR -> EN when EN is missing
    UPDATE "featuresBlock_columns_locales" AS en
    SET "image_id" = ar."image_id"
    FROM "featuresBlock_columns_locales" AS ar
    WHERE en."_parent_id" = ar."_parent_id"
      AND en."_locale" = 'en'
      AND ar."_locale" = 'ar'
      AND en."image_id" IS NULL
      AND ar."image_id" IS NOT NULL;

    -- 2) Current columns: copy image_id from EN -> AR when AR is missing
    UPDATE "featuresBlock_columns_locales" AS ar
    SET "image_id" = en."image_id"
    FROM "featuresBlock_columns_locales" AS en
    WHERE ar."_parent_id" = en."_parent_id"
      AND ar."_locale" = 'ar'
      AND en."_locale" = 'en'
      AND ar."image_id" IS NULL
      AND en."image_id" IS NOT NULL;

    -- 3) Versions columns: AR -> EN
    UPDATE "_featuresBlock_v_columns_locales" AS en
    SET "image_id" = ar."image_id"
    FROM "_featuresBlock_v_columns_locales" AS ar
    WHERE en."_parent_id" = ar."_parent_id"
      AND en."_locale" = 'en'
      AND ar."_locale" = 'ar'
      AND en."image_id" IS NULL
      AND ar."image_id" IS NOT NULL;

    -- 4) Versions columns: EN -> AR
    UPDATE "_featuresBlock_v_columns_locales" AS ar
    SET "image_id" = en."image_id"
    FROM "_featuresBlock_v_columns_locales" AS en
    WHERE ar."_parent_id" = en."_parent_id"
      AND ar."_locale" = 'ar'
      AND en."_locale" = 'en'
      AND ar."image_id" IS NULL
      AND en."image_id" IS NOT NULL;

    -- 5) Current blockImage: AR -> EN
    UPDATE "featuresBlock_locales" AS en
    SET "block_image_id" = ar."block_image_id"
    FROM "featuresBlock_locales" AS ar
    WHERE en."_parent_id" = ar."_parent_id"
      AND en."_locale" = 'en'
      AND ar."_locale" = 'ar'
      AND en."block_image_id" IS NULL
      AND ar."block_image_id" IS NOT NULL;

    -- 6) Current blockImage: EN -> AR
    UPDATE "featuresBlock_locales" AS ar
    SET "block_image_id" = en."block_image_id"
    FROM "featuresBlock_locales" AS en
    WHERE ar."_parent_id" = en."_parent_id"
      AND ar."_locale" = 'ar'
      AND en."_locale" = 'en'
      AND ar."block_image_id" IS NULL
      AND en."block_image_id" IS NOT NULL;

    -- 7) Versions blockImage: AR -> EN
    UPDATE "_featuresBlock_v_locales" AS en
    SET "block_image_id" = ar."block_image_id"
    FROM "_featuresBlock_v_locales" AS ar
    WHERE en."_parent_id" = ar."_parent_id"
      AND en."_locale" = 'en'
      AND ar."_locale" = 'ar'
      AND en."block_image_id" IS NULL
      AND ar."block_image_id" IS NOT NULL;

    -- 8) Versions blockImage: EN -> AR
    UPDATE "_featuresBlock_v_locales" AS ar
    SET "block_image_id" = en."block_image_id"
    FROM "_featuresBlock_v_locales" AS en
    WHERE ar."_parent_id" = en."_parent_id"
      AND ar."_locale" = 'ar'
      AND en."_locale" = 'en'
      AND ar."block_image_id" IS NULL
      AND en."block_image_id" IS NOT NULL;
  `)
}

export async function down({ db }: MigrateDownArgs): Promise<void> {
  // Non-destructive: leave copied values in place
  await db.execute(sql`SELECT 1;`)
}
