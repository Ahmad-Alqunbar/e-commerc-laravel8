-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2023 at 12:25 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `memo_store`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllProducts` ()  BEGIN
	SELECT *  FROM users;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetProducts` ()  BEGIN
	SELECT *  FROM products;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','archived') COLLATE utf8mb4_unicode_ci NOT NULL,
  `left_id` bigint(20) UNSIGNED DEFAULT NULL,
  `right_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `slug`, `description`, `image`, `status`, `left_id`, `right_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'clothes', NULL, 'clothes', 'sssssssssssss', 'uploads/HlFm07gKA8MtmDLpkgybFz3l9zYiVrcikNZz2NyU.png', 'active', NULL, NULL, '2023-01-18 15:06:17', '2023-01-28 18:04:45', NULL),
(4, 'man', 1, 'test', 'tests', 'uploads/BrazvIlRTByJR0zZU5KYXs7MCQOBWblO5UE4BHmr.png', 'archived', NULL, NULL, '2023-01-19 23:47:15', '2023-02-13 14:55:42', NULL),
(8, 'beby', 1, 'beby', 'test', NULL, 'active', NULL, NULL, '2023-02-04 14:09:49', '2023-02-04 14:09:49', NULL),
(9, 'bebyGirl', 8, 'bebygirl', 'treee', NULL, 'active', NULL, NULL, '2023-02-04 14:10:42', '2023-02-04 14:10:42', NULL),
(27, 'qui', NULL, 'qui', 'Unde delectus consequatur dolores temporibus suscipit distinctio cum eos autem velit maiores ut.', 'https://via.placeholder.com/640x480.png/005544?text=eos', 'active', NULL, NULL, '2023-02-18 18:47:54', '2023-02-18 18:47:54', NULL),
(28, 'esse', NULL, 'esse', 'Sunt ipsa sunt quia reprehenderit beatae et laudantium vero similique dolores facere.', 'https://via.placeholder.com/640x480.png/0011dd?text=quasi', 'active', NULL, NULL, '2023-02-18 18:47:54', '2023-02-18 18:47:54', NULL),
(29, 'expedita', NULL, 'expedita', 'Voluptas deleniti minus consectetur et est iste ullam aliquid aliquam reiciendis possimus.', 'https://via.placeholder.com/640x480.png/00ccaa?text=aut', 'active', NULL, NULL, '2023-02-18 18:47:54', '2023-02-18 18:47:54', NULL),
(30, 'necessitatibus', NULL, 'necessitatibus', 'Aut soluta voluptatem dolores consequatur excepturi odit est consectetur unde nesciunt.', 'https://via.placeholder.com/640x480.png/009999?text=sapiente', 'active', NULL, NULL, '2023-02-18 18:47:54', '2023-02-18 18:47:54', NULL),
(31, 'magni', NULL, 'magni', 'Autem aliquid qui voluptatem et atque facilis sint dolore eum.', 'https://via.placeholder.com/640x480.png/000088?text=facere', 'active', NULL, NULL, '2023-02-18 18:47:54', '2023-02-18 18:47:54', NULL),
(32, 'sequi', NULL, 'sequi', 'Expedita eaque maiores magnam aut et eum non aut quae unde.', 'https://via.placeholder.com/640x480.png/00ff11?text=ipsa', 'active', NULL, NULL, '2023-02-18 18:47:54', '2023-02-18 18:47:54', NULL),
(33, 'consequatur', NULL, 'consequatur', 'Vero voluptatum similique nam deserunt placeat laborum quis aspernatur est.', 'https://via.placeholder.com/640x480.png/002277?text=quod', 'active', NULL, NULL, '2023-02-18 18:47:54', '2023-02-18 18:47:54', NULL),
(34, 'consectetur', NULL, 'consectetur', 'Eum enim est rerum et sunt unde dolore consequatur ut provident rerum laborum reiciendis at facere eaque.', 'https://via.placeholder.com/640x480.png/00dd99?text=dignissimos', 'active', NULL, NULL, '2023-02-18 18:47:54', '2023-02-18 18:47:54', NULL),
(35, 'voluptate', NULL, 'voluptate', 'Aut odit dolor in impedit quasi nobis fugiat delectus non et est.', 'https://via.placeholder.com/640x480.png/0066ee?text=aliquid', 'active', NULL, NULL, '2023-02-18 18:47:54', '2023-02-18 18:47:54', NULL),
(36, 'sed', NULL, 'sed', 'Sint ducimus at voluptas deleniti non aut quo quasi ut.', 'https://via.placeholder.com/640x480.png/005544?text=dolores', 'active', NULL, NULL, '2023-02-18 18:47:54', '2023-02-18 18:47:54', NULL);

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
(19, '2022_12_25_065406_create_categories_table', 1),
(32, '2022_12_25_102946_create_products_table', 2),
(36, '2014_10_12_000000_create_users_table', 3),
(37, '2014_10_12_100000_create_password_resets_table', 3),
(38, '2019_08_19_000000_create_failed_jobs_table', 3),
(39, '2019_12_14_000001_create_personal_access_tokens_table', 3),
(41, '2022_12_24_215537_create_stores_table', 4),
(42, '2023_02_10_232242_add_soft_deletes_to_categories_table', 5),
(43, '2023_02_18_012046_add_store_id_to_users_table', 5),
(44, '2023_02_25_162435_create_profiles_table', 5),
(45, '2023_03_14_193903_create_tags_table', 6),
(46, '2023_03_14_194556_create_product_tag_table', 6);

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `compare_price` double(8,2) DEFAULT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `rating` double(8,2) NOT NULL DEFAULT 0.00,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','draft','archvied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `store_id`, `category_id`, `name`, `slug`, `description`, `image`, `price`, `compare_price`, `options`, `rating`, `featured`, `status`, `created_at`, `updated_at`) VALUES
(201, 42, 33, 'nesciunt', 'nesciunt', NULL, 'https://via.placeholder.com/600x600.png/0000ee?text=eaque', 447.80, 219.90, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(202, 41, 33, 'facere', 'facere', NULL, 'https://via.placeholder.com/600x600.png/00cc88?text=voluptate', 13.10, 426.40, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(203, 40, 36, 'inventore', 'inventore', NULL, 'https://via.placeholder.com/600x600.png/009911?text=nihil', 107.50, 198.50, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(204, 39, 29, 'sint', 'sint', NULL, 'https://via.placeholder.com/600x600.png/002288?text=accusantium', 91.10, 221.90, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(205, 43, 30, 'quis', 'quis', NULL, 'https://via.placeholder.com/600x600.png/005577?text=dolores', 306.30, 323.90, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(206, 42, 32, 'vel', 'vel', NULL, 'https://via.placeholder.com/600x600.png/0099bb?text=odit', 234.80, 114.20, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(207, 43, 28, 'aliquid', 'aliquid', NULL, 'https://via.placeholder.com/600x600.png/00dd88?text=itaque', 480.40, 381.80, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(208, 40, 1, 'cupiditate', 'cupiditate', NULL, 'https://via.placeholder.com/600x600.png/003322?text=iusto', 326.30, 280.40, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(209, 41, 8, 'esse', 'esse', NULL, 'https://via.placeholder.com/600x600.png/0000ee?text=blanditiis', 494.40, 300.50, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(210, 41, 27, 'sed', 'sed', NULL, 'https://via.placeholder.com/600x600.png/005522?text=rerum', 269.00, 160.30, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(211, 43, 9, 'quia', 'quia', NULL, 'https://via.placeholder.com/600x600.png/00bbbb?text=itaque', 389.40, 149.30, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(212, 39, 9, 'explicabo', 'explicabo', NULL, 'https://via.placeholder.com/600x600.png/0044ee?text=laborum', 329.40, 126.30, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(213, 41, 31, 'animi', 'animi', NULL, 'https://via.placeholder.com/600x600.png/0088aa?text=nostrum', 40.10, 117.70, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(214, 40, 36, 'nam', 'nam', NULL, 'https://via.placeholder.com/600x600.png/001122?text=sequi', 409.80, 351.10, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(215, 43, 9, 'sunt', 'sunt', 'test test', 'C:\\xampp\\tmp\\phpCB83.tmp', 241.60, 145.70, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-03-20 05:55:25'),
(216, 43, 28, 'magnam', 'magnam', NULL, 'https://via.placeholder.com/600x600.png/00ccaa?text=exercitationem', 244.50, 96.40, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(217, 40, 36, 'ut', 'ut', NULL, 'https://via.placeholder.com/600x600.png/00dd22?text=velit', 279.10, 67.70, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(218, 40, 1, 'sint', 'sint', NULL, 'https://via.placeholder.com/600x600.png/00dd77?text=corrupti', 416.00, 493.10, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(219, 39, 35, 'facilis', 'facilis', NULL, 'https://via.placeholder.com/600x600.png/007755?text=consequatur', 178.00, 315.70, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(220, 39, 9, 'facere', 'facere', NULL, 'https://via.placeholder.com/600x600.png/006600?text=hic', 399.20, 237.20, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(221, 40, 35, 'est', 'est', NULL, 'https://via.placeholder.com/600x600.png/00cc44?text=occaecati', 72.60, 320.10, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(222, 43, 27, 'quisquam', 'quisquam', NULL, 'https://via.placeholder.com/600x600.png/0000aa?text=rerum', 290.70, 327.40, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(223, 39, 1, 'ipsum', 'ipsum', NULL, 'https://via.placeholder.com/600x600.png/00eebb?text=exercitationem', 179.70, 112.20, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(224, 42, 31, 'ipsum', 'ipsum', NULL, 'https://via.placeholder.com/600x600.png/00ffee?text=optio', 450.20, 383.80, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(225, 39, 35, 'quisquam', 'quisquam', NULL, 'https://via.placeholder.com/600x600.png/00aaee?text=quaerat', 373.60, 212.80, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(226, 43, 35, 'cum', 'cum', NULL, 'https://via.placeholder.com/600x600.png/00dd00?text=iusto', 397.50, 461.50, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(227, 40, 27, 'commodi', 'commodi', NULL, 'https://via.placeholder.com/600x600.png/002200?text=aperiam', 260.00, 238.20, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(228, 42, 30, 'inventore', 'inventore', NULL, 'https://via.placeholder.com/600x600.png/003355?text=mollitia', 15.40, 283.70, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(229, 41, 30, 'in', 'in', NULL, 'https://via.placeholder.com/600x600.png/00ee66?text=molestias', 410.20, 2.50, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(230, 42, 27, 'quaerat', 'quaerat', NULL, 'https://via.placeholder.com/600x600.png/007722?text=quis', 321.80, 268.00, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(231, 39, 8, 'sint', 'sint', NULL, 'https://via.placeholder.com/600x600.png/00dd88?text=voluptatibus', 330.70, 311.10, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(232, 43, 30, 'exercitationem', 'exercitationem', NULL, 'https://via.placeholder.com/600x600.png/0022aa?text=at', 317.30, 349.30, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(233, 41, 27, 'sequi', 'sequi', NULL, 'https://via.placeholder.com/600x600.png/00cc66?text=vitae', 175.90, 474.10, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(234, 42, 36, 'et', 'et', NULL, 'https://via.placeholder.com/600x600.png/005588?text=maiores', 424.80, 73.50, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(235, 40, 1, 'voluptas', 'voluptas', NULL, 'https://via.placeholder.com/600x600.png/00bbcc?text=dolorem', 424.50, 172.60, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(236, 39, 34, 'odit', 'odit', NULL, 'https://via.placeholder.com/600x600.png/0000dd?text=nostrum', 454.00, 343.90, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(237, 42, 28, 'harum', 'harum', NULL, 'https://via.placeholder.com/600x600.png/009999?text=ut', 297.60, 4.40, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(238, 43, 33, 'occaecati', 'occaecati', NULL, 'https://via.placeholder.com/600x600.png/006611?text=voluptatem', 349.60, 202.80, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(239, 43, 1, 'sequi', 'sequi', NULL, 'https://via.placeholder.com/600x600.png/0088dd?text=hic', 260.40, 15.30, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(240, 39, 31, 'architecto', 'architecto', NULL, 'https://via.placeholder.com/600x600.png/00aa66?text=est', 166.20, 350.70, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(241, 40, 28, 'perspiciatis', 'perspiciatis', NULL, 'https://via.placeholder.com/600x600.png/005588?text=aperiam', 210.60, 487.40, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(242, 40, 9, 'nesciunt', 'nesciunt', NULL, 'https://via.placeholder.com/600x600.png/008844?text=est', 289.00, 398.80, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(243, 41, 1, 'quibusdam', 'quibusdam', NULL, 'https://via.placeholder.com/600x600.png/0044ee?text=ea', 483.80, 99.30, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(244, 39, 30, 'tempora', 'tempora', NULL, 'https://via.placeholder.com/600x600.png/0088aa?text=ab', 215.10, 307.00, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(245, 42, 32, 'molestiae', 'molestiae', NULL, 'https://via.placeholder.com/600x600.png/00bbff?text=at', 311.20, 372.50, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(246, 41, 30, 'rerum', 'rerum', NULL, 'https://via.placeholder.com/600x600.png/0055bb?text=nihil', 101.10, 88.60, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(247, 42, 30, 'quas', 'quas', NULL, 'https://via.placeholder.com/600x600.png/004499?text=laboriosam', 60.00, 79.70, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(248, 43, 29, 'vero', 'vero', NULL, 'https://via.placeholder.com/600x600.png/0033ee?text=inventore', 181.80, 457.70, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(249, 39, 36, 'modi', 'modi', NULL, 'https://via.placeholder.com/600x600.png/007722?text=consequatur', 423.40, 202.30, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(250, 42, 28, 'neque', 'neque', NULL, 'https://via.placeholder.com/600x600.png/0022bb?text=quia', 252.30, 240.30, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(251, 40, 32, 'modi', 'modi', NULL, 'https://via.placeholder.com/600x600.png/004466?text=rerum', 264.00, 89.90, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(252, 39, 29, 'sequi', 'sequi', NULL, 'https://via.placeholder.com/600x600.png/00dd22?text=pariatur', 356.90, 299.80, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(253, 43, 27, 'blanditiis', 'blanditiis', NULL, 'https://via.placeholder.com/600x600.png/006644?text=praesentium', 459.50, 136.00, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(254, 43, 28, 'possimus', 'possimus', NULL, 'https://via.placeholder.com/600x600.png/008877?text=perspiciatis', 366.30, 322.70, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(255, 43, 8, 'excepturi', 'excepturi', NULL, 'https://via.placeholder.com/600x600.png/00dddd?text=laboriosam', 33.40, 9.40, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(256, 39, 33, 'rerum', 'rerum', NULL, 'https://via.placeholder.com/600x600.png/00aa22?text=eligendi', 120.80, 329.40, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(257, 40, 1, 'laudantium', 'laudantium', NULL, 'https://via.placeholder.com/600x600.png/00bb55?text=et', 395.80, 210.50, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(258, 41, 32, 'enim', 'enim', NULL, 'https://via.placeholder.com/600x600.png/0011cc?text=est', 285.40, 382.30, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(259, 41, 8, 'ea', 'ea', NULL, 'https://via.placeholder.com/600x600.png/0055aa?text=totam', 335.60, 438.80, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(260, 42, 27, 'est', 'est', NULL, 'https://via.placeholder.com/600x600.png/00ffbb?text=quidem', 432.70, 240.10, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(261, 42, 36, 'facere', 'facere', NULL, 'https://via.placeholder.com/600x600.png/00eecc?text=numquam', 464.70, 54.50, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(262, 42, 29, 'harum', 'harum', NULL, 'https://via.placeholder.com/600x600.png/00ddcc?text=est', 461.60, 409.00, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(263, 43, 32, 'explicabo', 'explicabo', NULL, 'https://via.placeholder.com/600x600.png/000055?text=et', 272.50, 161.70, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(264, 41, 33, 'distinctio', 'distinctio', NULL, 'https://via.placeholder.com/600x600.png/002266?text=nesciunt', 447.90, 54.70, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(265, 41, 33, 'aperiam', 'aperiam', NULL, 'https://via.placeholder.com/600x600.png/00cc99?text=dignissimos', 239.20, 259.70, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(266, 41, 31, 'fuga', 'fuga', NULL, 'https://via.placeholder.com/600x600.png/0066bb?text=ab', 399.60, 416.80, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(267, 39, 29, 'architecto', 'architecto', NULL, 'https://via.placeholder.com/600x600.png/0000ff?text=dolor', 235.10, 212.50, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(268, 43, 8, 'et', 'et', NULL, 'https://via.placeholder.com/600x600.png/002211?text=et', 205.70, 442.50, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(269, 39, 33, 'voluptas', 'voluptas', NULL, 'https://via.placeholder.com/600x600.png/0066cc?text=magnam', 5.90, 319.60, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(270, 40, 27, 'explicabo', 'explicabo', NULL, 'https://via.placeholder.com/600x600.png/0055cc?text=optio', 123.40, 24.70, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(271, 39, 29, 'hic', 'hic', NULL, 'https://via.placeholder.com/600x600.png/0099bb?text=aperiam', 277.00, 391.90, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(272, 39, 33, 'quod', 'quod', NULL, 'https://via.placeholder.com/600x600.png/0066dd?text=voluptas', 148.20, 412.20, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(273, 43, 9, 'at', 'at', NULL, 'https://via.placeholder.com/600x600.png/008822?text=quia', 92.40, 199.10, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(274, 39, 29, 'a', 'a', NULL, 'https://via.placeholder.com/600x600.png/0033cc?text=in', 206.20, 305.00, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(275, 40, 8, 'corrupti', 'corrupti', NULL, 'https://via.placeholder.com/600x600.png/0022dd?text=rerum', 329.80, 439.00, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(276, 40, 30, 'tenetur', 'tenetur', NULL, 'https://via.placeholder.com/600x600.png/0022cc?text=qui', 174.70, 251.30, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(277, 43, 31, 'animi', 'animi', NULL, 'https://via.placeholder.com/600x600.png/004400?text=amet', 287.70, 309.80, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(278, 39, 27, 'officia', 'officia', NULL, 'https://via.placeholder.com/600x600.png/00bb55?text=quae', 65.70, 6.50, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(279, 39, 34, 'dolores', 'dolores', NULL, 'https://via.placeholder.com/600x600.png/0088bb?text=occaecati', 337.20, 204.00, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(280, 41, 27, 'explicabo', 'explicabo', NULL, 'https://via.placeholder.com/600x600.png/00aaff?text=repellendus', 20.30, 447.60, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(281, 40, 29, 'cum', 'cum', NULL, 'https://via.placeholder.com/600x600.png/00cc88?text=explicabo', 309.90, 484.90, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(282, 42, 34, 'mollitia', 'mollitia', NULL, 'https://via.placeholder.com/600x600.png/00aa11?text=doloribus', 66.00, 402.40, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(283, 42, 36, 'ab', 'ab', NULL, 'https://via.placeholder.com/600x600.png/0011ff?text=voluptatibus', 356.70, 23.90, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(284, 40, 36, 'dolore', 'dolore', NULL, 'https://via.placeholder.com/600x600.png/007799?text=consequatur', 322.40, 458.90, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(285, 43, 35, 'qui', 'qui', NULL, 'https://via.placeholder.com/600x600.png/001177?text=id', 199.50, 297.50, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(286, 40, 28, 'eum', 'eum', NULL, 'https://via.placeholder.com/600x600.png/009988?text=corrupti', 474.40, 328.80, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(287, 42, 35, 'corrupti', 'corrupti', NULL, 'https://via.placeholder.com/600x600.png/0011cc?text=sit', 122.00, 303.00, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(288, 41, 33, 'aliquid', 'aliquid', NULL, 'https://via.placeholder.com/600x600.png/00ff11?text=error', 345.40, 104.50, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(289, 42, 36, 'voluptate', 'voluptate', NULL, 'https://via.placeholder.com/600x600.png/00cc88?text=nam', 442.60, 423.20, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(290, 39, 31, 'sint', 'sint', NULL, 'https://via.placeholder.com/600x600.png/00ee66?text=sed', 126.70, 341.10, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(291, 42, 29, 'est', 'est', NULL, 'https://via.placeholder.com/600x600.png/000000?text=quos', 107.30, 358.00, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(292, 41, 34, 'enim', 'enim', NULL, 'https://via.placeholder.com/600x600.png/0022ee?text=necessitatibus', 342.50, 148.40, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(293, 40, 35, 'voluptas', 'voluptas', NULL, 'https://via.placeholder.com/600x600.png/0055aa?text=ea', 283.60, 374.60, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(294, 39, 32, 'adipisci', 'adipisci', NULL, 'https://via.placeholder.com/600x600.png/006677?text=dignissimos', 50.50, 393.50, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(295, 39, 28, 'non', 'non', NULL, 'https://via.placeholder.com/600x600.png/000077?text=optio', 431.90, 265.00, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(296, 41, 33, 'exercitationem', 'exercitationem', NULL, 'https://via.placeholder.com/600x600.png/001199?text=tempora', 340.50, 253.50, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(297, 43, 30, 'illo', 'illo', NULL, 'https://via.placeholder.com/600x600.png/005599?text=est', 199.00, 214.70, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(298, 40, 36, 'consequatur', 'consequatur', NULL, 'https://via.placeholder.com/600x600.png/0044cc?text=voluptatem', 122.90, 90.00, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(299, 42, 31, 'quisquam', 'quisquam', NULL, 'https://via.placeholder.com/600x600.png/005599?text=ipsa', 21.50, 50.20, NULL, 0.00, 1, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55'),
(300, 43, 9, 'quia', 'quia', NULL, 'https://via.placeholder.com/600x600.png/00eeff?text=eos', 14.60, 114.60, NULL, 0.00, 0, 'active', '2023-02-18 18:47:55', '2023-02-18 18:47:55');

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `local` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`user_id`, `first_name`, `last_name`, `birthday`, `gender`, `street_address`, `city`, `state`, `postal_code`, `country`, `local`, `created_at`, `updated_at`) VALUES
(1, 'Ahmad', 'Ali', '1997-04-08', 'male', 'Jordan Amman', 'Amman', 'Amman', '10995', 'Jordan', 'Arabic (Jordan)', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`) VALUES
(1, 'ahmad', 'ahmad'),
(2, 'ali', 'ali');

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
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone_number`, `remember_token`, `created_at`, `updated_at`, `store_id`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$soJM7xLteR5Q48HhyYoMVu6Dgr1NY1S.6xpmG.MDI7duXJi6coum2', NULL, NULL, '2023-02-28 19:35:23', '2023-02-28 19:35:23', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `product_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stores_slug_unique` (`slug`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`),
  ADD KEY `users_store_id_foreign` (`store_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
