/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : db_ssspcrud

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2020-02-17 19:43:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_department
-- ----------------------------
DROP TABLE IF EXISTS `tb_department`;
CREATE TABLE `tb_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_department
-- ----------------------------
INSERT INTO `tb_department` VALUES ('1', '开发部');
INSERT INTO `tb_department` VALUES ('2', '测试部');
INSERT INTO `tb_department` VALUES ('3', '运营部');
INSERT INTO `tb_department` VALUES ('4', '策划部');

-- ----------------------------
-- Table structure for tb_employee
-- ----------------------------
DROP TABLE IF EXISTS `tb_employee`;
CREATE TABLE `tb_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `birth` date DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qxhou5lqwdgq5d0hy435ltpyv` (`dept_id`),
  CONSTRAINT `FK_qxhou5lqwdgq5d0hy435ltpyv` FOREIGN KEY (`dept_id`) REFERENCES `tb_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_employee
-- ----------------------------
INSERT INTO `tb_employee` VALUES ('1', '1998-06-17', '2019-11-05 19:55:20', 'aa@qq.com', 'AA', '1');
INSERT INTO `tb_employee` VALUES ('2', '1995-11-05', '2019-11-13 16:49:34', 'bb@163.com', 'BB', '2');
INSERT INTO `tb_employee` VALUES ('3', '1998-11-12', '2019-11-05 16:49:37', 'cc@163.com', 'CC', '3');
INSERT INTO `tb_employee` VALUES ('4', '1997-10-29', '2019-11-06 16:49:41', 'dd@163.com', 'DD', '2');
INSERT INTO `tb_employee` VALUES ('5', '1999-11-05', '2019-11-13 16:49:45', 'ee@163.com', 'EE', '1');
