/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : aner_admin

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-10-12 13:26:40
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('19', ',4,', '4', '阿斯顿', '123', '                                                                                                \n                                                                                                       ', '123', '/uploads\\article\\20190919\\23b9ec2b1ce1698655d598fb8492b5e5.png', '1', 'html', '<figure class=\"image\"><img src=\"http://localhost:6007/uploads\\article_content\\20190919\\c90f898813ed4cb1db2a257c03522644.png\"></figure><figure class=\"image\"><img src=\"http://localhost:6007/uploads\\article_content\\20190919\\0b0375e3b7e4f0f8189b207c8f2b2b22.png\"></figure><figure class=\"image\"><img src=\"http://localhost:6007/uploads\\article_content\\20190919\\15b6fb54525dfcdd050c4308c554f469.png\"></figure>');
INSERT INTO `cms_article` VALUES ('20', ',4,', '4', 'ddd', '暗语寒飞', '\n                            ', '1', '/uploads\\article\\20190919\\2a9f9964cc34b77d978f8ac1d58ff085.png', '2', 'html', '<figure class=\"image\"><img src=\"http://localhost:6007/uploads\\article_content\\20190919\\cb44fab5fd6e7a10829d11c0f20f1295.png\"></figure>');
INSERT INTO `cms_article` VALUES ('21', ',4,', '4', 'dddd', '暗语寒飞', '\n                            ', '1', '/uploads\\article\\20190919\\47d725c15b0af76eea5e82a81494524e.png', '2', 'html', '<figure class=\"image\"><img src=\"http://localhost:6007/uploads\\article_content\\20190919\\cb44fab5fd6e7a10829d11c0f20f1295.png\"></figure>');

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
INSERT INTO `cms_article_data` VALUES ('19', '0', '0', '0', '0', '0', '0');
INSERT INTO `cms_article_data` VALUES ('21', '0', '0', '0', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of cms_category
-- ----------------------------
INSERT INTO `cms_category` VALUES ('4', 'b', '/uploads\\category\\20190919\\b83ea62a56e8d384be04254f960b1ff5.png', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of cms_tag
-- ----------------------------
INSERT INTO `cms_tag` VALUES ('4', 'a', '/uploads\\tag\\20190919\\94e0c6e9178fe87a2c72f3193466c5ac.png', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of idx_user
-- ----------------------------
INSERT INTO `idx_user` VALUES ('10', '', '13939390002', '', '测试1', 'c1a5779898aeb9c9e8a516f598198d19', 'ef1bb2d1e6048816ec2e44e2be95a56d', '59c8JG', '0', '2019-09-18', '1');
INSERT INTO `idx_user` VALUES ('11', '', '13939390003', '', '13939390003', 'd5cee192b23706ac2506b968d30208c3', '123456', 'JF46YO', '10', '2019-09-18', '1');

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
INSERT INTO `idx_user_count` VALUES ('10', '1', '1');
INSERT INTO `idx_user_count` VALUES ('11', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of idx_user_data
-- ----------------------------
INSERT INTO `idx_user_data` VALUES ('10', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `idx_user_data` VALUES ('11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

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
INSERT INTO `idx_user_fund` VALUES ('10', '0.00');
INSERT INTO `idx_user_fund` VALUES ('11', '0.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of log_admin_operation
-- ----------------------------
INSERT INTO `log_admin_operation` VALUES ('288', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-09-18 17:15:36');
INSERT INTO `log_admin_operation` VALUES ('289', '1', 'operation', '127.0.0.1', '会员信息添加：13939390001', '2019-09-18 17:18:06');
INSERT INTO `log_admin_operation` VALUES ('290', '1', 'operation', '127.0.0.1', '会员信息--密码修改：13939390001', '2019-09-18 17:22:36');
INSERT INTO `log_admin_operation` VALUES ('291', '1', 'operation', '127.0.0.1', '会员信息--二级密码修改：13939390001', '2019-09-18 17:22:44');
INSERT INTO `log_admin_operation` VALUES ('292', '1', 'operation', '127.0.0.1', '会员信息--信息编辑：13939390002', '2019-09-18 17:22:55');
INSERT INTO `log_admin_operation` VALUES ('293', '1', 'operation', '127.0.0.1', '会员登录权限-冻结：13939390002', '2019-09-18 17:27:06');
INSERT INTO `log_admin_operation` VALUES ('294', '1', 'operation', '127.0.0.1', '会员登录权限-解冻：13939390002', '2019-09-18 17:27:07');
INSERT INTO `log_admin_operation` VALUES ('295', '1', 'operation', '127.0.0.1', '会员登录权限-冻结：13939390002', '2019-09-18 17:27:08');
INSERT INTO `log_admin_operation` VALUES ('296', '1', 'operation', '127.0.0.1', '会员登录权限-解冻：13939390002', '2019-09-18 17:27:08');
INSERT INTO `log_admin_operation` VALUES ('297', '1', 'operation', '127.0.0.1', '会员登录权限-冻结：13939390002', '2019-09-18 17:27:08');
INSERT INTO `log_admin_operation` VALUES ('298', '1', 'operation', '127.0.0.1', '会员登录权限-解冻：13939390002', '2019-09-18 17:27:09');
INSERT INTO `log_admin_operation` VALUES ('299', '1', 'operation', '127.0.0.1', '会员登录权限-冻结：13939390002', '2019-09-18 17:27:09');
INSERT INTO `log_admin_operation` VALUES ('300', '1', 'operation', '127.0.0.1', '会员登录权限-解冻：13939390002', '2019-09-18 17:27:10');
INSERT INTO `log_admin_operation` VALUES ('301', '1', 'operation', '127.0.0.1', '会员信息添加：13939390003', '2019-09-18 17:29:20');
INSERT INTO `log_admin_operation` VALUES ('302', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-09-19 09:01:13');
INSERT INTO `log_admin_operation` VALUES ('303', '1', 'operation', '127.0.0.1', '文章标签信息添加：a', '2019-09-19 09:01:59');
INSERT INTO `log_admin_operation` VALUES ('304', '1', 'operation', '127.0.0.1', '文章分类信息添加：b', '2019-09-19 09:02:06');
INSERT INTO `log_admin_operation` VALUES ('305', '1', 'operation', '127.0.0.1', '文章信息添加：1', '2019-09-19 09:02:27');
INSERT INTO `log_admin_operation` VALUES ('306', '1', 'operation', '127.0.0.1', '文章信息修改：1->1', '2019-09-19 09:02:45');
INSERT INTO `log_admin_operation` VALUES ('307', '1', 'operation', '127.0.0.1', '文章信息添加：a', '2019-09-19 09:05:18');
INSERT INTO `log_admin_operation` VALUES ('308', '1', 'operation', '127.0.0.1', '文章信息添加：44', '2019-09-19 09:31:20');
INSERT INTO `log_admin_operation` VALUES ('309', '1', 'operation', '127.0.0.1', '文章信息修改：44->44', '2019-09-19 09:32:47');
INSERT INTO `log_admin_operation` VALUES ('310', '1', 'operation', '127.0.0.1', '文章信息删除：1', '2019-09-19 09:32:58');
INSERT INTO `log_admin_operation` VALUES ('311', '1', 'operation', '127.0.0.1', '文章信息删除：a', '2019-09-19 09:32:59');
INSERT INTO `log_admin_operation` VALUES ('312', '1', 'operation', '127.0.0.1', '文章信息删除：44', '2019-09-19 09:33:01');
INSERT INTO `log_admin_operation` VALUES ('313', '1', 'operation', '127.0.0.1', '文章信息添加：阿斯顿', '2019-09-19 09:33:44');
INSERT INTO `log_admin_operation` VALUES ('314', '1', 'operation', '127.0.0.1', '文章信息修改：阿斯顿->阿斯顿', '2019-09-19 09:34:03');
INSERT INTO `log_admin_operation` VALUES ('315', '1', 'operation', '127.0.0.1', '文章信息修改：阿斯顿->阿斯顿', '2019-09-19 09:34:41');
INSERT INTO `log_admin_operation` VALUES ('316', '1', 'operation', '127.0.0.1', '文章信息添加：dddd', '2019-09-19 09:47:21');
INSERT INTO `log_admin_operation` VALUES ('317', '1', 'operation', '127.0.0.1', '文章信息修改：阿斯顿->阿斯顿', '2019-09-19 10:26:03');
INSERT INTO `log_admin_operation` VALUES ('318', '1', 'operation', '127.0.0.1', '广告位信息添加：c', '2019-09-19 10:27:19');
INSERT INTO `log_admin_operation` VALUES ('319', '1', 'operation', '127.0.0.1', '广告信息添加：ddd', '2019-09-19 10:27:44');
INSERT INTO `log_admin_operation` VALUES ('320', '1', 'operation', '127.0.0.1', '广告信息修改：ddd->ddd', '2019-09-19 10:28:08');
INSERT INTO `log_admin_operation` VALUES ('321', '1', 'operation', '127.0.0.1', '广告信息修改：ddd->ddd', '2019-09-19 10:30:02');
INSERT INTO `log_admin_operation` VALUES ('322', '1', 'operation', '127.0.0.1', '广告信息修改：ddd->ddd', '2019-09-19 10:30:19');
INSERT INTO `log_admin_operation` VALUES ('323', '1', 'operation', '127.0.0.1', '广告信息修改：ddd->ddd', '2019-09-19 10:30:24');
INSERT INTO `log_admin_operation` VALUES ('324', '1', 'operation', '127.0.0.1', '广告信息添加：asd', '2019-09-19 11:03:56');
INSERT INTO `log_admin_operation` VALUES ('325', '1', 'operation', '127.0.0.1', '广告信息添加：vsfdas', '2019-09-19 11:04:13');
INSERT INTO `log_admin_operation` VALUES ('326', '0', 'login', '127.0.0.1', '登录成功，账号：root', '2019-09-20 14:33:41');

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
  `sort` int(3) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_ad
-- ----------------------------
INSERT INTO `sys_ad` VALUES ('12', '7', '', 'ddd', '', '43242', '', '1');
INSERT INTO `sys_ad` VALUES ('13', '7', 'c', 'asd', '', '111', '', '2');
INSERT INTO `sys_ad` VALUES ('14', '7', '33333', 'vsfdas', '', 'asd', '', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_adv
-- ----------------------------
INSERT INTO `sys_adv` VALUES ('7', 'c', 'c', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_set_category
-- ----------------------------
