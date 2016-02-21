/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : lesson

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2016-02-20 20:45:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for le_attachment
-- ----------------------------
DROP TABLE IF EXISTS `le_attachment`;
CREATE TABLE `le_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(200) DEFAULT NULL COMMENT '文件名',
  `lesson_id` int(11) unsigned DEFAULT NULL COMMENT '课程id',
  `file_url` varchar(256) DEFAULT NULL COMMENT '文件地址',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间',
  PRIMARY KEY (`id`),
  KEY `material_lesson_id` (`lesson_id`) USING BTREE,
  CONSTRAINT `le_attachment_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `le_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='附件';

-- ----------------------------
-- Records of le_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for le_job
-- ----------------------------
DROP TABLE IF EXISTS `le_job`;
CREATE TABLE `le_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(200) DEFAULT NULL COMMENT '作业名称',
  `content` text COMMENT '作业内容',
  `lesson_id` int(10) unsigned NOT NULL COMMENT '课程id',
  `end_time` datetime NOT NULL COMMENT '作业截止时间',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '作业发布时间',
  PRIMARY KEY (`id`),
  KEY `job_lesson_id` (`lesson_id`),
  CONSTRAINT `job_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `le_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程作业';

-- ----------------------------
-- Records of le_job
-- ----------------------------

-- ----------------------------
-- Table structure for le_job_record
-- ----------------------------
DROP TABLE IF EXISTS `le_job_record`;
CREATE TABLE `le_job_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned NOT NULL COMMENT '作业id',
  `student_id` int(10) unsigned NOT NULL COMMENT '学生id',
  `content` text COMMENT '完成作业内容',
  `grade` float(5,2) unsigned DEFAULT NULL,
  `comment` text,
  `finish_time` datetime DEFAULT NULL COMMENT '完成时间',
  `mark_time` datetime DEFAULT NULL COMMENT '批阅时间',
  PRIMARY KEY (`id`),
  KEY `record_job_id` (`job_id`),
  CONSTRAINT `record_job_id` FOREIGN KEY (`job_id`) REFERENCES `le_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业记录';

-- ----------------------------
-- Records of le_job_record
-- ----------------------------

-- ----------------------------
-- Table structure for le_lesson
-- ----------------------------
DROP TABLE IF EXISTS `le_lesson`;
CREATE TABLE `le_lesson` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `lesson_name` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `lesson_id` varchar(40) DEFAULT NULL COMMENT '课程唯一id',
  `teacher_id` int(11) unsigned NOT NULL COMMENT '教师id',
  `lesson_desc` text COMMENT '课程介绍',
  PRIMARY KEY (`id`),
  KEY `lesson_teacher_id` (`teacher_id`),
  CONSTRAINT `lesson_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `le_teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程';

-- ----------------------------
-- Records of le_lesson
-- ----------------------------

-- ----------------------------
-- Table structure for le_lesson_record
-- ----------------------------
DROP TABLE IF EXISTS `le_lesson_record`;
CREATE TABLE `le_lesson_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` int(10) unsigned NOT NULL COMMENT '课程id',
  `student_id` int(10) unsigned NOT NULL COMMENT '学生id',
  `status` enum('wait','agree','refuse') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `record_lesson_id` (`lesson_id`),
  CONSTRAINT `record_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `le_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='选课记录';

-- ----------------------------
-- Records of le_lesson_record
-- ----------------------------

-- ----------------------------
-- Table structure for le_material
-- ----------------------------
DROP TABLE IF EXISTS `le_material`;
CREATE TABLE `le_material` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(200) DEFAULT NULL COMMENT '文件名',
  `lesson_id` int(11) unsigned DEFAULT NULL COMMENT '课程id',
  `file_url` varchar(256) DEFAULT NULL COMMENT '文件地址',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间',
  PRIMARY KEY (`id`),
  KEY `material_lesson_id` (`lesson_id`),
  CONSTRAINT `material_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `le_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='讲义';

-- ----------------------------
-- Records of le_material
-- ----------------------------

-- ----------------------------
-- Table structure for le_student
-- ----------------------------
DROP TABLE IF EXISTS `le_student`;
CREATE TABLE `le_student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一id',
  `student_id` char(8) DEFAULT NULL COMMENT '学号',
  `name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `image_url` varchar(256) DEFAULT NULL COMMENT '头像地址',
  `passwd` char(40) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生';

-- ----------------------------
-- Records of le_student
-- ----------------------------

-- ----------------------------
-- Table structure for le_teacher
-- ----------------------------
DROP TABLE IF EXISTS `le_teacher`;
CREATE TABLE `le_teacher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `teacher_id` char(10) DEFAULT NULL COMMENT '教工号',
  `name` varchar(20) DEFAULT NULL COMMENT '教师姓名',
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `image_url` varchar(256) DEFAULT NULL COMMENT '头像地址',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师信息表';

-- ----------------------------
-- Records of le_teacher
-- ----------------------------
