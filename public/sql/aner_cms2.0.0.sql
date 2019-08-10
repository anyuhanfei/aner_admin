/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : aner_cms

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-08-10 13:55:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `adm_admin`
-- ----------------------------
DROP TABLE IF EXISTS `adm_admin`;
CREATE TABLE `adm_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `account` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理员账号',
  `password` char(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理员密码',
  `password_salt` char(8) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理员密码相关-加盐',
  `via` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员头像',
  `nickname` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理员昵称',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员角色',
  `phone` varchar(11) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(40) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(15) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'QQ',
  `wx` varchar(40) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of adm_admin
-- ----------------------------
INSERT INTO `adm_admin` VALUES ('1', 'root', '42960a50f11334ea5bcba697e67bc7b0', 'BJPrExO9', '/uploads\\admin_via\\20190810\\e36a9f788d9a4a0739b62fd8a53c9b3f.jpg', '暗语寒飞', '4', '13939390001', '1223050252@qq.com', '1223050254', 'anyuhanfeifff');

-- ----------------------------
-- Table structure for `adm_admin_login`
-- ----------------------------
DROP TABLE IF EXISTS `adm_admin_login`;
CREATE TABLE `adm_admin_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员异常登录统计',
  `ip` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录ip',
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
  `ip` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ip',
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
  `remark` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `power` text COLLATE utf8mb4_general_ci COMMENT '管理权限',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of adm_role
-- ----------------------------
INSERT INTO `adm_role` VALUES ('1', '超级管理员', '2', '', ',27,1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,18,19,20,21,22,23,24,25,26,');
INSERT INTO `adm_role` VALUES ('4', '开发者', '1', '', ',27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,18,19,20,21,22,23,24,25,26,');

-- ----------------------------
-- Table structure for `log_admin_operation`
-- ----------------------------
DROP TABLE IF EXISTS `log_admin_operation`;
CREATE TABLE `log_admin_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员操作日志',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型，operation操作，login登录',
  `ip` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'ip',
  `content` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `insert_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of log_admin_operation
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_ad`
-- ----------------------------
DROP TABLE IF EXISTS `sys_ad`;
CREATE TABLE `sys_ad` (
  `ad_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `adv_id` int(3) NOT NULL DEFAULT '0' COMMENT '广告位id',
  `title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `image` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片',
  `value` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '值',
  `content` text COLLATE utf8mb4_general_ci COMMENT '内容',
  `sort` int(3) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_adv`
-- ----------------------------
DROP TABLE IF EXISTS `sys_adv`;
CREATE TABLE `sys_adv` (
  `adv_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '广告位id',
  `adv_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '广告位名称',
  `sign` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '广告位标签',
  `sort` tinyint(5) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_adv
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_basic`
-- ----------------------------
DROP TABLE IF EXISTS `sys_basic`;
CREATE TABLE `sys_basic` (
  `id` tinyint(11) NOT NULL COMMENT 'id',
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `keyword` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(200) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '简介',
  `copyright` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '版权',
  `aq` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备案号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_basic
-- ----------------------------
INSERT INTO `sys_basic` VALUES ('1', 'aner_cms后台管理系统', 'aner_cms，php，后台管理系统', 'aner_cms后台管理系统', '', '');

-- ----------------------------
-- Table structure for `sys_catalog`
-- ----------------------------
DROP TABLE IF EXISTS `sys_catalog`;
CREATE TABLE `sys_catalog` (
  `catalog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '后台目录id',
  `title` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `icon` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `module_id` int(11) DEFAULT NULL COMMENT '模块id',
  `action_id` int(11) DEFAULT NULL COMMENT '方法id',
  `path` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路径',
  `top_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级目录',
  `sort` tinyint(5) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_catalog
-- ----------------------------
INSERT INTO `sys_catalog` VALUES ('1', '开发者中心', 'la la-user-secret', '0', '0', '', '0', '100');
INSERT INTO `sys_catalog` VALUES ('2', '模块管理', 'la la-th-large', '2', '1', 'developer/module', '1', '101');
INSERT INTO `sys_catalog` VALUES ('3', '方法管理', 'la la-th', '2', '8', 'developer/action', '1', '102');
INSERT INTO `sys_catalog` VALUES ('4', '后台目录', 'la la-th-list', '2', '14', 'developer/catalog', '1', '103');
INSERT INTO `sys_catalog` VALUES ('5', '静态资源管理', 'la la-file-o', '0', '0', '', '0', '110');
INSERT INTO `sys_catalog` VALUES ('6', '列表资源', 'la la-file-powerpoint-o', '4', '21', 'resource/table', '5', '111');
INSERT INTO `sys_catalog` VALUES ('7', '表单资源', 'la la-file-word-o', '4', '22', 'resource/form', '5', '112');
INSERT INTO `sys_catalog` VALUES ('8', '图标资源', 'la la-file-pdf-o', '4', '23', 'resource/icon', '5', '113');
INSERT INTO `sys_catalog` VALUES ('9', '按钮资源', 'la la-file-audio-o', '4', '24', 'resource/button', '5', '114');
INSERT INTO `sys_catalog` VALUES ('10', '标题资源', 'la la-file-text', '4', '25', 'resource/text', '5', '115');
INSERT INTO `sys_catalog` VALUES ('11', '引导提示资源', 'la la-file-code-o', '4', '26', 'resource/notify', '5', '116');
INSERT INTO `sys_catalog` VALUES ('12', '首页', 'la la-dashboard', '5', '27', 'index/index', '0', '1');
INSERT INTO `sys_catalog` VALUES ('13', '管理设置', 'la la-slideshare', '0', '0', '', '0', '10');
INSERT INTO `sys_catalog` VALUES ('14', '角色管理', 'la la-sitemap', '8', '28', 'adm/role', '13', '11');
INSERT INTO `sys_catalog` VALUES ('15', '管理员列表', 'la la-reddit', '8', '36', 'adm/admin', '13', '12');
INSERT INTO `sys_catalog` VALUES ('16', '系统设置', 'la la-cog', '0', '0', '', '0', '20');
INSERT INTO `sys_catalog` VALUES ('17', '基本信息', 'la la-leanpub', '9', '43', 'webset/basic', '16', '21');
INSERT INTO `sys_catalog` VALUES ('18', '网站设置', 'la la-wrench', '9', '45', 'webset/set', '16', '22');
INSERT INTO `sys_catalog` VALUES ('19', '广告管理', ' la la-cc-amex', '10', '57', 'ad/ad', '16', '23');
INSERT INTO `sys_catalog` VALUES ('20', '个人中心', 'la la-institution', '0', '0', '', '0', '5');
INSERT INTO `sys_catalog` VALUES ('21', '个人资料', 'la la-hdd-o', '11', '69', 'me/detail', '20', '6');
INSERT INTO `sys_catalog` VALUES ('22', '修改密码', ' la la-edit', '11', '71', 'me/update_password', '20', '7');
INSERT INTO `sys_catalog` VALUES ('23', '日志管理', 'la la-calendar', '0', '0', '', '0', '90');
INSERT INTO `sys_catalog` VALUES ('24', '管理员操作日志', 'la la-cutlery', '12', '73', 'log/admin_operation_log', '23', '91');
INSERT INTO `sys_catalog` VALUES ('25', '管理员登录日志', 'la la-map-signs', '12', '74', 'log/admin_login_log', '23', '92');

-- ----------------------------
-- Table structure for `sys_module`
-- ----------------------------
DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模块id',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模块名称',
  `sort` tinyint(4) DEFAULT NULL COMMENT '排序',
  `remark` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- ----------------------------
-- Table structure for `sys_module_action`
-- ----------------------------
DROP TABLE IF EXISTS `sys_module_action`;
CREATE TABLE `sys_module_action` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '方法id',
  `module_id` int(11) DEFAULT NULL COMMENT '模块id',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名称',
  `path` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路径',
  `sort` tinyint(5) DEFAULT NULL COMMENT '排序',
  `remark` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_module_action
-- ----------------------------
INSERT INTO `sys_module_action` VALUES ('1', '2', '模块管理-列表', 'developer/module', '1', '');
INSERT INTO `sys_module_action` VALUES ('3', '2', '模块信息添加表单', 'developer/module_add', '2', null);
INSERT INTO `sys_module_action` VALUES ('4', '2', '模块信息添加提交', 'developer/module_add_submit', '3', '');
INSERT INTO `sys_module_action` VALUES ('5', '2', '模块信息修改表单', 'developer/module_update', '4', '');
INSERT INTO `sys_module_action` VALUES ('6', '2', '模块信息修改提交', 'developer/module_update_submit', '5', '');
INSERT INTO `sys_module_action` VALUES ('7', '2', '模块信息删除提交', 'developer/module_delete_submit', '6', '');
INSERT INTO `sys_module_action` VALUES ('8', '2', '方法管理-列表', 'developer/action', '7', '');
INSERT INTO `sys_module_action` VALUES ('9', '2', '方法信息添加表单', 'developer/action_add', '8', '');
INSERT INTO `sys_module_action` VALUES ('10', '2', '方法信息添加提交', 'developer/action_add_submit', '9', '');
INSERT INTO `sys_module_action` VALUES ('11', '2', '方法信息修改表单', 'developer/action_update', '10', '');
INSERT INTO `sys_module_action` VALUES ('12', '2', '方法信息修改提交', 'developer/action_update_submit', '11', '');
INSERT INTO `sys_module_action` VALUES ('13', '2', '方法信息删除提交', 'developer/action_delete_submit', '12', '');
INSERT INTO `sys_module_action` VALUES ('14', '2', '后台目录管理-列表', 'developer/catalog', '13', '');
INSERT INTO `sys_module_action` VALUES ('15', '2', '后台目录添加表单', 'developer/catalog_add', '14', '');
INSERT INTO `sys_module_action` VALUES ('16', '2', '后台目录添加提交', 'developer/catalog_add_submit', '15', '');
INSERT INTO `sys_module_action` VALUES ('18', '2', '后台目录修改表单', 'developer/catalog_update', '16', '');
INSERT INTO `sys_module_action` VALUES ('19', '2', '后台目录修改提交', 'developer/catalog_update_submit', '17', '');
INSERT INTO `sys_module_action` VALUES ('20', '2', '后台目录删除提交', 'developer/catalog_delete_submit', '18', '');
INSERT INTO `sys_module_action` VALUES ('21', '4', '列表资源', 'resource/table', '19', '');
INSERT INTO `sys_module_action` VALUES ('22', '4', '表单资源', 'resource/form', '20', '');
INSERT INTO `sys_module_action` VALUES ('23', '4', '图标资源', 'resource/icon', '21', '');
INSERT INTO `sys_module_action` VALUES ('24', '4', '按钮资源', 'resource/button', '22', '');
INSERT INTO `sys_module_action` VALUES ('25', '4', '标题资源', 'resource/text', '23', '');
INSERT INTO `sys_module_action` VALUES ('26', '4', '引导提示资源', 'resource/notify', '24', '');
INSERT INTO `sys_module_action` VALUES ('27', '5', '首页', 'index/index', '25', '');
INSERT INTO `sys_module_action` VALUES ('28', '8', '角色管理-列表', 'adm/role', '26', '');
INSERT INTO `sys_module_action` VALUES ('29', '8', '角色信息添加表单', 'adm/role_add', '27', '');
INSERT INTO `sys_module_action` VALUES ('30', '8', '角色信息添加提交', 'adm/role_add_submit', '28', '');
INSERT INTO `sys_module_action` VALUES ('31', '8', '角色信息修改表单', 'adm/role_update', '29', '');
INSERT INTO `sys_module_action` VALUES ('32', '8', '角色信息修改提交', 'adm/role_update_submit', '30', '');
INSERT INTO `sys_module_action` VALUES ('33', '8', '角色信息删除提交', 'adm/role_delete_submit', '31', '');
INSERT INTO `sys_module_action` VALUES ('34', '8', '角色权限设置表单', 'adm/role_power', '32', '');
INSERT INTO `sys_module_action` VALUES ('35', '8', '角色权限设置提交', 'adm/role_power_submit', '33', '');
INSERT INTO `sys_module_action` VALUES ('36', '8', '管理员列表', 'adm/admin', '34', '');
INSERT INTO `sys_module_action` VALUES ('37', '8', '管理员信息添加表单', 'adm/admin_add', '35', '');
INSERT INTO `sys_module_action` VALUES ('38', '8', '管理员信息添加提交', 'adm/admin_add_submit', '36', '');
INSERT INTO `sys_module_action` VALUES ('39', '8', '管理员信息修改表单', 'adm/admin_update', '37', '');
INSERT INTO `sys_module_action` VALUES ('40', '8', '管理员信息修改提交', 'adm/admin_update_submit', '38', '');
INSERT INTO `sys_module_action` VALUES ('41', '8', '管理员信息删除提交', 'adm/admin_delete_submit', '39', '');
INSERT INTO `sys_module_action` VALUES ('42', '8', '分配管理员角色', 'adm/admin_allot', '40', '');
INSERT INTO `sys_module_action` VALUES ('43', '9', '基本信息', 'webset/basic', '41', '');
INSERT INTO `sys_module_action` VALUES ('44', '9', '基本信息修改提交', 'webset/basic_submit', '42', '');
INSERT INTO `sys_module_action` VALUES ('45', '9', '网站设置-列表', 'webset/set', '43', '');
INSERT INTO `sys_module_action` VALUES ('46', '9', '网站设置分类信息添加表单', 'webset/set_category_add', '44', '');
INSERT INTO `sys_module_action` VALUES ('47', '9', '网站设置分类信息添加提交', 'webset/set_category_add_submit', '45', '');
INSERT INTO `sys_module_action` VALUES ('48', '9', '网站设置分类信息修改表单', 'webset/set_category_update', '46', '');
INSERT INTO `sys_module_action` VALUES ('49', '9', '网站设置分类信息修改提交', 'webset/set_category_update_submit', '47', '');
INSERT INTO `sys_module_action` VALUES ('50', '9', '网站设置分类信息删除提交', 'webset/set_category_delete_submit', '48', '');
INSERT INTO `sys_module_action` VALUES ('51', '9', '网站设置信息添加表单', 'webset/set_set_add', '49', '');
INSERT INTO `sys_module_action` VALUES ('52', '9', '网站设置信息添加提交', 'webset/set_set_add_submit', '50', '');
INSERT INTO `sys_module_action` VALUES ('53', '9', '网站设置信息修改表单', 'webset/set_set_update', '51', '');
INSERT INTO `sys_module_action` VALUES ('54', '9', '网站设置信息修改提交', 'webset/set_set_update_submit', '52', '');
INSERT INTO `sys_module_action` VALUES ('55', '9', '网站设置信息删除提交', 'webset/set_set_delete_submit', '53', '');
INSERT INTO `sys_module_action` VALUES ('56', '9', '网站设置信息值提交', 'webset/set_set_value_submit', '54', '');
INSERT INTO `sys_module_action` VALUES ('57', '10', '广告管理-列表', 'ad/ad', '55', '');
INSERT INTO `sys_module_action` VALUES ('58', '10', '广告位信息添加表单', 'ad/ad_adv_add', '56', '');
INSERT INTO `sys_module_action` VALUES ('59', '10', '广告位信息添加提交', 'ad/ad_adv_add_submit', '57', '');
INSERT INTO `sys_module_action` VALUES ('60', '10', '广告位信息修改表单', 'ad/ad_adv_update', '58', '');
INSERT INTO `sys_module_action` VALUES ('61', '10', '广告位信息修改提交', 'ad/ad_adv_update_submit', '59', '');
INSERT INTO `sys_module_action` VALUES ('62', '10', '广告位信息删除提交', 'ad/ad_adv_delete_submit', '60', '');
INSERT INTO `sys_module_action` VALUES ('63', '10', '广告信息添加表单', 'ad/ad_ad_add', '61', '');
INSERT INTO `sys_module_action` VALUES ('64', '10', '广告信息添加提交', 'ad/ad_ad_add_submit', '62', '');
INSERT INTO `sys_module_action` VALUES ('65', '10', '广告信息修改表单', 'ad/ad_ad_update', '63', '');
INSERT INTO `sys_module_action` VALUES ('66', '10', '广告信息修改提交', 'ad/ad_ad_update_submit', '64', '');
INSERT INTO `sys_module_action` VALUES ('67', '10', '广告信息删除提交', 'ad/ad_ad_delete_submit', '65', '');
INSERT INTO `sys_module_action` VALUES ('68', '10', '广告信息文本编辑上传图片提交', 'ad/ad_img', '66', '');
INSERT INTO `sys_module_action` VALUES ('69', '11', '个人资料', 'me/detail', '67', '');
INSERT INTO `sys_module_action` VALUES ('70', '11', '个人资料修改提交', 'me/detail_submit', '68', '');
INSERT INTO `sys_module_action` VALUES ('71', '11', '修改密码', 'me/update_password', '69', '');
INSERT INTO `sys_module_action` VALUES ('72', '11', '修改密码提交', 'me/update_password_submit', '70', '');
INSERT INTO `sys_module_action` VALUES ('73', '12', '管理员操作日志列表', 'log/admin_operation_log', '71', '');
INSERT INTO `sys_module_action` VALUES ('74', '12', '管理员登录日志', 'log/admin_login_log', '72', '');

-- ----------------------------
-- Table structure for `sys_set`
-- ----------------------------
DROP TABLE IF EXISTS `sys_set`;
CREATE TABLE `sys_set` (
  `set_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '网站设置id',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '网站设置分类id',
  `title` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `sign` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签',
  `type` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型',
  `value` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '值',
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
  `category_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设置分类名称',
  `sort` tinyint(5) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_set_category
-- ----------------------------
