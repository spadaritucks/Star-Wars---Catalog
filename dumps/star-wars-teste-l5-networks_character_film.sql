-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: star-wars-teste-l5-networks
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `character_film`
--

DROP TABLE IF EXISTS `character_film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_film` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `character_id` bigint unsigned NOT NULL,
  `film_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `character_film_character_id_foreign` (`character_id`),
  KEY `character_film_film_id_foreign` (`film_id`),
  CONSTRAINT `character_film_character_id_foreign` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `character_film_film_id_foreign` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_film`
--

LOCK TABLES `character_film` WRITE;
/*!40000 ALTER TABLE `character_film` DISABLE KEYS */;
INSERT INTO `character_film` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,12,1),(12,13,1),(13,14,1),(14,15,1),(15,16,1),(16,18,1),(17,19,1),(18,81,1),(19,1,2),(20,2,2),(21,3,2),(22,4,2),(23,5,2),(24,10,2),(25,13,2),(26,14,2),(27,18,2),(28,20,2),(29,21,2),(30,22,2),(31,23,2),(32,24,2),(33,25,2),(34,26,2),(35,1,3),(36,2,3),(37,3,3),(38,4,3),(39,5,3),(40,10,3),(41,13,3),(42,14,3),(43,16,3),(44,18,3),(45,20,3),(46,21,3),(47,22,3),(48,25,3),(49,27,3),(50,28,3),(51,29,3),(52,30,3),(53,31,3),(54,45,3),(55,2,4),(56,3,4),(57,10,4),(58,11,4),(59,16,4),(60,20,4),(61,21,4),(62,32,4),(63,33,4),(64,34,4),(65,35,4),(66,36,4),(67,37,4),(68,38,4),(69,39,4),(70,40,4),(71,41,4),(72,42,4),(73,43,4),(74,44,4),(75,46,4),(76,47,4),(77,48,4),(78,49,4),(79,50,4),(80,51,4),(81,52,4),(82,53,4),(83,54,4),(84,55,4),(85,56,4),(86,57,4),(87,58,4),(88,59,4),(89,2,5),(90,3,5),(91,6,5),(92,7,5),(93,10,5),(94,11,5),(95,20,5),(96,21,5),(97,22,5),(98,33,5),(99,35,5),(100,36,5),(101,40,5),(102,43,5),(103,46,5),(104,51,5),(105,52,5),(106,53,5),(107,58,5),(108,59,5),(109,60,5),(110,61,5),(111,62,5),(112,63,5),(113,64,5),(114,65,5),(115,66,5),(116,67,5),(117,68,5),(118,69,5),(119,70,5),(120,71,5),(121,72,5),(122,73,5),(123,74,5),(124,75,5),(125,76,5),(126,77,5),(127,78,5),(128,82,5),(129,1,6),(130,2,6),(131,3,6),(132,4,6),(133,5,6),(134,6,6),(135,7,6),(136,10,6),(137,11,6),(138,12,6),(139,13,6),(140,20,6),(141,21,6),(142,33,6),(143,35,6),(144,46,6),(145,51,6),(146,52,6),(147,53,6),(148,54,6),(149,55,6),(150,56,6),(151,58,6),(152,63,6),(153,64,6),(154,67,6),(155,68,6),(156,75,6),(157,78,6),(158,79,6),(159,80,6),(160,81,6),(161,82,6);
/*!40000 ALTER TABLE `character_film` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-16  1:01:01
