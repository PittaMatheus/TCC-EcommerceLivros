-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce_livros
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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(155) NOT NULL,
  `sobrenome` varchar(155) NOT NULL,
  `data_nascimento` date NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  `ranking` double DEFAULT NULL,
  `senha` varchar(155) NOT NULL,
  `email` varchar(155) NOT NULL,
  `cpf` varchar(155) NOT NULL,
  `rg` varchar(155) DEFAULT NULL,
  `sexo` varchar(155) NOT NULL,
  `logradouroCobranca` varchar(155) NOT NULL,
  `bairroCobranca` varchar(155) NOT NULL,
  `cepCobranca` varchar(155) NOT NULL,
  `numeroCobranca` varchar(155) NOT NULL,
  `cidadeCobranca` varchar(155) NOT NULL,
  `ufCobranca` varchar(155) NOT NULL,
  `paisCobranca` varchar(155) NOT NULL,
  `tipoLogradouroCobranca` varchar(155) NOT NULL,
  `complementoCobranca` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Matheus','Pitta','1996-02-02',1,50,'123123','Matheus.pitta12@gmail.com','123123','123123','M','Avenida Ulysses Borges de Siqueira','123123123','08740-580','123123','Mogi das Cruzes','EspÃ­rito Santo','Brazil','estrada','123123'),(2,'Matheus','Pitta','1994-02-02',1,50,'213231','Matheus.pitta12@gmail.com','213123231','231123123','F','Avenida Ulysses Borges de Siqueira','3123123','08740-580','12312312','Mogi das Cruzes','EspÃ­rito Santo','Brazil','sitio','1231231'),(3,'Matheus','Pitta','1994-02-02',1,50,'123123123123123123','Matheus.pitta12@gmail.com','123123','123123','M','Avenida Ulysses Borges de Siqueira','123123','08740-580','123123123231','Mogi das Cruzes','EspÃ­rito Santo','Brazil','estrada','123123'),(4,'Matheus','Pitta','1994-02-02',1,50,'123123','Matheus.pitta12@gmail.com','213213','213213','F','Avenida Ulysses Borges de Siqueira','123123','08740-580','123123','Mogi das Cruzes','EspÃ­rito Santo','Brazil','sitio','123123'),(5,'sss','Pitta','1994-02-02',1,50,'213123123','Matheus.pitta12@gmail.com','123123','231123123','F','Avenida Ulysses Borges de Siqueira','321213','08740-580','123123','Mogi das Cruzes','EspÃ­rito Santo','Brazil','fazenda','231213123'),(6,'asdasd','Pitta','1994-02-02',1,50,'123123','Matheus.pitta12@gmail.com','123213','123123','F','Avenida Ulysses Borges de Siqueira','123123','08740-580','123123','Mogi das Cruzes','EspÃ­rito Santo','Brazil','estrada','1231231'),(7,'teste','Pitta','1994-02-02',1,50,'123123','Matheus.pitta12@gmail.com','213123','123123','F','Avenida Ulysses Borges de Siqueira','213123','08740-580','dadasdas','Mogi das Cruzes','EspÃ­rito Santo','Brazil','fazenda','213123'),(8,'123213','231123','1994-02-02',1,50,'123123','Matheus.pitta12@gmail.com','231123','123123123','F','Avenida Ulysses Borges de Siqueira','123123','08740-580','213123','Mogi das Cruzes','EspÃ­rito Santo','Brazil','estrada','123123'),(9,'Matheus','Pitta','1994-02-02',1,50,'123123123','Matheus.pitta12@gmail.com','123123','123123','F','Avenida Ulysses Borges de Siqueira','123123123','08740-580','123123123','Mogi das Cruzes','EspÃ­rito Santo','Brazil','fazenda','123123123'),(10,'Matheus','Pitta','1994-02-02',1,50,'2132','Matheus.pitta12@gmail.com','123123','213123','F','Avenida Ulysses Borges de Siqueira','Jardim Universo','08740-580','123213','Mogi das Cruzes','EspÃ­rito Santo123123123','Brazil','fazenda','213231'),(11,'Matheus','Pitta','1994-02-02',1,50,'123123123','Matheus.pitta12@gmail.com','321312','123123123','F','Avenida Ulysses Borges de Siqueira','123123123','08740-580','123123123','Mogi das Cruzes','EspÃ­rito Santo','Brazil','fazenda','231213123');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(155) NOT NULL,
  `numero` varchar(155) NOT NULL,
  `bairro` varchar(155) DEFAULT NULL,
  `cep` varchar(155) NOT NULL,
  `cidade` varchar(155) NOT NULL,
  `uf` varchar(155) NOT NULL,
  `tipoLogradouro` varchar(155) DEFAULT NULL,
  `nomeEndereco` varchar(155) DEFAULT NULL,
  `complemento` varchar(155) DEFAULT NULL,
  `referencia` varchar(155) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_idx` (`id_cliente`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'123123213123123123','123231123123','213213231','213123','231123123','123123123123','fazenda','213213123','123123123123','213123123123',1),(3,'asdasdasd','asdasdasd','dasdasd','dasdasda','dasdasdas','asdasd','fazenda','asdasd','123','asdasd',2),(4,'132123','123123','123123','213123','123123','123123','fazenda','123123','123123','123213',2),(5,'qweqew','wqeqwe','qweqwe','qweqwe','qweeqw','weqqwe','estrada','qweqewqwe','','eqweqw',3);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce_livros'
--

--
-- Dumping routines for database 'ecommerce_livros'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-17 22:25:13
