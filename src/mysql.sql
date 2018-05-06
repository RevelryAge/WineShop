-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shop1
-- ------------------------------------------------------
-- Server version	8.0.0-dmr-log

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
-- Table structure for table `adminuser`
--

DROP TABLE IF EXISTS `adminuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminuser` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT '123456',
  `realname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminuser`
--

LOCK TABLES `adminuser` WRITE;
/*!40000 ALTER TABLE `adminuser` DISABLE KEYS */;
INSERT INTO `adminuser` VALUES (1,'admin','admin','admin'),(3,'tom','123456','zs'),(8,'whiteSheep','s123','s123');
/*!40000 ALTER TABLE `adminuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'白酒'),(2,'红酒'),(3,'啤酒'),(4,'米酒'),(5,'黄酒'),(6,'药酒'),(10,'其他');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorysecond`
--

DROP TABLE IF EXISTS `categorysecond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorysecond` (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`csid`),
  KEY `FK936FCAF21DB1FD15` (`cid`),
  CONSTRAINT `FK936FCAF21DB1FD15` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorysecond`
--

LOCK TABLES `categorysecond` WRITE;
/*!40000 ALTER TABLE `categorysecond` DISABLE KEYS */;
INSERT INTO `categorysecond` VALUES (1,'酱香型',1),(2,'浓香型',1),(3,'馥郁香型',1),(4,'清香型',1),(5,'米香型',1),(6,'药香型',1),(7,'芝麻香型',1),(8,'兼香型',1),(9,'特香型',1),(10,'其他香型',1),(11,'干红葡萄酒',2),(12,'半干红葡萄酒',2),(13,'半甜红葡萄酒',2),(14,'甜红葡萄酒',2),(15,'干白葡萄酒',2),(16,'半干白葡萄酒',2),(17,'半甜白葡萄酒',2),(18,'甜白葡萄酒',2),(19,'其他',2),(20,'纯生啤酒',3),(21,'干啤',3),(22,'全麦芽',3),(23,'头道麦汁啤酒',3),(24,'黑啤',3),(25,'冰啤',3),(26,'果味啤酒',3),(27,'鲜啤酒',3),(28,'米酒',4),(29,'糯米黄酒',5),(30,'黍米黄酒',5),(31,'大米黄酒',5),(32,'黄曲黄酒',5),(33,'滋补类药酒',6),(34,'活血化淤类药酒',6),(35,'抗风湿类药酒',6),(36,'壮阳类药酒',6),(40,'组合柜222',10);
/*!40000 ALTER TABLE `categorysecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `FKE8B2AB6166C01961` (`oid`),
  KEY `FKE8B2AB6171DB7AE4` (`pid`),
  KEY `FKE8B2AB6140ACF87A` (`oid`),
  CONSTRAINT `FKE8B2AB6140ACF87A` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `FKE8B2AB6171DB7AE4` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (17,1,119,6,9004),(18,1,369,3,9005),(19,1,369,7,9006),(20,1,119,6,9007),(21,1,369,3,9008),(22,1,168,4,9009),(23,2,738,3,9009),(24,1,369,3,9010);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `total` double DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FKC3DF62E5AA3D9C7` (`uid`),
  CONSTRAINT `FKC3DF62E5AA3D9C7` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9011 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (9004,119,'2018-01-08 15:17:27',1,'2','15012345678','111',NULL),(9005,369,'2018-01-08 15:18:45',1,'2','15012345678','111',NULL),(9006,369,'2018-01-10 18:41:12',4,'邹顺','15096597479','111',15),(9007,119,'2018-01-10 20:10:04',2,'邹顺','15096597479','111',15),(9008,369,'2018-01-11 14:38:46',2,'2','15012345678','111',NULL),(9009,906,'2018-01-11 15:29:46',2,'2','15012345678','111',NULL),(9010,369,'2018-01-12 15:04:30',2,'77','15012345678','111',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `shop_price` double DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `pdesc` varchar(511) DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `pcount` int(11) DEFAULT '0',
  `pdate` datetime DEFAULT NULL,
  `csid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FKED8DCCEFB9B74E02` (`csid`),
  CONSTRAINT `FKED8DCCEFB9B74E02` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'52度 国窖1573 500ml',890,858,'products/00001.jpg','品牌：国窖1573净含量：500ml度数：50度以上手提袋：每购买2瓶，即赠送原厂手提袋1个香型：浓香型箱规：1*6 规 单瓶。',1,100,'2017-10-20 09:18:08',2),(2,'52度 剑南春 500ml',436,172,'products/00002.jpg','品牌：剑南春商品编号：6901434382882净含量：500ml度数：50度以上提袋：每购买2瓶，即赠送原厂手提袋1个香型：浓香型箱规：其他规格：单瓶',0,100,'2017-10-30 22:44:52',2),(3,'52度 水井坊 臻酿八號500ml',380,369,'products/00003.jpg','品牌：水井坊商品编号: 6901676527355?净含量:500ml?度数：50度以上手提袋：每购买2瓶，即赠送原厂手提袋1个?香型：浓香型?箱规：1*6?规格：单瓶',1,50,'2017-10-30 22:40:42',2),(4,'泸州贡酒Q9 1880ml*2 (红瓶加黄瓶)【整箱装】',188,168,'products/00004.jpg','品牌：泸州老窖?商品编号：16901798188844?净含量：1.5L以上?度数：50度以上手提袋：无?香型：浓香型?箱规：1*1?规格：双瓶',0,50,'2017-10-30 22:43:58',2),(5,'52度  六和液 人和 500ml',260,256,'products/00005.jpg','品牌：五粮液 商品编号：6901382070787 净含量：500ml 度数：50度以上手提袋：每购买两瓶，送原厂手提袋一个 香型：浓香型 箱规：1*6 规格：单瓶',0,50,'2017-10-30 22:44:30',2),(6,'52度 小糊涂仙 500ml',130,119,'products/00005.jpg','品牌：小糊涂仙 商品编号：6922193400532 净含量：500ml 度数：50度以上手提袋：无手提袋 香型：浓香型 箱规：1*6 规格：单瓶',1,100,'2017-10-30 22:45:14',2),(7,'52度 舍得酒 500ml',380,369,'products/00007.jpg','品牌：舍得 商品编号：6901435325888 净含量：500ml 度数：50度以上手提袋：无手提袋说明 香型：浓香型 箱规：1*6 规格：单瓶',0,100,'2017-10-20 09:18:08',2),(8,'45度 金六福 特曲（2010年产）500ml*6瓶【整箱装】',380,369,'products/00006.jpg','品牌：金六福 商品编号：55556666028 净含量：500ml 度数：40-49度 手提袋：无手提袋说明 香型：浓香型 箱规：1*6 规格：整箱',0,50,'2017-10-30 22:46:56',2),(9,'52度 小酒人生 小酒版 100ml',25,19,'products/00003.jpg','品牌：小酒人生 商品编号：6926452601982 香型：浓香型 手提袋：无手提袋说明',0,100,'2017-10-30 22:46:15',2),(80,'44',88,88,'products/00005.jpg','',1,800,'2018-01-15 21:15:37',1),(81,'QQ',77,88,'products/00006.jpg','8',1,88,'2018-01-15 21:15:20',1),(82,'sds',35.2,33.5,'products/000017.jpg','',1,55,'2018-01-15 21:19:42',12);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'aaa','aaa','姜涛','aaa@shop.com','15726607618','北京市西三旗中腾建华3楼',1,NULL),(2,'bbb','bbb','张三','bbb@shop.com','18726607618','北京市西三旗中腾建华3楼',1,NULL),(9,'admin','admin','77','123@133.com','15012345678','111',1,''),(11,'zs','123456','zs','1312759515@qq.com','15096597479','zs',1,NULL),(12,'yishui','123456','lwj','3100496523@qq.com','','ass',1,NULL),(13,'zs1','123456','zs','1312759515@qq.com','15096597479','2',1,NULL),(14,'song','123456','宋晓宇','foreversxyztt@163.com','15012345678','111',0,'34f95549d8d747f4b5c8be7119b8e98f009ee6395106445cab57b61bafd30a54'),(15,'zs2','123456','邹顺','15096597479@163.com','15096597479','111',1,NULL),(16,'wdddg','111','tom','793820206@qq.com','18249029420','adsad',0,'2d26056606a54f5bbb62c491384b2dbfc0db2d3d6eca4901a0866fba672b24ec'),(18,'1','1','陈硕','763324108@qq.com','15978507319','1',1,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'shop1'
--

--
-- Dumping routines for database 'shop1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-19  8:41:33
