/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : aner_admin

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-09-05 09:50:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `adm_admin`
-- ----------------------------
DROP TABLE IF EXISTS `adm_admin`;
CREATE TABLE `adm_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理员账号',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理员密码',
  `password_salt` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理员密码相关-加盐',
  `via` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员头像',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理员昵称',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员角色',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'QQ',
  `wx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of adm_admin
-- ----------------------------
INSERT INTO `adm_admin` VALUES ('1', 'root', '42960a50f11334ea5bcba697e67bc7b0', 'BJPrExO9', '/uploads\\admin_via\\20190830\\94684b2624cdbc10ba16a20c94feec09.jpg', '暗语寒飞', '4', '13939390001', '1223050252@qq.com', '1223050251', 'anyuhanfeifff');

-- ----------------------------
-- Table structure for `adm_admin_login`
-- ----------------------------
DROP TABLE IF EXISTS `adm_admin_login`;
CREATE TABLE `adm_admin_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员异常登录统计',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录ip',
  `error_number` tinyint(5) NOT NULL DEFAULT '0' COMMENT '异常次数',
  `insert_time` datetime DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of adm_admin_login
-- ----------------------------

-- ----------------------------
-- Table structure for `adm_freeze_ip`
-- ----------------------------
DROP TABLE IF EXISTS `adm_freeze_ip`;
CREATE TABLE `adm_freeze_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '冻结ip表id',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ip',
  `freeze_start_time` datetime DEFAULT NULL COMMENT '冻结开始时间',
  `freeze_end_time` datetime DEFAULT NULL COMMENT '冻结结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of adm_freeze_ip
-- ----------------------------

-- ----------------------------
-- Table structure for `adm_role`
-- ----------------------------
DROP TABLE IF EXISTS `adm_role`;
CREATE TABLE `adm_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名称',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `power` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '管理权限',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of adm_role
-- ----------------------------
INSERT INTO `adm_role` VALUES ('1', '超级管理员', '2', '', ',27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,75,76,77,78,79,80,81,82,83,84,85,86,88,89,90,91,92,93,94,95,73,74,');
INSERT INTO `adm_role` VALUES ('4', '开发者', '1', '', ',27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,96,97,98,99,100,101,102,103,104,105,106,75,76,77,78,79,80,81,82,83,84,85,86,88,89,90,91,92,93,94,95,73,74,1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,18,19,20,21,22,23,24,25,26,');

-- ----------------------------
-- Table structure for `cms_article`
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `tag_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章标签',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章分类',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章标题',
  `author` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章作者',
  `intro` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章简介',
  `keyword` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章关键字',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `content_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'html' COMMENT '内容类型html或markdown',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('15', ',1,', '1', '333', '暗语寒飞', '\n                            ', '234', '/uploads\\article\\20190831\\829f09f5a9c6f4f5ab33d4e757f6a0a4.jpg', '2', 'html', '');

-- ----------------------------
-- Table structure for `cms_article_comment`
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_comment`;
CREATE TABLE `cms_article_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `article_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章id',
  `from_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '发送者id',
  `from_user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发送者标识',
  `to_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '接收者id',
  `to_user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '接收者标识',
  `top_id` int(11) NOT NULL DEFAULT '0' COMMENT '一级评论id',
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of cms_article_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_article_data`
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_data`;
CREATE TABLE `cms_article_data` (
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `is_stick` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '热门',
  `is_recomment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐',
  `looknum` int(11) NOT NULL DEFAULT '0' COMMENT '查看量',
  `likenum` int(11) NOT NULL DEFAULT '0' COMMENT '点赞量',
  `commentnum` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of cms_article_data
-- ----------------------------
INSERT INTO `cms_article_data` VALUES ('15', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `cms_category`
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章分类id',
  `category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `category_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类图片',
  `sort` tinyint(5) NOT NULL COMMENT '排序',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of cms_category
-- ----------------------------
INSERT INTO `cms_category` VALUES ('1', '测试', '/uploads\\category\\20190812\\c69c74aa3a478b4e1b39ee297235c93f.jpg', '1');

-- ----------------------------
-- Table structure for `cms_tag`
-- ----------------------------
DROP TABLE IF EXISTS `cms_tag`;
CREATE TABLE `cms_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `tag_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `tag_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签图片（可选）',
  `sort` tinyint(5) NOT NULL COMMENT '排序',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of cms_tag
-- ----------------------------
INSERT INTO `cms_tag` VALUES ('1', '测试2', '/uploads\\tag\\20190822\\cc34b295135ee5f6dca9e91af2d7cc13.png', '1');

-- ----------------------------
-- Table structure for `idx_user`
-- ----------------------------
DROP TABLE IF EXISTS `idx_user`;
CREATE TABLE `idx_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `account` varchar(16) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员账号',
  `phone` char(11) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员手机号',
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员邮箱',
  `nickname` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员昵称',
  `password` char(32) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员登录密码',
  `level_password` char(32) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员二级密码',
  `password_salt` char(6) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码加盐',
  `top_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级会员id',
  `register_time` date NOT NULL COMMENT '注册时间',
  `is_login` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可以登录，1是0否',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of idx_user
-- ----------------------------
INSERT INTO `idx_user` VALUES ('2', '', '13939390001', '', '测试', '91ade688ee87aa6104eaf5516bcfc62c', '31080c1a07ecebd731d19f42760f984d', '0VxqBa', '0', '2019-08-27', '1');
INSERT INTO `idx_user` VALUES ('5', '', '13939390011', '', '测试的下级', 'e72a88768c75265e82b3ea092768372b', '', 'd6xsIt', '2', '2019-08-27', '1');
INSERT INTO `idx_user` VALUES ('6', '', '13939390111', '', '测试的下级的下级', 'c636b3e2cfea40ec8e954b553f5b1aa2', '', 'Q7hZMI', '5', '2019-08-27', '1');

-- ----------------------------
-- Table structure for `idx_user_count`
-- ----------------------------
DROP TABLE IF EXISTS `idx_user_count`;
CREATE TABLE `idx_user_count` (
  `user_id` int(11) NOT NULL COMMENT '会员id',
  `down_team_number` int(11) NOT NULL DEFAULT '0' COMMENT '直推会员人数',
  `team_number` int(11) NOT NULL DEFAULT '0' COMMENT '团队总人数',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of idx_user_count
-- ----------------------------
INSERT INTO `idx_user_count` VALUES ('2', '1', '2');
INSERT INTO `idx_user_count` VALUES ('5', '1', '1');
INSERT INTO `idx_user_count` VALUES ('6', '0', '0');
INSERT INTO `idx_user_count` VALUES ('7', '0', '0');
INSERT INTO `idx_user_count` VALUES ('8', '0', '0');
INSERT INTO `idx_user_count` VALUES ('9', '0', '0');

-- ----------------------------
-- Table structure for `idx_user_data`
-- ----------------------------
DROP TABLE IF EXISTS `idx_user_data`;
CREATE TABLE `idx_user_data` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员详细信息（预置）',
  `id_card_username` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证--姓名',
  `id_card_code` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证--身份证号',
  `id_card_front_img` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证--身份证正面照',
  `id_card_verso_img` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证--身份证背面照',
  `id_card_hand_img` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证--手持身份证照',
  `bank_username` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行卡--开户人姓名',
  `bank_phone` char(11) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行卡--预留手机号',
  `bank_code` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行卡--银行卡号',
  `bank_name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行卡--开户行',
  `site_username` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址--姓名',
  `site_phone` char(11) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址--手机号',
  `site_province` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址--省',
  `site_city` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址--市',
  `site_district` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址--区/县',
  `site_address` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址--详细地址',
  `wx_account` varchar(40) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信--微信账号',
  `wx_nickname` varchar(40) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信--微信昵称',
  `alipay_account` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付宝--支付宝账号',
  `alipay_username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付宝--支付宝实名认证姓名',
  `qq` varchar(15) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'qq',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of idx_user_data
-- ----------------------------
INSERT INTO `idx_user_data` VALUES ('2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `idx_user_data` VALUES ('5', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `idx_user_data` VALUES ('6', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `idx_user_data` VALUES ('7', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `idx_user_data` VALUES ('8', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `idx_user_data` VALUES ('9', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for `idx_user_fund`
-- ----------------------------
DROP TABLE IF EXISTS `idx_user_fund`;
CREATE TABLE `idx_user_fund` (
  `user_id` int(11) NOT NULL COMMENT '会员id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of idx_user_fund
-- ----------------------------
INSERT INTO `idx_user_fund` VALUES ('2', '171.00');
INSERT INTO `idx_user_fund` VALUES ('5', '0.00');
INSERT INTO `idx_user_fund` VALUES ('6', '0.00');
INSERT INTO `idx_user_fund` VALUES ('7', '0.00');
INSERT INTO `idx_user_fund` VALUES ('8', '0.00');
INSERT INTO `idx_user_fund` VALUES ('9', '0.00');

-- ----------------------------
-- Table structure for `log_admin_operation`
-- ----------------------------
DROP TABLE IF EXISTS `log_admin_operation`;
CREATE TABLE `log_admin_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员操作日志',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型，operation操作，login登录',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'ip',
  `content` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `insert_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of log_admin_operation
-- ----------------------------
INSERT INTO `log_admin_operation` VALUES ('24', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-10 16:12:04');
INSERT INTO `log_admin_operation` VALUES ('25', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-12 10:46:52');
INSERT INTO `log_admin_operation` VALUES ('26', '1', 'operation', '127.0.0.1', '管理员信息添加：user', '2019-08-12 10:47:11');
INSERT INTO `log_admin_operation` VALUES ('27', '1', 'operation', '127.0.0.1', '分配角色给管理员：user->超级管理员', '2019-08-12 10:47:24');
INSERT INTO `log_admin_operation` VALUES ('28', '0', 'login', '127.0.0.1', '登录成功，账号：user', '2019-08-12 10:47:30');
INSERT INTO `log_admin_operation` VALUES ('29', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-12 10:52:17');
INSERT INTO `log_admin_operation` VALUES ('30', '1', 'operation', '127.0.0.1', '管理员信息删除：user', '2019-08-12 10:52:26');
INSERT INTO `log_admin_operation` VALUES ('31', '1', 'operation', '127.0.0.1', '文章标签信息删除：c而是', '2019-08-12 16:15:06');
INSERT INTO `log_admin_operation` VALUES ('32', '1', 'operation', '127.0.0.1', '文章分类信息删除：测试1', '2019-08-12 16:25:50');
INSERT INTO `log_admin_operation` VALUES ('33', '1', 'operation', '127.0.0.1', '模块信息添加：文章管理', '2019-08-12 16:29:40');
INSERT INTO `log_admin_operation` VALUES ('34', '1', 'operation', '127.0.0.1', '方法信息添加：文章标签管理-列表', '2019-08-12 16:29:59');
INSERT INTO `log_admin_operation` VALUES ('35', '1', 'operation', '127.0.0.1', '方法信息添加：文章标签信息添加表单', '2019-08-12 16:30:12');
INSERT INTO `log_admin_operation` VALUES ('36', '1', 'operation', '127.0.0.1', '方法信息添加：文章标签信息添加提交', '2019-08-12 16:30:20');
INSERT INTO `log_admin_operation` VALUES ('37', '1', 'operation', '127.0.0.1', '方法信息添加：文章标签信息修改表单', '2019-08-12 16:30:29');
INSERT INTO `log_admin_operation` VALUES ('38', '1', 'operation', '127.0.0.1', '方法信息添加：文章标签信息修改提交', '2019-08-12 16:30:37');
INSERT INTO `log_admin_operation` VALUES ('39', '1', 'operation', '127.0.0.1', '方法信息添加：文章标签信息删除提交', '2019-08-12 16:30:46');
INSERT INTO `log_admin_operation` VALUES ('40', '1', 'operation', '127.0.0.1', '方法信息添加：文章分类管理-列表', '2019-08-12 16:30:57');
INSERT INTO `log_admin_operation` VALUES ('41', '1', 'operation', '127.0.0.1', '方法信息添加：文章分类信息添加表单', '2019-08-12 16:31:04');
INSERT INTO `log_admin_operation` VALUES ('42', '1', 'operation', '127.0.0.1', '方法信息添加：文章分类信息添加提交', '2019-08-12 16:31:11');
INSERT INTO `log_admin_operation` VALUES ('43', '1', 'operation', '127.0.0.1', '方法信息添加：文章分类信息修改表单', '2019-08-12 16:31:18');
INSERT INTO `log_admin_operation` VALUES ('44', '1', 'operation', '127.0.0.1', '方法信息添加：文章分类信息修改提交', '2019-08-12 16:31:26');
INSERT INTO `log_admin_operation` VALUES ('45', '1', 'operation', '127.0.0.1', '方法信息添加：文章分类信息删除提交', '2019-08-12 16:31:35');
INSERT INTO `log_admin_operation` VALUES ('46', '1', 'operation', '127.0.0.1', '后台目录添加：文章管理', '2019-08-12 16:33:27');
INSERT INTO `log_admin_operation` VALUES ('47', '1', 'operation', '127.0.0.1', '后台目录添加：文章标签', '2019-08-12 16:34:35');
INSERT INTO `log_admin_operation` VALUES ('48', '1', 'operation', '127.0.0.1', '后台目录添加：文章分类', '2019-08-12 16:35:02');
INSERT INTO `log_admin_operation` VALUES ('49', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-19 09:00:38');
INSERT INTO `log_admin_operation` VALUES ('50', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-20 09:25:43');
INSERT INTO `log_admin_operation` VALUES ('51', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-20 09:27:12');
INSERT INTO `log_admin_operation` VALUES ('52', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-20 09:42:29');
INSERT INTO `log_admin_operation` VALUES ('53', '1', 'operation', '127.0.0.1', '广告位信息添加：123', '2019-08-20 10:22:04');
INSERT INTO `log_admin_operation` VALUES ('54', '1', 'operation', '127.0.0.1', '广告位信息修改：123->1233', '2019-08-20 10:22:11');
INSERT INTO `log_admin_operation` VALUES ('55', '1', 'operation', '127.0.0.1', '广告位信息修改：1233->1233', '2019-08-20 10:22:41');
INSERT INTO `log_admin_operation` VALUES ('56', '1', 'operation', '127.0.0.1', '广告信息添加：123', '2019-08-20 10:25:23');
INSERT INTO `log_admin_operation` VALUES ('57', '1', 'operation', '127.0.0.1', '广告信息修改：123->123', '2019-08-20 10:27:09');
INSERT INTO `log_admin_operation` VALUES ('58', '1', 'operation', '127.0.0.1', '角色信息添加：ces', '2019-08-20 10:49:20');
INSERT INTO `log_admin_operation` VALUES ('59', '1', 'operation', '127.0.0.1', '管理员信息添加：123', '2019-08-20 10:51:33');
INSERT INTO `log_admin_operation` VALUES ('60', '1', 'operation', '127.0.0.1', '分配角色给管理员：123->超级管理员', '2019-08-20 10:51:44');
INSERT INTO `log_admin_operation` VALUES ('61', '1', 'operation', '127.0.0.1', '管理员信息修改：123->123', '2019-08-20 10:56:53');
INSERT INTO `log_admin_operation` VALUES ('62', '1', 'operation', '127.0.0.1', '管理员信息修改：123->123123333', '2019-08-20 10:57:04');
INSERT INTO `log_admin_operation` VALUES ('63', '1', 'operation', '127.0.0.1', '管理员信息删除：123123333', '2019-08-20 10:59:36');
INSERT INTO `log_admin_operation` VALUES ('64', '1', 'operation', '127.0.0.1', '角色信息修改：ces->ces333', '2019-08-20 11:00:12');
INSERT INTO `log_admin_operation` VALUES ('65', '1', 'operation', '127.0.0.1', '角色信息权限设置：ces333', '2019-08-20 11:00:19');
INSERT INTO `log_admin_operation` VALUES ('66', '1', 'operation', '127.0.0.1', '角色信息删除：ces333', '2019-08-20 11:00:32');
INSERT INTO `log_admin_operation` VALUES ('67', '1', 'operation', '127.0.0.1', '方法信息添加：测试', '2019-08-20 11:41:35');
INSERT INTO `log_admin_operation` VALUES ('68', '1', 'operation', '127.0.0.1', '方法信息修改：测试->测试', '2019-08-20 11:46:28');
INSERT INTO `log_admin_operation` VALUES ('69', '1', 'operation', '127.0.0.1', '方法信息删除：测试', '2019-08-20 13:01:23');
INSERT INTO `log_admin_operation` VALUES ('70', '1', 'operation', '127.0.0.1', '后台目录修改：首页->首页', '2019-08-20 13:38:50');
INSERT INTO `log_admin_operation` VALUES ('71', '1', 'operation', '127.0.0.1', '后台目录修改：个人资料->个人资料', '2019-08-20 13:39:05');
INSERT INTO `log_admin_operation` VALUES ('72', '1', 'operation', '127.0.0.1', '后台目录修改：修改密码->修改密码', '2019-08-20 13:39:10');
INSERT INTO `log_admin_operation` VALUES ('73', '1', 'operation', '127.0.0.1', '后台目录修改：角色管理->角色管理', '2019-08-20 13:39:15');
INSERT INTO `log_admin_operation` VALUES ('74', '1', 'operation', '127.0.0.1', '后台目录修改：管理员列表->管理员列表', '2019-08-20 13:39:19');
INSERT INTO `log_admin_operation` VALUES ('75', '1', 'operation', '127.0.0.1', '后台目录修改：基本信息->基本信息', '2019-08-20 13:39:24');
INSERT INTO `log_admin_operation` VALUES ('76', '1', 'operation', '127.0.0.1', '后台目录修改：网站设置->网站设置', '2019-08-20 13:39:28');
INSERT INTO `log_admin_operation` VALUES ('77', '1', 'operation', '127.0.0.1', '后台目录修改：广告管理->广告管理', '2019-08-20 13:39:32');
INSERT INTO `log_admin_operation` VALUES ('78', '1', 'operation', '127.0.0.1', '后台目录修改：管理员操作日志->管理员操作日志', '2019-08-20 13:39:47');
INSERT INTO `log_admin_operation` VALUES ('79', '1', 'operation', '127.0.0.1', '后台目录修改：管理员登录日志->管理员登录日志', '2019-08-20 13:39:52');
INSERT INTO `log_admin_operation` VALUES ('80', '1', 'operation', '127.0.0.1', '后台目录修改：模块管理->模块管理', '2019-08-20 13:39:57');
INSERT INTO `log_admin_operation` VALUES ('81', '1', 'operation', '127.0.0.1', '后台目录修改：方法管理->方法管理', '2019-08-20 13:40:01');
INSERT INTO `log_admin_operation` VALUES ('82', '1', 'operation', '127.0.0.1', '后台目录修改：后台目录->后台目录', '2019-08-20 13:40:06');
INSERT INTO `log_admin_operation` VALUES ('83', '1', 'operation', '127.0.0.1', '后台目录修改：列表资源->列表资源', '2019-08-20 13:40:11');
INSERT INTO `log_admin_operation` VALUES ('84', '1', 'operation', '127.0.0.1', '后台目录修改：表单资源->表单资源', '2019-08-20 13:40:14');
INSERT INTO `log_admin_operation` VALUES ('85', '1', 'operation', '127.0.0.1', '后台目录修改：图标资源->图标资源', '2019-08-20 13:40:18');
INSERT INTO `log_admin_operation` VALUES ('86', '1', 'operation', '127.0.0.1', '后台目录修改：按钮资源->按钮资源', '2019-08-20 13:40:22');
INSERT INTO `log_admin_operation` VALUES ('87', '1', 'operation', '127.0.0.1', '后台目录修改：标题资源->标题资源', '2019-08-20 13:40:29');
INSERT INTO `log_admin_operation` VALUES ('88', '1', 'operation', '127.0.0.1', '后台目录修改：引导提示资源->引导提示资源', '2019-08-20 13:40:34');
INSERT INTO `log_admin_operation` VALUES ('89', '1', 'operation', '127.0.0.1', '后台目录修改：首页->首页', '2019-08-20 13:45:01');
INSERT INTO `log_admin_operation` VALUES ('90', '1', 'operation', '127.0.0.1', '后台目录修改：个人资料->个人资料', '2019-08-20 13:45:45');
INSERT INTO `log_admin_operation` VALUES ('91', '1', 'operation', '127.0.0.1', '后台目录修改：个人资料->个人资料', '2019-08-20 13:48:37');
INSERT INTO `log_admin_operation` VALUES ('92', '1', 'operation', '127.0.0.1', '后台目录修改：修改密码->修改密码', '2019-08-20 13:48:42');
INSERT INTO `log_admin_operation` VALUES ('93', '1', 'operation', '127.0.0.1', '后台目录修改：角色管理->角色管理', '2019-08-20 13:48:47');
INSERT INTO `log_admin_operation` VALUES ('94', '1', 'operation', '127.0.0.1', '后台目录修改：管理员列表->管理员列表', '2019-08-20 13:48:51');
INSERT INTO `log_admin_operation` VALUES ('95', '1', 'operation', '127.0.0.1', '后台目录修改：基本信息->基本信息', '2019-08-20 13:48:55');
INSERT INTO `log_admin_operation` VALUES ('96', '1', 'operation', '127.0.0.1', '后台目录修改：网站设置->网站设置', '2019-08-20 13:48:59');
INSERT INTO `log_admin_operation` VALUES ('97', '1', 'operation', '127.0.0.1', '后台目录修改：广告管理->广告管理', '2019-08-20 13:49:03');
INSERT INTO `log_admin_operation` VALUES ('98', '1', 'operation', '127.0.0.1', '后台目录修改：管理员操作日志->管理员操作日志', '2019-08-20 13:49:09');
INSERT INTO `log_admin_operation` VALUES ('99', '1', 'operation', '127.0.0.1', '后台目录修改：管理员登录日志->管理员登录日志', '2019-08-20 13:49:13');
INSERT INTO `log_admin_operation` VALUES ('100', '1', 'operation', '127.0.0.1', '后台目录修改：模块管理->模块管理', '2019-08-20 13:49:17');
INSERT INTO `log_admin_operation` VALUES ('101', '1', 'operation', '127.0.0.1', '后台目录修改：方法管理->方法管理', '2019-08-20 13:49:21');
INSERT INTO `log_admin_operation` VALUES ('102', '1', 'operation', '127.0.0.1', '后台目录修改：后台目录->后台目录', '2019-08-20 13:49:25');
INSERT INTO `log_admin_operation` VALUES ('103', '1', 'operation', '127.0.0.1', '后台目录修改：列表资源->列表资源', '2019-08-20 13:49:29');
INSERT INTO `log_admin_operation` VALUES ('104', '1', 'operation', '127.0.0.1', '后台目录修改：表单资源->表单资源', '2019-08-20 13:49:33');
INSERT INTO `log_admin_operation` VALUES ('105', '1', 'operation', '127.0.0.1', '后台目录修改：引导提示资源->引导提示资源', '2019-08-20 13:49:38');
INSERT INTO `log_admin_operation` VALUES ('106', '1', 'operation', '127.0.0.1', '后台目录修改：标题资源->标题资源', '2019-08-20 13:49:42');
INSERT INTO `log_admin_operation` VALUES ('107', '1', 'operation', '127.0.0.1', '后台目录修改：按钮资源->按钮资源', '2019-08-20 13:49:47');
INSERT INTO `log_admin_operation` VALUES ('108', '1', 'operation', '127.0.0.1', '后台目录修改：图标资源->图标资源', '2019-08-20 13:49:51');
INSERT INTO `log_admin_operation` VALUES ('109', '1', 'operation', '127.0.0.1', '方法信息修改：文章标签管理-列表->文章标签管理-列表', '2019-08-20 14:09:28');
INSERT INTO `log_admin_operation` VALUES ('110', '1', 'operation', '127.0.0.1', '方法信息修改：文章标签管理-列表->文章标签管理-列表', '2019-08-20 14:09:32');
INSERT INTO `log_admin_operation` VALUES ('111', '1', 'operation', '127.0.0.1', '方法信息修改：文章分类管理-列表->文章分类管理-列表', '2019-08-20 14:09:48');
INSERT INTO `log_admin_operation` VALUES ('112', '1', 'operation', '127.0.0.1', '后台目录修改：文章标签->文章标签', '2019-08-20 14:09:56');
INSERT INTO `log_admin_operation` VALUES ('113', '1', 'operation', '127.0.0.1', '后台目录修改：文章分类->文章分类', '2019-08-20 14:10:15');
INSERT INTO `log_admin_operation` VALUES ('114', '1', 'operation', '127.0.0.1', '文章标签信息添加：123', '2019-08-20 14:13:21');
INSERT INTO `log_admin_operation` VALUES ('115', '1', 'operation', '127.0.0.1', '文章标签信息修改：123->123123', '2019-08-20 14:13:27');
INSERT INTO `log_admin_operation` VALUES ('116', '1', 'operation', '127.0.0.1', '文章标签信息删除：123123', '2019-08-20 14:13:31');
INSERT INTO `log_admin_operation` VALUES ('117', '1', 'operation', '127.0.0.1', '文章分类信息添加：ces', '2019-08-20 14:13:43');
INSERT INTO `log_admin_operation` VALUES ('118', '1', 'operation', '127.0.0.1', '文章分类信息修改：ces->ces3', '2019-08-20 14:14:46');
INSERT INTO `log_admin_operation` VALUES ('119', '1', 'operation', '127.0.0.1', '文章分类信息删除：ces3', '2019-08-20 14:14:51');
INSERT INTO `log_admin_operation` VALUES ('120', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-22 15:53:20');
INSERT INTO `log_admin_operation` VALUES ('121', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-22 15:53:48');
INSERT INTO `log_admin_operation` VALUES ('122', '1', 'operation', '127.0.0.1', '文章标签信息修改：测试2->测试2', '2019-08-22 16:42:06');
INSERT INTO `log_admin_operation` VALUES ('123', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-23 09:17:56');
INSERT INTO `log_admin_operation` VALUES ('124', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-23 09:43:09');
INSERT INTO `log_admin_operation` VALUES ('125', '1', 'operation', '127.0.0.1', '文章信息添加：测试', '2019-08-23 10:41:37');
INSERT INTO `log_admin_operation` VALUES ('126', '1', 'operation', '127.0.0.1', '文章信息添加：', '2019-08-23 10:42:21');
INSERT INTO `log_admin_operation` VALUES ('127', '1', 'operation', '127.0.0.1', '文章信息添加：q未请翁', '2019-08-23 10:44:28');
INSERT INTO `log_admin_operation` VALUES ('128', '1', 'operation', '127.0.0.1', '文章信息添加：斯蒂芬森', '2019-08-23 10:45:10');
INSERT INTO `log_admin_operation` VALUES ('129', '1', 'operation', '127.0.0.1', '文章信息添加：e', '2019-08-23 10:49:56');
INSERT INTO `log_admin_operation` VALUES ('130', '1', 'operation', '127.0.0.1', '文章信息添加：123123', '2019-08-23 10:50:15');
INSERT INTO `log_admin_operation` VALUES ('131', '1', 'operation', '127.0.0.1', '文章信息添加：嗯嗯嗯', '2019-08-23 10:53:19');
INSERT INTO `log_admin_operation` VALUES ('132', '1', 'operation', '127.0.0.1', '文章信息添加：按位', '2019-08-23 10:54:13');
INSERT INTO `log_admin_operation` VALUES ('133', '1', 'operation', '127.0.0.1', '文章信息添加：e123123', '2019-08-23 11:02:19');
INSERT INTO `log_admin_operation` VALUES ('134', '1', 'operation', '127.0.0.1', '文章信息添加：斯蒂芬', '2019-08-23 11:06:33');
INSERT INTO `log_admin_operation` VALUES ('135', '1', 'operation', '127.0.0.1', '文章信息添加：撒发给', '2019-08-23 11:07:31');
INSERT INTO `log_admin_operation` VALUES ('136', '1', 'operation', '127.0.0.1', '文章信息添加：qwe ', '2019-08-23 11:35:52');
INSERT INTO `log_admin_operation` VALUES ('137', '1', 'operation', '127.0.0.1', '文章信息修改：qwe ->qwe ', '2019-08-23 13:42:17');
INSERT INTO `log_admin_operation` VALUES ('138', '1', 'operation', '127.0.0.1', '文章信息修改：qwe ->qwe 567', '2019-08-23 13:43:19');
INSERT INTO `log_admin_operation` VALUES ('139', '1', 'operation', '127.0.0.1', '文章信息修改：qwe 567->qwe 56788', '2019-08-23 13:43:56');
INSERT INTO `log_admin_operation` VALUES ('140', '1', 'operation', '127.0.0.1', '文章信息修改：qwe 56788->qwe 56788', '2019-08-23 13:44:07');
INSERT INTO `log_admin_operation` VALUES ('141', '1', 'operation', '127.0.0.1', '文章信息修改：qwe 56788->qwe 567887', '2019-08-23 13:44:11');
INSERT INTO `log_admin_operation` VALUES ('142', '1', 'operation', '127.0.0.1', '文章信息删除：e123123', '2019-08-23 13:50:28');
INSERT INTO `log_admin_operation` VALUES ('143', '1', 'operation', '127.0.0.1', '文章信息删除：', '2019-08-23 14:25:50');
INSERT INTO `log_admin_operation` VALUES ('144', '1', 'operation', '127.0.0.1', '文章信息删除：斯蒂芬', '2019-08-23 14:26:05');
INSERT INTO `log_admin_operation` VALUES ('145', '1', 'operation', '127.0.0.1', '文章信息添加：发电房萨芬是', '2019-08-23 14:26:27');
INSERT INTO `log_admin_operation` VALUES ('146', '1', 'operation', '127.0.0.1', '文章信息修改：发电房萨芬是->发电房萨芬是', '2019-08-23 14:28:45');
INSERT INTO `log_admin_operation` VALUES ('147', '1', 'operation', '127.0.0.1', '文章信息删除：发电房萨芬是', '2019-08-23 14:28:56');
INSERT INTO `log_admin_operation` VALUES ('148', '1', 'operation', '127.0.0.1', '文章信息删除：', '2019-08-23 14:29:06');
INSERT INTO `log_admin_operation` VALUES ('149', '1', 'operation', '127.0.0.1', '文章信息删除：on', '2019-08-23 14:29:08');
INSERT INTO `log_admin_operation` VALUES ('150', '1', 'operation', '127.0.0.1', '文章信息删除：斯蒂芬森', '2019-08-23 14:29:09');
INSERT INTO `log_admin_operation` VALUES ('151', '1', 'operation', '127.0.0.1', '文章信息删除：e', '2019-08-23 14:29:11');
INSERT INTO `log_admin_operation` VALUES ('152', '1', 'operation', '127.0.0.1', '文章信息删除：123123', '2019-08-23 14:29:12');
INSERT INTO `log_admin_operation` VALUES ('153', '1', 'operation', '127.0.0.1', '文章信息删除：', '2019-08-23 14:29:14');
INSERT INTO `log_admin_operation` VALUES ('154', '1', 'operation', '127.0.0.1', '文章信息删除：', '2019-08-23 14:29:15');
INSERT INTO `log_admin_operation` VALUES ('155', '1', 'operation', '127.0.0.1', '文章信息删除：撒发给', '2019-08-23 14:29:17');
INSERT INTO `log_admin_operation` VALUES ('156', '1', 'operation', '127.0.0.1', '文章信息删除：qwe 567887', '2019-08-23 14:29:19');
INSERT INTO `log_admin_operation` VALUES ('157', '1', 'operation', '127.0.0.1', '文章信息添加：测试', '2019-08-23 14:29:36');
INSERT INTO `log_admin_operation` VALUES ('158', '1', 'operation', '127.0.0.1', '文章信息修改：测试->测试', '2019-08-23 14:43:10');
INSERT INTO `log_admin_operation` VALUES ('159', '1', 'operation', '127.0.0.1', '文章信息修改：测试->测试', '2019-08-23 14:46:03');
INSERT INTO `log_admin_operation` VALUES ('160', '1', 'operation', '127.0.0.1', '文章信息修改：测试->测试', '2019-08-23 14:49:57');
INSERT INTO `log_admin_operation` VALUES ('161', '1', 'operation', '127.0.0.1', '文章信息修改：测试->测试', '2019-08-23 14:50:26');
INSERT INTO `log_admin_operation` VALUES ('162', '1', 'operation', '127.0.0.1', '文章信息修改：测试->测试', '2019-08-23 14:51:25');
INSERT INTO `log_admin_operation` VALUES ('163', '1', 'operation', '127.0.0.1', '文章信息修改：测试->测试', '2019-08-23 14:55:45');
INSERT INTO `log_admin_operation` VALUES ('164', '1', 'operation', '127.0.0.1', '文章信息修改：测试->测试', '2019-08-23 14:56:03');
INSERT INTO `log_admin_operation` VALUES ('165', '1', 'operation', '127.0.0.1', '文章信息修改：测试->测试', '2019-08-23 14:56:25');
INSERT INTO `log_admin_operation` VALUES ('166', '1', 'operation', '127.0.0.1', '文章信息修改：测试->测试', '2019-08-23 14:56:44');
INSERT INTO `log_admin_operation` VALUES ('167', '1', 'operation', '127.0.0.1', '文章信息修改：测试->测试', '2019-08-23 14:56:55');
INSERT INTO `log_admin_operation` VALUES ('168', '1', 'operation', '127.0.0.1', '文章信息修改：测试->测试', '2019-08-23 14:58:30');
INSERT INTO `log_admin_operation` VALUES ('169', '1', 'operation', '127.0.0.1', '文章信息修改：测试->测试', '2019-08-23 14:58:35');
INSERT INTO `log_admin_operation` VALUES ('170', '1', 'operation', '127.0.0.1', '方法信息添加：文章管理-列表', '2019-08-23 15:15:17');
INSERT INTO `log_admin_operation` VALUES ('171', '1', 'operation', '127.0.0.1', '方法信息添加：文章信息添加', '2019-08-23 15:15:41');
INSERT INTO `log_admin_operation` VALUES ('172', '1', 'operation', '127.0.0.1', '方法信息添加：文章信息添加提交', '2019-08-23 15:16:01');
INSERT INTO `log_admin_operation` VALUES ('173', '1', 'operation', '127.0.0.1', '方法信息添加：文章信息修改', '2019-08-23 15:16:21');
INSERT INTO `log_admin_operation` VALUES ('174', '1', 'operation', '127.0.0.1', '方法信息添加：文章信息修改提交', '2019-08-23 15:16:39');
INSERT INTO `log_admin_operation` VALUES ('175', '1', 'operation', '127.0.0.1', '方法信息添加：文章信息删除提交', '2019-08-23 15:16:58');
INSERT INTO `log_admin_operation` VALUES ('176', '1', 'operation', '127.0.0.1', '方法信息添加：文章信息内容获取', '2019-08-23 15:17:14');
INSERT INTO `log_admin_operation` VALUES ('177', '1', 'operation', '127.0.0.1', '方法信息添加：文章信息上传图片提交', '2019-08-23 15:17:29');
INSERT INTO `log_admin_operation` VALUES ('178', '1', 'operation', '127.0.0.1', '后台目录添加：文章列表', '2019-08-23 15:19:13');
INSERT INTO `log_admin_operation` VALUES ('179', '1', 'operation', '127.0.0.1', '方法信息修改：文章信息添加->文章信息添加', '2019-08-23 15:23:24');
INSERT INTO `log_admin_operation` VALUES ('180', '1', 'operation', '127.0.0.1', '方法信息修改：文章信息添加提交->文章信息添加提交', '2019-08-23 15:23:32');
INSERT INTO `log_admin_operation` VALUES ('181', '1', 'operation', '127.0.0.1', '方法信息修改：文章信息修改->文章信息修改', '2019-08-23 15:23:39');
INSERT INTO `log_admin_operation` VALUES ('182', '1', 'operation', '127.0.0.1', '方法信息修改：文章信息修改提交->文章信息修改提交', '2019-08-23 16:04:47');
INSERT INTO `log_admin_operation` VALUES ('183', '1', 'operation', '127.0.0.1', '方法信息修改：文章信息删除提交->文章信息删除提交', '2019-08-23 16:04:54');
INSERT INTO `log_admin_operation` VALUES ('184', '1', 'operation', '127.0.0.1', '方法信息修改：文章信息内容获取->文章信息内容获取', '2019-08-23 16:05:00');
INSERT INTO `log_admin_operation` VALUES ('185', '1', 'operation', '127.0.0.1', '方法信息修改：文章信息上传图片提交->文章信息上传图片提交', '2019-08-23 16:05:16');
INSERT INTO `log_admin_operation` VALUES ('186', '1', 'operation', '127.0.0.1', '角色信息权限设置：开发者', '2019-08-23 16:06:42');
INSERT INTO `log_admin_operation` VALUES ('187', '1', 'operation', '127.0.0.1', '角色信息权限设置：超级管理员', '2019-08-23 17:38:42');
INSERT INTO `log_admin_operation` VALUES ('188', '1', 'operation', '127.0.0.1', '分配角色给管理员：root->超级管理员', '2019-08-23 17:38:55');
INSERT INTO `log_admin_operation` VALUES ('189', '1', 'operation', '127.0.0.1', '分配角色给管理员：root->开发者', '2019-08-23 17:54:14');
INSERT INTO `log_admin_operation` VALUES ('190', '1', 'operation', '127.0.0.1', '方法信息修改：首页->首页', '2019-08-23 17:54:57');
INSERT INTO `log_admin_operation` VALUES ('191', '1', 'operation', '127.0.0.1', '后台目录修改：首页->首页', '2019-08-23 17:55:17');
INSERT INTO `log_admin_operation` VALUES ('192', '1', 'operation', '127.0.0.1', '后台目录修改：首页->首页', '2019-08-23 17:55:26');
INSERT INTO `log_admin_operation` VALUES ('193', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-26 14:27:42');
INSERT INTO `log_admin_operation` VALUES ('194', '1', 'operation', '127.0.0.1', '修改个人资料', '2019-08-26 14:37:57');
INSERT INTO `log_admin_operation` VALUES ('195', '1', 'operation', '127.0.0.1', '基本信息修改', '2019-08-26 14:39:55');
INSERT INTO `log_admin_operation` VALUES ('196', '1', 'operation', '127.0.0.1', '基本信息修改', '2019-08-26 14:40:05');
INSERT INTO `log_admin_operation` VALUES ('197', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-27 09:12:10');
INSERT INTO `log_admin_operation` VALUES ('198', '1', 'operation', '127.0.0.1', '会员信息添加：13939390111', '2019-08-27 11:01:39');
INSERT INTO `log_admin_operation` VALUES ('199', '1', 'operation', '127.0.0.1', '会员信息--二级密码修改：13939390001', '2019-08-27 15:56:15');
INSERT INTO `log_admin_operation` VALUES ('200', '1', 'operation', '127.0.0.1', '会员信息--信息编辑：13939390011', '2019-08-27 15:58:43');
INSERT INTO `log_admin_operation` VALUES ('201', '1', 'operation', '127.0.0.1', '会员信息--信息编辑：13939390011', '2019-08-27 15:59:03');
INSERT INTO `log_admin_operation` VALUES ('202', '1', 'operation', '127.0.0.1', '会员信息--信息编辑：13939390011', '2019-08-27 15:59:24');
INSERT INTO `log_admin_operation` VALUES ('203', '1', 'operation', '127.0.0.1', '会员信息--信息编辑：13939390011', '2019-08-27 15:59:27');
INSERT INTO `log_admin_operation` VALUES ('204', '1', 'operation', '127.0.0.1', '会员登录权限-冻结：13939390111', '2019-08-27 16:10:28');
INSERT INTO `log_admin_operation` VALUES ('205', '1', 'operation', '127.0.0.1', '会员登录权限-解封：13939390111', '2019-08-27 16:11:32');
INSERT INTO `log_admin_operation` VALUES ('206', '1', 'operation', '127.0.0.1', '会员登录权限-冻结：13939390111', '2019-08-27 16:11:42');
INSERT INTO `log_admin_operation` VALUES ('207', '1', 'operation', '127.0.0.1', '会员登录权限-解封：13939390111', '2019-08-27 16:11:44');
INSERT INTO `log_admin_operation` VALUES ('208', '1', 'operation', '127.0.0.1', '会员登录权限-冻结：13939390011', '2019-08-27 16:11:52');
INSERT INTO `log_admin_operation` VALUES ('209', '1', 'operation', '127.0.0.1', '会员登录权限-解封：13939390011', '2019-08-27 16:11:54');
INSERT INTO `log_admin_operation` VALUES ('210', '1', 'operation', '127.0.0.1', '会员登录权限-冻结：13939390111', '2019-08-27 16:12:13');
INSERT INTO `log_admin_operation` VALUES ('211', '1', 'operation', '127.0.0.1', '会员登录权限-解封：13939390111', '2019-08-27 16:12:14');
INSERT INTO `log_admin_operation` VALUES ('212', '1', 'operation', '127.0.0.1', '会员登录权限-冻结：13939390111', '2019-08-27 16:12:15');
INSERT INTO `log_admin_operation` VALUES ('213', '1', 'operation', '127.0.0.1', '会员登录权限-解封：13939390111', '2019-08-27 16:12:15');
INSERT INTO `log_admin_operation` VALUES ('214', '1', 'operation', '127.0.0.1', '会员登录权限-冻结：13939390111', '2019-08-27 16:12:16');
INSERT INTO `log_admin_operation` VALUES ('215', '1', 'operation', '127.0.0.1', '会员登录权限-解封：13939390111', '2019-08-27 16:12:16');
INSERT INTO `log_admin_operation` VALUES ('216', '1', 'operation', '127.0.0.1', '会员登录权限-冻结：13939390111', '2019-08-27 16:12:24');
INSERT INTO `log_admin_operation` VALUES ('217', '1', 'operation', '127.0.0.1', '会员登录权限-解封：13939390111', '2019-08-27 16:12:41');
INSERT INTO `log_admin_operation` VALUES ('218', '1', 'operation', '127.0.0.1', '会员信息添加：13939390002', '2019-08-27 16:19:19');
INSERT INTO `log_admin_operation` VALUES ('219', '1', 'operation', '127.0.0.1', '会员信息删除：13939390002', '2019-08-27 16:20:28');
INSERT INTO `log_admin_operation` VALUES ('220', '1', 'operation', '127.0.0.1', '会员信息添加：13939390002', '2019-08-27 16:21:34');
INSERT INTO `log_admin_operation` VALUES ('221', '1', 'operation', '127.0.0.1', '会员信息删除：13939390002', '2019-08-27 16:21:39');
INSERT INTO `log_admin_operation` VALUES ('222', '1', 'operation', '127.0.0.1', '会员信息添加：13939390002', '2019-08-27 16:22:13');
INSERT INTO `log_admin_operation` VALUES ('223', '1', 'operation', '127.0.0.1', '会员信息删除：13939390002', '2019-08-27 16:22:18');
INSERT INTO `log_admin_operation` VALUES ('224', '1', 'operation', '127.0.0.1', '模块信息添加：会员管理', '2019-08-27 16:22:50');
INSERT INTO `log_admin_operation` VALUES ('225', '1', 'operation', '127.0.0.1', '方法信息添加：会员管理--列表', '2019-08-27 16:23:28');
INSERT INTO `log_admin_operation` VALUES ('226', '1', 'operation', '127.0.0.1', '方法信息添加：会员信息添加表单', '2019-08-27 16:23:41');
INSERT INTO `log_admin_operation` VALUES ('227', '1', 'operation', '127.0.0.1', '方法信息添加：会员信息添加提交', '2019-08-27 16:23:52');
INSERT INTO `log_admin_operation` VALUES ('228', '1', 'operation', '127.0.0.1', '方法信息添加：会员团队列表', '2019-08-27 16:24:09');
INSERT INTO `log_admin_operation` VALUES ('229', '1', 'operation', '127.0.0.1', '方法信息添加：会员详情', '2019-08-27 16:24:27');
INSERT INTO `log_admin_operation` VALUES ('230', '1', 'operation', '127.0.0.1', '方法信息添加：会员信息编辑表单', '2019-08-27 16:24:36');
INSERT INTO `log_admin_operation` VALUES ('231', '1', 'operation', '127.0.0.1', '方法信息添加：会员信息编辑提交', '2019-08-27 16:24:45');
INSERT INTO `log_admin_operation` VALUES ('232', '1', 'operation', '127.0.0.1', '方法信息添加：会员登录权限设置', '2019-08-27 16:24:54');
INSERT INTO `log_admin_operation` VALUES ('233', '1', 'operation', '127.0.0.1', '方法信息添加：会员信息删除提交', '2019-08-27 16:25:19');
INSERT INTO `log_admin_operation` VALUES ('234', '1', 'operation', '127.0.0.1', '后台目录添加：会员管理', '2019-08-27 16:26:53');
INSERT INTO `log_admin_operation` VALUES ('235', '1', 'operation', '127.0.0.1', '后台目录添加：会员列表', '2019-08-27 16:28:27');
INSERT INTO `log_admin_operation` VALUES ('236', '1', 'operation', '127.0.0.1', '后台目录修改：会员列表->会员列表', '2019-08-27 16:28:39');
INSERT INTO `log_admin_operation` VALUES ('237', '1', 'operation', '127.0.0.1', '角色信息权限设置：开发者', '2019-08-27 16:28:57');
INSERT INTO `log_admin_operation` VALUES ('238', '1', 'operation', '127.0.0.1', '修改个人资料', '2019-08-27 17:03:50');
INSERT INTO `log_admin_operation` VALUES ('239', '1', 'operation', '127.0.0.1', '会员充值：给13939390001充值5余额', '2019-08-27 17:35:42');
INSERT INTO `log_admin_operation` VALUES ('240', '1', 'operation', '127.0.0.1', '会员充值：给13939390001充值10余额', '2019-08-27 17:36:37');
INSERT INTO `log_admin_operation` VALUES ('241', '1', 'operation', '127.0.0.1', '会员充值：给13939390001充值100余额', '2019-08-27 17:36:59');
INSERT INTO `log_admin_operation` VALUES ('242', '1', 'operation', '127.0.0.1', '会员充值：给13939390001充值50余额', '2019-08-27 17:37:47');
INSERT INTO `log_admin_operation` VALUES ('243', '1', 'operation', '127.0.0.1', '方法信息添加：会员充值表单', '2019-08-27 17:41:10');
INSERT INTO `log_admin_operation` VALUES ('244', '1', 'operation', '127.0.0.1', '方法信息添加：会员充值提交', '2019-08-27 17:41:28');
INSERT INTO `log_admin_operation` VALUES ('245', '1', 'operation', '127.0.0.1', '角色信息权限设置：开发者', '2019-08-27 17:41:38');
INSERT INTO `log_admin_operation` VALUES ('246', '1', 'operation', '127.0.0.1', '会员充值：给13939390001充值5余额', '2019-08-27 17:42:02');
INSERT INTO `log_admin_operation` VALUES ('247', '1', 'operation', '127.0.0.1', '会员充值：给13939390001充值1余额', '2019-08-27 17:42:12');
INSERT INTO `log_admin_operation` VALUES ('248', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-29 11:00:56');
INSERT INTO `log_admin_operation` VALUES ('249', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-30 14:26:31');
INSERT INTO `log_admin_operation` VALUES ('250', '1', 'operation', '127.0.0.1', '文章信息修改：测试->测试', '2019-08-30 14:41:15');
INSERT INTO `log_admin_operation` VALUES ('251', '1', 'operation', '127.0.0.1', '文章信息修改：测试->测试', '2019-08-30 14:48:04');
INSERT INTO `log_admin_operation` VALUES ('252', '1', 'operation', '127.0.0.1', '修改个人资料', '2019-08-30 16:52:08');
INSERT INTO `log_admin_operation` VALUES ('253', '1', 'operation', '127.0.0.1', '修改个人资料', '2019-08-30 16:52:30');
INSERT INTO `log_admin_operation` VALUES ('254', '1', 'operation', '127.0.0.1', '修改个人资料', '2019-08-30 17:25:21');
INSERT INTO `log_admin_operation` VALUES ('255', '1', 'operation', '127.0.0.1', '修改个人资料', '2019-08-30 17:26:02');
INSERT INTO `log_admin_operation` VALUES ('256', '1', 'operation', '127.0.0.1', '修改个人资料', '2019-08-30 17:26:07');
INSERT INTO `log_admin_operation` VALUES ('257', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-30 17:37:42');
INSERT INTO `log_admin_operation` VALUES ('258', '1', 'operation', '127.0.0.1', '会员登录权限-冻结：13939390111', '2019-08-30 18:00:19');
INSERT INTO `log_admin_operation` VALUES ('259', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-08-31 09:37:15');
INSERT INTO `log_admin_operation` VALUES ('260', '1', 'operation', '127.0.0.1', '文章信息添加：333', '2019-08-31 11:02:01');
INSERT INTO `log_admin_operation` VALUES ('261', '1', 'operation', '127.0.0.1', '文章信息删除：测试', '2019-08-31 11:03:00');
INSERT INTO `log_admin_operation` VALUES ('262', '1', 'operation', '127.0.0.1', '文章文章属性修改：333开启推荐', '2019-08-31 11:09:01');
INSERT INTO `log_admin_operation` VALUES ('263', '1', 'operation', '127.0.0.1', '文章文章属性修改：333取消推荐', '2019-08-31 11:09:07');
INSERT INTO `log_admin_operation` VALUES ('264', '1', 'operation', '127.0.0.1', '文章文章属性修改：333开启推荐', '2019-08-31 11:09:10');
INSERT INTO `log_admin_operation` VALUES ('265', '1', 'operation', '127.0.0.1', '文章文章属性修改：333开启置顶', '2019-08-31 11:09:35');
INSERT INTO `log_admin_operation` VALUES ('266', '1', 'operation', '127.0.0.1', '文章文章属性修改：333开启热门', '2019-08-31 11:09:37');
INSERT INTO `log_admin_operation` VALUES ('267', '1', 'operation', '127.0.0.1', '文章文章属性修改：333取消热门', '2019-08-31 11:09:53');
INSERT INTO `log_admin_operation` VALUES ('268', '1', 'operation', '127.0.0.1', '文章文章属性修改：333开启热门', '2019-08-31 11:09:54');
INSERT INTO `log_admin_operation` VALUES ('269', '1', 'operation', '127.0.0.1', '文章文章属性修改：333取消热门', '2019-08-31 11:26:43');
INSERT INTO `log_admin_operation` VALUES ('270', '1', 'operation', '127.0.0.1', '文章文章属性修改：333取消置顶', '2019-08-31 11:26:44');
INSERT INTO `log_admin_operation` VALUES ('271', '1', 'operation', '127.0.0.1', '文章文章属性修改：333取消推荐', '2019-08-31 11:26:44');
INSERT INTO `log_admin_operation` VALUES ('272', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-09-02 11:40:16');
INSERT INTO `log_admin_operation` VALUES ('273', '1', 'operation', '127.0.0.1', '会员登录权限-解冻：13939390111', '2019-09-02 13:34:21');
INSERT INTO `log_admin_operation` VALUES ('274', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-09-04 09:53:38');
INSERT INTO `log_admin_operation` VALUES ('275', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-09-04 09:53:42');

-- ----------------------------
-- Table structure for `sys_ad`
-- ----------------------------
DROP TABLE IF EXISTS `sys_ad`;
CREATE TABLE `sys_ad` (
  `ad_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `adv_id` int(3) NOT NULL DEFAULT '0' COMMENT '广告位id',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片',
  `value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '值',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  `sort` int(3) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_ad
-- ----------------------------
INSERT INTO `sys_ad` VALUES ('11', '6', '123', '', '444', '<p>sdfsf</p>', '1');

-- ----------------------------
-- Table structure for `sys_adv`
-- ----------------------------
DROP TABLE IF EXISTS `sys_adv`;
CREATE TABLE `sys_adv` (
  `adv_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '广告位id',
  `adv_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '广告位名称',
  `sign` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '广告位标签',
  `sort` tinyint(5) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_adv
-- ----------------------------
INSERT INTO `sys_adv` VALUES ('6', '1233', 'rrre', '1');

-- ----------------------------
-- Table structure for `sys_basic`
-- ----------------------------
DROP TABLE IF EXISTS `sys_basic`;
CREATE TABLE `sys_basic` (
  `id` tinyint(11) NOT NULL COMMENT 'id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `keyword` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '简介',
  `copyright` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '版权',
  `aq` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备案号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_basic
-- ----------------------------
INSERT INTO `sys_basic` VALUES ('1', 'aner_admin后台管理系统', 'aner_admin，php，后台管理系统', 'aner_admin后台管理系统', '', '');

-- ----------------------------
-- Table structure for `sys_catalog`
-- ----------------------------
DROP TABLE IF EXISTS `sys_catalog`;
CREATE TABLE `sys_catalog` (
  `catalog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '后台目录id',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `icon` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `module_id` int(11) DEFAULT NULL COMMENT '模块id',
  `action_id` int(11) DEFAULT NULL COMMENT '方法id',
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路径',
  `route` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由',
  `top_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级目录',
  `sort` tinyint(5) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_catalog
-- ----------------------------
INSERT INTO `sys_catalog` VALUES ('1', '开发者中心', 'la la-user-secret', '0', '0', '', '', '0', '100');
INSERT INTO `sys_catalog` VALUES ('2', '模块管理', 'la la-th-large', '2', '1', 'developer/module', '/adm/module', '1', '101');
INSERT INTO `sys_catalog` VALUES ('3', '方法管理', 'la la-th', '2', '8', 'developer/action', '/adm/action', '1', '102');
INSERT INTO `sys_catalog` VALUES ('4', '后台目录', 'la la-th-list', '2', '14', 'developer/catalog', '/adm/catalog', '1', '103');
INSERT INTO `sys_catalog` VALUES ('5', '静态资源管理', 'la la-file-o', '0', '0', '', '', '0', '110');
INSERT INTO `sys_catalog` VALUES ('6', '列表资源', 'la la-file-powerpoint-o', '4', '21', 'resource/table', '/adm/resource/table', '5', '111');
INSERT INTO `sys_catalog` VALUES ('7', '表单资源', 'la la-file-word-o', '4', '22', 'resource/form', '/adm/resource/form', '5', '112');
INSERT INTO `sys_catalog` VALUES ('8', '图标资源', 'la la-file-pdf-o', '4', '23', 'resource/icon', '/adm/resource/icon', '5', '113');
INSERT INTO `sys_catalog` VALUES ('9', '按钮资源', 'la la-file-audio-o', '4', '24', 'resource/button', '/adm/resource/button', '5', '114');
INSERT INTO `sys_catalog` VALUES ('10', '标题资源', 'la la-file-text', '4', '25', 'resource/text', '/adm/resource/text', '5', '115');
INSERT INTO `sys_catalog` VALUES ('11', '引导提示资源', 'la la-file-code-o', '4', '26', 'resource/notify', '/adm/resource/notify', '5', '116');
INSERT INTO `sys_catalog` VALUES ('12', '首页', 'la la-dashboard', '5', '27', 'index/index', '/adm', '0', '1');
INSERT INTO `sys_catalog` VALUES ('13', '管理设置', 'la la-slideshare', '0', '0', '', '', '0', '10');
INSERT INTO `sys_catalog` VALUES ('14', '角色管理', 'la la-sitemap', '8', '28', 'adm/role', '/adm/role', '13', '11');
INSERT INTO `sys_catalog` VALUES ('15', '管理员列表', 'la la-reddit', '8', '36', 'adm/admin', '/adm/admin', '13', '12');
INSERT INTO `sys_catalog` VALUES ('16', '系统设置', 'la la-cog', '0', '0', '', '', '0', '20');
INSERT INTO `sys_catalog` VALUES ('17', '基本信息', 'la la-leanpub', '9', '43', 'webset/basic', '/adm/basic', '16', '21');
INSERT INTO `sys_catalog` VALUES ('18', '网站设置', 'la la-wrench', '9', '45', 'webset/set', '/adm/set', '16', '22');
INSERT INTO `sys_catalog` VALUES ('19', '广告管理', ' la la-cc-amex', '10', '57', 'ad/ad', '/adm/ad', '16', '23');
INSERT INTO `sys_catalog` VALUES ('20', '个人中心', 'la la-institution', '0', '0', '', '', '0', '5');
INSERT INTO `sys_catalog` VALUES ('21', '个人资料', 'la la-hdd-o', '11', '69', 'me/detail', '/adm/me/detail', '20', '6');
INSERT INTO `sys_catalog` VALUES ('22', '修改密码', ' la la-edit', '11', '71', 'me/update_password', '/adm/me/update/password', '20', '7');
INSERT INTO `sys_catalog` VALUES ('23', '日志管理', 'la la-calendar', '0', '0', '', '', '0', '90');
INSERT INTO `sys_catalog` VALUES ('24', '管理员操作日志', 'la la-cutlery', '12', '73', 'log/admin_operation_log', '/adm/admin/operation/log', '23', '91');
INSERT INTO `sys_catalog` VALUES ('25', '管理员登录日志', 'la la-map-signs', '12', '74', 'log/admin_login_log', '/adm/admin/login/log', '23', '92');
INSERT INTO `sys_catalog` VALUES ('26', '文章管理', 'la la-server', '0', '0', '', '', '0', '80');
INSERT INTO `sys_catalog` VALUES ('27', '文章标签', 'la la-paste', '13', '75', 'cms/tag', '/adm/cms/tag', '26', '81');
INSERT INTO `sys_catalog` VALUES ('28', '文章分类', ' la la-puzzle-piece', '13', '81', 'cms/category', '/adm/cms/category', '26', '82');
INSERT INTO `sys_catalog` VALUES ('29', '文章列表', 'la la-tasks', '13', '88', 'cms/article', '/adm/cms/article', '26', '83');
INSERT INTO `sys_catalog` VALUES ('30', '会员管理', 'la la-users', '14', '96', '', '', '0', '30');
INSERT INTO `sys_catalog` VALUES ('31', '会员列表', 'la la-street-view', '14', '96', 'user/user', '/adm/user', '30', '31');

-- ----------------------------
-- Table structure for `sys_module`
-- ----------------------------
DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模块id',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模块名称',
  `sort` tinyint(4) DEFAULT NULL COMMENT '排序',
  `remark` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_module
-- ----------------------------
INSERT INTO `sys_module` VALUES ('2', '开发者中心', '100', '');
INSERT INTO `sys_module` VALUES ('4', '静态资源管理', '110', '');
INSERT INTO `sys_module` VALUES ('5', '首页', '1', '');
INSERT INTO `sys_module` VALUES ('8', '管理设置', '10', '');
INSERT INTO `sys_module` VALUES ('9', '系统设置', '20', '');
INSERT INTO `sys_module` VALUES ('10', '广告模块', '30', '');
INSERT INTO `sys_module` VALUES ('11', '个人中心', '40', '');
INSERT INTO `sys_module` VALUES ('12', '日志管理', '90', '');
INSERT INTO `sys_module` VALUES ('13', '文章管理', '80', '');
INSERT INTO `sys_module` VALUES ('14', '会员管理', '50', '');

-- ----------------------------
-- Table structure for `sys_module_action`
-- ----------------------------
DROP TABLE IF EXISTS `sys_module_action`;
CREATE TABLE `sys_module_action` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '方法id',
  `module_id` int(11) DEFAULT NULL COMMENT '模块id',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名称',
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路径',
  `route` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由',
  `sort` tinyint(5) DEFAULT NULL COMMENT '排序',
  `remark` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_module_action
-- ----------------------------
INSERT INTO `sys_module_action` VALUES ('1', '2', '模块管理-列表', 'developer/module', '/adm/module', '1', '');
INSERT INTO `sys_module_action` VALUES ('3', '2', '模块信息添加表单', 'developer/module_add', '', '2', null);
INSERT INTO `sys_module_action` VALUES ('4', '2', '模块信息添加提交', 'developer/module_add_submit', '', '3', '');
INSERT INTO `sys_module_action` VALUES ('5', '2', '模块信息修改表单', 'developer/module_update', '', '4', '');
INSERT INTO `sys_module_action` VALUES ('6', '2', '模块信息修改提交', 'developer/module_update_submit', '', '5', '');
INSERT INTO `sys_module_action` VALUES ('7', '2', '模块信息删除提交', 'developer/module_delete_submit', '', '6', '');
INSERT INTO `sys_module_action` VALUES ('8', '2', '方法管理-列表', 'developer/action', '/adm/action', '7', '');
INSERT INTO `sys_module_action` VALUES ('9', '2', '方法信息添加表单', 'developer/action_add', null, '8', '');
INSERT INTO `sys_module_action` VALUES ('10', '2', '方法信息添加提交', 'developer/action_add_submit', null, '9', '');
INSERT INTO `sys_module_action` VALUES ('11', '2', '方法信息修改表单', 'developer/action_update', null, '10', '');
INSERT INTO `sys_module_action` VALUES ('12', '2', '方法信息修改提交', 'developer/action_update_submit', null, '11', '');
INSERT INTO `sys_module_action` VALUES ('13', '2', '方法信息删除提交', 'developer/action_delete_submit', null, '12', '');
INSERT INTO `sys_module_action` VALUES ('14', '2', '后台目录管理-列表', 'developer/catalog', '/adm/catalog', '13', '');
INSERT INTO `sys_module_action` VALUES ('15', '2', '后台目录添加表单', 'developer/catalog_add', null, '14', '');
INSERT INTO `sys_module_action` VALUES ('16', '2', '后台目录添加提交', 'developer/catalog_add_submit', null, '15', '');
INSERT INTO `sys_module_action` VALUES ('18', '2', '后台目录修改表单', 'developer/catalog_update', null, '16', '');
INSERT INTO `sys_module_action` VALUES ('19', '2', '后台目录修改提交', 'developer/catalog_update_submit', null, '17', '');
INSERT INTO `sys_module_action` VALUES ('20', '2', '后台目录删除提交', 'developer/catalog_delete_submit', null, '18', '');
INSERT INTO `sys_module_action` VALUES ('21', '4', '列表资源', 'resource/table', '/adm/resource/table', '19', '');
INSERT INTO `sys_module_action` VALUES ('22', '4', '表单资源', 'resource/form', '/adm/resource/form', '20', '');
INSERT INTO `sys_module_action` VALUES ('23', '4', '图标资源', 'resource/icon', '/adm/resource/icon', '21', '');
INSERT INTO `sys_module_action` VALUES ('24', '4', '按钮资源', 'resource/button', '/adm/resource/button', '22', '');
INSERT INTO `sys_module_action` VALUES ('25', '4', '标题资源', 'resource/text', '/adm/resource/text', '23', '');
INSERT INTO `sys_module_action` VALUES ('26', '4', '引导提示资源', 'resource/notify', '/adm/resource/notify', '24', '');
INSERT INTO `sys_module_action` VALUES ('27', '5', '首页', 'index/index', '/adm', '25', '');
INSERT INTO `sys_module_action` VALUES ('28', '8', '角色管理-列表', 'adm/role', '/adm/role', '26', '');
INSERT INTO `sys_module_action` VALUES ('29', '8', '角色信息添加表单', 'adm/role_add', null, '27', '');
INSERT INTO `sys_module_action` VALUES ('30', '8', '角色信息添加提交', 'adm/role_add_submit', null, '28', '');
INSERT INTO `sys_module_action` VALUES ('31', '8', '角色信息修改表单', 'adm/role_update', null, '29', '');
INSERT INTO `sys_module_action` VALUES ('32', '8', '角色信息修改提交', 'adm/role_update_submit', null, '30', '');
INSERT INTO `sys_module_action` VALUES ('33', '8', '角色信息删除提交', 'adm/role_delete_submit', null, '31', '');
INSERT INTO `sys_module_action` VALUES ('34', '8', '角色权限设置表单', 'adm/role_power', null, '32', '');
INSERT INTO `sys_module_action` VALUES ('35', '8', '角色权限设置提交', 'adm/role_power_submit', null, '33', '');
INSERT INTO `sys_module_action` VALUES ('36', '8', '管理员列表', 'adm/admin', '/adm/admin', '34', '');
INSERT INTO `sys_module_action` VALUES ('37', '8', '管理员信息添加表单', 'adm/admin_add', null, '35', '');
INSERT INTO `sys_module_action` VALUES ('38', '8', '管理员信息添加提交', 'adm/admin_add_submit', null, '36', '');
INSERT INTO `sys_module_action` VALUES ('39', '8', '管理员信息修改表单', 'adm/admin_update', null, '37', '');
INSERT INTO `sys_module_action` VALUES ('40', '8', '管理员信息修改提交', 'adm/admin_update_submit', null, '38', '');
INSERT INTO `sys_module_action` VALUES ('41', '8', '管理员信息删除提交', 'adm/admin_delete_submit', null, '39', '');
INSERT INTO `sys_module_action` VALUES ('42', '8', '分配管理员角色', 'adm/admin_allot', null, '40', '');
INSERT INTO `sys_module_action` VALUES ('43', '9', '基本信息', 'webset/basic', '/adm/basic', '41', '');
INSERT INTO `sys_module_action` VALUES ('44', '9', '基本信息修改提交', 'webset/basic_submit', null, '42', '');
INSERT INTO `sys_module_action` VALUES ('45', '9', '网站设置-列表', 'webset/set', '/adm/set', '43', '');
INSERT INTO `sys_module_action` VALUES ('46', '9', '网站设置分类信息添加表单', 'webset/set_category_add', null, '44', '');
INSERT INTO `sys_module_action` VALUES ('47', '9', '网站设置分类信息添加提交', 'webset/set_category_add_submit', null, '45', '');
INSERT INTO `sys_module_action` VALUES ('48', '9', '网站设置分类信息修改表单', 'webset/set_category_update', null, '46', '');
INSERT INTO `sys_module_action` VALUES ('49', '9', '网站设置分类信息修改提交', 'webset/set_category_update_submit', null, '47', '');
INSERT INTO `sys_module_action` VALUES ('50', '9', '网站设置分类信息删除提交', 'webset/set_category_delete_submit', null, '48', '');
INSERT INTO `sys_module_action` VALUES ('51', '9', '网站设置信息添加表单', 'webset/set_set_add', null, '49', '');
INSERT INTO `sys_module_action` VALUES ('52', '9', '网站设置信息添加提交', 'webset/set_set_add_submit', null, '50', '');
INSERT INTO `sys_module_action` VALUES ('53', '9', '网站设置信息修改表单', 'webset/set_set_update', null, '51', '');
INSERT INTO `sys_module_action` VALUES ('54', '9', '网站设置信息修改提交', 'webset/set_set_update_submit', null, '52', '');
INSERT INTO `sys_module_action` VALUES ('55', '9', '网站设置信息删除提交', 'webset/set_set_delete_submit', null, '53', '');
INSERT INTO `sys_module_action` VALUES ('56', '9', '网站设置信息值提交', 'webset/set_set_value_submit', null, '54', '');
INSERT INTO `sys_module_action` VALUES ('57', '10', '广告管理-列表', 'ad/ad', '/adm/ad', '55', '');
INSERT INTO `sys_module_action` VALUES ('58', '10', '广告位信息添加表单', 'ad/ad_adv_add', null, '56', '');
INSERT INTO `sys_module_action` VALUES ('59', '10', '广告位信息添加提交', 'ad/ad_adv_add_submit', null, '57', '');
INSERT INTO `sys_module_action` VALUES ('60', '10', '广告位信息修改表单', 'ad/ad_adv_update', null, '58', '');
INSERT INTO `sys_module_action` VALUES ('61', '10', '广告位信息修改提交', 'ad/ad_adv_update_submit', null, '59', '');
INSERT INTO `sys_module_action` VALUES ('62', '10', '广告位信息删除提交', 'ad/ad_adv_delete_submit', null, '60', '');
INSERT INTO `sys_module_action` VALUES ('63', '10', '广告信息添加表单', 'ad/ad_ad_add', null, '61', '');
INSERT INTO `sys_module_action` VALUES ('64', '10', '广告信息添加提交', 'ad/ad_ad_add_submit', null, '62', '');
INSERT INTO `sys_module_action` VALUES ('65', '10', '广告信息修改表单', 'ad/ad_ad_update', null, '63', '');
INSERT INTO `sys_module_action` VALUES ('66', '10', '广告信息修改提交', 'ad/ad_ad_update_submit', null, '64', '');
INSERT INTO `sys_module_action` VALUES ('67', '10', '广告信息删除提交', 'ad/ad_ad_delete_submit', null, '65', '');
INSERT INTO `sys_module_action` VALUES ('68', '10', '广告信息文本编辑上传图片提交', 'ad/ad_img', null, '66', '');
INSERT INTO `sys_module_action` VALUES ('69', '11', '个人资料', 'me/detail', '/adm/me/detail', '67', '');
INSERT INTO `sys_module_action` VALUES ('70', '11', '个人资料修改提交', 'me/detail_submit', null, '68', '');
INSERT INTO `sys_module_action` VALUES ('71', '11', '修改密码', 'me/update_password', '/adm/me/update/password', '69', '');
INSERT INTO `sys_module_action` VALUES ('72', '11', '修改密码提交', 'me/update_password_submit', null, '70', '');
INSERT INTO `sys_module_action` VALUES ('73', '12', '管理员操作日志列表', 'log/admin_operation_log', '/adm/admin/operation/log', '71', '');
INSERT INTO `sys_module_action` VALUES ('74', '12', '管理员登录日志', 'log/admin_login_log', '/adm/admin/login/log', '72', '');
INSERT INTO `sys_module_action` VALUES ('75', '13', '文章标签管理-列表', 'cms/tag', '/adm/cms/tag', '73', '');
INSERT INTO `sys_module_action` VALUES ('76', '13', '文章标签信息添加表单', 'cms/tag_add', null, '74', '');
INSERT INTO `sys_module_action` VALUES ('77', '13', '文章标签信息添加提交', 'cms/tag_add_submit', null, '75', '');
INSERT INTO `sys_module_action` VALUES ('78', '13', '文章标签信息修改表单', 'cms/tag_update', null, '76', '');
INSERT INTO `sys_module_action` VALUES ('79', '13', '文章标签信息修改提交', 'cms/tag_update_submit', null, '77', '');
INSERT INTO `sys_module_action` VALUES ('80', '13', '文章标签信息删除提交', 'cms/tag_delete_submit', null, '78', '');
INSERT INTO `sys_module_action` VALUES ('81', '13', '文章分类管理-列表', 'cms/category', '/adm/cms/category', '79', '');
INSERT INTO `sys_module_action` VALUES ('82', '13', '文章分类信息添加表单', 'cms/category_add', null, '80', '');
INSERT INTO `sys_module_action` VALUES ('83', '13', '文章分类信息添加提交', 'cms/category_add_submit', null, '81', '');
INSERT INTO `sys_module_action` VALUES ('84', '13', '文章分类信息修改表单', 'cms/category_update', null, '82', '');
INSERT INTO `sys_module_action` VALUES ('85', '13', '文章分类信息修改提交', 'cms/category_update_submit', null, '83', '');
INSERT INTO `sys_module_action` VALUES ('86', '13', '文章分类信息删除提交', 'cms/category_delete_submit', null, '84', '');
INSERT INTO `sys_module_action` VALUES ('88', '13', '文章管理-列表', 'cms/article', '/adm/cms/article', '85', '');
INSERT INTO `sys_module_action` VALUES ('89', '13', '文章信息添加', 'cms/article_add', '', '86', '');
INSERT INTO `sys_module_action` VALUES ('90', '13', '文章信息添加提交', 'cms/article_add_submit', '', '87', '');
INSERT INTO `sys_module_action` VALUES ('91', '13', '文章信息修改', 'cms/article_update', '', '88', '');
INSERT INTO `sys_module_action` VALUES ('92', '13', '文章信息修改提交', 'cms/article_update_submit', '', '89', '');
INSERT INTO `sys_module_action` VALUES ('93', '13', '文章信息删除提交', 'cms/article_delete_submit', '', '90', '');
INSERT INTO `sys_module_action` VALUES ('94', '13', '文章信息内容获取', 'cms/article_content', '', '91', '');
INSERT INTO `sys_module_action` VALUES ('95', '13', '文章信息上传图片提交', 'cms/article_img', '', '92', '');
INSERT INTO `sys_module_action` VALUES ('96', '14', '会员管理--列表', 'user/user', '/adm/user', '93', '');
INSERT INTO `sys_module_action` VALUES ('97', '14', '会员信息添加表单', 'user/user_add', '', '94', '');
INSERT INTO `sys_module_action` VALUES ('98', '14', '会员信息添加提交', 'user/user_add_submit', '', '95', '');
INSERT INTO `sys_module_action` VALUES ('99', '14', '会员团队列表', 'user/user_team', '', '96', '');
INSERT INTO `sys_module_action` VALUES ('100', '14', '会员详情', 'user/user_detail', '', '97', '');
INSERT INTO `sys_module_action` VALUES ('101', '14', '会员信息编辑表单', 'user/user_update', '', '98', '');
INSERT INTO `sys_module_action` VALUES ('102', '14', '会员信息编辑提交', 'user/user_update_submit', '', '99', '');
INSERT INTO `sys_module_action` VALUES ('103', '14', '会员登录权限设置', 'user/user_freeze', '', '100', '');
INSERT INTO `sys_module_action` VALUES ('104', '14', '会员信息删除提交', 'user/user_delete', '', '101', '');
INSERT INTO `sys_module_action` VALUES ('105', '14', '会员充值表单', 'user/user_recharge', '', '102', '');
INSERT INTO `sys_module_action` VALUES ('106', '14', '会员充值提交', 'user/user_recharge_submit', '', '103', '');

-- ----------------------------
-- Table structure for `sys_set`
-- ----------------------------
DROP TABLE IF EXISTS `sys_set`;
CREATE TABLE `sys_set` (
  `set_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '网站设置id',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '网站设置分类id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `sign` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型',
  `value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '值',
  `sort` tinyint(5) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_set
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_set_category`
-- ----------------------------
DROP TABLE IF EXISTS `sys_set_category`;
CREATE TABLE `sys_set_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设置分类id',
  `category_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设置分类名称',
  `sort` tinyint(5) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_set_category
-- ----------------------------
