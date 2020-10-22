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

 Date: 22/10/2020 22:51:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for myanswers
-- ----------------------------
DROP TABLE IF EXISTS `myanswers`;
CREATE TABLE `myanswers` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `q_id` int DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `author` varchar(5000) DEFAULT NULL,
  `answer` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of myanswers
-- ----------------------------
BEGIN;
INSERT INTO `myanswers` VALUES (1, 1, '2020-10-05 17:54:24', NULL, '体验生活');
INSERT INTO `myanswers` VALUES (2, 1, '2020-10-05 18:04:10', NULL, '改变世界');
INSERT INTO `myanswers` VALUES (3, 9, '2020-10-05 19:21:36', NULL, '随心所欲，想做什么就做什么');
INSERT INTO `myanswers` VALUES (4, 12, '2020-10-06 10:57:51', NULL, '无拘无束？一箪食，一瓢饮？是不是一下子也想不到什么是理想的生活？是海风吹还是日光浴？是想要什么就有什么？是贪欲？反观自己到底想要的是什么？');
INSERT INTO `myanswers` VALUES (5, 14, '2020-10-06 11:58:21', NULL, '这是一个测试的答案');
INSERT INTO `myanswers` VALUES (6, 16, '2020-10-06 17:21:07', NULL, '这些行为的背后藏着什么？不为利是为名？');
INSERT INTO `myanswers` VALUES (45, 17, '2020-10-13 23:34:25', NULL, '你还是可以努力成为主角');
INSERT INTO `myanswers` VALUES (46, 21, '2020-10-22 22:35:24', NULL, '躺着赚钱,让钱赚钱,让别人给你赚钱,不需要自己话费时间和精力去赚钱~');
INSERT INTO `myanswers` VALUES (47, 37, '2020-10-22 22:36:13', NULL, '回归问题目前这样活着你开心吗?入股你不开心,你要怎么活?');
INSERT INTO `myanswers` VALUES (48, 38, '2020-10-22 22:37:00', NULL, '参考问题ID 9');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
