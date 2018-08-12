package com.cn.tbps.dto;

import java.math.BigDecimal;
import java.util.Date;

import com.cn.common.dto.BaseDto;

/**
 * 招标
 * @author Frank
 * @time 2013-10-14上午12:30:17
 * @version 1.0
 */
public class BidCompExportDto extends BaseDto {

	private static final long serialVersionUID = -1736740989779450662L;

	/**
	 * 招标编号
	 */
	private String BID_NO;
	
	/**
	 * 招标编号是否随机生成（1为随机，0为不随机）
	 */
	private String IS_RANDOM;

	/**
	 * 分类
	 */
	private String PROJECT_TYPE;
	
	/**
	 * 分类名
	 */
	private String PROJECT_TYPE_NAME;
	
	/**
	 * 投标状态
	 * （1：未开标，支付单位为空；2：未到帐，支付单位不为空,到帐日期为空,或大于当前日；3：已到帐，支付单位不为空,到帐日期不为空,且小于等于当前日）
	 */
	private String BID_STATUS;
	
	/**
	 * 到帐日期
	 */
	private Date BID_VALUE_DATE;

	/**
	 * 项目名称
	 */
	private String PROJECT_NAME;

	/**
	 * 担当者
	 */
	private String PROJECT_MANAGER;

	/**
	 * 上网公告日
	 */
	private Date ONLINE_DATE;

	/**
	 * 报名截止日
	 */
	private Date SUBMIT_DATE;

	/**
	 * 报名截止日
	 */
	private Date SUBMIT_DATE2;

	/**
	 * 发标日期
	 */
	private Date TENDER_START_DATE;

	/**
	 * 开标日期
	 */
	private Date TENDER_OPEN_DATE;

	/**
	 * 委托公司代码
	 */
	private String AGENT_NO;

	/**
	 * 委托公司名称
	 */
	private String AGENT_CO_NAME;

	/**
	 * 委托公司联系人
	 */
	private String AGENT_CO_MANAGER;

	/**
	 * 委托公司电话
	 */
	private String AGENT_CO_MANAGER_TEL;

	/**
	 * 委托公司地址
	 */
	private String AGENT_CO_POST_ADDRESS;

	/**
	 * 委托公司邮箱
	 */
	private String AGENT_CO_MAIL;
	
	private String agent_mail_pr;
	
	private String agent_mail_suffix;

	/**
	 * 专业公司代码
	 */
	private String PROF_NO;

	/**
	 * 专业公司名称
	 */
	private String PROF_CO_NAME;

	/**
	 * 专业公司负责人
	 */
	private String PROF_CO_MANAGER;

	/**
	 * 专业公司电话
	 */
	private String PROF_CO_MANAGER_TEL;

	/**
	 * 专业公司地址
	 */
	private String PROF_CO_POST_ADDRESS;

	/**
	 * 专业公司邮箱
	 */
	private String PROF_CO_MAIL;
	
	private String prof_mail_pr;
	
	private String prof_mail_suffix;
	
	/**
	 * 工程概况批文
	 */
	private String PROJ_APPROVAL;
	
	/**
	 * 工程概况计划价格
	 */
	private String PROJ_PLAN_PRICE;
	
	/**
	 * 工程概况限价
	 */
	private String PROJ_ASTRICT_PRICE;

	/**
	 * 担当者签名
	 */
	private String TENDER_ONLINE;

	/**
	 * 网页下载
	 */
	private String TENDER_DOWNLOAD;

	/**
	 * 报名表式（编制）
	 */
	private String APPLY_FORM_EDIT;

	/**
	 * 报名表式（审核）
	 */
	private String APPLY_FORM_VERIFY;

	/**
	 * 报名表式（汇总）
	 */
	private String APPLY_FORM_MERGE;

	/**
	 * 名单提供
	 */
	private String EXPERT_NAME_OFFERED;

	/**
	 * 通知与否
	 */
	private String EXPERT_INFORMED;

	/**
	 * 通知确认
	 */
	private String EXPERT_NAME_CONFIRMED;

	/**
	 * 澄清文件
	 */
	private String CLARIFY_DOC;

	/**
	 * 补遗文件
	 */
	private String SUPPORT_DOC;

	/**
	 * 补遗文件发出
	 */
	private String SUPPORT_DOC_SENT;

	/**
	 * 投标人回复
	 */
	private String BIDDER_REPLY;

	/**
	 * 公示
	 */
	private String OPEN_RESULT;

	/**
	 * 公示审核
	 */
	private String OPEN_VERIFY;

	/**
	 * 通知书发出
	 */
	private String INFORM_SENT;

	/**
	 * 合同告知书
	 */
	private String INFORM_CONTRACT;

	/**
	 * 附件邮甲方
	 */
	private String ATTACH_POST_A;

	/**
	 * 合同审核
	 */
	private String CONTRACT_VERIFY;

	/**
	 * 意见稿发出
	 */
	private String COMMENT_POST;

	/**
	 * 报告编制
	 */
	private String BID_REOPRT_EDIT;

	/**
	 * 报告审核
	 */
	private String BID_REPORT_VERIFY;

	/**
	 * 报告发出
	 */
	private String BID_REPORT_SENT;
	
	/**
	 * 招标代理支付方
	 */
	private String BID_AGENT_PAY;

	/**
	 * 招标代理支付方（其它）
	 */
	private String BID_AGENT_PAY2;

	/**
	 * 是否需要新增招标资料费
	 */
	private String BID_NEED_MATERIAL_PRICE;

	/**
	 * 报名要求
	 */
	private String APPLY_REQUIRE;

	/**
	 * 中标公告日期FROM
	 */
	private Date BID_NOTICE_DATE;

	/**
	 * 中标公告日期TO
	 */
	private Date BID_NOTICE_DATE2;

	/**
	 * 中标通知书发出日
	 */
	private Date BID_MESSAGE_DATE;

	/**
	 * 评标报告移交时间
	 */
	private Date MATERIAL_EXPRESS_DATE;

	/**
	 * 招标代理费
	 */
	private BigDecimal BID_AGENT_PRICE;

	/**
	 * 项目完成情况
	 */
	private String FINISH_STATUS;

	/**
	 * 项目完成情况的备注
	 */
	private String FINISH_NOTE;
	
	/**
	 * 投标状态（10新增，20报名，30保证金，40开标评标，50资料归档）
	 */
	private String STATUS;
	
	/**
	 * 备用日期1
	 */
	private Date RESERVE_DATE1;
	
	/**
	 * 备用日期2
	 */
	private Date RESERVE_DATE2;
	
	/**
	 * 项目过程确认信息预留字段
	 */
	private String PROJECT_PROCESS_02_04;
	
	/**
	 * 项目过程确认信息预留字段
	 */
	private String PROJECT_PROCESS_02_05;

	/**
	 * 项目过程确认信息预留字段
	 */
	private String PROJECT_PROCESS_03_05;

	/**
	 * 项目过程确认信息预留字段
	 */
	private String PROJECT_PROCESS_04_05;

	/**
	 * 项目过程确认信息预留字段
	 */
	private String PROJECT_PROCESS_05_04;

	/**
	 * 项目过程确认信息预留字段
	 */
	private String PROJECT_PROCESS_05_05;

	/**
	 * 项目过程确认信息预留字段
	 */
	private String PROJECT_PROCESS_06_04;

	/**
	 * 项目过程确认信息预留字段
	 */
	private String PROJECT_PROCESS_06_05;

	/**
	 * 快递编号
	 */
	private String BID_POST_NO;

	/**
	 * 代理费
	 */
	private BigDecimal RECEIPT1_AGENT_COMMISSION;

	/**
	 * 开票日期
	 */
	private Date RECEIPT1_DATE;

	/**
	 * 开票人
	 */
	private String RECEIPT1_STAFF;

	/**
	 * 发票号码
	 */
	private String RECEIPT1_NO;

	/**
	 * 到账日期
	 */
	private Date RECEIPT1_VALUE_DATE;

	/**
	 * 评标费
	 */
	private BigDecimal BID_COMMISION;

	/**
	 * 接受人
	 */
	private String RECEIPT1_RECEIVER;

	/**
	 * 签收单编号
	 */
	private String RECEIPT2_NO;

	/**
	 * 签收时间
	 */
	private Date RECEIPT2_DATE;

	/**
	 * 快递编号
	 */
	private String RECEIPT2_POST_NO;

	/**
	 * 快递时间
	 */
	private Date RECEIPT2_EXPRESS_DATE;

	/**
	 * 备注
	 */
	private String MEMO1;

	/**
	 * 投标公司列表
	 */
	private String BID_CO_LIST;
	
	/**
	 * 投标公司名称列表（显示用，以逗号分割）
	 */
	private String BID_CO_NAME_LIST;

	/**
	 * 评审专家列表
	 */
	private String BID_EXPERT_LIST;
	
	/**
	 * 评审专家名称列表（显示用，以逗号分割）
	 */
	private String BID_EXPERT_NAME_LIST;
	
	/**
	 * 中标公司号
	 */
	private Integer BID_CO_SEQ;
	
	/**
	 * 中标公司名称
	 */
	private String BID_CO_NAME;
	
	/**
	 * 中标公司标书费
	 */
	private BigDecimal BID_APPLY_PRICE;
	
	/**
	 * 中标价
	 */
	private BigDecimal BID_PRICE;

	/**
	 * 删除
	 */
	private String DELETE_FLG;

	/**
	 * 更新者
	 */
	private String UPDATE_USER;
	
	/**
	 * 新建日期
	 */
	private Date INSERT_DATE;

	/**
	 * 更新日期
	 */
	private Date UPDATE_DATE;

	/**
	 * 备用1
	 */
	private String RESERVE1;

	/**
	 * 备用2
	 */
	private String RESERVE2;

	/**
	 * 备用3
	 */
	private String RESERVE3;

	/**
	 * 备用4
	 */
	private String RESERVE4;

	/**
	 * 备用5
	 */
	private String RESERVE5;
	
	//投标公司内容

	/**
	 * 公司号
	 */
	private Integer BID_CO_NO;

	/**
	 * 公司名称
	 */
	private String BID_CO_NAME_1;

	/**
	 * 负责人
	 */
	private String BID_CO_MANAGER;

	/**
	 * 联系电话
	 */
	private String BID_CO_TEL;

	/**
	 * 地址
	 */
	private String BID_CO_ADD;

	/**
	 * 邮箱
	 */
	private String BID_CO_PS;
	
	/**
	 * 邮箱前缀
	 */
	private String mail_pr;
	
	/**
	 * 邮箱后缀
	 */
	private String mail_suffix;

	/**
	 * 保证金
	 */
	private BigDecimal BID_BOND;

	/**
	 * 退还签名
	 */
	private String BID_REFUND_SIGN;

	/**
	 * 支付形式
	 */
	private String BID_PAYMENT_TYPE;

	/**
	 * 投标价
	 */
	private BigDecimal BID_PRICE_1;

	/**
	 * 评审价
	 */
	private BigDecimal BID_CHECK_PRICE;

	/**
	 * 中标与否
	 */
	private String BID_RESULT;

	/**
	 * 中标价
	 */
	private BigDecimal BID_WIN_PRICE;

	/**
	 * 标书费
	 */
	private BigDecimal BID_APPLY_PRICE_1;

	/**
	 * 到账日期
	 */
	private Date BID_VALUE_DATE_1;

	/**
	 * 发票号码
	 */
	private String BID_RECEIPT_NO;

	public String getBID_NO() {
		return BID_NO;
	}

	public void setBID_NO(String bID_NO) {
		BID_NO = bID_NO;
	}

	public String getPROJECT_TYPE() {
		return PROJECT_TYPE;
	}

	public void setPROJECT_TYPE(String pROJECT_TYPE) {
		PROJECT_TYPE = pROJECT_TYPE;
	}

	public String getPROJECT_NAME() {
		return PROJECT_NAME;
	}

	public void setPROJECT_NAME(String pROJECT_NAME) {
		PROJECT_NAME = pROJECT_NAME;
	}

	public String getPROJECT_MANAGER() {
		return PROJECT_MANAGER;
	}

	public void setPROJECT_MANAGER(String pROJECT_MANAGER) {
		PROJECT_MANAGER = pROJECT_MANAGER;
	}

	public Date getONLINE_DATE() {
		return ONLINE_DATE;
	}

	public void setONLINE_DATE(Date oNLINE_DATE) {
		ONLINE_DATE = oNLINE_DATE;
	}

	public Date getSUBMIT_DATE() {
		return SUBMIT_DATE;
	}

	public Date getSUBMIT_DATE2() {
		return SUBMIT_DATE2;
	}

	public void setSUBMIT_DATE(Date sUBMIT_DATE) {
		SUBMIT_DATE = sUBMIT_DATE;
	}

	public void setSUBMIT_DATE2(Date sUBMIT_DATE2) {
		SUBMIT_DATE2 = sUBMIT_DATE2;
	}

	public Date getTENDER_START_DATE() {
		return TENDER_START_DATE;
	}

	public void setTENDER_START_DATE(Date tENDER_START_DATE) {
		TENDER_START_DATE = tENDER_START_DATE;
	}

	public Date getTENDER_OPEN_DATE() {
		return TENDER_OPEN_DATE;
	}

	public void setTENDER_OPEN_DATE(Date tENDER_OPEN_DATE) {
		TENDER_OPEN_DATE = tENDER_OPEN_DATE;
	}

	public String getAGENT_NO() {
		return AGENT_NO;
	}

	public void setAGENT_NO(String aGENT_NO) {
		AGENT_NO = aGENT_NO;
	}

	public String getAGENT_CO_NAME() {
		return AGENT_CO_NAME;
	}

	public void setAGENT_CO_NAME(String aGENT_CO_NAME) {
		AGENT_CO_NAME = aGENT_CO_NAME;
	}

	public String getAGENT_CO_MANAGER() {
		return AGENT_CO_MANAGER;
	}

	public void setAGENT_CO_MANAGER(String aGENT_CO_MANAGER) {
		AGENT_CO_MANAGER = aGENT_CO_MANAGER;
	}

	public String getAGENT_CO_MANAGER_TEL() {
		return AGENT_CO_MANAGER_TEL;
	}

	public void setAGENT_CO_MANAGER_TEL(String aGENT_CO_MANAGER_TEL) {
		AGENT_CO_MANAGER_TEL = aGENT_CO_MANAGER_TEL;
	}

	public String getAGENT_CO_POST_ADDRESS() {
		return AGENT_CO_POST_ADDRESS;
	}

	public void setAGENT_CO_POST_ADDRESS(String aGENT_CO_POST_ADDRESS) {
		AGENT_CO_POST_ADDRESS = aGENT_CO_POST_ADDRESS;
	}

	public String getAGENT_CO_MAIL() {
		return AGENT_CO_MAIL;
	}

	public void setAGENT_CO_MAIL(String aGENT_CO_MAIL) {
		AGENT_CO_MAIL = aGENT_CO_MAIL;
	}

	public String getPROF_NO() {
		return PROF_NO;
	}

	public void setPROF_NO(String pROF_NO) {
		PROF_NO = pROF_NO;
	}

	public String getPROF_CO_NAME() {
		return PROF_CO_NAME;
	}

	public void setPROF_CO_NAME(String pROF_CO_NAME) {
		PROF_CO_NAME = pROF_CO_NAME;
	}

	public String getPROF_CO_MANAGER() {
		return PROF_CO_MANAGER;
	}

	public void setPROF_CO_MANAGER(String pROF_CO_MANAGER) {
		PROF_CO_MANAGER = pROF_CO_MANAGER;
	}

	public String getPROF_CO_MANAGER_TEL() {
		return PROF_CO_MANAGER_TEL;
	}

	public void setPROF_CO_MANAGER_TEL(String pROF_CO_MANAGER_TEL) {
		PROF_CO_MANAGER_TEL = pROF_CO_MANAGER_TEL;
	}

	public String getPROF_CO_POST_ADDRESS() {
		return PROF_CO_POST_ADDRESS;
	}

	public void setPROF_CO_POST_ADDRESS(String pROF_CO_POST_ADDRESS) {
		PROF_CO_POST_ADDRESS = pROF_CO_POST_ADDRESS;
	}

	public String getPROF_CO_MAIL() {
		return PROF_CO_MAIL;
	}

	public void setPROF_CO_MAIL(String pROF_CO_MAIL) {
		PROF_CO_MAIL = pROF_CO_MAIL;
	}

	public String getTENDER_ONLINE() {
		return TENDER_ONLINE;
	}

	public void setTENDER_ONLINE(String tENDER_ONLINE) {
		TENDER_ONLINE = tENDER_ONLINE;
	}

	public String getTENDER_DOWNLOAD() {
		return TENDER_DOWNLOAD;
	}

	public void setTENDER_DOWNLOAD(String tENDER_DOWNLOAD) {
		TENDER_DOWNLOAD = tENDER_DOWNLOAD;
	}

	public String getAPPLY_FORM_EDIT() {
		return APPLY_FORM_EDIT;
	}

	public void setAPPLY_FORM_EDIT(String aPPLY_FORM_EDIT) {
		APPLY_FORM_EDIT = aPPLY_FORM_EDIT;
	}

	public String getAPPLY_FORM_VERIFY() {
		return APPLY_FORM_VERIFY;
	}

	public void setAPPLY_FORM_VERIFY(String aPPLY_FORM_VERIFY) {
		APPLY_FORM_VERIFY = aPPLY_FORM_VERIFY;
	}

	public String getAPPLY_FORM_MERGE() {
		return APPLY_FORM_MERGE;
	}

	public void setAPPLY_FORM_MERGE(String aPPLY_FORM_MERGE) {
		APPLY_FORM_MERGE = aPPLY_FORM_MERGE;
	}

	public String getEXPERT_NAME_OFFERED() {
		return EXPERT_NAME_OFFERED;
	}

	public void setEXPERT_NAME_OFFERED(String eXPERT_NAME_OFFERED) {
		EXPERT_NAME_OFFERED = eXPERT_NAME_OFFERED;
	}

	public String getEXPERT_INFORMED() {
		return EXPERT_INFORMED;
	}

	public void setEXPERT_INFORMED(String eXPERT_INFORMED) {
		EXPERT_INFORMED = eXPERT_INFORMED;
	}

	public String getEXPERT_NAME_CONFIRMED() {
		return EXPERT_NAME_CONFIRMED;
	}

	public void setEXPERT_NAME_CONFIRMED(String eXPERT_NAME_CONFIRMED) {
		EXPERT_NAME_CONFIRMED = eXPERT_NAME_CONFIRMED;
	}

	public String getCLARIFY_DOC() {
		return CLARIFY_DOC;
	}

	public void setCLARIFY_DOC(String cLARIFY_DOC) {
		CLARIFY_DOC = cLARIFY_DOC;
	}

	public String getSUPPORT_DOC() {
		return SUPPORT_DOC;
	}

	public void setSUPPORT_DOC(String sUPPORT_DOC) {
		SUPPORT_DOC = sUPPORT_DOC;
	}

	public String getSUPPORT_DOC_SENT() {
		return SUPPORT_DOC_SENT;
	}

	public void setSUPPORT_DOC_SENT(String sUPPORT_DOC_SENT) {
		SUPPORT_DOC_SENT = sUPPORT_DOC_SENT;
	}

	public String getBIDDER_REPLY() {
		return BIDDER_REPLY;
	}

	public void setBIDDER_REPLY(String bIDDER_REPLY) {
		BIDDER_REPLY = bIDDER_REPLY;
	}

	public String getOPEN_RESULT() {
		return OPEN_RESULT;
	}

	public void setOPEN_RESULT(String oPEN_RESULT) {
		OPEN_RESULT = oPEN_RESULT;
	}

	public String getOPEN_VERIFY() {
		return OPEN_VERIFY;
	}

	public void setOPEN_VERIFY(String oPEN_VERIFY) {
		OPEN_VERIFY = oPEN_VERIFY;
	}

	public String getINFORM_SENT() {
		return INFORM_SENT;
	}

	public void setINFORM_SENT(String iNFORM_SENT) {
		INFORM_SENT = iNFORM_SENT;
	}

	public String getINFORM_CONTRACT() {
		return INFORM_CONTRACT;
	}

	public void setINFORM_CONTRACT(String iNFORM_CONTRACT) {
		INFORM_CONTRACT = iNFORM_CONTRACT;
	}

	public String getATTACH_POST_A() {
		return ATTACH_POST_A;
	}

	public void setATTACH_POST_A(String aTTACH_POST_A) {
		ATTACH_POST_A = aTTACH_POST_A;
	}

	public String getCONTRACT_VERIFY() {
		return CONTRACT_VERIFY;
	}

	public void setCONTRACT_VERIFY(String cONTRACT_VERIFY) {
		CONTRACT_VERIFY = cONTRACT_VERIFY;
	}

	public String getCOMMENT_POST() {
		return COMMENT_POST;
	}

	public void setCOMMENT_POST(String cOMMENT_POST) {
		COMMENT_POST = cOMMENT_POST;
	}

	public String getBID_REOPRT_EDIT() {
		return BID_REOPRT_EDIT;
	}

	public void setBID_REOPRT_EDIT(String bID_REOPRT_EDIT) {
		BID_REOPRT_EDIT = bID_REOPRT_EDIT;
	}

	public String getBID_REPORT_VERIFY() {
		return BID_REPORT_VERIFY;
	}

	public void setBID_REPORT_VERIFY(String bID_REPORT_VERIFY) {
		BID_REPORT_VERIFY = bID_REPORT_VERIFY;
	}

	public String getBID_REPORT_SENT() {
		return BID_REPORT_SENT;
	}

	public void setBID_REPORT_SENT(String bID_REPORT_SENT) {
		BID_REPORT_SENT = bID_REPORT_SENT;
	}

	public String getBID_POST_NO() {
		return BID_POST_NO;
	}

	public void setBID_POST_NO(String bID_POST_NO) {
		BID_POST_NO = bID_POST_NO;
	}

	public BigDecimal getRECEIPT1_AGENT_COMMISSION() {
		return RECEIPT1_AGENT_COMMISSION;
	}

	public void setRECEIPT1_AGENT_COMMISSION(BigDecimal rECEIPT1_AGENT_COMMISSION) {
		RECEIPT1_AGENT_COMMISSION = rECEIPT1_AGENT_COMMISSION;
	}

	public Date getRECEIPT1_DATE() {
		return RECEIPT1_DATE;
	}

	public void setRECEIPT1_DATE(Date rECEIPT1_DATE) {
		RECEIPT1_DATE = rECEIPT1_DATE;
	}

	public String getRECEIPT1_STAFF() {
		return RECEIPT1_STAFF;
	}

	public void setRECEIPT1_STAFF(String rECEIPT1_STAFF) {
		RECEIPT1_STAFF = rECEIPT1_STAFF;
	}

	public String getRECEIPT1_NO() {
		return RECEIPT1_NO;
	}

	public void setRECEIPT1_NO(String rECEIPT1_NO) {
		RECEIPT1_NO = rECEIPT1_NO;
	}

	public Date getRECEIPT1_VALUE_DATE() {
		return RECEIPT1_VALUE_DATE;
	}

	public void setRECEIPT1_VALUE_DATE(Date rECEIPT1_VALUE_DATE) {
		RECEIPT1_VALUE_DATE = rECEIPT1_VALUE_DATE;
	}

	public BigDecimal getBID_COMMISION() {
		return BID_COMMISION;
	}

	public void setBID_COMMISION(BigDecimal bID_COMMISION) {
		BID_COMMISION = bID_COMMISION;
	}

	public String getRECEIPT1_RECEIVER() {
		return RECEIPT1_RECEIVER;
	}

	public void setRECEIPT1_RECEIVER(String rECEIPT1_RECEIVER) {
		RECEIPT1_RECEIVER = rECEIPT1_RECEIVER;
	}

	public String getRECEIPT2_NO() {
		return RECEIPT2_NO;
	}

	public void setRECEIPT2_NO(String rECEIPT2_NO) {
		RECEIPT2_NO = rECEIPT2_NO;
	}

	public Date getRECEIPT2_DATE() {
		return RECEIPT2_DATE;
	}

	public void setRECEIPT2_DATE(Date rECEIPT2_DATE) {
		RECEIPT2_DATE = rECEIPT2_DATE;
	}

	public String getRECEIPT2_POST_NO() {
		return RECEIPT2_POST_NO;
	}

	public void setRECEIPT2_POST_NO(String rECEIPT2_POST_NO) {
		RECEIPT2_POST_NO = rECEIPT2_POST_NO;
	}

	public Date getRECEIPT2_EXPRESS_DATE() {
		return RECEIPT2_EXPRESS_DATE;
	}

	public void setRECEIPT2_EXPRESS_DATE(Date rECEIPT2_EXPRESS_DATE) {
		RECEIPT2_EXPRESS_DATE = rECEIPT2_EXPRESS_DATE;
	}

	public String getMEMO1() {
		return MEMO1;
	}

	public void setMEMO1(String mEMO1) {
		MEMO1 = mEMO1;
	}

	public String getBID_CO_LIST() {
		return BID_CO_LIST;
	}

	public void setBID_CO_LIST(String bID_CO_LIST) {
		BID_CO_LIST = bID_CO_LIST;
	}

	public String getBID_EXPERT_LIST() {
		return BID_EXPERT_LIST;
	}

	public void setBID_EXPERT_LIST(String bID_EXPERT_LIST) {
		BID_EXPERT_LIST = bID_EXPERT_LIST;
	}

	public String getDELETE_FLG() {
		return DELETE_FLG;
	}

	public void setDELETE_FLG(String dELETE_FLG) {
		DELETE_FLG = dELETE_FLG;
	}

	public String getUPDATE_USER() {
		return UPDATE_USER;
	}

	public void setUPDATE_USER(String uPDATE_USER) {
		UPDATE_USER = uPDATE_USER;
	}

	public Date getINSERT_DATE() {
		return INSERT_DATE;
	}

	public void setINSERT_DATE(Date iNSERT_DATE) {
		INSERT_DATE = iNSERT_DATE;
	}

	public Date getUPDATE_DATE() {
		return UPDATE_DATE;
	}

	public void setUPDATE_DATE(Date uPDATE_DATE) {
		UPDATE_DATE = uPDATE_DATE;
	}

	public String getRESERVE1() {
		return RESERVE1;
	}

	public void setRESERVE1(String rESERVE1) {
		RESERVE1 = rESERVE1;
	}

	public String getRESERVE2() {
		return RESERVE2;
	}

	public void setRESERVE2(String rESERVE2) {
		RESERVE2 = rESERVE2;
	}

	public String getRESERVE3() {
		return RESERVE3;
	}

	public void setRESERVE3(String rESERVE3) {
		RESERVE3 = rESERVE3;
	}

	public String getRESERVE4() {
		return RESERVE4;
	}

	public void setRESERVE4(String rESERVE4) {
		RESERVE4 = rESERVE4;
	}

	public String getRESERVE5() {
		return RESERVE5;
	}

	public void setRESERVE5(String rESERVE5) {
		RESERVE5 = rESERVE5;
	}

	public Integer getBID_CO_SEQ() {
		return BID_CO_SEQ;
	}

	public void setBID_CO_SEQ(Integer bID_CO_SEQ) {
		BID_CO_SEQ = bID_CO_SEQ;
	}

	public String getBID_CO_NAME() {
		return BID_CO_NAME;
	}

	public void setBID_CO_NAME(String bID_CO_NAME) {
		BID_CO_NAME = bID_CO_NAME;
	}

	public BigDecimal getBID_PRICE() {
		return BID_PRICE;
	}

	public void setBID_PRICE(BigDecimal bID_PRICE) {
		BID_PRICE = bID_PRICE;
	}

	public BigDecimal getBID_APPLY_PRICE() {
		return BID_APPLY_PRICE;
	}

	public void setBID_APPLY_PRICE(BigDecimal bID_APPLY_PRICE) {
		BID_APPLY_PRICE = bID_APPLY_PRICE;
	}

	public String getPROJ_APPROVAL() {
		return PROJ_APPROVAL;
	}

	public void setPROJ_APPROVAL(String pROJ_APPROVAL) {
		PROJ_APPROVAL = pROJ_APPROVAL;
	}

	public String getPROJ_PLAN_PRICE() {
		return PROJ_PLAN_PRICE;
	}

	public void setPROJ_PLAN_PRICE(String pROJ_PLAN_PRICE) {
		PROJ_PLAN_PRICE = pROJ_PLAN_PRICE;
	}

	public String getPROJ_ASTRICT_PRICE() {
		return PROJ_ASTRICT_PRICE;
	}

	public void setPROJ_ASTRICT_PRICE(String pROJ_ASTRICT_PRICE) {
		PROJ_ASTRICT_PRICE = pROJ_ASTRICT_PRICE;
	}

	public String getPROJECT_PROCESS_02_04() {
		return PROJECT_PROCESS_02_04;
	}

	public void setPROJECT_PROCESS_02_04(String pROJECT_PROCESS_02_04) {
		PROJECT_PROCESS_02_04 = pROJECT_PROCESS_02_04;
	}

	public String getPROJECT_PROCESS_02_05() {
		return PROJECT_PROCESS_02_05;
	}

	public void setPROJECT_PROCESS_02_05(String pROJECT_PROCESS_02_05) {
		PROJECT_PROCESS_02_05 = pROJECT_PROCESS_02_05;
	}

	public String getPROJECT_PROCESS_03_05() {
		return PROJECT_PROCESS_03_05;
	}

	public void setPROJECT_PROCESS_03_05(String pROJECT_PROCESS_03_05) {
		PROJECT_PROCESS_03_05 = pROJECT_PROCESS_03_05;
	}

	public String getPROJECT_PROCESS_04_05() {
		return PROJECT_PROCESS_04_05;
	}

	public void setPROJECT_PROCESS_04_05(String pROJECT_PROCESS_04_05) {
		PROJECT_PROCESS_04_05 = pROJECT_PROCESS_04_05;
	}

	public String getPROJECT_PROCESS_05_04() {
		return PROJECT_PROCESS_05_04;
	}

	public void setPROJECT_PROCESS_05_04(String pROJECT_PROCESS_05_04) {
		PROJECT_PROCESS_05_04 = pROJECT_PROCESS_05_04;
	}

	public String getPROJECT_PROCESS_05_05() {
		return PROJECT_PROCESS_05_05;
	}

	public void setPROJECT_PROCESS_05_05(String pROJECT_PROCESS_05_05) {
		PROJECT_PROCESS_05_05 = pROJECT_PROCESS_05_05;
	}

	public String getPROJECT_PROCESS_06_04() {
		return PROJECT_PROCESS_06_04;
	}

	public void setPROJECT_PROCESS_06_04(String pROJECT_PROCESS_06_04) {
		PROJECT_PROCESS_06_04 = pROJECT_PROCESS_06_04;
	}

	public String getPROJECT_PROCESS_06_05() {
		return PROJECT_PROCESS_06_05;
	}

	public void setPROJECT_PROCESS_06_05(String pROJECT_PROCESS_06_05) {
		PROJECT_PROCESS_06_05 = pROJECT_PROCESS_06_05;
	}

	public String getBID_STATUS() {
		return BID_STATUS;
	}

	public void setBID_STATUS(String bID_STATUS) {
		BID_STATUS = bID_STATUS;
	}

	public Date getBID_VALUE_DATE() {
		return BID_VALUE_DATE;
	}

	public void setBID_VALUE_DATE(Date bID_VALUE_DATE) {
		BID_VALUE_DATE = bID_VALUE_DATE;
	}

	public String getAgent_mail_pr() {
		return agent_mail_pr;
	}

	public void setAgent_mail_pr(String agent_mail_pr) {
		this.agent_mail_pr = agent_mail_pr;
	}

	public String getAgent_mail_suffix() {
		return agent_mail_suffix;
	}

	public void setAgent_mail_suffix(String agent_mail_suffix) {
		this.agent_mail_suffix = agent_mail_suffix;
	}

	public String getProf_mail_pr() {
		return prof_mail_pr;
	}

	public void setProf_mail_pr(String prof_mail_pr) {
		this.prof_mail_pr = prof_mail_pr;
	}

	public String getProf_mail_suffix() {
		return prof_mail_suffix;
	}

	public void setProf_mail_suffix(String prof_mail_suffix) {
		this.prof_mail_suffix = prof_mail_suffix;
	}

	public String getBID_CO_NAME_LIST() {
		return BID_CO_NAME_LIST;
	}

	public void setBID_CO_NAME_LIST(String bID_CO_NAME_LIST) {
		BID_CO_NAME_LIST = bID_CO_NAME_LIST;
	}

	public String getBID_EXPERT_NAME_LIST() {
		return BID_EXPERT_NAME_LIST;
	}

	public void setBID_EXPERT_NAME_LIST(String bID_EXPERT_NAME_LIST) {
		BID_EXPERT_NAME_LIST = bID_EXPERT_NAME_LIST;
	}

	public String getIS_RANDOM() {
		return IS_RANDOM;
	}

	public void setIS_RANDOM(String iS_RANDOM) {
		IS_RANDOM = iS_RANDOM;
	}

	public String getPROJECT_TYPE_NAME() {
		return PROJECT_TYPE_NAME;
	}

	public void setPROJECT_TYPE_NAME(String pROJECT_TYPE_NAME) {
		PROJECT_TYPE_NAME = pROJECT_TYPE_NAME;
	}

	public Integer getBID_CO_NO() {
		return BID_CO_NO;
	}

	public void setBID_CO_NO(Integer bID_CO_NO) {
		BID_CO_NO = bID_CO_NO;
	}

	public String getBID_CO_NAME_1() {
		return BID_CO_NAME_1;
	}

	public void setBID_CO_NAME_1(String bID_CO_NAME_1) {
		BID_CO_NAME_1 = bID_CO_NAME_1;
	}

	public String getBID_CO_MANAGER() {
		return BID_CO_MANAGER;
	}

	public void setBID_CO_MANAGER(String bID_CO_MANAGER) {
		BID_CO_MANAGER = bID_CO_MANAGER;
	}

	public String getBID_CO_TEL() {
		return BID_CO_TEL;
	}

	public void setBID_CO_TEL(String bID_CO_TEL) {
		BID_CO_TEL = bID_CO_TEL;
	}

	public String getBID_CO_ADD() {
		return BID_CO_ADD;
	}

	public void setBID_CO_ADD(String bID_CO_ADD) {
		BID_CO_ADD = bID_CO_ADD;
	}

	public String getBID_CO_PS() {
		return BID_CO_PS;
	}

	public void setBID_CO_PS(String bID_CO_PS) {
		BID_CO_PS = bID_CO_PS;
	}

	public String getMail_pr() {
		return mail_pr;
	}

	public void setMail_pr(String mail_pr) {
		this.mail_pr = mail_pr;
	}

	public String getMail_suffix() {
		return mail_suffix;
	}

	public void setMail_suffix(String mail_suffix) {
		this.mail_suffix = mail_suffix;
	}

	public BigDecimal getBID_BOND() {
		return BID_BOND;
	}

	public void setBID_BOND(BigDecimal bID_BOND) {
		BID_BOND = bID_BOND;
	}

	public String getBID_REFUND_SIGN() {
		return BID_REFUND_SIGN;
	}

	public void setBID_REFUND_SIGN(String bID_REFUND_SIGN) {
		BID_REFUND_SIGN = bID_REFUND_SIGN;
	}

	public String getBID_PAYMENT_TYPE() {
		if("1".equals(BID_PAYMENT_TYPE)) {
			BID_PAYMENT_TYPE = "现金";
		} else if("2".equals(BID_PAYMENT_TYPE)) {
			BID_PAYMENT_TYPE = "支票";
		} else if("3".equals(BID_PAYMENT_TYPE)) {
			BID_PAYMENT_TYPE = "转账";
		} else if("4".equals(BID_PAYMENT_TYPE)) {
			BID_PAYMENT_TYPE = "汇票";
		} else if("5".equals(BID_PAYMENT_TYPE)) {
			BID_PAYMENT_TYPE = "保函";
		} else if("6".equals(BID_PAYMENT_TYPE)) {
			BID_PAYMENT_TYPE = "现金2";
		}
		return BID_PAYMENT_TYPE;
	}

	public void setBID_PAYMENT_TYPE(String bID_PAYMENT_TYPE) {
		BID_PAYMENT_TYPE = bID_PAYMENT_TYPE;
	}

	public BigDecimal getBID_PRICE_1() {
		return BID_PRICE_1;
	}

	public void setBID_PRICE_1(BigDecimal bID_PRICE_1) {
		BID_PRICE_1 = bID_PRICE_1;
	}

	public BigDecimal getBID_CHECK_PRICE() {
		return BID_CHECK_PRICE;
	}

	public void setBID_CHECK_PRICE(BigDecimal bID_CHECK_PRICE) {
		BID_CHECK_PRICE = bID_CHECK_PRICE;
	}

	public String getBID_RESULT() {
		if("Y".equals(BID_RESULT)) {
			BID_RESULT = "是";
		} else if("N".equals(BID_RESULT)) {
			BID_RESULT = "否";
		}
		return BID_RESULT;
	}

	public void setBID_RESULT(String bID_RESULT) {
		BID_RESULT = bID_RESULT;
	}

	public BigDecimal getBID_WIN_PRICE() {
		return BID_WIN_PRICE;
	}

	public void setBID_WIN_PRICE(BigDecimal bID_WIN_PRICE) {
		BID_WIN_PRICE = bID_WIN_PRICE;
	}

	public BigDecimal getBID_APPLY_PRICE_1() {
		return BID_APPLY_PRICE_1;
	}

	public void setBID_APPLY_PRICE_1(BigDecimal bID_APPLY_PRICE_1) {
		BID_APPLY_PRICE_1 = bID_APPLY_PRICE_1;
	}

	public Date getBID_VALUE_DATE_1() {
		return BID_VALUE_DATE_1;
	}

	public void setBID_VALUE_DATE_1(Date bID_VALUE_DATE_1) {
		BID_VALUE_DATE_1 = bID_VALUE_DATE_1;
	}

	public String getBID_RECEIPT_NO() {
		return BID_RECEIPT_NO;
	}

	public void setBID_RECEIPT_NO(String bID_RECEIPT_NO) {
		BID_RECEIPT_NO = bID_RECEIPT_NO;
	}

	public String getBID_AGENT_PAY() {
		return BID_AGENT_PAY;
	}

	public void setBID_AGENT_PAY(String bID_AGENT_PAY) {
		BID_AGENT_PAY = bID_AGENT_PAY;
	}

	public String getBID_NEED_MATERIAL_PRICE() {
		return BID_NEED_MATERIAL_PRICE;
	}

	public void setBID_NEED_MATERIAL_PRICE(String bID_NEED_MATERIAL_PRICE) {
		BID_NEED_MATERIAL_PRICE = bID_NEED_MATERIAL_PRICE;
	}

	public String getAPPLY_REQUIRE() {
		return APPLY_REQUIRE;
	}

	public void setAPPLY_REQUIRE(String aPPLY_REQUIRE) {
		APPLY_REQUIRE = aPPLY_REQUIRE;
	}

	public Date getBID_NOTICE_DATE() {
		return BID_NOTICE_DATE;
	}

	public void setBID_NOTICE_DATE(Date bID_NOTICE_DATE) {
		BID_NOTICE_DATE = bID_NOTICE_DATE;
	}

	public Date getBID_NOTICE_DATE2() {
		return BID_NOTICE_DATE2;
	}

	public void setBID_NOTICE_DATE2(Date bID_NOTICE_DATE2) {
		BID_NOTICE_DATE2 = bID_NOTICE_DATE2;
	}

	public Date getBID_MESSAGE_DATE() {
		return BID_MESSAGE_DATE;
	}

	public void setBID_MESSAGE_DATE(Date bID_MESSAGE_DATE) {
		BID_MESSAGE_DATE = bID_MESSAGE_DATE;
	}

	public Date getMATERIAL_EXPRESS_DATE() {
		return MATERIAL_EXPRESS_DATE;
	}

	public void setMATERIAL_EXPRESS_DATE(Date mATERIAL_EXPRESS_DATE) {
		MATERIAL_EXPRESS_DATE = mATERIAL_EXPRESS_DATE;
	}

	public BigDecimal getBID_AGENT_PRICE() {
		return BID_AGENT_PRICE;
	}

	public void setBID_AGENT_PRICE(BigDecimal bID_AGENT_PRICE) {
		BID_AGENT_PRICE = bID_AGENT_PRICE;
	}

	public String getFINISH_STATUS() {
		return FINISH_STATUS;
	}

	public void setFINISH_STATUS(String fINISH_STATUS) {
		FINISH_STATUS = fINISH_STATUS;
	}

	public String getFINISH_NOTE() {
		return FINISH_NOTE;
	}

	public void setFINISH_NOTE(String fINISH_NOTE) {
		FINISH_NOTE = fINISH_NOTE;
	}

	public String getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}

	public Date getRESERVE_DATE1() {
		return RESERVE_DATE1;
	}

	public void setRESERVE_DATE1(Date rESERVE_DATE1) {
		RESERVE_DATE1 = rESERVE_DATE1;
	}

	public Date getRESERVE_DATE2() {
		return RESERVE_DATE2;
	}

	public void setRESERVE_DATE2(Date rESERVE_DATE2) {
		RESERVE_DATE2 = rESERVE_DATE2;
	}

	public String getBID_AGENT_PAY2() {
		return BID_AGENT_PAY2;
	}

	public void setBID_AGENT_PAY2(String bID_AGENT_PAY2) {
		BID_AGENT_PAY2 = bID_AGENT_PAY2;
	}

}
