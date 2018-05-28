/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : ag_admin

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 07/02/2018 09:31:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for ag_doc
-- ----------------------------
DROP TABLE IF EXISTS `ag_doc`;
CREATE TABLE `ag_doc`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longblob NULL COMMENT '正文',
  `article` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `state` int(2) NULL DEFAULT NULL COMMENT '审核状态',
  `dt` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `modifyid` int(11) NULL DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createdate` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `delete_flag` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for element
-- ----------------------------
DROP TABLE IF EXISTS `element`;
CREATE TABLE `element`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源编码',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源类型',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源路径',
  `menu_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源关联菜单',
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '资源树状检索路径',
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源请求类型',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `crt_time` datetime(0) NULL DEFAULT NULL,
  `crt_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `crt_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `crt_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of element
-- ----------------------------
INSERT INTO `element` VALUES (65, '1002', 'other', 'getmenutree', '/role/getMenuTree', '2', NULL, NULL, 'post', '查询菜单树', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (66, '2002', 'other', 'getrolename', '/role/getRoleName', '2', NULL, NULL, 'post', '查询权限组', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (67, '3002', 'other', 'getrolebyid', '/role/getRoleById', '2', NULL, NULL, 'post', '获取当前权限组菜单', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (68, '4002', 'button', 'addRole', '/role/addRole', '2', NULL, NULL, 'post', '新建权限组', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (69, '5002', 'button', 'editRole', '/role/editRole', '2', NULL, NULL, 'post', '编辑权限组', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (70, '6002', 'button', 'saveRolebyId', '/role/saveRolebyId', '2', NULL, NULL, 'post', '保存菜单权限', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (71, '7002', 'button', 'getUserName', '/user/getUserName/', '2', NULL, NULL, 'post', '查询用户', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (72, '8002', 'button', 'editUserRole', '/user/editUserRole', '2', NULL, NULL, 'post', '编辑用户权限', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (73, '1003', 'button', 'addDemo', '/demo/add', '3', NULL, NULL, 'post', '新增', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (74, '2003', 'button', 'editDemo', '/demo/edit', '3', NULL, NULL, 'post', '编辑', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (75, '3003', 'button', 'deleteDemo', '/demo/delete', '3', NULL, NULL, 'post', '删除', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (76, '4003', 'other', 'getallDemo', '/demo/getall', '3', NULL, NULL, 'post', '查询所有', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (77, '5003', 'other', 'getpageDemo', '/demo/getpage', '3', NULL, NULL, 'post', '查询分页', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (78, '1005', 'button', 'addAgDoc', '/agDoc/add', '5', NULL, NULL, 'post', '新增', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (79, '2005', 'button', 'editAgDoc', '/agDoc/edit', '5', NULL, NULL, 'post', '编辑', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (80, '3005', 'button', 'deleteAgDoc', '/agDoc/delete', '5', NULL, NULL, 'post', '删除', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (81, '4005', 'other', 'getallAgDoc', '/agDoc/getall', '5', NULL, NULL, 'post', '查询所有', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `element` VALUES (82, '5005', 'other', 'getpageAgDoc', '/agDoc/getpage', '5', NULL, NULL, 'post', '查询分页', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for groupOwner
-- ----------------------------
DROP TABLE IF EXISTS `groupOwner`;
CREATE TABLE `groupOwner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  `groupid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 177 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组拥有人' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for groupinfo
-- ----------------------------
DROP TABLE IF EXISTS `groupinfo`;
CREATE TABLE `groupinfo`  (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组名',
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` int(20) NULL DEFAULT NULL COMMENT '组类型',
  PRIMARY KEY (`groupid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of groupinfo
-- ----------------------------
INSERT INTO `groupinfo` VALUES (2, '管理组', '测试', 0);
INSERT INTO `groupinfo` VALUES (17, '财务', '', 0);

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  `groupid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `groupid`(`groupid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 789 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (69, 1, 0);
INSERT INTO `groups` VALUES (70, 3371, 0);
INSERT INTO `groups` VALUES (71, 3374, 0);
INSERT INTO `groups` VALUES (72, 3376, 0);
INSERT INTO `groups` VALUES (73, 3380, 0);
INSERT INTO `groups` VALUES (74, 3425, 0);
INSERT INTO `groups` VALUES (75, 3491, 0);
INSERT INTO `groups` VALUES (76, 3513, 0);
INSERT INTO `groups` VALUES (77, 3370, 0);
INSERT INTO `groups` VALUES (78, 3375, 0);
INSERT INTO `groups` VALUES (79, 3402, 0);
INSERT INTO `groups` VALUES (80, 3445, 0);
INSERT INTO `groups` VALUES (81, 3482, 0);
INSERT INTO `groups` VALUES (82, 3483, 0);
INSERT INTO `groups` VALUES (83, 3484, 0);
INSERT INTO `groups` VALUES (84, 3511, 0);
INSERT INTO `groups` VALUES (85, 3512, 0);
INSERT INTO `groups` VALUES (86, 3369, 0);
INSERT INTO `groups` VALUES (87, 3379, 0);
INSERT INTO `groups` VALUES (89, 3440, 0);
INSERT INTO `groups` VALUES (90, 3521, 0);
INSERT INTO `groups` VALUES (620, 3369, 11);
INSERT INTO `groups` VALUES (621, 3379, 11);
INSERT INTO `groups` VALUES (622, 3440, 11);
INSERT INTO `groups` VALUES (623, 3521, 11);
INSERT INTO `groups` VALUES (624, 3491, 11);
INSERT INTO `groups` VALUES (625, 3388, 11);
INSERT INTO `groups` VALUES (626, 3370, 14);
INSERT INTO `groups` VALUES (627, 3402, 14);
INSERT INTO `groups` VALUES (628, 3484, 14);
INSERT INTO `groups` VALUES (629, 3512, 14);
INSERT INTO `groups` VALUES (633, 3376, 4);
INSERT INTO `groups` VALUES (634, 3380, 4);
INSERT INTO `groups` VALUES (635, 3513, 4);
INSERT INTO `groups` VALUES (636, 3425, 4);
INSERT INTO `groups` VALUES (637, 3539, 4);
INSERT INTO `groups` VALUES (662, 3379, 16);
INSERT INTO `groups` VALUES (663, 3491, 16);
INSERT INTO `groups` VALUES (664, 3521, 16);
INSERT INTO `groups` VALUES (739, 3371, 2);
INSERT INTO `groups` VALUES (740, 3374, 2);
INSERT INTO `groups` VALUES (741, 3376, 2);
INSERT INTO `groups` VALUES (742, 3380, 2);
INSERT INTO `groups` VALUES (743, 3425, 2);
INSERT INTO `groups` VALUES (744, 3491, 2);
INSERT INTO `groups` VALUES (745, 3513, 2);
INSERT INTO `groups` VALUES (746, 3370, 2);
INSERT INTO `groups` VALUES (747, 3375, 2);
INSERT INTO `groups` VALUES (748, 3402, 2);
INSERT INTO `groups` VALUES (749, 3445, 2);
INSERT INTO `groups` VALUES (750, 3482, 2);
INSERT INTO `groups` VALUES (751, 3483, 2);
INSERT INTO `groups` VALUES (752, 3484, 2);
INSERT INTO `groups` VALUES (753, 3511, 2);
INSERT INTO `groups` VALUES (754, 3512, 2);
INSERT INTO `groups` VALUES (755, 3369, 2);
INSERT INTO `groups` VALUES (756, 3379, 2);
INSERT INTO `groups` VALUES (757, 3440, 2);
INSERT INTO `groups` VALUES (758, 3521, 2);
INSERT INTO `groups` VALUES (759, 1, 2);
INSERT INTO `groups` VALUES (760, 3539, 2);
INSERT INTO `groups` VALUES (761, 2, 2);
INSERT INTO `groups` VALUES (762, 3388, 2);
INSERT INTO `groups` VALUES (763, 3260, 2);
INSERT INTO `groups` VALUES (764, 3089, 2);
INSERT INTO `groups` VALUES (765, 3374, 17);
INSERT INTO `groups` VALUES (766, 3371, 17);
INSERT INTO `groups` VALUES (767, 3376, 17);
INSERT INTO `groups` VALUES (768, 3380, 17);
INSERT INTO `groups` VALUES (769, 3425, 17);
INSERT INTO `groups` VALUES (770, 3491, 17);
INSERT INTO `groups` VALUES (771, 3513, 17);
INSERT INTO `groups` VALUES (772, 3370, 17);
INSERT INTO `groups` VALUES (773, 3375, 17);
INSERT INTO `groups` VALUES (774, 3402, 17);
INSERT INTO `groups` VALUES (775, 3445, 17);
INSERT INTO `groups` VALUES (776, 3482, 17);
INSERT INTO `groups` VALUES (777, 3483, 17);
INSERT INTO `groups` VALUES (778, 3484, 17);
INSERT INTO `groups` VALUES (779, 3511, 17);
INSERT INTO `groups` VALUES (780, 3512, 17);
INSERT INTO `groups` VALUES (781, 3369, 17);
INSERT INTO `groups` VALUES (782, 3379, 17);
INSERT INTO `groups` VALUES (783, 3440, 17);
INSERT INTO `groups` VALUES (784, 3521, 17);
INSERT INTO `groups` VALUES (785, 1, 17);
INSERT INTO `groups` VALUES (786, 3539, 17);
INSERT INTO `groups` VALUES (787, 2, 17);
INSERT INTO `groups` VALUES (788, 3388, 17);


-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径编码',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `menu_id` int(10) NULL DEFAULT NULL COMMENT '节点id',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级节点',
  `href` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `type` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_num` int(11) NULL DEFAULT 0 COMMENT '排序',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单上下级关系',
  `enabled` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '启用禁用',
  `crt_time` datetime(0) NULL DEFAULT NULL,
  `crt_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `crt_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `crt_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `upd_time` datetime(0) NULL DEFAULT NULL,
  `upd_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `upd_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `upd_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menu_id`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu`(`id`, `code`, `title`, `menu_id`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES (44, 'systemManager', '系统管理', 1, -1, NULL, 'sys', 'menu', 1, '一级菜单', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu`(`id`, `code`, `title`, `menu_id`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES (45, 'menuManager', '菜单权限管理', 2, 1, NULL, 'sys', 'menu', 1, '子菜单', '/System/menuManage', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu`(`id`, `code`, `title`, `menu_id`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES (46, 'DemoManage', '测试', 3, 1, NULL, 'sys', 'menu', 1, '子菜单', '/System/DemoManage', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu`(`id`, `code`, `title`, `menu_id`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES (47, 'DocManager', '文章管理', 4, -1, NULL, 'sys', 'menu', 2, '一级菜单', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu`(`id`, `code`, `title`, `menu_id`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES (48, 'Docmanage', '文章审核', 5, 4, '', 'sys', 'menu', 1, '子菜单', '/Documents/Doc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu`(`id`, `code`, `title`, `menu_id`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES (49, 'MonitorManage', '监控页面', 6, -1, NULL, 'sys', 'menu', 3, '一级菜单', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu`(`id`, `code`, `title`, `menu_id`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES (50, 'KibanaManage', 'kibana管理', 7, 6, NULL, 'syd', 'menu', 1, '子菜单', '/ThirdWeb/kibana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu`(`id`, `code`, `title`, `menu_id`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES (51, 'ZipkinManage', 'ZipKin管理', 8, 6, NULL, 'sys', 'menu', 2, '子菜单', '/ThirdWeb/zipkin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menu`(`id`, `code`, `title`, `menu_id`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES (52, 'adminManage', '监控', 9, 6, NULL, 'sys', 'menu', 3, '子菜单', '/ThirdWeb/springadmin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `role_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 used, 0 not used',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_name`(`role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员', 1);
INSERT INTO `role` VALUES (2, '测试2', 1);

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(20) NULL DEFAULT NULL,
  `menu_id` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15397 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (15374, 1, 1);
INSERT INTO `role_menu` VALUES (15375, 1, 2);
INSERT INTO `role_menu` VALUES (15376, 1, 3);
INSERT INTO `role_menu` VALUES (15377, 1, 4);
INSERT INTO `role_menu` VALUES (15378, 1, 5);
INSERT INTO `role_menu` VALUES (15379, 1, 1002);
INSERT INTO `role_menu` VALUES (15380, 1, 1003);
INSERT INTO `role_menu` VALUES (15381, 1, 1005);
INSERT INTO `role_menu` VALUES (15382, 1, 2002);
INSERT INTO `role_menu` VALUES (15383, 1, 2003);
INSERT INTO `role_menu` VALUES (15384, 1, 2005);
INSERT INTO `role_menu` VALUES (15385, 1, 3002);
INSERT INTO `role_menu` VALUES (15386, 1, 3003);
INSERT INTO `role_menu` VALUES (15387, 1, 3005);
INSERT INTO `role_menu` VALUES (15388, 1, 4002);
INSERT INTO `role_menu` VALUES (15389, 1, 4003);
INSERT INTO `role_menu` VALUES (15390, 1, 4005);
INSERT INTO `role_menu` VALUES (15391, 1, 5002);
INSERT INTO `role_menu` VALUES (15392, 1, 5003);
INSERT INTO `role_menu` VALUES (15393, 1, 5005);
INSERT INTO `role_menu` VALUES (15394, 1, 6002);
INSERT INTO `role_menu` VALUES (15395, 1, 7002);
INSERT INTO `role_menu` VALUES (15396, 1, 8002);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `roleid` int(11) NULL DEFAULT NULL COMMENT '权限id（显示菜单）',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (32, 'admin', 1, '8758E7924490B686E0D1F30B306819D6');

SET FOREIGN_KEY_CHECKS = 1;
