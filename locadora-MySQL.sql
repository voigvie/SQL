-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: locadora
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `login` varchar(30) NOT NULL DEFAULT '',
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('aline','aline mariana'),('joca','jonas carmelo'),('lucas','lucas silveiro'),('phsb','phabiano');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filme` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` VALUES (1,'Titanic'),(2,'Eu sou o numero 4'),(3,'o poder do seis 6'),(4,'Veronika decide morrer'),(5,'crepusculo'),(6,'a lagoa azul'),(7,'esqueceram de mim'),(8,'velocidade maxima'),(9,'o meu primeiro amor'),(10,'coragem, o cão covarde');
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idioma` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES (1,'Português'),(2,'Inglês');
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locar`
--

DROP TABLE IF EXISTS `locar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locar` (
  `data_locacao` date NOT NULL DEFAULT '0000-00-00',
  `data_devolucao` date DEFAULT NULL,
  `login_clienteFK` varchar(30) NOT NULL DEFAULT '',
  `codigo_unidadeFK` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`data_locacao`,`login_clienteFK`,`codigo_unidadeFK`),
  KEY `login_clienteFK` (`login_clienteFK`),
  KEY `codigo_unidadeFK` (`codigo_unidadeFK`),
  CONSTRAINT `locar_ibfk_1` FOREIGN KEY (`login_clienteFK`) REFERENCES `cliente` (`login`),
  CONSTRAINT `locar_ibfk_2` FOREIGN KEY (`codigo_unidadeFK`) REFERENCES `unidade` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locar`
--

LOCK TABLES `locar` WRITE;
/*!40000 ALTER TABLE `locar` DISABLE KEYS */;
INSERT INTO `locar` VALUES ('2011-12-02','2011-01-12','aline',3),('2011-12-02','2011-01-12','aline',4),('2011-12-02','2011-01-12','joca',1),('2011-12-02','2011-01-12','joca',2),('2011-12-02','2011-01-12','joca',3),('2011-12-02','2011-01-12','lucas',1),('2011-12-02','2011-01-12','phsb',1),('2011-12-02','2011-01-12','phsb',3),('2011-12-02','2011-01-12','phsb',4);
/*!40000 ALTER TABLE `locar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possuir_audio`
--

DROP TABLE IF EXISTS `possuir_audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `possuir_audio` (
  `codigo_idiomaFK` int(11) NOT NULL,
  `codigo_unidadeFK` int(11) NOT NULL,
  PRIMARY KEY (`codigo_idiomaFK`,`codigo_unidadeFK`),
  KEY `fk_possuir_audio_2_idx` (`codigo_unidadeFK`),
  CONSTRAINT `fk_possuir_audio_1` FOREIGN KEY (`codigo_idiomaFK`) REFERENCES `idioma` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_possuir_audio_2` FOREIGN KEY (`codigo_unidadeFK`) REFERENCES `unidade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possuir_audio`
--

LOCK TABLES `possuir_audio` WRITE;
/*!40000 ALTER TABLE `possuir_audio` DISABLE KEYS */;
INSERT INTO `possuir_audio` VALUES (1,1),(2,1),(1,2),(2,3),(2,4),(1,5),(2,6),(1,7),(1,8),(2,8),(2,9),(1,10),(2,10);
/*!40000 ALTER TABLE `possuir_audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possuir_legenda`
--

DROP TABLE IF EXISTS `possuir_legenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `possuir_legenda` (
  `codigo_idiomaFK` int(11) NOT NULL,
  `codigo_unidadeFK` int(11) NOT NULL,
  PRIMARY KEY (`codigo_idiomaFK`,`codigo_unidadeFK`),
  KEY `fk_possuir_legenda_2_idx` (`codigo_unidadeFK`),
  CONSTRAINT `fk_possuir_legenda_1` FOREIGN KEY (`codigo_idiomaFK`) REFERENCES `idioma` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_possuir_legenda_2` FOREIGN KEY (`codigo_unidadeFK`) REFERENCES `unidade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possuir_legenda`
--

LOCK TABLES `possuir_legenda` WRITE;
/*!40000 ALTER TABLE `possuir_legenda` DISABLE KEYS */;
INSERT INTO `possuir_legenda` VALUES (1,1),(2,1),(2,2),(1,3),(1,4),(2,5),(1,6),(2,7),(1,8),(2,8),(1,9),(1,10),(2,10);
/*!40000 ALTER TABLE `possuir_legenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade`
--

DROP TABLE IF EXISTS `unidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidade` (
  `codigo` int(11) NOT NULL,
  `codigo_filmeFK` int(11) NOT NULL,
  `preco` float DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_filmeFK` (`codigo_filmeFK`),
  CONSTRAINT `unidade_ibfk_1` FOREIGN KEY (`codigo_filmeFK`) REFERENCES `filme` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade`
--

LOCK TABLES `unidade` WRITE;
/*!40000 ALTER TABLE `unidade` DISABLE KEYS */;
INSERT INTO `unidade` VALUES (1,1,2),(2,2,2.5),(3,3,2.5),(4,4,2.5),(5,5,2.5),(6,6,2.5),(7,7,2.5),(8,8,2.5),(9,9,2.5),(10,10,2.5);
/*!40000 ALTER TABLE `unidade` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-05  9:56:31
