/*
Navicat MySQL Data Transfer

Source Server         : mytable
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : tbps

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2018-09-23 13:00:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `agentcomp`
-- ----------------------------
DROP TABLE IF EXISTS `agentcomp`;
CREATE TABLE `agentcomp` (
  `ANGENT_COMP_NO` varchar(4) NOT NULL COMMENT '委托公司代码',
  `ANGENT_COMP_NAME` varchar(40) DEFAULT NULL COMMENT '委托公司名称',
  `MEMO1` varchar(100) DEFAULT NULL COMMENT '备考',
  `DELETE_FLG` varchar(1) DEFAULT NULL COMMENT '删除',
  `UPDATE_USER` varchar(6) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新建日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  `CO_MANAGER1` varchar(6) DEFAULT NULL COMMENT '联系人1',
  `CO_MANAGER_TEL1` varchar(30) DEFAULT NULL COMMENT '联系人1电话',
  `CO_ADDRESS1` varchar(80) DEFAULT NULL COMMENT '联系人1地址',
  `CO_MAIL1` varchar(60) DEFAULT NULL COMMENT '联系人1邮箱',
  `CO_MANAGER2` varchar(6) DEFAULT NULL COMMENT '联系人2',
  `CO_MANAGER_TEL2` varchar(30) DEFAULT NULL COMMENT '联系人2电话',
  `CO_ADDRESS2` varchar(80) DEFAULT NULL COMMENT '联系人2地址',
  `CO_MAIL2` varchar(60) DEFAULT NULL COMMENT '联系人2邮箱',
  `CO_MANAGER3` varchar(6) DEFAULT NULL COMMENT '联系人3',
  `CO_MANAGER_TEL3` varchar(30) DEFAULT NULL COMMENT '联系人3电话',
  `CO_ADDRESS3` varchar(80) DEFAULT NULL COMMENT '联系人3地址',
  `CO_MAIL3` varchar(60) DEFAULT NULL COMMENT '联系人3邮箱',
  `CO_MANAGER4` varchar(6) DEFAULT NULL COMMENT '联系人4',
  `CO_MANAGER_TEL4` varchar(30) DEFAULT NULL COMMENT '联系人4电话',
  `CO_ADDRESS4` varchar(80) DEFAULT NULL COMMENT '联系人4地址',
  `CO_MAIL4` varchar(60) DEFAULT NULL COMMENT '联系人4邮箱',
  `CO_MANAGER5` varchar(6) DEFAULT NULL COMMENT '联系人5',
  `CO_MANAGER_TEL5` varchar(30) DEFAULT NULL COMMENT '联系人5电话',
  `CO_ADDRESS5` varchar(80) DEFAULT NULL COMMENT '联系人5地址',
  `CO_MAIL5` varchar(60) DEFAULT NULL COMMENT '联系人5邮箱',
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(20) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) DEFAULT NULL COMMENT '备用5',
  `TAX_NO` varchar(20) DEFAULT NULL COMMENT '开票信息',
  PRIMARY KEY (`ANGENT_COMP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agentcomp
-- ----------------------------
INSERT INTO `agentcomp` VALUES ('J01', '上海XXX招标信息有限公司', '招标信息', '1', 'admin', '2013-10-16 00:00:00', '2013-10-16 00:00:00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('J02', '公司02', '测试公司02', '1', 'admin', '2013-10-17 22:16:17', '2013-10-20 12:17:31', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('J05', '公司05', '公司05', '1', 'admin', '2013-10-17 22:25:17', '2013-10-17 22:25:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('J06', '公司06', '公司06', '1', 'admin', '2013-10-17 22:25:25', '2013-10-17 22:25:25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('J099', '特色10011', '', '1', 'admin', '2013-12-11 21:45:54', '2015-01-21 23:06:17', 'lxr1', 'lxr1dh', 'lxr1dz', 'lxr1yx@aa.cc', 'lxr2', 'lxr2dh', 'lxr2dz', 'lxr2yx@aa.cc', '33', '333', '3333', 'lxr3yx@aa.cc', '44', '444', '4444', 'lxr4yx@aa.cc', '55', '555', '5555', 'lxr5yx@aa.cc', null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('J22', '公司22', '公司15', '1', 'admin', '2013-11-09 21:55:44', '2013-11-09 21:55:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('J23', '公司23', '公司15', '1', 'admin', '2013-11-09 21:55:44', '2013-11-09 21:55:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('J24', '公司24', '公司15', '1', 'admin', '2013-11-09 21:55:44', '2013-11-09 21:55:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('J25', '公司25', '公司15', '1', 'admin', '2013-11-09 21:55:44', '2013-11-09 21:55:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('J26', '公司26', '公司15', '1', 'admin', '2013-11-09 21:55:44', '2013-11-09 21:55:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('J27', '公司27', '公司15', '1', 'admin', '2013-11-09 21:55:44', '2013-11-09 21:55:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('J910', 'ceshi99', '', '1', 'admin', '2014-01-20 22:29:27', '2014-01-20 22:29:27', '11', '22', '44', '33@33.aa', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Jaa', 'bb', '', '0', 'admin', '2014-02-16 19:52:22', '2014-02-16 20:06:00', '11', '22', '44', '33@aa.cc', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Jaaa', 'bbbbbbbb', '', '1', 'admin', '2014-02-23 00:50:46', '2014-02-23 00:50:46', 'cccc', '432413214', 'fdasfdsa', 'aaaa@bb.cc', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('jajj', 'fdsafdsaf', '', '1', 'admin', '2014-03-20 22:49:23', '2014-04-05 20:13:54', '张庄庄张庄庄', '13232323233', 'fda', 'aaaaa@bbb.cc', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Jccc', 'a1212121', '', '1', 'admin', '2014-02-23 00:53:17', '2014-02-23 02:47:37', 'xbaaa', 'fdafdsa', 'fdafdsaf', 'aaa33@bb.cc', '', '', '', '11d@22.cc', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Jddd', 'ccsssssssssssssss', '', '1', 'admin', '2014-02-23 01:21:30', '2014-02-23 01:21:30', '1111xm', '1111111111111dh', '1111dz', '1111@111.cca', '', '', '', '', '', '', '', '333@333.cc', '', '', '', '', '', '', '', '55@55.cc', null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Jewe', 'afafsdaf', '', '1', 'admin', '2014-02-23 02:48:26', '2014-02-23 02:48:47', 'fdsa', 'f21212121', 'fdsafdsa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Y000', 'aa', 'fda', '1', 'admin', '2014-01-16 22:19:02', '2014-01-22 00:11:31', '11', '22', '33', '1111@aa.cc', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Y010', 'tes', '', '1', 'admin', '2014-01-16 22:27:57', '2014-01-20 22:28:41', '1', '2', '3', '11@qq.cc', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Y03', '公司03', '测试03', '1', 'admin', '2013-10-17 22:24:57', '2013-10-17 22:24:57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Y04', '公司04', '公司04', '1', 'admin', '2013-10-17 22:25:08', '2013-10-17 22:25:08', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Y07', '公司07', '公司07', '1', 'admin', '2013-10-17 22:25:33', '2013-10-17 22:25:33', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Y08', '公司08', '公司08', '1', 'admin', '2013-10-17 22:25:40', '2013-10-17 22:25:40', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Y09', '公司09', '公司09', '1', 'admin', '2013-10-17 22:25:48', '2013-10-17 22:25:48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Y10', '公司10', '公司10', '1', 'admin', '2013-10-17 22:25:57', '2013-11-09 22:05:39', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Y11', '公司11', '公司11', '1', 'admin', '2013-10-17 22:26:03', '2013-10-17 22:26:03', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Y12', '公司12', '公司12', '1', 'admin', '2013-10-17 22:26:11', '2013-10-17 22:26:11', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Y13', '公司13', '公司13', '1', 'admin', '2013-10-17 22:36:45', '2013-10-18 21:57:56', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Y14', '公司144', '公司144', '1', 'admin', '2013-10-17 23:55:21', '2013-10-18 21:56:02', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Y15', '公司15', '公司15', '1', 'admin', '2013-10-20 23:13:19', '2013-10-20 23:13:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `agentcomp` VALUES ('Y21', 'aaa3a公司', '3311', '1', 'admin', '2013-11-09 21:55:44', '2016-04-15 21:58:01', '212', '13322222211', '1212212', 'aa@bb.cc', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `audit`
-- ----------------------------
DROP TABLE IF EXISTS `audit`;
CREATE TABLE `audit` (
  `AUDIT_NO` varchar(8) NOT NULL DEFAULT '' COMMENT '审价编号YYYY-NNN  自动采番',
  `CNTRCT_NO` varchar(16) DEFAULT NULL,
  `CNTRCT_NM` varchar(100) DEFAULT NULL,
  `REPORT_NO` varchar(16) DEFAULT NULL COMMENT '报告文号',
  `PROJECT_MANAGER` varchar(6) DEFAULT NULL COMMENT '工程师',
  `PROJECT_NAME` varchar(80) DEFAULT NULL COMMENT '项目名称',
  `PROJECT_TYPE` varchar(1) DEFAULT NULL COMMENT '项目性质1:土建,2:安装,3:房修,4:园林,5:咨询,6：限价，7:其他',
  `PROJECT_STATUS` varchar(1) DEFAULT NULL COMMENT '项目进度1：在审，2：补交资料，3：初稿已出，4：审定单已出，',
  `AGENT_NO` varchar(4) DEFAULT NULL COMMENT '委托公司代码',
  `AGENT_CO_NAME` varchar(40) DEFAULT NULL COMMENT '委托公司名称',
  `AGENT_CO_MANAGER` varchar(6) DEFAULT NULL COMMENT '委托公司负责人',
  `AGENT_CO_MANAGER_TEL` varchar(30) DEFAULT NULL COMMENT '委托公司负责人电话',
  `AGENT_CO_STAFF` varchar(6) DEFAULT NULL COMMENT '委托公司项目负责人',
  `AGENT_CO_STAFF_TEL` varchar(30) DEFAULT NULL COMMENT '委托公司项目负责人电话',
  `AGENT_CO_POST_ADDRESS` varchar(80) DEFAULT NULL COMMENT '委托公司快递地址',
  `AGENT_CO_MAIL` varchar(60) DEFAULT NULL COMMENT '委托公负责人司邮箱',
  `PROF_NO` varchar(4) DEFAULT NULL COMMENT '专业公司代码',
  `PROF_CO_NAME` varchar(40) DEFAULT NULL COMMENT '专业公司名称',
  `PROF_CO_MANAGER` varchar(6) DEFAULT NULL COMMENT '专业公司负责人',
  `PROF_CO_MANAGER_TEL` varchar(30) DEFAULT NULL COMMENT '专业公司负责人电话',
  `PROF_CO_STAFF` varchar(6) DEFAULT NULL COMMENT '专业公司项目负责人',
  `PROF_CO_STAFF_TEL` varchar(30) DEFAULT NULL COMMENT '专业公司项目负责人电话',
  `PROF_CO_POST_ADDRESS` varchar(80) DEFAULT NULL COMMENT '专业公司地址',
  `PROF_CO_MAIL` varchar(60) DEFAULT NULL COMMENT '专业公司邮箱',
  `CONTRACT_CO_NO` varchar(4) DEFAULT NULL COMMENT '承包公司代码',
  `CONTRACT_CO_NAME` varchar(40) DEFAULT NULL COMMENT '承包公司名称',
  `CONTRACT_CO_MANAGER` varchar(6) DEFAULT NULL COMMENT '承包公司负责人',
  `CONTRACT_CO_MANAGER_TEL` varchar(30) DEFAULT NULL COMMENT '承包公司负责人电话',
  `CONTRACT_CO_STAFF` varchar(6) DEFAULT NULL COMMENT '承包公司项目负责人',
  `CONTRACT_CO_STAFF_TEL` varchar(30) DEFAULT NULL COMMENT '承包公司项目负责人电话',
  `CONTRACT_CO_POST_ADDRESS` varchar(80) DEFAULT NULL COMMENT '承包公司快递地址',
  `CONTRACT_CO_MAIL` varchar(60) DEFAULT NULL COMMENT '承包公司负责人邮箱',
  `DOC_REC_DATE` datetime DEFAULT NULL COMMENT '资料收到日期',
  `PROGRESS_STATUS` varchar(2) DEFAULT NULL COMMENT '实施情况',
  `PRE_SET` varchar(2) DEFAULT NULL,
  `PRE_PRICE` decimal(14,2) DEFAULT NULL COMMENT '预算金额',
  `SUPPORT_DOC_DATE` datetime DEFAULT NULL COMMENT '补充资料日期',
  `DRAFT_DATE` datetime DEFAULT NULL COMMENT '初稿日期',
  `APPROVAL_SND_DATE` datetime DEFAULT NULL COMMENT '审定单发出日期',
  `APPROVAL_RCV_DATE` datetime DEFAULT NULL COMMENT '审定单收到日期',
  `DELI_NO` varchar(20) DEFAULT NULL COMMENT '快递单号',
  `REPORT_RAISE_DATE` datetime DEFAULT NULL COMMENT '报告出具日期',
  `REPORT_SEAL_DATE` datetime DEFAULT NULL COMMENT '报告敲章日期',
  `REPORT_ARR_TYPE` varchar(2) DEFAULT NULL COMMENT '报告送达方式',
  `REPORT_ARR_DATE` datetime DEFAULT NULL COMMENT '报告送达日期',
  `REG_DATE` datetime DEFAULT NULL COMMENT '入档日期',
  `AGENT_INFO` varchar(200) DEFAULT NULL COMMENT '委托方专业联系人及联系方式',
  `CONTRACT_CO_ID` varchar(20) DEFAULT NULL COMMENT '承揽单位',
  `CONTRACT_CO_INFO` varchar(200) DEFAULT NULL COMMENT '承揽单位联系人及联系方式',
  `VERIFY_PER_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '送审价',
  `VERIFY_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '审核价',
  `VERIFY_INCREASE` decimal(14,2) DEFAULT NULL COMMENT '核增额',
  `VERIFY_DECREASE` decimal(14,2) DEFAULT NULL COMMENT '核减额',
  `VERIFY_DIFF` decimal(14,2) DEFAULT NULL COMMENT '净核减额',
  `VERIFY_DIFF_RATE` decimal(14,2) DEFAULT NULL COMMENT '净核减率',
  `CNT_PRICE` decimal(14,2) DEFAULT NULL COMMENT '控制价金额',
  `PROJ_PRICE` decimal(14,2) DEFAULT NULL COMMENT '立项金额',
  `LIMIT_PRICE` decimal(14,2) DEFAULT NULL COMMENT '限价金额',
  `CNTRCT_PRICE` decimal(14,2) DEFAULT NULL COMMENT '合同金额',
  `PLAN_DOC_RCV_DATE` datetime DEFAULT NULL COMMENT '资料收到时间（立项阶段）',
  `PLAN_DOC_RPT_DATE` datetime DEFAULT NULL COMMENT '立项报告时间（立项阶段）',
  `PLAN_DOC_SND_TYPE` varchar(2) DEFAULT NULL,
  `PLAN_DOC_ARR_DATE` datetime DEFAULT NULL COMMENT '报告送达日期（立项阶段）',
  `BID_DOC_RCV_DATE` datetime DEFAULT NULL COMMENT '资料收到时间（招标阶段）',
  `BID_DOC_RPT_DATE` datetime DEFAULT NULL COMMENT '限价报告时间（招标阶段）',
  `BID_DOC_SND_TYPE` varchar(2) DEFAULT NULL,
  `BID_DOC_ARR_DATE` datetime DEFAULT NULL COMMENT '报告送达日期（招标阶段）',
  `SIGN_DOC_RCV_DATE` datetime DEFAULT NULL COMMENT '资料收到时间（合同签订阶段）',
  `SIGN_DOC_RPT_DATE` datetime DEFAULT NULL COMMENT '合同审核报告时间（合同签订阶段)',
  `SIGN_DOC_SND_TYPE` varchar(2) DEFAULT NULL,
  `SIGN_DOC_ARR_DATE` datetime DEFAULT NULL COMMENT '报告送达日期（合同签订阶段)',
  `SET_DOC_RCV_DATE` datetime DEFAULT NULL COMMENT '资料收到时间（结算阶段）',
  `SET_DOC_RPT_DATE` datetime DEFAULT NULL COMMENT '结算报告出具时间（结算阶段）',
  `SET_DOC_SND_TYPE` varchar(2) DEFAULT NULL,
  `SET_DOC_ARR_DATE` datetime DEFAULT NULL COMMENT '报告送达日期（结算阶段）',
  `PROGRESS_STATUS_MEMO` varchar(200) DEFAULT NULL COMMENT '项目大致进度简述',
  `A_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '甲方收费',
  `A_STATUS` varchar(2) DEFAULT NULL COMMENT '收费状态',
  `B_TYPE` varchar(2) DEFAULT NULL COMMENT '乙方收费方式',
  `B_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '乙方收费',
  `A_INVOICE_DELI_DATE` datetime DEFAULT NULL COMMENT '甲方发票流转单日期',
  `A_INVOICE_DATE` datetime DEFAULT NULL COMMENT '甲方开票日期',
  `A_INVOICE_NO` varchar(20) DEFAULT NULL COMMENT '甲方发票号',
  `A_SET_DATE` datetime DEFAULT NULL COMMENT '甲方到账日期',
  `B_INVOICE_DELI_DATE` datetime DEFAULT NULL COMMENT '乙方发票流转单日期',
  `B_INVOICE_DATE` datetime DEFAULT NULL COMMENT '乙方开票日期',
  `B_INVOICE_NO` varchar(20) DEFAULT NULL COMMENT '乙方发票号',
  `B_SET_DATE` datetime DEFAULT NULL COMMENT '乙方到账日期',
  `B_RATE` decimal(14,2) DEFAULT NULL,
  `CNTRCT_INFO` varchar(2) DEFAULT NULL,
  `PROJECT_NAME_PASS` varchar(80) DEFAULT NULL,
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(200) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) DEFAULT NULL COMMENT '备用5',
  `RESERVE6` varchar(20) DEFAULT NULL COMMENT '备用6',
  `RESERVE7` decimal(14,2) DEFAULT NULL COMMENT '备用7',
  `RESERVE8` decimal(14,2) DEFAULT NULL COMMENT '备用8',
  `RESERVE9` datetime DEFAULT NULL COMMENT '备用9',
  `RESERVE10` datetime DEFAULT NULL COMMENT '备用10',
  `LATEST_FLG` varchar(1) DEFAULT NULL COMMENT '最新化',
  `DELETE_FLG` varchar(1) DEFAULT NULL COMMENT '删除',
  `UPDATE_USER` varchar(6) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新增日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`AUDIT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of audit
-- ----------------------------
INSERT INTO `audit` VALUES ('18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '6789.00', '5436.00', '234.00', '1587.00', '1353.00', '0.20', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '54.99', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:33:56', '2018-09-23 10:33:56');
INSERT INTO `audit` VALUES ('18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '1', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:34:53', '2018-09-23 10:34:53');
INSERT INTO `audit` VALUES ('18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '20.00', '0.00', '0.00', '20.00', '20.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:58:55', '2018-09-23 10:58:55');
INSERT INTO `audit` VALUES ('18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:00:19', '2018-09-23 11:00:19');
INSERT INTO `audit` VALUES ('18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '30.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:06', '2018-09-23 11:01:06');
INSERT INTO `audit` VALUES ('18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '80.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:40', '2018-09-23 11:01:40');
INSERT INTO `audit` VALUES ('18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '70.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:03:09', '2018-09-23 11:03:09');
INSERT INTO `audit` VALUES ('18-00047', '0001', 'ht1', '0008', '工程师', '投资监理8', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '120.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '进行中', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:12', '2018-09-23 11:04:12');
INSERT INTO `audit` VALUES ('18-00048', '0001', 'ht1', '0009', '工程师', '投资监理9', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '130.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '有问题', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:56', '2018-09-23 11:04:56');

-- ----------------------------
-- Table structure for `auditcntrct`
-- ----------------------------
DROP TABLE IF EXISTS `auditcntrct`;
CREATE TABLE `auditcntrct` (
  `CNTRCT_BELONG` varchar(1) DEFAULT NULL COMMENT '合同归属',
  `CNTRCT_NO` varchar(20) NOT NULL DEFAULT '' COMMENT '合同编号',
  `CNTRCT_NAME` varchar(1000) DEFAULT NULL COMMENT '合同名称',
  `CNTRCT_NM` varchar(100) DEFAULT NULL COMMENT '合同简称',
  `CNTRCT_TYPE` varchar(2) DEFAULT NULL COMMENT '合同性质',
  `AUDIT_COMP_NO` varchar(4) DEFAULT NULL COMMENT '委托单位ID',
  `AUDIT_COMP_NAME` varchar(40) DEFAULT NULL COMMENT '委托单位',
  `CO_MANAGER_ADDRESS1` varchar(100) DEFAULT NULL COMMENT '联系人及联系方式',
  `CO_MANAGER1` varchar(6) DEFAULT NULL COMMENT '联系人',
  `CO_MANAGER_TEL1` varchar(30) DEFAULT NULL COMMENT '联系方式(电话)',
  `CO_ADDRESS1` varchar(80) DEFAULT NULL COMMENT '联系方式(地址)',
  `CNTRCT_ST_DATE` datetime DEFAULT NULL COMMENT '合同开始时间',
  `CNTRCT_ED_DATE` datetime DEFAULT NULL COMMENT '合同结束时间',
  `CNTRCT_INFO` varchar(20) DEFAULT NULL COMMENT '委托内容',
  `CNTRCT_RATE_1` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率1(审价)',
  `CNTRCT_RATE_2` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率2(咨询)',
  `CNTRCT_RATE_3` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率3(清单编制)',
  `CNTRCT_RATE_4` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率4(控制价编制)',
  `CNTRCT_RATE_5` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率5(全过程投资监理)',
  `CNTRCT_RATE_6` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率6',
  `CNTRCT_RATE_7` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率7',
  `CNTRCT_RATE_8` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率8',
  `CNTRCT_RATE_9` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率9',
  `CNTRCT_RATE_10` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率10',
  `CNTRCT_AMOUNT_1` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额1(审价)',
  `CNTRCT_AMOUNT_2` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额2(咨询)',
  `CNTRCT_AMOUNT_3` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额3(清单编制)',
  `CNTRCT_AMOUNT_4` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额4(控制价编制)',
  `CNTRCT_AMOUNT_5` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额5(全过程投资监理)',
  `CNTRCT_AMOUNT_6` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额6',
  `CNTRCT_AMOUNT_7` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额7',
  `CNTRCT_AMOUNT_8` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额8',
  `CNTRCT_AMOUNT_9` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额9',
  `CNTRCT_AMOUNT_10` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额10',
  `CNTRCT_TOTAL_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '委托方收费',
  `CNTRCT_ALL_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '合同金额',
  `CNTRCT_UNPAY_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '未收金额',
  `TRIP_TOTAL_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '差旅合计',
  `ESTIMATE_COST` decimal(14,2) DEFAULT NULL COMMENT '总概算',
  `ESTIMATE_CONSTRUCT_SAFE_COST` decimal(14,2) DEFAULT NULL COMMENT '建安概算（不含物流设备及信息）',
  `PRE_CONSTRUCT_SAFE_COST` decimal(14,2) DEFAULT NULL COMMENT '建安对应预备费',
  `CONSTRUCT_ST_DATE` datetime DEFAULT NULL COMMENT '开工时间',
  `PLAN_CONSTRUCT_ED_DATE` datetime DEFAULT NULL COMMENT '预计完工时间',
  `CONSTRUCT_AREA` decimal(14,2) DEFAULT NULL COMMENT '总建筑面积',
  `EXCUTE_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '执行总费用',
  `CONSTRUCT_SAFE_COUNT` int(8) DEFAULT NULL COMMENT '执行建安（万元）',
  `CONSTRUCT_SAFE_CNTRCT_COST` decimal(14,2) DEFAULT NULL COMMENT '合同价',
  `CONSTRUCT_SAFE_CNTRCT_COST_PAID` decimal(14,2) DEFAULT NULL COMMENT '已支付',
  `CONSTRUCT_SAFE_CNTRCT_COST_CTRL` decimal(14,2) DEFAULT NULL COMMENT '控制价',
  `BUDGETARY_OVERRUN_RISK` int(5) DEFAULT NULL COMMENT '超概的风险度',
  `MONTHLY_REPORT_CNT` int(8) DEFAULT NULL COMMENT '月报',
  `SUGGEST_REPORT_CNT` int(8) DEFAULT NULL COMMENT '建议书',
  `COMM_REPORT_CNT` int(8) DEFAULT NULL COMMENT '联系函',
  `FINISH_AUDIT_CNT` int(8) DEFAULT NULL COMMENT '已完审价',
  `PROJ_PROGRESS_MEET_CNT` int(8) DEFAULT NULL COMMENT '工程例会',
  `PROGRESS_STATUS` varchar(200) DEFAULT NULL,
  `PROJECT_SENIOR_MANAGER` varchar(6) DEFAULT NULL COMMENT '负责人',
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(200) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) DEFAULT NULL COMMENT '备用5',
  `RESERVE6` varchar(20) DEFAULT NULL COMMENT '备用6',
  `RESERVE7` decimal(14,2) DEFAULT NULL COMMENT '备用7',
  `RESERVE8` decimal(14,2) DEFAULT NULL COMMENT '备用8',
  `RESERVE9` datetime DEFAULT NULL COMMENT '备用9',
  `RESERVE10` datetime DEFAULT NULL COMMENT '备用10',
  `LATEST_FLG` varchar(1) DEFAULT NULL COMMENT '最新化',
  `DELETE_FLG` varchar(1) DEFAULT NULL COMMENT '删除',
  `UPDATE_USER` varchar(6) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新增日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`CNTRCT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auditcntrct
-- ----------------------------
INSERT INTO `auditcntrct` VALUES ('1', '0001', '合同1', 'ht1', '1', '', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', '', '', '', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:30:43', '2018-09-23 12:52:01');

-- ----------------------------
-- Table structure for `auditcntrct_hist`
-- ----------------------------
DROP TABLE IF EXISTS `auditcntrct_hist`;
CREATE TABLE `auditcntrct_hist` (
  `CNTRCT_HIST_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '履历主键',
  `CNTRCT_BELONG` varchar(1) DEFAULT NULL COMMENT '合同归属',
  `CNTRCT_NO` varchar(20) DEFAULT NULL COMMENT '合同编号',
  `CNTRCT_NAME` varchar(1000) DEFAULT NULL COMMENT '合同名称',
  `CNTRCT_NM` varchar(100) DEFAULT NULL COMMENT '合同简称',
  `CNTRCT_TYPE` varchar(2) DEFAULT NULL COMMENT '合同性质',
  `AUDIT_COMP_NO` varchar(4) DEFAULT NULL COMMENT '委托单位ID',
  `AUDIT_COMP_NAME` varchar(40) DEFAULT NULL COMMENT '委托单位',
  `CO_MANAGER_ADDRESS1` varchar(100) DEFAULT NULL COMMENT '联系人及联系方式',
  `CO_MANAGER1` varchar(6) DEFAULT NULL COMMENT '联系人',
  `CO_MANAGER_TEL1` varchar(30) DEFAULT NULL COMMENT '联系方式(电话)',
  `CO_ADDRESS1` varchar(80) DEFAULT NULL COMMENT '联系方式(地址)',
  `CNTRCT_ST_DATE` datetime DEFAULT NULL COMMENT '合同开始时间',
  `CNTRCT_ED_DATE` datetime DEFAULT NULL COMMENT '合同结束时间',
  `CNTRCT_INFO` varchar(20) DEFAULT NULL COMMENT '委托内容',
  `CNTRCT_RATE_1` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率1(审价)',
  `CNTRCT_RATE_2` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率2(咨询)',
  `CNTRCT_RATE_3` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率3(清单编制)',
  `CNTRCT_RATE_4` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率4(控制价编制)',
  `CNTRCT_RATE_5` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率5(全过程投资监理)',
  `CNTRCT_RATE_6` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率6',
  `CNTRCT_RATE_7` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率7',
  `CNTRCT_RATE_8` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率8',
  `CNTRCT_RATE_9` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率9',
  `CNTRCT_RATE_10` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率10',
  `CNTRCT_AMOUNT_1` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额1(审价)',
  `CNTRCT_AMOUNT_2` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额2(咨询)',
  `CNTRCT_AMOUNT_3` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额3(清单编制)',
  `CNTRCT_AMOUNT_4` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额4(控制价编制)',
  `CNTRCT_AMOUNT_5` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额5(全过程投资监理)',
  `CNTRCT_AMOUNT_6` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额6',
  `CNTRCT_AMOUNT_7` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额7',
  `CNTRCT_AMOUNT_8` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额8',
  `CNTRCT_AMOUNT_9` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额9',
  `CNTRCT_AMOUNT_10` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额10',
  `CNTRCT_TOTAL_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '委托方收费',
  `CNTRCT_ALL_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '合同金额',
  `CNTRCT_UNPAY_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '未收金额',
  `TRIP_TOTAL_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '差旅合计',
  `ESTIMATE_COST` decimal(14,2) DEFAULT NULL COMMENT '总概算',
  `ESTIMATE_CONSTRUCT_SAFE_COST` decimal(14,2) DEFAULT NULL COMMENT '建安概算（不含物流设备及信息）',
  `PRE_CONSTRUCT_SAFE_COST` decimal(14,2) DEFAULT NULL COMMENT '建安对应预备费',
  `CONSTRUCT_ST_DATE` datetime DEFAULT NULL COMMENT '开工时间',
  `PLAN_CONSTRUCT_ED_DATE` datetime DEFAULT NULL COMMENT '预计完工时间',
  `CONSTRUCT_AREA` decimal(14,2) DEFAULT NULL COMMENT '总建筑面积',
  `EXCUTE_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '执行总费用',
  `CONSTRUCT_SAFE_COUNT` int(8) DEFAULT NULL COMMENT '执行建安（万元）',
  `CONSTRUCT_SAFE_CNTRCT_COST` decimal(14,2) DEFAULT NULL COMMENT '合同价',
  `CONSTRUCT_SAFE_CNTRCT_COST_PAID` decimal(14,2) DEFAULT NULL COMMENT '已支付',
  `CONSTRUCT_SAFE_CNTRCT_COST_CTRL` decimal(14,2) DEFAULT NULL COMMENT '控制价',
  `BUDGETARY_OVERRUN_RISK` int(5) DEFAULT NULL COMMENT '超概的风险度',
  `MONTHLY_REPORT_CNT` int(8) DEFAULT NULL COMMENT '月报',
  `SUGGEST_REPORT_CNT` int(8) DEFAULT NULL COMMENT '建议书',
  `COMM_REPORT_CNT` int(8) DEFAULT NULL COMMENT '联系函',
  `FINISH_AUDIT_CNT` int(8) DEFAULT NULL COMMENT '已完审价',
  `PROJ_PROGRESS_MEET_CNT` int(8) DEFAULT NULL COMMENT '工程例会',
  `PROGRESS_STATUS` varchar(200) DEFAULT NULL,
  `PROJECT_SENIOR_MANAGER` varchar(6) DEFAULT NULL COMMENT '负责人',
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(200) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) DEFAULT NULL COMMENT '备用5',
  `RESERVE6` varchar(20) DEFAULT NULL COMMENT '备用6',
  `RESERVE7` decimal(14,2) DEFAULT NULL COMMENT '备用7',
  `RESERVE8` decimal(14,2) DEFAULT NULL COMMENT '备用8',
  `RESERVE9` datetime DEFAULT NULL COMMENT '备用9',
  `RESERVE10` datetime DEFAULT NULL COMMENT '备用10',
  `LATEST_FLG` varchar(1) DEFAULT NULL COMMENT '最新化',
  `DELETE_FLG` varchar(1) DEFAULT NULL COMMENT '删除',
  `UPDATE_USER` varchar(6) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新增日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`CNTRCT_HIST_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auditcntrct_hist
-- ----------------------------
INSERT INTO `auditcntrct_hist` VALUES ('1', '1', '444', 'test444', '', '1', '', '44444', '', '', '', '', '2018-08-30 00:00:00', '2018-08-31 00:00:00', '01100', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', null, '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', 'test11', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-08-25 20:17:46', '2018-08-25 20:17:46');
INSERT INTO `auditcntrct_hist` VALUES ('2', '', '3', '', '', '1', '', '2342', '', '', '', '', null, null, '00000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', null, '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', 'test11', null, null, null, null, null, null, null, null, null, null, null, '0', 'admin', '2018-08-25 20:29:07', '2018-08-25 20:29:07');
INSERT INTO `auditcntrct_hist` VALUES ('3', '', '222', '', '', '2', '', 'wewq', '', '', '', '', null, null, '00001', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', null, '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', 'r', 'test11', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-08-25 21:22:10', '2018-08-25 21:22:10');
INSERT INTO `auditcntrct_hist` VALUES ('4', '', '222', '', '', '2', '', 'wewq', '', '', '', '', null, null, '00001', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', null, '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', 'r', 'test11', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-08-25 23:08:32', '2018-08-25 23:08:32');
INSERT INTO `auditcntrct_hist` VALUES ('5', '1', '33', 'test33', '33', '2', '', '33333', 'eee', '', '', '', '2018-08-30 00:00:00', '2018-08-31 00:00:00', '10100', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', null, '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', 'admin', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-08-25 23:21:01', '2018-08-25 23:21:01');
INSERT INTO `auditcntrct_hist` VALUES ('6', '', '555', '', '', '2', '', '3453', '', '', '', '', null, null, '10000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', null, '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', 'test11', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-08-26 15:13:00', '2018-08-26 15:13:00');
INSERT INTO `auditcntrct_hist` VALUES ('7', '1', '555', '', '', '2', '', '3453', '', '', '', '', null, null, '10000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', 'test11', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-08-26 15:14:43', '2018-08-26 15:14:43');
INSERT INTO `auditcntrct_hist` VALUES ('8', '2', '666', '', '', '1', '', 'bai', '', '', '', '', null, null, '00000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', 'test11', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-08-26 15:16:37', '2018-08-26 15:16:37');
INSERT INTO `auditcntrct_hist` VALUES ('9', '', 'ewtwe', 'wewwrw', 'wrw', '1', 'Jccc', 'a1212121', 'xbaaa/ fdafdsa/ fdafdsaf/ aaa33@bb.cc', 'xbaaa', 'fdafdsa', 'fdafdsaf', null, null, '10000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-02 23:02:28', '2018-09-02 23:02:28');
INSERT INTO `auditcntrct_hist` VALUES ('10', '', 'ewtwe', 'wewwrw', 'wrw', '1', 'Jccc', 'a1212121', 'xbaaa/ fdafdsa/ fdafdsaf/ aaa33@bb.cc', 'xbaaa', 'fdafdsa', 'fdafdsaf', null, null, '10000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-02 23:27:14', '2018-09-02 23:27:14');
INSERT INTO `auditcntrct_hist` VALUES ('11', '', 'ewtwe', 'wewwrw', 'wrw', '1', 'Jccc', 'a1212121', 'xbaaa/ fdafdsa/ fdafdsaf/ aaa33@bb.cc', 'xbaaa', 'fdafdsa', 'fdafdsaf', null, null, '10000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-02 23:30:36', '2018-09-02 23:30:36');
INSERT INTO `auditcntrct_hist` VALUES ('12', '', 'ewtwe', 'wewwrw', 'wrw', '1', 'jajj', 'fdsafdsaf', '张庄庄张庄庄/ 13232323233/ fda/ aaaaa@bbb.cc', '张庄庄张庄庄', '13232323233', 'fda', null, null, '10000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-02 23:31:52', '2018-09-02 23:31:52');
INSERT INTO `auditcntrct_hist` VALUES ('13', '2', '666', '', '', '1', '', 'bai', '', '', '', '', null, null, '00000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', 'test11', null, null, null, null, null, null, null, null, null, null, null, '0', 'admin', '2018-09-08 03:49:34', '2018-09-08 03:49:34');
INSERT INTO `auditcntrct_hist` VALUES ('14', '2', 'ewtwe', 'wewwrw', 'wrw', '1', 'Jaaa', 'bbbbbbbb', 'cccc/ 432413214/ fdasfdsa/ aaaa@bb.cc', 'cccc', '432413214', 'fdasfdsa', null, null, '10000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-08 03:50:05', '2018-09-08 03:50:05');
INSERT INTO `auditcntrct_hist` VALUES ('15', '2', 'ewtwe', 'wewwrw', 'wrw', '1', 'Jccc', 'a1212121', 'xbaaa/ fdafdsa/ fdafdsaf/ aaa33@bb.cc', 'xbaaa', 'fdafdsa', 'fdafdsaf', null, null, '10000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-08 16:50:12', '2018-09-08 16:50:12');
INSERT INTO `auditcntrct_hist` VALUES ('16', '2', 'ewtwe', 'wewwrw', 'wrw', '1', 'jajj', 'fdsafdsaf', '张庄庄张庄庄/ 13232323233/ fda/ aaaaa@bbb.cc', '张庄庄张庄庄', '13232323233', 'fda', null, null, '10000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-08 16:54:22', '2018-09-08 16:54:22');
INSERT INTO `auditcntrct_hist` VALUES ('17', '', '222222', '2232', '2421421', '2', 'Jddd', 'ccsssssssssssssss', '1111xm/ 1111111111111dh/ 1111dz/ 1111@111.cca', '1111xm', '1111111111111dh', '1111dz', null, null, '00000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-08 17:01:16', '2018-09-08 17:01:16');
INSERT INTO `auditcntrct_hist` VALUES ('18', '', '222222', '2232', '2421421', '1', '', 'ccsssssssssssssss', '1111xm/ 1111111111111dh/ 1111dz/ 1111@111.cca', '', '', '', null, null, '00000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-08 17:02:28', '2018-09-08 17:02:28');
INSERT INTO `auditcntrct_hist` VALUES ('19', '2', 'ewtwe', 'wewwrw', 'wrw', '1', '', 'fdsafdsaf', '张庄庄张庄庄/ 13232323233/ fda/ aaaaa@bbb.cc', '', '', '', null, null, '10000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', 'test11', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-08 22:22:53', '2018-09-08 22:22:53');
INSERT INTO `auditcntrct_hist` VALUES ('20', '2', 'ewtwe', 'wewwrw', 'wrw', '1', 'Jaaa', 'bbbbbbbb', 'cccc/ 432413214/ fdasfdsa/ aaaa@bb.cc', 'cccc', '432413214', 'fdasfdsa', null, null, '10000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', 'test11', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-08 22:32:56', '2018-09-08 22:32:56');
INSERT INTO `auditcntrct_hist` VALUES ('21', '1', '000001', 'liuql', 'lql', '1', 'J910', 'ceshi99', '11/ 22/ 44/ 33@33.aa', '11', '22', '44', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '10000', '1.00', '2.00', null, '3.00', '4.00', null, null, null, null, null, '100.00', '200.00', '300.00', '400.00', '500.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', 'test11', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-08 23:00:06', '2018-09-08 23:00:06');
INSERT INTO `auditcntrct_hist` VALUES ('22', '1', '000001', 'liuql', 'lql', '1', 'Jccc', 'a1212121', 'xbaaa/ fdafdsa/ fdafdsaf/ aaa33@bb.cc', 'xbaaa', 'fdafdsa', 'fdafdsaf', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '10000', '1.00', '2.00', null, '3.00', '4.00', null, null, null, null, null, '100.00', '200.00', '300.00', '400.00', '500.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', 'test11', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-08 23:01:13', '2018-09-08 23:01:13');
INSERT INTO `auditcntrct_hist` VALUES ('23', '1', '000001', 'liuql', 'lql', '2', '', 'a1212121', 'xbaaa/ fdafdsa/ fdafdsaf/ aaa33@bb.cc', '', '', '', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '10001', '1.00', '2.00', null, '3.00', '4.00', null, null, null, null, null, '100.00', '200.00', '300.00', '400.00', '500.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', 'test11', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-08 23:01:35', '2018-09-08 23:01:35');
INSERT INTO `auditcntrct_hist` VALUES ('24', '1', '0001', 'test', 'etes', '1', 'Jewe', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', 'fdsa', 'f21212121', 'fdsafdsa', '2018-09-03 00:00:00', '2018-09-15 00:00:00', '10000', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-15 02:46:50', '2018-09-15 02:46:50');
INSERT INTO `auditcntrct_hist` VALUES ('25', '2', 'ewtwe', 'wewwrw', 'wrw', '1', '', 'bbbbbbbb', 'cccc/ 432413214/ fdasfdsa/ aaaa@bb.cc', '', '', '', null, null, '10000', '10.00', '20.00', null, '30.00', '40.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', 'test11', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 17:23:21', '2018-09-22 17:23:21');
INSERT INTO `auditcntrct_hist` VALUES ('26', '2', 'ewtwe', 'wewwrw', 'wrw', '1', '', 'bbbbbbbb', 'cccc/ 432413214/ fdasfdsa/ aaaa@bb.cc', '', '', '', null, null, '11111', '10.00', '20.00', null, '30.00', '40.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', 'test11', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 17:24:13', '2018-09-22 17:24:13');
INSERT INTO `auditcntrct_hist` VALUES ('27', '1', '0001', '合同1', 'ht1', '1', 'Jewe', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', 'fdsa', 'f21212121', 'fdsafdsa', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:30:43', '2018-09-23 10:30:43');
INSERT INTO `auditcntrct_hist` VALUES ('28', '1', '0001', '合同1', 'ht1', '1', 'Jewe', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', 'fdsa', 'f21212121', 'fdsafdsa', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, '50.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:33:56', '2018-09-23 10:33:56');
INSERT INTO `auditcntrct_hist` VALUES ('29', '1', '0001', '合同1', 'ht1', '1', 'Jewe', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', 'fdsa', 'f21212121', 'fdsafdsa', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, '50.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:34:53', '2018-09-23 10:34:53');
INSERT INTO `auditcntrct_hist` VALUES ('30', '1', '0001', '合同1', 'ht1', '1', 'Jewe', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', 'fdsa', 'f21212121', 'fdsafdsa', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, '50.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:58:55', '2018-09-23 10:58:55');
INSERT INTO `auditcntrct_hist` VALUES ('31', '1', '0001', '合同1', 'ht1', '1', 'Jewe', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', 'fdsa', 'f21212121', 'fdsafdsa', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, '130.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:00:19', '2018-09-23 11:00:19');
INSERT INTO `auditcntrct_hist` VALUES ('32', '1', '0001', '合同1', 'ht1', '1', 'Jewe', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', 'fdsa', 'f21212121', 'fdsafdsa', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, '130.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:06', '2018-09-23 11:01:06');
INSERT INTO `auditcntrct_hist` VALUES ('33', '1', '0001', '合同1', 'ht1', '1', 'Jewe', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', 'fdsa', 'f21212121', 'fdsafdsa', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, '130.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:40', '2018-09-23 11:01:40');
INSERT INTO `auditcntrct_hist` VALUES ('34', '1', '0001', '合同1', 'ht1', '1', 'Jewe', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', 'fdsa', 'f21212121', 'fdsafdsa', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, '130.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:03:14', '2018-09-23 11:03:14');
INSERT INTO `auditcntrct_hist` VALUES ('35', '1', '0001', '合同1', 'ht1', '1', 'Jewe', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', 'fdsa', 'f21212121', 'fdsafdsa', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, '130.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:12', '2018-09-23 11:04:12');
INSERT INTO `auditcntrct_hist` VALUES ('36', '1', '0001', '合同1', 'ht1', '1', 'Jewe', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', 'fdsa', 'f21212121', 'fdsafdsa', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, '230.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:56', '2018-09-23 11:04:56');
INSERT INTO `auditcntrct_hist` VALUES ('37', '1', '0001', '合同1', 'ht1', '1', 'Jewe', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', 'fdsa', 'f21212121', 'fdsafdsa', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, '230.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:05:40', '2018-09-23 11:05:40');
INSERT INTO `auditcntrct_hist` VALUES ('38', '1', '0001', '合同1', 'ht1', '1', 'Jewe', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', 'fdsa', 'f21212121', 'fdsafdsa', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, '230.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:06:09', '2018-09-23 11:06:09');
INSERT INTO `auditcntrct_hist` VALUES ('39', '1', '0001', '合同1', 'ht1', '1', 'Jewe', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', 'fdsa', 'f21212121', 'fdsafdsa', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, '320.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:24:11', '2018-09-23 11:24:11');
INSERT INTO `auditcntrct_hist` VALUES ('40', '1', '0001', '合同1', 'ht1', '1', 'Jewe', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', 'fdsa', 'f21212121', 'fdsafdsa', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, '320.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:40:07', '2018-09-23 11:40:07');
INSERT INTO `auditcntrct_hist` VALUES ('41', '1', '0001', '合同1', 'ht1', '1', 'Jewe', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', 'fdsa', 'f21212121', 'fdsafdsa', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, '320.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:04:52', '2018-09-23 12:04:52');
INSERT INTO `auditcntrct_hist` VALUES ('42', '1', '0001', '合同1', 'ht1', '1', '', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', '', '', '', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '5.00', '7.00', null, '8.00', '9.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, '320.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:06:20', '2018-09-23 12:06:20');
INSERT INTO `auditcntrct_hist` VALUES ('43', '1', '0001', '合同1', 'ht1', '1', '', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', '', '', '', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '5.00', '7.00', null, '8.00', '9.00', null, null, null, null, null, '50.00', '80.00', '20.00', '90.00', '100.00', null, null, null, null, null, '43.50', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:06:52', '2018-09-23 12:06:52');
INSERT INTO `auditcntrct_hist` VALUES ('44', '1', '0001', '合同1', 'ht1', '1', '', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', '', '', '', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, '43.50', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:48:22', '2018-09-23 12:48:22');
INSERT INTO `auditcntrct_hist` VALUES ('45', '1', '0001', '合同1', 'ht1', '1', '', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', '', '', '', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:48:52', '2018-09-23 12:48:52');
INSERT INTO `auditcntrct_hist` VALUES ('46', '1', '0001', '合同1', 'ht1', '1', '', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', '', '', '', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:50:21', '2018-09-23 12:50:21');
INSERT INTO `auditcntrct_hist` VALUES ('47', '1', '0001', '合同1', 'ht1', '1', '', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', '', '', '', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:51:11', '2018-09-23 12:51:11');
INSERT INTO `auditcntrct_hist` VALUES ('48', '1', '0001', '合同1', 'ht1', '1', '', 'afafsdaf', 'fdsa/ f21212121/ fdsafdsa/ aaaaaaaaaaaaaaaaaaaaaaaaaaaaa@dddddddddddddddddd.da', '', '', '', '2018-09-01 00:00:00', '2018-09-30 00:00:00', '11111', '0.00', '0.00', null, '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', null, null, null, null, null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '', '工程师', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:52:01', '2018-09-23 12:52:01');

-- ----------------------------
-- Table structure for `auditcomp`
-- ----------------------------
DROP TABLE IF EXISTS `auditcomp`;
CREATE TABLE `auditcomp` (
  `AUDIT_CO_NO` int(11) NOT NULL AUTO_INCREMENT COMMENT '公司号',
  `AUDIT_COMP_NO` varchar(20) DEFAULT NULL COMMENT '合同公司代码',
  `AUDIT_COMP_NAME` varchar(40) DEFAULT NULL COMMENT '合同公司名称',
  `AUDIT_COMP_CLIENT` varchar(40) DEFAULT NULL COMMENT '甲方公司名称',
  `AUDIT_COMP_CLIENTID` varchar(40) DEFAULT NULL COMMENT '甲方公司ID',
  `DELETE_FLG` varchar(1) DEFAULT NULL COMMENT '删除',
  `UPDATE_USER` varchar(6) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新建日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(20) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) DEFAULT NULL COMMENT '备用5',
  `TAX_NO` varchar(20) DEFAULT NULL COMMENT '开票信息',
  PRIMARY KEY (`AUDIT_CO_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auditcomp
-- ----------------------------
INSERT INTO `auditcomp` VALUES ('1', '001', 'test', null, null, '1', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `audit_hist`
-- ----------------------------
DROP TABLE IF EXISTS `audit_hist`;
CREATE TABLE `audit_hist` (
  `AUDIT_HIS_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '履历主键',
  `AUDIT_NO` varchar(8) NOT NULL DEFAULT '' COMMENT '审价编号YYYY-NNN  自动采番',
  `CNTRCT_NO` varchar(16) DEFAULT NULL,
  `CNTRCT_NM` varchar(100) DEFAULT NULL,
  `REPORT_NO` varchar(16) DEFAULT NULL COMMENT '报告文号',
  `PROJECT_MANAGER` varchar(6) DEFAULT NULL COMMENT '工程师',
  `PROJECT_NAME` varchar(80) DEFAULT NULL COMMENT '项目名称',
  `PROJECT_TYPE` varchar(1) DEFAULT NULL COMMENT '项目性质1:土建,2:安装,3:房修,4:园林,5:咨询,6：限价，7:其他',
  `PROJECT_STATUS` varchar(1) DEFAULT NULL COMMENT '项目进度1：在审，2：补交资料，3：初稿已出，4：审定单已出，',
  `AGENT_NO` varchar(4) DEFAULT NULL COMMENT '委托公司代码',
  `AGENT_CO_NAME` varchar(40) DEFAULT NULL COMMENT '委托公司名称',
  `AGENT_CO_MANAGER` varchar(6) DEFAULT NULL COMMENT '委托公司负责人',
  `AGENT_CO_MANAGER_TEL` varchar(30) DEFAULT NULL COMMENT '委托公司负责人电话',
  `AGENT_CO_STAFF` varchar(6) DEFAULT NULL COMMENT '委托公司项目负责人',
  `AGENT_CO_STAFF_TEL` varchar(30) DEFAULT NULL COMMENT '委托公司项目负责人电话',
  `AGENT_CO_POST_ADDRESS` varchar(80) DEFAULT NULL COMMENT '委托公司快递地址',
  `AGENT_CO_MAIL` varchar(60) DEFAULT NULL COMMENT '委托公负责人司邮箱',
  `PROF_NO` varchar(4) DEFAULT NULL COMMENT '专业公司代码',
  `PROF_CO_NAME` varchar(40) DEFAULT NULL COMMENT '专业公司名称',
  `PROF_CO_MANAGER` varchar(6) DEFAULT NULL COMMENT '专业公司负责人',
  `PROF_CO_MANAGER_TEL` varchar(30) DEFAULT NULL COMMENT '专业公司负责人电话',
  `PROF_CO_STAFF` varchar(6) DEFAULT NULL COMMENT '专业公司项目负责人',
  `PROF_CO_STAFF_TEL` varchar(30) DEFAULT NULL COMMENT '专业公司项目负责人电话',
  `PROF_CO_POST_ADDRESS` varchar(80) DEFAULT NULL COMMENT '专业公司地址',
  `PROF_CO_MAIL` varchar(60) DEFAULT NULL COMMENT '专业公司邮箱',
  `CONTRACT_CO_NO` varchar(4) DEFAULT NULL COMMENT '承包公司代码',
  `CONTRACT_CO_NAME` varchar(40) DEFAULT NULL COMMENT '承包公司名称',
  `CONTRACT_CO_MANAGER` varchar(6) DEFAULT NULL COMMENT '承包公司负责人',
  `CONTRACT_CO_MANAGER_TEL` varchar(30) DEFAULT NULL COMMENT '承包公司负责人电话',
  `CONTRACT_CO_STAFF` varchar(6) DEFAULT NULL COMMENT '承包公司项目负责人',
  `CONTRACT_CO_STAFF_TEL` varchar(30) DEFAULT NULL COMMENT '承包公司项目负责人电话',
  `CONTRACT_CO_POST_ADDRESS` varchar(80) DEFAULT NULL COMMENT '承包公司快递地址',
  `CONTRACT_CO_MAIL` varchar(60) DEFAULT NULL COMMENT '承包公司负责人邮箱',
  `DOC_REC_DATE` datetime DEFAULT NULL COMMENT '资料收到日期',
  `PROGRESS_STATUS` varchar(2) DEFAULT NULL COMMENT '实施情况',
  `PRE_SET` varchar(2) DEFAULT NULL,
  `PRE_PRICE` decimal(14,2) DEFAULT NULL COMMENT '预算金额',
  `SUPPORT_DOC_DATE` datetime DEFAULT NULL COMMENT '补充资料日期',
  `DRAFT_DATE` datetime DEFAULT NULL COMMENT '初稿日期',
  `APPROVAL_SND_DATE` datetime DEFAULT NULL COMMENT '审定单发出日期',
  `APPROVAL_RCV_DATE` datetime DEFAULT NULL COMMENT '审定单收到日期',
  `DELI_NO` varchar(20) DEFAULT NULL COMMENT '快递单号',
  `REPORT_RAISE_DATE` datetime DEFAULT NULL COMMENT '报告出具日期',
  `REPORT_SEAL_DATE` datetime DEFAULT NULL COMMENT '报告敲章日期',
  `REPORT_ARR_TYPE` varchar(2) DEFAULT NULL COMMENT '报告送达方式',
  `REPORT_ARR_DATE` datetime DEFAULT NULL COMMENT '报告送达日期',
  `REG_DATE` datetime DEFAULT NULL COMMENT '入档日期',
  `AGENT_INFO` varchar(200) DEFAULT NULL COMMENT '委托方专业联系人及联系方式',
  `CONTRACT_CO_ID` varchar(20) DEFAULT NULL COMMENT '承揽单位',
  `CONTRACT_CO_INFO` varchar(200) DEFAULT NULL COMMENT '承揽单位联系人及联系方式',
  `VERIFY_PER_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '送审价',
  `VERIFY_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '审核价',
  `VERIFY_INCREASE` decimal(14,2) DEFAULT NULL COMMENT '核增额',
  `VERIFY_DECREASE` decimal(14,2) DEFAULT NULL COMMENT '核减额',
  `VERIFY_DIFF` decimal(14,2) DEFAULT NULL COMMENT '净核减额',
  `VERIFY_DIFF_RATE` decimal(14,2) DEFAULT NULL COMMENT '净核减率',
  `CNT_PRICE` decimal(14,2) DEFAULT NULL COMMENT '控制价金额',
  `PROJ_PRICE` decimal(14,2) DEFAULT NULL COMMENT '立项金额',
  `LIMIT_PRICE` decimal(14,2) DEFAULT NULL COMMENT '限价金额',
  `CNTRCT_PRICE` decimal(14,2) DEFAULT NULL COMMENT '合同金额',
  `PLAN_DOC_RCV_DATE` datetime DEFAULT NULL COMMENT '资料收到时间（立项阶段）',
  `PLAN_DOC_RPT_DATE` datetime DEFAULT NULL COMMENT '立项报告时间（立项阶段）',
  `PLAN_DOC_SND_TYPE` varchar(2) DEFAULT NULL,
  `PLAN_DOC_ARR_DATE` datetime DEFAULT NULL COMMENT '报告送达日期（立项阶段）',
  `BID_DOC_RCV_DATE` datetime DEFAULT NULL COMMENT '资料收到时间（招标阶段）',
  `BID_DOC_RPT_DATE` datetime DEFAULT NULL COMMENT '限价报告时间（招标阶段）',
  `BID_DOC_SND_TYPE` varchar(2) DEFAULT NULL,
  `BID_DOC_ARR_DATE` datetime DEFAULT NULL COMMENT '报告送达日期（招标阶段）',
  `SIGN_DOC_RCV_DATE` datetime DEFAULT NULL COMMENT '资料收到时间（合同签订阶段）',
  `SIGN_DOC_RPT_DATE` datetime DEFAULT NULL COMMENT '合同审核报告时间（合同签订阶段)',
  `SIGN_DOC_SND_TYPE` varchar(2) DEFAULT NULL,
  `SIGN_DOC_ARR_DATE` datetime DEFAULT NULL COMMENT '报告送达日期（合同签订阶段)',
  `SET_DOC_RCV_DATE` datetime DEFAULT NULL COMMENT '资料收到时间（结算阶段）',
  `SET_DOC_RPT_DATE` datetime DEFAULT NULL COMMENT '结算报告出具时间（结算阶段）',
  `SET_DOC_SND_TYPE` varchar(2) DEFAULT NULL,
  `SET_DOC_ARR_DATE` datetime DEFAULT NULL COMMENT '报告送达日期（结算阶段）',
  `PROGRESS_STATUS_MEMO` varchar(200) DEFAULT NULL COMMENT '项目大致进度简述',
  `A_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '甲方收费',
  `A_STATUS` varchar(2) DEFAULT NULL COMMENT '收费状态',
  `B_TYPE` varchar(2) DEFAULT NULL COMMENT '乙方收费方式',
  `B_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '乙方收费',
  `A_INVOICE_DELI_DATE` datetime DEFAULT NULL COMMENT '甲方发票流转单日期',
  `A_INVOICE_DATE` datetime DEFAULT NULL COMMENT '甲方开票日期',
  `A_INVOICE_NO` varchar(20) DEFAULT NULL COMMENT '甲方发票号',
  `A_SET_DATE` datetime DEFAULT NULL COMMENT '甲方到账日期',
  `B_INVOICE_DELI_DATE` datetime DEFAULT NULL COMMENT '乙方发票流转单日期',
  `B_INVOICE_DATE` datetime DEFAULT NULL COMMENT '乙方开票日期',
  `B_INVOICE_NO` varchar(20) DEFAULT NULL COMMENT '乙方发票号',
  `B_SET_DATE` datetime DEFAULT NULL COMMENT '乙方到账日期',
  `B_RATE` decimal(14,2) DEFAULT NULL,
  `CNTRCT_INFO` varchar(2) DEFAULT NULL,
  `PROJECT_NAME_PASS` varchar(80) DEFAULT NULL,
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(200) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) DEFAULT NULL COMMENT '备用5',
  `RESERVE6` varchar(20) DEFAULT NULL COMMENT '备用6',
  `RESERVE7` decimal(14,2) DEFAULT NULL COMMENT '备用7',
  `RESERVE8` decimal(14,2) DEFAULT NULL COMMENT '备用8',
  `RESERVE9` datetime DEFAULT NULL COMMENT '备用9',
  `RESERVE10` datetime DEFAULT NULL COMMENT '备用10',
  `LATEST_FLG` varchar(1) DEFAULT NULL COMMENT '最新化',
  `DELETE_FLG` varchar(1) DEFAULT NULL COMMENT '删除',
  `UPDATE_USER` varchar(6) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新增日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`AUDIT_HIS_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of audit_hist
-- ----------------------------
INSERT INTO `audit_hist` VALUES ('64', '18-00028', '444', '', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '1', '1', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 19:28:31', '2018-09-22 19:28:31');
INSERT INTO `audit_hist` VALUES ('65', '18-00029', '444', '', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', null, '', '1', null, null, null, '', null, null, null, '', null, '90.00', '1', null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 21:21:19', '2018-09-22 21:21:19');
INSERT INTO `audit_hist` VALUES ('66', '18-00030', '444', '', '0003', '工程师', '审价3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-20 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '3', '0.00', null, null, '', null, null, null, '', null, '3.00', '1', null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 21:25:37', '2018-09-22 21:25:37');
INSERT INTO `audit_hist` VALUES ('67', '18-00030', '444', '', '0003', '工程师', '审价3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-20 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '2', '0.00', null, null, '', null, null, null, '', null, '0.00', '1', null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 21:27:00', '2018-09-22 21:27:00');
INSERT INTO `audit_hist` VALUES ('68', '18-00029', '444', '', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '1', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', null, '', '3', null, null, null, '', null, null, null, '', null, '35.00', '1', null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 21:34:40', '2018-09-22 21:34:40');
INSERT INTO `audit_hist` VALUES ('69', '18-00031', '444', '', '0004', '工程师', '审价4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '0.00', null, null, '', null, null, null, '', null, '33.00', '1', null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 21:38:53', '2018-09-22 21:38:53');
INSERT INTO `audit_hist` VALUES ('70', '18-00032', '555', '', '0001', '工程师', '咨询001', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '0.00', null, null, '', null, null, null, '', null, '49.00', '2', null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 21:44:10', '2018-09-22 21:44:10');
INSERT INTO `audit_hist` VALUES ('71', '18-00033', 'ewtwe', 'wrw', '0002', '工程师', '咨询2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 21:48:26', '2018-09-22 21:48:26');
INSERT INTO `audit_hist` VALUES ('72', '18-00031', '444', '', '0004', '工程师', '审价4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '0.00', null, null, '', null, null, null, '', null, '33.00', '1', null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 21:53:45', '2018-09-22 21:53:45');
INSERT INTO `audit_hist` VALUES ('73', '18-00034', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, '2018-09-22 21:59:12', '2018-09-22 21:59:12');
INSERT INTO `audit_hist` VALUES ('74', '18-00035', 'ewtwe', 'wrw', '11', '工程师', 'fdafd', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '1', null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 22:03:21', '2018-09-22 22:03:21');
INSERT INTO `audit_hist` VALUES ('75', '18-00036', 'ewtwe', 'wrw', '111', '工程师', 'test', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '1', null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 22:08:37', '2018-09-22 22:08:37');
INSERT INTO `audit_hist` VALUES ('76', '18-00037', 'ewtwe', 'wrw', '11', '工程师', 'egaa', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '1', null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 22:10:44', '2018-09-22 22:10:44');
INSERT INTO `audit_hist` VALUES ('77', '18-00038', 'ewtwe', 'wrw', '11', '工程师', 'dsaf', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '1', 'ee1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 22:14:36', '2018-09-22 22:14:36');
INSERT INTO `audit_hist` VALUES ('78', '18-00039', 'ewtwe', 'wrw', 'fda', '工程师', '23r1fsa', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '1', 'cccyy', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 22:16:31', '2018-09-22 22:16:31');
INSERT INTO `audit_hist` VALUES ('79', '18-00031', '444', '', '0004', '工程师', '审价4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '0.00', null, null, '', null, null, null, '', null, '33.00', '1', 'old4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 22:18:43', '2018-09-22 22:18:43');
INSERT INTO `audit_hist` VALUES ('80', '18-00030', '444', '', '0003', '工程师', '审价3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-20 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '0.00', null, null, '', null, null, null, '', null, '56.00', '1', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 22:25:14', '2018-09-22 22:25:14');
INSERT INTO `audit_hist` VALUES ('81', '18-00030', '444', '', '0003', '工程师', '审价3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-20 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '3', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 22:27:46', '2018-09-22 22:27:46');
INSERT INTO `audit_hist` VALUES ('82', '18-00030', '444', '', '0003', '工程师', '审价3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '3', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-22 22:28:46', '2018-09-22 22:28:46');
INSERT INTO `audit_hist` VALUES ('83', '18-00031', '444', '', '0004', '工程师', '审价4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '6789.00', '5436.00', '234.00', '1587.00', '1353.00', '0.20', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '0.00', null, null, '', null, null, null, '', null, '90.00', '1', 'old4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:16:00', '2018-09-23 08:16:00');
INSERT INTO `audit_hist` VALUES ('84', '18-00028', '444', '', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '1', '1', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, null, '1', '审价old', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:16:00', '2018-09-23 08:16:00');
INSERT INTO `audit_hist` VALUES ('85', '18-00029', '444', '', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '1', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', null, '', '3', null, null, null, '', null, null, null, '', null, '35.00', '1', null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:16:00', '2018-09-23 08:16:00');
INSERT INTO `audit_hist` VALUES ('86', '18-00030', '444', '', '0003', '工程师', '审价3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '3', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:16:00', '2018-09-23 08:16:00');
INSERT INTO `audit_hist` VALUES ('87', '18-00031', '444', '', '0004', '工程师', '审价4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '6789.00', '5436.00', '234.00', '1587.00', '1353.00', '0.20', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '54.94', null, null, '', null, null, null, '', null, '90.00', '1', 'old4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:16:00', '2018-09-23 08:16:00');
INSERT INTO `audit_hist` VALUES ('88', '18-00029', '444', '', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '1', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '6789.00', '5436.00', '234.00', '1587.00', '1353.00', '0.20', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', null, '', '3', '0.00', null, null, '', null, null, null, '', null, '35.00', '1', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:20:37', '2018-09-23 08:20:37');
INSERT INTO `audit_hist` VALUES ('89', '18-00028', '444', '', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '1', '1', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, null, '1', '审价old', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:20:37', '2018-09-23 08:20:37');
INSERT INTO `audit_hist` VALUES ('90', '18-00029', '444', '', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '1', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '6789.00', '5436.00', '234.00', '1587.00', '1353.00', '0.20', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', null, '', '3', '2376.15', null, null, '', null, null, null, '', null, '35.00', '1', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:20:37', '2018-09-23 08:20:37');
INSERT INTO `audit_hist` VALUES ('91', '18-00030', '444', '', '0003', '工程师', '审价3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '3', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:20:37', '2018-09-23 08:20:37');
INSERT INTO `audit_hist` VALUES ('92', '18-00031', '444', '', '0004', '工程师', '审价4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '6789.00', '5436.00', '234.00', '1587.00', '1353.00', '0.20', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '54.94', null, null, '', null, null, null, '', null, '90.00', '1', 'old4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:20:37', '2018-09-23 08:20:37');
INSERT INTO `audit_hist` VALUES ('93', '18-00028', '444', '', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '1', '1', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '6789.00', '0.00', '0.00', '6789.00', '6789.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '2', '0.00', null, null, '', null, null, null, '', null, '100.00', '1', '审价old', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:24:15', '2018-09-23 08:24:15');
INSERT INTO `audit_hist` VALUES ('94', '18-00028', '444', '', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '1', '1', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '6789.00', '0.00', '0.00', '6789.00', '6789.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '2', '100.00', null, null, '', null, null, null, '', null, '100.00', '1', '审价old', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:24:15', '2018-09-23 08:24:15');
INSERT INTO `audit_hist` VALUES ('95', '18-00029', '444', '', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '1', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '6789.00', '5436.00', '234.00', '1587.00', '1353.00', '0.20', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '3', '2376.15', null, null, '', null, null, null, '', null, '35.00', '1', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:24:15', '2018-09-23 08:24:15');
INSERT INTO `audit_hist` VALUES ('96', '18-00030', '444', '', '0003', '工程师', '审价3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '3', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:24:15', '2018-09-23 08:24:15');
INSERT INTO `audit_hist` VALUES ('97', '18-00031', '444', '', '0004', '工程师', '审价4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '6789.00', '5436.00', '234.00', '1587.00', '1353.00', '0.20', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '54.94', null, null, '', null, null, null, '', null, '90.00', '1', 'old4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:24:15', '2018-09-23 08:24:15');
INSERT INTO `audit_hist` VALUES ('98', '18-00033', 'ewtwe', 'wrw', '0002', '工程师', '咨询2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '6789.00', '5436.00', '234.00', '1587.00', '1353.00', '0.20', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '0.00', null, null, '', null, null, null, '', null, '2.00', '2', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:27:17', '2018-09-23 08:27:17');
INSERT INTO `audit_hist` VALUES ('99', '18-00033', 'ewtwe', 'wrw', '0002', '工程师', '咨询2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '6789.00', '5436.00', '234.00', '1587.00', '1353.00', '0.20', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '1.22', null, null, '', null, null, null, '', null, '2.00', '2', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 08:27:17', '2018-09-23 08:27:17');
INSERT INTO `audit_hist` VALUES ('100', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '0.00', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:33:56', '2018-09-23 10:33:56');
INSERT INTO `audit_hist` VALUES ('101', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:33:56', '2018-09-23 10:33:56');
INSERT INTO `audit_hist` VALUES ('102', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-03 00:00:00', '', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '3', '0.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:34:53', '2018-09-23 10:34:53');
INSERT INTO `audit_hist` VALUES ('103', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:34:53', '2018-09-23 10:34:53');
INSERT INTO `audit_hist` VALUES ('104', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-03 00:00:00', '', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:34:53', '2018-09-23 10:34:53');
INSERT INTO `audit_hist` VALUES ('108', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:58:55', '2018-09-23 10:58:55');
INSERT INTO `audit_hist` VALUES ('109', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '12.50', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:58:55', '2018-09-23 10:58:55');
INSERT INTO `audit_hist` VALUES ('110', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-03 00:00:00', '', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '37.50', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:58:55', '2018-09-23 10:58:55');
INSERT INTO `audit_hist` VALUES ('111', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 10:58:55', '2018-09-23 10:58:55');
INSERT INTO `audit_hist` VALUES ('112', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:00:19', '2018-09-23 11:00:19');
INSERT INTO `audit_hist` VALUES ('113', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '12.50', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:00:19', '2018-09-23 11:00:19');
INSERT INTO `audit_hist` VALUES ('114', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-03 00:00:00', '', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '37.50', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:00:19', '2018-09-23 11:00:19');
INSERT INTO `audit_hist` VALUES ('115', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:00:19', '2018-09-23 11:00:19');
INSERT INTO `audit_hist` VALUES ('116', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '80.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:00:19', '2018-09-23 11:00:19');
INSERT INTO `audit_hist` VALUES ('117', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:06', '2018-09-23 11:01:06');
INSERT INTO `audit_hist` VALUES ('118', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '12.50', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:06', '2018-09-23 11:01:06');
INSERT INTO `audit_hist` VALUES ('119', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-03 00:00:00', '', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '37.50', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:06', '2018-09-23 11:01:06');
INSERT INTO `audit_hist` VALUES ('120', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:06', '2018-09-23 11:01:06');
INSERT INTO `audit_hist` VALUES ('121', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '30.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:06', '2018-09-23 11:01:06');
INSERT INTO `audit_hist` VALUES ('122', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '50.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:06', '2018-09-23 11:01:06');
INSERT INTO `audit_hist` VALUES ('123', '18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:40', '2018-09-23 11:01:40');
INSERT INTO `audit_hist` VALUES ('124', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '12.50', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:40', '2018-09-23 11:01:40');
INSERT INTO `audit_hist` VALUES ('125', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-03 00:00:00', '', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '37.50', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:40', '2018-09-23 11:01:40');
INSERT INTO `audit_hist` VALUES ('126', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:40', '2018-09-23 11:01:40');
INSERT INTO `audit_hist` VALUES ('127', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '30.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:40', '2018-09-23 11:01:40');
INSERT INTO `audit_hist` VALUES ('128', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '50.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:40', '2018-09-23 11:01:40');
INSERT INTO `audit_hist` VALUES ('129', '18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:01:40', '2018-09-23 11:01:40');
INSERT INTO `audit_hist` VALUES ('130', '18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:03:11', '2018-09-23 11:03:11');
INSERT INTO `audit_hist` VALUES ('131', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '12.50', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:03:14', '2018-09-23 11:03:14');
INSERT INTO `audit_hist` VALUES ('132', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-03 00:00:00', '', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '37.50', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:03:14', '2018-09-23 11:03:14');
INSERT INTO `audit_hist` VALUES ('133', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:03:14', '2018-09-23 11:03:14');
INSERT INTO `audit_hist` VALUES ('134', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '30.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:03:14', '2018-09-23 11:03:14');
INSERT INTO `audit_hist` VALUES ('135', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '50.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:03:14', '2018-09-23 11:03:14');
INSERT INTO `audit_hist` VALUES ('136', '18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:03:14', '2018-09-23 11:03:14');
INSERT INTO `audit_hist` VALUES ('137', '18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:03:14', '2018-09-23 11:03:14');
INSERT INTO `audit_hist` VALUES ('138', '18-00047', '0001', 'ht1', '0008', '工程师', '投资监理8', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '进行中', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:12', '2018-09-23 11:04:12');
INSERT INTO `audit_hist` VALUES ('139', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '12.50', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:12', '2018-09-23 11:04:12');
INSERT INTO `audit_hist` VALUES ('140', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-03 00:00:00', '', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '37.50', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:12', '2018-09-23 11:04:12');
INSERT INTO `audit_hist` VALUES ('141', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:12', '2018-09-23 11:04:12');
INSERT INTO `audit_hist` VALUES ('142', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '30.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:12', '2018-09-23 11:04:12');
INSERT INTO `audit_hist` VALUES ('143', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '50.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:12', '2018-09-23 11:04:12');
INSERT INTO `audit_hist` VALUES ('144', '18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:12', '2018-09-23 11:04:12');
INSERT INTO `audit_hist` VALUES ('145', '18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:12', '2018-09-23 11:04:12');
INSERT INTO `audit_hist` VALUES ('146', '18-00047', '0001', 'ht1', '0008', '工程师', '投资监理8', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '进行中', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:12', '2018-09-23 11:04:12');
INSERT INTO `audit_hist` VALUES ('147', '18-00048', '0001', 'ht1', '0009', '工程师', '投资监理9', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '130.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '有问题', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:56', '2018-09-23 11:04:56');
INSERT INTO `audit_hist` VALUES ('148', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '12.50', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:56', '2018-09-23 11:04:56');
INSERT INTO `audit_hist` VALUES ('149', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-03 00:00:00', '', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '37.50', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:56', '2018-09-23 11:04:56');
INSERT INTO `audit_hist` VALUES ('150', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:56', '2018-09-23 11:04:56');
INSERT INTO `audit_hist` VALUES ('151', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '30.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:56', '2018-09-23 11:04:56');
INSERT INTO `audit_hist` VALUES ('152', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '50.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:56', '2018-09-23 11:04:56');
INSERT INTO `audit_hist` VALUES ('153', '18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:56', '2018-09-23 11:04:56');
INSERT INTO `audit_hist` VALUES ('154', '18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:56', '2018-09-23 11:04:56');
INSERT INTO `audit_hist` VALUES ('155', '18-00047', '0001', 'ht1', '0008', '工程师', '投资监理8', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '进行中', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:56', '2018-09-23 11:04:56');
INSERT INTO `audit_hist` VALUES ('156', '18-00048', '0001', 'ht1', '0009', '工程师', '投资监理9', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '130.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '有问题', '100.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:04:56', '2018-09-23 11:04:56');
INSERT INTO `audit_hist` VALUES ('157', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '20.00', '0.00', '0.00', '20.00', '20.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:05:39', '2018-09-23 11:05:39');
INSERT INTO `audit_hist` VALUES ('158', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '12.50', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:05:39', '2018-09-23 11:05:39');
INSERT INTO `audit_hist` VALUES ('159', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-03 00:00:00', '', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '37.50', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:05:39', '2018-09-23 11:05:39');
INSERT INTO `audit_hist` VALUES ('160', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '20.00', '0.00', '0.00', '20.00', '20.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '16.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:05:39', '2018-09-23 11:05:39');
INSERT INTO `audit_hist` VALUES ('161', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '24.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:05:39', '2018-09-23 11:05:39');
INSERT INTO `audit_hist` VALUES ('162', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '40.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:05:39', '2018-09-23 11:05:39');
INSERT INTO `audit_hist` VALUES ('163', '18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:05:40', '2018-09-23 11:05:40');
INSERT INTO `audit_hist` VALUES ('164', '18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:05:40', '2018-09-23 11:05:40');
INSERT INTO `audit_hist` VALUES ('165', '18-00047', '0001', 'ht1', '0008', '工程师', '投资监理8', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '进行中', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:05:40', '2018-09-23 11:05:40');
INSERT INTO `audit_hist` VALUES ('166', '18-00048', '0001', 'ht1', '0009', '工程师', '投资监理9', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '130.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '有问题', '100.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:05:40', '2018-09-23 11:05:40');
INSERT INTO `audit_hist` VALUES ('167', '18-00047', '0001', 'ht1', '0008', '工程师', '投资监理8', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '120.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '进行中', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:06:09', '2018-09-23 11:06:09');
INSERT INTO `audit_hist` VALUES ('168', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '12.50', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:06:09', '2018-09-23 11:06:09');
INSERT INTO `audit_hist` VALUES ('169', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-03 00:00:00', '', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '37.50', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:06:09', '2018-09-23 11:06:09');
INSERT INTO `audit_hist` VALUES ('170', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '20.00', '0.00', '0.00', '20.00', '20.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '16.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:06:09', '2018-09-23 11:06:09');
INSERT INTO `audit_hist` VALUES ('171', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '24.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:06:09', '2018-09-23 11:06:09');
INSERT INTO `audit_hist` VALUES ('172', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '40.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:06:09', '2018-09-23 11:06:09');
INSERT INTO `audit_hist` VALUES ('173', '18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:06:09', '2018-09-23 11:06:09');
INSERT INTO `audit_hist` VALUES ('174', '18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:06:09', '2018-09-23 11:06:09');
INSERT INTO `audit_hist` VALUES ('175', '18-00047', '0001', 'ht1', '0008', '工程师', '投资监理8', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '120.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '进行中', '48.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:06:09', '2018-09-23 11:06:09');
INSERT INTO `audit_hist` VALUES ('176', '18-00048', '0001', 'ht1', '0009', '工程师', '投资监理9', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '130.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '有问题', '52.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:06:09', '2018-09-23 11:06:09');
INSERT INTO `audit_hist` VALUES ('177', '18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '80.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:24:11', '2018-09-23 11:24:11');
INSERT INTO `audit_hist` VALUES ('178', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '12.50', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:24:11', '2018-09-23 11:24:11');
INSERT INTO `audit_hist` VALUES ('179', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-03 00:00:00', '', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '37.50', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:24:11', '2018-09-23 11:24:11');
INSERT INTO `audit_hist` VALUES ('180', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '20.00', '0.00', '0.00', '20.00', '20.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '16.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:24:11', '2018-09-23 11:24:11');
INSERT INTO `audit_hist` VALUES ('181', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '24.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:24:11', '2018-09-23 11:24:11');
INSERT INTO `audit_hist` VALUES ('182', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '40.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:24:11', '2018-09-23 11:24:11');
INSERT INTO `audit_hist` VALUES ('183', '18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:24:11', '2018-09-23 11:24:11');
INSERT INTO `audit_hist` VALUES ('184', '18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '80.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '90.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:24:11', '2018-09-23 11:24:11');
INSERT INTO `audit_hist` VALUES ('185', '18-00047', '0001', 'ht1', '0008', '工程师', '投资监理8', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '120.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '进行中', '48.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:24:11', '2018-09-23 11:24:11');
INSERT INTO `audit_hist` VALUES ('186', '18-00048', '0001', 'ht1', '0009', '工程师', '投资监理9', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '130.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '有问题', '52.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:24:11', '2018-09-23 11:24:11');
INSERT INTO `audit_hist` VALUES ('205', '18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '70.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '90.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:38:24', '2018-09-23 11:38:24');
INSERT INTO `audit_hist` VALUES ('206', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '12.50', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:38:24', '2018-09-23 11:38:24');
INSERT INTO `audit_hist` VALUES ('207', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-03 00:00:00', '', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '37.50', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:38:24', '2018-09-23 11:38:24');
INSERT INTO `audit_hist` VALUES ('208', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '20.00', '0.00', '0.00', '20.00', '20.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '16.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:38:24', '2018-09-23 11:38:24');
INSERT INTO `audit_hist` VALUES ('209', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '24.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:38:24', '2018-09-23 11:38:24');
INSERT INTO `audit_hist` VALUES ('210', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '40.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:38:24', '2018-09-23 11:38:24');
INSERT INTO `audit_hist` VALUES ('211', '18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:38:57', '2018-09-23 11:38:57');
INSERT INTO `audit_hist` VALUES ('212', '18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '70.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '90.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:40:07', '2018-09-23 11:40:07');
INSERT INTO `audit_hist` VALUES ('213', '18-00047', '0001', 'ht1', '0008', '工程师', '投资监理8', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '120.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '进行中', '48.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:40:07', '2018-09-23 11:40:07');
INSERT INTO `audit_hist` VALUES ('214', '18-00048', '0001', 'ht1', '0009', '工程师', '投资监理9', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '130.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '有问题', '52.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 11:40:07', '2018-09-23 11:40:07');
INSERT INTO `audit_hist` VALUES ('245', '18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '80.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:04:46', '2018-09-23 12:04:46');
INSERT INTO `audit_hist` VALUES ('246', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '12.50', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:04:46', '2018-09-23 12:04:46');
INSERT INTO `audit_hist` VALUES ('247', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-03 00:00:00', '', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '37.50', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:04:46', '2018-09-23 12:04:46');
INSERT INTO `audit_hist` VALUES ('248', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '20.00', '0.00', '0.00', '20.00', '20.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '16.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:04:46', '2018-09-23 12:04:46');
INSERT INTO `audit_hist` VALUES ('249', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '24.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:04:46', '2018-09-23 12:04:46');
INSERT INTO `audit_hist` VALUES ('250', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '40.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:04:46', '2018-09-23 12:04:46');
INSERT INTO `audit_hist` VALUES ('251', '18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '80.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '48.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:04:51', '2018-09-23 12:04:51');
INSERT INTO `audit_hist` VALUES ('252', '18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '70.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '42.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:04:51', '2018-09-23 12:04:51');
INSERT INTO `audit_hist` VALUES ('253', '18-00047', '0001', 'ht1', '0008', '工程师', '投资监理8', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '120.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '进行中', '48.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:04:51', '2018-09-23 12:04:51');
INSERT INTO `audit_hist` VALUES ('254', '18-00048', '0001', 'ht1', '0009', '工程师', '投资监理9', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '130.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '有问题', '52.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:04:52', '2018-09-23 12:04:52');
INSERT INTO `audit_hist` VALUES ('255', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '37.50', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:06:52', '2018-09-23 12:06:52');
INSERT INTO `audit_hist` VALUES ('256', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.50', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:06:52', '2018-09-23 12:06:52');
INSERT INTO `audit_hist` VALUES ('257', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '1.50', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:06:52', '2018-09-23 12:06:52');
INSERT INTO `audit_hist` VALUES ('258', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '20.00', '0.00', '0.00', '20.00', '20.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '1.40', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:06:52', '2018-09-23 12:06:52');
INSERT INTO `audit_hist` VALUES ('259', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '2.10', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:06:52', '2018-09-23 12:06:52');
INSERT INTO `audit_hist` VALUES ('260', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '3.50', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:06:52', '2018-09-23 12:06:52');
INSERT INTO `audit_hist` VALUES ('261', '18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '80.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '6.40', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:06:52', '2018-09-23 12:06:52');
INSERT INTO `audit_hist` VALUES ('262', '18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '70.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '5.60', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:06:52', '2018-09-23 12:06:52');
INSERT INTO `audit_hist` VALUES ('263', '18-00047', '0001', 'ht1', '0008', '工程师', '投资监理8', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '120.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '进行中', '10.80', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:06:52', '2018-09-23 12:06:52');
INSERT INTO `audit_hist` VALUES ('264', '18-00048', '0001', 'ht1', '0009', '工程师', '投资监理9', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '130.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '有问题', '11.70', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:06:52', '2018-09-23 12:06:52');
INSERT INTO `audit_hist` VALUES ('265', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '1', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '1.50', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:48:52', '2018-09-23 12:48:52');
INSERT INTO `audit_hist` VALUES ('266', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '10.00', '6.00', '2.00', '6.00', '4.00', '0.40', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:48:52', '2018-09-23 12:48:52');
INSERT INTO `audit_hist` VALUES ('267', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '1', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:48:52', '2018-09-23 12:48:52');
INSERT INTO `audit_hist` VALUES ('268', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '20.00', '0.00', '0.00', '20.00', '20.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:48:52', '2018-09-23 12:48:52');
INSERT INTO `audit_hist` VALUES ('269', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:48:52', '2018-09-23 12:48:52');
INSERT INTO `audit_hist` VALUES ('270', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:48:52', '2018-09-23 12:48:52');
INSERT INTO `audit_hist` VALUES ('271', '18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '80.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:48:52', '2018-09-23 12:48:52');
INSERT INTO `audit_hist` VALUES ('272', '18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '70.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:48:52', '2018-09-23 12:48:52');
INSERT INTO `audit_hist` VALUES ('273', '18-00047', '0001', 'ht1', '0008', '工程师', '投资监理8', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '120.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '进行中', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:48:52', '2018-09-23 12:48:52');
INSERT INTO `audit_hist` VALUES ('274', '18-00048', '0001', 'ht1', '0009', '工程师', '投资监理9', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '130.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '有问题', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:48:52', '2018-09-23 12:48:52');
INSERT INTO `audit_hist` VALUES ('275', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '6789.00', '5436.00', '234.00', '1587.00', '1353.00', '0.20', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '0.50', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:50:21', '2018-09-23 12:50:21');
INSERT INTO `audit_hist` VALUES ('276', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '6789.00', '5436.00', '234.00', '1587.00', '1353.00', '0.20', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '54.99', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:50:21', '2018-09-23 12:50:21');
INSERT INTO `audit_hist` VALUES ('277', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '1', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:50:21', '2018-09-23 12:50:21');
INSERT INTO `audit_hist` VALUES ('278', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '20.00', '0.00', '0.00', '20.00', '20.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:50:21', '2018-09-23 12:50:21');
INSERT INTO `audit_hist` VALUES ('279', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:50:21', '2018-09-23 12:50:21');
INSERT INTO `audit_hist` VALUES ('280', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:50:21', '2018-09-23 12:50:21');
INSERT INTO `audit_hist` VALUES ('281', '18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '80.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:50:21', '2018-09-23 12:50:21');
INSERT INTO `audit_hist` VALUES ('282', '18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '70.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:50:21', '2018-09-23 12:50:21');
INSERT INTO `audit_hist` VALUES ('283', '18-00047', '0001', 'ht1', '0008', '工程师', '投资监理8', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '120.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '进行中', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:50:21', '2018-09-23 12:50:21');
INSERT INTO `audit_hist` VALUES ('284', '18-00048', '0001', 'ht1', '0009', '工程师', '投资监理9', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '130.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '有问题', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:50:21', '2018-09-23 12:50:21');
INSERT INTO `audit_hist` VALUES ('285', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '2', '0.00', null, null, '', null, null, null, '', null, '30.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:51:11', '2018-09-23 12:51:11');
INSERT INTO `audit_hist` VALUES ('286', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '6789.00', '5436.00', '234.00', '1587.00', '1353.00', '0.20', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '54.99', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:51:11', '2018-09-23 12:51:11');
INSERT INTO `audit_hist` VALUES ('287', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '1', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:51:11', '2018-09-23 12:51:11');
INSERT INTO `audit_hist` VALUES ('288', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '20.00', '0.00', '0.00', '20.00', '20.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:51:11', '2018-09-23 12:51:11');
INSERT INTO `audit_hist` VALUES ('289', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:51:11', '2018-09-23 12:51:11');
INSERT INTO `audit_hist` VALUES ('290', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '2', '30.00', null, null, '', null, null, null, '', null, '30.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:51:11', '2018-09-23 12:51:11');
INSERT INTO `audit_hist` VALUES ('291', '18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '80.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:51:11', '2018-09-23 12:51:11');
INSERT INTO `audit_hist` VALUES ('292', '18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '70.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:51:11', '2018-09-23 12:51:11');
INSERT INTO `audit_hist` VALUES ('293', '18-00047', '0001', 'ht1', '0008', '工程师', '投资监理8', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '120.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '进行中', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:51:11', '2018-09-23 12:51:11');
INSERT INTO `audit_hist` VALUES ('294', '18-00048', '0001', 'ht1', '0009', '工程师', '投资监理9', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '130.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '有问题', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:51:11', '2018-09-23 12:51:11');
INSERT INTO `audit_hist` VALUES ('295', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '30.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:52:01', '2018-09-23 12:52:01');
INSERT INTO `audit_hist` VALUES ('296', '18-00040', '0001', 'ht1', '0001', '工程师', '审价1', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-02 00:00:00', '', '1', '60.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '6789.00', '5436.00', '234.00', '1587.00', '1353.00', '0.20', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '1', '54.99', null, null, '', null, null, null, '', null, '90.00', '1', 'sj1', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:52:01', '2018-09-23 12:52:01');
INSERT INTO `audit_hist` VALUES ('297', '18-00041', '0001', 'ht1', '0002', '工程师', '审价2', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '1', '1', '7.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '25.00', '3.00', '8.00', '5.00', '0.17', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '3', '21.00', null, null, '', null, null, null, '', null, '70.00', '1', 'sj2', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:52:01', '2018-09-23 12:52:01');
INSERT INTO `audit_hist` VALUES ('298', '18-00042', '0001', 'ht1', '0003', '工程师', '咨询3', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-04 00:00:00', '', '2', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '20.00', '0.00', '0.00', '20.00', '20.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx3', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:52:01', '2018-09-23 12:52:01');
INSERT INTO `audit_hist` VALUES ('299', '18-00043', '0001', 'ht1', '0004', '工程师', '咨询4', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '2018-09-06 00:00:00', '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '30.00', '0.00', '0.00', '30.00', '30.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '2', 'zx4', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:52:01', '2018-09-23 12:52:01');
INSERT INTO `audit_hist` VALUES ('300', '18-00044', '0001', 'ht1', '0005', '工程师', '咨询5', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '50.00', '0.00', '0.00', '50.00', '50.00', '1.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '30.00', '2', 'zx5', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:52:01', '2018-09-23 12:52:01');
INSERT INTO `audit_hist` VALUES ('301', '18-00045', '0001', 'ht1', '0006', '工程师', '控制价编制6', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '80.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:52:01', '2018-09-23 12:52:01');
INSERT INTO `audit_hist` VALUES ('302', '18-00046', '0001', 'ht1', '0007', '工程师', '控制价编制7', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '0.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '70.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '4', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:52:01', '2018-09-23 12:52:01');
INSERT INTO `audit_hist` VALUES ('303', '18-00047', '0001', 'ht1', '0008', '工程师', '投资监理8', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '120.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '进行中', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:52:01', '2018-09-23 12:52:01');
INSERT INTO `audit_hist` VALUES ('304', '18-00048', '0001', 'ht1', '0009', '工程师', '投资监理9', null, null, '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', '', '', '', '', null, null, '', '', null, '', '', '130.00', null, null, null, null, '', null, null, '', null, null, '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', null, null, '', null, null, null, '', null, null, null, '', null, null, null, '', null, '有问题', '0.00', '', '', '0.00', null, null, '', null, null, null, '', null, '0.00', '5', '', null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-09-23 12:52:01', '2018-09-23 12:52:01');

-- ----------------------------
-- Table structure for `audit_hist_2016`
-- ----------------------------
DROP TABLE IF EXISTS `audit_hist_2016`;
CREATE TABLE `audit_hist_2016` (
  `AUDIT_HIS_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '履历主键',
  `AUDIT_NO` varchar(8) NOT NULL COMMENT '审价编号YYYY-NNN  自动采番',
  `REPORT_NO` varchar(16) DEFAULT NULL COMMENT '报告文号',
  `PROJECT_TYPE` varchar(1) DEFAULT NULL COMMENT '项目性质1:土建,2:安装,3:房修,4:园林,5:咨询,6：限价，7:其他',
  `PROJECT_STATUS` varchar(1) DEFAULT NULL COMMENT '项目进度1：在审，2：补交资料，3：初稿已出，4：审定单已出，',
  `PROJECT_MANAGER` varchar(6) DEFAULT NULL COMMENT '担当者',
  `CONTRACT_NO` varchar(16) DEFAULT NULL COMMENT '合同编号',
  `PROJECT_NAME` varchar(80) DEFAULT NULL COMMENT '项目名称',
  `AGENT_NO` varchar(4) DEFAULT NULL COMMENT '委托公司代码',
  `AGENT_CO_NAME` varchar(40) DEFAULT NULL COMMENT '委托公司名称',
  `AGENT_CO_MANAGER` varchar(6) DEFAULT NULL COMMENT '委托公司负责人',
  `AGENT_CO_MANAGER_TEL` varchar(30) DEFAULT NULL COMMENT '委托公司负责人电话',
  `AGENT_CO_STAFF` varchar(6) DEFAULT NULL COMMENT '委托公司项目负责人',
  `AGENT_CO_STAFF_TEL` varchar(30) DEFAULT NULL COMMENT '委托公司项目负责人电话',
  `AGENT_CO_POST_ADDRESS` varchar(80) DEFAULT NULL COMMENT '委托公司快递地址',
  `AGENT_CO_MAIL` varchar(60) DEFAULT NULL COMMENT '委托公司负责人邮箱',
  `PROF_NO` varchar(4) DEFAULT NULL COMMENT '专业公司代码',
  `PROF_CO_NAME` varchar(40) DEFAULT NULL COMMENT '专业公司名称',
  `PROF_CO_MANAGER` varchar(6) DEFAULT NULL COMMENT '专业公司负责人',
  `PROF_CO_MANAGER_TEL` varchar(30) DEFAULT NULL COMMENT '专业公司负责人电话',
  `PROF_CO_STAFF` varchar(6) DEFAULT NULL COMMENT '专业公司项目负责人',
  `PROF_CO_STAFF_TEL` varchar(30) DEFAULT NULL COMMENT '专业公司项目负责人电话',
  `PROF_CO_POST_ADDRESS` varchar(80) DEFAULT NULL COMMENT '专业公司地址',
  `PROF_CO_MAIL` varchar(60) DEFAULT NULL COMMENT '专业公司邮箱',
  `CONTRACT_CO_NO` varchar(4) DEFAULT NULL COMMENT '承包公司代码',
  `CONTRACT_CO_NAME` varchar(40) DEFAULT NULL COMMENT '承包公司名称',
  `CONTRACT_CO_MANAGER` varchar(6) DEFAULT NULL COMMENT '承包公司负责人',
  `CONTRACT_CO_MANAGER_TEL` varchar(30) DEFAULT NULL COMMENT '承包公司负责人电话',
  `CONTRACT_CO_STAFF` varchar(6) DEFAULT NULL COMMENT '承包公司项目负责人',
  `CONTRACT_CO_STAFF_TEL` varchar(30) DEFAULT NULL COMMENT '承包公司项目负责人电话',
  `CONTRACT_CO_POST_ADDRESS` varchar(80) DEFAULT NULL COMMENT '承包公司快递地址',
  `CONTRACT_CO_MAIL` varchar(60) DEFAULT NULL COMMENT '承包公司负责人邮箱',
  `DOC_POST_NO` varchar(12) DEFAULT NULL COMMENT '资料快递编号',
  `DOC_ARR_DATE` datetime DEFAULT NULL COMMENT '资料到达日期',
  `DOC_MAIL_DATE` datetime DEFAULT NULL COMMENT '资料邮箱时间',
  `VERIFY_DOC_SEND_DATE` datetime DEFAULT NULL COMMENT '审定单发出日期',
  `VERIFY_DOC_REPLY_DATE` datetime DEFAULT NULL COMMENT '审定单回复日期',
  `LAST_REPORT_DATE` datetime DEFAULT NULL COMMENT '最终报告日期',
  `REPORT_POST_NO` varchar(12) DEFAULT NULL COMMENT '报告快递编号',
  `VERIFY_PER_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '送审金额（元）',
  `VERIFY_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '审定金额（元）',
  `VERIFY_DIFF` decimal(14,2) DEFAULT NULL COMMENT '净核减(送审金额 - 审定金额)',
  `VERIFY_INCREASE` decimal(10,0) DEFAULT NULL COMMENT '核增',
  `VERIFY_DECREASE` decimal(14,2) DEFAULT NULL COMMENT '核减(净核减  +核增)',
  `VERIFY_DIFF_REASON` varchar(200) DEFAULT NULL COMMENT '增减理由',
  `RECEIPT1_AMOUNT_A` decimal(7,0) DEFAULT NULL COMMENT '发票开票金额甲方',
  `RECEIPT1_AMOUNT_B` decimal(7,0) DEFAULT NULL COMMENT '发票开票金额乙方',
  `RECEIPT1_AMOUNT_TOTAL` decimal(7,0) DEFAULT NULL COMMENT '发票开票金额合计,金额（甲方）+金额（乙方）',
  `RECEIPT1_DATE` datetime DEFAULT NULL COMMENT '发票开票日期',
  `RECEIPT1_STAFF` varchar(6) DEFAULT NULL COMMENT '发票开票人',
  `RECEIPT1_NO` varchar(8) DEFAULT NULL COMMENT '发票号码',
  `VALUE_DATE` datetime DEFAULT NULL COMMENT '发票到账日期',
  `RECEIPT2_RECEIVER` varchar(6) DEFAULT NULL COMMENT '发票接受人',
  `RECEIPT2_NO` varchar(4) DEFAULT NULL COMMENT '发票签收单编号',
  `RECEIPT2_DATE` datetime DEFAULT NULL COMMENT '发票签收时间',
  `RECEIPT2_POST_NO` varchar(12) DEFAULT NULL COMMENT '发票快递编号',
  `RECEIPT2_POST_DATE` datetime DEFAULT NULL COMMENT '发票快递时间',
  `MEMO1` varchar(40) DEFAULT NULL COMMENT '备注1',
  `MEMO2` varchar(40) DEFAULT NULL COMMENT '备注2',
  `MEMO3` varchar(40) DEFAULT NULL COMMENT '备注3',
  `LATEST_FLG` varchar(1) DEFAULT NULL COMMENT '最新化',
  `DELETE_FLG` varchar(1) DEFAULT NULL COMMENT '删除',
  `UPDATE_USER` varchar(6) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新建日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(200) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) DEFAULT NULL COMMENT '备用5',
  PRIMARY KEY (`AUDIT_HIS_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of audit_hist_2016
-- ----------------------------

-- ----------------------------
-- Table structure for `bid`
-- ----------------------------
DROP TABLE IF EXISTS `bid`;
CREATE TABLE `bid` (
  `BID_NO` varchar(18) NOT NULL DEFAULT '',
  `CNTRCT_NO` varchar(20) DEFAULT NULL COMMENT '合同编号',
  `PROJECT_DEVIEW_DATE` datetime DEFAULT NULL COMMENT '承接项目日期：',
  `CNTRCT_TYPE` varchar(2) DEFAULT NULL COMMENT '合同类别',
  `PROJECT_NAME` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `PROJECT_PROPERTY` varchar(1) DEFAULT NULL COMMENT '项目性质',
  `PROJ_APPROVAL` varchar(128) DEFAULT NULL COMMENT '工程概况批文',
  `PROJECT_AUTH` varchar(6) DEFAULT NULL COMMENT '会审监管人',
  `PROJECT_MANAGER` varchar(6) DEFAULT NULL COMMENT '担当者',
  `BID_AGENT_PAY` varchar(2) DEFAULT NULL COMMENT '招标代理支付方',
  `BID_AGENT_PAY2` varchar(64) DEFAULT NULL COMMENT '招标代理支付方(其他)',
  `BID_AGENT_PRICE` decimal(11,2) DEFAULT NULL COMMENT '招标代理费',
  `BID_AGENT_PRICE_ACT` decimal(11,2) DEFAULT NULL COMMENT '实收代理费',
  `RECEIPT1_DATE` datetime DEFAULT NULL COMMENT '开票日期',
  `RECEIPT1_VALUE_DATE` datetime DEFAULT NULL COMMENT '到账日期',
  `REGISTE_ST_DATE1` datetime DEFAULT NULL COMMENT '报名日期开始日1',
  `REGISTE_ED_DATE1` datetime DEFAULT NULL COMMENT '报名日期终了日1',
  `REGISTE_ST_DATE2` datetime DEFAULT NULL COMMENT '报名日期开始日2',
  `REGISTE_ED_DATE2` datetime DEFAULT NULL COMMENT '报名日期终了日2',
  `REGISTE_ST_DATE3` datetime DEFAULT NULL COMMENT '报名日期开始日3',
  `REGISTE_ED_DATE3` datetime DEFAULT NULL COMMENT '报名日期终了日3',
  `REGISTE_ST_DATE4` datetime DEFAULT NULL COMMENT '报名日期开始日4',
  `REGISTE_ED_DATE4` datetime DEFAULT NULL COMMENT '报名日期终了日4',
  `REGISTE_ST_DATE5` datetime DEFAULT NULL COMMENT '报名日期开始日5',
  `REGISTE_ED_DATE5` datetime DEFAULT NULL COMMENT '报名日期终了日5',
  `APPLY_REQUIRE` varchar(2000) DEFAULT NULL COMMENT '报名要求',
  `BID_BOND` decimal(11,2) DEFAULT NULL COMMENT '保证金',
  `TENDER_OPEN_DATE` datetime DEFAULT NULL COMMENT '开标时间',
  `TENDER_OPEN_ADDRESS` varchar(200) DEFAULT NULL COMMENT '开标地点',
  `TENDER_VERIFY_DATE` datetime DEFAULT NULL COMMENT '评标时间',
  `BID_AUTH` varchar(6) DEFAULT NULL COMMENT '评审人',
  `BID_LIMIT_PRICE` decimal(11,2) DEFAULT NULL COMMENT '限价',
  `BID_CO_LIST` varchar(200) DEFAULT NULL COMMENT '投标公司列表',
  `BID_EXPERT_LIST` varchar(200) DEFAULT NULL COMMENT '评审专家列表',
  `BID_CO_SEQ` varchar(40) DEFAULT NULL COMMENT '中标公司号',
  `BID_CO_NAME` varchar(1000) DEFAULT NULL COMMENT '中标公司名称',
  `BID_CO_PRICE` decimal(11,2) DEFAULT NULL COMMENT '中标公司标书费',
  `BID_PRICE` decimal(11,2) DEFAULT NULL COMMENT '中标价',
  `BID_PRICE_LIST` varchar(400) DEFAULT NULL,
  `BID_EXPERT_COMMISION` decimal(11,2) DEFAULT NULL COMMENT '专家费',
  `BID_EXPERT_COMMISION_PRE` decimal(11,2) DEFAULT NULL COMMENT '预借专家费',
  `BID_EXPERT_COMMISION_ACT` decimal(11,2) DEFAULT NULL COMMENT '实际专家费',
  `BID_EXPERT_COMMISION_DIFF_DATE` datetime DEFAULT NULL COMMENT '差价退还日期',
  `BID_APPLY_PRICE` decimal(11,2) DEFAULT NULL COMMENT '标书费',
  `BID_EXPERT_COMMISION_APPLY` varchar(6) DEFAULT NULL COMMENT '专家费申请人',
  `BID_EXPERT_COMMISION_APPLY_DATE` datetime DEFAULT NULL COMMENT '专家费申日期',
  `APPLY_FORM_EDIT_DATE` datetime DEFAULT NULL COMMENT '招标文件编制日期',
  `APPLY_FORM_COLLECT_DATE` datetime DEFAULT NULL COMMENT '招标文件统稿日期',
  `APPLY_FORM_VERIFY_DATE` datetime DEFAULT NULL COMMENT '招标公告，文件校对日期',
  `APPLY_FORM_VERIFY` varchar(6) DEFAULT NULL COMMENT '招标公告，文件校对者',
  `APPLY_FORM_FIX_DATE` datetime DEFAULT NULL COMMENT '招标文件定稿日期',
  `APPLY_FORM_BOX_DATE` datetime DEFAULT NULL COMMENT '招标文件装订日期',
  `SUPPORT_DOC_DATE` datetime DEFAULT NULL COMMENT '发送答疑，补充文件日期',
  `BID_NOTICE_ST_DATE` datetime DEFAULT NULL COMMENT '中标公告日期',
  `BID_NOTICE_ED_DATE` datetime DEFAULT NULL COMMENT '中标公告日期2',
  `BID_MESSAGE_DATE` datetime DEFAULT NULL COMMENT '中标通知书发出日',
  `BID_DOC_DELI_DATE1` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期1',
  `BID_DOC_DELI_FILE1` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件1',
  `BID_DOC_DELI_DATE2` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期2',
  `BID_DOC_DELI_FILE2` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件2',
  `BID_DOC_DELI_DATE3` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期3',
  `BID_DOC_DELI_FILE3` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件3',
  `BID_DOC_DELI_DATE4` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期4',
  `BID_DOC_DELI_FILE4` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件4',
  `BID_DOC_DELI_DATE5` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期5',
  `BID_DOC_DELI_FILE5` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件5',
  `BID_DOC_DELI_DATE6` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期6',
  `BID_DOC_DELI_FILE6` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件6',
  `BID_DOC_DELI_DATE7` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期7',
  `BID_DOC_DELI_FILE7` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件7',
  `BID_DOC_DELI_DATE8` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期8',
  `BID_DOC_DELI_FILE8` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件8',
  `BID_DOC_DELI_DATE9` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期9',
  `BID_DOC_DELI_FILE9` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件9',
  `BID_DOC_DELI_DATE10` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期10',
  `BID_DOC_DELI_FILE10` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件10',
  `BID_INFORM_RCV_DATE` datetime DEFAULT NULL COMMENT '中标通知书签收日',
  `BID_INFORM_RCV` varchar(6) DEFAULT NULL COMMENT '中标通知书签收人',
  `BID_VER_DOC_SCAN_DATE` datetime DEFAULT NULL COMMENT '评标报告装订扫描日',
  `BID_VER_DOC_SCAN` varchar(6) DEFAULT NULL COMMENT '评标报告装订扫描人',
  `BID_VER_DOC_DELI_DATE1` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期1',
  `BID_VER_DOC_DELI_FILE1` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件1',
  `BID_VER_DOC_DELI_DATE2` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期2',
  `BID_VER_DOC_DELI_FILE2` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件2',
  `BID_VER_DOC_DELI_DATE3` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期3',
  `BID_VER_DOC_DELI_FILE3` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件3',
  `BID_VER_DOC_DELI_DATE4` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期4',
  `BID_VER_DOC_DELI_FILE4` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件4',
  `BID_VER_DOC_DELI_DATE5` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期5',
  `BID_VER_DOC_DELI_FILE5` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件5',
  `BID_VER_DOC_DELI_DATE6` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期6',
  `BID_VER_DOC_DELI_FILE6` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件6',
  `BID_VER_DOC_DELI_DATE7` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期7',
  `BID_VER_DOC_DELI_FILE7` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件7',
  `BID_VER_DOC_DELI_DATE8` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期8',
  `BID_VER_DOC_DELI_FILE8` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件8',
  `BID_VER_DOC_DELI_DATE9` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期9',
  `BID_VER_DOC_DELI_FILE9` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件9',
  `BID_VER_DOC_DELI_DATE10` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期10',
  `BID_VER_DOC_DELI_FILE10` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件10',
  `PROGRESS_STATUS` varchar(50) DEFAULT NULL COMMENT '项目进度情况',
  `FINISH_STATUS` varchar(4) DEFAULT NULL COMMENT '项目完成情况',
  `FINISH_DATE` datetime DEFAULT NULL COMMENT '项目完成日期',
  `FINISH_NOTE` varchar(200) DEFAULT NULL COMMENT '项目完成情况的备注',
  `STATUS` varchar(4) DEFAULT NULL COMMENT '投标状态',
  `MEMO1` varchar(300) DEFAULT NULL COMMENT '备注',
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(20) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) DEFAULT NULL COMMENT '备用5',
  `RESERVE_DATE1` datetime DEFAULT NULL COMMENT '备用日期1',
  `RESERVE_DATE2` datetime DEFAULT NULL COMMENT '备用日期2',
  `RESERVE_DATE3` datetime DEFAULT NULL COMMENT '备用日期3',
  `RESERVE_DATE4` datetime DEFAULT NULL COMMENT '备用日期4',
  `RESERVE_DATE5` datetime DEFAULT NULL COMMENT '备用日期5',
  `RESERVE_DATE6` datetime DEFAULT NULL COMMENT '备用日期6',
  `RESERVE_DATE7` varchar(20) DEFAULT NULL COMMENT '备用日期7',
  `RESERVE_DATE8` varchar(20) DEFAULT NULL COMMENT '备用日期8',
  `RESERVE_DATE9` varchar(20) DEFAULT NULL COMMENT '备用日期9',
  `RESERVE_DATE10` varchar(20) DEFAULT NULL COMMENT '备用日期10',
  `LATEST_FLG` varchar(1) DEFAULT NULL COMMENT '最新化',
  `DELETE_FLG` varchar(1) DEFAULT NULL COMMENT '删除',
  `UPDATE_USER` varchar(6) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新建日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`BID_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bid
-- ----------------------------

-- ----------------------------
-- Table structure for `bidcntrct`
-- ----------------------------
DROP TABLE IF EXISTS `bidcntrct`;
CREATE TABLE `bidcntrct` (
  `CNTRCT_NO` varchar(20) NOT NULL DEFAULT '' COMMENT '合同编号',
  `CNTRCT_YEAR` varchar(4) DEFAULT NULL COMMENT '合同年份',
  `CNTRCT_NAME` varchar(1000) DEFAULT NULL COMMENT '合同名称',
  `CNTRCT_NM` varchar(100) DEFAULT NULL COMMENT '合同简称',
  `CNTRCT_TYPE` varchar(2) DEFAULT NULL COMMENT '合同类别',
  `BID_COMP_NO` varchar(4) DEFAULT NULL COMMENT '委托单位ID',
  `BID_COMP_NAME` varchar(40) DEFAULT NULL COMMENT '委托单位',
  `CO_MANAGER1` varchar(6) DEFAULT NULL COMMENT '联系人',
  `CO_MANAGER_TEL1` varchar(30) DEFAULT NULL COMMENT '联系方式(电话)',
  `CO_ADDRESS1` varchar(80) DEFAULT NULL COMMENT '联系方式(地址)',
  `CO_MANAGER_EMAIL1` varchar(100) DEFAULT NULL COMMENT '联系人邮箱',
  `CO_TAX` varchar(80) DEFAULT NULL COMMENT '开票信息',
  `CNTRCT_ST_DATE` datetime DEFAULT NULL COMMENT '合同开始时间',
  `CNTRCT_ED_DATE` datetime DEFAULT NULL COMMENT '合同结束时间',
  `CNTRCT_RATE_1` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率1(审价)',
  `CNTRCT_RATE_2` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率2(咨询)',
  `CNTRCT_RATE_3` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率3(清单编制)',
  `CNTRCT_RATE_4` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率4(控制价编制)',
  `CNTRCT_RATE_5` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率5(全过程投资监理)',
  `CNTRCT_RATE_6` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率6',
  `CNTRCT_RATE_7` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率7',
  `CNTRCT_RATE_8` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率8',
  `CNTRCT_RATE_9` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率9',
  `CNTRCT_RATE_10` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率10',
  `CNTRCT_AMOUNT_1` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额1(审价)',
  `CNTRCT_AMOUNT_2` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额2(咨询)',
  `CNTRCT_AMOUNT_3` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额3(清单编制)',
  `CNTRCT_AMOUNT_4` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额4(控制价编制)',
  `CNTRCT_AMOUNT_5` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额5(全过程投资监理)',
  `CNTRCT_AMOUNT_6` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额6',
  `CNTRCT_AMOUNT_7` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额7',
  `CNTRCT_AMOUNT_8` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额8',
  `CNTRCT_AMOUNT_9` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额9',
  `CNTRCT_AMOUNT_10` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额10',
  `CNTRCT_TOTAL_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '委托方收费',
  `CNTRCT_ALL_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '合同金额',
  `CNTRCT_UNPAY_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '未收金额',
  `TRIP_TOTAL_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '差旅合计',
  `ESTIMATE_COST` decimal(14,2) DEFAULT NULL COMMENT '总概算',
  `ESTIMATE_CONSTRUCT_SAFE_COST` decimal(14,2) DEFAULT NULL COMMENT '建安概算（不含物流设备及信息）',
  `PRE_CONSTRUCT_SAFE_COST` decimal(14,2) DEFAULT NULL COMMENT '建安对应预备费',
  `CONSTRUCT_ST_DATE` datetime DEFAULT NULL COMMENT '开工时间',
  `PLAN_CONSTRUCT_ED_DATE` datetime DEFAULT NULL COMMENT '预计完工时间',
  `CONSTRUCT_AREA` decimal(14,2) DEFAULT NULL COMMENT '总建筑面积',
  `EXCUTE_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '执行总费用',
  `CONSTRUCT_SAFE_COUNT` int(8) DEFAULT NULL COMMENT '执行建安（万元）',
  `CONSTRUCT_SAFE_CNTRCT_COST` decimal(14,2) DEFAULT NULL COMMENT '合同价',
  `CONSTRUCT_SAFE_CNTRCT_COST_PAID` decimal(14,2) DEFAULT NULL COMMENT '已支付',
  `CONSTRUCT_SAFE_CNTRCT_COST_CTRL` decimal(14,2) DEFAULT NULL COMMENT '控制价',
  `BUDGETARY_OVERRUN_RISK` int(5) DEFAULT NULL COMMENT '超概的风险度',
  `MONTHLY_REPORT_CNT` int(8) DEFAULT NULL COMMENT '月报',
  `SUGGEST_REPORT_CNT` int(8) DEFAULT NULL COMMENT '建议书',
  `COMM_REPORT_CNT` int(8) DEFAULT NULL COMMENT '联系函',
  `FINISH_AUDIT_CNT` int(8) DEFAULT NULL COMMENT '已完审价',
  `PROJ_PROGRESS_MEET_CNT` int(8) DEFAULT NULL COMMENT '工程例会',
  `PROGRESS_STATUS` varchar(2) DEFAULT NULL COMMENT '大致进度及工作计划',
  `PROJECT_SENIOR_MANAGER` varchar(6) DEFAULT NULL COMMENT '负责人',
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(200) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) DEFAULT NULL COMMENT '备用5',
  `RESERVE6` varchar(20) DEFAULT NULL COMMENT '备用6',
  `RESERVE7` decimal(14,2) DEFAULT NULL COMMENT '备用7',
  `RESERVE8` decimal(14,2) DEFAULT NULL COMMENT '备用8',
  `RESERVE9` datetime DEFAULT NULL COMMENT '备用9',
  `RESERVE10` datetime DEFAULT NULL COMMENT '备用10',
  `LATEST_FLG` varchar(1) DEFAULT NULL COMMENT '最新化',
  `DELETE_FLG` varchar(1) DEFAULT NULL COMMENT '删除',
  `UPDATE_USER` varchar(6) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新增日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`CNTRCT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bidcntrct
-- ----------------------------

-- ----------------------------
-- Table structure for `bidcntrct_hist`
-- ----------------------------
DROP TABLE IF EXISTS `bidcntrct_hist`;
CREATE TABLE `bidcntrct_hist` (
  `BID_CNTRCT_HIS_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '履历主键',
  `CNTRCT_NO` varchar(20) DEFAULT NULL COMMENT '合同编号',
  `CNTRCT_YEAR` varchar(4) DEFAULT NULL COMMENT '合同年份',
  `CNTRCT_NAME` varchar(1000) DEFAULT NULL COMMENT '合同名称',
  `CNTRCT_NM` varchar(100) DEFAULT NULL COMMENT '合同简称',
  `CNTRCT_TYPE` varchar(2) DEFAULT NULL COMMENT '合同类别',
  `BID_COMP_NO` varchar(4) DEFAULT NULL COMMENT '委托单位ID',
  `BID_COMP_NAME` varchar(40) DEFAULT NULL COMMENT '委托单位',
  `CO_MANAGER1` varchar(6) DEFAULT NULL COMMENT '联系人',
  `CO_MANAGER_TEL1` varchar(30) DEFAULT NULL COMMENT '联系方式(电话)',
  `CO_ADDRESS1` varchar(80) DEFAULT NULL COMMENT '联系方式(地址)',
  `CO_MANAGER_EMAIL1` varchar(100) DEFAULT NULL COMMENT '联系人邮箱',
  `CO_TAX` varchar(80) DEFAULT NULL COMMENT '开票信息',
  `CNTRCT_ST_DATE` datetime DEFAULT NULL COMMENT '合同开始时间',
  `CNTRCT_ED_DATE` datetime DEFAULT NULL COMMENT '合同结束时间',
  `CNTRCT_RATE_1` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率1(审价)',
  `CNTRCT_RATE_2` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率2(咨询)',
  `CNTRCT_RATE_3` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率3(清单编制)',
  `CNTRCT_RATE_4` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率4(控制价编制)',
  `CNTRCT_RATE_5` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率5(全过程投资监理)',
  `CNTRCT_RATE_6` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率6',
  `CNTRCT_RATE_7` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率7',
  `CNTRCT_RATE_8` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率8',
  `CNTRCT_RATE_9` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率9',
  `CNTRCT_RATE_10` decimal(14,2) DEFAULT NULL COMMENT '委托内容费率10',
  `CNTRCT_AMOUNT_1` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额1(审价)',
  `CNTRCT_AMOUNT_2` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额2(咨询)',
  `CNTRCT_AMOUNT_3` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额3(清单编制)',
  `CNTRCT_AMOUNT_4` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额4(控制价编制)',
  `CNTRCT_AMOUNT_5` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额5(全过程投资监理)',
  `CNTRCT_AMOUNT_6` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额6',
  `CNTRCT_AMOUNT_7` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额7',
  `CNTRCT_AMOUNT_8` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额8',
  `CNTRCT_AMOUNT_9` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额9',
  `CNTRCT_AMOUNT_10` decimal(14,2) DEFAULT NULL COMMENT '委托内容金额10',
  `CNTRCT_TOTAL_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '委托方收费',
  `CNTRCT_ALL_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '合同金额',
  `CNTRCT_UNPAY_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '未收金额',
  `TRIP_TOTAL_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '差旅合计',
  `ESTIMATE_COST` decimal(14,2) DEFAULT NULL COMMENT '总概算',
  `ESTIMATE_CONSTRUCT_SAFE_COST` decimal(14,2) DEFAULT NULL COMMENT '建安概算（不含物流设备及信息）',
  `PRE_CONSTRUCT_SAFE_COST` decimal(14,2) DEFAULT NULL COMMENT '建安对应预备费',
  `CONSTRUCT_ST_DATE` datetime DEFAULT NULL COMMENT '开工时间',
  `PLAN_CONSTRUCT_ED_DATE` datetime DEFAULT NULL COMMENT '预计完工时间',
  `CONSTRUCT_AREA` decimal(14,2) DEFAULT NULL COMMENT '总建筑面积',
  `EXCUTE_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '执行总费用',
  `CONSTRUCT_SAFE_COUNT` int(8) DEFAULT NULL COMMENT '执行建安（万元）',
  `CONSTRUCT_SAFE_CNTRCT_COST` decimal(14,2) DEFAULT NULL COMMENT '合同价',
  `CONSTRUCT_SAFE_CNTRCT_COST_PAID` decimal(14,2) DEFAULT NULL COMMENT '已支付',
  `CONSTRUCT_SAFE_CNTRCT_COST_CTRL` decimal(14,2) DEFAULT NULL COMMENT '控制价',
  `BUDGETARY_OVERRUN_RISK` int(5) DEFAULT NULL COMMENT '超概的风险度',
  `MONTHLY_REPORT_CNT` int(8) DEFAULT NULL COMMENT '月报',
  `SUGGEST_REPORT_CNT` int(8) DEFAULT NULL COMMENT '建议书',
  `COMM_REPORT_CNT` int(8) DEFAULT NULL COMMENT '联系函',
  `FINISH_AUDIT_CNT` int(8) DEFAULT NULL COMMENT '已完审价',
  `PROJ_PROGRESS_MEET_CNT` int(8) DEFAULT NULL COMMENT '工程例会',
  `PROGRESS_STATUS` varchar(2) DEFAULT NULL COMMENT '大致进度及工作计划',
  `PROJECT_SENIOR_MANAGER` varchar(6) DEFAULT NULL COMMENT '负责人',
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(200) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) DEFAULT NULL COMMENT '备用5',
  `RESERVE6` varchar(20) DEFAULT NULL COMMENT '备用6',
  `RESERVE7` decimal(14,2) DEFAULT NULL COMMENT '备用7',
  `RESERVE8` decimal(14,2) DEFAULT NULL COMMENT '备用8',
  `RESERVE9` datetime DEFAULT NULL COMMENT '备用9',
  `RESERVE10` datetime DEFAULT NULL COMMENT '备用10',
  `LATEST_FLG` varchar(1) DEFAULT NULL COMMENT '最新化',
  `DELETE_FLG` varchar(1) DEFAULT NULL COMMENT '删除',
  `UPDATE_USER` varchar(6) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新增日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`BID_CNTRCT_HIS_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bidcntrct_hist
-- ----------------------------

-- ----------------------------
-- Table structure for `bidcomp`
-- ----------------------------
DROP TABLE IF EXISTS `bidcomp`;
CREATE TABLE `bidcomp` (
  `BID_NO` varchar(18) DEFAULT NULL,
  `BID_CO_SEQ` int(11) DEFAULT NULL COMMENT '序号',
  `BID_CO_NO` int(11) NOT NULL AUTO_INCREMENT COMMENT '公司号',
  `BID_CO_NAME` varchar(40) DEFAULT NULL COMMENT '公司名称',
  `BID_CO_MANAGER` varchar(8) DEFAULT NULL COMMENT '负责人',
  `BID_CO_TEL` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `BID_CO_ADD` varchar(80) DEFAULT NULL COMMENT '地址',
  `BID_CO_PS` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `TAX_NO` varchar(20) DEFAULT NULL COMMENT '开票信息',
  `BID_PAYMENT_TYPE` varchar(1) DEFAULT NULL COMMENT '支付形式',
  `BID_PRICE` decimal(11,2) DEFAULT NULL COMMENT '投标价',
  `BID_CHECK_PRICE` decimal(11,2) DEFAULT NULL COMMENT '评审价',
  `BID_RESULT` varchar(1) DEFAULT NULL COMMENT '中标与否',
  `BID_WIN_PRICE` decimal(11,2) DEFAULT NULL COMMENT '中标价',
  `BID_APPLY_PRICE` decimal(11,2) DEFAULT NULL COMMENT '标书费',
  `BID_APPLY_PAYMENT_TYPE` varchar(1) DEFAULT NULL COMMENT '标书费支付形式',
  `BID_BOND` decimal(11,2) DEFAULT NULL COMMENT '保证金',
  `BID_VALUE_DATE` datetime DEFAULT NULL COMMENT '保证金到账日期',
  `REFOUND_BOND_STATUS` varchar(1) DEFAULT NULL COMMENT '退保证金状态',
  `REFOUND_DEPOSIT_DATE` datetime DEFAULT NULL COMMENT '退订日期',
  `BID_REFUND_SIGN` varchar(6) DEFAULT NULL COMMENT '退还签名',
  `RECEPT_UL_FILE1` varchar(100) DEFAULT NULL COMMENT '上传文件1',
  `RECEPT_UL_FILE2` varchar(100) DEFAULT NULL COMMENT '上传文件2',
  `RECEPT_UL_FILE3` varchar(100) DEFAULT NULL COMMENT '上传文件3',
  `RECEPT_UL_FILE4` varchar(100) DEFAULT NULL COMMENT '上传文件4',
  `RECEPT_UL_FILE5` varchar(100) DEFAULT NULL COMMENT '上传文件5',
  `RECEPT_UL_FILE6` varchar(100) DEFAULT NULL COMMENT '上传文件6',
  `RECEPT_UL_FILE7` varchar(100) DEFAULT NULL COMMENT '上传文件7',
  `RECEPT_UL_FILE8` varchar(100) DEFAULT NULL COMMENT '上传文件8',
  `RECEPT_UL_FILE9` varchar(100) DEFAULT NULL COMMENT '上传文件9',
  `RECEPT_UL_FILE10` varchar(100) DEFAULT NULL COMMENT '上传文件10',
  `BID_APPLY_PRICE_DATE` datetime DEFAULT NULL COMMENT '标书费到账日期',
  `INVOICE_TYPE` varchar(1) DEFAULT NULL COMMENT '发票信息',
  `INVOICE_DATE` datetime DEFAULT NULL COMMENT '发票时间',
  `BID_RECEIPT_NO` varchar(20) DEFAULT NULL COMMENT '发票号码',
  `BID_APPLY_PRICE_STATUS` varchar(1) DEFAULT NULL COMMENT '标书费状态',
  `MEMO1` varchar(60) DEFAULT NULL COMMENT '备注',
  `DELETE_FLG` varchar(1) DEFAULT NULL COMMENT '删除',
  `UPDATE_USER` varchar(6) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新建日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(50) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(50) DEFAULT NULL COMMENT '备用5',
  `RESERVE6` varchar(50) DEFAULT NULL COMMENT '备用6',
  `RESERVE7` varchar(50) DEFAULT NULL COMMENT '备用7',
  `RESERVE8` varchar(50) DEFAULT NULL COMMENT '备用8',
  `RESERVE9` varchar(50) DEFAULT NULL COMMENT '备用9',
  `RESERVE10` varchar(50) DEFAULT NULL COMMENT '备用10',
  `RESERVE_DATE1` datetime DEFAULT NULL COMMENT '备用日期1',
  `RESERVE_DATE2` datetime DEFAULT NULL COMMENT '备用日期2',
  PRIMARY KEY (`BID_CO_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bidcomp
-- ----------------------------

-- ----------------------------
-- Table structure for `bidcompapply`
-- ----------------------------
DROP TABLE IF EXISTS `bidcompapply`;
CREATE TABLE `bidcompapply` (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `BID_NO` varchar(18) DEFAULT NULL,
  `BID_CO_NO` bigint(11) DEFAULT NULL COMMENT '投标公司ID',
  `APPLY_SORT` int(4) DEFAULT NULL COMMENT '排序',
  `APPLY_REQUIRE` varchar(1000) DEFAULT NULL COMMENT '报名要求',
  `APPLY_NOTE` varchar(1000) DEFAULT NULL COMMENT '报名内容',
  `STATUS` int(4) DEFAULT NULL COMMENT '状态',
  `RESERVE1` varchar(100) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(100) DEFAULT NULL COMMENT '备用2',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bidcompapply
-- ----------------------------
INSERT INTO `bidcompapply` VALUES ('30', 'LHZB-16-021', '79', '1', '111', 'f1', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('31', 'LHZB-16-021', '79', '2', '222', 'f2', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('32', 'LHZB-16-021', '79', '3', '333', 'f3', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('33', 'LHZB-16-021', '79', '4', '444', 'f4', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('34', 'LHZB-16-021', '79', '5', '555', 'f5', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('35', 'LHZB-16-021', '79', '6', '666', 'f6', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('36', 'LHZB-16-021', '79', '7', '777', 'f7', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('37', 'LHZB-16-021', '79', '8', '888', 'f8', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('38', 'LHZB-16-021', '79', '9', '999', 'f9', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('39', 'LHZB-16-021', '79', '10', 'aaa', 'fa', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('40', 'LHZB-16-021', '79', '11', 'bbb', 'fb', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('41', 'LHZB-16-021', '79', '12', 'ccc', 'fc', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('42', 'LHZB-16-021', '79', '13', 'ddd', 'fd', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('43', 'LHZB-16-021', '79', '14', 'eee', 'fe', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('44', 'LHZB-16-021', '83', '1', '111', 'a1', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('45', 'LHZB-16-021', '83', '2', '222', 'a2', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('46', 'LHZB-16-021', '83', '3', '333', 'a3', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('47', 'LHZB-16-021', '83', '4', '444', 'a4', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('48', 'LHZB-16-021', '83', '5', '555', 'a5', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('49', 'LHZB-16-021', '83', '6', '666', 'a6', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('50', 'LHZB-16-021', '83', '7', '777', 'a7', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('51', 'LHZB-16-021', '83', '8', '888', 'a8', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('52', 'LHZB-16-021', '83', '9', '999', 'a9', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('53', 'LHZB-16-021', '83', '10', 'aaa', 'aa', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('54', 'LHZB-16-021', '83', '11', 'bbb', 'ab', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('55', 'LHZB-16-021', '83', '12', 'ccc', 'ac', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('56', 'LHZB-16-021', '83', '13', 'ddd', 'ad', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('57', 'LHZB-16-021', '83', '14', 'eee', 'ae', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('58', 'LHZB-16-021', '84', '1', '111', '11', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('59', 'LHZB-16-021', '84', '2', '222', '22', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('60', 'LHZB-16-021', '84', '3', '333', '33', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('61', 'LHZB-16-021', '84', '4', '444', '44', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('62', 'LHZB-16-021', '84', '5', '555', '55', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('63', 'LHZB-16-021', '84', '6', '666', '66', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('64', 'LHZB-16-021', '84', '7', '777', '77', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('65', 'LHZB-16-021', '84', '8', '888', '88', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('66', 'LHZB-16-021', '84', '9', '999', '99', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('67', 'LHZB-16-021', '84', '10', 'aaa', 'aa', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('68', 'LHZB-16-021', '84', '11', 'bbb', 'bb', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('69', 'LHZB-16-021', '84', '12', 'ccc', 'cc', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('70', 'LHZB-16-021', '84', '13', 'ddd', 'dd', '1', null, null);
INSERT INTO `bidcompapply` VALUES ('71', 'LHZB-16-021', '84', '14', 'eee', 'ee', '1', null, null);

-- ----------------------------
-- Table structure for `bid_hist`
-- ----------------------------
DROP TABLE IF EXISTS `bid_hist`;
CREATE TABLE `bid_hist` (
  `BID_HIS_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '履历主键',
  `BID_NO` varchar(18) DEFAULT NULL,
  `CNTRCT_NO` varchar(20) DEFAULT NULL COMMENT '合同编号',
  `PROJECT_DEVIEW_DATE` datetime DEFAULT NULL COMMENT '承接项目日期：',
  `CNTRCT_TYPE` varchar(2) DEFAULT NULL COMMENT '合同类别',
  `PROJECT_NAME` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `PROJECT_PROPERTY` varchar(1) DEFAULT NULL COMMENT '项目性质',
  `PROJ_APPROVAL` varchar(128) DEFAULT NULL COMMENT '工程概况批文',
  `PROJECT_AUTH` varchar(6) DEFAULT NULL COMMENT '会审监管人',
  `PROJECT_MANAGER` varchar(6) DEFAULT NULL COMMENT '担当者',
  `BID_AGENT_PAY` varchar(2) DEFAULT NULL COMMENT '招标代理支付方',
  `BID_AGENT_PAY2` varchar(64) DEFAULT NULL COMMENT '招标代理支付方(其他)',
  `BID_AGENT_PRICE` decimal(11,2) DEFAULT NULL COMMENT '招标代理费',
  `BID_AGENT_PRICE_ACT` decimal(11,2) DEFAULT NULL COMMENT '实收代理费',
  `RECEIPT1_DATE` datetime DEFAULT NULL COMMENT '开票日期',
  `RECEIPT1_VALUE_DATE` datetime DEFAULT NULL COMMENT '到账日期',
  `REGISTE_ST_DATE1` datetime DEFAULT NULL COMMENT '报名日期开始日1',
  `REGISTE_ED_DATE1` datetime DEFAULT NULL COMMENT '报名日期终了日1',
  `REGISTE_ST_DATE2` datetime DEFAULT NULL COMMENT '报名日期开始日2',
  `REGISTE_ED_DATE2` datetime DEFAULT NULL COMMENT '报名日期终了日2',
  `REGISTE_ST_DATE3` datetime DEFAULT NULL COMMENT '报名日期开始日3',
  `REGISTE_ED_DATE3` datetime DEFAULT NULL COMMENT '报名日期终了日3',
  `REGISTE_ST_DATE4` datetime DEFAULT NULL COMMENT '报名日期开始日4',
  `REGISTE_ED_DATE4` datetime DEFAULT NULL COMMENT '报名日期终了日4',
  `REGISTE_ST_DATE5` datetime DEFAULT NULL COMMENT '报名日期开始日5',
  `REGISTE_ED_DATE5` datetime DEFAULT NULL COMMENT '报名日期终了日5',
  `APPLY_REQUIRE` varchar(2000) DEFAULT NULL COMMENT '报名要求',
  `BID_BOND` decimal(11,2) DEFAULT NULL COMMENT '保证金',
  `TENDER_OPEN_DATE` datetime DEFAULT NULL COMMENT '开标时间',
  `TENDER_OPEN_ADDRESS` varchar(200) DEFAULT NULL COMMENT '开标地点',
  `TENDER_VERIFY_DATE` datetime DEFAULT NULL COMMENT '评标时间',
  `BID_AUTH` varchar(6) DEFAULT NULL COMMENT '评审人',
  `BID_LIMIT_PRICE` decimal(11,2) DEFAULT NULL COMMENT '限价',
  `BID_CO_LIST` varchar(200) DEFAULT NULL COMMENT '投标公司列表',
  `BID_EXPERT_LIST` varchar(200) DEFAULT NULL COMMENT '评审专家列表',
  `BID_CO_SEQ` varchar(40) DEFAULT NULL COMMENT '中标公司号',
  `BID_CO_NAME` varchar(1000) DEFAULT NULL COMMENT '中标公司名称',
  `BID_CO_PRICE` decimal(11,2) DEFAULT NULL COMMENT '中标公司标书费',
  `BID_PRICE` decimal(11,2) DEFAULT NULL COMMENT '中标价',
  `BID_PRICE_LIST` varchar(40) DEFAULT NULL COMMENT '中标金额一览',
  `BID_EXPERT_COMMISION` decimal(11,2) DEFAULT NULL COMMENT '专家费',
  `BID_EXPERT_COMMISION_PRE` decimal(11,2) DEFAULT NULL COMMENT '预借专家费',
  `BID_EXPERT_COMMISION_ACT` decimal(11,2) DEFAULT NULL COMMENT '实际专家费',
  `BID_EXPERT_COMMISION_DIFF_DATE` datetime DEFAULT NULL COMMENT '差价退还日期',
  `BID_APPLY_PRICE` decimal(11,2) DEFAULT NULL COMMENT '标书费',
  `BID_EXPERT_COMMISION_APPLY` varchar(6) DEFAULT NULL COMMENT '专家费申请人',
  `BID_EXPERT_COMMISION_APPLY_DATE` datetime DEFAULT NULL COMMENT '专家费申日期',
  `APPLY_FORM_EDIT_DATE` datetime DEFAULT NULL COMMENT '招标文件编制日期',
  `APPLY_FORM_COLLECT_DATE` datetime DEFAULT NULL COMMENT '招标文件统稿日期',
  `APPLY_FORM_VERIFY_DATE` datetime DEFAULT NULL COMMENT '招标公告，文件校对日期',
  `APPLY_FORM_VERIFY` varchar(6) DEFAULT NULL COMMENT '招标公告，文件校对者',
  `APPLY_FORM_FIX_DATE` datetime DEFAULT NULL COMMENT '招标文件定稿日期',
  `APPLY_FORM_BOX_DATE` datetime DEFAULT NULL COMMENT '招标文件装订日期',
  `SUPPORT_DOC_DATE` datetime DEFAULT NULL COMMENT '发送答疑，补充文件日期',
  `BID_NOTICE_ST_DATE` datetime DEFAULT NULL COMMENT '中标公告日期',
  `BID_NOTICE_ED_DATE` datetime DEFAULT NULL COMMENT '中标公告日期2',
  `BID_MESSAGE_DATE` datetime DEFAULT NULL COMMENT '中标通知书发出日',
  `BID_DOC_DELI_DATE1` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期1',
  `BID_DOC_DELI_FILE1` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件1',
  `BID_DOC_DELI_DATE2` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期2',
  `BID_DOC_DELI_FILE2` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件2',
  `BID_DOC_DELI_DATE3` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期3',
  `BID_DOC_DELI_FILE3` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件3',
  `BID_DOC_DELI_DATE4` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期4',
  `BID_DOC_DELI_FILE4` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件4',
  `BID_DOC_DELI_DATE5` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期5',
  `BID_DOC_DELI_FILE5` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件5',
  `BID_DOC_DELI_DATE6` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期6',
  `BID_DOC_DELI_FILE6` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件6',
  `BID_DOC_DELI_DATE7` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期7',
  `BID_DOC_DELI_FILE7` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件7',
  `BID_DOC_DELI_DATE8` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期8',
  `BID_DOC_DELI_FILE8` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件8',
  `BID_DOC_DELI_DATE9` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期9',
  `BID_DOC_DELI_FILE9` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件9',
  `BID_DOC_DELI_DATE10` datetime DEFAULT NULL COMMENT '招投标文件送至甲方日期10',
  `BID_DOC_DELI_FILE10` varchar(40) DEFAULT NULL COMMENT '招投标文件送至甲方文件10',
  `BID_INFORM_RCV_DATE` datetime DEFAULT NULL COMMENT '中标通知书签收日',
  `BID_INFORM_RCV` varchar(6) DEFAULT NULL COMMENT '中标通知书签收人',
  `BID_VER_DOC_SCAN_DATE` datetime DEFAULT NULL COMMENT '评标报告装订扫描日',
  `BID_VER_DOC_SCAN` varchar(6) DEFAULT NULL COMMENT '评标报告装订扫描人',
  `BID_VER_DOC_DELI_DATE1` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期1',
  `BID_VER_DOC_DELI_FILE1` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件1',
  `BID_VER_DOC_DELI_DATE2` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期2',
  `BID_VER_DOC_DELI_FILE2` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件2',
  `BID_VER_DOC_DELI_DATE3` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期3',
  `BID_VER_DOC_DELI_FILE3` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件3',
  `BID_VER_DOC_DELI_DATE4` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期4',
  `BID_VER_DOC_DELI_FILE4` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件4',
  `BID_VER_DOC_DELI_DATE5` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期5',
  `BID_VER_DOC_DELI_FILE5` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件5',
  `BID_VER_DOC_DELI_DATE6` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期6',
  `BID_VER_DOC_DELI_FILE6` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件6',
  `BID_VER_DOC_DELI_DATE7` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期7',
  `BID_VER_DOC_DELI_FILE7` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件7',
  `BID_VER_DOC_DELI_DATE8` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期8',
  `BID_VER_DOC_DELI_FILE8` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件8',
  `BID_VER_DOC_DELI_DATE9` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期9',
  `BID_VER_DOC_DELI_FILE9` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件9',
  `BID_VER_DOC_DELI_DATE10` datetime DEFAULT NULL COMMENT '评标报告送至甲方日期10',
  `BID_VER_DOC_DELI_FILE10` varchar(40) DEFAULT NULL COMMENT '评标报告送至甲方文件10',
  `PROGRESS_STATUS` varchar(50) DEFAULT NULL COMMENT '项目进度情况',
  `FINISH_STATUS` varchar(4) DEFAULT NULL COMMENT '项目完成情况',
  `FINISH_DATE` datetime DEFAULT NULL COMMENT '项目完成日期',
  `FINISH_NOTE` varchar(200) DEFAULT NULL COMMENT '项目完成情况的备注',
  `STATUS` varchar(4) DEFAULT NULL COMMENT '投标状态',
  `MEMO1` varchar(300) DEFAULT NULL COMMENT '备注',
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(20) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) DEFAULT NULL COMMENT '备用5',
  `RESERVE_DATE1` datetime DEFAULT NULL COMMENT '备用日期1',
  `RESERVE_DATE2` datetime DEFAULT NULL COMMENT '备用日期2',
  `RESERVE_DATE3` datetime DEFAULT NULL COMMENT '备用日期3',
  `RESERVE_DATE4` datetime DEFAULT NULL COMMENT '备用日期4',
  `RESERVE_DATE5` datetime DEFAULT NULL COMMENT '备用日期5',
  `RESERVE_DATE6` datetime DEFAULT NULL COMMENT '备用日期6',
  `RESERVE_DATE7` varchar(20) DEFAULT NULL COMMENT '备用日期7',
  `RESERVE_DATE8` varchar(20) DEFAULT NULL COMMENT '备用日期8',
  `RESERVE_DATE9` varchar(20) DEFAULT NULL COMMENT '备用日期9',
  `RESERVE_DATE10` varchar(20) DEFAULT NULL COMMENT '备用日期10',
  `LATEST_FLG` varchar(1) DEFAULT NULL COMMENT '最新化',
  `DELETE_FLG` varchar(1) DEFAULT NULL COMMENT '删除',
  `UPDATE_USER` varchar(6) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新建日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`BID_HIS_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bid_hist
-- ----------------------------

-- ----------------------------
-- Table structure for `bid_hist_2016`
-- ----------------------------
DROP TABLE IF EXISTS `bid_hist_2016`;
CREATE TABLE `bid_hist_2016` (
  `BID_HIS_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '履历主键',
  `BID_NO` varchar(13) DEFAULT NULL COMMENT '招标编号',
  `PROJECT_TYPE` varchar(1) DEFAULT NULL COMMENT '分类',
  `PROJECT_NAME` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `PROJECT_MANAGER` varchar(6) DEFAULT NULL COMMENT '担当者',
  `ONLINE_DATE` datetime DEFAULT NULL COMMENT '上网日期',
  `SUBMIT_DATE` datetime DEFAULT NULL COMMENT '报名截止日',
  `TENDER_START_DATE` datetime DEFAULT NULL COMMENT '发标日期',
  `TENDER_OPEN_DATE` datetime DEFAULT NULL COMMENT '开标日期',
  `AGENT_NO` varchar(4) DEFAULT NULL COMMENT '委托公司代码',
  `AGENT_CO_NAME` varchar(40) DEFAULT NULL COMMENT '委托公司名称',
  `AGENT_CO_MANAGER` varchar(6) DEFAULT NULL COMMENT '委托公司联系人',
  `AGENT_CO_MANAGER_TEL` varchar(30) DEFAULT NULL COMMENT '委托公司电话',
  `AGENT_CO_POST_ADDRESS` varchar(80) DEFAULT NULL COMMENT '委托公司地址',
  `AGENT_CO_MAIL` varchar(60) DEFAULT NULL COMMENT '委托公司邮箱',
  `PROF_NO` varchar(4) DEFAULT NULL COMMENT '专业公司代码',
  `PROF_CO_NAME` varchar(40) DEFAULT NULL COMMENT '专业公司名称',
  `PROF_CO_MANAGER` varchar(6) DEFAULT NULL COMMENT '专业公司负责人',
  `PROF_CO_MANAGER_TEL` varchar(30) DEFAULT NULL COMMENT '专业公司电话',
  `PROF_CO_POST_ADDRESS` varchar(80) DEFAULT NULL COMMENT '专业公司地址',
  `PROF_CO_MAIL` varchar(60) DEFAULT NULL COMMENT '专业公司邮箱',
  `PROJ_APPROVAL` varchar(128) DEFAULT NULL COMMENT '工程概况批文',
  `PROJ_PLAN_PRICE` decimal(8,0) DEFAULT NULL COMMENT '工程概况计划价格',
  `PROJ_ASTRICT_PRICE` decimal(8,0) DEFAULT NULL COMMENT '工程概况限价',
  `TENDER_ONLINE` varchar(6) DEFAULT NULL COMMENT '担当者签名',
  `TENDER_DOWNLOAD` varchar(6) DEFAULT NULL COMMENT '网页下载',
  `APPLY_FORM_EDIT` varchar(6) DEFAULT NULL COMMENT '报名表式（编制）',
  `APPLY_FORM_VERIFY` varchar(6) DEFAULT NULL COMMENT '报名表式（审核）',
  `APPLY_FORM_MERGE` varchar(6) DEFAULT NULL COMMENT '报名表式（汇总）',
  `EXPERT_NAME_OFFERED` varchar(6) DEFAULT NULL COMMENT '名单提供',
  `EXPERT_INFORMED` varchar(6) DEFAULT NULL COMMENT '通知与否',
  `EXPERT_NAME_CONFIRMED` varchar(6) DEFAULT NULL COMMENT '通知确认',
  `CLARIFY_DOC` varchar(6) DEFAULT NULL COMMENT '澄清文件',
  `SUPPORT_DOC` varchar(6) DEFAULT NULL COMMENT '补遗文件',
  `SUPPORT_DOC_SENT` varchar(6) DEFAULT NULL COMMENT '补遗文件发出',
  `BIDDER_REPLY` varchar(6) DEFAULT NULL COMMENT '投标人回复',
  `OPEN_RESULT` varchar(6) DEFAULT NULL COMMENT '公示',
  `OPEN_VERIFY` varchar(6) DEFAULT NULL COMMENT '公示审核',
  `INFORM_SENT` varchar(6) DEFAULT NULL COMMENT '通知书发出',
  `INFORM_CONTRACT` varchar(6) DEFAULT NULL COMMENT '合同告知书',
  `ATTACH_POST_A` varchar(6) DEFAULT NULL COMMENT '附件邮甲方',
  `CONTRACT_VERIFY` varchar(6) DEFAULT NULL COMMENT '合同审核',
  `COMMENT_POST` varchar(6) DEFAULT NULL COMMENT '意见稿发出',
  `BID_REOPRT_EDIT` varchar(6) DEFAULT NULL COMMENT '报告编制',
  `BID_REPORT_VERIFY` varchar(6) DEFAULT NULL COMMENT '报告审核',
  `BID_REPORT_SENT` varchar(6) DEFAULT NULL COMMENT '报告发出',
  `BID_POST_NO` varchar(6) DEFAULT NULL COMMENT '快递编号',
  `PROJECT_PROCESS_02_04` varchar(6) DEFAULT NULL,
  `PROJECT_PROCESS_02_05` varchar(6) DEFAULT NULL,
  `PROJECT_PROCESS_03_05` varchar(6) DEFAULT NULL,
  `PROJECT_PROCESS_04_05` varchar(6) DEFAULT NULL,
  `PROJECT_PROCESS_05_04` varchar(6) DEFAULT NULL,
  `PROJECT_PROCESS_05_05` varchar(6) DEFAULT NULL,
  `PROJECT_PROCESS_06_04` varchar(6) DEFAULT NULL,
  `PROJECT_PROCESS_06_05` varchar(6) DEFAULT NULL,
  `RECEIPT1_AGENT_COMMISSION` decimal(11,2) DEFAULT NULL COMMENT '代理费',
  `RECEIPT1_DATE` datetime DEFAULT NULL COMMENT '开票日期',
  `RECEIPT1_STAFF` varchar(6) DEFAULT NULL COMMENT '开票人',
  `RECEIPT1_NO` varchar(8) DEFAULT NULL COMMENT '发票号码',
  `RECEIPT1_VALUE_DATE` datetime DEFAULT NULL COMMENT '到账日期',
  `BID_COMMISION` decimal(11,2) DEFAULT NULL COMMENT '评标费',
  `RECEIPT1_RECEIVER` varchar(6) DEFAULT NULL COMMENT '接受人',
  `RECEIPT2_NO` varchar(4) DEFAULT NULL COMMENT '签收单编号',
  `RECEIPT2_DATE` datetime DEFAULT NULL COMMENT '签收时间',
  `RECEIPT2_POST_NO` varchar(12) DEFAULT NULL COMMENT '快递编号',
  `RECEIPT2_EXPRESS_DATE` datetime DEFAULT NULL COMMENT '快递时间',
  `MEMO1` varchar(300) DEFAULT NULL COMMENT '备注',
  `BID_CO_LIST` varchar(200) DEFAULT NULL COMMENT '投标公司列表',
  `BID_EXPERT_LIST` varchar(200) DEFAULT NULL COMMENT '评审专家列表',
  `BID_CO_SEQ` int(11) DEFAULT NULL COMMENT '中标公司号',
  `BID_CO_NAME` varchar(40) DEFAULT NULL COMMENT '中标公司名称',
  `BID_APPLY_PRICE` decimal(11,2) DEFAULT NULL COMMENT '中标公司标书费',
  `BID_PRICE` decimal(11,2) DEFAULT NULL COMMENT '中标价',
  `OTHER_DETAIL` text COMMENT '投标公司和评审专家明细信息',
  `DELETE_FLG` varchar(1) DEFAULT NULL COMMENT '删除',
  `UPDATE_USER` varchar(6) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新建日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(20) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) DEFAULT NULL COMMENT '备用5',
  PRIMARY KEY (`BID_HIS_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bid_hist_2016
-- ----------------------------

-- ----------------------------
-- Table structure for `configtab`
-- ----------------------------
DROP TABLE IF EXISTS `configtab`;
CREATE TABLE `configtab` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CONFIG_TYPE` varchar(20) NOT NULL COMMENT '配置数据类型',
  `CONFIG_KEY` varchar(16) NOT NULL COMMENT 'KEY，逻辑主键',
  `CONFIG_VAL` varchar(16) NOT NULL COMMENT '对应KEY的值',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新时间',
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(20) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) DEFAULT NULL COMMENT '备用5',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of configtab
-- ----------------------------
INSERT INTO `configtab` VALUES ('5', 'AUDIT_SEQ', '2014', '31', '2014-02-18 10:43:46', '2014-03-20 00:32:38', null, null, null, null, null);
INSERT INTO `configtab` VALUES ('6', 'BID_ZB_SEQ', '2014', '3', '2014-04-01 22:03:39', '2014-04-01 22:03:39', null, null, null, null, null);
INSERT INTO `configtab` VALUES ('7', 'BID_BX_SEQ', '2014', '4', '2014-04-01 22:04:04', '2014-04-01 22:04:33', null, null, null, null, null);
INSERT INTO `configtab` VALUES ('8', 'SETTLEMENT_RATE', 'ALL', '0.82', '2014-04-01 22:04:04', '2014-04-01 22:04:04', null, null, null, null, null);
INSERT INTO `configtab` VALUES ('9', 'AUDIT_SEQ', '2015', '3', '2015-04-12 21:20:29', '2015-04-15 22:00:06', null, null, null, null, null);
INSERT INTO `configtab` VALUES ('10', 'BID_ZB_SEQ', '2015', '2', '2015-04-12 21:21:34', '2015-04-14 00:07:59', null, null, null, null, null);
INSERT INTO `configtab` VALUES ('11', 'AUDIT_COMP', 'gs0001', '公司1', '2015-04-12 21:21:34', '2015-04-12 21:21:34', null, null, null, null, null);
INSERT INTO `configtab` VALUES ('12', 'AUDIT_COMP', 'gs0002', '公司2', '2015-04-12 21:21:34', '2015-04-12 21:21:34', null, null, null, null, null);
INSERT INTO `configtab` VALUES ('13', 'AGENT_PAY_COMP', '代理支付方1', '代理支付方1', '2015-04-12 21:21:34', '2015-04-12 21:21:34', null, null, null, null, null);
INSERT INTO `configtab` VALUES ('14', 'AGENT_PAY_COMP', '代理支付方2', '代理支付方2', '2015-04-12 21:21:34', '2015-04-12 21:21:34', null, null, null, null, null);
INSERT INTO `configtab` VALUES ('15', 'AGENT_PAY_COMP', '代理支付方3', '代理支付方3', '2015-04-12 21:21:34', '2015-04-12 21:21:34', null, null, null, null, null);
INSERT INTO `configtab` VALUES ('16', 'BID_ZB_SEQ', '2016', '21', '2016-04-20 00:13:15', '2016-05-13 23:13:22', null, null, null, null, null);
INSERT INTO `configtab` VALUES ('17', 'BID_BX_SEQ', '2016', '10', '2016-04-20 00:15:50', '2016-05-13 22:47:17', null, null, null, null, null);
INSERT INTO `configtab` VALUES ('26', 'AUDIT_SEQ', '2018', '48', '2018-09-02 14:16:21', '2018-09-23 11:04:56', null, null, null, null, null);

-- ----------------------------
-- Table structure for `expertlib`
-- ----------------------------
DROP TABLE IF EXISTS `expertlib`;
CREATE TABLE `expertlib` (
  `EXPERT_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `EXPERT_NAME` varchar(8) DEFAULT NULL COMMENT '姓名',
  `EXPERT_MAJOR` varchar(400) DEFAULT NULL,
  `EXPERT_QULI` varchar(8) DEFAULT NULL COMMENT '职称',
  `EXPERT_TEL1` varchar(12) DEFAULT NULL COMMENT '手机电话',
  `EXPERT_TEL2` varchar(12) DEFAULT NULL COMMENT '固话',
  `EXPERT_GENDER` varchar(1) DEFAULT NULL COMMENT '性别',
  `EXPERT_BIRTH` varchar(40) DEFAULT NULL,
  `EXPERT_COMP` varchar(40) DEFAULT NULL COMMENT '就职公司',
  `MEMO1` varchar(40) DEFAULT NULL COMMENT '备注',
  `DELETE_FLG` varchar(1) DEFAULT NULL COMMENT '删除',
  `UPDATE_USER` varchar(6) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新建日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(20) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) DEFAULT NULL COMMENT '备用5',
  PRIMARY KEY (`EXPERT_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expertlib
-- ----------------------------
INSERT INTO `expertlib` VALUES ('1', '王二', ',C01,A0102,', '高级专家1', '13311112222', '02111223344', '0', '1955-01-02 00:00:00', '上海XXX信息公司', '未退休1', '1', 'admin', '2013-10-19 00:00:00', '2013-10-24 22:03:27', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('3', '张三', ',C01,B0102,', '中级专家', '13911111111', '055112345678', '0', '1985-01-26 00:00:00', '上海XXX信息公司1', '已退休', '1', 'admin', '2013-10-19 00:00:00', '2013-11-10 18:52:31', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('4', '李四', ',B01,C0102,', '高级', '13311111111', '', '1', '1974-01-31 00:00:00', '测试公司', '测试', '1', 'admin', '2013-10-20 22:11:01', '2013-10-31 20:27:41', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('5', '专家11', '00005600000000000000000000000000000', '高级', '13111111111', '', '1', '1967-01-25 00:00:00', '测试公司', '高级未退休', '1', 'admin', '2013-10-24 22:04:25', '2013-10-31 20:26:25', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('6', 'test1', '00005600000000000000000000000000000', '高级', '13433333333', '', '1', '1957-01-03 00:00:00', 'XX公司1', '', '0', 'admin', '2013-10-29 22:24:43', '2013-11-10 17:40:41', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('7', 'test2', '02305000000000000000000000000000000', '无', '13555555555', '', '0', '1952-01-02 00:00:00', '公司001', '', '1', 'admin', '2013-10-29 22:36:59', '2013-10-31 20:25:57', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('8', '陈22', '0004060000000E000000000000000000000', '真的2', '13111111122', '02111111122', '0', '2013-11-02 00:00:00', '公司A2', '假的2', '1', 'admin', '2013-11-10 18:46:54', '2013-11-10 18:50:54', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('9', '手机1', '00000670000000000000000000000000000', '高级', '13444444444', '44444444', '1', '2013-11-30 00:00:00', '公司4', '没有', '1', 'admin', '2013-11-10 18:53:19', '2013-11-10 18:53:19', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('10', '11', '00005600000000000000000000000000000', '44', '13111111111', '22', '1', '2013-11-02 00:00:00', '33', '55', '1', 'admin', '2013-11-10 18:53:47', '2013-11-10 18:53:47', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('11', '22', '00045000000000000000000000000000000', '66', '13555555555', '44', '0', '2013-11-21 00:00:00', '55', '77', '1', 'admin', '2013-11-10 18:54:16', '2013-11-10 18:54:16', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('12', '33', '02000000000000000000000000000000000', '55', '13666666666', '3333', '1', '2013-11-08 00:00:00', '33333', '55', '1', 'admin', '2013-11-10 18:54:40', '2013-11-10 18:54:40', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('13', '44', '00340000000000000000000000000000000', '1', '13777777777', '444', '1', '2013-11-07 00:00:00', '4444', '222', '0', 'admin', '2013-11-10 18:55:07', '2013-11-10 18:59:54', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('14', '55', '00040600000000000000000000000000000', '高级', '13888888888', '5555', '1', '2013-11-01 00:00:00', '55555', '11', '1', 'admin', '2013-11-10 18:59:49', '2013-12-09 21:50:58', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('15', '66', '02300000000000000000000000000000000', 'tt', '13111111111', '02111111111', '1', '2013-12-06 00:00:00', 'aa', 'aa', '0', 'admin', '2013-12-09 21:51:26', '2014-02-16 20:15:39', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('16', '琪琪1', '12000000000000000000000000000000000', 'dda', '13111111111', '', '1', '2013-12-12 00:00:00', '3232', '', '1', 'admin', '2013-12-11 21:49:00', '2013-12-11 21:49:59', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('17', '测试新专家', '0200000000000EF00000000000000000000', 'gj', '13111111111', '414314314', '1', '2014-03-01 00:00:00', 'tet', 'fda', '1', 'admin', '2014-03-24 00:05:44', '2014-04-05 21:28:34', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('18', '测试专家2', '000000000ABCDEF00000000000000000000', 'zz', '13333333333', '124414142', '1', '2014-03-05 00:00:00', 'sd', 'dd', '1', 'test11', '2014-03-24 00:06:38', '2014-03-24 00:09:17', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('20', '35位测试', '00000000000CD0000000000000000000000', 'hj', '13333333333', '2121', '1', '2014-03-07', 'test35', 'aa', '1', 'admin', '2014-03-30 22:25:13', '2014-05-19 23:58:10', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('21', 'birthtt', '00000070000000000000000000000000000', 'gj', '13111111111', '', '1', 'fdsaf111', 'tae', '', '1', 'admin', '2014-05-19 23:58:50', '2014-05-19 23:59:28', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('22', 'aa', ',A0402,B0102,A010202,B0101,', 'fdsa', '13111111111', '', '1', '112122', 'bb', '445566', '1', 'admin', '2016-07-26 00:48:02', '2016-07-26 01:56:10', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('23', '测试专家11', ',A010202,', 'test', '13444444444', '', '1', '1977-01-02', '华为', 'abc', '1', 'admin', '2016-07-26 00:52:46', '2016-07-26 00:52:46', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('24', '测试专家2', ',B010102,', '高级', '13555555555', '', '1', '1961-09-11', '微软', 'bbb', '1', 'admin', '2016-07-26 00:54:47', '2016-07-26 00:54:47', null, null, null, null, null);
INSERT INTO `expertlib` VALUES ('25', '测试专家3', ',A0102,A0402,', '高级', '13666666666', '', '1', '1956-07-12', '高校', '333', '1', 'admin', '2016-07-26 00:55:52', '2016-07-26 00:55:52', null, null, null, null, null);

-- ----------------------------
-- Table structure for `major`
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `MAJORCODE` varchar(32) DEFAULT NULL COMMENT '专业CODE',
  `MAJORNAME` varchar(64) DEFAULT NULL COMMENT '专业名称',
  `MAJORTYPE` int(4) DEFAULT NULL COMMENT '1为根节点，2为1的子节点，依次类推',
  `STATUS` int(4) DEFAULT NULL COMMENT '数据状态，1为有效',
  `UPDATE_USER` varchar(32) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '数据创建日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '数据更新日期',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', 'A01', '规划', '1', '1', 'admin', '2016-07-19 00:00:00', '2016-07-19 00:00:00');
INSERT INTO `major` VALUES ('2', 'A0102', '城乡规划', '2', '1', 'admin', '2016-07-19 00:00:00', '2016-07-19 00:00:00');
INSERT INTO `major` VALUES ('3', 'A0402', '市政工程', '2', '1', 'admin', '2016-07-19 00:00:00', '2016-07-19 00:00:00');
INSERT INTO `major` VALUES ('4', 'A04', '设计', '1', '1', 'admin', '2016-07-19 00:00:00', '2016-07-19 00:00:00');
INSERT INTO `major` VALUES ('5', 'A010202', '城市规划', '3', '1', 'admin', '2016-07-19 00:00:00', '2016-07-19 00:00:00');
INSERT INTO `major` VALUES ('6', 'A040206', '市政工程给水排水', '3', '1', 'admin', '2016-07-19 00:00:00', '2016-07-19 00:00:00');
INSERT INTO `major` VALUES ('7', 'A04020601', '市政给水', '4', '1', 'admin', '2016-07-19 00:00:00', '2016-07-19 00:00:00');
INSERT INTO `major` VALUES ('8', 'A02', 'A02', '1', '1', 'admin', '2016-07-19 00:00:00', '2016-07-19 00:00:00');
INSERT INTO `major` VALUES ('9', 'A03', 'A03', '1', '1', 'admin', '2016-07-19 00:00:00', '2016-07-19 00:00:00');
INSERT INTO `major` VALUES ('10', 'A05', 'A05', '1', '1', 'admin', '2016-07-19 00:00:00', '2016-07-19 00:00:00');
INSERT INTO `major` VALUES ('11', 'B01', 'B01', '1', '1', 'admin', '2016-07-19 00:00:00', '2016-07-19 00:00:00');
INSERT INTO `major` VALUES ('12', 'B0101', 'B0101', '2', '1', 'admin', '2016-07-19 00:00:00', '2016-07-19 00:00:00');
INSERT INTO `major` VALUES ('13', 'B0102', 'B0102', '2', '1', 'admin', '2016-07-19 00:00:00', '2016-07-19 00:00:00');
INSERT INTO `major` VALUES ('14', 'B010102', 'B010102', '3', '1', 'admin', '2016-07-19 00:00:00', '2016-07-19 00:00:00');

-- ----------------------------
-- Table structure for `superviselib`
-- ----------------------------
DROP TABLE IF EXISTS `superviselib`;
CREATE TABLE `superviselib` (
  `SUPERVISE_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `SUPERVISE_NAME` varchar(8) DEFAULT NULL COMMENT '姓名',
  `SUPERVISE_TEL1` varchar(12) DEFAULT NULL COMMENT '手机电话',
  `SUPERVISE_TEL2` varchar(12) DEFAULT NULL COMMENT '固话',
  `SUPERVISE_GENDER` varchar(1) DEFAULT NULL COMMENT '性别',
  `SUPERVISE_BIRTH` varchar(40) DEFAULT NULL,
  `SUPERVISE_COMP` varchar(40) DEFAULT NULL COMMENT '就职公司',
  `MEMO1` varchar(40) DEFAULT NULL COMMENT '备注',
  `DELETE_FLG` varchar(1) DEFAULT NULL COMMENT '删除',
  `UPDATE_USER` varchar(6) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新建日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(20) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) DEFAULT NULL COMMENT '备用5',
  PRIMARY KEY (`SUPERVISE_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of superviselib
-- ----------------------------

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `LOGIN_ID` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '登录ID',
  `LOGIN_NAME` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '登录姓名',
  `LOGIN_PW` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '登录密码',
  `RANK` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '安全等级A：一般用户,L: 超级',
  `MEMO1` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `UPDATE_USER` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新建日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  `RESERVE1` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '备用5',
  PRIMARY KEY (`LOGIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('0001', 'admin', 'b59c67bf196a4758191e42f76670ceba', 'L', '管理员', 'admin', '2013-10-10 00:00:00', '2013-10-10 00:00:00', null, null, null, null, null);
INSERT INTO `userinfo` VALUES ('0002', '负责人', 'b59c67bf196a4758191e42f76670ceba', 'C', '', 'admin', '2018-09-01 22:02:56', '2018-09-01 22:28:26', null, null, null, null, null);
INSERT INTO `userinfo` VALUES ('0003', '工程师', 'b59c67bf196a4758191e42f76670ceba', 'B', '', 'admin', '2018-09-01 22:28:57', '2018-09-01 22:28:57', null, null, null, null, null);
INSERT INTO `userinfo` VALUES ('test', 'test11', 'b59c67bf196a4758191e42f76670ceba', 'A', 'tt', 'admin', '2013-11-20 22:12:32', '2018-09-01 22:07:27', null, null, null, null, null);

-- ----------------------------
-- Table structure for `withhold`
-- ----------------------------
DROP TABLE IF EXISTS `withhold`;
CREATE TABLE `withhold` (
  `WITHHOLD_NO` varchar(10) NOT NULL COMMENT '代扣编号',
  `WITHHOLD_TYPE` varchar(1) DEFAULT NULL COMMENT '代扣分类（G：工资B：办公费F:房租D:电费Q:其他）',
  `WITHHOLD_DATE` datetime DEFAULT NULL COMMENT '代扣日期',
  `WITHHOLD_AMOUNT` decimal(11,2) DEFAULT NULL COMMENT '代扣金额',
  `WITHHOLD_REASON` varchar(60) DEFAULT NULL COMMENT '用途',
  `MEMO1` varchar(40) DEFAULT NULL COMMENT '备注',
  `DELETE_FLG` varchar(1) DEFAULT NULL COMMENT '删除',
  `UPDATE_USER` varchar(6) DEFAULT NULL COMMENT '更新者',
  `INSERT_DATE` datetime DEFAULT NULL COMMENT '新建日期',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  `RESERVE1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `RESERVE2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `RESERVE3` varchar(20) DEFAULT NULL COMMENT '备用3',
  `RESERVE4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `RESERVE5` varchar(20) DEFAULT NULL COMMENT '备用5',
  PRIMARY KEY (`WITHHOLD_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of withhold
-- ----------------------------
INSERT INTO `withhold` VALUES ('A0001', 'B', '2013-11-22 00:00:00', '100.00', 'dd1233', 'aa', '1', 'admin', '2013-11-22 00:00:00', '2016-04-13 00:14:06', null, null, null, null, null);
INSERT INTO `withhold` VALUES ('A002', 'G', '2013-12-22 00:00:00', '300.00', 'gz12222', 'bb', '1', 'admin', '2013-11-22 00:00:00', '2016-04-13 00:09:03', null, null, null, null, null);
INSERT INTO `withhold` VALUES ('A003', 'D', '2013-11-08 00:00:00', '11.00', '2211', null, '0', 'admin', '2013-11-28 00:20:11', '2014-01-10 22:10:43', null, null, null, null, null);
INSERT INTO `withhold` VALUES ('A004', 'D', '2013-11-29 00:00:00', '133.00', '4444aaaaa', null, '1', 'admin', '2013-11-28 00:22:01', '2016-04-13 00:10:12', null, null, null, null, null);
INSERT INTO `withhold` VALUES ('A005', 'Q', '2013-11-28 00:00:00', '44.00', '55', null, '1', 'admin', '2013-11-28 00:22:25', '2016-04-13 00:07:45', null, null, null, null, null);
INSERT INTO `withhold` VALUES ('A006', 'G', '2014-01-02 00:00:00', '11.00', '22', null, '1', 'admin', '2014-01-10 22:01:20', '2014-01-10 22:01:20', null, null, null, null, null);
INSERT INTO `withhold` VALUES ('A007', 'F', '2014-01-09 00:00:00', '22.00', '33', null, '1', 'admin', '2014-01-10 22:01:30', '2014-01-10 22:01:30', null, null, null, null, null);
INSERT INTO `withhold` VALUES ('A008', 'G', '2014-01-18 00:00:00', '88.00', '99', null, '1', 'admin', '2014-01-10 22:01:40', '2014-01-10 22:01:40', null, null, null, null, null);
INSERT INTO `withhold` VALUES ('A009', 'D', '2014-01-08 00:00:00', '33.00', '44', null, '1', 'admin', '2014-01-10 22:01:49', '2014-01-10 22:01:49', null, null, null, null, null);
INSERT INTO `withhold` VALUES ('A1011', 'Q', '2014-01-08 00:00:00', '44.00', '2', null, '1', 'admin', '2014-01-10 22:02:00', '2014-01-10 22:02:00', null, null, null, null, null);
INSERT INTO `withhold` VALUES ('A11', 'G', '2014-01-25 00:00:00', '55.00', '671', null, '1', 'admin', '2014-01-10 22:02:21', '2014-02-15 13:35:35', null, null, null, null, null);
INSERT INTO `withhold` VALUES ('aadd', 'G', '2016-04-14 00:00:00', '1212.00', 'ttt1', null, '1', 'admin', '2016-04-13 00:07:11', '2016-04-13 00:07:11', null, null, null, null, null);
