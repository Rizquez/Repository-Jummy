-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: bzyltuzdyjcjudmbjtog-mysql.services.clever-cloud.com    Database: bzyltuzdyjcjudmbjtog
-- ------------------------------------------------------
-- Server version	8.0.22-13

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'a05a675a-1414-11e9-9c82-cecd01b08c7e:1-491550428,
a38a16d0-767a-11eb-abe2-cecd029e558e:1-496213996';

--
-- Table structure for table `restaurantes`
--

DROP TABLE IF EXISTS `restaurantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cif` varchar(20) NOT NULL,
  `nombre_fiscal` varchar(50) NOT NULL,
  `direccion_fiscal` varchar(50) NOT NULL,
  `localidad` varchar(50) NOT NULL,
  `cp` int NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nombre_comercial` varchar(50) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `logo` longblob,
  `password` varchar(20) NOT NULL,
  `id_gastronomia` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `id_gastronomia_idx` (`id_gastronomia`),
  CONSTRAINT `id_gastronomia` FOREIGN KEY (`id_gastronomia`) REFERENCES `gastronomias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantes`
--

LOCK TABLES `restaurantes` WRITE;
/*!40000 ALTER TABLE `restaurantes` DISABLE KEYS */;
INSERT INTO `restaurantes` VALUES 
(46,'CIFJAP001','Restaurante Japonés 1 S.L.','Calle Falsa 123, Ciudad A','Ciudad A',10001,'+34633504225','japones1@correo.com','Sushi A','El mejor sushi de la ciudad.',NULL,'password123',3),
(47,'CIFJAP002','Restaurante Japonés 2 S.L.','Avenida Siempre Viva 742, Ciudad B','Ciudad B',10002,'+34633504225','japones2@correo.com','Sushi B','Auténtica comida japonesa.',NULL,'password123',3),
(51,'CIFITA001','Restaurante Italiano 1 S.L.','Calle Falsa 123, Ciudad A','Ciudad A',10001,'+34633504225','italiano1@correo.com','Pasta A','La mejor pasta de la ciudad.',NULL,'password123',4),
(52,'CIFITA002','Restaurante Italiano 2 S.L.','Avenida Siempre Viva 742, Ciudad B','Ciudad B',10002,'+34633504225','italiano2@correo.com','Pasta B','Auténtica comida italiana.',NULL,'password123',4),
(56,'CIFESP001','Restaurante Español 1 S.L.','Calle Falsa 123, Ciudad A','Ciudad A',10001,'+34633504225','espanol1@correo.com','Tapas A','Las mejores tapas de la ciudad.',NULL,'password123',5),
(57,'CIFESP002','Restaurante Español 2 S.L.','Avenida Siempre Viva 742, Ciudad B','Ciudad B',10002,'+34633504225','espanol2@correo.com','Tapas B','Auténtica comida española.',NULL,'password123',5),
(61,'CIFVEN001','Restaurante Venezolano 1 S.L.','Calle Falsa 123, Ciudad A','Ciudad A',10001,'+34633504225','venezolano1@correo.com','Arepas A','Las mejores arepas de la ciudad.',NULL,'password123',6),
(62,'CIFVEN002','Restaurante Venezolano 2 S.L.','Avenida Siempre Viva 742, Ciudad B','Ciudad B',10002,'+34633504225','venezolano2@correo.com','Arepas B','Auténtica comida venezolana.',NULL,'password123',6),
(66,'CIFMEX001','Restaurante Mexicano 1 S.L.','Calle Falsa 123, Ciudad A','Ciudad A',10001,'+34633504225','mexicano1@correo.com','Tacos A','Los mejores tacos de la ciudad.',NULL,'password123',7),
(67,'CIFMEX002','Restaurante Mexicano 2 S.L.','Avenida Siempre Viva 742, Ciudad B','Ciudad B',10002,'+34633504225','mexicano2@correo.com','Tacos B','Auténtica comida mexicana.',NULL,'password123',7),
(71,'CIFTHAI001','Restaurante Tailandés 1 S.L.','Calle Falsa 123, Ciudad A','Ciudad A',10001,'+34633504225','tailandes1@correo.com','Thai A','La mejor comida tailandesa de la ciudad.',NULL,'password123',8),
(72,'CIFTHAI002','Restaurante Tailandés 2 S.L.','Avenida Siempre Viva 742, Ciudad B','Ciudad B',10002,'+34633504225','tailandes2@correo.com','Thai B','Auténtica comida tailandesa.',NULL,'password123',8);
/*!40000 ALTER TABLE `restaurantes` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-12  1:22:09
