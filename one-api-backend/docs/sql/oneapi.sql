/*
 Navicat Premium Data Transfer

 Source Server         : 43.142.4.174
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35)
 Source Host           : 43.142.4.174:3306
 Source Schema         : oneapi

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35)
 File Encoding         : 65001

 Date: 14/12/2023 22:29:49
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for interface_info
-- ----------------------------
DROP TABLE IF EXISTS `interface_info`;
CREATE TABLE `interface_info`
(
    `id`                     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`                   varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
    `description`            varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
    `url`                    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接口地址',
    `host`                   varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主机名',
    `request_params`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '请求参数',
    `request_params_remark`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '请求参数说明',
    `response_params_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '响应参数说明',
    `request_header`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '请求头',
    `response_header`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '响应头',
    `status`                 int                                                           NOT NULL DEFAULT 0 COMMENT '接口状态（0-关闭，1-开启）',
    `method`                 varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求类型',
    `user_id`                bigint                                                        NOT NULL COMMENT '创建人',
    `create_time`            datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`            datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete`              tinyint                                                       NOT NULL DEFAULT 0 COMMENT '是否删除(0-未删, 1-已删)',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '接口信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of interface_info
-- ----------------------------
INSERT INTO `interface_info`
VALUES (1, '获取当前用户名称', '获取用户名称', '/api/name/user', 'http://localhost:8090',
        '{\n    \"username\": \"nero\"\n}', NULL, NULL, '{\"Content-Type\": \"application/json\"}',
        '{\"Content-Type\": \"application/json\"}', 1, 'POST', 1667508636207661058, '2023-06-14 21:18:10',
        '2023-07-10 11:24:01', 0);
INSERT INTO `interface_info`
VALUES (24, '随机头像', '随机获取一个头像地址', '/api/rand.avatar', 'https://api.uomg.com', 'sort=男&format=json',
        '[{\"id\":1688957070977,\"name\":\"sort\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择输出分类[男|女|动漫男|动漫女]，为空随机输出\"},{\"id\":1688957075391,\"name\":\"format\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择输出格式[json|images]\"}]',
        '[{\"id\":1688957088125,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1688957090261,\"name\":\"imgurl\",\"type\":\"string\",\"remark\":\"返回图片地址\"},{\"id\":1688957090855,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示信息！\"}]',
        '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET',
        1667508636207661058, '2023-07-08 12:07:23', '2023-07-10 10:45:10', 0);
INSERT INTO `interface_info`
VALUES (26, '网易云音乐随机歌曲', '网易云音乐，随机歌曲输出。', '/api/rand.music', 'https://api.uomg.com',
        'sort=热歌榜&format=json',
        '[{\"id\":1,\"name\":\"sort\",\"isRequired\":\"否\",\"type\":\"string\",\"remark\":\"选择输出分类[热歌榜|新歌榜|飙升榜|抖音榜|电音榜]，为空输出热歌榜\"},{\"id\":2,\"name\":\"mid\",\"isRequired\":\"否\",\"type\":\"int\",\"remark\":\"网易云歌单ID\"},{\"id\":1688815371547,\"name\":\"format\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择输出格式[json|mp3]\"}]',
        '[{\"id\":1688815422793,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1688815424624,\"name\":\"data\",\"type\":\"string\",\"remark\":\"返回歌曲数据\"},{\"id\":1688815425060,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示信息\"}]',
        '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET',
        1667508636207661058, '2023-07-08 16:30:06', '2023-07-08 19:43:01', 0);
INSERT INTO `interface_info`
VALUES (27, '网易云音乐热门评论', '网易云音乐热门评论随机API接口', '/api/comments.163', 'https://api.uomg.com',
        'format=json',
        '[{\"id\":1688816624700,\"name\":\"mid\",\"isRequired\":\"no\",\"type\":\"int\",\"remark\":\"网易云歌单ID\"},{\"id\":1688816632619,\"name\":\"format\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择输出格式[json|mp3]\"}]',
        '[{\"id\":1688816648171,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1688816649732,\"name\":\"data\",\"type\":\"string\",\"remark\":\"返回评论数据\"},{\"id\":1688816650394,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示信息\"}]',
        NULL, NULL, 1, 'GET', 1667508636207661058, '2023-07-08 17:05:42', '2023-07-10 11:24:32', 0);
INSERT INTO `interface_info`
VALUES (29, '随机壁纸', '随机获取一个壁纸地址', '/sjbz/api.php', 'http://api.btstu.cn', 'lx=dongman&format=json',
        '[{\"id\":1689002138135,\"name\":\"method\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"输出壁纸端[mobile|pc|zsy]默认为pc\"},{\"id\":1689002153560,\"name\":\"lx\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择输出分类[meizi|dongman|fengjing|suiji]，为空随机输出\"},{\"id\":1689002153860,\"name\":\"format\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"输出壁纸格式[json|images]默认为images\"}]',
        '[{\"id\":1689002171759,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1689002173057,\"name\":\"imgurl\\t\",\"type\":\"string\",\"remark\":\"返回图片地址\"},{\"id\":1689002173621,\"name\":\"width\",\"type\":\"string\",\"remark\":\"返回图片宽度\"},{\"id\":1689002184505,\"name\":\"height\\t\",\"type\":\"string\",\"remark\":\"返回图片高度\"}]',
        NULL, NULL, 1, 'GET', 1667508636207661058, '2023-07-09 20:28:31', '2023-07-10 23:45:37', 0);
INSERT INTO `interface_info`
VALUES (30, '毒鸡汤', '随机生成一句毒鸡汤语录', '/yan/api.php', 'http://localhost:8090', 'charset=utf-8&encode=json',
        '[{\"id\":1689002041985,\"name\":\"charset\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"返回编码类型[gbk|utf-8]默认utf-8\"},{\"id\":1689002080311,\"name\":\"encode\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"返回格式类型[text|js|json]默认text\"}]',
        '[{\"id\":1689002092752,\"name\":\"code\",\"type\":\"string\",\"remark\":\"code\"}]', NULL, NULL, 1, 'GET',
        1667508636207661058, '2023-07-09 21:17:10', '2023-07-10 23:17:52', 0);
INSERT INTO `interface_info`
VALUES (31, '抖音解析', '解析抖音链接，获取无水印链接', '/dyjx/api.php', 'http://api.btstu.cn',
        'url=https://v.douyin.com/J8TVGVn/',
        '[{\"id\":1689003649028,\"name\":\"url\",\"isRequired\":\"yes\",\"type\":\"string\",\"remark\":\"需要解析的抖音地址\"}]',
        '[{\"id\":1689003654626,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1689003659703,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"状态码说明\"},{\"id\":1689003660215,\"name\":\"data\",\"type\":\"string\",\"remark\":\"链接解析信息\"}]',
        NULL, NULL, 1, 'GET/POST', 1667508636207661058, '2023-07-10 23:29:28', '2023-07-11 00:07:13', 1);
INSERT INTO `interface_info`
VALUES (32, 'Qrcode二维码', '生成在线二维码', '/qrcode/api.php', 'http://api.btstu.cn',
        'text=https://api.btstu.cn&size=300',
        '[{\"id\":1689003685138,\"name\":\"text\",\"isRequired\":\"yes\",\"type\":\"string\",\"remark\":\"二维码内容\"},{\"id\":1689003723361,\"name\":\"size\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"二维码大小，单位为px\"}]',
        '[{\"id\":1689003739093,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1689003740418,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示！\"}]',
        NULL, NULL, 1, 'GET', 1667508636207661058, '2023-07-10 23:36:22', '2023-07-11 00:05:28', 1);
INSERT INTO `interface_info`
VALUES (33, '获取QQ昵称和头像', '获取QQ昵称和头像', '/qqxt/api.php', 'http://api.btstu.cn', 'qq=10001',
        '[{\"id\":1689004243483,\"name\":\"qq\",\"isRequired\":\"yes\",\"type\":\"string\",\"remark\":\"查询的QQ号码\"}]',
        '[{\"id\":1689004308636,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1689004319045,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示！\"},{\"id\":1689004319618,\"name\":\"imgurl\",\"type\":\"string\",\"remark\":\"QQ头像图片地址\"},{\"id\":1689004320086,\"name\":\"name\",\"type\":\"string\",\"remark\":\"QQ昵称\"}]',
        NULL, NULL, 1, 'GET', 1667508636207661058, '2023-07-10 23:52:19', '2023-07-10 23:54:32', 1);
INSERT INTO `interface_info`
VALUES (34, '短网址生成', '将长网址进行缩短，支持百度、新浪、腾讯短网址等等。', '/api/long2dwz', 'https://api.uomg.com',
        'dwzapi=urlcn&url=http://qrpay.uomg.com',
        '[{\"id\":1689004480035,\"name\":\"url\",\"isRequired\":\"yes\",\"type\":\"string\",\"remark\":\"需要进行缩短的长网址\"},{\"id\":1689004514429,\"name\":\"dwzapi\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择缩短接口[tcn|dwzcn|urlcn|suoim|mrwso|]\"}]',
        '[{\"id\":1689004538420,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1689004564886,\"name\":\"ae_url\",\"type\":\"string\",\"remark\":\"返回缩短后的短网址\"},{\"id\":1689004565428,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示信息！\"}]',
        NULL, NULL, 1, 'GET/POST', 1667508636207661058, '2023-07-10 23:56:35', '2023-07-10 23:57:13', 0);
INSERT INTO `interface_info`
VALUES (35, '获取头像', '获取头像', '/api/avatar/cartoon', 'http://localhost:8090', NULL, NULL, NULL, NULL, NULL, 0,
        'GET', 24, '2023-12-14 14:01:28', '2023-12-14 14:02:10', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `id`            bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_name`     varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '新用户' COMMENT '用户昵称',
    `user_account`  varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
    `user_avatar`   varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
    `gender`        tinyint NULL DEFAULT NULL COMMENT '性别',
    `user_role`     varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user / admin',
    `user_password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
    `access_key`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'accessKey',
    `secret_key`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'secretKey',
    `create_time`   datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete`     tinyint                                                       NOT NULL DEFAULT 0 COMMENT '是否删除',
    `signature`     varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '签名',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uni_userAccount`(`user_account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user`
VALUES (4, '心跳', 'oneapi', 'http://yuque.heshuoshi.top/html5/QQ%E5%9B%BE%E7%89%8720230217132131.jpg', NULL, 'admin',
        '57df50652cfa976dc79468675a96933a', 'a84b6f645d6b5bc6b66a253545f19eee', '36484fddc396bf8e4cc1769339532196',
        '2023-02-21 15:54:22', '2023-12-14 13:47:48', 0, '泰裤辣！！！');
INSERT INTO `user`
VALUES (24, '新用户', 'admin', 'http://yuque.heshuoshi.top/html5/IMG_1364(20230426-213630).JPG', NULL, 'user',
        '57df50652cfa976dc79468675a96933a', '7947c27ca461385c52d38c1a696ec196', '2c9bab9f7506e43b58ed68b11d607341',
        '2023-05-09 00:17:25', '2023-12-14 13:47:43', 0, NULL);

-- ----------------------------
-- Table structure for user_interface_info
-- ----------------------------
DROP TABLE IF EXISTS `user_interface_info`;
CREATE TABLE `user_interface_info`
(
    `id`                bigint   NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id`           bigint   NOT NULL COMMENT '调用用户ID',
    `interface_info_id` bigint   NOT NULL COMMENT '接口信息ID',
    `total_num`         int      NOT NULL DEFAULT 0 COMMENT '总调用次数',
    `left_num`          int      NOT NULL DEFAULT 0 COMMENT '剩余调用次数',
    `status`            int      NOT NULL DEFAULT 0 COMMENT '0-正常，1-禁用',
    `create_time`       datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`       datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete`         tinyint  NOT NULL DEFAULT 0 COMMENT '是否删除(0-未删, 1-已删)',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户调用接口关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_interface_info
-- ----------------------------
INSERT INTO `user_interface_info`
VALUES (1, 4, 1, 174, 19861, 0, '2022-12-09 14:29:15', '2023-05-20 15:23:22', 0);
INSERT INTO `user_interface_info`
VALUES (2, 3, 2, 13, 5, 0, '2023-04-27 09:18:49', '2023-04-27 09:18:49', 0);
INSERT INTO `user_interface_info`
VALUES (4, 2, 3, 12, 3, 0, '2023-04-27 09:18:49', '2023-04-27 09:18:49', 0);
INSERT INTO `user_interface_info`
VALUES (6, 3, 4, 1, 6, 0, '2023-04-27 09:18:49', '2023-04-27 09:18:49', 0);
INSERT INTO `user_interface_info`
VALUES (7, 4, 3, 64, 18926, 0, '2023-04-27 09:18:49', '2023-05-11 15:23:39', 0);
INSERT INTO `user_interface_info`
VALUES (8, 4, 2, 237, 9863, 0, '2022-12-09 14:29:15', '2023-05-29 10:30:22', 0);
INSERT INTO `user_interface_info`
VALUES (9, 14, 1, 0, 100, 0, '2023-05-08 23:32:11', '2023-05-08 23:32:11', 0);
INSERT INTO `user_interface_info`
VALUES (10, 22, 1, 0, 100, 0, '2023-05-09 00:13:30', '2023-05-09 00:13:30', 0);
INSERT INTO `user_interface_info`
VALUES (11, 23, 1, 0, 100, 0, '2023-05-09 00:14:28', '2023-05-09 00:14:28', 0);
INSERT INTO `user_interface_info`
VALUES (12, 24, 1, 0, 100, 0, '2023-05-09 00:17:28', '2023-05-09 00:17:28', 0);

SET
FOREIGN_KEY_CHECKS = 1;
