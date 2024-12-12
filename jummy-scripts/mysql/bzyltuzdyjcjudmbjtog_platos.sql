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
a38a16d0-767a-11eb-abe2-cecd029e558e:1-496213989';

--
-- Table structure for table `platos`
--

DROP TABLE IF EXISTS `platos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(120) NOT NULL,
  `ingredientes` varchar(120) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `foto` longblob,
  `id_tipo_plato` int NOT NULL,
  `id_restaurante` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `id_tipo_plato_idx` (`id_tipo_plato`),
  KEY `id_restaurante_idx` (`id_restaurante`),
  CONSTRAINT `id_restaurante` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurantes` (`id`),
  CONSTRAINT `id_tipo_plato` FOREIGN KEY (`id_tipo_plato`) REFERENCES `tipo_platos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platos`
--

LOCK TABLES `platos` WRITE;
/*!40000 ALTER TABLE `platos` DISABLE KEYS */;
INSERT INTO `platos` VALUES (14,'Edamame','Judías de soja hervidas y saladas.','Edamame, sal',4,NULL,1,46),(15,'Sashimi de Salmón','Finas lonchas de salmón fresco.','Salmón fresco',12,NULL,2,46),(16,'Matcha Cheesecake','Pastel de queso con té verde matcha.','Queso crema, matcha, galleta',7,NULL,3,46),(17,'Té Verde','Té verde japonés.','Té verde, agua caliente',3,NULL,4,46),(18,'Gyozas','Empanadillas japonesas rellenas de cerdo.','Harina, carne de cerdo, col, ajo',6,NULL,1,47),(19,'Ramen de Cerdo','Sopa japonesa con fideos y cerdo.','Fideos, caldo de cerdo, huevo',11,NULL,2,47),(20,'Mochi','Postre japonés de arroz glutinoso relleno.','Harina de arroz, azúcar, pasta de frijol rojo',4,NULL,3,47),(21,'Sake','Bebida alcohólica de arroz.','Arroz, agua',8,NULL,4,47),(22,'Bruschetta','Pan tostado con tomate y albahaca.','Pan, tomate, ajo, albahaca',6,NULL,1,51),(23,'Tagliatelle Bolognese','Pasta con salsa boloñesa.','Tagliatelle, carne, tomate, especias',14,NULL,2,51),(24,'Tiramisú','Postre italiano con café y mascarpone.','Mascarpone, bizcochos, café, cacao',7,NULL,3,51),(25,'Vino Chianti','Vino tinto italiano.','Uvas',15,NULL,4,51),(26,'Caprese','Ensalada de tomate, mozzarella y albahaca.','Tomate, mozzarella, albahaca, aceite',7,NULL,1,52),(27,'Pizza Margarita','Pizza clásica italiana con tomate y albahaca.','Masa, tomate, mozzarella, albahaca',9,NULL,2,52),(28,'Cannoli','Postre crujiente relleno de ricotta.','Ricotta, harina, azúcar',5,NULL,3,52),(29,'Limoncello','Licor de limón italiano.','Limones, alcohol, azúcar',5,NULL,4,52),(30,'Tortilla Española','Tortilla de patata tradicional.','Patatas, huevo, cebolla',6,NULL,1,56),(31,'Paella Valenciana','Arroz con mariscos y pollo.','Arroz, pollo, mariscos, azafrán',14,NULL,2,56),(32,'Churros con Chocolate','Churros fritos con chocolate caliente.','Harina, agua, azúcar, chocolate',6,NULL,3,56),(33,'Sangría','Bebida española con vino y frutas.','Vino, frutas, azúcar',7,NULL,4,56),(34,'Patatas Bravas','Patatas fritas con salsa picante.','Patatas, tomate, especias',6,NULL,1,57),(35,'Cochinillo Asado','Cerdo asado típico de Segovia.','Cerdo, sal, especias',18,NULL,2,57),(36,'Tarta de Santiago','Tarta de almendra tradicional.','Almendra, azúcar, huevo',6,NULL,3,57),(37,'Cerveza Artesanal','Cerveza elaborada localmente.','Malta, lúpulo, agua',5,NULL,4,57),(38,'Tequeños','Palitos de masa rellenos de queso, fritos.','Masa, queso',10,NULL,1,61),(39,'Arepa Reina Pepiada','Arepa rellena de pollo y aguacate.','Arepa, pollo, aguacate',8,NULL,2,61),(40,'Quesillo','Flan venezolano de leche condensada.','Leche condensada, huevos, azúcar',6,NULL,3,61),(41,'Guarapita','Bebida alcohólica con jugo de frutas y ron.','Jugo de frutas, ron',6,NULL,4,61),(42,'Empanadas de Pabellón','Empanadas rellenas de carne, caraotas y plátano.','Masa, carne, caraotas, plátano',6,NULL,1,62),(43,'Arepa Pelúa','Arepa rellena de carne mechada y queso.','Arepa, carne mechada, queso',8,NULL,2,62),(44,'Torta de Casabe','Tarta hecha con casabe, acompañada de miel de panela.','Casabe, miel, panela',4,NULL,3,62),(45,'Café con Leche','Bebida venezolana con café y leche.','Café, leche, azúcar',3,NULL,4,62),(46,'Guacamole con Totopos','Aguacate triturado con especias acompañado de totopos.','Aguacate, cebolla, tomate, cilantro',6,NULL,1,66),(47,'Tacos al Pastor','Tacos con carne de cerdo marinada y piña.','Carne de cerdo, piña, cebolla, tortillas',9,NULL,2,66),(48,'Churros con Cajeta','Churros con un dulce de leche caramelizado.','Harina, azúcar, leche, cajeta',6,NULL,3,66),(49,'Margarita','Cóctel a base de tequila, limón y sal.','Tequila, limón, sal',8,NULL,4,66),(50,'Sopes','Bocadillos de masa con carne, frijoles y salsa.','Masa, carne, frijoles, salsa',6,NULL,1,67),(51,'Enchiladas Verdes','Tortillas rellenas de pollo bañadas en salsa verde.','Pollo, tortilla, salsa verde, crema',11,NULL,2,67),(52,'Flan Mexicano','Flan cremoso con caramelo.','Leche, huevo, azúcar, vainilla',5,NULL,3,67),(53,'Tequila Sunrise','Cóctel con tequila, naranja y granadina.','Tequila, jugo de naranja, granadina',8,NULL,4,67),(54,'Samosas Tailandesas','Empanadas rellenas de verduras y especias.','Masa, verduras, especias',4,NULL,1,71),(55,'Pad Thai','Fideos de arroz con camarones, huevo y cacahuetes.','Fideos de arroz, camarones, huevo, cacahuetes',10,NULL,2,71),(56,'Mango Sticky Rice','Postre tailandés con arroz y mango.','Arroz glutinoso, mango, leche de coco',7,NULL,3,71),(57,'Té Thai','Té tailandés con leche y azúcar.','Té, leche condensada, azúcar',4,NULL,4,71),(58,'Satay de Pollo','Brochetas de pollo marinadas en salsa de cacahuete.','Pollo, salsa de cacahuete, especias',6,NULL,1,72),(59,'Tom Yum','Sopa tailandesa picante con camarones.','Camarones, hierba de limón, chile, caldo',9,NULL,2,72),(60,'Sticky Rice con Durian','Postre de arroz glutinoso con durian.','Arroz glutinoso, durian, leche de coco',7,NULL,3,72),(61,'Thai Iced Tea','Té helado tailandés con leche condensada.','Té, leche condensada, hielo',5,NULL,4,72),(63,'Sushi Rollss','Sushi con aguacate, pepino y salmón fresco','Aguacate, pepino, arroz, salmón, alga nori',13,NULL,2,46),(67,'Pabellon Criollo','Arroz con fríjoles negros, platano frito y carne guisada','Arroz, carne, platano, frijoles negros',12,NULL,2,61),(71,'Empanada de pollo','Empanadas de pollo','Harina de maiz, pollo',7,NULL,2,61),(72,'Mini empanadas','Harina de maiz, pollo','Harina de maiz, pollo',7,NULL,1,61);
/*!40000 ALTER TABLE `platos` ENABLE KEYS */;
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

-- Dump completed on 2024-12-12  1:22:06
