/*
Navicat MySQL Data Transfer

Source Server         : 14.17.100.211
Source Server Version : 50541
Source Host           : 14.17.100.211:3306
Source Database       : flowplat

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2017-06-20 14:21:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ds_job_info
-- ----------------------------
DROP TABLE IF EXISTS `ds_job_info`;
CREATE TABLE `ds_job_info` (
  `job_id` tinyint(8) NOT NULL AUTO_INCREMENT COMMENT '自增量',
  `job_code` varchar(20) DEFAULT NULL COMMENT 'job编码',
  `job_name` varchar(30) DEFAULT NULL COMMENT 'job名称',
  `nw_code` varchar(30) DEFAULT NULL COMMENT '网元编号',
  `beg_date` varchar(30) DEFAULT NULL,
  `end_date` varchar(30) DEFAULT NULL,
  `job_enable` tinyint(1) unsigned zerofill DEFAULT NULL COMMENT '任务是否可用 0代表可以不可用;1可用',
  `job_describe` text COMMENT 'job描述',
  `job_runule` varchar(100) DEFAULT NULL COMMENT 'Job执行规则',
  `job_runruledesc` varchar(64) DEFAULT NULL COMMENT '规则描述',
  `job_runclass` varchar(300) DEFAULT NULL COMMENT '映射CLASS',
  `job_rundescribe` text COMMENT '运行详细信息',
  `job_run_datatime` datetime DEFAULT NULL COMMENT '运行时间时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`),
  KEY `index_job_code` (`job_code`),
  KEY `index_nw_code` (`nw_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_job_info
-- ----------------------------
INSERT INTO `ds_job_info` VALUES ('1', '100', '库存卡邮件提醒', 'GLSX', null, null, '1', '库存卡邮件提醒', '0 0 9 ? * MON', '每周一九点执行', ' com.glsx.oms.fcscheduler.biz.executor.fcadmin.StorageStatisticJobImpl ', null, null, '2017-06-09 15:37:25');

-- ----------------------------
-- Table structure for ds_job_log
-- ----------------------------
DROP TABLE IF EXISTS `ds_job_log`;
CREATE TABLE `ds_job_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_title` varchar(64) DEFAULT NULL COMMENT '日志标题',
  `log_runstatus` varchar(1) DEFAULT NULL COMMENT 'job状态',
  `log_datetime` datetime DEFAULT NULL COMMENT 'job执行时间',
  `log_describe` text COMMENT '描述',
  `log_type` tinyint(4) DEFAULT NULL COMMENT '执行类型(0,自动;1手动)',
  `job_code` varchar(20) DEFAULT NULL COMMENT '关联JOB',
  PRIMARY KEY (`log_id`),
  KEY `index_job_code` (`job_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_access_policy
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_access_policy`;
CREATE TABLE `flowmgn_access_policy` (
  `policy_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '策略ID',
  `category_id` int(10) DEFAULT NULL COMMENT '所属分类',
  `policy_name` varchar(64) DEFAULT NULL COMMENT '策略名称',
  `policy_desc` varchar(256) DEFAULT NULL COMMENT '策略描述',
  `policy_begintime` date DEFAULT NULL COMMENT '策略生效时间',
  `policy_endtime` date DEFAULT NULL COMMENT '策略失效时间',
  `hostname` varchar(1024) DEFAULT NULL COMMENT '访问域名',
  `port` varchar(64) DEFAULT NULL COMMENT '访问端口',
  `allow_type` int(3) DEFAULT NULL COMMENT '访问方式：（0：禁止访问 1：允许访问 2：限速访问)',
  `flow_speed` int(6) DEFAULT NULL COMMENT '最大限速（单位KB）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户黑白名单定义';

-- ----------------------------
-- Records of flowmgn_access_policy
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_api_optlog
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_api_optlog`;
CREATE TABLE `flowmgn_api_optlog` (
  `opt_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录Id',
  `opt_type` varchar(64) DEFAULT NULL COMMENT '操作类型',
  `opt_desc` text COMMENT '操作返回结果',
  `opt_reason` varchar(128) DEFAULT NULL COMMENT '操作原因',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `last_operator_id` int(10) DEFAULT '0' COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) DEFAULT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`opt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COMMENT='批量处理操作日志';

-- ----------------------------
-- Records of flowmgn_api_optlog
-- ----------------------------
INSERT INTO `flowmgn_api_optlog` VALUES ('1', '单卡启用', 'null', '测试单卡启用', '2017-04-25 16:09:22', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('2', '单卡启用', 'null', '测试单卡启用', '2017-04-25 16:10:38', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('3', '单卡启用', 'null', '测试单卡启用', '2017-04-25 16:11:13', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('4', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003065300\",\"errorcode\":4294967295}]', '测试单卡启用', '2017-04-25 16:12:32', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('5', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003065300\",\"errorcode\":4294967295}]', '测试单卡启用1', '2017-04-25 16:13:23', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('6', '单卡停用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061602001666518\",\"errorcode\":4294967295}]', '测试单卡停用', '2017-04-25 16:13:50', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('7', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061602003133039\",\"errorcode\":4294967295}]', '确定启用', '2017-05-12 15:36:47', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('8', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061602003133039\",\"errorcode\":4294967295}]', '确定启用', '2017-05-12 15:36:52', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('9', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061602003133039\",\"errorcode\":4294967295}]', '确定启用', '2017-05-12 15:38:04', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('10', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061602003133039\",\"errorcode\":4294967295}]', '确定启用', '2017-05-12 15:38:08', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('11', '单卡停用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061602003133039\",\"errorcode\":4294967295}]', '测试停用', '2017-05-12 15:41:30', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('12', '单卡停用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061602003133039\",\"errorcode\":4294967295}]', '测试停用', '2017-05-12 15:41:54', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('13', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003065299\",\"errorcode\":4294967295}]', '测试启用', '2017-05-12 15:42:37', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('14', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003065299\",\"errorcode\":4294967295}]', '测试启用', '2017-05-12 15:44:40', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('15', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003065299\",\"errorcode\":4294967295}]', '测试启用', '2017-05-12 15:49:26', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('16', '单卡停用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003065299\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"8986061501001356722\",\"errorcode\":4294967295}]', '测试启用已经停卡的卡测试启用已经停卡的卡测试启用已经停卡的卡测试启用已经停卡的卡测试启用已经停卡的卡', '2017-05-12 16:03:39', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('17', '单卡停用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003065299\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"8986061501001356722\",\"errorcode\":4294967295}]', '测试启用已经停卡的卡测试启用已经停卡的卡测试启用已经停卡的卡测试启用已经停卡的卡测试启用已经停卡的卡', '2017-05-12 16:04:03', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('18', '单卡停用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003065299\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"8986061501001356722\",\"errorcode\":4294967295}]', '测试启用已经停卡的卡测试启用已经停卡的卡测试启用已经停卡的卡测试启用已经停卡的卡测试启用已经停卡的卡', '2017-05-12 16:06:02', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('19', '单卡续费', '{\"msg\":\"success\",\"ret\":0}\n', '170512163243840', '2017-05-12 16:32:43', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('20', '单卡续费', '{\"msg\":\"success\",\"ret\":0}\n', '170512163445394', '2017-05-12 16:34:45', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('21', '批量启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061601003709209\",\"errorcode\":4294967295}]', '111', '2017-05-12 17:49:02', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('22', '批量启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061601003709209\",\"errorcode\":4294967295}]', '123', '2017-05-13 11:06:40', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('23', '批量启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061601003709209\",\"errorcode\":4294967295}]', '123', '2017-05-13 11:06:40', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('24', '批量启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003065299\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"8986061501003418237\",\"errorcode\":4294967295}]', '00', '2017-05-13 11:19:56', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('25', '批量停用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061602003133039\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"8986061501003065300\",\"errorcode\":4294967295}]', '123', '2017-05-13 11:20:12', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('26', '批量续费', '{\"msg\":\"success\",\"ret\":0}\n', '170513112157394', '2017-05-13 11:22:01', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('27', '单卡停用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061602003133036\",\"errorcode\":4294967295}]', '下手地', '2017-05-13 15:26:48', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('28', '单卡停用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061602003133036\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000142\",\"errorcode\":4294967295}]', '黄美红', '2017-05-13 15:27:23', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('29', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061601003709209\",\"errorcode\":4294967295}]', '123', '2017-05-15 11:35:43', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('30', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061601003709209\",\"errorcode\":4294967295}]', '123', '2017-05-15 11:36:08', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('31', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061601003709209\",\"errorcode\":4294967295}]', '123', '2017-05-15 11:36:08', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('32', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061601003709209\",\"errorcode\":4294967295}]', '123', '2017-05-15 11:36:18', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('33', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061601003709209\",\"errorcode\":4294967295}]', '123', '2017-05-15 11:36:18', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('34', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061601003709209\",\"errorcode\":4294967295}]', '123', '2017-05-15 11:36:24', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('35', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061601003709209\",\"errorcode\":4294967295}]', '123', '2017-05-15 11:44:59', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('36', '单卡启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061601003709209\",\"errorcode\":4294967295}]', '123', '2017-05-15 11:47:15', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('37', '单卡启用', 'null', '000', '2017-05-18 09:52:03', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('38', '单卡停用', 'null', '123', '2017-05-18 09:58:01', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('39', '单卡停用', '[{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000182\",\"errorcode\":4294967295}]', '服务套餐已过期', '2017-05-18 10:01:28', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('40', '单卡停用', '[{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000182\",\"errorcode\":4294967295}]', '山高水低碧非国大', '2017-05-18 10:01:39', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('41', '单卡停用', 'null', '123', '2017-05-18 10:02:13', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('42', '单卡启用', 'null', '123', '2017-05-18 10:05:22', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('43', '单卡启用', 'null', '花粉管', '2017-05-18 18:26:06', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('44', '单卡停用', 'null', '万事大吉鬼画符', '2017-05-18 18:26:42', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('45', '单卡启用', 'null', '干旱下地上', '2017-05-19 10:47:14', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('46', '单卡停用', 'null', '士跟烘干机瑁', '2017-05-19 10:48:00', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('47', '单卡停用', 'null', '枯叶王一', '2017-05-19 14:51:57', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('48', '单卡停用', 'null', '测试测试测试测试小小测试测试测试测试小小测试测试测试测试小小测试测试测试测试小小测试测试测试测试小小', '2017-05-19 15:24:18', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('49', '单卡启用', 'null', '测试测试小小', '2017-05-19 15:31:06', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('50', '单卡停用', 'null', '原封不动', '2017-05-19 16:04:04', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('51', '批量启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003418238\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"8986061501003418237\",\"errorcode\":4294967295}]', '123', '2017-05-22 10:36:09', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('52', '批量启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003418238\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"8986061501003418237\",\"errorcode\":4294967295}]', '123', '2017-05-22 10:36:16', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('53', '批量启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003418238\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"8986061501003418237\",\"errorcode\":4294967295}]', '123', '2017-05-22 10:36:23', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('54', '批量启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003418238\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"8986061501003418237\",\"errorcode\":4294967295}]', '123', '2017-05-22 10:36:28', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('55', '批量启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003418238\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"8986061501003418237\",\"errorcode\":4294967295}]', '123', '2017-05-22 10:39:55', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('56', '批量启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003418238\",\"errorcode\":4294967295}]', '123', '2017-05-22 10:42:15', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('57', '批量启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003418238\",\"errorcode\":4294967295}]', '123', '2017-05-22 10:49:19', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('58', '批量停用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061602001666518\",\"errorcode\":4294967295}]', '测试测试测试测试测试', '2017-05-22 10:59:08', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('59', '批量启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003418238\",\"errorcode\":4294967295}]', '123', '2017-05-22 11:07:06', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('60', '批量停用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061602003133039\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"8986061602003133036\",\"errorcode\":4294967295}]', '枯干棒球一', '2017-05-22 11:08:41', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('61', '批量停用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061602003133039\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"8986061602003133036\",\"errorcode\":4294967295}]', '枯干棒球一', '2017-05-22 11:08:46', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('62', '批量停用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003065300\",\"errorcode\":4294967295}]', '123', '2017-05-22 11:12:32', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('63', '批量启用', '[{\"msg\":\"invalid format\",\"iccid\":\"8986061501003418238\",\"errorcode\":4294967295}]', '123', '2017-05-22 11:21:03', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('64', '单卡启用', 'null', '123', '2017-05-22 17:50:27', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('65', '单卡启用', 'null', '我', '2017-05-22 17:51:31', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('66', '单卡停用', 'null', '123', '2017-05-22 17:51:59', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('67', '单卡停用', 'null', '123', '2017-05-22 17:54:22', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('68', '单卡停用', 'null', '123', '2017-05-22 17:56:46', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('69', '单卡启用', 'null', '123', '2017-05-22 17:58:21', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('70', '单卡停用', 'null', '123', '2017-05-22 17:58:37', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('71', '单卡停用', 'null', '123', '2017-05-22 17:59:43', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('72', '单卡停用', 'null', '123', '2017-05-22 18:02:11', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('73', '单卡停用', 'null', '123', '2017-05-22 18:04:29', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('74', '批量停用', 'null', '123', '2017-05-22 18:07:19', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('75', '单卡启用', 'null', '123', '2017-05-22 18:08:38', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('76', '单卡停用', 'null', '123', '2017-05-22 18:10:57', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('77', '单卡停用', 'null', '123', '2017-05-22 18:13:09', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('78', '单卡停用', 'null', 'test', '2017-05-22 18:28:08', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('79', '单卡停用', 'null', 'test', '2017-05-22 18:29:13', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('80', '单卡启用', 'null', 'dsat', '2017-05-22 18:31:07', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('81', '单卡停用', 'null', 'Test', '2017-05-22 18:38:51', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('82', '单卡停用', 'null', '棒球一', '2017-05-22 18:42:45', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('83', '单卡停用', 'null', '123', '2017-05-22 18:43:23', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('84', '单卡启用', 'null', '玩友', '2017-05-22 18:44:10', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('85', '单卡启用', 'null', '123', '2017-05-22 18:44:18', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('86', '单卡停用', 'null', '雨量旧', '2017-05-22 18:44:24', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('87', '单卡停用', 'null', '123', '2017-05-22 18:45:05', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('88', '单卡停用', 'null', '123', '2017-05-22 18:46:14', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('89', '批量停用', 'null', '12', '2017-05-23 11:05:30', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('90', '批量启用', 'null', '00', '2017-05-23 11:05:58', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('91', '批量停用', 'null', '士', '2017-05-23 14:25:21', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('92', '单卡停用', 'null', '服务', '2017-05-23 14:42:22', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('93', '单卡启用', 'null', '服务套餐服务套餐', '2017-05-24 11:32:02', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('94', '单卡停用', 'null', '服务套餐服务套餐服务套餐服务套餐服务套餐服务套餐', '2017-05-24 11:43:08', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('95', '开放平台单卡启用', 'null', '服务套餐', '2017-05-26 14:55:44', '100000', '微信开发环境');
INSERT INTO `flowmgn_api_optlog` VALUES ('96', '开放平台单卡停用', '[{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000168\",\"errorcode\":4294967295}]', '服务套餐服务套餐', '2017-05-26 14:58:29', '100000', '微信开发环境');
INSERT INTO `flowmgn_api_optlog` VALUES ('97', '开放平台单卡启用', 'null', '231', '2017-05-26 16:04:21', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('98', '开放平台单卡启用', 'null', '000', '2017-05-26 17:08:36', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('99', '开放平台单卡停用', 'null', '000', '2017-05-26 17:08:57', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('100', '开放平台批量启用', 'null', null, '2017-05-26 17:39:21', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('101', '开放平台单卡启用', 'null', '测试测试', '2017-05-26 17:39:45', '100000', '微信开发环境');
INSERT INTO `flowmgn_api_optlog` VALUES ('102', '开放平台单卡启用', 'null', '地', '2017-05-27 14:10:22', '100000', '微信开发环境');
INSERT INTO `flowmgn_api_optlog` VALUES ('103', '开放平台单卡启用', 'null', '地', '2017-05-27 14:10:23', '100000', '微信开发环境');
INSERT INTO `flowmgn_api_optlog` VALUES ('104', '单卡启用', 'null', '123', '2017-05-27 14:58:59', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('105', '开放平台单卡启用', 'null', '测试测试', '2017-06-01 11:32:42', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('106', '开放平台单卡启用', 'null', '测试测试', '2017-06-01 14:34:54', '1000123', '测试专用商户');
INSERT INTO `flowmgn_api_optlog` VALUES ('107', '开放平台单卡停用', 'null', '测试测试', '2017-06-01 14:35:07', '1000123', '测试专用商户');
INSERT INTO `flowmgn_api_optlog` VALUES ('108', '开放平台单卡停用', 'null', '测试测试', '2017-06-01 16:51:10', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('109', '开放平台单卡启用', 'null', '服务套餐服务套餐', '2017-06-01 16:52:05', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('110', '开放平台单卡启用', 'null', '服务套餐', '2017-06-02 09:29:25', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('111', '开放平台单卡停用', 'null', '测试测试6-2', '2017-06-02 10:06:40', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('112', '开放平台批量启用', 'null', null, '2017-06-02 10:19:35', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('113', '开放平台批量启用', 'null', null, '2017-06-02 11:04:47', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('114', '开放平台批量停用', 'null', null, '2017-06-02 11:13:28', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('115', '开放平台批量停用', 'null', null, '2017-06-02 11:13:32', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('116', '开放平台批量停用', 'null', null, '2017-06-02 11:14:29', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('117', '单卡停用', 'null', '测试', '2017-06-02 13:52:20', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('118', '单卡启用', 'null', '测试2', '2017-06-02 13:52:50', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('119', '开放平台单卡停用', 'null', '测试2', '2017-06-02 14:01:35', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('120', '开放平台单卡启用', 'null', '侧是', '2017-06-02 14:02:13', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('121', '开放平台批量停用', 'null', null, '2017-06-02 15:20:22', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('122', '开放平台批量启用', 'null', null, '2017-06-02 15:38:34', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('123', '开放平台单卡停用', 'null', '测试', '2017-06-02 16:28:27', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('124', '开放平台单卡启用', 'null', 'Test', '2017-06-05 11:34:30', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('125', '开放平台单卡启用', 'null', 'Test', '2017-06-05 11:34:36', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('126', '开放平台单卡启用', 'null', '8986061602003133036   启用', '2017-06-05 14:07:19', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('127', '开放平台单卡停用', 'null', '8986061602003133036停用', '2017-06-05 14:08:12', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('128', '开放平台单卡启用', 'null', '测试测试测试6-5', '2017-06-05 14:09:57', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('129', '开放平台单卡启用', 'null', '没', '2017-06-05 14:12:23', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('130', '开放平台单卡停用', 'null', 'test', '2017-06-05 14:13:33', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('131', '开放平台单卡启用', 'null', 'test', '2017-06-05 14:21:06', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('132', '开放平台单卡停用', 'null', '111', '2017-06-05 14:23:35', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('133', '开放平台单卡启用', 'null', '1111', '2017-06-05 14:24:05', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('134', '开放平台单卡启用', 'null', '测试测试', '2017-06-05 17:25:33', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('135', '开放平台单卡停用', 'null', '测试哥斯达黎加', '2017-06-05 17:25:46', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('136', '开放平台单卡停用', 'null', '另', '2017-06-05 18:33:18', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('137', '开放平台单卡启用', 'null', '测试测试测试', '2017-06-05 18:33:37', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('138', '开放平台单卡启用', 'null', '测试测试', '2017-06-06 15:05:56', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('139', '开放平台单卡停用', 'null', '测试测试123', '2017-06-06 15:38:31', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('140', '开放平台单卡启用', 'null', 'test-on', '2017-06-06 16:29:43', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('141', '开放平台单卡停用', 'null', 'test_outtime', '2017-06-06 17:31:34', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('142', '开放平台单卡启用', 'null', '123', '2017-06-06 17:32:59', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('143', '开放平台单卡停用', 'null', 'test_outtime', '2017-06-06 17:34:31', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('144', '开放平台单卡停用', '[{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000039\",\"errorcode\":4294967295}]', '12', '2017-06-07 14:06:26', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('145', '开放平台单卡停用', '[{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000039\",\"errorcode\":4294967295}]', '12', '2017-06-07 14:06:30', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('146', '开放平台批量启用', 'null', null, '2017-06-07 14:13:40', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('147', '开放平台批量启用', 'null', null, '2017-06-07 14:13:41', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('148', '开放平台批量停用', 'null', null, '2017-06-07 14:17:27', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('149', '开放平台批量启用', 'null', null, '2017-06-07 15:14:42', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('150', '开放平台单卡启用', 'null', '测试黄美红', '2017-06-07 16:52:48', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('151', '开放平台单卡停用', 'null', '测试67黄美红', '2017-06-07 16:54:39', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('152', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:56:30', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('153', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:56:36', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('154', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:56:38', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('155', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:56:38', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('156', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:56:38', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('157', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:56:38', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('158', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:56:54', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('159', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:56:56', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('160', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:56:56', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('161', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:56:56', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('162', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:56:56', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('163', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:56:56', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('164', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:57:10', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('165', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:57:12', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('166', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:57:12', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('167', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:57:12', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('168', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:57:12', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('169', '开放平台单卡启用', 'null', '测试6-12', '2017-06-12 16:57:12', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('170', '开放平台单卡停用', 'null', '测试6-123', '2017-06-12 16:57:19', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('171', '开放平台单卡启用', 'null', '测试huang', '2017-06-12 16:57:56', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('172', '开放平台单卡启用', 'null', '测试huang', '2017-06-12 16:58:10', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('173', '开放平台单卡启用', 'null', '测试huang', '2017-06-12 16:58:10', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('174', '开放平台单卡启用', 'null', '测试huang', '2017-06-12 16:58:10', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('175', '开放平台单卡启用', 'null', '测试huang', '2017-06-12 16:58:12', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('176', '开放平台单卡启用', 'null', '测试huang', '2017-06-12 16:58:12', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('177', '开放平台单卡启用', 'null', '测试huang', '2017-06-12 16:58:12', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('178', '开放平台单卡启用', 'null', '测试huang', '2017-06-12 16:58:26', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('179', '开放平台单卡启用', 'null', '测试huang', '2017-06-12 16:58:26', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('180', '开放平台单卡启用', 'null', '测试huang', '2017-06-12 16:58:26', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('181', '开放平台单卡启用', 'null', 'teset', '2017-06-12 17:01:42', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('182', '开放平台单卡启用', 'null', 'test', '2017-06-12 17:02:34', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('183', '开放平台单卡启用', 'null', '套餐服务到期', '2017-06-12 17:02:47', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('184', '开放平台单卡启用', 'null', 'test', '2017-06-12 17:02:48', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('185', '开放平台批量停用', '[{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000126\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000134\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000133\",\"errorcode\":4294967295}]', null, '2017-06-12 17:05:29', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('186', '开放平台批量停用', '[{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000126\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000134\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000133\",\"errorcode\":4294967295}]', null, '2017-06-12 17:05:37', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('187', '开放平台批量停用', '[{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000126\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000134\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000133\",\"errorcode\":4294967295}]', null, '2017-06-12 17:06:16', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('188', '开放平台单卡启用', 'null', 'aaa', '2017-06-12 17:06:46', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('189', '开放平台单卡停用', 'null', '测试停用原因', '2017-06-13 10:47:21', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('190', '开放平台单卡停用', 'null', '测试停用原因', '2017-06-13 10:47:24', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('191', '单卡启用', 'null', '123', '2017-06-13 10:52:01', '0', null);
INSERT INTO `flowmgn_api_optlog` VALUES ('192', '开放平台单卡停用', 'null', '测试停用原因', '2017-06-13 10:53:18', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('193', '开放平台单卡启用', 'null', '123', '2017-06-13 10:55:19', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('194', '开放平台单卡停用', '[{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000147\",\"errorcode\":4294967295}]', '服务套餐过期', '2017-06-13 15:22:23', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('195', '开放平台单卡启用', 'null', '测试服务套餐', '2017-06-13 15:26:09', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('196', '开放平台单卡停用', 'null', '服务套餐过期', '2017-06-13 15:55:10', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('197', '开放平台批量启用', '[{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000126\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000134\",\"errorcode\":4294967295},{\"msg\":\"invalid format\",\"iccid\":\"1000000000000000133\",\"errorcode\":4294967295}]', null, '2017-06-13 16:42:51', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('198', '开放平台批量停用', 'null', null, '2017-06-13 16:44:19', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('199', '开放平台单卡启用', 'null', '测试测试测试测试测试测试', '2017-06-14 10:09:21', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('200', '开放平台单卡启用', 'null', '测试中文启用', '2017-06-14 14:54:32', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('201', '开放平台单卡停用', 'null', '测试', '2017-06-15 14:35:00', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('202', '开放平台单卡启用', 'null', '测试测试测试测试', '2017-06-15 15:02:34', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('203', '开放平台单卡停用', 'null', '服务套餐过期停用', '2017-06-15 15:02:55', '19180009', '广联赛讯');
INSERT INTO `flowmgn_api_optlog` VALUES ('204', '开放平台单卡启用', 'null', '测试测试测试', '2017-06-15 15:04:52', '19180009', '广联赛讯');

-- ----------------------------
-- Table structure for flowmgn_app_category
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_app_category`;
CREATE TABLE `flowmgn_app_category` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `sp_id` int(10) DEFAULT NULL COMMENT '所属商户',
  `cate_name` varchar(64) DEFAULT NULL COMMENT '分类名称',
  `cate_desc` varchar(256) DEFAULT NULL COMMENT '分类描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用类型定义';

-- ----------------------------
-- Records of flowmgn_app_category
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_app_def
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_app_def`;
CREATE TABLE `flowmgn_app_def` (
  `app_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `category_id` int(10) DEFAULT NULL COMMENT '所属分类',
  `app_name` varchar(64) DEFAULT NULL COMMENT '应用名称',
  `app_desc` varchar(1024) DEFAULT NULL COMMENT '应用描述',
  `app_label` varchar(256) DEFAULT NULL COMMENT '应用标签',
  `hostname` varchar(2000) DEFAULT NULL COMMENT '应用域名',
  `port` varchar(128) DEFAULT NULL COMMENT '应用端口',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户流量控制指定应用定义';

-- ----------------------------
-- Records of flowmgn_app_def
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_async_task
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_async_task`;
CREATE TABLE `flowmgn_async_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务主键',
  `task_name` varchar(255) NOT NULL COMMENT '任务名称',
  `task_desc` varchar(255) NOT NULL COMMENT '任务描述',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型：0=订单数据导出下载类型',
  `task_status` tinyint(4) NOT NULL COMMENT '任务状态：0=未执行/1=已执行',
  `task_createtime` datetime NOT NULL COMMENT '任务创建时间',
  `task_updatetime` datetime NOT NULL COMMENT '任务更新时间',
  `task_source` varchar(128) NOT NULL COMMENT '任务来源',
  `task_creator` varchar(128) NOT NULL COMMENT '任务创建者',
  `task_creator_id` varchar(64) NOT NULL COMMENT '任务创建者ID',
  `task_exec_params` varchar(2000) NOT NULL COMMENT '任务执行参数',
  `task_exec_status` tinyint(4) DEFAULT NULL COMMENT '任务执行结果状态：-1=执行失败/0=未执行/1=执行成功',
  `task_exec_result` varchar(255) NOT NULL COMMENT '任务执行结果描述（包括失败描述异常信息）',
  `task_exec_datetime` datetime DEFAULT NULL COMMENT '任务执行时间',
  `file_download_url` varchar(256) DEFAULT NULL COMMENT '文件下载路径',
  `is_download` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否下载：0=未下载/1=已下载',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 COMMENT='异步任务表';

-- ----------------------------
-- Records of flowmgn_async_task
-- ----------------------------
INSERT INTO `flowmgn_async_task` VALUES ('154', '订单下载', '订单下载', '0', '1', '2017-05-12 18:27:09', '2017-05-18 18:49:08', '流量卡开放平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":\"\"}', '1', '', '2017-05-12 18:27:09', 'http://127.0.0.1/order/123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('155', '订单下载', '订单下载', '0', '1', '2017-05-15 15:51:48', '2017-05-15 16:16:26', '流量卡开放平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":\"\"}', '1', '', '2017-05-15 15:51:49', 'http://127.0.0.1/order/123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('156', '订单下载', '订单下载', '0', '1', '2017-05-15 18:20:47', '2017-05-19 10:59:26', '流量卡开放平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":\"\"}', '1', '', '2017-05-15 18:20:48', 'http://127.0.0.1/order/123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('157', '订单下载', '订单下载', '0', '1', '2017-05-15 18:22:02', '2017-05-19 17:50:13', '流量卡开放平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":\"\"}', '1', '', '2017-05-15 18:22:02', 'http://127.0.0.1/order/123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('158', '联通卡片管理下载', '联通卡片管理下载', '1', '1', '2017-05-22 18:13:07', '2017-05-22 18:15:04', '流量管理平台', 'admin', '123456', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"packageBegintime\":\"\",\"outStockTime\":\"\",\"usedTotalflow\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\",\"curUsedBig\":0.0,\"deliveryTime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"totalSmall\":0.0,\"keyWork\":\"\"}}', '1', '', '2017-05-22 18:13:08', 'http://127.0.0.1/order/123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('159', '联通卡片管理下载', '联通卡片管理下载', '1', '1', '2017-05-22 18:13:41', '2017-05-22 18:14:53', '流量管理平台', 'admin', '123456', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"packageBegintime\":\"\",\"outStockTime\":\"\",\"usedTotalflow\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\",\"curUsedBig\":0.0,\"deliveryTime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"totalSmall\":0.0,\"keyWork\":\"\"}}', '1', '', '2017-05-22 18:13:41', 'http://127.0.0.1/order/123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('160', '购卡订单下载', '购卡订单下载', '2', '1', '2017-05-22 18:14:56', '2017-05-22 18:18:31', '流量管理平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":{\"expressPic\":\"\",\"updateTimeFormat\":\"\",\"spName\":\"\",\"expressNo\":\"\",\"totalPrice\":0,\"failReasonDesc\":\"\",\"postTime\":\"\",\"orderTime\":\"\",\"recipientsAddr\":\"\",\"failReason\":0,\"packageName\":\"\",\"outOrderName\":\"\",\"createTimeFormat\":\"\",\"cardType\":0,\"packageId\":0,\"lastOperatorId\":0,\"orderBegintime\":\"\",\"outOrderNo\":\"\",\"spCode\":\"\",\"spId\":0,\"recipientsPostcode\":\"\",\"recipientsMobileno\":\"\",\"orderEndtime\":\"\",\"keyWork\":\"\",\"outOrderDesc\":\"\",\"recipients\":\"\",\"outOrderId\":0,\"totalCard\":0,\"lastOperatorName\":\"\",\"status\":0}}', '1', '', '2017-05-22 18:14:56', 'http://127.0.0.1/order/123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('161', '联通卡片管理下载', '联通卡片管理下载', '1', '1', '2017-05-22 18:21:13', '2017-05-22 18:23:09', '流量管理平台', 'admin', '123456', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"packageBegintime\":\"\",\"outStockTime\":\"\",\"usedTotalflow\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\",\"curUsedBig\":0.0,\"deliveryTime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"totalSmall\":0.0,\"keyWork\":\"\"}}', '1', '', '2017-05-22 18:21:14', 'http://qcimg01.glsx.net:7060/oms-fcasynctask123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('162', '联通卡片管理下载', '联通卡片管理下载', '1', '1', '2017-05-22 18:22:58', '2017-05-22 18:23:21', '流量管理平台', 'admin', '123456', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"packageBegintime\":\"\",\"outStockTime\":\"\",\"usedTotalflow\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\",\"curUsedBig\":0.0,\"deliveryTime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"totalSmall\":0.0,\"keyWork\":\"\"}}', '1', '', '2017-05-22 18:22:59', 'http://qcimg01.glsx.net:7060/oms-fcasynctask/123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('163', '联通卡片管理下载', '联通卡片管理下载', '1', '1', '2017-05-22 18:39:13', '2017-05-22 18:39:40', '流量管理平台', 'admin', '123456', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"packageBegintime\":\"\",\"outStockTime\":\"\",\"usedTotalflow\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\",\"curUsedBig\":0.0,\"deliveryTime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"queryText\":\"8986061501003418237\",\"remainTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"totalSmall\":0.0,\"keyWork\":\"\"}}', '1', '', '2017-05-22 18:39:14', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//flowcard123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('164', '联通卡片管理下载', '联通卡片管理下载', '1', '1', '2017-05-22 18:45:01', '2017-05-22 18:45:28', '流量管理平台', 'admin', '123456', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"packageBegintime\":\"\",\"outStockTime\":\"\",\"usedTotalflow\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\",\"curUsedBig\":0.0,\"deliveryTime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"totalSmall\":0.0,\"keyWork\":\"\"}}', '1', '', '2017-05-22 18:45:01', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//flowcard123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('165', '购卡订单下载', '购卡订单下载', '2', '1', '2017-05-22 18:47:35', '2017-05-22 18:48:11', '流量管理平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":{\"expressPic\":\"\",\"updateTimeFormat\":\"\",\"spName\":\"\",\"expressNo\":\"\",\"totalPrice\":0,\"failReasonDesc\":\"\",\"postTime\":\"\",\"orderTime\":\"\",\"recipientsAddr\":\"\",\"failReason\":0,\"packageName\":\"\",\"outOrderName\":\"\",\"createTimeFormat\":\"\",\"cardType\":0,\"packageId\":0,\"lastOperatorId\":0,\"orderBegintime\":\"\",\"outOrderNo\":\"\",\"spCode\":\"\",\"spId\":0,\"recipientsPostcode\":\"\",\"recipientsMobileno\":\"\",\"orderEndtime\":\"\",\"keyWork\":\"\",\"outOrderDesc\":\"\",\"recipients\":\"\",\"outOrderId\":0,\"totalCard\":0,\"lastOperatorName\":\"\",\"status\":0}}', '1', '', '2017-05-22 18:47:35', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//outOrder123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('166', '购卡订单下载', '购卡订单下载', '2', '1', '2017-05-22 18:48:50', '2017-05-22 18:49:35', '流量管理平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":{\"expressPic\":\"\",\"updateTimeFormat\":\"\",\"spName\":\"\",\"expressNo\":\"\",\"totalPrice\":0,\"failReasonDesc\":\"\",\"postTime\":\"\",\"orderTime\":\"\",\"recipientsAddr\":\"\",\"failReason\":0,\"packageName\":\"\",\"outOrderName\":\"\",\"createTimeFormat\":\"\",\"cardType\":0,\"packageId\":0,\"lastOperatorId\":0,\"orderBegintime\":\"\",\"outOrderNo\":\"\",\"spCode\":\"\",\"spId\":0,\"recipientsPostcode\":\"\",\"recipientsMobileno\":\"\",\"orderEndtime\":\"\",\"keyWork\":\"\",\"outOrderDesc\":\"\",\"recipients\":\"\",\"outOrderId\":0,\"totalCard\":0,\"lastOperatorName\":\"\",\"status\":0}}', '1', '', '2017-05-22 18:48:51', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//outOrder123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('167', '购卡订单下载', '购卡订单下载', '2', '1', '2017-05-22 18:49:10', '2017-05-22 18:49:31', '流量管理平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":{\"expressPic\":\"\",\"updateTimeFormat\":\"\",\"spName\":\"\",\"expressNo\":\"\",\"totalPrice\":0,\"failReasonDesc\":\"\",\"postTime\":\"\",\"orderTime\":\"\",\"recipientsAddr\":\"\",\"failReason\":0,\"packageName\":\"\",\"outOrderName\":\"\",\"createTimeFormat\":\"\",\"cardType\":0,\"packageId\":0,\"lastOperatorId\":0,\"orderBegintime\":\"\",\"outOrderNo\":\"\",\"spCode\":\"\",\"spId\":0,\"recipientsPostcode\":\"\",\"recipientsMobileno\":\"\",\"orderEndtime\":\"\",\"keyWork\":\"\",\"outOrderDesc\":\"\",\"recipients\":\"\",\"outOrderId\":0,\"totalCard\":0,\"lastOperatorName\":\"\",\"status\":0}}', '1', '', '2017-05-22 18:49:10', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//outOrder123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('168', '联通卡片管理下载', '联通卡片管理下载', '1', '1', '2017-05-23 10:18:56', '2017-05-23 10:18:57', '流量管理平台', 'admin', '123456', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"packageBegintime\":\"\",\"outStockTime\":\"\",\"usedTotalflow\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\",\"curUsedBig\":0.0,\"deliveryTime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"totalSmall\":0.0,\"keyWork\":\"\"}}', '1', '', '2017-05-23 10:18:57', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//flowcard123456.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('169', '购卡订单下载', '购卡订单下载', '2', '1', '2017-05-23 11:36:12', '2017-05-23 11:36:12', '流量管理平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":{\"expressPic\":\"\",\"updateTimeFormat\":\"\",\"spName\":\"\",\"expressNo\":\"\",\"totalPrice\":0,\"failReasonDesc\":\"\",\"postTime\":\"\",\"orderTime\":\"\",\"recipientsAddr\":\"\",\"failReason\":0,\"packageName\":\"\",\"outOrderName\":\"\",\"createTimeFormat\":\"\",\"cardType\":0,\"packageId\":0,\"lastOperatorId\":0,\"orderBegintime\":\"\",\"outOrderNo\":\"\",\"spCode\":\"\",\"spId\":0,\"recipientsPostcode\":\"\",\"recipientsMobileno\":\"\",\"orderEndtime\":\"\",\"keyWork\":\"\",\"outOrderDesc\":\"\",\"recipients\":\"\",\"outOrderId\":0,\"totalCard\":0,\"lastOperatorName\":\"\",\"status\":0}}', '1', '', '2017-05-23 11:36:12', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//outOrder123456.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('170', '联通卡片管理下载', '联通卡片管理下载', '1', '1', '2017-05-23 13:42:06', '2017-05-23 14:01:40', '流量管理平台', 'admin', '123456', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"packageBegintime\":\"\",\"outStockTime\":\"\",\"usedTotalflow\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\",\"curUsedBig\":0.0,\"deliveryTime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"totalSmall\":0.0,\"keyWork\":\"\"}}', '1', '', '2017-05-23 13:42:06', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//flowcard123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('171', '联通卡片管理下载', '联通卡片管理下载', '1', '1', '2017-05-23 14:58:12', '2017-05-23 14:58:12', '流量管理平台', 'admin', '123456', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"packageBegintime\":\"\",\"outStockTime\":\"\",\"usedTotalflow\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\",\"curUsedBig\":0.0,\"deliveryTime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"totalSmall\":0.0,\"keyWork\":\"\"}}', '1', '', '2017-05-23 14:58:12', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//flowcard123456.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('172', '联通卡片管理下载', '联通卡片管理下载', '1', '1', '2017-05-23 14:58:34', '2017-05-23 14:58:34', '流量管理平台', 'admin', '123456', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"packageBegintime\":\"\",\"outStockTime\":\"\",\"usedTotalflow\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\",\"curUsedBig\":0.0,\"deliveryTime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"totalSmall\":0.0,\"keyWork\":\"\"}}', '1', '', '2017-05-23 14:58:34', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//flowcard123456.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('173', '购卡订单下载', '购卡订单下载', '2', '1', '2017-05-23 14:58:50', '2017-05-23 15:03:13', '流量管理平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":{\"expressPic\":\"\",\"updateTimeFormat\":\"\",\"spName\":\"\",\"expressNo\":\"\",\"totalPrice\":0,\"failReasonDesc\":\"\",\"postTime\":\"\",\"orderTime\":\"\",\"recipientsAddr\":\"\",\"failReason\":0,\"packageName\":\"\",\"outOrderName\":\"\",\"createTimeFormat\":\"\",\"cardType\":0,\"packageId\":0,\"lastOperatorId\":0,\"orderBegintime\":\"\",\"outOrderNo\":\"\",\"spCode\":\"\",\"spId\":0,\"recipientsPostcode\":\"\",\"recipientsMobileno\":\"\",\"orderEndtime\":\"\",\"keyWork\":\"\",\"outOrderDesc\":\"\",\"recipients\":\"\",\"outOrderId\":0,\"totalCard\":0,\"lastOperatorName\":\"\",\"status\":0}}', '1', '', '2017-05-23 14:58:50', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//outOrder123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('174', '购卡订单下载', '购卡订单下载', '2', '1', '2017-05-23 15:00:41', '2017-05-23 15:00:41', '流量管理平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":{\"expressPic\":\"\",\"updateTimeFormat\":\"\",\"spName\":\"\",\"expressNo\":\"\",\"totalPrice\":0,\"failReasonDesc\":\"\",\"postTime\":\"\",\"orderTime\":\"\",\"recipientsAddr\":\"\",\"failReason\":0,\"packageName\":\"\",\"outOrderName\":\"\",\"createTimeFormat\":\"\",\"cardType\":0,\"packageId\":0,\"lastOperatorId\":0,\"orderBegintime\":\"\",\"outOrderNo\":\"\",\"spCode\":\"\",\"spId\":0,\"recipientsPostcode\":\"\",\"recipientsMobileno\":\"\",\"orderEndtime\":\"\",\"keyWork\":\"\",\"outOrderDesc\":\"\",\"recipients\":\"\",\"outOrderId\":0,\"totalCard\":0,\"lastOperatorName\":\"\",\"status\":0}}', '1', '', '2017-05-23 15:00:41', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//outOrder123456.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('175', '购卡订单下载', '购卡订单下载', '2', '1', '2017-05-23 16:44:08', '2017-05-23 16:44:08', '流量管理平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":{\"expressPic\":\"\",\"updateTimeFormat\":\"\",\"spName\":\"\",\"expressNo\":\"\",\"totalPrice\":0,\"failReasonDesc\":\"\",\"postTime\":\"\",\"orderTime\":\"\",\"recipientsAddr\":\"\",\"failReason\":0,\"packageName\":\"\",\"outOrderName\":\"\",\"createTimeFormat\":\"\",\"cardType\":0,\"packageId\":0,\"lastOperatorId\":0,\"orderBegintime\":\"\",\"outOrderNo\":\"\",\"spCode\":\"\",\"spId\":0,\"recipientsPostcode\":\"\",\"recipientsMobileno\":\"\",\"orderEndtime\":\"\",\"keyWork\":\"\",\"outOrderDesc\":\"\",\"recipients\":\"\",\"outOrderId\":0,\"totalCard\":0,\"lastOperatorName\":\"\",\"status\":0}}', '1', '', '2017-05-23 16:44:08', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//outOrder123456.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('176', '购卡订单下载', '购卡订单下载', '2', '1', '2017-05-24 11:11:40', '2017-05-24 11:11:40', '流量管理平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":{\"expressPic\":\"\",\"updateTimeFormat\":\"\",\"spName\":\"\",\"expressNo\":\"\",\"totalPrice\":0,\"failReasonDesc\":\"\",\"postTime\":\"\",\"orderTime\":\"\",\"recipientsAddr\":\"\",\"failReason\":0,\"packageName\":\"\",\"outOrderName\":\"\",\"createTimeFormat\":\"\",\"cardType\":0,\"packageId\":0,\"lastOperatorId\":0,\"orderBegintime\":\"\",\"outOrderNo\":\"\",\"spCode\":\"\",\"spId\":0,\"recipientsPostcode\":\"\",\"recipientsMobileno\":\"\",\"orderEndtime\":\"\",\"keyWork\":\"\",\"outOrderDesc\":\"\",\"recipients\":\"\",\"outOrderId\":0,\"totalCard\":0,\"lastOperatorName\":\"\",\"status\":0}}', '1', '', '2017-05-24 11:11:40', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//outOrder123456.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('177', '联通卡片管理下载', '联通卡片管理下载', '1', '1', '2017-05-24 14:11:53', '2017-05-24 18:00:43', '流量管理平台', 'admin', '123456', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"packageBegintime\":\"\",\"outStockTime\":\"\",\"usedTotalflow\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\",\"curUsedBig\":0.0,\"deliveryTime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"totalSmall\":0.0,\"keyWork\":\"\"}}', '1', '', '2017-05-24 14:11:53', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//flowcard123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('178', '购卡订单下载', '购卡订单下载', '2', '1', '2017-05-24 14:12:09', '2017-05-24 14:12:10', '流量管理平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":{\"expressPic\":\"\",\"updateTimeFormat\":\"\",\"spName\":\"\",\"expressNo\":\"\",\"totalPrice\":0,\"failReasonDesc\":\"\",\"postTime\":\"\",\"orderTime\":\"\",\"recipientsAddr\":\"\",\"failReason\":0,\"packageName\":\"\",\"outOrderName\":\"\",\"createTimeFormat\":\"\",\"cardType\":0,\"packageId\":0,\"lastOperatorId\":0,\"orderBegintime\":\"\",\"outOrderNo\":\"\",\"spCode\":\"\",\"spId\":0,\"recipientsPostcode\":\"\",\"recipientsMobileno\":\"\",\"orderEndtime\":\"\",\"keyWork\":\"\",\"outOrderDesc\":\"\",\"recipients\":\"\",\"outOrderId\":0,\"totalCard\":0,\"lastOperatorName\":\"\",\"status\":0}}', '1', '', '2017-05-24 14:12:10', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//outOrder123456.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('179', '购卡订单下载', '购卡订单下载', '2', '1', '2017-05-24 18:02:00', '2017-05-24 18:02:00', '流量管理平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":{\"expressPic\":\"\",\"updateTimeFormat\":\"\",\"spName\":\"\",\"expressNo\":\"\",\"totalPrice\":0,\"failReasonDesc\":\"\",\"postTime\":\"\",\"orderTime\":\"\",\"recipientsAddr\":\"\",\"failReason\":0,\"packageName\":\"\",\"outOrderName\":\"\",\"createTimeFormat\":\"\",\"cardType\":0,\"packageId\":0,\"lastOperatorId\":0,\"orderBegintime\":\"\",\"outOrderNo\":\"\",\"spCode\":\"\",\"spId\":0,\"recipientsPostcode\":\"\",\"recipientsMobileno\":\"\",\"orderEndtime\":\"\",\"keyWork\":\"\",\"outOrderDesc\":\"\",\"recipients\":\"\",\"outOrderId\":0,\"totalCard\":0,\"lastOperatorName\":\"\",\"status\":0}}', '1', '', '2017-05-24 18:02:00', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//outOrder123456.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('180', '联通卡片管理下载', '联通卡片管理下载', '1', '1', '2017-05-25 17:18:53', '2017-05-25 17:19:43', '流量管理平台', 'admin', '123456', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"packageBegintime\":\"\",\"outStockTime\":\"\",\"usedTotalflow\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\",\"curUsedBig\":0.0,\"deliveryTime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"queryText\":\"\",\"remainTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"totalSmall\":0.0,\"keyWork\":\"\"}}', '1', '', '2017-05-25 17:18:54', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//flowcard123456.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('181', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-05-26 15:31:14', '2017-05-26 15:31:44', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"curUsedBig\":0.0,\"packageBegintime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"queryText\":\"\",\"remainTotalflow\":0.0,\"usedTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"totalSmall\":0.0,\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\"}}', '1', '', '2017-05-26 15:31:15', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('182', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-05-26 17:36:14', '2017-05-26 17:36:15', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"curUsedBig\":0.0,\"packageBegintime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"queryText\":\"\",\"remainTotalflow\":0.0,\"usedTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"totalSmall\":0.0,\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\"}}', '1', '', '2017-05-26 17:36:15', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('183', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-05-27 10:29:03', '2017-05-27 10:29:03', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"curUsedBig\":0.0,\"packageBegintime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"usedTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"totalSmall\":0.0,\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\"}}', '1', '', '2017-05-27 10:29:03', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('185', '订单下载', '订单下载', '0', '1', '2017-05-27 10:30:47', '2017-05-27 10:30:47', '流量卡开放平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":\"\"}', '1', '', '2017-05-27 10:30:47', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//order123456.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('186', '订单下载', '订单下载', '0', '1', '2017-06-01 09:39:34', '2017-06-01 09:39:34', '流量卡开放平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":\"\"}', '1', '', '2017-06-01 09:39:34', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//order123456.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('187', '订单下载', '订单下载', '0', '1', '2017-06-01 09:55:53', '2017-06-01 09:55:53', '流量卡开放平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":\"\"}', '1', '', '2017-06-01 09:55:53', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//order123456.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('188', '订单下载', '订单下载', '0', '1', '2017-06-01 10:00:30', '2017-06-01 10:00:30', '流量卡开放平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":\"\"}', '1', '', '2017-06-01 10:00:30', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//order123456.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('189', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-02 11:42:27', '2017-06-02 13:32:25', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"curUsedBig\":0.0,\"packageBegintime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"usedTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"totalSmall\":0.0,\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\"}}', '1', '', '2017-06-02 11:42:27', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('190', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-02 11:44:01', '2017-06-02 13:32:37', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"curUsedBig\":0.0,\"packageBegintime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"usedTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"totalSmall\":0.0,\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\"}}', '1', '', '2017-06-02 11:44:01', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('191', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-02 11:49:06', '2017-06-05 11:18:35', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"curUsedBig\":0.0,\"packageBegintime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"queryText\":\"8986061602003133036\",\"remainTotalflow\":0.0,\"usedTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"totalSmall\":0.0,\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\"}}', '1', '', '2017-06-02 11:49:06', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('192', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-02 13:33:31', '2017-06-02 13:41:33', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"curUsedBig\":0.0,\"packageBegintime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"usedTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"totalSmall\":0.0,\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\"}}', '1', '', '2017-06-02 13:33:32', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('193', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-02 13:39:04', '2017-06-02 13:41:24', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"curUsedBig\":0.0,\"packageBegintime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"queryText\":\"8986061501001356722\",\"remainTotalflow\":0.0,\"usedTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"totalSmall\":0.0,\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\"}}', '1', '', '2017-06-02 13:39:04', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('194', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-02 13:41:01', '2017-06-05 11:17:01', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"curUsedBig\":0.0,\"packageBegintime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"queryText\":\"98606160200313303\",\"remainTotalflow\":0.0,\"usedTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"totalSmall\":0.0,\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\"}}', '1', '', '2017-06-02 13:41:01', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('195', '订单下载', '订单下载', '0', '1', '2017-06-02 16:01:26', '2017-06-02 16:01:26', '流量卡开放平台', 'admin', '123456', '{\"template\":\"order.xml\",\"kewWork\":\"\"}', '1', '', '2017-06-02 16:01:26', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//order123456.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('196', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-05 14:16:48', '2017-06-05 14:16:48', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"curUsedBig\":0.0,\"packageBegintime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"usedTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"totalSmall\":0.0,\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\"}}', '1', '', '2017-06-05 14:16:48', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('197', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-05 14:54:15', '2017-06-05 14:54:40', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"curUsedBig\":0.0,\"packageBegintime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"queryText\":\"\",\"remainTotalflow\":0.0,\"usedTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"totalSmall\":0.0,\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\"}}', '1', '', '2017-06-05 14:54:16', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('198', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-05 16:25:50', '2017-06-05 16:33:13', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"curUsedBig\":0.0,\"packageBegintime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"queryText\":\"\",\"remainTotalflow\":0.0,\"usedTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"totalSmall\":0.0,\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\"}}', '1', '', '2017-06-05 16:25:50', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('199', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-05 16:32:39', '2017-06-05 16:33:11', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"curUsedBig\":0.0,\"packageBegintime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"usedTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"totalSmall\":0.0,\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\"}}', '1', '', '2017-06-05 16:32:39', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('200', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-05 16:33:18', '2017-06-05 16:55:31', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"curUsedBig\":0.0,\"packageBegintime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"usedTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"totalSmall\":0.0,\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\"}}', '1', '', '2017-06-05 16:33:18', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('201', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-05 16:34:12', '2017-06-05 16:55:40', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"curUsedBig\":0.0,\"packageBegintime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"usedTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"totalSmall\":0.0,\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\"}}', '1', '', '2017-06-05 16:34:12', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('202', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-05 16:37:45', '2017-06-05 16:52:32', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"totalFlow\":0.0,\"curUsedBig\":0.0,\"packageBegintime\":\"\",\"totalBig\":0.0,\"remainSmall\":0.0,\"remainTotalflow\":0.0,\"usedTotalflow\":0.0,\"curUsedSmall\":0.0,\"usedSmall\":0.0,\"activeTime\":\"\",\"packageEndtime\":\"\",\"totalSmall\":0.0,\"remainBig\":0.0,\"consumeMonthflow\":0.0,\"usedBig\":0.0,\"inStockTime\":\"\"}}', '1', '', '2017-06-05 16:37:45', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('203', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-05 16:53:45', '2017-06-05 16:55:13', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"packageBegintime\":\"\",\"queryText\":\"8986061602003133036\",\"activeTime\":\"\",\"packageEndtime\":\"\",\"inStockTime\":\"\"}}', '1', '', '2017-06-05 16:53:46', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009_1496652826.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('204', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-05 16:54:30', '2017-06-05 16:55:01', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"packageBegintime\":\"\",\"queryText\":\"\",\"activeTime\":\"\",\"packageEndtime\":\"\",\"inStockTime\":\"\"}}', '1', '', '2017-06-05 16:54:30', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009_1496652870.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('205', '订单下载', '订单下载', '0', '1', '2017-06-06 10:58:53', '2017-06-06 10:59:47', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3}}', '1', '', '2017-06-06 10:58:54', 'http://qcimg01.glsx.net:7060/oms-fcasynctask/19180009_1496717933.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('206', '订单下载', '订单下载', '0', '1', '2017-06-06 10:59:08', '2017-06-06 11:00:57', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3}}', '1', '', '2017-06-06 10:59:08', 'http://qcimg01.glsx.net:7060/oms-fcasynctask/19180009_1496717948.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('207', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-06 11:06:59', '2017-06-06 11:11:28', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"packageBegintime\":\"\",\"activeTime\":\"\",\"packageEndtime\":\"\",\"inStockTime\":\"\"}}', '1', '', '2017-06-06 11:07:00', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009_1496718420.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('208', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-06 11:07:43', '2017-06-06 11:07:53', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"packageBegintime\":\"\",\"queryText\":\"8986061602003133036\",\"activeTime\":\"\",\"packageEndtime\":\"\",\"inStockTime\":\"\"}}', '1', '', '2017-06-06 11:07:43', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009_1496718463.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('209', '订单下载', '订单下载', '0', '1', '2017-06-06 17:28:32', '2017-06-06 17:28:43', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3}}', '1', '', '2017-06-06 17:28:32', 'http://qcimg01.glsx.net:7060/oms-fcasynctask/19180009_1496741312.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('210', '订单下载', '订单下载', '0', '1', '2017-06-06 18:20:52', '2017-06-06 18:20:52', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3,\"keyWork\":\"\"}}', '1', '', '2017-06-06 18:20:52', 'http://qcimg01.glsx.net:7060/oms-fcasynctask/19180009_1496744452.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('211', '订单下载', '订单下载', '0', '1', '2017-06-06 18:21:00', '2017-06-06 18:21:12', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3}}', '1', '', '2017-06-06 18:21:01', 'http://qcimg01.glsx.net:7060/oms-fcasynctask/19180009_1496744460.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('212', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-07 10:54:12', '2017-06-07 10:54:26', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"packageBegintime\":\"\",\"queryText\":\"123\",\"activeTime\":\"\",\"packageEndtime\":\"\",\"inStockTime\":\"\"}}', '1', '', '2017-06-07 10:54:12', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009_1496804052.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('213', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-07 11:02:09', '2017-06-07 11:02:21', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"packageBegintime\":\"\",\"queryText\":\"已启用高级搜索\",\"activeTime\":\"\",\"packageEndtime\":\"\",\"inStockTime\":\"\",\"status\":5}}', '1', '', '2017-06-07 11:02:10', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009_1496804530.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('214', '订单下载', '订单下载', '0', '1', '2017-06-07 14:26:34', '2017-06-07 14:26:47', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3,\"keyWork\":\"\"}}', '1', '', '2017-06-07 14:26:35', 'http://qcimg01.glsx.net:7060/oms-fcasynctask/19180009_1496816795.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('215', '订单下载', '订单下载', '0', '1', '2017-06-07 15:38:02', '2017-06-07 15:38:09', '流量卡开放平台', '微信开发环境', '100000', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":2}}', '1', '', '2017-06-07 15:38:02', 'http://qcimg01.glsx.net:7060/oms-fcasynctask/100000_1496821082.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('216', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-07 15:39:33', '2017-06-07 15:39:38', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"packageBegintime\":\"\",\"queryText\":\"1000000000000000089\",\"activeTime\":\"\",\"packageEndtime\":\"\",\"inStockTime\":\"\"}}', '1', '', '2017-06-07 15:39:33', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009_1496821173.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('217', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-07 15:43:59', '2017-06-07 15:43:59', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"packageBegintime\":\"\",\"queryText\":\"8986061602003133036\",\"activeTime\":\"\",\"packageEndtime\":\"\",\"inStockTime\":\"\"}}', '1', '', '2017-06-07 15:43:59', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009_1496821439.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('218', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-07 15:46:28', '2017-06-07 15:46:36', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"packageBegintime\":\"\",\"queryText\":\"已启用高级搜索\",\"activeTime\":\"\",\"packageEndtime\":\"\",\"inStockTime\":\"\",\"status\":5}}', '1', '', '2017-06-07 15:46:28', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009_1496821588.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('219', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-07 16:08:36', '2017-06-07 16:08:51', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"packageBegintime\":\"\",\"queryText\":\"\",\"activeTime\":\"\",\"packageEndtime\":\"\",\"inStockTime\":\"\"}}', '1', '', '2017-06-07 16:08:38', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009_1496822918.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('220', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-07 17:45:30', '2017-06-07 17:45:55', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"packageBegintime\":\"\",\"activeTime\":\"\",\"packageEndtime\":\"\",\"inStockTime\":\"\"}}', '1', '', '2017-06-07 17:45:30', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009_1496828730.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('221', '订单下载', '订单下载', '0', '1', '2017-06-08 17:19:08', '2017-06-08 17:19:31', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3,\"keyWork\":\"1706071054597813\"}}', '1', '', '2017-06-08 17:19:09', 'http://qcimg01.glsx.net:7060/oms-fcasynctask/19180009_1496913549.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('222', '订单下载', '订单下载', '0', '1', '2017-06-12 16:51:13', '2017-06-12 16:51:20', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3}}', '1', '', '2017-06-12 16:51:15', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//order19180009_1497257474.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('223', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-12 17:35:13', '2017-06-12 17:35:15', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"packageBegintime\":\"\",\"activeTime\":\"\",\"packageEndtime\":\"\",\"spId\":3,\"inStockTime\":\"\"}}', '1', '', '2017-06-12 17:35:15', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009_1497260114.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('224', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-13 10:32:43', '2017-06-13 10:32:53', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"packageBegintime\":\"\",\"queryText\":\"已启用高级搜索\",\"activeTime\":\"\",\"packageEndtime\":\"\",\"spId\":3,\"inStockTime\":\"\",\"status\":5}}', '1', '', '2017-06-13 10:32:46', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009_1497321164.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('225', '订单下载', '订单下载', '0', '1', '2017-06-13 11:46:42', '2017-06-13 11:46:57', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3}}', '1', '', '2017-06-13 11:46:43', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//order19180009_1497325603.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('226', '订单下载', '订单下载', '0', '1', '2017-06-13 13:51:30', '2017-06-13 13:51:30', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3}}', '1', '', '2017-06-13 13:51:30', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//order19180009_1497333090.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('227', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-13 13:51:40', '2017-06-13 13:51:40', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"packageBegintime\":\"\",\"activeTime\":\"\",\"packageEndtime\":\"\",\"spId\":3,\"inStockTime\":\"\"}}', '1', '', '2017-06-13 13:51:40', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009_1497333100.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('228', '订单下载', '订单下载', '0', '1', '2017-06-13 14:07:00', '2017-06-13 14:07:01', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3,\"keyWork\":\"\"}}', '1', '', '2017-06-13 14:07:01', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//order19180009_1497334021.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('229', '订单下载', '订单下载', '0', '1', '2017-06-13 14:07:12', '2017-06-13 14:07:12', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3,\"keyWork\":\"1706121650476509\"}}', '1', '', '2017-06-13 14:07:12', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//order19180009_1497334032.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('230', '订单下载', '订单下载', '0', '1', '2017-06-13 14:07:20', '2017-06-13 14:07:37', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"outOrderNo\":\"1706121650476509\",\"spId\":3,\"keyWork\":\"已启用高级搜索\"}}', '1', '', '2017-06-13 14:07:22', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//order19180009_1497334041.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('231', '订单下载', '订单下载', '0', '1', '2017-06-13 14:17:47', '2017-06-13 14:17:47', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3}}', '1', '', '2017-06-13 14:17:47', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//order19180009_1497334667.xlsx', '0');
INSERT INTO `flowmgn_async_task` VALUES ('232', '订单下载', '订单下载', '0', '1', '2017-06-13 15:25:46', '2017-06-13 15:27:22', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3}}', '1', '', '2017-06-13 15:25:47', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//order19180009_1497338746.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('233', '订单下载', '订单下载', '0', '1', '2017-06-13 15:32:41', '2017-06-13 15:32:51', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3,\"keyWork\":\"1706131439242611\"}}', '1', '', '2017-06-13 15:32:42', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//order19180009_1497339162.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('234', '订单下载', '订单下载', '0', '1', '2017-06-13 15:33:32', '2017-06-13 15:33:42', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3,\"keyWork\":\"23123\"}}', '1', '', '2017-06-13 15:33:33', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//order19180009_1497339213.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('235', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-13 15:56:55', '2017-06-13 15:57:07', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"packageBegintime\":\"\",\"queryText\":\"\",\"activeTime\":\"\",\"packageEndtime\":\"\",\"spId\":3,\"inStockTime\":\"\"}}', '1', '', '2017-06-13 15:56:56', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009_1497340615.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('236', '联通卡片管理下载', '联通卡片管理下载', '3', '1', '2017-06-13 15:57:39', '2017-06-13 15:57:49', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"packageBegintime\":\"\",\"queryText\":\"460063021063237\",\"activeTime\":\"\",\"packageEndtime\":\"\",\"spId\":3,\"inStockTime\":\"\"}}', '1', '', '2017-06-13 15:57:39', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//fcflowcard19180009_1497340659.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('237', '订单下载', '订单下载', '0', '1', '2017-06-15 11:05:53', '2017-06-15 11:06:25', '流量卡开放平台', '广联赛讯', '19180009', '{\"template\":\"order.xml\",\"kewWork\":{\"orderTime\":\"\",\"spId\":3}}', '1', '', '2017-06-15 11:05:53', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//order19180009_1497495953.xlsx', '1');
INSERT INTO `flowmgn_async_task` VALUES ('239', '库存卡列表下载', '库存卡列表下载', '4', '1', '2017-06-19 16:07:36', '2017-06-19 16:07:37', '流量管理平台', 'admin', '123456', '{\"template\":\"flowcard.xml\",\"kewWork\":{\"deliveryTime\":\"\",\"keyWork\":\"\"}}', '1', '', '2017-06-19 16:07:37', 'http://qcimg01.glsx.net:7060/oms-fcasynctask//stockcard123456_1497859657.xlsx', '0');

-- ----------------------------
-- Table structure for flowmgn_cardinfo_change_log
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_cardinfo_change_log`;
CREATE TABLE `flowmgn_cardinfo_change_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `card_id` int(10) DEFAULT '0' COMMENT '流量卡ID',
  `iccid` varchar(64) NOT NULL COMMENT 'ICCID',
  `change_type` varchar(32) NOT NULL COMMENT '变更类型:库存状态XXX;业务状态XXX;是否实名认证XX;业务状态XXX;有效期续费;流量续费;',
  `change_before` varchar(32) NOT NULL COMMENT '变更前状态，状态的文字描述:已出库/已入库/运营开卡/已激活/是/已停机/已销卡/续费期数3个月/续费50M',
  `change_after` varchar(32) NOT NULL COMMENT '变更后状态，状态的文字描述;状态的文字描述:已出库/已入库/运营开卡/已激活/是/已停机/已销卡/续费期数3个月/续费50M',
  `change_time` datetime NOT NULL COMMENT '变更时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '操作人名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流量卡变更日志';

-- ----------------------------
-- Records of flowmgn_cardinfo_change_log
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_cardpostage_log
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_cardpostage_log`;
CREATE TABLE `flowmgn_cardpostage_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `card_id` int(10) NOT NULL COMMENT '卡ID',
  `pre_postageid` int(10) NOT NULL DEFAULT '0' COMMENT '前一个资费计划id',
  `cur_postageid` int(10) NOT NULL DEFAULT '0' COMMENT '当前资费计划id',
  `postage_begin` datetime DEFAULT NULL COMMENT '当前资费计划开始时间',
  `postage_end` datetime DEFAULT NULL COMMENT '当前资费计划结束时间',
  `change_time` datetime DEFAULT NULL COMMENT '资费计划变更时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `card_id` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资费计划变更记录';

-- ----------------------------
-- Records of flowmgn_cardpostage_log
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_cardstatus_log
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_cardstatus_log`;
CREATE TABLE `flowmgn_cardstatus_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `iccidn` varchar(32) DEFAULT NULL COMMENT '卡唯一识别码',
  `card_id` varchar(64) NOT NULL COMMENT '卡ID',
  `op_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '卡的操作状态:0=开卡/1=停卡/2=销卡',
  `status_change_reason_id` int(8) DEFAULT '0' COMMENT '卡状态变更原因id, 0:空 1:运营商停机 2:流量超出 3:有效期过期 4:其他原因（如商户操作停卡）',
  `op_reason` varchar(64) DEFAULT NULL COMMENT '操作原因',
  `op_success_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '操作成功状态:0=成功/1=失败',
  `op_fail_reason` varchar(32) DEFAULT NULL COMMENT '操作失败原因',
  `op_time` datetime NOT NULL COMMENT '操作时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '操作人名称',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COMMENT='流量卡操作状态变更日志';

-- ----------------------------
-- Records of flowmgn_cardstatus_log
-- ----------------------------
INSERT INTO `flowmgn_cardstatus_log` VALUES ('1', null, '1', '4', '0', null, '1', '', '2017-04-22 12:31:42', '2017-04-22 12:31:42', '2017-04-22 12:31:42', '0', 'admin');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('2', null, '1', '5', '0', null, '1', '', '2017-04-27 17:13:47', '2017-04-27 17:13:47', '2017-04-27 17:13:47', '0', 'admin');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('3', null, '1', '5', '0', null, '1', '', '2017-04-28 00:00:05', '2017-04-28 00:00:05', '2017-04-28 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('4', null, '3', '5', '0', null, '1', '', '2017-04-29 00:00:02', '2017-04-29 00:00:02', '2017-04-29 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('5', '89860616020031330397', '35', '1', '0', '流量用完，套餐已过期', '0', '', '2017-05-26 00:00:04', '2017-05-26 00:00:04', '2017-05-26 00:00:04', '0', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('6', '89860615010034182375', '248', '0', '0', '', '0', '', '2017-05-26 14:55:44', '2017-05-26 14:55:44', '2017-05-26 14:55:44', '0', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('7', '10000000000000001681', '416', '1', '0', '服务商操作', '1', 'invalid format', '2017-05-26 14:58:29', '2017-05-26 14:58:29', '2017-05-26 14:58:29', '0', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('8', '89860615010034182375', '248', '0', '0', '', '0', '', '2017-05-26 16:04:21', '2017-05-26 16:04:21', '2017-05-26 16:04:21', '0', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('9', '89860615010034182375', '248', '1', '4', '测试', '0', '', '2017-05-27 15:23:23', '2017-05-27 15:23:23', '2017-05-27 15:23:23', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('10', '89860615010034182375', '248', '0', '0', '测试', '0', '', '2017-05-27 15:24:24', '2017-05-27 15:24:24', '2017-05-27 15:24:24', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('11', '89860617020016357083', '27', '0', '0', '', '0', '', '2017-05-28 00:00:03', '2017-05-28 00:00:03', '2017-05-28 00:00:03', '0', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('12', '89860616020031330363', '34', '0', '0', '????', '0', '', '2017-06-01 11:32:42', '2017-06-01 11:32:42', '2017-06-01 11:32:42', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('13', '89860616020031330405', '32', '0', '0', '????', '0', '', '2017-06-01 14:34:54', '2017-06-01 14:34:54', '2017-06-01 14:34:54', '1000123', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('14', '89860616020031330405', '32', '1', '4', '????', '0', '', '2017-06-01 14:35:07', '2017-06-01 14:35:07', '2017-06-01 14:35:07', '1000123', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('15', '89860616020031330363', '34', '1', '4', '????', '0', '', '2017-06-01 16:51:10', '2017-06-01 16:51:10', '2017-06-01 16:51:10', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('16', '89860615010013567224', '15', '0', '0', '????????', '0', '', '2017-06-01 16:52:05', '2017-06-01 16:52:05', '2017-06-01 16:52:05', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('17', '89860616020031330363', '34', '0', '0', '????', '0', '', '2017-06-02 09:29:25', '2017-06-02 09:29:25', '2017-06-02 09:29:25', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('18', '89860616020031330363', '34', '1', '4', '????6-2', '0', '', '2017-06-02 10:06:40', '2017-06-02 10:06:40', '2017-06-02 10:06:40', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('19', '89860616020031330363', '34', '0', '0', '', '0', '', '2017-06-02 10:19:35', '2017-06-02 10:19:35', '2017-06-02 10:19:35', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('20', '89860616020016665189', '3', '0', '0', '', '0', '', '2017-06-02 10:19:35', '2017-06-02 10:19:35', '2017-06-02 10:19:35', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('21', '89860616020031330363', '34', '0', '0', '', '0', '', '2017-06-02 11:04:47', '2017-06-02 11:04:47', '2017-06-02 11:04:47', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('22', '89860615010013567224', '15', '0', '0', '', '0', '', '2017-06-02 11:04:47', '2017-06-02 11:04:47', '2017-06-02 11:04:47', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('23', '89860615010030653007', '1', '1', '4', '其他原因', '0', '', '2017-06-02 11:13:28', '2017-06-02 11:13:28', '2017-06-02 11:13:28', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('24', '89860615010030653007', '1', '1', '4', '其他原因', '0', '', '2017-06-02 11:13:32', '2017-06-02 11:13:32', '2017-06-02 11:13:32', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('25', '89860615010030653007', '1', '1', '4', '其他原因', '0', '', '2017-06-02 11:14:29', '2017-06-02 11:14:29', '2017-06-02 11:14:29', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('26', '89860616020031330363', '34', '0', '0', '测试', '0', '', '2017-06-02 13:48:52', '2017-06-02 13:48:52', '2017-06-02 13:48:52', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('27', '89860616020031330363', '34', '1', '4', '其他原因', '0', '', '2017-06-02 13:52:20', '2017-06-02 13:52:20', '2017-06-02 13:52:20', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('28', '89860616020031330363', '34', '0', '0', '', '0', '', '2017-06-02 13:52:50', '2017-06-02 13:52:50', '2017-06-02 13:52:50', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('29', '89860616020031330363', '34', '1', '4', '??2', '0', '', '2017-06-02 14:01:35', '2017-06-02 14:01:35', '2017-06-02 14:01:35', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('30', '89860616020031330363', '34', '0', '0', '??', '0', '', '2017-06-02 14:02:13', '2017-06-02 14:02:13', '2017-06-02 14:02:13', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('31', '89860615010013567224', '15', '1', '4', '其他原因', '0', '', '2017-06-02 15:20:22', '2017-06-02 15:20:22', '2017-06-02 15:20:22', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('32', '89860616020031330363', '34', '1', '4', '其他原因', '0', '', '2017-06-02 15:20:22', '2017-06-02 15:20:22', '2017-06-02 15:20:22', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('33', '89860615010030653007', '1', '0', '0', '', '0', '', '2017-06-02 15:38:34', '2017-06-02 15:38:34', '2017-06-02 15:38:34', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('34', '89860616020031330397', '35', '0', '0', '', '0', '', '2017-06-02 16:15:31', '2017-06-02 16:15:31', '2017-06-02 16:15:31', '2', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('35', '89860615010013567422', '18', '1', '4', '??', '0', '', '2017-06-02 16:28:27', '2017-06-02 16:28:27', '2017-06-02 16:28:27', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('36', '89860616020031330363', '34', '0', '0', '8986061602003133036   ??', '0', '', '2017-06-05 14:07:19', '2017-06-05 14:07:19', '2017-06-05 14:07:19', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('37', '89860616020031330363', '34', '1', '4', '8986061602003133036??', '0', '', '2017-06-05 14:08:12', '2017-06-05 14:08:12', '2017-06-05 14:08:12', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('38', '89860616020031330363', '34', '0', '0', '??????6-5', '0', '', '2017-06-05 14:09:57', '2017-06-05 14:09:57', '2017-06-05 14:09:57', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('39', '89860616020031330363', '34', '0', '0', '?', '0', '', '2017-06-05 14:12:23', '2017-06-05 14:12:23', '2017-06-05 14:12:23', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('40', '89860616020031330363', '34', '1', '4', 'test', '0', '', '2017-06-05 14:13:33', '2017-06-05 14:13:33', '2017-06-05 14:13:33', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('41', '89860616020031330363', '34', '0', '0', 'test', '0', '', '2017-06-05 14:21:06', '2017-06-05 14:21:06', '2017-06-05 14:21:06', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('42', '89860616020031330363', '34', '1', '4', '111', '0', '', '2017-06-05 14:23:35', '2017-06-05 14:23:35', '2017-06-05 14:23:35', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('43', '89860616020031330363', '34', '0', '0', '1111', '0', '', '2017-06-05 14:24:05', '2017-06-05 14:24:05', '2017-06-05 14:24:05', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('44', '89860615010013567422', '18', '0', '0', '', '0', '', '2017-06-05 15:46:10', '2017-06-05 15:46:10', '2017-06-05 15:46:10', '0', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('45', '89860615010013567224', '15', '0', '0', '????', '0', '', '2017-06-05 17:25:33', '2017-06-05 17:25:33', '2017-06-05 17:25:33', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('46', '89860615010013567224', '15', '1', '4', '???????', '0', '', '2017-06-05 17:25:46', '2017-06-05 17:25:46', '2017-06-05 17:25:46', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('47', '89860616020031330363', '34', '1', '4', '?', '0', '', '2017-06-05 18:33:18', '2017-06-05 18:33:18', '2017-06-05 18:33:18', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('48', '89860616020031330363', '34', '0', '0', '??????', '0', '', '2017-06-05 18:33:37', '2017-06-05 18:33:37', '2017-06-05 18:33:37', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('49', '89860615010030653049', '477', '0', '0', '', '0', '', '2017-06-06 00:00:06', '2017-06-06 00:00:06', '2017-06-06 00:00:06', '2', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('50', '89860616020031330397', '35', '0', '0', '????', '0', '', '2017-06-06 15:05:56', '2017-06-06 15:05:56', '2017-06-06 15:05:56', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('51', '89860615010034182375', '248', '1', '4', '????123', '0', '', '2017-06-06 15:38:31', '2017-06-06 15:38:31', '2017-06-06 15:38:31', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('52', '89860615010034182375', '248', '0', '0', 'test-on', '0', '', '2017-06-06 16:29:43', '2017-06-06 16:29:43', '2017-06-06 16:29:43', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('53', '89860615010034182375', '248', '1', '4', 'test_outtime', '0', '', '2017-06-06 17:31:34', '2017-06-06 17:31:34', '2017-06-06 17:31:34', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('54', '89860615010034182375', '248', '0', '0', '123', '0', '', '2017-06-06 17:32:59', '2017-06-06 17:32:59', '2017-06-06 17:32:59', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('55', '89860615010034182375', '248', '1', '4', 'test_outtime', '0', '', '2017-06-06 17:34:31', '2017-06-06 17:34:31', '2017-06-06 17:34:31', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('56', '89860615010034182375', '248', '0', '0', 'test', '0', '', '2017-06-06 18:12:36', '2017-06-06 18:12:36', '2017-06-06 18:12:36', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('57', '89860615010034182375', '248', '1', '4', 'aksldjfasdfa', '0', '', '2017-06-06 18:14:54', '2017-06-06 18:14:54', '2017-06-06 18:14:54', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('58', '89860615010034182375', '248', '0', '0', 'abc', '0', '', '2017-06-06 18:37:38', '2017-06-06 18:37:38', '2017-06-06 18:37:38', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('59', '89860615010034182375', '248', '1', '4', 'testsss', '0', '', '2017-06-06 18:38:10', '2017-06-06 18:38:10', '2017-06-06 18:38:10', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('60', '10000000000000000391', '518', '1', '4', '12', '1', 'invalid format', '2017-06-07 14:06:26', '2017-06-07 14:06:26', '2017-06-07 14:06:26', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('61', '10000000000000000391', '518', '1', '4', '12', '1', 'invalid format', '2017-06-07 14:06:30', '2017-06-07 14:06:30', '2017-06-07 14:06:30', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('62', '89860615010034182375', '248', '0', '0', '', '0', '', '2017-06-07 14:13:40', '2017-06-07 14:13:40', '2017-06-07 14:13:40', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('63', '89860615010013567224', '15', '0', '0', '', '0', '', '2017-06-07 14:13:40', '2017-06-07 14:13:40', '2017-06-07 14:13:40', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('64', '89860615010034182375', '248', '0', '0', '', '0', '', '2017-06-07 14:13:41', '2017-06-07 14:13:41', '2017-06-07 14:13:41', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('65', '89860615010013567224', '15', '0', '0', '', '0', '', '2017-06-07 14:13:41', '2017-06-07 14:13:41', '2017-06-07 14:13:41', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('66', '89860615010034182375', '248', '1', '4', '其他原因', '0', '', '2017-06-07 14:17:27', '2017-06-07 14:17:27', '2017-06-07 14:17:27', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('67', '89860615010013567224', '15', '1', '4', '其他原因', '0', '', '2017-06-07 14:17:27', '2017-06-07 14:17:27', '2017-06-07 14:17:27', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('68', '89860616020031330363', '34', '0', '0', '', '0', '', '2017-06-07 15:14:42', '2017-06-07 15:14:42', '2017-06-07 15:14:42', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('69', '89860616020016665189', '3', '0', '0', '', '0', '', '2017-06-07 15:14:42', '2017-06-07 15:14:42', '2017-06-07 15:14:42', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('70', '89860616020031330397', '35', '0', '0', '', '0', '', '2017-06-07 15:14:42', '2017-06-07 15:14:42', '2017-06-07 15:14:42', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('71', '89860615010034182375', '248', '0', '0', '?????', '0', '', '2017-06-07 16:52:45', '2017-06-07 16:52:45', '2017-06-07 16:52:45', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('72', '89860615010034182375', '248', '1', '4', '??67???', '0', '', '2017-06-07 16:54:37', '2017-06-07 16:54:37', '2017-06-07 16:54:37', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('73', '89860615010030653049', '477', '0', '0', '', '0', '', '2017-06-10 00:00:04', '2017-06-10 00:00:04', '2017-06-10 00:00:04', '2', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('74', '89860616020031330405', '32', '0', '0', '', '0', '', '2017-06-12 10:27:36', '2017-06-12 10:27:36', '2017-06-12 10:27:36', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('75', '89860616020002394950', '480', '0', '0', '', '0', '', '2017-06-12 11:21:20', '2017-06-12 11:21:20', '2017-06-12 11:21:20', '2', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('76', '89860617020016357091', '26', '1', '4', '其他原因', '0', '', '2017-06-12 14:30:14', '2017-06-12 14:30:14', '2017-06-12 14:30:14', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('77', '89860616020031330397', '35', '1', '4', '??6-123', '0', '', '2017-06-12 16:57:19', '2017-06-12 16:57:19', '2017-06-12 16:57:19', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('78', '89860616020031330397', '35', '0', '0', '??????', '0', '', '2017-06-12 17:02:47', '2017-06-12 17:02:47', '2017-06-12 17:02:47', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('79', '89860616020031330363', '34', '1', '4', '', '0', '', '2017-06-12 17:05:29', '2017-06-12 17:05:29', '2017-06-12 17:05:29', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('80', '10000000000000001261', '605', '1', '4', '', '1', 'invalid format', '2017-06-12 17:05:29', '2017-06-12 17:05:29', '2017-06-12 17:05:29', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('81', '10000000000000001341', '613', '1', '4', '', '1', 'invalid format', '2017-06-12 17:05:29', '2017-06-12 17:05:29', '2017-06-12 17:05:29', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('82', '10000000000000001331', '612', '1', '4', '', '1', 'invalid format', '2017-06-12 17:05:29', '2017-06-12 17:05:29', '2017-06-12 17:05:29', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('83', '89860616020031330397', '35', '1', '4', '', '0', '', '2017-06-12 17:05:29', '2017-06-12 17:05:29', '2017-06-12 17:05:29', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('84', '89860616020031330363', '34', '1', '4', '', '0', '', '2017-06-12 17:05:37', '2017-06-12 17:05:37', '2017-06-12 17:05:37', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('85', '10000000000000001261', '605', '1', '4', '', '1', 'invalid format', '2017-06-12 17:05:37', '2017-06-12 17:05:37', '2017-06-12 17:05:37', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('86', '10000000000000001341', '613', '1', '4', '', '1', 'invalid format', '2017-06-12 17:05:37', '2017-06-12 17:05:37', '2017-06-12 17:05:37', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('87', '10000000000000001331', '612', '1', '4', '', '1', 'invalid format', '2017-06-12 17:05:37', '2017-06-12 17:05:37', '2017-06-12 17:05:37', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('88', '89860616020031330397', '35', '1', '4', '', '0', '', '2017-06-12 17:05:37', '2017-06-12 17:05:37', '2017-06-12 17:05:37', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('89', '89860616020031330363', '34', '1', '4', '', '0', '', '2017-06-12 17:06:16', '2017-06-12 17:06:16', '2017-06-12 17:06:16', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('90', '10000000000000001261', '605', '1', '4', '', '1', 'invalid format', '2017-06-12 17:06:16', '2017-06-12 17:06:16', '2017-06-12 17:06:16', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('91', '10000000000000001341', '613', '1', '4', '', '1', 'invalid format', '2017-06-12 17:06:16', '2017-06-12 17:06:16', '2017-06-12 17:06:16', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('92', '10000000000000001331', '612', '1', '4', '', '1', 'invalid format', '2017-06-12 17:06:16', '2017-06-12 17:06:16', '2017-06-12 17:06:16', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('93', '89860616020031330397', '35', '1', '4', '', '0', '', '2017-06-12 17:06:16', '2017-06-12 17:06:16', '2017-06-12 17:06:16', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('94', '89860617020016357091', '26', '0', '0', '', '0', '', '2017-06-12 17:21:17', '2017-06-12 17:21:17', '2017-06-12 17:21:17', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('95', '89860617020016357091', '26', '0', '0', '', '0', '', '2017-06-12 17:31:59', '2017-06-12 17:31:59', '2017-06-12 17:31:59', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('96', '89860617020016357091', '26', '0', '0', '', '0', '', '2017-06-12 17:32:42', '2017-06-12 17:32:42', '2017-06-12 17:32:42', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('97', '89860615010034182383', '478', '1', '4', '??????', '0', '', '2017-06-13 10:47:20', '2017-06-13 10:47:20', '2017-06-13 10:47:20', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('98', '89860615010034182383', '478', '1', '4', '??????', '0', '', '2017-06-13 10:47:23', '2017-06-13 10:47:23', '2017-06-13 10:47:23', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('99', '89860615010034182383', '478', '0', '0', '123', '0', '', '2017-06-13 10:52:01', '2017-06-13 10:52:01', '2017-06-13 10:52:01', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('100', '89860615010034182383', '478', '1', '4', '??????', '0', '', '2017-06-13 10:53:18', '2017-06-13 10:53:18', '2017-06-13 10:53:18', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('101', '89860615010034182383', '478', '0', '0', '123', '0', '', '2017-06-13 10:55:19', '2017-06-13 10:55:19', '2017-06-13 10:55:19', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('102', '10000000000000001471', '626', '1', '4', '??????', '1', 'invalid format', '2017-06-13 15:22:23', '2017-06-13 15:22:23', '2017-06-13 15:22:23', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('103', '89860616020031330397', '35', '0', '0', '??????', '0', '', '2017-06-13 15:26:09', '2017-06-13 15:26:09', '2017-06-13 15:26:09', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('104', '89860616020031330397', '35', '1', '4', '??????', '0', '', '2017-06-13 15:55:10', '2017-06-13 15:55:10', '2017-06-13 15:55:10', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('105', '89860616020031330363', '34', '0', '0', '', '0', '', '2017-06-13 16:42:51', '2017-06-13 16:42:51', '2017-06-13 16:42:51', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('106', '10000000000000001261', '605', '0', '0', '', '1', 'invalid format', '2017-06-13 16:42:51', '2017-06-13 16:42:51', '2017-06-13 16:42:51', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('107', '10000000000000001341', '613', '0', '0', '', '1', 'invalid format', '2017-06-13 16:42:51', '2017-06-13 16:42:51', '2017-06-13 16:42:51', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('108', '10000000000000001331', '612', '0', '0', '', '1', 'invalid format', '2017-06-13 16:42:51', '2017-06-13 16:42:51', '2017-06-13 16:42:51', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('109', '89860616020031330397', '35', '0', '0', '', '0', '', '2017-06-13 16:42:51', '2017-06-13 16:42:51', '2017-06-13 16:42:51', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('110', '89860616020031330363', '34', '1', '4', '', '0', '', '2017-06-13 16:44:19', '2017-06-13 16:44:19', '2017-06-13 16:44:19', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('111', '89860615010030653007', '1', '1', '4', '', '0', '', '2017-06-13 16:44:19', '2017-06-13 16:44:19', '2017-06-13 16:44:19', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('112', '89860616020031330397', '35', '1', '4', '', '0', '', '2017-06-13 16:44:19', '2017-06-13 16:44:19', '2017-06-13 16:44:19', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('113', '89860616020031330397', '35', '0', '0', '????????????', '0', '', '2017-06-14 10:09:21', '2017-06-14 10:09:21', '2017-06-14 10:09:21', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('114', '89860616020031330397', '35', '0', '0', '中国结累计累积', '0', '', '2017-06-14 10:37:59', '2017-06-14 10:37:59', '2017-06-14 10:37:59', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('115', '89860616020031330397', '35', '1', '4', '佛挡杀佛首付收费', '0', '', '2017-06-14 10:38:24', '2017-06-14 10:38:24', '2017-06-14 10:38:24', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('116', '89860616020031330397', '35', '0', '0', '测试中文启用', '0', '', '2017-06-14 14:54:32', '2017-06-14 14:54:32', '2017-06-14 14:54:32', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('117', '89860616020031330397', '35', '1', '4', '测试', '0', '', '2017-06-15 14:35:00', '2017-06-15 14:35:00', '2017-06-15 14:35:00', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('118', '89860616020031330397', '35', '0', '0', '测试测试测试测试', '0', '', '2017-06-15 15:02:34', '2017-06-15 15:02:34', '2017-06-15 15:02:34', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('119', '89860616020031330397', '35', '1', '4', '服务套餐过期停用', '0', '', '2017-06-15 15:02:55', '2017-06-15 15:02:55', '2017-06-15 15:02:55', '19180009', '');
INSERT INTO `flowmgn_cardstatus_log` VALUES ('120', '89860616020031330397', '35', '0', '0', '测试测试测试', '0', '', '2017-06-15 15:04:52', '2017-06-15 15:04:52', '2017-06-15 15:04:52', '19180009', '');

-- ----------------------------
-- Table structure for flowmgn_card_date_stat
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_card_date_stat`;
CREATE TABLE `flowmgn_card_date_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_date` int(11) NOT NULL COMMENT '时间',
  `active_num` int(11) DEFAULT NULL COMMENT '当天卡激活数量',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='流量卡日激活统计表';

-- ----------------------------
-- Records of flowmgn_card_date_stat
-- ----------------------------
INSERT INTO `flowmgn_card_date_stat` VALUES ('1', '20170405', '3', '2017-04-10 14:57:45');

-- ----------------------------
-- Table structure for flowmgn_card_month_stat
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_card_month_stat`;
CREATE TABLE `flowmgn_card_month_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_date` int(11) NOT NULL COMMENT '时间',
  `active_num` int(11) DEFAULT NULL COMMENT '当月卡激活数量',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='流量卡月激活统计表';

-- ----------------------------
-- Records of flowmgn_card_month_stat
-- ----------------------------
INSERT INTO `flowmgn_card_month_stat` VALUES ('1', '201704', '3', '2017-04-10 14:57:45');

-- ----------------------------
-- Table structure for flowmgn_card_recycle
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_card_recycle`;
CREATE TABLE `flowmgn_card_recycle` (
  `recycle_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `card_id` int(10) DEFAULT NULL COMMENT '回收卡ID',
  `reason` varchar(256) DEFAULT NULL COMMENT '回收原因',
  `status` tinyint(1) DEFAULT NULL COMMENT '回收状态（1：确认回收 2：取消回收）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间：每次操作都需要修改这个字段',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '操作人名称',
  PRIMARY KEY (`recycle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流量卡回收处理';

-- ----------------------------
-- Records of flowmgn_card_recycle
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_card_transfer
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_card_transfer`;
CREATE TABLE `flowmgn_card_transfer` (
  `trans_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `src_card_id` int(10) DEFAULT NULL COMMENT '原始卡ID',
  `dst_card_id` int(10) DEFAULT NULL COMMENT '目标卡ID',
  `src_imsi` varchar(32) NOT NULL COMMENT '流量从此imsi迁出',
  `dst_imsi` varchar(32) NOT NULL COMMENT '流量迁入此imsi',
  `src_pkg_totalflow` float(12,2) DEFAULT '0.00' COMMENT '迁出卡总流量(M)',
  `src_pkg_usedflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '迁出卡已用流量(M)',
  `src_pkg_remainflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '迁出卡剩余流量(M)',
  `src_currmonth_consumeflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '迁出卡当月消耗流量(M)',
  `src_pkg_accu_flow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '迁出卡套餐内除去当月的累计使用流量(M)',
  `src_pkg_delete_flow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '迁出卡需要剔除的套餐流量(M)',
  `src_pkg_starttime` datetime DEFAULT NULL COMMENT '迁出卡套餐开始时间',
  `src_pkg_endttime` datetime DEFAULT NULL COMMENT '迁出卡套餐结束时间',
  `src_pkg_id` int(10) DEFAULT NULL COMMENT '迁出卡当前套餐编码',
  `dst_pkg_totalflow` float(12,2) DEFAULT '0.00' COMMENT '迁入卡总流量(M)',
  `dst_pkg_usedflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '迁入卡已用流量(M)',
  `dst_pkg_remainflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '迁入卡剩余流量(M)',
  `dst_currmonth_consumeflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '迁入卡当月消耗流量(M)',
  `dst_pkg_accu_flow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '迁入卡套餐内除去当月的累计使用流量(M)',
  `dst_pkg_delete_flow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '迁入卡需要剔除的套餐流量(M)',
  `dst_pkg_starttime` datetime DEFAULT NULL COMMENT '迁入卡套餐开始时间',
  `dst_pkg_endttime` datetime DEFAULT NULL COMMENT '迁入卡套餐结束时间',
  `dst_pkg_id` int(10) DEFAULT NULL COMMENT '迁入卡当前套餐编码',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间：每次操作都需要修改这个字段',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '操作人名称',
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流量卡迁移记录';

-- ----------------------------
-- Records of flowmgn_card_transfer
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_changepackage_plan
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_changepackage_plan`;
CREATE TABLE `flowmgn_changepackage_plan` (
  `changeplane_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `card_id` int(10) DEFAULT '0' COMMENT '流量卡ID',
  `order_id` int(10) DEFAULT NULL COMMENT 'id(0:表示初始化套餐，无订单信息）',
  `src_packageid` int(10) DEFAULT NULL COMMENT '原始套餐ID',
  `dst_packageid` int(10) DEFAULT NULL COMMENT '修改后套餐ID',
  `activedpkcard` tinyint(1) NOT NULL DEFAULT '1' COMMENT '该卡是否为激活过套餐的卡 0:套餐未激活过的卡 1:套餐已激活过的卡',
  `changedatetime` datetime DEFAULT NULL COMMENT '计划执行修改时间',
  `package_begintime` datetime DEFAULT NULL COMMENT '新套餐开始时间',
  `package_endtime` datetime DEFAULT NULL COMMENT '新套餐结束时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '处理状态（1：未处理2：已处理 ）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`changeplane_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='流量套餐变更执行计划表';

-- ----------------------------
-- Records of flowmgn_changepackage_plan
-- ----------------------------
INSERT INTO `flowmgn_changepackage_plan` VALUES ('32', '26', '195', '19', '18', '1', '2017-05-10 16:03:58', '2017-05-10 16:00:21', '2018-08-11 00:00:00', '2', '2017-05-10 16:00:21', '2017-05-10 16:03:58', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('33', '29', '199', '16', '16', '1', '2018-05-11 00:00:00', '2018-05-11 00:00:00', '2019-05-11 00:00:00', '1', '2017-05-10 16:46:24', '2017-05-10 16:46:24', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('34', '28', '212', '16', '16', '1', '2018-05-11 00:00:00', '2018-05-11 00:00:00', '2019-05-11 00:00:00', '1', '2017-05-10 17:31:55', '2017-05-10 17:31:55', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('35', '26', '251', '19', '17', '1', '2017-05-10 18:15:22', '2017-05-10 18:11:02', '2019-08-11 00:00:00', '2', '2017-05-10 18:11:02', '2017-05-10 18:15:22', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('36', '19', '277', '13', '16', '1', '2018-05-04 00:00:00', '2018-05-04 00:00:00', '2019-05-03 23:59:59', '1', '2017-05-13 11:22:01', '2017-05-13 11:22:01', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('37', '30', '284', '11', '12', '1', '2017-05-18 13:53:16', '2017-05-18 13:53:16', '2019-05-10 23:59:59', '2', '2017-05-18 13:53:16', '2017-05-18 13:56:03', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('38', '26', '309', '19', '17', '1', '2017-06-05 14:18:37', '2017-06-05 14:18:37', '2020-08-10 23:59:59', '2', '2017-06-05 14:18:37', '2017-06-05 14:19:44', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('39', '18', '310', '11', '12', '1', '2017-06-05 15:44:58', '2017-06-05 15:44:58', '2019-05-09 23:59:59', '2', '2017-06-05 15:44:58', '2017-06-05 15:46:09', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('40', '3', '313', '13', '16', '1', '2017-10-27 00:00:00', '2017-10-27 00:00:00', '2018-10-26 23:59:59', '1', '2017-06-05 15:48:44', '2017-06-05 15:48:44', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('41', '18', '316', '12', '12', '1', '2017-06-05 16:06:10', '2017-06-05 16:06:10', '2020-05-09 23:59:59', '2', '2017-06-05 16:06:10', '2017-06-05 16:06:10', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('42', '479', '317', '0', '12', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '2017-06-05 16:11:04', '2017-06-05 16:11:04', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('43', '15', '319', '11', '12', '1', '2017-06-05 16:33:08', '2017-06-05 16:33:08', '2019-05-10 23:59:59', '2', '2017-06-05 16:33:08', '2017-06-05 16:36:59', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('44', '478', '321', '0', '12', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '2017-06-05 16:56:08', '2017-06-05 16:56:08', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('45', '30', '323', '11', '12', '1', '2017-06-05 17:05:43', '2017-06-05 17:05:43', '2020-05-10 23:59:59', '2', '2017-06-05 17:05:43', '2017-06-05 17:07:29', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('46', '30', '327', '11', '12', '1', '2017-06-05 18:00:46', '2017-06-05 18:00:46', '2021-05-10 23:59:59', '2', '2017-06-05 18:00:46', '2017-06-05 18:03:24', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('47', '15', '341', '11', '14', '1', '2017-06-08 16:12:58', '2017-06-08 16:12:58', '2018-06-08 23:59:59', '2', '2017-06-08 16:12:58', '2017-06-08 16:16:22', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('48', '480', '345', '0', '13', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '2017-06-08 18:31:25', '2017-06-08 18:31:25', '0', 'admin');
INSERT INTO `flowmgn_changepackage_plan` VALUES ('49', '34', '352', '11', '12', '1', '2017-06-12 17:10:21', '2017-06-12 17:10:21', '2019-05-12 23:59:59', '2', '2017-06-12 17:10:21', '2017-06-12 17:13:56', '0', 'admin');

-- ----------------------------
-- Table structure for flowmgn_cost_benefit
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_cost_benefit`;
CREATE TABLE `flowmgn_cost_benefit` (
  `benefit_id` int(10) NOT NULL AUTO_INCREMENT,
  `count_month` int(10) NOT NULL COMMENT '月份，格式：201603',
  `total_charge` decimal(12,2) DEFAULT '0.00' COMMENT '总费用',
  `subscription_charge` decimal(12,2) DEFAULT '0.00' COMMENT '签约总费用',
  `activation_charge` decimal(12,2) DEFAULT '0.00' COMMENT '激活总费用',
  `data_charge` decimal(12,2) DEFAULT '0.00' COMMENT '流量总费用',
  `events_charge` decimal(12,2) DEFAULT '0.00' COMMENT '事件收费',
  `other_charge` decimal(12,2) DEFAULT '0.00' COMMENT '其他费用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `total_events` int(10) DEFAULT '0' COMMENT '事件数',
  PRIMARY KEY (`benefit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成本收益';

-- ----------------------------
-- Records of flowmgn_cost_benefit
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_daily_flow
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_daily_flow`;
CREATE TABLE `flowmgn_daily_flow` (
  `day_flow_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水',
  `card_id` int(10) DEFAULT NULL COMMENT '卡序号',
  `sub_flowtype` tinyint(1) DEFAULT NULL COMMENT '分类流量类型（0：不分类型 1：基础流量 2：增值流量）',
  `consume_date` int(10) DEFAULT NULL COMMENT '消费日期(当日,格式: 20160401)',
  `used_totalflow` float(12,2) DEFAULT NULL COMMENT '日总消耗',
  `consume_monthflow` float(12,2) DEFAULT NULL COMMENT '当月总消耗流量',
  `unbalance_flow` float(12,2) DEFAULT NULL COMMENT '当日未同步到流量帐户的流量',
  `fix_flow` float(12,2) DEFAULT NULL COMMENT '日修正流量',
  `status` tinyint(4) DEFAULT NULL COMMENT '同步帐户状态 (0：未同步 /1：表示已经更新到流量帐户）',
  `book_status` tinyint(4) DEFAULT NULL COMMENT '与运营商对帐户状态（0:未对帐 1：已对帐）',
  `balance_status` tinyint(4) DEFAULT NULL COMMENT '是否已经参与结算（0：未结算 1：已结算）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`day_flow_id`),
  UNIQUE KEY `cardid_type_date` (`card_id`,`sub_flowtype`,`consume_date`)
) ENGINE=InnoDB AUTO_INCREMENT=971 DEFAULT CHARSET=utf8 COMMENT='流量平台日流量使用统计';

-- ----------------------------
-- Records of flowmgn_daily_flow
-- ----------------------------
INSERT INTO `flowmgn_daily_flow` VALUES ('55', '3', '0', '20170415', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('57', '3', '0', '20170417', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-17 10:15:59', '2017-04-17 10:15:59', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('58', '3', '0', '20170418', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-18 17:46:17', '2017-04-18 17:47:47', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('61', '1', '0', '20170420', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-20 14:51:50', '2017-04-20 15:14:22', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('63', '1', '0', '20170421', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-21 09:45:58', '2017-04-21 15:56:43', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('73', '1', '0', '20170422', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-22 12:29:59', '2017-04-22 13:19:45', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('76', '3', '0', '20170422', '110103.39', '719.63', '0.00', '0.00', '1', '1', '1', '2017-04-22 13:01:36', '2017-04-22 19:21:44', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('251', '3', '0', '20170424', '720.63', '720.64', '0.00', '0.00', '1', '1', '1', '2017-04-24 10:42:48', '2017-04-24 14:31:18', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('254', '3', '0', '20170425', '729.71', '729.71', '0.00', '0.00', '1', '1', '1', '2017-04-25 00:00:57', '2017-04-25 00:00:57', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('255', '3', '0', '20170426', '9517.46', '867.47', '0.00', '0.00', '1', '1', '1', '2017-04-26 00:01:00', '2017-04-26 12:52:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('263', '1', '0', '20170426', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-26 12:31:10', '2017-04-26 12:45:59', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('279', '3', '0', '20170428', '38.18', '43.56', '0.00', '0.00', '1', '1', '1', '2017-04-28 00:00:05', '2017-04-28 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('280', '3', '0', '20170429', '51.80', '95.36', '0.00', '0.00', '1', '1', '1', '2017-04-29 00:00:02', '2017-04-29 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('281', '3', '0', '20170503', '0.00', '95.36', '0.00', '0.00', '1', '1', '1', '2017-05-03 00:00:04', '2017-05-03 15:28:53', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('283', '18', '0', '20170504', '168.64', '168.64', '0.00', '0.00', '1', '1', '1', '2017-05-04 00:00:07', '2017-05-04 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('284', '3', '0', '20170504', '42.68', '138.04', '0.00', '0.00', '1', '1', '1', '2017-05-04 00:00:07', '2017-05-04 16:55:55', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('286', '18', '0', '20170505', '188.84', '188.84', '0.00', '0.00', '1', '1', '1', '2017-05-05 00:00:24', '2017-05-05 00:00:24', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('287', '16', '0', '20170505', '0.25', '0.25', '0.00', '0.00', '1', '1', '1', '2017-05-05 00:00:24', '2017-05-05 00:00:24', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('288', '18', '0', '20170509', '251.67', '251.67', '0.00', '0.00', '1', '1', '1', '2017-05-09 12:42:14', '2017-05-09 12:42:14', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('289', '16', '0', '20170509', '51.81', '52.06', '0.00', '0.00', '1', '1', '1', '2017-05-09 13:53:11', '2017-05-09 13:54:24', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('291', '26', '0', '20170509', '104.99', '105.00', '0.00', '0.00', '1', '1', '1', '2017-05-09 16:32:43', '2017-05-09 16:33:22', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('293', '18', '0', '20170510', '6.27', '257.94', '0.00', '0.00', '1', '1', '1', '2017-05-10 00:00:01', '2017-05-10 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('294', '16', '0', '20170510', '51.55', '103.61', '0.00', '0.00', '1', '1', '1', '2017-05-10 00:00:01', '2017-05-10 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('295', '3', '0', '20170510', '138.04', '138.04', '0.00', '0.00', '1', '1', '1', '2017-05-10 00:00:01', '2017-05-10 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('296', '26', '0', '20170510', '167.28', '136.14', '0.00', '0.00', '1', '1', '1', '2017-05-10 00:00:01', '2017-05-10 14:04:15', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('298', '28', '0', '20170510', '1051.90', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-10 15:03:49', '2017-05-10 15:03:49', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('299', '29', '0', '20170510', '103.61', '103.61', '0.00', '0.00', '1', '1', '1', '2017-05-10 15:03:49', '2017-05-10 15:03:49', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('300', '32', '0', '20170510', '283.93', '283.94', '0.00', '0.00', '1', '1', '1', '2017-05-10 15:03:50', '2017-05-10 18:21:17', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('302', '18', '0', '20170511', '269.74', '269.74', '0.00', '0.00', '1', '1', '1', '2017-05-11 00:00:04', '2017-05-11 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('303', '28', '0', '20170511', '1051.90', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-11 00:00:04', '2017-05-11 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('304', '3', '0', '20170511', '138.04', '138.04', '0.00', '0.00', '1', '1', '1', '2017-05-11 00:00:04', '2017-05-11 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('305', '32', '0', '20170511', '18.87', '302.81', '0.00', '0.00', '1', '1', '1', '2017-05-11 00:00:04', '2017-05-11 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('306', '26', '0', '20170511', '0.00', '136.14', '0.00', '0.00', '1', '1', '1', '2017-05-11 00:00:04', '2017-05-11 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('307', '18', '0', '20170512', '16.25', '285.99', '0.00', '0.00', '1', '1', '1', '2017-05-12 00:00:05', '2017-05-12 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('308', '29', '0', '20170512', '0.00', '103.61', '0.00', '0.00', '1', '1', '1', '2017-05-12 00:00:05', '2017-05-12 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('309', '31', '0', '20170512', '1.04', '1.04', '0.00', '0.00', '1', '1', '1', '2017-05-12 00:00:05', '2017-05-12 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('310', '32', '0', '20170512', '14.11', '316.92', '0.00', '0.00', '1', '1', '1', '2017-05-12 00:00:05', '2017-05-12 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('311', '35', '0', '20170512', '113.36', '113.36', '0.00', '0.00', '1', '1', '1', '2017-05-12 14:45:09', '2017-05-12 14:45:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('312', '34', '0', '20170512', '1.65', '904.72', '0.00', '0.00', '1', '1', '1', '2017-05-12 18:13:10', '2017-05-12 18:44:57', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('321', '18', '0', '20170513', '0.00', '299.27', '0.00', '0.00', '1', '1', '1', '2017-05-13 00:00:18', '2017-05-13 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('323', '1', '0', '20170513', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-13 00:00:18', '2017-05-13 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('324', '28', '0', '20170513', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-13 00:00:18', '2017-05-13 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('325', '29', '0', '20170513', '0.02', '103.63', '0.00', '0.00', '1', '1', '1', '2017-05-13 00:00:18', '2017-05-13 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('326', '19', '0', '20170513', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-13 00:00:18', '2017-05-13 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('327', '31', '0', '20170513', '62.06', '63.09', '0.00', '0.00', '1', '1', '1', '2017-05-13 00:00:18', '2017-05-13 00:41:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('328', '3', '0', '20170513', '0.00', '138.04', '0.00', '0.00', '1', '1', '1', '2017-05-13 00:00:18', '2017-05-13 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('329', '33', '0', '20170513', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-13 00:00:18', '2017-05-13 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('330', '34', '0', '20170513', '113.00', '1017.72', '0.00', '0.00', '1', '1', '1', '2017-05-13 00:00:18', '2017-05-13 15:47:46', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('331', '35', '0', '20170513', '0.00', '113.36', '0.00', '0.00', '1', '1', '1', '2017-05-13 00:00:18', '2017-05-13 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('332', '32', '0', '20170513', '0.00', '316.92', '0.00', '0.00', '1', '1', '1', '2017-05-13 00:00:18', '2017-05-13 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('333', '27', '0', '20170513', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-13 00:00:18', '2017-05-13 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('334', '26', '0', '20170513', '0.00', '136.14', '0.00', '0.00', '1', '1', '1', '2017-05-13 00:00:18', '2017-05-13 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('341', '3', '0', '20170514', '0.00', '138.04', '0.00', '0.00', '1', '1', '1', '2017-05-14 00:00:03', '2017-05-14 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('342', '33', '0', '20170514', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-14 00:00:03', '2017-05-14 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('343', '34', '0', '20170514', '58.48', '1076.20', '0.00', '0.00', '1', '1', '1', '2017-05-14 00:00:03', '2017-05-14 21:48:34', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('344', '35', '0', '20170514', '0.00', '113.36', '0.00', '0.00', '1', '1', '1', '2017-05-14 00:00:03', '2017-05-14 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('345', '32', '0', '20170514', '0.00', '316.92', '0.00', '0.00', '1', '1', '1', '2017-05-14 00:00:03', '2017-05-14 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('346', '27', '0', '20170514', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-14 00:00:03', '2017-05-14 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('347', '26', '0', '20170514', '0.00', '136.14', '0.00', '0.00', '1', '1', '1', '2017-05-14 00:00:03', '2017-05-14 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('348', '31', '0', '20170514', '48.55', '111.64', '0.00', '0.00', '1', '1', '1', '2017-05-14 13:50:10', '2017-05-14 13:50:10', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('350', '34', '0', '20170515', '228.54', '1304.74', '0.00', '0.00', '1', '1', '1', '2017-05-15 09:19:46', '2017-05-15 23:36:27', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('353', '35', '0', '20170515', '0.00', '153.60', '0.00', '0.00', '1', '1', '1', '2017-05-15 10:53:05', '2017-05-15 18:25:54', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('355', '1', '0', '20170515', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-15 11:43:19', '2017-05-15 11:43:52', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('358', '31', '0', '20170515', '34.90', '146.54', '0.00', '0.00', '1', '1', '1', '2017-05-15 14:58:06', '2017-05-15 14:58:06', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('359', '32', '0', '20170515', '201.10', '518.03', '0.00', '0.00', '1', '1', '1', '2017-05-15 15:38:42', '2017-05-15 21:01:26', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('364', '19', '0', '20170515', '0.00', '20.14', '0.00', '0.00', '1', '1', '1', '2017-05-15 22:41:33', '2017-05-15 22:41:33', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('367', '3', '0', '20170516', '0.00', '138.04', '0.00', '0.00', '1', '1', '1', '2017-05-16 00:00:03', '2017-05-16 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('368', '33', '0', '20170516', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-16 00:00:03', '2017-05-16 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('369', '34', '0', '20170516', '102.82', '1407.57', '0.00', '0.00', '1', '1', '1', '2017-05-16 00:00:03', '2017-05-16 05:38:30', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('370', '35', '0', '20170516', '2.45', '156.06', '0.00', '0.00', '1', '1', '1', '2017-05-16 00:00:03', '2017-05-16 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('371', '32', '0', '20170516', '368.81', '886.82', '0.00', '0.00', '1', '1', '1', '2017-05-16 00:00:03', '2017-05-16 16:49:33', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('372', '27', '0', '20170516', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-16 00:00:03', '2017-05-16 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('373', '26', '0', '20170516', '0.00', '136.14', '0.00', '0.00', '1', '1', '1', '2017-05-16 00:00:03', '2017-05-16 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('375', '1', '0', '20170516', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-16 00:00:04', '2017-05-16 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('376', '28', '0', '20170516', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-16 00:00:04', '2017-05-16 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('377', '19', '0', '20170516', '4.63', '27.58', '0.00', '0.00', '1', '1', '1', '2017-05-16 00:00:04', '2017-05-16 10:36:15', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('378', '29', '0', '20170516', '0.00', '103.63', '0.00', '0.00', '1', '1', '1', '2017-05-16 00:00:05', '2017-05-16 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('379', '18', '0', '20170516', '0.00', '365.53', '0.00', '0.00', '1', '1', '1', '2017-05-16 00:00:06', '2017-05-16 00:00:06', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('380', '31', '0', '20170516', '4.31', '150.85', '0.00', '0.00', '1', '1', '1', '2017-05-16 00:00:07', '2017-05-16 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('392', '3', '0', '20170517', '17.99', '156.03', '0.00', '0.00', '1', '1', '1', '2017-05-17 00:00:03', '2017-05-17 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('393', '33', '0', '20170517', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-17 00:00:03', '2017-05-17 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('394', '34', '0', '20170517', '607.73', '2015.29', '0.00', '0.00', '1', '1', '1', '2017-05-17 00:00:03', '2017-05-17 09:58:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('395', '35', '0', '20170517', '0.00', '167.98', '0.00', '0.00', '1', '1', '1', '2017-05-17 00:00:03', '2017-05-17 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('396', '32', '0', '20170517', '138.31', '1025.13', '0.00', '0.00', '1', '1', '1', '2017-05-17 00:00:03', '2017-05-17 19:42:18', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('397', '27', '0', '20170517', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-17 00:00:03', '2017-05-17 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('398', '26', '0', '20170517', '0.00', '136.14', '0.00', '0.00', '1', '1', '1', '2017-05-17 00:00:03', '2017-05-17 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('400', '1', '0', '20170517', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-17 00:00:04', '2017-05-17 11:38:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('401', '28', '0', '20170517', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-17 00:00:04', '2017-05-17 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('402', '19', '0', '20170517', '0.00', '27.58', '0.00', '0.00', '1', '1', '1', '2017-05-17 00:00:04', '2017-05-17 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('403', '29', '0', '20170517', '0.00', '103.63', '0.00', '0.00', '1', '1', '1', '2017-05-17 00:00:05', '2017-05-17 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('404', '18', '0', '20170517', '0.00', '379.21', '0.00', '0.00', '1', '1', '1', '2017-05-17 00:00:05', '2017-05-17 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('405', '31', '0', '20170517', '8.55', '159.40', '0.00', '0.00', '1', '1', '1', '2017-05-17 00:00:06', '2017-05-17 00:00:06', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('420', '3', '0', '20170518', '17.97', '174.00', '0.00', '0.00', '1', '1', '1', '2017-05-18 00:00:03', '2017-05-18 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('421', '33', '0', '20170518', '42.41', '103.92', '0.00', '0.00', '1', '1', '1', '2017-05-18 00:00:03', '2017-05-18 14:38:36', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('422', '34', '0', '20170518', '517.89', '2533.18', '0.00', '0.00', '1', '1', '1', '2017-05-18 00:00:03', '2017-05-18 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('423', '35', '0', '20170518', '12.52', '180.51', '0.00', '0.00', '1', '1', '1', '2017-05-18 00:00:03', '2017-05-18 10:05:21', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('424', '32', '0', '20170518', '253.47', '1278.60', '0.00', '0.00', '1', '1', '1', '2017-05-18 00:00:03', '2017-05-18 23:26:34', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('425', '27', '0', '20170518', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-18 00:00:03', '2017-05-18 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('426', '26', '0', '20170518', '0.00', '136.14', '0.00', '0.00', '1', '1', '1', '2017-05-18 00:00:03', '2017-05-18 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('428', '1', '0', '20170518', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-18 00:00:04', '2017-05-18 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('429', '28', '0', '20170518', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-18 00:00:04', '2017-05-18 18:46:25', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('430', '19', '0', '20170518', '0.00', '27.58', '0.00', '0.00', '1', '1', '1', '2017-05-18 00:00:04', '2017-05-18 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('431', '29', '0', '20170518', '0.00', '103.63', '0.00', '0.00', '1', '1', '1', '2017-05-18 00:00:04', '2017-05-18 18:46:25', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('432', '18', '0', '20170518', '7.31', '386.52', '0.00', '0.00', '1', '1', '1', '2017-05-18 00:00:04', '2017-05-18 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('433', '31', '0', '20170518', '36.61', '196.02', '0.00', '0.00', '1', '1', '1', '2017-05-18 00:00:05', '2017-05-18 17:34:39', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('454', '3', '0', '20170519', '0.00', '174.00', '0.00', '0.00', '1', '1', '1', '2017-05-19 00:00:03', '2017-05-19 14:51:57', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('455', '33', '0', '20170519', '1.10', '105.02', '0.00', '0.00', '1', '1', '1', '2017-05-19 00:00:03', '2017-05-19 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('456', '34', '0', '20170519', '0.00', '2533.18', '0.00', '0.00', '1', '1', '1', '2017-05-19 00:00:03', '2017-05-19 16:04:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('457', '35', '0', '20170519', '28.85', '209.35', '0.00', '0.00', '1', '1', '1', '2017-05-19 00:00:03', '2017-05-19 16:04:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('458', '32', '0', '20170519', '107.75', '1386.35', '0.00', '0.00', '1', '1', '1', '2017-05-19 00:00:03', '2017-05-19 09:58:44', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('459', '27', '0', '20170519', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-19 00:00:03', '2017-05-19 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('460', '26', '0', '20170519', '40.04', '176.19', '0.00', '0.00', '1', '1', '1', '2017-05-19 00:00:03', '2017-05-19 15:05:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('462', '1', '0', '20170519', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-19 00:00:04', '2017-05-19 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('463', '237', '0', '20170519', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-19 00:00:04', '2017-05-19 09:56:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('464', '19', '0', '20170519', '0.00', '27.58', '0.00', '0.00', '1', '1', '1', '2017-05-19 00:00:04', '2017-05-19 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('465', '238', '0', '20170519', '0.00', '103.63', '0.00', '0.00', '1', '1', '1', '2017-05-19 00:00:04', '2017-05-19 09:56:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('466', '18', '0', '20170519', '10.15', '396.67', '0.00', '0.00', '1', '1', '1', '2017-05-19 00:00:04', '2017-05-19 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('467', '31', '0', '20170519', '27.00', '223.02', '0.00', '0.00', '1', '1', '1', '2017-05-19 00:00:04', '2017-05-19 16:42:30', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('478', '239', '0', '20170519', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-19 11:40:19', '2017-05-19 11:40:21', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('480', '240', '0', '20170519', '0.00', '103.63', '0.00', '0.00', '1', '1', '1', '2017-05-19 11:40:21', '2017-05-19 11:40:21', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('484', '242', '0', '20170519', '0.00', '103.63', '0.00', '0.00', '1', '1', '1', '2017-05-19 15:11:49', '2017-05-19 15:11:50', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('485', '241', '0', '20170519', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-19 15:11:50', '2017-05-19 15:11:50', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('487', '245', '0', '20170519', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-19 15:24:18', '2017-05-19 15:31:06', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('490', '244', '0', '20170519', '0.00', '103.63', '0.00', '0.00', '1', '1', '1', '2017-05-19 16:04:04', '2017-05-19 16:04:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('495', '3', '0', '20170520', '0.00', '174.00', '0.00', '0.00', '1', '1', '1', '2017-05-20 00:00:05', '2017-05-20 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('496', '33', '0', '20170520', '0.00', '105.02', '0.00', '0.00', '1', '1', '1', '2017-05-20 00:00:05', '2017-05-20 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('497', '34', '0', '20170520', '0.00', '2533.18', '0.00', '0.00', '1', '1', '1', '2017-05-20 00:00:05', '2017-05-20 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('498', '35', '0', '20170520', '0.00', '209.35', '0.00', '0.00', '1', '1', '1', '2017-05-20 00:00:05', '2017-05-20 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('499', '32', '0', '20170520', '21.60', '1407.95', '0.00', '0.00', '1', '1', '1', '2017-05-20 00:00:05', '2017-05-20 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('500', '27', '0', '20170520', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-20 00:00:05', '2017-05-20 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('501', '26', '0', '20170520', '1.89', '178.08', '0.00', '0.00', '1', '1', '1', '2017-05-20 00:00:05', '2017-05-20 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('502', '1', '0', '20170520', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-20 00:00:05', '2017-05-20 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('503', '245', '0', '20170520', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-20 00:00:05', '2017-05-20 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('504', '19', '0', '20170520', '0.00', '27.58', '0.00', '0.00', '1', '1', '1', '2017-05-20 00:00:05', '2017-05-20 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('506', '244', '0', '20170520', '0.00', '103.63', '0.00', '0.00', '1', '1', '1', '2017-05-20 00:00:06', '2017-05-20 00:00:06', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('507', '18', '0', '20170520', '9.75', '406.42', '0.00', '0.00', '1', '1', '1', '2017-05-20 00:00:06', '2017-05-20 00:00:06', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('508', '31', '0', '20170520', '105.56', '328.57', '0.00', '0.00', '1', '1', '1', '2017-05-20 00:00:06', '2017-05-20 15:58:52', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('513', '3', '0', '20170521', '0.00', '174.00', '0.00', '0.00', '1', '1', '1', '2017-05-21 00:00:03', '2017-05-21 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('514', '33', '0', '20170521', '0.00', '105.02', '0.00', '0.00', '1', '1', '1', '2017-05-21 00:00:03', '2017-05-21 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('515', '34', '0', '20170521', '0.00', '2533.18', '0.00', '0.00', '1', '1', '1', '2017-05-21 00:00:03', '2017-05-21 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('516', '35', '0', '20170521', '0.00', '209.35', '0.00', '0.00', '1', '1', '1', '2017-05-21 00:00:03', '2017-05-21 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('517', '32', '0', '20170521', '0.00', '1407.95', '0.00', '0.00', '1', '1', '1', '2017-05-21 00:00:03', '2017-05-21 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('518', '27', '0', '20170521', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-21 00:00:03', '2017-05-21 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('519', '26', '0', '20170521', '0.00', '178.08', '0.00', '0.00', '1', '1', '1', '2017-05-21 00:00:03', '2017-05-21 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('520', '1', '0', '20170521', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-21 00:00:05', '2017-05-21 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('521', '245', '0', '20170521', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-21 00:00:05', '2017-05-21 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('522', '19', '0', '20170521', '0.00', '27.58', '0.00', '0.00', '1', '1', '1', '2017-05-21 00:00:05', '2017-05-21 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('524', '244', '0', '20170521', '0.00', '103.63', '0.00', '0.00', '1', '1', '1', '2017-05-21 00:00:05', '2017-05-21 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('525', '18', '0', '20170521', '11.24', '417.66', '0.00', '0.00', '1', '1', '1', '2017-05-21 00:00:05', '2017-05-21 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('526', '31', '0', '20170521', '19.56', '348.14', '0.00', '0.00', '1', '1', '1', '2017-05-21 00:00:06', '2017-05-21 00:00:06', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('528', '3', '0', '20170522', '0.00', '174.00', '0.00', '0.00', '1', '1', '1', '2017-05-22 00:00:03', '2017-05-22 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('529', '33', '0', '20170522', '0.00', '105.02', '0.00', '0.00', '1', '1', '1', '2017-05-22 00:00:03', '2017-05-22 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('530', '34', '0', '20170522', '0.00', '2533.18', '0.00', '0.00', '1', '1', '1', '2017-05-22 00:00:03', '2017-05-22 18:44:24', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('531', '35', '0', '20170522', '0.00', '209.35', '0.00', '0.00', '1', '1', '1', '2017-05-22 00:00:03', '2017-05-22 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('532', '32', '0', '20170522', '132.93', '1540.90', '0.00', '0.00', '1', '1', '1', '2017-05-22 00:00:03', '2017-05-22 18:46:14', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('533', '27', '0', '20170522', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-22 00:00:03', '2017-05-22 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('534', '26', '0', '20170522', '0.00', '178.08', '0.00', '0.00', '1', '1', '1', '2017-05-22 00:00:03', '2017-05-22 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('535', '1', '0', '20170522', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-22 00:00:03', '2017-05-22 18:08:38', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('536', '245', '0', '20170522', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-22 00:00:03', '2017-05-22 18:45:06', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('537', '19', '0', '20170522', '0.00', '27.58', '0.00', '0.00', '1', '1', '1', '2017-05-22 00:00:03', '2017-05-22 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('539', '244', '0', '20170522', '0.00', '103.63', '0.00', '0.00', '1', '1', '1', '2017-05-22 00:00:04', '2017-05-22 17:54:22', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('540', '18', '0', '20170522', '7.00', '436.25', '0.00', '0.00', '1', '1', '1', '2017-05-22 00:00:04', '2017-05-22 17:50:28', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('541', '31', '0', '20170522', '0.00', '348.14', '0.00', '0.00', '1', '1', '1', '2017-05-22 00:00:04', '2017-05-22 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('576', '18', '0', '20170523', '1.62', '437.88', '0.00', '0.00', '1', '1', '1', '2017-05-23 00:00:01', '2017-05-23 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('578', '1', '0', '20170523', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-23 00:00:01', '2017-05-23 11:05:59', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('579', '245', '0', '20170523', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-23 00:00:01', '2017-05-23 10:35:13', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('580', '244', '0', '20170523', '0.00', '103.63', '0.00', '0.00', '1', '1', '1', '2017-05-23 00:00:01', '2017-05-23 10:35:13', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('581', '31', '0', '20170523', '62.97', '411.10', '0.00', '0.00', '1', '1', '1', '2017-05-23 00:00:01', '2017-05-23 01:02:54', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('582', '3', '0', '20170523', '0.00', '174.00', '0.00', '0.00', '1', '1', '1', '2017-05-23 00:00:01', '2017-05-23 14:42:22', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('583', '33', '0', '20170523', '0.00', '105.02', '0.00', '0.00', '1', '1', '1', '2017-05-23 00:00:01', '2017-05-23 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('584', '34', '0', '20170523', '0.00', '2533.18', '0.00', '0.00', '1', '1', '1', '2017-05-23 00:00:01', '2017-05-23 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('585', '35', '0', '20170523', '20.60', '236.03', '0.00', '0.00', '1', '1', '1', '2017-05-23 00:00:01', '2017-05-23 11:28:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('586', '32', '0', '20170523', '0.00', '1540.90', '0.00', '0.00', '1', '1', '1', '2017-05-23 00:00:01', '2017-05-23 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('587', '27', '0', '20170523', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-23 00:00:01', '2017-05-23 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('588', '26', '0', '20170523', '20.39', '198.47', '0.00', '0.00', '1', '1', '1', '2017-05-23 00:00:01', '2017-05-23 14:42:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('599', '248', '0', '20170523', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-23 14:25:21', '2017-05-23 14:25:21', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('603', '3', '0', '20170524', '0.00', '174.00', '0.00', '0.00', '1', '1', '1', '2017-05-24 00:00:01', '2017-05-24 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('604', '33', '0', '20170524', '0.00', '105.02', '0.00', '0.00', '1', '1', '1', '2017-05-24 00:00:01', '2017-05-24 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('605', '34', '0', '20170524', '0.00', '2533.18', '0.00', '0.00', '1', '1', '1', '2017-05-24 00:00:01', '2017-05-24 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('606', '35', '0', '20170524', '0.00', '236.03', '0.00', '0.00', '1', '1', '1', '2017-05-24 00:00:01', '2017-05-24 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('607', '32', '0', '20170524', '200.97', '1741.87', '0.00', '0.00', '1', '1', '1', '2017-05-24 00:00:01', '2017-05-24 21:23:18', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('608', '27', '0', '20170524', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-24 00:00:01', '2017-05-24 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('609', '26', '0', '20170524', '0.32', '198.79', '0.00', '0.00', '1', '1', '1', '2017-05-24 00:00:01', '2017-05-24 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('610', '1', '0', '20170524', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-24 00:00:01', '2017-05-24 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('611', '248', '0', '20170524', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-24 00:00:01', '2017-05-24 11:43:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('613', '247', '0', '20170524', '0.00', '103.63', '0.00', '0.00', '1', '1', '1', '2017-05-24 00:00:02', '2017-05-24 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('614', '18', '0', '20170524', '13.39', '451.27', '0.00', '0.00', '1', '1', '1', '2017-05-24 00:00:05', '2017-05-24 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('615', '31', '0', '20170524', '19.10', '430.20', '0.00', '0.00', '1', '1', '1', '2017-05-24 00:00:05', '2017-05-24 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('623', '3', '0', '20170525', '0.00', '174.00', '0.00', '0.00', '1', '1', '1', '2017-05-25 00:00:03', '2017-05-25 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('624', '33', '0', '20170525', '0.00', '105.02', '0.00', '0.00', '1', '1', '1', '2017-05-25 00:00:03', '2017-05-25 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('625', '34', '0', '20170525', '0.00', '2533.18', '0.00', '0.00', '1', '1', '1', '2017-05-25 00:00:03', '2017-05-25 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('626', '35', '0', '20170525', '0.00', '242.85', '0.00', '0.00', '1', '1', '1', '2017-05-25 00:00:03', '2017-05-25 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('627', '32', '0', '20170525', '360.43', '2102.29', '0.00', '0.00', '1', '1', '1', '2017-05-25 00:00:03', '2017-05-25 14:30:39', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('628', '27', '0', '20170525', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-25 00:00:03', '2017-05-25 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('629', '26', '0', '20170525', '0.00', '198.79', '0.00', '0.00', '1', '1', '1', '2017-05-25 00:00:03', '2017-05-25 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('630', '1', '0', '20170525', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-25 00:00:03', '2017-05-25 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('631', '248', '0', '20170525', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-25 00:00:03', '2017-05-25 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('633', '18', '0', '20170525', '0.00', '453.73', '0.00', '0.00', '1', '1', '1', '2017-05-25 00:00:04', '2017-05-25 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('634', '31', '0', '20170525', '4.44', '434.64', '0.00', '0.00', '1', '1', '1', '2017-05-25 00:00:04', '2017-05-25 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('641', '3', '0', '20170526', '0.00', '174.00', '0.00', '0.00', '1', '1', '1', '2017-05-26 00:00:03', '2017-05-26 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('642', '33', '0', '20170526', '0.00', '105.02', '0.00', '0.00', '1', '1', '1', '2017-05-26 00:00:03', '2017-05-26 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('643', '34', '0', '20170526', '0.00', '2533.18', '0.00', '0.00', '1', '1', '1', '2017-05-26 00:00:03', '2017-05-26 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('644', '35', '0', '20170526', '11.79', '254.64', '0.00', '0.00', '1', '1', '1', '2017-05-26 00:00:03', '2017-05-26 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('645', '32', '0', '20170526', '79.20', '2181.49', '0.00', '0.00', '1', '1', '1', '2017-05-26 00:00:03', '2017-05-26 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('646', '27', '0', '20170526', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-26 00:00:03', '2017-05-26 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('647', '26', '0', '20170526', '0.00', '198.79', '0.00', '0.00', '1', '1', '1', '2017-05-26 00:00:03', '2017-05-26 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('648', '1', '0', '20170526', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-26 00:00:03', '2017-05-26 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('649', '248', '0', '20170526', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-26 00:00:03', '2017-05-26 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('651', '18', '0', '20170526', '15.88', '469.60', '0.00', '0.00', '1', '1', '1', '2017-05-26 00:00:04', '2017-05-26 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('652', '31', '0', '20170526', '30.69', '465.32', '0.00', '0.00', '1', '1', '1', '2017-05-26 00:00:04', '2017-05-26 17:06:41', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('655', '18', '0', '20170527', '0.00', '504.13', '0.00', '0.00', '1', '1', '1', '2017-05-27 00:00:03', '2017-05-27 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('657', '1', '0', '20170527', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-27 00:00:03', '2017-05-27 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('658', '248', '0', '20170527', '0.00', '1051.90', '0.00', '0.00', '1', '1', '1', '2017-05-27 00:00:03', '2017-05-27 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('659', '31', '0', '20170527', '0.15', '465.48', '0.00', '0.00', '1', '1', '1', '2017-05-27 00:00:03', '2017-05-27 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('660', '3', '0', '20170527', '0.00', '174.00', '0.00', '0.00', '1', '1', '1', '2017-05-27 00:00:03', '2017-05-27 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('661', '33', '0', '20170527', '110.79', '215.81', '0.00', '0.00', '1', '1', '1', '2017-05-27 00:00:03', '2017-05-27 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('662', '34', '0', '20170527', '0.00', '2533.18', '0.00', '0.00', '1', '1', '1', '2017-05-27 00:00:03', '2017-05-27 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('663', '35', '0', '20170527', '0.00', '254.77', '0.00', '0.00', '1', '1', '1', '2017-05-27 00:00:03', '2017-05-27 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('664', '32', '0', '20170527', '3.29', '2184.78', '0.00', '0.00', '1', '1', '1', '2017-05-27 00:00:03', '2017-05-27 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('665', '27', '0', '20170527', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-27 00:00:03', '2017-05-27 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('666', '26', '0', '20170527', '0.00', '198.79', '0.00', '0.00', '1', '1', '1', '2017-05-27 00:00:03', '2017-05-27 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('667', '15', '0', '20170528', '100.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-28 00:00:02', '2017-05-28 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('668', '18', '0', '20170528', '28.02', '28.02', '0.00', '0.00', '1', '1', '1', '2017-05-28 00:00:02', '2017-05-28 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('670', '1', '0', '20170528', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-28 00:00:02', '2017-05-28 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('671', '248', '0', '20170528', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-28 00:00:02', '2017-05-28 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('672', '31', '0', '20170528', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-28 00:00:02', '2017-05-28 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('673', '3', '0', '20170528', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-28 00:00:02', '2017-05-28 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('674', '33', '0', '20170528', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-28 00:00:02', '2017-05-28 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('675', '34', '0', '20170528', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-28 00:00:02', '2017-05-28 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('676', '35', '0', '20170528', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-28 00:00:02', '2017-05-28 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('677', '32', '0', '20170528', '3.62', '3.62', '0.00', '0.00', '1', '1', '1', '2017-05-28 00:00:02', '2017-05-28 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('678', '27', '0', '20170528', '152.90', '152.90', '0.00', '0.00', '1', '1', '1', '2017-05-28 00:00:02', '2017-05-28 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('679', '26', '0', '20170528', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-28 00:00:02', '2017-05-28 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('681', '15', '0', '20170529', '101.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-29 00:00:03', '2017-05-29 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('682', '18', '0', '20170529', '11.09', '39.11', '0.00', '0.00', '1', '1', '1', '2017-05-29 00:00:03', '2017-05-29 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('684', '1', '0', '20170529', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-29 00:00:03', '2017-05-29 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('685', '248', '0', '20170529', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-29 00:00:03', '2017-05-29 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('686', '31', '0', '20170529', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-29 00:00:03', '2017-05-29 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('687', '3', '0', '20170529', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-29 00:00:03', '2017-05-29 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('688', '33', '0', '20170529', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-29 00:00:03', '2017-05-29 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('689', '34', '0', '20170529', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-29 00:00:03', '2017-05-29 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('690', '35', '0', '20170529', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-29 00:00:03', '2017-05-29 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('691', '32', '0', '20170529', '0.00', '3.62', '0.00', '0.00', '1', '1', '1', '2017-05-29 00:00:03', '2017-05-29 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('692', '27', '0', '20170529', '0.00', '152.90', '0.00', '0.00', '1', '1', '1', '2017-05-29 00:00:03', '2017-05-29 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('693', '26', '0', '20170529', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-29 00:00:03', '2017-05-29 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('694', '15', '0', '20170530', '102.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-30 00:00:01', '2017-05-30 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('695', '18', '0', '20170530', '10.24', '49.36', '0.00', '0.00', '1', '1', '1', '2017-05-30 00:00:01', '2017-05-30 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('697', '1', '0', '20170530', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-30 00:00:01', '2017-05-30 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('698', '248', '0', '20170530', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-30 00:00:01', '2017-05-30 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('699', '31', '0', '20170530', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-30 00:00:01', '2017-05-30 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('700', '3', '0', '20170530', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-30 00:00:01', '2017-05-30 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('701', '33', '0', '20170530', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-30 00:00:01', '2017-05-30 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('702', '34', '0', '20170530', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-30 00:00:01', '2017-05-30 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('703', '35', '0', '20170530', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-30 00:00:01', '2017-05-30 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('704', '32', '0', '20170530', '0.00', '3.62', '0.00', '0.00', '1', '1', '1', '2017-05-30 00:00:01', '2017-05-30 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('705', '27', '0', '20170530', '0.00', '152.90', '0.00', '0.00', '1', '1', '1', '2017-05-30 00:00:01', '2017-05-30 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('706', '26', '0', '20170530', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-30 00:00:01', '2017-05-30 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('707', '15', '0', '20170531', '103.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-31 00:00:16', '2017-05-31 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('708', '18', '0', '20170531', '7.97', '57.33', '0.00', '0.00', '1', '1', '1', '2017-05-31 00:00:16', '2017-05-31 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('709', '30', '0', '20170531', '500.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-31 00:00:16', '2017-05-31 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('710', '1', '0', '20170531', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-31 00:00:16', '2017-05-31 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('711', '248', '0', '20170531', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-31 00:00:16', '2017-05-31 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('712', '31', '0', '20170531', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-31 00:00:16', '2017-05-31 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('713', '3', '0', '20170531', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-31 00:00:16', '2017-05-31 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('714', '33', '0', '20170531', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-31 00:00:16', '2017-05-31 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('715', '34', '0', '20170531', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-31 00:00:16', '2017-05-31 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('716', '35', '0', '20170531', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-31 00:00:16', '2017-05-31 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('717', '32', '0', '20170531', '0.00', '3.62', '0.00', '0.00', '1', '1', '1', '2017-05-31 00:00:16', '2017-05-31 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('718', '27', '0', '20170531', '0.00', '152.90', '0.00', '0.00', '1', '1', '1', '2017-05-31 00:00:16', '2017-05-31 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('719', '26', '0', '20170531', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-05-31 00:00:16', '2017-05-31 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('720', '15', '0', '20170601', '50.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-01 00:00:11', '2017-06-01 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('721', '18', '0', '20170601', '7.97', '65.31', '0.00', '0.00', '1', '1', '1', '2017-06-01 00:00:11', '2017-06-01 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('722', '30', '0', '20170601', '926.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-01 00:00:11', '2017-06-01 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('723', '1', '0', '20170601', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-01 00:00:11', '2017-06-01 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('724', '248', '0', '20170601', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-01 00:00:11', '2017-06-01 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('725', '31', '0', '20170601', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-01 00:00:11', '2017-06-01 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('726', '3', '0', '20170601', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-01 00:00:11', '2017-06-01 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('727', '33', '0', '20170601', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-01 00:00:11', '2017-06-01 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('728', '34', '0', '20170601', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-01 00:00:11', '2017-06-01 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('729', '35', '0', '20170601', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-01 00:00:11', '2017-06-01 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('730', '32', '0', '20170601', '0.00', '3.62', '0.00', '0.00', '1', '1', '1', '2017-06-01 00:00:11', '2017-06-01 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('731', '27', '0', '20170601', '0.00', '152.90', '0.00', '0.00', '1', '1', '1', '2017-06-01 00:00:11', '2017-06-01 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('732', '26', '0', '20170601', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-01 00:00:11', '2017-06-01 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('733', '15', '0', '20170602', '200.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-02 00:00:01', '2017-06-02 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('734', '18', '0', '20170602', '19.17', '84.48', '0.00', '0.00', '1', '1', '1', '2017-06-02 00:00:01', '2017-06-02 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('735', '30', '0', '20170602', '800.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-02 00:00:01', '2017-06-02 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('736', '1', '0', '20170602', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-02 00:00:01', '2017-06-02 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('737', '248', '0', '20170602', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-02 00:00:01', '2017-06-02 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('738', '31', '0', '20170602', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-02 00:00:01', '2017-06-02 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('739', '3', '0', '20170602', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-02 00:00:01', '2017-06-02 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('740', '33', '0', '20170602', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-02 00:00:01', '2017-06-02 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('741', '34', '0', '20170602', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-02 00:00:01', '2017-06-02 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('742', '35', '0', '20170602', '18.02', '40.49', '0.00', '0.00', '1', '1', '1', '2017-06-02 00:00:01', '2017-06-02 16:15:30', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('743', '32', '0', '20170602', '0.00', '3.62', '0.00', '0.00', '1', '1', '1', '2017-06-02 00:00:01', '2017-06-02 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('744', '27', '0', '20170602', '0.00', '152.90', '0.00', '0.00', '1', '1', '1', '2017-06-02 00:00:01', '2017-06-02 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('745', '26', '0', '20170602', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-02 00:00:01', '2017-06-02 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('748', '477', '0', '20170602', '0.00', '110.07', '0.00', '0.00', '1', '1', '1', '2017-06-02 17:07:54', '2017-06-02 17:07:54', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('749', '477', '0', '20170605', '12.51', '170.90', '0.00', '0.00', '1', '1', '1', '2017-06-05 13:39:02', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('751', '18', '0', '20170605', '0.00', '90.52', '0.00', '0.00', '1', '1', '1', '2017-06-05 15:46:10', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('752', '15', '0', '20170605', '12.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-06 00:00:05', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('754', '30', '0', '20170605', '100.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-06 00:00:05', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('755', '1', '0', '20170605', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-06 00:00:05', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('756', '450', '0', '20170605', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-06 00:00:05', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('758', '248', '0', '20170605', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-06 00:00:05', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('759', '478', '0', '20170605', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-06 00:00:05', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('760', '479', '0', '20170605', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-06 00:00:05', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('761', '480', '0', '20170605', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-06 00:00:05', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('762', '3', '0', '20170605', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-06 00:00:05', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('763', '33', '0', '20170605', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-06 00:00:05', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('764', '34', '0', '20170605', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-06 00:00:05', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('765', '35', '0', '20170605', '0.00', '40.49', '0.00', '0.00', '1', '1', '1', '2017-06-06 00:00:05', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('766', '32', '0', '20170605', '0.00', '3.62', '0.00', '0.00', '1', '1', '1', '2017-06-06 00:00:05', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('767', '27', '0', '20170605', '0.00', '152.90', '0.00', '0.00', '1', '1', '1', '2017-06-06 00:00:05', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('768', '26', '0', '20170605', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-06 00:00:05', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('769', '15', '0', '20170606', '500.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('770', '18', '0', '20170606', '15.67', '106.19', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('771', '30', '0', '20170606', '50.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('772', '1', '0', '20170606', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('773', '450', '0', '20170606', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('774', '477', '0', '20170606', '0.32', '171.22', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('775', '248', '0', '20170606', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('776', '478', '0', '20170606', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('777', '479', '0', '20170606', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('778', '480', '0', '20170606', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('779', '3', '0', '20170606', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('780', '33', '0', '20170606', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('781', '34', '0', '20170606', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('782', '35', '0', '20170606', '0.00', '40.49', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('783', '32', '0', '20170606', '0.00', '3.62', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('784', '27', '0', '20170606', '0.00', '152.90', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('785', '26', '0', '20170606', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-07 00:00:01', '2017-06-07 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('786', '15', '0', '20170607', '25.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-08 11:15:05', '2017-06-08 11:15:12', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('787', '15', '0', '20170527', '40.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-08 11:18:19', '2017-06-08 11:18:22', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('788', '15', '0', '20170501', '75.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('789', '15', '0', '20170502', '62.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('790', '15', '0', '20170503', '229.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('791', '15', '0', '20170504', '341.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('792', '15', '0', '20170505', '416.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('793', '15', '0', '20170506', '306.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('794', '15', '0', '20170507', '496.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('795', '15', '0', '20170508', '339.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('796', '15', '0', '20170509', '169.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('797', '15', '0', '20170510', '174.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('798', '15', '0', '20170511', '477.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('799', '15', '0', '20170512', '109.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('800', '15', '0', '20170513', '239.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('801', '15', '0', '20170514', '255.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('802', '15', '0', '20170515', '161.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('803', '15', '0', '20170516', '301.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('804', '15', '0', '20170517', '429.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('805', '15', '0', '20170518', '1486.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('806', '15', '0', '20170519', '266.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('807', '15', '0', '20170520', '550.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('808', '15', '0', '20170521', '494.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('809', '15', '0', '20170522', '230.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('810', '15', '0', '20170523', '77.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('811', '15', '0', '20170524', '335.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('812', '15', '0', '20170525', '84.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('813', '15', '0', '20170526', '70.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-04-15 18:55:22', '2017-04-15 18:56:00', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('814', '15', '0', '20170609', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:03', '2017-06-10 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('815', '479', '0', '20170609', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:03', '2017-06-10 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('816', '3', '0', '20170609', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:03', '2017-06-10 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('817', '33', '0', '20170609', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:03', '2017-06-10 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('818', '34', '0', '20170609', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:03', '2017-06-10 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('819', '35', '0', '20170609', '0.00', '40.49', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:03', '2017-06-10 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('820', '32', '0', '20170609', '0.00', '3.62', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:03', '2017-06-10 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('821', '27', '0', '20170609', '0.00', '152.90', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:03', '2017-06-10 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('822', '26', '0', '20170609', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:03', '2017-06-10 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('823', '1', '0', '20170609', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:03', '2017-06-10 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('824', '450', '0', '20170609', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:03', '2017-06-10 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('825', '477', '0', '20170609', '23.16', '194.38', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:03', '2017-06-10 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('826', '248', '0', '20170609', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:03', '2017-06-10 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('827', '30', '0', '20170609', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:04', '2017-06-10 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('828', '478', '0', '20170609', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:04', '2017-06-10 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('829', '18', '0', '20170609', '39.01', '145.20', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:04', '2017-06-10 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('830', '480', '0', '20170609', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-10 00:00:04', '2017-06-10 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('831', '480', '0', '20170612', '29.05', '29.05', '0.00', '0.00', '1', '1', '1', '2017-06-12 11:21:19', '2017-06-13 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('832', '15', '0', '20170612', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-13 00:00:07', '2017-06-13 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('833', '479', '0', '20170612', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-13 00:00:07', '2017-06-13 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('834', '3', '0', '20170612', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-13 00:00:07', '2017-06-13 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('835', '33', '0', '20170612', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-13 00:00:07', '2017-06-13 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('836', '34', '0', '20170612', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-13 00:00:07', '2017-06-13 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('837', '35', '0', '20170612', '0.00', '40.49', '0.00', '0.00', '1', '1', '1', '2017-06-13 00:00:07', '2017-06-13 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('838', '32', '0', '20170612', '0.00', '3.62', '0.00', '0.00', '1', '1', '1', '2017-06-13 00:00:07', '2017-06-13 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('839', '27', '0', '20170612', '0.00', '152.90', '0.00', '0.00', '1', '1', '1', '2017-06-13 00:00:07', '2017-06-13 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('840', '26', '0', '20170612', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-13 00:00:07', '2017-06-13 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('841', '1', '0', '20170612', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-13 00:00:07', '2017-06-13 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('842', '450', '0', '20170612', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-13 00:00:07', '2017-06-13 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('843', '477', '0', '20170612', '0.00', '194.38', '0.00', '0.00', '1', '1', '1', '2017-06-13 00:00:07', '2017-06-13 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('844', '30', '0', '20170612', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-13 00:00:07', '2017-06-13 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('845', '478', '0', '20170612', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-13 00:00:07', '2017-06-13 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('846', '18', '0', '20170612', '0.00', '145.20', '0.00', '0.00', '1', '1', '1', '2017-06-13 00:00:07', '2017-06-13 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('848', '248', '0', '20170613', '100.00', '100.00', '0.00', '0.00', '1', '1', '1', '2017-06-13 14:45:26', '2017-06-13 20:23:13', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('851', '15', '0', '20170613', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-14 00:00:07', '2017-06-14 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('852', '479', '0', '20170613', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-14 00:00:07', '2017-06-14 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('853', '3', '0', '20170613', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-14 00:00:07', '2017-06-14 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('854', '33', '0', '20170613', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-14 00:00:07', '2017-06-14 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('855', '34', '0', '20170613', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-14 00:00:07', '2017-06-14 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('856', '35', '0', '20170613', '0.00', '40.49', '0.00', '0.00', '1', '1', '1', '2017-06-14 00:00:07', '2017-06-14 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('857', '32', '0', '20170613', '0.00', '3.62', '0.00', '0.00', '1', '1', '1', '2017-06-14 00:00:07', '2017-06-14 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('858', '27', '0', '20170613', '0.00', '152.90', '0.00', '0.00', '1', '1', '1', '2017-06-14 00:00:07', '2017-06-14 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('859', '26', '0', '20170613', '0.03', '0.03', '0.00', '0.00', '1', '1', '1', '2017-06-14 00:00:07', '2017-06-14 00:00:07', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('860', '1', '0', '20170613', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-14 00:00:08', '2017-06-14 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('861', '450', '0', '20170613', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-14 00:00:08', '2017-06-14 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('862', '477', '0', '20170613', '0.00', '194.38', '0.00', '0.00', '1', '1', '1', '2017-06-14 00:00:08', '2017-06-14 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('863', '30', '0', '20170613', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-14 00:00:08', '2017-06-14 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('864', '478', '0', '20170613', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-14 00:00:08', '2017-06-14 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('865', '18', '0', '20170613', '0.00', '145.20', '0.00', '0.00', '1', '1', '1', '2017-06-14 00:00:08', '2017-06-14 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('866', '480', '0', '20170613', '0.00', '29.05', '0.00', '0.00', '1', '1', '1', '2017-06-14 00:00:09', '2017-06-14 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('867', '248', '0', '20170614', '84.05', '184.05', '0.00', '0.00', '1', '1', '1', '2017-06-14 15:37:51', '2017-06-15 00:00:17', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('869', '15', '0', '20170614', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-15 00:00:16', '2017-06-15 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('870', '479', '0', '20170614', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-15 00:00:16', '2017-06-15 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('871', '3', '0', '20170614', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-15 00:00:16', '2017-06-15 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('872', '33', '0', '20170614', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-15 00:00:16', '2017-06-15 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('873', '34', '0', '20170614', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-15 00:00:16', '2017-06-15 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('874', '35', '0', '20170614', '0.00', '40.49', '0.00', '0.00', '1', '1', '1', '2017-06-15 00:00:16', '2017-06-15 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('875', '32', '0', '20170614', '0.00', '3.62', '0.00', '0.00', '1', '1', '1', '2017-06-15 00:00:16', '2017-06-15 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('876', '27', '0', '20170614', '0.00', '152.90', '0.00', '0.00', '1', '1', '1', '2017-06-15 00:00:16', '2017-06-15 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('877', '26', '0', '20170614', '0.00', '0.03', '0.00', '0.00', '1', '1', '1', '2017-06-15 00:00:16', '2017-06-15 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('878', '1', '0', '20170614', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-15 00:00:17', '2017-06-15 00:00:17', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('879', '450', '0', '20170614', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-15 00:00:17', '2017-06-15 00:00:17', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('880', '477', '0', '20170614', '0.00', '194.38', '0.00', '0.00', '1', '1', '1', '2017-06-15 00:00:17', '2017-06-15 00:00:17', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('882', '30', '0', '20170614', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-15 00:00:18', '2017-06-15 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('883', '478', '0', '20170614', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-15 00:00:18', '2017-06-15 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('884', '18', '0', '20170614', '0.00', '145.20', '0.00', '0.00', '1', '1', '1', '2017-06-15 00:00:19', '2017-06-15 00:00:19', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('885', '480', '0', '20170614', '0.00', '29.05', '0.00', '0.00', '1', '1', '1', '2017-06-15 00:00:20', '2017-06-15 00:00:20', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('886', '15', '0', '20170615', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:08', '2017-06-16 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('887', '479', '0', '20170615', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:08', '2017-06-16 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('888', '3', '0', '20170615', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:08', '2017-06-16 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('889', '33', '0', '20170615', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:08', '2017-06-16 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('890', '34', '0', '20170615', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:08', '2017-06-16 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('891', '35', '0', '20170615', '0.00', '40.49', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:08', '2017-06-16 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('892', '32', '0', '20170615', '0.00', '3.62', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:08', '2017-06-16 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('893', '27', '0', '20170615', '0.00', '152.90', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:08', '2017-06-16 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('894', '26', '0', '20170615', '0.00', '0.03', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:08', '2017-06-16 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('895', '1', '0', '20170615', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:09', '2017-06-16 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('896', '450', '0', '20170615', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:09', '2017-06-16 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('897', '477', '0', '20170615', '0.00', '194.38', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:09', '2017-06-16 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('898', '248', '0', '20170615', '0.58', '184.63', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:09', '2017-06-16 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('899', '30', '0', '20170615', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:10', '2017-06-16 00:00:10', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('900', '478', '0', '20170615', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:10', '2017-06-16 00:00:10', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('901', '18', '0', '20170615', '0.00', '145.20', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:11', '2017-06-16 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('902', '480', '0', '20170615', '0.00', '29.05', '0.00', '0.00', '1', '1', '1', '2017-06-16 00:00:12', '2017-06-16 00:00:12', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('903', '15', '0', '20170616', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:08', '2017-06-17 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('904', '479', '0', '20170616', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:08', '2017-06-17 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('905', '3', '0', '20170616', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:08', '2017-06-17 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('906', '33', '0', '20170616', '261.70', '261.70', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:08', '2017-06-17 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('907', '34', '0', '20170616', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:08', '2017-06-17 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('908', '35', '0', '20170616', '0.00', '40.49', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:08', '2017-06-17 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('909', '32', '0', '20170616', '0.00', '3.62', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:08', '2017-06-17 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('910', '27', '0', '20170616', '0.00', '152.90', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:08', '2017-06-17 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('911', '26', '0', '20170616', '0.00', '0.03', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:08', '2017-06-17 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('912', '1', '0', '20170616', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:09', '2017-06-17 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('913', '450', '0', '20170616', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:09', '2017-06-17 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('914', '477', '0', '20170616', '0.00', '194.38', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:09', '2017-06-17 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('915', '248', '0', '20170616', '4.24', '188.87', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:09', '2017-06-17 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('916', '30', '0', '20170616', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:10', '2017-06-17 00:00:10', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('917', '478', '0', '20170616', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:10', '2017-06-17 00:00:10', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('918', '18', '0', '20170616', '0.00', '145.20', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:11', '2017-06-17 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('919', '480', '0', '20170616', '0.00', '29.05', '0.00', '0.00', '1', '1', '1', '2017-06-17 00:00:12', '2017-06-17 00:00:12', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('920', '15', '0', '20170617', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:08', '2017-06-18 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('921', '479', '0', '20170617', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:08', '2017-06-18 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('922', '3', '0', '20170617', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:08', '2017-06-18 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('923', '33', '0', '20170617', '0.00', '261.70', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:08', '2017-06-18 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('924', '34', '0', '20170617', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:08', '2017-06-18 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('925', '35', '0', '20170617', '0.00', '40.49', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:08', '2017-06-18 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('926', '32', '0', '20170617', '0.00', '3.62', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:08', '2017-06-18 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('927', '27', '0', '20170617', '0.00', '152.90', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:08', '2017-06-18 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('928', '26', '0', '20170617', '0.00', '0.03', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:08', '2017-06-18 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('929', '1', '0', '20170617', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:09', '2017-06-18 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('930', '450', '0', '20170617', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:09', '2017-06-18 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('931', '477', '0', '20170617', '0.00', '194.38', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:09', '2017-06-18 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('932', '248', '0', '20170617', '0.00', '188.87', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:09', '2017-06-18 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('933', '30', '0', '20170617', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:10', '2017-06-18 00:00:10', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('934', '478', '0', '20170617', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:10', '2017-06-18 00:00:10', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('935', '18', '0', '20170617', '0.00', '145.20', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:11', '2017-06-18 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('936', '480', '0', '20170617', '0.00', '29.05', '0.00', '0.00', '1', '1', '1', '2017-06-18 00:00:12', '2017-06-18 00:00:12', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('937', '15', '0', '20170618', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:08', '2017-06-19 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('938', '479', '0', '20170618', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:08', '2017-06-19 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('939', '3', '0', '20170618', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:08', '2017-06-19 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('940', '33', '0', '20170618', '0.00', '261.70', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:08', '2017-06-19 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('941', '34', '0', '20170618', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:08', '2017-06-19 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('942', '35', '0', '20170618', '0.00', '40.49', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:08', '2017-06-19 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('943', '32', '0', '20170618', '0.00', '3.62', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:08', '2017-06-19 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('944', '27', '0', '20170618', '0.00', '152.90', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:08', '2017-06-19 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('945', '26', '0', '20170618', '0.00', '0.03', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:08', '2017-06-19 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('946', '1', '0', '20170618', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:09', '2017-06-19 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('947', '450', '0', '20170618', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:09', '2017-06-19 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('948', '477', '0', '20170618', '0.00', '194.38', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:09', '2017-06-19 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('949', '248', '0', '20170618', '0.00', '188.87', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:09', '2017-06-19 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('950', '30', '0', '20170618', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:10', '2017-06-19 00:00:10', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('951', '478', '0', '20170618', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:10', '2017-06-19 00:00:10', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('952', '18', '0', '20170618', '8.43', '153.63', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:11', '2017-06-19 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('953', '480', '0', '20170618', '0.00', '29.05', '0.00', '0.00', '1', '1', '1', '2017-06-19 00:00:16', '2017-06-19 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('954', '15', '0', '20170619', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:08', '2017-06-20 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('955', '479', '0', '20170619', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:08', '2017-06-20 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('956', '3', '0', '20170619', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:08', '2017-06-20 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('957', '33', '0', '20170619', '0.00', '261.70', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:08', '2017-06-20 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('958', '34', '0', '20170619', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:08', '2017-06-20 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('959', '35', '0', '20170619', '0.00', '40.49', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:08', '2017-06-20 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('960', '32', '0', '20170619', '0.00', '3.62', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:08', '2017-06-20 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('961', '27', '0', '20170619', '0.00', '152.90', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:08', '2017-06-20 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('962', '26', '0', '20170619', '0.00', '0.03', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:08', '2017-06-20 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('963', '1', '0', '20170619', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:09', '2017-06-20 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('964', '450', '0', '20170619', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:09', '2017-06-20 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('965', '477', '0', '20170619', '0.00', '194.38', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:09', '2017-06-20 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('966', '248', '0', '20170619', '0.00', '188.87', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:09', '2017-06-20 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('967', '30', '0', '20170619', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:10', '2017-06-20 00:00:10', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('968', '478', '0', '20170619', '0.00', '0.00', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:10', '2017-06-20 00:00:10', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('969', '18', '0', '20170619', '20.29', '173.92', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:11', '2017-06-20 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_daily_flow` VALUES ('970', '480', '0', '20170619', '0.00', '29.05', '0.00', '0.00', '1', '1', '1', '2017-06-20 00:00:12', '2017-06-20 00:00:12', '0', 'admin');

-- ----------------------------
-- Table structure for flowmgn_flowaccount
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_flowaccount`;
CREATE TABLE `flowmgn_flowaccount` (
  `card_id` int(10) NOT NULL COMMENT '卡ID',
  `is_unlimit_flow` tinyint(1) DEFAULT '0' COMMENT '是否无限流量（0：有限流量 1：无限流量）',
  `totalflow` float(12,2) DEFAULT '0.00' COMMENT '总流量帐户',
  `used_totalflow` float(12,2) DEFAULT '0.00' COMMENT '总消耗流量',
  `currmonth_usedflow` float(12,2) DEFAULT '0.00' COMMENT '当月流量总消耗（月底清零）',
  `op_month_usedflow` float(12,2) DEFAULT '0.00' COMMENT '运营商侧月流量消耗',
  `status` tinyint(4) DEFAULT '0' COMMENT '帐户状态 (0:未启用 1:启用/2:停用/3:失效 ) ',
  `flow_unit` char(1) DEFAULT 'M' COMMENT '流量服务包单位（G/M）',
  `remain_totalflow` float(12,2) DEFAULT '0.00' COMMENT '剩余总流量',
  `next_balancedate` date DEFAULT NULL COMMENT '下一结算日期',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户流量帐户信息';

-- ----------------------------
-- Records of flowmgn_flowaccount
-- ----------------------------
INSERT INTO `flowmgn_flowaccount` VALUES ('1', '0', '6884.00', '0.00', '0.00', '0.00', '1', '', '6884.00', '1970-01-01', '2017-05-24 16:32:16', '2017-05-24 16:32:16', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_flowaccount` VALUES ('2', '0', '4336.00', '0.00', '0.00', '0.00', '1', '', '4336.00', '1970-01-01', '2017-05-08 18:03:14', '2017-05-08 18:03:14', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_flowaccount` VALUES ('3', '0', '6144.00', '466.53', '466.53', '0.00', '1', '', '5677.47', '1970-01-01', '2017-05-10 11:33:55', '2017-06-06 00:00:05', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_flowaccount` VALUES ('15', '1', '10240500.00', '0.00', '0.00', '0.00', '1', '', '10240500.00', '2018-06-08', '2017-06-08 16:16:31', '2017-06-08 16:16:31', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_flowaccount` VALUES ('18', '0', '240.00', '83.40', '83.40', '173.92', '1', '', '156.60', '2018-06-05', '2017-06-05 16:06:10', '2017-06-20 00:00:11', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_flowaccount` VALUES ('19', '0', '2048.00', '0.00', '0.00', '27.58', '1', '', '2048.00', '2017-06-16', '2017-05-16 10:36:14', '2017-05-16 10:36:15', '0', 'admin');
INSERT INTO `flowmgn_flowaccount` VALUES ('26', '0', '52224.00', '198.81', '198.81', '0.03', '1', '', '52025.20', '1970-01-01', '2017-06-11 00:10:31', '2017-06-14 00:00:07', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_flowaccount` VALUES ('27', '0', '3072.00', '0.00', '0.00', '152.90', '1', '', '3072.00', '2017-06-27', '2017-05-28 00:00:02', '2017-06-15 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_flowaccount` VALUES ('28', '0', '12288.00', '2103.80', '2103.80', '1051.90', '1', '', '10184.20', '2017-06-11', '2017-05-10 15:03:43', '2017-05-11 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_flowaccount` VALUES ('29', '0', '12288.00', '103.63', '103.63', '103.63', '1', '', '12184.40', '2017-06-11', '2017-05-10 15:03:43', '2017-05-13 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_flowaccount` VALUES ('30', '0', '9052.00', '0.00', '0.00', '0.00', '1', '', '9052.00', '1970-01-01', '2017-06-08 17:27:42', '2017-06-08 17:27:42', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_flowaccount` VALUES ('31', '0', '2048.00', '465.48', '465.48', '465.48', '1', '', '1582.52', '2018-05-11', '2017-05-10 15:03:43', '2017-05-27 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_flowaccount` VALUES ('32', '0', '2048.00', '2188.40', '2188.40', '3.62', '3', '', '-140.40', '2018-05-11', '2017-05-10 15:03:43', '2017-06-15 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_flowaccount` VALUES ('33', '0', '6144.00', '373.59', '373.59', '261.70', '1', '', '5770.41', '1970-01-01', '2017-06-19 00:02:08', '2017-06-19 00:02:08', '0', 'flowmgrsvr');
INSERT INTO `flowmgn_flowaccount` VALUES ('34', '0', '2168.00', '1629.09', '1629.09', '0.00', '1', '', '538.91', '1970-01-01', '2017-06-12 17:13:56', '2017-06-12 17:13:56', '0', 'flowmgrsvr');
INSERT INTO `flowmgn_flowaccount` VALUES ('35', '1', '0.00', '0.00', '0.00', '40.49', '0', '', '0.00', '1970-01-01', '2017-06-06 00:00:05', '2017-06-20 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_flowaccount` VALUES ('248', '1', '0.00', '0.00', '0.00', '188.87', '0', '', '0.00', '1970-01-01', '2017-06-06 00:00:05', '2017-06-20 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_flowaccount` VALUES ('450', '1', '0.00', '0.00', '0.00', '0.00', '0', '', '0.00', '1970-01-01', '2017-06-06 00:00:05', '2017-06-20 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_flowaccount` VALUES ('477', '1', '0.00', '0.00', '0.00', '194.38', '0', '', '0.00', '1970-01-01', '2017-06-05 13:39:02', '2017-06-20 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_flowaccount` VALUES ('478', '1', '0.00', '0.00', '0.00', '0.00', '0', '', '0.00', '1970-01-01', '2017-06-06 00:00:05', '2017-06-20 00:00:10', '0', 'admin');
INSERT INTO `flowmgn_flowaccount` VALUES ('479', '1', '0.00', '0.00', '0.00', '0.00', '0', '', '0.00', '1970-01-01', '2017-06-06 00:00:05', '2017-06-20 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_flowaccount` VALUES ('480', '1', '0.00', '0.00', '0.00', '29.05', '0', '', '0.00', '1970-01-01', '2017-06-06 00:00:05', '2017-06-20 00:00:12', '0', 'admin');

-- ----------------------------
-- Table structure for flowmgn_flowcard
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_flowcard`;
CREATE TABLE `flowmgn_flowcard` (
  `card_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流量卡序列ID',
  `card_no` varchar(64) NOT NULL COMMENT '卡号',
  `imsi` varchar(64) NOT NULL COMMENT 'IMSI',
  `imei` varchar(64) DEFAULT NULL COMMENT '卡的imei值',
  `iccid` varchar(19) NOT NULL COMMENT 'ICCID 保存19位',
  `delivery_time` datetime DEFAULT NULL COMMENT '运营商发货日期',
  `active_time` datetime DEFAULT NULL COMMENT '运营商激活日期',
  `init_postage_id` int(10) DEFAULT NULL COMMENT '初始资费计划ID（运营商侧）',
  `postage_id` int(10) DEFAULT '0' COMMENT '资费计划ID（运营商侧）',
  `postage_begintime` datetime DEFAULT NULL COMMENT '资费计划生效日期',
  `postage_endtime` datetime DEFAULT NULL COMMENT '资费计划到期日期',
  `package_id` int(10) DEFAULT '0' COMMENT '服务商套餐ID（服务侧）',
  `package_status` tinyint(4) DEFAULT NULL COMMENT '套餐状态（0：库存/1:已激活2：已过期）',
  `package_begintime` datetime DEFAULT NULL COMMENT '服务商套餐生效时间',
  `package_endtime` datetime DEFAULT NULL COMMENT '服务商套餐结束时间',
  `in_stk_order_id` int(10) DEFAULT '0' COMMENT '入库订单序号',
  `in_stock_time` datetime DEFAULT NULL COMMENT '卡入库时间',
  `out_stock_time` datetime DEFAULT NULL COMMENT '卡出库时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '卡状态 (0=可测试/1=库存卡/3=可激活/4=已激活/5=已停卡/6=已销卡)',
  `status_change_time` datetime DEFAULT NULL COMMENT '卡状态变更时间',
  `status_change_reason_id` int(8) DEFAULT '0' COMMENT '卡状态变更原因id, 0:空 1:运营商停机 2:流量超出 3:有效期过期 4:其他原因（如商户操作停卡）',
  `status_change_reason` varchar(128) DEFAULT NULL COMMENT '卡状态变更原因',
  `last_active_time` datetime DEFAULT NULL COMMENT '最后激活状态更新时间',
  `op_id` int(10) DEFAULT '0' COMMENT '卡所属运营商ID',
  `sp_id` int(10) DEFAULT '0' COMMENT '卡发货给服务商ID',
  `init_access_id` int(10) DEFAULT '0' COMMENT '初始通讯计划ID',
  `curr_access_id` int(10) DEFAULT NULL COMMENT '当前通讯计划ID',
  `iccidn` varchar(64) DEFAULT NULL COMMENT '运营商加+“N"带检验位',
  `is_authname` tinyint(4) DEFAULT '0' COMMENT '实名认证状态 （0：未认证 1：已认证）',
  `card_type` tinyint(4) DEFAULT NULL COMMENT '卡类型：(1:工业贴片卡/2:工业大卡/3:双切卡)',
  `auto_active_date` datetime DEFAULT NULL COMMENT '自动激活截止日期, 激活宽限期计算而来',
  `is_recycle_card` tinyint(1) DEFAULT '0' COMMENT '是否回收卡（0：新卡 /1:回收卡）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`card_id`),
  UNIQUE KEY `card_imsi` (`imsi`),
  UNIQUE KEY `card_iccid` (`iccid`),
  UNIQUE KEY `card_iccidn` (`iccidn`)
) ENGINE=InnoDB AUTO_INCREMENT=681 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='流量平台中心卡信息';

-- ----------------------------
-- Records of flowmgn_flowcard
-- ----------------------------
INSERT INTO `flowmgn_flowcard` VALUES ('1', '861064610752640', '460060201010300', '3562960166917778', '8986061501003065300', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '5', '2017-06-13 16:44:19', '4', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '89860615010030653007', '1', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-20 00:00:09', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('2', '861064610752611', '460060082076516', '3562960132734772', '8986061501003065211', '2017-04-10 13:55:10', '2017-04-10 13:55:10', null, '1', '2017-04-10 13:55:10', '2018-04-10 13:55:10', '12', '1', '2017-05-08 18:03:14', '2019-04-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '1', '2017-04-10 13:55:10', '0', null, null, '1', '3', '654312', '654312', '89860615010030652118', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-05-08 18:03:14', '1', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('3', '861064620714631', '460060082076518', '3589620791163801', '8986061602001666518', '2016-11-21 00:00:00', '2017-02-14 14:23:09', '1', '1', '2017-02-14 14:23:09', '2018-02-09 14:23:09', '13', '1', '2017-04-26 12:50:02', '2017-10-27 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-19 16:38:25', '0', '', '2017-06-19 16:38:25', '1', '3', '654312', '521317', '89860616020016665189', '0', '1', '2018-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-20 00:00:08', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('15', '861064618632297', '460068001067232', '3587660133680101', '8986061501001356722', '2016-05-30 00:00:00', '2016-10-13 21:01:10', '1', '1', '2016-10-13 21:01:10', '2017-10-08 21:01:10', '11', '1', '2017-06-08 16:12:58', '2018-06-08 23:59:59', '11223344', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-20 11:36:47', '0', '', '2017-06-20 11:36:47', '1', '3', '654312', '654312', '89860615010013567224', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-20 11:36:47', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('18', '861064618632317', '460068001067252', '8916416100203001', '8986061501001356742', '2016-05-30 00:00:00', '2017-03-02 15:35:04', '1', '1', '2017-03-02 15:35:04', '2018-02-25 15:35:04', '12', '1', '2017-06-05 15:44:58', '2020-05-09 23:59:59', '11223344', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-19 00:00:11', '0', '', '2017-06-19 00:00:11', '1', '3', '654312', '654312', '89860615010013567422', '1', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-20 00:00:11', '0', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('26', '861064629354734', '460069022004734', '3532110825891278', '8986061702001635709', '2017-03-24 00:00:00', '2017-05-09 16:14:37', '4', '4', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '19', '1', '2017-05-10 18:11:02', '2020-08-10 23:59:59', '11223344', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-12 17:32:42', '0', '', '2017-06-12 14:40:36', '1', '4', '654312', '521217', '89860617020016357091', '1', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-20 00:00:08', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('27', '861064629354733', '460069022004733', '3532110825885178', '8986061702001635708', '2017-03-24 00:00:00', '2017-05-27 15:01:06', '4', '4', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '20', '1', '2017-05-28 00:00:02', '2017-08-27 23:59:59', '11223344', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-05-28 00:00:03', '0', '', '2017-04-10 13:55:10', '1', '4', '654312', '521217', '89860617020016357083', '0', '1', '2018-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-20 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('30', '861064610752639', '460060201010299', '3562960153843978', '8986061501003065299', '2016-03-15 00:00:00', '2016-03-17 13:53:28', '4', '4', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '11', '1', '2017-05-10 15:03:43', '2021-05-10 23:59:59', '11223344', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '5', '2017-06-15 22:13:04', '1', '运营商停机', '2017-05-22 17:50:27', '1', '3', '654312', '654312', '89860615010030652991', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-20 00:00:10', '1', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('32', '861064627674556', '460067062043350', '8657170401495600', '8986061602003133040', '2016-10-28 00:00:00', '2016-11-18 22:07:03', '1', '1', '2016-11-18 22:07:03', '2017-11-13 22:07:03', '11', '2', '2017-05-10 15:03:43', '2017-06-15 00:00:16', '11223344', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '5', '2017-06-12 11:00:08', '1', '运营商停机', '2017-06-12 10:27:36', '1', '1', '654312', '654312', '89860616020031330405', '1', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-20 00:00:08', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('33', '861064620714633', '460060082076520', '8640350200772200', '8986061602001666520', '2016-11-21 00:00:00', '2017-04-05 11:50:26', '1', '1', '2017-04-05 11:50:26', '2018-03-31 11:50:26', '20', '1', '2017-05-18 14:38:35', '2017-08-18 23:59:59', '11223344', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '5', '2017-06-17 00:00:08', '1', '运营商停机', '2017-05-18 14:03:32', '1', '4', '654312', '654312', '89860616020016665205', '0', '1', '2018-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-20 00:00:08', '1', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('34', '861064627674552', '460067062043346', '8671520246019755', '8986061602003133036', '2016-10-28 00:00:00', '2016-11-18 22:06:27', '1', '1', '2016-11-18 22:06:27', '2017-11-13 22:06:27', '11', '1', '2017-05-12 18:44:57', '2019-05-12 23:59:59', '11223344', '2017-05-10 18:12:42', '2017-04-10 13:55:10', '5', '2017-06-13 16:44:19', '4', '', '2017-06-13 16:42:51', '1', '3', '277317', '277317', '89860616020031330363', '0', '1', '2017-05-12 15:27:37', '0', '2017-05-10 18:12:42', '2017-06-20 00:00:08', '19180009', 'test');
INSERT INTO `flowmgn_flowcard` VALUES ('35', '861064627674555', '460067062043349', '8619140309418901', '8986061602003133039', '2016-10-28 00:00:00', '2016-11-18 22:06:49', '1', '1', '2016-11-18 22:06:49', '2017-11-13 22:06:49', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '112312313', '2017-05-12 14:45:08', '2017-06-02 14:21:43', '4', '2017-06-15 15:04:52', '0', '', '2017-06-15 15:04:52', '1', '3', '521317', '521317', '89860616020031330397', '0', '1', '2017-05-12 15:27:37', '0', '2017-05-12 14:45:08', '2017-06-20 00:00:08', '19180009', 'test');
INSERT INTO `flowmgn_flowcard` VALUES ('248', '861064613351577', '460063021063237', '3562281595383578', '8986061501003418237', '2016-05-08 00:00:00', '2016-07-25 14:02:29', '1', '1', '2016-07-25 14:02:29', '2017-07-20 14:02:29', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '112312313', '2017-05-23 10:35:11', '2017-06-02 14:21:43', '4', '2017-06-15 10:58:50', '0', '', '2017-06-15 10:58:50', '1', '3', '521317', '521317', '89860615010034182375', '0', '2', '2018-06-02 14:15:55', '0', '2017-05-23 10:35:11', '2017-06-20 00:00:09', '19180009', '广联赛讯');
INSERT INTO `flowmgn_flowcard` VALUES ('450', '861064610752642', '460060201010302', '3587660162341301', '8986061501003065302', '2016-03-15 00:00:00', '2016-03-21 14:18:49', '1', '1', '2017-03-16 14:23:30', '2018-03-11 14:23:30', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '112312313', '2017-06-02 14:13:46', '2017-06-02 14:21:43', '5', '2017-06-06 00:00:05', '1', '运营商停机', '2017-06-02 14:14:36', '1', '3', '1', '1', '89860615010030653023', '0', '1', '2018-06-02 14:15:55', '0', '2017-04-10 13:55:10', '2017-06-20 00:00:09', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('477', '861064610752644', '460060201010304', '1234567890123401', '8986061501003065304', '2016-03-15 00:00:00', '2016-03-23 17:42:59', '1', '1', '2017-03-30 16:35:39', '2018-03-25 16:35:39', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '112312313', '2017-06-02 14:13:46', '2017-06-02 14:21:43', '5', '2017-06-13 00:00:07', '1', '运营商停机', '2017-06-10 00:00:04', '1', '3', '1', '1', '89860615010030653049', '0', '1', '2018-06-02 14:15:55', '0', '2017-04-10 13:55:10', '2017-06-20 00:00:09', '2', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('478', '861064613351578', '460063021063238', '3576190494794100', '8986061501003418238', '2016-05-08 00:00:00', '2016-07-19 15:20:53', '1', '1', '2016-07-19 15:20:53', '2017-07-14 15:20:53', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '112312313', '2017-06-02 14:13:46', '2017-06-02 14:21:43', '4', '2017-06-13 10:55:19', '0', '123', '2017-06-13 10:55:19', '1', '3', '1', '1', '89860615010034182383', '0', '1', '2018-06-02 14:15:55', '0', '2017-04-10 13:55:10', '2017-06-20 00:00:10', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('479', '861064620039512', '460060002039492', '3589620791180901', '8986061602000239492', '2016-06-22 00:00:00', '2016-08-19 18:19:15', '1', '1', '2016-08-19 18:19:15', '2017-08-14 18:19:15', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '112312313', '2017-06-02 14:13:46', '2017-06-02 14:21:43', '4', '2017-06-06 00:00:05', '0', '', '2017-06-06 00:00:05', '1', '3', '1', '1', '89860616020002394927', '0', '1', '2018-06-02 14:15:55', '0', '2017-04-10 13:55:10', '2017-06-20 00:00:08', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('480', '861064620039515', '460060002039495', '3587660133680101', '8986061602000239495', '2016-06-22 00:00:00', '2016-08-20 11:07:12', '1', '1', '2016-08-20 11:07:12', '2017-08-15 11:07:12', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '112312313', '2017-06-02 14:13:46', '2017-06-02 14:21:43', '5', '2017-06-12 11:21:20', '1', '运营商停机', '2017-06-09 17:49:49', '1', '3', '1', '1', '89860616020002394950', '0', '1', '2018-06-02 14:15:55', '0', '2017-04-10 13:55:10', '2017-06-20 00:00:12', '2', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('481', '900000000000002', '100000000000002', null, '1000000000000000002', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000021', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('482', '900000000000003', '100000000000003', null, '1000000000000000003', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000031', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('483', '900000000000004', '100000000000004', null, '1000000000000000004', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000041', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('484', '900000000000005', '100000000000005', null, '1000000000000000005', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000051', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('485', '900000000000006', '100000000000006', null, '1000000000000000006', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000061', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('486', '900000000000007', '100000000000007', null, '1000000000000000007', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000071', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('487', '900000000000008', '100000000000008', null, '1000000000000000008', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000081', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('488', '900000000000009', '100000000000009', null, '1000000000000000009', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000091', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('489', '900000000000010', '100000000000010', null, '1000000000000000010', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000101', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('490', '900000000000011', '100000000000011', null, '1000000000000000011', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000111', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('491', '900000000000012', '100000000000012', null, '1000000000000000012', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000121', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('492', '900000000000013', '100000000000013', null, '1000000000000000013', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000131', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('493', '900000000000014', '100000000000014', null, '1000000000000000014', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000141', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('494', '900000000000015', '100000000000015', null, '1000000000000000015', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000151', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('495', '900000000000016', '100000000000016', null, '1000000000000000016', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000161', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('496', '900000000000017', '100000000000017', null, '1000000000000000017', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000171', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('497', '900000000000018', '100000000000018', null, '1000000000000000018', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000181', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('498', '900000000000019', '100000000000019', null, '1000000000000000019', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000191', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('499', '900000000000020', '100000000000020', null, '1000000000000000020', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000201', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('500', '900000000000021', '100000000000021', null, '1000000000000000021', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000211', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('501', '900000000000022', '100000000000022', null, '1000000000000000022', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000221', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('502', '900000000000023', '100000000000023', null, '1000000000000000023', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000231', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('503', '900000000000024', '100000000000024', null, '1000000000000000024', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000241', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('504', '900000000000025', '100000000000025', null, '1000000000000000025', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000251', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('505', '900000000000026', '100000000000026', null, '1000000000000000026', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000261', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('506', '900000000000027', '100000000000027', null, '1000000000000000027', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000271', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('507', '900000000000028', '100000000000028', null, '1000000000000000028', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000281', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('508', '900000000000029', '100000000000029', null, '1000000000000000029', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000291', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('509', '900000000000030', '100000000000030', null, '1000000000000000030', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000301', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('510', '900000000000031', '100000000000031', null, '1000000000000000031', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000311', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('511', '900000000000032', '100000000000032', null, '1000000000000000032', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000321', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('512', '900000000000033', '100000000000033', null, '1000000000000000033', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000331', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('513', '900000000000034', '100000000000034', null, '1000000000000000034', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000341', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('514', '900000000000035', '100000000000035', null, '1000000000000000035', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000351', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('515', '900000000000036', '100000000000036', null, '1000000000000000036', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000361', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('516', '900000000000037', '100000000000037', null, '1000000000000000037', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000371', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('517', '900000000000038', '100000000000038', null, '1000000000000000038', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000381', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('518', '900000000000039', '100000000000039', null, '1000000000000000039', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000391', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('519', '900000000000040', '100000000000040', null, '1000000000000000040', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000401', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('520', '900000000000041', '100000000000041', null, '1000000000000000041', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000411', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('521', '900000000000042', '100000000000042', null, '1000000000000000042', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000421', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('522', '900000000000043', '100000000000043', null, '1000000000000000043', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000431', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('523', '900000000000044', '100000000000044', null, '1000000000000000044', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000441', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('524', '900000000000045', '100000000000045', null, '1000000000000000045', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000451', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('525', '900000000000046', '100000000000046', null, '1000000000000000046', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000461', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('526', '900000000000047', '100000000000047', null, '1000000000000000047', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000471', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('527', '900000000000048', '100000000000048', null, '1000000000000000048', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000481', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('528', '900000000000049', '100000000000049', null, '1000000000000000049', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000491', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('529', '900000000000050', '100000000000050', null, '1000000000000000050', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000501', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('530', '900000000000051', '100000000000051', null, '1000000000000000051', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000511', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('531', '900000000000052', '100000000000052', null, '1000000000000000052', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000521', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('532', '900000000000053', '100000000000053', null, '1000000000000000053', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000531', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('533', '900000000000054', '100000000000054', null, '1000000000000000054', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000541', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('534', '900000000000055', '100000000000055', null, '1000000000000000055', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000551', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('535', '900000000000056', '100000000000056', null, '1000000000000000056', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000561', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('536', '900000000000057', '100000000000057', null, '1000000000000000057', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000571', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('537', '900000000000058', '100000000000058', null, '1000000000000000058', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000581', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('538', '900000000000059', '100000000000059', null, '1000000000000000059', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000591', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('539', '900000000000060', '100000000000060', null, '1000000000000000060', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000601', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('540', '900000000000061', '100000000000061', null, '1000000000000000061', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000611', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('541', '900000000000062', '100000000000062', null, '1000000000000000062', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000621', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('542', '900000000000063', '100000000000063', null, '1000000000000000063', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000631', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('543', '900000000000064', '100000000000064', null, '1000000000000000064', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000641', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('544', '900000000000065', '100000000000065', null, '1000000000000000065', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000651', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('545', '900000000000066', '100000000000066', null, '1000000000000000066', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000661', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('546', '900000000000067', '100000000000067', null, '1000000000000000067', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000671', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('547', '900000000000068', '100000000000068', null, '1000000000000000068', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000681', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('548', '900000000000069', '100000000000069', null, '1000000000000000069', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000691', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('549', '900000000000070', '100000000000070', null, '1000000000000000070', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000701', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('550', '900000000000071', '100000000000071', null, '1000000000000000071', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000711', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('551', '900000000000072', '100000000000072', null, '1000000000000000072', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000721', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('552', '900000000000073', '100000000000073', null, '1000000000000000073', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000731', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('553', '900000000000074', '100000000000074', null, '1000000000000000074', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000741', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('554', '900000000000075', '100000000000075', null, '1000000000000000075', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000751', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('555', '900000000000076', '100000000000076', null, '1000000000000000076', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000761', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('556', '900000000000077', '100000000000077', null, '1000000000000000077', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000771', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('557', '900000000000078', '100000000000078', null, '1000000000000000078', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000781', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('558', '900000000000079', '100000000000079', null, '1000000000000000079', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000791', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('559', '900000000000080', '100000000000080', null, '1000000000000000080', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000801', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('560', '900000000000081', '100000000000081', null, '1000000000000000081', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000811', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('561', '900000000000082', '100000000000082', null, '1000000000000000082', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000821', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('562', '900000000000083', '100000000000083', null, '1000000000000000083', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000831', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('563', '900000000000084', '100000000000084', null, '1000000000000000084', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000841', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('564', '900000000000085', '100000000000085', null, '1000000000000000085', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000851', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('565', '900000000000086', '100000000000086', null, '1000000000000000086', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000861', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('566', '900000000000087', '100000000000087', null, '1000000000000000087', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000871', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('567', '900000000000088', '100000000000088', null, '1000000000000000088', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000881', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('568', '900000000000089', '100000000000089', null, '1000000000000000089', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000891', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('569', '900000000000090', '100000000000090', null, '1000000000000000090', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000901', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('570', '900000000000091', '100000000000091', null, '1000000000000000091', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000911', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('571', '900000000000092', '100000000000092', null, '1000000000000000092', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000921', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('572', '900000000000093', '100000000000093', null, '1000000000000000093', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000931', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('573', '900000000000094', '100000000000094', null, '1000000000000000094', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000941', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('574', '900000000000095', '100000000000095', null, '1000000000000000095', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000951', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('575', '900000000000096', '100000000000096', null, '1000000000000000096', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000961', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('576', '900000000000097', '100000000000097', null, '1000000000000000097', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000971', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('577', '900000000000098', '100000000000098', null, '1000000000000000098', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000981', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('578', '900000000000099', '100000000000099', null, '1000000000000000099', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000000991', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('579', '900000000000100', '100000000000100', null, '1000000000000000100', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001001', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('580', '900000000000101', '100000000000101', null, '1000000000000000101', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001011', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('581', '900000000000102', '100000000000102', null, '1000000000000000102', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001021', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('582', '900000000000103', '100000000000103', null, '1000000000000000103', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001031', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('583', '900000000000104', '100000000000104', null, '1000000000000000104', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001041', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('584', '900000000000105', '100000000000105', null, '1000000000000000105', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001051', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('585', '900000000000106', '100000000000106', null, '1000000000000000106', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001061', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('586', '900000000000107', '100000000000107', null, '1000000000000000107', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001071', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('587', '900000000000108', '100000000000108', null, '1000000000000000108', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001081', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('588', '900000000000109', '100000000000109', null, '1000000000000000109', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001091', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('589', '900000000000110', '100000000000110', null, '1000000000000000110', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001101', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('590', '900000000000111', '100000000000111', null, '1000000000000000111', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001111', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('591', '900000000000112', '100000000000112', null, '1000000000000000112', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001121', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('592', '900000000000113', '100000000000113', null, '1000000000000000113', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001131', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('593', '900000000000114', '100000000000114', null, '1000000000000000114', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001141', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('594', '900000000000115', '100000000000115', null, '1000000000000000115', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001151', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('595', '900000000000116', '100000000000116', null, '1000000000000000116', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001161', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('596', '900000000000117', '100000000000117', null, '1000000000000000117', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001171', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('597', '900000000000118', '100000000000118', null, '1000000000000000118', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001181', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('598', '900000000000119', '100000000000119', null, '1000000000000000119', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001191', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('599', '900000000000120', '100000000000120', null, '1000000000000000120', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001201', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('600', '900000000000121', '100000000000121', null, '1000000000000000121', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001211', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('601', '900000000000122', '100000000000122', null, '1000000000000000122', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001221', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('602', '900000000000123', '100000000000123', null, '1000000000000000123', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001231', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('603', '900000000000124', '100000000000124', null, '1000000000000000124', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001241', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('604', '900000000000125', '100000000000125', null, '1000000000000000125', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001251', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('605', '900000000000126', '100000000000126', null, '1000000000000000126', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001261', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('606', '900000000000127', '100000000000127', null, '1000000000000000127', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001271', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('607', '900000000000128', '100000000000128', null, '1000000000000000128', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001281', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('608', '900000000000129', '100000000000129', null, '1000000000000000129', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001291', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('609', '900000000000130', '100000000000130', null, '1000000000000000130', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001301', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('610', '900000000000131', '100000000000131', null, '1000000000000000131', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001311', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('611', '900000000000132', '100000000000132', null, '1000000000000000132', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001321', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('612', '900000000000133', '100000000000133', null, '1000000000000000133', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001331', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('613', '900000000000134', '100000000000134', null, '1000000000000000134', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001341', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('614', '900000000000135', '100000000000135', null, '1000000000000000135', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001351', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('615', '900000000000136', '100000000000136', null, '1000000000000000136', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001361', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('616', '900000000000137', '100000000000137', null, '1000000000000000137', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001371', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('617', '900000000000138', '100000000000138', null, '1000000000000000138', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001381', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('618', '900000000000139', '100000000000139', null, '1000000000000000139', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001391', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('619', '900000000000140', '100000000000140', null, '1000000000000000140', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001401', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('620', '900000000000141', '100000000000141', null, '1000000000000000141', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001411', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('621', '900000000000142', '100000000000142', null, '1000000000000000142', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001421', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('622', '900000000000143', '100000000000143', null, '1000000000000000143', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001431', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('623', '900000000000144', '100000000000144', null, '1000000000000000144', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001441', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('624', '900000000000145', '100000000000145', null, '1000000000000000145', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001451', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('625', '900000000000146', '100000000000146', null, '1000000000000000146', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001461', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('626', '900000000000147', '100000000000147', null, '1000000000000000147', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001471', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('627', '900000000000148', '100000000000148', null, '1000000000000000148', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001481', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('628', '900000000000149', '100000000000149', null, '1000000000000000149', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001491', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('629', '900000000000150', '100000000000150', null, '1000000000000000150', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001501', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('630', '900000000000151', '100000000000151', null, '1000000000000000151', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001511', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('631', '900000000000152', '100000000000152', null, '1000000000000000152', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001521', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('632', '900000000000153', '100000000000153', null, '1000000000000000153', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001531', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('633', '900000000000154', '100000000000154', null, '1000000000000000154', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001541', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('634', '900000000000155', '100000000000155', null, '1000000000000000155', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001551', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('635', '900000000000156', '100000000000156', null, '1000000000000000156', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001561', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('636', '900000000000157', '100000000000157', null, '1000000000000000157', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001571', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('637', '900000000000158', '100000000000158', null, '1000000000000000158', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001581', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('638', '900000000000159', '100000000000159', null, '1000000000000000159', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001591', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('639', '900000000000160', '100000000000160', null, '1000000000000000160', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001601', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('640', '900000000000161', '100000000000161', null, '1000000000000000161', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001611', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('641', '900000000000162', '100000000000162', null, '1000000000000000162', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001621', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('642', '900000000000163', '100000000000163', null, '1000000000000000163', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001631', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('643', '900000000000164', '100000000000164', null, '1000000000000000164', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001641', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('644', '900000000000165', '100000000000165', null, '1000000000000000165', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001651', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('645', '900000000000166', '100000000000166', null, '1000000000000000166', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001661', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('646', '900000000000167', '100000000000167', null, '1000000000000000167', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001671', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('647', '900000000000168', '100000000000168', null, '1000000000000000168', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001681', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('648', '900000000000169', '100000000000169', null, '1000000000000000169', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001691', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('649', '900000000000170', '100000000000170', null, '1000000000000000170', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001701', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('650', '900000000000171', '100000000000171', null, '1000000000000000171', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001711', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('651', '900000000000172', '100000000000172', null, '1000000000000000172', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001721', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('652', '900000000000173', '100000000000173', null, '1000000000000000173', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001731', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('653', '900000000000174', '100000000000174', null, '1000000000000000174', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001741', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('654', '900000000000175', '100000000000175', null, '1000000000000000175', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001751', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('655', '900000000000176', '100000000000176', null, '1000000000000000176', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001761', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('656', '900000000000177', '100000000000177', null, '1000000000000000177', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001771', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('657', '900000000000178', '100000000000178', null, '1000000000000000178', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001781', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('658', '900000000000179', '100000000000179', null, '1000000000000000179', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001791', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('659', '900000000000180', '100000000000180', null, '1000000000000000180', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001801', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('660', '900000000000181', '100000000000181', null, '1000000000000000181', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001811', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('661', '900000000000182', '100000000000182', null, '1000000000000000182', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001821', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('662', '900000000000183', '100000000000183', null, '1000000000000000183', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001831', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('663', '900000000000184', '100000000000184', null, '1000000000000000184', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001841', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('664', '900000000000185', '100000000000185', null, '1000000000000000185', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001851', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('665', '900000000000186', '100000000000186', null, '1000000000000000186', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001861', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('666', '900000000000187', '100000000000187', null, '1000000000000000187', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001871', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('667', '900000000000188', '100000000000188', null, '1000000000000000188', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001881', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('668', '900000000000189', '100000000000189', null, '1000000000000000189', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001891', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('669', '900000000000190', '100000000000190', null, '1000000000000000190', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001901', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('670', '900000000000191', '100000000000191', null, '1000000000000000191', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001911', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('671', '900000000000192', '100000000000192', null, '1000000000000000192', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001921', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('672', '900000000000193', '100000000000193', null, '1000000000000000193', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001931', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('673', '900000000000194', '100000000000194', null, '1000000000000000194', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001941', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('674', '900000000000195', '100000000000195', null, '1000000000000000195', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001951', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('675', '900000000000196', '100000000000196', null, '1000000000000000196', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001961', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('676', '900000000000197', '100000000000197', null, '1000000000000000197', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001971', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('677', '900000000000198', '100000000000198', null, '1000000000000000198', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001981', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('678', '900000000000199', '100000000000199', null, '1000000000000000199', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000001991', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('679', '900000000000200', '100000000000200', null, '1000000000000000200', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000002001', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');
INSERT INTO `flowmgn_flowcard` VALUES ('680', '900000000000201', '100000000000201', null, '1000000000000000201', '2016-03-15 00:00:00', '2016-03-21 17:28:11', '1', '1', '2017-04-15 14:36:18', '2018-04-10 14:36:18', '11', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '11223355', '2017-04-10 13:55:10', '2017-04-10 13:55:10', '4', '2017-06-02 15:38:34', '0', '', '2017-06-02 15:38:34', '1', '3', '654312', '521317', '10000000000000002011', '0', '1', '2017-04-10 00:00:00', '0', '2017-04-10 13:55:10', '2017-06-07 00:00:01', '19180009', 'admin');

-- ----------------------------
-- Table structure for flowmgn_flowcard_costprofile
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_flowcard_costprofile`;
CREATE TABLE `flowmgn_flowcard_costprofile` (
  `profile_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `count_month` int(10) NOT NULL DEFAULT '0' COMMENT '月份，格式：201603',
  `total_cost` double(12,2) DEFAULT '0.00' COMMENT '本月实际总费用(元)',
  `cumulative_card_number` int(10) DEFAULT '0' COMMENT '累计卡数',
  `new_activate_card_number` int(10) DEFAULT '0' COMMENT '新激活卡数',
  `activated_card_number` int(10) DEFAULT '0' COMMENT '已激活卡数',
  `new_activate_contract_traffic_cost` double(12,2) DEFAULT '0.00' COMMENT '新激活签约流量费用(元)',
  `activated_contract_traffic_cost` double(12,2) DEFAULT '0.00' COMMENT '已激活签约流量费用(元)',
  `activate_total_cost` double(12,2) DEFAULT '0.00' COMMENT '激活总费用(元)',
  `event_count` int(10) DEFAULT '0' COMMENT '事件数',
  `event_total_cost` double(12,2) DEFAULT '0.00' COMMENT '事件总费用(元)',
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流量卡成本概况';

-- ----------------------------
-- Records of flowmgn_flowcard_costprofile
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_flowcard_nameauth
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_flowcard_nameauth`;
CREATE TABLE `flowmgn_flowcard_nameauth` (
  `nameauth_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录序号',
  `card_id` int(10) unsigned DEFAULT NULL COMMENT '流量卡ID',
  `person_name` varchar(64) DEFAULT NULL COMMENT '个人姓名',
  `person_mobileno` varchar(64) DEFAULT NULL COMMENT '个人联系手机号',
  `person_id` varchar(64) DEFAULT NULL COMMENT '个人身份证号',
  `person_photo` varchar(512) DEFAULT NULL COMMENT '手持身份证照片',
  `person_photo_pos` varchar(512) DEFAULT NULL COMMENT '身份证照正面',
  `person_photo_oop` varchar(512) DEFAULT NULL COMMENT '身份证照反面',
  `status` tinyint(4) DEFAULT NULL COMMENT '资料审核结果（0：待审核 1：审核通过 2：审核不通过 3：重新审核）',
  `fail_reason` varchar(128) DEFAULT NULL COMMENT '审核不通过原因',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `last_operator_id` int(10) DEFAULT NULL COMMENT '操作人ID',
  `last_operator_name` varchar(64) DEFAULT NULL COMMENT '操作人名称 ',
  PRIMARY KEY (`nameauth_id`),
  UNIQUE KEY `name_card_id` (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='流量卡实名认证';

-- ----------------------------
-- Records of flowmgn_flowcard_nameauth
-- ----------------------------
INSERT INTO `flowmgn_flowcard_nameauth` VALUES ('1', '1', '黄生', '18681598621', '453687678789821196', 'http://183.62.222.182:8525/v1/tfscom/T13yETByhT1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1xtETByhT1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1mNETByDT1RCvBVdK.jpg', '1', '待审核', '2017-05-26 18:38:24', '2017-05-26 18:38:24', '0', 'admin');
INSERT INTO `flowmgn_flowcard_nameauth` VALUES ('2', '2', '张三', '15017908843', '123456789000084515', 'http://183.62.222.182:8525/v1/tfscom/T1PNETB7V_1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1gzETBydT1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1ARETByJT1RCvBVdK.jpg', '3', '重新审核', '2017-06-15 11:22:04', '2017-06-15 11:22:04', '0', 'admin');
INSERT INTO `flowmgn_flowcard_nameauth` VALUES ('3', '3', '张小小', '13556230609', '855566955665668789', 'http://183.62.222.182:8525/v1/tfscom/T1PXETBQZ_1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1nXETBX__1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1yNETBmD_1RCvBVdK.jpg', '2', '图片不清晰', '2017-05-10 14:44:16', '2017-05-10 14:44:16', '0', 'admin');
INSERT INTO `flowmgn_flowcard_nameauth` VALUES ('45', '33', 'ssd', '15818523246', '432332190803232332', 'http://183.62.222.182:8525/v1/tfscom/T1XXETBjhv1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1PzETBQd_1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1LXETBQC_1RCvBVdK.jpg', '3', '资料错误', '2017-05-10 17:39:27', '2017-05-10 17:39:27', '0', 'admin');
INSERT INTO `flowmgn_flowcard_nameauth` VALUES ('46', '28', '黄冰淇淋', '13556230609', '538466843688960566', 'http://183.62.222.182:8525/v1/tfscom/T1CXETBQJ_1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1qNETBQx_1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1LFETBjbv1RCvBVdK.jpg', '3', '待审核', '2017-05-10 18:05:42', '2017-05-10 18:05:42', '0', 'admin');
INSERT INTO `flowmgn_flowcard_nameauth` VALUES ('49', '29', '8569', '18680331654', '362288632908254442', 'http://183.62.222.182:8525/v1/tfscom/T1PXETBQd_1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1qzETByA_1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1iXETBm__1RCvBVdK.jpg', '0', '待审核', '2017-05-10 16:45:34', '2017-05-10 16:45:34', '0', 'admin');
INSERT INTO `flowmgn_flowcard_nameauth` VALUES ('52', '15', '4555', '18680331654', '366261168593578665', 'http://183.62.222.182:8525/v1/tfscom/T1yFETBQE_1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1eNETBXx_1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1PFETBmW_1RCvBVdK.jpg', '0', '待审核', '2017-05-10 18:33:02', '2017-05-10 18:33:02', '0', 'admin');
INSERT INTO `flowmgn_flowcard_nameauth` VALUES ('56', '30', '谷大师', '18570326588', '556854646655564688', 'http://183.62.222.182:8525/v1/tfscom/T1eFETBKW_1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1gXETBydT1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1AaETByJT1RCvBVdK.jpg', '3', '待审核', '2017-06-14 15:36:06', '2017-06-14 15:36:06', '0', 'admin');
INSERT INTO `flowmgn_flowcard_nameauth` VALUES ('57', '18', '阿哈', '15017908843', '420123199011112345', 'http://183.62.222.182:8525/v1/tfscom/T1tRETByJT1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1ItETBydT1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1_NETBydT1RCvBVdK.jpg', '1', '', '2017-06-14 15:19:01', '2017-06-14 16:28:43', '0', 'admin');
INSERT INTO `flowmgn_flowcard_nameauth` VALUES ('59', '26', '实名认证', '15017908843', '420527190001011111', 'http://183.62.222.182:8525/v1/tfscom/T1StETByCT1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1AtETByJT1RCvBVdK.jpg', 'http://183.62.222.182:8525/v1/tfscom/T1ORETByZT1RCvBVdK.jpg', '1', '', '2017-06-14 17:03:44', '2017-06-14 17:04:33', '0', 'admin');

-- ----------------------------
-- Table structure for flowmgn_flowpackage_status_log
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_flowpackage_status_log`;
CREATE TABLE `flowmgn_flowpackage_status_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `card_id` int(10) DEFAULT '0' COMMENT '流量卡ID',
  `package_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '服务套餐类型:(1:初始套餐 2:续约套餐 3:续约流量包)',
  `package_id` int(10) DEFAULT '0' COMMENT '套餐ID',
  `op_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '操作状态:0=开通/1=停用/2=注销',
  `op_success_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '操作成功状态:0=成功/1=失败',
  `op_fail_reason` varchar(32) DEFAULT NULL COMMENT '操作失败原因',
  `op_time` datetime NOT NULL COMMENT '操作时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '操作人名称',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='流量包状态修改日志 ';

-- ----------------------------
-- Records of flowmgn_flowpackage_status_log
-- ----------------------------
INSERT INTO `flowmgn_flowpackage_status_log` VALUES ('1', '1', '0', '10001', '0', '1', '', '2017-04-18 15:05:06', '2017-04-18 15:05:06', '2017-04-18 15:05:06', '0', 'admin');
INSERT INTO `flowmgn_flowpackage_status_log` VALUES ('2', '1', '0', '10001', '0', '1', '', '2017-04-18 15:06:29', '2017-04-18 15:06:29', '2017-04-18 15:06:29', '0', 'admin');
INSERT INTO `flowmgn_flowpackage_status_log` VALUES ('3', '1', '0', '10001', '0', '1', '', '2017-04-18 15:12:03', '2017-04-18 15:12:03', '2017-04-18 15:12:03', '0', 'admin');
INSERT INTO `flowmgn_flowpackage_status_log` VALUES ('4', '1', '0', '10001', '0', '1', '', '2017-04-18 15:12:08', '2017-04-18 15:12:08', '2017-04-18 15:12:08', '0', 'admin');
INSERT INTO `flowmgn_flowpackage_status_log` VALUES ('5', '3', '0', '10001', '0', '1', '', '2017-04-20 16:00:12', '2017-04-20 16:00:12', '2017-04-20 16:00:12', '0', 'admin');

-- ----------------------------
-- Table structure for flowmgn_flowpool
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_flowpool`;
CREATE TABLE `flowmgn_flowpool` (
  `flowpool_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流量池ID',
  `flowpool_name` varchar(128) NOT NULL COMMENT '流量池名称',
  `op_id` int(10) NOT NULL DEFAULT '0' COMMENT '流量池所属运营商',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`flowpool_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='流量池定义';

-- ----------------------------
-- Records of flowmgn_flowpool
-- ----------------------------
INSERT INTO `flowmgn_flowpool` VALUES ('1', '测试123', '1', null, '2017-05-13 11:00:07', '2017-05-13 11:00:07', '111', 'admin');
INSERT INTO `flowmgn_flowpool` VALUES ('7', '测试-513513', '1', null, '2017-05-13 11:38:38', '2017-05-13 11:38:38', '111', 'admin');
INSERT INTO `flowmgn_flowpool` VALUES ('8', '流量池-xcm', '1', null, '2017-05-13 11:40:13', '2017-05-13 11:40:13', '111', 'admin');
INSERT INTO `flowmgn_flowpool` VALUES ('16', '有地', '1', null, '2017-05-13 15:27:49', '2017-05-13 15:27:49', '111', 'admin');
INSERT INTO `flowmgn_flowpool` VALUES ('19', '123', '1', '12', '2017-05-22 18:52:11', '2017-05-22 18:52:11', '111', 'admin');

-- ----------------------------
-- Table structure for flowmgn_flowpool_dayflow
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_flowpool_dayflow`;
CREATE TABLE `flowmgn_flowpool_dayflow` (
  `dayflow_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录序号',
  `flowpool_id` int(10) NOT NULL COMMENT '流量池ID',
  `consume_day` date DEFAULT NULL COMMENT '流量池计算日期（格式：20170401）',
  `currmonth_totalflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '当月流量池(M)',
  `currmonth_usedflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '当月总消耗(M)',
  `currmonth_remainflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '当月剩余流量(M)',
  `fulltime_total_card` int(10) DEFAULT NULL COMMENT '当月完全整月贡献卡统计',
  `expire_total_card` int(10) DEFAULT NULL COMMENT '当月有到期的卡统计',
  `expire_total_sec` int(10) DEFAULT NULL COMMENT '当月有到期的卡贡献时间统计',
  `newopen_total_card` int(10) DEFAULT NULL COMMENT '当月有新开卡统计',
  `newopen_total_sec` int(10) DEFAULT NULL COMMENT '当月有新开卡贡献时间统计',
  `card_total` int(10) DEFAULT '0' COMMENT '卡总数',
  `open_card` int(10) DEFAULT '0' COMMENT '开卡总数',
  `notopen_card` int(10) DEFAULT '0' COMMENT '未开卡总数',
  `cancel_card` int(10) DEFAULT '0' COMMENT '销卡总数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`dayflow_id`),
  UNIQUE KEY `AK_Key_flowpool_day` (`flowpool_id`,`consume_day`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='流量池每天消耗统计记录';

-- ----------------------------
-- Records of flowmgn_flowpool_dayflow
-- ----------------------------
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('1', '1', '2017-04-24', '164.20', '0.00', '164.20', null, null, null, null, null, '3', '2', '1', '0', '2017-04-24 16:18:33', '2017-04-24 16:32:25', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('18', '1', '2017-05-09', '700.00', '138.29', '561.71', null, null, null, null, null, '7', '7', '0', '0', '2017-05-09 10:28:58', '2017-05-09 10:33:38', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('20', '1', '2017-05-10', '700.00', '138.29', '561.71', null, null, null, null, null, '7', '7', '0', '0', '2017-05-10 00:00:11', '2017-05-09 10:33:38', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('21', '1', '2017-05-11', '700.00', '138.29', '561.71', null, null, null, null, null, '7', '7', '0', '0', '2017-05-11 00:00:13', '2017-05-09 10:33:38', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('22', '1', '2017-05-12', '700.00', '138.29', '561.71', null, null, null, null, null, '7', '7', '0', '0', '2017-05-12 00:00:13', '2017-05-09 10:33:38', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('23', '1', '2017-05-13', '700.00', '138.29', '561.71', null, null, null, null, null, '7', '7', '0', '0', '2017-05-13 00:00:27', '2017-05-09 10:33:38', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('24', '1', '2017-05-15', '900.00', '2965.55', '-2065.55', null, null, null, null, null, '9', '8', '1', '0', '2017-05-15 15:59:01', '2017-05-15 15:59:01', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('25', '5', '2017-05-15', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-15 15:59:01', '2017-05-15 15:59:01', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('27', '1', '2017-05-16', '1000.00', '3667.27', '-2667.27', null, null, null, null, null, '10', '9', '1', '0', '2017-05-16 00:00:11', '2017-05-16 11:23:57', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('28', '5', '2017-05-16', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-16 00:00:11', '2017-05-16 11:23:57', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('31', '1', '2017-05-17', '1000.00', '4459.64', '-3459.64', null, null, null, null, null, '10', '9', '1', '0', '2017-05-17 00:00:13', '2017-05-17 10:08:23', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('32', '5', '2017-05-17', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-17 00:00:13', '2017-05-17 10:08:23', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('35', '1', '2017-05-18', '1000.00', '5181.06', '-4181.06', null, null, null, null, null, '10', '9', '1', '0', '2017-05-18 00:00:13', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('36', '5', '2017-05-18', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-18 00:00:13', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('39', '1', '2017-05-19', '1000.00', '5181.06', '-4181.06', null, null, null, null, null, '10', '9', '1', '0', '2017-05-19 00:00:12', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('40', '5', '2017-05-19', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-19 00:00:12', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('42', '1', '2017-05-20', '1000.00', '5181.06', '-4181.06', null, null, null, null, null, '10', '9', '1', '0', '2017-05-20 00:00:13', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('43', '5', '2017-05-20', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-20 00:00:13', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('45', '1', '2017-05-21', '1000.00', '5181.06', '-4181.06', null, null, null, null, null, '10', '9', '1', '0', '2017-05-21 00:00:12', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('46', '5', '2017-05-21', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-21 00:00:12', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('48', '1', '2017-05-22', '1000.00', '5181.06', '-4181.06', null, null, null, null, null, '10', '9', '1', '0', '2017-05-22 00:00:13', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('49', '5', '2017-05-22', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-22 00:00:13', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('51', '1', '2017-05-23', '1000.00', '5181.06', '-4181.06', null, null, null, null, null, '10', '9', '1', '0', '2017-05-23 00:00:11', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('52', '5', '2017-05-23', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-23 00:00:11', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('54', '1', '2017-05-24', '1000.00', '5181.06', '-4181.06', null, null, null, null, null, '10', '9', '1', '0', '2017-05-24 00:00:11', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('55', '5', '2017-05-24', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-24 00:00:11', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('57', '1', '2017-05-25', '1000.00', '5181.06', '-4181.06', null, null, null, null, null, '10', '9', '1', '0', '2017-05-25 00:00:12', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('58', '5', '2017-05-25', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-25 00:00:12', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('60', '1', '2017-05-26', '1000.00', '5181.06', '-4181.06', null, null, null, null, null, '10', '9', '1', '0', '2017-05-26 00:00:18', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('61', '5', '2017-05-26', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-26 00:00:18', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('63', '1', '2017-05-27', '1000.00', '5181.06', '-4181.06', null, null, null, null, null, '10', '9', '1', '0', '2017-05-27 00:00:11', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('64', '5', '2017-05-27', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-27 00:00:11', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('67', '1', '2017-05-28', '1000.00', '5181.06', '-4181.06', null, null, null, null, null, '10', '9', '1', '0', '2017-05-28 00:00:11', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('68', '5', '2017-05-28', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-28 00:00:11', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('70', '1', '2017-05-29', '1000.00', '5181.06', '-4181.06', null, null, null, null, null, '10', '9', '1', '0', '2017-05-29 00:00:11', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('71', '5', '2017-05-29', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-29 00:00:11', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('73', '1', '2017-05-30', '1000.00', '5181.06', '-4181.06', null, null, null, null, null, '10', '9', '1', '0', '2017-05-30 00:00:10', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('74', '5', '2017-05-30', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-30 00:00:10', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('76', '1', '2017-05-31', '1000.00', '5181.06', '-4181.06', null, null, null, null, null, '10', '9', '1', '0', '2017-05-31 00:00:26', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('77', '5', '2017-05-31', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-31 00:00:26', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('79', '1', '2017-06-13', '1550.00', '412.74', '1137.26', null, null, null, null, null, '15', '14', '1', '0', '2017-06-13 11:33:49', '2017-06-13 11:33:49', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('80', '1', '2017-06-14', '1550.00', '596.79', '953.21', null, null, null, null, null, '15', '14', '1', '0', '2017-06-14 00:00:15', '2017-06-15 10:34:06', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('81', '1', '2017-06-15', '1550.00', '596.79', '953.21', null, null, null, null, null, '15', '14', '1', '0', '2017-06-15 00:00:26', '2017-06-15 10:34:06', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('84', '1', '2017-06-16', '1550.00', '596.79', '953.21', null, null, null, null, null, '15', '14', '1', '0', '2017-06-17 00:00:17', '2017-06-15 10:34:06', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('85', '1', '2017-06-17', '1550.00', '596.79', '953.21', null, null, null, null, null, '15', '14', '1', '0', '2017-06-18 00:00:17', '2017-06-15 10:34:06', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('86', '1', '2017-06-18', '1550.00', '596.79', '953.21', null, null, null, null, null, '15', '14', '1', '0', '2017-06-19 00:00:23', '2017-06-15 10:34:06', '0', '');
INSERT INTO `flowmgn_flowpool_dayflow` VALUES ('87', '1', '2017-06-19', '1550.00', '596.79', '953.21', null, null, null, null, null, '15', '14', '1', '0', '2017-06-20 00:00:18', '2017-06-15 10:34:06', '0', '');

-- ----------------------------
-- Table structure for flowmgn_flowpool_monthflow
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_flowpool_monthflow`;
CREATE TABLE `flowmgn_flowpool_monthflow` (
  `monthflow_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录序号',
  `flowpool_id` int(10) NOT NULL COMMENT '流量池ID',
  `consume_month` int(10) DEFAULT NULL COMMENT '流量池计算月份（格式：201704）',
  `currmonth_totalflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '当月流量池(M)',
  `currmonth_usedflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '当月总消耗(M)',
  `currmonth_remainflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '当月剩余流量(M)',
  `fulltime_total_card` int(10) DEFAULT NULL COMMENT '当月完全整月贡献卡统计',
  `expire_total_card` int(10) DEFAULT NULL COMMENT '当月有到期的卡统计',
  `expire_total_sec` int(10) DEFAULT NULL COMMENT '当月有到期的卡贡献时间统计',
  `newopen_total_card` int(10) DEFAULT NULL COMMENT '当月有新开卡统计',
  `newopen_total_sec` int(10) DEFAULT NULL COMMENT '当月有新开卡贡献时间统计',
  `card_total` int(10) DEFAULT '0' COMMENT '卡总数',
  `open_card` int(10) DEFAULT '0' COMMENT '开卡总数',
  `notopen_card` int(10) DEFAULT '0' COMMENT '未开卡总数',
  `cancel_card` int(10) DEFAULT '0' COMMENT '销卡总数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`monthflow_id`),
  UNIQUE KEY `AK_Index_flowpool_month` (`flowpool_id`,`consume_month`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='流量池每月消耗记录';

-- ----------------------------
-- Records of flowmgn_flowpool_monthflow
-- ----------------------------
INSERT INTO `flowmgn_flowpool_monthflow` VALUES ('1', '1', '201704', '164.20', '0.00', '164.20', null, null, null, null, null, '3', '2', '1', '0', '2017-04-20 17:06:18', '2017-04-24 16:32:25', '0', '');
INSERT INTO `flowmgn_flowpool_monthflow` VALUES ('42', '1', '201705', '1000.00', '5181.06', '-4181.06', null, null, null, null, null, '10', '9', '1', '0', '2017-05-09 10:28:58', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_monthflow` VALUES ('45', '5', '201705', '400.00', '136.14', '263.86', null, null, null, null, null, '2', '2', '0', '0', '2017-05-15 15:59:01', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_monthflow` VALUES ('52', '1', '201706', '1550.00', '596.79', '953.21', null, null, null, null, null, '15', '14', '1', '0', '2017-06-13 11:33:49', '2017-06-15 10:34:06', '0', '');

-- ----------------------------
-- Table structure for flowmgn_flowpool_postage
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_flowpool_postage`;
CREATE TABLE `flowmgn_flowpool_postage` (
  `pool_postagel_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录序列号',
  `flowpool_id` int(10) DEFAULT NULL COMMENT '流量池ID',
  `postage_id` int(10) NOT NULL DEFAULT '0' COMMENT '资费计划',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`pool_postagel_id`),
  UNIQUE KEY `postage_id` (`postage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='流量池与资费计划关联表';

-- ----------------------------
-- Records of flowmgn_flowpool_postage
-- ----------------------------
INSERT INTO `flowmgn_flowpool_postage` VALUES ('1', '1', '1', '2017-04-19 14:15:56', '2017-04-19 14:15:56', '0', '');
INSERT INTO `flowmgn_flowpool_postage` VALUES ('2', '1', '2', '2017-04-19 14:15:56', '2017-04-19 14:15:56', '0', '');
INSERT INTO `flowmgn_flowpool_postage` VALUES ('3', '1', '3', '2017-04-19 14:15:56', '2017-04-19 14:15:56', '0', '');
INSERT INTO `flowmgn_flowpool_postage` VALUES ('7', '5', '4', '2017-05-13 11:02:42', '2017-05-13 11:02:42', '111', 'admin');
INSERT INTO `flowmgn_flowpool_postage` VALUES ('21', '19', '5', '2017-05-22 18:52:11', '2017-05-22 18:52:11', '111', 'admin');

-- ----------------------------
-- Table structure for flowmgn_flowpool_sp_dayflow
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_flowpool_sp_dayflow`;
CREATE TABLE `flowmgn_flowpool_sp_dayflow` (
  `sp_dayflow_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `flowpool_id` int(10) NOT NULL DEFAULT '0' COMMENT '流量池ID',
  `consume_day` date NOT NULL COMMENT '日期',
  `sp_id` int(10) DEFAULT NULL COMMENT '服务商ID',
  `currmonth_totalflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '当月流量池(M)',
  `currmonth_usedflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '当月总消耗(M)',
  `currmonth_remainflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '当月剩余流量(M)',
  `sp_month_usedflow` float(12,2) DEFAULT '0.00' COMMENT '服务商当月消耗流量(M)',
  `card_total` int(10) DEFAULT '0' COMMENT '卡总数',
  `add_card` int(10) DEFAULT '0' COMMENT '新增购卡总数',
  `stock_card` int(10) DEFAULT '0' COMMENT '套餐库存总数',
  `open_card` int(10) DEFAULT '0' COMMENT '套餐已激活总数',
  `cancel_card` int(10) DEFAULT '0' COMMENT '套餐已过期总数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`sp_dayflow_id`),
  UNIQUE KEY `AK_Key_sp_flowpool_day` (`flowpool_id`,`consume_day`,`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8 COMMENT='流量池服务商每天流量明细';

-- ----------------------------
-- Records of flowmgn_flowpool_sp_dayflow
-- ----------------------------
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('1', '1', '2017-04-24', '19180009', '164.20', '0.00', '164.20', '0.00', '3', '0', '0', '0', '3', '2017-04-24 16:31:38', '2017-04-24 16:32:25', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('5', '1', '2017-05-09', '19180009', '700.00', '138.29', '561.71', '138.29', '7', '0', '0', '7', '0', '2017-05-09 10:33:38', '2017-05-09 10:33:38', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('6', '1', '2017-05-10', '19180009', '700.00', '138.29', '561.71', '499.59', '8', '0', '0', '8', '0', '2017-05-10 00:00:11', '2017-05-10 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('7', '1', '2017-05-11', '19180009', '700.00', '138.29', '561.71', '1293.55', '7', '0', '0', '7', '0', '2017-05-11 00:00:13', '2017-05-11 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('8', '1', '2017-05-11', '1000123', '700.00', '138.29', '561.71', '302.81', '1', '0', '0', '1', '0', '2017-05-11 00:00:13', '2017-05-11 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('10', '1', '2017-05-12', '19180009', '700.00', '138.29', '561.71', '1294.59', '7', '0', '0', '7', '0', '2017-05-12 00:00:13', '2017-05-12 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('11', '1', '2017-05-12', '1000123', '700.00', '138.29', '561.71', '316.92', '1', '0', '0', '1', '0', '2017-05-12 00:00:13', '2017-05-12 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('13', '1', '2017-05-13', '19180009', '700.00', '138.29', '561.71', '1306.16', '7', '0', '0', '7', '0', '2017-05-13 00:00:27', '2017-05-13 00:00:27', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('14', '1', '2017-05-13', '1000123', '700.00', '138.29', '561.71', '316.92', '1', '0', '0', '1', '0', '2017-05-13 00:00:27', '2017-05-13 00:00:27', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('15', '1', '2017-05-13', '0', '700.00', '138.29', '561.71', '916.65', '1', '0', '0', '1', '0', '2017-05-13 00:00:27', '2017-05-13 00:00:27', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('16', '1', '2017-05-15', '19180009', '900.00', '2965.55', '-2065.55', '1440.11', '7', '0', '0', '7', '0', '2017-05-15 15:59:01', '2017-05-15 15:59:01', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('17', '1', '2017-05-15', '1000123', '900.00', '2965.55', '-2065.55', '337.05', '1', '0', '0', '1', '0', '2017-05-15 15:59:01', '2017-05-15 15:59:01', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('18', '1', '2017-05-15', '0', '900.00', '2965.55', '-2065.55', '1188.39', '1', '0', '0', '1', '0', '2017-05-15 15:59:01', '2017-05-15 15:59:01', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('19', '5', '2017-05-15', '1000001', '400.00', '136.14', '263.86', '136.14', '1', '0', '0', '1', '0', '2017-05-15 15:59:01', '2017-05-15 15:59:01', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('20', '5', '2017-05-15', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-15 15:59:01', '2017-05-15 15:59:01', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('23', '1', '2017-05-16', '19180009', '1000.00', '3667.27', '-2667.27', '1472.00', '8', '0', '0', '8', '0', '2017-05-16 00:00:11', '2017-05-16 11:23:57', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('24', '1', '2017-05-16', '1000123', '1000.00', '3667.27', '-2667.27', '787.70', '1', '0', '0', '1', '0', '2017-05-16 00:00:11', '2017-05-16 11:23:57', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('25', '1', '2017-05-16', '0', '1000.00', '3667.27', '-2667.27', '1407.57', '1', '0', '0', '1', '0', '2017-05-16 00:00:11', '2017-05-16 11:23:57', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('26', '5', '2017-05-16', '1000001', '400.00', '136.14', '263.86', '136.14', '1', '0', '0', '1', '0', '2017-05-16 00:00:11', '2017-05-16 11:23:57', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('27', '5', '2017-05-16', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-16 00:00:11', '2017-05-16 11:23:57', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('31', '1', '2017-05-17', '19180009', '1000.00', '4459.64', '-3459.64', '1498.54', '8', '0', '0', '8', '0', '2017-05-17 00:00:13', '2017-05-17 10:08:23', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('32', '1', '2017-05-17', '1000123', '1000.00', '4459.64', '-3459.64', '945.81', '1', '0', '0', '1', '0', '2017-05-17 00:00:13', '2017-05-17 10:08:23', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('33', '1', '2017-05-17', '0', '1000.00', '4459.64', '-3459.64', '2015.29', '1', '0', '0', '1', '0', '2017-05-17 00:00:13', '2017-05-17 10:08:23', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('34', '5', '2017-05-17', '1000001', '400.00', '136.14', '263.86', '136.14', '1', '0', '0', '1', '0', '2017-05-17 00:00:13', '2017-05-17 10:08:23', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('35', '5', '2017-05-17', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-17 00:00:13', '2017-05-17 10:08:23', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('39', '1', '2017-05-18', '19180009', '1000.00', '5181.06', '-4181.06', '1531.14', '8', '0', '0', '8', '0', '2017-05-18 00:00:13', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('40', '1', '2017-05-18', '1000123', '1000.00', '5181.06', '-4181.06', '1116.74', '1', '0', '0', '1', '0', '2017-05-18 00:00:13', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('41', '1', '2017-05-18', '0', '1000.00', '5181.06', '-4181.06', '2533.18', '1', '0', '0', '1', '0', '2017-05-18 00:00:13', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('42', '5', '2017-05-18', '1000001', '400.00', '136.14', '263.86', '136.14', '1', '0', '0', '1', '0', '2017-05-18 00:00:13', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('43', '5', '2017-05-18', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-18 00:00:13', '2017-05-18 09:51:56', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('47', '1', '2017-05-19', '19180009', '1000.00', '5181.06', '-4181.06', '370.38', '5', '0', '0', '5', '0', '2017-05-19 00:00:12', '2017-05-19 00:00:12', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('48', '1', '2017-05-19', '1000123', '1000.00', '5181.06', '-4181.06', '1284.95', '1', '0', '0', '1', '0', '2017-05-19 00:00:12', '2017-05-19 00:00:12', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('49', '1', '2017-05-19', '0', '1000.00', '5181.06', '-4181.06', '2533.18', '1', '0', '0', '1', '0', '2017-05-19 00:00:12', '2017-05-19 00:00:12', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('50', '5', '2017-05-19', '1000001', '400.00', '136.14', '263.86', '136.14', '1', '0', '0', '1', '0', '2017-05-19 00:00:12', '2017-05-19 00:00:12', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('51', '5', '2017-05-19', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-19 00:00:12', '2017-05-19 00:00:12', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('52', '1', '2017-05-19', '1000001', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-19 00:00:12', '2017-05-19 00:00:12', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('54', '1', '2017-05-20', '19180009', '1000.00', '5181.06', '-4181.06', '398.99', '5', '0', '0', '5', '0', '2017-05-20 00:00:13', '2017-05-20 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('55', '1', '2017-05-20', '1000123', '1000.00', '5181.06', '-4181.06', '1407.95', '1', '0', '0', '1', '0', '2017-05-20 00:00:13', '2017-05-20 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('56', '1', '2017-05-20', '0', '1000.00', '5181.06', '-4181.06', '2533.18', '1', '0', '0', '1', '0', '2017-05-20 00:00:13', '2017-05-20 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('57', '5', '2017-05-20', '1000001', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-20 00:00:13', '2017-05-20 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('58', '5', '2017-05-20', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-20 00:00:13', '2017-05-20 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('59', '1', '2017-05-20', '1000001', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-20 00:00:13', '2017-05-20 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('61', '1', '2017-05-21', '19180009', '1000.00', '5181.06', '-4181.06', '522.14', '5', '0', '0', '5', '0', '2017-05-21 00:00:12', '2017-05-21 00:00:12', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('62', '1', '2017-05-21', '1000123', '1000.00', '5181.06', '-4181.06', '1407.95', '1', '0', '0', '1', '0', '2017-05-21 00:00:12', '2017-05-21 00:00:12', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('63', '1', '2017-05-21', '0', '1000.00', '5181.06', '-4181.06', '2533.18', '1', '0', '0', '1', '0', '2017-05-21 00:00:12', '2017-05-21 00:00:12', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('64', '5', '2017-05-21', '1000001', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-21 00:00:12', '2017-05-21 00:00:12', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('65', '5', '2017-05-21', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-21 00:00:12', '2017-05-21 00:00:12', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('66', '1', '2017-05-21', '1000001', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-21 00:00:12', '2017-05-21 00:00:12', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('68', '1', '2017-05-22', '19180009', '1000.00', '5181.06', '-4181.06', '522.14', '5', '0', '0', '5', '0', '2017-05-22 00:00:13', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('69', '1', '2017-05-22', '1000123', '1000.00', '5181.06', '-4181.06', '1407.95', '1', '0', '0', '1', '0', '2017-05-22 00:00:13', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('70', '1', '2017-05-22', '0', '1000.00', '5181.06', '-4181.06', '2533.18', '1', '0', '0', '1', '0', '2017-05-22 00:00:13', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('71', '5', '2017-05-22', '1000001', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-22 00:00:13', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('72', '5', '2017-05-22', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-22 00:00:13', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('73', '1', '2017-05-22', '1000001', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-22 00:00:13', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('75', '1', '2017-05-23', '19180009', '1000.00', '5181.06', '-4181.06', '522.14', '5', '0', '0', '5', '0', '2017-05-23 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('76', '1', '2017-05-23', '1000123', '1000.00', '5181.06', '-4181.06', '1407.95', '1', '0', '0', '1', '0', '2017-05-23 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('77', '1', '2017-05-23', '0', '1000.00', '5181.06', '-4181.06', '2533.18', '1', '0', '0', '1', '0', '2017-05-23 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('78', '5', '2017-05-23', '1000001', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-23 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('79', '5', '2017-05-23', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-23 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('80', '1', '2017-05-23', '1000001', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-23 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('81', '1', '2017-05-23', '1', '1000.00', '5181.06', '-4181.06', '1540.90', '1', '0', '0', '1', '0', '2017-05-23 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('82', '1', '2017-05-23', '3', '1000.00', '5181.06', '-4181.06', '535.56', '5', '0', '0', '5', '0', '2017-05-23 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('83', '1', '2017-05-23', '4', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-23 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('84', '5', '2017-05-23', '3', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-23 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('85', '5', '2017-05-23', '4', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-23 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('90', '1', '2017-05-24', '19180009', '1000.00', '5181.06', '-4181.06', '522.14', '5', '0', '0', '5', '0', '2017-05-24 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('91', '1', '2017-05-24', '1000123', '1000.00', '5181.06', '-4181.06', '1407.95', '1', '0', '0', '1', '0', '2017-05-24 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('92', '1', '2017-05-24', '0', '1000.00', '5181.06', '-4181.06', '2533.18', '1', '0', '0', '1', '0', '2017-05-24 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('93', '5', '2017-05-24', '1000001', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-24 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('94', '5', '2017-05-24', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-24 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('95', '1', '2017-05-24', '1000001', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-24 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('96', '1', '2017-05-24', '1', '1000.00', '5181.06', '-4181.06', '1540.90', '1', '0', '0', '1', '0', '2017-05-24 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('97', '1', '2017-05-24', '3', '1000.00', '5181.06', '-4181.06', '535.56', '5', '0', '0', '5', '0', '2017-05-24 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('98', '1', '2017-05-24', '4', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-24 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('99', '5', '2017-05-24', '3', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-24 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('100', '5', '2017-05-24', '4', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-24 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('105', '1', '2017-05-25', '19180009', '1000.00', '5181.06', '-4181.06', '522.14', '5', '0', '0', '5', '0', '2017-05-25 00:00:12', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('106', '1', '2017-05-25', '1000123', '1000.00', '5181.06', '-4181.06', '1407.95', '1', '0', '0', '1', '0', '2017-05-25 00:00:12', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('107', '1', '2017-05-25', '0', '1000.00', '5181.06', '-4181.06', '2533.18', '1', '0', '0', '1', '0', '2017-05-25 00:00:12', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('108', '5', '2017-05-25', '1000001', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-25 00:00:12', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('109', '5', '2017-05-25', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-25 00:00:12', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('110', '1', '2017-05-25', '1000001', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-25 00:00:12', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('111', '1', '2017-05-25', '1', '1000.00', '5181.06', '-4181.06', '1540.90', '1', '0', '0', '1', '0', '2017-05-25 00:00:12', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('112', '1', '2017-05-25', '3', '1000.00', '5181.06', '-4181.06', '535.56', '5', '0', '0', '5', '0', '2017-05-25 00:00:12', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('113', '1', '2017-05-25', '4', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-25 00:00:12', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('114', '5', '2017-05-25', '3', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-25 00:00:12', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('115', '5', '2017-05-25', '4', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-25 00:00:12', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('120', '1', '2017-05-26', '19180009', '1000.00', '5181.06', '-4181.06', '522.14', '5', '0', '0', '5', '0', '2017-05-26 00:00:18', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('121', '1', '2017-05-26', '1000123', '1000.00', '5181.06', '-4181.06', '1407.95', '1', '0', '0', '1', '0', '2017-05-26 00:00:18', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('122', '1', '2017-05-26', '0', '1000.00', '5181.06', '-4181.06', '2533.18', '1', '0', '0', '1', '0', '2017-05-26 00:00:18', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('123', '5', '2017-05-26', '1000001', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-26 00:00:18', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('124', '5', '2017-05-26', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-26 00:00:18', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('125', '1', '2017-05-26', '1000001', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-26 00:00:18', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('126', '1', '2017-05-26', '1', '1000.00', '5181.06', '-4181.06', '1540.90', '1', '0', '0', '1', '0', '2017-05-26 00:00:18', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('127', '1', '2017-05-26', '3', '1000.00', '5181.06', '-4181.06', '535.56', '5', '0', '0', '5', '0', '2017-05-26 00:00:18', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('128', '1', '2017-05-26', '4', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-26 00:00:18', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('129', '5', '2017-05-26', '3', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-26 00:00:18', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('130', '5', '2017-05-26', '4', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-26 00:00:18', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('135', '1', '2017-05-27', '19180009', '1000.00', '5181.06', '-4181.06', '522.14', '5', '0', '0', '5', '0', '2017-05-27 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('136', '1', '2017-05-27', '1000123', '1000.00', '5181.06', '-4181.06', '1407.95', '1', '0', '0', '1', '0', '2017-05-27 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('137', '1', '2017-05-27', '0', '1000.00', '5181.06', '-4181.06', '2533.18', '1', '0', '0', '1', '0', '2017-05-27 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('138', '5', '2017-05-27', '1000001', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-27 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('139', '5', '2017-05-27', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-27 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('140', '1', '2017-05-27', '1000001', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-27 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('141', '1', '2017-05-27', '1', '1000.00', '5181.06', '-4181.06', '1540.90', '1', '0', '0', '1', '0', '2017-05-27 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('142', '1', '2017-05-27', '3', '1000.00', '5181.06', '-4181.06', '535.56', '5', '0', '0', '5', '0', '2017-05-27 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('143', '1', '2017-05-27', '4', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-27 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('144', '5', '2017-05-27', '3', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-27 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('145', '5', '2017-05-27', '4', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-27 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('151', '1', '2017-05-28', '19180009', '1000.00', '5181.06', '-4181.06', '522.14', '5', '0', '0', '5', '0', '2017-05-28 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('152', '1', '2017-05-28', '1000123', '1000.00', '5181.06', '-4181.06', '1407.95', '1', '0', '0', '1', '0', '2017-05-28 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('153', '1', '2017-05-28', '0', '1000.00', '5181.06', '-4181.06', '2533.18', '1', '0', '0', '1', '0', '2017-05-28 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('154', '5', '2017-05-28', '1000001', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-28 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('155', '5', '2017-05-28', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-28 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('156', '1', '2017-05-28', '1000001', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-28 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('157', '1', '2017-05-28', '1', '1000.00', '5181.06', '-4181.06', '1540.90', '1', '0', '0', '1', '0', '2017-05-28 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('158', '1', '2017-05-28', '3', '1000.00', '5181.06', '-4181.06', '535.56', '5', '0', '0', '5', '0', '2017-05-28 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('159', '1', '2017-05-28', '4', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-28 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('160', '5', '2017-05-28', '3', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-28 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('161', '5', '2017-05-28', '4', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-28 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('166', '1', '2017-05-29', '19180009', '1000.00', '5181.06', '-4181.06', '522.14', '5', '0', '0', '5', '0', '2017-05-29 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('167', '1', '2017-05-29', '1000123', '1000.00', '5181.06', '-4181.06', '1407.95', '1', '0', '0', '1', '0', '2017-05-29 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('168', '1', '2017-05-29', '0', '1000.00', '5181.06', '-4181.06', '2533.18', '1', '0', '0', '1', '0', '2017-05-29 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('169', '5', '2017-05-29', '1000001', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-29 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('170', '5', '2017-05-29', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-29 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('171', '1', '2017-05-29', '1000001', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-29 00:00:11', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('172', '1', '2017-05-29', '1', '1000.00', '5181.06', '-4181.06', '1540.90', '1', '0', '0', '1', '0', '2017-05-29 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('173', '1', '2017-05-29', '3', '1000.00', '5181.06', '-4181.06', '535.56', '5', '0', '0', '5', '0', '2017-05-29 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('174', '1', '2017-05-29', '4', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-29 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('175', '5', '2017-05-29', '3', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-29 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('176', '5', '2017-05-29', '4', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-29 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('181', '1', '2017-05-30', '19180009', '1000.00', '5181.06', '-4181.06', '522.14', '5', '0', '0', '5', '0', '2017-05-30 00:00:10', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('182', '1', '2017-05-30', '1000123', '1000.00', '5181.06', '-4181.06', '1407.95', '1', '0', '0', '1', '0', '2017-05-30 00:00:10', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('183', '1', '2017-05-30', '0', '1000.00', '5181.06', '-4181.06', '2533.18', '1', '0', '0', '1', '0', '2017-05-30 00:00:10', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('184', '5', '2017-05-30', '1000001', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-30 00:00:10', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('185', '5', '2017-05-30', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-30 00:00:10', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('186', '1', '2017-05-30', '1000001', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-30 00:00:10', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('187', '1', '2017-05-30', '1', '1000.00', '5181.06', '-4181.06', '1540.90', '1', '0', '0', '1', '0', '2017-05-30 00:00:10', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('188', '1', '2017-05-30', '3', '1000.00', '5181.06', '-4181.06', '535.56', '5', '0', '0', '5', '0', '2017-05-30 00:00:10', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('189', '1', '2017-05-30', '4', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-30 00:00:10', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('190', '5', '2017-05-30', '3', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-30 00:00:10', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('191', '5', '2017-05-30', '4', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-30 00:00:10', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('196', '1', '2017-05-31', '19180009', '1000.00', '5181.06', '-4181.06', '522.14', '5', '0', '0', '5', '0', '2017-05-31 00:00:26', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('197', '1', '2017-05-31', '1000123', '1000.00', '5181.06', '-4181.06', '1407.95', '1', '0', '0', '1', '0', '2017-05-31 00:00:26', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('198', '1', '2017-05-31', '0', '1000.00', '5181.06', '-4181.06', '2533.18', '1', '0', '0', '1', '0', '2017-05-31 00:00:26', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('199', '5', '2017-05-31', '1000001', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-31 00:00:26', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('200', '5', '2017-05-31', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-31 00:00:26', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('201', '1', '2017-05-31', '1000001', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-31 00:00:26', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('202', '1', '2017-05-31', '1', '1000.00', '5181.06', '-4181.06', '1540.90', '1', '0', '0', '1', '0', '2017-05-31 00:00:26', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('203', '1', '2017-05-31', '3', '1000.00', '5181.06', '-4181.06', '535.56', '5', '0', '0', '5', '0', '2017-05-31 00:00:26', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('204', '1', '2017-05-31', '4', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-31 00:00:26', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('205', '5', '2017-05-31', '3', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-31 00:00:26', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('206', '5', '2017-05-31', '4', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-31 00:00:26', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('211', '1', '2017-06-13', '1', '1550.00', '412.74', '1137.26', '3.62', '1', '0', '0', '0', '1', '2017-06-13 11:33:49', '2017-06-13 11:33:49', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('212', '1', '2017-06-13', '3', '1550.00', '412.74', '1137.26', '409.12', '13', '0', '7', '6', '0', '2017-06-13 11:33:49', '2017-06-13 11:33:49', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('213', '1', '2017-06-13', '4', '1550.00', '412.74', '1137.26', '0.00', '1', '0', '0', '1', '0', '2017-06-13 11:33:49', '2017-06-13 11:33:49', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('214', '1', '2017-06-14', '1', '1550.00', '596.79', '953.21', '3.62', '1', '0', '0', '0', '1', '2017-06-14 00:00:15', '2017-06-15 10:34:06', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('215', '1', '2017-06-14', '3', '1550.00', '596.79', '953.21', '593.17', '13', '0', '7', '6', '0', '2017-06-14 00:00:15', '2017-06-15 10:34:06', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('216', '1', '2017-06-14', '4', '1550.00', '596.79', '953.21', '0.00', '1', '0', '0', '1', '0', '2017-06-14 00:00:15', '2017-06-15 10:34:06', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('217', '1', '2017-06-15', '1', '1550.00', '596.79', '953.21', '3.62', '1', '0', '0', '0', '1', '2017-06-15 00:00:26', '2017-06-16 00:00:17', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('218', '1', '2017-06-15', '3', '1550.00', '596.79', '953.21', '593.75', '13', '0', '7', '6', '0', '2017-06-15 00:00:26', '2017-06-16 00:00:17', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('219', '1', '2017-06-15', '4', '1550.00', '596.79', '953.21', '0.00', '1', '0', '0', '1', '0', '2017-06-15 00:00:26', '2017-06-16 00:00:17', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('222', '1', '2017-06-16', '1', '1550.00', '596.79', '953.21', '3.62', '1', '0', '0', '0', '1', '2017-06-17 00:00:17', '2017-06-17 00:00:17', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('223', '1', '2017-06-16', '3', '1550.00', '596.79', '953.21', '597.99', '13', '0', '7', '6', '0', '2017-06-17 00:00:17', '2017-06-17 00:00:17', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('224', '1', '2017-06-16', '4', '1550.00', '596.79', '953.21', '261.70', '1', '0', '0', '1', '0', '2017-06-17 00:00:17', '2017-06-17 00:00:17', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('225', '1', '2017-06-17', '1', '1550.00', '596.79', '953.21', '3.62', '1', '0', '0', '0', '1', '2017-06-18 00:00:17', '2017-06-18 00:00:17', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('226', '1', '2017-06-17', '3', '1550.00', '596.79', '953.21', '597.99', '13', '0', '7', '6', '0', '2017-06-18 00:00:17', '2017-06-18 00:00:17', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('227', '1', '2017-06-17', '4', '1550.00', '596.79', '953.21', '261.70', '1', '0', '0', '1', '0', '2017-06-18 00:00:17', '2017-06-18 00:00:17', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('228', '1', '2017-06-18', '1', '1550.00', '596.79', '953.21', '3.62', '1', '0', '0', '0', '1', '2017-06-19 00:00:23', '2017-06-19 00:00:23', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('229', '1', '2017-06-18', '3', '1550.00', '596.79', '953.21', '606.42', '13', '0', '7', '6', '0', '2017-06-19 00:00:23', '2017-06-19 00:00:23', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('230', '1', '2017-06-18', '4', '1550.00', '596.79', '953.21', '261.70', '1', '0', '0', '1', '0', '2017-06-19 00:00:23', '2017-06-19 00:00:23', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('231', '1', '2017-06-19', '1', '1550.00', '596.79', '953.21', '3.62', '1', '0', '0', '0', '1', '2017-06-20 00:00:18', '2017-06-20 00:00:17', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('232', '1', '2017-06-19', '3', '1550.00', '596.79', '953.21', '626.71', '13', '0', '7', '6', '0', '2017-06-20 00:00:18', '2017-06-20 00:00:17', '0', '');
INSERT INTO `flowmgn_flowpool_sp_dayflow` VALUES ('233', '1', '2017-06-19', '4', '1550.00', '596.79', '953.21', '261.70', '1', '0', '0', '1', '0', '2017-06-20 00:00:18', '2017-06-20 00:00:17', '0', '');

-- ----------------------------
-- Table structure for flowmgn_flowpool_sp_monthflow
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_flowpool_sp_monthflow`;
CREATE TABLE `flowmgn_flowpool_sp_monthflow` (
  `sp_monthflow_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `flowpool_id` int(10) NOT NULL DEFAULT '0' COMMENT '流量池ID',
  `consume_month` int(10) NOT NULL DEFAULT '0' COMMENT '月份,格式: 201604',
  `sp_id` int(10) DEFAULT NULL COMMENT '服务商ID',
  `currmonth_totalflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '当月流量池(M)',
  `currmonth_usedflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '当月总消耗(M)',
  `currmonth_remainflow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '当月剩余流量(M)',
  `sp_month_usedflow` float(12,2) DEFAULT '0.00' COMMENT '服务商当月消耗',
  `card_total` int(10) DEFAULT '0' COMMENT '卡总数',
  `add_card` int(10) DEFAULT '0' COMMENT '新增购卡总数',
  `stock_card` int(10) DEFAULT '0' COMMENT '套餐库存总数',
  `open_card` int(10) DEFAULT '0' COMMENT '套餐已激活总数',
  `cancel_card` int(10) DEFAULT '0' COMMENT '套餐已过期总数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`sp_monthflow_id`),
  UNIQUE KEY `pool_month` (`flowpool_id`,`consume_month`,`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='流量池服务商每月流量明细';

-- ----------------------------
-- Records of flowmgn_flowpool_sp_monthflow
-- ----------------------------
INSERT INTO `flowmgn_flowpool_sp_monthflow` VALUES ('2', '1', '201704', '19180009', '164.20', '0.00', '164.20', '138.29', '7', '0', '0', '7', '0', '2017-04-21 09:59:13', '2017-05-09 10:28:58', '0', '');
INSERT INTO `flowmgn_flowpool_sp_monthflow` VALUES ('16', '1', '201705', '19180009', '1000.00', '5181.06', '-4181.06', '522.14', '5', '0', '0', '5', '0', '2017-05-09 10:33:38', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_monthflow` VALUES ('18', '1', '201705', '1000123', '1000.00', '5181.06', '-4181.06', '1407.95', '1', '0', '0', '1', '0', '2017-05-11 00:00:13', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_monthflow` VALUES ('22', '1', '201705', '0', '1000.00', '5181.06', '-4181.06', '2533.18', '1', '0', '0', '1', '0', '2017-05-13 00:00:27', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_monthflow` VALUES ('25', '5', '201705', '1000001', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-15 15:59:01', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_monthflow` VALUES ('26', '5', '201705', '19180009', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-15 15:59:01', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_monthflow` VALUES ('34', '1', '201705', '1000001', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-19 00:00:12', '2017-05-22 00:00:13', '0', '');
INSERT INTO `flowmgn_flowpool_sp_monthflow` VALUES ('40', '1', '201705', '1', '1000.00', '5181.06', '-4181.06', '1540.90', '1', '0', '0', '1', '0', '2017-05-23 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_monthflow` VALUES ('41', '1', '201705', '3', '1000.00', '5181.06', '-4181.06', '535.56', '5', '0', '0', '5', '0', '2017-05-23 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_monthflow` VALUES ('42', '1', '201705', '4', '1000.00', '5181.06', '-4181.06', '105.02', '1', '0', '0', '1', '0', '2017-05-23 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_monthflow` VALUES ('43', '5', '201705', '3', '400.00', '136.14', '263.86', '0.00', '1', '0', '0', '1', '0', '2017-05-23 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_monthflow` VALUES ('44', '5', '201705', '4', '400.00', '136.14', '263.86', '178.08', '1', '0', '0', '1', '0', '2017-05-23 00:00:11', '2017-05-23 00:00:11', '0', '');
INSERT INTO `flowmgn_flowpool_sp_monthflow` VALUES ('47', '1', '201706', '1', '1550.00', '596.79', '953.21', '3.62', '1', '0', '0', '0', '1', '2017-06-13 11:33:49', '2017-06-20 00:00:17', '0', '');
INSERT INTO `flowmgn_flowpool_sp_monthflow` VALUES ('48', '1', '201706', '3', '1550.00', '596.79', '953.21', '626.71', '13', '0', '7', '6', '0', '2017-06-13 11:33:49', '2017-06-20 00:00:17', '0', '');
INSERT INTO `flowmgn_flowpool_sp_monthflow` VALUES ('49', '1', '201706', '4', '1550.00', '596.79', '953.21', '261.70', '1', '0', '0', '1', '0', '2017-06-13 11:33:49', '2017-06-20 00:00:17', '0', '');

-- ----------------------------
-- Table structure for flowmgn_group_map
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_group_map`;
CREATE TABLE `flowmgn_group_map` (
  `map_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) NOT NULL COMMENT '分组ID',
  `category_id` int(10) DEFAULT NULL COMMENT '应用分类ID',
  `warn_flow` float(12,2) DEFAULT NULL COMMENT '流量告警阀值(剩余多少：M）',
  `change_flow` float(12,2) DEFAULT NULL COMMENT '触发跳转流量(剩余多少：M）',
  `to_group_id` int(10) DEFAULT NULL COMMENT '跳转分组',
  `status` int(3) DEFAULT NULL COMMENT '策略启用状态（1：启用 2：停用）',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户流量分组用户导向图';

-- ----------------------------
-- Records of flowmgn_group_map
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_imei_change_log
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_imei_change_log`;
CREATE TABLE `flowmgn_imei_change_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `card_id` int(10) DEFAULT '0' COMMENT '流量卡ID',
  `old_imei` varchar(32) DEFAULT NULL COMMENT '更新前IMEI',
  `new_imei` varchar(32) DEFAULT NULL COMMENT '更新后IMEI',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '操作人名称',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='流量卡设备关联的硬件IMEI更改日志';

-- ----------------------------
-- Records of flowmgn_imei_change_log
-- ----------------------------
INSERT INTO `flowmgn_imei_change_log` VALUES ('1', '19', '3562960132737665', '3589620791216101', '2017-05-03 17:42:25', '2017-05-03 17:42:25', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('2', '15', '3562960132734750', '3589620791211501', '2017-05-04 00:00:07', '2017-05-04 00:00:07', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('3', '18', '3562960132737455', '8916416100203001', '2017-05-04 00:00:07', '2017-05-04 00:00:07', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('4', '17', '3562960132734752', '3562960153843978', '2017-05-04 00:00:07', '2017-05-04 00:00:07', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('5', '16', '3562960132734751', '3576190494794100', '2017-05-04 00:00:07', '2017-05-04 00:00:07', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('6', '16', '3576190494794100', '8696350105697730', '2017-05-05 10:05:42', '2017-05-05 10:05:42', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('7', '16', '8696350105697730', '3576190494794100', '2017-05-05 10:14:54', '2017-05-05 10:14:54', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('8', '26', '', '8640350200772200', '2017-05-09 16:32:43', '2017-05-09 16:32:43', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('9', '28', '', '3589620791216101', '2017-05-10 15:03:49', '2017-05-10 15:03:49', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('10', '29', '', '3576190494794100', '2017-05-10 15:03:49', '2017-05-10 15:03:49', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('11', '30', '', '3562960153843978', '2017-05-10 15:03:50', '2017-05-10 15:03:50', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('12', '31', '', '3587660133680101', '2017-05-10 15:03:50', '2017-05-10 15:03:50', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('13', '32', '', '8619140309418901', '2017-05-10 15:03:50', '2017-05-10 15:03:50', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('14', '32', '8619140309418901', '8664170400205200', '2017-05-11 10:18:20', '2017-05-11 10:18:20', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('15', '35', '', '8619140309418901', '2017-05-12 14:45:09', '2017-05-12 14:45:09', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('16', '32', '8664170400205200', '3540080795609200', '2017-05-15 14:39:45', '2017-05-15 14:39:45', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('17', '19', '3589620791216101', '8618217040543101', '2017-05-15 17:33:51', '2017-05-15 17:33:51', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('18', '26', '8640350200772200', '8681870200220500', '2017-05-19 11:22:57', '2017-05-19 11:22:57', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('19', '26', '8681870200220500', '3548860641130917', '2017-05-19 13:38:06', '2017-05-19 13:38:06', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('20', '26', '3548860641130917', '8681870200954700', '2017-05-19 13:44:09', '2017-05-19 13:44:09', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('21', '26', '8681870200954700', '3532110821094378', '2017-05-19 14:58:51', '2017-05-19 14:58:51', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('22', '26', '3532110821094378', '8681870200228200', '2017-05-19 18:23:44', '2017-05-19 18:23:44', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('23', '26', '8681870200228200', '8681870200230900', '2017-05-19 18:30:16', '2017-05-19 18:30:16', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('24', '26', '8681870200230900', '3532110825884178', '2017-05-23 11:34:39', '2017-05-23 11:34:39', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('25', '32', '3540080795609200', '8657170401495600', '2017-05-27 13:47:32', '2017-05-27 13:47:32', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('26', '248', '3589620791216101', '3562281595383578', '2017-06-13 11:06:55', '2017-06-13 11:06:55', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('27', '26', '3532110825884178', '3532110825891278', '2017-06-13 18:29:47', '2017-06-13 18:29:47', '0', '');
INSERT INTO `flowmgn_imei_change_log` VALUES ('28', '15', '3589620791211501', '3587660133680101', '2017-06-20 11:51:41', '2017-06-20 11:51:41', '0', '');

-- ----------------------------
-- Table structure for flowmgn_in_stock_order
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_in_stock_order`;
CREATE TABLE `flowmgn_in_stock_order` (
  `in_stk_order_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单序号',
  `in_stk_order_desc` varchar(1024) DEFAULT NULL COMMENT '订单描述',
  `op_id` int(10) DEFAULT '0' COMMENT '运营商ID',
  `total_card` int(10) DEFAULT '0' COMMENT '总计多少张卡',
  `card_type` tinyint(4) DEFAULT NULL COMMENT '卡类型：(1:工业贴片卡/2:工业大卡/3:双切卡)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`in_stk_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流量卡入库订单管理';

-- ----------------------------
-- Records of flowmgn_in_stock_order
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_lifecycle
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_lifecycle`;
CREATE TABLE `flowmgn_lifecycle` (
  `card_id` int(10) NOT NULL COMMENT '卡序号',
  `cycle_type` tinyint(4) DEFAULT '0' COMMENT '生命周期阶段（0=库存期/1=使用中/2=续费期/3=销卡期）',
  `cycle_livedays` tinyint(4) DEFAULT '0' COMMENT '生命周期剩余时间(单位：天）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flowmgn_lifecycle
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_lifecycle_warn
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_lifecycle_warn`;
CREATE TABLE `flowmgn_lifecycle_warn` (
  `warn_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `check_time` datetime DEFAULT NULL COMMENT '检测时间',
  `total_card` int(10) DEFAULT '0' COMMENT '检测到卡统计数',
  `detail` mediumtext COMMENT '到期卡内容',
  `report_status` tinyint(4) DEFAULT '0' COMMENT '报告发送状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`warn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卡生命周期预警信息';

-- ----------------------------
-- Records of flowmgn_lifecycle_warn
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_month_flowaccount
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_month_flowaccount`;
CREATE TABLE `flowmgn_month_flowaccount` (
  `month_flow_id` int(10) NOT NULL AUTO_INCREMENT,
  `consume_month` int(10) DEFAULT NULL COMMENT '当日,格式: 201604',
  `card_id` int(10) NOT NULL COMMENT '卡ID',
  `is_unlimit_flow` tinyint(1) DEFAULT NULL COMMENT '是否无限流量（0：有限流量 1：无限流量）',
  `total_flow` float(12,2) DEFAULT NULL COMMENT '总流量帐户',
  `used_totalflow` float(12,2) DEFAULT NULL COMMENT '总消耗流量',
  `currmonth_usedflow` float(12,2) DEFAULT '0.00' COMMENT '当月流量总消耗（月底清零）',
  `op_month_usedflow` float(12,2) DEFAULT '0.00' COMMENT '运营商侧月流量消耗',
  `status` tinyint(4) DEFAULT NULL COMMENT '帐户状态 (0:未启用 1:启用/2:停用/3:失效)',
  `flow_unit` char(1) DEFAULT 'M' COMMENT '流量服务包单位（G/M）',
  `remain_totalflow` float(12,2) DEFAULT NULL COMMENT '剩余总流量',
  `next_balancedate` date DEFAULT NULL COMMENT '下一结算日期',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`month_flow_id`),
  UNIQUE KEY `month_cardid_ukey` (`consume_month`,`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='用户流量帐户历史信息';

-- ----------------------------
-- Records of flowmgn_month_flowaccount
-- ----------------------------
INSERT INTO `flowmgn_month_flowaccount` VALUES ('1', '201705', '1', '0', '6884.00', '0.00', '0.00', '0.00', '1', '', '6884.00', '1970-01-01', '2017-05-24 16:32:16', '2017-05-24 16:32:16', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('2', '201705', '2', '0', '4336.00', '0.00', '0.00', '0.00', '1', '', '4336.00', '1970-01-01', '2017-05-08 18:03:14', '2017-05-08 18:03:14', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('3', '201705', '3', '0', '6144.00', '466.53', '466.53', '174.00', '1', '', '5677.47', '1970-01-01', '2017-05-10 11:33:55', '2017-05-18 00:00:03', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('4', '201703', '15', '0', null, '224.00', '224.00', '224.00', null, 'M', null, '2017-06-27', '2017-05-28 00:00:02', '2017-05-28 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('5', '201705', '19', '0', '2048.00', '0.00', '0.00', '27.58', '1', '', '2048.00', '2017-06-16', '2017-05-16 10:36:14', '2017-05-16 10:36:15', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('6', '201705', '26', '0', '27648.00', '198.78', '198.78', '198.79', '1', '', '27449.20', '1970-01-01', '2017-05-10 18:15:22', '2017-05-24 00:00:01', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('7', '201705', '28', '0', '12288.00', '2103.80', '2103.80', '1051.90', '1', '', '10184.20', '2017-06-11', '2017-05-10 15:03:43', '2017-05-11 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('8', '201705', '29', '0', '12288.00', '103.63', '103.63', '103.63', '1', '', '12184.40', '2017-06-11', '2017-05-10 15:03:43', '2017-05-13 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('9', '201705', '30', '0', '2168.00', '0.00', '0.00', '0.00', '1', '', '2168.00', '1970-01-01', '2017-05-18 13:56:03', '2017-05-24 00:00:02', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('10', '201705', '31', '0', '2048.00', '465.32', '465.32', '465.32', '1', '', '1582.68', '2018-05-11', '2017-05-10 15:03:43', '2017-05-26 17:06:41', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('11', '201705', '32', '0', '2048.00', '2181.49', '2181.49', '2181.49', '3', '', '-133.49', '2018-05-11', '2017-05-10 15:03:43', '2017-05-26 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('12', '201705', '33', '0', '3072.00', '1.10', '1.10', '105.02', '1', '', '3070.90', '2017-06-18', '2017-05-18 14:38:35', '2017-05-19 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('13', '201705', '34', '0', '2048.00', '1629.09', '1629.09', '2533.18', '1', '', '418.92', '2018-05-12', '2017-05-12 18:44:57', '2017-05-18 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('14', '201704', '15', '0', '2048.00', '200.00', '200.00', '200.00', '1', 'M', '1824.00', '1970-01-01', '2017-05-10 15:03:43', '2017-05-24 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('15', '201705', '15', '0', '2048.00', '1800.00', '1600.00', '1600.00', '1', 'M', '224.00', '1970-01-01', '2017-05-10 15:03:43', '2017-05-24 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('22', '201705', '27', '0', '3072.00', '0.00', '0.00', '152.90', '1', 'M', '3072.00', '2017-06-27', '2017-05-28 00:00:02', '2017-05-28 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('33', '201702', '15', '0', null, null, '100.00', '0.00', null, 'M', null, null, null, null, '0', '');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('34', '201701', '15', null, null, null, '155.00', '0.00', null, 'M', null, null, null, null, '0', '');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('35', '201612', '15', null, null, null, '50.00', '0.00', null, 'M', null, null, null, null, '0', '');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('36', '201611', '15', null, null, null, '211.00', '0.00', null, 'M', null, null, null, null, '0', '');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('37', '201706', '1', '0', '6884.00', '0.00', '0.00', '0.00', '1', '', '6884.00', '1970-01-01', '2017-05-24 16:32:16', '2017-05-24 16:32:16', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('38', '201706', '2', '0', '4336.00', '0.00', '0.00', '0.00', '1', '', '4336.00', '1970-01-01', '2017-05-08 18:03:14', '2017-05-08 18:03:14', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('39', '201706', '3', '0', '6144.00', '466.53', '466.53', '0.00', '1', '', '5677.47', '1970-01-01', '2017-05-10 11:33:55', '2017-06-06 00:00:05', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('40', '201706', '15', '1', '10240500.00', '0.00', '0.00', '0.00', '1', '', '10240500.00', '2018-06-08', '2017-06-08 16:16:31', '2017-06-08 16:16:31', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('41', '201706', '18', '0', '240.00', '54.68', '54.68', '145.20', '1', '', '185.32', '2018-06-05', '2017-06-05 16:06:10', '2017-06-10 00:00:04', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('42', '201706', '19', '0', '2048.00', '0.00', '0.00', '27.58', '1', '', '2048.00', '2017-06-16', '2017-05-16 10:36:14', '2017-05-16 10:36:15', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('43', '201706', '26', '0', '52224.00', '198.81', '198.81', '0.03', '1', '', '52025.20', '1970-01-01', '2017-06-11 00:10:31', '2017-06-14 00:00:07', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('44', '201706', '27', '0', '3072.00', '0.00', '0.00', '152.90', '1', '', '3072.00', '2017-06-27', '2017-05-28 00:00:02', '2017-06-15 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('45', '201706', '28', '0', '12288.00', '2103.80', '2103.80', '1051.90', '1', '', '10184.20', '2017-06-11', '2017-05-10 15:03:43', '2017-05-11 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('46', '201706', '29', '0', '12288.00', '103.63', '103.63', '103.63', '1', '', '12184.40', '2017-06-11', '2017-05-10 15:03:43', '2017-05-13 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('47', '201706', '30', '0', '9052.00', '0.00', '0.00', '0.00', '1', '', '9052.00', '1970-01-01', '2017-06-08 17:27:42', '2017-06-08 17:27:42', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('48', '201706', '31', '0', '2048.00', '465.48', '465.48', '465.48', '1', '', '1582.52', '2018-05-11', '2017-05-10 15:03:43', '2017-05-27 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('49', '201706', '32', '0', '2048.00', '2188.40', '2188.40', '3.62', '3', '', '-140.40', '2018-05-11', '2017-05-10 15:03:43', '2017-06-15 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('50', '201706', '33', '0', '3072.00', '111.89', '111.89', '0.00', '1', '', '2960.11', '2017-06-18', '2017-05-18 14:38:35', '2017-06-06 00:00:05', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('51', '201706', '34', '0', '2168.00', '1629.09', '1629.09', '0.00', '1', '', '538.91', '1970-01-01', '2017-06-12 17:13:56', '2017-06-12 17:13:56', '0', 'flowmgrsvr');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('52', '201706', '35', '1', '0.00', '0.00', '0.00', '40.49', '0', '', '0.00', '1970-01-01', '2017-06-06 00:00:05', '2017-06-16 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('53', '201706', '248', '1', '0.00', '0.00', '0.00', '184.63', '0', '', '0.00', '1970-01-01', '2017-06-06 00:00:05', '2017-06-16 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('54', '201706', '450', '1', '0.00', '0.00', '0.00', '0.00', '0', '', '0.00', '1970-01-01', '2017-06-06 00:00:05', '2017-06-16 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('55', '201706', '477', '1', '0.00', '0.00', '0.00', '194.38', '0', '', '0.00', '1970-01-01', '2017-06-05 13:39:02', '2017-06-16 00:00:09', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('56', '201706', '478', '1', '0.00', '0.00', '0.00', '0.00', '0', '', '0.00', '1970-01-01', '2017-06-06 00:00:05', '2017-06-16 00:00:10', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('57', '201706', '479', '1', '0.00', '0.00', '0.00', '0.00', '0', '', '0.00', '1970-01-01', '2017-06-06 00:00:05', '2017-06-16 00:00:08', '0', 'admin');
INSERT INTO `flowmgn_month_flowaccount` VALUES ('58', '201706', '480', '1', '0.00', '0.00', '0.00', '29.05', '0', '', '0.00', '1970-01-01', '2017-06-06 00:00:05', '2017-06-16 00:00:12', '0', 'admin');

-- ----------------------------
-- Table structure for flowmgn_month_sub_flowaccount
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_month_sub_flowaccount`;
CREATE TABLE `flowmgn_month_sub_flowaccount` (
  `month_sub_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `consume_month` int(10) DEFAULT NULL COMMENT '当日,格式: 201604',
  `subac_id` int(10) DEFAULT NULL COMMENT '记录ID',
  `card_id` int(10) DEFAULT NULL COMMENT '卡ID',
  `flowserv_id` int(10) DEFAULT NULL COMMENT '流量服务包ID',
  `package_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '服务套餐类型:(1:初始套餐 2:续约套餐 3:续约流量包)',
  `prev_balance` float(12,2) DEFAULT NULL COMMENT '上一期结余流量',
  `is_unlimit_flow` tinyint(1) DEFAULT NULL COMMENT '是否无限流量（0：有限流量 1：无限流量）',
  `tota_sublflow` float(12,2) DEFAULT NULL COMMENT '分类流量帐户总流量',
  `used_subflow` float(12,2) DEFAULT NULL COMMENT '分类帐户消耗流量',
  `status` tinyint(4) DEFAULT NULL COMMENT '帐户状态 (0:未启用 1:启用/2:停用/3:失效)',
  `flow_unit` char(1) DEFAULT 'M' COMMENT '流量单位（G/M)',
  `remain_subflow` float(12,2) DEFAULT NULL COMMENT '剩余分类流量',
  `next_balancedate` date DEFAULT NULL COMMENT '下一结算日期',
  `flowserv_begintime` datetime DEFAULT NULL COMMENT '流量服务包开始时间',
  `flowserv_endtime` datetime DEFAULT NULL COMMENT '流量服务包结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`month_sub_id`),
  UNIQUE KEY `month_cardid_subaccid_ukey` (`consume_month`,`subac_id`,`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8 COMMENT='用户流量帐户分类使用明细历史表';

-- ----------------------------
-- Records of flowmgn_month_sub_flowaccount
-- ----------------------------
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('1', '201705', null, '3', '113', '64', '0.00', '0', '2048.00', '423.85', '1', '', '-1.00', '0000-00-00', '2017-04-26 12:50:02', '2017-06-01 00:00:00', '2017-05-10 11:33:55', '2017-05-18 00:00:03', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('2', '201705', null, '1', '111', '4', '0.00', '0', '2048.00', '0.00', '1', '', '0.00', '0000-00-00', '2017-04-28 10:28:20', '2018-04-29 00:00:00', '2017-05-24 16:32:16', '2017-05-24 16:32:16', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('3', '201705', null, '2', '112', '127', '0.00', '0', '120.00', '0.00', '1', '', '0.00', '2000-01-20', '2017-04-28 10:28:20', '2018-04-29 00:00:00', '2017-05-08 18:03:14', '2017-05-08 18:03:14', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('19', '201705', null, '26', '119', '1', '0.00', '0', '12288.00', '198.78', '1', 'M', '0.00', '0000-00-00', '2017-05-10 14:04:14', '2019-08-11 00:00:00', '2017-05-10 18:15:22', '2017-05-24 00:00:01', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('20', '201705', null, '15', '111', '1', '0.00', '0', '2048.00', '0.00', '1', 'M', '0.00', '0000-00-00', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-05-10 15:03:43', '2017-05-24 00:00:01', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('21', '201705', null, '28', '116', '2', '0.00', '0', '12288.00', '2103.80', '1', 'M', '0.00', '0000-00-00', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-05-10 15:03:43', '2017-05-11 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('23', '201705', null, '30', '111', '1', '0.00', '0', '2048.00', '0.00', '1', 'M', '0.00', '0000-00-00', '2017-05-10 15:03:43', '2019-05-10 23:59:59', '2017-05-18 13:56:03', '2017-05-24 00:00:02', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('24', '201705', null, '31', '111', '1', '0.00', '0', '2048.00', '465.32', '1', 'M', '0.00', '0000-00-00', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-05-10 15:03:43', '2017-05-26 17:06:41', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('25', '201705', null, '32', '111', '1', '0.00', '0', '2048.00', '2048.00', '3', 'M', '0.00', '0000-00-00', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-05-10 15:03:43', '2017-05-25 14:30:39', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('28', '201705', null, '34', '111', '1', '0.00', '0', '2048.00', '1629.09', '1', 'M', '0.00', '2000-04-19', '2017-05-12 18:44:57', '2018-05-12 23:59:59', '2017-05-12 18:44:57', '2017-05-18 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('29', '201705', null, '19', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1.00', '0000-00-00', '2017-05-16 10:36:14', '2017-07-16 23:59:59', '2017-05-16 10:36:14', '2017-05-16 10:36:15', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('30', '201705', null, '30', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0.00', '2000-01-20', '2017-05-18 13:56:03', '2019-05-10 23:59:59', '2017-05-18 13:56:03', '2017-05-24 00:00:02', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('31', '201705', null, '33', '120', '1', '0.00', '0', '3072.00', '1.10', '1', 'M', '0.00', '0000-00-00', '2017-05-18 14:38:35', '2017-08-18 23:59:59', '2017-05-18 14:38:35', '2017-05-19 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('86', '201705', null, '30', '111', '1', '0.00', '0', '2048.00', '0.00', '1', 'M', '0.00', '0000-00-00', '2017-05-10 15:03:43', '2019-05-10 23:59:59', '2017-05-18 13:56:03', '2017-05-24 00:00:02', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('87', '201705', null, '31', '111', '1', '0.00', '0', '2048.00', '465.48', '1', 'M', '0.00', '0000-00-00', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-05-10 15:03:43', '2017-05-27 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('88', '201705', null, '32', '111', '1', '0.00', '0', '2048.00', '2048.00', '3', 'M', '0.00', '0000-00-00', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-05-10 15:03:43', '2017-05-25 14:30:39', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('91', '201705', null, '34', '111', '1', '0.00', '0', '2048.00', '1629.09', '1', 'M', '0.00', '2000-04-19', '2017-05-12 18:44:57', '2018-05-12 23:59:59', '2017-05-12 18:44:57', '2017-05-18 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('93', '201705', null, '30', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0.00', '2000-01-20', '2017-05-18 13:56:03', '2019-05-10 23:59:59', '2017-05-18 13:56:03', '2017-05-24 00:00:02', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('94', '201705', null, '33', '120', '1', '0.00', '0', '3072.00', '111.89', '1', 'M', '0.00', '0000-00-00', '2017-05-18 14:38:35', '2017-08-18 23:59:59', '2017-05-18 14:38:35', '2017-05-27 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('96', '201705', null, '27', '120', '1', '0.00', '0', '3072.00', '0.00', '1', 'M', '0.00', '0000-00-00', '2017-05-28 00:00:02', '2017-08-27 23:59:59', '2017-05-28 00:00:02', '2017-05-28 00:00:02', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('127', '201706', '529', '3', '113', '64', '0.00', '0', '2048.00', '423.85', '1', '', '-1.00', '0000-00-00', '2017-04-26 12:50:02', '2017-06-01 00:00:00', '2017-05-10 11:33:55', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('128', '201706', '530', '1', '111', '4', '0.00', '0', '2048.00', '0.00', '1', '', '0.00', '0000-00-00', '2017-04-28 10:28:20', '2018-04-29 00:00:00', '2017-05-24 16:32:16', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('129', '201706', '531', '2', '112', '127', '0.00', '0', '120.00', '0.00', '1', '', '0.00', '2000-01-20', '2017-04-28 10:28:20', '2018-04-29 00:00:00', '2017-05-08 18:03:14', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('130', '201706', '532', '1', '113', '38', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1.00', '0000-00-00', '2017-04-28 11:24:35', '2017-06-01 00:00:00', '2017-05-24 16:32:16', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('131', '201706', '533', '1', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0.00', '2000-01-20', '2017-05-02 10:55:02', '2019-01-01 08:00:00', '2017-05-24 16:32:16', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('132', '201706', '534', '1', '111', '5', '0.00', '0', '2048.00', '0.00', '1', 'M', '0.00', '0000-00-00', '2017-04-28 10:28:20', '2018-04-29 00:00:00', '2017-05-24 16:32:16', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('133', '201706', '535', '1', '113', '5', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1.00', '0000-00-00', '2017-04-28 11:24:35', '2017-06-01 00:00:00', '2017-05-24 16:32:16', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('134', '201706', '543', '2', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1.00', '0000-00-00', '2017-05-03 18:14:04', '2017-07-01 00:00:00', '2017-05-08 18:03:14', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('135', '201706', '544', '2', '112', '5', '0.00', '0', '120.00', '0.00', '1', 'M', '0.00', '2000-01-20', '2017-04-28 10:28:20', '2018-04-29 00:00:00', '2017-05-08 18:03:14', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('136', '201706', '546', '2', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1.00', '0000-00-00', '2017-05-04 15:04:42', '2017-07-01 00:00:00', '2017-05-08 18:03:14', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('137', '201706', '547', '2', '112', '5', '0.00', '0', '120.00', '0.00', '1', 'M', '0.00', '2000-01-20', '2017-04-28 10:28:20', '2018-04-29 00:00:00', '2017-05-08 18:03:14', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('138', '201706', '548', '2', '113', '5', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1.00', '0000-00-00', '2017-05-03 18:14:04', '2017-07-01 00:00:00', '2017-05-08 18:03:14', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('139', '201706', '549', '2', '112', '5', '0.00', '0', '120.00', '0.00', '1', 'M', '0.00', '2000-01-20', '2017-04-28 10:28:20', '2018-04-29 00:00:00', '2017-05-08 18:03:14', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('140', '201706', '552', '1', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0.00', '2000-01-20', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '2017-05-24 16:32:16', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('141', '201706', '553', '2', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0.00', '2000-01-20', '2017-05-08 18:03:14', '2019-04-29 00:00:00', '2017-05-08 18:03:14', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('142', '201706', '556', '1', '115', '3', '0.00', '0', '500.00', '0.00', '1', 'M', '-1.00', '2000-05-00', '2017-05-10 10:28:46', '2019-10-29 00:00:00', '2017-05-24 16:32:16', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('143', '201706', '557', '3', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1.00', '0000-00-00', '2017-05-10 11:33:56', '2017-07-11 00:00:00', '2017-05-10 11:33:55', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('144', '201706', '558', '3', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1.00', '0000-00-00', '2017-05-10 11:33:56', '2017-07-11 00:00:00', '2017-05-10 11:33:55', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('145', '201706', '560', '26', '119', '1', '0.00', '0', '12288.00', '198.81', '1', 'M', '0.00', '0000-00-00', '2017-05-10 14:04:14', '2020-08-10 23:59:59', '2017-06-11 00:10:31', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('146', '201706', '561', '15', '111', '1', '0.00', '0', '2048.00', '0.00', '3', 'M', '0.00', '0000-00-00', '2017-05-10 15:03:43', '2017-06-08 16:16:22', '2017-06-08 16:16:22', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('147', '201706', '562', '28', '116', '2', '0.00', '0', '12288.00', '2103.80', '1', 'M', '0.00', '0000-00-00', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-05-10 15:03:43', '2017-06-16 10:13:26', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('148', '201706', '563', '29', '116', '2', '0.00', '0', '12288.00', '103.63', '1', 'M', '0.00', '0000-00-00', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-05-10 15:03:43', '2017-06-16 10:13:26', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('149', '201706', '564', '30', '111', '1', '0.00', '0', '2048.00', '0.00', '1', 'M', '0.00', '0000-00-00', '2017-05-10 15:03:43', '2021-05-10 23:59:59', '2017-06-08 17:27:42', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('150', '201706', '565', '31', '111', '1', '0.00', '0', '2048.00', '465.48', '1', 'M', '0.00', '0000-00-00', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-05-10 15:03:43', '2017-06-16 10:13:26', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('151', '201706', '567', '26', '118', '2', '0.00', '0', '3072.00', '0.00', '1', 'M', '0.00', '0000-00-00', '2017-05-10 16:03:58', '2020-08-10 23:59:59', '2017-06-11 00:10:31', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('152', '201706', '568', '26', '117', '2', '0.00', '0', '12288.00', '0.00', '1', 'M', '0.00', '0000-00-00', '2017-05-10 18:15:23', '2020-08-10 23:59:59', '2017-06-11 00:10:31', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('153', '201706', '584', '34', '111', '1', '0.00', '0', '2048.00', '1629.09', '1', 'M', '0.00', '2000-04-19', '2017-05-12 18:44:57', '2019-05-12 23:59:59', '2017-06-12 17:13:56', '2017-06-16 10:13:26', '0', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('154', '201706', '1853', '19', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1.00', '0000-00-00', '2017-05-16 10:36:14', '2017-07-16 23:59:59', '2017-05-16 10:36:14', '2017-06-16 10:13:26', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('155', '201706', '3077', '30', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0.00', '2000-01-20', '2017-05-18 13:56:03', '2021-05-10 23:59:59', '2017-06-08 17:27:42', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('156', '201706', '3105', '33', '120', '1', '0.00', '0', '3072.00', '111.89', '1', 'M', '0.00', '0000-00-00', '2017-05-18 14:38:35', '2017-08-18 23:59:59', '2017-05-18 14:38:35', '2017-06-16 10:13:26', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('157', '201706', '8272', '1', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1.00', '0000-00-00', '2017-05-24 16:32:16', '2017-07-24 23:59:59', '2017-05-24 16:32:16', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('158', '201706', '11078', '27', '120', '1', '0.00', '0', '3072.00', '0.00', '1', 'M', '0.00', '0000-00-00', '2017-05-28 00:00:02', '2017-08-27 23:59:59', '2017-05-28 00:00:02', '2017-06-16 10:13:26', '0', 'admin');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('159', '201706', '18366', '26', '117', '2', '0.00', '0', '12288.00', '0.00', '1', 'M', '0.00', '0000-00-00', '2017-06-05 14:19:44', '2020-08-10 23:59:59', '2017-06-11 00:10:31', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('160', '201706', '18418', '18', '112', '2', '0.00', '0', '120.00', '54.68', '1', 'M', '0.00', '0000-00-00', '2017-06-05 15:46:09', '2020-05-09 23:59:59', '2017-06-05 16:06:10', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('161', '201706', '18431', '18', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0.00', '2000-01-20', '2017-06-05 16:06:10', '2020-05-09 23:59:59', '2017-06-05 16:06:10', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('162', '201706', '18450', '15', '112', '2', '0.00', '0', '120.00', '0.00', '3', 'M', '0.00', '2000-01-20', '2017-06-05 16:36:59', '2017-06-08 16:16:22', '2017-06-08 16:16:22', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('163', '201706', '18454', '15', '115', '3', '0.00', '0', '500.00', '0.00', '3', 'M', '-1.00', '2000-05-00', '2017-06-05 16:37:09', '2017-06-08 16:16:22', '2017-06-08 16:16:22', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('164', '201706', '18470', '30', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0.00', '2000-01-20', '2017-06-05 17:07:29', '2021-05-10 23:59:59', '2017-06-08 17:27:42', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('165', '201706', '18492', '30', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1.00', '0000-00-00', '2017-06-05 17:38:09', '2021-05-10 23:59:59', '2017-06-08 17:27:42', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('166', '201706', '18499', '15', '115', '3', '0.00', '0', '500.00', '0.00', '3', 'M', '-1.00', '2000-05-00', '2017-06-05 17:48:19', '2017-06-08 16:16:22', '2017-06-08 16:16:22', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('167', '201706', '18506', '30', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0.00', '2000-01-20', '2017-06-05 18:03:24', '2021-05-10 23:59:59', '2017-06-08 17:27:42', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('168', '201706', '19914', '30', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1.00', '0000-00-00', '2017-06-07 09:47:30', '2017-08-07 23:59:59', '2017-06-08 17:27:42', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('169', '201706', '20986', '15', '114', '2', '0.00', '1', '10240000.00', '0.00', '1', 'M', '0.00', '1024-00-00', '2017-06-08 16:16:22', '2018-06-08 23:59:59', '2017-06-08 16:16:32', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('170', '201706', '20990', '15', '115', '3', '0.00', '0', '500.00', '0.00', '1', 'M', '-1.00', '2000-05-00', '2017-06-08 16:16:32', '2018-06-08 23:59:59', '2017-06-08 16:16:32', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('171', '201706', '20991', '30', '115', '3', '0.00', '0', '500.00', '0.00', '1', 'M', '-1.00', '2000-05-00', '2017-06-08 16:16:32', '2021-05-10 23:59:59', '2017-06-08 17:27:42', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('172', '201706', '21034', '30', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1.00', '0000-00-00', '2017-06-08 17:27:42', '2017-08-08 23:59:59', '2017-06-08 17:27:42', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('173', '201706', '22961', '26', '119', '1', '0.00', '0', '12288.00', '0.00', '1', 'M', '0.00', '0000-00-00', '2017-06-11 00:10:32', '2020-08-10 23:59:59', '2017-06-11 00:10:31', '2017-06-16 10:13:26', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_month_sub_flowaccount` VALUES ('174', '201706', '24411', '34', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0.00', '2000-01-20', '2017-06-12 17:13:56', '2019-05-12 23:59:59', '2017-06-12 17:13:56', '2017-06-16 10:13:26', '0', 'flowmgrsvr');

-- ----------------------------
-- Table structure for flowmgn_op
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_op`;
CREATE TABLE `flowmgn_op` (
  `op_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列号ID',
  `op_code` int(10) NOT NULL COMMENT '运营商编号：建议和运营平台的商户号一',
  `op_name` varchar(128) NOT NULL COMMENT '运营商名称',
  `op_desc` varchar(256) NOT NULL COMMENT '运营商描述',
  `prev_code` varchar(256) DEFAULT NULL COMMENT '号码前缀',
  `midd_code` varchar(256) DEFAULT NULL COMMENT '号码段信息',
  `owned` tinyint(4) DEFAULT NULL COMMENT '所属运营商 （1：移动 2：电信 3：联通）',
  `srv_addr` varchar(256) DEFAULT NULL COMMENT '服务方域名或者IP',
  `srv_port` int(10) DEFAULT NULL COMMENT '服务方端口号',
  `check_url` varchar(256) DEFAULT NULL COMMENT '验证服务URL地址',
  `comm_key` varchar(256) DEFAULT NULL COMMENT '通讯KEY',
  `svr_users` varchar(32) DEFAULT NULL COMMENT '服务方用户帐号',
  `svr_password` varchar(64) DEFAULT NULL COMMENT '服务方密码',
  `contact_person` varchar(32) DEFAULT NULL COMMENT '联系人姓名',
  `contact_mobile` varchar(32) DEFAULT NULL COMMENT '联系人电话',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`op_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='网络运营商';

-- ----------------------------
-- Records of flowmgn_op
-- ----------------------------
INSERT INTO `flowmgn_op` VALUES ('1', '100001', '中国联通', '重庆联通', null, null, '3', null, null, null, 'F003AED9-8709-4D33-B680-19B525321487', 'chen xi1', '12345678', '陈晓哥', '13523432343', '2016-02-24 09:30:23', '2017-02-14 09:00:00', '0', '');

-- ----------------------------
-- Table structure for flowmgn_op_dailyflow_log
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_op_dailyflow_log`;
CREATE TABLE `flowmgn_op_dailyflow_log` (
  `dayflow_log_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `card_id` int(10) DEFAULT NULL COMMENT '流量卡ID',
  `iccidn` varchar(20) NOT NULL COMMENT 'iccid+''n''',
  `consume_flow` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '当月消耗流量(M)',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`dayflow_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8 COMMENT='流量卡每日消耗流量';

-- ----------------------------
-- Records of flowmgn_op_dailyflow_log
-- ----------------------------
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('1', '15', '89860615010013567224', '0.00', '2017-05-25 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('2', '3', '89860616020016665189', '174.00', '2017-05-25 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('3', '33', '89860616020016665205', '105.02', '2017-05-25 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('4', '34', '89860616020031330363', '2533.18', '2017-05-25 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('5', '35', '89860616020031330397', '242.85', '2017-05-25 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('6', '32', '89860616020031330405', '1798.27', '2017-05-25 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('7', '27', '89860617020016357083', '0.00', '2017-05-25 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('8', '26', '89860617020016357091', '198.79', '2017-05-25 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('9', '1', '89860615010030653007', '0.00', '2017-05-25 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('10', '248', '89860615010034182375', '1051.90', '2017-05-25 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('11', '30', '89860615010030652991', '0.00', '2017-05-25 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('12', '18', '89860615010013567422', '453.73', '2017-05-25 00:00:04');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('13', '31', '89860616020002394950', '434.64', '2017-05-25 00:00:04');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('14', '15', '89860615010013567224', '0.00', '2017-05-26 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('15', '3', '89860616020016665189', '174.00', '2017-05-26 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('16', '33', '89860616020016665205', '105.02', '2017-05-26 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('17', '34', '89860616020031330363', '2533.18', '2017-05-26 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('18', '35', '89860616020031330397', '254.64', '2017-05-26 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('19', '32', '89860616020031330405', '2181.49', '2017-05-26 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('20', '27', '89860617020016357083', '0.00', '2017-05-26 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('21', '26', '89860617020016357091', '198.79', '2017-05-26 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('22', '1', '89860615010030653007', '0.00', '2017-05-26 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('23', '248', '89860615010034182375', '1051.90', '2017-05-26 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('24', '30', '89860615010030652991', '0.00', '2017-05-26 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('25', '18', '89860615010013567422', '469.60', '2017-05-26 00:00:04');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('26', '31', '89860616020002394950', '444.74', '2017-05-26 00:00:04');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('27', '15', '89860615010013567224', '0.00', '2017-05-27 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('28', '18', '89860615010013567422', '504.13', '2017-05-27 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('29', '30', '89860615010030652991', '0.00', '2017-05-27 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('30', '1', '89860615010030653007', '0.00', '2017-05-27 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('31', '248', '89860615010034182375', '1051.90', '2017-05-27 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('32', '31', '89860616020002394950', '465.48', '2017-05-27 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('33', '3', '89860616020016665189', '174.00', '2017-05-27 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('34', '33', '89860616020016665205', '215.81', '2017-05-27 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('35', '34', '89860616020031330363', '2533.18', '2017-05-27 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('36', '35', '89860616020031330397', '254.77', '2017-05-27 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('37', '32', '89860616020031330405', '2184.78', '2017-05-27 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('38', '27', '89860617020016357083', '0.00', '2017-05-27 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('39', '26', '89860617020016357091', '198.79', '2017-05-27 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('40', '15', '89860615010013567224', '0.00', '2017-05-28 00:00:02');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('41', '18', '89860615010013567422', '28.02', '2017-05-28 00:00:02');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('42', '30', '89860615010030652991', '0.00', '2017-05-28 00:00:02');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('43', '1', '89860615010030653007', '0.00', '2017-05-28 00:00:02');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('44', '248', '89860615010034182375', '0.00', '2017-05-28 00:00:02');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('45', '31', '89860616020002394950', '0.00', '2017-05-28 00:00:02');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('46', '3', '89860616020016665189', '0.00', '2017-05-28 00:00:02');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('47', '33', '89860616020016665205', '0.00', '2017-05-28 00:00:02');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('48', '34', '89860616020031330363', '0.00', '2017-05-28 00:00:02');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('49', '35', '89860616020031330397', '0.00', '2017-05-28 00:00:02');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('50', '32', '89860616020031330405', '3.62', '2017-05-28 00:00:02');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('51', '27', '89860617020016357083', '152.90', '2017-05-28 00:00:02');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('52', '26', '89860617020016357091', '0.00', '2017-05-28 00:00:02');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('53', '27', '89860617020016357083', '152.90', '2017-05-28 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('54', '15', '89860615010013567224', '0.00', '2017-05-29 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('55', '18', '89860615010013567422', '39.11', '2017-05-29 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('56', '30', '89860615010030652991', '0.00', '2017-05-29 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('57', '1', '89860615010030653007', '0.00', '2017-05-29 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('58', '248', '89860615010034182375', '0.00', '2017-05-29 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('59', '31', '89860616020002394950', '0.00', '2017-05-29 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('60', '3', '89860616020016665189', '0.00', '2017-05-29 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('61', '33', '89860616020016665205', '0.00', '2017-05-29 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('62', '34', '89860616020031330363', '0.00', '2017-05-29 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('63', '35', '89860616020031330397', '0.00', '2017-05-29 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('64', '32', '89860616020031330405', '3.62', '2017-05-29 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('65', '27', '89860617020016357083', '152.90', '2017-05-29 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('66', '26', '89860617020016357091', '0.00', '2017-05-29 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('67', '15', '89860615010013567224', '0.00', '2017-05-30 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('68', '18', '89860615010013567422', '49.36', '2017-05-30 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('69', '30', '89860615010030652991', '0.00', '2017-05-30 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('70', '1', '89860615010030653007', '0.00', '2017-05-30 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('71', '248', '89860615010034182375', '0.00', '2017-05-30 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('72', '31', '89860616020002394950', '0.00', '2017-05-30 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('73', '3', '89860616020016665189', '0.00', '2017-05-30 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('74', '33', '89860616020016665205', '0.00', '2017-05-30 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('75', '34', '89860616020031330363', '0.00', '2017-05-30 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('76', '35', '89860616020031330397', '0.00', '2017-05-30 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('77', '32', '89860616020031330405', '3.62', '2017-05-30 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('78', '27', '89860617020016357083', '152.90', '2017-05-30 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('79', '26', '89860617020016357091', '0.00', '2017-05-30 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('80', '15', '89860615010013567224', '0.00', '2017-05-31 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('81', '18', '89860615010013567422', '57.33', '2017-05-31 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('82', '30', '89860615010030652991', '0.00', '2017-05-31 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('83', '1', '89860615010030653007', '0.00', '2017-05-31 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('84', '248', '89860615010034182375', '0.00', '2017-05-31 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('85', '31', '89860616020002394950', '0.00', '2017-05-31 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('86', '3', '89860616020016665189', '0.00', '2017-05-31 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('87', '33', '89860616020016665205', '0.00', '2017-05-31 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('88', '34', '89860616020031330363', '0.00', '2017-05-31 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('89', '35', '89860616020031330397', '0.00', '2017-05-31 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('90', '32', '89860616020031330405', '3.62', '2017-05-31 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('91', '27', '89860617020016357083', '152.90', '2017-05-31 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('92', '26', '89860617020016357091', '0.00', '2017-05-31 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('93', '15', '89860615010013567224', '0.00', '2017-06-01 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('94', '18', '89860615010013567422', '65.31', '2017-06-01 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('95', '30', '89860615010030652991', '0.00', '2017-06-01 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('96', '1', '89860615010030653007', '0.00', '2017-06-01 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('97', '248', '89860615010034182375', '0.00', '2017-06-01 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('98', '31', '89860616020002394950', '0.00', '2017-06-01 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('99', '3', '89860616020016665189', '0.00', '2017-06-01 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('100', '33', '89860616020016665205', '0.00', '2017-06-01 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('101', '34', '89860616020031330363', '0.00', '2017-06-01 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('102', '35', '89860616020031330397', '0.00', '2017-06-01 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('103', '32', '89860616020031330405', '3.62', '2017-06-01 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('104', '27', '89860617020016357083', '152.90', '2017-06-01 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('105', '26', '89860617020016357091', '0.00', '2017-06-01 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('106', '15', '89860615010013567224', '0.00', '2017-06-02 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('107', '18', '89860615010013567422', '84.48', '2017-06-02 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('108', '30', '89860615010030652991', '0.00', '2017-06-02 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('109', '1', '89860615010030653007', '0.00', '2017-06-02 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('110', '248', '89860615010034182375', '0.00', '2017-06-02 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('111', '31', '89860616020002394950', '0.00', '2017-06-02 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('112', '3', '89860616020016665189', '0.00', '2017-06-02 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('113', '33', '89860616020016665205', '0.00', '2017-06-02 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('114', '34', '89860616020031330363', '0.00', '2017-06-02 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('115', '35', '89860616020031330397', '0.00', '2017-06-02 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('116', '32', '89860616020031330405', '3.62', '2017-06-02 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('117', '27', '89860617020016357083', '152.90', '2017-06-02 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('118', '26', '89860617020016357091', '0.00', '2017-06-02 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('119', '15', '89860615010013567224', '0.00', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('120', '18', '89860615010013567422', '90.52', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('121', '30', '89860615010030652991', '0.00', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('122', '1', '89860615010030653007', '0.00', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('123', '450', '89860615010030653023', '0.00', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('124', '477', '89860615010030653049', '170.90', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('125', '248', '89860615010034182375', '0.00', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('126', '478', '89860615010034182383', '0.00', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('127', '479', '89860616020002394927', '0.00', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('128', '480', '89860616020002394950', '0.00', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('129', '3', '89860616020016665189', '0.00', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('130', '33', '89860616020016665205', '0.00', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('131', '34', '89860616020031330363', '0.00', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('132', '35', '89860616020031330397', '40.49', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('133', '32', '89860616020031330405', '3.62', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('134', '27', '89860617020016357083', '152.90', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('135', '26', '89860617020016357091', '0.00', '2017-06-06 00:00:05');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('136', '15', '89860615010013567224', '0.00', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('137', '18', '89860615010013567422', '106.19', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('138', '30', '89860615010030652991', '0.00', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('139', '1', '89860615010030653007', '0.00', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('140', '450', '89860615010030653023', '0.00', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('141', '477', '89860615010030653049', '171.22', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('142', '248', '89860615010034182375', '0.00', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('143', '478', '89860615010034182383', '0.00', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('144', '479', '89860616020002394927', '0.00', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('145', '480', '89860616020002394950', '0.00', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('146', '3', '89860616020016665189', '0.00', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('147', '33', '89860616020016665205', '0.00', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('148', '34', '89860616020031330363', '0.00', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('149', '35', '89860616020031330397', '40.49', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('150', '32', '89860616020031330405', '3.62', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('151', '27', '89860617020016357083', '152.90', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('152', '26', '89860617020016357091', '0.00', '2017-06-07 00:00:01');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('153', '15', '89860615010013567224', '0.00', '2017-06-10 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('154', '479', '89860616020002394927', '0.00', '2017-06-10 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('155', '3', '89860616020016665189', '0.00', '2017-06-10 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('156', '33', '89860616020016665205', '0.00', '2017-06-10 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('157', '34', '89860616020031330363', '0.00', '2017-06-10 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('158', '35', '89860616020031330397', '40.49', '2017-06-10 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('159', '32', '89860616020031330405', '3.62', '2017-06-10 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('160', '27', '89860617020016357083', '152.90', '2017-06-10 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('161', '26', '89860617020016357091', '0.00', '2017-06-10 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('162', '1', '89860615010030653007', '0.00', '2017-06-10 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('163', '450', '89860615010030653023', '0.00', '2017-06-10 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('164', '477', '89860615010030653049', '194.38', '2017-06-10 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('165', '248', '89860615010034182375', '0.00', '2017-06-10 00:00:03');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('166', '30', '89860615010030652991', '0.00', '2017-06-10 00:00:04');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('167', '478', '89860615010034182383', '0.00', '2017-06-10 00:00:04');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('168', '18', '89860615010013567422', '145.20', '2017-06-10 00:00:04');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('169', '480', '89860616020002394950', '0.00', '2017-06-10 00:00:04');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('170', '15', '89860615010013567224', '0.00', '2017-06-13 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('171', '479', '89860616020002394927', '0.00', '2017-06-13 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('172', '3', '89860616020016665189', '0.00', '2017-06-13 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('173', '33', '89860616020016665205', '0.00', '2017-06-13 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('174', '34', '89860616020031330363', '0.00', '2017-06-13 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('175', '35', '89860616020031330397', '40.49', '2017-06-13 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('176', '32', '89860616020031330405', '3.62', '2017-06-13 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('177', '27', '89860617020016357083', '152.90', '2017-06-13 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('178', '26', '89860617020016357091', '0.00', '2017-06-13 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('179', '1', '89860615010030653007', '0.00', '2017-06-13 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('180', '450', '89860615010030653023', '0.00', '2017-06-13 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('181', '477', '89860615010030653049', '194.38', '2017-06-13 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('182', '30', '89860615010030652991', '0.00', '2017-06-13 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('183', '478', '89860615010034182383', '0.00', '2017-06-13 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('184', '18', '89860615010013567422', '145.20', '2017-06-13 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('185', '480', '89860616020002394950', '29.05', '2017-06-13 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('186', '15', '89860615010013567224', '0.00', '2017-06-14 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('187', '479', '89860616020002394927', '0.00', '2017-06-14 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('188', '3', '89860616020016665189', '0.00', '2017-06-14 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('189', '33', '89860616020016665205', '0.00', '2017-06-14 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('190', '34', '89860616020031330363', '0.00', '2017-06-14 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('191', '35', '89860616020031330397', '40.49', '2017-06-14 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('192', '32', '89860616020031330405', '3.62', '2017-06-14 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('193', '27', '89860617020016357083', '152.90', '2017-06-14 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('194', '26', '89860617020016357091', '0.03', '2017-06-14 00:00:07');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('195', '1', '89860615010030653007', '0.00', '2017-06-14 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('196', '450', '89860615010030653023', '0.00', '2017-06-14 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('197', '477', '89860615010030653049', '194.38', '2017-06-14 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('198', '30', '89860615010030652991', '0.00', '2017-06-14 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('199', '478', '89860615010034182383', '0.00', '2017-06-14 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('200', '18', '89860615010013567422', '145.20', '2017-06-14 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('201', '480', '89860616020002394950', '29.05', '2017-06-14 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('202', '15', '89860615010013567224', '0.00', '2017-06-15 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('203', '479', '89860616020002394927', '0.00', '2017-06-15 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('204', '3', '89860616020016665189', '0.00', '2017-06-15 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('205', '33', '89860616020016665205', '0.00', '2017-06-15 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('206', '34', '89860616020031330363', '0.00', '2017-06-15 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('207', '35', '89860616020031330397', '40.49', '2017-06-15 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('208', '32', '89860616020031330405', '3.62', '2017-06-15 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('209', '27', '89860617020016357083', '152.90', '2017-06-15 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('210', '26', '89860617020016357091', '0.03', '2017-06-15 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('211', '1', '89860615010030653007', '0.00', '2017-06-15 00:00:17');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('212', '450', '89860615010030653023', '0.00', '2017-06-15 00:00:17');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('213', '477', '89860615010030653049', '194.38', '2017-06-15 00:00:17');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('214', '248', '89860615010034182375', '184.05', '2017-06-15 00:00:17');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('215', '30', '89860615010030652991', '0.00', '2017-06-15 00:00:18');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('216', '478', '89860615010034182383', '0.00', '2017-06-15 00:00:18');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('217', '18', '89860615010013567422', '145.20', '2017-06-15 00:00:19');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('218', '480', '89860616020002394950', '29.05', '2017-06-15 00:00:20');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('219', '15', '89860615010013567224', '0.00', '2017-06-16 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('220', '479', '89860616020002394927', '0.00', '2017-06-16 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('221', '3', '89860616020016665189', '0.00', '2017-06-16 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('222', '33', '89860616020016665205', '0.00', '2017-06-16 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('223', '34', '89860616020031330363', '0.00', '2017-06-16 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('224', '35', '89860616020031330397', '40.49', '2017-06-16 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('225', '32', '89860616020031330405', '3.62', '2017-06-16 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('226', '27', '89860617020016357083', '152.90', '2017-06-16 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('227', '26', '89860617020016357091', '0.03', '2017-06-16 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('228', '1', '89860615010030653007', '0.00', '2017-06-16 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('229', '450', '89860615010030653023', '0.00', '2017-06-16 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('230', '477', '89860615010030653049', '194.38', '2017-06-16 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('231', '248', '89860615010034182375', '184.63', '2017-06-16 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('232', '30', '89860615010030652991', '0.00', '2017-06-16 00:00:10');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('233', '478', '89860615010034182383', '0.00', '2017-06-16 00:00:10');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('234', '18', '89860615010013567422', '145.20', '2017-06-16 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('235', '480', '89860616020002394950', '29.05', '2017-06-16 00:00:12');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('236', '15', '89860615010013567224', '0.00', '2017-06-17 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('237', '479', '89860616020002394927', '0.00', '2017-06-17 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('238', '3', '89860616020016665189', '0.00', '2017-06-17 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('239', '33', '89860616020016665205', '261.70', '2017-06-17 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('240', '34', '89860616020031330363', '0.00', '2017-06-17 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('241', '35', '89860616020031330397', '40.49', '2017-06-17 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('242', '32', '89860616020031330405', '3.62', '2017-06-17 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('243', '27', '89860617020016357083', '152.90', '2017-06-17 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('244', '26', '89860617020016357091', '0.03', '2017-06-17 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('245', '1', '89860615010030653007', '0.00', '2017-06-17 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('246', '450', '89860615010030653023', '0.00', '2017-06-17 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('247', '477', '89860615010030653049', '194.38', '2017-06-17 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('248', '248', '89860615010034182375', '188.87', '2017-06-17 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('249', '30', '89860615010030652991', '0.00', '2017-06-17 00:00:10');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('250', '478', '89860615010034182383', '0.00', '2017-06-17 00:00:10');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('251', '18', '89860615010013567422', '145.20', '2017-06-17 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('252', '480', '89860616020002394950', '29.05', '2017-06-17 00:00:12');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('253', '15', '89860615010013567224', '0.00', '2017-06-18 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('254', '479', '89860616020002394927', '0.00', '2017-06-18 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('255', '3', '89860616020016665189', '0.00', '2017-06-18 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('256', '33', '89860616020016665205', '261.70', '2017-06-18 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('257', '34', '89860616020031330363', '0.00', '2017-06-18 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('258', '35', '89860616020031330397', '40.49', '2017-06-18 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('259', '32', '89860616020031330405', '3.62', '2017-06-18 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('260', '27', '89860617020016357083', '152.90', '2017-06-18 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('261', '26', '89860617020016357091', '0.03', '2017-06-18 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('262', '1', '89860615010030653007', '0.00', '2017-06-18 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('263', '450', '89860615010030653023', '0.00', '2017-06-18 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('264', '477', '89860615010030653049', '194.38', '2017-06-18 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('265', '248', '89860615010034182375', '188.87', '2017-06-18 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('266', '30', '89860615010030652991', '0.00', '2017-06-18 00:00:10');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('267', '478', '89860615010034182383', '0.00', '2017-06-18 00:00:10');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('268', '18', '89860615010013567422', '145.20', '2017-06-18 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('269', '480', '89860616020002394950', '29.05', '2017-06-18 00:00:12');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('270', '15', '89860615010013567224', '0.00', '2017-06-19 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('271', '479', '89860616020002394927', '0.00', '2017-06-19 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('272', '3', '89860616020016665189', '0.00', '2017-06-19 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('273', '33', '89860616020016665205', '261.70', '2017-06-19 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('274', '34', '89860616020031330363', '0.00', '2017-06-19 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('275', '35', '89860616020031330397', '40.49', '2017-06-19 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('276', '32', '89860616020031330405', '3.62', '2017-06-19 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('277', '27', '89860617020016357083', '152.90', '2017-06-19 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('278', '26', '89860617020016357091', '0.03', '2017-06-19 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('279', '1', '89860615010030653007', '0.00', '2017-06-19 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('280', '450', '89860615010030653023', '0.00', '2017-06-19 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('281', '477', '89860615010030653049', '194.38', '2017-06-19 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('282', '248', '89860615010034182375', '188.87', '2017-06-19 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('283', '30', '89860615010030652991', '0.00', '2017-06-19 00:00:10');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('284', '478', '89860615010034182383', '0.00', '2017-06-19 00:00:10');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('285', '18', '89860615010013567422', '153.63', '2017-06-19 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('286', '480', '89860616020002394950', '29.05', '2017-06-19 00:00:16');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('287', '15', '89860615010013567224', '0.00', '2017-06-20 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('288', '479', '89860616020002394927', '0.00', '2017-06-20 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('289', '3', '89860616020016665189', '0.00', '2017-06-20 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('290', '33', '89860616020016665205', '261.70', '2017-06-20 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('291', '34', '89860616020031330363', '0.00', '2017-06-20 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('292', '35', '89860616020031330397', '40.49', '2017-06-20 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('293', '32', '89860616020031330405', '3.62', '2017-06-20 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('294', '27', '89860617020016357083', '152.90', '2017-06-20 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('295', '26', '89860617020016357091', '0.03', '2017-06-20 00:00:08');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('296', '1', '89860615010030653007', '0.00', '2017-06-20 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('297', '450', '89860615010030653023', '0.00', '2017-06-20 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('298', '477', '89860615010030653049', '194.38', '2017-06-20 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('299', '248', '89860615010034182375', '188.87', '2017-06-20 00:00:09');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('300', '30', '89860615010030652991', '0.00', '2017-06-20 00:00:10');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('301', '478', '89860615010034182383', '0.00', '2017-06-20 00:00:10');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('302', '18', '89860615010013567422', '173.92', '2017-06-20 00:00:11');
INSERT INTO `flowmgn_op_dailyflow_log` VALUES ('303', '480', '89860616020002394950', '29.05', '2017-06-20 00:00:12');

-- ----------------------------
-- Table structure for flowmgn_op_networkaccess
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_op_networkaccess`;
CREATE TABLE `flowmgn_op_networkaccess` (
  `access_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '通讯计划ID',
  `access_code` int(12) DEFAULT NULL COMMENT '通讯计划执行码（与运营商对接）',
  `op_id` int(10) DEFAULT NULL COMMENT '运营商ID',
  `en_name` varchar(64) DEFAULT NULL COMMENT '通讯计划英文名称',
  `cn_name` varchar(64) DEFAULT NULL COMMENT '通讯计划中文名称',
  `access_desc` varchar(256) DEFAULT NULL COMMENT '通讯计划描述',
  `status` tinyint(4) DEFAULT NULL COMMENT '通讯计划状态 （1：启用 2：停用） ',
  `item_data` tinyint(1) DEFAULT NULL COMMENT '设置项-数据功能（0:无 1：开启 2：关闭）',
  `item_voice_called` tinyint(1) DEFAULT NULL COMMENT '设置项-被叫功能（0:无 1：开启 2：关闭）',
  `item_msg` tinyint(1) DEFAULT NULL COMMENT '设置项-短信功能（0:无 1：开启 2：关闭）',
  `item_four_g` tinyint(1) DEFAULT NULL COMMENT '设置项-开通4G功能（0:无 1：开启 2：关闭）',
  `item_white` tinyint(1) DEFAULT NULL COMMENT '设置项-白名单功能（0:无 1：开启 2：关闭）',
  `item_black` tinyint(1) DEFAULT NULL COMMENT '设置项-黑名单功能（0:无 1：开启 2：关闭）',
  `item_apn` varchar(128) DEFAULT NULL COMMENT '设置项-APN节点名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`access_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='流量平台电信运营商通讯计划定义';

-- ----------------------------
-- Records of flowmgn_op_networkaccess
-- ----------------------------
INSERT INTO `flowmgn_op_networkaccess` VALUES ('1', '277517', '1', '831WLW001721_NJ_DATASMS_VOICE_MT_4G_NEW', '3G', null, '1', '2', '2', '2', '1', '0', '0', 'cqwe01.clfu.njm2mapn', null, null, '0', '');
INSERT INTO `flowmgn_op_networkaccess` VALUES ('2', '113617', '1', '831WLW001721_NJ_DATA_VOICE_MT', '4G', null, '1', '2', '2', '2', '2', '2', '1', 'unim2m.njm2mapn', null, null, '0', '');
INSERT INTO `flowmgn_op_networkaccess` VALUES ('3', '277317', '1', '831WLW001721_NJ_DATA_VOICE_MT_4G_NEW', '4G', null, '1', '2', '1', '2', '2', '1', '0', 'unim2m.njm2mapn', null, null, '0', '');
INSERT INTO `flowmgn_op_networkaccess` VALUES ('4', '521217', '1', '831WLW001721_NJ_DATA_4G', '4G', null, '1', '2', '1', '2', '1', '2', '1', 'unim2m.njm2mapn', null, null, '0', '');
INSERT INTO `flowmgn_op_networkaccess` VALUES ('5', '521317', '1', '831WLW001721_NJ_DATA_4G_SP', '4G', null, '1', '2', '1', '2', '1', '2', '1', 'unim2m.njm2mapn', null, null, '0', '');

-- ----------------------------
-- Table structure for flowmgn_op_postageplan
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_op_postageplan`;
CREATE TABLE `flowmgn_op_postageplan` (
  `postage_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列ID,唯一标识',
  `postage_code` int(10) NOT NULL COMMENT '资费编码',
  `postage_name` varchar(128) NOT NULL COMMENT '资费计划名称',
  `op_id` int(10) NOT NULL COMMENT '运营商ID',
  `pay_mode` tinyint(4) NOT NULL COMMENT '付款方式：0=预付-灵活共享池/1=后付',
  `is_separate_bill` tinyint(4) DEFAULT NULL COMMENT '是否分离计费 (0:不支持分离计费 / 1:支持分离计费)',
  `plan_flow` int(10) NOT NULL COMMENT '计划内流量(每月支付流量)',
  `flow_unit` char(1) NOT NULL COMMENT '流量单位G/M',
  `valid_days` int(5) DEFAULT NULL COMMENT '有效时长（单位：天）',
  `balance_day` tinyint(4) DEFAULT NULL COMMENT '运营商每月的出帐日(0:自然月 1-28指定日期出帐）',
  `over_chargemode` float(8,2) NOT NULL COMMENT '超出流量计费方式',
  `over_unit` varchar(12) NOT NULL COMMENT '超出流量单位G/M',
  `is_share` tinyint(4) NOT NULL DEFAULT '0' COMMENT '共享流量（0=否/1=是）',
  `is_apncard` tinyint(4) DEFAULT NULL COMMENT '是否针对APN （0=公网卡/1=APN卡）',
  `status` tinyint(4) DEFAULT NULL COMMENT '资费计划状态 （1启用 2停用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`postage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='运营商资费计划';

-- ----------------------------
-- Records of flowmgn_op_postageplan
-- ----------------------------
INSERT INTO `flowmgn_op_postageplan` VALUES ('1', '1001', '831WLW001721_PRE-FLEX_1200M-0S', '1', '0', '0', '100', 'M', '360', '26', '10.00', 'M', '1', '0', '1', '2017-04-01 00:00:00', '2017-04-01 00:00:00', '0', '');
INSERT INTO `flowmgn_op_postageplan` VALUES ('2', '1002', '831WLW001721_PRE-FLEX_1200M-0S', '1', '1', '1', '200', 'M', '360', '26', '10.00', 'M', '1', '0', '1', '2017-04-01 00:00:00', '2017-04-01 00:00:00', '0', '');
INSERT INTO `flowmgn_op_postageplan` VALUES ('3', '1003', '831WLW001721_PRE-FLEX_1200M-0S', '1', '1', '1', '300', 'M', '180', '26', '10.00', 'M', '1', '0', '1', '2017-04-01 00:00:00', '2017-04-01 00:00:00', '0', '');
INSERT INTO `flowmgn_op_postageplan` VALUES ('4', '1004', '831WLW001721_MON-FLEX_200M', '1', '1', '1', '200', 'M', '360', '26', '10.00', 'M', '1', '0', '1', '2017-05-09 15:04:46', '2017-05-09 15:04:51', '0', 'admin');
INSERT INTO `flowmgn_op_postageplan` VALUES ('5', '1005', '831WLW001721_MON-FLEX_201M', '1', '0', '0', '400', 'M', '360', '26', '10.00', 'M', '1', '0', '1', '2017-05-19 16:06:51', '2017-05-19 16:54:21', '0', '');

-- ----------------------------
-- Table structure for flowmgn_out_stock_order
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_out_stock_order`;
CREATE TABLE `flowmgn_out_stock_order` (
  `out_order_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单序号',
  `out_order_no` varchar(64) DEFAULT NULL COMMENT '订单号',
  `out_order_name` varchar(256) DEFAULT NULL COMMENT '订单名称',
  `out_order_desc` varchar(1024) DEFAULT NULL COMMENT '订单描述',
  `sp_id` int(10) DEFAULT '0' COMMENT '服务商ID',
  `total_card` int(10) DEFAULT '0' COMMENT '总计多少张卡',
  `card_type` tinyint(4) DEFAULT NULL COMMENT '卡类型：(0:通用/1:工业贴片卡/2:工业大卡/3:双切卡)',
  `total_price` float(14,2) DEFAULT NULL COMMENT '总价',
  `package_id` int(10) DEFAULT NULL COMMENT '套餐ID',
  `status` tinyint(4) DEFAULT '0' COMMENT '订单状态（1:待发货 2:已取消 3:已发货 4:发货失败）',
  `fail_reason` tinyint(4) DEFAULT '0' COMMENT '失败原因 （1：缺货 2：其它原因）',
  `fail_reason_desc` varchar(512) DEFAULT NULL COMMENT '失败原因描述',
  `post_time` datetime DEFAULT NULL COMMENT '发货时间',
  `recipients` varchar(32) DEFAULT NULL COMMENT '收件人姓名',
  `recipients_mobileno` varchar(64) DEFAULT NULL COMMENT '收件人手机号',
  `recipients_addr` varchar(256) DEFAULT NULL COMMENT '收件人地址',
  `recipients_postcode` varchar(32) DEFAULT NULL COMMENT '收件人邮政编码',
  `express_no` varchar(64) DEFAULT NULL COMMENT '快递单号',
  `express_pic` varchar(256) DEFAULT NULL COMMENT '快递单图片存底',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`out_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='流量卡出库订单管理';

-- ----------------------------
-- Records of flowmgn_out_stock_order
-- ----------------------------
INSERT INTO `flowmgn_out_stock_order` VALUES ('2', '1704120956099119', null, null, '1000123', '100', '1', '1000.00', '11', '3', null, null, '2017-04-21 15:26:04', '李四', '13256898545', '湖南', '421800', 'E0656266', null, '2017-04-12 09:56:09', '2017-04-12 09:56:09', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('3', '1704120957307004', null, null, '1000123', '100', '1', '1000.00', '12', '2', '2', '没库存了', null, '王五', '15611598654', '深圳', '421800', null, null, '2017-04-12 09:57:30', '2017-04-12 09:57:30', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('4', '1704121447169070', null, null, '1000123', '1', '1', '10.00', '13', '2', null, null, null, '测试', '15211375026', '深圳', '421800', '', null, '2017-04-12 14:47:16', '2017-04-12 14:47:16', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('5', '1704181457498766', null, null, '1000123', '1', '3', '100.00', '14', '4', null, null, null, '李煜', '15216589423', '南唐', '123456', 'E0656266', null, '2017-04-18 14:57:49', '2017-04-18 14:57:49', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('6', '1704181631549682', null, null, '1000123', '11', '2', null, '14', '4', '1', null, null, '李白', '13215698452', '甘肃天水市秦安县', '123456', null, null, '2017-04-18 16:31:54', '2017-04-18 16:31:54', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('7', '1704181633257396', null, null, '1000123', '11', '4', null, '11', '2', null, null, null, '李清照', '15611895482', '山东省济南市章丘区', '654895', null, null, '2017-04-18 16:33:25', '2017-04-18 16:33:25', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('8', '1704181642135756', null, null, '1000123', '11', '2', null, '11', '4', '1', null, null, '杜甫', '15211369854', '河南', '568942', null, null, '2017-04-18 16:42:13', '2017-04-18 16:42:13', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('9', '1705111641131045', null, null, '1000123', '2', '2', null, '18', '2', '0', null, null, '张小小', '13556230602', '惠州小金口天天流量', null, null, null, '2017-05-11 16:41:13', '2017-05-11 16:41:13', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('10', '1705121043271685', null, null, '1000123', '1', '3', null, '16', '1', '0', null, null, '黄小小', '13556230602', '惠州小金口小金口', null, null, null, '2017-05-12 10:43:27', '2017-05-12 10:43:27', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('11', '1705121516319545', null, null, '1000123', '199', '2', null, '17', '2', '0', null, null, '黄美美', '147235623256', '惠州小鑫口惠州小我', null, null, null, '2017-05-12 15:16:31', '2017-05-12 15:16:31', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('12', '1705121523157729', null, null, '1000123', '23', '2', null, '12', '1', '0', null, null, '小小小小不', '14756562323', '深圳深圳深圳党', '54651', null, null, '2017-05-12 15:23:15', '2017-05-12 15:23:15', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('13', '1705121524189304', null, null, '1000123', '56', '2', null, '12', '1', '0', null, null, '不不不', '14714782356', '深圳深圳深圳', null, null, null, '2017-05-12 15:24:18', '2017-05-12 15:24:18', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('14', '1705121559462782', null, null, '1000123', '20', '2', null, '12', '1', '0', null, null, '俗磊', '12323569856', '北京东西', null, null, null, '2017-05-12 15:59:46', '2017-05-12 15:59:46', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('15', '1705121600212371', null, null, '1000123', '36', '2', null, '15', '1', '0', null, null, '谷磊', '14612342345', '速查加厚来吧', null, null, null, '2017-05-12 16:00:21', '2017-05-12 16:00:21', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('16', '1705121600533507', null, null, '1000123', '9', '2', null, '15', '4', '1', null, null, '王王', '1423895623', '萨克森挡箭牌', null, null, null, '2017-05-12 16:00:53', '2017-05-12 16:00:53', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('17', '1705121601444181', null, null, '1000123', '45', '2', null, '18', '3', null, null, '2017-05-22 16:20:18', '海边', '14723562369', '因白血病', null, '12312312312312312312', 'http://192.168.3.153:8525/v1/tfscom/T1IRETByZT1RCvBVdK.png', '2017-05-12 16:01:44', '2017-05-12 16:01:44', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('18', '1705121602122386', null, null, '1000123', '6', '2', null, '13', '4', '2', '', null, '王环形', '14723124546', '芝加哥歧路成', null, null, null, '2017-05-12 16:02:12', '2017-05-12 16:02:12', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('19', '1705121602442811', null, null, '1000123', '1', '2', null, '14', '4', '2', '', null, '张通信', '14789567474', '横亘一哄而起一', null, null, null, '2017-05-12 16:02:44', '2017-05-12 16:02:44', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('20', '1705121603064155', null, null, '1000123', '8', '2', null, '17', '3', null, null, '2017-05-18 15:57:04', '绵长', '14712120101', '天时大功率在', null, '54454444', 'http://192.168.3.153:8525/v1/tfscom/T14XETBQZ_1RCvBVdK.png', '2017-05-12 16:03:06', '2017-05-12 16:03:06', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('21', '1705121603272311', null, null, '1000123', '3', '2', null, '13', '4', '1', null, null, '塑料管', '147230303', '顶天真影暗话', null, null, null, '2017-05-12 16:03:27', '2017-05-12 16:03:27', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('22', '1705121603529445', null, null, '1000123', '6', '2', null, '13', '4', '2', '订单也过期', null, '十真理', '14702021313', '奇景说长道短收到', null, null, null, '2017-05-12 16:03:52', '2017-05-12 16:03:52', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('23', '1705121604222741', null, null, '1000123', '6', '2', null, '13', '3', null, null, '2017-05-12 17:40:16', '雨量', '14701021236', '有朝一日遭遇战一收抚睛', null, '122222', 'http://192.168.3.153:8525/v1/tfscom/T1XFETBQh_1RCvBVdK.png', '2017-05-12 16:04:22', '2017-05-12 16:04:22', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('24', '1705181606564356', null, null, '1000123', '100', '3', null, '19', '4', '2', '', null, '测试-张某', '13813001300', '广东省深圳市南山区科兴科学园C3栋7楼', '518000', null, null, '2017-05-18 16:06:56', '2017-05-18 16:06:56', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('25', '1705191448055521', null, null, '123', '1000', '2', null, '18', '4', '2', '万无一失一年 要4 年4  要的一饿 有地三里边地坩埚 苦革adf革工载载一工一夺有非常卡 压力  苦劳而无功    劳而无功    天天二珠 和的地', null, '百夺村地有圾圾地工圾', '12345678900', '莀地 霏霏地在霜圾地有圾地菜圾地有埒肝肝膨胀圾圾圾圾圾圾地肝肝有圾圾圾地有且 工表地肝菜工表一有工圾载肝工肝', '518000', null, null, '2017-05-19 14:48:05', '2017-05-19 14:48:05', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('26', '1705191453032492', null, null, '123', '100', '2', null, '12', '4', '2', '测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因测试发货失败失败原因', null, '李四先生', '14711112011', '深圳南山区腾讯大厦', '000000', null, null, '2017-05-19 14:53:03', '2017-05-19 14:53:03', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('27', '1705221743535010', null, null, '123', '1000', '2', null, '20', '3', null, null, '2017-05-23 11:35:32', '时光荏苒', '13013001300', '广东省深圳市龙华新区民治大道大润发', '518000', '1234567896', 'http://192.168.3.153:8525/v1/tfscom/T1_NETByZT1RCvBVdK.jpg', '2017-05-22 17:43:53', '2017-05-22 17:43:53', '1', 'admin');
INSERT INTO `flowmgn_out_stock_order` VALUES ('28', '1705261522007886', null, null, '100000', '5', '2', '62.80', '11', '1', '0', null, null, '留留丽', '14723235656', '广东省惠州市惠城区小金口天天', null, null, null, '2017-05-26 15:22:00', '2017-05-26 15:22:00', '100000', '微信开发环境');
INSERT INTO `flowmgn_out_stock_order` VALUES ('29', '1705271435067624', null, null, '100000', '2', '2', '0.02', '18', '2', '0', null, null, '红红红红红', '14723230101', '跃跃欲试石苏格兰淡定是', null, null, null, '2017-05-27 14:35:06', '2017-05-27 14:35:06', '100000', '微信开发环境');
INSERT INTO `flowmgn_out_stock_order` VALUES ('30', '1705311124226535', null, null, '3', '2', '3', '25.12', '11', '4', '1', null, null, '黄小小小', '14723230202', '广东省惠州市惠城区小金口天天', null, null, null, '2017-05-31 11:24:22', '2017-05-31 11:24:22', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('31', '1705311358504801', null, null, '3', '1', '2', '360.00', '16', '1', '0', null, null, '红红红红', '14701012020', '北京西二旗上地7等等', null, null, null, '2017-05-31 13:58:50', '2017-05-31 13:58:50', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('32', '1705311431591256', null, null, '3', '1', '2', '0.01', '17', '4', '2', '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', null, '小小小小小', '14701017878', '惠州惠州深圳深圳深圳深圳', null, null, null, '2017-05-31 14:31:59', '2017-05-31 14:31:59', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('33', '1705311450428791', null, null, '1', '1', '2', '180.00', '13', '4', '2', '测试测试测试测试测试测试测试测试测试测试测试测试', null, '张小小', '14721210101', '惠州惠州深圳椭圆形喖', null, null, null, '2017-05-31 14:50:42', '2017-05-31 14:50:42', '1000123', '测试专用商户');
INSERT INTO `flowmgn_out_stock_order` VALUES ('34', '1705311653491952', null, null, '3', '1', '2', '12.56', '11', '3', null, null, '2017-05-31 16:54:40', '黄黄黄', '14712120101', '棒球脚后跟测试测试', null, '14112123152463521541', 'http://192.168.3.153:8525/v1/tfscom/T15NETByDT1RCvBVdK.png', '2017-05-31 16:53:49', '2017-05-31 16:53:49', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('35', '1705311656557567', null, null, '3', '1', '2', '12.56', '11', '1', '0', null, null, '张三三', '14721212323', '小金口小金口小金口小金口小金口', null, null, null, '2017-05-31 16:56:55', '2017-05-31 16:56:55', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('36', '1705311657304482', null, null, '3', '1', '2', '12.56', '11', '2', '0', null, null, '李四四', '14703021236', '惠州惠州惠州惠州惠州惠州惠州惠州', null, null, null, '2017-05-31 16:57:30', '2017-05-31 16:57:30', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('37', '1705311729042465', null, null, '3', '1', '2', '12.56', '11', '1', '0', null, null, '张三多', '14721210101', '深圳深圳深圳深圳', null, null, null, '2017-05-31 17:29:04', '2017-05-31 17:29:04', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('38', '1705311735251832', null, null, '3', '1', '2', '12.56', '11', '2', '0', null, null, '1234', '18978945612', '234', '518000', null, null, '2017-05-31 17:35:25', '2017-05-31 17:35:25', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('39', '1705311737028461', null, null, '3', '10', '3', '1800.00', '13', '2', '0', null, null, '123', '18612345678', '科兴', '518000', null, null, '2017-05-31 17:37:02', '2017-05-31 17:37:02', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('40', '1705311748187429', null, null, '3', '1', '2', '12.56', '11', '1', '0', null, null, '测试5-31', '14701012323', '深圳深圳深圳深圳深圳深圳深圳深圳深圳深圳', null, null, null, '2017-05-31 17:48:18', '2017-05-31 17:48:18', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('41', '1705311749009645', null, null, '3', '3', '1', '0.03', '19', '1', '0', null, null, '测试huang', '14702021313', '惠州惠州惠州惠州惠州', null, null, null, '2017-05-31 17:49:00', '2017-05-31 17:49:00', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('42', '1705311809315760', null, null, '3', '1', '2', '0.01', '17', '1', '0', null, null, '刘小小', '14712302140', '惠州惠州惠州惠州01惠州惠州惠州惠州01惠州惠州惠州惠州01惠州惠州惠州惠州01惠州惠州惠州惠州01', '1230', null, null, '2017-05-31 18:09:31', '2017-05-31 18:09:31', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('43', '1705311814335066', null, null, '3', '1', '1', '0.01', '17', '1', '0', null, null, '谷大师', '14712342323', '惠州', '1', null, null, '2017-05-31 18:14:33', '2017-05-31 18:14:33', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('44', '1706011012427033', null, null, '3', '623', '2', '6.23', '17', '1', '0', null, null, '哈萨克族', '14720204546', '惠州惠州惠州惠州123545', null, null, null, '2017-06-01 10:12:42', '2017-06-01 10:12:42', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('45', '1706011015428772', null, null, '3', '963', '1', '12095.28', '11', '1', '0', null, null, '库尔班拉马丹', '14723230101', '深圳深圳深圳深圳深圳深圳深圳深圳深圳深圳', null, null, null, '2017-06-01 10:15:42', '2017-06-01 10:15:42', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('46', '1706011016394941', null, null, '3', '10236', '1', '3684960.00', '14', '1', '0', null, null, '钮古鲁思凯', '13556230201', '深圳深圳深圳深圳深圳深圳深圳深圳深圳深圳深圳深圳深圳深圳', null, null, null, '2017-06-01 10:16:39', '2017-06-01 10:16:39', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('47', '1706011017232935', null, null, '3', '96', '1', '34560.00', '12', '1', '0', null, null, '布吉拉土', '14723235656', '惠州小金口天天', null, null, null, '2017-06-01 10:17:23', '2017-06-01 10:17:23', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('48', '1706011018277541', null, null, '3', '2', '1', '100.00', '15', '1', '0', null, null, '戈里高利', '14789895656', '东西东西小区小区', null, null, null, '2017-06-01 10:18:27', '2017-06-01 10:18:27', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('49', '1706011019342684', null, null, '3', '8', '3', '1440.00', '13', '2', '0', null, null, '乌斯曼', '14723010405', '深圳科兴科学园中区科技园c3栋', null, null, null, '2017-06-01 10:19:34', '2017-06-01 10:19:34', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('50', '1706011020261190', null, null, '3', '9', '1', '450.00', '15', '1', '0', null, null, '库尔班拉马丹', '13201012323', '深圳科技园中区深圳科技园中区深圳科技园中区', null, null, null, '2017-06-01 10:20:26', '2017-06-01 10:20:26', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('51', '1706011021184785', null, null, '3', '5', '1', '250.00', '15', '1', '0', null, null, '热布达瓦', '14723235656', '深圳科技园中区科深圳科技园中区科深圳科技园中区科', null, null, null, '2017-06-01 10:21:18', '2017-06-01 10:21:18', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('52', '1706011102523470', null, null, '2', '5', '2', '250.00', '15', '1', '0', null, null, '黄多多', '14723235656', '深圳科技园中区科兴科学园c栋3单元', null, null, null, '2017-06-01 11:02:52', '2017-06-01 11:02:52', '100000', '微信开发环境');
INSERT INTO `flowmgn_out_stock_order` VALUES ('53', '1706011107341095', null, null, '2', '9', '1', '1620.00', '13', '1', '0', null, null, '梦洁', '14723235656', '深圳科技园中区科兴科学园c栋3单元', null, null, null, '2017-06-01 11:07:34', '2017-06-01 11:07:34', '100000', '微信开发环境');
INSERT INTO `flowmgn_out_stock_order` VALUES ('54', '1706011108154680', null, null, '2', '2', '3', '720.00', '16', '1', '0', null, null, '凌菲', '14789895656', '深圳科技园中区科兴科学园c栋3单元', null, null, null, '2017-06-01 11:08:15', '2017-06-01 11:08:15', '100000', '微信开发环境');
INSERT INTO `flowmgn_out_stock_order` VALUES ('55', '1706011542409233', null, null, '3', '3', '2', '37.68', '11', '4', '1', null, null, '王五', '14723235656', '深圳科技园中区科兴科学园c栋3单元', null, null, null, '2017-06-01 15:42:40', '2017-06-01 15:42:40', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('56', '1706011553346709', null, null, '3', '2000', '2', '20.00', '17', '4', '1', null, null, '斤斤计较', '15342424242', '9786北京就会哭', null, null, null, '2017-06-01 15:53:34', '2017-06-01 15:53:34', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('57', '1706011622276806', null, null, '3', '1', '2', '360.00', '12', '2', '0', null, null, '新新新', '14789895656', '横亘砂在多面手', '12345m', null, null, '2017-06-01 16:22:27', '2017-06-01 16:22:27', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('58', '1706051114345715', null, null, '3', '10', '2', '1800.00', '13', '1', '0', null, null, 'aa', '18617146017', 'adasdadasdasd', null, null, null, '2017-06-05 11:14:34', '2017-06-05 11:14:34', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('59', '1706051539573780', null, null, '3', '3', '3', '540.00', '13', '1', '0', null, null, '肖肖肖', '14721210303', '肖肖肖肖肖肖', null, null, null, '2017-06-05 15:39:57', '2017-06-05 15:39:57', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('60', '1706051727016367', null, null, '3', '3', '1', '1080.00', '16', '4', '1', null, null, '测试6-5', '14721211313', '测试6-5测试6-5测试6-5测试6-5测试6-5', null, null, null, '2017-06-05 17:27:01', '2017-06-05 17:27:01', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('61', '1706051735478898', null, null, '3', '20', '2', '3600.00', '13', '1', '0', null, null, 'aa', '18603070357', '爸爸爸爸吧所大大所大', null, null, null, '2017-06-05 17:35:47', '2017-06-05 17:35:47', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('62', '1706051736356285', null, null, '3', '12', '2', '2160.00', '13', '2', '0', null, null, '阿斯达', '18617146017', 'asdasdasdasdasd', null, null, null, '2017-06-05 17:36:35', '2017-06-05 17:36:35', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('63', '1706061051559515', null, null, '3', '111', '2', '1394.16', '11', '4', '1', null, null, 'test', '14711111011', 'test_address', '111111', null, null, '2017-06-06 10:51:55', '2017-06-06 10:51:55', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('64', '1706061055451459', null, null, '3', '11', '2', '138.16', '11', '4', '2', '手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因手动其他发货失败原因', null, 'test', '14711110001', 'test_address', '111111', null, null, '2017-06-06 10:55:45', '2017-06-06 10:55:45', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('65', '1706061132536834', null, null, '3', '9', '1', '3240.00', '12', '1', '0', null, null, '张小平', '14712300321', '深圳市科技园中区科兴科学园c栋3单元7楼', null, null, null, '2017-06-06 11:32:53', '2017-06-06 11:32:53', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('66', '1706061549351015', null, null, '3', '3', '1', '37.68', '11', '1', '0', null, null, '向昌翁', '14721212020', '深圳科技园科兴科学园深圳科技园科兴科学园123', null, null, null, '2017-06-06 15:49:35', '2017-06-06 15:49:35', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('67', '1706071007226559', null, null, '3', '9', '1', '0.09', '18', '2', '0', null, null, '美属萨摩亚', '14723230202', '深圳科技园中区科兴科学园c栋3单元7楼', null, null, null, '2017-06-07 10:07:22', '2017-06-07 10:07:22', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('68', '1706071054597813', null, null, '3', '1', '2', '12.56', '11', '2', '0', null, null, '蔓丽', '13556230202', '蔓丽蔓丽蔓丽蔓丽蔓丽蔓丽', '430000', null, null, '2017-06-07 10:54:59', '2017-06-07 10:54:59', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('69', '1706121650476509', null, null, '3', '3', '2', '1080.00', '12', '3', null, null, '2017-06-12 16:54:36', '覃小小', '18570321236', '深圳市南山区科技园中区科兴科学园c栋3单元7楼', null, '215465421321541231', 'http://192.168.3.153:8525/v1/tfscom/T1XFETBQx_1RCvBVdK.png', '2017-06-12 16:50:47', '2017-06-12 16:50:47', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('70', '1706131419095095', null, null, '3', '100', '2', '18000.00', '13', '3', null, null, '2017-06-13 14:27:06', '迪丽热巴·迪力木拉提', '14711111234', '新疆乌鲁木齐市', '123456', '12345678901234567890', 'http://192.168.3.153:8525/v1/tfscom/T1AyETByJT1RCvBVdK.jpg', '2017-06-13 14:19:09', '2017-06-13 14:19:09', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('71', '1706131439242611', null, null, '3', '100000', '2', '1000.00', '20', '4', '2', '订单数量太大，库存不足', null, '降央卓玛', '14711111235', 'xx省xx市xx县xx镇xx村', '123456', null, null, '2017-06-13 14:39:24', '2017-06-13 14:39:24', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('72', '1706131446102004', null, null, '3', '12', '1', '600.00', '15', '2', '0', null, null, '阿里巴巴', '18910000001', '浙江省杭州市浙东区阿里路150号阿里巴巴集团有限公司采购部', '100002', null, null, '2017-06-13 14:46:10', '2017-06-13 14:46:10', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('73', '1706151339137875', null, null, '3', '89', '2', '16020.00', '13', '3', null, null, '2017-06-15 14:01:04', '谷用金', '14721215454', '深圳南山科技园中区科兴科学园c栋3单元7楼', '235689', '123456789456', 'http://192.168.3.153:8525/v1/tfscom/T1OyETBydT1RCvBVdK.png', '2017-06-15 13:39:13', '2017-06-15 13:39:13', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('74', '1706161345477896', null, null, '3', '111', '2', '1394.16', '11', '1', '0', null, null, '阿里云', '14711111010', '浙江省杭州市浙东区阿里路150号阿里巴巴集团有限公司采购部浙江省杭州市浙东区阿里路150号阿里巴巴集团有限公司采购部', '123123', null, null, '2017-06-16 13:45:47', '2017-06-16 13:45:47', '19180009', '广联赛讯');
INSERT INTO `flowmgn_out_stock_order` VALUES ('75', '1706161358205869', null, null, '3', '11', '2', '1980.00', '13', '1', '0', null, null, '123', '14711111001', '浙江省杭州市浙东区阿里路150号阿里巴巴集团有限公司采购部浙江省杭州市浙东区阿里路150号阿里巴巴集团有限公司采购部 浙江省杭州市浙东区阿里路150号阿里巴巴集团有限公司采购部浙江省杭州市浙东区阿里路', '123123', null, null, '2017-06-16 13:58:20', '2017-06-16 13:58:20', '19180009', '广联赛讯');

-- ----------------------------
-- Table structure for flowmgn_out_stock_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_out_stock_order_detail`;
CREATE TABLE `flowmgn_out_stock_order_detail` (
  `out_detail_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录序号',
  `card_id` int(10) NOT NULL COMMENT '卡序号',
  `out_order_id` int(10) DEFAULT NULL COMMENT '订单序号',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态（1：正常 ）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`out_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流量卡库存订单明细';

-- ----------------------------
-- Records of flowmgn_out_stock_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_policy_group
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_policy_group`;
CREATE TABLE `flowmgn_policy_group` (
  `group_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '分组ID',
  `sp_id` int(10) DEFAULT NULL COMMENT '所属商户',
  `group_name` varchar(64) DEFAULT NULL COMMENT '分组名称',
  `group_desc` varchar(256) DEFAULT NULL COMMENT '分组描述',
  `parent_id` int(10) DEFAULT NULL COMMENT '父系分组（0：根目录）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(12) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户策略分组';

-- ----------------------------
-- Records of flowmgn_policy_group
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_policy_member
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_policy_member`;
CREATE TABLE `flowmgn_policy_member` (
  `member_id` int(10) NOT NULL AUTO_INCREMENT,
  `card_id` int(10) NOT NULL COMMENT 'ID',
  `imsi` varchar(64) DEFAULT NULL COMMENT 'imsi',
  `iccid` varchar(256) DEFAULT NULL COMMENT 'iccid',
  `state_ip` varchar(64) DEFAULT NULL COMMENT '静态IP',
  `group_id` int(10) DEFAULT NULL COMMENT '所属分组ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户分组成员列表';

-- ----------------------------
-- Records of flowmgn_policy_member
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_policy_operate_bat
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_policy_operate_bat`;
CREATE TABLE `flowmgn_policy_operate_bat` (
  `pol_bat_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pol_bat_code` varchar(32) DEFAULT NULL COMMENT '批次号',
  `sp_id` int(10) DEFAULT NULL COMMENT '商户ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_op_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_op_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`pol_bat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流控策略操作批次管理';

-- ----------------------------
-- Records of flowmgn_policy_operate_bat
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_policy_oplog
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_policy_oplog`;
CREATE TABLE `flowmgn_policy_oplog` (
  `oplog_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录序号',
  `pol_bat_id` int(10) DEFAULT NULL COMMENT '操作批次号',
  `sp_id` int(10) DEFAULT NULL COMMENT '商户ID',
  `group_id` int(10) DEFAULT NULL COMMENT '当前所属组',
  `to_group_id` int(10) DEFAULT NULL COMMENT '变更新属性组',
  `usercount` tinyint(4) DEFAULT NULL COMMENT '用户数（最大1000）',
  `userslist` varchar(20000) DEFAULT NULL COMMENT '用户列表',
  `status` tinyint(4) DEFAULT NULL COMMENT '操作状态（1：未处理  2：已处理）',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`oplog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流控策略操作日志';

-- ----------------------------
-- Records of flowmgn_policy_oplog
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_policy_relation
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_policy_relation`;
CREATE TABLE `flowmgn_policy_relation` (
  `pol_rel_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `policy_id` int(10) DEFAULT NULL COMMENT '黑白名单规则',
  `group_id` int(10) DEFAULT NULL COMMENT '策略分组ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`pol_rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流控策略与用户关系';

-- ----------------------------
-- Records of flowmgn_policy_relation
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_recharge_order
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_recharge_order`;
CREATE TABLE `flowmgn_recharge_order` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_no` varchar(32) DEFAULT NULL COMMENT '订单号（格式：）',
  `package_id` int(10) DEFAULT '0' COMMENT '套餐ID',
  `order_price` float(12,2) DEFAULT NULL COMMENT '订单总价',
  `order_paytime` datetime DEFAULT NULL COMMENT '订单支付时间',
  `order_sp_id` int(10) DEFAULT NULL COMMENT '订单所属商户',
  `status` tinyint(4) DEFAULT '0' COMMENT '订单状态（0：未支付 1：已支付 2：已完成 3：已取消）',
  `source` tinyint(4) DEFAULT '0' COMMENT '来源：（0=微信商城/1=流量管理平台/2=开放平台）',
  `third_order_no` varchar(128) DEFAULT NULL COMMENT '第三方订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) DEFAULT '0' COMMENT '最后操作人ID',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8 COMMENT='充值订单表';

-- ----------------------------
-- Records of flowmgn_recharge_order
-- ----------------------------
INSERT INTO `flowmgn_recharge_order` VALUES ('167', '170510141132840', '13', '180.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:11:32', '2017-05-10 14:11:32', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('168', '170510141211394', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:12:11', '2017-05-10 14:12:11', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('169', '170510141216783', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:12:16', '2017-05-10 14:12:16', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('170', '170510141324798', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:13:24', '2017-05-10 14:13:24', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('171', '170510141327911', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:13:27', '2017-05-10 14:13:27', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('172', '170510141434198', '12', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:14:34', '2017-05-10 14:14:34', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('173', '170510141444335', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:14:44', '2017-05-10 14:14:44', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('174', '170510141713768', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:17:13', '2017-05-10 14:17:13', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('175', '170510141943278', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:19:43', '2017-05-10 14:19:43', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('176', '170510141948554', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:19:48', '2017-05-10 14:19:48', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('177', '170510142603477', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:26:03', '2017-05-10 14:26:03', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('178', '170510142741629', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:27:41', '2017-05-10 14:27:41', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('179', '170510142747365', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:27:47', '2017-05-10 14:27:47', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('180', '170510143333513', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:33:33', '2017-05-10 14:33:33', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('181', '170510143349952', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:33:49', '2017-05-10 14:33:49', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('182', '170510143401916', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:34:01', '2017-05-10 14:34:01', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('183', '170510143441636', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:34:41', '2017-05-10 14:34:41', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('184', '170510143532717', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:35:32', '2017-05-10 14:35:32', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('185', '170510143549142', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:35:49', '2017-05-10 14:35:49', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('186', '170510143622607', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:36:22', '2017-05-10 14:36:22', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('187', '170510143641017', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:36:41', '2017-05-10 14:36:41', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('188', '170510143757243', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:37:57', '2017-05-10 14:37:57', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('189', '170510143843138', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:38:43', '2017-05-10 14:38:43', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('190', '170510143857804', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:38:57', '2017-05-10 14:38:57', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('191', '170510144006157', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 14:40:06', '2017-05-10 14:40:06', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('192', '170510153145840', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 15:31:45', '2017-05-10 15:31:45', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('193', '170510155931394', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 15:59:31', '2017-05-10 15:59:31', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('194', '170510155934783', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 15:59:34', '2017-05-10 15:59:34', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('195', '170510160010798', '18', '0.01', '2017-05-10 16:00:21', '19180009', '1', '0', '4003282001201705100297741568', '2017-05-10 16:00:10', '2017-05-10 16:00:10', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('196', '170510162418840', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 16:24:18', '2017-05-10 16:24:18', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('197', '170510162525394', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 16:25:25', '2017-05-10 16:25:25', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('198', '170510164559783', '16', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 16:45:59', '2017-05-10 16:45:59', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('199', '170510164609798', '16', '360.00', '2017-05-10 16:46:24', '19180009', '1', '0', '4003642001201705100303283670', '2017-05-10 16:46:09', '2017-05-10 16:46:09', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('200', '170510165233911', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 16:52:33', '2017-05-10 16:52:33', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('201', '170510170645840', '16', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:06:45', '2017-05-10 17:06:45', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('202', '170510170741394', '16', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:07:41', '2017-05-10 17:07:41', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('203', '170510170808783', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:08:08', '2017-05-10 17:08:08', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('204', '170510170840798', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:08:40', '2017-05-10 17:08:40', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('205', '170510170850911', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:08:50', '2017-05-10 17:08:50', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('206', '170510170915198', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:09:15', '2017-05-10 17:09:15', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('207', '170510170919335', '14', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:09:19', '2017-05-10 17:09:19', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('208', '170510170939768', '14', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:09:39', '2017-05-10 17:09:39', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('209', '170510171144278', '12', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:11:44', '2017-05-10 17:11:44', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('210', '170510171837554', '16', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:18:37', '2017-05-10 17:18:37', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('211', '170510172210477', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:22:10', '2017-05-10 17:22:10', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('212', '170510173147629', '16', '360.00', '2017-05-10 17:31:55', '19180009', '1', '0', '4007912001201705100310673464', '2017-05-10 17:31:47', '2017-05-10 17:31:47', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('213', '170510173532365', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:35:32', '2017-05-10 17:35:32', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('214', '170510175846513', '14', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:58:46', '2017-05-10 17:58:46', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('215', '170510175851952', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:58:51', '2017-05-10 17:58:51', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('216', '170510175901916', '12', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:59:01', '2017-05-10 17:59:01', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('217', '170510175912636', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:59:12', '2017-05-10 17:59:12', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('218', '170510175917717', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:59:17', '2017-05-10 17:59:17', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('219', '170510175931142', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:59:31', '2017-05-10 17:59:31', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('220', '170510175940607', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:59:40', '2017-05-10 17:59:40', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('221', '170510175943017', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:59:43', '2017-05-10 17:59:43', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('222', '170510175946243', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:59:46', '2017-05-10 17:59:46', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('223', '170510175948138', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:59:48', '2017-05-10 17:59:48', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('224', '170510175951804', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:59:51', '2017-05-10 17:59:51', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('225', '170510175953157', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:59:53', '2017-05-10 17:59:53', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('226', '170510175955401', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:59:55', '2017-05-10 17:59:55', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('227', '170510175957130', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 17:59:57', '2017-05-10 17:59:57', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('228', '170510180000109', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:00', '2017-05-10 18:00:00', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('229', '170510180002998', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:02', '2017-05-10 18:00:02', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('230', '170510180004219', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:04', '2017-05-10 18:00:04', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('231', '170510180007513', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:07', '2017-05-10 18:00:07', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('232', '170510180009839', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:09', '2017-05-10 18:00:09', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('233', '170510180012613', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:12', '2017-05-10 18:00:12', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('234', '170510180015296', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:14', '2017-05-10 18:00:14', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('235', '170510180017637', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:17', '2017-05-10 18:00:17', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('236', '170510180020524', '13', '180.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:20', '2017-05-10 18:00:20', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('237', '170510180023494', '12', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:23', '2017-05-10 18:00:23', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('238', '170510180025972', '14', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:25', '2017-05-10 18:00:25', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('239', '170510180028293', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:28', '2017-05-10 18:00:28', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('240', '170510180030771', '13', '180.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:30', '2017-05-10 18:00:30', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('241', '170510180034527', '12', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:34', '2017-05-10 18:00:34', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('242', '170510180036770', '14', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:36', '2017-05-10 18:00:36', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('243', '170510180039400', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:39', '2017-05-10 18:00:39', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('244', '170510180041891', '13', '180.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:41', '2017-05-10 18:00:41', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('245', '170510180044284', '12', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:44', '2017-05-10 18:00:44', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('246', '170510180046353', '14', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:46', '2017-05-10 18:00:46', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('247', '170510180049807', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:49', '2017-05-10 18:00:49', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('248', '170510180052919', '15', '50.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:52', '2017-05-10 18:00:52', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('249', '170510180056070', '13', '180.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:00:56', '2017-05-10 18:00:56', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('250', '170510180132949', '14', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:01:32', '2017-05-10 18:01:32', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('251', '170510181051526', '17', '0.01', '2017-05-10 18:11:02', '19180009', '1', '0', '4004862001201705100312038413', '2017-05-10 18:10:51', '2017-05-10 18:10:51', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('252', '170510182118086', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:21:18', '2017-05-10 18:21:18', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('253', '170510182129193', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-10 18:21:29', '2017-05-10 18:21:29', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('254', '170511155548663', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:55:48', '2017-05-11 15:55:48', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('255', '170511155548890', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:55:48', '2017-05-11 15:55:48', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('256', '170511155548349', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:55:48', '2017-05-11 15:55:48', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('257', '170511155548065', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:55:48', '2017-05-11 15:55:48', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('258', '170511155548021', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:55:48', '2017-05-11 15:55:48', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('259', '170511155548458', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:55:48', '2017-05-11 15:55:48', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('260', '170511155548064', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:55:48', '2017-05-11 15:55:48', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('261', '170511155548239', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:55:48', '2017-05-11 15:55:48', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('262', '170511155552970', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:55:51', '2017-05-11 15:55:51', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('263', '170511155554902', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:55:54', '2017-05-11 15:55:54', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('264', '170511155556851', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:55:56', '2017-05-11 15:55:56', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('265', '170511155557267', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:55:57', '2017-05-11 15:55:57', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('266', '170511155600540', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:56:00', '2017-05-11 15:56:00', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('267', '170511155609375', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:56:09', '2017-05-11 15:56:09', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('268', '170511155627760', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:56:27', '2017-05-11 15:56:27', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('269', '170511155714513', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:57:14', '2017-05-11 15:57:14', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('270', '170511155818668', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 15:58:18', '2017-05-11 15:58:18', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('271', '170511160019532', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 16:00:19', '2017-05-11 16:00:19', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('272', '170511160029040', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 16:00:29', '2017-05-11 16:00:29', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('273', '170511160039438', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 16:00:39', '2017-05-11 16:00:39', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('274', '170511160127931', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-11 16:01:27', '2017-05-11 16:01:27', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('275', '170512163243840', '15', '50.00', '2017-05-12 16:32:43', '19180009', '1', '1', '', '2017-05-12 16:32:43', '2017-05-12 16:32:43', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('276', '170512163445394', '15', '50.00', '2017-05-12 16:34:45', '19180009', '1', '1', '', '2017-05-12 16:34:45', '2017-05-12 16:34:45', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('277', '170513112157394', '16', '360.00', '2017-05-13 11:22:01', '19180009', '1', '1', '', '2017-05-13 11:21:57', '2017-05-13 11:21:57', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('278', '170515185755840', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-15 18:57:55', '2017-05-15 18:57:55', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('279', '170516110531840', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-16 11:05:31', '2017-05-16 11:05:31', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('280', '170518123953840', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-18 12:39:53', '2017-05-18 12:39:53', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('281', '170518124555798', '14', '360.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-18 12:45:55', '2017-05-18 12:45:55', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('282', '170518124621911', '13', '180.00', '2017-05-18 12:46:30', '19180009', '1', '0', '4008792001201705181347982125', '2017-05-18 12:46:21', '2017-05-18 12:46:21', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('283', '170518134725768', '13', '180.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-18 13:47:25', '2017-05-18 13:47:25', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('284', '170518135309629', '12', '360.00', '2017-05-18 13:53:16', '19180009', '1', '0', '4003642001201705181358845409', '2017-05-18 13:53:09', '2017-05-18 13:53:09', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('285', '170518135654916', '13', '180.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-18 13:56:54', '2017-05-18 13:56:54', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('286', '170518135714636', '13', '180.00', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-18 13:57:14', '2017-05-18 13:57:14', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('287', '170519175326017', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-19 17:53:26', '2017-05-19 17:53:26', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('288', '170519175329243', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-19 17:53:29', '2017-05-19 17:53:29', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('289', '170519175335138', '17', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-19 17:53:35', '2017-05-19 17:53:35', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('290', '170519175411804', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-19 17:54:11', '2017-05-19 17:54:11', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('291', '170519175435157', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-19 17:54:35', '2017-05-19 17:54:35', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('292', '170519175542401', '18', '0.01', '0000-00-00 00:00:00', '19180009', '0', '0', '', '2017-05-19 17:55:42', '2017-05-19 17:55:42', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('293', '170524162902394', '13', '180.00', '2017-05-24 16:29:15', '19180009', '1', '0', '4008792001201705242367029232', '2017-05-24 16:29:02', '2017-05-24 16:29:02', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('294', '170526163621840', '17', '0.01', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-05-26 16:36:21', '2017-05-26 16:36:21', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('295', '170526164225394', '17', '0.01', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-05-26 16:42:25', '2017-05-26 16:42:25', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('296', '170526170207840', '17', '0.01', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-05-26 17:02:07', '2017-05-26 17:02:07', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('297', '170526170210394', '18', '0.01', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-05-26 17:02:10', '2017-05-26 17:02:10', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('298', '170526170709783', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-05-26 17:07:09', '2017-05-26 17:07:09', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('299', '170526171234798', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-05-26 17:12:34', '2017-05-26 17:12:34', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('300', '170526171703911', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-05-26 17:17:03', '2017-05-26 17:17:03', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('301', '170526172042198', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-05-26 17:20:42', '2017-05-26 17:20:42', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('302', '170526172722335', '13', '180.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-05-26 17:27:22', '2017-05-26 17:27:22', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('303', '170526180532768', '14', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-05-26 18:05:32', '2017-05-26 18:05:32', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('304', '170526180610278', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-05-26 18:06:10', '2017-05-26 18:06:10', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('305', '170526180755554', '13', '180.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-05-26 18:07:55', '2017-05-26 18:07:55', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('306', '170526180808477', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-05-26 18:08:08', '2017-05-26 18:08:08', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('307', '170528165046629', '13', '180.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-05-28 16:50:46', '2017-05-28 16:50:46', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('308', '170531135701365', '17', '0.01', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-05-31 13:57:01', '2017-05-31 13:57:01', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('309', '170605141800840', '17', '0.01', '2017-06-05 14:18:37', '3', '1', '0', '4006492001201706054391516941', '2017-06-05 14:18:00', '2017-06-05 14:18:00', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('310', '170605154447394', '12', '360.00', '2017-06-05 15:44:58', '3', '1', '0', '4006492001201706054401782143', '2017-06-05 15:44:47', '2017-06-05 15:44:47', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('311', '170605154454783', '16', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-05 15:44:54', '2017-06-05 15:44:54', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('312', '170605154639554', '16', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-05 15:46:39', '2017-06-05 15:46:39', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('313', '170605154837477', '16', '360.00', '2017-06-05 15:48:44', '3', '1', '0', '4007912001201706054403650226', '2017-06-05 15:48:37', '2017-06-05 15:48:37', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('314', '170605155254919', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-05 15:52:54', '2017-06-05 15:52:54', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('315', '170605155756349', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-05 15:57:56', '2017-06-05 15:57:56', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('316', '170605160558760', '12', '360.00', '2017-06-05 16:06:10', '3', '1', '0', '4006492001201706054404996780', '2017-06-05 16:05:58', '2017-06-05 16:05:58', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('317', '170605161046513', '12', '360.00', '2017-06-05 16:11:04', '3', '1', '0', '4006492001201706054408560818', '2017-06-05 16:10:46', '2017-06-05 16:10:46', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('318', '170605163240668', '15', '50.00', '2017-06-05 16:32:49', '3', '1', '0', '4006492001201706054407585751', '2017-06-05 16:32:40', '2017-06-05 16:32:40', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('319', '170605163301532', '12', '360.00', '2017-06-05 16:33:08', '3', '1', '0', '4006492001201706054407615491', '2017-06-05 16:33:01', '2017-06-05 16:33:01', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('320', '170605165550657', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-05 16:55:50', '2017-06-05 16:55:50', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('321', '170605165558858', '12', '360.00', '2017-06-05 16:56:08', '3', '1', '0', '4007912001201706054410038022', '2017-06-05 16:55:58', '2017-06-05 16:55:58', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('322', '170605170451440', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-05 17:04:51', '2017-06-05 17:04:51', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('323', '170605170535924', '12', '360.00', '2017-06-05 17:05:43', '3', '1', '0', '4007912001201706054416330899', '2017-06-05 17:05:35', '2017-06-05 17:05:35', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('324', '170605172158399', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-05 17:21:58', '2017-06-05 17:21:58', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('325', '170605173300814', '13', '180.00', '2017-06-05 17:33:08', '3', '1', '0', '4007912001201706054414107469', '2017-06-05 17:33:00', '2017-06-05 17:33:00', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('326', '170605174504684', '15', '50.00', '2017-06-05 17:45:13', '3', '1', '0', '4006492001201706054416265040', '2017-06-05 17:45:04', '2017-06-05 17:45:04', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('327', '170605180038911', '12', '360.00', '2017-06-05 18:00:46', '3', '1', '0', '4007912001201706054422768399', '2017-06-05 18:00:38', '2017-06-05 18:00:38', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('328', '170605183056483', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-05 18:30:56', '2017-06-05 18:30:56', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('329', '170606134453216', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-06 13:44:53', '2017-06-06 13:44:53', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('330', '170606190222840', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-06 19:02:22', '2017-06-06 19:02:22', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('331', '170606190325394', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-06 19:03:25', '2017-06-06 19:03:25', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('332', '170607094249783', '13', '180.00', '2017-06-07 09:42:57', '3', '1', '0', '4008792001201706074646857684', '2017-06-07 09:42:49', '2017-06-07 09:42:49', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('333', '170607094308798', '15', '50.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-07 09:43:08', '2017-06-07 09:43:08', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('334', '170607095018911', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-07 09:50:18', '2017-06-07 09:50:18', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('335', '170607105005198', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-07 10:50:05', '2017-06-07 10:50:05', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('336', '170608105045840', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-08 10:50:45', '2017-06-08 10:50:45', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('337', '170608161120017', '15', '50.00', '2017-06-08 16:11:47', '3', '1', '0', '4006492001201706084838347492', '2017-06-08 16:11:20', '2017-06-08 16:11:20', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('338', '170608161123243', '15', '50.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-08 16:11:23', '2017-06-08 16:11:23', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('339', '170608161152138', '15', '50.00', '2017-06-08 16:12:00', '3', '1', '0', '4007912001201706084836981083', '2017-06-08 16:11:52', '2017-06-08 16:11:52', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('340', '170608161231804', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-08 16:12:31', '2017-06-08 16:12:31', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('341', '170608161247157', '14', '360.00', '2017-06-08 16:12:58', '3', '1', '0', '4006492001201706084838413829', '2017-06-08 16:12:47', '2017-06-08 16:12:47', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('342', '170608172328401', '13', '180.00', '2017-06-08 17:23:40', '3', '1', '0', '4007912001201706084843400101', '2017-06-08 17:23:28', '2017-06-08 17:23:28', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('343', '170608175555219', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-08 17:55:55', '2017-06-08 17:55:55', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('344', '170608182738293', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-08 18:27:38', '2017-06-08 18:27:38', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('345', '170608183116771', '13', '180.00', '2017-06-08 18:31:25', '3', '1', '0', '4006492001201706084856954606', '2017-06-08 18:31:16', '2017-06-08 18:31:16', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('346', '170612163616527', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-12 16:36:16', '2017-06-12 16:36:16', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('347', '170612170242840', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-12 17:02:42', '2017-06-12 17:02:42', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('348', '170612170256394', '14', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-12 17:02:56', '2017-06-12 17:02:56', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('349', '170612170328783', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-12 17:03:28', '2017-06-12 17:03:28', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('350', '170612170415798', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-12 17:04:15', '2017-06-12 17:04:15', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('351', '170612170931911', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-12 17:09:31', '2017-06-12 17:09:31', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('352', '170612170956198', '12', '360.00', '2017-06-12 17:10:21', '3', '1', '0', '4009522001201706125421743195', '2017-06-12 17:09:56', '2017-06-12 17:09:56', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('353', '170614112253335', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-14 11:22:53', '2017-06-14 11:22:53', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('354', '170614144040768', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-14 14:40:40', '2017-06-14 14:40:40', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('355', '170614144135278', '15', '50.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-14 14:41:35', '2017-06-14 14:41:35', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('356', '170614153645840', '13', '180.00', '2017-06-14 15:36:53', '3', '1', '0', '4007912001201706145688234027', '2017-06-14 15:36:45', '2017-06-14 15:36:45', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('357', '170614170952840', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-14 17:09:52', '2017-06-14 17:09:52', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('358', '170614171019394', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-14 17:10:19', '2017-06-14 17:10:19', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('359', '170614171031783', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-14 17:10:31', '2017-06-14 17:10:31', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('360', '170614171033798', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-14 17:10:33', '2017-06-14 17:10:33', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('361', '170614171115911', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-14 17:11:15', '2017-06-14 17:11:15', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('362', '170614171153198', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-14 17:11:53', '2017-06-14 17:11:53', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('363', '170614171250335', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-14 17:12:50', '2017-06-14 17:12:50', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('364', '170614171259768', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-14 17:12:59', '2017-06-14 17:12:59', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('365', '170614171312278', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-14 17:13:12', '2017-06-14 17:13:12', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('366', '170614171528554', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-14 17:15:28', '2017-06-14 17:15:28', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('367', '170614171528477', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-14 17:15:28', '2017-06-14 17:15:28', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('368', '170614171540629', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-14 17:15:40', '2017-06-14 17:15:40', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('369', '170614171722365', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-14 17:17:22', '2017-06-14 17:17:22', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('370', '170615110219840', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-15 11:02:19', '2017-06-15 11:02:19', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('371', '170615110245394', '15', '50.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-15 11:02:45', '2017-06-15 11:02:45', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('372', '170615110356783', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-15 11:03:56', '2017-06-15 11:03:56', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('373', '170615144717798', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-15 14:47:17', '2017-06-15 14:47:17', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('374', '170615173331911', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-15 17:33:31', '2017-06-15 17:33:31', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('375', '170616101850198', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:18:50', '2017-06-16 10:18:50', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('376', '170616101906335', '14', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:19:06', '2017-06-16 10:19:06', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('377', '170616101912768', '13', '180.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:19:12', '2017-06-16 10:19:12', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('378', '170616102003278', '15', '50.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:20:03', '2017-06-16 10:20:03', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('379', '170616102149554', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:21:49', '2017-06-16 10:21:49', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('380', '170616102246477', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:22:46', '2017-06-16 10:22:46', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('381', '170616102637629', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:26:37', '2017-06-16 10:26:37', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('382', '170616102647365', '14', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:26:47', '2017-06-16 10:26:47', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('383', '170616102652513', '13', '180.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:26:52', '2017-06-16 10:26:52', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('384', '170616102725952', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:27:25', '2017-06-16 10:27:25', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('385', '170616102730916', '13', '180.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:27:30', '2017-06-16 10:27:30', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('386', '170616102740636', '13', '180.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:27:40', '2017-06-16 10:27:40', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('387', '170616102747717', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:27:47', '2017-06-16 10:27:47', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('388', '170616102758142', '15', '50.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:27:58', '2017-06-16 10:27:58', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('389', '170616102918607', '13', '180.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:29:18', '2017-06-16 10:29:18', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('390', '170616102923017', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:29:23', '2017-06-16 10:29:23', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('391', '170616102928243', '15', '50.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:29:28', '2017-06-16 10:29:28', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('392', '170616103121138', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:31:21', '2017-06-16 10:31:21', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('393', '170616103133804', '13', '180.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:31:33', '2017-06-16 10:31:33', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('394', '170616103145157', '15', '50.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:31:45', '2017-06-16 10:31:45', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('395', '170616103844401', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 10:38:44', '2017-06-16 10:38:44', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('396', '170616143340130', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-16 14:33:40', '2017-06-16 14:33:40', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('397', '170619160905109', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-19 16:09:05', '2017-06-19 16:09:05', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('398', '170619160956998', '13', '180.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-19 16:09:56', '2017-06-19 16:09:56', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('399', '170619161015219', '13', '180.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-19 16:10:15', '2017-06-19 16:10:15', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('400', '170619161025513', '15', '50.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-19 16:10:25', '2017-06-19 16:10:25', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('401', '170619161058839', '12', '360.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-19 16:10:58', '2017-06-19 16:10:58', '0');
INSERT INTO `flowmgn_recharge_order` VALUES ('402', '170619161103613', '13', '180.00', '0000-00-00 00:00:00', '3', '0', '0', '', '2017-06-19 16:11:03', '2017-06-19 16:11:03', '0');

-- ----------------------------
-- Table structure for flowmgn_recharge_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_recharge_order_detail`;
CREATE TABLE `flowmgn_recharge_order_detail` (
  `order_detail_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` int(10) DEFAULT NULL COMMENT '订单ID',
  `card_id` int(10) DEFAULT NULL COMMENT '卡序号',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态（0：未支付 1：已支付 2：已开通 3:开通失败）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) DEFAULT '0' COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) DEFAULT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`order_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=utf8 COMMENT='充值订单表';

-- ----------------------------
-- Records of flowmgn_recharge_order_detail
-- ----------------------------
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('182', '167', '2', '0', '2017-05-10 14:11:32', '2017-05-10 14:11:32', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('183', '168', '26', '0', '2017-05-10 14:12:11', '2017-05-10 14:12:11', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('184', '169', '26', '0', '2017-05-10 14:12:16', '2017-05-10 14:12:16', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('185', '170', '26', '0', '2017-05-10 14:13:24', '2017-05-10 14:13:24', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('186', '171', '26', '0', '2017-05-10 14:13:27', '2017-05-10 14:13:27', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('187', '172', '2', '0', '2017-05-10 14:14:34', '2017-05-10 14:14:34', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('188', '173', '26', '0', '2017-05-10 14:14:44', '2017-05-10 14:14:44', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('189', '174', '26', '0', '2017-05-10 14:17:13', '2017-05-10 14:17:13', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('190', '175', '26', '0', '2017-05-10 14:19:43', '2017-05-10 14:19:43', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('191', '176', '26', '0', '2017-05-10 14:19:48', '2017-05-10 14:19:48', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('192', '177', '26', '0', '2017-05-10 14:26:03', '2017-05-10 14:26:03', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('193', '178', '26', '0', '2017-05-10 14:27:41', '2017-05-10 14:27:41', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('194', '179', '26', '0', '2017-05-10 14:27:47', '2017-05-10 14:27:47', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('195', '180', '26', '0', '2017-05-10 14:33:33', '2017-05-10 14:33:33', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('196', '181', '26', '0', '2017-05-10 14:33:49', '2017-05-10 14:33:49', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('197', '182', '26', '0', '2017-05-10 14:34:01', '2017-05-10 14:34:01', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('198', '183', '26', '0', '2017-05-10 14:34:41', '2017-05-10 14:34:41', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('199', '184', '26', '0', '2017-05-10 14:35:32', '2017-05-10 14:35:32', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('200', '185', '26', '0', '2017-05-10 14:35:49', '2017-05-10 14:35:49', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('201', '186', '26', '0', '2017-05-10 14:36:22', '2017-05-10 14:36:22', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('202', '187', '26', '0', '2017-05-10 14:36:41', '2017-05-10 14:36:41', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('203', '188', '26', '0', '2017-05-10 14:37:57', '2017-05-10 14:37:57', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('204', '189', '26', '0', '2017-05-10 14:38:43', '2017-05-10 14:38:43', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('205', '190', '26', '0', '2017-05-10 14:38:57', '2017-05-10 14:38:57', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('206', '191', '1', '0', '2017-05-10 14:40:06', '2017-05-10 14:40:06', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('207', '192', '29', '0', '2017-05-10 15:31:45', '2017-05-10 15:31:45', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('208', '193', '26', '0', '2017-05-10 15:59:31', '2017-05-10 15:59:31', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('209', '194', '26', '0', '2017-05-10 15:59:34', '2017-05-10 15:59:34', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('210', '195', '26', '1', '2017-05-10 16:00:10', '2017-05-10 16:00:21', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('211', '196', '26', '0', '2017-05-10 16:24:18', '2017-05-10 16:24:18', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('212', '197', '26', '0', '2017-05-10 16:25:25', '2017-05-10 16:25:25', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('213', '198', '29', '0', '2017-05-10 16:45:59', '2017-05-10 16:45:59', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('214', '199', '29', '1', '2017-05-10 16:46:09', '2017-05-10 16:46:24', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('215', '200', '26', '0', '2017-05-10 16:52:33', '2017-05-10 16:52:33', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('216', '201', '28', '0', '2017-05-10 17:06:45', '2017-05-10 17:06:45', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('217', '202', '28', '0', '2017-05-10 17:07:41', '2017-05-10 17:07:41', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('218', '203', '26', '0', '2017-05-10 17:08:08', '2017-05-10 17:08:08', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('219', '204', '26', '0', '2017-05-10 17:08:40', '2017-05-10 17:08:40', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('220', '205', '26', '0', '2017-05-10 17:08:50', '2017-05-10 17:08:50', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('221', '206', '26', '0', '2017-05-10 17:09:15', '2017-05-10 17:09:15', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('222', '207', '2', '0', '2017-05-10 17:09:19', '2017-05-10 17:09:19', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('223', '208', '1', '0', '2017-05-10 17:09:39', '2017-05-10 17:09:39', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('224', '209', '1', '0', '2017-05-10 17:11:44', '2017-05-10 17:11:44', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('225', '210', '28', '0', '2017-05-10 17:18:37', '2017-05-10 17:18:37', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('226', '211', '26', '0', '2017-05-10 17:22:10', '2017-05-10 17:22:10', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('227', '212', '28', '1', '2017-05-10 17:31:47', '2017-05-10 17:31:55', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('228', '213', '26', '0', '2017-05-10 17:35:32', '2017-05-10 17:35:32', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('229', '214', '2', '0', '2017-05-10 17:58:46', '2017-05-10 17:58:46', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('230', '215', '2', '0', '2017-05-10 17:58:51', '2017-05-10 17:58:51', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('231', '216', '2', '0', '2017-05-10 17:59:01', '2017-05-10 17:59:01', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('232', '217', '2', '0', '2017-05-10 17:59:12', '2017-05-10 17:59:12', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('233', '218', '2', '0', '2017-05-10 17:59:17', '2017-05-10 17:59:17', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('234', '219', '2', '0', '2017-05-10 17:59:31', '2017-05-10 17:59:31', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('235', '220', '2', '0', '2017-05-10 17:59:40', '2017-05-10 17:59:40', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('236', '221', '2', '0', '2017-05-10 17:59:43', '2017-05-10 17:59:43', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('237', '222', '2', '0', '2017-05-10 17:59:46', '2017-05-10 17:59:46', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('238', '223', '2', '0', '2017-05-10 17:59:48', '2017-05-10 17:59:48', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('239', '224', '2', '0', '2017-05-10 17:59:51', '2017-05-10 17:59:51', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('240', '225', '2', '0', '2017-05-10 17:59:53', '2017-05-10 17:59:53', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('241', '226', '2', '0', '2017-05-10 17:59:55', '2017-05-10 17:59:55', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('242', '227', '2', '0', '2017-05-10 17:59:57', '2017-05-10 17:59:57', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('243', '228', '2', '0', '2017-05-10 18:00:00', '2017-05-10 18:00:00', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('244', '229', '2', '0', '2017-05-10 18:00:02', '2017-05-10 18:00:02', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('245', '230', '2', '0', '2017-05-10 18:00:04', '2017-05-10 18:00:04', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('246', '231', '2', '0', '2017-05-10 18:00:07', '2017-05-10 18:00:07', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('247', '232', '2', '0', '2017-05-10 18:00:09', '2017-05-10 18:00:09', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('248', '233', '2', '0', '2017-05-10 18:00:12', '2017-05-10 18:00:12', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('249', '234', '2', '0', '2017-05-10 18:00:14', '2017-05-10 18:00:14', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('250', '235', '2', '0', '2017-05-10 18:00:17', '2017-05-10 18:00:17', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('251', '236', '2', '0', '2017-05-10 18:00:20', '2017-05-10 18:00:20', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('252', '237', '2', '0', '2017-05-10 18:00:23', '2017-05-10 18:00:23', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('253', '238', '2', '0', '2017-05-10 18:00:25', '2017-05-10 18:00:25', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('254', '239', '2', '0', '2017-05-10 18:00:28', '2017-05-10 18:00:28', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('255', '240', '2', '0', '2017-05-10 18:00:30', '2017-05-10 18:00:30', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('256', '241', '2', '0', '2017-05-10 18:00:34', '2017-05-10 18:00:34', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('257', '242', '2', '0', '2017-05-10 18:00:36', '2017-05-10 18:00:36', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('258', '243', '2', '0', '2017-05-10 18:00:39', '2017-05-10 18:00:39', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('259', '244', '2', '0', '2017-05-10 18:00:41', '2017-05-10 18:00:41', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('260', '245', '2', '0', '2017-05-10 18:00:44', '2017-05-10 18:00:44', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('261', '246', '2', '0', '2017-05-10 18:00:46', '2017-05-10 18:00:46', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('262', '247', '2', '0', '2017-05-10 18:00:49', '2017-05-10 18:00:49', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('263', '248', '2', '0', '2017-05-10 18:00:52', '2017-05-10 18:00:52', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('264', '249', '2', '0', '2017-05-10 18:00:56', '2017-05-10 18:00:56', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('265', '250', '2', '0', '2017-05-10 18:01:32', '2017-05-10 18:01:32', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('266', '251', '26', '1', '2017-05-10 18:10:51', '2017-05-10 18:11:02', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('267', '252', '26', '0', '2017-05-10 18:21:18', '2017-05-10 18:21:18', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('268', '253', '26', '0', '2017-05-10 18:21:29', '2017-05-10 18:21:29', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('269', '254', '26', '0', '2017-05-11 15:55:48', '2017-05-11 15:55:48', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('270', '255', '26', '0', '2017-05-11 15:55:48', '2017-05-11 15:55:48', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('271', '256', '26', '0', '2017-05-11 15:55:48', '2017-05-11 15:55:48', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('272', '257', '26', '0', '2017-05-11 15:55:48', '2017-05-11 15:55:48', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('273', '258', '26', '0', '2017-05-11 15:55:48', '2017-05-11 15:55:48', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('274', '259', '26', '0', '2017-05-11 15:55:48', '2017-05-11 15:55:48', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('275', '260', '26', '0', '2017-05-11 15:55:48', '2017-05-11 15:55:48', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('276', '261', '26', '0', '2017-05-11 15:55:48', '2017-05-11 15:55:48', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('277', '262', '26', '0', '2017-05-11 15:55:51', '2017-05-11 15:55:51', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('278', '263', '26', '0', '2017-05-11 15:55:54', '2017-05-11 15:55:54', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('279', '264', '26', '0', '2017-05-11 15:55:56', '2017-05-11 15:55:56', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('280', '265', '26', '0', '2017-05-11 15:55:57', '2017-05-11 15:55:57', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('281', '266', '26', '0', '2017-05-11 15:56:00', '2017-05-11 15:56:00', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('282', '267', '26', '0', '2017-05-11 15:56:09', '2017-05-11 15:56:09', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('283', '268', '26', '0', '2017-05-11 15:56:27', '2017-05-11 15:56:27', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('284', '269', '26', '0', '2017-05-11 15:57:14', '2017-05-11 15:57:14', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('285', '270', '26', '0', '2017-05-11 15:58:18', '2017-05-11 15:58:18', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('286', '271', '26', '0', '2017-05-11 16:00:19', '2017-05-11 16:00:19', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('287', '272', '26', '0', '2017-05-11 16:00:29', '2017-05-11 16:00:29', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('288', '273', '26', '0', '2017-05-11 16:00:39', '2017-05-11 16:00:39', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('289', '274', '26', '0', '2017-05-11 16:01:27', '2017-05-11 16:01:27', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('290', '275', '2', '1', '2017-05-12 16:32:43', '2017-05-12 16:32:43', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('291', '276', '2', '1', '2017-05-12 16:34:45', '2017-05-12 16:34:45', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('292', '277', '19', '1', '2017-05-13 11:21:57', '2017-05-13 11:22:01', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('293', '278', '26', '0', '2017-05-15 18:57:55', '2017-05-15 18:57:55', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('294', '279', '26', '0', '2017-05-16 11:05:31', '2017-05-16 11:05:31', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('295', '280', '26', '0', '2017-05-18 12:39:53', '2017-05-18 12:39:53', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('296', '281', '2', '0', '2017-05-18 12:45:55', '2017-05-18 12:45:55', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('297', '282', '2', '1', '2017-05-18 12:46:21', '2017-05-18 12:46:30', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('298', '283', '2', '0', '2017-05-18 13:47:25', '2017-05-18 13:47:25', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('299', '284', '30', '1', '2017-05-18 13:53:09', '2017-05-18 13:53:16', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('300', '285', '2', '0', '2017-05-18 13:56:54', '2017-05-18 13:56:54', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('301', '286', '2', '0', '2017-05-18 13:57:14', '2017-05-18 13:57:14', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('302', '287', '33', '0', '2017-05-19 17:53:26', '2017-05-19 17:53:26', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('303', '288', '33', '0', '2017-05-19 17:53:29', '2017-05-19 17:53:29', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('304', '289', '33', '0', '2017-05-19 17:53:35', '2017-05-19 17:53:35', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('305', '290', '33', '0', '2017-05-19 17:54:11', '2017-05-19 17:54:11', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('306', '291', '33', '0', '2017-05-19 17:54:35', '2017-05-19 17:54:35', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('307', '292', '33', '0', '2017-05-19 17:55:42', '2017-05-19 17:55:42', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('308', '293', '1', '1', '2017-05-24 16:29:02', '2017-05-24 16:29:15', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('309', '294', '26', '0', '2017-05-26 16:36:21', '2017-05-26 16:36:21', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('310', '295', '26', '0', '2017-05-26 16:42:25', '2017-05-26 16:42:25', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('311', '296', '26', '0', '2017-05-26 17:02:07', '2017-05-26 17:02:07', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('312', '297', '26', '0', '2017-05-26 17:02:10', '2017-05-26 17:02:10', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('313', '298', '1', '0', '2017-05-26 17:07:09', '2017-05-26 17:07:09', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('314', '299', '1', '0', '2017-05-26 17:12:34', '2017-05-26 17:12:34', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('315', '300', '1', '0', '2017-05-26 17:17:03', '2017-05-26 17:17:03', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('316', '301', '30', '0', '2017-05-26 17:20:42', '2017-05-26 17:20:42', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('317', '302', '1', '0', '2017-05-26 17:27:22', '2017-05-26 17:27:22', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('318', '303', '34', '0', '2017-05-26 18:05:32', '2017-05-26 18:05:32', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('319', '304', '34', '0', '2017-05-26 18:06:10', '2017-05-26 18:06:10', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('320', '305', '34', '0', '2017-05-26 18:07:55', '2017-05-26 18:07:55', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('321', '306', '34', '0', '2017-05-26 18:08:08', '2017-05-26 18:08:08', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('322', '307', '1', '0', '2017-05-28 16:50:46', '2017-05-28 16:50:46', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('323', '308', '33', '0', '2017-05-31 13:57:01', '2017-05-31 13:57:01', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('324', '309', '26', '1', '2017-06-05 14:18:00', '2017-06-05 14:18:37', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('325', '310', '18', '1', '2017-06-05 15:44:47', '2017-06-05 15:44:58', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('326', '311', '3', '0', '2017-06-05 15:44:54', '2017-06-05 15:44:54', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('327', '312', '3', '0', '2017-06-05 15:46:39', '2017-06-05 15:46:39', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('328', '313', '3', '1', '2017-06-05 15:48:37', '2017-06-05 15:48:44', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('329', '314', '2', '0', '2017-06-05 15:52:54', '2017-06-05 15:52:54', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('330', '315', '1', '0', '2017-06-05 15:57:56', '2017-06-05 15:57:56', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('331', '316', '18', '1', '2017-06-05 16:05:58', '2017-06-05 16:06:10', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('332', '317', '479', '1', '2017-06-05 16:10:46', '2017-06-05 16:11:04', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('333', '318', '15', '1', '2017-06-05 16:32:40', '2017-06-05 16:32:49', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('334', '319', '15', '1', '2017-06-05 16:33:01', '2017-06-05 16:33:08', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('335', '320', '478', '0', '2017-06-05 16:55:50', '2017-06-05 16:55:50', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('336', '321', '478', '1', '2017-06-05 16:55:58', '2017-06-05 16:56:08', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('337', '322', '30', '0', '2017-06-05 17:04:51', '2017-06-05 17:04:51', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('338', '323', '30', '1', '2017-06-05 17:05:35', '2017-06-05 17:05:43', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('339', '324', '30', '0', '2017-06-05 17:21:58', '2017-06-05 17:21:58', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('340', '325', '30', '1', '2017-06-05 17:33:00', '2017-06-05 17:33:08', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('341', '326', '15', '1', '2017-06-05 17:45:04', '2017-06-05 17:45:13', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('342', '327', '30', '1', '2017-06-05 18:00:38', '2017-06-05 18:00:46', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('343', '328', '15', '0', '2017-06-05 18:30:56', '2017-06-05 18:30:56', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('344', '329', '15', '0', '2017-06-06 13:44:53', '2017-06-06 13:44:53', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('345', '330', '30', '0', '2017-06-06 19:02:22', '2017-06-06 19:02:22', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('346', '331', '30', '0', '2017-06-06 19:03:25', '2017-06-06 19:03:25', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('347', '332', '30', '1', '2017-06-07 09:42:49', '2017-06-07 09:42:57', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('348', '333', '30', '0', '2017-06-07 09:43:08', '2017-06-07 09:43:08', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('349', '334', '30', '0', '2017-06-07 09:50:18', '2017-06-07 09:50:18', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('350', '335', '30', '0', '2017-06-07 10:50:05', '2017-06-07 10:50:05', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('351', '336', '15', '0', '2017-06-08 10:50:45', '2017-06-08 10:50:45', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('352', '337', '15', '1', '2017-06-08 16:11:20', '2017-06-08 16:11:47', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('353', '338', '30', '0', '2017-06-08 16:11:23', '2017-06-08 16:11:23', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('354', '339', '30', '1', '2017-06-08 16:11:52', '2017-06-08 16:12:00', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('355', '340', '15', '0', '2017-06-08 16:12:31', '2017-06-08 16:12:31', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('356', '341', '15', '1', '2017-06-08 16:12:47', '2017-06-08 16:12:58', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('357', '342', '30', '1', '2017-06-08 17:23:28', '2017-06-08 17:23:40', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('358', '343', '15', '0', '2017-06-08 17:55:55', '2017-06-08 17:55:55', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('359', '344', '15', '0', '2017-06-08 18:27:38', '2017-06-08 18:27:38', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('360', '345', '480', '1', '2017-06-08 18:31:16', '2017-06-08 18:31:25', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('361', '346', '30', '0', '2017-06-12 16:36:16', '2017-06-12 16:36:16', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('362', '347', '34', '0', '2017-06-12 17:02:42', '2017-06-12 17:02:42', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('363', '348', '34', '0', '2017-06-12 17:02:56', '2017-06-12 17:02:56', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('364', '349', '34', '0', '2017-06-12 17:03:28', '2017-06-12 17:03:28', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('365', '350', '34', '0', '2017-06-12 17:04:15', '2017-06-12 17:04:15', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('366', '351', '34', '0', '2017-06-12 17:09:31', '2017-06-12 17:09:31', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('367', '352', '34', '1', '2017-06-12 17:09:56', '2017-06-12 17:10:21', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('368', '353', '15', '0', '2017-06-14 11:22:53', '2017-06-14 11:22:53', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('369', '354', '15', '0', '2017-06-14 14:40:40', '2017-06-14 14:40:40', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('370', '355', '15', '0', '2017-06-14 14:41:35', '2017-06-14 14:41:35', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('371', '356', '30', '1', '2017-06-14 15:36:45', '2017-06-14 15:36:53', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('372', '357', '15', '0', '2017-06-14 17:09:52', '2017-06-14 17:09:52', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('373', '358', '15', '0', '2017-06-14 17:10:19', '2017-06-14 17:10:19', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('374', '359', '15', '0', '2017-06-14 17:10:31', '2017-06-14 17:10:31', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('375', '360', '15', '0', '2017-06-14 17:10:33', '2017-06-14 17:10:33', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('376', '361', '15', '0', '2017-06-14 17:11:15', '2017-06-14 17:11:15', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('377', '362', '15', '0', '2017-06-14 17:11:53', '2017-06-14 17:11:53', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('378', '363', '15', '0', '2017-06-14 17:12:50', '2017-06-14 17:12:50', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('379', '364', '15', '0', '2017-06-14 17:12:59', '2017-06-14 17:12:59', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('380', '365', '15', '0', '2017-06-14 17:13:12', '2017-06-14 17:13:12', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('381', '366', '15', '0', '2017-06-14 17:15:28', '2017-06-14 17:15:28', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('382', '367', '15', '0', '2017-06-14 17:15:28', '2017-06-14 17:15:28', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('383', '368', '15', '0', '2017-06-14 17:15:40', '2017-06-14 17:15:40', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('384', '369', '15', '0', '2017-06-14 17:17:22', '2017-06-14 17:17:22', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('385', '370', '2', '0', '2017-06-15 11:02:19', '2017-06-15 11:02:19', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('386', '371', '2', '0', '2017-06-15 11:02:45', '2017-06-15 11:02:45', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('387', '372', '2', '0', '2017-06-15 11:03:56', '2017-06-15 11:03:56', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('388', '373', '15', '0', '2017-06-15 14:47:17', '2017-06-15 14:47:17', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('389', '374', '15', '0', '2017-06-15 17:33:31', '2017-06-15 17:33:31', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('390', '375', '15', '0', '2017-06-16 10:18:50', '2017-06-16 10:18:50', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('391', '376', '15', '0', '2017-06-16 10:19:06', '2017-06-16 10:19:06', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('392', '377', '15', '0', '2017-06-16 10:19:12', '2017-06-16 10:19:12', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('393', '378', '15', '0', '2017-06-16 10:20:03', '2017-06-16 10:20:03', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('394', '379', '15', '0', '2017-06-16 10:21:49', '2017-06-16 10:21:49', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('395', '380', '15', '0', '2017-06-16 10:22:46', '2017-06-16 10:22:46', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('396', '381', '15', '0', '2017-06-16 10:26:37', '2017-06-16 10:26:37', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('397', '382', '15', '0', '2017-06-16 10:26:47', '2017-06-16 10:26:47', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('398', '383', '15', '0', '2017-06-16 10:26:52', '2017-06-16 10:26:52', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('399', '384', '15', '0', '2017-06-16 10:27:25', '2017-06-16 10:27:25', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('400', '385', '15', '0', '2017-06-16 10:27:30', '2017-06-16 10:27:30', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('401', '386', '15', '0', '2017-06-16 10:27:40', '2017-06-16 10:27:40', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('402', '387', '15', '0', '2017-06-16 10:27:47', '2017-06-16 10:27:47', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('403', '388', '15', '0', '2017-06-16 10:27:58', '2017-06-16 10:27:58', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('404', '389', '15', '0', '2017-06-16 10:29:18', '2017-06-16 10:29:18', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('405', '390', '15', '0', '2017-06-16 10:29:23', '2017-06-16 10:29:23', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('406', '391', '15', '0', '2017-06-16 10:29:28', '2017-06-16 10:29:28', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('407', '392', '15', '0', '2017-06-16 10:31:21', '2017-06-16 10:31:21', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('408', '393', '15', '0', '2017-06-16 10:31:33', '2017-06-16 10:31:33', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('409', '394', '15', '0', '2017-06-16 10:31:45', '2017-06-16 10:31:45', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('410', '395', '15', '0', '2017-06-16 10:38:44', '2017-06-16 10:38:44', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('411', '396', '15', '0', '2017-06-16 14:33:40', '2017-06-16 14:33:40', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('412', '397', '15', '0', '2017-06-19 16:09:05', '2017-06-19 16:09:05', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('413', '398', '15', '0', '2017-06-19 16:09:56', '2017-06-19 16:09:56', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('414', '399', '15', '0', '2017-06-19 16:10:15', '2017-06-19 16:10:15', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('415', '400', '15', '0', '2017-06-19 16:10:25', '2017-06-19 16:10:25', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('416', '401', '15', '0', '2017-06-19 16:10:58', '2017-06-19 16:10:58', '0', null);
INSERT INTO `flowmgn_recharge_order_detail` VALUES ('417', '402', '15', '0', '2017-06-19 16:11:03', '2017-06-19 16:11:03', '0', null);

-- ----------------------------
-- Table structure for flowmgn_recharge_plan
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_recharge_plan`;
CREATE TABLE `flowmgn_recharge_plan` (
  `recharge_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `flowserv_id` int(10) NOT NULL COMMENT '流量服务包ID',
  `package_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '服务套餐类型:(1:初始套餐 2:续约套餐 3:续约流量包)',
  `card_id` int(10) DEFAULT '0' COMMENT '流量卡ID',
  `order_id` int(10) DEFAULT NULL COMMENT 'id(0:表示初始化套餐，无订单信息）',
  `order_applytime` datetime DEFAULT NULL COMMENT '充值订单生效日期',
  `order_expiretime` datetime DEFAULT NULL COMMENT '充值订单到期时间',
  `next_chargetime` datetime DEFAULT NULL COMMENT '下一次充值时间',
  `curr_cycle` tinyint(4) DEFAULT NULL COMMENT '当前周期数',
  `plan_cycle` tinyint(4) DEFAULT NULL COMMENT '计划总期数',
  `status` tinyint(4) DEFAULT '0' COMMENT '充值使用状态（1：未充值 2：充值中 3：已充值 ）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后操作人ID',
  PRIMARY KEY (`recharge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COMMENT='流量周期执行计划表';

-- ----------------------------
-- Records of flowmgn_recharge_plan
-- ----------------------------
INSERT INTO `flowmgn_recharge_plan` VALUES ('107', '119', '1', '26', '0', '2017-05-10 14:04:14', '2018-05-11 00:00:00', '2017-07-10 23:59:59', '2', '12', '2', '2017-05-10 14:04:13', '2017-06-11 00:10:32', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('108', '111', '1', '15', '0', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2018-05-11 00:00:00', '1', '1', '3', '2017-05-10 15:03:43', '2017-05-10 15:03:43', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('109', '116', '2', '28', '0', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-06-11 00:00:00', '1', '12', '2', '2017-05-10 15:03:43', '2017-05-10 15:03:43', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('110', '116', '2', '29', '0', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-06-11 00:00:00', '1', '12', '2', '2017-05-10 15:03:43', '2017-05-10 15:03:43', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('111', '111', '1', '30', '0', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2018-05-11 00:00:00', '1', '1', '3', '2017-05-10 15:03:43', '2017-05-10 15:03:43', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('112', '111', '1', '31', '0', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2018-05-11 00:00:00', '1', '1', '3', '2017-05-10 15:03:43', '2017-05-10 15:03:43', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('113', '111', '1', '32', '0', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2018-05-11 00:00:00', '1', '1', '3', '2017-05-10 15:03:43', '2017-05-10 15:03:43', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('114', '118', '2', '26', '195', '2017-05-10 16:00:21', '2018-08-11 00:00:00', '2017-06-11 00:00:00', '1', '3', '3', '2017-05-10 16:03:58', '2017-05-10 16:03:58', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('115', '117', '2', '26', '251', '2017-05-10 18:11:02', '2019-08-11 00:00:00', '2017-06-11 00:00:00', '1', '12', '3', '2017-05-10 18:15:22', '2017-05-10 18:15:22', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('116', '115', '3', '2', '275', '2017-05-12 16:32:43', '2017-06-13 00:00:00', '2017-05-12 16:32:43', '0', '1', '1', '2017-05-12 16:32:43', '2017-05-12 16:32:43', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('117', '115', '3', '2', '276', '2017-05-12 16:34:45', '2017-06-13 00:00:00', '2017-05-12 16:34:45', '0', '1', '1', '2017-05-12 16:34:45', '2017-05-12 16:34:45', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('118', '111', '1', '34', '0', '2017-05-12 18:15:03', '2018-05-12 23:59:59', '2018-05-12 23:59:59', '1', '1', '3', '2017-05-12 18:15:02', '2017-05-12 18:15:02', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('119', '111', '1', '34', '0', '2017-05-12 18:33:50', '2018-05-12 23:59:59', '2018-05-12 23:59:59', '1', '1', '3', '2017-05-12 18:33:50', '2017-05-12 18:33:50', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('120', '111', '1', '34', '0', '2017-05-12 18:44:57', '2018-05-12 23:59:59', '2018-05-12 23:59:59', '1', '1', '3', '2017-05-12 18:44:57', '2017-05-12 18:44:57', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('121', '113', '3', '19', '0', '2017-05-16 10:36:14', '2017-07-16 23:59:59', '2017-06-16 23:59:59', '1', '6', '2', '2017-05-16 10:36:14', '2017-05-16 10:36:14', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('122', '113', '3', '2', '282', '2017-05-18 12:46:30', '2017-11-18 23:59:59', '2017-05-18 12:46:30', '0', '6', '1', '2017-05-18 12:46:30', '2017-05-18 12:46:30', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('123', '112', '2', '30', '284', '2017-05-10 15:03:43', '2019-05-10 23:59:59', '2018-05-10 23:59:59', '1', '1', '3', '2017-05-18 13:56:03', '2017-05-18 13:56:03', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('124', '120', '1', '33', '0', '2017-05-18 14:38:35', '2017-08-18 23:59:59', '2017-07-18 23:59:59', '2', '3', '2', '2017-05-18 14:38:35', '2017-06-19 00:02:08', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('125', '113', '3', '1', '293', '2017-05-24 16:29:15', '2017-11-24 23:59:59', '2017-06-24 23:59:59', '1', '6', '2', '2017-05-24 16:29:15', '2017-05-24 16:32:16', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('126', '120', '1', '27', '0', '2017-05-28 00:00:02', '2017-08-27 23:59:59', '2017-06-27 23:59:59', '1', '3', '2', '2017-05-28 00:00:02', '2017-05-28 00:00:02', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('127', '117', '2', '26', '309', '2017-05-10 18:11:02', '2020-08-10 23:59:59', '2017-06-10 23:59:59', '1', '12', '3', '2017-06-05 14:19:44', '2017-06-05 14:19:44', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('128', '112', '1', '18', '0', '2017-06-05 15:46:09', '2019-05-09 23:59:59', '2018-06-05 23:59:59', '1', '1', '3', '2017-06-05 15:46:09', '2017-06-05 15:46:09', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('129', '112', '2', '18', '310', '2017-06-05 15:44:58', '2019-05-09 23:59:59', '2018-06-05 23:59:59', '1', '1', '3', '2017-06-05 15:46:09', '2017-06-05 15:46:09', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('130', '112', '2', '18', '316', '2017-06-05 15:44:58', '2020-05-09 23:59:59', '2018-06-05 23:59:59', '1', '1', '3', '2017-06-05 16:06:10', '2017-06-05 16:06:10', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('131', '115', '3', '15', '318', '2017-06-05 16:32:49', '2017-07-05 23:59:59', '2017-07-05 23:59:59', '1', '1', '3', '2017-06-05 16:32:49', '2017-06-05 16:37:09', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('132', '112', '2', '15', '319', '2017-05-10 15:03:43', '2019-05-10 23:59:59', '2018-05-10 23:59:59', '1', '1', '3', '2017-06-05 16:36:59', '2017-06-05 16:36:59', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('133', '112', '2', '30', '323', '2017-05-10 15:03:43', '2020-05-10 23:59:59', '2018-05-10 23:59:59', '1', '1', '3', '2017-06-05 17:07:29', '2017-06-05 17:07:29', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('134', '113', '3', '30', '325', '2017-06-05 17:33:08', '2017-12-05 23:59:59', '2017-07-05 23:59:59', '1', '6', '2', '2017-06-05 17:33:08', '2017-06-05 17:38:09', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('135', '115', '3', '15', '326', '2017-06-05 17:45:13', '2017-07-05 23:59:59', '2017-07-05 23:59:59', '1', '1', '3', '2017-06-05 17:45:13', '2017-06-05 17:48:19', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('136', '112', '2', '30', '327', '2017-05-10 15:03:43', '2021-05-10 23:59:59', '2018-05-10 23:59:59', '1', '1', '3', '2017-06-05 18:03:24', '2017-06-05 18:03:24', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('137', '113', '3', '30', '332', '2017-06-07 09:42:57', '2017-12-07 23:59:59', '2017-07-07 23:59:59', '1', '6', '2', '2017-06-07 09:42:57', '2017-06-07 09:47:30', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('138', '115', '3', '15', '337', '2017-06-08 16:11:47', '2017-07-08 23:59:59', '2017-07-08 23:59:59', '1', '1', '3', '2017-06-08 16:11:47', '2017-06-08 16:16:32', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('139', '115', '3', '30', '339', '2017-06-08 16:12:00', '2017-07-08 23:59:59', '2017-07-08 23:59:59', '1', '1', '3', '2017-06-08 16:12:00', '2017-06-08 16:16:32', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('140', '114', '1', '15', '0', '2017-06-08 16:16:22', '2018-06-08 23:59:59', '2018-06-08 23:59:59', '1', '1', '3', '2017-06-08 16:16:22', '2017-06-08 16:16:22', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('141', '114', '2', '15', '341', '2017-06-08 16:12:58', '2018-06-08 23:59:59', '2018-06-08 23:59:59', '1', '1', '3', '2017-06-08 16:16:22', '2017-06-08 16:16:22', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('142', '113', '3', '30', '342', '2017-06-08 17:23:40', '2017-12-08 23:59:59', '2017-07-08 23:59:59', '1', '6', '2', '2017-06-08 17:23:40', '2017-06-08 17:27:42', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('143', '112', '2', '34', '352', '2017-05-12 18:44:57', '2019-05-12 23:59:59', '2018-05-12 23:59:59', '1', '1', '3', '2017-06-12 17:13:56', '2017-06-12 17:13:56', '0');
INSERT INTO `flowmgn_recharge_plan` VALUES ('144', '113', '3', '30', '356', '2017-06-14 15:36:53', '2017-12-14 23:59:59', '2017-06-14 15:36:53', '0', '6', '1', '2017-06-14 15:36:53', '2017-06-14 15:36:53', '0');

-- ----------------------------
-- Table structure for flowmgn_sp
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_sp`;
CREATE TABLE `flowmgn_sp` (
  `sp_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '服务商户ID',
  `sp_code` int(10) DEFAULT NULL COMMENT '服务商（6位编码，广联8位）'',',
  `sp_name` varchar(64) DEFAULT NULL COMMENT '服务商名称',
  `sp_desc` varchar(256) DEFAULT NULL COMMENT '服务商描述',
  `contactperson` varchar(64) DEFAULT NULL COMMENT '联系人',
  `contactphone` varchar(64) DEFAULT NULL COMMENT '联系电话',
  `comm_addr` varchar(256) DEFAULT NULL COMMENT '通讯地址',
  `accesskey` varchar(128) DEFAULT NULL COMMENT '访问KEY',
  `max_users` int(5) DEFAULT NULL COMMENT '最多用户数',
  `status` int(3) DEFAULT NULL COMMENT '商户状态 （0：无效 1：有效）',
  `parent_id` tinyint(4) DEFAULT NULL COMMENT '父系服务商ID',
  `level` tinyint(4) DEFAULT NULL COMMENT '层级',
  `registry_date` datetime DEFAULT NULL COMMENT '注册日期',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='流量平台商户信息';

-- ----------------------------
-- Records of flowmgn_sp
-- ----------------------------
INSERT INTO `flowmgn_sp` VALUES ('1', '1000123', '测试专用商户', '深圳科兴科学园', null, null, '深圳', 'abcdef', '100000', '1', '3', '1', '2017-05-09 11:42:39', '2017-05-09 11:42:43', '2017-05-09 11:42:46', '0', '');
INSERT INTO `flowmgn_sp` VALUES ('2', '100000', '微信开发环境', '深圳科兴科学园', null, null, '深圳', 'abcdef', '100000', '1', '3', '1', '2017-05-09 11:42:39', '2017-05-09 11:42:43', '2017-05-09 11:42:46', '0', '');
INSERT INTO `flowmgn_sp` VALUES ('3', '19180009', '广联赛讯', '深圳科兴科学园', null, null, '深圳', 'abcdef', '100000', '1', '3', '1', '2017-05-09 11:42:39', '2017-05-09 11:42:43', '2017-05-09 11:42:46', '0', '');
INSERT INTO `flowmgn_sp` VALUES ('4', '1000001', '极路客', '北京智趣车联科技有限公司创立于2014年2月', null, null, '北京', 'jiluke', '100000', '1', '3', '1', '2017-05-09 11:42:39', '2017-05-09 11:42:43', '2017-05-09 11:42:46', '0', 'admin');

-- ----------------------------
-- Table structure for flowmgn_sp_cardstatistic
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_sp_cardstatistic`;
CREATE TABLE `flowmgn_sp_cardstatistic` (
  `statistic_key` varchar(64) NOT NULL COMMENT '统计key',
  `statistic_value` varchar(255) NOT NULL COMMENT '统计值',
  `statistic_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '统计类型:0=流量池的统计',
  `sp_id` int(10) NOT NULL DEFAULT '0' COMMENT '商户ID',
  `sp_name` varchar(64) DEFAULT NULL COMMENT '商户编号',
  KEY `UK_cs_flowmgn_merchant_cardstatistic` (`statistic_key`,`sp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户报表统计';

-- ----------------------------
-- Records of flowmgn_sp_cardstatistic
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_sp_card_stat
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_sp_card_stat`;
CREATE TABLE `flowmgn_sp_card_stat` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stat_key` varchar(64) NOT NULL COMMENT '统计key,根据类型区分，流量使用统计:used0to200,used200to500,used500to1024,used1024to2048,used2048to3076,used3076to4096,used4096to6144,used6144to9999;流量剩余统计:remaid10per,remaind20per,remaind30per,remaind50per,remaind80per;激活统计：day1,day2,day3,day4,day5,day6,day7;套餐状态统计:stock,activated,expired',
  `stat_value` varchar(255) NOT NULL COMMENT '统计值',
  `stat_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '统计类型:0-流量使用统计,1-流量剩余统计,2-套餐激活统计,3-套餐状态统计',
  `sp_id` int(10) NOT NULL DEFAULT '0' COMMENT '商户ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_flowmgn_sp_card_stat` (`stat_key`,`sp_id`,`stat_type`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='商户相关的统计信息';

-- ----------------------------
-- Records of flowmgn_sp_card_stat
-- ----------------------------
INSERT INTO `flowmgn_sp_card_stat` VALUES ('1', 'used2048to3076', '1', '0', '1', '2017-06-20 00:00:18', '2017-06-20 00:00:18');
INSERT INTO `flowmgn_sp_card_stat` VALUES ('2', 'used0to200', '14', '0', '3', '2017-06-20 00:00:18', '2017-06-20 00:00:18');
INSERT INTO `flowmgn_sp_card_stat` VALUES ('3', 'used0to200', '3', '0', '4', '2017-06-20 00:00:18', '2017-06-20 00:00:18');
INSERT INTO `flowmgn_sp_card_stat` VALUES ('4', 'remaid10per', '1', '1', '1', '2017-06-20 00:00:18', '2017-06-20 00:00:18');
INSERT INTO `flowmgn_sp_card_stat` VALUES ('5', 'remaind100per', '7', '1', '3', '2017-06-20 00:00:18', '2017-06-20 00:00:18');
INSERT INTO `flowmgn_sp_card_stat` VALUES ('6', 'remaind100per', '3', '1', '4', '2017-06-20 00:00:18', '2017-06-20 00:00:18');
INSERT INTO `flowmgn_sp_card_stat` VALUES ('7', 'expired', '1', '3', '1', '2017-06-20 00:00:18', '2017-06-20 00:00:18');
INSERT INTO `flowmgn_sp_card_stat` VALUES ('8', 'activated', '214', '3', '3', '2017-06-20 00:00:18', '2017-06-20 00:00:18');
INSERT INTO `flowmgn_sp_card_stat` VALUES ('9', 'activated', '3', '3', '4', '2017-06-20 00:00:18', '2017-06-20 00:00:18');

-- ----------------------------
-- Table structure for flowmgn_sp_flowpackage
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_sp_flowpackage`;
CREATE TABLE `flowmgn_sp_flowpackage` (
  `package_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `sp_id` int(10) DEFAULT NULL COMMENT '服务商ID（0：表示通用）',
  `package_code` int(10) DEFAULT NULL COMMENT '服务套餐编号',
  `package_name` varchar(128) NOT NULL COMMENT '服务套餐名称',
  `package_alias` varchar(64) DEFAULT NULL COMMENT '服务套餐别名(用于展示）',
  `package_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '服务套餐类型:(1:初始套餐 2:续约套餐 3:续约流量包)',
  `emptypk` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该套餐是否为白卡套餐,0：正常套餐,1：白卡套餐',
  `package_desc` varchar(256) DEFAULT NULL COMMENT '服务套餐描述',
  `package_price` float(8,2) DEFAULT NULL COMMENT '服务套餐价格',
  `is_separate_bill` tinyint(4) DEFAULT NULL COMMENT '是否分离计费 (0:不支持分离计费 / 1:支持分离计费)',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '服务套餐状态（1：已上架 2：已下架)',
  `autoactive_package_days` tinyint(4) DEFAULT NULL COMMENT '初始套餐：激活套餐宽限期(天)',
  `owner` tinyint(4) DEFAULT NULL COMMENT '所属运营商 （1：移动 2：电信 3：联通）',
  `valid_cycle` int(5) DEFAULT NULL COMMENT '有效期周期',
  `valid_cycle_unit` tinyint(4) DEFAULT NULL COMMENT '有效期周期单位 （0：天 /1：月）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='服务商流量套歺';

-- ----------------------------
-- Records of flowmgn_sp_flowpackage
-- ----------------------------
INSERT INTO `flowmgn_sp_flowpackage` VALUES ('11', '3', '111', '联通物联卡2GB/年', '2G', '1', '0', '57567', '12.56', '0', '1', '127', '127', '12', '1', '2017-04-11 19:39:53', '2017-04-11 19:39:58', '0', 'hghg');
INSERT INTO `flowmgn_sp_flowpackage` VALUES ('12', '3', '112', '联通物联卡120M/年', '120', '2', '0', '465345', '360.00', '0', '1', '127', '127', '12', '1', '2017-04-13 10:38:41', '2017-04-13 10:39:01', '0', 'admin');
INSERT INTO `flowmgn_sp_flowpackage` VALUES ('13', '3', '113', '联通物联卡2GB/6个月(后视镜)', '2G/6', '3', '0', '423453', '180.00', '0', '1', '127', '127', '6', '1', '2017-04-13 10:38:54', '2017-04-13 10:39:06', '0', 'admin');
INSERT INTO `flowmgn_sp_flowpackage` VALUES ('14', '3', '114', '联通物联网卡不限流量/年', '一年不限', '2', '0', '123456', '360.00', '0', '1', '127', '127', '12', '1', '2017-04-13 11:40:53', '2017-04-13 11:40:56', '0', 'admin');
INSERT INTO `flowmgn_sp_flowpackage` VALUES ('15', '3', '115', '联通物联网卡流量叠加包', '500M', '3', '0', '流量叠加包', '50.00', '0', '1', '127', '127', '1', '1', '2017-05-03 18:19:41', '2017-05-03 18:19:45', '0', 'admin');
INSERT INTO `flowmgn_sp_flowpackage` VALUES ('16', '3', '116', '联通物联网月付套餐1G/月', '1G/月', '2', '0', '月付流量套餐', '360.00', '0', '1', '127', '127', '12', '1', '2017-05-03 18:49:13', '2017-05-03 18:49:13', '0', 'admin');
INSERT INTO `flowmgn_sp_flowpackage` VALUES ('17', '4', '117', '联通流量卡12G/年', '12G/年', '2', '0', '总流量', '0.01', '0', '1', '127', '127', '12', '1', '2017-05-09 13:53:12', '2017-05-03 18:49:13', '0', 'admin');
INSERT INTO `flowmgn_sp_flowpackage` VALUES ('18', '4', '118', '联通流量三个月3G', '3G/三个月', '2', '0', '总流量', '0.01', '0', '1', '127', '127', '3', '1', '2017-05-03 18:49:13', '2017-05-03 18:49:13', '0', 'admin');
INSERT INTO `flowmgn_sp_flowpackage` VALUES ('19', '4', '10000', '联通流量卡12G/年-基础套餐', '12G/年', '1', '0', '总流量', '0.01', '0', '1', '127', '127', '12', '1', '2017-05-03 18:49:13', '2017-05-03 18:49:13', '0', 'admin');
INSERT INTO `flowmgn_sp_flowpackage` VALUES ('20', '4', '20000', '联通流量卡三个月3G-基础套餐', '3G/三个月', '2', '0', '总流量', '0.01', '0', '1', '127', '127', '3', '1', '2017-05-03 18:49:13', '2017-05-03 18:49:13', '0', 'admin');

-- ----------------------------
-- Table structure for flowmgn_sp_flowpackage_list
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_sp_flowpackage_list`;
CREATE TABLE `flowmgn_sp_flowpackage_list` (
  `flowlist_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列ID',
  `package_id` int(10) DEFAULT NULL COMMENT '套餐ID',
  `consume_order` tinyint(4) DEFAULT NULL COMMENT '流量消耗次序（0：不分）',
  `flowserv_id` int(10) DEFAULT NULL COMMENT '流量服务ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`flowlist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='服务商流量套歺';

-- ----------------------------
-- Records of flowmgn_sp_flowpackage_list
-- ----------------------------
INSERT INTO `flowmgn_sp_flowpackage_list` VALUES ('1', '11', '0', '111', '2017-04-13 11:07:31', '2017-04-13 11:07:31', '2', 'jim');
INSERT INTO `flowmgn_sp_flowpackage_list` VALUES ('2', '12', '0', '112', '2017-04-13 11:07:31', '2017-04-13 11:07:31', '3', '121');
INSERT INTO `flowmgn_sp_flowpackage_list` VALUES ('3', '13', '0', '113', '2017-04-13 11:07:31', '2017-04-13 11:07:31', '4', '34343');
INSERT INTO `flowmgn_sp_flowpackage_list` VALUES ('4', '14', '0', '114', '2017-04-13 11:41:41', '2017-04-13 11:41:45', '1', 'admin');
INSERT INTO `flowmgn_sp_flowpackage_list` VALUES ('5', '15', '0', '115', '2017-05-03 18:20:35', '2017-05-03 18:20:40', '1', 'admin');
INSERT INTO `flowmgn_sp_flowpackage_list` VALUES ('6', '16', '0', '116', '2017-05-03 18:47:33', '2017-05-09 13:58:51', '1', 'admin');
INSERT INTO `flowmgn_sp_flowpackage_list` VALUES ('7', '17', '0', '117', '2017-05-09 14:15:58', '2017-05-09 14:16:03', '1', 'admin');
INSERT INTO `flowmgn_sp_flowpackage_list` VALUES ('8', '18', '0', '118', '2017-05-09 14:16:03', '2017-05-09 14:16:03', '1', 'admin');
INSERT INTO `flowmgn_sp_flowpackage_list` VALUES ('9', '19', '0', '119', '2017-05-09 14:16:03', '2017-05-09 14:16:03', '1', 'admin');
INSERT INTO `flowmgn_sp_flowpackage_list` VALUES ('10', '20', '0', '120', '2017-05-09 15:15:15', '2017-05-09 15:15:15', '1', 'admin');

-- ----------------------------
-- Table structure for flowmgn_sp_flowservice
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_sp_flowservice`;
CREATE TABLE `flowmgn_sp_flowservice` (
  `flowserv_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流量服务包序列ID',
  `flowserv_code` int(10) DEFAULT NULL COMMENT '流量服务包编号',
  `flowserv_name` varchar(128) NOT NULL COMMENT '流量服务包名称',
  `flowserv_alias` varchar(64) DEFAULT NULL COMMENT '流量包别名',
  `flowserv_category` tinyint(4) NOT NULL DEFAULT '0' COMMENT '流量服务包分类(分类计费)：0=基础套餐/1=增值套餐',
  `flowserv_desc` varchar(256) DEFAULT NULL COMMENT '流量服务描述',
  `is_unlimit_flow` tinyint(1) DEFAULT NULL COMMENT '是否无限流量（0：有限流量 1：无限流量）',
  `flowserv_type` tinyint(1) DEFAULT NULL COMMENT '流量服务类型（0：总流量 1：月付流量 2：其他）',
  `total_flow` float(12,2) DEFAULT '0.00' COMMENT '流量服务包总流量',
  `per_cycle_flow` float(12,2) DEFAULT NULL COMMENT '每期流量',
  `flow_unit` char(1) DEFAULT NULL COMMENT '流量服务包单位（G/M）',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '流量服务包状态（1：上架 2：下架)',
  `charge_mode` tinyint(4) NOT NULL DEFAULT '0' COMMENT '计费方式:(0：天/ 1：月 /2：年）',
  `charge_cycle` tinyint(4) DEFAULT NULL COMMENT '计费周期',
  `is_month_clean` tinyint(4) DEFAULT NULL COMMENT '是否月底清零（0：不清零 1：清零）',
  `is_now_apply` tinyint(4) DEFAULT NULL COMMENT '是否当月生效（0：下期生效 1：立即生效）',
  `flowserv_pay_date` tinyint(4) DEFAULT NULL COMMENT '月付流量月付日期（1-31，默认每月1号）',
  `flowserv_endtime` datetime DEFAULT NULL COMMENT '流量服务包失效时间',
  `over_flow_op` tinyint(4) DEFAULT NULL COMMENT '流量使用完操作 （0：维持现状 1：停卡 2：变更通讯计划）',
  `over_flow_access_id` int(10) DEFAULT NULL COMMENT '流量超出时变更通讯计划(0:表示不处理）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`flowserv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COMMENT='服务商流量服务包';

-- ----------------------------
-- Records of flowmgn_sp_flowservice
-- ----------------------------
INSERT INTO `flowmgn_sp_flowservice` VALUES ('111', '10011', '联通物联网卡2G/年', '2G一年', '0', '2G一年', '0', '0', '2048.00', '2048.00', 'M', '1', '2', '1', '0', '1', '1', '2019-04-13 11:13:58', '0', '0', '2017-04-13 11:14:22', '2017-04-13 11:14:37', '1', 'admin');
INSERT INTO `flowmgn_sp_flowservice` VALUES ('112', '10012', '联通物联网卡120M/年', '120M一年', '0', '120M一年', '0', '0', '120.00', '120.00', 'M', '1', '2', '1', '0', '1', '1', '2019-04-13 11:16:09', '0', '0', '2017-04-13 11:16:18', '2017-04-13 11:16:21', '1', 'admin');
INSERT INTO `flowmgn_sp_flowservice` VALUES ('113', '10013', '物联网卡2G/6月', '2G半年', '0', '2G半年', '0', '1', '2.00', '2.00', 'G', '1', '1', '6', '1', '1', '1', '2019-04-13 11:19:13', '0', '0', '2017-04-13 11:19:24', '2017-04-13 11:19:27', '1', 'admin');
INSERT INTO `flowmgn_sp_flowservice` VALUES ('114', '10014', '联通不限一年', '不限一年', '0', '不限一年', '1', '0', '9999.99', '9999.99', 'G', '1', '2', '1', '0', '1', '1', '2019-04-13 11:43:36', '0', '0', '2017-04-13 11:43:48', '2017-04-13 11:43:51', '1', 'admin');
INSERT INTO `flowmgn_sp_flowservice` VALUES ('115', '10015', '联通流量叠加包500M', '流量叠加包', '0', '500M', '0', '0', '500.00', '500.00', 'M', '1', '1', '1', '1', '1', '1', '2018-05-03 18:22:27', '0', '0', '2017-05-03 18:22:46', '2017-05-03 18:22:51', '1', 'admin');
INSERT INTO `flowmgn_sp_flowservice` VALUES ('116', '10016', '联通月付套餐1G/月', '1G/月', '0', '1G/月', '0', '1', '12.00', '12.00', 'G', '1', '1', '12', '1', '1', '1', '2018-05-03 18:39:29', '0', '0', '2017-05-03 18:39:46', '2017-05-03 18:39:49', '1', 'admin');
INSERT INTO `flowmgn_sp_flowservice` VALUES ('117', '10017', '联通流量卡12G/年', '12G/年', '0', '12G/年', '0', '0', '12.00', '12.00', 'G', '1', '1', '12', '0', '0', '1', '2018-05-09 14:07:52', '1', '0', '2017-05-09 14:08:54', '2017-05-09 14:08:56', '1', 'admin');
INSERT INTO `flowmgn_sp_flowservice` VALUES ('118', '10018', '联通流量卡3G/三个月', '3G/三个月', '0', '3G三个月', '0', '0', '3.00', '3.00', 'G', '1', '1', '3', '0', '0', '1', '2018-05-09 14:11:12', '1', '0', '2017-05-09 14:11:27', '2017-05-09 14:11:30', '1', 'admin');
INSERT INTO `flowmgn_sp_flowservice` VALUES ('119', '10019', '联通流量卡12G/年-基础套餐', '12G/年', '0', '12G/年', '0', '0', '12.00', '12.00', 'G', '1', '1', '12', '0', '0', '1', '2018-05-09 14:13:25', '1', '0', '2017-05-09 14:13:32', '2017-05-09 14:13:38', '1', 'admin');
INSERT INTO `flowmgn_sp_flowservice` VALUES ('120', '10020', '联通流量卡3G/三个月-基础套餐', '3G/三个月', '0', '3G三个月', '0', '0', '3.00', '3.00', 'G', '1', '1', '3', '0', '0', '1', '2018-05-09 14:15:19', '1', '0', '2017-05-09 14:15:32', '2017-05-09 14:15:36', '1', 'admin');

-- ----------------------------
-- Table structure for flowmgn_statistic
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_statistic`;
CREATE TABLE `flowmgn_statistic` (
  `statistic_key` varchar(64) NOT NULL COMMENT '统计key',
  `statistic_value` varchar(255) NOT NULL COMMENT '统计值',
  `statistic_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '统计类型:0=流量池的统计',
  `possessor_id` int(10) NOT NULL DEFAULT '0' COMMENT '第属于某个ID',
  `possessor_name` varchar(128) NOT NULL COMMENT '第属于名称',
  KEY `UK_cs_flowmgn_statistic` (`statistic_key`,`possessor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报表统计';

-- ----------------------------
-- Records of flowmgn_statistic
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_sub_flowaccount
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_sub_flowaccount`;
CREATE TABLE `flowmgn_sub_flowaccount` (
  `subac_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `card_id` int(10) DEFAULT NULL COMMENT '卡ID',
  `flowserv_id` int(10) NOT NULL COMMENT '流量服务包序列ID',
  `package_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '服务套餐类型:(1:初始套餐 2:续约套餐 3:续约流量包)',
  `prev_balance` float(12,2) DEFAULT NULL COMMENT '前一期结余流量',
  `is_unlimit_flow` tinyint(1) DEFAULT NULL COMMENT '是否无限流量（0：有限流量 1：无限流量）',
  `tota_sublflow` float(12,2) DEFAULT NULL COMMENT '分类流量帐户总流量',
  `used_subflow` float(12,2) DEFAULT NULL COMMENT '分类帐户消耗流量',
  `status` tinyint(4) DEFAULT NULL COMMENT '帐户状态 (0:未启用 1:启用/2:停用/3:失效 ) ',
  `flow_unit` char(1) DEFAULT 'M' COMMENT '流量服务包单位（G/M）',
  `consume_order` tinyint(4) DEFAULT NULL COMMENT '流量消耗顺序（由小到大优先消耗）',
  `remain_subflow` float(12,2) DEFAULT NULL COMMENT '剩余分类流量',
  `flowserv_begintime` datetime DEFAULT NULL COMMENT '流量服务包开始使用时间',
  `flowserv_endtime` datetime DEFAULT NULL COMMENT '流量服务包结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` int(10) NOT NULL COMMENT '最后操作人ID',
  `last_operator_name` varchar(64) NOT NULL COMMENT '最后操作人名称',
  PRIMARY KEY (`subac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28483 DEFAULT CHARSET=utf8 COMMENT='用户流量帐户分类使用明细(以流量包为flowserv_id为单位）';

-- ----------------------------
-- Records of flowmgn_sub_flowaccount
-- ----------------------------
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('529', '3', '113', '64', '0.00', '0', '2048.00', '423.85', '1', '', '-1', '1624.15', '2017-04-26 12:50:02', '2017-06-01 00:00:00', '2017-05-10 11:33:55', '2017-06-06 00:00:05', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('530', '1', '111', '4', '0.00', '0', '2048.00', '0.00', '1', '', '0', '2048.00', '2017-04-28 10:28:20', '2018-04-29 00:00:00', '2017-05-24 16:32:16', '2017-05-24 16:32:16', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('531', '2', '112', '127', '0.00', '0', '120.00', '0.00', '1', '', '0', '120.00', '2017-04-28 10:28:20', '2018-04-29 00:00:00', '2017-05-08 18:03:14', '2017-05-08 18:03:14', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('532', '1', '113', '38', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1', '2048.00', '2017-04-28 11:24:35', '2017-06-01 00:00:00', '2017-05-24 16:32:16', '2017-05-24 16:32:16', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('533', '1', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0', '120.00', '2017-05-02 10:55:02', '2019-01-01 08:00:00', '2017-05-24 16:32:16', '2017-05-24 16:32:16', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('534', '1', '111', '5', '0.00', '0', '2048.00', '0.00', '1', 'M', '0', '2048.00', '2017-04-28 10:28:20', '2018-04-29 00:00:00', '2017-05-24 16:32:16', '2017-05-24 16:32:16', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('535', '1', '113', '5', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1', '2048.00', '2017-04-28 11:24:35', '2017-06-01 00:00:00', '2017-05-24 16:32:16', '2017-05-24 16:32:16', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('543', '2', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1', '2048.00', '2017-05-03 18:14:04', '2017-07-01 00:00:00', '2017-05-08 18:03:14', '2017-05-08 18:03:14', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('544', '2', '112', '5', '0.00', '0', '120.00', '0.00', '1', 'M', '0', '120.00', '2017-04-28 10:28:20', '2018-04-29 00:00:00', '2017-05-08 18:03:14', '2017-05-08 18:03:14', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('546', '2', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1', '2048.00', '2017-05-04 15:04:42', '2017-07-01 00:00:00', '2017-05-08 18:03:14', '2017-05-08 18:03:14', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('547', '2', '112', '5', '0.00', '0', '120.00', '0.00', '1', 'M', '0', '120.00', '2017-04-28 10:28:20', '2018-04-29 00:00:00', '2017-05-08 18:03:14', '2017-05-08 18:03:14', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('548', '2', '113', '5', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1', '2048.00', '2017-05-03 18:14:04', '2017-07-01 00:00:00', '2017-05-08 18:03:14', '2017-05-08 18:03:14', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('549', '2', '112', '5', '0.00', '0', '120.00', '0.00', '1', 'M', '0', '120.00', '2017-04-28 10:28:20', '2018-04-29 00:00:00', '2017-05-08 18:03:14', '2017-05-08 18:03:14', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('552', '1', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0', '120.00', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '2017-05-24 16:32:16', '2017-05-24 16:32:16', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('553', '2', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0', '120.00', '2017-05-08 18:03:14', '2019-04-29 00:00:00', '2017-05-08 18:03:14', '2017-05-08 18:03:14', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('556', '1', '115', '3', '0.00', '0', '500.00', '0.00', '1', 'M', '-1', '500.00', '2017-05-10 10:28:46', '2019-10-29 00:00:00', '2017-05-24 16:32:16', '2017-05-24 16:32:16', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('557', '3', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1', '2048.00', '2017-05-10 11:33:56', '2017-07-11 00:00:00', '2017-05-10 11:33:55', '2017-05-10 11:33:55', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('558', '3', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1', '2048.00', '2017-05-10 11:33:56', '2017-07-11 00:00:00', '2017-05-10 11:33:55', '2017-05-10 11:33:55', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('560', '26', '119', '1', '0.00', '0', '12288.00', '198.81', '1', 'M', '0', '12089.20', '2017-05-10 14:04:14', '2020-08-10 23:59:59', '2017-06-11 00:10:31', '2017-06-14 00:00:07', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('561', '15', '111', '1', '0.00', '0', '2048.00', '0.00', '3', 'M', '0', '2048.00', '2017-05-10 15:03:43', '2017-06-08 16:16:22', '2017-06-08 16:16:22', '2017-06-08 16:16:22', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('562', '28', '116', '2', '0.00', '0', '12288.00', '2103.80', '1', 'M', '0', '10184.20', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-05-10 15:03:43', '2017-05-11 00:00:04', '0', 'admin');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('563', '29', '116', '2', '0.00', '0', '12288.00', '103.63', '1', 'M', '0', '12184.40', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-05-10 15:03:43', '2017-05-13 00:00:18', '0', 'admin');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('564', '30', '111', '1', '0.00', '0', '2048.00', '0.00', '1', 'M', '0', '2048.00', '2017-05-10 15:03:43', '2021-05-10 23:59:59', '2017-06-08 17:27:42', '2017-06-08 17:27:42', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('565', '31', '111', '1', '0.00', '0', '2048.00', '465.48', '1', 'M', '0', '1582.52', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-05-10 15:03:43', '2017-05-27 00:00:03', '0', 'admin');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('567', '26', '118', '2', '0.00', '0', '3072.00', '0.00', '1', 'M', '0', '3072.00', '2017-05-10 16:03:58', '2020-08-10 23:59:59', '2017-06-11 00:10:31', '2017-06-11 00:10:31', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('568', '26', '117', '2', '0.00', '0', '12288.00', '0.00', '1', 'M', '0', '12288.00', '2017-05-10 18:15:23', '2020-08-10 23:59:59', '2017-06-11 00:10:31', '2017-06-11 00:10:31', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('584', '34', '111', '1', '0.00', '0', '2048.00', '1629.09', '1', 'M', '0', '418.91', '2017-05-12 18:44:57', '2019-05-12 23:59:59', '2017-06-12 17:13:56', '2017-06-12 17:13:56', '0', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('1853', '19', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1', '2048.00', '2017-05-16 10:36:14', '2017-07-16 23:59:59', '2017-05-16 10:36:14', '2017-05-16 10:36:15', '0', 'admin');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('3077', '30', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0', '120.00', '2017-05-18 13:56:03', '2021-05-10 23:59:59', '2017-06-08 17:27:42', '2017-06-08 17:27:42', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('3105', '33', '120', '1', '0.00', '0', '3072.00', '373.59', '1', 'M', '0', '2698.41', '2017-05-18 14:38:35', '2017-08-18 23:59:59', '2017-06-19 00:02:08', '2017-06-19 00:02:08', '0', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('8272', '1', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1', '2048.00', '2017-05-24 16:32:16', '2017-07-24 23:59:59', '2017-05-24 16:32:16', '2017-05-24 16:32:16', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('11078', '27', '120', '1', '0.00', '0', '3072.00', '0.00', '1', 'M', '0', '3072.00', '2017-05-28 00:00:02', '2017-08-27 23:59:59', '2017-05-28 00:00:02', '2017-06-15 00:00:16', '0', 'admin');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('18366', '26', '117', '2', '0.00', '0', '12288.00', '0.00', '1', 'M', '0', '12288.00', '2017-06-05 14:19:44', '2020-08-10 23:59:59', '2017-06-11 00:10:31', '2017-06-11 00:10:31', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('18418', '18', '112', '2', '0.00', '0', '120.00', '83.40', '1', 'M', '0', '36.60', '2017-06-05 15:46:09', '2020-05-09 23:59:59', '2017-06-05 16:06:10', '2017-06-20 00:00:11', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('18431', '18', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0', '120.00', '2017-06-05 16:06:10', '2020-05-09 23:59:59', '2017-06-05 16:06:10', '2017-06-05 16:06:10', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('18450', '15', '112', '2', '0.00', '0', '120.00', '0.00', '3', 'M', '0', '120.00', '2017-06-05 16:36:59', '2017-06-08 16:16:22', '2017-06-08 16:16:22', '2017-06-08 16:16:22', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('18454', '15', '115', '3', '0.00', '0', '500.00', '0.00', '3', 'M', '-1', '500.00', '2017-06-05 16:37:09', '2017-06-08 16:16:22', '2017-06-08 16:16:22', '2017-06-08 16:16:22', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('18470', '30', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0', '120.00', '2017-06-05 17:07:29', '2021-05-10 23:59:59', '2017-06-08 17:27:42', '2017-06-08 17:27:42', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('18492', '30', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1', '2048.00', '2017-06-05 17:38:09', '2021-05-10 23:59:59', '2017-06-08 17:27:42', '2017-06-08 17:27:42', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('18499', '15', '115', '3', '0.00', '0', '500.00', '0.00', '3', 'M', '-1', '500.00', '2017-06-05 17:48:19', '2017-06-08 16:16:22', '2017-06-08 16:16:22', '2017-06-08 16:16:22', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('18506', '30', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0', '120.00', '2017-06-05 18:03:24', '2021-05-10 23:59:59', '2017-06-08 17:27:42', '2017-06-08 17:27:42', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('19914', '30', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1', '2048.00', '2017-06-07 09:47:30', '2017-08-07 23:59:59', '2017-06-08 17:27:42', '2017-06-08 17:27:42', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('20986', '15', '114', '2', '0.00', '1', '10240000.00', '0.00', '1', 'M', '0', '10240000.00', '2017-06-08 16:16:22', '2018-06-08 23:59:59', '2017-06-08 16:16:32', '2017-06-08 16:16:32', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('20990', '15', '115', '3', '0.00', '0', '500.00', '0.00', '1', 'M', '-1', '500.00', '2017-06-08 16:16:32', '2018-06-08 23:59:59', '2017-06-08 16:16:32', '2017-06-08 16:16:32', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('20991', '30', '115', '3', '0.00', '0', '500.00', '0.00', '1', 'M', '-1', '500.00', '2017-06-08 16:16:32', '2021-05-10 23:59:59', '2017-06-08 17:27:42', '2017-06-08 17:27:42', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('21034', '30', '113', '3', '0.00', '0', '2048.00', '0.00', '1', 'M', '-1', '2048.00', '2017-06-08 17:27:42', '2017-08-08 23:59:59', '2017-06-08 17:27:42', '2017-06-08 17:27:42', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('22961', '26', '119', '1', '0.00', '0', '12288.00', '0.00', '1', 'M', '0', '12288.00', '2017-06-11 00:10:32', '2020-08-10 23:59:59', '2017-06-11 00:10:31', '2017-06-11 00:10:31', '110', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('24411', '34', '112', '2', '0.00', '0', '120.00', '0.00', '1', 'M', '0', '120.00', '2017-06-12 17:13:56', '2019-05-12 23:59:59', '2017-06-12 17:13:56', '2017-06-12 17:13:56', '0', 'flowmgrsvr');
INSERT INTO `flowmgn_sub_flowaccount` VALUES ('27577', '33', '120', '1', '0.00', '0', '3072.00', '0.00', '1', 'M', '0', '3072.00', '2017-06-19 00:02:08', '2017-08-18 23:59:59', '2017-06-19 00:02:08', '2017-06-19 00:02:08', '0', 'flowmgrsvr');

-- ----------------------------
-- Table structure for flowmgn_system_optlog
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_system_optlog`;
CREATE TABLE `flowmgn_system_optlog` (
  `opt_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '登录Id',
  `jsession` varchar(64) DEFAULT NULL COMMENT '登录KEY',
  `opt_account` varchar(24) DEFAULT NULL COMMENT '操作账号',
  `opt_name` varchar(24) DEFAULT NULL COMMENT '操作人',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `opt_ip` varchar(24) DEFAULT NULL COMMENT '登录IP',
  `opt_desc` varchar(256) DEFAULT NULL COMMENT '登录描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`opt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统操作日志';

-- ----------------------------
-- Records of flowmgn_system_optlog
-- ----------------------------

-- ----------------------------
-- Table structure for flowmgn_system_setting
-- ----------------------------
DROP TABLE IF EXISTS `flowmgn_system_setting`;
CREATE TABLE `flowmgn_system_setting` (
  `setting_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `setting_value` varchar(100) DEFAULT NULL COMMENT '流量阀值',
  `setting_type` tinyint(1) DEFAULT NULL COMMENT '设置类型（1：停卡）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_operator_name` varchar(64) DEFAULT NULL COMMENT '最后操作人',
  `last_operator_id` int(10) DEFAULT NULL COMMENT '最后操作人ID',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统设置表';

-- ----------------------------
-- Records of flowmgn_system_setting
-- ----------------------------

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `flowpool_id` int(11) DEFAULT NULL,
  `postage_id` int(11) DEFAULT NULL,
  `plan_flow` int(11) DEFAULT NULL,
  `c_begin` int(20) NOT NULL,
  `c_end` int(20) NOT NULL,
  `p_begin` int(20) NOT NULL,
  `p_end` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '1', '100', '1492161861', '1492161865', '1490544000', '1493222399');
INSERT INTO `test` VALUES ('1', '2', '200', '1491380612', '1496219017', '1490544000', '1493222399');
INSERT INTO `test` VALUES ('1', '3', '300', '1491380612', '1496219017', '1490544000', '1493222399');
INSERT INTO `test` VALUES ('1', '1', '200', '10', '11', '12', '13');
INSERT INTO `test` VALUES ('1', '1', '300', '10', '15', '12', '13');
INSERT INTO `test` VALUES ('1', '1', '200', '19', '16', '12', '13');
INSERT INTO `test` VALUES ('1', '2', '300', '18', '15', '12', '13');

-- ----------------------------
-- Table structure for tt
-- ----------------------------
DROP TABLE IF EXISTS `tt`;
CREATE TABLE `tt` (
  `flowpool_id` int(10) NOT NULL DEFAULT '0' COMMENT '流量池ID',
  `postage_id` int(10) DEFAULT '0' COMMENT '资费计划ID（运营商侧）',
  `pay_mode` tinyint(4) NOT NULL COMMENT '付款方式：0=预付-灵活共享池/1=后付',
  `plan_flow` int(10) NOT NULL COMMENT '计划内流量(每月支付流量)',
  `balance_day` tinyint(4) DEFAULT NULL COMMENT '运营商每月的出帐日(0:自然月 1-28指定日期出帐）',
  `card_id` int(10) NOT NULL DEFAULT '0' COMMENT '流量卡序列ID',
  `active_time` datetime DEFAULT NULL COMMENT '运营商激活日期',
  `sp_id` int(10) DEFAULT '0' COMMENT '卡发货给服务商ID',
  `status` tinyint(4) DEFAULT '0' COMMENT '卡状态 (0=可测试/1=库存卡/3=可激活/4=已激活/5=已停卡/6=已销卡)',
  `status_change_time` datetime DEFAULT NULL COMMENT '卡状态变更时间',
  `last_active_time` datetime DEFAULT NULL COMMENT '最后激活状态更新时间',
  `package_status` tinyint(4) DEFAULT NULL COMMENT '套餐状态（0：库存/1:已激活2：已过期）',
  `package_begintime` datetime DEFAULT NULL COMMENT '服务商套餐生效时间',
  `package_endtime` datetime DEFAULT NULL COMMENT '服务商套餐结束时间',
  `out_stock_time` datetime DEFAULT NULL COMMENT '卡出库时间',
  `op_usedflow` float(12,2) DEFAULT '0.00' COMMENT '运营商侧月流量消耗',
  `card_begintime` bigint(10) DEFAULT NULL,
  `card_endtime` bigint(10) DEFAULT NULL,
  `devote_flow` decimal(65,30) DEFAULT NULL,
  `devote_type` int(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tt
-- ----------------------------
INSERT INTO `tt` VALUES ('1', '1', '0', '100', '26', '1', '2016-03-21 17:28:11', '19180009', '4', '2017-05-15 13:54:07', '2017-05-15 13:54:07', '1', '2017-05-08 18:03:14', '2019-10-29 00:00:00', '2017-04-10 13:55:10', '0.00', '1492238178', '1523342178', '99.999961416666666666000000000000', '1');
INSERT INTO `tt` VALUES ('1', '1', '0', '100', '26', '2', '2017-04-10 13:55:10', '19180009', '1', '2017-04-10 13:55:10', null, '1', '2017-05-08 18:03:14', '2019-04-29 00:00:00', '2017-04-10 13:55:10', '0.00', '1491803710', '1523339710', '99.999961416666666666000000000000', '1');
INSERT INTO `tt` VALUES ('1', '1', '0', '100', '26', '3', '2017-02-14 14:23:09', '19180009', '4', '2017-05-10 00:00:01', '2017-05-10 00:00:01', '1', '2017-04-26 12:50:02', '2017-10-27 00:00:00', '2017-04-10 13:55:10', '138.04', '1487053389', '1518157389', '99.999961416666666666000000000000', '1');
INSERT INTO `tt` VALUES ('1', '1', '0', '100', '26', '15', '2017-04-10 13:55:10', '19180009', '4', '2017-05-10 15:03:44', '2017-05-10 15:03:44', '1', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-04-10 13:55:10', '0.00', '1491803710', '1523339710', '99.999961416666666666000000000000', '1');
INSERT INTO `tt` VALUES ('1', '1', '0', '100', '26', '28', '2017-04-10 13:55:10', '19180009', '5', '2017-05-11 15:09:55', '2017-05-10 15:03:49', '1', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-04-10 13:55:10', '1051.90', '1491803710', '1523339710', '99.999961416666666666000000000000', '1');
INSERT INTO `tt` VALUES ('1', '1', '0', '100', '26', '29', '2017-04-10 13:55:10', '19180009', '4', '2017-05-10 15:03:49', '2017-05-10 15:03:49', '1', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-04-10 13:55:10', '103.63', '1491803710', '1523339710', '99.999961416666666666000000000000', '1');
INSERT INTO `tt` VALUES ('1', '1', '0', '100', '26', '31', '2017-04-10 13:55:10', '19180009', '4', '2017-05-10 15:03:47', '2017-05-10 15:03:47', '1', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-04-10 13:55:10', '146.54', '1491803710', '1523339710', '99.999961416666666666000000000000', '1');
INSERT INTO `tt` VALUES ('1', '1', '0', '100', '26', '32', '2017-04-10 13:55:10', '1000123', '4', '2017-05-15 14:55:09', '2017-05-15 14:55:09', '1', '2017-05-10 15:03:43', '2018-05-11 00:00:00', '2017-04-10 13:55:10', '337.05', '1491803710', '1523339710', '99.999961416666666666000000000000', '1');
INSERT INTO `tt` VALUES ('1', '1', '0', '100', '26', '34', '2016-11-18 22:06:27', '0', '4', '2017-05-12 18:13:10', '2017-05-12 18:13:10', '1', '2017-05-12 18:44:57', '2018-05-12 23:59:59', '2017-04-10 13:55:10', '1188.39', '1479477987', '1510581987', '99.999961416666666666000000000000', '1');

-- ----------------------------
-- Table structure for wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `wechat_user`;
CREATE TABLE `wechat_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `merchant_id` varchar(128) NOT NULL COMMENT '商户号',
  `wx_no` varchar(128) NOT NULL COMMENT '微信号',
  `wx_name` varchar(128) DEFAULT NULL COMMENT '微信名',
  `logo` varchar(512) DEFAULT NULL COMMENT '头像',
  `address` varchar(256) DEFAULT NULL COMMENT '地区',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(24) DEFAULT NULL COMMENT '手机号码',
  `sex` int(11) DEFAULT NULL COMMENT '性别0男，1女',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '关注状态0,未关注，1已经关注',
  `latitude` varchar(24) DEFAULT NULL COMMENT '地理位置纬度',
  `longitude` varchar(24) DEFAULT NULL COMMENT '地理位置经度',
  `precisionx` varchar(24) DEFAULT NULL COMMENT '地理位置精度',
  PRIMARY KEY (`id`),
  KEY `wx_no_index` (`wx_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10000029 DEFAULT CHARSET=utf8 COMMENT='微信用户表';

-- ----------------------------
-- Records of wechat_user
-- ----------------------------
INSERT INTO `wechat_user` VALUES ('9999999', '19180001', 'ore.framework.test', null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000000', '19180001', 'oJGDQwXBlzQjlpHI7udoavluSYS0', null, null, null, null, null, null, null, '2017-04-26 11:40:38', '0', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000001', '19180001', 'oJGDQwQG0haUW4gJPSICAKAjGKlg', null, null, null, null, null, null, null, '2017-04-26 11:18:26', '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000002', '19180001', 'oj1nYs1z7Kk4bD2hiN4_wxmsLJUY', null, null, null, null, null, null, null, '2017-05-09 18:11:09', '0', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000003', '19180001', 'oj1nYs8s3DJBL8nsgK004FOCLHyc', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000004', '19180001', 'oj1nYs4-7rdghjW-x4nFB-nrTpGk', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000005', '19180001', 'oj1nYs5q5rO4P_R4Qk2jYpccN-M0', null, null, null, null, null, null, null, '2017-05-13 20:14:30', '0', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000006', '19180001', 'oj1nYsxp-iEgSCQ-D9OwGs-tkYkw', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000007', '19180001', 'oj1nYs1WjZ6K5XfEk3eRN0XNDfOk', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000008', '19180001', 'oj1nYs_1fbuHU6ZFP96WVy0H4XB4', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000009', '19180001', 'oj1nYs21g7MenxXJKP9KPdFqBiwY', null, null, null, null, null, null, null, '2017-05-10 11:15:14', '0', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000010', '19180001', 'oj1nYs7RKCMs6EYBvZDB8r7zm24g', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000011', '19180001', 'oj1nYsxr9FmwPzXd70EbvM87U2ak', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000012', '19180001', 'oj1nYs9himO-7iRlzzsSScPhNHug', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000013', '19180001', 'oj1nYs_M-ylTwgQoerhjY9Z2KTkI', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000014', '19180001', 'oj1nYs1zPilLglt7TXoHtz_Cq5Zg', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000015', '19180001', 'oj1nYs2iI31qbEaONIaB_rbwP8p8', null, null, null, null, null, null, null, '2017-05-10 16:25:51', '0', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000016', '19180001', 'oj1nYs5dnGpTEIy7FpSEYNal4cxw', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000017', '19180001', 'oj1nYs7JIUtDGEBh1TRE5CKELNGU', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000018', '19180001', 'oj1nYszuRPx6W05l6ZCCfIBRwo_Q', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000019', '19180001', 'oj1nYs3Jg2GDEKKMDpgOpnBKT3aw', null, null, null, null, null, null, null, '2017-05-10 18:15:07', '0', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000020', '19180001', 'oj1nYs6udAbzbJR-QH1StKuDowEA', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000021', '19180001', 'oj1nYs3i2BGXbre77tqJaLq68Q-E', null, null, null, null, null, null, null, '2017-05-11 23:17:51', '0', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000022', '19180001', 'oj1nYs3D7NZplZxhLMvYlL6wUcAk', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000023', '19180001', 'oj1nYs2nQLJv9z2ozCTw9_D3-tMM', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000024', '19180001', 'o3sUl1ZMmTBuUw7NX-i2MfuIvPKo', null, null, null, null, null, null, null, '2017-05-24 16:11:15', '0', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000025', '19180001', 'o3sUl1T-UUpxuSh76lZXU3p5JCgk', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000026', '19180001', 'o3sUl1QxMtWkbGVoFnkw0rqcXGAk', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000027', '19180001', 'o3sUl1RlwVPvtRHvxr_A1aPRD0f0', null, null, null, null, null, null, null, '2017-05-25 10:02:40', '0', null, null, null);
INSERT INTO `wechat_user` VALUES ('10000028', '19180001', 'o3sUl1cbbLDRe3ykjboxyQxK_iPk', null, null, null, null, null, null, null, '2017-05-25 11:18:29', '0', null, null, null);

-- ----------------------------
-- View structure for pool_viewdata
-- ----------------------------
DROP VIEW IF EXISTS `pool_viewdata`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `pool_viewdata` AS select `pool`.`flowpool_id` AS `flowpool_id`,`card`.`postage_id` AS `postage_id`,`plan`.`pay_mode` AS `pay_mode`,`plan`.`plan_flow` AS `plan_flow`,`plan`.`balance_day` AS `balance_day`,`card`.`card_id` AS `card_id`,`card`.`active_time` AS `active_time`,`card`.`sp_id` AS `sp_id`,`card`.`status` AS `status`,`card`.`status_change_time` AS `status_change_time`,`card`.`last_active_time` AS `last_active_time`,`card`.`package_status` AS `package_status`,`card`.`package_begintime` AS `package_begintime`,`card`.`package_endtime` AS `package_endtime`,`card`.`out_stock_time` AS `out_stock_time`,`account`.`op_month_usedflow` AS `op_usedflow`,unix_timestamp(`card`.`postage_begintime`) AS `card_begintime`,unix_timestamp(`card`.`postage_endtime`) AS `card_endtime` from ((((`flowmgn_flowcard` `card` join `flowmgn_flowaccount` `account`) join `flowmgn_flowpool` `pool`) join `flowmgn_flowpool_postage` `rel`) join `flowmgn_op_postageplan` `plan`) where ((`card`.`card_id` = `account`.`card_id`) and (`pool`.`flowpool_id` = `rel`.`flowpool_id`) and (`plan`.`postage_id` = `rel`.`postage_id`) and (`card`.`postage_id` = `plan`.`postage_id`) and (`card`.`postage_begintime` is not null) and (`card`.`postage_begintime` < curdate())) ;

-- ----------------------------
-- View structure for temp_card_stat
-- ----------------------------
DROP VIEW IF EXISTS `temp_card_stat`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `temp_card_stat` AS select `b`.`card_id` AS `card_id`,`b`.`sp_id` AS `sp_id`,(case when (`a`.`used_totalflow` < 200) then 'used0to200' when (`a`.`used_totalflow` < 500) then 'used200to500' when (`a`.`used_totalflow` < 1024) then 'used500to1024' when (`a`.`used_totalflow` < 2048) then 'used1024to2048' when (`a`.`used_totalflow` < 3076) then 'used2048to3076' when (`a`.`used_totalflow` < 4096) then 'used3076to4096' when (`a`.`used_totalflow` < 6144) then 'used4096to6144' when (`a`.`used_totalflow` < 10238976) then 'used6144to9999' else 'other' end) AS `useredFlow_status`,(case when (((`a`.`remain_totalflow` * 100) / `a`.`totalflow`) < 10) then 'remaid10per' when (((`a`.`remain_totalflow` * 100) / `a`.`totalflow`) < 20) then 'remaind20per' when (((`a`.`remain_totalflow` * 100) / `a`.`totalflow`) < 30) then 'remaind30per' when (((`a`.`remain_totalflow` * 100) / `a`.`totalflow`) < 50) then 'remaind50per' when (((`a`.`remain_totalflow` * 100) / `a`.`totalflow`) < 80) then 'remaind80per' when (((`a`.`remain_totalflow` * 100) / `a`.`totalflow`) <= 100) then 'remaind100per' else 'other' end) AS `remainFlow_status`,(case when ((to_days(curdate()) - to_days(`b`.`package_begintime`)) = 1) then 'day1' when ((to_days(curdate()) - to_days(`b`.`package_begintime`)) = 2) then 'day2' when ((to_days(curdate()) - to_days(`b`.`package_begintime`)) = 3) then 'day3' when ((to_days(curdate()) - to_days(`b`.`package_begintime`)) = 4) then 'day4' when ((to_days(curdate()) - to_days(`b`.`package_begintime`)) = 5) then 'day5' when ((to_days(curdate()) - to_days(`b`.`package_begintime`)) = 6) then 'day6' when ((to_days(curdate()) - to_days(`b`.`package_begintime`)) = 7) then 'day7' else 'other' end) AS `days`,(case when (`b`.`package_status` = 0) then 'stock' when (`b`.`package_status` = 1) then 'activated' when (`b`.`package_status` = 2) then 'expired' else 'other' end) AS `package_status` from (`flowmgn_flowcard` `b` left join `flowmgn_flowaccount` `a` on((`a`.`card_id` = `b`.`card_id`))) ;

-- ----------------------------
-- Procedure structure for pro_cardstat
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_cardstat`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `pro_cardstat`()
BEGIN
  DECLARE s_time DATETIME;
  SELECT NOW() INTO s_time;
  TRUNCATE temp_card_stat;
  
  INSERT INTO temp_card_stat
  SELECT b.card_id,sp_id,
    CASE 
     WHEN used_totalflow<200 THEN 'used0to200'
     WHEN used_totalflow>=200 AND  used_totalflow<500 THEN 'used200to500'
     WHEN used_totalflow>=500 AND  used_totalflow<1024 THEN 'used500to1024'
     WHEN used_totalflow>=1024 AND  used_totalflow<2048 THEN 'used1024to2048'
     WHEN used_totalflow>=2048 AND  used_totalflow<3076 THEN 'used2048to3076'
     WHEN used_totalflow>=3076 AND  used_totalflow<4096 THEN 'used3076to4096'
     WHEN used_totalflow>=4096 AND  used_totalflow<6144 THEN 'used4096to6144'
	  WHEN used_totalflow>=6144 AND  used_totalflow<10238976 THEN 'used6144to9999'
     ELSE 'other'
    END useredFlow_status,
    CASE 
     WHEN  remain_totalflow*100/totalflow <=10 THEN 'remaid10per'
     WHEN  remain_totalflow*100/totalflow >10 AND remain_totalflow*100/totalflow <=20 THEN 'remaind20per'
     WHEN  remain_totalflow*100/totalflow >20 AND remain_totalflow*100/totalflow <=30 THEN 'remaind30per'
     WHEN  remain_totalflow*100/totalflow >30 AND remain_totalflow*100/totalflow <=50 THEN 'remaind50per'
	 WHEN  remain_totalflow*100/totalflow >50 AND remain_totalflow*100/totalflow <=80 THEN 'remaind80per'
	 WHEN  remain_totalflow*100/totalflow >80 AND remain_totalflow*100/totalflow <=100 THEN 'remaind100per'
     ELSE 'other'
    END remainFlow_status,
    CASE 
     WHEN DATEDIFF(CURRENT_DATE(),b.package_begintime)=1 THEN 'day1'
     WHEN DATEDIFF(CURRENT_DATE(),b.package_begintime)=2 THEN 'day2'
     WHEN DATEDIFF(CURRENT_DATE(),b.package_begintime)=3 THEN 'day3'
     WHEN DATEDIFF(CURRENT_DATE(),b.package_begintime)=4 THEN 'day4'
     WHEN DATEDIFF(CURRENT_DATE(),b.package_begintime)=5 THEN 'day5'
     WHEN DATEDIFF(CURRENT_DATE(),b.package_begintime)=6 THEN 'day6'
     WHEN DATEDIFF(CURRENT_DATE(),b.package_begintime)=7 THEN 'day7'
     ELSE 'other'
    END days,
    CASE 
     WHEN package_status=0 THEN 'stock'
     WHEN package_status=1 THEN 'activated'
     WHEN package_status=2 THEN 'expired'
     ELSE 'other'
    END package_status
    FROM flowmgn_flowaccount AS a
    RIGHT JOIN flowmgn_flowcard AS b ON a.card_id = b.card_id;
  
  REPLACE INTO flowmgn_sp_card_stat(stat_key,stat_value,stat_type,sp_id,create_time,update_time) 
  SELECT useredFlow_status,COUNT(useredFlow_status),0,sp_id,s_time,s_time FROM temp_card_stat WHERE useredFlow_status<> 'other' GROUP BY sp_id 
  UNION SELECT remainFlow_status,COUNT(remainFlow_status),1,sp_id,s_time,s_time FROM temp_card_stat WHERE remainFlow_status<> 'other' GROUP BY sp_id
  UNION SELECT days,COUNT(days),2,sp_id,s_time,s_time FROM temp_card_stat WHERE days<> 'other' GROUP BY sp_id
  UNION SELECT package_status,COUNT(package_status),3,sp_id,s_time,s_time FROM temp_card_stat WHERE package_status<> 'other' GROUP BY sp_id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pro_flowmgn_cardstat
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_flowmgn_cardstat`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `pro_flowmgn_cardstat`()
BEGIN
  DECLARE s_time DATETIME;
  SELECT NOW() INTO s_time;
  truncate flowmgn_sp_card_stat;
  DROP VIEW IF EXISTS temp_card_stat;
  CREATE VIEW temp_card_stat(card_id,sp_id,useredFlow_status,remainFlow_status,days,package_status)
  AS
  SELECT b.card_id,sp_id,
    CASE 
     WHEN used_totalflow<200 THEN 'used0to200'
     WHEN used_totalflow<500 THEN 'used200to500'
     WHEN used_totalflow<1024 THEN 'used500to1024'
     WHEN used_totalflow<2048 THEN 'used1024to2048'
     WHEN used_totalflow<3076 THEN 'used2048to3076'
     WHEN used_totalflow<4096 THEN 'used3076to4096'
     WHEN used_totalflow<6144 THEN 'used4096to6144'
	 WHEN used_totalflow<10238976 THEN 'used6144to9999'
     ELSE 'other'
    END useredFlow_status,
    CASE 
     WHEN  remain_totalflow*100/totalflow <10 THEN 'remaid10per'
     WHEN  remain_totalflow*100/totalflow <20 THEN 'remaind20per'
     WHEN  remain_totalflow*100/totalflow <30 THEN 'remaind30per'
     WHEN  remain_totalflow*100/totalflow <50 THEN 'remaind50per'
	 WHEN  remain_totalflow*100/totalflow <80 THEN 'remaind80per'
	 WHEN  remain_totalflow*100/totalflow <=100 THEN 'remaind100per'
     ELSE 'other'
    END remainFlow_status,
    CASE 
     WHEN DATEDIFF(CURRENT_DATE(),b.package_begintime)=1 THEN 'day1'
     WHEN DATEDIFF(CURRENT_DATE(),b.package_begintime)=2 THEN 'day2'
     WHEN DATEDIFF(CURRENT_DATE(),b.package_begintime)=3 THEN 'day3'
     WHEN DATEDIFF(CURRENT_DATE(),b.package_begintime)=4 THEN 'day4'
     WHEN DATEDIFF(CURRENT_DATE(),b.package_begintime)=5 THEN 'day5'
     WHEN DATEDIFF(CURRENT_DATE(),b.package_begintime)=6 THEN 'day6'
     WHEN DATEDIFF(CURRENT_DATE(),b.package_begintime)=7 THEN 'day7'
     ELSE 'other'
    END days,
    CASE 
     WHEN package_status=0 THEN 'stock'
     WHEN package_status=1 THEN 'activated'
     WHEN package_status=2 THEN 'expired'
     ELSE 'other'
    END package_status
    FROM flowmgn_flowaccount AS a
    RIGHT JOIN flowmgn_flowcard AS b ON a.card_id = b.card_id;
	
	
  
  REPLACE INTO flowmgn_sp_card_stat(stat_key,stat_value,stat_type,sp_id,create_time,update_time) 
  SELECT useredFlow_status,COUNT(useredFlow_status),0,sp_id,s_time,s_time FROM temp_card_stat WHERE useredFlow_status<> 'other' GROUP BY sp_id 
  UNION SELECT remainFlow_status,COUNT(remainFlow_status),1,sp_id,s_time,s_time FROM temp_card_stat WHERE remainFlow_status<> 'other' GROUP BY sp_id
  UNION SELECT days,COUNT(days),2,sp_id,s_time,s_time FROM temp_card_stat WHERE days<> 'other' GROUP BY sp_id
  UNION SELECT package_status,COUNT(package_status),3,sp_id,s_time,s_time FROM temp_card_stat WHERE package_status<> 'other' GROUP BY sp_id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pro_flowmgn_save_month_account
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_flowmgn_save_month_account`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `pro_flowmgn_save_month_account`(
	IN n_month INT,
	OUT v_result VARCHAR (10),
	OUT s_result VARCHAR (10)
)
BEGIN
	SET v_result = 0;
	SET s_result = 0;
	INSERT INTO flowmgn_month_sub_flowaccount 
	SELECT "",n_month,a.*
	FROM flowmgn_sub_flowaccount a on duplicate key update flowserv_id=values(flowserv_id),package_type=values(package_type),prev_balance=values(prev_balance),is_unlimit_flow=values(is_unlimit_flow),tota_sublflow=values(tota_sublflow),used_subflow=values(used_subflow),status=values(status),flow_unit=values(flow_unit),remain_subflow=values(remain_subflow),next_balancedate=values(next_balancedate),flowserv_begintime=values(flowserv_begintime),flowserv_endtime=values(flowserv_endtime),update_time=now();
	
	INSERT INTO flowmgn_month_flowaccount 
	SELECT "",n_month,a.*
	FROM flowmgn_flowaccount a on duplicate key update is_unlimit_flow=values(is_unlimit_flow),total_flow=values(total_flow),used_totalflow=values(used_totalflow),currmonth_usedflow=values(currmonth_usedflow),op_month_usedflow=values(op_month_usedflow),status=values(status),flow_unit=values(flow_unit),remain_totalflow=values(remain_totalflow),next_balancedate=values(next_balancedate),update_time=now();
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pro_flowpoolstat
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_flowpoolstat`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `pro_flowpoolstat`(
	IN  i_balance_days INT,
	OUT v_result VARCHAR(10)
)
BEGIN
	
	DECLARE curr_year INT ;
        DECLARE curr_month INT ;
        DECLARE prev_year INT ;
        DECLARE prev_month INT; 
        DECLARE p_begin INT;
        DECLARE p_end INT ;
        DECLARE cycle_days INT ;
        
        DECLARE balance_days INT;
        
        
        SET curr_year = YEAR(NOW());
        
        SET curr_month = MONTH(NOW());
        
        IF curr_month = 1  THEN
          SET prev_year = curr_year - 1 ;
          SET prev_month = 12;
        ELSE
          SET prev_year =  curr_year;
          SET prev_month = curr_month - 1;
        END IF; 
        
        
        SET balance_days = i_balance_days;
        
        
        SET p_begin = UNIX_TIMESTAMP(CONCAT(prev_year,"-", LPAD(prev_month, 2, '0'), '-', LPAD(balance_days+1, 2, '0'), ' 00:00:00'));
        
        SET p_end = UNIX_TIMESTAMP(CONCAT(curr_year,"-", LPAD(curr_month, 2, '0'), '-', LPAD(balance_days, 2, '0'), ' 23:59:59'));
	SET cycle_days = ( p_end - p_begin) / (24 * 3600);
	
		
	
	/****************************************************************************************
	/*
	/*     统计流量池使用情况         预付费流量池统计
	/*
	/***************************************************************************************/
	
	
	INSERT INTO flowmgn_flowpool_monthflow(flowpool_id, consume_month, currmonth_totalflow, 
		currmonth_usedflow, currmonth_remainflow, card_total, open_card, cancel_card, notopen_card, update_time) 
		
		(SELECT 	
		     pool_data.flowpool_id, 
		     CONCAT(curr_year, LPAD(curr_month, 2, '0')) AS flowpool_month, 
		     SUM(pool_data.devote_flow) AS total_flow , 
		     SUM(pool_data.op_usedflow) AS used_flow, 
		    (SUM(pool_data.devote_flow) - SUM(pool_data.op_usedflow)) AS remain_flow, 
		     COUNT(*) AS totol_card, 
		     SUM(CASE WHEN pool_data.STATUS = 4 THEN 1
			      WHEN pool_data.STATUS = 5 THEN 1 
			 ELSE 0 
		     END) 
			 AS open_card,
			 
		     SUM(CASE WHEN pool_data.STATUS = 6 THEN 1
			 ELSE 0 END) 
			 AS cancel_card,
			 
			 
		     SUM(CASE WHEN pool_data.STATUS = 0 THEN 1
			  WHEN pool_data.STATUS = 1 THEN 1 
			  WHEN pool_data.STATUS = 3 THEN 1 
			  ELSE 0 
		     END) 
			 AS notopen_card ,
			 
		     NOW() AS updatetime
					
		FROM 	
			(SELECT * FROM  
				(SELECT 
					view_data.*,  
					(CASE   
					WHEN card_begintime < p_begin AND card_endtime > p_end THEN  (cycle_days * plan_flow / 30 )     # 足月贡献  本月前开卡，本月后结卡                
					WHEN card_begintime < p_begin AND card_endtime < p_end THEN  ((card_endtime - p_begin) * plan_flow / (30 * 24 * 3600))  # 本月前开卡， 本月期间结卡
					WHEN card_begintime >= p_begin THEN ((p_end - card_begintime) * plan_flow / (30 * 24 * 3600))  #本月期间开卡
					ELSE 0
					END)
					AS devote_flow , 
					(CASE   
					WHEN card_begintime < p_begin AND card_endtime > p_end THEN  1       
					WHEN card_begintime < p_begin AND card_endtime < p_end THEN  2
					WHEN card_begintime > p_begin THEN 3
					ELSE 0 
					END)
					AS devote_type
				FROM pool_viewdata view_data WHERE view_data.balance_day = balance_days AND view_data.pay_mode = 0 ) AS vv_data ) 
			AS pool_data GROUP BY  flowpool_id)			
		
	ON DUPLICATE KEY UPDATE flowpool_id = VALUES(flowpool_id), consume_month = VALUES(consume_month),
		currmonth_totalflow = VALUES(currmonth_totalflow), 
		currmonth_usedflow = VALUES(currmonth_usedflow), 
		currmonth_remainflow = VALUES(currmonth_remainflow), 
		card_total = VALUES(card_total),
		open_card = VALUES(open_card),
		cancel_card = VALUES(cancel_card),
		notopen_card = VALUES(notopen_card),
		update_time = VALUES(update_time); 
		
		
		
	/****************************************************************************************
	/*
	/*     统计流量池使用情况         后付费流量池统计
	/*
	/***************************************************************************************/	
		
		
	INSERT INTO flowmgn_flowpool_monthflow(flowpool_id, consume_month, currmonth_totalflow, 
		currmonth_usedflow, currmonth_remainflow, card_total, open_card, cancel_card, notopen_card, update_time) 
		
		(SELECT 	
		     pool_data.flowpool_id, 
		     CONCAT(curr_year, LPAD(curr_month, 2, '0')) AS flowpool_month, 
		     SUM(pool_data.devote_flow) AS total_flow , 
		     SUM(pool_data.op_usedflow) AS used_flow, 
		    (SUM(pool_data.devote_flow) - SUM(pool_data.op_usedflow)) AS remain_flow, 
		     COUNT(*) AS totol_card, 
		     SUM(CASE WHEN pool_data.STATUS = 4 THEN 1
			      WHEN pool_data.STATUS = 5 THEN 1 
			 ELSE 0 
		     END) 
			 AS open_card,
			 
		     SUM(CASE WHEN pool_data.STATUS = 6 THEN 1
			 ELSE 0 END) 
			 AS cancel_card,
			 
			 
		     SUM(CASE WHEN pool_data.STATUS = 0 THEN 1
			  WHEN pool_data.STATUS = 1 THEN 1 
			  WHEN pool_data.STATUS = 3 THEN 1 
			  ELSE 0 
		     END) 
			 AS notopen_card ,
			 
		     NOW() AS updatetime
					
		FROM 	
			(SELECT * FROM  
				(SELECT 
					view_data.*,  
					(CASE   
					WHEN STATUS = 4 THEN  plan_flow     												# 活动卡                
					WHEN STATUS = 5 AND ((is_validity_section(balance_days, active_time, p_begin)) OR (last_active_time > p_begin)) THEN  plan_flow   		# 本月停卡或者停卡在3个月激活期
					WHEN STATUS = 6 AND ((is_validity_section(balance_days, active_time, p_begin)) OR (last_active_time > p_begin)) THEN  plan_flow
					ELSE 0
					END)
					AS devote_flow , 
					(CASE   
					WHEN STATUS = 4 THEN  1       
					WHEN  STATUS = 5 AND ((is_validity_section(balance_days, active_time, p_begin)) OR (last_active_time > p_begin)) THEN  2
					WHEN  STATUS = 6 AND ((is_validity_section(balance_days, active_time, p_begin)) OR (last_active_time > p_begin)) THEN  3
					ELSE 0 
					END)
					AS devote_type
				FROM pool_viewdata view_data WHERE view_data.balance_day = balance_days AND view_data.pay_mode = 1 ) AS vv_data ) 
			AS pool_data GROUP BY  flowpool_id)			
		ON DUPLICATE KEY UPDATE flowpool_id = VALUES(flowpool_id), consume_month = VALUES(consume_month),
			currmonth_totalflow = VALUES(currmonth_totalflow), 
			currmonth_usedflow = VALUES(currmonth_usedflow), 
			currmonth_remainflow = VALUES(currmonth_remainflow), 
			card_total = VALUES(card_total),
			open_card = VALUES(open_card),
			cancel_card = VALUES(cancel_card),
			notopen_card = VALUES(notopen_card),
			update_time = VALUES(update_time); 	
		
		
        
	/**************************************************************************
	/* 统计服务商流量池使用情况
	/**************************************************************************/
	
	INSERT INTO flowmgn_flowpool_sp_monthflow (currmonth_totalflow, currmonth_usedflow, currmonth_remainflow, 
	     flowpool_id, consume_month, sp_id, sp_month_usedflow, card_total, 
	     add_card, stock_card, open_card, cancel_card, update_time)
		(SELECT monthflow.currmonth_totalflow, monthflow.currmonth_usedflow, 
			monthflow.currmonth_remainflow, sp_monthflow.*
		FROM flowmgn_flowpool_monthflow monthflow,  
			(SELECT v_data.flowpool_id, CONCAT(curr_year, LPAD(curr_month, 2, '0')) AS flowpool_month, 
				v_data.sp_id, 
		
				SUM(v_data.op_usedflow) AS sp_month_flow,
				COUNT(*) AS card_total,
				SUM(
					CASE WHEN UNIX_TIMESTAMP(v_data.out_stock_time) > @p_begin THEN 1 ELSE 0 END) 
					AS add_card,
				SUM(CASE  WHEN v_data.package_status = 0 THEN 1
					  ELSE 0 
				     END) 
					 AS stock_card ,
				SUM(CASE  WHEN v_data.package_status = 1 THEN 1
					  ELSE 0 
				     END) 
					 AS open_card ,
				SUM(CASE  WHEN v_data.package_status = 2 THEN 1
					  ELSE 0 
				     END) 
					 AS cancel_card, 
				NOW() AS update_time 	
			FROM pool_viewdata v_data GROUP BY flowpool_id, sp_id) sp_monthflow 
		WHERE sp_monthflow.flowpool_id = monthflow.flowpool_id AND 
		sp_monthflow.flowpool_month = monthflow.consume_month)	
	ON DUPLICATE KEY UPDATE flowpool_id = VALUES(flowpool_id), consume_month = VALUES(consume_month),
		sp_id = VALUES(sp_id), 
		sp_month_usedflow = VALUES(sp_month_usedflow),
		currmonth_totalflow = VALUES(currmonth_totalflow), 
		currmonth_usedflow = VALUES(currmonth_usedflow), 
		currmonth_remainflow = VALUES(currmonth_remainflow), 
		card_total = VALUES(card_total),
		add_card = VALUES(add_card),
		stock_card = VALUES(stock_card),
		open_card = VALUES(open_card),
		cancel_card = VALUES(cancel_card),
		update_time = VALUES(update_time); 
		
		
	/****************************************************************************************************************************
	/*
	/* 记录流量池日表
	/*
	/***************************************************************************************************************************/	
        
	 INSERT INTO flowmgn_flowpool_dayflow(consume_day, flowpool_id, currmonth_totalflow, currmonth_usedflow, currmonth_remainflow, card_total, open_card, notopen_card, cancel_card, update_time) 
	    
	    ( SELECT DATE_SUB(CURDATE(), INTERVAL 1 DAY), flowpool_id, currmonth_totalflow, currmonth_usedflow, currmonth_remainflow, card_total, open_card, notopen_card, cancel_card, update_time 
	    FROM flowmgn_flowpool_monthflow WHERE consume_month = CONCAT(curr_year, LPAD(curr_month, 2, '0'))) 
	    
	    ON DUPLICATE KEY UPDATE flowpool_id = VALUES(flowpool_id), consume_day = VALUES(consume_day),
		currmonth_totalflow = VALUES(currmonth_totalflow), 
		currmonth_usedflow = VALUES(currmonth_usedflow), 
		currmonth_remainflow = VALUES(currmonth_remainflow), 
		card_total = VALUES(card_total),
		open_card = VALUES(open_card),
		cancel_card = VALUES(cancel_card),
		notopen_card = VALUES(notopen_card),
		update_time = VALUES(update_time); 
        
        
	 INSERT INTO flowmgn_flowpool_sp_dayflow(consume_day, flowpool_id, sp_id, sp_month_usedflow, currmonth_totalflow, currmonth_usedflow, currmonth_remainflow, card_total, add_card, stock_card, open_card, cancel_card, update_time) 
	    
	    (SELECT DATE_SUB(CURDATE(), INTERVAL 1 DAY), flowpool_id, sp_id, sp_month_usedflow, currmonth_totalflow, currmonth_usedflow, currmonth_remainflow, card_total, add_card, stock_card, open_card, cancel_card, update_time 
	    FROM flowmgn_flowpool_sp_monthflow WHERE consume_month = CONCAT(curr_year, LPAD(curr_month, 2, '0'))) 
	    
	 ON DUPLICATE KEY UPDATE flowpool_id = VALUES(flowpool_id), consume_day = VALUES(consume_day),
		sp_id = VALUES(sp_id), 
		sp_month_usedflow = VALUES(sp_month_usedflow),
		currmonth_totalflow = VALUES(currmonth_totalflow), 
		currmonth_usedflow = VALUES(currmonth_usedflow), 
		currmonth_remainflow = VALUES(currmonth_remainflow), 
		card_total = VALUES(card_total),
		add_card = VALUES(add_card),
		stock_card = VALUES(stock_card),
		open_card = VALUES(open_card),
		cancel_card = VALUES(cancel_card),
		update_time = VALUES(update_time); 
        
        
        
        SET v_result = '1';
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for is_validity_section
-- ----------------------------
DROP FUNCTION IF EXISTS `is_validity_section`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `is_validity_section`(balance_days INT , card_active_time DATE, package_start INT) RETURNS double
BEGIN
	DECLARE       last_date DATE ;
	DECLARE       active_year  INT ;
	DECLARE       active_month  INT ;
	DECLARE	      active_day    INT;
	
	DECLARE	      diff_days INT;
	
	SET active_year = YEAR(card_active_time);
	
	SET active_month = MONTH(card_active_time);
	
	SET active_day = DAY(card_active_time);
	
	IF active_day < balance_days THEN	
	
		SET last_date = DATE_ADD(CONCAT(active_year, '-', LPAD(active_month, 2,'0'), '-', LPAD(balance_days,2, '0'), ' 23:59:59'), INTERVAL 2 MONTH);
	ELSE
		SET last_date = DATE_ADD(CONCAT(active_year, '-', LPAD(active_month, 2,'0'), '-', LPAD(balance_days,2, '0'), ' 23:59:59'), INTERVAL 3 MONTH);
	
	END IF;
	
	SET diff_days= UNIX_TIMESTAMP(last_date) - package_start ;
	
	RETURN diff_days > 0 ;
	
    END
;;
DELIMITER ;
