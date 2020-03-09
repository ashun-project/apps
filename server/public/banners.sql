/*
 Navicat Premium Data Transfer

 Source Server         : my
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : zyb

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 09/03/2020 11:04:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `expire_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES (5, 'httt://qianduan.com', 'banner3.jpg', '2020-02-27 16:03:37', '2020-03-28 16:03:37');
INSERT INTO `banners` VALUES (6, 'httt://qianduan.com', 'banner2.jpg', '2020-02-27 16:05:59', '2020-03-28 16:05:59');
INSERT INTO `banners` VALUES (7, 'httt://qianduan.com', 'banner1.jpg', '2020-02-27 16:06:30', '2020-03-28 16:06:30');
INSERT INTO `banners` VALUES (8, 'httt://qianduan.com', 'banner4.jpg', '2020-02-27 16:06:43', '2020-03-28 16:06:43');

SET FOREIGN_KEY_CHECKS = 1;
