CREATE DATABASE  IF NOT EXISTS `sare` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sare`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sare
-- ------------------------------------------------------
-- Server version	5.5.62

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
-- Table structure for table `catalogos`
--

DROP TABLE IF EXISTS `catalogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogos` (
  `idCatalogo` int(11) NOT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `activo` char(255) NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`idCatalogo`),
  KEY `idCategoria` (`idCategoria`),
  CONSTRAINT `catalogos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `catalogos` (`idCatalogo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogos`
--

LOCK TABLES `catalogos` WRITE;
/*!40000 ALTER TABLE `catalogos` DISABLE KEYS */;
INSERT INTO `catalogos` VALUES (1,NULL,'Estatus actividad','S',0),(2,NULL,'Roles sistemas','S',0),(101,1,'Activo','S',0),(102,1,'Inactivo','S',1),(201,2,'Administrador','S',0),(202,2,'Becarioz','S',0);
/*!40000 ALTER TABLE `catalogos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `catalogosfullinfo`
--

DROP TABLE IF EXISTS `catalogosfullinfo`;
/*!50001 DROP VIEW IF EXISTS `catalogosfullinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `catalogosfullinfo` AS SELECT 
 1 AS `idCatalogo`,
 1 AS `idCategoria`,
 1 AS `nombre`,
 1 AS `activo`,
 1 AS `orden`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `categoriasfullinfo`
--

DROP TABLE IF EXISTS `categoriasfullinfo`;
/*!50001 DROP VIEW IF EXISTS `categoriasfullinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `categoriasfullinfo` AS SELECT 
 1 AS `idCategoria`,
 1 AS `nombre`,
 1 AS `activo`,
 1 AS `orden`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `contactopersonal`
--

DROP TABLE IF EXISTS `contactopersonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactopersonal` (
  `idContacto` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCompleto` varchar(50) NOT NULL,
  `telefono1` varchar(10) NOT NULL,
  `telefono2` varchar(10) DEFAULT NULL,
  `parentesco` varchar(100) NOT NULL,
  `idPersonal` int(11) NOT NULL,
  PRIMARY KEY (`idContacto`),
  KEY `idPersonal` (`idPersonal`),
  CONSTRAINT `contactopersonal_ibfk_1` FOREIGN KEY (`idPersonal`) REFERENCES `personal` (`idPersonal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactopersonal`
--

LOCK TABLES `contactopersonal` WRITE;
/*!40000 ALTER TABLE `contactopersonal` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactopersonal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidadfederativa`
--

DROP TABLE IF EXISTS `entidadfederativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entidadfederativa` (
  `idEntidadFederativa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `idPais` int(11) NOT NULL,
  PRIMARY KEY (`idEntidadFederativa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidadfederativa`
--

LOCK TABLES `entidadfederativa` WRITE;
/*!40000 ALTER TABLE `entidadfederativa` DISABLE KEYS */;
INSERT INTO `entidadfederativa` VALUES (1,'Veracruz','Ver',1),(2,'Oaxaca','Oax',1),(3,'México','Mex',1);
/*!40000 ALTER TABLE `entidadfederativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horariolaboral`
--

DROP TABLE IF EXISTS `horariolaboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horariolaboral` (
  `idHorario` int(11) NOT NULL,
  `horaEntrada1` time NOT NULL,
  `horaSalida1` time NOT NULL,
  `horaEntrada2` time NOT NULL,
  `horaSalida2` time NOT NULL,
  `diaSemana` varchar(10) NOT NULL,
  `idPersonal` int(11) NOT NULL,
  PRIMARY KEY (`idHorario`),
  KEY `idPersonal` (`idPersonal`),
  CONSTRAINT `horariolaboral_ibfk_1` FOREIGN KEY (`idPersonal`) REFERENCES `personal` (`idPersonal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horariolaboral`
--

LOCK TABLES `horariolaboral` WRITE;
/*!40000 ALTER TABLE `horariolaboral` DISABLE KEYS */;
/*!40000 ALTER TABLE `horariolaboral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacionlaboral`
--

DROP TABLE IF EXISTS `informacionlaboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informacionlaboral` (
  `idInformacion` int(11) NOT NULL AUTO_INCREMENT,
  `idPersonal` int(11) NOT NULL,
  `idTipoContratacion` int(11) NOT NULL,
  `idEsquemaPago` int(11) NOT NULL,
  `nss` varchar(30) NOT NULL,
  `idarea` int(11) NOT NULL,
  `idCargo` int(11) NOT NULL,
  `idPersonalResponsable` int(11) NOT NULL,
  `sueldo` float NOT NULL,
  `idBanco` int(11) NOT NULL,
  `clabe` varchar(16) NOT NULL,
  PRIMARY KEY (`idInformacion`),
  KEY `idPersonal` (`idPersonal`),
  KEY `idTipoContratacion` (`idTipoContratacion`),
  KEY `idEsquemaPago` (`idEsquemaPago`),
  KEY `idarea` (`idarea`),
  KEY `idCargo` (`idCargo`),
  KEY `idPersonalResponsable` (`idPersonalResponsable`),
  KEY `idBanco` (`idBanco`),
  CONSTRAINT `informacionlaboral_ibfk_1` FOREIGN KEY (`idPersonal`) REFERENCES `personal` (`idPersonal`),
  CONSTRAINT `informacionlaboral_ibfk_2` FOREIGN KEY (`idTipoContratacion`) REFERENCES `catalogos` (`idCatalogo`),
  CONSTRAINT `informacionlaboral_ibfk_3` FOREIGN KEY (`idEsquemaPago`) REFERENCES `catalogos` (`idCatalogo`),
  CONSTRAINT `informacionlaboral_ibfk_4` FOREIGN KEY (`idarea`) REFERENCES `catalogos` (`idCatalogo`),
  CONSTRAINT `informacionlaboral_ibfk_5` FOREIGN KEY (`idCargo`) REFERENCES `catalogos` (`idCatalogo`),
  CONSTRAINT `informacionlaboral_ibfk_6` FOREIGN KEY (`idPersonalResponsable`) REFERENCES `personal` (`idPersonal`),
  CONSTRAINT `informacionlaboral_ibfk_7` FOREIGN KEY (`idBanco`) REFERENCES `catalogos` (`idCatalogo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacionlaboral`
--

LOCK TABLES `informacionlaboral` WRITE;
/*!40000 ALTER TABLE `informacionlaboral` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacionlaboral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `idMunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `idEntidadFederativa` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`idMunicipio`),
  KEY `municipio_ibfk_1` (`idEntidadFederativa`),
  CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`idEntidadFederativa`) REFERENCES `entidadfederativa` (`idEntidadFederativa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,1,'Xalapa');
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'México'),(2,'Estados Unidos'),(3,'Canadá'),(4,'Alemania'),(5,'Puerto Rico');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `idPermiso` int(11) NOT NULL AUTO_INCREMENT,
  `permiso` varchar(255) NOT NULL,
  `idTipo` int(11) NOT NULL,
  PRIMARY KEY (`idPermiso`),
  KEY `idTipo` (`idTipo`),
  CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`idTipo`) REFERENCES `catalogos` (`idCatalogo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `idPersonal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidoPaterno` varchar(50) NOT NULL,
  `apellidoMaterno` varchar(50) NOT NULL,
  `curp` varchar(16) DEFAULT NULL,
  `rfc` varchar(16) DEFAULT NULL,
  `fechaNacimiento` date NOT NULL,
  `sexo` char(1) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `colonia` varchar(100) NOT NULL,
  `numExt` varchar(10) NOT NULL,
  `numInt` varchar(10) DEFAULT NULL,
  `cp` int(11) NOT NULL,
  `idPais` int(11) NOT NULL,
  `idEntidadFederativa` int(11) NOT NULL,
  `idMunicipio` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `idEstadoCivil` int(11) NOT NULL,
  `ultimoGradoEstudio` varchar(100) DEFAULT NULL,
  `profecion` varchar(100) DEFAULT NULL,
  `idEstatus` int(11) NOT NULL,
  `tiempoCreacion` datetime DEFAULT NULL,
  `tiempoActualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idPersonal`),
  KEY `idPais` (`idPais`),
  KEY `idEntidadFederativa` (`idEntidadFederativa`),
  KEY `idMunicipio` (`idMunicipio`),
  KEY `idEstadoCivil` (`idEstadoCivil`),
  KEY `idEstatus` (`idEstatus`),
  CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`),
  CONSTRAINT `personal_ibfk_2` FOREIGN KEY (`idEntidadFederativa`) REFERENCES `entidadfederativa` (`idEntidadFederativa`),
  CONSTRAINT `personal_ibfk_3` FOREIGN KEY (`idMunicipio`) REFERENCES `municipio` (`idMunicipio`),
  CONSTRAINT `personal_ibfk_4` FOREIGN KEY (`idEstadoCivil`) REFERENCES `catalogos` (`idCatalogo`),
  CONSTRAINT `personal_ibfk_5` FOREIGN KEY (`idEstatus`) REFERENCES `catalogos` (`idCatalogo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Yadelí','Puntualidad','Concentración','LOAI0629MVZPNA1','YAL02329LZ','2000-06-29','F','Coatzacoalcos','Progreso','#413','S/N',91000,1,2,1,'ingrid_yadeli@hotmail.com','2961192001',1,'Licenciatura','Tecnóloga',101,'2023-05-30 00:00:00',NULL),(3,'Evelyn','López','Aguilar','EVL045298PGNJSA','ELA0829J45','2006-08-19','F','Miguel Hidalgo','Centro','S/N','S/N',91495,1,2,1,'eve_lop@hotmail.com','2961165429',1,'Secundaria','Estudiante',101,'2023-05-30 00:00:00',NULL);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `personalfullinfo`
--

DROP TABLE IF EXISTS `personalfullinfo`;
/*!50001 DROP VIEW IF EXISTS `personalfullinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `personalfullinfo` AS SELECT 
 1 AS `idPersonal`,
 1 AS `nombre`,
 1 AS `apellidoPaterno`,
 1 AS `apellidoMaterno`,
 1 AS `curp`,
 1 AS `rfc`,
 1 AS `fechaNacimiento`,
 1 AS `sexo`,
 1 AS `calle`,
 1 AS `colonia`,
 1 AS `numExt`,
 1 AS `numInt`,
 1 AS `cp`,
 1 AS `idPais`,
 1 AS `pais`,
 1 AS `idEntidadFederativa`,
 1 AS `EntidadFederativa`,
 1 AS `idMunicipio`,
 1 AS `municipio`,
 1 AS `email`,
 1 AS `celular`,
 1 AS `idEstadoCivil`,
 1 AS `estadoCivil`,
 1 AS `ultimoGradoEstudio`,
 1 AS `profecion`,
 1 AS `idEstatus`,
 1 AS `estatus`,
 1 AS `TiempoCreacion`,
 1 AS `TiempoActualizacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidoPaterno` varchar(50) NOT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(1000) NOT NULL,
  `idRol` int(11) NOT NULL,
  `idEstatus` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idRol` (`idRol`),
  KEY `usuarios_ibfk_2` (`idEstatus`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'Yayis','Puntualidad','Preciosa','2282511268','yayis','7B0A2055793A76518FADFE192E23109E4552157783D4B52AAD6AB6318C4A093C5DB67F13F20CFFD1B9539DC8CE77B77ECE18A3028023ADA6A4C779C2549DD1BD',201,101),(3,'Luis Enrique','Zapata','Lopez','2281345788','LuisZpt','96AD36B931EEB2F53E08E0FF4C45349E24486DCBFA6004A0D740E73D76435A7B3E1B9ADD484969E5C3F614CD1F775C3D04C9744C46A0F1302E7E920E8497859F',201,101),(4,'Nadia','Bravo','Guevara','2288714603','nadia','C94DE2671872C9C24ACE824ED720778B31E5E201F5958A51ECCD78D766961D9FC10A160BB4CE7A724AFADAED1FBD5ED7CD35A538F1AEC49FCAB1F1DD44DC6F1F',201,101),(5,'Evelyn','López','Aguilar','2961068752','eve','48B9B84558AD2E4043D888CB929A716706739865864AB3A05B766D0F028F22891CD39B71BADC58BB8DB99BD890BDC5C0B6A20D117D2D1F0627E7080E3C062429',201,101),(6,'Tabata','Gómez','Hernández','2961068752','tabata','5D1A77D23932B49F2786335FA0ACA3679FA6DD14A5D9859FA07DEDF2AA1A3F7BD656527CDA0A47B4FB738A966310A8970AD6CEF505DF8930529DF40E5149D7E6',201,101),(7,'Oscar','Fernández','Balboa','2895013467','oscar','9D23C2BD8AD87F6AD81A50DA0A7D8E47048723772DA9B344395005E87327D425AC844135C5DE0880FF1FB8AB724DC23F923BB1A938EF6A1F76C9C6906F47D91A',201,101);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `usuariosfullinfo`
--

DROP TABLE IF EXISTS `usuariosfullinfo`;
/*!50001 DROP VIEW IF EXISTS `usuariosfullinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usuariosfullinfo` AS SELECT 
 1 AS `idUsuario`,
 1 AS `nombre`,
 1 AS `apellidoPaterno`,
 1 AS `apellidoMaterno`,
 1 AS `celular`,
 1 AS `usuario`,
 1 AS `contrasena`,
 1 AS `idRol`,
 1 AS `rol`,
 1 AS `idEstatus`,
 1 AS `estatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuariospermisos`
--

DROP TABLE IF EXISTS `usuariospermisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariospermisos` (
  `idUsuario` int(11) NOT NULL,
  `idPermiso` int(11) NOT NULL,
  KEY `idUsuario` (`idUsuario`),
  KEY `idPermiso` (`idPermiso`),
  CONSTRAINT `usuariospermisos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `usuariospermisos_ibfk_2` FOREIGN KEY (`idPermiso`) REFERENCES `permisos` (`idPermiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariospermisos`
--

LOCK TABLES `usuariospermisos` WRITE;
/*!40000 ALTER TABLE `usuariospermisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuariospermisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sare'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizarCatalogo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarCatalogo`(IN idCatalogo INT, IN idCategoria INT, IN nombre VARCHAR(50), IN activo CHAR(255), IN orden INT)
BEGIN
UPDATE catalogos c SET c.idCategoria=idCategoria, c.nombre=nombre, c.activo=activo, c.orden=orden WHERE c.idCatalogo=idCatalogo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizarCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarCategoria`(IN idCatalogo INT, IN nombre VARCHAR(50), IN activo CHAR(255), IN orden INT)
BEGIN
UPDATE catalogos c SET c.nombre=nombre, c.activo=activo, c.orden=orden WHERE c.idCatalogo=idCatalogo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizarEstatusCatalogo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarEstatusCatalogo`(IN idCatalogo INT, IN activo VARCHAR(255))
BEGIN
UPDATE catalogos c SET c.activo=activo WHERE c.idCatalogo=idCatalogo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizarEstatusUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarEstatusUsuario`(IN idUsuario INT, IN idEstatus INT)
BEGIN
UPDATE usuarios u SET u.idEstatus = idEstatus WHERE u.idUsuario=idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarUsuario`(IN idUsuario INT, IN nombre VARCHAR(50), IN apellidoPaterno VARCHAR(50) , IN apellidoMaterno VARCHAR(50), IN celular VARCHAR(50), IN usuario VARCHAR(50),IN contrasena VARCHAR(1000), IN idRol INT, IN idEstatus INT)
BEGIN
UPDATE usuarios u SET u.nombre=nombre, u.apellidoPaterno=apellidoPaterno, u.apellidoMaterno=apellidoMaterno, u.celular=celular, u.usuario=usuario, u.contrasena=contrasena, u.idRol=idRol, u.idEstatus=idEstatus WHERE u.idUsuario=idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarUsuario`(IN idUsuario INT)
BEGIN
UPDATE usuarios u SET idEstatus=102 WHERE u.idUsuario=idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAllCatalogos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllCatalogos`()
BEGIN
SELECT * FROM catalogosfullinfo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAllCatalogosByIdCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllCatalogosByIdCategoria`(IN idCategoria int)
BEGIN
Select * from catalogosfullinfo c
where c.idCategoria = idCategoria; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAllCategorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllCategorias`()
BEGIN
SELECT * FROM categoriasfullinfo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAllPersonal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllPersonal`()
BEGIN
SELECT * from personalfullinfo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAllUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllUsers`()
BEGIN
	Select * FROM usuariosfullinfo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login`(IN usuario VARCHAR(50), IN contrasena VARCHAR(1000))
BEGIN
SELECT * FROM usuariosfullinfo u WHERE u.usuario=usuario AND u.contrasena=contrasena;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrarCatalogo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrarCatalogo`(IN idCatalogo INT, IN idCategoria INT, IN nombre VARCHAR(50), IN activo CHAR(255), IN orden INT)
BEGIN
	INSERT INTO catalogos(idCatalogo, idCategoria, nombre, activo, orden) VALUES (idCatalogo, idCategoria, nombre, activo, orden);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrarCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrarCategoria`(IN idCatalogo INT, IN nombre VARCHAR(50), IN activo CHAR(255), IN orden INT)
BEGIN
	INSERT INTO catalogos(idCatalogo, nombre, activo, orden) VALUES (idCatalogo, nombre, activo, orden);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrarPersonal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrarPersonal`(
IN nombre VARCHAR(100), IN apellidoPaterno VARCHAR(100) , IN apellidoMaterno VARCHAR(100), IN curp VARCHAR(50), 
IN rfc VARCHAR(50),IN fechaNacimiento DATE, IN sexo VARCHAR(1), IN calle VARCHAR(100), IN colonia VARCHAR(100), 
IN numExt VARCHAR(10), IN numInt VARCHAR(10), IN cp INT, IN idPais INT, IN idEntidadFederativa INT, IN idMunicipio INT, 
IN email VARCHAR(100), IN celular VARCHAR(10), IN idEstadoCivil INT, IN ultimoGradoEstudio VARCHAR(100), IN profecion VARCHAR(100),
IN idEstatus INT, IN tiempoCreacion DATE, IN tiempoActualizacion DATE)
BEGIN
insert into personal(idPersonal, nombre, apellidoPaterno, apellidoMaterno, curp, rfc, fechaNacimiento, sexo, calle, colonia, 
numExt, numInt, cp, idPais, idEntidadFederativa, idMunicipio, email, celular, idEstadoCivil, ultimoGradoEstudio, profecion, 
idEstatus, tiempoCreacion, tiempoActualizacion) 
values(idPersonal, nombre, apellidoPaterno, apellidoMaterno, curp, rfc, fechaNacimiento, sexo, calle, colonia, 
numExt, numInt, cp, idPais, idEntidadFederativa, idMunicipio, email, celular, idEstadoCivil, ultimoGradoEstudio, profecion, 
idEstatus, tiempoCreacion, tiempoActualizacion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrarUsuario`(IN nombre VARCHAR(50), IN apellidoPaterno VARCHAR(50) , IN apellidoMaterno VARCHAR(50), IN celular VARCHAR(50), IN usuario VARCHAR(50),IN contrasena VARCHAR(1000), IN idRol INT, IN idEstatus INT)
BEGIN
INSERT INTO usuarios(nombre,apellidoPaterno,apellidoMaterno,celular,usuario,contrasena,idRol,idEstatus) VALUES (nombre, apellidoPaterno, apellidoMaterno, celular, usuario, contrasena, idRol, 101);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `catalogosfullinfo`
--

/*!50001 DROP VIEW IF EXISTS `catalogosfullinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `catalogosfullinfo` AS select `catalogos`.`idCatalogo` AS `idCatalogo`,`catalogos`.`idCategoria` AS `idCategoria`,`catalogos`.`nombre` AS `nombre`,`catalogos`.`activo` AS `activo`,`catalogos`.`orden` AS `orden` from `catalogos` where (`catalogos`.`idCategoria` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `categoriasfullinfo`
--

/*!50001 DROP VIEW IF EXISTS `categoriasfullinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `categoriasfullinfo` AS select `catalogos`.`idCatalogo` AS `idCategoria`,`catalogos`.`nombre` AS `nombre`,`catalogos`.`activo` AS `activo`,`catalogos`.`orden` AS `orden` from `catalogos` where isnull(`catalogos`.`idCategoria`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `personalfullinfo`
--

/*!50001 DROP VIEW IF EXISTS `personalfullinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `personalfullinfo` AS select `p`.`idPersonal` AS `idPersonal`,`p`.`nombre` AS `nombre`,`p`.`apellidoPaterno` AS `apellidoPaterno`,`p`.`apellidoMaterno` AS `apellidoMaterno`,`p`.`curp` AS `curp`,`p`.`rfc` AS `rfc`,`p`.`fechaNacimiento` AS `fechaNacimiento`,`p`.`sexo` AS `sexo`,`p`.`calle` AS `calle`,`p`.`colonia` AS `colonia`,`p`.`numExt` AS `numExt`,`p`.`numInt` AS `numInt`,`p`.`cp` AS `cp`,`p`.`idPais` AS `idPais`,`pa`.`nombre` AS `pais`,`p`.`idEntidadFederativa` AS `idEntidadFederativa`,`e1`.`nombre` AS `EntidadFederativa`,`p`.`idMunicipio` AS `idMunicipio`,`m`.`nombre` AS `municipio`,`p`.`email` AS `email`,`p`.`celular` AS `celular`,`p`.`idEstadoCivil` AS `idEstadoCivil`,`ec`.`nombre` AS `estadoCivil`,`p`.`ultimoGradoEstudio` AS `ultimoGradoEstudio`,`p`.`profecion` AS `profecion`,`p`.`idEstatus` AS `idEstatus`,`e`.`nombre` AS `estatus`,`p`.`tiempoCreacion` AS `TiempoCreacion`,`p`.`tiempoActualizacion` AS `TiempoActualizacion` from (((((`personal` `p` join `entidadfederativa` `e1` on((`e1`.`idEntidadFederativa` = `p`.`idEntidadFederativa`))) join `pais` `pa` on((`pa`.`idPais` = `p`.`idPais`))) join `municipio` `m` on((`m`.`idMunicipio` = `p`.`idMunicipio`))) join `catalogos` `e` on((`e`.`idCatalogo` = `p`.`idEstatus`))) join `catalogos` `ec` on((`ec`.`idCatalogo` = `p`.`idEstadoCivil`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usuariosfullinfo`
--

/*!50001 DROP VIEW IF EXISTS `usuariosfullinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usuariosfullinfo` AS select `u`.`idUsuario` AS `idUsuario`,`u`.`nombre` AS `nombre`,`u`.`apellidoPaterno` AS `apellidoPaterno`,`u`.`apellidoMaterno` AS `apellidoMaterno`,`u`.`celular` AS `celular`,`u`.`usuario` AS `usuario`,`u`.`contrasena` AS `contrasena`,`u`.`idRol` AS `idRol`,`c1`.`nombre` AS `rol`,`u`.`idEstatus` AS `idEstatus`,`c2`.`nombre` AS `estatus` from ((`usuarios` `u` join `catalogos` `c1` on((`c1`.`idCatalogo` = `u`.`idRol`))) join `catalogos` `c2` on((`c2`.`idCatalogo` = `u`.`idEstatus`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-12 23:47:58
