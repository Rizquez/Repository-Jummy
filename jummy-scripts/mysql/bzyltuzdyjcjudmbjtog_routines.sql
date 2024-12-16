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
a38a16d0-767a-11eb-abe2-cecd029e558e:1-496213997';

--
-- Temporary view structure for view `v_usuarios`
--

DROP TABLE IF EXISTS `v_usuarios`;
/*!50001 DROP VIEW IF EXISTS `v_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_usuarios` AS SELECT 
 1 AS `id`,
 1 AS `user`,
 1 AS `email`,
 1 AS `password`,
 1 AS `telefono`,
 1 AS `tipo_usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_menus`
--

DROP TABLE IF EXISTS `v_menus`;
/*!50001 DROP VIEW IF EXISTS `v_menus`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_menus` AS SELECT 
 1 AS `nombre_comercial`,
 1 AS `nombre`,
 1 AS `descripcion`,
 1 AS `ingredientes`,
 1 AS `precio`,
 1 AS `tipo_plato`,
 1 AS `foto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_restaurantes_gastronomias`
--

DROP TABLE IF EXISTS `v_restaurantes_gastronomias`;
/*!50001 DROP VIEW IF EXISTS `v_restaurantes_gastronomias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_restaurantes_gastronomias` AS SELECT 
 1 AS `nombre_comercial`,
 1 AS `descripcion`,
 1 AS `gastronomia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_detalles_pedidos`
--

DROP TABLE IF EXISTS `v_detalles_pedidos`;
/*!50001 DROP VIEW IF EXISTS `v_detalles_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_detalles_pedidos` AS SELECT 
 1 AS `id_pedidos`,
 1 AS `nombre_plato`,
 1 AS `email_comensal`,
 1 AS `estado`,
 1 AS `nombre_comercial`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `v_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ux8wb0ozdtkvd3io`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_usuarios` AS select `comensales`.`id` AS `id`,regexp_replace(`comensales`.`nombre`,'[^A-Za-z0-9]','') AS `user`,`comensales`.`email` AS `email`,`comensales`.`password` AS `password`,`comensales`.`telefono` AS `telefono`,'comensal' AS `tipo_usuario` from `comensales` union all select `restaurantes`.`id` AS `id`,regexp_replace(`restaurantes`.`cif`,'[^A-Za-z0-9]','') AS `user`,`restaurantes`.`email` AS `email`,`restaurantes`.`password` AS `password`,`restaurantes`.`telefono` AS `telefono`,'restaurante' AS `tipo_usuario` from `restaurantes` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_menus`
--

/*!50001 DROP VIEW IF EXISTS `v_menus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ux8wb0ozdtkvd3io`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_menus` AS select `r`.`nombre_comercial` AS `nombre_comercial`,`p`.`nombre` AS `nombre`,`p`.`descripcion` AS `descripcion`,`p`.`ingredientes` AS `ingredientes`,`p`.`precio` AS `precio`,`tp`.`tipo_plato` AS `tipo_plato`,`p`.`foto` AS `foto` from ((`platos` `p` join `restaurantes` `r` on((`p`.`id_restaurante` = `r`.`id`))) join `tipo_platos` `tp` on((`p`.`id_tipo_plato` = `tp`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_restaurantes_gastronomias`
--

/*!50001 DROP VIEW IF EXISTS `v_restaurantes_gastronomias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ux8wb0ozdtkvd3io`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_restaurantes_gastronomias` AS select `r`.`nombre_comercial` AS `nombre_comercial`,`r`.`descripcion` AS `descripcion`,`g`.`gastronomia` AS `gastronomia` from (`restaurantes` `r` join `gastronomias` `g` on((`r`.`id_gastronomia` = `g`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_detalles_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `v_detalles_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ux8wb0ozdtkvd3io`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_detalles_pedidos` AS select `dp`.`id_pedidos` AS `id_pedidos`,`p`.`nombre` AS `nombre_plato`,`c`.`email` AS `email_comensal`,`ped`.`estado` AS `estado`,`r`.`nombre_comercial` AS `nombre_comercial`,`ped`.`fecha` AS `fecha` from ((((`detalles_pedido` `dp` join `platos` `p` on((`dp`.`id_platos` = `p`.`id`))) join `pedidos` `ped` on((`dp`.`id_pedidos` = `ped`.`id`))) join `comensales` `c` on((`ped`.`id_comensales` = `c`.`id`))) join `restaurantes` `r` on((`r`.`id` = `p`.`id_restaurante`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-12  1:22:11
