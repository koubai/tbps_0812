package com.cn.common.util;

/**
 * 常量类
 * @name Constants.java
 * @author Frank
 * @time 2013-9-24下午8:57:14
 * @version 1.0
 */
public class Constants {
	
	/**
	 * 验证码
	 */
	public final static String RANDOM = "random";
	
	/**
	 * 是否登录
	 */
	public final static String SESSION_ISLOGIN = "is_login";
	
	/**
	 * 已登录
	 */
	public final static String FLAG_IS_LOGIN = "1";
	
	/**
	 * 未登录
	 */
	public final static String FLAG_NOT_LOGIN = "0";
	
	/**
	 * 登录ID
	 */
	public final static String USER_ID = "user_id";
	
	/**
	 * 用户名
	 */
	public final static String USER_NAME = "user_name";
	
	/**
	 * 登录时间
	 */
	public final static String LOGIN_TIME = "login_time";
	
	/**
	 * 用户安全级别（权限）
	 */
	public final static String USER_RANK = "user_rank";
	
	/**
	 * 用户安全级别（权限=超级管理员）
	 */
	public final static String USER_RANK_ADMIN = "L";
	
	/**
	 * 用户安全级别（权限=工程师）
	 */
	public final static String USER_RANK_ENGINEER = "B";
	
	/**
	 * 是否隐藏菜单，1为隐藏，其他为不隐藏
	 */
	public final static String TOGGLE_MENU_FLAG = "toggle_menu_flag";
	
	//Excel导出
	/**
	 * Excel名
	 */
	public final static String EXCEL_TYPE = "excel_type";
	
	/**
	 * Excel数据
	 */
	public final static String EXCEL_DATA = "excel_data";
	
	/**
	 * 代扣一览
	 */
	public final static String EXCEL_TYPE_DKYL = "DKYL";
	
	/**
	 * 费用结算清单
	 */
	public final static String EXCEL_TYPE_FYJSQD = "FYJSQD";
	
	/**
	 * 招标履历一览
	 */
	public final static String EXCEL_TYPE_ZBLLYL = "ZBLLYL";
	
	/**
	 * 招标一览
	 */
	public final static String EXCEL_TYPE_ZBYL = "ZBYL";
	
	/**
	 * 招标项目清单检索
	 */
	public final static String EXCEL_TYPE_ZBYL_AD01 = "ZBYL_AD01";
	
	/**
	 * 招标一览（完整信息一览）
	 */
	public final static String EXCEL_TYPE_ALL_ZBYL = "ALL_ZBYL";

	//-----export Bid receipt info  20150425  --->>
	/**
	 * 招标一览（发票）
	 */
	public final static String EXCEL_TYPE_RECEIPT_ZBYL = "RECEIPT_ZBYL";
	//-----export Bid receipt info  20150425  <<---

	/**
	 * 委托公司一览
	 */
	public final static String EXCEL_TYPE_WTGSYL = "WTGSYL";
	
	/**
	 * 审价一览
	 */
	public final static String EXCEL_TYPE_SJYL = "SJYL";
	
	/**
	 * 审价履历一览
	 */
	public final static String EXCEL_TYPE_SJLLYL = "SJLLYL";
	
	/**
	 * 审价一览（发票）
	 */
	public final static String EXCEL_TYPE_RECEIPT_SJYL = "RECEIPT_SJYL";
	
	/**
	 * 审价统计数据
	 */
	public final static String EXCEL_TYPE_SJTJ = "SJTJ";
	/**
	 * 月报统计数据
	 */
	public final static String EXCEL_TYPE_YBTJ = "YBTJ";
	
	/**
	 * 保证金汇总
	 */
	public final static String EXCEL_TYPE_BZJHZ = "BZJHZ";
	
	/**
	 * 保证金汇总
	 */
	public final static String EXCEL_TYPE_BZJHZ_AD01 = "BZJHZ_AD01";
	
	/**
	 * 保证金明细
	 */
	public final static String EXCEL_TYPE_BZJMX = "BZJMX";
	
	/**
	 * 专家信息一览
	 */
	public final static String EXCEL_TYPE_ZJXXYL = "ZJXXYL";
	
	/**
	 * 专家信息导出（招标页面）
	 */
	public final static String EXCEL_TYPE_ZJXXDC = "ZJXXDC";
	
	//删除标记
	/**
	 * 已删除
	 */
	public final static String IS_DELETE_DEL = "0";
	
	/**
	 * 正常
	 */
	public final static String IS_DELETE_NORMAL = "1";
	
	/**
	 * 是否中标（是）
	 */
	public final static String BID_RESULT_YES = "Y";
	
	/**
	 * 是否中标（否）
	 */
	public final static String BID_RESULT_NO = "N";
	
	/**
	 * 招标序列号（招标）
	 */
	public final static String CONFIG_TAB_BID_ZB_SEQ = "BID_ZB_SEQ";
	
	/**
	 * 招标序列号（比选）
	 */
	public final static String CONFIG_TAB_BID_BX_SEQ = "BID_BX_SEQ";
	
	/**
	 * 招标序列号（竞价）
	 */
	public final static String CONFIG_TAB_BID_JJ_SEQ = "BID_JJ_SEQ";

	/**
	 * 招标序列号（其他）
	 */
	public final static String CONFIG_TAB_BID_QT_SEQ = "BID_QT_SEQ";

	/**
	 * 审价序列号
	 */
	public final static String CONFIG_TAB_AUDIT_SEQ = "AUDIT_SEQ";
	
	/**
	 * 审价公司信息
	 */
	public final static String CONFIG_TAB_AUDIT_COMP = "AUDIT_COMP";
	
	/**
	 * 审价显示项目列表
	 */
	public final static String CONFIG_TAB_AUDIT_DISP = "AUDIT_LISTDISP";
	
	/**
	 * 审价显示项目列表
	 */
	public final static String CONFIG_TAB_AUDIT_ALLDISP = "AUDIT_ALLDISP";
	
	/**
	 * 审价流转表
	 */
	public final static String EXCEL_TYPE_SJLZ = "SJLZB";
	
	/**
	 * 招标代理支付方
	 */
	public final static String CONFIG_TAB_BID_AGENT_PAY_COMP = "AGENT_PAY_COMP";
	
	/**
	 * 招标流转表
	 */
	public final static String EXCEL_TYPE_ZBLZ = "ZBLZB";
	
	/**
	 * 招标报名表
	 */
	public final static String EXCEL_TYPE_ZBBM = "ZB_REGISTER";
	
	/**
	 * 单个投标公司报名表
	 */
	public final static String EXCEL_TYPE_ZBSBM = "ZB_S_REGISTER";
	
	/**
	 * 招标报名表回执
	 */
	public final static String EXCEL_TYPE_ZBHZ = "ZB_REPLY";
	
	/**
	 * 招标审核表签收
	 */
	public final static String EXCEL_TYPE_ZBSD = "ZB_RECEIVE";
	
	/**
	 * 招标审核表
	 */
	public final static String EXCEL_TYPE_ZBSH = "ZB_AUDIT";
	
	/**
	 * 招标保证金收据
	 */
	public final static String EXCEL_TYPE_ZBBZJ = "ZB_DEPOSIT";
	
	/**
	 * 招标保证金签收
	 */
	public final static String EXCEL_TYPE_ZBTD = "ZB_CANCEL";
	
	/**
	 * 招标中标签收
	 */
	public final static String EXCEL_TYPE_ZBQS = "ZB_SIGN";
	
	/**
	 * 招标标书费
	 */
	public final static String EXCEL_TYPE_ZBBS = "ZB_BASE";
	
	/**
	 * 审定单（地铁）
	 */
	public final static String EXCEL_TYPE_SJSDD = "SJ_SDD_METRO";
	
	/**
	 * 审定单（非地铁）
	 */
	public final static String EXCEL_TYPE_SJSDD2 = "SJ_SDD_NO_METRO";
	
	/**
	 * 资料登记表
	 */
	public final static String EXCEL_TYPE_SJDJ = "SJ_REGISTER";
	
	/**
	 * 会商纪要
	 */
	public final static String EXCEL_TYPE_HSJY = "SJ_SUMMARY";
	
	/**
	 * 封面
	 */
	public final static String EXCEL_TYPE_COVER = "SJ_COVER";
	
	/**
	 * 签署页
	 */
	public final static String EXCEL_TYPE_SIGN = "SJ_SIGN";
	
	/**
	 * 签署页
	 */
	public final static String DOC_TYPE_REPORT = "SJ_REPORT";
	
	/**
	 * 上传文件路径
	 */
	public final static String PROPERTIES_FILE_PATH = "file_path";
	
	public final static String FINISH_STATUS_IN_CANCEL = "10";//取消
	public final static String FINISH_STATUS_IN_PROCESS = "20";//进行中
	public final static String FINISH_STATUS_IN_FAILED1 = "52";//失败（报名不满6家）
	public final static String FINISH_STATUS_IN_FAILED2 = "54";//失败（开标不满3家）
	public final static String FINISH_STATUS_IN_FAILED3 = "56";//失败（评审失败）
	public final static String FINISH_STATUS_IN_STOP = "70";//终止
	public final static String FINISH_STATUS_IN_DONE = "90";//完成
	
	//招标所有源数据
	public final static String EXCEL_TYPE_BIDDATAREPORT = "BIDDATA_REPORT";
	//招标工程师模板
	public final static String EXCEL_TYPE_BIDENGINEERREPORT = "BIDENGINEER_REPORT";
	//招标财务模板
	public final static String EXCEL_TYPE_BIDACCOUNTREPORT = "BIDACCOUNT_EPORT";
	//招标内业模板
	public final static String EXCEL_TYPE_BIDNEIYEREPORT = "BIDINTERNAL_EPORT";
	//招标专家评审费申请发放表
	public final static String EXCEL_TYPE_EXPERTPAYREPORT = "EXPERTPAY_REPORT";
}
