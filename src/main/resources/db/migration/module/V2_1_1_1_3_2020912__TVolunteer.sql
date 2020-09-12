/*
Navicat MySQL Data Transfer

Source Server         : lzc
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-09-12 11:15:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_volunteer
-- ----------------------------
DROP TABLE IF EXISTS `t_volunteer`;
CREATE TABLE `t_volunteer` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_by` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `update_by` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '姓名',
  `tel` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '电话',
  `id_card` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '身份证',
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '志愿者类型',
  `no` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '志愿者编号',
  `head_pic` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '志愿者头像',
  `token` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登录凭证',
  `refresh_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='志愿者信息表';

-- ----------------------------
-- Records of t_volunteer
-- ----------------------------
INSERT INTO `t_volunteer` VALUES ('1', '2020-06-04 14:40:39', '2020-07-10 16:15:20', 'admin', 'admin', '张小帅', '17759501265', '13273891263986128', '志愿者', 'ZYZ00001', null, null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('2', '2020-06-08 14:20:57', '2020-06-16 09:09:37', 'admin', 'admin', '李小利', '15860185999', '350500199909096518', '志愿者', 'ZYZ00002', null, null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('3', '2020-06-12 15:43:32', '2020-06-16 09:08:30', 'admin', 'admin', '王小兰', '15959901698', '35062419960315301X', '志愿者', 'ZYZ00003', null, null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('4', '2020-06-15 10:28:12', '2020-06-16 09:08:39', 'admin', 'admin', '叶问', '15860185985', '350500199010316518', '志愿者', 'ZYZ00004', 'https://zntc.145u.net:9099/UpLoadImages/图片/100007020061844405640.png', null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('5', '2020-06-16 09:07:56', '2020-07-01 02:10:16', 'admin', 'admin', '许', '18605952770', '350500199911123317', '志愿者', 'ZYZ00005', null, null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('6', '2020-06-16 09:10:25', '2020-07-01 09:22:43', 'admin', 'admin', '苏', '13905971389', '35058219951125617', '随车志愿者', 'ZYZ00006', null, null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('7', '2020-07-06 16:33:40', '2020-07-06 16:33:40', 'admin', 'admin', '傅飞跃', '18859988521', '12345600', '志愿者', '000', null, null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('8', '2020-07-06 16:37:12', '2020-07-06 16:37:12', 'admin', 'admin', '黄健康', '18859988225', '123456', '志愿者', '001', null, null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('9', '2020-07-06 16:37:54', '2020-07-06 16:37:54', 'admin', 'admin', '姚文积', '18859988172', '12345601', '志愿者', '01', null, null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('10', '2020-07-06 16:38:37', '2020-07-06 16:38:37', 'admin', 'admin', '陈嘉兴', '18859988235', '12345602', '志愿者', '02', null, null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('11', '2020-07-06 16:45:14', '2020-07-06 16:45:14', 'admin', 'admin', '吕锦波', '18859988109', '00001', '志愿者', '00001', null, null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('12', '2020-07-06 16:46:18', '2020-07-06 16:46:18', 'admin', 'admin', '肖奕能', '18859988609', '00002', '志愿者', '00002', null, null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('13', '2020-07-06 16:46:53', '2020-07-06 16:46:53', 'admin', 'admin', '郑清源', '18859988527', '00003', '志愿者', '00003', null, null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('14', '2020-07-06 16:47:21', '2020-07-06 16:47:21', 'admin', 'admin', '吴鸿伟', '18859988122', '00005', '志愿者', '00005', null, null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('15', '2020-07-06 16:47:45', '2020-07-06 16:47:45', 'admin', 'admin', '许少宝', '18859988125', '00006', '志愿者', '00006', null, null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('16', '2020-07-22 11:07:40', '2020-07-22 11:07:40', 'admin', 'admin', '周', '13506922052', '3505', '志愿者', '112', null, null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('17', '2020-07-23 10:35:49', '2020-07-23 10:35:49', 'admin', 'admin', '11', '11', '11', null, '000', null, null, null, null, '11', '0');
INSERT INTO `t_volunteer` VALUES ('18', '2020-08-18 17:13:50', '2020-08-18 17:16:59', 'admin', 'admin', '晋志愿', '18859988208', '350500190000000000', '志愿者', 'S200', null, null, null, null, '123456', '0');
INSERT INTO `t_volunteer` VALUES ('19', '2020-08-18 17:24:32', '2020-08-18 17:24:32', 'admin', 'admin', '晋志愿2', '18605952770', '350500199001010101', '志愿者', 'S2001', null, null, null, null, '123456', '1');
