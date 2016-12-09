/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : zone

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2015-08-15 19:09:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
`articleId`  int(11) NOT NULL AUTO_INCREMENT ,
`title`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content`  varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`siteId`  int(11) NOT NULL ,
`userId`  int(11) NOT NULL ,
PRIMARY KEY (`articleId`),
FOREIGN KEY (`siteId`) REFERENCES `site` (`siteId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `siteId` (`siteId`) USING BTREE ,
INDEX `userId` (`userId`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=16

;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` VALUES ('1', 'first', 'hello', '1', '1'), ('2', 'second', '啊啊啊', '1', '1'), ('3', '1', '21<p>\r\n										</p>', '1', '1'), ('4', '1', '21<p>\r\n										</p>', '1', '1'), ('5', '1', '1<p>\r\n										</p>', '1', '1'), ('6', '2', '2<p>\r\n										</p>', '1', '1'), ('7', '帖子1', '<p>帖子1的内容										</p>', '2', '1'), ('8', '额额', '额额<p>\r\n										</p>', '1', '1'), ('9', '学习交流1', '<p>学习交流1<img src=\"http://img.baidu.com/hi/jx2/j_0028.gif\" _src=\"http://img.baidu.com/hi/jx2/j_0028.gif\"/>\r\n										</p>', '4', '1'), ('10', '学习交流1', '<p>学习交流1<img src=\"http://img.baidu.com/hi/jx2/j_0028.gif\" _src=\"http://img.baidu.com/hi/jx2/j_0028.gif\"/>\r\n										</p>', '4', '1'), ('11', '学习交流2', '<p>学习交流2										</p>', '4', '1'), ('12', '学习交流2', '<p>学习交流2										</p>', '4', '1'), ('13', '学习交流3', '<p>学习交流3										</p>', '4', '1'), ('14', '学习交流4', '<p>学习交流4										</p>', '4', '1'), ('15', '学习交流5', '<p>学习交流5										</p>', '4', '1');
COMMIT;

-- ----------------------------
-- Table structure for `kind`
-- ----------------------------
DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind` (
`kindId`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`kindId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of kind
-- ----------------------------
BEGIN;
INSERT INTO `kind` VALUES ('1', '管理区'), ('2', '交流区');
COMMIT;

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
`replyId`  int(11) NOT NULL AUTO_INCREMENT ,
`content`  varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`articleId`  int(11) NOT NULL ,
`userId`  int(11) NOT NULL ,
PRIMARY KEY (`replyId`),
FOREIGN KEY (`articleId`) REFERENCES `article` (`articleId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `reply_article` (`articleId`) USING BTREE ,
INDEX `reply_user` (`userId`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=13

;

-- ----------------------------
-- Records of reply
-- ----------------------------
BEGIN;
INSERT INTO `reply` VALUES ('1', '我去', '3', '1'), ('2', '怎么会这样子的啊？', '3', '1'), ('3', '什么情况？', '3', '1'), ('4', '啊', '7', '1'), ('5', '额', '7', '1'), ('6', '会', '7', '1'), ('7', '3', '2', '1'), ('8', '额', '10', '1'), ('9', 'test', '15', '1'), ('10', 'success', '15', '1'), ('11', '额额额', '2', '1'), ('12', '腐烂', '2', '1');
COMMIT;

-- ----------------------------
-- Table structure for `site`
-- ----------------------------
DROP TABLE IF EXISTS `site`;
CREATE TABLE `site` (
`siteId`  int(11) NOT NULL ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`KindId`  int(11) NOT NULL ,
`owner`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`siteId`),
FOREIGN KEY (`KindId`) REFERENCES `kind` (`kindId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`owner`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `KindId` (`KindId`) USING BTREE ,
INDEX `owner` (`owner`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of site
-- ----------------------------
BEGIN;
INSERT INTO `site` VALUES ('1', '用户管理', '1', null), ('2', '站长管理', '1', null), ('3', '英语交流', '2', null), ('4', '学习交流', '2', null), ('5', '系统公告', '1', null), ('6', '封号通知', '1', null), ('7', '帖子管理', '1', null);
COMMIT;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
`userId`  int(11) NOT NULL AUTO_INCREMENT ,
`password`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`username`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`userId`, `username`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', '81DC9BDB52D04DC20036DBD8313ED055', 'zhong'), ('3', '202CB962AC59075B964B07152D234B70', 'admin');
COMMIT;

-- ----------------------------
-- Auto increment value for `article`
-- ----------------------------
ALTER TABLE `article` AUTO_INCREMENT=16;

-- ----------------------------
-- Auto increment value for `kind`
-- ----------------------------
ALTER TABLE `kind` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `reply`
-- ----------------------------
ALTER TABLE `reply` AUTO_INCREMENT=13;

-- ----------------------------
-- Auto increment value for `user`
-- ----------------------------
ALTER TABLE `user` AUTO_INCREMENT=4;
