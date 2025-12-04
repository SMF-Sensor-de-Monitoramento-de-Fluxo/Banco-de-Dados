CREATE DATABASE  IF NOT EXISTS `smf` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `smf`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: smf
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.22.04.1

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
-- Temporary view structure for view `totalclientes_vw`
--

DROP TABLE IF EXISTS `totalclientes_vw`;
/*!50001 DROP VIEW IF EXISTS `totalclientes_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `totalclientes_vw` AS SELECT 
 1 AS `total de Clientes na Ultima Hora`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `clienteporhora_vw`
--

DROP TABLE IF EXISTS `clienteporhora_vw`;
/*!50001 DROP VIEW IF EXISTS `clienteporhora_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clienteporhora_vw` AS SELECT 
 1 AS `hora`,
 1 AS `totalClientes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `menorfluxo_vw`
--

DROP TABLE IF EXISTS `menorfluxo_vw`;
/*!50001 DROP VIEW IF EXISTS `menorfluxo_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `menorfluxo_vw` AS SELECT 
 1 AS `corredor`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `clienteporhoranodia_vw`
--

DROP TABLE IF EXISTS `clienteporhoranodia_vw`;
/*!50001 DROP VIEW IF EXISTS `clienteporhoranodia_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clienteporhoranodia_vw` AS SELECT 
 1 AS `hora`,
 1 AS `totalClientes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `maiorfluxo_vw`
--

DROP TABLE IF EXISTS `maiorfluxo_vw`;
/*!50001 DROP VIEW IF EXISTS `maiorfluxo_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `maiorfluxo_vw` AS SELECT 
 1 AS `Corredor`,
 1 AS `Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `clienteporcorredor_vw`
--

DROP TABLE IF EXISTS `clienteporcorredor_vw`;
/*!50001 DROP VIEW IF EXISTS `clienteporcorredor_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clienteporcorredor_vw` AS SELECT 
 1 AS `corredor`,
 1 AS `totalClientes`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `totalclientes_vw`
--

/*!50001 DROP VIEW IF EXISTS `totalclientes_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aluno`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `totalclientes_vw` AS select sum(`SensorLeitura`.`leitura`) AS `total de Clientes na Ultima Hora` from `SensorLeitura` where (`SensorLeitura`.`dataLeitura` >= (now() - interval 1 hour)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `clienteporhora_vw`
--

/*!50001 DROP VIEW IF EXISTS `clienteporhora_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aluno`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `clienteporhora_vw` AS select hour(`sl`.`dataLeitura`) AS `hora`,sum(`sl`.`leitura`) AS `totalClientes` from `SensorLeitura` `sl` group by `hora` order by `hora` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `menorfluxo_vw`
--

/*!50001 DROP VIEW IF EXISTS `menorfluxo_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aluno`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `menorfluxo_vw` AS select `s`.`idSensor` AS `corredor`,sum(`sl`.`leitura`) AS `total` from (`SensorLeitura` `sl` join `Sensor` `s` on((`sl`.`fkSensor` = `s`.`idSensor`))) where (`sl`.`dataLeitura` >= (now() - interval 1 hour)) group by `s`.`idSensor` order by `total` limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `clienteporhoranodia_vw`
--

/*!50001 DROP VIEW IF EXISTS `clienteporhoranodia_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aluno`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `clienteporhoranodia_vw` AS select hour(`sl`.`dataLeitura`) AS `hora`,sum(`sl`.`leitura`) AS `totalClientes` from `SensorLeitura` `sl` where (cast(`sl`.`dataLeitura` as date) = curdate()) group by `hora` order by `hora` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maiorfluxo_vw`
--

/*!50001 DROP VIEW IF EXISTS `maiorfluxo_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aluno`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `maiorfluxo_vw` AS select `s`.`idSensor` AS `Corredor`,sum(`sl`.`leitura`) AS `Total` from (`SensorLeitura` `sl` join `Sensor` `s` on((`sl`.`fkSensor` = `s`.`idSensor`))) where (`sl`.`dataLeitura` >= (now() - interval 1 hour)) group by `s`.`idSensor` order by `Total` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `clienteporcorredor_vw`
--

/*!50001 DROP VIEW IF EXISTS `clienteporcorredor_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`aluno`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `clienteporcorredor_vw` AS select `s`.`idSensor` AS `corredor`,sum(`sl`.`leitura`) AS `totalClientes` from (`SensorLeitura` `sl` join `Sensor` `s` on((`sl`.`fkSensor` = `s`.`idSensor`))) where (`sl`.`dataLeitura` >= (now() - interval 1 hour)) group by `s`.`idSensor` order by `s`.`idSensor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'smf'
--

--
-- Dumping routines for database 'smf'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-04 11:19:53
