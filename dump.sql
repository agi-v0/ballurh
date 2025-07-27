--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY "public"."testimonialsBlock" DROP CONSTRAINT IF EXISTS "testimonialsBlock_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."testimonialsBlock_locales" DROP CONSTRAINT IF EXISTS "testimonialsBlock_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."testimonialsBlock_block_header_links" DROP CONSTRAINT IF EXISTS "testimonialsBlock_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."testimonialsBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "testimonialsBlock_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."settings_rels" DROP CONSTRAINT IF EXISTS "settings_rels_parent_fk";
ALTER TABLE IF EXISTS ONLY "public"."settings_rels" DROP CONSTRAINT IF EXISTS "settings_rels_pages_fk";
ALTER TABLE IF EXISTS ONLY "public"."settings_rels" DROP CONSTRAINT IF EXISTS "settings_rels_blog_posts_fk";
ALTER TABLE IF EXISTS ONLY "public"."settings_locales" DROP CONSTRAINT IF EXISTS "settings_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."settings_locales" DROP CONSTRAINT IF EXISTS "settings_locales_meta_image_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."search_rels" DROP CONSTRAINT IF EXISTS "search_rels_parent_fk";
ALTER TABLE IF EXISTS ONLY "public"."search_rels" DROP CONSTRAINT IF EXISTS "search_rels_blog_posts_fk";
ALTER TABLE IF EXISTS ONLY "public"."search" DROP CONSTRAINT IF EXISTS "search_meta_image_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."search_locales" DROP CONSTRAINT IF EXISTS "search_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."search_categories" DROP CONSTRAINT IF EXISTS "search_categories_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."richTextBlock" DROP CONSTRAINT IF EXISTS "richTextBlock_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."richTextBlock_locales" DROP CONSTRAINT IF EXISTS "richTextBlock_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."richTextBlock_block_header_links" DROP CONSTRAINT IF EXISTS "richTextBlock_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."richTextBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "richTextBlock_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."redirects_rels" DROP CONSTRAINT IF EXISTS "redirects_rels_parent_fk";
ALTER TABLE IF EXISTS ONLY "public"."redirects_rels" DROP CONSTRAINT IF EXISTS "redirects_rels_pages_fk";
ALTER TABLE IF EXISTS ONLY "public"."redirects_rels" DROP CONSTRAINT IF EXISTS "redirects_rels_blog_posts_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_preferences_rels" DROP CONSTRAINT IF EXISTS "payload_preferences_rels_users_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_preferences_rels" DROP CONSTRAINT IF EXISTS "payload_preferences_rels_parent_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_locked_documents_rels" DROP CONSTRAINT IF EXISTS "payload_locked_documents_rels_users_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_locked_documents_rels" DROP CONSTRAINT IF EXISTS "payload_locked_documents_rels_search_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_locked_documents_rels" DROP CONSTRAINT IF EXISTS "payload_locked_documents_rels_redirects_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_locked_documents_rels" DROP CONSTRAINT IF EXISTS "payload_locked_documents_rels_payload_jobs_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_locked_documents_rels" DROP CONSTRAINT IF EXISTS "payload_locked_documents_rels_payload_folders_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_locked_documents_rels" DROP CONSTRAINT IF EXISTS "payload_locked_documents_rels_parent_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_locked_documents_rels" DROP CONSTRAINT IF EXISTS "payload_locked_documents_rels_pages_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_locked_documents_rels" DROP CONSTRAINT IF EXISTS "payload_locked_documents_rels_media_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_locked_documents_rels" DROP CONSTRAINT IF EXISTS "payload_locked_documents_rels_forms_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_locked_documents_rels" DROP CONSTRAINT IF EXISTS "payload_locked_documents_rels_form_submissions_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_locked_documents_rels" DROP CONSTRAINT IF EXISTS "payload_locked_documents_rels_faq_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_locked_documents_rels" DROP CONSTRAINT IF EXISTS "payload_locked_documents_rels_customers_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_locked_documents_rels" DROP CONSTRAINT IF EXISTS "payload_locked_documents_rels_categories_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_locked_documents_rels" DROP CONSTRAINT IF EXISTS "payload_locked_documents_rels_blog_posts_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_jobs_log" DROP CONSTRAINT IF EXISTS "payload_jobs_log_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."payload_folders" DROP CONSTRAINT IF EXISTS "payload_folders_folder_id_payload_folders_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."pages_rels" DROP CONSTRAINT IF EXISTS "pages_rels_parent_fk";
ALTER TABLE IF EXISTS ONLY "public"."pages_rels" DROP CONSTRAINT IF EXISTS "pages_rels_pages_fk";
ALTER TABLE IF EXISTS ONLY "public"."pages_rels" DROP CONSTRAINT IF EXISTS "pages_rels_media_fk";
ALTER TABLE IF EXISTS ONLY "public"."pages_rels" DROP CONSTRAINT IF EXISTS "pages_rels_faq_fk";
ALTER TABLE IF EXISTS ONLY "public"."pages_rels" DROP CONSTRAINT IF EXISTS "pages_rels_customers_fk";
ALTER TABLE IF EXISTS ONLY "public"."pages_rels" DROP CONSTRAINT IF EXISTS "pages_rels_categories_fk";
ALTER TABLE IF EXISTS ONLY "public"."pages_rels" DROP CONSTRAINT IF EXISTS "pages_rels_blog_posts_fk";
ALTER TABLE IF EXISTS ONLY "public"."pages_locales" DROP CONSTRAINT IF EXISTS "pages_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."pages_locales" DROP CONSTRAINT IF EXISTS "pages_locales_meta_image_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."pages_locales" DROP CONSTRAINT IF EXISTS "pages_locales_hero_media_mobile_light_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."pages_locales" DROP CONSTRAINT IF EXISTS "pages_locales_hero_media_mobile_dark_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."pages_locales" DROP CONSTRAINT IF EXISTS "pages_locales_hero_media_desktop_light_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."pages_locales" DROP CONSTRAINT IF EXISTS "pages_locales_hero_media_desktop_dark_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."pages_hero_links" DROP CONSTRAINT IF EXISTS "pages_hero_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."pages_hero_links_locales" DROP CONSTRAINT IF EXISTS "pages_hero_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_table_rows" DROP CONSTRAINT IF EXISTS "metricsBlock_table_rows_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_table_rows_children" DROP CONSTRAINT IF EXISTS "metricsBlock_table_rows_children_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_table_rows_children_cells" DROP CONSTRAINT IF EXISTS "metricsBlock_table_rows_children_cells_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_table_rows_cells" DROP CONSTRAINT IF EXISTS "metricsBlock_table_rows_cells_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_table_headers" DROP CONSTRAINT IF EXISTS "metricsBlock_table_headers_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_stats" DROP CONSTRAINT IF EXISTS "metricsBlock_stats_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_stats_locales" DROP CONSTRAINT IF EXISTS "metricsBlock_stats_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock" DROP CONSTRAINT IF EXISTS "metricsBlock_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_locales" DROP CONSTRAINT IF EXISTS "metricsBlock_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_locales" DROP CONSTRAINT IF EXISTS "metricsBlock_locales_block_image_media_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_block_header_links" DROP CONSTRAINT IF EXISTS "metricsBlock_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "metricsBlock_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."media_rels" DROP CONSTRAINT IF EXISTS "media_rels_parent_fk";
ALTER TABLE IF EXISTS ONLY "public"."media_rels" DROP CONSTRAINT IF EXISTS "media_rels_categories_fk";
ALTER TABLE IF EXISTS ONLY "public"."media" DROP CONSTRAINT IF EXISTS "media_folder_id_payload_folders_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."logosBlock" DROP CONSTRAINT IF EXISTS "logosBlock_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."logosBlock_locales" DROP CONSTRAINT IF EXISTS "logosBlock_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."logosBlock_block_header_links" DROP CONSTRAINT IF EXISTS "logosBlock_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."logosBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "logosBlock_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs" DROP CONSTRAINT IF EXISTS "header_tabs_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_nav_items" DROP CONSTRAINT IF EXISTS "header_tabs_nav_items_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_nav_items_locales" DROP CONSTRAINT IF EXISTS "header_tabs_nav_items_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_nav_items_list_links_links" DROP CONSTRAINT IF EXISTS "header_tabs_nav_items_list_links_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_nav_items_list_links_links_locales" DROP CONSTRAINT IF EXISTS "header_tabs_nav_items_list_links_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_nav_items_featured_link_links" DROP CONSTRAINT IF EXISTS "header_tabs_nav_items_featured_link_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_nav_items_featured_link_links_locales" DROP CONSTRAINT IF EXISTS "header_tabs_nav_items_featured_link_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_locales" DROP CONSTRAINT IF EXISTS "header_tabs_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_description_links" DROP CONSTRAINT IF EXISTS "header_tabs_description_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_description_links_locales" DROP CONSTRAINT IF EXISTS "header_tabs_description_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."header_rels" DROP CONSTRAINT IF EXISTS "header_rels_parent_fk";
ALTER TABLE IF EXISTS ONLY "public"."header_rels" DROP CONSTRAINT IF EXISTS "header_rels_pages_fk";
ALTER TABLE IF EXISTS ONLY "public"."header_rels" DROP CONSTRAINT IF EXISTS "header_rels_blog_posts_fk";
ALTER TABLE IF EXISTS ONLY "public"."header_cta" DROP CONSTRAINT IF EXISTS "header_cta_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."header_cta_locales" DROP CONSTRAINT IF EXISTS "header_cta_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."galleryBlock" DROP CONSTRAINT IF EXISTS "galleryBlock_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."galleryBlock_locales" DROP CONSTRAINT IF EXISTS "galleryBlock_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."galleryBlock_interactive_gallery" DROP CONSTRAINT IF EXISTS "galleryBlock_interactive_gallery_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."galleryBlock_interactive_gallery_locales" DROP CONSTRAINT IF EXISTS "galleryBlock_interactive_gallery_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."galleryBlock_interactive_gallery_locales" DROP CONSTRAINT IF EXISTS "galleryBlock_interactive_gallery_locales_image_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."galleryBlock_block_header_links" DROP CONSTRAINT IF EXISTS "galleryBlock_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."galleryBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "galleryBlock_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_locales" DROP CONSTRAINT IF EXISTS "forms_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_emails" DROP CONSTRAINT IF EXISTS "forms_emails_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_emails_locales" DROP CONSTRAINT IF EXISTS "forms_emails_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_textarea" DROP CONSTRAINT IF EXISTS "forms_blocks_textarea_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_textarea_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_textarea_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_text" DROP CONSTRAINT IF EXISTS "forms_blocks_text_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_text_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_text_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_state" DROP CONSTRAINT IF EXISTS "forms_blocks_state_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_state_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_state_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_select" DROP CONSTRAINT IF EXISTS "forms_blocks_select_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_select_options" DROP CONSTRAINT IF EXISTS "forms_blocks_select_options_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_select_options_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_select_options_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_select_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_select_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_number" DROP CONSTRAINT IF EXISTS "forms_blocks_number_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_number_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_number_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_message" DROP CONSTRAINT IF EXISTS "forms_blocks_message_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_message_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_message_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_email" DROP CONSTRAINT IF EXISTS "forms_blocks_email_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_email_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_email_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_country" DROP CONSTRAINT IF EXISTS "forms_blocks_country_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_country_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_country_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_checkbox" DROP CONSTRAINT IF EXISTS "forms_blocks_checkbox_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_checkbox_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_checkbox_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."form_submissions_submission_data" DROP CONSTRAINT IF EXISTS "form_submissions_submission_data_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."form_submissions" DROP CONSTRAINT IF EXISTS "form_submissions_form_id_forms_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."formBlock" DROP CONSTRAINT IF EXISTS "formBlock_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."formBlock" DROP CONSTRAINT IF EXISTS "formBlock_form_id_forms_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."footer_rels" DROP CONSTRAINT IF EXISTS "footer_rels_parent_fk";
ALTER TABLE IF EXISTS ONLY "public"."footer_rels" DROP CONSTRAINT IF EXISTS "footer_rels_pages_fk";
ALTER TABLE IF EXISTS ONLY "public"."footer_rels" DROP CONSTRAINT IF EXISTS "footer_rels_blog_posts_fk";
ALTER TABLE IF EXISTS ONLY "public"."footer_columns" DROP CONSTRAINT IF EXISTS "footer_columns_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."footer_columns_nav_items" DROP CONSTRAINT IF EXISTS "footer_columns_nav_items_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."footer_columns_nav_items_locales" DROP CONSTRAINT IF EXISTS "footer_columns_nav_items_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."featuresBlock" DROP CONSTRAINT IF EXISTS "featuresBlock_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."featuresBlock_locales" DROP CONSTRAINT IF EXISTS "featuresBlock_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."featuresBlock_columns" DROP CONSTRAINT IF EXISTS "featuresBlock_columns_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."featuresBlock_columns_locales" DROP CONSTRAINT IF EXISTS "featuresBlock_columns_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."featuresBlock_columns_locales" DROP CONSTRAINT IF EXISTS "featuresBlock_columns_locales_image_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."featuresBlock" DROP CONSTRAINT IF EXISTS "featuresBlock_block_image_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."featuresBlock_block_header_links" DROP CONSTRAINT IF EXISTS "featuresBlock_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."featuresBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "featuresBlock_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."faq_locales" DROP CONSTRAINT IF EXISTS "faq_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."faq" DROP CONSTRAINT IF EXISTS "faq_category_id_categories_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."faqBlock" DROP CONSTRAINT IF EXISTS "faqBlock_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."faqBlock_locales" DROP CONSTRAINT IF EXISTS "faqBlock_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."faqBlock_block_header_links" DROP CONSTRAINT IF EXISTS "faqBlock_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."faqBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "faqBlock_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."dividerBlock" DROP CONSTRAINT IF EXISTS "dividerBlock_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."customers_testimonial_stats" DROP CONSTRAINT IF EXISTS "customers_testimonial_stats_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."customers_testimonial_stats_locales" DROP CONSTRAINT IF EXISTS "customers_testimonial_stats_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."customers" DROP CONSTRAINT IF EXISTS "customers_testimonial_featured_image_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."customers" DROP CONSTRAINT IF EXISTS "customers_testimonial_company_company_logo_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."customers" DROP CONSTRAINT IF EXISTS "customers_testimonial_author_info_avatar_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."customers_rels" DROP CONSTRAINT IF EXISTS "customers_rels_parent_fk";
ALTER TABLE IF EXISTS ONLY "public"."customers_rels" DROP CONSTRAINT IF EXISTS "customers_rels_pages_fk";
ALTER TABLE IF EXISTS ONLY "public"."customers_rels" DROP CONSTRAINT IF EXISTS "customers_rels_categories_fk";
ALTER TABLE IF EXISTS ONLY "public"."customers_rels" DROP CONSTRAINT IF EXISTS "customers_rels_blog_posts_fk";
ALTER TABLE IF EXISTS ONLY "public"."customers_locales" DROP CONSTRAINT IF EXISTS "customers_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."customHtmlBlock" DROP CONSTRAINT IF EXISTS "customHtmlBlock_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."customHtmlBlock_locales" DROP CONSTRAINT IF EXISTS "customHtmlBlock_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."customHtmlBlock_block_header_links" DROP CONSTRAINT IF EXISTS "customHtmlBlock_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."customHtmlBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "customHtmlBlock_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."categories" DROP CONSTRAINT IF EXISTS "categories_parent_id_categories_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."categories_breadcrumbs" DROP CONSTRAINT IF EXISTS "categories_breadcrumbs_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."categories_breadcrumbs" DROP CONSTRAINT IF EXISTS "categories_breadcrumbs_doc_id_categories_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."callToActionBlock" DROP CONSTRAINT IF EXISTS "callToActionBlock_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."callToActionBlock_locales" DROP CONSTRAINT IF EXISTS "callToActionBlock_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."callToActionBlock_locales" DROP CONSTRAINT IF EXISTS "callToActionBlock_locales_media_mobile_light_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."callToActionBlock_locales" DROP CONSTRAINT IF EXISTS "callToActionBlock_locales_media_mobile_dark_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."callToActionBlock_locales" DROP CONSTRAINT IF EXISTS "callToActionBlock_locales_media_desktop_light_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."callToActionBlock_locales" DROP CONSTRAINT IF EXISTS "callToActionBlock_locales_media_desktop_dark_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."callToActionBlock_list" DROP CONSTRAINT IF EXISTS "callToActionBlock_list_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."callToActionBlock_links" DROP CONSTRAINT IF EXISTS "callToActionBlock_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."callToActionBlock_links_locales" DROP CONSTRAINT IF EXISTS "callToActionBlock_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."callToActionBlock" DROP CONSTRAINT IF EXISTS "callToActionBlock_form_id_forms_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."blog_posts_rels" DROP CONSTRAINT IF EXISTS "blog_posts_rels_users_fk";
ALTER TABLE IF EXISTS ONLY "public"."blog_posts_rels" DROP CONSTRAINT IF EXISTS "blog_posts_rels_parent_fk";
ALTER TABLE IF EXISTS ONLY "public"."blog_posts_rels" DROP CONSTRAINT IF EXISTS "blog_posts_rels_categories_fk";
ALTER TABLE IF EXISTS ONLY "public"."blog_posts_rels" DROP CONSTRAINT IF EXISTS "blog_posts_rels_blog_posts_fk";
ALTER TABLE IF EXISTS ONLY "public"."blog_posts_populated_authors" DROP CONSTRAINT IF EXISTS "blog_posts_populated_authors_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."blog_posts_locales" DROP CONSTRAINT IF EXISTS "blog_posts_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."blog_posts_locales" DROP CONSTRAINT IF EXISTS "blog_posts_locales_meta_image_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."blog_posts_locales" DROP CONSTRAINT IF EXISTS "blog_posts_locales_hero_image_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."blogBlock" DROP CONSTRAINT IF EXISTS "blogBlock_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."blogBlock_locales" DROP CONSTRAINT IF EXISTS "blogBlock_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."blogBlock" DROP CONSTRAINT IF EXISTS "blogBlock_featured_post_id_blog_posts_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."archiveBlock" DROP CONSTRAINT IF EXISTS "archiveBlock_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."archiveBlock_locales" DROP CONSTRAINT IF EXISTS "archiveBlock_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."archiveBlock_block_header_links" DROP CONSTRAINT IF EXISTS "archiveBlock_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."archiveBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "archiveBlock_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_testimonialsBlock_v" DROP CONSTRAINT IF EXISTS "_testimonialsBlock_v_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_testimonialsBlock_v_locales" DROP CONSTRAINT IF EXISTS "_testimonialsBlock_v_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_testimonialsBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_testimonialsBlock_v_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_testimonialsBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_testimonialsBlock_v_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_richTextBlock_v" DROP CONSTRAINT IF EXISTS "_richTextBlock_v_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_richTextBlock_v_locales" DROP CONSTRAINT IF EXISTS "_richTextBlock_v_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_richTextBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_richTextBlock_v_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_richTextBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_richTextBlock_v_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_version_hero_links" DROP CONSTRAINT IF EXISTS "_pages_v_version_hero_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_version_hero_links_locales" DROP CONSTRAINT IF EXISTS "_pages_v_version_hero_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_rels" DROP CONSTRAINT IF EXISTS "_pages_v_rels_parent_fk";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_rels" DROP CONSTRAINT IF EXISTS "_pages_v_rels_pages_fk";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_rels" DROP CONSTRAINT IF EXISTS "_pages_v_rels_media_fk";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_rels" DROP CONSTRAINT IF EXISTS "_pages_v_rels_faq_fk";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_rels" DROP CONSTRAINT IF EXISTS "_pages_v_rels_customers_fk";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_rels" DROP CONSTRAINT IF EXISTS "_pages_v_rels_categories_fk";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_rels" DROP CONSTRAINT IF EXISTS "_pages_v_rels_blog_posts_fk";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v" DROP CONSTRAINT IF EXISTS "_pages_v_parent_id_pages_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_locales" DROP CONSTRAINT IF EXISTS "_pages_v_locales_version_meta_image_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_locales" DROP CONSTRAINT IF EXISTS "_pages_v_locales_version_hero_media_mobile_light_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_locales" DROP CONSTRAINT IF EXISTS "_pages_v_locales_version_hero_media_mobile_dark_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_locales" DROP CONSTRAINT IF EXISTS "_pages_v_locales_version_hero_media_desktop_light_id_media_id_f";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_locales" DROP CONSTRAINT IF EXISTS "_pages_v_locales_version_hero_media_desktop_dark_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_locales" DROP CONSTRAINT IF EXISTS "_pages_v_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_table_rows" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_table_rows_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_table_rows_children" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_table_rows_children_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_table_rows_children_cells" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_table_rows_children_cells_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_table_rows_cells" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_table_rows_cells_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_table_headers" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_table_headers_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_stats" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_stats_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_stats_locales" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_stats_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_locales" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_locales" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_locales_block_image_media_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_logosBlock_v" DROP CONSTRAINT IF EXISTS "_logosBlock_v_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_logosBlock_v_locales" DROP CONSTRAINT IF EXISTS "_logosBlock_v_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_logosBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_logosBlock_v_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_logosBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_logosBlock_v_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_galleryBlock_v" DROP CONSTRAINT IF EXISTS "_galleryBlock_v_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_galleryBlock_v_locales" DROP CONSTRAINT IF EXISTS "_galleryBlock_v_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_galleryBlock_v_interactive_gallery" DROP CONSTRAINT IF EXISTS "_galleryBlock_v_interactive_gallery_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_galleryBlock_v_interactive_gallery_locales" DROP CONSTRAINT IF EXISTS "_galleryBlock_v_interactive_gallery_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_galleryBlock_v_interactive_gallery_locales" DROP CONSTRAINT IF EXISTS "_galleryBlock_v_interactive_gallery_locales_image_id_media_id_f";
ALTER TABLE IF EXISTS ONLY "public"."_galleryBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_galleryBlock_v_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_galleryBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_galleryBlock_v_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_formBlock_v" DROP CONSTRAINT IF EXISTS "_formBlock_v_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_formBlock_v" DROP CONSTRAINT IF EXISTS "_formBlock_v_form_id_forms_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_featuresBlock_v" DROP CONSTRAINT IF EXISTS "_featuresBlock_v_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_featuresBlock_v_locales" DROP CONSTRAINT IF EXISTS "_featuresBlock_v_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_featuresBlock_v_columns" DROP CONSTRAINT IF EXISTS "_featuresBlock_v_columns_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_featuresBlock_v_columns_locales" DROP CONSTRAINT IF EXISTS "_featuresBlock_v_columns_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_featuresBlock_v_columns_locales" DROP CONSTRAINT IF EXISTS "_featuresBlock_v_columns_locales_image_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_featuresBlock_v" DROP CONSTRAINT IF EXISTS "_featuresBlock_v_block_image_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_featuresBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_featuresBlock_v_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_featuresBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_featuresBlock_v_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_faq_v" DROP CONSTRAINT IF EXISTS "_faq_v_version_category_id_categories_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_faq_v" DROP CONSTRAINT IF EXISTS "_faq_v_parent_id_faq_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_faq_v_locales" DROP CONSTRAINT IF EXISTS "_faq_v_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_faqBlock_v" DROP CONSTRAINT IF EXISTS "_faqBlock_v_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_faqBlock_v_locales" DROP CONSTRAINT IF EXISTS "_faqBlock_v_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_faqBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_faqBlock_v_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_faqBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_faqBlock_v_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_dividerBlock_v" DROP CONSTRAINT IF EXISTS "_dividerBlock_v_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_customers_v_version_testimonial_stats" DROP CONSTRAINT IF EXISTS "_customers_v_version_testimonial_stats_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_customers_v_version_testimonial_stats_locales" DROP CONSTRAINT IF EXISTS "_customers_v_version_testimonial_stats_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_customers_v" DROP CONSTRAINT IF EXISTS "_customers_v_version_testimonial_featured_image_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_customers_v" DROP CONSTRAINT IF EXISTS "_customers_v_version_testimonial_company_company_logo_id_media_";
ALTER TABLE IF EXISTS ONLY "public"."_customers_v" DROP CONSTRAINT IF EXISTS "_customers_v_version_testimonial_author_info_avatar_id_media_id";
ALTER TABLE IF EXISTS ONLY "public"."_customers_v_rels" DROP CONSTRAINT IF EXISTS "_customers_v_rels_parent_fk";
ALTER TABLE IF EXISTS ONLY "public"."_customers_v_rels" DROP CONSTRAINT IF EXISTS "_customers_v_rels_pages_fk";
ALTER TABLE IF EXISTS ONLY "public"."_customers_v_rels" DROP CONSTRAINT IF EXISTS "_customers_v_rels_categories_fk";
ALTER TABLE IF EXISTS ONLY "public"."_customers_v_rels" DROP CONSTRAINT IF EXISTS "_customers_v_rels_blog_posts_fk";
ALTER TABLE IF EXISTS ONLY "public"."_customers_v" DROP CONSTRAINT IF EXISTS "_customers_v_parent_id_customers_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_customers_v_locales" DROP CONSTRAINT IF EXISTS "_customers_v_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_customHtmlBlock_v" DROP CONSTRAINT IF EXISTS "_customHtmlBlock_v_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_customHtmlBlock_v_locales" DROP CONSTRAINT IF EXISTS "_customHtmlBlock_v_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_customHtmlBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_customHtmlBlock_v_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_customHtmlBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_customHtmlBlock_v_block_header_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_callToActionBlock_v" DROP CONSTRAINT IF EXISTS "_callToActionBlock_v_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_callToActionBlock_v_locales" DROP CONSTRAINT IF EXISTS "_callToActionBlock_v_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_callToActionBlock_v_locales" DROP CONSTRAINT IF EXISTS "_callToActionBlock_v_locales_media_mobile_light_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_callToActionBlock_v_locales" DROP CONSTRAINT IF EXISTS "_callToActionBlock_v_locales_media_mobile_dark_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_callToActionBlock_v_locales" DROP CONSTRAINT IF EXISTS "_callToActionBlock_v_locales_media_desktop_light_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_callToActionBlock_v_locales" DROP CONSTRAINT IF EXISTS "_callToActionBlock_v_locales_media_desktop_dark_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_callToActionBlock_v_list" DROP CONSTRAINT IF EXISTS "_callToActionBlock_v_list_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_callToActionBlock_v_links" DROP CONSTRAINT IF EXISTS "_callToActionBlock_v_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_callToActionBlock_v_links_locales" DROP CONSTRAINT IF EXISTS "_callToActionBlock_v_links_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_callToActionBlock_v" DROP CONSTRAINT IF EXISTS "_callToActionBlock_v_form_id_forms_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_blog_posts_v_version_populated_authors" DROP CONSTRAINT IF EXISTS "_blog_posts_v_version_populated_authors_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_blog_posts_v_rels" DROP CONSTRAINT IF EXISTS "_blog_posts_v_rels_users_fk";
ALTER TABLE IF EXISTS ONLY "public"."_blog_posts_v_rels" DROP CONSTRAINT IF EXISTS "_blog_posts_v_rels_parent_fk";
ALTER TABLE IF EXISTS ONLY "public"."_blog_posts_v_rels" DROP CONSTRAINT IF EXISTS "_blog_posts_v_rels_categories_fk";
ALTER TABLE IF EXISTS ONLY "public"."_blog_posts_v_rels" DROP CONSTRAINT IF EXISTS "_blog_posts_v_rels_blog_posts_fk";
ALTER TABLE IF EXISTS ONLY "public"."_blog_posts_v" DROP CONSTRAINT IF EXISTS "_blog_posts_v_parent_id_blog_posts_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_blog_posts_v_locales" DROP CONSTRAINT IF EXISTS "_blog_posts_v_locales_version_meta_image_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_blog_posts_v_locales" DROP CONSTRAINT IF EXISTS "_blog_posts_v_locales_version_hero_image_id_media_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_blog_posts_v_locales" DROP CONSTRAINT IF EXISTS "_blog_posts_v_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_blogBlock_v" DROP CONSTRAINT IF EXISTS "_blogBlock_v_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_blogBlock_v_locales" DROP CONSTRAINT IF EXISTS "_blogBlock_v_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_blogBlock_v" DROP CONSTRAINT IF EXISTS "_blogBlock_v_featured_post_id_blog_posts_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_archiveBlock_v" DROP CONSTRAINT IF EXISTS "_archiveBlock_v_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_archiveBlock_v_locales" DROP CONSTRAINT IF EXISTS "_archiveBlock_v_locales_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_archiveBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_archiveBlock_v_block_header_links_parent_id_fk";
ALTER TABLE IF EXISTS ONLY "public"."_archiveBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_archiveBlock_v_block_header_links_locales_parent_id_fk";
DROP INDEX IF EXISTS "public"."users_updated_at_idx";
DROP INDEX IF EXISTS "public"."users_email_idx";
DROP INDEX IF EXISTS "public"."users_created_at_idx";
DROP INDEX IF EXISTS "public"."testimonialsBlock_path_idx";
DROP INDEX IF EXISTS "public"."testimonialsBlock_parent_id_idx";
DROP INDEX IF EXISTS "public"."testimonialsBlock_order_idx";
DROP INDEX IF EXISTS "public"."testimonialsBlock_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."testimonialsBlock_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."testimonialsBlock_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."testimonialsBlock_block_header_links_locales_locale_parent_id_u";
DROP INDEX IF EXISTS "public"."settings_rels_path_idx";
DROP INDEX IF EXISTS "public"."settings_rels_parent_idx";
DROP INDEX IF EXISTS "public"."settings_rels_pages_id_idx";
DROP INDEX IF EXISTS "public"."settings_rels_order_idx";
DROP INDEX IF EXISTS "public"."settings_rels_blog_posts_id_idx";
DROP INDEX IF EXISTS "public"."settings_meta_meta_image_idx";
DROP INDEX IF EXISTS "public"."settings_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."search_updated_at_idx";
DROP INDEX IF EXISTS "public"."search_slug_idx";
DROP INDEX IF EXISTS "public"."search_rels_path_idx";
DROP INDEX IF EXISTS "public"."search_rels_parent_idx";
DROP INDEX IF EXISTS "public"."search_rels_order_idx";
DROP INDEX IF EXISTS "public"."search_rels_blog_posts_id_idx";
DROP INDEX IF EXISTS "public"."search_meta_meta_image_idx";
DROP INDEX IF EXISTS "public"."search_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."search_created_at_idx";
DROP INDEX IF EXISTS "public"."search_categories_parent_id_idx";
DROP INDEX IF EXISTS "public"."search_categories_order_idx";
DROP INDEX IF EXISTS "public"."richTextBlock_path_idx";
DROP INDEX IF EXISTS "public"."richTextBlock_parent_id_idx";
DROP INDEX IF EXISTS "public"."richTextBlock_order_idx";
DROP INDEX IF EXISTS "public"."richTextBlock_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."richTextBlock_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."richTextBlock_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."richTextBlock_block_header_links_locales_locale_parent_id_uniqu";
DROP INDEX IF EXISTS "public"."redirects_updated_at_idx";
DROP INDEX IF EXISTS "public"."redirects_rels_path_idx";
DROP INDEX IF EXISTS "public"."redirects_rels_parent_idx";
DROP INDEX IF EXISTS "public"."redirects_rels_pages_id_idx";
DROP INDEX IF EXISTS "public"."redirects_rels_order_idx";
DROP INDEX IF EXISTS "public"."redirects_rels_blog_posts_id_idx";
DROP INDEX IF EXISTS "public"."redirects_from_idx";
DROP INDEX IF EXISTS "public"."redirects_created_at_idx";
DROP INDEX IF EXISTS "public"."payload_preferences_updated_at_idx";
DROP INDEX IF EXISTS "public"."payload_preferences_rels_users_id_idx";
DROP INDEX IF EXISTS "public"."payload_preferences_rels_path_idx";
DROP INDEX IF EXISTS "public"."payload_preferences_rels_parent_idx";
DROP INDEX IF EXISTS "public"."payload_preferences_rels_order_idx";
DROP INDEX IF EXISTS "public"."payload_preferences_key_idx";
DROP INDEX IF EXISTS "public"."payload_preferences_created_at_idx";
DROP INDEX IF EXISTS "public"."payload_migrations_updated_at_idx";
DROP INDEX IF EXISTS "public"."payload_migrations_created_at_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_updated_at_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_rels_users_id_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_rels_search_id_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_rels_redirects_id_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_rels_payload_jobs_id_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_rels_payload_folders_id_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_rels_path_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_rels_parent_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_rels_pages_id_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_rels_order_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_rels_media_id_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_rels_forms_id_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_rels_form_submissions_id_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_rels_faq_id_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_rels_customers_id_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_rels_categories_id_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_rels_blog_posts_id_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_global_slug_idx";
DROP INDEX IF EXISTS "public"."payload_locked_documents_created_at_idx";
DROP INDEX IF EXISTS "public"."payload_jobs_wait_until_idx";
DROP INDEX IF EXISTS "public"."payload_jobs_updated_at_idx";
DROP INDEX IF EXISTS "public"."payload_jobs_total_tried_idx";
DROP INDEX IF EXISTS "public"."payload_jobs_task_slug_idx";
DROP INDEX IF EXISTS "public"."payload_jobs_queue_idx";
DROP INDEX IF EXISTS "public"."payload_jobs_processing_idx";
DROP INDEX IF EXISTS "public"."payload_jobs_log_parent_id_idx";
DROP INDEX IF EXISTS "public"."payload_jobs_log_order_idx";
DROP INDEX IF EXISTS "public"."payload_jobs_has_error_idx";
DROP INDEX IF EXISTS "public"."payload_jobs_created_at_idx";
DROP INDEX IF EXISTS "public"."payload_jobs_completed_at_idx";
DROP INDEX IF EXISTS "public"."payload_folders_updated_at_idx";
DROP INDEX IF EXISTS "public"."payload_folders_name_idx";
DROP INDEX IF EXISTS "public"."payload_folders_folder_idx";
DROP INDEX IF EXISTS "public"."payload_folders_created_at_idx";
DROP INDEX IF EXISTS "public"."pages_updated_at_idx";
DROP INDEX IF EXISTS "public"."pages_slug_idx";
DROP INDEX IF EXISTS "public"."pages_rels_path_idx";
DROP INDEX IF EXISTS "public"."pages_rels_parent_idx";
DROP INDEX IF EXISTS "public"."pages_rels_pages_id_idx";
DROP INDEX IF EXISTS "public"."pages_rels_order_idx";
DROP INDEX IF EXISTS "public"."pages_rels_media_id_idx";
DROP INDEX IF EXISTS "public"."pages_rels_locale_idx";
DROP INDEX IF EXISTS "public"."pages_rels_faq_id_idx";
DROP INDEX IF EXISTS "public"."pages_rels_customers_id_idx";
DROP INDEX IF EXISTS "public"."pages_rels_categories_id_idx";
DROP INDEX IF EXISTS "public"."pages_rels_blog_posts_id_idx";
DROP INDEX IF EXISTS "public"."pages_meta_meta_image_idx";
DROP INDEX IF EXISTS "public"."pages_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."pages_hero_media_mobile_hero_media_mobile_light_idx";
DROP INDEX IF EXISTS "public"."pages_hero_media_mobile_hero_media_mobile_dark_idx";
DROP INDEX IF EXISTS "public"."pages_hero_media_desktop_hero_media_desktop_light_idx";
DROP INDEX IF EXISTS "public"."pages_hero_media_desktop_hero_media_desktop_dark_idx";
DROP INDEX IF EXISTS "public"."pages_hero_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."pages_hero_links_order_idx";
DROP INDEX IF EXISTS "public"."pages_hero_links_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."pages_created_at_idx";
DROP INDEX IF EXISTS "public"."pages__status_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_table_rows_parent_id_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_table_rows_order_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_table_rows_locale_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_table_rows_children_parent_id_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_table_rows_children_order_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_table_rows_children_locale_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_table_rows_children_cells_parent_id_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_table_rows_children_cells_order_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_table_rows_children_cells_locale_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_table_rows_cells_parent_id_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_table_rows_cells_order_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_table_rows_cells_locale_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_table_headers_parent_id_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_table_headers_order_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_table_headers_locale_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_stats_parent_id_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_stats_order_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_stats_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."metricsBlock_path_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_parent_id_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_order_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."metricsBlock_block_image_block_image_media_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."metricsBlock_block_header_links_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."media_updated_at_idx";
DROP INDEX IF EXISTS "public"."media_sizes_xlarge_sizes_xlarge_filename_idx";
DROP INDEX IF EXISTS "public"."media_sizes_thumbnail_sizes_thumbnail_filename_idx";
DROP INDEX IF EXISTS "public"."media_sizes_square_sizes_square_filename_idx";
DROP INDEX IF EXISTS "public"."media_sizes_small_sizes_small_filename_idx";
DROP INDEX IF EXISTS "public"."media_sizes_og_sizes_og_filename_idx";
DROP INDEX IF EXISTS "public"."media_sizes_medium_sizes_medium_filename_idx";
DROP INDEX IF EXISTS "public"."media_sizes_large_sizes_large_filename_idx";
DROP INDEX IF EXISTS "public"."media_rels_path_idx";
DROP INDEX IF EXISTS "public"."media_rels_parent_idx";
DROP INDEX IF EXISTS "public"."media_rels_order_idx";
DROP INDEX IF EXISTS "public"."media_rels_categories_id_idx";
DROP INDEX IF EXISTS "public"."media_folder_idx";
DROP INDEX IF EXISTS "public"."media_filename_idx";
DROP INDEX IF EXISTS "public"."media_created_at_idx";
DROP INDEX IF EXISTS "public"."logosBlock_path_idx";
DROP INDEX IF EXISTS "public"."logosBlock_parent_id_idx";
DROP INDEX IF EXISTS "public"."logosBlock_order_idx";
DROP INDEX IF EXISTS "public"."logosBlock_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."logosBlock_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."logosBlock_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."logosBlock_block_header_links_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."header_tabs_parent_id_idx";
DROP INDEX IF EXISTS "public"."header_tabs_order_idx";
DROP INDEX IF EXISTS "public"."header_tabs_nav_items_parent_id_idx";
DROP INDEX IF EXISTS "public"."header_tabs_nav_items_order_idx";
DROP INDEX IF EXISTS "public"."header_tabs_nav_items_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."header_tabs_nav_items_list_links_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."header_tabs_nav_items_list_links_links_order_idx";
DROP INDEX IF EXISTS "public"."header_tabs_nav_items_list_links_links_locales_locale_parent_id";
DROP INDEX IF EXISTS "public"."header_tabs_nav_items_featured_link_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."header_tabs_nav_items_featured_link_links_order_idx";
DROP INDEX IF EXISTS "public"."header_tabs_nav_items_featured_link_links_locales_locale_parent";
DROP INDEX IF EXISTS "public"."header_tabs_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."header_tabs_description_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."header_tabs_description_links_order_idx";
DROP INDEX IF EXISTS "public"."header_tabs_description_links_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."header_rels_path_idx";
DROP INDEX IF EXISTS "public"."header_rels_parent_idx";
DROP INDEX IF EXISTS "public"."header_rels_pages_id_idx";
DROP INDEX IF EXISTS "public"."header_rels_order_idx";
DROP INDEX IF EXISTS "public"."header_rels_blog_posts_id_idx";
DROP INDEX IF EXISTS "public"."header_cta_parent_id_idx";
DROP INDEX IF EXISTS "public"."header_cta_order_idx";
DROP INDEX IF EXISTS "public"."header_cta_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."galleryBlock_path_idx";
DROP INDEX IF EXISTS "public"."galleryBlock_parent_id_idx";
DROP INDEX IF EXISTS "public"."galleryBlock_order_idx";
DROP INDEX IF EXISTS "public"."galleryBlock_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."galleryBlock_interactive_gallery_parent_id_idx";
DROP INDEX IF EXISTS "public"."galleryBlock_interactive_gallery_order_idx";
DROP INDEX IF EXISTS "public"."galleryBlock_interactive_gallery_locales_locale_parent_id_uniqu";
DROP INDEX IF EXISTS "public"."galleryBlock_interactive_gallery_image_idx";
DROP INDEX IF EXISTS "public"."galleryBlock_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."galleryBlock_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."galleryBlock_block_header_links_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."forms_updated_at_idx";
DROP INDEX IF EXISTS "public"."forms_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."forms_emails_parent_id_idx";
DROP INDEX IF EXISTS "public"."forms_emails_order_idx";
DROP INDEX IF EXISTS "public"."forms_emails_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."forms_created_at_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_textarea_path_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_textarea_parent_id_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_textarea_order_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_textarea_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."forms_blocks_text_path_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_text_parent_id_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_text_order_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_text_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."forms_blocks_state_path_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_state_parent_id_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_state_order_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_state_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."forms_blocks_select_path_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_select_parent_id_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_select_order_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_select_options_parent_id_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_select_options_order_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_select_options_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."forms_blocks_select_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."forms_blocks_number_path_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_number_parent_id_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_number_order_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_number_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."forms_blocks_message_path_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_message_parent_id_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_message_order_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_message_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."forms_blocks_email_path_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_email_parent_id_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_email_order_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_email_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."forms_blocks_country_path_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_country_parent_id_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_country_order_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_country_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."forms_blocks_checkbox_path_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_checkbox_parent_id_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_checkbox_order_idx";
DROP INDEX IF EXISTS "public"."forms_blocks_checkbox_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."form_submissions_updated_at_idx";
DROP INDEX IF EXISTS "public"."form_submissions_submission_data_parent_id_idx";
DROP INDEX IF EXISTS "public"."form_submissions_submission_data_order_idx";
DROP INDEX IF EXISTS "public"."form_submissions_form_idx";
DROP INDEX IF EXISTS "public"."form_submissions_created_at_idx";
DROP INDEX IF EXISTS "public"."formBlock_path_idx";
DROP INDEX IF EXISTS "public"."formBlock_parent_id_idx";
DROP INDEX IF EXISTS "public"."formBlock_order_idx";
DROP INDEX IF EXISTS "public"."formBlock_form_idx";
DROP INDEX IF EXISTS "public"."footer_rels_path_idx";
DROP INDEX IF EXISTS "public"."footer_rels_parent_idx";
DROP INDEX IF EXISTS "public"."footer_rels_pages_id_idx";
DROP INDEX IF EXISTS "public"."footer_rels_order_idx";
DROP INDEX IF EXISTS "public"."footer_rels_blog_posts_id_idx";
DROP INDEX IF EXISTS "public"."footer_columns_parent_id_idx";
DROP INDEX IF EXISTS "public"."footer_columns_order_idx";
DROP INDEX IF EXISTS "public"."footer_columns_nav_items_parent_id_idx";
DROP INDEX IF EXISTS "public"."footer_columns_nav_items_order_idx";
DROP INDEX IF EXISTS "public"."footer_columns_nav_items_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."featuresBlock_path_idx";
DROP INDEX IF EXISTS "public"."featuresBlock_parent_id_idx";
DROP INDEX IF EXISTS "public"."featuresBlock_order_idx";
DROP INDEX IF EXISTS "public"."featuresBlock_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."featuresBlock_columns_parent_id_idx";
DROP INDEX IF EXISTS "public"."featuresBlock_columns_order_idx";
DROP INDEX IF EXISTS "public"."featuresBlock_columns_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."featuresBlock_columns_image_idx";
DROP INDEX IF EXISTS "public"."featuresBlock_block_image_idx";
DROP INDEX IF EXISTS "public"."featuresBlock_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."featuresBlock_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."featuresBlock_block_header_links_locales_locale_parent_id_uniqu";
DROP INDEX IF EXISTS "public"."faq_updated_at_idx";
DROP INDEX IF EXISTS "public"."faq_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."faq_created_at_idx";
DROP INDEX IF EXISTS "public"."faq_category_idx";
DROP INDEX IF EXISTS "public"."faq__status_idx";
DROP INDEX IF EXISTS "public"."faqBlock_path_idx";
DROP INDEX IF EXISTS "public"."faqBlock_parent_id_idx";
DROP INDEX IF EXISTS "public"."faqBlock_order_idx";
DROP INDEX IF EXISTS "public"."faqBlock_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."faqBlock_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."faqBlock_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."faqBlock_block_header_links_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."dividerBlock_path_idx";
DROP INDEX IF EXISTS "public"."dividerBlock_parent_id_idx";
DROP INDEX IF EXISTS "public"."dividerBlock_order_idx";
DROP INDEX IF EXISTS "public"."customers_updated_at_idx";
DROP INDEX IF EXISTS "public"."customers_testimonial_testimonial_featured_image_idx";
DROP INDEX IF EXISTS "public"."customers_testimonial_stats_parent_id_idx";
DROP INDEX IF EXISTS "public"."customers_testimonial_stats_order_idx";
DROP INDEX IF EXISTS "public"."customers_testimonial_stats_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."customers_testimonial_company_testimonial_company_company_logo_";
DROP INDEX IF EXISTS "public"."customers_testimonial_author_info_testimonial_author_info_avata";
DROP INDEX IF EXISTS "public"."customers_slug_idx";
DROP INDEX IF EXISTS "public"."customers_rels_path_idx";
DROP INDEX IF EXISTS "public"."customers_rels_parent_idx";
DROP INDEX IF EXISTS "public"."customers_rels_pages_id_idx";
DROP INDEX IF EXISTS "public"."customers_rels_order_idx";
DROP INDEX IF EXISTS "public"."customers_rels_categories_id_idx";
DROP INDEX IF EXISTS "public"."customers_rels_blog_posts_id_idx";
DROP INDEX IF EXISTS "public"."customers_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."customers_created_at_idx";
DROP INDEX IF EXISTS "public"."customers__status_idx";
DROP INDEX IF EXISTS "public"."customHtmlBlock_path_idx";
DROP INDEX IF EXISTS "public"."customHtmlBlock_parent_id_idx";
DROP INDEX IF EXISTS "public"."customHtmlBlock_order_idx";
DROP INDEX IF EXISTS "public"."customHtmlBlock_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."customHtmlBlock_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."customHtmlBlock_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."customHtmlBlock_block_header_links_locales_locale_parent_id_uni";
DROP INDEX IF EXISTS "public"."categories_updated_at_idx";
DROP INDEX IF EXISTS "public"."categories_slug_idx";
DROP INDEX IF EXISTS "public"."categories_parent_idx";
DROP INDEX IF EXISTS "public"."categories_created_at_idx";
DROP INDEX IF EXISTS "public"."categories_breadcrumbs_parent_id_idx";
DROP INDEX IF EXISTS "public"."categories_breadcrumbs_order_idx";
DROP INDEX IF EXISTS "public"."categories_breadcrumbs_locale_idx";
DROP INDEX IF EXISTS "public"."categories_breadcrumbs_doc_idx";
DROP INDEX IF EXISTS "public"."callToActionBlock_path_idx";
DROP INDEX IF EXISTS "public"."callToActionBlock_parent_id_idx";
DROP INDEX IF EXISTS "public"."callToActionBlock_order_idx";
DROP INDEX IF EXISTS "public"."callToActionBlock_media_mobile_media_mobile_light_idx";
DROP INDEX IF EXISTS "public"."callToActionBlock_media_mobile_media_mobile_dark_idx";
DROP INDEX IF EXISTS "public"."callToActionBlock_media_desktop_media_desktop_light_idx";
DROP INDEX IF EXISTS "public"."callToActionBlock_media_desktop_media_desktop_dark_idx";
DROP INDEX IF EXISTS "public"."callToActionBlock_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."callToActionBlock_list_parent_id_idx";
DROP INDEX IF EXISTS "public"."callToActionBlock_list_order_idx";
DROP INDEX IF EXISTS "public"."callToActionBlock_list_locale_idx";
DROP INDEX IF EXISTS "public"."callToActionBlock_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."callToActionBlock_links_order_idx";
DROP INDEX IF EXISTS "public"."callToActionBlock_links_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."callToActionBlock_form_idx";
DROP INDEX IF EXISTS "public"."blog_posts_updated_at_idx";
DROP INDEX IF EXISTS "public"."blog_posts_slug_idx";
DROP INDEX IF EXISTS "public"."blog_posts_rels_users_id_idx";
DROP INDEX IF EXISTS "public"."blog_posts_rels_path_idx";
DROP INDEX IF EXISTS "public"."blog_posts_rels_parent_idx";
DROP INDEX IF EXISTS "public"."blog_posts_rels_order_idx";
DROP INDEX IF EXISTS "public"."blog_posts_rels_locale_idx";
DROP INDEX IF EXISTS "public"."blog_posts_rels_categories_id_idx";
DROP INDEX IF EXISTS "public"."blog_posts_rels_blog_posts_id_idx";
DROP INDEX IF EXISTS "public"."blog_posts_populated_authors_parent_id_idx";
DROP INDEX IF EXISTS "public"."blog_posts_populated_authors_order_idx";
DROP INDEX IF EXISTS "public"."blog_posts_meta_meta_image_idx";
DROP INDEX IF EXISTS "public"."blog_posts_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."blog_posts_hero_image_idx";
DROP INDEX IF EXISTS "public"."blog_posts_created_at_idx";
DROP INDEX IF EXISTS "public"."blog_posts__status_idx";
DROP INDEX IF EXISTS "public"."blogBlock_path_idx";
DROP INDEX IF EXISTS "public"."blogBlock_parent_id_idx";
DROP INDEX IF EXISTS "public"."blogBlock_order_idx";
DROP INDEX IF EXISTS "public"."blogBlock_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."blogBlock_featured_post_idx";
DROP INDEX IF EXISTS "public"."archiveBlock_path_idx";
DROP INDEX IF EXISTS "public"."archiveBlock_parent_id_idx";
DROP INDEX IF EXISTS "public"."archiveBlock_order_idx";
DROP INDEX IF EXISTS "public"."archiveBlock_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."archiveBlock_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."archiveBlock_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."archiveBlock_block_header_links_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_testimonialsBlock_v_path_idx";
DROP INDEX IF EXISTS "public"."_testimonialsBlock_v_parent_id_idx";
DROP INDEX IF EXISTS "public"."_testimonialsBlock_v_order_idx";
DROP INDEX IF EXISTS "public"."_testimonialsBlock_v_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_testimonialsBlock_v_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."_testimonialsBlock_v_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."_testimonialsBlock_v_block_header_links_locales_locale_parent_i";
DROP INDEX IF EXISTS "public"."_richTextBlock_v_path_idx";
DROP INDEX IF EXISTS "public"."_richTextBlock_v_parent_id_idx";
DROP INDEX IF EXISTS "public"."_richTextBlock_v_order_idx";
DROP INDEX IF EXISTS "public"."_richTextBlock_v_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_richTextBlock_v_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."_richTextBlock_v_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."_richTextBlock_v_block_header_links_locales_locale_parent_id_un";
DROP INDEX IF EXISTS "public"."_pages_v_version_version_updated_at_idx";
DROP INDEX IF EXISTS "public"."_pages_v_version_version_slug_idx";
DROP INDEX IF EXISTS "public"."_pages_v_version_version_created_at_idx";
DROP INDEX IF EXISTS "public"."_pages_v_version_version__status_idx";
DROP INDEX IF EXISTS "public"."_pages_v_version_meta_version_meta_image_idx";
DROP INDEX IF EXISTS "public"."_pages_v_version_hero_media_mobile_version_hero_media_mobile_li";
DROP INDEX IF EXISTS "public"."_pages_v_version_hero_media_mobile_version_hero_media_mobile_da";
DROP INDEX IF EXISTS "public"."_pages_v_version_hero_media_desktop_version_hero_media_desktop_";
DROP INDEX IF EXISTS "public"."_pages_v_version_hero_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."_pages_v_version_hero_links_order_idx";
DROP INDEX IF EXISTS "public"."_pages_v_version_hero_links_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_pages_v_updated_at_idx";
DROP INDEX IF EXISTS "public"."_pages_v_snapshot_idx";
DROP INDEX IF EXISTS "public"."_pages_v_rels_path_idx";
DROP INDEX IF EXISTS "public"."_pages_v_rels_parent_idx";
DROP INDEX IF EXISTS "public"."_pages_v_rels_pages_id_idx";
DROP INDEX IF EXISTS "public"."_pages_v_rels_order_idx";
DROP INDEX IF EXISTS "public"."_pages_v_rels_media_id_idx";
DROP INDEX IF EXISTS "public"."_pages_v_rels_locale_idx";
DROP INDEX IF EXISTS "public"."_pages_v_rels_faq_id_idx";
DROP INDEX IF EXISTS "public"."_pages_v_rels_customers_id_idx";
DROP INDEX IF EXISTS "public"."_pages_v_rels_categories_id_idx";
DROP INDEX IF EXISTS "public"."_pages_v_rels_blog_posts_id_idx";
DROP INDEX IF EXISTS "public"."_pages_v_published_locale_idx";
DROP INDEX IF EXISTS "public"."_pages_v_parent_idx";
DROP INDEX IF EXISTS "public"."_pages_v_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_pages_v_latest_idx";
DROP INDEX IF EXISTS "public"."_pages_v_created_at_idx";
DROP INDEX IF EXISTS "public"."_pages_v_autosave_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_table_rows_parent_id_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_table_rows_order_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_table_rows_locale_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_table_rows_children_parent_id_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_table_rows_children_order_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_table_rows_children_locale_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_table_rows_children_cells_parent_id_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_table_rows_children_cells_order_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_table_rows_children_cells_locale_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_table_rows_cells_parent_id_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_table_rows_cells_order_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_table_rows_cells_locale_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_table_headers_parent_id_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_table_headers_order_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_table_headers_locale_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_stats_parent_id_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_stats_order_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_stats_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_path_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_parent_id_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_order_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_block_image_block_image_media_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."_metricsBlock_v_block_header_links_locales_locale_parent_id_uni";
DROP INDEX IF EXISTS "public"."_logosBlock_v_path_idx";
DROP INDEX IF EXISTS "public"."_logosBlock_v_parent_id_idx";
DROP INDEX IF EXISTS "public"."_logosBlock_v_order_idx";
DROP INDEX IF EXISTS "public"."_logosBlock_v_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_logosBlock_v_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."_logosBlock_v_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."_logosBlock_v_block_header_links_locales_locale_parent_id_uniqu";
DROP INDEX IF EXISTS "public"."_galleryBlock_v_path_idx";
DROP INDEX IF EXISTS "public"."_galleryBlock_v_parent_id_idx";
DROP INDEX IF EXISTS "public"."_galleryBlock_v_order_idx";
DROP INDEX IF EXISTS "public"."_galleryBlock_v_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_galleryBlock_v_interactive_gallery_parent_id_idx";
DROP INDEX IF EXISTS "public"."_galleryBlock_v_interactive_gallery_order_idx";
DROP INDEX IF EXISTS "public"."_galleryBlock_v_interactive_gallery_locales_locale_parent_id_un";
DROP INDEX IF EXISTS "public"."_galleryBlock_v_interactive_gallery_image_idx";
DROP INDEX IF EXISTS "public"."_galleryBlock_v_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."_galleryBlock_v_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."_galleryBlock_v_block_header_links_locales_locale_parent_id_uni";
DROP INDEX IF EXISTS "public"."_formBlock_v_path_idx";
DROP INDEX IF EXISTS "public"."_formBlock_v_parent_id_idx";
DROP INDEX IF EXISTS "public"."_formBlock_v_order_idx";
DROP INDEX IF EXISTS "public"."_formBlock_v_form_idx";
DROP INDEX IF EXISTS "public"."_featuresBlock_v_path_idx";
DROP INDEX IF EXISTS "public"."_featuresBlock_v_parent_id_idx";
DROP INDEX IF EXISTS "public"."_featuresBlock_v_order_idx";
DROP INDEX IF EXISTS "public"."_featuresBlock_v_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_featuresBlock_v_columns_parent_id_idx";
DROP INDEX IF EXISTS "public"."_featuresBlock_v_columns_order_idx";
DROP INDEX IF EXISTS "public"."_featuresBlock_v_columns_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_featuresBlock_v_columns_image_idx";
DROP INDEX IF EXISTS "public"."_featuresBlock_v_block_image_idx";
DROP INDEX IF EXISTS "public"."_featuresBlock_v_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."_featuresBlock_v_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."_featuresBlock_v_block_header_links_locales_locale_parent_id_un";
DROP INDEX IF EXISTS "public"."_faq_v_version_version_updated_at_idx";
DROP INDEX IF EXISTS "public"."_faq_v_version_version_created_at_idx";
DROP INDEX IF EXISTS "public"."_faq_v_version_version_category_idx";
DROP INDEX IF EXISTS "public"."_faq_v_version_version__status_idx";
DROP INDEX IF EXISTS "public"."_faq_v_updated_at_idx";
DROP INDEX IF EXISTS "public"."_faq_v_snapshot_idx";
DROP INDEX IF EXISTS "public"."_faq_v_published_locale_idx";
DROP INDEX IF EXISTS "public"."_faq_v_parent_idx";
DROP INDEX IF EXISTS "public"."_faq_v_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_faq_v_latest_idx";
DROP INDEX IF EXISTS "public"."_faq_v_created_at_idx";
DROP INDEX IF EXISTS "public"."_faq_v_autosave_idx";
DROP INDEX IF EXISTS "public"."_faqBlock_v_path_idx";
DROP INDEX IF EXISTS "public"."_faqBlock_v_parent_id_idx";
DROP INDEX IF EXISTS "public"."_faqBlock_v_order_idx";
DROP INDEX IF EXISTS "public"."_faqBlock_v_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_faqBlock_v_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."_faqBlock_v_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."_faqBlock_v_block_header_links_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_dividerBlock_v_path_idx";
DROP INDEX IF EXISTS "public"."_dividerBlock_v_parent_id_idx";
DROP INDEX IF EXISTS "public"."_dividerBlock_v_order_idx";
DROP INDEX IF EXISTS "public"."_customers_v_version_version_updated_at_idx";
DROP INDEX IF EXISTS "public"."_customers_v_version_version_slug_idx";
DROP INDEX IF EXISTS "public"."_customers_v_version_version_created_at_idx";
DROP INDEX IF EXISTS "public"."_customers_v_version_version__status_idx";
DROP INDEX IF EXISTS "public"."_customers_v_version_testimonial_version_testimonial_featured_i";
DROP INDEX IF EXISTS "public"."_customers_v_version_testimonial_stats_parent_id_idx";
DROP INDEX IF EXISTS "public"."_customers_v_version_testimonial_stats_order_idx";
DROP INDEX IF EXISTS "public"."_customers_v_version_testimonial_stats_locales_locale_parent_id";
DROP INDEX IF EXISTS "public"."_customers_v_version_testimonial_company_version_testimonial_co";
DROP INDEX IF EXISTS "public"."_customers_v_version_testimonial_author_info_version_testimonia";
DROP INDEX IF EXISTS "public"."_customers_v_updated_at_idx";
DROP INDEX IF EXISTS "public"."_customers_v_snapshot_idx";
DROP INDEX IF EXISTS "public"."_customers_v_rels_path_idx";
DROP INDEX IF EXISTS "public"."_customers_v_rels_parent_idx";
DROP INDEX IF EXISTS "public"."_customers_v_rels_pages_id_idx";
DROP INDEX IF EXISTS "public"."_customers_v_rels_order_idx";
DROP INDEX IF EXISTS "public"."_customers_v_rels_categories_id_idx";
DROP INDEX IF EXISTS "public"."_customers_v_rels_blog_posts_id_idx";
DROP INDEX IF EXISTS "public"."_customers_v_published_locale_idx";
DROP INDEX IF EXISTS "public"."_customers_v_parent_idx";
DROP INDEX IF EXISTS "public"."_customers_v_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_customers_v_latest_idx";
DROP INDEX IF EXISTS "public"."_customers_v_created_at_idx";
DROP INDEX IF EXISTS "public"."_customers_v_autosave_idx";
DROP INDEX IF EXISTS "public"."_customHtmlBlock_v_path_idx";
DROP INDEX IF EXISTS "public"."_customHtmlBlock_v_parent_id_idx";
DROP INDEX IF EXISTS "public"."_customHtmlBlock_v_order_idx";
DROP INDEX IF EXISTS "public"."_customHtmlBlock_v_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_customHtmlBlock_v_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."_customHtmlBlock_v_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."_customHtmlBlock_v_block_header_links_locales_locale_parent_id_";
DROP INDEX IF EXISTS "public"."_callToActionBlock_v_path_idx";
DROP INDEX IF EXISTS "public"."_callToActionBlock_v_parent_id_idx";
DROP INDEX IF EXISTS "public"."_callToActionBlock_v_order_idx";
DROP INDEX IF EXISTS "public"."_callToActionBlock_v_media_mobile_media_mobile_light_idx";
DROP INDEX IF EXISTS "public"."_callToActionBlock_v_media_mobile_media_mobile_dark_idx";
DROP INDEX IF EXISTS "public"."_callToActionBlock_v_media_desktop_media_desktop_light_idx";
DROP INDEX IF EXISTS "public"."_callToActionBlock_v_media_desktop_media_desktop_dark_idx";
DROP INDEX IF EXISTS "public"."_callToActionBlock_v_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_callToActionBlock_v_list_parent_id_idx";
DROP INDEX IF EXISTS "public"."_callToActionBlock_v_list_order_idx";
DROP INDEX IF EXISTS "public"."_callToActionBlock_v_list_locale_idx";
DROP INDEX IF EXISTS "public"."_callToActionBlock_v_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."_callToActionBlock_v_links_order_idx";
DROP INDEX IF EXISTS "public"."_callToActionBlock_v_links_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_callToActionBlock_v_form_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_version_version_updated_at_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_version_version_slug_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_version_version_hero_image_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_version_version_created_at_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_version_version__status_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_version_populated_authors_parent_id_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_version_populated_authors_order_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_version_meta_version_meta_image_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_updated_at_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_snapshot_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_rels_users_id_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_rels_path_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_rels_parent_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_rels_order_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_rels_locale_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_rels_categories_id_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_rels_blog_posts_id_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_published_locale_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_parent_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_blog_posts_v_latest_idx";
DROP INDEX IF EXISTS "public"."_blog_posts_v_created_at_idx";
DROP INDEX IF EXISTS "public"."_blogBlock_v_path_idx";
DROP INDEX IF EXISTS "public"."_blogBlock_v_parent_id_idx";
DROP INDEX IF EXISTS "public"."_blogBlock_v_order_idx";
DROP INDEX IF EXISTS "public"."_blogBlock_v_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_blogBlock_v_featured_post_idx";
DROP INDEX IF EXISTS "public"."_archiveBlock_v_path_idx";
DROP INDEX IF EXISTS "public"."_archiveBlock_v_parent_id_idx";
DROP INDEX IF EXISTS "public"."_archiveBlock_v_order_idx";
DROP INDEX IF EXISTS "public"."_archiveBlock_v_locales_locale_parent_id_unique";
DROP INDEX IF EXISTS "public"."_archiveBlock_v_block_header_links_parent_id_idx";
DROP INDEX IF EXISTS "public"."_archiveBlock_v_block_header_links_order_idx";
DROP INDEX IF EXISTS "public"."_archiveBlock_v_block_header_links_locales_locale_parent_id_uni";
ALTER TABLE IF EXISTS ONLY "public"."users" DROP CONSTRAINT IF EXISTS "users_pkey";
ALTER TABLE IF EXISTS ONLY "public"."testimonialsBlock" DROP CONSTRAINT IF EXISTS "testimonialsBlock_pkey";
ALTER TABLE IF EXISTS ONLY "public"."testimonialsBlock_locales" DROP CONSTRAINT IF EXISTS "testimonialsBlock_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."testimonialsBlock_block_header_links" DROP CONSTRAINT IF EXISTS "testimonialsBlock_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."testimonialsBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "testimonialsBlock_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."settings_rels" DROP CONSTRAINT IF EXISTS "settings_rels_pkey";
ALTER TABLE IF EXISTS ONLY "public"."settings" DROP CONSTRAINT IF EXISTS "settings_pkey";
ALTER TABLE IF EXISTS ONLY "public"."settings_locales" DROP CONSTRAINT IF EXISTS "settings_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."search_rels" DROP CONSTRAINT IF EXISTS "search_rels_pkey";
ALTER TABLE IF EXISTS ONLY "public"."search" DROP CONSTRAINT IF EXISTS "search_pkey";
ALTER TABLE IF EXISTS ONLY "public"."search_locales" DROP CONSTRAINT IF EXISTS "search_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."search_categories" DROP CONSTRAINT IF EXISTS "search_categories_pkey";
ALTER TABLE IF EXISTS ONLY "public"."richTextBlock" DROP CONSTRAINT IF EXISTS "richTextBlock_pkey";
ALTER TABLE IF EXISTS ONLY "public"."richTextBlock_locales" DROP CONSTRAINT IF EXISTS "richTextBlock_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."richTextBlock_block_header_links" DROP CONSTRAINT IF EXISTS "richTextBlock_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."richTextBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "richTextBlock_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."redirects_rels" DROP CONSTRAINT IF EXISTS "redirects_rels_pkey";
ALTER TABLE IF EXISTS ONLY "public"."redirects" DROP CONSTRAINT IF EXISTS "redirects_pkey";
ALTER TABLE IF EXISTS ONLY "public"."payload_preferences_rels" DROP CONSTRAINT IF EXISTS "payload_preferences_rels_pkey";
ALTER TABLE IF EXISTS ONLY "public"."payload_preferences" DROP CONSTRAINT IF EXISTS "payload_preferences_pkey";
ALTER TABLE IF EXISTS ONLY "public"."payload_migrations" DROP CONSTRAINT IF EXISTS "payload_migrations_pkey";
ALTER TABLE IF EXISTS ONLY "public"."payload_locked_documents_rels" DROP CONSTRAINT IF EXISTS "payload_locked_documents_rels_pkey";
ALTER TABLE IF EXISTS ONLY "public"."payload_locked_documents" DROP CONSTRAINT IF EXISTS "payload_locked_documents_pkey";
ALTER TABLE IF EXISTS ONLY "public"."payload_jobs" DROP CONSTRAINT IF EXISTS "payload_jobs_pkey";
ALTER TABLE IF EXISTS ONLY "public"."payload_jobs_log" DROP CONSTRAINT IF EXISTS "payload_jobs_log_pkey";
ALTER TABLE IF EXISTS ONLY "public"."payload_folders" DROP CONSTRAINT IF EXISTS "payload_folders_pkey";
ALTER TABLE IF EXISTS ONLY "public"."pages_rels" DROP CONSTRAINT IF EXISTS "pages_rels_pkey";
ALTER TABLE IF EXISTS ONLY "public"."pages" DROP CONSTRAINT IF EXISTS "pages_pkey";
ALTER TABLE IF EXISTS ONLY "public"."pages_locales" DROP CONSTRAINT IF EXISTS "pages_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."pages_hero_links" DROP CONSTRAINT IF EXISTS "pages_hero_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."pages_hero_links_locales" DROP CONSTRAINT IF EXISTS "pages_hero_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_table_rows" DROP CONSTRAINT IF EXISTS "metricsBlock_table_rows_pkey";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_table_rows_children" DROP CONSTRAINT IF EXISTS "metricsBlock_table_rows_children_pkey";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_table_rows_children_cells" DROP CONSTRAINT IF EXISTS "metricsBlock_table_rows_children_cells_pkey";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_table_rows_cells" DROP CONSTRAINT IF EXISTS "metricsBlock_table_rows_cells_pkey";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_table_headers" DROP CONSTRAINT IF EXISTS "metricsBlock_table_headers_pkey";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_stats" DROP CONSTRAINT IF EXISTS "metricsBlock_stats_pkey";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_stats_locales" DROP CONSTRAINT IF EXISTS "metricsBlock_stats_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock" DROP CONSTRAINT IF EXISTS "metricsBlock_pkey";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_locales" DROP CONSTRAINT IF EXISTS "metricsBlock_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_block_header_links" DROP CONSTRAINT IF EXISTS "metricsBlock_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."metricsBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "metricsBlock_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."media_rels" DROP CONSTRAINT IF EXISTS "media_rels_pkey";
ALTER TABLE IF EXISTS ONLY "public"."media" DROP CONSTRAINT IF EXISTS "media_pkey";
ALTER TABLE IF EXISTS ONLY "public"."logosBlock" DROP CONSTRAINT IF EXISTS "logosBlock_pkey";
ALTER TABLE IF EXISTS ONLY "public"."logosBlock_locales" DROP CONSTRAINT IF EXISTS "logosBlock_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."logosBlock_block_header_links" DROP CONSTRAINT IF EXISTS "logosBlock_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."logosBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "logosBlock_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs" DROP CONSTRAINT IF EXISTS "header_tabs_pkey";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_nav_items" DROP CONSTRAINT IF EXISTS "header_tabs_nav_items_pkey";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_nav_items_locales" DROP CONSTRAINT IF EXISTS "header_tabs_nav_items_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_nav_items_list_links_links" DROP CONSTRAINT IF EXISTS "header_tabs_nav_items_list_links_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_nav_items_list_links_links_locales" DROP CONSTRAINT IF EXISTS "header_tabs_nav_items_list_links_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_nav_items_featured_link_links" DROP CONSTRAINT IF EXISTS "header_tabs_nav_items_featured_link_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_nav_items_featured_link_links_locales" DROP CONSTRAINT IF EXISTS "header_tabs_nav_items_featured_link_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_locales" DROP CONSTRAINT IF EXISTS "header_tabs_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_description_links" DROP CONSTRAINT IF EXISTS "header_tabs_description_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."header_tabs_description_links_locales" DROP CONSTRAINT IF EXISTS "header_tabs_description_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."header_rels" DROP CONSTRAINT IF EXISTS "header_rels_pkey";
ALTER TABLE IF EXISTS ONLY "public"."header" DROP CONSTRAINT IF EXISTS "header_pkey";
ALTER TABLE IF EXISTS ONLY "public"."header_cta" DROP CONSTRAINT IF EXISTS "header_cta_pkey";
ALTER TABLE IF EXISTS ONLY "public"."header_cta_locales" DROP CONSTRAINT IF EXISTS "header_cta_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."galleryBlock" DROP CONSTRAINT IF EXISTS "galleryBlock_pkey";
ALTER TABLE IF EXISTS ONLY "public"."galleryBlock_locales" DROP CONSTRAINT IF EXISTS "galleryBlock_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."galleryBlock_interactive_gallery" DROP CONSTRAINT IF EXISTS "galleryBlock_interactive_gallery_pkey";
ALTER TABLE IF EXISTS ONLY "public"."galleryBlock_interactive_gallery_locales" DROP CONSTRAINT IF EXISTS "galleryBlock_interactive_gallery_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."galleryBlock_block_header_links" DROP CONSTRAINT IF EXISTS "galleryBlock_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."galleryBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "galleryBlock_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms" DROP CONSTRAINT IF EXISTS "forms_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_locales" DROP CONSTRAINT IF EXISTS "forms_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_emails" DROP CONSTRAINT IF EXISTS "forms_emails_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_emails_locales" DROP CONSTRAINT IF EXISTS "forms_emails_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_textarea" DROP CONSTRAINT IF EXISTS "forms_blocks_textarea_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_textarea_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_textarea_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_text" DROP CONSTRAINT IF EXISTS "forms_blocks_text_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_text_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_text_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_state" DROP CONSTRAINT IF EXISTS "forms_blocks_state_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_state_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_state_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_select" DROP CONSTRAINT IF EXISTS "forms_blocks_select_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_select_options" DROP CONSTRAINT IF EXISTS "forms_blocks_select_options_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_select_options_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_select_options_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_select_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_select_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_number" DROP CONSTRAINT IF EXISTS "forms_blocks_number_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_number_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_number_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_message" DROP CONSTRAINT IF EXISTS "forms_blocks_message_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_message_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_message_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_email" DROP CONSTRAINT IF EXISTS "forms_blocks_email_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_email_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_email_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_country" DROP CONSTRAINT IF EXISTS "forms_blocks_country_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_country_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_country_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_checkbox" DROP CONSTRAINT IF EXISTS "forms_blocks_checkbox_pkey";
ALTER TABLE IF EXISTS ONLY "public"."forms_blocks_checkbox_locales" DROP CONSTRAINT IF EXISTS "forms_blocks_checkbox_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."form_submissions_submission_data" DROP CONSTRAINT IF EXISTS "form_submissions_submission_data_pkey";
ALTER TABLE IF EXISTS ONLY "public"."form_submissions" DROP CONSTRAINT IF EXISTS "form_submissions_pkey";
ALTER TABLE IF EXISTS ONLY "public"."formBlock" DROP CONSTRAINT IF EXISTS "formBlock_pkey";
ALTER TABLE IF EXISTS ONLY "public"."footer_rels" DROP CONSTRAINT IF EXISTS "footer_rels_pkey";
ALTER TABLE IF EXISTS ONLY "public"."footer" DROP CONSTRAINT IF EXISTS "footer_pkey";
ALTER TABLE IF EXISTS ONLY "public"."footer_columns" DROP CONSTRAINT IF EXISTS "footer_columns_pkey";
ALTER TABLE IF EXISTS ONLY "public"."footer_columns_nav_items" DROP CONSTRAINT IF EXISTS "footer_columns_nav_items_pkey";
ALTER TABLE IF EXISTS ONLY "public"."footer_columns_nav_items_locales" DROP CONSTRAINT IF EXISTS "footer_columns_nav_items_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."featuresBlock" DROP CONSTRAINT IF EXISTS "featuresBlock_pkey";
ALTER TABLE IF EXISTS ONLY "public"."featuresBlock_locales" DROP CONSTRAINT IF EXISTS "featuresBlock_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."featuresBlock_columns" DROP CONSTRAINT IF EXISTS "featuresBlock_columns_pkey";
ALTER TABLE IF EXISTS ONLY "public"."featuresBlock_columns_locales" DROP CONSTRAINT IF EXISTS "featuresBlock_columns_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."featuresBlock_block_header_links" DROP CONSTRAINT IF EXISTS "featuresBlock_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."featuresBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "featuresBlock_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."faq" DROP CONSTRAINT IF EXISTS "faq_pkey";
ALTER TABLE IF EXISTS ONLY "public"."faq_locales" DROP CONSTRAINT IF EXISTS "faq_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."faqBlock" DROP CONSTRAINT IF EXISTS "faqBlock_pkey";
ALTER TABLE IF EXISTS ONLY "public"."faqBlock_locales" DROP CONSTRAINT IF EXISTS "faqBlock_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."faqBlock_block_header_links" DROP CONSTRAINT IF EXISTS "faqBlock_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."faqBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "faqBlock_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."dividerBlock" DROP CONSTRAINT IF EXISTS "dividerBlock_pkey";
ALTER TABLE IF EXISTS ONLY "public"."customers_testimonial_stats" DROP CONSTRAINT IF EXISTS "customers_testimonial_stats_pkey";
ALTER TABLE IF EXISTS ONLY "public"."customers_testimonial_stats_locales" DROP CONSTRAINT IF EXISTS "customers_testimonial_stats_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."customers_rels" DROP CONSTRAINT IF EXISTS "customers_rels_pkey";
ALTER TABLE IF EXISTS ONLY "public"."customers" DROP CONSTRAINT IF EXISTS "customers_pkey";
ALTER TABLE IF EXISTS ONLY "public"."customers_locales" DROP CONSTRAINT IF EXISTS "customers_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."customHtmlBlock" DROP CONSTRAINT IF EXISTS "customHtmlBlock_pkey";
ALTER TABLE IF EXISTS ONLY "public"."customHtmlBlock_locales" DROP CONSTRAINT IF EXISTS "customHtmlBlock_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."customHtmlBlock_block_header_links" DROP CONSTRAINT IF EXISTS "customHtmlBlock_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."customHtmlBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "customHtmlBlock_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."categories" DROP CONSTRAINT IF EXISTS "categories_pkey";
ALTER TABLE IF EXISTS ONLY "public"."categories_breadcrumbs" DROP CONSTRAINT IF EXISTS "categories_breadcrumbs_pkey";
ALTER TABLE IF EXISTS ONLY "public"."callToActionBlock" DROP CONSTRAINT IF EXISTS "callToActionBlock_pkey";
ALTER TABLE IF EXISTS ONLY "public"."callToActionBlock_locales" DROP CONSTRAINT IF EXISTS "callToActionBlock_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."callToActionBlock_list" DROP CONSTRAINT IF EXISTS "callToActionBlock_list_pkey";
ALTER TABLE IF EXISTS ONLY "public"."callToActionBlock_links" DROP CONSTRAINT IF EXISTS "callToActionBlock_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."callToActionBlock_links_locales" DROP CONSTRAINT IF EXISTS "callToActionBlock_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."blog_posts_rels" DROP CONSTRAINT IF EXISTS "blog_posts_rels_pkey";
ALTER TABLE IF EXISTS ONLY "public"."blog_posts_populated_authors" DROP CONSTRAINT IF EXISTS "blog_posts_populated_authors_pkey";
ALTER TABLE IF EXISTS ONLY "public"."blog_posts" DROP CONSTRAINT IF EXISTS "blog_posts_pkey";
ALTER TABLE IF EXISTS ONLY "public"."blog_posts_locales" DROP CONSTRAINT IF EXISTS "blog_posts_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."blogBlock" DROP CONSTRAINT IF EXISTS "blogBlock_pkey";
ALTER TABLE IF EXISTS ONLY "public"."blogBlock_locales" DROP CONSTRAINT IF EXISTS "blogBlock_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."archiveBlock" DROP CONSTRAINT IF EXISTS "archiveBlock_pkey";
ALTER TABLE IF EXISTS ONLY "public"."archiveBlock_locales" DROP CONSTRAINT IF EXISTS "archiveBlock_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."archiveBlock_block_header_links" DROP CONSTRAINT IF EXISTS "archiveBlock_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."archiveBlock_block_header_links_locales" DROP CONSTRAINT IF EXISTS "archiveBlock_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_testimonialsBlock_v" DROP CONSTRAINT IF EXISTS "_testimonialsBlock_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_testimonialsBlock_v_locales" DROP CONSTRAINT IF EXISTS "_testimonialsBlock_v_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_testimonialsBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_testimonialsBlock_v_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_testimonialsBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_testimonialsBlock_v_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_richTextBlock_v" DROP CONSTRAINT IF EXISTS "_richTextBlock_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_richTextBlock_v_locales" DROP CONSTRAINT IF EXISTS "_richTextBlock_v_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_richTextBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_richTextBlock_v_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_richTextBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_richTextBlock_v_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_version_hero_links" DROP CONSTRAINT IF EXISTS "_pages_v_version_hero_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_version_hero_links_locales" DROP CONSTRAINT IF EXISTS "_pages_v_version_hero_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_rels" DROP CONSTRAINT IF EXISTS "_pages_v_rels_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v" DROP CONSTRAINT IF EXISTS "_pages_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_pages_v_locales" DROP CONSTRAINT IF EXISTS "_pages_v_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_table_rows" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_table_rows_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_table_rows_children" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_table_rows_children_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_table_rows_children_cells" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_table_rows_children_cells_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_table_rows_cells" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_table_rows_cells_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_table_headers" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_table_headers_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_stats" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_stats_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_stats_locales" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_stats_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_locales" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_metricsBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_metricsBlock_v_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_logosBlock_v" DROP CONSTRAINT IF EXISTS "_logosBlock_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_logosBlock_v_locales" DROP CONSTRAINT IF EXISTS "_logosBlock_v_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_logosBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_logosBlock_v_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_logosBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_logosBlock_v_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_galleryBlock_v" DROP CONSTRAINT IF EXISTS "_galleryBlock_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_galleryBlock_v_locales" DROP CONSTRAINT IF EXISTS "_galleryBlock_v_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_galleryBlock_v_interactive_gallery" DROP CONSTRAINT IF EXISTS "_galleryBlock_v_interactive_gallery_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_galleryBlock_v_interactive_gallery_locales" DROP CONSTRAINT IF EXISTS "_galleryBlock_v_interactive_gallery_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_galleryBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_galleryBlock_v_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_galleryBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_galleryBlock_v_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_formBlock_v" DROP CONSTRAINT IF EXISTS "_formBlock_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_featuresBlock_v" DROP CONSTRAINT IF EXISTS "_featuresBlock_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_featuresBlock_v_locales" DROP CONSTRAINT IF EXISTS "_featuresBlock_v_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_featuresBlock_v_columns" DROP CONSTRAINT IF EXISTS "_featuresBlock_v_columns_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_featuresBlock_v_columns_locales" DROP CONSTRAINT IF EXISTS "_featuresBlock_v_columns_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_featuresBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_featuresBlock_v_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_featuresBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_featuresBlock_v_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_faq_v" DROP CONSTRAINT IF EXISTS "_faq_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_faq_v_locales" DROP CONSTRAINT IF EXISTS "_faq_v_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_faqBlock_v" DROP CONSTRAINT IF EXISTS "_faqBlock_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_faqBlock_v_locales" DROP CONSTRAINT IF EXISTS "_faqBlock_v_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_faqBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_faqBlock_v_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_faqBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_faqBlock_v_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_dividerBlock_v" DROP CONSTRAINT IF EXISTS "_dividerBlock_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_customers_v_version_testimonial_stats" DROP CONSTRAINT IF EXISTS "_customers_v_version_testimonial_stats_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_customers_v_version_testimonial_stats_locales" DROP CONSTRAINT IF EXISTS "_customers_v_version_testimonial_stats_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_customers_v_rels" DROP CONSTRAINT IF EXISTS "_customers_v_rels_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_customers_v" DROP CONSTRAINT IF EXISTS "_customers_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_customers_v_locales" DROP CONSTRAINT IF EXISTS "_customers_v_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_customHtmlBlock_v" DROP CONSTRAINT IF EXISTS "_customHtmlBlock_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_customHtmlBlock_v_locales" DROP CONSTRAINT IF EXISTS "_customHtmlBlock_v_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_customHtmlBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_customHtmlBlock_v_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_customHtmlBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_customHtmlBlock_v_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_callToActionBlock_v" DROP CONSTRAINT IF EXISTS "_callToActionBlock_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_callToActionBlock_v_locales" DROP CONSTRAINT IF EXISTS "_callToActionBlock_v_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_callToActionBlock_v_list" DROP CONSTRAINT IF EXISTS "_callToActionBlock_v_list_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_callToActionBlock_v_links" DROP CONSTRAINT IF EXISTS "_callToActionBlock_v_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_callToActionBlock_v_links_locales" DROP CONSTRAINT IF EXISTS "_callToActionBlock_v_links_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_blog_posts_v_version_populated_authors" DROP CONSTRAINT IF EXISTS "_blog_posts_v_version_populated_authors_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_blog_posts_v_rels" DROP CONSTRAINT IF EXISTS "_blog_posts_v_rels_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_blog_posts_v" DROP CONSTRAINT IF EXISTS "_blog_posts_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_blog_posts_v_locales" DROP CONSTRAINT IF EXISTS "_blog_posts_v_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_blogBlock_v" DROP CONSTRAINT IF EXISTS "_blogBlock_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_blogBlock_v_locales" DROP CONSTRAINT IF EXISTS "_blogBlock_v_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_archiveBlock_v" DROP CONSTRAINT IF EXISTS "_archiveBlock_v_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_archiveBlock_v_locales" DROP CONSTRAINT IF EXISTS "_archiveBlock_v_locales_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_archiveBlock_v_block_header_links" DROP CONSTRAINT IF EXISTS "_archiveBlock_v_block_header_links_pkey";
ALTER TABLE IF EXISTS ONLY "public"."_archiveBlock_v_block_header_links_locales" DROP CONSTRAINT IF EXISTS "_archiveBlock_v_block_header_links_locales_pkey";
ALTER TABLE IF EXISTS "public"."testimonialsBlock_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."testimonialsBlock_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."settings_rels" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."settings_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."search_rels" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."search_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."richTextBlock_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."richTextBlock_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."redirects_rels" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."payload_preferences_rels" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."payload_locked_documents_rels" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."pages_rels" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."pages_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."pages_hero_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."metricsBlock_stats_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."metricsBlock_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."metricsBlock_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."media_rels" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."logosBlock_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."logosBlock_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."header_tabs_nav_items_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."header_tabs_nav_items_list_links_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."header_tabs_nav_items_featured_link_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."header_tabs_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."header_tabs_description_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."header_rels" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."header_cta_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."galleryBlock_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."galleryBlock_interactive_gallery_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."galleryBlock_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."forms_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."forms_emails_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."forms_blocks_textarea_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."forms_blocks_text_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."forms_blocks_state_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."forms_blocks_select_options_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."forms_blocks_select_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."forms_blocks_number_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."forms_blocks_message_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."forms_blocks_email_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."forms_blocks_country_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."forms_blocks_checkbox_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."footer_rels" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."footer_columns_nav_items_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."featuresBlock_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."featuresBlock_columns_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."featuresBlock_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."faq_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."faqBlock_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."faqBlock_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."customers_testimonial_stats_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."customers_rels" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."customers_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."customHtmlBlock_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."customHtmlBlock_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."callToActionBlock_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."callToActionBlock_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."blog_posts_rels" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."blog_posts_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."blogBlock_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."archiveBlock_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."archiveBlock_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_testimonialsBlock_v_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_testimonialsBlock_v_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_richTextBlock_v_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_richTextBlock_v_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_pages_v_version_hero_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_pages_v_rels" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_pages_v_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_metricsBlock_v_stats_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_metricsBlock_v_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_metricsBlock_v_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_logosBlock_v_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_logosBlock_v_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_galleryBlock_v_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_galleryBlock_v_interactive_gallery_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_galleryBlock_v_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_featuresBlock_v_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_featuresBlock_v_columns_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_featuresBlock_v_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_faq_v_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_faqBlock_v_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_faqBlock_v_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_customers_v_version_testimonial_stats_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_customers_v_rels" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_customers_v_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_customHtmlBlock_v_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_customHtmlBlock_v_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_callToActionBlock_v_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_callToActionBlock_v_links_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_blog_posts_v_rels" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_blog_posts_v_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_blogBlock_v_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_archiveBlock_v_locales" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."_archiveBlock_v_block_header_links_locales" ALTER COLUMN "id" DROP DEFAULT;
DROP TABLE IF EXISTS "public"."users";
DROP SEQUENCE IF EXISTS "public"."testimonialsBlock_locales_id_seq";
DROP TABLE IF EXISTS "public"."testimonialsBlock_locales";
DROP SEQUENCE IF EXISTS "public"."testimonialsBlock_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."testimonialsBlock_block_header_links_locales";
DROP TABLE IF EXISTS "public"."testimonialsBlock_block_header_links";
DROP TABLE IF EXISTS "public"."testimonialsBlock";
DROP SEQUENCE IF EXISTS "public"."settings_rels_id_seq";
DROP TABLE IF EXISTS "public"."settings_rels";
DROP SEQUENCE IF EXISTS "public"."settings_locales_id_seq";
DROP TABLE IF EXISTS "public"."settings_locales";
DROP TABLE IF EXISTS "public"."settings";
DROP SEQUENCE IF EXISTS "public"."search_rels_id_seq";
DROP TABLE IF EXISTS "public"."search_rels";
DROP SEQUENCE IF EXISTS "public"."search_locales_id_seq";
DROP TABLE IF EXISTS "public"."search_locales";
DROP TABLE IF EXISTS "public"."search_categories";
DROP TABLE IF EXISTS "public"."search";
DROP SEQUENCE IF EXISTS "public"."richTextBlock_locales_id_seq";
DROP TABLE IF EXISTS "public"."richTextBlock_locales";
DROP SEQUENCE IF EXISTS "public"."richTextBlock_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."richTextBlock_block_header_links_locales";
DROP TABLE IF EXISTS "public"."richTextBlock_block_header_links";
DROP TABLE IF EXISTS "public"."richTextBlock";
DROP SEQUENCE IF EXISTS "public"."redirects_rels_id_seq";
DROP TABLE IF EXISTS "public"."redirects_rels";
DROP TABLE IF EXISTS "public"."redirects";
DROP SEQUENCE IF EXISTS "public"."payload_preferences_rels_id_seq";
DROP TABLE IF EXISTS "public"."payload_preferences_rels";
DROP TABLE IF EXISTS "public"."payload_preferences";
DROP TABLE IF EXISTS "public"."payload_migrations";
DROP SEQUENCE IF EXISTS "public"."payload_locked_documents_rels_id_seq";
DROP TABLE IF EXISTS "public"."payload_locked_documents_rels";
DROP TABLE IF EXISTS "public"."payload_locked_documents";
DROP TABLE IF EXISTS "public"."payload_jobs_log";
DROP TABLE IF EXISTS "public"."payload_jobs";
DROP TABLE IF EXISTS "public"."payload_folders";
DROP SEQUENCE IF EXISTS "public"."pages_rels_id_seq";
DROP TABLE IF EXISTS "public"."pages_rels";
DROP SEQUENCE IF EXISTS "public"."pages_locales_id_seq";
DROP TABLE IF EXISTS "public"."pages_locales";
DROP SEQUENCE IF EXISTS "public"."pages_hero_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."pages_hero_links_locales";
DROP TABLE IF EXISTS "public"."pages_hero_links";
DROP TABLE IF EXISTS "public"."pages";
DROP TABLE IF EXISTS "public"."metricsBlock_table_rows_children_cells";
DROP TABLE IF EXISTS "public"."metricsBlock_table_rows_children";
DROP TABLE IF EXISTS "public"."metricsBlock_table_rows_cells";
DROP TABLE IF EXISTS "public"."metricsBlock_table_rows";
DROP TABLE IF EXISTS "public"."metricsBlock_table_headers";
DROP SEQUENCE IF EXISTS "public"."metricsBlock_stats_locales_id_seq";
DROP TABLE IF EXISTS "public"."metricsBlock_stats_locales";
DROP TABLE IF EXISTS "public"."metricsBlock_stats";
DROP SEQUENCE IF EXISTS "public"."metricsBlock_locales_id_seq";
DROP TABLE IF EXISTS "public"."metricsBlock_locales";
DROP SEQUENCE IF EXISTS "public"."metricsBlock_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."metricsBlock_block_header_links_locales";
DROP TABLE IF EXISTS "public"."metricsBlock_block_header_links";
DROP TABLE IF EXISTS "public"."metricsBlock";
DROP SEQUENCE IF EXISTS "public"."media_rels_id_seq";
DROP TABLE IF EXISTS "public"."media_rels";
DROP TABLE IF EXISTS "public"."media";
DROP SEQUENCE IF EXISTS "public"."logosBlock_locales_id_seq";
DROP TABLE IF EXISTS "public"."logosBlock_locales";
DROP SEQUENCE IF EXISTS "public"."logosBlock_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."logosBlock_block_header_links_locales";
DROP TABLE IF EXISTS "public"."logosBlock_block_header_links";
DROP TABLE IF EXISTS "public"."logosBlock";
DROP SEQUENCE IF EXISTS "public"."header_tabs_nav_items_locales_id_seq";
DROP TABLE IF EXISTS "public"."header_tabs_nav_items_locales";
DROP SEQUENCE IF EXISTS "public"."header_tabs_nav_items_list_links_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."header_tabs_nav_items_list_links_links_locales";
DROP TABLE IF EXISTS "public"."header_tabs_nav_items_list_links_links";
DROP SEQUENCE IF EXISTS "public"."header_tabs_nav_items_featured_link_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."header_tabs_nav_items_featured_link_links_locales";
DROP TABLE IF EXISTS "public"."header_tabs_nav_items_featured_link_links";
DROP TABLE IF EXISTS "public"."header_tabs_nav_items";
DROP SEQUENCE IF EXISTS "public"."header_tabs_locales_id_seq";
DROP TABLE IF EXISTS "public"."header_tabs_locales";
DROP SEQUENCE IF EXISTS "public"."header_tabs_description_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."header_tabs_description_links_locales";
DROP TABLE IF EXISTS "public"."header_tabs_description_links";
DROP TABLE IF EXISTS "public"."header_tabs";
DROP SEQUENCE IF EXISTS "public"."header_rels_id_seq";
DROP TABLE IF EXISTS "public"."header_rels";
DROP SEQUENCE IF EXISTS "public"."header_cta_locales_id_seq";
DROP TABLE IF EXISTS "public"."header_cta_locales";
DROP TABLE IF EXISTS "public"."header_cta";
DROP TABLE IF EXISTS "public"."header";
DROP SEQUENCE IF EXISTS "public"."galleryBlock_locales_id_seq";
DROP TABLE IF EXISTS "public"."galleryBlock_locales";
DROP SEQUENCE IF EXISTS "public"."galleryBlock_interactive_gallery_locales_id_seq";
DROP TABLE IF EXISTS "public"."galleryBlock_interactive_gallery_locales";
DROP TABLE IF EXISTS "public"."galleryBlock_interactive_gallery";
DROP SEQUENCE IF EXISTS "public"."galleryBlock_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."galleryBlock_block_header_links_locales";
DROP TABLE IF EXISTS "public"."galleryBlock_block_header_links";
DROP TABLE IF EXISTS "public"."galleryBlock";
DROP SEQUENCE IF EXISTS "public"."forms_locales_id_seq";
DROP TABLE IF EXISTS "public"."forms_locales";
DROP SEQUENCE IF EXISTS "public"."forms_emails_locales_id_seq";
DROP TABLE IF EXISTS "public"."forms_emails_locales";
DROP TABLE IF EXISTS "public"."forms_emails";
DROP SEQUENCE IF EXISTS "public"."forms_blocks_textarea_locales_id_seq";
DROP TABLE IF EXISTS "public"."forms_blocks_textarea_locales";
DROP TABLE IF EXISTS "public"."forms_blocks_textarea";
DROP SEQUENCE IF EXISTS "public"."forms_blocks_text_locales_id_seq";
DROP TABLE IF EXISTS "public"."forms_blocks_text_locales";
DROP TABLE IF EXISTS "public"."forms_blocks_text";
DROP SEQUENCE IF EXISTS "public"."forms_blocks_state_locales_id_seq";
DROP TABLE IF EXISTS "public"."forms_blocks_state_locales";
DROP TABLE IF EXISTS "public"."forms_blocks_state";
DROP SEQUENCE IF EXISTS "public"."forms_blocks_select_options_locales_id_seq";
DROP TABLE IF EXISTS "public"."forms_blocks_select_options_locales";
DROP TABLE IF EXISTS "public"."forms_blocks_select_options";
DROP SEQUENCE IF EXISTS "public"."forms_blocks_select_locales_id_seq";
DROP TABLE IF EXISTS "public"."forms_blocks_select_locales";
DROP TABLE IF EXISTS "public"."forms_blocks_select";
DROP SEQUENCE IF EXISTS "public"."forms_blocks_number_locales_id_seq";
DROP TABLE IF EXISTS "public"."forms_blocks_number_locales";
DROP TABLE IF EXISTS "public"."forms_blocks_number";
DROP SEQUENCE IF EXISTS "public"."forms_blocks_message_locales_id_seq";
DROP TABLE IF EXISTS "public"."forms_blocks_message_locales";
DROP TABLE IF EXISTS "public"."forms_blocks_message";
DROP SEQUENCE IF EXISTS "public"."forms_blocks_email_locales_id_seq";
DROP TABLE IF EXISTS "public"."forms_blocks_email_locales";
DROP TABLE IF EXISTS "public"."forms_blocks_email";
DROP SEQUENCE IF EXISTS "public"."forms_blocks_country_locales_id_seq";
DROP TABLE IF EXISTS "public"."forms_blocks_country_locales";
DROP TABLE IF EXISTS "public"."forms_blocks_country";
DROP SEQUENCE IF EXISTS "public"."forms_blocks_checkbox_locales_id_seq";
DROP TABLE IF EXISTS "public"."forms_blocks_checkbox_locales";
DROP TABLE IF EXISTS "public"."forms_blocks_checkbox";
DROP TABLE IF EXISTS "public"."forms";
DROP TABLE IF EXISTS "public"."form_submissions_submission_data";
DROP TABLE IF EXISTS "public"."form_submissions";
DROP TABLE IF EXISTS "public"."formBlock";
DROP SEQUENCE IF EXISTS "public"."footer_rels_id_seq";
DROP TABLE IF EXISTS "public"."footer_rels";
DROP SEQUENCE IF EXISTS "public"."footer_columns_nav_items_locales_id_seq";
DROP TABLE IF EXISTS "public"."footer_columns_nav_items_locales";
DROP TABLE IF EXISTS "public"."footer_columns_nav_items";
DROP TABLE IF EXISTS "public"."footer_columns";
DROP TABLE IF EXISTS "public"."footer";
DROP SEQUENCE IF EXISTS "public"."featuresBlock_locales_id_seq";
DROP TABLE IF EXISTS "public"."featuresBlock_locales";
DROP SEQUENCE IF EXISTS "public"."featuresBlock_columns_locales_id_seq";
DROP TABLE IF EXISTS "public"."featuresBlock_columns_locales";
DROP TABLE IF EXISTS "public"."featuresBlock_columns";
DROP SEQUENCE IF EXISTS "public"."featuresBlock_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."featuresBlock_block_header_links_locales";
DROP TABLE IF EXISTS "public"."featuresBlock_block_header_links";
DROP TABLE IF EXISTS "public"."featuresBlock";
DROP SEQUENCE IF EXISTS "public"."faq_locales_id_seq";
DROP TABLE IF EXISTS "public"."faq_locales";
DROP SEQUENCE IF EXISTS "public"."faqBlock_locales_id_seq";
DROP TABLE IF EXISTS "public"."faqBlock_locales";
DROP SEQUENCE IF EXISTS "public"."faqBlock_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."faqBlock_block_header_links_locales";
DROP TABLE IF EXISTS "public"."faqBlock_block_header_links";
DROP TABLE IF EXISTS "public"."faqBlock";
DROP TABLE IF EXISTS "public"."faq";
DROP TABLE IF EXISTS "public"."dividerBlock";
DROP SEQUENCE IF EXISTS "public"."customers_testimonial_stats_locales_id_seq";
DROP TABLE IF EXISTS "public"."customers_testimonial_stats_locales";
DROP TABLE IF EXISTS "public"."customers_testimonial_stats";
DROP SEQUENCE IF EXISTS "public"."customers_rels_id_seq";
DROP TABLE IF EXISTS "public"."customers_rels";
DROP SEQUENCE IF EXISTS "public"."customers_locales_id_seq";
DROP TABLE IF EXISTS "public"."customers_locales";
DROP TABLE IF EXISTS "public"."customers";
DROP SEQUENCE IF EXISTS "public"."customHtmlBlock_locales_id_seq";
DROP TABLE IF EXISTS "public"."customHtmlBlock_locales";
DROP SEQUENCE IF EXISTS "public"."customHtmlBlock_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."customHtmlBlock_block_header_links_locales";
DROP TABLE IF EXISTS "public"."customHtmlBlock_block_header_links";
DROP TABLE IF EXISTS "public"."customHtmlBlock";
DROP TABLE IF EXISTS "public"."categories_breadcrumbs";
DROP TABLE IF EXISTS "public"."categories";
DROP SEQUENCE IF EXISTS "public"."callToActionBlock_locales_id_seq";
DROP TABLE IF EXISTS "public"."callToActionBlock_locales";
DROP TABLE IF EXISTS "public"."callToActionBlock_list";
DROP SEQUENCE IF EXISTS "public"."callToActionBlock_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."callToActionBlock_links_locales";
DROP TABLE IF EXISTS "public"."callToActionBlock_links";
DROP TABLE IF EXISTS "public"."callToActionBlock";
DROP SEQUENCE IF EXISTS "public"."blog_posts_rels_id_seq";
DROP TABLE IF EXISTS "public"."blog_posts_rels";
DROP TABLE IF EXISTS "public"."blog_posts_populated_authors";
DROP SEQUENCE IF EXISTS "public"."blog_posts_locales_id_seq";
DROP TABLE IF EXISTS "public"."blog_posts_locales";
DROP TABLE IF EXISTS "public"."blog_posts";
DROP SEQUENCE IF EXISTS "public"."blogBlock_locales_id_seq";
DROP TABLE IF EXISTS "public"."blogBlock_locales";
DROP TABLE IF EXISTS "public"."blogBlock";
DROP SEQUENCE IF EXISTS "public"."archiveBlock_locales_id_seq";
DROP TABLE IF EXISTS "public"."archiveBlock_locales";
DROP SEQUENCE IF EXISTS "public"."archiveBlock_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."archiveBlock_block_header_links_locales";
DROP TABLE IF EXISTS "public"."archiveBlock_block_header_links";
DROP TABLE IF EXISTS "public"."archiveBlock";
DROP SEQUENCE IF EXISTS "public"."_testimonialsBlock_v_locales_id_seq";
DROP TABLE IF EXISTS "public"."_testimonialsBlock_v_locales";
DROP SEQUENCE IF EXISTS "public"."_testimonialsBlock_v_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."_testimonialsBlock_v_block_header_links_locales";
DROP TABLE IF EXISTS "public"."_testimonialsBlock_v_block_header_links";
DROP TABLE IF EXISTS "public"."_testimonialsBlock_v";
DROP SEQUENCE IF EXISTS "public"."_richTextBlock_v_locales_id_seq";
DROP TABLE IF EXISTS "public"."_richTextBlock_v_locales";
DROP SEQUENCE IF EXISTS "public"."_richTextBlock_v_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."_richTextBlock_v_block_header_links_locales";
DROP TABLE IF EXISTS "public"."_richTextBlock_v_block_header_links";
DROP TABLE IF EXISTS "public"."_richTextBlock_v";
DROP SEQUENCE IF EXISTS "public"."_pages_v_version_hero_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."_pages_v_version_hero_links_locales";
DROP TABLE IF EXISTS "public"."_pages_v_version_hero_links";
DROP SEQUENCE IF EXISTS "public"."_pages_v_rels_id_seq";
DROP TABLE IF EXISTS "public"."_pages_v_rels";
DROP SEQUENCE IF EXISTS "public"."_pages_v_locales_id_seq";
DROP TABLE IF EXISTS "public"."_pages_v_locales";
DROP TABLE IF EXISTS "public"."_pages_v";
DROP TABLE IF EXISTS "public"."_metricsBlock_v_table_rows_children_cells";
DROP TABLE IF EXISTS "public"."_metricsBlock_v_table_rows_children";
DROP TABLE IF EXISTS "public"."_metricsBlock_v_table_rows_cells";
DROP TABLE IF EXISTS "public"."_metricsBlock_v_table_rows";
DROP TABLE IF EXISTS "public"."_metricsBlock_v_table_headers";
DROP SEQUENCE IF EXISTS "public"."_metricsBlock_v_stats_locales_id_seq";
DROP TABLE IF EXISTS "public"."_metricsBlock_v_stats_locales";
DROP TABLE IF EXISTS "public"."_metricsBlock_v_stats";
DROP SEQUENCE IF EXISTS "public"."_metricsBlock_v_locales_id_seq";
DROP TABLE IF EXISTS "public"."_metricsBlock_v_locales";
DROP SEQUENCE IF EXISTS "public"."_metricsBlock_v_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."_metricsBlock_v_block_header_links_locales";
DROP TABLE IF EXISTS "public"."_metricsBlock_v_block_header_links";
DROP TABLE IF EXISTS "public"."_metricsBlock_v";
DROP SEQUENCE IF EXISTS "public"."_logosBlock_v_locales_id_seq";
DROP TABLE IF EXISTS "public"."_logosBlock_v_locales";
DROP SEQUENCE IF EXISTS "public"."_logosBlock_v_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."_logosBlock_v_block_header_links_locales";
DROP TABLE IF EXISTS "public"."_logosBlock_v_block_header_links";
DROP TABLE IF EXISTS "public"."_logosBlock_v";
DROP SEQUENCE IF EXISTS "public"."_galleryBlock_v_locales_id_seq";
DROP TABLE IF EXISTS "public"."_galleryBlock_v_locales";
DROP SEQUENCE IF EXISTS "public"."_galleryBlock_v_interactive_gallery_locales_id_seq";
DROP TABLE IF EXISTS "public"."_galleryBlock_v_interactive_gallery_locales";
DROP TABLE IF EXISTS "public"."_galleryBlock_v_interactive_gallery";
DROP SEQUENCE IF EXISTS "public"."_galleryBlock_v_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."_galleryBlock_v_block_header_links_locales";
DROP TABLE IF EXISTS "public"."_galleryBlock_v_block_header_links";
DROP TABLE IF EXISTS "public"."_galleryBlock_v";
DROP TABLE IF EXISTS "public"."_formBlock_v";
DROP SEQUENCE IF EXISTS "public"."_featuresBlock_v_locales_id_seq";
DROP TABLE IF EXISTS "public"."_featuresBlock_v_locales";
DROP SEQUENCE IF EXISTS "public"."_featuresBlock_v_columns_locales_id_seq";
DROP TABLE IF EXISTS "public"."_featuresBlock_v_columns_locales";
DROP TABLE IF EXISTS "public"."_featuresBlock_v_columns";
DROP SEQUENCE IF EXISTS "public"."_featuresBlock_v_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."_featuresBlock_v_block_header_links_locales";
DROP TABLE IF EXISTS "public"."_featuresBlock_v_block_header_links";
DROP TABLE IF EXISTS "public"."_featuresBlock_v";
DROP SEQUENCE IF EXISTS "public"."_faq_v_locales_id_seq";
DROP TABLE IF EXISTS "public"."_faq_v_locales";
DROP TABLE IF EXISTS "public"."_faq_v";
DROP SEQUENCE IF EXISTS "public"."_faqBlock_v_locales_id_seq";
DROP TABLE IF EXISTS "public"."_faqBlock_v_locales";
DROP SEQUENCE IF EXISTS "public"."_faqBlock_v_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."_faqBlock_v_block_header_links_locales";
DROP TABLE IF EXISTS "public"."_faqBlock_v_block_header_links";
DROP TABLE IF EXISTS "public"."_faqBlock_v";
DROP TABLE IF EXISTS "public"."_dividerBlock_v";
DROP SEQUENCE IF EXISTS "public"."_customers_v_version_testimonial_stats_locales_id_seq";
DROP TABLE IF EXISTS "public"."_customers_v_version_testimonial_stats_locales";
DROP TABLE IF EXISTS "public"."_customers_v_version_testimonial_stats";
DROP SEQUENCE IF EXISTS "public"."_customers_v_rels_id_seq";
DROP TABLE IF EXISTS "public"."_customers_v_rels";
DROP SEQUENCE IF EXISTS "public"."_customers_v_locales_id_seq";
DROP TABLE IF EXISTS "public"."_customers_v_locales";
DROP TABLE IF EXISTS "public"."_customers_v";
DROP SEQUENCE IF EXISTS "public"."_customHtmlBlock_v_locales_id_seq";
DROP TABLE IF EXISTS "public"."_customHtmlBlock_v_locales";
DROP SEQUENCE IF EXISTS "public"."_customHtmlBlock_v_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."_customHtmlBlock_v_block_header_links_locales";
DROP TABLE IF EXISTS "public"."_customHtmlBlock_v_block_header_links";
DROP TABLE IF EXISTS "public"."_customHtmlBlock_v";
DROP SEQUENCE IF EXISTS "public"."_callToActionBlock_v_locales_id_seq";
DROP TABLE IF EXISTS "public"."_callToActionBlock_v_locales";
DROP TABLE IF EXISTS "public"."_callToActionBlock_v_list";
DROP SEQUENCE IF EXISTS "public"."_callToActionBlock_v_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."_callToActionBlock_v_links_locales";
DROP TABLE IF EXISTS "public"."_callToActionBlock_v_links";
DROP TABLE IF EXISTS "public"."_callToActionBlock_v";
DROP TABLE IF EXISTS "public"."_blog_posts_v_version_populated_authors";
DROP SEQUENCE IF EXISTS "public"."_blog_posts_v_rels_id_seq";
DROP TABLE IF EXISTS "public"."_blog_posts_v_rels";
DROP SEQUENCE IF EXISTS "public"."_blog_posts_v_locales_id_seq";
DROP TABLE IF EXISTS "public"."_blog_posts_v_locales";
DROP TABLE IF EXISTS "public"."_blog_posts_v";
DROP SEQUENCE IF EXISTS "public"."_blogBlock_v_locales_id_seq";
DROP TABLE IF EXISTS "public"."_blogBlock_v_locales";
DROP TABLE IF EXISTS "public"."_blogBlock_v";
DROP SEQUENCE IF EXISTS "public"."_archiveBlock_v_locales_id_seq";
DROP TABLE IF EXISTS "public"."_archiveBlock_v_locales";
DROP SEQUENCE IF EXISTS "public"."_archiveBlock_v_block_header_links_locales_id_seq";
DROP TABLE IF EXISTS "public"."_archiveBlock_v_block_header_links_locales";
DROP TABLE IF EXISTS "public"."_archiveBlock_v_block_header_links";
DROP TABLE IF EXISTS "public"."_archiveBlock_v";
DROP TYPE IF EXISTS "public"."link_variant";
DROP TYPE IF EXISTS "public"."link_type";
DROP TYPE IF EXISTS "public"."link_color";
DROP TYPE IF EXISTS "public"."enum_testimonialsBlock_type";
DROP TYPE IF EXISTS "public"."enum_testimonialsBlock_block_header_type";
DROP TYPE IF EXISTS "public"."enum_testimonialsBlock_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum_testimonialsBlock_bg_color";
DROP TYPE IF EXISTS "public"."enum_richTextBlock_type";
DROP TYPE IF EXISTS "public"."enum_richTextBlock_max_width";
DROP TYPE IF EXISTS "public"."enum_richTextBlock_block_header_type";
DROP TYPE IF EXISTS "public"."enum_richTextBlock_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum_redirects_to_type";
DROP TYPE IF EXISTS "public"."enum_payload_jobs_task_slug";
DROP TYPE IF EXISTS "public"."enum_payload_jobs_log_task_slug";
DROP TYPE IF EXISTS "public"."enum_payload_jobs_log_state";
DROP TYPE IF EXISTS "public"."enum_pages_status";
DROP TYPE IF EXISTS "public"."enum_pages_hero_type";
DROP TYPE IF EXISTS "public"."enum_pages_hero_badge_type";
DROP TYPE IF EXISTS "public"."enum_metricsBlock_type";
DROP TYPE IF EXISTS "public"."enum_metricsBlock_table_headers_width";
DROP TYPE IF EXISTS "public"."enum_metricsBlock_stats_indicator";
DROP TYPE IF EXISTS "public"."enum_metricsBlock_block_header_type";
DROP TYPE IF EXISTS "public"."enum_metricsBlock_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum_media_locale";
DROP TYPE IF EXISTS "public"."enum_logosBlock_type";
DROP TYPE IF EXISTS "public"."enum_logosBlock_block_header_type";
DROP TYPE IF EXISTS "public"."enum_logosBlock_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum_header_tabs_nav_items_style";
DROP TYPE IF EXISTS "public"."enum_galleryBlock_type";
DROP TYPE IF EXISTS "public"."enum_galleryBlock_block_header_type";
DROP TYPE IF EXISTS "public"."enum_galleryBlock_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum_forms_confirmation_type";
DROP TYPE IF EXISTS "public"."enum_featuresBlock_type";
DROP TYPE IF EXISTS "public"."enum_featuresBlock_stat_indicator";
DROP TYPE IF EXISTS "public"."enum_featuresBlock_columns_stat_indicator";
DROP TYPE IF EXISTS "public"."enum_featuresBlock_columns_size";
DROP TYPE IF EXISTS "public"."enum_featuresBlock_columns_badge_type";
DROP TYPE IF EXISTS "public"."enum_featuresBlock_block_header_type";
DROP TYPE IF EXISTS "public"."enum_featuresBlock_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum_faq_status";
DROP TYPE IF EXISTS "public"."enum_faqBlock_type";
DROP TYPE IF EXISTS "public"."enum_faqBlock_block_header_type";
DROP TYPE IF EXISTS "public"."enum_faqBlock_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum_dividerBlock_size";
DROP TYPE IF EXISTS "public"."enum_customers_testimonial_stats_indicator";
DROP TYPE IF EXISTS "public"."enum_customers_testimonial_company_industry";
DROP TYPE IF EXISTS "public"."enum_customers_status";
DROP TYPE IF EXISTS "public"."enum_customHtmlBlock_block_header_type";
DROP TYPE IF EXISTS "public"."enum_customHtmlBlock_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum_callToActionBlock_type";
DROP TYPE IF EXISTS "public"."enum_callToActionBlock_badge_type";
DROP TYPE IF EXISTS "public"."enum_blog_posts_status";
DROP TYPE IF EXISTS "public"."enum_blogBlock_type";
DROP TYPE IF EXISTS "public"."enum_archiveBlock_relation_to";
DROP TYPE IF EXISTS "public"."enum_archiveBlock_populate_by";
DROP TYPE IF EXISTS "public"."enum_archiveBlock_block_header_type";
DROP TYPE IF EXISTS "public"."enum_archiveBlock_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum__testimonialsBlock_v_type";
DROP TYPE IF EXISTS "public"."enum__testimonialsBlock_v_block_header_type";
DROP TYPE IF EXISTS "public"."enum__testimonialsBlock_v_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum__testimonialsBlock_v_bg_color";
DROP TYPE IF EXISTS "public"."enum__richTextBlock_v_type";
DROP TYPE IF EXISTS "public"."enum__richTextBlock_v_max_width";
DROP TYPE IF EXISTS "public"."enum__richTextBlock_v_block_header_type";
DROP TYPE IF EXISTS "public"."enum__richTextBlock_v_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum__pages_v_version_status";
DROP TYPE IF EXISTS "public"."enum__pages_v_version_hero_type";
DROP TYPE IF EXISTS "public"."enum__pages_v_version_hero_badge_type";
DROP TYPE IF EXISTS "public"."enum__pages_v_published_locale";
DROP TYPE IF EXISTS "public"."enum__metricsBlock_v_type";
DROP TYPE IF EXISTS "public"."enum__metricsBlock_v_table_headers_width";
DROP TYPE IF EXISTS "public"."enum__metricsBlock_v_stats_indicator";
DROP TYPE IF EXISTS "public"."enum__metricsBlock_v_block_header_type";
DROP TYPE IF EXISTS "public"."enum__metricsBlock_v_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum__logosBlock_v_type";
DROP TYPE IF EXISTS "public"."enum__logosBlock_v_block_header_type";
DROP TYPE IF EXISTS "public"."enum__logosBlock_v_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum__galleryBlock_v_type";
DROP TYPE IF EXISTS "public"."enum__galleryBlock_v_block_header_type";
DROP TYPE IF EXISTS "public"."enum__galleryBlock_v_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum__featuresBlock_v_type";
DROP TYPE IF EXISTS "public"."enum__featuresBlock_v_stat_indicator";
DROP TYPE IF EXISTS "public"."enum__featuresBlock_v_columns_stat_indicator";
DROP TYPE IF EXISTS "public"."enum__featuresBlock_v_columns_size";
DROP TYPE IF EXISTS "public"."enum__featuresBlock_v_columns_badge_type";
DROP TYPE IF EXISTS "public"."enum__featuresBlock_v_block_header_type";
DROP TYPE IF EXISTS "public"."enum__featuresBlock_v_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum__faq_v_version_status";
DROP TYPE IF EXISTS "public"."enum__faq_v_published_locale";
DROP TYPE IF EXISTS "public"."enum__faqBlock_v_type";
DROP TYPE IF EXISTS "public"."enum__faqBlock_v_block_header_type";
DROP TYPE IF EXISTS "public"."enum__faqBlock_v_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum__dividerBlock_v_size";
DROP TYPE IF EXISTS "public"."enum__customers_v_version_testimonial_stats_indicator";
DROP TYPE IF EXISTS "public"."enum__customers_v_version_testimonial_company_industry";
DROP TYPE IF EXISTS "public"."enum__customers_v_version_status";
DROP TYPE IF EXISTS "public"."enum__customers_v_published_locale";
DROP TYPE IF EXISTS "public"."enum__customHtmlBlock_v_block_header_type";
DROP TYPE IF EXISTS "public"."enum__customHtmlBlock_v_block_header_badge_type";
DROP TYPE IF EXISTS "public"."enum__callToActionBlock_v_type";
DROP TYPE IF EXISTS "public"."enum__callToActionBlock_v_badge_type";
DROP TYPE IF EXISTS "public"."enum__blog_posts_v_version_status";
DROP TYPE IF EXISTS "public"."enum__blog_posts_v_published_locale";
DROP TYPE IF EXISTS "public"."enum__blogBlock_v_type";
DROP TYPE IF EXISTS "public"."enum__archiveBlock_v_relation_to";
DROP TYPE IF EXISTS "public"."enum__archiveBlock_v_populate_by";
DROP TYPE IF EXISTS "public"."enum__archiveBlock_v_block_header_type";
DROP TYPE IF EXISTS "public"."enum__archiveBlock_v_block_header_badge_type";
DROP TYPE IF EXISTS "public"."badge_icon_position";
DROP TYPE IF EXISTS "public"."badge_color";
DROP TYPE IF EXISTS "public"."_locales";
--
-- Name: _locales; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."_locales" AS ENUM (
    'en',
    'ar'
);


--
-- Name: badge_color; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."badge_color" AS ENUM (
    'blue',
    'red',
    'green',
    'yellow',
    'gray',
    'inverted',
    'outline'
);


--
-- Name: badge_icon_position; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."badge_icon_position" AS ENUM (
    'flex-row',
    'flex-row-reverse'
);


--
-- Name: enum__archiveBlock_v_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__archiveBlock_v_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum__archiveBlock_v_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__archiveBlock_v_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum__archiveBlock_v_populate_by; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__archiveBlock_v_populate_by" AS ENUM (
    'collection',
    'selection'
);


--
-- Name: enum__archiveBlock_v_relation_to; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__archiveBlock_v_relation_to" AS ENUM (
    'blog-posts'
);


--
-- Name: enum__blogBlock_v_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__blogBlock_v_type" AS ENUM (
    'featuredPost',
    '2-columns'
);


--
-- Name: enum__blog_posts_v_published_locale; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__blog_posts_v_published_locale" AS ENUM (
    'en',
    'ar'
);


--
-- Name: enum__blog_posts_v_version_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__blog_posts_v_version_status" AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum__callToActionBlock_v_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__callToActionBlock_v_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum__callToActionBlock_v_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__callToActionBlock_v_type" AS ENUM (
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07'
);


--
-- Name: enum__customHtmlBlock_v_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__customHtmlBlock_v_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum__customHtmlBlock_v_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__customHtmlBlock_v_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum__customers_v_published_locale; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__customers_v_published_locale" AS ENUM (
    'en',
    'ar'
);


--
-- Name: enum__customers_v_version_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__customers_v_version_status" AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum__customers_v_version_testimonial_company_industry; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__customers_v_version_testimonial_company_industry" AS ENUM (
    'restaurants',
    'retail',
    'services'
);


--
-- Name: enum__customers_v_version_testimonial_stats_indicator; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__customers_v_version_testimonial_stats_indicator" AS ENUM (
    'increase',
    'decrease',
    'noChange'
);


--
-- Name: enum__dividerBlock_v_size; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__dividerBlock_v_size" AS ENUM (
    'small',
    'medium',
    'large'
);


--
-- Name: enum__faqBlock_v_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__faqBlock_v_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum__faqBlock_v_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__faqBlock_v_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum__faqBlock_v_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__faqBlock_v_type" AS ENUM (
    '01',
    '02'
);


--
-- Name: enum__faq_v_published_locale; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__faq_v_published_locale" AS ENUM (
    'en',
    'ar'
);


--
-- Name: enum__faq_v_version_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__faq_v_version_status" AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum__featuresBlock_v_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__featuresBlock_v_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum__featuresBlock_v_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__featuresBlock_v_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum__featuresBlock_v_columns_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__featuresBlock_v_columns_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum__featuresBlock_v_columns_size; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__featuresBlock_v_columns_size" AS ENUM (
    'half',
    'full',
    'oneThird',
    'twoThirds',
    'sixtyPercent',
    'fortyPercent'
);


--
-- Name: enum__featuresBlock_v_columns_stat_indicator; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__featuresBlock_v_columns_stat_indicator" AS ENUM (
    'increase',
    'decrease',
    'noChange'
);


--
-- Name: enum__featuresBlock_v_stat_indicator; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__featuresBlock_v_stat_indicator" AS ENUM (
    'increase',
    'decrease',
    'noChange'
);


--
-- Name: enum__featuresBlock_v_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__featuresBlock_v_type" AS ENUM (
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17'
);


--
-- Name: enum__galleryBlock_v_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__galleryBlock_v_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum__galleryBlock_v_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__galleryBlock_v_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum__galleryBlock_v_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__galleryBlock_v_type" AS ENUM (
    '01',
    '02',
    '03',
    '04'
);


--
-- Name: enum__logosBlock_v_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__logosBlock_v_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum__logosBlock_v_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__logosBlock_v_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum__logosBlock_v_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__logosBlock_v_type" AS ENUM (
    '01',
    '02',
    '03'
);


--
-- Name: enum__metricsBlock_v_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__metricsBlock_v_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum__metricsBlock_v_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__metricsBlock_v_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum__metricsBlock_v_stats_indicator; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__metricsBlock_v_stats_indicator" AS ENUM (
    'increase',
    'decrease',
    'noChange'
);


--
-- Name: enum__metricsBlock_v_table_headers_width; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__metricsBlock_v_table_headers_width" AS ENUM (
    'auto',
    'w-1/5',
    'w-1/3',
    'w-1/2',
    'w-2/3'
);


--
-- Name: enum__metricsBlock_v_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__metricsBlock_v_type" AS ENUM (
    '01',
    '02',
    '03'
);


--
-- Name: enum__pages_v_published_locale; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__pages_v_published_locale" AS ENUM (
    'en',
    'ar'
);


--
-- Name: enum__pages_v_version_hero_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__pages_v_version_hero_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum__pages_v_version_hero_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__pages_v_version_hero_type" AS ENUM (
    'none',
    'highImpact',
    'mediumImpact',
    'lowImpact'
);


--
-- Name: enum__pages_v_version_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__pages_v_version_status" AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum__richTextBlock_v_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__richTextBlock_v_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum__richTextBlock_v_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__richTextBlock_v_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum__richTextBlock_v_max_width; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__richTextBlock_v_max_width" AS ENUM (
    'default',
    'small',
    'large',
    'full'
);


--
-- Name: enum__richTextBlock_v_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__richTextBlock_v_type" AS ENUM (
    '01',
    '02'
);


--
-- Name: enum__testimonialsBlock_v_bg_color; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__testimonialsBlock_v_bg_color" AS ENUM (
    'lightTeal',
    'violet',
    'gray',
    'inverted'
);


--
-- Name: enum__testimonialsBlock_v_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__testimonialsBlock_v_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum__testimonialsBlock_v_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__testimonialsBlock_v_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum__testimonialsBlock_v_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum__testimonialsBlock_v_type" AS ENUM (
    '01',
    '02',
    '03'
);


--
-- Name: enum_archiveBlock_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_archiveBlock_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum_archiveBlock_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_archiveBlock_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum_archiveBlock_populate_by; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_archiveBlock_populate_by" AS ENUM (
    'collection',
    'selection'
);


--
-- Name: enum_archiveBlock_relation_to; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_archiveBlock_relation_to" AS ENUM (
    'blog-posts'
);


--
-- Name: enum_blogBlock_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_blogBlock_type" AS ENUM (
    'featuredPost',
    '2-columns'
);


--
-- Name: enum_blog_posts_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_blog_posts_status" AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum_callToActionBlock_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_callToActionBlock_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum_callToActionBlock_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_callToActionBlock_type" AS ENUM (
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07'
);


--
-- Name: enum_customHtmlBlock_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_customHtmlBlock_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum_customHtmlBlock_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_customHtmlBlock_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum_customers_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_customers_status" AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum_customers_testimonial_company_industry; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_customers_testimonial_company_industry" AS ENUM (
    'restaurants',
    'retail',
    'services'
);


--
-- Name: enum_customers_testimonial_stats_indicator; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_customers_testimonial_stats_indicator" AS ENUM (
    'increase',
    'decrease',
    'noChange'
);


--
-- Name: enum_dividerBlock_size; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_dividerBlock_size" AS ENUM (
    'small',
    'medium',
    'large'
);


--
-- Name: enum_faqBlock_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_faqBlock_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum_faqBlock_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_faqBlock_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum_faqBlock_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_faqBlock_type" AS ENUM (
    '01',
    '02'
);


--
-- Name: enum_faq_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_faq_status" AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum_featuresBlock_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_featuresBlock_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum_featuresBlock_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_featuresBlock_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum_featuresBlock_columns_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_featuresBlock_columns_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum_featuresBlock_columns_size; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_featuresBlock_columns_size" AS ENUM (
    'half',
    'full',
    'oneThird',
    'twoThirds',
    'sixtyPercent',
    'fortyPercent'
);


--
-- Name: enum_featuresBlock_columns_stat_indicator; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_featuresBlock_columns_stat_indicator" AS ENUM (
    'increase',
    'decrease',
    'noChange'
);


--
-- Name: enum_featuresBlock_stat_indicator; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_featuresBlock_stat_indicator" AS ENUM (
    'increase',
    'decrease',
    'noChange'
);


--
-- Name: enum_featuresBlock_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_featuresBlock_type" AS ENUM (
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17'
);


--
-- Name: enum_forms_confirmation_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_forms_confirmation_type" AS ENUM (
    'message',
    'redirect'
);


--
-- Name: enum_galleryBlock_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_galleryBlock_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum_galleryBlock_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_galleryBlock_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum_galleryBlock_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_galleryBlock_type" AS ENUM (
    '01',
    '02',
    '03',
    '04'
);


--
-- Name: enum_header_tabs_nav_items_style; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_header_tabs_nav_items_style" AS ENUM (
    'default',
    'featured',
    'list'
);


--
-- Name: enum_logosBlock_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_logosBlock_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum_logosBlock_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_logosBlock_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum_logosBlock_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_logosBlock_type" AS ENUM (
    '01',
    '02',
    '03'
);


--
-- Name: enum_media_locale; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_media_locale" AS ENUM (
    'en',
    'ar'
);


--
-- Name: enum_metricsBlock_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_metricsBlock_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum_metricsBlock_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_metricsBlock_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum_metricsBlock_stats_indicator; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_metricsBlock_stats_indicator" AS ENUM (
    'increase',
    'decrease',
    'noChange'
);


--
-- Name: enum_metricsBlock_table_headers_width; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_metricsBlock_table_headers_width" AS ENUM (
    'auto',
    'w-1/5',
    'w-1/3',
    'w-1/2',
    'w-2/3'
);


--
-- Name: enum_metricsBlock_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_metricsBlock_type" AS ENUM (
    '01',
    '02',
    '03'
);


--
-- Name: enum_pages_hero_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_pages_hero_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum_pages_hero_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_pages_hero_type" AS ENUM (
    'none',
    'highImpact',
    'mediumImpact',
    'lowImpact'
);


--
-- Name: enum_pages_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_pages_status" AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum_payload_jobs_log_state; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_payload_jobs_log_state" AS ENUM (
    'failed',
    'succeeded'
);


--
-- Name: enum_payload_jobs_log_task_slug; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_payload_jobs_log_task_slug" AS ENUM (
    'inline',
    'schedulePublish'
);


--
-- Name: enum_payload_jobs_task_slug; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_payload_jobs_task_slug" AS ENUM (
    'inline',
    'schedulePublish'
);


--
-- Name: enum_redirects_to_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_redirects_to_type" AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum_richTextBlock_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_richTextBlock_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum_richTextBlock_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_richTextBlock_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum_richTextBlock_max_width; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_richTextBlock_max_width" AS ENUM (
    'default',
    'small',
    'large',
    'full'
);


--
-- Name: enum_richTextBlock_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_richTextBlock_type" AS ENUM (
    '01',
    '02'
);


--
-- Name: enum_testimonialsBlock_bg_color; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_testimonialsBlock_bg_color" AS ENUM (
    'lightTeal',
    'violet',
    'gray',
    'inverted'
);


--
-- Name: enum_testimonialsBlock_block_header_badge_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_testimonialsBlock_block_header_badge_type" AS ENUM (
    'label',
    'reference'
);


--
-- Name: enum_testimonialsBlock_block_header_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_testimonialsBlock_block_header_type" AS ENUM (
    'center',
    'split',
    'start'
);


--
-- Name: enum_testimonialsBlock_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."enum_testimonialsBlock_type" AS ENUM (
    '01',
    '02',
    '03'
);


--
-- Name: link_color; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."link_color" AS ENUM (
    'brand',
    'neutral'
);


--
-- Name: link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."link_type" AS ENUM (
    'reference',
    'custom'
);


--
-- Name: link_variant; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."link_variant" AS ENUM (
    'primary',
    'secondary',
    'tertiary',
    'ghost',
    'link'
);


SET default_tablespace = '';

SET default_table_access_method = "heap";

--
-- Name: _archiveBlock_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_archiveBlock_v" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "block_header_type" "public"."enum__archiveBlock_v_block_header_type" DEFAULT 'center'::"public"."enum__archiveBlock_v_block_header_type",
    "block_header_badge_type" "public"."enum__archiveBlock_v_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "populate_by" "public"."enum__archiveBlock_v_populate_by" DEFAULT 'collection'::"public"."enum__archiveBlock_v_populate_by",
    "relation_to" "public"."enum__archiveBlock_v_relation_to" DEFAULT 'blog-posts'::"public"."enum__archiveBlock_v_relation_to",
    "limit" numeric DEFAULT 10,
    "_uuid" character varying,
    "block_name" character varying
);


--
-- Name: _archiveBlock_v_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_archiveBlock_v_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant",
    "_uuid" character varying
);


--
-- Name: _archiveBlock_v_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_archiveBlock_v_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _archiveBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_archiveBlock_v_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _archiveBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_archiveBlock_v_block_header_links_locales_id_seq" OWNED BY "public"."_archiveBlock_v_block_header_links_locales"."id";


--
-- Name: _archiveBlock_v_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_archiveBlock_v_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _archiveBlock_v_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_archiveBlock_v_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _archiveBlock_v_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_archiveBlock_v_locales_id_seq" OWNED BY "public"."_archiveBlock_v_locales"."id";


--
-- Name: _blogBlock_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_blogBlock_v" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "type" "public"."enum__blogBlock_v_type" DEFAULT 'featuredPost'::"public"."enum__blogBlock_v_type",
    "featured_post_id" "uuid",
    "_uuid" character varying,
    "block_name" character varying
);


--
-- Name: _blogBlock_v_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_blogBlock_v_locales" (
    "recent_posts_list_title" character varying,
    "recent_posts_list_description" character varying,
    "editors_picks_list_title" character varying,
    "editors_picks_list_description" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _blogBlock_v_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_blogBlock_v_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _blogBlock_v_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_blogBlock_v_locales_id_seq" OWNED BY "public"."_blogBlock_v_locales"."id";


--
-- Name: _blog_posts_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_blog_posts_v" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "parent_id" "uuid",
    "version_slug" character varying,
    "version_slug_lock" boolean DEFAULT true,
    "version_updated_at" timestamp(3) with time zone,
    "version_created_at" timestamp(3) with time zone,
    "version__status" "public"."enum__blog_posts_v_version_status" DEFAULT 'draft'::"public"."enum__blog_posts_v_version_status",
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "snapshot" boolean,
    "published_locale" "public"."enum__blog_posts_v_published_locale",
    "latest" boolean
);


--
-- Name: _blog_posts_v_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_blog_posts_v_locales" (
    "version_title" character varying,
    "version_hero_image_id" "uuid",
    "version_content" "jsonb",
    "version_meta_title" character varying,
    "version_meta_image_id" "uuid",
    "version_meta_description" character varying,
    "version_published_at" timestamp(3) with time zone,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _blog_posts_v_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_blog_posts_v_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _blog_posts_v_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_blog_posts_v_locales_id_seq" OWNED BY "public"."_blog_posts_v_locales"."id";


--
-- Name: _blog_posts_v_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_blog_posts_v_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" "uuid" NOT NULL,
    "path" character varying NOT NULL,
    "locale" "public"."_locales",
    "blog_posts_id" "uuid",
    "categories_id" "uuid",
    "users_id" "uuid"
);


--
-- Name: _blog_posts_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_blog_posts_v_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _blog_posts_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_blog_posts_v_rels_id_seq" OWNED BY "public"."_blog_posts_v_rels"."id";


--
-- Name: _blog_posts_v_version_populated_authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_blog_posts_v_version_populated_authors" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "_uuid" character varying,
    "name" character varying
);


--
-- Name: _callToActionBlock_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_callToActionBlock_v" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "type" "public"."enum__callToActionBlock_v_type" DEFAULT '01'::"public"."enum__callToActionBlock_v_type",
    "badge_type" "public"."enum__callToActionBlock_v_badge_type",
    "badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "badge_icon" character varying,
    "badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "caption" character varying,
    "form_id" "uuid",
    "_uuid" character varying,
    "block_name" character varying
);


--
-- Name: _callToActionBlock_v_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_callToActionBlock_v_links" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant",
    "_uuid" character varying
);


--
-- Name: _callToActionBlock_v_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_callToActionBlock_v_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _callToActionBlock_v_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_callToActionBlock_v_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _callToActionBlock_v_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_callToActionBlock_v_links_locales_id_seq" OWNED BY "public"."_callToActionBlock_v_links_locales"."id";


--
-- Name: _callToActionBlock_v_list; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_callToActionBlock_v_list" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "icon" character varying,
    "title" character varying,
    "subtitle" character varying,
    "_uuid" character varying
);


--
-- Name: _callToActionBlock_v_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_callToActionBlock_v_locales" (
    "badge_label" character varying,
    "rich_text" "jsonb",
    "media_desktop_light_id" "uuid",
    "media_desktop_dark_id" "uuid",
    "media_mobile_light_id" "uuid",
    "media_mobile_dark_id" "uuid",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _callToActionBlock_v_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_callToActionBlock_v_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _callToActionBlock_v_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_callToActionBlock_v_locales_id_seq" OWNED BY "public"."_callToActionBlock_v_locales"."id";


--
-- Name: _customHtmlBlock_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_customHtmlBlock_v" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "block_header_type" "public"."enum__customHtmlBlock_v_block_header_type" DEFAULT 'center'::"public"."enum__customHtmlBlock_v_block_header_type",
    "block_header_badge_type" "public"."enum__customHtmlBlock_v_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "html_content" character varying,
    "_uuid" character varying,
    "block_name" character varying
);


--
-- Name: _customHtmlBlock_v_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_customHtmlBlock_v_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant",
    "_uuid" character varying
);


--
-- Name: _customHtmlBlock_v_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_customHtmlBlock_v_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _customHtmlBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_customHtmlBlock_v_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _customHtmlBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_customHtmlBlock_v_block_header_links_locales_id_seq" OWNED BY "public"."_customHtmlBlock_v_block_header_links_locales"."id";


--
-- Name: _customHtmlBlock_v_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_customHtmlBlock_v_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _customHtmlBlock_v_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_customHtmlBlock_v_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _customHtmlBlock_v_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_customHtmlBlock_v_locales_id_seq" OWNED BY "public"."_customHtmlBlock_v_locales"."id";


--
-- Name: _customers_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_customers_v" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "parent_id" "uuid",
    "version_title" character varying,
    "version_testimonial_featured_image_id" "uuid",
    "version_testimonial_company_company_logo_id" "uuid",
    "version_testimonial_company_link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "version_testimonial_company_link_new_tab" boolean,
    "version_testimonial_company_link_url" character varying,
    "version_testimonial_company_industry" "public"."enum__customers_v_version_testimonial_company_industry",
    "version_testimonial_company_founding_year" numeric,
    "version_testimonial_company_branches" character varying,
    "version_testimonial_author_info_avatar_id" "uuid",
    "version_enable_case_study" boolean DEFAULT false,
    "version_slug" character varying,
    "version_slug_lock" boolean DEFAULT true,
    "version_published_at" timestamp(3) with time zone,
    "version_updated_at" timestamp(3) with time zone,
    "version_created_at" timestamp(3) with time zone,
    "version__status" "public"."enum__customers_v_version_status" DEFAULT 'draft'::"public"."enum__customers_v_version_status",
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "snapshot" boolean,
    "published_locale" "public"."enum__customers_v_published_locale",
    "latest" boolean,
    "autosave" boolean
);


--
-- Name: _customers_v_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_customers_v_locales" (
    "version_testimonial_quote" "jsonb",
    "version_testimonial_company_company_name" character varying,
    "version_testimonial_company_link_label" character varying,
    "version_testimonial_company_location" character varying,
    "version_testimonial_author_info_name" character varying,
    "version_testimonial_author_info_title" character varying,
    "version_case_study_case_studytitle" character varying,
    "version_case_study_summary" character varying,
    "version_case_study_content" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _customers_v_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_customers_v_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _customers_v_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_customers_v_locales_id_seq" OWNED BY "public"."_customers_v_locales"."id";


--
-- Name: _customers_v_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_customers_v_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" "uuid" NOT NULL,
    "path" character varying NOT NULL,
    "pages_id" "uuid",
    "blog_posts_id" "uuid",
    "categories_id" "uuid"
);


--
-- Name: _customers_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_customers_v_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _customers_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_customers_v_rels_id_seq" OWNED BY "public"."_customers_v_rels"."id";


--
-- Name: _customers_v_version_testimonial_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_customers_v_version_testimonial_stats" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "value" character varying,
    "indicator" "public"."enum__customers_v_version_testimonial_stats_indicator" DEFAULT 'noChange'::"public"."enum__customers_v_version_testimonial_stats_indicator",
    "_uuid" character varying
);


--
-- Name: _customers_v_version_testimonial_stats_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_customers_v_version_testimonial_stats_locales" (
    "label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _customers_v_version_testimonial_stats_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_customers_v_version_testimonial_stats_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _customers_v_version_testimonial_stats_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_customers_v_version_testimonial_stats_locales_id_seq" OWNED BY "public"."_customers_v_version_testimonial_stats_locales"."id";


--
-- Name: _dividerBlock_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_dividerBlock_v" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "size" "public"."enum__dividerBlock_v_size" DEFAULT 'small'::"public"."enum__dividerBlock_v_size",
    "enable_divider" boolean DEFAULT true,
    "_uuid" character varying,
    "block_name" character varying
);


--
-- Name: _faqBlock_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_faqBlock_v" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "block_header_type" "public"."enum__faqBlock_v_block_header_type" DEFAULT 'center'::"public"."enum__faqBlock_v_block_header_type",
    "block_header_badge_type" "public"."enum__faqBlock_v_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "type" "public"."enum__faqBlock_v_type" DEFAULT '01'::"public"."enum__faqBlock_v_type",
    "_uuid" character varying,
    "block_name" character varying
);


--
-- Name: _faqBlock_v_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_faqBlock_v_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant",
    "_uuid" character varying
);


--
-- Name: _faqBlock_v_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_faqBlock_v_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _faqBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_faqBlock_v_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _faqBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_faqBlock_v_block_header_links_locales_id_seq" OWNED BY "public"."_faqBlock_v_block_header_links_locales"."id";


--
-- Name: _faqBlock_v_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_faqBlock_v_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _faqBlock_v_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_faqBlock_v_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _faqBlock_v_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_faqBlock_v_locales_id_seq" OWNED BY "public"."_faqBlock_v_locales"."id";


--
-- Name: _faq_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_faq_v" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "parent_id" "uuid",
    "version_category_id" "uuid",
    "version_updated_at" timestamp(3) with time zone,
    "version_created_at" timestamp(3) with time zone,
    "version__status" "public"."enum__faq_v_version_status" DEFAULT 'draft'::"public"."enum__faq_v_version_status",
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "snapshot" boolean,
    "published_locale" "public"."enum__faq_v_published_locale",
    "latest" boolean,
    "autosave" boolean
);


--
-- Name: _faq_v_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_faq_v_locales" (
    "version_question" character varying,
    "version_answer" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _faq_v_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_faq_v_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _faq_v_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_faq_v_locales_id_seq" OWNED BY "public"."_faq_v_locales"."id";


--
-- Name: _featuresBlock_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_featuresBlock_v" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "block_header_type" "public"."enum__featuresBlock_v_block_header_type" DEFAULT 'center'::"public"."enum__featuresBlock_v_block_header_type",
    "block_header_badge_type" "public"."enum__featuresBlock_v_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "type" "public"."enum__featuresBlock_v_type" DEFAULT '01'::"public"."enum__featuresBlock_v_type",
    "block_image_id" "uuid",
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "_uuid" character varying,
    "block_name" character varying,
    "stat_value" character varying,
    "stat_indicator" "public"."enum__featuresBlock_v_stat_indicator" DEFAULT 'noChange'::"public"."enum__featuresBlock_v_stat_indicator"
);


--
-- Name: _featuresBlock_v_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_featuresBlock_v_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant",
    "_uuid" character varying
);


--
-- Name: _featuresBlock_v_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_featuresBlock_v_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _featuresBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_featuresBlock_v_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _featuresBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_featuresBlock_v_block_header_links_locales_id_seq" OWNED BY "public"."_featuresBlock_v_block_header_links_locales"."id";


--
-- Name: _featuresBlock_v_columns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_featuresBlock_v_columns" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "size" "public"."enum__featuresBlock_v_columns_size" DEFAULT 'half'::"public"."enum__featuresBlock_v_columns_size",
    "icon" character varying,
    "enable_badge" boolean,
    "enable_cta" boolean,
    "reverse_order" boolean,
    "badge_type" "public"."enum__featuresBlock_v_columns_badge_type",
    "badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "badge_icon" character varying,
    "badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "_uuid" character varying,
    "stat_value" character varying,
    "stat_indicator" "public"."enum__featuresBlock_v_columns_stat_indicator" DEFAULT 'noChange'::"public"."enum__featuresBlock_v_columns_stat_indicator"
);


--
-- Name: _featuresBlock_v_columns_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_featuresBlock_v_columns_locales" (
    "image_id" "uuid",
    "tab_label" character varying,
    "content_title" character varying,
    "content_subtitle" character varying,
    "rich_text_content" "jsonb",
    "badge_label" character varying,
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "stat_label" character varying
);


--
-- Name: _featuresBlock_v_columns_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_featuresBlock_v_columns_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _featuresBlock_v_columns_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_featuresBlock_v_columns_locales_id_seq" OWNED BY "public"."_featuresBlock_v_columns_locales"."id";


--
-- Name: _featuresBlock_v_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_featuresBlock_v_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "c_t_a_label" character varying,
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "stat_label" character varying
);


--
-- Name: _featuresBlock_v_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_featuresBlock_v_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _featuresBlock_v_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_featuresBlock_v_locales_id_seq" OWNED BY "public"."_featuresBlock_v_locales"."id";


--
-- Name: _formBlock_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_formBlock_v" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "form_id" "uuid",
    "enable_intro" boolean,
    "intro_content" "jsonb",
    "_uuid" character varying,
    "block_name" character varying
);


--
-- Name: _galleryBlock_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_galleryBlock_v" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "block_header_type" "public"."enum__galleryBlock_v_block_header_type" DEFAULT 'center'::"public"."enum__galleryBlock_v_block_header_type",
    "block_header_badge_type" "public"."enum__galleryBlock_v_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "type" "public"."enum__galleryBlock_v_type" DEFAULT '01'::"public"."enum__galleryBlock_v_type",
    "_uuid" character varying,
    "block_name" character varying
);


--
-- Name: _galleryBlock_v_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_galleryBlock_v_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant",
    "_uuid" character varying
);


--
-- Name: _galleryBlock_v_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_galleryBlock_v_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _galleryBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_galleryBlock_v_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _galleryBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_galleryBlock_v_block_header_links_locales_id_seq" OWNED BY "public"."_galleryBlock_v_block_header_links_locales"."id";


--
-- Name: _galleryBlock_v_interactive_gallery; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_galleryBlock_v_interactive_gallery" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "_uuid" character varying
);


--
-- Name: _galleryBlock_v_interactive_gallery_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_galleryBlock_v_interactive_gallery_locales" (
    "image_id" "uuid",
    "panel_title" character varying,
    "panel_description" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _galleryBlock_v_interactive_gallery_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_galleryBlock_v_interactive_gallery_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _galleryBlock_v_interactive_gallery_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_galleryBlock_v_interactive_gallery_locales_id_seq" OWNED BY "public"."_galleryBlock_v_interactive_gallery_locales"."id";


--
-- Name: _galleryBlock_v_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_galleryBlock_v_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _galleryBlock_v_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_galleryBlock_v_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _galleryBlock_v_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_galleryBlock_v_locales_id_seq" OWNED BY "public"."_galleryBlock_v_locales"."id";


--
-- Name: _logosBlock_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_logosBlock_v" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "block_header_type" "public"."enum__logosBlock_v_block_header_type" DEFAULT 'center'::"public"."enum__logosBlock_v_block_header_type",
    "block_header_badge_type" "public"."enum__logosBlock_v_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "type" "public"."enum__logosBlock_v_type",
    "_uuid" character varying,
    "block_name" character varying
);


--
-- Name: _logosBlock_v_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_logosBlock_v_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant",
    "_uuid" character varying
);


--
-- Name: _logosBlock_v_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_logosBlock_v_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _logosBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_logosBlock_v_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _logosBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_logosBlock_v_block_header_links_locales_id_seq" OWNED BY "public"."_logosBlock_v_block_header_links_locales"."id";


--
-- Name: _logosBlock_v_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_logosBlock_v_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _logosBlock_v_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_logosBlock_v_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _logosBlock_v_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_logosBlock_v_locales_id_seq" OWNED BY "public"."_logosBlock_v_locales"."id";


--
-- Name: _metricsBlock_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_metricsBlock_v" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "block_header_type" "public"."enum__metricsBlock_v_block_header_type" DEFAULT 'center'::"public"."enum__metricsBlock_v_block_header_type",
    "block_header_badge_type" "public"."enum__metricsBlock_v_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "type" "public"."enum__metricsBlock_v_type" DEFAULT '01'::"public"."enum__metricsBlock_v_type",
    "table_styling_striped" boolean DEFAULT true,
    "table_styling_bordered" boolean DEFAULT true,
    "table_styling_compact" boolean DEFAULT false,
    "enable_logos" boolean,
    "_uuid" character varying,
    "block_name" character varying
);


--
-- Name: _metricsBlock_v_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_metricsBlock_v_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant",
    "_uuid" character varying
);


--
-- Name: _metricsBlock_v_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_metricsBlock_v_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _metricsBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_metricsBlock_v_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _metricsBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_metricsBlock_v_block_header_links_locales_id_seq" OWNED BY "public"."_metricsBlock_v_block_header_links_locales"."id";


--
-- Name: _metricsBlock_v_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_metricsBlock_v_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "block_image_media_id" "uuid",
    "table_title" character varying,
    "logos_headline" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _metricsBlock_v_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_metricsBlock_v_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _metricsBlock_v_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_metricsBlock_v_locales_id_seq" OWNED BY "public"."_metricsBlock_v_locales"."id";


--
-- Name: _metricsBlock_v_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_metricsBlock_v_stats" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "value" character varying,
    "indicator" "public"."enum__metricsBlock_v_stats_indicator" DEFAULT 'noChange'::"public"."enum__metricsBlock_v_stats_indicator",
    "_uuid" character varying
);


--
-- Name: _metricsBlock_v_stats_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_metricsBlock_v_stats_locales" (
    "label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _metricsBlock_v_stats_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_metricsBlock_v_stats_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _metricsBlock_v_stats_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_metricsBlock_v_stats_locales_id_seq" OWNED BY "public"."_metricsBlock_v_stats_locales"."id";


--
-- Name: _metricsBlock_v_table_headers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_metricsBlock_v_table_headers" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "header" character varying,
    "width" "public"."enum__metricsBlock_v_table_headers_width" DEFAULT 'auto'::"public"."enum__metricsBlock_v_table_headers_width",
    "_uuid" character varying
);


--
-- Name: _metricsBlock_v_table_rows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_metricsBlock_v_table_rows" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "is_expandable" boolean DEFAULT false,
    "_uuid" character varying
);


--
-- Name: _metricsBlock_v_table_rows_cells; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_metricsBlock_v_table_rows_cells" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "content" character varying,
    "is_header" boolean DEFAULT false,
    "_uuid" character varying
);


--
-- Name: _metricsBlock_v_table_rows_children; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_metricsBlock_v_table_rows_children" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "_uuid" character varying
);


--
-- Name: _metricsBlock_v_table_rows_children_cells; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_metricsBlock_v_table_rows_children_cells" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "content" character varying,
    "_uuid" character varying
);


--
-- Name: _pages_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_pages_v" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "parent_id" "uuid",
    "version_title" character varying,
    "version_hero_type" "public"."enum__pages_v_version_hero_type" DEFAULT 'lowImpact'::"public"."enum__pages_v_version_hero_type",
    "version_hero_badge_type" "public"."enum__pages_v_version_hero_badge_type",
    "version_hero_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "version_hero_badge_icon" character varying,
    "version_hero_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "version_hero_caption" character varying,
    "version_published_at" timestamp(3) with time zone,
    "version_slug" character varying,
    "version_slug_lock" boolean DEFAULT true,
    "version_updated_at" timestamp(3) with time zone,
    "version_created_at" timestamp(3) with time zone,
    "version__status" "public"."enum__pages_v_version_status" DEFAULT 'draft'::"public"."enum__pages_v_version_status",
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "snapshot" boolean,
    "published_locale" "public"."enum__pages_v_published_locale",
    "latest" boolean,
    "autosave" boolean
);


--
-- Name: _pages_v_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_pages_v_locales" (
    "version_hero_badge_label" character varying,
    "version_hero_rich_text" "jsonb",
    "version_hero_media_desktop_light_id" "uuid",
    "version_hero_media_desktop_dark_id" "uuid",
    "version_hero_logos_headline" character varying,
    "version_meta_title" character varying,
    "version_meta_image_id" "uuid",
    "version_meta_description" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "version_hero_media_mobile_light_id" "uuid",
    "version_hero_media_mobile_dark_id" "uuid"
);


--
-- Name: _pages_v_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_pages_v_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_pages_v_locales_id_seq" OWNED BY "public"."_pages_v_locales"."id";


--
-- Name: _pages_v_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_pages_v_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" "uuid" NOT NULL,
    "path" character varying NOT NULL,
    "locale" "public"."_locales",
    "pages_id" "uuid",
    "blog_posts_id" "uuid",
    "media_id" "uuid",
    "categories_id" "uuid",
    "faq_id" "uuid",
    "customers_id" "uuid"
);


--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_pages_v_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_pages_v_rels_id_seq" OWNED BY "public"."_pages_v_rels"."id";


--
-- Name: _pages_v_version_hero_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_pages_v_version_hero_links" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant",
    "_uuid" character varying
);


--
-- Name: _pages_v_version_hero_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_pages_v_version_hero_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _pages_v_version_hero_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_pages_v_version_hero_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_version_hero_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_pages_v_version_hero_links_locales_id_seq" OWNED BY "public"."_pages_v_version_hero_links_locales"."id";


--
-- Name: _richTextBlock_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_richTextBlock_v" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "block_header_type" "public"."enum__richTextBlock_v_block_header_type" DEFAULT 'center'::"public"."enum__richTextBlock_v_block_header_type",
    "block_header_badge_type" "public"."enum__richTextBlock_v_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "type" "public"."enum__richTextBlock_v_type" DEFAULT '01'::"public"."enum__richTextBlock_v_type",
    "max_width" "public"."enum__richTextBlock_v_max_width" DEFAULT 'default'::"public"."enum__richTextBlock_v_max_width",
    "columns" numeric DEFAULT 1,
    "_uuid" character varying,
    "block_name" character varying
);


--
-- Name: _richTextBlock_v_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_richTextBlock_v_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant",
    "_uuid" character varying
);


--
-- Name: _richTextBlock_v_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_richTextBlock_v_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _richTextBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_richTextBlock_v_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _richTextBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_richTextBlock_v_block_header_links_locales_id_seq" OWNED BY "public"."_richTextBlock_v_block_header_links_locales"."id";


--
-- Name: _richTextBlock_v_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_richTextBlock_v_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "content" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _richTextBlock_v_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_richTextBlock_v_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _richTextBlock_v_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_richTextBlock_v_locales_id_seq" OWNED BY "public"."_richTextBlock_v_locales"."id";


--
-- Name: _testimonialsBlock_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_testimonialsBlock_v" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "block_header_type" "public"."enum__testimonialsBlock_v_block_header_type" DEFAULT 'center'::"public"."enum__testimonialsBlock_v_block_header_type",
    "block_header_badge_type" "public"."enum__testimonialsBlock_v_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "type" "public"."enum__testimonialsBlock_v_type" DEFAULT '01'::"public"."enum__testimonialsBlock_v_type",
    "_uuid" character varying,
    "block_name" character varying,
    "bg_color" "public"."enum__testimonialsBlock_v_bg_color" DEFAULT 'gray'::"public"."enum__testimonialsBlock_v_bg_color"
);


--
-- Name: _testimonialsBlock_v_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_testimonialsBlock_v_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant",
    "_uuid" character varying
);


--
-- Name: _testimonialsBlock_v_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_testimonialsBlock_v_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _testimonialsBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_testimonialsBlock_v_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _testimonialsBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_testimonialsBlock_v_block_header_links_locales_id_seq" OWNED BY "public"."_testimonialsBlock_v_block_header_links_locales"."id";


--
-- Name: _testimonialsBlock_v_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_testimonialsBlock_v_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: _testimonialsBlock_v_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."_testimonialsBlock_v_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _testimonialsBlock_v_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."_testimonialsBlock_v_locales_id_seq" OWNED BY "public"."_testimonialsBlock_v_locales"."id";


--
-- Name: archiveBlock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."archiveBlock" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "block_header_type" "public"."enum_archiveBlock_block_header_type" DEFAULT 'center'::"public"."enum_archiveBlock_block_header_type",
    "block_header_badge_type" "public"."enum_archiveBlock_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "populate_by" "public"."enum_archiveBlock_populate_by" DEFAULT 'collection'::"public"."enum_archiveBlock_populate_by",
    "relation_to" "public"."enum_archiveBlock_relation_to" DEFAULT 'blog-posts'::"public"."enum_archiveBlock_relation_to",
    "limit" numeric DEFAULT 10,
    "block_name" character varying
);


--
-- Name: archiveBlock_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."archiveBlock_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant"
);


--
-- Name: archiveBlock_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."archiveBlock_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: archiveBlock_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."archiveBlock_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: archiveBlock_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."archiveBlock_block_header_links_locales_id_seq" OWNED BY "public"."archiveBlock_block_header_links_locales"."id";


--
-- Name: archiveBlock_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."archiveBlock_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: archiveBlock_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."archiveBlock_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: archiveBlock_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."archiveBlock_locales_id_seq" OWNED BY "public"."archiveBlock_locales"."id";


--
-- Name: blogBlock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."blogBlock" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "type" "public"."enum_blogBlock_type" DEFAULT 'featuredPost'::"public"."enum_blogBlock_type",
    "featured_post_id" "uuid",
    "block_name" character varying
);


--
-- Name: blogBlock_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."blogBlock_locales" (
    "recent_posts_list_title" character varying,
    "recent_posts_list_description" character varying,
    "editors_picks_list_title" character varying,
    "editors_picks_list_description" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: blogBlock_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."blogBlock_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blogBlock_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."blogBlock_locales_id_seq" OWNED BY "public"."blogBlock_locales"."id";


--
-- Name: blog_posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."blog_posts" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "slug" character varying,
    "slug_lock" boolean DEFAULT true,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "_status" "public"."enum_blog_posts_status" DEFAULT 'draft'::"public"."enum_blog_posts_status"
);


--
-- Name: blog_posts_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."blog_posts_locales" (
    "title" character varying,
    "hero_image_id" "uuid",
    "content" "jsonb",
    "meta_title" character varying,
    "meta_image_id" "uuid",
    "meta_description" character varying,
    "published_at" timestamp(3) with time zone,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: blog_posts_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."blog_posts_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_posts_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."blog_posts_locales_id_seq" OWNED BY "public"."blog_posts_locales"."id";


--
-- Name: blog_posts_populated_authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."blog_posts_populated_authors" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" character varying NOT NULL,
    "name" character varying
);


--
-- Name: blog_posts_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."blog_posts_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" "uuid" NOT NULL,
    "path" character varying NOT NULL,
    "locale" "public"."_locales",
    "blog_posts_id" "uuid",
    "categories_id" "uuid",
    "users_id" "uuid"
);


--
-- Name: blog_posts_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."blog_posts_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_posts_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."blog_posts_rels_id_seq" OWNED BY "public"."blog_posts_rels"."id";


--
-- Name: callToActionBlock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."callToActionBlock" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "type" "public"."enum_callToActionBlock_type" DEFAULT '01'::"public"."enum_callToActionBlock_type",
    "badge_type" "public"."enum_callToActionBlock_badge_type",
    "badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "badge_icon" character varying,
    "badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "caption" character varying,
    "form_id" "uuid",
    "block_name" character varying
);


--
-- Name: callToActionBlock_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."callToActionBlock_links" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant"
);


--
-- Name: callToActionBlock_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."callToActionBlock_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: callToActionBlock_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."callToActionBlock_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: callToActionBlock_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."callToActionBlock_links_locales_id_seq" OWNED BY "public"."callToActionBlock_links_locales"."id";


--
-- Name: callToActionBlock_list; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."callToActionBlock_list" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "id" character varying NOT NULL,
    "icon" character varying,
    "title" character varying,
    "subtitle" character varying
);


--
-- Name: callToActionBlock_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."callToActionBlock_locales" (
    "badge_label" character varying,
    "rich_text" "jsonb",
    "media_desktop_light_id" "uuid",
    "media_desktop_dark_id" "uuid",
    "media_mobile_light_id" "uuid",
    "media_mobile_dark_id" "uuid",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: callToActionBlock_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."callToActionBlock_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: callToActionBlock_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."callToActionBlock_locales_id_seq" OWNED BY "public"."callToActionBlock_locales"."id";


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."categories" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "title" character varying NOT NULL,
    "slug" character varying,
    "slug_lock" boolean DEFAULT true,
    "parent_id" "uuid",
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: categories_breadcrumbs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."categories_breadcrumbs" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "id" character varying NOT NULL,
    "doc_id" "uuid",
    "url" character varying,
    "label" character varying
);


--
-- Name: customHtmlBlock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."customHtmlBlock" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "block_header_type" "public"."enum_customHtmlBlock_block_header_type" DEFAULT 'center'::"public"."enum_customHtmlBlock_block_header_type",
    "block_header_badge_type" "public"."enum_customHtmlBlock_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "html_content" character varying,
    "block_name" character varying
);


--
-- Name: customHtmlBlock_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."customHtmlBlock_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant"
);


--
-- Name: customHtmlBlock_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."customHtmlBlock_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: customHtmlBlock_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."customHtmlBlock_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customHtmlBlock_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."customHtmlBlock_block_header_links_locales_id_seq" OWNED BY "public"."customHtmlBlock_block_header_links_locales"."id";


--
-- Name: customHtmlBlock_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."customHtmlBlock_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: customHtmlBlock_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."customHtmlBlock_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customHtmlBlock_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."customHtmlBlock_locales_id_seq" OWNED BY "public"."customHtmlBlock_locales"."id";


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."customers" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "title" character varying,
    "testimonial_featured_image_id" "uuid",
    "testimonial_company_company_logo_id" "uuid",
    "testimonial_company_link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "testimonial_company_link_new_tab" boolean,
    "testimonial_company_link_url" character varying,
    "testimonial_company_industry" "public"."enum_customers_testimonial_company_industry",
    "testimonial_company_founding_year" numeric,
    "testimonial_company_branches" character varying,
    "testimonial_author_info_avatar_id" "uuid",
    "enable_case_study" boolean DEFAULT false,
    "slug" character varying,
    "slug_lock" boolean DEFAULT true,
    "published_at" timestamp(3) with time zone,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "_status" "public"."enum_customers_status" DEFAULT 'draft'::"public"."enum_customers_status"
);


--
-- Name: customers_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."customers_locales" (
    "testimonial_quote" "jsonb",
    "testimonial_company_company_name" character varying,
    "testimonial_company_link_label" character varying,
    "testimonial_company_location" character varying,
    "testimonial_author_info_name" character varying,
    "testimonial_author_info_title" character varying,
    "case_study_case_studytitle" character varying,
    "case_study_summary" character varying,
    "case_study_content" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: customers_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."customers_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."customers_locales_id_seq" OWNED BY "public"."customers_locales"."id";


--
-- Name: customers_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."customers_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" "uuid" NOT NULL,
    "path" character varying NOT NULL,
    "pages_id" "uuid",
    "blog_posts_id" "uuid",
    "categories_id" "uuid"
);


--
-- Name: customers_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."customers_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."customers_rels_id_seq" OWNED BY "public"."customers_rels"."id";


--
-- Name: customers_testimonial_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."customers_testimonial_stats" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" character varying NOT NULL,
    "value" character varying,
    "indicator" "public"."enum_customers_testimonial_stats_indicator" DEFAULT 'noChange'::"public"."enum_customers_testimonial_stats_indicator"
);


--
-- Name: customers_testimonial_stats_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."customers_testimonial_stats_locales" (
    "label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: customers_testimonial_stats_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."customers_testimonial_stats_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_testimonial_stats_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."customers_testimonial_stats_locales_id_seq" OWNED BY "public"."customers_testimonial_stats_locales"."id";


--
-- Name: dividerBlock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."dividerBlock" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "size" "public"."enum_dividerBlock_size" DEFAULT 'small'::"public"."enum_dividerBlock_size",
    "enable_divider" boolean DEFAULT true,
    "block_name" character varying
);


--
-- Name: faq; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."faq" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "category_id" "uuid",
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "_status" "public"."enum_faq_status" DEFAULT 'draft'::"public"."enum_faq_status"
);


--
-- Name: faqBlock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."faqBlock" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "block_header_type" "public"."enum_faqBlock_block_header_type" DEFAULT 'center'::"public"."enum_faqBlock_block_header_type",
    "block_header_badge_type" "public"."enum_faqBlock_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "type" "public"."enum_faqBlock_type" DEFAULT '01'::"public"."enum_faqBlock_type",
    "block_name" character varying
);


--
-- Name: faqBlock_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."faqBlock_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant"
);


--
-- Name: faqBlock_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."faqBlock_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: faqBlock_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."faqBlock_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: faqBlock_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."faqBlock_block_header_links_locales_id_seq" OWNED BY "public"."faqBlock_block_header_links_locales"."id";


--
-- Name: faqBlock_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."faqBlock_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: faqBlock_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."faqBlock_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: faqBlock_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."faqBlock_locales_id_seq" OWNED BY "public"."faqBlock_locales"."id";


--
-- Name: faq_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."faq_locales" (
    "question" character varying,
    "answer" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: faq_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."faq_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: faq_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."faq_locales_id_seq" OWNED BY "public"."faq_locales"."id";


--
-- Name: featuresBlock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."featuresBlock" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "block_header_type" "public"."enum_featuresBlock_block_header_type" DEFAULT 'center'::"public"."enum_featuresBlock_block_header_type",
    "block_header_badge_type" "public"."enum_featuresBlock_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "type" "public"."enum_featuresBlock_type" DEFAULT '01'::"public"."enum_featuresBlock_type",
    "block_image_id" "uuid",
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "block_name" character varying,
    "stat_value" character varying,
    "stat_indicator" "public"."enum_featuresBlock_stat_indicator" DEFAULT 'noChange'::"public"."enum_featuresBlock_stat_indicator"
);


--
-- Name: featuresBlock_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."featuresBlock_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant"
);


--
-- Name: featuresBlock_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."featuresBlock_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: featuresBlock_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."featuresBlock_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: featuresBlock_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."featuresBlock_block_header_links_locales_id_seq" OWNED BY "public"."featuresBlock_block_header_links_locales"."id";


--
-- Name: featuresBlock_columns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."featuresBlock_columns" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "size" "public"."enum_featuresBlock_columns_size" DEFAULT 'half'::"public"."enum_featuresBlock_columns_size",
    "icon" character varying,
    "enable_badge" boolean,
    "enable_cta" boolean,
    "reverse_order" boolean,
    "badge_type" "public"."enum_featuresBlock_columns_badge_type",
    "badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "badge_icon" character varying,
    "badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "stat_value" character varying,
    "stat_indicator" "public"."enum_featuresBlock_columns_stat_indicator" DEFAULT 'noChange'::"public"."enum_featuresBlock_columns_stat_indicator"
);


--
-- Name: featuresBlock_columns_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."featuresBlock_columns_locales" (
    "image_id" "uuid",
    "tab_label" character varying,
    "content_title" character varying,
    "content_subtitle" character varying,
    "rich_text_content" "jsonb",
    "badge_label" character varying,
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL,
    "stat_label" character varying
);


--
-- Name: featuresBlock_columns_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."featuresBlock_columns_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: featuresBlock_columns_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."featuresBlock_columns_locales_id_seq" OWNED BY "public"."featuresBlock_columns_locales"."id";


--
-- Name: featuresBlock_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."featuresBlock_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "c_t_a_label" character varying,
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL,
    "stat_label" character varying
);


--
-- Name: featuresBlock_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."featuresBlock_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: featuresBlock_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."featuresBlock_locales_id_seq" OWNED BY "public"."featuresBlock_locales"."id";


--
-- Name: footer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."footer" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "updated_at" timestamp(3) with time zone,
    "created_at" timestamp(3) with time zone
);


--
-- Name: footer_columns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."footer_columns" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" character varying NOT NULL,
    "label" character varying NOT NULL
);


--
-- Name: footer_columns_nav_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."footer_columns_nav_items" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying
);


--
-- Name: footer_columns_nav_items_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."footer_columns_nav_items_locales" (
    "link_label" character varying NOT NULL,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: footer_columns_nav_items_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."footer_columns_nav_items_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: footer_columns_nav_items_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."footer_columns_nav_items_locales_id_seq" OWNED BY "public"."footer_columns_nav_items_locales"."id";


--
-- Name: footer_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."footer_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" "uuid" NOT NULL,
    "path" character varying NOT NULL,
    "pages_id" "uuid",
    "blog_posts_id" "uuid"
);


--
-- Name: footer_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."footer_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: footer_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."footer_rels_id_seq" OWNED BY "public"."footer_rels"."id";


--
-- Name: formBlock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."formBlock" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "form_id" "uuid",
    "enable_intro" boolean,
    "intro_content" "jsonb",
    "block_name" character varying
);


--
-- Name: form_submissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."form_submissions" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "form_id" "uuid" NOT NULL,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: form_submissions_submission_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."form_submissions_submission_data" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" character varying NOT NULL,
    "field" character varying NOT NULL,
    "value" character varying NOT NULL
);


--
-- Name: forms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "title" character varying NOT NULL,
    "confirmation_type" "public"."enum_forms_confirmation_type" DEFAULT 'message'::"public"."enum_forms_confirmation_type",
    "redirect_url" character varying,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: forms_blocks_checkbox; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_checkbox" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "name" character varying NOT NULL,
    "width" numeric,
    "required" boolean,
    "default_value" boolean,
    "block_name" character varying
);


--
-- Name: forms_blocks_checkbox_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_checkbox_locales" (
    "label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: forms_blocks_checkbox_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."forms_blocks_checkbox_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_blocks_checkbox_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."forms_blocks_checkbox_locales_id_seq" OWNED BY "public"."forms_blocks_checkbox_locales"."id";


--
-- Name: forms_blocks_country; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_country" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "name" character varying NOT NULL,
    "width" numeric,
    "required" boolean,
    "block_name" character varying
);


--
-- Name: forms_blocks_country_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_country_locales" (
    "label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: forms_blocks_country_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."forms_blocks_country_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_blocks_country_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."forms_blocks_country_locales_id_seq" OWNED BY "public"."forms_blocks_country_locales"."id";


--
-- Name: forms_blocks_email; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_email" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "name" character varying NOT NULL,
    "width" numeric,
    "required" boolean,
    "block_name" character varying
);


--
-- Name: forms_blocks_email_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_email_locales" (
    "label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: forms_blocks_email_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."forms_blocks_email_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_blocks_email_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."forms_blocks_email_locales_id_seq" OWNED BY "public"."forms_blocks_email_locales"."id";


--
-- Name: forms_blocks_message; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_message" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "block_name" character varying
);


--
-- Name: forms_blocks_message_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_message_locales" (
    "message" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: forms_blocks_message_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."forms_blocks_message_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_blocks_message_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."forms_blocks_message_locales_id_seq" OWNED BY "public"."forms_blocks_message_locales"."id";


--
-- Name: forms_blocks_number; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_number" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "name" character varying NOT NULL,
    "width" numeric,
    "default_value" numeric,
    "required" boolean,
    "block_name" character varying
);


--
-- Name: forms_blocks_number_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_number_locales" (
    "label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: forms_blocks_number_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."forms_blocks_number_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_blocks_number_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."forms_blocks_number_locales_id_seq" OWNED BY "public"."forms_blocks_number_locales"."id";


--
-- Name: forms_blocks_select; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_select" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "name" character varying NOT NULL,
    "width" numeric,
    "placeholder" character varying,
    "required" boolean,
    "block_name" character varying
);


--
-- Name: forms_blocks_select_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_select_locales" (
    "label" character varying,
    "default_value" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: forms_blocks_select_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."forms_blocks_select_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_blocks_select_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."forms_blocks_select_locales_id_seq" OWNED BY "public"."forms_blocks_select_locales"."id";


--
-- Name: forms_blocks_select_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_select_options" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "value" character varying NOT NULL
);


--
-- Name: forms_blocks_select_options_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_select_options_locales" (
    "label" character varying NOT NULL,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: forms_blocks_select_options_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."forms_blocks_select_options_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_blocks_select_options_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."forms_blocks_select_options_locales_id_seq" OWNED BY "public"."forms_blocks_select_options_locales"."id";


--
-- Name: forms_blocks_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_state" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "name" character varying NOT NULL,
    "width" numeric,
    "required" boolean,
    "block_name" character varying
);


--
-- Name: forms_blocks_state_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_state_locales" (
    "label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: forms_blocks_state_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."forms_blocks_state_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_blocks_state_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."forms_blocks_state_locales_id_seq" OWNED BY "public"."forms_blocks_state_locales"."id";


--
-- Name: forms_blocks_text; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_text" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "name" character varying NOT NULL,
    "width" numeric,
    "required" boolean,
    "block_name" character varying
);


--
-- Name: forms_blocks_text_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_text_locales" (
    "label" character varying,
    "default_value" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: forms_blocks_text_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."forms_blocks_text_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_blocks_text_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."forms_blocks_text_locales_id_seq" OWNED BY "public"."forms_blocks_text_locales"."id";


--
-- Name: forms_blocks_textarea; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_textarea" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "name" character varying NOT NULL,
    "width" numeric,
    "required" boolean,
    "block_name" character varying
);


--
-- Name: forms_blocks_textarea_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_blocks_textarea_locales" (
    "label" character varying,
    "default_value" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: forms_blocks_textarea_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."forms_blocks_textarea_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_blocks_textarea_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."forms_blocks_textarea_locales_id_seq" OWNED BY "public"."forms_blocks_textarea_locales"."id";


--
-- Name: forms_emails; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_emails" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" character varying NOT NULL,
    "email_to" character varying,
    "cc" character varying,
    "bcc" character varying,
    "reply_to" character varying,
    "email_from" character varying
);


--
-- Name: forms_emails_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_emails_locales" (
    "subject" character varying DEFAULT 'You''ve received a new message.'::character varying NOT NULL,
    "message" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: forms_emails_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."forms_emails_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_emails_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."forms_emails_locales_id_seq" OWNED BY "public"."forms_emails_locales"."id";


--
-- Name: forms_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."forms_locales" (
    "submit_button_label" character varying,
    "confirmation_message" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: forms_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."forms_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forms_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."forms_locales_id_seq" OWNED BY "public"."forms_locales"."id";


--
-- Name: galleryBlock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."galleryBlock" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "block_header_type" "public"."enum_galleryBlock_block_header_type" DEFAULT 'center'::"public"."enum_galleryBlock_block_header_type",
    "block_header_badge_type" "public"."enum_galleryBlock_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "type" "public"."enum_galleryBlock_type" DEFAULT '01'::"public"."enum_galleryBlock_type",
    "block_name" character varying
);


--
-- Name: galleryBlock_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."galleryBlock_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant"
);


--
-- Name: galleryBlock_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."galleryBlock_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: galleryBlock_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."galleryBlock_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: galleryBlock_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."galleryBlock_block_header_links_locales_id_seq" OWNED BY "public"."galleryBlock_block_header_links_locales"."id";


--
-- Name: galleryBlock_interactive_gallery; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."galleryBlock_interactive_gallery" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL
);


--
-- Name: galleryBlock_interactive_gallery_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."galleryBlock_interactive_gallery_locales" (
    "image_id" "uuid",
    "panel_title" character varying,
    "panel_description" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: galleryBlock_interactive_gallery_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."galleryBlock_interactive_gallery_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: galleryBlock_interactive_gallery_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."galleryBlock_interactive_gallery_locales_id_seq" OWNED BY "public"."galleryBlock_interactive_gallery_locales"."id";


--
-- Name: galleryBlock_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."galleryBlock_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: galleryBlock_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."galleryBlock_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: galleryBlock_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."galleryBlock_locales_id_seq" OWNED BY "public"."galleryBlock_locales"."id";


--
-- Name: header; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."header" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "updated_at" timestamp(3) with time zone,
    "created_at" timestamp(3) with time zone
);


--
-- Name: header_cta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."header_cta" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" character varying NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant"
);


--
-- Name: header_cta_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."header_cta_locales" (
    "link_label" character varying NOT NULL,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: header_cta_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."header_cta_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: header_cta_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."header_cta_locales_id_seq" OWNED BY "public"."header_cta_locales"."id";


--
-- Name: header_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."header_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" "uuid" NOT NULL,
    "path" character varying NOT NULL,
    "pages_id" "uuid",
    "blog_posts_id" "uuid"
);


--
-- Name: header_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."header_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: header_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."header_rels_id_seq" OWNED BY "public"."header_rels"."id";


--
-- Name: header_tabs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."header_tabs" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" character varying NOT NULL,
    "enable_direct_link" boolean DEFAULT true,
    "enable_dropdown" boolean DEFAULT false,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying
);


--
-- Name: header_tabs_description_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."header_tabs_description_links" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying
);


--
-- Name: header_tabs_description_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."header_tabs_description_links_locales" (
    "link_label" character varying NOT NULL,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: header_tabs_description_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."header_tabs_description_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: header_tabs_description_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."header_tabs_description_links_locales_id_seq" OWNED BY "public"."header_tabs_description_links_locales"."id";


--
-- Name: header_tabs_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."header_tabs_locales" (
    "label" character varying NOT NULL,
    "description" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: header_tabs_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."header_tabs_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: header_tabs_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."header_tabs_locales_id_seq" OWNED BY "public"."header_tabs_locales"."id";


--
-- Name: header_tabs_nav_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."header_tabs_nav_items" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "style" "public"."enum_header_tabs_nav_items_style" DEFAULT 'default'::"public"."enum_header_tabs_nav_items_style",
    "default_link_link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "default_link_link_new_tab" boolean,
    "default_link_link_url" character varying,
    "default_link_link_icon" character varying,
    "default_link_description" character varying,
    "featured_link_tag" character varying,
    "featured_link_label" "jsonb",
    "list_links_tag" character varying
);


--
-- Name: header_tabs_nav_items_featured_link_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."header_tabs_nav_items_featured_link_links" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_icon" character varying
);


--
-- Name: header_tabs_nav_items_featured_link_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."header_tabs_nav_items_featured_link_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: header_tabs_nav_items_featured_link_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."header_tabs_nav_items_featured_link_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: header_tabs_nav_items_featured_link_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."header_tabs_nav_items_featured_link_links_locales_id_seq" OWNED BY "public"."header_tabs_nav_items_featured_link_links_locales"."id";


--
-- Name: header_tabs_nav_items_list_links_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."header_tabs_nav_items_list_links_links" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_icon" character varying
);


--
-- Name: header_tabs_nav_items_list_links_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."header_tabs_nav_items_list_links_links_locales" (
    "link_label" character varying,
    "link_description" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: header_tabs_nav_items_list_links_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."header_tabs_nav_items_list_links_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: header_tabs_nav_items_list_links_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."header_tabs_nav_items_list_links_links_locales_id_seq" OWNED BY "public"."header_tabs_nav_items_list_links_links_locales"."id";


--
-- Name: header_tabs_nav_items_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."header_tabs_nav_items_locales" (
    "default_link_link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: header_tabs_nav_items_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."header_tabs_nav_items_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: header_tabs_nav_items_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."header_tabs_nav_items_locales_id_seq" OWNED BY "public"."header_tabs_nav_items_locales"."id";


--
-- Name: logosBlock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."logosBlock" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "block_header_type" "public"."enum_logosBlock_block_header_type" DEFAULT 'center'::"public"."enum_logosBlock_block_header_type",
    "block_header_badge_type" "public"."enum_logosBlock_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "type" "public"."enum_logosBlock_type",
    "block_name" character varying
);


--
-- Name: logosBlock_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."logosBlock_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant"
);


--
-- Name: logosBlock_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."logosBlock_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: logosBlock_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."logosBlock_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logosBlock_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."logosBlock_block_header_links_locales_id_seq" OWNED BY "public"."logosBlock_block_header_links_locales"."id";


--
-- Name: logosBlock_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."logosBlock_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: logosBlock_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."logosBlock_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logosBlock_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."logosBlock_locales_id_seq" OWNED BY "public"."logosBlock_locales"."id";


--
-- Name: media; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."media" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "prefix" character varying DEFAULT 'media'::character varying,
    "alt" character varying NOT NULL,
    "caption" "jsonb",
    "locale" "public"."enum_media_locale",
    "blurhash" character varying,
    "folder_id" "uuid",
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "url" character varying,
    "thumbnail_u_r_l" character varying,
    "filename" character varying,
    "mime_type" character varying,
    "filesize" numeric,
    "width" numeric,
    "height" numeric,
    "focal_x" numeric,
    "focal_y" numeric,
    "sizes_thumbnail_url" character varying,
    "sizes_thumbnail_width" numeric,
    "sizes_thumbnail_height" numeric,
    "sizes_thumbnail_mime_type" character varying,
    "sizes_thumbnail_filesize" numeric,
    "sizes_thumbnail_filename" character varying,
    "sizes_square_url" character varying,
    "sizes_square_width" numeric,
    "sizes_square_height" numeric,
    "sizes_square_mime_type" character varying,
    "sizes_square_filesize" numeric,
    "sizes_square_filename" character varying,
    "sizes_small_url" character varying,
    "sizes_small_width" numeric,
    "sizes_small_height" numeric,
    "sizes_small_mime_type" character varying,
    "sizes_small_filesize" numeric,
    "sizes_small_filename" character varying,
    "sizes_medium_url" character varying,
    "sizes_medium_width" numeric,
    "sizes_medium_height" numeric,
    "sizes_medium_mime_type" character varying,
    "sizes_medium_filesize" numeric,
    "sizes_medium_filename" character varying,
    "sizes_large_url" character varying,
    "sizes_large_width" numeric,
    "sizes_large_height" numeric,
    "sizes_large_mime_type" character varying,
    "sizes_large_filesize" numeric,
    "sizes_large_filename" character varying,
    "sizes_xlarge_url" character varying,
    "sizes_xlarge_width" numeric,
    "sizes_xlarge_height" numeric,
    "sizes_xlarge_mime_type" character varying,
    "sizes_xlarge_filesize" numeric,
    "sizes_xlarge_filename" character varying,
    "sizes_og_url" character varying,
    "sizes_og_width" numeric,
    "sizes_og_height" numeric,
    "sizes_og_mime_type" character varying,
    "sizes_og_filesize" numeric,
    "sizes_og_filename" character varying
);


--
-- Name: media_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."media_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" "uuid" NOT NULL,
    "path" character varying NOT NULL,
    "categories_id" "uuid"
);


--
-- Name: media_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."media_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: media_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."media_rels_id_seq" OWNED BY "public"."media_rels"."id";


--
-- Name: metricsBlock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."metricsBlock" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "block_header_type" "public"."enum_metricsBlock_block_header_type" DEFAULT 'center'::"public"."enum_metricsBlock_block_header_type",
    "block_header_badge_type" "public"."enum_metricsBlock_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "type" "public"."enum_metricsBlock_type" DEFAULT '01'::"public"."enum_metricsBlock_type",
    "table_styling_striped" boolean DEFAULT true,
    "table_styling_bordered" boolean DEFAULT true,
    "table_styling_compact" boolean DEFAULT false,
    "enable_logos" boolean,
    "block_name" character varying
);


--
-- Name: metricsBlock_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."metricsBlock_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant"
);


--
-- Name: metricsBlock_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."metricsBlock_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: metricsBlock_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."metricsBlock_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: metricsBlock_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."metricsBlock_block_header_links_locales_id_seq" OWNED BY "public"."metricsBlock_block_header_links_locales"."id";


--
-- Name: metricsBlock_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."metricsBlock_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "block_image_media_id" "uuid",
    "table_title" character varying,
    "logos_headline" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: metricsBlock_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."metricsBlock_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: metricsBlock_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."metricsBlock_locales_id_seq" OWNED BY "public"."metricsBlock_locales"."id";


--
-- Name: metricsBlock_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."metricsBlock_stats" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "value" character varying,
    "indicator" "public"."enum_metricsBlock_stats_indicator" DEFAULT 'noChange'::"public"."enum_metricsBlock_stats_indicator"
);


--
-- Name: metricsBlock_stats_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."metricsBlock_stats_locales" (
    "label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: metricsBlock_stats_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."metricsBlock_stats_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: metricsBlock_stats_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."metricsBlock_stats_locales_id_seq" OWNED BY "public"."metricsBlock_stats_locales"."id";


--
-- Name: metricsBlock_table_headers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."metricsBlock_table_headers" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "id" character varying NOT NULL,
    "header" character varying,
    "width" "public"."enum_metricsBlock_table_headers_width" DEFAULT 'auto'::"public"."enum_metricsBlock_table_headers_width"
);


--
-- Name: metricsBlock_table_rows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."metricsBlock_table_rows" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "id" character varying NOT NULL,
    "is_expandable" boolean DEFAULT false
);


--
-- Name: metricsBlock_table_rows_cells; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."metricsBlock_table_rows_cells" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "id" character varying NOT NULL,
    "content" character varying,
    "is_header" boolean DEFAULT false
);


--
-- Name: metricsBlock_table_rows_children; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."metricsBlock_table_rows_children" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "id" character varying NOT NULL
);


--
-- Name: metricsBlock_table_rows_children_cells; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."metricsBlock_table_rows_children_cells" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "id" character varying NOT NULL,
    "content" character varying
);


--
-- Name: pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."pages" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "title" character varying,
    "hero_type" "public"."enum_pages_hero_type" DEFAULT 'lowImpact'::"public"."enum_pages_hero_type",
    "hero_badge_type" "public"."enum_pages_hero_badge_type",
    "hero_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "hero_badge_icon" character varying,
    "hero_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "hero_caption" character varying,
    "published_at" timestamp(3) with time zone,
    "slug" character varying,
    "slug_lock" boolean DEFAULT true,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "_status" "public"."enum_pages_status" DEFAULT 'draft'::"public"."enum_pages_status"
);


--
-- Name: pages_hero_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."pages_hero_links" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" character varying NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant"
);


--
-- Name: pages_hero_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."pages_hero_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: pages_hero_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."pages_hero_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_hero_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."pages_hero_links_locales_id_seq" OWNED BY "public"."pages_hero_links_locales"."id";


--
-- Name: pages_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."pages_locales" (
    "hero_badge_label" character varying,
    "hero_rich_text" "jsonb",
    "hero_media_desktop_light_id" "uuid",
    "hero_media_desktop_dark_id" "uuid",
    "hero_logos_headline" character varying,
    "meta_title" character varying,
    "meta_image_id" "uuid",
    "meta_description" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "hero_media_mobile_light_id" "uuid",
    "hero_media_mobile_dark_id" "uuid"
);


--
-- Name: pages_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."pages_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."pages_locales_id_seq" OWNED BY "public"."pages_locales"."id";


--
-- Name: pages_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."pages_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" "uuid" NOT NULL,
    "path" character varying NOT NULL,
    "locale" "public"."_locales",
    "pages_id" "uuid",
    "blog_posts_id" "uuid",
    "media_id" "uuid",
    "categories_id" "uuid",
    "faq_id" "uuid",
    "customers_id" "uuid"
);


--
-- Name: pages_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."pages_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."pages_rels_id_seq" OWNED BY "public"."pages_rels"."id";


--
-- Name: payload_folders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."payload_folders" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "name" character varying NOT NULL,
    "folder_id" "uuid",
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: payload_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."payload_jobs" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "input" "jsonb",
    "completed_at" timestamp(3) with time zone,
    "total_tried" numeric DEFAULT 0,
    "has_error" boolean DEFAULT false,
    "error" "jsonb",
    "task_slug" "public"."enum_payload_jobs_task_slug",
    "queue" character varying DEFAULT 'default'::character varying,
    "wait_until" timestamp(3) with time zone,
    "processing" boolean DEFAULT false,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: payload_jobs_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."payload_jobs_log" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" character varying NOT NULL,
    "executed_at" timestamp(3) with time zone NOT NULL,
    "completed_at" timestamp(3) with time zone NOT NULL,
    "task_slug" "public"."enum_payload_jobs_log_task_slug" NOT NULL,
    "task_i_d" character varying NOT NULL,
    "input" "jsonb",
    "output" "jsonb",
    "state" "public"."enum_payload_jobs_log_state" NOT NULL,
    "error" "jsonb"
);


--
-- Name: payload_locked_documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."payload_locked_documents" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "global_slug" character varying,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: payload_locked_documents_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."payload_locked_documents_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" "uuid" NOT NULL,
    "path" character varying NOT NULL,
    "pages_id" "uuid",
    "blog_posts_id" "uuid",
    "media_id" "uuid",
    "customers_id" "uuid",
    "categories_id" "uuid",
    "faq_id" "uuid",
    "users_id" "uuid",
    "redirects_id" "uuid",
    "forms_id" "uuid",
    "form_submissions_id" "uuid",
    "search_id" "uuid",
    "payload_folders_id" "uuid",
    "payload_jobs_id" "uuid"
);


--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."payload_locked_documents_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."payload_locked_documents_rels_id_seq" OWNED BY "public"."payload_locked_documents_rels"."id";


--
-- Name: payload_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."payload_migrations" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "name" character varying,
    "batch" numeric,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: payload_preferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."payload_preferences" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "key" character varying,
    "value" "jsonb",
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: payload_preferences_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."payload_preferences_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" "uuid" NOT NULL,
    "path" character varying NOT NULL,
    "users_id" "uuid"
);


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."payload_preferences_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."payload_preferences_rels_id_seq" OWNED BY "public"."payload_preferences_rels"."id";


--
-- Name: redirects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."redirects" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "from" character varying NOT NULL,
    "to_type" "public"."enum_redirects_to_type" DEFAULT 'reference'::"public"."enum_redirects_to_type",
    "to_url" character varying,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: redirects_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."redirects_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" "uuid" NOT NULL,
    "path" character varying NOT NULL,
    "pages_id" "uuid",
    "blog_posts_id" "uuid"
);


--
-- Name: redirects_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."redirects_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redirects_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."redirects_rels_id_seq" OWNED BY "public"."redirects_rels"."id";


--
-- Name: richTextBlock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."richTextBlock" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "block_header_type" "public"."enum_richTextBlock_block_header_type" DEFAULT 'center'::"public"."enum_richTextBlock_block_header_type",
    "block_header_badge_type" "public"."enum_richTextBlock_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "type" "public"."enum_richTextBlock_type" DEFAULT '01'::"public"."enum_richTextBlock_type",
    "max_width" "public"."enum_richTextBlock_max_width" DEFAULT 'default'::"public"."enum_richTextBlock_max_width",
    "columns" numeric DEFAULT 1,
    "block_name" character varying
);


--
-- Name: richTextBlock_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."richTextBlock_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant"
);


--
-- Name: richTextBlock_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."richTextBlock_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: richTextBlock_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."richTextBlock_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: richTextBlock_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."richTextBlock_block_header_links_locales_id_seq" OWNED BY "public"."richTextBlock_block_header_links_locales"."id";


--
-- Name: richTextBlock_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."richTextBlock_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "content" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: richTextBlock_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."richTextBlock_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: richTextBlock_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."richTextBlock_locales_id_seq" OWNED BY "public"."richTextBlock_locales"."id";


--
-- Name: search; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."search" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "priority" numeric,
    "slug" character varying,
    "meta_title" character varying,
    "meta_description" character varying,
    "meta_image_id" "uuid",
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: search_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."search_categories" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "id" character varying NOT NULL,
    "relation_to" character varying,
    "category_i_d" character varying,
    "title" character varying
);


--
-- Name: search_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."search_locales" (
    "title" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: search_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."search_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: search_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."search_locales_id_seq" OWNED BY "public"."search_locales"."id";


--
-- Name: search_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."search_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" "uuid" NOT NULL,
    "path" character varying NOT NULL,
    "blog_posts_id" "uuid"
);


--
-- Name: search_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."search_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: search_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."search_rels_id_seq" OWNED BY "public"."search_rels"."id";


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."settings" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "announcement_bar_link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "announcement_bar_link_new_tab" boolean,
    "announcement_bar_link_url" character varying,
    "custom_head_html" character varying,
    "custom_body_html" character varying,
    "tag_manager_id" character varying,
    "analytics_scripts" character varying,
    "updated_at" timestamp(3) with time zone,
    "created_at" timestamp(3) with time zone
);


--
-- Name: settings_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."settings_locales" (
    "meta_title" character varying,
    "meta_image_id" "uuid",
    "meta_description" character varying,
    "announcement_bar_text" character varying,
    "announcement_bar_link_label" character varying NOT NULL,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" "uuid" NOT NULL
);


--
-- Name: settings_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."settings_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settings_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."settings_locales_id_seq" OWNED BY "public"."settings_locales"."id";


--
-- Name: settings_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."settings_rels" (
    "id" integer NOT NULL,
    "order" integer,
    "parent_id" "uuid" NOT NULL,
    "path" character varying NOT NULL,
    "pages_id" "uuid",
    "blog_posts_id" "uuid"
);


--
-- Name: settings_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."settings_rels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settings_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."settings_rels_id_seq" OWNED BY "public"."settings_rels"."id";


--
-- Name: testimonialsBlock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."testimonialsBlock" (
    "_order" integer NOT NULL,
    "_parent_id" "uuid" NOT NULL,
    "_path" "text" NOT NULL,
    "id" character varying NOT NULL,
    "block_header_type" "public"."enum_testimonialsBlock_block_header_type" DEFAULT 'center'::"public"."enum_testimonialsBlock_block_header_type",
    "block_header_badge_type" "public"."enum_testimonialsBlock_block_header_badge_type",
    "block_header_badge_color" "public"."badge_color" DEFAULT 'blue'::"public"."badge_color",
    "block_header_badge_icon" character varying,
    "block_header_badge_icon_position" "public"."badge_icon_position" DEFAULT 'flex-row'::"public"."badge_icon_position",
    "type" "public"."enum_testimonialsBlock_type" DEFAULT '01'::"public"."enum_testimonialsBlock_type",
    "block_name" character varying,
    "bg_color" "public"."enum_testimonialsBlock_bg_color" DEFAULT 'gray'::"public"."enum_testimonialsBlock_bg_color"
);


--
-- Name: testimonialsBlock_block_header_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."testimonialsBlock_block_header_links" (
    "_order" integer NOT NULL,
    "_parent_id" character varying NOT NULL,
    "id" character varying NOT NULL,
    "link_type" "public"."link_type" DEFAULT 'reference'::"public"."link_type",
    "link_new_tab" boolean,
    "link_url" character varying,
    "link_color" "public"."link_color" DEFAULT 'neutral'::"public"."link_color",
    "link_variant" "public"."link_variant" DEFAULT 'primary'::"public"."link_variant"
);


--
-- Name: testimonialsBlock_block_header_links_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."testimonialsBlock_block_header_links_locales" (
    "link_label" character varying,
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: testimonialsBlock_block_header_links_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."testimonialsBlock_block_header_links_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: testimonialsBlock_block_header_links_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."testimonialsBlock_block_header_links_locales_id_seq" OWNED BY "public"."testimonialsBlock_block_header_links_locales"."id";


--
-- Name: testimonialsBlock_locales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."testimonialsBlock_locales" (
    "block_header_badge_label" character varying,
    "block_header_header_text" "jsonb",
    "id" integer NOT NULL,
    "_locale" "public"."_locales" NOT NULL,
    "_parent_id" character varying NOT NULL
);


--
-- Name: testimonialsBlock_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."testimonialsBlock_locales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: testimonialsBlock_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."testimonialsBlock_locales_id_seq" OWNED BY "public"."testimonialsBlock_locales"."id";


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."users" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "name" character varying,
    "updated_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp(3) with time zone DEFAULT "now"() NOT NULL,
    "email" character varying NOT NULL,
    "reset_password_token" character varying,
    "reset_password_expiration" timestamp(3) with time zone,
    "salt" character varying,
    "hash" character varying,
    "login_attempts" numeric DEFAULT 0,
    "lock_until" timestamp(3) with time zone
);


--
-- Name: _archiveBlock_v_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_archiveBlock_v_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_archiveBlock_v_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: _archiveBlock_v_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_archiveBlock_v_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_archiveBlock_v_locales_id_seq"'::"regclass");


--
-- Name: _blogBlock_v_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blogBlock_v_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_blogBlock_v_locales_id_seq"'::"regclass");


--
-- Name: _blog_posts_v_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blog_posts_v_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_blog_posts_v_locales_id_seq"'::"regclass");


--
-- Name: _blog_posts_v_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blog_posts_v_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_blog_posts_v_rels_id_seq"'::"regclass");


--
-- Name: _callToActionBlock_v_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_callToActionBlock_v_links_locales_id_seq"'::"regclass");


--
-- Name: _callToActionBlock_v_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_callToActionBlock_v_locales_id_seq"'::"regclass");


--
-- Name: _customHtmlBlock_v_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customHtmlBlock_v_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_customHtmlBlock_v_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: _customHtmlBlock_v_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customHtmlBlock_v_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_customHtmlBlock_v_locales_id_seq"'::"regclass");


--
-- Name: _customers_v_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_customers_v_locales_id_seq"'::"regclass");


--
-- Name: _customers_v_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_customers_v_rels_id_seq"'::"regclass");


--
-- Name: _customers_v_version_testimonial_stats_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v_version_testimonial_stats_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_customers_v_version_testimonial_stats_locales_id_seq"'::"regclass");


--
-- Name: _faqBlock_v_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_faqBlock_v_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_faqBlock_v_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: _faqBlock_v_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_faqBlock_v_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_faqBlock_v_locales_id_seq"'::"regclass");


--
-- Name: _faq_v_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_faq_v_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_faq_v_locales_id_seq"'::"regclass");


--
-- Name: _featuresBlock_v_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_featuresBlock_v_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: _featuresBlock_v_columns_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v_columns_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_featuresBlock_v_columns_locales_id_seq"'::"regclass");


--
-- Name: _featuresBlock_v_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_featuresBlock_v_locales_id_seq"'::"regclass");


--
-- Name: _galleryBlock_v_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_galleryBlock_v_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_galleryBlock_v_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: _galleryBlock_v_interactive_gallery_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_galleryBlock_v_interactive_gallery_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_galleryBlock_v_interactive_gallery_locales_id_seq"'::"regclass");


--
-- Name: _galleryBlock_v_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_galleryBlock_v_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_galleryBlock_v_locales_id_seq"'::"regclass");


--
-- Name: _logosBlock_v_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_logosBlock_v_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_logosBlock_v_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: _logosBlock_v_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_logosBlock_v_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_logosBlock_v_locales_id_seq"'::"regclass");


--
-- Name: _metricsBlock_v_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_metricsBlock_v_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: _metricsBlock_v_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_metricsBlock_v_locales_id_seq"'::"regclass");


--
-- Name: _metricsBlock_v_stats_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_stats_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_metricsBlock_v_stats_locales_id_seq"'::"regclass");


--
-- Name: _pages_v_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_pages_v_locales_id_seq"'::"regclass");


--
-- Name: _pages_v_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_pages_v_rels_id_seq"'::"regclass");


--
-- Name: _pages_v_version_hero_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_version_hero_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_pages_v_version_hero_links_locales_id_seq"'::"regclass");


--
-- Name: _richTextBlock_v_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_richTextBlock_v_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_richTextBlock_v_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: _richTextBlock_v_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_richTextBlock_v_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_richTextBlock_v_locales_id_seq"'::"regclass");


--
-- Name: _testimonialsBlock_v_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_testimonialsBlock_v_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_testimonialsBlock_v_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: _testimonialsBlock_v_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_testimonialsBlock_v_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."_testimonialsBlock_v_locales_id_seq"'::"regclass");


--
-- Name: archiveBlock_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."archiveBlock_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."archiveBlock_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: archiveBlock_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."archiveBlock_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."archiveBlock_locales_id_seq"'::"regclass");


--
-- Name: blogBlock_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blogBlock_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."blogBlock_locales_id_seq"'::"regclass");


--
-- Name: blog_posts_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blog_posts_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."blog_posts_locales_id_seq"'::"regclass");


--
-- Name: blog_posts_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blog_posts_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."blog_posts_rels_id_seq"'::"regclass");


--
-- Name: callToActionBlock_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."callToActionBlock_links_locales_id_seq"'::"regclass");


--
-- Name: callToActionBlock_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."callToActionBlock_locales_id_seq"'::"regclass");


--
-- Name: customHtmlBlock_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customHtmlBlock_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."customHtmlBlock_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: customHtmlBlock_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customHtmlBlock_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."customHtmlBlock_locales_id_seq"'::"regclass");


--
-- Name: customers_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."customers_locales_id_seq"'::"regclass");


--
-- Name: customers_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."customers_rels_id_seq"'::"regclass");


--
-- Name: customers_testimonial_stats_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers_testimonial_stats_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."customers_testimonial_stats_locales_id_seq"'::"regclass");


--
-- Name: faqBlock_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."faqBlock_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."faqBlock_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: faqBlock_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."faqBlock_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."faqBlock_locales_id_seq"'::"regclass");


--
-- Name: faq_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."faq_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."faq_locales_id_seq"'::"regclass");


--
-- Name: featuresBlock_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."featuresBlock_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: featuresBlock_columns_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock_columns_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."featuresBlock_columns_locales_id_seq"'::"regclass");


--
-- Name: featuresBlock_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."featuresBlock_locales_id_seq"'::"regclass");


--
-- Name: footer_columns_nav_items_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."footer_columns_nav_items_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."footer_columns_nav_items_locales_id_seq"'::"regclass");


--
-- Name: footer_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."footer_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."footer_rels_id_seq"'::"regclass");


--
-- Name: forms_blocks_checkbox_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_checkbox_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."forms_blocks_checkbox_locales_id_seq"'::"regclass");


--
-- Name: forms_blocks_country_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_country_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."forms_blocks_country_locales_id_seq"'::"regclass");


--
-- Name: forms_blocks_email_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_email_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."forms_blocks_email_locales_id_seq"'::"regclass");


--
-- Name: forms_blocks_message_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_message_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."forms_blocks_message_locales_id_seq"'::"regclass");


--
-- Name: forms_blocks_number_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_number_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."forms_blocks_number_locales_id_seq"'::"regclass");


--
-- Name: forms_blocks_select_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_select_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."forms_blocks_select_locales_id_seq"'::"regclass");


--
-- Name: forms_blocks_select_options_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_select_options_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."forms_blocks_select_options_locales_id_seq"'::"regclass");


--
-- Name: forms_blocks_state_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_state_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."forms_blocks_state_locales_id_seq"'::"regclass");


--
-- Name: forms_blocks_text_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_text_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."forms_blocks_text_locales_id_seq"'::"regclass");


--
-- Name: forms_blocks_textarea_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_textarea_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."forms_blocks_textarea_locales_id_seq"'::"regclass");


--
-- Name: forms_emails_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_emails_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."forms_emails_locales_id_seq"'::"regclass");


--
-- Name: forms_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."forms_locales_id_seq"'::"regclass");


--
-- Name: galleryBlock_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."galleryBlock_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."galleryBlock_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: galleryBlock_interactive_gallery_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."galleryBlock_interactive_gallery_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."galleryBlock_interactive_gallery_locales_id_seq"'::"regclass");


--
-- Name: galleryBlock_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."galleryBlock_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."galleryBlock_locales_id_seq"'::"regclass");


--
-- Name: header_cta_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_cta_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."header_cta_locales_id_seq"'::"regclass");


--
-- Name: header_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."header_rels_id_seq"'::"regclass");


--
-- Name: header_tabs_description_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_description_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."header_tabs_description_links_locales_id_seq"'::"regclass");


--
-- Name: header_tabs_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."header_tabs_locales_id_seq"'::"regclass");


--
-- Name: header_tabs_nav_items_featured_link_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_nav_items_featured_link_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."header_tabs_nav_items_featured_link_links_locales_id_seq"'::"regclass");


--
-- Name: header_tabs_nav_items_list_links_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_nav_items_list_links_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."header_tabs_nav_items_list_links_links_locales_id_seq"'::"regclass");


--
-- Name: header_tabs_nav_items_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_nav_items_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."header_tabs_nav_items_locales_id_seq"'::"regclass");


--
-- Name: logosBlock_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."logosBlock_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."logosBlock_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: logosBlock_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."logosBlock_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."logosBlock_locales_id_seq"'::"regclass");


--
-- Name: media_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."media_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."media_rels_id_seq"'::"regclass");


--
-- Name: metricsBlock_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."metricsBlock_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: metricsBlock_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."metricsBlock_locales_id_seq"'::"regclass");


--
-- Name: metricsBlock_stats_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_stats_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."metricsBlock_stats_locales_id_seq"'::"regclass");


--
-- Name: pages_hero_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_hero_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."pages_hero_links_locales_id_seq"'::"regclass");


--
-- Name: pages_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."pages_locales_id_seq"'::"regclass");


--
-- Name: pages_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."pages_rels_id_seq"'::"regclass");


--
-- Name: payload_locked_documents_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."payload_locked_documents_rels_id_seq"'::"regclass");


--
-- Name: payload_preferences_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_preferences_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."payload_preferences_rels_id_seq"'::"regclass");


--
-- Name: redirects_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."redirects_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."redirects_rels_id_seq"'::"regclass");


--
-- Name: richTextBlock_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."richTextBlock_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."richTextBlock_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: richTextBlock_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."richTextBlock_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."richTextBlock_locales_id_seq"'::"regclass");


--
-- Name: search_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."search_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."search_locales_id_seq"'::"regclass");


--
-- Name: search_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."search_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."search_rels_id_seq"'::"regclass");


--
-- Name: settings_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."settings_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."settings_locales_id_seq"'::"regclass");


--
-- Name: settings_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."settings_rels" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."settings_rels_id_seq"'::"regclass");


--
-- Name: testimonialsBlock_block_header_links_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."testimonialsBlock_block_header_links_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."testimonialsBlock_block_header_links_locales_id_seq"'::"regclass");


--
-- Name: testimonialsBlock_locales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."testimonialsBlock_locales" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."testimonialsBlock_locales_id_seq"'::"regclass");


--
-- Data for Name: _archiveBlock_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_archiveBlock_v" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "populate_by", "relation_to", "limit", "_uuid", "block_name") FROM stdin;
\.


--
-- Data for Name: _archiveBlock_v_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_archiveBlock_v_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant", "_uuid") FROM stdin;
\.


--
-- Data for Name: _archiveBlock_v_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_archiveBlock_v_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _archiveBlock_v_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_archiveBlock_v_locales" ("block_header_badge_label", "block_header_header_text", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _blogBlock_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_blogBlock_v" ("_order", "_parent_id", "_path", "id", "type", "featured_post_id", "_uuid", "block_name") FROM stdin;
\.


--
-- Data for Name: _blogBlock_v_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_blogBlock_v_locales" ("recent_posts_list_title", "recent_posts_list_description", "editors_picks_list_title", "editors_picks_list_description", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _blog_posts_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_blog_posts_v" ("id", "parent_id", "version_slug", "version_slug_lock", "version_updated_at", "version_created_at", "version__status", "created_at", "updated_at", "snapshot", "published_locale", "latest") FROM stdin;
\.


--
-- Data for Name: _blog_posts_v_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_blog_posts_v_locales" ("version_title", "version_hero_image_id", "version_content", "version_meta_title", "version_meta_image_id", "version_meta_description", "version_published_at", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _blog_posts_v_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_blog_posts_v_rels" ("id", "order", "parent_id", "path", "locale", "blog_posts_id", "categories_id", "users_id") FROM stdin;
\.


--
-- Data for Name: _blog_posts_v_version_populated_authors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_blog_posts_v_version_populated_authors" ("_order", "_parent_id", "id", "_uuid", "name") FROM stdin;
\.


--
-- Data for Name: _callToActionBlock_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_callToActionBlock_v" ("_order", "_parent_id", "_path", "id", "type", "badge_type", "badge_color", "badge_icon", "badge_icon_position", "caption", "form_id", "_uuid", "block_name") FROM stdin;
8	41c60df7-54ab-4683-8983-1204117e7975	version.layout	fbb24a02-8420-4514-8bdb-c7b547b11431	02	\N	blue	\N	flex-row	\N	\N	6886a1475a3935fab3feb21f	\N
8	deefcd27-f08b-46fa-8843-0703ff59e6cc	version.layout	4677e55c-f059-46ca-8fac-1d06a51d0155	02	\N	blue	\N	flex-row	\N	\N	6886a1475a3935fab3feb21f	\N
\.


--
-- Data for Name: _callToActionBlock_v_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_callToActionBlock_v_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant", "_uuid") FROM stdin;
1	fbb24a02-8420-4514-8bdb-c7b547b11431	41944d3f-a6c6-400e-8db5-b87ade65ddf9	custom	\N	/	neutral	primary	6886a17b5a3935fab3feb220
1	4677e55c-f059-46ca-8fac-1d06a51d0155	9dc2a3de-be48-4cb0-b08e-4300d43ee3a3	custom	\N	/	neutral	primary	6886a17b5a3935fab3feb220
\.


--
-- Data for Name: _callToActionBlock_v_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_callToActionBlock_v_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
اطلب استشارة مجانية	8	ar	41944d3f-a6c6-400e-8db5-b87ade65ddf9
اطلب استشارة مجانية	9	ar	9dc2a3de-be48-4cb0-b08e-4300d43ee3a3
\.


--
-- Data for Name: _callToActionBlock_v_list; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_callToActionBlock_v_list" ("_order", "_parent_id", "_locale", "id", "icon", "title", "subtitle", "_uuid") FROM stdin;
1	fbb24a02-8420-4514-8bdb-c7b547b11431	ar	3626be3b-640b-4142-8c3d-4517328a2126	\N	تحدث مع متخصص	\N	6886a19a5a3935fab3feb221
2	fbb24a02-8420-4514-8bdb-c7b547b11431	ar	fd0c9940-13b4-4980-bebc-3d2bc1d1f066	\N	شاهد كيف تعمل المنصة	\N	6886a1c05a3935fab3feb222
3	fbb24a02-8420-4514-8bdb-c7b547b11431	ar	fb286029-ba0d-4f34-86ff-b3d010261b92	\N	\N	\N	6886a1cf5a3935fab3feb223
1	4677e55c-f059-46ca-8fac-1d06a51d0155	ar	63d794b1-a9de-444d-b6d0-4791ac80e53b	\N	تحدث مع متخصص	\N	6886a19a5a3935fab3feb221
2	4677e55c-f059-46ca-8fac-1d06a51d0155	ar	550e1306-68b8-457f-ae47-9ad97fb3eb23	\N	شاهد كيف تعمل المنصة	\N	6886a1c05a3935fab3feb222
3	4677e55c-f059-46ca-8fac-1d06a51d0155	ar	b3c5bc6b-ba39-454d-80a7-7e26f121adb8	\N	\N	\N	6886a1cf5a3935fab3feb223
\.


--
-- Data for Name: _callToActionBlock_v_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_callToActionBlock_v_locales" ("badge_label", "rich_text", "media_desktop_light_id", "media_desktop_dark_id", "media_mobile_light_id", "media_mobile_dark_id", "id", "_locale", "_parent_id") FROM stdin;
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "جاهز تزيد ارباحك؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بنعرّفك على كل أدوات بلورة، ونطلع لك بأفكار سهلة تزيد من أرباح مطعمك... عشان تبدأ تشوف الفرق من بكرة.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	\N	\N	14	ar	fbb24a02-8420-4514-8bdb-c7b547b11431
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "جاهز تزيد ارباحك؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بنعرّفك على كل أدوات بلورة، ونطلع لك بأفكار سهلة تزيد من أرباح مطعمك... عشان تبدأ تشوف الفرق من بكرة.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	\N	\N	15	ar	4677e55c-f059-46ca-8fac-1d06a51d0155
\.


--
-- Data for Name: _customHtmlBlock_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_customHtmlBlock_v" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "html_content", "_uuid", "block_name") FROM stdin;
\.


--
-- Data for Name: _customHtmlBlock_v_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_customHtmlBlock_v_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant", "_uuid") FROM stdin;
\.


--
-- Data for Name: _customHtmlBlock_v_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_customHtmlBlock_v_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _customHtmlBlock_v_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_customHtmlBlock_v_locales" ("block_header_badge_label", "block_header_header_text", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _customers_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_customers_v" ("id", "parent_id", "version_title", "version_testimonial_featured_image_id", "version_testimonial_company_company_logo_id", "version_testimonial_company_link_type", "version_testimonial_company_link_new_tab", "version_testimonial_company_link_url", "version_testimonial_company_industry", "version_testimonial_company_founding_year", "version_testimonial_company_branches", "version_testimonial_author_info_avatar_id", "version_enable_case_study", "version_slug", "version_slug_lock", "version_published_at", "version_updated_at", "version_created_at", "version__status", "created_at", "updated_at", "snapshot", "published_locale", "latest", "autosave") FROM stdin;
b7942e6a-37f8-4151-a285-21b6602579e9	ad1d03ad-f60b-4f83-90c2-d456f1fbaf21	مطعم	\N	\N	custom	\N	/	\N	\N	\N	\N	f		t	\N	2025-07-27 21:51:14.168+00	2025-07-27 21:49:09.536+00	published	2025-07-27 21:51:15.814+00	2025-07-27 21:51:15.814+00	\N	\N	t	f
74c32e8d-ea7e-446a-b36b-e59401a1a9aa	ad1d03ad-f60b-4f83-90c2-d456f1fbaf21	\N	\N	\N	reference	\N	\N	\N	\N	\N	\N	f	\N	t	\N	2025-07-27 21:49:09.588+00	2025-07-27 21:49:09.536+00	draft	2025-07-27 21:49:10.003+00	2025-07-27 21:49:10.003+00	\N	\N	f	f
4394d7b3-0c74-4cbd-9a0b-ca2116201372	ad1d03ad-f60b-4f83-90c2-d456f1fbaf21	مطعم	\N	\N	custom	\N	/	\N	\N	\N	\N	f		t	\N	2025-07-27 21:51:09.23+00	2025-07-27 21:49:09.536+00	draft	2025-07-27 21:49:15.874+00	2025-07-27 21:51:09.347+00	\N	\N	f	t
9982149f-01ea-4e8f-a237-9493a5d5cb45	b440e19a-7d00-487a-9927-d384dee97e22	مطعم2	\N	\N	custom	\N	/	\N	\N	\N	\N	f	2	t	\N	2025-07-27 21:54:35.523+00	2025-07-27 21:52:04.969+00	draft	2025-07-27 21:54:35.523+00	2025-07-27 21:54:35.523+00	\N	\N	t	f
61c27753-465d-4164-a698-33c4070ae18b	b440e19a-7d00-487a-9927-d384dee97e22	\N	\N	\N	reference	\N	\N	\N	\N	\N	\N	f	\N	t	\N	2025-07-27 21:52:05.016+00	2025-07-27 21:52:04.969+00	draft	2025-07-27 21:52:05.326+00	2025-07-27 21:52:05.326+00	\N	\N	f	f
d3feab86-1774-4e81-93a2-4daa78ad3569	b440e19a-7d00-487a-9927-d384dee97e22	مطعم2	\N	\N	custom	\N	/	\N	\N	\N	\N	f	2	t	\N	2025-07-27 21:54:32.783+00	2025-07-27 21:52:04.969+00	draft	2025-07-27 21:52:10.892+00	2025-07-27 21:54:32.929+00	\N	\N	f	t
\.


--
-- Data for Name: _customers_v_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_customers_v_locales" ("version_testimonial_quote", "version_testimonial_company_company_name", "version_testimonial_company_link_label", "version_testimonial_company_location", "version_testimonial_author_info_name", "version_testimonial_author_info_title", "version_case_study_case_studytitle", "version_case_study_summary", "version_case_study_content", "id", "_locale", "_parent_id") FROM stdin;
\N	\N	\N	\N	\N	\N	\N	\N	\N	1	en	74c32e8d-ea7e-446a-b36b-e59401a1a9aa
\N	\N	\N	\N	\N	\N	\N	\N	\N	2	ar	74c32e8d-ea7e-446a-b36b-e59401a1a9aa
\N	\N	\N	\N	\N	\N	\N	\N	\N	23	en	4394d7b3-0c74-4cbd-9a0b-ca2116201372
{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تضاعفت المبيعات الخاصة بنا وذلك عبر اتباع التوصيات المقدمة من بلورة، حيث زاد معدل الوصول للعملاء المستهدفين المتشابهين لسلوك قاعدة عملائنا، كما ارتفع معدل إتمام صفقات البيع بفضل العروض الخاصة المقترحة من قبل بلورة!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	ريت كافيه	/	\N	ماهر الحجيلي	شريك مؤسس، ريت كافيه	\N	\N	\N	24	ar	4394d7b3-0c74-4cbd-9a0b-ca2116201372
\N	\N	\N	\N	\N	\N	\N	\N	\N	25	en	b7942e6a-37f8-4151-a285-21b6602579e9
{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تضاعفت المبيعات الخاصة بنا وذلك عبر اتباع التوصيات المقدمة من بلورة، حيث زاد معدل الوصول للعملاء المستهدفين المتشابهين لسلوك قاعدة عملائنا، كما ارتفع معدل إتمام صفقات البيع بفضل العروض الخاصة المقترحة من قبل بلورة!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	ريت كافيه	/	\N	ماهر الحجيلي	شريك مؤسس، ريت كافيه	\N	\N	\N	26	ar	b7942e6a-37f8-4151-a285-21b6602579e9
\N	\N	\N	\N	\N	\N	\N	\N	\N	27	en	61c27753-465d-4164-a698-33c4070ae18b
\N	\N	\N	\N	\N	\N	\N	\N	\N	28	ar	61c27753-465d-4164-a698-33c4070ae18b
\N	\N	\N	\N	\N	\N	\N	\N	\N	51	en	d3feab86-1774-4e81-93a2-4daa78ad3569
{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تضاعفت المبيعات الخاصة بنا وذلك عبر اتباع التوصيات المقدمة من بلورة، حيث زاد معدل الوصول للعملاء المستهدفين المتشابهين لسلوك قاعدة عملائنا، كما ارتفع معدل إتمام صفقات البيع بفضل العروض الخاصة المقترحة من قبل بلورة!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	كوفيماتكس	/	\N	عبدالعزيز الجبوري	شريك مؤسس	\N	\N	\N	52	ar	d3feab86-1774-4e81-93a2-4daa78ad3569
\N	\N	\N	\N	\N	\N	\N	\N	\N	53	en	9982149f-01ea-4e8f-a237-9493a5d5cb45
{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تضاعفت المبيعات الخاصة بنا وذلك عبر اتباع التوصيات المقدمة من بلورة، حيث زاد معدل الوصول للعملاء المستهدفين المتشابهين لسلوك قاعدة عملائنا، كما ارتفع معدل إتمام صفقات البيع بفضل العروض الخاصة المقترحة من قبل بلورة!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	كوفيماتكس	/	\N	عبدالعزيز الجبوري	شريك مؤسس	\N	\N	\N	54	ar	9982149f-01ea-4e8f-a237-9493a5d5cb45
\.


--
-- Data for Name: _customers_v_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_customers_v_rels" ("id", "order", "parent_id", "path", "pages_id", "blog_posts_id", "categories_id") FROM stdin;
\.


--
-- Data for Name: _customers_v_version_testimonial_stats; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_customers_v_version_testimonial_stats" ("_order", "_parent_id", "id", "value", "indicator", "_uuid") FROM stdin;
\.


--
-- Data for Name: _customers_v_version_testimonial_stats_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_customers_v_version_testimonial_stats_locales" ("label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _dividerBlock_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_dividerBlock_v" ("_order", "_parent_id", "_path", "id", "size", "enable_divider", "_uuid", "block_name") FROM stdin;
\.


--
-- Data for Name: _faqBlock_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_faqBlock_v" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "type", "_uuid", "block_name") FROM stdin;
\.


--
-- Data for Name: _faqBlock_v_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_faqBlock_v_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant", "_uuid") FROM stdin;
\.


--
-- Data for Name: _faqBlock_v_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_faqBlock_v_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _faqBlock_v_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_faqBlock_v_locales" ("block_header_badge_label", "block_header_header_text", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _faq_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_faq_v" ("id", "parent_id", "version_category_id", "version_updated_at", "version_created_at", "version__status", "created_at", "updated_at", "snapshot", "published_locale", "latest", "autosave") FROM stdin;
\.


--
-- Data for Name: _faq_v_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_faq_v_locales" ("version_question", "version_answer", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _featuresBlock_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_featuresBlock_v" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "type", "block_image_id", "link_type", "link_new_tab", "link_url", "_uuid", "block_name", "stat_value", "stat_indicator") FROM stdin;
1	1f91be73-fce5-4495-9619-5b10ba8b92c9	version.layout	3fa30a41-58b5-40cc-9ce2-791c0c965a7a	center	\N	blue	\N	flex-row	14	\N	custom	\N	/	688694d473e9e43a4a6e3c05	\N	\N	noChange
3	1f91be73-fce5-4495-9619-5b10ba8b92c9	version.layout	e6769cfa-6f93-4afa-9e68-885c9841d287	center	\N	\N	\N	flex-row	01	\N	reference	\N	\N	688695d673e9e43a4a6e3c0a	\N	\N	noChange
4	1f91be73-fce5-4495-9619-5b10ba8b92c9	version.layout	e1b521fb-62dc-4120-917d-323b81834337	center	label	outline	\N	flex-row	06	fe54a595-3fe0-406c-8274-f5ed27ea3ec5	reference	\N	\N	68869a4d5a3935fab3feb217	\N	2-8%	noChange
5	1f91be73-fce5-4495-9619-5b10ba8b92c9	version.layout	8b134f9f-34b0-45c7-8d7b-976bfb31d015	center	\N	blue	\N	flex-row	04	\N	reference	\N	\N	68869d495a3935fab3feb219	\N	\N	noChange
1	e534ac8f-d8b4-4fc4-b77d-febb04366632	version.layout	44281774-c31a-4e3d-b3de-5b674d2cad28	center	\N	blue	\N	flex-row	14	\N	custom	\N	/	688694d473e9e43a4a6e3c05	\N	\N	noChange
3	e534ac8f-d8b4-4fc4-b77d-febb04366632	version.layout	1f9288ca-eb52-4e04-8e7a-d438f1edbcec	center	\N	\N	\N	flex-row	01	\N	reference	\N	\N	688695d673e9e43a4a6e3c0a	\N	\N	noChange
4	e534ac8f-d8b4-4fc4-b77d-febb04366632	version.layout	483acf8c-ca2e-474c-b2d2-781366636f31	center	label	outline	\N	flex-row	06	fe54a595-3fe0-406c-8274-f5ed27ea3ec5	reference	\N	\N	68869a4d5a3935fab3feb217	\N	2-8%	noChange
5	e534ac8f-d8b4-4fc4-b77d-febb04366632	version.layout	fed991c5-d671-4e5a-af30-8459b82fcee9	center	\N	blue	\N	flex-row	04	\N	reference	\N	\N	68869d495a3935fab3feb219	\N	\N	noChange
1	4389a3c7-2b44-4dda-b26c-b3db9aa06ea8	version.layout	502e24a6-4e0f-4013-814a-b50d6023250b	center	\N	blue	\N	flex-row	14	\N	custom	\N	/	688694d473e9e43a4a6e3c05	\N	\N	noChange
3	4389a3c7-2b44-4dda-b26c-b3db9aa06ea8	version.layout	2419edc0-cfc5-4cff-8a15-7b261ac9b072	center	\N	blue	\N	flex-row	01	\N	reference	\N	\N	688695d673e9e43a4a6e3c0a	\N	\N	noChange
4	4389a3c7-2b44-4dda-b26c-b3db9aa06ea8	version.layout	41627b7c-924b-4f28-bf3e-3b291c34db18	center	label	outline	\N	flex-row	06	fe54a595-3fe0-406c-8274-f5ed27ea3ec5	reference	\N	\N	68869a4d5a3935fab3feb217	\N	2-8%	noChange
1	ec2f0054-a44a-4dfe-b38c-2280a621a0df	version.layout	5e5c4807-e6fa-40d9-81eb-8202511d34aa	center	\N	blue	\N	flex-row	14	\N	custom	\N	/	688694d473e9e43a4a6e3c05	\N	\N	noChange
3	ec2f0054-a44a-4dfe-b38c-2280a621a0df	version.layout	9c9a756c-0a4f-4646-a0b9-e2a443c38270	center	\N	blue	\N	flex-row	01	\N	reference	\N	\N	688695d673e9e43a4a6e3c0a	\N	\N	noChange
4	ec2f0054-a44a-4dfe-b38c-2280a621a0df	version.layout	07cf7a3d-a759-43df-9071-28fb9ee65d4d	center	label	outline	\N	flex-row	06	fe54a595-3fe0-406c-8274-f5ed27ea3ec5	reference	\N	\N	68869a4d5a3935fab3feb217	\N	\N	noChange
1	96a690f0-6b75-40a2-bc6b-94e17419a077	version.layout	1317352d-e72b-4aaf-8a5d-0c9befc616d2	center	\N	blue	\N	flex-row	14	\N	custom	\N	/	688694d473e9e43a4a6e3c05	\N	\N	noChange
3	96a690f0-6b75-40a2-bc6b-94e17419a077	version.layout	1f6615c1-e248-4326-8a2e-f8516fb9867a	center	\N	blue	\N	flex-row	01	\N	reference	\N	\N	688695d673e9e43a4a6e3c0a	\N	\N	noChange
4	96a690f0-6b75-40a2-bc6b-94e17419a077	version.layout	a385da1c-0fd3-410b-a522-c02fc6351b01	center	label	outline	\N	flex-row	06	fe54a595-3fe0-406c-8274-f5ed27ea3ec5	reference	\N	\N	68869a4d5a3935fab3feb217	\N	2-8%	noChange
1	af90617d-cf5f-4812-afb8-2a0dfd9fdc12	version.layout	bac3fb68-74ef-420e-93e6-1eff7e95d3ce	center	\N	blue	\N	flex-row	14	\N	custom	\N	/	688694d473e9e43a4a6e3c05	\N	\N	noChange
1	31b5ae11-e3c5-4e2b-b6a6-24aaabf8f28a	version.layout	15b388bd-e3fd-41ed-9fc1-822af5211713	center	\N	blue	\N	flex-row	14	\N	custom	\N	/	688694d473e9e43a4a6e3c05	\N	\N	noChange
1	41c60df7-54ab-4683-8983-1204117e7975	version.layout	46454ef3-65c7-4632-8f01-215ed82a427f	center	\N	blue	\N	flex-row	14	\N	custom	\N	/	688694d473e9e43a4a6e3c05	\N	\N	noChange
4	41c60df7-54ab-4683-8983-1204117e7975	version.layout	56f8f63a-0e2e-402b-b772-c89f7c7a9756	center	\N	\N	\N	flex-row	01	\N	reference	\N	\N	688695d673e9e43a4a6e3c0a	\N	\N	noChange
5	41c60df7-54ab-4683-8983-1204117e7975	version.layout	1132ed46-917d-4372-b727-9edce818d049	center	label	outline	\N	flex-row	06	fe54a595-3fe0-406c-8274-f5ed27ea3ec5	reference	\N	\N	68869a4d5a3935fab3feb217	\N	2-8%	noChange
6	41c60df7-54ab-4683-8983-1204117e7975	version.layout	a173d6f1-ba4a-49e9-bd25-47ebab316458	center	\N	blue	\N	flex-row	04	\N	reference	\N	\N	68869d495a3935fab3feb219	\N	\N	noChange
1	deefcd27-f08b-46fa-8843-0703ff59e6cc	version.layout	b31806a0-8f44-4a3f-ab52-13e2f4a99762	center	\N	blue	\N	flex-row	14	\N	custom	\N	/	688694d473e9e43a4a6e3c05	\N	\N	noChange
4	deefcd27-f08b-46fa-8843-0703ff59e6cc	version.layout	b290ce6b-78fb-463b-9742-08a65cec043d	center	\N	\N	\N	flex-row	01	\N	reference	\N	\N	688695d673e9e43a4a6e3c0a	\N	\N	noChange
5	deefcd27-f08b-46fa-8843-0703ff59e6cc	version.layout	b63b9079-37b6-4dda-89bc-1259fb37d7b6	center	label	outline	\N	flex-row	06	fe54a595-3fe0-406c-8274-f5ed27ea3ec5	reference	\N	\N	68869a4d5a3935fab3feb217	\N	2-8%	noChange
6	deefcd27-f08b-46fa-8843-0703ff59e6cc	version.layout	7fae5c52-ffa9-4dac-b947-eec589801593	center	\N	blue	\N	flex-row	04	\N	reference	\N	\N	68869d495a3935fab3feb219	\N	\N	noChange
1	eb75a85f-8a75-4ada-b510-fbd186ded5fd	version.layout	ba0783e6-c519-4a44-9774-831ed30f1fb7	center	label	gray	\N	flex-row	07	\N	reference	\N	\N	68869c85f3705a4904040d2e	\N	\N	noChange
1	df25eab2-1f33-408c-930f-d845fabe2a9a	version.layout	b5e7e13a-a98b-414b-a7f2-268e3874576d	center	\N	blue	\N	flex-row	14	\N	custom	\N	/	688694d473e9e43a4a6e3c05	\N	\N	noChange
3	df25eab2-1f33-408c-930f-d845fabe2a9a	version.layout	a9f1a598-da7b-4f8d-9d7b-0399af89ba80	center	\N	blue	\N	flex-row	01	\N	reference	\N	\N	688695d673e9e43a4a6e3c0a	\N	\N	noChange
1	1aa29553-e446-407b-b3c0-5c37067f4c85	version.layout	e5353952-1c2d-433f-8bad-e68df70414c5	center	\N	blue	\N	flex-row	14	\N	custom	\N	/	688694d473e9e43a4a6e3c05	\N	\N	noChange
3	1aa29553-e446-407b-b3c0-5c37067f4c85	version.layout	2a08ee31-aebf-4a35-8b1c-9579ef7cf2bd	center	\N	blue	\N	flex-row	01	\N	reference	\N	\N	688695d673e9e43a4a6e3c0a	\N	\N	noChange
1	b8643aac-9e6d-40cb-960a-50219579096e	version.layout	36f410c0-5ec3-423d-87ca-147158eb1591	center	\N	blue	\N	flex-row	14	\N	custom	\N	/	688694d473e9e43a4a6e3c05	\N	\N	noChange
3	b8643aac-9e6d-40cb-960a-50219579096e	version.layout	8868477e-1609-417c-9fae-90ee3ae13fd9	center	label	blue	\N	flex-row	01	\N	reference	\N	\N	688695d673e9e43a4a6e3c0a	\N	\N	noChange
4	b8643aac-9e6d-40cb-960a-50219579096e	version.layout	3050c2c8-3df9-45cb-ac09-f74a3daeffeb	center	label	outline	\N	flex-row	06	fe54a595-3fe0-406c-8274-f5ed27ea3ec5	reference	\N	\N	68869a4d5a3935fab3feb217	\N	2-8%	noChange
1	bf780b52-7054-4988-a733-0d397f0f0b3a	version.layout	ae49845c-06aa-4775-ae77-72978daea63b	center	\N	blue	\N	flex-row	14	\N	custom	\N	/	688694d473e9e43a4a6e3c05	\N	\N	noChange
3	bf780b52-7054-4988-a733-0d397f0f0b3a	version.layout	1a0d44e7-09b4-428c-b9e3-b9fdf2affbb0	center	label	outline	\N	flex-row	01	\N	reference	\N	\N	688695d673e9e43a4a6e3c0a	\N	\N	noChange
4	bf780b52-7054-4988-a733-0d397f0f0b3a	version.layout	b990d3b5-b34f-4a45-8ac8-fe54c835f362	center	label	outline	\N	flex-row	06	fe54a595-3fe0-406c-8274-f5ed27ea3ec5	reference	\N	\N	68869a4d5a3935fab3feb217	\N	2-8%	noChange
1	5d7acef8-c5c7-41df-b43a-b0a7019f4c57	version.layout	3e5d3e77-f3ae-480b-a93f-8b516bc36f93	center	\N	blue	\N	flex-row	14	\N	custom	\N	/	688694d473e9e43a4a6e3c05	\N	\N	noChange
3	5d7acef8-c5c7-41df-b43a-b0a7019f4c57	version.layout	3c356f56-872c-419a-80ba-c81a331f411e	center	\N	\N	\N	flex-row	01	\N	reference	\N	\N	688695d673e9e43a4a6e3c0a	\N	\N	noChange
4	5d7acef8-c5c7-41df-b43a-b0a7019f4c57	version.layout	b22e3667-5c16-4675-bc1b-ed570dff6019	center	label	outline	\N	flex-row	06	fe54a595-3fe0-406c-8274-f5ed27ea3ec5	reference	\N	\N	68869a4d5a3935fab3feb217	\N	2-8%	noChange
\.


--
-- Data for Name: _featuresBlock_v_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_featuresBlock_v_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant", "_uuid") FROM stdin;
\.


--
-- Data for Name: _featuresBlock_v_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_featuresBlock_v_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _featuresBlock_v_columns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_featuresBlock_v_columns" ("_order", "_parent_id", "id", "size", "icon", "enable_badge", "enable_cta", "reverse_order", "badge_type", "badge_color", "badge_icon", "badge_icon_position", "link_type", "link_new_tab", "link_url", "_uuid", "stat_value", "stat_indicator") FROM stdin;
1	5e5c4807-e6fa-40d9-81eb-8202511d34aa	94eb72fa-c8f6-4765-b8e2-c3ea1fe1bf0c	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694e973e9e43a4a6e3c06	\N	noChange
2	5e5c4807-e6fa-40d9-81eb-8202511d34aa	5359852d-caf3-4f18-95d5-1259b5f5f653	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694f973e9e43a4a6e3c07	\N	noChange
3	5e5c4807-e6fa-40d9-81eb-8202511d34aa	fa9e3381-9218-49d6-931f-c39c5560bd21	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6886950873e9e43a4a6e3c08	\N	noChange
1	9c9a756c-0a4f-4646-a0b9-e2a443c38270	d4e1ef89-18e0-45e2-a399-e8ef7aabf913	full	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688695df73e9e43a4a6e3c0b	6 ريال	noChange
2	9c9a756c-0a4f-4646-a0b9-e2a443c38270	15cba7b8-cbcf-4a14-a3c4-3ab0b2085e3c	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	6886984273e9e43a4a6e3c0d	+32%	noChange
3	9c9a756c-0a4f-4646-a0b9-e2a443c38270	c4494c44-e7f3-46c3-97fc-378fe1e62bf1	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	688698ec5a3935fab3feb215	15-30%	noChange
1	1317352d-e72b-4aaf-8a5d-0c9befc616d2	edd11ccd-8f0c-43f7-b912-2029a46c784e	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694e973e9e43a4a6e3c06	\N	noChange
2	1317352d-e72b-4aaf-8a5d-0c9befc616d2	cd5e386e-4803-4158-aa22-d7987a2d4aa3	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694f973e9e43a4a6e3c07	\N	noChange
3	1317352d-e72b-4aaf-8a5d-0c9befc616d2	bfabc0af-faaf-4901-bd36-91d2b512d9de	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6886950873e9e43a4a6e3c08	\N	noChange
1	1f6615c1-e248-4326-8a2e-f8516fb9867a	dc702711-257b-4205-af38-d4300869fae9	full	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688695df73e9e43a4a6e3c0b	6 ريال	noChange
2	1f6615c1-e248-4326-8a2e-f8516fb9867a	9825c273-0e35-4b0f-8d47-0b3d8bc6a3e7	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	6886984273e9e43a4a6e3c0d	+32%	noChange
3	1f6615c1-e248-4326-8a2e-f8516fb9867a	f5d1b651-36ed-464a-b967-bcaaeaab9581	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	688698ec5a3935fab3feb215	15-30%	noChange
1	3fa30a41-58b5-40cc-9ce2-791c0c965a7a	fa27dacb-dca3-45a2-a5bf-7bbcc597e1d4	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694e973e9e43a4a6e3c06	\N	noChange
2	3fa30a41-58b5-40cc-9ce2-791c0c965a7a	65503d7b-857c-4218-b37b-b2505576f095	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694f973e9e43a4a6e3c07	\N	noChange
3	3fa30a41-58b5-40cc-9ce2-791c0c965a7a	77260aa5-f711-4ad0-b879-af7a8c5dc912	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6886950873e9e43a4a6e3c08	\N	noChange
1	e6769cfa-6f93-4afa-9e68-885c9841d287	7f5ed49e-9fa8-40b6-b7fa-506f47db2428	full	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	688695df73e9e43a4a6e3c0b	6 ريال	noChange
2	e6769cfa-6f93-4afa-9e68-885c9841d287	a88821f4-28a3-4b6f-9944-1accd9921b04	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	6886984273e9e43a4a6e3c0d	+32%	noChange
3	e6769cfa-6f93-4afa-9e68-885c9841d287	8eb835d3-090b-482c-a845-10b68a1190bf	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	688698ec5a3935fab3feb215	15-30%	noChange
1	8b134f9f-34b0-45c7-8d7b-976bfb31d015	d0777921-1d13-40cb-96fe-a46cca3db328	half	\N	\N	t	\N	\N	blue	\N	flex-row	reference	\N	\N	68869d6c5a3935fab3feb21a	\N	noChange
1	44281774-c31a-4e3d-b3de-5b674d2cad28	8f2d4ab9-6096-4b66-88de-12f6a9c16199	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694e973e9e43a4a6e3c06	\N	noChange
2	44281774-c31a-4e3d-b3de-5b674d2cad28	8319e5ce-fc5d-42e3-9a14-8887f75ea880	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694f973e9e43a4a6e3c07	\N	noChange
3	44281774-c31a-4e3d-b3de-5b674d2cad28	40afaa72-bd12-4471-bd20-1e6454476754	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6886950873e9e43a4a6e3c08	\N	noChange
1	1f9288ca-eb52-4e04-8e7a-d438f1edbcec	1713973a-7258-49a9-8939-2cacad23ec70	full	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	688695df73e9e43a4a6e3c0b	6 ريال	noChange
2	1f9288ca-eb52-4e04-8e7a-d438f1edbcec	d002c745-4693-4f07-821e-bcd34e0c3304	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	6886984273e9e43a4a6e3c0d	+32%	noChange
3	1f9288ca-eb52-4e04-8e7a-d438f1edbcec	1ad6a84d-6206-429e-8cca-fbbd54205f87	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	688698ec5a3935fab3feb215	15-30%	noChange
1	fed991c5-d671-4e5a-af30-8459b82fcee9	96edd338-bec1-4e96-90b4-073e982f4213	half	\N	\N	t	\N	\N	blue	\N	flex-row	reference	\N	\N	68869d6c5a3935fab3feb21a	\N	noChange
1	bac3fb68-74ef-420e-93e6-1eff7e95d3ce	b9c2b68c-1b47-41e6-abf7-8cd6fabdd164	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694e973e9e43a4a6e3c06	\N	noChange
2	bac3fb68-74ef-420e-93e6-1eff7e95d3ce	50d3f2fd-7645-41e9-894d-4b6af0a986bd	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694f973e9e43a4a6e3c07	\N	noChange
3	bac3fb68-74ef-420e-93e6-1eff7e95d3ce	97260979-a9b9-4c26-8398-bfa7f611bf53	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6886950873e9e43a4a6e3c08	\N	noChange
1	15b388bd-e3fd-41ed-9fc1-822af5211713	eec23704-4dbe-44de-9b2d-3ebb34051d01	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694e973e9e43a4a6e3c06	\N	noChange
2	15b388bd-e3fd-41ed-9fc1-822af5211713	aeea19e7-25c8-41d5-b294-e270b287838b	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694f973e9e43a4a6e3c07	\N	noChange
3	15b388bd-e3fd-41ed-9fc1-822af5211713	a281c3a2-50c2-4dac-be5b-424b137702d5	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6886950873e9e43a4a6e3c08	\N	noChange
1	b5e7e13a-a98b-414b-a7f2-268e3874576d	e68086b9-e64b-4dab-b53b-c0bbc6fca218	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694e973e9e43a4a6e3c06	\N	noChange
2	b5e7e13a-a98b-414b-a7f2-268e3874576d	5607e054-416a-47f0-9078-7734f47eb31d	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694f973e9e43a4a6e3c07	\N	noChange
3	b5e7e13a-a98b-414b-a7f2-268e3874576d	7777dc4b-c913-4a1d-80e0-13cd26555e1b	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6886950873e9e43a4a6e3c08	\N	noChange
1	a9f1a598-da7b-4f8d-9d7b-0399af89ba80	af829656-9761-44c3-a048-39df92805c0d	full	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688695df73e9e43a4a6e3c0b	6 ريال	noChange
2	a9f1a598-da7b-4f8d-9d7b-0399af89ba80	3db49a0c-a4de-4b4a-82ee-abbb9a343d09	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6886984273e9e43a4a6e3c0d	+32%	noChange
3	a9f1a598-da7b-4f8d-9d7b-0399af89ba80	67d8a970-8d9c-4147-9641-d4dc6431ea5a	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688698ec5a3935fab3feb215	15-30%	noChange
1	e5353952-1c2d-433f-8bad-e68df70414c5	28cf1a1f-2bd2-4cca-804c-3e5b6597ccf5	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694e973e9e43a4a6e3c06	\N	noChange
2	e5353952-1c2d-433f-8bad-e68df70414c5	38ac7103-9dba-49de-adf0-03028058b0a6	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694f973e9e43a4a6e3c07	\N	noChange
3	e5353952-1c2d-433f-8bad-e68df70414c5	14c7cb33-b4f0-496d-99bd-dd627007d26c	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6886950873e9e43a4a6e3c08	\N	noChange
1	2a08ee31-aebf-4a35-8b1c-9579ef7cf2bd	4bd1920f-1a22-4864-80fd-5dc34e4eac86	full	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688695df73e9e43a4a6e3c0b	6 ريال	noChange
2	2a08ee31-aebf-4a35-8b1c-9579ef7cf2bd	37df3531-d22c-4af1-b4a5-83e1ebef8df4	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6886984273e9e43a4a6e3c0d	+32%	noChange
3	2a08ee31-aebf-4a35-8b1c-9579ef7cf2bd	e938479f-6695-43b6-8c5d-4347c0736370	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688698ec5a3935fab3feb215	15-30%	noChange
1	502e24a6-4e0f-4013-814a-b50d6023250b	45c96df7-dce8-4703-ac4d-419251174a24	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694e973e9e43a4a6e3c06	\N	noChange
2	502e24a6-4e0f-4013-814a-b50d6023250b	b15e4a76-8320-43f2-af85-98954d1c160e	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694f973e9e43a4a6e3c07	\N	noChange
3	502e24a6-4e0f-4013-814a-b50d6023250b	61de7676-340d-4c6a-8f95-82c935f8a95a	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6886950873e9e43a4a6e3c08	\N	noChange
1	2419edc0-cfc5-4cff-8a15-7b261ac9b072	dbf8de24-b554-4eb9-8039-a8d3f9e4ca44	full	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688695df73e9e43a4a6e3c0b	6 ريال	noChange
2	2419edc0-cfc5-4cff-8a15-7b261ac9b072	38d318d2-2394-4ec2-8035-55e2c2a2995c	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	6886984273e9e43a4a6e3c0d	+32%	noChange
3	2419edc0-cfc5-4cff-8a15-7b261ac9b072	c42b6d40-c72d-4ac0-9253-50505d62ad80	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	688698ec5a3935fab3feb215	15-30%	noChange
1	36f410c0-5ec3-423d-87ca-147158eb1591	5e07fdce-4bdb-4a89-a993-0fb02a7575a3	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694e973e9e43a4a6e3c06	\N	noChange
2	36f410c0-5ec3-423d-87ca-147158eb1591	122a37de-86d9-4406-9f48-17ea40ba9aad	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694f973e9e43a4a6e3c07	\N	noChange
3	36f410c0-5ec3-423d-87ca-147158eb1591	417aa0c9-5a23-4153-996d-63ff6c0604e1	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6886950873e9e43a4a6e3c08	\N	noChange
1	8868477e-1609-417c-9fae-90ee3ae13fd9	38861a89-5f24-4051-b444-23587e2d1470	full	\N	f	\N	\N	label	blue	\N	flex-row	reference	\N	\N	688695df73e9e43a4a6e3c0b	6 ريال	noChange
2	8868477e-1609-417c-9fae-90ee3ae13fd9	03ce5ad4-31e3-494d-ad04-a1e63cdb33b8	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	6886984273e9e43a4a6e3c0d	+32%	noChange
3	8868477e-1609-417c-9fae-90ee3ae13fd9	74c0880c-ecbc-4a46-89af-1f633cb6fff9	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	688698ec5a3935fab3feb215	15-30%	noChange
1	ae49845c-06aa-4775-ae77-72978daea63b	03f70f1e-4f59-41a9-8e1f-e0ab67bf10fb	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694e973e9e43a4a6e3c06	\N	noChange
2	ae49845c-06aa-4775-ae77-72978daea63b	babdb403-db4a-4eba-b5da-3a9090c1735d	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694f973e9e43a4a6e3c07	\N	noChange
3	ae49845c-06aa-4775-ae77-72978daea63b	18453d0f-ded3-490c-b1cd-82cc3f89714f	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6886950873e9e43a4a6e3c08	\N	noChange
1	1a0d44e7-09b4-428c-b9e3-b9fdf2affbb0	3c45bd9e-f5ec-455a-bd15-b53e7ce125d9	full	\N	f	\N	\N	label	blue	\N	flex-row	reference	\N	\N	688695df73e9e43a4a6e3c0b	6 ريال	noChange
2	1a0d44e7-09b4-428c-b9e3-b9fdf2affbb0	8f45e4a1-af6c-4530-833b-036465ca8ebe	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	6886984273e9e43a4a6e3c0d	+32%	noChange
3	1a0d44e7-09b4-428c-b9e3-b9fdf2affbb0	451ef1bd-0607-4a4e-8ec1-ab4d66be04df	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	688698ec5a3935fab3feb215	15-30%	noChange
1	3e5d3e77-f3ae-480b-a93f-8b516bc36f93	989a490b-e148-4718-a1d7-3313610dd7ad	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694e973e9e43a4a6e3c06	\N	noChange
2	3e5d3e77-f3ae-480b-a93f-8b516bc36f93	267f7c9a-0d0a-4d8b-8c5c-d5cae3b354d2	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694f973e9e43a4a6e3c07	\N	noChange
3	3e5d3e77-f3ae-480b-a93f-8b516bc36f93	027a48ae-6238-46a3-945b-f28532e068a5	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6886950873e9e43a4a6e3c08	\N	noChange
1	3c356f56-872c-419a-80ba-c81a331f411e	c58d26ec-abd3-4d02-bed8-02be5bcffd52	full	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	688695df73e9e43a4a6e3c0b	6 ريال	noChange
2	3c356f56-872c-419a-80ba-c81a331f411e	a4a6e6ee-88a8-4133-88b3-337e0d5e9b26	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	6886984273e9e43a4a6e3c0d	+32%	noChange
3	3c356f56-872c-419a-80ba-c81a331f411e	66525287-a9c0-467b-b8a3-a99d05047e30	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	688698ec5a3935fab3feb215	15-30%	noChange
1	46454ef3-65c7-4632-8f01-215ed82a427f	26e296ab-f4ed-4686-ab57-5cab29d3d04f	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694e973e9e43a4a6e3c06	\N	noChange
2	46454ef3-65c7-4632-8f01-215ed82a427f	4f664156-f650-4fdf-960e-3cc178372a32	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694f973e9e43a4a6e3c07	\N	noChange
3	46454ef3-65c7-4632-8f01-215ed82a427f	303006bd-f883-4202-b75a-1a6feb87f8be	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6886950873e9e43a4a6e3c08	\N	noChange
1	56f8f63a-0e2e-402b-b772-c89f7c7a9756	9eca749e-ce4e-4931-a7f8-eceacf7cfeab	full	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	688695df73e9e43a4a6e3c0b	6 ريال	noChange
2	56f8f63a-0e2e-402b-b772-c89f7c7a9756	8365da68-bebd-4077-a711-9956ee1c99a3	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	6886984273e9e43a4a6e3c0d	+32%	noChange
3	56f8f63a-0e2e-402b-b772-c89f7c7a9756	237beef4-d911-44d7-b7ad-4aaae2478a8e	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	688698ec5a3935fab3feb215	15-30%	noChange
1	a173d6f1-ba4a-49e9-bd25-47ebab316458	7513d516-7ac5-448b-b694-fb2e8d447f22	half	\N	\N	t	\N	\N	blue	\N	flex-row	custom	\N	/	68869d6c5a3935fab3feb21a	\N	noChange
1	b31806a0-8f44-4a3f-ab52-13e2f4a99762	ca72e0fd-c041-45ab-b1eb-b157d43c90e3	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694e973e9e43a4a6e3c06	\N	noChange
2	b31806a0-8f44-4a3f-ab52-13e2f4a99762	f98f465e-71f5-4102-8f65-e39acda8fd74	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	688694f973e9e43a4a6e3c07	\N	noChange
3	b31806a0-8f44-4a3f-ab52-13e2f4a99762	9b40ba8e-5f97-46ba-b0e0-68c82fd1c195	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6886950873e9e43a4a6e3c08	\N	noChange
1	b290ce6b-78fb-463b-9742-08a65cec043d	3b3f7463-4934-4ade-868f-5cab47f45825	full	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	688695df73e9e43a4a6e3c0b	6 ريال	noChange
2	b290ce6b-78fb-463b-9742-08a65cec043d	be75b1f3-efa3-4c4e-96f5-1141ed154a70	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	6886984273e9e43a4a6e3c0d	+32%	noChange
3	b290ce6b-78fb-463b-9742-08a65cec043d	fdc53398-ffa8-4520-ba41-d700d71c6d24	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	688698ec5a3935fab3feb215	15-30%	noChange
1	7fae5c52-ffa9-4dac-b947-eec589801593	478568a5-2651-44bb-bb4e-649054bf3129	half	\N	\N	t	\N	\N	blue	\N	flex-row	custom	\N	/	68869d6c5a3935fab3feb21a	\N	noChange
\.


--
-- Data for Name: _featuresBlock_v_columns_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_featuresBlock_v_columns_locales" ("image_id", "tab_label", "content_title", "content_subtitle", "rich_text_content", "badge_label", "link_label", "id", "_locale", "_parent_id", "stat_label") FROM stdin;
f8f05216-7b1e-4f38-9c78-712c86d1057c	\N	كل بياناتك في مكان واحد، من الكاشير الى تطبيقات التوصيل	\N	\N	\N	\N	445	ar	94eb72fa-c8f6-4765-b8e2-c3ea1fe1bf0c	\N
edbc376c-731b-4c47-8220-478db6cd03e4	\N	اطلق حملاتك التسويقية بطريقة اذكى ومدروسة	\N	\N	\N	\N	446	ar	5359852d-caf3-4f18-95d5-1259b5f5f653	\N
712fc138-f7e2-48e4-bcc8-5e24ff9e79b7	\N	استرجع مبالغ التعويضات المفقودة وانت مرتاح	\N	\N	\N	\N	447	ar	fa9e3381-9218-49d6-931f-c39c5560bd21	\N
cd2d9b5d-5b74-4846-b1eb-85e3535f944a	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "حدّد أفضل وقت، قناة، ونسبة خصم لعروضك الترويجية", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "محركنا يحلل الطلبات عبر HungerStation و Jahez و Careem والمزيد ليخبرك متى تطلق، وأين تظهر، وأي عرض يحقق أفضل اداء بدون هدر الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	448	ar	d4e1ef89-18e0-45e2-a399-e8ef7aabf913	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
5b3e3903-897a-4182-a331-61f448da95d0	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "افهم وش قاعد يصير، اول باول", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	لوحة أداء شاملة	\N	449	ar	15cba7b8-cbcf-4a14-a3c4-3ab0b2085e3c	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
7a8a5f6d-dc53-40ab-9daa-217ee1027234	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تفصيل الإيرادات حسب القناة والفرع لسهولة المقارنة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	وضوح المؤشرات المهمة	\N	450	ar	c4494c44-e7f3-46c3-97fc-378fe1e62bf1	زيادة فعلية في الإيرادات بعد استخدام بلّورة
f8f05216-7b1e-4f38-9c78-712c86d1057c	\N	كل بياناتك في مكان واحد، من الكاشير الى تطبيقات التوصيل	\N	\N	\N	\N	451	ar	edd11ccd-8f0c-43f7-b912-2029a46c784e	\N
edbc376c-731b-4c47-8220-478db6cd03e4	\N	اطلق حملاتك التسويقية بطريقة اذكى ومدروسة	\N	\N	\N	\N	452	ar	cd5e386e-4803-4158-aa22-d7987a2d4aa3	\N
712fc138-f7e2-48e4-bcc8-5e24ff9e79b7	\N	استرجع مبالغ التعويضات المفقودة وانت مرتاح	\N	\N	\N	\N	453	ar	bfabc0af-faaf-4901-bd36-91d2b512d9de	\N
cd2d9b5d-5b74-4846-b1eb-85e3535f944a	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "حدّد أفضل وقت، قناة، ونسبة خصم لعروضك الترويجية", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "محركنا يحلل الطلبات عبر HungerStation و Jahez و Careem والمزيد ليخبرك متى تطلق، وأين تظهر، وأي عرض يحقق أفضل اداء بدون هدر الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	454	ar	dc702711-257b-4205-af38-d4300869fae9	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
5b3e3903-897a-4182-a331-61f448da95d0	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "افهم وش قاعد يصير، اول باول", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	لوحة أداء شاملة	\N	455	ar	9825c273-0e35-4b0f-8d47-0b3d8bc6a3e7	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
7a8a5f6d-dc53-40ab-9daa-217ee1027234	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تفصيل الإيرادات حسب القناة والفرع لسهولة المقارنة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	وضوح المؤشرات المهمة	\N	456	ar	f5d1b651-36ed-464a-b967-bcaaeaab9581	زيادة فعلية في الإيرادات بعد استخدام بلّورة
f8f05216-7b1e-4f38-9c78-712c86d1057c	\N	كل بياناتك في مكان واحد، من الكاشير الى تطبيقات التوصيل	\N	\N	\N	\N	697	ar	fa27dacb-dca3-45a2-a5bf-7bbcc597e1d4	\N
edbc376c-731b-4c47-8220-478db6cd03e4	\N	اطلق حملاتك التسويقية بطريقة اذكى ومدروسة	\N	\N	\N	\N	698	ar	65503d7b-857c-4218-b37b-b2505576f095	\N
712fc138-f7e2-48e4-bcc8-5e24ff9e79b7	\N	استرجع مبالغ التعويضات المفقودة وانت مرتاح	\N	\N	\N	\N	699	ar	77260aa5-f711-4ad0-b879-af7a8c5dc912	\N
f8f05216-7b1e-4f38-9c78-712c86d1057c	\N	كل بياناتك في مكان واحد، من الكاشير الى تطبيقات التوصيل	\N	\N	\N	\N	26	ar	b9c2b68c-1b47-41e6-abf7-8cd6fabdd164	\N
edbc376c-731b-4c47-8220-478db6cd03e4	\N	اطلق حملاتك التسويقية بطريقة اذكى ومدروسة	\N	\N	\N	\N	27	ar	50d3f2fd-7645-41e9-894d-4b6af0a986bd	\N
712fc138-f7e2-48e4-bcc8-5e24ff9e79b7	\N	استرجع مبالغ التعويضات المفقودة وانت مرتاح	\N	\N	\N	\N	28	ar	97260979-a9b9-4c26-8398-bfa7f611bf53	\N
f8f05216-7b1e-4f38-9c78-712c86d1057c	\N	كل بياناتك في مكان واحد، من الكاشير الى تطبيقات التوصيل	\N	\N	\N	\N	29	ar	eec23704-4dbe-44de-9b2d-3ebb34051d01	\N
edbc376c-731b-4c47-8220-478db6cd03e4	\N	اطلق حملاتك التسويقية بطريقة اذكى ومدروسة	\N	\N	\N	\N	30	ar	aeea19e7-25c8-41d5-b294-e270b287838b	\N
712fc138-f7e2-48e4-bcc8-5e24ff9e79b7	\N	استرجع مبالغ التعويضات المفقودة وانت مرتاح	\N	\N	\N	\N	31	ar	a281c3a2-50c2-4dac-be5b-424b137702d5	\N
cd2d9b5d-5b74-4846-b1eb-85e3535f944a	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "حدّد أفضل وقت، قناة، ونسبة خصم لعروضك الترويجية", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "محركنا يحلل الطلبات عبر HungerStation و Jahez و Careem والمزيد ليخبرك متى تطلق، وأين تظهر، وأي عرض يحقق أفضل اداء بدون هدر الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	إعداد عروض مستهدفة 	\N	700	ar	7f5ed49e-9fa8-40b6-b7fa-506f47db2428	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
5b3e3903-897a-4182-a331-61f448da95d0	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "افهم وش قاعد يصير، اول باول", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	لوحة أداء شاملة	\N	701	ar	a88821f4-28a3-4b6f-9944-1accd9921b04	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
7a8a5f6d-dc53-40ab-9daa-217ee1027234	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تفصيل الإيرادات حسب القناة والفرع لسهولة المقارنة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	وضوح المؤشرات المهمة	\N	702	ar	8eb835d3-090b-482c-a845-10b68a1190bf	زيادة فعلية في الإيرادات بعد استخدام بلّورة
\N	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "احسب ارباحك المتوقعة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بنعرّفك على كل أدوات بلورة، ونطلع لك بأفكار سهلة تزيد من أرباح مطعمك... عشان تبدأ تشوف الفرق من بكرة.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	حاسبة الربحية	703	ar	d0777921-1d13-40cb-96fe-a46cca3db328	\N
f8f05216-7b1e-4f38-9c78-712c86d1057c	\N	كل بياناتك في مكان واحد، من الكاشير الى تطبيقات التوصيل	\N	\N	\N	\N	704	ar	8f2d4ab9-6096-4b66-88de-12f6a9c16199	\N
edbc376c-731b-4c47-8220-478db6cd03e4	\N	اطلق حملاتك التسويقية بطريقة اذكى ومدروسة	\N	\N	\N	\N	705	ar	8319e5ce-fc5d-42e3-9a14-8887f75ea880	\N
712fc138-f7e2-48e4-bcc8-5e24ff9e79b7	\N	استرجع مبالغ التعويضات المفقودة وانت مرتاح	\N	\N	\N	\N	706	ar	40afaa72-bd12-4471-bd20-1e6454476754	\N
cd2d9b5d-5b74-4846-b1eb-85e3535f944a	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "حدّد أفضل وقت، قناة، ونسبة خصم لعروضك الترويجية", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "محركنا يحلل الطلبات عبر HungerStation و Jahez و Careem والمزيد ليخبرك متى تطلق، وأين تظهر، وأي عرض يحقق أفضل اداء بدون هدر الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	إعداد عروض مستهدفة 	\N	707	ar	1713973a-7258-49a9-8939-2cacad23ec70	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
5b3e3903-897a-4182-a331-61f448da95d0	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "افهم وش قاعد يصير، اول باول", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	لوحة أداء شاملة	\N	708	ar	d002c745-4693-4f07-821e-bcd34e0c3304	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
7a8a5f6d-dc53-40ab-9daa-217ee1027234	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تفصيل الإيرادات حسب القناة والفرع لسهولة المقارنة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	وضوح المؤشرات المهمة	\N	709	ar	1ad6a84d-6206-429e-8cca-fbbd54205f87	زيادة فعلية في الإيرادات بعد استخدام بلّورة
\N	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "احسب ارباحك المتوقعة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بنعرّفك على كل أدوات بلورة، ونطلع لك بأفكار سهلة تزيد من أرباح مطعمك... عشان تبدأ تشوف الفرق من بكرة.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	حاسبة الربحية	710	ar	96edd338-bec1-4e96-90b4-073e982f4213	\N
f8f05216-7b1e-4f38-9c78-712c86d1057c	\N	كل بياناتك في مكان واحد، من الكاشير الى تطبيقات التوصيل	\N	\N	\N	\N	583	ar	989a490b-e148-4718-a1d7-3313610dd7ad	\N
edbc376c-731b-4c47-8220-478db6cd03e4	\N	اطلق حملاتك التسويقية بطريقة اذكى ومدروسة	\N	\N	\N	\N	584	ar	267f7c9a-0d0a-4d8b-8c5c-d5cae3b354d2	\N
712fc138-f7e2-48e4-bcc8-5e24ff9e79b7	\N	استرجع مبالغ التعويضات المفقودة وانت مرتاح	\N	\N	\N	\N	585	ar	027a48ae-6238-46a3-945b-f28532e068a5	\N
cd2d9b5d-5b74-4846-b1eb-85e3535f944a	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "حدّد أفضل وقت، قناة، ونسبة خصم لعروضك الترويجية", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "محركنا يحلل الطلبات عبر HungerStation و Jahez و Careem والمزيد ليخبرك متى تطلق، وأين تظهر، وأي عرض يحقق أفضل اداء بدون هدر الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	إعداد عروض مستهدفة 	\N	586	ar	c58d26ec-abd3-4d02-bed8-02be5bcffd52	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
5b3e3903-897a-4182-a331-61f448da95d0	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "افهم وش قاعد يصير، اول باول", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	لوحة أداء شاملة	\N	587	ar	a4a6e6ee-88a8-4133-88b3-337e0d5e9b26	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
7a8a5f6d-dc53-40ab-9daa-217ee1027234	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تفصيل الإيرادات حسب القناة والفرع لسهولة المقارنة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	وضوح المؤشرات المهمة	\N	588	ar	66525287-a9c0-467b-b8a3-a99d05047e30	زيادة فعلية في الإيرادات بعد استخدام بلّورة
f8f05216-7b1e-4f38-9c78-712c86d1057c	\N	كل بياناتك في مكان واحد، من الكاشير الى تطبيقات التوصيل	\N	\N	\N	\N	253	ar	e68086b9-e64b-4dab-b53b-c0bbc6fca218	\N
edbc376c-731b-4c47-8220-478db6cd03e4	\N	اطلق حملاتك التسويقية بطريقة اذكى ومدروسة	\N	\N	\N	\N	254	ar	5607e054-416a-47f0-9078-7734f47eb31d	\N
712fc138-f7e2-48e4-bcc8-5e24ff9e79b7	\N	استرجع مبالغ التعويضات المفقودة وانت مرتاح	\N	\N	\N	\N	255	ar	7777dc4b-c913-4a1d-80e0-13cd26555e1b	\N
cd2d9b5d-5b74-4846-b1eb-85e3535f944a	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "حدّد أفضل وقت، قناة، ونسبة خصم لعروضك الترويجية", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "محركنا يحلل الطلبات عبر HungerStation و Jahez و Careem والمزيد ليخبرك متى تطلق، وأين تظهر، وأي عرض يحقق أفضل اداء بدون هدر الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	256	ar	af829656-9761-44c3-a048-39df92805c0d	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
5b3e3903-897a-4182-a331-61f448da95d0	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "افهم وش قاعد يصير، اول باول", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	\N	257	ar	3db49a0c-a4de-4b4a-82ee-abbb9a343d09	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
7a8a5f6d-dc53-40ab-9daa-217ee1027234	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تفصيل الإيرادات حسب القناة والفرع لسهولة المقارنة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	\N	258	ar	67d8a970-8d9c-4147-9641-d4dc6431ea5a	زيادة فعلية في الإيرادات بعد استخدام بلّورة
f8f05216-7b1e-4f38-9c78-712c86d1057c	\N	كل بياناتك في مكان واحد، من الكاشير الى تطبيقات التوصيل	\N	\N	\N	\N	259	ar	28cf1a1f-2bd2-4cca-804c-3e5b6597ccf5	\N
edbc376c-731b-4c47-8220-478db6cd03e4	\N	اطلق حملاتك التسويقية بطريقة اذكى ومدروسة	\N	\N	\N	\N	260	ar	38ac7103-9dba-49de-adf0-03028058b0a6	\N
712fc138-f7e2-48e4-bcc8-5e24ff9e79b7	\N	استرجع مبالغ التعويضات المفقودة وانت مرتاح	\N	\N	\N	\N	261	ar	14c7cb33-b4f0-496d-99bd-dd627007d26c	\N
cd2d9b5d-5b74-4846-b1eb-85e3535f944a	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "حدّد أفضل وقت، قناة، ونسبة خصم لعروضك الترويجية", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "محركنا يحلل الطلبات عبر HungerStation و Jahez و Careem والمزيد ليخبرك متى تطلق، وأين تظهر، وأي عرض يحقق أفضل اداء بدون هدر الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	262	ar	4bd1920f-1a22-4864-80fd-5dc34e4eac86	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
5b3e3903-897a-4182-a331-61f448da95d0	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "افهم وش قاعد يصير، اول باول", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	\N	263	ar	37df3531-d22c-4af1-b4a5-83e1ebef8df4	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
7a8a5f6d-dc53-40ab-9daa-217ee1027234	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تفصيل الإيرادات حسب القناة والفرع لسهولة المقارنة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	\N	264	ar	e938479f-6695-43b6-8c5d-4347c0736370	زيادة فعلية في الإيرادات بعد استخدام بلّورة
f8f05216-7b1e-4f38-9c78-712c86d1057c	\N	كل بياناتك في مكان واحد، من الكاشير الى تطبيقات التوصيل	\N	\N	\N	\N	439	ar	45c96df7-dce8-4703-ac4d-419251174a24	\N
edbc376c-731b-4c47-8220-478db6cd03e4	\N	اطلق حملاتك التسويقية بطريقة اذكى ومدروسة	\N	\N	\N	\N	440	ar	b15e4a76-8320-43f2-af85-98954d1c160e	\N
712fc138-f7e2-48e4-bcc8-5e24ff9e79b7	\N	استرجع مبالغ التعويضات المفقودة وانت مرتاح	\N	\N	\N	\N	441	ar	61de7676-340d-4c6a-8f95-82c935f8a95a	\N
cd2d9b5d-5b74-4846-b1eb-85e3535f944a	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "حدّد أفضل وقت، قناة، ونسبة خصم لعروضك الترويجية", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "محركنا يحلل الطلبات عبر HungerStation و Jahez و Careem والمزيد ليخبرك متى تطلق، وأين تظهر، وأي عرض يحقق أفضل اداء بدون هدر الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	442	ar	dbf8de24-b554-4eb9-8039-a8d3f9e4ca44	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
5b3e3903-897a-4182-a331-61f448da95d0	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "افهم وش قاعد يصير، اول باول", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	لوحة أداء شاملة	\N	443	ar	38d318d2-2394-4ec2-8035-55e2c2a2995c	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
7a8a5f6d-dc53-40ab-9daa-217ee1027234	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تفصيل الإيرادات حسب القناة والفرع لسهولة المقارنة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	وضوح المؤشرات المهمة	\N	444	ar	c42b6d40-c72d-4ac0-9253-50505d62ad80	زيادة فعلية في الإيرادات بعد استخدام بلّورة
f8f05216-7b1e-4f38-9c78-712c86d1057c	\N	كل بياناتك في مكان واحد، من الكاشير الى تطبيقات التوصيل	\N	\N	\N	\N	529	ar	03f70f1e-4f59-41a9-8e1f-e0ab67bf10fb	\N
edbc376c-731b-4c47-8220-478db6cd03e4	\N	اطلق حملاتك التسويقية بطريقة اذكى ومدروسة	\N	\N	\N	\N	530	ar	babdb403-db4a-4eba-b5da-3a9090c1735d	\N
712fc138-f7e2-48e4-bcc8-5e24ff9e79b7	\N	استرجع مبالغ التعويضات المفقودة وانت مرتاح	\N	\N	\N	\N	531	ar	18453d0f-ded3-490c-b1cd-82cc3f89714f	\N
cd2d9b5d-5b74-4846-b1eb-85e3535f944a	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "حدّد أفضل وقت، قناة، ونسبة خصم لعروضك الترويجية", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "محركنا يحلل الطلبات عبر HungerStation و Jahez و Careem والمزيد ليخبرك متى تطلق، وأين تظهر، وأي عرض يحقق أفضل اداء بدون هدر الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	532	ar	3c45bd9e-f5ec-455a-bd15-b53e7ce125d9	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
5b3e3903-897a-4182-a331-61f448da95d0	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "افهم وش قاعد يصير، اول باول", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	لوحة أداء شاملة	\N	533	ar	8f45e4a1-af6c-4530-833b-036465ca8ebe	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
7a8a5f6d-dc53-40ab-9daa-217ee1027234	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تفصيل الإيرادات حسب القناة والفرع لسهولة المقارنة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	وضوح المؤشرات المهمة	\N	534	ar	451ef1bd-0607-4a4e-8ec1-ab4d66be04df	زيادة فعلية في الإيرادات بعد استخدام بلّورة
f8f05216-7b1e-4f38-9c78-712c86d1057c	\N	كل بياناتك في مكان واحد، من الكاشير الى تطبيقات التوصيل	\N	\N	\N	\N	523	ar	5e07fdce-4bdb-4a89-a993-0fb02a7575a3	\N
edbc376c-731b-4c47-8220-478db6cd03e4	\N	اطلق حملاتك التسويقية بطريقة اذكى ومدروسة	\N	\N	\N	\N	524	ar	122a37de-86d9-4406-9f48-17ea40ba9aad	\N
712fc138-f7e2-48e4-bcc8-5e24ff9e79b7	\N	استرجع مبالغ التعويضات المفقودة وانت مرتاح	\N	\N	\N	\N	525	ar	417aa0c9-5a23-4153-996d-63ff6c0604e1	\N
cd2d9b5d-5b74-4846-b1eb-85e3535f944a	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "حدّد أفضل وقت، قناة، ونسبة خصم لعروضك الترويجية", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "محركنا يحلل الطلبات عبر HungerStation و Jahez و Careem والمزيد ليخبرك متى تطلق، وأين تظهر، وأي عرض يحقق أفضل اداء بدون هدر الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	526	ar	38861a89-5f24-4051-b444-23587e2d1470	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
5b3e3903-897a-4182-a331-61f448da95d0	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "افهم وش قاعد يصير، اول باول", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	لوحة أداء شاملة	\N	527	ar	03ce5ad4-31e3-494d-ad04-a1e63cdb33b8	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
7a8a5f6d-dc53-40ab-9daa-217ee1027234	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تفصيل الإيرادات حسب القناة والفرع لسهولة المقارنة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	وضوح المؤشرات المهمة	\N	528	ar	74c0880c-ecbc-4a46-89af-1f633cb6fff9	زيادة فعلية في الإيرادات بعد استخدام بلّورة
f8f05216-7b1e-4f38-9c78-712c86d1057c	\N	كل بياناتك في مكان واحد، من الكاشير الى تطبيقات التوصيل	\N	\N	\N	\N	963	ar	26e296ab-f4ed-4686-ab57-5cab29d3d04f	\N
edbc376c-731b-4c47-8220-478db6cd03e4	\N	اطلق حملاتك التسويقية بطريقة اذكى ومدروسة	\N	\N	\N	\N	964	ar	4f664156-f650-4fdf-960e-3cc178372a32	\N
712fc138-f7e2-48e4-bcc8-5e24ff9e79b7	\N	استرجع مبالغ التعويضات المفقودة وانت مرتاح	\N	\N	\N	\N	965	ar	303006bd-f883-4202-b75a-1a6feb87f8be	\N
cd2d9b5d-5b74-4846-b1eb-85e3535f944a	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "حدّد أفضل وقت، قناة، ونسبة خصم لعروضك الترويجية", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "محركنا يحلل الطلبات عبر HungerStation و Jahez و Careem والمزيد ليخبرك متى تطلق، وأين تظهر، وأي عرض يحقق أفضل اداء بدون هدر الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	إعداد عروض مستهدفة 	\N	966	ar	9eca749e-ce4e-4931-a7f8-eceacf7cfeab	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
5b3e3903-897a-4182-a331-61f448da95d0	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "افهم وش قاعد يصير، اول باول", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	لوحة أداء شاملة	\N	967	ar	8365da68-bebd-4077-a711-9956ee1c99a3	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
7a8a5f6d-dc53-40ab-9daa-217ee1027234	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تفصيل الإيرادات حسب القناة والفرع لسهولة المقارنة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	وضوح المؤشرات المهمة	\N	968	ar	237beef4-d911-44d7-b7ad-4aaae2478a8e	زيادة فعلية في الإيرادات بعد استخدام بلّورة
\N	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "احسب ارباحك المتوقعة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بنعرّفك على كل أدوات بلورة، ونطلع لك بأفكار سهلة تزيد من أرباح مطعمك... عشان تبدأ تشوف الفرق من بكرة.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	حاسبة الربحية	969	ar	7513d516-7ac5-448b-b694-fb2e8d447f22	\N
f8f05216-7b1e-4f38-9c78-712c86d1057c	\N	كل بياناتك في مكان واحد، من الكاشير الى تطبيقات التوصيل	\N	\N	\N	\N	970	ar	ca72e0fd-c041-45ab-b1eb-b157d43c90e3	\N
edbc376c-731b-4c47-8220-478db6cd03e4	\N	اطلق حملاتك التسويقية بطريقة اذكى ومدروسة	\N	\N	\N	\N	971	ar	f98f465e-71f5-4102-8f65-e39acda8fd74	\N
712fc138-f7e2-48e4-bcc8-5e24ff9e79b7	\N	استرجع مبالغ التعويضات المفقودة وانت مرتاح	\N	\N	\N	\N	972	ar	9b40ba8e-5f97-46ba-b0e0-68c82fd1c195	\N
cd2d9b5d-5b74-4846-b1eb-85e3535f944a	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "حدّد أفضل وقت، قناة، ونسبة خصم لعروضك الترويجية", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "محركنا يحلل الطلبات عبر HungerStation و Jahez و Careem والمزيد ليخبرك متى تطلق، وأين تظهر، وأي عرض يحقق أفضل اداء بدون هدر الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	إعداد عروض مستهدفة 	\N	973	ar	3b3f7463-4934-4ade-868f-5cab47f45825	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
5b3e3903-897a-4182-a331-61f448da95d0	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "افهم وش قاعد يصير، اول باول", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	لوحة أداء شاملة	\N	974	ar	be75b1f3-efa3-4c4e-96f5-1141ed154a70	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
7a8a5f6d-dc53-40ab-9daa-217ee1027234	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تفصيل الإيرادات حسب القناة والفرع لسهولة المقارنة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	وضوح المؤشرات المهمة	\N	975	ar	fdc53398-ffa8-4520-ba41-d700d71c6d24	زيادة فعلية في الإيرادات بعد استخدام بلّورة
\N	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "احسب ارباحك المتوقعة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بنعرّفك على كل أدوات بلورة، ونطلع لك بأفكار سهلة تزيد من أرباح مطعمك... عشان تبدأ تشوف الفرق من بكرة.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	حاسبة الربحية	976	ar	478568a5-2651-44bb-bb4e-649054bf3129	\N
\.


--
-- Data for Name: _featuresBlock_v_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_featuresBlock_v_locales" ("block_header_badge_label", "block_header_header_text", "c_t_a_label", "link_label", "id", "_locale", "_parent_id", "stat_label") FROM stdin;
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ليش تستخدم بلّورة؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	/	187	ar	1317352d-e72b-4aaf-8a5d-0c9befc616d2	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " زِد ظهورك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " بلّورة تساعدك تزيد ظهورك في الأوقات والمناطق الصح، بدون هدر في الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	188	ar	1f6615c1-e248-4326-8a2e-f8516fb9867a	\N
استرجاع تلقائي للمبالغ	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "استرجع مبالغ الخصومات الخاطئة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ووّفر صافي أرباحك", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " نساعدك تراجع الخصومات، تعترض على الأخطاء، وتسترجع اللي لك من تطبيقات التوصيل — بخطوات واضحة وسهلة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	189	ar	a385da1c-0fd3-410b-a522-c02fc6351b01	من إيرادات الطلبات تقدر تسترجعها من خلال معالجة أخطاء الخصومات على بلّورة
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ليش تستخدم بلّورة؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	/	16	ar	bac3fb68-74ef-420e-93e6-1eff7e95d3ce	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ليش تستخدم بلّورة؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	/	17	ar	15b388bd-e3fd-41ed-9fc1-822af5211713	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ليش تستخدم بلّورة؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	/	184	ar	5e5c4807-e6fa-40d9-81eb-8202511d34aa	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " زِد ظهورك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " بلّورة تساعدك تزيد ظهورك في الأوقات والمناطق الصح، بدون هدر في الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	185	ar	9c9a756c-0a4f-4646-a0b9-e2a443c38270	\N
استرجاع تلقائي للمبالغ	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "استرجع مبالغ الخصومات الخاطئة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ووّفر صافي أرباحك", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " نساعدك تراجع الخصومات، تعترض على الأخطاء، وتسترجع اللي لك من تطبيقات التوصيل — بخطوات واضحة وسهلة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	186	ar	07cf7a3d-a759-43df-9071-28fb9ee65d4d	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " زِد ظهورك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " بلّورة تساعدك تزيد ظهورك في الأوقات والمناطق الصح، بدون هدر في الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	111	ar	2a08ee31-aebf-4a35-8b1c-9579ef7cf2bd	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ليش تستخدم بلّورة؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	/	181	ar	502e24a6-4e0f-4013-814a-b50d6023250b	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " زِد ظهورك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " بلّورة تساعدك تزيد ظهورك في الأوقات والمناطق الصح، بدون هدر في الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	182	ar	2419edc0-cfc5-4cff-8a15-7b261ac9b072	\N
استرجاع تلقائي للمبالغ	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "استرجع مبالغ الخصومات الخاطئة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ووّفر صافي أرباحك", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " نساعدك تراجع الخصومات، تعترض على الأخطاء، وتسترجع اللي لك من تطبيقات التوصيل — بخطوات واضحة وسهلة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	183	ar	41627b7c-924b-4f28-bf3e-3b291c34db18	من إيرادات الطلبات تقدر تسترجعها من خلال معالجة أخطاء الخصومات على بلّورة
مهمتنا	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تحسين الإيرادات وهوامش الربح لمطاعم والشركات عبر قنوات المبيعات عبر الإنترنت وخارجها", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	\N	332	ar	ba0783e6-c519-4a44-9774-831ed30f1fb7	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ليش تستخدم بلّورة؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	/	108	ar	b5e7e13a-a98b-414b-a7f2-268e3874576d	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " زِد ظهورك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " بلّورة تساعدك تزيد ظهورك في الأوقات والمناطق الصح، بدون هدر في الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	109	ar	a9f1a598-da7b-4f8d-9d7b-0399af89ba80	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ليش تستخدم بلّورة؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	/	110	ar	e5353952-1c2d-433f-8bad-e68df70414c5	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ليش تستخدم بلّورة؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	/	226	ar	ae49845c-06aa-4775-ae77-72978daea63b	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ليش تستخدم بلّورة؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	/	223	ar	36f410c0-5ec3-423d-87ca-147158eb1591	\N
إعداد عروض مستهدفة 	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " زِد ظهورك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " بلّورة تساعدك تزيد ظهورك في الأوقات والمناطق الصح، بدون هدر في الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	224	ar	8868477e-1609-417c-9fae-90ee3ae13fd9	\N
استرجاع تلقائي للمبالغ	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "استرجع مبالغ الخصومات الخاطئة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ووّفر صافي أرباحك", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " نساعدك تراجع الخصومات، تعترض على الأخطاء، وتسترجع اللي لك من تطبيقات التوصيل — بخطوات واضحة وسهلة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	225	ar	3050c2c8-3df9-45cb-ac09-f74a3daeffeb	من إيرادات الطلبات تقدر تسترجعها من خلال معالجة أخطاء الخصومات على بلّورة
إعداد عروض مستهدفة 	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " زِد ظهورك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " بلّورة تساعدك تزيد ظهورك في الأوقات والمناطق الصح، بدون هدر في الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	227	ar	1a0d44e7-09b4-428c-b9e3-b9fdf2affbb0	\N
استرجاع تلقائي للمبالغ	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "استرجع مبالغ الخصومات الخاطئة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ووّفر صافي أرباحك", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " نساعدك تراجع الخصومات، تعترض على الأخطاء، وتسترجع اللي لك من تطبيقات التوصيل — بخطوات واضحة وسهلة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	228	ar	b990d3b5-b34f-4a45-8ac8-fe54c835f362	من إيرادات الطلبات تقدر تسترجعها من خلال معالجة أخطاء الخصومات على بلّورة
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ليش تستخدم بلّورة؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	/	429	ar	46454ef3-65c7-4632-8f01-215ed82a427f	\N
	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " زِد ظهورك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " بلّورة تساعدك تزيد ظهورك في الأوقات والمناطق الصح، بدون هدر في الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	430	ar	56f8f63a-0e2e-402b-b772-c89f7c7a9756	\N
استرجاع تلقائي للمبالغ	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "استرجع مبالغ الخصومات الخاطئة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ووّفر صافي أرباحك", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " نساعدك تراجع الخصومات، تعترض على الأخطاء، وتسترجع اللي لك من تطبيقات التوصيل — بخطوات واضحة وسهلة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	431	ar	1132ed46-917d-4372-b727-9edce818d049	من إيرادات الطلبات تقدر تسترجعها من خلال معالجة أخطاء الخصومات على بلّورة
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ليش تستخدم بلّورة؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	/	432	ar	b31806a0-8f44-4a3f-ab52-13e2f4a99762	\N
	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " زِد ظهورك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " بلّورة تساعدك تزيد ظهورك في الأوقات والمناطق الصح، بدون هدر في الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	433	ar	b290ce6b-78fb-463b-9742-08a65cec043d	\N
استرجاع تلقائي للمبالغ	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "استرجع مبالغ الخصومات الخاطئة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ووّفر صافي أرباحك", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " نساعدك تراجع الخصومات، تعترض على الأخطاء، وتسترجع اللي لك من تطبيقات التوصيل — بخطوات واضحة وسهلة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	434	ar	b63b9079-37b6-4dda-89bc-1259fb37d7b6	من إيرادات الطلبات تقدر تسترجعها من خلال معالجة أخطاء الخصومات على بلّورة
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ليش تستخدم بلّورة؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	/	314	ar	3fa30a41-58b5-40cc-9ce2-791c0c965a7a	\N
	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " زِد ظهورك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " بلّورة تساعدك تزيد ظهورك في الأوقات والمناطق الصح، بدون هدر في الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	315	ar	e6769cfa-6f93-4afa-9e68-885c9841d287	\N
استرجاع تلقائي للمبالغ	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "استرجع مبالغ الخصومات الخاطئة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ووّفر صافي أرباحك", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " نساعدك تراجع الخصومات، تعترض على الأخطاء، وتسترجع اللي لك من تطبيقات التوصيل — بخطوات واضحة وسهلة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	316	ar	e1b521fb-62dc-4120-917d-323b81834337	من إيرادات الطلبات تقدر تسترجعها من خلال معالجة أخطاء الخصومات على بلّورة
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ليش تستخدم بلّورة؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	/	317	ar	44281774-c31a-4e3d-b3de-5b674d2cad28	\N
	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " زِد ظهورك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " بلّورة تساعدك تزيد ظهورك في الأوقات والمناطق الصح، بدون هدر في الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	318	ar	1f9288ca-eb52-4e04-8e7a-d438f1edbcec	\N
استرجاع تلقائي للمبالغ	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "استرجع مبالغ الخصومات الخاطئة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ووّفر صافي أرباحك", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " نساعدك تراجع الخصومات، تعترض على الأخطاء، وتسترجع اللي لك من تطبيقات التوصيل — بخطوات واضحة وسهلة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	319	ar	483acf8c-ca2e-474c-b2d2-781366636f31	من إيرادات الطلبات تقدر تسترجعها من خلال معالجة أخطاء الخصومات على بلّورة
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ليش تستخدم بلّورة؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	/	255	ar	3e5d3e77-f3ae-480b-a93f-8b516bc36f93	\N
	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " زِد ظهورك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " بلّورة تساعدك تزيد ظهورك في الأوقات والمناطق الصح، بدون هدر في الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	256	ar	3c356f56-872c-419a-80ba-c81a331f411e	\N
استرجاع تلقائي للمبالغ	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "استرجع مبالغ الخصومات الخاطئة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ووّفر صافي أرباحك", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " نساعدك تراجع الخصومات، تعترض على الأخطاء، وتسترجع اللي لك من تطبيقات التوصيل — بخطوات واضحة وسهلة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	257	ar	b22e3667-5c16-4675-bc1b-ed570dff6019	من إيرادات الطلبات تقدر تسترجعها من خلال معالجة أخطاء الخصومات على بلّورة
\.


--
-- Data for Name: _formBlock_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_formBlock_v" ("_order", "_parent_id", "_path", "id", "form_id", "enable_intro", "intro_content", "_uuid", "block_name") FROM stdin;
\.


--
-- Data for Name: _galleryBlock_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_galleryBlock_v" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "type", "_uuid", "block_name") FROM stdin;
\.


--
-- Data for Name: _galleryBlock_v_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_galleryBlock_v_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant", "_uuid") FROM stdin;
\.


--
-- Data for Name: _galleryBlock_v_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_galleryBlock_v_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _galleryBlock_v_interactive_gallery; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_galleryBlock_v_interactive_gallery" ("_order", "_parent_id", "id", "_uuid") FROM stdin;
\.


--
-- Data for Name: _galleryBlock_v_interactive_gallery_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_galleryBlock_v_interactive_gallery_locales" ("image_id", "panel_title", "panel_description", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _galleryBlock_v_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_galleryBlock_v_locales" ("block_header_badge_label", "block_header_header_text", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _logosBlock_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_logosBlock_v" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "type", "_uuid", "block_name") FROM stdin;
2	1f91be73-fce5-4495-9619-5b10ba8b92c9	version.layout	54938e61-3afb-495e-ba02-dc17c4206cc1	center	\N	blue	\N	flex-row	03	6886953573e9e43a4a6e3c09	\N
2	e534ac8f-d8b4-4fc4-b77d-febb04366632	version.layout	9c03c048-ff11-4ddb-8bd3-f379def500be	center	\N	blue	\N	flex-row	03	6886953573e9e43a4a6e3c09	\N
2	4389a3c7-2b44-4dda-b26c-b3db9aa06ea8	version.layout	68bc98bd-04ac-4331-84b8-4c835b93bba1	center	\N	blue	\N	flex-row	03	6886953573e9e43a4a6e3c09	\N
2	ec2f0054-a44a-4dfe-b38c-2280a621a0df	version.layout	59505c97-d4c4-472c-912c-cd2463535739	center	\N	blue	\N	flex-row	03	6886953573e9e43a4a6e3c09	\N
2	96a690f0-6b75-40a2-bc6b-94e17419a077	version.layout	4d9f872f-cd0d-4fde-876e-0096e7e22903	center	\N	blue	\N	flex-row	03	6886953573e9e43a4a6e3c09	\N
2	b8643aac-9e6d-40cb-960a-50219579096e	version.layout	f2635032-5446-4c14-a6b9-a2f364ea87b3	center	\N	blue	\N	flex-row	03	6886953573e9e43a4a6e3c09	\N
2	bf780b52-7054-4988-a733-0d397f0f0b3a	version.layout	98759db0-165d-4694-af1e-00c13d498437	center	\N	blue	\N	flex-row	03	6886953573e9e43a4a6e3c09	\N
2	5d7acef8-c5c7-41df-b43a-b0a7019f4c57	version.layout	f00ee3e7-14b8-4640-bf07-e981a07a40d6	center	\N	blue	\N	flex-row	03	6886953573e9e43a4a6e3c09	\N
2	df25eab2-1f33-408c-930f-d845fabe2a9a	version.layout	6e68a966-1ddc-4d73-a998-393d246938c9	center	\N	blue	\N	flex-row	03	6886953573e9e43a4a6e3c09	\N
2	1aa29553-e446-407b-b3c0-5c37067f4c85	version.layout	03381366-d8a2-47c9-963c-d817b1880d2d	center	\N	blue	\N	flex-row	03	6886953573e9e43a4a6e3c09	\N
2	41c60df7-54ab-4683-8983-1204117e7975	version.layout	36e6eaf2-adb2-4dbf-811c-f85ad529da4e	center	\N	blue	\N	flex-row	03	6886953573e9e43a4a6e3c09	\N
2	deefcd27-f08b-46fa-8843-0703ff59e6cc	version.layout	94b0c133-0be1-45f1-a2b2-d4dfd771e5e6	center	\N	blue	\N	flex-row	03	6886953573e9e43a4a6e3c09	\N
\.


--
-- Data for Name: _logosBlock_v_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_logosBlock_v_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant", "_uuid") FROM stdin;
\.


--
-- Data for Name: _logosBlock_v_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_logosBlock_v_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _logosBlock_v_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_logosBlock_v_locales" ("block_header_badge_label", "block_header_header_text", "id", "_locale", "_parent_id") FROM stdin;
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "منصة مصممة للسوق السعودي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	122	ar	54938e61-3afb-495e-ba02-dc17c4206cc1
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "منصة مصممة للسوق السعودي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	123	ar	9c03c048-ff11-4ddb-8bd3-f379def500be
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "منصة مصممة للسوق السعودي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	80	ar	68bc98bd-04ac-4331-84b8-4c835b93bba1
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "منصة مصممة للسوق السعودي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	81	ar	59505c97-d4c4-472c-912c-cd2463535739
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "منصة مصممة للسوق السعودي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	82	ar	4d9f872f-cd0d-4fde-876e-0096e7e22903
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "منصة مصممة للسوق السعودي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	94	ar	f2635032-5446-4c14-a6b9-a2f364ea87b3
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "منصة مصممة للسوق السعودي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	95	ar	98759db0-165d-4694-af1e-00c13d498437
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "منصة مصممة للسوق السعودي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	104	ar	f00ee3e7-14b8-4640-bf07-e981a07a40d6
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "منصة مصممة للسوق السعودي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	49	ar	6e68a966-1ddc-4d73-a998-393d246938c9
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "منصة مصممة للسوق السعودي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	50	ar	03381366-d8a2-47c9-963c-d817b1880d2d
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "منصة مصممة للسوق السعودي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	160	ar	36e6eaf2-adb2-4dbf-811c-f85ad529da4e
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "منصة مصممة للسوق السعودي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	161	ar	94b0c133-0be1-45f1-a2b2-d4dfd771e5e6
\.


--
-- Data for Name: _metricsBlock_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_metricsBlock_v" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "type", "table_styling_striped", "table_styling_bordered", "table_styling_compact", "enable_logos", "_uuid", "block_name") FROM stdin;
\.


--
-- Data for Name: _metricsBlock_v_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_metricsBlock_v_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant", "_uuid") FROM stdin;
\.


--
-- Data for Name: _metricsBlock_v_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_metricsBlock_v_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _metricsBlock_v_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_metricsBlock_v_locales" ("block_header_badge_label", "block_header_header_text", "block_image_media_id", "table_title", "logos_headline", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _metricsBlock_v_stats; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_metricsBlock_v_stats" ("_order", "_parent_id", "id", "value", "indicator", "_uuid") FROM stdin;
\.


--
-- Data for Name: _metricsBlock_v_stats_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_metricsBlock_v_stats_locales" ("label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _metricsBlock_v_table_headers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_metricsBlock_v_table_headers" ("_order", "_parent_id", "_locale", "id", "header", "width", "_uuid") FROM stdin;
\.


--
-- Data for Name: _metricsBlock_v_table_rows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_metricsBlock_v_table_rows" ("_order", "_parent_id", "_locale", "id", "is_expandable", "_uuid") FROM stdin;
\.


--
-- Data for Name: _metricsBlock_v_table_rows_cells; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_metricsBlock_v_table_rows_cells" ("_order", "_parent_id", "_locale", "id", "content", "is_header", "_uuid") FROM stdin;
\.


--
-- Data for Name: _metricsBlock_v_table_rows_children; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_metricsBlock_v_table_rows_children" ("_order", "_parent_id", "_locale", "id", "_uuid") FROM stdin;
\.


--
-- Data for Name: _metricsBlock_v_table_rows_children_cells; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_metricsBlock_v_table_rows_children_cells" ("_order", "_parent_id", "_locale", "id", "content", "_uuid") FROM stdin;
\.


--
-- Data for Name: _pages_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_pages_v" ("id", "parent_id", "version_title", "version_hero_type", "version_hero_badge_type", "version_hero_badge_color", "version_hero_badge_icon", "version_hero_badge_icon_position", "version_hero_caption", "version_published_at", "version_slug", "version_slug_lock", "version_updated_at", "version_created_at", "version__status", "created_at", "updated_at", "snapshot", "published_locale", "latest", "autosave") FROM stdin;
eb75a85f-8a75-4ada-b510-fbd186ded5fd	742d2308-808d-4f0e-91f2-03d18be57d5c	about	mediumImpact	label	gray	\N	flex-row	\N	2025-07-27 21:55:39.98+00	about	t	2025-07-27 21:55:39.981+00	2025-07-27 21:36:21.924+00	draft	2025-07-27 21:37:57.541+00	2025-07-27 21:55:40.901+00	\N	\N	t	t
deefcd27-f08b-46fa-8843-0703ff59e6cc	a14442b0-9282-4efc-9df0-51d6374608d8	home	highImpact	\N	blue	\N	flex-row	\N	2025-07-27 20:53:08.677+00	home	t	2025-07-27 22:02:50.622+00	2025-07-27 20:48:06.623+00	draft	2025-07-27 22:02:50.622+00	2025-07-27 22:02:50.624+00	\N	\N	t	f
41c60df7-54ab-4683-8983-1204117e7975	a14442b0-9282-4efc-9df0-51d6374608d8	home	highImpact	\N	blue	\N	flex-row	\N	2025-07-27 20:53:08.677+00	home	t	2025-07-27 22:01:54.131+00	2025-07-27 20:48:06.623+00	draft	2025-07-27 21:45:46.369+00	2025-07-27 22:01:54.253+00	\N	\N	f	t
e534ac8f-d8b4-4fc4-b77d-febb04366632	a14442b0-9282-4efc-9df0-51d6374608d8	home	highImpact	\N	blue	\N	flex-row	\N	2025-07-27 20:53:08.677+00	home	t	2025-07-27 21:45:15.21+00	2025-07-27 20:48:06.623+00	draft	2025-07-27 21:45:15.21+00	2025-07-27 21:45:15.215+00	\N	\N	f	f
5d7acef8-c5c7-41df-b43a-b0a7019f4c57	a14442b0-9282-4efc-9df0-51d6374608d8	home	highImpact	\N	blue	\N	flex-row	\N	2025-07-27 20:53:08.677+00	home	t	2025-07-27 21:40:37.661+00	2025-07-27 20:48:06.623+00	draft	2025-07-27 21:40:37.661+00	2025-07-27 21:40:37.663+00	\N	\N	f	f
16fdc303-814a-4b89-aa3a-e7bf647df635	742d2308-808d-4f0e-91f2-03d18be57d5c	\N	lowImpact	\N	blue	\N	flex-row	\N	\N	\N	t	2025-07-27 21:36:50.459+00	2025-07-27 21:36:21.924+00	draft	2025-07-27 21:36:52.173+00	2025-07-27 21:36:52.174+00	\N	\N	f	f
bf780b52-7054-4988-a733-0d397f0f0b3a	a14442b0-9282-4efc-9df0-51d6374608d8	home	highImpact	\N	blue	\N	flex-row	\N	2025-07-27 20:53:08.677+00	home	t	2025-07-27 21:39:16.333+00	2025-07-27 20:48:06.623+00	draft	2025-07-27 21:39:16.333+00	2025-07-27 21:39:16.334+00	\N	\N	f	f
96a690f0-6b75-40a2-bc6b-94e17419a077	a14442b0-9282-4efc-9df0-51d6374608d8	home	highImpact	\N	blue	\N	flex-row	\N	2025-07-27 20:53:08.677+00	home	t	2025-07-27 21:36:05.978+00	2025-07-27 20:48:06.623+00	draft	2025-07-27 21:36:05.978+00	2025-07-27 21:36:05.981+00	\N	\N	f	f
ec2f0054-a44a-4dfe-b38c-2280a621a0df	a14442b0-9282-4efc-9df0-51d6374608d8	home	highImpact	\N	blue	\N	flex-row	\N	2025-07-27 20:53:08.677+00	home	t	2025-07-27 21:35:16.994+00	2025-07-27 20:48:06.623+00	published	2025-07-27 21:35:27.622+00	2025-07-27 21:35:27.625+00	\N	\N	f	f
4389a3c7-2b44-4dda-b26c-b3db9aa06ea8	a14442b0-9282-4efc-9df0-51d6374608d8	home	highImpact	\N	blue	\N	flex-row	\N	2025-07-27 20:53:08.677+00	home	t	2025-07-27 21:34:27.615+00	2025-07-27 20:48:06.623+00	draft	2025-07-27 21:27:40.895+00	2025-07-27 21:34:27.738+00	\N	\N	f	t
1aa29553-e446-407b-b3c0-5c37067f4c85	a14442b0-9282-4efc-9df0-51d6374608d8	home	highImpact	\N	blue	\N	flex-row	\N	2025-07-27 20:53:08.677+00	home	t	2025-07-27 21:27:00.235+00	2025-07-27 20:48:06.623+00	draft	2025-07-27 21:27:00.235+00	2025-07-27 21:27:00.237+00	\N	\N	f	f
df25eab2-1f33-408c-930f-d845fabe2a9a	a14442b0-9282-4efc-9df0-51d6374608d8	home	highImpact	\N	blue	\N	flex-row	\N	2025-07-27 20:53:08.677+00	home	t	2025-07-27 21:26:48.148+00	2025-07-27 20:48:06.623+00	draft	2025-07-27 21:07:27.966+00	2025-07-27 21:26:48.295+00	\N	\N	f	t
bc46ad15-d597-4471-8111-07e803be8f94	a14442b0-9282-4efc-9df0-51d6374608d8	\N	lowImpact	\N	blue	\N	flex-row	\N	\N	\N	t	2025-07-27 20:48:06.767+00	2025-07-27 20:48:06.623+00	draft	2025-07-27 20:48:07.29+00	2025-07-27 20:48:07.291+00	\N	\N	f	f
31b5ae11-e3c5-4e2b-b6a6-24aaabf8f28a	a14442b0-9282-4efc-9df0-51d6374608d8	home	highImpact	\N	blue	\N	flex-row	\N	2025-07-27 20:53:08.677+00	home	t	2025-07-27 21:07:23.349+00	2025-07-27 20:48:06.623+00	published	2025-07-27 21:07:25.787+00	2025-07-27 21:07:25.788+00	\N	\N	f	f
af90617d-cf5f-4812-afb8-2a0dfd9fdc12	a14442b0-9282-4efc-9df0-51d6374608d8	home	highImpact	\N	blue	\N	flex-row	\N	2025-07-27 20:53:08.677+00	home	t	2025-07-27 21:07:23.671+00	2025-07-27 20:48:06.623+00	draft	2025-07-27 20:48:50.154+00	2025-07-27 21:07:23.792+00	\N	\N	f	t
b8643aac-9e6d-40cb-960a-50219579096e	a14442b0-9282-4efc-9df0-51d6374608d8	home	highImpact	\N	blue	\N	flex-row	\N	2025-07-27 20:53:08.677+00	home	t	2025-07-27 21:39:12.881+00	2025-07-27 20:48:06.623+00	draft	2025-07-27 21:37:40.408+00	2025-07-27 21:39:13.005+00	\N	\N	f	t
1f91be73-fce5-4495-9619-5b10ba8b92c9	a14442b0-9282-4efc-9df0-51d6374608d8	home	highImpact	\N	blue	\N	flex-row	\N	2025-07-27 20:53:08.677+00	home	t	2025-07-27 21:44:47.725+00	2025-07-27 20:48:06.623+00	draft	2025-07-27 21:39:17.826+00	2025-07-27 21:44:47.859+00	\N	\N	f	t
\.


--
-- Data for Name: _pages_v_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_pages_v_locales" ("version_hero_badge_label", "version_hero_rich_text", "version_hero_media_desktop_light_id", "version_hero_media_desktop_dark_id", "version_hero_logos_headline", "version_meta_title", "version_meta_image_id", "version_meta_description", "id", "_locale", "_parent_id", "version_hero_media_mobile_light_id", "version_hero_media_mobile_dark_id") FROM stdin;
\N	\N	\N	\N	\N	\N	\N	\N	2	ar	bc46ad15-d597-4471-8111-07e803be8f94	\N	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "عزز نموك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بلّورة تبسّط إدارة التسويق وتحسّن أداء المطاعم على تطبيقات التوصيل من خلال منصة واحدة لإدارة الحملات، تحسين الإنفاق الإعلاني، وزيادة الربحية، بشكل تلقائي وذكي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	5afde42d-6a3f-4d34-a6ba-6eca5caea614	\N	\N	\N	\N	\N	93	ar	df25eab2-1f33-408c-930f-d845fabe2a9a	\N	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "عزز نموك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بلّورة تبسّط إدارة التسويق وتحسّن أداء المطاعم على تطبيقات التوصيل من خلال منصة واحدة لإدارة الحملات، تحسين الإنفاق الإعلاني، وزيادة الربحية، بشكل تلقائي وذكي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	5afde42d-6a3f-4d34-a6ba-6eca5caea614	\N	\N	\N	\N	\N	94	ar	1aa29553-e446-407b-b3c0-5c37067f4c85	\N	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "عزز نموك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بلّورة تبسّط إدارة التسويق وتحسّن أداء المطاعم على تطبيقات التوصيل من خلال منصة واحدة لإدارة الحملات، تحسين الإنفاق الإعلاني، وزيادة الربحية، بشكل تلقائي وذكي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	5afde42d-6a3f-4d34-a6ba-6eca5caea614	\N	\N	\N	\N	\N	148	ar	bf780b52-7054-4988-a733-0d397f0f0b3a	\N	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "عزز نموك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بلّورة تبسّط إدارة التسويق وتحسّن أداء المطاعم على تطبيقات التوصيل من خلال منصة واحدة لإدارة الحملات، تحسين الإنفاق الإعلاني، وزيادة الربحية، بشكل تلقائي وذكي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	5afde42d-6a3f-4d34-a6ba-6eca5caea614	\N	\N	\N	\N	\N	124	ar	4389a3c7-2b44-4dda-b26c-b3db9aa06ea8	\N	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "عزز نموك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بلّورة تبسّط إدارة التسويق وتحسّن أداء المطاعم على تطبيقات التوصيل من خلال منصة واحدة لإدارة الحملات، تحسين الإنفاق الإعلاني، وزيادة الربحية، بشكل تلقائي وذكي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	5afde42d-6a3f-4d34-a6ba-6eca5caea614	\N	\N	\N	\N	\N	125	ar	ec2f0054-a44a-4dfe-b38c-2280a621a0df	\N	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "عزز نموك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بلّورة تبسّط إدارة التسويق وتحسّن أداء المطاعم على تطبيقات التوصيل من خلال منصة واحدة لإدارة الحملات، تحسين الإنفاق الإعلاني، وزيادة الربحية، بشكل تلقائي وذكي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	5afde42d-6a3f-4d34-a6ba-6eca5caea614	\N	\N	\N	\N	\N	126	ar	96a690f0-6b75-40a2-bc6b-94e17419a077	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	127	ar	16fdc303-814a-4b89-aa3a-e7bf647df635	\N	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "عزز نموك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بلّورة تبسّط إدارة التسويق وتحسّن أداء المطاعم على تطبيقات التوصيل من خلال منصة واحدة لإدارة الحملات، تحسين الإنفاق الإعلاني، وزيادة الربحية، بشكل تلقائي وذكي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	5afde42d-6a3f-4d34-a6ba-6eca5caea614	\N	\N	\N	\N	\N	40	ar	af90617d-cf5f-4812-afb8-2a0dfd9fdc12	\N	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "عزز نموك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بلّورة تبسّط إدارة التسويق وتحسّن أداء المطاعم على تطبيقات التوصيل من خلال منصة واحدة لإدارة الحملات، تحسين الإنفاق الإعلاني، وزيادة الربحية، بشكل تلقائي وذكي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	5afde42d-6a3f-4d34-a6ba-6eca5caea614	\N	\N	\N	\N	\N	41	ar	31b5ae11-e3c5-4e2b-b6a6-24aaabf8f28a	\N	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "عزز نموك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بلّورة تبسّط إدارة التسويق وتحسّن أداء المطاعم على تطبيقات التوصيل من خلال منصة واحدة لإدارة الحملات، تحسين الإنفاق الإعلاني، وزيادة الربحية، بشكل تلقائي وذكي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	5afde42d-6a3f-4d34-a6ba-6eca5caea614	\N	\N	\N	\N	\N	147	ar	b8643aac-9e6d-40cb-960a-50219579096e	\N	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "عزز نموك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بلّورة تبسّط إدارة التسويق وتحسّن أداء المطاعم على تطبيقات التوصيل من خلال منصة واحدة لإدارة الحملات، تحسين الإنفاق الإعلاني، وزيادة الربحية، بشكل تلقائي وذكي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	5afde42d-6a3f-4d34-a6ba-6eca5caea614	\N	\N	\N	\N	\N	182	ar	1f91be73-fce5-4495-9619-5b10ba8b92c9	\N	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "عزز نموك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بلّورة تبسّط إدارة التسويق وتحسّن أداء المطاعم على تطبيقات التوصيل من خلال منصة واحدة لإدارة الحملات، تحسين الإنفاق الإعلاني، وزيادة الربحية، بشكل تلقائي وذكي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	5afde42d-6a3f-4d34-a6ba-6eca5caea614	\N	\N	\N	\N	\N	183	ar	e534ac8f-d8b4-4fc4-b77d-febb04366632	\N	\N
عن بلّورة	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "منصة تحسين الإيرادات الشاملة للمطاعم.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بلّورة تجمع بياناتك من تطبيقات التوصيل ونقاط البيع، و تساعدك تطلق حملات فعّالة، تسترجع مبالغ التعويضات المفقودة، وتطوّر استراتيجية تشغيلية وإعلانية واضحة – من مكان واحد، وبدون أي تعقيد", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	\N	\N	\N	\N	188	ar	eb75a85f-8a75-4ada-b510-fbd186ded5fd	\N	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "عزز نموك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بلّورة تبسّط إدارة التسويق وتحسّن أداء المطاعم على تطبيقات التوصيل من خلال منصة واحدة لإدارة الحملات، تحسين الإنفاق الإعلاني، وزيادة الربحية، بشكل تلقائي وذكي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	5afde42d-6a3f-4d34-a6ba-6eca5caea614	\N	\N	\N	\N	\N	159	ar	5d7acef8-c5c7-41df-b43a-b0a7019f4c57	\N	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "عزز نموك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بلّورة تبسّط إدارة التسويق وتحسّن أداء المطاعم على تطبيقات التوصيل من خلال منصة واحدة لإدارة الحملات، تحسين الإنفاق الإعلاني، وزيادة الربحية، بشكل تلقائي وذكي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	5afde42d-6a3f-4d34-a6ba-6eca5caea614	\N	\N	\N	\N	\N	221	ar	41c60df7-54ab-4683-8983-1204117e7975	\N	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "عزز نموك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بلّورة تبسّط إدارة التسويق وتحسّن أداء المطاعم على تطبيقات التوصيل من خلال منصة واحدة لإدارة الحملات، تحسين الإنفاق الإعلاني، وزيادة الربحية، بشكل تلقائي وذكي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	5afde42d-6a3f-4d34-a6ba-6eca5caea614	\N	\N	\N	\N	\N	222	ar	deefcd27-f08b-46fa-8843-0703ff59e6cc	\N	\N
\.


--
-- Data for Name: _pages_v_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_pages_v_rels" ("id", "order", "parent_id", "path", "locale", "pages_id", "blog_posts_id", "media_id", "categories_id", "faq_id", "customers_id") FROM stdin;
376	1	41c60df7-54ab-4683-8983-1204117e7975	version.layout.1.logos	\N	\N	\N	513d34fb-5dbc-4333-b0ab-af8e3756cc8a	\N	\N	\N
377	2	41c60df7-54ab-4683-8983-1204117e7975	version.layout.1.logos	\N	\N	\N	92890105-dde4-4c79-acac-d81ad6dd978a	\N	\N	\N
378	1	41c60df7-54ab-4683-8983-1204117e7975	version.layout.2.selectedTestimonials	\N	\N	\N	\N	\N	\N	b440e19a-7d00-487a-9927-d384dee97e22
379	1	41c60df7-54ab-4683-8983-1204117e7975	version.layout.6.selectedTestimonials	\N	\N	\N	\N	\N	\N	ad1d03ad-f60b-4f83-90c2-d456f1fbaf21
380	1	deefcd27-f08b-46fa-8843-0703ff59e6cc	version.layout.1.logos	\N	\N	\N	513d34fb-5dbc-4333-b0ab-af8e3756cc8a	\N	\N	\N
381	2	deefcd27-f08b-46fa-8843-0703ff59e6cc	version.layout.1.logos	\N	\N	\N	92890105-dde4-4c79-acac-d81ad6dd978a	\N	\N	\N
202	1	5d7acef8-c5c7-41df-b43a-b0a7019f4c57	version.layout.1.logos	\N	\N	\N	513d34fb-5dbc-4333-b0ab-af8e3756cc8a	\N	\N	\N
203	2	5d7acef8-c5c7-41df-b43a-b0a7019f4c57	version.layout.1.logos	\N	\N	\N	92890105-dde4-4c79-acac-d81ad6dd978a	\N	\N	\N
382	1	deefcd27-f08b-46fa-8843-0703ff59e6cc	version.layout.2.selectedTestimonials	\N	\N	\N	\N	\N	\N	b440e19a-7d00-487a-9927-d384dee97e22
383	1	deefcd27-f08b-46fa-8843-0703ff59e6cc	version.layout.6.selectedTestimonials	\N	\N	\N	\N	\N	\N	ad1d03ad-f60b-4f83-90c2-d456f1fbaf21
273	1	41c60df7-54ab-4683-8983-1204117e7975	version.layout.5.selectedTestimonials	\N	\N	\N	\N	\N	\N	ad1d03ad-f60b-4f83-90c2-d456f1fbaf21
92	1	df25eab2-1f33-408c-930f-d845fabe2a9a	version.layout.1.logos	\N	\N	\N	513d34fb-5dbc-4333-b0ab-af8e3756cc8a	\N	\N	\N
93	2	df25eab2-1f33-408c-930f-d845fabe2a9a	version.layout.1.logos	\N	\N	\N	92890105-dde4-4c79-acac-d81ad6dd978a	\N	\N	\N
94	1	1aa29553-e446-407b-b3c0-5c37067f4c85	version.layout.1.logos	\N	\N	\N	513d34fb-5dbc-4333-b0ab-af8e3756cc8a	\N	\N	\N
95	2	1aa29553-e446-407b-b3c0-5c37067f4c85	version.layout.1.logos	\N	\N	\N	92890105-dde4-4c79-acac-d81ad6dd978a	\N	\N	\N
154	1	4389a3c7-2b44-4dda-b26c-b3db9aa06ea8	version.layout.1.logos	\N	\N	\N	513d34fb-5dbc-4333-b0ab-af8e3756cc8a	\N	\N	\N
155	2	4389a3c7-2b44-4dda-b26c-b3db9aa06ea8	version.layout.1.logos	\N	\N	\N	92890105-dde4-4c79-acac-d81ad6dd978a	\N	\N	\N
156	1	ec2f0054-a44a-4dfe-b38c-2280a621a0df	version.layout.1.logos	\N	\N	\N	513d34fb-5dbc-4333-b0ab-af8e3756cc8a	\N	\N	\N
157	2	ec2f0054-a44a-4dfe-b38c-2280a621a0df	version.layout.1.logos	\N	\N	\N	92890105-dde4-4c79-acac-d81ad6dd978a	\N	\N	\N
158	1	96a690f0-6b75-40a2-bc6b-94e17419a077	version.layout.1.logos	\N	\N	\N	513d34fb-5dbc-4333-b0ab-af8e3756cc8a	\N	\N	\N
159	2	96a690f0-6b75-40a2-bc6b-94e17419a077	version.layout.1.logos	\N	\N	\N	92890105-dde4-4c79-acac-d81ad6dd978a	\N	\N	\N
238	1	1f91be73-fce5-4495-9619-5b10ba8b92c9	version.layout.1.logos	\N	\N	\N	513d34fb-5dbc-4333-b0ab-af8e3756cc8a	\N	\N	\N
239	2	1f91be73-fce5-4495-9619-5b10ba8b92c9	version.layout.1.logos	\N	\N	\N	92890105-dde4-4c79-acac-d81ad6dd978a	\N	\N	\N
240	1	e534ac8f-d8b4-4fc4-b77d-febb04366632	version.layout.1.logos	\N	\N	\N	513d34fb-5dbc-4333-b0ab-af8e3756cc8a	\N	\N	\N
241	2	e534ac8f-d8b4-4fc4-b77d-febb04366632	version.layout.1.logos	\N	\N	\N	92890105-dde4-4c79-acac-d81ad6dd978a	\N	\N	\N
182	1	b8643aac-9e6d-40cb-960a-50219579096e	version.layout.1.logos	\N	\N	\N	513d34fb-5dbc-4333-b0ab-af8e3756cc8a	\N	\N	\N
183	2	b8643aac-9e6d-40cb-960a-50219579096e	version.layout.1.logos	\N	\N	\N	92890105-dde4-4c79-acac-d81ad6dd978a	\N	\N	\N
184	1	bf780b52-7054-4988-a733-0d397f0f0b3a	version.layout.1.logos	\N	\N	\N	513d34fb-5dbc-4333-b0ab-af8e3756cc8a	\N	\N	\N
185	2	bf780b52-7054-4988-a733-0d397f0f0b3a	version.layout.1.logos	\N	\N	\N	92890105-dde4-4c79-acac-d81ad6dd978a	\N	\N	\N
\.


--
-- Data for Name: _pages_v_version_hero_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_pages_v_version_hero_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant", "_uuid") FROM stdin;
1	1f91be73-fce5-4495-9619-5b10ba8b92c9	4e225479-2e4f-4915-818c-09f45e978d51	custom	\N	/	neutral	primary	688693af73e9e43a4a6e3c03
2	1f91be73-fce5-4495-9619-5b10ba8b92c9	8d5cb74b-f002-4310-9cdc-785e3fc6cfac	custom	\N	/	neutral	ghost	688693c973e9e43a4a6e3c04
1	e534ac8f-d8b4-4fc4-b77d-febb04366632	b08fdfc5-b38f-4bc9-9f9a-c4b66f7a4a05	custom	\N	/	neutral	primary	688693af73e9e43a4a6e3c03
2	e534ac8f-d8b4-4fc4-b77d-febb04366632	bb6cdd0f-f500-4927-8b60-17fe1b2bd948	custom	\N	/	neutral	ghost	688693c973e9e43a4a6e3c04
1	b8643aac-9e6d-40cb-960a-50219579096e	3c8ca34e-fc31-4580-a73b-d6b884ed52a1	custom	\N	/	neutral	primary	688693af73e9e43a4a6e3c03
2	b8643aac-9e6d-40cb-960a-50219579096e	52385a7e-efa2-4fd6-88e2-b1170e773207	custom	\N	/	neutral	ghost	688693c973e9e43a4a6e3c04
1	bf780b52-7054-4988-a733-0d397f0f0b3a	502ed58b-f371-4ecf-b49f-c7c4e7db23cf	custom	\N	/	neutral	primary	688693af73e9e43a4a6e3c03
2	bf780b52-7054-4988-a733-0d397f0f0b3a	e2c1790f-ff52-48da-9bbc-99c458fd5d9b	custom	\N	/	neutral	ghost	688693c973e9e43a4a6e3c04
1	41c60df7-54ab-4683-8983-1204117e7975	1168a7c0-08ab-49f4-8b39-00f1f189d6c6	custom	\N	/	neutral	primary	688693af73e9e43a4a6e3c03
2	41c60df7-54ab-4683-8983-1204117e7975	c10a3521-65b7-4fce-822b-6d4a0887065e	custom	\N	/	neutral	ghost	688693c973e9e43a4a6e3c04
1	deefcd27-f08b-46fa-8843-0703ff59e6cc	b4c62c01-73d6-4d29-bb03-f1f8d2521fe9	custom	\N	/	neutral	primary	688693af73e9e43a4a6e3c03
2	deefcd27-f08b-46fa-8843-0703ff59e6cc	12b78b6e-7b75-41f2-b3ba-dc36ce37bb23	custom	\N	/	neutral	ghost	688693c973e9e43a4a6e3c04
1	5d7acef8-c5c7-41df-b43a-b0a7019f4c57	bbf9549a-9f0b-4837-8914-12473a6d79f8	custom	\N	/	neutral	primary	688693af73e9e43a4a6e3c03
2	5d7acef8-c5c7-41df-b43a-b0a7019f4c57	c2c7ffaa-7ba8-43de-9a66-4b38b5da21a2	custom	\N	/	neutral	ghost	688693c973e9e43a4a6e3c04
1	df25eab2-1f33-408c-930f-d845fabe2a9a	0de79779-3ccc-4ca5-a4a1-adaa8729f032	custom	\N	/	neutral	primary	688693af73e9e43a4a6e3c03
2	df25eab2-1f33-408c-930f-d845fabe2a9a	711da676-11b9-4f7a-bd02-e16c4061b3af	custom	\N	/	neutral	ghost	688693c973e9e43a4a6e3c04
1	1aa29553-e446-407b-b3c0-5c37067f4c85	55e8e5d0-12af-40c7-b318-7057d8a1299a	custom	\N	/	neutral	primary	688693af73e9e43a4a6e3c03
2	1aa29553-e446-407b-b3c0-5c37067f4c85	4e2ebc71-f571-43ad-87c7-ff0ca683d314	custom	\N	/	neutral	ghost	688693c973e9e43a4a6e3c04
1	4389a3c7-2b44-4dda-b26c-b3db9aa06ea8	6794c94e-16e9-46c2-a685-95ca2876ecd8	custom	\N	/	neutral	primary	688693af73e9e43a4a6e3c03
2	4389a3c7-2b44-4dda-b26c-b3db9aa06ea8	9fc36f4c-5ed2-4ca3-82b7-ea960a407019	custom	\N	/	neutral	ghost	688693c973e9e43a4a6e3c04
1	ec2f0054-a44a-4dfe-b38c-2280a621a0df	26d93222-1966-470e-b244-8a70eed8af7e	custom	\N	/	neutral	primary	688693af73e9e43a4a6e3c03
2	ec2f0054-a44a-4dfe-b38c-2280a621a0df	bd1aacd0-a03c-4d48-99cc-33053f9c4912	custom	\N	/	neutral	ghost	688693c973e9e43a4a6e3c04
1	96a690f0-6b75-40a2-bc6b-94e17419a077	e1330004-dc74-4e27-9ae7-e20878284456	custom	\N	/	neutral	primary	688693af73e9e43a4a6e3c03
1	af90617d-cf5f-4812-afb8-2a0dfd9fdc12	65f91435-4f1c-49bf-a1d5-c4143188c114	custom	\N	/	neutral	primary	688693af73e9e43a4a6e3c03
2	af90617d-cf5f-4812-afb8-2a0dfd9fdc12	01550232-561e-4c49-b816-a3addb86c20d	custom	\N	/	neutral	ghost	688693c973e9e43a4a6e3c04
1	31b5ae11-e3c5-4e2b-b6a6-24aaabf8f28a	b05b4e45-3268-46c2-818c-73ec328cc2ce	custom	\N	/	neutral	primary	688693af73e9e43a4a6e3c03
2	31b5ae11-e3c5-4e2b-b6a6-24aaabf8f28a	a6a786a0-a0e0-48d8-963b-f84e5bc184ef	custom	\N	/	neutral	ghost	688693c973e9e43a4a6e3c04
2	96a690f0-6b75-40a2-bc6b-94e17419a077	ca6fc1e6-a7ea-4f8d-aa3d-754925525751	custom	\N	/	neutral	ghost	688693c973e9e43a4a6e3c04
\.


--
-- Data for Name: _pages_v_version_hero_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_pages_v_version_hero_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
جرب حاسبة الربحية	302	ar	4e225479-2e4f-4915-818c-09f45e978d51
إطلب عرض تجريبي	303	ar	8d5cb74b-f002-4310-9cdc-785e3fc6cfac
جرب حاسبة الربحية	304	ar	b08fdfc5-b38f-4bc9-9f9a-c4b66f7a4a05
إطلب عرض تجريبي	305	ar	bb6cdd0f-f500-4927-8b60-17fe1b2bd948
جرب حاسبة الربحية	246	ar	3c8ca34e-fc31-4580-a73b-d6b884ed52a1
إطلب عرض تجريبي	247	ar	52385a7e-efa2-4fd6-88e2-b1170e773207
جرب حاسبة الربحية	248	ar	502ed58b-f371-4ecf-b49f-c7c4e7db23cf
إطلب عرض تجريبي	249	ar	e2c1790f-ff52-48da-9bbc-99c458fd5d9b
جرب حاسبة الربحية	378	ar	1168a7c0-08ab-49f4-8b39-00f1f189d6c6
إطلب عرض تجريبي	379	ar	c10a3521-65b7-4fce-822b-6d4a0887065e
جرب حاسبة الربحية	380	ar	b4c62c01-73d6-4d29-bb03-f1f8d2521fe9
إطلب عرض تجريبي	381	ar	12b78b6e-7b75-41f2-b3ba-dc36ce37bb23
جرب حاسبة الربحية	266	ar	bbf9549a-9f0b-4837-8914-12473a6d79f8
إطلب عرض تجريبي	267	ar	c2c7ffaa-7ba8-43de-9a66-4b38b5da21a2
جرب حاسبة الربحية	156	ar	0de79779-3ccc-4ca5-a4a1-adaa8729f032
إطلب عرض تجريبي	157	ar	711da676-11b9-4f7a-bd02-e16c4061b3af
جرب حاسبة الربحية	158	ar	55e8e5d0-12af-40c7-b318-7057d8a1299a
إطلب عرض تجريبي	159	ar	4e2ebc71-f571-43ad-87c7-ff0ca683d314
جرب حاسبة الربحية	218	ar	6794c94e-16e9-46c2-a685-95ca2876ecd8
جرب حاسبة الربحية	50	ar	65f91435-4f1c-49bf-a1d5-c4143188c114
إطلب عرض تجريبي	51	ar	01550232-561e-4c49-b816-a3addb86c20d
جرب حاسبة الربحية	52	ar	b05b4e45-3268-46c2-818c-73ec328cc2ce
إطلب عرض تجريبي	53	ar	a6a786a0-a0e0-48d8-963b-f84e5bc184ef
إطلب عرض تجريبي	219	ar	9fc36f4c-5ed2-4ca3-82b7-ea960a407019
جرب حاسبة الربحية	220	ar	26d93222-1966-470e-b244-8a70eed8af7e
إطلب عرض تجريبي	221	ar	bd1aacd0-a03c-4d48-99cc-33053f9c4912
جرب حاسبة الربحية	222	ar	e1330004-dc74-4e27-9ae7-e20878284456
إطلب عرض تجريبي	223	ar	ca6fc1e6-a7ea-4f8d-aa3d-754925525751
\.


--
-- Data for Name: _richTextBlock_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_richTextBlock_v" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "type", "max_width", "columns", "_uuid", "block_name") FROM stdin;
2	eb75a85f-8a75-4ada-b510-fbd186ded5fd	version.layout	fce81cab-4245-4082-9761-166ce135c2fb	center	\N	blue	\N	flex-row	02	default	1	68869cf2f3705a4904040d30	\N
\.


--
-- Data for Name: _richTextBlock_v_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_richTextBlock_v_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant", "_uuid") FROM stdin;
\.


--
-- Data for Name: _richTextBlock_v_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_richTextBlock_v_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _richTextBlock_v_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_richTextBlock_v_locales" ("block_header_badge_label", "block_header_header_text", "content", "id", "_locale", "_parent_id") FROM stdin;
\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تحسين الإيرادات وهوامش الربح لمطاعم والشركات عبر قنوات المبيعات عبر الإنترنت وخارجها", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "في بالوره، بدأت في بناء أول نظام تشغيل للربح مصمم فقط للمطاعم. نحن ندمج موثوقية على مستوى البنوك - أنابيب بيانات آمنة، تسويات محكمة - مع أدوات محددة لقطاع الأغذية والمشروبات تحول بيانات تطبيقات التوصيل إلى تسويق أكثر دقة، وعمليات أكثر كفاءة، وفي النهاية، هوامش ربح أكبر. الهدف بسيط: منح كل مطعم القدرة على العمل بكفاءة أكبر، والتنافس بشكل أقوى، والاحتفاظ بمزيد من كل ريال يكسبونه.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "عبدالوهاب الزيدي", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "شريك مؤسس، مدير تنفيذي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 1}], "direction": "rtl", "textFormat": 1}}	4	ar	fce81cab-4245-4082-9761-166ce135c2fb
\.


--
-- Data for Name: _testimonialsBlock_v; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_testimonialsBlock_v" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "type", "_uuid", "block_name", "bg_color") FROM stdin;
3	41c60df7-54ab-4683-8983-1204117e7975	version.layout	1ccfa879-1341-4b22-ad89-ac4bb17b3667	center	\N	blue	\N	flex-row	02	6886a0cc5a3935fab3feb21d	\N	violet
7	41c60df7-54ab-4683-8983-1204117e7975	version.layout	a3a57347-f982-4568-a4a2-c69dded638f9	center	\N	blue	\N	flex-row	01	6886a0695a3935fab3feb21b	\N	gray
3	deefcd27-f08b-46fa-8843-0703ff59e6cc	version.layout	8da94069-c330-4b78-abdc-56018cc35756	center	\N	blue	\N	flex-row	02	6886a0cc5a3935fab3feb21d	\N	violet
7	deefcd27-f08b-46fa-8843-0703ff59e6cc	version.layout	d7491236-934f-4faa-a4fa-84cf07f45b56	center	\N	blue	\N	flex-row	01	6886a0695a3935fab3feb21b	\N	gray
\.


--
-- Data for Name: _testimonialsBlock_v_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_testimonialsBlock_v_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant", "_uuid") FROM stdin;
\.


--
-- Data for Name: _testimonialsBlock_v_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_testimonialsBlock_v_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: _testimonialsBlock_v_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."_testimonialsBlock_v_locales" ("block_header_badge_label", "block_header_header_text", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: archiveBlock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."archiveBlock" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "populate_by", "relation_to", "limit", "block_name") FROM stdin;
\.


--
-- Data for Name: archiveBlock_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."archiveBlock_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant") FROM stdin;
\.


--
-- Data for Name: archiveBlock_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."archiveBlock_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: archiveBlock_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."archiveBlock_locales" ("block_header_badge_label", "block_header_header_text", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: blogBlock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."blogBlock" ("_order", "_parent_id", "_path", "id", "type", "featured_post_id", "block_name") FROM stdin;
\.


--
-- Data for Name: blogBlock_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."blogBlock_locales" ("recent_posts_list_title", "recent_posts_list_description", "editors_picks_list_title", "editors_picks_list_description", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: blog_posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."blog_posts" ("id", "slug", "slug_lock", "updated_at", "created_at", "_status") FROM stdin;
\.


--
-- Data for Name: blog_posts_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."blog_posts_locales" ("title", "hero_image_id", "content", "meta_title", "meta_image_id", "meta_description", "published_at", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: blog_posts_populated_authors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."blog_posts_populated_authors" ("_order", "_parent_id", "id", "name") FROM stdin;
\.


--
-- Data for Name: blog_posts_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."blog_posts_rels" ("id", "order", "parent_id", "path", "locale", "blog_posts_id", "categories_id", "users_id") FROM stdin;
\.


--
-- Data for Name: callToActionBlock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."callToActionBlock" ("_order", "_parent_id", "_path", "id", "type", "badge_type", "badge_color", "badge_icon", "badge_icon_position", "caption", "form_id", "block_name") FROM stdin;
\.


--
-- Data for Name: callToActionBlock_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."callToActionBlock_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant") FROM stdin;
\.


--
-- Data for Name: callToActionBlock_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."callToActionBlock_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: callToActionBlock_list; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."callToActionBlock_list" ("_order", "_parent_id", "_locale", "id", "icon", "title", "subtitle") FROM stdin;
\.


--
-- Data for Name: callToActionBlock_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."callToActionBlock_locales" ("badge_label", "rich_text", "media_desktop_light_id", "media_desktop_dark_id", "media_mobile_light_id", "media_mobile_dark_id", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."categories" ("id", "title", "slug", "slug_lock", "parent_id", "updated_at", "created_at") FROM stdin;
\.


--
-- Data for Name: categories_breadcrumbs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."categories_breadcrumbs" ("_order", "_parent_id", "_locale", "id", "doc_id", "url", "label") FROM stdin;
\.


--
-- Data for Name: customHtmlBlock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."customHtmlBlock" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "html_content", "block_name") FROM stdin;
\.


--
-- Data for Name: customHtmlBlock_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."customHtmlBlock_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant") FROM stdin;
\.


--
-- Data for Name: customHtmlBlock_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."customHtmlBlock_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: customHtmlBlock_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."customHtmlBlock_locales" ("block_header_badge_label", "block_header_header_text", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."customers" ("id", "title", "testimonial_featured_image_id", "testimonial_company_company_logo_id", "testimonial_company_link_type", "testimonial_company_link_new_tab", "testimonial_company_link_url", "testimonial_company_industry", "testimonial_company_founding_year", "testimonial_company_branches", "testimonial_author_info_avatar_id", "enable_case_study", "slug", "slug_lock", "published_at", "updated_at", "created_at", "_status") FROM stdin;
ad1d03ad-f60b-4f83-90c2-d456f1fbaf21	مطعم	\N	\N	custom	\N	/	\N	\N	\N	\N	f		t	\N	2025-07-27 21:51:14.168+00	2025-07-27 21:49:09.536+00	published
b440e19a-7d00-487a-9927-d384dee97e22	\N	\N	\N	reference	\N	\N	\N	\N	\N	\N	f	\N	t	\N	2025-07-27 21:52:05.016+00	2025-07-27 21:52:04.969+00	draft
\.


--
-- Data for Name: customers_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."customers_locales" ("testimonial_quote", "testimonial_company_company_name", "testimonial_company_link_label", "testimonial_company_location", "testimonial_author_info_name", "testimonial_author_info_title", "case_study_case_studytitle", "case_study_summary", "case_study_content", "id", "_locale", "_parent_id") FROM stdin;
\N	\N	\N	\N	\N	\N	\N	\N	\N	1	en	ad1d03ad-f60b-4f83-90c2-d456f1fbaf21
{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تضاعفت المبيعات الخاصة بنا وذلك عبر اتباع التوصيات المقدمة من بلورة، حيث زاد معدل الوصول للعملاء المستهدفين المتشابهين لسلوك قاعدة عملائنا، كما ارتفع معدل إتمام صفقات البيع بفضل العروض الخاصة المقترحة من قبل بلورة!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	ريت كافيه	/	\N	ماهر الحجيلي	شريك مؤسس، ريت كافيه	\N	\N	\N	2	ar	ad1d03ad-f60b-4f83-90c2-d456f1fbaf21
\.


--
-- Data for Name: customers_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."customers_rels" ("id", "order", "parent_id", "path", "pages_id", "blog_posts_id", "categories_id") FROM stdin;
\.


--
-- Data for Name: customers_testimonial_stats; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."customers_testimonial_stats" ("_order", "_parent_id", "id", "value", "indicator") FROM stdin;
\.


--
-- Data for Name: customers_testimonial_stats_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."customers_testimonial_stats_locales" ("label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: dividerBlock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."dividerBlock" ("_order", "_parent_id", "_path", "id", "size", "enable_divider", "block_name") FROM stdin;
\.


--
-- Data for Name: faq; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."faq" ("id", "category_id", "updated_at", "created_at", "_status") FROM stdin;
\.


--
-- Data for Name: faqBlock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."faqBlock" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "type", "block_name") FROM stdin;
\.


--
-- Data for Name: faqBlock_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."faqBlock_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant") FROM stdin;
\.


--
-- Data for Name: faqBlock_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."faqBlock_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: faqBlock_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."faqBlock_locales" ("block_header_badge_label", "block_header_header_text", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: faq_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."faq_locales" ("question", "answer", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: featuresBlock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."featuresBlock" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "type", "block_image_id", "link_type", "link_new_tab", "link_url", "block_name", "stat_value", "stat_indicator") FROM stdin;
1	a14442b0-9282-4efc-9df0-51d6374608d8	layout	688694d473e9e43a4a6e3c05	center	\N	blue	\N	flex-row	14	\N	custom	\N	/	\N	\N	noChange
3	a14442b0-9282-4efc-9df0-51d6374608d8	layout	688695d673e9e43a4a6e3c0a	center	\N	blue	\N	flex-row	01	\N	reference	\N	\N	\N	\N	noChange
4	a14442b0-9282-4efc-9df0-51d6374608d8	layout	68869a4d5a3935fab3feb217	center	label	outline	\N	flex-row	06	fe54a595-3fe0-406c-8274-f5ed27ea3ec5	reference	\N	\N	\N	\N	noChange
\.


--
-- Data for Name: featuresBlock_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."featuresBlock_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant") FROM stdin;
\.


--
-- Data for Name: featuresBlock_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."featuresBlock_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: featuresBlock_columns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."featuresBlock_columns" ("_order", "_parent_id", "id", "size", "icon", "enable_badge", "enable_cta", "reverse_order", "badge_type", "badge_color", "badge_icon", "badge_icon_position", "link_type", "link_new_tab", "link_url", "stat_value", "stat_indicator") FROM stdin;
1	688694d473e9e43a4a6e3c05	688694e973e9e43a4a6e3c06	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	\N	noChange
2	688694d473e9e43a4a6e3c05	688694f973e9e43a4a6e3c07	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	\N	noChange
3	688694d473e9e43a4a6e3c05	6886950873e9e43a4a6e3c08	half	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	\N	noChange
1	688695d673e9e43a4a6e3c0a	688695df73e9e43a4a6e3c0b	full	\N	\N	\N	\N	\N	blue	\N	flex-row	reference	\N	\N	6 ريال	noChange
2	688695d673e9e43a4a6e3c0a	6886984273e9e43a4a6e3c0d	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	+32%	noChange
3	688695d673e9e43a4a6e3c0a	688698ec5a3935fab3feb215	half	\N	t	\N	\N	label	outline	\N	flex-row	reference	\N	\N	15-30%	noChange
\.


--
-- Data for Name: featuresBlock_columns_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."featuresBlock_columns_locales" ("image_id", "tab_label", "content_title", "content_subtitle", "rich_text_content", "badge_label", "link_label", "id", "_locale", "_parent_id", "stat_label") FROM stdin;
f8f05216-7b1e-4f38-9c78-712c86d1057c	\N	كل بياناتك في مكان واحد، من الكاشير الى تطبيقات التوصيل	\N	\N	\N	\N	4	ar	688694e973e9e43a4a6e3c06	\N
edbc376c-731b-4c47-8220-478db6cd03e4	\N	اطلق حملاتك التسويقية بطريقة اذكى ومدروسة	\N	\N	\N	\N	5	ar	688694f973e9e43a4a6e3c07	\N
712fc138-f7e2-48e4-bcc8-5e24ff9e79b7	\N	استرجع مبالغ التعويضات المفقودة وانت مرتاح	\N	\N	\N	\N	6	ar	6886950873e9e43a4a6e3c08	\N
cd2d9b5d-5b74-4846-b1eb-85e3535f944a	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "حدّد أفضل وقت، قناة، ونسبة خصم لعروضك الترويجية", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "محركنا يحلل الطلبات عبر HungerStation و Jahez و Careem والمزيد ليخبرك متى تطلق، وأين تظهر، وأي عرض يحقق أفضل اداء بدون هدر الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	7	ar	688695df73e9e43a4a6e3c0b	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
5b3e3903-897a-4182-a331-61f448da95d0	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "افهم وش قاعد يصير، اول باول", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	لوحة أداء شاملة	\N	8	ar	6886984273e9e43a4a6e3c0d	متوسط عائد لكل ريال يُصرف على  الحملات من داخل بلّورة
7a8a5f6d-dc53-40ab-9daa-217ee1027234	\N	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h4", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "تفصيل الإيرادات حسب القناة والفرع لسهولة المقارنة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	وضوح المؤشرات المهمة	\N	9	ar	688698ec5a3935fab3feb215	زيادة فعلية في الإيرادات بعد استخدام بلّورة
\.


--
-- Data for Name: featuresBlock_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."featuresBlock_locales" ("block_header_badge_label", "block_header_header_text", "c_t_a_label", "link_label", "id", "_locale", "_parent_id", "stat_label") FROM stdin;
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ليش تستخدم بلّورة؟", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}], "direction": "rtl"}}	\N	/	2	ar	688694d473e9e43a4a6e3c05	\N
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " زِد ظهورك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " بلّورة تساعدك تزيد ظهورك في الأوقات والمناطق الصح، بدون هدر في الميزانية.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	3	ar	688695d673e9e43a4a6e3c0a	\N
استرجاع تلقائي للمبالغ	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "استرجع مبالغ الخصومات الخاطئة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ووّفر صافي أرباحك", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " نساعدك تراجع الخصومات، تعترض على الأخطاء، وتسترجع اللي لك من تطبيقات التوصيل — بخطوات واضحة وسهلة", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	\N	\N	4	ar	68869a4d5a3935fab3feb217	\N
\.


--
-- Data for Name: footer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."footer" ("id", "updated_at", "created_at") FROM stdin;
\.


--
-- Data for Name: footer_columns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."footer_columns" ("_order", "_parent_id", "id", "label") FROM stdin;
\.


--
-- Data for Name: footer_columns_nav_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."footer_columns_nav_items" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url") FROM stdin;
\.


--
-- Data for Name: footer_columns_nav_items_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."footer_columns_nav_items_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: footer_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."footer_rels" ("id", "order", "parent_id", "path", "pages_id", "blog_posts_id") FROM stdin;
\.


--
-- Data for Name: formBlock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."formBlock" ("_order", "_parent_id", "_path", "id", "form_id", "enable_intro", "intro_content", "block_name") FROM stdin;
\.


--
-- Data for Name: form_submissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."form_submissions" ("id", "form_id", "updated_at", "created_at") FROM stdin;
\.


--
-- Data for Name: form_submissions_submission_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."form_submissions_submission_data" ("_order", "_parent_id", "id", "field", "value") FROM stdin;
\.


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms" ("id", "title", "confirmation_type", "redirect_url", "updated_at", "created_at") FROM stdin;
\.


--
-- Data for Name: forms_blocks_checkbox; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_checkbox" ("_order", "_parent_id", "_path", "id", "name", "width", "required", "default_value", "block_name") FROM stdin;
\.


--
-- Data for Name: forms_blocks_checkbox_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_checkbox_locales" ("label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: forms_blocks_country; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_country" ("_order", "_parent_id", "_path", "id", "name", "width", "required", "block_name") FROM stdin;
\.


--
-- Data for Name: forms_blocks_country_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_country_locales" ("label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: forms_blocks_email; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_email" ("_order", "_parent_id", "_path", "id", "name", "width", "required", "block_name") FROM stdin;
\.


--
-- Data for Name: forms_blocks_email_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_email_locales" ("label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: forms_blocks_message; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_message" ("_order", "_parent_id", "_path", "id", "block_name") FROM stdin;
\.


--
-- Data for Name: forms_blocks_message_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_message_locales" ("message", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: forms_blocks_number; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_number" ("_order", "_parent_id", "_path", "id", "name", "width", "default_value", "required", "block_name") FROM stdin;
\.


--
-- Data for Name: forms_blocks_number_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_number_locales" ("label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: forms_blocks_select; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_select" ("_order", "_parent_id", "_path", "id", "name", "width", "placeholder", "required", "block_name") FROM stdin;
\.


--
-- Data for Name: forms_blocks_select_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_select_locales" ("label", "default_value", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: forms_blocks_select_options; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_select_options" ("_order", "_parent_id", "id", "value") FROM stdin;
\.


--
-- Data for Name: forms_blocks_select_options_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_select_options_locales" ("label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: forms_blocks_state; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_state" ("_order", "_parent_id", "_path", "id", "name", "width", "required", "block_name") FROM stdin;
\.


--
-- Data for Name: forms_blocks_state_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_state_locales" ("label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: forms_blocks_text; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_text" ("_order", "_parent_id", "_path", "id", "name", "width", "required", "block_name") FROM stdin;
\.


--
-- Data for Name: forms_blocks_text_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_text_locales" ("label", "default_value", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: forms_blocks_textarea; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_textarea" ("_order", "_parent_id", "_path", "id", "name", "width", "required", "block_name") FROM stdin;
\.


--
-- Data for Name: forms_blocks_textarea_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_blocks_textarea_locales" ("label", "default_value", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: forms_emails; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_emails" ("_order", "_parent_id", "id", "email_to", "cc", "bcc", "reply_to", "email_from") FROM stdin;
\.


--
-- Data for Name: forms_emails_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_emails_locales" ("subject", "message", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: forms_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."forms_locales" ("submit_button_label", "confirmation_message", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: galleryBlock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."galleryBlock" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "type", "block_name") FROM stdin;
\.


--
-- Data for Name: galleryBlock_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."galleryBlock_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant") FROM stdin;
\.


--
-- Data for Name: galleryBlock_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."galleryBlock_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: galleryBlock_interactive_gallery; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."galleryBlock_interactive_gallery" ("_order", "_parent_id", "id") FROM stdin;
\.


--
-- Data for Name: galleryBlock_interactive_gallery_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."galleryBlock_interactive_gallery_locales" ("image_id", "panel_title", "panel_description", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: galleryBlock_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."galleryBlock_locales" ("block_header_badge_label", "block_header_header_text", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: header; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."header" ("id", "updated_at", "created_at") FROM stdin;
70ade6fc-ced2-4f94-958e-854fe2e48eb1	2025-07-27 21:00:12.401+00	2025-07-27 21:00:12.306+00
\.


--
-- Data for Name: header_cta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."header_cta" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant") FROM stdin;
1	70ade6fc-ced2-4f94-958e-854fe2e48eb1	688692cf73e9e43a4a6e3c00	custom	\N	/	neutral	primary
2	70ade6fc-ced2-4f94-958e-854fe2e48eb1	6886930673e9e43a4a6e3c01	custom	\N	https://console.ballurh.io/login?utm_source=new-website	neutral	ghost
\.


--
-- Data for Name: header_cta_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."header_cta_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
اطلب عرض تجريبي	1	ar	688692cf73e9e43a4a6e3c00
تسجيل الدخول	2	ar	6886930673e9e43a4a6e3c01
\.


--
-- Data for Name: header_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."header_rels" ("id", "order", "parent_id", "path", "pages_id", "blog_posts_id") FROM stdin;
\.


--
-- Data for Name: header_tabs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."header_tabs" ("_order", "_parent_id", "id", "enable_direct_link", "enable_dropdown", "link_type", "link_new_tab", "link_url") FROM stdin;
\.


--
-- Data for Name: header_tabs_description_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."header_tabs_description_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url") FROM stdin;
\.


--
-- Data for Name: header_tabs_description_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."header_tabs_description_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: header_tabs_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."header_tabs_locales" ("label", "description", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: header_tabs_nav_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."header_tabs_nav_items" ("_order", "_parent_id", "id", "style", "default_link_link_type", "default_link_link_new_tab", "default_link_link_url", "default_link_link_icon", "default_link_description", "featured_link_tag", "featured_link_label", "list_links_tag") FROM stdin;
\.


--
-- Data for Name: header_tabs_nav_items_featured_link_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."header_tabs_nav_items_featured_link_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_icon") FROM stdin;
\.


--
-- Data for Name: header_tabs_nav_items_featured_link_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."header_tabs_nav_items_featured_link_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: header_tabs_nav_items_list_links_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."header_tabs_nav_items_list_links_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_icon") FROM stdin;
\.


--
-- Data for Name: header_tabs_nav_items_list_links_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."header_tabs_nav_items_list_links_links_locales" ("link_label", "link_description", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: header_tabs_nav_items_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."header_tabs_nav_items_locales" ("default_link_link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: logosBlock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."logosBlock" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "type", "block_name") FROM stdin;
2	a14442b0-9282-4efc-9df0-51d6374608d8	layout	6886953573e9e43a4a6e3c09	center	\N	blue	\N	flex-row	03	\N
\.


--
-- Data for Name: logosBlock_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."logosBlock_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant") FROM stdin;
\.


--
-- Data for Name: logosBlock_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."logosBlock_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: logosBlock_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."logosBlock_locales" ("block_header_badge_label", "block_header_header_text", "id", "_locale", "_parent_id") FROM stdin;
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "منصة مصممة للسوق السعودي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	1	ar	6886953573e9e43a4a6e3c09
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."media" ("id", "prefix", "alt", "caption", "locale", "blurhash", "folder_id", "updated_at", "created_at", "url", "thumbnail_u_r_l", "filename", "mime_type", "filesize", "width", "height", "focal_x", "focal_y", "sizes_thumbnail_url", "sizes_thumbnail_width", "sizes_thumbnail_height", "sizes_thumbnail_mime_type", "sizes_thumbnail_filesize", "sizes_thumbnail_filename", "sizes_square_url", "sizes_square_width", "sizes_square_height", "sizes_square_mime_type", "sizes_square_filesize", "sizes_square_filename", "sizes_small_url", "sizes_small_width", "sizes_small_height", "sizes_small_mime_type", "sizes_small_filesize", "sizes_small_filename", "sizes_medium_url", "sizes_medium_width", "sizes_medium_height", "sizes_medium_mime_type", "sizes_medium_filesize", "sizes_medium_filename", "sizes_large_url", "sizes_large_width", "sizes_large_height", "sizes_large_mime_type", "sizes_large_filesize", "sizes_large_filename", "sizes_xlarge_url", "sizes_xlarge_width", "sizes_xlarge_height", "sizes_xlarge_mime_type", "sizes_xlarge_filesize", "sizes_xlarge_filename", "sizes_og_url", "sizes_og_width", "sizes_og_height", "sizes_og_mime_type", "sizes_og_filesize", "sizes_og_filename") FROM stdin;
5afde42d-6a3f-4d34-a6ba-6eca5caea614	media	لوحة التحكم	\N	ar	data:image/png;base64,UklGRi4AAABXRUJQVlA4ICIAAAAwAQCdASoIAAUAAUAmJaQAA3AA/vzT1uzDU1axcnVLQ4AA	\N	2025-07-27 20:55:45.056+00	2025-07-27 20:55:41.727+00	\N	\N	dashboard-month-ar.png	image/png	312838	3456	2234	50	50	\N	300	194	image/png	27070	dashboard-month-ar-300x194.png	\N	500	500	image/png	63347	dashboard-month-ar-500x500.png	\N	600	388	image/png	71978	dashboard-month-ar-600x388.png	\N	900	582	image/png	125898	dashboard-month-ar-900x582.png	\N	1400	905	image/png	221780	dashboard-month-ar-1400x905.png	\N	1920	1241	image/png	332381	dashboard-month-ar-1920x1241.png	\N	1200	630	image/png	147806	dashboard-month-ar-1200x630.png
fe54a595-3fe0-406c-8274-f5ed27ea3ec5	media	الخصومات	\N	\N	data:image/png;base64,UklGRnAAAABXRUJQVlA4WAoAAAAQAAAABwAAAwAAQUxQSCEAAAAAZoeBhH0RAAHJ//z/9h0AAcP//P/6oWoBjr23vblwSQAAVlA4ICgAAADQAQCdASoIAAQAAUAmJaQAAu0ezRWfAAD+/u3v0SErqwyfGc88IAAA	\N	2025-07-27 20:55:58.633+00	2025-07-27 20:55:56.574+00	\N	\N	disputes faded.png	image/png	628451	2400	1160	50	50	\N	300	145	image/png	22602	disputes faded-300x145.png	\N	500	500	image/png	127019	disputes faded-500x500.png	\N	600	290	image/png	66018	disputes faded-600x290.png	\N	900	435	image/png	149674	disputes faded-900x435.png	\N	1400	677	image/png	391716	disputes faded-1400x677.png	\N	1920	928	image/png	672256	disputes faded-1920x928.png	\N	1200	630	image/png	295010	disputes faded-1200x630.png
cd2d9b5d-5b74-4846-b1eb-85e3535f944a	media	انشاء عرض	\N	\N	data:image/png;base64,UklGRsgAAABXRUJQVlA4WAoAAAAQAAAABwAABgAAQUxQSDkAAAAAMDkBAAAAAQBusZORlZIZAIH1//7+/6AOaOX++fn/1hxV3//9/v/dIEamsbW7vVEEFiQjKCsuCQAAVlA4IGgAAACwAQCdASoIAAcAAUAmJYgCdADze7UQAP7+nPTwp/Ki69DY8oOeCyGl24cQM44/e0UkDsR68kNPBbdg0zJwFXryJZZq7Nyv/A1P7N/T54mO/lZrtOJRVZz2T6OMn83+/2N/j8Dw/gAAAA==	\N	2025-07-27 20:56:08.919+00	2025-07-27 20:56:07.608+00	\N	\N	heatmap faded.png	image/png	553654	1380	1160	50	50	\N	300	252	image/png	66154	heatmap faded-300x252.png	\N	500	500	image/png	183120	heatmap faded-500x500.png	\N	600	504	image/png	216681	heatmap faded-600x504.png	\N	900	757	image/png	425246	heatmap faded-900x757.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1200	630	image/png	500417	heatmap faded-1200x630.png
5b3e3903-897a-4182-a331-61f448da95d0	media	مؤشرات الاداء	\N	\N	data:image/png;base64,UklGRnIAAABXRUJQVlA4WAoAAAAQAAAABwAABAAAQUxQSCkAAAAAy//9///8/2TJ//3///z/acb/+/39+v9ox//9///8/2qczsjMzc3dWABWUDggIgAAADABAJ0BKggABQABQCYlpAADcAD+/KHY+5mH29wVeAUAAAA=	\N	2025-07-27 20:56:14.378+00	2025-07-27 20:56:13.527+00	\N	\N	metrics faded.png	image/png	243942	1200	800	50	50	\N	300	200	image/png	28749	metrics faded-300x200.png	\N	500	500	image/png	108642	metrics faded-500x500.png	\N	600	400	image/png	100804	metrics faded-600x400.png	\N	900	600	image/png	214842	metrics faded-900x600.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1200	630	image/png	174054	metrics faded-1200x630.png
7a8a5f6d-dc53-40ab-9daa-217ee1027234	media	الايرادات	\N	\N	data:image/png;base64,UklGRnwAAABXRUJQVlA4WAoAAAAQAAAABwAABAAAQUxQSCkAAAAAW391q8G9mDLC//39/Pn/dbj/9/z9+f9zu//9///7/3aU0MjLzszfYQBWUDggLAAAANABAJ0BKggABQABQCYlnAAC+t6v+asAAP7+7YAo5z74ysqzbC1HGVjTXgAA	\N	2025-07-27 20:56:19.269+00	2025-07-27 20:56:18.201+00	\N	\N	revenue faded.png	image/png	249003	1200	800	50	50	\N	300	200	image/png	32663	revenue faded-300x200.png	\N	500	500	image/png	107788	revenue faded-500x500.png	\N	600	400	image/png	108484	revenue faded-600x400.png	\N	900	600	image/png	231446	revenue faded-900x600.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1200	630	image/png	162351	revenue faded-1200x630.png
edbc376c-731b-4c47-8220-478db6cd03e4	media	ads-illustration	\N	\N	data:image/png;base64,UklGRjQAAABXRUJQVlA4ICgAAACwAQCdASoIAAgAAUAmJaQAAxZhchnwAP7+7eStHIpOMWmode1LgAAA	\N	2025-07-27 21:05:22.927+00	2025-07-27 21:05:21.953+00	\N	\N	ads.png	image/png	101012	1280	1280	50	50	\N	300	300	image/png	23085	ads-300x300.png	\N	500	500	image/png	46633	ads-500x500.png	\N	600	600	image/png	59717	ads-600x600.png	\N	900	900	image/png	102057	ads-900x900.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1200	630	image/png	81630	ads-1200x630.png
f8f05216-7b1e-4f38-9c78-712c86d1057c	media	connect-illustration	\N	\N	data:image/png;base64,UklGRi4AAABXRUJQVlA4ICIAAAAwAQCdASoIAAgAAUAmJaQAA3AA/vzIq9ycF1SvVGccuAAA	\N	2025-07-27 21:05:25.698+00	2025-07-27 21:05:24.818+00	\N	\N	connect.png	image/png	82555	1280	1280	50	50	\N	300	300	image/png	16743	connect-300x300.png	\N	500	500	image/png	34560	connect-500x500.png	\N	600	600	image/png	44538	connect-600x600.png	\N	900	900	image/png	77071	connect-900x900.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1200	630	image/png	97669	connect-1200x630.png
712fc138-f7e2-48e4-bcc8-5e24ff9e79b7	media	disputes-illustration	\N	\N	data:image/png;base64,UklGRi4AAABXRUJQVlA4ICIAAAAwAQCdASoIAAgAAUAmJaQAA3AA/vzmV99idsXxjsUR+AAA	\N	2025-07-27 21:05:28.432+00	2025-07-27 21:05:27.613+00	\N	\N	disputes.png	image/png	59379	1280	1280	50	50	\N	300	300	image/png	14541	disputes-300x300.png	\N	500	500	image/png	29937	disputes-500x500.png	\N	600	600	image/png	38137	disputes-600x600.png	\N	900	900	image/png	62314	disputes-900x900.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1200	630	image/png	63535	disputes-1200x630.png
513d34fb-5dbc-4333-b0ab-af8e3756cc8a	media	saudi-business-center	\N	\N	\N	\N	2025-07-27 21:09:06.147+00	2025-07-27 21:09:05.82+00	\N	\N	saudi-business-center.svg	image/svg+xml	29585	328	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
92890105-dde4-4c79-acac-d81ad6dd978a	media	saudi-tech	\N	\N	\N	\N	2025-07-27 21:09:07.498+00	2025-07-27 21:09:07.181+00	\N	\N	saudi-tech.svg	image/svg+xml	5476	201	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: media_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."media_rels" ("id", "order", "parent_id", "path", "categories_id") FROM stdin;
\.


--
-- Data for Name: metricsBlock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."metricsBlock" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "type", "table_styling_striped", "table_styling_bordered", "table_styling_compact", "enable_logos", "block_name") FROM stdin;
\.


--
-- Data for Name: metricsBlock_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."metricsBlock_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant") FROM stdin;
\.


--
-- Data for Name: metricsBlock_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."metricsBlock_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: metricsBlock_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."metricsBlock_locales" ("block_header_badge_label", "block_header_header_text", "block_image_media_id", "table_title", "logos_headline", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: metricsBlock_stats; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."metricsBlock_stats" ("_order", "_parent_id", "id", "value", "indicator") FROM stdin;
\.


--
-- Data for Name: metricsBlock_stats_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."metricsBlock_stats_locales" ("label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: metricsBlock_table_headers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."metricsBlock_table_headers" ("_order", "_parent_id", "_locale", "id", "header", "width") FROM stdin;
\.


--
-- Data for Name: metricsBlock_table_rows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."metricsBlock_table_rows" ("_order", "_parent_id", "_locale", "id", "is_expandable") FROM stdin;
\.


--
-- Data for Name: metricsBlock_table_rows_cells; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."metricsBlock_table_rows_cells" ("_order", "_parent_id", "_locale", "id", "content", "is_header") FROM stdin;
\.


--
-- Data for Name: metricsBlock_table_rows_children; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."metricsBlock_table_rows_children" ("_order", "_parent_id", "_locale", "id") FROM stdin;
\.


--
-- Data for Name: metricsBlock_table_rows_children_cells; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."metricsBlock_table_rows_children_cells" ("_order", "_parent_id", "_locale", "id", "content") FROM stdin;
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."pages" ("id", "title", "hero_type", "hero_badge_type", "hero_badge_color", "hero_badge_icon", "hero_badge_icon_position", "hero_caption", "published_at", "slug", "slug_lock", "updated_at", "created_at", "_status") FROM stdin;
a14442b0-9282-4efc-9df0-51d6374608d8	home	highImpact	\N	blue	\N	flex-row	\N	2025-07-27 20:53:08.677+00	home	t	2025-07-27 21:35:16.994+00	2025-07-27 20:48:06.623+00	published
742d2308-808d-4f0e-91f2-03d18be57d5c	\N	lowImpact	\N	blue	\N	flex-row	\N	\N	\N	t	2025-07-27 21:36:50.459+00	2025-07-27 21:36:21.924+00	draft
\.


--
-- Data for Name: pages_hero_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."pages_hero_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant") FROM stdin;
1	a14442b0-9282-4efc-9df0-51d6374608d8	688693af73e9e43a4a6e3c03	custom	\N	/	neutral	primary
2	a14442b0-9282-4efc-9df0-51d6374608d8	688693c973e9e43a4a6e3c04	custom	\N	/	neutral	ghost
\.


--
-- Data for Name: pages_hero_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."pages_hero_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
جرب حاسبة الربحية	3	ar	688693af73e9e43a4a6e3c03
إطلب عرض تجريبي	4	ar	688693c973e9e43a4a6e3c04
\.


--
-- Data for Name: pages_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."pages_locales" ("hero_badge_label", "hero_rich_text", "hero_media_desktop_light_id", "hero_media_desktop_dark_id", "hero_logos_headline", "meta_title", "meta_image_id", "meta_description", "id", "_locale", "_parent_id", "hero_media_mobile_light_id", "hero_media_mobile_dark_id") FROM stdin;
\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "عزز نموك على تطبيقات التوصيل", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "بلّورة تبسّط إدارة التسويق وتحسّن أداء المطاعم على تطبيقات التوصيل من خلال منصة واحدة لإدارة الحملات، تحسين الإنفاق الإعلاني، وزيادة الربحية، بشكل تلقائي وذكي", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "rtl", "textStyle": "", "textFormat": 0}], "direction": "rtl"}}	5afde42d-6a3f-4d34-a6ba-6eca5caea614	\N	\N	\N	\N	\N	4	ar	a14442b0-9282-4efc-9df0-51d6374608d8	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	5	ar	742d2308-808d-4f0e-91f2-03d18be57d5c	\N	\N
\.


--
-- Data for Name: pages_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."pages_rels" ("id", "order", "parent_id", "path", "locale", "pages_id", "blog_posts_id", "media_id", "categories_id", "faq_id", "customers_id") FROM stdin;
1	1	a14442b0-9282-4efc-9df0-51d6374608d8	layout.1.logos	\N	\N	\N	513d34fb-5dbc-4333-b0ab-af8e3756cc8a	\N	\N	\N
2	2	a14442b0-9282-4efc-9df0-51d6374608d8	layout.1.logos	\N	\N	\N	92890105-dde4-4c79-acac-d81ad6dd978a	\N	\N	\N
\.


--
-- Data for Name: payload_folders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."payload_folders" ("id", "name", "folder_id", "updated_at", "created_at") FROM stdin;
\.


--
-- Data for Name: payload_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."payload_jobs" ("id", "input", "completed_at", "total_tried", "has_error", "error", "task_slug", "queue", "wait_until", "processing", "updated_at", "created_at") FROM stdin;
\.


--
-- Data for Name: payload_jobs_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."payload_jobs_log" ("_order", "_parent_id", "id", "executed_at", "completed_at", "task_slug", "task_i_d", "input", "output", "state", "error") FROM stdin;
\.


--
-- Data for Name: payload_locked_documents; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."payload_locked_documents" ("id", "global_slug", "updated_at", "created_at") FROM stdin;
46906555-c3f6-4e58-a387-2e9914e21e75	\N	2025-07-27 21:25:47.849+00	2025-07-27 21:25:47.904+00
84ef5716-7ded-4acc-bb4b-c2e45d758ce8	\N	2025-07-27 21:26:27.525+00	2025-07-27 21:26:27.573+00
98f4a08e-37f2-4acf-b691-812814186bea	\N	2025-07-27 21:53:41.964+00	2025-07-27 21:53:42.017+00
9f9bc525-6fe6-48d9-a323-5ac2fd5a952a	\N	2025-07-27 21:31:18.634+00	2025-07-27 21:31:18.683+00
383c1696-0be9-4c45-97aa-c88cfe26e8fc	\N	2025-07-27 21:31:35.395+00	2025-07-27 21:31:35.443+00
f6d01505-8570-4d0e-85c9-00a3e68f0535	\N	2025-07-27 21:33:19.051+00	2025-07-27 21:33:19.1+00
1779ec8a-fe1f-4fa4-84c7-40e7437970f1	\N	2025-07-27 21:33:45.427+00	2025-07-27 21:33:45.474+00
d518705a-8524-49f7-adf1-f78ec349d249	\N	2025-07-27 21:38:26.007+00	2025-07-27 21:37:58.287+00
d482c50a-c495-49ac-bf14-4c14d236803a	\N	2025-07-27 21:58:25.267+00	2025-07-27 21:58:25.315+00
e8211f10-733e-49fa-b1d6-e77b7f1d3456	\N	2025-07-27 21:38:48.415+00	2025-07-27 21:38:20.604+00
33f03b32-cc79-4a6a-a9d8-59b9a74e2cb3	\N	2025-07-27 21:40:48.746+00	2025-07-27 21:40:20.944+00
50878b37-39bd-4ae4-94bd-0a768ceb57c6	\N	2025-07-27 21:41:40.411+00	2025-07-27 21:41:12.915+00
0a6a3aee-da46-48f0-b277-5bc1558da6fb	\N	2025-07-27 21:22:04.896+00	2025-07-27 21:22:04.987+00
954b3e2c-b292-4ae5-bc78-78bc53c23f1c	\N	2025-07-27 21:22:29.868+00	2025-07-27 21:22:29.916+00
c643d519-8755-4e00-bc7a-5eb52c8f8eb9	\N	2025-07-27 21:22:59.011+00	2025-07-27 21:22:59.064+00
5403f17f-fd3c-4c69-9aaa-97c9fc522567	\N	2025-07-27 21:43:54.833+00	2025-07-27 21:43:54.881+00
b9f18e76-e175-40b3-a36a-522f8c181b0f	\N	2025-07-27 21:50:28.987+00	2025-07-27 21:50:29.035+00
\.


--
-- Data for Name: payload_locked_documents_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."payload_locked_documents_rels" ("id", "order", "parent_id", "path", "pages_id", "blog_posts_id", "media_id", "customers_id", "categories_id", "faq_id", "users_id", "redirects_id", "forms_id", "form_submissions_id", "search_id", "payload_folders_id", "payload_jobs_id") FROM stdin;
\.


--
-- Data for Name: payload_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."payload_migrations" ("id", "name", "batch", "updated_at", "created_at") FROM stdin;
b1b925c3-5879-4f0f-aecd-b4cbe64c15e2	20250726_214623	1	2025-07-27 20:42:56.091+00	2025-07-27 20:42:53.711+00
18fafcc1-407a-41f4-bb6e-3b2563e7f022	20250726_214702	1	2025-07-27 20:42:56.598+00	2025-07-27 20:42:56.464+00
4e1e85e2-9ac7-4846-8f79-e208f80ff6a9	20250727_002055	1	2025-07-27 20:42:57.079+00	2025-07-27 20:42:56.953+00
a9d4c8bf-b456-4511-ab55-0377880a1ff4	20250727_002240	1	2025-07-27 20:42:57.556+00	2025-07-27 20:42:57.432+00
3d0bda74-4cd6-4d82-a303-d50172a523c0	20250727_110508	1	2025-07-27 20:42:58.031+00	2025-07-27 20:42:57.908+00
afe59fcf-c03a-4c3c-83ed-037756afca2a	20250727_131006	1	2025-07-27 20:42:58.506+00	2025-07-27 20:42:58.383+00
0b9db4c7-99f3-4378-9083-1e50d2bae45c	20250727_135302	1	2025-07-27 20:42:58.982+00	2025-07-27 20:42:58.858+00
\.


--
-- Data for Name: payload_preferences; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."payload_preferences" ("id", "key", "value", "updated_at", "created_at") FROM stdin;
fd0e9533-0c05-49dc-85c7-109fbf76d887	customers-list	{"preset": null}	2025-07-27 21:49:04.429+00	2025-07-27 21:49:04.477+00
e30eecd2-135f-419c-bf8d-2475e6d28e37	media-list	{"limit": 10, "preset": null}	2025-07-27 20:56:21.235+00	2025-07-27 20:53:09.834+00
d2f31f20-3c88-4314-b573-102ed2c12d6f	blog-posts-list	{"preset": null}	2025-07-27 21:55:01.171+00	2025-07-27 21:55:01.22+00
0e783cdb-d8e7-4083-a0f9-ce1a3e71f8fb	global-header	{"fields": {"cta": {"collapsed": ["688692cf73e9e43a4a6e3c00", "6886930673e9e43a4a6e3c01"]}}}	2025-07-27 21:00:05.508+00	2025-07-27 20:58:17.258+00
fef32b12-3d42-4fdd-933c-9bdee6b42f95	pages-list	{"limit": 10, "preset": null}	2025-07-27 21:00:31.974+00	2025-07-27 20:47:50.399+00
0d5fde47-87f3-4c1c-90c5-bca704a2c00e	pages-list	{"limit": 10, "preset": null}	2025-07-27 21:00:32.248+00	2025-07-27 21:00:32.296+00
9c1f8ab2-ecb8-4f9f-b278-3bc207f25826	categories-list	{"preset": null}	2025-07-27 21:55:07.733+00	2025-07-27 21:55:07.781+00
7df0e386-9de1-43ef-8633-8179bc57b9fe	collection-pages-742d2308-808d-4f0e-91f2-03d18be57d5c	{"fields": {"layout": {"collapsed": ["68869c85f3705a4904040d2e", "68869cf2f3705a4904040d30"]}, "_index-1": {"tabIndex": 1}, "hero._index-1": {"collapsed": true}, "layout.0.blockHeader._index-1": {"collapsed": true}}}	2025-07-27 21:55:38.102+00	2025-07-27 21:38:07.537+00
974f1685-12c3-409f-b5a2-00e77551a633	collection-pages-a14442b0-9282-4efc-9df0-51d6374608d8	{"fields": {"layout": {"collapsed": ["688694d473e9e43a4a6e3c05", "6886953573e9e43a4a6e3c09", "6886a0cc5a3935fab3feb21c", "688695d673e9e43a4a6e3c0a", "68869a4d5a3935fab3feb217", "68869d495a3935fab3feb219", "6886a0695a3935fab3feb21b"]}, "_index-1": {"tabIndex": 1}, "hero.links": {"collapsed": ["688693af73e9e43a4a6e3c03"]}, "hero._index-3": {"collapsed": false}, "hero._index-4": {"collapsed": false}, "layout.7.list": {"collapsed": []}, "layout.0.columns": {"collapsed": ["688694e973e9e43a4a6e3c06", "688694f973e9e43a4a6e3c07", "6886950873e9e43a4a6e3c08"]}, "layout.2.columns": {"collapsed": []}, "layout.0._index-3": {"collapsed": false}, "layout.7._index-4": {"collapsed": false}, "layout.2.columns.0._index-6": {"collapsed": true}, "layout.2.columns.0._index-8": {"collapsed": false}, "layout.2.columns.1._index-6": {"collapsed": true}, "layout.2.columns.1._index-8": {"collapsed": false}, "layout.2.columns.2._index-8": {"collapsed": false}, "layout.2.blockHeader._index-1": {"collapsed": true}, "layout.3.blockHeader._index-1": {"collapsed": false}, "layout.4.blockHeader._index-3": {"collapsed": false}}}	2025-07-27 22:02:58.356+00	2025-07-27 21:00:42.514+00
\.


--
-- Data for Name: payload_preferences_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."payload_preferences_rels" ("id", "order", "parent_id", "path", "users_id") FROM stdin;
60	\N	fd0e9533-0c05-49dc-85c7-109fbf76d887	user	9bedf5d0-2a99-427f-b0e1-967bbc2487cb
3	\N	e30eecd2-135f-419c-bf8d-2475e6d28e37	user	9bedf5d0-2a99-427f-b0e1-967bbc2487cb
61	\N	d2f31f20-3c88-4314-b573-102ed2c12d6f	user	9bedf5d0-2a99-427f-b0e1-967bbc2487cb
5	\N	0e783cdb-d8e7-4083-a0f9-ce1a3e71f8fb	user	9bedf5d0-2a99-427f-b0e1-967bbc2487cb
6	\N	fef32b12-3d42-4fdd-933c-9bdee6b42f95	user	9bedf5d0-2a99-427f-b0e1-967bbc2487cb
7	\N	0d5fde47-87f3-4c1c-90c5-bca704a2c00e	user	9bedf5d0-2a99-427f-b0e1-967bbc2487cb
62	\N	9c1f8ab2-ecb8-4f9f-b278-3bc207f25826	user	9bedf5d0-2a99-427f-b0e1-967bbc2487cb
63	\N	7df0e386-9de1-43ef-8633-8179bc57b9fe	user	9bedf5d0-2a99-427f-b0e1-967bbc2487cb
72	\N	974f1685-12c3-409f-b5a2-00e77551a633	user	9bedf5d0-2a99-427f-b0e1-967bbc2487cb
\.


--
-- Data for Name: redirects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."redirects" ("id", "from", "to_type", "to_url", "updated_at", "created_at") FROM stdin;
\.


--
-- Data for Name: redirects_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."redirects_rels" ("id", "order", "parent_id", "path", "pages_id", "blog_posts_id") FROM stdin;
\.


--
-- Data for Name: richTextBlock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."richTextBlock" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "type", "max_width", "columns", "block_name") FROM stdin;
\.


--
-- Data for Name: richTextBlock_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."richTextBlock_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant") FROM stdin;
\.


--
-- Data for Name: richTextBlock_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."richTextBlock_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: richTextBlock_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."richTextBlock_locales" ("block_header_badge_label", "block_header_header_text", "content", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: search; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."search" ("id", "priority", "slug", "meta_title", "meta_description", "meta_image_id", "updated_at", "created_at") FROM stdin;
\.


--
-- Data for Name: search_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."search_categories" ("_order", "_parent_id", "id", "relation_to", "category_i_d", "title") FROM stdin;
\.


--
-- Data for Name: search_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."search_locales" ("title", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: search_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."search_rels" ("id", "order", "parent_id", "path", "blog_posts_id") FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."settings" ("id", "announcement_bar_link_type", "announcement_bar_link_new_tab", "announcement_bar_link_url", "custom_head_html", "custom_body_html", "tag_manager_id", "analytics_scripts", "updated_at", "created_at") FROM stdin;
\.


--
-- Data for Name: settings_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."settings_locales" ("meta_title", "meta_image_id", "meta_description", "announcement_bar_text", "announcement_bar_link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: settings_rels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."settings_rels" ("id", "order", "parent_id", "path", "pages_id", "blog_posts_id") FROM stdin;
\.


--
-- Data for Name: testimonialsBlock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."testimonialsBlock" ("_order", "_parent_id", "_path", "id", "block_header_type", "block_header_badge_type", "block_header_badge_color", "block_header_badge_icon", "block_header_badge_icon_position", "type", "block_name", "bg_color") FROM stdin;
\.


--
-- Data for Name: testimonialsBlock_block_header_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."testimonialsBlock_block_header_links" ("_order", "_parent_id", "id", "link_type", "link_new_tab", "link_url", "link_color", "link_variant") FROM stdin;
\.


--
-- Data for Name: testimonialsBlock_block_header_links_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."testimonialsBlock_block_header_links_locales" ("link_label", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: testimonialsBlock_locales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."testimonialsBlock_locales" ("block_header_badge_label", "block_header_header_text", "id", "_locale", "_parent_id") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."users" ("id", "name", "updated_at", "created_at", "email", "reset_password_token", "reset_password_expiration", "salt", "hash", "login_attempts", "lock_until") FROM stdin;
9bedf5d0-2a99-427f-b0e1-967bbc2487cb	Omar Oubari	2025-07-27 20:47:40.333+00	2025-07-27 20:47:39.813+00	omar@byvalence.com	\N	\N	b6859e433a954a48853d890d67c3971200c71d8bf9d93be3cdb59d6ba6e169fe	e646d44017362a68802fe4a24746bba626442a58de948d4b06ae870a8bfdbf82d7f2347b8a93a9d6a1b130101071b775555e2e1090373e662bb14ee31164d0b8e394a8ce970a7349aec8d055e03ffed29848159bb1a4bd84dbb7038cce280c1bd032d183a6cdd03fc374b8603b03e360bcb471b54f00d5232d8d739d5f0b1647bcc7dca08f9d94f9f68fd683800b4f507da51bc283face6600e73cd88b94becb3310848e3a1744758c7fd131d04f3c990dbd707597e92c3f94e349245cf6d8f5a35100ee407132fa7abecdf8495375fd9b895795a17a7f14ded1f556ee0a8bbf586f9529c6175ea573e3281c67e894c16c229867b9d1502dec74559ab6c47cccb120a3b890e1f34fa451ea34d4a19fdd1296904289886e0d433732a3dd33f08a0893d302dcd261d9111abd202e0df1d899ee17c9c385fac59b131c7b1b30744ff1e2ffc244de79b1cd09d3376fc6d765ec743829c7b4d22e577af3e056e76573470f3fbdde26bd1010a8567b70fd54beca60cf754f27d34280645755c7a61a4140fed11018702331d46b89a2b1626906f2b78797b153a0d213c30fa8239302368bccf445ac66b482bba19b059e2a3e69c6b2c4038ccfd56da838d9c73b961c4e545701ce65b485f24be9e9247ba7da584b3170b9abe494dec149b562af012f69e2efbbef19b839ec6e68e8efb4c1111b0ff63336785940681dfe86408fe1eeb0	0	\N
\.


--
-- Name: _archiveBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_archiveBlock_v_block_header_links_locales_id_seq"', 1, false);


--
-- Name: _archiveBlock_v_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_archiveBlock_v_locales_id_seq"', 1, false);


--
-- Name: _blogBlock_v_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_blogBlock_v_locales_id_seq"', 1, false);


--
-- Name: _blog_posts_v_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_blog_posts_v_locales_id_seq"', 1, false);


--
-- Name: _blog_posts_v_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_blog_posts_v_rels_id_seq"', 1, false);


--
-- Name: _callToActionBlock_v_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_callToActionBlock_v_links_locales_id_seq"', 13, true);


--
-- Name: _callToActionBlock_v_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_callToActionBlock_v_locales_id_seq"', 19, true);


--
-- Name: _customHtmlBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_customHtmlBlock_v_block_header_links_locales_id_seq"', 1, false);


--
-- Name: _customHtmlBlock_v_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_customHtmlBlock_v_locales_id_seq"', 1, false);


--
-- Name: _customers_v_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_customers_v_locales_id_seq"', 54, true);


--
-- Name: _customers_v_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_customers_v_rels_id_seq"', 1, false);


--
-- Name: _customers_v_version_testimonial_stats_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_customers_v_version_testimonial_stats_locales_id_seq"', 1, false);


--
-- Name: _faqBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_faqBlock_v_block_header_links_locales_id_seq"', 1, false);


--
-- Name: _faqBlock_v_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_faqBlock_v_locales_id_seq"', 1, false);


--
-- Name: _faq_v_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_faq_v_locales_id_seq"', 1, false);


--
-- Name: _featuresBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_featuresBlock_v_block_header_links_locales_id_seq"', 1, false);


--
-- Name: _featuresBlock_v_columns_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_featuresBlock_v_columns_locales_id_seq"', 1004, true);


--
-- Name: _featuresBlock_v_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_featuresBlock_v_locales_id_seq"', 446, true);


--
-- Name: _galleryBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_galleryBlock_v_block_header_links_locales_id_seq"', 1, false);


--
-- Name: _galleryBlock_v_interactive_gallery_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_galleryBlock_v_interactive_gallery_locales_id_seq"', 1, false);


--
-- Name: _galleryBlock_v_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_galleryBlock_v_locales_id_seq"', 1, false);


--
-- Name: _logosBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_logosBlock_v_block_header_links_locales_id_seq"', 1, false);


--
-- Name: _logosBlock_v_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_logosBlock_v_locales_id_seq"', 165, true);


--
-- Name: _metricsBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_metricsBlock_v_block_header_links_locales_id_seq"', 1, false);


--
-- Name: _metricsBlock_v_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_metricsBlock_v_locales_id_seq"', 1, false);


--
-- Name: _metricsBlock_v_stats_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_metricsBlock_v_stats_locales_id_seq"', 1, false);


--
-- Name: _pages_v_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_pages_v_locales_id_seq"', 226, true);


--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_pages_v_rels_id_seq"', 399, true);


--
-- Name: _pages_v_version_hero_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_pages_v_version_hero_links_locales_id_seq"', 389, true);


--
-- Name: _richTextBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_richTextBlock_v_block_header_links_locales_id_seq"', 1, false);


--
-- Name: _richTextBlock_v_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_richTextBlock_v_locales_id_seq"', 4, true);


--
-- Name: _testimonialsBlock_v_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_testimonialsBlock_v_block_header_links_locales_id_seq"', 1, false);


--
-- Name: _testimonialsBlock_v_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."_testimonialsBlock_v_locales_id_seq"', 1, false);


--
-- Name: archiveBlock_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."archiveBlock_block_header_links_locales_id_seq"', 1, false);


--
-- Name: archiveBlock_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."archiveBlock_locales_id_seq"', 1, false);


--
-- Name: blogBlock_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."blogBlock_locales_id_seq"', 1, false);


--
-- Name: blog_posts_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."blog_posts_locales_id_seq"', 1, false);


--
-- Name: blog_posts_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."blog_posts_rels_id_seq"', 1, false);


--
-- Name: callToActionBlock_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."callToActionBlock_links_locales_id_seq"', 1, false);


--
-- Name: callToActionBlock_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."callToActionBlock_locales_id_seq"', 1, false);


--
-- Name: customHtmlBlock_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."customHtmlBlock_block_header_links_locales_id_seq"', 1, false);


--
-- Name: customHtmlBlock_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."customHtmlBlock_locales_id_seq"', 1, false);


--
-- Name: customers_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."customers_locales_id_seq"', 2, true);


--
-- Name: customers_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."customers_rels_id_seq"', 1, false);


--
-- Name: customers_testimonial_stats_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."customers_testimonial_stats_locales_id_seq"', 1, false);


--
-- Name: faqBlock_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."faqBlock_block_header_links_locales_id_seq"', 1, false);


--
-- Name: faqBlock_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."faqBlock_locales_id_seq"', 1, false);


--
-- Name: faq_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."faq_locales_id_seq"', 1, false);


--
-- Name: featuresBlock_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."featuresBlock_block_header_links_locales_id_seq"', 1, false);


--
-- Name: featuresBlock_columns_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."featuresBlock_columns_locales_id_seq"', 9, true);


--
-- Name: featuresBlock_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."featuresBlock_locales_id_seq"', 4, true);


--
-- Name: footer_columns_nav_items_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."footer_columns_nav_items_locales_id_seq"', 1, false);


--
-- Name: footer_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."footer_rels_id_seq"', 1, false);


--
-- Name: forms_blocks_checkbox_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."forms_blocks_checkbox_locales_id_seq"', 1, false);


--
-- Name: forms_blocks_country_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."forms_blocks_country_locales_id_seq"', 1, false);


--
-- Name: forms_blocks_email_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."forms_blocks_email_locales_id_seq"', 1, false);


--
-- Name: forms_blocks_message_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."forms_blocks_message_locales_id_seq"', 1, false);


--
-- Name: forms_blocks_number_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."forms_blocks_number_locales_id_seq"', 1, false);


--
-- Name: forms_blocks_select_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."forms_blocks_select_locales_id_seq"', 1, false);


--
-- Name: forms_blocks_select_options_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."forms_blocks_select_options_locales_id_seq"', 1, false);


--
-- Name: forms_blocks_state_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."forms_blocks_state_locales_id_seq"', 1, false);


--
-- Name: forms_blocks_text_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."forms_blocks_text_locales_id_seq"', 1, false);


--
-- Name: forms_blocks_textarea_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."forms_blocks_textarea_locales_id_seq"', 1, false);


--
-- Name: forms_emails_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."forms_emails_locales_id_seq"', 1, false);


--
-- Name: forms_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."forms_locales_id_seq"', 1, false);


--
-- Name: galleryBlock_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."galleryBlock_block_header_links_locales_id_seq"', 1, false);


--
-- Name: galleryBlock_interactive_gallery_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."galleryBlock_interactive_gallery_locales_id_seq"', 1, false);


--
-- Name: galleryBlock_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."galleryBlock_locales_id_seq"', 1, false);


--
-- Name: header_cta_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."header_cta_locales_id_seq"', 2, true);


--
-- Name: header_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."header_rels_id_seq"', 1, false);


--
-- Name: header_tabs_description_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."header_tabs_description_links_locales_id_seq"', 1, false);


--
-- Name: header_tabs_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."header_tabs_locales_id_seq"', 1, false);


--
-- Name: header_tabs_nav_items_featured_link_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."header_tabs_nav_items_featured_link_links_locales_id_seq"', 1, false);


--
-- Name: header_tabs_nav_items_list_links_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."header_tabs_nav_items_list_links_links_locales_id_seq"', 1, false);


--
-- Name: header_tabs_nav_items_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."header_tabs_nav_items_locales_id_seq"', 1, false);


--
-- Name: logosBlock_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."logosBlock_block_header_links_locales_id_seq"', 1, false);


--
-- Name: logosBlock_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."logosBlock_locales_id_seq"', 1, true);


--
-- Name: media_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."media_rels_id_seq"', 1, false);


--
-- Name: metricsBlock_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."metricsBlock_block_header_links_locales_id_seq"', 1, false);


--
-- Name: metricsBlock_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."metricsBlock_locales_id_seq"', 1, false);


--
-- Name: metricsBlock_stats_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."metricsBlock_stats_locales_id_seq"', 1, false);


--
-- Name: pages_hero_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."pages_hero_links_locales_id_seq"', 4, true);


--
-- Name: pages_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."pages_locales_id_seq"', 5, true);


--
-- Name: pages_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."pages_rels_id_seq"', 2, true);


--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."payload_locked_documents_rels_id_seq"', 239, true);


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."payload_preferences_rels_id_seq"', 72, true);


--
-- Name: redirects_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."redirects_rels_id_seq"', 1, false);


--
-- Name: richTextBlock_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."richTextBlock_block_header_links_locales_id_seq"', 1, false);


--
-- Name: richTextBlock_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."richTextBlock_locales_id_seq"', 1, false);


--
-- Name: search_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."search_locales_id_seq"', 1, false);


--
-- Name: search_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."search_rels_id_seq"', 1, false);


--
-- Name: settings_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."settings_locales_id_seq"', 1, false);


--
-- Name: settings_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."settings_rels_id_seq"', 1, false);


--
-- Name: testimonialsBlock_block_header_links_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."testimonialsBlock_block_header_links_locales_id_seq"', 1, false);


--
-- Name: testimonialsBlock_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."testimonialsBlock_locales_id_seq"', 1, false);


--
-- Name: _archiveBlock_v_block_header_links_locales _archiveBlock_v_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_archiveBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_archiveBlock_v_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _archiveBlock_v_block_header_links _archiveBlock_v_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_archiveBlock_v_block_header_links"
    ADD CONSTRAINT "_archiveBlock_v_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: _archiveBlock_v_locales _archiveBlock_v_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_archiveBlock_v_locales"
    ADD CONSTRAINT "_archiveBlock_v_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _archiveBlock_v _archiveBlock_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_archiveBlock_v"
    ADD CONSTRAINT "_archiveBlock_v_pkey" PRIMARY KEY ("id");


--
-- Name: _blogBlock_v_locales _blogBlock_v_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blogBlock_v_locales"
    ADD CONSTRAINT "_blogBlock_v_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _blogBlock_v _blogBlock_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blogBlock_v"
    ADD CONSTRAINT "_blogBlock_v_pkey" PRIMARY KEY ("id");


--
-- Name: _blog_posts_v_locales _blog_posts_v_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blog_posts_v_locales"
    ADD CONSTRAINT "_blog_posts_v_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _blog_posts_v _blog_posts_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blog_posts_v"
    ADD CONSTRAINT "_blog_posts_v_pkey" PRIMARY KEY ("id");


--
-- Name: _blog_posts_v_rels _blog_posts_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blog_posts_v_rels"
    ADD CONSTRAINT "_blog_posts_v_rels_pkey" PRIMARY KEY ("id");


--
-- Name: _blog_posts_v_version_populated_authors _blog_posts_v_version_populated_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blog_posts_v_version_populated_authors"
    ADD CONSTRAINT "_blog_posts_v_version_populated_authors_pkey" PRIMARY KEY ("id");


--
-- Name: _callToActionBlock_v_links_locales _callToActionBlock_v_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v_links_locales"
    ADD CONSTRAINT "_callToActionBlock_v_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _callToActionBlock_v_links _callToActionBlock_v_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v_links"
    ADD CONSTRAINT "_callToActionBlock_v_links_pkey" PRIMARY KEY ("id");


--
-- Name: _callToActionBlock_v_list _callToActionBlock_v_list_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v_list"
    ADD CONSTRAINT "_callToActionBlock_v_list_pkey" PRIMARY KEY ("id");


--
-- Name: _callToActionBlock_v_locales _callToActionBlock_v_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v_locales"
    ADD CONSTRAINT "_callToActionBlock_v_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _callToActionBlock_v _callToActionBlock_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v"
    ADD CONSTRAINT "_callToActionBlock_v_pkey" PRIMARY KEY ("id");


--
-- Name: _customHtmlBlock_v_block_header_links_locales _customHtmlBlock_v_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customHtmlBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_customHtmlBlock_v_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _customHtmlBlock_v_block_header_links _customHtmlBlock_v_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customHtmlBlock_v_block_header_links"
    ADD CONSTRAINT "_customHtmlBlock_v_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: _customHtmlBlock_v_locales _customHtmlBlock_v_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customHtmlBlock_v_locales"
    ADD CONSTRAINT "_customHtmlBlock_v_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _customHtmlBlock_v _customHtmlBlock_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customHtmlBlock_v"
    ADD CONSTRAINT "_customHtmlBlock_v_pkey" PRIMARY KEY ("id");


--
-- Name: _customers_v_locales _customers_v_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v_locales"
    ADD CONSTRAINT "_customers_v_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _customers_v _customers_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v"
    ADD CONSTRAINT "_customers_v_pkey" PRIMARY KEY ("id");


--
-- Name: _customers_v_rels _customers_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v_rels"
    ADD CONSTRAINT "_customers_v_rels_pkey" PRIMARY KEY ("id");


--
-- Name: _customers_v_version_testimonial_stats_locales _customers_v_version_testimonial_stats_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v_version_testimonial_stats_locales"
    ADD CONSTRAINT "_customers_v_version_testimonial_stats_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _customers_v_version_testimonial_stats _customers_v_version_testimonial_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v_version_testimonial_stats"
    ADD CONSTRAINT "_customers_v_version_testimonial_stats_pkey" PRIMARY KEY ("id");


--
-- Name: _dividerBlock_v _dividerBlock_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_dividerBlock_v"
    ADD CONSTRAINT "_dividerBlock_v_pkey" PRIMARY KEY ("id");


--
-- Name: _faqBlock_v_block_header_links_locales _faqBlock_v_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_faqBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_faqBlock_v_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _faqBlock_v_block_header_links _faqBlock_v_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_faqBlock_v_block_header_links"
    ADD CONSTRAINT "_faqBlock_v_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: _faqBlock_v_locales _faqBlock_v_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_faqBlock_v_locales"
    ADD CONSTRAINT "_faqBlock_v_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _faqBlock_v _faqBlock_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_faqBlock_v"
    ADD CONSTRAINT "_faqBlock_v_pkey" PRIMARY KEY ("id");


--
-- Name: _faq_v_locales _faq_v_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_faq_v_locales"
    ADD CONSTRAINT "_faq_v_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _faq_v _faq_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_faq_v"
    ADD CONSTRAINT "_faq_v_pkey" PRIMARY KEY ("id");


--
-- Name: _featuresBlock_v_block_header_links_locales _featuresBlock_v_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_featuresBlock_v_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _featuresBlock_v_block_header_links _featuresBlock_v_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v_block_header_links"
    ADD CONSTRAINT "_featuresBlock_v_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: _featuresBlock_v_columns_locales _featuresBlock_v_columns_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v_columns_locales"
    ADD CONSTRAINT "_featuresBlock_v_columns_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _featuresBlock_v_columns _featuresBlock_v_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v_columns"
    ADD CONSTRAINT "_featuresBlock_v_columns_pkey" PRIMARY KEY ("id");


--
-- Name: _featuresBlock_v_locales _featuresBlock_v_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v_locales"
    ADD CONSTRAINT "_featuresBlock_v_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _featuresBlock_v _featuresBlock_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v"
    ADD CONSTRAINT "_featuresBlock_v_pkey" PRIMARY KEY ("id");


--
-- Name: _formBlock_v _formBlock_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_formBlock_v"
    ADD CONSTRAINT "_formBlock_v_pkey" PRIMARY KEY ("id");


--
-- Name: _galleryBlock_v_block_header_links_locales _galleryBlock_v_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_galleryBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_galleryBlock_v_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _galleryBlock_v_block_header_links _galleryBlock_v_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_galleryBlock_v_block_header_links"
    ADD CONSTRAINT "_galleryBlock_v_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: _galleryBlock_v_interactive_gallery_locales _galleryBlock_v_interactive_gallery_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_galleryBlock_v_interactive_gallery_locales"
    ADD CONSTRAINT "_galleryBlock_v_interactive_gallery_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _galleryBlock_v_interactive_gallery _galleryBlock_v_interactive_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_galleryBlock_v_interactive_gallery"
    ADD CONSTRAINT "_galleryBlock_v_interactive_gallery_pkey" PRIMARY KEY ("id");


--
-- Name: _galleryBlock_v_locales _galleryBlock_v_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_galleryBlock_v_locales"
    ADD CONSTRAINT "_galleryBlock_v_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _galleryBlock_v _galleryBlock_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_galleryBlock_v"
    ADD CONSTRAINT "_galleryBlock_v_pkey" PRIMARY KEY ("id");


--
-- Name: _logosBlock_v_block_header_links_locales _logosBlock_v_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_logosBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_logosBlock_v_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _logosBlock_v_block_header_links _logosBlock_v_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_logosBlock_v_block_header_links"
    ADD CONSTRAINT "_logosBlock_v_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: _logosBlock_v_locales _logosBlock_v_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_logosBlock_v_locales"
    ADD CONSTRAINT "_logosBlock_v_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _logosBlock_v _logosBlock_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_logosBlock_v"
    ADD CONSTRAINT "_logosBlock_v_pkey" PRIMARY KEY ("id");


--
-- Name: _metricsBlock_v_block_header_links_locales _metricsBlock_v_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_metricsBlock_v_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _metricsBlock_v_block_header_links _metricsBlock_v_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_block_header_links"
    ADD CONSTRAINT "_metricsBlock_v_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: _metricsBlock_v_locales _metricsBlock_v_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_locales"
    ADD CONSTRAINT "_metricsBlock_v_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _metricsBlock_v _metricsBlock_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v"
    ADD CONSTRAINT "_metricsBlock_v_pkey" PRIMARY KEY ("id");


--
-- Name: _metricsBlock_v_stats_locales _metricsBlock_v_stats_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_stats_locales"
    ADD CONSTRAINT "_metricsBlock_v_stats_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _metricsBlock_v_stats _metricsBlock_v_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_stats"
    ADD CONSTRAINT "_metricsBlock_v_stats_pkey" PRIMARY KEY ("id");


--
-- Name: _metricsBlock_v_table_headers _metricsBlock_v_table_headers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_table_headers"
    ADD CONSTRAINT "_metricsBlock_v_table_headers_pkey" PRIMARY KEY ("id");


--
-- Name: _metricsBlock_v_table_rows_cells _metricsBlock_v_table_rows_cells_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_table_rows_cells"
    ADD CONSTRAINT "_metricsBlock_v_table_rows_cells_pkey" PRIMARY KEY ("id");


--
-- Name: _metricsBlock_v_table_rows_children_cells _metricsBlock_v_table_rows_children_cells_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_table_rows_children_cells"
    ADD CONSTRAINT "_metricsBlock_v_table_rows_children_cells_pkey" PRIMARY KEY ("id");


--
-- Name: _metricsBlock_v_table_rows_children _metricsBlock_v_table_rows_children_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_table_rows_children"
    ADD CONSTRAINT "_metricsBlock_v_table_rows_children_pkey" PRIMARY KEY ("id");


--
-- Name: _metricsBlock_v_table_rows _metricsBlock_v_table_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_table_rows"
    ADD CONSTRAINT "_metricsBlock_v_table_rows_pkey" PRIMARY KEY ("id");


--
-- Name: _pages_v_locales _pages_v_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_locales"
    ADD CONSTRAINT "_pages_v_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _pages_v _pages_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v"
    ADD CONSTRAINT "_pages_v_pkey" PRIMARY KEY ("id");


--
-- Name: _pages_v_rels _pages_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_rels"
    ADD CONSTRAINT "_pages_v_rels_pkey" PRIMARY KEY ("id");


--
-- Name: _pages_v_version_hero_links_locales _pages_v_version_hero_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_version_hero_links_locales"
    ADD CONSTRAINT "_pages_v_version_hero_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _pages_v_version_hero_links _pages_v_version_hero_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_version_hero_links"
    ADD CONSTRAINT "_pages_v_version_hero_links_pkey" PRIMARY KEY ("id");


--
-- Name: _richTextBlock_v_block_header_links_locales _richTextBlock_v_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_richTextBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_richTextBlock_v_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _richTextBlock_v_block_header_links _richTextBlock_v_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_richTextBlock_v_block_header_links"
    ADD CONSTRAINT "_richTextBlock_v_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: _richTextBlock_v_locales _richTextBlock_v_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_richTextBlock_v_locales"
    ADD CONSTRAINT "_richTextBlock_v_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _richTextBlock_v _richTextBlock_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_richTextBlock_v"
    ADD CONSTRAINT "_richTextBlock_v_pkey" PRIMARY KEY ("id");


--
-- Name: _testimonialsBlock_v_block_header_links_locales _testimonialsBlock_v_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_testimonialsBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_testimonialsBlock_v_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _testimonialsBlock_v_block_header_links _testimonialsBlock_v_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_testimonialsBlock_v_block_header_links"
    ADD CONSTRAINT "_testimonialsBlock_v_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: _testimonialsBlock_v_locales _testimonialsBlock_v_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_testimonialsBlock_v_locales"
    ADD CONSTRAINT "_testimonialsBlock_v_locales_pkey" PRIMARY KEY ("id");


--
-- Name: _testimonialsBlock_v _testimonialsBlock_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_testimonialsBlock_v"
    ADD CONSTRAINT "_testimonialsBlock_v_pkey" PRIMARY KEY ("id");


--
-- Name: archiveBlock_block_header_links_locales archiveBlock_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."archiveBlock_block_header_links_locales"
    ADD CONSTRAINT "archiveBlock_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: archiveBlock_block_header_links archiveBlock_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."archiveBlock_block_header_links"
    ADD CONSTRAINT "archiveBlock_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: archiveBlock_locales archiveBlock_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."archiveBlock_locales"
    ADD CONSTRAINT "archiveBlock_locales_pkey" PRIMARY KEY ("id");


--
-- Name: archiveBlock archiveBlock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."archiveBlock"
    ADD CONSTRAINT "archiveBlock_pkey" PRIMARY KEY ("id");


--
-- Name: blogBlock_locales blogBlock_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blogBlock_locales"
    ADD CONSTRAINT "blogBlock_locales_pkey" PRIMARY KEY ("id");


--
-- Name: blogBlock blogBlock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blogBlock"
    ADD CONSTRAINT "blogBlock_pkey" PRIMARY KEY ("id");


--
-- Name: blog_posts_locales blog_posts_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blog_posts_locales"
    ADD CONSTRAINT "blog_posts_locales_pkey" PRIMARY KEY ("id");


--
-- Name: blog_posts blog_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blog_posts"
    ADD CONSTRAINT "blog_posts_pkey" PRIMARY KEY ("id");


--
-- Name: blog_posts_populated_authors blog_posts_populated_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blog_posts_populated_authors"
    ADD CONSTRAINT "blog_posts_populated_authors_pkey" PRIMARY KEY ("id");


--
-- Name: blog_posts_rels blog_posts_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blog_posts_rels"
    ADD CONSTRAINT "blog_posts_rels_pkey" PRIMARY KEY ("id");


--
-- Name: callToActionBlock_links_locales callToActionBlock_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock_links_locales"
    ADD CONSTRAINT "callToActionBlock_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: callToActionBlock_links callToActionBlock_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock_links"
    ADD CONSTRAINT "callToActionBlock_links_pkey" PRIMARY KEY ("id");


--
-- Name: callToActionBlock_list callToActionBlock_list_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock_list"
    ADD CONSTRAINT "callToActionBlock_list_pkey" PRIMARY KEY ("id");


--
-- Name: callToActionBlock_locales callToActionBlock_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock_locales"
    ADD CONSTRAINT "callToActionBlock_locales_pkey" PRIMARY KEY ("id");


--
-- Name: callToActionBlock callToActionBlock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock"
    ADD CONSTRAINT "callToActionBlock_pkey" PRIMARY KEY ("id");


--
-- Name: categories_breadcrumbs categories_breadcrumbs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."categories_breadcrumbs"
    ADD CONSTRAINT "categories_breadcrumbs_pkey" PRIMARY KEY ("id");


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."categories"
    ADD CONSTRAINT "categories_pkey" PRIMARY KEY ("id");


--
-- Name: customHtmlBlock_block_header_links_locales customHtmlBlock_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customHtmlBlock_block_header_links_locales"
    ADD CONSTRAINT "customHtmlBlock_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: customHtmlBlock_block_header_links customHtmlBlock_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customHtmlBlock_block_header_links"
    ADD CONSTRAINT "customHtmlBlock_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: customHtmlBlock_locales customHtmlBlock_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customHtmlBlock_locales"
    ADD CONSTRAINT "customHtmlBlock_locales_pkey" PRIMARY KEY ("id");


--
-- Name: customHtmlBlock customHtmlBlock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customHtmlBlock"
    ADD CONSTRAINT "customHtmlBlock_pkey" PRIMARY KEY ("id");


--
-- Name: customers_locales customers_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers_locales"
    ADD CONSTRAINT "customers_locales_pkey" PRIMARY KEY ("id");


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers"
    ADD CONSTRAINT "customers_pkey" PRIMARY KEY ("id");


--
-- Name: customers_rels customers_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers_rels"
    ADD CONSTRAINT "customers_rels_pkey" PRIMARY KEY ("id");


--
-- Name: customers_testimonial_stats_locales customers_testimonial_stats_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers_testimonial_stats_locales"
    ADD CONSTRAINT "customers_testimonial_stats_locales_pkey" PRIMARY KEY ("id");


--
-- Name: customers_testimonial_stats customers_testimonial_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers_testimonial_stats"
    ADD CONSTRAINT "customers_testimonial_stats_pkey" PRIMARY KEY ("id");


--
-- Name: dividerBlock dividerBlock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."dividerBlock"
    ADD CONSTRAINT "dividerBlock_pkey" PRIMARY KEY ("id");


--
-- Name: faqBlock_block_header_links_locales faqBlock_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."faqBlock_block_header_links_locales"
    ADD CONSTRAINT "faqBlock_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: faqBlock_block_header_links faqBlock_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."faqBlock_block_header_links"
    ADD CONSTRAINT "faqBlock_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: faqBlock_locales faqBlock_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."faqBlock_locales"
    ADD CONSTRAINT "faqBlock_locales_pkey" PRIMARY KEY ("id");


--
-- Name: faqBlock faqBlock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."faqBlock"
    ADD CONSTRAINT "faqBlock_pkey" PRIMARY KEY ("id");


--
-- Name: faq_locales faq_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."faq_locales"
    ADD CONSTRAINT "faq_locales_pkey" PRIMARY KEY ("id");


--
-- Name: faq faq_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."faq"
    ADD CONSTRAINT "faq_pkey" PRIMARY KEY ("id");


--
-- Name: featuresBlock_block_header_links_locales featuresBlock_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock_block_header_links_locales"
    ADD CONSTRAINT "featuresBlock_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: featuresBlock_block_header_links featuresBlock_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock_block_header_links"
    ADD CONSTRAINT "featuresBlock_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: featuresBlock_columns_locales featuresBlock_columns_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock_columns_locales"
    ADD CONSTRAINT "featuresBlock_columns_locales_pkey" PRIMARY KEY ("id");


--
-- Name: featuresBlock_columns featuresBlock_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock_columns"
    ADD CONSTRAINT "featuresBlock_columns_pkey" PRIMARY KEY ("id");


--
-- Name: featuresBlock_locales featuresBlock_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock_locales"
    ADD CONSTRAINT "featuresBlock_locales_pkey" PRIMARY KEY ("id");


--
-- Name: featuresBlock featuresBlock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock"
    ADD CONSTRAINT "featuresBlock_pkey" PRIMARY KEY ("id");


--
-- Name: footer_columns_nav_items_locales footer_columns_nav_items_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."footer_columns_nav_items_locales"
    ADD CONSTRAINT "footer_columns_nav_items_locales_pkey" PRIMARY KEY ("id");


--
-- Name: footer_columns_nav_items footer_columns_nav_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."footer_columns_nav_items"
    ADD CONSTRAINT "footer_columns_nav_items_pkey" PRIMARY KEY ("id");


--
-- Name: footer_columns footer_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."footer_columns"
    ADD CONSTRAINT "footer_columns_pkey" PRIMARY KEY ("id");


--
-- Name: footer footer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."footer"
    ADD CONSTRAINT "footer_pkey" PRIMARY KEY ("id");


--
-- Name: footer_rels footer_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."footer_rels"
    ADD CONSTRAINT "footer_rels_pkey" PRIMARY KEY ("id");


--
-- Name: formBlock formBlock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."formBlock"
    ADD CONSTRAINT "formBlock_pkey" PRIMARY KEY ("id");


--
-- Name: form_submissions form_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."form_submissions"
    ADD CONSTRAINT "form_submissions_pkey" PRIMARY KEY ("id");


--
-- Name: form_submissions_submission_data form_submissions_submission_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."form_submissions_submission_data"
    ADD CONSTRAINT "form_submissions_submission_data_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_checkbox_locales forms_blocks_checkbox_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_checkbox_locales"
    ADD CONSTRAINT "forms_blocks_checkbox_locales_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_checkbox forms_blocks_checkbox_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_checkbox"
    ADD CONSTRAINT "forms_blocks_checkbox_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_country_locales forms_blocks_country_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_country_locales"
    ADD CONSTRAINT "forms_blocks_country_locales_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_country forms_blocks_country_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_country"
    ADD CONSTRAINT "forms_blocks_country_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_email_locales forms_blocks_email_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_email_locales"
    ADD CONSTRAINT "forms_blocks_email_locales_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_email forms_blocks_email_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_email"
    ADD CONSTRAINT "forms_blocks_email_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_message_locales forms_blocks_message_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_message_locales"
    ADD CONSTRAINT "forms_blocks_message_locales_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_message forms_blocks_message_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_message"
    ADD CONSTRAINT "forms_blocks_message_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_number_locales forms_blocks_number_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_number_locales"
    ADD CONSTRAINT "forms_blocks_number_locales_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_number forms_blocks_number_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_number"
    ADD CONSTRAINT "forms_blocks_number_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_select_locales forms_blocks_select_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_select_locales"
    ADD CONSTRAINT "forms_blocks_select_locales_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_select_options_locales forms_blocks_select_options_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_select_options_locales"
    ADD CONSTRAINT "forms_blocks_select_options_locales_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_select_options forms_blocks_select_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_select_options"
    ADD CONSTRAINT "forms_blocks_select_options_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_select forms_blocks_select_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_select"
    ADD CONSTRAINT "forms_blocks_select_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_state_locales forms_blocks_state_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_state_locales"
    ADD CONSTRAINT "forms_blocks_state_locales_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_state forms_blocks_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_state"
    ADD CONSTRAINT "forms_blocks_state_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_text_locales forms_blocks_text_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_text_locales"
    ADD CONSTRAINT "forms_blocks_text_locales_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_text forms_blocks_text_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_text"
    ADD CONSTRAINT "forms_blocks_text_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_textarea_locales forms_blocks_textarea_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_textarea_locales"
    ADD CONSTRAINT "forms_blocks_textarea_locales_pkey" PRIMARY KEY ("id");


--
-- Name: forms_blocks_textarea forms_blocks_textarea_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_textarea"
    ADD CONSTRAINT "forms_blocks_textarea_pkey" PRIMARY KEY ("id");


--
-- Name: forms_emails_locales forms_emails_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_emails_locales"
    ADD CONSTRAINT "forms_emails_locales_pkey" PRIMARY KEY ("id");


--
-- Name: forms_emails forms_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_emails"
    ADD CONSTRAINT "forms_emails_pkey" PRIMARY KEY ("id");


--
-- Name: forms_locales forms_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_locales"
    ADD CONSTRAINT "forms_locales_pkey" PRIMARY KEY ("id");


--
-- Name: forms forms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms"
    ADD CONSTRAINT "forms_pkey" PRIMARY KEY ("id");


--
-- Name: galleryBlock_block_header_links_locales galleryBlock_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."galleryBlock_block_header_links_locales"
    ADD CONSTRAINT "galleryBlock_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: galleryBlock_block_header_links galleryBlock_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."galleryBlock_block_header_links"
    ADD CONSTRAINT "galleryBlock_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: galleryBlock_interactive_gallery_locales galleryBlock_interactive_gallery_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."galleryBlock_interactive_gallery_locales"
    ADD CONSTRAINT "galleryBlock_interactive_gallery_locales_pkey" PRIMARY KEY ("id");


--
-- Name: galleryBlock_interactive_gallery galleryBlock_interactive_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."galleryBlock_interactive_gallery"
    ADD CONSTRAINT "galleryBlock_interactive_gallery_pkey" PRIMARY KEY ("id");


--
-- Name: galleryBlock_locales galleryBlock_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."galleryBlock_locales"
    ADD CONSTRAINT "galleryBlock_locales_pkey" PRIMARY KEY ("id");


--
-- Name: galleryBlock galleryBlock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."galleryBlock"
    ADD CONSTRAINT "galleryBlock_pkey" PRIMARY KEY ("id");


--
-- Name: header_cta_locales header_cta_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_cta_locales"
    ADD CONSTRAINT "header_cta_locales_pkey" PRIMARY KEY ("id");


--
-- Name: header_cta header_cta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_cta"
    ADD CONSTRAINT "header_cta_pkey" PRIMARY KEY ("id");


--
-- Name: header header_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header"
    ADD CONSTRAINT "header_pkey" PRIMARY KEY ("id");


--
-- Name: header_rels header_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_rels"
    ADD CONSTRAINT "header_rels_pkey" PRIMARY KEY ("id");


--
-- Name: header_tabs_description_links_locales header_tabs_description_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_description_links_locales"
    ADD CONSTRAINT "header_tabs_description_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: header_tabs_description_links header_tabs_description_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_description_links"
    ADD CONSTRAINT "header_tabs_description_links_pkey" PRIMARY KEY ("id");


--
-- Name: header_tabs_locales header_tabs_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_locales"
    ADD CONSTRAINT "header_tabs_locales_pkey" PRIMARY KEY ("id");


--
-- Name: header_tabs_nav_items_featured_link_links_locales header_tabs_nav_items_featured_link_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_nav_items_featured_link_links_locales"
    ADD CONSTRAINT "header_tabs_nav_items_featured_link_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: header_tabs_nav_items_featured_link_links header_tabs_nav_items_featured_link_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_nav_items_featured_link_links"
    ADD CONSTRAINT "header_tabs_nav_items_featured_link_links_pkey" PRIMARY KEY ("id");


--
-- Name: header_tabs_nav_items_list_links_links_locales header_tabs_nav_items_list_links_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_nav_items_list_links_links_locales"
    ADD CONSTRAINT "header_tabs_nav_items_list_links_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: header_tabs_nav_items_list_links_links header_tabs_nav_items_list_links_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_nav_items_list_links_links"
    ADD CONSTRAINT "header_tabs_nav_items_list_links_links_pkey" PRIMARY KEY ("id");


--
-- Name: header_tabs_nav_items_locales header_tabs_nav_items_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_nav_items_locales"
    ADD CONSTRAINT "header_tabs_nav_items_locales_pkey" PRIMARY KEY ("id");


--
-- Name: header_tabs_nav_items header_tabs_nav_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_nav_items"
    ADD CONSTRAINT "header_tabs_nav_items_pkey" PRIMARY KEY ("id");


--
-- Name: header_tabs header_tabs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs"
    ADD CONSTRAINT "header_tabs_pkey" PRIMARY KEY ("id");


--
-- Name: logosBlock_block_header_links_locales logosBlock_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."logosBlock_block_header_links_locales"
    ADD CONSTRAINT "logosBlock_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: logosBlock_block_header_links logosBlock_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."logosBlock_block_header_links"
    ADD CONSTRAINT "logosBlock_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: logosBlock_locales logosBlock_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."logosBlock_locales"
    ADD CONSTRAINT "logosBlock_locales_pkey" PRIMARY KEY ("id");


--
-- Name: logosBlock logosBlock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."logosBlock"
    ADD CONSTRAINT "logosBlock_pkey" PRIMARY KEY ("id");


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."media"
    ADD CONSTRAINT "media_pkey" PRIMARY KEY ("id");


--
-- Name: media_rels media_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."media_rels"
    ADD CONSTRAINT "media_rels_pkey" PRIMARY KEY ("id");


--
-- Name: metricsBlock_block_header_links_locales metricsBlock_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_block_header_links_locales"
    ADD CONSTRAINT "metricsBlock_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: metricsBlock_block_header_links metricsBlock_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_block_header_links"
    ADD CONSTRAINT "metricsBlock_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: metricsBlock_locales metricsBlock_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_locales"
    ADD CONSTRAINT "metricsBlock_locales_pkey" PRIMARY KEY ("id");


--
-- Name: metricsBlock metricsBlock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock"
    ADD CONSTRAINT "metricsBlock_pkey" PRIMARY KEY ("id");


--
-- Name: metricsBlock_stats_locales metricsBlock_stats_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_stats_locales"
    ADD CONSTRAINT "metricsBlock_stats_locales_pkey" PRIMARY KEY ("id");


--
-- Name: metricsBlock_stats metricsBlock_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_stats"
    ADD CONSTRAINT "metricsBlock_stats_pkey" PRIMARY KEY ("id");


--
-- Name: metricsBlock_table_headers metricsBlock_table_headers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_table_headers"
    ADD CONSTRAINT "metricsBlock_table_headers_pkey" PRIMARY KEY ("id");


--
-- Name: metricsBlock_table_rows_cells metricsBlock_table_rows_cells_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_table_rows_cells"
    ADD CONSTRAINT "metricsBlock_table_rows_cells_pkey" PRIMARY KEY ("id");


--
-- Name: metricsBlock_table_rows_children_cells metricsBlock_table_rows_children_cells_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_table_rows_children_cells"
    ADD CONSTRAINT "metricsBlock_table_rows_children_cells_pkey" PRIMARY KEY ("id");


--
-- Name: metricsBlock_table_rows_children metricsBlock_table_rows_children_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_table_rows_children"
    ADD CONSTRAINT "metricsBlock_table_rows_children_pkey" PRIMARY KEY ("id");


--
-- Name: metricsBlock_table_rows metricsBlock_table_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_table_rows"
    ADD CONSTRAINT "metricsBlock_table_rows_pkey" PRIMARY KEY ("id");


--
-- Name: pages_hero_links_locales pages_hero_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_hero_links_locales"
    ADD CONSTRAINT "pages_hero_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: pages_hero_links pages_hero_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_hero_links"
    ADD CONSTRAINT "pages_hero_links_pkey" PRIMARY KEY ("id");


--
-- Name: pages_locales pages_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_locales"
    ADD CONSTRAINT "pages_locales_pkey" PRIMARY KEY ("id");


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages"
    ADD CONSTRAINT "pages_pkey" PRIMARY KEY ("id");


--
-- Name: pages_rels pages_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_rels"
    ADD CONSTRAINT "pages_rels_pkey" PRIMARY KEY ("id");


--
-- Name: payload_folders payload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_folders"
    ADD CONSTRAINT "payload_folders_pkey" PRIMARY KEY ("id");


--
-- Name: payload_jobs_log payload_jobs_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_jobs_log"
    ADD CONSTRAINT "payload_jobs_log_pkey" PRIMARY KEY ("id");


--
-- Name: payload_jobs payload_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_jobs"
    ADD CONSTRAINT "payload_jobs_pkey" PRIMARY KEY ("id");


--
-- Name: payload_locked_documents payload_locked_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents"
    ADD CONSTRAINT "payload_locked_documents_pkey" PRIMARY KEY ("id");


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_pkey" PRIMARY KEY ("id");


--
-- Name: payload_migrations payload_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_migrations"
    ADD CONSTRAINT "payload_migrations_pkey" PRIMARY KEY ("id");


--
-- Name: payload_preferences payload_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_preferences"
    ADD CONSTRAINT "payload_preferences_pkey" PRIMARY KEY ("id");


--
-- Name: payload_preferences_rels payload_preferences_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_preferences_rels"
    ADD CONSTRAINT "payload_preferences_rels_pkey" PRIMARY KEY ("id");


--
-- Name: redirects redirects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."redirects"
    ADD CONSTRAINT "redirects_pkey" PRIMARY KEY ("id");


--
-- Name: redirects_rels redirects_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."redirects_rels"
    ADD CONSTRAINT "redirects_rels_pkey" PRIMARY KEY ("id");


--
-- Name: richTextBlock_block_header_links_locales richTextBlock_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."richTextBlock_block_header_links_locales"
    ADD CONSTRAINT "richTextBlock_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: richTextBlock_block_header_links richTextBlock_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."richTextBlock_block_header_links"
    ADD CONSTRAINT "richTextBlock_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: richTextBlock_locales richTextBlock_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."richTextBlock_locales"
    ADD CONSTRAINT "richTextBlock_locales_pkey" PRIMARY KEY ("id");


--
-- Name: richTextBlock richTextBlock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."richTextBlock"
    ADD CONSTRAINT "richTextBlock_pkey" PRIMARY KEY ("id");


--
-- Name: search_categories search_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."search_categories"
    ADD CONSTRAINT "search_categories_pkey" PRIMARY KEY ("id");


--
-- Name: search_locales search_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."search_locales"
    ADD CONSTRAINT "search_locales_pkey" PRIMARY KEY ("id");


--
-- Name: search search_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."search"
    ADD CONSTRAINT "search_pkey" PRIMARY KEY ("id");


--
-- Name: search_rels search_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."search_rels"
    ADD CONSTRAINT "search_rels_pkey" PRIMARY KEY ("id");


--
-- Name: settings_locales settings_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."settings_locales"
    ADD CONSTRAINT "settings_locales_pkey" PRIMARY KEY ("id");


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."settings"
    ADD CONSTRAINT "settings_pkey" PRIMARY KEY ("id");


--
-- Name: settings_rels settings_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."settings_rels"
    ADD CONSTRAINT "settings_rels_pkey" PRIMARY KEY ("id");


--
-- Name: testimonialsBlock_block_header_links_locales testimonialsBlock_block_header_links_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."testimonialsBlock_block_header_links_locales"
    ADD CONSTRAINT "testimonialsBlock_block_header_links_locales_pkey" PRIMARY KEY ("id");


--
-- Name: testimonialsBlock_block_header_links testimonialsBlock_block_header_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."testimonialsBlock_block_header_links"
    ADD CONSTRAINT "testimonialsBlock_block_header_links_pkey" PRIMARY KEY ("id");


--
-- Name: testimonialsBlock_locales testimonialsBlock_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."testimonialsBlock_locales"
    ADD CONSTRAINT "testimonialsBlock_locales_pkey" PRIMARY KEY ("id");


--
-- Name: testimonialsBlock testimonialsBlock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."testimonialsBlock"
    ADD CONSTRAINT "testimonialsBlock_pkey" PRIMARY KEY ("id");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");


--
-- Name: _archiveBlock_v_block_header_links_locales_locale_parent_id_uni; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_archiveBlock_v_block_header_links_locales_locale_parent_id_uni" ON "public"."_archiveBlock_v_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _archiveBlock_v_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_archiveBlock_v_block_header_links_order_idx" ON "public"."_archiveBlock_v_block_header_links" USING "btree" ("_order");


--
-- Name: _archiveBlock_v_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_archiveBlock_v_block_header_links_parent_id_idx" ON "public"."_archiveBlock_v_block_header_links" USING "btree" ("_parent_id");


--
-- Name: _archiveBlock_v_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_archiveBlock_v_locales_locale_parent_id_unique" ON "public"."_archiveBlock_v_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _archiveBlock_v_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_archiveBlock_v_order_idx" ON "public"."_archiveBlock_v" USING "btree" ("_order");


--
-- Name: _archiveBlock_v_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_archiveBlock_v_parent_id_idx" ON "public"."_archiveBlock_v" USING "btree" ("_parent_id");


--
-- Name: _archiveBlock_v_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_archiveBlock_v_path_idx" ON "public"."_archiveBlock_v" USING "btree" ("_path");


--
-- Name: _blogBlock_v_featured_post_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blogBlock_v_featured_post_idx" ON "public"."_blogBlock_v" USING "btree" ("featured_post_id");


--
-- Name: _blogBlock_v_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_blogBlock_v_locales_locale_parent_id_unique" ON "public"."_blogBlock_v_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _blogBlock_v_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blogBlock_v_order_idx" ON "public"."_blogBlock_v" USING "btree" ("_order");


--
-- Name: _blogBlock_v_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blogBlock_v_parent_id_idx" ON "public"."_blogBlock_v" USING "btree" ("_parent_id");


--
-- Name: _blogBlock_v_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blogBlock_v_path_idx" ON "public"."_blogBlock_v" USING "btree" ("_path");


--
-- Name: _blog_posts_v_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_created_at_idx" ON "public"."_blog_posts_v" USING "btree" ("created_at");


--
-- Name: _blog_posts_v_latest_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_latest_idx" ON "public"."_blog_posts_v" USING "btree" ("latest");


--
-- Name: _blog_posts_v_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_blog_posts_v_locales_locale_parent_id_unique" ON "public"."_blog_posts_v_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _blog_posts_v_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_parent_idx" ON "public"."_blog_posts_v" USING "btree" ("parent_id");


--
-- Name: _blog_posts_v_published_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_published_locale_idx" ON "public"."_blog_posts_v" USING "btree" ("published_locale");


--
-- Name: _blog_posts_v_rels_blog_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_rels_blog_posts_id_idx" ON "public"."_blog_posts_v_rels" USING "btree" ("blog_posts_id", "locale");


--
-- Name: _blog_posts_v_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_rels_categories_id_idx" ON "public"."_blog_posts_v_rels" USING "btree" ("categories_id", "locale");


--
-- Name: _blog_posts_v_rels_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_rels_locale_idx" ON "public"."_blog_posts_v_rels" USING "btree" ("locale");


--
-- Name: _blog_posts_v_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_rels_order_idx" ON "public"."_blog_posts_v_rels" USING "btree" ("order");


--
-- Name: _blog_posts_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_rels_parent_idx" ON "public"."_blog_posts_v_rels" USING "btree" ("parent_id");


--
-- Name: _blog_posts_v_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_rels_path_idx" ON "public"."_blog_posts_v_rels" USING "btree" ("path");


--
-- Name: _blog_posts_v_rels_users_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_rels_users_id_idx" ON "public"."_blog_posts_v_rels" USING "btree" ("users_id", "locale");


--
-- Name: _blog_posts_v_snapshot_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_snapshot_idx" ON "public"."_blog_posts_v" USING "btree" ("snapshot");


--
-- Name: _blog_posts_v_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_updated_at_idx" ON "public"."_blog_posts_v" USING "btree" ("updated_at");


--
-- Name: _blog_posts_v_version_meta_version_meta_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_version_meta_version_meta_image_idx" ON "public"."_blog_posts_v_locales" USING "btree" ("version_meta_image_id");


--
-- Name: _blog_posts_v_version_populated_authors_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_version_populated_authors_order_idx" ON "public"."_blog_posts_v_version_populated_authors" USING "btree" ("_order");


--
-- Name: _blog_posts_v_version_populated_authors_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_version_populated_authors_parent_id_idx" ON "public"."_blog_posts_v_version_populated_authors" USING "btree" ("_parent_id");


--
-- Name: _blog_posts_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_version_version__status_idx" ON "public"."_blog_posts_v" USING "btree" ("version__status");


--
-- Name: _blog_posts_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_version_version_created_at_idx" ON "public"."_blog_posts_v" USING "btree" ("version_created_at");


--
-- Name: _blog_posts_v_version_version_hero_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_version_version_hero_image_idx" ON "public"."_blog_posts_v_locales" USING "btree" ("version_hero_image_id", "_locale");


--
-- Name: _blog_posts_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_version_version_slug_idx" ON "public"."_blog_posts_v" USING "btree" ("version_slug");


--
-- Name: _blog_posts_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_blog_posts_v_version_version_updated_at_idx" ON "public"."_blog_posts_v" USING "btree" ("version_updated_at");


--
-- Name: _callToActionBlock_v_form_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_callToActionBlock_v_form_idx" ON "public"."_callToActionBlock_v" USING "btree" ("form_id");


--
-- Name: _callToActionBlock_v_links_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_callToActionBlock_v_links_locales_locale_parent_id_unique" ON "public"."_callToActionBlock_v_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _callToActionBlock_v_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_callToActionBlock_v_links_order_idx" ON "public"."_callToActionBlock_v_links" USING "btree" ("_order");


--
-- Name: _callToActionBlock_v_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_callToActionBlock_v_links_parent_id_idx" ON "public"."_callToActionBlock_v_links" USING "btree" ("_parent_id");


--
-- Name: _callToActionBlock_v_list_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_callToActionBlock_v_list_locale_idx" ON "public"."_callToActionBlock_v_list" USING "btree" ("_locale");


--
-- Name: _callToActionBlock_v_list_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_callToActionBlock_v_list_order_idx" ON "public"."_callToActionBlock_v_list" USING "btree" ("_order");


--
-- Name: _callToActionBlock_v_list_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_callToActionBlock_v_list_parent_id_idx" ON "public"."_callToActionBlock_v_list" USING "btree" ("_parent_id");


--
-- Name: _callToActionBlock_v_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_callToActionBlock_v_locales_locale_parent_id_unique" ON "public"."_callToActionBlock_v_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _callToActionBlock_v_media_desktop_media_desktop_dark_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_callToActionBlock_v_media_desktop_media_desktop_dark_idx" ON "public"."_callToActionBlock_v_locales" USING "btree" ("media_desktop_dark_id", "_locale");


--
-- Name: _callToActionBlock_v_media_desktop_media_desktop_light_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_callToActionBlock_v_media_desktop_media_desktop_light_idx" ON "public"."_callToActionBlock_v_locales" USING "btree" ("media_desktop_light_id", "_locale");


--
-- Name: _callToActionBlock_v_media_mobile_media_mobile_dark_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_callToActionBlock_v_media_mobile_media_mobile_dark_idx" ON "public"."_callToActionBlock_v_locales" USING "btree" ("media_mobile_dark_id", "_locale");


--
-- Name: _callToActionBlock_v_media_mobile_media_mobile_light_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_callToActionBlock_v_media_mobile_media_mobile_light_idx" ON "public"."_callToActionBlock_v_locales" USING "btree" ("media_mobile_light_id", "_locale");


--
-- Name: _callToActionBlock_v_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_callToActionBlock_v_order_idx" ON "public"."_callToActionBlock_v" USING "btree" ("_order");


--
-- Name: _callToActionBlock_v_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_callToActionBlock_v_parent_id_idx" ON "public"."_callToActionBlock_v" USING "btree" ("_parent_id");


--
-- Name: _callToActionBlock_v_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_callToActionBlock_v_path_idx" ON "public"."_callToActionBlock_v" USING "btree" ("_path");


--
-- Name: _customHtmlBlock_v_block_header_links_locales_locale_parent_id_; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_customHtmlBlock_v_block_header_links_locales_locale_parent_id_" ON "public"."_customHtmlBlock_v_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _customHtmlBlock_v_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customHtmlBlock_v_block_header_links_order_idx" ON "public"."_customHtmlBlock_v_block_header_links" USING "btree" ("_order");


--
-- Name: _customHtmlBlock_v_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customHtmlBlock_v_block_header_links_parent_id_idx" ON "public"."_customHtmlBlock_v_block_header_links" USING "btree" ("_parent_id");


--
-- Name: _customHtmlBlock_v_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_customHtmlBlock_v_locales_locale_parent_id_unique" ON "public"."_customHtmlBlock_v_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _customHtmlBlock_v_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customHtmlBlock_v_order_idx" ON "public"."_customHtmlBlock_v" USING "btree" ("_order");


--
-- Name: _customHtmlBlock_v_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customHtmlBlock_v_parent_id_idx" ON "public"."_customHtmlBlock_v" USING "btree" ("_parent_id");


--
-- Name: _customHtmlBlock_v_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customHtmlBlock_v_path_idx" ON "public"."_customHtmlBlock_v" USING "btree" ("_path");


--
-- Name: _customers_v_autosave_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_autosave_idx" ON "public"."_customers_v" USING "btree" ("autosave");


--
-- Name: _customers_v_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_created_at_idx" ON "public"."_customers_v" USING "btree" ("created_at");


--
-- Name: _customers_v_latest_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_latest_idx" ON "public"."_customers_v" USING "btree" ("latest");


--
-- Name: _customers_v_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_customers_v_locales_locale_parent_id_unique" ON "public"."_customers_v_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _customers_v_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_parent_idx" ON "public"."_customers_v" USING "btree" ("parent_id");


--
-- Name: _customers_v_published_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_published_locale_idx" ON "public"."_customers_v" USING "btree" ("published_locale");


--
-- Name: _customers_v_rels_blog_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_rels_blog_posts_id_idx" ON "public"."_customers_v_rels" USING "btree" ("blog_posts_id");


--
-- Name: _customers_v_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_rels_categories_id_idx" ON "public"."_customers_v_rels" USING "btree" ("categories_id");


--
-- Name: _customers_v_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_rels_order_idx" ON "public"."_customers_v_rels" USING "btree" ("order");


--
-- Name: _customers_v_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_rels_pages_id_idx" ON "public"."_customers_v_rels" USING "btree" ("pages_id");


--
-- Name: _customers_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_rels_parent_idx" ON "public"."_customers_v_rels" USING "btree" ("parent_id");


--
-- Name: _customers_v_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_rels_path_idx" ON "public"."_customers_v_rels" USING "btree" ("path");


--
-- Name: _customers_v_snapshot_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_snapshot_idx" ON "public"."_customers_v" USING "btree" ("snapshot");


--
-- Name: _customers_v_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_updated_at_idx" ON "public"."_customers_v" USING "btree" ("updated_at");


--
-- Name: _customers_v_version_testimonial_author_info_version_testimonia; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_version_testimonial_author_info_version_testimonia" ON "public"."_customers_v" USING "btree" ("version_testimonial_author_info_avatar_id");


--
-- Name: _customers_v_version_testimonial_company_version_testimonial_co; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_version_testimonial_company_version_testimonial_co" ON "public"."_customers_v" USING "btree" ("version_testimonial_company_company_logo_id");


--
-- Name: _customers_v_version_testimonial_stats_locales_locale_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_customers_v_version_testimonial_stats_locales_locale_parent_id" ON "public"."_customers_v_version_testimonial_stats_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _customers_v_version_testimonial_stats_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_version_testimonial_stats_order_idx" ON "public"."_customers_v_version_testimonial_stats" USING "btree" ("_order");


--
-- Name: _customers_v_version_testimonial_stats_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_version_testimonial_stats_parent_id_idx" ON "public"."_customers_v_version_testimonial_stats" USING "btree" ("_parent_id");


--
-- Name: _customers_v_version_testimonial_version_testimonial_featured_i; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_version_testimonial_version_testimonial_featured_i" ON "public"."_customers_v" USING "btree" ("version_testimonial_featured_image_id");


--
-- Name: _customers_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_version_version__status_idx" ON "public"."_customers_v" USING "btree" ("version__status");


--
-- Name: _customers_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_version_version_created_at_idx" ON "public"."_customers_v" USING "btree" ("version_created_at");


--
-- Name: _customers_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_version_version_slug_idx" ON "public"."_customers_v" USING "btree" ("version_slug");


--
-- Name: _customers_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_customers_v_version_version_updated_at_idx" ON "public"."_customers_v" USING "btree" ("version_updated_at");


--
-- Name: _dividerBlock_v_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_dividerBlock_v_order_idx" ON "public"."_dividerBlock_v" USING "btree" ("_order");


--
-- Name: _dividerBlock_v_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_dividerBlock_v_parent_id_idx" ON "public"."_dividerBlock_v" USING "btree" ("_parent_id");


--
-- Name: _dividerBlock_v_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_dividerBlock_v_path_idx" ON "public"."_dividerBlock_v" USING "btree" ("_path");


--
-- Name: _faqBlock_v_block_header_links_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_faqBlock_v_block_header_links_locales_locale_parent_id_unique" ON "public"."_faqBlock_v_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _faqBlock_v_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_faqBlock_v_block_header_links_order_idx" ON "public"."_faqBlock_v_block_header_links" USING "btree" ("_order");


--
-- Name: _faqBlock_v_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_faqBlock_v_block_header_links_parent_id_idx" ON "public"."_faqBlock_v_block_header_links" USING "btree" ("_parent_id");


--
-- Name: _faqBlock_v_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_faqBlock_v_locales_locale_parent_id_unique" ON "public"."_faqBlock_v_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _faqBlock_v_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_faqBlock_v_order_idx" ON "public"."_faqBlock_v" USING "btree" ("_order");


--
-- Name: _faqBlock_v_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_faqBlock_v_parent_id_idx" ON "public"."_faqBlock_v" USING "btree" ("_parent_id");


--
-- Name: _faqBlock_v_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_faqBlock_v_path_idx" ON "public"."_faqBlock_v" USING "btree" ("_path");


--
-- Name: _faq_v_autosave_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_faq_v_autosave_idx" ON "public"."_faq_v" USING "btree" ("autosave");


--
-- Name: _faq_v_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_faq_v_created_at_idx" ON "public"."_faq_v" USING "btree" ("created_at");


--
-- Name: _faq_v_latest_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_faq_v_latest_idx" ON "public"."_faq_v" USING "btree" ("latest");


--
-- Name: _faq_v_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_faq_v_locales_locale_parent_id_unique" ON "public"."_faq_v_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _faq_v_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_faq_v_parent_idx" ON "public"."_faq_v" USING "btree" ("parent_id");


--
-- Name: _faq_v_published_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_faq_v_published_locale_idx" ON "public"."_faq_v" USING "btree" ("published_locale");


--
-- Name: _faq_v_snapshot_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_faq_v_snapshot_idx" ON "public"."_faq_v" USING "btree" ("snapshot");


--
-- Name: _faq_v_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_faq_v_updated_at_idx" ON "public"."_faq_v" USING "btree" ("updated_at");


--
-- Name: _faq_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_faq_v_version_version__status_idx" ON "public"."_faq_v" USING "btree" ("version__status");


--
-- Name: _faq_v_version_version_category_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_faq_v_version_version_category_idx" ON "public"."_faq_v" USING "btree" ("version_category_id");


--
-- Name: _faq_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_faq_v_version_version_created_at_idx" ON "public"."_faq_v" USING "btree" ("version_created_at");


--
-- Name: _faq_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_faq_v_version_version_updated_at_idx" ON "public"."_faq_v" USING "btree" ("version_updated_at");


--
-- Name: _featuresBlock_v_block_header_links_locales_locale_parent_id_un; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_featuresBlock_v_block_header_links_locales_locale_parent_id_un" ON "public"."_featuresBlock_v_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _featuresBlock_v_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_featuresBlock_v_block_header_links_order_idx" ON "public"."_featuresBlock_v_block_header_links" USING "btree" ("_order");


--
-- Name: _featuresBlock_v_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_featuresBlock_v_block_header_links_parent_id_idx" ON "public"."_featuresBlock_v_block_header_links" USING "btree" ("_parent_id");


--
-- Name: _featuresBlock_v_block_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_featuresBlock_v_block_image_idx" ON "public"."_featuresBlock_v" USING "btree" ("block_image_id");


--
-- Name: _featuresBlock_v_columns_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_featuresBlock_v_columns_image_idx" ON "public"."_featuresBlock_v_columns_locales" USING "btree" ("image_id", "_locale");


--
-- Name: _featuresBlock_v_columns_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_featuresBlock_v_columns_locales_locale_parent_id_unique" ON "public"."_featuresBlock_v_columns_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _featuresBlock_v_columns_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_featuresBlock_v_columns_order_idx" ON "public"."_featuresBlock_v_columns" USING "btree" ("_order");


--
-- Name: _featuresBlock_v_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_featuresBlock_v_columns_parent_id_idx" ON "public"."_featuresBlock_v_columns" USING "btree" ("_parent_id");


--
-- Name: _featuresBlock_v_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_featuresBlock_v_locales_locale_parent_id_unique" ON "public"."_featuresBlock_v_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _featuresBlock_v_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_featuresBlock_v_order_idx" ON "public"."_featuresBlock_v" USING "btree" ("_order");


--
-- Name: _featuresBlock_v_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_featuresBlock_v_parent_id_idx" ON "public"."_featuresBlock_v" USING "btree" ("_parent_id");


--
-- Name: _featuresBlock_v_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_featuresBlock_v_path_idx" ON "public"."_featuresBlock_v" USING "btree" ("_path");


--
-- Name: _formBlock_v_form_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_formBlock_v_form_idx" ON "public"."_formBlock_v" USING "btree" ("form_id");


--
-- Name: _formBlock_v_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_formBlock_v_order_idx" ON "public"."_formBlock_v" USING "btree" ("_order");


--
-- Name: _formBlock_v_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_formBlock_v_parent_id_idx" ON "public"."_formBlock_v" USING "btree" ("_parent_id");


--
-- Name: _formBlock_v_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_formBlock_v_path_idx" ON "public"."_formBlock_v" USING "btree" ("_path");


--
-- Name: _galleryBlock_v_block_header_links_locales_locale_parent_id_uni; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_galleryBlock_v_block_header_links_locales_locale_parent_id_uni" ON "public"."_galleryBlock_v_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _galleryBlock_v_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_galleryBlock_v_block_header_links_order_idx" ON "public"."_galleryBlock_v_block_header_links" USING "btree" ("_order");


--
-- Name: _galleryBlock_v_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_galleryBlock_v_block_header_links_parent_id_idx" ON "public"."_galleryBlock_v_block_header_links" USING "btree" ("_parent_id");


--
-- Name: _galleryBlock_v_interactive_gallery_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_galleryBlock_v_interactive_gallery_image_idx" ON "public"."_galleryBlock_v_interactive_gallery_locales" USING "btree" ("image_id", "_locale");


--
-- Name: _galleryBlock_v_interactive_gallery_locales_locale_parent_id_un; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_galleryBlock_v_interactive_gallery_locales_locale_parent_id_un" ON "public"."_galleryBlock_v_interactive_gallery_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _galleryBlock_v_interactive_gallery_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_galleryBlock_v_interactive_gallery_order_idx" ON "public"."_galleryBlock_v_interactive_gallery" USING "btree" ("_order");


--
-- Name: _galleryBlock_v_interactive_gallery_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_galleryBlock_v_interactive_gallery_parent_id_idx" ON "public"."_galleryBlock_v_interactive_gallery" USING "btree" ("_parent_id");


--
-- Name: _galleryBlock_v_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_galleryBlock_v_locales_locale_parent_id_unique" ON "public"."_galleryBlock_v_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _galleryBlock_v_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_galleryBlock_v_order_idx" ON "public"."_galleryBlock_v" USING "btree" ("_order");


--
-- Name: _galleryBlock_v_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_galleryBlock_v_parent_id_idx" ON "public"."_galleryBlock_v" USING "btree" ("_parent_id");


--
-- Name: _galleryBlock_v_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_galleryBlock_v_path_idx" ON "public"."_galleryBlock_v" USING "btree" ("_path");


--
-- Name: _logosBlock_v_block_header_links_locales_locale_parent_id_uniqu; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_logosBlock_v_block_header_links_locales_locale_parent_id_uniqu" ON "public"."_logosBlock_v_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _logosBlock_v_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_logosBlock_v_block_header_links_order_idx" ON "public"."_logosBlock_v_block_header_links" USING "btree" ("_order");


--
-- Name: _logosBlock_v_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_logosBlock_v_block_header_links_parent_id_idx" ON "public"."_logosBlock_v_block_header_links" USING "btree" ("_parent_id");


--
-- Name: _logosBlock_v_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_logosBlock_v_locales_locale_parent_id_unique" ON "public"."_logosBlock_v_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _logosBlock_v_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_logosBlock_v_order_idx" ON "public"."_logosBlock_v" USING "btree" ("_order");


--
-- Name: _logosBlock_v_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_logosBlock_v_parent_id_idx" ON "public"."_logosBlock_v" USING "btree" ("_parent_id");


--
-- Name: _logosBlock_v_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_logosBlock_v_path_idx" ON "public"."_logosBlock_v" USING "btree" ("_path");


--
-- Name: _metricsBlock_v_block_header_links_locales_locale_parent_id_uni; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_metricsBlock_v_block_header_links_locales_locale_parent_id_uni" ON "public"."_metricsBlock_v_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _metricsBlock_v_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_block_header_links_order_idx" ON "public"."_metricsBlock_v_block_header_links" USING "btree" ("_order");


--
-- Name: _metricsBlock_v_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_block_header_links_parent_id_idx" ON "public"."_metricsBlock_v_block_header_links" USING "btree" ("_parent_id");


--
-- Name: _metricsBlock_v_block_image_block_image_media_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_block_image_block_image_media_idx" ON "public"."_metricsBlock_v_locales" USING "btree" ("block_image_media_id");


--
-- Name: _metricsBlock_v_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_metricsBlock_v_locales_locale_parent_id_unique" ON "public"."_metricsBlock_v_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _metricsBlock_v_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_order_idx" ON "public"."_metricsBlock_v" USING "btree" ("_order");


--
-- Name: _metricsBlock_v_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_parent_id_idx" ON "public"."_metricsBlock_v" USING "btree" ("_parent_id");


--
-- Name: _metricsBlock_v_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_path_idx" ON "public"."_metricsBlock_v" USING "btree" ("_path");


--
-- Name: _metricsBlock_v_stats_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_metricsBlock_v_stats_locales_locale_parent_id_unique" ON "public"."_metricsBlock_v_stats_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _metricsBlock_v_stats_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_stats_order_idx" ON "public"."_metricsBlock_v_stats" USING "btree" ("_order");


--
-- Name: _metricsBlock_v_stats_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_stats_parent_id_idx" ON "public"."_metricsBlock_v_stats" USING "btree" ("_parent_id");


--
-- Name: _metricsBlock_v_table_headers_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_table_headers_locale_idx" ON "public"."_metricsBlock_v_table_headers" USING "btree" ("_locale");


--
-- Name: _metricsBlock_v_table_headers_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_table_headers_order_idx" ON "public"."_metricsBlock_v_table_headers" USING "btree" ("_order");


--
-- Name: _metricsBlock_v_table_headers_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_table_headers_parent_id_idx" ON "public"."_metricsBlock_v_table_headers" USING "btree" ("_parent_id");


--
-- Name: _metricsBlock_v_table_rows_cells_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_table_rows_cells_locale_idx" ON "public"."_metricsBlock_v_table_rows_cells" USING "btree" ("_locale");


--
-- Name: _metricsBlock_v_table_rows_cells_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_table_rows_cells_order_idx" ON "public"."_metricsBlock_v_table_rows_cells" USING "btree" ("_order");


--
-- Name: _metricsBlock_v_table_rows_cells_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_table_rows_cells_parent_id_idx" ON "public"."_metricsBlock_v_table_rows_cells" USING "btree" ("_parent_id");


--
-- Name: _metricsBlock_v_table_rows_children_cells_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_table_rows_children_cells_locale_idx" ON "public"."_metricsBlock_v_table_rows_children_cells" USING "btree" ("_locale");


--
-- Name: _metricsBlock_v_table_rows_children_cells_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_table_rows_children_cells_order_idx" ON "public"."_metricsBlock_v_table_rows_children_cells" USING "btree" ("_order");


--
-- Name: _metricsBlock_v_table_rows_children_cells_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_table_rows_children_cells_parent_id_idx" ON "public"."_metricsBlock_v_table_rows_children_cells" USING "btree" ("_parent_id");


--
-- Name: _metricsBlock_v_table_rows_children_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_table_rows_children_locale_idx" ON "public"."_metricsBlock_v_table_rows_children" USING "btree" ("_locale");


--
-- Name: _metricsBlock_v_table_rows_children_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_table_rows_children_order_idx" ON "public"."_metricsBlock_v_table_rows_children" USING "btree" ("_order");


--
-- Name: _metricsBlock_v_table_rows_children_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_table_rows_children_parent_id_idx" ON "public"."_metricsBlock_v_table_rows_children" USING "btree" ("_parent_id");


--
-- Name: _metricsBlock_v_table_rows_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_table_rows_locale_idx" ON "public"."_metricsBlock_v_table_rows" USING "btree" ("_locale");


--
-- Name: _metricsBlock_v_table_rows_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_table_rows_order_idx" ON "public"."_metricsBlock_v_table_rows" USING "btree" ("_order");


--
-- Name: _metricsBlock_v_table_rows_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_metricsBlock_v_table_rows_parent_id_idx" ON "public"."_metricsBlock_v_table_rows" USING "btree" ("_parent_id");


--
-- Name: _pages_v_autosave_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_autosave_idx" ON "public"."_pages_v" USING "btree" ("autosave");


--
-- Name: _pages_v_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_created_at_idx" ON "public"."_pages_v" USING "btree" ("created_at");


--
-- Name: _pages_v_latest_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_latest_idx" ON "public"."_pages_v" USING "btree" ("latest");


--
-- Name: _pages_v_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_pages_v_locales_locale_parent_id_unique" ON "public"."_pages_v_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _pages_v_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_parent_idx" ON "public"."_pages_v" USING "btree" ("parent_id");


--
-- Name: _pages_v_published_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_published_locale_idx" ON "public"."_pages_v" USING "btree" ("published_locale");


--
-- Name: _pages_v_rels_blog_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_rels_blog_posts_id_idx" ON "public"."_pages_v_rels" USING "btree" ("blog_posts_id", "locale");


--
-- Name: _pages_v_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_rels_categories_id_idx" ON "public"."_pages_v_rels" USING "btree" ("categories_id", "locale");


--
-- Name: _pages_v_rels_customers_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_rels_customers_id_idx" ON "public"."_pages_v_rels" USING "btree" ("customers_id", "locale");


--
-- Name: _pages_v_rels_faq_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_rels_faq_id_idx" ON "public"."_pages_v_rels" USING "btree" ("faq_id", "locale");


--
-- Name: _pages_v_rels_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_rels_locale_idx" ON "public"."_pages_v_rels" USING "btree" ("locale");


--
-- Name: _pages_v_rels_media_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_rels_media_id_idx" ON "public"."_pages_v_rels" USING "btree" ("media_id", "locale");


--
-- Name: _pages_v_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_rels_order_idx" ON "public"."_pages_v_rels" USING "btree" ("order");


--
-- Name: _pages_v_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_rels_pages_id_idx" ON "public"."_pages_v_rels" USING "btree" ("pages_id", "locale");


--
-- Name: _pages_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_rels_parent_idx" ON "public"."_pages_v_rels" USING "btree" ("parent_id");


--
-- Name: _pages_v_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_rels_path_idx" ON "public"."_pages_v_rels" USING "btree" ("path");


--
-- Name: _pages_v_snapshot_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_snapshot_idx" ON "public"."_pages_v" USING "btree" ("snapshot");


--
-- Name: _pages_v_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_updated_at_idx" ON "public"."_pages_v" USING "btree" ("updated_at");


--
-- Name: _pages_v_version_hero_links_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_pages_v_version_hero_links_locales_locale_parent_id_unique" ON "public"."_pages_v_version_hero_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _pages_v_version_hero_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_version_hero_links_order_idx" ON "public"."_pages_v_version_hero_links" USING "btree" ("_order");


--
-- Name: _pages_v_version_hero_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_version_hero_links_parent_id_idx" ON "public"."_pages_v_version_hero_links" USING "btree" ("_parent_id");


--
-- Name: _pages_v_version_hero_media_desktop_version_hero_media_desktop_; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_version_hero_media_desktop_version_hero_media_desktop_" ON "public"."_pages_v_locales" USING "btree" ("version_hero_media_desktop_light_id", "_locale");


--
-- Name: _pages_v_version_hero_media_mobile_version_hero_media_mobile_da; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_version_hero_media_mobile_version_hero_media_mobile_da" ON "public"."_pages_v_locales" USING "btree" ("version_hero_media_mobile_dark_id", "_locale");


--
-- Name: _pages_v_version_hero_media_mobile_version_hero_media_mobile_li; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_version_hero_media_mobile_version_hero_media_mobile_li" ON "public"."_pages_v_locales" USING "btree" ("version_hero_media_mobile_light_id", "_locale");


--
-- Name: _pages_v_version_meta_version_meta_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_version_meta_version_meta_image_idx" ON "public"."_pages_v_locales" USING "btree" ("version_meta_image_id");


--
-- Name: _pages_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_version_version__status_idx" ON "public"."_pages_v" USING "btree" ("version__status");


--
-- Name: _pages_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_version_version_created_at_idx" ON "public"."_pages_v" USING "btree" ("version_created_at");


--
-- Name: _pages_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_version_version_slug_idx" ON "public"."_pages_v" USING "btree" ("version_slug");


--
-- Name: _pages_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_pages_v_version_version_updated_at_idx" ON "public"."_pages_v" USING "btree" ("version_updated_at");


--
-- Name: _richTextBlock_v_block_header_links_locales_locale_parent_id_un; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_richTextBlock_v_block_header_links_locales_locale_parent_id_un" ON "public"."_richTextBlock_v_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _richTextBlock_v_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_richTextBlock_v_block_header_links_order_idx" ON "public"."_richTextBlock_v_block_header_links" USING "btree" ("_order");


--
-- Name: _richTextBlock_v_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_richTextBlock_v_block_header_links_parent_id_idx" ON "public"."_richTextBlock_v_block_header_links" USING "btree" ("_parent_id");


--
-- Name: _richTextBlock_v_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_richTextBlock_v_locales_locale_parent_id_unique" ON "public"."_richTextBlock_v_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _richTextBlock_v_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_richTextBlock_v_order_idx" ON "public"."_richTextBlock_v" USING "btree" ("_order");


--
-- Name: _richTextBlock_v_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_richTextBlock_v_parent_id_idx" ON "public"."_richTextBlock_v" USING "btree" ("_parent_id");


--
-- Name: _richTextBlock_v_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_richTextBlock_v_path_idx" ON "public"."_richTextBlock_v" USING "btree" ("_path");


--
-- Name: _testimonialsBlock_v_block_header_links_locales_locale_parent_i; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_testimonialsBlock_v_block_header_links_locales_locale_parent_i" ON "public"."_testimonialsBlock_v_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _testimonialsBlock_v_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_testimonialsBlock_v_block_header_links_order_idx" ON "public"."_testimonialsBlock_v_block_header_links" USING "btree" ("_order");


--
-- Name: _testimonialsBlock_v_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_testimonialsBlock_v_block_header_links_parent_id_idx" ON "public"."_testimonialsBlock_v_block_header_links" USING "btree" ("_parent_id");


--
-- Name: _testimonialsBlock_v_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "_testimonialsBlock_v_locales_locale_parent_id_unique" ON "public"."_testimonialsBlock_v_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: _testimonialsBlock_v_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_testimonialsBlock_v_order_idx" ON "public"."_testimonialsBlock_v" USING "btree" ("_order");


--
-- Name: _testimonialsBlock_v_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_testimonialsBlock_v_parent_id_idx" ON "public"."_testimonialsBlock_v" USING "btree" ("_parent_id");


--
-- Name: _testimonialsBlock_v_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "_testimonialsBlock_v_path_idx" ON "public"."_testimonialsBlock_v" USING "btree" ("_path");


--
-- Name: archiveBlock_block_header_links_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "archiveBlock_block_header_links_locales_locale_parent_id_unique" ON "public"."archiveBlock_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: archiveBlock_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "archiveBlock_block_header_links_order_idx" ON "public"."archiveBlock_block_header_links" USING "btree" ("_order");


--
-- Name: archiveBlock_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "archiveBlock_block_header_links_parent_id_idx" ON "public"."archiveBlock_block_header_links" USING "btree" ("_parent_id");


--
-- Name: archiveBlock_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "archiveBlock_locales_locale_parent_id_unique" ON "public"."archiveBlock_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: archiveBlock_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "archiveBlock_order_idx" ON "public"."archiveBlock" USING "btree" ("_order");


--
-- Name: archiveBlock_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "archiveBlock_parent_id_idx" ON "public"."archiveBlock" USING "btree" ("_parent_id");


--
-- Name: archiveBlock_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "archiveBlock_path_idx" ON "public"."archiveBlock" USING "btree" ("_path");


--
-- Name: blogBlock_featured_post_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blogBlock_featured_post_idx" ON "public"."blogBlock" USING "btree" ("featured_post_id");


--
-- Name: blogBlock_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "blogBlock_locales_locale_parent_id_unique" ON "public"."blogBlock_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: blogBlock_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blogBlock_order_idx" ON "public"."blogBlock" USING "btree" ("_order");


--
-- Name: blogBlock_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blogBlock_parent_id_idx" ON "public"."blogBlock" USING "btree" ("_parent_id");


--
-- Name: blogBlock_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blogBlock_path_idx" ON "public"."blogBlock" USING "btree" ("_path");


--
-- Name: blog_posts__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blog_posts__status_idx" ON "public"."blog_posts" USING "btree" ("_status");


--
-- Name: blog_posts_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blog_posts_created_at_idx" ON "public"."blog_posts" USING "btree" ("created_at");


--
-- Name: blog_posts_hero_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blog_posts_hero_image_idx" ON "public"."blog_posts_locales" USING "btree" ("hero_image_id", "_locale");


--
-- Name: blog_posts_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "blog_posts_locales_locale_parent_id_unique" ON "public"."blog_posts_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: blog_posts_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blog_posts_meta_meta_image_idx" ON "public"."blog_posts_locales" USING "btree" ("meta_image_id");


--
-- Name: blog_posts_populated_authors_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blog_posts_populated_authors_order_idx" ON "public"."blog_posts_populated_authors" USING "btree" ("_order");


--
-- Name: blog_posts_populated_authors_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blog_posts_populated_authors_parent_id_idx" ON "public"."blog_posts_populated_authors" USING "btree" ("_parent_id");


--
-- Name: blog_posts_rels_blog_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blog_posts_rels_blog_posts_id_idx" ON "public"."blog_posts_rels" USING "btree" ("blog_posts_id", "locale");


--
-- Name: blog_posts_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blog_posts_rels_categories_id_idx" ON "public"."blog_posts_rels" USING "btree" ("categories_id", "locale");


--
-- Name: blog_posts_rels_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blog_posts_rels_locale_idx" ON "public"."blog_posts_rels" USING "btree" ("locale");


--
-- Name: blog_posts_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blog_posts_rels_order_idx" ON "public"."blog_posts_rels" USING "btree" ("order");


--
-- Name: blog_posts_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blog_posts_rels_parent_idx" ON "public"."blog_posts_rels" USING "btree" ("parent_id");


--
-- Name: blog_posts_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blog_posts_rels_path_idx" ON "public"."blog_posts_rels" USING "btree" ("path");


--
-- Name: blog_posts_rels_users_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blog_posts_rels_users_id_idx" ON "public"."blog_posts_rels" USING "btree" ("users_id", "locale");


--
-- Name: blog_posts_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blog_posts_slug_idx" ON "public"."blog_posts" USING "btree" ("slug");


--
-- Name: blog_posts_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "blog_posts_updated_at_idx" ON "public"."blog_posts" USING "btree" ("updated_at");


--
-- Name: callToActionBlock_form_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "callToActionBlock_form_idx" ON "public"."callToActionBlock" USING "btree" ("form_id");


--
-- Name: callToActionBlock_links_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "callToActionBlock_links_locales_locale_parent_id_unique" ON "public"."callToActionBlock_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: callToActionBlock_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "callToActionBlock_links_order_idx" ON "public"."callToActionBlock_links" USING "btree" ("_order");


--
-- Name: callToActionBlock_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "callToActionBlock_links_parent_id_idx" ON "public"."callToActionBlock_links" USING "btree" ("_parent_id");


--
-- Name: callToActionBlock_list_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "callToActionBlock_list_locale_idx" ON "public"."callToActionBlock_list" USING "btree" ("_locale");


--
-- Name: callToActionBlock_list_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "callToActionBlock_list_order_idx" ON "public"."callToActionBlock_list" USING "btree" ("_order");


--
-- Name: callToActionBlock_list_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "callToActionBlock_list_parent_id_idx" ON "public"."callToActionBlock_list" USING "btree" ("_parent_id");


--
-- Name: callToActionBlock_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "callToActionBlock_locales_locale_parent_id_unique" ON "public"."callToActionBlock_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: callToActionBlock_media_desktop_media_desktop_dark_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "callToActionBlock_media_desktop_media_desktop_dark_idx" ON "public"."callToActionBlock_locales" USING "btree" ("media_desktop_dark_id", "_locale");


--
-- Name: callToActionBlock_media_desktop_media_desktop_light_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "callToActionBlock_media_desktop_media_desktop_light_idx" ON "public"."callToActionBlock_locales" USING "btree" ("media_desktop_light_id", "_locale");


--
-- Name: callToActionBlock_media_mobile_media_mobile_dark_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "callToActionBlock_media_mobile_media_mobile_dark_idx" ON "public"."callToActionBlock_locales" USING "btree" ("media_mobile_dark_id", "_locale");


--
-- Name: callToActionBlock_media_mobile_media_mobile_light_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "callToActionBlock_media_mobile_media_mobile_light_idx" ON "public"."callToActionBlock_locales" USING "btree" ("media_mobile_light_id", "_locale");


--
-- Name: callToActionBlock_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "callToActionBlock_order_idx" ON "public"."callToActionBlock" USING "btree" ("_order");


--
-- Name: callToActionBlock_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "callToActionBlock_parent_id_idx" ON "public"."callToActionBlock" USING "btree" ("_parent_id");


--
-- Name: callToActionBlock_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "callToActionBlock_path_idx" ON "public"."callToActionBlock" USING "btree" ("_path");


--
-- Name: categories_breadcrumbs_doc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "categories_breadcrumbs_doc_idx" ON "public"."categories_breadcrumbs" USING "btree" ("doc_id");


--
-- Name: categories_breadcrumbs_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "categories_breadcrumbs_locale_idx" ON "public"."categories_breadcrumbs" USING "btree" ("_locale");


--
-- Name: categories_breadcrumbs_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "categories_breadcrumbs_order_idx" ON "public"."categories_breadcrumbs" USING "btree" ("_order");


--
-- Name: categories_breadcrumbs_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "categories_breadcrumbs_parent_id_idx" ON "public"."categories_breadcrumbs" USING "btree" ("_parent_id");


--
-- Name: categories_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "categories_created_at_idx" ON "public"."categories" USING "btree" ("created_at");


--
-- Name: categories_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "categories_parent_idx" ON "public"."categories" USING "btree" ("parent_id");


--
-- Name: categories_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "categories_slug_idx" ON "public"."categories" USING "btree" ("slug");


--
-- Name: categories_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "categories_updated_at_idx" ON "public"."categories" USING "btree" ("updated_at");


--
-- Name: customHtmlBlock_block_header_links_locales_locale_parent_id_uni; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "customHtmlBlock_block_header_links_locales_locale_parent_id_uni" ON "public"."customHtmlBlock_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: customHtmlBlock_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customHtmlBlock_block_header_links_order_idx" ON "public"."customHtmlBlock_block_header_links" USING "btree" ("_order");


--
-- Name: customHtmlBlock_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customHtmlBlock_block_header_links_parent_id_idx" ON "public"."customHtmlBlock_block_header_links" USING "btree" ("_parent_id");


--
-- Name: customHtmlBlock_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "customHtmlBlock_locales_locale_parent_id_unique" ON "public"."customHtmlBlock_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: customHtmlBlock_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customHtmlBlock_order_idx" ON "public"."customHtmlBlock" USING "btree" ("_order");


--
-- Name: customHtmlBlock_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customHtmlBlock_parent_id_idx" ON "public"."customHtmlBlock" USING "btree" ("_parent_id");


--
-- Name: customHtmlBlock_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customHtmlBlock_path_idx" ON "public"."customHtmlBlock" USING "btree" ("_path");


--
-- Name: customers__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customers__status_idx" ON "public"."customers" USING "btree" ("_status");


--
-- Name: customers_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customers_created_at_idx" ON "public"."customers" USING "btree" ("created_at");


--
-- Name: customers_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "customers_locales_locale_parent_id_unique" ON "public"."customers_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: customers_rels_blog_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customers_rels_blog_posts_id_idx" ON "public"."customers_rels" USING "btree" ("blog_posts_id");


--
-- Name: customers_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customers_rels_categories_id_idx" ON "public"."customers_rels" USING "btree" ("categories_id");


--
-- Name: customers_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customers_rels_order_idx" ON "public"."customers_rels" USING "btree" ("order");


--
-- Name: customers_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customers_rels_pages_id_idx" ON "public"."customers_rels" USING "btree" ("pages_id");


--
-- Name: customers_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customers_rels_parent_idx" ON "public"."customers_rels" USING "btree" ("parent_id");


--
-- Name: customers_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customers_rels_path_idx" ON "public"."customers_rels" USING "btree" ("path");


--
-- Name: customers_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customers_slug_idx" ON "public"."customers" USING "btree" ("slug");


--
-- Name: customers_testimonial_author_info_testimonial_author_info_avata; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customers_testimonial_author_info_testimonial_author_info_avata" ON "public"."customers" USING "btree" ("testimonial_author_info_avatar_id");


--
-- Name: customers_testimonial_company_testimonial_company_company_logo_; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customers_testimonial_company_testimonial_company_company_logo_" ON "public"."customers" USING "btree" ("testimonial_company_company_logo_id");


--
-- Name: customers_testimonial_stats_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "customers_testimonial_stats_locales_locale_parent_id_unique" ON "public"."customers_testimonial_stats_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: customers_testimonial_stats_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customers_testimonial_stats_order_idx" ON "public"."customers_testimonial_stats" USING "btree" ("_order");


--
-- Name: customers_testimonial_stats_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customers_testimonial_stats_parent_id_idx" ON "public"."customers_testimonial_stats" USING "btree" ("_parent_id");


--
-- Name: customers_testimonial_testimonial_featured_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customers_testimonial_testimonial_featured_image_idx" ON "public"."customers" USING "btree" ("testimonial_featured_image_id");


--
-- Name: customers_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "customers_updated_at_idx" ON "public"."customers" USING "btree" ("updated_at");


--
-- Name: dividerBlock_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "dividerBlock_order_idx" ON "public"."dividerBlock" USING "btree" ("_order");


--
-- Name: dividerBlock_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "dividerBlock_parent_id_idx" ON "public"."dividerBlock" USING "btree" ("_parent_id");


--
-- Name: dividerBlock_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "dividerBlock_path_idx" ON "public"."dividerBlock" USING "btree" ("_path");


--
-- Name: faqBlock_block_header_links_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "faqBlock_block_header_links_locales_locale_parent_id_unique" ON "public"."faqBlock_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: faqBlock_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "faqBlock_block_header_links_order_idx" ON "public"."faqBlock_block_header_links" USING "btree" ("_order");


--
-- Name: faqBlock_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "faqBlock_block_header_links_parent_id_idx" ON "public"."faqBlock_block_header_links" USING "btree" ("_parent_id");


--
-- Name: faqBlock_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "faqBlock_locales_locale_parent_id_unique" ON "public"."faqBlock_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: faqBlock_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "faqBlock_order_idx" ON "public"."faqBlock" USING "btree" ("_order");


--
-- Name: faqBlock_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "faqBlock_parent_id_idx" ON "public"."faqBlock" USING "btree" ("_parent_id");


--
-- Name: faqBlock_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "faqBlock_path_idx" ON "public"."faqBlock" USING "btree" ("_path");


--
-- Name: faq__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "faq__status_idx" ON "public"."faq" USING "btree" ("_status");


--
-- Name: faq_category_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "faq_category_idx" ON "public"."faq" USING "btree" ("category_id");


--
-- Name: faq_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "faq_created_at_idx" ON "public"."faq" USING "btree" ("created_at");


--
-- Name: faq_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "faq_locales_locale_parent_id_unique" ON "public"."faq_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: faq_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "faq_updated_at_idx" ON "public"."faq" USING "btree" ("updated_at");


--
-- Name: featuresBlock_block_header_links_locales_locale_parent_id_uniqu; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "featuresBlock_block_header_links_locales_locale_parent_id_uniqu" ON "public"."featuresBlock_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: featuresBlock_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "featuresBlock_block_header_links_order_idx" ON "public"."featuresBlock_block_header_links" USING "btree" ("_order");


--
-- Name: featuresBlock_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "featuresBlock_block_header_links_parent_id_idx" ON "public"."featuresBlock_block_header_links" USING "btree" ("_parent_id");


--
-- Name: featuresBlock_block_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "featuresBlock_block_image_idx" ON "public"."featuresBlock" USING "btree" ("block_image_id");


--
-- Name: featuresBlock_columns_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "featuresBlock_columns_image_idx" ON "public"."featuresBlock_columns_locales" USING "btree" ("image_id", "_locale");


--
-- Name: featuresBlock_columns_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "featuresBlock_columns_locales_locale_parent_id_unique" ON "public"."featuresBlock_columns_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: featuresBlock_columns_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "featuresBlock_columns_order_idx" ON "public"."featuresBlock_columns" USING "btree" ("_order");


--
-- Name: featuresBlock_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "featuresBlock_columns_parent_id_idx" ON "public"."featuresBlock_columns" USING "btree" ("_parent_id");


--
-- Name: featuresBlock_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "featuresBlock_locales_locale_parent_id_unique" ON "public"."featuresBlock_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: featuresBlock_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "featuresBlock_order_idx" ON "public"."featuresBlock" USING "btree" ("_order");


--
-- Name: featuresBlock_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "featuresBlock_parent_id_idx" ON "public"."featuresBlock" USING "btree" ("_parent_id");


--
-- Name: featuresBlock_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "featuresBlock_path_idx" ON "public"."featuresBlock" USING "btree" ("_path");


--
-- Name: footer_columns_nav_items_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "footer_columns_nav_items_locales_locale_parent_id_unique" ON "public"."footer_columns_nav_items_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: footer_columns_nav_items_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "footer_columns_nav_items_order_idx" ON "public"."footer_columns_nav_items" USING "btree" ("_order");


--
-- Name: footer_columns_nav_items_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "footer_columns_nav_items_parent_id_idx" ON "public"."footer_columns_nav_items" USING "btree" ("_parent_id");


--
-- Name: footer_columns_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "footer_columns_order_idx" ON "public"."footer_columns" USING "btree" ("_order");


--
-- Name: footer_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "footer_columns_parent_id_idx" ON "public"."footer_columns" USING "btree" ("_parent_id");


--
-- Name: footer_rels_blog_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "footer_rels_blog_posts_id_idx" ON "public"."footer_rels" USING "btree" ("blog_posts_id");


--
-- Name: footer_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "footer_rels_order_idx" ON "public"."footer_rels" USING "btree" ("order");


--
-- Name: footer_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "footer_rels_pages_id_idx" ON "public"."footer_rels" USING "btree" ("pages_id");


--
-- Name: footer_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "footer_rels_parent_idx" ON "public"."footer_rels" USING "btree" ("parent_id");


--
-- Name: footer_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "footer_rels_path_idx" ON "public"."footer_rels" USING "btree" ("path");


--
-- Name: formBlock_form_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "formBlock_form_idx" ON "public"."formBlock" USING "btree" ("form_id");


--
-- Name: formBlock_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "formBlock_order_idx" ON "public"."formBlock" USING "btree" ("_order");


--
-- Name: formBlock_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "formBlock_parent_id_idx" ON "public"."formBlock" USING "btree" ("_parent_id");


--
-- Name: formBlock_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "formBlock_path_idx" ON "public"."formBlock" USING "btree" ("_path");


--
-- Name: form_submissions_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "form_submissions_created_at_idx" ON "public"."form_submissions" USING "btree" ("created_at");


--
-- Name: form_submissions_form_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "form_submissions_form_idx" ON "public"."form_submissions" USING "btree" ("form_id");


--
-- Name: form_submissions_submission_data_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "form_submissions_submission_data_order_idx" ON "public"."form_submissions_submission_data" USING "btree" ("_order");


--
-- Name: form_submissions_submission_data_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "form_submissions_submission_data_parent_id_idx" ON "public"."form_submissions_submission_data" USING "btree" ("_parent_id");


--
-- Name: form_submissions_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "form_submissions_updated_at_idx" ON "public"."form_submissions" USING "btree" ("updated_at");


--
-- Name: forms_blocks_checkbox_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "forms_blocks_checkbox_locales_locale_parent_id_unique" ON "public"."forms_blocks_checkbox_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: forms_blocks_checkbox_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_checkbox_order_idx" ON "public"."forms_blocks_checkbox" USING "btree" ("_order");


--
-- Name: forms_blocks_checkbox_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_checkbox_parent_id_idx" ON "public"."forms_blocks_checkbox" USING "btree" ("_parent_id");


--
-- Name: forms_blocks_checkbox_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_checkbox_path_idx" ON "public"."forms_blocks_checkbox" USING "btree" ("_path");


--
-- Name: forms_blocks_country_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "forms_blocks_country_locales_locale_parent_id_unique" ON "public"."forms_blocks_country_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: forms_blocks_country_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_country_order_idx" ON "public"."forms_blocks_country" USING "btree" ("_order");


--
-- Name: forms_blocks_country_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_country_parent_id_idx" ON "public"."forms_blocks_country" USING "btree" ("_parent_id");


--
-- Name: forms_blocks_country_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_country_path_idx" ON "public"."forms_blocks_country" USING "btree" ("_path");


--
-- Name: forms_blocks_email_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "forms_blocks_email_locales_locale_parent_id_unique" ON "public"."forms_blocks_email_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: forms_blocks_email_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_email_order_idx" ON "public"."forms_blocks_email" USING "btree" ("_order");


--
-- Name: forms_blocks_email_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_email_parent_id_idx" ON "public"."forms_blocks_email" USING "btree" ("_parent_id");


--
-- Name: forms_blocks_email_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_email_path_idx" ON "public"."forms_blocks_email" USING "btree" ("_path");


--
-- Name: forms_blocks_message_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "forms_blocks_message_locales_locale_parent_id_unique" ON "public"."forms_blocks_message_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: forms_blocks_message_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_message_order_idx" ON "public"."forms_blocks_message" USING "btree" ("_order");


--
-- Name: forms_blocks_message_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_message_parent_id_idx" ON "public"."forms_blocks_message" USING "btree" ("_parent_id");


--
-- Name: forms_blocks_message_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_message_path_idx" ON "public"."forms_blocks_message" USING "btree" ("_path");


--
-- Name: forms_blocks_number_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "forms_blocks_number_locales_locale_parent_id_unique" ON "public"."forms_blocks_number_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: forms_blocks_number_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_number_order_idx" ON "public"."forms_blocks_number" USING "btree" ("_order");


--
-- Name: forms_blocks_number_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_number_parent_id_idx" ON "public"."forms_blocks_number" USING "btree" ("_parent_id");


--
-- Name: forms_blocks_number_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_number_path_idx" ON "public"."forms_blocks_number" USING "btree" ("_path");


--
-- Name: forms_blocks_select_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "forms_blocks_select_locales_locale_parent_id_unique" ON "public"."forms_blocks_select_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: forms_blocks_select_options_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "forms_blocks_select_options_locales_locale_parent_id_unique" ON "public"."forms_blocks_select_options_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: forms_blocks_select_options_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_select_options_order_idx" ON "public"."forms_blocks_select_options" USING "btree" ("_order");


--
-- Name: forms_blocks_select_options_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_select_options_parent_id_idx" ON "public"."forms_blocks_select_options" USING "btree" ("_parent_id");


--
-- Name: forms_blocks_select_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_select_order_idx" ON "public"."forms_blocks_select" USING "btree" ("_order");


--
-- Name: forms_blocks_select_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_select_parent_id_idx" ON "public"."forms_blocks_select" USING "btree" ("_parent_id");


--
-- Name: forms_blocks_select_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_select_path_idx" ON "public"."forms_blocks_select" USING "btree" ("_path");


--
-- Name: forms_blocks_state_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "forms_blocks_state_locales_locale_parent_id_unique" ON "public"."forms_blocks_state_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: forms_blocks_state_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_state_order_idx" ON "public"."forms_blocks_state" USING "btree" ("_order");


--
-- Name: forms_blocks_state_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_state_parent_id_idx" ON "public"."forms_blocks_state" USING "btree" ("_parent_id");


--
-- Name: forms_blocks_state_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_state_path_idx" ON "public"."forms_blocks_state" USING "btree" ("_path");


--
-- Name: forms_blocks_text_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "forms_blocks_text_locales_locale_parent_id_unique" ON "public"."forms_blocks_text_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: forms_blocks_text_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_text_order_idx" ON "public"."forms_blocks_text" USING "btree" ("_order");


--
-- Name: forms_blocks_text_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_text_parent_id_idx" ON "public"."forms_blocks_text" USING "btree" ("_parent_id");


--
-- Name: forms_blocks_text_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_text_path_idx" ON "public"."forms_blocks_text" USING "btree" ("_path");


--
-- Name: forms_blocks_textarea_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "forms_blocks_textarea_locales_locale_parent_id_unique" ON "public"."forms_blocks_textarea_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: forms_blocks_textarea_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_textarea_order_idx" ON "public"."forms_blocks_textarea" USING "btree" ("_order");


--
-- Name: forms_blocks_textarea_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_textarea_parent_id_idx" ON "public"."forms_blocks_textarea" USING "btree" ("_parent_id");


--
-- Name: forms_blocks_textarea_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_blocks_textarea_path_idx" ON "public"."forms_blocks_textarea" USING "btree" ("_path");


--
-- Name: forms_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_created_at_idx" ON "public"."forms" USING "btree" ("created_at");


--
-- Name: forms_emails_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "forms_emails_locales_locale_parent_id_unique" ON "public"."forms_emails_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: forms_emails_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_emails_order_idx" ON "public"."forms_emails" USING "btree" ("_order");


--
-- Name: forms_emails_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_emails_parent_id_idx" ON "public"."forms_emails" USING "btree" ("_parent_id");


--
-- Name: forms_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "forms_locales_locale_parent_id_unique" ON "public"."forms_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: forms_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "forms_updated_at_idx" ON "public"."forms" USING "btree" ("updated_at");


--
-- Name: galleryBlock_block_header_links_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "galleryBlock_block_header_links_locales_locale_parent_id_unique" ON "public"."galleryBlock_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: galleryBlock_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "galleryBlock_block_header_links_order_idx" ON "public"."galleryBlock_block_header_links" USING "btree" ("_order");


--
-- Name: galleryBlock_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "galleryBlock_block_header_links_parent_id_idx" ON "public"."galleryBlock_block_header_links" USING "btree" ("_parent_id");


--
-- Name: galleryBlock_interactive_gallery_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "galleryBlock_interactive_gallery_image_idx" ON "public"."galleryBlock_interactive_gallery_locales" USING "btree" ("image_id", "_locale");


--
-- Name: galleryBlock_interactive_gallery_locales_locale_parent_id_uniqu; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "galleryBlock_interactive_gallery_locales_locale_parent_id_uniqu" ON "public"."galleryBlock_interactive_gallery_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: galleryBlock_interactive_gallery_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "galleryBlock_interactive_gallery_order_idx" ON "public"."galleryBlock_interactive_gallery" USING "btree" ("_order");


--
-- Name: galleryBlock_interactive_gallery_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "galleryBlock_interactive_gallery_parent_id_idx" ON "public"."galleryBlock_interactive_gallery" USING "btree" ("_parent_id");


--
-- Name: galleryBlock_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "galleryBlock_locales_locale_parent_id_unique" ON "public"."galleryBlock_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: galleryBlock_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "galleryBlock_order_idx" ON "public"."galleryBlock" USING "btree" ("_order");


--
-- Name: galleryBlock_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "galleryBlock_parent_id_idx" ON "public"."galleryBlock" USING "btree" ("_parent_id");


--
-- Name: galleryBlock_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "galleryBlock_path_idx" ON "public"."galleryBlock" USING "btree" ("_path");


--
-- Name: header_cta_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "header_cta_locales_locale_parent_id_unique" ON "public"."header_cta_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: header_cta_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_cta_order_idx" ON "public"."header_cta" USING "btree" ("_order");


--
-- Name: header_cta_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_cta_parent_id_idx" ON "public"."header_cta" USING "btree" ("_parent_id");


--
-- Name: header_rels_blog_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_rels_blog_posts_id_idx" ON "public"."header_rels" USING "btree" ("blog_posts_id");


--
-- Name: header_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_rels_order_idx" ON "public"."header_rels" USING "btree" ("order");


--
-- Name: header_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_rels_pages_id_idx" ON "public"."header_rels" USING "btree" ("pages_id");


--
-- Name: header_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_rels_parent_idx" ON "public"."header_rels" USING "btree" ("parent_id");


--
-- Name: header_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_rels_path_idx" ON "public"."header_rels" USING "btree" ("path");


--
-- Name: header_tabs_description_links_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "header_tabs_description_links_locales_locale_parent_id_unique" ON "public"."header_tabs_description_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: header_tabs_description_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_tabs_description_links_order_idx" ON "public"."header_tabs_description_links" USING "btree" ("_order");


--
-- Name: header_tabs_description_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_tabs_description_links_parent_id_idx" ON "public"."header_tabs_description_links" USING "btree" ("_parent_id");


--
-- Name: header_tabs_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "header_tabs_locales_locale_parent_id_unique" ON "public"."header_tabs_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: header_tabs_nav_items_featured_link_links_locales_locale_parent; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "header_tabs_nav_items_featured_link_links_locales_locale_parent" ON "public"."header_tabs_nav_items_featured_link_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: header_tabs_nav_items_featured_link_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_tabs_nav_items_featured_link_links_order_idx" ON "public"."header_tabs_nav_items_featured_link_links" USING "btree" ("_order");


--
-- Name: header_tabs_nav_items_featured_link_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_tabs_nav_items_featured_link_links_parent_id_idx" ON "public"."header_tabs_nav_items_featured_link_links" USING "btree" ("_parent_id");


--
-- Name: header_tabs_nav_items_list_links_links_locales_locale_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "header_tabs_nav_items_list_links_links_locales_locale_parent_id" ON "public"."header_tabs_nav_items_list_links_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: header_tabs_nav_items_list_links_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_tabs_nav_items_list_links_links_order_idx" ON "public"."header_tabs_nav_items_list_links_links" USING "btree" ("_order");


--
-- Name: header_tabs_nav_items_list_links_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_tabs_nav_items_list_links_links_parent_id_idx" ON "public"."header_tabs_nav_items_list_links_links" USING "btree" ("_parent_id");


--
-- Name: header_tabs_nav_items_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "header_tabs_nav_items_locales_locale_parent_id_unique" ON "public"."header_tabs_nav_items_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: header_tabs_nav_items_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_tabs_nav_items_order_idx" ON "public"."header_tabs_nav_items" USING "btree" ("_order");


--
-- Name: header_tabs_nav_items_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_tabs_nav_items_parent_id_idx" ON "public"."header_tabs_nav_items" USING "btree" ("_parent_id");


--
-- Name: header_tabs_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_tabs_order_idx" ON "public"."header_tabs" USING "btree" ("_order");


--
-- Name: header_tabs_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "header_tabs_parent_id_idx" ON "public"."header_tabs" USING "btree" ("_parent_id");


--
-- Name: logosBlock_block_header_links_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "logosBlock_block_header_links_locales_locale_parent_id_unique" ON "public"."logosBlock_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: logosBlock_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "logosBlock_block_header_links_order_idx" ON "public"."logosBlock_block_header_links" USING "btree" ("_order");


--
-- Name: logosBlock_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "logosBlock_block_header_links_parent_id_idx" ON "public"."logosBlock_block_header_links" USING "btree" ("_parent_id");


--
-- Name: logosBlock_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "logosBlock_locales_locale_parent_id_unique" ON "public"."logosBlock_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: logosBlock_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "logosBlock_order_idx" ON "public"."logosBlock" USING "btree" ("_order");


--
-- Name: logosBlock_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "logosBlock_parent_id_idx" ON "public"."logosBlock" USING "btree" ("_parent_id");


--
-- Name: logosBlock_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "logosBlock_path_idx" ON "public"."logosBlock" USING "btree" ("_path");


--
-- Name: media_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "media_created_at_idx" ON "public"."media" USING "btree" ("created_at");


--
-- Name: media_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "media_filename_idx" ON "public"."media" USING "btree" ("filename");


--
-- Name: media_folder_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "media_folder_idx" ON "public"."media" USING "btree" ("folder_id");


--
-- Name: media_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "media_rels_categories_id_idx" ON "public"."media_rels" USING "btree" ("categories_id");


--
-- Name: media_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "media_rels_order_idx" ON "public"."media_rels" USING "btree" ("order");


--
-- Name: media_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "media_rels_parent_idx" ON "public"."media_rels" USING "btree" ("parent_id");


--
-- Name: media_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "media_rels_path_idx" ON "public"."media_rels" USING "btree" ("path");


--
-- Name: media_sizes_large_sizes_large_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "media_sizes_large_sizes_large_filename_idx" ON "public"."media" USING "btree" ("sizes_large_filename");


--
-- Name: media_sizes_medium_sizes_medium_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "media_sizes_medium_sizes_medium_filename_idx" ON "public"."media" USING "btree" ("sizes_medium_filename");


--
-- Name: media_sizes_og_sizes_og_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "media_sizes_og_sizes_og_filename_idx" ON "public"."media" USING "btree" ("sizes_og_filename");


--
-- Name: media_sizes_small_sizes_small_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "media_sizes_small_sizes_small_filename_idx" ON "public"."media" USING "btree" ("sizes_small_filename");


--
-- Name: media_sizes_square_sizes_square_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "media_sizes_square_sizes_square_filename_idx" ON "public"."media" USING "btree" ("sizes_square_filename");


--
-- Name: media_sizes_thumbnail_sizes_thumbnail_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "media_sizes_thumbnail_sizes_thumbnail_filename_idx" ON "public"."media" USING "btree" ("sizes_thumbnail_filename");


--
-- Name: media_sizes_xlarge_sizes_xlarge_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "media_sizes_xlarge_sizes_xlarge_filename_idx" ON "public"."media" USING "btree" ("sizes_xlarge_filename");


--
-- Name: media_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "media_updated_at_idx" ON "public"."media" USING "btree" ("updated_at");


--
-- Name: metricsBlock_block_header_links_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "metricsBlock_block_header_links_locales_locale_parent_id_unique" ON "public"."metricsBlock_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: metricsBlock_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_block_header_links_order_idx" ON "public"."metricsBlock_block_header_links" USING "btree" ("_order");


--
-- Name: metricsBlock_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_block_header_links_parent_id_idx" ON "public"."metricsBlock_block_header_links" USING "btree" ("_parent_id");


--
-- Name: metricsBlock_block_image_block_image_media_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_block_image_block_image_media_idx" ON "public"."metricsBlock_locales" USING "btree" ("block_image_media_id");


--
-- Name: metricsBlock_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "metricsBlock_locales_locale_parent_id_unique" ON "public"."metricsBlock_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: metricsBlock_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_order_idx" ON "public"."metricsBlock" USING "btree" ("_order");


--
-- Name: metricsBlock_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_parent_id_idx" ON "public"."metricsBlock" USING "btree" ("_parent_id");


--
-- Name: metricsBlock_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_path_idx" ON "public"."metricsBlock" USING "btree" ("_path");


--
-- Name: metricsBlock_stats_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "metricsBlock_stats_locales_locale_parent_id_unique" ON "public"."metricsBlock_stats_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: metricsBlock_stats_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_stats_order_idx" ON "public"."metricsBlock_stats" USING "btree" ("_order");


--
-- Name: metricsBlock_stats_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_stats_parent_id_idx" ON "public"."metricsBlock_stats" USING "btree" ("_parent_id");


--
-- Name: metricsBlock_table_headers_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_table_headers_locale_idx" ON "public"."metricsBlock_table_headers" USING "btree" ("_locale");


--
-- Name: metricsBlock_table_headers_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_table_headers_order_idx" ON "public"."metricsBlock_table_headers" USING "btree" ("_order");


--
-- Name: metricsBlock_table_headers_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_table_headers_parent_id_idx" ON "public"."metricsBlock_table_headers" USING "btree" ("_parent_id");


--
-- Name: metricsBlock_table_rows_cells_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_table_rows_cells_locale_idx" ON "public"."metricsBlock_table_rows_cells" USING "btree" ("_locale");


--
-- Name: metricsBlock_table_rows_cells_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_table_rows_cells_order_idx" ON "public"."metricsBlock_table_rows_cells" USING "btree" ("_order");


--
-- Name: metricsBlock_table_rows_cells_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_table_rows_cells_parent_id_idx" ON "public"."metricsBlock_table_rows_cells" USING "btree" ("_parent_id");


--
-- Name: metricsBlock_table_rows_children_cells_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_table_rows_children_cells_locale_idx" ON "public"."metricsBlock_table_rows_children_cells" USING "btree" ("_locale");


--
-- Name: metricsBlock_table_rows_children_cells_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_table_rows_children_cells_order_idx" ON "public"."metricsBlock_table_rows_children_cells" USING "btree" ("_order");


--
-- Name: metricsBlock_table_rows_children_cells_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_table_rows_children_cells_parent_id_idx" ON "public"."metricsBlock_table_rows_children_cells" USING "btree" ("_parent_id");


--
-- Name: metricsBlock_table_rows_children_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_table_rows_children_locale_idx" ON "public"."metricsBlock_table_rows_children" USING "btree" ("_locale");


--
-- Name: metricsBlock_table_rows_children_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_table_rows_children_order_idx" ON "public"."metricsBlock_table_rows_children" USING "btree" ("_order");


--
-- Name: metricsBlock_table_rows_children_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_table_rows_children_parent_id_idx" ON "public"."metricsBlock_table_rows_children" USING "btree" ("_parent_id");


--
-- Name: metricsBlock_table_rows_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_table_rows_locale_idx" ON "public"."metricsBlock_table_rows" USING "btree" ("_locale");


--
-- Name: metricsBlock_table_rows_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_table_rows_order_idx" ON "public"."metricsBlock_table_rows" USING "btree" ("_order");


--
-- Name: metricsBlock_table_rows_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "metricsBlock_table_rows_parent_id_idx" ON "public"."metricsBlock_table_rows" USING "btree" ("_parent_id");


--
-- Name: pages__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages__status_idx" ON "public"."pages" USING "btree" ("_status");


--
-- Name: pages_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_created_at_idx" ON "public"."pages" USING "btree" ("created_at");


--
-- Name: pages_hero_links_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "pages_hero_links_locales_locale_parent_id_unique" ON "public"."pages_hero_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: pages_hero_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_hero_links_order_idx" ON "public"."pages_hero_links" USING "btree" ("_order");


--
-- Name: pages_hero_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_hero_links_parent_id_idx" ON "public"."pages_hero_links" USING "btree" ("_parent_id");


--
-- Name: pages_hero_media_desktop_hero_media_desktop_dark_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_hero_media_desktop_hero_media_desktop_dark_idx" ON "public"."pages_locales" USING "btree" ("hero_media_desktop_dark_id", "_locale");


--
-- Name: pages_hero_media_desktop_hero_media_desktop_light_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_hero_media_desktop_hero_media_desktop_light_idx" ON "public"."pages_locales" USING "btree" ("hero_media_desktop_light_id", "_locale");


--
-- Name: pages_hero_media_mobile_hero_media_mobile_dark_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_hero_media_mobile_hero_media_mobile_dark_idx" ON "public"."pages_locales" USING "btree" ("hero_media_mobile_dark_id", "_locale");


--
-- Name: pages_hero_media_mobile_hero_media_mobile_light_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_hero_media_mobile_hero_media_mobile_light_idx" ON "public"."pages_locales" USING "btree" ("hero_media_mobile_light_id", "_locale");


--
-- Name: pages_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "pages_locales_locale_parent_id_unique" ON "public"."pages_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: pages_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_meta_meta_image_idx" ON "public"."pages_locales" USING "btree" ("meta_image_id");


--
-- Name: pages_rels_blog_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_rels_blog_posts_id_idx" ON "public"."pages_rels" USING "btree" ("blog_posts_id", "locale");


--
-- Name: pages_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_rels_categories_id_idx" ON "public"."pages_rels" USING "btree" ("categories_id", "locale");


--
-- Name: pages_rels_customers_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_rels_customers_id_idx" ON "public"."pages_rels" USING "btree" ("customers_id", "locale");


--
-- Name: pages_rels_faq_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_rels_faq_id_idx" ON "public"."pages_rels" USING "btree" ("faq_id", "locale");


--
-- Name: pages_rels_locale_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_rels_locale_idx" ON "public"."pages_rels" USING "btree" ("locale");


--
-- Name: pages_rels_media_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_rels_media_id_idx" ON "public"."pages_rels" USING "btree" ("media_id", "locale");


--
-- Name: pages_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_rels_order_idx" ON "public"."pages_rels" USING "btree" ("order");


--
-- Name: pages_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_rels_pages_id_idx" ON "public"."pages_rels" USING "btree" ("pages_id", "locale");


--
-- Name: pages_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_rels_parent_idx" ON "public"."pages_rels" USING "btree" ("parent_id");


--
-- Name: pages_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_rels_path_idx" ON "public"."pages_rels" USING "btree" ("path");


--
-- Name: pages_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_slug_idx" ON "public"."pages" USING "btree" ("slug");


--
-- Name: pages_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "pages_updated_at_idx" ON "public"."pages" USING "btree" ("updated_at");


--
-- Name: payload_folders_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_folders_created_at_idx" ON "public"."payload_folders" USING "btree" ("created_at");


--
-- Name: payload_folders_folder_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_folders_folder_idx" ON "public"."payload_folders" USING "btree" ("folder_id");


--
-- Name: payload_folders_name_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_folders_name_idx" ON "public"."payload_folders" USING "btree" ("name");


--
-- Name: payload_folders_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_folders_updated_at_idx" ON "public"."payload_folders" USING "btree" ("updated_at");


--
-- Name: payload_jobs_completed_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_jobs_completed_at_idx" ON "public"."payload_jobs" USING "btree" ("completed_at");


--
-- Name: payload_jobs_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_jobs_created_at_idx" ON "public"."payload_jobs" USING "btree" ("created_at");


--
-- Name: payload_jobs_has_error_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_jobs_has_error_idx" ON "public"."payload_jobs" USING "btree" ("has_error");


--
-- Name: payload_jobs_log_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_jobs_log_order_idx" ON "public"."payload_jobs_log" USING "btree" ("_order");


--
-- Name: payload_jobs_log_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_jobs_log_parent_id_idx" ON "public"."payload_jobs_log" USING "btree" ("_parent_id");


--
-- Name: payload_jobs_processing_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_jobs_processing_idx" ON "public"."payload_jobs" USING "btree" ("processing");


--
-- Name: payload_jobs_queue_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_jobs_queue_idx" ON "public"."payload_jobs" USING "btree" ("queue");


--
-- Name: payload_jobs_task_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_jobs_task_slug_idx" ON "public"."payload_jobs" USING "btree" ("task_slug");


--
-- Name: payload_jobs_total_tried_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_jobs_total_tried_idx" ON "public"."payload_jobs" USING "btree" ("total_tried");


--
-- Name: payload_jobs_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_jobs_updated_at_idx" ON "public"."payload_jobs" USING "btree" ("updated_at");


--
-- Name: payload_jobs_wait_until_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_jobs_wait_until_idx" ON "public"."payload_jobs" USING "btree" ("wait_until");


--
-- Name: payload_locked_documents_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_created_at_idx" ON "public"."payload_locked_documents" USING "btree" ("created_at");


--
-- Name: payload_locked_documents_global_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_global_slug_idx" ON "public"."payload_locked_documents" USING "btree" ("global_slug");


--
-- Name: payload_locked_documents_rels_blog_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_rels_blog_posts_id_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("blog_posts_id");


--
-- Name: payload_locked_documents_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_rels_categories_id_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("categories_id");


--
-- Name: payload_locked_documents_rels_customers_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_rels_customers_id_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("customers_id");


--
-- Name: payload_locked_documents_rels_faq_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_rels_faq_id_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("faq_id");


--
-- Name: payload_locked_documents_rels_form_submissions_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_rels_form_submissions_id_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("form_submissions_id");


--
-- Name: payload_locked_documents_rels_forms_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_rels_forms_id_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("forms_id");


--
-- Name: payload_locked_documents_rels_media_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_rels_media_id_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("media_id");


--
-- Name: payload_locked_documents_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_rels_order_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("order");


--
-- Name: payload_locked_documents_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_rels_pages_id_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("pages_id");


--
-- Name: payload_locked_documents_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_rels_parent_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("parent_id");


--
-- Name: payload_locked_documents_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_rels_path_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("path");


--
-- Name: payload_locked_documents_rels_payload_folders_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_rels_payload_folders_id_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("payload_folders_id");


--
-- Name: payload_locked_documents_rels_payload_jobs_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_rels_payload_jobs_id_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("payload_jobs_id");


--
-- Name: payload_locked_documents_rels_redirects_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_rels_redirects_id_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("redirects_id");


--
-- Name: payload_locked_documents_rels_search_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_rels_search_id_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("search_id");


--
-- Name: payload_locked_documents_rels_users_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_rels_users_id_idx" ON "public"."payload_locked_documents_rels" USING "btree" ("users_id");


--
-- Name: payload_locked_documents_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_locked_documents_updated_at_idx" ON "public"."payload_locked_documents" USING "btree" ("updated_at");


--
-- Name: payload_migrations_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_migrations_created_at_idx" ON "public"."payload_migrations" USING "btree" ("created_at");


--
-- Name: payload_migrations_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_migrations_updated_at_idx" ON "public"."payload_migrations" USING "btree" ("updated_at");


--
-- Name: payload_preferences_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_preferences_created_at_idx" ON "public"."payload_preferences" USING "btree" ("created_at");


--
-- Name: payload_preferences_key_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_preferences_key_idx" ON "public"."payload_preferences" USING "btree" ("key");


--
-- Name: payload_preferences_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_preferences_rels_order_idx" ON "public"."payload_preferences_rels" USING "btree" ("order");


--
-- Name: payload_preferences_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_preferences_rels_parent_idx" ON "public"."payload_preferences_rels" USING "btree" ("parent_id");


--
-- Name: payload_preferences_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_preferences_rels_path_idx" ON "public"."payload_preferences_rels" USING "btree" ("path");


--
-- Name: payload_preferences_rels_users_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_preferences_rels_users_id_idx" ON "public"."payload_preferences_rels" USING "btree" ("users_id");


--
-- Name: payload_preferences_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "payload_preferences_updated_at_idx" ON "public"."payload_preferences" USING "btree" ("updated_at");


--
-- Name: redirects_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "redirects_created_at_idx" ON "public"."redirects" USING "btree" ("created_at");


--
-- Name: redirects_from_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "redirects_from_idx" ON "public"."redirects" USING "btree" ("from");


--
-- Name: redirects_rels_blog_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "redirects_rels_blog_posts_id_idx" ON "public"."redirects_rels" USING "btree" ("blog_posts_id");


--
-- Name: redirects_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "redirects_rels_order_idx" ON "public"."redirects_rels" USING "btree" ("order");


--
-- Name: redirects_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "redirects_rels_pages_id_idx" ON "public"."redirects_rels" USING "btree" ("pages_id");


--
-- Name: redirects_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "redirects_rels_parent_idx" ON "public"."redirects_rels" USING "btree" ("parent_id");


--
-- Name: redirects_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "redirects_rels_path_idx" ON "public"."redirects_rels" USING "btree" ("path");


--
-- Name: redirects_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "redirects_updated_at_idx" ON "public"."redirects" USING "btree" ("updated_at");


--
-- Name: richTextBlock_block_header_links_locales_locale_parent_id_uniqu; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "richTextBlock_block_header_links_locales_locale_parent_id_uniqu" ON "public"."richTextBlock_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: richTextBlock_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "richTextBlock_block_header_links_order_idx" ON "public"."richTextBlock_block_header_links" USING "btree" ("_order");


--
-- Name: richTextBlock_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "richTextBlock_block_header_links_parent_id_idx" ON "public"."richTextBlock_block_header_links" USING "btree" ("_parent_id");


--
-- Name: richTextBlock_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "richTextBlock_locales_locale_parent_id_unique" ON "public"."richTextBlock_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: richTextBlock_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "richTextBlock_order_idx" ON "public"."richTextBlock" USING "btree" ("_order");


--
-- Name: richTextBlock_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "richTextBlock_parent_id_idx" ON "public"."richTextBlock" USING "btree" ("_parent_id");


--
-- Name: richTextBlock_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "richTextBlock_path_idx" ON "public"."richTextBlock" USING "btree" ("_path");


--
-- Name: search_categories_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "search_categories_order_idx" ON "public"."search_categories" USING "btree" ("_order");


--
-- Name: search_categories_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "search_categories_parent_id_idx" ON "public"."search_categories" USING "btree" ("_parent_id");


--
-- Name: search_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "search_created_at_idx" ON "public"."search" USING "btree" ("created_at");


--
-- Name: search_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "search_locales_locale_parent_id_unique" ON "public"."search_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: search_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "search_meta_meta_image_idx" ON "public"."search" USING "btree" ("meta_image_id");


--
-- Name: search_rels_blog_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "search_rels_blog_posts_id_idx" ON "public"."search_rels" USING "btree" ("blog_posts_id");


--
-- Name: search_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "search_rels_order_idx" ON "public"."search_rels" USING "btree" ("order");


--
-- Name: search_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "search_rels_parent_idx" ON "public"."search_rels" USING "btree" ("parent_id");


--
-- Name: search_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "search_rels_path_idx" ON "public"."search_rels" USING "btree" ("path");


--
-- Name: search_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "search_slug_idx" ON "public"."search" USING "btree" ("slug");


--
-- Name: search_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "search_updated_at_idx" ON "public"."search" USING "btree" ("updated_at");


--
-- Name: settings_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "settings_locales_locale_parent_id_unique" ON "public"."settings_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: settings_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "settings_meta_meta_image_idx" ON "public"."settings_locales" USING "btree" ("meta_image_id", "_locale");


--
-- Name: settings_rels_blog_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "settings_rels_blog_posts_id_idx" ON "public"."settings_rels" USING "btree" ("blog_posts_id");


--
-- Name: settings_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "settings_rels_order_idx" ON "public"."settings_rels" USING "btree" ("order");


--
-- Name: settings_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "settings_rels_pages_id_idx" ON "public"."settings_rels" USING "btree" ("pages_id");


--
-- Name: settings_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "settings_rels_parent_idx" ON "public"."settings_rels" USING "btree" ("parent_id");


--
-- Name: settings_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "settings_rels_path_idx" ON "public"."settings_rels" USING "btree" ("path");


--
-- Name: testimonialsBlock_block_header_links_locales_locale_parent_id_u; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "testimonialsBlock_block_header_links_locales_locale_parent_id_u" ON "public"."testimonialsBlock_block_header_links_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: testimonialsBlock_block_header_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "testimonialsBlock_block_header_links_order_idx" ON "public"."testimonialsBlock_block_header_links" USING "btree" ("_order");


--
-- Name: testimonialsBlock_block_header_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "testimonialsBlock_block_header_links_parent_id_idx" ON "public"."testimonialsBlock_block_header_links" USING "btree" ("_parent_id");


--
-- Name: testimonialsBlock_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "testimonialsBlock_locales_locale_parent_id_unique" ON "public"."testimonialsBlock_locales" USING "btree" ("_locale", "_parent_id");


--
-- Name: testimonialsBlock_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "testimonialsBlock_order_idx" ON "public"."testimonialsBlock" USING "btree" ("_order");


--
-- Name: testimonialsBlock_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "testimonialsBlock_parent_id_idx" ON "public"."testimonialsBlock" USING "btree" ("_parent_id");


--
-- Name: testimonialsBlock_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "testimonialsBlock_path_idx" ON "public"."testimonialsBlock" USING "btree" ("_path");


--
-- Name: users_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "users_created_at_idx" ON "public"."users" USING "btree" ("created_at");


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "users_email_idx" ON "public"."users" USING "btree" ("email");


--
-- Name: users_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "users_updated_at_idx" ON "public"."users" USING "btree" ("updated_at");


--
-- Name: _archiveBlock_v_block_header_links_locales _archiveBlock_v_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_archiveBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_archiveBlock_v_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_archiveBlock_v_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: _archiveBlock_v_block_header_links _archiveBlock_v_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_archiveBlock_v_block_header_links"
    ADD CONSTRAINT "_archiveBlock_v_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_archiveBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _archiveBlock_v_locales _archiveBlock_v_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_archiveBlock_v_locales"
    ADD CONSTRAINT "_archiveBlock_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_archiveBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _archiveBlock_v _archiveBlock_v_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_archiveBlock_v"
    ADD CONSTRAINT "_archiveBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE CASCADE;


--
-- Name: _blogBlock_v _blogBlock_v_featured_post_id_blog_posts_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blogBlock_v"
    ADD CONSTRAINT "_blogBlock_v_featured_post_id_blog_posts_id_fk" FOREIGN KEY ("featured_post_id") REFERENCES "public"."blog_posts"("id") ON DELETE SET NULL;


--
-- Name: _blogBlock_v_locales _blogBlock_v_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blogBlock_v_locales"
    ADD CONSTRAINT "_blogBlock_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_blogBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _blogBlock_v _blogBlock_v_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blogBlock_v"
    ADD CONSTRAINT "_blogBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE CASCADE;


--
-- Name: _blog_posts_v_locales _blog_posts_v_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blog_posts_v_locales"
    ADD CONSTRAINT "_blog_posts_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_blog_posts_v"("id") ON DELETE CASCADE;


--
-- Name: _blog_posts_v_locales _blog_posts_v_locales_version_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blog_posts_v_locales"
    ADD CONSTRAINT "_blog_posts_v_locales_version_hero_image_id_media_id_fk" FOREIGN KEY ("version_hero_image_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _blog_posts_v_locales _blog_posts_v_locales_version_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blog_posts_v_locales"
    ADD CONSTRAINT "_blog_posts_v_locales_version_meta_image_id_media_id_fk" FOREIGN KEY ("version_meta_image_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _blog_posts_v _blog_posts_v_parent_id_blog_posts_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blog_posts_v"
    ADD CONSTRAINT "_blog_posts_v_parent_id_blog_posts_id_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."blog_posts"("id") ON DELETE SET NULL;


--
-- Name: _blog_posts_v_rels _blog_posts_v_rels_blog_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blog_posts_v_rels"
    ADD CONSTRAINT "_blog_posts_v_rels_blog_posts_fk" FOREIGN KEY ("blog_posts_id") REFERENCES "public"."blog_posts"("id") ON DELETE CASCADE;


--
-- Name: _blog_posts_v_rels _blog_posts_v_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blog_posts_v_rels"
    ADD CONSTRAINT "_blog_posts_v_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE CASCADE;


--
-- Name: _blog_posts_v_rels _blog_posts_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blog_posts_v_rels"
    ADD CONSTRAINT "_blog_posts_v_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."_blog_posts_v"("id") ON DELETE CASCADE;


--
-- Name: _blog_posts_v_rels _blog_posts_v_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blog_posts_v_rels"
    ADD CONSTRAINT "_blog_posts_v_rels_users_fk" FOREIGN KEY ("users_id") REFERENCES "public"."users"("id") ON DELETE CASCADE;


--
-- Name: _blog_posts_v_version_populated_authors _blog_posts_v_version_populated_authors_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_blog_posts_v_version_populated_authors"
    ADD CONSTRAINT "_blog_posts_v_version_populated_authors_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_blog_posts_v"("id") ON DELETE CASCADE;


--
-- Name: _callToActionBlock_v _callToActionBlock_v_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v"
    ADD CONSTRAINT "_callToActionBlock_v_form_id_forms_id_fk" FOREIGN KEY ("form_id") REFERENCES "public"."forms"("id") ON DELETE SET NULL;


--
-- Name: _callToActionBlock_v_links_locales _callToActionBlock_v_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v_links_locales"
    ADD CONSTRAINT "_callToActionBlock_v_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_callToActionBlock_v_links"("id") ON DELETE CASCADE;


--
-- Name: _callToActionBlock_v_links _callToActionBlock_v_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v_links"
    ADD CONSTRAINT "_callToActionBlock_v_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_callToActionBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _callToActionBlock_v_list _callToActionBlock_v_list_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v_list"
    ADD CONSTRAINT "_callToActionBlock_v_list_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_callToActionBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _callToActionBlock_v_locales _callToActionBlock_v_locales_media_desktop_dark_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v_locales"
    ADD CONSTRAINT "_callToActionBlock_v_locales_media_desktop_dark_id_media_id_fk" FOREIGN KEY ("media_desktop_dark_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _callToActionBlock_v_locales _callToActionBlock_v_locales_media_desktop_light_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v_locales"
    ADD CONSTRAINT "_callToActionBlock_v_locales_media_desktop_light_id_media_id_fk" FOREIGN KEY ("media_desktop_light_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _callToActionBlock_v_locales _callToActionBlock_v_locales_media_mobile_dark_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v_locales"
    ADD CONSTRAINT "_callToActionBlock_v_locales_media_mobile_dark_id_media_id_fk" FOREIGN KEY ("media_mobile_dark_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _callToActionBlock_v_locales _callToActionBlock_v_locales_media_mobile_light_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v_locales"
    ADD CONSTRAINT "_callToActionBlock_v_locales_media_mobile_light_id_media_id_fk" FOREIGN KEY ("media_mobile_light_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _callToActionBlock_v_locales _callToActionBlock_v_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v_locales"
    ADD CONSTRAINT "_callToActionBlock_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_callToActionBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _callToActionBlock_v _callToActionBlock_v_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_callToActionBlock_v"
    ADD CONSTRAINT "_callToActionBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE CASCADE;


--
-- Name: _customHtmlBlock_v_block_header_links_locales _customHtmlBlock_v_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customHtmlBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_customHtmlBlock_v_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_customHtmlBlock_v_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: _customHtmlBlock_v_block_header_links _customHtmlBlock_v_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customHtmlBlock_v_block_header_links"
    ADD CONSTRAINT "_customHtmlBlock_v_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_customHtmlBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _customHtmlBlock_v_locales _customHtmlBlock_v_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customHtmlBlock_v_locales"
    ADD CONSTRAINT "_customHtmlBlock_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_customHtmlBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _customHtmlBlock_v _customHtmlBlock_v_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customHtmlBlock_v"
    ADD CONSTRAINT "_customHtmlBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE CASCADE;


--
-- Name: _customers_v_locales _customers_v_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v_locales"
    ADD CONSTRAINT "_customers_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_customers_v"("id") ON DELETE CASCADE;


--
-- Name: _customers_v _customers_v_parent_id_customers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v"
    ADD CONSTRAINT "_customers_v_parent_id_customers_id_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."customers"("id") ON DELETE SET NULL;


--
-- Name: _customers_v_rels _customers_v_rels_blog_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v_rels"
    ADD CONSTRAINT "_customers_v_rels_blog_posts_fk" FOREIGN KEY ("blog_posts_id") REFERENCES "public"."blog_posts"("id") ON DELETE CASCADE;


--
-- Name: _customers_v_rels _customers_v_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v_rels"
    ADD CONSTRAINT "_customers_v_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE CASCADE;


--
-- Name: _customers_v_rels _customers_v_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v_rels"
    ADD CONSTRAINT "_customers_v_rels_pages_fk" FOREIGN KEY ("pages_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: _customers_v_rels _customers_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v_rels"
    ADD CONSTRAINT "_customers_v_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."_customers_v"("id") ON DELETE CASCADE;


--
-- Name: _customers_v _customers_v_version_testimonial_author_info_avatar_id_media_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v"
    ADD CONSTRAINT "_customers_v_version_testimonial_author_info_avatar_id_media_id" FOREIGN KEY ("version_testimonial_author_info_avatar_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _customers_v _customers_v_version_testimonial_company_company_logo_id_media_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v"
    ADD CONSTRAINT "_customers_v_version_testimonial_company_company_logo_id_media_" FOREIGN KEY ("version_testimonial_company_company_logo_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _customers_v _customers_v_version_testimonial_featured_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v"
    ADD CONSTRAINT "_customers_v_version_testimonial_featured_image_id_media_id_fk" FOREIGN KEY ("version_testimonial_featured_image_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _customers_v_version_testimonial_stats_locales _customers_v_version_testimonial_stats_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v_version_testimonial_stats_locales"
    ADD CONSTRAINT "_customers_v_version_testimonial_stats_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_customers_v_version_testimonial_stats"("id") ON DELETE CASCADE;


--
-- Name: _customers_v_version_testimonial_stats _customers_v_version_testimonial_stats_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_customers_v_version_testimonial_stats"
    ADD CONSTRAINT "_customers_v_version_testimonial_stats_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_customers_v"("id") ON DELETE CASCADE;


--
-- Name: _dividerBlock_v _dividerBlock_v_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_dividerBlock_v"
    ADD CONSTRAINT "_dividerBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE CASCADE;


--
-- Name: _faqBlock_v_block_header_links_locales _faqBlock_v_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_faqBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_faqBlock_v_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_faqBlock_v_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: _faqBlock_v_block_header_links _faqBlock_v_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_faqBlock_v_block_header_links"
    ADD CONSTRAINT "_faqBlock_v_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_faqBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _faqBlock_v_locales _faqBlock_v_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_faqBlock_v_locales"
    ADD CONSTRAINT "_faqBlock_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_faqBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _faqBlock_v _faqBlock_v_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_faqBlock_v"
    ADD CONSTRAINT "_faqBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE CASCADE;


--
-- Name: _faq_v_locales _faq_v_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_faq_v_locales"
    ADD CONSTRAINT "_faq_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_faq_v"("id") ON DELETE CASCADE;


--
-- Name: _faq_v _faq_v_parent_id_faq_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_faq_v"
    ADD CONSTRAINT "_faq_v_parent_id_faq_id_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."faq"("id") ON DELETE SET NULL;


--
-- Name: _faq_v _faq_v_version_category_id_categories_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_faq_v"
    ADD CONSTRAINT "_faq_v_version_category_id_categories_id_fk" FOREIGN KEY ("version_category_id") REFERENCES "public"."categories"("id") ON DELETE SET NULL;


--
-- Name: _featuresBlock_v_block_header_links_locales _featuresBlock_v_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_featuresBlock_v_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_featuresBlock_v_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: _featuresBlock_v_block_header_links _featuresBlock_v_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v_block_header_links"
    ADD CONSTRAINT "_featuresBlock_v_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_featuresBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _featuresBlock_v _featuresBlock_v_block_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v"
    ADD CONSTRAINT "_featuresBlock_v_block_image_id_media_id_fk" FOREIGN KEY ("block_image_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _featuresBlock_v_columns_locales _featuresBlock_v_columns_locales_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v_columns_locales"
    ADD CONSTRAINT "_featuresBlock_v_columns_locales_image_id_media_id_fk" FOREIGN KEY ("image_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _featuresBlock_v_columns_locales _featuresBlock_v_columns_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v_columns_locales"
    ADD CONSTRAINT "_featuresBlock_v_columns_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_featuresBlock_v_columns"("id") ON DELETE CASCADE;


--
-- Name: _featuresBlock_v_columns _featuresBlock_v_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v_columns"
    ADD CONSTRAINT "_featuresBlock_v_columns_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_featuresBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _featuresBlock_v_locales _featuresBlock_v_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v_locales"
    ADD CONSTRAINT "_featuresBlock_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_featuresBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _featuresBlock_v _featuresBlock_v_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_featuresBlock_v"
    ADD CONSTRAINT "_featuresBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE CASCADE;


--
-- Name: _formBlock_v _formBlock_v_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_formBlock_v"
    ADD CONSTRAINT "_formBlock_v_form_id_forms_id_fk" FOREIGN KEY ("form_id") REFERENCES "public"."forms"("id") ON DELETE SET NULL;


--
-- Name: _formBlock_v _formBlock_v_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_formBlock_v"
    ADD CONSTRAINT "_formBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE CASCADE;


--
-- Name: _galleryBlock_v_block_header_links_locales _galleryBlock_v_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_galleryBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_galleryBlock_v_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_galleryBlock_v_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: _galleryBlock_v_block_header_links _galleryBlock_v_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_galleryBlock_v_block_header_links"
    ADD CONSTRAINT "_galleryBlock_v_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_galleryBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _galleryBlock_v_interactive_gallery_locales _galleryBlock_v_interactive_gallery_locales_image_id_media_id_f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_galleryBlock_v_interactive_gallery_locales"
    ADD CONSTRAINT "_galleryBlock_v_interactive_gallery_locales_image_id_media_id_f" FOREIGN KEY ("image_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _galleryBlock_v_interactive_gallery_locales _galleryBlock_v_interactive_gallery_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_galleryBlock_v_interactive_gallery_locales"
    ADD CONSTRAINT "_galleryBlock_v_interactive_gallery_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_galleryBlock_v_interactive_gallery"("id") ON DELETE CASCADE;


--
-- Name: _galleryBlock_v_interactive_gallery _galleryBlock_v_interactive_gallery_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_galleryBlock_v_interactive_gallery"
    ADD CONSTRAINT "_galleryBlock_v_interactive_gallery_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_galleryBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _galleryBlock_v_locales _galleryBlock_v_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_galleryBlock_v_locales"
    ADD CONSTRAINT "_galleryBlock_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_galleryBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _galleryBlock_v _galleryBlock_v_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_galleryBlock_v"
    ADD CONSTRAINT "_galleryBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE CASCADE;


--
-- Name: _logosBlock_v_block_header_links_locales _logosBlock_v_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_logosBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_logosBlock_v_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_logosBlock_v_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: _logosBlock_v_block_header_links _logosBlock_v_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_logosBlock_v_block_header_links"
    ADD CONSTRAINT "_logosBlock_v_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_logosBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _logosBlock_v_locales _logosBlock_v_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_logosBlock_v_locales"
    ADD CONSTRAINT "_logosBlock_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_logosBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _logosBlock_v _logosBlock_v_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_logosBlock_v"
    ADD CONSTRAINT "_logosBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE CASCADE;


--
-- Name: _metricsBlock_v_block_header_links_locales _metricsBlock_v_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_metricsBlock_v_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_metricsBlock_v_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: _metricsBlock_v_block_header_links _metricsBlock_v_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_block_header_links"
    ADD CONSTRAINT "_metricsBlock_v_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_metricsBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _metricsBlock_v_locales _metricsBlock_v_locales_block_image_media_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_locales"
    ADD CONSTRAINT "_metricsBlock_v_locales_block_image_media_id_media_id_fk" FOREIGN KEY ("block_image_media_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _metricsBlock_v_locales _metricsBlock_v_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_locales"
    ADD CONSTRAINT "_metricsBlock_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_metricsBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _metricsBlock_v _metricsBlock_v_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v"
    ADD CONSTRAINT "_metricsBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE CASCADE;


--
-- Name: _metricsBlock_v_stats_locales _metricsBlock_v_stats_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_stats_locales"
    ADD CONSTRAINT "_metricsBlock_v_stats_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_metricsBlock_v_stats"("id") ON DELETE CASCADE;


--
-- Name: _metricsBlock_v_stats _metricsBlock_v_stats_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_stats"
    ADD CONSTRAINT "_metricsBlock_v_stats_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_metricsBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _metricsBlock_v_table_headers _metricsBlock_v_table_headers_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_table_headers"
    ADD CONSTRAINT "_metricsBlock_v_table_headers_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_metricsBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _metricsBlock_v_table_rows_cells _metricsBlock_v_table_rows_cells_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_table_rows_cells"
    ADD CONSTRAINT "_metricsBlock_v_table_rows_cells_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_metricsBlock_v_table_rows"("id") ON DELETE CASCADE;


--
-- Name: _metricsBlock_v_table_rows_children_cells _metricsBlock_v_table_rows_children_cells_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_table_rows_children_cells"
    ADD CONSTRAINT "_metricsBlock_v_table_rows_children_cells_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_metricsBlock_v_table_rows_children"("id") ON DELETE CASCADE;


--
-- Name: _metricsBlock_v_table_rows_children _metricsBlock_v_table_rows_children_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_table_rows_children"
    ADD CONSTRAINT "_metricsBlock_v_table_rows_children_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_metricsBlock_v_table_rows"("id") ON DELETE CASCADE;


--
-- Name: _metricsBlock_v_table_rows _metricsBlock_v_table_rows_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_metricsBlock_v_table_rows"
    ADD CONSTRAINT "_metricsBlock_v_table_rows_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_metricsBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _pages_v_locales _pages_v_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_locales"
    ADD CONSTRAINT "_pages_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE CASCADE;


--
-- Name: _pages_v_locales _pages_v_locales_version_hero_media_desktop_dark_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_locales"
    ADD CONSTRAINT "_pages_v_locales_version_hero_media_desktop_dark_id_media_id_fk" FOREIGN KEY ("version_hero_media_desktop_dark_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _pages_v_locales _pages_v_locales_version_hero_media_desktop_light_id_media_id_f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_locales"
    ADD CONSTRAINT "_pages_v_locales_version_hero_media_desktop_light_id_media_id_f" FOREIGN KEY ("version_hero_media_desktop_light_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _pages_v_locales _pages_v_locales_version_hero_media_mobile_dark_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_locales"
    ADD CONSTRAINT "_pages_v_locales_version_hero_media_mobile_dark_id_media_id_fk" FOREIGN KEY ("version_hero_media_mobile_dark_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _pages_v_locales _pages_v_locales_version_hero_media_mobile_light_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_locales"
    ADD CONSTRAINT "_pages_v_locales_version_hero_media_mobile_light_id_media_id_fk" FOREIGN KEY ("version_hero_media_mobile_light_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _pages_v_locales _pages_v_locales_version_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_locales"
    ADD CONSTRAINT "_pages_v_locales_version_meta_image_id_media_id_fk" FOREIGN KEY ("version_meta_image_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: _pages_v _pages_v_parent_id_pages_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v"
    ADD CONSTRAINT "_pages_v_parent_id_pages_id_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."pages"("id") ON DELETE SET NULL;


--
-- Name: _pages_v_rels _pages_v_rels_blog_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_rels"
    ADD CONSTRAINT "_pages_v_rels_blog_posts_fk" FOREIGN KEY ("blog_posts_id") REFERENCES "public"."blog_posts"("id") ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_rels"
    ADD CONSTRAINT "_pages_v_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_customers_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_rels"
    ADD CONSTRAINT "_pages_v_rels_customers_fk" FOREIGN KEY ("customers_id") REFERENCES "public"."customers"("id") ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_faq_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_rels"
    ADD CONSTRAINT "_pages_v_rels_faq_fk" FOREIGN KEY ("faq_id") REFERENCES "public"."faq"("id") ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_rels"
    ADD CONSTRAINT "_pages_v_rels_media_fk" FOREIGN KEY ("media_id") REFERENCES "public"."media"("id") ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_rels"
    ADD CONSTRAINT "_pages_v_rels_pages_fk" FOREIGN KEY ("pages_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_rels"
    ADD CONSTRAINT "_pages_v_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE CASCADE;


--
-- Name: _pages_v_version_hero_links_locales _pages_v_version_hero_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_version_hero_links_locales"
    ADD CONSTRAINT "_pages_v_version_hero_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v_version_hero_links"("id") ON DELETE CASCADE;


--
-- Name: _pages_v_version_hero_links _pages_v_version_hero_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_pages_v_version_hero_links"
    ADD CONSTRAINT "_pages_v_version_hero_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE CASCADE;


--
-- Name: _richTextBlock_v_block_header_links_locales _richTextBlock_v_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_richTextBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_richTextBlock_v_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_richTextBlock_v_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: _richTextBlock_v_block_header_links _richTextBlock_v_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_richTextBlock_v_block_header_links"
    ADD CONSTRAINT "_richTextBlock_v_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_richTextBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _richTextBlock_v_locales _richTextBlock_v_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_richTextBlock_v_locales"
    ADD CONSTRAINT "_richTextBlock_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_richTextBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _richTextBlock_v _richTextBlock_v_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_richTextBlock_v"
    ADD CONSTRAINT "_richTextBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE CASCADE;


--
-- Name: _testimonialsBlock_v_block_header_links_locales _testimonialsBlock_v_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_testimonialsBlock_v_block_header_links_locales"
    ADD CONSTRAINT "_testimonialsBlock_v_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_testimonialsBlock_v_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: _testimonialsBlock_v_block_header_links _testimonialsBlock_v_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_testimonialsBlock_v_block_header_links"
    ADD CONSTRAINT "_testimonialsBlock_v_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_testimonialsBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _testimonialsBlock_v_locales _testimonialsBlock_v_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_testimonialsBlock_v_locales"
    ADD CONSTRAINT "_testimonialsBlock_v_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_testimonialsBlock_v"("id") ON DELETE CASCADE;


--
-- Name: _testimonialsBlock_v _testimonialsBlock_v_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_testimonialsBlock_v"
    ADD CONSTRAINT "_testimonialsBlock_v_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_pages_v"("id") ON DELETE CASCADE;


--
-- Name: archiveBlock_block_header_links_locales archiveBlock_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."archiveBlock_block_header_links_locales"
    ADD CONSTRAINT "archiveBlock_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."archiveBlock_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: archiveBlock_block_header_links archiveBlock_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."archiveBlock_block_header_links"
    ADD CONSTRAINT "archiveBlock_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."archiveBlock"("id") ON DELETE CASCADE;


--
-- Name: archiveBlock_locales archiveBlock_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."archiveBlock_locales"
    ADD CONSTRAINT "archiveBlock_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."archiveBlock"("id") ON DELETE CASCADE;


--
-- Name: archiveBlock archiveBlock_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."archiveBlock"
    ADD CONSTRAINT "archiveBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: blogBlock blogBlock_featured_post_id_blog_posts_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blogBlock"
    ADD CONSTRAINT "blogBlock_featured_post_id_blog_posts_id_fk" FOREIGN KEY ("featured_post_id") REFERENCES "public"."blog_posts"("id") ON DELETE SET NULL;


--
-- Name: blogBlock_locales blogBlock_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blogBlock_locales"
    ADD CONSTRAINT "blogBlock_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."blogBlock"("id") ON DELETE CASCADE;


--
-- Name: blogBlock blogBlock_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blogBlock"
    ADD CONSTRAINT "blogBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: blog_posts_locales blog_posts_locales_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blog_posts_locales"
    ADD CONSTRAINT "blog_posts_locales_hero_image_id_media_id_fk" FOREIGN KEY ("hero_image_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: blog_posts_locales blog_posts_locales_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blog_posts_locales"
    ADD CONSTRAINT "blog_posts_locales_meta_image_id_media_id_fk" FOREIGN KEY ("meta_image_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: blog_posts_locales blog_posts_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blog_posts_locales"
    ADD CONSTRAINT "blog_posts_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."blog_posts"("id") ON DELETE CASCADE;


--
-- Name: blog_posts_populated_authors blog_posts_populated_authors_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blog_posts_populated_authors"
    ADD CONSTRAINT "blog_posts_populated_authors_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."blog_posts"("id") ON DELETE CASCADE;


--
-- Name: blog_posts_rels blog_posts_rels_blog_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blog_posts_rels"
    ADD CONSTRAINT "blog_posts_rels_blog_posts_fk" FOREIGN KEY ("blog_posts_id") REFERENCES "public"."blog_posts"("id") ON DELETE CASCADE;


--
-- Name: blog_posts_rels blog_posts_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blog_posts_rels"
    ADD CONSTRAINT "blog_posts_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE CASCADE;


--
-- Name: blog_posts_rels blog_posts_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blog_posts_rels"
    ADD CONSTRAINT "blog_posts_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."blog_posts"("id") ON DELETE CASCADE;


--
-- Name: blog_posts_rels blog_posts_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."blog_posts_rels"
    ADD CONSTRAINT "blog_posts_rels_users_fk" FOREIGN KEY ("users_id") REFERENCES "public"."users"("id") ON DELETE CASCADE;


--
-- Name: callToActionBlock callToActionBlock_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock"
    ADD CONSTRAINT "callToActionBlock_form_id_forms_id_fk" FOREIGN KEY ("form_id") REFERENCES "public"."forms"("id") ON DELETE SET NULL;


--
-- Name: callToActionBlock_links_locales callToActionBlock_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock_links_locales"
    ADD CONSTRAINT "callToActionBlock_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."callToActionBlock_links"("id") ON DELETE CASCADE;


--
-- Name: callToActionBlock_links callToActionBlock_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock_links"
    ADD CONSTRAINT "callToActionBlock_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."callToActionBlock"("id") ON DELETE CASCADE;


--
-- Name: callToActionBlock_list callToActionBlock_list_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock_list"
    ADD CONSTRAINT "callToActionBlock_list_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."callToActionBlock"("id") ON DELETE CASCADE;


--
-- Name: callToActionBlock_locales callToActionBlock_locales_media_desktop_dark_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock_locales"
    ADD CONSTRAINT "callToActionBlock_locales_media_desktop_dark_id_media_id_fk" FOREIGN KEY ("media_desktop_dark_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: callToActionBlock_locales callToActionBlock_locales_media_desktop_light_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock_locales"
    ADD CONSTRAINT "callToActionBlock_locales_media_desktop_light_id_media_id_fk" FOREIGN KEY ("media_desktop_light_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: callToActionBlock_locales callToActionBlock_locales_media_mobile_dark_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock_locales"
    ADD CONSTRAINT "callToActionBlock_locales_media_mobile_dark_id_media_id_fk" FOREIGN KEY ("media_mobile_dark_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: callToActionBlock_locales callToActionBlock_locales_media_mobile_light_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock_locales"
    ADD CONSTRAINT "callToActionBlock_locales_media_mobile_light_id_media_id_fk" FOREIGN KEY ("media_mobile_light_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: callToActionBlock_locales callToActionBlock_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock_locales"
    ADD CONSTRAINT "callToActionBlock_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."callToActionBlock"("id") ON DELETE CASCADE;


--
-- Name: callToActionBlock callToActionBlock_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."callToActionBlock"
    ADD CONSTRAINT "callToActionBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: categories_breadcrumbs categories_breadcrumbs_doc_id_categories_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."categories_breadcrumbs"
    ADD CONSTRAINT "categories_breadcrumbs_doc_id_categories_id_fk" FOREIGN KEY ("doc_id") REFERENCES "public"."categories"("id") ON DELETE SET NULL;


--
-- Name: categories_breadcrumbs categories_breadcrumbs_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."categories_breadcrumbs"
    ADD CONSTRAINT "categories_breadcrumbs_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."categories"("id") ON DELETE CASCADE;


--
-- Name: categories categories_parent_id_categories_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."categories"
    ADD CONSTRAINT "categories_parent_id_categories_id_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."categories"("id") ON DELETE SET NULL;


--
-- Name: customHtmlBlock_block_header_links_locales customHtmlBlock_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customHtmlBlock_block_header_links_locales"
    ADD CONSTRAINT "customHtmlBlock_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."customHtmlBlock_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: customHtmlBlock_block_header_links customHtmlBlock_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customHtmlBlock_block_header_links"
    ADD CONSTRAINT "customHtmlBlock_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."customHtmlBlock"("id") ON DELETE CASCADE;


--
-- Name: customHtmlBlock_locales customHtmlBlock_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customHtmlBlock_locales"
    ADD CONSTRAINT "customHtmlBlock_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."customHtmlBlock"("id") ON DELETE CASCADE;


--
-- Name: customHtmlBlock customHtmlBlock_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customHtmlBlock"
    ADD CONSTRAINT "customHtmlBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: customers_locales customers_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers_locales"
    ADD CONSTRAINT "customers_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."customers"("id") ON DELETE CASCADE;


--
-- Name: customers_rels customers_rels_blog_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers_rels"
    ADD CONSTRAINT "customers_rels_blog_posts_fk" FOREIGN KEY ("blog_posts_id") REFERENCES "public"."blog_posts"("id") ON DELETE CASCADE;


--
-- Name: customers_rels customers_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers_rels"
    ADD CONSTRAINT "customers_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE CASCADE;


--
-- Name: customers_rels customers_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers_rels"
    ADD CONSTRAINT "customers_rels_pages_fk" FOREIGN KEY ("pages_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: customers_rels customers_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers_rels"
    ADD CONSTRAINT "customers_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."customers"("id") ON DELETE CASCADE;


--
-- Name: customers customers_testimonial_author_info_avatar_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers"
    ADD CONSTRAINT "customers_testimonial_author_info_avatar_id_media_id_fk" FOREIGN KEY ("testimonial_author_info_avatar_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: customers customers_testimonial_company_company_logo_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers"
    ADD CONSTRAINT "customers_testimonial_company_company_logo_id_media_id_fk" FOREIGN KEY ("testimonial_company_company_logo_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: customers customers_testimonial_featured_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers"
    ADD CONSTRAINT "customers_testimonial_featured_image_id_media_id_fk" FOREIGN KEY ("testimonial_featured_image_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: customers_testimonial_stats_locales customers_testimonial_stats_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers_testimonial_stats_locales"
    ADD CONSTRAINT "customers_testimonial_stats_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."customers_testimonial_stats"("id") ON DELETE CASCADE;


--
-- Name: customers_testimonial_stats customers_testimonial_stats_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."customers_testimonial_stats"
    ADD CONSTRAINT "customers_testimonial_stats_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."customers"("id") ON DELETE CASCADE;


--
-- Name: dividerBlock dividerBlock_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."dividerBlock"
    ADD CONSTRAINT "dividerBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: faqBlock_block_header_links_locales faqBlock_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."faqBlock_block_header_links_locales"
    ADD CONSTRAINT "faqBlock_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."faqBlock_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: faqBlock_block_header_links faqBlock_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."faqBlock_block_header_links"
    ADD CONSTRAINT "faqBlock_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."faqBlock"("id") ON DELETE CASCADE;


--
-- Name: faqBlock_locales faqBlock_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."faqBlock_locales"
    ADD CONSTRAINT "faqBlock_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."faqBlock"("id") ON DELETE CASCADE;


--
-- Name: faqBlock faqBlock_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."faqBlock"
    ADD CONSTRAINT "faqBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: faq faq_category_id_categories_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."faq"
    ADD CONSTRAINT "faq_category_id_categories_id_fk" FOREIGN KEY ("category_id") REFERENCES "public"."categories"("id") ON DELETE SET NULL;


--
-- Name: faq_locales faq_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."faq_locales"
    ADD CONSTRAINT "faq_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."faq"("id") ON DELETE CASCADE;


--
-- Name: featuresBlock_block_header_links_locales featuresBlock_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock_block_header_links_locales"
    ADD CONSTRAINT "featuresBlock_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."featuresBlock_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: featuresBlock_block_header_links featuresBlock_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock_block_header_links"
    ADD CONSTRAINT "featuresBlock_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."featuresBlock"("id") ON DELETE CASCADE;


--
-- Name: featuresBlock featuresBlock_block_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock"
    ADD CONSTRAINT "featuresBlock_block_image_id_media_id_fk" FOREIGN KEY ("block_image_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: featuresBlock_columns_locales featuresBlock_columns_locales_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock_columns_locales"
    ADD CONSTRAINT "featuresBlock_columns_locales_image_id_media_id_fk" FOREIGN KEY ("image_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: featuresBlock_columns_locales featuresBlock_columns_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock_columns_locales"
    ADD CONSTRAINT "featuresBlock_columns_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."featuresBlock_columns"("id") ON DELETE CASCADE;


--
-- Name: featuresBlock_columns featuresBlock_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock_columns"
    ADD CONSTRAINT "featuresBlock_columns_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."featuresBlock"("id") ON DELETE CASCADE;


--
-- Name: featuresBlock_locales featuresBlock_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock_locales"
    ADD CONSTRAINT "featuresBlock_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."featuresBlock"("id") ON DELETE CASCADE;


--
-- Name: featuresBlock featuresBlock_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."featuresBlock"
    ADD CONSTRAINT "featuresBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: footer_columns_nav_items_locales footer_columns_nav_items_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."footer_columns_nav_items_locales"
    ADD CONSTRAINT "footer_columns_nav_items_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."footer_columns_nav_items"("id") ON DELETE CASCADE;


--
-- Name: footer_columns_nav_items footer_columns_nav_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."footer_columns_nav_items"
    ADD CONSTRAINT "footer_columns_nav_items_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."footer_columns"("id") ON DELETE CASCADE;


--
-- Name: footer_columns footer_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."footer_columns"
    ADD CONSTRAINT "footer_columns_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."footer"("id") ON DELETE CASCADE;


--
-- Name: footer_rels footer_rels_blog_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."footer_rels"
    ADD CONSTRAINT "footer_rels_blog_posts_fk" FOREIGN KEY ("blog_posts_id") REFERENCES "public"."blog_posts"("id") ON DELETE CASCADE;


--
-- Name: footer_rels footer_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."footer_rels"
    ADD CONSTRAINT "footer_rels_pages_fk" FOREIGN KEY ("pages_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: footer_rels footer_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."footer_rels"
    ADD CONSTRAINT "footer_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."footer"("id") ON DELETE CASCADE;


--
-- Name: formBlock formBlock_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."formBlock"
    ADD CONSTRAINT "formBlock_form_id_forms_id_fk" FOREIGN KEY ("form_id") REFERENCES "public"."forms"("id") ON DELETE SET NULL;


--
-- Name: formBlock formBlock_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."formBlock"
    ADD CONSTRAINT "formBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: form_submissions form_submissions_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."form_submissions"
    ADD CONSTRAINT "form_submissions_form_id_forms_id_fk" FOREIGN KEY ("form_id") REFERENCES "public"."forms"("id") ON DELETE SET NULL;


--
-- Name: form_submissions_submission_data form_submissions_submission_data_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."form_submissions_submission_data"
    ADD CONSTRAINT "form_submissions_submission_data_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."form_submissions"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_checkbox_locales forms_blocks_checkbox_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_checkbox_locales"
    ADD CONSTRAINT "forms_blocks_checkbox_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms_blocks_checkbox"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_checkbox forms_blocks_checkbox_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_checkbox"
    ADD CONSTRAINT "forms_blocks_checkbox_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_country_locales forms_blocks_country_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_country_locales"
    ADD CONSTRAINT "forms_blocks_country_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms_blocks_country"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_country forms_blocks_country_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_country"
    ADD CONSTRAINT "forms_blocks_country_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_email_locales forms_blocks_email_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_email_locales"
    ADD CONSTRAINT "forms_blocks_email_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms_blocks_email"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_email forms_blocks_email_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_email"
    ADD CONSTRAINT "forms_blocks_email_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_message_locales forms_blocks_message_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_message_locales"
    ADD CONSTRAINT "forms_blocks_message_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms_blocks_message"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_message forms_blocks_message_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_message"
    ADD CONSTRAINT "forms_blocks_message_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_number_locales forms_blocks_number_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_number_locales"
    ADD CONSTRAINT "forms_blocks_number_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms_blocks_number"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_number forms_blocks_number_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_number"
    ADD CONSTRAINT "forms_blocks_number_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_select_locales forms_blocks_select_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_select_locales"
    ADD CONSTRAINT "forms_blocks_select_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms_blocks_select"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_select_options_locales forms_blocks_select_options_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_select_options_locales"
    ADD CONSTRAINT "forms_blocks_select_options_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms_blocks_select_options"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_select_options forms_blocks_select_options_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_select_options"
    ADD CONSTRAINT "forms_blocks_select_options_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms_blocks_select"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_select forms_blocks_select_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_select"
    ADD CONSTRAINT "forms_blocks_select_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_state_locales forms_blocks_state_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_state_locales"
    ADD CONSTRAINT "forms_blocks_state_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms_blocks_state"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_state forms_blocks_state_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_state"
    ADD CONSTRAINT "forms_blocks_state_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_text_locales forms_blocks_text_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_text_locales"
    ADD CONSTRAINT "forms_blocks_text_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms_blocks_text"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_text forms_blocks_text_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_text"
    ADD CONSTRAINT "forms_blocks_text_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_textarea_locales forms_blocks_textarea_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_textarea_locales"
    ADD CONSTRAINT "forms_blocks_textarea_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms_blocks_textarea"("id") ON DELETE CASCADE;


--
-- Name: forms_blocks_textarea forms_blocks_textarea_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_blocks_textarea"
    ADD CONSTRAINT "forms_blocks_textarea_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE CASCADE;


--
-- Name: forms_emails_locales forms_emails_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_emails_locales"
    ADD CONSTRAINT "forms_emails_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms_emails"("id") ON DELETE CASCADE;


--
-- Name: forms_emails forms_emails_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_emails"
    ADD CONSTRAINT "forms_emails_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE CASCADE;


--
-- Name: forms_locales forms_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."forms_locales"
    ADD CONSTRAINT "forms_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."forms"("id") ON DELETE CASCADE;


--
-- Name: galleryBlock_block_header_links_locales galleryBlock_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."galleryBlock_block_header_links_locales"
    ADD CONSTRAINT "galleryBlock_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."galleryBlock_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: galleryBlock_block_header_links galleryBlock_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."galleryBlock_block_header_links"
    ADD CONSTRAINT "galleryBlock_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."galleryBlock"("id") ON DELETE CASCADE;


--
-- Name: galleryBlock_interactive_gallery_locales galleryBlock_interactive_gallery_locales_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."galleryBlock_interactive_gallery_locales"
    ADD CONSTRAINT "galleryBlock_interactive_gallery_locales_image_id_media_id_fk" FOREIGN KEY ("image_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: galleryBlock_interactive_gallery_locales galleryBlock_interactive_gallery_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."galleryBlock_interactive_gallery_locales"
    ADD CONSTRAINT "galleryBlock_interactive_gallery_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."galleryBlock_interactive_gallery"("id") ON DELETE CASCADE;


--
-- Name: galleryBlock_interactive_gallery galleryBlock_interactive_gallery_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."galleryBlock_interactive_gallery"
    ADD CONSTRAINT "galleryBlock_interactive_gallery_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."galleryBlock"("id") ON DELETE CASCADE;


--
-- Name: galleryBlock_locales galleryBlock_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."galleryBlock_locales"
    ADD CONSTRAINT "galleryBlock_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."galleryBlock"("id") ON DELETE CASCADE;


--
-- Name: galleryBlock galleryBlock_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."galleryBlock"
    ADD CONSTRAINT "galleryBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: header_cta_locales header_cta_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_cta_locales"
    ADD CONSTRAINT "header_cta_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."header_cta"("id") ON DELETE CASCADE;


--
-- Name: header_cta header_cta_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_cta"
    ADD CONSTRAINT "header_cta_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."header"("id") ON DELETE CASCADE;


--
-- Name: header_rels header_rels_blog_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_rels"
    ADD CONSTRAINT "header_rels_blog_posts_fk" FOREIGN KEY ("blog_posts_id") REFERENCES "public"."blog_posts"("id") ON DELETE CASCADE;


--
-- Name: header_rels header_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_rels"
    ADD CONSTRAINT "header_rels_pages_fk" FOREIGN KEY ("pages_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: header_rels header_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_rels"
    ADD CONSTRAINT "header_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."header"("id") ON DELETE CASCADE;


--
-- Name: header_tabs_description_links_locales header_tabs_description_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_description_links_locales"
    ADD CONSTRAINT "header_tabs_description_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."header_tabs_description_links"("id") ON DELETE CASCADE;


--
-- Name: header_tabs_description_links header_tabs_description_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_description_links"
    ADD CONSTRAINT "header_tabs_description_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."header_tabs"("id") ON DELETE CASCADE;


--
-- Name: header_tabs_locales header_tabs_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_locales"
    ADD CONSTRAINT "header_tabs_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."header_tabs"("id") ON DELETE CASCADE;


--
-- Name: header_tabs_nav_items_featured_link_links_locales header_tabs_nav_items_featured_link_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_nav_items_featured_link_links_locales"
    ADD CONSTRAINT "header_tabs_nav_items_featured_link_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."header_tabs_nav_items_featured_link_links"("id") ON DELETE CASCADE;


--
-- Name: header_tabs_nav_items_featured_link_links header_tabs_nav_items_featured_link_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_nav_items_featured_link_links"
    ADD CONSTRAINT "header_tabs_nav_items_featured_link_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."header_tabs_nav_items"("id") ON DELETE CASCADE;


--
-- Name: header_tabs_nav_items_list_links_links_locales header_tabs_nav_items_list_links_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_nav_items_list_links_links_locales"
    ADD CONSTRAINT "header_tabs_nav_items_list_links_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."header_tabs_nav_items_list_links_links"("id") ON DELETE CASCADE;


--
-- Name: header_tabs_nav_items_list_links_links header_tabs_nav_items_list_links_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_nav_items_list_links_links"
    ADD CONSTRAINT "header_tabs_nav_items_list_links_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."header_tabs_nav_items"("id") ON DELETE CASCADE;


--
-- Name: header_tabs_nav_items_locales header_tabs_nav_items_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_nav_items_locales"
    ADD CONSTRAINT "header_tabs_nav_items_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."header_tabs_nav_items"("id") ON DELETE CASCADE;


--
-- Name: header_tabs_nav_items header_tabs_nav_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs_nav_items"
    ADD CONSTRAINT "header_tabs_nav_items_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."header_tabs"("id") ON DELETE CASCADE;


--
-- Name: header_tabs header_tabs_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."header_tabs"
    ADD CONSTRAINT "header_tabs_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."header"("id") ON DELETE CASCADE;


--
-- Name: logosBlock_block_header_links_locales logosBlock_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."logosBlock_block_header_links_locales"
    ADD CONSTRAINT "logosBlock_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."logosBlock_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: logosBlock_block_header_links logosBlock_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."logosBlock_block_header_links"
    ADD CONSTRAINT "logosBlock_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."logosBlock"("id") ON DELETE CASCADE;


--
-- Name: logosBlock_locales logosBlock_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."logosBlock_locales"
    ADD CONSTRAINT "logosBlock_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."logosBlock"("id") ON DELETE CASCADE;


--
-- Name: logosBlock logosBlock_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."logosBlock"
    ADD CONSTRAINT "logosBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: media media_folder_id_payload_folders_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."media"
    ADD CONSTRAINT "media_folder_id_payload_folders_id_fk" FOREIGN KEY ("folder_id") REFERENCES "public"."payload_folders"("id") ON DELETE SET NULL;


--
-- Name: media_rels media_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."media_rels"
    ADD CONSTRAINT "media_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE CASCADE;


--
-- Name: media_rels media_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."media_rels"
    ADD CONSTRAINT "media_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."media"("id") ON DELETE CASCADE;


--
-- Name: metricsBlock_block_header_links_locales metricsBlock_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_block_header_links_locales"
    ADD CONSTRAINT "metricsBlock_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."metricsBlock_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: metricsBlock_block_header_links metricsBlock_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_block_header_links"
    ADD CONSTRAINT "metricsBlock_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."metricsBlock"("id") ON DELETE CASCADE;


--
-- Name: metricsBlock_locales metricsBlock_locales_block_image_media_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_locales"
    ADD CONSTRAINT "metricsBlock_locales_block_image_media_id_media_id_fk" FOREIGN KEY ("block_image_media_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: metricsBlock_locales metricsBlock_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_locales"
    ADD CONSTRAINT "metricsBlock_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."metricsBlock"("id") ON DELETE CASCADE;


--
-- Name: metricsBlock metricsBlock_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock"
    ADD CONSTRAINT "metricsBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: metricsBlock_stats_locales metricsBlock_stats_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_stats_locales"
    ADD CONSTRAINT "metricsBlock_stats_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."metricsBlock_stats"("id") ON DELETE CASCADE;


--
-- Name: metricsBlock_stats metricsBlock_stats_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_stats"
    ADD CONSTRAINT "metricsBlock_stats_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."metricsBlock"("id") ON DELETE CASCADE;


--
-- Name: metricsBlock_table_headers metricsBlock_table_headers_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_table_headers"
    ADD CONSTRAINT "metricsBlock_table_headers_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."metricsBlock"("id") ON DELETE CASCADE;


--
-- Name: metricsBlock_table_rows_cells metricsBlock_table_rows_cells_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_table_rows_cells"
    ADD CONSTRAINT "metricsBlock_table_rows_cells_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."metricsBlock_table_rows"("id") ON DELETE CASCADE;


--
-- Name: metricsBlock_table_rows_children_cells metricsBlock_table_rows_children_cells_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_table_rows_children_cells"
    ADD CONSTRAINT "metricsBlock_table_rows_children_cells_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."metricsBlock_table_rows_children"("id") ON DELETE CASCADE;


--
-- Name: metricsBlock_table_rows_children metricsBlock_table_rows_children_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_table_rows_children"
    ADD CONSTRAINT "metricsBlock_table_rows_children_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."metricsBlock_table_rows"("id") ON DELETE CASCADE;


--
-- Name: metricsBlock_table_rows metricsBlock_table_rows_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."metricsBlock_table_rows"
    ADD CONSTRAINT "metricsBlock_table_rows_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."metricsBlock"("id") ON DELETE CASCADE;


--
-- Name: pages_hero_links_locales pages_hero_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_hero_links_locales"
    ADD CONSTRAINT "pages_hero_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages_hero_links"("id") ON DELETE CASCADE;


--
-- Name: pages_hero_links pages_hero_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_hero_links"
    ADD CONSTRAINT "pages_hero_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: pages_locales pages_locales_hero_media_desktop_dark_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_locales"
    ADD CONSTRAINT "pages_locales_hero_media_desktop_dark_id_media_id_fk" FOREIGN KEY ("hero_media_desktop_dark_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: pages_locales pages_locales_hero_media_desktop_light_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_locales"
    ADD CONSTRAINT "pages_locales_hero_media_desktop_light_id_media_id_fk" FOREIGN KEY ("hero_media_desktop_light_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: pages_locales pages_locales_hero_media_mobile_dark_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_locales"
    ADD CONSTRAINT "pages_locales_hero_media_mobile_dark_id_media_id_fk" FOREIGN KEY ("hero_media_mobile_dark_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: pages_locales pages_locales_hero_media_mobile_light_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_locales"
    ADD CONSTRAINT "pages_locales_hero_media_mobile_light_id_media_id_fk" FOREIGN KEY ("hero_media_mobile_light_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: pages_locales pages_locales_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_locales"
    ADD CONSTRAINT "pages_locales_meta_image_id_media_id_fk" FOREIGN KEY ("meta_image_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: pages_locales pages_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_locales"
    ADD CONSTRAINT "pages_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_blog_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_rels"
    ADD CONSTRAINT "pages_rels_blog_posts_fk" FOREIGN KEY ("blog_posts_id") REFERENCES "public"."blog_posts"("id") ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_rels"
    ADD CONSTRAINT "pages_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_customers_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_rels"
    ADD CONSTRAINT "pages_rels_customers_fk" FOREIGN KEY ("customers_id") REFERENCES "public"."customers"("id") ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_faq_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_rels"
    ADD CONSTRAINT "pages_rels_faq_fk" FOREIGN KEY ("faq_id") REFERENCES "public"."faq"("id") ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_rels"
    ADD CONSTRAINT "pages_rels_media_fk" FOREIGN KEY ("media_id") REFERENCES "public"."media"("id") ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_rels"
    ADD CONSTRAINT "pages_rels_pages_fk" FOREIGN KEY ("pages_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."pages_rels"
    ADD CONSTRAINT "pages_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: payload_folders payload_folders_folder_id_payload_folders_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_folders"
    ADD CONSTRAINT "payload_folders_folder_id_payload_folders_id_fk" FOREIGN KEY ("folder_id") REFERENCES "public"."payload_folders"("id") ON DELETE SET NULL;


--
-- Name: payload_jobs_log payload_jobs_log_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_jobs_log"
    ADD CONSTRAINT "payload_jobs_log_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."payload_jobs"("id") ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_blog_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_blog_posts_fk" FOREIGN KEY ("blog_posts_id") REFERENCES "public"."blog_posts"("id") ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "public"."categories"("id") ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_customers_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_customers_fk" FOREIGN KEY ("customers_id") REFERENCES "public"."customers"("id") ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_faq_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_faq_fk" FOREIGN KEY ("faq_id") REFERENCES "public"."faq"("id") ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_form_submissions_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_form_submissions_fk" FOREIGN KEY ("form_submissions_id") REFERENCES "public"."form_submissions"("id") ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_forms_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_forms_fk" FOREIGN KEY ("forms_id") REFERENCES "public"."forms"("id") ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_media_fk" FOREIGN KEY ("media_id") REFERENCES "public"."media"("id") ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_pages_fk" FOREIGN KEY ("pages_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."payload_locked_documents"("id") ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_payload_folders_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_payload_folders_fk" FOREIGN KEY ("payload_folders_id") REFERENCES "public"."payload_folders"("id") ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_payload_jobs_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_payload_jobs_fk" FOREIGN KEY ("payload_jobs_id") REFERENCES "public"."payload_jobs"("id") ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_redirects_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_redirects_fk" FOREIGN KEY ("redirects_id") REFERENCES "public"."redirects"("id") ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_search_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_search_fk" FOREIGN KEY ("search_id") REFERENCES "public"."search"("id") ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_locked_documents_rels"
    ADD CONSTRAINT "payload_locked_documents_rels_users_fk" FOREIGN KEY ("users_id") REFERENCES "public"."users"("id") ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_preferences_rels"
    ADD CONSTRAINT "payload_preferences_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."payload_preferences"("id") ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."payload_preferences_rels"
    ADD CONSTRAINT "payload_preferences_rels_users_fk" FOREIGN KEY ("users_id") REFERENCES "public"."users"("id") ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_blog_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."redirects_rels"
    ADD CONSTRAINT "redirects_rels_blog_posts_fk" FOREIGN KEY ("blog_posts_id") REFERENCES "public"."blog_posts"("id") ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."redirects_rels"
    ADD CONSTRAINT "redirects_rels_pages_fk" FOREIGN KEY ("pages_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."redirects_rels"
    ADD CONSTRAINT "redirects_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."redirects"("id") ON DELETE CASCADE;


--
-- Name: richTextBlock_block_header_links_locales richTextBlock_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."richTextBlock_block_header_links_locales"
    ADD CONSTRAINT "richTextBlock_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."richTextBlock_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: richTextBlock_block_header_links richTextBlock_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."richTextBlock_block_header_links"
    ADD CONSTRAINT "richTextBlock_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."richTextBlock"("id") ON DELETE CASCADE;


--
-- Name: richTextBlock_locales richTextBlock_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."richTextBlock_locales"
    ADD CONSTRAINT "richTextBlock_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."richTextBlock"("id") ON DELETE CASCADE;


--
-- Name: richTextBlock richTextBlock_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."richTextBlock"
    ADD CONSTRAINT "richTextBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: search_categories search_categories_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."search_categories"
    ADD CONSTRAINT "search_categories_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."search"("id") ON DELETE CASCADE;


--
-- Name: search_locales search_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."search_locales"
    ADD CONSTRAINT "search_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."search"("id") ON DELETE CASCADE;


--
-- Name: search search_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."search"
    ADD CONSTRAINT "search_meta_image_id_media_id_fk" FOREIGN KEY ("meta_image_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: search_rels search_rels_blog_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."search_rels"
    ADD CONSTRAINT "search_rels_blog_posts_fk" FOREIGN KEY ("blog_posts_id") REFERENCES "public"."blog_posts"("id") ON DELETE CASCADE;


--
-- Name: search_rels search_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."search_rels"
    ADD CONSTRAINT "search_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."search"("id") ON DELETE CASCADE;


--
-- Name: settings_locales settings_locales_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."settings_locales"
    ADD CONSTRAINT "settings_locales_meta_image_id_media_id_fk" FOREIGN KEY ("meta_image_id") REFERENCES "public"."media"("id") ON DELETE SET NULL;


--
-- Name: settings_locales settings_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."settings_locales"
    ADD CONSTRAINT "settings_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."settings"("id") ON DELETE CASCADE;


--
-- Name: settings_rels settings_rels_blog_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."settings_rels"
    ADD CONSTRAINT "settings_rels_blog_posts_fk" FOREIGN KEY ("blog_posts_id") REFERENCES "public"."blog_posts"("id") ON DELETE CASCADE;


--
-- Name: settings_rels settings_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."settings_rels"
    ADD CONSTRAINT "settings_rels_pages_fk" FOREIGN KEY ("pages_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- Name: settings_rels settings_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."settings_rels"
    ADD CONSTRAINT "settings_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."settings"("id") ON DELETE CASCADE;


--
-- Name: testimonialsBlock_block_header_links_locales testimonialsBlock_block_header_links_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."testimonialsBlock_block_header_links_locales"
    ADD CONSTRAINT "testimonialsBlock_block_header_links_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."testimonialsBlock_block_header_links"("id") ON DELETE CASCADE;


--
-- Name: testimonialsBlock_block_header_links testimonialsBlock_block_header_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."testimonialsBlock_block_header_links"
    ADD CONSTRAINT "testimonialsBlock_block_header_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."testimonialsBlock"("id") ON DELETE CASCADE;


--
-- Name: testimonialsBlock_locales testimonialsBlock_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."testimonialsBlock_locales"
    ADD CONSTRAINT "testimonialsBlock_locales_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."testimonialsBlock"("id") ON DELETE CASCADE;


--
-- Name: testimonialsBlock testimonialsBlock_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."testimonialsBlock"
    ADD CONSTRAINT "testimonialsBlock_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."pages"("id") ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

