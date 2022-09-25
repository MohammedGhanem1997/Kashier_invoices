-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2022 at 04:55 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kashier`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `stripe_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ghanem', 'admin@admin.com', '2022-09-21 22:00:00', '$2y$10$4jMElFuSH8wv1xvLEPr13.w7iF.nqnYFiYKI8yDROo5kQW3UKnata', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customerName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalAmount` double(8,2) NOT NULL,
  `dueDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `paymentRequestId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paymentStatus` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `installment_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `transaction_id`, `customerName`, `totalAmount`, `dueDate`, `paymentRequestId`, `paymentStatus`, `email`, `user_id`, `installment_id`, `created_at`, `updated_at`) VALUES
(13, '632f3874c2bf1c00155ce9de', 'ghanem', 90.00, '2022-09-24 17:42:44', 'INV-1902526139', 'paid', 'ghanemm138@gmail.com', 1, 41, '2022-09-24 15:03:48', '2022-09-24 15:42:44'),
(14, '632f8ec11829ce0013314ba1', 'ghanem', 30.00, '2022-09-24 23:34:37', 'INV-1902526140', 'paid', 'ghanemm138@gmail.com', 2, 42, '2022-09-24 21:12:00', '2022-09-24 21:34:37'),
(15, '632faecdc2bf1c00155cea3f', 'ghanem', 60.00, '2022-09-24 23:28:41', 'INV-1902526141', 'unpaid', 'ghanemm138@gmail.com', 3, 45, '2022-09-24 23:28:43', '2022-09-24 23:28:43'),
(16, '632fafa41829ce0013314be0', 'ghanem', 60.00, '2022-09-24 23:32:17', 'INV-1902526142', 'unpaid', 'ghanemm138@gmail.com', 4, 47, '2022-09-24 23:32:19', '2022-09-24 23:32:19'),
(17, '632fb0221829ce0013314beb', 'ghanem', 90.00, '2022-09-24 23:34:24', 'INV-1902526143', 'unpaid', 'ghanemm138@gmail.com', 6, 49, '2022-09-24 23:34:24', '2022-09-24 23:34:24'),
(18, '632fb1dfc2bf1c00155cea60', 'ghanem', 60.00, '2022-09-24 23:41:49', 'INV-1902526144', 'unpaid', 'ghanemm138@gmail.com', 7, 50, '2022-09-24 23:41:50', '2022-09-24 23:41:50'),
(19, '632fb23f1829ce0013314c08', 'ghanem', 90.00, '2022-09-24 23:43:24', 'INV-1902526145', 'unpaid', 'test12@yahoo.com', 8, 52, '2022-09-24 23:43:25', '2022-09-24 23:43:25'),
(20, '632fb3ba1829ce0013314c23', 'ghanem', 90.00, '2022-09-25 12:19:56', 'INV-1902526146', 'unpaid', 'ghanem222@gmail.com', 9, 53, '2022-09-23 23:49:45', '2022-09-24 23:49:45');

-- --------------------------------------------------------

--
-- Table structure for table `istallments`
--

CREATE TABLE `istallments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dueDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `quantity` tinyint(4) NOT NULL,
  `unitPrice` double(8,2) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `istallments`
--

INSERT INTO `istallments` (`id`, `dueDate`, `quantity`, `unitPrice`, `description`, `order_id`, `created_at`, `updated_at`) VALUES
(41, '2022-09-24 15:03:47', 1, 90.00, 'installment1from1', 138, '2022-09-24 15:03:47', '2022-09-24 15:03:47'),
(42, '2022-09-24 21:11:58', 1, 30.00, 'installment1from3', 139, '2022-09-24 21:11:58', '2022-09-24 21:11:58'),
(43, '2022-10-24 21:12:01', 2, 30.00, 'installment2from3', 139, '2022-09-24 21:12:01', '2022-09-24 21:12:01'),
(44, '2022-11-24 21:12:01', 3, 30.00, 'installment3from3', 139, '2022-09-24 21:12:01', '2022-09-24 21:12:01'),
(45, '2022-09-24 23:28:41', 2, 60.00, 'installment 1 from 2', 140, '2022-09-24 23:28:41', '2022-09-24 23:28:41'),
(46, '2022-10-24 23:28:42', 1, 30.00, 'installment 2 from 2', 140, '2022-09-24 23:28:42', '2022-09-24 23:28:42'),
(47, '2022-09-24 23:32:17', 2, 60.00, 'installment 1 from 2', 141, '2022-09-24 23:32:17', '2022-09-24 23:32:17'),
(48, '2022-10-24 23:32:17', 1, 30.00, 'installment 2 from 2', 141, '2022-09-24 23:32:17', '2022-09-24 23:32:17'),
(49, '2022-09-24 23:34:24', 1, 90.00, 'installment1from1', 142, '2022-09-24 23:34:24', '2022-09-24 23:34:24'),
(50, '2022-09-24 23:41:49', 2, 60.00, 'installment 1 from 2', 143, '2022-09-24 23:41:49', '2022-09-24 23:41:49'),
(51, '2022-10-24 23:41:49', 1, 30.00, 'installment 2 from 2', 143, '2022-09-24 23:41:49', '2022-09-24 23:41:49'),
(52, '2022-09-24 23:43:24', 1, 90.00, 'installment1from1', 144, '2022-09-24 23:43:24', '2022-09-24 23:43:24'),
(53, '2022-09-24 23:49:44', 1, 90.00, 'installment1from1', 145, '2022-09-24 23:49:44', '2022-09-24 23:49:44');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_09_21_151213_create_orders_table', 2),
(6, '2022_09_21_151721_create_packages_table', 2),
(9, '2022_09_23_140606_create_admins_table', 3),
(10, '2020_01_01_000001_create_plans_table', 4),
(11, '2020_01_01_000002_create_plan_features_table', 5),
(12, '2020_01_01_000003_create_plan_subscriptions_table', 6),
(13, '2020_01_01_000004_create_plan_subscription_usage_table', 7),
(15, '2022_09_24_155229_add_email_to_orders_table', 8),
(17, '2022_09_21_185948_create_istallments_table', 10),
(18, '2022_09_24_154300_create_invoices_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `package-id` bigint(20) NOT NULL,
  `totalAmount` double(8,2) NOT NULL,
  `installments_quantity` tinyint(4) NOT NULL,
  `dueDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ghanemm138@gmail.com'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `user_id`, `package-id`, `totalAmount`, `installments_quantity`, `dueDate`, `status`, `created_at`, `updated_at`, `email`) VALUES
(138, 'ghanem', 1, 5, 90.00, 1, '2022-09-24 15:03:47', 1, '2022-09-24 15:03:47', '2022-09-24 15:03:47', 'ghanemm138@gmail.com'),
(139, 'mohammed', 2, 5, 90.00, 3, '2022-09-24 21:11:58', 1, '2022-09-24 21:11:58', '2022-09-24 21:11:58', 'ghanemm138@gmail.com'),
(140, 'Al_Ghanem', 3, 5, 90.00, 2, '2022-11-24 23:28:40', 0, '2022-09-24 23:28:40', '2022-09-24 23:28:40', 'ghanemm138@gmail.com'),
(141, 'mohammed77', 4, 5, 90.00, 2, '2022-11-24 23:32:17', 0, '2022-09-24 23:32:17', '2022-09-24 23:32:17', 'ghanemm138@gmail.com'),
(142, 'test', 6, 5, 90.00, 1, '2022-10-24 23:34:23', 0, '2022-09-24 23:34:23', '2022-09-24 23:34:23', 'ghanemm138@gmail.com'),
(143, 'test@gmail.com', 7, 5, 90.00, 2, '2022-11-24 23:41:48', 0, '2022-09-24 23:41:48', '2022-09-24 23:41:48', 'ghanemm138@gmail.com'),
(144, 'test', 8, 5, 90.00, 1, '2022-10-24 23:43:24', 0, '2022-09-24 23:43:24', '2022-09-24 23:43:24', 'test12@yahoo.com'),
(145, 'mohammed222', 9, 5, 90.00, 1, '2022-10-24 23:49:44', 0, '2022-09-24 23:49:44', '2022-09-24 23:49:44', 'ghanem222@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `signup_fee` decimal(8,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trial_period` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `trial_interval` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'day',
  `invoice_period` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `invoice_interval` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `grace_period` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `grace_interval` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'day',
  `prorate_day` tinyint(3) UNSIGNED DEFAULT NULL,
  `prorate_period` tinyint(3) UNSIGNED DEFAULT NULL,
  `prorate_extend_due` tinyint(3) UNSIGNED DEFAULT NULL,
  `active_subscribers_limit` smallint(5) UNSIGNED DEFAULT NULL,
  `sort_order` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `slug`, `name`, `description`, `is_active`, `price`, `signup_fee`, `currency`, `trial_period`, `trial_interval`, `invoice_period`, `invoice_interval`, `grace_period`, `grace_interval`, `prorate_day`, `prorate_period`, `prorate_extend_due`, `active_subscribers_limit`, `sort_order`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 'pro', '{\"en\":\"Pro\"}', '{\"en\":\"Pro plan\"}', 1, '100.00', '0.00', 'USD', 15, 'day', 3, 'month', 0, 'day', NULL, NULL, NULL, NULL, 1, '2022-09-24 10:59:35', '2022-09-24 10:59:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `plan_features`
--

CREATE TABLE `plan_features` (
  `id` int(10) UNSIGNED NOT NULL,
  `plan_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resettable_period` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `resettable_interval` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `sort_order` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_features`
--

INSERT INTO `plan_features` (`id`, `plan_id`, `slug`, `name`, `description`, `value`, `resettable_period`, `resettable_interval`, `sort_order`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 5, 'period', '{\"en\":\"period\"}', NULL, '90', 1, 'month', 1, '2022-09-24 22:42:48', '2022-09-24 22:42:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `plan_subscriptions`
--

CREATE TABLE `plan_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `subscriber_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscriber_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `trial_ends_at` datetime DEFAULT NULL,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `cancels_at` datetime DEFAULT NULL,
  `canceled_at` datetime DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_subscriptions`
--

INSERT INTO `plan_subscriptions` (`id`, `subscriber_type`, `subscriber_id`, `plan_id`, `slug`, `name`, `description`, `trial_ends_at`, `starts_at`, `ends_at`, `cancels_at`, `canceled_at`, `timezone`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 'App\\Models\\User', 1, 5, 'ghanem', '{\"en\":\"ghanem\"}', NULL, '2022-10-10 00:44:11', '2022-10-10 00:44:11', '2023-01-10 00:44:11', NULL, NULL, NULL, '2022-09-24 22:44:11', '2022-09-24 22:44:11', NULL),
(18, 'App\\Models\\User', 2, 5, 'mohammed', '{\"en\":\"mohammed\"}', NULL, '2022-10-10 00:44:12', '2022-10-10 00:44:12', '2023-01-10 00:44:12', NULL, NULL, NULL, '2022-09-24 22:44:12', '2022-09-24 22:44:12', NULL),
(19, 'App\\Models\\User', 3, 5, 'al-ghanem', '{\"en\":\"Al_Ghanem\"}', NULL, '2022-10-10 01:28:55', '2022-10-10 01:28:55', '2023-01-10 01:28:55', NULL, NULL, NULL, '2022-09-24 23:28:55', '2022-09-24 23:28:55', NULL),
(20, 'App\\Models\\User', 4, 5, 'mohammed77', '{\"en\":\"mohammed77\"}', NULL, '2022-10-10 01:32:26', '2022-10-10 01:32:26', '2023-01-10 01:32:26', NULL, NULL, NULL, '2022-09-24 23:32:26', '2022-09-24 23:32:26', NULL),
(21, 'App\\Models\\User', 6, 5, 'test', '{\"en\":\"test\"}', NULL, '2022-10-10 01:34:36', '2022-10-10 01:34:36', '2023-01-10 01:34:36', NULL, NULL, NULL, '2022-09-24 23:34:36', '2022-09-24 23:34:36', NULL),
(22, 'App\\Models\\User', 7, 5, 'test-1', '{\"en\":\"test\"}', NULL, '2022-10-10 01:41:58', '2022-10-10 01:41:58', '2023-01-10 01:41:58', NULL, NULL, NULL, '2022-09-24 23:41:58', '2022-09-24 23:41:58', NULL),
(23, 'App\\Models\\User', 8, 5, 'test-2', '{\"en\":\"test\"}', NULL, '2022-10-10 01:43:36', '2022-10-10 01:43:36', '2023-01-10 01:43:36', NULL, NULL, NULL, '2022-09-24 23:43:36', '2022-09-24 23:43:36', NULL),
(24, 'App\\Models\\User', 9, 5, 'mohammed222', '{\"en\":\"mohammed222\"}', NULL, '2022-10-10 01:49:54', '2022-10-10 01:49:54', '2023-01-10 01:49:54', NULL, NULL, NULL, '2022-09-24 23:49:54', '2022-09-24 23:49:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `plan_subscription_usage`
--

CREATE TABLE `plan_subscription_usage` (
  `id` int(10) UNSIGNED NOT NULL,
  `subscription_id` int(10) UNSIGNED NOT NULL,
  `feature_id` int(10) UNSIGNED NOT NULL,
  `used` smallint(5) UNSIGNED NOT NULL,
  `valid_until` datetime DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_subscription_usage`
--

INSERT INTO `plan_subscription_usage` (`id`, `subscription_id`, `feature_id`, `used`, `valid_until`, `timezone`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 17, 17, 1, '2022-10-25 00:44:11', NULL, '2022-09-24 22:44:11', '2022-09-24 22:44:11', NULL),
(8, 18, 17, 3, '2022-10-25 00:44:12', NULL, '2022-09-24 22:44:12', '2022-09-24 22:44:12', NULL),
(9, 20, 17, 2, '2022-10-25 01:32:26', NULL, '2022-09-24 23:32:28', '2022-09-24 23:32:28', NULL),
(10, 21, 17, 1, '2022-10-25 01:34:36', NULL, '2022-09-24 23:34:36', '2022-09-24 23:34:36', NULL),
(11, 24, 17, 1, '2022-10-25 01:49:54', NULL, '2022-09-24 23:49:55', '2022-09-24 23:49:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `stripe_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ghanem', 'ghanem@gmail.com', '2022-09-16 22:00:00', '$2y$10$4jMElFuSH8wv1xvLEPr13.w7iF.nqnYFiYKI8yDROo5kQW3UKnata', NULL, NULL, NULL, NULL),
(2, 'mohammed', 'ghanem1@gmail.com', NULL, '$2y$10$ePiEQXdDH7cyNGU/BoJk0OPuy.Re6/ojrgwJ9ig1or15nrnyqJLzO', NULL, NULL, '2022-09-21 17:32:44', '2022-09-21 17:32:44'),
(3, 'Al_Ghanem', 'ghanem3@gmail.com', NULL, '$2y$10$cvmL/reqRkVYiCGyxjbZq.dd3BuYkRqEn9KNpVMbpZ65eA8Nbwc/u', NULL, NULL, '2022-09-24 22:59:09', '2022-09-24 22:59:09'),
(4, 'mohammed77', 'ghanem12@gmail.com', NULL, '$2y$10$xexwvLFviyLGHtd/jHWoHuf1W1Q33EF3p4yF6bS4oaBEMhVKVAIo.', NULL, NULL, '2022-09-24 23:31:39', '2022-09-24 23:31:39'),
(6, 'test', 'ghanem22@gmail.com', NULL, '$2y$10$E4xlnrRyWSn8BF9dsRltYur/xKJJPcanyu1Dqs.1lSez9/iO9/l6O', NULL, NULL, '2022-09-24 23:34:04', '2022-09-24 23:34:04'),
(7, 'test', 'test@gmail.com', NULL, '$2y$10$/vPBj/nM0U49ib6YA1o85ehjSMcfWLXEV5MjQc0Vh8d5wi/hI/XAe', NULL, NULL, '2022-09-24 23:41:38', '2022-09-24 23:41:38'),
(8, 'test', 'test12@yahoo.com', NULL, '$2y$10$ngl6L1VPNO207wabWCiUr.5UEOhWLXIqXPt/4pEpsRFz6Q46VTTFq', NULL, NULL, '2022-09-24 23:43:15', '2022-09-24 23:43:15'),
(9, 'mohammed222', 'ghanem222@gmail.com', NULL, '$2y$10$bqKf.DKwUgAZRt4qS2tsKee5oZRr6YGdoGgIrC47rKag/8pBxNw9u', NULL, NULL, '2022-09-24 23:49:25', '2022-09-24 23:49:25'),
(10, 'Brenden Jast MD', 'fmorissette@example.com', '2022-09-25 10:31:09', '$2y$10$eD30UrQ.DusNA9WYW0Tx3exDYdpWKC4pLVlHXBZulMLrZKDd9uxam', 'n7sqDUlUGf', '5yaiULW3qb', '2022-09-25 10:31:18', '2022-09-25 10:31:18'),
(11, 'Bailee Raynor Sr.', 'frances.tillman@example.net', '2022-09-25 10:31:10', '$2y$10$LeeMChJWSO.D4wcSDbxpDuqZWvA4q8ATiJy5UX5By7PUMLVJ6v5dC', 'mp76qG5UCH', 'R63QHKnoOC', '2022-09-25 10:31:18', '2022-09-25 10:31:18'),
(12, 'Raheem Lockman', 'ghaley@example.net', '2022-09-25 10:31:10', '$2y$10$5mzfiLCkMjdVNCpqGXNDyuN/8LHw9lO6cM.F24oE9uimrOj3skNNC', 'GtIVtrnqBs', 'ViwldrS3tB', '2022-09-25 10:31:18', '2022-09-25 10:31:18'),
(13, 'Nick Hettinger', 'jklein@example.org', '2022-09-25 10:31:10', '$2y$10$79eBw4KEuuCNAHHYzok2k.WONVDIYPEUYgv2ueUNPNqRe1FMtShoe', 'rUpST3D70r', 'wKI04By6d4', '2022-09-25 10:31:18', '2022-09-25 10:31:18'),
(14, 'Mason Watsica', 'bernardo77@example.com', '2022-09-25 10:31:10', '$2y$10$Z3toxg.MZvu.mwVGP7LGPu8myr2GjPzvcs7dLB7a3AlC4Mp1vsfsW', 'XLKaqUQrm3', 'SlZeVGule9', '2022-09-25 10:31:18', '2022-09-25 10:31:18'),
(15, 'John Torphy', 'collin08@example.net', '2022-09-25 10:31:10', '$2y$10$7jowwA2/ArVqL7BSH50HkufFbRP52jOZVJ99r.TYiBkR9SH9/Zdwy', 'foYJrpQuF2', 'OaSi3pV0tW', '2022-09-25 10:31:18', '2022-09-25 10:31:18'),
(16, 'Natasha Hayes IV', 'wschuppe@example.org', '2022-09-25 10:31:10', '$2y$10$jOvYLQk168XSwZ8h0i22UeXiDhLo60bhz444dbEHv0PxESupWvvVi', 'mPAn0ZvbsW', 'tSeXEfnbvT', '2022-09-25 10:31:19', '2022-09-25 10:31:19'),
(17, 'Lucienne Bechtelar', 'liliana49@example.net', '2022-09-25 10:31:10', '$2y$10$bnt7VncmYU78c.eY07ZIeOVruHAtM9jDutg10mgAHilSmCm.5kLjm', 'b5jWD6jY8C', 'INUYsSYtFO', '2022-09-25 10:31:19', '2022-09-25 10:31:19'),
(18, 'Mr. Tanner Barton', 'bruen.robyn@example.com', '2022-09-25 10:31:10', '$2y$10$fHYcAed3Fq5v0OLwOmixSuHxABylt7Tz.bCsYohsqNRWdVfcG/HzG', 'hVR8WwLMX5', 'H6ShZFBcLN', '2022-09-25 10:31:20', '2022-09-25 10:31:20'),
(19, 'Jake Schinner', 'okemmer@example.net', '2022-09-25 10:31:10', '$2y$10$QoTijQpsi6EUyqhRKVaNeeqleVYbtr3RwFDp3nD75wHwGoMe8COkW', 'SmtQHyoGPj', 'natlOQ7sUE', '2022-09-25 10:31:20', '2022-09-25 10:31:20'),
(20, 'Ms. Cierra Beer', 'tromp.macy@example.net', '2022-09-25 10:31:10', '$2y$10$2VrdPP8IiPiyDLN13Hoj1uFpYXmH89I3i.hsM7bgtr2goVUZa/9j6', '6wKNkESvkt', 'eJVH710Ji5', '2022-09-25 10:31:20', '2022-09-25 10:31:20'),
(21, 'Arnaldo Stark', 'dora.wolff@example.com', '2022-09-25 10:31:10', '$2y$10$3LbEWy01nvUFiTLby7FNoeke/biKMNZk0jzBYlojR/ui8mGBMvVxu', 'Bp5FvVjvU4', '09xOY79aK4', '2022-09-25 10:31:20', '2022-09-25 10:31:20'),
(22, 'Melissa Schulist', 'sauer.erick@example.com', '2022-09-25 10:31:11', '$2y$10$zrZt2ISxsGWQrjsIP56vBu6tLKaCKpkNXKO3b8cop2uREE.PA8Od.', 'WUaZXL19p3', 'GgvhZwBEI1', '2022-09-25 10:31:20', '2022-09-25 10:31:20'),
(23, 'Sabryna Mraz I', 'lemke.elaina@example.net', '2022-09-25 10:31:11', '$2y$10$y52I0dYIJIwxYYqXxA4Vve.GDczg4ddmfm4LAV.STxz7Hg2R0k.ZC', '0gvAWkBaMF', 'VoCkbBN58o', '2022-09-25 10:31:20', '2022-09-25 10:31:20'),
(24, 'Prof. Josiah Hoeger', 'bechtelar.noemy@example.com', '2022-09-25 10:31:11', '$2y$10$y4cKrlQItwj.95TlP7WxWeV1j.158cT5I2Wm1ldXBG9XucHcrsZ1q', 'ERj7B6DLlP', 'UIAk4yMpgc', '2022-09-25 10:31:20', '2022-09-25 10:31:20'),
(25, 'Nyasia Langworth', 'fabiola18@example.com', '2022-09-25 10:31:11', '$2y$10$NG7olEmJto5JdieM/QnbrO05vpCC5qdw9Z/TEYPhuoHCDQ87v7xzq', 's8nNgc90av', 'YWnFmaYtCL', '2022-09-25 10:31:20', '2022-09-25 10:31:20'),
(26, 'Mrs. Annabel Altenwerth', 'rowland.cronin@example.org', '2022-09-25 10:31:11', '$2y$10$0q2QGybonwRSyyNVAhUIzuRpe9Be3gXhWJCqc13Nfu9oiNnxOtaJK', 'vqgTCBPGoW', 'VnZIalbCPR', '2022-09-25 10:31:20', '2022-09-25 10:31:20'),
(27, 'Domenic Kirlin', 'irma56@example.net', '2022-09-25 10:31:11', '$2y$10$A9ZSj4yPMK.wOJ2XOyCJseWiLxNN/TlacZyPmjwyrmBRbc3Zlu3l2', 'WYTsmwpAhb', 'zeqglqxiT5', '2022-09-25 10:31:20', '2022-09-25 10:31:20'),
(28, 'Dr. Richmond Christiansen', 'joshuah.klocko@example.net', '2022-09-25 10:31:11', '$2y$10$/15OsGsF68NfANCDbeX1G.4ma6Of/VUoYshvORFiLARP06NWBMh9.', 'TkgLOhK69V', 'mfbc1kVIQg', '2022-09-25 10:31:21', '2022-09-25 10:31:21'),
(29, 'Karine Kirlin Sr.', 'lily39@example.net', '2022-09-25 10:31:11', '$2y$10$JeCFCa5JbHOAFKHse/Y1ZeUqxbGaXCsHtr5cySuJif2dFa/j4bZ8K', 'Ulc8DvfJIn', 'U5fm4rDOqW', '2022-09-25 10:31:21', '2022-09-25 10:31:21'),
(30, 'Stephania Roob', 'raquel82@example.org', '2022-09-25 10:31:11', '$2y$10$/x122jBhJReqEZcCbtlTMeHbg6TS5XXuYkTOjf/BDXwuoFyDpH0sO', 'DLr2OxBCGH', '4ANv0r8qWb', '2022-09-25 10:31:21', '2022-09-25 10:31:21'),
(31, 'Brisa Hammes', 'quentin77@example.com', '2022-09-25 10:31:11', '$2y$10$EfGledcviIqlYpddFYGtMOTlSGAhgt0ZcBKBoT2UsC3OcnMXWGQhu', 'hBhfmlizGn', 'M6yaN03D7k', '2022-09-25 10:31:21', '2022-09-25 10:31:21'),
(32, 'Ada Rath DVM', 'shea.rohan@example.org', '2022-09-25 10:31:11', '$2y$10$tZAvC0FM1jPl5EuOiIIogeYNWAghyGNEtV6IPQ/n2Wv3bqatWOTUS', 'TWFa4qQZ7d', 'gmZGIigJTp', '2022-09-25 10:31:21', '2022-09-25 10:31:21'),
(33, 'Cortez Schaefer', 'qoberbrunner@example.com', '2022-09-25 10:31:11', '$2y$10$NE38/PuyKkKmvBqwFMN7mezwQJvwTxfnSGztdNmcSfwNhE.U9Ie/2', 'foTSXRh4TG', 'WgNUy3bsSf', '2022-09-25 10:31:21', '2022-09-25 10:31:21'),
(34, 'Caroline Harris', 'oconner.miguel@example.org', '2022-09-25 10:31:12', '$2y$10$JQtDkAgrAl5JAIURu2t3e.LDvKt.GuGdQSIrZblFkNMsFgZY33K1G', 'MvjMQuHd5w', 'N3vUwD14re', '2022-09-25 10:31:21', '2022-09-25 10:31:21'),
(35, 'Nelda Zemlak Jr.', 'sigrid54@example.net', '2022-09-25 10:31:12', '$2y$10$SurGeQ7RC9ObvtERwsm1z.yx8io3AuHBKv/jzOrC6FhrlJRVSUXJO', 'Zh17NOz4ZQ', 'NcNX8GRFJX', '2022-09-25 10:31:21', '2022-09-25 10:31:21'),
(36, 'Eladio Balistreri', 'maida24@example.org', '2022-09-25 10:31:12', '$2y$10$kJOKgoGVcRfS/q2KjLPW9eDyIDmq4Kz.6dcqvjxgV5d/XpJ3Em.Wm', 'OlwqAn1Gwi', 'ffeSafMXD8', '2022-09-25 10:31:21', '2022-09-25 10:31:21'),
(37, 'Prof. Jalon Johnston III', 'ofunk@example.net', '2022-09-25 10:31:12', '$2y$10$H/PqXS4/12UgmCi53dDbmOPjbDkLejGyI3BYYobxULzHva4P6Ds5K', 'AWYCvB0Bkf', 'T07PAWoQ1m', '2022-09-25 10:31:21', '2022-09-25 10:31:21'),
(38, 'Monserrat Predovic', 'vernie23@example.org', '2022-09-25 10:31:12', '$2y$10$ZsCaPbEOpuBwy3WpRcRT.OaDBqmxOymGQv55lxg/RjrxVZQq57Pdu', 'VQPs8QTh1q', 'fkdMgJfnqG', '2022-09-25 10:31:21', '2022-09-25 10:31:21'),
(39, 'Mrs. Amina Walter', 'keeley.koss@example.com', '2022-09-25 10:31:12', '$2y$10$NRzc5.ymrBX3TCdDN0U0Sudm8naVQWPFcAnp4pEY0HmBxH3Pb02lG', 'axGzHfVATE', 'CD6NhaT1BK', '2022-09-25 10:31:21', '2022-09-25 10:31:21'),
(40, 'Prof. Tito Wehner', 'bartholome.kulas@example.org', '2022-09-25 10:31:12', '$2y$10$1z6zH5KRDOEky5TEAYZ2EOLrcDLpc7580qMCeP2uHwNC8dMZMRiLm', 'oUGYGs9axn', 'dluhfWNp0h', '2022-09-25 10:31:21', '2022-09-25 10:31:21'),
(41, 'Barry Kuhn', 'marvin.lawrence@example.net', '2022-09-25 10:31:12', '$2y$10$9NghmFwjwFacjr4ka6CoJ.rTlQ.gJXYciFpY75cKBucPWlbG9ZWl.', 'vqMJnuL5d6', '16exXNaqmP', '2022-09-25 10:31:21', '2022-09-25 10:31:21'),
(42, 'Dr. Rogers Stiedemann', 'colt.hahn@example.com', '2022-09-25 10:31:12', '$2y$10$RuDG3ZgFnzkp0ihwjgi2v.gx8QI8KDNEvYCwcB/my5hiwqZq/PCDK', 'z8QYm4Bzv2', 'J77IoFPHH4', '2022-09-25 10:31:21', '2022-09-25 10:31:21'),
(43, 'Ethelyn Eichmann', 'ostrosin@example.org', '2022-09-25 10:31:12', '$2y$10$yB2wDrFSPxAWiS/DSLa/VO/VgP.eF3VbUJyQ0mifP.6c6B4x5v8lC', 'wRC3o0iaSp', 'qXSiQWAgyG', '2022-09-25 10:31:22', '2022-09-25 10:31:22'),
(44, 'Mrs. Karolann Hegmann', 'skiles.carmel@example.com', '2022-09-25 10:31:12', '$2y$10$TaOEqizVqQxFn3/karubxO9jcWn7R8oENOQdPCRDwRIikp6Z03KlW', 'fgtpmCuw5j', 'aHewLD3gIq', '2022-09-25 10:31:22', '2022-09-25 10:31:22'),
(45, 'Tate Toy', 'loma.vonrueden@example.org', '2022-09-25 10:31:13', '$2y$10$jy3hOlC9ESCF0BrsfBXMueJ6z3CpaOpLfulvqeB3iTqxHpNBpQQcC', 'ARgALhfwaH', 'S9snWGpVS8', '2022-09-25 10:31:22', '2022-09-25 10:31:22'),
(46, 'Kaya Hane', 'guy33@example.net', '2022-09-25 10:31:13', '$2y$10$GFmp4AGrXVWZoHcwN3JHxu7DP/BbClHWBl88eN8GB89b/bYQcDpiy', 'Im0sy6WFPi', '1DIX7EwSZB', '2022-09-25 10:31:22', '2022-09-25 10:31:22'),
(47, 'Prof. Dashawn Veum V', 'dominique.prohaska@example.net', '2022-09-25 10:31:13', '$2y$10$MhzzmzuWMdJ/.4axBJXCDOir6zjQl13E4VUbLw0lYQmLQqDpfh0Ei', 'LIKRCxQdbL', 's801UsGnX2', '2022-09-25 10:31:22', '2022-09-25 10:31:22'),
(48, 'Axel Konopelski', 'shawna66@example.org', '2022-09-25 10:31:13', '$2y$10$nGPS/B19tJssm9A5u7WikexrdtkXCF.PKa/B/JOxg98VwEyJgVOi.', 'pOL5J6BjBG', 'qidBO4chMZ', '2022-09-25 10:31:22', '2022-09-25 10:31:22'),
(49, 'Rhianna Ratke', 'bayer.garnet@example.org', '2022-09-25 10:31:13', '$2y$10$miSVHdfSg4OvUZaxYwZrOe74pDSYETdKQiIQZXT4oRJ3jXmdFNM6a', 'Fd1thrXGLs', 'n9XG2b2i0r', '2022-09-25 10:31:22', '2022-09-25 10:31:22'),
(50, 'Hortense Brown III', 'brisa60@example.net', '2022-09-25 10:31:13', '$2y$10$eSURKW44EUjnkf2/i2RFF.MIXmxwjKpbKJNiO.YxxbbHEGX1EtM0u', 'GBH5cDs4TD', 'VGdJqPS6nD', '2022-09-25 10:31:22', '2022-09-25 10:31:22'),
(51, 'Kristin Heller', 'adaniel@example.org', '2022-09-25 10:31:13', '$2y$10$VH9eiXg2bv5HjND178GpIOibVWzBtTNXadWtiDuAL2A8nnp.qbGxq', 'B16hmIGz7w', '2BAioz499S', '2022-09-25 10:31:22', '2022-09-25 10:31:22'),
(52, 'Stephen Schumm DDS', 'stoltenberg.maurice@example.com', '2022-09-25 10:31:13', '$2y$10$TbwasXrBADrDH158OuLn3exbvkL73qDLW8mblLXI3kz8lOFFaCrUO', 'WJGcm3D58S', '014PDIKM27', '2022-09-25 10:31:22', '2022-09-25 10:31:22'),
(53, 'Prof. Amelie Christiansen', 'delia.dubuque@example.org', '2022-09-25 10:31:13', '$2y$10$UBzKHEaP40MwFnd8/ygH6e84rhAwV27L2pcFYGvlLfa/fRTk7KRnm', 'xyRZzN4OfO', 'oxkWJettnP', '2022-09-25 10:31:23', '2022-09-25 10:31:23'),
(54, 'Hailie O\'Connell', 'kferry@example.org', '2022-09-25 10:31:13', '$2y$10$c9GQf07VaQWqAjtzMI1vPuBpOObrL/l8Nb8CVfBDvGFiCGvjiNNZe', 'Exrim3xvnI', 'ZNf2uAUGeJ', '2022-09-25 10:31:23', '2022-09-25 10:31:23'),
(55, 'Mrs. Lizeth Grimes', 'lorenza88@example.org', '2022-09-25 10:31:13', '$2y$10$25Vsbyjj6m0XzCJ/CM3irOJ5QyX7aLbcMYyCJ8uCsr2qMT6F7wid.', 'HKrKqfUbh2', '8Tn1JIQIWZ', '2022-09-25 10:31:23', '2022-09-25 10:31:23'),
(56, 'Ms. Eldridge Marquardt', 'nvon@example.com', '2022-09-25 10:31:13', '$2y$10$uhooDJrB88pE7lCGwClC1.rCxBGHbgMLLxPlbqa0ImnTD7PgiaTVS', '1RVOm2X1cn', '6rmVD2KUkZ', '2022-09-25 10:31:23', '2022-09-25 10:31:23'),
(57, 'Florine Wilkinson', 'mherman@example.org', '2022-09-25 10:31:14', '$2y$10$wj21IRdZJpp/qCy7RBbGKevvotGYhty.BHmHTTuFw53l3CaEwLQ66', 'nuhphcHm1j', '4Chr9abUJ5', '2022-09-25 10:31:23', '2022-09-25 10:31:23'),
(58, 'Eriberto McDermott', 'swiegand@example.com', '2022-09-25 10:31:14', '$2y$10$tESmqZgxfT.u.FF25Yp1VuRP0jl23zyDBzM7tGbXm.M6dLVik230G', '78ObCtcvbH', 'FtRxbicS4U', '2022-09-25 10:31:23', '2022-09-25 10:31:23'),
(59, 'Malachi Towne', 'kale51@example.com', '2022-09-25 10:31:14', '$2y$10$JpYL15MJuiiPJG32qMX13uvTf/5.eCed9.ESPp3awBVfRZxGXGBZW', '1coRH7sIsH', 'OqpIlhCtrk', '2022-09-25 10:31:23', '2022-09-25 10:31:23'),
(60, 'Dr. Jaclyn Steuber II', 'jaquan.johnston@example.net', '2022-09-25 10:31:14', '$2y$10$0EqllMWl5N3a3q00F6UEgOu6BpdeLxsNtqHUvAIl2BCfWHRdNsEAm', 'o7ZcLgyJBL', 'MioRrfX6c1', '2022-09-25 10:31:23', '2022-09-25 10:31:23'),
(61, 'Prof. Osborne O\'Keefe', 'ttrantow@example.com', '2022-09-25 10:31:14', '$2y$10$1MHFx9DUxFWY/Mb5C9VcgeBgXX8V89FStaIqMKD3oNvcHYBbDFxh.', 'OJQP2b6s5F', 'b4IKUFqvYL', '2022-09-25 10:31:23', '2022-09-25 10:31:23'),
(62, 'Dillon Nikolaus', 'marion.runolfsdottir@example.org', '2022-09-25 10:31:14', '$2y$10$y4Oe1I1G.3WIGiQy0OeD3eGL0y5wBmKQGPmnggrNMSoazQvxG/anS', 'Ovv0J5okcF', 'oIS9hWcNMg', '2022-09-25 10:31:24', '2022-09-25 10:31:24'),
(63, 'Ryan Goodwin', 'bartoletti.vince@example.org', '2022-09-25 10:31:14', '$2y$10$Bqcr8cnC.q7zQzGNEtbFTOKUBlNEeETk1UJPlLtRlcnH0Sux5LAYK', '9zYPvsMRpE', 'gLYojvWB59', '2022-09-25 10:31:24', '2022-09-25 10:31:24'),
(64, 'Mr. Tate Fahey DVM', 'jaskolski.bianka@example.net', '2022-09-25 10:31:14', '$2y$10$CDOlExFg3K.7.Euqs2QKkOBfSGqJvllKTDA7MSf92wlbkBUIO.RJy', 'IJgK7WJ6Dn', 'nxnbk40qKf', '2022-09-25 10:31:24', '2022-09-25 10:31:24'),
(65, 'Melvina Feest', 'ritchie.delilah@example.org', '2022-09-25 10:31:14', '$2y$10$Cd4hYyB7oxKl2KRL18.LZOFNlP6kLkodC7h8bETxYq1nfIQk.JQcK', 'UO1VszfSUR', 'BrUZwNfb2K', '2022-09-25 10:31:24', '2022-09-25 10:31:24'),
(66, 'Demetrius Heaney', 'rschoen@example.com', '2022-09-25 10:31:14', '$2y$10$/uSHcKxP3o76SZzQkcbqceCIjbXtREGYUdsIp4mNF57lE40KrSpDG', 'tQsnUGmwf8', 'f7GM4EdPCE', '2022-09-25 10:31:24', '2022-09-25 10:31:24'),
(67, 'Benedict Wyman', 'novella88@example.org', '2022-09-25 10:31:14', '$2y$10$TI4pkHLNWOVFc8yHVPQOAOlMunUqUOilxFlVOe2Q.OTHOTzCbe1P.', 'hGZ8LLjppD', '6EM3k2kIwW', '2022-09-25 10:31:24', '2022-09-25 10:31:24'),
(68, 'Bruce Hodkiewicz', 'darion56@example.org', '2022-09-25 10:31:14', '$2y$10$nwLuIub4crtcDAhq0uKbaO0CXw2mC7bK8ZwUy/NxLVcV/u4cMqd4C', 'fVskr96pyR', '8yKUT0VwUT', '2022-09-25 10:31:24', '2022-09-25 10:31:24'),
(69, 'Phoebe Robel', 'shields.eusebio@example.org', '2022-09-25 10:31:15', '$2y$10$LR7/BeqteYN42WVpTLigcOupSWPytLqVyQvSLl5t0FgTeAABCC3Jy', 'lpF1QMmElK', 'QIqsnrbA20', '2022-09-25 10:31:24', '2022-09-25 10:31:24'),
(70, 'Miss Katlynn Huels V', 'pfeffer.orlo@example.net', '2022-09-25 10:31:15', '$2y$10$yrIWiRARWFMKuSKbineucuiLAxDaGImD.lPWRyDUKkk1NBQuGTOcK', 'coKJR9eowP', 'WGvSQkvFqa', '2022-09-25 10:31:24', '2022-09-25 10:31:24'),
(71, 'Ryann Hickle', 'amiya.vandervort@example.net', '2022-09-25 10:31:15', '$2y$10$JahlmNbdFI.zTfnbhm/ZIewhx18QEyC2GHjuPRD30QOSKaqTCm3m.', 'JuyCFsl59I', 'TK4IrHNk1G', '2022-09-25 10:31:24', '2022-09-25 10:31:24'),
(72, 'Dr. Jevon Trantow PhD', 'geo40@example.com', '2022-09-25 10:31:15', '$2y$10$V2yi1iWhh3g84tFD5lkC.ujNJ/Wmaz6yNeMoHgQfvPwoODILH4IQu', 'QRcH2ceFm4', '1kw2QQmeUv', '2022-09-25 10:31:24', '2022-09-25 10:31:24'),
(73, 'Hermina Thiel', 'nathanial.doyle@example.com', '2022-09-25 10:31:15', '$2y$10$o2nYbqSLUwz5QE3Eu4Rbo.A1TtcEuNrdnjA8qC3S7xYd.jc6t49Em', 'aIlgkodI5j', 'vAjgZbyPIl', '2022-09-25 10:31:24', '2022-09-25 10:31:24'),
(74, 'Edwin Rohan I', 'ryan.alicia@example.com', '2022-09-25 10:31:15', '$2y$10$18/IIkpbliy27Z3vf4PTHOgKHz1amfmvb6LPbXrGT6T2Aok/hCfMO', '7IhC2dwdJ0', '9hOdYg9VLL', '2022-09-25 10:31:24', '2022-09-25 10:31:24'),
(75, 'Devon Huels', 'beier.kendra@example.net', '2022-09-25 10:31:15', '$2y$10$Vce1dRqKBYKTTkAOfw66YeFnfW.M2ufE7uNDUCmbZSTmXvcb/ZK6u', 'nhzopfVmET', 'F7UnfG4cuT', '2022-09-25 10:31:24', '2022-09-25 10:31:24'),
(76, 'Evie Wunsch', 'aufderhar.leonor@example.net', '2022-09-25 10:31:15', '$2y$10$bff5WT5/L9QQ8sq54vkY6.hDd3QTKx274KaTgn2GAr22dbB7963qK', 'CK4b5M1ss4', 'K8YkWPXgND', '2022-09-25 10:31:25', '2022-09-25 10:31:25'),
(77, 'Sadie Gulgowski', 'ike.quitzon@example.com', '2022-09-25 10:31:15', '$2y$10$p3N9H.aWA3uz5Ohmpyu9Ruwh14hjBHEbkz3FtRP927F9ePlHqAy3i', 'rpXprqMzR1', 'kieTSo0plo', '2022-09-25 10:31:25', '2022-09-25 10:31:25'),
(78, 'Marina Halvorson', 'cruickshank.emery@example.com', '2022-09-25 10:31:15', '$2y$10$TiAd5rPcvML8791zQOfW6eI56wsMI/WXtEHPBNvxEskSqqXo1JmKO', '3WevnYlMTN', '0oOB261Ngf', '2022-09-25 10:31:25', '2022-09-25 10:31:25'),
(79, 'Buck Ortiz', 'asha.dach@example.com', '2022-09-25 10:31:15', '$2y$10$PI7P3GEoZ44c5..o601wYeJwOqUbF4J6t0KFL5bDWo08WIKL4mlBu', 'tDBI7iruQH', 'IrSLoLMfD8', '2022-09-25 10:31:25', '2022-09-25 10:31:25'),
(80, 'Noelia Breitenberg', 'lynch.sheila@example.com', '2022-09-25 10:31:15', '$2y$10$3oTjp4BPv9uYn82M8euVX.ESAtC/UD.4JmmRUk0XMivfrrJC/b6GK', 'WHc9QpHqOB', 'Lfw12TppyJ', '2022-09-25 10:31:25', '2022-09-25 10:31:25'),
(81, 'Tony O\'Keefe', 'ohand@example.com', '2022-09-25 10:31:16', '$2y$10$rHPo2BdLONtw1N9aMwokGOCtUdM5ccv7pmlVrASRWoFKpquHM3Eeq', 'ORRMXqVUvD', 'ynPJx2IzBf', '2022-09-25 10:31:25', '2022-09-25 10:31:25'),
(82, 'Lisette Stamm', 'broob@example.com', '2022-09-25 10:31:16', '$2y$10$LlW9WE2/THSYCX2Bgk4mAOYChhiWuQe2ZtbNspjerKlopzIdpM3D6', 'wG2BRDCds4', 'jx9OyaovFi', '2022-09-25 10:31:25', '2022-09-25 10:31:25'),
(83, 'Jaren Wiza Sr.', 'wlabadie@example.com', '2022-09-25 10:31:16', '$2y$10$OGf5fL7iveGENGM4Ae15u.lUhvUvRxvde0Vb0jhDnbdyv8qT7m8kC', 'j1qTAS6owG', 'EssuMV4Es1', '2022-09-25 10:31:25', '2022-09-25 10:31:25'),
(84, 'Napoleon Steuber', 'fhalvorson@example.net', '2022-09-25 10:31:16', '$2y$10$mhTQV9Qy8I00JLKb.uMP0OrGcArz/ErOeKtDbJqSCgRnl5uPX7PDW', 'oCm960CyLD', 'npqe1HnBep', '2022-09-25 10:31:25', '2022-09-25 10:31:25'),
(85, 'Dr. Bennett Jerde PhD', 'henri.crona@example.org', '2022-09-25 10:31:16', '$2y$10$Z9JAmLNSIq3hSm4bwr98NeQ8J6dVD1zHkV72b8uqNMk7wrzy.NPN.', 'KS1BjhKWBW', 'P0vfSAK7uR', '2022-09-25 10:31:26', '2022-09-25 10:31:26'),
(86, 'Giuseppe Weissnat', 'tillman.theo@example.com', '2022-09-25 10:31:16', '$2y$10$3r6CFi6.i35P/33Bv05Ac.w4H7CV5D6tcRHYk.1gYjsNfKumZM5hi', 'wZDTctAz7V', 'UQVNBkSYx8', '2022-09-25 10:31:26', '2022-09-25 10:31:26'),
(87, 'Robbie Kerluke DVM', 'douglas.billie@example.org', '2022-09-25 10:31:16', '$2y$10$D06DrdiZX.YcOIZeHr8/K.fr0hi17YvS4FMMVpdZApAJwISUoYR2e', 'Zl41nwNBmK', 'fYsLqackDN', '2022-09-25 10:31:26', '2022-09-25 10:31:26'),
(88, 'Dr. Alvah Corwin IV', 'keanu.prohaska@example.org', '2022-09-25 10:31:16', '$2y$10$kITz65K/8hLGN4rPDZdAquLulImT6ik1U0g3kr3fX76We0WdDxBH2', 'cJSGupGyg0', 'XPJ4WIF0ZC', '2022-09-25 10:31:26', '2022-09-25 10:31:26'),
(89, 'Dr. Mikel Balistreri I', 'ruecker.chester@example.net', '2022-09-25 10:31:16', '$2y$10$dfJepBzN0ZT8ogV9lfVnh.e/ySq97iALTM7IXggw3tMZ7qy/MhMSa', 'fxsI8Lx8ym', '7c8aDCMaoC', '2022-09-25 10:31:26', '2022-09-25 10:31:26'),
(90, 'Willow Hermiston', 'balistreri.stella@example.com', '2022-09-25 10:31:16', '$2y$10$/ZGiT9NZQHM1fxlBu07DeegjSbsEOIJUtH9Q8zx8mEzYgcBPeJnOm', 'vFW4qqHohp', 'VEfPXVi2Xe', '2022-09-25 10:31:26', '2022-09-25 10:31:26'),
(91, 'Ruthie Lubowitz', 'keenan90@example.com', '2022-09-25 10:31:16', '$2y$10$SQM14B7wTMx.NLX4BNwv2OkuWvqpobET5Cszj6ELPZGs7E/wBlgzK', 'reWGvYw2OM', 'DONKDsS3tV', '2022-09-25 10:31:26', '2022-09-25 10:31:26'),
(92, 'Dr. Josianne Grimes IV', 'graham.eugenia@example.com', '2022-09-25 10:31:17', '$2y$10$FN68ZFLRyzSNZ42y8jaZnOagi5jXkApGe2ExGeAPysobKpaR.lAGS', 'SxGwmANFhT', 'uHeUmDcDPi', '2022-09-25 10:31:26', '2022-09-25 10:31:26'),
(93, 'Dr. Emelie Windler III', 'orie.friesen@example.net', '2022-09-25 10:31:17', '$2y$10$BwviiycyttfeHLRGnzP0kO39f/YnpKUGOm/UHc8xEqfexc8g84oNe', 'AAfLuir0ER', '8DmoATbmBz', '2022-09-25 10:31:26', '2022-09-25 10:31:26'),
(94, 'Guy Metz', 'bradtke.aaliyah@example.net', '2022-09-25 10:31:17', '$2y$10$LCYy9P1LSGeYNso7.Cwqe.wwD9.8rhK9qIqXWtJP4K0gWddMJkTti', 'mxiSXeN7dV', '9XKfnWPJjB', '2022-09-25 10:31:26', '2022-09-25 10:31:26'),
(95, 'Dr. Gerry Morissette Jr.', 'blaze65@example.org', '2022-09-25 10:31:17', '$2y$10$93WqRHyVncjLLaTi2DcwRuqyVcCv.4o8T6TKZAdak8VdfdwfE3uR2', 'pDEKMhfLyB', 'vkCEhQAGLW', '2022-09-25 10:31:27', '2022-09-25 10:31:27'),
(96, 'Brendan Tromp', 'bednar.alessandro@example.com', '2022-09-25 10:31:17', '$2y$10$MmN7uB03hvBOMCLtrg8xw.05uTj3o.9q7ngDh175xHOgqlt2n0fGy', '9bHxmsJBLQ', 'tLt7Y8TBs9', '2022-09-25 10:31:27', '2022-09-25 10:31:27'),
(97, 'Miss Mylene Botsford', 'shaun.trantow@example.com', '2022-09-25 10:31:17', '$2y$10$CZiDuQ4HxXzkQfYgJ/FGMuefqcODdOc01dFiQK1ebH8cFZRZNKaxq', 'f2ue1RgB9Y', 'sDlXHHGsi5', '2022-09-25 10:31:27', '2022-09-25 10:31:27'),
(98, 'Luis Dach', 'lebsack.sabryna@example.com', '2022-09-25 10:31:17', '$2y$10$NRCRs4yI6eZMc3EqrWsIZerZbfsWbLoobTzwes8ZyKkUGy8gq6Uva', 'T7SfCGbIuQ', 'NxSCH2c63o', '2022-09-25 10:31:27', '2022-09-25 10:31:27'),
(99, 'Tremaine Willms Jr.', 'van02@example.com', '2022-09-25 10:31:17', '$2y$10$JOcv21kGdbyn3.kK7SbUmuZLaWhzRzgq44LczoI3Bp6ljgVObY0T6', 'q5DNzbVXah', '2hraxakJpK', '2022-09-25 10:31:27', '2022-09-25 10:31:27'),
(100, 'Miss Jordane Kautzer', 'murazik.baron@example.net', '2022-09-25 10:31:17', '$2y$10$rvPCACvkRQoD9i01FStEGONeXcvKGdETsVJyvmuvVSuTqmCTa2f1O', 'WLOlZJzEVH', 'CSou8p5aZl', '2022-09-25 10:31:27', '2022-09-25 10:31:27'),
(101, 'Mariano Berge', 'athena53@example.com', '2022-09-25 10:31:17', '$2y$10$ZhHkn7JQTlZZHBaDC6OmmuLgJT5Yi7iN0cnwF35ldRG8mtWsMWddC', 'OU5nBsF06v', 'DGtuLz7BWP', '2022-09-25 10:31:27', '2022-09-25 10:31:27'),
(102, 'Kyle Heller', 'ymaggio@example.com', '2022-09-25 10:31:17', '$2y$10$99zTV7jNd9h.XjCcbBD24Oh3MAQfS1LJXHchYf8WUjPM6eGT9nmcC', 'LR3m7L5aIH', 'Bp8JHKlM75', '2022-09-25 10:31:27', '2022-09-25 10:31:27'),
(103, 'Esther O\'Keefe', 'aglae31@example.net', '2022-09-25 10:31:17', '$2y$10$NdvzTbS9K.yMd4N4T1P/Re3TuUgIUDos8diC7utSRmocKNTdleoV2', 'DXpw3ydost', 'SL5xGkZTNR', '2022-09-25 10:31:28', '2022-09-25 10:31:28'),
(104, 'Amelia Carter', 'ronny.schaefer@example.com', '2022-09-25 10:31:18', '$2y$10$Sh1YFefoeX7HsMQ06l7wfeAq77YmqUt.JrI4pi0gWMAVt8Mt/kL0m', 'eO6nTEUSEf', 'ykpAfivApZ', '2022-09-25 10:31:28', '2022-09-25 10:31:28'),
(105, 'Merlin Runte', 'norbert.mccullough@example.com', '2022-09-25 10:31:18', '$2y$10$yQeGE3.9y20it1H2K1ar4.pPSRmnIryoOnq/KVipraPIJ9PEPhCoG', 'w8DdR3ZgOT', 'Diwl4VWXyw', '2022-09-25 10:31:28', '2022-09-25 10:31:28'),
(106, 'Hermina Lesch', 'cormier.susan@example.net', '2022-09-25 10:31:18', '$2y$10$NU3Q94AF.e985bFZT1YubO4qCeG8XefxZ0qoKei1IauSyNSNu4Ei.', 'meaoerOAd3', 'GExPyDcSoA', '2022-09-25 10:31:28', '2022-09-25 10:31:28'),
(107, 'Dr. Genoveva Rowe', 'hpurdy@example.org', '2022-09-25 10:31:18', '$2y$10$DWlJbRQzgkIgHtOwpCQly.Vq.FKZ4d5QuDBO1dy.8kuuq.rI89D2m', 'LO5iVqJS17', 'GUqdqkvchT', '2022-09-25 10:31:28', '2022-09-25 10:31:28'),
(108, 'Mrs. Mireya Bayer MD', 'nkemmer@example.com', '2022-09-25 10:31:18', '$2y$10$Rj3eZsaGreSo51D6xNPQoe4TK/jvDu0jof37Dl0CrnHEXk5p7jtKK', 'ACBya2cZ6v', 'nEDnvPMqtp', '2022-09-25 10:31:28', '2022-09-25 10:31:28'),
(109, 'Justus Beier', 'kharvey@example.org', '2022-09-25 10:31:18', '$2y$10$N8zUTnLcvq1pKJ1MZbIInex.VO3oFP7Y9w2lfWHDJ6jagxX5fTxiG', 'mHnn7MnuD1', 'RMRrnsswNo', '2022-09-25 10:31:28', '2022-09-25 10:31:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `istallments`
--
ALTER TABLE `istallments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_slug_unique` (`slug`);

--
-- Indexes for table `plan_features`
--
ALTER TABLE `plan_features`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plan_features_plan_id_slug_unique` (`plan_id`,`slug`);

--
-- Indexes for table `plan_subscriptions`
--
ALTER TABLE `plan_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plan_subscriptions_slug_unique` (`slug`),
  ADD KEY `plan_subscriptions_subscriber_type_subscriber_id_index` (`subscriber_type`,`subscriber_id`),
  ADD KEY `plan_subscriptions_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `plan_subscription_usage`
--
ALTER TABLE `plan_subscription_usage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plan_subscription_usage_subscription_id_feature_id_unique` (`subscription_id`,`feature_id`),
  ADD KEY `plan_subscription_usage_feature_id_foreign` (`feature_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `istallments`
--
ALTER TABLE `istallments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `plan_features`
--
ALTER TABLE `plan_features`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `plan_subscriptions`
--
ALTER TABLE `plan_subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `plan_subscription_usage`
--
ALTER TABLE `plan_subscription_usage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `plan_features`
--
ALTER TABLE `plan_features`
  ADD CONSTRAINT `plan_features_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `plan_subscriptions`
--
ALTER TABLE `plan_subscriptions`
  ADD CONSTRAINT `plan_subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `plan_subscription_usage`
--
ALTER TABLE `plan_subscription_usage`
  ADD CONSTRAINT `plan_subscription_usage_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `plan_features` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `plan_subscription_usage_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `plan_subscriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
