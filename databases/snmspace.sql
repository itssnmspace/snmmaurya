-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: snmmaurya_production
-- ------------------------------------------------------
-- Server version	5.5.50-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `active_admin_comments`
--

DROP TABLE IF EXISTS `active_admin_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_admin_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) DEFAULT NULL,
  `body` text,
  `resource_id` varchar(255) NOT NULL,
  `resource_type` varchar(255) NOT NULL,
  `author_type` varchar(255) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`),
  KEY `index_active_admin_comments_on_author_type_and_author_id` (`author_type`,`author_id`),
  KEY `index_active_admin_comments_on_resource_type_and_resource_id` (`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_admin_comments`
--

LOCK TABLES `active_admin_comments` WRITE;
/*!40000 ALTER TABLE `active_admin_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_admin_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_users_on_email` (`email`),
  UNIQUE KEY `index_admin_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin@snmmaurya.com','$2a$11$E8imqEGipWj6oCU19gMdiuiXgohZJfjkzSQiYPy3GApPw8Bm/ZWHW',NULL,NULL,'2016-08-23 13:06:51',23,'2016-10-01 16:48:16','2016-10-01 14:21:58','203.187.225.14','203.187.225.14');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','production','2016-08-13 09:51:19','2016-08-13 09:51:19');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `featured` tinyint(1) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_blogs_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_40ebb3948d` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,'Real Time Response ?','Most of the problems faced by interviewer, real time response. There are some causes I found like \'language spoken\'&nbsp;, preferring practical answers and so on ..<br>How to resolve these problems ?','real-time-response',1,0,1,'2016-09-28 08:03:16','2016-09-28 08:03:16');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `status` tinyint(1) DEFAULT '1',
  `blog_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_blog_id` (`blog_id`),
  KEY `index_comments_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,NULL,'what is this just a test!',1,1,6,'2016-08-17 11:15:38','2016-08-17 11:15:38');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `message` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (4,'sandeep','snmmaurya@gmail.com','7666760715','Euismod dictumst nonummy imperdiet litora felis aptent. Dolor justo consequat augue vulputate. Condimentum montes taciti faucibus. Consectetuer Eu tempus convallis praesent nonummy eget sapien leo egestas interdum lorem nisl amet. Senectus primis potenti gravida sodales. Venenatis montes phasellus ad sapien augue mauris hymenaeos nulla. Molestie posuere bibendum torquent vivamus imperdiet posuere eleifend quisque platea rhoncus mi. Semper laoreet. Primis turpis elementum vulputate mauris rhoncus velit, justo pharetra per amet justo quis magna mattis nunc libero mollis varius litora semper amet mi, etiam euismod interdum. Pretium curae; platea mattis erat tortor molestie pulvinar. Risus porttitor Ultrices, tempor. Sodales viverra Taciti vel augue libero ornare nulla cubilia fermentum convallis morbi enim Ipsum mauris penatibus gravida. Interdum nullam congue cubilia molestie sollicitudin. ','2016-08-18 11:41:37','2016-08-18 11:41:37'),(5,'Sandeep Maurya','snmmaurya@gmail.com','7666760715','this is a test only!','2016-09-02 15:40:05','2016-09-02 15:40:05');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloads`
--

DROP TABLE IF EXISTS `downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `download` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloads`
--

LOCK TABLES `downloads` WRITE;
/*!40000 ALTER TABLE `downloads` DISABLE KEYS */;
INSERT INTO `downloads` VALUES (1,'users#1471428350.csv','1471428350.csv','None','users',0,'2016-08-17 10:05:50','2016-08-17 10:05:50');
/*!40000 ALTER TABLE `downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educations`
--

DROP TABLE IF EXISTS `educations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cource` varchar(255) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text,
  `user_id` int(11) DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educations`
--

LOCK TABLES `educations` WRITE;
/*!40000 ALTER TABLE `educations` DISABLE KEYS */;
INSERT INTO `educations` VALUES (1,'MCA','IGNOU','Noida','MCA- Master in computer application is pursuing started in July 2016 from the IGNOU.<br>',1,'2016-07-01 00:00:52',NULL,1,NULL,'2016-08-17 11:17:05','2016-08-19 12:05:27'),(2,'BCA','IICS-UPRTOU','Allahabad','I have done BCA - Bachelor in computer application from the college IICS that is affiliated to UPRTOU situated in Allahabad. I completed my BCA with 66% score.<br>',1,'2008-07-01 00:00:28','2012-01-10 00:00:45',1,NULL,'2016-08-17 11:18:07','2016-08-19 12:04:48'),(3,'Highschool','SRRIC','Ambedkar Nagar','SRRIC is hindi medium college belonging to UP Board. Besides studying I \r\nas playing kho-kho game. Pass out in second division with 61% score.<br>',1,'2005-07-01 00:08:27','2006-05-01 00:08:36',1,NULL,'2016-08-17 11:18:49','2016-08-19 12:02:55'),(4,'Intermediate','SRRIC','Ambedkar Nagar','SRRIC is hindi medium college belonging to UP Board. Besides studying I as playing kho-kho game. Pass out in second division with 51% score.<br>',1,'2006-07-01 00:00:05','2008-05-01 00:08:36',1,NULL,'2016-08-17 11:19:50','2016-08-19 12:02:45');
/*!40000 ALTER TABLE `educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employments`
--

DROP TABLE IF EXISTS `employments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text,
  `url` varchar(255) DEFAULT NULL,
  `started_at` varchar(255) DEFAULT NULL,
  `end_at` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'Software Engineer',
  `status` tinyint(1) DEFAULT '1',
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employments`
--

LOCK TABLES `employments` WRITE;
/*!40000 ALTER TABLE `employments` DISABLE KEYS */;
INSERT INTO `employments` VALUES (1,'Holachef Hospitality Pvt Ltd','Mumbai','Holachef Hospitality is a product based company, supplies online food. I joined here as Sr Software Engineer. I has been working here for 1 + years. I manage everything like backend or frontend , Mainly worked at backend. My jobs are new feature development, bug fix, feature maintenance and API development.',NULL,'2015-07-17 00:08:03','',1,'Software Engineer',1,NULL,'2016-08-17 11:30:18','2016-08-19 11:59:42'),(2,'Parity Cube Pvt Ltd','Mumbai','Parity Cube is a product based company. It has own 3 product - desidime, jingoy and cuelinks. I joined this company as Software Developer.<br>Mainly I worked on jingoy.com, besides I worked on desidime the job to convert rails 2 to rails 4.<br>',NULL,'2013-09-01 00:00:14','2015-07-16 00:08:37',1,'Software Engineer',1,NULL,'2016-08-17 11:46:53','2016-08-19 11:56:46'),(3,'Infocular E Technologies','Allahabad','Incofular is a service based company. Located in Delhi. I worked in this company for 1 year.<br>I joined it as junior web developer (PHP).<br>I worked mainly on <a href=\"http://www.landequity.com\" target=\"_blank\">http://www.landequity.com</a> this product, besides I worked on jagabharat.com and popmysocial.com these sites are now offline.<br>',NULL,'2012-07-01 00:00:14','2013-08-30 00:00:27',1,'Software Engineer',1,NULL,'2016-08-17 11:47:45','2016-08-19 11:54:44');
/*!40000 ALTER TABLE `employments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendly_id_slugs`
--

DROP TABLE IF EXISTS `friendly_id_slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendly_id_slugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `sluggable_id` int(11) NOT NULL,
  `sluggable_type` varchar(50) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope` (`slug`,`sluggable_type`,`scope`),
  KEY `index_friendly_id_slugs_on_sluggable_id` (`sluggable_id`),
  KEY `index_friendly_id_slugs_on_slug_and_sluggable_type` (`slug`,`sluggable_type`),
  KEY `index_friendly_id_slugs_on_sluggable_type` (`sluggable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendly_id_slugs`
--

LOCK TABLES `friendly_id_slugs` WRITE;
/*!40000 ALTER TABLE `friendly_id_slugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendly_id_slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_assets`
--

DROP TABLE IF EXISTS `image_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `data_file_name` varchar(255) DEFAULT NULL,
  `data_content_type` varchar(255) DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `data_updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_assets`
--

LOCK TABLES `image_assets` WRITE;
/*!40000 ALTER TABLE `image_assets` DISABLE KEYS */;
INSERT INTO `image_assets` VALUES (1,'default_image_asset','Default image asset','#','_blnk','portfolio.png','image/png',1327,'2016-09-26 06:01:47',1,'2016-08-13 09:54:47','2016-09-26 06:01:48'),(2,'solutions','Solutions','#','_blnk','solutions.png','image/png',7124,'2016-09-26 06:02:07',1,'2016-08-13 09:54:47','2016-09-26 06:02:07'),(3,'programing_is_fun!_as_rubiest','Programing is fun! as rubiest','#','_blnk','rubiest.png','image/png',8599,'2016-09-26 06:01:34',1,'2016-08-13 09:54:47','2016-09-26 06:01:34'),(4,'about','About','#','_blnk','blog.png','image/png',2701,'2016-09-26 06:01:23',1,'2016-08-13 09:54:47','2016-09-26 06:01:23'),(5,'contact','Contact','#','_blnk','contact.png','image/png',5963,'2016-09-26 06:01:18',1,'2016-08-13 09:54:47','2016-09-26 06:01:18'),(6,'blog','Blog','#','_blnk','blog.png','image/png',2701,'2016-09-26 06:01:03',1,'2016-08-13 09:54:47','2016-09-26 06:01:03'),(7,'portfolio','Portfolio','#','_blnk','portfolio.png','image/png',1327,'2016-09-26 06:00:57',1,'2016-08-13 09:54:47','2016-09-26 06:00:57'),(8,'favicon','favicon','','','favicon-2.ico','image/vnd.microsoft.icon',1150,'2016-09-26 06:00:51',1,'2016-08-17 12:56:23','2016-09-26 06:00:51');
/*!40000 ALTER TABLE `image_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imageable_id` int(11) DEFAULT NULL,
  `imageable_type` varchar(255) DEFAULT NULL,
  `data_file_name` varchar(255) DEFAULT NULL,
  `data_content_type` varchar(255) DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `data_updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_images_on_imageable_type_and_imageable_id` (`imageable_type`,`imageable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,1,'User','mine-bg.jpg','image/jpeg',26091,'2016-09-26 06:03:47','2016-08-13 11:29:17','2016-09-26 06:03:47'),(2,1,'Topic','rubiest.png','image/png',8599,'2016-09-28 10:33:41','2016-08-17 10:56:34','2016-09-28 10:33:41'),(3,2,'Topic','ruby.png','image/png',4788,'2016-09-28 10:33:32','2016-08-17 10:57:09','2016-09-28 10:33:32'),(4,3,'Topic','gems.png','image/png',6011,'2016-09-28 10:33:20','2016-08-17 10:57:31','2016-09-28 10:33:20'),(5,4,'Topic','other-techonologies.png','image/png',3591,'2016-09-28 10:33:15','2016-08-17 10:57:46','2016-09-28 10:33:15'),(6,1,'Study','rubiest.png','image/png',8599,'2016-09-28 10:35:02','2016-08-17 10:59:57','2016-09-28 10:35:02'),(7,2,'Study','ruby.png','image/png',4788,'2016-09-28 10:34:56','2016-08-17 11:01:41','2016-09-28 10:34:56'),(8,1,'Portfolio','holachef.png','image/png',862732,'2016-09-26 06:13:22','2016-08-17 12:12:23','2016-09-26 06:13:22'),(9,2,'Portfolio','host2win.png','image/png',873143,'2016-09-26 06:12:12','2016-08-17 12:16:27','2016-09-26 06:12:12'),(10,3,'Portfolio','desidime.png','image/png',309607,'2016-09-26 06:11:52','2016-08-17 12:17:11','2016-09-26 06:11:52'),(11,4,'Portfolio','zingoy.png','image/png',441596,'2016-09-26 06:11:46','2016-08-17 12:17:34','2016-09-26 06:11:46'),(12,5,'Portfolio','cuelinks.png','image/png',537609,'2016-09-26 06:11:37','2016-08-17 12:17:57','2016-09-26 06:11:38'),(13,6,'Portfolio','landequity.png','image/png',944291,'2016-09-26 06:09:22','2016-08-17 12:21:31','2016-09-26 06:09:23'),(14,3,'Study','jquery.png','image/png',5983,'2016-09-28 10:34:45','2016-08-20 05:06:46','2016-09-28 10:34:45'),(15,4,'Study','mysql.png','image/png',6111,'2016-09-28 10:34:37','2016-08-20 05:09:19','2016-09-28 10:34:37'),(16,5,'Study','mongo.png','image/png',4659,'2016-09-28 10:34:28','2016-09-02 16:23:15','2016-09-28 10:34:28'),(17,6,'Study','elastic.png','image/png',5131,'2016-09-30 13:50:03','2016-09-30 13:50:04','2016-09-30 13:50:04'),(18,5,'Topic','mine-bg.jpg','image/jpeg',26091,'2016-10-01 17:15:09','2016-10-01 17:15:09','2016-10-01 17:15:09');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessions`
--

DROP TABLE IF EXISTS `lessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `description` text,
  `status` tinyint(1) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `study_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_lessions_on_user_id` (`user_id`),
  KEY `index_lessions_on_study_id` (`study_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessions`
--

LOCK TABLES `lessions` WRITE;
/*!40000 ALTER TABLE `lessions` DISABLE KEYS */;
INSERT INTO `lessions` VALUES (1,'What is Ruby ?','<div>\r\n    <p>Ruby is a dynamic, object oriented, general-purpose programming \r\nlanguage. It was developed in the mid of 1990 by Matsumoto Yukihiro also\r\n known as \"Matz\" in Japan.</p><p>This is an open source language, means you can freely use this language.</p><p>Very easy syntax are similar to perl and python. </p><p>There\r\n are many web development framework based on ruby like ruby on rails \r\n(most popular framework), not even frame there are many more cms based \r\non ruby like refinery cms, browser cms etc.<br></p><p>It has a large library you can say almost of all problems know as gem.</p><p><br></p><u><b>Some Important things</b></u><br><b><br>1) Everything in Ruby is an Object</b><br><br>irb&gt; nil.class<br>=&gt; NilClass<br>irb&gt; 1.class<br>=&gt; Fixnum<br>irb&gt; 1.2.class<br>=&gt; Float<br>irb&gt; \"something\".class<br>=&gt; String<br><br><b>2)Easier to manage</b><br><br>It provides facility to reopen class and alter methods at run time.<br><br><b>3) Good Leberary:</b><br><br>&gt;\"cherry\".reverse<br>=&gt; yrrech<br><b><br>4) Ruby as an awesome community</b><br>\r\n  </div>\r\n\r\n  <div>\r\n    \r\n  </div>',1,NULL,1,'what-is-ruby',0,'2016-08-17 11:02:01','2016-08-23 11:51:41','','',''),(2,'','',1,NULL,5,NULL,0,'2016-09-02 16:24:08','2016-09-02 16:24:08','','',''),(3,'Elastic search an introduction - Part 1','<span>Elastic search is used to make searching fast. whenever data size becomes huge search query get slow, but using elastic search we can achieve this job because it works on index.<br>This is like getting content/data in book&nbsp;by scanning index at the last of book&nbsp;instead of search content/data in each page.&nbsp;This type of index is called an inverted index.<br>ElasticSearch uses Apache Lucene to create and manage this inverted index.<br><br><br><div><b>How elastic search represents data ?</b></div><div>An index is consist of one or more documents(db terminology rows) and a document is consists of one or more fields(db terminilogy columns).</div><div><br></div><div><b>In elastic search no need for schema but like schema you\'ve to declare <i><u>mapping</u></i> like - &nbsp;</b></div><div>which field is going to be primary key / uniq key.</div><div>How to index and search each field.</div><div>What types of fields are they.<br><br>To create a mapping, you will need the Put Mapping API, or you can add multiple mappings when you create an index.</div><div>An index can store documents of different mapping types. A mapping is way of seperating the documents in the index into logical groups.</div><div><br></div><div><b>Elastic Search - Query DSL</b><br></div><div>The Query DSL is ElasticSearch\'s way of making Lucene\'s query syntax accessible to users, allowing complex queries to be composed using a JSON syntax.</div><div><br><br></div><div>ElasticSearch is powered by Lucene, a powerful open-source full-text search library.</div><div><br></div><div>The relationship between ElasticSearch and Lucene, is like that of the relationship between a car and its engine.</div><br><b>-- Features ---<br></b></span><div>Real-Time Data</div><div>Real-Time Advanced Analytics</div><div>Massively Distributed</div><div>High Availability</div><div>Multitenancy</div><div>Full-Text Search</div><div>Document-Oriented</div><div>Schema-Free</div><div>Developer-Friendly, RESTful API</div><div>Per-Operation Persistence</div>',1,NULL,6,'elastic-search-an-introduction-part-1',0,'2016-09-30 13:55:52','2016-09-30 14:24:25','elastic search part -1 introduction','elastic search','elastic search'),(5,'Elastic Search Installation on Ubuntu','<div><b>Setup elastic search on Operating System</b></div><div>-- ELASTIC SEARCH ON UBUNTU --&nbsp;</div><div>sudo apt-get update</div><div>install dependency like java</div><div><br></div><div><b>Download elasticsearch:</b></div><div>wget&nbsp;<a target=\"_blank\" href=\"https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.2.deb\">https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.2.deb</a><br><br></div><div><b>Install ES:</b></div><div>sudo dpkg -i elasticsearch-1.7.2.deb<br><br></div><div><b>Start/Manage the ES:</b></div><div>sudo service elasticsearch start</div><div>sudo service elasticsearch stop</div><div>sudo service elasticsearch restart</div><div><br></div><div>After starting ES visit on -&nbsp;<a target=\"_blank\" href=\"http://127.0.0.1:9200/\">http://127.0.0.1:9200/</a></div><div>Respons will be a JSON data having {status: 200}</div><div><br>Now installation completed on ubuntu</div>',1,NULL,6,'elastic-search-installation-on-ubuntu',0,'2016-10-01 14:23:43','2016-10-01 14:23:43','Elastic Search Installation on Ubuntu','Elastic Search, Installation on Ubuntu','Elastic Search Installation on Ubuntu'),(6,'Elastic Search rails implementation a sample example','<div><b>ATTENTIONS ! &nbsp; &nbsp;&nbsp;First make sure you application needs elastic search technology -<br><br></b></div><div>Some times we can get/search data rapidly using some advanced SQL with help of indexing even you are going to use elastic search that is not a recommended way.</div><div><br></div><div><b>There are two cases whether you can use elastic search -</b><br></div><div><br></div><div>1) Full-text search - This is what elastic search library build for&nbsp;</div><div>2) Getting very complex search/data using a complex query not performing well you can use elastic search<br><br><div><br></div></div>\r\nNow create a rails application for me my application name is \'snmmaurya\' consist of a <br>model -&gt; search<br>controller -&gt; searches<br>Searches Controller is consist of an action index\r\nSearch Model is consist of two fields title:string and descriptoin:text\r\n\r\n<pre>rails new snmmaurya\r\nrails g controller searches\r\nrails g model search\r\n</pre>\r\n\r\nLets add gem required to elastic search\r\n<pre>gem \'elasticsearch-model\'\r\ngem \'elasticsearch-rails\'\r\n</pre>\r\n<pre>bundle install\r\n</pre>\r\n\r\n\r\nsearches_controller.rb\r\n<pre>class SearchesController &lt; ApplicationController\r\n  def index\r\n    @searchs = Search.search(params[:keyword])\r\n  end\r\nend\r\n</pre>\r\nIn above controller search is class method of search model<br><br>search.rb<br><pre>class Search &lt; ActiveRecord:Base\r\n  include Elasticsearch::Model\r\n  include Elasticsearch::Model::Callbacks\r\n\r\n\r\n  def self.search(keyword)\r\n    __elasticsearch__.search(\r\n      {\r\n        query: {\r\n          multi_match: {\r\n            query: keyword,\r\n            fields: [\'title^10\', \'description\']\r\n          }\r\n        }\r\n      }\r\n    )\r\n  end\r\nend\r\n# Index all searches records from the DB to Elasticsearch on start of application\r\nSearch.import\r\n</pre>\r\nIn above example including two module first is es model(to get library of es into our model) and second one is es model callbacks(make sure after each transacion like creation/deletion/updatation index is getting updated into es database) .<br><br>Method self.search accepting a parameter that is keyword on basis of that we\'re passing to search keyword in title and description both.<br><br>&nbsp;A good idea to put - below code to the end of the model - search.rb. To reindex into Elasticsearch automatically on deletion / udpation / creation of data.\r\n<br>&nbsp;# Delete the previous articles index in Elasticsearch\r\n<br>Search.__elasticsearch__.client.indices.delete index: Search.index_name rescue nil<br># Create the new index with the new mapping\r\n<br>Search.__elasticsearch__.client.indices.create \\\r\n  index: Search.index_name,\r\n  body: { settings: Search.settings.to_hash, mappings: Search.mappings.to_hash }\r\n<br><br>Now create related search form in views/searches/index.html.erb &nbsp;with a submit button and text field name keyword form action must be /searches/.<br><br>Yay! done enjoy.',1,NULL,6,'elastic-search-rails-implementation-a-sample-example',0,'2016-10-01 14:24:38','2016-10-01 15:03:39','Elastic Search rails implementation a sample example','Elastic Search, elastic rails implementation, ES rails a sample example','Elastic Search rails implementation a sample example');
/*!40000 ALTER TABLE `lessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_data_settings`
--

DROP TABLE IF EXISTS `meta_data_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_data_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_url` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` text,
  `meta_description` text,
  `meta_default` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_data_settings`
--

LOCK TABLES `meta_data_settings` WRITE;
/*!40000 ALTER TABLE `meta_data_settings` DISABLE KEYS */;
INSERT INTO `meta_data_settings` VALUES (1,'/','Ruby and Ruby On Rails Solutions - SnmMaurya','Problem and solution system, Ruby, Ruby on rails, Query, Question, Answer, solution, MySQL, Jquery, ruby gems, rails gems, Create a problem, Query a problem, Your solution for unsolved/solved problems, Snm Maurya, Sandeep Maurya, snmmaurya','Ruby and Ruby On Rails based problem and solution system. You can create/query a problem to get appropriate solution and you solution of existing unsolved or solved problems.',1,'2016-08-13 09:51:19','2016-09-02 15:29:05');
/*!40000 ALTER TABLE `meta_data_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_data_socials`
--

DROP TABLE IF EXISTS `meta_data_socials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_data_socials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_data_setting_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_meta_data_socials_on_meta_data_setting_id` (`meta_data_setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_data_socials`
--

LOCK TABLES `meta_data_socials` WRITE;
/*!40000 ALTER TABLE `meta_data_socials` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_data_socials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolios`
--

DROP TABLE IF EXISTS `portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `tools` varchar(255) DEFAULT NULL,
  `description` text,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolios`
--

LOCK TABLES `portfolios` WRITE;
/*!40000 ALTER TABLE `portfolios` DISABLE KEYS */;
INSERT INTO `portfolios` VALUES (1,'Holachef Hospitality',NULL,'http://www.holachef.com','Ruby(Ruby on rails), MySQL, Jquery','<span>Its based on Ruby (Ruby on rails), MySQL and Jquery. My Role is to manage everything mostly back-end. I manages everything like new feature, feature maintenance and bug fix. I worked in group of 3-4 member as ROR developer.<br></span><br>',NULL,1,NULL,'2016-08-17 12:12:23','2016-08-19 11:41:59'),(2,'AClub',NULL,'http://demo.host2win.com/aiclub','PHP, MySQL, Jquery','This is a project based on PHP-MySQL. My Role was manage everything either front-ent or brack-end mostly I worked on back-end. It supports multiple language English and Chinese.<br>The Challenging task was manage views of languages, member validity and payments. <br><br>I worked in a group of two member.<br>',NULL,1,NULL,'2016-08-17 12:16:27','2016-08-19 11:37:49'),(3,'Desidime',NULL,'http://www.desidime.com','Ruby(Ruby on rails), MySQL, Jquery','Its based on Ruby (Ruby on rails), MySQL and Jquery. My Role is to manage everything mostly back-end. I convert this product from rails 2 to rails 4. The moto of this product is provide coupons and deals for online shoping. <br><br>',NULL,1,NULL,'2016-08-17 12:17:11','2016-08-19 11:49:01'),(4,'Zingoy',NULL,'http://www.zingoy.com','Ruby(Ruby on rails), MySQL, Jquery','Its based on Ruby (Ruby on rails), MySQL and Jquery. My Role is to manage everything mostly back-end. the moto of this product is share care and earn like you can get deals, can share and add to earn.<br>',NULL,1,NULL,'2016-08-17 12:17:34','2016-08-19 11:47:01'),(5,'Cuelinks',NULL,'http://www.cuelinks.com','Ruby(Ruby on rails), MySQL, Jquery','This production is based on Ruby(Ruby on rails), MySQL, Jquery. Mostly I worked on back-end . I worked in a group of 3-4 member. The moto of this product is Get More Traffic &amp; Earnings For Your Content.<br>',NULL,1,NULL,'2016-08-17 12:17:57','2016-08-19 11:47:28'),(6,'Land Equity',NULL,'http://www.landequity.com','PHP, MySQL, Jquery','This is a PHP, MySQL based application. My role was to manage back-end. I worked in a group of two member. The moto of this product is buying and selling lands. <br>',NULL,1,NULL,'2016-08-17 12:21:31','2016-08-19 11:42:58');
/*!40000 ALTER TABLE `portfolios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problems`
--

DROP TABLE IF EXISTS `problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `topic_id` int(11) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT '1',
  `correct` tinyint(1) DEFAULT '1',
  `position` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_problems_on_topic_id` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems`
--

LOCK TABLES `problems` WRITE;
/*!40000 ALTER TABLE `problems` DISABLE KEYS */;
INSERT INTO `problems` VALUES (3,'What is ruby ?','Tell me something interesting about ruby<br>',1,1,1,NULL,1,'what-is-ruby','2016-08-17 10:59:04','2016-08-23 11:05:39','','',''),(4,'how to setup deploy rails application using capistrano, nginx and puma.','<p>how to setup deploy rails application using capistrano, nginx and puma.<br></p>',2,1,1,NULL,1,'how-to-setup-deploy-rails-application-using-capistrano-nginx-and-puma','2016-08-18 06:00:54','2016-08-18 06:00:54',NULL,NULL,NULL),(5,'Sending email in ruby on rails. How to setup gmail smtp ?','<p>I want to send email in my rails application. but not able to configure gmail smpt .<br></p>',2,1,1,NULL,1,'sending-email-in-ruby-on-rails-how-to-setup-gmail-smtp','2016-08-18 11:54:50','2016-08-18 11:54:50','Sending email in ruby on rails. How to setup gmail smtp ?','I,want,to,send,email,in,my,rails,application.,but,not,able,to,configure,gmail,smpt,.','I want to send email in my rails application. but not able to configure gmail smpt .'),(6,'rails solr setup with capistrano','<p>Capistrano rails deployment start/restart/reindex solr server. How to configure solr setup as cap script to manage solr. <br></p>',2,1,1,NULL,1,'rails-solr-setup-with-capistrano','2016-08-23 11:35:14','2016-08-23 11:35:14','rails solr setup with capistrano','Capistrano,rails,deployment,start/restart/reindex,solr,server.,How,to,configure,solr,setup,as,cap,script,to,manage,solr.,','Capistrano rails deployment start/restart/reindex solr server. How to configure solr setup as cap script to manage solr. '),(8,'Setup cron on ubuntu to run a rails rake task','I want to send an email using cron at each hour not able to configure cron on ubuntu to run a rails task.<br>',2,1,1,NULL,1,'setup-cron-on-ubuntu-to-run-a-rails-rake-task','2016-08-23 13:08:37','2016-08-23 13:13:16','Setup cron on ubuntu to run a rails rake task','I,want,to,send,an,email,using,cron,at,each,hour,not,able,to,configure,cron,on,ubuntu,to,run,a,rails,task.','I want to send an email using cron at each hour not able to configure cron on ubuntu to run a rails task.'),(9,'RSPEC rails an introduction','Please describe rspec implementation with rails from start .. <br>',4,1,1,NULL,1,'rspec-rails-an-introduction','2016-08-24 09:51:50','2016-08-24 09:52:42','RSPEC rails an introduction','Rspec,is,a,testing,tool,,supports,BDD(Behavior,Driven,Development,).','Rspec is a testing tool, supports BDD(Behavior Driven Development ).'),(10,'Define sunspot and solr in term of ruby','<p>I am not very clear about sunspot and solr can somebody please explain what are these ?</p>',4,1,1,NULL,1,'define-sunspot-and-solr-in-term-of-ruby','2016-08-29 06:07:45','2016-08-29 06:07:45','Define sunspot and solr in term of ruby','I,am,not,very,clear,about,sunspot,and,solr,can,somebody,please,explain,what,are,these,?','I am not very clear about sunspot and solr can somebody please explain what are these ?'),(11,'Ubuntu system cron job based on rails rake task','<p>Can somebody explain steps to do --- Ubuntu system cron job based on rails rake task<br></p>',4,1,1,NULL,1,'ubuntu-system-cron-job-based-on-rails-rake-task','2016-08-29 10:32:59','2016-08-29 10:32:59','Ubuntu system cron job based on rails rake task','Can,somebody,explain,steps,to,do,---,Ubuntu,system,cron,job,based,on,rails,rake,task','Can somebody explain steps to do --- Ubuntu system cron job based on rails rake task'),(12,'MySQL create sql dump of a table','<p>MySQL create sql dump of a table<br></p>',4,1,1,NULL,1,'mysql-create-sql-dump-of-a-table','2016-09-02 15:20:02','2016-09-02 15:20:02','MySQL create sql dump of a table','MySQL,create,sql,dump,of,a,table','MySQL create sql dump of a table'),(13,'How to change / manage times on console ubuntu?','<p>I want to change my date time on ubuntu system via console</p>',4,1,1,NULL,1,'how-to-change-manage-times-on-console-ubuntu','2016-09-17 13:00:38','2016-09-17 13:00:38','How to change / manage times on console ubuntu?','I,want,to,change,my,date,time,on,ubuntu,system,via,console','I want to change my date time on ubuntu system via console'),(14,'what is static assets ?','<p>what is static assets ?<br></p>',2,1,1,NULL,1,'what-is-static-assets','2016-10-01 15:49:28','2016-10-01 15:49:28','what is static assets ?','what,is,static,assets,?','what is static assets ?'),(15,'literal meaning of terms','<p>asset</p><p>directories, manifest files, and preprocessor engines.8 Let’s consider each in turn.</p>',2,1,1,NULL,1,'literal-meaning-of-terms','2016-10-01 15:50:23','2016-10-01 15:50:23','literal meaning of terms','assetdirectories,,manifest,files,,and,preprocessor,engines.8,Let’s,consider,each,in,turn.','assetdirectories, manifest files, and preprocessor engines.8 Let’s consider each in turn.'),(16,'why select ROR ?','<p>Can you give me 5 concrete reasons why ROR is better than PHP</p>',2,1,1,NULL,1,'why-select-ror','2016-10-01 16:41:39','2016-10-01 16:41:39','why select ROR ?','Can,you,give,me,5,concrete,reasons,why,ROR,is,better,than,PHP','Can you give me 5 concrete reasons why ROR is better than PHP'),(17,'What is stub page','<p>what is stub page</p>',2,1,1,NULL,1,'what-is-stub-page','2016-10-01 17:07:48','2016-10-01 17:07:48','What is stub page','what,is,stub,page','what is stub page'),(20,'what is psychological','<p>psychological<br></p>',5,1,1,NULL,1,'what-is-psychological','2016-10-01 17:42:23','2016-10-01 17:42:23','what is psychological','psychological','psychological'),(21,'abstration layers','<p>what is abstraction layers</p>',5,1,1,NULL,1,'abstration-layers','2016-10-01 17:43:12','2016-10-01 17:43:12','abstration layers','what,is,abstraction,layers','what is abstraction layers'),(22,'Why there are so many conflicts while running bundle install','<p>For example I downloaded a to-do-list application written in rails from the net. When I run bundle install it gives error while running. This may be mostly because differences in the ruby and rails version. so If I use rvm manger to match the ruby and rails version the downloaded app is using. &nbsp;will it run? . Or it will depend on other factors too ?</p><p><br></p>',3,1,1,NULL,1,'why-there-are-so-many-conflicts-while-running-bundle-install','2016-10-02 09:29:58','2016-10-02 09:29:58','Why there are so many conflicts while running bundle install','For,example,I,downloaded,a,to-do-list,application,written,in,rails,from,the,net.,When,I,run,bundle,install,it,gives,error,while,running.,This,may,be,mostly,because,differences,in,the,ruby,and,rails,ver','For example I downloaded a to-do-list application written in rails from the net. When I run bundle install it gives error while running. This may be mostly because differences in the ruby and rails ver');
/*!40000 ALTER TABLE `problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `about` text,
  `address_line_one` varchar(255) DEFAULT NULL,
  `address_line_two` varchar(255) DEFAULT NULL,
  `address_line_three` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `pin_code` varchar(255) DEFAULT NULL,
  `my_country` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Sandeep','Maurya','7666760715','snmmaurya@gmail.com','Software Engineer at Holachef Hospitality Pvt Ltd','302 Sigma','','','Mumbai','MH','400076',NULL,1,1,NULL,'2016-08-13 11:29:20','2016-08-13 11:29:20');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `about` varchar(255) DEFAULT NULL,
  `description` text,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `employment_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'master',1,'2016-08-13 09:54:46','2016-08-13 09:54:46'),(2,'user',1,'2016-08-13 09:54:46','2016-08-13 09:54:46');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubiests`
--

DROP TABLE IF EXISTS `rubiests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubiests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `description` text,
  `status` tinyint(1) DEFAULT '1',
  `slug` varchar(255) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rubiests_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubiests`
--

LOCK TABLES `rubiests` WRITE;
/*!40000 ALTER TABLE `rubiests` DISABLE KEYS */;
INSERT INTO `rubiests` VALUES (1,'Why Ruby?','<p>Ruby is a dynamic, object oriented, general-purpose programming \r\nlanguage. It was developed in the mid of 1990 by Matsumoto Yukihiro also\r\n known as \"Matz\" in Japan.</p><p>This is an open source language, means you can freely use this language.</p><p>Very easy syntax are similar to perl and python. </p><p>There\r\n are many web development framework based on ruby like ruby on rails \r\n(most popular framework), not even frame there are many more cms based \r\non ruby like refinery cms, browser cms etc.<br></p><p>It has a large library you can say almost of all problems know as gem.</p><u><b>Some Important things<br></b></u><b><br>1) Everything in Ruby is an Object</b><br>irb&gt; nil.class<br>=&gt; NilClass<br>irb&gt; 1.class<br>=&gt; Fixnum<br>irb&gt; 1.2.class<br>=&gt; Float<br>irb&gt; \"something\".class<br>=&gt; String<br><br><b>2)Easier to manage</b><br>It facilities to reopen class and alter methods at run time.<br><br><b>3) Good Leberary:</b><br>&gt;\"cherry\".reverse<br>=&gt; yrrech<br><b><br>4) Ruby has an awesome community</b><br>',1,'why-ruby',0,NULL,'2016-08-17 10:55:19','2016-09-28 06:19:33','why ruby','why ruby, something interesting about ruby','Ruby is a dynamic, object oriented, general-purpose programming language');
/*!40000 ALTER TABLE `rubiests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160714142840'),('20160714142841'),('20160714142845'),('20160715093111'),('20160715093632'),('20160715101457'),('20160715101740'),('20160715101741'),('20160715101742'),('20160715101743'),('20160715101744'),('20160715101748'),('20160715101749'),('20160715123002'),('20160719044155'),('20160719071956'),('20160719072005'),('20160801090615'),('20160801090702'),('20160801175412'),('20160802103538'),('20160802103545'),('20160803072718'),('20160804130445'),('20160804130828'),('20160804170706'),('20160804171741'),('20160805052550'),('20160805052830'),('20160813112014'),('20160817133209'),('20160930150135');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searches`
--

LOCK TABLES `searches` WRITE;
/*!40000 ALTER TABLE `searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solutions`
--

DROP TABLE IF EXISTS `solutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `problem_id` int(11) DEFAULT NULL,
  `correct` tinyint(1) DEFAULT '1',
  `position` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_solutions_on_problem_id` (`problem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solutions`
--

LOCK TABLES `solutions` WRITE;
/*!40000 ALTER TABLE `solutions` DISABLE KEYS */;
INSERT INTO `solutions` VALUES (1,NULL,'<p>Ruby is a dynamic, object oriented, general-purpose programming language. It was developed in the mid of 1990 by Matsumoto Yukihiro also known as \"Matz\" in Japan.</p><p>This is an open source language, means you can freely use this language.</p><p>Very easy syntax are similar to perl and python. </p><p>There are many web development framework based on ruby like ruby on rails (most popular framework), not even frame there are many more cms based on ruby like refinery cms, browser cms etc.<br></p><p>It has a large library you can say almost of all problems know as gem.</p><p><br></p><p><u><b>Some Important things</b></u><br><b><br>1) Everything in Ruby is an Object</b><br><br>irb&gt; nil.class<br>=&gt; NilClass<br>irb&gt; 1.class<br>=&gt; Fixnum<br>irb&gt; 1.2.class<br>=&gt; Float<br>irb&gt; \"something\".class<br>=&gt; String<br><br><b>2)Easier to manage</b><br><br>It provides facility to reopen class and alter methods at run time.<br><br><b>3) Good Leberary:</b><br><br>&gt;\"cherry\".reverse<br>=&gt; yrrech<br><b><br>4) Ruby as an awesome community</b><br></p>',3,1,NULL,1,NULL,'2016-08-17 11:04:07','2016-08-23 11:26:00',NULL,NULL,NULL),(2,NULL,'<p><b>GMAIL SMTP SETTINGS:</b><br><br><b>1) </b>Login to you email account<br><br><br><b>2) </b>Visit to --<br>https://www.google.com/settings/security/lesssecureapps<br>click/check =&gt; turn on and wait for some time.<br></p><p><br><b>3) </b>From Gmail account--<br>Got To Settings<br>Click on Forwarding and POP/IMAP<br>Clikc on Enable IMAP<br><br>Save Settings<br></p><p><br><b>4)</b> Inside your project smtp settins:<br><br>rails application under env file like develpment.rb/production.rb whatever your need<br><br><br>config.action_mailer.default_url_options = { host: hostname }<br>config.action_mailer.delivery_method = :smtp<br>config.action_mailer.smtp_settings = {<br>&nbsp; address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \'smtp.gmail.com\',<br>&nbsp; port:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 587,<br>&nbsp; domain:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hostname,<br>&nbsp; user_name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gmail-username,<br>&nbsp; password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gmail-password,<br>&nbsp; authentication:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \'plain\',<br>&nbsp; enable_starttls_auto: true<br>}</p><p><br></p><p>Yay!<br></p><p>Now configuration done now you will able to send email. <br></p>',5,1,NULL,1,NULL,'2016-08-18 11:58:04','2016-08-18 12:00:38',NULL,NULL,NULL),(3,NULL,'<p><u><b>On Server</b></u><br><br>Assuming you\'ve your host like on digitalocea / aws and so on.<br><br>using appname: <b>snmmaurya</b><br><b><br>1) Login with root user</b><br><br>ssh root@xxx.xx.x.xx<br>now create a new user for scecurity reason do not work with root user<br><br>I am going to create a new user the name is:&nbsp; cherry<br><br>sudo adduser cherry<br>sudo adduser cherry sudo<br>su cherry<br><br><br>and now exit from server<br><br><br><b>2) Login with cherry user</b><br><br>ssh cherry@xxx.xx.x.xx<br><br><br>Create ssh key to put into github account<br><br>cat .ssh/id_rsa.pub and put into gihub account<br><br><b>3) install Git</b><br>sudo apt-get install git<br><br><b>4) Install dependency of RUBY</b><br><br>sudo apt-get update<br>sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev<br><br><b>5) Install RVM and Ruby</b><br><br>sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev<br>gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3<br>curl -sSL https://get.rvm.io | bash -s stable<br>source ~/.rvm/scripts/rvm<br>rvm install 2.3.1<br>rvm use 2.3.1 --default<br>ruby -v<br><br><b>6) Install bundler</b><br><br>gem install bundler<br><br><b>7) Install nginx</b><br><br>sudo apt-get install nginx<br><br><u><b><br>Local System</b></u><br><br><b>1) Add required gems under Gemfile</b><br><br></p><pre>gem \'figaro\'<br>gem \'puma\'<br><br>group :development do<br>&nbsp; gem \'capistrano\',&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; require: false<br>&nbsp; gem \'capistrano-rvm\',&nbsp;&nbsp;&nbsp;&nbsp; require: false<br>&nbsp; gem \'capistrano-rails\',&nbsp;&nbsp; require: false<br>&nbsp; gem \'capistrano-bundler\', require: false<br>&nbsp; gem \'capistrano3-puma\',&nbsp;&nbsp; require: false<br>&nbsp; gem \'capistrano-sidekiq\', require: false<br>end</pre><br><br>bundle install<br><br><b>2) Create capistrano configuration</b><br><br>cap install<br><br>will create some configuraiton files --<br><br><b>2.1) Capfile</b><br><br>Paste below content to you Capfile<br><br><pre># Load DSL and set up stages<br>require \"capistrano/setup\"<br><br># Include default deployment tasks<br>require \"capistrano/deploy\"<br><br>require \'capistrano/rails\'<br>require \'capistrano/bundler\'<br>require \'capistrano/rvm\'<br>require \'capistrano/puma\'<br>require \'capistrano/sidekiq\'<br><br># Load custom tasks from `lib/capistrano/tasks` if you have any defined<br>Dir.glob(\"lib/capistrano/tasks/*.rake\").each { |r| import r }<br><br><br><b>2.2) config/deploy.rb</b><br><br>Populate with below contents and change your server credentials and github repository<br><br># config valid only for current version of Capistrano<br>lock \'3.6.0\'<br><br># Change these<br>server \'xxx.xx.x.xx\', roles: [:web, :app, :db], primary: true<br><br>set :repo_url,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \'git@github.com:example/snmmaurya.git\'<br>set :application,&nbsp;&nbsp;&nbsp;&nbsp; \'snmmaurya\'<br>set :user,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \'cherry\'<br>set :puma_threads,&nbsp;&nbsp;&nbsp; [4, 16]<br>set :puma_workers,&nbsp;&nbsp;&nbsp; 0<br><br># Don\'t change these unless you know what you\'re doing<br>set :pty,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; true<br>set :use_sudo,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; true<br>set :stage,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :production<br>set :deploy_via,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :remote_cache<br>set :deploy_to,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \"/home/#{fetch(:user)}/apps/#{fetch(:application)}\"<br>set :puma_bind,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \"unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock\"<br>set :puma_state,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \"#{shared_path}/tmp/pids/puma.state\"<br>set :puma_pid,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \"#{shared_path}/tmp/pids/puma.pid\"<br>set :puma_access_log, \"#{release_path}/log/puma.error.log\"<br>set :puma_error_log,&nbsp; \"#{release_path}/log/puma.access.log\"<br>set :ssh_options,&nbsp;&nbsp;&nbsp;&nbsp; { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }<br>set :puma_preload_app, true<br>set :puma_worker_timeout, nil<br>set :puma_init_active_record, true&nbsp; # Change to false when not using ActiveRecord<br><br><br>#Assets adding prefix as in environments/production.rb<br># set :assets_prefix, \"/shared/public/assets\"<br># set :bundle_binstubs, -&gt; { shared_path.join(\'bin\') }<br><br>## Defaults:<br>set :scm,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :git<br>set :branch,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :master<br>set :format,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :pretty<br>set :log_level,&nbsp;&nbsp;&nbsp;&nbsp; :debug<br>set :keep_releases, 5<br><br>## Linked Files &amp; Directories (Default None):<br>set :linked_files, %w{config/database.yml config/settings.yml config/aws.yml config/secrets.yml config/puma.rb}<br>set :linked_dirs,&nbsp; %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}<br><br>namespace :puma do<br>&nbsp; desc \'Create Directories for Puma Pids and Socket\'<br>&nbsp; task :make_dirs do<br>&nbsp;&nbsp;&nbsp; on roles(:app) do<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; execute \"mkdir #{shared_path}/tmp/sockets -p\"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; execute \"mkdir #{shared_path}/tmp/pids -p\"<br>&nbsp;&nbsp;&nbsp; end<br>&nbsp; end<br><br>&nbsp; before :start, :make_dirs<br>end<br><br>namespace :deploy do<br>&nbsp; desc \"Make sure local git is in sync with remote.\"<br>&nbsp; task :check_revision do<br>&nbsp;&nbsp;&nbsp; on roles(:app) do<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unless `git rev-parse HEAD` == `git rev-parse origin/master`<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts \"WARNING: HEAD is not the same as origin/master\"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts \"Run `git push` to sync changes.\"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br>&nbsp;&nbsp;&nbsp; end<br>&nbsp; end<br><br>&nbsp; desc \'Initial Deploy\'<br>&nbsp; task :initial do<br>&nbsp;&nbsp;&nbsp; on roles(:app) do<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; before \'deploy:restart\', \'puma:start\'<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; invoke \'deploy\'<br>&nbsp;&nbsp;&nbsp; end<br>&nbsp; end<br><br>&nbsp; desc \'Restart application\'<br>&nbsp; task :restart do<br>&nbsp;&nbsp;&nbsp; on roles(:app), in: :sequence, wait: 5 do<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; invoke \'puma:restart\'<br>&nbsp;&nbsp;&nbsp; end<br>&nbsp; end<br><br>&nbsp; before :starting,&nbsp;&nbsp;&nbsp;&nbsp; :check_revision<br>&nbsp; after&nbsp; :finishing,&nbsp;&nbsp;&nbsp; :compile_assets<br>&nbsp; after&nbsp; :finishing,&nbsp;&nbsp;&nbsp; :cleanup<br>&nbsp; after&nbsp; :finishing,&nbsp;&nbsp;&nbsp; :restart<br>end</pre><br><br><b>2.3) ignore config/deploy/production.rb and config/deploy/staging.rb</b><br><br><br><b>3) Nginx configuration</b><br><br>Create nginx.conf inside your product <u>snmmaurya/config/nginx.conf</u> and populate with below contents change if required like location.<br><pre><br>upstream puma {<br>&nbsp; server unix:///home/cherrry/apps/snmmaurya/shared/tmp/sockets/snmmaurya-puma.sock;<br>}<br><br>server {<br>&nbsp; listen 80 default_server deferred;<br>&nbsp; server_name www.snmmaurya.com snmmaurya.com;<br><br>&nbsp; root /home/cherry/apps/snmmaurya/current/public;<br>&nbsp; access_log /home/cherry/apps/snmmaurya/current/log/nginx.access.log;<br>&nbsp; error_log /home/cherry/apps/snmmaurya/current/log/nginx.error.log info;<br><br>&nbsp; location ^~ /assets/ {<br>&nbsp;&nbsp;&nbsp; gzip_static on;<br>&nbsp;&nbsp;&nbsp; expires max;<br>&nbsp;&nbsp;&nbsp; add_header Cache-Control public;<br>&nbsp; }<br><br>&nbsp; try_files $uri/index.html $uri @puma;<br>&nbsp; location @puma {<br>&nbsp;&nbsp;&nbsp; proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;<br>&nbsp;&nbsp;&nbsp; proxy_set_header Host $http_host;<br>&nbsp;&nbsp;&nbsp; proxy_redirect off;<br><br>&nbsp;&nbsp;&nbsp; proxy_pass http://puma;<br>&nbsp; }<br><br>&nbsp; error_page 500 502 503 504 /500.html;<br>&nbsp; client_max_body_size 10M;<br>&nbsp; keepalive_timeout 10;<br>}</pre><br><br><b>4) Now deploy your application</b><p></p><p>bundle exec cap production deploy<br><br>............ Deployment Successfully .............<br><br><u><b>On Server</b></u><br><br><b>1) Symlink nginx conf file</b><br><br>sudo rm /etc/nginx/sites-enabled/default<br><br>sudo ln -nfs \"/home/cherry/apps/snmmaurya/current/config/nginx.conf\" \"/etc/nginx/sites-enabled/snmmaurya\"<br><br><br><b>2) Restart nginx </b><br><br>sudo service nginx restart<br><br>Final Step now visit on your =&gt;&nbsp; url <u>www.snmmaurya.com</u> Enjoy :)<br><br><u><b>Further assistance --</b></u><br><br>If your server asking password whenever you go to login via ssh-- <br><br><u>ssh-copy-id cherry@xxx.xx.x.xx</u> will fix your problem and will never ask whenever you go to login via ssh<br></p>',4,1,NULL,1,NULL,'2016-08-19 11:12:22','2016-08-19 11:21:52',NULL,NULL,NULL),(4,NULL,'<p><p></p><p>Assuming you\'ve setup capistrano script to deploy and working fine excluding solr management.</p><p><b>Step-1</b></p><p>create a file lib/capistrano/tasks/sunspot.cap and populate with following contents-<br></p>\r\n<pre><br>end<br>&nbsp; <br>&nbsp; end<br>&nbsp;&nbsp;&nbsp; end<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; execute :bundle, \'exec\', :rake, \'sunspot:solr:reindex[,,true]\'<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info \"Reindexing Solr database\"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with rails_env: fetch(:rails_env, \'production\') do<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; within current_path do<br>&nbsp;&nbsp;&nbsp; on roles(:app) do<br>&nbsp;&nbsp;&nbsp; invoke \'solr:start\'<br>&nbsp;&nbsp;&nbsp; end<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; execute :rm, \"-rf #{shared_path}/solr/data\"<br>&nbsp;&nbsp;&nbsp; on roles(:app) do<br>&nbsp;&nbsp;&nbsp; invoke \'solr:stop\'<br>&nbsp; task :reindex do<br>&nbsp; desc \"reindex the whole solr database\"<br>&nbsp; <br>&nbsp; after \'deploy:finished\', \'solr:restart\'<br>&nbsp; <br>&nbsp; end<br>&nbsp;&nbsp;&nbsp; invoke \'solr:start\'<br>&nbsp;&nbsp;&nbsp; invoke \'solr:stop\'<br>&nbsp; task :restart do<br>&nbsp; desc \"restart solr\"<br>&nbsp; <br>&nbsp; end<br>&nbsp;&nbsp;&nbsp; end<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; execute :bundle, \'exec\', \'sunspot-solr\', command, \"--port=8983 --data-directory=#{shared_path}/solr/data --pid-dir=#{shared_path}/pids\"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with rails_env: fetch(:rails_env, \'production\') do<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; within current_path do<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if command == \"start\" or (test \"[ -f #{solr_pid} ]\" and test \"kill -0 $( cat #{solr_pid} )\")<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; solr_pid = \"#{shared_path}/pids/sunspot-solr.pid\"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; on roles(:app) do<br>&nbsp;&nbsp;&nbsp; task command do<br>&nbsp;&nbsp;&nbsp; desc \"#{command} solr\"<br>&nbsp; %w[start stop].each do |command|<br>&nbsp; <br>namespace :solr do<br><br>end<br>&nbsp; end<br>&nbsp;&nbsp;&nbsp; end<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; execute :mkdir, \"-p #{shared_path}/solr/data\"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unless test \"[ -d #{shared_path}/solr/data ]\"<br>&nbsp;&nbsp;&nbsp; on roles(:app) do<br>&nbsp; before :updated, :setup_solr_data_dir do<br>namespace :deploy do<br>\r\n</pre>\r\n\r\n\r\nStep-2\r\n<p></p><p>config/sunspot.yml file should look like this -</p><p><br></p>\r\n<pre>production:\r\n  solr:\r\n    hostname: localhost\r\n    port: 8983\r\n    log_level: WARNING\r\n    path: /solr/default\r\n    # read_timeout: 2\r\n    # open_timeout: 0.5\r\n\r\ndevelopment:\r\n  solr:\r\n    hostname: localhost\r\n    port: 8982\r\n    log_level: INFO\r\n    path: /solr/default\r\n\r\ntest:\r\n  solr:\r\n    hostname: localhost\r\n    port: 8981\r\n    log_level: WARNING\r\n    path: /solr/default\r\n</pre>\r\n\r\n<u>And now try to deploy -- \r\n\r\nif solr not working</u></p><p><b>1) Kill if any process</b><br>ps aux | grep solr<br>sudo kill process-id<br><b><br>2) inside your project - Remove all of previous indexes</b><br>rm -r solr<br>&nbsp; &nbsp;<br><b>3. RAILS_ENV=production bundle exec rake sunspot:solr:start<br>4. RAILS_ENV=production bundle exec rake sunspot:solr:reindex</b><br><br><br><u>Again try to deploy will work fine - note in rails reindex process automatically handled</u><br></p><p><br></p><p><br></p>',6,1,NULL,1,NULL,'2016-08-23 11:47:32','2016-08-23 11:47:32',NULL,NULL,NULL),(5,NULL,'<p>First of all you should know about - cron job is based on OS(operating system) handled by OS at specified time.<br><u><b><br>On server/local system</b></u><br><b><br>Step-1 install cron<br></b><br>&gt; apt-get install cron<br><br><b>Step-2 Edit crontab file<br></b><br>&gt; crontab -e<br><br>Add line to edited file-<br><br></p><pre>0 * * * * cd /home/snmspace/apps/snmmaurya/current &amp;&amp; RAILS_ENV=production bundle exec rake task:email</pre><br>Save and exit -<br><b><br>Cron job setup done</b> - will work per hour like at 07:00, 06:00 and so on..<br><br>Explanation of above changes -<br><br>1) /home/snmspace/apps/snmmaurya/current&nbsp;&nbsp; is project path<br>2) rake task:email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; task is rake file and email is a task<br><br><br><br><u><b>In side you project</b></u><br><br>3) Create you rake file -<br><br>tasks/task.rake&nbsp; and define your rake task name <b>task</b> to send email-<br><p></p>',8,1,NULL,1,NULL,'2016-08-23 13:49:47','2016-08-23 13:49:47',NULL,NULL,NULL),(6,NULL,'<p></p><p>Rspec(REQUEST SPECIFICATION) is a testing tool supports DBB (Behavior Driven Develppment) framework for the Ruby programming language. The framework supports domain-specific language (DSL), are very natural like english.<br></p><p><u><b>Setting up rspec with rails</b></u></p><p>inside you gem file -<br></p><p><br></p>\r\n<pre>gem \'rspec-rails\'\r\n\r\ngroup :development, :test do\r\n  # Call \'byebug\' anywhere in the code to stop execution and get a debugger console\r\n  gem \'byebug\', platform: :mri\r\n  gem \'factory_girl_rails\'\r\n  gem \'capybara\'\r\n  gem \'rails-controller-testing\'\r\nend\r\n</pre>\r\n\r\nbundle install\r\nafter bundle install \r\n\r\n<p></p><p>Step -1</p><p>Configure rspec with rails </p><pre>rails generate rspec:install</pre><p>Step-2</p><p>Prepare your database for test </p><pre>rake db:migrate &amp;&amp; rake <a href=\"db:test:prepare\">db:test:prepare</a></pre><p>Step-3</p><p>Running test -<br></p><pre>rake spec</pre><p>If everything is fine this will give you output like -</p><pre>10 examples, 0 failures, 0 pending</pre><p><br></p>',9,1,NULL,1,NULL,'2016-08-24 10:16:39','2016-08-24 10:16:51',NULL,NULL,NULL),(7,NULL,'<p><b>SOLR or solar: </b>sorl is an open source search platform written in java language driven from the apache lucene. Major features are full-text search, faceted search, real-time indexing, dynamic clustering and so on..&nbsp;Solr is a popular search platform for Web sites because it can index and search multiple sites and return recommendations for related content based on the search query’s.</p><p>Solr was created by Yonik Seeley in 2004 at CNET Networks as an in-house project to add search functionality for the company website.</p><p><br></p><p><b>Sunspot:</b> Sunspot provides a Ruby API for searching and indexing documents in Solr Engine. To perform search with solr engine, sunspot maps model fields into Solr documents and updates them automatically. It provides some library method to manage search / query like - &nbsp;&nbsp; &nbsp; fulltext, facet and so on.</p><p><br></p><p><b>Configuration as example:</b></p>',10,1,NULL,1,NULL,'2016-08-29 06:22:28','2016-08-29 06:29:14',NULL,NULL,NULL),(8,NULL,'<p><p><b>Cron job setup</b>\r\n</p><p>\r\nI am going to run a rake task name task:email. My project directory is <i>/home/snmspace/apps/snmmaurya/current</i> and evnironment is production\r\n\r\n\r\nInside your project Create rake task file.</p><p>&nbsp;lib/task.rb</p><p>\r\n</p><pre>namespace :task do\r\n  desc \"Email via chron\"\r\n  task email: :environment do\r\n    STDOUT.puts \"Sending Email Via Chron........!\"\r\n\r\n    //your function goes here\r\n\r\n    /////for me I am sending an email =&gt; ChronMailer.information.delivery\r\n  end\r\nend\r\n</pre><b>\r\n\r\n\r\nLets start-\r\n</b><p></p><p>\r\n1) Login to your system/server system\r\n</p><p>\r\n2) Open chrontab file  by typing command: <b>crontab -e</b>\r\n</p><p>\r\nAdd these line to the opened file at last</p><p>\r\n\r\n</p><pre>#will run once daily\r\n0 0 * * * /bin/bash -l -c \'cd /home/snmspace/apps/snmmaurya/current &amp;&amp; RAILS_ENV=production bundle exec rake <a href=\"task:email\'\">task:email\'</a></pre>\r\n\r\nSave the file by pressing cntrl+x , press y and press enter\r\n</p><p>\r\nYay! Completed enjoy go ahead!</p>',11,1,NULL,1,NULL,'2016-08-29 10:37:36','2016-08-29 10:37:36',NULL,NULL,NULL),(9,NULL,'<p>That\'s very simple -</p><p><b>databasename</b>: snmmaurya</p><p><b>tablename</b>: users<br></p><p><b>username</b>: root</p><p><b>password</b>: root<br></p><p><b>Command prompt:</b><br></p><pre>mysqldump -uroot -proot snmmaurya users &gt; users.sql </pre><p>Yay! done enjoy </p><p><b><i>for more informations -&nbsp;</i></b></p><p>You can also take the dump of database instead of table -</p><pre style=\"line-height: 1.42857;\">mysqldump -uroot -proot dbname &gt; outputfilename.sql </pre>',12,1,NULL,1,NULL,'2016-09-02 15:22:30','2016-09-28 08:10:53',NULL,NULL,NULL),(10,NULL,'<p><b>Just use the command -</b></p><p>Custom Date Time-</p><p>sudo date -s \"17 September 2016 23:05:00\"</p><p><br></p><p>Internet Date Time</p><p>sudo ntpdate time.nist.gov</p><p><br></p><p>you can check date time using -&nbsp;<b>date</b>&nbsp;command also<br></p>',13,1,NULL,1,NULL,'2016-09-17 13:01:32','2016-09-22 07:34:43',NULL,NULL,NULL),(11,NULL,'<p>All the asset files like css, js and images occupied in public directory called static assets. In production mode to use static assets you have to configure in env file.&nbsp;</p><p><span style=\"line-height: 20px;\">config.serve_static_files = true for rails &gt;= 4</span></p><p><span style=\"line-height: 20px;\">config.serve_static_assets = true for rails &lt;= 4<br></span><br></p>',14,1,NULL,1,NULL,'2016-10-01 16:04:48','2016-10-01 16:04:48',NULL,NULL,NULL),(12,NULL,'<p><b>Assets</b> - js, css, scss, fonts and images are called assets in rails terms.</p><p><br></p><p><b>Manifest</b> file- as the name suggests manifest means master file. in terms of rails js manifest file is application.js and css manifest file is application.css.</p><p>For example initially when we create a new rails application we found views/layouts/application.html.erb that includes two file application.js and application.css but what about other assets files like bootstrap.js, bootstrap.css and so on -- answer is we include other asset files into their correspondent manifest file.</p><p><br></p><p>for example -&nbsp;</p><p>application.js</p><p>//= require bootstrap.min</p><p>//= require custom.js</p><p><br></p><p>finally by including a single manifest file application.js automatically includes all other assets included in application.js&nbsp;</p><p>The main job of a manifest file is to combine/collect the assets included into the file and deliver to the browser.</p><p><br></p><p><b>preprocessor engines </b>- In rails we use many more templates like erb, coffee, scss and so on - to deliver these template to the browser by manifest file these are parsed by preprocessor engine respectively so that these scripts can run/use. There are many library/preprocessor engines like sprockets to parse coffee files. &nbsp;<br></p>',15,1,NULL,1,NULL,'2016-10-01 16:12:34','2016-10-01 16:24:21',NULL,NULL,NULL),(13,NULL,'<p>this is nothing !<br></p>',21,1,NULL,1,NULL,'2016-10-01 17:46:04','2016-10-01 17:46:04',NULL,NULL,NULL);
/*!40000 ALTER TABLE `solutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studies`
--

DROP TABLE IF EXISTS `studies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `description` text,
  `status` tinyint(1) DEFAULT '1',
  `slug` varchar(255) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_studies_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studies`
--

LOCK TABLES `studies` WRITE;
/*!40000 ALTER TABLE `studies` DISABLE KEYS */;
INSERT INTO `studies` VALUES (1,'Ruby','Ruby is a dynamic, reflective, object-oriented, general-purpose programming language. It was designed and developed in the mid-1990s by Yukihiro \"Matz\" Matsumoto in Japan.<br><br>',1,'ruby',0,NULL,'2016-08-17 10:59:57','2016-08-20 05:03:38','','',''),(2,'Ruby On Rails','Ruby on Rails also known as Rails is a web application framework written in Ruby under the MIT License. Rails is a (MVC) framework, providing default structures for a database, a web service, and web pages.<br>',1,'ruby-on-rails',0,NULL,'2016-08-17 11:01:41','2016-08-20 05:02:01','','',''),(3,'Jquery','jQuery is a cross-platform JavaScript library designed to simplify the client-side scripting of HTML. jQuery is the most popular JavaScript library. JQuery is free, open-source software.<br>',1,'jquery',0,NULL,'2016-08-20 05:06:46','2016-08-20 05:12:16','Jquery a javascript liberary','jquery, javascript liberary, jquery book, jquery contents','jQuery is a cross-platform JavaScript library designed to simplify the client-side scripting of HTML. jQuery is the most popular JavaScript library. JQuery is free, open-source software.'),(4,'MySQL','MySQL is a open source RDBMS. World\'s most widely(world\'s second) used rdbms.<br>',1,'mysql',0,NULL,'2016-08-20 05:09:19','2016-08-20 05:09:19','MySQL','mysql, rdbms','MySQL is a open source RDBMS. World\'s most widely(world\'s second) used rdbms.'),(5,'Mongo DB','MongoDB is an open-source document database. MongoDB is written in c++. It supports No SQL.<br>',1,'mongo-db',0,NULL,'2016-09-02 16:23:15','2016-09-02 16:23:15','mongo db','mongo db, no sql','MongoDB is an open-source document database. MongoDB is written in c++. It supports No SQL.'),(6,'Elastic Search','Elastic search is used to make searching fast. whenever data size becomes huge search query get slow, but using elastic search we can achieve this job because it works on index not on column\'s text value.<br>',1,'elastic-search',0,NULL,'2016-09-30 13:50:04','2016-09-30 13:50:04','Elastic Search','Rails elastic search, rails search technologies','Elastic search is used to make searching fast. whenever data size becomes huge search query get slow, but using elastic search we can achieve this job because it works on index not on column\'s text value');
/*!40000 ALTER TABLE `studies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technologies`
--

DROP TABLE IF EXISTS `technologies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technologies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `experience` float DEFAULT NULL,
  `experience_level` varchar(255) DEFAULT NULL,
  `technology_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technologies`
--

LOCK TABLES `technologies` WRITE;
/*!40000 ALTER TABLE `technologies` DISABLE KEYS */;
INSERT INTO `technologies` VALUES (1,'Ruby','',3,'Expert',1,1,1,NULL,'2016-08-17 11:50:41','2016-09-02 15:43:31'),(2,'PHP','',1,'Expert',1,1,1,NULL,'2016-08-17 11:51:13','2016-08-17 11:51:13'),(3,'Ruby On Rails','',3,'Expert',2,1,1,NULL,'2016-08-17 11:51:40','2016-09-02 15:43:36'),(4,'HTML','',3.1,'Expert',2,1,1,NULL,'2016-08-17 11:51:57','2016-08-17 11:51:57'),(5,'Jquery','',3.1,'Expert',2,1,1,NULL,'2016-08-17 11:52:15','2016-08-17 11:52:15'),(6,'MySQL','',3.1,'Expert',3,1,1,NULL,'2016-08-17 11:52:34','2016-08-17 11:52:34'),(7,'PostgreSQL','',1,'Begginers',3,1,1,NULL,'2016-08-17 11:52:48','2016-08-17 11:52:48'),(8,'Facebook','',2,'Expert',4,1,1,NULL,'2016-08-17 11:53:07','2016-08-17 11:53:07'),(9,'Twitter','',2,'Expert',4,1,1,NULL,'2016-08-17 11:53:23','2016-08-17 11:53:23'),(10,'Github','',2,'Expert',4,1,1,NULL,'2016-08-17 11:53:36','2016-08-17 11:53:36'),(11,'Google','',2,'Expert',4,1,1,NULL,'2016-08-17 11:53:48','2016-08-17 11:53:48'),(12,'Sublime','',2,'Expert',5,1,1,NULL,'2016-08-17 11:54:00','2016-08-17 11:54:00'),(13,'Dreamweaver','',2,'Expert',5,1,1,NULL,'2016-08-17 11:54:15','2016-08-17 11:54:15'),(14,'Solr Search','',1,'Begginers',6,1,1,NULL,'2016-08-17 11:55:52','2016-09-02 15:44:55'),(15,'Capistrano and nginx - rails application deployment','',1,'Begginers',6,1,1,NULL,'2016-08-17 11:56:33','2016-09-02 15:44:50');
/*!40000 ALTER TABLE `technologies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology_types`
--

DROP TABLE IF EXISTS `technology_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technology_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology_types`
--

LOCK TABLES `technology_types` WRITE;
/*!40000 ALTER TABLE `technology_types` DISABLE KEYS */;
INSERT INTO `technology_types` VALUES (1,'Programing Language',1,NULL,'2016-08-17 11:48:45','2016-08-17 11:48:45'),(2,'Web Technologies',1,NULL,'2016-08-17 11:49:00','2016-08-17 11:49:00'),(3,'Database Technologies',1,NULL,'2016-08-17 11:49:14','2016-08-17 11:49:14'),(4,'Third Party API',1,NULL,'2016-08-17 11:49:42','2016-08-17 11:49:42'),(5,'Editors',1,NULL,'2016-08-17 11:49:54','2016-08-17 11:49:54'),(6,'Other Technologies',1,NULL,'2016-08-17 11:55:33','2016-08-17 11:55:33');
/*!40000 ALTER TABLE `technology_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (1,'Ruby','Topic covers ruby related queries/lessions<br>',NULL,1,'ruby','2016-08-17 10:56:34','2016-09-28 10:28:31','Ruby','ruby','Topic covers ruby related queries/lessions'),(2,'Ruby On Rails','This topic covers&nbsp;Ruby On Rails related topics<br>',NULL,1,'ruby-on-rails','2016-08-17 10:57:09','2016-09-28 10:28:02','Ruby On Rails','ruby on rails','This topic covers Ruby On Rails related lessions'),(3,'Ruby Gems','This topic covers ruby gems. what are very special gems ..<br>',NULL,1,'ruby-gems','2016-08-17 10:57:31','2016-09-28 10:26:45','Ruby / Rails related gems','ruby gems, ruby on rails gems, gems','This topic covers ruby gems. what are very special gem'),(4,'Other Technologies','Other technologies includes some issues those does not fit correctly in a topic<br>',NULL,1,'other-technologies','2016-08-17 10:57:46','2016-09-28 10:25:48','Other Technologies','code','Other technologies includes some issues those does not fit correctly in a topic'),(5,'psychological','psychological',NULL,1,'psychological','2016-10-01 17:14:23','2016-10-01 17:14:23','psychological','psychological','psychological');
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_problems`
--

DROP TABLE IF EXISTS `user_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `problem_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_problems_on_user_id` (`user_id`),
  KEY `index_user_problems_on_problem_id` (`problem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_problems`
--

LOCK TABLES `user_problems` WRITE;
/*!40000 ALTER TABLE `user_problems` DISABLE KEYS */;
INSERT INTO `user_problems` VALUES (1,1,4,'2016-08-18 06:00:54','2016-08-18 06:00:54'),(2,6,5,'2016-08-18 11:54:50','2016-08-18 11:54:50'),(3,1,6,'2016-08-23 11:35:14','2016-08-23 11:35:14'),(4,6,7,'2016-08-23 13:04:28','2016-08-23 13:04:28'),(5,1,10,'2016-08-29 06:07:45','2016-08-29 06:07:45'),(6,1,11,'2016-08-29 10:32:59','2016-08-29 10:32:59'),(7,1,12,'2016-09-02 15:20:02','2016-09-02 15:20:02'),(8,1,13,'2016-09-17 13:00:38','2016-09-17 13:00:38'),(9,9,14,'2016-10-01 15:49:28','2016-10-01 15:49:28'),(10,9,15,'2016-10-01 15:50:23','2016-10-01 15:50:23'),(11,9,16,'2016-10-01 16:41:39','2016-10-01 16:41:39'),(12,9,17,'2016-10-01 17:07:48','2016-10-01 17:07:48'),(15,1,20,'2016-10-01 17:42:23','2016-10-01 17:42:23'),(16,9,21,'2016-10-01 17:43:12','2016-10-01 17:43:12'),(17,9,22,'2016-10-02 09:29:58','2016-10-02 09:29:58');
/*!40000 ALTER TABLE `user_problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_solutions`
--

DROP TABLE IF EXISTS `user_solutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_solutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `solution_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_solutions_on_user_id` (`user_id`),
  KEY `index_user_solutions_on_solution_id` (`solution_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_solutions`
--

LOCK TABLES `user_solutions` WRITE;
/*!40000 ALTER TABLE `user_solutions` DISABLE KEYS */;
INSERT INTO `user_solutions` VALUES (1,6,1,'2016-08-17 11:04:07','2016-08-17 11:04:07'),(2,6,2,'2016-08-18 11:58:04','2016-08-18 11:58:04'),(3,1,3,'2016-08-19 11:12:22','2016-08-19 11:12:22'),(4,1,4,'2016-08-23 11:47:32','2016-08-23 11:47:32'),(5,1,5,'2016-08-23 13:49:47','2016-08-23 13:49:47'),(6,1,6,'2016-08-24 10:16:39','2016-08-24 10:16:39'),(7,1,7,'2016-08-29 06:22:28','2016-08-29 06:22:28'),(8,1,8,'2016-08-29 10:37:36','2016-08-29 10:37:36'),(9,1,9,'2016-09-02 15:22:30','2016-09-02 15:22:30'),(10,1,10,'2016-09-17 13:01:32','2016-09-17 13:01:32'),(11,1,11,'2016-10-01 16:04:48','2016-10-01 16:04:48'),(12,1,12,'2016-10-01 16:12:34','2016-10-01 16:12:34'),(13,1,13,'2016-10-01 17:46:04','2016-10-01 17:46:04');
/*!40000 ALTER TABLE `user_solutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `failed_attempts` int(11) NOT NULL DEFAULT '0',
  `unlock_token` varchar(255) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resume_doc_file_name` varchar(255) DEFAULT NULL,
  `resume_doc_content_type` varchar(255) DEFAULT NULL,
  `resume_doc_file_size` int(11) DEFAULT NULL,
  `resume_doc_updated_at` datetime DEFAULT NULL,
  `resume_pdf_file_name` varchar(255) DEFAULT NULL,
  `resume_pdf_content_type` varchar(255) DEFAULT NULL,
  `resume_pdf_file_size` int(11) DEFAULT NULL,
  `resume_pdf_updated_at` datetime DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'snm@snmmaurya.com','$2a$11$YtrwsQMMhJj0vW7V8.ImSO0LP7IOD3DJU5KLHJMnBqw1HTHVnMSFW','snm','snm','7666760715',NULL,NULL,NULL,18,'2016-10-01 17:45:53','2016-10-01 17:41:49','203.187.225.14','203.187.225.14',NULL,NULL,NULL,NULL,0,NULL,NULL,1,'2016-08-13 09:54:46','2016-10-01 17:45:53',NULL,NULL,NULL,NULL,'Snm.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document',14252,'2016-09-15 10:26:54',NULL,NULL),(2,'usertwo@snmmaurya.com','$2a$11$nBMqemm7IFm7KU6f2RsxF.wB28QNfY8oDaJlVRUpu9wpCSQmB1GTu','usertwo','usertwo','7666760715',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,2,'2016-08-13 09:54:47','2016-08-13 09:54:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'userthree@snmmaurya.com','$2a$11$N3kVYKWsA/rtQNkoj63PgOvueGZu22yXnAtQ6y0jg5SO0qeZ.kfbO','userthree','userthree','7666760715',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,2,'2016-08-13 09:54:47','2016-08-13 09:54:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'userfour@snmmaurya.com','$2a$11$3uNyAt6XBOOFjRdxczM2EuSLqrAwGcV.fN00KcEgwLkVZj.NMHwXO','userfour','userfour','7666760715',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,2,'2016-08-13 09:54:47','2016-08-13 09:54:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'snmplanet@gmail.com','$2a$11$ghpAXU2FN0p5nqIt64wWm.GMs4VgTYs3tYi.5CTXfljQzixAuWqam','snm-maurya','',NULL,NULL,NULL,NULL,1,'2016-08-17 08:29:24','2016-08-17 08:29:24','122.170.24.251','122.170.24.251',NULL,NULL,NULL,NULL,0,NULL,NULL,2,'2016-08-17 08:29:24','2016-08-17 08:29:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1825052311058273','facebook'),(6,'snmmaurya@gmail.com','$2a$11$xfk2/FYFnBzhQtB0uYsGA.REZxfakRRYUmZtSlrz9qUdAdlzM8pvO','snm-maurya','',NULL,NULL,NULL,NULL,4,'2016-08-23 11:53:23','2016-08-18 11:47:25','122.169.77.22','122.170.24.251',NULL,NULL,NULL,NULL,0,NULL,NULL,2,'2016-08-17 09:34:57','2016-08-23 11:53:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7777164','github'),(7,'snmplanet@gmail.com','$2a$11$8r3XhzvvkWMN.VxfWDW64ef8TD5i2kYqr5zVu2.JxMzBwLYZZSOxC','sandeep-maurya','',NULL,NULL,NULL,NULL,1,'2016-08-18 10:06:36','2016-08-18 10:06:36','122.170.24.251','122.170.24.251',NULL,NULL,NULL,NULL,0,NULL,NULL,2,'2016-08-18 10:06:36','2016-08-18 10:06:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B3RoLrs8ES','linkedin'),(8,'nswalke@gmail.com','$2a$11$3yQXvQ7mn4/g.SdzxpgtMui8Yn.XYJkjwHvL58eo4nzyfU40xfeAq','nswalkegmailcom','',NULL,NULL,NULL,NULL,1,'2016-08-23 11:31:46','2016-08-23 11:31:46','122.169.77.22','122.169.77.22',NULL,NULL,NULL,NULL,0,NULL,NULL,2,'2016-08-23 11:31:46','2016-08-23 11:31:46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10210651653712524','facebook'),(9,'bhavesh.badjatya@gmail.com','$2a$11$H87SbzSuEDFeeus2SEzCWuPoGbLFDPfn4QzvuOBkRRsHYzGIKd.ry','bhaveshbadjatyagmailcom','',NULL,NULL,NULL,NULL,2,'2016-10-01 15:48:42','2016-09-02 15:30:40','203.187.225.14','122.170.22.11',NULL,NULL,NULL,NULL,0,NULL,NULL,2,'2016-09-02 15:30:40','2016-10-01 15:48:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1122475864514109','facebook'),(10,'snmspace@gmail.com','$2a$11$yNZpuVbTtBVX6oL/ohIZxejK.vcf7gjzCdwlvlmXOMFJQmT.z93Rq','snmspace','','7666760715',NULL,NULL,NULL,1,'2016-09-09 05:08:54','2016-09-09 05:08:54','182.70.46.213','182.70.46.213',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2016-09-09 05:08:54','2016-09-09 05:08:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'aditi.gvc@gmail.com','$2a$11$h9ZO64hr9x7KvrW5xv0Dq.VWpMRZriGy2wT/SqW.q4fbMWDYTqnE6','aditigvcgmailcom','',NULL,NULL,NULL,NULL,1,'2016-09-09 05:10:46','2016-09-09 05:10:46','182.70.46.213','182.70.46.213',NULL,NULL,NULL,NULL,0,NULL,NULL,2,'2016-09-09 05:10:46','2016-09-09 05:10:46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1181585865217957','facebook'),(12,'jeetcool35@gmail.com','$2a$11$S7DGnZ5ewcJ9dMt1hSh0Cu1RI8OWm/DzDIrxYzmFwlP36bb223jbu','jeetcool35gmailcom','',NULL,NULL,NULL,NULL,1,'2016-09-24 14:39:19','2016-09-24 14:39:19','203.187.225.14','203.187.225.14',NULL,NULL,NULL,NULL,0,NULL,NULL,2,'2016-09-24 14:39:19','2016-09-24 14:39:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1283373025029160','facebook');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-05 16:25:37
