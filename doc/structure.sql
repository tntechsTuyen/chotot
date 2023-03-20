-- --------------------------------------------------------
-- Host:                         103.18.6.89
-- Server version:               5.7.40-cll-lve - MySQL Community Server - (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ui14erqj_chotot
CREATE DATABASE IF NOT EXISTS `ui14erqj_chotot` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `ui14erqj_chotot`;

-- Dumping structure for table ui14erqj_chotot.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_media` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.category: ~4 rows (approximately)
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `id_media`, `name`, `content`) VALUES
	(1, NULL, 'Cate 1', 'Cate 1'),
	(2, 32, 'Cate 2', 'Cate 2'),
	(3, 31, 'Test cate 1', 'Test cate 1'),
	(4, 33, 'Test cate2', 'Test cate2');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table ui14erqj_chotot.category_meta
CREATE TABLE IF NOT EXISTS `category_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_category` int(11) DEFAULT NULL,
  `meta_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cate_cate_meta` (`id_category`),
  CONSTRAINT `cate_cate_meta` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.category_meta: ~5 rows (approximately)
DELETE FROM `category_meta`;
/*!40000 ALTER TABLE `category_meta` DISABLE KEYS */;
INSERT INTO `category_meta` (`id`, `id_category`, `meta_key`, `meta_value`, `description`) VALUES
	(1, 1, 'k1', 'k1', 'description k1'),
	(2, 1, 'k2', 'k2', 'description k2'),
	(3, 1, 'k3', 'k3', 'description k3'),
	(4, 2, 'c1', 'c1', 'description c1'),
	(5, 2, 'c2', 'c2', 'description c2');
/*!40000 ALTER TABLE `category_meta` ENABLE KEYS */;

-- Dumping structure for table ui14erqj_chotot.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `comment_post` (`id_post`),
  KEY `comment_user` (`id_user`),
  CONSTRAINT `comment_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comment_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.comment: ~0 rows (approximately)
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- Dumping structure for table ui14erqj_chotot.group_member
CREATE TABLE IF NOT EXISTS `group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_member_group` (`id_group`),
  KEY `group_member_user` (`id_user`),
  CONSTRAINT `group_member_group` FOREIGN KEY (`id_group`) REFERENCES `group_message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `group_member_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.group_member: ~46 rows (approximately)
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

-- Dumping structure for table ui14erqj_chotot.group_message
CREATE TABLE IF NOT EXISTS `group_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` int(11) DEFAULT '1' COMMENT '1: user - user',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.group_message: ~23 rows (approximately)
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

-- Dumping structure for table ui14erqj_chotot.media
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.media: ~32 rows (approximately)
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
	(27, '2023/2/6/20232695720.jpg', 'IMG'),
	(28, '2023/2/9/2023291329520.jpg', 'IMG'),
	(29, '2023/2/9/2023291332200.jpg', 'IMG'),
	(30, '2023/2/9/2023291336300.jpg', 'IMG'),
	(31, '2023/2/9/2023291428100.jpg', 'IMG'),
	(32, '2023/2/9/202329151770.jpg', 'IMG'),
	(33, '2023/2/9/2023291523230.jpg', 'IMG'),
	(34, '2023/2/17/20232171445330.jpg', 'IMG'),
	(35, '2023/2/17/20232171446240.jpg', 'IMG');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;

-- Dumping structure for table ui14erqj_chotot.message
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `readed` tinyint(4) DEFAULT '0' COMMENT '0: unread / 1: read',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `message_group` (`id_group`),
  KEY `message_user` (`id_user`),
  CONSTRAINT `message_group` FOREIGN KEY (`id_group`) REFERENCES `group_message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `message_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.message: ~36 rows (approximately)
DELETE FROM `message`;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` (`id`, `id_group`, `id_user`, `content`, `readed`, `created_date`) VALUES
	(1, 1, 2, 'test', 0, '2022-12-19 16:39:36'),
	(2, 2, 1, 'dasdasdsa', 1, '2022-12-19 16:46:11'),
	(3, 3, 3, 'zxczxcxz', 1, '2022-12-19 16:48:14'),
	(4, 2, 2, 'zxzczxc', 1, '2022-12-19 17:03:55'),
	(5, 2, 1, 'asdasdsa', 1, '2022-12-20 10:00:25'),
	(6, 2, 1, 'dasddsad', 1, '2022-12-20 10:07:55'),
	(7, 2, 1, 'tessst', 1, '2022-12-20 10:09:22'),
	(8, 2, 1, 'qwewqe', 1, '2022-12-20 10:10:59'),
	(9, 2, 3, 'test 1', 0, '2022-12-20 10:11:58'),
	(10, 2, 3, ' alo alo', 0, '2022-12-20 10:12:06'),
	(11, 2, 3, 'wqeqwe', 0, '2022-12-20 10:17:31'),
	(12, 2, 1, 'qwczxczx', 1, '2022-12-20 10:24:42'),
	(13, 2, 1, 'sadsadsa', 1, '2022-12-20 10:25:16'),
	(14, 2, 1, 'haha', 1, '2022-12-20 10:26:36'),
	(15, 2, 3, 'kê', 0, '2022-12-20 10:31:22'),
	(16, 2, 3, 'wqewqewq', 0, '2022-12-20 10:36:35'),
	(17, 2, 1, 'kệ b', 1, '2022-12-20 10:37:03'),
	(18, 2, 3, 'uk oke la', 0, '2022-12-20 10:37:08'),
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
	(33, 3, 2, 'test message', 0, '2022-12-23 10:17:08'),
	(34, 3, 2, 'áđâsd', 0, '2022-12-23 10:17:14'),
	(35, 2, 3, 'đâsd', 0, '2022-12-23 10:17:16'),
	(36, 3, 2, 'eqwewqeqw', 0, '2022-12-24 10:07:10');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;

-- Dumping structure for table ui14erqj_chotot.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_seller` int(11) DEFAULT NULL,
  `id_buyer` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `id_redirect` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT '0',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_seller` (`id_seller`),
  KEY `order_buyer` (`id_buyer`),
  KEY `order_product` (`id_product`),
  CONSTRAINT `order_buyer` FOREIGN KEY (`id_buyer`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_seller` FOREIGN KEY (`id_seller`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.orders: ~4 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `id_seller`, `id_buyer`, `id_product`, `id_status`, `id_type`, `id_redirect`, `price`, `rate`, `created_date`, `updated_date`) VALUES
	(13, 2, 3, 18, 10, 2, 0, 10000, 0, '2023-02-17 14:52:11', '2023-02-17 14:57:03'),
	(14, 3, 2, 17, 1, 2, 13, 0, 0, '2023-02-17 14:52:11', '2023-02-17 14:52:11'),
	(15, 3, 2, 17, 4, 2, 0, 0, 4, '2023-02-17 14:57:28', '2023-02-17 15:31:51'),
	(16, 2, 3, 18, 1, 2, 15, 10000, 0, '2023-02-17 14:57:29', '2023-02-17 14:57:29');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table ui14erqj_chotot.order_history
CREATE TABLE IF NOT EXISTS `order_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_history_user` (`id_user`),
  KEY `order_history_order` (`id_order`),
  CONSTRAINT `order_history_order` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_history_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.order_history: ~8 rows (approximately)
DELETE FROM `order_history`;
/*!40000 ALTER TABLE `order_history` DISABLE KEYS */;
INSERT INTO `order_history` (`id`, `id_order`, `id_user`, `id_status`, `description`, `created_date`) VALUES
	(1, 13, 3, 1, NULL, '2023-02-17 14:52:11'),
	(2, 14, 2, 1, NULL, '2023-02-17 14:52:11'),
	(3, 13, 2, 10, NULL, '2023-02-17 14:57:03'),
	(4, 15, 2, 1, NULL, '2023-02-17 14:57:29'),
	(5, 16, 3, 1, NULL, '2023-02-17 14:57:29'),
	(6, 15, 3, 2, NULL, '2023-02-17 14:58:18'),
	(7, 15, 2, 3, NULL, '2023-02-17 14:58:32'),
	(8, 15, 3, 4, NULL, '2023-02-17 14:59:00');
/*!40000 ALTER TABLE `order_history` ENABLE KEYS */;

-- Dumping structure for table ui14erqj_chotot.post
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_view` int(11) DEFAULT NULL COMMENT '0',
  `total_like` int(11) DEFAULT NULL COMMENT '0',
  `total_follow` int(11) DEFAULT NULL COMMENT '0',
  `total_comment` int(11) DEFAULT NULL COMMENT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `post_product` (`id_product`),
  KEY `post_user` (`id_user`),
  CONSTRAINT `post_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `post_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.post: ~2 rows (approximately)
DELETE FROM `post`;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`id`, `id_product`, `id_user`, `title`, `content`, `total_view`, `total_like`, `total_follow`, `total_comment`, `created_date`, `updated_date`) VALUES
	(15, 17, 3, 'u1p1swtest', 'u1p1swtest', 2, 0, 0, 0, '2023-02-17 14:45:33', '2023-02-17 14:45:33'),
	(16, 18, 2, 'u2p1swtest', 'u2p1swtest', 2, 0, 0, 0, '2023-02-17 14:46:24', '2023-02-17 14:46:24');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;

-- Dumping structure for table ui14erqj_chotot.post_media
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.post_media: ~2 rows (approximately)
DELETE FROM `post_media`;
/*!40000 ALTER TABLE `post_media` DISABLE KEYS */;
INSERT INTO `post_media` (`id`, `id_post`, `id_media`, `id_type`) VALUES
	(31, 15, 34, 3),
	(32, 16, 35, 3);
/*!40000 ALTER TABLE `post_media` ENABLE KEYS */;

-- Dumping structure for table ui14erqj_chotot.post_meta
CREATE TABLE IF NOT EXISTS `post_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_post` int(11) DEFAULT NULL,
  `meta_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_name` text COLLATE utf8_unicode_ci,
  `meta_value` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `post_meta_post` (`id_post`),
  CONSTRAINT `post_meta_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.post_meta: ~5 rows (approximately)
DELETE FROM `post_meta`;
/*!40000 ALTER TABLE `post_meta` DISABLE KEYS */;
INSERT INTO `post_meta` (`id`, `id_post`, `meta_key`, `meta_name`, `meta_value`, `description`) VALUES
	(42, 15, 'k1', 'k1', 'u1p1swtest', NULL),
	(43, 15, 'k2', 'k2', 'u1p1swtest', NULL),
	(44, 15, 'k3', 'k3', 'u1p1swtest', NULL),
	(45, 16, 'c1', 'c1', 'u2p1swtest', NULL),
	(46, 16, 'c2', 'c2', 'u2p1swtest', NULL);
/*!40000 ALTER TABLE `post_meta` ENABLE KEYS */;

-- Dumping structure for table ui14erqj_chotot.post_user
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.post_user: ~2 rows (approximately)
DELETE FROM `post_user`;
/*!40000 ALTER TABLE `post_user` DISABLE KEYS */;
INSERT INTO `post_user` (`id`, `id_post`, `id_user`, `had_view`, `had_like`, `had_follow`) VALUES
	(13, 16, 3, 1, 0, 0),
	(14, 15, 2, 1, 0, 0),
	(15, 16, 2, 1, 0, 0),
	(16, 15, 3, 1, 0, 0);
/*!40000 ALTER TABLE `post_user` ENABLE KEYS */;

-- Dumping structure for table ui14erqj_chotot.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_category` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_confirmer` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `price_verify` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_category` (`id_category`),
  KEY `product_user` (`id_user`),
  KEY `product_confirmer` (`id_confirmer`),
  CONSTRAINT `product_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_confirmer` FOREIGN KEY (`id_confirmer`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.product: ~2 rows (approximately)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `id_category`, `id_user`, `id_confirmer`, `name`, `price`, `price_verify`, `id_status`, `created_date`) VALUES
	(17, 1, 3, 1, 'u1p1swtest', 30000, 30000, 9, '2023-02-17 14:45:33'),
	(18, 2, 2, 1, 'u2p1swtest', 40000, 40000, 8, '2023-02-17 14:46:24');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table ui14erqj_chotot.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.role: ~2 rows (approximately)
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`, `description`) VALUES
	(1, 'ADMIN', NULL),
	(2, 'USER', NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table ui14erqj_chotot.status
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `table` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.status: ~11 rows (approximately)
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

-- Dumping structure for table ui14erqj_chotot.type
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `table` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.type: ~4 rows (approximately)
DELETE FROM `type`;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` (`id`, `name`, `table`) VALUES
	(1, 'Tiền mặt', 'orders'),
	(2, 'Tài sản', 'orders'),
	(3, 'thumb', 'post_media'),
	(4, 'media', 'post_media');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;

-- Dumping structure for table ui14erqj_chotot.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table ui14erqj_chotot.user: ~3 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `full_name`, `address`, `email`, `phone`, `gender`, `id_role`, `created_date`) VALUES
	(1, 'admin', '1234', 'administrator', 'Bac Ninh', 'admin@gmail.com', '012345678', 0, 1, '2022-12-09 10:06:23'),
	(2, 'user', '1234', 'user', 'Hà Nội', 'user@gmail.com', '032145587', 1, 2, '2022-12-11 20:57:20'),
	(3, 'user1', '1234', 'user1', 'Hòa Bình', 'user1@gmail.com', '032145586', 1, 2, '2022-12-15 13:11:55');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
