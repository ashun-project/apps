-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: localhost    Database: zyb
-- ------------------------------------------------------
-- Server version	8.0.11

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
-- Table structure for table `discuss`
--

DROP TABLE IF EXISTS `discuss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `discuss` (
  `app_id` int(11) NOT NULL COMMENT '应用的id',
  `account` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户',
  `create_time` datetime DEFAULT NULL COMMENT '评论的时间',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `thumb_total` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '点赞数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discuss`
--

LOCK TABLES `discuss` WRITE;
/*!40000 ALTER TABLE `discuss` DISABLE KEYS */;
INSERT INTO `discuss` VALUES (53,'匿名','2020-03-12 15:37:54','这个APP真的是太好了','8'),(53,'匿名','2020-03-02 17:47:23','好喜欢这个啊，太带劲了。还能提现呢',NULL),(53,'匿名','2020-03-02 17:50:14','423让我去二群无',NULL),(53,'匿名','2020-03-02 17:52:28','热问问特热我让他让他也很热',NULL),(49,'匿名','2020-03-04 11:27:29','这个书超级棒，搞得我现在都睡不着了',NULL),(49,'匿名','2020-03-04 11:35:11','楼上半夜睡不着，想去干点啥呢',NULL),(32,'匿名','2020-03-05 15:42:15','这个app真的好',NULL),(74,'匿名','2020-03-06 11:45:55','123我是汉字',NULL),(26,'匿名','2020-03-06 13:17:47','古典风格梵蒂冈',NULL),(72,'匿名','2020-03-06 13:18:17','结构化就感觉',NULL),(35,'匿名','2020-03-06 13:22:16','一二三四五六七',NULL),(65,'匿名','2020-03-06 13:22:55','啊撒撒撒',NULL),(65,'匿名','2020-03-06 13:23:10','大萨达',NULL),(42,'匿名','2020-03-06 13:23:47','阿萨阿萨',NULL),(65,'匿名','2020-03-06 13:24:26','奥术大师大',NULL),(26,'匿名','2020-03-06 13:24:50','大叔大婶',NULL);
/*!40000 ALTER TABLE `discuss` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-24 11:05:37
