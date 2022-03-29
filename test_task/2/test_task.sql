-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: test_task
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `additional_services`
--

DROP TABLE IF EXISTS `additional_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `additional_services` (
  `additional_services_id` int NOT NULL AUTO_INCREMENT,
  `service_name` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sum` decimal(10,2) NOT NULL,
  `application_parameters_application_id` int NOT NULL,
  PRIMARY KEY (`additional_services_id`,`application_parameters_application_id`),
  KEY `fk_additional_services_application_parameters1_idx` (`application_parameters_application_id`),
  CONSTRAINT `fk_additional_services_application_parameters1` FOREIGN KEY (`application_parameters_application_id`) REFERENCES `application_parameters` (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_services`
--

LOCK TABLES `additional_services` WRITE;
/*!40000 ALTER TABLE `additional_services` DISABLE KEYS */;
INSERT INTO `additional_services` VALUES (1,'Страхование жизни',25000.00,1),(2,'Юридическая помощь',15000.00,2),(3,'Юридическая помощь',15000.00,3),(4,'Юридическая помощь',15000.00,4),(5,'Юридическая помощь',15000.00,5),(6,'Страхование жизни',25000.00,6),(7,'Юридическая помощь',15000.00,6);
/*!40000 ALTER TABLE `additional_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_parameters`
--

DROP TABLE IF EXISTS `application_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_parameters` (
  `application_id` int NOT NULL AUTO_INCREMENT,
  `product_type` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `loan_purpose` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sum` decimal(15,2) NOT NULL,
  `lending_rate` double(5,2) NOT NULL,
  `additional_services` tinyint(1) NOT NULL,
  `credit_term` int NOT NULL,
  `sum_total` decimal(10,2) NOT NULL,
  `application_date` date NOT NULL,
  `person_person_id` int NOT NULL,
  `person_application_parameters_application_id` int NOT NULL,
  `person_passport_person_passport_person_id` int NOT NULL,
  PRIMARY KEY (`application_id`,`person_person_id`,`person_application_parameters_application_id`,`person_passport_person_passport_person_id`),
  KEY `fk_application_parameters_person1_idx` (`person_person_id`,`person_application_parameters_application_id`,`person_passport_person_passport_person_id`),
  CONSTRAINT `fk_application_parameters_person1` FOREIGN KEY (`person_person_id`, `person_application_parameters_application_id`, `person_passport_person_passport_person_id`) REFERENCES `person` (`person_id`, `application_parameters_application_id`, `passport_person_passport_person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_parameters`
--

LOCK TABLES `application_parameters` WRITE;
/*!40000 ALTER TABLE `application_parameters` DISABLE KEYS */;
INSERT INTO `application_parameters` VALUES (1,'Кредит наличными','Покупка товаров/услуг',100000.00,7.70,1,12,140000.00,'2022-03-26',1,1,1),(2,'Кредит наличными','Покупка товаров/услуг',100000.00,7.70,1,12,140000.00,'2022-03-26',2,2,2),(3,'Кредит наличными','Покупка товаров/услуг',100000.00,7.70,1,12,140000.00,'2022-03-26',3,3,3),(4,'Кредит наличными','Покупка товаров/услуг',100000.00,7.70,1,12,140000.00,'2022-03-26',4,4,4),(5,'Кредит безналичными','Покупка товаров/услуг',100000.00,7.70,1,12,140000.00,'2022-03-26',5,5,5),(6,'Кредит безналичными','Покупка товаров/услуг',100000.00,7.70,1,12,140000.00,'2022-03-26',6,6,6),(7,'Кредит безналичными','Покупка товаров/услуг',100000.00,7.70,1,12,140000.00,'2022-03-26',7,7,7),(8,'Кредит безналичными','Покупка товаров/услуг',100000.00,7.70,1,12,140000.00,'2022-03-26',8,8,8),(9,'Кредит безналичными','Покупка товаров/услуг',100000.00,7.70,1,12,140000.00,'2022-03-26',9,9,9),(10,'Кредит наличными','Покупка товаров/услуг',100000.00,7.70,1,12,140000.00,'2022-03-26',10,10,10),(11,'Кредит наличными','Покупка товаров/услуг',100000.00,7.70,1,12,140000.00,'2022-03-26',11,11,11),(12,'Кредит наличными','Покупка товаров/услуг',100000.00,7.70,1,12,140000.00,'2021-03-26',12,12,12);
/*!40000 ALTER TABLE `application_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passport_person`
--

DROP TABLE IF EXISTS `passport_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passport_person` (
  `serial` int NOT NULL,
  `nubmer` int NOT NULL,
  `issue_date` date NOT NULL,
  `department_code` int NOT NULL,
  `issued_by` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_of_birthday` date NOT NULL,
  `place_of_birth` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `place_of_registration` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `person_person_id` int NOT NULL,
  `person_application_parameters_application_id` int NOT NULL,
  `person_passport_person_passport_person_id` int NOT NULL,
  PRIMARY KEY (`person_person_id`,`person_application_parameters_application_id`,`person_passport_person_passport_person_id`),
  KEY `fk_passport_person_person1_idx` (`person_person_id`,`person_application_parameters_application_id`,`person_passport_person_passport_person_id`),
  CONSTRAINT `fk_passport_person_person1` FOREIGN KEY (`person_person_id`, `person_application_parameters_application_id`, `person_passport_person_passport_person_id`) REFERENCES `person` (`person_id`, `application_parameters_application_id`, `passport_person_passport_person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passport_person`
--

LOCK TABLES `passport_person` WRITE;
/*!40000 ALTER TABLE `passport_person` DISABLE KEYS */;
INSERT INTO `passport_person` VALUES (1234,123456,'1999-03-10',654345,'Кем то выдан','1988-11-15','Moscow','Moscow',1,1,1),(1234,123456,'1999-03-10',654345,'Кем то выдан','1988-11-15','Moscow','Moscow',2,2,2),(1234,123456,'1999-03-10',654345,'Кем то выдан','1988-11-15','Moscow','Moscow',3,3,3),(1234,123456,'1999-03-10',654345,'Кем то выдан','1988-11-15','Moscow','Moscow',4,4,4),(1234,123456,'1999-03-10',654345,'Кем то выдан','1988-11-15','Moscow','Moscow',5,5,5),(1234,123456,'1999-03-10',654345,'Кем то выдан','1988-11-15','Moscow','Moscow',6,6,6),(1234,123456,'1999-03-10',654345,'Кем то выдан','1988-11-15','Moscow','Moscow',7,7,7),(1234,123456,'1999-03-10',654345,'Кем то выдан','1988-11-15','Moscow','Moscow',8,8,8),(1234,123456,'1999-03-10',654345,'Кем то выдан','1988-11-15','Moscow','Moscow',9,9,9),(1234,123456,'1999-03-10',654345,'Кем то выдан','1988-11-15','Moscow','Moscow',10,10,10),(1234,123456,'1999-03-10',654345,'Кем то выдан','1988-11-15','Moscow','Moscow',11,11,11),(1234,123456,'1999-03-10',654345,'Кем то выдан','1988-11-15','Moscow','Moscow',12,12,12);
/*!40000 ALTER TABLE `passport_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `first_name` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `father_name` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `phone` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `additional_phone` tinytext COLLATE utf8mb4_unicode_520_ci,
  `email` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `application_parameters_application_id` int NOT NULL,
  `passport_person_passport_person_id` int NOT NULL,
  PRIMARY KEY (`person_id`,`application_parameters_application_id`,`passport_person_passport_person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Иван','Иванов','Иванович','9393699334',NULL,'ivanov@mail.ru',1,1),(2,'Иван','Иванов','Иванович','9393699334',NULL,'ivanov@mail.ru',2,2),(3,'Иван','Иванов','Иванович','9393699334',NULL,'ivanov@mail.ru',3,3),(4,'Иван','Иванов','Иванович','9393699334',NULL,'ivanov@mail.ru',4,4),(5,'Иван','Иванов','Иванович','9393699334',NULL,'ivanov@mail.ru',5,5),(6,'Иван','Иванов','Иванович','9393699334',NULL,'ivanov@mail.ru',6,6),(7,'Иван','Иванов','Иванович','9393699334',NULL,'ivanov@mail.ru',7,7),(8,'Иван','Иванов','Иванович','9393699334',NULL,'ivanov@mail.ru',8,8),(9,'Иван','Иванов','Иванович','9393699334',NULL,'ivanov@mail.ru',9,9),(10,'Иван','Иванов','Иванович','9393699334',NULL,'ivanov@mail.ru',10,10),(11,'Иван','Иванов','Иванович','9393699334',NULL,'ivanov@mail.ru',11,11),(12,'Иван','Иванов','Иванович','9393699334',NULL,'ivanov@mail.ru',12,12);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_person`
--

DROP TABLE IF EXISTS `work_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_person` (
  `region_of_work` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name_organization` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `inn` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `position` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `work_start_date` date NOT NULL,
  `passport_person_person_person_id` int NOT NULL,
  `passport_person_person_application_parameters_application_id` int NOT NULL,
  `passport_person_person_passport_person_passport_person_id` int NOT NULL,
  PRIMARY KEY (`passport_person_person_person_id`,`passport_person_person_application_parameters_application_id`,`passport_person_person_passport_person_passport_person_id`),
  KEY `fk_work_person_passport_person1_idx` (`passport_person_person_person_id`,`passport_person_person_application_parameters_application_id`,`passport_person_person_passport_person_passport_person_id`),
  CONSTRAINT `fk_work_person_passport_person1` FOREIGN KEY (`passport_person_person_person_id`, `passport_person_person_application_parameters_application_id`, `passport_person_person_passport_person_passport_person_id`) REFERENCES `passport_person` (`person_person_id`, `person_application_parameters_application_id`, `person_passport_person_passport_person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_person`
--

LOCK TABLES `work_person` WRITE;
/*!40000 ALTER TABLE `work_person` DISABLE KEYS */;
INSERT INTO `work_person` VALUES ('Moscow','CinemaRoom','123456789012','Worker',35000.00,'2010-04-12',1,1,1),('Moscow','CinemaRoom','123456789012','Worker',35000.00,'2010-04-12',2,2,2),('Moscow','CinemaRoom','123456789012','Worker',35000.00,'2010-04-12',3,3,3),('Moscow','CinemaRoom','123456789012','Worker',35000.00,'2010-04-12',4,4,4),('Moscow','CinemaRoom','123456789012','Worker',35000.00,'2010-04-12',5,5,5),('Moscow','CinemaRoom','123456789012','Worker',35000.00,'2010-04-12',6,6,6),('Moscow','CinemaRoom','123456789012','Worker',35000.00,'2010-04-12',7,7,7),('Moscow','CinemaRoom','123456789012','Worker',35000.00,'2010-04-12',8,8,8),('Moscow','CinemaRoom','123456789012','Worker',35000.00,'2010-04-12',9,9,9),('Moscow','CinemaRoom','123456789012','Worker',35000.00,'2010-04-12',10,10,10),('Moscow','CinemaRoom','123456789012','Worker',35000.00,'2010-04-12',11,11,11),('Moscow','CinemaRoom','123456789012','Worker',35000.00,'2010-04-12',12,12,12);
/*!40000 ALTER TABLE `work_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'test_task'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-27  1:08:28
