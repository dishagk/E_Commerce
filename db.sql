CREATE DATABASE  IF NOT EXISTS `e_commerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `e_commerce`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: e_commerce
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1re40cjegsfvw58xrkdp6bac6` (`product_id`),
  KEY `FK709eickf3kc0dujx3ub9i7btf` (`user_id`),
  CONSTRAINT `FK1re40cjegsfvw58xrkdp6bac6` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FK709eickf3kc0dujx3ub9i7btf` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (1,2,2,1);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `UK41g4n0emuvcm3qyf1f6cn43c0` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (3,'Accessories'),(5,'Mobile Accessories'),(4,'Mobiles'),(2,'Pants'),(1,'Shirts');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jwt_tokens`
--

DROP TABLE IF EXISTS `jwt_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jwt_tokens` (
  `token_id` int NOT NULL AUTO_INCREMENT,
  `expires_at` datetime(6) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`token_id`),
  KEY `FKhy6n4wirmw0ryw2wdmy9cx2mn` (`user_id`),
  CONSTRAINT `FKhy6n4wirmw0ryw2wdmy9cx2mn` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwt_tokens`
--

LOCK TABLES `jwt_tokens` WRITE;
/*!40000 ALTER TABLE `jwt_tokens` DISABLE KEYS */;
INSERT INTO `jwt_tokens` VALUES (1,'2025-01-20 16:50:10.968915','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkaXNoYSIsInJvbGUiOiJDVVNUT01FUiIsImlhdCI6MTczNzM2ODQxMCwiZXhwIjoxNzM3MzcyMDEwfQ.pMUIyefY4fNnUBUmzUF0YAl4P0NBkWlpTSCsrkWXNUfTNa_-EKD4S7jSOVZTA1lCvfAkKFCtjYkb_FxJGOLXNA',1);
/*!40000 ALTER TABLE `jwt_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price_per_unit` decimal(38,2) NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `total_price` decimal(38,2) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbioxgbv59vetrxe0ejfubep1w` (`order_id`),
  CONSTRAINT `FKbioxgbv59vetrxe0ejfubep1w` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `status` enum('FAILED','PENDING','SUCCESS') NOT NULL,
  `total_amount` decimal(38,2) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productimages`
--

DROP TABLE IF EXISTS `productimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productimages` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `image_url` text NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `FKjji6hlkuywsthaocoslq3l621` (`product_id`),
  CONSTRAINT `FKjji6hlkuywsthaocoslq3l621` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productimages`
--

LOCK TABLES `productimages` WRITE;
/*!40000 ALTER TABLE `productimages` DISABLE KEYS */;
INSERT INTO `productimages` VALUES (1,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt1.png',1),(2,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt2.png',2),(3,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt3.png',3),(4,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt4.png',4),(5,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt5.png',5),(6,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt6.png',6),(7,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt7.png',7),(8,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt8.png',8),(9,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt9.png',9),(10,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt10.png',10),(11,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt11.png',11),(12,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt12.png',12),(13,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt13.png',13),(14,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt14.png',14),(15,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt15.png',15),(16,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant1.png',16),(17,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant2.png',17),(18,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant3.png',18),(19,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant4.png',19),(20,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant5.png',20),(21,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant6.png',21),(22,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant7.png',22),(23,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant8.png',23),(24,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant9.png',24),(25,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant10.png',25),(26,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant11.png',26),(27,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant12.png',27),(28,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant13.png',28),(29,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant14.png',29),(30,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/pant15.png',30),(31,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv1.png',31),(32,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv2.png',32),(33,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv3.png',33),(34,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv4.png',34),(35,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv5.png',35),(36,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv6.png',36),(37,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv7.png',37),(38,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv8.png',38),(39,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv9.png',39),(40,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv10.png',40),(41,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv11.png',41),(42,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv12.png',42),(43,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv13.png',43),(44,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv14.png',44),(45,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/tv15.png',45),(46,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph1.png',46),(47,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph2.png',47),(48,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph3.png',48),(49,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph4.png',49),(50,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph5.png',50),(51,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph6.png',51),(52,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph7.png',52),(53,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph8.png',53),(54,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph9.png',54),(55,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph10.png',55),(56,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph11.png',56),(57,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph12.png',57),(58,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph13.png',58),(59,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph14.png',59),(60,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ph1.png',60),(61,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma1.png',61),(62,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma2.png',62),(63,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma3.png',63),(64,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma4.png',64),(65,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma5.png',65),(66,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma6.png',66),(67,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma7.png',67),(68,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma8.png',68),(69,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma9.png',69),(70,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/ma10.png',70);
/*!40000 ALTER TABLE `productimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'2025-01-01 12:11:26','Stylish Shirt1','Shirt1',499.99,100,'2025-01-01 12:11:26',1),(2,'2025-01-01 12:11:26','Stylish Shirt2','Shirt2',599.99,100,'2025-01-01 12:11:26',1),(3,'2025-01-01 12:11:26','Stylish Shirt3','Shirt3',699.99,100,'2025-01-01 12:11:26',1),(4,'2025-01-01 12:11:26','Stylish Shirt4','Shirt4',799.99,100,'2025-01-01 12:11:26',1),(5,'2025-01-01 12:11:26','Stylish Shirt5','Shirt5',899.99,100,'2025-01-01 12:11:26',1),(6,'2025-01-01 12:11:26','Stylish Shirt6','Shirt6',999.99,100,'2025-01-01 12:11:26',1),(7,'2025-01-01 12:11:26','Stylish Shirt7','Shirt7',1099.99,100,'2025-01-01 12:11:26',1),(8,'2025-01-01 12:11:26','Stylish Shirt8','Shirt8',1199.99,100,'2025-01-01 12:11:26',1),(9,'2025-01-01 12:11:26','Stylish Shirt9','Shirt9',1299.99,100,'2025-01-01 12:11:26',1),(10,'2025-01-01 12:11:26','Stylish Shirt10','Shirt10',1399.99,100,'2025-01-01 12:11:26',1),(11,'2025-01-01 12:11:26','Stylish Shirt11','Shirt11',1499.99,100,'2025-01-01 12:11:26',1),(12,'2025-01-01 12:11:26','Stylish Shirt12','Shirt12',1599.99,100,'2025-01-01 12:11:26',1),(13,'2025-01-01 12:11:26','Stylish Shirt13','Shirt13',1699.99,100,'2025-01-01 12:11:26',1),(14,'2025-01-01 12:11:26','Stylish Shirt14','Shirt14',1799.99,100,'2025-01-01 12:11:26',1),(15,'2025-01-01 12:11:26','Stylish Shirt15','Shirt15',1899.99,100,'2025-01-01 12:11:26',1),(16,'2025-01-04 19:08:11','Stylish Pant1','Pant1',799.99,50,'2025-01-04 19:08:11',2),(17,'2025-01-04 19:08:11','Stylish Pant2','Pant2',899.50,45,'2025-01-04 19:08:11',2),(18,'2025-01-04 19:08:11','Stylish Pant3','Pant3',759.99,40,'2025-01-04 19:08:11',2),(19,'2025-01-04 19:08:11','Stylish Pant4','Pant4',689.99,55,'2025-01-04 19:08:11',2),(20,'2025-01-04 19:08:11','Stylish Pant5','Pant5',999.99,30,'2025-01-04 19:08:11',2),(21,'2025-01-04 19:08:11','Stylish Pant6','Pant6',699.99,20,'2025-01-04 19:08:11',2),(22,'2025-01-04 19:08:11','Stylish Pant7','Pant7',849.50,35,'2025-01-04 19:08:11',2),(23,'2025-01-04 19:08:11','Stylish Pant8','Pant8',799.00,60,'2025-01-04 19:08:11',2),(24,'2025-01-04 19:08:11','Stylish Pant9','Pant9',729.99,25,'2025-01-04 19:08:11',2),(25,'2025-01-04 19:08:11','Stylish Pant10','Pant10',889.99,50,'2025-01-04 19:08:11',2),(26,'2025-01-04 19:08:11','Stylish Pant11','Pant11',819.99,40,'2025-01-04 19:08:11',2),(27,'2025-01-04 19:08:11','Stylish Pant12','Pant12',959.99,20,'2025-01-04 19:08:11',2),(28,'2025-01-04 19:08:11','Stylish Pant13','Pant13',999.00,70,'2025-01-04 19:08:11',2),(29,'2025-01-04 19:08:11','Stylish Pant14','Pant14',689.50,80,'2025-01-04 19:08:11',2),(30,'2025-01-04 19:08:11','Stylish Pant15','Pant15',899.99,90,'2025-01-04 19:08:11',2),(31,'2025-01-04 19:28:04','Smart TV1 with HD display','TV1',18999.99,20,'2025-01-04 19:58:22',3),(32,'2025-01-04 19:28:04','Smart TV2 with Full HD display','TV2',21999.50,15,'2025-01-04 19:58:22',3),(33,'2025-01-04 19:28:04','Smart TV3 with 4K display','TV3',29999.00,10,'2025-01-04 19:58:22',3),(34,'2025-01-04 19:28:04','Smart TV4 with HDR and Dolby Vision','TV4',25999.99,12,'2025-01-04 19:58:22',3),(35,'2025-01-04 19:28:04','Smart TV5 with Ultra HD screen','TV5',34999.99,8,'2025-01-04 19:58:22',3),(36,'2025-01-04 19:28:04','Smart TV6 with Alexa Built-in','TV6',27999.50,18,'2025-01-04 19:58:22',3),(37,'2025-01-04 19:28:04','Smart TV7 with Android OS','TV7',22999.00,22,'2025-01-04 19:58:22',3),(38,'2025-01-04 19:28:04','Smart TV8 with High Refresh Rate','TV8',31999.99,14,'2025-01-04 19:58:22',3),(39,'2025-01-04 19:28:04','Smart TV9 with Thin Bezels','TV9',24999.99,20,'2025-01-04 19:58:22',3),(40,'2025-01-04 19:28:04','Smart TV10 with AI Upscaling','TV10',39999.00,5,'2025-01-04 19:58:22',3),(41,'2025-01-04 19:31:27','Worlds BEst','Speaker',12999.99,50,'2025-01-04 20:14:51',3),(42,'2025-01-04 19:31:27','Indias best','Nikon DSLR',8999.50,75,'2025-01-04 20:14:51',3),(43,'2025-01-04 19:31:27','Sales Choice','NIK DSLR2',15999.00,40,'2025-01-04 20:14:51',3),(44,'2025-01-04 19:31:27','Capture Nik','NIC DSLR3',19999.99,30,'2025-01-04 20:14:51',3),(45,'2025-01-04 19:31:27','Smart TV15 with AI Upscaling','LAPTOP',24999.99,25,'2025-01-04 20:14:51',3),(46,'2025-01-04 19:31:27','Mobile6 with gaming chipset and high refresh rate','Mobile1',19999.99,50,'2025-01-04 20:12:48',4),(47,'2025-01-04 19:31:27','Mobile7 with gaming chipset and high refresh rate','Mobile2',8999.50,55,'2025-01-04 20:12:48',4),(48,'2025-01-04 19:31:27','Mobile8 with gaming chipset and high refresh rate','Mobile3',22999.00,50,'2025-01-04 20:12:48',4),(49,'2025-01-04 19:31:27','Mobile9 with gaming chipset and high refresh rate','Mobile4',8999.50,55,'2025-01-04 20:12:48',4),(50,'2025-01-04 19:31:27','Mobile10 with gaming chipset and high refresh rate','Mobile5',39999.00,50,'2025-01-04 20:14:51',4),(51,'2025-01-04 19:31:27','Mobile10 with gaming chipset and high refresh rate','Mobile6',48765.00,30,'2025-01-04 20:14:51',4),(52,'2025-01-04 19:31:27','Mobile11 with gaming chipset and high refresh rate','Mobile7',23456.00,200,'2025-01-04 20:14:51',4),(53,'2025-01-04 19:31:27','Mobile12with gaming chipset and high refresh rate','Mobile8',34598.00,345,'2025-01-04 20:14:51',4),(54,'2025-01-04 19:31:27','Mobile13 with gaming chipset and high refresh rate','Mobile9',45673.00,45,'2025-01-04 20:14:51',4),(55,'2025-01-04 19:31:27','Mobile14 with gaming chipset and high refresh rate','Mobile10',34567.00,56,'2025-01-04 20:14:51',4),(56,'2025-01-04 19:31:27','Mobile15 with gaming chipset and high refresh rate','Mobile11',23412.00,65,'2025-01-04 20:14:51',4),(57,'2025-01-04 19:31:27','Mobile12 with gaming chipset and high refresh rate','Mobile12',89765.00,456,'2025-01-04 20:14:51',4),(58,'2025-01-04 19:31:27','Mobile14 with gaming chipset and high refresh rate','Mobile13',23456.00,567,'2025-01-04 20:14:51',4),(59,'2025-01-04 19:31:27','Mobile11 with gaming chipset and high refresh rate','Mobile14',99990.00,234,'2025-01-04 20:14:51',4),(60,'2025-01-04 19:31:27','Mobile15 with gaming chipset and high refresh rate','Mobile15',45389.00,225,'2025-01-06 15:11:42',4),(61,'2025-01-06 15:23:10','A high-quality mobile accessory.','Mobile Accessory 1',499.99,150,'2025-01-06 15:23:10',5),(62,'2025-01-06 15:23:10','Durable and practical mobile accessory for everyday use.','Mobile Accessory 2',349.50,200,'2025-01-06 15:23:10',5),(63,'2025-01-06 15:23:10','A versatile mobile accessory with modern features.','Mobile Accessory 3',899.00,80,'2025-01-06 15:23:10',5),(64,'2025-01-06 15:23:10','Reliable mobile accessory designed for convenience.','Mobile Accessory 4',749.75,120,'2025-01-06 15:23:10',5),(65,'2025-01-06 15:23:10','Mobile accessory offering comfort and durability.','Mobile Accessory 5',199.99,250,'2025-01-06 15:23:10',5),(66,'2025-01-06 15:23:10','A stylish and protective mobile accessory.','Mobile Accessory 6',249.99,500,'2025-01-06 15:23:10',5),(67,'2025-01-06 15:23:10','Practical and efficient mobile accessory for everyday use.','Mobile Accessory 7',599.00,180,'2025-01-06 15:23:10',5),(68,'2025-01-06 15:23:10','An essential mobile accessory designed for convenience.','Mobile Accessory 8',399.50,350,'2025-01-06 15:23:10',5),(69,'2025-01-06 15:23:10','A reliable and well-built mobile accessory.','Mobile Accessory 9',149.00,600,'2025-01-06 15:23:10',5),(70,'2025-01-06 15:23:10','Compact and efficient mobile accessory for all your needs.','Mobile Accessory 10',1099.99,100,'2025-01-06 15:23:10',5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ADMIN','CUSTOMER') NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2025-01-20 15:50:01.968128','gkdisha26@gmail.com','$2a$10$nI5SYs7/GraFiTlGsLV9C.Vo3.KjFZX.q0EeO/zxmuPsB.LFLNYaS','CUSTOMER','2025-01-20 15:50:01.968128','disha');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'e_commerce'
--

--
-- Dumping routines for database 'e_commerce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-20 16:11:47
