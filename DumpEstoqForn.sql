-- MySQL dump 10.13  Distrib 8.0.16, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Ecommerce
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
-- Table structure for table `carrinho`
--

DROP TABLE IF EXISTS `carrinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `carrinho` (
  `id_livro` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
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
INSERT INTO `carrinho` VALUES (3,1),(1,1),(3,1);
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
  `bandeira` varchar(155) NOT NULL,
  `numero` varchar(155) NOT NULL,
  `codSeguranca` varchar(155) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente_idx` (`id_cliente`),
  CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao`
--

LOCK TABLES `cartao` WRITE;
/*!40000 ALTER TABLE `cartao` DISABLE KEYS */;
INSERT INTO `cartao` VALUES (1,'JOAO DA SILVA','2019-09-09','mastercard','2321321','033',1),(2,'CARTAO NOVO PORRA','2019-09-09','mastercard','2321321','033',1),(3,'2','2019-09-09','Visa','2321321','2123',1),(4,'JOAO DA SILVA','2019-09-09','elo','123123113','033',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'2terror2'),(2,'comedia'),(3,'didatico'),(4,'suspense'),(5,'drama'),(6,'acao'),(7,'faroeste2'),(8,'romance');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Edner','SobrenomeTeste','1995-01-12',1,50,'SenhaValida!@#','emailteste@teste.com','41656190869','329702760','M','1'),(2,'ALTERANDO TESTE','SobrenomeTeste','1995-01-12',1,50,'SenhaValida!@#','adm@adm.com','45296735889','329702760','M','2');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupomDesconto`
--

LOCK TABLES `cupomDesconto` WRITE;
/*!40000 ALTER TABLE `cupomDesconto` DISABLE KEYS */;
INSERT INTO `cupomDesconto` VALUES (2,'radio',20,'2020-05-12');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupomTroca`
--

LOCK TABLES `cupomTroca` WRITE;
/*!40000 ALTER TABLE `cupomTroca` DISABLE KEYS */;
INSERT INTO `cupomTroca` VALUES (1,1,1,'2019-05-14 00:10:05'),(2,1,1,'2019-05-14 00:14:52'),(3,1,1,'2019-05-14 14:33:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimensoes`
--

LOCK TABLES `dimensoes` WRITE;
/*!40000 ALTER TABLE `dimensoes` DISABLE KEYS */;
INSERT INTO `dimensoes` VALUES (1,20.00,14.00,20.00,4.00),(2,20.00,14.00,1.50,4.00),(3,20.00,14.00,20.00,4.00),(4,20.00,14.00,1.50,4.00),(5,20.00,14.00,1.50,4.00),(6,20.00,14.00,1.50,4.00),(7,20.00,14.00,1.50,4.00),(8,20.00,14.00,1.50,4.00),(9,20.00,1.33,1.50,4.00),(10,20.00,14.00,1.50,4.00),(11,20.00,14.00,1.50,4.00),(12,20.00,14.00,1.50,4.00),(13,20.00,14.00,1.50,4.00),(14,20.00,14.00,1.50,4.00),(15,20.00,14.00,1.50,4.00),(16,20.00,14.00,1.50,4.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` VALUES (1,'Abril'),(2,'Abril'),(3,'Abril'),(4,'Abril'),(5,'Abril'),(6,'Abril'),(7,'Abril'),(8,'Abril'),(9,'Abril'),(10,'Abril'),(11,'Abril'),(12,'Abril'),(13,'Abril'),(14,'Abril'),(15,'Abril'),(16,'Abril'),(17,'Abril'),(18,'Abril');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'BABACA','12312','cubas','12312312312312','Mogi','SP','vila','Casa','apt 2','null','1',1),(2,'Rua tranÃ§as do rei careca','12312','cubas','12312312312312','Mogi','SP','vila','Casa da avÃ³','apt 2',NULL,'1',2),(3,'Rua tranÃ§as do rei careca','12312','cubas','12312312312312','Mogi','SP','vila','Casa da avÃ³','apt 2',NULL,'1',3),(4,'Rua tranÃ§as do rei careca','12312','cubas','12312312312312','Mogi','SP','vila','Casa da avÃ³','apt 2',NULL,'1',4),(5,'A.V brasil','664','cubas','09870-090','Mogi das cruzes','SP','vila','Casa da vÃ³','Apt 22','Proximo ao mercado','0',1),(6,'A.V brasil','664','cubas','09870-090','Nova mogi','SP','vila','Casa da vÃ³','Apt 22','Proximo ao mercado','0',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,2,1,20,49.99,'2019-05-24 01:07:41'),(2,4,2,20,49.99,'2019-05-24 01:08:08'),(3,3,3,20,49.99,'2019-05-24 01:08:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(2,'RS livros','78.180.862/0001-30','Cia dos Livros ltda'),(3,'RS livros','78.180.862/0001-30','Cia dos Livros ltda');
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
INSERT INTO `grupolivro` VALUES (1,NULL,0),(2,'Lancamento23',13),(3,'lancamento',45),(4,'liquidacao',20),(5,'teste',12),(6,'serial',11),(7,'rarissimos',90),(8,'nerds',22);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isbn`
--

LOCK TABLES `isbn` WRITE;
/*!40000 ALTER TABLE `isbn` DISABLE KEYS */;
INSERT INTO `isbn` VALUES (1,'2423432'),(2,'242343212'),(3,'2423123432'),(4,'2423432'),(5,'2423432'),(6,'2423432'),(7,'2423432'),(8,'2423432'),(9,'2423432'),(10,'2423432'),(11,'2423432'),(12,'2423432'),(13,'2423432'),(14,'2423432'),(15,'2423432'),(16,'2423432');
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
INSERT INTO `item` VALUES (2,40),(1,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'20','sei la','O exorcista','02/02/1999','2','222','Esse exemplo da sinopse de um livro',1,49.99,15,13,13,6,'exorcista.jpg'),(2,'20','autor teste','Pelé eterno','02/02/1999','2','222','Esse exemplo da sinopse de um livro',1,49.99,16,14,14,5,'pele.jpg'),(3,'20','autor teste','Java para burros','02/02/1999','2','222','Esse exemplo da sinopse de um livro',1,49.99,17,15,15,3,'java.jpg'),(4,'20','autor teste','Livro livro','02/02/1999','2','222','Esse exemplo da sinopse de um livro',1,49.99,18,16,16,4,'livro1.jpg');
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
INSERT INTO `livro_categoria` VALUES (1,1),(3,1),(4,1),(5,1),(8,1),(10,1),(5,2),(6,2),(7,2),(8,2),(10,2),(2,3),(3,3),(4,3),(6,3),(7,3),(11,5),(2,6),(4,6),(12,6),(4,7),(9,7),(11,7),(12,7);
/*!40000 ALTER TABLE `livro_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pagamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_pagamento` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_total` double DEFAULT NULL,
  `id_cupom` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pagamento_cupom_idx` (`id_cupom`),
  CONSTRAINT `fk_pagamento_cupom` FOREIGN KEY (`id_cupom`) REFERENCES `cupomDesconto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
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
  CONSTRAINT `fk_pagamentoCartao_cartao` FOREIGN KEY (`id_cartao`) REFERENCES `cartao` (`id`),
  CONSTRAINT `fk_pagamentoCartao_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamentoCartao`
--

LOCK TABLES `pagamentoCartao` WRITE;
/*!40000 ALTER TABLE `pagamentoCartao` DISABLE KEYS */;
INSERT INTO `pagamentoCartao` VALUES (1,1,10),(1,2,15),(1,4,15),(2,1,40),(2,2,5),(2,3,4.99),(3,1,9.99),(3,2,40),(4,1,20),(4,2,20),(4,4,9.99),(5,3,20),(5,4,29.99),(6,3,20),(6,4,29.99),(7,2,10),(7,3,10),(7,4,29.99),(8,3,140),(8,4,9.97),(9,3,40),(9,4,9.99);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,1,1,'2019-05-20 11:10:13',49.99),(2,1,1,1,'2019-05-20 17:39:20',49.99),(3,1,1,1,'2019-05-21 11:25:36',49.99),(4,1,1,1,'2019-05-21 11:26:49',49.99),(5,1,1,1,'2019-05-21 12:47:47',49.99),(6,1,1,1,'2019-05-21 13:17:34',49.99),(7,1,1,1,'2019-05-23 14:14:13',49.99),(8,1,1,1,'2019-05-23 14:16:01',149.97),(9,1,1,1,'2019-05-23 14:21:07',49.99);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `fk_solicitacaoTroca_pedido_idx` (`id_pedido`),
  KEY `fk_solicitacaoTroca_cliente_idx` (`id_cliente`),
  CONSTRAINT `fk_solicitacaoTroca_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_solicitacaoTroca_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacaoTroca`
--

LOCK TABLES `solicitacaoTroca` WRITE;
/*!40000 ALTER TABLE `solicitacaoTroca` DISABLE KEYS */;
INSERT INTO `solicitacaoTroca` VALUES (1,1,1,'2019-05-13 23:22:55'),(2,1,1,'2019-05-13 23:25:27'),(3,1,1,'2019-05-13 23:26:30'),(4,1,1,'2019-05-13 23:27:18'),(5,1,1,'2019-05-13 23:27:26'),(6,1,1,'2019-05-13 23:28:09'),(7,1,1,'2019-05-13 23:29:26'),(8,1,1,'2019-05-13 23:30:12'),(9,1,1,'2019-05-13 23:30:51'),(10,1,1,'2019-05-14 00:04:12'),(11,1,1,'2019-05-14 00:05:37'),(12,1,1,'2019-05-14 00:07:07'),(13,1,1,'2019-05-14 00:08:26'),(14,1,1,'2019-05-14 14:33:04'),(15,1,1,'2019-05-14 14:35:48'),(16,1,1,'2019-05-14 14:38:08');
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
-- Dumping routines for database 'Ecommerce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-23 22:11:57
