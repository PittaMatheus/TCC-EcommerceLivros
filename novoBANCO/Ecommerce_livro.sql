-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Ecommerce
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_barras` varchar(155) NOT NULL,
  `autor` varchar(155) NOT NULL,
  `titulo` varchar(155) NOT NULL,
  `ano` varchar(155) NOT NULL,
  `edicao` varchar(155) DEFAULT NULL,
  `numero_paginas` varchar(155) DEFAULT NULL,
  `sinopse` varchar(500) DEFAULT NULL,
  `ativo` tinyint(4) DEFAULT '1',
  `preco` decimal(5,2) DEFAULT NULL,
  `id_editora` int(11) NOT NULL,
  `id_dimensao` int(11) NOT NULL,
  `id_isbn` int(11) NOT NULL,
  `id_grupolivro` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_livro_editora_idx` (`id_editora`),
  KEY `fk_livro_isbn_idx` (`id_isbn`),
  KEY `fk_livro_grupoLivro_idx` (`id_grupolivro`),
  KEY `fk_livro_dimensoes_idx` (`id_dimensao`),
  CONSTRAINT `fk_livro_dimensoes` FOREIGN KEY (`id_dimensao`) REFERENCES `dimensoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_livro_editora` FOREIGN KEY (`id_editora`) REFERENCES `editora` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_livro_grupoLivro` FOREIGN KEY (`id_grupolivro`) REFERENCES `grupolivro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_livro_isbn` FOREIGN KEY (`id_isbn`) REFERENCES `isbn` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'2010120132','autor teste','titulo teste','02/02/1999','2','222','Esse Ã© um exemplo da sinopse de um livro',1,49.99,3,1,1,1),(2,'201012123','autor teste','titulo teste','02/02/1999','2','222','Esse Ã© um exemplo da sinopse de um livro',1,49.99,4,2,2,1),(3,'2010120123132','autor teste','lancamento','02/02/1999','2','222','Esse Ã© um exemplo da sinopse de um livro',1,49.99,5,3,3,2);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-11 12:02:19
