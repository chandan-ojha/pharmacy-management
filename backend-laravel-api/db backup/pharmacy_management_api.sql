-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 02, 2023 at 03:41 PM
-- Server version: 5.7.33
-- PHP Version: 8.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy_management_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Tab','Capsule','Syrup','Suppository') COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'customer_name', 'phone', '2023-04-02 09:20:24', '2023-04-02 09:20:24'),
(2, 'customer_name', 'phone', '2023-04-02 09:21:10', '2023-04-02 09:21:10');

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Tab','Capsule','Syrup','Suppository') COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`id`, `name`, `weight`, `type`, `vendor`, `price`, `quantity`, `created_at`, `updated_at`) VALUES
(4, 'Napa', '500mg', 'Tab', 'Beximco', '9', '10', '2023-03-29 01:19:40', '2023-03-29 01:19:40'),
(5, 'Napa Extra', '565mg', 'Tab', 'Beximco', '24', '11', '2023-03-29 01:20:36', '2023-03-29 01:20:36'),
(6, 'Ace', '500mg', 'Tab', 'SQUARE', '8', '10', '2023-03-29 01:21:37', '2023-03-29 01:21:37'),
(7, 'Tofen', '1mg/5ml', 'Syrup', 'Beximco', '65', '30', '2023-03-29 01:22:40', '2023-03-29 01:22:40'),
(8, 'Monas', '10mg', 'Tab', 'ACME', '10', '20', '2023-03-29 01:23:47', '2023-03-29 01:23:47');

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_03_25_072425_create_vendors_table', 2),
(8, '2023_03_27_144806_create_drugs_table', 3),
(9, '2023_04_02_041552_create_customers_table', 4),
(10, '2023_04_02_043917_create_orders_table', 4),
(11, '2023_04_02_044451_create_order_details_table', 4),
(13, '2023_04_02_144930_create_cart_items_table', 5),
(14, '2023_04_02_145715_create_customers_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'authToken', '518607948b120d48943d7f95c7fac810f3dbbef72b63448076655279d4a10541', '[\"*\"]', NULL, NULL, '2023-03-23 00:40:11', '2023-03-23 00:40:11'),
(2, 'App\\Models\\User', 1, 'authToken', '2c651b3f6486b7263009d03d6883dfa17895fe712101635c36c921f0502fc079', '[\"*\"]', NULL, NULL, '2023-03-23 03:05:21', '2023-03-23 03:05:21'),
(3, 'App\\Models\\User', 1, 'authToken', '64f67a0d19b56fc6ba2a0e1f1b58f8c721ab230aff76e5b4e1579f898b0054e9', '[\"*\"]', NULL, NULL, '2023-03-23 03:05:33', '2023-03-23 03:05:33'),
(4, 'App\\Models\\User', 1, 'authToken', '9fdcd5ed28399f7822f071ce2a0df7a4bd47d9ca040a41d41950b110843b6d90', '[\"*\"]', NULL, NULL, '2023-03-23 06:38:17', '2023-03-23 06:38:17'),
(5, 'App\\Models\\User', 1, 'authToken', 'dea57c71228b65d41aec29687ee23ee5339bd37676ed91177b2a674ba8c614bd', '[\"*\"]', NULL, NULL, '2023-03-23 07:03:28', '2023-03-23 07:03:28'),
(6, 'App\\Models\\User', 1, 'authToken', '5ee79412af68c8c32eea8ce0b649e1b3358bf3a632087d969938a107baa99301', '[\"*\"]', NULL, NULL, '2023-03-23 07:05:14', '2023-03-23 07:05:14'),
(7, 'App\\Models\\User', 1, 'authToken', 'f3526098c07ed8f871c884f2b1e22f987f604028aa53766319b4359aade85cba', '[\"*\"]', NULL, NULL, '2023-03-23 07:25:16', '2023-03-23 07:25:16'),
(8, 'App\\Models\\User', 1, 'authToken', '30ecb1cefdc52e8fb4b9b42e1b4110e892cfce0685b95e1cb859a8475e4c0ec9', '[\"*\"]', NULL, NULL, '2023-03-23 07:26:27', '2023-03-23 07:26:27'),
(9, 'App\\Models\\User', 1, 'authToken', '6d97c24728d8e2dc581b5671a2295b48ad6b3e935ff8812c5a4de0f9f8791274', '[\"*\"]', NULL, NULL, '2023-03-24 05:21:28', '2023-03-24 05:21:28'),
(10, 'App\\Models\\User', 1, 'authToken', '697bd896a3588a681a5b77de011a0bef647f528d8a30a7e158464dddfcf982dd', '[\"*\"]', NULL, NULL, '2023-03-24 05:56:41', '2023-03-24 05:56:41'),
(11, 'App\\Models\\User', 1, 'authToken', '5f1425d42850de560ccc61d86ab21e9358338d01f10a9cc0856ee27cd9129a5e', '[\"*\"]', NULL, NULL, '2023-03-24 06:00:53', '2023-03-24 06:00:53'),
(12, 'App\\Models\\User', 1, 'authToken', 'cce56534eebc0dbbaf4ca3549005923b5039ad75c9361136d0f876d6c66e333a', '[\"*\"]', NULL, NULL, '2023-03-24 06:25:39', '2023-03-24 06:25:39'),
(13, 'App\\Models\\User', 1, 'authToken', '69f402ae4a52bdc34aa3a61797efad40131b749f3a05d42a95985d52e695f372', '[\"*\"]', NULL, NULL, '2023-03-24 06:26:12', '2023-03-24 06:26:12'),
(14, 'App\\Models\\User', 1, 'authToken', 'd09611dd5cd2b1d7c7a613c644902bb7f54335b07c947aaf4436b2fb38529ba7', '[\"*\"]', NULL, NULL, '2023-03-24 06:33:44', '2023-03-24 06:33:44'),
(15, 'App\\Models\\User', 1, 'authToken', '38cff48ad566609182876c6e99abd33ade45b7f1469e395b54b5ba4a10554ca2', '[\"*\"]', NULL, NULL, '2023-03-24 07:29:10', '2023-03-24 07:29:10'),
(16, 'App\\Models\\User', 1, 'authToken', '0c2022737cbe29dc130f883c0f252a2f708653622eb909ddc66fa7c8dd8a1876', '[\"*\"]', NULL, NULL, '2023-03-24 07:30:22', '2023-03-24 07:30:22'),
(17, 'App\\Models\\User', 1, 'authToken', '286c630ab7fe0a21e216c6bc4473ecda74ca8557d1b8f2acd0f81eb25b437785', '[\"*\"]', NULL, NULL, '2023-03-24 23:08:49', '2023-03-24 23:08:49'),
(18, 'App\\Models\\User', 1, 'authToken', '70ef023159d6a85e3c4cb3bd6433f048cfecf9823988e97164cbbb008e436834', '[\"*\"]', NULL, NULL, '2023-03-25 01:59:23', '2023-03-25 01:59:23'),
(19, 'App\\Models\\User', 1, 'authToken', '0bc2d9b15778279e936896224155fa6e7c6427099dcbf9ed78191ccd740ae08e', '[\"*\"]', '2023-04-02 09:33:16', NULL, '2023-03-25 02:02:39', '2023-04-02 09:33:16'),
(20, 'App\\Models\\User', 1, 'authToken', 'd7053f1c54cad93dd81505d0a72b9230f6663822f8668e22aa85c1dc9d07ee0c', '[\"*\"]', NULL, NULL, '2023-03-25 02:33:50', '2023-03-25 02:33:50'),
(21, 'App\\Models\\User', 1, 'authToken', 'f9c0cb916eeac10bdd0420e970317d304f56b05882c197eccce6349be5e7777e', '[\"*\"]', NULL, NULL, '2023-03-25 02:58:53', '2023-03-25 02:58:53'),
(22, 'App\\Models\\User', 1, 'authToken', 'c551ee27c89daaaa143bbe4b06db5c6cff700eee5ca0c50c5604037d4c1850af', '[\"*\"]', '2023-03-25 03:43:36', NULL, '2023-03-25 02:59:17', '2023-03-25 03:43:36'),
(23, 'App\\Models\\User', 1, 'authToken', '3e187d7a40f1f9cbf98006fcf591cbc50400ad076ed906e9c20ead00b8741291', '[\"*\"]', NULL, NULL, '2023-03-25 03:43:41', '2023-03-25 03:43:41'),
(24, 'App\\Models\\User', 1, 'authToken', '6533258e8244e07a914f45ea0dc31cb6e33be54e10a54c15421915681898da41', '[\"*\"]', NULL, NULL, '2023-03-25 03:43:47', '2023-03-25 03:43:47'),
(25, 'App\\Models\\User', 1, 'authToken', 'f65d58acb7239bb272afe863875dd346c5fdd467f619ddf76c0e00448d672d78', '[\"*\"]', NULL, NULL, '2023-03-25 03:44:20', '2023-03-25 03:44:20'),
(26, 'App\\Models\\User', 1, 'authToken', '3c600e027153fe6267e70b7a2ab445d89b8d103850e0aafdf8c91de6fa66e1b3', '[\"*\"]', NULL, NULL, '2023-03-25 03:52:58', '2023-03-25 03:52:58'),
(27, 'App\\Models\\User', 1, 'authToken', 'a7fd71991d56f47b8f70d5e700732192f7cdb7b77f34fd8318d2cd8e1d9f00bf', '[\"*\"]', NULL, NULL, '2023-03-25 04:05:04', '2023-03-25 04:05:04'),
(28, 'App\\Models\\User', 1, 'authToken', '9350bb7ff74a10e7a46b1c7e5ce88714ae2d7ea831380936e178a86ec49f45ab', '[\"*\"]', '2023-03-25 04:15:50', NULL, '2023-03-25 04:07:45', '2023-03-25 04:15:50'),
(29, 'App\\Models\\User', 1, 'authToken', '956ad5953f0ecc03e9a4d7854864e9e63020cb97b2e1abc3c941c5285e11a547', '[\"*\"]', NULL, NULL, '2023-03-25 04:10:05', '2023-03-25 04:10:05'),
(30, 'App\\Models\\User', 1, 'authToken', '802057084915abe64129276f0cfd654686277cca86bc4ea179bd7bfce31c0dab', '[\"*\"]', NULL, NULL, '2023-03-25 04:14:14', '2023-03-25 04:14:14'),
(31, 'App\\Models\\User', 1, 'authToken', 'e2da06d9ba70a9ca5bd597b20815cfceef21076560dd949fe7d549e4696d8524', '[\"*\"]', NULL, NULL, '2023-03-25 04:30:41', '2023-03-25 04:30:41'),
(32, 'App\\Models\\User', 1, 'authToken', '7d9ad518c0eae2194182c366a37ee3c607a7d2ef65c0ce3d6d8dcccc79a84a83', '[\"*\"]', NULL, NULL, '2023-03-25 04:32:11', '2023-03-25 04:32:11'),
(33, 'App\\Models\\User', 1, 'authToken', 'aaff6b6c7159d9615d8d18bcdd2bf7ed4f669936978184350044e12c8a8b90b3', '[\"*\"]', NULL, NULL, '2023-03-25 04:35:12', '2023-03-25 04:35:12'),
(34, 'App\\Models\\User', 1, 'authToken', '7eed150b20c46abcd9ff816687bcaee68d6060ff6a827e43d2ce7ff668bd4ff6', '[\"*\"]', NULL, NULL, '2023-03-25 04:48:20', '2023-03-25 04:48:20'),
(35, 'App\\Models\\User', 1, 'authToken', '41a471cc061f8531293db8ed8ceffff2e4747beb0b7bbc5b00faa879be5c5157', '[\"*\"]', NULL, NULL, '2023-03-25 08:45:40', '2023-03-25 08:45:40'),
(36, 'App\\Models\\User', 1, 'authToken', '957b425c88cdb80cd890f8df9b2118041dfefda30ef5d9d4af81634ef75cea47', '[\"*\"]', NULL, NULL, '2023-03-25 23:09:11', '2023-03-25 23:09:11'),
(37, 'App\\Models\\User', 1, 'authToken', '7292f843b2968753b1913963429806dd0cbe4d7b9bf3a0b1692be19e515e5492', '[\"*\"]', NULL, NULL, '2023-03-25 23:34:12', '2023-03-25 23:34:12'),
(38, 'App\\Models\\User', 1, 'authToken', '9389f09f32ef3d07a1de9292a8255a184e2e3d466f653ad8d83b26bf368d8c90', '[\"*\"]', NULL, NULL, '2023-03-25 23:56:54', '2023-03-25 23:56:54'),
(39, 'App\\Models\\User', 1, 'authToken', 'f73dc6ef0ac0efbf8fe607ce3c74ecb58102fc00d237b5f3a2e2a9fdf1ecd9f2', '[\"*\"]', NULL, NULL, '2023-03-26 00:19:41', '2023-03-26 00:19:41'),
(40, 'App\\Models\\User', 1, 'authToken', 'e63ec3ed6985c013597a45fe4ab9947ac81218625d74f1e044cb7eca1118e7b8', '[\"*\"]', NULL, NULL, '2023-03-26 00:19:43', '2023-03-26 00:19:43'),
(41, 'App\\Models\\User', 1, 'authToken', 'bf382ee9e741e110cac83d537c2c0dbabc45a34feddc916a93d2e85bd306bc85', '[\"*\"]', NULL, NULL, '2023-03-26 01:25:46', '2023-03-26 01:25:46'),
(42, 'App\\Models\\User', 1, 'authToken', 'f5d4c81cf854b93efbad57d8ce906bc38fa4fb5eb3811e78cdf15177f1c1165b', '[\"*\"]', NULL, NULL, '2023-03-26 01:39:38', '2023-03-26 01:39:38'),
(43, 'App\\Models\\User', 1, 'authToken', 'd1d0d75f9b49b7c09ff40f315ef0aeca949391ed593535b9ff2006ce0d10d45f', '[\"*\"]', NULL, NULL, '2023-03-26 01:45:34', '2023-03-26 01:45:34'),
(44, 'App\\Models\\User', 1, 'authToken', 'eeffe41792e1df4c789444375c54024d41af337fc0d0820152f57ca622d47493', '[\"*\"]', NULL, NULL, '2023-03-26 02:19:32', '2023-03-26 02:19:32'),
(45, 'App\\Models\\User', 1, 'authToken', 'bd4a6f6afeee10587a3b50130f63bd32e6041c21974a4b8c83768bb6b46befde', '[\"*\"]', NULL, NULL, '2023-03-26 10:51:22', '2023-03-26 10:51:22'),
(46, 'App\\Models\\User', 1, 'authToken', '7a2557979c9cfe0cefbb064dd9073320a90e432d7ba2e9c8538aa259d11cd4f2', '[\"*\"]', NULL, NULL, '2023-03-26 23:20:13', '2023-03-26 23:20:13'),
(47, 'App\\Models\\User', 1, 'authToken', '9c08e8bb37a62945e7a4059dac6853e2548a32ed01d0e64f7fb2d908528180c8', '[\"*\"]', NULL, NULL, '2023-03-27 23:07:11', '2023-03-27 23:07:11'),
(48, 'App\\Models\\User', 1, 'authToken', 'b75cb993c6883e263626e2c6ed7c0e58bc7c08f05ccb5508d9d292c456103a74', '[\"*\"]', NULL, NULL, '2023-03-28 00:35:54', '2023-03-28 00:35:54'),
(49, 'App\\Models\\User', 1, 'authToken', '06662830964f9fe0783bd99ee54d99c5bc6a7bf574564d21f1102ba17247ccbb', '[\"*\"]', NULL, NULL, '2023-03-28 00:37:51', '2023-03-28 00:37:51'),
(50, 'App\\Models\\User', 1, 'authToken', '030c9f87656086d4874d2ad00f801143d0bdee0d0af4b327f50f1b5724356739', '[\"*\"]', NULL, NULL, '2023-03-28 00:38:04', '2023-03-28 00:38:04'),
(51, 'App\\Models\\User', 1, 'authToken', 'e7e5c7cc903e56a547c72e180754892f13f642faec1213da335577860f2bbe68', '[\"*\"]', NULL, NULL, '2023-03-28 02:44:24', '2023-03-28 02:44:24'),
(52, 'App\\Models\\User', 1, 'authToken', '47ef82a2b8afba32cd00480fbefb832c0a72a429429ade6fdf753054cc6cdbd1', '[\"*\"]', NULL, NULL, '2023-03-28 02:44:31', '2023-03-28 02:44:31'),
(53, 'App\\Models\\User', 1, 'authToken', '380724a273b3f088a8eeeb825f9a8ead92c073568ad6b2ead1a70f02ab653e9a', '[\"*\"]', NULL, NULL, '2023-03-28 02:47:03', '2023-03-28 02:47:03'),
(54, 'App\\Models\\User', 1, 'authToken', '516157e8057c852b084d2c392de6582ed54c434d995cd4b1e283774595ca45b2', '[\"*\"]', NULL, NULL, '2023-03-28 23:45:14', '2023-03-28 23:45:14'),
(55, 'App\\Models\\User', 1, 'authToken', '329357b460c8fce7435e13b319a4ddd0c974804838d66179ee17c33a6f354b87', '[\"*\"]', NULL, NULL, '2023-03-29 01:36:57', '2023-03-29 01:36:57'),
(56, 'App\\Models\\User', 1, 'authToken', '17c5b4690276281fc52e7f24209d89a8b5352876b4df777e6b15f11ecde477b9', '[\"*\"]', NULL, NULL, '2023-03-29 22:07:50', '2023-03-29 22:07:50'),
(57, 'App\\Models\\User', 1, 'authToken', 'd1732c08f7cc2755d512d877375ccb1156e44d4c3840eff5460707c459fc70b6', '[\"*\"]', NULL, NULL, '2023-03-31 02:31:52', '2023-03-31 02:31:52'),
(58, 'App\\Models\\User', 1, 'authToken', 'f87cc90c61383b8f64568a1e7433d4125257928e94c83c5052d3f1834e0dae2b', '[\"*\"]', NULL, NULL, '2023-04-01 07:52:04', '2023-04-01 07:52:04'),
(59, 'App\\Models\\User', 1, 'authToken', '87ab4ea567f2efdc5d3c06857cbe686f15505594ab8c8f1a278471e6adaf421a', '[\"*\"]', NULL, NULL, '2023-04-01 08:00:30', '2023-04-01 08:00:30'),
(60, 'App\\Models\\User', 1, 'authToken-refresh', '5befcec3d46da15401e9d5b1fe62311fee95a7136b3a30e9c98ecb0d3de9d9b5', '[\"*\"]', NULL, NULL, '2023-04-01 08:00:30', '2023-04-01 08:00:30'),
(61, 'App\\Models\\User', 1, 'authToken', '5960b038b7825507189c17c89fdec2678bcacd2534ea23c9ded388b661f7671d', '[\"*\"]', '2023-04-02 07:27:13', NULL, '2023-04-02 07:04:50', '2023-04-02 07:27:13'),
(62, 'App\\Models\\User', 1, 'authToken-refresh', 'b867763661f66d44f69c1627bc3984d6f55b5e48663a8163c70b418a62a83a5d', '[\"*\"]', NULL, NULL, '2023-04-02 07:04:51', '2023-04-02 07:04:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Chandan Ojha', 'chandan', 'test@gmail.com', NULL, '$2y$10$ruLhWY3uy0QOi7km1flbzOZxuITO7CZFtX8VmFEn703aR8DkitcP6', NULL, '2023-03-23 00:36:20', '2023-03-23 00:36:20');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(43, 'Beximco', 'Bangladeshi multinational conglomerate holding company', '2023-03-29 01:15:34', '2023-03-29 01:15:34'),
(44, 'SQUARE', 'Square Pharmaceuticals Ltd. is a Bangladeshi multinational pharmaceutical company', '2023-03-29 01:16:13', '2023-03-29 01:16:13'),
(45, 'ACME', 'ACME Laboratories Ltd is a pharmaceutical company based in Bangladesh', '2023-03-29 01:16:51', '2023-03-29 01:16:51'),
(46, 'Nipro JMI', 'Nipro Corporation is a Japanese medical equipment manufacturing company', '2023-03-29 01:18:32', '2023-03-29 01:18:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
