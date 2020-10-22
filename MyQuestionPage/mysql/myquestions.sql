/*
 Navicat Premium Data Transfer

 Source Server         : Macmini
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : Fastapi

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 22/10/2020 22:51:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for myquestions
-- ----------------------------
DROP TABLE IF EXISTS `myquestions`;
CREATE TABLE `myquestions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_title` varchar(5000) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `source` varchar(5000) DEFAULT NULL,
  `is_archived` tinyint DEFAULT NULL,
  `weight` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of myquestions
-- ----------------------------
BEGIN;
INSERT INTO `myquestions` VALUES (1, '人为什么要活着？', '2020-10-05 16:26:50', NULL, NULL, NULL);
INSERT INTO `myquestions` VALUES (9, '什么是快乐？', '2020-10-05 16:35:01', NULL, NULL, NULL);
INSERT INTO `myquestions` VALUES (10, '是不是眼前的就是最好的？', '2020-10-05 16:38:38', NULL, NULL, NULL);
INSERT INTO `myquestions` VALUES (12, '什么才是理想的生活？', '2020-10-05 16:43:31', NULL, NULL, NULL);
INSERT INTO `myquestions` VALUES (13, '什么是真实,什么是梦境？', '2020-10-05 16:47:09', NULL, NULL, NULL);
INSERT INTO `myquestions` VALUES (14, '这是一个测试问题', '2020-10-05 17:27:30', '测试链接', NULL, NULL);
INSERT INTO `myquestions` VALUES (15, '如何学习的更快？', '2020-10-05 17:28:26', NULL, NULL, NULL);
INSERT INTO `myquestions` VALUES (16, '真的有无所求的人或则行为吗？', '2020-10-06 17:20:18', NULL, NULL, NULL);
INSERT INTO `myquestions` VALUES (17, '你的世界里你是主角，在世界里你永远只是观众？', '2020-10-08 00:39:41', 'https://movie.douban.com/subject/26425063/', NULL, NULL);
INSERT INTO `myquestions` VALUES (21, '什么样的钱更好赚？', '2020-10-13 00:25:52', NULL, NULL, NULL);
INSERT INTO `myquestions` VALUES (22, '什么是人性？', '2020-10-13 00:26:23', NULL, NULL, NULL);
INSERT INTO `myquestions` VALUES (37, '宗教:你为什这样活下去?', '2020-10-22 22:32:29', '', NULL, NULL);
INSERT INTO `myquestions` VALUES (38, '哲学:为什么要活着呢?', '2020-10-22 22:32:44', '', NULL, NULL);
INSERT INTO `myquestions` VALUES (39, '科学:何为活着?', '2020-10-22 22:33:12', '', NULL, NULL);
INSERT INTO `myquestions` VALUES (40, '文学:如果能换一种方式活着,你会怎么活?', '2020-10-22 22:33:38', '', NULL, NULL);
INSERT INTO `myquestions` VALUES (41, '艺术:这是活着的证明,你活着证明了什么?', '2020-10-22 22:34:09', '', NULL, NULL);
INSERT INTO `myquestions` VALUES (42, '美学:你想怎么样活着?', '2020-10-22 22:34:26', '', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
