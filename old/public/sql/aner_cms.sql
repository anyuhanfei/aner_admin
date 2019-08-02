/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : aner_cms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-04-22 21:33:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cms_article`
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id',
  `tag_id` varchar(200) NOT NULL DEFAULT '' COMMENT '标签id()逗号隔开',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '作者',
  `keyword` varchar(200) NOT NULL DEFAULT '' COMMENT '关键字',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `intro` varchar(200) NOT NULL DEFAULT '' COMMENT '简介',
  `content_type` varchar(10) NOT NULL DEFAULT '''markdown''' COMMENT '文章类型',
  `content` text NOT NULL COMMENT '内容',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态1正常2关闭',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐',
  `is_stick` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶',
  `insert_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('1', '1', '2,1,', 'markdown test', 'anyu', 'm', '', 'm', 'markdown', '#### js解析markdown语法修改\n传送门：https://github.com/markedjs/marked/\n\n`Marked`中有下面的一个例子：\n```\n<!doctype html>\n<html>\n<head>\n  <meta charset=\"utf-8\"/>\n  <title>Marked in the browser</title>\n</head>\n<body>\n  <div id=\"content\"></div>\n  <script src=\"https://cdn.jsdelivr.net/npm/marked/marked.min.js\"></script>\n  <script>\n    document.getElementById(\'content\').innerHTML =\n      marked(\'# Marked in the browser\\n\\nRendered by **marked**.\');\n  </script>\n</body>\n</html>\n```\n为了防止`cdn`链接失效，还是需要下载一下（下载一个`marked.min.js`即可）；\n\n#### 美观的markdown样式\n如果仅仅使用以上的例子，那么得到的不是像其他`markdown`笔记那样美观，只有大大小小的字和空格空行拼出来的纯html页面。\n\n所以需要导入css样式，传送门：https://github.com/iamcco/markdown.css\n\n这个`css`样式的好处在于，它的所有css样式都是在一个`class`之内的，这样做的好处在于如果整个页面`markdown`笔记只占了一部分，还要有其他的正常内容显示，那么这么做就不会影响正常的页面样式。\n\n使用的话，只需要在需要展示`markdown`的块标签上添加上值为`markdown-body`的`class`。\n\n#### 有道云的备份\n- marked: http://note.youdao.com/noteshare?id=024b2b8fd918e6036e088ea91e34cf29&sub=C8CFE70E99F643799931A9B6021D84D8\n- markdown: http://note.youdao.com/noteshare?id=699cd0af3aac0cc68568cd59cf93a8f4&sub=C39C2F4B12E941C3B209919244E3CA1E', '1', '1', '0', '2019-04-22 20:16:57');
INSERT INTO `cms_article` VALUES ('2', '1', '2,1,', 'html test', 'anyu', '啊', '', '啊', 'html', '<p>习近平主持召开中央财经委员会第四次会议强调</p><p>聚焦全面建成小康社会的短板弱项实施精准攻坚</p><p>勇于破题善于解题落实好中央经济工作会议精神</p><p>李克强汪洋王沪宁韩正参加&nbsp; &nbsp;</p><p>新华社北京4月22日电 中共中央总书记、国家主席、中央军委主席、中央财经委员会主任习近平4月22日上午主持召开中央财经委员会第四次会议，研究全面建成小康社会补短板问题和中央经济工作会议精神落实情况。习近平在会上发表重要讲话强调，全面建成小康社会取得决定性进展，要正确认识面临的短板问题，聚焦短板弱项，实施精准攻坚。要勇于破题、善于解题，抓好中央经济工作会议精神的贯彻落实。</p><p><br></p>', '1', '1', '0', '2019-04-22 20:28:28');
INSERT INTO `cms_article` VALUES ('4', '1', '1,', 'test count', 'anyu', 'a', '/uploads\\article\\20190422\\c51b560309b42bf2a04a3ee3497d118f.png', 'a', 'html', '<p>asfdasd<br></p><p><br></p>', '1', '1', '0', '2019-04-22 20:35:24');

-- ----------------------------
-- Table structure for `cms_article_count`
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_count`;
CREATE TABLE `cms_article_count` (
  `article_id` int(11) NOT NULL COMMENT '文章统计表',
  `click_rate` int(11) NOT NULL DEFAULT '0' COMMENT '点击率',
  `likenum_int` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cms_article_count
-- ----------------------------
INSERT INTO `cms_article_count` VALUES ('1', '0', '0');
INSERT INTO `cms_article_count` VALUES ('2', '0', '0');
INSERT INTO `cms_article_count` VALUES ('4', '0', '0');

-- ----------------------------
-- Table structure for `cms_category`
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章分类id',
  `category_name` varchar(10) DEFAULT NULL COMMENT '文章分类名称',
  `number_of_articles` int(11) NOT NULL COMMENT '拥有文章数',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_category
-- ----------------------------
INSERT INTO `cms_category` VALUES ('1', 'ces ', '0');

-- ----------------------------
-- Table structure for `cms_tag`
-- ----------------------------
DROP TABLE IF EXISTS `cms_tag`;
CREATE TABLE `cms_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `tag_name` varchar(10) DEFAULT NULL COMMENT '标签名称',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_tag
-- ----------------------------
INSERT INTO `cms_tag` VALUES ('1', '测试');
INSERT INTO `cms_tag` VALUES ('2', '测试2');

-- ----------------------------
-- Table structure for `log_admin_operation`
-- ----------------------------
DROP TABLE IF EXISTS `log_admin_operation`;
CREATE TABLE `log_admin_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员操作日志',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1' COMMENT 'ip',
  `content` varchar(50) NOT NULL DEFAULT '' COMMENT '操作内容',
  `insert_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_admin_operation
-- ----------------------------
INSERT INTO `log_admin_operation` VALUES ('1', '1', '127.0.0.1', '添加了一个模块,模块名称为：测试2', '2019-03-17 21:17:59');
INSERT INTO `log_admin_operation` VALUES ('2', '1', '127.0.0.1', '添加了一个模块,模块名称为：测试2', '2019-03-17 21:18:59');
INSERT INTO `log_admin_operation` VALUES ('3', '1', '127.0.0.1', '添加了一个模块,模块名称为：测试修改', '2019-03-17 21:19:13');
INSERT INTO `log_admin_operation` VALUES ('4', '1', '127.0.0.1', '添加了一个模块,模块名称为：测试修改2', '2019-03-17 21:19:23');
INSERT INTO `log_admin_operation` VALUES ('5', '1', '127.0.0.1', '删除了模块1,模块名称为：测试修改2', '2019-03-18 19:57:00');
INSERT INTO `log_admin_operation` VALUES ('6', '1', '127.0.0.1', '修改了模块3,模块名称修改为：测试24234', '2019-03-18 20:38:41');
INSERT INTO `log_admin_operation` VALUES ('7', '1', '127.0.0.1', '添加了一个方法,方法名称为：asd', '2019-03-18 20:40:14');
INSERT INTO `log_admin_operation` VALUES ('8', '1', '127.0.0.1', '修改了方法1,方法名称修改为：asd', '2019-03-18 20:53:13');
INSERT INTO `log_admin_operation` VALUES ('9', '1', '127.0.0.1', '添加了一个方法,方法名称为：adas', '2019-03-18 20:53:25');
INSERT INTO `log_admin_operation` VALUES ('10', '1', '127.0.0.1', '添加了一个方法,方法名称为：asasd', '2019-03-18 20:53:31');
INSERT INTO `log_admin_operation` VALUES ('11', '1', '127.0.0.1', '删除了方法3,方法名称为：asasd', '2019-03-18 20:53:39');
INSERT INTO `log_admin_operation` VALUES ('12', '1', '127.0.0.1', '修改了网站seo设置', '2019-03-18 21:02:17');
INSERT INTO `log_admin_operation` VALUES ('13', '1', '127.0.0.1', '修改了账号为:root管理员的昵称，新昵称为:root1', '2019-03-18 21:13:52');
INSERT INTO `log_admin_operation` VALUES ('14', '1', '127.0.0.1', '修改了账号为:root管理员的密码', '2019-03-18 21:14:49');
INSERT INTO `log_admin_operation` VALUES ('15', '1', '127.0.0.1', '修改了账号为:root管理员的密码', '2019-03-18 21:15:07');
INSERT INTO `log_admin_operation` VALUES ('16', '1', '127.0.0.1', '添加了账号为:admin1,昵称为:admin1的新管理员', '2019-03-18 21:24:44');
INSERT INTO `log_admin_operation` VALUES ('17', '1', '127.0.0.1', '添加了账号为:admin2,昵称为:admin2的新管理员', '2019-03-18 21:25:58');
INSERT INTO `log_admin_operation` VALUES ('18', '1', '127.0.0.1', '添加了一个后台菜单,名称为：首页', '2019-03-24 18:41:44');
INSERT INTO `log_admin_operation` VALUES ('19', '1', '127.0.0.1', '删除了模块1,模块名称为：首页', '2019-03-24 18:45:31');
INSERT INTO `log_admin_operation` VALUES ('20', '1', '127.0.0.1', '删除了模块2,模块名称为：首页', '2019-03-24 18:45:52');
INSERT INTO `log_admin_operation` VALUES ('21', '1', '127.0.0.1', '添加了一个后台菜单,名称为：ces', '2019-03-24 18:47:44');
INSERT INTO `log_admin_operation` VALUES ('22', '1', '127.0.0.1', '删除了模块4,模块名称为：ces', '2019-03-24 18:48:30');
INSERT INTO `log_admin_operation` VALUES ('23', '1', '127.0.0.1', '修改了后台菜单3,后台菜单名称修改为：首页', '2019-03-25 20:45:05');
INSERT INTO `log_admin_operation` VALUES ('24', '1', '127.0.0.1', '修改了后台菜单排序3,后台菜单名称为：首页排序为:3', '2019-03-25 21:00:14');
INSERT INTO `log_admin_operation` VALUES ('25', '1', '127.0.0.1', '修改了后台菜单排序3,后台菜单名称为：首页排序为:1', '2019-03-25 21:00:41');
INSERT INTO `log_admin_operation` VALUES ('26', '1', '127.0.0.1', '修改了后台菜单排序3,后台菜单名称为：首页排序为:2', '2019-03-25 21:03:40');
INSERT INTO `log_admin_operation` VALUES ('27', '1', '127.0.0.1', '修改了后台菜单排序3,后台菜单名称为：首页排序为:3', '2019-03-25 21:05:15');
INSERT INTO `log_admin_operation` VALUES ('28', '1', '127.0.0.1', '修改了后台菜单排序3,后台菜单名称为：首页排序为:1', '2019-03-25 21:05:18');
INSERT INTO `log_admin_operation` VALUES ('29', '1', '127.0.0.1', '修改了后台菜单排序3,后台菜单名称为：首页排序为:3', '2019-03-25 21:08:25');
INSERT INTO `log_admin_operation` VALUES ('30', '1', '127.0.0.1', '修改了后台菜单排序3,后台菜单名称为：首页排序为:4', '2019-03-25 21:08:55');
INSERT INTO `log_admin_operation` VALUES ('31', '1', '127.0.0.1', '修改了后台菜单排序3,后台菜单名称为：首页排序为:1', '2019-03-25 21:09:29');
INSERT INTO `log_admin_operation` VALUES ('32', '1', '127.0.0.1', '添加了一个后台菜单,名称为：管理员管理', '2019-03-25 21:11:21');
INSERT INTO `log_admin_operation` VALUES ('33', '1', '127.0.0.1', '添加了一个后台菜单,名称为：管理员列表', '2019-03-25 21:12:43');
INSERT INTO `log_admin_operation` VALUES ('34', '1', '127.0.0.1', '修改了后台菜单5,后台菜单名称修改为：管理员管理', '2019-03-25 21:13:59');
INSERT INTO `log_admin_operation` VALUES ('35', '1', '127.0.0.1', '添加了一个后台菜单,名称为：系统设置', '2019-03-25 21:14:59');
INSERT INTO `log_admin_operation` VALUES ('36', '1', '127.0.0.1', '添加了一个后台菜单,名称为：seo设置', '2019-03-25 21:15:58');
INSERT INTO `log_admin_operation` VALUES ('37', '1', '127.0.0.1', '添加了一个后台菜单,名称为：日志管理', '2019-03-25 21:26:05');
INSERT INTO `log_admin_operation` VALUES ('38', '1', '127.0.0.1', '添加了一个后台菜单,名称为：管理员操作日志', '2019-03-25 21:27:09');
INSERT INTO `log_admin_operation` VALUES ('39', '1', '127.0.0.1', '添加了一个后台菜单,名称为：文章管理', '2019-03-25 21:28:32');
INSERT INTO `log_admin_operation` VALUES ('40', '1', '127.0.0.1', '添加了一个后台菜单,名称为：文章标签', '2019-03-25 21:29:51');
INSERT INTO `log_admin_operation` VALUES ('41', '1', '127.0.0.1', '添加了一个后台菜单,名称为：菜单管理', '2019-03-25 21:45:38');
INSERT INTO `log_admin_operation` VALUES ('42', '1', '127.0.0.1', '添加了一个后台菜单,名称为：后台菜单', '2019-03-25 21:46:48');
INSERT INTO `log_admin_operation` VALUES ('43', '1', '127.0.0.1', '添加了一个后台菜单,名称为：开发者中心', '2019-03-25 21:50:22');
INSERT INTO `log_admin_operation` VALUES ('44', '1', '127.0.0.1', '添加了一个后台菜单,名称为：模块管理', '2019-03-25 21:51:47');
INSERT INTO `log_admin_operation` VALUES ('45', '1', '127.0.0.1', '添加了一个后台菜单,名称为：方法管理', '2019-03-25 21:52:44');
INSERT INTO `log_admin_operation` VALUES ('46', '1', '127.0.0.1', '添加了一个后台菜单,名称为：角色管理', '2019-03-27 20:09:02');
INSERT INTO `log_admin_operation` VALUES ('47', '1', '127.0.0.1', '添加了新角色:超级管理员', '2019-03-27 20:09:22');
INSERT INTO `log_admin_operation` VALUES ('48', '1', '127.0.0.1', '修改了角色1,角色名称修改为：超级管理员', '2019-03-27 20:19:50');
INSERT INTO `log_admin_operation` VALUES ('49', '1', '127.0.0.1', '修改了角色1的排序,角色名称为：超级管理员排序为:2', '2019-03-27 20:22:05');
INSERT INTO `log_admin_operation` VALUES ('50', '1', '127.0.0.1', '修改了角色1的排序,角色名称为：超级管理员排序为:1', '2019-03-27 20:22:08');
INSERT INTO `log_admin_operation` VALUES ('51', '1', '127.0.0.1', '删除了模块2,模块名称为：测试2', '2019-03-27 20:28:38');
INSERT INTO `log_admin_operation` VALUES ('52', '1', '127.0.0.1', '删除了模块3,模块名称为：测试24234', '2019-03-27 20:28:39');
INSERT INTO `log_admin_operation` VALUES ('53', '1', '127.0.0.1', '添加了一个模块,模块名称为：管理员管理', '2019-03-27 20:29:16');
INSERT INTO `log_admin_operation` VALUES ('54', '1', '127.0.0.1', '添加了一个模块,模块名称为：系统设置', '2019-03-27 20:29:25');
INSERT INTO `log_admin_operation` VALUES ('55', '1', '127.0.0.1', '添加了一个模块,模块名称为：日志管理', '2019-03-27 20:29:35');
INSERT INTO `log_admin_operation` VALUES ('56', '1', '127.0.0.1', '添加了一个模块,模块名称为：文章管理', '2019-03-27 20:29:43');
INSERT INTO `log_admin_operation` VALUES ('57', '1', '127.0.0.1', '添加了一个模块,模块名称为：菜单管理', '2019-03-27 20:29:50');
INSERT INTO `log_admin_operation` VALUES ('58', '1', '127.0.0.1', '添加了一个模块,模块名称为：开发者管理', '2019-03-27 20:29:57');
INSERT INTO `log_admin_operation` VALUES ('59', '1', '127.0.0.1', '添加了一个方法,方法名称为：管理员列表', '2019-03-27 20:30:27');
INSERT INTO `log_admin_operation` VALUES ('60', '1', '127.0.0.1', '添加了一个方法,方法名称为：管理员添加', '2019-03-27 20:30:53');
INSERT INTO `log_admin_operation` VALUES ('61', '1', '127.0.0.1', '添加了一个方法,方法名称为：管理员添加提交', '2019-03-27 20:31:16');
INSERT INTO `log_admin_operation` VALUES ('62', '1', '127.0.0.1', '添加了一个方法,方法名称为：管理员修改昵称', '2019-03-27 20:31:47');
INSERT INTO `log_admin_operation` VALUES ('63', '1', '127.0.0.1', '添加了一个方法,方法名称为：修改管理员密码', '2019-03-27 20:32:10');
INSERT INTO `log_admin_operation` VALUES ('64', '1', '127.0.0.1', '添加了一个方法,方法名称为：网站seo设置', '2019-03-27 20:34:04');
INSERT INTO `log_admin_operation` VALUES ('65', '1', '127.0.0.1', '添加了一个方法,方法名称为：网站seo设置修改', '2019-03-27 20:34:18');
INSERT INTO `log_admin_operation` VALUES ('66', '1', '127.0.0.1', '修改了角色1的权限', '2019-03-27 20:51:22');
INSERT INTO `log_admin_operation` VALUES ('67', '1', '127.0.0.1', '删除了管理员3,管理员账号为：admin2', '2019-03-27 20:56:29');
INSERT INTO `log_admin_operation` VALUES ('68', '1', '127.0.0.1', '删除了管理员2,管理员账号为：admin1', '2019-03-27 20:56:47');
INSERT INTO `log_admin_operation` VALUES ('69', '1', '127.0.0.1', '添加了新角色:1', '2019-03-27 20:56:53');
INSERT INTO `log_admin_operation` VALUES ('70', '1', '127.0.0.1', '删除了角色2,角色名称为：1', '2019-03-27 20:56:57');
INSERT INTO `log_admin_operation` VALUES ('71', '1', '127.0.0.1', '修改了角色1的权限', '2019-03-27 20:57:17');
INSERT INTO `log_admin_operation` VALUES ('72', '1', '127.0.0.1', '修改了账号为:root的管理员的权限', '2019-03-27 21:21:33');
INSERT INTO `log_admin_operation` VALUES ('73', '1', '127.0.0.1', '修改了账号为:root的管理员的权限', '2019-03-27 21:21:38');
INSERT INTO `log_admin_operation` VALUES ('74', '1', '127.0.0.1', '修改了账号为:root的管理员的权限', '2019-03-27 21:22:35');
INSERT INTO `log_admin_operation` VALUES ('75', '1', '127.0.0.1', '修改了账号为:root的管理员的权限', '2019-03-27 21:22:38');
INSERT INTO `log_admin_operation` VALUES ('76', '1', '127.0.0.1', '添加了一个后台菜单,名称为：网站设置', '2019-03-28 20:08:57');
INSERT INTO `log_admin_operation` VALUES ('77', '1', '127.0.0.1', '添加了一个后台菜单,名称为：广告管理', '2019-03-28 20:09:48');
INSERT INTO `log_admin_operation` VALUES ('78', '1', '127.0.0.1', '添加了网站设置:测试', '2019-03-28 20:15:28');
INSERT INTO `log_admin_operation` VALUES ('79', '1', '127.0.0.1', '修改了网站设置1的排序,网站设置标题为：测试,排序为:2', '2019-03-28 20:16:21');
INSERT INTO `log_admin_operation` VALUES ('80', '1', '127.0.0.1', '修改了网站设置:测试', '2019-03-28 20:18:35');
INSERT INTO `log_admin_operation` VALUES ('81', '1', '127.0.0.1', '添加了网站设置:111', '2019-03-28 20:18:44');
INSERT INTO `log_admin_operation` VALUES ('82', '1', '127.0.0.1', '删除了网站设置2,网站设置名称为：111', '2019-03-28 20:18:49');
INSERT INTO `log_admin_operation` VALUES ('83', '1', '127.0.0.1', '添加了广告:ces', '2019-03-28 20:32:55');
INSERT INTO `log_admin_operation` VALUES ('84', '1', '127.0.0.1', '添加了广告:csad', '2019-03-28 20:34:03');
INSERT INTO `log_admin_operation` VALUES ('85', '1', '127.0.0.1', '添加了广告:1', '2019-03-28 20:37:56');
INSERT INTO `log_admin_operation` VALUES ('86', '1', '127.0.0.1', '添加了广告:2', '2019-03-28 20:38:32');
INSERT INTO `log_admin_operation` VALUES ('87', '1', '127.0.0.1', '添加了广告:3', '2019-03-28 20:40:31');
INSERT INTO `log_admin_operation` VALUES ('88', '1', '127.0.0.1', '添加了广告:content', '2019-03-28 20:48:50');
INSERT INTO `log_admin_operation` VALUES ('89', '1', '127.0.0.1', '添加了广告:4', '2019-03-28 21:02:05');
INSERT INTO `log_admin_operation` VALUES ('90', '1', '127.0.0.1', '修改了广告:5', '2019-03-28 21:02:56');
INSERT INTO `log_admin_operation` VALUES ('91', '1', '127.0.0.1', '修改了广告:4', '2019-03-28 21:03:56');
INSERT INTO `log_admin_operation` VALUES ('92', '1', '127.0.0.1', '修改了广告:4', '2019-03-28 21:04:08');
INSERT INTO `log_admin_operation` VALUES ('93', '1', '127.0.0.1', '修改了广告:4', '2019-03-28 21:04:38');
INSERT INTO `log_admin_operation` VALUES ('94', '1', '127.0.0.1', '修改了广告:4', '2019-03-28 21:06:03');
INSERT INTO `log_admin_operation` VALUES ('95', '1', '127.0.0.1', '修改了广告:4', '2019-03-28 21:07:16');
INSERT INTO `log_admin_operation` VALUES ('96', '1', '127.0.0.1', '修改了广告:4', '2019-03-28 21:08:09');
INSERT INTO `log_admin_operation` VALUES ('97', '1', '127.0.0.1', '修改了广告:4', '2019-03-28 21:12:33');
INSERT INTO `log_admin_operation` VALUES ('98', '1', '127.0.0.1', '修改了广告:4', '2019-03-28 21:12:55');
INSERT INTO `log_admin_operation` VALUES ('99', '1', '127.0.0.1', '修改了广告:4', '2019-03-28 21:16:23');
INSERT INTO `log_admin_operation` VALUES ('100', '1', '127.0.0.1', '修改了广告:4', '2019-03-28 21:16:40');
INSERT INTO `log_admin_operation` VALUES ('101', '1', '127.0.0.1', '修改了广告:4', '2019-03-28 21:17:06');
INSERT INTO `log_admin_operation` VALUES ('102', '1', '127.0.0.1', '修改了广告:4', '2019-03-28 21:18:37');
INSERT INTO `log_admin_operation` VALUES ('103', '1', '127.0.0.1', '修改了广告:4', '2019-03-28 21:18:47');
INSERT INTO `log_admin_operation` VALUES ('104', '1', '127.0.0.1', '修改了广告:4', '2019-03-28 21:19:28');
INSERT INTO `log_admin_operation` VALUES ('105', '1', '127.0.0.1', '修改了广告:4', '2019-03-28 21:19:36');
INSERT INTO `log_admin_operation` VALUES ('106', '1', '127.0.0.1', '添加了广告:1', '2019-03-28 21:20:26');
INSERT INTO `log_admin_operation` VALUES ('107', '1', '127.0.0.1', '修改了广告:1', '2019-03-28 21:22:57');
INSERT INTO `log_admin_operation` VALUES ('108', '1', '127.0.0.1', '添加了广告:3', '2019-03-28 21:23:34');
INSERT INTO `log_admin_operation` VALUES ('109', '1', '127.0.0.1', '删除了广告9,广告名称为：3', '2019-03-28 21:23:40');
INSERT INTO `log_admin_operation` VALUES ('110', '1', '127.0.0.1', '添加了广告:3', '2019-03-28 21:24:54');
INSERT INTO `log_admin_operation` VALUES ('111', '1', '127.0.0.1', '删除了广告10,广告名称为：3', '2019-03-28 21:25:00');
INSERT INTO `log_admin_operation` VALUES ('112', '1', '127.0.0.1', '添加了一条文章标签，名称为测试2', '2019-03-31 13:06:27');
INSERT INTO `log_admin_operation` VALUES ('113', '1', '127.0.0.1', '修改了后台菜单12,后台菜单名称修改为：文章标签', '2019-03-31 13:07:23');
INSERT INTO `log_admin_operation` VALUES ('114', '1', '127.0.0.1', '添加了一条文章标签，名称为测试3', '2019-03-31 13:07:36');
INSERT INTO `log_admin_operation` VALUES ('115', '1', '127.0.0.1', '修改了一条文章标签，名称为测试新', '2019-03-31 13:09:10');
INSERT INTO `log_admin_operation` VALUES ('116', '1', '127.0.0.1', '删除了一条文章标签，名称为测试新', '2019-03-31 13:09:13');
INSERT INTO `log_admin_operation` VALUES ('117', '1', '127.0.0.1', '添加了一个后台菜单,名称为：文章分类', '2019-03-31 13:13:25');
INSERT INTO `log_admin_operation` VALUES ('118', '1', '127.0.0.1', '添加了一个后台菜单,名称为：文章列表', '2019-03-31 13:14:59');
INSERT INTO `log_admin_operation` VALUES ('119', '1', '127.0.0.1', '添加了一条文章分类，名称为ces ', '2019-03-31 13:20:51');
INSERT INTO `log_admin_operation` VALUES ('120', '1', '127.0.0.1', '添加了一条文章分类，名称为c', '2019-03-31 13:20:55');
INSERT INTO `log_admin_operation` VALUES ('121', '1', '127.0.0.1', '修改了id为2的文章分类名称，新名称为cc', '2019-03-31 13:23:14');
INSERT INTO `log_admin_operation` VALUES ('122', '1', '127.0.0.1', '删除了一条文章分类，名称为cc', '2019-03-31 13:23:28');
INSERT INTO `log_admin_operation` VALUES ('123', '1', '127.0.0.1', '添加了一条文章，标题为111', '2019-03-31 14:20:17');
INSERT INTO `log_admin_operation` VALUES ('124', '1', '127.0.0.1', '添加了一条文章，标题为阿斯顿', '2019-03-31 14:27:46');
INSERT INTO `log_admin_operation` VALUES ('125', '1', '127.0.0.1', '添加了一条文章，标题为阿斯顿', '2019-03-31 14:37:53');
INSERT INTO `log_admin_operation` VALUES ('126', '1', '127.0.0.1', '修改了文章:阿斯顿', '2019-03-31 14:40:45');
INSERT INTO `log_admin_operation` VALUES ('127', '1', '127.0.0.1', '修改了文章:阿斯顿1', '2019-03-31 14:41:22');
INSERT INTO `log_admin_operation` VALUES ('128', '1', '127.0.0.1', '修改了文章:阿斯顿1', '2019-03-31 14:42:22');
INSERT INTO `log_admin_operation` VALUES ('129', '1', '127.0.0.1', '修改了文章:阿斯顿1', '2019-03-31 14:42:28');
INSERT INTO `log_admin_operation` VALUES ('130', '1', '127.0.0.1', '删除了一条文章，标题为111', '2019-03-31 14:44:02');
INSERT INTO `log_admin_operation` VALUES ('131', '1', '127.0.0.1', '删除了一条文章，标题为阿斯顿', '2019-03-31 14:45:03');
INSERT INTO `log_admin_operation` VALUES ('132', '1', '127.0.0.1', '删除了一条文章，标题为阿斯顿1', '2019-03-31 14:45:15');
INSERT INTO `log_admin_operation` VALUES ('133', '1', '127.0.0.1', '修改了自己的资料', '2019-03-31 20:27:34');
INSERT INTO `log_admin_operation` VALUES ('134', '1', '127.0.0.1', '修改了自己的资料', '2019-03-31 20:29:00');
INSERT INTO `log_admin_operation` VALUES ('135', '1', '127.0.0.1', '修改了自己的资料', '2019-03-31 20:30:52');
INSERT INTO `log_admin_operation` VALUES ('136', '1', '127.0.0.1', '修改了自己的资料', '2019-03-31 20:31:57');
INSERT INTO `log_admin_operation` VALUES ('137', '1', '127.0.0.1', '添加了一个方法,方法名称为：修改管理员权限', '2019-03-31 20:35:50');
INSERT INTO `log_admin_operation` VALUES ('138', '1', '127.0.0.1', '添加了一个方法,方法名称为：删除管理员', '2019-03-31 20:36:04');
INSERT INTO `log_admin_operation` VALUES ('139', '1', '127.0.0.1', '添加了一个方法,方法名称为：角色管理列表', '2019-03-31 20:36:26');
INSERT INTO `log_admin_operation` VALUES ('140', '1', '127.0.0.1', '添加了一个方法,方法名称为：添加管理员', '2019-03-31 20:36:45');
INSERT INTO `log_admin_operation` VALUES ('141', '1', '127.0.0.1', '添加了一个方法,方法名称为：添加角色数据提交', '2019-03-31 20:37:02');
INSERT INTO `log_admin_operation` VALUES ('142', '1', '127.0.0.1', '添加了一个方法,方法名称为：修改角色信息', '2019-03-31 20:37:19');
INSERT INTO `log_admin_operation` VALUES ('143', '1', '127.0.0.1', '添加了一个方法,方法名称为：修改角色信息提交', '2019-03-31 20:37:39');
INSERT INTO `log_admin_operation` VALUES ('144', '1', '127.0.0.1', '添加了一个方法,方法名称为：修改角色排序', '2019-03-31 20:37:58');
INSERT INTO `log_admin_operation` VALUES ('145', '1', '127.0.0.1', '添加了一个方法,方法名称为：删除角色', '2019-03-31 20:38:10');
INSERT INTO `log_admin_operation` VALUES ('146', '1', '127.0.0.1', '添加了一个方法,方法名称为：设置角色权限', '2019-03-31 20:38:34');
INSERT INTO `log_admin_operation` VALUES ('147', '1', '127.0.0.1', '添加了一个方法,方法名称为：设置权限提交', '2019-03-31 20:38:49');
INSERT INTO `log_admin_operation` VALUES ('148', '1', '127.0.0.1', '添加了一个方法,方法名称为：后台菜单列表', '2019-03-31 20:39:45');
INSERT INTO `log_admin_operation` VALUES ('149', '1', '127.0.0.1', '添加了一个方法,方法名称为：后台菜单添加页面', '2019-03-31 20:40:08');
INSERT INTO `log_admin_operation` VALUES ('150', '1', '127.0.0.1', '添加了一个方法,方法名称为：后台菜单添加提交', '2019-03-31 20:40:24');
INSERT INTO `log_admin_operation` VALUES ('151', '1', '127.0.0.1', '添加了一个方法,方法名称为：后台菜单修改页面', '2019-03-31 20:40:42');
INSERT INTO `log_admin_operation` VALUES ('152', '1', '127.0.0.1', '添加了一个方法,方法名称为：后台菜单修改提交', '2019-03-31 20:40:59');
INSERT INTO `log_admin_operation` VALUES ('153', '1', '127.0.0.1', '添加了一个方法,方法名称为：后台菜单删除', '2019-03-31 20:41:17');
INSERT INTO `log_admin_operation` VALUES ('154', '1', '127.0.0.1', '添加了一个方法,方法名称为：后台菜单排序修改', '2019-03-31 20:41:39');
INSERT INTO `log_admin_operation` VALUES ('155', '1', '127.0.0.1', '添加了一个方法,方法名称为：文章分类管理列表', '2019-03-31 20:42:13');
INSERT INTO `log_admin_operation` VALUES ('156', '1', '127.0.0.1', '添加了一个方法,方法名称为：文章分类添加提交', '2019-03-31 20:42:30');
INSERT INTO `log_admin_operation` VALUES ('157', '1', '127.0.0.1', '添加了一个方法,方法名称为：文章分类修改提交', '2019-03-31 20:42:46');
INSERT INTO `log_admin_operation` VALUES ('158', '1', '127.0.0.1', '添加了一个方法,方法名称为：文章分类删除', '2019-03-31 20:43:09');
INSERT INTO `log_admin_operation` VALUES ('159', '1', '127.0.0.1', '添加了一个方法,方法名称为：文章标签列表', '2019-03-31 20:43:29');
INSERT INTO `log_admin_operation` VALUES ('160', '1', '127.0.0.1', '添加了一个方法,方法名称为：文章标签添加提交', '2019-03-31 20:43:46');
INSERT INTO `log_admin_operation` VALUES ('161', '1', '127.0.0.1', '添加了一个方法,方法名称为：文章标签修改提交', '2019-03-31 20:44:00');
INSERT INTO `log_admin_operation` VALUES ('162', '1', '127.0.0.1', '添加了一个方法,方法名称为：文章分类删除', '2019-03-31 20:44:17');
INSERT INTO `log_admin_operation` VALUES ('163', '1', '127.0.0.1', '添加了一个方法,方法名称为：文章列表', '2019-03-31 20:44:31');
INSERT INTO `log_admin_operation` VALUES ('164', '1', '127.0.0.1', '添加了一个方法,方法名称为：文章添加页面', '2019-03-31 20:44:47');
INSERT INTO `log_admin_operation` VALUES ('165', '1', '127.0.0.1', '添加了一个方法,方法名称为：文章添加提交', '2019-03-31 20:45:10');
INSERT INTO `log_admin_operation` VALUES ('166', '1', '127.0.0.1', '添加了一个方法,方法名称为：文章修改页面', '2019-03-31 20:45:24');
INSERT INTO `log_admin_operation` VALUES ('167', '1', '127.0.0.1', '添加了一个方法,方法名称为：文章修改提交', '2019-03-31 20:45:36');
INSERT INTO `log_admin_operation` VALUES ('168', '1', '127.0.0.1', '添加了一个方法,方法名称为：文章删除', '2019-03-31 20:45:58');
INSERT INTO `log_admin_operation` VALUES ('169', '1', '127.0.0.1', '添加了一个方法,方法名称为：管理员操作日志', '2019-03-31 20:47:14');
INSERT INTO `log_admin_operation` VALUES ('170', '1', '127.0.0.1', '修改了模块9,模块名称修改为：开发者中心', '2019-03-31 20:47:52');
INSERT INTO `log_admin_operation` VALUES ('171', '1', '127.0.0.1', '添加了一个方法,方法名称为：模块列表', '2019-03-31 20:48:17');
INSERT INTO `log_admin_operation` VALUES ('172', '1', '127.0.0.1', '添加了一个方法,方法名称为：模块添加页面', '2019-03-31 20:48:36');
INSERT INTO `log_admin_operation` VALUES ('173', '1', '127.0.0.1', '添加了一个方法,方法名称为：模块添加提交', '2019-03-31 20:48:55');
INSERT INTO `log_admin_operation` VALUES ('174', '1', '127.0.0.1', '添加了一个方法,方法名称为：模块修改页面', '2019-03-31 20:49:09');
INSERT INTO `log_admin_operation` VALUES ('175', '1', '127.0.0.1', '添加了一个方法,方法名称为：模块修改提交', '2019-03-31 20:49:24');
INSERT INTO `log_admin_operation` VALUES ('176', '1', '127.0.0.1', '添加了一个方法,方法名称为：模块删除', '2019-03-31 20:49:39');
INSERT INTO `log_admin_operation` VALUES ('177', '1', '127.0.0.1', '添加了一个方法,方法名称为：方法列表', '2019-03-31 20:49:55');
INSERT INTO `log_admin_operation` VALUES ('178', '1', '127.0.0.1', '添加了一个方法,方法名称为：方法添加页面', '2019-03-31 20:50:09');
INSERT INTO `log_admin_operation` VALUES ('179', '1', '127.0.0.1', '添加了一个方法,方法名称为：方法添加提交', '2019-03-31 20:50:23');
INSERT INTO `log_admin_operation` VALUES ('180', '1', '127.0.0.1', '添加了一个方法,方法名称为：方法修改页面', '2019-03-31 20:50:38');
INSERT INTO `log_admin_operation` VALUES ('181', '1', '127.0.0.1', '添加了一个方法,方法名称为：方法修改提交', '2019-03-31 20:50:50');
INSERT INTO `log_admin_operation` VALUES ('182', '1', '127.0.0.1', '添加了一个方法,方法名称为：方法删除', '2019-03-31 20:51:03');
INSERT INTO `log_admin_operation` VALUES ('183', '1', '127.0.0.1', '添加了一个模块,模块名称为：个人中心', '2019-03-31 20:51:39');
INSERT INTO `log_admin_operation` VALUES ('184', '1', '127.0.0.1', '添加了一个方法,方法名称为：我的资料', '2019-03-31 20:51:57');
INSERT INTO `log_admin_operation` VALUES ('185', '1', '127.0.0.1', '添加了一个方法,方法名称为：我的资料提交', '2019-03-31 20:52:12');
INSERT INTO `log_admin_operation` VALUES ('186', '1', '127.0.0.1', '添加了一个方法,方法名称为：网站设置', '2019-03-31 20:53:07');
INSERT INTO `log_admin_operation` VALUES ('187', '1', '127.0.0.1', '添加了一个方法,方法名称为：网站设置添加页面', '2019-03-31 20:53:27');
INSERT INTO `log_admin_operation` VALUES ('188', '1', '127.0.0.1', '添加了一个方法,方法名称为：网站设置添加提交', '2019-03-31 20:53:46');
INSERT INTO `log_admin_operation` VALUES ('189', '1', '127.0.0.1', '添加了一个方法,方法名称为：网站设置修改页面', '2019-03-31 20:54:01');
INSERT INTO `log_admin_operation` VALUES ('190', '1', '127.0.0.1', '添加了一个方法,方法名称为：网站设置修改提交', '2019-03-31 20:54:25');
INSERT INTO `log_admin_operation` VALUES ('191', '1', '127.0.0.1', '添加了一个方法,方法名称为：网站设置删除', '2019-03-31 20:54:44');
INSERT INTO `log_admin_operation` VALUES ('192', '1', '127.0.0.1', '添加了一个方法,方法名称为：修改网站设置排序', '2019-03-31 20:55:14');
INSERT INTO `log_admin_operation` VALUES ('193', '1', '127.0.0.1', '添加了一个方法,方法名称为：广告列表', '2019-03-31 20:55:32');
INSERT INTO `log_admin_operation` VALUES ('194', '1', '127.0.0.1', '添加了一个方法,方法名称为：广告添加页面', '2019-03-31 20:55:52');
INSERT INTO `log_admin_operation` VALUES ('195', '1', '127.0.0.1', '添加了一个方法,方法名称为：广告添加提交', '2019-03-31 20:56:11');
INSERT INTO `log_admin_operation` VALUES ('196', '1', '127.0.0.1', '添加了一个方法,方法名称为：广告修改页面', '2019-03-31 20:56:28');
INSERT INTO `log_admin_operation` VALUES ('197', '1', '127.0.0.1', '添加了一个方法,方法名称为：广告修改提交', '2019-03-31 20:56:51');
INSERT INTO `log_admin_operation` VALUES ('198', '1', '127.0.0.1', '添加了一个方法,方法名称为：广告删除提交', '2019-03-31 20:57:09');
INSERT INTO `log_admin_operation` VALUES ('199', '1', '127.0.0.1', '添加了一个方法,方法名称为：修改广告排序', '2019-03-31 20:57:42');
INSERT INTO `log_admin_operation` VALUES ('200', '1', '127.0.0.1', '修改了角色1的权限', '2019-03-31 20:58:37');
INSERT INTO `log_admin_operation` VALUES ('201', '1', '127.0.0.1', '添加了一条文章，标题为markdown test', '2019-04-22 20:16:57');
INSERT INTO `log_admin_operation` VALUES ('202', '1', '127.0.0.1', '修改了文章:markdown test', '2019-04-22 20:26:50');
INSERT INTO `log_admin_operation` VALUES ('203', '1', '127.0.0.1', '添加了一条文章，标题为html test', '2019-04-22 20:28:28');
INSERT INTO `log_admin_operation` VALUES ('204', '1', '127.0.0.1', '修改了文章:html test', '2019-04-22 20:28:38');
INSERT INTO `log_admin_operation` VALUES ('205', '1', '127.0.0.1', '修改了文章:html test', '2019-04-22 20:28:47');
INSERT INTO `log_admin_operation` VALUES ('206', '1', '127.0.0.1', '添加了一条文章，标题为test count', '2019-04-22 20:35:06');
INSERT INTO `log_admin_operation` VALUES ('207', '1', '127.0.0.1', '添加了一条文章，标题为test count', '2019-04-22 20:35:24');
INSERT INTO `log_admin_operation` VALUES ('208', '1', '127.0.0.1', '删除了一条文章，标题为test count', '2019-04-22 20:35:29');
INSERT INTO `log_admin_operation` VALUES ('209', '1', '127.0.0.1', '修改了文章:test count', '2019-04-22 20:37:43');
INSERT INTO `log_admin_operation` VALUES ('210', '1', '127.0.0.1', '添加了一个方法,方法名称为：文章推荐设置', '2019-04-22 21:13:05');
INSERT INTO `log_admin_operation` VALUES ('211', '1', '127.0.0.1', '添加了一个方法,方法名称为：文章置顶设置', '2019-04-22 21:13:23');
INSERT INTO `log_admin_operation` VALUES ('212', '1', '127.0.0.1', '修改了角色1的权限', '2019-04-22 21:13:34');
INSERT INTO `log_admin_operation` VALUES ('213', '1', '127.0.0.1', '文章4设为推荐', '2019-04-22 21:14:50');
INSERT INTO `log_admin_operation` VALUES ('214', '1', '127.0.0.1', '文章4取消推荐', '2019-04-22 21:15:54');
INSERT INTO `log_admin_operation` VALUES ('215', '1', '127.0.0.1', '文章4设为推荐', '2019-04-22 21:16:26');
INSERT INTO `log_admin_operation` VALUES ('216', '1', '127.0.0.1', '文章4取消推荐', '2019-04-22 21:16:34');
INSERT INTO `log_admin_operation` VALUES ('217', '1', '127.0.0.1', '文章1设为推荐', '2019-04-22 21:16:42');
INSERT INTO `log_admin_operation` VALUES ('218', '1', '127.0.0.1', '文章1取消推荐', '2019-04-22 21:16:51');
INSERT INTO `log_admin_operation` VALUES ('219', '1', '127.0.0.1', '文章1设为推荐', '2019-04-22 21:16:55');
INSERT INTO `log_admin_operation` VALUES ('220', '1', '127.0.0.1', '文章1取消推荐', '2019-04-22 21:16:59');
INSERT INTO `log_admin_operation` VALUES ('221', '1', '127.0.0.1', '文章1设为推荐', '2019-04-22 21:17:01');
INSERT INTO `log_admin_operation` VALUES ('222', '1', '127.0.0.1', '文章1取消推荐', '2019-04-22 21:17:03');
INSERT INTO `log_admin_operation` VALUES ('223', '1', '127.0.0.1', '文章1设为推荐', '2019-04-22 21:17:04');
INSERT INTO `log_admin_operation` VALUES ('224', '1', '127.0.0.1', '文章1取消推荐', '2019-04-22 21:17:04');
INSERT INTO `log_admin_operation` VALUES ('225', '1', '127.0.0.1', '文章4设为置顶', '2019-04-22 21:18:51');
INSERT INTO `log_admin_operation` VALUES ('226', '1', '127.0.0.1', '文章4取消置顶', '2019-04-22 21:19:32');
INSERT INTO `log_admin_operation` VALUES ('227', '1', '127.0.0.1', '文章1设为置顶', '2019-04-22 21:19:34');
INSERT INTO `log_admin_operation` VALUES ('228', '1', '127.0.0.1', '文章1取消置顶', '2019-04-22 21:20:05');
INSERT INTO `log_admin_operation` VALUES ('229', '1', '127.0.0.1', '文章1设为推荐', '2019-04-22 21:20:07');
INSERT INTO `log_admin_operation` VALUES ('230', '1', '127.0.0.1', '文章1设为置顶', '2019-04-22 21:20:08');
INSERT INTO `log_admin_operation` VALUES ('231', '1', '127.0.0.1', '文章1取消置顶', '2019-04-22 21:20:10');
INSERT INTO `log_admin_operation` VALUES ('232', '1', '127.0.0.1', '文章2设为置顶', '2019-04-22 21:20:11');
INSERT INTO `log_admin_operation` VALUES ('233', '1', '127.0.0.1', '文章2取消置顶', '2019-04-22 21:20:13');
INSERT INTO `log_admin_operation` VALUES ('234', '1', '127.0.0.1', '文章4设为置顶', '2019-04-22 21:20:13');
INSERT INTO `log_admin_operation` VALUES ('235', '1', '127.0.0.1', '文章4取消置顶', '2019-04-22 21:26:02');
INSERT INTO `log_admin_operation` VALUES ('236', '1', '127.0.0.1', '文章2设为置顶', '2019-04-22 21:26:03');
INSERT INTO `log_admin_operation` VALUES ('237', '1', '127.0.0.1', '文章2取消置顶', '2019-04-22 21:26:11');
INSERT INTO `log_admin_operation` VALUES ('238', '1', '127.0.0.1', '文章4设为置顶', '2019-04-22 21:26:11');
INSERT INTO `log_admin_operation` VALUES ('239', '1', '127.0.0.1', '文章4取消置顶', '2019-04-22 21:27:01');
INSERT INTO `log_admin_operation` VALUES ('240', '1', '127.0.0.1', '文章2设为置顶', '2019-04-22 21:27:01');
INSERT INTO `log_admin_operation` VALUES ('241', '1', '127.0.0.1', '文章2取消置顶', '2019-04-22 21:27:04');
INSERT INTO `log_admin_operation` VALUES ('242', '1', '127.0.0.1', '文章4设为置顶', '2019-04-22 21:27:04');
INSERT INTO `log_admin_operation` VALUES ('243', '1', '127.0.0.1', '文章4取消置顶', '2019-04-22 21:27:08');
INSERT INTO `log_admin_operation` VALUES ('244', '1', '127.0.0.1', '文章2设为置顶', '2019-04-22 21:27:08');
INSERT INTO `log_admin_operation` VALUES ('245', '1', '127.0.0.1', '文章1取消推荐', '2019-04-22 21:27:13');
INSERT INTO `log_admin_operation` VALUES ('246', '1', '127.0.0.1', '文章2取消置顶', '2019-04-22 21:27:15');
INSERT INTO `log_admin_operation` VALUES ('247', '1', '127.0.0.1', '文章4设为推荐', '2019-04-22 21:27:16');
INSERT INTO `log_admin_operation` VALUES ('248', '1', '127.0.0.1', '文章2设为推荐', '2019-04-22 21:27:16');
INSERT INTO `log_admin_operation` VALUES ('249', '1', '127.0.0.1', '文章1设为推荐', '2019-04-22 21:27:18');
INSERT INTO `log_admin_operation` VALUES ('250', '1', '127.0.0.1', '文章2设为置顶', '2019-04-22 21:27:18');
INSERT INTO `log_admin_operation` VALUES ('251', '1', '127.0.0.1', '文章2取消置顶', '2019-04-22 21:27:20');
INSERT INTO `log_admin_operation` VALUES ('252', '1', '127.0.0.1', '文章4设为置顶', '2019-04-22 21:27:20');
INSERT INTO `log_admin_operation` VALUES ('253', '1', '127.0.0.1', '文章4取消置顶', '2019-04-22 21:27:21');
INSERT INTO `log_admin_operation` VALUES ('254', '1', '127.0.0.1', '文章1设为置顶', '2019-04-22 21:27:21');
INSERT INTO `log_admin_operation` VALUES ('255', '1', '127.0.0.1', '文章1取消置顶', '2019-04-22 21:27:23');

-- ----------------------------
-- Table structure for `sys_ad`
-- ----------------------------
DROP TABLE IF EXISTS `sys_ad`;
CREATE TABLE `sys_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '标题',
  `sign` varchar(20) NOT NULL DEFAULT '' COMMENT '标签',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_ad
-- ----------------------------
INSERT INTO `sys_ad` VALUES ('8', '1', '1', '1', '/uploads\\ad\\20190328\\281cb380af14e1023170458f4d5ecfd5.png', '0');

-- ----------------------------
-- Table structure for `sys_admin`
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin`;
CREATE TABLE `sys_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色id',
  `account` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `nickname` varchar(20) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_admin
-- ----------------------------
INSERT INTO `sys_admin` VALUES ('1', '1', 'root', 'anyu', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for `sys_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin_role`;
CREATE TABLE `sys_admin_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(10) NOT NULL DEFAULT '' COMMENT '角色名称',
  `action_ids` text NOT NULL COMMENT '可访问方法id集',
  `remark` varchar(20) DEFAULT NULL COMMENT '备注',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_admin_role
-- ----------------------------
INSERT INTO `sys_admin_role` VALUES ('1', '超级管理员', 'admin/admin,admin/admin_add,admin/admin_add_submit,admin/admin_update_nickname,admin/admin_update_password,admin/admin_update_role,admin/admin_delete_submit,admin/role,admin/role_add,admin/role_add_submit,admin/role_update,admin/role_update_submit,admin/update_role_sort_submit,admin/role_delete_submit,admin/role_power_set,admin/role_power_set_submit,settings/siteinfo,settings/siteinfo_submit,settings/settings,settings/settings_add,settings/settings_add_submit,settings/settings_update,settings/settings_update_submit,settings/settings_delete_submit,settings/update_settings_sort_submit,settings/ad,settings/ad_add,settings/ad_add_submit,settings/ad_update_submit,settings/ad_delete_submit,settings/update_ad_sort_submit,settings/ad_update,log/admin_operation,cms/cms_category,cms/cms_category_add_submit,cms/cms_category_update_submit,cms/cms_category_delete_submit,cms/cms_tag,cms/tag_add_submit,cms/tag_update_submit,cms/tag_delete_submit,cms/article,cms/article_add,cms/article_add_submit,cms/article_update,cms/article_update_submit,cms/article_delete_submit,cms/recommend,cms/stick,catalog/admin,catalog/admin_add,catalog/admin_add_submit,catalog/admin_update,catalog/admin_update_submit,catalog/admin_delete_submit,catalog/update_admin_sort_submit,module/module,module/module_add,module/module_add_submit,module/module_update,module/module_update_submit,module/module_delete_submit,module/module_action,module/module_action_add,module/module_action_add_submit,module/module_action_update,module/module_action_update_submit,module/module_action_delete_submit,my/profile,my/profile_submit,', '超级管理员', '1');

-- ----------------------------
-- Table structure for `sys_catalog_admin`
-- ----------------------------
DROP TABLE IF EXISTS `sys_catalog_admin`;
CREATE TABLE `sys_catalog_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '后台管理目录',
  `top_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级id,0一级目录',
  `title` varchar(10) NOT NULL DEFAULT '' COMMENT '标题',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `url` varchar(50) NOT NULL DEFAULT 'index/index' COMMENT '地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `remark` varchar(20) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_catalog_admin
-- ----------------------------
INSERT INTO `sys_catalog_admin` VALUES ('3', '0', '首页', 'fa-laptop', 'index/index', '1', '首页');
INSERT INTO `sys_catalog_admin` VALUES ('5', '0', '管理员管理', 'fa-group', '', '2', '管理员管理');
INSERT INTO `sys_catalog_admin` VALUES ('6', '5', '管理员列表', 'fa-user', 'Admin/admin', '1', '管理员列表');
INSERT INTO `sys_catalog_admin` VALUES ('7', '0', '系统设置', 'fa-gears', '', '3', '');
INSERT INTO `sys_catalog_admin` VALUES ('8', '7', 'seo设置', 'fa-globe', 'Settings/siteinfo', '1', '');
INSERT INTO `sys_catalog_admin` VALUES ('9', '0', '日志管理', 'fa-book', '', '4', '');
INSERT INTO `sys_catalog_admin` VALUES ('10', '9', '管理员操作日志', 'fa-tasks', 'Log/admin_operation', '0', '');
INSERT INTO `sys_catalog_admin` VALUES ('11', '0', '文章管理', 'fa-pencil-square-o', '', '5', '');
INSERT INTO `sys_catalog_admin` VALUES ('12', '11', '文章标签', 'fa-tags', 'Cms/cms_tag', '0', '');
INSERT INTO `sys_catalog_admin` VALUES ('13', '0', '菜单管理', 'fa-building-o', '', '6', '');
INSERT INTO `sys_catalog_admin` VALUES ('14', '13', '后台菜单', 'fa-list', 'Catalog/admin', '0', '');
INSERT INTO `sys_catalog_admin` VALUES ('15', '0', '开发者中心', 'fa-wrench', '', '7', '');
INSERT INTO `sys_catalog_admin` VALUES ('16', '15', '模块管理', 'fa-square-o', 'Module/module', '0', '');
INSERT INTO `sys_catalog_admin` VALUES ('17', '15', '方法管理', 'fa-pencil', 'Module/module_action', '2', '');
INSERT INTO `sys_catalog_admin` VALUES ('18', '5', '角色管理', 'fa-male', 'admin/role', '2', '');
INSERT INTO `sys_catalog_admin` VALUES ('19', '7', '网站设置', 'fa-keyboard-o', 'settings/settings', '0', '');
INSERT INTO `sys_catalog_admin` VALUES ('20', '7', '广告管理', 'fa-picture-o', 'settings/ad', '0', '');
INSERT INTO `sys_catalog_admin` VALUES ('21', '11', '文章分类', 'fa-bars', 'Cms/cms_category', '1', '');
INSERT INTO `sys_catalog_admin` VALUES ('22', '11', '文章列表', 'fa-file-text-o', 'Cms/article', '3', '');

-- ----------------------------
-- Table structure for `sys_catalog_index`
-- ----------------------------
DROP TABLE IF EXISTS `sys_catalog_index`;
CREATE TABLE `sys_catalog_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '前台目录',
  `top_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级目录id',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '标题',
  `icon` varchar(50) NOT NULL DEFAULT '0' COMMENT '图标',
  `url` varchar(50) NOT NULL DEFAULT 'index/index' COMMENT '路径',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `remark` varchar(20) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_catalog_index
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_module`
-- ----------------------------
DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模块id',
  `module_name` varchar(20) NOT NULL DEFAULT '' COMMENT '模块名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `remark` varchar(20) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_module
-- ----------------------------
INSERT INTO `sys_module` VALUES ('4', '管理员管理', '1', '');
INSERT INTO `sys_module` VALUES ('5', '系统设置', '2', '');
INSERT INTO `sys_module` VALUES ('6', '日志管理', '3', '');
INSERT INTO `sys_module` VALUES ('7', '文章管理', '4', '');
INSERT INTO `sys_module` VALUES ('8', '菜单管理', '5', '');
INSERT INTO `sys_module` VALUES ('9', '开发者中心', '6', '');
INSERT INTO `sys_module` VALUES ('10', '个人中心', '7', '');

-- ----------------------------
-- Table structure for `sys_module_action`
-- ----------------------------
DROP TABLE IF EXISTS `sys_module_action`;
CREATE TABLE `sys_module_action` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '方法id',
  `module_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属模块id',
  `action_name` varchar(10) NOT NULL DEFAULT '' COMMENT '方法名',
  `action_url` varchar(40) NOT NULL DEFAULT 'index/index' COMMENT '方法路径',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_module_action
-- ----------------------------
INSERT INTO `sys_module_action` VALUES ('1', '2', 'asd', 'index/index', '2');
INSERT INTO `sys_module_action` VALUES ('2', '3', 'adas', 'qweqwe', '0');
INSERT INTO `sys_module_action` VALUES ('3', '4', '管理员列表', 'admin/admin', '1');
INSERT INTO `sys_module_action` VALUES ('4', '4', '管理员添加', 'admin/admin_add', '2');
INSERT INTO `sys_module_action` VALUES ('5', '4', '管理员添加提交', 'admin/admin_add_submit', '3');
INSERT INTO `sys_module_action` VALUES ('6', '4', '管理员修改昵称', 'admin/admin_update_nickname', '4');
INSERT INTO `sys_module_action` VALUES ('7', '4', '修改管理员密码', 'admin/admin_update_password', '6');
INSERT INTO `sys_module_action` VALUES ('8', '5', '网站seo设置', 'settings/siteinfo', '1');
INSERT INTO `sys_module_action` VALUES ('9', '5', '网站seo设置修改', 'settings/siteinfo_submit', '2');
INSERT INTO `sys_module_action` VALUES ('10', '4', '修改管理员权限', 'admin/admin_update_role', '7');
INSERT INTO `sys_module_action` VALUES ('11', '4', '删除管理员', 'admin/admin_delete_submit', '8');
INSERT INTO `sys_module_action` VALUES ('12', '4', '角色管理列表', 'admin/role', '9');
INSERT INTO `sys_module_action` VALUES ('13', '4', '添加管理员', 'admin/role_add', '10');
INSERT INTO `sys_module_action` VALUES ('14', '4', '添加角色数据提交', 'admin/role_add_submit', '11');
INSERT INTO `sys_module_action` VALUES ('15', '4', '修改角色信息', 'admin/role_update', '12');
INSERT INTO `sys_module_action` VALUES ('16', '4', '修改角色信息提交', 'admin/role_update_submit', '13');
INSERT INTO `sys_module_action` VALUES ('17', '4', '修改角色排序', 'admin/update_role_sort_submit', '14');
INSERT INTO `sys_module_action` VALUES ('18', '4', '删除角色', 'admin/role_delete_submit', '15');
INSERT INTO `sys_module_action` VALUES ('19', '4', '设置角色权限', 'admin/role_power_set', '16');
INSERT INTO `sys_module_action` VALUES ('20', '4', '设置权限提交', 'admin/role_power_set_submit', '17');
INSERT INTO `sys_module_action` VALUES ('21', '8', '后台菜单列表', 'catalog/admin', '1');
INSERT INTO `sys_module_action` VALUES ('22', '8', '后台菜单添加页面', 'catalog/admin_add', '2');
INSERT INTO `sys_module_action` VALUES ('23', '8', '后台菜单添加提交', 'catalog/admin_add_submit', '3');
INSERT INTO `sys_module_action` VALUES ('24', '8', '后台菜单修改页面', 'catalog/admin_update', '4');
INSERT INTO `sys_module_action` VALUES ('25', '8', '后台菜单修改提交', 'catalog/admin_update_submit', '5');
INSERT INTO `sys_module_action` VALUES ('26', '8', '后台菜单删除', 'catalog/admin_delete_submit', '6');
INSERT INTO `sys_module_action` VALUES ('27', '8', '后台菜单排序修改', 'catalog/update_admin_sort_submit', '7');
INSERT INTO `sys_module_action` VALUES ('28', '7', '文章分类管理列表', 'cms/cms_category', '1');
INSERT INTO `sys_module_action` VALUES ('29', '7', '文章分类添加提交', 'cms/cms_category_add_submit', '2');
INSERT INTO `sys_module_action` VALUES ('30', '7', '文章分类修改提交', 'cms/cms_category_update_submit', '3');
INSERT INTO `sys_module_action` VALUES ('31', '7', '文章分类删除', 'cms/cms_category_delete_submit', '3');
INSERT INTO `sys_module_action` VALUES ('32', '7', '文章标签列表', 'cms/cms_tag', '5');
INSERT INTO `sys_module_action` VALUES ('33', '7', '文章标签添加提交', 'cms/tag_add_submit', '6');
INSERT INTO `sys_module_action` VALUES ('34', '7', '文章标签修改提交', 'cms/tag_update_submit', '8');
INSERT INTO `sys_module_action` VALUES ('35', '7', '文章分类删除', 'cms/tag_delete_submit', '9');
INSERT INTO `sys_module_action` VALUES ('36', '7', '文章列表', 'cms/article', '10');
INSERT INTO `sys_module_action` VALUES ('37', '7', '文章添加页面', 'cms/article_add', '11');
INSERT INTO `sys_module_action` VALUES ('38', '7', '文章添加提交', 'cms/article_add_submit', '12');
INSERT INTO `sys_module_action` VALUES ('39', '7', '文章修改页面', 'cms/article_update', '13');
INSERT INTO `sys_module_action` VALUES ('40', '7', '文章修改提交', 'cms/article_update_submit', '14');
INSERT INTO `sys_module_action` VALUES ('41', '7', '文章删除', 'cms/article_delete_submit', '15');
INSERT INTO `sys_module_action` VALUES ('42', '6', '管理员操作日志', 'log/admin_operation', '1');
INSERT INTO `sys_module_action` VALUES ('43', '9', '模块列表', 'module/module', '1');
INSERT INTO `sys_module_action` VALUES ('44', '9', '模块添加页面', 'module/module_add', '2');
INSERT INTO `sys_module_action` VALUES ('45', '9', '模块添加提交', 'module/module_add_submit', '3');
INSERT INTO `sys_module_action` VALUES ('46', '9', '模块修改页面', 'module/module_update', '4');
INSERT INTO `sys_module_action` VALUES ('47', '9', '模块修改提交', 'module/module_update_submit', '6');
INSERT INTO `sys_module_action` VALUES ('48', '9', '模块删除', 'module/module_delete_submit', '7');
INSERT INTO `sys_module_action` VALUES ('49', '9', '方法列表', 'module/module_action', '8');
INSERT INTO `sys_module_action` VALUES ('50', '9', '方法添加页面', 'module/module_action_add', '9');
INSERT INTO `sys_module_action` VALUES ('51', '9', '方法添加提交', 'module/module_action_add_submit', '10');
INSERT INTO `sys_module_action` VALUES ('52', '9', '方法修改页面', 'module/module_action_update', '11');
INSERT INTO `sys_module_action` VALUES ('53', '9', '方法修改提交', 'module/module_action_update_submit', '12');
INSERT INTO `sys_module_action` VALUES ('54', '9', '方法删除', 'module/module_action_delete_submit', '13');
INSERT INTO `sys_module_action` VALUES ('55', '10', '我的资料', 'my/profile', '1');
INSERT INTO `sys_module_action` VALUES ('56', '10', '我的资料提交', 'my/profile_submit', '2');
INSERT INTO `sys_module_action` VALUES ('57', '5', '网站设置', 'settings/settings', '3');
INSERT INTO `sys_module_action` VALUES ('58', '5', '网站设置添加页面', 'settings/settings_add', '4');
INSERT INTO `sys_module_action` VALUES ('59', '5', '网站设置添加提交', 'settings/settings_add_submit', '5');
INSERT INTO `sys_module_action` VALUES ('60', '5', '网站设置修改页面', 'settings/settings_update', '6');
INSERT INTO `sys_module_action` VALUES ('61', '5', '网站设置修改提交', 'settings/settings_update_submit', '7');
INSERT INTO `sys_module_action` VALUES ('62', '5', '网站设置删除', 'settings/settings_delete_submit', '8');
INSERT INTO `sys_module_action` VALUES ('63', '5', '修改网站设置排序', 'settings/update_settings_sort_submit', '9');
INSERT INTO `sys_module_action` VALUES ('64', '5', '广告列表', 'settings/ad', '10');
INSERT INTO `sys_module_action` VALUES ('65', '5', '广告添加页面', 'settings/ad_add', '11');
INSERT INTO `sys_module_action` VALUES ('66', '5', '广告添加提交', 'settings/ad_add_submit', '12');
INSERT INTO `sys_module_action` VALUES ('67', '5', '广告修改页面', 'settings/ad_update', '1113');
INSERT INTO `sys_module_action` VALUES ('68', '5', '广告修改提交', 'settings/ad_update_submit', '14');
INSERT INTO `sys_module_action` VALUES ('69', '5', '广告删除提交', 'settings/ad_delete_submit', '15');
INSERT INTO `sys_module_action` VALUES ('70', '5', '修改广告排序', 'settings/update_ad_sort_submit', '16');
INSERT INTO `sys_module_action` VALUES ('71', '7', '文章推荐设置', 'cms/recommend', '30');
INSERT INTO `sys_module_action` VALUES ('72', '7', '文章置顶设置', 'cms/stick', '31');

-- ----------------------------
-- Table structure for `sys_settings`
-- ----------------------------
DROP TABLE IF EXISTS `sys_settings`;
CREATE TABLE `sys_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设置',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文解释',
  `sign` varchar(40) NOT NULL DEFAULT '' COMMENT '标记',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '值',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_settings
-- ----------------------------
INSERT INTO `sys_settings` VALUES ('1', '测试', 'test', '3', '2');

-- ----------------------------
-- Table structure for `sys_siteinfo`
-- ----------------------------
DROP TABLE IF EXISTS `sys_siteinfo`;
CREATE TABLE `sys_siteinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'seo',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '标题',
  `keyword` varchar(50) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(200) NOT NULL DEFAULT '' COMMENT '描述',
  `copyright` varchar(100) NOT NULL DEFAULT 'Copyright © [year] aner_cms All Rights Reserved.' COMMENT '版权,[year]需要修改',
  `aq` varchar(100) NOT NULL DEFAULT '' COMMENT '备案号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_siteinfo
-- ----------------------------
INSERT INTO `sys_siteinfo` VALUES ('1', 'aner_cms', '暗语寒飞,后台管理,自定义,cms', '暗语寒飞的自定义通用后台管理', 'Copyright © 2019 aner_cms All Rights Reserved.', '1111');
