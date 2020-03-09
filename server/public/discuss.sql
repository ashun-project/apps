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

 Date: 09/03/2020 11:05:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for discuss
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss`  (
  `app_id` int(11) NOT NULL COMMENT '应用的id',
  `account` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '评论的时间',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '内容',
  `thumb_total` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '点赞数'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discuss
-- ----------------------------
INSERT INTO `discuss` VALUES (53, '匿名', '2020-03-12 15:37:54', '这个APP真的是太好了', '8');
INSERT INTO `discuss` VALUES (53, '匿名', '2020-03-02 17:47:23', '好喜欢这个啊，太带劲了。还能提现呢', NULL);
INSERT INTO `discuss` VALUES (53, '匿名', '2020-03-02 17:50:14', '423让我去二群无', NULL);
INSERT INTO `discuss` VALUES (53, '匿名', '2020-03-02 17:52:28', '热问问特热我让他让他也很热', NULL);
INSERT INTO `discuss` VALUES (49, '匿名', '2020-03-04 11:27:29', '这个书超级棒，搞得我现在都睡不着了', NULL);
INSERT INTO `discuss` VALUES (49, '匿名', '2020-03-04 11:35:11', '楼上半夜睡不着，想去干点啥呢', NULL);
INSERT INTO `discuss` VALUES (32, '匿名', '2020-03-05 15:42:15', '这个app真的好', NULL);
INSERT INTO `discuss` VALUES (74, '匿名', '2020-03-06 11:45:55', '123我是汉字', NULL);
INSERT INTO `discuss` VALUES (26, '匿名', '2020-03-06 13:17:47', '古典风格梵蒂冈', NULL);
INSERT INTO `discuss` VALUES (72, '匿名', '2020-03-06 13:18:17', '结构化就感觉', NULL);
INSERT INTO `discuss` VALUES (35, '匿名', '2020-03-06 13:22:16', '一二三四五六七', NULL);
INSERT INTO `discuss` VALUES (65, '匿名', '2020-03-06 13:22:55', '啊撒撒撒', NULL);
INSERT INTO `discuss` VALUES (65, '匿名', '2020-03-06 13:23:10', '大萨达', NULL);
INSERT INTO `discuss` VALUES (42, '匿名', '2020-03-06 13:23:47', '阿萨阿萨', NULL);
INSERT INTO `discuss` VALUES (65, '匿名', '2020-03-06 13:24:26', '奥术大师大', NULL);
INSERT INTO `discuss` VALUES (26, '匿名', '2020-03-06 13:24:50', '大叔大婶', NULL);

SET FOREIGN_KEY_CHECKS = 1;
