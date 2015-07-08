/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : web

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2015-07-08 10:32:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_system_function`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_function`;
CREATE TABLE `t_system_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complete` tinyint(1) DEFAULT NULL,
  `complete_time` datetime DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `function_content` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `important` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_function
-- ----------------------------
INSERT INTO `t_system_function` VALUES ('3', '1', '2015-06-09 23:27:09', '2015-06-09 22:55:27', '用户信息管理(日期控件 + 实现分页功能jsptags)', '1', 'user.action', '5');
INSERT INTO `t_system_function` VALUES ('4', '1', '2015-06-09 23:27:09', '2015-06-09 23:07:57', '老师信息管理(ajax-html + ymPrompt + 实现分页功能jsptags)', '2', 'teacher.action', '5');
INSERT INTO `t_system_function` VALUES ('6', '0', null, '2015-06-09 23:08:07', '老师信息管理(easy ui实现)', '4', '', '5');
INSERT INTO `t_system_function` VALUES ('10', '0', null, '2015-06-09 23:14:56', '老师信息管理(easy ui + 封装)', '5', null, '5');
INSERT INTO `t_system_function` VALUES ('11', '0', null, '2015-06-09 23:15:08', '老师信息管理(extjs)', '6', null, '5');
INSERT INTO `t_system_function` VALUES ('12', '1', '2015-06-11 14:37:59', '2015-06-09 23:15:38', '项目加入事务管理', '7', 'page_transaction.action?result=transaction', '5');
INSERT INTO `t_system_function` VALUES ('13', '1', '2015-06-11 14:38:34', '2015-06-09 23:15:49', '项目加入pushlet', '8', 'page_pushlet.action?result=pushlet', '5');
INSERT INTO `t_system_function` VALUES ('14', '0', null, '2015-06-09 23:16:00', '项目加入自定义注解', '9', null, '5');
INSERT INTO `t_system_function` VALUES ('16', '1', '2015-06-10 07:44:03', '2015-06-10 07:43:58', '功能信息管理(ajax-html + ymPrompt + 实现分页功能jsptags)', '3', 'systemFunction.action', '10');
INSERT INTO `t_system_function` VALUES ('20', '0', null, '2015-06-11 14:54:03', 'http和https间全部和部分转换', '10', 'page_https.action?result=https', '5');
INSERT INTO `t_system_function` VALUES ('21', '0', null, '2015-07-08 10:28:12', 'ehcache使用', '11', 'cache.action', '5');
