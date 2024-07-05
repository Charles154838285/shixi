/*
 Navicat Premium Data Transfer

 Source Server         : 学习数据库
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost:3306
 Source Schema         : yf09_rbac

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : 65001

 Date: 14/10/2020 14:51:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for role_link_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_link_menu`;
CREATE TABLE `role_link_menu`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'UUID',
  `role_id` int(11) NOT NULL COMMENT '对应SYS_ROLE表中的主键',
  `menu_id` int(11) NOT NULL COMMENT '对应SYS_MENU表中的主键',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `menu_id`(`menu_id`) USING BTREE,
  CONSTRAINT `role_link_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_link_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_link_menu
-- ----------------------------
INSERT INTO `role_link_menu` VALUES ('55a0ea97-d622-11ea-b918-f0def19bab84', 4, -103);
INSERT INTO `role_link_menu` VALUES ('55a0f52c-d622-11ea-b918-f0def19bab84', 4, -201);
INSERT INTO `role_link_menu` VALUES ('55a0fac6-d622-11ea-b918-f0def19bab84', 4, 127);
INSERT INTO `role_link_menu` VALUES ('55a0fec5-d622-11ea-b918-f0def19bab84', 4, -101);
INSERT INTO `role_link_menu` VALUES ('55a101e6-d622-11ea-b918-f0def19bab84', 4, -102);
INSERT INTO `role_link_menu` VALUES ('64f1c1a1-d622-11ea-b918-f0def19bab84', -666, -202);
INSERT INTO `role_link_menu` VALUES ('64f1cd3b-d622-11ea-b918-f0def19bab84', -666, -201);
INSERT INTO `role_link_menu` VALUES ('64f1d2fc-d622-11ea-b918-f0def19bab84', -666, -103);
INSERT INTO `role_link_menu` VALUES ('64f1d845-d622-11ea-b918-f0def19bab84', -666, -102);
INSERT INTO `role_link_menu` VALUES ('64f1dd04-d622-11ea-b918-f0def19bab84', -666, -101);
INSERT INTO `role_link_menu` VALUES ('64f1e233-d622-11ea-b918-f0def19bab84', -666, 127);
INSERT INTO `role_link_menu` VALUES ('b16f4009-6a59-11ea-a90f-f0def19bab84', 1, -201);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'UUID',
  `dict_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '显示值',
  `dict_value` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实际值',
  `dict_key` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组获取信息',
  `sort` int(2) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('111', '男生', '1', 'SEX', 1);
INSERT INTO `sys_dict` VALUES ('222', '女生', '2', 'SEX', 2);
INSERT INTO `sys_dict` VALUES ('34565a4e-74f0-11e8-aea3-f0def19bab84', '激活', '1', 'USER_STATUS', 1);
INSERT INTO `sys_dict` VALUES ('348acf31-74f0-11e8-aea3-f0def19bab84', '禁用', '2', 'USER_STATUS', 2);
INSERT INTO `sys_dict` VALUES ('406a0202-d93e-11ea-ba55-f0def19bab84', 'dddd', 'dddd', 'DDD', 1);
INSERT INTO `sys_dict` VALUES ('6b9a98b1-c963-11ea-83f0-f0def19bab84', '过桥费', '400', 'SFBZ', 1);
INSERT INTO `sys_dict` VALUES ('7f603a8e-c963-11ea-83f0-f0def19bab84', '过路费', '300', 'SFBZ', 2);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('114bdf1f-caf9-11ea-83f0-f0def19bab84', '用户管理 - 查询', 'super', '127.0.0.1', 'com.framework.rbac.user.service.impl.UserServiceImpl.find', '[{\"pageNow\":1,\"pageSize\":2,\"totalCount\":11,\"totalPages\":6,\"offset\":0,\"datas\":[{\"userId\":-999,\"account\":\"super\",\"userName\":\"孙大圣11\",\"status\":1,\"createDate\":1528768941000,\"loginDate\":1595296136000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1595296180251.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}},{\"userId\":-888,\"account\":\"admin\",\"userName\":\"胖先森\",\"status\":1,\"createDate\":1528855921000,\"loginDate\":1585135927000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1594783169440.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}}],\"queryMap\":{}}]', '2020-07-21 10:22:37');
INSERT INTO `sys_log` VALUES ('14c89515-caef-11ea-83f0-f0def19bab84', '用户管理 - 查询', 'super', '127.0.0.1', 'com.framework.rbac.user.service.impl.UserServiceImpl.find', '[{\"pageNow\":1,\"pageSize\":2,\"totalCount\":11,\"totalPages\":6,\"offset\":0,\"datas\":[{\"userId\":-999,\"account\":\"super\",\"userName\":\"孙大圣\",\"status\":1,\"createDate\":1528768941000,\"loginDate\":1595293618000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1584865207419_404375.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}},{\"userId\":-888,\"account\":\"admin\",\"userName\":\"胖先森\",\"status\":1,\"createDate\":1528855921000,\"loginDate\":1585135927000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1594783169440.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}}],\"queryMap\":{}}]', '2020-07-21 09:11:08');
INSERT INTO `sys_log` VALUES ('2976eca1-fe0e-11e9-8e02-f0def19bab84', '删除菜单', 'super', '127.0.0.1', 'com.os.framework.rbac.menu.service.impl.MenuServiceImpl.delete', '[5]', '2019-11-03 15:47:19');
INSERT INTO `sys_log` VALUES ('5972b05d-caf0-11ea-83f0-f0def19bab84', '用户管理 - 查询', 'super', '127.0.0.1', 'com.framework.rbac.user.service.impl.UserServiceImpl.find', '[{\"pageNow\":1,\"pageSize\":2,\"totalCount\":11,\"totalPages\":6,\"offset\":0,\"datas\":[{\"userId\":-999,\"account\":\"super\",\"userName\":\"孙大圣\",\"status\":1,\"createDate\":1528768941000,\"loginDate\":1595294408000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1584865207419_404375.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}},{\"userId\":-888,\"account\":\"admin\",\"userName\":\"胖先森\",\"status\":1,\"createDate\":1528855921000,\"loginDate\":1585135927000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1594783169440.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}}],\"queryMap\":{}}]', '2020-07-21 09:20:13');
INSERT INTO `sys_log` VALUES ('67e8a230-c8a7-11ea-8a2b-f0def19bab84', '用户管理 - 查询', 'super', '127.0.0.1', 'com.framework.rbac.user.service.impl.UserServiceImpl.find', '[{\"pageNow\":1,\"pageSize\":2,\"totalCount\":11,\"totalPages\":6,\"offset\":0,\"datas\":[{\"userId\":-999,\"account\":\"super\",\"userName\":\"孙大圣\",\"status\":1,\"createDate\":1528768941000,\"loginDate\":1595043178000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1584865207419_404375.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}},{\"userId\":-888,\"account\":\"admin\",\"userName\":\"胖先森\",\"status\":1,\"createDate\":1528855921000,\"loginDate\":1585135927000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1594783169440.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}}],\"queryMap\":{}}]', '2020-07-18 11:33:12');
INSERT INTO `sys_log` VALUES ('68f44329-ffb8-11e9-b4ee-f0def19bab84', '更新授权', 'super', '127.0.0.1', 'com.os.framework.rbac.menu.service.impl.MenuServiceImpl.updatePermission', '[-666,[-103,-102,-101]]', '2019-11-05 18:38:31');
INSERT INTO `sys_log` VALUES ('6b71fbaa-caf1-11ea-83f0-f0def19bab84', '用户管理 - 查询', 'super', '127.0.0.1', 'com.framework.rbac.user.service.impl.UserServiceImpl.find', '[{\"pageNow\":1,\"pageSize\":2,\"totalCount\":11,\"totalPages\":6,\"offset\":0,\"datas\":[{\"userId\":-999,\"account\":\"super\",\"userName\":\"孙大圣\",\"status\":1,\"createDate\":1528768941000,\"loginDate\":1595294621000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1595294818576.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}},{\"userId\":-888,\"account\":\"admin\",\"userName\":\"胖先森\",\"status\":1,\"createDate\":1528855921000,\"loginDate\":1585135927000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1594783169440.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}}],\"queryMap\":{}}]', '2020-07-21 09:27:53');
INSERT INTO `sys_log` VALUES ('71cf54ed-caf1-11ea-83f0-f0def19bab84', '用户管理 - 查询', 'super', '127.0.0.1', 'com.framework.rbac.user.service.impl.UserServiceImpl.find', '[{\"pageNow\":1,\"pageSize\":2,\"totalCount\":11,\"totalPages\":6,\"offset\":0,\"datas\":[{\"userId\":-999,\"account\":\"super\",\"userName\":\"孙大圣\",\"status\":1,\"createDate\":1528768941000,\"loginDate\":1595294621000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1595294818576.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}},{\"userId\":-888,\"account\":\"admin\",\"userName\":\"胖先森\",\"status\":1,\"createDate\":1528855921000,\"loginDate\":1585135927000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1594783169440.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}}],\"queryMap\":{}}]', '2020-07-21 09:28:03');
INSERT INTO `sys_log` VALUES ('7397060e-ffb8-11e9-b4ee-f0def19bab84', '删除菜单', 'super', '127.0.0.1', 'com.os.framework.rbac.menu.service.impl.MenuServiceImpl.delete', '[14]', '2019-11-05 18:38:49');
INSERT INTO `sys_log` VALUES ('753f809d-ffb8-11e9-b4ee-f0def19bab84', '删除菜单', 'super', '127.0.0.1', 'com.os.framework.rbac.menu.service.impl.MenuServiceImpl.delete', '[15]', '2019-11-05 18:38:52');
INSERT INTO `sys_log` VALUES ('7c0b0b8d-ffb8-11e9-b4ee-f0def19bab84', '更新菜单', 'super', '127.0.0.1', 'com.os.framework.rbac.menu.service.impl.MenuServiceImpl.update', '[{\"menu_id\":-202,\"parent_id\":-100,\"menu_name\":\"操作日志\",\"url\":\"sys/log/index\"}]', '2019-11-05 18:39:03');
INSERT INTO `sys_log` VALUES ('81f71280-ffb8-11e9-b4ee-f0def19bab84', '更新菜单', 'super', '127.0.0.1', 'com.os.framework.rbac.menu.service.impl.MenuServiceImpl.update', '[{\"menu_id\":-202,\"parent_id\":-200,\"menu_name\":\"操作日志\",\"url\":\"sys/log/index\"}]', '2019-11-05 18:39:13');
INSERT INTO `sys_log` VALUES ('838bd81d-fe0d-11e9-8e02-f0def19bab84', '删除菜单', 'super', '127.0.0.1', 'com.os.framework.rbac.menu.service.impl.MenuServiceImpl.delete', '[7]', '2019-11-03 15:42:41');
INSERT INTO `sys_log` VALUES ('8585ef79-caee-11ea-83f0-f0def19bab84', '用户管理 - 查询', 'super', '127.0.0.1', 'com.framework.rbac.user.service.impl.UserServiceImpl.find', '[{\"pageNow\":1,\"pageSize\":2,\"totalCount\":11,\"totalPages\":6,\"offset\":0,\"datas\":[{\"userId\":-999,\"account\":\"super\",\"userName\":\"孙大圣\",\"status\":1,\"createDate\":1528768941000,\"loginDate\":1595293618000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1584865207419_404375.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}},{\"userId\":-888,\"account\":\"admin\",\"userName\":\"胖先森\",\"status\":1,\"createDate\":1528855921000,\"loginDate\":1585135927000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1594783169440.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}}],\"queryMap\":{}}]', '2020-07-21 09:07:08');
INSERT INTO `sys_log` VALUES ('c37d4dd7-fe0d-11e9-8e02-f0def19bab84', '删除菜单', 'super', '127.0.0.1', 'com.os.framework.rbac.menu.service.impl.MenuServiceImpl.delete', '[6]', '2019-11-03 15:44:28');
INSERT INTO `sys_log` VALUES ('d64aac1e-caf8-11ea-83f0-f0def19bab84', '用户管理 - 查询', 'super', '127.0.0.1', 'com.framework.rbac.user.service.impl.UserServiceImpl.find', '[{\"pageNow\":1,\"pageSize\":2,\"totalCount\":11,\"totalPages\":6,\"offset\":0,\"datas\":[{\"userId\":-999,\"account\":\"super\",\"userName\":\"孙大圣11\",\"status\":1,\"createDate\":1528768941000,\"loginDate\":1595296136000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1595296180251.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}},{\"userId\":-888,\"account\":\"admin\",\"userName\":\"胖先森\",\"status\":1,\"createDate\":1528855921000,\"loginDate\":1585135927000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1594783169440.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}}],\"queryMap\":{}}]', '2020-07-21 10:20:58');
INSERT INTO `sys_log` VALUES ('d8fd963d-d86f-11ea-a6f3-f0def19bab84', '菜单管理-新建节点', 'super', '127.0.0.1', 'com.framework.rbac.menu.service.impl.MenuServiceImpl.add', '[{\"menuId\":128,\"parentId\":-99,\"menuName\":\"11111\",\"icon\":\"fa fa-500px\",\"url\":\"sys/category\",\"sort\":1}]', '2020-08-07 13:35:42');
INSERT INTO `sys_log` VALUES ('ef0b4dcc-caf6-11ea-83f0-f0def19bab84', '用户管理 - 查询', 'super', '127.0.0.1', 'com.framework.rbac.user.service.impl.UserServiceImpl.find', '[{\"pageNow\":1,\"pageSize\":2,\"totalCount\":11,\"totalPages\":6,\"offset\":0,\"datas\":[{\"userId\":-999,\"account\":\"super\",\"userName\":\"孙大圣55\",\"status\":1,\"createDate\":1528768941000,\"loginDate\":1595296136000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1595296180251.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}},{\"userId\":-888,\"account\":\"admin\",\"userName\":\"胖先森\",\"status\":1,\"createDate\":1528855921000,\"loginDate\":1585135927000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1594783169440.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}}],\"queryMap\":{}}]', '2020-07-21 10:07:21');
INSERT INTO `sys_log` VALUES ('f0a5dcc0-d86f-11ea-a6f3-f0def19bab84', '菜单管理-更新节点', 'super', '127.0.0.1', 'com.framework.rbac.menu.service.impl.MenuServiceImpl.update', '[{\"menuId\":128,\"parentId\":-99,\"menuName\":\"2222\",\"icon\":\"fa fa-500px\",\"url\":\"sys/category\",\"sort\":1}]', '2020-08-07 13:36:22');
INSERT INTO `sys_log` VALUES ('f577cf58-1577-11ea-85a1-f0def19bab84', '更新授权', 'admin', '127.0.0.1', 'com.os.framework.rbac.menu.service.impl.MenuServiceImpl.updatePermission', '[-666,[-103,-102,-101,-202,-201]]', '2019-12-03 10:52:35');
INSERT INTO `sys_log` VALUES ('fa791348-caf6-11ea-83f0-f0def19bab84', '用户管理 - 查询', 'super', '127.0.0.1', 'com.framework.rbac.user.service.impl.UserServiceImpl.find', '[{\"pageNow\":1,\"pageSize\":2,\"totalCount\":11,\"totalPages\":6,\"offset\":0,\"datas\":[{\"userId\":-999,\"account\":\"super\",\"userName\":\"孙大圣99\",\"status\":1,\"createDate\":1528768941000,\"loginDate\":1595296136000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1595296180251.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}},{\"userId\":-888,\"account\":\"admin\",\"userName\":\"胖先森\",\"status\":1,\"createDate\":1528855921000,\"loginDate\":1585135927000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1594783169440.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}}],\"queryMap\":{}}]', '2020-07-21 10:07:40');
INSERT INTO `sys_log` VALUES ('fb48dbb4-d86f-11ea-a6f3-f0def19bab84', '菜单管理-删除节点', 'super', '127.0.0.1', 'com.framework.rbac.menu.service.impl.MenuServiceImpl.delete', '[128]', '2020-08-07 13:36:40');
INSERT INTO `sys_log` VALUES ('fbefdd13-caf8-11ea-83f0-f0def19bab84', '用户管理 - 查询', 'super', '127.0.0.1', 'com.framework.rbac.user.service.impl.UserServiceImpl.find', '[{\"pageNow\":1,\"pageSize\":2,\"totalCount\":11,\"totalPages\":6,\"offset\":0,\"datas\":[{\"userId\":-999,\"account\":\"super\",\"userName\":\"孙大圣11\",\"status\":1,\"createDate\":1528768941000,\"loginDate\":1595296136000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1595296180251.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}},{\"userId\":-888,\"account\":\"admin\",\"userName\":\"胖先森\",\"status\":1,\"createDate\":1528855921000,\"loginDate\":1585135927000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1594783169440.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}}],\"queryMap\":{}}]', '2020-07-21 10:22:02');
INSERT INTO `sys_log` VALUES ('fc1cd149-fef1-11e9-b72e-f0def19bab84', '新建菜单', 'super', '127.0.0.1', 'com.os.framework.rbac.menu.service.impl.MenuServiceImpl.add', '[{\"menu_name\":\"cccc\"}]', '2019-11-04 18:58:08');
INSERT INTO `sys_log` VALUES ('fe0acc3d-caf2-11ea-83f0-f0def19bab84', '用户管理 - 查询', 'super', '127.0.0.1', 'com.framework.rbac.user.service.impl.UserServiceImpl.find', '[{\"pageNow\":1,\"pageSize\":2,\"totalCount\":11,\"totalPages\":6,\"offset\":0,\"datas\":[{\"userId\":-999,\"account\":\"super\",\"userName\":\"孙大圣\",\"status\":1,\"createDate\":1528768941000,\"loginDate\":1595294621000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1595295498052.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}},{\"userId\":-888,\"account\":\"admin\",\"userName\":\"胖先森\",\"status\":1,\"createDate\":1528855921000,\"loginDate\":1585135927000,\"ipAddress\":\"127.0.0.1\",\"photo\":\"1594783169440.jpg\",\"roleId\":-666,\"role\":{\"roleId\":-666,\"roleName\":\"超级管理员\",\"roleKey\":\"MANAGER\",\"remark\":\"超级管理员\"}}],\"queryMap\":{}}]', '2020-07-21 09:39:08');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单主键',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '自身一对多和多对一逻辑外键',
  `menu_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单的图标',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '设置开发的功能访问路径',
  `sort` int(2) NOT NULL DEFAULT 1 COMMENT '排序',
  `status` int(1) NULL DEFAULT 1 COMMENT '1:显示 2:隐藏',
  PRIMARY KEY (`menu_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  CONSTRAINT `sys_menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `sys_menu` (`menu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (-202, -200, '操作日志', '', 'sys/log/index', 2, 1);
INSERT INTO `sys_menu` VALUES (-201, -200, '字典管理', '', 'sys/dict/index', 1, 1);
INSERT INTO `sys_menu` VALUES (-200, NULL, '系统设置', 'fa fa-life-ring', NULL, 2, 1);
INSERT INTO `sys_menu` VALUES (-103, -100, '菜单管理', '', 'sys/menu/index', 3, 1);
INSERT INTO `sys_menu` VALUES (-102, -100, '角色管理', '', 'sys/role/list', 2, 1);
INSERT INTO `sys_menu` VALUES (-101, -100, '用户管理', 'fa fa-users', 'sys/user/find', 1, 1);
INSERT INTO `sys_menu` VALUES (-100, NULL, '系统管理', '', '', 1, 1);
INSERT INTO `sys_menu` VALUES (-99, NULL, '班级管理', '', '', 1, 1);
INSERT INTO `sys_menu` VALUES (125, NULL, '教务管理', 'fa fa-amazon', '', 1, 1);
INSERT INTO `sys_menu` VALUES (127, 125, '学生档案管理', 'fa fa-binoculars', 'student/find', 1, 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色主键',
  `role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称(允许重复)',
  `role_key` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色标识,开发人员设置,唯一性',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '角色描述',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `role_key`(`role_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (-666, '超级管理员', 'MANAGER', '超级管理员');
INSERT INTO `sys_role` VALUES (1, '系统管理员', 'super1234', '系统管理员系统管理员');
INSERT INTO `sys_role` VALUES (2, '测试员', 'TEST', '');
INSERT INTO `sys_role` VALUES (4, '研发22', 'YF', '');
INSERT INTO `sys_role` VALUES (5, '超级超级管理员', 'SUPER_SUPER', '测试测试');
INSERT INTO `sys_role` VALUES (8, '超级超级管理员111', 'SUPER222', '测试测试');
INSERT INTO `sys_role` VALUES (11, '丁俊晖', 'DJ', '台球');
INSERT INTO `sys_role` VALUES (12, '呃呃呃', 'www', '');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号唯一',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码需要加密',
  `user_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户的姓名',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1:可用 2:禁用 -1:删除',
  `create_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '当前日期',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `ip_address` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录的IP地址',
  `photo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户头像',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '对应SYS_ROLE表主键',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (-999, 'super', '21232f297a57a5a743894a0e4a801fc3', '孙悟空', 1, '2018-06-12 10:02:21', '2020-08-09 14:37:59', '127.0.0.1', '1aee3e60c4ae437e9be3fa445cd7dcb7.jpg', -666);
INSERT INTO `sys_user` VALUES (-888, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '胖先森', 1, '2018-06-13 10:12:01', '2020-03-25 19:32:07', '127.0.0.1', '1594783169440.jpg', -666);
INSERT INTO `sys_user` VALUES (-777, 'test', 'e10adc3949ba59abbe56e057f20f883e', '沙僧', 2, '2018-06-13 10:12:01', '2018-06-06 10:12:08', '192.168.7.199', '1584965137414_380247.jpg', NULL);
INSERT INTO `sys_user` VALUES (1, 'os', 'e10adc3949ba59abbe56e057f20f883e', '杨毅', 1, '2018-06-12 11:30:43', '2019-10-25 18:49:21', '127.0.0.1', '830042ac77f042189dbc341087f1b10d.jpg', NULL);
INSERT INTO `sys_user` VALUES (2, 'aaaaaa', 'c86edc5f27e28366fc07cd7a27383fd9', '悟空', 1, '2018-06-13 13:45:14', NULL, NULL, '', NULL);
INSERT INTO `sys_user` VALUES (3, 'super123', 'e10adc3949ba59abbe56e057f20f883e', '悟空', 1, '2018-06-13 14:10:31', '2020-07-31 15:41:01', '127.0.0.1', '', 4);
INSERT INTO `sys_user` VALUES (4, 'gds', 'e10adc3949ba59abbe56e057f20f883e', '高大帅', 1, '2020-03-21 11:42:08', NULL, '', '', 1);
INSERT INTO `sys_user` VALUES (5, 'gadashuai', 'e10adc3949ba59abbe56e057f20f883e', '高大上', 1, '2020-03-21 11:44:52', NULL, '', '', 2);
INSERT INTO `sys_user` VALUES (6, 'super1234', 'e10adc3949ba59abbe56e057f20f883e', '八戒', 1, '2020-07-15 10:28:46', NULL, '', '', NULL);
INSERT INTO `sys_user` VALUES (7, 'super555', 'e10adc3949ba59abbe56e057f20f883e', '悟空555', 1, '2020-07-15 10:31:13', NULL, '', '', NULL);
INSERT INTO `sys_user` VALUES (8, 'super777', 'e10adc3949ba59abbe56e057f20f883e', '悟空7788888', 1, '2020-07-15 10:31:44', NULL, '', '', NULL);
INSERT INTO `sys_user` VALUES (9, 'manager', '123456', '天胖元素', 1, '2020-08-01 15:20:17', NULL, '', '', 1);

-- ----------------------------
-- View structure for menu_tree_view
-- ----------------------------
DROP VIEW IF EXISTS `menu_tree_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `menu_tree_view` AS SELECT parent_menu.*,child_menu.* FROM 
(SELECT menu_id id,menu_name parentName,IF(LENGTH(icon),icon,'fa fa-cubes') parentIcon,sort parentSort FROM sys_menu WHERE parent_id IS NULL) parent_menu
LEFT JOIN
(SELECT menu_id childId,parent_id parentId,menu_name childName,IF(LENGTH(icon),icon,'fa fa-cube') childIcon,sort childSort,url FROM sys_menu WHERE parent_id IS NOT NULL) child_menu
ON  parent_menu.id=child_menu.parentId
ORDER BY parent_menu.parentSort,child_menu.childSort ;

-- ----------------------------
-- View structure for sys_dict_view
-- ----------------------------
DROP VIEW IF EXISTS `sys_dict_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `sys_dict_view` AS SELECT a.dict_key `key`,b.dict_name label,b.dict_value `value`
FROM (SELECT DISTINCT dict_key FROM sys_dict) a,
(SELECT dict_key,dict_name,dict_value,sort FROM sys_dict) b
WHERE a.dict_key=b.dict_key
ORDER BY a.dict_key, b.sort ;

SET FOREIGN_KEY_CHECKS = 1;
