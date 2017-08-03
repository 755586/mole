/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : db_mole

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-08-03 16:20:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单名',
  `m_url` varchar(60) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单URL',
  `m_pid` int(11) DEFAULT NULL COMMENT '父菜单',
  `m_icon` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `m_state` int(11) DEFAULT NULL COMMENT '状态',
  `m_comment` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `m_orderno` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '菜单维护', 'system/menu', '1', null, '1', null, null);
INSERT INTO `t_menu` VALUES ('10', '参数维护', 'system/par', '10', null, '1', null, null);
INSERT INTO `t_menu` VALUES ('11', '词汇维护', 'system/word', '11', null, '1', null, null);
INSERT INTO `t_menu` VALUES ('12', '系统维护', 'system/user', '12', null, '1', null, null);
INSERT INTO `t_menu` VALUES ('13', '用户管理', 'system/user', '12', null, '1', null, null);
INSERT INTO `t_menu` VALUES ('17', '词汇类型', 'system/wordType', '12', null, '1', null, null);

-- ----------------------------
-- Table structure for t_mode
-- ----------------------------
DROP TABLE IF EXISTS `t_mode`;
CREATE TABLE `t_mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_mode_name` varchar(60) DEFAULT NULL,
  `g_mode_state` int(11) DEFAULT NULL,
  `g_mode_comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mode
-- ----------------------------

-- ----------------------------
-- Table structure for t_par
-- ----------------------------
DROP TABLE IF EXISTS `t_par`;
CREATE TABLE `t_par` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `p_name` varchar(60) DEFAULT NULL COMMENT '参数名',
  `p_value` varchar(60) DEFAULT NULL COMMENT '参数值',
  `p_state` int(11) DEFAULT NULL COMMENT '状态',
  `p_comment` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_par
-- ----------------------------
INSERT INTO `t_par` VALUES ('1', 'name', 'value', null, 'test');

-- ----------------------------
-- Table structure for t_premission
-- ----------------------------
DROP TABLE IF EXISTS `t_premission`;
CREATE TABLE `t_premission` (
  `premissionid` int(10) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `roleid` int(10) DEFAULT NULL COMMENT '角色id',
  `meuurl` varchar(32) DEFAULT '' COMMENT '菜单url',
  PRIMARY KEY (`premissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of t_premission
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `roleid` int(10) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `rolename` varchar(32) DEFAULT '' COMMENT '角色名称',
  `roledesc` varchar(64) DEFAULT '' COMMENT '角色描述',
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(60) DEFAULT NULL,
  `g_nickname` varchar(60) DEFAULT NULL,
  `g_password` varchar(60) DEFAULT NULL,
  `g_state` int(11) DEFAULT NULL,
  `g_rank` int(11) DEFAULT NULL,
  `g_login_time` date DEFAULT NULL,
  `g_roleid` int(10) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('2', 'admin', null, 'sa', null, null, null, '1');

-- ----------------------------
-- Table structure for t_word
-- ----------------------------
DROP TABLE IF EXISTS `t_word`;
CREATE TABLE `t_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_word_chinese` varchar(60) DEFAULT NULL,
  `g_word_english` varchar(60) DEFAULT NULL,
  `g_word_type` int(11) DEFAULT NULL,
  `g_word_type_name` varchar(20) DEFAULT NULL,
  `g_word_rank` int(11) DEFAULT NULL,
  `g_word_comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_word
-- ----------------------------
INSERT INTO `t_word` VALUES ('1', '苹果', 'apple', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('2', '香蕉', 'banana', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('3', '橘子', 'orange', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('4', '一', 'one', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('6', '二', 'two', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('7', '狮子', 'lion', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('9', '老虎', 'tiger', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('10', '大象', 'elephant', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('11', '黄色', 'yellow', '4', '颜色', null, null);
INSERT INTO `t_word` VALUES ('12', '蓝色', 'blue', '4', '颜色', null, null);
INSERT INTO `t_word` VALUES ('13', '红色', 'red', '4', '颜色', null, null);
INSERT INTO `t_word` VALUES ('16', '桌子', 'table', '5', '家具', null, null);
INSERT INTO `t_word` VALUES ('17', '凳子', 'chair', '5', '家具', null, null);
INSERT INTO `t_word` VALUES ('18', '柜子', 'cabinet', '5', '家具', null, null);
INSERT INTO `t_word` VALUES ('19', '英国', 'England', '6', '国家', null, null);
INSERT INTO `t_word` VALUES ('20', '美国', 'America', '6', '国家', null, null);
INSERT INTO `t_word` VALUES ('21', '中国', 'China', '6', '国家', null, null);
INSERT INTO `t_word` VALUES ('22', '钢笔', 'pen', '7', '文具用品', null, null);
INSERT INTO `t_word` VALUES ('23', '本子', 'notebook', '7', '文具用品', null, null);
INSERT INTO `t_word` VALUES ('24', '铅笔', 'pencil', '7', '文具用品', null, null);
INSERT INTO `t_word` VALUES ('25', '菠萝', 'pineapple', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('26', '芒果', 'mango', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('27', '梨子', 'pear', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('28', '葡萄', 'grape', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('29', '桃子', 'peach', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('39', '火龙果', 'pitaya', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('40', '橙子', 'orange', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('41', '西瓜', 'watermelon', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('42', '草莓', 'strawberry', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('43', '荔枝', 'litchi', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('44', '石榴', 'pomegranate', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('45', '李子', 'plum', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('46', '杏子', 'apricot', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('47', '木瓜', 'papaya', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('48', '樱桃', 'cherry', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('49', '柚子', 'pumelo', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('50', '榴莲', 'durin', '1', '水果', null, null);
INSERT INTO `t_word` VALUES ('51', '三', 'three', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('52', '四', 'four', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('53', '五', 'five', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('54', '六', 'six', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('55', '七', 'seven', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('56', '八', 'eight', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('57', '九', 'nine', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('58', '十', 'ten', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('59', '十一', 'eleven', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('60', '十二', 'twelve', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('61', '十三', 'thirteen', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('62', '十四', 'fourteen', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('63', '十五', 'fifteen', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('64', '十六', 'sixteen', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('65', '十七', 'seventeen', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('66', '十八', 'eighteen', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('67', '十九', 'nineteen', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('68', '二十', 'twenty', '2', '数字', null, null);
INSERT INTO `t_word` VALUES ('69', '鹿', 'deer', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('70', '豹', 'leopard', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('71', '马', 'horse', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('72', '熊', 'bear', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('73', '牛', 'ox', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('74', '绵羊', 'sheep', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('75', '狗', 'dog', '3', '颜色', null, null);
INSERT INTO `t_word` VALUES ('76', '猫', 'cat', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('77', '驴', 'donkey', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('78', '袋鼠', 'kangaroo', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('79', '刺猬', 'hedgehog', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('80', '鸭子', 'duck', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('81', '猪', 'pig', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('82', '狐狸', 'fox', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('83', '斑马', 'zebra', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('84', '狼', 'wolf', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('85', '骆驼', 'camel', '3', '动物', null, null);
INSERT INTO `t_word` VALUES ('86', '绿色', 'green', '4', '颜色', null, null);
INSERT INTO `t_word` VALUES ('87', '紫色', 'purple', '4', '颜色', null, null);
INSERT INTO `t_word` VALUES ('88', '粉红色', 'pink', '4', '颜色', null, null);
INSERT INTO `t_word` VALUES ('89', '褐色', 'brown', '4', '颜色', null, null);
INSERT INTO `t_word` VALUES ('91', '白色', 'white', '4', '颜色', null, null);
INSERT INTO `t_word` VALUES ('92', '灰色', 'gray', '4', '颜色', null, null);
INSERT INTO `t_word` VALUES ('93', '米色', 'beige', '4', '颜色', null, null);

-- ----------------------------
-- Table structure for t_word_type
-- ----------------------------
DROP TABLE IF EXISTS `t_word_type`;
CREATE TABLE `t_word_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型编号',
  `g_word_type_name` varchar(20) DEFAULT NULL COMMENT '类型名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_word_type
-- ----------------------------
INSERT INTO `t_word_type` VALUES ('1', '水果');
INSERT INTO `t_word_type` VALUES ('2', '数字');
INSERT INTO `t_word_type` VALUES ('3', '动物');
INSERT INTO `t_word_type` VALUES ('4', '颜色');
INSERT INTO `t_word_type` VALUES ('5', '家具');
INSERT INTO `t_word_type` VALUES ('6', '国家');
INSERT INTO `t_word_type` VALUES ('7', '文具');
