/*
Navicat MySQL Data Transfer

Source Server         : 118.184.27.245
Source Server Version : 50549
Source Host           : 118.184.27.245:3306
Source Database       : table

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2016-07-04 16:40:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for table_action
-- ----------------------------
DROP TABLE IF EXISTS `table_action`;
CREATE TABLE `table_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of table_action
-- ----------------------------
INSERT INTO `table_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `table_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `table_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `table_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `table_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `table_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `table_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `table_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `table_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `table_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `table_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');

-- ----------------------------
-- Table structure for table_action_log
-- ----------------------------
DROP TABLE IF EXISTS `table_action_log`;
CREATE TABLE `table_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=503 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of table_action_log
-- ----------------------------
INSERT INTO `table_action_log` VALUES ('1', '1', '1', '0', 'member', '1', 'admin在2016-04-24 00:52登录了后台', '1', '1461430328');
INSERT INTO `table_action_log` VALUES ('2', '1', '2', '0', 'member', '2', 'test在2016-04-24 01:36登录了后台', '1', '1461432983');
INSERT INTO `table_action_log` VALUES ('3', '1', '2', '0', 'member', '2', 'test在2016-04-24 01:40登录了后台', '1', '1461433206');
INSERT INTO `table_action_log` VALUES ('4', '1', '1', '0', 'member', '1', 'admin在2016-04-24 01:40登录了后台', '1', '1461433222');
INSERT INTO `table_action_log` VALUES ('5', '1', '1', '0', 'member', '1', 'admin在2016-04-24 01:51登录了后台', '1', '1461433907');
INSERT INTO `table_action_log` VALUES ('6', '1', '1', '0', 'member', '1', 'admin在2016-04-24 01:52登录了后台', '1', '1461433938');
INSERT INTO `table_action_log` VALUES ('7', '1', '2', '0', 'member', '2', 'test在2016-04-24 02:00登录了后台', '1', '1461434425');
INSERT INTO `table_action_log` VALUES ('8', '1', '1', '0', 'member', '1', 'admin在2016-04-30 20:18登录了后台', '1', '1462018706');
INSERT INTO `table_action_log` VALUES ('9', '10', '1', '0', 'Menu', '0', '操作url：/table/index.php?s=/Admin/Menu/del/id/123.html', '1', '1462018718');
INSERT INTO `table_action_log` VALUES ('10', '1', '2', '0', 'member', '2', 'test在2016-04-30 21:40登录了后台', '1', '1462023633');
INSERT INTO `table_action_log` VALUES ('11', '1', '1', '0', 'member', '1', 'admin在2016-04-30 21:40登录了后台', '1', '1462023651');
INSERT INTO `table_action_log` VALUES ('12', '1', '2', '0', 'member', '2', 'test在2016-04-30 21:41登录了后台', '1', '1462023690');
INSERT INTO `table_action_log` VALUES ('13', '1', '2', '0', 'member', '2', 'test在2016-04-30 21:44登录了后台', '1', '1462023840');
INSERT INTO `table_action_log` VALUES ('14', '10', '2', '0', 'Menu', '122', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462023896');
INSERT INTO `table_action_log` VALUES ('15', '10', '2', '0', 'Menu', '122', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462023909');
INSERT INTO `table_action_log` VALUES ('16', '1', '2', '0', 'member', '2', 'test在2016-04-30 21:45登录了后台', '1', '1462023935');
INSERT INTO `table_action_log` VALUES ('17', '1', '2', '0', 'member', '2', 'test在2016-04-30 21:47登录了后台', '1', '1462024067');
INSERT INTO `table_action_log` VALUES ('18', '1', '3', '0', 'member', '3', 'shop1在2016-04-30 21:48登录了后台', '1', '1462024085');
INSERT INTO `table_action_log` VALUES ('19', '1', '3', '0', 'member', '3', 'shop1在2016-04-30 21:55登录了后台', '1', '1462024510');
INSERT INTO `table_action_log` VALUES ('20', '1', '3', '0', 'member', '3', 'shop1在2016-04-30 21:56登录了后台', '1', '1462024605');
INSERT INTO `table_action_log` VALUES ('21', '10', '3', '0', 'Menu', '140', '操作url：/table/index.php?s=/Admin/Menu/add.html', '1', '1462024692');
INSERT INTO `table_action_log` VALUES ('22', '10', '3', '0', 'Menu', '140', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462024725');
INSERT INTO `table_action_log` VALUES ('23', '1', '3', '0', 'member', '3', 'shop1在2016-04-30 21:59登录了后台', '1', '1462024757');
INSERT INTO `table_action_log` VALUES ('24', '1', '1', '0', 'member', '1', 'admin在2016-04-30 22:00登录了后台', '1', '1462024833');
INSERT INTO `table_action_log` VALUES ('25', '10', '1', '0', 'Menu', '0', '操作url：/table/index.php?s=/Admin/Menu/del/id/140.html', '1', '1462024850');
INSERT INTO `table_action_log` VALUES ('26', '10', '1', '0', 'Menu', '122', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462024865');
INSERT INTO `table_action_log` VALUES ('27', '1', '1', '0', 'member', '1', 'admin在2016-04-30 22:06登录了后台', '1', '1462025200');
INSERT INTO `table_action_log` VALUES ('28', '1', '1', '0', 'member', '1', 'admin在2016-04-30 22:54登录了后台', '1', '1462028048');
INSERT INTO `table_action_log` VALUES ('29', '1', '1', '0', 'member', '1', 'admin在2016-04-30 22:56登录了后台', '1', '1462028205');
INSERT INTO `table_action_log` VALUES ('30', '1', '1', '0', 'member', '1', 'admin在2016-04-30 22:57登录了后台', '1', '1462028254');
INSERT INTO `table_action_log` VALUES ('31', '10', '1', '0', 'Menu', '141', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462029340');
INSERT INTO `table_action_log` VALUES ('32', '10', '1', '0', 'Menu', '130', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462029354');
INSERT INTO `table_action_log` VALUES ('33', '10', '1', '0', 'Menu', '131', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462029369');
INSERT INTO `table_action_log` VALUES ('34', '10', '1', '0', 'Menu', '0', '操作url：/table/index.php?s=/Admin/Menu/del/id/2.html', '1', '1462029388');
INSERT INTO `table_action_log` VALUES ('35', '10', '1', '0', 'Menu', '131', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462029853');
INSERT INTO `table_action_log` VALUES ('36', '1', '1', '0', 'member', '1', 'admin在2016-05-07 22:17登录了后台', '1', '1462630666');
INSERT INTO `table_action_log` VALUES ('37', '1', '1', '0', 'member', '1', 'admin在2016-05-07 23:42登录了后台', '1', '1462635759');
INSERT INTO `table_action_log` VALUES ('38', '1', '1', '0', 'member', '1', 'admin在2016-05-08 01:02登录了后台', '1', '1462640528');
INSERT INTO `table_action_log` VALUES ('39', '1', '1', '0', 'member', '1', 'admin在2016-05-09 21:24登录了后台', '1', '1462800250');
INSERT INTO `table_action_log` VALUES ('40', '1', '1', '0', 'member', '1', 'admin在2016-05-10 23:14登录了后台', '1', '1462893249');
INSERT INTO `table_action_log` VALUES ('41', '10', '1', '0', 'Menu', '127', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462895796');
INSERT INTO `table_action_log` VALUES ('42', '10', '1', '0', 'Menu', '144', '操作url：/table/index.php?s=/Admin/Menu/add.html', '1', '1462895948');
INSERT INTO `table_action_log` VALUES ('43', '10', '1', '0', 'Menu', '127', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462895956');
INSERT INTO `table_action_log` VALUES ('44', '10', '1', '0', 'Menu', '144', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462895969');
INSERT INTO `table_action_log` VALUES ('45', '10', '1', '0', 'Menu', '127', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462896014');
INSERT INTO `table_action_log` VALUES ('46', '10', '1', '0', 'Menu', '128', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462897418');
INSERT INTO `table_action_log` VALUES ('47', '10', '1', '0', 'Menu', '127', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462897424');
INSERT INTO `table_action_log` VALUES ('48', '10', '1', '0', 'Menu', '129', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462897431');
INSERT INTO `table_action_log` VALUES ('49', '10', '1', '0', 'Menu', '127', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462897818');
INSERT INTO `table_action_log` VALUES ('50', '10', '1', '0', 'Menu', '129', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462897833');
INSERT INTO `table_action_log` VALUES ('51', '10', '1', '0', 'Menu', '133', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462898432');
INSERT INTO `table_action_log` VALUES ('52', '10', '1', '0', 'Menu', '131', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462898443');
INSERT INTO `table_action_log` VALUES ('53', '10', '1', '0', 'Menu', '131', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1462898478');
INSERT INTO `table_action_log` VALUES ('54', '1', '1', '0', 'member', '1', 'admin在2016-05-15 13:06登录了后台', '1', '1463288767');
INSERT INTO `table_action_log` VALUES ('55', '10', '1', '0', 'Menu', '125', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1463292126');
INSERT INTO `table_action_log` VALUES ('56', '10', '1', '0', 'Menu', '134', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1463292239');
INSERT INTO `table_action_log` VALUES ('57', '10', '1', '0', 'Menu', '135', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1463292260');
INSERT INTO `table_action_log` VALUES ('58', '10', '1', '0', 'Menu', '136', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1463292274');
INSERT INTO `table_action_log` VALUES ('59', '10', '1', '0', 'Menu', '128', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1463293553');
INSERT INTO `table_action_log` VALUES ('60', '10', '1', '0', 'Menu', '87', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1463295579');
INSERT INTO `table_action_log` VALUES ('61', '10', '1', '0', 'Menu', '88', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1463295584');
INSERT INTO `table_action_log` VALUES ('62', '10', '1', '0', 'Menu', '86', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1463295600');
INSERT INTO `table_action_log` VALUES ('63', '10', '1', '0', 'Menu', '90', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1463295606');
INSERT INTO `table_action_log` VALUES ('64', '10', '1', '0', 'Menu', '69', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1463295615');
INSERT INTO `table_action_log` VALUES ('65', '10', '1', '0', 'Menu', '80', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1463295621');
INSERT INTO `table_action_log` VALUES ('66', '10', '1', '0', 'Menu', '70', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1463295629');
INSERT INTO `table_action_log` VALUES ('67', '10', '1', '0', 'Menu', '76', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1463295654');
INSERT INTO `table_action_log` VALUES ('68', '10', '1', '0', 'Menu', '58', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1463295670');
INSERT INTO `table_action_log` VALUES ('69', '10', '1', '0', 'Menu', '145', '操作url：/table/index.php?s=/Admin/Menu/add.html', '1', '1463295791');
INSERT INTO `table_action_log` VALUES ('70', '10', '1', '0', 'Menu', '146', '操作url：/table/index.php?s=/Admin/Menu/add.html', '1', '1463295834');
INSERT INTO `table_action_log` VALUES ('71', '10', '1', '0', 'Menu', '68', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1463297190');
INSERT INTO `table_action_log` VALUES ('72', '1', '1', '0', 'member', '1', 'admin在2016-05-15 16:00登录了后台', '1', '1463299242');
INSERT INTO `table_action_log` VALUES ('73', '1', '1', '0', 'member', '1', 'admin在2016-05-17 20:12登录了后台', '1', '1463487122');
INSERT INTO `table_action_log` VALUES ('74', '1', '1', '0', 'member', '1', 'admin在2016-05-17 22:58登录了后台', '1', '1463497119');
INSERT INTO `table_action_log` VALUES ('75', '1', '4', '-1062731419', 'member', '4', 'test3在2016-05-17 23:39登录了后台', '1', '1463499586');
INSERT INTO `table_action_log` VALUES ('76', '1', '4', '-1062731419', 'member', '4', 'test3在2016-05-18 00:14登录了后台', '1', '1463501683');
INSERT INTO `table_action_log` VALUES ('77', '1', '4', '-1062731419', 'member', '4', 'test3在2016-05-18 00:14登录了后台', '1', '1463501692');
INSERT INTO `table_action_log` VALUES ('78', '1', '4', '-1062731419', 'member', '4', 'test3在2016-05-18 00:28登录了后台', '1', '1463502532');
INSERT INTO `table_action_log` VALUES ('79', '1', '4', '-1062731419', 'member', '4', 'test3在2016-05-18 00:30登录了后台', '1', '1463502630');
INSERT INTO `table_action_log` VALUES ('80', '1', '4', '0', 'member', '4', 'test3在2016-05-19 00:03登录了后台', '1', '1463587394');
INSERT INTO `table_action_log` VALUES ('81', '1', '4', '0', 'member', '4', 'test3在2016-05-22 14:17登录了后台', '1', '1463897857');
INSERT INTO `table_action_log` VALUES ('82', '1', '4', '0', 'member', '4', 'test3在2016-05-22 14:18登录了后台', '1', '1463897892');
INSERT INTO `table_action_log` VALUES ('83', '1', '4', '0', 'member', '4', 'test3在2016-05-22 23:24登录了后台', '1', '1463930687');
INSERT INTO `table_action_log` VALUES ('84', '1', '4', '0', 'member', '4', 'test3在2016-05-22 23:29登录了后台', '1', '1463930999');
INSERT INTO `table_action_log` VALUES ('85', '1', '4', '0', 'member', '4', 'test3在2016-05-23 01:15登录了后台', '1', '1463937356');
INSERT INTO `table_action_log` VALUES ('86', '1', '4', '0', 'member', '4', 'test3在2016-05-23 21:22登录了后台', '1', '1464009742');
INSERT INTO `table_action_log` VALUES ('87', '1', '4', '0', 'member', '4', 'test3在2016-05-23 21:26登录了后台', '1', '1464010003');
INSERT INTO `table_action_log` VALUES ('88', '1', '1', '0', 'member', '1', 'admin在2016-05-23 21:27登录了后台', '1', '1464010027');
INSERT INTO `table_action_log` VALUES ('89', '1', '1', '0', 'member', '1', 'admin在2016-05-24 11:20登录了后台', '1', '1464060020');
INSERT INTO `table_action_log` VALUES ('90', '1', '4', '0', 'member', '4', 'test3在2016-05-24 11:21登录了后台', '1', '1464060070');
INSERT INTO `table_action_log` VALUES ('91', '1', '4', '0', 'member', '4', 'test3在2016-05-24 17:00登录了后台', '1', '1464080453');
INSERT INTO `table_action_log` VALUES ('92', '1', '1', '0', 'member', '1', 'admin在2016-05-24 21:52登录了后台', '1', '1464097930');
INSERT INTO `table_action_log` VALUES ('93', '1', '5', '0', 'member', '5', 'allen在2016-05-25 00:19登录了后台', '1', '1464106792');
INSERT INTO `table_action_log` VALUES ('94', '1', '4', '-1062731415', 'member', '4', 'test3在2016-05-25 00:50登录了后台', '1', '1464108603');
INSERT INTO `table_action_log` VALUES ('95', '1', '4', '-1062731415', 'member', '4', 'test3在2016-05-25 00:50登录了后台', '1', '1464108629');
INSERT INTO `table_action_log` VALUES ('96', '1', '4', '-1062731413', 'member', '4', 'test3在2016-05-25 00:54登录了后台', '1', '1464108870');
INSERT INTO `table_action_log` VALUES ('97', '1', '4', '-1062731415', 'member', '4', 'test3在2016-05-25 01:02登录了后台', '1', '1464109354');
INSERT INTO `table_action_log` VALUES ('98', '1', '1', '0', 'member', '1', 'admin在2016-05-25 23:33登录了后台', '1', '1464190385');
INSERT INTO `table_action_log` VALUES ('99', '1', '1', '0', 'member', '1', 'admin在2016-05-26 00:14登录了后台', '1', '1464192864');
INSERT INTO `table_action_log` VALUES ('100', '1', '1', '0', 'member', '1', 'admin在2016-05-26 00:16登录了后台', '1', '1464193016');
INSERT INTO `table_action_log` VALUES ('101', '1', '6', '0', 'member', '6', 'superadmin在2016-05-26 00:19登录了后台', '1', '1464193183');
INSERT INTO `table_action_log` VALUES ('102', '1', '6', '0', 'member', '6', 'superadmin在2016-05-26 00:20登录了后台', '1', '1464193226');
INSERT INTO `table_action_log` VALUES ('103', '1', '6', '0', 'member', '6', 'superadmin在2016-05-26 00:20登录了后台', '1', '1464193248');
INSERT INTO `table_action_log` VALUES ('104', '1', '6', '0', 'member', '6', 'superadmin在2016-05-26 00:28登录了后台', '1', '1464193684');
INSERT INTO `table_action_log` VALUES ('105', '1', '4', '0', 'member', '4', 'test3在2016-05-31 00:02登录了后台', '1', '1464624148');
INSERT INTO `table_action_log` VALUES ('106', '1', '1', '0', 'member', '1', 'admin在2016-05-31 00:38登录了后台', '1', '1464626304');
INSERT INTO `table_action_log` VALUES ('107', '1', '2', '2005057059', 'member', '2', 'test在2016-05-31 09:39登录了后台', '1', '1464658754');
INSERT INTO `table_action_log` VALUES ('108', '1', '1', '2005057059', 'member', '1', 'admin在2016-05-31 09:40登录了后台', '1', '1464658820');
INSERT INTO `table_action_log` VALUES ('109', '1', '4', '2005057059', 'member', '4', 'test3在2016-05-31 09:44登录了后台', '1', '1464659085');
INSERT INTO `table_action_log` VALUES ('110', '1', '1', '2005087527', 'member', '1', 'admin在2016-05-31 09:55登录了后台', '1', '1464659716');
INSERT INTO `table_action_log` VALUES ('111', '1', '4', '2005057059', 'member', '4', 'test3在2016-05-31 09:58登录了后台', '1', '1464659900');
INSERT INTO `table_action_log` VALUES ('112', '1', '1', '3072703533', 'member', '1', 'admin在2016-05-31 10:01登录了后台', '1', '1464660094');
INSERT INTO `table_action_log` VALUES ('113', '1', '4', '3072703533', 'member', '4', 'test3在2016-05-31 10:02登录了后台', '1', '1464660140');
INSERT INTO `table_action_log` VALUES ('114', '1', '6', '2005087527', 'member', '6', 'superadmin在2016-05-31 10:05登录了后台', '1', '1464660308');
INSERT INTO `table_action_log` VALUES ('115', '1', '4', '3072703533', 'member', '4', 'test3在2016-05-31 10:05登录了后台', '1', '1464660358');
INSERT INTO `table_action_log` VALUES ('116', '1', '4', '2031041312', 'member', '4', 'test3在2016-05-31 10:07登录了后台', '1', '1464660430');
INSERT INTO `table_action_log` VALUES ('117', '1', '4', '3072703533', 'member', '4', 'test3在2016-05-31 10:08登录了后台', '1', '1464660523');
INSERT INTO `table_action_log` VALUES ('118', '1', '4', '2005057059', 'member', '4', 'test3在2016-05-31 10:25登录了后台', '1', '1464661507');
INSERT INTO `table_action_log` VALUES ('119', '1', '4', '2005057059', 'member', '4', 'test3在2016-05-31 10:27登录了后台', '1', '1464661633');
INSERT INTO `table_action_log` VALUES ('120', '1', '4', '2031041312', 'member', '4', 'test3在2016-05-31 10:29登录了后台', '1', '1464661797');
INSERT INTO `table_action_log` VALUES ('121', '1', '4', '2005057059', 'member', '4', 'test3在2016-05-31 10:36登录了后台', '1', '1464662216');
INSERT INTO `table_action_log` VALUES ('122', '1', '4', '2005057059', 'member', '4', 'test3在2016-05-31 10:37登录了后台', '1', '1464662261');
INSERT INTO `table_action_log` VALUES ('123', '1', '4', '1971857739', 'member', '4', 'test3在2016-05-31 11:03登录了后台', '1', '1464663822');
INSERT INTO `table_action_log` VALUES ('124', '1', '4', '2005057059', 'member', '4', 'test3在2016-05-31 11:05登录了后台', '1', '1464663914');
INSERT INTO `table_action_log` VALUES ('125', '1', '4', '1971857739', 'member', '4', 'test3在2016-05-31 11:13登录了后台', '1', '1464664421');
INSERT INTO `table_action_log` VALUES ('126', '1', '2', '2005057059', 'member', '2', 'test在2016-05-31 11:26登录了后台', '1', '1464665184');
INSERT INTO `table_action_log` VALUES ('127', '1', '1', '2005057059', 'member', '1', 'admin在2016-05-31 11:28登录了后台', '1', '1464665316');
INSERT INTO `table_action_log` VALUES ('128', '1', '4', '1971857739', 'member', '4', 'test3在2016-05-31 11:29登录了后台', '1', '1464665347');
INSERT INTO `table_action_log` VALUES ('129', '1', '4', '1971857739', 'member', '4', 'test3在2016-05-31 11:30登录了后台', '1', '1464665420');
INSERT INTO `table_action_log` VALUES ('130', '1', '4', '2005057059', 'member', '4', 'test3在2016-05-31 12:06登录了后台', '1', '1464667603');
INSERT INTO `table_action_log` VALUES ('131', '1', '1', '2005057059', 'member', '1', 'admin在2016-05-31 16:20登录了后台', '1', '1464682827');
INSERT INTO `table_action_log` VALUES ('132', '1', '4', '1800235568', 'member', '4', 'test3在2016-05-31 19:51登录了后台', '1', '1464695498');
INSERT INTO `table_action_log` VALUES ('133', '1', '4', '0', 'member', '4', 'test3在2016-05-31 22:55登录了后台', '1', '1464706522');
INSERT INTO `table_action_log` VALUES ('134', '1', '1', '0', 'member', '1', 'admin在2016-05-31 23:40登录了后台', '1', '1464709227');
INSERT INTO `table_action_log` VALUES ('135', '1', '4', '3072705608', 'member', '4', 'test3在2016-06-01 00:10登录了后台', '1', '1464711044');
INSERT INTO `table_action_log` VALUES ('136', '1', '4', '1971857597', 'member', '4', 'test3在2016-06-01 09:42登录了后台', '1', '1464745379');
INSERT INTO `table_action_log` VALUES ('137', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-01 09:44登录了后台', '1', '1464745465');
INSERT INTO `table_action_log` VALUES ('138', '1', '6', '3682970284', 'member', '6', 'superadmin在2016-06-01 09:46登录了后台', '1', '1464745564');
INSERT INTO `table_action_log` VALUES ('139', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-01 09:48登录了后台', '1', '1464745688');
INSERT INTO `table_action_log` VALUES ('140', '1', '4', '3072703533', 'member', '4', 'test3在2016-06-01 09:50登录了后台', '1', '1464745855');
INSERT INTO `table_action_log` VALUES ('141', '1', '1', '2005056849', 'member', '1', 'admin在2016-06-01 10:11登录了后台', '1', '1464747101');
INSERT INTO `table_action_log` VALUES ('142', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-01 10:41登录了后台', '1', '1464748905');
INSERT INTO `table_action_log` VALUES ('143', '1', '4', '3072703533', 'member', '4', 'test3在2016-06-01 10:46登录了后台', '1', '1464749183');
INSERT INTO `table_action_log` VALUES ('144', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-01 10:59登录了后台', '1', '1464749950');
INSERT INTO `table_action_log` VALUES ('145', '1', '1', '2005056849', 'member', '1', 'admin在2016-06-01 15:37登录了后台', '1', '1464766660');
INSERT INTO `table_action_log` VALUES ('146', '1', '4', '2031041312', 'member', '4', 'test3在2016-06-01 16:42登录了后台', '1', '1464770543');
INSERT INTO `table_action_log` VALUES ('147', '1', '4', '2031041312', 'member', '4', 'test3在2016-06-01 17:14登录了后台', '1', '1464772475');
INSERT INTO `table_action_log` VALUES ('148', '1', '1', '2005056849', 'member', '1', 'admin在2016-06-02 14:25登录了后台', '1', '1464848714');
INSERT INTO `table_action_log` VALUES ('149', '1', '4', '2793999927', 'member', '4', 'test3在2016-06-03 06:12登录了后台', '1', '1464905551');
INSERT INTO `table_action_log` VALUES ('150', '1', '1', '2005057349', 'member', '1', 'admin在2016-06-03 10:19登录了后台', '1', '1464920374');
INSERT INTO `table_action_log` VALUES ('151', '1', '10', '0', 'member', '10', 'mike在2016-06-04 20:49登录了后台', '1', '1465044575');
INSERT INTO `table_action_log` VALUES ('152', '1', '1', '0', 'member', '1', 'admin在2016-06-04 20:52登录了后台', '1', '1465044766');
INSERT INTO `table_action_log` VALUES ('153', '1', '1', '0', 'member', '1', 'admin在2016-06-05 09:02登录了后台', '1', '1465088540');
INSERT INTO `table_action_log` VALUES ('154', '1', '4', '0', 'member', '4', 'test3在2016-06-05 09:02登录了后台', '1', '1465088563');
INSERT INTO `table_action_log` VALUES ('155', '1', '4', '-1062731406', 'member', '4', 'test3在2016-06-05 09:10登录了后台', '1', '1465089048');
INSERT INTO `table_action_log` VALUES ('156', '1', '4', '-1062731415', 'member', '4', 'test3在2016-06-05 09:13登录了后台', '1', '1465089183');
INSERT INTO `table_action_log` VALUES ('157', '1', '4', '-1062731406', 'member', '4', 'test3在2016-06-05 10:00登录了后台', '1', '1465092035');
INSERT INTO `table_action_log` VALUES ('158', '1', '4', '-1062731406', 'member', '4', 'test3在2016-06-05 10:00登录了后台', '1', '1465092036');
INSERT INTO `table_action_log` VALUES ('159', '1', '4', '-1062731406', 'member', '4', 'test3在2016-06-05 10:09登录了后台', '1', '1465092554');
INSERT INTO `table_action_log` VALUES ('160', '1', '4', '-1062731406', 'member', '4', 'test3在2016-06-05 10:13登录了后台', '1', '1465092826');
INSERT INTO `table_action_log` VALUES ('161', '1', '4', '-1062731415', 'member', '4', 'test3在2016-06-05 10:43登录了后台', '1', '1465094609');
INSERT INTO `table_action_log` VALUES ('162', '1', '1', '-1062731415', 'member', '1', 'admin在2016-06-05 11:03登录了后台', '1', '1465095799');
INSERT INTO `table_action_log` VALUES ('163', '10', '1', '-1062731415', 'Menu', '138', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1465122043');
INSERT INTO `table_action_log` VALUES ('164', '10', '1', '-1062731415', 'Menu', '139', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1465122097');
INSERT INTO `table_action_log` VALUES ('165', '10', '1', '-1062731415', 'Menu', '126', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1465122242');
INSERT INTO `table_action_log` VALUES ('166', '1', '1', '0', 'member', '1', 'admin在2016-06-05 19:01登录了后台', '1', '1465124506');
INSERT INTO `table_action_log` VALUES ('167', '10', '1', '0', 'Menu', '138', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1465126022');
INSERT INTO `table_action_log` VALUES ('168', '10', '1', '0', 'Menu', '126', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1465126044');
INSERT INTO `table_action_log` VALUES ('169', '10', '1', '0', 'Menu', '139', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1465126061');
INSERT INTO `table_action_log` VALUES ('170', '10', '1', '0', 'Menu', '80', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1465139158');
INSERT INTO `table_action_log` VALUES ('171', '11', '1', '0', 'category', '39', '操作url：/table/index.php?s=/Admin/Category/edit.html', '1', '1465139360');
INSERT INTO `table_action_log` VALUES ('172', '11', '1', '0', 'category', '39', '操作url：/table/index.php?s=/Admin/Category/edit.html', '1', '1465139366');
INSERT INTO `table_action_log` VALUES ('173', '11', '1', '0', 'category', '43', '操作url：/table/index.php?s=/Admin/Category/add.html', '1', '1465139447');
INSERT INTO `table_action_log` VALUES ('174', '11', '1', '0', 'category', '44', '操作url：/table/index.php?s=/Admin/Category/add.html', '1', '1465139586');
INSERT INTO `table_action_log` VALUES ('175', '11', '1', '0', 'category', '39', '操作url：/table/index.php?s=/Admin/Category/edit.html', '1', '1465139634');
INSERT INTO `table_action_log` VALUES ('176', '11', '1', '0', 'category', '39', '操作url：/table/index.php?s=/Admin/Category/edit.html', '1', '1465139684');
INSERT INTO `table_action_log` VALUES ('177', '11', '1', '0', 'category', '44', '操作url：/table/index.php?s=/Admin/Category/edit.html', '1', '1465139711');
INSERT INTO `table_action_log` VALUES ('178', '11', '1', '0', 'category', '44', '操作url：/table/index.php?s=/Admin/Category/edit.html', '1', '1465139776');
INSERT INTO `table_action_log` VALUES ('179', '11', '1', '0', 'category', '44', '操作url：/table/index.php?s=/Admin/Category/edit.html', '1', '1465139805');
INSERT INTO `table_action_log` VALUES ('180', '11', '1', '0', 'category', '44', '操作url：/table/index.php?s=/Admin/Category/edit.html', '1', '1465139829');
INSERT INTO `table_action_log` VALUES ('181', '11', '1', '0', 'category', '44', '操作url：/table/index.php?s=/Admin/Category/remove/id/44.html', '1', '1465139836');
INSERT INTO `table_action_log` VALUES ('182', '11', '1', '0', 'category', '45', '操作url：/table/index.php?s=/Admin/Category/add.html', '1', '1465140192');
INSERT INTO `table_action_log` VALUES ('183', '11', '1', '0', 'category', '45', '操作url：/table/index.php?s=/Admin/Category/edit.html', '1', '1465140198');
INSERT INTO `table_action_log` VALUES ('184', '11', '1', '0', 'category', '45', '操作url：/table/index.php?s=/Admin/Category/edit.html', '1', '1465140202');
INSERT INTO `table_action_log` VALUES ('185', '11', '1', '0', 'category', '40', '操作url：/table/index.php?s=/Admin/Category/edit.html', '1', '1465140312');
INSERT INTO `table_action_log` VALUES ('186', '1', '4', '0', 'member', '4', 'test3在2016-06-06 00:38登录了后台', '1', '1465144712');
INSERT INTO `table_action_log` VALUES ('187', '1', '6', '0', 'member', '6', 'superadmin在2016-06-06 00:50登录了后台', '1', '1465145449');
INSERT INTO `table_action_log` VALUES ('188', '1', '4', '-1062731415', 'member', '4', 'test3在2016-06-06 07:31登录了后台', '1', '1465169461');
INSERT INTO `table_action_log` VALUES ('189', '1', '4', '-1062731415', 'member', '4', 'test3在2016-06-06 08:04登录了后台', '1', '1465171459');
INSERT INTO `table_action_log` VALUES ('190', '1', '4', '0', 'member', '4', 'test3在2016-06-06 20:02登录了后台', '1', '1465214561');
INSERT INTO `table_action_log` VALUES ('191', '1', '1', '0', 'member', '1', 'admin在2016-06-06 20:31登录了后台', '1', '1465216272');
INSERT INTO `table_action_log` VALUES ('192', '1', '4', '0', 'member', '4', 'test3在2016-06-06 20:31登录了后台', '1', '1465216308');
INSERT INTO `table_action_log` VALUES ('193', '1', '4', '0', 'member', '4', 'test3在2016-06-06 20:46登录了后台', '1', '1465217218');
INSERT INTO `table_action_log` VALUES ('194', '1', '4', '0', 'member', '4', 'test3在2016-06-06 20:48登录了后台', '1', '1465217292');
INSERT INTO `table_action_log` VALUES ('195', '1', '4', '0', 'member', '4', 'test3在2016-06-06 21:02登录了后台', '1', '1465218167');
INSERT INTO `table_action_log` VALUES ('196', '1', '4', '0', 'member', '4', 'test3在2016-06-06 21:11登录了后台', '1', '1465218681');
INSERT INTO `table_action_log` VALUES ('197', '1', '4', '-1062731415', 'member', '4', 'test3在2016-06-06 21:16登录了后台', '1', '1465219004');
INSERT INTO `table_action_log` VALUES ('198', '1', '4', '-1062731406', 'member', '4', 'test3在2016-06-06 21:18登录了后台', '1', '1465219099');
INSERT INTO `table_action_log` VALUES ('199', '1', '4', '-1062731406', 'member', '4', 'test3在2016-06-06 21:30登录了后台', '1', '1465219851');
INSERT INTO `table_action_log` VALUES ('200', '1', '4', '-1062731406', 'member', '4', 'test3在2016-06-07 00:13登录了后台', '1', '1465229603');
INSERT INTO `table_action_log` VALUES ('201', '1', '4', '-1062731406', 'member', '4', 'test3在2016-06-07 00:15登录了后台', '1', '1465229717');
INSERT INTO `table_action_log` VALUES ('202', '1', '1', '0', 'member', '1', 'admin在2016-06-07 02:14登录了后台', '1', '1465236841');
INSERT INTO `table_action_log` VALUES ('203', '1', '4', '0', 'member', '4', 'test3在2016-06-07 23:22登录了后台', '1', '1465312944');
INSERT INTO `table_action_log` VALUES ('204', '1', '4', '0', 'member', '4', 'test3在2016-06-07 23:59登录了后台', '1', '1465315192');
INSERT INTO `table_action_log` VALUES ('205', '1', '1', '0', 'member', '1', 'admin在2016-06-08 00:48登录了后台', '1', '1465318084');
INSERT INTO `table_action_log` VALUES ('206', '1', '4', '0', 'member', '4', 'test3在2016-06-08 00:48登录了后台', '1', '1465318088');
INSERT INTO `table_action_log` VALUES ('207', '1', '4', '0', 'member', '4', 'test3在2016-06-08 02:02登录了后台', '1', '1465322572');
INSERT INTO `table_action_log` VALUES ('208', '1', '4', '3072704597', 'member', '4', 'test3在2016-06-08 02:06登录了后台', '1', '1465322769');
INSERT INTO `table_action_log` VALUES ('209', '1', '1', '1227410655', 'member', '1', 'admin在2016-06-08 09:21登录了后台', '1', '1465348892');
INSERT INTO `table_action_log` VALUES ('210', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-08 09:22登录了后台', '1', '1465348969');
INSERT INTO `table_action_log` VALUES ('211', '1', '4', '1971857701', 'member', '4', 'test3在2016-06-08 09:43登录了后台', '1', '1465350216');
INSERT INTO `table_action_log` VALUES ('212', '1', '4', '244961504', 'member', '4', 'test3在2016-06-08 10:11登录了后台', '1', '1465351867');
INSERT INTO `table_action_log` VALUES ('213', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-08 10:12登录了后台', '1', '1465351974');
INSERT INTO `table_action_log` VALUES ('214', '1', '1', '1227410655', 'member', '1', 'admin在2016-06-08 10:19登录了后台', '1', '1465352387');
INSERT INTO `table_action_log` VALUES ('215', '1', '1', '2005056880', 'member', '1', 'admin在2016-06-08 10:26登录了后台', '1', '1465352817');
INSERT INTO `table_action_log` VALUES ('216', '1', '4', '2239921810', 'member', '4', 'test3在2016-06-08 10:36登录了后台', '1', '1465353407');
INSERT INTO `table_action_log` VALUES ('217', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-08 14:39登录了后台', '1', '1465367991');
INSERT INTO `table_action_log` VALUES ('218', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-08 14:41登录了后台', '1', '1465368076');
INSERT INTO `table_action_log` VALUES ('219', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-08 14:46登录了后台', '1', '1465368409');
INSERT INTO `table_action_log` VALUES ('220', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-08 14:49登录了后台', '1', '1465368594');
INSERT INTO `table_action_log` VALUES ('221', '1', '4', '2005056880', 'member', '4', 'test3在2016-06-08 15:48登录了后台', '1', '1465372102');
INSERT INTO `table_action_log` VALUES ('222', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-08 15:48登录了后台', '1', '1465372125');
INSERT INTO `table_action_log` VALUES ('223', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-08 16:50登录了后台', '1', '1465375859');
INSERT INTO `table_action_log` VALUES ('224', '1', '1', '3746118582', 'member', '1', 'admin在2016-06-11 14:33登录了后台', '1', '1465626803');
INSERT INTO `table_action_log` VALUES ('225', '1', '4', '0', 'member', '4', 'test3在2016-06-11 23:01登录了后台', '1', '1465657267');
INSERT INTO `table_action_log` VALUES ('226', '1', '4', '0', 'member', '4', 'test3在2016-06-12 22:06登录了后台', '1', '1465740377');
INSERT INTO `table_action_log` VALUES ('227', '1', '1', '0', 'member', '1', 'admin在2016-06-12 23:55登录了后台', '1', '1465746934');
INSERT INTO `table_action_log` VALUES ('228', '1', '4', '0', 'member', '4', 'test3在2016-06-12 23:56登录了后台', '1', '1465747018');
INSERT INTO `table_action_log` VALUES ('229', '10', '1', '0', 'Menu', '80', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1465749601');
INSERT INTO `table_action_log` VALUES ('230', '10', '1', '0', 'Menu', '80', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1465749625');
INSERT INTO `table_action_log` VALUES ('231', '10', '1', '0', 'Menu', '80', '操作url：/table/index.php?s=/Admin/Menu/edit.html', '1', '1465749648');
INSERT INTO `table_action_log` VALUES ('232', '11', '1', '0', 'category', '39', '操作url：/table/index.php?s=/Admin/Category/edit.html', '1', '1465749686');
INSERT INTO `table_action_log` VALUES ('233', '1', '4', '3072705926', 'member', '4', 'test3在2016-06-13 00:42登录了后台', '1', '1465749748');
INSERT INTO `table_action_log` VALUES ('234', '1', '1', '3072705926', 'member', '1', 'admin在2016-06-13 00:43登录了后台', '1', '1465749801');
INSERT INTO `table_action_log` VALUES ('235', '1', '1', '1227410655', 'member', '1', 'admin在2016-06-13 08:44登录了后台', '1', '1465778698');
INSERT INTO `table_action_log` VALUES ('236', '1', '4', '1971867519', 'member', '4', 'test3在2016-06-13 09:47登录了后台', '1', '1465782420');
INSERT INTO `table_action_log` VALUES ('237', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-13 09:47登录了后台', '1', '1465782469');
INSERT INTO `table_action_log` VALUES ('238', '1', '4', '1971867519', 'member', '4', 'test3在2016-06-13 09:50登录了后台', '1', '1465782655');
INSERT INTO `table_action_log` VALUES ('239', '1', '1', '1227410655', 'member', '1', 'admin在2016-06-13 10:08登录了后台', '1', '1465783723');
INSERT INTO `table_action_log` VALUES ('240', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-13 10:09登录了后台', '1', '1465783746');
INSERT INTO `table_action_log` VALUES ('241', '1', '1', '2005057491', 'member', '1', 'admin在2016-06-13 10:19登录了后台', '1', '1465784384');
INSERT INTO `table_action_log` VALUES ('242', '1', '1', '244923882', 'member', '1', 'admin在2016-06-13 10:29登录了后台', '1', '1465784968');
INSERT INTO `table_action_log` VALUES ('243', '1', '4', '244923882', 'member', '4', 'test3在2016-06-13 10:44登录了后台', '1', '1465785881');
INSERT INTO `table_action_log` VALUES ('244', '1', '4', '2796159072', 'member', '4', 'test3在2016-06-13 20:25登录了后台', '1', '1465820744');
INSERT INTO `table_action_log` VALUES ('245', '1', '1', '0', 'member', '1', 'admin在2016-06-19 20:51登录了后台', '1', '1466340709');
INSERT INTO `table_action_log` VALUES ('246', '1', '4', '0', 'member', '4', 'test3在2016-06-19 20:53登录了后台', '1', '1466340792');
INSERT INTO `table_action_log` VALUES ('247', '1', '6', '0', 'member', '6', 'superadmin在2016-06-19 22:42登录了后台', '1', '1466347354');
INSERT INTO `table_action_log` VALUES ('248', '1', '1', '0', 'member', '1', 'admin在2016-06-19 23:09登录了后台', '1', '1466348953');
INSERT INTO `table_action_log` VALUES ('249', '1', '6', '0', 'member', '6', 'superadmin在2016-06-19 23:12登录了后台', '1', '1466349134');
INSERT INTO `table_action_log` VALUES ('250', '1', '13', '0', 'member', '13', 'shop8在2016-06-19 23:23登录了后台', '1', '1466349828');
INSERT INTO `table_action_log` VALUES ('251', '1', '6', '0', 'member', '6', 'superadmin在2016-06-19 23:30登录了后台', '1', '1466350227');
INSERT INTO `table_action_log` VALUES ('252', '1', '4', '3072705548', 'member', '4', 'test3在2016-06-19 23:38登录了后台', '1', '1466350727');
INSERT INTO `table_action_log` VALUES ('253', '1', '13', '3072705548', 'member', '13', 'shop8在2016-06-19 23:40登录了后台', '1', '1466350829');
INSERT INTO `table_action_log` VALUES ('254', '1', '6', '3072705548', 'member', '6', 'superadmin在2016-06-19 23:41登录了后台', '1', '1466350913');
INSERT INTO `table_action_log` VALUES ('255', '1', '1', '1227410655', 'member', '1', 'admin在2016-06-19 23:54登录了后台', '1', '1466351670');
INSERT INTO `table_action_log` VALUES ('256', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-19 23:59登录了后台', '1', '1466351985');
INSERT INTO `table_action_log` VALUES ('257', '11', '1', '1227410655', 'category', '41', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352205');
INSERT INTO `table_action_log` VALUES ('258', '11', '1', '1227410655', 'category', '42', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352206');
INSERT INTO `table_action_log` VALUES ('259', '11', '1', '1227410655', 'category', '42', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352222');
INSERT INTO `table_action_log` VALUES ('260', '11', '1', '1227410655', 'category', '45', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352227');
INSERT INTO `table_action_log` VALUES ('261', '11', '1', '1227410655', 'category', '45', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352228');
INSERT INTO `table_action_log` VALUES ('262', '11', '1', '1227410655', 'category', '39', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352232');
INSERT INTO `table_action_log` VALUES ('263', '11', '1', '1227410655', 'category', '39', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352238');
INSERT INTO `table_action_log` VALUES ('264', '11', '1', '1227410655', 'category', '39', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352251');
INSERT INTO `table_action_log` VALUES ('265', '11', '1', '1227410655', 'category', '40', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352251');
INSERT INTO `table_action_log` VALUES ('266', '11', '1', '1227410655', 'category', '40', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352265');
INSERT INTO `table_action_log` VALUES ('267', '11', '1', '1227410655', 'category', '46', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1466352295');
INSERT INTO `table_action_log` VALUES ('268', '11', '1', '1227410655', 'category', '46', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352306');
INSERT INTO `table_action_log` VALUES ('269', '11', '1', '1227410655', 'category', '45', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352356');
INSERT INTO `table_action_log` VALUES ('270', '11', '1', '1227410655', 'category', '45', '操作url：/index.php?s=/Admin/Category/remove/id/45.html', '1', '1466352358');
INSERT INTO `table_action_log` VALUES ('271', '11', '1', '1227410655', 'category', '40', '操作url：/index.php?s=/Admin/Category/remove/id/40.html', '1', '1466352366');
INSERT INTO `table_action_log` VALUES ('272', '11', '1', '1227410655', 'category', '39', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352380');
INSERT INTO `table_action_log` VALUES ('273', '11', '1', '1227410655', 'category', '39', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352385');
INSERT INTO `table_action_log` VALUES ('274', '11', '1', '1227410655', 'category', '46', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352388');
INSERT INTO `table_action_log` VALUES ('275', '11', '1', '1227410655', 'category', '46', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352390');
INSERT INTO `table_action_log` VALUES ('276', '11', '1', '1227410655', 'category', '46', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352424');
INSERT INTO `table_action_log` VALUES ('277', '11', '1', '1227410655', 'category', '47', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1466352440');
INSERT INTO `table_action_log` VALUES ('278', '11', '1', '1227410655', 'category', '47', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352447');
INSERT INTO `table_action_log` VALUES ('279', '11', '1', '1227410655', 'category', '48', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1466352468');
INSERT INTO `table_action_log` VALUES ('280', '11', '1', '1227410655', 'category', '41', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466352474');
INSERT INTO `table_action_log` VALUES ('281', '1', '1', '1227410655', 'member', '1', 'admin在2016-06-20 02:38登录了后台', '1', '1466361537');
INSERT INTO `table_action_log` VALUES ('282', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-20 02:39登录了后台', '1', '1466361559');
INSERT INTO `table_action_log` VALUES ('283', '11', '1', '1227410655', 'category', '39', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466361612');
INSERT INTO `table_action_log` VALUES ('284', '11', '1', '1227410655', 'category', '46', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466361613');
INSERT INTO `table_action_log` VALUES ('285', '11', '1', '1227410655', 'category', '41', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466361622');
INSERT INTO `table_action_log` VALUES ('286', '11', '1', '1227410655', 'category', '47', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466361636');
INSERT INTO `table_action_log` VALUES ('287', '11', '1', '1227410655', 'category', '47', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466361639');
INSERT INTO `table_action_log` VALUES ('288', '11', '1', '1227410655', 'category', '47', '操作url：/index.php?s=/Admin/Category/remove/id/47.html', '1', '1466361640');
INSERT INTO `table_action_log` VALUES ('289', '11', '1', '1227410655', 'category', '41', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466361645');
INSERT INTO `table_action_log` VALUES ('290', '11', '1', '1227410655', 'category', '49', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1466361729');
INSERT INTO `table_action_log` VALUES ('291', '11', '1', '1227410655', 'category', '49', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466361735');
INSERT INTO `table_action_log` VALUES ('292', '1', '1', '1227410655', 'member', '1', 'admin在2016-06-20 03:46登录了后台', '1', '1466365570');
INSERT INTO `table_action_log` VALUES ('293', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-20 03:47登录了后台', '1', '1466365678');
INSERT INTO `table_action_log` VALUES ('294', '11', '1', '1227410655', 'category', '41', '操作url：/index.php?s=/Admin/Category/remove/id/41.html', '1', '1466366071');
INSERT INTO `table_action_log` VALUES ('295', '11', '1', '1227410655', 'category', '48', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1466366109');
INSERT INTO `table_action_log` VALUES ('296', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-20 03:58登录了后台', '1', '1466366331');
INSERT INTO `table_action_log` VALUES ('297', '1', '1', '1227410655', 'member', '1', 'admin在2016-06-20 04:05登录了后台', '1', '1466366740');
INSERT INTO `table_action_log` VALUES ('298', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-20 04:08登录了后台', '1', '1466366906');
INSERT INTO `table_action_log` VALUES ('299', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-20 04:10登录了后台', '1', '1466367015');
INSERT INTO `table_action_log` VALUES ('300', '1', '4', '1800231244', 'member', '4', 'test3在2016-06-20 04:14登录了后台', '1', '1466367292');
INSERT INTO `table_action_log` VALUES ('301', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-20 04:15登录了后台', '1', '1466367351');
INSERT INTO `table_action_log` VALUES ('302', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-20 09:50登录了后台', '1', '1466387419');
INSERT INTO `table_action_log` VALUES ('303', '1', '1', '1227410655', 'member', '1', 'admin在2016-06-20 09:50登录了后台', '1', '1466387443');
INSERT INTO `table_action_log` VALUES ('304', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-20 09:54登录了后台', '1', '1466387683');
INSERT INTO `table_action_log` VALUES ('305', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-20 09:55登录了后台', '1', '1466387718');
INSERT INTO `table_action_log` VALUES ('306', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-20 09:57登录了后台', '1', '1466387857');
INSERT INTO `table_action_log` VALUES ('307', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-20 10:06登录了后台', '1', '1466388368');
INSERT INTO `table_action_log` VALUES ('308', '1', '1', '2005057053', 'member', '1', 'admin在2016-06-20 10:47登录了后台', '1', '1466390875');
INSERT INTO `table_action_log` VALUES ('309', '1', '4', '2005057053', 'member', '4', 'test3在2016-06-20 10:50登录了后台', '1', '1466391006');
INSERT INTO `table_action_log` VALUES ('310', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-20 11:18登录了后台', '1', '1466392690');
INSERT INTO `table_action_log` VALUES ('311', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-20 11:19登录了后台', '1', '1466392767');
INSERT INTO `table_action_log` VALUES ('312', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-20 11:20登录了后台', '1', '1466392804');
INSERT INTO `table_action_log` VALUES ('313', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-20 11:22登录了后台', '1', '1466392941');
INSERT INTO `table_action_log` VALUES ('314', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-20 11:23登录了后台', '1', '1466392998');
INSERT INTO `table_action_log` VALUES ('315', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-20 11:23登录了后台', '1', '1466393020');
INSERT INTO `table_action_log` VALUES ('316', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-20 11:25登录了后台', '1', '1466393110');
INSERT INTO `table_action_log` VALUES ('317', '1', '1', '1227410655', 'member', '1', 'admin在2016-06-20 11:31登录了后台', '1', '1466393497');
INSERT INTO `table_action_log` VALUES ('318', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-20 11:32登录了后台', '1', '1466393574');
INSERT INTO `table_action_log` VALUES ('319', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-20 11:35登录了后台', '1', '1466393759');
INSERT INTO `table_action_log` VALUES ('320', '1', '4', '2005057053', 'member', '4', 'test3在2016-06-20 11:41登录了后台', '1', '1466394069');
INSERT INTO `table_action_log` VALUES ('321', '1', '4', '1971857638', 'member', '4', 'test3在2016-06-20 11:47登录了后台', '1', '1466394472');
INSERT INTO `table_action_log` VALUES ('322', '1', '6', '2005057053', 'member', '6', 'superadmin在2016-06-20 12:45登录了后台', '1', '1466397910');
INSERT INTO `table_action_log` VALUES ('323', '1', '1', '2005057053', 'member', '1', 'admin在2016-06-20 13:45登录了后台', '1', '1466401542');
INSERT INTO `table_action_log` VALUES ('324', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-20 13:47登录了后台', '1', '1466401623');
INSERT INTO `table_action_log` VALUES ('325', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-20 13:47登录了后台', '1', '1466401629');
INSERT INTO `table_action_log` VALUES ('326', '1', '4', '2005057053', 'member', '4', 'test3在2016-06-20 13:47登录了后台', '1', '1466401646');
INSERT INTO `table_action_log` VALUES ('327', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-20 13:47登录了后台', '1', '1466401651');
INSERT INTO `table_action_log` VALUES ('328', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-20 13:48登录了后台', '1', '1466401737');
INSERT INTO `table_action_log` VALUES ('329', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-20 13:49登录了后台', '1', '1466401749');
INSERT INTO `table_action_log` VALUES ('330', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-20 14:00登录了后台', '1', '1466402455');
INSERT INTO `table_action_log` VALUES ('331', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-20 14:03登录了后台', '1', '1466402580');
INSERT INTO `table_action_log` VALUES ('332', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-20 15:34登录了后台', '1', '1466408075');
INSERT INTO `table_action_log` VALUES ('333', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-20 16:21登录了后台', '1', '1466410885');
INSERT INTO `table_action_log` VALUES ('334', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-20 16:50登录了后台', '1', '1466412619');
INSERT INTO `table_action_log` VALUES ('335', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-20 17:05登录了后台', '1', '1466413527');
INSERT INTO `table_action_log` VALUES ('336', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-20 17:08登录了后台', '1', '1466413730');
INSERT INTO `table_action_log` VALUES ('337', '1', '4', '1971857606', 'member', '4', 'test3在2016-06-20 17:24登录了后台', '1', '1466414675');
INSERT INTO `table_action_log` VALUES ('338', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-20 17:25登录了后台', '1', '1466414702');
INSERT INTO `table_action_log` VALUES ('339', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-20 17:27登录了后台', '1', '1466414831');
INSERT INTO `table_action_log` VALUES ('340', '1', '4', '2005057053', 'member', '4', 'test3在2016-06-20 17:30登录了后台', '1', '1466415011');
INSERT INTO `table_action_log` VALUES ('341', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-20 17:30登录了后台', '1', '1466415033');
INSERT INTO `table_action_log` VALUES ('342', '1', '6', '2005056585', 'member', '6', 'superadmin在2016-06-21 10:44登录了后台', '1', '1466477092');
INSERT INTO `table_action_log` VALUES ('343', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-21 11:09登录了后台', '1', '1466478580');
INSERT INTO `table_action_log` VALUES ('344', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-21 11:10登录了后台', '1', '1466478621');
INSERT INTO `table_action_log` VALUES ('345', '1', '4', '1971857569', 'member', '4', 'test3在2016-06-21 11:25登录了后台', '1', '1466479559');
INSERT INTO `table_action_log` VALUES ('346', '1', '4', '2793999947', 'member', '4', 'test3在2016-06-22 07:56登录了后台', '1', '1466553381');
INSERT INTO `table_action_log` VALUES ('347', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-22 19:20登录了后台', '1', '1466594440');
INSERT INTO `table_action_log` VALUES ('348', '1', '4', '1971867518', 'member', '4', 'test3在2016-06-23 09:55登录了后台', '1', '1466646903');
INSERT INTO `table_action_log` VALUES ('349', '1', '4', '1971867518', 'member', '4', 'test3在2016-06-23 09:55登录了后台', '1', '1466646905');
INSERT INTO `table_action_log` VALUES ('350', '1', '6', '3682970284', 'member', '6', 'superadmin在2016-06-23 09:57登录了后台', '1', '1466647046');
INSERT INTO `table_action_log` VALUES ('351', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-23 09:57登录了后台', '1', '1466647071');
INSERT INTO `table_action_log` VALUES ('352', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-23 10:00登录了后台', '1', '1466647242');
INSERT INTO `table_action_log` VALUES ('353', '1', '13', '3682970284', 'member', '13', 'shop8在2016-06-23 10:02登录了后台', '1', '1466647324');
INSERT INTO `table_action_log` VALUES ('354', '1', '6', '3682970284', 'member', '6', 'superadmin在2016-06-23 10:02登录了后台', '1', '1466647356');
INSERT INTO `table_action_log` VALUES ('355', '1', '1', '2005057213', 'member', '1', 'admin在2016-06-23 10:17登录了后台', '1', '1466648276');
INSERT INTO `table_action_log` VALUES ('356', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-23 10:21登录了后台', '1', '1466648465');
INSERT INTO `table_action_log` VALUES ('357', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-23 10:22登录了后台', '1', '1466648566');
INSERT INTO `table_action_log` VALUES ('358', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-23 10:24登录了后台', '1', '1466648687');
INSERT INTO `table_action_log` VALUES ('359', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-23 10:38登录了后台', '1', '1466649514');
INSERT INTO `table_action_log` VALUES ('360', '1', '4', '2796159083', 'member', '4', 'test3在2016-06-24 04:33登录了后台', '1', '1466714021');
INSERT INTO `table_action_log` VALUES ('361', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-24 10:05登录了后台', '1', '1466733947');
INSERT INTO `table_action_log` VALUES ('362', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-24 10:09登录了后台', '1', '1466734157');
INSERT INTO `table_action_log` VALUES ('363', '1', '6', '3682970284', 'member', '6', 'superadmin在2016-06-24 10:09登录了后台', '1', '1466734167');
INSERT INTO `table_action_log` VALUES ('364', '1', '1', '1227410655', 'member', '1', 'admin在2016-06-24 10:13登录了后台', '1', '1466734413');
INSERT INTO `table_action_log` VALUES ('365', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-24 10:15登录了后台', '1', '1466734500');
INSERT INTO `table_action_log` VALUES ('366', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-24 10:15登录了后台', '1', '1466734536');
INSERT INTO `table_action_log` VALUES ('367', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-24 10:16登录了后台', '1', '1466734562');
INSERT INTO `table_action_log` VALUES ('368', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-24 10:16登录了后台', '1', '1466734578');
INSERT INTO `table_action_log` VALUES ('369', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-24 10:18登录了后台', '1', '1466734704');
INSERT INTO `table_action_log` VALUES ('370', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-24 10:18登录了后台', '1', '1466734707');
INSERT INTO `table_action_log` VALUES ('371', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-24 10:21登录了后台', '1', '1466734889');
INSERT INTO `table_action_log` VALUES ('372', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-24 10:22登录了后台', '1', '1466734935');
INSERT INTO `table_action_log` VALUES ('373', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-24 10:24登录了后台', '1', '1466735041');
INSERT INTO `table_action_log` VALUES ('374', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-24 10:24登录了后台', '1', '1466735048');
INSERT INTO `table_action_log` VALUES ('375', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-24 10:25登录了后台', '1', '1466735123');
INSERT INTO `table_action_log` VALUES ('376', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-24 10:25登录了后台', '1', '1466735152');
INSERT INTO `table_action_log` VALUES ('377', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-24 10:26登录了后台', '1', '1466735171');
INSERT INTO `table_action_log` VALUES ('378', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-24 10:30登录了后台', '1', '1466735417');
INSERT INTO `table_action_log` VALUES ('379', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-24 10:33登录了后台', '1', '1466735623');
INSERT INTO `table_action_log` VALUES ('380', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-24 10:36登录了后台', '1', '1466735768');
INSERT INTO `table_action_log` VALUES ('381', '1', '6', '3682970284', 'member', '6', 'superadmin在2016-06-24 10:39登录了后台', '1', '1466735978');
INSERT INTO `table_action_log` VALUES ('382', '1', '6', '1227410655', 'member', '6', 'superadmin在2016-06-24 10:39登录了后台', '1', '1466735982');
INSERT INTO `table_action_log` VALUES ('383', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-24 10:41登录了后台', '1', '1466736088');
INSERT INTO `table_action_log` VALUES ('384', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-24 11:31登录了后台', '1', '1466739109');
INSERT INTO `table_action_log` VALUES ('385', '1', '1', '1900690028', 'member', '1', 'admin在2016-06-25 00:10登录了后台', '1', '1466784624');
INSERT INTO `table_action_log` VALUES ('386', '1', '1', '3072705907', 'member', '1', 'admin在2016-06-26 23:19登录了后台', '1', '1466954362');
INSERT INTO `table_action_log` VALUES ('387', '1', '4', '3072705907', 'member', '4', 'test3在2016-06-27 00:02登录了后台', '1', '1466956957');
INSERT INTO `table_action_log` VALUES ('388', '10', '1', '3072705907', 'Menu', '43', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1466959213');
INSERT INTO `table_action_log` VALUES ('389', '10', '1', '3072705907', 'Menu', '16', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1466959239');
INSERT INTO `table_action_log` VALUES ('390', '1', '1', '2005056842', 'member', '1', 'admin在2016-06-27 11:50登录了后台', '1', '1466999452');
INSERT INTO `table_action_log` VALUES ('391', '1', '4', '1971857724', 'member', '4', 'test3在2016-06-27 13:51登录了后台', '1', '1467006690');
INSERT INTO `table_action_log` VALUES ('392', '1', '4', '2005056842', 'member', '4', 'test3在2016-06-28 11:36登录了后台', '1', '1467085002');
INSERT INTO `table_action_log` VALUES ('393', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-29 09:38登录了后台', '1', '1467164322');
INSERT INTO `table_action_log` VALUES ('394', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-29 09:44登录了后台', '1', '1467164693');
INSERT INTO `table_action_log` VALUES ('395', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-29 10:06登录了后台', '1', '1467166002');
INSERT INTO `table_action_log` VALUES ('396', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-29 10:53登录了后台', '1', '1467168800');
INSERT INTO `table_action_log` VALUES ('397', '1', '6', '1227410655', 'member', '6', 'superadmin在2016-06-29 11:22登录了后台', '1', '1467170544');
INSERT INTO `table_action_log` VALUES ('398', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-29 11:24登录了后台', '1', '1467170659');
INSERT INTO `table_action_log` VALUES ('399', '1', '6', '1227410655', 'member', '6', 'superadmin在2016-06-29 11:29登录了后台', '1', '1467170969');
INSERT INTO `table_action_log` VALUES ('400', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-29 11:29登录了后台', '1', '1467170999');
INSERT INTO `table_action_log` VALUES ('401', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-29 11:32登录了后台', '1', '1467171121');
INSERT INTO `table_action_log` VALUES ('402', '1', '1', '2005057529', 'member', '1', 'admin在2016-06-29 11:32登录了后台', '1', '1467171128');
INSERT INTO `table_action_log` VALUES ('403', '1', '4', '3072703816', 'member', '4', 'test3在2016-06-29 11:32登录了后台', '1', '1467171166');
INSERT INTO `table_action_log` VALUES ('404', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-29 11:33登录了后台', '1', '1467171204');
INSERT INTO `table_action_log` VALUES ('405', '1', '4', '2005057529', 'member', '4', 'test3在2016-06-29 11:33登录了后台', '1', '1467171238');
INSERT INTO `table_action_log` VALUES ('406', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-29 11:34登录了后台', '1', '1467171257');
INSERT INTO `table_action_log` VALUES ('407', '1', '1', '1227410655', 'member', '1', 'admin在2016-06-29 11:36登录了后台', '1', '1467171365');
INSERT INTO `table_action_log` VALUES ('408', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-29 11:36登录了后台', '1', '1467171377');
INSERT INTO `table_action_log` VALUES ('409', '1', '6', '1227410655', 'member', '6', 'superadmin在2016-06-29 11:36登录了后台', '1', '1467171395');
INSERT INTO `table_action_log` VALUES ('410', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-29 11:37登录了后台', '1', '1467171425');
INSERT INTO `table_action_log` VALUES ('411', '1', '1', '1227410655', 'member', '1', 'admin在2016-06-29 11:37登录了后台', '1', '1467171450');
INSERT INTO `table_action_log` VALUES ('412', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-29 11:44登录了后台', '1', '1467171842');
INSERT INTO `table_action_log` VALUES ('413', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-29 11:49登录了后台', '1', '1467172193');
INSERT INTO `table_action_log` VALUES ('414', '1', '4', '1971867547', 'member', '4', 'test3在2016-06-29 12:00登录了后台', '1', '1467172813');
INSERT INTO `table_action_log` VALUES ('415', '1', '1', '2005057529', 'member', '1', 'admin在2016-06-29 12:13登录了后台', '1', '1467173618');
INSERT INTO `table_action_log` VALUES ('416', '1', '4', '2005057529', 'member', '4', 'test3在2016-06-29 12:14登录了后台', '1', '1467173648');
INSERT INTO `table_action_log` VALUES ('417', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-29 12:48登录了后台', '1', '1467175726');
INSERT INTO `table_action_log` VALUES ('418', '1', '1', '236762753', 'member', '1', 'admin在2016-06-29 16:24登录了后台', '1', '1467188666');
INSERT INTO `table_action_log` VALUES ('419', '1', '1', '2005057529', 'member', '1', 'admin在2016-06-29 16:35登录了后台', '1', '1467189346');
INSERT INTO `table_action_log` VALUES ('420', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-29 19:15登录了后台', '1', '1467198947');
INSERT INTO `table_action_log` VALUES ('421', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-30 09:00登录了后台', '1', '1467248429');
INSERT INTO `table_action_log` VALUES ('422', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-30 09:36登录了后台', '1', '1467250565');
INSERT INTO `table_action_log` VALUES ('423', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-30 10:59登录了后台', '1', '1467255567');
INSERT INTO `table_action_log` VALUES ('424', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-30 10:59登录了后台', '1', '1467255589');
INSERT INTO `table_action_log` VALUES ('425', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-30 11:08登录了后台', '1', '1467256113');
INSERT INTO `table_action_log` VALUES ('426', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-30 11:29登录了后台', '1', '1467257378');
INSERT INTO `table_action_log` VALUES ('427', '1', '4', '1227410655', 'member', '4', 'test3在2016-06-30 11:41登录了后台', '1', '1467258069');
INSERT INTO `table_action_log` VALUES ('428', '1', '4', '3682970284', 'member', '4', 'test3在2016-06-30 17:18登录了后台', '1', '1467278338');
INSERT INTO `table_action_log` VALUES ('429', '1', '1', '3682970284', 'member', '1', 'admin在2016-06-30 17:21登录了后台', '1', '1467278500');
INSERT INTO `table_action_log` VALUES ('430', '1', '4', '2793999494', 'member', '4', 'test3在2016-06-30 20:36登录了后台', '1', '1467290181');
INSERT INTO `table_action_log` VALUES ('431', '1', '4', '2793999494', 'member', '4', 'test3在2016-06-30 22:09登录了后台', '1', '1467295753');
INSERT INTO `table_action_log` VALUES ('432', '1', '4', '2793999494', 'member', '4', 'test3在2016-07-01 04:44登录了后台', '1', '1467319478');
INSERT INTO `table_action_log` VALUES ('433', '1', '1', '3682970284', 'member', '1', 'admin在2016-07-01 09:46登录了后台', '1', '1467337586');
INSERT INTO `table_action_log` VALUES ('434', '1', '4', '3682970284', 'member', '4', 'test3在2016-07-01 09:55登录了后台', '1', '1467338121');
INSERT INTO `table_action_log` VALUES ('435', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-01 10:25登录了后台', '1', '1467339911');
INSERT INTO `table_action_log` VALUES ('436', '1', '4', '3682970284', 'member', '4', 'test3在2016-07-01 10:29登录了后台', '1', '1467340193');
INSERT INTO `table_action_log` VALUES ('437', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-01 10:30登录了后台', '1', '1467340218');
INSERT INTO `table_action_log` VALUES ('438', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-01 10:30登录了后台', '1', '1467340258');
INSERT INTO `table_action_log` VALUES ('439', '1', '4', '3682970284', 'member', '4', 'test3在2016-07-01 10:31登录了后台', '1', '1467340317');
INSERT INTO `table_action_log` VALUES ('440', '1', '1', '1227410655', 'member', '1', 'admin在2016-07-01 10:32登录了后台', '1', '1467340372');
INSERT INTO `table_action_log` VALUES ('441', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-01 10:34登录了后台', '1', '1467340440');
INSERT INTO `table_action_log` VALUES ('442', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-01 10:35登录了后台', '1', '1467340503');
INSERT INTO `table_action_log` VALUES ('443', '1', '4', '3682970284', 'member', '4', 'test3在2016-07-01 10:39登录了后台', '1', '1467340751');
INSERT INTO `table_action_log` VALUES ('444', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-01 10:39登录了后台', '1', '1467340763');
INSERT INTO `table_action_log` VALUES ('445', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-01 10:39登录了后台', '1', '1467340775');
INSERT INTO `table_action_log` VALUES ('446', '1', '6', '3682970284', 'member', '6', 'superadmin在2016-07-01 10:41登录了后台', '1', '1467340911');
INSERT INTO `table_action_log` VALUES ('447', '1', '4', '2793999494', 'member', '4', 'test3在2016-07-01 10:43登录了后台', '1', '1467341030');
INSERT INTO `table_action_log` VALUES ('448', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-01 11:09登录了后台', '1', '1467342584');
INSERT INTO `table_action_log` VALUES ('449', '1', '1', '1227410655', 'member', '1', 'admin在2016-07-01 11:13登录了后台', '1', '1467342781');
INSERT INTO `table_action_log` VALUES ('450', '1', '1', '3682970284', 'member', '1', 'admin在2016-07-01 11:16登录了后台', '1', '1467343018');
INSERT INTO `table_action_log` VALUES ('451', '1', '4', '3682970284', 'member', '4', 'test3在2016-07-01 11:17登录了后台', '1', '1467343038');
INSERT INTO `table_action_log` VALUES ('452', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-01 11:21登录了后台', '1', '1467343304');
INSERT INTO `table_action_log` VALUES ('453', '1', '1', '1227410655', 'member', '1', 'admin在2016-07-01 11:23登录了后台', '1', '1467343407');
INSERT INTO `table_action_log` VALUES ('454', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-01 11:24登录了后台', '1', '1467343486');
INSERT INTO `table_action_log` VALUES ('455', '1', '1', '1227410655', 'member', '1', 'admin在2016-07-01 11:27登录了后台', '1', '1467343663');
INSERT INTO `table_action_log` VALUES ('456', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-01 11:28登录了后台', '1', '1467343729');
INSERT INTO `table_action_log` VALUES ('457', '1', '4', '3682970284', 'member', '4', 'test3在2016-07-01 11:29登录了后台', '1', '1467343744');
INSERT INTO `table_action_log` VALUES ('458', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-01 11:29登录了后台', '1', '1467343779');
INSERT INTO `table_action_log` VALUES ('459', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-01 11:30登录了后台', '1', '1467343846');
INSERT INTO `table_action_log` VALUES ('460', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-01 11:32登录了后台', '1', '1467343942');
INSERT INTO `table_action_log` VALUES ('461', '1', '4', '3682970284', 'member', '4', 'test3在2016-07-01 11:46登录了后台', '1', '1467344786');
INSERT INTO `table_action_log` VALUES ('462', '1', '4', '1901919369', 'member', '4', 'test3在2016-07-01 15:19登录了后台', '1', '1467357544');
INSERT INTO `table_action_log` VALUES ('463', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-01 19:29登录了后台', '1', '1467372572');
INSERT INTO `table_action_log` VALUES ('464', '1', '4', '2793999494', 'member', '4', 'test3在2016-07-01 22:49登录了后台', '1', '1467384580');
INSERT INTO `table_action_log` VALUES ('465', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-03 02:34登录了后台', '1', '1467484446');
INSERT INTO `table_action_log` VALUES ('466', '1', '6', '1227410655', 'member', '6', 'superadmin在2016-07-03 02:41登录了后台', '1', '1467484882');
INSERT INTO `table_action_log` VALUES ('467', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-03 02:48登录了后台', '1', '1467485323');
INSERT INTO `table_action_log` VALUES ('468', '1', '6', '1227410655', 'member', '6', 'superadmin在2016-07-03 02:50登录了后台', '1', '1467485425');
INSERT INTO `table_action_log` VALUES ('469', '1', '13', '1227410655', 'member', '13', 'shop8在2016-07-03 02:51登录了后台', '1', '1467485505');
INSERT INTO `table_action_log` VALUES ('470', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-03 02:53登录了后台', '1', '1467485588');
INSERT INTO `table_action_log` VALUES ('471', '1', '1', '1227410655', 'member', '1', 'admin在2016-07-03 02:58登录了后台', '1', '1467485921');
INSERT INTO `table_action_log` VALUES ('472', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-03 02:59登录了后台', '1', '1467485960');
INSERT INTO `table_action_log` VALUES ('473', '1', '6', '1227410655', 'member', '6', 'superadmin在2016-07-03 02:59登录了后台', '1', '1467485981');
INSERT INTO `table_action_log` VALUES ('474', '1', '13', '1227410655', 'member', '13', 'shop8在2016-07-03 03:00登录了后台', '1', '1467486008');
INSERT INTO `table_action_log` VALUES ('475', '11', '13', '1227410655', 'category', '50', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1467486070');
INSERT INTO `table_action_log` VALUES ('476', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-03 03:02登录了后台', '1', '1467486168');
INSERT INTO `table_action_log` VALUES ('477', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-03 03:10登录了后台', '1', '1467486636');
INSERT INTO `table_action_log` VALUES ('478', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-03 03:15登录了后台', '1', '1467486939');
INSERT INTO `table_action_log` VALUES ('479', '1', '1', '1227410655', 'member', '1', 'admin在2016-07-03 03:17登录了后台', '1', '1467487050');
INSERT INTO `table_action_log` VALUES ('480', '1', '6', '1227410655', 'member', '6', 'superadmin在2016-07-03 05:12登录了后台', '1', '1467493925');
INSERT INTO `table_action_log` VALUES ('481', '1', '13', '1227410655', 'member', '13', 'shop8在2016-07-03 05:14登录了后台', '1', '1467494074');
INSERT INTO `table_action_log` VALUES ('482', '11', '13', '1227410655', 'category', '50', '操作url：/index.php?s=/Admin/Category/remove/id/50.html', '1', '1467494214');
INSERT INTO `table_action_log` VALUES ('483', '11', '13', '1227410655', 'category', '51', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1467494253');
INSERT INTO `table_action_log` VALUES ('484', '11', '13', '1227410655', 'category', '52', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1467494272');
INSERT INTO `table_action_log` VALUES ('485', '11', '13', '1227410655', 'category', '52', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1467494291');
INSERT INTO `table_action_log` VALUES ('486', '11', '13', '1227410655', 'category', '53', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1467494341');
INSERT INTO `table_action_log` VALUES ('487', '11', '13', '1227410655', 'category', '54', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1467494369');
INSERT INTO `table_action_log` VALUES ('488', '11', '13', '1227410655', 'category', '55', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1467494386');
INSERT INTO `table_action_log` VALUES ('489', '11', '13', '1227410655', 'category', '56', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1467494418');
INSERT INTO `table_action_log` VALUES ('490', '11', '13', '1227410655', 'category', '53', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1467494430');
INSERT INTO `table_action_log` VALUES ('491', '11', '13', '1227410655', 'category', '54', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1467494431');
INSERT INTO `table_action_log` VALUES ('492', '11', '13', '1227410655', 'category', '55', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1467494433');
INSERT INTO `table_action_log` VALUES ('493', '11', '13', '1227410655', 'category', '56', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1467494434');
INSERT INTO `table_action_log` VALUES ('494', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-03 05:23登录了后台', '1', '1467494621');
INSERT INTO `table_action_log` VALUES ('495', '1', '4', '1673774433', 'member', '4', 'test3在2016-07-03 18:22登录了后台', '1', '1467541328');
INSERT INTO `table_action_log` VALUES ('496', '1', '4', '1673774433', 'member', '4', 'test3在2016-07-04 07:24登录了后台', '1', '1467588254');
INSERT INTO `table_action_log` VALUES ('497', '1', '4', '1800232575', 'member', '4', 'test3在2016-07-04 08:22登录了后台', '1', '1467591764');
INSERT INTO `table_action_log` VALUES ('498', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-04 08:55登录了后台', '1', '1467593741');
INSERT INTO `table_action_log` VALUES ('499', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-04 09:11登录了后台', '1', '1467594707');
INSERT INTO `table_action_log` VALUES ('500', '1', '4', '1800232575', 'member', '4', 'test3在2016-07-04 09:12登录了后台', '1', '1467594742');
INSERT INTO `table_action_log` VALUES ('501', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-04 09:20登录了后台', '1', '1467595207');
INSERT INTO `table_action_log` VALUES ('502', '1', '4', '1227410655', 'member', '4', 'test3在2016-07-04 09:21登录了后台', '1', '1467595316');

-- ----------------------------
-- Table structure for table_addons
-- ----------------------------
DROP TABLE IF EXISTS `table_addons`;
CREATE TABLE `table_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of table_addons
-- ----------------------------
INSERT INTO `table_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `table_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `table_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"8090\\u5de5\\u4f5c\\u5ba4\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `table_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `table_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `table_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `table_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');
INSERT INTO `table_addons` VALUES ('17', 'UploadImages', '多图上传', '多图上传', '1', 'null', '职业养猪户', '1.0', '1462631411', '0');

-- ----------------------------
-- Table structure for table_attachment
-- ----------------------------
DROP TABLE IF EXISTS `table_attachment`;
CREATE TABLE `table_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of table_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for table_attribute
-- ----------------------------
DROP TABLE IF EXISTS `table_attribute`;
CREATE TABLE `table_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of table_attribute
-- ----------------------------
INSERT INTO `table_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `table_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `table_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `table_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `table_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `table_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');

-- ----------------------------
-- Table structure for table_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `table_auth_extend`;
CREATE TABLE `table_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of table_auth_extend
-- ----------------------------
INSERT INTO `table_auth_extend` VALUES ('1', '0', '0');
INSERT INTO `table_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `table_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `table_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `table_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `table_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `table_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `table_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `table_auth_extend` VALUES ('1', '37', '1');

-- ----------------------------
-- Table structure for table_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `table_auth_group`;
CREATE TABLE `table_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_auth_group
-- ----------------------------
INSERT INTO `table_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,3,4,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,100,102,103,107,108,109,110,195,205,206,207,208,209,210,211,212,213,214,215,216,220,221,222,225,226,227');
INSERT INTO `table_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,3,5,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,67,68,69,70,71,72,73,74,88,94,95,100,102,103,107,108,109,110,207,213,214,215,216,217,220,221,222,224');

-- ----------------------------
-- Table structure for table_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `table_auth_group_access`;
CREATE TABLE `table_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_auth_group_access
-- ----------------------------
INSERT INTO `table_auth_group_access` VALUES ('2', '1');
INSERT INTO `table_auth_group_access` VALUES ('2', '2');
INSERT INTO `table_auth_group_access` VALUES ('3', '1');

-- ----------------------------
-- Table structure for table_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `table_auth_rule`;
CREATE TABLE `table_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_auth_rule
-- ----------------------------
INSERT INTO `table_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `table_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `table_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `table_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `table_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `table_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `table_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `table_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `table_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `table_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `table_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `table_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `table_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `table_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `table_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `table_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `table_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `table_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `table_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `table_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `table_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `table_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `table_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `table_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `table_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `table_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `table_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `table_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `table_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `table_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `table_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `table_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `table_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `table_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `table_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `table_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `table_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `table_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `table_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `table_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `table_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `table_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `table_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `table_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `table_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `table_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `table_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `table_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `table_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `table_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `table_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `table_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `table_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `table_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `table_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `table_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `table_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `table_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `table_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `table_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `table_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `table_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `table_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `table_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `table_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `table_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `table_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `table_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `table_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `table_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `table_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `table_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `table_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `table_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `table_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `table_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `table_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `table_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `table_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `table_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `table_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `table_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `table_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `table_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `table_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `table_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `table_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `table_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `table_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `table_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `table_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `table_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `table_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `table_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `table_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `table_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `table_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `table_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `table_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `table_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `table_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `table_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `table_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `table_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `table_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `table_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `table_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `table_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `table_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `table_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `table_auth_rule` VALUES ('227', 'admin', '2', 'Admin/goods/index', 'test', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('218', 'admin', '2', 'Admin/goods/index?status=1', '菜品', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('220', 'admin', '2', 'Admin/order/index', '堂食订单', '1', '');
INSERT INTO `table_auth_rule` VALUES ('221', 'admin', '2', 'Admin/takeaway/index', '外卖单', '1', '');
INSERT INTO `table_auth_rule` VALUES ('222', 'admin', '2', 'Admin/count/index', '统计', '1', '');
INSERT INTO `table_auth_rule` VALUES ('226', 'admin', '2', 'Admin/goods/index/?status=1', '菜品', '-1', '');
INSERT INTO `table_auth_rule` VALUES ('225', 'admin', '1', 'Admin/#', '菜品分析', '1', '');
INSERT INTO `table_auth_rule` VALUES ('228', 'admin', '1', 'Admin/goods/detail/', '菜品详细', '1', '');
INSERT INTO `table_auth_rule` VALUES ('229', 'admin', '1', 'Admin/goods/index/', '已上架菜品', '1', '');
INSERT INTO `table_auth_rule` VALUES ('230', 'admin', '1', 'Admin/Goods/add/', '新增菜品', '1', '');
INSERT INTO `table_auth_rule` VALUES ('231', 'admin', '1', 'Admin/goods/index?status=0', '已下架菜品', '1', '');
INSERT INTO `table_auth_rule` VALUES ('232', 'admin', '1', 'Admin/goods/category/', '已分类菜品', '1', '');
INSERT INTO `table_auth_rule` VALUES ('233', 'admin', '1', 'Admin/goods/category?status=0', '未分类菜品', '1', '');
INSERT INTO `table_auth_rule` VALUES ('234', 'admin', '2', 'Admin/goods/index/', '菜品', '1', '');

-- ----------------------------
-- Table structure for table_cart
-- ----------------------------
DROP TABLE IF EXISTS `table_cart`;
CREATE TABLE `table_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL,
  `cart_type` int(11) DEFAULT '1' COMMENT '1 堂食 2 外卖',
  `uid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '1 未下单 2 已下单',
  `burdening` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `goods_prices` decimal(65,1) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `order_id` bigint(50) DEFAULT '0',
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_cart
-- ----------------------------
INSERT INTO `table_cart` VALUES ('37', '巨无霸', '2', '5', '16', '2', '无', '', '1', '89.0', '1', '22', null);
INSERT INTO `table_cart` VALUES ('38', '全家桶', '2', '5', '17', '2', '番茄酱,可乐,果汁', '', '1', '130.0', '1', '22', null);
INSERT INTO `table_cart` VALUES ('39', '千层汉堡包', '2', '5', '18', '2', '无', '', '1', '100.0', '1', '22', null);
INSERT INTO `table_cart` VALUES ('40', '千层汉堡包', '2', '5', '18', '2', '无', '', '5', '100.0', '1', '23', null);
INSERT INTO `table_cart` VALUES ('84', '全家桶', '2', '4', '17', '2', '番茄酱,可乐,果汁', '', '6', '130.0', '1', '35', null);
INSERT INTO `table_cart` VALUES ('91', '千层汉堡包', '2', '4', '18', '2', '无', '', '1', '100.0', '1', '36', null);
INSERT INTO `table_cart` VALUES ('92', '全家桶', '2', '4', '17', '2', '番茄酱', '', '1', '130.0', '1', '37', '备注');
INSERT INTO `table_cart` VALUES ('95', '巨无霸', '2', '4', '16', '2', '无', '', '1', '89.0', '1', '38', null);
INSERT INTO `table_cart` VALUES ('96', '全家桶', '2', '4', '17', '2', '', '', '1', '130.0', '1', '40', null);
INSERT INTO `table_cart` VALUES ('100', '巨无霸', '2', '4', '16', '2', '', null, '1', '89.0', '1', '41', '');
INSERT INTO `table_cart` VALUES ('103', 'Sashimi S', '2', '4', '31', '2', '', null, '1', '23.0', '1', '42', '');
INSERT INTO `table_cart` VALUES ('105', 'Sashimi S', '1', '4', '31', '2', '', null, '1', '23.0', '1', '20', '');
INSERT INTO `table_cart` VALUES ('106', '', '1', '4', '28', '2', '', null, '3', '0.0', '1', '21', '');
INSERT INTO `table_cart` VALUES ('108', 'Sashimi S', '1', '4', '31', '2', '', null, '2', '23.0', '1', '21', '');
INSERT INTO `table_cart` VALUES ('109', 'Spicy Seafood Salad', '1', '4', '21', '2', '', null, '5', '11.0', '1', '21', '');
INSERT INTO `table_cart` VALUES ('110', 'Sashimi S', '2', '4', '31', '2', '', null, '1', '23.0', '1', '43', '仿佛次');
INSERT INTO `table_cart` VALUES ('111', 'Sashimi S', '1', '4', '31', '2', '', null, '1', '23.0', '1', '22', '');
INSERT INTO `table_cart` VALUES ('112', 'Green Monster Roll', '1', '4', '19', '2', '', null, '1', '11.0', '1', '22', '');
INSERT INTO `table_cart` VALUES ('113', 'OMG Roll', '1', '4', '27', '2', '', null, '2', '13.0', '1', '22', '');
INSERT INTO `table_cart` VALUES ('114', '', '1', '4', '26', '2', '', null, '1', '0.0', '1', '23', '');
INSERT INTO `table_cart` VALUES ('115', 'Sashimi S', '1', '4', '31', '2', '', null, '1', '23.0', '1', '24', '怕哈哈哈哈差！！！');
INSERT INTO `table_cart` VALUES ('117', 'Sashimi S', '2', '4', '31', '2', '', null, '1', '23.0', '1', '44', '');
INSERT INTO `table_cart` VALUES ('122', '', '1', '4', '26', '2', '', null, '3', '0.0', '1', '25', '');
INSERT INTO `table_cart` VALUES ('123', 'Sashimi S', '1', '4', '31', '2', '', null, '1', '23.0', '1', '25', '啦啦啦啦啦啦啦');
INSERT INTO `table_cart` VALUES ('125', 'Green Monster Roll', '2', '4', '19', '2', '', null, '1', '11.0', '1', '45', '绿地哦不咯');
INSERT INTO `table_cart` VALUES ('126', '', '1', '4', '28', '2', '', null, '1', '0.0', '1', '26', '巩固给我');
INSERT INTO `table_cart` VALUES ('127', 'Sashimi S', '1', '4', '31', '2', '', null, '4', '23.0', '1', '26', '');
INSERT INTO `table_cart` VALUES ('130', 'Sushi A Combination ', '2', '4', '24', '2', '', null, '2', '19.0', '1', '46', '');
INSERT INTO `table_cart` VALUES ('133', 'OMG Roll', '1', '4', '27', '2', '', null, '2', '13.0', '1', '27', '');
INSERT INTO `table_cart` VALUES ('134', 'Green Monster Roll', '1', '4', '19', '2', '', null, '3', '11.0', '1', '27', '');
INSERT INTO `table_cart` VALUES ('135', 'Sushi A Combination ', '1', '4', '24', '2', '菜', null, '1', '19.0', '1', '27', '海哈额口口模型婆惹我生气');
INSERT INTO `table_cart` VALUES ('136', 'Green Monster Roll', '2', '4', '19', '2', '', null, '1', '11.0', '1', '47', '');
INSERT INTO `table_cart` VALUES ('137', 'Spicy Seafood Salad', '2', '4', '21', '2', '', null, '1', '11.0', '1', '48', '');
INSERT INTO `table_cart` VALUES ('138', 'Fox Bowl ', '2', '4', '22', '2', '', null, '1', '13.0', '1', '48', '');
INSERT INTO `table_cart` VALUES ('140', 'Spicy Seafood Salad', '2', '4', '21', '2', '', null, '1', '11.0', '1', '49', '');
INSERT INTO `table_cart` VALUES ('141', 'Green Monster Roll', '2', '4', '19', '2', '', null, '1', '11.0', '1', '50', '');
INSERT INTO `table_cart` VALUES ('142', 'Green Monster Roll', '2', '4', '19', '2', '', null, '1', '11.0', '1', '51', '');
INSERT INTO `table_cart` VALUES ('147', 'Fox Bowl ', '1', '4', '22', '2', '', null, '1', '13.0', '1', '28', '');
INSERT INTO `table_cart` VALUES ('148', 'Fox Bowl ', '1', '4', '22', '2', '', null, '1', '13.0', '1', '29', '');
INSERT INTO `table_cart` VALUES ('149', 'Tonkatsu Steak Bowl', '1', '4', '25', '2', '', null, '1', '12.0', '1', '29', '');
INSERT INTO `table_cart` VALUES ('154', 'Green Monster Roll', '2', '4', '19', '2', '', null, '1', '11.0', '1', '52', '');
INSERT INTO `table_cart` VALUES ('155', 'Spicy Seafood Salad', '2', '4', '21', '2', '', null, '1', '11.0', '1', '53', '');
INSERT INTO `table_cart` VALUES ('156', 'Spicy Seafood Salad', '1', '4', '21', '1', '', null, '1', '11.0', '1', '0', '');

-- ----------------------------
-- Table structure for table_category
-- ----------------------------
DROP TABLE IF EXISTS `table_category`;
CREATE TABLE `table_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) DEFAULT NULL COMMENT '标志',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `pid` int(10) unsigned DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) DEFAULT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) DEFAULT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) DEFAULT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) DEFAULT NULL COMMENT '编辑页模板',
  `model` varchar(100) DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned DEFAULT '0' COMMENT '分类图标',
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of table_category
-- ----------------------------
INSERT INTO `table_category` VALUES ('39', 'Sushi', '热门招牌菜', '0', '2', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '1');
INSERT INTO `table_category` VALUES ('48', 'Appetizer', 'Udon', '0', '0', '10', '', '', '', '', '', '', '', '', '', '0', '0', '1', '1', '0', '', null, '0', '0', '0', '0', '1');
INSERT INTO `table_category` VALUES ('51', 'Appetizers ', '', '0', '0', '10', '', '', '', '', '', '', '', '', '', '0', '0', '1', '1', '0', '', null, '0', '0', '0', '0', '8');
INSERT INTO `table_category` VALUES ('42', 'Salads ', '甜品', '0', '1', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '1');
INSERT INTO `table_category` VALUES ('52', 'Soups', '', '0', '1', '10', '', '', '', '', '', '', '', '', '', '0', '0', '1', '1', '0', '', null, '0', '0', '0', '0', '8');
INSERT INTO `table_category` VALUES ('49', 'Afters', '', '0', '5', '10', '', '', '', '', '', '', '', '', '', '0', '0', '1', '1', '0', '', null, '0', '0', '0', '0', '1');
INSERT INTO `table_category` VALUES ('46', 'Entrees', 'Sushi Rolls-Deep Fried Rolls', '0', '3', '10', '', '', '', '', '', '', '', '', '', '0', '0', '1', '1', '0', '', null, '0', '0', '0', '0', '1');
INSERT INTO `table_category` VALUES ('53', 'Entree', '', '0', '2', '10', '', '', '', '', '', '', '', '', '', '0', '0', '1', '1', '0', '', null, '0', '0', '0', '0', '8');
INSERT INTO `table_category` VALUES ('54', 'Seafood', '', '0', '3', '10', '', '', '', '', '', '', '', '', '', '0', '0', '1', '1', '0', '', null, '0', '0', '0', '0', '8');
INSERT INTO `table_category` VALUES ('55', 'Breads', '', '0', '4', '10', '', '', '', '', '', '', '', '', '', '0', '0', '1', '1', '0', '', null, '0', '0', '0', '0', '8');
INSERT INTO `table_category` VALUES ('56', 'Desserts', '', '0', '5', '10', '', '', '', '', '', '', '', '', '', '0', '0', '1', '1', '0', '', null, '0', '0', '0', '0', '8');

-- ----------------------------
-- Table structure for table_channel
-- ----------------------------
DROP TABLE IF EXISTS `table_channel`;
CREATE TABLE `table_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_channel
-- ----------------------------
INSERT INTO `table_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `table_channel` VALUES ('2', '0', '博客', 'Article/index?category=blog', '2', '1379475131', '1379483713', '1', '0');
INSERT INTO `table_channel` VALUES ('3', '0', '官网', 'http://www.onethink.cn', '3', '1379475154', '1387163458', '1', '0');

-- ----------------------------
-- Table structure for table_config
-- ----------------------------
DROP TABLE IF EXISTS `table_config`;
CREATE TABLE `table_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_config
-- ----------------------------
INSERT INTO `table_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'OneThink内容管理框架', '0');
INSERT INTO `table_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'OneThink内容管理框架', '1');
INSERT INTO `table_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'ThinkPHP,OneThink', '8');
INSERT INTO `table_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `table_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `table_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `table_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3');
INSERT INTO `table_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `table_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `table_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `table_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `table_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `table_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `table_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `table_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `table_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `table_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `table_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `table_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `table_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `table_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `table_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `table_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `table_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `table_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `table_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `table_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');

-- ----------------------------
-- Table structure for table_document
-- ----------------------------
DROP TABLE IF EXISTS `table_document`;
CREATE TABLE `table_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of table_document
-- ----------------------------
INSERT INTO `table_document` VALUES ('1', '1', '', 'OneThink1.0正式版发布', '2', '大家期待的OneThink正式版发布', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '8', '0', '0', '0', '1387260660', '1387263112', '1');

-- ----------------------------
-- Table structure for table_document_article
-- ----------------------------
DROP TABLE IF EXISTS `table_document_article`;
CREATE TABLE `table_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of table_document_article
-- ----------------------------
INSERT INTO `table_document_article` VALUES ('1', '0', '<h1>\r\n	OneThink1.0正式版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013</strong> \r\n</p>', '', '0');

-- ----------------------------
-- Table structure for table_document_download
-- ----------------------------
DROP TABLE IF EXISTS `table_document_download`;
CREATE TABLE `table_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of table_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for table_feedback
-- ----------------------------
DROP TABLE IF EXISTS `table_feedback`;
CREATE TABLE `table_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `create_time` bigint(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of table_feedback
-- ----------------------------
INSERT INTO `table_feedback` VALUES ('1', '4', 'test3', '13018473858', '1463497320', '测试');
INSERT INTO `table_feedback` VALUES ('7', '4', 'test3', '13018473858', '1465149261', 'dsdsa');
INSERT INTO `table_feedback` VALUES ('8', '4', 'test3', '13018473858', '1465149309', 'dsadas');

-- ----------------------------
-- Table structure for table_file
-- ----------------------------
DROP TABLE IF EXISTS `table_file`;
CREATE TABLE `table_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of table_file
-- ----------------------------

-- ----------------------------
-- Table structure for table_goods
-- ----------------------------
DROP TABLE IF EXISTS `table_goods`;
CREATE TABLE `table_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `category` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `prices` decimal(65,1) DEFAULT NULL,
  `burdening` text CHARACTER SET utf8,
  `burdening_default` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `burdening_max` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT '0',
  `discount` int(11) DEFAULT NULL,
  `pic` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `tag` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `create_time` bigint(50) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `feed_type` int(10) DEFAULT '1' COMMENT '1 堂食 2 外卖 3 两者',
  `is_category` int(255) DEFAULT '1',
  `o_prices` decimal(65,1) DEFAULT NULL,
  `detail_pic` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of table_goods
-- ----------------------------
INSERT INTO `table_goods` VALUES ('15', '汉堡包11', '40', '汉堡包', '50.0', '番茄酱', null, '1', '10', '0', '3', '0', '汉堡', '2', '1462633849', '1', '2', '1', '110.0', null);
INSERT INTO `table_goods` VALUES ('19', 'Green Monster Roll', '39', 'Pickled radish, kampyo, asparagus, avocado, spring mix, and mango rolled with rice paper and topped with sriracha and sambais sauce.', '11.0', '', null, '0', '0', '0', '31', '0', ',Sushi', '1', '1466361846', '1', '3', '1', '11.0', '37');
INSERT INTO `table_goods` VALUES ('20', 'Vegetable Roll', '39', 'Cucumber, avocado, pickled radish, kampyo, and asparagus served with ginger dressing. ', '8.0', '', null, '0', '0', '0', '39', '0', '', '1', '1466361977', '1', '3', '1', '8.0', '38');
INSERT INTO `table_goods` VALUES ('21', 'Spicy Seafood Salad', '42', 'Assorted sashimi over a bed of romaine lettuce, carrot, cucumber, radish, jalapeno, feta cheese, tomato, avocado, and Geisha house dressing with traditional Korean hot sauce.', '11.0', '', null, '0', '0', '0', '15', '0', ',salad', '1', '1466365672', '1', '3', '1', '11.0', '44');
INSERT INTO `table_goods` VALUES ('22', 'Fox Bowl ', '46', 'Shrimp tempura, imitation crab, avocado, crunch, scallions, masago, and Geisha trio sauce.', '13.0', '', null, '0', '0', '0', '18', '0', '', '1', '1466365798', '1', '3', '1', '13.0', '40');
INSERT INTO `table_goods` VALUES ('23', 'Geisha Fire Bowl ', '46', 'Seared Spicy tuna or spicy salmon, imitation crab, crunch scallions, and Geisha trio sauce. ', '15.0', '', null, '0', '0', '0', '41', '0', '', '1', '1466365879', '1', '3', '1', '15.0', '42');
INSERT INTO `table_goods` VALUES ('24', 'Sushi A Combination ', '39', 'Eight pieces of assorted nigiri and tuna Roll', '19.0', '肉,米饭,菜', null, '1', '0', '0', '19', '0', '', '1', '1466365931', '1', '3', '1', '19.0', '36');
INSERT INTO `table_goods` VALUES ('25', 'Tonkatsu Steak Bowl', '46', 'Deep fried breaded chicken or pork tenderloin served wtih sweet tonkatsu sauce. ', '12.0', '', null, '0', '0', '0', '20', '0', '', '1', '1466366044', '1', '3', '1', '12.0', '43');
INSERT INTO `table_goods` VALUES ('27', 'OMG Roll', '39', 'California roll topped wtih smoked eel, avocado, sesame seeds, spicy sauce, and eel sauce. ', '13.0', '', null, '0', '0', '0', '22', '0', '', '1', '1466366220', '1', '3', '1', '13.0', '35');
INSERT INTO `table_goods` VALUES ('29', 'Fried Ice Cream ', '49', 'Featuring a twist on an old geisha favorite is our fried banana roll consisting of lightly breaded vanilla ice cream with a touch of cereal and drizzled chocolate syrup to top it off. ', '7.0', '', null, '0', '0', '0', '24', '0', '', '1', '1466366276', '1', '3', '1', '7.0', '33');
INSERT INTO `table_goods` VALUES ('33', 'Vegetable Pakoras ', '51', 'Fresh vegetable sliced, dipped in garbanzo bean batter, and deep fried (6 pieces)', '4.0', '', null, '0', '0', '0', '50', '0', '', '8', '1467494598', '1', '3', '1', '4.0', '50');

-- ----------------------------
-- Table structure for table_goods_count
-- ----------------------------
DROP TABLE IF EXISTS `table_goods_count`;
CREATE TABLE `table_goods_count` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(50) DEFAULT NULL,
  `goods_count` int(11) DEFAULT NULL,
  `allcount` int(11) DEFAULT NULL,
  `time` bigint(30) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of table_goods_count
-- ----------------------------
INSERT INTO `table_goods_count` VALUES ('1', '巨无霸', '11', '20', '1465833209', '1');

-- ----------------------------
-- Table structure for table_history
-- ----------------------------
DROP TABLE IF EXISTS `table_history`;
CREATE TABLE `table_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `goods_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of table_history
-- ----------------------------
INSERT INTO `table_history` VALUES ('2', '4', '啃鸡啦', '1466346453');

-- ----------------------------
-- Table structure for table_hooks
-- ----------------------------
DROP TABLE IF EXISTS `table_hooks`;
CREATE TABLE `table_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_hooks
-- ----------------------------
INSERT INTO `table_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `table_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop');
INSERT INTO `table_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment');
INSERT INTO `table_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment');
INSERT INTO `table_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `table_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment');
INSERT INTO `table_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor');
INSERT INTO `table_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `table_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam');
INSERT INTO `table_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor');
INSERT INTO `table_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');
INSERT INTO `table_hooks` VALUES ('17', 'UploadImages', 'UploadImages', '1', '1462631408', 'UploadImages');

-- ----------------------------
-- Table structure for table_like
-- ----------------------------
DROP TABLE IF EXISTS `table_like`;
CREATE TABLE `table_like` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of table_like
-- ----------------------------
INSERT INTO `table_like` VALUES ('13', '1', '4');

-- ----------------------------
-- Table structure for table_member
-- ----------------------------
DROP TABLE IF EXISTS `table_member`;
CREATE TABLE `table_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '会员状态',
  `shop_id` int(11) DEFAULT '0',
  `head_img` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of table_member
-- ----------------------------
INSERT INTO `table_member` VALUES ('1', 'admin', '0', '0000-00-00', '', '190', '104', '0', '1461430311', '1227410655', '1467487050', '1', '1', null);
INSERT INTO `table_member` VALUES ('2', 'test', '0', '0000-00-00', '', '30', '10', '0', '0', '2005057059', '1464665184', '1', '1', null);
INSERT INTO `table_member` VALUES ('3', 'shop1', '0', '0000-00-00', '', '10', '4', '0', '0', '0', '1462024757', '1', '1', null);
INSERT INTO `table_member` VALUES ('4', 'test3', '0', '0000-00-00', '', '70', '218', '3232235881', '1464108603', '1227410655', '1467595316', '1', '0', null);
INSERT INTO `table_member` VALUES ('5', 'allen', '0', '0000-00-00', '', '10', '1', '0', '1464106792', '0', '1464106792', '1', '0', null);
INSERT INTO `table_member` VALUES ('6', 'superadmin', '0', '0000-00-00', '', '90', '26', '0', '0', '1227410655', '1467493925', '1', '-1', null);
INSERT INTO `table_member` VALUES ('10', 'mike', '0', '0000-00-00', '', '10', '1', '0', '1465044575', '0', '1465044575', '1', '0', null);
INSERT INTO `table_member` VALUES ('13', 'shop8', '0', '0000-00-00', '', '30', '6', '0', '0', '1227410655', '1467494074', '1', '8', null);

-- ----------------------------
-- Table structure for table_menu
-- ----------------------------
DROP TABLE IF EXISTS `table_menu`;
CREATE TABLE `table_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_menu
-- ----------------------------
INSERT INTO `table_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0');
INSERT INTO `table_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0');
INSERT INTO `table_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('16', '用户', '0', '8', 'User/index', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0');
INSERT INTO `table_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO `table_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0');
INSERT INTO `table_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `table_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `table_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `table_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `table_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `table_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0');
INSERT INTO `table_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO `table_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO `table_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `table_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO `table_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `table_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `table_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `table_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `table_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `table_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `table_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `table_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO `table_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `table_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `table_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `table_menu` VALUES ('43', '扩展', '0', '11', 'Addons/index', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0');
INSERT INTO `table_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `table_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO `table_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO `table_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO `table_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO `table_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO `table_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO `table_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO `table_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO `table_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO `table_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `table_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0');
INSERT INTO `table_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '1', '', '系统设置', '0');
INSERT INTO `table_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0');
INSERT INTO `table_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('68', '系统', '0', '9', 'shop/index', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '1', '', '系统设置', '0');
INSERT INTO `table_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '1', '', '系统设置', '0');
INSERT INTO `table_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `table_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `table_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `table_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `table_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0');
INSERT INTO `table_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '1', '', '系统设置', '0');
INSERT INTO `table_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('80', '分类管理', '122', '0', 'Category/index', '0', '', '分类管理', '0');
INSERT INTO `table_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `table_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO `table_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO `table_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0');
INSERT INTO `table_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0');
INSERT INTO `table_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '1', '', '数据备份', '0');
INSERT INTO `table_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '1', '备份数据库', '', '0');
INSERT INTO `table_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '1', '优化数据表', '', '0');
INSERT INTO `table_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO `table_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '1', '', '数据备份', '0');
INSERT INTO `table_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO `table_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO `table_menu` VALUES ('93', '其他', '0', '10', 'other', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO `table_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0');
INSERT INTO `table_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('122', '菜品', '0', '2', 'goods/index/', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('124', '堂食订单', '0', '4', 'order/index', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('125', '外卖单', '0', '5', 'Takeaway/index', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('126', '统计', '0', '6', 'Count/index?day=1', '0', '', '', '0');
INSERT INTO `table_menu` VALUES ('127', '问题订单列表', '124', '3', 'order/problem', '0', '', '订单管理', '0');
INSERT INTO `table_menu` VALUES ('128', '未支付订单列表', '124', '2', 'order/unpay', '0', '', '订单管理', '0');
INSERT INTO `table_menu` VALUES ('129', '已完成订单列表', '124', '4', 'order/complate', '0', '', '订单管理', '0');
INSERT INTO `table_menu` VALUES ('130', '已上架菜品', '122', '0', 'goods/index/', '0', '', '菜品管理', '0');
INSERT INTO `table_menu` VALUES ('131', '已下架菜品', '122', '0', 'goods/index?status=0', '0', '', '菜品管理', '0');
INSERT INTO `table_menu` VALUES ('132', '已分类菜品', '122', '0', 'goods/category/', '0', '', '菜品管理', '0');
INSERT INTO `table_menu` VALUES ('133', '未分类菜品', '122', '0', 'goods/category?is_category=0', '0', '', '菜品管理', '0');
INSERT INTO `table_menu` VALUES ('134', '未接单列表', '125', '0', 'Takeaway/index', '0', '', '订单管理', '0');
INSERT INTO `table_menu` VALUES ('135', '未签收订单列表', '125', '0', 'Takeaway/unsigned', '0', '', '订单管理', '0');
INSERT INTO `table_menu` VALUES ('136', '已完成订单列表', '125', '0', 'Takeaway/complate', '0', '', '订单管理', '0');
INSERT INTO `table_menu` VALUES ('137', '顾客列表', '123', '0', '#', '0', '', '顾客管理', '0');
INSERT INTO `table_menu` VALUES ('138', '经营分析', '126', '0', 'Count/index?day=1', '0', '', '统计分析', '0');
INSERT INTO `table_menu` VALUES ('139', '菜品分析', '126', '0', 'Count/goods?day=1', '0', '', '统计分析', '0');
INSERT INTO `table_menu` VALUES ('141', '菜品详细', '122', '0', 'goods/detail/', '1', '', '菜品管理', '0');
INSERT INTO `table_menu` VALUES ('142', '新增菜品', '130', '0', 'Goods/add/', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('144', '待出品列表', '124', '1', 'order/index', '0', '', '订单管理', '0');
INSERT INTO `table_menu` VALUES ('145', '餐厅信息管理', '68', '0', 'shop/index', '0', '', '系统设置', '0');
INSERT INTO `table_menu` VALUES ('146', '餐桌号设置', '68', '0', 'Table/index', '0', '', '系统设置', '0');
INSERT INTO `table_menu` VALUES ('147', '编辑菜品', '130', '0', 'Goods/edit', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('148', '添加餐桌', '146', '0', 'Table/add', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('149', '编辑餐桌', '146', '0', 'Table/edit', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('150', '订单详情', '134', '0', 'Takeaway/detail', '1', '', '', '0');
INSERT INTO `table_menu` VALUES ('151', '订单详情', '144', '0', 'Order/detail', '1', '', '', '0');

-- ----------------------------
-- Table structure for table_model
-- ----------------------------
DROP TABLE IF EXISTS `table_model`;
CREATE TABLE `table_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of table_model
-- ----------------------------
INSERT INTO `table_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', '0', '', '', '1383891233', '1384507827', '1', 'MyISAM');
INSERT INTO `table_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', '0', '', '', '1383891243', '1387260622', '1', 'MyISAM');
INSERT INTO `table_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');

-- ----------------------------
-- Table structure for table_order
-- ----------------------------
DROP TABLE IF EXISTS `table_order`;
CREATE TABLE `table_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `goods_count` varchar(255) DEFAULT NULL,
  `order_number` bigint(50) DEFAULT NULL,
  `create_time` bigint(55) DEFAULT NULL,
  `complate_time` bigint(55) DEFAULT NULL,
  `pay_type` int(11) DEFAULT '1' COMMENT '0 线下支付 1 在线支付',
  `prices` decimal(65,1) DEFAULT NULL,
  `tip` decimal(65,1) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '1 未出品 2 已出品 3 已取消 4 待评价 5已完成',
  `type` int(11) DEFAULT '0' COMMENT '0 堂食单 1 外卖单',
  `shop_id` int(11) DEFAULT NULL,
  `problem` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pay_status` int(11) DEFAULT '0' COMMENT '0 未付款 1 已付款',
  `uid` int(11) DEFAULT NULL,
  `order_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of table_order
-- ----------------------------
INSERT INTO `table_order` VALUES ('19', 'test3', null, '146466404133', '1465126783', '1465318279', '1', '167.0', '1.0', '1', '3', '0', '1', null, '1', '4', '');
INSERT INTO `table_order` VALUES ('20', 'test3', null, '146636715293', '1466367152', null, '1', '23.0', '1.0', '1', '4', '0', '1', null, '1', '4', '请评价！');
INSERT INTO `table_order` VALUES ('21', 'test3', null, '14663931244', '1466393124', null, '1', '101.0', '1.0', '1', '4', '0', '1', null, '1', '4', '请评价！');
INSERT INTO `table_order` VALUES ('22', 'test3', null, '146639451163', '1466394511', null, '1', '60.0', '1.0', '4', '3', '0', '1', null, '1', '4', '');
INSERT INTO `table_order` VALUES ('23', 'test3', null, '146641359130', '1466413591', null, '1', '0.0', '1.0', '2', '3', '0', '1', null, '0', '4', '');
INSERT INTO `table_order` VALUES ('24', 'test3', null, '146641375365', '1466413753', null, '1', '23.0', '1.0', '5', '3', '0', '1', null, '0', '4', '');
INSERT INTO `table_order` VALUES ('25', 'test3', null, '146664853810', '1466648538', '1466960383', '1', '23.0', '1.0', '1', '3', '0', '1', null, '0', '4', null);
INSERT INTO `table_order` VALUES ('26', 'test3', null, '146673400112', '1466734001', null, '1', '92.0', '1.0', '6', '3', '0', '1', null, '0', '4', '42314');
INSERT INTO `table_order` VALUES ('27', 'test3', null, '146716623048', '1467166230', null, '1', '78.0', '1.0', '4', '2', '0', '1', null, '0', '4', null);
INSERT INTO `table_order` VALUES ('28', 'test3', null, '14673575827', '1467357582', null, '1', '13.0', '1.0', '1', '1', '0', '1', null, '0', '4', null);
INSERT INTO `table_order` VALUES ('29', 'test3', null, '14673576027', '1467357602', null, '1', '25.0', '1.0', '3', '1', '0', '1', null, '0', '4', null);

-- ----------------------------
-- Table structure for table_order_count
-- ----------------------------
DROP TABLE IF EXISTS `table_order_count`;
CREATE TABLE `table_order_count` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `time` bigint(20) DEFAULT NULL,
  `visited` int(11) DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL,
  `order_prices` decimal(65,1) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of table_order_count
-- ----------------------------
INSERT INTO `table_order_count` VALUES ('1', '1465833209', '10', '1', '1000.0', '1');

-- ----------------------------
-- Table structure for table_picture
-- ----------------------------
DROP TABLE IF EXISTS `table_picture`;
CREATE TABLE `table_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_picture
-- ----------------------------
INSERT INTO `table_picture` VALUES ('1', '/Uploads/Picture/2016-05-07/572dfcd508b3a.jpg', '', 'd089ad4036bf751afe9d8cc0b26cca9d', '0bb494616573f5d09f40ab2f8cef6c178765508b', '1', '1462631636');
INSERT INTO `table_picture` VALUES ('2', '/Uploads/Picture/2016-05-07/572dfcd5292ca.jpg', '', '96d40951ccfb350b857d59fff11fc7d0', 'dd9da629b49e7d72853e2a264e01f1d601222702', '1', '1462631636');
INSERT INTO `table_picture` VALUES ('3', '/Uploads/Picture/2016-05-07/572e056aac726.jpg', '', 'd0874a2be5f91ac9eaf6ac20e7b1a93a', '227ab36155901b230a8e58a572fa83126c6f3cce', '1', '1462633834');
INSERT INTO `table_picture` VALUES ('4', '/Uploads/Picture/2016-05-07/572e0742bd4ae.jpg', '', 'b22f659340c270d3f5971a77325ac105', '776ae36d7d2bbd56c4611eb78ce6a9eb40a7d477', '1', '1462634306');
INSERT INTO `table_picture` VALUES ('5', '/Uploads/Picture/2016-05-08/572e1ab558e45.jpg', '', '48ebfc1b9d591055ef90b402aa39436e', 'e29af99002415829e9ff916272ff0051dd438bb1', '1', '1462639285');
INSERT INTO `table_picture` VALUES ('6', '/Uploads/Picture/2016-05-15/5738240a919ee.jpg', '', '3dc0da8bb035b4ef38cc34751f63957c', '38f96dfda59a929d25a41aa3f3bc024a69e68cb1', '1', '1463297034');
INSERT INTO `table_picture` VALUES ('7', '/Uploads/Picture/2016-05-15/5738240e559d5.jpg', '', '3dd110e247a9884e5f6ec365c8fff0c2', '2d69d2c44db0bd987b18d7ea6470935e1aace21d', '1', '1463297038');
INSERT INTO `table_picture` VALUES ('11', '/Uploads/Picture/2016-06-01/574ea32aaabd7.png', '', '889de0bba8feafd6aea69f1516526706', '394bbfdedcf2ec4becaf66e01f405f2a19726d43', '1', '1464771370');
INSERT INTO `table_picture` VALUES ('12', '/Uploads/Picture/2016-06-05/57537ccc076f0.png', '', '8c34f36be29cf6023daf8c1372b4ad44', '662478c7a893170b0abff0c01b8271da0b511686', '1', '1465089227');
INSERT INTO `table_picture` VALUES ('13', '/Uploads/Picture/2016-06-19/5766a50d0d011.jpg', '', '436f51deb41a1b8111523ebd80ccc6e0', 'ccee6b15518574e9d303289b2e58a542301c80e3', '1', '1466344716');
INSERT INTO `table_picture` VALUES ('14', '/Uploads/Picture/2016-06-20/5766c195f278f.jpg', '', '2580b13a977d0ec51ab2260fb402063f', '5deab628a2df8a141fb49db3be2691bb39f4169d', '1', '1466352021');
INSERT INTO `table_picture` VALUES ('15', '/Uploads/Picture/2016-06-20/5766c1a30170b.jpg', '', 'b0c6dfcf25537e87eb056c477d211fda', 'a31245215a5551ae14fadd65b732084944890b7e', '1', '1466352033');
INSERT INTO `table_picture` VALUES ('16', '/Uploads/Picture/2016-06-20/5766e7df23b95.jpg', '', '2be57f09f37c4d1390ba18729ece1a09', 'e71c315dae3545c29483df87ec0379e62bd94aac', '1', '1466361820');
INSERT INTO `table_picture` VALUES ('17', '/Uploads/Picture/2016-06-20/5766e8765742f.jpg', '', 'a58d22a65655074c86261b06564c1888', 'e580266f0e1d54d1ffa349678636576845c5b1ef', '1', '1466361973');
INSERT INTO `table_picture` VALUES ('18', '/Uploads/Picture/2016-06-20/5766f7601965b.jpg', '', '4601045193110d79e60e2ed3b44667ad', 'edd5d81c025f6c9aee620299b77932d22c8cbc19', '1', '1466365790');
INSERT INTO `table_picture` VALUES ('19', '/Uploads/Picture/2016-06-20/5766f80f08a85.jpg', '', 'bb0ff6b855068e779bef21bacb487d20', '2cb5a518c6d270864c6c9946a3cb961793d01954', '1', '1466365966');
INSERT INTO `table_picture` VALUES ('20', '/Uploads/Picture/2016-06-20/5766f85a796c0.jpg', '', '519e1ee8cf50b889adadf366d6857ed5', '42fb3801b1dae27560666e0df779a6a98a46ceaf', '1', '1466366041');
INSERT INTO `table_picture` VALUES ('21', '/Uploads/Picture/2016-06-20/5766f8cf6107c.jpg', '', '7a3bb59b0c1a5de36bacaa6704b76991', 'cf19119bbd60b451312658438d0eae33590a8b1f', '1', '1466366158');
INSERT INTO `table_picture` VALUES ('22', '/Uploads/Picture/2016-06-20/5766f90ad2b91.jpg', '', 'e3f66dcacb359075d6f62011d698214c', '60f1fd6e806922d08903370ed23df543bf2256b2', '1', '1466366217');
INSERT INTO `table_picture` VALUES ('23', '/Uploads/Picture/2016-06-20/5766f91d68c21.jpg', '', '2ed550c685d79ff96e1414b293b4d7be', 'ff677a8058dca39311d74d54abee6eaef74bdfa4', '1', '1466366236');
INSERT INTO `table_picture` VALUES ('24', '/Uploads/Picture/2016-06-20/5766f92d61f2a.jpg', '', '217cb2e66514d735f108d25d7ed4229c', 'fbaf142a9721fdf90b9575eb323a3da456f13f41', '1', '1466366252');
INSERT INTO `table_picture` VALUES ('25', '/Uploads/Picture/2016-06-20/5766f9f9bc5bf.jpg', '', '23e97578d0fd9c3684e580579a390c80', '6e45ab6d215c4b1aaf35e7c0f67c8cf32e225bb9', '1', '1466366456');
INSERT INTO `table_picture` VALUES ('26', '/Uploads/Picture/2016-06-20/5766fa4a390f6.jpg', '', '8ed44d7b9ad1687ed931be37a9ea29f0', '6dfa85cfc4eff614c198e4bba24a253e9d7efc25', '1', '1466366537');
INSERT INTO `table_picture` VALUES ('27', '/Uploads/Picture/2016-06-24/576c96ba7f7b5.png', '', 'c6eb1faf608b89e8addab43c877f1cd0', 'ea713279e5847a82d452dbb1697ad268b2510d82', '1', '1466734264');
INSERT INTO `table_picture` VALUES ('28', '/Uploads/Picture/2016-06-29/577385d58e6cf.jpg', '', 'e5450239c0ebdbe9ed28cd1106afa193', '3c87022e0ea59296793097e2929fac12f4283a93', '1', '1467188687');
INSERT INTO `table_picture` VALUES ('29', '/Uploads/Picture/2016-06-30/57748b6005869.jpg', '', '3cc9db8dd1acec53e5d10e5cd303ae83', 'db220169e2654b8db4da5ce15d1294f3fa46fe80', '1', '1467255645');
INSERT INTO `table_picture` VALUES ('30', '/Uploads/Picture/2016-06-30/57748bf7d9882.jpg', '', 'a2cb4e2d464f439fe12a8a2856dd3a16', '410c84aa2bbd58f9ca1e6401a165ff3f1677049e', '1', '1467255796');
INSERT INTO `table_picture` VALUES ('31', '/Uploads/Picture/2016-06-30/57748c73bb12c.jpg', '', '8535b3308efce9114ba857ccddf574db', 'eb573887502f6ce3872c7f09102cc1612eaa279c', '1', '1467255921');
INSERT INTO `table_picture` VALUES ('32', '/Uploads/Picture/2016-07-01/5775cd642d9d3.jpg', '', '2987ec5a29cb35a5c002ada310d9415c', 'cb7de69fa7c5696b9f0f986b29cf6271674d92e4', '1', '1467338083');
INSERT INTO `table_picture` VALUES ('33', '/Uploads/Picture/2016-07-01/5775ce1bb11d6.jpg', '', '93edc60fa646c35e67766cb0e2ab7b66', 'c4e3fd2e668278177d9dd856c461ffc24dc6846b', '1', '1467338267');
INSERT INTO `table_picture` VALUES ('34', '/Uploads/Picture/2016-07-01/5775cf3986d6f.jpg', '', '25d324693a4c5021ec52a5ec61885059', '5ef9fad075c890f50ee64db7591a487d2bc3345a', '1', '1467338553');
INSERT INTO `table_picture` VALUES ('35', '/Uploads/Picture/2016-07-01/5775cfb65e993.jpg', '', '7e47270839d22db982fb474e694a1b88', '9570f952a6f3f7972a147cd299172bb4c04ec021', '1', '1467338678');
INSERT INTO `table_picture` VALUES ('36', '/Uploads/Picture/2016-07-01/5775d00c56a7d.jpg', '', '9e217efce8b1b167aafb6047fc198c62', '08f3f7f02ba7b4829f09dd0a9319f18ef1b442e3', '1', '1467338764');
INSERT INTO `table_picture` VALUES ('37', '/Uploads/Picture/2016-07-01/5775d04b5c77a.jpg', '', '8ae7507fa31b26104d3d93147b4ba199', '93bfea4280711baac17b6d9bb9f2ee396b4deb68', '1', '1467338827');
INSERT INTO `table_picture` VALUES ('38', '/Uploads/Picture/2016-07-01/5775d0e58eb26.jpg', '', '5b9f4fd24cc2536c82ea7dd0807ac7f5', '7e80bfb32bb5dbb6980e4eb4a9620cc9b335995a', '1', '1467338981');
INSERT INTO `table_picture` VALUES ('39', '/Uploads/Picture/2016-07-01/5775d105729dd.jpg', '', 'b2c7c2346af5515e9c33060934a550ce', '3f0d09a9595d679bc36af7209d670930d4344e8d', '1', '1467339013');
INSERT INTO `table_picture` VALUES ('40', '/Uploads/Picture/2016-07-01/5775d1e4cbff6.jpg', '', '6133b7d895a781e7828a10ee1d203547', '8f5d84fc286040996e2644291a02e993baa93007', '1', '1467339236');
INSERT INTO `table_picture` VALUES ('41', '/Uploads/Picture/2016-07-01/5775d257c9630.jpg', '', 'fbfed3a5eab5fb173ea598fd5366320d', 'e5ef39021162766e6abd9e6ce2d1740ea08fa9de', '1', '1467339351');
INSERT INTO `table_picture` VALUES ('42', '/Uploads/Picture/2016-07-01/5775d27371154.jpg', '', '113861af925778c1ffd58cfee27f22e3', '56dff89503396787062fb36c758bd30169b994d2', '1', '1467339379');
INSERT INTO `table_picture` VALUES ('43', '/Uploads/Picture/2016-07-01/5775d309e3f27.jpg', '', '89336474aae16aa27cad71ae19b3244f', 'fd765e6bac85d6c27b8301163aa07d367b50ab33', '1', '1467339529');
INSERT INTO `table_picture` VALUES ('44', '/Uploads/Picture/2016-07-01/5775d37123f48.jpg', '', 'aaa5904d0ff90c8281e95fc40b3277a9', 'bfb6bf90d0e674751321e9f8e2ff7d0be0819d03', '1', '1467339633');
INSERT INTO `table_picture` VALUES ('45', '/Uploads/Picture/2016-07-01/5775d3ec2778b.jpg', '', '33022f67679378c1cf1f71a63b4fb42c', 'faa62cec1f486fb60cb360048ad615c238baaa4e', '1', '1467339755');
INSERT INTO `table_picture` VALUES ('46', '/Uploads/Picture/2016-07-03/57780c47464d4.JPG', '', '6be02e99c10738141306ccc1cb41d66f', 'edbac833d85da28256c23ce9054d598a026d8c85', '1', '1467485254');
INSERT INTO `table_picture` VALUES ('47', '/Uploads/Picture/2016-07-03/57780f443c607.JPG', '', 'cc9615829b54d21397acfa05c8a636f6', 'c3925b23cdfab0b2e5b4ba59ab51f1bcab434d42', '1', '1467486018');
INSERT INTO `table_picture` VALUES ('48', '/Uploads/Picture/2016-07-03/57780fcb8ccae.JPG', '', '17b881966b3f12fb525ffeaa92f095d0', '612e96f938f22981dd0e40ba4e7a1754b3602aa4', '1', '1467486155');
INSERT INTO `table_picture` VALUES ('49', '/Uploads/Picture/2016-07-03/57782f2c30274.JPG', '', '6b635a3511c418455327a6a0a5f1e423', '957e48b21bfda73f128bf91b23fc311c96f3617e', '1', '1467494187');
INSERT INTO `table_picture` VALUES ('50', '/Uploads/Picture/2016-07-03/577830be56d17.JPG', '', '3caf05fcfa781f6adf934831e4bffb3e', '1d458f55ca2f1f01f271c2ff3ff8f44959564ab0', '1', '1467494589');

-- ----------------------------
-- Table structure for table_shop
-- ----------------------------
DROP TABLE IF EXISTS `table_shop`;
CREATE TABLE `table_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `longitude` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `latitude` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `contract` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `contract_tel` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `takeout_tel` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `pic` int(11) DEFAULT NULL,
  `detail_pic` int(11) DEFAULT NULL,
  `visited` int(11) DEFAULT '0',
  `star` int(11) DEFAULT NULL,
  `shop_status` int(11) DEFAULT '1',
  `time` varchar(50) DEFAULT NULL,
  `discount` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `carpark` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `eval` int(11) DEFAULT '1',
  `like` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of table_shop
-- ----------------------------
INSERT INTO `table_shop` VALUES ('1', 'Geisha', '804 E Broadway Columbia, MO 65201', '-92.3340720', '38.9517050', 'Harris', '(573) 777-9997', '(573) 777-9997', 'Sushi bar', '14', '45', '0', '4', '1', 'AM10:00-PM11:30', 'No', 'On street parking', '20', null);
INSERT INTO `table_shop` VALUES ('8', 'India\'s House  ', '1101 E Broadway, Columbia, MO 65201', '-92.3255290', '38.9518380', 'jiasdf', '5738172009', '5738172009', 'Indian food ', '49', '49', '0', null, '1', null, 'No', 'No', '1', '0');

-- ----------------------------
-- Table structure for table_table
-- ----------------------------
DROP TABLE IF EXISTS `table_table`;
CREATE TABLE `table_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `table_status` int(11) DEFAULT '0' COMMENT '0 未下单 1 已下单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of table_table
-- ----------------------------
INSERT INTO `table_table` VALUES ('1', '一号餐桌', '1', '1');
INSERT INTO `table_table` VALUES ('2', '二号餐桌', '1', '0');
INSERT INTO `table_table` VALUES ('3', '三号餐桌', '1', '1');
INSERT INTO `table_table` VALUES ('4', '四号餐桌', '1', '1');
INSERT INTO `table_table` VALUES ('5', '五号餐桌', '1', '0');

-- ----------------------------
-- Table structure for table_takeaway
-- ----------------------------
DROP TABLE IF EXISTS `table_takeaway`;
CREATE TABLE `table_takeaway` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(50) DEFAULT NULL,
  `customer` varchar(50) DEFAULT NULL,
  `pay_type` int(11) DEFAULT '2' COMMENT '1 线下支付 2 线上支付',
  `create_time` bigint(20) DEFAULT NULL,
  `take_time` bigint(20) DEFAULT NULL,
  `takeout_prices` decimal(65,1) DEFAULT NULL,
  `prices` decimal(65,1) DEFAULT NULL,
  `pay_status` int(11) DEFAULT '0' COMMENT '0 未付款 1 已付款 ',
  `takeaway_status` int(11) DEFAULT '1' COMMENT '1.未接单 2 已接单  3 已取消  4 未签收 5 已完成',
  `shop_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `tip` int(11) DEFAULT '1',
  `complate_time` bigint(20) DEFAULT NULL,
  `order_description` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of table_takeaway
-- ----------------------------
INSERT INTO `table_takeaway` VALUES ('11', '146393521957', 'test3', '0', '1465126783', '600', '5.0', '219.0', '1', '3', '1', '4', '1', null, '不想卖', null);
INSERT INTO `table_takeaway` VALUES ('35', '146574703492', 'test3', '2', '1465747034', '600', '5.0', '780.0', '0', '5', '1', '4', '1', null, '10分钟后请取餐', null);
INSERT INTO `table_takeaway` VALUES ('36', '146574709683', 'test3', '2', '1465747096', '600', '5.0', '100.0', '0', '5', '1', '4', '1', null, '10分钟后请取餐', null);
INSERT INTO `table_takeaway` VALUES ('37', '146574865798', 'test3', '2', '1465748657', '600', '5.0', '130.0', '0', '5', '1', '4', '1', null, '10分钟后请取餐', null);
INSERT INTO `table_takeaway` VALUES ('38', '14657838175', 'test3', '2', '1465783817', '1465783927', '5.0', '89.0', '1', '6', '1', '4', '1', null, '10分钟后请取餐', null);
INSERT INTO `table_takeaway` VALUES ('39', '146634516096', 'test3', '2', '1466345160', null, '5.0', '130.0', '0', '3', '1', '4', '1', null, 'buxiang', null);
INSERT INTO `table_takeaway` VALUES ('40', '146634523339', 'test3', '2', '1466345233', null, '5.0', '130.0', '0', '3', '1', '4', '1', null, 'asdfasd', null);
INSERT INTO `table_takeaway` VALUES ('41', '146634531342', 'test3', '2', '1466345313', '2400', '5.0', '89.0', '0', '5', '1', '4', '1', null, '40分钟后请取餐', null);
INSERT INTO `table_takeaway` VALUES ('42', '146636669091', 'test3', '2', '1466366690', '600', '5.0', '23.0', '1', '5', '1', '4', '1', null, '10分钟后请取餐', null);
INSERT INTO `table_takeaway` VALUES ('43', '146639112731', 'test3', '2', '1466391127', null, '5.0', '23.0', '1', '3', '1', '4', '1', null, '31', null);
INSERT INTO `table_takeaway` VALUES ('44', '146641508325', 'test3', '2', '1466415083', null, '5.0', '23.0', '0', '3', '1', '4', '1', null, '没有理由', null);
INSERT INTO `table_takeaway` VALUES ('45', '146664873920', 'test3', '2', '1466648739', null, '5.0', '11.0', '1', '3', '1', '4', '1', null, '', null);
INSERT INTO `table_takeaway` VALUES ('46', '146695826942', 'test3', '2', '1466958269', null, '5.0', '38.0', '0', '3', '1', '4', '1', null, '13123', null);
INSERT INTO `table_takeaway` VALUES ('47', '14671707004', 'test3', '2', '1467170700', '1800', '5.0', '11.0', '1', '5', '1', '4', '1', null, '30分钟后请取餐', null);
INSERT INTO `table_takeaway` VALUES ('48', '146717124268', 'test3', '2', '1467171242', null, '5.0', '24.0', '0', '3', '1', '4', '1', null, '', null);
INSERT INTO `table_takeaway` VALUES ('49', '146717186446', 'test3', '2', '1467171864', null, '5.0', '11.0', '0', '3', '1', '4', '1', null, '', null);
INSERT INTO `table_takeaway` VALUES ('50', '146717197386', 'test3', '2', '1467171973', null, '5.0', '11.0', '0', '3', '1', '4', '1', null, '', null);
INSERT INTO `table_takeaway` VALUES ('51', '146717204775', 'test3', '2', '1467172047', null, '5.0', '11.0', '0', '3', '1', '4', '1', null, '', null);
INSERT INTO `table_takeaway` VALUES ('52', '146748708192', 'test3', '2', '1467487081', '1467487192', '5.0', '11.0', '1', '6', '1', '4', '1', null, '20分钟后请取餐', null);
INSERT INTO `table_takeaway` VALUES ('53', '146759479045', 'test3', '2', '1467594790', null, '5.0', '11.0', '0', '1', '1', '4', '1', null, null, null);

-- ----------------------------
-- Table structure for table_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `table_ucenter_admin`;
CREATE TABLE `table_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of table_ucenter_admin
-- ----------------------------
INSERT INTO `table_ucenter_admin` VALUES ('1', '6', '1');

-- ----------------------------
-- Table structure for table_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `table_ucenter_app`;
CREATE TABLE `table_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of table_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for table_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `table_ucenter_member`;
CREATE TABLE `table_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) DEFAULT NULL COMMENT '用户邮箱',
  `mobile` char(15) DEFAULT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  `facebook_id` varchar(50) DEFAULT NULL,
  `shop_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of table_ucenter_member
-- ----------------------------
INSERT INTO `table_ucenter_member` VALUES ('1', 'admin', 'b5e40d5234d64fcd204ef90e62399844', 'admin@qq.com', '', '1461430311', '0', '1467493898', '1227410655', '1461430311', '1', null, '1');
INSERT INTO `table_ucenter_member` VALUES ('2', 'test', 'be8de220cfea745e9c22c11a20d61981', '123123@qq.com', '', '1461432912', '0', '1464665184', '2005057059', '1461432912', '1', null, '1');
INSERT INTO `table_ucenter_member` VALUES ('3', 'shop1', 'be8de220cfea745e9c22c11a20d61981', 'shop1@qq.com', '', '1462023990', '0', '1462024757', '0', '1462023990', '1', null, '1');
INSERT INTO `table_ucenter_member` VALUES ('4', 'test3', 'be8de220cfea745e9c22c11a20d61981', '123@qq.com', '13018473858', '1463497320', '0', '1467595316', '1227410655', '1463497320', '1', null, '0');
INSERT INTO `table_ucenter_member` VALUES ('5', 'allen', 'be8de220cfea745e9c22c11a20d61981', 'test@qq.com', '13123123111', '1464106749', '0', '1464106792', '0', '1464106749', '1', null, '0');
INSERT INTO `table_ucenter_member` VALUES ('6', 'superadmin', 'b5e40d5234d64fcd204ef90e62399844', 'tadmin@qq.com', '', '0', '0', '1467493925', '1227410655', '0', '1', null, '0');
INSERT INTO `table_ucenter_member` VALUES ('7', 'aa', 'be8de220cfea745e9c22c11a20d61981', 'test1@qq.com', '13123012311', '1464624098', '0', '0', '0', '1464624098', '1', null, '0');
INSERT INTO `table_ucenter_member` VALUES ('8', '12321', 'be8de220cfea745e9c22c11a20d61981', '', '13011101111', '1464624136', '0', '0', '0', '1464624136', '1', null, '0');
INSERT INTO `table_ucenter_member` VALUES ('9', 'allena', 'be8de220cfea745e9c22c11a20d61981', null, 'test1@qq.com', '1465044401', '0', '0', '0', '1465044401', '1', null, '0');
INSERT INTO `table_ucenter_member` VALUES ('10', 'mike', 'be8de220cfea745e9c22c11a20d61981', null, '13456789012', '1465044566', '0', '1465044575', '0', '1465044566', '1', null, '0');
INSERT INTO `table_ucenter_member` VALUES ('13', '2016061911060489', 'bedccad012d452515db32e22bf23b37e', null, '13112311121', '1466349303', '0', '1467494074', '1227410655', '1466349303', '1', null, '8');

-- ----------------------------
-- Table structure for table_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `table_ucenter_setting`;
CREATE TABLE `table_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of table_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for table_url
-- ----------------------------
DROP TABLE IF EXISTS `table_url`;
CREATE TABLE `table_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of table_url
-- ----------------------------

-- ----------------------------
-- Table structure for table_userdata
-- ----------------------------
DROP TABLE IF EXISTS `table_userdata`;
CREATE TABLE `table_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_userdata
-- ----------------------------
