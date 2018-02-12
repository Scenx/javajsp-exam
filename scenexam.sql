/*
Navicat MySQL Data Transfer

Source Server         : 服务器
Source Server Version : 50718
Source Host           : 115.159.36.234:3306
Source Database       : scenexam

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-06-18 19:22:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tm_admin
-- ----------------------------
DROP TABLE IF EXISTS `tm_admin`;
CREATE TABLE `tm_admin` (
  `a_id` varchar(50) NOT NULL,
  `a_username` varchar(50) DEFAULT NULL,
  `a_userpass` varchar(50) DEFAULT NULL,
  `a_roleid` varchar(50) DEFAULT NULL,
  `a_realname` varchar(50) DEFAULT NULL,
  `a_photo` varchar(100) DEFAULT NULL,
  `a_phone` varchar(50) DEFAULT NULL,
  `a_email` varchar(50) DEFAULT NULL,
  `a_status` int(2) DEFAULT NULL,
  `a_createdate` datetime DEFAULT NULL,
  `a_salt` varchar(10) DEFAULT NULL,
  `a_remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`a_id`),
  KEY `FK_ref_admin_role` (`a_roleid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_admin
-- ----------------------------
INSERT INTO `tm_admin` VALUES ('898cefdf-d372-410d-b5d5-332e71b43e64', 'admin', '6BCAD14610052C99622DF0C6B416DCB0', '7e33ecad-b7c5-4b93-a4ff-b13f12a067be', '管理员', '', '15518107074', 'scen@vip.qq.com', '1', '2016-03-12 21:52:46', 't8kgmtbiom', 'huazi');

-- ----------------------------
-- Table structure for tm_admin_addition
-- ----------------------------
DROP TABLE IF EXISTS `tm_admin_addition`;
CREATE TABLE `tm_admin_addition` (
  `a_id` varchar(50) DEFAULT NULL,
  `a_logintimes` int(11) DEFAULT '0',
  `a_lastlogin` datetime DEFAULT NULL,
  KEY `FK_ref_admin_addtion` (`a_id`) USING BTREE,
  CONSTRAINT `tm_admin_addition_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `tm_admin` (`a_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_admin_addition
-- ----------------------------
INSERT INTO `tm_admin_addition` VALUES ('898cefdf-d372-410d-b5d5-332e71b43e64', '108', '2017-06-18 16:24:30');

-- ----------------------------
-- Table structure for tm_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `tm_admin_role`;
CREATE TABLE `tm_admin_role` (
  `r_id` varchar(50) NOT NULL,
  `r_name` varchar(50) DEFAULT NULL,
  `r_status` int(2) DEFAULT NULL,
  `r_createdate` datetime DEFAULT NULL,
  `r_privilege` text,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_admin_role
-- ----------------------------
INSERT INTO `tm_admin_role` VALUES ('7e33ecad-b7c5-4b93-a4ff-b13f12a067be', '超级管理员', '1', '2016-03-11 22:48:03', 'M-QDB,F-QDB,P-QDB-ADD,P-QDB-DELETE,P-QDB-UPDATE,P-QDB-VIEW,F-QES,P-QES-ADD,P-QES-DELETE,P-QES-UPDATE,P-QES-VIEW,P-QES-IMPORT,M-PAPER,F-PAPER,P-PAPER-ADD,P-PAPER-DELETE,P-PAPER-CLONE,P-PAPER-EXPORTWORD,P-PAPER-UPDATE,P-PAPER-VIEW,P-PAPER-HISTORY-VIEW,P-PAPER-HISTORY-CHECK,P-PAPER-HISTORY-REMOVE,F-PAPER-CATE,P-PAPER-CATE-ADD,P-PAPER-CATE-DELETE,P-PAPER-CATE-UPDATE,P-PAPER-CATE-VIEW,M-ANALYSIS,F-ANALYSIS,P-ANA-EXAM,P-ANA-PAPER,P-ANA-SCORE,M-USERS,F-USERS,P-USER-ADD,P-USER-IMPORT,P-USER-DELETE,P-USER-UPDATE,P-USER-VIEW,P-USER-EXAMVIEW,F-BRANCH,P-BRANCH-ADD,P-BRANCH-DELETE,P-BRANCH-UPDATE,P-BRANCH-VIEW,F-UPOSITION,P-UPOSITION-ADD,P-UPOSITION-DELETE,P-UPOSITION-UPDATE,P-UPOSITION-VIEW,M-INTERACTION,F-NEWS,P-NEWS-ADD,P-NEWS-DELETE,P-NEWS-UPDATE,P-NEWS-VIEW,F-NEWSCATE,P-NEWSCATE-ADD,P-NEWSCATE-DELETE,P-NEWSCATE-UPDATE,P-NEWSCATE-VIEW,M-LEARNING,F-COURSE,P-COURSE-ADD,P-COURSE-DELETE,P-COURSE-UPDATE,P-COURSE-DATAVIEW,F-COURSE-CATEGORY,P-COURSE-CATEGORY-ADD,P-COURSE-CATEGORY-DELETE,P-COURSE-CATEGORY-UPDATE,F-COURSE-TEACHER,P-COURSE-TEACHER-ADD,P-COURSE-TEACHER-DELETE,P-COURSE-TEACHER-UPDATE,M-SYSTEM,F-SYS,P-SYS-CONFIG,P-SYS-LOG,F-ADMIN,P-ADMIN-ADD,P-ADMIN-DELETE,P-ADMIN-UPDATE,P-ADMIN-VIEW,F-ROLE,P-ROLE-ADD,P-ROLE-DELETE,P-ROLE-UPDATE,P-ROLE-VIEW,M-OTHER,F-SUPER,P-OTH-SUPER');

-- ----------------------------
-- Table structure for tm_branch
-- ----------------------------
DROP TABLE IF EXISTS `tm_branch`;
CREATE TABLE `tm_branch` (
  `b_id` varchar(50) NOT NULL,
  `b_name` varchar(50) DEFAULT NULL,
  `b_pid` varchar(50) DEFAULT NULL,
  `b_remark` varchar(50) DEFAULT NULL,
  `b_order` int(3) DEFAULT NULL,
  `b_status` int(2) DEFAULT NULL,
  `b_poster` varchar(50) DEFAULT NULL,
  `b_createdate` datetime DEFAULT NULL,
  `b_modifyor` varchar(50) DEFAULT NULL,
  `b_modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_branch
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course
-- ----------------------------
DROP TABLE IF EXISTS `tm_course`;
CREATE TABLE `tm_course` (
  `c_id` varchar(50) NOT NULL,
  `c_name` varchar(100) DEFAULT NULL,
  `c_logo` varchar(100) DEFAULT NULL,
  `c_tid` varchar(50) DEFAULT NULL,
  `c_caid` varchar(50) DEFAULT NULL,
  `c_score` int(11) DEFAULT NULL,
  `c_type` int(2) DEFAULT NULL COMMENT '1必修，0选修',
  `c_introduce` text,
  `c_postdate` datetime DEFAULT NULL,
  `c_modifydate` datetime DEFAULT NULL,
  `c_status` int(2) DEFAULT '0' COMMENT '1正常，-9已删除，0待审核',
  `c_stars` int(11) DEFAULT NULL COMMENT '管理员给的分值，如：5代表5颗星',
  `c_data` longtext,
  `c_poster` varchar(50) DEFAULT NULL,
  `c_modifier` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course_category
-- ----------------------------
DROP TABLE IF EXISTS `tm_course_category`;
CREATE TABLE `tm_course_category` (
  `ca_id` varchar(50) NOT NULL,
  `ca_name` varchar(50) DEFAULT NULL,
  `ca_desc` text,
  `ca_logo` varchar(100) DEFAULT NULL,
  `ca_pid` varchar(50) DEFAULT NULL,
  `ca_status` int(2) DEFAULT NULL,
  `ca_order` int(11) DEFAULT NULL,
  `ca_postdate` datetime DEFAULT NULL,
  PRIMARY KEY (`ca_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course_category
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course_comments
-- ----------------------------
DROP TABLE IF EXISTS `tm_course_comments`;
CREATE TABLE `tm_course_comments` (
  `c_id` varchar(50) NOT NULL,
  `c_cid` varchar(50) DEFAULT NULL,
  `c_uid` varchar(50) DEFAULT NULL,
  `c_content` text,
  `c_postdate` datetime DEFAULT NULL,
  `c_ip` varchar(50) DEFAULT NULL,
  `c_status` int(2) DEFAULT NULL COMMENT '1正常，-9已删除',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course_comments
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course_favorites
-- ----------------------------
DROP TABLE IF EXISTS `tm_course_favorites`;
CREATE TABLE `tm_course_favorites` (
  `f_id` varchar(50) NOT NULL,
  `f_cid` varchar(50) DEFAULT NULL,
  `f_uid` varchar(50) DEFAULT NULL,
  `f_favdate` datetime DEFAULT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course_note
-- ----------------------------
DROP TABLE IF EXISTS `tm_course_note`;
CREATE TABLE `tm_course_note` (
  `n_id` varchar(50) NOT NULL,
  `n_cid` varchar(50) DEFAULT NULL,
  `n_sid` varchar(50) DEFAULT NULL,
  `n_leid` varchar(50) DEFAULT NULL,
  `n_uid` varchar(50) DEFAULT NULL,
  `n_content` text,
  `n_postdate` datetime DEFAULT NULL,
  `n_status` int(2) DEFAULT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course_note
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course_progress_history
-- ----------------------------
DROP TABLE IF EXISTS `tm_course_progress_history`;
CREATE TABLE `tm_course_progress_history` (
  `p_id` varchar(50) NOT NULL,
  `p_cid` varchar(50) DEFAULT NULL,
  `p_sid` varchar(50) DEFAULT NULL,
  `p_leid` varchar(50) DEFAULT NULL,
  `p_uid` varchar(50) DEFAULT NULL,
  `p_startdate` datetime DEFAULT NULL COMMENT '1完成，0进行中',
  `p_enddate` datetime DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course_progress_history
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course_qa
-- ----------------------------
DROP TABLE IF EXISTS `tm_course_qa`;
CREATE TABLE `tm_course_qa` (
  `q_id` varchar(50) NOT NULL,
  `q_cid` varchar(50) DEFAULT NULL,
  `q_uid` varchar(50) DEFAULT NULL,
  `q_question` text,
  `q_answer` text,
  `q_postdate` datetime DEFAULT NULL,
  `q_answerdate` datetime DEFAULT NULL,
  `q_status` int(2) DEFAULT NULL COMMENT '0未回答，1已回答（正常），-9已删除',
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course_qa
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tm_course_teacher`;
CREATE TABLE `tm_course_teacher` (
  `t_id` varchar(50) NOT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `t_phone` varchar(50) DEFAULT NULL,
  `t_email` varchar(50) DEFAULT NULL,
  `t_photo` varchar(100) DEFAULT NULL,
  `t_info` text,
  `t_createdate` datetime DEFAULT NULL,
  `t_modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for tm_course_userscore_detail
-- ----------------------------
DROP TABLE IF EXISTS `tm_course_userscore_detail`;
CREATE TABLE `tm_course_userscore_detail` (
  `d_id` varchar(50) NOT NULL,
  `d_cid` varchar(50) DEFAULT NULL,
  `d_uid` varchar(50) DEFAULT NULL,
  `d_passdate` datetime DEFAULT NULL,
  `d_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_course_userscore_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tm_examdata
-- ----------------------------
DROP TABLE IF EXISTS `tm_examdata`;
CREATE TABLE `tm_examdata` (
  `e_id` varchar(50) NOT NULL,
  `e_pid` varchar(50) DEFAULT NULL,
  `e_uid` varchar(50) DEFAULT NULL,
  `e_starttime` datetime DEFAULT NULL,
  `e_endtime` datetime DEFAULT NULL,
  `e_ip` varchar(50) DEFAULT NULL,
  `e_score` int(4) DEFAULT NULL,
  `e_status` int(2) DEFAULT NULL COMMENT '0未交卷，1已交卷待批改，2已批改',
  `e_data` longtext,
  `e_check` longtext,
  PRIMARY KEY (`e_id`),
  KEY `IDX_PID` (`e_pid`) USING BTREE,
  KEY `IDX_UID` (`e_uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_examdata
-- ----------------------------

-- ----------------------------
-- Table structure for tm_examdata_addition
-- ----------------------------
DROP TABLE IF EXISTS `tm_examdata_addition`;
CREATE TABLE `tm_examdata_addition` (
  `e_id` int(11) NOT NULL,
  `e_pid` varchar(50) DEFAULT NULL,
  `e_uid` varchar(50) DEFAULT NULL,
  `e_remarker` varchar(50) DEFAULT NULL,
  `e_remark` text,
  `e_remarkdate` datetime DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_examdata_addition
-- ----------------------------

-- ----------------------------
-- Table structure for tm_news
-- ----------------------------
DROP TABLE IF EXISTS `tm_news`;
CREATE TABLE `tm_news` (
  `n_id` varchar(50) NOT NULL,
  `n_title` varchar(100) DEFAULT NULL,
  `n_title_color` varchar(20) DEFAULT NULL,
  `n_classid` varchar(50) DEFAULT NULL,
  `n_content` text,
  `n_status` int(2) DEFAULT NULL,
  `n_totop` int(2) DEFAULT NULL,
  `n_visit` int(10) DEFAULT NULL,
  `n_photo` varchar(50) DEFAULT NULL,
  `n_author` varchar(20) DEFAULT NULL,
  `n_newsfrom` varchar(50) DEFAULT NULL,
  `n_poster` varchar(50) DEFAULT NULL,
  `n_createdate` datetime DEFAULT NULL,
  `n_modifyor` varchar(50) DEFAULT NULL,
  `n_modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_news
-- ----------------------------

-- ----------------------------
-- Table structure for tm_news_cateogry
-- ----------------------------
DROP TABLE IF EXISTS `tm_news_cateogry`;
CREATE TABLE `tm_news_cateogry` (
  `c_id` varchar(50) NOT NULL,
  `c_name` varchar(50) DEFAULT NULL,
  `c_pid` varchar(50) DEFAULT NULL,
  `c_poster` varchar(50) DEFAULT NULL,
  `c_orderid` int(11) DEFAULT NULL,
  `c_remark` varchar(200) DEFAULT NULL,
  `c_createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_news_cateogry
-- ----------------------------

-- ----------------------------
-- Table structure for tm_paper
-- ----------------------------
DROP TABLE IF EXISTS `tm_paper`;
CREATE TABLE `tm_paper` (
  `p_id` varchar(50) NOT NULL,
  `p_name` varchar(100) DEFAULT NULL,
  `p_cid` varchar(50) DEFAULT NULL,
  `p_status` int(2) DEFAULT NULL COMMENT '试卷状态，1正常可用，0不可???',
  `p_starttime` datetime DEFAULT NULL,
  `p_endtime` datetime DEFAULT NULL,
  `p_duration` int(5) DEFAULT NULL,
  `p_showtime` datetime DEFAULT NULL,
  `p_total_score` int(5) DEFAULT NULL,
  `p_pass_score` int(5) DEFAULT NULL,
  `p_question_order` int(1) DEFAULT NULL COMMENT '0正常，1随机',
  `p_papertype` int(1) DEFAULT NULL COMMENT '0普通试卷，1随机生成试卷',
  `p_remark` text,
  `p_data` longtext,
  `p_poster` varchar(50) DEFAULT NULL,
  `p_createdate` datetime DEFAULT NULL,
  `p_modifyor` varchar(50) DEFAULT NULL,
  `p_modifydate` datetime DEFAULT NULL,
  `p_showkey` int(2) DEFAULT '1',
  `p_showmode` int(2) DEFAULT '1',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_paper
-- ----------------------------

-- ----------------------------
-- Table structure for tm_paper_category
-- ----------------------------
DROP TABLE IF EXISTS `tm_paper_category`;
CREATE TABLE `tm_paper_category` (
  `c_id` varchar(50) NOT NULL DEFAULT '',
  `c_name` varchar(100) DEFAULT NULL,
  `c_remark` varchar(500) DEFAULT NULL,
  `c_status` int(2) DEFAULT NULL,
  `c_poster` varchar(50) DEFAULT NULL,
  `c_createdate` datetime DEFAULT NULL,
  `c_modifyor` varchar(50) DEFAULT NULL,
  `c_modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_paper_category
-- ----------------------------

-- ----------------------------
-- Table structure for tm_paper_link_branch
-- ----------------------------
DROP TABLE IF EXISTS `tm_paper_link_branch`;
CREATE TABLE `tm_paper_link_branch` (
  `ln_pid` varchar(50) DEFAULT NULL,
  `ln_buid` varchar(50) DEFAULT NULL,
  `ln_type` int(2) DEFAULT NULL COMMENT '1部门关系，0个人关系'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_paper_link_branch
-- ----------------------------
INSERT INTO `tm_paper_link_branch` VALUES ('9a7c4551-06f4-4409-a507-2e3d7bd1de87', '09031ebf-8fcc-40c6-9101-68a52e3ff09b', '1');
INSERT INTO `tm_paper_link_branch` VALUES ('9a7c4551-06f4-4409-a507-2e3d7bd1de87', '827ea7bb-138d-425e-9fdf-13e97172b039', '1');
INSERT INTO `tm_paper_link_branch` VALUES ('6d804574-1586-4b01-b789-9667b18daee6', '09031ebf-8fcc-40c6-9101-68a52e3ff09b', '1');
INSERT INTO `tm_paper_link_branch` VALUES ('6d804574-1586-4b01-b789-9667b18daee6', '827ea7bb-138d-425e-9fdf-13e97172b039', '1');
INSERT INTO `tm_paper_link_branch` VALUES ('8e7c0b98-4887-484d-aa4f-55bb2657af5d', '827ea7bb-138d-425e-9fdf-13e97172b039', '1');

-- ----------------------------
-- Table structure for tm_paper_random
-- ----------------------------
DROP TABLE IF EXISTS `tm_paper_random`;
CREATE TABLE `tm_paper_random` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_pid` varchar(50) DEFAULT NULL,
  `r_uid` varchar(50) DEFAULT NULL,
  `r_detail` longtext,
  `r_createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`r_id`),
  KEY `IDX_PID` (`r_pid`) USING BTREE,
  KEY `IDX_UID` (`r_uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_paper_random
-- ----------------------------

-- ----------------------------
-- Table structure for tm_question
-- ----------------------------
DROP TABLE IF EXISTS `tm_question`;
CREATE TABLE `tm_question` (
  `q_id` varchar(50) NOT NULL,
  `q_dbid` varchar(50) DEFAULT NULL,
  `q_type` int(2) DEFAULT NULL,
  `q_level` int(2) DEFAULT NULL,
  `q_from` varchar(50) DEFAULT NULL,
  `q_status` int(2) DEFAULT NULL,
  `q_content` longtext,
  `q_key` text,
  `q_resolve` text,
  `q_poster` varchar(50) DEFAULT NULL,
  `q_createdate` datetime DEFAULT NULL,
  `q_modifyor` varchar(50) DEFAULT NULL,
  `q_modifydate` datetime DEFAULT NULL,
  `q_data` longtext,
  PRIMARY KEY (`q_id`),
  KEY `FK_ref_question_db` (`q_dbid`) USING BTREE,
  KEY `IDX_QTYPE` (`q_type`) USING BTREE,
  KEY `IDX_QID` (`q_id`) USING BTREE,
  KEY `IDX_QSTATUS` (`q_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_question
-- ----------------------------

-- ----------------------------
-- Table structure for tm_question_db
-- ----------------------------
DROP TABLE IF EXISTS `tm_question_db`;
CREATE TABLE `tm_question_db` (
  `d_id` varchar(50) NOT NULL,
  `d_name` varchar(100) DEFAULT NULL,
  `d_logo` varchar(100) DEFAULT NULL,
  `d_status` int(2) DEFAULT NULL,
  `d_remark` varchar(200) DEFAULT NULL,
  `d_poster` varchar(50) DEFAULT NULL,
  `d_createdate` datetime DEFAULT NULL,
  `d_modifyor` varchar(50) DEFAULT NULL,
  `d_modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_question_db
-- ----------------------------

-- ----------------------------
-- Table structure for tm_system_config
-- ----------------------------
DROP TABLE IF EXISTS `tm_system_config`;
CREATE TABLE `tm_system_config` (
  `c_id` int(11) NOT NULL,
  `c_config` text,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_system_config
-- ----------------------------
INSERT INTO `tm_system_config` VALUES ('1', '<map>\n  <entry>\n    <string>sys_lang</string>\n    <string>zh_CN</string>\n  </entry>\n  <entry>\n    <string>sys_sitename</string>\n    <string>Scen在线考试系统</string>\n  </entry>\n  <entry>\n    <string>sys_allow_login</string>\n    <string>allow</string>\n  </entry>\n  <entry>\n    <string>sys_allow_test</string>\n    <string>allow</string>\n  </entry>\n  <entry>\n    <string>sys_allow_exam</string>\n    <string>allow</string>\n  </entry>\n  <entry>\n    <string>sys_access_ips</string>\n    <string>10.32.0.1</string>\n  </entry>\n  <entry>\n    <string>sys_allow_register</string>\n    <string>allow</string>\n  </entry>\n  <entry>\n    <string>sys_access_control</string>\n    <string>close</string>\n  </entry>\n</map>');
INSERT INTO `tm_system_config` VALUES ('2', 'UE83SS1ZT1JYLU1TQU8tVEJaUS1IMVI2');

-- ----------------------------
-- Table structure for tm_system_function_lib
-- ----------------------------
DROP TABLE IF EXISTS `tm_system_function_lib`;
CREATE TABLE `tm_system_function_lib` (
  `f_code` varchar(50) DEFAULT NULL,
  `f_cname` varchar(50) DEFAULT NULL,
  `f_ename` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_system_function_lib
-- ----------------------------
INSERT INTO `tm_system_function_lib` VALUES ('M-QDB', '题库管理', 'Question Bank Manage');
INSERT INTO `tm_system_function_lib` VALUES ('F-QDB', '题库管理', 'Question Bank Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-QDB-ADD', '增加题库', 'Add Question Bank');
INSERT INTO `tm_system_function_lib` VALUES ('P-QDB-DELETE', '删除题库', 'Delete Question Bank');
INSERT INTO `tm_system_function_lib` VALUES ('P-QDB-UPDATE', '修改题库', 'Modify Question Bank');
INSERT INTO `tm_system_function_lib` VALUES ('P-QDB-VIEW', '查看题库', 'View Question Bank');
INSERT INTO `tm_system_function_lib` VALUES ('F-QES', '试题管理', 'Question Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-QES-ADD', '增加试题', 'Add Question');
INSERT INTO `tm_system_function_lib` VALUES ('P-QES-DELETE', '删除试题', 'Delete Question');
INSERT INTO `tm_system_function_lib` VALUES ('P-QES-UPDATE', '修改试题', 'Modify Question');
INSERT INTO `tm_system_function_lib` VALUES ('P-QES-VIEW', '查看试题', 'View Question');
INSERT INTO `tm_system_function_lib` VALUES ('P-QES-IMPORT', '导入试题', 'Import Questions');
INSERT INTO `tm_system_function_lib` VALUES ('M-PAPER', '试题管理', 'Paper Manage');
INSERT INTO `tm_system_function_lib` VALUES ('F-PAPER', '试题管理', 'Paper Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-ADD', '增加试卷', 'Add Paper');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-DELETE', '删除试卷', 'Delete Paper');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-UPDATE', '修改试卷', 'Modify Paper');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-VIEW', '查看试卷', 'View Paper');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-HISTORY-VIEW', '查看考试记录', 'View Exam History');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-HISTORY-CHECK', '批改考试记录', 'Check Exam History');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-HISTORY-REMOVE', '删除考试记录', 'Delete Exam History');
INSERT INTO `tm_system_function_lib` VALUES ('F-PAPER-CATE', '试题分类管理', 'Paper Category Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-CATE-ADD', '增加试卷分类', 'Add Paper Category');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-CATE-DELETE', '删除试卷分类', 'Delete Paper Category');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-CATE-UPDATE', '修改试卷分类', 'Modify Paper Category');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-CATE-VIEW', '查看试卷分类', 'View Paper Category');
INSERT INTO `tm_system_function_lib` VALUES ('M-ANALYSIS', '数据分析', 'Data Analysis');
INSERT INTO `tm_system_function_lib` VALUES ('F-ANALYSIS', '数据分析', 'Data Analysis');
INSERT INTO `tm_system_function_lib` VALUES ('P-ANA-EXAM', '考试分析', 'Exam Analysis');
INSERT INTO `tm_system_function_lib` VALUES ('P-ANA-PAPER', '试卷分析', 'Paper Analysis');
INSERT INTO `tm_system_function_lib` VALUES ('P-ANA-SCORE', '成绩分析', 'Score Analysis');
INSERT INTO `tm_system_function_lib` VALUES ('M-USERS', '用户管理', 'User Manage');
INSERT INTO `tm_system_function_lib` VALUES ('F-USERS', '用户管理', 'User Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-USER-ADD', '增加用户', 'Add User');
INSERT INTO `tm_system_function_lib` VALUES ('P-USER-IMPORT', '批量导入用户', 'Import Users');
INSERT INTO `tm_system_function_lib` VALUES ('P-USER-DELETE', '删除用户', 'Delete User');
INSERT INTO `tm_system_function_lib` VALUES ('P-USER-UPDATE', '修改用户', 'Modify User');
INSERT INTO `tm_system_function_lib` VALUES ('P-USER-VIEW', '查看用户', 'View User');
INSERT INTO `tm_system_function_lib` VALUES ('P-USER-EXAMVIEW', '查看用户考试记录', 'View Exam History');
INSERT INTO `tm_system_function_lib` VALUES ('F-BRANCH', '用户部门管理', 'User Department Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-BRANCH-ADD', '增加用户部门', 'Add Department');
INSERT INTO `tm_system_function_lib` VALUES ('P-BRANCH-DELETE', '删除用户部门', 'Delete Department');
INSERT INTO `tm_system_function_lib` VALUES ('P-BRANCH-UPDATE', '修改用户部门', 'Modify Department');
INSERT INTO `tm_system_function_lib` VALUES ('P-BRANCH-VIEW', '查看用户部门', 'View Department');
INSERT INTO `tm_system_function_lib` VALUES ('F-UPOSITION', '用户职务管理', 'User Positions Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-UPOSITION-ADD', '增加用户职务', 'Add Position');
INSERT INTO `tm_system_function_lib` VALUES ('P-UPOSITION-DELETE', '删除用户职务', 'Delete Position');
INSERT INTO `tm_system_function_lib` VALUES ('P-UPOSITION-UPDATE', '修改用户职务', 'Modify Position');
INSERT INTO `tm_system_function_lib` VALUES ('P-UPOSITION-VIEW', '查看用户职务', 'View Position');
INSERT INTO `tm_system_function_lib` VALUES ('M-INTERACTION', '互动交流', 'Interaction and Communication');
INSERT INTO `tm_system_function_lib` VALUES ('F-NEWS', '文章管理', 'Article Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-NEWS-ADD', '增加文章', 'Add Article');
INSERT INTO `tm_system_function_lib` VALUES ('P-NEWS-DELETE', '删除文章', 'Delete Article');
INSERT INTO `tm_system_function_lib` VALUES ('P-NEWS-UPDATE', '修改文章', 'Modify Article');
INSERT INTO `tm_system_function_lib` VALUES ('P-NEWS-VIEW', '查看文章', 'View Article');
INSERT INTO `tm_system_function_lib` VALUES ('F-NEWSCATE', '文章分类管理', 'Article Category Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-NEWSCATE-ADD', '增加文章分类', 'Add Category');
INSERT INTO `tm_system_function_lib` VALUES ('P-NEWSCATE-DELETE', '删除文章分类', 'Delete Category');
INSERT INTO `tm_system_function_lib` VALUES ('P-NEWSCATE-UPDATE', '修改文章分类', 'Modify Category');
INSERT INTO `tm_system_function_lib` VALUES ('P-NEWSCATE-VIEW', '查看文章分类', 'View Category');
INSERT INTO `tm_system_function_lib` VALUES ('M-SYSTEM', '系统管理', 'System Manage');
INSERT INTO `tm_system_function_lib` VALUES ('F-SYS', '系统设置', 'System Config');
INSERT INTO `tm_system_function_lib` VALUES ('P-SYS-CONFIG', '系统参数设置', 'System Setting');
INSERT INTO `tm_system_function_lib` VALUES ('P-SYS-LOG', '查看系统日志', 'View System Logs');
INSERT INTO `tm_system_function_lib` VALUES ('F-ADMIN', '管理员管理', 'Administrators Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-ADMIN-ADD', '增加管理', 'Add Administrator');
INSERT INTO `tm_system_function_lib` VALUES ('P-ADMIN-DELETE', '删除管理员', 'Delete Administrator');
INSERT INTO `tm_system_function_lib` VALUES ('P-ADMIN-UPDATE', '修改管理员', 'Modify Administrator');
INSERT INTO `tm_system_function_lib` VALUES ('P-ADMIN-VIEW', '查看管理员', 'View Administrator');
INSERT INTO `tm_system_function_lib` VALUES ('F-ROLE', '管理员角色管理', 'Administrator Role Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-ROLE-ADD', '增加管理员角色', 'Add Role');
INSERT INTO `tm_system_function_lib` VALUES ('P-ROLE-DELETE', '删除管理员角色', 'Delete Role');
INSERT INTO `tm_system_function_lib` VALUES ('P-ROLE-UPDATE', '修改管理员角色', 'Modify Role');
INSERT INTO `tm_system_function_lib` VALUES ('P-ROLE-VIEW', '查看管理员角色', 'View Role');
INSERT INTO `tm_system_function_lib` VALUES ('M-OTHER', '其他权限', 'Others');
INSERT INTO `tm_system_function_lib` VALUES ('F-SUPER', '超级管理员 ', 'Super-Administrator');
INSERT INTO `tm_system_function_lib` VALUES ('P-OTH-SUPER', '超级管理员权限', 'Super-Administrator Privileges');
INSERT INTO `tm_system_function_lib` VALUES ('doLogin', '登录', 'Login');
INSERT INTO `tm_system_function_lib` VALUES ('doLogout', '登出', 'Logout');
INSERT INTO `tm_system_function_lib` VALUES ('updateProfile', '修改账户信息', 'Update Account');
INSERT INTO `tm_system_function_lib` VALUES ('M-LEARNING', '学习系统', 'Learning System');
INSERT INTO `tm_system_function_lib` VALUES ('F-COURSE', '课程管理', 'Course Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-ADD', '增加课程', 'Add Course');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-DELETE', '删除课程', 'Delete Course');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-UPDATE', '修改课程', 'Modify Course');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-DATAVIEW', '查看课程数据', 'View Course Data');
INSERT INTO `tm_system_function_lib` VALUES ('F-COURSE-CATEGORY', '课程分类管理', 'Course Category Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-CATEGORY-ADD', '增加课程分类', 'Add Category');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-CATEGORY-DELETE', '删除课程分类', 'Delete Category');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-CATEGORY-UPDATE', '修改课程分类', 'Modify Category');
INSERT INTO `tm_system_function_lib` VALUES ('F-COURSE-TEACHER', '课程讲师管理', 'Course Teacher Manage');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-TEACHER-ADD', '增加讲师', 'Add Teacher');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-TEACHER-DELETE', '删除讲师', 'Delete Teacher');
INSERT INTO `tm_system_function_lib` VALUES ('P-COURSE-TEACHER-UPDATE', '修改讲师', 'Modify Teacher');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-CLONE', '克隆试卷', 'Clone Paper');
INSERT INTO `tm_system_function_lib` VALUES ('P-PAPER-EXPORTWORD', '导出试卷', 'Export Paper');

-- ----------------------------
-- Table structure for tm_system_log
-- ----------------------------
DROP TABLE IF EXISTS `tm_system_log`;
CREATE TABLE `tm_system_log` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_usertype` int(11) DEFAULT NULL COMMENT '1管理员，2用户',
  `l_username` varchar(50) DEFAULT NULL,
  `l_action` varchar(50) DEFAULT NULL COMMENT '汉??说明，如：登录',
  `l_url` varchar(500) DEFAULT NULL,
  `l_logdate` datetime DEFAULT NULL,
  `l_logdesc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1745 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_system_log
-- ----------------------------
INSERT INTO `tm_system_log` VALUES ('1287', '1', 'admin', 'F-ROLE', '/system/role/list.thtml', '2017-02-25 23:56:40', 'true');
INSERT INTO `tm_system_log` VALUES ('1288', '1', 'admin', 'F-ROLE', '/system/role/list.thtml', '2017-02-25 23:56:42', 'true');
INSERT INTO `tm_system_log` VALUES ('1289', '1', 'admin', 'F-ROLE', '/system/role/list.thtml', '2017-02-25 23:56:43', 'true');
INSERT INTO `tm_system_log` VALUES ('1290', '1', 'admin', 'doLogout', '/common/logout.do', '2017-02-25 23:56:48', '登出成功(logout_success)');
INSERT INTO `tm_system_log` VALUES ('1291', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 15:50:48', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1292', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 15:50:52', 'true');
INSERT INTO `tm_system_log` VALUES ('1293', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 15:50:54', 'true');
INSERT INTO `tm_system_log` VALUES ('1294', '1', 'admin', 'P-QES-IMPORT', '/system/question/import.thtml', '2017-05-03 15:50:54', 'true');
INSERT INTO `tm_system_log` VALUES ('1295', '1', 'admin', 'P-PAPER-ADD', '/system/paper/add.thtml', '2017-05-03 15:50:54', 'true');
INSERT INTO `tm_system_log` VALUES ('1296', '1', 'admin', 'F-COURSE', '/system/course/list.thtml', '2017-05-03 15:50:56', 'true');
INSERT INTO `tm_system_log` VALUES ('1297', '1', 'admin', 'F-USERS', '/system/user/list.thtml', '2017-05-03 15:50:57', 'true');
INSERT INTO `tm_system_log` VALUES ('1298', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 15:51:00', 'true');
INSERT INTO `tm_system_log` VALUES ('1299', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 15:51:00', 'true');
INSERT INTO `tm_system_log` VALUES ('1300', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 16:53:53', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1301', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 16:54:03', 'true');
INSERT INTO `tm_system_log` VALUES ('1302', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 16:54:04', 'true');
INSERT INTO `tm_system_log` VALUES ('1303', '1', 'admin', 'P-QES-IMPORT', '/system/question/import.thtml', '2017-05-03 16:54:05', 'true');
INSERT INTO `tm_system_log` VALUES ('1304', '1', 'admin', 'P-PAPER-ADD', '/system/paper/fastadd.thtml', '2017-05-03 16:54:08', 'true');
INSERT INTO `tm_system_log` VALUES ('1305', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 16:54:09', 'true');
INSERT INTO `tm_system_log` VALUES ('1306', '1', 'admin', 'F-COURSE', '/system/course/list.thtml', '2017-05-03 16:54:12', 'true');
INSERT INTO `tm_system_log` VALUES ('1307', '1', 'admin', 'F-COURSE-CATEGORY', '/system/course/category/list.thtml', '2017-05-03 16:54:14', 'true');
INSERT INTO `tm_system_log` VALUES ('1308', '1', 'admin', 'F-COURSE-TEACHER', '/system/course/teacher/list.thtml', '2017-05-03 16:54:14', 'true');
INSERT INTO `tm_system_log` VALUES ('1309', '1', 'admin', 'F-NEWS', '/system/news/list.thtml', '2017-05-03 16:54:16', 'true');
INSERT INTO `tm_system_log` VALUES ('1310', '1', 'admin', 'F-NEWSCATE', '/system/news/category/list.thtml', '2017-05-03 16:54:17', 'true');
INSERT INTO `tm_system_log` VALUES ('1311', '1', 'admin', 'P-SYS-CONFIG', '/system/config/list.thtml', '2017-05-03 16:54:18', 'true');
INSERT INTO `tm_system_log` VALUES ('1312', '1', 'admin', 'P-SYS-CONFIG', '/system/config/update.do', '2017-05-03 16:54:28', 'true');
INSERT INTO `tm_system_log` VALUES ('1313', '1', 'admin', 'P-SYS-CONFIG', '/system/config/list.thtml', '2017-05-03 16:54:30', 'true');
INSERT INTO `tm_system_log` VALUES ('1314', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 16:54:31', 'true');
INSERT INTO `tm_system_log` VALUES ('1315', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 16:54:47', 'true');
INSERT INTO `tm_system_log` VALUES ('1316', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 16:54:48', 'true');
INSERT INTO `tm_system_log` VALUES ('1317', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 16:54:49', 'true');
INSERT INTO `tm_system_log` VALUES ('1318', '1', 'admin', 'P-QES-IMPORT', '/system/question/import.thtml', '2017-05-03 16:54:49', 'true');
INSERT INTO `tm_system_log` VALUES ('1319', '1', 'admin', 'F-ADMIN', '/system/admin/list.thtml', '2017-05-03 16:54:52', 'true');
INSERT INTO `tm_system_log` VALUES ('1320', '1', 'admin', 'P-SYS-CONFIG', '/system/config/list.thtml', '2017-05-03 16:54:52', 'true');
INSERT INTO `tm_system_log` VALUES ('1321', '1', 'admin', 'doLogout', '/common/logout.do', '2017-05-03 16:56:53', '登出成功(logout_success)');
INSERT INTO `tm_system_log` VALUES ('1322', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 17:25:11', '登录失败(login_failed),username=admin');
INSERT INTO `tm_system_log` VALUES ('1323', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 17:25:15', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1324', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:36:55', 'true');
INSERT INTO `tm_system_log` VALUES ('1325', '1', 'admin', 'P-PAPER-UPDATE', '/system/paper/load.thtml?pid=495a3765-577b-40bc-b054-7410320678e0', '2017-05-03 17:37:02', 'true');
INSERT INTO `tm_system_log` VALUES ('1326', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:37:05', 'true');
INSERT INTO `tm_system_log` VALUES ('1327', '1', 'admin', 'P-PAPER-DELETE', '/system/paper/delete.do?pid=495a3765-577b-40bc-b054-7410320678e0', '2017-05-03 17:37:09', 'true');
INSERT INTO `tm_system_log` VALUES ('1328', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:37:10', 'true');
INSERT INTO `tm_system_log` VALUES ('1329', '1', 'admin', 'P-PAPER-DELETE', '/system/paper/delete.do?pid=b86e090a-42dd-4f56-9fd2-d190f44594fb', '2017-05-03 17:37:13', 'true');
INSERT INTO `tm_system_log` VALUES ('1330', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:37:18', 'true');
INSERT INTO `tm_system_log` VALUES ('1331', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:37:20', 'true');
INSERT INTO `tm_system_log` VALUES ('1332', '1', 'admin', 'F-COURSE', '/system/course/list.thtml', '2017-05-03 17:37:30', 'true');
INSERT INTO `tm_system_log` VALUES ('1333', '1', 'admin', 'F-COURSE-CATEGORY', '/system/course/category/list.thtml', '2017-05-03 17:37:31', 'true');
INSERT INTO `tm_system_log` VALUES ('1334', '1', 'admin', 'F-COURSE-TEACHER', '/system/course/teacher/list.thtml', '2017-05-03 17:37:31', 'true');
INSERT INTO `tm_system_log` VALUES ('1335', '1', 'admin', 'P-PAPER-ADD', '/system/paper/add.thtml', '2017-05-03 17:37:32', 'true');
INSERT INTO `tm_system_log` VALUES ('1336', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:37:33', 'true');
INSERT INTO `tm_system_log` VALUES ('1337', '1', 'admin', 'P-QES-IMPORT', '/system/question/import.thtml', '2017-05-03 17:37:33', 'true');
INSERT INTO `tm_system_log` VALUES ('1338', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 17:37:34', 'true');
INSERT INTO `tm_system_log` VALUES ('1339', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 17:37:35', 'true');
INSERT INTO `tm_system_log` VALUES ('1340', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 17:37:36', 'true');
INSERT INTO `tm_system_log` VALUES ('1341', '1', 'admin', 'P-PAPER-ADD', '/system/paper/add.thtml', '2017-05-03 17:37:37', 'true');
INSERT INTO `tm_system_log` VALUES ('1342', '1', 'admin', 'P-PAPER-ADD', '/system/paper/fastadd.thtml', '2017-05-03 17:37:38', 'true');
INSERT INTO `tm_system_log` VALUES ('1343', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:37:38', 'true');
INSERT INTO `tm_system_log` VALUES ('1344', '1', 'admin', 'P-PAPER-HISTORY-VIEW', '/system/paper/history/list.thtml?pid=b86e090a-42dd-4f56-9fd2-d190f44594fb', '2017-05-03 17:37:42', 'true');
INSERT INTO `tm_system_log` VALUES ('1345', '1', 'admin', 'P-PAPER-HISTORY-REMOVE', '/system/paper/history/delete.do?eid=26327b7f-9261-43a1-9470-6d19f311c233&pid=b86e090a-42dd-4f56-9fd2-d190f44594fb&uid=76800b8f-4827-4732-94f4-729315cbfc18', '2017-05-03 17:37:46', 'true');
INSERT INTO `tm_system_log` VALUES ('1346', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:37:48', 'true');
INSERT INTO `tm_system_log` VALUES ('1347', '1', 'admin', 'P-PAPER-DELETE', '/system/paper/delete.do?pid=b86e090a-42dd-4f56-9fd2-d190f44594fb', '2017-05-03 17:37:50', 'true');
INSERT INTO `tm_system_log` VALUES ('1348', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:37:51', 'true');
INSERT INTO `tm_system_log` VALUES ('1349', '1', 'admin', 'P-PAPER-DELETE', '/system/paper/delete.do?pid=f4bdf052-f9c8-4deb-9f5d-ecc8bed2b23b', '2017-05-03 17:37:53', 'true');
INSERT INTO `tm_system_log` VALUES ('1350', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:37:55', 'true');
INSERT INTO `tm_system_log` VALUES ('1351', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:37:56', 'true');
INSERT INTO `tm_system_log` VALUES ('1352', '1', 'admin', 'P-PAPER-ADD', '/system/paper/fastadd.thtml', '2017-05-03 17:37:56', 'true');
INSERT INTO `tm_system_log` VALUES ('1353', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:37:56', 'true');
INSERT INTO `tm_system_log` VALUES ('1354', '1', 'admin', 'P-ANA-PAPER', '/system/analysis/paper/index.thtml', '2017-05-03 17:37:59', 'true');
INSERT INTO `tm_system_log` VALUES ('1355', '1', 'admin', 'P-ANA-EXAM', '/system/analysis/exam/index.thtml', '2017-05-03 17:38:02', 'true');
INSERT INTO `tm_system_log` VALUES ('1356', '1', 'admin', 'P-ANA-SCORE', '/system/analysis/score/index.thtml', '2017-05-03 17:38:03', 'true');
INSERT INTO `tm_system_log` VALUES ('1357', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:38:04', 'true');
INSERT INTO `tm_system_log` VALUES ('1358', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:38:05', 'true');
INSERT INTO `tm_system_log` VALUES ('1359', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:38:07', 'true');
INSERT INTO `tm_system_log` VALUES ('1360', '1', 'admin', 'F-COURSE-CATEGORY', '/system/course/category/list.thtml', '2017-05-03 17:38:11', 'true');
INSERT INTO `tm_system_log` VALUES ('1361', '1', 'admin', 'F-COURSE', '/system/course/list.thtml', '2017-05-03 17:38:12', 'true');
INSERT INTO `tm_system_log` VALUES ('1362', '1', 'admin', 'F-USERS', '/system/user/list.thtml', '2017-05-03 17:38:13', 'true');
INSERT INTO `tm_system_log` VALUES ('1363', '1', 'admin', 'P-USER-DELETE', '/system/user/batchop.do', '2017-05-03 17:38:22', 'true');
INSERT INTO `tm_system_log` VALUES ('1364', '1', 'admin', 'F-USERS', '/system/user/list.thtml', '2017-05-03 17:38:25', 'true');
INSERT INTO `tm_system_log` VALUES ('1365', '1', 'admin', 'F-COURSE-CATEGORY', '/system/course/category/list.thtml', '2017-05-03 17:38:26', 'true');
INSERT INTO `tm_system_log` VALUES ('1366', '1', 'admin', 'F-COURSE', '/system/course/list.thtml', '2017-05-03 17:38:27', 'true');
INSERT INTO `tm_system_log` VALUES ('1367', '1', 'admin', 'P-ANA-SCORE', '/system/analysis/score/index.thtml', '2017-05-03 17:38:28', 'true');
INSERT INTO `tm_system_log` VALUES ('1368', '1', 'admin', 'P-ANA-EXAM', '/system/analysis/exam/index.thtml', '2017-05-03 17:38:28', 'true');
INSERT INTO `tm_system_log` VALUES ('1369', '1', 'admin', 'P-ANA-PAPER', '/system/analysis/paper/index.thtml', '2017-05-03 17:38:29', 'true');
INSERT INTO `tm_system_log` VALUES ('1370', '1', 'admin', 'P-ANA-EXAM', '/system/analysis/exam/index.thtml', '2017-05-03 17:38:36', 'true');
INSERT INTO `tm_system_log` VALUES ('1371', '1', 'admin', 'P-ANA-SCORE', '/system/analysis/score/index.thtml', '2017-05-03 17:38:37', 'true');
INSERT INTO `tm_system_log` VALUES ('1372', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:38:37', 'true');
INSERT INTO `tm_system_log` VALUES ('1373', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:38:39', 'true');
INSERT INTO `tm_system_log` VALUES ('1374', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:38:39', 'true');
INSERT INTO `tm_system_log` VALUES ('1375', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:38:40', 'true');
INSERT INTO `tm_system_log` VALUES ('1376', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:38:41', 'true');
INSERT INTO `tm_system_log` VALUES ('1377', '1', 'admin', 'P-PAPER-CATE-DELETE', '/system/paper/category/delete.do?id=4909eb01-d045-4434-9656-06e128fbf19e', '2017-05-03 17:38:43', 'true');
INSERT INTO `tm_system_log` VALUES ('1378', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:38:44', 'true');
INSERT INTO `tm_system_log` VALUES ('1379', '1', 'admin', 'P-PAPER-CATE-DELETE', '/system/paper/category/delete.do?id=6c716e58-3b35-4197-be32-20a21267a1d4', '2017-05-03 17:38:46', 'true');
INSERT INTO `tm_system_log` VALUES ('1380', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:38:50', 'true');
INSERT INTO `tm_system_log` VALUES ('1381', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:38:52', 'true');
INSERT INTO `tm_system_log` VALUES ('1382', '1', 'admin', 'P-PAPER-DELETE', '/system/paper/delete.do?pid=f4bdf052-f9c8-4deb-9f5d-ecc8bed2b23b', '2017-05-03 17:38:55', 'true');
INSERT INTO `tm_system_log` VALUES ('1383', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:39:00', 'true');
INSERT INTO `tm_system_log` VALUES ('1384', '1', 'admin', 'P-PAPER-ADD', '/system/paper/add.thtml', '2017-05-03 17:39:03', 'true');
INSERT INTO `tm_system_log` VALUES ('1385', '1', 'admin', 'P-PAPER-ADD', '/system/paper/fastadd.thtml', '2017-05-03 17:39:04', 'true');
INSERT INTO `tm_system_log` VALUES ('1386', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:39:05', 'true');
INSERT INTO `tm_system_log` VALUES ('1387', '1', 'admin', 'P-SYS-CONFIG', '/system/config/list.thtml', '2017-05-03 17:39:11', 'true');
INSERT INTO `tm_system_log` VALUES ('1388', '1', 'admin', 'F-UPOSITION', '/system/userposition/list.thtml', '2017-05-03 17:39:25', 'true');
INSERT INTO `tm_system_log` VALUES ('1389', '1', 'admin', 'F-ROLE', '/system/role/list.thtml', '2017-05-03 17:39:32', 'true');
INSERT INTO `tm_system_log` VALUES ('1390', '1', 'admin', 'F-ADMIN', '/system/admin/list.thtml', '2017-05-03 17:39:33', 'true');
INSERT INTO `tm_system_log` VALUES ('1391', '1', 'admin', 'F-ROLE', '/system/role/list.thtml', '2017-05-03 17:39:33', 'true');
INSERT INTO `tm_system_log` VALUES ('1392', '1', 'admin', 'F-ADMIN', '/system/admin/list.thtml', '2017-05-03 17:39:36', 'true');
INSERT INTO `tm_system_log` VALUES ('1393', '1', 'admin', 'F-ROLE', '/system/role/list.thtml', '2017-05-03 17:39:38', 'true');
INSERT INTO `tm_system_log` VALUES ('1394', '1', 'admin', 'F-BRANCH', '/system/branch/list.thtml', '2017-05-03 17:39:39', 'true');
INSERT INTO `tm_system_log` VALUES ('1395', '1', 'admin', 'P-BRANCH-DELETE', '/system/branch/delete.do?id=827ea7bb-138d-425e-9fdf-13e97172b039', '2017-05-03 17:39:42', 'true');
INSERT INTO `tm_system_log` VALUES ('1396', '1', 'admin', 'F-BRANCH', '/system/branch/list.thtml', '2017-05-03 17:39:43', 'true');
INSERT INTO `tm_system_log` VALUES ('1397', '1', 'admin', 'F-BRANCH', '/system/branch/list.thtml', '2017-05-03 17:39:45', 'true');
INSERT INTO `tm_system_log` VALUES ('1398', '1', 'admin', 'F-USERS', '/system/user/list.thtml', '2017-05-03 17:39:45', 'true');
INSERT INTO `tm_system_log` VALUES ('1399', '1', 'admin', 'F-COURSE-TEACHER', '/system/course/teacher/list.thtml', '2017-05-03 17:39:46', 'true');
INSERT INTO `tm_system_log` VALUES ('1400', '1', 'admin', 'F-COURSE-CATEGORY', '/system/course/category/list.thtml', '2017-05-03 17:39:47', 'true');
INSERT INTO `tm_system_log` VALUES ('1401', '1', 'admin', 'F-COURSE', '/system/course/list.thtml', '2017-05-03 17:39:47', 'true');
INSERT INTO `tm_system_log` VALUES ('1402', '1', 'admin', 'P-ANA-SCORE', '/system/analysis/score/index.thtml', '2017-05-03 17:39:48', 'true');
INSERT INTO `tm_system_log` VALUES ('1403', '1', 'admin', 'P-ANA-EXAM', '/system/analysis/exam/index.thtml', '2017-05-03 17:39:49', 'true');
INSERT INTO `tm_system_log` VALUES ('1404', '1', 'admin', 'P-ANA-PAPER', '/system/analysis/paper/index.thtml', '2017-05-03 17:39:50', 'true');
INSERT INTO `tm_system_log` VALUES ('1405', '1', 'admin', 'P-ANA-PAPER', '/system/analysis/paper/detail.thtml?pid=f4bdf052-f9c8-4deb-9f5d-ecc8bed2b23b', '2017-05-03 17:39:51', 'true');
INSERT INTO `tm_system_log` VALUES ('1406', '1', 'admin', 'P-ANA-PAPER', '/system/analysis/paper/index.thtml', '2017-05-03 17:39:58', 'true');
INSERT INTO `tm_system_log` VALUES ('1407', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:40:05', 'true');
INSERT INTO `tm_system_log` VALUES ('1408', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:40:05', 'true');
INSERT INTO `tm_system_log` VALUES ('1409', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:40:06', 'true');
INSERT INTO `tm_system_log` VALUES ('1410', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:40:07', 'true');
INSERT INTO `tm_system_log` VALUES ('1411', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:40:08', 'true');
INSERT INTO `tm_system_log` VALUES ('1412', '1', 'admin', 'P-PAPER-CATE-DELETE', '/system/paper/category/delete.do?id=6c716e58-3b35-4197-be32-20a21267a1d4', '2017-05-03 17:40:09', 'true');
INSERT INTO `tm_system_log` VALUES ('1413', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:40:10', 'true');
INSERT INTO `tm_system_log` VALUES ('1414', '1', 'admin', 'P-PAPER-CATE-UPDATE', '/system/paper/category/load.thtml?id=6c716e58-3b35-4197-be32-20a21267a1d4', '2017-05-03 17:40:13', 'true');
INSERT INTO `tm_system_log` VALUES ('1415', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:40:17', 'true');
INSERT INTO `tm_system_log` VALUES ('1416', '1', 'admin', 'P-PAPER-HISTORY-VIEW', '/system/paper/history/list.thtml?pid=f4bdf052-f9c8-4deb-9f5d-ecc8bed2b23b', '2017-05-03 17:40:20', 'true');
INSERT INTO `tm_system_log` VALUES ('1417', '1', 'admin', 'P-PAPER-HISTORY-REMOVE', '/system/paper/history/delete.do?eid=4de66164-1cdb-478f-b020-7e79f83fa5da&pid=f4bdf052-f9c8-4deb-9f5d-ecc8bed2b23b&uid=76800b8f-4827-4732-94f4-729315cbfc18', '2017-05-03 17:40:23', 'true');
INSERT INTO `tm_system_log` VALUES ('1418', '1', 'admin', 'P-PAPER-HISTORY-VIEW', '/system/paper/history/list.thtml?pid=f4bdf052-f9c8-4deb-9f5d-ecc8bed2b23b', '2017-05-03 17:40:24', 'true');
INSERT INTO `tm_system_log` VALUES ('1419', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:40:26', 'true');
INSERT INTO `tm_system_log` VALUES ('1420', '1', 'admin', 'P-PAPER-CATE-DELETE', '/system/paper/category/delete.do?id=6c716e58-3b35-4197-be32-20a21267a1d4', '2017-05-03 17:40:27', 'true');
INSERT INTO `tm_system_log` VALUES ('1421', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:40:29', 'true');
INSERT INTO `tm_system_log` VALUES ('1422', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:40:30', 'true');
INSERT INTO `tm_system_log` VALUES ('1423', '1', 'admin', 'P-PAPER-DELETE', '/system/paper/delete.do?pid=f4bdf052-f9c8-4deb-9f5d-ecc8bed2b23b', '2017-05-03 17:40:33', 'true');
INSERT INTO `tm_system_log` VALUES ('1424', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:40:34', 'true');
INSERT INTO `tm_system_log` VALUES ('1425', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:40:35', 'true');
INSERT INTO `tm_system_log` VALUES ('1426', '1', 'admin', 'P-PAPER-CATE-DELETE', '/system/paper/category/delete.do?id=6c716e58-3b35-4197-be32-20a21267a1d4', '2017-05-03 17:40:37', 'true');
INSERT INTO `tm_system_log` VALUES ('1427', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:40:38', 'true');
INSERT INTO `tm_system_log` VALUES ('1428', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:40:39', 'true');
INSERT INTO `tm_system_log` VALUES ('1429', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:40:47', 'true');
INSERT INTO `tm_system_log` VALUES ('1430', '1', 'admin', 'P-QES-IMPORT', '/system/question/import.thtml', '2017-05-03 17:40:48', 'true');
INSERT INTO `tm_system_log` VALUES ('1431', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:40:49', 'true');
INSERT INTO `tm_system_log` VALUES ('1432', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 17:40:49', 'true');
INSERT INTO `tm_system_log` VALUES ('1433', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:40:50', 'true');
INSERT INTO `tm_system_log` VALUES ('1434', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:40:58', 'true');
INSERT INTO `tm_system_log` VALUES ('1435', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=19fbe701-7c09-4443-89bb-87508d98fa80', '2017-05-03 17:41:04', 'true');
INSERT INTO `tm_system_log` VALUES ('1436', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:05', 'true');
INSERT INTO `tm_system_log` VALUES ('1437', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=3d32160b-fe77-4a72-9386-fdbf9dbe63e1', '2017-05-03 17:41:12', 'true');
INSERT INTO `tm_system_log` VALUES ('1438', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:13', 'true');
INSERT INTO `tm_system_log` VALUES ('1439', '1', 'admin', 'P-QES-UPDATE', '/system/question/load.thtml?qid=844f0fad-7fab-41c0-b061-3d8cc5e6e6b8', '2017-05-03 17:41:14', 'true');
INSERT INTO `tm_system_log` VALUES ('1440', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:17', 'true');
INSERT INTO `tm_system_log` VALUES ('1441', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=844f0fad-7fab-41c0-b061-3d8cc5e6e6b8', '2017-05-03 17:41:20', 'true');
INSERT INTO `tm_system_log` VALUES ('1442', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:21', 'true');
INSERT INTO `tm_system_log` VALUES ('1443', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=e4f9a82d-1609-42ec-a659-73bcc9195c20', '2017-05-03 17:41:22', 'true');
INSERT INTO `tm_system_log` VALUES ('1444', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:23', 'true');
INSERT INTO `tm_system_log` VALUES ('1445', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=e7e49e62-9efd-40db-9547-dc04ac25aad9', '2017-05-03 17:41:25', 'true');
INSERT INTO `tm_system_log` VALUES ('1446', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:25', 'true');
INSERT INTO `tm_system_log` VALUES ('1447', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=17a15e0c-f120-4bd2-bd36-ca00f473e24d', '2017-05-03 17:41:27', 'true');
INSERT INTO `tm_system_log` VALUES ('1448', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:28', 'true');
INSERT INTO `tm_system_log` VALUES ('1449', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=3255646b-3e61-42ca-b362-6ec308e07d6e', '2017-05-03 17:41:30', 'true');
INSERT INTO `tm_system_log` VALUES ('1450', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:30', 'true');
INSERT INTO `tm_system_log` VALUES ('1451', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=363add9c-72d5-466d-a521-410f38cedd82', '2017-05-03 17:41:32', 'true');
INSERT INTO `tm_system_log` VALUES ('1452', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:33', 'true');
INSERT INTO `tm_system_log` VALUES ('1453', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=48711712-59d6-4631-8840-e8f88709a4d5', '2017-05-03 17:41:34', 'true');
INSERT INTO `tm_system_log` VALUES ('1454', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:35', 'true');
INSERT INTO `tm_system_log` VALUES ('1455', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=824df8ca-641e-4cc7-bfbc-229b1c3675ca', '2017-05-03 17:41:37', 'true');
INSERT INTO `tm_system_log` VALUES ('1456', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:37', 'true');
INSERT INTO `tm_system_log` VALUES ('1457', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=a4fc9bbd-4594-42c9-a5ba-9bd6ea1588dd', '2017-05-03 17:41:39', 'true');
INSERT INTO `tm_system_log` VALUES ('1458', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:40', 'true');
INSERT INTO `tm_system_log` VALUES ('1459', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=c595c912-17d1-4316-8d5c-3e51bdf7e933', '2017-05-03 17:41:43', 'true');
INSERT INTO `tm_system_log` VALUES ('1460', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:43', 'true');
INSERT INTO `tm_system_log` VALUES ('1461', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=c6f898ac-6ac9-441f-8179-0780b3c1db22', '2017-05-03 17:41:50', 'true');
INSERT INTO `tm_system_log` VALUES ('1462', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:50', 'true');
INSERT INTO `tm_system_log` VALUES ('1463', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=f20a9f53-f4f3-4f04-b38e-cd6515a3cb9a', '2017-05-03 17:41:53', 'true');
INSERT INTO `tm_system_log` VALUES ('1464', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:53', 'true');
INSERT INTO `tm_system_log` VALUES ('1465', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=f44ed38b-0cf7-4e43-be9b-66a7eae15ee2', '2017-05-03 17:41:55', 'true');
INSERT INTO `tm_system_log` VALUES ('1466', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:55', 'true');
INSERT INTO `tm_system_log` VALUES ('1467', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=17ccfa68-b08c-4fb8-a423-e1735aca9b23', '2017-05-03 17:41:57', 'true');
INSERT INTO `tm_system_log` VALUES ('1468', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:57', 'true');
INSERT INTO `tm_system_log` VALUES ('1469', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=1affb9f8-d36b-4c3d-b04b-85ac4a81e0c7', '2017-05-03 17:41:59', 'true');
INSERT INTO `tm_system_log` VALUES ('1470', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:41:59', 'true');
INSERT INTO `tm_system_log` VALUES ('1471', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=2b94d57e-d5cb-408b-902d-9c5421c6fc4a', '2017-05-03 17:42:01', 'true');
INSERT INTO `tm_system_log` VALUES ('1472', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:42:01', 'true');
INSERT INTO `tm_system_log` VALUES ('1473', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=37a28a88-08bf-4a58-b6fd-028dd9d9e243', '2017-05-03 17:42:03', 'true');
INSERT INTO `tm_system_log` VALUES ('1474', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:42:04', 'true');
INSERT INTO `tm_system_log` VALUES ('1475', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=4082d364-b446-44c3-b9a1-48bbfa8de91a', '2017-05-03 17:42:07', 'true');
INSERT INTO `tm_system_log` VALUES ('1476', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:42:08', 'true');
INSERT INTO `tm_system_log` VALUES ('1477', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=6229f8fb-c7a8-4755-969f-8e604ac94be1', '2017-05-03 17:42:09', 'true');
INSERT INTO `tm_system_log` VALUES ('1478', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:42:10', 'true');
INSERT INTO `tm_system_log` VALUES ('1479', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=89deca48-97e2-4cf9-a9c7-fb7cf14076d8', '2017-05-03 17:42:12', 'true');
INSERT INTO `tm_system_log` VALUES ('1480', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:42:14', 'true');
INSERT INTO `tm_system_log` VALUES ('1481', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=9055e943-62b0-421a-8d0f-e5e25273bc67', '2017-05-03 17:42:15', 'true');
INSERT INTO `tm_system_log` VALUES ('1482', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:42:16', 'true');
INSERT INTO `tm_system_log` VALUES ('1483', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=af7fc705-b38b-49ae-ad63-54c3d2499d92', '2017-05-03 17:42:18', 'true');
INSERT INTO `tm_system_log` VALUES ('1484', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:42:19', 'true');
INSERT INTO `tm_system_log` VALUES ('1485', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=c15301d6-35d7-427f-a72c-5b07d86e30a5', '2017-05-03 17:43:40', 'true');
INSERT INTO `tm_system_log` VALUES ('1486', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:43:41', 'true');
INSERT INTO `tm_system_log` VALUES ('1487', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=00be0845-acaa-4d32-a002-0f5f843b3575', '2017-05-03 17:43:42', 'true');
INSERT INTO `tm_system_log` VALUES ('1488', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:43:43', 'true');
INSERT INTO `tm_system_log` VALUES ('1489', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=1e65e7a9-2005-4cdf-9419-d14d4327ab8a', '2017-05-03 17:43:44', 'true');
INSERT INTO `tm_system_log` VALUES ('1490', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:43:45', 'true');
INSERT INTO `tm_system_log` VALUES ('1491', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=246297ee-d1a5-41d0-adaa-b14d517d97a9', '2017-05-03 17:43:46', 'true');
INSERT INTO `tm_system_log` VALUES ('1492', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:43:47', 'true');
INSERT INTO `tm_system_log` VALUES ('1493', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=2d58eee2-33e0-4334-8259-9a16c23f6832', '2017-05-03 17:43:48', 'true');
INSERT INTO `tm_system_log` VALUES ('1494', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:43:49', 'true');
INSERT INTO `tm_system_log` VALUES ('1495', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=3bab31fa-9676-49b7-b642-1b3098fc2819', '2017-05-03 17:43:52', 'true');
INSERT INTO `tm_system_log` VALUES ('1496', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:43:53', 'true');
INSERT INTO `tm_system_log` VALUES ('1497', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=422d18ce-2092-4f6c-a8e9-b0971421e65b', '2017-05-03 17:43:54', 'true');
INSERT INTO `tm_system_log` VALUES ('1498', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:43:55', 'true');
INSERT INTO `tm_system_log` VALUES ('1499', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=515c7c31-db05-4ee8-b802-7dca0bd08c8d', '2017-05-03 17:43:56', 'true');
INSERT INTO `tm_system_log` VALUES ('1500', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:43:57', 'true');
INSERT INTO `tm_system_log` VALUES ('1501', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=68c584f9-d1a7-43cc-b325-d619c7385ec8', '2017-05-03 17:43:58', 'true');
INSERT INTO `tm_system_log` VALUES ('1502', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:43:59', 'true');
INSERT INTO `tm_system_log` VALUES ('1503', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=6aa0e536-a5a4-4eda-a58c-0be064599ca9', '2017-05-03 17:44:00', 'true');
INSERT INTO `tm_system_log` VALUES ('1504', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:44:01', 'true');
INSERT INTO `tm_system_log` VALUES ('1505', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=7f4298a1-7967-484b-bcba-d688bb376348', '2017-05-03 17:44:02', 'true');
INSERT INTO `tm_system_log` VALUES ('1506', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:44:03', 'true');
INSERT INTO `tm_system_log` VALUES ('1507', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=8101d76a-501f-4824-befd-812d3c1ed2ff', '2017-05-03 17:44:04', 'true');
INSERT INTO `tm_system_log` VALUES ('1508', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:44:05', 'true');
INSERT INTO `tm_system_log` VALUES ('1509', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=aa55ff1e-e183-41aa-a830-b855d77382e2', '2017-05-03 17:44:08', 'true');
INSERT INTO `tm_system_log` VALUES ('1510', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:44:09', 'true');
INSERT INTO `tm_system_log` VALUES ('1511', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=b26bccad-f138-4f67-bc32-85b4dc755579', '2017-05-03 17:44:10', 'true');
INSERT INTO `tm_system_log` VALUES ('1512', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:44:11', 'true');
INSERT INTO `tm_system_log` VALUES ('1513', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=d0aaf4be-f05a-498d-a83b-35dfe41bfa49', '2017-05-03 17:44:13', 'true');
INSERT INTO `tm_system_log` VALUES ('1514', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:44:14', 'true');
INSERT INTO `tm_system_log` VALUES ('1515', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=d28161c9-29ef-4bf6-94f4-588d2b7dcc68', '2017-05-03 17:44:16', 'true');
INSERT INTO `tm_system_log` VALUES ('1516', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:44:16', 'true');
INSERT INTO `tm_system_log` VALUES ('1517', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=f27ca2e4-c511-45df-afc7-6534c909190e', '2017-05-03 17:44:18', 'true');
INSERT INTO `tm_system_log` VALUES ('1518', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:44:19', 'true');
INSERT INTO `tm_system_log` VALUES ('1519', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=f5d68879-a9dd-438b-9389-cc1ec6c7fd6a', '2017-05-03 17:44:20', 'true');
INSERT INTO `tm_system_log` VALUES ('1520', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:44:21', 'true');
INSERT INTO `tm_system_log` VALUES ('1521', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=f8c27356-cf28-4d6b-9fbd-9dd355603711', '2017-05-03 17:44:22', 'true');
INSERT INTO `tm_system_log` VALUES ('1522', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:44:22', 'true');
INSERT INTO `tm_system_log` VALUES ('1523', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=fba4649a-f6a4-4f53-921c-089b881dfd32', '2017-05-03 17:44:24', 'true');
INSERT INTO `tm_system_log` VALUES ('1524', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:44:24', 'true');
INSERT INTO `tm_system_log` VALUES ('1525', '1', 'admin', 'P-QES-DELETE', '/system/question/delete.do?qid=ffd4e580-c453-4912-9767-38df2537f6ee', '2017-05-03 17:44:26', 'true');
INSERT INTO `tm_system_log` VALUES ('1526', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:44:26', 'true');
INSERT INTO `tm_system_log` VALUES ('1527', '1', 'admin', 'P-PAPER-ADD', '/system/paper/add.thtml', '2017-05-03 17:44:28', 'true');
INSERT INTO `tm_system_log` VALUES ('1528', '1', 'admin', 'P-PAPER-ADD', '/system/paper/fastadd.thtml', '2017-05-03 17:44:28', 'true');
INSERT INTO `tm_system_log` VALUES ('1529', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:44:29', 'true');
INSERT INTO `tm_system_log` VALUES ('1530', '1', 'admin', 'P-QES-IMPORT', '/system/question/import.thtml', '2017-05-03 17:44:30', 'true');
INSERT INTO `tm_system_log` VALUES ('1531', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 17:44:30', 'true');
INSERT INTO `tm_system_log` VALUES ('1532', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 17:44:30', 'true');
INSERT INTO `tm_system_log` VALUES ('1533', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 17:44:31', 'true');
INSERT INTO `tm_system_log` VALUES ('1534', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 17:44:32', 'true');
INSERT INTO `tm_system_log` VALUES ('1535', '1', 'admin', 'P-QDB-DELETE', '/system/qdb/delete.do?id=9ef3867b-be99-459e-ad4a-79d1eabaa0ec', '2017-05-03 17:44:35', 'true');
INSERT INTO `tm_system_log` VALUES ('1536', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 17:44:37', 'true');
INSERT INTO `tm_system_log` VALUES ('1537', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 17:44:37', 'true');
INSERT INTO `tm_system_log` VALUES ('1538', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 17:44:38', 'true');
INSERT INTO `tm_system_log` VALUES ('1539', '1', 'admin', 'F-BRANCH', '/system/branch/list.thtml', '2017-05-03 17:44:39', 'true');
INSERT INTO `tm_system_log` VALUES ('1540', '1', 'admin', 'F-UPOSITION', '/system/userposition/list.thtml', '2017-05-03 17:44:40', 'true');
INSERT INTO `tm_system_log` VALUES ('1541', '1', 'admin', 'P-UPOSITION-DELETE', '/system/userposition/delete.do?id=3da6a11e-c646-477a-bc4c-62c9856dcca0', '2017-05-03 17:44:45', 'true');
INSERT INTO `tm_system_log` VALUES ('1542', '1', 'admin', 'F-UPOSITION', '/system/userposition/list.thtml', '2017-05-03 17:44:46', 'true');
INSERT INTO `tm_system_log` VALUES ('1543', '1', 'admin', 'F-BRANCH', '/system/branch/list.thtml', '2017-05-03 17:44:47', 'true');
INSERT INTO `tm_system_log` VALUES ('1544', '1', 'admin', 'F-USERS', '/system/user/list.thtml', '2017-05-03 17:44:48', 'true');
INSERT INTO `tm_system_log` VALUES ('1545', '1', 'admin', 'F-NEWSCATE', '/system/news/category/list.thtml', '2017-05-03 17:44:49', 'true');
INSERT INTO `tm_system_log` VALUES ('1546', '1', 'admin', 'F-NEWS', '/system/news/list.thtml', '2017-05-03 17:44:50', 'true');
INSERT INTO `tm_system_log` VALUES ('1547', '1', 'admin', 'F-NEWSCATE', '/system/news/category/list.thtml', '2017-05-03 17:44:51', 'true');
INSERT INTO `tm_system_log` VALUES ('1548', '1', 'admin', 'P-NEWSCATE-DELETE', '/system/news/category/delete.do?cid=ec18ebd1-75f5-4a74-8be6-eba3efece1a4', '2017-05-03 17:44:53', 'true');
INSERT INTO `tm_system_log` VALUES ('1549', '1', 'admin', 'F-NEWSCATE', '/system/news/category/list.thtml', '2017-05-03 17:44:55', 'true');
INSERT INTO `tm_system_log` VALUES ('1550', '1', 'admin', 'P-NEWSCATE-DELETE', '/system/news/category/delete.do?cid=ec18ebd1-75f5-4a74-8be6-eba3efece1a4', '2017-05-03 17:44:58', 'true');
INSERT INTO `tm_system_log` VALUES ('1551', '1', 'admin', 'F-NEWSCATE', '/system/news/category/list.thtml', '2017-05-03 17:44:59', 'true');
INSERT INTO `tm_system_log` VALUES ('1552', '1', 'admin', 'P-NEWSCATE-DELETE', '/system/news/category/delete.do?cid=5fc58891-883f-462c-b29e-1ce1a115f487', '2017-05-03 17:45:01', 'true');
INSERT INTO `tm_system_log` VALUES ('1553', '1', 'admin', 'F-NEWSCATE', '/system/news/category/list.thtml', '2017-05-03 17:45:03', 'true');
INSERT INTO `tm_system_log` VALUES ('1554', '1', 'admin', 'F-NEWS', '/system/news/list.thtml', '2017-05-03 17:45:06', 'true');
INSERT INTO `tm_system_log` VALUES ('1555', '1', 'admin', 'P-NEWS-DELETE', '/system/news/delete.do?id=acf3d5f1-197f-4520-9c89-d1460edea4b3', '2017-05-03 17:45:10', 'true');
INSERT INTO `tm_system_log` VALUES ('1556', '1', 'admin', 'F-NEWS', '/system/news/list.thtml', '2017-05-03 17:45:11', 'true');
INSERT INTO `tm_system_log` VALUES ('1557', '1', 'admin', 'P-NEWS-DELETE', '/system/news/delete.do?id=7f056917-39a3-4f4d-a4cc-72a65b098162', '2017-05-03 17:45:15', 'true');
INSERT INTO `tm_system_log` VALUES ('1558', '1', 'admin', 'F-NEWS', '/system/news/list.thtml', '2017-05-03 17:45:16', 'true');
INSERT INTO `tm_system_log` VALUES ('1559', '1', 'admin', 'P-NEWS-DELETE', '/system/news/delete.do?id=5e1cd257-03d8-440d-867e-8270ab4dc77c', '2017-05-03 17:45:17', 'true');
INSERT INTO `tm_system_log` VALUES ('1560', '1', 'admin', 'F-NEWS', '/system/news/list.thtml', '2017-05-03 17:45:18', 'true');
INSERT INTO `tm_system_log` VALUES ('1561', '1', 'admin', 'P-NEWS-DELETE', '/system/news/delete.do?id=79716ce6-7cc1-4b8f-8fd9-d1de48a7643b', '2017-05-03 17:45:19', 'true');
INSERT INTO `tm_system_log` VALUES ('1562', '1', 'admin', 'F-NEWS', '/system/news/list.thtml', '2017-05-03 17:45:20', 'true');
INSERT INTO `tm_system_log` VALUES ('1563', '1', 'admin', 'P-NEWS-DELETE', '/system/news/delete.do?id=85ea4b2e-5ebd-4ff0-a6fd-fd73a7ef78b4', '2017-05-03 17:45:22', 'true');
INSERT INTO `tm_system_log` VALUES ('1564', '1', 'admin', 'F-NEWS', '/system/news/list.thtml', '2017-05-03 17:45:23', 'true');
INSERT INTO `tm_system_log` VALUES ('1565', '1', 'admin', 'P-NEWS-DELETE', '/system/news/delete.do?id=d76c2751-6447-4b80-a46f-75b40d97c621', '2017-05-03 17:45:24', 'true');
INSERT INTO `tm_system_log` VALUES ('1566', '1', 'admin', 'F-NEWS', '/system/news/list.thtml', '2017-05-03 17:45:25', 'true');
INSERT INTO `tm_system_log` VALUES ('1567', '1', 'admin', 'P-NEWS-DELETE', '/system/news/delete.do?id=daf8e583-ee6c-42b2-ab63-66c86c288489', '2017-05-03 17:45:26', 'true');
INSERT INTO `tm_system_log` VALUES ('1568', '1', 'admin', 'F-NEWS', '/system/news/list.thtml', '2017-05-03 17:45:27', 'true');
INSERT INTO `tm_system_log` VALUES ('1569', '1', 'admin', 'F-NEWS', '/system/news/list.thtml', '2017-05-03 17:45:32', 'true');
INSERT INTO `tm_system_log` VALUES ('1570', '1', 'admin', 'F-NEWSCATE', '/system/news/category/list.thtml', '2017-05-03 17:45:33', 'true');
INSERT INTO `tm_system_log` VALUES ('1571', '1', 'admin', 'P-NEWSCATE-DELETE', '/system/news/category/delete.do?cid=ec18ebd1-75f5-4a74-8be6-eba3efece1a4', '2017-05-03 17:45:35', 'true');
INSERT INTO `tm_system_log` VALUES ('1572', '1', 'admin', 'F-NEWSCATE', '/system/news/category/list.thtml', '2017-05-03 17:45:35', 'true');
INSERT INTO `tm_system_log` VALUES ('1573', '1', 'admin', 'P-NEWSCATE-DELETE', '/system/news/category/delete.do?cid=5fc58891-883f-462c-b29e-1ce1a115f487', '2017-05-03 17:45:37', 'true');
INSERT INTO `tm_system_log` VALUES ('1574', '1', 'admin', 'F-NEWSCATE', '/system/news/category/list.thtml', '2017-05-03 17:45:37', 'true');
INSERT INTO `tm_system_log` VALUES ('1575', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 17:45:39', 'true');
INSERT INTO `tm_system_log` VALUES ('1576', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 17:45:40', 'true');
INSERT INTO `tm_system_log` VALUES ('1577', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 17:45:40', 'true');
INSERT INTO `tm_system_log` VALUES ('1578', '1', 'admin', 'P-QES-IMPORT', '/system/question/import.thtml', '2017-05-03 17:45:40', 'true');
INSERT INTO `tm_system_log` VALUES ('1579', '1', 'admin', 'P-QES-IMPORT', '/system/question/import.thtml', '2017-05-03 17:45:41', 'true');
INSERT INTO `tm_system_log` VALUES ('1580', '1', 'admin', 'P-PAPER-ADD', '/system/paper/add.thtml', '2017-05-03 17:45:41', 'true');
INSERT INTO `tm_system_log` VALUES ('1581', '1', 'admin', 'P-PAPER-ADD', '/system/paper/fastadd.thtml', '2017-05-03 17:45:41', 'true');
INSERT INTO `tm_system_log` VALUES ('1582', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-03 17:45:42', 'true');
INSERT INTO `tm_system_log` VALUES ('1583', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:45:42', 'true');
INSERT INTO `tm_system_log` VALUES ('1584', '1', 'admin', 'P-ANA-PAPER', '/system/analysis/paper/index.thtml', '2017-05-03 17:45:43', 'true');
INSERT INTO `tm_system_log` VALUES ('1585', '1', 'admin', 'P-ANA-SCORE', '/system/analysis/score/index.thtml', '2017-05-03 17:45:43', 'true');
INSERT INTO `tm_system_log` VALUES ('1586', '1', 'admin', 'P-ANA-SCORE', '/system/analysis/score/index.thtml', '2017-05-03 17:45:44', 'true');
INSERT INTO `tm_system_log` VALUES ('1587', '1', 'admin', 'F-COURSE-CATEGORY', '/system/course/category/list.thtml', '2017-05-03 17:45:44', 'true');
INSERT INTO `tm_system_log` VALUES ('1588', '1', 'admin', 'F-COURSE', '/system/course/list.thtml', '2017-05-03 17:45:45', 'true');
INSERT INTO `tm_system_log` VALUES ('1589', '1', 'admin', 'F-COURSE-TEACHER', '/system/course/teacher/list.thtml', '2017-05-03 17:45:45', 'true');
INSERT INTO `tm_system_log` VALUES ('1590', '1', 'admin', 'F-USERS', '/system/user/list.thtml', '2017-05-03 17:45:46', 'true');
INSERT INTO `tm_system_log` VALUES ('1591', '1', 'admin', 'F-BRANCH', '/system/branch/list.thtml', '2017-05-03 17:45:46', 'true');
INSERT INTO `tm_system_log` VALUES ('1592', '1', 'admin', 'F-UPOSITION', '/system/userposition/list.thtml', '2017-05-03 17:45:46', 'true');
INSERT INTO `tm_system_log` VALUES ('1593', '1', 'admin', 'F-NEWS', '/system/news/list.thtml', '2017-05-03 17:45:47', 'true');
INSERT INTO `tm_system_log` VALUES ('1594', '1', 'admin', 'F-NEWSCATE', '/system/news/category/list.thtml', '2017-05-03 17:45:48', 'true');
INSERT INTO `tm_system_log` VALUES ('1595', '1', 'admin', 'P-SYS-CONFIG', '/system/config/list.thtml', '2017-05-03 17:45:48', 'true');
INSERT INTO `tm_system_log` VALUES ('1596', '1', 'admin', 'F-ADMIN', '/system/admin/list.thtml', '2017-05-03 17:45:49', 'true');
INSERT INTO `tm_system_log` VALUES ('1597', '1', 'admin', 'P-SYS-CONFIG', '/system/config/list.thtml', '2017-05-03 17:45:50', 'true');
INSERT INTO `tm_system_log` VALUES ('1598', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 17:45:54', 'true');
INSERT INTO `tm_system_log` VALUES ('1599', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 17:46:25', 'true');
INSERT INTO `tm_system_log` VALUES ('1600', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 17:46:26', 'true');
INSERT INTO `tm_system_log` VALUES ('1601', '1', 'admin', 'P-QES-IMPORT', '/system/question/import.thtml', '2017-05-03 17:46:26', 'true');
INSERT INTO `tm_system_log` VALUES ('1602', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 17:46:26', 'true');
INSERT INTO `tm_system_log` VALUES ('1603', '1', 'admin', 'P-PAPER-ADD', '/system/paper/add.thtml', '2017-05-03 17:46:28', 'true');
INSERT INTO `tm_system_log` VALUES ('1604', '1', 'admin', 'P-PAPER-ADD', '/system/paper/fastadd.thtml', '2017-05-03 17:46:28', 'true');
INSERT INTO `tm_system_log` VALUES ('1605', '1', 'admin', 'F-PAPER-CATE', '/system/paper/category/list.thtml', '2017-05-03 17:46:28', 'true');
INSERT INTO `tm_system_log` VALUES ('1606', '1', 'admin', 'F-COURSE', '/system/course/list.thtml', '2017-05-03 17:46:29', 'true');
INSERT INTO `tm_system_log` VALUES ('1607', '1', 'admin', 'F-COURSE-CATEGORY', '/system/course/category/list.thtml', '2017-05-03 17:46:29', 'true');
INSERT INTO `tm_system_log` VALUES ('1608', '1', 'admin', 'F-COURSE-TEACHER', '/system/course/teacher/list.thtml', '2017-05-03 17:46:30', 'true');
INSERT INTO `tm_system_log` VALUES ('1609', '1', 'admin', 'F-USERS', '/system/user/list.thtml', '2017-05-03 17:46:31', 'true');
INSERT INTO `tm_system_log` VALUES ('1610', '1', 'admin', 'F-BRANCH', '/system/branch/list.thtml', '2017-05-03 17:46:31', 'true');
INSERT INTO `tm_system_log` VALUES ('1611', '1', 'admin', 'F-NEWS', '/system/news/list.thtml', '2017-05-03 17:46:32', 'true');
INSERT INTO `tm_system_log` VALUES ('1612', '1', 'admin', 'F-NEWSCATE', '/system/news/category/list.thtml', '2017-05-03 17:46:32', 'true');
INSERT INTO `tm_system_log` VALUES ('1613', '1', 'admin', 'P-SYS-CONFIG', '/system/config/list.thtml', '2017-05-03 17:46:33', 'true');
INSERT INTO `tm_system_log` VALUES ('1614', '1', 'admin', 'F-ADMIN', '/system/admin/list.thtml', '2017-05-03 17:46:34', 'true');
INSERT INTO `tm_system_log` VALUES ('1615', '1', 'admin', 'F-ROLE', '/system/role/list.thtml', '2017-05-03 17:46:44', 'true');
INSERT INTO `tm_system_log` VALUES ('1616', '1', 'admin', 'F-ADMIN', '/system/admin/list.thtml', '2017-05-03 17:46:44', 'true');
INSERT INTO `tm_system_log` VALUES ('1617', '1', 'admin', 'F-ADMIN', '/system/admin/list.thtml', '2017-05-03 17:46:45', 'true');
INSERT INTO `tm_system_log` VALUES ('1618', '1', 'admin', 'F-ROLE', '/system/role/list.thtml', '2017-05-03 17:46:46', 'true');
INSERT INTO `tm_system_log` VALUES ('1619', '0', 'admin', 'doLogin', '/common/login.do', '2017-05-03 18:16:13', '登录失败(login_failed),username=admin');
INSERT INTO `tm_system_log` VALUES ('1620', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 18:16:19', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1621', '0', 'admin', 'doLogin', '/common/login.do', '2017-05-03 18:16:39', '登录失败(login_failed),username=admin');
INSERT INTO `tm_system_log` VALUES ('1622', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 18:16:43', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1623', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 18:17:34', 'true');
INSERT INTO `tm_system_log` VALUES ('1624', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 18:17:39', 'true');
INSERT INTO `tm_system_log` VALUES ('1625', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 18:23:36', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1626', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 18:26:31', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1627', '1', 'admin', 'P-SYS-CONFIG', '/system/config/list.thtml', '2017-05-03 18:26:34', 'true');
INSERT INTO `tm_system_log` VALUES ('1628', '1', 'admin', 'F-ADMIN', '/system/admin/list.thtml', '2017-05-03 18:26:40', 'true');
INSERT INTO `tm_system_log` VALUES ('1629', '1', 'admin', 'F-ROLE', '/system/role/list.thtml', '2017-05-03 18:26:42', 'true');
INSERT INTO `tm_system_log` VALUES ('1630', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 18:26:44', 'true');
INSERT INTO `tm_system_log` VALUES ('1631', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 18:41:59', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1632', '1', 'admin', 'P-PAPER-ADD', '/system/paper/fastadd.thtml', '2017-05-03 18:42:49', 'true');
INSERT INTO `tm_system_log` VALUES ('1633', '1', 'admin', 'P-PAPER-ADD', '/system/paper/add.thtml', '2017-05-03 18:42:49', 'true');
INSERT INTO `tm_system_log` VALUES ('1634', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 18:42:50', 'true');
INSERT INTO `tm_system_log` VALUES ('1635', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 18:42:51', 'true');
INSERT INTO `tm_system_log` VALUES ('1636', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 18:44:26', '用户验证码错误(verify_code_wrong)');
INSERT INTO `tm_system_log` VALUES ('1637', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 18:44:30', '用户验证码错误(verify_code_wrong)');
INSERT INTO `tm_system_log` VALUES ('1638', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 18:44:35', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1639', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 18:48:18', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1640', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 18:55:19', 'true');
INSERT INTO `tm_system_log` VALUES ('1641', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 18:55:20', 'true');
INSERT INTO `tm_system_log` VALUES ('1642', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 18:55:20', 'true');
INSERT INTO `tm_system_log` VALUES ('1643', '1', 'admin', 'P-PAPER-ADD', '/system/paper/add.thtml', '2017-05-03 18:56:20', 'true');
INSERT INTO `tm_system_log` VALUES ('1644', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 19:22:57', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1645', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 19:23:13', 'true');
INSERT INTO `tm_system_log` VALUES ('1646', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 19:23:15', 'true');
INSERT INTO `tm_system_log` VALUES ('1647', '1', 'admin', 'P-QES-IMPORT', '/system/question/import.thtml', '2017-05-03 19:23:15', 'true');
INSERT INTO `tm_system_log` VALUES ('1648', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 19:23:16', 'true');
INSERT INTO `tm_system_log` VALUES ('1649', '1', 'admin', 'P-PAPER-ADD', '/system/paper/add.thtml', '2017-05-03 19:23:18', 'true');
INSERT INTO `tm_system_log` VALUES ('1650', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 19:23:19', 'true');
INSERT INTO `tm_system_log` VALUES ('1651', '1', 'admin', 'P-QES-IMPORT', '/system/question/import.thtml', '2017-05-03 19:23:20', 'true');
INSERT INTO `tm_system_log` VALUES ('1652', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 19:23:21', 'true');
INSERT INTO `tm_system_log` VALUES ('1653', '1', 'admin', 'P-QES-IMPORT', '/system/question/import.thtml', '2017-05-03 19:23:21', 'true');
INSERT INTO `tm_system_log` VALUES ('1654', '1', 'admin', 'F-COURSE', '/system/course/list.thtml', '2017-05-03 19:23:28', 'true');
INSERT INTO `tm_system_log` VALUES ('1655', '1', 'admin', 'F-COURSE-CATEGORY', '/system/course/category/list.thtml', '2017-05-03 19:23:29', 'true');
INSERT INTO `tm_system_log` VALUES ('1656', '1', 'admin', 'F-COURSE-TEACHER', '/system/course/teacher/list.thtml', '2017-05-03 19:23:29', 'true');
INSERT INTO `tm_system_log` VALUES ('1657', '1', 'admin', 'F-USERS', '/system/user/list.thtml', '2017-05-03 19:23:31', 'true');
INSERT INTO `tm_system_log` VALUES ('1658', '1', 'admin', 'F-BRANCH', '/system/branch/list.thtml', '2017-05-03 19:23:32', 'true');
INSERT INTO `tm_system_log` VALUES ('1659', '1', 'admin', 'F-UPOSITION', '/system/userposition/list.thtml', '2017-05-03 19:23:32', 'true');
INSERT INTO `tm_system_log` VALUES ('1660', '1', 'admin', 'F-NEWS', '/system/news/list.thtml', '2017-05-03 19:23:35', 'true');
INSERT INTO `tm_system_log` VALUES ('1661', '1', 'admin', 'F-NEWSCATE', '/system/news/category/list.thtml', '2017-05-03 19:23:36', 'true');
INSERT INTO `tm_system_log` VALUES ('1662', '1', 'admin', 'P-SYS-CONFIG', '/system/config/list.thtml', '2017-05-03 19:23:37', 'true');
INSERT INTO `tm_system_log` VALUES ('1663', '1', 'admin', 'F-ADMIN', '/system/admin/list.thtml', '2017-05-03 19:23:38', 'true');
INSERT INTO `tm_system_log` VALUES ('1664', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 19:23:48', 'true');
INSERT INTO `tm_system_log` VALUES ('1665', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 19:29:15', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1666', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 19:29:34', 'true');
INSERT INTO `tm_system_log` VALUES ('1667', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 19:29:35', 'true');
INSERT INTO `tm_system_log` VALUES ('1668', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 19:29:37', 'true');
INSERT INTO `tm_system_log` VALUES ('1669', '1', 'admin', 'P-QES-IMPORT', '/system/question/import.thtml', '2017-05-03 19:29:38', 'true');
INSERT INTO `tm_system_log` VALUES ('1670', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 19:29:39', 'true');
INSERT INTO `tm_system_log` VALUES ('1671', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 19:29:58', 'true');
INSERT INTO `tm_system_log` VALUES ('1672', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 19:30:02', 'true');
INSERT INTO `tm_system_log` VALUES ('1673', '1', 'admin', 'P-QDB-ADD', '/system/qdb/save.do', '2017-05-03 19:30:19', 'true');
INSERT INTO `tm_system_log` VALUES ('1674', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 19:30:20', 'true');
INSERT INTO `tm_system_log` VALUES ('1675', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 19:30:55', 'true');
INSERT INTO `tm_system_log` VALUES ('1676', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 19:30:57', 'true');
INSERT INTO `tm_system_log` VALUES ('1677', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 19:31:32', 'true');
INSERT INTO `tm_system_log` VALUES ('1678', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 19:31:33', 'true');
INSERT INTO `tm_system_log` VALUES ('1679', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 19:31:34', 'true');
INSERT INTO `tm_system_log` VALUES ('1680', '1', 'admin', 'P-QES-IMPORT', '/system/question/import.thtml', '2017-05-03 19:31:35', 'true');
INSERT INTO `tm_system_log` VALUES ('1681', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 19:31:35', 'true');
INSERT INTO `tm_system_log` VALUES ('1682', '1', 'admin', 'F-QES', '/system/question/list.thtml', '2017-05-03 19:31:37', 'true');
INSERT INTO `tm_system_log` VALUES ('1683', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 19:31:38', 'true');
INSERT INTO `tm_system_log` VALUES ('1684', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 19:31:38', 'true');
INSERT INTO `tm_system_log` VALUES ('1685', '1', 'admin', 'P-QDB-DELETE', '/system/qdb/delete.do?id=54bc1813-2ddf-4ca1-be3e-2697b352eda3', '2017-05-03 19:31:40', 'true');
INSERT INTO `tm_system_log` VALUES ('1686', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 19:31:41', 'true');
INSERT INTO `tm_system_log` VALUES ('1687', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 19:31:42', 'true');
INSERT INTO `tm_system_log` VALUES ('1688', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 19:31:42', 'true');
INSERT INTO `tm_system_log` VALUES ('1689', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-03 19:31:43', 'true');
INSERT INTO `tm_system_log` VALUES ('1690', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-03 19:31:43', 'true');
INSERT INTO `tm_system_log` VALUES ('1691', '1', 'admin', 'P-QES-IMPORT', '/system/question/import.thtml', '2017-05-03 19:31:43', 'true');
INSERT INTO `tm_system_log` VALUES ('1692', '1', 'admin', 'F-COURSE', '/system/course/list.thtml', '2017-05-03 19:31:46', 'true');
INSERT INTO `tm_system_log` VALUES ('1693', '1', 'admin', 'F-COURSE-CATEGORY', '/system/course/category/list.thtml', '2017-05-03 19:31:47', 'true');
INSERT INTO `tm_system_log` VALUES ('1694', '1', 'admin', 'F-COURSE-TEACHER', '/system/course/teacher/list.thtml', '2017-05-03 19:31:47', 'true');
INSERT INTO `tm_system_log` VALUES ('1695', '1', 'admin', 'F-USERS', '/system/user/list.thtml', '2017-05-03 19:31:48', 'true');
INSERT INTO `tm_system_log` VALUES ('1696', '1', 'admin', 'F-BRANCH', '/system/branch/list.thtml', '2017-05-03 19:31:48', 'true');
INSERT INTO `tm_system_log` VALUES ('1697', '1', 'admin', 'F-UPOSITION', '/system/userposition/list.thtml', '2017-05-03 19:31:49', 'true');
INSERT INTO `tm_system_log` VALUES ('1698', '1', 'admin', 'F-NEWS', '/system/news/list.thtml', '2017-05-03 19:31:49', 'true');
INSERT INTO `tm_system_log` VALUES ('1699', '1', 'admin', 'F-NEWSCATE', '/system/news/category/list.thtml', '2017-05-03 19:31:50', 'true');
INSERT INTO `tm_system_log` VALUES ('1700', '1', 'admin', 'P-SYS-CONFIG', '/system/config/list.thtml', '2017-05-03 19:31:51', 'true');
INSERT INTO `tm_system_log` VALUES ('1701', '1', 'admin', 'F-ADMIN', '/system/admin/list.thtml', '2017-05-03 19:31:52', 'true');
INSERT INTO `tm_system_log` VALUES ('1702', '1', 'admin', 'F-ROLE', '/system/role/list.thtml', '2017-05-03 19:31:52', 'true');
INSERT INTO `tm_system_log` VALUES ('1703', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 20:06:07', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1704', '1', 'admin', 'P-PAPER-ADD', '/system/paper/add.thtml', '2017-05-03 20:06:15', 'true');
INSERT INTO `tm_system_log` VALUES ('1705', '1', 'admin', 'P-PAPER-ADD', '/system/paper/fastadd.thtml', '2017-05-03 20:06:16', 'true');
INSERT INTO `tm_system_log` VALUES ('1706', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-03 20:06:17', 'true');
INSERT INTO `tm_system_log` VALUES ('1707', '1', 'admin', 'F-NEWSCATE', '/system/news/category/list.thtml', '2017-05-03 20:06:21', 'true');
INSERT INTO `tm_system_log` VALUES ('1708', '1', 'admin', 'P-SYS-CONFIG', '/system/config/list.thtml', '2017-05-03 20:06:22', 'true');
INSERT INTO `tm_system_log` VALUES ('1709', '1', 'admin', 'F-ADMIN', '/system/admin/list.thtml', '2017-05-03 20:06:23', 'true');
INSERT INTO `tm_system_log` VALUES ('1710', '1', 'admin', 'F-ROLE', '/system/role/list.thtml', '2017-05-03 20:06:24', 'true');
INSERT INTO `tm_system_log` VALUES ('1711', '1', 'admin', 'P-SYS-CONFIG', '/system/config/list.thtml', '2017-05-03 20:06:29', 'true');
INSERT INTO `tm_system_log` VALUES ('1712', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-03 21:59:37', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1713', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-19 15:13:06', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1714', '1', 'admin', 'P-SYS-CONFIG', '/system/config/list.thtml', '2017-05-19 15:13:08', 'true');
INSERT INTO `tm_system_log` VALUES ('1715', '1', 'admin', 'F-ADMIN', '/system/admin/list.thtml', '2017-05-19 15:13:09', 'true');
INSERT INTO `tm_system_log` VALUES ('1716', '1', 'admin', 'P-ADMIN-UPDATE', '/system/admin/load.thtml?id=898cefdf-d372-410d-b5d5-332e71b43e64', '2017-05-19 15:13:12', 'true');
INSERT INTO `tm_system_log` VALUES ('1717', '1', 'admin', 'P-ADMIN-UPDATE', '/system/admin/update.do', '2017-05-19 15:13:31', 'true');
INSERT INTO `tm_system_log` VALUES ('1718', '1', 'admin', 'F-ADMIN', '/system/admin/list.thtml', '2017-05-19 15:13:33', 'true');
INSERT INTO `tm_system_log` VALUES ('1719', '1', 'admin', 'P-ADMIN-UPDATE', '/system/admin/load.thtml?id=898cefdf-d372-410d-b5d5-332e71b43e64', '2017-05-19 15:13:35', 'true');
INSERT INTO `tm_system_log` VALUES ('1720', '1', 'admin', 'P-ADMIN-UPDATE', '/system/admin/update.do', '2017-05-19 15:13:54', 'true');
INSERT INTO `tm_system_log` VALUES ('1721', '1', 'admin', 'doLogout', '/common/logout.do', '2017-05-19 15:13:56', '登出成功(logout_success)');
INSERT INTO `tm_system_log` VALUES ('1722', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-19 15:14:04', '登录失败(login_failed),username=admin');
INSERT INTO `tm_system_log` VALUES ('1723', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-19 15:14:13', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1724', '-9999', null, 'doLogin', '/common/login.do', '2017-05-19 15:50:57', 'SESSION验证码失效(session_code_lost)');
INSERT INTO `tm_system_log` VALUES ('1725', '1', 'admin', 'doLogin', '/common/login.do', '2017-05-20 12:36:51', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1726', '1', 'admin', 'F-PAPER', '/system/paper/list.thtml', '2017-05-20 12:37:05', 'true');
INSERT INTO `tm_system_log` VALUES ('1727', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-05-20 12:37:12', 'true');
INSERT INTO `tm_system_log` VALUES ('1728', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-05-20 12:37:14', 'true');
INSERT INTO `tm_system_log` VALUES ('1729', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-05-20 12:37:15', 'true');
INSERT INTO `tm_system_log` VALUES ('1730', '1', 'admin', 'P-SYS-CONFIG', '/system/config/list.thtml', '2017-05-20 12:37:22', 'true');
INSERT INTO `tm_system_log` VALUES ('1731', '1', 'admin', 'F-ADMIN', '/system/admin/list.thtml', '2017-05-20 12:37:24', 'true');
INSERT INTO `tm_system_log` VALUES ('1732', '1', 'admin', 'F-ROLE', '/system/role/list.thtml', '2017-05-20 12:37:25', 'true');
INSERT INTO `tm_system_log` VALUES ('1733', '0', 'admin', 'doLogin', '/common/login.do', '2017-06-10 14:45:59', '登录失败(login_failed),username=admin');
INSERT INTO `tm_system_log` VALUES ('1734', '1', 'admin', 'doLogin', '/common/login.do', '2017-06-10 14:46:04', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1735', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-06-10 14:46:09', 'true');
INSERT INTO `tm_system_log` VALUES ('1736', '1', 'admin', 'F-QDB', '/system/qdb/list.thtml', '2017-06-10 14:46:11', 'true');
INSERT INTO `tm_system_log` VALUES ('1737', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-06-10 14:46:12', 'true');
INSERT INTO `tm_system_log` VALUES ('1738', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-06-10 14:46:15', 'true');
INSERT INTO `tm_system_log` VALUES ('1739', '1', 'admin', 'P-PAPER-ADD', '/system/paper/add.thtml', '2017-06-10 14:46:18', 'true');
INSERT INTO `tm_system_log` VALUES ('1740', '1', 'admin', 'F-COURSE', '/system/course/list.thtml', '2017-06-10 14:46:21', 'true');
INSERT INTO `tm_system_log` VALUES ('1741', '1', 'admin', 'doLogin', '/common/login.do', '2017-06-18 16:24:30', '登录成功(login_success)');
INSERT INTO `tm_system_log` VALUES ('1742', '1', 'admin', 'P-QES-ADD', '/system/question/add.thtml', '2017-06-18 16:24:35', 'true');
INSERT INTO `tm_system_log` VALUES ('1743', '1', 'admin', 'P-QDB-ADD', '/system/qdb/add.thtml', '2017-06-18 16:24:42', 'true');
INSERT INTO `tm_system_log` VALUES ('1744', '1', 'admin', 'F-COURSE-CATEGORY', '/system/course/category/list.thtml', '2017-06-18 16:24:44', 'true');

-- ----------------------------
-- Table structure for tm_user
-- ----------------------------
DROP TABLE IF EXISTS `tm_user`;
CREATE TABLE `tm_user` (
  `u_id` varchar(50) NOT NULL,
  `u_username` varchar(50) DEFAULT NULL,
  `u_userpass` varchar(50) DEFAULT NULL,
  `u_photo` varchar(100) DEFAULT NULL,
  `u_branchid` varchar(50) DEFAULT NULL,
  `u_realname` varchar(50) DEFAULT NULL,
  `u_score` int(10) DEFAULT NULL,
  `u_no` varchar(50) DEFAULT NULL,
  `u_phone` varchar(50) DEFAULT NULL,
  `u_email` varchar(50) DEFAULT NULL,
  `u_status` int(2) DEFAULT NULL COMMENT '1正常，0待审核，-9已删除',
  `u_address` varchar(200) DEFAULT NULL,
  `u_remark` varchar(500) DEFAULT NULL,
  `u_salt` varchar(10) DEFAULT NULL,
  `u_regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  KEY `FK_ref_user_branch` (`u_branchid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_user
-- ----------------------------

-- ----------------------------
-- Table structure for tm_usertest
-- ----------------------------
DROP TABLE IF EXISTS `tm_usertest`;
CREATE TABLE `tm_usertest` (
  `t_tid` varchar(50) NOT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `t_duration` int(11) DEFAULT NULL,
  `t_uid` varchar(50) DEFAULT NULL,
  `t_totalscore` int(4) DEFAULT NULL,
  `t_userscore` int(4) DEFAULT NULL,
  `t_paper` longtext,
  `t_answer` longtext,
  `t_check` longtext,
  `t_testdate` datetime DEFAULT NULL,
  `t_timecost` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_usertest
-- ----------------------------
INSERT INTO `tm_usertest` VALUES ('5076e391-414f-403b-9e05-89d1c6a5c816', '222', '2', '4788c491-c279-4497-ba44-42b2443d7760', '10', '4', '<com.tom.model.paper.Paper>\n  <id>0</id>\n  <name>222</name>\n  <status>1</status>\n  <duration>2</duration>\n  <totalscore>10</totalscore>\n  <passscore>0</passscore>\n  <ordertype>0</ordertype>\n  <papertype>2</papertype>\n  <remark></remark>\n  <sections>\n    <com.tom.model.paper.PaperSection>\n      <name>单选</name>\n      <remark></remark>\n      <id>0</id>\n      <questions>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>68c584f9-d1a7-43cc-b325-d619c7385ec8</id>\n          <type>1</type>\n          <content>防抱死制动系统（ABS）在什么情况下可以最大限度发挥制动器效能?</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>间歇制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>持续制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>紧急制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>缓踏制动踏板</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>515c7c31-db05-4ee8-b802-7dca0bd08c8d</id>\n          <type>1</type>\n          <content>上道路行驶的机动车有哪种情形交通警察可依法扣留车辆？</content>\n          <key>A</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>未放置检验合格标志</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>未携带身份证</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>未放置城市环保标志</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>未携带机动车登记证书</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>f27ca2e4-c511-45df-afc7-6534c909190e</id>\n          <type>1</type>\n          <content>驾驶机动车在道路上向左变更车道时如何使用灯光？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>提前开启右转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>不用开启转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>提前开启左转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>提前开启近光灯</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>3bab31fa-9676-49b7-b642-1b3098fc2819</id>\n          <type>1</type>\n          <content>湿滑路面制动过程中，发现车辆偏离方向，以下做法正确的是？</content>\n          <key>D</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>任意踩制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>连续轻踩轻放制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>用力踩制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>不要踩制动踏板</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>1e65e7a9-2005-4cdf-9419-d14d4327ab8a</id>\n          <type>1</type>\n          <content>车辆在较窄的山路上行驶时，如果靠山体的一方不让行，应怎样做？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>鸣喇叭催其让行</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>保持正常车速行驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>提前减速或停车避让</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>向左占道，谨慎驶过</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n      </questions>\n      <rnum>0</rnum>\n      <rtype>0</rtype>\n      <rlevel>0</rlevel>\n      <rscore>0</rscore>\n    </com.tom.model.paper.PaperSection>\n    <com.tom.model.paper.PaperSection>\n      <name>多选</name>\n      <remark></remark>\n      <id>1</id>\n      <questions>\n        <com.tom.model.paper.QuestionMultipleChoice>\n          <id>aa55ff1e-e183-41aa-a830-b855d77382e2</id>\n          <type>2</type>\n          <content>驾驶非机动车，必须遵守哪些规定？</content>\n          <key>ABCD</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>醉酒的人不准驾驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>丧失正常驾驶能力的残疾人不准驾驶（残疾人专用车除外）</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>未满十六岁的人，不准在道路上赶畜力车</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>未满十二岁的儿童，不准在道路上骑自行车、三轮车和推、拉人力车</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionMultipleChoice>\n        <com.tom.model.paper.QuestionMultipleChoice>\n          <id>ffd4e580-c453-4912-9767-38df2537f6ee</id>\n          <type>2</type>\n          <content>警车、消防车、救护车、工程救险车执行紧急任务时，可以使用警报器、标志灯具；在确保安全的前提下，不受（）的限制，其他车辆和行人应当让行。</content>\n          <key>ABCD</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>行驶路线</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>行驶方向</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>行驶速度</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>信号灯</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionMultipleChoice>\n        <com.tom.model.paper.QuestionMultipleChoice>\n          <id>00be0845-acaa-4d32-a002-0f5f843b3575</id>\n          <type>2</type>\n          <content>行人不得有下列哪些行为：</content>\n          <key>ABC</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>跨越、倚坐道路隔离设施</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>扒车、强行拦车</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>实施妨碍道路交通安全的其他行为</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>在人行道左侧行走</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionMultipleChoice>\n        <com.tom.model.paper.QuestionMultipleChoice>\n          <id>f5d68879-a9dd-438b-9389-cc1ec6c7fd6a</id>\n          <type>2</type>\n          <content>乘坐机动车应当遵守下列规定：</content>\n          <key>BCD</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>乘坐两轮摩托车可以侧向骑坐</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>不得在机动车道上拦乘机动车</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>在机动车道上不得从机动车左侧上下车</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>开关车门不得妨碍其他车辆和行人通行</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionMultipleChoice>\n        <com.tom.model.paper.QuestionMultipleChoice>\n          <id>b26bccad-f138-4f67-bc32-85b4dc755579</id>\n          <type>2</type>\n          <content>在道路上驾驶自行车、电动自行车应当遵守下列规定：</content>\n          <key>ACD</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>不得牵引、攀扶车辆或者被其他车辆牵引</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>不得双手离把但可以手中持物</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>不得扶身并行、互相追逐或者曲折竞驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>不得在道路上骑独轮自行车或者2人以上骑行的自行车</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionMultipleChoice>\n      </questions>\n      <rnum>0</rnum>\n      <rtype>0</rtype>\n      <rlevel>0</rlevel>\n      <rscore>0</rscore>\n    </com.tom.model.paper.PaperSection>\n  </sections>\n</com.tom.model.paper.Paper>', '{\"Q-f27ca2e4-c511-45df-afc7-6534c909190e\":\"C\",\"Q-aa55ff1e-e183-41aa-a830-b855d77382e2\":\"A,B,C,D\",\"Q-515c7c31-db05-4ee8-b802-7dca0bd08c8d\":\"D\",\"Q-68c584f9-d1a7-43cc-b325-d619c7385ec8\":\"C\",\"Q-3bab31fa-9676-49b7-b642-1b3098fc2819\":\"D\",\"Q-ffd4e580-c453-4912-9767-38df2537f6ee\":\"A,B,C\"}', '{\"Q-68c584f9-d1a7-43cc-b325-d619c7385ec8\":1,\"Q-515c7c31-db05-4ee8-b802-7dca0bd08c8d\":0,\"Q-f27ca2e4-c511-45df-afc7-6534c909190e\":1,\"Q-3bab31fa-9676-49b7-b642-1b3098fc2819\":1,\"Q-1e65e7a9-2005-4cdf-9419-d14d4327ab8a\":0,\"Q-aa55ff1e-e183-41aa-a830-b855d77382e2\":1,\"Q-ffd4e580-c453-4912-9767-38df2537f6ee\":0,\"Q-00be0845-acaa-4d32-a002-0f5f843b3575\":0,\"Q-f5d68879-a9dd-438b-9389-cc1ec6c7fd6a\":0,\"Q-b26bccad-f138-4f67-bc32-85b4dc755579\":0}', '2016-08-20 00:17:16', '2');
INSERT INTO `tm_usertest` VALUES ('a258f3e4-e49e-45e0-9f4e-dd2fa9e13201', '111111111111111111111111111111', '1', '4788c491-c279-4497-ba44-42b2443d7760', '10', '1', '<com.tom.model.paper.Paper>\n  <id>0</id>\n  <name>111111111111111111111111111111</name>\n  <status>1</status>\n  <duration>1</duration>\n  <totalscore>10</totalscore>\n  <passscore>0</passscore>\n  <ordertype>0</ordertype>\n  <papertype>2</papertype>\n  <remark></remark>\n  <sections>\n    <com.tom.model.paper.PaperSection>\n      <name>1111</name>\n      <remark></remark>\n      <id>0</id>\n      <questions>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>422d18ce-2092-4f6c-a8e9-b0971421e65b</id>\n          <type>1</type>\n          <content>醉酒驾驶机动车在道路上行驶会受到什么处罚？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>处管制，并处罚金</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>处2年以上徒刑</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>处拘役，并处罚金</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>处2年以下徒刑</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>d0aaf4be-f05a-498d-a83b-35dfe41bfa49</id>\n          <type>1</type>\n          <content>饮酒后或者醉酒驾驶机动车发生重大交通事故构成犯罪的，依法追究刑事责任，吊销机动车驾驶证，将多少年内不得申请机动车驾驶证？</content>\n          <key>D</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>五年</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>十年</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>二十年</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>终生</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>515c7c31-db05-4ee8-b802-7dca0bd08c8d</id>\n          <type>1</type>\n          <content>上道路行驶的机动车有哪种情形交通警察可依法扣留车辆？</content>\n          <key>A</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>未放置检验合格标志</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>未携带身份证</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>未放置城市环保标志</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>未携带机动车登记证书</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>246297ee-d1a5-41d0-adaa-b14d517d97a9</id>\n          <type>1</type>\n          <content>遇到前方车辆停车排队或者缓慢行驶时，强行穿插，以下说法正确的是什么？</content>\n          <key>D</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>允许,因为可以省油</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>允许,因为可以快速地通过拥堵区</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>禁止,因为这样不利于省油</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>禁止,因为这样扰乱车流,加重拥堵</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>68c584f9-d1a7-43cc-b325-d619c7385ec8</id>\n          <type>1</type>\n          <content>防抱死制动系统（ABS）在什么情况下可以最大限度发挥制动器效能?</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>间歇制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>持续制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>紧急制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>缓踏制动踏板</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>3bab31fa-9676-49b7-b642-1b3098fc2819</id>\n          <type>1</type>\n          <content>湿滑路面制动过程中，发现车辆偏离方向，以下做法正确的是？</content>\n          <key>D</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>任意踩制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>连续轻踩轻放制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>用力踩制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>不要踩制动踏板</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>f27ca2e4-c511-45df-afc7-6534c909190e</id>\n          <type>1</type>\n          <content>驾驶机动车在道路上向左变更车道时如何使用灯光？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>提前开启右转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>不用开启转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>提前开启左转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>提前开启近光灯</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>1e65e7a9-2005-4cdf-9419-d14d4327ab8a</id>\n          <type>1</type>\n          <content>车辆在较窄的山路上行驶时，如果靠山体的一方不让行，应怎样做？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>鸣喇叭催其让行</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>保持正常车速行驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>提前减速或停车避让</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>向左占道，谨慎驶过</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>2d58eee2-33e0-4334-8259-9a16c23f6832</id>\n          <type>1</type>\n          <content>驾驶的车辆正在被其他车辆超越时，若此时后方有跟随行驶的车辆，应怎样做？</content>\n          <key>B</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>继续加速行驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>稍向右侧行驶，保证横向安全距离</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>靠道路中心行驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>加速向右侧让路</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>fba4649a-f6a4-4f53-921c-089b881dfd32</id>\n          <type>1</type>\n          <content>下面哪种做法能帮助您避免被其他车辆从后方追撞？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>在任何时候都打开转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>一直打开双闪</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>在转弯前提前打开相应的转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>转弯前鸣笛示意</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n      </questions>\n      <rnum>0</rnum>\n      <rtype>0</rtype>\n      <rlevel>0</rlevel>\n      <rscore>0</rscore>\n    </com.tom.model.paper.PaperSection>\n  </sections>\n</com.tom.model.paper.Paper>', '{\"Q-422d18ce-2092-4f6c-a8e9-b0971421e65b\":\"D\",\"Q-d0aaf4be-f05a-498d-a83b-35dfe41bfa49\":\"D\"}', '{\"Q-422d18ce-2092-4f6c-a8e9-b0971421e65b\":0,\"Q-d0aaf4be-f05a-498d-a83b-35dfe41bfa49\":1,\"Q-515c7c31-db05-4ee8-b802-7dca0bd08c8d\":0,\"Q-246297ee-d1a5-41d0-adaa-b14d517d97a9\":0,\"Q-68c584f9-d1a7-43cc-b325-d619c7385ec8\":0,\"Q-3bab31fa-9676-49b7-b642-1b3098fc2819\":0,\"Q-f27ca2e4-c511-45df-afc7-6534c909190e\":0,\"Q-1e65e7a9-2005-4cdf-9419-d14d4327ab8a\":0,\"Q-2d58eee2-33e0-4334-8259-9a16c23f6832\":0,\"Q-fba4649a-f6a4-4f53-921c-089b881dfd32\":0}', '2016-08-20 00:23:45', '1');
INSERT INTO `tm_usertest` VALUES ('bf181426-5fbf-4078-aee2-48bce730bf26', '随机', '3', '4788c491-c279-4497-ba44-42b2443d7760', '10', '8', '<com.tom.model.paper.Paper>\n  <id>0</id>\n  <name>随机</name>\n  <status>1</status>\n  <duration>3</duration>\n  <totalscore>10</totalscore>\n  <passscore>0</passscore>\n  <ordertype>0</ordertype>\n  <papertype>2</papertype>\n  <remark></remark>\n  <sections>\n    <com.tom.model.paper.PaperSection>\n      <name>1111</name>\n      <remark>111</remark>\n      <id>0</id>\n      <questions>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>515c7c31-db05-4ee8-b802-7dca0bd08c8d</id>\n          <type>1</type>\n          <content>上道路行驶的机动车有哪种情形交通警察可依法扣留车辆？</content>\n          <key>A</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>未放置检验合格标志</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>未携带身份证</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>未放置城市环保标志</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>未携带机动车登记证书</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>1e65e7a9-2005-4cdf-9419-d14d4327ab8a</id>\n          <type>1</type>\n          <content>车辆在较窄的山路上行驶时，如果靠山体的一方不让行，应怎样做？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>鸣喇叭催其让行</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>保持正常车速行驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>提前减速或停车避让</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>向左占道，谨慎驶过</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>3bab31fa-9676-49b7-b642-1b3098fc2819</id>\n          <type>1</type>\n          <content>湿滑路面制动过程中，发现车辆偏离方向，以下做法正确的是？</content>\n          <key>D</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>任意踩制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>连续轻踩轻放制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>用力踩制动踏板</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>不要踩制动踏板</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>d0aaf4be-f05a-498d-a83b-35dfe41bfa49</id>\n          <type>1</type>\n          <content>饮酒后或者醉酒驾驶机动车发生重大交通事故构成犯罪的，依法追究刑事责任，吊销机动车驾驶证，将多少年内不得申请机动车驾驶证？</content>\n          <key>D</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>五年</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>十年</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>二十年</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>终生</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>68c584f9-d1a7-43cc-b325-d619c7385ec8</id>\n          <type>1</type>\n          <content>防抱死制动系统（ABS）在什么情况下可以最大限度发挥制动器效能?</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>间歇制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>持续制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>紧急制动</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>缓踏制动踏板</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>2d58eee2-33e0-4334-8259-9a16c23f6832</id>\n          <type>1</type>\n          <content>驾驶的车辆正在被其他车辆超越时，若此时后方有跟随行驶的车辆，应怎样做？</content>\n          <key>B</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>继续加速行驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>稍向右侧行驶，保证横向安全距离</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>靠道路中心行驶</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>加速向右侧让路</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>fba4649a-f6a4-4f53-921c-089b881dfd32</id>\n          <type>1</type>\n          <content>下面哪种做法能帮助您避免被其他车辆从后方追撞？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>在任何时候都打开转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>一直打开双闪</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>在转弯前提前打开相应的转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>转弯前鸣笛示意</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>422d18ce-2092-4f6c-a8e9-b0971421e65b</id>\n          <type>1</type>\n          <content>醉酒驾驶机动车在道路上行驶会受到什么处罚？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>处管制，并处罚金</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>处2年以上徒刑</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>处拘役，并处罚金</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>处2年以下徒刑</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>f27ca2e4-c511-45df-afc7-6534c909190e</id>\n          <type>1</type>\n          <content>驾驶机动车在道路上向左变更车道时如何使用灯光？</content>\n          <key>C</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>提前开启右转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>不用开启转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>提前开启左转向灯</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>提前开启近光灯</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n        <com.tom.model.paper.QuestionSingleChoice>\n          <id>246297ee-d1a5-41d0-adaa-b14d517d97a9</id>\n          <type>1</type>\n          <content>遇到前方车辆停车排队或者缓慢行驶时，强行穿插，以下说法正确的是什么？</content>\n          <key>D</key>\n          <score>1</score>\n          <options>\n            <com.tom.model.paper.Option>\n              <alisa>A</alisa>\n              <text>允许,因为可以省油</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>B</alisa>\n              <text>允许,因为可以快速地通过拥堵区</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>C</alisa>\n              <text>禁止,因为这样不利于省油</text>\n            </com.tom.model.paper.Option>\n            <com.tom.model.paper.Option>\n              <alisa>D</alisa>\n              <text>禁止,因为这样扰乱车流,加重拥堵</text>\n            </com.tom.model.paper.Option>\n          </options>\n        </com.tom.model.paper.QuestionSingleChoice>\n      </questions>\n      <rnum>0</rnum>\n      <rtype>0</rtype>\n      <rlevel>0</rlevel>\n      <rscore>0</rscore>\n    </com.tom.model.paper.PaperSection>\n  </sections>\n</com.tom.model.paper.Paper>', '{\"Q-422d18ce-2092-4f6c-a8e9-b0971421e65b\":\"C\",\"Q-2d58eee2-33e0-4334-8259-9a16c23f6832\":\"B\",\"Q-f27ca2e4-c511-45df-afc7-6534c909190e\":\"C\",\"Q-d0aaf4be-f05a-498d-a83b-35dfe41bfa49\":\"D\",\"Q-246297ee-d1a5-41d0-adaa-b14d517d97a9\":\"D\",\"Q-515c7c31-db05-4ee8-b802-7dca0bd08c8d\":\"A\",\"Q-68c584f9-d1a7-43cc-b325-d619c7385ec8\":\"C\",\"Q-1e65e7a9-2005-4cdf-9419-d14d4327ab8a\":\"D\",\"Q-3bab31fa-9676-49b7-b642-1b3098fc2819\":\"B\",\"Q-fba4649a-f6a4-4f53-921c-089b881dfd32\":\"C\"}', '{\"Q-515c7c31-db05-4ee8-b802-7dca0bd08c8d\":1,\"Q-1e65e7a9-2005-4cdf-9419-d14d4327ab8a\":0,\"Q-3bab31fa-9676-49b7-b642-1b3098fc2819\":0,\"Q-d0aaf4be-f05a-498d-a83b-35dfe41bfa49\":1,\"Q-68c584f9-d1a7-43cc-b325-d619c7385ec8\":1,\"Q-2d58eee2-33e0-4334-8259-9a16c23f6832\":1,\"Q-fba4649a-f6a4-4f53-921c-089b881dfd32\":1,\"Q-422d18ce-2092-4f6c-a8e9-b0971421e65b\":1,\"Q-f27ca2e4-c511-45df-afc7-6534c909190e\":1,\"Q-246297ee-d1a5-41d0-adaa-b14d517d97a9\":1}', '2016-08-20 00:12:53', '3');

-- ----------------------------
-- Table structure for tm_user_addition
-- ----------------------------
DROP TABLE IF EXISTS `tm_user_addition`;
CREATE TABLE `tm_user_addition` (
  `u_id` varchar(50) DEFAULT NULL,
  `u_logintimes` int(11) DEFAULT '0',
  `u_lastlogin` datetime DEFAULT NULL,
  `u_positionid` varchar(50) DEFAULT NULL,
  KEY `FK_ref_user_addtion` (`u_id`) USING BTREE,
  CONSTRAINT `tm_user_addition_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `tm_user` (`u_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_user_addition
-- ----------------------------

-- ----------------------------
-- Table structure for tm_user_collection
-- ----------------------------
DROP TABLE IF EXISTS `tm_user_collection`;
CREATE TABLE `tm_user_collection` (
  `c_id` varchar(50) NOT NULL,
  `c_tid` varchar(50) DEFAULT NULL,
  `c_uid` varchar(50) DEFAULT NULL,
  `c_qid` varchar(50) DEFAULT NULL,
  `c_creatdate` datetime DEFAULT NULL,
  `c_userkey` text,
  `c_remark` text,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_user_collection
-- ----------------------------

-- ----------------------------
-- Table structure for tm_user_collection_type
-- ----------------------------
DROP TABLE IF EXISTS `tm_user_collection_type`;
CREATE TABLE `tm_user_collection_type` (
  `t_id` varchar(50) NOT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `t_uid` varchar(50) DEFAULT NULL,
  `t_createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_user_collection_type
-- ----------------------------
INSERT INTO `tm_user_collection_type` VALUES ('fd687290-fc13-43a1-8613-4d4408b73b6b', '0000', '4788c491-c279-4497-ba44-42b2443d7760', '2016-08-18 23:23:01');

-- ----------------------------
-- Table structure for tm_user_position
-- ----------------------------
DROP TABLE IF EXISTS `tm_user_position`;
CREATE TABLE `tm_user_position` (
  `p_id` varchar(50) NOT NULL,
  `p_name` varchar(50) DEFAULT NULL,
  `p_remark` varchar(50) DEFAULT NULL,
  `p_status` int(2) DEFAULT NULL,
  `p_poster` varchar(50) DEFAULT NULL,
  `p_createdate` datetime DEFAULT NULL,
  `p_modifor` varchar(50) DEFAULT NULL,
  `p_modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_user_position
-- ----------------------------

-- ----------------------------
-- Table structure for tm_vote
-- ----------------------------
DROP TABLE IF EXISTS `tm_vote`;
CREATE TABLE `tm_vote` (
  `v_id` varchar(50) NOT NULL,
  `v_title` varchar(200) DEFAULT NULL,
  `v_body` text,
  `v_starttime` datetime DEFAULT NULL,
  `v_endtime` datetime DEFAULT NULL,
  `v_status` int(2) DEFAULT NULL,
  `v_data` text,
  `v_poster` varchar(50) DEFAULT NULL,
  `v_createdate` datetime DEFAULT NULL,
  `v_modifyor` varchar(50) DEFAULT NULL,
  `v_modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_vote
-- ----------------------------

-- ----------------------------
-- Table structure for tm_vote_log
-- ----------------------------
DROP TABLE IF EXISTS `tm_vote_log`;
CREATE TABLE `tm_vote_log` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_uid` varchar(50) DEFAULT NULL,
  `l_vid` varchar(50) DEFAULT NULL,
  `l_vdata` varchar(500) DEFAULT NULL,
  `l_votedate` datetime DEFAULT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_vote_log
-- ----------------------------

-- ----------------------------
-- Function structure for tm_strip_tags
-- ----------------------------
DROP FUNCTION IF EXISTS `tm_strip_tags`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `tm_strip_tags`($str text) RETURNS text CHARSET utf8
BEGIN
  DECLARE $start, $end INT DEFAULT 1;
  IF ($str IS NULL) THEN RETURN NULL; END IF;
  LOOP
    SET $start = LOCATE("<", $str, $start);
    IF (!$start) THEN RETURN $str; END IF;
    SET $end = LOCATE(">", $str, $start);
    IF (!$end) THEN SET $end = $start; END IF;
    SET $str = INSERT($str, $start, $end - $start + 1, "");
  END LOOP;
END
;;
DELIMITER ;
