/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : ysf_api

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 22/01/2018 14:31:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for api_module
-- ----------------------------
DROP TABLE IF EXISTS `api_module`;
CREATE TABLE `api_module` (
  `uid` bigint(20) NOT NULL COMMENT '主键',
  `uname` varchar(64) DEFAULT NULL COMMENT '模块名',
  `api_project_id` bigint(20) DEFAULT NULL COMMENT '所属项目名',
  `api_num` varchar(128) DEFAULT NULL COMMENT '模块编号',
  `api_code` varchar(128) DEFAULT NULL COMMENT '模块编码',
  `intro` varchar(512) DEFAULT NULL COMMENT '模块简介',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_module
-- ----------------------------
BEGIN;
INSERT INTO `api_module` VALUES (151726124882198528, 'grade 模块', 151726107689746432, NULL, 'grade', '');
INSERT INTO `api_module` VALUES (151728815163310080, 'api 模块', 151726107689746432, NULL, 'api', '');
INSERT INTO `api_module` VALUES (151751255729897472, 'sr模块', 151726107689746432, NULL, 'sr', '');
INSERT INTO `api_module` VALUES (151829793069858816, 'cr模块', 151726107689746432, NULL, 'course', '');
INSERT INTO `api_module` VALUES (151830993219616768, '文章模块', 151726107689746432, NULL, 'article', '');
INSERT INTO `api_module` VALUES (152200528472834048, '用户模块', 151726107689746432, NULL, 'user', '');
COMMIT;

-- ----------------------------
-- Table structure for api_project
-- ----------------------------
DROP TABLE IF EXISTS `api_project`;
CREATE TABLE `api_project` (
  `uid` bigint(20) NOT NULL COMMENT '主键',
  `uname` varchar(64) DEFAULT NULL COMMENT '项目名',
  `test_domain` varchar(128) DEFAULT NULL COMMENT '测试域名',
  `ready_domain` varchar(128) DEFAULT NULL COMMENT '准生产域名',
  `product_domain` varchar(128) DEFAULT NULL COMMENT '生产域名',
  `intro` varchar(512) DEFAULT NULL COMMENT '项目简介',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `pro_num` varchar(128) DEFAULT NULL COMMENT '项目编号',
  `host_name` varchar(128) DEFAULT NULL COMMENT '项目名',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_project
-- ----------------------------
BEGIN;
INSERT INTO `api_project` VALUES (151726107689746432, '测试项目', 'localhost:18082/', NULL, NULL, '测试项目', '2018-01-19 13:46:29', NULL, 'sims');
COMMIT;

-- ----------------------------
-- Table structure for api_request
-- ----------------------------
DROP TABLE IF EXISTS `api_request`;
CREATE TABLE `api_request` (
  `uid` bigint(20) NOT NULL COMMENT '主键',
  `uname` varchar(64) DEFAULT NULL,
  `api_project_id` bigint(20) DEFAULT NULL COMMENT '对应项目ID',
  `api_module_id` bigint(20) DEFAULT NULL COMMENT '对应模块',
  `request_uri` varchar(128) DEFAULT NULL COMMENT '请求uri',
  `request_method` varchar(10) DEFAULT NULL COMMENT '请求类型',
  `response_standard` varchar(1024) DEFAULT NULL COMMENT '请求类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(10) DEFAULT NULL COMMENT '接口状态',
  `intro` varchar(256) DEFAULT NULL COMMENT '接口简介',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_request
-- ----------------------------
BEGIN;
INSERT INTO `api_request` VALUES (151727030465986560, '测试接口', 151726107689746432, 151726124882198528, '/sims/grade/page', 'GET', '', '2018-01-19 13:50:09', NULL, NULL, '我就是想测试一哈');
INSERT INTO `api_request` VALUES (151751255750868992, NULL, 151726107689746432, 151751255729897472, '/sims/sr/page', 'GET', NULL, '2018-01-19 15:26:24', NULL, NULL, NULL);
INSERT INTO `api_request` VALUES (151829793627701248, NULL, 151726107689746432, 151829793069858816, '/sims/course/page', 'GET', NULL, '2018-01-19 20:38:29', NULL, NULL, NULL);
INSERT INTO `api_request` VALUES (151829913173753856, NULL, 151726107689746432, 151829793069858816, '/sims/course/ware/page', 'GET', NULL, '2018-01-19 20:38:58', NULL, NULL, NULL);
INSERT INTO `api_request` VALUES (151830993697767424, NULL, 151726107689746432, 151830993219616768, '/sims/article/page', 'GET', NULL, '2018-01-19 20:43:15', NULL, NULL, NULL);
INSERT INTO `api_request` VALUES (151831038509711360, NULL, 151726107689746432, 151830993219616768, '/sims/article/detail/{uid}', 'GET', NULL, '2018-01-19 20:43:26', NULL, NULL, NULL);
INSERT INTO `api_request` VALUES (152040097242415104, NULL, 151726107689746432, 151726124882198528, '/sims/grade/detail/{uid}', 'GET', NULL, '2018-01-20 10:34:10', NULL, NULL, NULL);
INSERT INTO `api_request` VALUES (152054723745153024, NULL, 151726107689746432, 151728815163310080, '/sims/api/req/edit', 'POST', NULL, '2018-01-20 11:32:17', NULL, NULL, NULL);
INSERT INTO `api_request` VALUES (152067919604350976, NULL, 151726107689746432, 151829793069858816, '/sims/course/ware/detail/{uid}', 'GET', NULL, '2018-01-20 12:24:43', NULL, NULL, NULL);
INSERT INTO `api_request` VALUES (152200528607051776, NULL, 151726107689746432, 152200528472834048, '/sims/user/page', 'GET', NULL, '2018-01-20 21:11:39', NULL, NULL, NULL);
INSERT INTO `api_request` VALUES (152211003067596800, NULL, 151726107689746432, 152200528472834048, '/sims/user/page/', 'GET', NULL, '2018-01-20 21:53:17', NULL, NULL, NULL);
INSERT INTO `api_request` VALUES (152434525702455296, NULL, 151726107689746432, 151728815163310080, '/sims/api/field/edit', 'POST', NULL, '2018-01-21 12:41:29', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for api_request_parameter
-- ----------------------------
DROP TABLE IF EXISTS `api_request_parameter`;
CREATE TABLE `api_request_parameter` (
  `uid` bigint(20) NOT NULL COMMENT '主键',
  `uname` varchar(64) DEFAULT NULL COMMENT '名称',
  `field_key` varchar(64) NOT NULL COMMENT '参数key',
  `field_value` varchar(512) DEFAULT NULL COMMENT '参数值',
  `field_default` varchar(64) DEFAULT NULL COMMENT '默认值',
  `api_request_id` bigint(20) NOT NULL COMMENT '对应请求ID',
  `intro` varchar(512) DEFAULT NULL COMMENT '参数简介',
  `field_grade` int(3) DEFAULT NULL COMMENT '参数层级',
  `field_type` int(3) DEFAULT NULL COMMENT '参数类型',
  PRIMARY KEY (`api_request_id`,`field_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_request_parameter
-- ----------------------------
BEGIN;
INSERT INTO `api_request_parameter` VALUES (152539471252815872, NULL, 'chargeName', '', NULL, 151727030465986560, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152539471252815875, NULL, 'pageNum', '1', NULL, 151727030465986560, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152539471252815876, NULL, 'pageSize', '10', NULL, 151727030465986560, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152539471252815874, NULL, 'status', '', NULL, 151727030465986560, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152539471252815873, NULL, 'yearMark', '', NULL, 151727030465986560, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152462424153260036, NULL, 'classId', 'A001_20170222100254', NULL, 151751255750868992, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152460618828349442, NULL, 'gradeId', 'A001_20171421091400', NULL, 151751255750868992, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152539459160637440, NULL, 'pageNum', '1', NULL, 151751255750868992, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152539459160637441, NULL, 'pageSize', '10', NULL, 151751255750868992, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152459608345018371, NULL, 'userId', '2', NULL, 151751255750868992, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152539483869282304, NULL, 'name', '', NULL, 151829793627701248, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152539483869282306, NULL, 'pageNum', '1', NULL, 151829793627701248, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152539483869282307, NULL, 'pageSize', '10', NULL, 151829793627701248, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152539483869282305, NULL, 'yearMark', '', NULL, 151829793627701248, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152488377231343619, NULL, 'courseFile', '', NULL, 151829913173753856, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152488377231343622, NULL, 'gradeMark', '', NULL, 151829913173753856, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152488377231343624, NULL, 'pageNum', '1', NULL, 151829913173753856, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152488377231343625, NULL, 'pageSize', '10', NULL, 151829913173753856, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152488377231343623, NULL, 'simsCourseId', '', NULL, 151829913173753856, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152488377231343621, NULL, 'simsGradeRecordId', '', NULL, 151829913173753856, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152488377231343618, NULL, 'simsTearcherRecordId', '', NULL, 151829913173753856, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152488377231343626, NULL, 'subjectId', '4', NULL, 151829913173753856, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152488377231343620, NULL, 'title', '', NULL, 151829913173753856, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152488377231343616, NULL, 'uid', '', NULL, 151829913173753856, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152488377231343617, NULL, 'userId', '', NULL, 151829913173753856, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152054764597673984, NULL, 'intro', '我就是想测试一哈', NULL, 152054723745153024, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152054764597673985, NULL, 'requestMethod', 'GET', NULL, 152054723745153024, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152054764597673986, NULL, 'requestUri', '/sims/grade/page', NULL, 152054723745153024, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152054764597673987, NULL, 'responseStandard', '', NULL, 152054723745153024, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152054764597673988, NULL, 'status', '', NULL, 152054723745153024, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152054764597673989, NULL, 'uid', '151727030465986560', NULL, 152054723745153024, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152054764597673990, NULL, 'uname', '测试接口', NULL, 152054723745153024, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528619634699, NULL, 'address', '', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528615440388, NULL, 'age', '', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528619634695, NULL, 'cityId', '0', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528619634696, NULL, 'cityName', '', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528619634690, NULL, 'classId', '0', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528619634691, NULL, 'countryId', '0', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528619634692, NULL, 'countryName', '', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528615440391, NULL, 'email', '', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528615440389, NULL, 'gender', '', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528619634689, NULL, 'gradeId', '0', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528615440390, NULL, 'mobileNum', '', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528615440387, NULL, 'nickname', '', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528619634700, NULL, 'pageNum', '1', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528619634701, NULL, 'pageSize', '12', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528619634693, NULL, 'provinceId', '0', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528619634694, NULL, 'provinceName', '', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528615440392, NULL, 'qqNum', '', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528619634688, NULL, 'schoolId', '0', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528619634697, NULL, 'townId', '0', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528619634698, NULL, 'townName', '', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528615440386, NULL, 'userLevel', '', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528615440384, NULL, 'userName', '', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152200528615440385, NULL, 'userType', '0', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152210061886750720, NULL, 'x', '', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152210061886750721, NULL, 'y', '', NULL, 152200528607051776, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152434676881948672, NULL, 'uid', '152434370630647834', NULL, 152434525702455296, NULL, NULL, 1);
INSERT INTO `api_request_parameter` VALUES (152434676881948673, NULL, 'uname', '结果总页数', NULL, 152434525702455296, NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for api_response
-- ----------------------------
DROP TABLE IF EXISTS `api_response`;
CREATE TABLE `api_response` (
  `uid` bigint(20) NOT NULL COMMENT '主键',
  `api_request_id` bigint(20) DEFAULT NULL COMMENT '对应请求id',
  `request_parameters` varchar(2000) DEFAULT NULL COMMENT '请求参数',
  `response_version` varchar(64) DEFAULT NULL COMMENT '版本',
  `response_result` varchar(10000) DEFAULT NULL COMMENT '请求结果',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_response
-- ----------------------------
BEGIN;
INSERT INTO `api_response` VALUES (152054764606062592, 152054723745153024, '{\"intro\":[\"我就是想测试一哈\"],\"requestMethod\":[\"GET\"],\"requestUri\":[\"/sims/grade/page\"],\"responseStandard\":[\"\"],\"status\":[\"\"],\"uid\":[\"151727030465986560\"],\"uname\":[\"测试接口\"]}', NULL, '{\"code\":1}', '2018-01-20 11:32:27');
INSERT INTO `api_response` VALUES (152210061941276672, 152200528607051776, '{\"x\":[\"\"],\"y\":[\"\"]}', NULL, '{\"code\":1,\"data\":{\"endRow\":10,\"firstPage\":1,\"hasNextPage\":true,\"hasPreviousPage\":false,\"isFirstPage\":true,\"isLastPage\":false,\"lastPage\":3,\"list\":[{\"address\":\"闫李村1组\",\"age\":1,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"798904883@qq.com\",\"gender\":1,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_17/22/20170916225558.png\",\"mobileBack\":\"13262656637\",\"mobileNum\":\"13262656637\",\"nickname\":\"李白\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"1\",\"userLevel\":1,\"userName\":\"李白\",\"userType\":\"1\"},{\"address\":\"闫李村1组\",\"age\":10,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":1,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_17/23/20170916230009.png\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"杜甫\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"10\",\"userLevel\":1,\"userName\":\"杜甫\",\"userType\":\"2\"},{\"address\":\"闫李村1组\",\"age\":11,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":1,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_17/23/20170916230014.png\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"李清照\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"11\",\"userLevel\":1,\"userName\":\"李清照\",\"userType\":\"3\"},{\"address\":\"闫李村1组\",\"age\":12,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":1,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_17/23/20170916230020.png\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"屈原\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"12\",\"userLevel\":1,\"userName\":\"屈原\",\"userType\":\"4\"},{\"address\":\"闫李村1组\",\"age\":13,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":2,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_17/23/20170916230028.png\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"嬴政\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"13\",\"userLevel\":1,\"userName\":\"嬴政\",\"userType\":\"2\"},{\"address\":\"闫李村1组\",\"age\":14,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":2,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_17/23/20170916230036.png\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"康熙\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"14\",\"userLevel\":1,\"userName\":\"康熙\",\"userType\":\"2\"},{\"address\":\"闫李村1组\",\"age\":15,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":2,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_17/23/20170916230044.png\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"乾隆\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"15\",\"userLevel\":1,\"userName\":\"乾隆\",\"userType\":\"1\"},{\"address\":\"闫李村1组\",\"age\":16,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":2,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_18/10/20170917100038.png\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"张万宝\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"16\",\"userLevel\":1,\"userName\":\"张万宝\",\"userType\":\"5\"},{\"address\":\"闫李村1组\",\"age\":17,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":2,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_18/10/20170917100454.png\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"何炅\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"17\",\"userLevel\":1,\"userName\":\"何炅\",\"userType\":\"2\"},{\"address\":\"闫李村1组\",\"age\":2,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":1,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_18/10/20170917100601.jpg\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"宋平\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"2\",\"userLevel\":1,\"userName\":\"宋平\",\"userType\":\"3\"}],\"navigateFirstPage\":1,\"navigateLastPage\":3,\"navigatePages\":8,\"navigatepageNums\":[1,2,3],\"nextPage\":2,\"pageNum\":1,\"pageSize\":10,\"pages\":3,\"prePage\":0,\"size\":10,\"startRow\":1,\"total\":23},\"message\":\"success\"}', '2018-01-20 21:49:32');
INSERT INTO `api_response` VALUES (152215000872648704, 152211003067596800, '{}', NULL, '{\"code\":1,\"data\":{\"endRow\":10,\"firstPage\":1,\"hasNextPage\":true,\"hasPreviousPage\":false,\"isFirstPage\":true,\"isLastPage\":false,\"lastPage\":3,\"list\":[{\"address\":\"闫李村1组\",\"age\":1,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"798904883@qq.com\",\"gender\":1,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_17/22/20170916225558.png\",\"mobileBack\":\"13262656637\",\"mobileNum\":\"13262656637\",\"nickname\":\"李白\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"1\",\"userLevel\":1,\"userName\":\"李白\",\"userType\":\"1\"},{\"address\":\"闫李村1组\",\"age\":10,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":1,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_17/23/20170916230009.png\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"杜甫\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"10\",\"userLevel\":1,\"userName\":\"杜甫\",\"userType\":\"2\"},{\"address\":\"闫李村1组\",\"age\":11,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":1,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_17/23/20170916230014.png\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"李清照\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"11\",\"userLevel\":1,\"userName\":\"李清照\",\"userType\":\"3\"},{\"address\":\"闫李村1组\",\"age\":12,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":1,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_17/23/20170916230020.png\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"屈原\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"12\",\"userLevel\":1,\"userName\":\"屈原\",\"userType\":\"4\"},{\"address\":\"闫李村1组\",\"age\":13,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":2,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_17/23/20170916230028.png\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"嬴政\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"13\",\"userLevel\":1,\"userName\":\"嬴政\",\"userType\":\"2\"},{\"address\":\"闫李村1组\",\"age\":14,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":2,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_17/23/20170916230036.png\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"康熙\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"14\",\"userLevel\":1,\"userName\":\"康熙\",\"userType\":\"2\"},{\"address\":\"闫李村1组\",\"age\":15,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":2,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_17/23/20170916230044.png\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"乾隆\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"15\",\"userLevel\":1,\"userName\":\"乾隆\",\"userType\":\"1\"},{\"address\":\"闫李村1组\",\"age\":16,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":2,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_18/10/20170917100038.png\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"张万宝\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"16\",\"userLevel\":1,\"userName\":\"张万宝\",\"userType\":\"5\"},{\"address\":\"闫李村1组\",\"age\":17,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":2,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_18/10/20170917100454.png\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"何炅\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"17\",\"userLevel\":1,\"userName\":\"何炅\",\"userType\":\"2\"},{\"address\":\"闫李村1组\",\"age\":2,\"birth\":1494000000000,\"cityName\":\"\",\"classId\":\"\",\"countryName\":\"\",\"email\":\"935323727@qq.com\",\"emailBack\":\"\",\"gender\":1,\"gradeId\":\"\",\"headicon\":\"http://localhost:18082/upload/headIcon/2017/8_18/10/20170917100601.jpg\",\"mobileBack\":\"\",\"mobileNum\":\"13262656637\",\"nickname\":\"宋平\",\"provinceName\":\"\",\"qqNum\":\"935323727\",\"realHeadicon\":\"\",\"schoolId\":\"1\",\"townName\":\"\",\"uid\":\"2\",\"userLevel\":1,\"userName\":\"宋平\",\"userType\":\"3\"}],\"navigateFirstPage\":1,\"navigateLastPage\":3,\"navigatePages\":8,\"navigatepageNums\":[1,2,3],\"nextPage\":2,\"pageNum\":1,\"pageSize\":10,\"pages\":3,\"prePage\":0,\"size\":10,\"startRow\":1,\"total\":23},\"message\":\"success\"}', '2018-01-20 22:09:10');
INSERT INTO `api_response` VALUES (152434676890337280, 152434525702455296, '{\"uid\":[\"152434370630647834\"],\"uname\":[\"结果总页数\"]}', NULL, '{\"code\":1}', '2018-01-21 12:42:05');
INSERT INTO `api_response` VALUES (152460618857709568, 152040097242415104, '{}', NULL, '{\"code\":1,\"data\":{\"classCount\":33,\"createTime\":1513862041000,\"gradeCharge\":\"8\",\"gradeMark\":11,\"remark\":\"\",\"status\":2,\"stuCount\":2333,\"uid\":\"A001_20171421091400\",\"userName\":\"黄盖\",\"yearMark\":2018},\"message\":\"success\"}', '2018-01-21 14:25:10');
INSERT INTO `api_response` VALUES (152488377243926528, 151829913173753856, '{\"courseFile\":[\"\"],\"gradeMark\":[\"\"],\"pageNum\":[\"1\"],\"pageSize\":[\"10\"],\"simsCourseId\":[\"\"],\"simsGradeRecordId\":[\"\"],\"simsTearcherRecordId\":[\"\"],\"subjectId\":[\"4\"],\"title\":[\"\"],\"uid\":[\"\"],\"userId\":[\"\"]}', NULL, '{\"code\":1,\"data\":{\"endRow\":4,\"firstPage\":1,\"hasNextPage\":false,\"hasPreviousPage\":false,\"isFirstPage\":true,\"isLastPage\":true,\"lastPage\":1,\"list\":[{\"courseFile\":\"upload/courseWare/2018/0_17/22/20180116225405.xlsx\",\"courseId\":\"\",\"coverImg\":\"http://localhost:18082/sims/upload/courseWare/2018/0_17/20/20180116205800.png\",\"gradeMark\":1,\"gradeRecordId\":\"\",\"intro\":\"简单xls测试\",\"schoolId\":\"\",\"simsCourseId\":1,\"simsGradeRecordId\":\"1\",\"simsTeacherRecordId\":\"1\",\"title\":\"测试文档1\",\"uid\":\"1\"},{\"courseFile\":\"upload/courseWare/2018/0_17/23/20180116230108.xlsx\",\"courseId\":\"\",\"coverImg\":\"http://localhost:18082/sims/upload/courseWare/2018/0_17/20/20180116205814.png\",\"gradeMark\":1,\"gradeRecordId\":\"\",\"intro\":\"这是一个测试文档\",\"schoolId\":\"\",\"simsGradeRecordId\":\"\",\"simsTeacherRecordId\":\"\",\"title\":\"测试文档\",\"uid\":\"A001_20173004113052\"},{\"courseFile\":\"http://localhost:18082/upload/courseWare/2017/11_5/22/20171204225354.docx\",\"courseId\":\"\",\"coverImg\":\"http://localhost:18082/sims/upload/courseWare/2018/0_17/20/20180116205824.png\",\"gradeMark\":2,\"gradeRecordId\":\"\",\"intro\":\"简单文章\",\"schoolId\":\"\",\"simsGradeRecordId\":\"\",\"simsTeacherRecordId\":\"\",\"title\":\"测试文档\",\"uid\":\"A001_20175504105511\"},{\"courseFile\":\"\",\"coverImg\":\"http://localhost:18082/sims/upload/courseWare/2018/0_17/20/20180116205526.png\",\"gradeMark\":1,\"intro\":\"sdfs\",\"simsGradeRecordId\":\"\",\"title\":\"si\",\"uid\":\"A001_20185516085538\"}],\"navigateFirstPage\":1,\"navigateLastPage\":1,\"navigatePages\":8,\"navigatepageNums\":[1],\"nextPage\":0,\"pageNum\":1,\"pageSize\":10,\"pages\":1,\"prePage\":0,\"size\":4,\"startRow\":1,\"total\":4},\"message\":\"success\"}', '2018-01-21 16:15:28');
INSERT INTO `api_response` VALUES (152488407723933696, 152067919604350976, '{}', NULL, '{\"code\":1,\"data\":{\"courseFile\":\"upload/courseWare/2018/0_17/22/20180116225405.xlsx\",\"courseId\":\"\",\"coverImg\":\"http://localhost:18082/sims/upload/courseWare/2018/0_17/20/20180116205800.png\",\"gradeMark\":1,\"gradeRecordId\":\"\",\"intro\":\"简单xls测试\",\"schoolId\":\"\",\"simsCourseId\":1,\"simsGradeRecordId\":\"1\",\"simsTeacherRecordId\":\"1\",\"title\":\"测试文档1\",\"uid\":\"1\"},\"message\":\"success\"}', '2018-01-21 16:15:35');
INSERT INTO `api_response` VALUES (152539459185803264, 151751255750868992, '{\"pageNum\":[\"1\"],\"pageSize\":[\"10\"]}', NULL, '{\"code\":1,\"data\":{\"endRow\":10,\"firstPage\":1,\"hasNextPage\":false,\"hasPreviousPage\":false,\"isFirstPage\":true,\"isLastPage\":true,\"lastPage\":1,\"list\":[{\"classChargeName\":\"宋平\",\"classId\":\"A001_20173909103941\",\"classLastId\":\"1\",\"classNum\":\"12\",\"gradeId\":\"A001_20172321082316\",\"gradeMark\":1,\"remark\":\"1\",\"schoolId\":1,\"schoolLastId\":1,\"status\":1,\"studentName\":\"李白\",\"teacherId\":\"2\",\"uid\":\"1\",\"userId\":\"A001_20174416104405\",\"yearMark\":2017},{\"classChargeName\":\"嬴政\",\"classId\":\"A001_20170222100254\",\"classNum\":\"12\",\"gradeId\":\"A001_20171421091400\",\"gradeMark\":11,\"studentName\":\"乾隆\",\"teacherId\":\"13\",\"uid\":\"A001_20180007100002\",\"userId\":\"15\",\"yearMark\":2018},{\"classChargeName\":\"嬴政\",\"classId\":\"A001_20183104093119\",\"classNum\":\"1\",\"gradeId\":\"A001_20171421091400\",\"gradeMark\":11,\"studentName\":\"乾隆\",\"teacherId\":\"13\",\"uid\":\"A001_20181105121105\",\"userId\":\"15\",\"yearMark\":2018},{\"classChargeName\":\"何炅\",\"classId\":\"A001_20170518100528\",\"classNum\":\"11\",\"gradeId\":\"A001_20172321082316\",\"gradeMark\":12,\"studentName\":\"李白\",\"teacherId\":\"17\",\"uid\":\"A001_20181507101510\",\"userId\":\"1\",\"yearMark\":2018},{\"classChargeName\":\"何炅\",\"classId\":\"A001_20175121095158\",\"classNum\":\"12\",\"gradeId\":\"A001_20172321082316\",\"gradeMark\":12,\"studentName\":\"庞涓\",\"teacherId\":\"17\",\"uid\":\"A001_20182104122149\",\"userId\":\"A001_20174816104833\",\"yearMark\":2016},{\"classChargeName\":\"何炅\",\"classId\":\"A001_20185205125231\",\"classNum\":\"1\",\"gradeId\":\"A001_20170930040900\",\"gradeMark\":11,\"studentName\":\"刘备\",\"teacherId\":\"17\",\"uid\":\"A001_20182207122238\",\"userId\":\"4\",\"yearMark\":2018},{\"classChargeName\":\"嬴政\",\"classId\":\"A001_20185205125231\",\"classNum\":\"1\",\"gradeId\":\"A001_20170930040900\",\"gradeMark\":11,\"studentName\":\"杜甫\",\"teacherId\":\"13\",\"uid\":\"A001_20185005125005\",\"userId\":\"10\",\"yearMark\":2018},{\"classChargeName\":\"康熙\",\"classId\":\"A001_20171421101439\",\"classNum\":\"12\",\"gradeId\":\"A001_20172321082316\",\"gradeMark\":12,\"studentName\":\"周瑜\",\"teacherId\":\"14\",\"uid\":\"A001_20185203095219\",\"userId\":\"7\",\"yearMark\":2018},{\"classChargeName\":\"何炅\",\"classId\":\"A001_20185005125035\",\"classNum\":\"1\",\"gradeId\":\"A001_20170930040900\",\"gradeMark\":11,\"studentName\":\"乾隆\",\"teacherId\":\"17\",\"uid\":\"A001_20185405125411\",\"userId\":\"15\",\"yearMark\":2018},{\"classChargeName\":\"嬴政\",\"classId\":\"A001_20170222100254\",\"classNum\":\"12\",\"gradeId\":\"A001_20172321082316\",\"gradeMark\":12,\"studentName\":\"苏东坡\",\"teacherId\":\"13\",\"uid\":\"A001_20185903105932\",\"userId\":\"A001_20173214093221\",\"yearMark\":2017}],\"navigateFirstPage\":1,\"navigateLastPage\":1,\"navigatePages\":8,\"navigatepageNums\":[1],\"nextPage\":0,\"pageNum\":1,\"pageSize\":10,\"pages\":1,\"prePage\":0,\"size\":10,\"startRow\":1,\"total\":10},\"message\":\"success\"}', '2018-01-21 19:38:27');
INSERT INTO `api_response` VALUES (152539471261204480, 151727030465986560, '{\"chargeName\":[\"\"],\"pageNum\":[\"1\"],\"pageSize\":[\"10\"],\"status\":[\"\"],\"yearMark\":[\"\"]}', NULL, '{\"code\":1,\"data\":{\"endRow\":10,\"firstPage\":1,\"hasNextPage\":true,\"hasPreviousPage\":false,\"isFirstPage\":true,\"isLastPage\":false,\"lastPage\":2,\"list\":[{\"classCount\":33,\"createTime\":1513862041000,\"gradeCharge\":\"8\",\"gradeMark\":11,\"remark\":\"\",\"status\":2,\"stuCount\":2333,\"uid\":\"A001_20171421091400\",\"userName\":\"黄盖\",\"yearMark\":2018},{\"classCount\":15,\"gradeCharge\":\"11\",\"gradeMark\":11,\"remark\":\"测试当前毒贩夫妇付付付付付sdfdsfd\",\"schoolId\":1,\"status\":2,\"stuCount\":656,\"uid\":\"A001_20170930040900\",\"userName\":\"李清照\",\"yearMark\":2018},{\"classCount\":18,\"createTime\":1513858996000,\"gradeCharge\":\"11\",\"gradeMark\":12,\"remark\":\"\",\"schoolId\":1,\"status\":2,\"stuCount\":666,\"uid\":\"A001_20172321082316\",\"userName\":\"李清照\",\"yearMark\":2017},{\"classCount\":12,\"createTime\":1513993455000,\"gradeCharge\":\"2\",\"gradeMark\":10,\"remark\":\"\",\"status\":2,\"stuCount\":566,\"uid\":\"A001_20174423094415\",\"userName\":\"宋平\",\"yearMark\":2016},{\"classCount\":13,\"createTime\":1511438977000,\"gradeCharge\":\"5\",\"gradeMark\":10,\"remark\":\"\",\"schoolId\":1,\"status\":2,\"stuCount\":510,\"uid\":\"A001_20170923080937\",\"userName\":\"曹操\",\"yearMark\":2016},{\"classCount\":12,\"createTime\":1513993527000,\"gradeCharge\":\"11\",\"gradeMark\":11,\"remark\":\"\",\"status\":2,\"stuCount\":566,\"uid\":\"A001_20174523094526\",\"userName\":\"李清照\",\"yearMark\":2016},{\"classCount\":12,\"createTime\":1513993538000,\"gradeCharge\":\"8\",\"gradeMark\":13,\"remark\":\"\",\"status\":2,\"stuCount\":566,\"uid\":\"A001_20174523094538\",\"userName\":\"黄盖\",\"yearMark\":2016},{\"classCount\":12,\"gradeCharge\":\"5\",\"gradeMark\":15,\"remark\":\"sd水电费\",\"schoolId\":1,\"status\":2,\"stuCount\":542,\"uid\":\"A001_20175425105403\",\"userName\":\"曹操\",\"yearMark\":2013},{\"classCount\":11,\"gradeCharge\":\"5\",\"gradeMark\":12,\"remark\":\"岁的\",\"schoolId\":1,\"status\":1,\"stuCount\":551,\"uid\":\"A001_20171630041609\",\"userName\":\"曹操\",\"yearMark\":2017},{\"classCount\":12,\"gradeCharge\":\"2\",\"gradeMark\":13,\"remark\":\"成立2018年\",\"schoolId\":3,\"status\":1,\"stuCount\":521,\"uid\":\"A001_20172130042102\",\"userName\":\"宋平\",\"yearMark\":2017}],\"navigateFirstPage\":1,\"navigateLastPage\":2,\"navigatePages\":8,\"navigatepageNums\":[1,2],\"nextPage\":2,\"pageNum\":1,\"pageSize\":10,\"pages\":2,\"prePage\":0,\"size\":10,\"startRow\":1,\"total\":11},\"message\":\"success\"}', '2018-01-21 19:38:30');
INSERT INTO `api_response` VALUES (152539483881865216, 151829793627701248, '{\"name\":[\"\"],\"pageNum\":[\"1\"],\"pageSize\":[\"10\"],\"yearMark\":[\"\"]}', NULL, '{\"code\":1,\"data\":{\"endRow\":5,\"firstPage\":1,\"hasNextPage\":false,\"hasPreviousPage\":false,\"isFirstPage\":true,\"isLastPage\":true,\"lastPage\":1,\"list\":[{\"classId\":\"A001_20171421101439\",\"classNum\":12,\"createTime\":1503486444000,\"gradeId\":\"2\",\"gradeMark\":12,\"instructor\":\"A001_20180006070032\",\"instructorName\":\"杜甫\",\"schoolId\":1,\"subjectId\":3,\"uid\":\"1\",\"yearMark\":2017},{\"classId\":\"A001_20170518100528\",\"classNum\":11,\"gradeId\":\"\",\"gradeMark\":11,\"instructor\":\"1\",\"instructorName\":\"李白\",\"subjectId\":1,\"uid\":\"A001_20174124104125\",\"yearMark\":2018},{\"classId\":\"A001_20170518100528\",\"classNum\":11,\"gradeId\":\"\",\"gradeMark\":11,\"instructor\":\"1\",\"instructorName\":\"李白\",\"subjectId\":9,\"uid\":\"A001_20174524104550\",\"yearMark\":2018},{\"classId\":\"A001_20170518100528\",\"classNum\":11,\"gradeId\":\"\",\"gradeMark\":11,\"instructor\":\"A001_20181704051715\",\"instructorName\":\"嬴政\",\"subjectId\":4,\"uid\":\"A001_20175822105849\",\"yearMark\":2018},{\"classId\":\"A001_20185205125231\",\"classNum\":1,\"gradeId\":\"\",\"gradeMark\":11,\"instructor\":\"1\",\"instructorName\":\"李白\",\"subjectId\":3,\"uid\":\"A001_20182518092506\",\"yearMark\":2018},{\"classId\":\"A001_20171421101439\",\"classNum\":12,\"gradeId\":\"\",\"gradeMark\":11,\"instructor\":\"A001_20181109041118\",\"instructorName\":\"何森\",\"subjectId\":4,\"uid\":\"A001_20184409044421\",\"yearMark\":2018}],\"navigateFirstPage\":1,\"navigateLastPage\":1,\"navigatePages\":8,\"navigatepageNums\":[1],\"nextPage\":0,\"pageNum\":1,\"pageSize\":6,\"pages\":1,\"prePage\":0,\"size\":6,\"startRow\":0,\"total\":6},\"message\":\"success\"}', '2018-01-21 19:38:33');
COMMIT;

-- ----------------------------
-- Table structure for api_response_field
-- ----------------------------
DROP TABLE IF EXISTS `api_response_field`;
CREATE TABLE `api_response_field` (
  `uid` bigint(20) NOT NULL COMMENT '主键',
  `api_request_id` bigint(20) NOT NULL COMMENT '请求ID',
  `uname` varchar(64) DEFAULT NULL COMMENT '名称',
  `field_type` int(2) DEFAULT NULL COMMENT '字段类型',
  `field_key` varchar(64) NOT NULL COMMENT '字段key',
  `field_value` varchar(5000) DEFAULT NULL COMMENT '字段值',
  `field_default` varchar(64) DEFAULT NULL COMMENT '字段默认值',
  `parent_key` varchar(64) NOT NULL COMMENT '上级key',
  `is_bottom` int(2) DEFAULT NULL COMMENT '是否是底层',
  `field_grade` int(2) DEFAULT NULL COMMENT '结果层级',
  PRIMARY KEY (`api_request_id`,`field_key`,`parent_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_response_field
-- ----------------------------
BEGIN;
INSERT INTO `api_response_field` VALUES (152539471269593105, 151727030465986560, NULL, 2, 'classCount', '33', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539471269593088, 151727030465986560, '结果吗', 2, 'code', '1', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152539471269593106, 151727030465986560, NULL, 5, 'createTime', '1513862041000', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539471269593097, 151727030465986560, NULL, 0, 'createUserId', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539471269593096, 151727030465986560, NULL, 2, 'endRow', '10', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593117, 151727030465986560, NULL, 2, 'firstPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593099, 151727030465986560, NULL, 1, 'gradeCharge', '8', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539471269593100, 151727030465986560, NULL, 2, 'gradeMark', '11', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539471269593093, 151727030465986560, NULL, 6, 'hasNextPage', 'true', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593119, 151727030465986560, NULL, 6, 'hasPreviousPage', 'false', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593121, 151727030465986560, NULL, 6, 'isFirstPage', 'true', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593118, 151727030465986560, NULL, 6, 'isLastPage', 'false', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593091, 151727030465986560, NULL, 2, 'lastPage', '2', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593122, 151727030465986560, NULL, 1, 'message', 'success', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152539471269593114, 151727030465986560, NULL, 2, 'navigateFirstPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593120, 151727030465986560, NULL, 2, 'navigateLastPage', '2', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593090, 151727030465986560, NULL, 2, 'navigatepageNums', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593112, 151727030465986560, NULL, 2, 'navigatePages', '8', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593094, 151727030465986560, NULL, 2, 'nextPage', '2', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593111, 151727030465986560, NULL, 2, 'pageNum', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593115, 151727030465986560, NULL, 2, 'pages', '2', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593095, 151727030465986560, NULL, 2, 'pageSize', '10', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593092, 151727030465986560, NULL, 2, 'prePage', '0', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593101, 151727030465986560, NULL, 1, 'remark', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539471269593107, 151727030465986560, NULL, 0, 'schoolId', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539471269593116, 151727030465986560, NULL, 2, 'size', '10', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593089, 151727030465986560, NULL, 2, 'startRow', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593110, 151727030465986560, NULL, 2, 'status', '2', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539471269593109, 151727030465986560, NULL, 2, 'stuCount', '2333', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539471269593113, 151727030465986560, NULL, 2, 'total', '11', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539471269593104, 151727030465986560, NULL, 1, 'uid', 'A001_20171421091400', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539471269593102, 151727030465986560, NULL, 0, 'updateTime', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539471269593098, 151727030465986560, NULL, 0, 'updateUserId', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539471269593103, 151727030465986560, NULL, 1, 'userName', '黄盖', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539471269593108, 151727030465986560, NULL, 2, 'yearMark', '2018', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386200, 151751255750868992, NULL, 1, 'classChargeName', '宋平', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386195, 151751255750868992, NULL, 1, 'classId', 'A001_20173909103941', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386185, 151751255750868992, NULL, 1, 'classLastId', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386190, 151751255750868992, NULL, 1, 'classNum', '12', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386197, 151751255750868992, NULL, 0, 'classRecordVo', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459194191872, 151751255750868992, NULL, 2, 'code', '1', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152539459198386183, 151751255750868992, NULL, 2, 'endRow', '10', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386209, 151751255750868992, NULL, 2, 'firstPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386184, 151751255750868992, NULL, 1, 'gradeId', 'A001_20172321082316', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386188, 151751255750868992, NULL, 2, 'gradeMark', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386186, 151751255750868992, NULL, 0, 'gradeRecordVo', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386180, 151751255750868992, NULL, 6, 'hasNextPage', 'false', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386211, 151751255750868992, NULL, 6, 'hasPreviousPage', 'false', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386213, 151751255750868992, NULL, 6, 'isFirstPage', 'true', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386210, 151751255750868992, NULL, 6, 'isLastPage', 'true', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386178, 151751255750868992, NULL, 2, 'lastPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386214, 151751255750868992, NULL, 1, 'message', 'success', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152539459198386206, 151751255750868992, NULL, 2, 'navigateFirstPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386212, 151751255750868992, NULL, 2, 'navigateLastPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386177, 151751255750868992, NULL, 2, 'navigatepageNums', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386204, 151751255750868992, NULL, 2, 'navigatePages', '8', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386181, 151751255750868992, NULL, 2, 'nextPage', '0', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386203, 151751255750868992, NULL, 2, 'pageNum', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386207, 151751255750868992, NULL, 2, 'pages', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386182, 151751255750868992, NULL, 2, 'pageSize', '10', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386179, 151751255750868992, NULL, 2, 'prePage', '0', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386189, 151751255750868992, NULL, 1, 'remark', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386199, 151751255750868992, NULL, 2, 'schoolId', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386187, 151751255750868992, NULL, 2, 'schoolLastId', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386191, 151751255750868992, NULL, 0, 'simsUserVo', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386208, 151751255750868992, NULL, 2, 'size', '10', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386176, 151751255750868992, NULL, 2, 'startRow', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386202, 151751255750868992, NULL, 2, 'status', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386193, 151751255750868992, NULL, 0, 'studentId', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386198, 151751255750868992, NULL, 1, 'studentName', '李白', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386196, 151751255750868992, NULL, 1, 'teacherId', '2', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386205, 151751255750868992, NULL, 2, 'total', '10', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539459198386194, 151751255750868992, NULL, 1, 'uid', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386192, 151751255750868992, NULL, 1, 'userId', 'A001_20174416104405', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539459198386201, 151751255750868992, NULL, 2, 'yearMark', '2017', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539483890253828, 151829793627701248, NULL, 1, 'classId', 'A001_20171421101439', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539483890253833, 151829793627701248, NULL, 2, 'classNum', '12', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539483886059520, 151829793627701248, NULL, 2, 'code', '1', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152539483890253830, 151829793627701248, NULL, 5, 'createTime', '1503486444000', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539483886059528, 151829793627701248, NULL, 2, 'endRow', '5', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483890253842, 151829793627701248, NULL, 2, 'firstPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483890253827, 151829793627701248, NULL, 1, 'gradeId', '2', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539483890253832, 151829793627701248, NULL, 2, 'gradeMark', '12', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539483890253824, 151829793627701248, NULL, 0, 'gradeName', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539483886059525, 151829793627701248, NULL, 6, 'hasNextPage', 'false', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483890253844, 151829793627701248, NULL, 6, 'hasPreviousPage', 'false', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483890253829, 151829793627701248, NULL, 1, 'instructor', 'A001_20180006070032', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539483890253826, 151829793627701248, NULL, 1, 'instructorName', '杜甫', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539483890253846, 151829793627701248, NULL, 6, 'isFirstPage', 'true', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483890253843, 151829793627701248, NULL, 6, 'isLastPage', 'true', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483886059523, 151829793627701248, NULL, 2, 'lastPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483890253847, 151829793627701248, NULL, 1, 'message', 'success', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152539483890253839, 151829793627701248, NULL, 2, 'navigateFirstPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483890253845, 151829793627701248, NULL, 2, 'navigateLastPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483886059522, 151829793627701248, NULL, 2, 'navigatepageNums', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483890253837, 151829793627701248, NULL, 2, 'navigatePages', '8', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483886059526, 151829793627701248, NULL, 2, 'nextPage', '0', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483890253836, 151829793627701248, NULL, 2, 'pageNum', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483890253840, 151829793627701248, NULL, 2, 'pages', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483886059527, 151829793627701248, NULL, 2, 'pageSize', '6', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483886059524, 151829793627701248, NULL, 2, 'prePage', '0', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483890253831, 151829793627701248, NULL, 2, 'schoolId', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539483890253841, 151829793627701248, NULL, 2, 'size', '6', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483886059521, 151829793627701248, NULL, 2, 'startRow', '0', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483890253834, 151829793627701248, NULL, 2, 'subjectId', '3', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539483890253838, 151829793627701248, NULL, 2, 'total', '6', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152539483890253825, 151829793627701248, NULL, 1, 'uid', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152539483890253835, 151829793627701248, NULL, 2, 'yearMark', '2017', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152488377248120832, 151829913173753856, NULL, 2, 'code', '1', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152488377248120844, 151829913173753856, NULL, 1, 'courseFile', 'upload/courseWare/2018/0_17/22/20180116225405.xlsx', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152488377248120855, 151829913173753856, NULL, 1, 'courseId', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152488377248120843, 151829913173753856, NULL, 1, 'coverImg', 'http://localhost:18082/sims/upload/courseWare/2018/0_17/20/20180116205800.png', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152488377248120850, 151829913173753856, NULL, 0, 'createTime', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152488377248120842, 151829913173753856, NULL, 0, 'createUserId', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152488377248120840, 151829913173753856, NULL, 2, 'endRow', '4', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120862, 151829913173753856, NULL, 2, 'firstPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120845, 151829913173753856, NULL, 2, 'gradeMark', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152488377248120841, 151829913173753856, NULL, 1, 'gradeRecordId', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152488377248120837, 151829913173753856, NULL, 6, 'hasNextPage', 'false', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120864, 151829913173753856, NULL, 6, 'hasPreviousPage', 'false', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120853, 151829913173753856, NULL, 1, 'intro', '简单xls测试', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152488377248120866, 151829913173753856, NULL, 6, 'isFirstPage', 'true', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120863, 151829913173753856, NULL, 6, 'isLastPage', 'true', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120835, 151829913173753856, NULL, 2, 'lastPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120867, 151829913173753856, NULL, 1, 'message', 'success', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152488377248120859, 151829913173753856, NULL, 2, 'navigateFirstPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120865, 151829913173753856, NULL, 2, 'navigateLastPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120834, 151829913173753856, NULL, 2, 'navigatepageNums', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120857, 151829913173753856, NULL, 2, 'navigatePages', '8', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120838, 151829913173753856, NULL, 2, 'nextPage', '0', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120856, 151829913173753856, NULL, 2, 'pageNum', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120860, 151829913173753856, NULL, 2, 'pages', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120839, 151829913173753856, NULL, 2, 'pageSize', '10', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120836, 151829913173753856, NULL, 2, 'prePage', '0', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120854, 151829913173753856, NULL, 1, 'schoolId', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152488377248120849, 151829913173753856, NULL, 2, 'simsCourseId', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152488377248120852, 151829913173753856, NULL, 1, 'simsGradeRecordId', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152488377248120851, 151829913173753856, NULL, 1, 'simsTeacherRecordId', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152488377248120861, 151829913173753856, NULL, 2, 'size', '4', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120833, 151829913173753856, NULL, 2, 'startRow', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120846, 151829913173753856, NULL, 1, 'title', '测试文档1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152488377248120858, 151829913173753856, NULL, 2, 'total', '4', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488377248120848, 151829913173753856, NULL, 1, 'uid', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152488377248120847, 151829913173753856, NULL, 0, 'userId', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152460618920624136, 152040097242415104, NULL, 2, 'classCount', '33', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152460618916429827, 152040097242415104, NULL, 2, 'code', '1', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152460618920624137, 152040097242415104, NULL, 5, 'createTime', '1513862041000', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152460618920624128, 152040097242415104, NULL, 0, 'createUserId', 'null', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152460618920624130, 152040097242415104, NULL, 1, 'gradeCharge', '8', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152460618920624131, 152040097242415104, NULL, 2, 'gradeMark', '11', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152460618920624142, 152040097242415104, NULL, 1, 'message', 'success', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152460618920624132, 152040097242415104, NULL, 1, 'remark', '', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152460618920624138, 152040097242415104, NULL, 0, 'schoolId', 'null', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152460618920624141, 152040097242415104, NULL, 2, 'status', '2', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152460618920624140, 152040097242415104, NULL, 2, 'stuCount', '2333', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152460618920624135, 152040097242415104, NULL, 1, 'uid', 'A001_20171421091400', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152460618920624133, 152040097242415104, NULL, 0, 'updateTime', 'null', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152460618920624129, 152040097242415104, NULL, 0, 'updateUserId', 'null', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152460618920624134, 152040097242415104, NULL, 1, 'userName', '黄盖', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152460618920624139, 152040097242415104, NULL, 2, 'yearMark', '2018', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152054764614451200, 152054723745153024, NULL, 2, 'code', '1', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152054764614451201, 152054723745153024, NULL, 0, 'data', 'null', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152054764614451202, 152054723745153024, NULL, 0, 'message', 'null', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152488407732322304, 152067919604350976, NULL, 2, 'code', '1', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152488407732322308, 152067919604350976, NULL, 1, 'courseFile', 'upload/courseWare/2018/0_17/22/20180116225405.xlsx', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488407732322319, 152067919604350976, NULL, 1, 'courseId', '', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488407732322307, 152067919604350976, NULL, 1, 'coverImg', 'http://localhost:18082/sims/upload/courseWare/2018/0_17/20/20180116205800.png', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488407732322314, 152067919604350976, NULL, 0, 'createTime', 'null', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488407732322306, 152067919604350976, NULL, 0, 'createUserId', 'null', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488407732322309, 152067919604350976, NULL, 2, 'gradeMark', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488407732322305, 152067919604350976, NULL, 1, 'gradeRecordId', '', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488407732322317, 152067919604350976, NULL, 1, 'intro', '简单xls测试', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488407732322320, 152067919604350976, NULL, 1, 'message', 'success', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152488407732322318, 152067919604350976, NULL, 1, 'schoolId', '', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488407732322313, 152067919604350976, NULL, 2, 'simsCourseId', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488407732322316, 152067919604350976, NULL, 1, 'simsGradeRecordId', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488407732322315, 152067919604350976, NULL, 1, 'simsTeacherRecordId', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488407732322310, 152067919604350976, NULL, 1, 'title', '测试文档1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488407732322312, 152067919604350976, NULL, 1, 'uid', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152488407732322311, 152067919604350976, NULL, 0, 'userId', 'null', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025433, 152200528607051776, NULL, 1, 'address', '闫李村1组', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025445, 152200528607051776, NULL, 2, 'age', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025435, 152200528607051776, NULL, 5, 'birth', '1494000000000', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025420, 152200528607051776, NULL, 0, 'cityId', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025427, 152200528607051776, NULL, 1, 'cityName', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025425, 152200528607051776, NULL, 1, 'classId', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025408, 152200528607051776, NULL, 2, 'code', '1', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152210061979025422, 152200528607051776, NULL, 0, 'countryId', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025442, 152200528607051776, NULL, 1, 'countryName', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025430, 152200528607051776, NULL, 1, 'email', '935323727@qq.com', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025440, 152200528607051776, NULL, 1, 'emailBack', '798904883@qq.com', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025416, 152200528607051776, NULL, 2, 'endRow', '10', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025452, 152200528607051776, NULL, 2, 'firstPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025418, 152200528607051776, NULL, 2, 'gender', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025431, 152200528607051776, NULL, 1, 'gradeId', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025413, 152200528607051776, NULL, 6, 'hasNextPage', 'true', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025454, 152200528607051776, NULL, 6, 'hasPreviousPage', 'false', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025424, 152200528607051776, NULL, 1, 'headicon', 'http://localhost:18082/upload/headIcon/2017/8_17/22/20170916225558.png', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025456, 152200528607051776, NULL, 6, 'isFirstPage', 'true', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025453, 152200528607051776, NULL, 6, 'isLastPage', 'false', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025411, 152200528607051776, NULL, 2, 'lastPage', '3', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025457, 152200528607051776, NULL, 1, 'message', 'success', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152210061979025434, 152200528607051776, NULL, 1, 'mobileBack', '13262656637', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025439, 152200528607051776, NULL, 1, 'mobileNum', '13262656637', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025449, 152200528607051776, NULL, 2, 'navigateFirstPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025455, 152200528607051776, NULL, 2, 'navigateLastPage', '3', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025410, 152200528607051776, NULL, 2, 'navigatepageNums', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025447, 152200528607051776, NULL, 2, 'navigatePages', '8', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025414, 152200528607051776, NULL, 2, 'nextPage', '2', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025429, 152200528607051776, NULL, 1, 'nickname', '李白', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025446, 152200528607051776, NULL, 2, 'pageNum', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025450, 152200528607051776, NULL, 2, 'pages', '3', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025415, 152200528607051776, NULL, 2, 'pageSize', '10', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025412, 152200528607051776, NULL, 2, 'prePage', '0', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025438, 152200528607051776, NULL, 0, 'provinceId', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025443, 152200528607051776, NULL, 1, 'provinceName', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025417, 152200528607051776, NULL, 0, 'pwdSalt', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025436, 152200528607051776, NULL, 1, 'qqNum', '935323727', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025444, 152200528607051776, NULL, 1, 'realHeadicon', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025428, 152200528607051776, NULL, 1, 'schoolId', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025451, 152200528607051776, NULL, 2, 'size', '10', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025409, 152200528607051776, NULL, 2, 'startRow', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025448, 152200528607051776, NULL, 2, 'total', '23', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152210061979025421, 152200528607051776, NULL, 0, 'townId', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025432, 152200528607051776, NULL, 1, 'townName', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025423, 152200528607051776, NULL, 1, 'uid', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025426, 152200528607051776, NULL, 2, 'userLevel', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025437, 152200528607051776, NULL, 1, 'userName', '李白', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025419, 152200528607051776, NULL, 0, 'userPwd', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152210061979025441, 152200528607051776, NULL, 1, 'userType', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425945, 152211003067596800, NULL, 1, 'address', '闫李村1组', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425957, 152211003067596800, NULL, 2, 'age', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425947, 152211003067596800, NULL, 5, 'birth', '1494000000000', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425932, 152211003067596800, NULL, 0, 'cityId', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425939, 152211003067596800, NULL, 1, 'cityName', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425937, 152211003067596800, NULL, 1, 'classId', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425920, 152211003067596800, NULL, 2, 'code', '1', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152215000889425934, 152211003067596800, NULL, 0, 'countryId', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425954, 152211003067596800, NULL, 1, 'countryName', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425942, 152211003067596800, NULL, 1, 'email', '935323727@qq.com', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425952, 152211003067596800, NULL, 1, 'emailBack', '798904883@qq.com', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425928, 152211003067596800, NULL, 2, 'endRow', '10', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425964, 152211003067596800, NULL, 2, 'firstPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425930, 152211003067596800, NULL, 2, 'gender', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425943, 152211003067596800, NULL, 1, 'gradeId', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425925, 152211003067596800, NULL, 6, 'hasNextPage', 'true', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425966, 152211003067596800, NULL, 6, 'hasPreviousPage', 'false', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425936, 152211003067596800, NULL, 1, 'headicon', 'http://localhost:18082/upload/headIcon/2017/8_17/22/20170916225558.png', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425968, 152211003067596800, NULL, 6, 'isFirstPage', 'true', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425965, 152211003067596800, NULL, 6, 'isLastPage', 'false', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425923, 152211003067596800, NULL, 2, 'lastPage', '3', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425969, 152211003067596800, NULL, 1, 'message', 'success', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152215000889425946, 152211003067596800, NULL, 1, 'mobileBack', '13262656637', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425951, 152211003067596800, NULL, 1, 'mobileNum', '13262656637', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425961, 152211003067596800, NULL, 2, 'navigateFirstPage', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425967, 152211003067596800, NULL, 2, 'navigateLastPage', '3', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425922, 152211003067596800, NULL, 2, 'navigatepageNums', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425959, 152211003067596800, NULL, 2, 'navigatePages', '8', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425926, 152211003067596800, NULL, 2, 'nextPage', '2', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425941, 152211003067596800, NULL, 1, 'nickname', '李白', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425958, 152211003067596800, NULL, 2, 'pageNum', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425962, 152211003067596800, NULL, 2, 'pages', '3', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425927, 152211003067596800, NULL, 2, 'pageSize', '10', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425924, 152211003067596800, NULL, 2, 'prePage', '0', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425950, 152211003067596800, NULL, 0, 'provinceId', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425955, 152211003067596800, NULL, 1, 'provinceName', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425929, 152211003067596800, NULL, 0, 'pwdSalt', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425948, 152211003067596800, NULL, 1, 'qqNum', '935323727', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425956, 152211003067596800, NULL, 1, 'realHeadicon', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425940, 152211003067596800, NULL, 1, 'schoolId', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425963, 152211003067596800, NULL, 2, 'size', '10', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425921, 152211003067596800, NULL, 2, 'startRow', '1', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425960, 152211003067596800, NULL, 2, 'total', '23', NULL, 'data', 1, 2);
INSERT INTO `api_response_field` VALUES (152215000889425933, 152211003067596800, NULL, 0, 'townId', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425944, 152211003067596800, NULL, 1, 'townName', '', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425935, 152211003067596800, NULL, 1, 'uid', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425938, 152211003067596800, NULL, 2, 'userLevel', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425949, 152211003067596800, NULL, 1, 'userName', '李白', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425931, 152211003067596800, NULL, 0, 'userPwd', 'null', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152215000889425953, 152211003067596800, NULL, 1, 'userType', '1', NULL, 'list', 1, 3);
INSERT INTO `api_response_field` VALUES (152434676898725888, 152434525702455296, NULL, 2, 'code', '1', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152434676898725889, 152434525702455296, NULL, 0, 'data', 'null', NULL, 'root', 1, 1);
INSERT INTO `api_response_field` VALUES (152434676898725890, 152434525702455296, NULL, 0, 'message', 'null', NULL, 'root', 1, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
