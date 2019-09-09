-- MySQL dump 10.13  Distrib 8.0.16, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce_livros
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bandeira`
--

DROP TABLE IF EXISTS `bandeira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bandeira` (
  `id_bandeira` int(11) NOT NULL AUTO_INCREMENT,
  `nome_bandeira` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_bandeira`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bandeira`
--

LOCK TABLES `bandeira` WRITE;
/*!40000 ALTER TABLE `bandeira` DISABLE KEYS */;
INSERT INTO `bandeira` VALUES (1,'American Express'),(2,'Aura'),(3,'Diners Club'),(4,'Elo'),(5,'Hipercard'),(6,'Mastercard'),(7,'Sorocred'),(8,'Visa');
/*!40000 ALTER TABLE `bandeira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrinho`
--

DROP TABLE IF EXISTS `carrinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `carrinho` (
  `id_livro` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT '1',
  KEY `fk_carrinho_cliente_idx` (`id_cliente`),
  KEY `fk_carrinho_livro_idx` (`id_livro`),
  CONSTRAINT `fk_carrinho_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_carrinho_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrinho`
--

LOCK TABLES `carrinho` WRITE;
/*!40000 ALTER TABLE `carrinho` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrinho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao`
--

DROP TABLE IF EXISTS `cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cartao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(155) NOT NULL,
  `dtVencimento` date NOT NULL,
  `id_bandeira` int(11) NOT NULL,
  `numero` varchar(155) NOT NULL,
  `codSeguranca` varchar(155) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_cliente_idx` (`id_cliente`),
  KEY `id_bandeira_idx` (`id_bandeira`),
  CONSTRAINT `id_bandeira` FOREIGN KEY (`id_bandeira`) REFERENCES `bandeira` (`id_bandeira`),
  CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao`
--

LOCK TABLES `cartao` WRITE;
/*!40000 ALTER TABLE `cartao` DISABLE KEYS */;
INSERT INTO `cartao` VALUES (1,'JOAO DA SILVA','2019-09-09',1,'2321321','033',1,0),(2,'2','2019-09-09',2,'2321321','2123',1,0);
/*!40000 ALTER TABLE `cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(155) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Ação'),(2,'Aventura'),(3,'Biografia'),(4,'Comédia'),(5,'Didático'),(6,'Drama'),(7,'Faroeste'),(8,'Ficção'),(9,'Romance'),(10,'Suspense'),(11,'Terror');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
  `tipo_usuario` varchar(55) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_tipoUsuario_idx` (`tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'MatheusS','Pitta','1995-01-12',1,50,'862022A260F770176C8916D7A17D85A6634F3EB790A2A5E2D0F2999483CF1DFE','emailteste@teste.com','41656190869','329702760','M','1'),(2,'ALTERANDO TESTE','SobrenomeTeste','1995-01-12',1,50,'862022A260F770176C8916D7A17D85A6634F3EB790A2A5E2D0F2999483CF1DFE','adm@adm.com','45296735889','329702760','M','2'),(4,'Cliente','criptografado','1995-01-12',1,50,'862022A260F770176C8916D7A17D85A6634F3EB790A2A5E2D0F2999483CF1DFE','matheus.pitta2@gmail.com','34003847040','329702760','M','1');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupomDesconto`
--

DROP TABLE IF EXISTS `cupomDesconto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cupomDesconto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(155) NOT NULL,
  `valor` double NOT NULL,
  `validade` date DEFAULT NULL,
  `codigo` varchar(155) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupomDesconto`
--

LOCK TABLES `cupomDesconto` WRITE;
/*!40000 ALTER TABLE `cupomDesconto` DISABLE KEYS */;
INSERT INTO `cupomDesconto` VALUES (1,'radio',20,'2021-05-05','QWERTY',0);
/*!40000 ALTER TABLE `cupomDesconto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupomTroca`
--

DROP TABLE IF EXISTS `cupomTroca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cupomTroca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `dataGerado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1',
  `codigo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupomTroca`
--

LOCK TABLES `cupomTroca` WRITE;
/*!40000 ALTER TABLE `cupomTroca` DISABLE KEYS */;
INSERT INTO `cupomTroca` VALUES (1,1,64,'2019-06-24 20:50:46',1,'jrzPbKgQ'),(2,1,63,'2019-06-24 20:54:55',1,'R8çhgIOb'),(3,1,64,'2019-06-24 21:14:51',1,'Qley8QNH'),(4,1,65,'2019-06-24 21:21:59',1,'cRHLCHdV'),(5,1,66,'2019-06-24 21:44:20',1,'N4DZ4ofH'),(6,1,66,'2019-06-24 22:13:14',1,'eLV5i7wJ'),(7,1,66,'2019-06-24 22:30:33',1,'vLYfSfJn'),(8,1,66,'2019-06-25 00:03:23',1,'TCCzTYLL'),(9,1,66,'2019-06-25 00:10:17',1,'9SKDjç9K'),(10,1,66,'2019-06-25 00:16:39',1,'NDk7VH9l'),(11,1,66,'2019-06-25 00:22:17',1,'2ZTXozDZ');
/*!40000 ALTER TABLE `cupomTroca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimensoes`
--

DROP TABLE IF EXISTS `dimensoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dimensoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `altura` decimal(5,2) DEFAULT NULL,
  `largura` decimal(5,2) DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `profundidade` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimensoes`
--

LOCK TABLES `dimensoes` WRITE;
/*!40000 ALTER TABLE `dimensoes` DISABLE KEYS */;
INSERT INTO `dimensoes` VALUES (1,1.16,1.13,2.73,0.58),(2,1.55,1.26,3.65,1.75),(3,1.58,0.48,1.27,0.16),(4,0.66,1.00,4.16,1.12),(5,1.73,0.46,0.36,1.34),(6,1.13,0.19,4.18,1.39),(7,0.04,0.74,2.32,0.01),(8,1.81,1.67,4.18,1.33),(9,1.35,0.74,4.06,1.13),(10,1.49,1.37,2.31,0.32),(11,0.97,0.86,0.31,1.46),(12,1.60,2.00,1.04,0.03),(13,1.72,1.91,0.12,1.18),(14,1.68,1.95,1.82,1.62),(15,0.71,0.38,3.93,0.14),(16,1.69,1.42,2.13,1.21),(17,0.70,1.08,1.51,0.82),(18,0.01,1.39,1.56,1.25),(19,0.04,0.94,2.77,0.15),(20,0.83,1.79,3.05,0.49),(21,1.53,1.92,2.28,0.06),(22,0.15,0.79,2.33,1.36),(23,0.31,1.26,1.02,1.04),(24,1.88,1.46,3.58,0.69),(25,0.08,0.36,3.82,1.21),(26,0.71,0.14,1.92,0.19),(27,0.84,1.73,2.92,1.11),(28,0.97,1.09,0.07,0.04),(29,1.53,0.08,1.64,0.18),(30,0.28,0.09,0.19,1.47),(31,0.76,0.50,3.97,0.60),(32,0.78,1.67,0.18,0.32),(33,0.83,0.94,0.73,0.47),(34,0.06,0.89,0.51,0.16),(35,1.43,0.58,3.19,1.88),(36,1.59,0.11,5.00,0.62),(37,1.87,1.64,3.77,1.35),(38,1.54,0.29,2.49,1.88),(39,1.61,0.61,2.99,1.95),(40,0.13,1.40,2.39,0.32),(41,1.13,0.54,2.74,0.40),(42,0.91,0.13,4.05,1.30),(43,1.43,1.53,2.70,1.45),(44,0.02,0.96,1.98,1.49),(45,1.81,0.52,4.70,1.36),(46,1.51,1.90,1.35,1.58),(47,0.61,0.97,0.86,0.77),(48,0.33,0.18,4.62,1.23),(49,1.97,1.89,3.38,0.30),(50,0.34,0.09,3.84,0.84),(51,0.02,0.85,1.87,0.22),(52,1.46,1.29,0.08,1.92),(53,1.57,0.98,4.62,1.18),(54,1.40,0.77,1.90,1.36),(55,0.55,0.45,4.82,1.40),(56,0.68,0.23,3.20,0.31),(57,1.29,1.56,4.71,0.82),(58,0.39,0.86,2.04,0.06),(59,0.72,1.37,2.80,1.57),(60,1.10,0.27,3.39,1.57);
/*!40000 ALTER TABLE `dimensoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `editora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_editora` varchar(155) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` VALUES (1,'Mazza'),(2,'Edelbra'),(3,'Paulinas'),(4,'Cortez'),(5,'Zit'),(6,'Salamandra'),(7,'Biruta'),(8,'DCL'),(9,'Saraiva'),(10,'Autêntica'),(11,'Globo'),(12,'La Fonte'),(13,'DCL'),(14,'Salamandra'),(15,'Jorge Zahar'),(16,'Nova Fronteira'),(17,'Jorge Zahar'),(18,'Rovelle'),(19,'Pulo do Gato'),(20,'ÔZé Editora'),(21,'Verus'),(22,'Edições SM'),(23,'Edelbra'),(24,'Panda Books'),(25,'Pallas'),(26,'Biruta'),(27,'Editora 34'),(28,'Leya'),(29,'Paz e Terra'),(30,'Global'),(31,'Cia das Letrinhas'),(32,'Abril'),(33,'Ática'),(34,'Leya'),(35,'Leya'),(36,'Salamandra'),(37,'Editora 34'),(38,'Projeto'),(39,'Cortez'),(40,'Editora do Brasil'),(41,'Salamandra'),(42,'Positivo'),(43,'La Fonte'),(44,'Editora 34'),(45,'Abril'),(46,'DSOP'),(47,'Peirópolis'),(48,'Manati'),(49,'Mundo-Mirim'),(50,'Paulus'),(51,'Ediouro'),(52,'Planeta do Brasil'),(53,'Zit'),(54,'Sextante'),(55,'Paulinas'),(56,'Callis'),(57,'Dedo de Prosa'),(58,'Zit'),(59,'La Fonte'),(60,'Cortez');
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
  `tipoEndereco` varchar(50) NOT NULL DEFAULT '0',
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_idx` (`id_cliente`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Rua um','12312','cubas','12312312312312','Mogi','SP','vila','Casa','apt 2','null','1',1),(2,'Rua Pedro Paulo','12312','cubas','12312312312312','Mogi','SP','vila','Casa da avÃ³','apt 2',NULL,'1',2),(3,'Rua Cardoso de Siqueira','12312','cubas','12312312312312','Mogi','SP','vila','Casa da avÃ³','apt 2',NULL,'1',3),(4,'Rua Deodato','12312','cubas','12312312312312','Mogi','SP','vila','Casa da avÃ³','apt 2',NULL,'1',4),(5,'A.V brasil','664','cubas','09870-090','Mogi das cruzes','SP','vila','Casa da vÃ³','Apt 22','Proximo ao mercado','0',1),(6,'A.V brasil','664','cubas','09870-090','Nova mogi','SP','vila','Casa da vÃ³','Apt 22','Proximo ao mercado','0',1),(7,'Rua Rodrigues Filho','12312','cubas','12312312312312','Mogi','SP','vila','Casa da avó','apt 2',NULL,'1',3),(8,'Rua Sao Joao','12312','cubas','12312312312312','Mogi','SP','vila','Casa da avó','apt 2',NULL,'1',4);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_livro` int(11) NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_custo` decimal(5,2) NOT NULL,
  `dt_entrada` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_estoque_livro_idx` (`id_livro`),
  KEY `fk_estoque_fornecedor_idx` (`id_fornecedor`),
  CONSTRAINT `fk_estoque_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,1,1,17,30.09,'2019-01-20 04:50:25'),(2,2,2,8,35.90,'2019-01-20 04:51:15'),(3,3,3,4,97.90,'2019-01-20 04:52:11'),(4,4,4,13,95.68,'2019-01-20 04:52:27'),(5,5,5,15,88.44,'2019-01-20 04:53:01'),(6,6,6,16,78.09,'2019-01-20 04:53:37'),(7,7,7,17,78.37,'2019-01-20 04:54:12'),(8,8,8,19,80.45,'2019-01-20 04:54:35'),(9,9,9,19,31.71,'2019-01-20 04:54:53'),(10,10,10,19,34.67,'2019-01-20 04:55:11'),(11,11,11,17,35.63,'2019-02-20 07:00:59'),(12,12,12,19,63.20,'2019-02-20 07:01:35'),(13,13,13,13,90.24,'2019-02-20 07:03:44'),(14,14,14,19,45.10,'2019-02-20 07:04:07'),(15,15,15,18,31.04,'2019-02-20 07:04:19'),(16,16,16,20,42.34,'2019-02-20 07:04:33'),(17,17,17,19,35.85,'2019-02-20 07:04:47'),(18,18,18,19,43.36,'2019-02-20 07:05:10'),(19,19,19,19,92.17,'2019-02-20 07:05:26'),(20,20,20,19,31.25,'2019-02-20 07:05:44'),(21,21,21,19,70.92,'2019-03-20 07:06:39'),(22,22,22,19,52.56,'2019-03-20 07:07:39'),(23,23,23,19,49.00,'2019-03-20 07:08:23'),(24,24,24,20,52.85,'2019-03-20 07:08:34'),(25,25,25,19,95.98,'2019-03-20 07:08:44'),(26,26,26,20,33.45,'2019-03-20 07:08:54'),(27,27,27,20,32.38,'2019-03-20 07:09:44'),(28,28,28,20,70.17,'2019-03-20 07:09:52'),(29,29,29,20,82.02,'2019-03-20 07:10:01'),(30,30,30,20,64.10,'2019-03-20 07:10:16'),(31,31,31,20,49.98,'2019-04-20 07:10:51'),(32,32,32,20,67.97,'2019-04-20 07:10:59'),(33,33,33,20,90.07,'2019-04-20 07:11:08'),(34,34,34,20,80.68,'2019-04-20 07:11:16'),(35,35,35,20,63.51,'2019-04-20 07:11:25'),(36,36,36,20,31.57,'2019-04-20 07:11:34'),(37,37,37,20,82.30,'2019-04-20 07:11:41'),(38,38,38,20,44.90,'2019-04-20 07:12:22'),(39,39,39,20,71.50,'2019-04-20 07:12:32'),(40,40,40,20,87.21,'2019-04-20 07:12:40'),(41,41,41,20,33.02,'2019-05-20 07:13:22'),(42,42,42,20,60.13,'2019-05-20 07:13:33'),(43,43,43,20,99.43,'2019-05-20 07:13:44'),(44,44,44,20,80.98,'2019-05-20 07:13:52'),(45,45,45,20,39.07,'2019-05-20 07:14:00'),(46,46,46,20,90.30,'2019-05-20 07:14:11'),(47,47,47,20,94.21,'2019-05-20 07:14:30'),(48,48,48,20,33.74,'2019-05-20 07:16:40'),(49,49,49,20,83.28,'2019-05-20 07:16:48'),(50,50,50,20,37.22,'2019-05-20 07:17:12'),(51,51,51,19,78.46,'2019-06-20 07:18:04'),(52,52,52,19,38.21,'2019-06-20 07:18:13'),(53,53,53,20,81.95,'2019-06-20 07:18:23'),(54,54,54,19,57.74,'2019-06-20 07:18:39'),(55,55,55,19,93.33,'2019-06-20 07:18:48'),(56,56,56,20,60.15,'2019-06-20 07:18:56'),(57,57,57,20,73.18,'2019-06-20 07:19:07'),(58,58,58,19,54.56,'2019-06-20 07:19:14'),(59,59,59,19,47.79,'2019-06-20 07:19:23'),(60,60,60,19,79.18,'2019-06-20 07:19:33');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fornecedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fornecedor` varchar(45) DEFAULT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `razao_social` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(2,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(3,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(4,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(5,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(6,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(7,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(8,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(9,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(10,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(11,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(12,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(13,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(14,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(15,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(16,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(17,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(18,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(19,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(20,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(21,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(22,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(23,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(24,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(25,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(26,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(27,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(28,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(29,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(30,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(31,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(32,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(33,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(34,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(35,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(36,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(37,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(38,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(39,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(40,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(41,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(42,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(43,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(44,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(45,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(46,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(47,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(48,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(49,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(50,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(51,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(52,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(53,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(54,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(55,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(56,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(57,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(58,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(59,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(60,'RS livros','78.180.862/0001-30','Cia dos Livros ltda');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupolivro`
--

DROP TABLE IF EXISTS `grupolivro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `grupolivro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_grupolivro` varchar(155) DEFAULT NULL,
  `margem_lucro` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupolivro`
--

LOCK TABLES `grupolivro` WRITE;
/*!40000 ALTER TABLE `grupolivro` DISABLE KEYS */;
INSERT INTO `grupolivro` VALUES (1,NULL,0),(2,'Lancamento23',13),(3,'Lancamento',45),(4,'Liquidacao',20),(5,'Teste',12),(6,'Serial',11),(7,'Rarissimos',90),(8,'Nerds',22);
/*!40000 ALTER TABLE `grupolivro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isbn`
--

DROP TABLE IF EXISTS `isbn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `isbn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_barras` varchar(155) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isbn`
--

LOCK TABLES `isbn` WRITE;
/*!40000 ALTER TABLE `isbn` DISABLE KEYS */;
INSERT INTO `isbn` VALUES (1,'87'),(2,'74'),(3,'40'),(4,'15'),(5,'95'),(6,'73'),(7,'56'),(8,'79'),(9,'7'),(10,'54'),(11,'89'),(12,'96'),(13,'4'),(14,'55'),(15,'88'),(16,'18'),(17,'11'),(18,'7'),(19,'3'),(20,'71'),(21,'93'),(22,'67'),(23,'19'),(24,'56'),(25,'90'),(26,'40'),(27,'74'),(28,'14'),(29,'55'),(30,'45'),(31,'92'),(32,'18'),(33,'94'),(34,'12'),(35,'31'),(36,'62'),(37,'16'),(38,'63'),(39,'52'),(40,'43'),(41,'57'),(42,'44'),(43,'30'),(44,'28'),(45,'59'),(46,'22'),(47,'70'),(48,'52'),(49,'33'),(50,'53'),(51,'8'),(52,'86'),(53,'84'),(54,'60'),(55,'58'),(56,'87'),(57,'33'),(58,'98'),(59,'38'),(60,'26');
/*!40000 ALTER TABLE `isbn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item` (
  `id_livro` int(11) NOT NULL,
  `qt_livros` int(11) NOT NULL,
  KEY `fk_item_livro_idx` (`id_livro`),
  CONSTRAINT `fk_item_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemPedido`
--

DROP TABLE IF EXISTS `itemPedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `itemPedido` (
  `quantidade` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  KEY `fk_itemPedido_livro_idx` (`id_livro`),
  KEY `fk_itemPedido_pedido_idx` (`id_pedido`),
  CONSTRAINT `fk_itemPedido_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id`),
  CONSTRAINT `fk_itemPedido_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemPedido`
--

LOCK TABLES `itemPedido` WRITE;
/*!40000 ALTER TABLE `itemPedido` DISABLE KEYS */;
INSERT INTO `itemPedido` VALUES (1,1,1),(1,2,2),(1,3,3),(1,4,4),(1,5,5),(1,6,6),(1,7,7),(1,8,8),(1,9,9),(1,10,10),(1,3,11),(1,3,12),(1,4,13),(1,11,14),(1,12,15),(1,13,16),(1,15,17),(1,3,18),(1,3,19),(1,1,20),(1,6,21),(1,5,22),(1,3,23),(1,3,24),(1,1,25),(1,5,26),(1,3,27),(1,3,28),(1,7,29),(1,11,30),(1,13,31),(1,5,32),(1,13,33),(1,3,34),(1,13,35),(1,11,36),(1,14,37),(1,17,38),(1,18,39),(1,13,40),(1,22,41),(1,15,42),(1,13,43),(1,20,44),(1,19,45),(1,21,46),(1,6,47),(1,7,48),(1,60,49),(1,59,50),(1,58,51),(1,23,52),(1,55,53),(1,54,54),(1,3,55),(1,13,56),(1,52,57),(1,51,58),(1,6,59),(1,2,60),(1,3,61),(1,5,62),(1,25,63),(1,3,64),(1,3,65),(1,2,66);
/*!40000 ALTER TABLE `itemPedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
  `imagem` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_livro_editora_idx` (`id_editora`),
  KEY `fk_livro_isbn_idx` (`id_isbn`),
  KEY `fk_livro_grupoLivro_idx` (`id_grupolivro`),
  KEY `fk_livro_dimensoes_idx` (`id_dimensao`),
  CONSTRAINT `fk_livro_dimensoes` FOREIGN KEY (`id_dimensao`) REFERENCES `dimensoes` (`id`),
  CONSTRAINT `fk_livro_editora` FOREIGN KEY (`id_editora`) REFERENCES `editora` (`id`),
  CONSTRAINT `fk_livro_grupoLivro` FOREIGN KEY (`id_grupolivro`) REFERENCES `grupolivro` (`id`),
  CONSTRAINT `fk_livro_isbn` FOREIGN KEY (`id_isbn`) REFERENCES `isbn` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'87','Cooper U. Owens','Primavera Silenciosa','14/09/2018','8','5139','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id,',1,30.09,7,1,1,2,'1.jpg'),(2,'74','Mannix Y. Hess','Uma Dobra no Tempo','26/12/2019','2','4061','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum',1,35.90,6,2,2,7,'2.jpg'),(3,'40','Noble G. Dunlap','Amada','01/04/2019','6','6936','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.',1,97.90,9,3,3,3,'3.jpg'),(4,'15','Willa T. Maynard','Cozinhar: Uma História Natural Da Transformação','12/06/2020','2','7341','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat.',1,95.68,10,4,4,1,'4.jpg'),(5,'95','Ingrid U. Sparks','A Vida Imortal de Henrietta Lacks','06/09/2018','4','2738','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam',1,88.44,9,5,5,3,'5.jpg'),(6,'73','Yasir D. Weaver','O Sol Também Se Levanta','10/04/2020','1','0331','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet',1,78.09,3,6,6,4,'6.jpg'),(7,'56','Quinn E. Quinn','Uma Comovente Obra de Espantoso Talento','17/02/2020','3','6126','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus',1,78.37,9,7,7,5,'7.jpg'),(8,'79','Ferdinand T. Frye','O Ano do Pensamento Mágico','02/09/2018','8','2014','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at',1,80.45,4,8,8,8,'8.jpg'),(9,'7','Oprah J. Klein','As Incríveis Aventuras de Kavalier e Clay','17/08/2018','9','7488','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna.',1,31.71,6,9,9,2,'9.jpg'),(10,'54','Irma U. Browning','O Fio da Vida','15/08/2018','2','3747','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna.',1,34.67,10,10,10,1,'10.jpg'),(11,'89','Cleo Z. Bowers','Os Filhos da Meia-Noite','30/04/2019','2','9334','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed',1,35.63,5,11,11,7,'11.jpg'),(12,'96','Shad J. Patton','A Menina Que Roubava Livros','09/09/2019','4','9635','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.',1,63.20,2,12,12,7,'12.jpg'),(13,'4','Samuel K. Lawson','Love Medicine','15/05/2020','4','8958','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et',1,90.24,7,13,13,7,'13.jpg'),(14,'55','Salvador S. Oneill','Uma Casa na Campina','04/03/2020','6','4007','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque',1,45.10,6,14,14,4,'14.jpg'),(15,'88','Louis G. Mason','O Iluminado','29/09/2019','7','4084','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis',1,31.04,3,15,15,7,'15.jpg'),(16,'18','Gage P. Leon','The Right Stuff','11/07/2019','8','6127','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing',1,42.34,5,16,16,4,'16.jpg'),(17,'11','Meredith S. Carroll','Todos os Homens do Presidente','05/03/2020','5','0902','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna.',1,35.85,4,17,17,7,'17.jpg'),(18,'7','Dexter G. Keith','Where the Sidewalk Ends','02/10/2019','7','7714','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam',1,43.36,2,18,18,7,'18.jpg'),(19,'3','Steel U. Washington','Invencível','15/04/2019','3','4230','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum',1,92.17,5,19,19,2,'19.jpg'),(20,'71','Martha U. Maxwell','Homem Invisível','01/10/2018','6','9905','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer',1,31.25,10,20,20,2,'20.jpg'),(21,'93','Ross N. Horn','A Casa no Cantinho do Puff','21/02/2019','2','7512','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec',1,70.92,3,21,21,8,'21.jpg'),(22,'67','Fallon T. Joseph','Jogos Vorazes','01/10/2018','9','6957','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.',1,52.56,3,22,22,2,'22.jpg'),(23,'19','Jennifer G. Richards','Where the Sidewalk Ends','21/05/2019','1','7074','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada',1,49.00,8,23,23,7,'23.jpg'),(24,'56','Tallulah I. Carney','Moneyball: O Homem que Mudou o Jogo','19/01/2019','5','7914','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien,',1,52.85,7,24,24,6,'24.jpg'),(25,'90','Keefe J. Blanchard','Out of Africa','10/11/2019','6','6191','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',1,95.98,6,25,25,7,'25.jpg'),(26,'40','Clementine C. Landry','Tudo Depende de Como Você Vê As Coisas','23/10/2019','2','6566','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum',1,33.45,9,26,26,7,'26.jpg'),(27,'74','Price X. Moody','The Liars’ Club: A Memoir','23/10/2019','9','2464','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa',1,32.38,10,27,27,3,'27.jpg'),(28,'14','Timon R. Lyons','Uma Casa na Campina','10/09/2018','6','1222','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada',1,70.17,7,28,28,7,'28.jpg'),(29,'55','Eric H. Jordan','O Ladrão de Raios (Percy Jackson e Os Olimpianos)','01/09/2018','3','6309','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus',1,82.02,7,29,29,2,'29.jpg'),(30,'45','Yolanda K. Barber','A Menina e o Porquinho','18/10/2019','2','1144','Lorem ipsum dolor sit',1,64.10,10,30,30,8,'30.jpg'),(31,'92','Keane A. Mccray','Love Medicine','15/08/2018','7','3293','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at',1,49.98,8,31,31,1,'31.jpg'),(32,'18','Chandler I. Montoya','Onde Vivem os Monstros','05/12/2019','4','4689','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada',1,67.97,7,32,32,8,'32.jpg'),(33,'94','Uriah Y. Hogan','Boa Noite, Lua','09/11/2019','7','5024','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer',1,90.07,8,33,33,8,'33.jpg'),(34,'12','Alma S. Alexander','Homem Invisível','18/04/2020','5','5286','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat.',1,80.68,6,34,34,3,'34.jpg'),(35,'31','Rama U. Carter','O Sol Também Se Levanta','05/01/2019','5','8731','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa',1,63.51,4,35,35,1,'35.jpg'),(36,'62','Uma H. Waters','A Bíblia Envenenada','16/12/2018','4','8627','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam',1,31.57,4,36,36,7,'36.jpg'),(37,'16','Nichole Q. Perry','Os Filhos da Meia-Noite','12/04/2019','9','0981','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut',1,82.30,2,37,37,3,'37.jpg'),(38,'63','Raja L. Carrillo','O Pequeno Príncipe','21/09/2018','9','7673','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum',1,44.90,6,38,38,2,'38.jpg'),(39,'52','Hayley T. Stephens','Uma Casa na Campina','14/10/2019','1','2390','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id,',1,71.50,2,39,39,2,'39.jpg'),(40,'43','Abigail V. Rhodes','A Sangue Frio','01/09/2018','7','2607','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque',1,87.21,6,40,40,1,'40.jpg'),(41,'57','MacKensie I. Harper','The Things They Carried','18/08/2019','2','0852','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id,',1,33.02,7,41,41,2,'41.jpg'),(42,'44','Georgia V. Daniels','As Cinzas de Angela','26/05/2019','5','5721','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus.',1,60.13,6,42,42,4,'42.jpg'),(43,'30','Shelley E. Vazquez','Cozinhar: Uma História Natural Da Transformação','17/07/2019','3','2262','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper.',1,99.43,8,43,43,1,'43.jpg'),(44,'28','Alexis J. Mccullough','O Mundo se Despedaça','08/08/2018','5','4995','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien,',1,80.98,2,44,44,8,'44.jpg'),(45,'59','Yvonne K. Odonnell','Harry Potter e a Pedra Filosofal','23/09/2018','7','8904','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus.',1,39.07,5,45,45,3,'45.jpg'),(46,'22','Ulla I. Morin','A Menina Que Roubava Livros','30/11/2018','5','2588','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis',1,90.30,6,46,46,1,'46.jpg'),(47,'70','Sopoline N. Franklin','The Right Stuff','27/12/2019','2','0258','Lorem ipsum dolor sit amet,',1,94.21,6,47,47,5,'47.jpg'),(48,'52','Aidan C. Atkins','Love Medicine','16/04/2019','6','7448','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada',1,33.74,8,48,48,8,'48.jpg'),(49,'33','Sierra C. Barnes','A Bússola De Ouro','15/05/2019','8','8235','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna.',1,83.28,6,49,49,7,'49.jpg'),(50,'53','Galena Q. Hickman','Lincoln','17/07/2018','3','1024','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum',1,37.22,9,50,50,3,'50.jpg'),(51,'8','Hedley S. Benjamin','The Right Stuff','30/07/2018','4','7396','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non,',1,78.46,3,51,51,2,'51.jpg'),(52,'86','Lacy Y. Kim','O Fio da Vida','01/04/2020','7','2479','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus',1,38.21,8,52,52,2,'52.jpg'),(53,'84','Fuller W. Wise','Tudo Depende de Como Você Vê As Coisas','13/04/2020','5','4032','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing',1,81.95,10,53,53,5,'53.jpg'),(54,'60','Calvin X. Zimmerman','Orgulho e Preconceito','26/06/2019','6','9493','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed',1,57.74,1,54,54,3,'54.jpg'),(55,'58','Gloria J. Bell','O Mundo Segundo Garp','29/01/2019','4','2504','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum',1,93.33,9,55,55,2,'55.jpg'),(56,'87','Wang A. Thomas','Mau Começo','03/05/2019','9','9232','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam',1,60.15,10,56,56,2,'56.jpg'),(57,'33','Karleigh R. Murray','O Décimo Primeiro Mandamento','21/03/2020','1','4390','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at',1,73.18,4,57,57,4,'57.jpg'),(58,'98','Solomon N. Stark','O Ano do Pensamento Mágico','03/03/2019','3','0265','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut',1,54.56,8,58,58,1,'58.jpg'),(59,'38','Demetrius S. Pennington','Uma Casa na Campina','09/08/2019','1','9435','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis',1,47.79,6,59,59,5,'59.jpg'),(60,'26','Anne L. Obrien','Lolita','27/03/2020','9','0972','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at',1,79.18,2,60,60,6,'60.jpg');
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro_categoria`
--

DROP TABLE IF EXISTS `livro_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `livro_categoria` (
  `id_livro` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_livro`,`id_categoria`),
  KEY `fk_categoria_idx` (`id_categoria`),
  CONSTRAINT `fk_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`),
  CONSTRAINT `fk_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro_categoria`
--

LOCK TABLES `livro_categoria` WRITE;
/*!40000 ALTER TABLE `livro_categoria` DISABLE KEYS */;
INSERT INTO `livro_categoria` VALUES (11,1),(12,1),(23,1),(27,1),(38,1),(40,1),(44,1),(45,1),(50,1),(25,2),(28,2),(43,2),(46,2),(54,2),(56,2),(14,3),(16,3),(20,3),(21,3),(26,3),(30,3),(37,3),(57,3),(2,4),(5,4),(8,4),(10,4),(13,4),(17,4),(34,4),(41,4),(60,4),(42,5),(3,6),(22,6),(31,6),(35,6),(52,6),(55,6),(18,7),(39,7),(48,7),(15,8),(32,8),(33,8),(49,8),(51,8),(53,8),(6,9),(7,9),(1,10),(24,10),(29,10),(36,10),(4,11),(9,11),(19,11),(47,11),(58,11),(59,11);
/*!40000 ALTER TABLE `livro_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamentoCartao`
--

DROP TABLE IF EXISTS `pagamentoCartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pagamentoCartao` (
  `id_pedido` int(11) NOT NULL,
  `id_cartao` int(11) NOT NULL,
  `valor` double NOT NULL,
  KEY `fk_pagamentoCartao_pedido_idx` (`id_pedido`),
  KEY `fk_pagamentoCartao_cartao_idx` (`id_cartao`),
  CONSTRAINT `fk_pagamentoCartao_cartao` FOREIGN KEY (`id_cartao`) REFERENCES `cartao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pagamentoCartao_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamentoCartao`
--

LOCK TABLES `pagamentoCartao` WRITE;
/*!40000 ALTER TABLE `pagamentoCartao` DISABLE KEYS */;
INSERT INTO `pagamentoCartao` VALUES (1,1,38.42),(2,1,129.6),(3,1,205.83),(4,1,95.68),(5,1,185.95),(6,1,112.45),(7,1,98.31),(8,1,119.74),(9,1,40.49),(10,1,34.67),(11,1,205.83),(12,1,205.83),(13,1,95.68),(14,1,128.62),(15,1,228.15),(16,1,325.77),(17,2,112.05),(18,1,205.83),(19,1,205.83),(20,1,38.42),(21,1,112.45),(22,1,185.95),(23,1,205.83),(24,1,205.83),(25,1,38.42),(26,1,185.95),(27,1,205.83),(28,1,205.83),(29,1,98.31),(30,1,128.62),(31,1,325.77),(32,1,185.95),(33,1,325.77),(34,1,205.83),(35,1,325.77),(36,1,128.62),(37,2,64.94),(38,1,129.42),(39,1,156.53),(40,1,325.77),(41,1,67.11),(42,1,112.05),(43,1,325.77),(44,1,39.9),(45,1,117.69),(46,1,105.56),(47,1,112.45),(48,1,98.31),(49,1,97.56),(50,1,59.95),(51,1,54.56),(52,1,176.89),(53,1,119.17),(54,1,121.4),(55,1,205.83),(56,1,325.77),(57,1,48.79),(58,1,100.19),(59,1,112.45),(60,1,129.6),(61,1,205.83),(62,1,185.95),(63,1,346.49),(64,1,141.96),(65,1,141.96),(66,1,68.21);
/*!40000 ALTER TABLE `pagamentoCartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_statusPedido` int(11) DEFAULT '1',
  `id_endereco` int(11) NOT NULL,
  `dt_pedido` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `valorTotal` double NOT NULL,
  `cupomDesconto` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,3,5,'2019-01-24 18:24:57',38.421921,0),(2,1,3,5,'2019-01-24 18:25:26',129.59900000000002,0),(3,1,3,5,'2019-01-24 18:25:56',205.83475,0),(4,1,3,5,'2019-01-24 18:26:27',95.68,0),(5,1,3,5,'2019-01-24 18:26:54',185.9451,0),(6,1,3,5,'2019-01-24 18:27:23',112.4496,0),(7,1,3,5,'2019-01-24 18:27:52',98.307328,0),(8,1,3,5,'2019-01-24 18:28:22',119.74178,0),(9,1,3,5,'2019-01-24 18:29:06',40.49049900000001,0),(10,1,3,6,'2019-01-24 18:31:06',34.67,0),(11,1,3,6,'2019-01-24 18:31:35',205.83475,0),(12,1,3,6,'2019-02-24 19:34:12',205.83475,0),(13,1,3,6,'2019-02-24 19:34:47',95.68,0),(14,1,3,6,'2019-02-24 19:35:19',128.6243,0),(15,1,3,6,'2019-02-24 19:35:56',228.15200000000004,0),(16,1,3,6,'2019-02-24 19:37:07',325.7664,0),(17,1,3,6,'2019-02-24 19:38:28',112.0544,0),(18,1,3,6,'2019-02-24 19:39:01',205.83475,0),(19,1,3,6,'2019-02-24 19:40:54',205.83475,0),(20,1,3,6,'2019-02-24 19:41:28',38.421921,0),(21,1,3,6,'2019-02-24 19:42:09',112.4496,0),(22,1,3,6,'2019-02-24 19:42:46',185.9451,0),(23,1,3,6,'2019-02-24 19:43:13',205.83475,0),(24,1,3,6,'2019-03-24 19:43:58',205.83475,0),(25,1,3,6,'2019-03-24 19:44:35',38.421921,0),(26,1,3,6,'2019-03-24 19:45:11',185.9451,0),(27,1,3,6,'2019-03-24 19:45:47',205.83475,0),(28,1,3,6,'2019-03-24 19:48:25',205.83475,0),(29,1,3,6,'2019-03-24 19:49:55',98.307328,0),(30,1,3,6,'2019-03-24 19:50:32',128.6243,0),(31,1,3,6,'2019-03-24 19:51:11',325.7664,0),(32,1,3,6,'2019-03-24 19:53:43',185.9451,0),(33,1,3,6,'2019-03-24 19:54:36',325.7664,0),(34,1,3,5,'2019-04-24 19:55:52',205.83475,0),(35,1,3,5,'2019-04-24 19:56:27',325.7664,0),(36,1,3,5,'2019-04-24 19:56:55',128.6243,0),(37,1,3,5,'2019-04-24 19:57:28',64.944,0),(38,1,3,5,'2019-04-24 19:58:05',129.41850000000002,0),(39,1,3,5,'2019-04-24 19:58:50',156.52960000000002,0),(40,1,3,6,'2019-05-24 20:02:19',325.7664,0),(41,1,3,6,'2019-05-24 20:03:11',67.113864,0),(42,1,3,6,'2019-05-24 20:05:28',112.0544,0),(43,1,3,6,'2019-05-24 20:06:08',325.7664,0),(44,1,3,6,'2019-05-24 20:06:49',39.903125,0),(45,1,3,6,'2019-05-24 20:07:39',117.691873,0),(46,1,3,6,'2019-05-24 20:08:33',105.55732800000001,0),(47,1,3,6,'2019-05-24 20:09:19',112.4496,0),(48,1,3,6,'2019-05-24 20:10:02',98.307328,0),(49,1,3,6,'2019-05-24 20:10:34',97.55767800000001,0),(50,1,3,6,'2019-05-24 20:11:03',59.947776,0),(51,1,3,6,'2019-05-24 20:11:48',54.56,0),(52,1,3,6,'2019-05-24 20:13:07',176.89,0),(53,1,3,5,'2019-06-24 20:14:27',119.17307699999999,0),(54,1,3,5,'2019-06-24 20:17:23',121.39835,0),(55,1,3,5,'2019-06-24 20:18:25',205.83475,0),(56,1,3,5,'2019-06-24 20:19:28',325.7664,0),(57,1,3,5,'2019-06-24 20:20:03',48.790349000000006,0),(58,1,3,5,'2019-06-24 20:20:41',100.18557399999999,0),(59,1,3,5,'2019-06-24 20:21:17',112.4496,0),(60,1,3,5,'2019-06-24 20:21:48',129.59900000000002,0),(61,1,3,5,'2019-06-24 20:22:22',205.83475,0),(62,1,3,5,'2019-06-24 20:22:46',185.9451,0),(63,1,7,5,'2019-06-24 20:23:30',346.48780000000005,0),(64,1,7,5,'2019-06-24 20:45:55',141.955,0),(65,1,7,6,'2019-06-24 21:19:05',141.955,0),(66,1,5,6,'2019-06-25 00:21:14',68.21000000000001,0);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pgtoCupomDesconto`
--

DROP TABLE IF EXISTS `pgtoCupomDesconto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pgtoCupomDesconto` (
  `id_pedido` int(11) NOT NULL,
  `id_cupom` int(11) NOT NULL,
  KEY `fk_pagamento_cupom_idx` (`id_cupom`),
  KEY `fk_pgtoCupomDesconto_pedido_idx` (`id_pedido`),
  CONSTRAINT `fk_pgtoCupomDesconto_cupom` FOREIGN KEY (`id_cupom`) REFERENCES `cupomDesconto` (`id`),
  CONSTRAINT `fk_pgtoCupomDesconto_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pgtoCupomDesconto`
--

LOCK TABLES `pgtoCupomDesconto` WRITE;
/*!40000 ALTER TABLE `pgtoCupomDesconto` DISABLE KEYS */;
/*!40000 ALTER TABLE `pgtoCupomDesconto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacaoTroca`
--

DROP TABLE IF EXISTS `solicitacaoTroca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `solicitacaoTroca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `data_solicitacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_solicitacaoTroca_pedido_idx` (`id_pedido`),
  KEY `fk_solicitacaoTroca_cliente_idx` (`id_cliente`),
  CONSTRAINT `fk_solicitacaoTroca_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_solicitacaoTroca_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacaoTroca`
--

LOCK TABLES `solicitacaoTroca` WRITE;
/*!40000 ALTER TABLE `solicitacaoTroca` DISABLE KEYS */;
INSERT INTO `solicitacaoTroca` VALUES (1,1,66,'2019-06-25 00:21:59',0);
/*!40000 ALTER TABLE `solicitacaoTroca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusPedido`
--

DROP TABLE IF EXISTS `statusPedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `statusPedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(155) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusPedido`
--

LOCK TABLES `statusPedido` WRITE;
/*!40000 ALTER TABLE `statusPedido` DISABLE KEYS */;
INSERT INTO `statusPedido` VALUES (1,'EM_PROGRESSO'),(2,'EM_TRANSPORTE'),(3,'ENTREGUE'),(4,'EM_TROCA'),(5,'APROVADO'),(6,'REPROVADO'),(7,'TROCADO');
/*!40000 ALTER TABLE `statusPedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `papel` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'comum'),(2,'adm'),(3,'root');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2019-06-26  6:27:58
