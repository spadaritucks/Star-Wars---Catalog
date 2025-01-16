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
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mass` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hair_color` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skin_color` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eye_color` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeworld_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `characters_homeworld_id_foreign` (`homeworld_id`),
  CONSTRAINT `characters_homeworld_id_foreign` FOREIGN KEY (`homeworld_id`) REFERENCES `planets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'Luke Skywalker','172','77','blond','fair','blue','19BBY','male',1,'2025-01-14 15:49:36',NULL),(2,'C-3PO','167','75','n/a','gold','yellow','112BBY','n/a',1,'2025-01-14 15:49:36',NULL),(3,'R2-D2','96','32','n/a','white, blue','red','33BBY','n/a',8,'2025-01-14 15:49:36',NULL),(4,'Darth Vader','202','136','none','white','yellow','41.9BBY','male',1,'2025-01-14 15:49:36',NULL),(5,'Leia Organa','150','49','brown','light','brown','19BBY','female',2,'2025-01-14 15:49:36',NULL),(6,'Owen Lars','178','120','brown, grey','light','blue','52BBY','male',1,'2025-01-14 15:49:36',NULL),(7,'Beru Whitesun lars','165','75','brown','light','blue','47BBY','female',1,'2025-01-14 15:49:36',NULL),(8,'R5-D4','97','32','n/a','white, red','red','unknown','n/a',1,'2025-01-14 15:49:36',NULL),(9,'Biggs Darklighter','183','84','black','light','brown','24BBY','male',1,'2025-01-14 15:49:36',NULL),(10,'Obi-Wan Kenobi','182','77','auburn, white','fair','blue-gray','57BBY','male',20,'2025-01-14 15:49:36',NULL),(11,'Anakin Skywalker','188','84','blond','fair','blue','41.9BBY','male',1,'2025-01-14 15:49:37',NULL),(12,'Wilhuff Tarkin','180','unknown','auburn, grey','fair','blue','64BBY','male',21,'2025-01-14 15:49:37',NULL),(13,'Chewbacca','228','112','brown','unknown','blue','200BBY','male',14,'2025-01-14 15:49:37',NULL),(14,'Han Solo','180','80','brown','fair','brown','29BBY','male',22,'2025-01-14 15:49:37',NULL),(15,'Greedo','173','74','n/a','green','black','44BBY','male',23,'2025-01-14 15:49:37',NULL),(16,'Jabba Desilijic Tiure','175','1,358','n/a','green-tan, brown','orange','600BBY','hermaphrodite',24,'2025-01-14 15:49:37',NULL),(17,'Wedge Antilles','170','77','brown','fair','hazel','21BBY','male',22,'2025-01-14 15:49:37',NULL),(18,'Jek Tono Porkins','180','110','brown','fair','blue','unknown','male',26,'2025-01-14 15:49:37',NULL),(19,'Yoda','66','17','white','green','brown','896BBY','male',28,'2025-01-14 15:49:37',NULL),(20,'Palpatine','170','75','grey','pale','yellow','82BBY','male',8,'2025-01-14 15:49:37',NULL),(21,'Boba Fett','183','78.2','black','fair','brown','31.5BBY','male',10,'2025-01-14 15:49:37',NULL),(22,'IG-88','200','140','none','metal','red','15BBY','none',28,'2025-01-14 15:49:37',NULL),(23,'Bossk','190','113','none','green','red','53BBY','male',29,'2025-01-14 15:49:37',NULL),(24,'Lando Calrissian','177','79','black','dark','brown','31BBY','male',30,'2025-01-14 15:49:37',NULL),(25,'Lobot','175','79','none','light','blue','37BBY','male',6,'2025-01-14 15:49:37',NULL),(26,'Ackbar','180','83','none','brown mottle','orange','41BBY','male',31,'2025-01-14 15:49:37',NULL),(27,'Mon Mothma','150','unknown','auburn','fair','blue','48BBY','female',32,'2025-01-14 15:49:37',NULL),(28,'Arvel Crynyd','unknown','unknown','brown','fair','brown','unknown','male',28,'2025-01-14 15:49:37',NULL),(29,'Wicket Systri Warrick','88','20','brown','brown','brown','8BBY','male',7,'2025-01-14 15:49:37',NULL),(30,'Nien Nunb','160','68','none','grey','black','unknown','male',33,'2025-01-14 15:49:37',NULL),(31,'Qui-Gon Jinn','193','89','brown','fair','blue','92BBY','male',28,'2025-01-14 15:49:38',NULL),(32,'Nute Gunray','191','90','none','mottled green','red','unknown','male',18,'2025-01-14 15:49:38',NULL),(33,'Finis Valorum','170','unknown','blond','fair','blue','91BBY','male',9,'2025-01-14 15:49:38',NULL),(34,'Padmé Amidala','185','45','brown','light','brown','46BBY','female',8,'2025-01-14 15:49:38',NULL),(35,'Jar Jar Binks','196','66','none','orange','orange','52BBY','male',8,'2025-01-14 15:49:38',NULL),(36,'Roos Tarpals','224','82','none','grey','orange','unknown','male',8,'2025-01-14 15:49:38',NULL),(37,'Rugor Nass','206','unknown','none','green','orange','unknown','male',8,'2025-01-14 15:49:38',NULL),(38,'Ric Olié','183','unknown','brown','fair','blue','unknown','male',8,'2025-01-14 15:49:38',NULL),(39,'Watto','137','unknown','black','blue, grey','yellow','unknown','male',34,'2025-01-14 15:49:38',NULL),(40,'Sebulba','112','40','none','grey, red','orange','unknown','male',35,'2025-01-14 15:49:38',NULL),(41,'Quarsh Panaka','183','unknown','black','dark','brown','62BBY','male',8,'2025-01-14 15:49:38',NULL),(42,'Shmi Skywalker','163','unknown','black','fair','brown','72BBY','female',1,'2025-01-14 15:49:38',NULL),(43,'Darth Maul','175','80','none','red','yellow','54BBY','male',36,'2025-01-14 15:49:38',NULL),(44,'Bib Fortuna','180','unknown','none','pale','pink','unknown','male',37,'2025-01-14 15:49:38',NULL),(45,'Ayla Secura','178','55','none','blue','hazel','48BBY','female',37,'2025-01-14 15:49:38',NULL),(46,'Ratts Tyerel','79','15','none','grey, blue','unknown','unknown','male',38,'2025-01-14 15:49:38',NULL),(47,'Dud Bolt','94','45','none','blue, grey','yellow','unknown','male',39,'2025-01-14 15:49:38',NULL),(48,'Gasgano','122','unknown','none','white, blue','black','unknown','male',40,'2025-01-14 15:49:38',NULL),(49,'Ben Quadinaros','163','65','none','grey, green, yellow','orange','unknown','male',41,'2025-01-14 15:49:38',NULL),(50,'Mace Windu','188','84','none','dark','brown','72BBY','male',42,'2025-01-14 15:49:38',NULL),(51,'Ki-Adi-Mundi','198','82','white','pale','yellow','92BBY','male',43,'2025-01-14 15:49:39',NULL),(52,'Kit Fisto','196','87','none','green','black','unknown','male',44,'2025-01-14 15:49:39',NULL),(53,'Eeth Koth','171','unknown','black','brown','brown','unknown','male',45,'2025-01-14 15:49:39',NULL),(54,'Adi Gallia','184','50','none','dark','blue','unknown','female',9,'2025-01-14 15:49:39',NULL),(55,'Saesee Tiin','188','unknown','none','pale','orange','unknown','male',47,'2025-01-14 15:49:39',NULL),(56,'Yarael Poof','264','unknown','none','white','yellow','unknown','male',48,'2025-01-14 15:49:39',NULL),(57,'Plo Koon','188','80','none','orange','black','22BBY','male',49,'2025-01-14 15:49:39',NULL),(58,'Mas Amedda','196','unknown','none','blue','blue','unknown','male',50,'2025-01-14 15:49:39',NULL),(59,'Gregar Typho','185','85','black','dark','brown','unknown','male',8,'2025-01-14 15:49:39',NULL),(60,'Cordé','157','unknown','brown','light','brown','unknown','female',8,'2025-01-14 15:49:39',NULL),(61,'Cliegg Lars','183','unknown','brown','fair','blue','82BBY','male',1,'2025-01-14 15:49:39',NULL),(62,'Poggle the Lesser','183','80','none','green','yellow','unknown','male',11,'2025-01-14 15:49:39',NULL),(63,'Luminara Unduli','170','56.2','black','yellow','blue','58BBY','female',51,'2025-01-14 15:49:39',NULL),(64,'Barriss Offee','166','50','black','yellow','blue','40BBY','female',51,'2025-01-14 15:49:39',NULL),(65,'Dormé','165','unknown','brown','light','brown','unknown','female',8,'2025-01-14 15:49:39',NULL),(66,'Dooku','193','80','white','fair','brown','102BBY','male',52,'2025-01-14 15:49:39',NULL),(67,'Bail Prestor Organa','191','unknown','black','tan','brown','67BBY','male',2,'2025-01-14 15:49:39',NULL),(68,'Jango Fett','183','79','black','tan','brown','66BBY','male',53,'2025-01-14 15:49:39',NULL),(69,'Zam Wesell','168','55','blonde','fair, green, yellow','yellow','unknown','female',54,'2025-01-14 15:49:39',NULL),(70,'Dexter Jettster','198','102','none','brown','yellow','unknown','male',55,'2025-01-14 15:49:39',NULL),(71,'Lama Su','229','88','none','grey','black','unknown','male',10,'2025-01-14 15:49:40',NULL),(72,'Taun We','213','unknown','none','grey','black','unknown','female',10,'2025-01-14 15:49:40',NULL),(73,'Jocasta Nu','167','unknown','white','fair','blue','unknown','female',9,'2025-01-14 15:49:40',NULL),(74,'R4-P17','96','unknown','none','silver, red','red, blue','unknown','female',28,'2025-01-14 15:49:40',NULL),(75,'Wat Tambor','193','48','none','green, grey','unknown','unknown','male',56,'2025-01-14 15:49:40',NULL),(76,'San Hill','191','unknown','none','grey','gold','unknown','male',57,'2025-01-14 15:49:40',NULL),(77,'Shaak Ti','178','57','none','red, blue, white','black','unknown','female',58,'2025-01-14 15:49:40',NULL),(78,'Grievous','216','159','none','brown, white','green, yellow','unknown','male',59,'2025-01-14 15:49:40',NULL),(79,'Tarfful','234','136','brown','brown','blue','unknown','male',14,'2025-01-14 15:49:40',NULL),(80,'Raymus Antilles','188','79','brown','light','brown','unknown','male',2,'2025-01-14 15:49:40',NULL),(81,'Sly Moore','178','48','none','pale','white','unknown','female',60,'2025-01-14 15:49:40',NULL),(82,'Tion Medon','206','80','none','grey','black','unknown','male',12,'2025-01-14 15:49:40',NULL);
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
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
