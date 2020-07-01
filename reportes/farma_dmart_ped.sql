-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: farma_dmart_ped
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
-- Table structure for table `dcliente`
--

DROP TABLE IF EXISTS `dcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcliente` (
  `DCli_id` int NOT NULL AUTO_INCREMENT,
  `Nom_cli` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`DCli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcliente`
--

LOCK TABLES `dcliente` WRITE;
/*!40000 ALTER TABLE `dcliente` DISABLE KEYS */;
INSERT INTO `dcliente` VALUES (1,'UPeU'),(2,'San Martín');
/*!40000 ALTER TABLE `dcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dproducto`
--

DROP TABLE IF EXISTS `dproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dproducto` (
  `DProd_id` int NOT NULL AUTO_INCREMENT,
  `Cod_prod` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Nom_prod` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Prec_compra` decimal(9,2) DEFAULT NULL,
  `Prec_venta` decimal(9,2) DEFAULT NULL,
  `Nom_cat` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Nom_fam` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`DProd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dproducto`
--

LOCK TABLES `dproducto` WRITE;
/*!40000 ALTER TABLE `dproducto` DISABLE KEYS */;
INSERT INTO `dproducto` VALUES (1,'3','A FOLIC 0.5 mg Caja Envase Blister Tabletas frac30',8.00,15.00,'Tableta','TABLETA'),(2,'95','ACICLOVIR 200 mg Caja Envase Blister Tabletas frac100',6.00,13.00,'Tableta','TABLETA'),(3,'96','ACICLOVIR 400 mg Caja Envase Blister Tabletas frac100',8.00,14.00,'Tableta','TABLETA'),(4,'102','ACICLOVIR 200 mg Caja Envase Blister Tabletas frac100',11.00,18.00,'Tableta','TABLETA'),(5,'108','ACICLOVIR 800 mg Caja Envase Blister Tabletas frac10',14.00,23.00,'Tableta','TABLETA'),(6,'138','ACIDO FOLICO 0.5 mg Caja Envase Blister Tabletas frac30',1.00,6.00,'Tableta','TABLETA'),(7,'214','ADONA (AC 17) 30 mg Caja Envase Blister Tabletas frac10',17.00,26.00,'Tableta','TABLETA'),(8,'190','ADAX 400 mg Caja Envase Blister Tabletas frac60',19.00,27.00,'Tableta Recubierta','TABLETA'),(9,'191','ADAX 600 mg Caja Envase Blister Tabletas frac60',24.00,38.00,'Tableta Recubierta','TABLETA'),(10,'194','ADAX FLU FORTE 400 mg + 60 mg Caja Envase Blister Tabletas frac60',11.00,19.00,'Tableta Recubierta','TABLETA'),(11,'204','ADENEX 5 mg Caja Envase Blíster Comprimidos frac15',6.00,11.00,'Comprimido','TABLETA'),(12,'205','ADENEX 5 mg Caja Envase Blíster Comprimidos frac30',10.00,17.00,'Comprimido','TABLETA'),(13,'5','AB AMBROMOX 600 mg Caja Vial frac1',7.00,15.00,'Polvo para Solución Inyectable','INYECTABLE'),(14,'6','AB AMBROMOX 1 200 mg Vial + Accesorios frac1',9.00,16.00,'Polvo para Solución Inyectable','INYECTABLE'),(15,'176','ACTILYSE 50 mg Vial frac1',29.00,41.00,'Polvo para Solución Inyectable','INYECTABLE'),(16,'151','ACLASTA 5 mg/100 mL Frasco X 100 mL frac1',19.00,31.00,'Solución para Perfusión','INYECTABLE'),(17,'165','ACTEMRA 80 mg/4 mL Caja Vial X 4 mL frac1',41.00,59.00,'Concentrado para Solución para Perfusión','INYECTABLE'),(18,'166','ACTEMRA 200 mg/10 mL Caja Vial x 10 mL frac1',19.00,27.00,'Concentrado para Solución para Perfusión','INYECTABLE'),(19,'180','ADACEL  Caja Frasco X 0.5 mL frac1',16.00,25.00,'Suspensión Inyectable','INYECTABLE'),(20,'193','ADAX FLU 100 mg + 15 mg/5 mL Frasco X 60 mL frac1',8.00,15.00,'Suspensión Oral','SUSPENSION'),(21,'195','ADAX FLU FORTE 200 mg + 30 mg/5 mL Frasco X 60 mL frac1',15.00,24.00,'Suspensión Oral','SUSPENSION'),(22,'228','AERO OM SABOR ANIS 100 mg/mL Frasco X 15 mL frac1',13.00,21.00,'Suspensión Oral','SUSPENSION');
/*!40000 ALTER TABLE `dproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtiempo`
--

DROP TABLE IF EXISTS `dtiempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtiempo` (
  `DTiem_id` int NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `Dia_semana_desc` varchar(12) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Mes_cod` varchar(2) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Mes_desc` varchar(12) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Trim_cod` varchar(1) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Trim_desc` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Anio` varchar(4) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`DTiem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtiempo`
--

LOCK TABLES `dtiempo` WRITE;
/*!40000 ALTER TABLE `dtiempo` DISABLE KEYS */;
INSERT INTO `dtiempo` VALUES (1,'2020-03-08','domingo','3','marzo','1','Trimestre 1','2020');
/*!40000 ALTER TABLE `dtiempo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dvendedor`
--

DROP TABLE IF EXISTS `dvendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dvendedor` (
  `DVend_id` int NOT NULL AUTO_INCREMENT,
  `Nom_vend` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`DVend_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dvendedor`
--

LOCK TABLES `dvendedor` WRITE;
/*!40000 ALTER TABLE `dvendedor` DISABLE KEYS */;
INSERT INTO `dvendedor` VALUES (1,'Angel Sullon'),(2,'Carlos');
/*!40000 ALTER TABLE `dvendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_pedido`
--

DROP TABLE IF EXISTS `h_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `h_pedido` (
  `DTiem_id` int NOT NULL,
  `DProd_id` int NOT NULL,
  `DCli_id` int NOT NULL,
  `DVend_id` int NOT NULL,
  `Ventas` decimal(9,2) DEFAULT NULL,
  `Can_unidades` decimal(9,2) DEFAULT NULL,
  `Costos` decimal(9,2) DEFAULT NULL,
  `Descuentos` decimal(9,2) DEFAULT NULL,
  `Can_min_confirmacion` decimal(9,2) DEFAULT NULL,
  `Can_min_despacho` decimal(9,2) DEFAULT NULL,
  `Can_horas_entrega` decimal(9,2) DEFAULT NULL,
  `Can_clientes` int DEFAULT NULL,
  PRIMARY KEY (`DTiem_id`,`DProd_id`,`DCli_id`,`DVend_id`),
  KEY `DProd_id` (`DProd_id`),
  KEY `DCli_id` (`DCli_id`),
  KEY `DVend_id` (`DVend_id`),
  CONSTRAINT `h_pedido_ibfk_1` FOREIGN KEY (`DTiem_id`) REFERENCES `dtiempo` (`DTiem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `h_pedido_ibfk_2` FOREIGN KEY (`DProd_id`) REFERENCES `dproducto` (`DProd_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `h_pedido_ibfk_3` FOREIGN KEY (`DCli_id`) REFERENCES `dcliente` (`DCli_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `h_pedido_ibfk_4` FOREIGN KEY (`DVend_id`) REFERENCES `dvendedor` (`DVend_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_pedido`
--

LOCK TABLES `h_pedido` WRITE;
/*!40000 ALTER TABLE `h_pedido` DISABLE KEYS */;
INSERT INTO `h_pedido` VALUES (1,1,1,1,1120.00,80.00,640.00,80.00,60.00,60.00,22.00,1),(1,2,2,2,1040.00,80.00,480.00,0.00,110.00,120.00,18.83,1),(1,13,1,1,870.00,60.00,420.00,30.00,60.00,60.00,22.00,1),(1,13,2,2,840.00,60.00,420.00,60.00,110.00,120.00,18.83,1),(1,14,1,1,1280.00,80.00,720.00,0.00,60.00,60.00,22.00,1),(1,14,2,2,800.00,50.00,450.00,0.00,110.00,120.00,18.83,1);
/*!40000 ALTER TABLE `h_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-24 10:43:59
