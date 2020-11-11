-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: aner_admin
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `adm_admin`
--

DROP TABLE IF EXISTS `adm_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adm_admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理员账号',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理员密码',
  `password_salt` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理员密码相关-加盐',
  `via` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员头像',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理员昵称',
  `role_id` int NOT NULL DEFAULT '0' COMMENT '管理员角色',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'QQ',
  `wx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_admin`
--

LOCK TABLES `adm_admin` WRITE;
/*!40000 ALTER TABLE `adm_admin` DISABLE KEYS */;
INSERT INTO `adm_admin` VALUES (1,'root','42960a50f11334ea5bcba697e67bc7b0','BJPrExO9','/storage/admin_via/20191223\\cffa5aa1724e4b3aef20524a7eea66b5.jpg','开发者账号',1,'13939390003','1223050252@qq.com','1223050251','anyuhanfeifff'),(7,'admin','73822800f3ac3f45ef7827297a6ec572','O8Vhk8vT','','超级管理员',2,'','','','');
/*!40000 ALTER TABLE `adm_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_admin_login`
--

DROP TABLE IF EXISTS `adm_admin_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adm_admin_login` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '管理员异常登录统计',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录ip',
  `error_number` tinyint NOT NULL DEFAULT '0' COMMENT '异常次数',
  `insert_time` datetime DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_admin_login`
--

LOCK TABLES `adm_admin_login` WRITE;
/*!40000 ALTER TABLE `adm_admin_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_admin_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_freeze_ip`
--

DROP TABLE IF EXISTS `adm_freeze_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adm_freeze_ip` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '冻结ip表id',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ip',
  `freeze_start_time` datetime DEFAULT NULL COMMENT '冻结开始时间',
  `freeze_end_time` datetime DEFAULT NULL COMMENT '冻结结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_freeze_ip`
--

LOCK TABLES `adm_freeze_ip` WRITE;
/*!40000 ALTER TABLE `adm_freeze_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_freeze_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_role`
--

DROP TABLE IF EXISTS `adm_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adm_role` (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `power` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '管理权限',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_role`
--

LOCK TABLES `adm_role` WRITE;
/*!40000 ALTER TABLE `adm_role` DISABLE KEYS */;
INSERT INTO `adm_role` VALUES (1,'开发者','',',27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,51,52,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,96,97,98,99,100,101,102,103,104,105,106,75,76,77,78,79,80,81,82,83,84,85,86,88,89,90,91,92,93,94,95,73,74,115,116,'),(2,'超级管理员','',',27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,51,52,117,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,96,97,98,99,100,101,102,103,104,105,106,75,76,77,78,79,80,81,82,83,84,85,86,88,89,90,91,92,93,94,95,73,74,115,116,');
/*!40000 ALTER TABLE `adm_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article`
--

DROP TABLE IF EXISTS `cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_article` (
  `article_id` int NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `tag_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章标签',
  `category_id` int NOT NULL DEFAULT '0' COMMENT '文章分类',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章标题',
  `author` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章作者',
  `intro` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章简介',
  `keyword` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章关键字',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `content_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'html' COMMENT '内容类型html或markdown',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article`
--

LOCK TABLES `cms_article` WRITE;
/*!40000 ALTER TABLE `cms_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article_data`
--

DROP TABLE IF EXISTS `cms_article_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_article_data` (
  `article_id` int NOT NULL COMMENT '文章id',
  `is_stick` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '热门',
  `is_recomment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐',
  `looknum` int NOT NULL DEFAULT '0' COMMENT '查看量',
  `likenum` int NOT NULL DEFAULT '0' COMMENT '点赞量',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article_data`
--

LOCK TABLES `cms_article_data` WRITE;
/*!40000 ALTER TABLE `cms_article_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_article_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category`
--

DROP TABLE IF EXISTS `cms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_category` (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '文章分类id',
  `category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `category_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类图片',
  `sort` tinyint NOT NULL COMMENT '排序',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category`
--

LOCK TABLES `cms_category` WRITE;
/*!40000 ALTER TABLE `cms_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_tag`
--

DROP TABLE IF EXISTS `cms_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `tag_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `tag_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签图片（可选）',
  `sort` tinyint NOT NULL COMMENT '排序',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_tag`
--

LOCK TABLES `cms_tag` WRITE;
/*!40000 ALTER TABLE `cms_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idx_user`
--

DROP TABLE IF EXISTS `idx_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idx_user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `account` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员账号',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员手机号',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员邮箱',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员昵称',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员登录密码',
  `level_password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员二级密码',
  `password_salt` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码加盐',
  `top_id` int NOT NULL DEFAULT '0' COMMENT '上级会员id',
  `register_time` date NOT NULL COMMENT '注册时间',
  `is_login` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可以登录，1是0否',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idx_user`
--

LOCK TABLES `idx_user` WRITE;
/*!40000 ALTER TABLE `idx_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `idx_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idx_user_count`
--

DROP TABLE IF EXISTS `idx_user_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idx_user_count` (
  `user_id` int NOT NULL COMMENT '会员id',
  `down_team_number` int NOT NULL DEFAULT '0' COMMENT '直推会员人数',
  `team_number` int NOT NULL DEFAULT '0' COMMENT '团队总人数',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idx_user_count`
--

LOCK TABLES `idx_user_count` WRITE;
/*!40000 ALTER TABLE `idx_user_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `idx_user_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idx_user_data`
--

DROP TABLE IF EXISTS `idx_user_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idx_user_data` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '会员详细信息（预置）',
  `id_card_username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证--姓名',
  `id_card_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证--身份证号',
  `id_card_front_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证--身份证正面照',
  `id_card_verso_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证--身份证背面照',
  `id_card_hand_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证--手持身份证照',
  `bank_username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行卡--开户人姓名',
  `bank_phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行卡--预留手机号',
  `bank_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行卡--银行卡号',
  `bank_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行卡--开户行',
  `site_username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址--姓名',
  `site_phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址--手机号',
  `site_province` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址--省',
  `site_city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址--市',
  `site_district` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址--区/县',
  `site_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址--详细地址',
  `wx_account` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信--微信账号',
  `wx_nickname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信--微信昵称',
  `wx_qrcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信--收款二维码',
  `alipay_account` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付宝--支付宝账号',
  `alipay_username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付宝--支付宝实名认证姓名',
  `alipay_qrcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付宝--收款二维码',
  `qq` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'qq',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idx_user_data`
--

LOCK TABLES `idx_user_data` WRITE;
/*!40000 ALTER TABLE `idx_user_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `idx_user_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idx_user_fund`
--

DROP TABLE IF EXISTS `idx_user_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idx_user_fund` (
  `user_id` int NOT NULL COMMENT '会员id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idx_user_fund`
--

LOCK TABLES `idx_user_fund` WRITE;
/*!40000 ALTER TABLE `idx_user_fund` DISABLE KEYS */;
/*!40000 ALTER TABLE `idx_user_fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_admin_operation`
--

DROP TABLE IF EXISTS `log_admin_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_admin_operation` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '管理员操作日志',
  `admin_id` int NOT NULL DEFAULT '0' COMMENT '管理员id',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型，operation操作，login登录',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'ip',
  `content` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `insert_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_admin_operation`
--

LOCK TABLES `log_admin_operation` WRITE;
/*!40000 ALTER TABLE `log_admin_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_admin_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_user_fund`
--

DROP TABLE IF EXISTS `log_user_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_user_fund` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '资金流水记录',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '会员id',
  `user_identity` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员标识',
  `number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '金额',
  `coin_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '币种',
  `fund_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作类型',
  `content` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '说明',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `insert_time` datetime NOT NULL COMMENT '记录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_user_fund`
--

LOCK TABLES `log_user_fund` WRITE;
/*!40000 ALTER TABLE `log_user_fund` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_user_fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_user_operation`
--

DROP TABLE IF EXISTS `log_user_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_user_operation` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '会员操作表',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '会员id',
  `user_identity` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员标识',
  `content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作内容',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'ip',
  `insert_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_user_operation`
--

LOCK TABLES `log_user_operation` WRITE;
/*!40000 ALTER TABLE `log_user_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_user_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ad`
--

DROP TABLE IF EXISTS `sys_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_ad` (
  `ad_id` int NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `adv_id` int NOT NULL DEFAULT '0' COMMENT '广告位id',
  `sign` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片',
  `value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '值',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ad`
--

LOCK TABLES `sys_ad` WRITE;
/*!40000 ALTER TABLE `sys_ad` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_adv`
--

DROP TABLE IF EXISTS `sys_adv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_adv` (
  `adv_id` int NOT NULL AUTO_INCREMENT COMMENT '广告位id',
  `adv_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '广告位名称',
  `sign` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '广告位标签',
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_adv`
--

LOCK TABLES `sys_adv` WRITE;
/*!40000 ALTER TABLE `sys_adv` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_adv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_basic`
--

DROP TABLE IF EXISTS `sys_basic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_basic` (
  `id` tinyint NOT NULL COMMENT 'id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `keyword` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '简介',
  `copyright` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '版权',
  `aq` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备案号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_basic`
--

LOCK TABLES `sys_basic` WRITE;
/*!40000 ALTER TABLE `sys_basic` DISABLE KEYS */;
INSERT INTO `sys_basic` VALUES (1,'aner_admin后台管理系统','aner_admin，php，后台管理系统','aner_admin后台管理系统','','');
/*!40000 ALTER TABLE `sys_basic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_catalog`
--

DROP TABLE IF EXISTS `sys_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_catalog` (
  `catalog_id` int NOT NULL AUTO_INCREMENT COMMENT '后台目录id',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `icon` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `module_id` int DEFAULT NULL COMMENT '模块id',
  `action_id` int DEFAULT NULL COMMENT '方法id',
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路径',
  `route` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由',
  `top_id` int NOT NULL DEFAULT '0' COMMENT '上级目录',
  `sort` tinyint DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_catalog`
--

LOCK TABLES `sys_catalog` WRITE;
/*!40000 ALTER TABLE `sys_catalog` DISABLE KEYS */;
INSERT INTO `sys_catalog` VALUES (1,'开发者中心','la la-user-secret',0,0,'','',0,29),(2,'模块管理','la la-th-large',2,1,'system/module','/admin/system/module',1,1),(3,'方法管理','la la-th',2,8,'system/action','/admin/system/action',1,2),(4,'后台目录','la la-th-list',2,14,'system/catalog','/admin/system/catalog',1,3),(5,'静态资源管理','la la-file-o',0,0,'','',0,30),(6,'列表资源','la la-file-powerpoint-o',4,21,'system/table','/admin/system/resource/table',5,4),(7,'表单资源','la la-file-word-o',4,22,'system/form','/admin/system/resource/form',5,5),(8,'图标资源','la la-file-pdf-o',4,23,'system/icon','/admin/system/resource/icon',5,6),(9,'按钮资源','la la-file-audio-o',4,24,'system/button','/admin/system/resource/button',5,7),(10,'标题资源','la la-file-text',4,25,'system/text','/admin/system/resource/text',5,8),(11,'引导提示资源','la la-file-code-o',4,26,'system/notify','/admin/system/resource/notify',5,9),(12,'首页','la la-dashboard',5,27,'index/index','/admin',0,0),(13,'管理设置','la la-slideshare',0,0,'','',0,2),(14,'角色管理','la la-sitemap',8,28,'adm/role','/admin/role',13,1),(15,'管理员列表','la la-reddit',8,36,'adm/admin','/admin/admin',13,2),(16,'系统设置','la la-cog',0,0,'','',0,3),(17,'基本信息','la la-leanpub',9,43,'webset/basic','/admin/basic',16,1),(18,'网站设置','la la-wrench',9,45,'webset/setting','/admin/setting',16,2),(19,'广告管理',' la la-cc-amex',10,57,'ad/ad','/admin/ad',16,1),(20,'个人中心','la la-institution',0,0,'','',0,1),(21,'个人资料','la la-hdd-o',11,69,'me/detail','/admin/me/detail',20,1),(22,'修改密码',' la la-edit',11,71,'me/update_password','/admin/me/update/password',20,2),(23,'日志管理','la la-calendar',0,0,'','',0,20),(24,'管理员操作日志','la la-cutlery',12,73,'log/admin_operation_log','/admin/admin/operation/log',23,1),(25,'管理员登录日志','la la-map-signs',12,74,'log/admin_login_log','/admin/admin/login/log',23,2),(26,'文章管理','la la-server',0,0,'','',0,15),(27,'文章标签','la la-paste',13,75,'cms/tag','/admin/cms/tag',26,1),(28,'文章分类',' la la-puzzle-piece',13,81,'cms/category','/admin/cms/category',26,2),(29,'文章列表','la la-tasks',13,88,'cms/article','/admin/cms/article',26,3),(30,'会员管理','la la-users',0,0,'','',0,10),(31,'会员列表','la la-street-view',14,96,'user/user','/admin/user',30,1),(35,'会员资金流水日志','la la-credit-card',14,115,'log/user_fund_log','/admin/user/fund/log',23,2),(36,'会员操作日志','la la-newspaper-o',12,116,'log/user_operation_log','/admin/user/operation/log',23,3);
/*!40000 ALTER TABLE `sys_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_module`
--

DROP TABLE IF EXISTS `sys_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_module` (
  `module_id` int NOT NULL AUTO_INCREMENT COMMENT '模块id',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模块名称',
  `sort` tinyint DEFAULT NULL COMMENT '排序',
  `remark` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_module`
--

LOCK TABLES `sys_module` WRITE;
/*!40000 ALTER TABLE `sys_module` DISABLE KEYS */;
INSERT INTO `sys_module` VALUES (5,'首页',1,''),(8,'管理设置',10,''),(9,'系统设置',20,''),(10,'广告模块',30,''),(11,'个人中心',40,''),(12,'日志管理',90,''),(13,'文章管理',80,''),(14,'会员管理',50,'');
/*!40000 ALTER TABLE `sys_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_module_action`
--

DROP TABLE IF EXISTS `sys_module_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_module_action` (
  `action_id` int NOT NULL AUTO_INCREMENT COMMENT '方法id',
  `module_id` int DEFAULT NULL COMMENT '模块id',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名称',
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路径',
  `route` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由',
  `sort` tinyint DEFAULT NULL COMMENT '排序',
  `remark` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_module_action`
--

LOCK TABLES `sys_module_action` WRITE;
/*!40000 ALTER TABLE `sys_module_action` DISABLE KEYS */;
INSERT INTO `sys_module_action` VALUES (27,5,'首页','index/index','/admin',1,''),(28,8,'角色管理-列表','adm/role','/admin/role',1,''),(29,8,'角色信息添加-表单','adm/role_add',NULL,2,''),(30,8,'角色信息添加-提交','adm/role_add_submit',NULL,3,''),(31,8,'角色信息修改-表单','adm/role_update',NULL,4,''),(32,8,'角色信息修改-提交','adm/role_update_submit',NULL,5,''),(33,8,'角色信息删除-操作','adm/role_delete_submit',NULL,6,''),(34,8,'角色权限设置-表单','adm/role_power',NULL,7,''),(35,8,'角色权限设置-提交','adm/role_power_submit',NULL,8,''),(36,8,'管理员管理-列表','adm/admin','/admin/admin',9,''),(37,8,'管理员信息添加-表单','adm/admin_add',NULL,10,''),(38,8,'管理员信息添加-提交','adm/admin_add_submit',NULL,11,''),(39,8,'管理员信息修改-表单','adm/admin_update',NULL,12,''),(40,8,'管理员信息修改-提交','adm/admin_update_submit',NULL,13,''),(41,8,'管理员信息删除-操作','adm/admin_delete_submit',NULL,14,''),(42,8,'分配管理员角色-操作','adm/admin_allot',NULL,15,''),(43,9,'基本信息展示-表单','webset/basic','/admin/basic',1,''),(44,9,'基本信息修改-提交','webset/basic_submit',NULL,2,''),(45,9,'网站设置-列表','webset/setting','/admin/setting',3,''),(51,9,'网站设置添加-表单','webset/setting_add','',9,''),(52,9,'网站设置信息添加-提交','webset/setting_add_submit','',10,''),(57,10,'广告管理-列表','ad/ad','/admin/ad',1,''),(58,10,'广告位信息添加-表单','ad/ad_adv_add',NULL,2,''),(59,10,'广告位信息添加-提交','ad/ad_adv_add_submit',NULL,3,''),(60,10,'广告位信息修改-表单','ad/ad_adv_update',NULL,4,''),(61,10,'广告位信息修改-提交','ad/ad_adv_update_submit',NULL,5,''),(62,10,'广告位信息删除-操作','ad/ad_adv_delete_submit',NULL,6,''),(63,10,'广告信息添加-表单','ad/ad_ad_add',NULL,7,''),(64,10,'广告信息添加-提交','ad/ad_ad_add_submit',NULL,8,''),(65,10,'广告信息修改-表单','ad/ad_ad_update',NULL,9,''),(66,10,'广告信息修改-提交','ad/ad_ad_update_submit',NULL,10,''),(67,10,'广告信息删除-操作','ad/ad_ad_delete_submit',NULL,11,''),(68,10,'广告信息文本编辑上传图片-提交','ad/ad_img',NULL,12,''),(69,11,'个人资料展示-表单','me/detail','/admin/me/detail',1,''),(70,11,'个人资料修改-提交','me/detail_submit',NULL,2,''),(71,11,'修改密码-表单','me/update_password','/admin/me/update/password',3,''),(72,11,'修改密码-提交','me/update_password_submit',NULL,4,''),(73,12,'管理员操作日志-列表','log/admin_operation_log','/admin/admin/operation/log',1,''),(74,12,'管理员登录日志-列表','log/admin_login_log','/admin/admin/login/log',2,''),(75,13,'文章标签管理-列表','cms/tag','/admin/cms/tag',1,''),(76,13,'文章标签信息添加-表单','cms/tag_add',NULL,2,''),(77,13,'文章标签信息添加-提交','cms/tag_add_submit',NULL,3,''),(78,13,'文章标签信息修改-表单','cms/tag_update',NULL,4,''),(79,13,'文章标签信息修改-提交','cms/tag_update_submit',NULL,5,''),(80,13,'文章标签信息删除-操作','cms/tag_delete_submit',NULL,6,''),(81,13,'文章分类管理-列表','cms/category','/admin/cms/category',7,''),(82,13,'文章分类信息添加-表单','cms/category_add',NULL,8,''),(83,13,'文章分类信息添加-提交','cms/category_add_submit',NULL,9,''),(84,13,'文章分类信息修改-表单','cms/category_update',NULL,10,''),(85,13,'文章分类信息修改-提交','cms/category_update_submit',NULL,11,''),(86,13,'文章分类信息删除-操作','cms/category_delete_submit',NULL,12,''),(88,13,'文章管理-列表','cms/article','/admin/cms/article',13,''),(89,13,'文章信息添加-表单','cms/article_add','',14,''),(90,13,'文章信息添加-提交','cms/article_add_submit','',15,''),(91,13,'文章信息修改-表单','cms/article_update','',16,''),(92,13,'文章信息修改-提交','cms/article_update_submit','',17,''),(93,13,'文章信息删除-操作','cms/article_delete_submit','',18,''),(94,13,'文章信息内容获取-操作','cms/article_content','',19,''),(95,13,'文章信息上传图片-操作','cms/article_img','',20,''),(96,14,'会员管理--列表','user/user','/admin/user',1,''),(97,14,'会员信息添加-表单','user/user_add','',2,''),(98,14,'会员信息添加-提交','user/user_add_submit','',3,''),(99,14,'会员团队-展示页','user/user_team','',4,''),(100,14,'会员详情-展示页','user/user_detail','',5,''),(101,14,'会员信息编辑-表单','user/user_update','',6,''),(102,14,'会员信息编辑-提交','user/user_update_submit','',7,''),(103,14,'会员登录权限设置-操作','user/user_freeze','',8,''),(104,14,'删除会员-操作','user/user_delete','',9,''),(105,14,'会员充值-表单','user/user_recharge','',10,''),(106,14,'会员充值-提交','user/user_recharge_submit','',11,''),(115,12,'会员资金流水日志-列表','log/user_fund_log','/admin/user/fund/log',3,''),(116,12,'会员操作日志-列表','log/user_operation_log','/admin/user/operation/log',4,''),(117,9,'网站设置值修改--提交','webset/setting_value_submit','',21,'');
/*!40000 ALTER TABLE `sys_module_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_setting`
--

DROP TABLE IF EXISTS `sys_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_setting` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '设置id',
  `type` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型: cgory 分类  value 设置',
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `input_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '表单类型',
  `sign` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签',
  `value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '值',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注, select表单是以逗号分割的, 其他为输入提示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_setting`
--

LOCK TABLES `sys_setting` WRITE;
/*!40000 ALTER TABLE `sys_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_setting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-11 15:00:50
