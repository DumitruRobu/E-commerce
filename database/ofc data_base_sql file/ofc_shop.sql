-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4000
-- Generation Time: Sep 22, 2023 at 10:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ofc_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `showHome` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `status`, `showHome`, `created_at`, `updated_at`, `category_image`) VALUES
(1, 'Pants', NULL, 1, 'Yes', '2023-08-25 16:47:38', '2023-09-06 14:08:16', 'https://www.houseoffraser.co.uk/images/products/62215018_l.jpg'),
(2, 'T-shirt', NULL, 1, 'Yes', '2023-08-25 16:48:37', '2023-09-06 14:10:04', 'https://www.houseoffraser.co.uk/images/products/59343203_l.jpg'),
(3, 'Sweater', NULL, 1, 'Yes', '2023-08-25 16:48:50', '2023-09-06 14:13:35', 'https://www.houseoffraser.co.uk/images/products/32934318_l.jpg'),
(4, 'Shirts', NULL, 1, 'Yes', '2023-08-25 16:49:03', '2023-09-06 14:13:53', 'https://www.houseoffraser.co.uk/images/products/50903801_l.jpg'),
(5, 'Dress', NULL, 1, 'Yes', '2023-08-25 16:49:15', '2023-09-06 14:08:45', 'https://www.houseoffraser.co.uk/images/products/63149913_l.jpg'),
(6, 'Shorts', NULL, 1, 'Yes', '2023-08-25 16:49:30', '2023-09-06 14:14:17', 'https://www.houseoffraser.co.uk/images/products/47281402_l.jpg'),
(57, 'Jacket', NULL, 0, 'Yes', '2023-09-06 14:31:13', '2023-09-21 16:25:16', 'https://www.houseoffraser.co.uk/images/products/60953003_l.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', NULL, NULL),
(2, 'Albania', 'AL', NULL, NULL),
(3, 'Algeria', 'DZ', NULL, NULL),
(4, 'American Samoa', 'AS', NULL, NULL),
(5, 'Andorra', 'AD', NULL, NULL),
(6, 'Angola', 'AO', NULL, NULL),
(7, 'Anguilla', 'AI', NULL, NULL),
(8, 'Antarctica', 'AQ', NULL, NULL),
(9, 'Antigua and/or Barbuda', 'AG', NULL, NULL),
(10, 'Argentina', 'AR', NULL, NULL),
(11, 'Armenia', 'AM', NULL, NULL),
(12, 'Aruba', 'AW', NULL, NULL),
(13, 'Australia', 'AU', NULL, NULL),
(14, 'Austria', 'AT', NULL, NULL),
(15, 'Azerbaijan', 'AZ', NULL, NULL),
(16, 'Bahamas', 'BS', NULL, NULL),
(17, 'Bahrain', 'BH', NULL, NULL),
(18, 'Bangladesh', 'BD', NULL, NULL),
(19, 'Barbados', 'BB', NULL, NULL),
(20, 'Belarus', 'BY', NULL, NULL),
(21, 'Belgium', 'BE', NULL, NULL),
(22, 'Belize', 'BZ', NULL, NULL),
(23, 'Benin', 'BJ', NULL, NULL),
(24, 'Bermuda', 'BM', NULL, NULL),
(25, 'Bhutan', 'BT', NULL, NULL),
(26, 'Bolivia', 'BO', NULL, NULL),
(27, 'Bosnia and Herzegovina', 'BA', NULL, NULL),
(28, 'Botswana', 'BW', NULL, NULL),
(29, 'Bouvet Island', 'BV', NULL, NULL),
(30, 'Brazil', 'BR', NULL, NULL),
(31, 'British lndian Ocean Territory', 'IO', NULL, NULL),
(32, 'Brunei Darussalam', 'BN', NULL, NULL),
(33, 'Bulgaria', 'BG', NULL, NULL),
(34, 'Burkina Faso', 'BF', NULL, NULL),
(35, 'Burundi', 'BI', NULL, NULL),
(36, 'Cambodia', 'KH', NULL, NULL),
(37, 'Cameroon', 'CM', NULL, NULL),
(38, 'Canada', 'CA', NULL, NULL),
(39, 'Cape Verde', 'CV', NULL, NULL),
(40, 'Cayman Islands', 'KY', NULL, NULL),
(41, 'Central African Republic', 'CF', NULL, NULL),
(42, 'Chad', 'TD', NULL, NULL),
(43, 'Chile', 'CL', NULL, NULL),
(44, 'China', 'CN', NULL, NULL),
(45, 'Christmas Island', 'CX', NULL, NULL),
(46, 'Cocos (Keeling) Islands', 'CC', NULL, NULL),
(47, 'Colombia', 'CO', NULL, NULL),
(48, 'Comoros', 'KM', NULL, NULL),
(49, 'Congo', 'CG', NULL, NULL),
(50, 'Cook Islands', 'CK', NULL, NULL),
(51, 'Costa Rica', 'CR', NULL, NULL),
(52, 'Croatia (Hrvatska)', 'HR', NULL, NULL),
(53, 'Cuba', 'CU', NULL, NULL),
(54, 'Cyprus', 'CY', NULL, NULL),
(55, 'Czech Republic', 'CZ', NULL, NULL),
(56, 'Democratic Republic of Congo', 'CD', NULL, NULL),
(57, 'Denmark', 'DK', NULL, NULL),
(58, 'Djibouti', 'DJ', NULL, NULL),
(59, 'Dominica', 'DM', NULL, NULL),
(60, 'Dominican Republic', 'DO', NULL, NULL),
(61, 'East Timor', 'TP', NULL, NULL),
(62, 'Ecudaor', 'EC', NULL, NULL),
(63, 'Egypt', 'EG', NULL, NULL),
(64, 'El Salvador', 'SV', NULL, NULL),
(65, 'Equatorial Guinea', 'GQ', NULL, NULL),
(66, 'Eritrea', 'ER', NULL, NULL),
(67, 'Estonia', 'EE', NULL, NULL),
(68, 'Ethiopia', 'ET', NULL, NULL),
(69, 'Falkland Islands (Malvinas)', 'FK', NULL, NULL),
(70, 'Faroe Islands', 'FO', NULL, NULL),
(71, 'Fiji', 'FJ', NULL, NULL),
(72, 'Finland', 'FI', NULL, NULL),
(73, 'France', 'FR', NULL, NULL),
(74, 'France, Metropolitan', 'FX', NULL, NULL),
(75, 'French Guiana', 'GF', NULL, NULL),
(76, 'French Polynesia', 'PF', NULL, NULL),
(77, 'French Southern Territories', 'TF', NULL, NULL),
(78, 'Gabon', 'GA', NULL, NULL),
(79, 'Gambia', 'GM', NULL, NULL),
(80, 'Georgia', 'GE', NULL, NULL),
(81, 'Germany', 'DE', NULL, NULL),
(82, 'Ghana', 'GH', NULL, NULL),
(83, 'Gibraltar', 'GI', NULL, NULL),
(84, 'Greece', 'GR', NULL, NULL),
(85, 'Greenland', 'GL', NULL, NULL),
(86, 'Grenada', 'GD', NULL, NULL),
(87, 'Guadeloupe', 'GP', NULL, NULL),
(88, 'Guam', 'GU', NULL, NULL),
(89, 'Guatemala', 'GT', NULL, NULL),
(90, 'Guinea', 'GN', NULL, NULL),
(91, 'Guinea-Bissau', 'GW', NULL, NULL),
(92, 'Guyana', 'GY', NULL, NULL),
(93, 'Haiti', 'HT', NULL, NULL),
(94, 'Heard and Mc Donald Islands', 'HM', NULL, NULL),
(95, 'Honduras', 'HN', NULL, NULL),
(96, 'Hong Kong', 'HK', NULL, NULL),
(97, 'Hungary', 'HU', NULL, NULL),
(98, 'Iceland', 'IS', NULL, NULL),
(99, 'India', 'IN', NULL, NULL),
(100, 'Indonesia', 'ID', NULL, NULL),
(101, 'Iran (Islamic Republic of)', 'IR', NULL, NULL),
(102, 'Iraq', 'IQ', NULL, NULL),
(103, 'Ireland', 'IE', NULL, NULL),
(104, 'Israel', 'IL', NULL, NULL),
(105, 'Italy', 'IT', NULL, NULL),
(106, 'Ivory Coast', 'CI', NULL, NULL),
(107, 'Jamaica', 'JM', NULL, NULL),
(108, 'Japan', 'JP', NULL, NULL),
(109, 'Jordan', 'JO', NULL, NULL),
(110, 'Kazakhstan', 'KZ', NULL, NULL),
(111, 'Kenya', 'KE', NULL, NULL),
(112, 'Kiribati', 'KI', NULL, NULL),
(113, 'Korea, Democratic People\'s Republic of', 'KP', NULL, NULL),
(114, 'Korea, Republic of', 'KR', NULL, NULL),
(115, 'Kuwait', 'KW', NULL, NULL),
(116, 'Kyrgyzstan', 'KG', NULL, NULL),
(117, 'Lao People\'s Democratic Republic', 'LA', NULL, NULL),
(118, 'Latvia', 'LV', NULL, NULL),
(119, 'Lebanon', 'LB', NULL, NULL),
(120, 'Lesotho', 'LS', NULL, NULL),
(121, 'Liberia', 'LR', NULL, NULL),
(122, 'Libyan Arab Jamahiriya', 'LY', NULL, NULL),
(123, 'Liechtenstein', 'LI', NULL, NULL),
(124, 'Lithuania', 'LT', NULL, NULL),
(125, 'Luxembourg', 'LU', NULL, NULL),
(126, 'Macau', 'MO', NULL, NULL),
(127, 'Macedonia', 'MK', NULL, NULL),
(128, 'Madagascar', 'MG', NULL, NULL),
(129, 'Malawi', 'MW', NULL, NULL),
(130, 'Malaysia', 'MY', NULL, NULL),
(131, 'Maldives', 'MV', NULL, NULL),
(132, 'Mali', 'ML', NULL, NULL),
(133, 'Malta', 'MT', NULL, NULL),
(134, 'Marshall Islands', 'MH', NULL, NULL),
(135, 'Martinique', 'MQ', NULL, NULL),
(136, 'Mauritania', 'MR', NULL, NULL),
(137, 'Mauritius', 'MU', NULL, NULL),
(138, 'Mayotte', 'TY', NULL, NULL),
(139, 'Mexico', 'MX', NULL, NULL),
(140, 'Micronesia, Federated States of', 'FM', NULL, NULL),
(141, 'Moldova', 'MD', NULL, NULL),
(142, 'Monaco', 'MC', NULL, NULL),
(143, 'Mongolia', 'MN', NULL, NULL),
(144, 'Montserrat', 'MS', NULL, NULL),
(145, 'Morocco', 'MA', NULL, NULL),
(146, 'Mozambique', 'MZ', NULL, NULL),
(147, 'Myanmar', 'MM', NULL, NULL),
(148, 'Namibia', 'NA', NULL, NULL),
(149, 'Nauru', 'NR', NULL, NULL),
(150, 'Nepal', 'NP', NULL, NULL),
(151, 'Netherlands', 'NL', NULL, NULL),
(152, 'Netherlands Antilles', 'AN', NULL, NULL),
(153, 'New Caledonia', 'NC', NULL, NULL),
(154, 'New Zealand', 'NZ', NULL, NULL),
(155, 'Nicaragua', 'NI', NULL, NULL),
(156, 'Niger', 'NE', NULL, NULL),
(157, 'Nigeria', 'NG', NULL, NULL),
(158, 'Niue', 'NU', NULL, NULL),
(159, 'Norfork Island', 'NF', NULL, NULL),
(160, 'Northern Mariana Islands', 'MP', NULL, NULL),
(161, 'Norway', 'NO', NULL, NULL),
(162, 'Oman', 'OM', NULL, NULL),
(163, 'Pakistan', 'PK', NULL, NULL),
(164, 'Palau', 'PW', NULL, NULL),
(165, 'Panama', 'PA', NULL, NULL),
(166, 'Papua New Guinea', 'PG', NULL, NULL),
(167, 'Paraguay', 'PY', NULL, NULL),
(168, 'Peru', 'PE', NULL, NULL),
(169, 'Philippines', 'PH', NULL, NULL),
(170, 'Pitcairn', 'PN', NULL, NULL),
(171, 'Poland', 'PL', NULL, NULL),
(172, 'Portugal', 'PT', NULL, NULL),
(173, 'Puerto Rico', 'PR', NULL, NULL),
(174, 'Qatar', 'QA', NULL, NULL),
(175, 'Republic of South Sudan', 'SS', NULL, NULL),
(176, 'Reunion', 'RE', NULL, NULL),
(177, 'Romania', 'RO', NULL, NULL),
(178, 'Russian Federation', 'RU', NULL, NULL),
(179, 'Rwanda', 'RW', NULL, NULL),
(180, 'Saint Kitts and Nevis', 'KN', NULL, NULL),
(181, 'Saint Lucia', 'LC', NULL, NULL),
(182, 'Saint Vincent and the Grenadines', 'VC', NULL, NULL),
(183, 'Samoa', 'WS', NULL, NULL),
(184, 'San Marino', 'SM', NULL, NULL),
(185, 'Sao Tome and Principe', 'ST', NULL, NULL),
(186, 'Saudi Arabia', 'SA', NULL, NULL),
(187, 'Senegal', 'SN', NULL, NULL),
(188, 'Serbia', 'RS', NULL, NULL),
(189, 'Seychelles', 'SC', NULL, NULL),
(190, 'Sierra Leone', 'SL', NULL, NULL),
(191, 'Singapore', 'SG', NULL, NULL),
(192, 'Slovakia', 'SK', NULL, NULL),
(193, 'Slovenia', 'SI', NULL, NULL),
(194, 'Solomon Islands', 'SB', NULL, NULL),
(195, 'Somalia', 'SO', NULL, NULL),
(196, 'South Africa', 'ZA', NULL, NULL),
(197, 'South Georgia South Sandwich Islands', 'GS', NULL, NULL),
(198, 'Spain', 'ES', NULL, NULL),
(199, 'Sri Lanka', 'LK', NULL, NULL),
(200, 'St. Helena', 'SH', NULL, NULL),
(201, 'St. Pierre and Miquelon', 'PM', NULL, NULL),
(202, 'Sudan', 'SD', NULL, NULL),
(203, 'Suriname', 'SR', NULL, NULL),
(204, 'Svalbarn and Jan Mayen Islands', 'SJ', NULL, NULL),
(205, 'Swaziland', 'SZ', NULL, NULL),
(206, 'Sweden', 'SE', NULL, NULL),
(207, 'Switzerland', 'CH', NULL, NULL),
(208, 'Syrian Arab Republic', 'SY', NULL, NULL),
(209, 'Taiwan', 'TW', NULL, NULL),
(210, 'Tajikistan', 'TJ', NULL, NULL),
(211, 'Tanzania, United Republic of', 'TZ', NULL, NULL),
(212, 'Thailand', 'TH', NULL, NULL),
(213, 'Togo', 'TG', NULL, NULL),
(214, 'Tokelau', 'TK', NULL, NULL),
(215, 'Tonga', 'TO', NULL, NULL),
(216, 'Trinidad and Tobago', 'TT', NULL, NULL),
(217, 'Tunisia', 'TN', NULL, NULL),
(218, 'Turkey', 'TR', NULL, NULL),
(219, 'Turkmenistan', 'TM', NULL, NULL),
(220, 'Turks and Caicos Islands', 'TC', NULL, NULL),
(221, 'Tuvalu', 'TV', NULL, NULL),
(222, 'Uganda', 'UG', NULL, NULL),
(223, 'Ukraine', 'UA', NULL, NULL),
(224, 'United Arab Emirates', 'AE', NULL, NULL),
(225, 'United Kingdom', 'GB', NULL, NULL),
(226, 'United States', 'US', NULL, NULL),
(227, 'United States minor outlying islands', 'UM', NULL, NULL),
(228, 'Uruguay', 'UY', NULL, NULL),
(229, 'Uzbekistan', 'UZ', NULL, NULL),
(230, 'Vanuatu', 'VU', NULL, NULL),
(231, 'Vatican City State', 'VA', NULL, NULL),
(232, 'Venezuela', 'VE', NULL, NULL),
(233, 'Vietnam', 'VN', NULL, NULL),
(234, 'Virgin Islands (British)', 'VG', NULL, NULL),
(235, 'Virgin Islands (U.S.)', 'VI', NULL, NULL),
(236, 'Wallis and Futuna Islands', 'WF', NULL, NULL),
(237, 'Western Sahara', 'EH', NULL, NULL),
(238, 'Yemen', 'YE', NULL, NULL),
(239, 'Yugoslavia', 'YU', NULL, NULL),
(240, 'Zaire', 'ZR', NULL, NULL),
(241, 'Zambia', 'ZM', NULL, NULL),
(242, 'Zimbabwe', 'ZW', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` text DEFAULT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `user_id`, `first_name`, `last_name`, `email`, `mobile`, `country_id`, `address`, `apartment`, `city`, `state`, `zip`, `created_at`, `updated_at`) VALUES
(2, 3, 'Adrian', 'Timotin', 'adriantimotin@gmail.com', '062099020', 141, 'Dacia/32', '22', 'Chisinau', 'asdfasf', '1111', '2023-09-11 15:26:56', '2023-09-20 15:49:43'),
(5, 25, 'Vlad', 'Plahotniuc', 'plaha@gmail.com', '12345678', 218, 'Antalya/23', '234', 'Antalya', NULL, '1234', '2023-09-20 16:55:00', '2023-09-20 16:55:00'),
(6, 9, 'Cristi', 'Lalea', 'cristi@gmail.com', '13245678', 52, 'croatia 234', NULL, 'IdontKnow', NULL, '4567', '2023-09-20 16:58:30', '2023-09-20 16:58:30'),
(7, 2, 'asdfasdf', 'asdfasdf', 'asfd@asdf.cxvb', '123456785678', 41, 'sadfasdfasdfasdf', '123', 'asdfasdfasdf', NULL, 'as12', '2023-09-20 17:03:41', '2023-09-20 17:03:41'),
(8, 30, 'User', 'Example', 'user@example.com', '12340987', 44, 'asdfpoiuklkjhzxc', '13B', 'A City From China', NULL, '1234', '2023-09-22 12:29:21', '2023-09-22 12:31:09'),
(9, 31, 'Creanga', 'Ion', 'nica_ionel@gmail.com', '076562435', 177, 'Bucuresti 35', '123B', 'Bucuresti', NULL, '12345-6789', '2023-09-22 14:19:10', '2023-09-22 14:33:48');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
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
(5, '2023_08_23_095650_alter_users', 2),
(6, '2023_08_24_125613_create_categories_table', 3),
(7, '2023_08_26_081031_create_products_table', 4),
(8, '2023_08_26_081159_create_product_images_table', 4),
(9, '2023_08_28_163012_add_main_image_to_products_table', 5),
(10, '2023_08_28_170138_aditional_images', 6),
(11, '2023_08_29_132745_remove_sku_and_barcode', 7),
(12, '2023_09_01_141834_alter_categories_table', 8),
(13, '2023_09_01_144018_alter_products_table', 9),
(16, '2023_09_01_150952_add_category_image', 10),
(17, '2023_09_01_170735_add_product_gender', 10),
(18, '2023_09_05_184133_modify_product_images_table', 10),
(19, '2023_09_09_143006_alter_users_table', 11),
(20, '2023_09_10_185445_create_countries_table', 12),
(21, '2023_09_11_151157_create_orders_table', 13),
(22, '2023_09_11_151252_create_order_items_table', 13),
(23, '2023_09_11_151344_create_customer_adresses_table', 13),
(24, '2023_09_11_205954_add_grand_total_to_orders_table', 14),
(25, '2023_09_13_123452_create_wishlist_table', 15),
(26, '2023_09_19_192647_alter_users_table', 16),
(27, '2023_09_20_193515_make_state_nullable_in_orders', 17);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` double(10,2) NOT NULL,
  `shipping` double(10,2) NOT NULL,
  `grand_total` double(10,2) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `shipping`, `grand_total`, `first_name`, `last_name`, `email`, `mobile`, `country_id`, `address`, `apartment`, `city`, `state`, `zip`, `notes`, `created_at`, `updated_at`) VALUES
(1, 3, 425.00, 0.00, 425.00, 'Adrian', 'Timotin', 'adriantimotin1@gmail.com', '062099020', 141, 'Dacia/32', '22', 'Chisinau', 'asdfasf', '1111', 'qwertyqwerty', '2023-09-11 18:14:00', '2023-09-11 18:14:00'),
(2, 3, 190.00, 0.00, 190.00, 'Adrian', 'Timotin', 'adriantimotin1@gmail.com', '062099020', 141, 'Dacia/32', '22', 'Chisinau', 'asdfasf', '1111', NULL, '2023-09-14 11:38:51', '2023-09-14 11:38:51'),
(4, 25, 159.00, 0.00, 159.00, 'Vlad', 'Plahotniuc', 'plaha@gmail.com', '12345678', 218, 'Antalya/23', '234', 'Antalya', NULL, '1234', NULL, '2023-09-20 16:55:00', '2023-09-20 16:55:00'),
(5, 9, 300.00, 0.00, 300.00, 'Cristi', 'Lalea', 'cristi@gmail.com', '13245678', 52, 'croatia 234', NULL, 'IdontKnow', NULL, '4567', NULL, '2023-09-20 16:58:30', '2023-09-20 16:58:30'),
(6, 2, 305.00, 0.00, 305.00, 'asdfasdf', 'asdfasdf', 'asfd@asdf.cxvb', '123456785678', 41, 'sadfasdfasdfasdf', '123', 'asdfasdfasdf', NULL, 'as12', NULL, '2023-09-20 17:03:41', '2023-09-20 17:03:41'),
(7, 31, 2525.00, 0.00, 2525.00, 'Creanga', 'Ion', 'nica_ionel@gmail.com', '076562435', 177, 'Bucuresti 35', '123B', 'Bucuresti', NULL, '12345-6789', 'asdfghjkghjksfgsdfgh', '2023-09-22 14:20:39', '2023-09-22 14:20:39'),
(8, 31, 300.00, 0.00, 300.00, 'Creanga', 'Ion', 'nica_ionel@gmail.com', '076562435', 178, 'Bucuresti 35', '123B', 'Bucuresti', NULL, '12345-6789', NULL, '2023-09-22 14:33:19', '2023-09-22 14:33:19'),
(9, 3, 4010.00, 0.00, 4010.00, 'Adrian', 'Timotin', 'adriantimotin@gmail.com', '062099020', 141, 'Dacia/32', '22', 'Chisinau', 'asdfasf', '1111', 'Livreaza atent te rog frumos', '2023-09-22 14:52:00', '2023-09-22 14:52:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` double(10,2) NOT NULL,
  `total` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `name`, `qty`, `price`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 17, 'Azalea Midi Dress BARBOUR', 1, 425.00, 425.00, '2023-09-11 18:14:00', '2023-09-11 18:14:00'),
(2, 2, 29, 'BARBOUR Soules T-Shirt', 1, 190.00, 190.00, '2023-09-14 11:38:51', '2023-09-14 11:38:51'),
(5, 4, 19, 'THE NORTH FACE Cropped Simple T-Shirt', 1, 159.00, 159.00, '2023-09-20 16:55:00', '2023-09-20 16:55:00'),
(6, 5, 30, 'Easy T-shirt THE NORTH FACE', 1, 300.00, 300.00, '2023-09-20 16:58:30', '2023-09-20 16:58:30'),
(7, 6, 42, 'POLO RALPH LAUREN Tech Shorts', 1, 305.00, 305.00, '2023-09-20 17:03:41', '2023-09-20 17:03:41'),
(8, 7, 41, 'ETON Slim Fit Signature Twill Shirt', 5, 420.00, 2100.00, '2023-09-22 14:20:39', '2023-09-22 14:20:39'),
(9, 7, 17, 'Azalea Midi Dress BARBOUR', 1, 425.00, 425.00, '2023-09-22 14:20:39', '2023-09-22 14:20:39'),
(10, 8, 30, 'Easy T-shirt THE NORTH FACE', 1, 300.00, 300.00, '2023-09-22 14:33:20', '2023-09-22 14:33:20'),
(11, 9, 41, 'ETON Slim Fit Signature Twill Shirt', 3, 420.00, 1260.00, '2023-09-22 14:52:00', '2023-09-22 14:52:00'),
(12, 9, 22, 'LAUREN Black Op Dress', 3, 470.00, 1410.00, '2023-09-22 14:52:01', '2023-09-22 14:52:01'),
(13, 9, 25, 'BOSS Spectre Trousers', 2, 670.00, 1340.00, '2023-09-22 14:52:01', '2023-09-22 14:52:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` double(10,2) NOT NULL,
  `compare_price` double(10,2) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `is_featured` enum('Yes','No') NOT NULL DEFAULT 'No',
  `track_qty` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `qty` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `main_image` varchar(255) DEFAULT NULL,
  `additional_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional_images`)),
  `gender` enum('Male','Female') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `compare_price`, `category_id`, `is_featured`, `track_qty`, `qty`, `status`, `created_at`, `updated_at`, `main_image`, `additional_images`, `gender`) VALUES
(4, 'POLO Shirt Dress', 'Lorem ipsum dolor sit amet consectetur modi dignissimos magni itaque ipsum eaque neque minus, explicabo provident fuga beatae eum quo vitae, perspiciatis vel ex eligendi. Impedit, expedita molestiae ipsam accusamus excepturi eius ipsum.', 549.00, 699.00, 5, 'Yes', 'Yes', 18, 1, '2023-08-28 13:49:48', '2023-09-06 16:56:26', 'https://www.houseoffraser.co.uk/images/products/63095718_l.jpg', '[null,null,null,null]', 'Female'),
(5, 'Polo Logo Vntge Crw Sn32', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea, commodi. Enim suscipit soluta modi dignissimos magni itaque ipsum eaque neque minus.', 300.00, 450.00, 3, 'Yes', 'Yes', 23, 1, '2023-08-28 13:55:54', '2023-09-06 16:56:01', 'https://www.houseoffraser.co.uk/images/products/52265815_l.jpg', '[null,null,null,null]', 'Male'),
(7, 'Schino Slim Chino Shorts', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea, commodi. Enim suscipit soluta modi dignissimos , explicabo provident fuga beatae eum quo vitae, perspiciatis vel ex eligendi. Impedit, expedita molestiae ipsam accusamus excepturi eius ipsum.', 450.00, 550.00, 6, 'No', 'Yes', 30, 1, '2023-08-30 11:40:04', '2023-09-06 16:55:36', 'https://www.houseoffraser.co.uk/images/products/47817318_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/47817318_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/47817318_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/47817318_l_a3.jpg\",null]', 'Male'),
(8, 'Boss Maine Jeans', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus quam, pariatur atque dolore accusantium, vero incidunt dolores quaerat laudantium modi et rerum architecto.', 700.00, 550.00, 1, 'Yes', 'Yes', 20, 1, '2023-08-30 14:37:47', '2023-09-09 04:16:54', 'https://www.houseoffraser.co.uk/images/products/63209418_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/63209418_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/63209418_l_a2.jpg\",null,null]', 'Female'),
(9, '501 Original Shorts', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. In ipsa repellat molestias ipsam ut maxime ratione delectus?', 399.00, 450.00, 6, 'Yes', 'Yes', 35, 1, '2023-08-30 16:17:22', '2023-09-06 16:54:34', 'https://www.houseoffraser.co.uk/images/products/64412521_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/64412521_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/64412521_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/64412521_l_a3.jpg\",null]', 'Female'),
(14, 'Lacoste Logo T Shirt', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum deleniti voluptatibus corrupti aliquid in dolore omnis placeat alias. Facere aliquam, excepturi tenetur vitae ad nesciunt veniam quo dolorum accusantium aliquid!', 259.00, 300.00, 2, 'Yes', 'Yes', 40, 1, '2023-09-02 10:07:53', '2023-09-06 16:53:56', 'https://www.houseoffraser.co.uk/images/products/59764203_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/59764203_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/59764203_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/59764203_l_a3.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/59764203_l_a4.jpg\"]', 'Male'),
(15, 'Poplin White Shirt Polo', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum deleniti voluptatibus corrupti aliquid in excepturi tenetur vitae ad nesciunt veniam quo dolorum accusantium aliquid!', 400.00, 559.00, 4, 'Yes', 'Yes', 23, 1, '2023-09-02 10:11:10', '2023-09-06 16:53:33', 'https://www.houseoffraser.co.uk/images/products/55829401_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/55829401_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/55829401_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/55829401_l_a3.jpg\",null]', 'Male'),
(16, 'BOSS Pink Sweatshirt 08', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Vi aliquid in dolore omnis placeat alias. Facere aliquam, excepturi tenetur vitae ad nesciunt veniam quo dolorum accusantium aliquid!', 670.00, 800.00, 3, 'Yes', 'No', NULL, 1, '2023-09-02 10:13:51', '2023-09-06 16:52:59', 'https://www.houseoffraser.co.uk/images/products/66201106_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/66201106_l_a1.jpg\",null,null,null]', 'Female'),
(17, 'Azalea Midi Dress BARBOUR', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum deleniti voluptatibus corrupti aliquid in dolore omnis placeat alias.', 425.00, 475.00, 5, 'No', 'Yes', 55, 1, '2023-09-02 10:18:19', '2023-09-06 16:52:20', 'https://www.houseoffraser.co.uk/images/products/63219706_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/63219706_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/63219706_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/63219706_l_a4.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/63219706_l_a5.jpg\"]', 'Female'),
(18, 'MANKIND Aubrey Slim Jeans', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum deleniti voluptatibus corrupti aliquid in dolore omnis placeat alias. Facere aliquam, excepturi tenetur vitae ad nesciunt veniam quo dolorum accusantium aliquid!', 470.00, 600.00, 1, 'Yes', 'No', NULL, 1, '2023-09-02 10:22:02', '2023-09-06 16:49:57', 'https://www.houseoffraser.co.uk/images/products/64628818_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/64628818_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/64628818_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/64628818_l_a3.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/64628818_l_a4.jpg\"]', 'Female'),
(19, 'THE NORTH FACE Cropped Simple T-Shirt', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum deleniti voluptatibus corrupti aliquid in dolore omnis placeat alias excepturi tenetur vitae ad nesciunt veniam quo dolorum accusantium aliquid!', 159.00, 200.00, 2, 'Yes', 'No', NULL, 1, '2023-09-02 10:25:54', '2023-09-06 16:49:32', 'https://www.houseoffraser.co.uk/images/products/64491524_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/64491524_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/64491524_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/64491524_l_a3.jpg\",null]', 'Female'),
(20, 'POLO RALPH LAUREN Polo Golf Chino Shorts', 'Lorem ipsum dolor sit  voluptatum deleniti voluptatibus corrupti aliquid in dolore omnis placeat alias. Facere aliquam, excepturi tenetur vitae ad nesciunt veniam quo dolorum accusantium aliquid!', 400.00, NULL, 6, 'Yes', 'Yes', 45, 1, '2023-09-02 10:28:32', '2023-09-06 16:48:52', 'https://www.houseoffraser.co.uk/images/products/36711104_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/36711104_l_a10.jpg\",null,null,null]', 'Male'),
(22, 'LAUREN Black Op Dress', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum deleniti voluptatibus corrupti aliquid in dolore omnis placeat alias. Facere aliquam, excepturi tenetur vitae ad nesciunt veniam quo dolorum accusantium aliquid!', 470.00, 530.00, 5, 'Yes', 'No', NULL, 1, '2023-09-04 14:37:31', '2023-09-06 16:47:11', 'https://www.houseoffraser.co.uk/images/products/32565703_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/32565703_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/32565703_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/32565703_l_a3.jpg\",null]', 'Female'),
(23, 'POLO Wrap Dress', 'Wrap Dress pink color', 300.00, 350.00, 5, 'No', 'Yes', 30, 1, '2023-09-04 14:40:21', '2023-09-06 16:46:09', 'https://www.houseoffraser.co.uk/images/products/65756606_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/65756606_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/65756606_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/65756606_l_a3.jpg\",null]', 'Female'),
(24, 'BOSS Slim  Trousers', 'Lorem ipsum dolor sit amet consectetur adipisicing acere at quod nisi dignissimo elit. Laudantium recusandae explicabo consectetur adipisicing acere at quod nisi ipsum quaerat repellendus. Facere at quod nisi dignissimos. Obcaecati amet consectetur adipisicing elit Lorem ipsum dolor sit amet consectetur?', 575.00, 639.00, 1, 'No', 'Yes', 15, 1, '2023-09-04 14:44:51', '2023-09-06 16:45:34', 'https://www.houseoffraser.co.uk/images/products/55124027_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/55124027_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/55124027_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/55124027_l_a3.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/55124027_l_a5.jpg\"]', 'Male'),
(25, 'BOSS Spectre Trousers', 'Lorem ipsum dolor sit amet consectetur .Obcaecati amet consectetur adipisicing elit Lorem ipsum dolor sit amet consectetur?', 670.00, 750.00, 1, 'Yes', 'Yes', 18, 1, '2023-09-04 14:47:44', '2023-09-06 16:44:59', 'https://www.houseoffraser.co.uk/images/products/36017318_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/36017318_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/36017318_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/36017318_l_a4.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/36017318_l_a6.jpg\"]', 'Male'),
(27, 'TED BAKER Kllarat Trousers', 'Laudantium recusandae explicabo ipsum quaerat repellendus. Facere at quod nisi dignissimos. Obcaecati amet consectetur adipisicing elit Lorem ipsum dolor sit amet consectetur?', 500.00, 650.00, 1, 'No', 'Yes', 20, 1, '2023-09-04 14:52:36', '2023-09-06 16:44:00', 'https://www.houseoffraser.co.uk/images/products/33225569_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/33225569_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/33225569_l_a2.jpg\",null,null]', 'Female'),
(28, 'LACOSTE Logo T Shirt Blue', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem, ducimus facere tenetur culpa pariatur ipsam perferendis et, autem tempora ex veniam? Earum, perferendis facere! Placeat.', 247.00, 300.00, 2, 'No', 'Yes', 14, 1, '2023-09-04 14:56:24', '2023-09-22 13:12:35', 'https://www.houseoffraser.co.uk/images/products/59764222_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/59764222_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/59764222_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/59764222_l_a4.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/59764222_l_a5.jpg\"]', 'Male'),
(29, 'BARBOUR Soules T-Shirt', 'Lorem ipsum dolor sit amet consectetur adipisicing acere at quod nisi dignissimo elit. Obcaecati amet consectetur adipisicing elit Lorem ipsum dolor sit amet consectetur?', 190.00, 230.00, 2, 'Yes', 'No', NULL, 1, '2023-09-04 14:59:09', '2023-09-06 16:43:08', 'https://www.houseoffraser.co.uk/images/products/66527969_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/66527969_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/66527969_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/66527969_l_a3.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/66527969_l_a4.jpg\"]', 'Female'),
(30, 'Easy T-shirt THE NORTH FACE', 'Lorem ipsum dolor sit amet consectetur adipisicing acere at quod nisi dignissimo elit. Laudantium recusandae explicabo ipsum quaerat repellendus. Facere at quod nisi dignissimos. Obcaecati amet consectetur adipisicing elit Lorem ipsum dolor sit amet consectetur?', 300.00, 350.00, 2, 'No', 'No', NULL, 1, '2023-09-04 15:01:34', '2023-09-06 16:42:42', 'https://www.houseoffraser.co.uk/images/products/59753003_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/59753003_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/59753003_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/59753003_l_a3.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/59753003_l_a4.jpg\"]', 'Male'),
(31, 'Polo Sweatshirt', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Laudantium recusandae explicabo ipsum quaerat repellendus. Facere. Obcaecati amet consectetur adipisicing elit?', 229.00, 280.00, 2, 'No', 'Yes', 10, 1, '2023-09-04 15:04:36', '2023-09-06 16:42:05', 'https://www.houseoffraser.co.uk/images/products/33093615_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/33093615_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/33093615_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/33093615_l_a3.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/33093615_l_a4.jpg\"]', 'Female'),
(32, 'Armour Rival Fleece Hoodie', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Laudantium recusandae explicabo ipsum quaerat repellendus. Facere at quod nisi dignissimos. Obcaecati amet consectetur adipisicing elit?', 649.00, NULL, 3, 'No', 'No', NULL, 1, '2023-09-04 15:06:59', '2023-09-06 16:40:46', 'https://www.houseoffraser.co.uk/images/products/66869405_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/66869405_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/66869405_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/66869405_l_a4.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/66869405_l_a5.jpg\"]', 'Female'),
(33, 'ADIDAS Fleece Hoodie', 'Laudantium recusandae explicabo ipsum quaerat repellendus. Facere at quod nisi dignissimos. Obcaecati amet consectetur adipisicing elit?', 700.00, NULL, 3, 'Yes', 'No', NULL, 1, '2023-09-04 15:10:00', '2023-09-06 16:39:35', 'https://www.houseoffraser.co.uk/images/products/53128801_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/53128801_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/53128801_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/53128801_l_a4.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/53128801_l_a5.jpg\"]', 'Male'),
(34, 'POLO Custom Fit Linen Shirt', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Laudantium recusandae explicabo ipsum quaerat repellendus. Facere at quod nisi dignissimos. Obcaecati amet consectetur adipisicing elit?', 500.00, NULL, 4, 'No', 'No', NULL, 1, '2023-09-04 15:13:23', '2023-09-06 16:39:18', 'https://www.houseoffraser.co.uk/images/products/55178418_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/55178418_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/55178418_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/55178418_l_a3.jpg\",null]', 'Male'),
(35, 'LAUREN Linen Shorts', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Laudantium recusandae explicabo ipsum quaerat repellendus. Facere at quod nisi dignissimos. Obcaecati?', 389.00, 450.00, 6, 'No', 'Yes', 23, 1, '2023-09-04 15:17:29', '2023-09-06 16:38:47', 'https://www.houseoffraser.co.uk/images/products/57152201_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/57152201_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/57152201_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/57152201_l_a3.jpg\",null]', 'Female'),
(41, 'ETON Slim Fit Signature Twill Shirt', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dicta vero perspiciatis nesciunt, maxime provident, itaque cumque velit incidunt beatae unde enim dolorum nobis aliquid quis.', 420.00, NULL, 4, 'No', 'Yes', 5, 1, '2023-09-08 11:25:38', '2023-09-08 17:07:53', 'https://www.houseoffraser.co.uk/images/products/50903801_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/50903801_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/50903801_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/50903801_l_a3.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/50903801_l_a5.jpg\"]', 'Male'),
(42, 'POLO RALPH LAUREN Tech Shorts', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquid iste consectetur, iure quidem quod fuga suscipit facere, voluptatem eligendi atque recusandae. Obcaecati, reprehenderit at.', 305.00, 360.00, 6, 'No', 'No', NULL, 1, '2023-09-08 11:31:24', '2023-09-08 11:31:24', 'https://www.houseoffraser.co.uk/images/products/47225102_l.jpg', NULL, 'Male'),
(43, 'THE NORTH FACE Drew Peak Hoodie', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Est optio aperiam, nemo dolorum numquam doloremque perferendis.', 850.00, 1000.00, 3, 'No', 'Yes', 10, 1, '2023-09-08 11:38:41', '2023-09-08 11:38:41', 'https://www.houseoffraser.co.uk/images/products/53174901_l.jpg', NULL, 'Male'),
(48, 'One Planet Cool Guy Skater Jeans', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Minus exercitationem dignissimos quis maiores impedit eos consectetur adipisci voluptatibus, quos corrupti iure! Repellendus.', 450.00, 555.00, 1, 'No', 'Yes', 15, 1, '2023-09-08 12:32:29', '2023-09-08 12:32:29', 'https://www.houseoffraser.co.uk/images/products/62403618_l.jpg', '[\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/62403618_l_a5.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/62403618_l_a1.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/62403618_l_a2.jpg\",\"https:\\/\\/www.houseoffraser.co.uk\\/images\\/products\\/62403618_l_a3.jpg\"]', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `sort_order`, `created_at`, `updated_at`, `image_url`) VALUES
(1, 7, NULL, '2023-09-05 16:34:32', '2023-09-05 16:34:32', 'https://www.houseoffraser.co.uk/images/products/47817318_l_a1.jpg'),
(2, 7, NULL, '2023-09-05 16:34:32', '2023-09-05 16:34:32', 'https://www.houseoffraser.co.uk/images/products/47817318_l_a2.jpg'),
(3, 7, NULL, '2023-09-05 16:34:32', '2023-09-05 16:34:32', 'https://www.houseoffraser.co.uk/images/products/47817318_l_a3.jpg'),
(4, 8, NULL, '2023-09-05 16:34:32', '2023-09-05 16:34:32', 'https://www.houseoffraser.co.uk/images/products/63209418_l_a1.jpg'),
(5, 8, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/63209418_l_a2.jpg'),
(6, 9, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/64412521_l_a1.jpg'),
(7, 9, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/64412521_l_a2.jpg'),
(8, 9, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/64412521_l_a3.jpg'),
(9, 14, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/59764203_l_a1.jpg'),
(10, 14, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/59764203_l_a2.jpg'),
(11, 14, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/59764203_l_a3.jpg'),
(12, 14, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/59764203_l_a4.jpg'),
(13, 15, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/55829401_l_a1.jpg'),
(14, 15, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/55829401_l_a2.jpg'),
(15, 15, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/55829401_l_a3.jpg'),
(16, 16, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/66201106_l_a1.jpg'),
(17, 17, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/63219706_l_a1.jpg'),
(18, 17, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/63219706_l_a2.jpg'),
(19, 17, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/63219706_l_a4.jpg'),
(20, 17, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/63219706_l_a5.jpg'),
(21, 18, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/64628818_l_a1.jpg'),
(22, 18, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/64628818_l_a2.jpg'),
(23, 18, NULL, '2023-09-05 16:34:33', '2023-09-05 16:34:33', 'https://www.houseoffraser.co.uk/images/products/64628818_l_a3.jpg'),
(24, 18, NULL, '2023-09-05 16:34:34', '2023-09-05 16:34:34', 'https://www.houseoffraser.co.uk/images/products/64628818_l_a4.jpg'),
(25, 19, NULL, '2023-09-05 16:34:34', '2023-09-05 16:34:34', 'https://www.houseoffraser.co.uk/images/products/64491524_l_a1.jpg'),
(26, 19, NULL, '2023-09-05 16:34:34', '2023-09-05 16:34:34', 'https://www.houseoffraser.co.uk/images/products/64491524_l_a2.jpg'),
(27, 19, NULL, '2023-09-05 16:34:34', '2023-09-05 16:34:34', 'https://www.houseoffraser.co.uk/images/products/64491524_l_a3.jpg'),
(28, 19, NULL, '2023-09-05 16:34:34', '2023-09-05 16:34:34', 'https://www.houseoffraser.co.uk/images/products/64491524_l_a4.jpg'),
(29, 20, NULL, '2023-09-05 16:34:34', '2023-09-05 16:34:34', 'https://www.houseoffraser.co.uk/images/products/36711104_l_a10.jpg'),
(30, 22, NULL, '2023-09-05 16:34:34', '2023-09-05 16:34:34', 'https://www.houseoffraser.co.uk/images/products/32565703_l_a1.jpg'),
(31, 22, NULL, '2023-09-05 16:34:34', '2023-09-05 16:34:34', 'https://www.houseoffraser.co.uk/images/products/32565703_l_a2.jpg'),
(32, 22, NULL, '2023-09-05 16:34:34', '2023-09-05 16:34:34', 'https://www.houseoffraser.co.uk/images/products/32565703_l_a3.jpg'),
(33, 23, NULL, '2023-09-05 16:34:34', '2023-09-05 16:34:34', 'https://www.houseoffraser.co.uk/images/products/65756606_l_a1.jpg'),
(34, 23, NULL, '2023-09-05 16:34:34', '2023-09-05 16:34:34', 'https://www.houseoffraser.co.uk/images/products/65756606_l_a2.jpg'),
(35, 23, NULL, '2023-09-05 16:34:34', '2023-09-05 16:34:34', 'https://www.houseoffraser.co.uk/images/products/65756606_l_a3.jpg'),
(36, 24, NULL, '2023-09-05 16:34:34', '2023-09-05 16:34:34', 'https://www.houseoffraser.co.uk/images/products/55124027_l_a1.jpg'),
(37, 24, NULL, '2023-09-05 16:34:34', '2023-09-05 16:34:34', 'https://www.houseoffraser.co.uk/images/products/55124027_l_a2.jpg'),
(38, 24, NULL, '2023-09-05 16:34:34', '2023-09-05 16:34:34', 'https://www.houseoffraser.co.uk/images/products/55124027_l_a3.jpg'),
(39, 24, NULL, '2023-09-05 16:34:35', '2023-09-05 16:34:35', 'https://www.houseoffraser.co.uk/images/products/55124027_l_a5.jpg'),
(40, 25, NULL, '2023-09-05 16:34:35', '2023-09-05 16:34:35', 'https://www.houseoffraser.co.uk/images/products/36017318_l_a1.jpg'),
(41, 25, NULL, '2023-09-05 16:34:35', '2023-09-05 16:34:35', 'https://www.houseoffraser.co.uk/images/products/36017318_l_a2.jpg'),
(42, 25, NULL, '2023-09-05 16:34:35', '2023-09-05 16:34:35', 'https://www.houseoffraser.co.uk/images/products/36017318_l_a4.jpg'),
(43, 25, NULL, '2023-09-05 16:34:35', '2023-09-05 16:34:35', 'https://www.houseoffraser.co.uk/images/products/36017318_l_a6.jpg'),
(48, 27, NULL, '2023-09-05 16:34:35', '2023-09-05 16:34:35', 'https://www.houseoffraser.co.uk/images/products/33225569_l_a1.jpg'),
(49, 27, NULL, '2023-09-05 16:34:35', '2023-09-05 16:34:35', 'https://www.houseoffraser.co.uk/images/products/33225569_l_a2.jpg'),
(50, 28, NULL, '2023-09-05 16:34:35', '2023-09-05 16:34:35', 'https://www.houseoffraser.co.uk/images/products/59764222_l_a1.jpg'),
(51, 28, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/59764222_l_a2.jpg'),
(52, 28, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/59764222_l_a4.jpg'),
(53, 28, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/59764222_l_a5.jpg'),
(54, 29, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/66527969_l_a1.jpg'),
(55, 29, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/66527969_l_a2.jpg'),
(56, 29, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/66527969_l_a3.jpg'),
(57, 29, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/66527969_l_a4.jpg'),
(58, 30, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/59753003_l_a1.jpg'),
(59, 30, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/59753003_l_a2.jpg'),
(60, 30, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/59753003_l_a3.jpg'),
(61, 30, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/59753003_l_a4.jpg'),
(62, 31, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/33093615_l_a1.jpg'),
(63, 31, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/33093615_l_a2.jpg'),
(64, 31, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/33093615_l_a3.jpg'),
(65, 31, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/33093615_l_a4.jpg'),
(66, 32, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/66869405_l_a1.jpg'),
(67, 32, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/66869405_l_a2.jpg'),
(68, 32, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/66869405_l_a4.jpg'),
(69, 32, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/66869405_l_a5.jpg'),
(70, 33, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/53128801_l_a1.jpg'),
(71, 33, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/53128801_l_a2.jpg'),
(72, 33, NULL, '2023-09-05 16:34:36', '2023-09-05 16:34:36', 'https://www.houseoffraser.co.uk/images/products/53128801_l_a4.jpg'),
(73, 33, NULL, '2023-09-05 16:34:37', '2023-09-05 16:34:37', 'https://www.houseoffraser.co.uk/images/products/53128801_l_a5.jpg'),
(74, 34, NULL, '2023-09-05 16:34:37', '2023-09-05 16:34:37', 'https://www.houseoffraser.co.uk/images/products/55178418_l_a1.jpg'),
(75, 34, NULL, '2023-09-05 16:34:37', '2023-09-05 16:34:37', 'https://www.houseoffraser.co.uk/images/products/55178418_l_a2.jpg'),
(76, 34, NULL, '2023-09-05 16:34:37', '2023-09-05 16:34:37', 'https://www.houseoffraser.co.uk/images/products/55178418_l_a3.jpg'),
(77, 35, NULL, '2023-09-05 16:34:37', '2023-09-05 16:34:37', 'https://www.houseoffraser.co.uk/images/products/57152201_l_a1.jpg'),
(78, 35, NULL, '2023-09-05 16:34:38', '2023-09-05 16:34:38', 'https://www.houseoffraser.co.uk/images/products/57152201_l_a2.jpg'),
(79, 35, NULL, '2023-09-05 16:34:38', '2023-09-05 16:34:38', 'https://www.houseoffraser.co.uk/images/products/57152201_l_a3.jpg'),
(80, 41, NULL, NULL, NULL, 'https://www.houseoffraser.co.uk/images/products/50903801_l_a1.jpg'),
(81, 41, NULL, NULL, NULL, 'https://www.houseoffraser.co.uk/images/products/50903801_l_a2.jpg'),
(82, 41, NULL, NULL, NULL, 'https://www.houseoffraser.co.uk/images/products/50903801_l_a3.jpg'),
(83, 41, NULL, NULL, NULL, 'https://www.houseoffraser.co.uk/images/products/50903801_l_a5.jpg'),
(84, 42, NULL, NULL, NULL, 'https://www.houseoffraser.co.uk/images/products/47225102_l_a1.jpg'),
(85, 42, NULL, NULL, NULL, 'https://www.houseoffraser.co.uk/images/products/47225102_l_a2.jpg'),
(86, 42, NULL, NULL, NULL, 'https://www.houseoffraser.co.uk/images/products/47225102_l_a3.jpg'),
(87, 43, NULL, NULL, NULL, 'https://www.houseoffraser.co.uk/images/products/53174901_l_a1.jpg'),
(88, 43, NULL, NULL, NULL, 'https://www.houseoffraser.co.uk/images/products/53174901_l_a2.jpg'),
(89, 43, NULL, NULL, NULL, 'https://www.houseoffraser.co.uk/images/products/53174901_l_a3.jpg'),
(106, 48, NULL, NULL, NULL, 'https://www.houseoffraser.co.uk/images/products/62403618_l_a5.jpg'),
(107, 48, NULL, NULL, NULL, 'https://www.houseoffraser.co.uk/images/products/62403618_l_a1.jpg'),
(108, 48, NULL, NULL, NULL, 'https://www.houseoffraser.co.uk/images/products/62403618_l_a2.jpg'),
(109, 48, NULL, NULL, NULL, 'https://www.houseoffraser.co.uk/images/products/62403618_l_a3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `role`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, 2, 1, NULL, '$2y$10$5qGuBNTz9hBAMl7GgxKMTOq/Kg2PFnuRutssq9w1gGcHFtoboJiJW', NULL, '2023-08-23 07:13:57', '2023-08-23 07:13:57'),
(2, 'Brad Pitt', 'bradpitt@gmail.com', '07856385', 1, 1, NULL, '$2y$10$dh5pZoFcfCDgVbRmX/FbieejuWmJGLN5f4igsBNmYHZmzFq.3A5fy', NULL, '2023-08-23 07:21:49', '2023-09-20 16:59:57'),
(3, 'Adrian Timotin', 'adriantimotin@gmail.com', '062099020', 1, 1, NULL, '$2y$10$XunWXhuoLRkln4N9gDYTB.R7iUm9b8CTRCYPu6U4ZJi8b9KreDzXG', NULL, '2023-09-09 13:30:48', '2023-09-20 15:48:08'),
(4, 'Adrian Timotin', 'adriantimotin5@gmail.com', '062099020', 1, 1, NULL, '$2y$10$K6ngXlZdi27lGWi1zhVGU.4AxV7AoQaautWCQwcosaqHNz35wt2dq', NULL, '2023-09-09 13:34:07', '2023-09-09 13:34:07'),
(5, 'Vaseok', 'vaseok@gmail.com', '076236486', 1, 1, NULL, '$2y$10$b.Pl/XauVd1iD./zK5g87O968FX/Uyl0f2VzMcXpgYJBoUJh0O.G6', NULL, '2023-09-09 13:43:44', '2023-09-09 13:43:44'),
(6, 'Walter White', 'badboy123@gmail.com', '048673934', 1, 1, NULL, '$2y$10$v6PfgCiX.gwLysnX2w.3o.wa1q4FOkgiJh2zw6KXKdiKoqJGxS.8y', NULL, '2023-09-09 14:56:23', '2023-09-09 14:56:23'),
(7, 'Barbie', 'good_girl234@gmail.com', '069696969', 1, 1, NULL, '$2y$10$U.iPifCB.qo9KZPvQP9YZ.hXSeMKYtzl3x5KZuU8iIA/mI0JmHy0q', NULL, '2023-09-09 14:57:31', '2023-09-09 14:57:31'),
(8, 'Tolea', 'anatolie1939@gmail.com', '010919390', 1, 1, NULL, '$2y$10$BjDe2iFaSnOist6/BcnhHu4aE0kW68Fr4JvwQoY0Da9xGav79sM9i', NULL, '2023-09-09 15:00:48', '2023-09-09 15:00:48'),
(9, 'Cristi', 'cristi@gmail.com', '089685746', 1, 1, NULL, '$2y$10$os3yNl6U4MAXcphrhIoanewBS6MCGwBYlGIEmqbHxTPxdNX69TaBm', NULL, '2023-09-09 15:03:22', '2023-09-09 15:03:22'),
(10, 'Daniela', 'owndt@gmail.com', '079483725', 1, 1, NULL, '$2y$10$f6UsrY3Jw30HkZcKfDuydeYFwuduUIZbgrmYEKKDEFTYTiwvz/IQq', NULL, '2023-09-09 15:09:01', '2023-09-09 15:09:01'),
(11, 'sggfdn', 'adriantimotinasd@gmail.com', '13241234', 1, 1, NULL, '$2y$10$X1/BWaft5znqVbUulfhl9.CgSI57ysGKlFGH8HvGUv.C2Gj1lKUaW', NULL, '2023-09-09 15:10:47', '2023-09-09 15:10:47'),
(12, 'asdfasdf', 'asdf@gmail.com', '23141234324', 1, 1, NULL, '$2y$10$xOOi0gxQ7yWjm8dBNmyWC./TVcvrCqhFZlODBhFOzhQuhfuJ1j6jS', NULL, '2023-09-09 15:14:22', '2023-09-09 15:14:22'),
(13, 'asdfasdfasf', 'hasjdhf@gmail.com', '0719827365', 1, 1, NULL, '$2y$10$GPYWBg74j9wsVNkrD13pBOaCOBtRhTcttlSmgvmeFDiMOKZnx597O', NULL, '2023-09-09 15:16:48', '2023-09-09 15:16:48'),
(14, 'kajhfvas', 'akhjgsfd@gmail.com', '09870987', 1, 1, NULL, '$2y$10$gmIPLWk2nHO1Z31ZIPTkLuGXY2ZoC3jLfYi50vWK6ELRGmAwu8poG', NULL, '2023-09-09 15:22:18', '2023-09-09 15:22:18'),
(15, 'asdflkjh', 'asdflkjh@email.com', '12340987', 1, 1, NULL, '$2y$10$yYQr9R6PgjhJe/0WFPuXHe/noPFC0FNo7eHQbW28AexbyLhEOeh8S', NULL, '2023-09-09 15:36:36', '2023-09-09 15:36:36'),
(16, 'asdfadsf', 'asdf@ghns.skdvnm', '1324321434444', 1, 1, NULL, '$2y$10$vP4BR3wE9c/PMBhfpy6ze./WmryJxD/3I/JeayFFKQC7uj5OG6dsa', NULL, '2023-09-09 15:42:10', '2023-09-09 15:42:10'),
(17, 'alskdjfh', 'kasdjfh@gmail.com', '12341234', 1, 1, NULL, '$2y$10$.sqB3dN73iYpigPiEeXJNeNZVSnRiJTU8PTtsr74arF7pzMrkiQ6e', NULL, '2023-09-09 15:48:24', '2023-09-09 15:48:24'),
(18, 'Larea', 'larea@gmail.com', '12341234', 1, 1, NULL, '$2y$10$uSXwp8ZNq40DxP2Wv2DI4.Q6uypzx6pD.O3x6v4cexyO00y8iERx2', NULL, '2023-09-09 15:49:21', '2023-09-09 15:49:21'),
(20, 'Levan', 'lavan_nr1@gmail.com', '01234567', 1, 1, NULL, '$2y$10$Vr6TmeAm7pCc9YPOdxv8q.aC0IU.98YUXP5FYU/JMJQrN545kqk1e', NULL, '2023-09-09 16:15:06', '2023-09-09 16:15:06'),
(22, 'User123', 'user123@gmail.com', '123123123', 1, 1, NULL, '$2y$10$JBAFTgQkTC19WDu.HyQkQ.irGcaX6dCcr7WDVamGVF5XDc.BHs5z6', NULL, '2023-09-09 16:17:06', '2023-09-09 16:17:06'),
(23, 'Adrian Success', 'success@gmail.com', '123123123123', 1, 1, NULL, '$2y$10$LLLgWzVLWFAFJ2fYPLjdIuPrCC4hPnM5JD306hdGDZxP1zwaxFd3u', NULL, '2023-09-09 16:18:53', '2023-09-09 16:18:53'),
(24, 'John Doe', 'jjohn@gmail.com', '123123456456', 1, 1, NULL, '$2y$10$8uy/LfFPHo6KyKpRE6qKaOnAJPJO6muKFmFmTYZa4xqvJSkdCCAc.', NULL, '2023-09-09 16:26:24', '2023-09-09 16:26:24'),
(25, 'Vladimir Plahotniuc', 'plaha@gmail.com', '066666666', 1, 1, NULL, '$2y$10$YEkN8oKLh5sv1DMuIC75ru2k9BDm6FLgPjnqP20DuwOZ4VfcSam/m', NULL, '2023-09-20 14:26:20', '2023-09-20 14:26:20'),
(26, 'Ilon Masc', 'teslacar@gmail.com', '02345678', 1, 1, NULL, '$2y$10$K0bnrlIRlO6SaNiBojLx1.iOJCsCx.1UXnnMJ0VPln0/XepMZPk8K', NULL, '2023-09-20 14:34:38', '2023-09-20 14:34:38'),
(27, 'Pavlusha Tigan', 'pavel1979@gmail.com', '078564893', 1, 1, NULL, '$2y$10$vyT4UAqc.n6sWzGzZA0IuuJmtHYC3MutNSp735KwkVEI1R9ocZ7bW', NULL, '2023-09-20 14:35:57', '2023-09-20 14:35:57'),
(28, 'Nicolai Baskov', 'baskov@gmail.com', '012312334', 1, 1, NULL, '$2y$10$QE5MbvlUMJiTm2P..pZipOcD5B6z37QIU.iO/RNdFR1aJ8jsF0lFS', NULL, '2023-09-20 14:37:42', '2023-09-20 15:42:54'),
(30, 'User Example', 'user@example.com', '09871234', 1, 0, NULL, '$2y$10$lJttzgap1gDAIBK1qSnkV.cAuoLocB5JbL9wGT6I1FnzDaZuh6.i6', NULL, '2023-09-22 11:18:04', '2023-09-22 11:19:01'),
(31, 'Ion Creanga', 'nica_ionel@gmail.com', '076562435', 1, 1, NULL, '$2y$10$hdMNmIds3VEHDJxEp7yf2.qL4VPfb9nSCaAdnOlQJ1AxPMobyWYZq', NULL, '2023-09-22 13:26:09', '2023-09-22 14:32:34');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(16, 3, 22, '2023-09-13 13:29:25', '2023-09-13 13:29:25'),
(17, 3, 24, '2023-09-14 10:14:24', '2023-09-14 10:14:24'),
(18, 3, 41, '2023-09-14 10:14:34', '2023-09-14 10:14:34'),
(22, 31, 24, '2023-09-22 14:22:02', '2023-09-22 14:22:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_adresses_user_id_foreign` (`user_id`),
  ADD KEY `customer_adresses_country_id_foreign` (`country_id`);

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_country_id_foreign` (`country_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_user_id_foreign` (`user_id`),
  ADD KEY `wishlist_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `customer_adresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_adresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
