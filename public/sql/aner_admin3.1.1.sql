/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : aner_admin

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2020-06-18 15:22:17
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of adm_admin
-- ----------------------------
INSERT INTO `adm_admin` VALUES ('1', 'root', '42960a50f11334ea5bcba697e67bc7b0', 'BJPrExO9', '/storage/admin_via/20191223\\cffa5aa1724e4b3aef20524a7eea66b5.jpg', '开发者账号', '4', '13939390003', '1223050252@qq.com', '1223050251', 'anyuhanfeifff');
INSERT INTO `adm_admin` VALUES ('7', 'admin', '73822800f3ac3f45ef7827297a6ec572', 'O8Vhk8vT', '', '超级管理员', '1', '', '', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of adm_role
-- ----------------------------
INSERT INTO `adm_role` VALUES ('1', '超级管理员', '2', '', ',27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,51,52,117,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,96,97,98,99,100,101,102,103,104,105,106,75,76,77,78,79,80,81,82,83,84,85,86,88,89,90,91,92,93,94,95,73,74,115,116,');
INSERT INTO `adm_role` VALUES ('4', '开发者', '1', '', ',27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,51,52,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,96,97,98,99,100,101,102,103,104,105,106,75,76,77,78,79,80,81,82,83,84,85,86,88,89,90,91,92,93,94,95,73,74,115,116,1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,18,19,20,21,22,23,24,25,26,');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of cms_article
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
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of cms_article_data
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of cms_category
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of cms_tag
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of idx_user
-- ----------------------------
INSERT INTO `idx_user` VALUES ('16', '', '13939390001', '', '暗语寒飞', 'fc70e57840c32fc0ca482ca8fe352353', '123456', '36qIz3', '0', '2020-05-29', '1');

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
INSERT INTO `idx_user_count` VALUES ('16', '0', '0');

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
  `wx_qrcode` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信--收款二维码',
  `alipay_account` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付宝--支付宝账号',
  `alipay_username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付宝--支付宝实名认证姓名',
  `alipay_qrcode` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付宝--收款二维码',
  `qq` varchar(15) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'qq',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of idx_user_data
-- ----------------------------
INSERT INTO `idx_user_data` VALUES ('16', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

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
INSERT INTO `idx_user_fund` VALUES ('16', '0.00');

-- ----------------------------
-- Table structure for `log_admin_operation`
-- ----------------------------
DROP TABLE IF EXISTS `log_admin_operation`;
CREATE TABLE `log_admin_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员操作日志',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型，operation操作，login登录',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'ip',
  `content` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `remark` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `insert_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=709 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of log_admin_operation
-- ----------------------------

-- ----------------------------
-- Table structure for `log_user_fund`
-- ----------------------------
DROP TABLE IF EXISTS `log_user_fund`;
CREATE TABLE `log_user_fund` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资金流水记录',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `user_identity` varchar(30) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员标识',
  `number` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '金额',
  `coin_type` varchar(30) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '币种',
  `fund_type` varchar(30) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作类型',
  `content` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '说明',
  `remark` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `insert_time` datetime NOT NULL COMMENT '记录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of log_user_fund
-- ----------------------------

-- ----------------------------
-- Table structure for `log_user_operation`
-- ----------------------------
DROP TABLE IF EXISTS `log_user_operation`;
CREATE TABLE `log_user_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员操作表',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `user_identity` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员标识',
  `content` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作内容',
  `remark` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `ip` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'ip',
  `insert_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of log_user_operation
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_ad`
-- ----------------------------
DROP TABLE IF EXISTS `sys_ad`;
CREATE TABLE `sys_ad` (
  `ad_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `adv_id` int(3) NOT NULL DEFAULT '0' COMMENT '广告位id',
  `sign` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片',
  `value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '值',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_adv`
-- ----------------------------
DROP TABLE IF EXISTS `sys_adv`;
CREATE TABLE `sys_adv` (
  `adv_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '广告位id',
  `adv_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '广告位名称',
  `sign` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '广告位标签',
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_adv
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_catalog
-- ----------------------------
INSERT INTO `sys_catalog` VALUES ('1', '开发者中心', 'la la-user-secret', '0', '0', '', '', '0', '29');
INSERT INTO `sys_catalog` VALUES ('2', '模块管理', 'la la-th-large', '2', '1', 'developer/module', '/admin/module', '1', '1');
INSERT INTO `sys_catalog` VALUES ('3', '方法管理', 'la la-th', '2', '8', 'developer/action', '/admin/action', '1', '2');
INSERT INTO `sys_catalog` VALUES ('4', '后台目录', 'la la-th-list', '2', '14', 'developer/catalog', '/admin/catalog', '1', '3');
INSERT INTO `sys_catalog` VALUES ('5', '静态资源管理', 'la la-file-o', '0', '0', '', '', '0', '30');
INSERT INTO `sys_catalog` VALUES ('6', '列表资源', 'la la-file-powerpoint-o', '4', '21', 'resource/table', '/admin/resource/table', '5', '4');
INSERT INTO `sys_catalog` VALUES ('7', '表单资源', 'la la-file-word-o', '4', '22', 'resource/form', '/admin/resource/form', '5', '5');
INSERT INTO `sys_catalog` VALUES ('8', '图标资源', 'la la-file-pdf-o', '4', '23', 'resource/icon', '/admin/resource/icon', '5', '6');
INSERT INTO `sys_catalog` VALUES ('9', '按钮资源', 'la la-file-audio-o', '4', '24', 'resource/button', '/admin/resource/button', '5', '7');
INSERT INTO `sys_catalog` VALUES ('10', '标题资源', 'la la-file-text', '4', '25', 'resource/text', '/admin/resource/text', '5', '8');
INSERT INTO `sys_catalog` VALUES ('11', '引导提示资源', 'la la-file-code-o', '4', '26', 'resource/notify', '/admin/resource/notify', '5', '9');
INSERT INTO `sys_catalog` VALUES ('12', '首页', 'la la-dashboard', '5', '27', 'index/index', '/admin', '0', '0');
INSERT INTO `sys_catalog` VALUES ('13', '管理设置', 'la la-slideshare', '0', '0', '', '', '0', '2');
INSERT INTO `sys_catalog` VALUES ('14', '角色管理', 'la la-sitemap', '8', '28', 'adm/role', '/admin/role', '13', '1');
INSERT INTO `sys_catalog` VALUES ('15', '管理员列表', 'la la-reddit', '8', '36', 'adm/admin', '/admin/admin', '13', '2');
INSERT INTO `sys_catalog` VALUES ('16', '系统设置', 'la la-cog', '0', '0', '', '', '0', '3');
INSERT INTO `sys_catalog` VALUES ('17', '基本信息', 'la la-leanpub', '9', '43', 'webset/basic', '/admin/basic', '16', '1');
INSERT INTO `sys_catalog` VALUES ('18', '网站设置', 'la la-wrench', '9', '45', 'webset/setting', '/admin/setting', '16', '2');
INSERT INTO `sys_catalog` VALUES ('19', '广告管理', ' la la-cc-amex', '10', '57', 'ad/ad', '/admin/ad', '16', '1');
INSERT INTO `sys_catalog` VALUES ('20', '个人中心', 'la la-institution', '0', '0', '', '', '0', '1');
INSERT INTO `sys_catalog` VALUES ('21', '个人资料', 'la la-hdd-o', '11', '69', 'me/detail', '/admin/me/detail', '20', '1');
INSERT INTO `sys_catalog` VALUES ('22', '修改密码', ' la la-edit', '11', '71', 'me/update_password', '/admin/me/update/password', '20', '2');
INSERT INTO `sys_catalog` VALUES ('23', '日志管理', 'la la-calendar', '0', '0', '', '', '0', '20');
INSERT INTO `sys_catalog` VALUES ('24', '管理员操作日志', 'la la-cutlery', '12', '73', 'log/admin_operation_log', '/admin/admin/operation/log', '23', '1');
INSERT INTO `sys_catalog` VALUES ('25', '管理员登录日志', 'la la-map-signs', '12', '74', 'log/admin_login_log', '/admin/admin/login/log', '23', '2');
INSERT INTO `sys_catalog` VALUES ('26', '文章管理', 'la la-server', '0', '0', '', '', '0', '15');
INSERT INTO `sys_catalog` VALUES ('27', '文章标签', 'la la-paste', '13', '75', 'cms/tag', '/admin/cms/tag', '26', '1');
INSERT INTO `sys_catalog` VALUES ('28', '文章分类', ' la la-puzzle-piece', '13', '81', 'cms/category', '/admin/cms/category', '26', '2');
INSERT INTO `sys_catalog` VALUES ('29', '文章列表', 'la la-tasks', '13', '88', 'cms/article', '/admin/cms/article', '26', '3');
INSERT INTO `sys_catalog` VALUES ('30', '会员管理', 'la la-users', '0', '0', '', '', '0', '10');
INSERT INTO `sys_catalog` VALUES ('31', '会员列表', 'la la-street-view', '14', '96', 'user/user', '/admin/user', '30', '1');
INSERT INTO `sys_catalog` VALUES ('35', '会员资金流水日志', 'la la-credit-card', '14', '115', 'log/user_fund_log', '/admin/user/fund/log', '23', '2');
INSERT INTO `sys_catalog` VALUES ('36', '会员操作日志', 'la la-newspaper-o', '12', '116', 'log/user_operation_log', '/admin/user/operation/log', '23', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_module_action
-- ----------------------------
INSERT INTO `sys_module_action` VALUES ('1', '2', '模块管理-列表', 'developer/module', '/admin/module', '1', '');
INSERT INTO `sys_module_action` VALUES ('3', '2', '模块信息添加-表单', 'developer/module_add', '', '2', null);
INSERT INTO `sys_module_action` VALUES ('4', '2', '模块信息添加-提交', 'developer/module_add_submit', '', '3', '');
INSERT INTO `sys_module_action` VALUES ('5', '2', '模块信息修改-表单', 'developer/module_update', '', '4', '');
INSERT INTO `sys_module_action` VALUES ('6', '2', '模块信息修改-提交', 'developer/module_update_submit', '', '5', '');
INSERT INTO `sys_module_action` VALUES ('7', '2', '模块信息删除-操作', 'developer/module_delete_submit', '', '6', '');
INSERT INTO `sys_module_action` VALUES ('8', '2', '方法管理-列表', 'developer/action', '/admin/action', '7', '');
INSERT INTO `sys_module_action` VALUES ('9', '2', '方法信息添加-表单', 'developer/action_add', null, '8', '');
INSERT INTO `sys_module_action` VALUES ('10', '2', '方法信息添加-提交', 'developer/action_add_submit', null, '9', '');
INSERT INTO `sys_module_action` VALUES ('11', '2', '方法信息修改-表单', 'developer/action_update', null, '10', '');
INSERT INTO `sys_module_action` VALUES ('12', '2', '方法信息修改-提交', 'developer/action_update_submit', null, '11', '');
INSERT INTO `sys_module_action` VALUES ('13', '2', '方法信息删除-操作', 'developer/action_delete_submit', null, '12', '');
INSERT INTO `sys_module_action` VALUES ('14', '2', '后台目录管理-列表', 'developer/catalog', '/admin/catalog', '13', '');
INSERT INTO `sys_module_action` VALUES ('15', '2', '后台目录添加-表单', 'developer/catalog_add', null, '14', '');
INSERT INTO `sys_module_action` VALUES ('16', '2', '后台目录添加-提交', 'developer/catalog_add_submit', null, '15', '');
INSERT INTO `sys_module_action` VALUES ('18', '2', '后台目录修改-表单', 'developer/catalog_update', null, '16', '');
INSERT INTO `sys_module_action` VALUES ('19', '2', '后台目录修改-提交', 'developer/catalog_update_submit', null, '17', '');
INSERT INTO `sys_module_action` VALUES ('20', '2', '后台目录删除-操作', 'developer/catalog_delete_submit', null, '18', '');
INSERT INTO `sys_module_action` VALUES ('21', '4', '列表资源-展示页', 'resource/table', '/admin/resource/table', '1', '');
INSERT INTO `sys_module_action` VALUES ('22', '4', '表单资源-展示页', 'resource/form', '/admin/resource/form', '2', '');
INSERT INTO `sys_module_action` VALUES ('23', '4', '图标资源-展示页', 'resource/icon', '/admin/resource/icon', '3', '');
INSERT INTO `sys_module_action` VALUES ('24', '4', '按钮资源-展示页', 'resource/button', '/admin/resource/button', '4', '');
INSERT INTO `sys_module_action` VALUES ('25', '4', '标题资源-展示页', 'resource/text', '/admin/resource/text', '5', '');
INSERT INTO `sys_module_action` VALUES ('26', '4', '引导提示资源-展示页', 'resource/notify', '/admin/resource/notify', '6', '');
INSERT INTO `sys_module_action` VALUES ('27', '5', '首页', 'index/index', '/admin', '1', '');
INSERT INTO `sys_module_action` VALUES ('28', '8', '角色管理-列表', 'adm/role', '/admin/role', '1', '');
INSERT INTO `sys_module_action` VALUES ('29', '8', '角色信息添加-表单', 'adm/role_add', null, '2', '');
INSERT INTO `sys_module_action` VALUES ('30', '8', '角色信息添加-提交', 'adm/role_add_submit', null, '3', '');
INSERT INTO `sys_module_action` VALUES ('31', '8', '角色信息修改-表单', 'adm/role_update', null, '4', '');
INSERT INTO `sys_module_action` VALUES ('32', '8', '角色信息修改-提交', 'adm/role_update_submit', null, '5', '');
INSERT INTO `sys_module_action` VALUES ('33', '8', '角色信息删除-操作', 'adm/role_delete_submit', null, '6', '');
INSERT INTO `sys_module_action` VALUES ('34', '8', '角色权限设置-表单', 'adm/role_power', null, '7', '');
INSERT INTO `sys_module_action` VALUES ('35', '8', '角色权限设置-提交', 'adm/role_power_submit', null, '8', '');
INSERT INTO `sys_module_action` VALUES ('36', '8', '管理员管理-列表', 'adm/admin', '/admin/admin', '9', '');
INSERT INTO `sys_module_action` VALUES ('37', '8', '管理员信息添加-表单', 'adm/admin_add', null, '10', '');
INSERT INTO `sys_module_action` VALUES ('38', '8', '管理员信息添加-提交', 'adm/admin_add_submit', null, '11', '');
INSERT INTO `sys_module_action` VALUES ('39', '8', '管理员信息修改-表单', 'adm/admin_update', null, '12', '');
INSERT INTO `sys_module_action` VALUES ('40', '8', '管理员信息修改-提交', 'adm/admin_update_submit', null, '13', '');
INSERT INTO `sys_module_action` VALUES ('41', '8', '管理员信息删除-操作', 'adm/admin_delete_submit', null, '14', '');
INSERT INTO `sys_module_action` VALUES ('42', '8', '分配管理员角色-操作', 'adm/admin_allot', null, '15', '');
INSERT INTO `sys_module_action` VALUES ('43', '9', '基本信息展示-表单', 'webset/basic', '/admin/basic', '1', '');
INSERT INTO `sys_module_action` VALUES ('44', '9', '基本信息修改-提交', 'webset/basic_submit', null, '2', '');
INSERT INTO `sys_module_action` VALUES ('45', '9', '网站设置-列表', 'webset/setting', '/admin/setting', '3', '');
INSERT INTO `sys_module_action` VALUES ('51', '9', '网站设置添加-表单', 'webset/setting_add', '', '9', '');
INSERT INTO `sys_module_action` VALUES ('52', '9', '网站设置信息添加-提交', 'webset/setting_add_submit', '', '10', '');
INSERT INTO `sys_module_action` VALUES ('57', '10', '广告管理-列表', 'ad/ad', '/admin/ad', '1', '');
INSERT INTO `sys_module_action` VALUES ('58', '10', '广告位信息添加-表单', 'ad/ad_adv_add', null, '2', '');
INSERT INTO `sys_module_action` VALUES ('59', '10', '广告位信息添加-提交', 'ad/ad_adv_add_submit', null, '3', '');
INSERT INTO `sys_module_action` VALUES ('60', '10', '广告位信息修改-表单', 'ad/ad_adv_update', null, '4', '');
INSERT INTO `sys_module_action` VALUES ('61', '10', '广告位信息修改-提交', 'ad/ad_adv_update_submit', null, '5', '');
INSERT INTO `sys_module_action` VALUES ('62', '10', '广告位信息删除-操作', 'ad/ad_adv_delete_submit', null, '6', '');
INSERT INTO `sys_module_action` VALUES ('63', '10', '广告信息添加-表单', 'ad/ad_ad_add', null, '7', '');
INSERT INTO `sys_module_action` VALUES ('64', '10', '广告信息添加-提交', 'ad/ad_ad_add_submit', null, '8', '');
INSERT INTO `sys_module_action` VALUES ('65', '10', '广告信息修改-表单', 'ad/ad_ad_update', null, '9', '');
INSERT INTO `sys_module_action` VALUES ('66', '10', '广告信息修改-提交', 'ad/ad_ad_update_submit', null, '10', '');
INSERT INTO `sys_module_action` VALUES ('67', '10', '广告信息删除-操作', 'ad/ad_ad_delete_submit', null, '11', '');
INSERT INTO `sys_module_action` VALUES ('68', '10', '广告信息文本编辑上传图片-提交', 'ad/ad_img', null, '12', '');
INSERT INTO `sys_module_action` VALUES ('69', '11', '个人资料展示-表单', 'me/detail', '/admin/me/detail', '1', '');
INSERT INTO `sys_module_action` VALUES ('70', '11', '个人资料修改-提交', 'me/detail_submit', null, '2', '');
INSERT INTO `sys_module_action` VALUES ('71', '11', '修改密码-表单', 'me/update_password', '/admin/me/update/password', '3', '');
INSERT INTO `sys_module_action` VALUES ('72', '11', '修改密码-提交', 'me/update_password_submit', null, '4', '');
INSERT INTO `sys_module_action` VALUES ('73', '12', '管理员操作日志-列表', 'log/admin_operation_log', '/admin/admin/operation/log', '1', '');
INSERT INTO `sys_module_action` VALUES ('74', '12', '管理员登录日志-列表', 'log/admin_login_log', '/admin/admin/login/log', '2', '');
INSERT INTO `sys_module_action` VALUES ('75', '13', '文章标签管理-列表', 'cms/tag', '/admin/cms/tag', '1', '');
INSERT INTO `sys_module_action` VALUES ('76', '13', '文章标签信息添加-表单', 'cms/tag_add', null, '2', '');
INSERT INTO `sys_module_action` VALUES ('77', '13', '文章标签信息添加-提交', 'cms/tag_add_submit', null, '3', '');
INSERT INTO `sys_module_action` VALUES ('78', '13', '文章标签信息修改-表单', 'cms/tag_update', null, '4', '');
INSERT INTO `sys_module_action` VALUES ('79', '13', '文章标签信息修改-提交', 'cms/tag_update_submit', null, '5', '');
INSERT INTO `sys_module_action` VALUES ('80', '13', '文章标签信息删除-操作', 'cms/tag_delete_submit', null, '6', '');
INSERT INTO `sys_module_action` VALUES ('81', '13', '文章分类管理-列表', 'cms/category', '/admin/cms/category', '7', '');
INSERT INTO `sys_module_action` VALUES ('82', '13', '文章分类信息添加-表单', 'cms/category_add', null, '8', '');
INSERT INTO `sys_module_action` VALUES ('83', '13', '文章分类信息添加-提交', 'cms/category_add_submit', null, '9', '');
INSERT INTO `sys_module_action` VALUES ('84', '13', '文章分类信息修改-表单', 'cms/category_update', null, '10', '');
INSERT INTO `sys_module_action` VALUES ('85', '13', '文章分类信息修改-提交', 'cms/category_update_submit', null, '11', '');
INSERT INTO `sys_module_action` VALUES ('86', '13', '文章分类信息删除-操作', 'cms/category_delete_submit', null, '12', '');
INSERT INTO `sys_module_action` VALUES ('88', '13', '文章管理-列表', 'cms/article', '/admin/cms/article', '13', '');
INSERT INTO `sys_module_action` VALUES ('89', '13', '文章信息添加-表单', 'cms/article_add', '', '14', '');
INSERT INTO `sys_module_action` VALUES ('90', '13', '文章信息添加-提交', 'cms/article_add_submit', '', '15', '');
INSERT INTO `sys_module_action` VALUES ('91', '13', '文章信息修改-表单', 'cms/article_update', '', '16', '');
INSERT INTO `sys_module_action` VALUES ('92', '13', '文章信息修改-提交', 'cms/article_update_submit', '', '17', '');
INSERT INTO `sys_module_action` VALUES ('93', '13', '文章信息删除-操作', 'cms/article_delete_submit', '', '18', '');
INSERT INTO `sys_module_action` VALUES ('94', '13', '文章信息内容获取-操作', 'cms/article_content', '', '19', '');
INSERT INTO `sys_module_action` VALUES ('95', '13', '文章信息上传图片-操作', 'cms/article_img', '', '20', '');
INSERT INTO `sys_module_action` VALUES ('96', '14', '会员管理--列表', 'user/user', '/admin/user', '1', '');
INSERT INTO `sys_module_action` VALUES ('97', '14', '会员信息添加-表单', 'user/user_add', '', '2', '');
INSERT INTO `sys_module_action` VALUES ('98', '14', '会员信息添加-提交', 'user/user_add_submit', '', '3', '');
INSERT INTO `sys_module_action` VALUES ('99', '14', '会员团队-展示页', 'user/user_team', '', '4', '');
INSERT INTO `sys_module_action` VALUES ('100', '14', '会员详情-展示页', 'user/user_detail', '', '5', '');
INSERT INTO `sys_module_action` VALUES ('101', '14', '会员信息编辑-表单', 'user/user_update', '', '6', '');
INSERT INTO `sys_module_action` VALUES ('102', '14', '会员信息编辑-提交', 'user/user_update_submit', '', '7', '');
INSERT INTO `sys_module_action` VALUES ('103', '14', '会员登录权限设置-操作', 'user/user_freeze', '', '8', '');
INSERT INTO `sys_module_action` VALUES ('104', '14', '删除会员-操作', 'user/user_delete', '', '9', '');
INSERT INTO `sys_module_action` VALUES ('105', '14', '会员充值-表单', 'user/user_recharge', '', '10', '');
INSERT INTO `sys_module_action` VALUES ('106', '14', '会员充值-提交', 'user/user_recharge_submit', '', '11', '');
INSERT INTO `sys_module_action` VALUES ('115', '12', '会员资金流水日志-列表', 'log/user_fund_log', '/admin/user/fund/log', '3', '');
INSERT INTO `sys_module_action` VALUES ('116', '12', '会员操作日志-列表', 'log/user_operation_log', '/admin/user/operation/log', '4', '');
INSERT INTO `sys_module_action` VALUES ('117', '9', '网站设置值修改--提交', 'webset/setting_value_submit', '', '21', '');

-- ----------------------------
-- Table structure for `sys_setting`
-- ----------------------------
DROP TABLE IF EXISTS `sys_setting`;
CREATE TABLE `sys_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设置id',
  `type` char(5) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型: cgory 分类  value 设置',
  `category_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `input_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '表单类型',
  `sign` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签',
  `value` varchar(200) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '值',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `remark` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注, select表单是以逗号分割的, 其他为输入提示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_setting
-- ----------------------------
