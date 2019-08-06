/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : aner_cms

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-08-06 17:53:35
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
  `nickname` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理员昵称',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员角色',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of adm_admin
-- ----------------------------
INSERT INTO `adm_admin` VALUES ('1', 'root', '64081bb564013c5a8d20bd7fb0fbdc0c', 'BJPrExO9', '暗语寒飞', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of adm_role
-- ----------------------------
INSERT INTO `adm_role` VALUES ('1', '超级管理员', '2', '', ',27,1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,18,19,20,21,22,23,24,25,26,');
INSERT INTO `adm_role` VALUES ('4', '开发者', '1', '', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
INSERT INTO `sys_catalog` VALUES ('16', '网站设置', 'la la-cog', '0', '0', '', '0', '20');
INSERT INTO `sys_catalog` VALUES ('17', '基本信息', 'la la-leanpub', '9', '43', 'webset/basic', '16', '21');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_module
-- ----------------------------
INSERT INTO `sys_module` VALUES ('2', '开发者中心', '100', '');
INSERT INTO `sys_module` VALUES ('4', '静态资源管理', '110', '');
INSERT INTO `sys_module` VALUES ('5', '首页', '1', '');
INSERT INTO `sys_module` VALUES ('8', '管理设置', '10', '');
INSERT INTO `sys_module` VALUES ('9', '网站设置', '20', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
INSERT INTO `sys_set` VALUES ('1', '1', '测试', '1', 'onoff', 'on', '0');
INSERT INTO `sys_set` VALUES ('4', '0', 'aaa', '123132', 'value', '34543', '1');

-- ----------------------------
-- Table structure for `sys_setup`
-- ----------------------------
DROP TABLE IF EXISTS `sys_setup`;
CREATE TABLE `sys_setup` (
  `debug` tinyint(1) NOT NULL DEFAULT '1' COMMENT '调试模式，1开启0关闭'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_setup
-- ----------------------------
INSERT INTO `sys_setup` VALUES ('1');

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
INSERT INTO `sys_set_category` VALUES ('1', '测试', '1');
