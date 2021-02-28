/*
 Navicat Premium Data Transfer

 Source Server         : PiYu
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : piyu

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 28/02/2021 17:11:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bg_role
-- ----------------------------
DROP TABLE IF EXISTS `bg_role`;
CREATE TABLE `bg_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bg_role
-- ----------------------------
INSERT INTO `bg_role` VALUES (1, 'ROLE_ADMIN', '超级管理员', 9999);
INSERT INTO `bg_role` VALUES (2, 'ROLE_BGUSER', '普通管理员', 100);

-- ----------------------------
-- Table structure for bg_user
-- ----------------------------
DROP TABLE IF EXISTS `bg_user`;
CREATE TABLE `bg_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `register_date` datetime(0) NOT NULL,
  `state` tinyint(1) NOT NULL COMMENT '用户禁止状态',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bg_user
-- ----------------------------
INSERT INTO `bg_user` VALUES (1, 'admin', '$e0801$NvzjMBo3F0WmVVLHhR9ZbWh664S3s4x6A4zGRWiCr75I6Hvg60WfG5WhvC4ZR1ty993dNuUSyJQtsMlObm1VJQ==$wr8HYe43VmghGxS5VeoCHrdl1dudxzpKsjKH1GPfTd4=', '2021-02-20 10:01:01', 1, 'pphboy@qq.com');
INSERT INTO `bg_user` VALUES (2, 'xiaopi', '$e0801$WrvbZKjGabVvM43HAWmEBoDQoP6O4OFmG30/l/3gSV4b5G8J/u8cMBqiCh0GF9A1IfOkS2zUqhQmJzGPSSQqTg==$DCVLk4Wo84Nq9A4gXt2ZYlFnPrVj6X2t44KA37vx2G4=', '2021-02-21 10:38:20', 1, 'xxx@qq.com');
INSERT INTO `bg_user` VALUES (39, 'pipi2', '$e0801$aFkpNbPCQYljx6uBhjtJJ9wqTQXZ08of2vm+brE1BS1NglOIeh65soTkI6zMYxyl1TXw8syr2n2cpNc+t8C5fQ==$1EkfsKIi1M/+2A8tyvWbFy2c251gocLsSzs9e3Ckv3g=', '2021-02-22 14:03:20', 1, '87095894@qq.com');
INSERT INTO `bg_user` VALUES (35, 'xxx', '$e0801$OItJ6LXd6skWGXjZc85UdR35vyD86IG2XDrTXOwS0yN69Q5yD16P/uwlJMO3qRrs+axziYjj8iK1RzQildouQw==$G8SLO+iINvOzht7sHnSfc78oeXxnvS+4XuJhcSPXyp0=', '2021-02-22 10:59:19', 0, '87095894@qq.com');
INSERT INTO `bg_user` VALUES (38, 'xxxx', '$e0801$uOj7dfcrjGX6VWxAVo5Tb+P7xnLIlq7ZOcgrE3nSYmVFQOHVMBIEOhGCp2yZVlsEj8a1i7wvCMqzzq6fzKC6kg==$BsGyHcrzrbd1TpZUt/kHqEFuNgBih6nyCci8QTQxZvk=', '2021-02-22 12:24:55', 0, '12312@qq.com');
INSERT INTO `bg_user` VALUES (36, 'pipihao', '$e0801$IPv5qUJQUfCM4JZ26RSawV3W3E1y5QZB6Irp04Xk/SX5uN5Wsctc7KXgG+JiT6NkYChVwq+4VEsLlchvBUsuxw==$0FzWRYnOHaL7wusY737W/ApEVqOMFA4TvQJaEdHwvcM=', '2021-02-22 11:12:10', 0, '87095894@qq.com');

-- ----------------------------
-- Table structure for bg_user_role
-- ----------------------------
DROP TABLE IF EXISTS `bg_user_role`;
CREATE TABLE `bg_user_role`  (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of bg_user_role
-- ----------------------------
INSERT INTO `bg_user_role` VALUES (1, 1);
INSERT INTO `bg_user_role` VALUES (1, 2);
INSERT INTO `bg_user_role` VALUES (39, 2);
INSERT INTO `bg_user_role` VALUES (35, 1);
INSERT INTO `bg_user_role` VALUES (35, 2);
INSERT INTO `bg_user_role` VALUES (2, 2);
INSERT INTO `bg_user_role` VALUES (36, 2);
INSERT INTO `bg_user_role` VALUES (38, 1);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `pi_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '皮物的id',
  `c_id` int(11) NULL DEFAULT NULL COMMENT '回复的id',
  `ctwo_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户尖',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '随便写的', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 14:52:54', 0);
INSERT INTO `comment` VALUES (2, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 15:12:52', 1);
INSERT INTO `comment` VALUES (3, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (4, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (5, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (6, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (7, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (8, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (9, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (10, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (11, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (12, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (13, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (14, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (15, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (16, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (17, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (18, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (19, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (20, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (21, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (22, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (23, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (24, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (25, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (26, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (27, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (28, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (29, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (30, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (31, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (32, '测试评论', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 16:56:04', 1);
INSERT INTO `comment` VALUES (33, '测试', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 18:13:40', 1);
INSERT INTO `comment` VALUES (34, '垃圾', '905cbf5367d14ee1', NULL, NULL, 10006, '2021-02-01 18:14:24', 1);
INSERT INTO `comment` VALUES (35, '123', '73', NULL, NULL, 10006, '2021-02-01 18:14:53', 1);
INSERT INTO `comment` VALUES (36, '123', '63', NULL, NULL, 10006, '2021-02-01 18:15:47', 1);
INSERT INTO `comment` VALUES (37, '随便写点什么', '69', NULL, NULL, 10006, '2021-02-01 18:17:01', 1);
INSERT INTO `comment` VALUES (38, '真不错', '69', NULL, NULL, 10006, '2021-02-01 18:17:08', 1);
INSERT INTO `comment` VALUES (39, '太好了', '69', NULL, NULL, 10006, '2021-02-01 18:17:12', 1);
INSERT INTO `comment` VALUES (40, '每一个不曾起舞的日子，都是对生命的辜负', '72736c93f5174562', NULL, NULL, 10006, '2021-02-01 18:19:19', 1);
INSERT INTO `comment` VALUES (41, '白工', '905cbf5367d14ee1', NULL, NULL, 10006, '2021-02-01 18:27:14', 1);
INSERT INTO `comment` VALUES (42, '什么代码', '905cbf5367d14ee1', NULL, NULL, 10006, '2021-02-01 19:27:07', 1);
INSERT INTO `comment` VALUES (43, '666', '905cbf5367d14ee1', NULL, NULL, 10006, '2021-02-01 19:28:22', 1);
INSERT INTO `comment` VALUES (44, '我是第一1？', '69', NULL, NULL, 10006, '2021-02-01 20:35:43', 1);
INSERT INTO `comment` VALUES (45, 'check', '73', NULL, NULL, 10007, '2021-02-01 20:36:10', 1);
INSERT INTO `comment` VALUES (46, '托儿索', 'c5f336a644184170', NULL, NULL, 10007, '2021-02-02 09:39:47', 1);
INSERT INTO `comment` VALUES (47, '我有一个梦想，就是成为神王，真的，成为神王', '73', NULL, NULL, 10007, '2021-02-02 16:07:30', 1);
INSERT INTO `comment` VALUES (48, '牛', '57', NULL, NULL, 10006, '2021-02-03 13:25:50', 1);
INSERT INTO `comment` VALUES (49, '写点什么', '60', NULL, NULL, 10006, '2021-02-03 13:56:46', 1);
INSERT INTO `comment` VALUES (50, '测试', '60', 49, NULL, 10006, '2021-02-03 14:59:22', 1);
INSERT INTO `comment` VALUES (51, '666,成功了', '60', 49, NULL, 10006, '2021-02-03 15:10:41', 1);
INSERT INTO `comment` VALUES (52, '牛逼', '60', 49, NULL, 10006, '2021-02-03 15:13:23', 1);
INSERT INTO `comment` VALUES (53, '回复牛逼', '60', 49, NULL, 10006, '2021-02-03 15:20:33', 1);
INSERT INTO `comment` VALUES (54, '回复牛逼', '60', 49, 53, 10006, '2021-02-03 15:20:49', 1);
INSERT INTO `comment` VALUES (55, '有点小强，不错', '60', 49, 54, 10006, '2021-02-03 15:24:26', 1);
INSERT INTO `comment` VALUES (56, '666666', '60', 49, 55, 10006, '2021-02-03 15:47:43', 1);
INSERT INTO `comment` VALUES (57, '哈哈', '60', 49, NULL, 10006, '2021-02-03 15:47:55', 1);
INSERT INTO `comment` VALUES (58, '太好 了', '60', NULL, NULL, 10006, '2021-02-03 15:48:05', 1);
INSERT INTO `comment` VALUES (59, '测试这个看看怎么样', '60', 58, NULL, 10006, '2021-02-03 15:48:17', 1);
INSERT INTO `comment` VALUES (60, '牛逼', '60', 58, 59, 10006, '2021-02-03 15:48:22', 1);
INSERT INTO `comment` VALUES (61, '太强了', '60', 58, 60, 10006, '2021-02-03 15:48:32', 1);
INSERT INTO `comment` VALUES (62, '太好了', '60', 58, 60, 10006, '2021-02-03 15:48:49', 1);
INSERT INTO `comment` VALUES (63, '评论一下', '60', 58, NULL, 10006, '2021-02-03 15:49:59', 1);
INSERT INTO `comment` VALUES (64, '牛牛牛', '60', 49, NULL, 10006, '2021-02-03 15:50:42', 1);

-- ----------------------------
-- Table structure for comment_like
-- ----------------------------
DROP TABLE IF EXISTS `comment_like`;
CREATE TABLE `comment_like`  (
  `c_id` int(11) NOT NULL COMMENT '评论id',
  `like` tinyint(1) NOT NULL COMMENT '为true是点赞，为false是踩',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `create_date` datetime(0) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of comment_like
-- ----------------------------
INSERT INTO `comment_like` VALUES (1, 1, 10006, '2021-02-01 18:50:01');
INSERT INTO `comment_like` VALUES (10, 1, 10006, '2021-02-01 19:05:30');
INSERT INTO `comment_like` VALUES (2, 1, 10006, '2021-02-01 19:05:52');
INSERT INTO `comment_like` VALUES (34, 1, 10006, '2021-02-01 19:18:35');
INSERT INTO `comment_like` VALUES (41, 0, 10006, '2021-02-01 19:26:08');
INSERT INTO `comment_like` VALUES (43, 1, 10006, '2021-02-01 19:28:27');
INSERT INTO `comment_like` VALUES (42, 0, 10006, '2021-02-01 19:28:46');
INSERT INTO `comment_like` VALUES (35, 1, 10006, '2021-02-01 19:36:34');
INSERT INTO `comment_like` VALUES (46, 1, 10006, '2021-02-02 09:40:15');
INSERT INTO `comment_like` VALUES (46, 1, 10007, '2021-02-02 09:40:36');
INSERT INTO `comment_like` VALUES (49, 1, 10006, '2021-02-03 13:56:58');

-- ----------------------------
-- Table structure for follows
-- ----------------------------
DROP TABLE IF EXISTS `follows`;
CREATE TABLE `follows`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '被关注者的id',
  `f_user_id` int(11) NOT NULL COMMENT '粉丝的id',
  `follow_time` datetime(0) NOT NULL COMMENT '关注的时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `f_user_id`(`f_user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of follows
-- ----------------------------
INSERT INTO `follows` VALUES (25, 10006, 10007, '2021-02-05 20:37:08');
INSERT INTO `follows` VALUES (26, 10007, 10006, '2021-02-06 16:28:57');
INSERT INTO `follows` VALUES (21, 10006, 10008, '2021-02-05 19:19:49');
INSERT INTO `follows` VALUES (22, 10006, 10009, '2021-02-05 19:24:13');
INSERT INTO `follows` VALUES (23, 10008, 10006, '2021-02-05 19:39:28');
INSERT INTO `follows` VALUES (24, 10009, 10006, '2021-02-05 19:39:35');

-- ----------------------------
-- Table structure for footprint
-- ----------------------------
DROP TABLE IF EXISTS `footprint`;
CREATE TABLE `footprint`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pi_product_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 194 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of footprint
-- ----------------------------
INSERT INTO `footprint` VALUES (4, 10006, 'c5f336a644184170', '2021-02-02 19:05:50');
INSERT INTO `footprint` VALUES (3, 10006, '65', '2021-02-02 19:05:41');
INSERT INTO `footprint` VALUES (136, 10006, '2f05053f7d2c4daa', '2021-02-04 10:47:48');
INSERT INTO `footprint` VALUES (7, 10006, '399d352e59704bd9', '2021-02-02 19:06:01');
INSERT INTO `footprint` VALUES (31, 10007, '65', '2021-02-03 10:04:32');
INSERT INTO `footprint` VALUES (23, 10007, '2f05053f7d2c4daa', '2021-02-03 09:19:21');
INSERT INTO `footprint` VALUES (27, 10007, '8c5891f796a54ea6', '2021-02-03 09:20:17');
INSERT INTO `footprint` VALUES (126, 10007, '60', '2021-02-04 10:24:27');
INSERT INTO `footprint` VALUES (12, 10007, '54', '2021-02-02 19:08:06');
INSERT INTO `footprint` VALUES (13, 10007, 'adfd9ffcb956403e', '2021-02-02 19:08:09');
INSERT INTO `footprint` VALUES (14, 10007, '8157ec4c0d6a4cc9', '2021-02-02 19:08:12');
INSERT INTO `footprint` VALUES (15, 10007, '52', '2021-02-02 19:08:15');
INSERT INTO `footprint` VALUES (16, 10007, '1dacb6792b4d4d95', '2021-02-02 19:08:19');
INSERT INTO `footprint` VALUES (17, 10007, '0d37d3d2a67044ff', '2021-02-02 19:08:22');
INSERT INTO `footprint` VALUES (21, 10007, 'ec86566b04294736', '2021-02-02 19:09:25');
INSERT INTO `footprint` VALUES (20, 10007, '6effc12353fb49a7', '2021-02-02 19:09:04');
INSERT INTO `footprint` VALUES (32, 10007, 'c5f336a644184170', '2021-02-03 12:24:41');
INSERT INTO `footprint` VALUES (26, 10007, '72736c93f5174562', '2021-02-03 09:20:03');
INSERT INTO `footprint` VALUES (33, 10007, '99798f9fa1ae4db5', '2021-02-03 12:29:26');
INSERT INTO `footprint` VALUES (34, 10007, '8', '2021-02-03 12:30:42');
INSERT INTO `footprint` VALUES (150, 10006, '99798f9fa1ae4db5', '2021-02-04 11:56:06');
INSERT INTO `footprint` VALUES (154, 10006, 'f3c9aa5664f44658', '2021-02-04 17:11:16');
INSERT INTO `footprint` VALUES (193, 10006, '57', '2021-02-22 20:14:08');
INSERT INTO `footprint` VALUES (167, 10006, '60', '2021-02-06 15:52:42');
INSERT INTO `footprint` VALUES (185, 10006, '7', '2021-02-07 09:30:54');
INSERT INTO `footprint` VALUES (187, 10006, '56', '2021-02-14 19:58:41');
INSERT INTO `footprint` VALUES (96, 10006, 'd21c37bbf8c2481b', '2021-02-04 09:26:50');
INSERT INTO `footprint` VALUES (161, 10006, 'dc42bfb4c5074a01', '2021-02-06 14:20:48');
INSERT INTO `footprint` VALUES (128, 10007, 'd21c37bbf8c2481b', '2021-02-04 10:25:21');
INSERT INTO `footprint` VALUES (135, 10006, '59bfbbd84f2047bb', '2021-02-04 10:46:25');
INSERT INTO `footprint` VALUES (133, 10007, '59bfbbd84f2047bb', '2021-02-04 10:45:57');
INSERT INTO `footprint` VALUES (137, 10006, '5bc0a87c59524f00', '2021-02-04 10:48:12');
INSERT INTO `footprint` VALUES (139, 10006, 'df052d9c85024794', '2021-02-04 10:48:19');
INSERT INTO `footprint` VALUES (190, 10006, '58', '2021-02-14 20:02:20');
INSERT INTO `footprint` VALUES (144, 10006, '51', '2021-02-04 11:01:19');
INSERT INTO `footprint` VALUES (184, 10006, '54', '2021-02-06 16:59:32');
INSERT INTO `footprint` VALUES (186, 10006, '8c5891f796a54ea6', '2021-02-07 09:31:00');
INSERT INTO `footprint` VALUES (156, 10006, '55', '2021-02-05 18:44:36');
INSERT INTO `footprint` VALUES (159, 10006, '4c21bd03d81d418c', '2021-02-06 09:24:13');
INSERT INTO `footprint` VALUES (162, 10006, '7679e5703b8d43fd', '2021-02-06 14:22:10');
INSERT INTO `footprint` VALUES (189, 10006, '739bfe6147f242ee', '2021-02-14 20:02:06');
INSERT INTO `footprint` VALUES (164, 10006, '8', '2021-02-06 15:50:49');
INSERT INTO `footprint` VALUES (166, 10006, '236a084b9b5e4a6a', '2021-02-06 15:52:32');
INSERT INTO `footprint` VALUES (188, 10006, '792418b988884214', '2021-02-14 20:01:53');
INSERT INTO `footprint` VALUES (191, 10007, '58', '2021-02-14 20:03:26');
INSERT INTO `footprint` VALUES (192, 10007, '5c72cca6c8644498', '2021-02-14 20:03:51');

-- ----------------------------
-- Table structure for login_record
-- ----------------------------
DROP TABLE IF EXISTS `login_record`;
CREATE TABLE `login_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `login_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_record
-- ----------------------------
INSERT INTO `login_record` VALUES (1, 10000, '100.0.0.0', '2021-01-14 15:10:42');
INSERT INTO `login_record` VALUES (2, 10000, '0.0.0.0', '2021-01-18 16:00:29');
INSERT INTO `login_record` VALUES (3, 10006, '0:0:0:0:0:0:0:1', '2021-01-19 14:16:11');
INSERT INTO `login_record` VALUES (4, 10006, '0:0:0:0:0:0:0:1', '2021-01-19 14:20:47');
INSERT INTO `login_record` VALUES (5, 10006, '0:0:0:0:0:0:0:1', '2021-01-19 14:21:50');
INSERT INTO `login_record` VALUES (6, 10006, '0:0:0:0:0:0:0:1', '2021-01-19 14:22:30');
INSERT INTO `login_record` VALUES (7, 10006, '0:0:0:0:0:0:0:1', '2021-01-19 14:22:44');
INSERT INTO `login_record` VALUES (8, 10006, '0:0:0:0:0:0:0:1', '2021-01-19 14:24:46');
INSERT INTO `login_record` VALUES (9, 10006, '0:0:0:0:0:0:0:1', '2021-01-19 14:40:58');
INSERT INTO `login_record` VALUES (10, 10006, '0:0:0:0:0:0:0:1', '2021-01-19 15:09:42');
INSERT INTO `login_record` VALUES (11, 10006, '0:0:0:0:0:0:0:1', '2021-01-19 15:10:33');
INSERT INTO `login_record` VALUES (12, 10006, '0:0:0:0:0:0:0:1', '2021-01-19 15:12:34');
INSERT INTO `login_record` VALUES (13, 10006, '0:0:0:0:0:0:0:1', '2021-01-19 15:25:42');
INSERT INTO `login_record` VALUES (14, 10006, '0:0:0:0:0:0:0:1', '2021-01-19 15:26:11');
INSERT INTO `login_record` VALUES (15, 10006, '0:0:0:0:0:0:0:1', '2021-01-19 15:27:10');
INSERT INTO `login_record` VALUES (16, 10006, '0:0:0:0:0:0:0:1', '2021-01-19 15:29:10');
INSERT INTO `login_record` VALUES (17, 10006, '0:0:0:0:0:0:0:1', '2021-01-19 15:35:53');
INSERT INTO `login_record` VALUES (18, 10006, '0:0:0:0:0:0:0:1', '2021-01-27 10:01:05');
INSERT INTO `login_record` VALUES (19, 10006, '0:0:0:0:0:0:0:1', '2021-01-27 10:23:34');
INSERT INTO `login_record` VALUES (20, 10006, '0:0:0:0:0:0:0:1', '2021-01-27 10:24:05');
INSERT INTO `login_record` VALUES (21, 10006, '0:0:0:0:0:0:0:1', '2021-01-27 10:41:16');
INSERT INTO `login_record` VALUES (22, 10006, '0:0:0:0:0:0:0:1', '2021-01-27 11:45:54');
INSERT INTO `login_record` VALUES (23, 10007, '0:0:0:0:0:0:0:1', '2021-01-28 19:41:33');
INSERT INTO `login_record` VALUES (24, 10006, '0:0:0:0:0:0:0:1', '2021-01-28 19:58:50');
INSERT INTO `login_record` VALUES (25, 10006, '0:0:0:0:0:0:0:1', '2021-01-28 20:10:48');
INSERT INTO `login_record` VALUES (26, 10007, '0:0:0:0:0:0:0:1', '2021-01-28 20:19:17');
INSERT INTO `login_record` VALUES (27, 10007, '0:0:0:0:0:0:0:1', '2021-01-28 20:23:42');
INSERT INTO `login_record` VALUES (28, 10006, '0:0:0:0:0:0:0:1', '2021-01-28 20:37:16');
INSERT INTO `login_record` VALUES (29, 10006, '0:0:0:0:0:0:0:1', '2021-01-28 20:39:37');
INSERT INTO `login_record` VALUES (30, 10007, '0:0:0:0:0:0:0:1', '2021-01-29 16:57:14');
INSERT INTO `login_record` VALUES (31, 10006, '0:0:0:0:0:0:0:1', '2021-01-29 16:59:28');
INSERT INTO `login_record` VALUES (32, 10006, '0:0:0:0:0:0:0:1', '2021-01-29 17:01:24');
INSERT INTO `login_record` VALUES (33, 10006, '0:0:0:0:0:0:0:1', '2021-01-29 17:03:19');
INSERT INTO `login_record` VALUES (34, 10006, '0:0:0:0:0:0:0:1', '2021-01-29 17:04:15');
INSERT INTO `login_record` VALUES (35, 10006, '0:0:0:0:0:0:0:1', '2021-01-29 17:05:39');
INSERT INTO `login_record` VALUES (36, 10006, '0:0:0:0:0:0:0:1', '2021-01-29 17:07:48');
INSERT INTO `login_record` VALUES (37, 10007, '0:0:0:0:0:0:0:1', '2021-02-01 20:36:02');
INSERT INTO `login_record` VALUES (38, 10006, '0:0:0:0:0:0:0:1', '2021-02-02 09:40:05');
INSERT INTO `login_record` VALUES (39, 10007, '0:0:0:0:0:0:0:1', '2021-02-02 09:40:28');
INSERT INTO `login_record` VALUES (40, 10006, '0:0:0:0:0:0:0:1', '2021-02-02 09:40:54');
INSERT INTO `login_record` VALUES (41, 10006, '0:0:0:0:0:0:0:1', '2021-02-02 10:09:43');
INSERT INTO `login_record` VALUES (42, 10007, '0:0:0:0:0:0:0:1', '2021-02-02 10:22:35');
INSERT INTO `login_record` VALUES (43, 10007, '0:0:0:0:0:0:0:1', '2021-02-02 15:28:08');
INSERT INTO `login_record` VALUES (44, 10006, '0:0:0:0:0:0:0:1', '2021-02-02 15:48:37');
INSERT INTO `login_record` VALUES (45, 10007, '0:0:0:0:0:0:0:1', '2021-02-02 16:03:32');
INSERT INTO `login_record` VALUES (46, 10006, '0:0:0:0:0:0:0:1', '2021-02-02 17:20:02');
INSERT INTO `login_record` VALUES (47, 10007, '0:0:0:0:0:0:0:1', '2021-02-02 19:07:49');
INSERT INTO `login_record` VALUES (48, 10006, '0:0:0:0:0:0:0:1', '2021-02-03 13:25:28');
INSERT INTO `login_record` VALUES (49, 10007, '0:0:0:0:0:0:0:1', '2021-02-04 10:24:21');
INSERT INTO `login_record` VALUES (50, 10008, '0:0:0:0:0:0:0:1', '2021-02-05 19:18:55');
INSERT INTO `login_record` VALUES (51, 10009, '0:0:0:0:0:0:0:1', '2021-02-05 19:23:51');
INSERT INTO `login_record` VALUES (52, 10007, '0:0:0:0:0:0:0:1', '2021-02-05 20:37:01');
INSERT INTO `login_record` VALUES (53, 10006, '0:0:0:0:0:0:0:1', '2021-02-14 19:58:36');
INSERT INTO `login_record` VALUES (54, 10007, '0:0:0:0:0:0:0:1', '2021-02-14 20:03:16');
INSERT INTO `login_record` VALUES (55, 10006, '0:0:0:0:0:0:0:1', '2021-02-22 20:11:45');

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins`  (
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `series` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_used` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`series`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------
INSERT INTO `persistent_logins` VALUES ('xiaopi', 'V2wA1q7aFWmRdLDPv04kug==', 'Z0dxBH2Fmyl0s1u+HStgow==', '2021-02-28 09:09:48');
INSERT INTO `persistent_logins` VALUES ('admin', 'ZUaDb64WyvNlYO/R9Nps7g==', 'Xa/siH4a9rf7tUdqDeqBqA==', '2021-02-28 07:12:38');

-- ----------------------------
-- Table structure for pi_collect
-- ----------------------------
DROP TABLE IF EXISTS `pi_collect`;
CREATE TABLE `pi_collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pi_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '是否隐藏',
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_collect
-- ----------------------------
INSERT INTO `pi_collect` VALUES (32, '59bfbbd84f2047bb', 10007, 1, '2021-02-04 10:46:00');
INSERT INTO `pi_collect` VALUES (34, '57', 10006, 1, '2021-02-04 11:00:57');
INSERT INTO `pi_collect` VALUES (35, '58', 10006, 1, '2021-02-04 11:01:10');
INSERT INTO `pi_collect` VALUES (42, 'dc42bfb4c5074a01', 10006, 1, '2021-02-06 14:20:52');
INSERT INTO `pi_collect` VALUES (37, '51', 10006, 1, '2021-02-04 11:01:21');

-- ----------------------------
-- Table structure for pi_like
-- ----------------------------
DROP TABLE IF EXISTS `pi_like`;
CREATE TABLE `pi_like`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pi_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '皮物id',
  `like` tinyint(1) NOT NULL COMMENT '为1则是点赞，为0则是踩',
  `user_id` int(11) NOT NULL COMMENT '皮物点赞者的id',
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_like
-- ----------------------------
INSERT INTO `pi_like` VALUES (1, '439fb67b87364a2e', 1, 10006, '2021-02-03 20:06:52');
INSERT INTO `pi_like` VALUES (7, '59bfbbd84f2047bb', 1, 10006, '2021-02-04 10:44:30');
INSERT INTO `pi_like` VALUES (3, 'd21c37bbf8c2481b', 1, 10006, '2021-02-04 09:25:28');
INSERT INTO `pi_like` VALUES (4, '60', 1, 10006, '2021-02-04 09:27:04');
INSERT INTO `pi_like` VALUES (5, 'dc42bfb4c5074a01', 1, 10006, '2021-02-04 09:30:37');
INSERT INTO `pi_like` VALUES (6, '56', 1, 10006, '2021-02-04 09:30:46');
INSERT INTO `pi_like` VALUES (8, '59bfbbd84f2047bb', 1, 10007, '2021-02-04 10:46:02');
INSERT INTO `pi_like` VALUES (9, '7', 1, 10006, '2021-02-07 09:30:57');

-- ----------------------------
-- Table structure for pi_product
-- ----------------------------
DROP TABLE IF EXISTS `pi_product`;
CREATE TABLE `pi_product`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '发布者的id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `class_id` int(11) NOT NULL COMMENT '皮物分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货地址',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `number` int(10) NOT NULL DEFAULT 0 COMMENT '访问量',
  `status` tinyint(1) NOT NULL COMMENT '封禁状态 发表时须通过审核',
  `down_shelf` tinyint(1) NULL DEFAULT NULL COMMENT '下架',
  `sold_status` tinyint(1) NULL DEFAULT NULL COMMENT '已售状态',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `freight` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费',
  `trade_status` tinyint(1) NULL DEFAULT NULL COMMENT '是否是交易中 为true为交易中，为false处于交易中',
  `down_date` datetime(0) NULL DEFAULT NULL COMMENT '下架时间',
  `trade_date` datetime(0) NULL DEFAULT NULL COMMENT '已售的时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `class_id`(`class_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_product
-- ----------------------------
INSERT INTO `pi_product` VALUES ('905cbf5367d14ee1', 10006, '自由的国度机票', 1, 9999.00, '自由国度', '# 这是一张去自由国度的机票\n\n### 自由国度人人平等，连空气都是自由的\n\n![白工.jpg](http://localhost:81/img/2021-01-31/20210131200707a11d5e2cd46d4d7483195c663036fbcd.jpg)\n', 0, 0, 0, 0, '2021-01-31 20:07:15', 9999.00, 1, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('6', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 1, '2021-01-28 11:54:06', 99.99, 1, NULL, '2021-02-25 15:43:46', NULL);
INSERT INTO `pi_product` VALUES ('5', 10006, '测试', 1, 123.00, '测试测试测试测试', '测试\n\n测试测试测试测试测试测试测试测试测试测试测试\n\n测试\n\n测试测试测试测试测试测试测试测试测试测试测试\n\n测试\n\n测试测试测试测试测试测试测试测试测试测试测试\n\n测试\n\n测试测试测试测试测试测试测试测试测试测试测试\n', 0, 1, 0, 1, '2021-01-28 11:52:35', 123.00, 1, NULL, '2021-02-02 15:34:03', NULL);
INSERT INTO `pi_product` VALUES ('7', 10006, '西施一个', 1, 99.99, '唐朝发货', '* [ ] 写点什么？\n* [ ] 没有老婆\n* [ ] 单身DOG\n\n* go go go 🚀️ 🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️\n', 1, 1, 0, 0, '2021-01-28 12:13:37', 99.44, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('8', 10006, '随便写点什么 测试皮帖', 2, NULL, NULL, '随便写点什么\n\n随便写点什么随便写点什么随便写点什么随便写点什么随便写点什么随便写点什么随便写点什么随便写点什么随便写点什么随便写点什么随便写点什么随便写点什么随便写点什么随便写点什么随便写点什么随便写点什么随便写点什么随便写点什么随便写点什么随便写点什么\n', 0, 1, 0, 0, '2021-01-28 14:56:16', NULL, NULL, NULL, NULL, '2021-01-30 15:56:40');
INSERT INTO `pi_product` VALUES ('9', 10006, '123', 1, 123.00, '123', 'fasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdffasdf\n\n\n![神王1.jpg](http://localhost:81/img/2021-01-29/202101291117479a26009acbbc4bf8a3c69da3097afccd.jpg)\n  ', 0, 1, 0, 1, '2021-01-29 11:17:49', 123.00, 1, NULL, '2021-02-02 15:44:39', NULL);
INSERT INTO `pi_product` VALUES ('71', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 1, '2021-01-29 15:36:56', 99.99, 1, NULL, '2021-02-15 16:14:38', NULL);
INSERT INTO `pi_product` VALUES ('70', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 1, '2021-01-29 15:36:56', 99.99, 1, NULL, '2021-02-02 16:14:46', NULL);
INSERT INTO `pi_product` VALUES ('68', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 1, '2021-01-29 15:36:55', 99.99, 1, NULL, '2021-02-02 16:14:49', NULL);
INSERT INTO `pi_product` VALUES ('69', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 1, '2021-01-29 15:36:55', 99.99, 1, NULL, '2021-02-02 16:14:57', NULL);
INSERT INTO `pi_product` VALUES ('67', 10006, '测试1', 1, 900.00, '测试测试测试测试1', '🚀️\n\n#### 我写了图片1\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 1, '2021-01-29 15:36:55', 99.99, 1, NULL, '2021-02-02 16:14:53', '2021-01-29 20:06:39');
INSERT INTO `pi_product` VALUES ('66', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 1, 0, '2021-01-29 15:36:55', 99.99, NULL, '2021-01-30 15:34:17', NULL, NULL);
INSERT INTO `pi_product` VALUES ('65', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 1, '2021-01-29 15:36:55', 99.99, 1, NULL, '2021-02-03 10:04:38', NULL);
INSERT INTO `pi_product` VALUES ('63', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 1, '2021-01-29 15:36:54', 99.99, 1, NULL, '2021-02-02 16:15:14', NULL);
INSERT INTO `pi_product` VALUES ('64', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 1, '2021-01-29 15:36:54', 99.99, 1, NULL, '2021-02-02 15:31:37', NULL);
INSERT INTO `pi_product` VALUES ('62', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 1, '2021-01-29 15:36:54', 99.99, 1, NULL, '2021-02-02 16:15:01', NULL);
INSERT INTO `pi_product` VALUES ('61', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 1, '2021-01-29 15:36:53', 99.99, 1, NULL, '2021-02-02 17:05:07', NULL);
INSERT INTO `pi_product` VALUES ('59', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 1, '2021-01-29 15:36:53', 99.99, 1, NULL, '2021-02-02 16:15:04', NULL);
INSERT INTO `pi_product` VALUES ('60', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 1, '2021-01-29 15:36:53', 99.99, 1, NULL, '2021-02-04 10:24:32', NULL);
INSERT INTO `pi_product` VALUES ('58', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 2, 1, 0, 1, '2021-01-29 15:36:53', 99.99, 1, NULL, '2021-02-14 20:03:33', NULL);
INSERT INTO `pi_product` VALUES ('57', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 1, 1, 0, 0, '2021-01-29 15:36:53', 99.99, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('55', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 0, '2021-01-29 15:36:52', 99.99, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('56', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 1, 1, 0, 0, '2021-01-29 15:36:52', 99.99, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('54', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 3, 1, 0, 0, '2021-01-29 15:36:52', 99.99, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('53', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 0, '2021-01-29 15:36:51', 99.99, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('51', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 0, '2021-01-29 15:36:51', 99.99, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('52', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![8848.jpg](http://localhost:81/img/2021-01-28/202101281153272c97ed1405604d32a56371fb294f57fd.jpg)\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 0, '2021-01-29 15:36:51', 99.99, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('72', 10006, 'product测试', 4, 188.00, 'product测试123', '# 皮皮豪是五笔玩家皮皮豪是五笔玩家1\n\n皮皮豪是五笔玩家\n\n皮皮豪是五笔玩家\n\n皮皮豪是五笔玩家\n\n![红牛.jpg](http://localhost:81/img/2021-01-29/20210129193117a2bd56feed554ea6ac8aef6469c0fe32.jpg)\n', 0, 1, 0, 1, '2021-01-29 19:31:19', 188.00, 1, NULL, '2021-02-02 15:30:17', '2021-01-29 20:22:03');
INSERT INTO `pi_product` VALUES ('73', 10006, '测试', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n![神王.jpg](http://localhost:81/img/2021-01-29/20210129201212cce955f273014cebb9f26d6409577d5c.jpg)\n\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 0, 1, 0, 1, '2021-01-29 19:57:15', 99.99, 1, NULL, '2021-02-02 16:14:42', '2021-01-29 20:12:22');
INSERT INTO `pi_product` VALUES ('6d0e0264e3674a1c', 10006, '随便写点什么东西了', 2, 1.00, '湖南', '# 湖南帅小伙写代码\n\n![直播.png](http://localhost:81/img/2021-01-29/202101292023056aa4cb85179f4367aae171b3a2d02f03.png)\n', 0, 1, 0, 1, '2021-01-29 20:23:19', 1.00, 1, NULL, '2021-02-02 13:42:21', '2021-01-29 20:24:13');
INSERT INTO `pi_product` VALUES ('739bfe6147f242ee', 10006, '测试1 测试重新发布', 1, 1000.00, '测试测试测试测试', '#### 我写了图片\n\n你能看见吗后台\n\n\n![神王1.jpg](http://localhost:81/img/2021-01-28/2021012811532724152e943381445cabf5f70533b5b282.jpg)\n![神王.jpg](http://localhost:81/img/2021-01-28/2021012811532728130797ce1c43adb93e82a29e52fbee.jpg)\n![直播.png](http://localhost:81/img/2021-01-28/20210128115327089c94fce10445c18568aeb84c9418f7.png)\n', 1, 1, 0, 1, '2021-01-30 15:42:40', 99.99, 1, NULL, '2021-02-02 16:03:58', NULL);
INSERT INTO `pi_product` VALUES ('8f138d72d3094cca', 10006, '皮鱼社区怎么样', 4, NULL, NULL, '我是一名打字佬，想来皮鱼学习打字技巧，请问，怎么才能学习皮鱼的打字技巧。\n', 0, 1, 0, 0, '2021-01-30 16:01:10', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('7679e5703b8d43fd', 10006, '你终成键帝', 4, NULL, NULL, '<h1 id=\"你终成键帝\">你终成键帝</h1>\n<p>真的，你必然是终成键帝</p>\n<p><img src=\"http://localhost:81/img/2021-01-31/202101311536087109adb796604a90ab2e505b927d9a17.jpg\" alt=\"每一个不曾舞的日子都是对生命的辜负.jpg\" /></p>\n', 0, 1, 0, 0, '2021-01-31 15:36:13', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('72736c93f5174562', 10006, '如何才能成为一个键帝', 4, NULL, NULL, '# 如何才能成为一个键帝，那要看怎么打字了\n\n小伙子想成为键帝吗？\n\n![每一个不曾舞的日子都是对生命的辜负.jpg](http://localhost:81/img/2021-01-31/2021013115405509e0e531f2d645fcb1d94111207112df.jpg)\n', 0, 1, 0, 0, '2021-01-31 15:41:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('8ec5c280af034378', 10006, '艺术随便写点什么东西了啦', 3, 99.00, '北京', '很多时候，不能坚持并不是因为我们不能吃苦，只是因为我们做某件事情的意愿不强。\n\n　　我的体力和耐力都不好，长跑常常是忍着头痛恶心硬撑到最后。\n\n　　因为这个原因，每次跑步前我都有很大的心理压力。加上那些立下的瘦身目标常常不能三两天见效，所以每一次都是心血来潮地开始，虎头蛇尾地结束。\n\n　　可最近这一年，我却很积极地把晨跑坚持了下来。\n\n![](http://p2.itc.cn/images01/20201214/29a905719597490c981bebe3c4b2b025.png)\n', 0, 1, 0, 1, '2021-02-01 18:21:02', 99.00, 1, NULL, '2021-02-02 15:29:03', NULL);
INSERT INTO `pi_product` VALUES ('2f05053f7d2c4daa', 10006, '看看如何吧', 4, NULL, NULL, '笑了，不知道你们这些菜鸡是怎么玩皮鱼，真不会玩吧？\n\n。。。。\n\n![每一个不曾舞的日子都是对生命的辜负.jpg](http://localhost:81/img/2021-02-01/202102012006395c154e4862a147bf916d2bbfe4390b03.jpg)\n', 0, 1, 0, 0, '2021-02-01 20:06:43', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('236a084b9b5e4a6a', 10007, '我也发一个帖子', 3, 0.01, '湖南', '人生遇到的每个人，出场顺序真的很重要，很多人如果换一个时间认识，就会有不同的结局。\n\n这个地球上有 70 亿人，我知道有一个人，会为你爬上月亮。\n\n你以为人生最糟的事情，失去了最爱的人。其实最糟糕的事情却是，你因为太爱一个人而失去了自己。\n\n![BSDMan.jpg](http://localhost:81/img/2021-02-01/202102012036475b15bddfa10c4465aa8dff619402fd07.jpg)\n', 0, 1, 0, 0, '2021-02-01 20:37:31', 0.01, NULL, NULL, NULL, '2021-02-01 20:38:02');
INSERT INTO `pi_product` VALUES ('c5f336a644184170', 10007, '发个皮帖', 1, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-02 09:39:34', NULL, NULL, NULL, NULL, '2021-02-03 12:26:26');
INSERT INTO `pi_product` VALUES ('59bfbbd84f2047bb', 10007, '皮皮豪买吧', 3, 199.00, '湖南', '👍\n\n## 国泰民安\n\n开源软件需要保持开放的心态，对任何技术和立场都保持客观公正的态度，而且在开放源代码时，还需要遵循开源许可协议，允许任何人使用、拷贝、修改以及重新发布。开源许可协议主要分为宽松许可协议（Apache、BSD、MIT 等）和严格许可协议（GPL、GPL v3、LGPL、Mozilla 等）两大类。除此之外，一个优秀的可持续发展的开源软件，还需要公开发布项目技术文档和其他材料、二进制文件（可选）等，以及拥有一个开放性的社区，接收用户和开发者的反馈，共同探讨开源软件的发展。\n\n开源硬件\n\n![国泰民安.jpg](http://localhost:81/img/2021-02-02/2021020215470588589e043b0b402283f5369754d29758.jpg)\n', 0, 1, 0, 1, '2021-02-02 15:47:48', 199.00, 1, NULL, '2021-02-02 15:49:12', '2021-02-02 15:48:17');
INSERT INTO `pi_product` VALUES ('6effc12353fb49a7', 10006, '给点五笔加点料', 4, 100.00, '北京', '[五笔](https://baike.baidu.com/item/%E4%BA%94%E7%AC%94/157685)字型[输入法](https://baike.baidu.com/item/%E8%BE%93%E5%85%A5%E6%B3%95)*（* *简称：* *[五笔](https://baike.baidu.com/item/%E4%BA%94%E7%AC%94/157685)* *）* 是[王永民](https://baike.baidu.com/item/%E7%8E%8B%E6%B0%B8%E6%B0%91/25359)在 1983 年 8 月发明的一种[汉字](https://baike.baidu.com/item/%E6%B1%89%E5%AD%97)输入法。因为[发明](https://baike.baidu.com/item/%E5%8F%91%E6%98%8E/1615352)人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和[字形](https://baike.baidu.com/item/%E5%AD%97%E5%BD%A2/11053562)特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的[汉字输入法](https://baike.baidu.com/item/%E6%B1%89%E5%AD%97%E8%BE%93%E5%85%A5%E6%B3%95/9210428)之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自 1983 年诞生以来，先后推出三个版本：86 五笔、98 五笔和新世纪五笔。\n\n\n![1612229928573.jpg](http://localhost:81/img/2021-02-02/202102021556452e6f3def3e684aa1ad1080bf8aa4cba0.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:56:49', 100.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('6b6f08783d9b4301', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:01', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('c6ef67eac9964f1c', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:01', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('bae5f38e5fd24c04', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:02', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('ee94535b8d8a43b3', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:02', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('16121512278d4a2c', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:02', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('a2a58103a60b44ed', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:02', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('01d60e2cd4cf493c', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:02', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('9cbfc37b37ad49a2', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:02', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('ea0f5a3046af4eb3', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:03', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('5d1744abb0404bdd', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:03', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('585e259741934fa3', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:03', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('2497cb44d14c41c7', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:03', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('12cc84b92df74a87', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:03', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('d21c37bbf8c2481b', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 1, '2021-02-02 15:58:04', 99.00, 1, NULL, '2021-02-04 10:24:51', NULL);
INSERT INTO `pi_product` VALUES ('5c72cca6c8644498', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 1, 1, 0, 0, '2021-02-02 15:58:04', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('adfd9ffcb956403e', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:04', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('8157ec4c0d6a4cc9', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:04', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('d5ed4f8a5f224112', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:04', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('b3a1b00512354c70', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:04', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('399d352e59704bd9', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:05', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('fbc2faa712f7431f', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 1, '2021-02-02 15:58:05', 99.00, 1, NULL, '2021-02-02 16:13:26', NULL);
INSERT INTO `pi_product` VALUES ('a70426f628e74389', 10006, '来给五笔加点料', 4, 99.00, '北京', '五笔字型输入法（简称：五笔）是王永民在1983年8月发明的一种汉字输入法。因为发明人姓王，所以也称为“王码五笔”。五笔字型完全依据笔画和字形特征对汉字进行编码，是典型的形码输入法。\n\n五笔是目前中国以及一些东南亚国家如新加坡、马来西亚等国的最常用的汉字输入法之一。五笔相对于拼音输入法具有重码率低的特点，熟练后可快速输入汉字。五笔字型自1983年诞生以来，先后推出三个版本：86五笔、98五笔和新世纪五笔。\n\n![1612229941942.jpg](http://localhost:81/img/2021-02-02/2021020215575764b53d8716914e51bafb8cc4ccba331c.jpg)\n', 0, 1, 0, 1, '2021-02-02 15:58:05', 99.00, 1, NULL, '2021-02-02 16:13:43', NULL);
INSERT INTO `pi_product` VALUES ('fcb62d824b344aa8', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:45', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('f4a68a07fa8f4980', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:45', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('c1e04075014243e5', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:46', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('9ff55774b27f4a3c', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:46', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('690338e5ce2243fb', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:46', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('41b77a5e590b4d4c', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:46', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('daa71f880c4f4b4a', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:46', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('c795469a006540e6', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:46', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('351f0aa05d6d42f6', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:47', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('2b22986b27104a33', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:47', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('8c2a4b71ee674be2', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 1, 0, '2021-02-02 15:58:47', 99.00, NULL, '2021-02-02 16:01:15', NULL, NULL);
INSERT INTO `pi_product` VALUES ('2fd86411b28c4399', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:47', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('34d88764120b4a11', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:47', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('eee0fdccfa4b4c94', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:47', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('e0e4ab130a824f22', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:48', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('a94da0fca6b144ff', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:48', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('2b2233c62a024269', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:48', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('f1016906697849c6', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:48', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('38f63116fb164530', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:48', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('e3d17523f9694d56', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:49', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('ccc2a4acc02f4f10', 10006, '来给艺术加点料', 3, 99.00, '南京', '顾名思义，艺术，拥有艺术感才叫艺术，才是艺术，这是一个很简单的道理。\n　　\n　　艺术是情感，是爱情，是深情，是向心爱的人的诉说，是爱的刻骨铭心的感受，是爱人间的感应。\n　　\n　　艺术的是一种膨胀与扩张式的顺势而为的具体的训练方法\n　　\n　　艺术是我们的理想、梦想、梦幻、幻想和爱，及一切美好的感觉、感受与享受。\n　　\n　　艺术是动起来，想要控制艺术的动态及运动规律、韵律与动感等，就必须首先控制好自己的情绪，因为，艺术的动起来是韵律、动感、感觉、运动和放松之间的辩证统一的关系，所以，动起来必须应符合这些艺术的规范才行，不可脱离艺术的客观规律。\n　　\n　　艺术的目标是学习，是向更高、更强、更好的方向努力奋进，全人类的发展方向也同样是如此，世界上的艺术与爱情有成千上万种，关键看你懂不懂及是否去珍惜。\n\n![1612229839714.jpg](http://localhost:81/img/2021-02-02/202102021558156fe1d6e409ab4b479b045aa3377d1281.jpg)\n', 0, 1, 0, 0, '2021-02-02 15:58:49', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('94877c3e7764486a', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:32', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('832ae711c21f41c4', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:33', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('67c042d588ea4acf', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:33', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('b71938d969f54a59', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:33', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('fd32f3e2875e4efe', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:33', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('6d2cc1558b434d00', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:33', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('2f9f15619eaa40ee', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:33', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('6f57134335ed4f6b', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:34', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('28fe304f9ad84f8f', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:34', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('4d92da1677a24e59', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:34', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('e21fffe20c6a4393', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:34', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('ba28203da4ae4204', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:34', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('b8966d25b2b64d06', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:34', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('169b7bd0ae4840c4', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:35', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('07e9615791e7400c', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:35', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('280b845840fd45bb', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:35', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('f424ed9089d54983', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:35', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('760dc8e037bf476a', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:35', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('05975885557c4be8', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:36', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('35bbf6aaeab54144', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:36', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('4f2ed31348ae419b', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:36', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('5394c7b1ac8047ec', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:36', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('df83978ffac04470', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:36', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('e74adee31b2a4075', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 1, 0, '2021-02-02 15:59:37', 99.00, NULL, '2021-02-02 16:00:26', NULL, NULL);
INSERT INTO `pi_product` VALUES ('57576cd5f16d485f', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:37', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('22b26beeecfa4bcf', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 15:59:37', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('f27602fb7e524b84', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:33', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('6d61cbf50d59422a', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:33', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('45209563a1d24c1b', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:33', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('745d4a0629094579', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:33', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('b1382b5c817a445e', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:34', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('843ab354e32748b6', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:34', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('b4078af1c15343f6', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:34', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('e4bdbb2edebe4eb8', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:34', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('0be3d40d86db4c9c', 10006, '来给技术加点料', 3, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:34', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('74011e039a2f4bfc', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:37', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('aea1544b7cf6447e', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:37', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('33bf6499559b49f3', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:37', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('223ba79abc464924', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:37', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('f70fff4c7b064e8c', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:37', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('a5d061d27f554caf', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:38', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('ebc641dbfe9a4110', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:38', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('94870d58207645e0', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:38', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('75b37dcf4bb243bf', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:38', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('9b4b8322e5614167', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:38', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('e65a4fa2aa8b4512', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:38', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('8018a762deeb49a5', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:39', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('1d026ae48c7144fb', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:39', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('3bf9bdf6d6a84da5', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:39', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('0daa9ea997a447e0', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:39', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('7b0dac5f4a404c93', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:39', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('6e69645a9631416b', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:39', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('4a37c4e911af47a4', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:40', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('324b920ef9094ec4', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:40', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('e740c93cabd44285', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:40', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('8259e1561c244b5f', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:40', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('8f1bf3fb60c14241', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:40', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('624bc37534a1432f', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:40', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('4c21bd03d81d418c', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:41', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('ee322493a81c4b86', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:41', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('2fc9df02e1b24cee', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:41', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('0be64a23befd4866', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:41', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('2e8a4fc3684e42a3', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 0, '2021-02-02 16:00:41', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('df052d9c85024794', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 1, '2021-02-02 16:00:42', 99.00, 1, NULL, '2021-02-02 16:15:23', NULL);
INSERT INTO `pi_product` VALUES ('2a28126c64474aea', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 1, '2021-02-02 16:00:42', 99.00, 1, NULL, '2021-02-02 16:15:27', NULL);
INSERT INTO `pi_product` VALUES ('8c5891f796a54ea6', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 1, 1, 0, 0, '2021-02-02 16:00:42', 99.00, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('f2dfdc3696cf4b22', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 1, '2021-02-02 16:00:42', 99.00, 1, NULL, '2021-02-02 16:15:33', NULL);
INSERT INTO `pi_product` VALUES ('75ce8add78434731', 10006, '来给技术加点料', 2, 99.00, '南京', '技术的最原始概念是熟练。所谓熟能生巧，巧就是技术。技术远比科bai学古老。事实上，技术史与人类史一样源远流长。\n\n广义地讲，技术是人类为实现社会需要而创造和发展起来的手段、方法和技能的总和。作为社会生产力的社会总体技术力量，包括工艺技巧、劳动经验、信息知识和实体工具装备，也就是整个社会的技术人才、技术设备和技术资料。\n\n法国科学家狄德罗主编的《百科全书》给技术下了一个简明的定义：“技术是为某一目的共同协作组成的各种工具和规则体系。”技术的这个定义，基本上指出了现代技术的主要特点，即目的性、社会性、多元性。\n\n任何技术从其诞生起就具有目的性。技术的目的性贯穿于整个技术活动的过程之中。技术的实现需要通过社会协作，得到社会支持，并受到社会多种条件的制约。这诸多的社会因素直接影响技术的成败和发展进程。所谓多元性，是指技术既可表现为有形的工具装备、机器设备、实体物质等硬件；也可以表现为无形的工艺、方法、规则等知识软件，还可以表现为虽不是实体物质而却又有物质载体的信息资料、设计图纸等。在作为物质手段和信息手段的现代技术中，技能已逐步失去原有的地位和作用，而只是技术的一个要素。\n\n![直播.png](http://localhost:81/img/2021-02-02/2021020215592855db3fd13e7e442a8eb4d57bc54df6c5.png)\n', 0, 1, 0, 1, '2021-02-02 16:00:42', 99.00, 1, NULL, '2021-02-02 16:15:39', NULL);
INSERT INTO `pi_product` VALUES ('d2dab4b4d7614541', 10007, '皮帖交流', 2, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:11', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('7aeda90ebbc6433f', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:45', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('9b589a00db3e4cd4', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:45', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('fd26e1a3532d4267', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:45', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('648b56ea26cf4ece', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:45', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('2e05e8b3d94d44e4', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:45', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('626c9ffc956a4290', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:46', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('af9d48b9a551459b', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:46', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('d5ab08ab80b346d1', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:46', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('aeb97f499b464ee2', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:46', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('3b168ef49af54b2a', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:46', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('569d3112754b46bc', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:46', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('3ed8119c76d24ebd', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:47', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('f3c9aa5664f44658', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:47', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('792418b988884214', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 1, 1, 0, 0, '2021-02-03 12:27:47', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('a9e15028bd4e4ca1', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:47', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('710c32a25cc84c06', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:47', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('e5eb951c59a441f9', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 0, 1, 0, 0, '2021-02-03 12:27:47', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pi_product` VALUES ('7d09262fa2344cb9', 10007, '6666666666', 3, NULL, NULL, '是的，我有一个皮帖要发。\n\n什么是皮帖？1\n\n与皮物相对应的，就是皮帖。\n\n![image.png](http://localhost:81/img/2021-02-03/20210203122741dc122713fc8b4b2fbde8114ffd8cfd68.png)\n\n![1612229904555.jpg](http://localhost:81/img/2021-02-02/202102020939298f641139e0994cccae63369c8ce35c5e.jpg)\n', 8, 0, 0, 0, '2021-02-03 12:27:48', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pi_product_class
-- ----------------------------
DROP TABLE IF EXISTS `pi_product_class`;
CREATE TABLE `pi_product_class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_date` datetime(0) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `order_num` int(11) NOT NULL COMMENT '排序数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pi_product_class
-- ----------------------------
INSERT INTO `pi_product_class` VALUES (1, '数码', '2021-01-26 10:45:36', 1, 1);
INSERT INTO `pi_product_class` VALUES (2, '技术', '2021-01-26 10:45:47', 1, 1);
INSERT INTO `pi_product_class` VALUES (3, '艺术', '2021-01-26 10:45:56', 1, 1);
INSERT INTO `pi_product_class` VALUES (4, '五笔', '2021-01-26 10:46:32', 1, 1);
INSERT INTO `pi_product_class` VALUES (10, '打字', '2021-02-26 10:48:48', 1, 101);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `test` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (1, '测试1', '测试1');
INSERT INTO `test` VALUES (2, '测试2', '测试2');

-- ----------------------------
-- Table structure for trading
-- ----------------------------
DROP TABLE IF EXISTS `trading`;
CREATE TABLE `trading`  (
  `id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '出钱的用户',
  `r_user_id` int(11) NOT NULL COMMENT '收钱的用户 ',
  `type` int(11) NOT NULL COMMENT '1.交易，2充值，3转账',
  `address_id` int(11) NOT NULL COMMENT '收货地址id',
  `pi_product_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 皮物，没有为 null',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '是否支出 ，如果需要支付的时候，则直接设置成true，然后交易成功，如果订单取消，设置成false',
  `time` datetime(0) NOT NULL,
  `money` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trading
-- ----------------------------
INSERT INTO `trading` VALUES ('1', 10007, 10006, 1, 10, '739bfe6147f242ee', 1, '2021-02-02 12:53:46', 1099.00);
INSERT INTO `trading` VALUES ('5eeea128f576436296a085cb408957', 10007, 10006, 1, 11, '6', 1, '2021-02-02 15:43:48', 1099.99);
INSERT INTO `trading` VALUES ('a0449beb2319421d8cf8a7597cf551', 10007, 10006, 1, 11, '9', 1, '2021-02-02 15:44:39', 246.00);
INSERT INTO `trading` VALUES ('c06a81a1b83a4cb6b532ee12dbe3fc', 10006, 10007, 1, 8, '59bfbbd84f2047bb', 1, '2021-02-04 15:49:12', 398.00);
INSERT INTO `trading` VALUES ('235c5b9cf2164ed9b32f431bee2cad', 10007, 10006, 1, 10, '739bfe6147f242ee', 1, '2021-02-02 16:03:58', 1099.99);
INSERT INTO `trading` VALUES ('0de028d72ae74098a01b7cbdd4c870', 10007, 10006, 1, 10, 'fbc2faa712f7431f', 1, '2021-02-02 16:13:26', 198.00);
INSERT INTO `trading` VALUES ('c826533fa11c466ebd31d5e8d9c68f', 10007, 10006, 1, 11, 'a70426f628e74389', 1, '2021-02-02 16:13:43', 198.00);
INSERT INTO `trading` VALUES ('55ad42008e04414580068f8e8dad07', 10007, 10006, 1, 11, '5bc0a87c59524f00', 1, '2021-02-02 16:14:14', 198.00);
INSERT INTO `trading` VALUES ('19156cf318f14b1f880dba1639dc90', 10007, 10006, 1, 11, '71', 1, '2021-02-02 16:14:38', 1099.99);
INSERT INTO `trading` VALUES ('f5055095aaee4127a2ba09d0a7aff5', 10007, 10006, 1, 11, '73', 1, '2021-02-02 16:14:42', 1099.99);
INSERT INTO `trading` VALUES ('12c61e7e70a549aaa7173a42514fc3', 10007, 10006, 1, 11, '70', 1, '2021-02-02 16:14:46', 1099.99);
INSERT INTO `trading` VALUES ('c3946c14028144d99773479d6ef796', 10007, 10006, 1, 11, '68', 1, '2021-02-02 16:14:49', 1099.99);
INSERT INTO `trading` VALUES ('405a81b42b7944069bb2eaef2f18ae', 10007, 10006, 1, 11, '67', 1, '2021-02-02 16:14:53', 999.99);
INSERT INTO `trading` VALUES ('a3cb70f7ab364703b4c68dfc6b18f0', 10007, 10006, 1, 11, '69', 1, '2021-02-02 16:14:57', 1099.99);
INSERT INTO `trading` VALUES ('c6a69b5c43bd4a418137bb9d106c1d', 10007, 10006, 1, 11, '62', 1, '2021-02-02 16:15:01', 1099.99);
INSERT INTO `trading` VALUES ('d3436fcc302d48b5a1f7925cecdf95', 10007, 10006, 1, 11, '59', 1, '2021-02-02 16:15:04', 1099.99);
INSERT INTO `trading` VALUES ('f2e5321f07134bcf8f4dc1104020a7', 10007, 10006, 1, 11, '63', 1, '2021-02-02 16:15:14', 1099.99);
INSERT INTO `trading` VALUES ('bbdfe9f3da5946d1ae064f1f9b5275', 10007, 10006, 1, 11, 'df052d9c85024794', 1, '2021-02-02 16:15:23', 198.00);
INSERT INTO `trading` VALUES ('78ad8482374a4c558757900699fb75', 10007, 10006, 1, 11, '2a28126c64474aea', 1, '2021-02-02 16:15:27', 198.00);
INSERT INTO `trading` VALUES ('5aaa340db2c140fc91ca2099383d2a', 10007, 10006, 1, 11, 'f2dfdc3696cf4b22', 1, '2021-02-02 16:15:33', 198.00);
INSERT INTO `trading` VALUES ('b2342f218ceb48e2b36f681e98701f', 10007, 10006, 1, 11, '75ce8add78434731', 1, '2021-02-02 16:15:39', 198.00);
INSERT INTO `trading` VALUES ('f9ff1bcd42c74180a385c671fa2085', 10007, 10006, 1, 11, '61', 1, '2021-02-02 17:05:07', 1099.99);
INSERT INTO `trading` VALUES ('e2690e35a9394c4e8b9bc59b0fa8e3', 10007, 10006, 1, 10, '65', 1, '2021-02-03 10:04:38', 1099.99);
INSERT INTO `trading` VALUES ('bbbe3df31a174abfa6124ea09bad8d', 10007, 10006, 1, 11, '60', 1, '2021-02-04 10:24:32', 1099.99);
INSERT INTO `trading` VALUES ('fad38a8d4d4a478aa22fdee16b3777', 10007, 10006, 1, 11, 'd21c37bbf8c2481b', 1, '2021-02-04 10:24:51', 198.00);
INSERT INTO `trading` VALUES ('f68397fb09bc437c8acdd437dc91fb', 10007, 10006, 1, 10, '58', 1, '2021-02-14 20:03:33', 1099.99);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名，登录账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称，默认是用户名',
  `birth_date` datetime(0) NULL DEFAULT NULL,
  `gender` tinyint(1) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盐',
  `register_date` datetime(0) NOT NULL COMMENT '注册时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `head_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像',
  `active_status` tinyint(1) NULL DEFAULT NULL COMMENT '激活状态',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alipay_account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝账号',
  `del` tinyint(1) NULL DEFAULT NULL COMMENT '是否注销',
  `del_date` datetime(0) NULL DEFAULT NULL COMMENT '注销日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10020 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (10010, 'p1234', 'a3e5f90aa31729f65624401298581c8d9dd0b4c9', 'p1234', NULL, NULL, '测试', '123', 'ce59a876b03d4428b88d', '2021-02-24 20:25:17', NULL, '', 0, 'p94@qq.com', NULL, 1, '2021-02-23 15:10:57');
INSERT INTO `user` VALUES (10006, 'pipihao', 'ffabbd4e922295aba5adf7677ad3893d1d73f7a8', '牛战士', '2021-01-26 00:00:00', 1, '湖南省', '志不真则心不热，心不热则功不紧', '8814d459a4db41f591c8', '2021-01-19 14:16:06', NULL, 'http://localhost:81/img/2021-02-02/202102020942309fa25c11607d4887a8004b4cbcc74317.jpg', 1, '87095894@qq.com', '123123', NULL, NULL);
INSERT INTO `user` VALUES (10007, 'test123', '1d473787a653819bc8b99e6d749f683f386152b9', '我只是Test', NULL, 0, NULL, NULL, '6371aa8029ab40288cc2', '2021-01-28 19:37:46', NULL, 'http://localhost:81/img/2021-01-28/20210128203429959e640b4586482fa42f81ba6c163162.jpg', 1, 'test123@q.com', NULL, NULL, NULL);
INSERT INTO `user` VALUES (10008, 'pph001', 'c1957bc108b1b9e84d39995a75de211f87de4197', '小皮的测试号1', NULL, NULL, NULL, NULL, '0ce906f4963e41e59904', '2021-02-05 19:18:47', NULL, 'http://localhost:81/img/2021-02-05/20210205191911ca5260f4cc1c4e488a8870e17fdc0b0e.jpg', 1, 'qwer@qq.com', NULL, NULL, NULL);
INSERT INTO `user` VALUES (10009, 'pph002', 'd1e346d54d353abe7cf38b9e3ad7ac3a675a3233', '小皮02', NULL, NULL, NULL, NULL, 'b4c5ba45614f40f38fc0', '2021-02-05 19:23:27', NULL, 'http://localhost:81/img/2021-02-05/202102051924004b32bf65df4f41eb92a4a828efcc3ceb.jpg', 1, 'qwe123r@qq.com', NULL, NULL, NULL);
INSERT INTO `user` VALUES (10011, '18941', 'f3f1b719e6eeedbba8a27a6f24b763942b660640', '18941', NULL, NULL, NULL, NULL, '873e3b53aa834e78b25b', '2021-02-25 15:13:50', NULL, '', 0, '1894@qq.com', NULL, 1, '2021-02-22 15:17:56');
INSERT INTO `user` VALUES (10012, 'b5894', '92c0b2c7a549d6e53665d8721b1c22d3398dc87f', 'b5894', NULL, NULL, NULL, NULL, 'b3c1dbd805d54effab01', '2021-02-25 15:13:58', NULL, '', 0, 'b5894@qq.com', NULL, 1, '2021-02-15 15:17:53');
INSERT INTO `user` VALUES (10013, 'b9400', 'fa2833594f156a860009b8d7add6db1d2c1a1bf2', 'b9400', NULL, NULL, NULL, NULL, '7235e4423dad49c3b9a3', '2021-02-25 15:14:16', NULL, '', 0, 'b94@qq.com', NULL, 1, '2021-02-10 15:17:50');
INSERT INTO `user` VALUES (10014, 'bb894', 'f6510e2fdfe4423426452f6ecb81166a493f6e5e', 'bb894', NULL, NULL, NULL, NULL, 'b10ce182ea2c4445a3fd', '2021-02-25 15:14:29', NULL, '', 0, 'bb894@qq.com', NULL, NULL, '2021-02-24 15:17:49');
INSERT INTO `user` VALUES (10015, 'a1231', '7d1d3fcfc1a62c9c7a78a4a5921cacd1598e170a', 'a1231', NULL, NULL, NULL, NULL, 'd0b7e70e86094cd8ade7', '2021-02-25 15:14:43', NULL, '', 0, 'a123@qq.com', NULL, NULL, '2021-02-15 15:17:46');
INSERT INTO `user` VALUES (10016, 'a1232', 'd360f86542887cf168440a9350a6df66c5a58d3b', 'a1232', NULL, NULL, NULL, NULL, '7867521729964f74a53d', '2021-02-25 15:14:55', NULL, '', 0, 'a1232@qq.com', NULL, 1, '2021-02-25 20:19:02');
INSERT INTO `user` VALUES (10017, 'p95894', 'ae8a3f299a988fd95d909760e36932fb0599af26', 'p95894', NULL, NULL, NULL, NULL, '3d9f8cc467754cf4b570', '2021-02-25 15:15:26', NULL, '', 0, 'p95894@qq.com', NULL, NULL, '2021-02-16 15:17:44');
INSERT INTO `user` VALUES (10018, '111111', '6c6f138b67da597bcbff9df4d8545ee9e5dd8348', '111111', NULL, NULL, NULL, NULL, '0c523bfd17a143839e6a', '2021-02-25 20:19:17', NULL, '', 0, '111@qq.com', NULL, NULL, NULL);
INSERT INTO `user` VALUES (10019, '123123', 'fba804ef22dcb537833593e496909873e92df21e', '123123', NULL, NULL, NULL, NULL, 'a5de2ef8882742af9dab', '2021-02-27 22:11:46', NULL, '', 0, '870951894@qq.com', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '县',
  `dailed_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `is_default` tinyint(4) NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES (10, 10007, '我是Test', '17775646924', '广西壮族自治区', '梧州市', '长洲区', 'hocek\nasdfs', 0, '2021-02-02 10:28:12');
INSERT INTO `user_address` VALUES (8, 10006, '皮皮豪', '17775646924', '内蒙古自治区', '乌海市', '海勃湾区', 'hocek\nasdfs', 0, '2021-01-30 20:23:58');
INSERT INTO `user_address` VALUES (5, 10006, '小皮', '17777777777', '湖南省', '衡阳市', '衡南县', '小皮123123', 1, '2021-01-30 19:17:54');
INSERT INTO `user_address` VALUES (9, 10006, '小皮', '17775646924', '内蒙古自治区', '呼和浩特市', '市辖区', 'hocek\nasdfs', 0, '2021-01-30 20:25:39');
INSERT INTO `user_address` VALUES (11, 10007, 'mark pi', '17775646924', '内蒙古自治区', '通辽市', '科尔沁左翼后旗', 'hocek\nasdfs', 1, '2021-02-02 10:29:03');
INSERT INTO `user_address` VALUES (12, 10006, '逼霖是傻子', '18888888888', '湖南省', '衡阳市', '衡阳县', '小皮村', 0, '2021-02-02 17:53:30');
INSERT INTO `user_address` VALUES (13, 10006, '小皮', '17777777777', '湖南省', '衡阳市', '衡阳县', '小皮', 0, '2021-02-02 18:28:01');

-- ----------------------------
-- Table structure for wallet
-- ----------------------------
DROP TABLE IF EXISTS `wallet`;
CREATE TABLE `wallet`  (
  `user_id` int(11) NOT NULL,
  `balance` decimal(10, 2) NOT NULL COMMENT '余额',
  `first_date` datetime(0) NOT NULL COMMENT '创建时间',
  `last_trading_time` datetime(0) NOT NULL COMMENT '最后一次交易时间',
  `total_revenue` decimal(10, 2) NOT NULL COMMENT '收入总额',
  `total_expenditure` decimal(10, 2) NOT NULL COMMENT '支出总额',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of wallet
-- ----------------------------
INSERT INTO `wallet` VALUES (10006, 18731.86, '2021-01-28 19:03:53', '2021-02-14 20:03:33', 17229.86, 498.00);
INSERT INTO `wallet` VALUES (10007, 83267.14, '2021-01-28 19:37:46', '2021-02-14 20:03:33', 398.00, 17129.86);
INSERT INTO `wallet` VALUES (10008, 0.00, '2021-02-05 19:18:47', '2021-02-05 19:18:47', 0.00, 0.00);
INSERT INTO `wallet` VALUES (10009, 0.00, '2021-02-05 19:23:27', '2021-02-05 19:23:27', 0.00, 0.00);
INSERT INTO `wallet` VALUES (10010, 0.00, '2021-02-24 20:25:17', '2021-02-24 20:25:17', 0.00, 0.00);
INSERT INTO `wallet` VALUES (10011, 0.00, '2021-02-25 15:13:50', '2021-02-25 15:13:50', 0.00, 0.00);
INSERT INTO `wallet` VALUES (10012, 0.00, '2021-02-25 15:13:58', '2021-02-25 15:13:58', 0.00, 0.00);
INSERT INTO `wallet` VALUES (10013, 0.00, '2021-02-25 15:14:16', '2021-02-25 15:14:16', 0.00, 0.00);
INSERT INTO `wallet` VALUES (10014, 0.00, '2021-02-25 15:14:29', '2021-02-25 15:14:29', 0.00, 0.00);
INSERT INTO `wallet` VALUES (10015, 0.00, '2021-02-25 15:14:43', '2021-02-25 15:14:43', 0.00, 0.00);
INSERT INTO `wallet` VALUES (10016, 0.00, '2021-02-25 15:14:55', '2021-02-25 15:14:55', 0.00, 0.00);
INSERT INTO `wallet` VALUES (10017, 0.00, '2021-02-25 15:15:26', '2021-02-25 15:15:26', 0.00, 0.00);
INSERT INTO `wallet` VALUES (10018, 0.00, '2021-02-25 20:19:17', '2021-02-25 20:19:17', 0.00, 0.00);
INSERT INTO `wallet` VALUES (10019, 0.00, '2021-02-27 22:11:46', '2021-02-27 22:11:46', 0.00, 0.00);

SET FOREIGN_KEY_CHECKS = 1;
