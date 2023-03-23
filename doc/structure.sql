-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for webtraodoisp
CREATE DATABASE IF NOT EXISTS `webtraodoisp` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci */;
USE `webtraodoisp`;

-- Dumping structure for table webtraodoisp.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_media` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_locked` int(11) DEFAULT 1 COMMENT '1: unlock / 2: lock',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.category: ~3 rows (approximately)
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `id_media`, `name`, `content`, `is_locked`) VALUES
	(1, 38, 'Xe cộ', 'Các loại xe', 1),
	(2, 40, 'Đồ dùng gia đình', 'Các đồ dùng trong gia đình', 1),
	(3, 39, 'Đồ điện tử', 'Các loại đồ điện tử', 1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.category_meta
CREATE TABLE IF NOT EXISTS `category_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_category` int(11) DEFAULT NULL,
  `meta_key` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_value` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(254) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cate_cate_meta` (`id_category`),
  CONSTRAINT `cate_cate_meta` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.category_meta: ~5 rows (approximately)
DELETE FROM `category_meta`;
/*!40000 ALTER TABLE `category_meta` DISABLE KEYS */;
INSERT INTO `category_meta` (`id`, `id_category`, `meta_key`, `meta_value`, `description`) VALUES
	(1, 1, 'k1', 'Bổ sung chi tiết', 'Bổ sung chi tiết'),
	(2, 1, 'k2', 'Bổ sung chi tiết', 'Bổ sung chi tiết'),
	(3, 1, 'k3', 'Bổ sung chi tiết', 'Bổ sung chi tiết'),
	(4, 2, 'c1', 'c1', 'description c1'),
	(5, 2, 'c2', 'c2', 'description c2');
/*!40000 ALTER TABLE `category_meta` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `content` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `comment_post` (`id_post`),
  KEY `comment_user` (`id_user`),
  CONSTRAINT `comment_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comment_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.comment: ~6 rows (approximately)
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`id`, `id_post`, `id_user`, `content`, `created_date`) VALUES
	(1, 1, 3, 'asdasdasd', '2022-12-14 14:48:02'),
	(2, 1, 3, 'sadasdasdas', '2022-12-16 15:50:52'),
	(3, 1, 3, 'sdacxzsdasd', '2022-12-16 15:50:57'),
	(4, 1, 3, '1231312312321', '2022-12-16 15:51:01'),
	(5, 1, 3, 'ewqeqưeqưecasad', '2022-12-16 15:53:58'),
	(6, 10, 3, 'Demo comment', '2022-12-23 10:09:46');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.group_member
CREATE TABLE IF NOT EXISTS `group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_member_group` (`id_group`),
  KEY `group_member_user` (`id_user`),
  CONSTRAINT `group_member_group` FOREIGN KEY (`id_group`) REFERENCES `group_message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `group_member_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.group_member: ~46 rows (approximately)
DELETE FROM `group_member`;
/*!40000 ALTER TABLE `group_member` DISABLE KEYS */;
INSERT INTO `group_member` (`id`, `id_group`, `id_user`) VALUES
	(1, 1, 2),
	(2, 1, 1),
	(3, 2, 1),
	(4, 2, 3),
	(5, 3, 2),
	(6, 3, 3),
	(7, 4, NULL),
	(8, 4, 2),
	(9, 5, NULL),
	(10, 5, 2),
	(11, 6, NULL),
	(12, 6, 2),
	(13, 7, NULL),
	(14, 7, 2),
	(15, 8, NULL),
	(16, 8, 2),
	(17, 9, NULL),
	(18, 9, 2),
	(19, 10, NULL),
	(20, 10, 2),
	(21, 11, NULL),
	(22, 11, 2),
	(23, 12, NULL),
	(24, 12, 2),
	(25, 13, NULL),
	(26, 13, 2),
	(27, 14, NULL),
	(28, 14, 2),
	(29, 15, NULL),
	(30, 15, 2),
	(31, 16, NULL),
	(32, 16, 2),
	(33, 17, NULL),
	(34, 17, 2),
	(35, 18, NULL),
	(36, 18, 2),
	(37, 19, NULL),
	(38, 19, 2),
	(39, 20, NULL),
	(40, 20, 2),
	(41, 21, NULL),
	(42, 21, 2),
	(43, 22, NULL),
	(44, 22, 2),
	(45, 23, NULL),
	(46, 23, 2);
/*!40000 ALTER TABLE `group_member` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.group_message
CREATE TABLE IF NOT EXISTS `group_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` int(11) DEFAULT 1 COMMENT '1: user - user',
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.group_message: ~23 rows (approximately)
DELETE FROM `group_message`;
/*!40000 ALTER TABLE `group_message` DISABLE KEYS */;
INSERT INTO `group_message` (`id`, `id_type`, `created_date`, `updated_date`) VALUES
	(1, 1, '2022-12-19 14:41:55', '2022-12-19 14:41:55'),
	(2, 1, '2022-12-19 14:43:41', '2022-12-19 14:43:41'),
	(3, 1, '2022-12-19 16:48:02', '2022-12-19 16:48:02'),
	(4, 1, '2022-12-21 16:52:22', '2022-12-21 16:52:22'),
	(5, 1, '2022-12-21 16:52:22', '2022-12-21 16:52:22'),
	(6, 1, '2022-12-21 16:52:22', '2022-12-21 16:52:22'),
	(7, 1, '2022-12-21 16:52:22', '2022-12-21 16:52:22'),
	(8, 1, '2022-12-21 16:52:23', '2022-12-21 16:52:23'),
	(9, 1, '2022-12-21 16:52:23', '2022-12-21 16:52:23'),
	(10, 1, '2022-12-21 16:52:23', '2022-12-21 16:52:23'),
	(11, 1, '2022-12-21 16:52:23', '2022-12-21 16:52:23'),
	(12, 1, '2022-12-21 16:52:23', '2022-12-21 16:52:23'),
	(13, 1, '2022-12-21 16:52:23', '2022-12-21 16:52:23'),
	(14, 1, '2022-12-21 16:52:23', '2022-12-21 16:52:23'),
	(15, 1, '2022-12-21 16:52:23', '2022-12-21 16:52:23'),
	(16, 1, '2022-12-21 16:52:23', '2022-12-21 16:52:23'),
	(17, 1, '2022-12-21 16:52:24', '2022-12-21 16:52:24'),
	(18, 1, '2022-12-21 16:52:24', '2022-12-21 16:52:24'),
	(19, 1, '2022-12-21 16:52:24', '2022-12-21 16:52:24'),
	(20, 1, '2022-12-21 16:52:24', '2022-12-21 16:52:24'),
	(21, 1, '2022-12-21 16:52:24', '2022-12-21 16:52:24'),
	(22, 1, '2022-12-21 16:52:24', '2022-12-21 16:52:24'),
	(23, 1, '2022-12-21 16:52:24', '2022-12-21 16:52:24');
/*!40000 ALTER TABLE `group_message` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.media
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(254) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.media: ~45 rows (approximately)
DELETE FROM `media`;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` (`id`, `url`, `type`) VALUES
	(1, '2022/12/13/full-stack-developer-career.png', 'IMG'),
	(2, '2022/12/13/nkkhmeia.png', 'IMG'),
	(3, '2022/12/13/20221213151141.jpg', 'IMG'),
	(4, '2022/12/13/20221213151141.jpg', 'IMG'),
	(5, '2022/12/13/20221213151141.jpg', 'IMG'),
	(6, '2022/12/13/202212131516140.jpg', 'IMG'),
	(7, '2022/12/13/202212131516141.jpg', 'IMG'),
	(8, '2022/12/13/202212131516142.jpg', 'IMG'),
	(9, '2022/12/14/20221214160420.jpg', 'IMG'),
	(10, '2022/12/14/20221214160421.jpg', 'IMG'),
	(11, '2022/12/14/20221214160422.jpg', 'IMG'),
	(12, '2022/12/14/202212141637140.jpg', 'IMG'),
	(13, '2022/12/14/202212141637141.jpg', 'IMG'),
	(14, '2022/12/14/202212141637142.jpg', 'IMG'),
	(15, '2022/12/16/202212161649160.jpg', 'IMG'),
	(16, '2022/12/16/202212161649161.jpg', 'IMG'),
	(17, '2022/12/16/202212161649162.jpg', 'IMG'),
	(18, '2022/12/17/20221217113540.jpg', 'IMG'),
	(19, '2022/12/17/20221217113541.jpg', 'IMG'),
	(20, '2022/12/17/20221217113542.jpg', 'IMG'),
	(21, '2022/12/23/20221223950400.jpg', 'IMG'),
	(22, '2022/12/23/20221223950401.jpg', 'IMG'),
	(23, '2022/12/23/20221223950402.jpg', 'IMG'),
	(24, '2022/12/23/20221223959120.jpg', 'IMG'),
	(25, '2022/12/23/20221223959121.jpg', 'IMG'),
	(26, '2022/12/23/20221223959122.jpg', 'IMG'),
	(27, '2023/2/5/2023251932590.jpg', 'IMG'),
	(28, '2023/2/5/2023251932591.jpg', 'IMG'),
	(29, '2023/2/5/2023251932592.jpg', 'IMG'),
	(30, '2023/2/5/202325194230.jpg', 'IMG'),
	(31, '2023/2/5/202325194231.jpg', 'IMG'),
	(32, '2023/2/5/202325194232.jpg', 'IMG'),
	(33, '2023/2/6/2023261342490.jpg', 'IMG'),
	(34, '2023/2/6/2023261347290.jpg', 'IMG'),
	(35, '2023/2/6/2023261349200.jpg', 'IMG'),
	(36, '2023/2/15/2023215125760.jpg', 'IMG'),
	(37, '2023/2/25/20232251957580.jpg', 'IMG'),
	(38, '2023/2/25/20232251959270.jpg', 'IMG'),
	(39, '2023/2/25/20232252021480.jpg', 'IMG'),
	(40, '2023/2/25/20232252023240.jpg', 'IMG'),
	(41, '2023/2/27/2023227856110.jpg', 'IMG'),
	(42, '2023/2/27/2023227859540.jpg', 'IMG'),
	(43, '2023/2/27/20232279690.jpg', 'IMG'),
	(44, '2023/2/27/20232279691.jpg', 'IMG'),
	(45, '2023/2/27/202322791850.jpg', 'IMG');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.message
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `content` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `readed` tinyint(4) DEFAULT 0 COMMENT '0: unread / 1: read',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `message_group` (`id_group`),
  KEY `message_user` (`id_user`),
  CONSTRAINT `message_group` FOREIGN KEY (`id_group`) REFERENCES `group_message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `message_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.message: ~38 rows (approximately)
DELETE FROM `message`;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` (`id`, `id_group`, `id_user`, `content`, `readed`, `created_date`) VALUES
	(1, 1, 2, 'test', 1, '2022-12-19 16:39:36'),
	(2, 2, 1, 'dasdasdsa', 1, '2022-12-19 16:46:11'),
	(3, 3, 3, 'zxczxcxz', 1, '2022-12-19 16:48:14'),
	(4, 2, 2, 'zxzczxc', 1, '2022-12-19 17:03:55'),
	(5, 2, 1, 'asdasdsa', 1, '2022-12-20 10:00:25'),
	(6, 2, 1, 'dasddsad', 1, '2022-12-20 10:07:55'),
	(7, 2, 1, 'tessst', 1, '2022-12-20 10:09:22'),
	(8, 2, 1, 'qwewqe', 1, '2022-12-20 10:10:59'),
	(9, 2, 3, 'test 1', 1, '2022-12-20 10:11:58'),
	(10, 2, 3, ' alo alo', 1, '2022-12-20 10:12:06'),
	(11, 2, 3, 'wqeqwe', 1, '2022-12-20 10:17:31'),
	(12, 2, 1, 'qwczxczx', 1, '2022-12-20 10:24:42'),
	(13, 2, 1, 'sadsadsa', 1, '2022-12-20 10:25:16'),
	(14, 2, 1, 'haha', 1, '2022-12-20 10:26:36'),
	(15, 2, 3, 'kê', 1, '2022-12-20 10:31:22'),
	(16, 2, 3, 'wqewqewq', 1, '2022-12-20 10:36:35'),
	(17, 2, 1, 'kệ b', 1, '2022-12-20 10:37:03'),
	(18, 2, 3, 'uk oke la', 1, '2022-12-20 10:37:08'),
	(19, 3, 3, 'hê nhô', 1, '2022-12-22 11:03:52'),
	(20, 3, 3, 'lêu lêu', 1, '2022-12-22 11:03:58'),
	(21, 3, 3, 'đâs', 1, '2022-12-22 11:04:23'),
	(22, 3, 3, 'liu liu', 1, '2022-12-22 11:19:50'),
	(23, 3, 3, 'ảo ah', 1, '2022-12-22 11:20:05'),
	(24, 3, 3, '@@', 1, '2022-12-22 11:20:13'),
	(25, 3, 3, 'sađá', 1, '2022-12-22 11:20:51'),
	(26, 3, 3, 'ah đc rồi :v', 1, '2022-12-22 11:20:58'),
	(27, 3, 3, 'hơi ảo tí thôi', 1, '2022-12-22 11:21:04'),
	(28, 3, 2, 'ô sờ kê la la', 1, '2022-12-22 11:21:21'),
	(29, 3, 2, 'chốt nhé', 1, '2022-12-22 11:21:26'),
	(30, 3, 2, 'k sửa gì nữa :)))', 1, '2022-12-22 11:21:40'),
	(31, 3, 3, 'alo', 1, '2022-12-23 10:16:43'),
	(32, 3, 3, 'alo', 1, '2022-12-23 10:16:58'),
	(33, 3, 2, 'test message', 1, '2022-12-23 10:17:08'),
	(34, 3, 2, 'áđâsd', 1, '2022-12-23 10:17:14'),
	(35, 2, 3, 'đâsd', 1, '2022-12-23 10:17:16'),
	(36, 3, 2, 'eqwewqeqw', 1, '2022-12-24 10:07:10'),
	(37, 3, 2, 'qweqwe', 1, '2023-02-02 11:11:28'),
	(38, 3, 3, 'zzzzzzzzzz', 1, '2023-02-02 11:11:34');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_seller` int(11) DEFAULT NULL,
  `id_buyer` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `id_redirect` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `order_seller` (`id_seller`),
  KEY `order_buyer` (`id_buyer`),
  KEY `order_product` (`id_product`),
  CONSTRAINT `order_buyer` FOREIGN KEY (`id_buyer`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_seller` FOREIGN KEY (`id_seller`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.orders: ~17 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `id_seller`, `id_buyer`, `id_product`, `id_status`, `id_type`, `id_redirect`, `price`, `rate`, `created_date`, `updated_date`) VALUES
	(1, 1, 3, 5, 4, 1, 0, 30000, 0, '2022-12-15 15:46:57', '2022-12-16 13:57:37'),
	(4, 1, 3, 3, 4, 2, 0, 17000, 0, '2022-12-17 10:06:22', '2022-12-17 10:45:35'),
	(5, 3, 1, 9, 10, 2, 4, 0, 0, '2022-12-17 10:06:22', '2023-02-21 11:05:39'),
	(6, 1, 3, 4, 10, 1, 0, 3000, 0, '2022-12-17 10:57:43', '2022-12-17 11:00:51'),
	(8, 2, 3, 12, 4, 1, 0, 300000000, 0, '2022-12-23 10:09:58', '2022-12-23 10:10:46'),
	(9, 2, 3, 7, 4, 2, 0, 0, 0, '2022-12-23 10:15:16', '2022-12-23 10:15:53'),
	(10, 3, 2, 9, 10, 2, 9, 0, 0, '2022-12-23 10:15:16', '2023-02-21 11:05:39'),
	(11, 3, 2, 24, 4, 1, 0, 1000, 0, '2023-02-06 14:08:33', '2023-02-06 14:09:49'),
	(12, 1, 2, 4, 2, 1, 0, 3000, 0, '2023-02-06 17:14:42', '2023-02-06 17:14:42'),
	(13, 3, 2, 10, 4, 2, 0, 0, 5, '2023-02-15 21:31:55', '2023-02-20 10:35:47'),
	(14, 2, 3, 22, 10, 2, 13, 8000, 0, '2023-02-15 21:31:55', '2023-02-21 11:05:39'),
	(15, 2, 3, 22, 4, 2, 0, 7000, NULL, '2023-02-19 22:38:06', '2023-02-19 22:40:12'),
	(16, 3, 2, 9, 10, 2, 15, 0, NULL, '2023-02-19 22:38:06', '2023-02-21 11:05:39'),
	(17, 2, 3, 22, 1, 2, 0, 7000, NULL, '2023-02-23 23:05:16', '2023-02-23 23:05:16'),
	(18, 3, 2, 9, 1, 2, 17, 0, NULL, '2023-02-23 23:05:16', '2023-02-23 23:05:16'),
	(19, 2, 3, 26, 1, 2, 0, 18090000, NULL, '2023-02-27 09:19:33', '2023-02-27 09:19:33'),
	(20, 3, 2, 29, 1, 2, 19, 0, NULL, '2023-02-27 09:19:33', '2023-02-27 09:19:33');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.order_history
CREATE TABLE IF NOT EXISTS `order_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `order_history_user` (`id_user`),
  KEY `order_history_order` (`id_order`),
  CONSTRAINT `order_history_order` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_history_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.order_history: ~47 rows (approximately)
DELETE FROM `order_history`;
/*!40000 ALTER TABLE `order_history` DISABLE KEYS */;
INSERT INTO `order_history` (`id`, `id_order`, `id_user`, `id_status`, `description`, `created_date`) VALUES
	(1, 1, 3, 1, NULL, '2022-12-15 15:46:57'),
	(2, 1, 1, 2, NULL, '2022-12-16 13:55:30'),
	(3, 1, 3, 3, NULL, '2022-12-16 13:57:29'),
	(4, 1, 1, 4, NULL, '2022-12-16 13:57:37'),
	(5, 2, 3, 1, NULL, '2022-12-16 16:52:41'),
	(6, 3, 3, 1, NULL, '2022-12-17 10:02:25'),
	(7, 4, 3, 1, NULL, '2022-12-17 10:06:22'),
	(8, 4, 1, 2, NULL, '2022-12-17 10:45:26'),
	(9, 4, 3, 3, NULL, '2022-12-17 10:45:31'),
	(10, 4, 1, 4, NULL, '2022-12-17 10:45:35'),
	(11, 6, 3, 1, NULL, '2022-12-17 10:57:43'),
	(12, 6, 1, 10, NULL, '2022-12-17 11:00:51'),
	(13, 7, 3, 1, NULL, '2022-12-23 10:04:02'),
	(14, 7, 3, 2, NULL, '2022-12-23 10:04:02'),
	(15, 8, 3, 1, NULL, '2022-12-23 10:09:58'),
	(16, 8, 3, 2, NULL, '2022-12-23 10:09:58'),
	(17, 8, 3, 3, NULL, '2022-12-23 10:10:19'),
	(18, 8, 2, 4, NULL, '2022-12-23 10:10:46'),
	(19, 9, 3, 1, NULL, '2022-12-23 10:15:16'),
	(20, 10, 2, 1, NULL, '2022-12-23 10:15:16'),
	(21, 9, 2, 2, NULL, '2022-12-23 10:15:42'),
	(22, 9, 3, 3, NULL, '2022-12-23 10:15:48'),
	(23, 9, 2, 4, NULL, '2022-12-23 10:15:53'),
	(24, 11, 2, 1, NULL, '2023-02-06 14:08:33'),
	(25, 11, 2, 2, NULL, '2023-02-06 14:08:33'),
	(26, 11, 2, 3, NULL, '2023-02-06 14:09:39'),
	(27, 11, 3, 4, NULL, '2023-02-06 14:09:50'),
	(28, 12, 2, 1, NULL, '2023-02-06 17:14:42'),
	(29, 12, 2, 2, NULL, '2023-02-06 17:14:42'),
	(30, 13, 2, 1, NULL, '2023-02-15 21:31:55'),
	(31, 14, 3, 1, NULL, '2023-02-15 21:31:55'),
	(32, 15, 3, 1, NULL, '2023-02-19 22:38:06'),
	(33, 16, 2, 1, NULL, '2023-02-19 22:38:06'),
	(34, 15, 2, 2, NULL, '2023-02-19 22:39:47'),
	(35, 15, 3, 3, NULL, '2023-02-19 22:40:06'),
	(36, 15, 2, 4, NULL, '2023-02-19 22:40:12'),
	(37, 13, 3, 2, NULL, '2023-02-20 10:34:57'),
	(38, 13, 2, 3, NULL, '2023-02-20 10:35:02'),
	(39, 13, 3, 4, NULL, '2023-02-20 10:35:14'),
	(40, 5, 1, 10, NULL, '2023-02-21 11:05:39'),
	(41, 10, 1, 10, NULL, '2023-02-21 11:05:39'),
	(42, 14, 1, 10, NULL, '2023-02-21 11:05:39'),
	(43, 16, 1, 10, NULL, '2023-02-21 11:05:39'),
	(44, 17, 3, 1, NULL, '2023-02-23 23:05:16'),
	(45, 18, 2, 1, NULL, '2023-02-23 23:05:16'),
	(46, 19, 3, 1, NULL, '2023-02-27 09:19:33'),
	(47, 20, 2, 1, NULL, '2023-02-27 09:19:33');
/*!40000 ALTER TABLE `order_history` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.post
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `content` varchar(254) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `total_view` int(11) DEFAULT NULL COMMENT '0',
  `total_like` int(11) DEFAULT NULL COMMENT '0',
  `total_follow` int(11) DEFAULT NULL COMMENT '0',
  `total_comment` int(11) DEFAULT NULL COMMENT '0',
  `created_date` datetime DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `post_product` (`id_product`),
  KEY `post_user` (`id_user`),
  CONSTRAINT `post_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `post_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.post: ~16 rows (approximately)
DELETE FROM `post`;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`id`, `id_product`, `id_user`, `title`, `content`, `total_view`, `total_like`, `total_follow`, `total_comment`, `created_date`, `updated_date`) VALUES
	(1, 3, 1, 'Sp 1', 'Test', 1, 1, 1, 5, '2022-12-13 09:53:05', '2022-12-13 09:53:05'),
	(2, 4, 1, 'Sp2', 'Test', 2, 2, 1, 0, '2022-12-13 09:58:20', '2022-12-13 09:58:20'),
	(3, 5, 1, 'Sp 3', 'Test', 0, 0, 0, 0, '2022-12-13 15:11:42', '2022-12-13 15:11:42'),
	(4, 6, 1, 'test 1', 'Test', 2, 1, 0, 0, '2022-12-13 15:16:14', '2022-12-13 15:16:14'),
	(5, 7, 2, 'Test 1', 'For a deep dive into these 10 exciting projects, read: Meet UNICEF\'s Alpha Round Grantees', 2, 1, 0, 0, '2022-12-14 16:00:42', '2022-12-14 16:00:42'),
	(7, 9, 3, 'User1 Product 1', 'Testasdasdsa adas dasdsa qweqwe', 1, 1, 1, 0, '2022-12-16 16:49:16', '2022-12-16 16:49:16'),
	(8, 10, 3, 'User1 Product 2', 'User1 Product 2', 1, 0, 0, 0, '2022-12-17 11:03:54', '2022-12-17 11:03:54'),
	(10, 12, 2, 'Hyundai Elantra 2022', 'How to deploy Node.js application on AWS with Github · Install NodeJS and NPM using nvm · Install Git and clone repository from GitHub · Install dependencies.', 1, 0, 0, 1, '2022-12-23 09:59:12', '2022-12-23 09:59:12'),
	(11, 20, 3, 'Sp Test 1', 'mới tốt', 0, 0, 0, 0, '2023-02-05 19:32:59', '2023-02-05 19:32:59'),
	(12, 21, 3, 'test 1', 'mới tốt', 0, 0, 0, 0, '2023-02-05 19:42:03', '2023-02-05 19:42:03'),
	(13, 22, 2, 'Xe ô tô', 'mới tốt', 3, 0, 0, 0, '2023-02-06 13:42:49', '2023-02-06 13:42:49'),
	(14, 23, 3, 'Sp Test 1', 'rất hay', 0, 0, 0, 0, '2023-02-06 13:47:29', '2023-02-06 13:47:29'),
	(15, 24, 3, 'Sp Test 12', 'chất lượng', 1, 0, 0, 0, '2023-02-06 13:49:20', '2023-02-06 13:49:20'),
	(17, 26, 2, 'Xe máy Wave alpha 2022', 'Sử dụng tốt', 1, 0, 0, 0, '2023-02-27 08:56:11', '2023-02-27 08:56:11'),
	(18, 27, 2, 'Điện thoại iPhone 12 Pro Max 256GB – Like New 99%', 'Chức năng hoạt động tốt', 1, 0, 0, 0, '2023-02-27 08:59:54', '2023-02-27 08:59:54'),
	(20, 29, 3, 'Ô tô', 'Các loại xe', 0, 0, 0, 0, '2023-02-27 09:18:05', '2023-02-27 09:18:05');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.post_media
CREATE TABLE IF NOT EXISTS `post_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) DEFAULT NULL,
  `id_media` int(11) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_media_post` (`id_post`),
  KEY `post_media_media` (`id_media`),
  CONSTRAINT `post_media_media` FOREIGN KEY (`id_media`) REFERENCES `media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `post_media_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.post_media: ~26 rows (approximately)
DELETE FROM `post_media`;
/*!40000 ALTER TABLE `post_media` DISABLE KEYS */;
INSERT INTO `post_media` (`id`, `id_post`, `id_media`, `id_type`) VALUES
	(1, 1, 1, 3),
	(2, 2, 2, 3),
	(3, 3, 3, 3),
	(4, 3, 4, 4),
	(5, 3, 5, 4),
	(6, 4, 6, 3),
	(7, 4, 7, 4),
	(8, 4, 8, 4),
	(15, 7, 15, 3),
	(16, 7, 16, 4),
	(17, 7, 17, 4),
	(18, 8, 18, 3),
	(19, 8, 19, 4),
	(20, 8, 20, 4),
	(27, 11, 27, 3),
	(28, 11, 28, 4),
	(29, 11, 29, 4),
	(30, 12, 30, 3),
	(31, 12, 31, 4),
	(32, 12, 32, 4),
	(33, 13, 33, 3),
	(34, 14, 34, 3),
	(35, 15, 35, 3),
	(37, 17, 41, 3),
	(38, 18, 42, 3),
	(41, 20, 45, 3);
/*!40000 ALTER TABLE `post_media` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.post_meta
CREATE TABLE IF NOT EXISTS `post_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) DEFAULT NULL,
  `meta_key` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_name` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_value` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_meta_post` (`id_post`),
  CONSTRAINT `post_meta_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.post_meta: ~37 rows (approximately)
DELETE FROM `post_meta`;
/*!40000 ALTER TABLE `post_meta` DISABLE KEYS */;
INSERT INTO `post_meta` (`id`, `id_post`, `meta_key`, `meta_name`, `meta_value`, `description`) VALUES
	(1, 1, 'c1', 'c1', 'test 1', NULL),
	(2, 1, 'c2', 'c2', 'test 2', NULL),
	(3, 2, 'k1', 'k1', 'Test 1', NULL),
	(4, 2, 'k2', 'k2', 'Test 2', NULL),
	(5, 2, 'k3', 'k3', 'Test 3', NULL),
	(6, 3, 'k1', 'k1', 'test 1', NULL),
	(7, 3, 'k2', 'k2', 'test 2', NULL),
	(8, 3, 'k3', 'k3', 'test 3', NULL),
	(9, 4, 'k1', 'k1', 'test 1', NULL),
	(10, 4, 'k2', 'k2', 'test 1', NULL),
	(11, 4, 'k3', 'k3', 'test 2', NULL),
	(17, 7, 'k1', 'k1', 'Test 1', NULL),
	(18, 7, 'k2', 'k2', 'Test 2', NULL),
	(19, 7, 'k3', 'k3', 'Test 3', NULL),
	(20, 8, 'k1', 'k1', 'User1 Product 2', NULL),
	(21, 8, 'k2', 'k2', 'User1 Product 2', NULL),
	(22, 8, 'k3', 'k3', 'User1 Product 2', NULL),
	(28, 11, 'k1', 'k1', 'giá hợp lí', NULL),
	(29, 11, 'k2', 'k2', 'giá hợp lí', NULL),
	(30, 11, 'k3', 'k3', 'giá hợp lí', NULL),
	(31, 12, 'k1', 'k1', 'giá hợp lí', NULL),
	(32, 12, 'k2', 'k2', 'giá hợp lí', NULL),
	(33, 12, 'k3', 'k3', 'giá hợp lí', NULL),
	(34, 13, 'k1', 'k1', 'giá hợp lí 3', NULL),
	(35, 13, 'k2', 'k2', '', NULL),
	(36, 13, 'k3', 'k3', '', NULL),
	(37, 14, 'c1', 'c1', 'giá hợp lí', NULL),
	(38, 14, 'c2', 'c2', '', NULL),
	(39, 15, 'k1', 'k1', 'chất lượng', NULL),
	(40, 15, 'k2', 'k2', '', NULL),
	(41, 15, 'k3', 'k3', '', NULL),
	(45, 17, 'k1', 'Bổ sung chi tiết', 'Khối lượng: 97 kg', NULL),
	(46, 17, 'k2', 'Bổ sung chi tiết', 'Dung tích bình xăng: 3,7 L', NULL),
	(47, 17, 'k3', 'Bổ sung chi tiết', '', NULL),
	(50, 20, 'k1', 'Bổ sung chi tiết', 'a', NULL),
	(51, 20, 'k2', 'Bổ sung chi tiết', '', NULL),
	(52, 20, 'k3', 'Bổ sung chi tiết', '', NULL);
/*!40000 ALTER TABLE `post_meta` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.post_user
CREATE TABLE IF NOT EXISTS `post_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `had_view` tinyint(4) DEFAULT NULL,
  `had_like` tinyint(4) DEFAULT NULL,
  `had_follow` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_user_post` (`id_post`),
  KEY `post_user_user` (`id_user`),
  CONSTRAINT `post_user_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `post_user_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.post_user: ~17 rows (approximately)
DELETE FROM `post_user`;
/*!40000 ALTER TABLE `post_user` DISABLE KEYS */;
INSERT INTO `post_user` (`id`, `id_post`, `id_user`, `had_view`, `had_like`, `had_follow`) VALUES
	(1, 2, 2, 1, 1, 1),
	(2, 5, 2, 1, 0, 0),
	(3, 4, 3, 1, 0, 0),
	(4, 3, 3, 1, 0, 0),
	(5, 2, 3, 1, 1, 0),
	(6, 1, 3, 1, 1, 1),
	(7, 5, 3, 1, 1, 0),
	(8, 7, 2, 1, 1, 1),
	(9, 4, 2, 1, 1, 0),
	(10, 8, 2, 1, 0, 0),
	(11, 10, 3, 1, 0, 0),
	(12, 15, 2, 1, 0, 0),
	(14, 13, 1, 1, 0, 0),
	(15, 13, 2, 1, 0, 0),
	(16, 13, 3, 1, 0, 0),
	(17, 17, 3, 1, 0, 0),
	(18, 18, 1, 1, 0, 0);
/*!40000 ALTER TABLE `post_user` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_category` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_confirmer` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `price_verify` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL,
  `is_locked` int(11) DEFAULT 1,
  `created_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `product_category` (`id_category`),
  KEY `product_user` (`id_user`),
  KEY `product_confirmer` (`id_confirmer`),
  CONSTRAINT `product_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_confirmer` FOREIGN KEY (`id_confirmer`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.product: ~29 rows (approximately)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `id_category`, `id_user`, `id_confirmer`, `name`, `price`, `price_verify`, `id_status`, `is_locked`, `created_date`) VALUES
	(1, 1, 2, 1, 'Test', 1000, 1100, 6, 1, '2022-12-11 20:41:39'),
	(2, NULL, 1, NULL, 'Sp 1', 20000, NULL, 5, 1, '2022-12-13 09:47:43'),
	(3, 2, 1, 1, 'Sp 1', 20000, 20000, 9, 1, '2022-12-13 09:53:05'),
	(4, 1, 1, 1, 'Sp2', 3000, 3000, 8, 1, '2022-12-13 09:58:20'),
	(5, 1, 1, 1, 'Sp 3', 30000, 30000, 9, 1, '2022-12-13 15:11:42'),
	(6, 1, 1, 1, 'test 1', 12312312, 12312312, 6, 1, '2022-12-13 15:16:14'),
	(7, 1, 1, 1, 'Test 1', 1000, 10000, 6, 1, '2023-02-06 13:45:31'),
	(8, 2, 2, 1, 'Test 2', 5000, NULL, 7, 1, '2022-12-14 16:37:14'),
	(9, 1, 3, 1, 'User1 Product 1', 3000, 3000, 8, 1, '2022-12-16 16:49:16'),
	(10, 1, 3, 1, 'User1 Product 2', 2000, 2000, 9, 1, '2022-12-17 11:03:54'),
	(11, 2, 2, NULL, 'User Product 3', 30000, NULL, 5, 1, '2022-12-23 09:50:41'),
	(12, 1, 2, 1, 'Hyundai Elantra 2022', 300000000, 300000000, 5, 1, '2022-12-23 09:59:12'),
	(13, 1, 4, NULL, 'Xe máy', 10, NULL, 5, 1, '2023-02-02 11:16:12'),
	(14, 1, 4, NULL, 'Xe máy', 10, NULL, 5, 1, '2023-02-02 11:16:49'),
	(15, 1, 4, NULL, 'Xe máy', 10, NULL, 5, 1, '2023-02-02 11:16:53'),
	(16, 1, 4, NULL, 'Xe máy', 10, NULL, 5, 1, '2023-02-02 11:17:30'),
	(17, 1, 1, NULL, 'Xe máy', 10000, NULL, 5, 1, '2023-02-04 20:10:33'),
	(18, 1, 1, NULL, 'Xe máy', 10000, NULL, 5, 1, '2023-02-04 20:12:57'),
	(19, 1, 3, NULL, 'Test product 1', 100000, NULL, 5, 1, '2023-02-05 19:30:39'),
	(20, 1, 3, NULL, 'Sp Test 1', 1000000, NULL, 5, 1, '2023-02-05 19:32:59'),
	(21, 1, 3, NULL, 'test 1', 100000, NULL, 5, 1, '2023-02-05 19:42:03'),
	(22, 1, 2, 1, 'Xe ô tô', 10000, NULL, 8, 1, '2023-02-06 13:42:49'),
	(23, 2, 3, 1, 'Sp Test 1', 1000, NULL, 5, 1, '2023-02-06 13:47:29'),
	(24, 1, 3, 1, 'Sp Test 12', 1000, 1000, 9, 1, '2023-02-06 13:49:20'),
	(25, 1, 2, 1, 'Áo', 30000, NULL, 6, 1, '2023-02-15 12:57:06'),
	(26, 1, 2, 1, 'Xe máy Wave alpha 2022', 18190000, 18190000, 8, 1, '2023-02-27 08:56:11'),
	(27, 3, 2, 1, 'Điện thoại iPhone 12 Pro Max 256GB – Like New 99%', 16190000, 16190000, 6, 1, '2023-02-27 08:59:54'),
	(28, 2, 2, 1, 'Nồi nhôm chống dính Suit Lock&Lock', 556000, 556000, 6, 1, '2023-02-27 09:06:09'),
	(29, 1, 3, 1, 'Ô tô', 100000, 100000, 8, 1, '2023-02-27 09:18:05');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(254) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.role: ~2 rows (approximately)
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`, `description`) VALUES
	(1, 'ADMIN', NULL),
	(2, 'USER', NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.status
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `table` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.status: ~11 rows (approximately)
DELETE FROM `status`;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` (`id`, `name`, `table`) VALUES
	(1, 'Chờ xác nhận', 'orders'),
	(2, 'Chờ thanh toán', 'orders'),
	(3, 'Đã thanh toán', 'orders'),
	(4, 'Hoàn thành', 'orders'),
	(5, 'Chờ xác nhận', 'product'),
	(6, 'Thông qua', 'product'),
	(7, 'Trả về', 'product'),
	(8, 'Đang giao dịch', 'product'),
	(9, 'Hết hàng', 'product'),
	(10, 'Đã hủy', 'orders'),
	(11, '', 'orders');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.type
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `table` varchar(30) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.type: ~4 rows (approximately)
DELETE FROM `type`;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` (`id`, `name`, `table`) VALUES
	(1, 'Tiền mặt', 'orders'),
	(2, 'Tài sản', 'orders'),
	(3, 'thumb', 'post_media'),
	(4, 'media', 'post_media');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;

-- Dumping structure for table webtraodoisp.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  `is_locked` int(11) DEFAULT 1 COMMENT '1: unlock / 2: lock',
  `created_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table webtraodoisp.user: ~4 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `full_name`, `address`, `email`, `phone`, `gender`, `id_role`, `is_locked`, `created_date`) VALUES
	(1, 'admin', '1234', 'administrator', 'Bac Ninh', 'admin@gmail.com', '012345678', 0, 1, 1, '2022-12-09 10:06:23'),
	(2, 'user', '1234', 'user', 'Hà Nội', 'user@gmail.com', '032145587', 1, 2, 1, '2022-12-11 20:57:20'),
	(3, 'user1', '1234', 'user1', 'Hòa Bình', 'user1@gmail.com', '032145586', 1, 2, 1, '2022-12-15 13:11:55'),
	(4, 'manhnv', 'manhnv', 'Nguyễn Văn Mạnh', 'Ha Noi', 'manhnguyen1422000@gmail.com', '0895452', 0, NULL, 2, '2023-02-02 11:12:55');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
