-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: gadgetbadget
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `buyer_id` int NOT NULL,
  PRIMARY KEY (`id`,`buyer_id`),
  KEY `fk_buyer_user_id` (`buyer_id`),
  CONSTRAINT `fk_buyer_user_id` FOREIGN KEY (`buyer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` VALUES (1,1);
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id_categories` int NOT NULL AUTO_INCREMENT,
  `description` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`id_categories`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Industrial'),(2,'Non-Industrial'),(3,'Infrastructure');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `method` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `amount` double NOT NULL,
  `date` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`payment_id`,`user_id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (3,1,'test','SuccessFully !',1200,'2021-04-17T20:10:20.606Z','Projectproject 4 Purchase'),(4,1,'test','SuccessFully !',1000,'2021-04-17T20:10:50.356Z','Projectproject 3 Purchase'),(5,1,'test','SuccessFully !',1400,'2021-04-17T20:10:56.860Z','Projectproject 2 Purchase'),(6,1,'test','SuccessFully !',1200,'2021-04-17T20:25:23.430Z','Projectproject 4 Purchase'),(7,1,'test','SuccessFully !',1000,'2021-04-17T20:25:39.747Z','Projectproject 3 Purchase'),(8,1,'test','SuccessFully !',1400,'2021-04-17T20:26:06.127Z','Projectproject 2 Purchase'),(9,1,'test','SuccessFully !',1200,'2021-04-17T20:30:26.500Z','Projectproject 4 Purchase');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_buyer`
--

DROP TABLE IF EXISTS `payment_buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_buyer` (
  `payment_card_id` int NOT NULL AUTO_INCREMENT,
  `credit_card_no` varchar(25) NOT NULL,
  `card_type` varchar(30) NOT NULL,
  `buyer_id` int NOT NULL,
  PRIMARY KEY (`payment_card_id`),
  KEY `fk_buyer_payment` (`buyer_id`),
  CONSTRAINT `fk_buyer_payment` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_buyer`
--

LOCK TABLES `payment_buyer` WRITE;
/*!40000 ALTER TABLE `payment_buyer` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `status_id` int NOT NULL,
  `project_type` varchar(50) NOT NULL,
  `approval` tinyint(1) NOT NULL,
  `file` varchar(145) DEFAULT NULL,
  `imgPath` varchar(145) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `noOfRaters` int DEFAULT NULL,
  `researcherId` int DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  PRIMARY KEY (`project_id`,`status_id`),
  KEY `fk_status_id` (`status_id`),
  CONSTRAINT `fk_status_id` FOREIGN KEY (`status_id`) REFERENCES `project_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (0,'project 1','project Desc',0,'project',0,'/FrontEnd/ProjectFiles/null','/FrontEnd/ProjectImages/istock-844535646.jpeg','1000',3,6,2,1),(2,'project 2','project Desc',1,'project',1,'/FrontEnd/ProjectFiles/views.zip','/FrontEnd/ProjectImages/424947-637484991899105497-16x9.jpeg','1400',4,2,2,2),(4,'project 3','project desc 3',1,'project',1,'/FrontEnd/ProjectFiles/views.zip','/FrontEnd/ProjectImages/images (1).jpeg','1000',3.5,4,2,3),(6,'project 4','project desc',1,'project',1,'/FrontEnd/ProjectFiles/views.zip','/FrontEnd/ProjectImages/images.jpeg','1200',2,2,2,1),(7,'project 5','project des',1,'project',1,'/FrontEnd/ProjectFiles/views.zip','/FrontEnd/ProjectImages/project.png','900',5,1,2,2),(10,'project test 1','test des1',0,'project',1,'/FrontEnd/ProjectFiles/_FrontEnd_ProjectFiles_views.zip','/FrontEnd/ProjectImages/Home1.png','1000',NULL,NULL,2,2),(11,'project test 2','test des2',0,'project',1,'/FrontEnd/ProjectFiles/_FrontEnd_ProjectFiles_views (2).zip','/FrontEnd/ProjectImages/gig.png','1000',NULL,NULL,2,2),(12,'test project 2','descript 2',0,'project',1,'/FrontEnd/ProjectFiles/_FrontEnd_ProjectFiles_views.zip','/FrontEnd/ProjectImages/logo.png','12333',NULL,NULL,2,3),(13,'project 3','descrpt 3',0,'project',1,'/FrontEnd/ProjectFiles/_FrontEnd_ProjectFiles_views (2).zip','/FrontEnd/ProjectImages/122222.jpg','1000',NULL,NULL,2,3),(15,'new project','new project description',0,'document',0,'/FrontEnd/ProjectFiles/3dStore.sql',NULL,NULL,NULL,NULL,2,2);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_status`
--

DROP TABLE IF EXISTS `project_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_status`
--

LOCK TABLES `project_status` WRITE;
/*!40000 ALTER TABLE `project_status` DISABLE KEYS */;
INSERT INTO `project_status` VALUES (0,'2021-04-16','test'),(1,'2021-04-16','test');
/*!40000 ALTER TABLE `project_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `researcher`
--

DROP TABLE IF EXISTS `researcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `researcher` (
  `researcher_id` int NOT NULL,
  PRIMARY KEY (`researcher_id`),
  CONSTRAINT `fk_research_id` FOREIGN KEY (`researcher_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `researcher`
--

LOCK TABLES `researcher` WRITE;
/*!40000 ALTER TABLE `researcher` DISABLE KEYS */;
INSERT INTO `researcher` VALUES (2);
/*!40000 ALTER TABLE `researcher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `review` varchar(445) DEFAULT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,2,'good project'),(2,4,'very convenient'),(3,6,'cool '),(4,2,'recommended'),(5,4,'good');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` varchar(250) NOT NULL,
  `telephone_no` varchar(10) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `imgPath` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Joseph','Mathew','1985-10-01','No 111,\nFirst Chapel Lane,\nColombia','0123456789','joseph_mathew','password','joseph_mathew@hotmail.com','buyer','/FrontEnd/ProfileImages/122222.jpg'),(2,'Ahamed','Satheej','1996-08-16','123','0123456787','satheej619','123','satheej619@gamil.com','researcher','/FrontEnd/ProfileImages/IMG_2601.JPG');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userCardDetails`
--

DROP TABLE IF EXISTS `userCardDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userCardDetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `cardNumber` varchar(45) DEFAULT NULL,
  `bank` varchar(45) DEFAULT NULL,
  `cardType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userCardDetails`
--

LOCK TABLES `userCardDetails` WRITE;
/*!40000 ALTER TABLE `userCardDetails` DISABLE KEYS */;
INSERT INTO `userCardDetails` VALUES (1,1,'567890','Sampath','debit'),(2,2,'123456','Commercial','credit');
/*!40000 ALTER TABLE `userCardDetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-18 22:44:26
