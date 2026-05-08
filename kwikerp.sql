/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.2.2-MariaDB, for osx10.19 (x86_64)
--
-- Host: localhost    Database: kwikerp
-- ------------------------------------------------------
-- Server version	12.2.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `accounts_account_account_tags`
--

DROP TABLE IF EXISTS `accounts_account_account_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account_account_tags` (
  `account_id` bigint(20) unsigned NOT NULL,
  `account_tag_id` bigint(20) unsigned NOT NULL,
  KEY `accounts_account_account_tags_account_id_foreign` (`account_id`),
  KEY `accounts_account_account_tags_account_tag_id_foreign` (`account_tag_id`),
  CONSTRAINT `accounts_account_account_tags_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_account_account_tags_account_tag_id_foreign` FOREIGN KEY (`account_tag_id`) REFERENCES `accounts_account_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account_account_tags`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_account_account_tags` WRITE;
/*!40000 ALTER TABLE `accounts_account_account_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_account_account_tags` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_account_companies`
--

DROP TABLE IF EXISTS `accounts_account_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account_companies` (
  `account_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  KEY `accounts_account_companies_account_id_foreign` (`account_id`),
  KEY `accounts_account_companies_company_id_foreign` (`company_id`),
  CONSTRAINT `accounts_account_companies_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_account_companies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account_companies`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_account_companies` WRITE;
/*!40000 ALTER TABLE `accounts_account_companies` DISABLE KEYS */;
INSERT INTO `accounts_account_companies` VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1),
(13,1),
(14,1),
(15,1),
(16,1),
(17,1),
(18,1),
(19,1),
(20,1),
(21,1),
(22,1),
(23,1),
(24,1),
(25,1),
(26,1),
(27,1),
(28,1),
(29,1),
(30,1),
(31,1),
(32,1),
(33,1),
(34,1),
(35,1),
(36,1),
(37,1),
(38,1),
(39,1),
(40,1),
(41,1),
(42,1),
(43,1),
(44,1),
(45,1),
(46,1),
(47,1),
(48,1),
(49,1),
(50,1),
(51,1);
/*!40000 ALTER TABLE `accounts_account_companies` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_account_journals`
--

DROP TABLE IF EXISTS `accounts_account_journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account_journals` (
  `account_id` bigint(20) unsigned NOT NULL,
  `journal_id` bigint(20) unsigned NOT NULL,
  KEY `accounts_account_journals_account_id_foreign` (`account_id`),
  KEY `accounts_account_journals_journal_id_foreign` (`journal_id`),
  CONSTRAINT `accounts_account_journals_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_account_journals_journal_id_foreign` FOREIGN KEY (`journal_id`) REFERENCES `accounts_journals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account_journals`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_account_journals` WRITE;
/*!40000 ALTER TABLE `accounts_account_journals` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_account_journals` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_account_move_lines`
--

DROP TABLE IF EXISTS `accounts_account_move_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account_move_lines` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL,
  `move_id` bigint(20) unsigned NOT NULL COMMENT 'Journal Entry',
  `journal_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Journal',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `company_currency_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company Currency',
  `reconcile_id` bigint(20) unsigned DEFAULT NULL,
  `full_reconcile_id` bigint(20) unsigned DEFAULT NULL,
  `payment_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Payment',
  `tax_repartition_line_id` bigint(20) unsigned DEFAULT NULL,
  `account_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Account',
  `currency_id` bigint(20) unsigned NOT NULL COMMENT 'Currency',
  `partner_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Partner',
  `group_tax_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Originator Group of Taxes',
  `tax_line_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Originator Tax',
  `tax_group_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Originator tax group',
  `statement_id` bigint(20) unsigned DEFAULT NULL,
  `statement_line_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Product',
  `uom_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Unit of Measure',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `move_name` varchar(255) DEFAULT NULL COMMENT 'Number',
  `parent_state` varchar(255) DEFAULT NULL COMMENT 'Status',
  `reference` varchar(255) DEFAULT NULL COMMENT 'Reference',
  `name` varchar(255) DEFAULT NULL COMMENT 'Label',
  `matching_number` varchar(255) DEFAULT NULL COMMENT 'Matching #',
  `display_type` varchar(255) DEFAULT 'product' COMMENT 'Display Type',
  `date` date DEFAULT NULL COMMENT 'Date',
  `invoice_date` date DEFAULT NULL COMMENT 'Invoice/Bill Date',
  `date_maturity` date DEFAULT NULL COMMENT 'Due Date',
  `discount_date` date DEFAULT NULL COMMENT 'Discount Date',
  `analytic_distribution` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Analytic Distribution' CHECK (json_valid(`analytic_distribution`)),
  `debit` decimal(15,4) DEFAULT NULL COMMENT 'Debit',
  `credit` decimal(15,4) DEFAULT NULL COMMENT 'Credit',
  `balance` decimal(15,4) DEFAULT NULL COMMENT 'Balance',
  `amount_currency` decimal(15,4) DEFAULT NULL COMMENT 'Amount in Currency',
  `tax_base_amount` decimal(15,4) DEFAULT NULL COMMENT 'Base Amount',
  `amount_residual` decimal(15,4) DEFAULT NULL COMMENT 'Residual Amount',
  `amount_residual_currency` decimal(15,4) DEFAULT NULL COMMENT 'Residual Amount in Currency',
  `quantity` decimal(15,4) DEFAULT NULL COMMENT 'Quantity',
  `price_unit` decimal(15,4) DEFAULT NULL COMMENT 'Price Unit',
  `price_subtotal` decimal(15,4) DEFAULT NULL COMMENT 'Subtotal',
  `price_total` decimal(15,4) DEFAULT NULL COMMENT 'Total',
  `discount` decimal(5,2) DEFAULT NULL COMMENT 'Discount (%)',
  `discount_amount_currency` decimal(15,4) DEFAULT NULL COMMENT 'Discount Amount in Currency',
  `discount_balance` decimal(15,4) DEFAULT NULL COMMENT 'Discount Balance',
  `is_imported` tinyint(1) NOT NULL DEFAULT 0,
  `tax_tag_invert` tinyint(1) NOT NULL DEFAULT 0,
  `reconciled` tinyint(1) NOT NULL DEFAULT 0,
  `is_downpayment` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_account_move_lines_move_id_foreign` (`move_id`),
  KEY `accounts_account_move_lines_journal_id_foreign` (`journal_id`),
  KEY `accounts_account_move_lines_company_id_foreign` (`company_id`),
  KEY `accounts_account_move_lines_company_currency_id_foreign` (`company_currency_id`),
  KEY `accounts_account_move_lines_reconcile_id_foreign` (`reconcile_id`),
  KEY `accounts_account_move_lines_payment_id_foreign` (`payment_id`),
  KEY `accounts_account_move_lines_tax_repartition_line_id_foreign` (`tax_repartition_line_id`),
  KEY `accounts_account_move_lines_account_id_foreign` (`account_id`),
  KEY `accounts_account_move_lines_currency_id_foreign` (`currency_id`),
  KEY `accounts_account_move_lines_partner_id_foreign` (`partner_id`),
  KEY `accounts_account_move_lines_group_tax_id_foreign` (`group_tax_id`),
  KEY `accounts_account_move_lines_tax_line_id_foreign` (`tax_line_id`),
  KEY `accounts_account_move_lines_tax_group_id_foreign` (`tax_group_id`),
  KEY `accounts_account_move_lines_statement_id_foreign` (`statement_id`),
  KEY `accounts_account_move_lines_statement_line_id_foreign` (`statement_line_id`),
  KEY `accounts_account_move_lines_product_id_foreign` (`product_id`),
  KEY `accounts_account_move_lines_uom_id_foreign` (`uom_id`),
  KEY `accounts_account_move_lines_full_reconcile_id_foreign` (`full_reconcile_id`),
  KEY `accounts_account_move_lines_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_account_move_lines_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_account_move_lines_company_currency_id_foreign` FOREIGN KEY (`company_currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_move_lines_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_move_lines_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_move_lines_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `accounts_account_move_lines_full_reconcile_id_foreign` FOREIGN KEY (`full_reconcile_id`) REFERENCES `accounts_full_reconciles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_move_lines_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `accounts_taxes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_move_lines_journal_id_foreign` FOREIGN KEY (`journal_id`) REFERENCES `accounts_journals` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_move_lines_move_id_foreign` FOREIGN KEY (`move_id`) REFERENCES `accounts_account_moves` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_account_move_lines_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners_partners` (`id`),
  CONSTRAINT `accounts_account_move_lines_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `accounts_account_payments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_move_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products_products` (`id`),
  CONSTRAINT `accounts_account_move_lines_reconcile_id_foreign` FOREIGN KEY (`reconcile_id`) REFERENCES `accounts_reconciles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_move_lines_statement_id_foreign` FOREIGN KEY (`statement_id`) REFERENCES `accounts_bank_statements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_move_lines_statement_line_id_foreign` FOREIGN KEY (`statement_line_id`) REFERENCES `accounts_bank_statement_lines` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_move_lines_tax_group_id_foreign` FOREIGN KEY (`tax_group_id`) REFERENCES `accounts_tax_groups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_move_lines_tax_line_id_foreign` FOREIGN KEY (`tax_line_id`) REFERENCES `accounts_taxes` (`id`),
  CONSTRAINT `accounts_account_move_lines_tax_repartition_line_id_foreign` FOREIGN KEY (`tax_repartition_line_id`) REFERENCES `accounts_tax_partition_lines` (`id`),
  CONSTRAINT `accounts_account_move_lines_uom_id_foreign` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account_move_lines`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_account_move_lines` WRITE;
/*!40000 ALTER TABLE `accounts_account_move_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_account_move_lines` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_account_moves`
--

DROP TABLE IF EXISTS `accounts_account_moves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account_moves` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort order',
  `journal_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Journal',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `tax_cash_basis_origin_move_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Cash Basis Origin',
  `tax_cash_basis_reconcile_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Tax Cash Basis Entry of',
  `auto_post_origin_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Auto Post Origin',
  `origin_payment_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Payment',
  `secure_sequence_number` int(11) DEFAULT NULL COMMENT 'Secure Sequence Number',
  `invoice_payment_term_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Payment Term',
  `partner_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Partner',
  `commercial_partner_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Commercial Partner',
  `partner_shipping_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Shipping Address',
  `partner_bank_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Bank Account',
  `fiscal_position_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Fiscal Position',
  `currency_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Currency',
  `reversed_entry_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Reversed Entry',
  `campaign_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Campaign',
  `invoice_user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Invoice User',
  `statement_line_id` bigint(20) unsigned DEFAULT NULL,
  `invoice_incoterm_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Incoterm',
  `preferred_payment_method_line_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Payment Method Line',
  `invoice_cash_rounding_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Cash Rounding',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `sequence_prefix` varchar(255) DEFAULT NULL COMMENT 'Sequence Prefix',
  `access_token` varchar(255) DEFAULT NULL COMMENT 'Access Token',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `reference` varchar(255) DEFAULT NULL COMMENT 'Reference',
  `state` varchar(255) NOT NULL DEFAULT 'draft' COMMENT 'State',
  `move_type` varchar(255) NOT NULL COMMENT 'Move Type',
  `auto_post` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Auto Post',
  `inalterable_hash` varchar(255) DEFAULT NULL COMMENT 'Inalterable Hash',
  `payment_reference` varchar(255) DEFAULT NULL COMMENT 'Payment Reference',
  `qr_code_method` varchar(255) DEFAULT NULL COMMENT 'QR Code Method',
  `payment_state` varchar(255) DEFAULT 'not_paid' COMMENT 'Payment State',
  `invoice_source_email` varchar(255) DEFAULT NULL COMMENT 'Source Email',
  `invoice_partner_display_name` varchar(255) DEFAULT NULL COMMENT 'Partner Display Name',
  `invoice_origin` varchar(255) DEFAULT NULL COMMENT 'Origin',
  `incoterm_location` varchar(255) DEFAULT NULL COMMENT 'Incoterm Location',
  `date` date NOT NULL COMMENT 'Date',
  `auto_post_until` date DEFAULT NULL COMMENT 'Auto Post Until',
  `invoice_date` date DEFAULT NULL COMMENT 'Invoice Date',
  `invoice_date_due` date DEFAULT NULL COMMENT 'Due Date',
  `delivery_date` date DEFAULT NULL COMMENT 'Delivery Date',
  `sending_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Sending Data' CHECK (json_valid(`sending_data`)),
  `narration` text DEFAULT NULL COMMENT 'Narration',
  `invoice_currency_rate` decimal(15,4) DEFAULT NULL COMMENT 'Currency Rate',
  `amount_untaxed` decimal(15,4) DEFAULT NULL COMMENT 'Untaxed Amount',
  `amount_tax` decimal(15,4) DEFAULT NULL COMMENT 'Tax Amount',
  `amount_total` decimal(15,4) DEFAULT NULL COMMENT 'Total Amount',
  `amount_residual` decimal(15,4) DEFAULT NULL COMMENT 'Residual Amount',
  `amount_untaxed_signed` decimal(15,4) DEFAULT NULL COMMENT 'Untaxed Amount Signed',
  `amount_untaxed_in_currency_signed` decimal(15,4) DEFAULT NULL COMMENT 'Untaxed Amount in Currency Signed',
  `amount_tax_signed` decimal(15,4) DEFAULT NULL COMMENT 'Tax Amount Signed',
  `amount_total_signed` decimal(15,4) DEFAULT NULL COMMENT 'Total Amount Signed',
  `amount_total_in_currency_signed` decimal(15,4) DEFAULT NULL COMMENT 'Total Amount in Currency Signed',
  `amount_residual_signed` decimal(15,4) DEFAULT NULL COMMENT 'Residual Amount Signed',
  `quick_edit_total_amount` decimal(15,4) DEFAULT NULL COMMENT 'Quick Edit Total Amount',
  `is_storno` tinyint(1) NOT NULL DEFAULT 0,
  `always_tax_exigible` tinyint(1) NOT NULL DEFAULT 0,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `posted_before` tinyint(1) NOT NULL DEFAULT 0,
  `made_sequence_gap` tinyint(1) NOT NULL DEFAULT 0,
  `is_manually_modified` tinyint(1) NOT NULL DEFAULT 0,
  `is_move_sent` tinyint(1) NOT NULL DEFAULT 0,
  `source_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Source',
  `medium_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Medium',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_account_moves_journal_id_foreign` (`journal_id`),
  KEY `accounts_account_moves_company_id_foreign` (`company_id`),
  KEY `accounts_account_moves_tax_cash_basis_origin_move_id_foreign` (`tax_cash_basis_origin_move_id`),
  KEY `accounts_account_moves_auto_post_origin_id_foreign` (`auto_post_origin_id`),
  KEY `accounts_account_moves_origin_payment_id_foreign` (`origin_payment_id`),
  KEY `accounts_account_moves_invoice_payment_term_id_foreign` (`invoice_payment_term_id`),
  KEY `accounts_account_moves_partner_id_foreign` (`partner_id`),
  KEY `accounts_account_moves_commercial_partner_id_foreign` (`commercial_partner_id`),
  KEY `accounts_account_moves_partner_shipping_id_foreign` (`partner_shipping_id`),
  KEY `accounts_account_moves_partner_bank_id_foreign` (`partner_bank_id`),
  KEY `accounts_account_moves_fiscal_position_id_foreign` (`fiscal_position_id`),
  KEY `accounts_account_moves_currency_id_foreign` (`currency_id`),
  KEY `accounts_account_moves_reversed_entry_id_foreign` (`reversed_entry_id`),
  KEY `accounts_account_moves_campaign_id_foreign` (`campaign_id`),
  KEY `accounts_account_moves_invoice_user_id_foreign` (`invoice_user_id`),
  KEY `accounts_account_moves_statement_line_id_foreign` (`statement_line_id`),
  KEY `accounts_account_moves_invoice_incoterm_id_foreign` (`invoice_incoterm_id`),
  KEY `accounts_account_moves_preferred_payment_method_line_id_foreign` (`preferred_payment_method_line_id`),
  KEY `accounts_account_moves_invoice_cash_rounding_id_foreign` (`invoice_cash_rounding_id`),
  KEY `accounts_account_moves_creator_id_foreign` (`creator_id`),
  KEY `accounts_account_moves_source_id_foreign` (`source_id`),
  KEY `accounts_account_moves_medium_id_foreign` (`medium_id`),
  KEY `accounts_account_moves_tax_cash_basis_reconcile_id_foreign` (`tax_cash_basis_reconcile_id`),
  CONSTRAINT `accounts_account_moves_auto_post_origin_id_foreign` FOREIGN KEY (`auto_post_origin_id`) REFERENCES `accounts_account_moves` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `utm_campaigns` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_commercial_partner_id_foreign` FOREIGN KEY (`commercial_partner_id`) REFERENCES `partners_partners` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `accounts_account_moves_fiscal_position_id_foreign` FOREIGN KEY (`fiscal_position_id`) REFERENCES `accounts_fiscal_positions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_invoice_cash_rounding_id_foreign` FOREIGN KEY (`invoice_cash_rounding_id`) REFERENCES `accounts_cash_roundings` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_invoice_incoterm_id_foreign` FOREIGN KEY (`invoice_incoterm_id`) REFERENCES `accounts_incoterms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_invoice_payment_term_id_foreign` FOREIGN KEY (`invoice_payment_term_id`) REFERENCES `accounts_payment_terms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_invoice_user_id_foreign` FOREIGN KEY (`invoice_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_journal_id_foreign` FOREIGN KEY (`journal_id`) REFERENCES `accounts_journals` (`id`),
  CONSTRAINT `accounts_account_moves_medium_id_foreign` FOREIGN KEY (`medium_id`) REFERENCES `utm_mediums` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_origin_payment_id_foreign` FOREIGN KEY (`origin_payment_id`) REFERENCES `accounts_account_payments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_partner_bank_id_foreign` FOREIGN KEY (`partner_bank_id`) REFERENCES `partners_bank_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners_partners` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_partner_shipping_id_foreign` FOREIGN KEY (`partner_shipping_id`) REFERENCES `partners_partners` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_preferred_payment_method_line_id_foreign` FOREIGN KEY (`preferred_payment_method_line_id`) REFERENCES `accounts_payment_method_lines` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_reversed_entry_id_foreign` FOREIGN KEY (`reversed_entry_id`) REFERENCES `accounts_account_moves` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `utm_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_statement_line_id_foreign` FOREIGN KEY (`statement_line_id`) REFERENCES `accounts_bank_statement_lines` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_tax_cash_basis_origin_move_id_foreign` FOREIGN KEY (`tax_cash_basis_origin_move_id`) REFERENCES `accounts_account_moves` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_moves_tax_cash_basis_reconcile_id_foreign` FOREIGN KEY (`tax_cash_basis_reconcile_id`) REFERENCES `accounts_partial_reconciles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account_moves`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_account_moves` WRITE;
/*!40000 ALTER TABLE `accounts_account_moves` DISABLE KEYS */;
INSERT INTO `accounts_account_moves` VALUES
(1,1,1,1,NULL,NULL,NULL,NULL,NULL,2,47,47,47,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'INV/2026',NULL,'INV/2026/1',NULL,'draft','out_invoice',0,NULL,NULL,NULL,'not_paid',NULL,'Himbaza Caleb',NULL,NULL,'2026-04-27',NULL,'2026-04-27','2026-04-27',NULL,NULL,'<p></p>',1.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,0,0,0,0,0,0,0,NULL,NULL,'2026-04-27 09:20:30','2026-04-27 09:20:31'),
(2,2,1,1,NULL,NULL,NULL,NULL,NULL,2,2,2,2,NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL,1,'INV/2026',NULL,'INV/2026/2',NULL,'draft','out_invoice',0,NULL,NULL,NULL,'not_paid',NULL,'kwikkoders',NULL,NULL,'2026-04-30',NULL,'2026-04-30','2026-04-30',NULL,NULL,'<p></p>',1.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,0,0,0,0,0,0,0,NULL,NULL,'2026-04-30 11:08:25','2026-04-30 11:08:25');
/*!40000 ALTER TABLE `accounts_account_moves` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_account_payment_register_move_lines`
--

DROP TABLE IF EXISTS `accounts_account_payment_register_move_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account_payment_register_move_lines` (
  `payment_register_id` bigint(20) unsigned NOT NULL COMMENT 'Account Payment Register Id',
  `move_line_id` bigint(20) unsigned NOT NULL COMMENT 'Account move line',
  KEY `fk_payment_register` (`payment_register_id`),
  KEY `fk_move_line` (`move_line_id`),
  CONSTRAINT `fk_move_line` FOREIGN KEY (`move_line_id`) REFERENCES `accounts_account_move_lines` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_payment_register` FOREIGN KEY (`payment_register_id`) REFERENCES `accounts_payment_registers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account_payment_register_move_lines`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_account_payment_register_move_lines` WRITE;
/*!40000 ALTER TABLE `accounts_account_payment_register_move_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_account_payment_register_move_lines` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_account_payments`
--

DROP TABLE IF EXISTS `accounts_account_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Journal',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `partner_bank_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Partner Bank',
  `paired_internal_transfer_payment_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Paired Internal Transfer Payment',
  `payment_method_line_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Payment Method Line',
  `payment_method_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Payment Method',
  `currency_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Currency',
  `partner_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Partner',
  `outstanding_account_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Outstanding Account',
  `destination_account_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Destination Account',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `state` varchar(255) NOT NULL COMMENT 'State',
  `payment_type` varchar(255) DEFAULT NULL COMMENT 'Payment Type',
  `partner_type` varchar(255) DEFAULT NULL COMMENT 'Partner Type',
  `memo` varchar(255) DEFAULT NULL COMMENT 'Memo',
  `payment_reference` varchar(255) DEFAULT NULL COMMENT 'Payment Reference',
  `date` date DEFAULT NULL COMMENT 'Date',
  `amount` decimal(15,4) DEFAULT NULL COMMENT 'Amount',
  `amount_company_currency_signed` decimal(15,4) DEFAULT NULL COMMENT 'Amount in Company Currency Signed',
  `is_reconciled` tinyint(1) DEFAULT NULL COMMENT 'Is Reconciled',
  `is_matched` tinyint(1) DEFAULT NULL COMMENT 'Is Matched',
  `is_sent` tinyint(1) DEFAULT NULL COMMENT 'Is Sent',
  `source_payment_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Source Payment',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `move_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Journal Entry',
  `receipt_attachment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_account_payments_journal_id_foreign` (`journal_id`),
  KEY `accounts_account_payments_company_id_foreign` (`company_id`),
  KEY `accounts_account_payments_partner_bank_id_foreign` (`partner_bank_id`),
  KEY `fk_paired_transfer` (`paired_internal_transfer_payment_id`),
  KEY `accounts_account_payments_payment_method_line_id_foreign` (`payment_method_line_id`),
  KEY `accounts_account_payments_payment_method_id_foreign` (`payment_method_id`),
  KEY `accounts_account_payments_currency_id_foreign` (`currency_id`),
  KEY `accounts_account_payments_partner_id_foreign` (`partner_id`),
  KEY `accounts_account_payments_outstanding_account_id_foreign` (`outstanding_account_id`),
  KEY `accounts_account_payments_destination_account_id_foreign` (`destination_account_id`),
  KEY `fk_source_payment` (`source_payment_id`),
  KEY `accounts_account_payments_move_id_foreign` (`move_id`),
  KEY `accounts_account_payments_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_account_payments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `accounts_account_payments_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_payments_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_payments_destination_account_id_foreign` FOREIGN KEY (`destination_account_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_payments_journal_id_foreign` FOREIGN KEY (`journal_id`) REFERENCES `accounts_journals` (`id`),
  CONSTRAINT `accounts_account_payments_move_id_foreign` FOREIGN KEY (`move_id`) REFERENCES `accounts_account_moves` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_payments_outstanding_account_id_foreign` FOREIGN KEY (`outstanding_account_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_payments_partner_bank_id_foreign` FOREIGN KEY (`partner_bank_id`) REFERENCES `partners_bank_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_payments_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners_partners` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `accounts_payment_methods` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_payments_payment_method_line_id_foreign` FOREIGN KEY (`payment_method_line_id`) REFERENCES `accounts_payment_method_lines` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_paired_transfer` FOREIGN KEY (`paired_internal_transfer_payment_id`) REFERENCES `accounts_account_payments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_source_payment` FOREIGN KEY (`source_payment_id`) REFERENCES `accounts_account_payments` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account_payments`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_account_payments` WRITE;
/*!40000 ALTER TABLE `accounts_account_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_account_payments` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_account_tags`
--

DROP TABLE IF EXISTS `accounts_account_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL COMMENT 'Color',
  `country_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Country ID',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Creator ID',
  `applicability` varchar(255) NOT NULL COMMENT 'Applicability',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `tax_negate` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Tax Negate',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_account_tags_country_id_foreign` (`country_id`),
  KEY `accounts_account_tags_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_account_tags_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_account_tags_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account_tags`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_account_tags` WRITE;
/*!40000 ALTER TABLE `accounts_account_tags` DISABLE KEYS */;
INSERT INTO `accounts_account_tags` VALUES
(17,'#FF0000',1,1,'accounts','Operating Activities',0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(18,'#00FF00',1,1,'accounts','Financing Activities',0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(19,'#0000FF',1,1,'accounts','Investing & Extraordinary Activities',0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(20,'#FFFF00',1,1,'accounts','Demo Capital Account',0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(21,'#FF00FF',1,1,'accounts','Demo Stock Account',0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(22,'#00FFFF',1,1,'accounts','Demo Sale of Land Account',0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(23,'#000000',1,1,'accounts','Demo CEO Wages Account',0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(24,'#FFFFFF',1,1,'accounts','Office Furniture',0,'2026-04-24 05:30:13','2026-04-24 05:30:13');
/*!40000 ALTER TABLE `accounts_account_tags` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_account_taxes`
--

DROP TABLE IF EXISTS `accounts_account_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account_taxes` (
  `account_id` bigint(20) unsigned NOT NULL,
  `tax_id` bigint(20) unsigned NOT NULL,
  KEY `accounts_account_taxes_account_id_foreign` (`account_id`),
  KEY `accounts_account_taxes_tax_id_foreign` (`tax_id`),
  CONSTRAINT `accounts_account_taxes_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_account_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `accounts_taxes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account_taxes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_account_taxes` WRITE;
/*!40000 ALTER TABLE `accounts_account_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_account_taxes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_accounts`
--

DROP TABLE IF EXISTS `accounts_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Currency',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Creator',
  `account_type` varchar(255) NOT NULL COMMENT 'Account Type',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note',
  `deprecated` tinyint(1) DEFAULT NULL COMMENT 'Deprecated',
  `reconcile` tinyint(1) DEFAULT NULL COMMENT 'Reconcile',
  `non_trade` tinyint(1) DEFAULT NULL COMMENT 'Non Trade',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_accounts_currency_id_foreign` (`currency_id`),
  KEY `accounts_accounts_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_accounts_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_accounts_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_accounts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_accounts` WRITE;
/*!40000 ALTER TABLE `accounts_accounts` DISABLE KEYS */;
INSERT INTO `accounts_accounts` VALUES
(1,1,1,'asset_current','Current Assets','101000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(2,1,1,'asset_current','Stock Valuation','110100',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(3,1,1,'asset_current','Stock Interim (Received)','110200',NULL,0,1,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(4,1,1,'asset_current','Stock Interim (Delivered)','110300',NULL,0,1,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(5,1,1,'asset_current','Cost of Production','110400',NULL,0,1,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(6,1,1,'asset_current','Work in Progress','110500',NULL,0,1,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(7,1,1,'asset_receivable','Account Receivable','121000',NULL,0,1,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(8,1,1,'asset_current','Products to receive','121100',NULL,0,1,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(9,1,1,'asset_current','Prepaid Expenses','128000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(10,1,1,'asset_current','Tax Paid','131000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(11,1,1,'asset_current','Tax Receivable','132000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(12,1,1,'asset_prepayments','Prepayments','141000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(13,1,1,'asset_fixed','Fixed Asset','151000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(14,1,1,'asset_non_current','Non-current assets','191000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(15,1,1,'liability_current','Current Liabilities','201000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(16,1,1,'liability_payable','Account Payable','211000',NULL,0,1,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(17,1,1,'liability_current','Bills to receive','211100',NULL,0,1,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(18,1,1,'liability_current','Deferred Revenue','212000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(19,1,1,'liability_current','Salary Payable','230000',NULL,0,1,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(20,1,1,'liability_current','Employee Payroll Taxes','230100',NULL,0,1,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(21,1,1,'liability_current','Employer Payroll Taxes','230200',NULL,0,1,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(22,1,1,'liability_current','Tax Received','251000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(23,1,1,'liability_current','Tax Payable','252000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(24,1,1,'liability_non_current','Non-current Liabilities','291000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(25,1,1,'equity','Capital','301000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(26,1,1,'equity','Dividends','302000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(27,1,1,'income','Product Sales','400000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(28,1,1,'income','Foreign Exchange Gain','441000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(29,1,1,'income','Cash Difference Gain','442000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(30,1,1,'expense','Cash Discount Loss','443000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(31,1,1,'income_other','Other Income','450000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(32,1,1,'expense_direct_cost','Cost of Goods Sold','500000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(33,1,1,'expense','Expenses','600000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(34,1,1,'expense','Purchase of Equipments','611000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(35,1,1,'expense','Rent','612000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(36,1,1,'expense','Bank Fees','620000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(37,1,1,'expense','Salary Expenses','630000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(38,1,1,'expense','Foreign Exchange Loss','641000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(39,1,1,'expense','Cash Difference Loss','642000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(40,1,1,'income','Cash Discount Gain','643000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(41,1,1,'expense','RD Expenses','961000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(42,1,1,'expense','Sales Expenses','962000',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(43,1,1,'asset_receivable','Account Receivable (PoS)','101300',NULL,0,1,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(44,1,1,'liability_credit_card','Credit Card','201100',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(45,1,1,'asset_cash','Bank','101401',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(46,1,1,'asset_cash','Cash','101501',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(47,1,1,'asset_current','Bank Suspense Account','101402',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(48,1,1,'asset_current','Liquidity Transfer','101701',NULL,0,1,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(49,1,1,'asset_current','Outstanding Receipts','101403',NULL,0,1,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(50,1,1,'asset_current','Outstanding Payments','101404',NULL,0,1,0,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(51,1,1,'equity_unaffected','Undistributed Profits/Losses','999999',NULL,0,0,0,'2026-04-24 05:30:13','2026-04-24 05:30:13');
/*!40000 ALTER TABLE `accounts_accounts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_accounts_move_line_taxes`
--

DROP TABLE IF EXISTS `accounts_accounts_move_line_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_accounts_move_line_taxes` (
  `move_line_id` bigint(20) unsigned NOT NULL,
  `tax_id` bigint(20) unsigned NOT NULL,
  KEY `accounts_accounts_move_line_taxes_move_line_id_foreign` (`move_line_id`),
  KEY `accounts_accounts_move_line_taxes_tax_id_foreign` (`tax_id`),
  CONSTRAINT `accounts_accounts_move_line_taxes_move_line_id_foreign` FOREIGN KEY (`move_line_id`) REFERENCES `accounts_account_move_lines` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_accounts_move_line_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `accounts_taxes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_accounts_move_line_taxes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_accounts_move_line_taxes` WRITE;
/*!40000 ALTER TABLE `accounts_accounts_move_line_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_accounts_move_line_taxes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_accounts_move_payment`
--

DROP TABLE IF EXISTS `accounts_accounts_move_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_accounts_move_payment` (
  `invoice_id` bigint(20) unsigned NOT NULL COMMENT 'Invoice',
  `payment_id` bigint(20) unsigned NOT NULL COMMENT 'Payment',
  KEY `accounts_accounts_move_payment_invoice_id_foreign` (`invoice_id`),
  KEY `accounts_accounts_move_payment_payment_id_foreign` (`payment_id`),
  CONSTRAINT `accounts_accounts_move_payment_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `accounts_account_moves` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_accounts_move_payment_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `accounts_account_payments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_accounts_move_payment`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_accounts_move_payment` WRITE;
/*!40000 ALTER TABLE `accounts_accounts_move_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_accounts_move_payment` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_accounts_move_reversal_move`
--

DROP TABLE IF EXISTS `accounts_accounts_move_reversal_move`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_accounts_move_reversal_move` (
  `move_id` bigint(20) unsigned NOT NULL COMMENT 'Move',
  `reversal_id` bigint(20) unsigned NOT NULL COMMENT 'Reversal',
  KEY `accounts_accounts_move_reversal_move_move_id_foreign` (`move_id`),
  KEY `accounts_accounts_move_reversal_move_reversal_id_foreign` (`reversal_id`),
  CONSTRAINT `accounts_accounts_move_reversal_move_move_id_foreign` FOREIGN KEY (`move_id`) REFERENCES `accounts_account_moves` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_accounts_move_reversal_move_reversal_id_foreign` FOREIGN KEY (`reversal_id`) REFERENCES `accounts_accounts_move_reversals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_accounts_move_reversal_move`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_accounts_move_reversal_move` WRITE;
/*!40000 ALTER TABLE `accounts_accounts_move_reversal_move` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_accounts_move_reversal_move` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_accounts_move_reversal_new_move`
--

DROP TABLE IF EXISTS `accounts_accounts_move_reversal_new_move`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_accounts_move_reversal_new_move` (
  `new_move_id` bigint(20) unsigned NOT NULL COMMENT 'Move',
  `reversal_id` bigint(20) unsigned NOT NULL COMMENT 'Reversal',
  KEY `accounts_accounts_move_reversal_new_move_new_move_id_foreign` (`new_move_id`),
  KEY `accounts_accounts_move_reversal_new_move_reversal_id_foreign` (`reversal_id`),
  CONSTRAINT `accounts_accounts_move_reversal_new_move_new_move_id_foreign` FOREIGN KEY (`new_move_id`) REFERENCES `accounts_account_moves` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_accounts_move_reversal_new_move_reversal_id_foreign` FOREIGN KEY (`reversal_id`) REFERENCES `accounts_accounts_move_reversals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_accounts_move_reversal_new_move`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_accounts_move_reversal_new_move` WRITE;
/*!40000 ALTER TABLE `accounts_accounts_move_reversal_new_move` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_accounts_move_reversal_new_move` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_accounts_move_reversals`
--

DROP TABLE IF EXISTS `accounts_accounts_move_reversals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_accounts_move_reversals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL COMMENT 'Company',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Creator',
  `reason` text DEFAULT NULL COMMENT 'Reason displayed on Credit Note',
  `date` date NOT NULL COMMENT 'Date of Reversal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `journal_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_accounts_move_reversals_company_id_foreign` (`company_id`),
  KEY `accounts_accounts_move_reversals_creator_id_foreign` (`creator_id`),
  KEY `accounts_accounts_move_reversals_journal_id_foreign` (`journal_id`),
  CONSTRAINT `accounts_accounts_move_reversals_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_accounts_move_reversals_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_accounts_move_reversals_journal_id_foreign` FOREIGN KEY (`journal_id`) REFERENCES `accounts_journals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_accounts_move_reversals`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_accounts_move_reversals` WRITE;
/*!40000 ALTER TABLE `accounts_accounts_move_reversals` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_accounts_move_reversals` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_bank_statement_lines`
--

DROP TABLE IF EXISTS `accounts_bank_statement_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_bank_statement_lines` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort Order',
  `journal_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Journal',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `statement_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Bank Statement',
  `partner_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Partner',
  `move_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Journal Entry',
  `currency_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Currency',
  `foreign_currency_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Foreign Currency',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `account_number` varchar(255) DEFAULT NULL COMMENT 'Account Number',
  `partner_name` varchar(255) DEFAULT NULL COMMENT 'Partner Name',
  `transaction_type` varchar(255) DEFAULT NULL COMMENT 'Transaction Type',
  `payment_reference` varchar(255) DEFAULT NULL COMMENT 'Payment Reference',
  `internal_index` varchar(255) DEFAULT NULL COMMENT 'Internal Index',
  `transaction_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Transaction Details' CHECK (json_valid(`transaction_details`)),
  `amount` decimal(15,4) DEFAULT NULL COMMENT 'Amount',
  `amount_currency` decimal(15,4) DEFAULT NULL COMMENT 'Amount Currency',
  `is_reconciled` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Is Reconciled',
  `amount_residual` decimal(15,4) DEFAULT NULL COMMENT 'Amount Residual',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_bank_statement_lines_journal_id_foreign` (`journal_id`),
  KEY `accounts_bank_statement_lines_company_id_foreign` (`company_id`),
  KEY `accounts_bank_statement_lines_statement_id_foreign` (`statement_id`),
  KEY `accounts_bank_statement_lines_partner_id_foreign` (`partner_id`),
  KEY `accounts_bank_statement_lines_currency_id_foreign` (`currency_id`),
  KEY `accounts_bank_statement_lines_foreign_currency_id_foreign` (`foreign_currency_id`),
  KEY `accounts_bank_statement_lines_move_id_foreign` (`move_id`),
  KEY `accounts_bank_statement_lines_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_bank_statement_lines_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_bank_statement_lines_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_bank_statement_lines_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_bank_statement_lines_foreign_currency_id_foreign` FOREIGN KEY (`foreign_currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_bank_statement_lines_journal_id_foreign` FOREIGN KEY (`journal_id`) REFERENCES `accounts_journals` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_bank_statement_lines_move_id_foreign` FOREIGN KEY (`move_id`) REFERENCES `accounts_account_moves` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_bank_statement_lines_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners_partners` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_bank_statement_lines_statement_id_foreign` FOREIGN KEY (`statement_id`) REFERENCES `accounts_bank_statements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_bank_statement_lines`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_bank_statement_lines` WRITE;
/*!40000 ALTER TABLE `accounts_bank_statement_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_bank_statement_lines` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_bank_statements`
--

DROP TABLE IF EXISTS `accounts_bank_statements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_bank_statements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `journal_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT 'Reference',
  `reference` varchar(255) DEFAULT NULL COMMENT 'External Reference',
  `first_line_index` varchar(255) DEFAULT NULL COMMENT 'First Line Index',
  `date` date DEFAULT NULL COMMENT 'Date',
  `balance_start` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Starting Balance',
  `balance_end` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Ending Balance',
  `balance_end_real` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Real Ending Balance',
  `is_completed` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Is Completed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_bank_statements_company_id_foreign` (`company_id`),
  KEY `accounts_bank_statements_journal_id_foreign` (`journal_id`),
  KEY `accounts_bank_statements_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_bank_statements_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_bank_statements_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_bank_statements_journal_id_foreign` FOREIGN KEY (`journal_id`) REFERENCES `accounts_journals` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_bank_statements`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_bank_statements` WRITE;
/*!40000 ALTER TABLE `accounts_bank_statements` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_bank_statements` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_cash_roundings`
--

DROP TABLE IF EXISTS `accounts_cash_roundings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_cash_roundings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `strategy` varchar(255) NOT NULL COMMENT 'Rounding Strategy',
  `rounding_method` varchar(255) NOT NULL COMMENT 'Rounding Method',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `rounding` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Rounding',
  `profit_account_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Profit Account',
  `loss_account_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Loss Account',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_cash_roundings_creator_id_foreign` (`creator_id`),
  KEY `accounts_cash_roundings_profit_account_id_foreign` (`profit_account_id`),
  KEY `accounts_cash_roundings_loss_account_id_foreign` (`loss_account_id`),
  CONSTRAINT `accounts_cash_roundings_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_cash_roundings_loss_account_id_foreign` FOREIGN KEY (`loss_account_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_cash_roundings_profit_account_id_foreign` FOREIGN KEY (`profit_account_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cash_roundings`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_cash_roundings` WRITE;
/*!40000 ALTER TABLE `accounts_cash_roundings` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_cash_roundings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_fiscal_position_accounts`
--

DROP TABLE IF EXISTS `accounts_fiscal_position_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_fiscal_position_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fiscal_position_id` bigint(20) unsigned NOT NULL COMMENT 'Fiscal Position',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `account_source_id` bigint(20) unsigned NOT NULL COMMENT 'Account Source',
  `account_destination_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Account Destination',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Creator',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_fiscal_position_accounts_fiscal_position_id_foreign` (`fiscal_position_id`),
  KEY `accounts_fiscal_position_accounts_company_id_foreign` (`company_id`),
  KEY `accounts_fiscal_position_accounts_account_source_id_foreign` (`account_source_id`),
  KEY `accounts_fiscal_position_accounts_account_destination_id_foreign` (`account_destination_id`),
  KEY `accounts_fiscal_position_accounts_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_fiscal_position_accounts_account_destination_id_foreign` FOREIGN KEY (`account_destination_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_fiscal_position_accounts_account_source_id_foreign` FOREIGN KEY (`account_source_id`) REFERENCES `accounts_accounts` (`id`),
  CONSTRAINT `accounts_fiscal_position_accounts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_fiscal_position_accounts_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_fiscal_position_accounts_fiscal_position_id_foreign` FOREIGN KEY (`fiscal_position_id`) REFERENCES `accounts_fiscal_positions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_fiscal_position_accounts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_fiscal_position_accounts` WRITE;
/*!40000 ALTER TABLE `accounts_fiscal_position_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_fiscal_position_accounts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_fiscal_position_taxes`
--

DROP TABLE IF EXISTS `accounts_fiscal_position_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_fiscal_position_taxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fiscal_position_id` bigint(20) unsigned NOT NULL COMMENT 'Fiscal Position',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `tax_source_id` bigint(20) unsigned NOT NULL COMMENT 'Tax Source',
  `tax_destination_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Tax Destination',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Creator',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_fiscal_position_taxes_fiscal_position_id_foreign` (`fiscal_position_id`),
  KEY `accounts_fiscal_position_taxes_company_id_foreign` (`company_id`),
  KEY `accounts_fiscal_position_taxes_tax_source_id_foreign` (`tax_source_id`),
  KEY `accounts_fiscal_position_taxes_tax_destination_id_foreign` (`tax_destination_id`),
  KEY `accounts_fiscal_position_taxes_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_fiscal_position_taxes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_fiscal_position_taxes_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_fiscal_position_taxes_fiscal_position_id_foreign` FOREIGN KEY (`fiscal_position_id`) REFERENCES `accounts_fiscal_positions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_fiscal_position_taxes_tax_destination_id_foreign` FOREIGN KEY (`tax_destination_id`) REFERENCES `accounts_taxes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_fiscal_position_taxes_tax_source_id_foreign` FOREIGN KEY (`tax_source_id`) REFERENCES `accounts_taxes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_fiscal_position_taxes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_fiscal_position_taxes` WRITE;
/*!40000 ALTER TABLE `accounts_fiscal_position_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_fiscal_position_taxes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_fiscal_positions`
--

DROP TABLE IF EXISTS `accounts_fiscal_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_fiscal_positions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort Order',
  `company_id` bigint(20) unsigned NOT NULL COMMENT 'Company',
  `country_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Country',
  `country_group_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Country Group',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Creator',
  `zip_from` varchar(255) DEFAULT NULL COMMENT 'Zip From',
  `zip_to` varchar(255) DEFAULT NULL COMMENT 'Zip To',
  `foreign_vat` varchar(255) DEFAULT NULL COMMENT 'Foreign VAT',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `notes` text DEFAULT NULL COMMENT 'Notes',
  `auto_reply` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Auto Reply',
  `vat_required` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'VAT Required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_fiscal_positions_company_id_foreign` (`company_id`),
  KEY `accounts_fiscal_positions_country_id_foreign` (`country_id`),
  KEY `accounts_fiscal_positions_country_group_id_foreign` (`country_group_id`),
  KEY `accounts_fiscal_positions_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_fiscal_positions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `accounts_fiscal_positions_country_group_id_foreign` FOREIGN KEY (`country_group_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_fiscal_positions_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_fiscal_positions_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_fiscal_positions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_fiscal_positions` WRITE;
/*!40000 ALTER TABLE `accounts_fiscal_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_fiscal_positions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_full_reconciles`
--

DROP TABLE IF EXISTS `accounts_full_reconciles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_full_reconciles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exchange_move_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_full_reconciles_exchange_move_id_foreign` (`exchange_move_id`),
  KEY `accounts_full_reconciles_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_full_reconciles_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_full_reconciles_exchange_move_id_foreign` FOREIGN KEY (`exchange_move_id`) REFERENCES `accounts_account_moves` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_full_reconciles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_full_reconciles` WRITE;
/*!40000 ALTER TABLE `accounts_full_reconciles` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_full_reconciles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_incoterms`
--

DROP TABLE IF EXISTS `accounts_incoterms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_incoterms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Creator',
  `code` varchar(3) NOT NULL COMMENT 'Code',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_incoterms_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_incoterms_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_incoterms`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_incoterms` WRITE;
/*!40000 ALTER TABLE `accounts_incoterms` DISABLE KEYS */;
INSERT INTO `accounts_incoterms` VALUES
(23,1,'EXW','EX WORKS',NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(24,1,'FCA','FREE CARRIER',NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(25,1,'FAS','FREE ALONGSIDE SHIP',NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(26,1,'FOB','FREE ON BOARD',NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(27,1,'CFR','COST AND FREIGHT',NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(28,1,'CIF','COST, INSURANCE AND FREIGHT',NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(29,1,'CPT','CARRIAGE PAID TO',NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(30,1,'CIP','CARRIAGE AND INSURANCE PAID TO',NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(31,1,'DPU','DELIVERED AT PLACE UNLOADED',NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(32,1,'DAP','DELIVERED AT PLACE',NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(33,1,'DDP','DELIVERED DUTY PAID',NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13');
/*!40000 ALTER TABLE `accounts_incoterms` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_journal_accounts`
--

DROP TABLE IF EXISTS `accounts_journal_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_journal_accounts` (
  `journal_id` bigint(20) unsigned NOT NULL,
  `account_id` bigint(20) unsigned NOT NULL,
  KEY `accounts_journal_accounts_journal_id_foreign` (`journal_id`),
  KEY `accounts_journal_accounts_account_id_foreign` (`account_id`),
  CONSTRAINT `accounts_journal_accounts_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_journal_accounts_journal_id_foreign` FOREIGN KEY (`journal_id`) REFERENCES `accounts_journals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_journal_accounts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_journal_accounts` WRITE;
/*!40000 ALTER TABLE `accounts_journal_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_journal_accounts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_journals`
--

DROP TABLE IF EXISTS `accounts_journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_journals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `default_account_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Default Account',
  `suspense_account_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Suspense Account',
  `sort` int(11) DEFAULT NULL COMMENT 'Sort Order',
  `currency_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Currency',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `profit_account_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Profit Account',
  `loss_account_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Loss Account',
  `bank_account_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Bank Account',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Creator',
  `color` varchar(255) DEFAULT NULL COMMENT 'Color',
  `access_token` varchar(255) DEFAULT NULL COMMENT 'Access Token',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `type` varchar(255) NOT NULL COMMENT 'Type',
  `invoice_reference_type` varchar(255) NOT NULL COMMENT 'Communication Type',
  `invoice_reference_model` varchar(255) NOT NULL COMMENT 'Communication Standard',
  `bank_statements_source` varchar(255) DEFAULT NULL COMMENT 'Bank Statements Source',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `order_override_regex` text DEFAULT NULL COMMENT 'Sequence Override Regex',
  `auto_check_on_post` tinyint(1) DEFAULT 0 COMMENT 'Auto Check on Post',
  `restrict_mode_hash_table` tinyint(1) DEFAULT 0 COMMENT 'Restrict Mode Hash Table',
  `refund_order` tinyint(1) DEFAULT 0 COMMENT 'Refund Order',
  `payment_order` tinyint(1) DEFAULT 0 COMMENT 'Payment Order',
  `show_on_dashboard` tinyint(1) DEFAULT 0 COMMENT 'Show on Dashboard',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_journals_default_account_id_foreign` (`default_account_id`),
  KEY `accounts_journals_suspense_account_id_foreign` (`suspense_account_id`),
  KEY `accounts_journals_currency_id_foreign` (`currency_id`),
  KEY `accounts_journals_company_id_foreign` (`company_id`),
  KEY `accounts_journals_profit_account_id_foreign` (`profit_account_id`),
  KEY `accounts_journals_loss_account_id_foreign` (`loss_account_id`),
  KEY `accounts_journals_creator_id_foreign` (`creator_id`),
  KEY `accounts_journals_bank_account_id_foreign` (`bank_account_id`),
  CONSTRAINT `accounts_journals_bank_account_id_foreign` FOREIGN KEY (`bank_account_id`) REFERENCES `partners_bank_accounts` (`id`),
  CONSTRAINT `accounts_journals_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `accounts_journals_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_journals_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_journals_default_account_id_foreign` FOREIGN KEY (`default_account_id`) REFERENCES `accounts_accounts` (`id`),
  CONSTRAINT `accounts_journals_loss_account_id_foreign` FOREIGN KEY (`loss_account_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_journals_profit_account_id_foreign` FOREIGN KEY (`profit_account_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_journals_suspense_account_id_foreign` FOREIGN KEY (`suspense_account_id`) REFERENCES `accounts_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_journals`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_journals` WRITE;
/*!40000 ALTER TABLE `accounts_journals` DISABLE KEYS */;
INSERT INTO `accounts_journals` VALUES
(1,27,NULL,5,1,1,NULL,NULL,NULL,1,'11',NULL,'INV','sale','invoice','aureus',NULL,'Customer Invoices',NULL,1,0,1,0,1,NULL,NULL),
(2,33,NULL,6,1,1,NULL,NULL,NULL,1,'11',NULL,'BILL','purchase','invoice','aureus',NULL,'Vendor Bills',NULL,1,0,1,0,1,NULL,NULL),
(3,NULL,NULL,9,1,1,NULL,NULL,NULL,1,'0',NULL,'MISC','general','invoice','aureus',NULL,'Miscellaneous Operations',NULL,1,0,0,0,0,NULL,NULL),
(4,NULL,NULL,10,1,1,NULL,NULL,NULL,1,'0',NULL,'EXCH','general','invoice','aureus',NULL,'Exchange Difference',NULL,1,0,0,0,0,NULL,NULL),
(5,46,47,NULL,1,1,NULL,NULL,NULL,1,NULL,NULL,'BANK','bank','invoice','aureus',NULL,'Bank Transactions',NULL,1,0,0,0,1,NULL,NULL),
(6,NULL,NULL,NULL,1,1,NULL,NULL,NULL,1,NULL,NULL,'CASH','cash','invoice','aureus',NULL,'Cash Transactions',NULL,1,0,0,0,1,NULL,NULL);
/*!40000 ALTER TABLE `accounts_journals` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_partial_reconciles`
--

DROP TABLE IF EXISTS `accounts_partial_reconciles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_partial_reconciles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `debit_move_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Debit move',
  `credit_move_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Credit move',
  `full_reconcile_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Full Reconcile',
  `exchange_move_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Exchange Move',
  `debit_currency_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Debit Currency',
  `credit_currency_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Credit Currency',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `max_date` date DEFAULT NULL COMMENT 'Max Date',
  `amount` decimal(15,4) DEFAULT NULL COMMENT 'Amount',
  `debit_amount_currency` decimal(15,4) DEFAULT NULL COMMENT 'Debit Amount Currency',
  `credit_amount_currency` decimal(15,4) DEFAULT NULL COMMENT 'Credit Amount Currency',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_partial_reconciles_full_reconcile_id_foreign` (`full_reconcile_id`),
  KEY `accounts_partial_reconciles_exchange_move_id_foreign` (`exchange_move_id`),
  KEY `accounts_partial_reconciles_debit_currency_id_foreign` (`debit_currency_id`),
  KEY `accounts_partial_reconciles_credit_currency_id_foreign` (`credit_currency_id`),
  KEY `accounts_partial_reconciles_company_id_foreign` (`company_id`),
  KEY `accounts_partial_reconciles_creator_id_foreign` (`creator_id`),
  KEY `accounts_partial_reconciles_debit_move_id_foreign` (`debit_move_id`),
  KEY `accounts_partial_reconciles_credit_move_id_foreign` (`credit_move_id`),
  CONSTRAINT `accounts_partial_reconciles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_partial_reconciles_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_partial_reconciles_credit_currency_id_foreign` FOREIGN KEY (`credit_currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_partial_reconciles_credit_move_id_foreign` FOREIGN KEY (`credit_move_id`) REFERENCES `accounts_account_move_lines` (`id`),
  CONSTRAINT `accounts_partial_reconciles_debit_currency_id_foreign` FOREIGN KEY (`debit_currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_partial_reconciles_debit_move_id_foreign` FOREIGN KEY (`debit_move_id`) REFERENCES `accounts_account_move_lines` (`id`),
  CONSTRAINT `accounts_partial_reconciles_exchange_move_id_foreign` FOREIGN KEY (`exchange_move_id`) REFERENCES `accounts_account_moves` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_partial_reconciles_full_reconcile_id_foreign` FOREIGN KEY (`full_reconcile_id`) REFERENCES `accounts_full_reconciles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_partial_reconciles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_partial_reconciles` WRITE;
/*!40000 ALTER TABLE `accounts_partial_reconciles` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_partial_reconciles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_payment_due_terms`
--

DROP TABLE IF EXISTS `accounts_payment_due_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_payment_due_terms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nb_days` int(11) DEFAULT NULL COMMENT 'Number of Days',
  `payment_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Payment Terms',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Creator',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  `delay_type` varchar(255) NOT NULL COMMENT 'Delay Type',
  `days_next_month` varchar(255) DEFAULT NULL COMMENT 'Days Next Month',
  `value_amount` decimal(15,4) DEFAULT 0.0000 COMMENT 'Value Amount',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_payment_due_terms_payment_id_foreign` (`payment_id`),
  KEY `accounts_payment_due_terms_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_payment_due_terms_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_payment_due_terms_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `accounts_payment_terms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_payment_due_terms`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_payment_due_terms` WRITE;
/*!40000 ALTER TABLE `accounts_payment_due_terms` DISABLE KEYS */;
INSERT INTO `accounts_payment_due_terms` VALUES
(23,0,1,1,'percent','days_after','10',100.0000,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(24,15,2,1,'percent','days_after','10',100.0000,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(25,21,3,1,'percent','days_after','10',100.0000,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(26,30,4,1,'percent','days_after','10',100.0000,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(27,45,5,1,'percent','days_after','10',100.0000,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(28,0,6,1,'percent','days_after_end_of_next_month','10',30.0000,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(29,10,7,1,'percent','days_after_end_of_next_month','10',100.0000,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(30,0,8,1,'percent','days_after','10',30.0000,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(31,60,8,1,'percent','days_after','10',70.0000,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(32,30,9,1,'percent','days_after','10',100.0000,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(33,90,10,1,'percent','days_end_of_month_no_the','10',100.0000,'2026-04-24 05:30:13','2026-04-24 05:30:13');
/*!40000 ALTER TABLE `accounts_payment_due_terms` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_payment_method_lines`
--

DROP TABLE IF EXISTS `accounts_payment_method_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_payment_method_lines` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort order',
  `payment_method_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Payment Method',
  `payment_account_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Payment Account',
  `journal_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Journal',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Users',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_payment_method_lines_payment_method_id_foreign` (`payment_method_id`),
  KEY `accounts_payment_method_lines_payment_account_id_foreign` (`payment_account_id`),
  KEY `accounts_payment_method_lines_creator_id_foreign` (`creator_id`),
  KEY `accounts_payment_method_lines_journal_id_foreign` (`journal_id`),
  CONSTRAINT `accounts_payment_method_lines_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_payment_method_lines_journal_id_foreign` FOREIGN KEY (`journal_id`) REFERENCES `accounts_journals` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_payment_method_lines_payment_account_id_foreign` FOREIGN KEY (`payment_account_id`) REFERENCES `accounts_accounts` (`id`),
  CONSTRAINT `accounts_payment_method_lines_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `accounts_payment_methods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_payment_method_lines`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_payment_method_lines` WRITE;
/*!40000 ALTER TABLE `accounts_payment_method_lines` DISABLE KEYS */;
INSERT INTO `accounts_payment_method_lines` VALUES
(1,1,1,NULL,5,1,'Manual Payment','2026-04-24 05:30:13','2026-04-24 05:30:13'),
(2,2,2,NULL,5,1,'Manual Payment','2026-04-24 05:30:13','2026-04-24 05:30:13'),
(3,3,2,NULL,6,1,'Manual Payment','2026-04-24 05:30:13','2026-04-24 05:30:13'),
(4,4,1,NULL,6,1,'Manual Payment','2026-04-24 05:30:13','2026-04-24 05:30:13');
/*!40000 ALTER TABLE `accounts_payment_method_lines` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_payment_methods`
--

DROP TABLE IF EXISTS `accounts_payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_payment_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `payment_type` varchar(255) NOT NULL COMMENT 'Payment Type',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_payment_methods_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_payment_methods_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_payment_methods`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_payment_methods` WRITE;
/*!40000 ALTER TABLE `accounts_payment_methods` DISABLE KEYS */;
INSERT INTO `accounts_payment_methods` VALUES
(1,'manual','inbound','Manual Payment',1,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(2,'manual','outbound','Manual Payment',1,'2026-04-24 05:30:13','2026-04-24 05:30:13');
/*!40000 ALTER TABLE `accounts_payment_methods` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_payment_registers`
--

DROP TABLE IF EXISTS `accounts_payment_registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_payment_registers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Currency',
  `journal_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Journal',
  `partner_bank_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Bank Account',
  `custom_user_currency_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Custom User Currency',
  `source_currency_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Source Currency',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `partner_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Partner',
  `payment_method_line_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Payment Method Line',
  `writeoff_account_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Writeoff Account',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Users',
  `communication` varchar(255) DEFAULT NULL COMMENT 'Communication',
  `installments_mode` varchar(255) DEFAULT NULL COMMENT 'Installments Mode',
  `payment_type` varchar(255) DEFAULT NULL COMMENT 'Payment Type',
  `partner_type` varchar(255) DEFAULT NULL COMMENT 'Partner Type',
  `payment_difference_handling` varchar(255) DEFAULT NULL COMMENT 'Payment Difference Handling',
  `writeoff_label` varchar(255) DEFAULT NULL COMMENT 'Writeoff Label',
  `payment_date` date DEFAULT NULL COMMENT 'Payment Date',
  `amount` decimal(15,4) DEFAULT NULL COMMENT 'Amount',
  `custom_user_amount` decimal(15,4) DEFAULT NULL COMMENT 'Custom User Amount',
  `source_amount` decimal(15,4) DEFAULT NULL COMMENT 'Source Amount',
  `source_amount_currency` decimal(15,4) DEFAULT NULL COMMENT 'Source Amount Currency',
  `group_payment` tinyint(1) DEFAULT 0 COMMENT 'Group Payment',
  `can_group_payments` tinyint(1) DEFAULT 0 COMMENT 'Can Group Payments',
  `payment_token_id` int(11) DEFAULT NULL COMMENT 'Payment Token',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `receipt_attachment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_payment_registers_currency_id_foreign` (`currency_id`),
  KEY `accounts_payment_registers_journal_id_foreign` (`journal_id`),
  KEY `accounts_payment_registers_partner_bank_id_foreign` (`partner_bank_id`),
  KEY `accounts_payment_registers_custom_user_currency_id_foreign` (`custom_user_currency_id`),
  KEY `accounts_payment_registers_source_currency_id_foreign` (`source_currency_id`),
  KEY `accounts_payment_registers_company_id_foreign` (`company_id`),
  KEY `accounts_payment_registers_partner_id_foreign` (`partner_id`),
  KEY `accounts_payment_registers_payment_method_line_id_foreign` (`payment_method_line_id`),
  KEY `accounts_payment_registers_writeoff_account_id_foreign` (`writeoff_account_id`),
  KEY `accounts_payment_registers_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_payment_registers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_payment_registers_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_payment_registers_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_payment_registers_custom_user_currency_id_foreign` FOREIGN KEY (`custom_user_currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_payment_registers_journal_id_foreign` FOREIGN KEY (`journal_id`) REFERENCES `accounts_journals` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_payment_registers_partner_bank_id_foreign` FOREIGN KEY (`partner_bank_id`) REFERENCES `partners_bank_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_payment_registers_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners_partners` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_payment_registers_payment_method_line_id_foreign` FOREIGN KEY (`payment_method_line_id`) REFERENCES `accounts_payment_method_lines` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_payment_registers_source_currency_id_foreign` FOREIGN KEY (`source_currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_payment_registers_writeoff_account_id_foreign` FOREIGN KEY (`writeoff_account_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_payment_registers`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_payment_registers` WRITE;
/*!40000 ALTER TABLE `accounts_payment_registers` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_payment_registers` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_payment_terms`
--

DROP TABLE IF EXISTS `accounts_payment_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_payment_terms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `sort` int(11) DEFAULT NULL COMMENT 'Sort',
  `discount_days` int(11) DEFAULT NULL COMMENT 'Discount Days',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Creator',
  `early_pay_discount` varchar(255) DEFAULT NULL COMMENT 'Cash Discount Tax Reduction',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `note` text DEFAULT NULL COMMENT 'Note',
  `display_on_invoice` tinyint(1) DEFAULT 0 COMMENT 'Display on Invoice',
  `early_discount` tinyint(1) DEFAULT 0 COMMENT 'Early Discount',
  `discount_percentage` decimal(15,4) DEFAULT 0.0000 COMMENT 'Discount Percentage',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_payment_terms_company_id_foreign` (`company_id`),
  KEY `accounts_payment_terms_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_payment_terms_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_payment_terms_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_payment_terms`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_payment_terms` WRITE;
/*!40000 ALTER TABLE `accounts_payment_terms` DISABLE KEYS */;
INSERT INTO `accounts_payment_terms` VALUES
(1,1,1,10,1,'on_early_payment','Immediate Payment','<p>Payment terms: Immediate Payment</p>',1,0,2.0000,NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(2,1,2,10,1,'on_early_payment','15 Days','<p>Payment terms: 15 Days</p>',1,0,2.0000,NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(3,1,3,10,1,'on_early_payment','21 Days','<p>Payment terms: 21 Days</p>',1,0,2.0000,NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(4,1,4,10,1,'on_early_payment','30 Days','<p>Payment terms: 30 Days</p>',1,0,2.0000,NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(5,1,5,10,1,'on_early_payment','45 Days','<p>Payment terms: 45 Days</p>',1,0,2.0000,NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(6,1,6,10,1,'on_early_payment','End of Following Month','<p>Payment terms: End of Following Month</p>',1,0,2.0000,NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(7,1,7,10,1,'on_early_payment','10 Days after End of Next Month','<p>Payment terms: 10 Days after End of Next Month</p>',1,0,2.0000,NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(8,1,8,10,1,'on_early_payment','30% Now, Balance 60 Days','<p>Payment terms: 30% Now, Balance 60 Days</p>',1,0,2.0000,NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(9,1,9,7,1,'on_early_payment','2/7 Net 30','<p>Payment terms: 30 Days, 2% Early Payment Discount under 7 days</p>',1,1,2.0000,NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(10,1,10,10,1,'on_early_payment','90 Days, on the 10th','<p>Payment terms: 90 days, on the 10th</p>',1,0,2.0000,NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13');
/*!40000 ALTER TABLE `accounts_payment_terms` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_product_supplier_taxes`
--

DROP TABLE IF EXISTS `accounts_product_supplier_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_product_supplier_taxes` (
  `product_id` bigint(20) unsigned NOT NULL,
  `tax_id` bigint(20) unsigned NOT NULL,
  KEY `accounts_product_supplier_taxes_product_id_foreign` (`product_id`),
  KEY `accounts_product_supplier_taxes_tax_id_foreign` (`tax_id`),
  CONSTRAINT `accounts_product_supplier_taxes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_product_supplier_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `accounts_taxes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_product_supplier_taxes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_product_supplier_taxes` WRITE;
/*!40000 ALTER TABLE `accounts_product_supplier_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_product_supplier_taxes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_product_taxes`
--

DROP TABLE IF EXISTS `accounts_product_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_product_taxes` (
  `product_id` bigint(20) unsigned NOT NULL,
  `tax_id` bigint(20) unsigned NOT NULL,
  KEY `accounts_product_taxes_product_id_foreign` (`product_id`),
  KEY `accounts_product_taxes_tax_id_foreign` (`tax_id`),
  CONSTRAINT `accounts_product_taxes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_product_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `accounts_taxes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_product_taxes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_product_taxes` WRITE;
/*!40000 ALTER TABLE `accounts_product_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_product_taxes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_reconciles`
--

DROP TABLE IF EXISTS `accounts_reconciles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_reconciles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort Order',
  `company_id` bigint(20) unsigned NOT NULL COMMENT 'Company',
  `past_months_limit` int(11) DEFAULT NULL COMMENT 'Search Month Limit',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `rule_type` varchar(255) NOT NULL COMMENT 'Type',
  `matching_order` varchar(255) NOT NULL COMMENT 'Matching Order',
  `counter_part_type` varchar(255) DEFAULT NULL COMMENT 'Counter Part Type',
  `match_nature` varchar(255) DEFAULT NULL COMMENT 'Amount Type',
  `match_amount` varchar(255) DEFAULT NULL COMMENT 'Amount Condition',
  `match_label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `match_level_parameters` varchar(255) DEFAULT NULL COMMENT 'Level Parameters',
  `match_note` varchar(255) DEFAULT NULL COMMENT 'Note',
  `match_note_parameters` varchar(255) DEFAULT NULL COMMENT 'Note Parameters',
  `match_transaction_type` varchar(255) DEFAULT NULL COMMENT 'Transaction Type',
  `match_transaction_type_parameters` varchar(255) DEFAULT NULL COMMENT 'Transaction Type Parameters',
  `payment_tolerance_type` varchar(255) DEFAULT NULL COMMENT 'Payment Tolerance Type',
  `decimal_separator` varchar(255) DEFAULT NULL COMMENT 'Decimal Separator',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `auto_reconcile` tinyint(1) NOT NULL COMMENT 'Auto Validate',
  `to_check` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'To Check',
  `match_text_location_label` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Match Text Location Label',
  `match_text_location_note` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Match Text Location Note',
  `match_text_location_reference` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Match Text Location Reference',
  `match_same_currency` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Match Same Currency',
  `allow_payment_tolerance` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Allow Payment Tolerance',
  `match_partner` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Match Partner',
  `match_amount_min` decimal(15,4) DEFAULT NULL COMMENT 'Amount Min',
  `match_amount_max` decimal(15,4) DEFAULT NULL COMMENT 'Amount Max',
  `payment_tolerance_parameters` decimal(15,4) DEFAULT NULL COMMENT 'Payment Tolerance Parameters',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_reconciles_company_id_foreign` (`company_id`),
  KEY `accounts_reconciles_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_reconciles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `accounts_reconciles_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_reconciles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_reconciles` WRITE;
/*!40000 ALTER TABLE `accounts_reconciles` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_reconciles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_tax_groups`
--

DROP TABLE IF EXISTS `accounts_tax_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_tax_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort Order',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `country_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Country',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Creator',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `preceding_subtotal` varchar(255) DEFAULT NULL COMMENT 'Preceding Subtotal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_tax_groups_company_id_foreign` (`company_id`),
  KEY `accounts_tax_groups_country_id_foreign` (`country_id`),
  KEY `accounts_tax_groups_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_tax_groups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `accounts_tax_groups_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_tax_groups_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_tax_groups`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_tax_groups` WRITE;
/*!40000 ALTER TABLE `accounts_tax_groups` DISABLE KEYS */;
INSERT INTO `accounts_tax_groups` VALUES
(1,1,1,104,1,'Tax 15%',NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13');
/*!40000 ALTER TABLE `accounts_tax_groups` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_tax_partition_lines`
--

DROP TABLE IF EXISTS `accounts_tax_partition_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_tax_partition_lines` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Account',
  `tax_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Tax',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Creator',
  `sort` int(11) DEFAULT NULL COMMENT 'Sort Order',
  `repartition_type` varchar(255) NOT NULL COMMENT 'Repartition Type',
  `document_type` varchar(255) NOT NULL COMMENT 'Document Type',
  `use_in_tax_closing` varchar(255) DEFAULT NULL COMMENT 'Use in Tax Closing',
  `factor` decimal(15,4) DEFAULT 0.0000 COMMENT 'Factor',
  `factor_percent` decimal(8,2) DEFAULT 0.00 COMMENT 'Factor Percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_tax_partition_lines_account_id_foreign` (`account_id`),
  KEY `accounts_tax_partition_lines_tax_id_foreign` (`tax_id`),
  KEY `accounts_tax_partition_lines_company_id_foreign` (`company_id`),
  KEY `accounts_tax_partition_lines_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_tax_partition_lines_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_tax_partition_lines_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_tax_partition_lines_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_tax_partition_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `accounts_taxes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_tax_partition_lines`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_tax_partition_lines` WRITE;
/*!40000 ALTER TABLE `accounts_tax_partition_lines` DISABLE KEYS */;
INSERT INTO `accounts_tax_partition_lines` VALUES
(17,NULL,5,1,1,1,'base','invoice','0',1.0000,NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(18,22,5,1,1,2,'tax','invoice','1',1.0000,100.00,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(19,NULL,5,1,1,1,'base','refund','0',1.0000,NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(20,22,5,1,1,2,'tax','refund','1',1.0000,100.00,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(21,NULL,6,1,1,1,'base','invoice','0',1.0000,NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(22,10,6,1,1,2,'tax','invoice','1',1.0000,100.00,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(23,NULL,6,1,1,1,'base','refund','0',1.0000,NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(24,10,6,1,1,2,'tax','refund','1',1.0000,100.00,'2026-04-24 05:30:13','2026-04-24 05:30:13');
/*!40000 ALTER TABLE `accounts_tax_partition_lines` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_tax_taxes`
--

DROP TABLE IF EXISTS `accounts_tax_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_tax_taxes` (
  `parent_tax_id` bigint(20) unsigned NOT NULL,
  `child_tax_id` bigint(20) unsigned NOT NULL,
  KEY `accounts_tax_taxes_parent_tax_id_foreign` (`parent_tax_id`),
  KEY `accounts_tax_taxes_child_tax_id_foreign` (`child_tax_id`),
  CONSTRAINT `accounts_tax_taxes_child_tax_id_foreign` FOREIGN KEY (`child_tax_id`) REFERENCES `accounts_taxes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_tax_taxes_parent_tax_id_foreign` FOREIGN KEY (`parent_tax_id`) REFERENCES `accounts_taxes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_tax_taxes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_tax_taxes` WRITE;
/*!40000 ALTER TABLE `accounts_tax_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_tax_taxes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `accounts_taxes`
--

DROP TABLE IF EXISTS `accounts_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_taxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort Order',
  `company_id` bigint(20) unsigned NOT NULL COMMENT 'Company',
  `tax_group_id` bigint(20) unsigned NOT NULL COMMENT 'Tax Group',
  `cash_basis_transition_account_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Cash Basis Transition Account',
  `country_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Country',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Creator',
  `type_tax_use` varchar(255) NOT NULL COMMENT 'Tax Use',
  `tax_scope` varchar(255) DEFAULT NULL COMMENT 'Tax Scope',
  `formula` varchar(255) DEFAULT NULL COMMENT 'Formula',
  `amount_type` varchar(255) NOT NULL COMMENT 'Amount Type',
  `price_include_override` varchar(255) DEFAULT NULL COMMENT 'Price Include Override',
  `tax_exigibility` varchar(255) DEFAULT NULL COMMENT 'Tax Exigibility',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text DEFAULT NULL,
  `invoice_label` varchar(255) DEFAULT NULL COMMENT 'Invoice Label',
  `invoice_legal_notes` text DEFAULT NULL COMMENT 'Invoice Legal Notes',
  `amount` decimal(15,4) DEFAULT 0.0000 COMMENT 'Amount',
  `is_active` tinyint(1) DEFAULT 0 COMMENT 'Active',
  `include_base_amount` tinyint(1) DEFAULT 0 COMMENT 'Include Base Amount',
  `is_base_affected` tinyint(1) DEFAULT 0 COMMENT 'Base Affected',
  `analytic` tinyint(1) DEFAULT 0 COMMENT 'Analytic',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_taxes_company_id_foreign` (`company_id`),
  KEY `accounts_taxes_tax_group_id_foreign` (`tax_group_id`),
  KEY `accounts_taxes_cash_basis_transition_account_id_foreign` (`cash_basis_transition_account_id`),
  KEY `accounts_taxes_country_id_foreign` (`country_id`),
  KEY `accounts_taxes_creator_id_foreign` (`creator_id`),
  CONSTRAINT `accounts_taxes_cash_basis_transition_account_id_foreign` FOREIGN KEY (`cash_basis_transition_account_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_taxes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `accounts_taxes_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_taxes_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_taxes_tax_group_id_foreign` FOREIGN KEY (`tax_group_id`) REFERENCES `accounts_tax_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_taxes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accounts_taxes` WRITE;
/*!40000 ALTER TABLE `accounts_taxes` DISABLE KEYS */;
INSERT INTO `accounts_taxes` VALUES
(5,1,1,1,NULL,233,1,'sale',NULL,'price_unit * 0.10','percent',NULL,'on_invoice','15 %','<p>CESS 5%</p>','Tax 15 %',NULL,15.0000,1,1,0,NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13'),
(6,1,1,1,NULL,233,1,'purchase',NULL,'price_unit * 0.10','percent',NULL,'on_invoice','15 %',NULL,'Tax 15 %',NULL,15.0000,1,1,0,NULL,'2026-04-24 05:30:13','2026-04-24 05:30:13');
/*!40000 ALTER TABLE `accounts_taxes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `activity_plan_templates`
--

DROP TABLE IF EXISTS `activity_plan_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_plan_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort Order',
  `plan_id` bigint(20) unsigned NOT NULL COMMENT 'Plan ID',
  `activity_type_id` bigint(20) unsigned NOT NULL COMMENT 'Activity Type',
  `responsible_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Responsible',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `delay_count` int(11) DEFAULT NULL COMMENT 'Delay count',
  `delay_unit` varchar(255) NOT NULL COMMENT 'Delay unit',
  `delay_from` varchar(255) NOT NULL COMMENT 'Delay From',
  `summary` text DEFAULT NULL COMMENT 'Summary',
  `responsible_type` varchar(255) NOT NULL COMMENT 'Responsible Type',
  `note` text DEFAULT NULL COMMENT 'Note',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_plan_templates_plan_id_foreign` (`plan_id`),
  KEY `activity_plan_templates_activity_type_id_foreign` (`activity_type_id`),
  KEY `activity_plan_templates_responsible_id_foreign` (`responsible_id`),
  KEY `activity_plan_templates_creator_id_foreign` (`creator_id`),
  CONSTRAINT `activity_plan_templates_activity_type_id_foreign` FOREIGN KEY (`activity_type_id`) REFERENCES `activity_types` (`id`),
  CONSTRAINT `activity_plan_templates_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `activity_plan_templates_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `activity_plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `activity_plan_templates_responsible_id_foreign` FOREIGN KEY (`responsible_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_plan_templates`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `activity_plan_templates` WRITE;
/*!40000 ALTER TABLE `activity_plan_templates` DISABLE KEYS */;
INSERT INTO `activity_plan_templates` VALUES
(16,1,1,3,NULL,1,0,'days','before_plan_date','Organize knowledge transfer inside the team','manager','<p>Organize knowledge transfer inside the team</p>',NULL,NULL),
(17,2,1,3,NULL,1,0,'days','before_plan_date','Take Back HR Materials','manager','<p>Take Back HR Materials</p>',NULL,NULL),
(18,3,2,3,NULL,1,0,'days','before_plan_date','Setup IT Materials','manager','<p>Setup IT Materials</p>',NULL,NULL),
(19,4,2,3,NULL,1,0,'days','before_plan_date','Plan Training','manager','<p>Plan Training</p>',NULL,NULL),
(20,5,2,3,NULL,1,0,'days','before_plan_date','Training','manager','<p>Training</p>',NULL,NULL);
/*!40000 ALTER TABLE `activity_plan_templates` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `activity_plans`
--

DROP TABLE IF EXISTS `activity_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(255) DEFAULT NULL COMMENT 'Plugin name',
  `name` varchar(255) NOT NULL COMMENT 'Name of the plan',
  `is_active` tinyint(1) DEFAULT 0 COMMENT 'Status',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_plans_creator_id_foreign` (`creator_id`),
  KEY `activity_plans_company_id_foreign` (`company_id`),
  KEY `activity_plans_department_id_foreign` (`department_id`),
  CONSTRAINT `activity_plans_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `activity_plans_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `activity_plans_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `employees_departments` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_plans`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `activity_plans` WRITE;
/*!40000 ALTER TABLE `activity_plans` DISABLE KEYS */;
INSERT INTO `activity_plans` VALUES
(1,'employees','Offboarding',1,1,NULL,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25',NULL),
(2,'employees','Onboarding',1,1,NULL,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25',NULL);
/*!40000 ALTER TABLE `activity_plans` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `activity_type_suggestions`
--

DROP TABLE IF EXISTS `activity_type_suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_type_suggestions` (
  `activity_type_id` bigint(20) unsigned NOT NULL COMMENT 'The primary activity type',
  `suggested_activity_type_id` bigint(20) unsigned NOT NULL COMMENT 'The suggested activity type',
  KEY `activity_type_id` (`activity_type_id`),
  KEY `suggested_activity_type_id` (`suggested_activity_type_id`),
  CONSTRAINT `activity_type_id` FOREIGN KEY (`activity_type_id`) REFERENCES `activity_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `suggested_activity_type_id` FOREIGN KEY (`suggested_activity_type_id`) REFERENCES `activity_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_type_suggestions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `activity_type_suggestions` WRITE;
/*!40000 ALTER TABLE `activity_type_suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_type_suggestions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `activity_types`
--

DROP TABLE IF EXISTS `activity_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort order',
  `delay_count` int(11) DEFAULT NULL COMMENT 'Delay count',
  `delay_unit` varchar(255) NOT NULL COMMENT 'Delay unit',
  `delay_from` varchar(255) NOT NULL COMMENT 'Delay from',
  `icon` varchar(255) DEFAULT NULL COMMENT 'Icon',
  `decoration_type` varchar(255) DEFAULT NULL COMMENT 'Decoration type',
  `chaining_type` varchar(255) DEFAULT 'suggest' COMMENT 'Chaining type',
  `plugin` varchar(255) DEFAULT NULL COMMENT 'Plugin name',
  `category` varchar(255) DEFAULT NULL COMMENT 'Category',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `summary` text DEFAULT NULL COMMENT 'Summary',
  `default_note` text DEFAULT NULL COMMENT 'Default Note',
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Status',
  `keep_done` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Keep Done',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `default_user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Default User',
  `activity_plan_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Activity Plan',
  `triggered_next_type_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Triggered Next Type',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_types_activity_plan_id_foreign` (`activity_plan_id`),
  KEY `activity_types_creator_id_foreign` (`creator_id`),
  KEY `activity_types_default_user_id_foreign` (`default_user_id`),
  KEY `activity_types_triggered_next_type_id_foreign` (`triggered_next_type_id`),
  CONSTRAINT `activity_types_activity_plan_id_foreign` FOREIGN KEY (`activity_plan_id`) REFERENCES `activity_plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `activity_types_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `activity_types_default_user_id_foreign` FOREIGN KEY (`default_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `activity_types_triggered_next_type_id_foreign` FOREIGN KEY (`triggered_next_type_id`) REFERENCES `activity_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_types`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `activity_types` WRITE;
/*!40000 ALTER TABLE `activity_types` DISABLE KEYS */;
INSERT INTO `activity_types` VALUES
(1,1,1,'days','current_date','heroicon-c-arrow-up','alert','suggest','support','meeting','Meeting','Meeting',NULL,1,0,NULL,NULL,NULL,1,NULL,NULL,NULL),
(2,1,1,'days','current_date','heroicon-c-arrow-up','alert','suggest','support','default','Exception','Exception',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,1,1,'days','current_date','heroicon-c-arrow-up','alert','suggest','support','default','To-Do','To-Do',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,1,1,'days','current_date','heroicon-c-arrow-up','alert','suggest','support','upload_file','Call','Call',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `activity_types` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `analytic_records`
--

DROP TABLE IF EXISTS `analytic_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `analytic_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `unit_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `partner_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `task_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `analytic_records_user_id_foreign` (`user_id`),
  KEY `analytic_records_partner_id_foreign` (`partner_id`),
  KEY `analytic_records_company_id_foreign` (`company_id`),
  KEY `analytic_records_creator_id_foreign` (`creator_id`),
  KEY `analytic_records_project_id_foreign` (`project_id`),
  KEY `analytic_records_task_id_foreign` (`task_id`),
  CONSTRAINT `analytic_records_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `analytic_records_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `analytic_records_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners_partners` (`id`) ON DELETE SET NULL,
  CONSTRAINT `analytic_records_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects_projects` (`id`) ON DELETE SET NULL,
  CONSTRAINT `analytic_records_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `projects_tasks` (`id`) ON DELETE SET NULL,
  CONSTRAINT `analytic_records_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytic_records`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `analytic_records` WRITE;
/*!40000 ALTER TABLE `analytic_records` DISABLE KEYS */;
INSERT INTO `analytic_records` VALUES
(1,'projects','This Must be Done in Three Days','2026-04-30',0.0000,5.0000,NULL,7,1,NULL,'2026-04-27 09:00:35','2026-04-28 10:54:57',2,4);
/*!40000 ALTER TABLE `analytic_records` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) unsigned DEFAULT NULL,
  `document_user_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `audit_logs_document_id_foreign` (`document_id`),
  KEY `audit_logs_document_user_id_foreign` (`document_user_id`),
  KEY `audit_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `audit_logs_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE SET NULL,
  CONSTRAINT `audit_logs_document_user_id_foreign` FOREIGN KEY (`document_user_id`) REFERENCES `document_user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `audit_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `street1` varchar(255) DEFAULT NULL,
  `street2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banks_state_id_foreign` (`state_id`),
  KEY `banks_country_id_foreign` (`country_id`),
  KEY `banks_creator_id_foreign` (`creator_id`),
  CONSTRAINT `banks_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `banks_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`),
  CONSTRAINT `banks_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `blogs_categories`
--

DROP TABLE IF EXISTS `blogs_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sub_title` text DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogs_categories_slug_unique` (`slug`),
  KEY `blogs_categories_creator_id_foreign` (`creator_id`),
  CONSTRAINT `blogs_categories_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `blogs_categories` WRITE;
/*!40000 ALTER TABLE `blogs_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `blogs_post_tags`
--

DROP TABLE IF EXISTS `blogs_post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs_post_tags` (
  `tag_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  KEY `blogs_post_tags_tag_id_foreign` (`tag_id`),
  KEY `blogs_post_tags_post_id_foreign` (`post_id`),
  CONSTRAINT `blogs_post_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `blogs_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blogs_post_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `blogs_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs_post_tags`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `blogs_post_tags` WRITE;
/*!40000 ALTER TABLE `blogs_post_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs_post_tags` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `blogs_posts`
--

DROP TABLE IF EXISTS `blogs_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `sub_title` text DEFAULT NULL,
  `content` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `published_at` datetime DEFAULT NULL,
  `visits` int(11) NOT NULL DEFAULT 0,
  `meta_title` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `author_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `last_editor_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogs_posts_slug_unique` (`slug`),
  KEY `blogs_posts_author_id_foreign` (`author_id`),
  KEY `blogs_posts_creator_id_foreign` (`creator_id`),
  KEY `blogs_posts_last_editor_id_foreign` (`last_editor_id`),
  KEY `blogs_posts_category_id_foreign` (`category_id`),
  CONSTRAINT `blogs_posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `blogs_posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blogs_categories` (`id`),
  CONSTRAINT `blogs_posts_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `blogs_posts_last_editor_id_foreign` FOREIGN KEY (`last_editor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs_posts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `blogs_posts` WRITE;
/*!40000 ALTER TABLE `blogs_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs_posts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `blogs_tags`
--

DROP TABLE IF EXISTS `blogs_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogs_tags_name_unique` (`name`),
  KEY `blogs_tags_creator_id_foreign` (`creator_id`),
  CONSTRAINT `blogs_tags_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs_tags`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `blogs_tags` WRITE;
/*!40000 ALTER TABLE `blogs_tags` DISABLE KEYS */;
INSERT INTO `blogs_tags` VALUES
(1,'Derrick ','#121212',1,NULL,NULL,'2026-04-27 07:18:24','2026-04-27 07:18:24');
/*!40000 ALTER TABLE `blogs_tags` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES
('livewire-rate-limiter:b9f79235b92dbe38cbf5ada85ef36e3df0f92c3a','i:1;',1778225797),
('livewire-rate-limiter:b9f79235b92dbe38cbf5ada85ef36e3df0f92c3a:timer','i:1778225797;',1778225797),
('spatie.permission.cache','a:3:{s:5:\"alias\";a:5:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";s:1:\"j\";s:10:\"is_default\";}s:11:\"permissions\";a:1216:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:20:\"view_any_field_field\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:16:\"view_field_field\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:18:\"create_field_field\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:7;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:18:\"update_field_field\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:18:\"delete_field_field\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:22:\"delete_any_field_field\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:19:\"restore_field_field\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:23:\"restore_any_field_field\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:24:\"force_delete_field_field\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:28:\"force_delete_any_field_field\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:19:\"reorder_field_field\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:24:\"view_any_partner_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:20:\"view_partner_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:22:\"create_partner_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:22:\"update_partner_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:22:\"delete_partner_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:26:\"delete_any_partner_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:23:\"restore_partner_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:27:\"restore_any_partner_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:28:\"force_delete_partner_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:32:\"force_delete_any_partner_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:30:\"view_any_partner_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:26:\"view_partner_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:28:\"create_partner_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:28:\"update_partner_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:28:\"delete_partner_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:32:\"delete_any_partner_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:29:\"restore_partner_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:33:\"restore_any_partner_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:34:\"force_delete_partner_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:38:\"force_delete_any_partner_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:21:\"view_any_partner_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:17:\"view_partner_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:19:\"create_partner_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:19:\"update_partner_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:19:\"delete_partner_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:23:\"delete_any_partner_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:20:\"restore_partner_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:24:\"restore_any_partner_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:25:\"force_delete_partner_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:29:\"force_delete_any_partner_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:25:\"view_any_partner_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:21:\"view_partner_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:23:\"create_partner_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:23:\"update_partner_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:23:\"delete_partner_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:27:\"delete_any_partner_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:24:\"restore_partner_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:28:\"restore_any_partner_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:29:\"force_delete_partner_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:33:\"force_delete_any_partner_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:24:\"view_any_partner_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:20:\"view_partner_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:22:\"create_partner_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:22:\"update_partner_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:22:\"delete_partner_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:26:\"delete_any_partner_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:23:\"restore_partner_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:27:\"restore_any_partner_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:28:\"force_delete_partner_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:32:\"force_delete_any_partner_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:20:\"view_any_partner_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:16:\"view_partner_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:18:\"create_partner_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:18:\"update_partner_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:18:\"delete_partner_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:66;a:4:{s:1:\"a\";i:67;s:1:\"b\";s:22:\"delete_any_partner_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:67;a:4:{s:1:\"a\";i:68;s:1:\"b\";s:19:\"restore_partner_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:68;a:4:{s:1:\"a\";i:69;s:1:\"b\";s:23:\"restore_any_partner_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:69;a:4:{s:1:\"a\";i:70;s:1:\"b\";s:24:\"force_delete_partner_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:70;a:4:{s:1:\"a\";i:71;s:1:\"b\";s:28:\"force_delete_any_partner_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:71;a:4:{s:1:\"a\";i:72;s:1:\"b\";s:22:\"view_any_partner_title\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:72;a:4:{s:1:\"a\";i:73;s:1:\"b\";s:18:\"view_partner_title\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:73;a:4:{s:1:\"a\";i:74;s:1:\"b\";s:20:\"create_partner_title\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:74;a:4:{s:1:\"a\";i:75;s:1:\"b\";s:20:\"update_partner_title\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:75;a:4:{s:1:\"a\";i:76;s:1:\"b\";s:20:\"delete_partner_title\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:76;a:4:{s:1:\"a\";i:77;s:1:\"b\";s:24:\"delete_any_partner_title\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:77;a:4:{s:1:\"a\";i:78;s:1:\"b\";s:30:\"view_any_plugin_manager_plugin\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:78;a:4:{s:1:\"a\";i:79;s:1:\"b\";s:26:\"view_plugin_manager_plugin\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:79;a:4:{s:1:\"a\";i:80;s:1:\"b\";s:28:\"create_plugin_manager_plugin\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:80;a:4:{s:1:\"a\";i:81;s:1:\"b\";s:28:\"update_plugin_manager_plugin\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:81;a:4:{s:1:\"a\";i:82;s:1:\"b\";s:28:\"delete_plugin_manager_plugin\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:82;a:4:{s:1:\"a\";i:83;s:1:\"b\";s:32:\"delete_any_plugin_manager_plugin\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:83;a:4:{s:1:\"a\";i:84;s:1:\"b\";s:29:\"reorder_plugin_manager_plugin\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:84;a:4:{s:1:\"a\";i:85;s:1:\"b\";s:25:\"view_any_security_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:85;a:4:{s:1:\"a\";i:86;s:1:\"b\";s:21:\"view_security_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:86;a:4:{s:1:\"a\";i:87;s:1:\"b\";s:23:\"create_security_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:87;a:4:{s:1:\"a\";i:88;s:1:\"b\";s:23:\"update_security_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:88;a:4:{s:1:\"a\";i:89;s:1:\"b\";s:23:\"delete_security_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:89;a:4:{s:1:\"a\";i:90;s:1:\"b\";s:27:\"delete_any_security_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:90;a:4:{s:1:\"a\";i:91;s:1:\"b\";s:24:\"restore_security_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:91;a:4:{s:1:\"a\";i:92;s:1:\"b\";s:28:\"restore_any_security_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:92;a:4:{s:1:\"a\";i:93;s:1:\"b\";s:29:\"force_delete_security_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:93;a:4:{s:1:\"a\";i:94;s:1:\"b\";s:33:\"force_delete_any_security_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:94;a:4:{s:1:\"a\";i:95;s:1:\"b\";s:24:\"reorder_security_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:95;a:4:{s:1:\"a\";i:96;s:1:\"b\";s:13:\"view_any_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:96;a:4:{s:1:\"a\";i:97;s:1:\"b\";s:9:\"view_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:97;a:4:{s:1:\"a\";i:98;s:1:\"b\";s:11:\"create_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:98;a:4:{s:1:\"a\";i:99;s:1:\"b\";s:11:\"update_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:99;a:4:{s:1:\"a\";i:100;s:1:\"b\";s:11:\"delete_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:100;a:4:{s:1:\"a\";i:101;s:1:\"b\";s:15:\"delete_any_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:101;a:4:{s:1:\"a\";i:102;s:1:\"b\";s:22:\"view_any_security_team\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:102;a:4:{s:1:\"a\";i:103;s:1:\"b\";s:18:\"view_security_team\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:103;a:4:{s:1:\"a\";i:104;s:1:\"b\";s:20:\"create_security_team\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:104;a:4:{s:1:\"a\";i:105;s:1:\"b\";s:20:\"update_security_team\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:105;a:4:{s:1:\"a\";i:106;s:1:\"b\";s:20:\"delete_security_team\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:106;a:4:{s:1:\"a\";i:107;s:1:\"b\";s:24:\"delete_any_security_team\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:107;a:4:{s:1:\"a\";i:108;s:1:\"b\";s:22:\"view_any_security_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:108;a:4:{s:1:\"a\";i:109;s:1:\"b\";s:18:\"view_security_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:109;a:4:{s:1:\"a\";i:110;s:1:\"b\";s:20:\"create_security_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:110;a:4:{s:1:\"a\";i:111;s:1:\"b\";s:20:\"update_security_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:111;a:4:{s:1:\"a\";i:112;s:1:\"b\";s:20:\"delete_security_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:112;a:4:{s:1:\"a\";i:113;s:1:\"b\";s:24:\"delete_any_security_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:113;a:4:{s:1:\"a\";i:114;s:1:\"b\";s:21:\"restore_security_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:114;a:4:{s:1:\"a\";i:115;s:1:\"b\";s:25:\"restore_any_security_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:115;a:4:{s:1:\"a\";i:116;s:1:\"b\";s:26:\"force_delete_security_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:116;a:4:{s:1:\"a\";i:117;s:1:\"b\";s:30:\"force_delete_any_security_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:117;a:4:{s:1:\"a\";i:118;s:1:\"b\";s:31:\"view_any_support_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:118;a:4:{s:1:\"a\";i:119;s:1:\"b\";s:27:\"view_support_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:119;a:4:{s:1:\"a\";i:120;s:1:\"b\";s:29:\"create_support_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:120;a:4:{s:1:\"a\";i:121;s:1:\"b\";s:29:\"update_support_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:121;a:4:{s:1:\"a\";i:122;s:1:\"b\";s:29:\"delete_support_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:122;a:4:{s:1:\"a\";i:123;s:1:\"b\";s:33:\"delete_any_support_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:123;a:4:{s:1:\"a\";i:124;s:1:\"b\";s:30:\"restore_support_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:124;a:4:{s:1:\"a\";i:125;s:1:\"b\";s:34:\"restore_any_support_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:125;a:4:{s:1:\"a\";i:126;s:1:\"b\";s:35:\"force_delete_support_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:126;a:4:{s:1:\"a\";i:127;s:1:\"b\";s:39:\"force_delete_any_support_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:127;a:4:{s:1:\"a\";i:128;s:1:\"b\";s:30:\"reorder_support_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:128;a:4:{s:1:\"a\";i:129;s:1:\"b\";s:21:\"view_any_support_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:129;a:4:{s:1:\"a\";i:130;s:1:\"b\";s:17:\"view_support_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:130;a:4:{s:1:\"a\";i:131;s:1:\"b\";s:19:\"create_support_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:131;a:4:{s:1:\"a\";i:132;s:1:\"b\";s:19:\"update_support_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:132;a:4:{s:1:\"a\";i:133;s:1:\"b\";s:19:\"delete_support_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:133;a:4:{s:1:\"a\";i:134;s:1:\"b\";s:23:\"delete_any_support_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:134;a:4:{s:1:\"a\";i:135;s:1:\"b\";s:20:\"restore_support_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:135;a:4:{s:1:\"a\";i:136;s:1:\"b\";s:24:\"restore_any_support_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:136;a:4:{s:1:\"a\";i:137;s:1:\"b\";s:25:\"force_delete_support_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:137;a:4:{s:1:\"a\";i:138;s:1:\"b\";s:29:\"force_delete_any_support_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:138;a:4:{s:1:\"a\";i:139;s:1:\"b\";s:25:\"view_any_support_calendar\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:139;a:4:{s:1:\"a\";i:140;s:1:\"b\";s:21:\"view_support_calendar\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:140;a:4:{s:1:\"a\";i:141;s:1:\"b\";s:23:\"create_support_calendar\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:141;a:4:{s:1:\"a\";i:142;s:1:\"b\";s:23:\"update_support_calendar\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:142;a:4:{s:1:\"a\";i:143;s:1:\"b\";s:23:\"delete_support_calendar\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:143;a:4:{s:1:\"a\";i:144;s:1:\"b\";s:27:\"delete_any_support_calendar\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:144;a:4:{s:1:\"a\";i:145;s:1:\"b\";s:24:\"restore_support_calendar\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:145;a:4:{s:1:\"a\";i:146;s:1:\"b\";s:28:\"restore_any_support_calendar\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:146;a:4:{s:1:\"a\";i:147;s:1:\"b\";s:29:\"force_delete_support_calendar\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:147;a:4:{s:1:\"a\";i:148;s:1:\"b\";s:33:\"force_delete_any_support_calendar\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:148;a:4:{s:1:\"a\";i:149;s:1:\"b\";s:24:\"view_any_support_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:149;a:4:{s:1:\"a\";i:150;s:1:\"b\";s:20:\"view_support_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:150;a:4:{s:1:\"a\";i:151;s:1:\"b\";s:22:\"create_support_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:151;a:4:{s:1:\"a\";i:152;s:1:\"b\";s:22:\"update_support_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:152;a:4:{s:1:\"a\";i:153;s:1:\"b\";s:22:\"delete_support_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:153;a:4:{s:1:\"a\";i:154;s:1:\"b\";s:26:\"delete_any_support_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:154;a:4:{s:1:\"a\";i:155;s:1:\"b\";s:23:\"restore_support_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:155;a:4:{s:1:\"a\";i:156;s:1:\"b\";s:27:\"restore_any_support_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:156;a:4:{s:1:\"a\";i:157;s:1:\"b\";s:28:\"force_delete_support_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:157;a:4:{s:1:\"a\";i:158;s:1:\"b\";s:32:\"force_delete_any_support_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:158;a:4:{s:1:\"a\";i:159;s:1:\"b\";s:23:\"reorder_support_company\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:159;a:4:{s:1:\"a\";i:160;s:1:\"b\";s:24:\"view_any_support_country\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:160;a:4:{s:1:\"a\";i:161;s:1:\"b\";s:20:\"view_support_country\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:161;a:4:{s:1:\"a\";i:162;s:1:\"b\";s:22:\"create_support_country\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:162;a:4:{s:1:\"a\";i:163;s:1:\"b\";s:22:\"update_support_country\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:163;a:4:{s:1:\"a\";i:164;s:1:\"b\";s:22:\"delete_support_country\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:164;a:4:{s:1:\"a\";i:165;s:1:\"b\";s:26:\"delete_any_support_country\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:165;a:4:{s:1:\"a\";i:166;s:1:\"b\";s:25:\"view_any_support_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:166;a:4:{s:1:\"a\";i:167;s:1:\"b\";s:21:\"view_support_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:167;a:4:{s:1:\"a\";i:168;s:1:\"b\";s:23:\"create_support_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:168;a:4:{s:1:\"a\";i:169;s:1:\"b\";s:23:\"update_support_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:169;a:4:{s:1:\"a\";i:170;s:1:\"b\";s:23:\"delete_support_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:170;a:4:{s:1:\"a\";i:171;s:1:\"b\";s:27:\"delete_any_support_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:171;a:4:{s:1:\"a\";i:172;s:1:\"b\";s:22:\"view_any_support_state\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:172;a:4:{s:1:\"a\";i:173;s:1:\"b\";s:18:\"view_support_state\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:173;a:4:{s:1:\"a\";i:174;s:1:\"b\";s:20:\"create_support_state\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:174;a:4:{s:1:\"a\";i:175;s:1:\"b\";s:20:\"update_support_state\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:175;a:4:{s:1:\"a\";i:176;s:1:\"b\";s:20:\"delete_support_state\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:176;a:4:{s:1:\"a\";i:177;s:1:\"b\";s:24:\"delete_any_support_state\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:177;a:4:{s:1:\"a\";i:178;s:1:\"b\";s:34:\"view_any_support_u::o::m::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:178;a:4:{s:1:\"a\";i:179;s:1:\"b\";s:30:\"view_support_u::o::m::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:179;a:4:{s:1:\"a\";i:180;s:1:\"b\";s:32:\"create_support_u::o::m::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:180;a:4:{s:1:\"a\";i:181;s:1:\"b\";s:32:\"update_support_u::o::m::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:181;a:4:{s:1:\"a\";i:182;s:1:\"b\";s:32:\"delete_support_u::o::m::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:182;a:4:{s:1:\"a\";i:183;s:1:\"b\";s:36:\"delete_any_support_u::o::m::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:183;a:4:{s:1:\"a\";i:184;s:1:\"b\";s:29:\"page_security_manage_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:184;a:4:{s:1:\"a\";i:185;s:1:\"b\";s:29:\"page_security_manage_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:185;a:4:{s:1:\"a\";i:186;s:1:\"b\";s:26:\"page_security_manage_users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:186;a:4:{s:1:\"a\";i:187;s:1:\"b\";s:20:\"page_support_profile\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:187;a:4:{s:1:\"a\";i:188;s:1:\"b\";s:31:\"view_any_project_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:188;a:4:{s:1:\"a\";i:189;s:1:\"b\";s:27:\"view_project_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:189;a:4:{s:1:\"a\";i:190;s:1:\"b\";s:29:\"create_project_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:190;a:4:{s:1:\"a\";i:191;s:1:\"b\";s:29:\"update_project_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:191;a:4:{s:1:\"a\";i:192;s:1:\"b\";s:29:\"delete_project_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:192;a:4:{s:1:\"a\";i:193;s:1:\"b\";s:33:\"delete_any_project_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:193;a:4:{s:1:\"a\";i:194;s:1:\"b\";s:30:\"restore_project_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:194;a:4:{s:1:\"a\";i:195;s:1:\"b\";s:34:\"restore_any_project_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:195;a:4:{s:1:\"a\";i:196;s:1:\"b\";s:35:\"force_delete_project_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:196;a:4:{s:1:\"a\";i:197;s:1:\"b\";s:39:\"force_delete_any_project_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:197;a:4:{s:1:\"a\";i:198;s:1:\"b\";s:26:\"view_any_project_milestone\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:198;a:4:{s:1:\"a\";i:199;s:1:\"b\";s:22:\"view_project_milestone\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:199;a:4:{s:1:\"a\";i:200;s:1:\"b\";s:24:\"create_project_milestone\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:200;a:4:{s:1:\"a\";i:201;s:1:\"b\";s:24:\"update_project_milestone\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:201;a:4:{s:1:\"a\";i:202;s:1:\"b\";s:24:\"delete_project_milestone\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:202;a:4:{s:1:\"a\";i:203;s:1:\"b\";s:28:\"delete_any_project_milestone\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:203;a:4:{s:1:\"a\";i:204;s:1:\"b\";s:31:\"view_any_project_project::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:4;i:2;i:7;i:3;i:8;}}i:204;a:4:{s:1:\"a\";i:205;s:1:\"b\";s:27:\"view_project_project::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:4;i:2;i:7;}}i:205;a:4:{s:1:\"a\";i:206;s:1:\"b\";s:29:\"create_project_project::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:206;a:4:{s:1:\"a\";i:207;s:1:\"b\";s:29:\"update_project_project::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:4;}}i:207;a:4:{s:1:\"a\";i:208;s:1:\"b\";s:29:\"delete_project_project::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:208;a:4:{s:1:\"a\";i:209;s:1:\"b\";s:33:\"delete_any_project_project::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:209;a:4:{s:1:\"a\";i:210;s:1:\"b\";s:30:\"restore_project_project::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:210;a:4:{s:1:\"a\";i:211;s:1:\"b\";s:34:\"restore_any_project_project::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:211;a:4:{s:1:\"a\";i:212;s:1:\"b\";s:35:\"force_delete_project_project::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:212;a:4:{s:1:\"a\";i:213;s:1:\"b\";s:39:\"force_delete_any_project_project::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:213;a:4:{s:1:\"a\";i:214;s:1:\"b\";s:30:\"reorder_project_project::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:214;a:4:{s:1:\"a\";i:215;s:1:\"b\";s:20:\"view_any_project_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:215;a:4:{s:1:\"a\";i:216;s:1:\"b\";s:16:\"view_project_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:216;a:4:{s:1:\"a\";i:217;s:1:\"b\";s:18:\"create_project_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:217;a:4:{s:1:\"a\";i:218;s:1:\"b\";s:18:\"update_project_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:218;a:4:{s:1:\"a\";i:219;s:1:\"b\";s:18:\"delete_project_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:219;a:4:{s:1:\"a\";i:220;s:1:\"b\";s:22:\"delete_any_project_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:220;a:4:{s:1:\"a\";i:221;s:1:\"b\";s:19:\"restore_project_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:221;a:4:{s:1:\"a\";i:222;s:1:\"b\";s:23:\"restore_any_project_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:222;a:4:{s:1:\"a\";i:223;s:1:\"b\";s:24:\"force_delete_project_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:223;a:4:{s:1:\"a\";i:224;s:1:\"b\";s:28:\"force_delete_any_project_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:224;a:4:{s:1:\"a\";i:225;s:1:\"b\";s:28:\"view_any_project_task::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:225;a:4:{s:1:\"a\";i:226;s:1:\"b\";s:24:\"view_project_task::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:226;a:4:{s:1:\"a\";i:227;s:1:\"b\";s:26:\"create_project_task::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:227;a:4:{s:1:\"a\";i:228;s:1:\"b\";s:26:\"update_project_task::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:228;a:4:{s:1:\"a\";i:229;s:1:\"b\";s:26:\"delete_project_task::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:229;a:4:{s:1:\"a\";i:230;s:1:\"b\";s:30:\"delete_any_project_task::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:230;a:4:{s:1:\"a\";i:231;s:1:\"b\";s:27:\"restore_project_task::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:231;a:4:{s:1:\"a\";i:232;s:1:\"b\";s:31:\"restore_any_project_task::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:232;a:4:{s:1:\"a\";i:233;s:1:\"b\";s:32:\"force_delete_project_task::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:233;a:4:{s:1:\"a\";i:234;s:1:\"b\";s:36:\"force_delete_any_project_task::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:234;a:4:{s:1:\"a\";i:235;s:1:\"b\";s:27:\"reorder_project_task::stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:235;a:4:{s:1:\"a\";i:236;s:1:\"b\";s:24:\"view_any_project_project\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:236;a:4:{s:1:\"a\";i:237;s:1:\"b\";s:20:\"view_project_project\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:237;a:4:{s:1:\"a\";i:238;s:1:\"b\";s:22:\"create_project_project\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:238;a:4:{s:1:\"a\";i:239;s:1:\"b\";s:22:\"update_project_project\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:239;a:4:{s:1:\"a\";i:240;s:1:\"b\";s:22:\"delete_project_project\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:240;a:4:{s:1:\"a\";i:241;s:1:\"b\";s:26:\"delete_any_project_project\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:241;a:4:{s:1:\"a\";i:242;s:1:\"b\";s:23:\"restore_project_project\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:242;a:4:{s:1:\"a\";i:243;s:1:\"b\";s:27:\"restore_any_project_project\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:243;a:4:{s:1:\"a\";i:244;s:1:\"b\";s:28:\"force_delete_project_project\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:244;a:4:{s:1:\"a\";i:245;s:1:\"b\";s:32:\"force_delete_any_project_project\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:245;a:4:{s:1:\"a\";i:246;s:1:\"b\";s:23:\"reorder_project_project\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:246;a:4:{s:1:\"a\";i:247;s:1:\"b\";s:21:\"view_any_project_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:247;a:4:{s:1:\"a\";i:248;s:1:\"b\";s:17:\"view_project_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:248;a:4:{s:1:\"a\";i:249;s:1:\"b\";s:19:\"create_project_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:249;a:4:{s:1:\"a\";i:250;s:1:\"b\";s:19:\"update_project_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:250;a:4:{s:1:\"a\";i:251;s:1:\"b\";s:19:\"delete_project_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:251;a:4:{s:1:\"a\";i:252;s:1:\"b\";s:23:\"delete_any_project_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:252;a:4:{s:1:\"a\";i:253;s:1:\"b\";s:20:\"restore_project_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:253;a:4:{s:1:\"a\";i:254;s:1:\"b\";s:24:\"restore_any_project_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:254;a:4:{s:1:\"a\";i:255;s:1:\"b\";s:25:\"force_delete_project_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:255;a:4:{s:1:\"a\";i:256;s:1:\"b\";s:29:\"force_delete_any_project_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:256;a:4:{s:1:\"a\";i:257;s:1:\"b\";s:20:\"reorder_project_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:8;}}i:257;a:4:{s:1:\"a\";i:258;s:1:\"b\";s:22:\"page_project_dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:258;a:4:{s:1:\"a\";i:259;s:1:\"b\";s:25:\"page_project_manage_tasks\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:259;a:4:{s:1:\"a\";i:260;s:1:\"b\";s:24:\"page_project_manage_time\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:260;a:4:{s:1:\"a\";i:261;s:1:\"b\";s:36:\"widget_project_stats_overview_widget\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:261;a:4:{s:1:\"a\";i:262;s:1:\"b\";s:35:\"widget_project_top_assignees_widget\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:262;a:4:{s:1:\"a\";i:263;s:1:\"b\";s:34:\"widget_project_top_projects_widget\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:263;a:4:{s:1:\"a\";i:264;s:1:\"b\";s:34:\"widget_project_task_by_stage_chart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:264;a:4:{s:1:\"a\";i:265;s:1:\"b\";s:34:\"widget_project_task_by_state_chart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:265;a:4:{s:1:\"a\";i:266;s:1:\"b\";s:32:\"view_any_employee_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:7:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:6;i:5;i:7;i:6;i:8;}}i:266;a:4:{s:1:\"a\";i:267;s:1:\"b\";s:28:\"view_employee_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:267;a:4:{s:1:\"a\";i:268;s:1:\"b\";s:30:\"create_employee_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:6;i:3;i:7;}}i:268;a:4:{s:1:\"a\";i:269;s:1:\"b\";s:30:\"update_employee_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:6;i:4;i:7;}}i:269;a:4:{s:1:\"a\";i:270;s:1:\"b\";s:30:\"delete_employee_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:270;a:4:{s:1:\"a\";i:271;s:1:\"b\";s:34:\"delete_any_employee_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:271;a:4:{s:1:\"a\";i:272;s:1:\"b\";s:31:\"restore_employee_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:272;a:4:{s:1:\"a\";i:273;s:1:\"b\";s:35:\"restore_any_employee_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:273;a:4:{s:1:\"a\";i:274;s:1:\"b\";s:36:\"force_delete_employee_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:274;a:4:{s:1:\"a\";i:275;s:1:\"b\";s:40:\"force_delete_any_employee_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:275;a:4:{s:1:\"a\";i:276;s:1:\"b\";s:35:\"view_any_employee_departure::reason\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:6:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;i:4;i:7;i:5;i:8;}}i:276;a:4:{s:1:\"a\";i:277;s:1:\"b\";s:31:\"view_employee_departure::reason\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:277;a:4:{s:1:\"a\";i:278;s:1:\"b\";s:33:\"create_employee_departure::reason\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;}}i:278;a:4:{s:1:\"a\";i:279;s:1:\"b\";s:33:\"update_employee_departure::reason\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:6;i:3;i:7;}}i:279;a:4:{s:1:\"a\";i:280;s:1:\"b\";s:33:\"delete_employee_departure::reason\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:280;a:4:{s:1:\"a\";i:281;s:1:\"b\";s:37:\"delete_any_employee_departure::reason\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:281;a:4:{s:1:\"a\";i:282;s:1:\"b\";s:34:\"reorder_employee_departure::reason\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:282;a:4:{s:1:\"a\";i:283;s:1:\"b\";s:36:\"view_any_employee_employee::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:6:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:7;i:5;i:8;}}i:283;a:4:{s:1:\"a\";i:284;s:1:\"b\";s:32:\"view_employee_employee::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:284;a:4:{s:1:\"a\";i:285;s:1:\"b\";s:34:\"create_employee_employee::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:285;a:4:{s:1:\"a\";i:286;s:1:\"b\";s:34:\"update_employee_employee::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:5;}}i:286;a:4:{s:1:\"a\";i:287;s:1:\"b\";s:34:\"delete_employee_employee::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:287;a:4:{s:1:\"a\";i:288;s:1:\"b\";s:38:\"delete_any_employee_employee::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:288;a:4:{s:1:\"a\";i:289;s:1:\"b\";s:34:\"view_any_employee_employment::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:6:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;i:4;i:7;i:5;i:8;}}i:289;a:4:{s:1:\"a\";i:290;s:1:\"b\";s:30:\"view_employee_employment::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:290;a:4:{s:1:\"a\";i:291;s:1:\"b\";s:32:\"create_employee_employment::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:5;i:4;i:7;}}i:291;a:4:{s:1:\"a\";i:292;s:1:\"b\";s:32:\"update_employee_employment::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:292;a:4:{s:1:\"a\";i:293;s:1:\"b\";s:32:\"delete_employee_employment::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:293;a:4:{s:1:\"a\";i:294;s:1:\"b\";s:36:\"delete_any_employee_employment::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:294;a:4:{s:1:\"a\";i:295;s:1:\"b\";s:33:\"reorder_employee_employment::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:295;a:4:{s:1:\"a\";i:296;s:1:\"b\";s:31:\"view_any_employee_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:6:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:6;i:5;i:7;}}i:296;a:4:{s:1:\"a\";i:297;s:1:\"b\";s:27:\"view_employee_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:297;a:4:{s:1:\"a\";i:298;s:1:\"b\";s:29:\"create_employee_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:6;i:4;i:7;}}i:298;a:4:{s:1:\"a\";i:299;s:1:\"b\";s:29:\"update_employee_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:299;a:4:{s:1:\"a\";i:300;s:1:\"b\";s:29:\"delete_employee_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:300;a:4:{s:1:\"a\";i:301;s:1:\"b\";s:33:\"delete_any_employee_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:301;a:4:{s:1:\"a\";i:302;s:1:\"b\";s:30:\"restore_employee_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:302;a:4:{s:1:\"a\";i:303;s:1:\"b\";s:34:\"restore_any_employee_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:303;a:4:{s:1:\"a\";i:304;s:1:\"b\";s:35:\"force_delete_employee_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:304;a:4:{s:1:\"a\";i:305;s:1:\"b\";s:39:\"force_delete_any_employee_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:305;a:4:{s:1:\"a\";i:306;s:1:\"b\";s:30:\"reorder_employee_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:306;a:4:{s:1:\"a\";i:307;s:1:\"b\";s:29:\"view_any_employee_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:6:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:7;i:5;i:8;}}i:307;a:4:{s:1:\"a\";i:308;s:1:\"b\";s:25:\"view_employee_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:308;a:4:{s:1:\"a\";i:309;s:1:\"b\";s:27:\"create_employee_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:7;}}i:309;a:4:{s:1:\"a\";i:310;s:1:\"b\";s:27:\"update_employee_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:7;}}i:310;a:4:{s:1:\"a\";i:311;s:1:\"b\";s:27:\"delete_employee_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:311;a:4:{s:1:\"a\";i:312;s:1:\"b\";s:31:\"delete_any_employee_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:312;a:4:{s:1:\"a\";i:313;s:1:\"b\";s:28:\"restore_employee_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:313;a:4:{s:1:\"a\";i:314;s:1:\"b\";s:32:\"restore_any_employee_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:314;a:4:{s:1:\"a\";i:315;s:1:\"b\";s:33:\"force_delete_employee_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:315;a:4:{s:1:\"a\";i:316;s:1:\"b\";s:37:\"force_delete_any_employee_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:316;a:4:{s:1:\"a\";i:317;s:1:\"b\";s:32:\"view_any_employee_work::location\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:6:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;i:4;i:7;i:5;i:8;}}i:317;a:4:{s:1:\"a\";i:318;s:1:\"b\";s:28:\"view_employee_work::location\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:318;a:4:{s:1:\"a\";i:319;s:1:\"b\";s:30:\"create_employee_work::location\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:6:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:5;i:4;i:6;i:5;i:7;}}i:319;a:4:{s:1:\"a\";i:320;s:1:\"b\";s:30:\"update_employee_work::location\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:7;}}i:320;a:4:{s:1:\"a\";i:321;s:1:\"b\";s:30:\"delete_employee_work::location\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:321;a:4:{s:1:\"a\";i:322;s:1:\"b\";s:34:\"delete_any_employee_work::location\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:322;a:4:{s:1:\"a\";i:323;s:1:\"b\";s:31:\"restore_employee_work::location\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:323;a:4:{s:1:\"a\";i:324;s:1:\"b\";s:35:\"restore_any_employee_work::location\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:324;a:4:{s:1:\"a\";i:325;s:1:\"b\";s:36:\"force_delete_employee_work::location\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:325;a:4:{s:1:\"a\";i:326;s:1:\"b\";s:40:\"force_delete_any_employee_work::location\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:326;a:4:{s:1:\"a\";i:327;s:1:\"b\";s:33:\"view_any_employee_employee::skill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:7:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:6;i:5;i:7;i:6;i:8;}}i:327;a:4:{s:1:\"a\";i:328;s:1:\"b\";s:29:\"view_employee_employee::skill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:6;i:3;i:7;i:4;i:8;}}i:328;a:4:{s:1:\"a\";i:329;s:1:\"b\";s:31:\"create_employee_employee::skill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:6;i:4;i:7;}}i:329;a:4:{s:1:\"a\";i:330;s:1:\"b\";s:31:\"update_employee_employee::skill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;i:4;i:7;}}i:330;a:4:{s:1:\"a\";i:331;s:1:\"b\";s:31:\"delete_employee_employee::skill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:331;a:4:{s:1:\"a\";i:332;s:1:\"b\";s:35:\"delete_any_employee_employee::skill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:332;a:4:{s:1:\"a\";i:333;s:1:\"b\";s:32:\"restore_employee_employee::skill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:333;a:4:{s:1:\"a\";i:334;s:1:\"b\";s:36:\"restore_any_employee_employee::skill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:334;a:4:{s:1:\"a\";i:335;s:1:\"b\";s:37:\"force_delete_employee_employee::skill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:335;a:4:{s:1:\"a\";i:336;s:1:\"b\";s:41:\"force_delete_any_employee_employee::skill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:336;a:4:{s:1:\"a\";i:337;s:1:\"b\";s:28:\"view_any_employee_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:7;i:3;i:8;}}i:337;a:4:{s:1:\"a\";i:338;s:1:\"b\";s:24:\"view_employee_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:338;a:4:{s:1:\"a\";i:339;s:1:\"b\";s:26:\"create_employee_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:5;i:4;i:7;}}i:339;a:4:{s:1:\"a\";i:340;s:1:\"b\";s:26:\"update_employee_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:340;a:4:{s:1:\"a\";i:341;s:1:\"b\";s:26:\"delete_employee_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:341;a:4:{s:1:\"a\";i:342;s:1:\"b\";s:30:\"delete_any_employee_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:342;a:4:{s:1:\"a\";i:343;s:1:\"b\";s:27:\"restore_employee_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:343;a:4:{s:1:\"a\";i:344;s:1:\"b\";s:31:\"restore_any_employee_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:344;a:4:{s:1:\"a\";i:345;s:1:\"b\";s:32:\"force_delete_employee_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:345;a:4:{s:1:\"a\";i:346;s:1:\"b\";s:36:\"force_delete_any_employee_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:346;a:4:{s:1:\"a\";i:347;s:1:\"b\";s:26:\"view_any_employee_employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:347;a:4:{s:1:\"a\";i:348;s:1:\"b\";s:22:\"view_employee_employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:7;i:3;i:8;}}i:348;a:4:{s:1:\"a\";i:349;s:1:\"b\";s:24:\"create_employee_employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:349;a:4:{s:1:\"a\";i:350;s:1:\"b\";s:24:\"update_employee_employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:350;a:4:{s:1:\"a\";i:351;s:1:\"b\";s:24:\"delete_employee_employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:351;a:4:{s:1:\"a\";i:352;s:1:\"b\";s:28:\"delete_any_employee_employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:352;a:4:{s:1:\"a\";i:353;s:1:\"b\";s:25:\"restore_employee_employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:353;a:4:{s:1:\"a\";i:354;s:1:\"b\";s:29:\"restore_any_employee_employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:354;a:4:{s:1:\"a\";i:355;s:1:\"b\";s:30:\"force_delete_employee_employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:355;a:4:{s:1:\"a\";i:356;s:1:\"b\";s:34:\"force_delete_any_employee_employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:356;a:4:{s:1:\"a\";i:357;s:1:\"b\";s:30:\"view_any_contact_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:357;a:4:{s:1:\"a\";i:358;s:1:\"b\";s:26:\"view_contact_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:358;a:4:{s:1:\"a\";i:359;s:1:\"b\";s:28:\"create_contact_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:359;a:4:{s:1:\"a\";i:360;s:1:\"b\";s:28:\"update_contact_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:360;a:4:{s:1:\"a\";i:361;s:1:\"b\";s:28:\"delete_contact_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:361;a:4:{s:1:\"a\";i:362;s:1:\"b\";s:32:\"delete_any_contact_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:362;a:4:{s:1:\"a\";i:363;s:1:\"b\";s:29:\"restore_contact_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:363;a:4:{s:1:\"a\";i:364;s:1:\"b\";s:33:\"restore_any_contact_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:364;a:4:{s:1:\"a\";i:365;s:1:\"b\";s:34:\"force_delete_contact_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:365;a:4:{s:1:\"a\";i:366;s:1:\"b\";s:38:\"force_delete_any_contact_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:366;a:4:{s:1:\"a\";i:367;s:1:\"b\";s:21:\"view_any_contact_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:367;a:4:{s:1:\"a\";i:368;s:1:\"b\";s:17:\"view_contact_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:368;a:4:{s:1:\"a\";i:369;s:1:\"b\";s:19:\"create_contact_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:369;a:4:{s:1:\"a\";i:370;s:1:\"b\";s:19:\"update_contact_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:370;a:4:{s:1:\"a\";i:371;s:1:\"b\";s:19:\"delete_contact_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:371;a:4:{s:1:\"a\";i:372;s:1:\"b\";s:23:\"delete_any_contact_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:372;a:4:{s:1:\"a\";i:373;s:1:\"b\";s:20:\"restore_contact_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:373;a:4:{s:1:\"a\";i:374;s:1:\"b\";s:24:\"restore_any_contact_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:374;a:4:{s:1:\"a\";i:375;s:1:\"b\";s:25:\"force_delete_contact_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:375;a:4:{s:1:\"a\";i:376;s:1:\"b\";s:29:\"force_delete_any_contact_bank\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:376;a:4:{s:1:\"a\";i:377;s:1:\"b\";s:25:\"view_any_contact_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;i:4;i:7;}}i:377;a:4:{s:1:\"a\";i:378;s:1:\"b\";s:21:\"view_contact_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:378;a:4:{s:1:\"a\";i:379;s:1:\"b\";s:23:\"create_contact_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:6;i:3;i:7;}}i:379;a:4:{s:1:\"a\";i:380;s:1:\"b\";s:23:\"update_contact_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:380;a:4:{s:1:\"a\";i:381;s:1:\"b\";s:23:\"delete_contact_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:381;a:4:{s:1:\"a\";i:382;s:1:\"b\";s:27:\"delete_any_contact_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:382;a:4:{s:1:\"a\";i:383;s:1:\"b\";s:24:\"restore_contact_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:383;a:4:{s:1:\"a\";i:384;s:1:\"b\";s:28:\"restore_any_contact_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:384;a:4:{s:1:\"a\";i:385;s:1:\"b\";s:29:\"force_delete_contact_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:385;a:4:{s:1:\"a\";i:386;s:1:\"b\";s:33:\"force_delete_any_contact_industry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:386;a:4:{s:1:\"a\";i:387;s:1:\"b\";s:20:\"view_any_contact_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:7;}}i:387;a:4:{s:1:\"a\";i:388;s:1:\"b\";s:16:\"view_contact_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:6;i:3;i:7;}}i:388;a:4:{s:1:\"a\";i:389;s:1:\"b\";s:18:\"create_contact_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;i:4;i:7;}}i:389;a:4:{s:1:\"a\";i:390;s:1:\"b\";s:18:\"update_contact_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:6;i:3;i:7;}}i:390;a:4:{s:1:\"a\";i:391;s:1:\"b\";s:18:\"delete_contact_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:5;}}i:391;a:4:{s:1:\"a\";i:392;s:1:\"b\";s:22:\"delete_any_contact_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:392;a:4:{s:1:\"a\";i:393;s:1:\"b\";s:19:\"restore_contact_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:393;a:4:{s:1:\"a\";i:394;s:1:\"b\";s:23:\"restore_any_contact_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:394;a:4:{s:1:\"a\";i:395;s:1:\"b\";s:24:\"force_delete_contact_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:395;a:4:{s:1:\"a\";i:396;s:1:\"b\";s:28:\"force_delete_any_contact_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:396;a:4:{s:1:\"a\";i:397;s:1:\"b\";s:22:\"view_any_contact_title\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;i:4;i:7;}}i:397;a:4:{s:1:\"a\";i:398;s:1:\"b\";s:18:\"view_contact_title\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:6;i:3;i:7;}}i:398;a:4:{s:1:\"a\";i:399;s:1:\"b\";s:20:\"create_contact_title\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:399;a:4:{s:1:\"a\";i:400;s:1:\"b\";s:20:\"update_contact_title\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:400;a:4:{s:1:\"a\";i:401;s:1:\"b\";s:20:\"delete_contact_title\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:401;a:4:{s:1:\"a\";i:402;s:1:\"b\";s:24:\"delete_any_contact_title\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:402;a:4:{s:1:\"a\";i:403;s:1:\"b\";s:24:\"view_any_contact_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;i:4;i:7;}}i:403;a:4:{s:1:\"a\";i:404;s:1:\"b\";s:20:\"view_contact_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:6;i:3;i:7;}}i:404;a:4:{s:1:\"a\";i:405;s:1:\"b\";s:22:\"create_contact_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;}}i:405;a:4:{s:1:\"a\";i:406;s:1:\"b\";s:22:\"update_contact_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;}}i:406;a:4:{s:1:\"a\";i:407;s:1:\"b\";s:22:\"delete_contact_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:407;a:4:{s:1:\"a\";i:408;s:1:\"b\";s:26:\"delete_any_contact_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:408;a:4:{s:1:\"a\";i:409;s:1:\"b\";s:23:\"restore_contact_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:409;a:4:{s:1:\"a\";i:410;s:1:\"b\";s:27:\"restore_any_contact_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:410;a:4:{s:1:\"a\";i:411;s:1:\"b\";s:28:\"force_delete_contact_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:411;a:4:{s:1:\"a\";i:412;s:1:\"b\";s:32:\"force_delete_any_contact_address\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:412;a:4:{s:1:\"a\";i:413;s:1:\"b\";s:24:\"view_any_contact_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;i:4;i:7;}}i:413;a:4:{s:1:\"a\";i:414;s:1:\"b\";s:20:\"view_contact_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;i:4;i:7;}}i:414;a:4:{s:1:\"a\";i:415;s:1:\"b\";s:22:\"create_contact_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:6;i:3;i:7;}}i:415;a:4:{s:1:\"a\";i:416;s:1:\"b\";s:22:\"update_contact_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:6;i:3;i:7;}}i:416;a:4:{s:1:\"a\";i:417;s:1:\"b\";s:22:\"delete_contact_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:417;a:4:{s:1:\"a\";i:418;s:1:\"b\";s:26:\"delete_any_contact_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:418;a:4:{s:1:\"a\";i:419;s:1:\"b\";s:23:\"restore_contact_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:419;a:4:{s:1:\"a\";i:420;s:1:\"b\";s:27:\"restore_any_contact_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:420;a:4:{s:1:\"a\";i:421;s:1:\"b\";s:28:\"force_delete_contact_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:421;a:4:{s:1:\"a\";i:422;s:1:\"b\";s:32:\"force_delete_any_contact_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:422;a:4:{s:1:\"a\";i:423;s:1:\"b\";s:21:\"view_any_website_page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:423;a:4:{s:1:\"a\";i:424;s:1:\"b\";s:17:\"view_website_page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:424;a:4:{s:1:\"a\";i:425;s:1:\"b\";s:19:\"create_website_page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:425;a:4:{s:1:\"a\";i:426;s:1:\"b\";s:19:\"update_website_page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:426;a:4:{s:1:\"a\";i:427;s:1:\"b\";s:19:\"delete_website_page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:427;a:4:{s:1:\"a\";i:428;s:1:\"b\";s:23:\"delete_any_website_page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:428;a:4:{s:1:\"a\";i:429;s:1:\"b\";s:20:\"restore_website_page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:429;a:4:{s:1:\"a\";i:430;s:1:\"b\";s:24:\"restore_any_website_page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:430;a:4:{s:1:\"a\";i:431;s:1:\"b\";s:25:\"force_delete_website_page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:431;a:4:{s:1:\"a\";i:432;s:1:\"b\";s:29:\"force_delete_any_website_page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:432;a:4:{s:1:\"a\";i:433;s:1:\"b\";s:24:\"view_any_website_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:433;a:4:{s:1:\"a\";i:434;s:1:\"b\";s:20:\"view_website_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:434;a:4:{s:1:\"a\";i:435;s:1:\"b\";s:22:\"create_website_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:435;a:4:{s:1:\"a\";i:436;s:1:\"b\";s:22:\"update_website_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:436;a:4:{s:1:\"a\";i:437;s:1:\"b\";s:22:\"delete_website_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:437;a:4:{s:1:\"a\";i:438;s:1:\"b\";s:26:\"delete_any_website_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:438;a:4:{s:1:\"a\";i:439;s:1:\"b\";s:23:\"restore_website_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:439;a:4:{s:1:\"a\";i:440;s:1:\"b\";s:27:\"restore_any_website_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:440;a:4:{s:1:\"a\";i:441;s:1:\"b\";s:28:\"force_delete_website_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:441;a:4:{s:1:\"a\";i:442;s:1:\"b\";s:32:\"force_delete_any_website_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:442;a:4:{s:1:\"a\";i:443;s:1:\"b\";s:30:\"page_website_website_dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:443;a:4:{s:1:\"a\";i:444;s:1:\"b\";s:28:\"page_website_manage_contacts\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:444;a:4:{s:1:\"a\";i:445;s:1:\"b\";s:26:\"view_any_product_attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:445;a:4:{s:1:\"a\";i:446;s:1:\"b\";s:22:\"view_product_attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:446;a:4:{s:1:\"a\";i:447;s:1:\"b\";s:24:\"create_product_attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:447;a:4:{s:1:\"a\";i:448;s:1:\"b\";s:24:\"update_product_attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:448;a:4:{s:1:\"a\";i:449;s:1:\"b\";s:24:\"delete_product_attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:449;a:4:{s:1:\"a\";i:450;s:1:\"b\";s:28:\"delete_any_product_attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:450;a:4:{s:1:\"a\";i:451;s:1:\"b\";s:25:\"restore_product_attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:451;a:4:{s:1:\"a\";i:452;s:1:\"b\";s:29:\"restore_any_product_attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:452;a:4:{s:1:\"a\";i:453;s:1:\"b\";s:30:\"force_delete_product_attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:453;a:4:{s:1:\"a\";i:454;s:1:\"b\";s:34:\"force_delete_any_product_attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:454;a:4:{s:1:\"a\";i:455;s:1:\"b\";s:25:\"reorder_product_attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:455;a:4:{s:1:\"a\";i:456;s:1:\"b\";s:25:\"view_any_product_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:456;a:4:{s:1:\"a\";i:457;s:1:\"b\";s:21:\"view_product_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:457;a:4:{s:1:\"a\";i:458;s:1:\"b\";s:23:\"create_product_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:458;a:4:{s:1:\"a\";i:459;s:1:\"b\";s:23:\"update_product_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:459;a:4:{s:1:\"a\";i:460;s:1:\"b\";s:23:\"delete_product_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:460;a:4:{s:1:\"a\";i:461;s:1:\"b\";s:27:\"delete_any_product_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:461;a:4:{s:1:\"a\";i:462;s:1:\"b\";s:26:\"view_any_product_packaging\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:462;a:4:{s:1:\"a\";i:463;s:1:\"b\";s:22:\"view_product_packaging\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:463;a:4:{s:1:\"a\";i:464;s:1:\"b\";s:24:\"create_product_packaging\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:464;a:4:{s:1:\"a\";i:465;s:1:\"b\";s:24:\"update_product_packaging\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:465;a:4:{s:1:\"a\";i:466;s:1:\"b\";s:24:\"delete_product_packaging\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:466;a:4:{s:1:\"a\";i:467;s:1:\"b\";s:28:\"delete_any_product_packaging\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:467;a:4:{s:1:\"a\";i:468;s:1:\"b\";s:25:\"reorder_product_packaging\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:468;a:4:{s:1:\"a\";i:469;s:1:\"b\";s:28:\"view_any_product_price::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:469;a:4:{s:1:\"a\";i:470;s:1:\"b\";s:24:\"view_product_price::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:470;a:4:{s:1:\"a\";i:471;s:1:\"b\";s:26:\"create_product_price::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:471;a:4:{s:1:\"a\";i:472;s:1:\"b\";s:26:\"update_product_price::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:472;a:4:{s:1:\"a\";i:473;s:1:\"b\";s:26:\"delete_product_price::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:473;a:4:{s:1:\"a\";i:474;s:1:\"b\";s:30:\"delete_any_product_price::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:474;a:4:{s:1:\"a\";i:475;s:1:\"b\";s:27:\"reorder_product_price::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:475;a:4:{s:1:\"a\";i:476;s:1:\"b\";s:24:\"view_any_product_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:476;a:4:{s:1:\"a\";i:477;s:1:\"b\";s:20:\"view_product_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:477;a:4:{s:1:\"a\";i:478;s:1:\"b\";s:22:\"create_product_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:478;a:4:{s:1:\"a\";i:479;s:1:\"b\";s:22:\"update_product_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:479;a:4:{s:1:\"a\";i:480;s:1:\"b\";s:22:\"delete_product_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:480;a:4:{s:1:\"a\";i:481;s:1:\"b\";s:26:\"delete_any_product_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:481;a:4:{s:1:\"a\";i:482;s:1:\"b\";s:23:\"restore_product_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:482;a:4:{s:1:\"a\";i:483;s:1:\"b\";s:27:\"restore_any_product_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:483;a:4:{s:1:\"a\";i:484;s:1:\"b\";s:28:\"force_delete_product_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:484;a:4:{s:1:\"a\";i:485;s:1:\"b\";s:32:\"force_delete_any_product_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:485;a:4:{s:1:\"a\";i:486;s:1:\"b\";s:23:\"reorder_product_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:486;a:4:{s:1:\"a\";i:487;s:1:\"b\";s:24:\"view_any_account_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:487;a:4:{s:1:\"a\";i:488;s:1:\"b\";s:20:\"view_account_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:488;a:4:{s:1:\"a\";i:489;s:1:\"b\";s:22:\"create_account_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:489;a:4:{s:1:\"a\";i:490;s:1:\"b\";s:22:\"update_account_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:490;a:4:{s:1:\"a\";i:491;s:1:\"b\";s:22:\"delete_account_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:491;a:4:{s:1:\"a\";i:492;s:1:\"b\";s:26:\"delete_any_account_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:492;a:4:{s:1:\"a\";i:493;s:1:\"b\";s:29:\"view_any_account_account::tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:493;a:4:{s:1:\"a\";i:494;s:1:\"b\";s:25:\"view_account_account::tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:494;a:4:{s:1:\"a\";i:495;s:1:\"b\";s:27:\"create_account_account::tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:495;a:4:{s:1:\"a\";i:496;s:1:\"b\";s:27:\"update_account_account::tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:496;a:4:{s:1:\"a\";i:497;s:1:\"b\";s:27:\"delete_account_account::tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:497;a:4:{s:1:\"a\";i:498;s:1:\"b\";s:31:\"delete_any_account_account::tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:498;a:4:{s:1:\"a\";i:499;s:1:\"b\";s:30:\"view_any_account_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:499;a:4:{s:1:\"a\";i:500;s:1:\"b\";s:26:\"view_account_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:500;a:4:{s:1:\"a\";i:501;s:1:\"b\";s:28:\"create_account_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:501;a:4:{s:1:\"a\";i:502;s:1:\"b\";s:28:\"update_account_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:502;a:4:{s:1:\"a\";i:503;s:1:\"b\";s:28:\"delete_account_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:503;a:4:{s:1:\"a\";i:504;s:1:\"b\";s:32:\"delete_any_account_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:504;a:4:{s:1:\"a\";i:505;s:1:\"b\";s:29:\"restore_account_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:505;a:4:{s:1:\"a\";i:506;s:1:\"b\";s:33:\"restore_any_account_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:506;a:4:{s:1:\"a\";i:507;s:1:\"b\";s:34:\"force_delete_account_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:507;a:4:{s:1:\"a\";i:508;s:1:\"b\";s:38:\"force_delete_any_account_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:508;a:4:{s:1:\"a\";i:509;s:1:\"b\";s:21:\"view_any_account_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:509;a:4:{s:1:\"a\";i:510;s:1:\"b\";s:17:\"view_account_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:510;a:4:{s:1:\"a\";i:511;s:1:\"b\";s:19:\"create_account_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:511;a:4:{s:1:\"a\";i:512;s:1:\"b\";s:19:\"update_account_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:512;a:4:{s:1:\"a\";i:513;s:1:\"b\";s:19:\"delete_account_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:513;a:4:{s:1:\"a\";i:514;s:1:\"b\";s:23:\"delete_any_account_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:514;a:4:{s:1:\"a\";i:515;s:1:\"b\";s:20:\"reorder_account_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:515;a:4:{s:1:\"a\";i:516;s:1:\"b\";s:31:\"view_any_account_cash::rounding\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:516;a:4:{s:1:\"a\";i:517;s:1:\"b\";s:27:\"view_account_cash::rounding\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:517;a:4:{s:1:\"a\";i:518;s:1:\"b\";s:29:\"create_account_cash::rounding\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:518;a:4:{s:1:\"a\";i:519;s:1:\"b\";s:29:\"update_account_cash::rounding\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:519;a:4:{s:1:\"a\";i:520;s:1:\"b\";s:29:\"delete_account_cash::rounding\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:520;a:4:{s:1:\"a\";i:521;s:1:\"b\";s:33:\"delete_any_account_cash::rounding\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:521;a:4:{s:1:\"a\";i:522;s:1:\"b\";s:29:\"view_any_account_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:522;a:4:{s:1:\"a\";i:523;s:1:\"b\";s:25:\"view_account_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:523;a:4:{s:1:\"a\";i:524;s:1:\"b\";s:27:\"create_account_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:524;a:4:{s:1:\"a\";i:525;s:1:\"b\";s:27:\"update_account_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:525;a:4:{s:1:\"a\";i:526;s:1:\"b\";s:27:\"delete_account_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:526;a:4:{s:1:\"a\";i:527;s:1:\"b\";s:31:\"delete_any_account_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:527;a:4:{s:1:\"a\";i:528;s:1:\"b\";s:28:\"reorder_account_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:528;a:4:{s:1:\"a\";i:529;s:1:\"b\";s:25:\"view_any_account_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:529;a:4:{s:1:\"a\";i:530;s:1:\"b\";s:21:\"view_account_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:530;a:4:{s:1:\"a\";i:531;s:1:\"b\";s:23:\"create_account_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:531;a:4:{s:1:\"a\";i:532;s:1:\"b\";s:23:\"update_account_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:532;a:4:{s:1:\"a\";i:533;s:1:\"b\";s:23:\"delete_account_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:533;a:4:{s:1:\"a\";i:534;s:1:\"b\";s:27:\"delete_any_account_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:534;a:4:{s:1:\"a\";i:535;s:1:\"b\";s:24:\"restore_account_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:535;a:4:{s:1:\"a\";i:536;s:1:\"b\";s:28:\"restore_any_account_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:536;a:4:{s:1:\"a\";i:537;s:1:\"b\";s:29:\"force_delete_account_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:537;a:4:{s:1:\"a\";i:538;s:1:\"b\";s:33:\"force_delete_any_account_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:538;a:4:{s:1:\"a\";i:539;s:1:\"b\";s:33:\"view_any_account_fiscal::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:539;a:4:{s:1:\"a\";i:540;s:1:\"b\";s:29:\"view_account_fiscal::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:540;a:4:{s:1:\"a\";i:541;s:1:\"b\";s:31:\"create_account_fiscal::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:541;a:4:{s:1:\"a\";i:542;s:1:\"b\";s:31:\"update_account_fiscal::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:542;a:4:{s:1:\"a\";i:543;s:1:\"b\";s:31:\"delete_account_fiscal::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:543;a:4:{s:1:\"a\";i:544;s:1:\"b\";s:35:\"delete_any_account_fiscal::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:544;a:4:{s:1:\"a\";i:545;s:1:\"b\";s:32:\"reorder_account_fiscal::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:545;a:4:{s:1:\"a\";i:546;s:1:\"b\";s:25:\"view_any_account_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:546;a:4:{s:1:\"a\";i:547;s:1:\"b\";s:21:\"view_account_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:547;a:4:{s:1:\"a\";i:548;s:1:\"b\";s:23:\"create_account_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:548;a:4:{s:1:\"a\";i:549;s:1:\"b\";s:23:\"update_account_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:549;a:4:{s:1:\"a\";i:550;s:1:\"b\";s:23:\"delete_account_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:550;a:4:{s:1:\"a\";i:551;s:1:\"b\";s:27:\"delete_any_account_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:551;a:4:{s:1:\"a\";i:552;s:1:\"b\";s:24:\"restore_account_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:552;a:4:{s:1:\"a\";i:553;s:1:\"b\";s:28:\"restore_any_account_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:553;a:4:{s:1:\"a\";i:554;s:1:\"b\";s:29:\"force_delete_account_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:554;a:4:{s:1:\"a\";i:555;s:1:\"b\";s:33:\"force_delete_any_account_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:555;a:4:{s:1:\"a\";i:556;s:1:\"b\";s:24:\"view_any_account_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:556;a:4:{s:1:\"a\";i:557;s:1:\"b\";s:20:\"view_account_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:557;a:4:{s:1:\"a\";i:558;s:1:\"b\";s:22:\"create_account_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:558;a:4:{s:1:\"a\";i:559;s:1:\"b\";s:22:\"update_account_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:559;a:4:{s:1:\"a\";i:560;s:1:\"b\";s:22:\"delete_account_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:560;a:4:{s:1:\"a\";i:561;s:1:\"b\";s:26:\"delete_any_account_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:561;a:4:{s:1:\"a\";i:562;s:1:\"b\";s:23:\"reorder_account_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:562;a:4:{s:1:\"a\";i:563;s:1:\"b\";s:24:\"view_any_account_journal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:563;a:4:{s:1:\"a\";i:564;s:1:\"b\";s:20:\"view_account_journal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:564;a:4:{s:1:\"a\";i:565;s:1:\"b\";s:22:\"create_account_journal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:565;a:4:{s:1:\"a\";i:566;s:1:\"b\";s:22:\"update_account_journal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:566;a:4:{s:1:\"a\";i:567;s:1:\"b\";s:22:\"delete_account_journal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:567;a:4:{s:1:\"a\";i:568;s:1:\"b\";s:26:\"delete_any_account_journal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:568;a:4:{s:1:\"a\";i:569;s:1:\"b\";s:23:\"reorder_account_journal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:569;a:4:{s:1:\"a\";i:570;s:1:\"b\";s:24:\"view_any_account_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:570;a:4:{s:1:\"a\";i:571;s:1:\"b\";s:20:\"view_account_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:571;a:4:{s:1:\"a\";i:572;s:1:\"b\";s:22:\"create_account_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:572;a:4:{s:1:\"a\";i:573;s:1:\"b\";s:22:\"update_account_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:573;a:4:{s:1:\"a\";i:574;s:1:\"b\";s:22:\"delete_account_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:574;a:4:{s:1:\"a\";i:575;s:1:\"b\";s:26:\"delete_any_account_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:575;a:4:{s:1:\"a\";i:576;s:1:\"b\";s:23:\"restore_account_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:576;a:4:{s:1:\"a\";i:577;s:1:\"b\";s:27:\"restore_any_account_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:577;a:4:{s:1:\"a\";i:578;s:1:\"b\";s:28:\"force_delete_account_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:578;a:4:{s:1:\"a\";i:579;s:1:\"b\";s:32:\"force_delete_any_account_partner\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:579;a:4:{s:1:\"a\";i:580;s:1:\"b\";s:24:\"view_any_account_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:580;a:4:{s:1:\"a\";i:581;s:1:\"b\";s:20:\"view_account_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:581;a:4:{s:1:\"a\";i:582;s:1:\"b\";s:22:\"create_account_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:582;a:4:{s:1:\"a\";i:583;s:1:\"b\";s:22:\"update_account_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:583;a:4:{s:1:\"a\";i:584;s:1:\"b\";s:22:\"delete_account_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:584;a:4:{s:1:\"a\";i:585;s:1:\"b\";s:26:\"delete_any_account_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:585;a:4:{s:1:\"a\";i:586;s:1:\"b\";s:30:\"view_any_account_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:586;a:4:{s:1:\"a\";i:587;s:1:\"b\";s:26:\"view_account_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:587;a:4:{s:1:\"a\";i:588;s:1:\"b\";s:28:\"create_account_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:588;a:4:{s:1:\"a\";i:589;s:1:\"b\";s:28:\"update_account_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:589;a:4:{s:1:\"a\";i:590;s:1:\"b\";s:28:\"delete_account_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:590;a:4:{s:1:\"a\";i:591;s:1:\"b\";s:32:\"delete_any_account_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:591;a:4:{s:1:\"a\";i:592;s:1:\"b\";s:29:\"reorder_account_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:592;a:4:{s:1:\"a\";i:593;s:1:\"b\";s:34:\"view_any_account_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:593;a:4:{s:1:\"a\";i:594;s:1:\"b\";s:30:\"view_account_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:594;a:4:{s:1:\"a\";i:595;s:1:\"b\";s:32:\"create_account_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:595;a:4:{s:1:\"a\";i:596;s:1:\"b\";s:32:\"update_account_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:596;a:4:{s:1:\"a\";i:597;s:1:\"b\";s:32:\"delete_account_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:597;a:4:{s:1:\"a\";i:598;s:1:\"b\";s:36:\"delete_any_account_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:598;a:4:{s:1:\"a\";i:599;s:1:\"b\";s:24:\"view_any_account_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:599;a:4:{s:1:\"a\";i:600;s:1:\"b\";s:20:\"view_account_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:600;a:4:{s:1:\"a\";i:601;s:1:\"b\";s:22:\"create_account_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:601;a:4:{s:1:\"a\";i:602;s:1:\"b\";s:22:\"update_account_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:602;a:4:{s:1:\"a\";i:603;s:1:\"b\";s:22:\"delete_account_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:603;a:4:{s:1:\"a\";i:604;s:1:\"b\";s:26:\"delete_any_account_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:604;a:4:{s:1:\"a\";i:605;s:1:\"b\";s:23:\"restore_account_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:605;a:4:{s:1:\"a\";i:606;s:1:\"b\";s:27:\"restore_any_account_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:606;a:4:{s:1:\"a\";i:607;s:1:\"b\";s:28:\"force_delete_account_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:607;a:4:{s:1:\"a\";i:608;s:1:\"b\";s:32:\"force_delete_any_account_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:608;a:4:{s:1:\"a\";i:609;s:1:\"b\";s:23:\"reorder_account_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:609;a:4:{s:1:\"a\";i:610;s:1:\"b\";s:23:\"view_any_account_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:610;a:4:{s:1:\"a\";i:611;s:1:\"b\";s:19:\"view_account_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:611;a:4:{s:1:\"a\";i:612;s:1:\"b\";s:21:\"create_account_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:612;a:4:{s:1:\"a\";i:613;s:1:\"b\";s:21:\"update_account_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:613;a:4:{s:1:\"a\";i:614;s:1:\"b\";s:21:\"delete_account_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:614;a:4:{s:1:\"a\";i:615;s:1:\"b\";s:25:\"delete_any_account_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:615;a:4:{s:1:\"a\";i:616;s:1:\"b\";s:22:\"reorder_account_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:616;a:4:{s:1:\"a\";i:617;s:1:\"b\";s:27:\"view_any_account_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:617;a:4:{s:1:\"a\";i:618;s:1:\"b\";s:23:\"view_account_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:618;a:4:{s:1:\"a\";i:619;s:1:\"b\";s:25:\"create_account_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:619;a:4:{s:1:\"a\";i:620;s:1:\"b\";s:25:\"update_account_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:620;a:4:{s:1:\"a\";i:621;s:1:\"b\";s:25:\"delete_account_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:621;a:4:{s:1:\"a\";i:622;s:1:\"b\";s:29:\"delete_any_account_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:622;a:4:{s:1:\"a\";i:623;s:1:\"b\";s:26:\"reorder_account_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:623;a:4:{s:1:\"a\";i:624;s:1:\"b\";s:20:\"view_any_account_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:624;a:4:{s:1:\"a\";i:625;s:1:\"b\";s:16:\"view_account_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:625;a:4:{s:1:\"a\";i:626;s:1:\"b\";s:18:\"create_account_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:626;a:4:{s:1:\"a\";i:627;s:1:\"b\";s:18:\"update_account_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:627;a:4:{s:1:\"a\";i:628;s:1:\"b\";s:18:\"delete_account_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:628;a:4:{s:1:\"a\";i:629;s:1:\"b\";s:22:\"delete_any_account_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:629;a:4:{s:1:\"a\";i:630;s:1:\"b\";s:19:\"reorder_account_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:630;a:4:{s:1:\"a\";i:631;s:1:\"b\";s:23:\"view_any_account_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:631;a:4:{s:1:\"a\";i:632;s:1:\"b\";s:19:\"view_account_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:632;a:4:{s:1:\"a\";i:633;s:1:\"b\";s:21:\"create_account_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:633;a:4:{s:1:\"a\";i:634;s:1:\"b\";s:21:\"update_account_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:634;a:4:{s:1:\"a\";i:635;s:1:\"b\";s:21:\"delete_account_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:635;a:4:{s:1:\"a\";i:636;s:1:\"b\";s:25:\"delete_any_account_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:636;a:4:{s:1:\"a\";i:637;s:1:\"b\";s:22:\"restore_account_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:637;a:4:{s:1:\"a\";i:638;s:1:\"b\";s:26:\"restore_any_account_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:638;a:4:{s:1:\"a\";i:639;s:1:\"b\";s:27:\"force_delete_account_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:639;a:4:{s:1:\"a\";i:640;s:1:\"b\";s:31:\"force_delete_any_account_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:640;a:4:{s:1:\"a\";i:641;s:1:\"b\";s:34:\"view_any_accounting_journal::entry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:641;a:4:{s:1:\"a\";i:642;s:1:\"b\";s:30:\"view_accounting_journal::entry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:642;a:4:{s:1:\"a\";i:643;s:1:\"b\";s:32:\"create_accounting_journal::entry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;}}i:643;a:4:{s:1:\"a\";i:644;s:1:\"b\";s:32:\"update_accounting_journal::entry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:644;a:4:{s:1:\"a\";i:645;s:1:\"b\";s:32:\"delete_accounting_journal::entry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:645;a:4:{s:1:\"a\";i:646;s:1:\"b\";s:36:\"delete_any_accounting_journal::entry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:646;a:4:{s:1:\"a\";i:647;s:1:\"b\";s:33:\"reorder_accounting_journal::entry\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:647;a:4:{s:1:\"a\";i:648;s:1:\"b\";s:33:\"view_any_accounting_journal::item\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:6;}}i:648;a:4:{s:1:\"a\";i:649;s:1:\"b\";s:29:\"view_accounting_journal::item\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:649;a:4:{s:1:\"a\";i:650;s:1:\"b\";s:31:\"create_accounting_journal::item\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:650;a:4:{s:1:\"a\";i:651;s:1:\"b\";s:31:\"update_accounting_journal::item\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:651;a:4:{s:1:\"a\";i:652;s:1:\"b\";s:31:\"delete_accounting_journal::item\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:652;a:4:{s:1:\"a\";i:653;s:1:\"b\";s:35:\"delete_any_accounting_journal::item\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:653;a:4:{s:1:\"a\";i:654;s:1:\"b\";s:32:\"reorder_accounting_journal::item\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:654;a:4:{s:1:\"a\";i:655;s:1:\"b\";s:27:\"view_any_accounting_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;}}i:655;a:4:{s:1:\"a\";i:656;s:1:\"b\";s:23:\"view_accounting_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:656;a:4:{s:1:\"a\";i:657;s:1:\"b\";s:25:\"create_accounting_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:657;a:4:{s:1:\"a\";i:658;s:1:\"b\";s:25:\"update_accounting_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:658;a:4:{s:1:\"a\";i:659;s:1:\"b\";s:25:\"delete_accounting_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:659;a:4:{s:1:\"a\";i:660;s:1:\"b\";s:29:\"delete_any_accounting_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:660;a:4:{s:1:\"a\";i:661;s:1:\"b\";s:34:\"view_any_accounting_cash::rounding\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:661;a:4:{s:1:\"a\";i:662;s:1:\"b\";s:30:\"view_accounting_cash::rounding\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:662;a:4:{s:1:\"a\";i:663;s:1:\"b\";s:32:\"create_accounting_cash::rounding\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:663;a:4:{s:1:\"a\";i:664;s:1:\"b\";s:32:\"update_accounting_cash::rounding\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:664;a:4:{s:1:\"a\";i:665;s:1:\"b\";s:32:\"delete_accounting_cash::rounding\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:665;a:4:{s:1:\"a\";i:666;s:1:\"b\";s:36:\"delete_any_accounting_cash::rounding\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:666;a:4:{s:1:\"a\";i:667;s:1:\"b\";s:28:\"view_any_accounting_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;}}i:667;a:4:{s:1:\"a\";i:668;s:1:\"b\";s:24:\"view_accounting_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:668;a:4:{s:1:\"a\";i:669;s:1:\"b\";s:26:\"create_accounting_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:669;a:4:{s:1:\"a\";i:670;s:1:\"b\";s:26:\"update_accounting_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:670;a:4:{s:1:\"a\";i:671;s:1:\"b\";s:26:\"delete_accounting_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:671;a:4:{s:1:\"a\";i:672;s:1:\"b\";s:30:\"delete_any_accounting_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:672;a:4:{s:1:\"a\";i:673;s:1:\"b\";s:36:\"view_any_accounting_fiscal::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:673;a:4:{s:1:\"a\";i:674;s:1:\"b\";s:32:\"view_accounting_fiscal::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:674;a:4:{s:1:\"a\";i:675;s:1:\"b\";s:34:\"create_accounting_fiscal::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:675;a:4:{s:1:\"a\";i:676;s:1:\"b\";s:34:\"update_accounting_fiscal::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:676;a:4:{s:1:\"a\";i:677;s:1:\"b\";s:34:\"delete_accounting_fiscal::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:677;a:4:{s:1:\"a\";i:678;s:1:\"b\";s:38:\"delete_any_accounting_fiscal::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:678;a:4:{s:1:\"a\";i:679;s:1:\"b\";s:35:\"reorder_accounting_fiscal::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:679;a:4:{s:1:\"a\";i:680;s:1:\"b\";s:28:\"view_any_accounting_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:680;a:4:{s:1:\"a\";i:681;s:1:\"b\";s:24:\"view_accounting_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:681;a:4:{s:1:\"a\";i:682;s:1:\"b\";s:26:\"create_accounting_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:682;a:4:{s:1:\"a\";i:683;s:1:\"b\";s:26:\"update_accounting_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:683;a:4:{s:1:\"a\";i:684;s:1:\"b\";s:26:\"delete_accounting_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:684;a:4:{s:1:\"a\";i:685;s:1:\"b\";s:30:\"delete_any_accounting_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:685;a:4:{s:1:\"a\";i:686;s:1:\"b\";s:27:\"restore_accounting_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:686;a:4:{s:1:\"a\";i:687;s:1:\"b\";s:31:\"restore_any_accounting_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:687;a:4:{s:1:\"a\";i:688;s:1:\"b\";s:32:\"force_delete_accounting_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:688;a:4:{s:1:\"a\";i:689;s:1:\"b\";s:36:\"force_delete_any_accounting_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:689;a:4:{s:1:\"a\";i:690;s:1:\"b\";s:27:\"view_any_accounting_journal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:690;a:4:{s:1:\"a\";i:691;s:1:\"b\";s:23:\"view_accounting_journal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:5;}}i:691;a:4:{s:1:\"a\";i:692;s:1:\"b\";s:25:\"create_accounting_journal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:6;}}i:692;a:4:{s:1:\"a\";i:693;s:1:\"b\";s:25:\"update_accounting_journal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;}}i:693;a:4:{s:1:\"a\";i:694;s:1:\"b\";s:25:\"delete_accounting_journal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:694;a:4:{s:1:\"a\";i:695;s:1:\"b\";s:29:\"delete_any_accounting_journal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:695;a:4:{s:1:\"a\";i:696;s:1:\"b\";s:26:\"reorder_accounting_journal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:696;a:4:{s:1:\"a\";i:697;s:1:\"b\";s:33:\"view_any_accounting_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;}}i:697;a:4:{s:1:\"a\";i:698;s:1:\"b\";s:29:\"view_accounting_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:698;a:4:{s:1:\"a\";i:699;s:1:\"b\";s:31:\"create_accounting_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:699;a:4:{s:1:\"a\";i:700;s:1:\"b\";s:31:\"update_accounting_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:700;a:4:{s:1:\"a\";i:701;s:1:\"b\";s:31:\"delete_accounting_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:701;a:4:{s:1:\"a\";i:702;s:1:\"b\";s:35:\"delete_any_accounting_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:702;a:4:{s:1:\"a\";i:703;s:1:\"b\";s:32:\"restore_accounting_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:703;a:4:{s:1:\"a\";i:704;s:1:\"b\";s:36:\"restore_any_accounting_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:5;}}i:704;a:4:{s:1:\"a\";i:705;s:1:\"b\";s:37:\"force_delete_accounting_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:705;a:4:{s:1:\"a\";i:706;s:1:\"b\";s:41:\"force_delete_any_accounting_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:706;a:4:{s:1:\"a\";i:707;s:1:\"b\";s:32:\"reorder_accounting_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:707;a:4:{s:1:\"a\";i:708;s:1:\"b\";s:38:\"view_any_accounting_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:708;a:4:{s:1:\"a\";i:709;s:1:\"b\";s:34:\"view_accounting_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:709;a:4:{s:1:\"a\";i:710;s:1:\"b\";s:36:\"create_accounting_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:710;a:4:{s:1:\"a\";i:711;s:1:\"b\";s:36:\"update_accounting_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:711;a:4:{s:1:\"a\";i:712;s:1:\"b\";s:36:\"delete_accounting_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:712;a:4:{s:1:\"a\";i:713;s:1:\"b\";s:40:\"delete_any_accounting_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:713;a:4:{s:1:\"a\";i:714;s:1:\"b\";s:37:\"restore_accounting_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:714;a:4:{s:1:\"a\";i:715;s:1:\"b\";s:41:\"restore_any_accounting_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:715;a:4:{s:1:\"a\";i:716;s:1:\"b\";s:42:\"force_delete_accounting_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:716;a:4:{s:1:\"a\";i:717;s:1:\"b\";s:46:\"force_delete_any_accounting_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:717;a:4:{s:1:\"a\";i:718;s:1:\"b\";s:37:\"reorder_accounting_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:718;a:4:{s:1:\"a\";i:719;s:1:\"b\";s:37:\"view_any_accounting_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:719;a:4:{s:1:\"a\";i:720;s:1:\"b\";s:33:\"view_accounting_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:720;a:4:{s:1:\"a\";i:721;s:1:\"b\";s:35:\"create_accounting_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:721;a:4:{s:1:\"a\";i:722;s:1:\"b\";s:35:\"update_accounting_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:722;a:4:{s:1:\"a\";i:723;s:1:\"b\";s:35:\"delete_accounting_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:723;a:4:{s:1:\"a\";i:724;s:1:\"b\";s:39:\"delete_any_accounting_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:724;a:4:{s:1:\"a\";i:725;s:1:\"b\";s:30:\"view_any_accounting_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:6;}}i:725;a:4:{s:1:\"a\";i:726;s:1:\"b\";s:26:\"view_accounting_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:726;a:4:{s:1:\"a\";i:727;s:1:\"b\";s:28:\"create_accounting_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:727;a:4:{s:1:\"a\";i:728;s:1:\"b\";s:28:\"update_accounting_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:728;a:4:{s:1:\"a\";i:729;s:1:\"b\";s:28:\"delete_accounting_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:729;a:4:{s:1:\"a\";i:730;s:1:\"b\";s:32:\"delete_any_accounting_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:730;a:4:{s:1:\"a\";i:731;s:1:\"b\";s:29:\"reorder_accounting_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:731;a:4:{s:1:\"a\";i:732;s:1:\"b\";s:23:\"view_any_accounting_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;}}i:732;a:4:{s:1:\"a\";i:733;s:1:\"b\";s:19:\"view_accounting_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:733;a:4:{s:1:\"a\";i:734;s:1:\"b\";s:21:\"create_accounting_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:734;a:4:{s:1:\"a\";i:735;s:1:\"b\";s:21:\"update_accounting_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:735;a:4:{s:1:\"a\";i:736;s:1:\"b\";s:21:\"delete_accounting_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:736;a:4:{s:1:\"a\";i:737;s:1:\"b\";s:25:\"delete_any_accounting_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:737;a:4:{s:1:\"a\";i:738;s:1:\"b\";s:22:\"reorder_accounting_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:738;a:4:{s:1:\"a\";i:739;s:1:\"b\";s:32:\"view_any_accounting_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;}}i:739;a:4:{s:1:\"a\";i:740;s:1:\"b\";s:28:\"view_accounting_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:740;a:4:{s:1:\"a\";i:741;s:1:\"b\";s:30:\"create_accounting_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:741;a:4:{s:1:\"a\";i:742;s:1:\"b\";s:30:\"update_accounting_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:742;a:4:{s:1:\"a\";i:743;s:1:\"b\";s:30:\"delete_accounting_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:743;a:4:{s:1:\"a\";i:744;s:1:\"b\";s:34:\"delete_any_accounting_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:744;a:4:{s:1:\"a\";i:745;s:1:\"b\";s:31:\"reorder_accounting_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:745;a:4:{s:1:\"a\";i:746;s:1:\"b\";s:28:\"view_any_accounting_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;}}i:746;a:4:{s:1:\"a\";i:747;s:1:\"b\";s:24:\"view_accounting_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:747;a:4:{s:1:\"a\";i:748;s:1:\"b\";s:26:\"create_accounting_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:748;a:4:{s:1:\"a\";i:749;s:1:\"b\";s:26:\"update_accounting_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:749;a:4:{s:1:\"a\";i:750;s:1:\"b\";s:26:\"delete_accounting_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:750;a:4:{s:1:\"a\";i:751;s:1:\"b\";s:30:\"delete_any_accounting_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:751;a:4:{s:1:\"a\";i:752;s:1:\"b\";s:27:\"restore_accounting_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:752;a:4:{s:1:\"a\";i:753;s:1:\"b\";s:31:\"restore_any_accounting_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:753;a:4:{s:1:\"a\";i:754;s:1:\"b\";s:32:\"force_delete_accounting_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:754;a:4:{s:1:\"a\";i:755;s:1:\"b\";s:36:\"force_delete_any_accounting_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:755;a:4:{s:1:\"a\";i:756;s:1:\"b\";s:27:\"view_any_accounting_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:756;a:4:{s:1:\"a\";i:757;s:1:\"b\";s:23:\"view_accounting_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:757;a:4:{s:1:\"a\";i:758;s:1:\"b\";s:25:\"create_accounting_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:758;a:4:{s:1:\"a\";i:759;s:1:\"b\";s:25:\"update_accounting_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:759;a:4:{s:1:\"a\";i:760;s:1:\"b\";s:25:\"delete_accounting_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:760;a:4:{s:1:\"a\";i:761;s:1:\"b\";s:29:\"delete_any_accounting_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:761;a:4:{s:1:\"a\";i:762;s:1:\"b\";s:26:\"reorder_accounting_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:762;a:4:{s:1:\"a\";i:763;s:1:\"b\";s:27:\"view_any_accounting_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:6;}}i:763;a:4:{s:1:\"a\";i:764;s:1:\"b\";s:23:\"view_accounting_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:764;a:4:{s:1:\"a\";i:765;s:1:\"b\";s:25:\"create_accounting_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:765;a:4:{s:1:\"a\";i:766;s:1:\"b\";s:25:\"update_accounting_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:766;a:4:{s:1:\"a\";i:767;s:1:\"b\";s:25:\"delete_accounting_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:767;a:4:{s:1:\"a\";i:768;s:1:\"b\";s:29:\"delete_any_accounting_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:768;a:4:{s:1:\"a\";i:769;s:1:\"b\";s:27:\"view_any_accounting_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:6;}}i:769;a:4:{s:1:\"a\";i:770;s:1:\"b\";s:23:\"view_accounting_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:770;a:4:{s:1:\"a\";i:771;s:1:\"b\";s:25:\"create_accounting_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:771;a:4:{s:1:\"a\";i:772;s:1:\"b\";s:25:\"update_accounting_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:772;a:4:{s:1:\"a\";i:773;s:1:\"b\";s:25:\"delete_accounting_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:773;a:4:{s:1:\"a\";i:774;s:1:\"b\";s:29:\"delete_any_accounting_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:774;a:4:{s:1:\"a\";i:775;s:1:\"b\";s:26:\"restore_accounting_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:775;a:4:{s:1:\"a\";i:776;s:1:\"b\";s:30:\"restore_any_accounting_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:776;a:4:{s:1:\"a\";i:777;s:1:\"b\";s:31:\"force_delete_accounting_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:777;a:4:{s:1:\"a\";i:778;s:1:\"b\";s:35:\"force_delete_any_accounting_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:778;a:4:{s:1:\"a\";i:779;s:1:\"b\";s:26:\"reorder_accounting_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:779;a:4:{s:1:\"a\";i:780;s:1:\"b\";s:24:\"view_any_accounting_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:780;a:4:{s:1:\"a\";i:781;s:1:\"b\";s:20:\"view_accounting_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:781;a:4:{s:1:\"a\";i:782;s:1:\"b\";s:22:\"create_accounting_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:6;}}i:782;a:4:{s:1:\"a\";i:783;s:1:\"b\";s:22:\"update_accounting_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:5;}}i:783;a:4:{s:1:\"a\";i:784;s:1:\"b\";s:22:\"delete_accounting_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:784;a:4:{s:1:\"a\";i:785;s:1:\"b\";s:26:\"delete_any_accounting_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:785;a:4:{s:1:\"a\";i:786;s:1:\"b\";s:23:\"reorder_accounting_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:786;a:4:{s:1:\"a\";i:787;s:1:\"b\";s:26:\"view_any_accounting_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:787;a:4:{s:1:\"a\";i:788;s:1:\"b\";s:22:\"view_accounting_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:788;a:4:{s:1:\"a\";i:789;s:1:\"b\";s:24:\"create_accounting_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:789;a:4:{s:1:\"a\";i:790;s:1:\"b\";s:24:\"update_accounting_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:790;a:4:{s:1:\"a\";i:791;s:1:\"b\";s:24:\"delete_accounting_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:791;a:4:{s:1:\"a\";i:792;s:1:\"b\";s:28:\"delete_any_accounting_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:792;a:4:{s:1:\"a\";i:793;s:1:\"b\";s:25:\"reorder_accounting_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:793;a:4:{s:1:\"a\";i:794;s:1:\"b\";s:26:\"view_any_accounting_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:794;a:4:{s:1:\"a\";i:795;s:1:\"b\";s:22:\"view_accounting_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:795;a:4:{s:1:\"a\";i:796;s:1:\"b\";s:24:\"create_accounting_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;}}i:796;a:4:{s:1:\"a\";i:797;s:1:\"b\";s:24:\"update_accounting_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:797;a:4:{s:1:\"a\";i:798;s:1:\"b\";s:24:\"delete_accounting_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:798;a:4:{s:1:\"a\";i:799;s:1:\"b\";s:28:\"delete_any_accounting_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:799;a:4:{s:1:\"a\";i:800;s:1:\"b\";s:25:\"restore_accounting_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:800;a:4:{s:1:\"a\";i:801;s:1:\"b\";s:29:\"restore_any_accounting_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:801;a:4:{s:1:\"a\";i:802;s:1:\"b\";s:30:\"force_delete_accounting_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:802;a:4:{s:1:\"a\";i:803;s:1:\"b\";s:34:\"force_delete_any_accounting_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:803;a:4:{s:1:\"a\";i:804;s:1:\"b\";s:24:\"page_accounting_overview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:804;a:4:{s:1:\"a\";i:805;s:1:\"b\";s:28:\"page_accounting_aged_payable\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:805;a:4:{s:1:\"a\";i:806;s:1:\"b\";s:31:\"page_accounting_aged_receivable\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:806;a:4:{s:1:\"a\";i:807;s:1:\"b\";s:29:\"page_accounting_balance_sheet\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:807;a:4:{s:1:\"a\";i:808;s:1:\"b\";s:30:\"page_accounting_general_ledger\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:808;a:4:{s:1:\"a\";i:809;s:1:\"b\";s:30:\"page_accounting_partner_ledger\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:809;a:4:{s:1:\"a\";i:810;s:1:\"b\";s:27:\"page_accounting_profit_loss\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:810;a:4:{s:1:\"a\";i:811;s:1:\"b\";s:29:\"page_accounting_trial_balance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:811;a:4:{s:1:\"a\";i:812;s:1:\"b\";s:39:\"page_accounting_manage_customer_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:812;a:4:{s:1:\"a\";i:813;s:1:\"b\";s:39:\"page_accounting_manage_default_accounts\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:813;a:4:{s:1:\"a\";i:814;s:1:\"b\";s:31:\"page_accounting_manage_products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:814;a:4:{s:1:\"a\";i:815;s:1:\"b\";s:28:\"page_accounting_manage_taxes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:815;a:4:{s:1:\"a\";i:816;s:1:\"b\";s:30:\"view_any_recruitment_applicant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:816;a:4:{s:1:\"a\";i:817;s:1:\"b\";s:26:\"view_recruitment_applicant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:817;a:4:{s:1:\"a\";i:818;s:1:\"b\";s:28:\"create_recruitment_applicant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:818;a:4:{s:1:\"a\";i:819;s:1:\"b\";s:28:\"update_recruitment_applicant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:819;a:4:{s:1:\"a\";i:820;s:1:\"b\";s:28:\"delete_recruitment_applicant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:820;a:4:{s:1:\"a\";i:821;s:1:\"b\";s:32:\"delete_any_recruitment_applicant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:821;a:4:{s:1:\"a\";i:822;s:1:\"b\";s:29:\"restore_recruitment_applicant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:822;a:4:{s:1:\"a\";i:823;s:1:\"b\";s:33:\"restore_any_recruitment_applicant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:823;a:4:{s:1:\"a\";i:824;s:1:\"b\";s:34:\"force_delete_recruitment_applicant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:824;a:4:{s:1:\"a\";i:825;s:1:\"b\";s:38:\"force_delete_any_recruitment_applicant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:825;a:4:{s:1:\"a\";i:826;s:1:\"b\";s:30:\"view_any_recruitment_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:826;a:4:{s:1:\"a\";i:827;s:1:\"b\";s:26:\"view_recruitment_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:827;a:4:{s:1:\"a\";i:828;s:1:\"b\";s:28:\"create_recruitment_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:828;a:4:{s:1:\"a\";i:829;s:1:\"b\";s:28:\"update_recruitment_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:829;a:4:{s:1:\"a\";i:830;s:1:\"b\";s:28:\"delete_recruitment_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:830;a:4:{s:1:\"a\";i:831;s:1:\"b\";s:32:\"delete_any_recruitment_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:831;a:4:{s:1:\"a\";i:832;s:1:\"b\";s:29:\"restore_recruitment_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:832;a:4:{s:1:\"a\";i:833;s:1:\"b\";s:33:\"restore_any_recruitment_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:833;a:4:{s:1:\"a\";i:834;s:1:\"b\";s:34:\"force_delete_recruitment_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:834;a:4:{s:1:\"a\";i:835;s:1:\"b\";s:38:\"force_delete_any_recruitment_candidate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:835;a:4:{s:1:\"a\";i:836;s:1:\"b\";s:38:\"view_any_recruitment_job::by::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:836;a:4:{s:1:\"a\";i:837;s:1:\"b\";s:34:\"view_recruitment_job::by::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:837;a:4:{s:1:\"a\";i:838;s:1:\"b\";s:36:\"create_recruitment_job::by::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:838;a:4:{s:1:\"a\";i:839;s:1:\"b\";s:36:\"update_recruitment_job::by::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:839;a:4:{s:1:\"a\";i:840;s:1:\"b\";s:36:\"delete_recruitment_job::by::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:840;a:4:{s:1:\"a\";i:841;s:1:\"b\";s:40:\"delete_any_recruitment_job::by::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:841;a:4:{s:1:\"a\";i:842;s:1:\"b\";s:37:\"restore_recruitment_job::by::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:842;a:4:{s:1:\"a\";i:843;s:1:\"b\";s:41:\"restore_any_recruitment_job::by::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:843;a:4:{s:1:\"a\";i:844;s:1:\"b\";s:42:\"force_delete_recruitment_job::by::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:844;a:4:{s:1:\"a\";i:845;s:1:\"b\";s:46:\"force_delete_any_recruitment_job::by::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:845;a:4:{s:1:\"a\";i:846;s:1:\"b\";s:37:\"reorder_recruitment_job::by::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:846;a:4:{s:1:\"a\";i:847;s:1:\"b\";s:35:\"view_any_recruitment_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:847;a:4:{s:1:\"a\";i:848;s:1:\"b\";s:31:\"view_recruitment_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:848;a:4:{s:1:\"a\";i:849;s:1:\"b\";s:33:\"create_recruitment_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:849;a:4:{s:1:\"a\";i:850;s:1:\"b\";s:33:\"update_recruitment_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:850;a:4:{s:1:\"a\";i:851;s:1:\"b\";s:33:\"delete_recruitment_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:851;a:4:{s:1:\"a\";i:852;s:1:\"b\";s:37:\"delete_any_recruitment_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:852;a:4:{s:1:\"a\";i:853;s:1:\"b\";s:34:\"restore_recruitment_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:853;a:4:{s:1:\"a\";i:854;s:1:\"b\";s:38:\"restore_any_recruitment_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:854;a:4:{s:1:\"a\";i:855;s:1:\"b\";s:39:\"force_delete_recruitment_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:855;a:4:{s:1:\"a\";i:856;s:1:\"b\";s:43:\"force_delete_any_recruitment_activity::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:856;a:4:{s:1:\"a\";i:857;s:1:\"b\";s:35:\"view_any_recruitment_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:857;a:4:{s:1:\"a\";i:858;s:1:\"b\";s:31:\"view_recruitment_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:858;a:4:{s:1:\"a\";i:859;s:1:\"b\";s:33:\"create_recruitment_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:859;a:4:{s:1:\"a\";i:860;s:1:\"b\";s:33:\"update_recruitment_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:860;a:4:{s:1:\"a\";i:861;s:1:\"b\";s:33:\"delete_recruitment_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:861;a:4:{s:1:\"a\";i:862;s:1:\"b\";s:37:\"delete_any_recruitment_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:862;a:4:{s:1:\"a\";i:863;s:1:\"b\";s:34:\"restore_recruitment_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:863;a:4:{s:1:\"a\";i:864;s:1:\"b\";s:38:\"restore_any_recruitment_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:864;a:4:{s:1:\"a\";i:865;s:1:\"b\";s:39:\"force_delete_recruitment_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:865;a:4:{s:1:\"a\";i:866;s:1:\"b\";s:43:\"force_delete_any_recruitment_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:866;a:4:{s:1:\"a\";i:867;s:1:\"b\";s:34:\"reorder_recruitment_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:867;a:4:{s:1:\"a\";i:868;s:1:\"b\";s:40:\"view_any_recruitment_applicant::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:868;a:4:{s:1:\"a\";i:869;s:1:\"b\";s:36:\"view_recruitment_applicant::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:869;a:4:{s:1:\"a\";i:870;s:1:\"b\";s:38:\"create_recruitment_applicant::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:870;a:4:{s:1:\"a\";i:871;s:1:\"b\";s:38:\"update_recruitment_applicant::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:871;a:4:{s:1:\"a\";i:872;s:1:\"b\";s:38:\"delete_recruitment_applicant::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:872;a:4:{s:1:\"a\";i:873;s:1:\"b\";s:42:\"delete_any_recruitment_applicant::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:873;a:4:{s:1:\"a\";i:874;s:1:\"b\";s:27:\"view_any_recruitment_degree\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:7;}}i:874;a:4:{s:1:\"a\";i:875;s:1:\"b\";s:23:\"view_recruitment_degree\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:7;}}i:875;a:4:{s:1:\"a\";i:876;s:1:\"b\";s:25:\"create_recruitment_degree\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:5;}}i:876;a:4:{s:1:\"a\";i:877;s:1:\"b\";s:25:\"update_recruitment_degree\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:877;a:4:{s:1:\"a\";i:878;s:1:\"b\";s:25:\"delete_recruitment_degree\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:878;a:4:{s:1:\"a\";i:879;s:1:\"b\";s:29:\"delete_any_recruitment_degree\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:879;a:4:{s:1:\"a\";i:880;s:1:\"b\";s:26:\"reorder_recruitment_degree\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:880;a:4:{s:1:\"a\";i:881;s:1:\"b\";s:31:\"view_any_recruitment_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:7;}}i:881;a:4:{s:1:\"a\";i:882;s:1:\"b\";s:27:\"view_recruitment_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:882;a:4:{s:1:\"a\";i:883;s:1:\"b\";s:29:\"create_recruitment_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:7;}}i:883;a:4:{s:1:\"a\";i:884;s:1:\"b\";s:29:\"update_recruitment_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:884;a:4:{s:1:\"a\";i:885;s:1:\"b\";s:29:\"delete_recruitment_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:885;a:4:{s:1:\"a\";i:886;s:1:\"b\";s:33:\"delete_any_recruitment_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:886;a:4:{s:1:\"a\";i:887;s:1:\"b\";s:30:\"restore_recruitment_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:887;a:4:{s:1:\"a\";i:888;s:1:\"b\";s:34:\"restore_any_recruitment_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:888;a:4:{s:1:\"a\";i:889;s:1:\"b\";s:35:\"force_delete_recruitment_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:889;a:4:{s:1:\"a\";i:890;s:1:\"b\";s:39:\"force_delete_any_recruitment_department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:890;a:4:{s:1:\"a\";i:891;s:1:\"b\";s:37:\"view_any_recruitment_employment::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:891;a:4:{s:1:\"a\";i:892;s:1:\"b\";s:33:\"view_recruitment_employment::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:892;a:4:{s:1:\"a\";i:893;s:1:\"b\";s:35:\"create_recruitment_employment::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:893;a:4:{s:1:\"a\";i:894;s:1:\"b\";s:35:\"update_recruitment_employment::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:894;a:4:{s:1:\"a\";i:895;s:1:\"b\";s:35:\"delete_recruitment_employment::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:895;a:4:{s:1:\"a\";i:896;s:1:\"b\";s:39:\"delete_any_recruitment_employment::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:896;a:4:{s:1:\"a\";i:897;s:1:\"b\";s:36:\"reorder_recruitment_employment::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:897;a:4:{s:1:\"a\";i:898;s:1:\"b\";s:34:\"view_any_recruitment_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:898;a:4:{s:1:\"a\";i:899;s:1:\"b\";s:30:\"view_recruitment_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:899;a:4:{s:1:\"a\";i:900;s:1:\"b\";s:32:\"create_recruitment_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:900;a:4:{s:1:\"a\";i:901;s:1:\"b\";s:32:\"update_recruitment_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:901;a:4:{s:1:\"a\";i:902;s:1:\"b\";s:32:\"delete_recruitment_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:902;a:4:{s:1:\"a\";i:903;s:1:\"b\";s:36:\"delete_any_recruitment_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:903;a:4:{s:1:\"a\";i:904;s:1:\"b\";s:33:\"restore_recruitment_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:904;a:4:{s:1:\"a\";i:905;s:1:\"b\";s:37:\"restore_any_recruitment_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:905;a:4:{s:1:\"a\";i:906;s:1:\"b\";s:38:\"force_delete_recruitment_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:906;a:4:{s:1:\"a\";i:907;s:1:\"b\";s:42:\"force_delete_any_recruitment_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:907;a:4:{s:1:\"a\";i:908;s:1:\"b\";s:33:\"reorder_recruitment_job::position\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:908;a:4:{s:1:\"a\";i:909;s:1:\"b\";s:35:\"view_any_recruitment_refuse::reason\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;i:4;i:7;}}i:909;a:4:{s:1:\"a\";i:910;s:1:\"b\";s:31:\"view_recruitment_refuse::reason\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:6;i:3;i:7;}}i:910;a:4:{s:1:\"a\";i:911;s:1:\"b\";s:33:\"create_recruitment_refuse::reason\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;i:4;i:7;}}i:911;a:4:{s:1:\"a\";i:912;s:1:\"b\";s:33:\"update_recruitment_refuse::reason\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:912;a:4:{s:1:\"a\";i:913;s:1:\"b\";s:33:\"delete_recruitment_refuse::reason\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:913;a:4:{s:1:\"a\";i:914;s:1:\"b\";s:37:\"delete_any_recruitment_refuse::reason\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:914;a:4:{s:1:\"a\";i:915;s:1:\"b\";s:34:\"reorder_recruitment_refuse::reason\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:915;a:4:{s:1:\"a\";i:916;s:1:\"b\";s:32:\"view_any_recruitment_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;i:4;i:7;}}i:916;a:4:{s:1:\"a\";i:917;s:1:\"b\";s:28:\"view_recruitment_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:917;a:4:{s:1:\"a\";i:918;s:1:\"b\";s:30:\"create_recruitment_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;}}i:918;a:4:{s:1:\"a\";i:919;s:1:\"b\";s:30:\"update_recruitment_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:919;a:4:{s:1:\"a\";i:920;s:1:\"b\";s:30:\"delete_recruitment_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:920;a:4:{s:1:\"a\";i:921;s:1:\"b\";s:34:\"delete_any_recruitment_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:921;a:4:{s:1:\"a\";i:922;s:1:\"b\";s:31:\"restore_recruitment_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:922;a:4:{s:1:\"a\";i:923;s:1:\"b\";s:35:\"restore_any_recruitment_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:923;a:4:{s:1:\"a\";i:924;s:1:\"b\";s:36:\"force_delete_recruitment_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:924;a:4:{s:1:\"a\";i:925;s:1:\"b\";s:40:\"force_delete_any_recruitment_skill::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:925;a:4:{s:1:\"a\";i:926;s:1:\"b\";s:26:\"view_any_recruitment_stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:6;i:3;i:7;}}i:926;a:4:{s:1:\"a\";i:927;s:1:\"b\";s:22:\"view_recruitment_stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:6;i:3;i:7;}}i:927;a:4:{s:1:\"a\";i:928;s:1:\"b\";s:24:\"create_recruitment_stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:6;i:3;i:7;}}i:928;a:4:{s:1:\"a\";i:929;s:1:\"b\";s:24:\"update_recruitment_stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:929;a:4:{s:1:\"a\";i:930;s:1:\"b\";s:24:\"delete_recruitment_stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:930;a:4:{s:1:\"a\";i:931;s:1:\"b\";s:28:\"delete_any_recruitment_stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:931;a:4:{s:1:\"a\";i:932;s:1:\"b\";s:25:\"reorder_recruitment_stage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:932;a:4:{s:1:\"a\";i:933;s:1:\"b\";s:36:\"view_any_recruitment_u::t::m::medium\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:6;i:3;i:7;}}i:933;a:4:{s:1:\"a\";i:934;s:1:\"b\";s:32:\"view_recruitment_u::t::m::medium\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:934;a:4:{s:1:\"a\";i:935;s:1:\"b\";s:34:\"create_recruitment_u::t::m::medium\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:935;a:4:{s:1:\"a\";i:936;s:1:\"b\";s:34:\"update_recruitment_u::t::m::medium\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:936;a:4:{s:1:\"a\";i:937;s:1:\"b\";s:34:\"delete_recruitment_u::t::m::medium\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:937;a:4:{s:1:\"a\";i:938;s:1:\"b\";s:38:\"delete_any_recruitment_u::t::m::medium\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:938;a:4:{s:1:\"a\";i:939;s:1:\"b\";s:36:\"view_any_recruitment_u::t::m::source\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:939;a:4:{s:1:\"a\";i:940;s:1:\"b\";s:32:\"view_recruitment_u::t::m::source\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:940;a:4:{s:1:\"a\";i:941;s:1:\"b\";s:34:\"create_recruitment_u::t::m::source\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:941;a:4:{s:1:\"a\";i:942;s:1:\"b\";s:34:\"update_recruitment_u::t::m::source\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:942;a:4:{s:1:\"a\";i:943;s:1:\"b\";s:34:\"delete_recruitment_u::t::m::source\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:943;a:4:{s:1:\"a\";i:944;s:1:\"b\";s:38:\"delete_any_recruitment_u::t::m::source\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:944;a:4:{s:1:\"a\";i:945;s:1:\"b\";s:29:\"page_recruitment_recruitments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:945;a:4:{s:1:\"a\";i:946;s:1:\"b\";s:44:\"widget_recruitment_job_position_stats_widget\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:946;a:4:{s:1:\"a\";i:947;s:1:\"b\";s:41:\"widget_recruitment_applicant_chart_widget\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:947;a:4:{s:1:\"a\";i:948;s:1:\"b\";s:31:\"view_any_time_off_accrual::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:948;a:4:{s:1:\"a\";i:949;s:1:\"b\";s:27:\"view_time_off_accrual::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:949;a:4:{s:1:\"a\";i:950;s:1:\"b\";s:29:\"create_time_off_accrual::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:950;a:4:{s:1:\"a\";i:951;s:1:\"b\";s:29:\"update_time_off_accrual::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:951;a:4:{s:1:\"a\";i:952;s:1:\"b\";s:29:\"delete_time_off_accrual::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:952;a:4:{s:1:\"a\";i:953;s:1:\"b\";s:33:\"delete_any_time_off_accrual::plan\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:953;a:4:{s:1:\"a\";i:954;s:1:\"b\";s:32:\"view_any_time_off_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:954;a:4:{s:1:\"a\";i:955;s:1:\"b\";s:28:\"view_time_off_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:955;a:4:{s:1:\"a\";i:956;s:1:\"b\";s:30:\"create_time_off_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:956;a:4:{s:1:\"a\";i:957;s:1:\"b\";s:30:\"update_time_off_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:957;a:4:{s:1:\"a\";i:958;s:1:\"b\";s:30:\"delete_time_off_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:958;a:4:{s:1:\"a\";i:959;s:1:\"b\";s:34:\"delete_any_time_off_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:959;a:4:{s:1:\"a\";i:960;s:1:\"b\";s:31:\"restore_time_off_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:960;a:4:{s:1:\"a\";i:961;s:1:\"b\";s:35:\"restore_any_time_off_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:961;a:4:{s:1:\"a\";i:962;s:1:\"b\";s:36:\"force_delete_time_off_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:962;a:4:{s:1:\"a\";i:963;s:1:\"b\";s:40:\"force_delete_any_time_off_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:963;a:4:{s:1:\"a\";i:964;s:1:\"b\";s:31:\"reorder_time_off_activity::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:964;a:4:{s:1:\"a\";i:965;s:1:\"b\";s:29:\"view_any_time_off_leave::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:965;a:4:{s:1:\"a\";i:966;s:1:\"b\";s:25:\"view_time_off_leave::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:966;a:4:{s:1:\"a\";i:967;s:1:\"b\";s:27:\"create_time_off_leave::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:967;a:4:{s:1:\"a\";i:968;s:1:\"b\";s:27:\"update_time_off_leave::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:968;a:4:{s:1:\"a\";i:969;s:1:\"b\";s:27:\"delete_time_off_leave::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:969;a:4:{s:1:\"a\";i:970;s:1:\"b\";s:31:\"delete_any_time_off_leave::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:970;a:4:{s:1:\"a\";i:971;s:1:\"b\";s:28:\"restore_time_off_leave::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:971;a:4:{s:1:\"a\";i:972;s:1:\"b\";s:32:\"restore_any_time_off_leave::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:972;a:4:{s:1:\"a\";i:973;s:1:\"b\";s:33:\"force_delete_time_off_leave::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:973;a:4:{s:1:\"a\";i:974;s:1:\"b\";s:37:\"force_delete_any_time_off_leave::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:974;a:4:{s:1:\"a\";i:975;s:1:\"b\";s:28:\"reorder_time_off_leave::type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:975;a:4:{s:1:\"a\";i:976;s:1:\"b\";s:32:\"view_any_time_off_mandatory::day\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:976;a:4:{s:1:\"a\";i:977;s:1:\"b\";s:28:\"view_time_off_mandatory::day\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:977;a:4:{s:1:\"a\";i:978;s:1:\"b\";s:30:\"create_time_off_mandatory::day\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:978;a:4:{s:1:\"a\";i:979;s:1:\"b\";s:30:\"update_time_off_mandatory::day\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:979;a:4:{s:1:\"a\";i:980;s:1:\"b\";s:30:\"delete_time_off_mandatory::day\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:980;a:4:{s:1:\"a\";i:981;s:1:\"b\";s:34:\"delete_any_time_off_mandatory::day\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:981;a:4:{s:1:\"a\";i:982;s:1:\"b\";s:33:\"view_any_time_off_public::holiday\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:982;a:4:{s:1:\"a\";i:983;s:1:\"b\";s:29:\"view_time_off_public::holiday\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:983;a:4:{s:1:\"a\";i:984;s:1:\"b\";s:31:\"create_time_off_public::holiday\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:984;a:4:{s:1:\"a\";i:985;s:1:\"b\";s:31:\"update_time_off_public::holiday\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:985;a:4:{s:1:\"a\";i:986;s:1:\"b\";s:31:\"delete_time_off_public::holiday\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:986;a:4:{s:1:\"a\";i:987;s:1:\"b\";s:35:\"delete_any_time_off_public::holiday\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:987;a:4:{s:1:\"a\";i:988;s:1:\"b\";s:28:\"view_any_time_off_allocation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:988;a:4:{s:1:\"a\";i:989;s:1:\"b\";s:24:\"view_time_off_allocation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:7;i:3;i:8;}}i:989;a:4:{s:1:\"a\";i:990;s:1:\"b\";s:26:\"create_time_off_allocation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:990;a:4:{s:1:\"a\";i:991;s:1:\"b\";s:26:\"update_time_off_allocation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:991;a:4:{s:1:\"a\";i:992;s:1:\"b\";s:26:\"delete_time_off_allocation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:992;a:4:{s:1:\"a\";i:993;s:1:\"b\";s:30:\"delete_any_time_off_allocation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:993;a:4:{s:1:\"a\";i:994;s:1:\"b\";s:27:\"view_any_time_off_time::off\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:994;a:4:{s:1:\"a\";i:995;s:1:\"b\";s:23:\"view_time_off_time::off\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:7;i:3;i:8;}}i:995;a:4:{s:1:\"a\";i:996;s:1:\"b\";s:25:\"create_time_off_time::off\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:996;a:4:{s:1:\"a\";i:997;s:1:\"b\";s:25:\"update_time_off_time::off\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:997;a:4:{s:1:\"a\";i:998;s:1:\"b\";s:25:\"delete_time_off_time::off\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:998;a:4:{s:1:\"a\";i:999;s:1:\"b\";s:29:\"delete_any_time_off_time::off\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:999;a:4:{s:1:\"a\";i:1000;s:1:\"b\";s:32:\"view_any_time_off_my::allocation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:1000;a:4:{s:1:\"a\";i:1001;s:1:\"b\";s:28:\"view_time_off_my::allocation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:1001;a:4:{s:1:\"a\";i:1002;s:1:\"b\";s:30:\"create_time_off_my::allocation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:1002;a:4:{s:1:\"a\";i:1003;s:1:\"b\";s:30:\"update_time_off_my::allocation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:1003;a:4:{s:1:\"a\";i:1004;s:1:\"b\";s:30:\"delete_time_off_my::allocation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1004;a:4:{s:1:\"a\";i:1005;s:1:\"b\";s:34:\"delete_any_time_off_my::allocation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1005;a:4:{s:1:\"a\";i:1006;s:1:\"b\";s:31:\"view_any_time_off_my::time::off\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:1006;a:4:{s:1:\"a\";i:1007;s:1:\"b\";s:27:\"view_time_off_my::time::off\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:1007;a:4:{s:1:\"a\";i:1008;s:1:\"b\";s:29:\"create_time_off_my::time::off\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:1008;a:4:{s:1:\"a\";i:1009;s:1:\"b\";s:29:\"update_time_off_my::time::off\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:1009;a:4:{s:1:\"a\";i:1010;s:1:\"b\";s:29:\"delete_time_off_my::time::off\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1010;a:4:{s:1:\"a\";i:1011;s:1:\"b\";s:33:\"delete_any_time_off_my::time::off\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1011;a:4:{s:1:\"a\";i:1012;s:1:\"b\";s:30:\"view_any_time_off_by::employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:1012;a:4:{s:1:\"a\";i:1013;s:1:\"b\";s:26:\"view_time_off_by::employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:1013;a:4:{s:1:\"a\";i:1014;s:1:\"b\";s:28:\"create_time_off_by::employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:1014;a:4:{s:1:\"a\";i:1015;s:1:\"b\";s:28:\"update_time_off_by::employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:1015;a:4:{s:1:\"a\";i:1016;s:1:\"b\";s:28:\"delete_time_off_by::employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:1016;a:4:{s:1:\"a\";i:1017;s:1:\"b\";s:32:\"delete_any_time_off_by::employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:1017;a:4:{s:1:\"a\";i:1018;s:1:\"b\";s:21:\"page_time_off_by_type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1018;a:4:{s:1:\"a\";i:1019;s:1:\"b\";s:23:\"page_time_off_dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1019;a:4:{s:1:\"a\";i:1020;s:1:\"b\";s:22:\"page_time_off_overview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1020;a:4:{s:1:\"a\";i:1021;s:1:\"b\";s:31:\"widget_time_off_calendar_widget\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1021;a:4:{s:1:\"a\";i:1022;s:1:\"b\";s:34:\"widget_time_off_my_time_off_widget\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1022;a:4:{s:1:\"a\";i:1023;s:1:\"b\";s:40:\"widget_time_off_overview_calendar_widget\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1023;a:4:{s:1:\"a\";i:1024;s:1:\"b\";s:33:\"widget_time_off_leave_type_widget\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1024;a:4:{s:1:\"a\";i:1025;s:1:\"b\";s:28:\"view_any_timesheet_timesheet\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:1025;a:4:{s:1:\"a\";i:1026;s:1:\"b\";s:26:\"create_timesheet_timesheet\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;i:4;i:8;}}i:1026;a:4:{s:1:\"a\";i:1027;s:1:\"b\";s:26:\"update_timesheet_timesheet\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:1027;a:4:{s:1:\"a\";i:1028;s:1:\"b\";s:26:\"delete_timesheet_timesheet\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1028;a:4:{s:1:\"a\";i:1029;s:1:\"b\";s:30:\"delete_any_timesheet_timesheet\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1029;a:4:{s:1:\"a\";i:1030;s:1:\"b\";s:30:\"view_any_invoice_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1030;a:4:{s:1:\"a\";i:1031;s:1:\"b\";s:26:\"view_invoice_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1031;a:4:{s:1:\"a\";i:1032;s:1:\"b\";s:28:\"create_invoice_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1032;a:4:{s:1:\"a\";i:1033;s:1:\"b\";s:28:\"update_invoice_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1033;a:4:{s:1:\"a\";i:1034;s:1:\"b\";s:28:\"delete_invoice_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1034;a:4:{s:1:\"a\";i:1035;s:1:\"b\";s:32:\"delete_any_invoice_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1035;a:4:{s:1:\"a\";i:1036;s:1:\"b\";s:29:\"restore_invoice_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1036;a:4:{s:1:\"a\";i:1037;s:1:\"b\";s:33:\"restore_any_invoice_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1037;a:4:{s:1:\"a\";i:1038;s:1:\"b\";s:34:\"force_delete_invoice_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1038;a:4:{s:1:\"a\";i:1039;s:1:\"b\";s:38:\"force_delete_any_invoice_bank::account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1039;a:4:{s:1:\"a\";i:1040;s:1:\"b\";s:25:\"view_any_invoice_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1040;a:4:{s:1:\"a\";i:1041;s:1:\"b\";s:21:\"view_invoice_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1041;a:4:{s:1:\"a\";i:1042;s:1:\"b\";s:23:\"create_invoice_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1042;a:4:{s:1:\"a\";i:1043;s:1:\"b\";s:23:\"update_invoice_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1043;a:4:{s:1:\"a\";i:1044;s:1:\"b\";s:23:\"delete_invoice_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1044;a:4:{s:1:\"a\";i:1045;s:1:\"b\";s:27:\"delete_any_invoice_currency\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1045;a:4:{s:1:\"a\";i:1046;s:1:\"b\";s:25:\"view_any_invoice_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1046;a:4:{s:1:\"a\";i:1047;s:1:\"b\";s:21:\"view_invoice_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1047;a:4:{s:1:\"a\";i:1048;s:1:\"b\";s:23:\"create_invoice_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1048;a:4:{s:1:\"a\";i:1049;s:1:\"b\";s:23:\"update_invoice_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1049;a:4:{s:1:\"a\";i:1050;s:1:\"b\";s:23:\"delete_invoice_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1050;a:4:{s:1:\"a\";i:1051;s:1:\"b\";s:27:\"delete_any_invoice_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1051;a:4:{s:1:\"a\";i:1052;s:1:\"b\";s:24:\"restore_invoice_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1052;a:4:{s:1:\"a\";i:1053;s:1:\"b\";s:28:\"restore_any_invoice_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1053;a:4:{s:1:\"a\";i:1054;s:1:\"b\";s:29:\"force_delete_invoice_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1054;a:4:{s:1:\"a\";i:1055;s:1:\"b\";s:33:\"force_delete_any_invoice_incoterm\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1055;a:4:{s:1:\"a\";i:1056;s:1:\"b\";s:30:\"view_any_invoice_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1056;a:4:{s:1:\"a\";i:1057;s:1:\"b\";s:26:\"view_invoice_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1057;a:4:{s:1:\"a\";i:1058;s:1:\"b\";s:28:\"create_invoice_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1058;a:4:{s:1:\"a\";i:1059;s:1:\"b\";s:28:\"update_invoice_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1059;a:4:{s:1:\"a\";i:1060;s:1:\"b\";s:28:\"delete_invoice_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1060;a:4:{s:1:\"a\";i:1061;s:1:\"b\";s:32:\"delete_any_invoice_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1061;a:4:{s:1:\"a\";i:1062;s:1:\"b\";s:29:\"restore_invoice_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1062;a:4:{s:1:\"a\";i:1063;s:1:\"b\";s:33:\"restore_any_invoice_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1063;a:4:{s:1:\"a\";i:1064;s:1:\"b\";s:34:\"force_delete_invoice_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1064;a:4:{s:1:\"a\";i:1065;s:1:\"b\";s:38:\"force_delete_any_invoice_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1065;a:4:{s:1:\"a\";i:1066;s:1:\"b\";s:29:\"reorder_invoice_payment::term\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1066;a:4:{s:1:\"a\";i:1067;s:1:\"b\";s:35:\"view_any_invoice_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1067;a:4:{s:1:\"a\";i:1068;s:1:\"b\";s:31:\"view_invoice_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1068;a:4:{s:1:\"a\";i:1069;s:1:\"b\";s:33:\"create_invoice_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1069;a:4:{s:1:\"a\";i:1070;s:1:\"b\";s:33:\"update_invoice_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1070;a:4:{s:1:\"a\";i:1071;s:1:\"b\";s:33:\"delete_invoice_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1071;a:4:{s:1:\"a\";i:1072;s:1:\"b\";s:37:\"delete_any_invoice_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1072;a:4:{s:1:\"a\";i:1073;s:1:\"b\";s:34:\"restore_invoice_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1073;a:4:{s:1:\"a\";i:1074;s:1:\"b\";s:38:\"restore_any_invoice_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1074;a:4:{s:1:\"a\";i:1075;s:1:\"b\";s:39:\"force_delete_invoice_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1075;a:4:{s:1:\"a\";i:1076;s:1:\"b\";s:43:\"force_delete_any_invoice_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1076;a:4:{s:1:\"a\";i:1077;s:1:\"b\";s:34:\"reorder_invoice_product::attribute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1077;a:4:{s:1:\"a\";i:1078;s:1:\"b\";s:34:\"view_any_invoice_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:1078;a:4:{s:1:\"a\";i:1079;s:1:\"b\";s:30:\"view_invoice_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:1079;a:4:{s:1:\"a\";i:1080;s:1:\"b\";s:32:\"create_invoice_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:1080;a:4:{s:1:\"a\";i:1081;s:1:\"b\";s:32:\"update_invoice_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:1081;a:4:{s:1:\"a\";i:1082;s:1:\"b\";s:32:\"delete_invoice_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1082;a:4:{s:1:\"a\";i:1083;s:1:\"b\";s:36:\"delete_any_invoice_product::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1083;a:4:{s:1:\"a\";i:1084;s:1:\"b\";s:27:\"view_any_invoice_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1084;a:4:{s:1:\"a\";i:1085;s:1:\"b\";s:23:\"view_invoice_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1085;a:4:{s:1:\"a\";i:1086;s:1:\"b\";s:25:\"create_invoice_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1086;a:4:{s:1:\"a\";i:1087;s:1:\"b\";s:25:\"update_invoice_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1087;a:4:{s:1:\"a\";i:1088;s:1:\"b\";s:25:\"delete_invoice_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1088;a:4:{s:1:\"a\";i:1089;s:1:\"b\";s:29:\"delete_any_invoice_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1089;a:4:{s:1:\"a\";i:1090;s:1:\"b\";s:26:\"reorder_invoice_tax::group\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1090;a:4:{s:1:\"a\";i:1091;s:1:\"b\";s:20:\"view_any_invoice_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1091;a:4:{s:1:\"a\";i:1092;s:1:\"b\";s:16:\"view_invoice_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1092;a:4:{s:1:\"a\";i:1093;s:1:\"b\";s:18:\"create_invoice_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1093;a:4:{s:1:\"a\";i:1094;s:1:\"b\";s:18:\"update_invoice_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1094;a:4:{s:1:\"a\";i:1095;s:1:\"b\";s:18:\"delete_invoice_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1095;a:4:{s:1:\"a\";i:1096;s:1:\"b\";s:22:\"delete_any_invoice_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1096;a:4:{s:1:\"a\";i:1097;s:1:\"b\";s:19:\"reorder_invoice_tax\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1097;a:4:{s:1:\"a\";i:1098;s:1:\"b\";s:29:\"view_any_invoice_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1098;a:4:{s:1:\"a\";i:1099;s:1:\"b\";s:25:\"view_invoice_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1099;a:4:{s:1:\"a\";i:1100;s:1:\"b\";s:27:\"create_invoice_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1100;a:4:{s:1:\"a\";i:1101;s:1:\"b\";s:27:\"update_invoice_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1101;a:4:{s:1:\"a\";i:1102;s:1:\"b\";s:27:\"delete_invoice_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1102;a:4:{s:1:\"a\";i:1103;s:1:\"b\";s:31:\"delete_any_invoice_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1103;a:4:{s:1:\"a\";i:1104;s:1:\"b\";s:28:\"reorder_invoice_credit::note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1104;a:4:{s:1:\"a\";i:1105;s:1:\"b\";s:25:\"view_any_invoice_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1105;a:4:{s:1:\"a\";i:1106;s:1:\"b\";s:21:\"view_invoice_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1106;a:4:{s:1:\"a\";i:1107;s:1:\"b\";s:23:\"create_invoice_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1107;a:4:{s:1:\"a\";i:1108;s:1:\"b\";s:23:\"update_invoice_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1108;a:4:{s:1:\"a\";i:1109;s:1:\"b\";s:23:\"delete_invoice_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1109;a:4:{s:1:\"a\";i:1110;s:1:\"b\";s:27:\"delete_any_invoice_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1110;a:4:{s:1:\"a\";i:1111;s:1:\"b\";s:24:\"restore_invoice_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1111;a:4:{s:1:\"a\";i:1112;s:1:\"b\";s:28:\"restore_any_invoice_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1112;a:4:{s:1:\"a\";i:1113;s:1:\"b\";s:29:\"force_delete_invoice_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1113;a:4:{s:1:\"a\";i:1114;s:1:\"b\";s:33:\"force_delete_any_invoice_customer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1114;a:4:{s:1:\"a\";i:1115;s:1:\"b\";s:24:\"view_any_invoice_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1115;a:4:{s:1:\"a\";i:1116;s:1:\"b\";s:20:\"view_invoice_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1116;a:4:{s:1:\"a\";i:1117;s:1:\"b\";s:22:\"create_invoice_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1117;a:4:{s:1:\"a\";i:1118;s:1:\"b\";s:22:\"update_invoice_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1118;a:4:{s:1:\"a\";i:1119;s:1:\"b\";s:22:\"delete_invoice_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1119;a:4:{s:1:\"a\";i:1120;s:1:\"b\";s:26:\"delete_any_invoice_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1120;a:4:{s:1:\"a\";i:1121;s:1:\"b\";s:23:\"reorder_invoice_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1121;a:4:{s:1:\"a\";i:1122;s:1:\"b\";s:24:\"view_any_invoice_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1122;a:4:{s:1:\"a\";i:1123;s:1:\"b\";s:20:\"view_invoice_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1123;a:4:{s:1:\"a\";i:1124;s:1:\"b\";s:22:\"create_invoice_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1124;a:4:{s:1:\"a\";i:1125;s:1:\"b\";s:22:\"update_invoice_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1125;a:4:{s:1:\"a\";i:1126;s:1:\"b\";s:22:\"delete_invoice_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1126;a:4:{s:1:\"a\";i:1127;s:1:\"b\";s:26:\"delete_any_invoice_payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1127;a:4:{s:1:\"a\";i:1128;s:1:\"b\";s:24:\"view_any_invoice_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:1128;a:4:{s:1:\"a\";i:1129;s:1:\"b\";s:20:\"view_invoice_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:1129;a:4:{s:1:\"a\";i:1130;s:1:\"b\";s:22:\"create_invoice_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1130;a:4:{s:1:\"a\";i:1131;s:1:\"b\";s:22:\"update_invoice_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1131;a:4:{s:1:\"a\";i:1132;s:1:\"b\";s:22:\"delete_invoice_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1132;a:4:{s:1:\"a\";i:1133;s:1:\"b\";s:26:\"delete_any_invoice_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1133;a:4:{s:1:\"a\";i:1134;s:1:\"b\";s:23:\"restore_invoice_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1134;a:4:{s:1:\"a\";i:1135;s:1:\"b\";s:27:\"restore_any_invoice_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1135;a:4:{s:1:\"a\";i:1136;s:1:\"b\";s:28:\"force_delete_invoice_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1136;a:4:{s:1:\"a\";i:1137;s:1:\"b\";s:32:\"force_delete_any_invoice_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1137;a:4:{s:1:\"a\";i:1138;s:1:\"b\";s:23:\"reorder_invoice_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1138;a:4:{s:1:\"a\";i:1139;s:1:\"b\";s:21:\"view_any_invoice_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1139;a:4:{s:1:\"a\";i:1140;s:1:\"b\";s:17:\"view_invoice_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1140;a:4:{s:1:\"a\";i:1141;s:1:\"b\";s:19:\"create_invoice_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1141;a:4:{s:1:\"a\";i:1142;s:1:\"b\";s:19:\"update_invoice_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1142;a:4:{s:1:\"a\";i:1143;s:1:\"b\";s:19:\"delete_invoice_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1143;a:4:{s:1:\"a\";i:1144;s:1:\"b\";s:23:\"delete_any_invoice_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1144;a:4:{s:1:\"a\";i:1145;s:1:\"b\";s:20:\"reorder_invoice_bill\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1145;a:4:{s:1:\"a\";i:1146;s:1:\"b\";s:23:\"view_any_invoice_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1146;a:4:{s:1:\"a\";i:1147;s:1:\"b\";s:19:\"view_invoice_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1147;a:4:{s:1:\"a\";i:1148;s:1:\"b\";s:21:\"create_invoice_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1148;a:4:{s:1:\"a\";i:1149;s:1:\"b\";s:21:\"update_invoice_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1149;a:4:{s:1:\"a\";i:1150;s:1:\"b\";s:21:\"delete_invoice_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1150;a:4:{s:1:\"a\";i:1151;s:1:\"b\";s:25:\"delete_any_invoice_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1151;a:4:{s:1:\"a\";i:1152;s:1:\"b\";s:22:\"reorder_invoice_refund\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1152;a:4:{s:1:\"a\";i:1153;s:1:\"b\";s:23:\"view_any_invoice_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1153;a:4:{s:1:\"a\";i:1154;s:1:\"b\";s:19:\"view_invoice_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1154;a:4:{s:1:\"a\";i:1155;s:1:\"b\";s:21:\"create_invoice_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1155;a:4:{s:1:\"a\";i:1156;s:1:\"b\";s:21:\"update_invoice_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1156;a:4:{s:1:\"a\";i:1157;s:1:\"b\";s:21:\"delete_invoice_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1157;a:4:{s:1:\"a\";i:1158;s:1:\"b\";s:25:\"delete_any_invoice_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1158;a:4:{s:1:\"a\";i:1159;s:1:\"b\";s:22:\"restore_invoice_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1159;a:4:{s:1:\"a\";i:1160;s:1:\"b\";s:26:\"restore_any_invoice_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1160;a:4:{s:1:\"a\";i:1161;s:1:\"b\";s:27:\"force_delete_invoice_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1161;a:4:{s:1:\"a\";i:1162;s:1:\"b\";s:31:\"force_delete_any_invoice_vendor\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1162;a:4:{s:1:\"a\";i:1163;s:1:\"b\";s:21:\"page_invoice_products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1163;a:4:{s:1:\"a\";i:1164;s:1:\"b\";s:22:\"view_any_blog_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:7;}}i:1164;a:4:{s:1:\"a\";i:1165;s:1:\"b\";s:18:\"view_blog_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:1165;a:4:{s:1:\"a\";i:1166;s:1:\"b\";s:20:\"create_blog_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:1166;a:4:{s:1:\"a\";i:1167;s:1:\"b\";s:20:\"update_blog_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1167;a:4:{s:1:\"a\";i:1168;s:1:\"b\";s:20:\"delete_blog_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1168;a:4:{s:1:\"a\";i:1169;s:1:\"b\";s:24:\"delete_any_blog_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1169;a:4:{s:1:\"a\";i:1170;s:1:\"b\";s:21:\"restore_blog_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1170;a:4:{s:1:\"a\";i:1171;s:1:\"b\";s:25:\"restore_any_blog_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1171;a:4:{s:1:\"a\";i:1172;s:1:\"b\";s:26:\"force_delete_blog_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1172;a:4:{s:1:\"a\";i:1173;s:1:\"b\";s:30:\"force_delete_any_blog_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1173;a:4:{s:1:\"a\";i:1174;s:1:\"b\";s:17:\"view_any_blog_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:7;}}i:1174;a:4:{s:1:\"a\";i:1175;s:1:\"b\";s:13:\"view_blog_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:7;}}i:1175;a:4:{s:1:\"a\";i:1176;s:1:\"b\";s:15:\"create_blog_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:1176;a:4:{s:1:\"a\";i:1177;s:1:\"b\";s:15:\"update_blog_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:1177;a:4:{s:1:\"a\";i:1178;s:1:\"b\";s:15:\"delete_blog_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1178;a:4:{s:1:\"a\";i:1179;s:1:\"b\";s:19:\"delete_any_blog_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1179;a:4:{s:1:\"a\";i:1180;s:1:\"b\";s:16:\"restore_blog_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1180;a:4:{s:1:\"a\";i:1181;s:1:\"b\";s:20:\"restore_any_blog_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1181;a:4:{s:1:\"a\";i:1182;s:1:\"b\";s:21:\"force_delete_blog_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1182;a:4:{s:1:\"a\";i:1183;s:1:\"b\";s:25:\"force_delete_any_blog_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1183;a:4:{s:1:\"a\";i:1184;s:1:\"b\";s:16:\"reorder_blog_tag\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1184;a:4:{s:1:\"a\";i:1185;s:1:\"b\";s:18:\"view_any_blog_post\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;i:4;i:7;}}i:1185;a:4:{s:1:\"a\";i:1186;s:1:\"b\";s:14:\"view_blog_post\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;i:4;i:7;}}i:1186;a:4:{s:1:\"a\";i:1187;s:1:\"b\";s:16:\"create_blog_post\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:6;i:4;i:7;}}i:1187;a:4:{s:1:\"a\";i:1188;s:1:\"b\";s:16:\"update_blog_post\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:6;}}i:1188;a:4:{s:1:\"a\";i:1189;s:1:\"b\";s:16:\"delete_blog_post\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1189;a:4:{s:1:\"a\";i:1190;s:1:\"b\";s:20:\"delete_any_blog_post\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1190;a:4:{s:1:\"a\";i:1191;s:1:\"b\";s:17:\"restore_blog_post\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1191;a:4:{s:1:\"a\";i:1192;s:1:\"b\";s:21:\"restore_any_blog_post\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1192;a:4:{s:1:\"a\";i:1193;s:1:\"b\";s:22:\"force_delete_blog_post\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1193;a:4:{s:1:\"a\";i:1194;s:1:\"b\";s:26:\"force_delete_any_blog_post\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:1194;a:4:{s:1:\"a\";i:1195;s:1:\"b\";s:30:\"view_employee_employee::review\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:8;}}i:1195;a:4:{s:1:\"a\";i:1196;s:1:\"b\";s:45:\"view_any_documentation_documentation::article\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:8;}}i:1196;a:4:{s:1:\"a\";i:1197;s:1:\"b\";s:41:\"view_documentation_documentation::article\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:8;}}i:1197;a:3:{s:1:\"a\";i:1198;s:1:\"b\";s:43:\"create_documentation_documentation::article\";s:1:\"c\";s:3:\"web\";}i:1198;a:3:{s:1:\"a\";i:1199;s:1:\"b\";s:43:\"update_documentation_documentation::article\";s:1:\"c\";s:3:\"web\";}i:1199;a:3:{s:1:\"a\";i:1200;s:1:\"b\";s:43:\"delete_documentation_documentation::article\";s:1:\"c\";s:3:\"web\";}i:1200;a:3:{s:1:\"a\";i:1201;s:1:\"b\";s:44:\"restore_documentation_documentation::article\";s:1:\"c\";s:3:\"web\";}i:1201;a:3:{s:1:\"a\";i:1202;s:1:\"b\";s:47:\"delete_any_documentation_documentation::article\";s:1:\"c\";s:3:\"web\";}i:1202;a:3:{s:1:\"a\";i:1203;s:1:\"b\";s:49:\"force_delete_documentation_documentation::article\";s:1:\"c\";s:3:\"web\";}i:1203;a:3:{s:1:\"a\";i:1204;s:1:\"b\";s:53:\"force_delete_any_documentation_documentation::article\";s:1:\"c\";s:3:\"web\";}i:1204;a:3:{s:1:\"a\";i:1205;s:1:\"b\";s:48:\"restore_any_documentation_documentation::article\";s:1:\"c\";s:3:\"web\";}i:1205;a:3:{s:1:\"a\";i:1206;s:1:\"b\";s:44:\"reorder_documentation_documentation::article\";s:1:\"c\";s:3:\"web\";}i:1206;a:3:{s:1:\"a\";i:1207;s:1:\"b\";s:34:\"view_any_employee_employee::review\";s:1:\"c\";s:3:\"web\";}i:1207;a:3:{s:1:\"a\";i:1208;s:1:\"b\";s:32:\"create_employee_employee::review\";s:1:\"c\";s:3:\"web\";}i:1208;a:3:{s:1:\"a\";i:1209;s:1:\"b\";s:32:\"update_employee_employee::review\";s:1:\"c\";s:3:\"web\";}i:1209;a:3:{s:1:\"a\";i:1210;s:1:\"b\";s:32:\"delete_employee_employee::review\";s:1:\"c\";s:3:\"web\";}i:1210;a:3:{s:1:\"a\";i:1211;s:1:\"b\";s:36:\"delete_any_employee_employee::review\";s:1:\"c\";s:3:\"web\";}i:1211;a:3:{s:1:\"a\";i:1212;s:1:\"b\";s:33:\"restore_employee_employee::review\";s:1:\"c\";s:3:\"web\";}i:1212;a:3:{s:1:\"a\";i:1213;s:1:\"b\";s:37:\"restore_any_employee_employee::review\";s:1:\"c\";s:3:\"web\";}i:1213;a:3:{s:1:\"a\";i:1214;s:1:\"b\";s:38:\"force_delete_employee_employee::review\";s:1:\"c\";s:3:\"web\";}i:1214;a:3:{s:1:\"a\";i:1215;s:1:\"b\";s:42:\"force_delete_any_employee_employee::review\";s:1:\"c\";s:3:\"web\";}i:1215;a:3:{s:1:\"a\";i:1216;s:1:\"b\";s:32:\"page_documentation_documentation\";s:1:\"c\";s:3:\"web\";}}s:5:\"roles\";a:8:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"j\";i:1;s:1:\"b\";s:5:\"Admin\";s:1:\"c\";s:3:\"web\";}i:1;a:4:{s:1:\"a\";i:2;s:1:\"j\";i:0;s:1:\"b\";s:15:\"Assistant Admin\";s:1:\"c\";s:3:\"web\";}i:2;a:4:{s:1:\"a\";i:7;s:1:\"j\";i:0;s:1:\"b\";s:16:\"Human resources \";s:1:\"c\";s:3:\"web\";}i:3;a:4:{s:1:\"a\";i:3;s:1:\"j\";i:0;s:1:\"b\";s:20:\"Marketing and sales \";s:1:\"c\";s:3:\"web\";}i:4;a:4:{s:1:\"a\";i:4;s:1:\"j\";i:0;s:1:\"b\";s:17:\"Head of products \";s:1:\"c\";s:3:\"web\";}i:5;a:4:{s:1:\"a\";i:8;s:1:\"j\";i:0;s:1:\"b\";s:8:\"Employee\";s:1:\"c\";s:3:\"web\";}i:6;a:4:{s:1:\"a\";i:5;s:1:\"j\";i:0;s:1:\"b\";s:16:\"Business and AI \";s:1:\"c\";s:3:\"web\";}i:7;a:4:{s:1:\"a\";i:6;s:1:\"j\";i:0;s:1:\"b\";s:17:\"Legal Department \";s:1:\"c\";s:3:\"web\";}}}',1778281913);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `calendar_attendances`
--

DROP TABLE IF EXISTS `calendar_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_attendances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort Order',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `day_of_week` varchar(255) NOT NULL COMMENT 'Day of Week',
  `day_period` varchar(255) NOT NULL COMMENT 'Day Period',
  `week_type` varchar(255) DEFAULT NULL COMMENT 'Week Type',
  `display_type` varchar(255) DEFAULT NULL COMMENT 'Display Type',
  `date_from` varchar(255) DEFAULT NULL COMMENT 'Date From',
  `date_to` varchar(255) DEFAULT NULL COMMENT 'Date To',
  `duration_days` varchar(255) DEFAULT NULL COMMENT 'Durations Days',
  `hour_from` varchar(255) NOT NULL COMMENT 'Hour From',
  `hour_to` varchar(255) NOT NULL COMMENT 'Hour To',
  `calendar_id` bigint(20) unsigned NOT NULL COMMENT 'Calendar ID',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_attendances_calendar_id_foreign` (`calendar_id`),
  KEY `calendar_attendances_creator_id_foreign` (`creator_id`),
  CONSTRAINT `calendar_attendances_calendar_id_foreign` FOREIGN KEY (`calendar_id`) REFERENCES `calendars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `calendar_attendances_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_attendances`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `calendar_attendances` WRITE;
/*!40000 ALTER TABLE `calendar_attendances` DISABLE KEYS */;
INSERT INTO `calendar_attendances` VALUES
(1,10,'Monday Morning','monday','morning',NULL,NULL,NULL,NULL,'0.5','8','12',1,NULL,NULL,NULL),
(2,10,'Monday Lunch','monday','lunch',NULL,NULL,NULL,NULL,'0','12','13',1,NULL,NULL,NULL),
(3,10,'Monday Afternoon','monday','afternoon',NULL,NULL,NULL,NULL,'0.5','13','16',1,NULL,NULL,NULL),
(4,10,'Tuesday Morning','tuesday','morning',NULL,NULL,NULL,NULL,'0.5','8','12',1,NULL,NULL,NULL),
(5,10,'Tuesday Lunch','tuesday','lunch',NULL,NULL,NULL,NULL,'0','12','13',1,NULL,NULL,NULL),
(6,10,'Tuesday Afternoon','tuesday','afternoon',NULL,NULL,NULL,NULL,'0.5','13','16',1,NULL,NULL,NULL),
(7,10,'Wednesday Morning','wednesday','morning',NULL,NULL,NULL,NULL,'0.5','8','12',1,NULL,NULL,NULL),
(8,10,'Wednesday Lunch','wednesday','lunch',NULL,NULL,NULL,NULL,'0','12','13',1,NULL,NULL,NULL),
(9,10,'Wednesday Afternoon','wednesday','afternoon',NULL,NULL,NULL,NULL,'0.5','13','16',1,NULL,NULL,NULL),
(10,10,'Thursday Morning','thursday','morning',NULL,NULL,NULL,NULL,'0.5','8','12',1,NULL,NULL,NULL),
(11,10,'Thursday Lunch','thursday','lunch',NULL,NULL,NULL,NULL,'0','12','13',1,NULL,NULL,NULL),
(12,10,'Thursday Afternoon','thursday','afternoon',NULL,NULL,NULL,NULL,'0.5','13','16',1,NULL,NULL,NULL),
(13,10,'Friday Morning','friday','morning',NULL,NULL,NULL,NULL,'0.5','8','12',1,NULL,NULL,NULL),
(14,10,'Friday Lunch','friday','lunch',NULL,NULL,NULL,NULL,'0','12','13',1,NULL,NULL,NULL),
(15,10,'Friday Afternoon','friday','afternoon',NULL,NULL,NULL,NULL,'0.5','13','16',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `calendar_attendances` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `calendar_leaves`
--

DROP TABLE IF EXISTS `calendar_leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_leaves` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `time_type` varchar(255) NOT NULL,
  `date_from` varchar(255) NOT NULL,
  `date_to` varchar(255) NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `calendar_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_leaves_company_id_foreign` (`company_id`),
  KEY `calendar_leaves_calendar_id_foreign` (`calendar_id`),
  KEY `calendar_leaves_creator_id_foreign` (`creator_id`),
  CONSTRAINT `calendar_leaves_calendar_id_foreign` FOREIGN KEY (`calendar_id`) REFERENCES `calendars` (`id`) ON DELETE SET NULL,
  CONSTRAINT `calendar_leaves_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `calendar_leaves_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_leaves`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `calendar_leaves` WRITE;
/*!40000 ALTER TABLE `calendar_leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_leaves` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `calendars`
--

DROP TABLE IF EXISTS `calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `timezone` varchar(255) NOT NULL COMMENT 'Timezone',
  `hours_per_day` double DEFAULT NULL COMMENT 'Average Hour per Day',
  `is_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Status',
  `two_weeks_calendar` tinyint(1) DEFAULT 0 COMMENT 'Calendar in 2 weeks mode',
  `flexible_hours` tinyint(1) DEFAULT 0 COMMENT 'Flexible Hours',
  `full_time_required_hours` double DEFAULT NULL COMMENT 'Company Full Time',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendars_creator_id_foreign` (`creator_id`),
  KEY `calendars_company_id_foreign` (`company_id`),
  CONSTRAINT `calendars_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `calendars_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendars`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `calendars` WRITE;
/*!40000 ALTER TABLE `calendars` DISABLE KEYS */;
INSERT INTO `calendars` VALUES
(1,'Standard 38 hours/week','Europe/Brussels',7,1,0,0,38,NULL,NULL,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(2,'Flexible 40 hours/week','Europe/Brussels',8,1,0,1,40,NULL,NULL,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(3,'Standard 35 hours/week','Europe/Brussels',7,1,0,0,35,NULL,NULL,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(4,'Standard 40 hours/week','UTC',8,1,0,1,40,NULL,NULL,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25');
/*!40000 ALTER TABLE `calendars` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `chatter_attachments`
--

DROP TABLE IF EXISTS `chatter_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatter_attachments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `message_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Message',
  `file_size` varchar(255) DEFAULT NULL COMMENT 'File Size',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `messageable_type` varchar(255) NOT NULL,
  `messageable_id` bigint(20) unsigned NOT NULL,
  `file_path` varchar(255) DEFAULT NULL COMMENT 'File Path',
  `original_file_name` varchar(255) DEFAULT NULL COMMENT 'Original File Name',
  `mime_type` varchar(255) DEFAULT NULL COMMENT 'Mime Type',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chatter_attachments_messageable_type_messageable_id_index` (`messageable_type`,`messageable_id`),
  KEY `chatter_attachments_company_id_foreign` (`company_id`),
  KEY `chatter_attachments_creator_id_foreign` (`creator_id`),
  KEY `chatter_attachments_message_id_foreign` (`message_id`),
  CONSTRAINT `chatter_attachments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chatter_attachments_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chatter_attachments_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `chatter_messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatter_attachments`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `chatter_attachments` WRITE;
/*!40000 ALTER TABLE `chatter_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatter_attachments` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `chatter_followers`
--

DROP TABLE IF EXISTS `chatter_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatter_followers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `followable_type` varchar(255) NOT NULL,
  `followable_id` bigint(20) unsigned NOT NULL,
  `partner_id` bigint(20) unsigned DEFAULT NULL,
  `followed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chatter_followers_unique` (`followable_type`,`followable_id`,`partner_id`),
  KEY `chatter_followers_followable_type_followable_id_index` (`followable_type`,`followable_id`),
  KEY `chatter_followers_partner_id_foreign` (`partner_id`),
  CONSTRAINT `chatter_followers_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners_partners` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatter_followers`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `chatter_followers` WRITE;
/*!40000 ALTER TABLE `chatter_followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatter_followers` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `chatter_messages`
--

DROP TABLE IF EXISTS `chatter_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatter_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `activity_type_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Activity Type',
  `assigned_to` bigint(20) unsigned DEFAULT NULL COMMENT 'Assigned To',
  `messageable_type` varchar(255) NOT NULL,
  `messageable_id` bigint(20) unsigned NOT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT 'Message Type',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `subject` varchar(255) DEFAULT NULL COMMENT 'Subject',
  `body` text DEFAULT NULL COMMENT 'Body',
  `summary` text DEFAULT NULL COMMENT 'Summary',
  `is_internal` tinyint(1) DEFAULT NULL COMMENT 'Is Internal',
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `date_deadline` date DEFAULT NULL COMMENT 'Date',
  `pinned_at` date DEFAULT NULL COMMENT 'Pinned At',
  `log_name` varchar(255) DEFAULT NULL,
  `causer_type` varchar(255) NOT NULL,
  `causer_id` bigint(20) unsigned NOT NULL,
  `event` varchar(255) DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chatter_messages_messageable_type_messageable_id_index` (`messageable_type`,`messageable_id`),
  KEY `chatter_messages_causer_type_causer_id_index` (`causer_type`,`causer_id`),
  KEY `chatter_messages_company_id_foreign` (`company_id`),
  KEY `chatter_messages_activity_type_id_foreign` (`activity_type_id`),
  KEY `chatter_messages_assigned_to_foreign` (`assigned_to`),
  CONSTRAINT `chatter_messages_activity_type_id_foreign` FOREIGN KEY (`activity_type_id`) REFERENCES `activity_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chatter_messages_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chatter_messages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatter_messages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `chatter_messages` WRITE;
/*!40000 ALTER TABLE `chatter_messages` DISABLE KEYS */;
INSERT INTO `chatter_messages` VALUES
(3,1,NULL,NULL,'Webkul\\Project\\Models\\Project',2,'notification',NULL,NULL,'The Project was updated',NULL,NULL,1,'2026-04-27',NULL,'default','Webkul\\Security\\Models\\User',1,'updated','{\"Visibility\": {\"type\": \"modified\", \"new_value\": \"public\", \"old_value\": \"internal\"}}','2026-04-27 08:10:45','2026-04-27 13:10:56'),
(4,1,NULL,NULL,'Webkul\\Project\\Models\\Project',2,'notification',NULL,NULL,'The Project was updated',NULL,NULL,1,'2026-04-27',NULL,'default','Webkul\\Security\\Models\\User',1,'updated','{\"End Date\": {\"type\": \"modified\", \"new_value\": \"2026-12-02 00:00:00\", \"old_value\": \"2026-04-29T00:00:00.000000Z\"}}','2026-04-27 08:15:21','2026-04-27 13:10:56'),
(5,1,NULL,NULL,'Webkul\\Project\\Models\\Project',2,'notification',NULL,NULL,'The Project was updated',NULL,NULL,1,'2026-04-27',NULL,'default','Webkul\\Security\\Models\\User',1,'updated','{\"Project Manager\": {\"type\": \"modified\", \"relation\": \"user\", \"attribute\": \"name\", \"new_value\": \"Maic Sebakara\", \"old_value\": \"Himbaza Caleb\"}}','2026-04-27 08:22:25','2026-04-27 13:10:56'),
(8,1,NULL,NULL,'Webkul\\Project\\Models\\Task',1,'notification',NULL,NULL,'The Task was updated',NULL,NULL,0,'2026-04-27',NULL,'default','Webkul\\Security\\Models\\User',1,'updated','{\"State\": {\"type\": \"modified\", \"new_value\": \"In Progress\", \"old_value\": \"Change Requested\"}, \"Description\": {\"type\": \"modified\", \"new_value\": \"<p>Designing the class diagram and the ERD</p>\", \"old_value\": \"<p></p>\"}}','2026-04-27 08:36:58','2026-04-27 08:36:58'),
(9,1,NULL,NULL,'Webkul\\Project\\Models\\Task',2,'notification',NULL,NULL,'A new Task was created',NULL,NULL,0,'2026-04-27',NULL,'default','Webkul\\Security\\Models\\User',1,'created','{\"Color\": null, \"Stage\": {\"id\": 1, \"name\": \"Feasibility study\", \"sort\": 1, \"user_id\": null, \"is_active\": true, \"company_id\": null, \"created_at\": \"2026-04-27T10:33:55.000000Z\", \"creator_id\": 1, \"deleted_at\": null, \"project_id\": 2, \"updated_at\": \"2026-04-27T10:33:55.000000Z\", \"is_collapsed\": false}, \"State\": null, \"Title\": null, \"Active\": null, \"Company\": {\"id\": 1, \"zip\": null, \"city\": null, \"name\": \"Global Kwik koders\", \"sort\": 1, \"color\": \"#211b47\", \"email\": \"info@kwikkoders.com\", \"phone\": \"+250780146796\", \"mobile\": \"+250780146796\", \"tax_id\": \"DUM123456\", \"street1\": null, \"street2\": null, \"website\": \"https://www.kwikkoders.com\", \"state_id\": null, \"is_active\": 1, \"parent_id\": null, \"company_id\": \"DUMCOMP001\", \"country_id\": 191, \"created_at\": \"2026-04-23T22:44:25.000000Z\", \"creator_id\": 1, \"deleted_at\": null, \"partner_id\": 1, \"updated_at\": \"2026-04-24T15:03:58.000000Z\", \"currency_id\": 1, \"founded_date\": \"2000-01-01\", \"registration_number\": \"DUMREG789\"}, \"Creator\": {\"id\": 1, \"name\": \"kwikkoders\", \"email\": \"admin@example.com\", \"language\": null, \"is_active\": true, \"created_at\": \"2026-04-23T22:45:03.000000Z\", \"creator_id\": null, \"deleted_at\": null, \"is_default\": true, \"partner_id\": 2, \"updated_at\": \"2026-04-23T22:45:03.000000Z\", \"email_verified_at\": null, \"default_company_id\": 1, \"resource_permission\": \"global\", \"has_email_authentication\": false}, \"Partner\": {\"id\": 7, \"zip\": null, \"city\": null, \"name\": \"Emily Davis\", \"color\": null, \"email\": \"emily@example.com\", \"phone\": null, \"trust\": null, \"avatar\": null, \"mobile\": null, \"tax_id\": null, \"comment\": null, \"street1\": null, \"street2\": null, \"user_id\": null, \"website\": null, \"password\": null, \"state_id\": null, \"sub_type\": \"employee\", \"title_id\": null, \"is_active\": true, \"job_title\": \"QA Engineer\", \"parent_id\": null, \"reference\": null, \"sale_warn\": null, \"company_id\": null, \"country_id\": null, \"created_at\": \"2026-04-24T07:15:42.000000Z\", \"creator_id\": 1, \"deleted_at\": null, \"peppol_eas\": null, \"updated_at\": \"2026-04-24T07:15:42.000000Z\", \"debit_limit\": null, \"industry_id\": null, \"account_type\": \"individual\", \"credit_limit\": null, \"customer_rank\": 0, \"sale_warn_msg\": null, \"supplier_rank\": 0, \"autopost_bills\": null, \"message_bounce\": null, \"remember_token\": null, \"invoice_warning\": null, \"peppol_endpoint\": null, \"company_registry\": null, \"invoice_warn_msg\": null, \"email_verified_at\": null, \"invoice_sending_method\": null, \"invoice_edi_format_store\": null, \"property_payment_term_id\": null, \"property_account_payable_id\": null, \"ignore_abnormal_invoice_date\": null, \"property_account_position_id\": null, \"ignore_abnormal_invoice_amount\": null, \"property_account_receivable_id\": null, \"property_supplier_payment_term_id\": null, \"property_inbound_payment_method_line_id\": null, \"property_outbound_payment_method_line_id\": null}, \"Project\": {\"id\": 2, \"name\": \"KWIKSENDER\", \"sort\": 1, \"color\": null, \"user_id\": 4, \"end_date\": \"2026-12-02T00:00:00.000000Z\", \"stage_id\": 8, \"is_active\": true, \"company_id\": 1, \"created_at\": \"2026-04-27T07:53:42.000000Z\", \"creator_id\": 4, \"deleted_at\": null, \"partner_id\": 7, \"start_date\": \"2026-04-17T00:00:00.000000Z\", \"updated_at\": \"2026-04-27T10:28:13.000000Z\", \"visibility\": \"public\", \"description\": \"<p></p>\", \"tasks_label\": null, \"allocated_hours\": null, \"allow_milestones\": true, \"allow_timesheets\": false, \"allow_task_dependencies\": false}, \"Deadline\": null, \"Priority\": null, \"Recurring\": null, \"Sort Order\": null, \"Description\": null, \"Parent Task\": null, \"Allocated Hours\": null}','2026-04-27 08:38:15','2026-04-27 08:38:15'),
(13,1,NULL,NULL,'Webkul\\Project\\Models\\Task',4,'notification',NULL,NULL,'The Task was updated',NULL,NULL,0,'2026-04-27',NULL,'default','Webkul\\Security\\Models\\User',1,'updated','{\"Partner\": {\"type\": \"modified\", \"relation\": \"partner\", \"attribute\": \"name\", \"new_value\": \"Emily Davis\", \"old_value\": \"Grace Wilson\"}, \"Project\": {\"type\": \"modified\", \"relation\": \"project\", \"attribute\": \"name\", \"new_value\": \"KWIKSENDER\", \"old_value\": null}}','2026-04-27 08:56:50','2026-04-27 08:56:50'),
(14,1,NULL,NULL,'Webkul\\Account\\Models\\Move',1,'notification',NULL,NULL,'A new Invoice was created',NULL,NULL,0,'2026-04-27',NULL,'default','Webkul\\Security\\Models\\User',1,'created','{\"Checked\": null, \"Partner\": {\"id\": 47, \"zip\": null, \"city\": null, \"name\": \"Himbaza Caleb\", \"color\": null, \"email\": \"caleb@example.com\", \"phone\": null, \"trust\": null, \"avatar\": null, \"mobile\": null, \"tax_id\": null, \"comment\": null, \"street1\": null, \"street2\": null, \"user_id\": 5, \"website\": null, \"password\": null, \"state_id\": null, \"sub_type\": \"partner\", \"title_id\": null, \"is_active\": true, \"job_title\": null, \"parent_id\": null, \"reference\": null, \"sale_warn\": null, \"company_id\": null, \"country_id\": null, \"created_at\": \"2026-04-27T07:34:49.000000Z\", \"creator_id\": 1, \"deleted_at\": null, \"peppol_eas\": null, \"updated_at\": \"2026-04-27T07:34:49.000000Z\", \"debit_limit\": null, \"industry_id\": null, \"account_type\": \"individual\", \"credit_limit\": null, \"customer_rank\": null, \"sale_warn_msg\": null, \"supplier_rank\": null, \"autopost_bills\": null, \"message_bounce\": null, \"remember_token\": null, \"invoice_warning\": null, \"peppol_endpoint\": null, \"company_registry\": null, \"invoice_warn_msg\": null, \"email_verified_at\": null, \"invoice_sending_method\": null, \"invoice_edi_format_store\": null, \"property_payment_term_id\": null, \"property_account_payable_id\": null, \"ignore_abnormal_invoice_date\": null, \"property_account_position_id\": null, \"ignore_abnormal_invoice_amount\": null, \"property_account_receivable_id\": null, \"property_supplier_payment_term_id\": null, \"property_inbound_payment_method_line_id\": null, \"property_outbound_payment_method_line_id\": null}, \"Currency\": {\"id\": 1, \"name\": \"USD\", \"active\": true, \"symbol\": \"$\", \"rounding\": \"0.01\", \"full_name\": \"United States dollar\", \"created_at\": \"2026-04-23T22:44:24.000000Z\", \"updated_at\": \"2026-04-23T22:44:24.000000Z\", \"iso_numeric\": 840, \"decimal_places\": 2}, \"Subtotal\": null, \"Move Type\": null, \"Reference\": null, \"Invoice Date\": null, \"Invoice User\": null, \"Is Move Sent\": null, \"Partner Bank\": null, \"Source Email\": null, \"Invoice Origin\": null, \"Invoice Status\": null, \"Payment Status\": null, \"Fiscal Position\": null, \"Invoice Reference\": null, \"Payment Reference\": null, \"Invoice Payment Term\": null, \"Invoice Cash Rounding\": null}','2026-04-27 09:20:31','2026-04-27 09:20:31'),
(17,1,NULL,NULL,'Webkul\\Account\\Models\\Move',2,'notification',NULL,NULL,'A new Invoice was created',NULL,NULL,0,'2026-04-30',NULL,'default','Webkul\\Security\\Models\\User',1,'created','{\"Checked\": null, \"Partner\": {\"id\": 2, \"zip\": null, \"city\": null, \"name\": \"kwikkoders\", \"color\": null, \"email\": \"admin@example.com\", \"phone\": null, \"trust\": null, \"avatar\": null, \"mobile\": null, \"tax_id\": null, \"comment\": null, \"street1\": null, \"street2\": null, \"user_id\": 1, \"website\": null, \"password\": null, \"state_id\": null, \"sub_type\": \"partner\", \"title_id\": null, \"is_active\": true, \"job_title\": null, \"parent_id\": null, \"reference\": null, \"sale_warn\": null, \"company_id\": null, \"country_id\": null, \"created_at\": \"2026-04-23T22:45:03.000000Z\", \"creator_id\": null, \"deleted_at\": null, \"peppol_eas\": null, \"updated_at\": \"2026-04-24T14:09:31.000000Z\", \"debit_limit\": null, \"industry_id\": null, \"account_type\": \"individual\", \"credit_limit\": null, \"customer_rank\": 0, \"sale_warn_msg\": null, \"supplier_rank\": 0, \"autopost_bills\": null, \"message_bounce\": null, \"remember_token\": null, \"invoice_warning\": null, \"peppol_endpoint\": null, \"company_registry\": null, \"invoice_warn_msg\": null, \"email_verified_at\": null, \"invoice_sending_method\": null, \"invoice_edi_format_store\": null, \"property_payment_term_id\": null, \"property_account_payable_id\": null, \"ignore_abnormal_invoice_date\": null, \"property_account_position_id\": null, \"ignore_abnormal_invoice_amount\": null, \"property_account_receivable_id\": null, \"property_supplier_payment_term_id\": null, \"property_inbound_payment_method_line_id\": null, \"property_outbound_payment_method_line_id\": null}, \"Currency\": {\"id\": 1, \"name\": \"USD\", \"active\": true, \"symbol\": \"$\", \"rounding\": \"0.01\", \"full_name\": \"United States dollar\", \"created_at\": \"2026-04-23T22:44:24.000000Z\", \"updated_at\": \"2026-04-23T22:44:24.000000Z\", \"iso_numeric\": 840, \"decimal_places\": 2}, \"Subtotal\": null, \"Move Type\": null, \"Reference\": null, \"Invoice Date\": null, \"Invoice User\": null, \"Is Move Sent\": null, \"Partner Bank\": null, \"Source Email\": null, \"Invoice Origin\": null, \"Invoice Status\": null, \"Payment Status\": null, \"Fiscal Position\": null, \"Invoice Reference\": null, \"Payment Reference\": null, \"Invoice Payment Term\": null, \"Invoice Cash Rounding\": null}','2026-04-30 11:08:25','2026-04-30 11:08:25'),
(18,1,NULL,NULL,'Webkul\\Project\\Models\\Project',2,'notification',NULL,NULL,'The Project was updated',NULL,NULL,1,'2026-05-07',NULL,'default','Webkul\\Security\\Models\\User',1,'updated','{\"Project Manager\":{\"type\":\"modified\",\"old_value\":null,\"new_value\":\"Maic Sebakara\",\"relation\":\"user\",\"attribute\":\"name\"}}','2026-05-07 06:08:09','2026-05-07 17:58:30'),
(19,1,NULL,NULL,'Webkul\\Project\\Models\\Project',2,'notification',NULL,NULL,'The Project was updated',NULL,NULL,0,'2026-05-07',NULL,'default','Webkul\\Security\\Models\\User',1,'updated','{\"Stage\":{\"type\":\"modified\",\"old_value\":\"Cancelled\",\"new_value\":\"To Do\",\"relation\":\"stage\",\"attribute\":\"name\"}}','2026-05-07 21:12:39','2026-05-07 21:12:39');
/*!40000 ALTER TABLE `chatter_messages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `currency_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `tax_id` varchar(255) DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `founded_date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `partner_id` bigint(20) unsigned NOT NULL,
  `street1` varchar(255) DEFAULT NULL COMMENT 'Street 1',
  `street2` varchar(255) DEFAULT NULL COMMENT 'Street 2',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `zip` varchar(255) DEFAULT NULL COMMENT 'Zip',
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_company_id_unique` (`company_id`),
  UNIQUE KEY `companies_tax_id_unique` (`tax_id`),
  KEY `companies_parent_id_foreign` (`parent_id`),
  KEY `companies_currency_id_foreign` (`currency_id`),
  KEY `companies_creator_id_foreign` (`creator_id`),
  KEY `companies_partner_id_foreign` (`partner_id`),
  KEY `companies_state_id_foreign` (`state_id`),
  KEY `companies_country_id_foreign` (`country_id`),
  CONSTRAINT `companies_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `companies_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `companies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `companies_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `companies_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners_partners` (`id`),
  CONSTRAINT `companies_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=473 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES
(1,NULL,1,1,1,'Global Kwik koders','DUMCOMP001','DUM123456','DUMREG789','info@kwikkoders.com','+250780146796','+250780146796','https://www.kwikkoders.com','#211b47',1,'2000-01-01',NULL,'2026-04-23 20:44:25','2026-04-24 13:03:58',1,NULL,NULL,NULL,NULL,NULL,191);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` bigint(20) unsigned DEFAULT NULL,
  `phone_code` varchar(255) DEFAULT NULL,
  `code` varchar(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `state_required` tinyint(1) NOT NULL DEFAULT 0,
  `zip_required` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `countries_currency_id_foreign` (`currency_id`),
  CONSTRAINT `countries_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES
(1,125,'376','AD','Andorra',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(2,128,'971','AE','United Arab Emirates',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(3,47,'93','AF','Afghanistan',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(4,49,'1268','AG','Antigua and Barbuda',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(5,49,'1264','AI','Anguilla',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(6,118,'355','AL','Albania',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(7,50,'374','AM','Armenia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(8,48,'244','AO','Angola',0,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(9,49,'672','AQ','Antarctica',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(10,19,'54','AR','Argentina',1,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(11,1,'1684','AS','American Samoa',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(12,125,'43','AT','Austria',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(13,21,'61','AU','Australia',1,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(14,51,'297','AW','Aruba',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(15,125,'358','AX','Åland Islands',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(16,52,'994','AZ','Azerbaijan',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(17,63,'387','BA','Bosnia and Herzegovina',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(18,56,'1246','BB','Barbados',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(19,55,'880','BD','Bangladesh',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(20,125,'32','BE','Belgium',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(21,41,'226','BF','Burkina Faso',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(22,26,'359','BG','Bulgaria',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(23,54,'973','BH','Bahrain',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(24,65,'257','BI','Burundi',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(25,41,'229','BJ','Benin',0,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(26,125,'590','BL','Saint Barthélémy',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(27,60,'1441','BM','Bermuda',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(28,110,'673','BN','Brunei Darussalam',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(29,62,'591','BO','Bolivia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(30,1,'599','BQ','Bonaire',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(31,5,'55','BR','Brazil',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(32,53,'1242','BS','Bahamas',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(33,61,'975','BT','Bhutan',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(34,14,'55','BV','Bouvet Island',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(35,64,'267','BW','Botswana',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(36,58,'375','BY','Belarus',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(37,59,'501','BZ','Belize',0,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(38,3,'1','CA','Canada',1,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(39,21,'61','CC','Cocos (Keeling) Islands',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(40,42,'236','CF','Central African Republic',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(41,69,'243','CD','Democratic Republic of the Congo',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(42,42,'242','CG','Congo',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(43,4,'41','CH','Switzerland',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(44,41,'225','CI','Côte d\'Ivoire',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(45,35,'682','CK','Cook Islands',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(46,45,'56','CL','Chile',0,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(47,42,'237','CM','Cameroon',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(48,6,'86','CN','China',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(49,8,'57','CO','Colombia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(50,39,'506','CR','Costa Rica',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(51,70,'53','CU','Cuba',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(52,161,'238','CV','Cape Verde',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(53,71,'599','CW','Curaçao',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(54,21,'61','CX','Christmas Island',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(55,125,'357','CY','Cyprus',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(56,9,'420','CZ','Czech Republic',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(57,125,'49','DE','Germany',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(58,72,'253','DJ','Djibouti',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(59,10,'45','DK','Denmark',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(60,49,'1767','DM','Dominica',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(61,73,'1849','DO','Dominican Republic',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(62,111,'213','DZ','Algeria',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(63,1,'593','EC','Ecuador',0,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(64,125,'372','EE','Estonia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(65,74,'20','EG','Egypt',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(66,109,'212','EH','Western Sahara',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(67,76,'291','ER','Eritrea',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(68,125,'34','ES','Spain',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(69,77,'251','ET','Ethiopia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(70,125,'358','FI','Finland',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(71,79,'679','FJ','Fiji',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(72,78,'500','FK','Falkland Islands',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(73,1,'691','FM','Micronesia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(74,10,'298','FO','Faroe Islands',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(75,125,'33','FR','France',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(76,42,'241','GA','Gabon',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(77,49,'1473','GD','Grenada',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(78,80,'995','GE','Georgia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(79,125,'594','GF','French Guiana',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(80,112,'233','GH','Ghana',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(81,81,'350','GI','Gibraltar',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(82,143,'44','GG','Guernsey',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(83,10,'299','GL','Greenland',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(84,113,'220','GM','Gambia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(85,82,'224','GN','Guinea',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(86,125,'590','GP','Guadeloupe',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(87,42,'240','GQ','Equatorial Guinea',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(88,125,'30','GR','Greece',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(89,143,'500','GS','South Georgia and the South Sandwich Islands',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(90,165,'502','GT','Guatemala',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(91,1,'1671','GU','Guam',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(92,41,'245','GW','Guinea-Bissau',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(93,83,'592','GY','Guyana',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(94,24,'852','HK','Hong Kong',0,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(95,21,'672','HM','Heard Island and McDonald Islands',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(96,44,'504','HN','Honduras',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(97,125,'385','HR','Croatia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(98,84,'509','HT','Haiti',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(99,11,'36','HU','Hungary',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(100,12,'62','ID','Indonesia',1,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(101,125,'353','IE','Ireland',0,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(102,88,'972','IL','Israel',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(103,143,'44','IM','Isle of Man',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(104,20,'91','IN','India',1,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(105,1,'246','IO','British Indian Ocean Territory',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(106,87,'964','IQ','Iraq',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(107,86,'98','IR','Iran',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(108,85,'354','IS','Iceland',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(109,125,'39','IT','Italy',1,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(110,143,'44','JE','Jersey',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(111,89,'1876','JM','Jamaica',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(112,90,'962','JO','Jordan',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(113,25,'81','JP','Japan',1,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(114,92,'254','KE','Kenya',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(115,94,'996','KG','Kyrgyzstan',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(116,66,'855','KH','Cambodia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(117,21,'686','KI','Kiribati',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(118,68,'269','KM','Comoros',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(119,49,'1869','KN','Saint Kitts and Nevis',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(120,121,'850','KP','North Korea',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(121,32,'82','KR','South Korea',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(122,93,'965','KW','Kuwait',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(123,67,'1345','KY','Cayman Islands',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(124,91,'7','KZ','Kazakhstan',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(125,95,'856','LA','Laos',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(126,96,'961','LB','Lebanon',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(127,49,'1758','LC','Saint Lucia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(128,4,'423','LI','Liechtenstein',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(129,141,'94','LK','Sri Lanka',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(130,98,'231','LR','Liberia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(131,97,'266','LS','Lesotho',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(132,125,'370','LT','Lithuania',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(133,125,'352','LU','Luxembourg',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(134,125,'371','LV','Latvia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(135,99,'218','LY','Libya',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(136,109,'212','MA','Morocco',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(137,125,'377','MC','Monaco',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(138,107,'373','MD','Moldova',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(139,125,'382','ME','Montenegro',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(140,125,'590','MF','Saint Martin (French part)',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(141,102,'261','MG','Madagascar',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(142,1,'692','MH','Marshall Islands',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(143,101,'389','MK','North Macedonia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(144,41,'223','ML','Mali',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(145,115,'95','MM','Myanmar',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(146,108,'976','MN','Mongolia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(147,100,'853','MO','Macau',0,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(148,1,'1670','MP','Northern Mariana Islands',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(149,125,'596','MQ','Martinique',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(150,106,'222','MR','Mauritania',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(151,49,'1664','MS','Montserrat',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(152,125,'356','MT','Malta',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(153,40,'230','MU','Mauritius',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(154,104,'960','MV','Maldives',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(155,103,'265','MW','Malawi',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(156,33,'52','MX','Mexico',1,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(157,34,'60','MY','Malaysia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(158,114,'258','MZ','Mozambique',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(159,116,'264','NA','Namibia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(160,15,'687','NC','New Caledonia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(161,41,'227','NE','Niger',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(162,21,'672','NF','Norfolk Island',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(163,120,'234','NG','Nigeria',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(164,119,'505','NI','Nicaragua',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(165,125,'31','NL','Netherlands',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(166,14,'47','NO','Norway',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(167,117,'977','NP','Nepal',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(168,21,'674','NR','Nauru',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(169,35,'683','NU','Niue',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(170,35,'64','NZ','New Zealand',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(171,160,'968','OM','Oman',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(172,16,'507','PA','Panama',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(173,156,'51','PE','Peru',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(174,15,'689','PF','French Polynesia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(175,158,'675','PG','Papua New Guinea',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(176,36,'63','PH','Philippines',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(177,159,'92','PK','Pakistan',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(178,17,'48','PL','Poland',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(179,125,'508','PM','Saint Pierre and Miquelon',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(180,35,'64','PN','Pitcairn Islands',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(181,1,'1939','PR','Puerto Rico',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(182,88,'970','PS','State of Palestine',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(183,125,'351','PT','Portugal',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(184,1,'680','PW','Palau',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(185,157,'595','PY','Paraguay',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(186,155,'974','QA','Qatar',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(187,125,'262','RE','Réunion',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(188,28,'40','RO','Romania',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(189,149,'381','RS','Serbia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(190,30,'7','RU','Russian Federation',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(191,154,'250','RW','Rwanda',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(192,150,'966','SA','Saudi Arabia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(193,145,'677','SB','Solomon Islands',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(194,148,'248','SC','Seychelles',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(195,140,'249','SD','Sudan',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(196,18,'46','SE','Sweden',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(197,37,'65','SG','Singapore',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(198,153,'290','SH','Saint Helena',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(199,125,'386','SI','Slovenia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(200,14,'47','SJ','Svalbard and Jan Mayen',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(201,125,'421','SK','Slovakia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(202,147,'232','SL','Sierra Leone',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(203,125,'378','SM','San Marino',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(204,41,'221','SN','Senegal',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(205,144,'252','SO','Somalia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(206,139,'597','SR','Suriname',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(207,142,'211','SS','South Sudan',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(208,151,'239','ST','São Tomé and Príncipe',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(209,75,'503','SV','El Salvador',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(210,71,'1721','SX','Sint Maarten (Dutch part)',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(211,137,'963','SY','Syria',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(212,138,'268','SZ','Eswatini',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(213,1,'1649','TC','Turks and Caicos Islands',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(214,42,'235','TD','Chad',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(215,125,'262','TF','French Southern Territories',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(216,41,'228','TG','Togo',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(217,133,'66','TH','Thailand',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(218,135,'992','TJ','Tajikistan',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(219,35,'690','TK','Tokelau',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(220,129,'993','TM','Turkmenistan',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(221,130,'216','TN','Tunisia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(222,132,'676','TO','Tonga',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(223,1,'670','TL','Timor-Leste',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(224,31,'90','TR','Türkiye',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(225,131,'1868','TT','Trinidad and Tobago',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(226,21,'688','TV','Tuvalu',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(227,136,'886','TW','Taiwan',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(228,134,'255','TZ','Tanzania',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(229,22,'380','UA','Ukraine',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(230,43,'256','UG','Uganda',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(231,143,'44','GB','United Kingdom',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(232,1,'699','UM','USA Minor Outlying Islands',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(233,1,'1','US','United States',1,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(234,46,'598','UY','Uruguay',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(235,127,'998','UZ','Uzbekistan',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(236,125,'379','VA','Holy See (Vatican City State)',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(237,49,'1784','VC','Saint Vincent and the Grenadines',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(238,2,'58','VE','Venezuela',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(239,1,'1284','VG','Virgin Islands (British)',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(240,1,'1340','VI','Virgin Islands (USA)',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(241,23,'84','VN','Vietnam',0,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(242,126,'678','VU','Vanuatu',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(243,15,'681','WF','Wallis and Futuna',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(244,152,'685','WS','Samoa',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(245,124,'967','YE','Yemen',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(246,125,'262','YT','Mayotte',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(247,38,'27','ZA','South Africa',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(248,123,'260','ZM','Zambia',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(249,122,'263','ZW','Zimbabwe',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(250,125,'383','XK','Kosovo',0,1,'2026-04-23 20:44:24','2026-04-23 20:44:24');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `iso_numeric` int(11) DEFAULT NULL,
  `decimal_places` tinyint(4) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `rounding` decimal(8,2) NOT NULL DEFAULT 0.00,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES
(1,'USD','$',840,2,'United States dollar',0.01,1,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(2,'VEF','Bs.F',937,2,'Venezuelan bolívar fuerte',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(3,'CAD','$',124,2,'Canadian dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(4,'CHF','CHF',756,2,'Swiss franc',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(5,'BRL','R$',986,2,'Brazilian real',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(6,'CNY','¥',156,2,'Chinese yuan',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(7,'CNH','¥',0,2,'Chinese yuan - Offshore',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(8,'COP','$',170,2,'Colombian peso',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(9,'CZK','Kč',203,2,'Czech koruna',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(10,'DKK','kr',208,2,'Danish krone',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(11,'HUF','Ft',348,2,'Hungarian forint',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(12,'IDR','Rp',360,2,'Indonesian rupiah',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(13,'LVL','Ls',840,2,'Latvian lats',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(14,'NOK','kr',578,2,'Norwegian krone',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(15,'XPF','XPF',953,0,'CFP franc',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(16,'PAB','B/.',590,2,'Panamanian balboa',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(17,'PLN','zł',985,2,'Polish złoty',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(18,'SEK','kr',752,2,'Swedish krona',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(19,'ARS','$',32,2,'Argentine peso',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(20,'INR','₹',356,2,'Indian rupee',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(21,'AUD','$',36,2,'Australian dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(22,'UAH','₴',980,2,'Ukraine Hryvnia',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(23,'VND','₫',704,0,'Vietnamese đồng',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(24,'HKD','$',344,2,'Hong Kong dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(25,'JPY','¥',392,0,'Japanese yen',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(26,'BGN','лв',975,2,'Bulgarian lev',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(27,'LTL','Lt',840,2,'Lithuanian litas',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(28,'RON','lei',946,2,'Romanian leu',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(29,'HRK','kn',191,2,'Croatian kuna',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(30,'RUB','руб',643,2,'Russian ruble',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(31,'TRY','₺',949,2,'Turkish lira',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(32,'KRW','₩',410,0,'South Korean won',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(33,'MXN','$',484,2,'Mexican peso',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(34,'MYR','RM',458,2,'Malaysian ringgit',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(35,'NZD','$',554,2,'New Zealand dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(36,'PHP','₱',608,2,'Philippine peso',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(37,'SGD','S$',702,2,'Singapore dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(38,'ZAR','R',710,2,'South African rand',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(39,'CRC','₡',188,2,'Costa Rican colón',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(40,'MUR','Rs',480,2,'Mauritian rupee',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(41,'XOF','CFA',952,0,'CFA franc BCEAO',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(42,'XAF','FCFA',950,0,'CFA franc BEAC',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(43,'UGX','USh',800,0,'Ugandan shilling',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(44,'HNL','L',340,2,'Honduran lempira',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(45,'CLP','$',152,0,'Chilean peso',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(46,'UYU','$',858,2,'Uruguayan peso',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(47,'AFN','Afs',971,2,'Afghan afghani',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(48,'AOA','Kz',973,2,'Angolan kwanza',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(49,'XCD','$',951,2,'East Caribbean dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(50,'AMD','դր.',51,2,'Armenian dram',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(51,'AWG','Afl.',533,2,'Aruban florin',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(52,'AZN','m',944,2,'Azerbaijani manat',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(53,'BSD','B$',44,2,'Bahamian dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(54,'BHD','BD',48,3,'Bahraini dinar',0.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(55,'BDT','৳',50,2,'Bangladeshi taka',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(56,'BBD','Bds$',52,2,'Barbados dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(57,'BYR','BR',974,0,'Belarusian ruble',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(58,'BYN','Br',974,2,'Belarusian ruble',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(59,'BZD','BZ$',84,2,'Belize dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(60,'BMD','BD$',60,2,'Bermudian dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(61,'BTN','Nu.',64,2,'Bhutanese ngultrum',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(62,'BOB','Bs.',68,2,'Boliviano',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(63,'BAM','KM',977,2,'Bosnia and Herzegovina convertible mark',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(64,'BWP','P',72,2,'Botswana pula',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(65,'BIF','FBu',108,0,'Burundian franc',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(66,'KHR','៛',116,2,'Cambodian riel',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(67,'KYD','$',136,2,'Cayman Islands dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(68,'KMF','CF',174,0,'Comorian franc',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(69,'CDF','Fr',976,2,'Congolese franc',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(70,'CUP','$',192,2,'Cuban peso',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(71,'ANG','ƒ',532,2,'Netherlands Antillean guilder',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(72,'DJF','Fdj',262,0,'Djiboutian franc',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(73,'DOP','RD$',214,2,'Dominican peso',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(74,'EGP','LE',818,2,'Egyptian pound',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(75,'SVC','¢',222,2,'Salvadoran Colon',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(76,'ERN','Nfk',232,2,'Eritrean nakfa',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(77,'ETB','Br',230,2,'Ethiopian birr',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(78,'FKP','£',238,2,'Falkland Islands pound',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(79,'FJD','FJ$',242,2,'Fiji dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(80,'GEL','ლ',981,2,'Georgian lari',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(81,'GIP','£',292,2,'Gibraltar pound',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(82,'GNF','FG',324,0,'Guinean franc',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(83,'GYD','$',328,2,'Guyanese dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(84,'HTG','G',332,2,'Haitian gourde',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(85,'ISK','kr',352,0,'Icelandic króna',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(86,'IRR','﷼',364,2,'Iranian rial',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(87,'IQD','ع.د',368,3,'Iraqi dinar',0.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(88,'ILS','₪',376,2,'Israeli new shekel',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(89,'JMD','$',388,2,'Jamaican dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(90,'JOD','د.ا',400,3,'Jordanian dinar',0.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(91,'KZT','₸',398,2,'Kazakhstani tenge',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(92,'KES','KSh',404,2,'Kenyan shilling',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(93,'KWD','د.ك',414,3,'Kuwaiti dinar',0.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(94,'KGS','лв',417,2,'Kyrgyzstani som',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(95,'LAK','₭',418,2,'Lao kip',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(96,'LBP','ل.ل',422,2,'Lebanese pound',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(97,'LSL','M',426,2,'Lesotho loti',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(98,'LRD','L$',430,2,'Liberian dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(99,'LYD','ل.د',434,3,'Libyan dinar',0.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(100,'MOP','MOP$',446,2,'Macanese pataca',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(101,'MKD','ден',807,2,'Macedonian denar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(102,'MGA','Ar',969,2,'Malagasy ariary',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(103,'MWK','MK',454,2,'Malawian kwacha',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(104,'MVR','Rf',462,2,'Maldivian rufiyaa',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(105,'MRO','UM',478,2,'Mauritanian ouguiya (old)',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(106,'MRU','UM',478,2,'Mauritanian ouguiya',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(107,'MDL','L',498,2,'Moldovan leu',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(108,'MNT','₮',496,2,'Mongolian tögrög',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(109,'MAD','DH',504,2,'Moroccan dirham',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(110,'BND','$',96,2,'Brunei dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(111,'DZD','DA',12,2,'Algerian dinar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(112,'GHS','GH¢',936,2,'Ghanaian cedi',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(113,'GMD','D',270,2,'Gambian dalasi',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(114,'MZN','MT',943,2,'Mozambican metical',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(115,'MMK','K',104,2,'Myanmar kyat',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(116,'NAD','$',516,2,'Namibian dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(117,'NPR','₨',524,2,'Nepalese rupee',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(118,'ALL','L',8,2,'Albanian lek',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(119,'NIO','C$',558,2,'Nicaraguan córdoba',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(120,'NGN','₦',566,2,'Nigerian naira',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(121,'KPW','₩',408,2,'North Korean won',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(122,'ZIG','ZiG',0,2,'Zimbabwe Gold',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(123,'ZMW','ZK',967,2,'Zambian kwacha',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(124,'YER','﷼',886,2,'Yemeni rial',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(125,'EUR','€',978,2,'Euro',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(126,'VUV','VT',548,0,'Vanuatu vatu',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(127,'UZS','лв',860,2,'Uzbekistan som',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(128,'AED','د.إ',784,2,'United Arab Emirates dirham',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(129,'TMT','T',934,2,'Turkmenistan manat',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(130,'TND','DT',788,3,'Tunisian dinar',0.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(131,'TTD','$',780,2,'Trinidad and Tobago dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(132,'TOP','T$',776,2,'Tongan paʻanga',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(133,'THB','฿',764,2,'Thai baht',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(134,'TZS','TSh',834,2,'Tanzanian shilling',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(135,'TJS','TJS',972,2,'Tajikistani somoni',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(136,'TWD','NT$',901,0,'New Taiwan dollar',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(137,'SYP','£',760,2,'Syrian pound',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(138,'SZL','E',748,2,'Swazi lilangeni',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(139,'SRD','$',968,2,'Surinamese dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(140,'SDG','ج.س.',938,2,'Sudanese pound',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(141,'LKR','Rs',144,2,'Sri Lankan rupee',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(142,'SSP','£',728,2,'South Sudanese pound',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(143,'GBP','£',826,2,'Pound sterling',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(144,'SOS','Sh.',706,2,'Somali shilling',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(145,'SBD','SI$',90,2,'Solomon Islands dollar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(146,'SLL','Le',694,2,'Sierra Leonean leone',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(147,'SLE','Le',694,2,'Sierra Leonean leone',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(148,'SCR','SR',690,2,'Seychellois rupee',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(149,'RSD','din.',941,2,'Serbian dinar',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(150,'SAR','SR',682,2,'Saudi riyal',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(151,'STD','Db',678,2,'São Tomé and Príncipe dobra',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(152,'WST','WS$',882,2,'Samoan tālā',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(153,'SHP','£',654,2,'Saint Helena pound',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(154,'RWF','RF',646,0,'Rwandan franc',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(155,'QAR','QR',634,2,'Qatari riyal',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(156,'PEN','S/',604,2,'Peruvian sol',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(157,'PYG','₲',600,0,'Paraguayan guaraní',1.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(158,'PGK','K',598,2,'Papua New Guinean kina',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(159,'PKR','Rs.',586,2,'Pakistani rupee',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(160,'OMR','ر.ع.',512,3,'Omani rial',0.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(161,'CVE','$',132,2,'Cape Verdean escudo',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(162,'COU','$',970,2,'Unidad de Valor Real',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(163,'CLF','$',990,4,'Unidad de Fomento',0.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(164,'CUC','$',931,2,'Cuban convertible peso',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(165,'GTQ','Q',320,2,'Guatemalan Quetzal',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(166,'VES','Bs',937,2,'Venezuelan bolívar soberano',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(167,'UYW','$',858,4,'Unidad previsional',0.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(168,'UYI','$',940,4,'Uruguay Peso en Unidades Indexadas',0.00,0,'2026-04-23 20:44:24','2026-04-23 20:44:24'),
(169,'STN','Db',678,2,'São Tomé and Príncipe dobra',0.01,0,'2026-04-23 20:44:24','2026-04-23 20:44:24');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `currency_rates`
--

DROP TABLE IF EXISTS `currency_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_rates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` date NOT NULL,
  `rate` decimal(15,6) NOT NULL DEFAULT 1.000000,
  `currency_id` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency_rates_currency_id_foreign` (`currency_id`),
  KEY `currency_rates_creator_id_foreign` (`creator_id`),
  KEY `currency_rates_company_id_foreign` (`company_id`),
  CONSTRAINT `currency_rates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `currency_rates_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `currency_rates_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_rates`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `currency_rates` WRITE;
/*!40000 ALTER TABLE `currency_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_rates` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `is_multiselect` tinyint(1) NOT NULL DEFAULT 0,
  `datalist` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`datalist`)),
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `form_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`form_settings`)),
  `use_in_table` tinyint(1) NOT NULL DEFAULT 0,
  `table_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`table_settings`)),
  `infolist_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`infolist_settings`)),
  `sort` int(11) DEFAULT NULL,
  `customizable_type` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custom_fields_code_customizable_type_unique` (`code`,`customizable_type`),
  KEY `custom_fields_code_index` (`code`),
  KEY `custom_fields_sort_index` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `document_user`
--

DROP TABLE IF EXISTS `document_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `viewed_at` timestamp NULL DEFAULT NULL,
  `signed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `document_user_document_id_user_id_unique` (`document_id`,`user_id`),
  KEY `document_user_user_id_status_index` (`user_id`,`status`),
  CONSTRAINT `document_user_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `document_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_user`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `document_user` WRITE;
/*!40000 ALTER TABLE `document_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `documentation_articles`
--

DROP TABLE IF EXISTS `documentation_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentation_articles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `module` varchar(255) DEFAULT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `audience` varchar(255) NOT NULL DEFAULT 'all',
  `summary` text DEFAULT NULL,
  `content` longtext NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `published_at` timestamp NULL DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `assignee_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documentation_articles_slug_unique` (`slug`),
  KEY `documentation_articles_creator_id_foreign` (`creator_id`),
  KEY `documentation_articles_is_published_module_index` (`is_published`,`module`),
  KEY `documentation_articles_audience_sort_order_index` (`audience`,`sort_order`),
  KEY `documentation_articles_assignee_id_foreign` (`assignee_id`),
  KEY `documentation_articles_project_id_assignee_id_index` (`project_id`,`assignee_id`),
  CONSTRAINT `documentation_articles_assignee_id_foreign` FOREIGN KEY (`assignee_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `documentation_articles_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `documentation_articles_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects_projects` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentation_articles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `documentation_articles` WRITE;
/*!40000 ALTER TABLE `documentation_articles` DISABLE KEYS */;
INSERT INTO `documentation_articles` VALUES
(1,'KWIKSENDER - Feature Overview','kwiksender-feature-overview','Projects',2,'all','High-level summary of this project and how teams should use it.','<h3>Project Overview</h3>\n<p><strong>KWIKSENDER</strong> supports business delivery with a structured project flow.</p>\n<p><p></p></p>\n<h4>How to use this project module</h4>\n<ul>\n    <li>Create and maintain project scope.</li>\n    <li>Track tasks, milestones, and assignees.</li>\n    <li>Review progress weekly and update statuses.</li>\n</ul>',1,'2026-05-07 17:02:52',1,NULL,12,'2026-05-07 17:02:52','2026-05-07 17:02:52',NULL),
(2,'KWIKSENDER - Employee Task Guide','kwiksender-employee-task-guide','Projects',2,'employee','Step-by-step guide for Maic Sebakara and the assigned team members.','<h3>Employee Guide</h3>\n<p>This guide explains the expected workflow for <strong>KWIKSENDER</strong>.</p>\n<ol>\n    <li>Open the project and review assigned tasks daily.</li>\n    <li>Update task status before end of day.</li>\n    <li>Add comments and blockers in task chatter.</li>\n    <li>Notify your manager when milestone work is complete.</li>\n</ol>\n<p><strong>Primary assignee:</strong> Maic Sebakara</p>',1,'2026-05-07 17:02:52',2,NULL,12,'2026-05-07 17:02:52','2026-05-07 17:02:52',NULL),
(3,'KWIKSENDER - Manager Review Checklist','kwiksender-manager-review-checklist','Projects',2,'manager','Checklist for project managers to review progress and quality.','<h3>Manager Checklist</h3><p>Use this checklist to review <strong>KWIKSENDER</strong>.</p><ul><li><p>Verify current stage and milestone completion.</p></li><li><p>Validate timesheet and effort quality.</p></li><li><p>Review risks, blockers, and dependencies.</p></li><li><p>Confirm next sprint priorities are clear.</p></li></ul>',1,NULL,3,NULL,12,'2026-05-07 17:02:52','2026-05-07 19:01:46',NULL),
(4,'New Feature now','new-feature-now','KwikSenda',2,'all','safasda','<p>safsasdaf</p>',0,NULL,0,12,13,'2026-05-07 19:27:49','2026-05-07 19:27:49',NULL);
/*!40000 ALTER TABLE `documentation_articles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uploaded_by_user_id` bigint(20) unsigned NOT NULL,
  `parent_document_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_hash_sha256` varchar(64) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_uploaded_by_user_id_foreign` (`uploaded_by_user_id`),
  KEY `documents_parent_document_id_foreign` (`parent_document_id`),
  CONSTRAINT `documents_parent_document_id_foreign` FOREIGN KEY (`parent_document_id`) REFERENCES `documents` (`id`) ON DELETE SET NULL,
  CONSTRAINT `documents_uploaded_by_user_id_foreign` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `email_logs`
--

DROP TABLE IF EXISTS `email_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recipient_email` varchar(255) NOT NULL,
  `recipient_name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `error_message` text DEFAULT NULL,
  `sent_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_logs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `email_logs` WRITE;
/*!40000 ALTER TABLE `email_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_logs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_categories`
--

DROP TABLE IF EXISTS `employees_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `color` varchar(255) DEFAULT NULL COMMENT 'Color',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_categories_name_unique` (`name`),
  KEY `employees_categories_creator_id_foreign` (`creator_id`),
  CONSTRAINT `employees_categories_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_categories` WRITE;
/*!40000 ALTER TABLE `employees_categories` DISABLE KEYS */;
INSERT INTO `employees_categories` VALUES
(13,'Sales','#893AC1',1,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(14,'Trainer','#51AD34',1,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(15,'Employee','#1935C8',1,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(16,'Consultant','#5F4536',1,'2026-04-24 05:31:44','2026-04-24 05:31:44');
/*!40000 ALTER TABLE `employees_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_chat_messages`
--

DROP TABLE IF EXISTS `employees_chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_chat_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint(20) unsigned NOT NULL,
  `recipient_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company context',
  `body` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_chat_messages_company_id_foreign` (`company_id`),
  KEY `employees_chat_messages_recipient_id_read_at_index` (`recipient_id`,`read_at`),
  KEY `employees_chat_messages_sender_id_created_at_index` (`sender_id`,`created_at`),
  KEY `employees_chat_messages_recipient_id_created_at_index` (`recipient_id`,`created_at`),
  CONSTRAINT `employees_chat_messages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_chat_messages_recipient_id_foreign` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_chat_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_chat_messages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_chat_messages` WRITE;
/*!40000 ALTER TABLE `employees_chat_messages` DISABLE KEYS */;
INSERT INTO `employees_chat_messages` VALUES
(1,1,12,1,'Hello mavin, how are you doing? nice to meet you!!',NULL,'2026-05-06 21:00:40','2026-05-06 21:00:40');
/*!40000 ALTER TABLE `employees_chat_messages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_departments`
--

DROP TABLE IF EXISTS `employees_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `manager_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `master_department_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `complete_name` varchar(255) DEFAULT NULL,
  `parent_path` varchar(255) DEFAULT NULL,
  `color` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_departments_company_id_foreign` (`company_id`),
  KEY `employees_departments_parent_id_foreign` (`parent_id`),
  KEY `employees_departments_master_department_id_foreign` (`master_department_id`),
  KEY `employees_departments_creator_id_foreign` (`creator_id`),
  KEY `employees_departments_manager_id_foreign` (`manager_id`),
  CONSTRAINT `employees_departments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_departments_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_departments_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `employees_employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_departments_master_department_id_foreign` FOREIGN KEY (`master_department_id`) REFERENCES `employees_departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_departments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `employees_departments` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_departments`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_departments` WRITE;
/*!40000 ALTER TABLE `employees_departments` DISABLE KEYS */;
INSERT INTO `employees_departments` VALUES
(22,NULL,1,NULL,NULL,1,'Administration','Administration',NULL,'#4e0554',NULL,'2026-04-24 05:31:45','2026-04-24 05:31:45'),
(23,NULL,1,NULL,NULL,1,'Long Term Projects','Long Term Projects',NULL,'#5d0a6e','2026-04-27 08:44:05','2026-04-24 05:31:45','2026-04-27 08:44:05'),
(24,NULL,1,NULL,NULL,1,'Management','Management',NULL,'#4e095c',NULL,'2026-04-24 05:31:45','2026-04-24 05:31:45'),
(25,NULL,1,NULL,NULL,1,'Professional Services','Professional Services',NULL,'#5e0870','2026-04-27 08:43:58','2026-04-24 05:31:45','2026-04-27 08:43:58'),
(26,NULL,1,NULL,NULL,1,'R&D USA','R&D USA',NULL,'#420957','2026-04-27 08:43:49','2026-04-24 05:31:45','2026-04-27 08:43:49'),
(27,NULL,1,NULL,NULL,1,'Research & Development','Research & Development',NULL,'#570919',NULL,'2026-04-24 05:31:45','2026-04-24 05:31:45'),
(28,NULL,1,NULL,NULL,1,'Sales','Sales',NULL,'#590819',NULL,'2026-04-24 05:31:45','2026-04-24 05:31:45'),
(29,NULL,1,22,22,1,'R&D Department','Administration / R&D Department','22/','#638a61',NULL,'2026-04-24 07:19:22','2026-04-24 07:19:22'),
(30,NULL,1,28,28,NULL,'Finance ','Sales / Finance ','28/','#2081ab',NULL,'2026-04-27 08:46:28','2026-04-27 08:46:28'),
(31,NULL,1,29,22,NULL,'Trainer ','Administration / R&D Department / Trainer ','22/29/','#521616',NULL,'2026-04-27 08:47:14','2026-04-27 08:47:14');
/*!40000 ALTER TABLE `employees_departments` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_departure_reasons`
--

DROP TABLE IF EXISTS `employees_departure_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_departure_reasons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort Order',
  `reason_code` int(11) DEFAULT NULL COMMENT 'Reason Code',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_departure_reasons_creator_id_foreign` (`creator_id`),
  CONSTRAINT `employees_departure_reasons_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_departure_reasons`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_departure_reasons` WRITE;
/*!40000 ALTER TABLE `employees_departure_reasons` DISABLE KEYS */;
INSERT INTO `employees_departure_reasons` VALUES
(10,1,1,'Fired',1,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(11,2,2,'Resigned',1,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(12,3,3,'Retired',1,'2026-04-24 05:31:44','2026-04-24 05:31:44');
/*!40000 ALTER TABLE `employees_departure_reasons` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_employee_categories`
--

DROP TABLE IF EXISTS `employees_employee_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_employee_categories` (
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  KEY `employees_employee_categories_employee_id_foreign` (`employee_id`),
  KEY `employees_employee_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `employees_employee_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `employees_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_employee_categories_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees_employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_employee_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_employee_categories` WRITE;
/*!40000 ALTER TABLE `employees_employee_categories` DISABLE KEYS */;
INSERT INTO `employees_employee_categories` VALUES
(NULL,15),
(NULL,15),
(NULL,15);
/*!40000 ALTER TABLE `employees_employee_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_employee_documents`
--

DROP TABLE IF EXISTS `employees_employee_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_employee_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `requested_by_user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Requested By',
  `signed_by_user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Signed By',
  `signed_name` varchar(255) DEFAULT NULL,
  `signed_ip_address` varchar(45) DEFAULT NULL,
  `signed_user_agent` text DEFAULT NULL,
  `signature_hash` varchar(255) DEFAULT NULL,
  `signed_file_sha256` varchar(64) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `document_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `original_file_path` varchar(255) NOT NULL,
  `signed_file_path` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `signed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_employee_documents_employee_id_foreign` (`employee_id`),
  KEY `employees_employee_documents_creator_id_foreign` (`creator_id`),
  KEY `employees_employee_documents_requested_by_user_id_foreign` (`requested_by_user_id`),
  KEY `employees_employee_documents_signed_by_user_id_foreign` (`signed_by_user_id`),
  CONSTRAINT `employees_employee_documents_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employee_documents_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees_employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_employee_documents_requested_by_user_id_foreign` FOREIGN KEY (`requested_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employee_documents_signed_by_user_id_foreign` FOREIGN KEY (`signed_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_employee_documents`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_employee_documents` WRITE;
/*!40000 ALTER TABLE `employees_employee_documents` DISABLE KEYS */;
INSERT INTO `employees_employee_documents` VALUES
(22,48,1,1,12,'Maic Sebakara','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','ec5203e82c5351aeec3343235827153d3800ac3ee3f31cc10be52c80ba5cf979','19601c601bb00b7c2426c6c2a541e118ee9dc031640c843af1fc7a2566bba7d4','NDA','Non discloser agreement','signed','employees/documents/original/employment-contract-20260506222734-syeiltm4.pdf','employees/documents/signed/nda-record-22-signed-20260506223847.pdf','Please sign it and send it back',NULL,'2026-05-06 20:38:47','2026-05-06 20:27:34','2026-05-06 20:38:48'),
(23,49,1,1,13,'Mavenge Mavin','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','3820ce18ef992c2364841fd8ce0f64da0be4908e17b7845e614fe1e75d450497','30238c7555bdd0f527177f62282533dd20720f0b169c3631d5bffba01b36b9b1','NDA','Non discloser agreement','signed','employees/documents/original/concept-note-of-20260506230203-r3fla7co.pdf','employees/documents/signed/nda-record-23-signed-20260506231930.pdf','sign it and send it back','2026-05-06 21:01:21','2026-05-06 21:19:30','2026-05-06 21:02:03','2026-05-06 21:19:31'),
(24,50,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'Offer','offer','pending_signature','employees/documents/original/employment-contract-20260508073327-4u9fatoo.pdf',NULL,'sign the offer','2026-05-08 05:33:02',NULL,'2026-05-08 05:33:27','2026-05-08 05:33:27');
/*!40000 ALTER TABLE `employees_employee_documents` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_employee_resume_line_types`
--

DROP TABLE IF EXISTS `employees_employee_resume_line_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_employee_resume_line_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_employee_resume_line_types_creator_id_foreign` (`creator_id`),
  CONSTRAINT `employees_employee_resume_line_types_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_employee_resume_line_types`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_employee_resume_line_types` WRITE;
/*!40000 ALTER TABLE `employees_employee_resume_line_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees_employee_resume_line_types` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_employee_resumes`
--

DROP TABLE IF EXISTS `employees_employee_resumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_employee_resumes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `employee_resume_line_type_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created by',
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `display_type` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_employee_resumes_employee_id_foreign` (`employee_id`),
  KEY `employees_employee_resumes_employee_resume_line_type_id_foreign` (`employee_resume_line_type_id`),
  KEY `employees_employee_resumes_creator_id_foreign` (`creator_id`),
  KEY `employees_employee_resumes_user_id_foreign` (`user_id`),
  CONSTRAINT `employees_employee_resumes_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employee_resumes_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees_employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_employee_resumes_employee_resume_line_type_id_foreign` FOREIGN KEY (`employee_resume_line_type_id`) REFERENCES `employees_employee_resume_line_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employee_resumes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_employee_resumes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_employee_resumes` WRITE;
/*!40000 ALTER TABLE `employees_employee_resumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees_employee_resumes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_employee_skills`
--

DROP TABLE IF EXISTS `employees_employee_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_employee_skills` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `skill_id` bigint(20) unsigned DEFAULT NULL,
  `skill_level_id` bigint(20) unsigned DEFAULT NULL,
  `skill_type_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_employee_skills_employee_id_foreign` (`employee_id`),
  KEY `employees_employee_skills_skill_id_foreign` (`skill_id`),
  KEY `employees_employee_skills_skill_level_id_foreign` (`skill_level_id`),
  KEY `employees_employee_skills_skill_type_id_foreign` (`skill_type_id`),
  KEY `employees_employee_skills_creator_id_foreign` (`creator_id`),
  CONSTRAINT `employees_employee_skills_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employee_skills_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees_employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_employee_skills_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `employees_skills` (`id`),
  CONSTRAINT `employees_employee_skills_skill_level_id_foreign` FOREIGN KEY (`skill_level_id`) REFERENCES `employees_skill_levels` (`id`),
  CONSTRAINT `employees_employee_skills_skill_type_id_foreign` FOREIGN KEY (`skill_type_id`) REFERENCES `employees_skill_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_employee_skills`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_employee_skills` WRITE;
/*!40000 ALTER TABLE `employees_employee_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees_employee_skills` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_employees`
--

DROP TABLE IF EXISTS `employees_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time_zone` varchar(255) DEFAULT NULL COMMENT 'Employee Timezone',
  `work_permit` varchar(255) DEFAULT NULL COMMENT 'Work permit document',
  `address_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company address ID',
  `leave_manager_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Leave manager ID',
  `bank_account_id` bigint(20) unsigned DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_account_number` varchar(255) DEFAULT NULL,
  `bank_account_holder_name` varchar(255) DEFAULT NULL,
  `private_state_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Private State',
  `private_country_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Private Country',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Related user',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created by',
  `calendar_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Calendar',
  `department_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Department',
  `job_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Job Position',
  `partner_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Partner',
  `work_location_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Work Location',
  `parent_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Parent',
  `coach_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Coach',
  `country_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Country',
  `state_id` bigint(20) unsigned DEFAULT NULL COMMENT 'State',
  `country_of_birth` bigint(20) unsigned DEFAULT NULL COMMENT 'Country of Birth',
  `departure_reason_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Departure Reason',
  `attendance_manager_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT 'Employee Name',
  `job_title` varchar(255) DEFAULT NULL COMMENT 'Job Title',
  `work_phone` varchar(255) DEFAULT NULL COMMENT 'Work Phone',
  `mobile_phone` varchar(255) DEFAULT NULL COMMENT 'Mobile Phone',
  `color` varchar(255) DEFAULT NULL COMMENT 'Color',
  `children` int(11) DEFAULT NULL COMMENT 'Children',
  `distance_home_work` int(11) DEFAULT 0 COMMENT 'Distance Home Work',
  `km_home_work` int(11) DEFAULT 0 COMMENT 'Km Home Work',
  `distance_home_work_unit` varchar(255) DEFAULT 'km' COMMENT 'Distance Home Work Unit',
  `work_email` varchar(255) DEFAULT NULL COMMENT 'Work Email',
  `private_phone` varchar(255) DEFAULT NULL COMMENT 'Private Phone',
  `private_email` varchar(255) DEFAULT NULL COMMENT 'Private Email',
  `private_street1` varchar(255) DEFAULT NULL COMMENT 'Private Street 1',
  `private_street2` varchar(255) DEFAULT NULL COMMENT 'Private Street 2',
  `private_city` varchar(255) DEFAULT NULL COMMENT 'Private City',
  `private_zip` varchar(255) DEFAULT NULL COMMENT 'Private Postcode',
  `private_car_plate` varchar(255) DEFAULT NULL COMMENT 'Private Car Plate',
  `lang` varchar(255) DEFAULT NULL COMMENT 'Language',
  `gender` varchar(255) DEFAULT NULL COMMENT 'Gender',
  `birthday` varchar(255) DEFAULT NULL COMMENT 'Birthday',
  `marital` varchar(255) NOT NULL DEFAULT 'single' COMMENT 'Marital status',
  `spouse_complete_name` varchar(255) DEFAULT NULL COMMENT 'Spouse Complete Name',
  `spouse_birthdate` varchar(255) DEFAULT NULL COMMENT 'Spouse Birthdate',
  `place_of_birth` varchar(255) DEFAULT NULL COMMENT 'Place of Birth',
  `ssnid` varchar(255) DEFAULT NULL COMMENT 'SSN ID',
  `sinid` varchar(255) DEFAULT NULL COMMENT 'SIN ID',
  `identification_id` varchar(255) DEFAULT NULL COMMENT 'Identification ID',
  `national_id_file_path` varchar(255) DEFAULT NULL,
  `passport_id` varchar(255) DEFAULT NULL COMMENT 'Passport ID',
  `passport_image_path` varchar(255) DEFAULT NULL,
  `permit_no` varchar(255) DEFAULT NULL COMMENT 'Permit No',
  `visa_no` varchar(255) DEFAULT NULL COMMENT 'Visa No',
  `certificate` varchar(255) DEFAULT NULL COMMENT 'Certificate',
  `study_field` varchar(255) DEFAULT NULL COMMENT 'Study Field',
  `study_school` varchar(255) DEFAULT NULL COMMENT 'Study School',
  `emergency_contact` varchar(255) DEFAULT NULL COMMENT 'Emergency Contact',
  `emergency_phone` varchar(255) DEFAULT NULL COMMENT 'Emergency Phone',
  `emergency_contact_relation` varchar(255) DEFAULT NULL,
  `agreed_to_terms` tinyint(1) NOT NULL DEFAULT 0,
  `agreed_to_terms_at` timestamp NULL DEFAULT NULL,
  `employee_type` varchar(255) NOT NULL DEFAULT 'employee' COMMENT 'Employee Type',
  `barcode` varchar(255) DEFAULT NULL COMMENT 'Barcode',
  `pin` varchar(255) DEFAULT NULL COMMENT 'Pin',
  `visa_expire` varchar(255) DEFAULT NULL COMMENT 'Visa Expire',
  `work_permit_expiration_date` varchar(255) DEFAULT NULL COMMENT 'Work Permit Expiration Date',
  `departure_date` varchar(255) DEFAULT NULL COMMENT 'Departure Date',
  `departure_description` text DEFAULT NULL COMMENT 'Departure Description',
  `additional_note` text DEFAULT NULL COMMENT 'Additional Note',
  `notes` text DEFAULT NULL COMMENT 'Notes',
  `is_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Status',
  `is_flexible` tinyint(1) DEFAULT NULL COMMENT 'Is Flexible',
  `is_fully_flexible` tinyint(1) DEFAULT NULL COMMENT 'Is Fully Flexible',
  `work_permit_scheduled_activity` tinyint(1) DEFAULT NULL COMMENT 'Work Permit Scheduled Activity',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_employees_user_id_unique` (`user_id`),
  KEY `employees_employees_private_state_id_foreign` (`private_state_id`),
  KEY `employees_employees_private_country_id_foreign` (`private_country_id`),
  KEY `employees_employees_company_id_foreign` (`company_id`),
  KEY `employees_employees_creator_id_foreign` (`creator_id`),
  KEY `employees_employees_calendar_id_foreign` (`calendar_id`),
  KEY `employees_employees_department_id_foreign` (`department_id`),
  KEY `employees_employees_job_id_foreign` (`job_id`),
  KEY `employees_employees_partner_id_foreign` (`partner_id`),
  KEY `employees_employees_work_location_id_foreign` (`work_location_id`),
  KEY `employees_employees_parent_id_foreign` (`parent_id`),
  KEY `employees_employees_coach_id_foreign` (`coach_id`),
  KEY `employees_employees_state_id_foreign` (`state_id`),
  KEY `employees_employees_country_id_foreign` (`country_id`),
  KEY `employees_employees_country_of_birth_foreign` (`country_of_birth`),
  KEY `employees_employees_departure_reason_id_foreign` (`departure_reason_id`),
  KEY `employees_employees_bank_account_id_foreign` (`bank_account_id`),
  KEY `employees_employees_leave_manager_id_foreign` (`leave_manager_id`),
  KEY `employees_employees_attendance_manager_id_foreign` (`attendance_manager_id`),
  CONSTRAINT `employees_employees_attendance_manager_id_foreign` FOREIGN KEY (`attendance_manager_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employees_bank_account_id_foreign` FOREIGN KEY (`bank_account_id`) REFERENCES `partners_bank_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employees_calendar_id_foreign` FOREIGN KEY (`calendar_id`) REFERENCES `calendars` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employees_coach_id_foreign` FOREIGN KEY (`coach_id`) REFERENCES `employees_employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employees_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employees_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employees_country_of_birth_foreign` FOREIGN KEY (`country_of_birth`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employees_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `employees_departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employees_departure_reason_id_foreign` FOREIGN KEY (`departure_reason_id`) REFERENCES `employees_departure_reasons` (`id`),
  CONSTRAINT `employees_employees_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `employees_job_positions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employees_leave_manager_id_foreign` FOREIGN KEY (`leave_manager_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employees_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `employees_employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employees_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners_partners` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employees_private_country_id_foreign` FOREIGN KEY (`private_country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employees_private_state_id_foreign` FOREIGN KEY (`private_state_id`) REFERENCES `states` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employees_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `employees_employees_work_location_id_foreign` FOREIGN KEY (`work_location_id`) REFERENCES `employees_work_locations` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_employees`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_employees` WRITE;
/*!40000 ALTER TABLE `employees_employees` DISABLE KEYS */;
INSERT INTO `employees_employees` VALUES
(48,'Africa/Cairo',NULL,NULL,1,NULL,'Equity bank','40252886696','maic sebakara',NULL,NULL,NULL,12,1,2,29,31,535,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Maic Sebakara','Senior Software Engineer',NULL,'0786091893',NULL,NULL,0,0,NULL,'maicseba@gmail.com',NULL,NULL,'Kigali - kicukiro',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'single',NULL,NULL,NULL,NULL,NULL,'1199480114404285','employees/onboarding/nid/01KQZPXKYT331ENMEZESEEJCTV.jpeg',NULL,'employees/onboarding/passport/01KQZPXKYKT42ZB4ZJXMDCQCEJ.jpeg',NULL,NULL,NULL,NULL,NULL,'Njyewe','0738117065','ndahari',1,'2026-05-06 20:35:46','employee',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,NULL,'2026-05-06 20:25:32','2026-05-06 20:35:46'),
(49,'Africa/Cairo',NULL,NULL,1,NULL,'Equity bank','402511897865','mavenge mavin',NULL,NULL,1,13,1,2,24,32,537,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Mavenge Mavin','Software Engineer',NULL,'0786091893',NULL,NULL,0,0,NULL,'maic.sebakara@kwikkoders.com',NULL,NULL,'Kigali - Remera',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'single',NULL,NULL,NULL,NULL,NULL,'1199480114404199','employees/onboarding/nid/01KQZRX6XTH7DMD4EQH7J1H7Y1.png',NULL,'employees/onboarding/passport/01KQZRX6XNWTMHNPZ4F373ZVBM.jpg',NULL,NULL,NULL,NULL,NULL,'mavin','0738117065','hatari',1,'2026-05-06 21:10:29','employee',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,NULL,'2026-05-06 20:56:06','2026-05-06 21:10:29'),
(50,'UTC',NULL,NULL,NULL,NULL,'bk','100200300300400','muneza',NULL,NULL,NULL,14,1,NULL,29,31,539,NULL,48,NULL,NULL,NULL,NULL,NULL,NULL,'Mugisha Muneza','Frontend developer',NULL,'21872412121',NULL,NULL,0,0,NULL,'rwandicp@gmail.com',NULL,NULL,'kicukiro',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'single',NULL,NULL,NULL,NULL,NULL,'1234567898765432','employees/onboarding/nid/01KR3868Y658XX5SGWQDZHRNDE.jpeg',NULL,'employees/onboarding/passport/01KR3868Y52FNHHRKMA15PJWW0.jpeg',NULL,NULL,NULL,NULL,NULL,'njyewe','09988777777','ntacyo',1,'2026-05-08 05:35:18','employee',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,NULL,'2026-05-08 05:32:50','2026-05-08 05:35:18');
/*!40000 ALTER TABLE `employees_employees` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_employment_types`
--

DROP TABLE IF EXISTS `employees_employment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_employment_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort order',
  `name` varchar(255) NOT NULL COMMENT 'Employment type name',
  `code` varchar(255) DEFAULT NULL COMMENT 'Employment type code',
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_employment_types_country_id_foreign` (`country_id`),
  KEY `employees_employment_types_creator_id_foreign` (`creator_id`),
  CONSTRAINT `employees_employment_types_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_employment_types_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_employment_types`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_employment_types` WRITE;
/*!40000 ALTER TABLE `employees_employment_types` DISABLE KEYS */;
INSERT INTO `employees_employment_types` VALUES
(34,1,'Permanent','Permanent',NULL,1,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(35,2,'Temporary','Temporary',NULL,1,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(36,3,'Seasonal','Seasonal',NULL,1,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(37,4,'Interim','Interim',NULL,1,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(38,5,'Full-Time','Full-Time',NULL,1,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(39,6,'Intern','Intern',NULL,1,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(40,8,'Student','Student',NULL,1,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(41,9,'Apprenticeship','Apprenticeship',NULL,1,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(42,10,'Thesis','Thesis',NULL,1,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(43,11,'Statutory','Statutory',NULL,1,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(44,12,'Employee','Employee',NULL,1,'2026-04-24 05:31:44','2026-04-24 05:31:44');
/*!40000 ALTER TABLE `employees_employment_types` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_job_positions`
--

DROP TABLE IF EXISTS `employees_job_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_job_positions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort order',
  `expected_employees` int(11) DEFAULT NULL COMMENT 'Expected Employees',
  `no_of_employee` int(11) DEFAULT NULL COMMENT 'No of employees',
  `no_of_recruitment` int(11) DEFAULT NULL COMMENT 'No of recruitment',
  `department_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Department',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `address_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Job Location',
  `manager_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Department Manager',
  `industry_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Partner Industry',
  `recruiter_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Recruiter',
  `no_of_hired_employee` int(11) DEFAULT NULL COMMENT 'No of Hired Employee',
  `date_from` timestamp NULL DEFAULT NULL COMMENT 'Date From',
  `date_to` timestamp NULL DEFAULT NULL COMMENT 'Date To',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `employment_type_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Employment Type',
  `name` varchar(255) NOT NULL COMMENT 'Job Position Name',
  `description` text DEFAULT NULL COMMENT 'Job Description',
  `requirements` text DEFAULT NULL COMMENT 'Requirements',
  `is_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Active Status',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_job_positions_department_id_foreign` (`department_id`),
  KEY `employees_job_positions_creator_id_foreign` (`creator_id`),
  KEY `employees_job_positions_company_id_foreign` (`company_id`),
  KEY `employees_job_positions_employment_type_id_foreign` (`employment_type_id`),
  KEY `employees_job_positions_address_id_foreign` (`address_id`),
  KEY `employees_job_positions_manager_id_foreign` (`manager_id`),
  KEY `employees_job_positions_industry_id_foreign` (`industry_id`),
  KEY `employees_job_positions_recruiter_id_foreign` (`recruiter_id`),
  CONSTRAINT `employees_job_positions_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `partners_partners` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_job_positions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_job_positions_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_job_positions_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `employees_departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_job_positions_employment_type_id_foreign` FOREIGN KEY (`employment_type_id`) REFERENCES `employees_employment_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_job_positions_industry_id_foreign` FOREIGN KEY (`industry_id`) REFERENCES `partners_industries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_job_positions_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `employees_employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_job_positions_recruiter_id_foreign` FOREIGN KEY (`recruiter_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_job_positions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_job_positions` WRITE;
/*!40000 ALTER TABLE `employees_job_positions` DISABLE KEYS */;
INSERT INTO `employees_job_positions` VALUES
(31,1,10,8,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'Software Engineer','Develop and maintain software solutions.','Proficiency in programming languages like PHP, JavaScript, and Python.',1,NULL,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(32,2,2,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'HR Manager','Manage HR activities, including recruitment and employee relations.','Experience in HR management and excellent interpersonal skills.',1,NULL,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(33,3,5,3,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'Marketing Specialist','Plan and execute marketing campaigns.','Knowledge of digital marketing, content creation, and analytics tools.',1,NULL,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(34,4,4,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'Sales Manager','Oversee the sales team and develop strategies to increase revenue.','Strong background in sales and leadership experience.',1,NULL,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(35,5,3,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'Product Manager','Oversee the development and lifecycle of products from start to finish.','Experience in product management and market research.',1,NULL,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(36,6,2,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'UX/UI Designer','Design intuitive user interfaces and improve user experience.','Experience with design tools like Sketch, Figma, Adobe XD.',0,NULL,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(37,7,5,3,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'Customer Support Specialist','Provide assistance to customers and solve their issues.','Excellent communication skills and patience.',1,NULL,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(38,8,6,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'Data Scientist','Analyze and interpret complex data to help make strategic decisions.','Strong background in statistics, programming, and machine learning.',1,NULL,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(39,9,4,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'Finance Analyst','Analyze financial data and prepare reports to guide company decisions.','Experience in financial analysis and accounting.',1,NULL,'2026-04-24 05:31:44','2026-04-24 05:31:44'),
(40,10,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'Legal Advisor','Provide legal guidance to the company and handle legal matters.','Law degree and experience in corporate law.',1,NULL,'2026-04-24 05:31:44','2026-04-24 05:31:44');
/*!40000 ALTER TABLE `employees_job_positions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_reviews`
--

DROP TABLE IF EXISTS `employees_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `reviewer_id` bigint(20) unsigned DEFAULT NULL,
  `period_type` varchar(255) NOT NULL,
  `period_start` date NOT NULL,
  `period_end` date NOT NULL,
  `period_label` varchar(255) NOT NULL,
  `metrics_snapshot` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metrics_snapshot`)),
  `manager_rating` decimal(5,2) DEFAULT NULL,
  `manager_comments` text DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_reviews_period_unique` (`employee_id`,`period_type`,`period_start`,`period_end`),
  KEY `employees_reviews_reviewer_id_foreign` (`reviewer_id`),
  KEY `employees_reviews_company_id_foreign` (`company_id`),
  CONSTRAINT `employees_reviews_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_reviews_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees_employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_reviews_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_reviews`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_reviews` WRITE;
/*!40000 ALTER TABLE `employees_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees_reviews` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_skill_levels`
--

DROP TABLE IF EXISTS `employees_skill_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_skill_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `level` int(11) DEFAULT NULL COMMENT 'Level',
  `default_level` tinyint(1) DEFAULT NULL COMMENT 'Default Levell',
  `skill_type_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Skill Type',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_skill_levels_skill_type_id_index` (`skill_type_id`),
  KEY `employees_skill_levels_creator_id_index` (`creator_id`),
  CONSTRAINT `employees_skill_levels_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_skill_levels_skill_type_id_foreign` FOREIGN KEY (`skill_type_id`) REFERENCES `employees_skill_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_skill_levels`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_skill_levels` WRITE;
/*!40000 ALTER TABLE `employees_skill_levels` DISABLE KEYS */;
INSERT INTO `employees_skill_levels` VALUES
(76,'A1',10,1,1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(77,'A2',40,NULL,1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(78,'B1',60,NULL,1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(79,'B2',75,NULL,1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(80,'C1',85,NULL,1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(81,'C2',100,NULL,1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(82,'Beginner',15,1,2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(83,'Elementary',25,NULL,2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(84,'Intermediate',50,NULL,2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(85,'Advanced',80,NULL,2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(86,'Expert',100,NULL,2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(87,'Beginner',15,1,3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(88,'Elementary',25,NULL,3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(89,'Intermediate',50,NULL,3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(90,'Advanced',80,NULL,3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(91,'Expert',100,NULL,3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(92,'L1',25,1,5,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(93,'L2',50,NULL,5,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(94,'L3',75,NULL,5,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(95,'L4',100,NULL,5,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(96,'Beginner',15,1,4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(97,'Elementary',25,NULL,4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(98,'Intermediate',50,NULL,4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(99,'Advanced',80,NULL,4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(100,'Expert',100,NULL,4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL);
/*!40000 ALTER TABLE `employees_skill_levels` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_skill_types`
--

DROP TABLE IF EXISTS `employees_skill_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_skill_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `color` varchar(255) DEFAULT NULL COMMENT 'Color',
  `is_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Active Status',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_skill_types_creator_id_foreign` (`creator_id`),
  CONSTRAINT `employees_skill_types_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_skill_types`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_skill_types` WRITE;
/*!40000 ALTER TABLE `employees_skill_types` DISABLE KEYS */;
INSERT INTO `employees_skill_types` VALUES
(1,'Languages','danger',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(2,'Soft Skills','success',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(3,'Programming Languages','warning',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(4,'IT','info',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(5,'Marketing','gray',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL);
/*!40000 ALTER TABLE `employees_skill_types` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_skills`
--

DROP TABLE IF EXISTS `employees_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_skills` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort Order',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `skill_type_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Skill Type',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_skills_skill_type_id_index` (`skill_type_id`),
  KEY `employees_skills_creator_id_index` (`creator_id`),
  CONSTRAINT `employees_skills_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_skills_skill_type_id_foreign` FOREIGN KEY (`skill_type_id`) REFERENCES `employees_skill_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_skills`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_skills` WRITE;
/*!40000 ALTER TABLE `employees_skills` DISABLE KEYS */;
INSERT INTO `employees_skills` VALUES
(259,10,'French',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(260,10,'Spanish',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(261,10,'English',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(262,10,'German',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(263,10,'Filipino',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(264,10,'Arabic',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(265,10,'Bengali',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(266,10,'Mandarin Chinese',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(267,10,'Wu Chinese',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(268,10,'Hindi',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(269,10,'Russian',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(270,10,'Portuguese',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(271,10,'Indonesian',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(272,10,'Urdu',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(273,10,'Japanese',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(274,10,'Punjabi',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(275,10,'Javanese',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(276,10,'Telugu',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(277,10,'Turkish',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(278,10,'Korean',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(279,10,'Marathi',1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(280,10,'Communication',2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(281,10,'Teamwork',2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(282,10,'Problem-Solving',2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(283,10,'Time Management',2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(284,10,'Critical Thinking',2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(285,10,'Decision-Making',2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(286,10,'Organizational',2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(287,10,'Stress management',2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(288,10,'Adaptability',2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(289,10,'Conflict Management',2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(290,10,'Leadership',2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(291,10,'Creativity',2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(292,10,'Resourcefulness',2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(293,10,'Persuasion',2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(294,10,'Openness to criticism',2,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(295,10,'Javascript',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(296,10,'Python',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(297,10,'C/C++',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(298,10,'Android',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(299,10,'Hadoop',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(300,10,'Spark',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(301,10,'React',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(302,10,'Django',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(303,10,'RDMS',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(304,10,'NoSQL',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(305,10,'Go',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(306,10,'Java',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(307,10,'Kotlin',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(308,10,'PHP',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(309,10,'C#',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(310,10,'Swift',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(311,10,'R',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(312,10,'Ruby',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(313,10,'Matlab',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(314,10,'TypeScript',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(315,10,'Scala',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(316,10,'HTML',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(317,10,'CSS',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(318,10,'Rust',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(319,10,'Perl',3,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(320,10,'Web Development',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(321,10,'Database Management',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(322,10,'Cloud computing',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(323,10,'Network administration',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(324,10,'Cybersecurity',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(325,10,'DevOps',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(326,10,'Machine Learning (AI)',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(327,10,'Data analysis/visualization',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(328,10,'Agile and Scrum methodologies',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(329,10,'Mobile app development',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(330,10,'Project Management',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(331,10,'System Administration (Linux, Windows)',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(332,10,'Virtualization and Containerization',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(333,10,'IT support',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(334,10,'IT infrastructure and architecture',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(335,10,'IT service management (ITSM)',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(336,10,'Big data technologies (Hadoop, Spark)',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(337,10,'IoT and embedded systems',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(338,10,'IT governance and compliance (GDPR, HIPAA,...)',4,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(339,10,'Communication',5,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(340,10,'Analytics',5,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(341,10,'Digital advertising',5,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(342,10,'Public Speaking',5,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(343,10,'CMS',5,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(344,10,'Email Marketing',5,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL);
/*!40000 ALTER TABLE `employees_skills` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `employees_work_locations`
--

DROP TABLE IF EXISTS `employees_work_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_work_locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Work Location',
  `location_type` varchar(255) NOT NULL COMMENT 'Cover Image',
  `location_number` varchar(255) DEFAULT NULL COMMENT 'Location Number',
  `is_active` tinyint(1) DEFAULT 0 COMMENT 'Status',
  `company_id` bigint(20) unsigned NOT NULL COMMENT 'Company',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created by',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_work_locations_company_id_foreign` (`company_id`),
  KEY `employees_work_locations_creator_id_foreign` (`creator_id`),
  CONSTRAINT `employees_work_locations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `employees_work_locations_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_work_locations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `employees_work_locations` WRITE;
/*!40000 ALTER TABLE `employees_work_locations` DISABLE KEYS */;
INSERT INTO `employees_work_locations` VALUES
(10,'Home','home',NULL,1,1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(11,'Building 1, Second Floor','office',NULL,1,1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL),
(12,'Other','other',NULL,1,1,1,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL);
/*!40000 ALTER TABLE `employees_work_locations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `exports`
--

DROP TABLE IF EXISTS `exports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `exports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_disk` varchar(255) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `exporter` varchar(255) NOT NULL,
  `processed_rows` int(10) unsigned NOT NULL DEFAULT 0,
  `total_rows` int(10) unsigned NOT NULL,
  `successful_rows` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exports_user_id_foreign` (`user_id`),
  CONSTRAINT `exports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exports`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `exports` WRITE;
/*!40000 ALTER TABLE `exports` DISABLE KEYS */;
/*!40000 ALTER TABLE `exports` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `failed_import_rows`
--

DROP TABLE IF EXISTS `failed_import_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_import_rows` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `import_id` bigint(20) unsigned NOT NULL,
  `validation_error` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `failed_import_rows_import_id_foreign` (`import_id`),
  CONSTRAINT `failed_import_rows_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_import_rows`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `failed_import_rows` WRITE;
/*!40000 ALTER TABLE `failed_import_rows` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_import_rows` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `importer` varchar(255) NOT NULL,
  `processed_rows` int(10) unsigned NOT NULL DEFAULT 0,
  `total_rows` int(10) unsigned NOT NULL,
  `successful_rows` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imports_user_id_foreign` (`user_id`),
  CONSTRAINT `imports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `job_position_skills`
--

DROP TABLE IF EXISTS `job_position_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_position_skills` (
  `job_position_id` bigint(20) unsigned NOT NULL,
  `skill_id` bigint(20) unsigned NOT NULL,
  KEY `job_position_skills_job_position_id_foreign` (`job_position_id`),
  KEY `job_position_skills_skill_id_foreign` (`skill_id`),
  CONSTRAINT `job_position_skills_job_position_id_foreign` FOREIGN KEY (`job_position_id`) REFERENCES `employees_job_positions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `job_position_skills_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `employees_skills` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_position_skills`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `job_position_skills` WRITE;
/*!40000 ALTER TABLE `job_position_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_position_skills` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES
(1,'default','{\"uuid\":\"f92579d0-3593-4eb6-b5a2-093387e8a963\",\"displayName\":\"Filament\\\\Auth\\\\Notifications\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:27:\\\"Webkul\\\\Security\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:3;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Auth\\\\Notifications\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:236:\\\"http:\\/\\/ops.kwikkoders.com\\/admin\\/password-reset\\/reset?email=murinzimpanoderrick%40gmail.com&token=2f7b6e870e72b6ba44928ca8298c232c9eab08e059fdba210cbadd9d5177921b&signature=a739a732309c3aa5c36b2f48d761e86b55ccce0dc4294730bcf39bbe6fb3bea4\\\";s:5:\\\"token\\\";s:64:\\\"2f7b6e870e72b6ba44928ca8298c232c9eab08e059fdba210cbadd9d5177921b\\\";s:2:\\\"id\\\";s:36:\\\"e1621118-779a-4132-93e6-a3ac7120b234\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}',0,NULL,1777044202,1777044202),
(2,'default','{\"uuid\":\"b7d047cb-fb07-4036-94bf-a1c0cce3be21\",\"displayName\":\"Filament\\\\Auth\\\\Notifications\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:27:\\\"Webkul\\\\Security\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:4;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Auth\\\\Notifications\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:229:\\\"http:\\/\\/ops.kwikkoders.com\\/admin\\/password-reset\\/reset?email=maicsebakara%40gmail.com&token=7b9fb7f21a4a940054c86fe1d61f068f8c697f326d72adb624d01dd02587463e&signature=2119e148fd00642ddb260940ec82e37e858793754cf9415a0d3835a0d74ea9c1\\\";s:5:\\\"token\\\";s:64:\\\"7b9fb7f21a4a940054c86fe1d61f068f8c697f326d72adb624d01dd02587463e\\\";s:2:\\\"id\\\";s:36:\\\"34356f12-00ed-4c66-bf27-9df0e94c14ec\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}',0,NULL,1777044850,1777044850),
(3,'default','{\"uuid\":\"69e5bc87-e046-40d0-af2e-3a3ee3958893\",\"displayName\":\"Filament\\\\Auth\\\\Notifications\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:27:\\\"Webkul\\\\Security\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:4;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Auth\\\\Notifications\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:229:\\\"http:\\/\\/ops.kwikkoders.com\\/admin\\/password-reset\\/reset?email=maicsebakara%40gmail.com&token=d68166d18b4136315b69d38b459e1c92bacfd4c3916e3df64f3351e57b26c2a4&signature=0b5933486e09142024c0211e114cb3fcec64b5a5a8e349d9c1253123fb2679d2\\\";s:5:\\\"token\\\";s:64:\\\"d68166d18b4136315b69d38b459e1c92bacfd4c3916e3df64f3351e57b26c2a4\\\";s:2:\\\"id\\\";s:36:\\\"c757d693-cf56-42b6-8666-ffb1382a5b28\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}',0,NULL,1777045459,1777045459),
(4,'default','{\"uuid\":\"032f1d50-2560-4679-af80-f7d7fb7c5c7c\",\"displayName\":\"Filament\\\\Auth\\\\Notifications\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:29:\\\"Webkul\\\\Website\\\\Models\\\\Partner\\\";s:2:\\\"id\\\";a:1:{i:0;i:46;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Auth\\\\Notifications\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:223:\\\"http:\\/\\/ops.kwikkoders.com\\/password-reset\\/reset?email=maicsebakara%40gmail.com&token=ef5931000479384df64df051e220763d06eb5c4173ee418b82e718a9cc718085&signature=ba033c6c2e72a8afec25d3d475f97ff9012607424b3281ca96a82d7d8a4fe2cd\\\";s:5:\\\"token\\\";s:64:\\\"ef5931000479384df64df051e220763d06eb5c4173ee418b82e718a9cc718085\\\";s:2:\\\"id\\\";s:36:\\\"227272e6-34da-4884-bf69-ea96c11d6f4d\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}',0,NULL,1777055978,1777055978);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2022_12_14_083707_create_settings_table',1),
(5,'2024_11_04_132945_create_permission_tables',1),
(6,'2024_11_05_042358_create_user_settings',1),
(7,'2024_11_05_105102_create_plugins_table',1),
(8,'2024_11_05_105112_create_plugin_dependencies_table',1),
(9,'2024_11_11_112529_create_user_invitations_table',1),
(10,'2024_11_12_125715_create_teams_table',1),
(11,'2024_11_12_130019_create_user_team_table',1),
(12,'2024_11_13_052541_create_custom_fields_table',1),
(13,'2024_11_19_142134_create_table_views_table',1),
(14,'2024_11_21_142134_create_table_view_favorites_table',1),
(15,'2024_11_26_053234_add_resource_permission_column_to_users_table',1),
(16,'2024_12_06_061927_create_currencies_table',1),
(17,'2024_12_10_092651_create_countries_table',1),
(18,'2024_12_10_092657_create_companies_table',1),
(19,'2024_12_10_092657_create_states_table',1),
(20,'2024_12_10_100944_create_user_allowed_companies_table',1),
(21,'2024_12_10_101127_add_default_company_id_column_to_users_table',1),
(22,'2024_12_10_101420_create_banks_table',1),
(23,'2024_12_11_101127_create_partners_industries_table',1),
(24,'2024_12_11_101127_create_partners_titles_table',1),
(25,'2024_12_11_101220_create_partners_partners_table',1),
(26,'2024_12_11_101222_create_chatter_followers_table',1),
(27,'2024_12_11_101420_create_partners_bank_accounts_table',1),
(28,'2024_12_11_101927_create_partners_tags_table',1),
(29,'2024_12_11_111929_create_partners_partner_tag_table',1),
(30,'2024_12_12_114620_create_activity_plans_table',1),
(31,'2024_12_12_115256_create_activity_types_table',1),
(32,'2024_12_12_115728_create_activity_plan_templates_table',1),
(33,'2024_12_13_130906_add_partner_id_to_users_table',1),
(34,'2024_12_17_082318_create_activity_type_suggestions_table',1),
(35,'2024_12_18_131844_create_analytic_records_table',1),
(36,'2024_12_23_062355_create_chatter_messages_table',1),
(37,'2024_12_23_080148_create_chatter_attachments_table',1),
(38,'2025_01_03_061445_create_email_logs_table',1),
(39,'2025_01_03_105625_create_unit_of_measure_categories_table',1),
(40,'2025_01_03_105627_create_unit_of_measures_table',1),
(41,'2025_01_07_125015_add_partner_id_to_companies_table',1),
(42,'2025_01_09_111545_create_utm_mediums_table',1),
(43,'2025_01_09_114324_create_utm_sources_table',1),
(44,'2025_01_10_094256_create_utm_stages_table',1),
(45,'2025_01_10_094325_create_utm_campaigns_table',1),
(46,'2025_03_12_072356_add_column_is_read_to_chatter_messages_table',1),
(47,'2025_03_28_115218_add_address_columns_in_partners_partners_table',1),
(48,'2025_04_04_061507_add_address_columns_in_companies_table',1),
(49,'2025_04_04_062023_alter_companies_table',1),
(50,'2025_07_29_064223_create_currency_settings',1),
(51,'2025_08_01_071239_alter_teams_table',1),
(52,'2025_08_01_073954_alter_users_table',1),
(53,'2025_08_08_104317_alter_utm_stages_table',1),
(54,'2025_08_08_104814_alter_utm_campaigns_table',1),
(55,'2025_08_21_082229_alter_roles_table',1),
(56,'2025_08_21_101646_alter_users_table',1),
(57,'2025_10_10_080114_create_currency_rates_table',1),
(58,'2025_11_14_102615_alter_currency_rates_table',1),
(59,'2026_01_14_150817_create_imports_table',1),
(60,'2026_01_14_150818_create_exports_table',1),
(61,'2026_01_14_150819_create_failed_import_rows_table',1),
(62,'2026_01_14_151113_create_notifications_table',1),
(63,'2026_01_23_074142_add_multi_factor_auth_columns_in_users_table',1),
(64,'2026_01_28_134402_create_personal_access_tokens_table',1),
(65,'2026_03_18_000001_alter_unit_of_measures_factor_precision',1),
(66,'2026_04_02_000001_create_calendars_table',1),
(67,'2024_12_12_074920_create_projects_project_stages_table',2),
(68,'2024_12_12_074929_create_projects_projects_table',2),
(69,'2024_12_12_074930_create_projects_milestones_table',2),
(70,'2024_12_12_100227_create_projects_user_project_favorites_table',2),
(71,'2024_12_12_100230_create_projects_tags_table',2),
(72,'2024_12_12_100232_create_projects_project_tag_table',2),
(73,'2024_12_12_101340_create_projects_task_stages_table',2),
(74,'2024_12_12_101344_create_projects_tasks_table',2),
(75,'2024_12_12_101350_create_projects_task_users_table',2),
(76,'2024_12_12_101352_create_projects_task_tag_table',2),
(77,'2024_12_18_145142_add_columns_to_analytic_records_table',2),
(78,'2025_09_24_062711_remove_tags_column_from_projects_tasks_table',2),
(79,'2024_12_16_094021_create_project_task_settings',3),
(80,'2024_12_16_094021_create_project_time_settings',3),
(81,'2024_12_11_045350_create_employees_work_locations_table',4),
(82,'2024_12_11_051916_create_employees_departments_table',4),
(83,'2024_12_11_054555_create_employees_categories_table',4),
(84,'2024_12_11_073130_create_employees_employment_types_table',4),
(85,'2024_12_11_075004_create_employees_skill_types_table',4),
(86,'2024_12_11_075011_create_employees_skill_levels_table',4),
(87,'2024_12_11_075017_create_employees_skills_table',4),
(88,'2024_12_11_081046_create_employees_job_positions_table',4),
(89,'2024_12_11_120605_create_employees_departure_reasons_table',4),
(90,'2024_12_12_063353_create_employees_employees_table',4),
(91,'2024_12_12_063354_create_employees_employee_skills_table',4),
(92,'2024_12_12_140840_create_employees_employee_categories_table',4),
(93,'2024_12_16_065746_create_employees_employee_resume_line_types_table',4),
(94,'2024_12_16_070029_create_employees_employee_resumes_table',4),
(95,'2025_01_08_104443_add_manager_id_to_employees_departments_table',4),
(96,'2025_01_15_045708_create_job_position_skills_table',4),
(97,'2025_01_24_052852_add_department_id_to_activity_plans_table',4),
(98,'2025_08_20_082638_add_unique_user_id_to_employees_employees_table',4),
(99,'2025_03_10_064655_alter_partners_partners_table',5),
(100,'2025_03_10_094011_create_website_pages_table',5),
(101,'2025_03_10_094021_create_website_contact_settings',6),
(102,'2025_01_05_063925_create_products_categories_table',7),
(103,'2025_01_05_100751_create_products_products_table',7),
(104,'2025_01_05_100830_create_products_tags_table',7),
(105,'2025_01_05_100832_create_products_product_tag_table',7),
(106,'2025_01_05_104456_create_products_attributes_table',7),
(107,'2025_01_05_104512_create_products_attribute_options_table',7),
(108,'2025_01_05_104759_create_products_product_attributes_table',7),
(109,'2025_01_05_104809_create_products_product_attribute_values_table',7),
(110,'2025_01_05_105626_create_products_packagings_table',7),
(111,'2025_01_05_113357_create_products_price_rules_table',7),
(112,'2025_01_05_113402_create_products_price_rule_items_table',7),
(113,'2025_01_05_123412_create_products_product_suppliers_table',7),
(114,'2025_02_18_112837_create_products_product_price_lists_table',7),
(115,'2025_02_21_053249 _create_products_product_combinations_table',7),
(116,'2025_07_28_080116_alter_products_products_table',7),
(117,'2025_01_17_094022_create_products_product_settings',8),
(118,'2025_01_29_044430_create_accounts_payment_terms_table',9),
(119,'2025_01_29_064646_create_accounts_payment_due_terms_table',9),
(120,'2025_01_29_134156_create_accounts_incoterms_table',9),
(121,'2025_01_29_134157_create_accounts_tax_groups_table',9),
(122,'2025_01_30_054952_create_accounts_accounts_table',9),
(123,'2025_01_30_054955_create_accounts_account_companies_table',9),
(124,'2025_01_30_061945_create_accounts_account_tags_table',9),
(125,'2025_01_30_083208_create_accounts_taxes_table',9),
(126,'2025_01_30_123324_create_accounts_tax_partition_lines_table',9),
(127,'2025_01_31_073645_create_accounts_journals_table',9),
(128,'2025_01_31_095921_create_accounts_journal_accounts_table',9),
(129,'2025_01_31_125419_create_accounts_tax_tax_relations_table',9),
(130,'2025_02_03_054613_create_accounts_account_taxes_table',9),
(131,'2025_02_03_055117_create_accounts_account_account_tags_table',9),
(132,'2025_02_03_055709_create_accounts_account_journals_table',9),
(133,'2025_02_03_121847_create_accounts_fiscal_positions_table',9),
(134,'2025_02_03_131858_create_accounts_fiscal_position_taxes_table',9),
(135,'2025_02_03_131860_create_accounts_fiscal_position_accounts_table',9),
(136,'2025_02_03_144139_create_accounts_cash_roundings_table',9),
(137,'2025_02_04_082243_alter_products_products_table',9),
(138,'2025_02_04_104958_create_accounts_product_taxes_table',9),
(139,'2025_02_04_111337_create_accounts_product_supplier_taxes_table',9),
(140,'2025_02_10_073440_create_accounts_reconciles_table',9),
(141,'2025_02_10_075022_create_accounts_payment_methods_table',9),
(142,'2025_02_10_075607_create_accounts_payment_method_lines_table',9),
(143,'2025_02_11_041318_create_accounts_bank_statements_table',9),
(144,'2025_02_11_055302_create_accounts_account_payments_table',9),
(145,'2025_02_11_055302_create_accounts_bank_statement_lines_table',9),
(146,'2025_02_11_055303_create_accounts_account_moves_table',9),
(147,'2025_02_11_071210_create_accounts_account_move_lines_table',9),
(148,'2025_02_11_100912_add_move_id_column_to_accounts_bank_statement_lines_table',9),
(149,'2025_02_11_115401_create_accounts_full_reconciles_table',9),
(150,'2025_02_11_120712_create_accounts_partial_reconciles_table',9),
(151,'2025_02_11_121630_add_columns_to_accounts_moves_table',9),
(152,'2025_02_11_121635_add_columns_to_accounts_account_payments_table',9),
(153,'2025_02_11_121635_add_columns_to_accounts_moves_lines_table',9),
(154,'2025_02_17_064828_create_accounts_payment_registers_table',9),
(155,'2025_02_17_070121_create_accounts_account_payment_register_move_lines_table',9),
(156,'2025_02_24_123300_add_additional_columns_to_partners_partners_table',9),
(157,'2025_02_24_124300_create_accounts_accounts_move_line_taxes_table',9),
(158,'2025_02_27_112520_create_accounts_accounts_move_reversals_table',9),
(159,'2025_02_27_132520_create_accounts_accounts_move_reversal_move_table',9),
(160,'2025_02_27_142520_create_accounts_accounts_move_reversal_new_move_table',9),
(161,'2025_02_28_142520_create_accounts_accounts_move_payment_table',9),
(162,'2025_04_10_053345_alter_accounts_account_moves_table',9),
(163,'2025_04_10_053349_alter_accounts_account_move_lines_table',9),
(164,'2025_08_01_091957_alter_accounts_payment_terms_table',9),
(165,'2025_08_04_062050_alter_accounts_taxes_table',9),
(166,'2025_08_11_043945_alter_accounts_reconciles_table',9),
(167,'2025_08_11_044151_alter_accounts_payments_methods_table',9),
(168,'2025_08_11_044258_alter_accounts_bank_statements_table',9),
(169,'2025_08_11_044445_alter_accounts_account_payments_table',9),
(170,'2025_08_11_044603_alter_accounts_bank_statement_lines_table',9),
(171,'2025_08_11_044842_alter_accounts_account_move_lines_table',9),
(172,'2025_08_11_044931_alter_accounts_partial_reconciles_table',9),
(173,'2025_10_23_082243_alter_products_categories_table',9),
(174,'2025_11_19_081920_alter_accounts_account_move_lines_table',9),
(175,'2025_12_09_103848_alter_accounts_payment_method_lines_table',9),
(176,'2025_12_16_074557_add_journal_id_in_accounts_accounts_move_reversals_table',9),
(177,'2026_01_15_060822_backfill_customer_and_supplier_rank_in_partners_table',9),
(178,'2026_02_16_063000_alter_partners_partners_table',9),
(179,'2026_02_25_044931_alter_accounts_full_reconciles_table',9),
(180,'2026_03_03_120000_alter_accounts_journals_bank_account_foreign_key',9),
(181,'2025_12_02_094021_create_accounts_default_accounts_settings',10),
(182,'2025_12_02_094021_create_accounts_taxes_settings',10),
(183,'2025_12_02_094021_create_customer_invoice_settings',10),
(184,'2025_01_06_133002_create_recruitments_stages_table',11),
(185,'2025_01_07_053021_create_recruitments_stages_jobs_table',11),
(186,'2025_01_09_071817_create_recruitments_degrees_table',11),
(187,'2025_01_09_082748_create_recruitments_refuse_reasons_table',11),
(188,'2025_01_09_095909_create_recruitments_applicant_categories_table',11),
(189,'2025_01_09_125852_create_recruitments_candidates_table',11),
(190,'2025_01_10_045048_create_recruitments_candidate_applicant_categories_table',11),
(191,'2025_01_10_082944_create_recruitments_candidate_skills_table',11),
(192,'2025_01_10_115422_create_recruitments_applicants_table',11),
(193,'2025_01_13_072547_create_recruitments_applicant_interviewers_table',11),
(194,'2025_01_13_075926_create_recruitments_applicant_applicant_categories_table',11),
(195,'2025_01_14_080159_add_is_default_column_stages_table',11),
(196,'2025_01_14_143102_add_columns_to_employees_job_positions_table',11),
(197,'2025_01_16_081327_create_recruitments_job_position_interviewers_table',11),
(198,'2025_01_17_080711_create_time_off_leave_types_table',12),
(199,'2025_01_17_080712_create_time_off_leaves_table',12),
(200,'2025_01_20_080058_create_time_off_user_leave_types_table',12),
(201,'2025_01_20_130725_create_time_off_leave_mandatory_days_table',12),
(202,'2025_01_21_073921_create_time_off_leave_accrual_plans_table',12),
(203,'2025_01_21_085833_create_time_off_leave_accrual_levels_table',12),
(204,'2025_01_22_101656_create_time_off_leave_allocations_table',12),
(205,'2025_08_13_120000_alter_private_name_column_in_time_off_leaves_table',12),
(206,'2025_03_06_093011_create_blogs_categories_table',13),
(207,'2025_03_06_094011_create_blogs_posts_table',13),
(208,'2025_03_07_065635_create_blogs_tags_table',13),
(209,'2025_03_07_065715_create_blogs_post_tags_table',13),
(210,'2025_09_03_070414_alter_blogs_posts_table',13),
(211,'2026_04_28_180000_add_receipt_attachment_to_accounts_payments_tables',14),
(212,'2026_05_01_120000_create_employees_reviews_table',15),
(213,'2026_05_05_100000_create_employees_employee_documents_table',15),
(214,'2026_05_05_173000_add_signature_audit_fields_to_employees_employee_documents_table',16),
(215,'2026_05_06_101000_create_documents_table',17),
(216,'2026_05_06_101100_create_document_user_table',17),
(217,'2026_05_06_101200_create_signatures_table',17),
(218,'2026_05_06_101300_create_audit_logs_table',17),
(219,'2026_05_06_120000_add_signed_file_sha256_to_employees_employee_documents_table',18),
(220,'2026_05_06_123000_add_onboarding_fields_to_employees_employees_table',19),
(221,'2026_05_07_090000_create_employees_chat_messages_table',20),
(222,'2026_05_08_090000_add_bank_account_holder_name_to_employees_employees_table',21),
(223,'2026_05_07_151000_create_documentation_articles_table',22),
(224,'2026_05_07_153500_add_project_and_assignee_to_documentation_articles_table',23),
(225,'2026_05_07_230000_add_documentation_assignee_to_projects_table',24);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES
(1,'Webkul\\Security\\Models\\User',1),
(8,'Webkul\\Security\\Models\\User',12),
(8,'Webkul\\Security\\Models\\User',13),
(8,'Webkul\\Security\\Models\\User',14);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `partners_bank_accounts`
--

DROP TABLE IF EXISTS `partners_bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `partners_bank_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_number` varchar(255) NOT NULL,
  `account_holder_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `can_send_money` tinyint(1) NOT NULL DEFAULT 0,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `partner_id` bigint(20) unsigned NOT NULL,
  `bank_id` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partners_bank_accounts_account_number_unique` (`account_number`),
  KEY `partners_bank_accounts_creator_id_foreign` (`creator_id`),
  KEY `partners_bank_accounts_partner_id_foreign` (`partner_id`),
  KEY `partners_bank_accounts_bank_id_foreign` (`bank_id`),
  CONSTRAINT `partners_bank_accounts_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `partners_bank_accounts_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `partners_bank_accounts_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners_partners` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners_bank_accounts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `partners_bank_accounts` WRITE;
/*!40000 ALTER TABLE `partners_bank_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners_bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `partners_industries`
--

DROP TABLE IF EXISTS `partners_industries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `partners_industries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partners_industries_creator_id_foreign` (`creator_id`),
  CONSTRAINT `partners_industries_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners_industries`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `partners_industries` WRITE;
/*!40000 ALTER TABLE `partners_industries` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners_industries` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `partners_partner_tag`
--

DROP TABLE IF EXISTS `partners_partner_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `partners_partner_tag` (
  `tag_id` bigint(20) unsigned NOT NULL,
  `partner_id` bigint(20) unsigned NOT NULL,
  KEY `partners_partner_tag_tag_id_foreign` (`tag_id`),
  KEY `partners_partner_tag_partner_id_foreign` (`partner_id`),
  CONSTRAINT `partners_partner_tag_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners_partners` (`id`) ON DELETE CASCADE,
  CONSTRAINT `partners_partner_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `partners_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners_partner_tag`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `partners_partner_tag` WRITE;
/*!40000 ALTER TABLE `partners_partner_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners_partner_tag` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `partners_partners`
--

DROP TABLE IF EXISTS `partners_partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `partners_partners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_type` varchar(255) NOT NULL DEFAULT 'individual',
  `sub_type` varchar(255) DEFAULT 'partner',
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `tax_id` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `company_registry` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `title_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `industry_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street1` varchar(255) DEFAULT NULL COMMENT 'Street 1',
  `street2` varchar(255) DEFAULT NULL COMMENT 'Street 2',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `zip` varchar(255) DEFAULT NULL COMMENT 'Zip',
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `message_bounce` int(11) DEFAULT NULL COMMENT 'Message Bounce',
  `supplier_rank` int(11) DEFAULT NULL COMMENT 'Supplier Rank',
  `customer_rank` int(11) DEFAULT NULL COMMENT 'Customer Rank',
  `invoice_warning` varchar(255) DEFAULT NULL COMMENT 'Invoice',
  `autopost_bills` varchar(255) DEFAULT NULL COMMENT 'Auto post bills',
  `credit_limit` varchar(255) DEFAULT NULL COMMENT 'Credit Limits',
  `ignore_abnormal_invoice_date` varchar(255) DEFAULT NULL COMMENT 'Ignore Abnormal Invoice Date',
  `ignore_abnormal_invoice_amount` varchar(255) DEFAULT NULL COMMENT 'Ignore abnormal Invoice amount',
  `invoice_sending_method` varchar(255) DEFAULT NULL COMMENT 'Invoice Sending',
  `invoice_edi_format_store` varchar(255) DEFAULT NULL COMMENT 'Invoice Edi Format Store',
  `trust` int(11) DEFAULT NULL COMMENT 'Degree of trust you have in this debtor',
  `invoice_warn_msg` int(11) DEFAULT NULL COMMENT 'Message for Invoice',
  `debit_limit` decimal(16,2) DEFAULT NULL COMMENT 'Debit Limit',
  `peppol_endpoint` varchar(255) DEFAULT NULL COMMENT 'Peppol Endpoint',
  `peppol_eas` varchar(255) DEFAULT NULL COMMENT 'Peppol EAS',
  `sale_warn` varchar(255) DEFAULT NULL COMMENT 'Sale Warning',
  `sale_warn_msg` varchar(255) DEFAULT NULL COMMENT 'Sale Warning Message',
  `comment` text DEFAULT NULL COMMENT 'Comment',
  `property_account_payable_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Account Payable',
  `property_account_receivable_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Account Receivable',
  `property_account_position_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Account Position',
  `property_payment_term_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Payment Term',
  `property_supplier_payment_term_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Supplier payment term',
  `property_inbound_payment_method_line_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Property Inbound Payment Method Line',
  `property_outbound_payment_method_line_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Property Outbound Payment Method Line',
  PRIMARY KEY (`id`),
  KEY `partners_partners_parent_id_foreign` (`parent_id`),
  KEY `partners_partners_creator_id_foreign` (`creator_id`),
  KEY `partners_partners_user_id_foreign` (`user_id`),
  KEY `partners_partners_title_id_foreign` (`title_id`),
  KEY `partners_partners_company_id_foreign` (`company_id`),
  KEY `partners_partners_industry_id_foreign` (`industry_id`),
  KEY `partners_partners_sub_type_index` (`sub_type`),
  KEY `partners_partners_name_index` (`name`),
  KEY `partners_partners_tax_id_index` (`tax_id`),
  KEY `partners_partners_phone_index` (`phone`),
  KEY `partners_partners_mobile_index` (`mobile`),
  KEY `partners_partners_company_registry_index` (`company_registry`),
  KEY `partners_partners_reference_index` (`reference`),
  KEY `partners_partners_state_id_foreign` (`state_id`),
  KEY `partners_partners_country_id_foreign` (`country_id`),
  KEY `fk_partners_account_payable` (`property_account_payable_id`),
  KEY `fk_partners_account_receivable` (`property_account_receivable_id`),
  KEY `fk_partners_payment_term` (`property_payment_term_id`),
  KEY `fk_partners_supplier_payment_term` (`property_supplier_payment_term_id`),
  KEY `fk_partners_inbound_payment_method` (`property_inbound_payment_method_line_id`),
  KEY `fk_partners_outbound_payment_method` (`property_outbound_payment_method_line_id`),
  KEY `fk_partners_fiscal_position` (`property_account_position_id`),
  CONSTRAINT `fk_partners_account_payable` FOREIGN KEY (`property_account_payable_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_partners_account_receivable` FOREIGN KEY (`property_account_receivable_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_partners_fiscal_position` FOREIGN KEY (`property_account_position_id`) REFERENCES `accounts_fiscal_positions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_partners_inbound_payment_method` FOREIGN KEY (`property_inbound_payment_method_line_id`) REFERENCES `accounts_payment_method_lines` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_partners_outbound_payment_method` FOREIGN KEY (`property_outbound_payment_method_line_id`) REFERENCES `accounts_payment_method_lines` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_partners_payment_term` FOREIGN KEY (`property_payment_term_id`) REFERENCES `accounts_payment_terms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_partners_supplier_payment_term` FOREIGN KEY (`property_supplier_payment_term_id`) REFERENCES `accounts_payment_terms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `partners_partners_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `partners_partners_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `partners_partners_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `partners_partners_industry_id_foreign` FOREIGN KEY (`industry_id`) REFERENCES `partners_industries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `partners_partners_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `partners_partners` (`id`) ON DELETE SET NULL,
  CONSTRAINT `partners_partners_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  CONSTRAINT `partners_partners_title_id_foreign` FOREIGN KEY (`title_id`) REFERENCES `partners_titles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `partners_partners_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=540 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners_partners`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `partners_partners` WRITE;
/*!40000 ALTER TABLE `partners_partners` DISABLE KEYS */;
INSERT INTO `partners_partners` VALUES
(1,'individual','company','Global Kwik koders','company-logos/01KQ009RM6S8CDCD2XTEDENHM3.jpeg','info@kwikkoders.com',NULL,'https://www.kwikkoders.com','DUM123456','+250780146796','+250780146796','#211b47','DUMREG789',NULL,NULL,1,NULL,NULL,1,NULL,NULL,'2026-04-23 20:44:25','2026-04-24 13:03:58',NULL,NULL,NULL,NULL,NULL,191,NULL,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,'individual','partner','kwikkoders',NULL,'admin@example.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,1,NULL,NULL,'2026-04-23 20:45:03','2026-05-05 08:33:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,'individual','employee','Paul Williams',NULL,'paul@example.com','Experienced Developer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:15:41','2026-04-24 05:15:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,'individual','employee','John Doe',NULL,'john@example.com','Junior Developer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:15:41','2026-04-24 05:15:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,'individual','employee','Jane Smith',NULL,'jane@example.com','Project Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:15:41','2026-04-24 05:15:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(6,'individual','employee','Ravi Kumar',NULL,'ravi@example.com','Team Lead',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:15:42','2026-04-24 05:15:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(7,'individual','employee','Emily Davis',NULL,'emily@example.com','QA Engineer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:15:42','2026-04-24 05:15:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(8,'individual','employee','Michael Brown',NULL,'michael@example.com','UX Designer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:15:42','2026-04-24 05:15:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(9,'individual','employee','Hiro Tanaka',NULL,'hiro@example.com','Backend Developer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:15:42','2026-04-24 05:15:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10,'individual','employee','Linda Ndlovu',NULL,'linda@example.com','HR Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:15:42','2026-04-24 05:15:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(11,'individual','employee','Hans Müller',NULL,'hans@example.com','Frontend Developer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:15:42','2026-04-24 05:15:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(12,'individual','employee','Grace Wilson',NULL,'grace@example.com','Data Scientist',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:15:42','2026-04-24 05:15:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13,'individual','employee','Paul Williams',NULL,'paul@example.com','Experienced Developer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:29:05','2026-04-24 05:29:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(14,'individual','employee','John Doe',NULL,'john@example.com','Junior Developer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:29:06','2026-04-24 05:29:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(15,'individual','employee','Jane Smith',NULL,'jane@example.com','Project Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:29:06','2026-04-24 05:29:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(16,'individual','employee','Ravi Kumar',NULL,'ravi@example.com','Team Lead',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:29:06','2026-04-24 05:29:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(17,'individual','employee','Emily Davis',NULL,'emily@example.com','QA Engineer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:29:06','2026-04-24 05:29:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(18,'individual','employee','Michael Brown',NULL,'michael@example.com','UX Designer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:29:06','2026-04-24 05:29:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(19,'individual','employee','Hiro Tanaka',NULL,'hiro@example.com','Backend Developer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:29:06','2026-04-24 05:29:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(20,'individual','employee','Linda Ndlovu',NULL,'linda@example.com','HR Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:29:06','2026-04-24 05:29:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(21,'individual','employee','Hans Müller',NULL,'hans@example.com','Frontend Developer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:29:06','2026-04-24 05:29:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(22,'individual','employee','Grace Wilson',NULL,'grace@example.com','Data Scientist',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:29:06','2026-04-24 05:29:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(23,'individual','employee','Paul Williams',NULL,'paul@example.com','Experienced Developer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:30:55','2026-04-24 05:30:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(24,'individual','employee','John Doe',NULL,'john@example.com','Junior Developer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:30:55','2026-04-24 05:30:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(25,'individual','employee','Jane Smith',NULL,'jane@example.com','Project Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:30:55','2026-04-24 05:30:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(26,'individual','employee','Ravi Kumar',NULL,'ravi@example.com','Team Lead',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:30:56','2026-04-24 05:30:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(27,'individual','employee','Emily Davis',NULL,'emily@example.com','QA Engineer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:30:56','2026-04-24 05:30:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(28,'individual','employee','Michael Brown',NULL,'michael@example.com','UX Designer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:30:56','2026-04-24 05:30:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(29,'individual','employee','Hiro Tanaka',NULL,'hiro@example.com','Backend Developer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:30:56','2026-04-24 05:30:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(30,'individual','employee','Linda Ndlovu',NULL,'linda@example.com','HR Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:30:56','2026-04-24 05:30:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(31,'individual','employee','Hans Müller',NULL,'hans@example.com','Frontend Developer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:30:56','2026-04-24 05:30:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(32,'individual','employee','Grace Wilson',NULL,'grace@example.com','Data Scientist',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:30:56','2026-04-24 05:30:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(33,'individual','employee','Paul Williams',NULL,'paul@example.com','Experienced Developer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(34,'individual','employee','John Doe',NULL,'john@example.com','Junior Developer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(35,'individual','employee','Jane Smith',NULL,'jane@example.com','Project Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(36,'individual','employee','Ravi Kumar',NULL,'ravi@example.com','Team Lead',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(37,'individual','employee','Emily Davis',NULL,'emily@example.com','QA Engineer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:31:44','2026-04-24 05:31:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(38,'individual','employee','Michael Brown',NULL,'michael@example.com','UX Designer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:31:45','2026-04-24 05:31:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(39,'individual','employee','Hiro Tanaka',NULL,'hiro@example.com','Backend Developer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:31:45','2026-04-24 05:31:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(40,'individual','employee','Linda Ndlovu',NULL,'linda@example.com','HR Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:31:45','2026-04-24 05:31:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(41,'individual','employee','Hans Müller',NULL,'hans@example.com','Frontend Developer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:31:45','2026-04-24 05:31:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(42,'individual','employee','Grace Wilson',NULL,'grace@example.com','Data Scientist',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 05:31:45','2026-04-24 05:31:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(43,'individual','partner','Maic',NULL,'admin1@example.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-04-24 12:03:27','2026-04-24 12:03:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'$2y$12$91tYQE120ApqXTjoTMd2xO8DeMQHS8/l2kK/brjHItkXRp9pWtU1W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(44,'individual','partner','Tricia Ingabire ',NULL,'ingtricy@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 13:08:59','2026-04-24 13:08:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(45,'individual','partner','Murinzi Mpano Derrick ',NULL,'murinzimpanoderrick@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2026-04-24 13:13:03','2026-05-06 09:51:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(46,'individual','partner','Maic Sebakara','users/avatars/01KQ01ZQ43J3HGEPDXH4Y3K8SX.jpeg','maicsebakara@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-24 13:33:27','2026-04-24 13:33:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(47,'individual','partner','Himbaza Caleb',NULL,'caleb@example.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-27 05:34:49','2026-04-27 05:34:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(48,'individual','partner','Derrick',NULL,'derrick@employee.local',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-04-27 08:39:34','2026-04-27 08:39:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(49,'individual','employee','Derrick',NULL,'murinzimpanoderrick@gmail.com','software Engineer ',NULL,NULL,'0737379857','0788263843','#030303',NULL,NULL,37,NULL,NULL,NULL,1,NULL,NULL,'2026-04-27 08:39:34','2026-05-05 14:04:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(50,'individual','partner','Mpano',NULL,'buenosdiasevil@mai.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-04-28 10:43:54','2026-04-28 10:43:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(51,'individual','employee','Mpano',NULL,'buenosdiasevil@mai.com','UIUX Designer ',NULL,NULL,'0788263843','0737379857','#0d0c0c',NULL,NULL,41,NULL,NULL,NULL,1,NULL,NULL,'2026-04-28 10:43:54','2026-04-28 10:43:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(52,'individual','partner','Murengezi kabano',NULL,'kabanomurengezi@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-04-30 05:54:06','2026-04-30 05:55:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(53,'individual','employee','kabano murengezi',NULL,'kabanomurengezi@gmail.com','Backend engineer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,1,NULL,NULL,NULL,NULL,NULL,'2026-04-30 05:54:23','2026-04-30 05:54:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(54,'individual','partner','Carl mabuka',NULL,'carl.mabuka@kwikkoders.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-04-30 07:39:56','2026-04-30 07:39:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'$2y$12$OggZv7vLNcSanB7PL0pyoOmG7Euci8JyxsSJpeS3YcIV36mU2fLC.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(55,'company','partner','SFH ',NULL,'ingtricy@gmail.com','Partner',NULL,'102640461','+250784500003',NULL,NULL,NULL,NULL,NULL,1,NULL,1,NULL,NULL,NULL,'2026-04-30 09:53:47','2026-04-30 09:53:47',NULL,NULL,NULL,NULL,NULL,191,NULL,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p></p>',16,7,NULL,NULL,NULL,NULL,NULL),
(56,'individual','partner','Muhirwa Aime',NULL,'maic@blockchain.org.rw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,'2026-05-06 06:07:23','2026-05-06 06:07:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(57,'individual','employee','Muhirwa Aime',NULL,'maic@blockchain.org.rw','Tech lead',NULL,NULL,NULL,'0786091893',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-05-06 06:07:28','2026-05-06 19:08:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(58,'individual','employee','Tricia Mutesi',NULL,'ingtricy@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-05-06 07:08:48','2026-05-06 07:08:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(59,'individual','partner','Tricia Ingabire',NULL,'tricia.ingabire@kwikkoders.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,'2026-05-06 07:13:12','2026-05-06 07:13:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(60,'individual','employee','Tricia Ingabire',NULL,'tricia.ingabire@kwikkoders.com','Assistant Admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-05-06 07:13:16','2026-05-06 07:13:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(61,'individual','partner','Maic Sebakara',NULL,'maic.sebakara@kwikkoders.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,'2026-05-06 08:33:19','2026-05-06 08:33:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(62,'individual','employee','Maic Sebakara',NULL,'maic.sebakara@kwikkoders.com','Software Engineer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-05-06 08:33:23','2026-05-06 08:33:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(534,'individual','partner','Maic Sebakara',NULL,'maicseba@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,12,NULL,1,NULL,NULL,'2026-05-06 20:25:33','2026-05-06 20:35:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(535,'individual','employee','Maic Sebakara',NULL,'maicseba@gmail.com','Senior Software Engineer',NULL,NULL,NULL,'0786091893',NULL,NULL,NULL,NULL,1,12,NULL,NULL,NULL,NULL,'2026-05-06 20:25:38','2026-05-06 20:35:46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(536,'individual','partner','Mavenge Mavin',NULL,'maic.sebakara@kwikkoders.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,13,NULL,1,NULL,NULL,'2026-05-06 20:56:06','2026-05-06 21:10:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(537,'individual','employee','Mavenge Mavin',NULL,'maic.sebakara@kwikkoders.com','Software Engineer',NULL,NULL,NULL,'0786091893',NULL,NULL,NULL,NULL,1,13,NULL,1,NULL,NULL,'2026-05-06 20:56:11','2026-05-06 21:10:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(538,'individual','partner','Mugisha Muneza',NULL,'rwandicp@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,14,NULL,1,NULL,NULL,'2026-05-08 05:32:50','2026-05-08 05:32:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(539,'individual','employee','Mugisha Muneza',NULL,'rwandicp@gmail.com','Frontend developer',NULL,NULL,NULL,'21872412121',NULL,NULL,NULL,48,1,14,NULL,NULL,NULL,NULL,'2026-05-08 05:32:56','2026-05-08 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `partners_partners` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `partners_tags`
--

DROP TABLE IF EXISTS `partners_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `partners_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partners_tags_name_unique` (`name`),
  KEY `partners_tags_creator_id_foreign` (`creator_id`),
  CONSTRAINT `partners_tags_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners_tags`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `partners_tags` WRITE;
/*!40000 ALTER TABLE `partners_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners_tags` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `partners_titles`
--

DROP TABLE IF EXISTS `partners_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `partners_titles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partners_titles_creator_id_foreign` (`creator_id`),
  CONSTRAINT `partners_titles_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners_titles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `partners_titles` WRITE;
/*!40000 ALTER TABLE `partners_titles` DISABLE KEYS */;
INSERT INTO `partners_titles` VALUES
(1,'SFH','SFH',1,'2026-04-30 09:53:14','2026-04-30 09:53:14');
/*!40000 ALTER TABLE `partners_titles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES
(1,'view_any_field_field','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(2,'view_field_field','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(3,'create_field_field','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(4,'update_field_field','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(5,'delete_field_field','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(6,'delete_any_field_field','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(7,'restore_field_field','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(8,'restore_any_field_field','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(9,'force_delete_field_field','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(10,'force_delete_any_field_field','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(11,'reorder_field_field','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(12,'view_any_partner_address','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(13,'view_partner_address','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(14,'create_partner_address','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(15,'update_partner_address','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(16,'delete_partner_address','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(17,'delete_any_partner_address','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(18,'restore_partner_address','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(19,'restore_any_partner_address','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(20,'force_delete_partner_address','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(21,'force_delete_any_partner_address','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(22,'view_any_partner_bank::account','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(23,'view_partner_bank::account','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(24,'create_partner_bank::account','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(25,'update_partner_bank::account','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(26,'delete_partner_bank::account','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(27,'delete_any_partner_bank::account','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(28,'restore_partner_bank::account','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(29,'restore_any_partner_bank::account','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(30,'force_delete_partner_bank::account','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(31,'force_delete_any_partner_bank::account','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(32,'view_any_partner_bank','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(33,'view_partner_bank','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(34,'create_partner_bank','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(35,'update_partner_bank','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(36,'delete_partner_bank','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(37,'delete_any_partner_bank','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(38,'restore_partner_bank','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(39,'restore_any_partner_bank','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(40,'force_delete_partner_bank','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(41,'force_delete_any_partner_bank','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(42,'view_any_partner_industry','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(43,'view_partner_industry','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(44,'create_partner_industry','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(45,'update_partner_industry','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(46,'delete_partner_industry','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(47,'delete_any_partner_industry','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(48,'restore_partner_industry','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(49,'restore_any_partner_industry','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(50,'force_delete_partner_industry','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(51,'force_delete_any_partner_industry','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(52,'view_any_partner_partner','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(53,'view_partner_partner','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(54,'create_partner_partner','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(55,'update_partner_partner','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(56,'delete_partner_partner','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(57,'delete_any_partner_partner','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(58,'restore_partner_partner','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(59,'restore_any_partner_partner','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(60,'force_delete_partner_partner','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(61,'force_delete_any_partner_partner','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(62,'view_any_partner_tag','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(63,'view_partner_tag','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(64,'create_partner_tag','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(65,'update_partner_tag','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(66,'delete_partner_tag','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(67,'delete_any_partner_tag','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(68,'restore_partner_tag','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(69,'restore_any_partner_tag','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(70,'force_delete_partner_tag','web','2026-04-23 20:44:22','2026-04-23 20:44:22'),
(71,'force_delete_any_partner_tag','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(72,'view_any_partner_title','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(73,'view_partner_title','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(74,'create_partner_title','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(75,'update_partner_title','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(76,'delete_partner_title','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(77,'delete_any_partner_title','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(78,'view_any_plugin_manager_plugin','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(79,'view_plugin_manager_plugin','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(80,'create_plugin_manager_plugin','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(81,'update_plugin_manager_plugin','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(82,'delete_plugin_manager_plugin','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(83,'delete_any_plugin_manager_plugin','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(84,'reorder_plugin_manager_plugin','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(85,'view_any_security_company','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(86,'view_security_company','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(87,'create_security_company','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(88,'update_security_company','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(89,'delete_security_company','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(90,'delete_any_security_company','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(91,'restore_security_company','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(92,'restore_any_security_company','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(93,'force_delete_security_company','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(94,'force_delete_any_security_company','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(95,'reorder_security_company','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(96,'view_any_role','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(97,'view_role','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(98,'create_role','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(99,'update_role','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(100,'delete_role','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(101,'delete_any_role','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(102,'view_any_security_team','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(103,'view_security_team','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(104,'create_security_team','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(105,'update_security_team','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(106,'delete_security_team','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(107,'delete_any_security_team','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(108,'view_any_security_user','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(109,'view_security_user','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(110,'create_security_user','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(111,'update_security_user','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(112,'delete_security_user','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(113,'delete_any_security_user','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(114,'restore_security_user','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(115,'restore_any_security_user','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(116,'force_delete_security_user','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(117,'force_delete_any_security_user','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(118,'view_any_support_activity::type','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(119,'view_support_activity::type','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(120,'create_support_activity::type','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(121,'update_support_activity::type','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(122,'delete_support_activity::type','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(123,'delete_any_support_activity::type','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(124,'restore_support_activity::type','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(125,'restore_any_support_activity::type','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(126,'force_delete_support_activity::type','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(127,'force_delete_any_support_activity::type','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(128,'reorder_support_activity::type','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(129,'view_any_support_bank','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(130,'view_support_bank','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(131,'create_support_bank','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(132,'update_support_bank','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(133,'delete_support_bank','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(134,'delete_any_support_bank','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(135,'restore_support_bank','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(136,'restore_any_support_bank','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(137,'force_delete_support_bank','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(138,'force_delete_any_support_bank','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(139,'view_any_support_calendar','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(140,'view_support_calendar','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(141,'create_support_calendar','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(142,'update_support_calendar','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(143,'delete_support_calendar','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(144,'delete_any_support_calendar','web','2026-04-23 20:44:23','2026-04-23 20:44:23'),
(145,'restore_support_calendar','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(146,'restore_any_support_calendar','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(147,'force_delete_support_calendar','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(148,'force_delete_any_support_calendar','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(149,'view_any_support_company','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(150,'view_support_company','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(151,'create_support_company','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(152,'update_support_company','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(153,'delete_support_company','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(154,'delete_any_support_company','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(155,'restore_support_company','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(156,'restore_any_support_company','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(157,'force_delete_support_company','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(158,'force_delete_any_support_company','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(159,'reorder_support_company','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(160,'view_any_support_country','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(161,'view_support_country','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(162,'create_support_country','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(163,'update_support_country','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(164,'delete_support_country','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(165,'delete_any_support_country','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(166,'view_any_support_currency','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(167,'view_support_currency','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(168,'create_support_currency','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(169,'update_support_currency','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(170,'delete_support_currency','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(171,'delete_any_support_currency','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(172,'view_any_support_state','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(173,'view_support_state','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(174,'create_support_state','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(175,'update_support_state','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(176,'delete_support_state','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(177,'delete_any_support_state','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(178,'view_any_support_u::o::m::category','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(179,'view_support_u::o::m::category','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(180,'create_support_u::o::m::category','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(181,'update_support_u::o::m::category','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(182,'delete_support_u::o::m::category','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(183,'delete_any_support_u::o::m::category','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(184,'page_security_manage_activity','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(185,'page_security_manage_currency','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(186,'page_security_manage_users','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(187,'page_support_profile','web','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(188,'view_any_project_activity::plan','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(189,'view_project_activity::plan','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(190,'create_project_activity::plan','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(191,'update_project_activity::plan','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(192,'delete_project_activity::plan','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(193,'delete_any_project_activity::plan','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(194,'restore_project_activity::plan','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(195,'restore_any_project_activity::plan','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(196,'force_delete_project_activity::plan','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(197,'force_delete_any_project_activity::plan','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(198,'view_any_project_milestone','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(199,'view_project_milestone','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(200,'create_project_milestone','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(201,'update_project_milestone','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(202,'delete_project_milestone','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(203,'delete_any_project_milestone','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(204,'view_any_project_project::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(205,'view_project_project::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(206,'create_project_project::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(207,'update_project_project::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(208,'delete_project_project::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(209,'delete_any_project_project::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(210,'restore_project_project::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(211,'restore_any_project_project::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(212,'force_delete_project_project::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(213,'force_delete_any_project_project::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(214,'reorder_project_project::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(215,'view_any_project_tag','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(216,'view_project_tag','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(217,'create_project_tag','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(218,'update_project_tag','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(219,'delete_project_tag','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(220,'delete_any_project_tag','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(221,'restore_project_tag','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(222,'restore_any_project_tag','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(223,'force_delete_project_tag','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(224,'force_delete_any_project_tag','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(225,'view_any_project_task::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(226,'view_project_task::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(227,'create_project_task::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(228,'update_project_task::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(229,'delete_project_task::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(230,'delete_any_project_task::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(231,'restore_project_task::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(232,'restore_any_project_task::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(233,'force_delete_project_task::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(234,'force_delete_any_project_task::stage','web','2026-04-24 05:14:54','2026-04-24 05:14:54'),
(235,'reorder_project_task::stage','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(236,'view_any_project_project','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(237,'view_project_project','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(238,'create_project_project','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(239,'update_project_project','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(240,'delete_project_project','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(241,'delete_any_project_project','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(242,'restore_project_project','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(243,'restore_any_project_project','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(244,'force_delete_project_project','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(245,'force_delete_any_project_project','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(246,'reorder_project_project','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(247,'view_any_project_task','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(248,'view_project_task','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(249,'create_project_task','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(250,'update_project_task','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(251,'delete_project_task','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(252,'delete_any_project_task','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(253,'restore_project_task','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(254,'restore_any_project_task','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(255,'force_delete_project_task','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(256,'force_delete_any_project_task','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(257,'reorder_project_task','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(258,'page_project_dashboard','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(259,'page_project_manage_tasks','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(260,'page_project_manage_time','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(261,'widget_project_stats_overview_widget','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(262,'widget_project_top_assignees_widget','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(263,'widget_project_top_projects_widget','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(264,'widget_project_task_by_stage_chart','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(265,'widget_project_task_by_state_chart','web','2026-04-24 05:14:55','2026-04-24 05:14:55'),
(266,'view_any_employee_activity::plan','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(267,'view_employee_activity::plan','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(268,'create_employee_activity::plan','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(269,'update_employee_activity::plan','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(270,'delete_employee_activity::plan','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(271,'delete_any_employee_activity::plan','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(272,'restore_employee_activity::plan','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(273,'restore_any_employee_activity::plan','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(274,'force_delete_employee_activity::plan','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(275,'force_delete_any_employee_activity::plan','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(276,'view_any_employee_departure::reason','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(277,'view_employee_departure::reason','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(278,'create_employee_departure::reason','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(279,'update_employee_departure::reason','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(280,'delete_employee_departure::reason','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(281,'delete_any_employee_departure::reason','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(282,'reorder_employee_departure::reason','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(283,'view_any_employee_employee::category','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(284,'view_employee_employee::category','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(285,'create_employee_employee::category','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(286,'update_employee_employee::category','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(287,'delete_employee_employee::category','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(288,'delete_any_employee_employee::category','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(289,'view_any_employee_employment::type','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(290,'view_employee_employment::type','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(291,'create_employee_employment::type','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(292,'update_employee_employment::type','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(293,'delete_employee_employment::type','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(294,'delete_any_employee_employment::type','web','2026-04-24 05:15:43','2026-04-24 05:15:43'),
(295,'reorder_employee_employment::type','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(296,'view_any_employee_job::position','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(297,'view_employee_job::position','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(298,'create_employee_job::position','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(299,'update_employee_job::position','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(300,'delete_employee_job::position','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(301,'delete_any_employee_job::position','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(302,'restore_employee_job::position','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(303,'restore_any_employee_job::position','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(304,'force_delete_employee_job::position','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(305,'force_delete_any_employee_job::position','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(306,'reorder_employee_job::position','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(307,'view_any_employee_skill::type','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(308,'view_employee_skill::type','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(309,'create_employee_skill::type','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(310,'update_employee_skill::type','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(311,'delete_employee_skill::type','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(312,'delete_any_employee_skill::type','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(313,'restore_employee_skill::type','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(314,'restore_any_employee_skill::type','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(315,'force_delete_employee_skill::type','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(316,'force_delete_any_employee_skill::type','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(317,'view_any_employee_work::location','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(318,'view_employee_work::location','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(319,'create_employee_work::location','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(320,'update_employee_work::location','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(321,'delete_employee_work::location','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(322,'delete_any_employee_work::location','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(323,'restore_employee_work::location','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(324,'restore_any_employee_work::location','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(325,'force_delete_employee_work::location','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(326,'force_delete_any_employee_work::location','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(327,'view_any_employee_employee::skill','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(328,'view_employee_employee::skill','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(329,'create_employee_employee::skill','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(330,'update_employee_employee::skill','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(331,'delete_employee_employee::skill','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(332,'delete_any_employee_employee::skill','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(333,'restore_employee_employee::skill','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(334,'restore_any_employee_employee::skill','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(335,'force_delete_employee_employee::skill','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(336,'force_delete_any_employee_employee::skill','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(337,'view_any_employee_department','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(338,'view_employee_department','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(339,'create_employee_department','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(340,'update_employee_department','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(341,'delete_employee_department','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(342,'delete_any_employee_department','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(343,'restore_employee_department','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(344,'restore_any_employee_department','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(345,'force_delete_employee_department','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(346,'force_delete_any_employee_department','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(347,'view_any_employee_employee','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(348,'view_employee_employee','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(349,'create_employee_employee','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(350,'update_employee_employee','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(351,'delete_employee_employee','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(352,'delete_any_employee_employee','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(353,'restore_employee_employee','web','2026-04-24 05:15:44','2026-04-24 05:15:44'),
(354,'restore_any_employee_employee','web','2026-04-24 05:15:45','2026-04-24 05:15:45'),
(355,'force_delete_employee_employee','web','2026-04-24 05:15:45','2026-04-24 05:15:45'),
(356,'force_delete_any_employee_employee','web','2026-04-24 05:15:45','2026-04-24 05:15:45'),
(357,'view_any_contact_bank::account','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(358,'view_contact_bank::account','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(359,'create_contact_bank::account','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(360,'update_contact_bank::account','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(361,'delete_contact_bank::account','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(362,'delete_any_contact_bank::account','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(363,'restore_contact_bank::account','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(364,'restore_any_contact_bank::account','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(365,'force_delete_contact_bank::account','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(366,'force_delete_any_contact_bank::account','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(367,'view_any_contact_bank','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(368,'view_contact_bank','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(369,'create_contact_bank','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(370,'update_contact_bank','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(371,'delete_contact_bank','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(372,'delete_any_contact_bank','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(373,'restore_contact_bank','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(374,'restore_any_contact_bank','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(375,'force_delete_contact_bank','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(376,'force_delete_any_contact_bank','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(377,'view_any_contact_industry','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(378,'view_contact_industry','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(379,'create_contact_industry','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(380,'update_contact_industry','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(381,'delete_contact_industry','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(382,'delete_any_contact_industry','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(383,'restore_contact_industry','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(384,'restore_any_contact_industry','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(385,'force_delete_contact_industry','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(386,'force_delete_any_contact_industry','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(387,'view_any_contact_tag','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(388,'view_contact_tag','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(389,'create_contact_tag','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(390,'update_contact_tag','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(391,'delete_contact_tag','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(392,'delete_any_contact_tag','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(393,'restore_contact_tag','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(394,'restore_any_contact_tag','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(395,'force_delete_contact_tag','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(396,'force_delete_any_contact_tag','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(397,'view_any_contact_title','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(398,'view_contact_title','web','2026-04-24 05:16:07','2026-04-24 05:16:07'),
(399,'create_contact_title','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(400,'update_contact_title','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(401,'delete_contact_title','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(402,'delete_any_contact_title','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(403,'view_any_contact_address','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(404,'view_contact_address','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(405,'create_contact_address','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(406,'update_contact_address','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(407,'delete_contact_address','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(408,'delete_any_contact_address','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(409,'restore_contact_address','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(410,'restore_any_contact_address','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(411,'force_delete_contact_address','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(412,'force_delete_any_contact_address','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(413,'view_any_contact_partner','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(414,'view_contact_partner','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(415,'create_contact_partner','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(416,'update_contact_partner','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(417,'delete_contact_partner','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(418,'delete_any_contact_partner','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(419,'restore_contact_partner','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(420,'restore_any_contact_partner','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(421,'force_delete_contact_partner','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(422,'force_delete_any_contact_partner','web','2026-04-24 05:16:08','2026-04-24 05:16:08'),
(423,'view_any_website_page','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(424,'view_website_page','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(425,'create_website_page','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(426,'update_website_page','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(427,'delete_website_page','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(428,'delete_any_website_page','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(429,'restore_website_page','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(430,'restore_any_website_page','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(431,'force_delete_website_page','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(432,'force_delete_any_website_page','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(433,'view_any_website_partner','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(434,'view_website_partner','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(435,'create_website_partner','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(436,'update_website_partner','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(437,'delete_website_partner','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(438,'delete_any_website_partner','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(439,'restore_website_partner','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(440,'restore_any_website_partner','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(441,'force_delete_website_partner','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(442,'force_delete_any_website_partner','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(443,'page_website_website_dashboard','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(444,'page_website_manage_contacts','web','2026-04-24 05:16:26','2026-04-24 05:16:26'),
(445,'view_any_product_attribute','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(446,'view_product_attribute','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(447,'create_product_attribute','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(448,'update_product_attribute','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(449,'delete_product_attribute','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(450,'delete_any_product_attribute','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(451,'restore_product_attribute','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(452,'restore_any_product_attribute','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(453,'force_delete_product_attribute','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(454,'force_delete_any_product_attribute','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(455,'reorder_product_attribute','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(456,'view_any_product_category','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(457,'view_product_category','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(458,'create_product_category','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(459,'update_product_category','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(460,'delete_product_category','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(461,'delete_any_product_category','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(462,'view_any_product_packaging','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(463,'view_product_packaging','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(464,'create_product_packaging','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(465,'update_product_packaging','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(466,'delete_product_packaging','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(467,'delete_any_product_packaging','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(468,'reorder_product_packaging','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(469,'view_any_product_price::list','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(470,'view_product_price::list','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(471,'create_product_price::list','web','2026-04-24 05:16:57','2026-04-24 05:16:57'),
(472,'update_product_price::list','web','2026-04-24 05:16:58','2026-04-24 05:16:58'),
(473,'delete_product_price::list','web','2026-04-24 05:16:58','2026-04-24 05:16:58'),
(474,'delete_any_product_price::list','web','2026-04-24 05:16:58','2026-04-24 05:16:58'),
(475,'reorder_product_price::list','web','2026-04-24 05:16:58','2026-04-24 05:16:58'),
(476,'view_any_product_product','web','2026-04-24 05:16:58','2026-04-24 05:16:58'),
(477,'view_product_product','web','2026-04-24 05:16:58','2026-04-24 05:16:58'),
(478,'create_product_product','web','2026-04-24 05:16:58','2026-04-24 05:16:58'),
(479,'update_product_product','web','2026-04-24 05:16:58','2026-04-24 05:16:58'),
(480,'delete_product_product','web','2026-04-24 05:16:58','2026-04-24 05:16:58'),
(481,'delete_any_product_product','web','2026-04-24 05:16:58','2026-04-24 05:16:58'),
(482,'restore_product_product','web','2026-04-24 05:16:58','2026-04-24 05:16:58'),
(483,'restore_any_product_product','web','2026-04-24 05:16:58','2026-04-24 05:16:58'),
(484,'force_delete_product_product','web','2026-04-24 05:16:58','2026-04-24 05:16:58'),
(485,'force_delete_any_product_product','web','2026-04-24 05:16:58','2026-04-24 05:16:58'),
(486,'reorder_product_product','web','2026-04-24 05:16:58','2026-04-24 05:16:58'),
(487,'view_any_account_account','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(488,'view_account_account','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(489,'create_account_account','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(490,'update_account_account','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(491,'delete_account_account','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(492,'delete_any_account_account','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(493,'view_any_account_account::tag','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(494,'view_account_account::tag','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(495,'create_account_account::tag','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(496,'update_account_account::tag','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(497,'delete_account_account::tag','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(498,'delete_any_account_account::tag','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(499,'view_any_account_bank::account','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(500,'view_account_bank::account','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(501,'create_account_bank::account','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(502,'update_account_bank::account','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(503,'delete_account_bank::account','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(504,'delete_any_account_bank::account','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(505,'restore_account_bank::account','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(506,'restore_any_account_bank::account','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(507,'force_delete_account_bank::account','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(508,'force_delete_any_account_bank::account','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(509,'view_any_account_bill','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(510,'view_account_bill','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(511,'create_account_bill','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(512,'update_account_bill','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(513,'delete_account_bill','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(514,'delete_any_account_bill','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(515,'reorder_account_bill','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(516,'view_any_account_cash::rounding','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(517,'view_account_cash::rounding','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(518,'create_account_cash::rounding','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(519,'update_account_cash::rounding','web','2026-04-24 05:18:31','2026-04-24 05:18:31'),
(520,'delete_account_cash::rounding','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(521,'delete_any_account_cash::rounding','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(522,'view_any_account_credit::note','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(523,'view_account_credit::note','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(524,'create_account_credit::note','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(525,'update_account_credit::note','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(526,'delete_account_credit::note','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(527,'delete_any_account_credit::note','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(528,'reorder_account_credit::note','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(529,'view_any_account_customer','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(530,'view_account_customer','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(531,'create_account_customer','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(532,'update_account_customer','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(533,'delete_account_customer','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(534,'delete_any_account_customer','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(535,'restore_account_customer','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(536,'restore_any_account_customer','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(537,'force_delete_account_customer','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(538,'force_delete_any_account_customer','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(539,'view_any_account_fiscal::position','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(540,'view_account_fiscal::position','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(541,'create_account_fiscal::position','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(542,'update_account_fiscal::position','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(543,'delete_account_fiscal::position','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(544,'delete_any_account_fiscal::position','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(545,'reorder_account_fiscal::position','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(546,'view_any_account_incoterm','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(547,'view_account_incoterm','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(548,'create_account_incoterm','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(549,'update_account_incoterm','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(550,'delete_account_incoterm','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(551,'delete_any_account_incoterm','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(552,'restore_account_incoterm','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(553,'restore_any_account_incoterm','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(554,'force_delete_account_incoterm','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(555,'force_delete_any_account_incoterm','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(556,'view_any_account_invoice','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(557,'view_account_invoice','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(558,'create_account_invoice','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(559,'update_account_invoice','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(560,'delete_account_invoice','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(561,'delete_any_account_invoice','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(562,'reorder_account_invoice','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(563,'view_any_account_journal','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(564,'view_account_journal','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(565,'create_account_journal','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(566,'update_account_journal','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(567,'delete_account_journal','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(568,'delete_any_account_journal','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(569,'reorder_account_journal','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(570,'view_any_account_partner','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(571,'view_account_partner','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(572,'create_account_partner','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(573,'update_account_partner','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(574,'delete_account_partner','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(575,'delete_any_account_partner','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(576,'restore_account_partner','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(577,'restore_any_account_partner','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(578,'force_delete_account_partner','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(579,'force_delete_any_account_partner','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(580,'view_any_account_payment','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(581,'view_account_payment','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(582,'create_account_payment','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(583,'update_account_payment','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(584,'delete_account_payment','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(585,'delete_any_account_payment','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(586,'view_any_account_payment::term','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(587,'view_account_payment::term','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(588,'create_account_payment::term','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(589,'update_account_payment::term','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(590,'delete_account_payment::term','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(591,'delete_any_account_payment::term','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(592,'reorder_account_payment::term','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(593,'view_any_account_product::category','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(594,'view_account_product::category','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(595,'create_account_product::category','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(596,'update_account_product::category','web','2026-04-24 05:18:32','2026-04-24 05:18:32'),
(597,'delete_account_product::category','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(598,'delete_any_account_product::category','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(599,'view_any_account_product','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(600,'view_account_product','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(601,'create_account_product','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(602,'update_account_product','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(603,'delete_account_product','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(604,'delete_any_account_product','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(605,'restore_account_product','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(606,'restore_any_account_product','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(607,'force_delete_account_product','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(608,'force_delete_any_account_product','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(609,'reorder_account_product','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(610,'view_any_account_refund','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(611,'view_account_refund','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(612,'create_account_refund','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(613,'update_account_refund','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(614,'delete_account_refund','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(615,'delete_any_account_refund','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(616,'reorder_account_refund','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(617,'view_any_account_tax::group','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(618,'view_account_tax::group','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(619,'create_account_tax::group','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(620,'update_account_tax::group','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(621,'delete_account_tax::group','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(622,'delete_any_account_tax::group','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(623,'reorder_account_tax::group','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(624,'view_any_account_tax','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(625,'view_account_tax','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(626,'create_account_tax','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(627,'update_account_tax','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(628,'delete_account_tax','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(629,'delete_any_account_tax','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(630,'reorder_account_tax','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(631,'view_any_account_vendor','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(632,'view_account_vendor','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(633,'create_account_vendor','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(634,'update_account_vendor','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(635,'delete_account_vendor','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(636,'delete_any_account_vendor','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(637,'restore_account_vendor','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(638,'restore_any_account_vendor','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(639,'force_delete_account_vendor','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(640,'force_delete_any_account_vendor','web','2026-04-24 05:18:33','2026-04-24 05:18:33'),
(641,'view_any_accounting_journal::entry','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(642,'view_accounting_journal::entry','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(643,'create_accounting_journal::entry','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(644,'update_accounting_journal::entry','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(645,'delete_accounting_journal::entry','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(646,'delete_any_accounting_journal::entry','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(647,'reorder_accounting_journal::entry','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(648,'view_any_accounting_journal::item','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(649,'view_accounting_journal::item','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(650,'create_accounting_journal::item','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(651,'update_accounting_journal::item','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(652,'delete_accounting_journal::item','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(653,'delete_any_accounting_journal::item','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(654,'reorder_accounting_journal::item','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(655,'view_any_accounting_account','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(656,'view_accounting_account','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(657,'create_accounting_account','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(658,'update_accounting_account','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(659,'delete_accounting_account','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(660,'delete_any_accounting_account','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(661,'view_any_accounting_cash::rounding','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(662,'view_accounting_cash::rounding','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(663,'create_accounting_cash::rounding','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(664,'update_accounting_cash::rounding','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(665,'delete_accounting_cash::rounding','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(666,'delete_any_accounting_cash::rounding','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(667,'view_any_accounting_currency','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(668,'view_accounting_currency','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(669,'create_accounting_currency','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(670,'update_accounting_currency','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(671,'delete_accounting_currency','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(672,'delete_any_accounting_currency','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(673,'view_any_accounting_fiscal::position','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(674,'view_accounting_fiscal::position','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(675,'create_accounting_fiscal::position','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(676,'update_accounting_fiscal::position','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(677,'delete_accounting_fiscal::position','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(678,'delete_any_accounting_fiscal::position','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(679,'reorder_accounting_fiscal::position','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(680,'view_any_accounting_incoterm','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(681,'view_accounting_incoterm','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(682,'create_accounting_incoterm','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(683,'update_accounting_incoterm','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(684,'delete_accounting_incoterm','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(685,'delete_any_accounting_incoterm','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(686,'restore_accounting_incoterm','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(687,'restore_any_accounting_incoterm','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(688,'force_delete_accounting_incoterm','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(689,'force_delete_any_accounting_incoterm','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(690,'view_any_accounting_journal','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(691,'view_accounting_journal','web','2026-04-24 05:18:38','2026-04-24 05:18:38'),
(692,'create_accounting_journal','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(693,'update_accounting_journal','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(694,'delete_accounting_journal','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(695,'delete_any_accounting_journal','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(696,'reorder_accounting_journal','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(697,'view_any_accounting_payment::term','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(698,'view_accounting_payment::term','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(699,'create_accounting_payment::term','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(700,'update_accounting_payment::term','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(701,'delete_accounting_payment::term','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(702,'delete_any_accounting_payment::term','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(703,'restore_accounting_payment::term','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(704,'restore_any_accounting_payment::term','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(705,'force_delete_accounting_payment::term','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(706,'force_delete_any_accounting_payment::term','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(707,'reorder_accounting_payment::term','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(708,'view_any_accounting_product::attribute','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(709,'view_accounting_product::attribute','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(710,'create_accounting_product::attribute','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(711,'update_accounting_product::attribute','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(712,'delete_accounting_product::attribute','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(713,'delete_any_accounting_product::attribute','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(714,'restore_accounting_product::attribute','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(715,'restore_any_accounting_product::attribute','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(716,'force_delete_accounting_product::attribute','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(717,'force_delete_any_accounting_product::attribute','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(718,'reorder_accounting_product::attribute','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(719,'view_any_accounting_product::category','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(720,'view_accounting_product::category','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(721,'create_accounting_product::category','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(722,'update_accounting_product::category','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(723,'delete_accounting_product::category','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(724,'delete_any_accounting_product::category','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(725,'view_any_accounting_tax::group','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(726,'view_accounting_tax::group','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(727,'create_accounting_tax::group','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(728,'update_accounting_tax::group','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(729,'delete_accounting_tax::group','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(730,'delete_any_accounting_tax::group','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(731,'reorder_accounting_tax::group','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(732,'view_any_accounting_tax','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(733,'view_accounting_tax','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(734,'create_accounting_tax','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(735,'update_accounting_tax','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(736,'delete_accounting_tax','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(737,'delete_any_accounting_tax','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(738,'reorder_accounting_tax','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(739,'view_any_accounting_credit::note','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(740,'view_accounting_credit::note','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(741,'create_accounting_credit::note','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(742,'update_accounting_credit::note','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(743,'delete_accounting_credit::note','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(744,'delete_any_accounting_credit::note','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(745,'reorder_accounting_credit::note','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(746,'view_any_accounting_customer','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(747,'view_accounting_customer','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(748,'create_accounting_customer','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(749,'update_accounting_customer','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(750,'delete_accounting_customer','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(751,'delete_any_accounting_customer','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(752,'restore_accounting_customer','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(753,'restore_any_accounting_customer','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(754,'force_delete_accounting_customer','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(755,'force_delete_any_accounting_customer','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(756,'view_any_accounting_invoice','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(757,'view_accounting_invoice','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(758,'create_accounting_invoice','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(759,'update_accounting_invoice','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(760,'delete_accounting_invoice','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(761,'delete_any_accounting_invoice','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(762,'reorder_accounting_invoice','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(763,'view_any_accounting_payment','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(764,'view_accounting_payment','web','2026-04-24 05:18:39','2026-04-24 05:18:39'),
(765,'create_accounting_payment','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(766,'update_accounting_payment','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(767,'delete_accounting_payment','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(768,'delete_any_accounting_payment','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(769,'view_any_accounting_product','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(770,'view_accounting_product','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(771,'create_accounting_product','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(772,'update_accounting_product','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(773,'delete_accounting_product','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(774,'delete_any_accounting_product','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(775,'restore_accounting_product','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(776,'restore_any_accounting_product','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(777,'force_delete_accounting_product','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(778,'force_delete_any_accounting_product','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(779,'reorder_accounting_product','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(780,'view_any_accounting_bill','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(781,'view_accounting_bill','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(782,'create_accounting_bill','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(783,'update_accounting_bill','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(784,'delete_accounting_bill','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(785,'delete_any_accounting_bill','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(786,'reorder_accounting_bill','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(787,'view_any_accounting_refund','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(788,'view_accounting_refund','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(789,'create_accounting_refund','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(790,'update_accounting_refund','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(791,'delete_accounting_refund','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(792,'delete_any_accounting_refund','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(793,'reorder_accounting_refund','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(794,'view_any_accounting_vendor','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(795,'view_accounting_vendor','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(796,'create_accounting_vendor','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(797,'update_accounting_vendor','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(798,'delete_accounting_vendor','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(799,'delete_any_accounting_vendor','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(800,'restore_accounting_vendor','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(801,'restore_any_accounting_vendor','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(802,'force_delete_accounting_vendor','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(803,'force_delete_any_accounting_vendor','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(804,'page_accounting_overview','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(805,'page_accounting_aged_payable','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(806,'page_accounting_aged_receivable','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(807,'page_accounting_balance_sheet','web','2026-04-24 05:18:40','2026-04-24 05:18:40'),
(808,'page_accounting_general_ledger','web','2026-04-24 05:18:41','2026-04-24 05:18:41'),
(809,'page_accounting_partner_ledger','web','2026-04-24 05:18:41','2026-04-24 05:18:41'),
(810,'page_accounting_profit_loss','web','2026-04-24 05:18:41','2026-04-24 05:18:41'),
(811,'page_accounting_trial_balance','web','2026-04-24 05:18:41','2026-04-24 05:18:41'),
(812,'page_accounting_manage_customer_invoice','web','2026-04-24 05:18:41','2026-04-24 05:18:41'),
(813,'page_accounting_manage_default_accounts','web','2026-04-24 05:18:41','2026-04-24 05:18:41'),
(814,'page_accounting_manage_products','web','2026-04-24 05:18:41','2026-04-24 05:18:41'),
(815,'page_accounting_manage_taxes','web','2026-04-24 05:18:41','2026-04-24 05:18:41'),
(816,'view_any_recruitment_applicant','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(817,'view_recruitment_applicant','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(818,'create_recruitment_applicant','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(819,'update_recruitment_applicant','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(820,'delete_recruitment_applicant','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(821,'delete_any_recruitment_applicant','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(822,'restore_recruitment_applicant','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(823,'restore_any_recruitment_applicant','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(824,'force_delete_recruitment_applicant','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(825,'force_delete_any_recruitment_applicant','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(826,'view_any_recruitment_candidate','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(827,'view_recruitment_candidate','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(828,'create_recruitment_candidate','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(829,'update_recruitment_candidate','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(830,'delete_recruitment_candidate','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(831,'delete_any_recruitment_candidate','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(832,'restore_recruitment_candidate','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(833,'restore_any_recruitment_candidate','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(834,'force_delete_recruitment_candidate','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(835,'force_delete_any_recruitment_candidate','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(836,'view_any_recruitment_job::by::position','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(837,'view_recruitment_job::by::position','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(838,'create_recruitment_job::by::position','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(839,'update_recruitment_job::by::position','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(840,'delete_recruitment_job::by::position','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(841,'delete_any_recruitment_job::by::position','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(842,'restore_recruitment_job::by::position','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(843,'restore_any_recruitment_job::by::position','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(844,'force_delete_recruitment_job::by::position','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(845,'force_delete_any_recruitment_job::by::position','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(846,'reorder_recruitment_job::by::position','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(847,'view_any_recruitment_activity::plan','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(848,'view_recruitment_activity::plan','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(849,'create_recruitment_activity::plan','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(850,'update_recruitment_activity::plan','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(851,'delete_recruitment_activity::plan','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(852,'delete_any_recruitment_activity::plan','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(853,'restore_recruitment_activity::plan','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(854,'restore_any_recruitment_activity::plan','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(855,'force_delete_recruitment_activity::plan','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(856,'force_delete_any_recruitment_activity::plan','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(857,'view_any_recruitment_activity::type','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(858,'view_recruitment_activity::type','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(859,'create_recruitment_activity::type','web','2026-04-24 05:19:46','2026-04-24 05:19:46'),
(860,'update_recruitment_activity::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(861,'delete_recruitment_activity::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(862,'delete_any_recruitment_activity::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(863,'restore_recruitment_activity::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(864,'restore_any_recruitment_activity::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(865,'force_delete_recruitment_activity::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(866,'force_delete_any_recruitment_activity::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(867,'reorder_recruitment_activity::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(868,'view_any_recruitment_applicant::category','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(869,'view_recruitment_applicant::category','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(870,'create_recruitment_applicant::category','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(871,'update_recruitment_applicant::category','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(872,'delete_recruitment_applicant::category','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(873,'delete_any_recruitment_applicant::category','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(874,'view_any_recruitment_degree','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(875,'view_recruitment_degree','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(876,'create_recruitment_degree','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(877,'update_recruitment_degree','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(878,'delete_recruitment_degree','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(879,'delete_any_recruitment_degree','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(880,'reorder_recruitment_degree','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(881,'view_any_recruitment_department','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(882,'view_recruitment_department','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(883,'create_recruitment_department','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(884,'update_recruitment_department','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(885,'delete_recruitment_department','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(886,'delete_any_recruitment_department','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(887,'restore_recruitment_department','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(888,'restore_any_recruitment_department','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(889,'force_delete_recruitment_department','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(890,'force_delete_any_recruitment_department','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(891,'view_any_recruitment_employment::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(892,'view_recruitment_employment::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(893,'create_recruitment_employment::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(894,'update_recruitment_employment::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(895,'delete_recruitment_employment::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(896,'delete_any_recruitment_employment::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(897,'reorder_recruitment_employment::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(898,'view_any_recruitment_job::position','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(899,'view_recruitment_job::position','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(900,'create_recruitment_job::position','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(901,'update_recruitment_job::position','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(902,'delete_recruitment_job::position','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(903,'delete_any_recruitment_job::position','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(904,'restore_recruitment_job::position','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(905,'restore_any_recruitment_job::position','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(906,'force_delete_recruitment_job::position','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(907,'force_delete_any_recruitment_job::position','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(908,'reorder_recruitment_job::position','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(909,'view_any_recruitment_refuse::reason','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(910,'view_recruitment_refuse::reason','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(911,'create_recruitment_refuse::reason','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(912,'update_recruitment_refuse::reason','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(913,'delete_recruitment_refuse::reason','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(914,'delete_any_recruitment_refuse::reason','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(915,'reorder_recruitment_refuse::reason','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(916,'view_any_recruitment_skill::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(917,'view_recruitment_skill::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(918,'create_recruitment_skill::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(919,'update_recruitment_skill::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(920,'delete_recruitment_skill::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(921,'delete_any_recruitment_skill::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(922,'restore_recruitment_skill::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(923,'restore_any_recruitment_skill::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(924,'force_delete_recruitment_skill::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(925,'force_delete_any_recruitment_skill::type','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(926,'view_any_recruitment_stage','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(927,'view_recruitment_stage','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(928,'create_recruitment_stage','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(929,'update_recruitment_stage','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(930,'delete_recruitment_stage','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(931,'delete_any_recruitment_stage','web','2026-04-24 05:19:47','2026-04-24 05:19:47'),
(932,'reorder_recruitment_stage','web','2026-04-24 05:19:48','2026-04-24 05:19:48'),
(933,'view_any_recruitment_u::t::m::medium','web','2026-04-24 05:19:48','2026-04-24 05:19:48'),
(934,'view_recruitment_u::t::m::medium','web','2026-04-24 05:19:48','2026-04-24 05:19:48'),
(935,'create_recruitment_u::t::m::medium','web','2026-04-24 05:19:48','2026-04-24 05:19:48'),
(936,'update_recruitment_u::t::m::medium','web','2026-04-24 05:19:48','2026-04-24 05:19:48'),
(937,'delete_recruitment_u::t::m::medium','web','2026-04-24 05:19:48','2026-04-24 05:19:48'),
(938,'delete_any_recruitment_u::t::m::medium','web','2026-04-24 05:19:48','2026-04-24 05:19:48'),
(939,'view_any_recruitment_u::t::m::source','web','2026-04-24 05:19:48','2026-04-24 05:19:48'),
(940,'view_recruitment_u::t::m::source','web','2026-04-24 05:19:48','2026-04-24 05:19:48'),
(941,'create_recruitment_u::t::m::source','web','2026-04-24 05:19:48','2026-04-24 05:19:48'),
(942,'update_recruitment_u::t::m::source','web','2026-04-24 05:19:48','2026-04-24 05:19:48'),
(943,'delete_recruitment_u::t::m::source','web','2026-04-24 05:19:48','2026-04-24 05:19:48'),
(944,'delete_any_recruitment_u::t::m::source','web','2026-04-24 05:19:48','2026-04-24 05:19:48'),
(945,'page_recruitment_recruitments','web','2026-04-24 05:19:48','2026-04-24 05:19:48'),
(946,'widget_recruitment_job_position_stats_widget','web','2026-04-24 05:19:48','2026-04-24 05:19:48'),
(947,'widget_recruitment_applicant_chart_widget','web','2026-04-24 05:19:48','2026-04-24 05:19:48'),
(948,'view_any_time_off_accrual::plan','web','2026-04-24 05:20:23','2026-04-24 05:20:23'),
(949,'view_time_off_accrual::plan','web','2026-04-24 05:20:23','2026-04-24 05:20:23'),
(950,'create_time_off_accrual::plan','web','2026-04-24 05:20:23','2026-04-24 05:20:23'),
(951,'update_time_off_accrual::plan','web','2026-04-24 05:20:23','2026-04-24 05:20:23'),
(952,'delete_time_off_accrual::plan','web','2026-04-24 05:20:23','2026-04-24 05:20:23'),
(953,'delete_any_time_off_accrual::plan','web','2026-04-24 05:20:23','2026-04-24 05:20:23'),
(954,'view_any_time_off_activity::type','web','2026-04-24 05:20:23','2026-04-24 05:20:23'),
(955,'view_time_off_activity::type','web','2026-04-24 05:20:23','2026-04-24 05:20:23'),
(956,'create_time_off_activity::type','web','2026-04-24 05:20:23','2026-04-24 05:20:23'),
(957,'update_time_off_activity::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(958,'delete_time_off_activity::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(959,'delete_any_time_off_activity::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(960,'restore_time_off_activity::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(961,'restore_any_time_off_activity::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(962,'force_delete_time_off_activity::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(963,'force_delete_any_time_off_activity::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(964,'reorder_time_off_activity::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(965,'view_any_time_off_leave::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(966,'view_time_off_leave::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(967,'create_time_off_leave::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(968,'update_time_off_leave::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(969,'delete_time_off_leave::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(970,'delete_any_time_off_leave::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(971,'restore_time_off_leave::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(972,'restore_any_time_off_leave::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(973,'force_delete_time_off_leave::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(974,'force_delete_any_time_off_leave::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(975,'reorder_time_off_leave::type','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(976,'view_any_time_off_mandatory::day','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(977,'view_time_off_mandatory::day','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(978,'create_time_off_mandatory::day','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(979,'update_time_off_mandatory::day','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(980,'delete_time_off_mandatory::day','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(981,'delete_any_time_off_mandatory::day','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(982,'view_any_time_off_public::holiday','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(983,'view_time_off_public::holiday','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(984,'create_time_off_public::holiday','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(985,'update_time_off_public::holiday','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(986,'delete_time_off_public::holiday','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(987,'delete_any_time_off_public::holiday','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(988,'view_any_time_off_allocation','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(989,'view_time_off_allocation','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(990,'create_time_off_allocation','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(991,'update_time_off_allocation','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(992,'delete_time_off_allocation','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(993,'delete_any_time_off_allocation','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(994,'view_any_time_off_time::off','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(995,'view_time_off_time::off','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(996,'create_time_off_time::off','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(997,'update_time_off_time::off','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(998,'delete_time_off_time::off','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(999,'delete_any_time_off_time::off','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1000,'view_any_time_off_my::allocation','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1001,'view_time_off_my::allocation','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1002,'create_time_off_my::allocation','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1003,'update_time_off_my::allocation','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1004,'delete_time_off_my::allocation','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1005,'delete_any_time_off_my::allocation','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1006,'view_any_time_off_my::time::off','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1007,'view_time_off_my::time::off','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1008,'create_time_off_my::time::off','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1009,'update_time_off_my::time::off','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1010,'delete_time_off_my::time::off','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1011,'delete_any_time_off_my::time::off','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1012,'view_any_time_off_by::employee','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1013,'view_time_off_by::employee','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1014,'create_time_off_by::employee','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1015,'update_time_off_by::employee','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1016,'delete_time_off_by::employee','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1017,'delete_any_time_off_by::employee','web','2026-04-24 05:20:24','2026-04-24 05:20:24'),
(1018,'page_time_off_by_type','web','2026-04-24 05:20:25','2026-04-24 05:20:25'),
(1019,'page_time_off_dashboard','web','2026-04-24 05:20:25','2026-04-24 05:20:25'),
(1020,'page_time_off_overview','web','2026-04-24 05:20:25','2026-04-24 05:20:25'),
(1021,'widget_time_off_calendar_widget','web','2026-04-24 05:20:25','2026-04-24 05:20:25'),
(1022,'widget_time_off_my_time_off_widget','web','2026-04-24 05:20:25','2026-04-24 05:20:25'),
(1023,'widget_time_off_overview_calendar_widget','web','2026-04-24 05:20:25','2026-04-24 05:20:25'),
(1024,'widget_time_off_leave_type_widget','web','2026-04-24 05:20:25','2026-04-24 05:20:25'),
(1025,'view_any_timesheet_timesheet','web','2026-04-24 05:20:51','2026-04-24 05:20:51'),
(1026,'create_timesheet_timesheet','web','2026-04-24 05:20:51','2026-04-24 05:20:51'),
(1027,'update_timesheet_timesheet','web','2026-04-24 05:20:51','2026-04-24 05:20:51'),
(1028,'delete_timesheet_timesheet','web','2026-04-24 05:20:51','2026-04-24 05:20:51'),
(1029,'delete_any_timesheet_timesheet','web','2026-04-24 05:20:51','2026-04-24 05:20:51'),
(1030,'view_any_invoice_bank::account','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1031,'view_invoice_bank::account','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1032,'create_invoice_bank::account','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1033,'update_invoice_bank::account','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1034,'delete_invoice_bank::account','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1035,'delete_any_invoice_bank::account','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1036,'restore_invoice_bank::account','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1037,'restore_any_invoice_bank::account','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1038,'force_delete_invoice_bank::account','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1039,'force_delete_any_invoice_bank::account','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1040,'view_any_invoice_currency','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1041,'view_invoice_currency','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1042,'create_invoice_currency','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1043,'update_invoice_currency','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1044,'delete_invoice_currency','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1045,'delete_any_invoice_currency','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1046,'view_any_invoice_incoterm','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1047,'view_invoice_incoterm','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1048,'create_invoice_incoterm','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1049,'update_invoice_incoterm','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1050,'delete_invoice_incoterm','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1051,'delete_any_invoice_incoterm','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1052,'restore_invoice_incoterm','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1053,'restore_any_invoice_incoterm','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1054,'force_delete_invoice_incoterm','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1055,'force_delete_any_invoice_incoterm','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1056,'view_any_invoice_payment::term','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1057,'view_invoice_payment::term','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1058,'create_invoice_payment::term','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1059,'update_invoice_payment::term','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1060,'delete_invoice_payment::term','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1061,'delete_any_invoice_payment::term','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1062,'restore_invoice_payment::term','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1063,'restore_any_invoice_payment::term','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1064,'force_delete_invoice_payment::term','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1065,'force_delete_any_invoice_payment::term','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1066,'reorder_invoice_payment::term','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1067,'view_any_invoice_product::attribute','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1068,'view_invoice_product::attribute','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1069,'create_invoice_product::attribute','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1070,'update_invoice_product::attribute','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1071,'delete_invoice_product::attribute','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1072,'delete_any_invoice_product::attribute','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1073,'restore_invoice_product::attribute','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1074,'restore_any_invoice_product::attribute','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1075,'force_delete_invoice_product::attribute','web','2026-04-24 05:21:15','2026-04-24 05:21:15'),
(1076,'force_delete_any_invoice_product::attribute','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1077,'reorder_invoice_product::attribute','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1078,'view_any_invoice_product::category','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1079,'view_invoice_product::category','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1080,'create_invoice_product::category','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1081,'update_invoice_product::category','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1082,'delete_invoice_product::category','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1083,'delete_any_invoice_product::category','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1084,'view_any_invoice_tax::group','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1085,'view_invoice_tax::group','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1086,'create_invoice_tax::group','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1087,'update_invoice_tax::group','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1088,'delete_invoice_tax::group','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1089,'delete_any_invoice_tax::group','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1090,'reorder_invoice_tax::group','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1091,'view_any_invoice_tax','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1092,'view_invoice_tax','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1093,'create_invoice_tax','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1094,'update_invoice_tax','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1095,'delete_invoice_tax','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1096,'delete_any_invoice_tax','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1097,'reorder_invoice_tax','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1098,'view_any_invoice_credit::note','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1099,'view_invoice_credit::note','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1100,'create_invoice_credit::note','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1101,'update_invoice_credit::note','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1102,'delete_invoice_credit::note','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1103,'delete_any_invoice_credit::note','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1104,'reorder_invoice_credit::note','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1105,'view_any_invoice_customer','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1106,'view_invoice_customer','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1107,'create_invoice_customer','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1108,'update_invoice_customer','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1109,'delete_invoice_customer','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1110,'delete_any_invoice_customer','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1111,'restore_invoice_customer','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1112,'restore_any_invoice_customer','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1113,'force_delete_invoice_customer','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1114,'force_delete_any_invoice_customer','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1115,'view_any_invoice_invoice','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1116,'view_invoice_invoice','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1117,'create_invoice_invoice','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1118,'update_invoice_invoice','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1119,'delete_invoice_invoice','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1120,'delete_any_invoice_invoice','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1121,'reorder_invoice_invoice','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1122,'view_any_invoice_payment','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1123,'view_invoice_payment','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1124,'create_invoice_payment','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1125,'update_invoice_payment','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1126,'delete_invoice_payment','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1127,'delete_any_invoice_payment','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1128,'view_any_invoice_product','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1129,'view_invoice_product','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1130,'create_invoice_product','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1131,'update_invoice_product','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1132,'delete_invoice_product','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1133,'delete_any_invoice_product','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1134,'restore_invoice_product','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1135,'restore_any_invoice_product','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1136,'force_delete_invoice_product','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1137,'force_delete_any_invoice_product','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1138,'reorder_invoice_product','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1139,'view_any_invoice_bill','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1140,'view_invoice_bill','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1141,'create_invoice_bill','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1142,'update_invoice_bill','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1143,'delete_invoice_bill','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1144,'delete_any_invoice_bill','web','2026-04-24 05:21:16','2026-04-24 05:21:16'),
(1145,'reorder_invoice_bill','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1146,'view_any_invoice_refund','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1147,'view_invoice_refund','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1148,'create_invoice_refund','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1149,'update_invoice_refund','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1150,'delete_invoice_refund','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1151,'delete_any_invoice_refund','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1152,'reorder_invoice_refund','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1153,'view_any_invoice_vendor','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1154,'view_invoice_vendor','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1155,'create_invoice_vendor','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1156,'update_invoice_vendor','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1157,'delete_invoice_vendor','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1158,'delete_any_invoice_vendor','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1159,'restore_invoice_vendor','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1160,'restore_any_invoice_vendor','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1161,'force_delete_invoice_vendor','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1162,'force_delete_any_invoice_vendor','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1163,'page_invoice_products','web','2026-04-24 05:21:17','2026-04-24 05:21:17'),
(1164,'view_any_blog_category','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1165,'view_blog_category','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1166,'create_blog_category','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1167,'update_blog_category','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1168,'delete_blog_category','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1169,'delete_any_blog_category','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1170,'restore_blog_category','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1171,'restore_any_blog_category','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1172,'force_delete_blog_category','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1173,'force_delete_any_blog_category','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1174,'view_any_blog_tag','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1175,'view_blog_tag','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1176,'create_blog_tag','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1177,'update_blog_tag','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1178,'delete_blog_tag','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1179,'delete_any_blog_tag','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1180,'restore_blog_tag','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1181,'restore_any_blog_tag','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1182,'force_delete_blog_tag','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1183,'force_delete_any_blog_tag','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1184,'reorder_blog_tag','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1185,'view_any_blog_post','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1186,'view_blog_post','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1187,'create_blog_post','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1188,'update_blog_post','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1189,'delete_blog_post','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1190,'delete_any_blog_post','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1191,'restore_blog_post','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1192,'restore_any_blog_post','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1193,'force_delete_blog_post','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1194,'force_delete_any_blog_post','web','2026-04-24 05:35:04','2026-04-24 05:35:04'),
(1195,'view_employee_employee::review','web','2026-05-06 09:48:13','2026-05-06 09:48:13'),
(1196,'view_any_documentation_documentation::article','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1197,'view_documentation_documentation::article','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1198,'create_documentation_documentation::article','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1199,'update_documentation_documentation::article','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1200,'delete_documentation_documentation::article','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1201,'restore_documentation_documentation::article','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1202,'delete_any_documentation_documentation::article','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1203,'force_delete_documentation_documentation::article','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1204,'force_delete_any_documentation_documentation::article','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1205,'restore_any_documentation_documentation::article','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1206,'reorder_documentation_documentation::article','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1207,'view_any_employee_employee::review','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1208,'create_employee_employee::review','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1209,'update_employee_employee::review','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1210,'delete_employee_employee::review','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1211,'delete_any_employee_employee::review','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1212,'restore_employee_employee::review','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1213,'restore_any_employee_employee::review','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1214,'force_delete_employee_employee::review','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1215,'force_delete_any_employee_employee::review','web','2026-05-07 11:15:38','2026-05-07 11:15:38'),
(1216,'page_documentation_documentation','web','2026-05-07 11:15:38','2026-05-07 11:15:38');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `plugin_dependencies`
--

DROP TABLE IF EXISTS `plugin_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_dependencies` (
  `plugin_id` bigint(20) unsigned NOT NULL,
  `dependency_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `plugin_dependencies_plugin_id_dependency_id_unique` (`plugin_id`,`dependency_id`),
  KEY `plugin_dependencies_dependency_id_foreign` (`dependency_id`),
  CONSTRAINT `plugin_dependencies_dependency_id_foreign` FOREIGN KEY (`dependency_id`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `plugin_dependencies_plugin_id_foreign` FOREIGN KEY (`plugin_id`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_dependencies`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `plugin_dependencies` WRITE;
/*!40000 ALTER TABLE `plugin_dependencies` DISABLE KEYS */;
INSERT INTO `plugin_dependencies` VALUES
(1,2),
(7,2),
(8,2),
(12,5),
(14,5),
(11,7),
(13,7),
(13,8),
(2,9),
(6,9),
(15,10),
(3,16);
/*!40000 ALTER TABLE `plugin_dependencies` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `latest_version` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_installed` tinyint(1) NOT NULL DEFAULT 0,
  `sort` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugins_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES
(1,'accounting','Aureus ERP','','',NULL,NULL,1,1,NULL,'2026-04-23 20:44:25','2026-04-24 05:29:40'),
(2,'accounts','Aureus ERP','','',NULL,NULL,1,1,NULL,'2026-04-23 20:44:25','2026-04-24 05:30:13'),
(3,'blogs','Aureus ERP','Manage blogs','Manage blogs',NULL,NULL,1,1,NULL,'2026-04-23 20:44:25','2026-04-24 05:35:31'),
(4,'contacts','Aureus ERP','Contact management for customers and vendors','Contact management for customers and vendors',NULL,NULL,1,1,NULL,'2026-04-23 20:44:25','2026-04-24 05:28:48'),
(5,'employees','Aureus ERP','Employees management','Employees management',NULL,NULL,1,1,NULL,'2026-04-23 20:44:25','2026-04-24 05:31:45'),
(6,'inventories','Jitendra Singh','Inventory and warehouse management','Inventory and warehouse management','1.0.0','MIT',1,0,6,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(7,'invoices','Aureus ERP','Invoice generation and management','Invoice generation and management',NULL,NULL,1,1,NULL,'2026-04-23 20:44:25','2026-04-24 05:30:27'),
(8,'payments','Aureus ERP','','','1.0.0','MIT',1,0,8,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(9,'products','Aureus ERP','','',NULL,NULL,1,1,NULL,'2026-04-23 20:44:25','2026-04-24 05:30:08'),
(10,'projects','Aureus ERP','Project planning and management','Project planning and management',NULL,NULL,1,1,NULL,'2026-04-23 20:44:25','2026-04-24 05:28:17'),
(11,'purchases','Aureus ERP','Procurement and purchase order management','Procurement and purchase order management','1.0.0','MIT',1,0,11,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(12,'recruitments','Aureus ERP','Applicant tracking and hiring','Applicant tracking and hiring',NULL,NULL,1,1,NULL,'2026-04-23 20:44:25','2026-04-24 05:31:56'),
(13,'sales','Aureus ERP','Sales pipeline and opportunity management','Sales pipeline and opportunity management','1.0.0','MIT',1,0,13,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(14,'time-off','Aureus ERP','Leave management and tracking','Leave management and tracking',NULL,NULL,1,1,NULL,'2026-04-23 20:44:25','2026-04-24 05:31:04'),
(15,'timesheets','Aureus ERP','Employee work hour tracking','Employee work hour tracking',NULL,NULL,1,1,NULL,'2026-04-23 20:44:25','2026-04-24 05:28:19'),
(16,'website','Aureus ERP','Website for customer','Website for customer',NULL,NULL,1,1,NULL,'2026-04-23 20:44:25','2026-04-24 05:35:29'),
(17,'documentation','Aureus ERP','In-app documentation and help center','In-app documentation and help center',NULL,NULL,1,1,14,'2026-05-07 11:14:57','2026-05-07 11:14:57');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `products_attribute_options`
--

DROP TABLE IF EXISTS `products_attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_attribute_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `extra_price` decimal(15,4) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `attribute_id` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_attribute_options_attribute_id_foreign` (`attribute_id`),
  KEY `products_attribute_options_creator_id_foreign` (`creator_id`),
  CONSTRAINT `products_attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `products_attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_attribute_options_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_attribute_options`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `products_attribute_options` WRITE;
/*!40000 ALTER TABLE `products_attribute_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_attribute_options` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `products_attributes`
--

DROP TABLE IF EXISTS `products_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_attributes_creator_id_foreign` (`creator_id`),
  CONSTRAINT `products_attributes_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_attributes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `products_attributes` WRITE;
/*!40000 ALTER TABLE `products_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_attributes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `products_categories`
--

DROP TABLE IF EXISTS `products_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `parent_path` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `property_account_income_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Income Account',
  `property_account_expense_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Expense Account',
  `property_account_down_payment_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Down Payment Account',
  PRIMARY KEY (`id`),
  KEY `products_categories_parent_id_foreign` (`parent_id`),
  KEY `products_categories_creator_id_foreign` (`creator_id`),
  KEY `products_categories_name_index` (`name`),
  KEY `products_categories_property_account_income_id_foreign` (`property_account_income_id`),
  KEY `products_categories_property_account_expense_id_foreign` (`property_account_expense_id`),
  KEY `products_categories_property_account_down_payment_id_foreign` (`property_account_down_payment_id`),
  CONSTRAINT `products_categories_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_categories_property_account_down_payment_id_foreign` FOREIGN KEY (`property_account_down_payment_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_categories_property_account_expense_id_foreign` FOREIGN KEY (`property_account_expense_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_categories_property_account_income_id_foreign` FOREIGN KEY (`property_account_income_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `products_categories` WRITE;
/*!40000 ALTER TABLE `products_categories` DISABLE KEYS */;
INSERT INTO `products_categories` VALUES
(1,'All','All','/',NULL,1,'2025-01-28 08:49:51','2025-01-28 08:49:51',NULL,NULL,NULL),
(2,'Consumable','All / Consumable','/1/',1,1,'2025-01-28 08:50:15','2025-01-28 08:50:15',NULL,NULL,NULL),
(3,'Expenses','All / Expenses','/1/',1,1,'2025-01-28 08:55:42','2025-01-28 08:55:42',NULL,NULL,NULL),
(4,'Home Construction','All / Home Construction','/1/',1,1,'2025-01-28 08:55:56','2025-01-28 08:56:43',NULL,NULL,NULL),
(5,'Internal','All / Internal','/1/',1,1,'2025-01-28 08:56:07','2025-01-28 08:56:27',NULL,NULL,NULL),
(6,'Saleable','All / Saleable','/1/',1,1,'2025-01-28 08:56:55','2025-01-28 08:56:55',NULL,NULL,NULL),
(7,'Office Furniture','All / Saleable / Office Furniture','/1/6/',6,1,'2025-01-28 08:57:14','2025-01-28 09:04:41',NULL,NULL,NULL),
(8,'Outdoor furniture','All / Saleable / Outdoor furniture','/1/6/',6,1,'2025-01-28 09:05:41','2025-01-28 09:05:41',NULL,NULL,NULL),
(9,'Services','All / Saleable / Services','/1/6/',6,1,'2025-01-28 09:06:17','2025-01-28 09:06:17',NULL,NULL,NULL),
(10,'Saleable','All / Saleable / Services / Saleable','/1/6/9/',9,1,'2025-01-28 09:07:38','2025-01-28 09:07:38',NULL,NULL,NULL);
/*!40000 ALTER TABLE `products_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `products_packagings`
--

DROP TABLE IF EXISTS `products_packagings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_packagings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `qty` decimal(12,4) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_packagings_product_id_foreign` (`product_id`),
  KEY `products_packagings_creator_id_foreign` (`creator_id`),
  KEY `products_packagings_company_id_foreign` (`company_id`),
  CONSTRAINT `products_packagings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_packagings_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_packagings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_packagings`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `products_packagings` WRITE;
/*!40000 ALTER TABLE `products_packagings` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_packagings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `products_price_rule_items`
--

DROP TABLE IF EXISTS `products_price_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_price_rule_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `apply_to` varchar(255) NOT NULL,
  `display_apply_to` varchar(255) NOT NULL,
  `base` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `min_quantity` decimal(15,4) DEFAULT 0.0000,
  `fixed_price` decimal(15,4) DEFAULT 0.0000,
  `price_discount` decimal(15,4) DEFAULT 0.0000,
  `price_round` decimal(15,4) DEFAULT 0.0000,
  `price_surcharge` decimal(15,4) DEFAULT 0.0000,
  `price_markup` decimal(15,4) DEFAULT 0.0000,
  `price_min_margin` decimal(15,4) DEFAULT 0.0000,
  `percent_price` decimal(15,4) DEFAULT 0.0000,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `price_rule_id` bigint(20) unsigned NOT NULL,
  `base_price_rule_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `currency_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_price_rule_items_price_rule_id_foreign` (`price_rule_id`),
  KEY `products_price_rule_items_base_price_rule_id_foreign` (`base_price_rule_id`),
  KEY `products_price_rule_items_product_id_foreign` (`product_id`),
  KEY `products_price_rule_items_category_id_foreign` (`category_id`),
  KEY `products_price_rule_items_currency_id_foreign` (`currency_id`),
  KEY `products_price_rule_items_company_id_foreign` (`company_id`),
  KEY `products_price_rule_items_creator_id_foreign` (`creator_id`),
  CONSTRAINT `products_price_rule_items_base_price_rule_id_foreign` FOREIGN KEY (`base_price_rule_id`) REFERENCES `products_price_rules` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_price_rule_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `products_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_price_rule_items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_price_rule_items_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_price_rule_items_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_price_rule_items_price_rule_id_foreign` FOREIGN KEY (`price_rule_id`) REFERENCES `products_price_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_price_rule_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_price_rule_items`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `products_price_rule_items` WRITE;
/*!40000 ALTER TABLE `products_price_rule_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_price_rule_items` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `products_price_rules`
--

DROP TABLE IF EXISTS `products_price_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_price_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `currency_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_price_rules_currency_id_foreign` (`currency_id`),
  KEY `products_price_rules_company_id_foreign` (`company_id`),
  KEY `products_price_rules_creator_id_foreign` (`creator_id`),
  CONSTRAINT `products_price_rules_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_price_rules_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_price_rules_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_price_rules`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `products_price_rules` WRITE;
/*!40000 ALTER TABLE `products_price_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_price_rules` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `products_product_attribute_values`
--

DROP TABLE IF EXISTS `products_product_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_product_attribute_values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extra_price` decimal(15,4) DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `attribute_id` bigint(20) unsigned DEFAULT NULL,
  `product_attribute_id` bigint(20) unsigned NOT NULL,
  `attribute_option_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_attribute_values_product_id_foreign` (`product_id`),
  KEY `products_product_attribute_values_attribute_id_foreign` (`attribute_id`),
  KEY `products_product_attribute_values_product_attribute_id_foreign` (`product_attribute_id`),
  KEY `products_product_attribute_values_attribute_option_id_foreign` (`attribute_option_id`),
  CONSTRAINT `products_product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `products_attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_product_attribute_values_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `products_attribute_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_product_attribute_values_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `products_product_attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product_attribute_values`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `products_product_attribute_values` WRITE;
/*!40000 ALTER TABLE `products_product_attribute_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_product_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `products_product_attributes`
--

DROP TABLE IF EXISTS `products_product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_product_attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `attribute_id` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_attributes_product_id_foreign` (`product_id`),
  KEY `products_product_attributes_attribute_id_foreign` (`attribute_id`),
  KEY `products_product_attributes_creator_id_foreign` (`creator_id`),
  CONSTRAINT `products_product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `products_attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_product_attributes_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product_attributes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `products_product_attributes` WRITE;
/*!40000 ALTER TABLE `products_product_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_product_attributes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `products_product_combinations`
--

DROP TABLE IF EXISTS `products_product_combinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_product_combinations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `product_attribute_value_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_combinations_product_id_foreign` (`product_id`),
  KEY `products_product_combinations_product_attribute_value_id_foreign` (`product_attribute_value_id`),
  CONSTRAINT `products_product_combinations_product_attribute_value_id_foreign` FOREIGN KEY (`product_attribute_value_id`) REFERENCES `products_product_attribute_values` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_product_combinations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product_combinations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `products_product_combinations` WRITE;
/*!40000 ALTER TABLE `products_product_combinations` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_product_combinations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `products_product_price_lists`
--

DROP TABLE IF EXISTS `products_product_price_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_product_price_lists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort Order',
  `currency_id` bigint(20) unsigned NOT NULL COMMENT 'Currency',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Creator',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_price_lists_currency_id_foreign` (`currency_id`),
  KEY `products_product_price_lists_company_id_foreign` (`company_id`),
  KEY `products_product_price_lists_creator_id_foreign` (`creator_id`),
  CONSTRAINT `products_product_price_lists_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_product_price_lists_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_product_price_lists_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product_price_lists`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `products_product_price_lists` WRITE;
/*!40000 ALTER TABLE `products_product_price_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_product_price_lists` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `products_product_suppliers`
--

DROP TABLE IF EXISTS `products_product_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_product_suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `product_name` varchar(255) DEFAULT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `starts_at` date DEFAULT NULL,
  `ends_at` date DEFAULT NULL,
  `min_qty` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `discount` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `partner_id` bigint(20) unsigned NOT NULL,
  `currency_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_suppliers_product_id_foreign` (`product_id`),
  KEY `products_product_suppliers_partner_id_foreign` (`partner_id`),
  KEY `products_product_suppliers_currency_id_foreign` (`currency_id`),
  KEY `products_product_suppliers_company_id_foreign` (`company_id`),
  KEY `products_product_suppliers_creator_id_foreign` (`creator_id`),
  CONSTRAINT `products_product_suppliers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_product_suppliers_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_product_suppliers_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `products_product_suppliers_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners_partners` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_product_suppliers_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products_products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product_suppliers`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `products_product_suppliers` WRITE;
/*!40000 ALTER TABLE `products_product_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_product_suppliers` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `products_product_tag`
--

DROP TABLE IF EXISTS `products_product_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_product_tag` (
  `tag_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  KEY `products_product_tag_tag_id_foreign` (`tag_id`),
  KEY `products_product_tag_product_id_foreign` (`product_id`),
  CONSTRAINT `products_product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `products_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product_tag`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `products_product_tag` WRITE;
/*!40000 ALTER TABLE `products_product_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_product_tag` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `products_products`
--

DROP TABLE IF EXISTS `products_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `service_tracking` varchar(255) NOT NULL DEFAULT 'none',
  `reference` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `price` decimal(15,4) DEFAULT NULL,
  `cost` decimal(15,4) DEFAULT NULL,
  `volume` decimal(15,4) DEFAULT NULL,
  `weight` decimal(15,4) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `description_purchase` text DEFAULT NULL,
  `description_sale` text DEFAULT NULL,
  `enable_sales` tinyint(1) DEFAULT NULL,
  `enable_purchase` tinyint(1) DEFAULT NULL,
  `is_favorite` tinyint(1) NOT NULL DEFAULT 0,
  `is_configurable` tinyint(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `uom_id` bigint(20) unsigned NOT NULL,
  `uom_po_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `property_account_income_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Income Account',
  `property_account_expense_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Expense Account',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `service_type` varchar(255) DEFAULT NULL COMMENT 'Service Type',
  `sale_line_warn` varchar(255) DEFAULT NULL COMMENT 'Sale Line Warning',
  `expense_policy` text DEFAULT NULL COMMENT 'Expense Policy',
  `invoice_policy` text DEFAULT NULL COMMENT 'Invoicing Policy',
  `sales_ok` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Can be Sold',
  `purchase_ok` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Can be Purchased',
  `sale_line_warn_msg` varchar(255) DEFAULT NULL COMMENT 'Sale Line Warning Message',
  PRIMARY KEY (`id`),
  KEY `products_products_parent_id_foreign` (`parent_id`),
  KEY `products_products_uom_id_foreign` (`uom_id`),
  KEY `products_products_uom_po_id_foreign` (`uom_po_id`),
  KEY `products_products_category_id_foreign` (`category_id`),
  KEY `products_products_company_id_foreign` (`company_id`),
  KEY `products_products_creator_id_foreign` (`creator_id`),
  KEY `products_products_property_account_income_id_foreign` (`property_account_income_id`),
  KEY `products_products_property_account_expense_id_foreign` (`property_account_expense_id`),
  CONSTRAINT `products_products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `products_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_products_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_products_property_account_expense_id_foreign` FOREIGN KEY (`property_account_expense_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_products_property_account_income_id_foreign` FOREIGN KEY (`property_account_income_id`) REFERENCES `accounts_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_products_uom_id_foreign` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measures` (`id`),
  CONSTRAINT `products_products_uom_po_id_foreign` FOREIGN KEY (`uom_po_id`) REFERENCES `unit_of_measures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_products`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `products_products` WRITE;
/*!40000 ALTER TABLE `products_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_products` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `products_tags`
--

DROP TABLE IF EXISTS `products_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_tags_name_unique` (`name`),
  KEY `products_tags_creator_id_foreign` (`creator_id`),
  CONSTRAINT `products_tags_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_tags`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `products_tags` WRITE;
/*!40000 ALTER TABLE `products_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_tags` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `projects_milestones`
--

DROP TABLE IF EXISTS `projects_milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_milestones` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` datetime DEFAULT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_milestones_project_id_foreign` (`project_id`),
  KEY `projects_milestones_creator_id_foreign` (`creator_id`),
  KEY `projects_milestones_name_index` (`name`),
  KEY `projects_milestones_deadline_index` (`deadline`),
  KEY `projects_milestones_completed_at_index` (`completed_at`),
  CONSTRAINT `projects_milestones_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_milestones_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects_projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_milestones`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `projects_milestones` WRITE;
/*!40000 ALTER TABLE `projects_milestones` DISABLE KEYS */;
INSERT INTO `projects_milestones` VALUES
(1,'Payment completetion','2026-04-30 12:05:00',1,NULL,2,NULL,'2026-04-27 08:26:48','2026-04-27 08:26:48'),
(2,'Testing & Hosting','2026-04-30 01:08:00',0,NULL,2,NULL,'2026-04-27 08:27:47','2026-04-27 08:27:47');
/*!40000 ALTER TABLE `projects_milestones` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `projects_project_stages`
--

DROP TABLE IF EXISTS `projects_project_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_project_stages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_collapsed` tinyint(1) NOT NULL DEFAULT 0,
  `sort` int(11) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_project_stages_company_id_foreign` (`company_id`),
  KEY `projects_project_stages_creator_id_foreign` (`creator_id`),
  CONSTRAINT `projects_project_stages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_project_stages_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_project_stages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `projects_project_stages` WRITE;
/*!40000 ALTER TABLE `projects_project_stages` DISABLE KEYS */;
INSERT INTO `projects_project_stages` VALUES
(5,'To Do',NULL,1,0,1,NULL,1,NULL,'2026-04-24 05:28:17','2026-04-24 05:28:17'),
(6,'In Progress',NULL,1,0,2,NULL,1,NULL,'2026-04-24 05:28:17','2026-04-24 05:28:17'),
(7,'Done',NULL,1,0,3,NULL,1,NULL,'2026-04-24 05:28:17','2026-04-24 05:28:17'),
(8,'Cancelled',NULL,1,0,4,NULL,1,NULL,'2026-04-24 05:28:17','2026-04-24 05:28:17');
/*!40000 ALTER TABLE `projects_project_stages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `projects_project_tag`
--

DROP TABLE IF EXISTS `projects_project_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_project_tag` (
  `tag_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  KEY `projects_project_tag_tag_id_foreign` (`tag_id`),
  KEY `projects_project_tag_project_id_foreign` (`project_id`),
  CONSTRAINT `projects_project_tag_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_project_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `projects_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_project_tag`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `projects_project_tag` WRITE;
/*!40000 ALTER TABLE `projects_project_tag` DISABLE KEYS */;
INSERT INTO `projects_project_tag` VALUES
(1,2);
/*!40000 ALTER TABLE `projects_project_tag` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `projects_projects`
--

DROP TABLE IF EXISTS `projects_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tasks_label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `visibility` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `allocated_hours` decimal(8,2) DEFAULT NULL,
  `allow_timesheets` tinyint(1) NOT NULL DEFAULT 0,
  `allow_milestones` tinyint(1) NOT NULL DEFAULT 0,
  `allow_task_dependencies` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `stage_id` bigint(20) unsigned DEFAULT NULL,
  `partner_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `documentation_assignee_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_projects_stage_id_foreign` (`stage_id`),
  KEY `projects_projects_partner_id_foreign` (`partner_id`),
  KEY `projects_projects_company_id_foreign` (`company_id`),
  KEY `projects_projects_user_id_foreign` (`user_id`),
  KEY `projects_projects_creator_id_foreign` (`creator_id`),
  KEY `projects_projects_name_index` (`name`),
  KEY `projects_projects_sort_index` (`sort`),
  KEY `projects_projects_documentation_assignee_id_foreign` (`documentation_assignee_id`),
  CONSTRAINT `projects_projects_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_projects_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_projects_documentation_assignee_id_foreign` FOREIGN KEY (`documentation_assignee_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_projects_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners_partners` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_projects_stage_id_foreign` FOREIGN KEY (`stage_id`) REFERENCES `projects_project_stages` (`id`),
  CONSTRAINT `projects_projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_projects`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `projects_projects` WRITE;
/*!40000 ALTER TABLE `projects_projects` DISABLE KEYS */;
INSERT INTO `projects_projects` VALUES
(1,'KWIK DRIVE',NULL,'<p>connect drivers with their passegers</p>','internal',NULL,1,'2026-04-03','2026-04-26',NULL,0,1,0,1,5,42,1,NULL,NULL,NULL,'2026-04-27 05:59:31','2026-04-27 05:52:49','2026-04-27 05:59:31'),
(2,'KWIKSENDER',NULL,'<p></p>','public',NULL,1,'2026-04-17','2026-12-02',NULL,0,1,0,1,5,7,1,12,13,NULL,NULL,'2026-04-27 05:53:42','2026-05-07 21:12:39');
/*!40000 ALTER TABLE `projects_projects` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `projects_tags`
--

DROP TABLE IF EXISTS `projects_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_tags_name_unique` (`name`),
  KEY `projects_tags_creator_id_foreign` (`creator_id`),
  CONSTRAINT `projects_tags_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_tags`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `projects_tags` WRITE;
/*!40000 ALTER TABLE `projects_tags` DISABLE KEYS */;
INSERT INTO `projects_tags` VALUES
(1,'hello','#808080',NULL,NULL,'2026-04-27 05:53:20','2026-04-27 05:53:20');
/*!40000 ALTER TABLE `projects_tags` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `projects_task_stages`
--

DROP TABLE IF EXISTS `projects_task_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_task_stages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_collapsed` tinyint(1) NOT NULL DEFAULT 0,
  `sort` int(11) DEFAULT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_task_stages_project_id_foreign` (`project_id`),
  KEY `projects_task_stages_company_id_foreign` (`company_id`),
  KEY `projects_task_stages_user_id_foreign` (`user_id`),
  KEY `projects_task_stages_creator_id_foreign` (`creator_id`),
  CONSTRAINT `projects_task_stages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_task_stages_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_task_stages_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_task_stages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_task_stages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `projects_task_stages` WRITE;
/*!40000 ALTER TABLE `projects_task_stages` DISABLE KEYS */;
INSERT INTO `projects_task_stages` VALUES
(1,'Feasibility study',1,0,1,2,NULL,NULL,1,NULL,'2026-04-27 08:33:55','2026-04-27 08:33:55'),
(2,'Requirements gathering',1,0,2,2,NULL,NULL,1,NULL,'2026-04-27 08:34:16','2026-04-27 08:34:16'),
(3,'Architectural Design',1,0,3,2,NULL,NULL,1,NULL,'2026-04-27 08:34:43','2026-04-27 08:34:43'),
(4,'Development',1,0,4,2,NULL,NULL,1,NULL,'2026-04-27 08:34:59','2026-04-27 08:34:59'),
(5,'Testing',1,0,5,2,NULL,NULL,1,NULL,'2026-04-27 08:35:21','2026-04-27 08:35:21'),
(6,'Architecture Design',1,0,6,2,NULL,NULL,1,'2026-05-07 06:09:29','2026-05-07 06:08:28','2026-05-07 06:09:29');
/*!40000 ALTER TABLE `projects_task_stages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `projects_task_tag`
--

DROP TABLE IF EXISTS `projects_task_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_task_tag` (
  `tag_id` bigint(20) unsigned NOT NULL,
  `task_id` bigint(20) unsigned NOT NULL,
  KEY `projects_task_tag_tag_id_foreign` (`tag_id`),
  KEY `projects_task_tag_task_id_foreign` (`task_id`),
  CONSTRAINT `projects_task_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `projects_tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_task_tag_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `projects_tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_task_tag`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `projects_task_tag` WRITE;
/*!40000 ALTER TABLE `projects_task_tag` DISABLE KEYS */;
INSERT INTO `projects_task_tag` VALUES
(1,1),
(1,2),
(1,3),
(1,5);
/*!40000 ALTER TABLE `projects_task_tag` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `projects_task_users`
--

DROP TABLE IF EXISTS `projects_task_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_task_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `stage_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_task_users_task_id_user_id_unique` (`task_id`,`user_id`),
  KEY `projects_task_users_user_id_foreign` (`user_id`),
  KEY `projects_task_users_stage_id_foreign` (`stage_id`),
  CONSTRAINT `projects_task_users_stage_id_foreign` FOREIGN KEY (`stage_id`) REFERENCES `projects_task_stages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_task_users_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `projects_tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_task_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_task_users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `projects_task_users` WRITE;
/*!40000 ALTER TABLE `projects_task_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_task_users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `projects_tasks`
--

DROP TABLE IF EXISTS `projects_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `priority` tinyint(1) NOT NULL DEFAULT 0,
  `state` varchar(255) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `deadline` datetime DEFAULT NULL,
  `working_hours_open` decimal(8,2) NOT NULL DEFAULT 0.00,
  `working_hours_close` decimal(8,2) NOT NULL DEFAULT 0.00,
  `allocated_hours` decimal(8,2) NOT NULL DEFAULT 0.00,
  `remaining_hours` decimal(8,2) NOT NULL DEFAULT 0.00,
  `effective_hours` decimal(8,2) NOT NULL DEFAULT 0.00,
  `total_hours_spent` decimal(8,2) NOT NULL DEFAULT 0.00,
  `overtime` decimal(8,2) NOT NULL DEFAULT 0.00,
  `progress` decimal(8,2) NOT NULL DEFAULT 0.00,
  `subtask_effective_hours` decimal(8,2) NOT NULL DEFAULT 0.00,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `milestone_id` bigint(20) unsigned DEFAULT NULL,
  `stage_id` bigint(20) unsigned DEFAULT NULL,
  `partner_id` bigint(20) unsigned DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_tasks_project_id_foreign` (`project_id`),
  KEY `projects_tasks_milestone_id_foreign` (`milestone_id`),
  KEY `projects_tasks_stage_id_foreign` (`stage_id`),
  KEY `projects_tasks_partner_id_foreign` (`partner_id`),
  KEY `projects_tasks_parent_id_foreign` (`parent_id`),
  KEY `projects_tasks_company_id_foreign` (`company_id`),
  KEY `projects_tasks_creator_id_foreign` (`creator_id`),
  KEY `projects_tasks_title_index` (`title`),
  KEY `projects_tasks_priority_index` (`priority`),
  KEY `projects_tasks_state_index` (`state`),
  KEY `projects_tasks_deadline_index` (`deadline`),
  CONSTRAINT `projects_tasks_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_tasks_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_tasks_milestone_id_foreign` FOREIGN KEY (`milestone_id`) REFERENCES `projects_milestones` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_tasks_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `projects_tasks` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_tasks_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners_partners` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects_projects` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_tasks_stage_id_foreign` FOREIGN KEY (`stage_id`) REFERENCES `projects_task_stages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_tasks`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `projects_tasks` WRITE;
/*!40000 ALTER TABLE `projects_tasks` DISABLE KEYS */;
INSERT INTO `projects_tasks` VALUES
(1,'Hosting Via Appstore & Playstore','<p>Designing the class diagram and the ERD</p>',NULL,0,'in_progress',1,1,0,'2026-04-30 11:00:00',0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,2,2,3,7,NULL,1,NULL,NULL,'2026-04-27 08:35:37','2026-04-27 08:36:58'),
(2,'Highlighting the need of solving the problem','<p></p>',NULL,0,'in_progress',2,1,0,'2026-04-29 00:00:00',0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,2,NULL,1,7,NULL,1,1,NULL,'2026-04-27 08:38:15','2026-04-27 08:38:15'),
(3,'Updating users nformation','<p>updating people</p>',NULL,0,'in_progress',1,1,0,'2026-04-16 08:00:00',0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,2,2,4,11,NULL,1,NULL,NULL,'2026-04-27 08:39:31','2026-04-27 08:39:32'),
(4,'Telerade','<p>This Task must be Done in Three Days</p>',NULL,0,'in_progress',3,1,0,'2026-04-26 12:00:00',0.00,0.00,0.00,-5.00,5.00,5.00,5.00,0.00,0.00,2,NULL,1,7,NULL,1,NULL,NULL,'2026-04-27 08:45:59','2026-04-28 10:54:57'),
(5,'HEC-MIS','<p>This must be done in Three weeks</p>',NULL,0,'in_progress',4,1,0,NULL,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL,1,12,4,1,NULL,NULL,'2026-04-27 08:52:36','2026-04-27 08:52:36');
/*!40000 ALTER TABLE `projects_tasks` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `projects_user_project_favorites`
--

DROP TABLE IF EXISTS `projects_user_project_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_user_project_favorites` (
  `project_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  KEY `projects_user_project_favorites_project_id_foreign` (`project_id`),
  KEY `projects_user_project_favorites_user_id_foreign` (`user_id`),
  CONSTRAINT `projects_user_project_favorites_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_user_project_favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_user_project_favorites`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `projects_user_project_favorites` WRITE;
/*!40000 ALTER TABLE `projects_user_project_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_user_project_favorites` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `recruitments_applicant_applicant_categories`
--

DROP TABLE IF EXISTS `recruitments_applicant_applicant_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitments_applicant_applicant_categories` (
  `applicant_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  KEY `recruitments_applicant_applicant_categories_applicant_id_foreign` (`applicant_id`),
  KEY `recruitments_applicant_applicant_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `recruitments_applicant_applicant_categories_applicant_id_foreign` FOREIGN KEY (`applicant_id`) REFERENCES `recruitments_applicants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recruitments_applicant_applicant_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `recruitments_applicant_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitments_applicant_applicant_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `recruitments_applicant_applicant_categories` WRITE;
/*!40000 ALTER TABLE `recruitments_applicant_applicant_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruitments_applicant_applicant_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `recruitments_applicant_categories`
--

DROP TABLE IF EXISTS `recruitments_applicant_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitments_applicant_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `color` varchar(255) DEFAULT NULL COMMENT 'Color',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitments_applicant_categories_creator_id_foreign` (`creator_id`),
  CONSTRAINT `recruitments_applicant_categories_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitments_applicant_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `recruitments_applicant_categories` WRITE;
/*!40000 ALTER TABLE `recruitments_applicant_categories` DISABLE KEYS */;
INSERT INTO `recruitments_applicant_categories` VALUES
(5,1,'Sales','#FF0000','2026-04-24 05:31:56','2026-04-24 05:31:56'),
(6,1,'Manager','#00FF00','2026-04-24 05:31:56','2026-04-24 05:31:56'),
(7,1,'IT','#0000FF','2026-04-24 05:31:56','2026-04-24 05:31:56'),
(8,1,'Reserve','#FFFF00','2026-04-24 05:31:56','2026-04-24 05:31:56');
/*!40000 ALTER TABLE `recruitments_applicant_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `recruitments_applicant_interviewers`
--

DROP TABLE IF EXISTS `recruitments_applicant_interviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitments_applicant_interviewers` (
  `applicant_id` bigint(20) unsigned NOT NULL,
  `interviewer_id` bigint(20) unsigned NOT NULL,
  KEY `recruitments_applicant_interviewers_applicant_id_foreign` (`applicant_id`),
  KEY `recruitments_applicant_interviewers_interviewer_id_foreign` (`interviewer_id`),
  CONSTRAINT `recruitments_applicant_interviewers_applicant_id_foreign` FOREIGN KEY (`applicant_id`) REFERENCES `recruitments_applicants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recruitments_applicant_interviewers_interviewer_id_foreign` FOREIGN KEY (`interviewer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitments_applicant_interviewers`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `recruitments_applicant_interviewers` WRITE;
/*!40000 ALTER TABLE `recruitments_applicant_interviewers` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruitments_applicant_interviewers` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `recruitments_applicants`
--

DROP TABLE IF EXISTS `recruitments_applicants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitments_applicants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` bigint(20) unsigned DEFAULT NULL,
  `medium_id` bigint(20) unsigned DEFAULT NULL,
  `candidate_id` bigint(20) unsigned NOT NULL,
  `stage_id` bigint(20) unsigned DEFAULT NULL,
  `last_stage_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `recruiter_id` bigint(20) unsigned DEFAULT NULL,
  `job_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `refuse_reason_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `email_cc` varchar(255) DEFAULT NULL COMMENT 'Email CC',
  `priority` varchar(255) DEFAULT '0' COMMENT 'Evaluation',
  `salary_proposed_extra` varchar(255) DEFAULT NULL COMMENT 'Salary Proposed Extra',
  `salary_expected_extra` varchar(255) DEFAULT NULL COMMENT 'Salary Expected Extra',
  `applicant_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Applicant Properties' CHECK (json_valid(`applicant_properties`)),
  `applicant_notes` text DEFAULT NULL COMMENT 'Applicant Notes',
  `is_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Active Status',
  `state` varchar(255) DEFAULT NULL COMMENT 'Applicant State',
  `create_date` timestamp NULL DEFAULT NULL COMMENT 'Applied On',
  `date_closed` timestamp NULL DEFAULT NULL COMMENT 'Hired Date',
  `date_opened` timestamp NULL DEFAULT NULL COMMENT 'Assigned',
  `date_last_stage_updated` timestamp NULL DEFAULT NULL COMMENT 'Last Stage Updated',
  `refuse_date` timestamp NULL DEFAULT NULL COMMENT 'Refused Date',
  `probability` decimal(15,4) DEFAULT 0.0000 COMMENT 'Probability',
  `salary_proposed` decimal(15,4) DEFAULT 0.0000 COMMENT 'Salary Proposed',
  `salary_expected` decimal(15,4) DEFAULT 0.0000 COMMENT 'Salary Expected',
  `delay_close` decimal(15,4) DEFAULT 0.0000 COMMENT 'Delay Close',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitments_applicants_source_id_foreign` (`source_id`),
  KEY `recruitments_applicants_medium_id_foreign` (`medium_id`),
  KEY `recruitments_applicants_candidate_id_foreign` (`candidate_id`),
  KEY `recruitments_applicants_stage_id_foreign` (`stage_id`),
  KEY `recruitments_applicants_last_stage_id_foreign` (`last_stage_id`),
  KEY `recruitments_applicants_company_id_foreign` (`company_id`),
  KEY `recruitments_applicants_recruiter_id_foreign` (`recruiter_id`),
  KEY `recruitments_applicants_job_id_foreign` (`job_id`),
  KEY `recruitments_applicants_department_id_foreign` (`department_id`),
  KEY `recruitments_applicants_refuse_reason_id_foreign` (`refuse_reason_id`),
  KEY `recruitments_applicants_creator_id_foreign` (`creator_id`),
  CONSTRAINT `recruitments_applicants_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `recruitments_candidates` (`id`),
  CONSTRAINT `recruitments_applicants_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `recruitments_applicants_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `recruitments_applicants_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `employees_departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `recruitments_applicants_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `employees_job_positions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `recruitments_applicants_last_stage_id_foreign` FOREIGN KEY (`last_stage_id`) REFERENCES `recruitments_stages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `recruitments_applicants_medium_id_foreign` FOREIGN KEY (`medium_id`) REFERENCES `utm_mediums` (`id`) ON DELETE SET NULL,
  CONSTRAINT `recruitments_applicants_recruiter_id_foreign` FOREIGN KEY (`recruiter_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `recruitments_applicants_refuse_reason_id_foreign` FOREIGN KEY (`refuse_reason_id`) REFERENCES `recruitments_refuse_reasons` (`id`) ON DELETE SET NULL,
  CONSTRAINT `recruitments_applicants_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `utm_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `recruitments_applicants_stage_id_foreign` FOREIGN KEY (`stage_id`) REFERENCES `recruitments_stages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitments_applicants`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `recruitments_applicants` WRITE;
/*!40000 ALTER TABLE `recruitments_applicants` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruitments_applicants` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `recruitments_candidate_applicant_categories`
--

DROP TABLE IF EXISTS `recruitments_candidate_applicant_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitments_candidate_applicant_categories` (
  `candidate_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  KEY `recruitments_candidate_applicant_categories_candidate_id_foreign` (`candidate_id`),
  KEY `recruitments_candidate_applicant_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `recruitments_candidate_applicant_categories_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `recruitments_candidates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recruitments_candidate_applicant_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `recruitments_applicant_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitments_candidate_applicant_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `recruitments_candidate_applicant_categories` WRITE;
/*!40000 ALTER TABLE `recruitments_candidate_applicant_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruitments_candidate_applicant_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `recruitments_candidate_skills`
--

DROP TABLE IF EXISTS `recruitments_candidate_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitments_candidate_skills` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint(20) unsigned NOT NULL,
  `skill_id` bigint(20) unsigned NOT NULL,
  `skill_level_id` bigint(20) unsigned NOT NULL,
  `skill_type_id` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitments_candidate_skills_candidate_id_foreign` (`candidate_id`),
  KEY `recruitments_candidate_skills_skill_id_foreign` (`skill_id`),
  KEY `recruitments_candidate_skills_skill_level_id_foreign` (`skill_level_id`),
  KEY `recruitments_candidate_skills_skill_type_id_foreign` (`skill_type_id`),
  KEY `recruitments_candidate_skills_creator_id_foreign` (`creator_id`),
  CONSTRAINT `recruitments_candidate_skills_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `recruitments_candidates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recruitments_candidate_skills_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `recruitments_candidate_skills_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `employees_skills` (`id`),
  CONSTRAINT `recruitments_candidate_skills_skill_level_id_foreign` FOREIGN KEY (`skill_level_id`) REFERENCES `employees_skill_levels` (`id`),
  CONSTRAINT `recruitments_candidate_skills_skill_type_id_foreign` FOREIGN KEY (`skill_type_id`) REFERENCES `employees_skill_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitments_candidate_skills`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `recruitments_candidate_skills` WRITE;
/*!40000 ALTER TABLE `recruitments_candidate_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruitments_candidate_skills` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `recruitments_candidates`
--

DROP TABLE IF EXISTS `recruitments_candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitments_candidates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message_bounced` int(11) DEFAULT 0 COMMENT 'Message Bounced',
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `partner_id` bigint(20) unsigned DEFAULT NULL,
  `degree_id` bigint(20) unsigned DEFAULT NULL,
  `manager_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `email_cc` varchar(255) DEFAULT NULL COMMENT 'Email CC',
  `name` varchar(255) DEFAULT NULL COMMENT 'Partner Name',
  `email_from` varchar(255) DEFAULT NULL COMMENT 'Email From',
  `phone` varchar(255) DEFAULT NULL COMMENT 'Partner Phone',
  `linkedin_profile` varchar(255) DEFAULT NULL COMMENT 'Linkedin Profile',
  `priority` int(11) DEFAULT 0 COMMENT 'Priority',
  `availability_date` date DEFAULT NULL COMMENT 'Availability Date',
  `candidate_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Candidate Properties' CHECK (json_valid(`candidate_properties`)),
  `is_active` tinyint(1) DEFAULT 1 COMMENT 'Is Active',
  `color` varchar(255) DEFAULT NULL COMMENT 'Color',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitments_candidates_company_id_foreign` (`company_id`),
  KEY `recruitments_candidates_partner_id_foreign` (`partner_id`),
  KEY `recruitments_candidates_degree_id_foreign` (`degree_id`),
  KEY `recruitments_candidates_manager_id_foreign` (`manager_id`),
  KEY `recruitments_candidates_employee_id_foreign` (`employee_id`),
  KEY `recruitments_candidates_creator_id_foreign` (`creator_id`),
  CONSTRAINT `recruitments_candidates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `recruitments_candidates_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `recruitments_candidates_degree_id_foreign` FOREIGN KEY (`degree_id`) REFERENCES `recruitments_degrees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `recruitments_candidates_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees_employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `recruitments_candidates_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `recruitments_candidates_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners_partners` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitments_candidates`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `recruitments_candidates` WRITE;
/*!40000 ALTER TABLE `recruitments_candidates` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruitments_candidates` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `recruitments_degrees`
--

DROP TABLE IF EXISTS `recruitments_degrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitments_degrees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `sort` int(11) DEFAULT 0 COMMENT 'Sort Order',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitments_degrees_creator_id_foreign` (`creator_id`),
  CONSTRAINT `recruitments_degrees_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitments_degrees`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `recruitments_degrees` WRITE;
/*!40000 ALTER TABLE `recruitments_degrees` DISABLE KEYS */;
INSERT INTO `recruitments_degrees` VALUES
(5,1,1,'Graduate','2026-04-24 05:31:56','2026-04-24 05:31:56'),
(6,1,2,'Master','2026-04-24 05:31:56','2026-04-24 05:31:56'),
(7,1,3,'Bachelor','2026-04-24 05:31:56','2026-04-24 05:31:56'),
(8,1,4,'Doctoral Degree','2026-04-24 05:31:56','2026-04-24 05:31:56');
/*!40000 ALTER TABLE `recruitments_degrees` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `recruitments_job_position_interviewers`
--

DROP TABLE IF EXISTS `recruitments_job_position_interviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitments_job_position_interviewers` (
  `job_position_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  KEY `recruitments_job_position_interviewers_job_position_id_foreign` (`job_position_id`),
  KEY `recruitments_job_position_interviewers_user_id_foreign` (`user_id`),
  CONSTRAINT `recruitments_job_position_interviewers_job_position_id_foreign` FOREIGN KEY (`job_position_id`) REFERENCES `employees_job_positions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recruitments_job_position_interviewers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitments_job_position_interviewers`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `recruitments_job_position_interviewers` WRITE;
/*!40000 ALTER TABLE `recruitments_job_position_interviewers` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruitments_job_position_interviewers` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `recruitments_refuse_reasons`
--

DROP TABLE IF EXISTS `recruitments_refuse_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitments_refuse_reasons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT 'Sort order',
  `name` varchar(255) NOT NULL,
  `template` varchar(255) DEFAULT NULL COMMENT 'Template',
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Active Status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitments_refuse_reasons_creator_id_foreign` (`creator_id`),
  CONSTRAINT `recruitments_refuse_reasons_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitments_refuse_reasons`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `recruitments_refuse_reasons` WRITE;
/*!40000 ALTER TABLE `recruitments_refuse_reasons` DISABLE KEYS */;
INSERT INTO `recruitments_refuse_reasons` VALUES
(7,1,1,'Does not fit the job requirements','applicant-refuse',1,'2026-04-24 05:31:56','2026-04-24 05:31:56'),
(8,1,2,'Refused by applicant: job fit','applicant-not-interested',1,'2026-04-24 05:31:56','2026-04-24 05:31:56'),
(9,1,3,'Job already fulfilled','applicant-refuse',1,'2026-04-24 05:31:56','2026-04-24 05:31:56'),
(10,1,4,'Duplicate','applicant-refuse',1,'2026-04-24 05:31:56','2026-04-24 05:31:56'),
(11,1,4,'Spam','applicant-not-interested',1,'2026-04-24 05:31:56','2026-04-24 05:31:56'),
(12,1,4,'Refused by applicant: salary','applicant-not-interested',1,'2026-04-24 05:31:56','2026-04-24 05:31:56');
/*!40000 ALTER TABLE `recruitments_refuse_reasons` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `recruitments_stages`
--

DROP TABLE IF EXISTS `recruitments_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitments_stages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Is Default',
  `sort` int(11) DEFAULT NULL COMMENT 'Sort order of the stage',
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Name of the stage',
  `legend_blocked` varchar(255) NOT NULL COMMENT 'Legend for blocked applications',
  `legend_done` varchar(255) NOT NULL COMMENT 'Legend for done applications',
  `legend_normal` varchar(255) NOT NULL COMMENT 'Legend for normal applications',
  `requirements` text DEFAULT NULL COMMENT 'Requirements for the stage',
  `hired_stage` varchar(255) DEFAULT NULL COMMENT 'Stage to move the application to when hired',
  `fold` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Whether the stage is folded',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitments_stages_creator_id_foreign` (`creator_id`),
  CONSTRAINT `recruitments_stages_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitments_stages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `recruitments_stages` WRITE;
/*!40000 ALTER TABLE `recruitments_stages` DISABLE KEYS */;
INSERT INTO `recruitments_stages` VALUES
(7,1,0,1,'New','Blocked','Ready for Next Stage','In Progress	',NULL,'0',1,'2026-04-24 05:31:56','2026-04-24 05:31:56'),
(8,0,1,1,'First Interview','Blocked','Ready for Next Stage','In Progress	',NULL,'0',0,'2026-04-24 05:31:56','2026-04-24 05:31:56'),
(9,0,2,1,'Initial Qualification','Blocked','Ready for Next Stage','In Progress	',NULL,'0',0,'2026-04-24 05:31:56','2026-04-24 05:31:56'),
(10,0,3,1,'Second Interview','Blocked','Ready for Next Stage','In Progress	',NULL,'0',0,'2026-04-24 05:31:56','2026-04-24 05:31:56'),
(11,0,4,1,'Contract Proposal','Blocked','Ready for Next Stage','In Progress	',NULL,'0',0,'2026-04-24 05:31:56','2026-04-24 05:31:56'),
(12,0,5,1,'Contract Signed','Blocked','Ready for Next Stage','In Progress	',NULL,'1',0,'2026-04-24 05:31:56','2026-04-24 05:31:56');
/*!40000 ALTER TABLE `recruitments_stages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `recruitments_stages_jobs`
--

DROP TABLE IF EXISTS `recruitments_stages_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitments_stages_jobs` (
  `stage_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Stage ID',
  `job_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Job ID',
  KEY `recruitments_stages_jobs_stage_id_foreign` (`stage_id`),
  KEY `recruitments_stages_jobs_job_id_foreign` (`job_id`),
  CONSTRAINT `recruitments_stages_jobs_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `employees_job_positions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recruitments_stages_jobs_stage_id_foreign` FOREIGN KEY (`stage_id`) REFERENCES `recruitments_stages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitments_stages_jobs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `recruitments_stages_jobs` WRITE;
/*!40000 ALTER TABLE `recruitments_stages_jobs` DISABLE KEYS */;
INSERT INTO `recruitments_stages_jobs` VALUES
(7,31),
(7,32),
(7,33),
(7,34),
(7,35),
(7,36),
(7,37),
(7,38),
(7,39),
(7,40);
/*!40000 ALTER TABLE `recruitments_stages_jobs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1),
(13,1),
(14,1),
(15,1),
(16,1),
(17,1),
(18,1),
(19,1),
(20,1),
(21,1),
(22,1),
(23,1),
(24,1),
(25,1),
(26,1),
(27,1),
(28,1),
(29,1),
(30,1),
(31,1),
(32,1),
(33,1),
(34,1),
(35,1),
(36,1),
(37,1),
(38,1),
(39,1),
(40,1),
(41,1),
(42,1),
(43,1),
(44,1),
(45,1),
(46,1),
(47,1),
(48,1),
(49,1),
(50,1),
(51,1),
(52,1),
(53,1),
(54,1),
(55,1),
(56,1),
(57,1),
(58,1),
(59,1),
(60,1),
(61,1),
(62,1),
(63,1),
(64,1),
(65,1),
(66,1),
(67,1),
(68,1),
(69,1),
(70,1),
(71,1),
(72,1),
(73,1),
(74,1),
(75,1),
(76,1),
(77,1),
(78,1),
(79,1),
(80,1),
(81,1),
(82,1),
(83,1),
(84,1),
(85,1),
(86,1),
(87,1),
(88,1),
(89,1),
(90,1),
(91,1),
(92,1),
(93,1),
(94,1),
(95,1),
(96,1),
(97,1),
(98,1),
(99,1),
(100,1),
(101,1),
(102,1),
(103,1),
(104,1),
(105,1),
(106,1),
(107,1),
(108,1),
(109,1),
(110,1),
(111,1),
(112,1),
(113,1),
(114,1),
(115,1),
(116,1),
(117,1),
(118,1),
(119,1),
(120,1),
(121,1),
(122,1),
(123,1),
(124,1),
(125,1),
(126,1),
(127,1),
(128,1),
(129,1),
(130,1),
(131,1),
(132,1),
(133,1),
(134,1),
(135,1),
(136,1),
(137,1),
(138,1),
(139,1),
(140,1),
(141,1),
(142,1),
(143,1),
(144,1),
(145,1),
(146,1),
(147,1),
(148,1),
(149,1),
(150,1),
(151,1),
(152,1),
(153,1),
(154,1),
(155,1),
(156,1),
(157,1),
(158,1),
(159,1),
(160,1),
(161,1),
(162,1),
(163,1),
(164,1),
(165,1),
(166,1),
(167,1),
(168,1),
(169,1),
(170,1),
(171,1),
(172,1),
(173,1),
(174,1),
(175,1),
(176,1),
(177,1),
(178,1),
(179,1),
(180,1),
(181,1),
(182,1),
(183,1),
(184,1),
(185,1),
(186,1),
(187,1),
(188,1),
(189,1),
(190,1),
(191,1),
(192,1),
(193,1),
(194,1),
(195,1),
(196,1),
(197,1),
(198,1),
(199,1),
(200,1),
(201,1),
(202,1),
(203,1),
(204,1),
(205,1),
(206,1),
(207,1),
(208,1),
(209,1),
(210,1),
(211,1),
(212,1),
(213,1),
(214,1),
(215,1),
(216,1),
(217,1),
(218,1),
(219,1),
(220,1),
(221,1),
(222,1),
(223,1),
(224,1),
(225,1),
(226,1),
(227,1),
(228,1),
(229,1),
(230,1),
(231,1),
(232,1),
(233,1),
(234,1),
(235,1),
(236,1),
(237,1),
(238,1),
(239,1),
(240,1),
(241,1),
(242,1),
(243,1),
(244,1),
(245,1),
(246,1),
(247,1),
(248,1),
(249,1),
(250,1),
(251,1),
(252,1),
(253,1),
(254,1),
(255,1),
(256,1),
(257,1),
(258,1),
(259,1),
(260,1),
(261,1),
(262,1),
(263,1),
(264,1),
(265,1),
(266,1),
(267,1),
(268,1),
(269,1),
(270,1),
(271,1),
(272,1),
(273,1),
(274,1),
(275,1),
(276,1),
(277,1),
(278,1),
(279,1),
(280,1),
(281,1),
(282,1),
(283,1),
(284,1),
(285,1),
(286,1),
(287,1),
(288,1),
(289,1),
(290,1),
(291,1),
(292,1),
(293,1),
(294,1),
(295,1),
(296,1),
(297,1),
(298,1),
(299,1),
(300,1),
(301,1),
(302,1),
(303,1),
(304,1),
(305,1),
(306,1),
(307,1),
(308,1),
(309,1),
(310,1),
(311,1),
(312,1),
(313,1),
(314,1),
(315,1),
(316,1),
(317,1),
(318,1),
(319,1),
(320,1),
(321,1),
(322,1),
(323,1),
(324,1),
(325,1),
(326,1),
(327,1),
(328,1),
(329,1),
(330,1),
(331,1),
(332,1),
(333,1),
(334,1),
(335,1),
(336,1),
(337,1),
(338,1),
(339,1),
(340,1),
(341,1),
(342,1),
(343,1),
(344,1),
(345,1),
(346,1),
(347,1),
(348,1),
(349,1),
(350,1),
(351,1),
(352,1),
(353,1),
(354,1),
(355,1),
(356,1),
(357,1),
(358,1),
(359,1),
(360,1),
(361,1),
(362,1),
(363,1),
(364,1),
(365,1),
(366,1),
(367,1),
(368,1),
(369,1),
(370,1),
(371,1),
(372,1),
(373,1),
(374,1),
(375,1),
(376,1),
(377,1),
(378,1),
(379,1),
(380,1),
(381,1),
(382,1),
(383,1),
(384,1),
(385,1),
(386,1),
(387,1),
(388,1),
(389,1),
(390,1),
(391,1),
(392,1),
(393,1),
(394,1),
(395,1),
(396,1),
(397,1),
(398,1),
(399,1),
(400,1),
(401,1),
(402,1),
(403,1),
(404,1),
(405,1),
(406,1),
(407,1),
(408,1),
(409,1),
(410,1),
(411,1),
(412,1),
(413,1),
(414,1),
(415,1),
(416,1),
(417,1),
(418,1),
(419,1),
(420,1),
(421,1),
(422,1),
(423,1),
(424,1),
(425,1),
(426,1),
(427,1),
(428,1),
(429,1),
(430,1),
(431,1),
(432,1),
(433,1),
(434,1),
(435,1),
(436,1),
(437,1),
(438,1),
(439,1),
(440,1),
(441,1),
(442,1),
(443,1),
(444,1),
(445,1),
(446,1),
(447,1),
(448,1),
(449,1),
(450,1),
(451,1),
(452,1),
(453,1),
(454,1),
(455,1),
(456,1),
(457,1),
(458,1),
(459,1),
(460,1),
(461,1),
(462,1),
(463,1),
(464,1),
(465,1),
(466,1),
(467,1),
(468,1),
(469,1),
(470,1),
(471,1),
(472,1),
(473,1),
(474,1),
(475,1),
(476,1),
(477,1),
(478,1),
(479,1),
(480,1),
(481,1),
(482,1),
(483,1),
(484,1),
(485,1),
(486,1),
(487,1),
(488,1),
(489,1),
(490,1),
(491,1),
(492,1),
(493,1),
(494,1),
(495,1),
(496,1),
(497,1),
(498,1),
(499,1),
(500,1),
(501,1),
(502,1),
(503,1),
(504,1),
(505,1),
(506,1),
(507,1),
(508,1),
(509,1),
(510,1),
(511,1),
(512,1),
(513,1),
(514,1),
(515,1),
(516,1),
(517,1),
(518,1),
(519,1),
(520,1),
(521,1),
(522,1),
(523,1),
(524,1),
(525,1),
(526,1),
(527,1),
(528,1),
(529,1),
(530,1),
(531,1),
(532,1),
(533,1),
(534,1),
(535,1),
(536,1),
(537,1),
(538,1),
(539,1),
(540,1),
(541,1),
(542,1),
(543,1),
(544,1),
(545,1),
(546,1),
(547,1),
(548,1),
(549,1),
(550,1),
(551,1),
(552,1),
(553,1),
(554,1),
(555,1),
(556,1),
(557,1),
(558,1),
(559,1),
(560,1),
(561,1),
(562,1),
(563,1),
(564,1),
(565,1),
(566,1),
(567,1),
(568,1),
(569,1),
(570,1),
(571,1),
(572,1),
(573,1),
(574,1),
(575,1),
(576,1),
(577,1),
(578,1),
(579,1),
(580,1),
(581,1),
(582,1),
(583,1),
(584,1),
(585,1),
(586,1),
(587,1),
(588,1),
(589,1),
(590,1),
(591,1),
(592,1),
(593,1),
(594,1),
(595,1),
(596,1),
(597,1),
(598,1),
(599,1),
(600,1),
(601,1),
(602,1),
(603,1),
(604,1),
(605,1),
(606,1),
(607,1),
(608,1),
(609,1),
(610,1),
(611,1),
(612,1),
(613,1),
(614,1),
(615,1),
(616,1),
(617,1),
(618,1),
(619,1),
(620,1),
(621,1),
(622,1),
(623,1),
(624,1),
(625,1),
(626,1),
(627,1),
(628,1),
(629,1),
(630,1),
(631,1),
(632,1),
(633,1),
(634,1),
(635,1),
(636,1),
(637,1),
(638,1),
(639,1),
(640,1),
(641,1),
(642,1),
(643,1),
(644,1),
(645,1),
(646,1),
(647,1),
(648,1),
(649,1),
(650,1),
(651,1),
(652,1),
(653,1),
(654,1),
(655,1),
(656,1),
(657,1),
(658,1),
(659,1),
(660,1),
(661,1),
(662,1),
(663,1),
(664,1),
(665,1),
(666,1),
(667,1),
(668,1),
(669,1),
(670,1),
(671,1),
(672,1),
(673,1),
(674,1),
(675,1),
(676,1),
(677,1),
(678,1),
(679,1),
(680,1),
(681,1),
(682,1),
(683,1),
(684,1),
(685,1),
(686,1),
(687,1),
(688,1),
(689,1),
(690,1),
(691,1),
(692,1),
(693,1),
(694,1),
(695,1),
(696,1),
(697,1),
(698,1),
(699,1),
(700,1),
(701,1),
(702,1),
(703,1),
(704,1),
(705,1),
(706,1),
(707,1),
(708,1),
(709,1),
(710,1),
(711,1),
(712,1),
(713,1),
(714,1),
(715,1),
(716,1),
(717,1),
(718,1),
(719,1),
(720,1),
(721,1),
(722,1),
(723,1),
(724,1),
(725,1),
(726,1),
(727,1),
(728,1),
(729,1),
(730,1),
(731,1),
(732,1),
(733,1),
(734,1),
(735,1),
(736,1),
(737,1),
(738,1),
(739,1),
(740,1),
(741,1),
(742,1),
(743,1),
(744,1),
(745,1),
(746,1),
(747,1),
(748,1),
(749,1),
(750,1),
(751,1),
(752,1),
(753,1),
(754,1),
(755,1),
(756,1),
(757,1),
(758,1),
(759,1),
(760,1),
(761,1),
(762,1),
(763,1),
(764,1),
(765,1),
(766,1),
(767,1),
(768,1),
(769,1),
(770,1),
(771,1),
(772,1),
(773,1),
(774,1),
(775,1),
(776,1),
(777,1),
(778,1),
(779,1),
(780,1),
(781,1),
(782,1),
(783,1),
(784,1),
(785,1),
(786,1),
(787,1),
(788,1),
(789,1),
(790,1),
(791,1),
(792,1),
(793,1),
(794,1),
(795,1),
(796,1),
(797,1),
(798,1),
(799,1),
(800,1),
(801,1),
(802,1),
(803,1),
(804,1),
(805,1),
(806,1),
(807,1),
(808,1),
(809,1),
(810,1),
(811,1),
(812,1),
(813,1),
(814,1),
(815,1),
(816,1),
(817,1),
(818,1),
(819,1),
(820,1),
(821,1),
(822,1),
(823,1),
(824,1),
(825,1),
(826,1),
(827,1),
(828,1),
(829,1),
(830,1),
(831,1),
(832,1),
(833,1),
(834,1),
(835,1),
(836,1),
(837,1),
(838,1),
(839,1),
(840,1),
(841,1),
(842,1),
(843,1),
(844,1),
(845,1),
(846,1),
(847,1),
(848,1),
(849,1),
(850,1),
(851,1),
(852,1),
(853,1),
(854,1),
(855,1),
(856,1),
(857,1),
(858,1),
(859,1),
(860,1),
(861,1),
(862,1),
(863,1),
(864,1),
(865,1),
(866,1),
(867,1),
(868,1),
(869,1),
(870,1),
(871,1),
(872,1),
(873,1),
(874,1),
(875,1),
(876,1),
(877,1),
(878,1),
(879,1),
(880,1),
(881,1),
(882,1),
(883,1),
(884,1),
(885,1),
(886,1),
(887,1),
(888,1),
(889,1),
(890,1),
(891,1),
(892,1),
(893,1),
(894,1),
(895,1),
(896,1),
(897,1),
(898,1),
(899,1),
(900,1),
(901,1),
(902,1),
(903,1),
(904,1),
(905,1),
(906,1),
(907,1),
(908,1),
(909,1),
(910,1),
(911,1),
(912,1),
(913,1),
(914,1),
(915,1),
(916,1),
(917,1),
(918,1),
(919,1),
(920,1),
(921,1),
(922,1),
(923,1),
(924,1),
(925,1),
(926,1),
(927,1),
(928,1),
(929,1),
(930,1),
(931,1),
(932,1),
(933,1),
(934,1),
(935,1),
(936,1),
(937,1),
(938,1),
(939,1),
(940,1),
(941,1),
(942,1),
(943,1),
(944,1),
(945,1),
(946,1),
(947,1),
(948,1),
(949,1),
(950,1),
(951,1),
(952,1),
(953,1),
(954,1),
(955,1),
(956,1),
(957,1),
(958,1),
(959,1),
(960,1),
(961,1),
(962,1),
(963,1),
(964,1),
(965,1),
(966,1),
(967,1),
(968,1),
(969,1),
(970,1),
(971,1),
(972,1),
(973,1),
(974,1),
(975,1),
(976,1),
(977,1),
(978,1),
(979,1),
(980,1),
(981,1),
(982,1),
(983,1),
(984,1),
(985,1),
(986,1),
(987,1),
(988,1),
(989,1),
(990,1),
(991,1),
(992,1),
(993,1),
(994,1),
(995,1),
(996,1),
(997,1),
(998,1),
(999,1),
(1000,1),
(1001,1),
(1002,1),
(1003,1),
(1004,1),
(1005,1),
(1006,1),
(1007,1),
(1008,1),
(1009,1),
(1010,1),
(1011,1),
(1012,1),
(1013,1),
(1014,1),
(1015,1),
(1016,1),
(1017,1),
(1018,1),
(1019,1),
(1020,1),
(1021,1),
(1022,1),
(1023,1),
(1024,1),
(1025,1),
(1026,1),
(1027,1),
(1028,1),
(1029,1),
(1030,1),
(1031,1),
(1032,1),
(1033,1),
(1034,1),
(1035,1),
(1036,1),
(1037,1),
(1038,1),
(1039,1),
(1040,1),
(1041,1),
(1042,1),
(1043,1),
(1044,1),
(1045,1),
(1046,1),
(1047,1),
(1048,1),
(1049,1),
(1050,1),
(1051,1),
(1052,1),
(1053,1),
(1054,1),
(1055,1),
(1056,1),
(1057,1),
(1058,1),
(1059,1),
(1060,1),
(1061,1),
(1062,1),
(1063,1),
(1064,1),
(1065,1),
(1066,1),
(1067,1),
(1068,1),
(1069,1),
(1070,1),
(1071,1),
(1072,1),
(1073,1),
(1074,1),
(1075,1),
(1076,1),
(1077,1),
(1078,1),
(1079,1),
(1080,1),
(1081,1),
(1082,1),
(1083,1),
(1084,1),
(1085,1),
(1086,1),
(1087,1),
(1088,1),
(1089,1),
(1090,1),
(1091,1),
(1092,1),
(1093,1),
(1094,1),
(1095,1),
(1096,1),
(1097,1),
(1098,1),
(1099,1),
(1100,1),
(1101,1),
(1102,1),
(1103,1),
(1104,1),
(1105,1),
(1106,1),
(1107,1),
(1108,1),
(1109,1),
(1110,1),
(1111,1),
(1112,1),
(1113,1),
(1114,1),
(1115,1),
(1116,1),
(1117,1),
(1118,1),
(1119,1),
(1120,1),
(1121,1),
(1122,1),
(1123,1),
(1124,1),
(1125,1),
(1126,1),
(1127,1),
(1128,1),
(1129,1),
(1130,1),
(1131,1),
(1132,1),
(1133,1),
(1134,1),
(1135,1),
(1136,1),
(1137,1),
(1138,1),
(1139,1),
(1140,1),
(1141,1),
(1142,1),
(1143,1),
(1144,1),
(1145,1),
(1146,1),
(1147,1),
(1148,1),
(1149,1),
(1150,1),
(1151,1),
(1152,1),
(1153,1),
(1154,1),
(1155,1),
(1156,1),
(1157,1),
(1158,1),
(1159,1),
(1160,1),
(1161,1),
(1162,1),
(1163,1),
(1164,1),
(1165,1),
(1166,1),
(1167,1),
(1168,1),
(1169,1),
(1170,1),
(1171,1),
(1172,1),
(1173,1),
(1174,1),
(1175,1),
(1176,1),
(1177,1),
(1178,1),
(1179,1),
(1180,1),
(1181,1),
(1182,1),
(1183,1),
(1184,1),
(1185,1),
(1186,1),
(1187,1),
(1188,1),
(1189,1),
(1190,1),
(1191,1),
(1192,1),
(1193,1),
(1194,1),
(1,2),
(2,2),
(3,2),
(4,2),
(5,2),
(6,2),
(7,2),
(8,2),
(9,2),
(10,2),
(11,2),
(12,2),
(13,2),
(14,2),
(15,2),
(16,2),
(17,2),
(18,2),
(19,2),
(20,2),
(21,2),
(22,2),
(23,2),
(24,2),
(25,2),
(26,2),
(27,2),
(28,2),
(29,2),
(30,2),
(31,2),
(32,2),
(33,2),
(34,2),
(35,2),
(36,2),
(37,2),
(38,2),
(39,2),
(40,2),
(41,2),
(42,2),
(43,2),
(44,2),
(45,2),
(46,2),
(47,2),
(48,2),
(49,2),
(50,2),
(51,2),
(52,2),
(53,2),
(54,2),
(55,2),
(56,2),
(57,2),
(58,2),
(59,2),
(60,2),
(61,2),
(62,2),
(63,2),
(64,2),
(65,2),
(66,2),
(67,2),
(68,2),
(69,2),
(70,2),
(71,2),
(72,2),
(73,2),
(74,2),
(75,2),
(76,2),
(77,2),
(78,2),
(79,2),
(80,2),
(81,2),
(82,2),
(83,2),
(84,2),
(85,2),
(86,2),
(87,2),
(88,2),
(89,2),
(90,2),
(91,2),
(92,2),
(93,2),
(94,2),
(95,2),
(96,2),
(97,2),
(98,2),
(99,2),
(100,2),
(101,2),
(102,2),
(103,2),
(104,2),
(105,2),
(106,2),
(107,2),
(108,2),
(109,2),
(110,2),
(111,2),
(112,2),
(113,2),
(114,2),
(115,2),
(116,2),
(117,2),
(118,2),
(119,2),
(120,2),
(121,2),
(122,2),
(123,2),
(124,2),
(125,2),
(126,2),
(127,2),
(128,2),
(129,2),
(130,2),
(131,2),
(132,2),
(133,2),
(134,2),
(135,2),
(136,2),
(137,2),
(138,2),
(139,2),
(140,2),
(141,2),
(142,2),
(143,2),
(144,2),
(145,2),
(146,2),
(147,2),
(148,2),
(149,2),
(150,2),
(151,2),
(152,2),
(153,2),
(154,2),
(155,2),
(156,2),
(157,2),
(158,2),
(159,2),
(160,2),
(161,2),
(162,2),
(163,2),
(164,2),
(165,2),
(166,2),
(167,2),
(168,2),
(169,2),
(170,2),
(171,2),
(172,2),
(173,2),
(174,2),
(175,2),
(176,2),
(177,2),
(178,2),
(179,2),
(180,2),
(181,2),
(182,2),
(183,2),
(184,2),
(185,2),
(186,2),
(187,2),
(188,2),
(189,2),
(190,2),
(191,2),
(192,2),
(193,2),
(194,2),
(195,2),
(196,2),
(197,2),
(198,2),
(199,2),
(200,2),
(201,2),
(202,2),
(203,2),
(215,2),
(216,2),
(217,2),
(218,2),
(219,2),
(220,2),
(221,2),
(222,2),
(223,2),
(224,2),
(225,2),
(226,2),
(227,2),
(228,2),
(229,2),
(230,2),
(231,2),
(232,2),
(233,2),
(234,2),
(235,2),
(236,2),
(237,2),
(238,2),
(239,2),
(240,2),
(241,2),
(242,2),
(243,2),
(244,2),
(245,2),
(246,2),
(247,2),
(248,2),
(249,2),
(250,2),
(251,2),
(252,2),
(253,2),
(254,2),
(255,2),
(256,2),
(257,2),
(258,2),
(259,2),
(260,2),
(261,2),
(262,2),
(263,2),
(264,2),
(265,2),
(266,2),
(267,2),
(268,2),
(269,2),
(270,2),
(271,2),
(272,2),
(273,2),
(274,2),
(275,2),
(276,2),
(277,2),
(278,2),
(279,2),
(280,2),
(281,2),
(282,2),
(283,2),
(284,2),
(285,2),
(286,2),
(287,2),
(288,2),
(289,2),
(290,2),
(291,2),
(292,2),
(293,2),
(294,2),
(295,2),
(296,2),
(297,2),
(298,2),
(299,2),
(300,2),
(301,2),
(302,2),
(303,2),
(304,2),
(305,2),
(306,2),
(307,2),
(308,2),
(309,2),
(310,2),
(311,2),
(312,2),
(313,2),
(314,2),
(315,2),
(316,2),
(317,2),
(318,2),
(319,2),
(320,2),
(321,2),
(322,2),
(323,2),
(324,2),
(325,2),
(326,2),
(327,2),
(328,2),
(329,2),
(330,2),
(331,2),
(332,2),
(333,2),
(334,2),
(335,2),
(336,2),
(337,2),
(338,2),
(339,2),
(340,2),
(341,2),
(342,2),
(343,2),
(344,2),
(345,2),
(346,2),
(347,2),
(348,2),
(349,2),
(350,2),
(351,2),
(352,2),
(353,2),
(354,2),
(355,2),
(356,2),
(357,2),
(358,2),
(359,2),
(360,2),
(361,2),
(362,2),
(363,2),
(364,2),
(365,2),
(366,2),
(367,2),
(368,2),
(369,2),
(370,2),
(371,2),
(372,2),
(373,2),
(374,2),
(375,2),
(376,2),
(377,2),
(378,2),
(379,2),
(380,2),
(381,2),
(382,2),
(383,2),
(384,2),
(385,2),
(386,2),
(387,2),
(388,2),
(389,2),
(390,2),
(391,2),
(392,2),
(393,2),
(394,2),
(395,2),
(396,2),
(397,2),
(398,2),
(399,2),
(400,2),
(401,2),
(402,2),
(403,2),
(404,2),
(405,2),
(406,2),
(407,2),
(408,2),
(409,2),
(410,2),
(411,2),
(412,2),
(413,2),
(414,2),
(415,2),
(416,2),
(417,2),
(418,2),
(419,2),
(420,2),
(421,2),
(422,2),
(423,2),
(424,2),
(425,2),
(426,2),
(427,2),
(428,2),
(429,2),
(430,2),
(431,2),
(432,2),
(433,2),
(434,2),
(435,2),
(436,2),
(437,2),
(438,2),
(439,2),
(440,2),
(441,2),
(442,2),
(443,2),
(444,2),
(445,2),
(446,2),
(447,2),
(448,2),
(449,2),
(450,2),
(451,2),
(452,2),
(453,2),
(454,2),
(455,2),
(456,2),
(457,2),
(458,2),
(459,2),
(460,2),
(461,2),
(462,2),
(463,2),
(464,2),
(465,2),
(466,2),
(467,2),
(468,2),
(469,2),
(470,2),
(471,2),
(472,2),
(473,2),
(474,2),
(475,2),
(476,2),
(477,2),
(478,2),
(479,2),
(480,2),
(481,2),
(482,2),
(483,2),
(484,2),
(485,2),
(486,2),
(487,2),
(488,2),
(489,2),
(490,2),
(491,2),
(492,2),
(493,2),
(494,2),
(495,2),
(496,2),
(497,2),
(498,2),
(499,2),
(500,2),
(501,2),
(502,2),
(503,2),
(504,2),
(505,2),
(506,2),
(507,2),
(508,2),
(509,2),
(510,2),
(511,2),
(512,2),
(513,2),
(514,2),
(515,2),
(522,2),
(523,2),
(524,2),
(525,2),
(526,2),
(527,2),
(528,2),
(529,2),
(530,2),
(531,2),
(532,2),
(533,2),
(534,2),
(535,2),
(536,2),
(537,2),
(538,2),
(539,2),
(540,2),
(541,2),
(542,2),
(543,2),
(544,2),
(545,2),
(546,2),
(547,2),
(548,2),
(549,2),
(550,2),
(551,2),
(552,2),
(553,2),
(554,2),
(555,2),
(556,2),
(557,2),
(558,2),
(559,2),
(560,2),
(561,2),
(562,2),
(563,2),
(564,2),
(565,2),
(566,2),
(567,2),
(568,2),
(569,2),
(570,2),
(571,2),
(572,2),
(573,2),
(574,2),
(575,2),
(576,2),
(577,2),
(578,2),
(579,2),
(580,2),
(581,2),
(582,2),
(583,2),
(584,2),
(585,2),
(586,2),
(587,2),
(588,2),
(589,2),
(590,2),
(591,2),
(592,2),
(593,2),
(594,2),
(595,2),
(596,2),
(597,2),
(598,2),
(599,2),
(600,2),
(601,2),
(602,2),
(603,2),
(604,2),
(605,2),
(606,2),
(607,2),
(608,2),
(609,2),
(610,2),
(611,2),
(612,2),
(613,2),
(614,2),
(615,2),
(616,2),
(617,2),
(618,2),
(619,2),
(620,2),
(621,2),
(622,2),
(623,2),
(624,2),
(625,2),
(626,2),
(627,2),
(628,2),
(629,2),
(630,2),
(631,2),
(632,2),
(633,2),
(634,2),
(635,2),
(636,2),
(637,2),
(638,2),
(639,2),
(640,2),
(641,2),
(642,2),
(643,2),
(644,2),
(645,2),
(646,2),
(647,2),
(648,2),
(649,2),
(650,2),
(651,2),
(652,2),
(653,2),
(654,2),
(655,2),
(656,2),
(657,2),
(658,2),
(659,2),
(660,2),
(667,2),
(668,2),
(669,2),
(670,2),
(671,2),
(672,2),
(673,2),
(674,2),
(675,2),
(676,2),
(677,2),
(678,2),
(679,2),
(680,2),
(681,2),
(682,2),
(683,2),
(684,2),
(685,2),
(686,2),
(687,2),
(688,2),
(689,2),
(690,2),
(691,2),
(692,2),
(693,2),
(694,2),
(695,2),
(696,2),
(697,2),
(698,2),
(699,2),
(700,2),
(701,2),
(702,2),
(703,2),
(704,2),
(705,2),
(706,2),
(707,2),
(708,2),
(709,2),
(710,2),
(711,2),
(712,2),
(713,2),
(714,2),
(715,2),
(716,2),
(717,2),
(718,2),
(719,2),
(720,2),
(721,2),
(722,2),
(723,2),
(724,2),
(725,2),
(726,2),
(727,2),
(728,2),
(729,2),
(730,2),
(731,2),
(732,2),
(733,2),
(734,2),
(735,2),
(736,2),
(737,2),
(738,2),
(739,2),
(740,2),
(741,2),
(742,2),
(743,2),
(744,2),
(745,2),
(746,2),
(747,2),
(748,2),
(749,2),
(750,2),
(751,2),
(752,2),
(753,2),
(754,2),
(755,2),
(756,2),
(757,2),
(758,2),
(759,2),
(760,2),
(761,2),
(762,2),
(763,2),
(764,2),
(765,2),
(766,2),
(767,2),
(768,2),
(769,2),
(770,2),
(771,2),
(772,2),
(773,2),
(774,2),
(775,2),
(776,2),
(777,2),
(778,2),
(779,2),
(780,2),
(781,2),
(782,2),
(783,2),
(784,2),
(785,2),
(786,2),
(787,2),
(788,2),
(789,2),
(790,2),
(791,2),
(792,2),
(793,2),
(794,2),
(795,2),
(796,2),
(797,2),
(798,2),
(799,2),
(800,2),
(801,2),
(802,2),
(803,2),
(804,2),
(805,2),
(806,2),
(807,2),
(808,2),
(809,2),
(810,2),
(811,2),
(812,2),
(813,2),
(814,2),
(815,2),
(816,2),
(817,2),
(818,2),
(819,2),
(820,2),
(821,2),
(822,2),
(823,2),
(824,2),
(825,2),
(826,2),
(827,2),
(828,2),
(829,2),
(830,2),
(831,2),
(832,2),
(833,2),
(834,2),
(835,2),
(836,2),
(837,2),
(838,2),
(839,2),
(840,2),
(841,2),
(842,2),
(843,2),
(844,2),
(845,2),
(846,2),
(847,2),
(848,2),
(849,2),
(850,2),
(851,2),
(852,2),
(853,2),
(854,2),
(855,2),
(856,2),
(857,2),
(858,2),
(859,2),
(860,2),
(861,2),
(862,2),
(863,2),
(864,2),
(865,2),
(866,2),
(867,2),
(868,2),
(869,2),
(870,2),
(871,2),
(872,2),
(873,2),
(874,2),
(875,2),
(876,2),
(877,2),
(878,2),
(879,2),
(880,2),
(881,2),
(882,2),
(883,2),
(884,2),
(885,2),
(886,2),
(887,2),
(888,2),
(889,2),
(890,2),
(891,2),
(892,2),
(893,2),
(894,2),
(895,2),
(896,2),
(897,2),
(898,2),
(899,2),
(900,2),
(901,2),
(902,2),
(903,2),
(904,2),
(905,2),
(906,2),
(907,2),
(908,2),
(909,2),
(910,2),
(911,2),
(912,2),
(913,2),
(914,2),
(915,2),
(916,2),
(917,2),
(918,2),
(919,2),
(920,2),
(921,2),
(922,2),
(923,2),
(924,2),
(925,2),
(926,2),
(927,2),
(928,2),
(929,2),
(930,2),
(931,2),
(932,2),
(933,2),
(934,2),
(935,2),
(936,2),
(937,2),
(938,2),
(939,2),
(940,2),
(941,2),
(942,2),
(943,2),
(944,2),
(945,2),
(946,2),
(947,2),
(948,2),
(949,2),
(950,2),
(951,2),
(952,2),
(953,2),
(954,2),
(955,2),
(956,2),
(957,2),
(958,2),
(959,2),
(960,2),
(961,2),
(962,2),
(963,2),
(964,2),
(965,2),
(966,2),
(967,2),
(968,2),
(969,2),
(970,2),
(971,2),
(972,2),
(973,2),
(974,2),
(975,2),
(976,2),
(977,2),
(978,2),
(979,2),
(980,2),
(981,2),
(982,2),
(983,2),
(984,2),
(985,2),
(986,2),
(987,2),
(988,2),
(989,2),
(990,2),
(991,2),
(992,2),
(993,2),
(994,2),
(995,2),
(996,2),
(997,2),
(998,2),
(999,2),
(1000,2),
(1001,2),
(1002,2),
(1003,2),
(1004,2),
(1005,2),
(1006,2),
(1007,2),
(1008,2),
(1009,2),
(1010,2),
(1011,2),
(1012,2),
(1013,2),
(1014,2),
(1015,2),
(1016,2),
(1017,2),
(1018,2),
(1019,2),
(1020,2),
(1021,2),
(1022,2),
(1023,2),
(1024,2),
(1025,2),
(1026,2),
(1027,2),
(1028,2),
(1029,2),
(1030,2),
(1031,2),
(1032,2),
(1033,2),
(1034,2),
(1035,2),
(1036,2),
(1037,2),
(1038,2),
(1039,2),
(1040,2),
(1041,2),
(1042,2),
(1043,2),
(1044,2),
(1045,2),
(1046,2),
(1047,2),
(1048,2),
(1049,2),
(1050,2),
(1051,2),
(1052,2),
(1053,2),
(1054,2),
(1055,2),
(1056,2),
(1057,2),
(1058,2),
(1059,2),
(1060,2),
(1061,2),
(1062,2),
(1063,2),
(1064,2),
(1065,2),
(1066,2),
(1067,2),
(1068,2),
(1069,2),
(1070,2),
(1071,2),
(1072,2),
(1073,2),
(1074,2),
(1075,2),
(1076,2),
(1077,2),
(1078,2),
(1079,2),
(1080,2),
(1081,2),
(1082,2),
(1083,2),
(1084,2),
(1085,2),
(1086,2),
(1087,2),
(1088,2),
(1089,2),
(1090,2),
(1091,2),
(1092,2),
(1093,2),
(1094,2),
(1095,2),
(1096,2),
(1097,2),
(1098,2),
(1099,2),
(1100,2),
(1101,2),
(1102,2),
(1103,2),
(1104,2),
(1105,2),
(1106,2),
(1107,2),
(1108,2),
(1109,2),
(1110,2),
(1111,2),
(1112,2),
(1113,2),
(1114,2),
(1115,2),
(1116,2),
(1117,2),
(1118,2),
(1119,2),
(1120,2),
(1121,2),
(1122,2),
(1123,2),
(1124,2),
(1125,2),
(1126,2),
(1127,2),
(1128,2),
(1129,2),
(1130,2),
(1131,2),
(1132,2),
(1133,2),
(1134,2),
(1135,2),
(1136,2),
(1137,2),
(1138,2),
(1139,2),
(1140,2),
(1141,2),
(1142,2),
(1143,2),
(1144,2),
(1145,2),
(1146,2),
(1147,2),
(1148,2),
(1149,2),
(1150,2),
(1151,2),
(1152,2),
(1153,2),
(1154,2),
(1155,2),
(1156,2),
(1157,2),
(1158,2),
(1159,2),
(1160,2),
(1161,2),
(1162,2),
(1163,2),
(1164,2),
(1165,2),
(1166,2),
(1167,2),
(1168,2),
(1169,2),
(1170,2),
(1171,2),
(1172,2),
(1173,2),
(1174,2),
(1175,2),
(1176,2),
(1177,2),
(1178,2),
(1179,2),
(1180,2),
(1181,2),
(1182,2),
(1183,2),
(1184,2),
(1185,2),
(1186,2),
(1187,2),
(1188,2),
(1189,2),
(1190,2),
(1191,2),
(1192,2),
(1193,2),
(1194,2),
(3,3),
(269,3),
(291,3),
(298,3),
(309,3),
(319,3),
(329,3),
(339,3),
(692,3),
(703,3),
(188,4),
(189,4),
(190,4),
(191,4),
(198,4),
(199,4),
(200,4),
(201,4),
(204,4),
(205,4),
(206,4),
(207,4),
(215,4),
(216,4),
(225,4),
(226,4),
(236,4),
(237,4),
(238,4),
(239,4),
(242,4),
(243,4),
(246,4),
(247,4),
(248,4),
(249,4),
(250,4),
(257,4),
(266,4),
(267,4),
(276,4),
(277,4),
(283,4),
(284,4),
(289,4),
(290,4),
(295,4),
(296,4),
(297,4),
(303,4),
(307,4),
(308,4),
(313,4),
(317,4),
(327,4),
(338,4),
(347,4),
(357,4),
(359,4),
(370,4),
(380,4),
(445,4),
(446,4),
(456,4),
(457,4),
(462,4),
(463,4),
(469,4),
(470,4),
(476,4),
(477,4),
(478,4),
(479,4),
(643,4),
(648,4),
(650,4),
(652,4),
(673,4),
(675,4),
(680,4),
(682,4),
(690,4),
(692,4),
(699,4),
(701,4),
(708,4),
(715,4),
(719,4),
(725,4),
(735,4),
(745,4),
(748,4),
(758,4),
(763,4),
(769,4),
(782,4),
(787,4),
(789,4),
(794,4),
(796,4),
(948,4),
(949,4),
(954,4),
(955,4),
(965,4),
(966,4),
(976,4),
(977,4),
(982,4),
(983,4),
(988,4),
(994,4),
(996,4),
(1000,4),
(1002,4),
(1006,4),
(1007,4),
(1008,4),
(1009,4),
(1012,4),
(1013,4),
(1025,4),
(1026,4),
(1027,4),
(1164,4),
(1165,4),
(1166,4),
(1174,4),
(1175,4),
(1185,4),
(1186,4),
(1187,4),
(266,5),
(278,5),
(283,5),
(286,5),
(291,5),
(296,5),
(307,5),
(310,5),
(319,5),
(320,5),
(327,5),
(330,5),
(339,5),
(377,5),
(387,5),
(389,5),
(391,5),
(397,5),
(403,5),
(405,5),
(406,5),
(413,5),
(414,5),
(643,5),
(648,5),
(655,5),
(667,5),
(691,5),
(693,5),
(697,5),
(704,5),
(725,5),
(732,5),
(739,5),
(746,5),
(763,5),
(769,5),
(782,5),
(783,5),
(874,5),
(875,5),
(876,5),
(881,5),
(883,5),
(909,5),
(911,5),
(916,5),
(918,5),
(1164,5),
(1174,5),
(266,6),
(267,6),
(268,6),
(269,6),
(273,6),
(276,6),
(277,6),
(278,6),
(279,6),
(289,6),
(295,6),
(296,6),
(298,6),
(302,6),
(306,6),
(317,6),
(319,6),
(323,6),
(325,6),
(327,6),
(328,6),
(329,6),
(330,6),
(377,6),
(379,6),
(388,6),
(389,6),
(390,6),
(397,6),
(398,6),
(403,6),
(404,6),
(405,6),
(406,6),
(413,6),
(414,6),
(415,6),
(416,6),
(420,6),
(645,6),
(648,6),
(655,6),
(657,6),
(667,6),
(669,6),
(673,6),
(675,6),
(680,6),
(682,6),
(690,6),
(692,6),
(693,6),
(697,6),
(698,6),
(699,6),
(708,6),
(710,6),
(719,6),
(721,6),
(725,6),
(727,6),
(732,6),
(734,6),
(739,6),
(741,6),
(746,6),
(748,6),
(756,6),
(758,6),
(763,6),
(765,6),
(769,6),
(771,6),
(774,6),
(780,6),
(782,6),
(784,6),
(787,6),
(788,6),
(789,6),
(794,6),
(796,6),
(798,6),
(800,6),
(802,6),
(909,6),
(910,6),
(911,6),
(916,6),
(918,6),
(926,6),
(927,6),
(928,6),
(933,6),
(1185,6),
(1186,6),
(1187,6),
(1188,6),
(1,7),
(2,7),
(3,7),
(4,7),
(12,7),
(13,7),
(14,7),
(22,7),
(23,7),
(24,7),
(32,7),
(33,7),
(42,7),
(52,7),
(53,7),
(54,7),
(55,7),
(62,7),
(63,7),
(64,7),
(65,7),
(72,7),
(73,7),
(74,7),
(75,7),
(85,7),
(86,7),
(87,7),
(88,7),
(95,7),
(97,7),
(102,7),
(103,7),
(108,7),
(109,7),
(110,7),
(111,7),
(188,7),
(189,7),
(198,7),
(199,7),
(204,7),
(205,7),
(215,7),
(216,7),
(217,7),
(218,7),
(225,7),
(226,7),
(227,7),
(228,7),
(236,7),
(237,7),
(247,7),
(248,7),
(249,7),
(250,7),
(266,7),
(268,7),
(269,7),
(272,7),
(276,7),
(279,7),
(282,7),
(283,7),
(289,7),
(290,7),
(291,7),
(292,7),
(296,7),
(297,7),
(298,7),
(299,7),
(307,7),
(308,7),
(309,7),
(310,7),
(317,7),
(318,7),
(319,7),
(320,7),
(327,7),
(328,7),
(329,7),
(330,7),
(337,7),
(338,7),
(339,7),
(340,7),
(347,7),
(348,7),
(349,7),
(350,7),
(357,7),
(358,7),
(359,7),
(360,7),
(367,7),
(368,7),
(369,7),
(370,7),
(377,7),
(378,7),
(379,7),
(380,7),
(387,7),
(388,7),
(389,7),
(390,7),
(397,7),
(398,7),
(403,7),
(404,7),
(413,7),
(414,7),
(415,7),
(416,7),
(417,7),
(445,7),
(446,7),
(456,7),
(457,7),
(462,7),
(463,7),
(476,7),
(477,7),
(486,7),
(816,7),
(817,7),
(818,7),
(826,7),
(827,7),
(836,7),
(837,7),
(847,7),
(848,7),
(857,7),
(858,7),
(868,7),
(869,7),
(874,7),
(875,7),
(881,7),
(882,7),
(883,7),
(884,7),
(891,7),
(892,7),
(898,7),
(899,7),
(900,7),
(901,7),
(904,7),
(905,7),
(908,7),
(909,7),
(910,7),
(911,7),
(916,7),
(926,7),
(927,7),
(928,7),
(929,7),
(933,7),
(934,7),
(935,7),
(939,7),
(940,7),
(941,7),
(942,7),
(948,7),
(949,7),
(950,7),
(951,7),
(954,7),
(955,7),
(956,7),
(957,7),
(964,7),
(965,7),
(966,7),
(967,7),
(975,7),
(976,7),
(977,7),
(978,7),
(979,7),
(982,7),
(983,7),
(984,7),
(985,7),
(988,7),
(989,7),
(990,7),
(994,7),
(995,7),
(996,7),
(997,7),
(1000,7),
(1001,7),
(1002,7),
(1003,7),
(1006,7),
(1007,7),
(1008,7),
(1009,7),
(1012,7),
(1013,7),
(1014,7),
(1015,7),
(1016,7),
(1017,7),
(1025,7),
(1026,7),
(1027,7),
(1078,7),
(1079,7),
(1080,7),
(1081,7),
(1128,7),
(1129,7),
(1164,7),
(1165,7),
(1166,7),
(1174,7),
(1175,7),
(1176,7),
(1177,7),
(1185,7),
(1186,7),
(1187,7),
(188,8),
(198,8),
(199,8),
(204,8),
(225,8),
(236,8),
(237,8),
(247,8),
(248,8),
(249,8),
(250,8),
(257,8),
(266,8),
(276,8),
(283,8),
(289,8),
(290,8),
(307,8),
(317,8),
(327,8),
(328,8),
(337,8),
(338,8),
(348,8),
(948,8),
(949,8),
(954,8),
(955,8),
(965,8),
(966,8),
(976,8),
(977,8),
(982,8),
(983,8),
(988,8),
(989,8),
(994,8),
(995,8),
(996,8),
(1000,8),
(1006,8),
(1007,8),
(1008,8),
(1012,8),
(1013,8),
(1025,8),
(1026,8),
(1195,8),
(1196,8),
(1197,8);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,1,'Admin','web','2026-04-23 20:44:21','2026-04-23 20:44:21'),
(2,0,'Assistant Admin','web','2026-04-24 05:45:14','2026-04-24 05:45:14'),
(3,0,'Marketing and sales ','web','2026-04-24 12:18:11','2026-04-24 12:18:11'),
(4,0,'Head of products ','web','2026-04-24 12:19:29','2026-04-24 12:19:29'),
(5,0,'Business and AI ','web','2026-04-24 12:33:13','2026-04-24 12:33:13'),
(6,0,'Legal Department ','web','2026-04-24 12:33:57','2026-04-24 12:33:57'),
(7,0,'Human resources ','web','2026-04-24 13:10:50','2026-04-24 13:10:50'),
(8,0,'Employee','web','2026-04-27 05:33:32','2026-04-27 05:33:32');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES
('e2nM7uEwdTQAm234iU9MeLnbH9YHNMjKuRE2lmEL',NULL,'::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGd3SXhaTUl5SXg1ZjM2SjRuMU80ckNLb1pEOFpCQURGeXNoMDRvUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly9sb2NhbGhvc3QvS3dpa3Rhc2tsb2dzL3B1YmxpYy9hZG1pbi9sb2dpbiI7fX0=',1778196065),
('kqrfwch4H7NWC4NnXUbaeXGPh4t3snaJRqWhFgPj',14,'::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiaDZtaUZXcmFsWTI1WEp1d0pDU3ZxNGpISUJpZGtLQU8yVTZndGJZViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly9sb2NhbGhvc3QvS3dpa3Rhc2tsb2dzL3B1YmxpYy9hZG1pbi9lbXBsb3llZXMvZW1wbG95ZWVzLzUwIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTQ7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRXM0hlN3dhYUI1dXNYZm5BWmM0SHhlVkRmcE92cS9lR051aC9hd3ZTbmZOVG9tRjlmcmJpSyI7czo2OiJ0YWJsZXMiO2E6Mjp7czozNzoiMzE2NTMyMzFjMWZkZjFjYzZmMGNhNTE2OWM3NDAyMzdfc29ydCI7TjtzOjQwOiJmODZjMjc4OTdlY2JmMmMyMGRkMzExNjczODk4YjM2Nl9jb2x1bW5zIjthOjY6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoic2tpbGxUeXBlLm5hbWUiO3M6NToibGFiZWwiO3M6MTA6IlNraWxsIFR5cGUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJza2lsbC5uYW1lIjtzOjU6ImxhYmVsIjtzOjU6IlNraWxsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNToic2tpbGxMZXZlbC5uYW1lIjtzOjU6ImxhYmVsIjtzOjExOiJTa2lsbCBMZXZlbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTY6InNraWxsTGV2ZWwubGV2ZWwiO3M6NToibGFiZWwiO3M6MTM6IkxldmVsIFBlcmNlbnQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo0O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEyOiJjcmVhdG9yLm5hbWUiO3M6NToibGFiZWwiO3M6MTA6IkNyZWF0ZWQgQnkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo1O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIEF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fX19',1778225870);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_group_name_unique` (`group`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES
(1,'general','enable_user_invitation',0,'true','2026-04-23 20:43:42','2026-04-24 13:23:01'),
(2,'general','enable_reset_password',0,'true','2026-04-23 20:43:42','2026-04-24 13:23:01'),
(3,'general','default_role_id',0,'7','2026-04-23 20:43:42','2026-04-24 13:23:01'),
(4,'general','default_company_id',0,'1','2026-04-23 20:43:42','2026-04-24 13:23:01'),
(5,'currency','default_currency_id',0,'1','2026-04-23 20:44:12','2026-04-23 20:45:03'),
(6,'task','enable_recurring_tasks',0,'false','2026-04-24 05:14:53','2026-04-27 08:31:52'),
(7,'task','enable_task_dependencies',0,'false','2026-04-24 05:14:53','2026-04-27 08:31:52'),
(8,'task','enable_project_stages',0,'true','2026-04-24 05:14:53','2026-04-27 08:31:52'),
(9,'task','enable_milestones',0,'true','2026-04-24 05:14:53','2026-04-27 08:31:52'),
(10,'time','enable_timesheets',0,'false','2026-04-24 05:14:53','2026-04-24 05:14:53'),
(11,'website_contact','email',0,'\"support@example.com\"','2026-04-24 05:16:23','2026-04-24 05:16:23'),
(12,'website_contact','phone',0,'\"+1234567890\"','2026-04-24 05:16:23','2026-04-24 05:16:23'),
(13,'website_contact','twitter',0,'\"username\"','2026-04-24 05:16:23','2026-04-24 05:16:23'),
(14,'website_contact','facebook',0,'\"username\"','2026-04-24 05:16:23','2026-04-24 05:16:23'),
(15,'website_contact','instagram',0,'\"username\"','2026-04-24 05:16:23','2026-04-24 05:16:23'),
(16,'website_contact','linkedin',0,'\"username\"','2026-04-24 05:16:23','2026-04-24 05:16:23'),
(17,'website_contact','pinterest',0,'\"username\"','2026-04-24 05:16:23','2026-04-24 05:16:23'),
(18,'website_contact','tiktok',0,'\"username\"','2026-04-24 05:16:23','2026-04-24 05:16:23'),
(19,'website_contact','github',0,'\"username\"','2026-04-24 05:16:23','2026-04-24 05:16:23'),
(20,'website_contact','slack',0,'\"username\"','2026-04-24 05:16:23','2026-04-24 05:16:23'),
(21,'website_contact','whatsapp',0,'\"username\"','2026-04-24 05:16:24','2026-04-24 05:16:24'),
(22,'website_contact','youtube',0,'\"username\"','2026-04-24 05:16:24','2026-04-24 05:16:24'),
(23,'products_product','enable_variants',0,'true','2026-04-24 05:16:56','2026-04-27 09:20:58'),
(24,'products_product','enable_uom',0,'true','2026-04-24 05:16:56','2026-04-27 09:20:58'),
(25,'products_product','enable_packagings',0,'false','2026-04-24 05:16:56','2026-04-27 09:20:58'),
(26,'accounts_accounts','currency_exchange_journal_id',0,'4','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(27,'accounts_accounts','income_currency_exchange_account_id',0,'28','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(28,'accounts_accounts','expense_currency_exchange_account_id',0,'38','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(29,'accounts_accounts','account_discount_expense_allocation_id',0,'null','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(30,'accounts_accounts','account_discount_income_allocation_id',0,'null','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(31,'accounts_accounts','account_journal_suspense_account_id',0,'47','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(32,'accounts_accounts','account_journal_payment_debit_account_id',0,'49','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(33,'accounts_accounts','account_journal_payment_credit_account_id',0,'50','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(34,'accounts_accounts','income_account_id',0,'27','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(35,'accounts_accounts','expense_account_id',0,'33','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(36,'accounts_accounts','transfer_account_id',0,'48','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(37,'accounts_taxes','account_sale_tax_id',0,'1','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(38,'accounts_taxes','account_purchase_tax_id',0,'2','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(39,'accounts_taxes','account_price_include',0,'\"tax_excluded\"','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(40,'accounts_taxes','tax_calculation_rounding_method',0,'\"round_per_line\"','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(41,'accounts_taxes','account_fiscal_country_id',0,'233','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(42,'accounts_customer_invoice','group_cash_rounding',0,'false','2026-04-24 05:18:29','2026-04-24 05:18:29'),
(43,'accounts_customer_invoice','incoterm_id',0,'null','2026-04-24 05:18:29','2026-04-24 05:18:29');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `signatures`
--

DROP TABLE IF EXISTS `signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `signatures` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_user_id` bigint(20) unsigned NOT NULL,
  `signed_name` varchar(255) NOT NULL,
  `signature_image_path` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `signed_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `signatures_document_user_id_unique` (`document_user_id`),
  CONSTRAINT `signatures_document_user_id_foreign` FOREIGN KEY (`document_user_id`) REFERENCES `document_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signatures`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `signatures` WRITE;
/*!40000 ALTER TABLE `signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `signatures` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `states_country_id_foreign` (`country_id`),
  CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1766 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES
(1,13,'Australian Capital Territory','ACT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(2,13,'New South Wales','NSW','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(3,13,'Northern Territory','NT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(4,13,'Queensland','QLD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(5,13,'South Australia','SA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(6,13,'Tasmania','TAS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(7,13,'Victoria','VIC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(8,13,'Western Australia','WA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(9,233,'Alabama','AL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(10,233,'Alaska','AK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(11,233,'Arizona','AZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(12,233,'Arkansas','AR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(13,233,'California','CA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(14,233,'Colorado','CO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(15,233,'Connecticut','CT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(16,233,'Delaware','DE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(17,233,'District of Columbia','DC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(18,233,'Florida','FL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(19,233,'Georgia','GA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(20,233,'Hawaii','HI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(21,233,'Idaho','ID','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(22,233,'Illinois','IL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(23,233,'Indiana','IN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(24,233,'Iowa','IA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(25,233,'Kansas','KS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(26,233,'Kentucky','KY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(27,233,'Louisiana','LA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(28,233,'Maine','ME','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(29,233,'Montana','MT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(30,233,'Nebraska','NE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(31,233,'Nevada','NV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(32,233,'New Hampshire','NH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(33,233,'New Jersey','NJ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(34,233,'New Mexico','NM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(35,233,'New York','NY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(36,233,'North Carolina','NC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(37,233,'North Dakota','ND','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(38,233,'Ohio','OH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(39,233,'Oklahoma','OK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(40,233,'Oregon','OR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(41,233,'Maryland','MD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(42,233,'Massachusetts','MA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(43,233,'Michigan','MI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(44,233,'Minnesota','MN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(45,233,'Mississippi','MS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(46,233,'Missouri','MO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(47,233,'Pennsylvania','PA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(48,233,'Rhode Island','RI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(49,233,'South Carolina','SC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(50,233,'South Dakota','SD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(51,233,'Tennessee','TN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(52,233,'Texas','TX','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(53,233,'Utah','UT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(54,233,'Vermont','VT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(55,233,'Virginia','VA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(56,233,'Washington','WA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(57,233,'West Virginia','WV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(58,233,'Wisconsin','WI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(59,233,'Wyoming','WY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(60,233,'American Samoa','AS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(61,233,'Federated States of Micronesia','FM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(62,233,'Guam','GU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(63,233,'Marshall Islands','MH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(64,233,'Northern Mariana Islands','MP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(65,233,'Palau','PW','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(66,233,'Puerto Rico','PR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(67,233,'Virgin Islands','VI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(68,233,'Armed Forces Americas','AA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(69,233,'Armed Forces Europe','AE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(70,233,'Armed Forces Pacific','AP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(71,31,'Acre','AC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(72,31,'Alagoas','AL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(73,31,'Amapá','AP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(74,31,'Amazonas','AM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(75,31,'Bahia','BA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(76,31,'Ceará','CE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(77,31,'Distrito Federal','DF','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(78,31,'Espírito Santo','ES','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(79,31,'Goiás','GO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(80,31,'Maranhão','MA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(81,31,'Mato Grosso','MT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(82,31,'Mato Grosso do Sul','MS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(83,31,'Minas Gerais','MG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(84,31,'Pará','PA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(85,31,'Paraíba','PB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(86,31,'Paraná','PR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(87,31,'Pernambuco','PE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(88,31,'Piauí','PI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(89,31,'Rio de Janeiro','RJ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(90,31,'Rio Grande do Norte','RN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(91,31,'Rio Grande do Sul','RS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(92,31,'Rondônia','RO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(93,31,'Roraima','RR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(94,31,'Santa Catarina','SC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(95,31,'São Paulo','SP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(96,31,'Sergipe','SE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(97,31,'Tocantins','TO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(98,190,'Republic of Adygeya','AD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(99,190,'Altai Republic','AL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(100,190,'Altai Krai','ALT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(101,190,'Amur Oblast','AMU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(102,190,'Arkhangelsk Oblast','ARK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(103,190,'Astrakhan Oblast','AST','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(104,190,'Republic of Bashkortostan','BA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(105,190,'Belgorod Oblast','BEL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(106,190,'Bryansk Oblast','BRY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(107,190,'Republic of Buryatia','BU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(108,190,'Chechen Republic','CE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(109,190,'Chelyabinsk Oblast','CHE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(110,190,'Chukotka Autonomous Okrug','CHU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(111,190,'Chuvash Republic','CU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(112,190,'Republic of Dagestan','DA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(113,190,'Republic of Ingushetia','IN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(114,190,'Irkutsk Oblast','IRK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(115,190,'Ivanovo Oblast','IVA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(116,190,'Kamchatka Krai','KAM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(117,190,'Kabardino-Balkarian Republic','KB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(118,190,'Kaliningrad Oblast','KGD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(119,190,'Republic of Kalmykia','KL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(120,190,'Kaluga Oblast','KLU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(121,190,'Karachay–Cherkess Republic','KC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(122,190,'Republic of Karelia','KR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(123,190,'Kemerovo Oblast','KEM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(124,190,'Khabarovsk Krai','KHA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(125,190,'Republic of Khakassia','KK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(126,190,'Khanty-Mansi Autonomous Okrug','KHM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(127,190,'Kirov Oblast','KIR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(128,190,'Komi Republic','KO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(129,190,'Kostroma Oblast','KOS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(130,190,'Krasnodar Krai','KDA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(131,190,'Krasnoyarsk Krai','KYA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(132,190,'Kurgan Oblast','KGN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(133,190,'Kursk Oblast','KRS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(134,190,'Leningrad Oblast','LEN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(135,190,'Lipetsk Oblast','LIP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(136,190,'Magadan Oblast','MAG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(137,190,'Mari El Republic','ME','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(138,190,'Republic of Mordovia','MO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(139,190,'Moscow Oblast','MOS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(140,190,'Moscow','MOW','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(141,190,'Murmansk Oblast','MUR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(142,190,'Nizhny Novgorod Oblast','NIZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(143,190,'Novgorod Oblast','NGR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(144,190,'Novosibirsk Oblast','NVS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(145,190,'Omsk Oblast','OMS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(146,190,'Orenburg Oblast','ORE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(147,190,'Oryol Oblast','ORL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(148,190,'Penza Oblast','PNZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(149,190,'Perm Krai','PER','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(150,190,'Primorsky Krai','PRI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(151,190,'Pskov Oblast','PSK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(152,190,'Rostov Oblast','ROS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(153,190,'Ryazan Oblast','RYA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(154,190,'Sakha Republic (Yakutia)','SA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(155,190,'Sakhalin Oblast','SAK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(156,190,'Samara Oblast','SAM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(157,190,'Saint Petersburg','SPE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(158,190,'Saratov Oblast','SAR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(159,190,'Republic of North Ossetia–Alania','SE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(160,190,'Smolensk Oblast','SMO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(161,190,'Stavropol Krai','STA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(162,190,'Sverdlovsk Oblast','SVE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(163,190,'Tambov Oblast','TAM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(164,190,'Republic of Tatarstan','TA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(165,190,'Tomsk Oblast','TOM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(166,190,'Tula Oblast','TUL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(167,190,'Tver Oblast','TVE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(168,190,'Tyumen Oblast','TYU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(169,190,'Tyva Republic','TY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(170,190,'Udmurtia','UD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(171,190,'Ulyanovsk Oblast','ULY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(172,190,'Vladimir Oblast','VLA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(173,190,'Volgograd Oblast','VGG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(174,190,'Vologda Oblast','VLG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(175,190,'Voronezh Oblast','VOR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(176,190,'Yamalo-Nenets Autonomous Okrug','YAN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(177,190,'Yaroslavl Oblast','YAR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(178,190,'Jewish Autonomous Oblast','YEV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(179,90,'Alta Verapaz','AVE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(180,90,'Baja Verapaz','BVE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(181,90,'Chimaltenango','CMT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(182,90,'Chiquimula','CQM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(183,90,'El Progreso','EPR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(184,90,'Escuintla','ESC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(185,90,'Guatemala','GUA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(186,90,'Huehuetenango','HUE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(187,90,'Izabal','IZA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(188,90,'Jalapa','JAL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(189,90,'Jutiapa','JUT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(190,90,'Petén','PET','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(191,90,'Quetzaltenango','QUE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(192,90,'Quiché','QUI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(193,90,'Retalhuleu','RET','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(194,90,'Sacatepéquez','SAC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(195,90,'San Marcos','SMA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(196,90,'Santa Rosa','SRO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(197,90,'Sololá','SOL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(198,90,'Suchitepéquez','SUC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(199,90,'Totonicapán','TOT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(200,90,'Zacapa','ZAC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(201,113,'Aichi','23','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(202,113,'Akita','5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(203,113,'Aomori','2','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(204,113,'Chiba','12','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(205,113,'Ehime','38','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(206,113,'Fukui','18','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(207,113,'Fukuoka','40','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(208,113,'Fukushima','7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(209,113,'Gifu','21','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(210,113,'Gunma','10','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(211,113,'Hiroshima','34','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(212,113,'Hokkaido','1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(213,113,'Hyogo','28','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(214,113,'Ibaraki','8','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(215,113,'Ishikawa','17','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(216,113,'Iwate','3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(217,113,'Kagawa','37','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(218,113,'Kagoshima','46','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(219,113,'Kanagawa','14','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(220,113,'Kochi','39','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(221,113,'Kumamoto','43','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(222,113,'Kyoto','26','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(223,113,'Mie','24','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(224,113,'Miyagi','4','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(225,113,'Miyazaki','45','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(226,113,'Nagano','20','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(227,113,'Nagasaki','42','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(228,113,'Nara','29','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(229,113,'Niigata','15','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(230,113,'Oita','44','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(231,113,'Okayama','33','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(232,113,'Okinawa','47','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(233,113,'Osaka','27','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(234,113,'Saga','41','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(235,113,'Saitama','11','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(236,113,'Shiga','25','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(237,113,'Shimane','32','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(238,113,'Shizuoka','22','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(239,113,'Tochigi','9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(240,113,'Tokushima','36','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(241,113,'Tottori','31','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(242,113,'Toyama','16','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(243,113,'Tokyo','13','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(244,113,'Wakayama','30','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(245,113,'Yamagata','6','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(246,113,'Yamaguchi','35','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(247,113,'Yamanashi','19','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(248,183,'Aveiro','1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(249,183,'Beja','2','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(250,183,'Braga','3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(251,183,'Bragança','4','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(252,183,'Castelo Branco','5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(253,183,'Coimbra','6','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(254,183,'Évora','7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(255,183,'Faro','8','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(256,183,'Guarda','9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(257,183,'Leiria','10','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(258,183,'Lisboa','11','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(259,183,'Portalegre','12','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(260,183,'Porto','13','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(261,183,'Santarém','14','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(262,183,'Setúbal','15','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(263,183,'Viana do Castelo','16','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(264,183,'Vila Real','17','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(265,183,'Viseu','18','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(266,183,'Açores','20','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(267,183,'Madeira','30','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(268,65,'Dakahlia','DK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(269,65,'Red Sea','BA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(270,65,'Beheira','BH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(271,65,'Faiyum','FYM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(272,65,'Gharbia','GH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(273,65,'Alexandria','ALX','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(274,65,'Ismailia','IS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(275,65,'Giza','GZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(276,65,'Monufia','MNF','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(277,65,'Minya','MN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(278,65,'Cairo','C','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(279,65,'Qalyubia','KB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(280,65,'Luxor','LX','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(281,65,'New Valley','WAD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(282,65,'Al Sharqia','SHR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(283,65,'6th of October','SU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(284,65,'Suez','SUZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(285,65,'Aswan','ASN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(286,65,'Asyut','AST','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(287,65,'Beni Suef','BNS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(288,65,'Port Said','PTS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(289,65,'Damietta','DT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(290,65,'Helwan','HU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(291,65,'South Sinai','JS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(292,65,'Kafr el-Sheikh','KFS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(293,65,'Matrouh','MT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(294,65,'Qena','KN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(295,65,'North Sinai','SIN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(296,65,'Sohag','SHG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(297,247,'Eastern Cape','EC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(298,247,'Free State','FS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(299,247,'Gauteng','GP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(300,247,'KwaZulu-Natal','KZN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(301,247,'Limpopo','LP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(302,247,'Mpumalanga','MP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(303,247,'Northern Cape','NC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(304,247,'North West','NW','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(305,247,'Western Cape','WC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(306,109,'Agrigento','AG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(307,109,'Alessandria','AL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(308,109,'Ancona','AN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(309,109,'Aosta','AO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(310,109,'Arezzo','AR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(311,109,'Ascoli Piceno','AP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(312,109,'Asti','AT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(313,109,'Avellino','AV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(314,109,'Bari','BA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(315,109,'Barletta-Andria-Trani','BT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(316,109,'Belluno','BL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(317,109,'Benevento','BN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(318,109,'Bergamo','BG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(319,109,'Biella','BI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(320,109,'Bologna','BO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(321,109,'Bolzano','BZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(322,109,'Brescia','BS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(323,109,'Brindisi','BR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(324,109,'Cagliari','CA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(325,109,'Caltanissetta','CL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(326,109,'Campobasso','CB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(327,109,'Carbonia-Iglesias','CI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(328,109,'Caserta','CE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(329,109,'Catania','CT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(330,109,'Catanzaro','CZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(331,109,'Chieti','CH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(332,109,'Como','CO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(333,109,'Cosenza','CS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(334,109,'Cremona','CR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(335,109,'Crotone','KR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(336,109,'Cuneo','CN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(337,109,'Enna','EN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(338,109,'Fermo','FM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(339,109,'Ferrara','FE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(340,109,'Firenze','FI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(341,109,'Foggia','FG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(342,109,'Forlì-Cesena','FC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(343,109,'Frosinone','FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(344,109,'Genova','GE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(345,109,'Gorizia','GO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(346,109,'Grosseto','GR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(347,109,'Imperia','IM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(348,109,'Isernia','IS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(349,109,'La Spezia','SP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(350,109,'L\'Aquila','AQ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(351,109,'Latina','LT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(352,109,'Lecce','LE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(353,109,'Lecco','LC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(354,109,'Livorno','LI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(355,109,'Lodi','LO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(356,109,'Lucca','LU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(357,109,'Macerata','MC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(358,109,'Mantova','MN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(359,109,'Massa-Carrara','MS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(360,109,'Matera','MT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(361,109,'Medio Campidano','VS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(362,109,'Messina','ME','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(363,109,'Milano','MI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(364,109,'Modena','MO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(365,109,'Monza e Brianza','MB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(366,109,'Napoli','NA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(367,109,'Novara','NO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(368,109,'Nuoro','NU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(369,109,'Ogliastra','OG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(370,109,'Olbia-Tempio','OT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(371,109,'Oristano','OR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(372,109,'Padova','PD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(373,109,'Palermo','PA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(374,109,'Parma','PR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(375,109,'Pavia','PV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(376,109,'Perugia','PG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(377,109,'Pesaro e Urbino','PU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(378,109,'Pescara','PE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(379,109,'Piacenza','PC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(380,109,'Pisa','PI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(381,109,'Pistoia','PT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(382,109,'Pordenone','PN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(383,109,'Potenza','PZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(384,109,'Prato','PO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(385,109,'Ragusa','RG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(386,109,'Ravenna','RA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(387,109,'Reggio Calabria','RC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(388,109,'Reggio Emilia','RE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(389,109,'Rieti','RI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(390,109,'Rimini','RN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(391,109,'Roma','RM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(392,109,'Rovigo','RO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(393,109,'Salerno','SA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(394,109,'Sassari','SS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(395,109,'Savona','SV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(396,109,'Siena','SI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(397,109,'Siracusa','SR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(398,109,'Sondrio','SO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(399,109,'Sud Sardegna','SU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(400,109,'Taranto','TA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(401,109,'Teramo','TE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(402,109,'Terni','TR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(403,109,'Torino','TO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(404,109,'Trapani','TP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(405,109,'Trento','TN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(406,109,'Treviso','TV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(407,109,'Trieste','TS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(408,109,'Udine','UD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(409,109,'Varese','VA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(410,109,'Venezia','VE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(411,109,'Verbano-Cusio-Ossola','VB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(412,109,'Vercelli','VC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(413,109,'Verona','VR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(414,109,'Vibo Valentia','VV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(415,109,'Vicenza','VI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(416,109,'Viterbo','VT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(417,68,'A Coruña (La Coruña)','C','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(418,68,'Araba/Álava','VI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(419,68,'Albacete','AB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(420,68,'Alacant (Alicante)','A','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(421,68,'Almería','AL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(422,68,'Asturias','O','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(423,68,'Ávila','AV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(424,68,'Badajoz','BA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(425,68,'Illes Balears (Islas Baleares)','PM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(426,68,'Barcelona','B','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(427,68,'Burgos','BU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(428,68,'Cáceres','CC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(429,68,'Cádiz','CA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(430,68,'Cantabria','S','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(431,68,'Castelló (Castellón)','CS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(432,68,'Ceuta','CE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(433,68,'Ciudad Real','CR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(434,68,'Córdoba','CO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(435,68,'Cuenca','CU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(436,68,'Girona (Gerona)','GI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(437,68,'Granada','GR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(438,68,'Guadalajara','GU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(439,68,'Gipuzkoa (Guipúzcoa)','SS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(440,68,'Huelva','H','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(441,68,'Huesca','HU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(442,68,'Jaén','J','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(443,68,'La Rioja','LO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(444,68,'Las Palmas','GC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(445,68,'León','LE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(446,68,'Lleida (Lérida)','L','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(447,68,'Lugo','LU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(448,68,'Madrid','M','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(449,68,'Málaga','MA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(450,68,'Melilla','ME','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(451,68,'Murcia','MU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(452,68,'Navarra (Nafarroa)','NA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(453,68,'Ourense (Orense)','OR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(454,68,'Palencia','P','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(455,68,'Pontevedra','PO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(456,68,'Salamanca','SA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(457,68,'Santa Cruz de Tenerife','TF','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(458,68,'Segovia','SG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(459,68,'Sevilla','SE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(460,68,'Soria','SO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(461,68,'Tarragona','T','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(462,68,'Teruel','TE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(463,68,'Toledo','TO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(464,68,'València (Valencia)','V','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(465,68,'Valladolid','VA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(466,68,'Bizkaia (Vizcaya)','BI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(467,68,'Zamora','ZA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(468,68,'Zaragoza','Z','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(469,157,'Johor','MY-01','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(470,157,'Kedah','MY-02','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(471,157,'Kelantan','MY-03','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(472,157,'Kuala Lumpur','MY-14','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(473,157,'Labuan','MY-15','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(474,157,'Melaka','MY-04','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(475,157,'Negeri Sembilan','MY-05','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(476,157,'Pahang','MY-06','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(477,157,'Perak','MY-08','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(478,157,'Perlis','MY-09','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(479,157,'Pulau Pinang','MY-07','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(480,157,'Putrajaya','MY-16','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(481,157,'Sabah','MY-12','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(482,157,'Sarawak','MY-13','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(483,157,'Selangor','MY-10','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(484,157,'Terengganu','MY-11','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(485,156,'Aguascalientes','AGU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(486,156,'Baja California','BCN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(487,156,'Baja California Sur','BCS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(488,156,'Chihuahua','CHH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(489,156,'Colima','COL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(490,156,'Campeche','CAM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(491,156,'Coahuila','COA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(492,156,'Chiapas','CHP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(493,156,'Ciudad de México','CMX','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(494,156,'Durango','DUR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(495,156,'Guerrero','GRO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(496,156,'Guanajuato','GUA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(497,156,'Hidalgo','HID','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(498,156,'Jalisco','JAL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(499,156,'Michoacán','MIC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(500,156,'Morelos','MOR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(501,156,'México','MEX','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(502,156,'Nayarit','NAY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(503,156,'Nuevo León','NLE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(504,156,'Oaxaca','OAX','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(505,156,'Puebla','PUE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(506,156,'Quintana Roo','ROO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(507,156,'Querétaro','QUE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(508,156,'Sinaloa','SIN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(509,156,'San Luis Potosí','SLP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(510,156,'Sonora','SON','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(511,156,'Tabasco','TAB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(512,156,'Tlaxcala','TLA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(513,156,'Tamaulipas','TAM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(514,156,'Veracruz','VER','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(515,156,'Yucatán','YUC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(516,156,'Zacatecas','ZAC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(517,170,'Auckland','AUK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(518,170,'Bay of Plenty','BOP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(519,170,'Canterbury','CAN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(520,170,'Gisborne','GIS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(521,170,'Hawke\'s Bay','HKB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(522,170,'Manawatu-Wanganui','MWT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(523,170,'Marlborough','MBH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(524,170,'Nelson','NSN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(525,170,'Northland','NTL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(526,170,'Otago','OTA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(527,170,'Southland','STL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(528,170,'Taranaki','TKI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(529,170,'Tasman','TAS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(530,170,'Waikato','WKO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(531,170,'Wellington','WGN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(532,170,'West Coast','WTC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(533,38,'Alberta','AB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(534,38,'British Columbia','BC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(535,38,'Manitoba','MB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(536,38,'New Brunswick','NB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(537,38,'Newfoundland and Labrador','NL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(538,38,'Northwest Territories','NT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(539,38,'Nova Scotia','NS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(540,38,'Nunavut','NU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(541,38,'Ontario','ON','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(542,38,'Prince Edward Island','PE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(543,38,'Quebec','QC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(544,38,'Saskatchewan','SK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(545,38,'Yukon','YT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(546,2,'Abu Dhabi','AZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(547,2,'Ajman','AJ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(548,2,'Dubai','DU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(549,2,'Fujairah','FU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(550,2,'Ras al-Khaimah','RK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(551,2,'Sharjah','SH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(552,2,'Umm al-Quwain','UQ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(553,10,'Ciudad Autónoma de Buenos Aires','C','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(554,10,'Buenos Aires','B','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(555,10,'Catamarca','K','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(556,10,'Chaco','H','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(557,10,'Chubut','U','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(558,10,'Córdoba','X','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(559,10,'Corrientes','W','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(560,10,'Entre Ríos','E','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(561,10,'Formosa','P','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(562,10,'Jujuy','Y','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(563,10,'La Pampa','L','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(564,10,'La Rioja','F','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(565,10,'Mendoza','M','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(566,10,'Misiones','N','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(567,10,'Neuquén','Q','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(568,10,'Río Negro','R','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(569,10,'Salta','A','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(570,10,'San Juan','J','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(571,10,'San Luis','D','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(572,10,'Santa Cruz','Z','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(573,10,'Santa Fe','S','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(574,10,'Santiago Del Estero','G','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(575,10,'Tierra del Fuego','V','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(576,10,'Tucumán','T','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(577,104,'Andaman and Nicobar','AN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(578,104,'Andhra Pradesh','AP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(579,104,'Arunachal Pradesh','AR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(580,104,'Assam','AS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(581,104,'Bihar','BR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(582,104,'Chandigarh','CH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(583,104,'Chattisgarh','CG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(584,104,'Dadra and Nagar Haveli','DN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(585,104,'Daman and Diu','DD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(586,104,'Delhi','DL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(587,104,'Goa','GA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(588,104,'Gujarat','GJ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(589,104,'Haryana','HR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(590,104,'Himachal Pradesh','HP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(591,104,'Jammu and Kashmir','JK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(592,104,'Jharkhand','JH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(593,104,'Karnataka','KA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(594,104,'Kerala','KL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(595,104,'Lakshadweep','LD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(596,104,'Madhya Pradesh','MP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(597,104,'Maharashtra','MH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(598,104,'Manipur','MN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(599,104,'Meghalaya','ML','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(600,104,'Mizoram','MZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(601,104,'Nagaland','NL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(602,104,'Orissa','OR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(603,104,'Puducherry','PY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(604,104,'Punjab','PB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(605,104,'Rajasthan','RJ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(606,104,'Sikkim','SK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(607,104,'Tamil Nadu','TN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(608,104,'Telangana','TS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(609,104,'Tripura','TR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(610,104,'Uttar Pradesh','UP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(611,104,'Uttarakhand','UK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(612,104,'West Bengal','WB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(613,100,'Aceh','AC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(614,100,'Bali','BA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(615,100,'Bangka Belitung','BB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(616,100,'Banten','BT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(617,100,'Bengkulu','BE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(618,100,'Gorontalo','GO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(619,100,'Jakarta','JK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(620,100,'Jambi','JA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(621,100,'Jawa Barat','JB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(622,100,'Jawa Tengah','JT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(623,100,'Jawa Timur','JI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(624,100,'Kalimantan Barat','KB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(625,100,'Kalimantan Selatan','KS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(626,100,'Kalimantan Tengah','KT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(627,100,'Kalimantan Timur','KI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(628,100,'Kalimantan Utara','KU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(629,100,'Kepulauan Riau','KR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(630,100,'Lampung','LA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(631,100,'Maluku','MA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(632,100,'Maluku Utara','MU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(633,100,'Nusa Tenggara Barat','NB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(634,100,'Nusa Tenggara Timur','NT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(635,100,'Papua','PA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(636,100,'Papua Barat','PB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(637,100,'Papua Selatan','PS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(638,100,'Papua Tengah','PT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(639,100,'Papua Pegunungan','PP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(640,100,'Riau','RI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(641,100,'Sulawesi Barat','SR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(642,100,'Sulawesi Selatan','SN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(643,100,'Sulawesi Tengah','ST','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(644,100,'Sulawesi Tenggara','SG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(645,100,'Sulawesi Utara','SA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(646,100,'Sumatra Barat','SB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(647,100,'Sumatra Selatan','SS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(648,100,'Sumatra Utara','SU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(649,100,'Yogyakarta','YO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(650,49,'Antioquia','ANT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(651,49,'Atlántico','ATL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(652,49,'Bogotá','DC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(653,49,'Bolívar','BOL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(654,49,'Boyacá','BOY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(655,49,'Caldas','CAL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(656,49,'Caquetá','CAQ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(657,49,'Cauca','CAU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(658,49,'Cesar','CES','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(659,49,'Córdoba','COR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(660,49,'Cundinamarca','CUN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(661,49,'Chocó','CHO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(662,49,'Huila','HUI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(663,49,'La Guajira','LAG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(664,49,'Magdalena','MAG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(665,49,'Meta','MET','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(666,49,'Nariño','NAR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(667,49,'Norte de Santander','NSA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(668,49,'Quindío','QUI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(669,49,'Risaralda','RIS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(670,49,'Santander','SAN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(671,49,'Sucre','SUC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(672,49,'Tolima','TOL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(673,49,'Valle del Cauca','VAC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(674,49,'Arauca','ARA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(675,49,'Casanare','CAS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(676,49,'Putumayo','PUT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(677,49,'San Andrés y Providencia','SAP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(678,49,'Amazonas','AMA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(679,49,'Guainía','GUA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(680,49,'Guaviare','GUV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(681,49,'Vaupés','VAU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(682,49,'Vichada','VID','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(683,146,'Архангай','1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(684,146,'Баян-Өлгий','2','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(685,146,'Баянхонгор','3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(686,146,'Булган','4','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(687,146,'Говь-Алтай','5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(688,146,'Дорноговь','6','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(689,146,'Дорнод','7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(690,146,'Дундговь','8','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(691,146,'Завхан','9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(692,146,'Өвөрхангай','10','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(693,146,'Өмнөговь','11','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(694,146,'Сүхбаатар','12','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(695,146,'Сэлэнгэ','13','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(696,146,'Төв','14','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(697,146,'Увс','15','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(698,146,'Ховд','16','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(699,146,'Хөвсгөл','17','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(700,146,'Хэнтий','18','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(701,146,'Дархан-Уул','19','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(702,146,'Орхон','20','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(703,146,'УБ - Хан Уул','23','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(704,146,'УБ - Баянзүрх','24','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(705,146,'УБ - Сүхбаатар','25','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(706,146,'УБ - Баянгол','26','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(707,146,'УБ - Багануур','27','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(708,146,'УБ - Багахангай','28','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(709,146,'УБ - Налайх','29','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(710,146,'Говьсүмбэр','32','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(711,146,'УБ - Сонгино Хайрхан','34','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(712,146,'УБ - Чингэлтэй','35','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(713,231,'Aberdeenshire','A1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(714,231,'Angus','A5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(715,231,'Argyll','A7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(716,231,'Avon','A9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(717,231,'Ayrshire','B1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(718,231,'Banffshire','B3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(719,231,'Bedfordshire','B5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(720,231,'Berkshire','B7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(721,231,'Berwickshire','B9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(722,231,'Buckinghamshire','C1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(723,231,'Caithness','C3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(724,231,'Cambridgeshire','C5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(725,231,'Channel Islands','C6','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(726,231,'Cheshire','C7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(727,231,'Clackmannanshire','C9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(728,231,'Cleveland','D1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(729,231,'Clwyd','D3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(730,231,'County Antrim','D5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(731,231,'County Armagh','D7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(732,231,'County Down','D9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(733,231,'County Durham','E1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(734,231,'County Fermanagh','E3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(735,231,'County Londonderry','E5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(736,231,'County Tyrone','E7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(737,231,'Cornwall','E9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(738,231,'Cumbria','F1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(739,231,'Derbyshire','F3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(740,231,'Devon','F5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(741,231,'Dorset','F7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(742,231,'Dumfriesshire','F9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(743,231,'Dunbartonshire','G1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(744,231,'Dyfed','G3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(745,231,'East Lothian','G5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(746,231,'East Sussex','G7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(747,231,'Essex','G9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(748,231,'Fife','H1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(749,231,'Gloucestershire','H3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(750,231,'Gwent','H7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(751,231,'Gwynedd','H9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(752,231,'Hampshire','I1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(753,231,'Herefordshire','I3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(754,231,'Hertfordshire','I5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(755,231,'Inverness-Shire','I7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(756,231,'Isle of Arran','I9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(757,231,'Isle of Barra','J1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(758,231,'Isle of Benbecula','J3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(759,231,'Isle of Bute','J5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(760,231,'Isle of Canna','J7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(761,231,'Isle of Coll','J9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(762,231,'Isle of Colonsay','K1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(763,231,'Isle of Cumbrae','K3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(764,231,'Isle of Eigg','K5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(765,231,'Isle of Gigha','K7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(766,231,'Isle of Harris','K9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(767,231,'Isle of Iona','L1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(768,231,'Isle of Islay','L2','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(769,231,'Isle of Jura','L5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(770,231,'Isle of Lewis','L7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(771,231,'Isle of Man','L9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(772,231,'Isle of Mull','M1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(773,231,'Isle of North Uist','M3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(774,231,'Isle of Rhum','M7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(775,231,'Isle of Scalpay','M9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(776,231,'Shetland Islands','N1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(777,231,'Isle of Skye','N3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(778,231,'Isle of South Uist','N5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(779,231,'Isle of Tiree','N7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(780,231,'Isle of Wight','N9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(781,231,'Kent','O5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(782,231,'Kincardineshire','O7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(783,231,'Kinross-Shire','O9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(784,231,'Kirkcudbrightshire','P1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(785,231,'Lancashire','P5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(786,231,'Leicestershire','P7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(787,231,'Lincolnshire','P9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(788,231,'Merseyside','Q3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(789,231,'Mid Glamorgan','Q5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(790,231,'Middlesex','Q9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(791,231,'Morayshire','R1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(792,231,'Nairnshire','R3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(793,231,'North Humberside','R7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(794,231,'North Yorkshire','R9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(795,231,'Northamptonshire','S1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(796,231,'Northumberland','S3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(797,231,'Nottinghamshire','S5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(798,231,'Oxfordshire','S7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(799,231,'Peeblesshire','S9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(800,231,'Perthshire','T1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(801,231,'Powys','T3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(802,231,'Renfrewshire','T5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(803,231,'Ross-Shire','T7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(804,231,'Roxburghshire','T9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(805,231,'Selkirkshire','U3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(806,231,'Shropshire','U5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(807,231,'Somerset','U7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(808,231,'South Glamorgan','U9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(809,231,'South Humberside','V1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(810,231,'South Yorkshire','V3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(811,231,'Staffordshire','V5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(812,231,'Stirlingshire','V7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(813,231,'Suffolk','V9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(814,231,'Surrey','W1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(815,231,'Sutherland','W3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(816,231,'Tyne and Wear','W5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(817,231,'Warwickshire','W7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(818,231,'West Glamorgan','W9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(819,231,'West Lothian','X1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(820,231,'West Midlands','X3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(821,231,'West Sussex','X5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(822,231,'West Yorkshire','X7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(823,231,'Wigtownshire','X9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(824,231,'Wiltshire','Y1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(825,231,'Worcestershire','Y3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(826,231,'Orkney','M5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(827,231,'Isles of Scilly','O1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(828,231,'Lanarkshire','P3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(829,231,'London','Q1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(830,231,'Midlothian','Q7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(831,231,'Norfolk','R5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(832,188,'Alba','AB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(833,188,'Argeș','AG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(834,188,'Arad','AR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(835,188,'București','B','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(836,188,'Bacău','BC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(837,188,'Bihor','BH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(838,188,'Bistrița-Năsăud','BN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(839,188,'Brăila','BR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(840,188,'Botoșani','BT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(841,188,'Brașov','BV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(842,188,'Buzău','BZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(843,188,'Cluj','CJ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(844,188,'Călărași','CL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(845,188,'Caraș Severin','CS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(846,188,'Constanța','CT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(847,188,'Covasna','CV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(848,188,'Dâmbovița','DB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(849,188,'Dolj','DJ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(850,188,'Gorj','GJ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(851,188,'Galați','GL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(852,188,'Giurgiu','GR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(853,188,'Hunedoara','HD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(854,188,'Harghita','HR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(855,188,'Ilfov','IF','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(856,188,'Ialomița','IL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(857,188,'Iași','IS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(858,188,'Mehedinți','MH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(859,188,'Maramureș','MM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(860,188,'Mureș','MS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(861,188,'Neamț','NT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(862,188,'Olt','OT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(863,188,'Prahova','PH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(864,188,'Sibiu','SB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(865,188,'Sălaj','SJ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(866,188,'Satu Mare','SM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(867,188,'Suceava','SV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(868,188,'Tulcea','TL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(869,188,'Timiș','TM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(870,188,'Teleorman','TR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(871,188,'Vâlcea','VL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(872,188,'Vrancea','VN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(873,188,'Vaslui','VS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(874,48,'北京市','京','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(875,48,'上海市','沪','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(876,48,'浙江省','浙','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(877,48,'天津市','津','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(878,48,'安徽省','皖','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(879,48,'福建省','闽','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(880,48,'重庆市','渝','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(881,48,'江西省','赣','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(882,48,'山东省','鲁','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(883,48,'河南省','豫','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(884,48,'内蒙古自治区','蒙','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(885,48,'湖北省','鄂','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(886,48,'新疆维吾尔自治区','新','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(887,48,'湖南省','湘','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(888,48,'宁夏回族自治区','宁','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(889,48,'广东省','粤','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(890,48,'西藏自治区','藏','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(891,48,'海南省','琼','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(892,48,'广西壮族自治区','桂','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(893,48,'四川省','蜀','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(894,48,'河北省','冀','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(895,48,'贵州省','黔','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(896,48,'山西省','晋','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(897,48,'云南省','滇','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(898,48,'辽宁省','辽','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(899,48,'陕西省','陕','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(900,48,'吉林省','吉','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(901,48,'甘肃省','甘','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(902,48,'黑龙江省','黑','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(903,48,'青海省','青','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(904,48,'江苏省','苏','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(905,48,'台湾省','台','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(906,48,'香港特别行政区','港','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(907,48,'澳门特别行政区','澳','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(908,69,'Addis Ababa','AA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(909,69,'Afar','AF','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(910,69,'Amhara','AM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(911,69,'Benishangul-Gumuz','BN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(912,69,'Dire Dawa','DR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(913,69,'Gambella Peoples','GM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(914,69,'Harrari Peoples','HR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(915,69,'Oromia','OR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(916,69,'Somalia','SM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(917,69,'Southern Peoples, Nations, and Nationalities','SP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(918,69,'Tigray','TG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(919,101,'Carlow','CW','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(920,101,'Cavan','CN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(921,101,'Clare','CE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(922,101,'Cork','C','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(923,101,'Limerick','LK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(924,101,'Waterford','WD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(925,101,'Donegal','DL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(926,101,'Dublin','D','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(927,101,'Galway','G','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(928,101,'Kerry','KY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(929,101,'Kildare','KE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(930,101,'Kilkenny','KK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(931,101,'Laois','LS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(932,101,'Leitrim','LM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(933,101,'Longford','LD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(934,101,'Louth','LH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(935,101,'Mayo','MO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(936,101,'Meath','MH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(937,101,'Monaghan','MN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(938,101,'Offaly','OY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(939,101,'Roscommon','RN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(940,101,'Sligo','SO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(941,101,'Tipperary','TR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(942,101,'Westmeath','WH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(943,101,'Wexford','WX','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(944,101,'Wicklow','WW','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(945,101,'Antrim','AM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(946,101,'Armagh','AH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(947,101,'Down','DN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(948,101,'Fermanagh','FH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(949,101,'Londonderry','LY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(950,101,'Tyrone','TE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(951,165,'Drenthe','DR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(952,165,'Flevoland','FL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(953,165,'Friesland','FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(954,165,'Gelderland','GE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(955,165,'Groningen','GR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(956,165,'Limburg','LI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(957,165,'Noord-Brabant','NB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(958,165,'Noord-Holland','NH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(959,165,'Overijssel','OV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(960,165,'Utrecht','UT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(961,165,'Zeeland','ZE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(962,165,'Zuid-Holland','ZH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(963,165,'Bonaire','BQ1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(964,165,'Saba','BQ2','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(965,165,'Sint Eustatius','BQ3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(966,224,'Adana','1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(967,224,'Adıyaman','2','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(968,224,'Afyonkarahisar','3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(969,224,'Ağrı','4','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(970,224,'Amasya','5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(971,224,'Ankara','6','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(972,224,'Antalya','7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(973,224,'Artvin','8','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(974,224,'Aydın','9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(975,224,'Balıkesir','10','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(976,224,'Bilecik','11','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(977,224,'Bingöl','12','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(978,224,'Bitlis','13','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(979,224,'Bolu','14','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(980,224,'Burdur','15','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(981,224,'Bursa','16','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(982,224,'Çanakkale','17','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(983,224,'Çankırı','18','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(984,224,'Çorum','19','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(985,224,'Denizli','20','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(986,224,'Diyarbakır','21','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(987,224,'Edirne','22','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(988,224,'Elazığ','23','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(989,224,'Erzincan','24','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(990,224,'Erzurum','25','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(991,224,'Eskişehir','26','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(992,224,'Gaziantep','27','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(993,224,'Giresun','28','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(994,224,'Gümüşhane','29','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(995,224,'Hakkari','30','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(996,224,'Hatay','31','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(997,224,'Isparta','32','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(998,224,'Mersin','33','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(999,224,'İstanbul','34','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1000,224,'İzmir','35','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1001,224,'Kars','36','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1002,224,'Kastamonu','37','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1003,224,'Kayseri','38','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1004,224,'Kırklareli','39','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1005,224,'Kırşehir','40','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1006,224,'Kocaeli','41','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1007,224,'Konya','42','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1008,224,'Kütahya','43','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1009,224,'Malatya','44','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1010,224,'Manisa','45','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1011,224,'Kahramanmaraş','46','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1012,224,'Mardin','47','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1013,224,'Muğla','48','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1014,224,'Muş','49','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1015,224,'Nevşehir','50','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1016,224,'Niğde','51','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1017,224,'Ordu','52','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1018,224,'Rize','53','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1019,224,'Sakarya','54','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1020,224,'Samsun','55','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1021,224,'Siirt','56','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1022,224,'Sinop','57','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1023,224,'Sivas','58','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1024,224,'Tekirdağ','59','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1025,224,'Tokat','60','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1026,224,'Trabzon','61','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1027,224,'Tunceli','62','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1028,224,'Şanlıurfa','63','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1029,224,'Uşak','64','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1030,224,'Van','65','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1031,224,'Yozgat','66','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1032,224,'Zonguldak','67','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1033,224,'Aksaray','68','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1034,224,'Bayburt','69','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1035,224,'Karaman','70','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1036,224,'Kırıkkale','71','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1037,224,'Batman','72','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1038,224,'Şırnak','73','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1039,224,'Bartın','74','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1040,224,'Ardahan','75','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1041,224,'Iğdır','76','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1042,224,'Yalova','77','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1043,224,'Karabük','78','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1044,224,'Kilis','79','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1045,224,'Osmaniye','80','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1046,224,'Düzce','81','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1047,241,'An Giang','VN-44','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1048,241,'Bình Dương','VN-57','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1049,241,'Bình Định','VN-31','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1050,241,'Bắc Giang','VN-54','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1051,241,'Bắc Kạn','VN-53','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1052,241,'Bạc Liêu','VN-55','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1053,241,'Bắc Ninh','VN-56','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1054,241,'Bình Phước','VN-58','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1055,241,'Bà Rịa - Vũng Tàu','VN-43','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1056,241,'Bình Thuận','VN-40','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1057,241,'Bến Tre','VN-50','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1058,241,'Cao Bằng','VN-04','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1059,241,'Cà Mau','VN-59','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1060,241,'TP Cần Thơ','VN-CT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1061,241,'Điện Biên','VN-71','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1062,241,'Đắk Lắk','VN-33','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1063,241,'TP Đà Nẵng','VN-DN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1064,241,'Đồng Nai','VN-39','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1065,241,'Đắk Nông','VN-72','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1066,241,'Đồng Tháp','VN-45','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1067,241,'Gia Lai','VN-30','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1068,241,'Hòa Bình','VN-14','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1069,241,'TP Hồ Chí Minh','VN-SG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1070,241,'Hải Dương','VN-61','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1071,241,'Hậu Giang','VN-73','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1072,241,'Hà Giang','VN-03','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1073,241,'Hà Nội','VN-HN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1074,241,'Hà Nam','VN-63','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1075,241,'TP Hải Phòng','VN-HP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1076,241,'Hà Tĩnh','VN-23','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1077,241,'Hưng Yên','VN-66','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1078,241,'Kiên Giang','VN-47','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1079,241,'Khánh Hòa','VN-34','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1080,241,'Kon Tum','VN-28','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1081,241,'Long An','VN-41','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1082,241,'Lào Cai','VN-02','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1083,241,'Lai Châu','VN-01','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1084,241,'Lâm Đồng','VN-35','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1085,241,'Lạng Sơn','VN-09','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1086,241,'Nghệ An','VN-22','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1087,241,'Ninh Bình','VN-18','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1088,241,'Nam Định','VN-67','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1089,241,'Ninh Thuận','VN-36','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1090,241,'Phú Thọ','VN-68','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1091,241,'Phú Yên','VN-32','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1092,241,'Quảng Bình','VN-24','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1093,241,'Quảng Ninh','VN-13','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1094,241,'Quảng Nam','VN-27','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1095,241,'Quảng Ngãi','VN-29','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1096,241,'Quảng Trị','VN-25','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1097,241,'Sơn La','VN-05','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1098,241,'Sóc Trăng','VN-52','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1099,241,'Thái Bình','VN-20','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1100,241,'Tiền Giang','VN-46','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1101,241,'Thanh Hóa','VN-21','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1102,241,'Thái Nguyên','VN-69','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1103,241,'Tây Ninh','VN-37','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1104,241,'Tuyên Quang','VN-07','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1105,241,'Thừa Thiên - Huế','VN-26','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1106,241,'Trà Vinh','VN-51','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1107,241,'Vĩnh Long','VN-49','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1108,241,'Vĩnh Phúc','VN-70','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1109,241,'Yên Bái','VN-06','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1110,50,'San José','1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1111,50,'Alajuela','2','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1112,50,'Heredia','4','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1113,50,'Cartago','3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1114,50,'Puntarenas','6','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1115,50,'Guanacaste','5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1116,50,'Limón','7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1117,61,'Distrito Nacional','DN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1118,61,'Azua','AZU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1119,61,'Bahoruco','BAH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1120,61,'Barahona','BAR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1121,61,'Dajabón','DAJ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1122,61,'Duarte','DUA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1123,61,'Elías Piña','ELP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1124,61,'El Seibo','ELS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1125,61,'Espaillat','ESP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1126,61,'Independencia','IND','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1127,61,'La Altagracia','LA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1128,61,'La Romana','LR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1129,61,'La Vega','LV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1130,61,'María Trinidad Sánchez','MTS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1131,61,'Monte Cristi','MC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1132,61,'Pedernales','PED','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1133,61,'Peravia','PER','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1134,61,'Puerto Plata','PP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1135,61,'Hermanas Mirabal','HEM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1136,61,'Samaná','SAM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1137,61,'San Cristóbal','SC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1138,61,'San Juan','SJ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1139,61,'San Pedro de Macorís','SPM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1140,61,'Sánchez Ramírez','SRA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1141,61,'Santiago','STGO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1142,61,'Santiago Rodríguez','SRO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1143,61,'Valverde','VAL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1144,61,'Monseñor Nouel','MON','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1145,61,'Monte Plata','MP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1146,61,'Hato Mayor','HAM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1147,61,'San José de Ocoa','SJO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1148,61,'Santo Domingo','SD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1149,173,'Amazonas','1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1150,173,'Áncash','2','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1151,173,'Apurímac','3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1152,173,'Arequipa','4','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1153,173,'Ayacucho','5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1154,173,'Cajamarca','6','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1155,173,'Callao','7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1156,173,'Cusco','8','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1157,173,'Huancavelica','9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1158,173,'Huánuco','10','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1159,173,'Ica','11','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1160,173,'Junin','12','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1161,173,'La Libertad','13','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1162,173,'Lambayeque','14','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1163,173,'Lima','15','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1164,173,'Loreto','16','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1165,173,'Madre de Dios','17','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1166,173,'Moquegua','18','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1167,173,'Pasco','19','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1168,173,'Piura','20','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1169,173,'Puno','21','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1170,173,'San Martín','22','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1171,173,'Tacna','23','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1172,173,'Tumbes','24','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1173,173,'Ucayali','25','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1174,46,'Tarapacá','1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1175,46,'Antofagasta','2','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1176,46,'Atacama','3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1177,46,'Coquimbo','4','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1178,46,'Valparaíso','5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1179,46,'del Libertador Gral. Bernardo O\'Higgins','6','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1180,46,'del Maule','7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1181,46,'del BíoBio','8','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1182,46,'de la Araucania','9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1183,46,'de los Lagos','10','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1184,46,'Aysén del Gral. Carlos Ibáñez del Campo','11','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1185,46,'Magallanes','12','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1186,46,'Metropolitana','13','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1187,46,'Los Ríos','14','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1188,46,'Arica y Parinacota','15','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1189,46,'del Ñuble','16','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1190,64,'Harjumaa','EE-37','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1191,64,'Hiiumaa','EE-39','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1192,64,'Ida-Virumaa','EE-44','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1193,64,'Jõgevamaa','EE-49','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1194,64,'Järvamaa','EE-51','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1195,64,'Läänemaa','EE-57','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1196,64,'Lääne-Virumaa','EE-59','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1197,64,'Põlvamaa','EE-65','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1198,64,'Pärnumaa','EE-67','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1199,64,'Raplamaa','EE-70','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1200,64,'Saaremaa','EE-74','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1201,64,'Tartumaa','EE-78','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1202,64,'Valgamaa','EE-82','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1203,64,'Viljandimaa','EE-84','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1204,64,'Võrumaa','EE-86','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1205,134,'Aglonas novads','LV-001','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1206,134,'Aizkraukles novads','LV-002','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1207,134,'Aizputes novads','LV-003','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1208,134,'Aknīstes novads','LV-004','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1209,134,'Alojas novads','LV-005','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1210,134,'Alsungas novads','LV-006','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1211,134,'Alūksnes novads','LV-007','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1212,134,'Amatas novads','LV-008','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1213,134,'Apes novads','LV-009','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1214,134,'Auces novads','LV-010','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1215,134,'Ādažu novads','LV-011','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1216,134,'Babītes novads','LV-012','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1217,134,'Baldones novads','LV-013','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1218,134,'Baltinavas novads','LV-014','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1219,134,'Balvu novads','LV-015','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1220,134,'Bauskas novads','LV-016','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1221,134,'Beverīnas novads','LV-017','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1222,134,'Brocēnu novads','LV-018','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1223,134,'Burtnieku novads','LV-019','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1224,134,'Carnikavas novads','LV-020','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1225,134,'Cesvaines novads','LV-021','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1226,134,'Cēsu novads','LV-022','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1227,134,'Ciblas novads','LV-023','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1228,134,'Dagdas novads','LV-024','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1229,134,'Daugavpils novads','LV-025','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1230,134,'Dobeles novads','LV-026','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1231,134,'Dundagas novads','LV-027','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1232,134,'Durbes novads','LV-028','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1233,134,'Engures novads','LV-029','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1234,134,'Ērgļu novads','LV-030','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1235,134,'Garkalnes novads','LV-031','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1236,134,'Grobiņas novads','LV-032','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1237,134,'Gulbenes novads','LV-033','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1238,134,'Iecavas novads','LV-034','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1239,134,'Ikšķiles novads','LV-035','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1240,134,'Ilūkstes novads','LV-036','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1241,134,'Inčukalna novads','LV-037','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1242,134,'Jaunjelgavas novads','LV-038','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1243,134,'Jaunpiebalgas novads','LV-039','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1244,134,'Jaunpils novads','LV-040','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1245,134,'Jelgavas novads','LV-041','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1246,134,'Jēkabpils novads','LV-042','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1247,134,'Kandavas novads','LV-043','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1248,134,'Kārsavas novads','LV-044','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1249,134,'Kocēnu novads','LV-045','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1250,134,'Kokneses novads','LV-046','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1251,134,'Krāslavas novads','LV-047','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1252,134,'Krimuldas novads','LV-048','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1253,134,'Krustpils novads','LV-049','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1254,134,'Kuldīgas novads','LV-050','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1255,134,'Ķeguma novads','LV-051','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1256,134,'Ķekavas novads','LV-052','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1257,134,'Lielvārdes novads','LV-053','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1258,134,'Limbažu novads','LV-054','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1259,134,'Līgatnes novads','LV-055','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1260,134,'Līvānu novads','LV-056','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1261,134,'Lubānas novads','LV-057','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1262,134,'Ludzas novads','LV-058','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1263,134,'Madonas novads','LV-059','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1264,134,'Mazsalacas novads','LV-060','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1265,134,'Mālpils novads','LV-061','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1266,134,'Mārupes novads','LV-062','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1267,134,'Mērsraga novads','LV-063','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1268,134,'Naukšēnu novads','LV-064','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1269,134,'Neretas novads','LV-065','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1270,134,'Nīcas novads','LV-066','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1271,134,'Ogres novads','LV-067','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1272,134,'Olaines novads','LV-068','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1273,134,'Ozolnieku novads','LV-069','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1274,134,'Pārgaujas novads','LV-070','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1275,134,'Pāvilostas novads','LV-071','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1276,134,'Pļaviņu novads','LV-072','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1277,134,'Preiļu novads','LV-073','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1278,134,'Priekules novads','LV-074','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1279,134,'Priekuļu novads','LV-075','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1280,134,'Raunas novads','LV-076','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1281,134,'Rēzeknes novads','LV-077','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1282,134,'Riebiņu novads','LV-078','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1283,134,'Rojas novads','LV-079','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1284,134,'Ropažu novads','LV-080','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1285,134,'Rucavas novads','LV-081','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1286,134,'Rugāju novads','LV-082','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1287,134,'Rundāles novads','LV-083','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1288,134,'Rūjienas novads','LV-084','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1289,134,'Salas novads','LV-085','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1290,134,'Salacgrīvas novads','LV-086','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1291,134,'Salaspils novads','LV-087','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1292,134,'Saldus novads','LV-088','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1293,134,'Saulkrastu novads','LV-089','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1294,134,'Sējas novads','LV-090','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1295,134,'Siguldas novads','LV-091','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1296,134,'Skrīveru novads','LV-092','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1297,134,'Skrundas novads','LV-093','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1298,134,'Smiltenes novads','LV-094','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1299,134,'Stopiņu novads','LV-095','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1300,134,'Strenču novads','LV-096','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1301,134,'Talsu novads','LV-097','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1302,134,'Tērvetes novads','LV-098','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1303,134,'Tukuma novads','LV-099','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1304,134,'Vaiņodes novads','LV-100','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1305,134,'Valkas novads','LV-101','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1306,134,'Varakļānu novads','LV-102','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1307,134,'Vārkavas novads','LV-103','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1308,134,'Vecpiebalgas novads','LV-104','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1309,134,'Vecumnieku novads','LV-105','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1310,134,'Ventspils novads','LV-106','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1311,134,'Viesītes novads','LV-107','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1312,134,'Viļakas novads','LV-108','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1313,134,'Viļānu novads','LV-109','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1314,134,'Zilupes novads','LV-110','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1315,134,'Daugavpils','LV-DGV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1316,134,'Jelgava','LV-JEL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1317,134,'Jēkabpils','LV-JKB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1318,134,'Jūrmala','LV-JUR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1319,134,'Liepāja','LV-LPX','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1320,134,'Rēzekne','LV-REZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1321,134,'Rīga','LV-RIX','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1322,134,'Valmiera','LV-VMR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1323,134,'Ventspils','LV-VEN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1324,132,'Alytaus apskritis','LT-AL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1325,132,'Kauno apskritis','LT-KU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1326,132,'Klaipėdos apskritis','LT-KL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1327,132,'Marijampolės apskritis','LT-MR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1328,132,'Panevėžio apskritis','LT-PN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1329,132,'Šiaulių apskritis','LT-SA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1330,132,'Tauragės apskritis','LT-TA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1331,132,'Telšių apskritis','LT-TE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1332,132,'Utenos apskritis','LT-UT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1333,132,'Vilniaus apskritis','LT-VL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1334,70,'Ahvenanmaa','FI-01','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1335,70,'Etelä-Karjala','FI-02','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1336,70,'Etelä-Pohjanmaa','FI-03','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1337,70,'Etelä-Savo','FI-04','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1338,70,'Kainuu','FI-05','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1339,70,'Kanta-Häme','FI-06','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1340,70,'Keski-Pohjanmaa','FI-07','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1341,70,'Keski-Suomi','FI-08','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1342,70,'Kymenlaakso','FI-09','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1343,70,'Lappi','FI-10','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1344,70,'Pirkanmaa','FI-11','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1345,70,'Pohjanmaa','FI-12','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1346,70,'Pohjois-Karjala','FI-13','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1347,70,'Pohjois-Pohjanmaa','FI-14','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1348,70,'Pohjois-Savo','FI-15','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1349,70,'Päijät-Häme','FI-16','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1350,70,'Satakunta','FI-17','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1351,70,'Uusimaa','FI-18','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1352,70,'Varsinais-Suomi','FI-19','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1353,196,'Blekinge län','SE-K','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1354,196,'Dalarnas län','SE-W','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1355,196,'Gotlands län','SE-I','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1356,196,'Gävleborgs län','SE-X','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1357,196,'Hallands län','SE-N','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1358,196,'Jämtlands län','SE-Z','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1359,196,'Jönköpings län','SE-F','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1360,196,'Kalmar län','SE-H','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1361,196,'Kronobergs län','SE-G','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1362,196,'Norrbottens län','SE-BD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1363,196,'Skåne län','SE-M','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1364,196,'Stockholms län','SE-AB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1365,196,'Södermanlands län','SE-D','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1366,196,'Uppsala län','SE-C','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1367,196,'Värmlands län','SE-S','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1368,196,'Västerbottens län','SE-AC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1369,196,'Västernorrlands län','SE-Y','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1370,196,'Västmanlands län','SE-U','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1371,196,'Västra Götalands län','SE-O','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1372,196,'Örebro län','SE-T','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1373,196,'Östergötlands län','SE-E','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1374,166,'Agder','NO-42','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1375,166,'Innlandet','NO-34','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1376,166,'Møre og Romsdal','NO-15','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1377,166,'Nordland','NO-18','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1378,166,'Oslo','NO-03','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1379,166,'Rogaland','NO-11','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1380,166,'Troms og Finnmark / Romsa ja Finnmárku','NO-54','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1381,166,'Trøndelag','NO-50','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1382,166,'Vestfold og Telemark','NO-38','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1383,166,'Vestland','NO-46','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1384,166,'Viken','NO-30','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1385,166,'Jan Mayen','NO-22','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1386,166,'Svalbard','NO-21','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1387,57,'Baden-Württemberg','DE-BW','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1388,57,'Bayern','DE-BY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1389,57,'Berlin','DE-BE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1390,57,'Brandenburg','DE-BB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1391,57,'Bremen','DE-HB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1392,57,'Hamburg','DE-HH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1393,57,'Hessen','DE-HE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1394,57,'Mecklenburg-Vorpommern','DE-MV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1395,57,'Niedersachsen','DE-NI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1396,57,'Nordrhein-Westfalen','DE-NW','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1397,57,'Rheinland-Pfalz','DE-RP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1398,57,'Saarland','DE-SL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1399,57,'Sachsen','DE-SN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1400,57,'Sachsen-Anhalt','DE-ST','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1401,57,'Schleswig-Holstein','DE-SH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1402,57,'Thüringen','DE-TH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1403,63,'Azuay','1','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1404,63,'Bolivar','2','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1405,63,'Canar','3','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1406,63,'Carchi','4','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1407,63,'Cotopaxi','5','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1408,63,'Chimborazo','6','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1409,63,'El Oro','7','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1410,63,'Esmeraldas','8','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1411,63,'Guayas','9','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1412,63,'Imbabura','10','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1413,63,'Loja','11','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1414,63,'Los Rios','12','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1415,63,'Manabi','13','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1416,63,'Morona Santiago','14','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1417,63,'Napo','15','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1418,63,'Pastaza','16','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1419,63,'Pichincha','17','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1420,63,'Tungurahua','18','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1421,63,'Zamora Chinchipe','19','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1422,63,'Galapagos','20','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1423,63,'Sucumbios','21','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1424,63,'Orellana','22','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1425,63,'Santo Domingo de los Tsachilas','23','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1426,63,'Santa Elena','24','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1427,43,'Zürich','ZH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1428,43,'Zurigo','ZH-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1429,43,'Zurich','ZH-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1430,43,'Bern','BE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1431,43,'Berna','BE-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1432,43,'Berne','BE-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1433,43,'Luzern','LU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1434,43,'Lucerna','LU-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1435,43,'Lucerne','LU-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1436,43,'Uri','UR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1437,43,'Schwyz','SZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1438,43,'Svitto','SZ-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1439,43,'Obwalden','OW','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1440,43,'Obvaldo','OW-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1441,43,'Obwald','OW-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1442,43,'Nidwalden','NW','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1443,43,'Nidvaldo','NW-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1444,43,'Nidwald','NW-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1445,43,'Glarus','GL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1446,43,'Glanora','GL-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1447,43,'Glaris','GL-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1448,43,'Zug','ZG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1449,43,'Zugo','ZG-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1450,43,'Zoug','ZG-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1451,43,'Freiburg','FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1452,43,'Friburgo','FR-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1453,43,'Fribourg','FR-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1454,43,'Solothurn','SO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1455,43,'Soletta','SO-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1456,43,'Soleure','SO-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1457,43,'Basel-Stadt','BS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1458,43,'Basilea-Città','BS-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1459,43,'Bâle-Ville','BS-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1460,43,'Basel-Landschaft','BL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1461,43,'Basilea-Campagna','BL-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1462,43,'Bâle-Campagne','BL-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1463,43,'Schaffhausen','SH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1464,43,'Sciaffusa','SH-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1465,43,'Schaffhouse','SH-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1466,43,'Appenzell Ausserrhoden','AR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1467,43,'Appenzello Esterno','AR-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1468,43,'Appenzell Rhodes-Extérieures','AR-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1469,43,'Appenzell Innerrhoden','AI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1470,43,'Appenzello Interno','AI-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1471,43,'Appenzell Rhodes-Intérieures','AI-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1472,43,'St. Gallen','SG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1473,43,'San Gallo','SG-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1474,43,'Saint-Gall','SG-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1475,43,'Graubünden','GR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1476,43,'Grigioni','GR-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1477,43,'Grisons','GR-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1478,43,'Aargau','AG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1479,43,'Argovia','AG-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1480,43,'Argovie','AG-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1481,43,'Thurgau','TG','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1482,43,'Turgovia','TG-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1483,43,'Thurgovie','TG-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1484,43,'Tessin','TI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1485,43,'Ticino','TI-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1486,43,'Waadt','VD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1487,43,'Vaud','VD-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1488,43,'Wallis','VS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1489,43,'Vallese','VS-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1490,43,'Valais','VS-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1491,43,'Neuenburg','NE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1492,43,'Neuchâtel','NE-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1493,43,'Genf','GE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1494,43,'Ginevra','GE-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1495,43,'Genève','GE-FR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1496,43,'Jura','JU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1497,43,'Giura','JU-IT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1498,217,'Bangkok','TH-10','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1499,217,'Amnat Charoen','TH-37','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1500,217,'Ang Thong','TH-15','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1501,217,'Bueng Kan','TH-38','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1502,217,'Buriram','TH-31','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1503,217,'Chachoengsao','TH-24','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1504,217,'Chai Nat','TH-18','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1505,217,'Chaiyaphum','TH-36','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1506,217,'Chanthaburi','TH-22','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1507,217,'Chiang Mai','TH-50','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1508,217,'Chiang Rai','TH-57','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1509,217,'Chonburi','TH-20','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1510,217,'Chumphon','TH-86','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1511,217,'Kalasin','TH-46','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1512,217,'Kamphaeng Phet','TH-62','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1513,217,'Kanchanaburi','TH-71','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1514,217,'Khon Kaen','TH-40','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1515,217,'Krabi','TH-81','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1516,217,'Lampang','TH-52','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1517,217,'Lamphun','TH-51','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1518,217,'Loei','TH-42','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1519,217,'Lopburi','TH-16','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1520,217,'Mae Hong Son','TH-58','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1521,217,'Maha Sarakham','TH-44','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1522,217,'Mukdahan','TH-49','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1523,217,'Nakhon Nayok','TH-26','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1524,217,'Nakhon Pathom','TH-73','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1525,217,'Nakhon Phanom','TH-48','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1526,217,'Nakhon Ratchasima','TH-30','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1527,217,'Nakhon Sawan','TH-60','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1528,217,'Nakhon Si Thammarat','TH-80','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1529,217,'Nan','TH-55','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1530,217,'Narathiwat','TH-96','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1531,217,'Nong Bua Lamphu','TH-39','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1532,217,'Nong Khai','TH-43','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1533,217,'Nonthaburi','TH-12','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1534,217,'Pathum Thani','TH-13','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1535,217,'Pattani','TH-94','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1536,217,'Phang Nga','TH-82','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1537,217,'Phatthalung','TH-93','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1538,217,'Phayao','TH-56','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1539,217,'Phetchabun','TH-67','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1540,217,'Phetchaburi','TH-76','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1541,217,'Phichit','TH-66','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1542,217,'Phitsanulok','TH-65','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1543,217,'Phra Nakhon Si Ayutthaya','TH-14','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1544,217,'Phrae','TH-54','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1545,217,'Phuket','TH-83','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1546,217,'Prachinburi','TH-25','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1547,217,'Prachuap Khiri Khan','TH-77','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1548,217,'Ranong','TH-85','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1549,217,'Ratchaburi','TH-70','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1550,217,'Rayong','TH-21','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1551,217,'Roi Et','TH-45','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1552,217,'Sa Kaeo','TH-27','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1553,217,'Sakon Nakhon','TH-47','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1554,217,'Samut Prakan','TH-11','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1555,217,'Samut Sakhon','TH-74','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1556,217,'Samut Songkhram','TH-75','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1557,217,'Saraburi','TH-19','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1558,217,'Satun','TH-91','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1559,217,'Sing Buri','TH-17','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1560,217,'Sisaket','TH-33','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1561,217,'Songkhla','TH-90','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1562,217,'Sukhothai','TH-64','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1563,217,'Suphan Buri','TH-72','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1564,217,'Surat Thani','TH-84','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1565,217,'Surin','TH-32','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1566,217,'Tak','TH-63','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1567,217,'Trang','TH-92','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1568,217,'Trat','TH-23','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1569,217,'Ubon Ratchathani','TH-34','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1570,217,'Udon Thani','TH-41','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1571,217,'Uthai Thani','TH-61','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1572,217,'Uttaradit','TH-53','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1573,217,'Yala','TH-95','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1574,217,'Yasothon','TH-35','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1575,192,'Abha','AHB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1576,192,'Abqaiq','ABQ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1577,192,'Ad Dammam','DMM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1578,192,'Ad Dawadami','DAW','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1579,192,'Al Baha','ABT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1580,192,'Al Bahah','BAH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1581,192,'Al Hada','AHA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1582,192,'Al Hadithah','HAD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1583,192,'Al Hasa','ALH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1584,192,'Al Jawf','LJW','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1585,192,'Al Jubayl Industrial City','JBI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1586,192,'Al Kharj','AKH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1587,192,'Al Khobar','AQK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1588,192,'Al Khobar','ALK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1589,192,'Al Khuraibah','KHU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1590,192,'Al Muajjiz','AMU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1591,192,'Al Qahmah','QAH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1592,192,'Al Qunfudah','QUN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1593,192,'Al Qurainah','QRN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1594,192,'Al Shuqaiq','ASQ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1595,192,'Al \'Uthmaniyah','AUT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1596,192,'Ar Rass','ARR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1597,192,'Arar','RAE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1598,192,'Asfan','ASF','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1599,192,'Badanah','BDN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1600,192,'Bisha','BHH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1601,192,'Buraydah','BRU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1602,192,'Buraydah','BUR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1603,192,'Dhahran','DHA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1604,192,'Dhuba','DHU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1605,192,'Fiji','FJJ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1606,192,'Gassim','ELQ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1607,192,'Gurayat','URY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1608,192,'Hafar al Batin','HBT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1609,192,'Hail','HAS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1610,192,'Harad','RAD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1611,192,'Hazm Al Jalamid','HZM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1612,192,'Hofuf','HOF','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1613,192,'Jazan Economic City','JEC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1614,192,'Jeddah','JED','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1615,192,'Jeddah Industrial City 2 & 3','JIC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1616,192,'Jeddah Yachts Club Port','JYC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1617,192,'Jizan','GIZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1618,192,'Jouf','AJF','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1619,192,'Juaymah Terminal','JUT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1620,192,'Jubail','JUB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1621,192,'Khamis Mushayt','KMX','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1622,192,'King Abdullah City','KAC','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1623,192,'King Fhad','KFH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1624,192,'King Khalid','KKH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1625,192,'Lith','LIT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1626,192,'Madinah','MED','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1627,192,'Majma','MJH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1628,192,'Makkah','MAK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1629,192,'Manailih','MAN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1630,192,'Manfouha','MUF','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1631,192,'Muhayil','MHY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1632,192,'Najran','NJN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1633,192,'Nejran','EAM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1634,192,'Qaisumah','AQI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1635,192,'Qalsn','QAL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1636,192,'Qatif','QTF','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1637,192,'Qurayyah','QUR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1638,192,'Rabigh','RAB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1639,192,'Rafha','RAH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1640,192,'Ras al Khafji','RAR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1641,192,'Ras al Mishab','RAM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1642,192,'Ras Al-Khair','RAZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1643,192,'Ras Tanura','RTA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1644,192,'Riyadh','RUH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1645,192,'Riyadh Dry Port','RYP','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1646,192,'Safaniya','SAF','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1647,192,'Salboukh','SUH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1648,192,'Salwá','SAL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1649,192,'Sayhat','SAY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1650,192,'Shadqam','SHD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1651,192,'Sharurah','SHW','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1652,192,'Shuaibah','SHU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1653,192,'Sulayel','SLF','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1654,192,'Tabuk','TUU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1655,192,'Taif','TIF','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1656,192,'Turaif','TUI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1657,192,'Tusdeer Free Zone','TFZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1658,192,'Udhailiyah','UDH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1659,192,'Umm Lajj','VLA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1660,192,'Unayzah','UZH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1661,192,'Wadi ad Dawasir','WAE','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1662,192,'Waisumah','AWI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1663,192,'Wedjh','EJH','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1664,192,'Yanbu commercial city','YNB','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1665,192,'Yanbu Industrial City','YBI','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1666,192,'Zilfi','ZUL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1667,192,'Zulayfayn','ZUY','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1668,234,'Artigas','AR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1669,234,'Canelones','CA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1670,234,'Cerro Largo','CL','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1671,234,'Colonia','CO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1672,234,'Durazno','DU','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1673,234,'Flores','FS','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1674,234,'Florida','FD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1675,234,'Lavalleja','LA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1676,234,'Maldonado','MA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1677,234,'Montevideo','MO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1678,234,'Paysandú','PA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1679,234,'Río Negro','RN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1680,234,'Rivera','RV','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1681,234,'Rocha','RO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1682,234,'Salto','SA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1683,234,'San José','SJ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1684,234,'Soriano','SO','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1685,234,'Tacuarembó','TA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1686,234,'Treinta y Tres','TT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1687,94,'Hong Kong Island','HK','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1688,94,'Kowloon','KLN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1689,94,'New Territories','NT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1690,114,'Baringo','KE-01','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1691,114,'Bomet','KE-02','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1692,114,'Bungoma','KE-03','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1693,114,'Busia','KE-04','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1694,114,'Elgeyo/Marakwet','KE-05','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1695,114,'Embu','KE-06','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1696,114,'Garissa','KE-07','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1697,114,'Homa Bay','KE-08','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1698,114,'Isiolo','KE-09','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1699,114,'Kajiado','KE-10','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1700,114,'Kakamega','KE-11','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1701,114,'Kericho','KE-12','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1702,114,'Kiambu','KE-13','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1703,114,'Kilifi','KE-14','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1704,114,'Kirinyaga','KE-15','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1705,114,'Kisii','KE-16','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1706,114,'Kisumu','KE-17','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1707,114,'Kitui','KE-18','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1708,114,'Kwale','KE-19','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1709,114,'Laikipia','KE-20','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1710,114,'Lamu','KE-21','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1711,114,'Machakos','KE-22','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1712,114,'Makueni','KE-23','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1713,114,'Mandera','KE-24','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1714,114,'Marsabit','KE-25','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1715,114,'Meru','KE-26','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1716,114,'Migori','KE-27','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1717,114,'Mombasa','KE-28','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1718,114,'Murang\'a','KE-29','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1719,114,'Nairobi City','KE-30','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1720,114,'Nakuru','KE-31','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1721,114,'Nandi','KE-32','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1722,114,'Narok','KE-33','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1723,114,'Nyamira','KE-34','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1724,114,'Nyandarua','KE-35','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1725,114,'Nyeri','KE-36','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1726,114,'Samburu','KE-37','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1727,114,'Siaya','KE-38','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1728,114,'Taita/Taveta','KE-39','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1729,114,'Tana River','KE-40','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1730,114,'Tharaka-Nithi','KE-41','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1731,114,'Trans Nzoia','KE-42','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1732,114,'Turkana','KE-43','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1733,114,'Uasin Gishu','KE-44','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1734,114,'Vihiga','KE-45','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1735,114,'Wajir','KE-46','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1736,114,'West Pokot','KE-47','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1737,112,'Ajloun','JO-AJ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1738,112,'Amman','JO-AM','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1739,112,'Aqaba','JO-AQ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1740,112,'Tafileh','JO-AT','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1741,112,'Zarqa','JO-AZ','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1742,112,'Balqa','JO-BA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1743,112,'Irbid','JO-IR','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1744,112,'Jerash','JO-JA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1745,112,'Karak','JO-KA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1746,112,'Mafraq','JO-MA','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1747,112,'Madaba','JO-MD','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1748,112,'Maan','JO-MN','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1749,121,'Seoul-teukbyeolsi','KR-11','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1750,121,'Busan-gwangyeoksi','KR-26','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1751,121,'Daegu-gwangyeoksi','KR-27','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1752,121,'Incheon-gwangyeoksi','KR-28','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1753,121,'Gwangju-gwangyeoksi','KR-29','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1754,121,'Daejeon-gwangyeoksi','KR-30','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1755,121,'Ulsan-gwangyeoksi','KR-31','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1756,121,'Gyeonggi-do','KR-41','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1757,121,'Gangwon-teukbyeoljachido','KR-42','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1758,121,'Chungcheongbuk-do','KR-43','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1759,121,'Chungcheongnam-do','KR-44','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1760,121,'Jeollabuk-do','KR-45','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1761,121,'Jeollanam-do','KR-46','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1762,121,'Gyeongsangbuk-do','KR-47','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1763,121,'Gyeongsangnam-do','KR-48','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1764,121,'Jeju-teukbyeoljachido','KR-49','2026-04-23 20:44:24','2026-04-23 20:44:24'),
(1765,121,'Sejong','KR-50','2026-04-23 20:44:24','2026-04-23 20:44:24');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_view_favorites`
--

DROP TABLE IF EXISTS `table_view_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_view_favorites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `is_favorite` tinyint(1) NOT NULL DEFAULT 1,
  `view_type` varchar(255) NOT NULL,
  `view_key` varchar(255) NOT NULL,
  `filterable_type` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_view_fav_unique` (`view_type`,`view_key`,`filterable_type`,`user_id`),
  KEY `table_view_favorites_user_id_foreign` (`user_id`),
  CONSTRAINT `table_view_favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_view_favorites`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_view_favorites` WRITE;
/*!40000 ALTER TABLE `table_view_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_view_favorites` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `table_views`
--

DROP TABLE IF EXISTS `table_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_views` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  `filters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`filters`)),
  `filterable_type` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `table_views_user_id_foreign` (`user_id`),
  CONSTRAINT `table_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_views`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `table_views` WRITE;
/*!40000 ALTER TABLE `table_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_views` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_creator_id_foreign` (`creator_id`),
  CONSTRAINT `teams_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES
(1,1,'Kwik ride','2026-04-27 05:43:43','2026-04-27 05:43:43');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `time_off_leave_accrual_levels`
--

DROP TABLE IF EXISTS `time_off_leave_accrual_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_off_leave_accrual_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort order',
  `accrual_plan_id` bigint(20) unsigned NOT NULL,
  `start_count` int(11) DEFAULT NULL COMMENT 'Start After',
  `first_day` int(11) DEFAULT NULL COMMENT 'First Day',
  `second_day` int(11) DEFAULT NULL COMMENT 'Second Day',
  `first_month_day` int(11) DEFAULT NULL COMMENT 'First Month Day',
  `second_month_day` int(11) DEFAULT NULL COMMENT 'Second Month Day',
  `yearly_day` int(11) DEFAULT NULL COMMENT 'Yearly Day',
  `postpone_max_days` int(11) DEFAULT NULL COMMENT 'Postpone Max Days',
  `accrual_validity_count` int(11) DEFAULT NULL COMMENT 'Accrual Validity Count',
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `start_type` enum('months','days','years') NOT NULL DEFAULT 'days' COMMENT 'Start Type',
  `added_value_type` enum('days','hours') NOT NULL DEFAULT 'days' COMMENT 'Added Value Type',
  `frequency` enum('hourly','daily','weekly','bimonthly','monthly','biyearly','yearly') NOT NULL DEFAULT 'daily' COMMENT 'Frequency',
  `week_day` enum('sunday','monday','tuesday','wednesday','thursday','friday','saturday') DEFAULT NULL COMMENT 'Week Day',
  `first_month` varchar(255) DEFAULT NULL COMMENT 'First Month',
  `second_month` varchar(255) DEFAULT NULL COMMENT 'Second Month',
  `yearly_month` varchar(255) DEFAULT NULL COMMENT 'Yearly Month',
  `action_with_unused_accruals` enum('lost','all','maximum') NOT NULL DEFAULT 'lost' COMMENT 'Action With Unused Accruals',
  `accrual_validity_type` enum('days','months') DEFAULT 'days' COMMENT 'Accrual Validity Type',
  `added_value` int(11) NOT NULL COMMENT 'Added Value',
  `maximum_leave` int(11) DEFAULT NULL COMMENT 'Maximum Leave',
  `maximum_leave_yearly` int(11) DEFAULT NULL COMMENT 'Maximum Leave Yearly',
  `cap_accrued_time` tinyint(1) DEFAULT NULL COMMENT 'Cap Accrued Time',
  `cap_accrued_time_yearly` tinyint(1) DEFAULT NULL COMMENT 'Cap Accrued Time Yearly',
  `accrual_validity` tinyint(1) DEFAULT NULL COMMENT 'Accrual Validity',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time_off_leave_accrual_levels_accrual_plan_id_foreign` (`accrual_plan_id`),
  KEY `time_off_leave_accrual_levels_creator_id_foreign` (`creator_id`),
  CONSTRAINT `time_off_leave_accrual_levels_accrual_plan_id_foreign` FOREIGN KEY (`accrual_plan_id`) REFERENCES `time_off_leave_accrual_plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `time_off_leave_accrual_levels_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_off_leave_accrual_levels`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `time_off_leave_accrual_levels` WRITE;
/*!40000 ALTER TABLE `time_off_leave_accrual_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_off_leave_accrual_levels` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `time_off_leave_accrual_plans`
--

DROP TABLE IF EXISTS `time_off_leave_accrual_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_off_leave_accrual_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time_off_type_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `carryover_day` int(11) DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `transition_mode` enum('immediately','end_of_accrual') NOT NULL DEFAULT 'immediately' COMMENT 'Transition Mode',
  `accrued_gain_time` enum('start','end') NOT NULL DEFAULT 'end' COMMENT 'Accrued Gain Time',
  `carryover_date` enum('year_start','allocation','other') NOT NULL DEFAULT 'year_start' COMMENT 'Carryover Date',
  `carryover_month` enum('jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec') NOT NULL DEFAULT 'jan' COMMENT 'Carryover Month',
  `added_value_type` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_based_on_worked_time` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time_off_leave_accrual_plans_time_off_type_id_foreign` (`time_off_type_id`),
  KEY `time_off_leave_accrual_plans_company_id_foreign` (`company_id`),
  KEY `time_off_leave_accrual_plans_creator_id_foreign` (`creator_id`),
  CONSTRAINT `time_off_leave_accrual_plans_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `time_off_leave_accrual_plans_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `time_off_leave_accrual_plans_time_off_type_id_foreign` FOREIGN KEY (`time_off_type_id`) REFERENCES `time_off_leave_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_off_leave_accrual_plans`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `time_off_leave_accrual_plans` WRITE;
/*!40000 ALTER TABLE `time_off_leave_accrual_plans` DISABLE KEYS */;
INSERT INTO `time_off_leave_accrual_plans` VALUES
(2,NULL,1,NULL,1,'Seniority Plan','immediately','end','year_start','jan',NULL,1,NULL,'2026-04-24 05:31:04','2026-04-24 05:31:04');
/*!40000 ALTER TABLE `time_off_leave_accrual_plans` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `time_off_leave_allocations`
--

DROP TABLE IF EXISTS `time_off_leave_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_off_leave_allocations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `holiday_status_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `employee_company_id` bigint(20) unsigned DEFAULT NULL,
  `manager_id` bigint(20) unsigned DEFAULT NULL,
  `approver_id` bigint(20) unsigned DEFAULT NULL,
  `second_approver_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `accrual_plan_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `state` enum('confirm','refuse','validate_one','validate_two') DEFAULT 'confirm',
  `allocation_type` enum('regular','accrual') DEFAULT 'regular',
  `date_from` timestamp NOT NULL,
  `date_to` timestamp NULL DEFAULT NULL,
  `last_executed_carryover_date` timestamp NULL DEFAULT NULL,
  `last_called` timestamp NULL DEFAULT NULL,
  `actual_last_called` timestamp NULL DEFAULT NULL,
  `next_call` timestamp NULL DEFAULT NULL,
  `carried_over_days_expiration_date` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `already_accrued` tinyint(1) DEFAULT NULL,
  `number_of_days` decimal(15,4) DEFAULT 0.0000,
  `number_of_hours_display` decimal(15,4) DEFAULT 0.0000,
  `yearly_accrued_amount` decimal(15,4) DEFAULT 0.0000,
  `expiring_carryover_days` decimal(15,4) DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time_off_leave_allocations_holiday_status_id_foreign` (`holiday_status_id`),
  KEY `time_off_leave_allocations_employee_id_foreign` (`employee_id`),
  KEY `time_off_leave_allocations_employee_company_id_foreign` (`employee_company_id`),
  KEY `time_off_leave_allocations_manager_id_foreign` (`manager_id`),
  KEY `time_off_leave_allocations_approver_id_foreign` (`approver_id`),
  KEY `time_off_leave_allocations_second_approver_id_foreign` (`second_approver_id`),
  KEY `time_off_leave_allocations_department_id_foreign` (`department_id`),
  KEY `time_off_leave_allocations_accrual_plan_id_foreign` (`accrual_plan_id`),
  KEY `time_off_leave_allocations_creator_id_foreign` (`creator_id`),
  CONSTRAINT `time_off_leave_allocations_accrual_plan_id_foreign` FOREIGN KEY (`accrual_plan_id`) REFERENCES `time_off_leave_accrual_plans` (`id`) ON DELETE SET NULL,
  CONSTRAINT `time_off_leave_allocations_approver_id_foreign` FOREIGN KEY (`approver_id`) REFERENCES `employees_employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `time_off_leave_allocations_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `time_off_leave_allocations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `employees_departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `time_off_leave_allocations_employee_company_id_foreign` FOREIGN KEY (`employee_company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `time_off_leave_allocations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees_employees` (`id`),
  CONSTRAINT `time_off_leave_allocations_holiday_status_id_foreign` FOREIGN KEY (`holiday_status_id`) REFERENCES `time_off_leave_types` (`id`),
  CONSTRAINT `time_off_leave_allocations_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `employees_employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `time_off_leave_allocations_second_approver_id_foreign` FOREIGN KEY (`second_approver_id`) REFERENCES `employees_employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_off_leave_allocations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `time_off_leave_allocations` WRITE;
/*!40000 ALTER TABLE `time_off_leave_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_off_leave_allocations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `time_off_leave_mandatory_days`
--

DROP TABLE IF EXISTS `time_off_leave_mandatory_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_off_leave_mandatory_days` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL COMMENT 'Color code for the day',
  `name` varchar(255) NOT NULL COMMENT 'Name of the day',
  `start_date` timestamp NOT NULL COMMENT 'Start date of the day',
  `end_date` timestamp NOT NULL COMMENT 'End date of the day',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time_off_leave_mandatory_days_company_id_foreign` (`company_id`),
  KEY `time_off_leave_mandatory_days_creator_id_foreign` (`creator_id`),
  CONSTRAINT `time_off_leave_mandatory_days_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `time_off_leave_mandatory_days_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_off_leave_mandatory_days`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `time_off_leave_mandatory_days` WRITE;
/*!40000 ALTER TABLE `time_off_leave_mandatory_days` DISABLE KEYS */;
INSERT INTO `time_off_leave_mandatory_days` VALUES
(3,1,1,'#FF0000','New Year','2021-12-31 22:00:00','2021-12-31 22:00:00','2026-04-24 05:31:04','2026-04-24 05:31:04'),
(4,1,1,'#FF0000','Christmas','2022-12-24 22:00:00','2022-12-24 22:00:00','2026-04-24 05:31:04','2026-04-24 05:31:04');
/*!40000 ALTER TABLE `time_off_leave_mandatory_days` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `time_off_leave_types`
--

DROP TABLE IF EXISTS `time_off_leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_off_leave_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort Order',
  `color` varchar(255) DEFAULT NULL COMMENT 'Color',
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `max_allowed_negative` int(11) DEFAULT NULL COMMENT 'Max Allowed Negative',
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `leave_validation_type` enum('no_validation','hr','manager','both') DEFAULT 'hr' COMMENT 'Leave Validation Type',
  `requires_allocation` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'Requires Allocation',
  `employee_requests` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'Employee Requests',
  `allocation_validation_type` enum('no_validation','hr','manager','both') DEFAULT 'hr' COMMENT 'Allocation Validation Type',
  `time_type` enum('leave','other') DEFAULT 'leave' COMMENT 'Time Type',
  `request_unit` enum('day','half_day','hour') NOT NULL DEFAULT 'day' COMMENT 'Request Unit',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `create_calendar_meeting` tinyint(1) DEFAULT NULL COMMENT 'Create Calendar Meeting',
  `is_active` tinyint(1) DEFAULT NULL COMMENT 'Is Active',
  `show_on_dashboard` tinyint(1) DEFAULT NULL COMMENT 'Show On Dashboard',
  `unpaid` tinyint(1) DEFAULT NULL COMMENT 'Unpaid',
  `include_public_holidays_in_duration` tinyint(1) DEFAULT NULL COMMENT 'Include Public Holidays In Duration',
  `support_document` tinyint(1) DEFAULT NULL COMMENT 'Support Document Required',
  `allows_negative` tinyint(1) DEFAULT NULL COMMENT 'Allows Negative',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time_off_leave_types_company_id_foreign` (`company_id`),
  KEY `time_off_leave_types_creator_id_foreign` (`creator_id`),
  CONSTRAINT `time_off_leave_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `time_off_leave_types_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_off_leave_types`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `time_off_leave_types` WRITE;
/*!40000 ALTER TABLE `time_off_leave_types` DISABLE KEYS */;
INSERT INTO `time_off_leave_types` VALUES
(19,1,'#956598',1,20,1,'both','yes','no','hr','leave','day','Training Time Off',1,1,1,0,0,0,NULL,NULL,'2026-04-24 05:31:04','2026-04-24 05:31:04'),
(20,1,'#6C31CC',1,NULL,1,'both','yes','no','hr','leave','day','Paid Time Off',1,1,1,0,0,0,NULL,NULL,'2026-04-24 05:31:04','2026-04-24 05:31:04'),
(21,3,'#ADA02C',1,NULL,1,'manager','yes','no','hr','leave','day','Parental Leaves',1,1,1,0,0,0,NULL,NULL,'2026-04-24 05:31:04','2026-04-24 05:31:04'),
(22,4,'#34A8A1',1,NULL,1,'manager','yes','yes','hr','leave','day','Compensatory Days test',1,1,1,0,1,1,1,NULL,'2026-04-24 05:31:04','2026-04-24 05:31:04'),
(23,5,'#EFB6F1',1,NULL,1,'both','no','no','hr','leave','day','Sick Time Off',1,1,1,0,1,1,NULL,NULL,'2026-04-24 05:31:04','2026-04-24 05:31:04'),
(24,6,'#AF4EF4',1,NULL,1,'both','yes','no','hr','leave','hour','Unpaid',1,1,1,1,0,NULL,1,NULL,'2026-04-24 05:31:04','2026-04-24 05:31:04');
/*!40000 ALTER TABLE `time_off_leave_types` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `time_off_leaves`
--

DROP TABLE IF EXISTS `time_off_leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_off_leaves` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `manager_id` bigint(20) unsigned DEFAULT NULL,
  `holiday_status_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `employee_company_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `calendar_id` bigint(20) unsigned DEFAULT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  `first_approver_id` bigint(20) unsigned DEFAULT NULL,
  `second_approver_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `private_name` text DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `duration_display` varchar(255) DEFAULT NULL,
  `request_date_from_period` varchar(255) DEFAULT NULL,
  `request_date_from` timestamp NULL DEFAULT NULL,
  `request_date_to` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `request_unit_half` tinyint(1) DEFAULT NULL,
  `request_unit_hours` tinyint(1) DEFAULT NULL,
  `date_from` timestamp NULL DEFAULT NULL,
  `date_to` timestamp NULL DEFAULT NULL,
  `number_of_days` decimal(15,4) DEFAULT 0.0000,
  `number_of_hours` decimal(15,4) DEFAULT 0.0000,
  `request_hour_from` decimal(15,4) DEFAULT 0.0000,
  `request_hour_to` decimal(15,4) DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time_off_leaves_user_id_foreign` (`user_id`),
  KEY `time_off_leaves_manager_id_foreign` (`manager_id`),
  KEY `time_off_leaves_holiday_status_id_foreign` (`holiday_status_id`),
  KEY `time_off_leaves_employee_id_foreign` (`employee_id`),
  KEY `time_off_leaves_employee_company_id_foreign` (`employee_company_id`),
  KEY `time_off_leaves_company_id_foreign` (`company_id`),
  KEY `time_off_leaves_department_id_foreign` (`department_id`),
  KEY `time_off_leaves_calendar_id_foreign` (`calendar_id`),
  KEY `time_off_leaves_first_approver_id_foreign` (`first_approver_id`),
  KEY `time_off_leaves_second_approver_id_foreign` (`second_approver_id`),
  KEY `time_off_leaves_creator_id_foreign` (`creator_id`),
  CONSTRAINT `time_off_leaves_calendar_id_foreign` FOREIGN KEY (`calendar_id`) REFERENCES `calendars` (`id`) ON DELETE SET NULL,
  CONSTRAINT `time_off_leaves_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `time_off_leaves_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `time_off_leaves_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `employees_departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `time_off_leaves_employee_company_id_foreign` FOREIGN KEY (`employee_company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `time_off_leaves_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees_employees` (`id`),
  CONSTRAINT `time_off_leaves_first_approver_id_foreign` FOREIGN KEY (`first_approver_id`) REFERENCES `employees_employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `time_off_leaves_holiday_status_id_foreign` FOREIGN KEY (`holiday_status_id`) REFERENCES `time_off_leave_types` (`id`),
  CONSTRAINT `time_off_leaves_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `employees_employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `time_off_leaves_second_approver_id_foreign` FOREIGN KEY (`second_approver_id`) REFERENCES `employees_employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `time_off_leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_off_leaves`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `time_off_leaves` WRITE;
/*!40000 ALTER TABLE `time_off_leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_off_leaves` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `time_off_user_leave_types`
--

DROP TABLE IF EXISTS `time_off_user_leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_off_user_leave_types` (
  `user_id` bigint(20) unsigned NOT NULL,
  `leave_type_id` bigint(20) unsigned NOT NULL,
  KEY `time_off_user_leave_types_user_id_foreign` (`user_id`),
  KEY `time_off_user_leave_types_leave_type_id_foreign` (`leave_type_id`),
  CONSTRAINT `time_off_user_leave_types_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `time_off_leave_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `time_off_user_leave_types_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_off_user_leave_types`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `time_off_user_leave_types` WRITE;
/*!40000 ALTER TABLE `time_off_user_leave_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_off_user_leave_types` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `unit_of_measure_categories`
--

DROP TABLE IF EXISTS `unit_of_measure_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit_of_measure_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_of_measure_categories_creator_id_foreign` (`creator_id`),
  CONSTRAINT `unit_of_measure_categories_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_of_measure_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `unit_of_measure_categories` WRITE;
/*!40000 ALTER TABLE `unit_of_measure_categories` DISABLE KEYS */;
INSERT INTO `unit_of_measure_categories` VALUES
(1,'Unit',1,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(2,'Weight',1,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(3,'Working Time',1,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(4,'Length / Distance',1,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(5,'Surface',1,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(6,'Volume',1,'2026-04-23 20:44:25','2026-04-23 20:44:25');
/*!40000 ALTER TABLE `unit_of_measure_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `unit_of_measures`
--

DROP TABLE IF EXISTS `unit_of_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit_of_measures` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `factor` double DEFAULT 0,
  `rounding` decimal(15,4) DEFAULT 0.0000,
  `category_id` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_of_measures_category_id_foreign` (`category_id`),
  KEY `unit_of_measures_creator_id_foreign` (`creator_id`),
  CONSTRAINT `unit_of_measures_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `unit_of_measure_categories` (`id`),
  CONSTRAINT `unit_of_measures_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_of_measures`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `unit_of_measures` WRITE;
/*!40000 ALTER TABLE `unit_of_measures` DISABLE KEYS */;
INSERT INTO `unit_of_measures` VALUES
(1,'reference','Units',1,0.0100,1,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(2,'bigger','Dozens',0.083333333333333,0.0100,1,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(3,'reference','kg',1,0.0100,2,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(4,'smaller','g',1000,0.0100,2,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(5,'bigger','t',0.001,0.0100,2,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(6,'smaller','lb',2.20462,0.0100,2,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(7,'smaller','oz',35.274,0.0100,2,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(8,'reference','Days',8,0.0100,3,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(9,'bigger','Hours',1,0.0100,3,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(10,'reference','m',1,0.0100,4,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(11,'smaller','mm',1000,0.0100,4,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(12,'bigger','km',0.001,0.0100,4,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(13,'smaller','cm',100,0.0100,4,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(14,'smaller','in',39.3701,0.0100,4,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(15,'smaller','ft',3.28084,0.0100,4,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(16,'smaller','yd',1.09361,0.0100,4,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(17,'bigger','mi',1.09361,0.0100,4,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(18,'reference','m²',1,0.0100,5,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(19,'smaller','ft²',10.76391,0.0100,5,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(20,'reference','L',1,0.0100,6,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(21,'bigger','m³',0.001,0.0100,6,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(22,'smaller','fl oz (US)',33.814,0.0100,6,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(23,'smaller','qt (US)',1.05669,0.0100,6,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(24,'bigger','gal (US)',0.26417217685799,0.0100,6,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(25,'smaller','in³',61.0237,0.0100,6,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(26,'bigger','ft³',0.035314724827664,0.0100,6,1,NULL,'2026-04-23 20:44:25','2026-04-23 20:44:25');
/*!40000 ALTER TABLE `unit_of_measures` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `user_allowed_companies`
--

DROP TABLE IF EXISTS `user_allowed_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_allowed_companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_allowed_companies_user_id_foreign` (`user_id`),
  KEY `user_allowed_companies_company_id_foreign` (`company_id`),
  CONSTRAINT `user_allowed_companies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_allowed_companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_allowed_companies`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `user_allowed_companies` WRITE;
/*!40000 ALTER TABLE `user_allowed_companies` DISABLE KEYS */;
INSERT INTO `user_allowed_companies` VALUES
(9,12,1),
(10,13,1),
(11,14,1);
/*!40000 ALTER TABLE `user_allowed_companies` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `user_invitations`
--

DROP TABLE IF EXISTS `user_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invitations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `user_invitations` WRITE;
/*!40000 ALTER TABLE `user_invitations` DISABLE KEYS */;
INSERT INTO `user_invitations` VALUES
(1,'maicsebakara@gmail.com','2026-04-24 13:24:43','2026-04-24 13:24:43'),
(2,'maicsebakara@gmail.com','2026-04-24 13:28:27','2026-04-24 13:28:27'),
(5,'tricia.ingabire@kwikkoders.com','2026-05-06 07:13:13','2026-05-06 07:13:13');
/*!40000 ALTER TABLE `user_invitations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `user_team`
--

DROP TABLE IF EXISTS `user_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_team` (
  `user_id` bigint(20) unsigned NOT NULL,
  `team_id` bigint(20) unsigned NOT NULL,
  KEY `user_team_user_id_foreign` (`user_id`),
  KEY `user_team_team_id_foreign` (`team_id`),
  CONSTRAINT `user_team_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_team_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_team`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `user_team` WRITE;
/*!40000 ALTER TABLE `user_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_team` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `password` varchar(255) NOT NULL,
  `resource_permission` enum('group','individual','global') NOT NULL DEFAULT 'individual',
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default_company_id` bigint(20) unsigned DEFAULT NULL,
  `partner_id` bigint(20) unsigned DEFAULT NULL,
  `app_authentication_secret` text DEFAULT NULL,
  `app_authentication_recovery_codes` text DEFAULT NULL,
  `has_email_authentication` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_default_company_id_foreign` (`default_company_id`),
  KEY `users_partner_id_foreign` (`partner_id`),
  KEY `users_creator_id_foreign` (`creator_id`),
  CONSTRAINT `users_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_default_company_id_foreign` FOREIGN KEY (`default_company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `users_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners_partners` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,1,NULL,'kwikkoders','admin@example.com',NULL,NULL,1,'$2y$12$C73lRGosMKrwyOZNOYHVo.zyKzPaXjXJYYGroMTIzU3d7mmWUxZNy','global','1qb884WZGPkhcZPxPa9JPoTMt1YNB44XlgGFuc9p2PlkyBZjgmpTJ6v6Susk',NULL,'2026-04-23 20:45:03','2026-04-23 20:45:03',1,2,NULL,NULL,0),
(12,0,1,'Maic Sebakara','maicseba@gmail.com',NULL,NULL,1,'$2y$12$RedXHoBXpimqDyoDTMOceew1U9ZLaQiB.P1kkESLXwZ1h.Y1IG5Oe','individual',NULL,NULL,'2026-05-06 20:25:33','2026-05-06 20:35:45',1,534,NULL,NULL,0),
(13,0,1,'Mavenge Mavin','maic.sebakara@kwikkoders.com',NULL,NULL,1,'$2y$12$eVvxgMtaLPs8kLL7.4FYrO/XP4RP5RO4DILskg7ebtn/gFeM1J5y2','individual',NULL,NULL,'2026-05-06 20:56:06','2026-05-06 21:10:29',1,536,NULL,NULL,0),
(14,0,1,'Mugisha Muneza','rwandicp@gmail.com',NULL,NULL,1,'$2y$12$W3He7waaB5usXfnAZc4HxeVDfpOvq/eGNuh/awvSnfNTomF9frbiK','individual',NULL,NULL,'2026-05-08 05:32:50','2026-05-08 05:35:18',1,538,NULL,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `utm_campaigns`
--

DROP TABLE IF EXISTS `utm_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `utm_campaigns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Responsible user',
  `stage_id` bigint(20) unsigned NOT NULL COMMENT 'Stage',
  `color` varchar(255) DEFAULT NULL COMMENT 'Color',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `name` varchar(255) NOT NULL COMMENT 'Campaign Identifier',
  `title` varchar(255) NOT NULL COMMENT 'Campaign Name',
  `is_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Is Active',
  `is_auto_campaign` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Is Auto Campaign',
  `company_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Company',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `utm_campaigns_user_id_foreign` (`user_id`),
  KEY `utm_campaigns_stage_id_foreign` (`stage_id`),
  KEY `utm_campaigns_company_id_foreign` (`company_id`),
  KEY `utm_campaigns_creator_id_foreign` (`creator_id`),
  CONSTRAINT `utm_campaigns_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `utm_campaigns_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `utm_campaigns_stage_id_foreign` FOREIGN KEY (`stage_id`) REFERENCES `utm_stages` (`id`),
  CONSTRAINT `utm_campaigns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utm_campaigns`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `utm_campaigns` WRITE;
/*!40000 ALTER TABLE `utm_campaigns` DISABLE KEYS */;
INSERT INTO `utm_campaigns` VALUES
(1,NULL,1,NULL,1,'Sale','Sale',1,1,1,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(2,NULL,1,NULL,1,'Christmas Special','Christmas Special',1,1,1,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(3,NULL,1,NULL,1,'Email Campaign - Services','Email Campaign - Services',1,1,1,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(4,NULL,1,NULL,1,'Email Campaign - Products','Email Campaign - Products',1,1,1,'2026-04-23 20:44:25','2026-04-23 20:44:25');
/*!40000 ALTER TABLE `utm_campaigns` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `utm_mediums`
--

DROP TABLE IF EXISTS `utm_mediums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `utm_mediums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `utm_mediums_creator_id_foreign` (`creator_id`),
  CONSTRAINT `utm_mediums_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utm_mediums`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `utm_mediums` WRITE;
/*!40000 ALTER TABLE `utm_mediums` DISABLE KEYS */;
INSERT INTO `utm_mediums` VALUES
(1,1,'Phone','2026-04-23 20:44:25','2026-04-23 20:44:25'),
(2,1,'Direct','2026-04-23 20:44:25','2026-04-23 20:44:25'),
(3,1,'Email','2026-04-23 20:44:25','2026-04-23 20:44:25'),
(4,1,'Banner','2026-04-23 20:44:25','2026-04-23 20:44:25'),
(5,1,'X','2026-04-23 20:44:25','2026-04-23 20:44:25'),
(6,1,'Facebook','2026-04-23 20:44:25','2026-04-23 20:44:25'),
(7,1,'LinkedIn','2026-04-23 20:44:25','2026-04-23 20:44:25'),
(8,1,'Television','2026-04-23 20:44:25','2026-04-23 20:44:25'),
(9,1,'Google','2026-04-23 20:44:25','2026-04-23 20:44:25');
/*!40000 ALTER TABLE `utm_mediums` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `utm_sources`
--

DROP TABLE IF EXISTS `utm_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `utm_sources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `utm_sources_creator_id_foreign` (`creator_id`),
  CONSTRAINT `utm_sources_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utm_sources`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `utm_sources` WRITE;
/*!40000 ALTER TABLE `utm_sources` DISABLE KEYS */;
INSERT INTO `utm_sources` VALUES
(1,NULL,'Search engine','2026-04-23 20:44:25','2026-04-23 20:44:25'),
(2,NULL,'Lead Recall','2026-04-23 20:44:25','2026-04-23 20:44:25'),
(3,NULL,'Newsletter','2026-04-23 20:44:25','2026-04-23 20:44:25'),
(4,NULL,'Facebook','2026-04-23 20:44:25','2026-04-23 20:44:25'),
(5,NULL,'X','2026-04-23 20:44:25','2026-04-23 20:44:25'),
(6,NULL,'LinkedIn','2026-04-23 20:44:25','2026-04-23 20:44:25'),
(7,NULL,'Monster','2026-04-23 20:44:25','2026-04-23 20:44:25'),
(8,NULL,'Glassdoor','2026-04-23 20:44:25','2026-04-23 20:44:25'),
(9,NULL,'Craigslist','2026-04-23 20:44:25','2026-04-23 20:44:25');
/*!40000 ALTER TABLE `utm_sources` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `utm_stages`
--

DROP TABLE IF EXISTS `utm_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `utm_stages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT 'Sort Order',
  `name` varchar(255) NOT NULL COMMENT 'Name',
  `creator_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Created By',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `utm_stages_creator_id_foreign` (`creator_id`),
  CONSTRAINT `utm_stages_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utm_stages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `utm_stages` WRITE;
/*!40000 ALTER TABLE `utm_stages` DISABLE KEYS */;
INSERT INTO `utm_stages` VALUES
(1,1,'New',1,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(2,2,'Schedule',1,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(3,3,'Design',1,'2026-04-23 20:44:25','2026-04-23 20:44:25'),
(4,3,'Sent',1,'2026-04-23 20:44:25','2026-04-23 20:44:25');
/*!40000 ALTER TABLE `utm_stages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `website_pages`
--

DROP TABLE IF EXISTS `website_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `is_header_visible` tinyint(1) NOT NULL DEFAULT 0,
  `is_footer_visible` tinyint(1) NOT NULL DEFAULT 0,
  `published_at` datetime DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `creator_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_pages_slug_unique` (`slug`),
  KEY `website_pages_creator_id_foreign` (`creator_id`),
  CONSTRAINT `website_pages_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_pages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `website_pages` WRITE;
/*!40000 ALTER TABLE `website_pages` DISABLE KEYS */;
INSERT INTO `website_pages` VALUES
(9,'Home','Home Content','home',1,0,0,'2026-04-24 07:35:29','Home','home','Home Description',1,NULL,'2026-04-24 05:35:29','2026-04-24 05:35:29'),
(10,'About Us','About Us Content','about-us',1,1,1,'2026-04-24 07:35:29','About Us','about us','About Us Description',1,NULL,'2026-04-24 05:35:29','2026-04-24 05:35:29'),
(11,'Privacy Policy','Privacy Policy Content','privacy-policy',1,0,1,'2026-04-24 07:35:29','Privacy Policy','privacy policy','Privacy Policy Description',1,NULL,'2026-04-24 05:35:29','2026-04-24 05:35:29'),
(12,'Terms & Conditions','Terms & Conditions Content','terms-conditions',1,0,1,'2026-04-24 07:35:29','Terms & Conditions','terms & conditions','Terms & Conditions Description',1,NULL,'2026-04-24 05:35:29','2026-04-24 05:35:29');
/*!40000 ALTER TABLE `website_pages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-05-08  9:38:35
