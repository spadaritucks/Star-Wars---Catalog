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
-- Table structure for table `planets`
--

DROP TABLE IF EXISTS `planets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rotation_period` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orbital_period` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diameter` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `climate` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gravity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `terrain` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surface_water` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `population` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planets`
--

LOCK TABLES `planets` WRITE;
/*!40000 ALTER TABLE `planets` DISABLE KEYS */;
INSERT INTO `planets` VALUES (1,'Tatooine','23','304','10465','arid','1 standard','desert','200000','1','2025-01-14 03:01:28',NULL),(2,'Alderaan','24','364','12500','temperate','1 standard','grasslands, mountains','2000000000','40','2025-01-14 03:01:28',NULL),(3,'Yavin IV','24','4818','10200','temperate, tropical','1 standard','jungle, rainforests','1000','8','2025-01-14 03:01:28',NULL),(4,'Hoth','23','549','7200','frozen','1.1 standard','tundra, ice caves, mountain ranges','unknown','100','2025-01-14 03:01:28',NULL),(5,'Dagobah','23','341','8900','murky','N/A','swamp, jungles','unknown','8','2025-01-14 03:01:28',NULL),(6,'Bespin','12','5110','118000','temperate','1.5 (surface), 1 standard (Cloud City)','gas giant','6000000','0','2025-01-14 03:01:28',NULL),(7,'Endor','18','402','4900','temperate','0.85 standard','forests, mountains, lakes','30000000','8','2025-01-14 03:01:28',NULL),(8,'Naboo','26','312','12120','temperate','1 standard','grassy hills, swamps, forests, mountains','4500000000','12','2025-01-14 03:01:28',NULL),(9,'Coruscant','24','368','12240','temperate','1 standard','cityscape, mountains','1000000000000','unknown','2025-01-14 03:01:28',NULL),(10,'Kamino','27','463','19720','temperate','1 standard','ocean','1000000000','100','2025-01-14 03:01:28',NULL),(11,'Geonosis','30','256','11370','temperate, arid','0.9 standard','rock, desert, mountain, barren','100000000000','5','2025-01-14 03:01:28',NULL),(12,'Utapau','27','351','12900','temperate, arid, windy','1 standard','scrublands, savanna, canyons, sinkholes','95000000','0.9','2025-01-14 03:01:28',NULL),(13,'Mustafar','36','412','4200','hot','1 standard','volcanoes, lava rivers, mountains, caves','20000','0','2025-01-14 03:01:28',NULL),(14,'Kashyyyk','26','381','12765','tropical','1 standard','jungle, forests, lakes, rivers','45000000','60','2025-01-14 03:01:28',NULL),(15,'Polis Massa','24','590','0','artificial temperate ','0.56 standard','airless asteroid','1000000','0','2025-01-14 03:01:28',NULL),(16,'Mygeeto','12','167','10088','frigid','1 standard','glaciers, mountains, ice canyons','19000000','unknown','2025-01-14 03:01:28',NULL),(17,'Felucia','34','231','9100','hot, humid','0.75 standard','fungus forests','8500000','unknown','2025-01-14 03:01:28',NULL),(18,'Cato Neimoidia','25','278','0','temperate, moist','1 standard','mountains, fields, forests, rock arches','10000000','unknown','2025-01-14 03:01:28',NULL),(19,'Saleucami','26','392','14920','hot','unknown','caves, desert, mountains, volcanoes','1400000000','unknown','2025-01-14 03:01:28',NULL),(20,'Stewjon','unknown','unknown','0','temperate','1 standard','grass','unknown','unknown','2025-01-14 03:01:28',NULL),(21,'Eriadu','24','360','13490','polluted','1 standard','cityscape','22000000000','unknown','2025-01-14 03:01:28',NULL),(22,'Corellia','25','329','11000','temperate','1 standard','plains, urban, hills, forests','3000000000','70','2025-01-14 03:01:28',NULL),(23,'Rodia','29','305','7549','hot','1 standard','jungles, oceans, urban, swamps','1300000000','60','2025-01-14 03:01:28',NULL),(24,'Nal Hutta','87','413','12150','temperate','1 standard','urban, oceans, swamps, bogs','7000000000','unknown','2025-01-14 03:01:28',NULL),(25,'Dantooine','25','378','9830','temperate','1 standard','oceans, savannas, mountains, grasslands','1000','unknown','2025-01-14 03:01:28',NULL),(26,'Bestine IV','26','680','6400','temperate','unknown','rocky islands, oceans','62000000','98','2025-01-14 03:01:28',NULL),(27,'Ord Mantell','26','334','14050','temperate','1 standard','plains, seas, mesas','4000000000','10','2025-01-14 03:01:28',NULL),(28,'unknown','0','0','0','unknown','unknown','unknown','unknown','unknown','2025-01-14 03:01:28',NULL),(29,'Trandosha','25','371','0','arid','0.62 standard','mountains, seas, grasslands, deserts','42000000','unknown','2025-01-14 03:01:28',NULL),(30,'Socorro','20','326','0','arid','1 standard','deserts, mountains','300000000','unknown','2025-01-14 03:01:28',NULL),(31,'Mon Cala','21','398','11030','temperate','1','oceans, reefs, islands','27000000000','100','2025-01-14 03:01:29',NULL),(32,'Chandrila','20','368','13500','temperate','1','plains, forests','1200000000','40','2025-01-14 03:01:29',NULL),(33,'Sullust','20','263','12780','superheated','1','mountains, volcanoes, rocky deserts','18500000000','5','2025-01-14 03:01:29',NULL),(34,'Toydaria','21','184','7900','temperate','1','swamps, lakes','11000000','unknown','2025-01-14 03:01:29',NULL),(35,'Malastare','26','201','18880','arid, temperate, tropical','1.56','swamps, deserts, jungles, mountains','2000000000','unknown','2025-01-14 03:01:29',NULL),(36,'Dathomir','24','491','10480','temperate','0.9','forests, deserts, savannas','5200','unknown','2025-01-14 03:01:29',NULL),(37,'Ryloth','30','305','10600','temperate, arid, subartic','1','mountains, valleys, deserts, tundra','1500000000','5','2025-01-14 03:01:29',NULL),(38,'Aleen Minor','unknown','unknown','unknown','unknown','unknown','unknown','unknown','unknown','2025-01-14 03:01:29',NULL),(39,'Vulpter','22','391','14900','temperate, artic','1','urban, barren','421000000','unknown','2025-01-14 03:01:29',NULL),(40,'Troiken','unknown','unknown','unknown','unknown','unknown','desert, tundra, rainforests, mountains','unknown','unknown','2025-01-14 03:01:29',NULL),(41,'Tund','48','1770','12190','unknown','unknown','barren, ash','0','unknown','2025-01-14 03:01:29',NULL),(42,'Haruun Kal','25','383','10120','temperate','0.98','toxic cloudsea, plateaus, volcanoes','705300','unknown','2025-01-14 03:01:29',NULL),(43,'Cerea','27','386','unknown','temperate','1','verdant','450000000','20','2025-01-14 03:01:29',NULL),(44,'Glee Anselm','33','206','15600','tropical, temperate','1','lakes, islands, swamps, seas','500000000','80','2025-01-14 03:01:29',NULL),(45,'Iridonia','29','413','unknown','unknown','unknown','rocky canyons, acid pools','unknown','unknown','2025-01-14 03:01:29',NULL),(46,'Tholoth','unknown','unknown','unknown','unknown','unknown','unknown','unknown','unknown','2025-01-14 03:01:29',NULL),(47,'Iktotch','22','481','unknown','arid, rocky, windy','1','rocky','unknown','unknown','2025-01-14 03:01:29',NULL),(48,'Quermia','unknown','unknown','unknown','unknown','unknown','unknown','unknown','unknown','2025-01-14 03:01:29',NULL),(49,'Dorin','22','409','13400','temperate','1','unknown','unknown','unknown','2025-01-14 03:01:29',NULL),(50,'Champala','27','318','unknown','temperate','1','oceans, rainforests, plateaus','3500000000','unknown','2025-01-14 03:01:29',NULL),(51,'Mirial','unknown','unknown','unknown','unknown','unknown','deserts','unknown','unknown','2025-01-14 03:01:29',NULL),(52,'Serenno','unknown','unknown','unknown','unknown','unknown','rainforests, rivers, mountains','unknown','unknown','2025-01-14 03:01:29',NULL),(53,'Concord Dawn','unknown','unknown','unknown','unknown','unknown','jungles, forests, deserts','unknown','unknown','2025-01-14 03:01:29',NULL),(54,'Zolan','unknown','unknown','unknown','unknown','unknown','unknown','unknown','unknown','2025-01-14 03:01:29',NULL),(55,'Ojom','unknown','unknown','unknown','frigid','unknown','oceans, glaciers','500000000','100','2025-01-14 03:01:29',NULL),(56,'Skako','27','384','unknown','temperate','1','urban, vines','500000000000','unknown','2025-01-14 03:01:29',NULL),(57,'Muunilinst','28','412','13800','temperate','1','plains, forests, hills, mountains','5000000000','25','2025-01-14 03:01:29',NULL),(58,'Shili','unknown','unknown','unknown','temperate','1','cities, savannahs, seas, plains','unknown','unknown','2025-01-14 03:01:29',NULL),(59,'Kalee','23','378','13850','arid, temperate, tropical','1','rainforests, cliffs, canyons, seas','4000000000','unknown','2025-01-14 03:01:29',NULL),(60,'Umbara','unknown','unknown','unknown','unknown','unknown','unknown','unknown','unknown','2025-01-14 03:01:29',NULL);
/*!40000 ALTER TABLE `planets` ENABLE KEYS */;
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
