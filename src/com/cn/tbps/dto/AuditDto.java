package com.cn.tbps.dto;

import java.math.BigDecimal;
import java.util.Date;

import com.cn.common.dto.BaseDto;
import com.cn.common.util.StringUtil;

/**
 * 审价
 * @name AuditDto.java
 * @author Frank
 * @time 2014-2-15上午9:57:56
 * @version 1.0
 */
public class AuditDto extends BaseDto {

	private static final long serialVersionUID = 6967682305050609216L;

	/**
	 * 审价编号YYYY-NNN自动采番
	 */
	private String AUDIT_NO;
	
	/**
	 * 状态
	 */
	private String AUDIT_STATUS;

	/**
	 * 合同编号
	 */
	private String CNTRCT_NO;

	/**
	 * 合同简称
	 */
	private String CNTRCT_NM;

	/**
	 * 报告文号
	 */
	private String REPORT_NO;

	/**
	 * 工程师
	 */
	private String PROJECT_MANAGER;

	/**
	 * 项目名称
	 */
	private String PROJECT_NAME;

	/**
	 * 项目性质1:土建,2:安装,3:房修,4:园林,5:咨询,6：限价，7:其他
	 */
	private String PROJECT_TYPE;

	/**
	 * 项目进度1：在审，2：补交资料，3：初稿已出，4：审定单已出，
	 */
	private String PROJECT_STATUS;

	/**
	 * 委托公司代码
	 */
	private String AGENT_NO;

	/**
	 * 委托公司名称
	 */
	private String AGENT_CO_NAME;

	/**
	 * 委托公司负责人
	 */
	private String AGENT_CO_MANAGER;

	/**
	 * 委托公司负责人电话
	 */
	private String AGENT_CO_MANAGER_TEL;

	/**
	 * 委托公司项目负责人
	 */
	private String AGENT_CO_STAFF;

	/**
	 * 委托公司项目负责人电话
	 */
	private String AGENT_CO_STAFF_TEL;

	/**
	 * 委托公司快递地址
	 */
	private String AGENT_CO_POST_ADDRESS;

	/**
	 * 委托公负责人司邮箱
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
	 * 专业公司负责人电话
	 */
	private String PROF_CO_MANAGER_TEL;

	/**
	 * 专业公司项目负责人
	 */
	private String PROF_CO_STAFF;

	/**
	 * 专业公司项目负责人电话
	 */
	private String PROF_CO_STAFF_TEL;

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
	 * 承包公司代码
	 */
	private String CONTRACT_CO_NO;

	/**
	 * 承包公司名称
	 */
	private String CONTRACT_CO_NAME;

	/**
	 * 承包公司负责人
	 */
	private String CONTRACT_CO_MANAGER;

	/**
	 * 承包公司负责人电话
	 */
	private String CONTRACT_CO_MANAGER_TEL;

	/**
	 * 承包公司项目负责人
	 */
	private String CONTRACT_CO_STAFF;

	/**
	 * 承包公司项目负责人电话
	 */
	private String CONTRACT_CO_STAFF_TEL;

	/**
	 * 承包公司快递地址
	 */
	private String CONTRACT_CO_POST_ADDRESS;

	/**
	 * 承包公司负责人邮箱
	 */
	private String CONTRACT_CO_MAIL;

	/**
	 * 资料收到日期
	 */
	private Date DOC_REC_DATE;

	/**
	 * 实施情况
	 */
	private String PROGRESS_STATUS;

	/**
	 * 预/结算
	 */
	private String PRE_SET;

	/**
	 * 预算金额
	 */
	private BigDecimal PRE_PRICE;

	/**
	 * 补充资料日期
	 */
	private Date SUPPORT_DOC_DATE;

	/**
	 * 初稿日期
	 */
	private Date DRAFT_DATE;

	/**
	 * 审定单发出日期
	 */
	private Date APPROVAL_SND_DATE;

	/**
	 * 审定单收到日期
	 */
	private Date APPROVAL_RCV_DATE;

	/**
	 * 快递单号
	 */
	private String DELI_NO;

	/**
	 * 报告出具日期
	 */
	private Date REPORT_RAISE_DATE;

	/**
	 * 报告敲章日期
	 */
	private Date REPORT_SEAL_DATE;

	/**
	 * 报告送达方式
	 */
	private String REPORT_ARR_TYPE;

	/**
	 * 报告送达日期
	 */
	private Date REPORT_ARR_DATE;

	/**
	 * 入档日期
	 */
	private Date REG_DATE;

	/**
	 * 委托方专业联系人及联系方式
	 */
	private String AGENT_INFO;

	/**
	 * 专业公司联系人及联系方式
	 */
	private String PROF_INFO;
	
	/**
	 * 承揽单位
	 */
	private String CONTRACT_CO_ID;

	/**
	 * 承揽单位联系人及联系方式
	 */
	private String CONTRACT_CO_INFO;

	/**
	 * 送审价
	 */
	private BigDecimal VERIFY_PER_AMOUNT;

	/**
	 * 审核价
	 */
	private BigDecimal VERIFY_AMOUNT;

	/**
	 * 核增额
	 */
	private BigDecimal VERIFY_INCREASE;

	/**
	 * 核减额
	 */
	private BigDecimal VERIFY_DECREASE;

	/**
	 * 净核减额
	 */
	private BigDecimal VERIFY_DIFF;

	/**
	 * 净核减率
	 */
	private BigDecimal VERIFY_DIFF_RATE;

	/**
	 * 控制价金额
	 */
	private BigDecimal CNT_PRICE;

	/**
	 * 立项金额
	 */
	private BigDecimal PROJ_PRICE;

	/**
	 * 限价金额
	 */
	private BigDecimal LIMIT_PRICE;

	/**
	 * 合同金额
	 */
	private BigDecimal CNTRCT_PRICE;

	/**
	 * 资料收到时间（立项阶段）
	 */
	private Date PLAN_DOC_RCV_DATE;

	/**
	 * 立项报告时间（立项阶段）
	 */
	private Date PLAN_DOC_RPT_DATE;

	/**
	 * 报告送达方式（立项阶段）
	 */
	private String PLAN_DOC_SND_TYPE;

	/**
	 * 报告送达日期（立项阶段）
	 */
	private Date PLAN_DOC_ARR_DATE;

	/**
	 * 资料收到时间（招标阶段）
	 */
	private Date BID_DOC_RCV_DATE;

	/**
	 * 限价报告时间（招标阶段）
	 */
	private Date BID_DOC_RPT_DATE;

	/**
	 * 报告送达方式（招标阶段）
	 */
	private String BID_DOC_SND_TYPE;

	/**
	 * 报告送达日期（招标阶段）
	 */
	private Date BID_DOC_ARR_DATE;

	/**
	 * 资料收到时间（合同签订阶段）
	 */
	private Date SIGN_DOC_RCV_DATE;

	/**
	 * 合同审核报告时间（合同签订阶段)
	 */
	private Date SIGN_DOC_RPT_DATE;

	/**
	 * 报告送达方式（合同签订阶段)
	 */
	private String SIGN_DOC_SND_TYPE;

	/**
	 * 报告送达日期（合同签订阶段)
	 */
	private Date SIGN_DOC_ARR_DATE;

	/**
	 * 资料收到时间（结算阶段）
	 */
	private Date SET_DOC_RCV_DATE;

	/**
	 * 结算报告出具时间（结算阶段）
	 */
	private Date SET_DOC_RPT_DATE;

	/**
	 * 报告送达方式（结算阶段）
	 */
	private String SET_DOC_SND_TYPE;

	/**
	 * 报告送达日期（结算阶段）
	 */
	private Date SET_DOC_ARR_DATE;

	/**
	 * 项目大致进度简述
	 */
	private String PROGRESS_STATUS_MEMO;

	/**
	 * 甲方收费
	 */
	private BigDecimal A_AMOUNT;

	/**
	 * 收费状态
	 */
	private String A_STATUS;

	/**
	 * 乙方收费方式
	 */
	private String B_TYPE;

	/**
	 * 乙方收费
	 */
	private BigDecimal B_AMOUNT;

	/**
	 * 甲方发票流转单日期
	 */
	private Date A_INVOICE_DELI_DATE;

	/**
	 * 甲方开票日期
	 */
	private Date A_INVOICE_DATE;

	/**
	 * 甲方发票号
	 */
	private String A_INVOICE_NO;

	/**
	 * 甲方到账日期
	 */
	private Date A_SET_DATE;

	/**
	 * 乙方发票流转单日期
	 */
	private Date B_INVOICE_DELI_DATE;

	/**
	 * 乙方开票日期
	 */
	private Date B_INVOICE_DATE;

	/**
	 * 乙方发票号
	 */
	private String B_INVOICE_NO;

	/**
	 * 乙方到账日期
	 */
	private Date B_SET_DATE;

	/**
	 * 乙方费率
	 */
	private BigDecimal B_RATE;

	/**
	 * 委托内容
	 */
	private String CNTRCT_INFO;

	/**
	 * 曾用名
	 */
	private String PROJECT_NAME_PASS;

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

	/**
	 * 备用6
	 */
	private String RESERVE6;

	/**
	 * 备用7
	 */
	private BigDecimal RESERVE7;

	/**
	 * 备用8
	 */
	private BigDecimal RESERVE8;

	/**
	 * 备用9
	 */
	private Date RESERVE9;

	/**
	 * 备用10
	 */
	private Date RESERVE10;

	/**
	 * 最新化
	 */
	private String LATEST_FLG;

	/**
	 * 删除
	 */
	private String DELETE_FLG;

	/**
	 * 更新者
	 */
	private String UPDATE_USER;

	/**
	 * 新增日期
	 */
	private Date INSERT_DATE;

	/**
	 * 更新日期
	 */
	private Date UPDATE_DATE;

	public String getAUDIT_NO() {
		return AUDIT_NO;
	}

	public void setAUDIT_NO(String aUDIT_NO) {
		AUDIT_NO = aUDIT_NO;
	}

	public String getREPORT_NO() {
		return REPORT_NO;
	}

	public void setREPORT_NO(String rEPORT_NO) {
		REPORT_NO = rEPORT_NO;
	}

	public String getPROJECT_TYPE() {
		return PROJECT_TYPE;
	}

	public void setPROJECT_TYPE(String pROJECT_TYPE) {
		PROJECT_TYPE = pROJECT_TYPE;
	}

	public String getPROJECT_STATUS() {
		return PROJECT_STATUS;
	}

	public void setPROJECT_STATUS(String pROJECT_STATUS) {
		PROJECT_STATUS = pROJECT_STATUS;
	}

	public String getPROJECT_MANAGER() {
		return PROJECT_MANAGER;
	}

	public void setPROJECT_MANAGER(String pROJECT_MANAGER) {
		PROJECT_MANAGER = pROJECT_MANAGER;
	}

	public String getPROJECT_NAME() {
		return PROJECT_NAME;
	}

	public void setPROJECT_NAME(String pROJECT_NAME) {
		PROJECT_NAME = pROJECT_NAME;
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

	public String getAGENT_CO_STAFF() {
		return AGENT_CO_STAFF;
	}

	public void setAGENT_CO_STAFF(String aGENT_CO_STAFF) {
		AGENT_CO_STAFF = aGENT_CO_STAFF;
	}

	public String getAGENT_CO_STAFF_TEL() {
		return AGENT_CO_STAFF_TEL;
	}

	public void setAGENT_CO_STAFF_TEL(String aGENT_CO_STAFF_TEL) {
		AGENT_CO_STAFF_TEL = aGENT_CO_STAFF_TEL;
	}

	public String getAGENT_CO_POST_ADDRESS() {
		return AGENT_CO_POST_ADDRESS;
	}

	public void setAGENT_CO_POST_ADDRESS(String aGENT_CO_POST_ADDRESS) {
		AGENT_CO_POST_ADDRESS = aGENT_CO_POST_ADDRESS;
	}

	public String getCONTRACT_CO_NO() {
		return CONTRACT_CO_NO;
	}

	public void setCONTRACT_CO_NO(String cONTRACT_CO_NO) {
		CONTRACT_CO_NO = cONTRACT_CO_NO;
	}

	public String getCONTRACT_CO_NAME() {
		return CONTRACT_CO_NAME;
	}

	public void setCONTRACT_CO_NAME(String cONTRACT_CO_NAME) {
		CONTRACT_CO_NAME = cONTRACT_CO_NAME;
	}

	public String getCONTRACT_CO_MANAGER() {
		return CONTRACT_CO_MANAGER;
	}

	public void setCONTRACT_CO_MANAGER(String cONTRACT_CO_MANAGER) {
		CONTRACT_CO_MANAGER = cONTRACT_CO_MANAGER;
	}

	public String getCONTRACT_CO_MANAGER_TEL() {
		return CONTRACT_CO_MANAGER_TEL;
	}

	public void setCONTRACT_CO_MANAGER_TEL(String cONTRACT_CO_MANAGER_TEL) {
		CONTRACT_CO_MANAGER_TEL = cONTRACT_CO_MANAGER_TEL;
	}

	public String getCONTRACT_CO_STAFF() {
		return CONTRACT_CO_STAFF;
	}

	public void setCONTRACT_CO_STAFF(String cONTRACT_CO_STAFF) {
		CONTRACT_CO_STAFF = cONTRACT_CO_STAFF;
	}

	public String getCONTRACT_CO_STAFF_TEL() {
		return CONTRACT_CO_STAFF_TEL;
	}

	public void setCONTRACT_CO_STAFF_TEL(String cONTRACT_CO_STAFF_TEL) {
		CONTRACT_CO_STAFF_TEL = cONTRACT_CO_STAFF_TEL;
	}

	public String getCONTRACT_CO_POST_ADDRESS() {
		return CONTRACT_CO_POST_ADDRESS;
	}

	public void setCONTRACT_CO_POST_ADDRESS(String cONTRACT_CO_POST_ADDRESS) {
		CONTRACT_CO_POST_ADDRESS = cONTRACT_CO_POST_ADDRESS;
	}

	public BigDecimal getVERIFY_PER_AMOUNT() {
		return VERIFY_PER_AMOUNT;
	}

	public void setVERIFY_PER_AMOUNT(BigDecimal vERIFY_PER_AMOUNT) {
		VERIFY_PER_AMOUNT = vERIFY_PER_AMOUNT;
	}

	public BigDecimal getVERIFY_AMOUNT() {
		return VERIFY_AMOUNT;
	}

	public void setVERIFY_AMOUNT(BigDecimal vERIFY_AMOUNT) {
		VERIFY_AMOUNT = vERIFY_AMOUNT;
	}

	public BigDecimal getVERIFY_DIFF() {
		return VERIFY_DIFF;
	}

	public void setVERIFY_DIFF(BigDecimal vERIFY_DIFF) {
		VERIFY_DIFF = vERIFY_DIFF;
	}

	public BigDecimal getVERIFY_DECREASE() {
		return VERIFY_DECREASE;
	}

	public void setVERIFY_DECREASE(BigDecimal vERIFY_DECREASE) {
		VERIFY_DECREASE = vERIFY_DECREASE;
	}

	public String getLATEST_FLG() {
		return LATEST_FLG;
	}

	public void setLATEST_FLG(String lATEST_FLG) {
		LATEST_FLG = lATEST_FLG;
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

	public String getAGENT_CO_MAIL() {
		return AGENT_CO_MAIL;
	}

	public void setAGENT_CO_MAIL(String aGENT_CO_MAIL) {
		AGENT_CO_MAIL = aGENT_CO_MAIL;
	}

	public String getCONTRACT_CO_MAIL() {
		return CONTRACT_CO_MAIL;
	}

	public void setCONTRACT_CO_MAIL(String cONTRACT_CO_MAIL) {
		CONTRACT_CO_MAIL = cONTRACT_CO_MAIL;
	}

	public String getAgent_mail_pr() {
		if(StringUtil.isNotBlank(AGENT_CO_MAIL)) {
			agent_mail_pr = AGENT_CO_MAIL.substring(0, AGENT_CO_MAIL.indexOf("@"));
		}
		return agent_mail_pr;
	}

	public void setAgent_mail_pr(String agent_mail_pr) {
		this.agent_mail_pr = agent_mail_pr;
	}

	public String getAgent_mail_suffix() {
		if(StringUtil.isNotBlank(AGENT_CO_MAIL)) {
			agent_mail_suffix = AGENT_CO_MAIL.substring(AGENT_CO_MAIL.indexOf("@") + 1, AGENT_CO_MAIL.length());
		}
		return agent_mail_suffix;
	}

	public void setAgent_mail_suffix(String agent_mail_suffix) {
		this.agent_mail_suffix = agent_mail_suffix;
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

	public String getPROF_CO_STAFF() {
		return PROF_CO_STAFF;
	}

	public void setPROF_CO_STAFF(String pROF_CO_STAFF) {
		PROF_CO_STAFF = pROF_CO_STAFF;
	}

	public String getPROF_CO_STAFF_TEL() {
		return PROF_CO_STAFF_TEL;
	}

	public void setPROF_CO_STAFF_TEL(String pROF_CO_STAFF_TEL) {
		PROF_CO_STAFF_TEL = pROF_CO_STAFF_TEL;
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

	public Date getDOC_REC_DATE() {
		return DOC_REC_DATE;
	}

	public void setDOC_REC_DATE(Date dOC_REC_DATE) {
		DOC_REC_DATE = dOC_REC_DATE;
	}

	public String getPROGRESS_STATUS() {
		return PROGRESS_STATUS;
	}

	public void setPROGRESS_STATUS(String pROGRESS_STATUS) {
		PROGRESS_STATUS = pROGRESS_STATUS;
	}

	public String getPRE_SET() {
		return PRE_SET;
	}

	public void setPRE_SET(String pRE_SET) {
		PRE_SET = pRE_SET;
	}

	public BigDecimal getPRE_PRICE() {
		return PRE_PRICE;
	}

	public void setPRE_PRICE(BigDecimal pRE_PRICE) {
		PRE_PRICE = pRE_PRICE;
	}

	public Date getSUPPORT_DOC_DATE() {
		return SUPPORT_DOC_DATE;
	}

	public void setSUPPORT_DOC_DATE(Date sUPPORT_DOC_DATE) {
		SUPPORT_DOC_DATE = sUPPORT_DOC_DATE;
	}

	public Date getDRAFT_DATE() {
		return DRAFT_DATE;
	}

	public void setDRAFT_DATE(Date dRAFT_DATE) {
		DRAFT_DATE = dRAFT_DATE;
	}

	public Date getAPPROVAL_SND_DATE() {
		return APPROVAL_SND_DATE;
	}

	public void setAPPROVAL_SND_DATE(Date aPPROVAL_SND_DATE) {
		APPROVAL_SND_DATE = aPPROVAL_SND_DATE;
	}

	public Date getAPPROVAL_RCV_DATE() {
		return APPROVAL_RCV_DATE;
	}

	public void setAPPROVAL_RCV_DATE(Date aPPROVAL_RCV_DATE) {
		APPROVAL_RCV_DATE = aPPROVAL_RCV_DATE;
	}

	public String getDELI_NO() {
		return DELI_NO;
	}

	public void setDELI_NO(String dELI_NO) {
		DELI_NO = dELI_NO;
	}

	public Date getREPORT_RAISE_DATE() {
		return REPORT_RAISE_DATE;
	}

	public void setREPORT_RAISE_DATE(Date rEPORT_RAISE_DATE) {
		REPORT_RAISE_DATE = rEPORT_RAISE_DATE;
	}

	public Date getREPORT_SEAL_DATE() {
		return REPORT_SEAL_DATE;
	}

	public void setREPORT_SEAL_DATE(Date rEPORT_SEAL_DATE) {
		REPORT_SEAL_DATE = rEPORT_SEAL_DATE;
	}

	public String getREPORT_ARR_TYPE() {
		return REPORT_ARR_TYPE;
	}

	public void setREPORT_ARR_TYPE(String rEPORT_ARR_TYPE) {
		REPORT_ARR_TYPE = rEPORT_ARR_TYPE;
	}

	public Date getREPORT_ARR_DATE() {
		return REPORT_ARR_DATE;
	}

	public void setREPORT_ARR_DATE(Date rEPORT_ARR_DATE) {
		REPORT_ARR_DATE = rEPORT_ARR_DATE;
	}

	public Date getREG_DATE() {
		return REG_DATE;
	}

	public void setREG_DATE(Date rEG_DATE) {
		REG_DATE = rEG_DATE;
	}

	public String getAGENT_INFO() {
		return AGENT_INFO;
	}

	public void setAGENT_INFO(String aGENT_INFO) {
		AGENT_INFO = aGENT_INFO;
	}

	public String getCONTRACT_CO_ID() {
		return CONTRACT_CO_ID;
	}

	public void setCONTRACT_CO_ID(String cONTRACT_CO_ID) {
		CONTRACT_CO_ID = cONTRACT_CO_ID;
	}

	public String getCONTRACT_CO_INFO() {
		return CONTRACT_CO_INFO;
	}

	public void setCONTRACT_CO_INFO(String cONTRACT_CO_INFO) {
		CONTRACT_CO_INFO = cONTRACT_CO_INFO;
	}

	public BigDecimal getVERIFY_INCREASE() {
		return VERIFY_INCREASE;
	}

	public void setVERIFY_INCREASE(BigDecimal vERIFY_INCREASE) {
		VERIFY_INCREASE = vERIFY_INCREASE;
	}

	public BigDecimal getVERIFY_DIFF_RATE() {
		return VERIFY_DIFF_RATE;
	}

	public void setVERIFY_DIFF_RATE(BigDecimal vERIFY_DIFF_RATE) {
		VERIFY_DIFF_RATE = vERIFY_DIFF_RATE;
	}

	public BigDecimal getCNT_PRICE() {
		return CNT_PRICE;
	}

	public void setCNT_PRICE(BigDecimal cNT_PRICE) {
		CNT_PRICE = cNT_PRICE;
	}

	public BigDecimal getPROJ_PRICE() {
		return PROJ_PRICE;
	}

	public void setPROJ_PRICE(BigDecimal pROJ_PRICE) {
		PROJ_PRICE = pROJ_PRICE;
	}

	public BigDecimal getLIMIT_PRICE() {
		return LIMIT_PRICE;
	}

	public void setLIMIT_PRICE(BigDecimal lIMIT_PRICE) {
		LIMIT_PRICE = lIMIT_PRICE;
	}

	public BigDecimal getCNTRCT_PRICE() {
		return CNTRCT_PRICE;
	}

	public void setCNTRCT_PRICE(BigDecimal cNTRCT_PRICE) {
		CNTRCT_PRICE = cNTRCT_PRICE;
	}

	public Date getPLAN_DOC_RCV_DATE() {
		return PLAN_DOC_RCV_DATE;
	}

	public void setPLAN_DOC_RCV_DATE(Date pLAN_DOC_RCV_DATE) {
		PLAN_DOC_RCV_DATE = pLAN_DOC_RCV_DATE;
	}

	public Date getPLAN_DOC_RPT_DATE() {
		return PLAN_DOC_RPT_DATE;
	}

	public void setPLAN_DOC_RPT_DATE(Date pLAN_DOC_RPT_DATE) {
		PLAN_DOC_RPT_DATE = pLAN_DOC_RPT_DATE;
	}

	public Date getPLAN_DOC_ARR_DATE() {
		return PLAN_DOC_ARR_DATE;
	}

	public void setPLAN_DOC_ARR_DATE(Date pLAN_DOC_ARR_DATE) {
		PLAN_DOC_ARR_DATE = pLAN_DOC_ARR_DATE;
	}

	public Date getBID_DOC_RCV_DATE() {
		return BID_DOC_RCV_DATE;
	}

	public void setBID_DOC_RCV_DATE(Date bID_DOC_RCV_DATE) {
		BID_DOC_RCV_DATE = bID_DOC_RCV_DATE;
	}

	public Date getBID_DOC_RPT_DATE() {
		return BID_DOC_RPT_DATE;
	}

	public void setBID_DOC_RPT_DATE(Date bID_DOC_RPT_DATE) {
		BID_DOC_RPT_DATE = bID_DOC_RPT_DATE;
	}

	public Date getBID_DOC_ARR_DATE() {
		return BID_DOC_ARR_DATE;
	}

	public void setBID_DOC_ARR_DATE(Date bID_DOC_ARR_DATE) {
		BID_DOC_ARR_DATE = bID_DOC_ARR_DATE;
	}

	public Date getSIGN_DOC_RCV_DATE() {
		return SIGN_DOC_RCV_DATE;
	}

	public void setSIGN_DOC_RCV_DATE(Date sIGN_DOC_RCV_DATE) {
		SIGN_DOC_RCV_DATE = sIGN_DOC_RCV_DATE;
	}

	public Date getSIGN_DOC_RPT_DATE() {
		return SIGN_DOC_RPT_DATE;
	}

	public void setSIGN_DOC_RPT_DATE(Date sIGN_DOC_RPT_DATE) {
		SIGN_DOC_RPT_DATE = sIGN_DOC_RPT_DATE;
	}

	public Date getSIGN_DOC_ARR_DATE() {
		return SIGN_DOC_ARR_DATE;
	}

	public void setSIGN_DOC_ARR_DATE(Date sIGN_DOC_ARR_DATE) {
		SIGN_DOC_ARR_DATE = sIGN_DOC_ARR_DATE;
	}

	public Date getSET_DOC_RCV_DATE() {
		return SET_DOC_RCV_DATE;
	}

	public void setSET_DOC_RCV_DATE(Date sET_DOC_RCV_DATE) {
		SET_DOC_RCV_DATE = sET_DOC_RCV_DATE;
	}

	public Date getSET_DOC_RPT_DATE() {
		return SET_DOC_RPT_DATE;
	}

	public void setSET_DOC_RPT_DATE(Date sET_DOC_RPT_DATE) {
		SET_DOC_RPT_DATE = sET_DOC_RPT_DATE;
	}

	public Date getSET_DOC_ARR_DATE() {
		return SET_DOC_ARR_DATE;
	}

	public void setSET_DOC_ARR_DATE(Date sET_DOC_ARR_DATE) {
		SET_DOC_ARR_DATE = sET_DOC_ARR_DATE;
	}

	public String getPROGRESS_STATUS_MEMO() {
		return PROGRESS_STATUS_MEMO;
	}

	public void setPROGRESS_STATUS_MEMO(String pROGRESS_STATUS_MEMO) {
		PROGRESS_STATUS_MEMO = pROGRESS_STATUS_MEMO;
	}

	public BigDecimal getA_AMOUNT() {
		return A_AMOUNT;
	}

	public void setA_AMOUNT(BigDecimal a_AMOUNT) {
		A_AMOUNT = a_AMOUNT;
	}

	public String getA_STATUS() {
		return A_STATUS;
	}

	public void setA_STATUS(String a_STATUS) {
		A_STATUS = a_STATUS;
	}

	public String getB_TYPE() {
		return B_TYPE;
	}

	public void setB_TYPE(String b_TYPE) {
		B_TYPE = b_TYPE;
	}

	public BigDecimal getB_AMOUNT() {
		return B_AMOUNT;
	}

	public void setB_AMOUNT(BigDecimal b_AMOUNT) {
		B_AMOUNT = b_AMOUNT;
	}

	public Date getA_INVOICE_DELI_DATE() {
		return A_INVOICE_DELI_DATE;
	}

	public void setA_INVOICE_DELI_DATE(Date a_INVOICE_DELI_DATE) {
		A_INVOICE_DELI_DATE = a_INVOICE_DELI_DATE;
	}

	public Date getA_INVOICE_DATE() {
		return A_INVOICE_DATE;
	}

	public void setA_INVOICE_DATE(Date a_INVOICE_DATE) {
		A_INVOICE_DATE = a_INVOICE_DATE;
	}

	public String getA_INVOICE_NO() {
		return A_INVOICE_NO;
	}

	public void setA_INVOICE_NO(String a_INVOICE_NO) {
		A_INVOICE_NO = a_INVOICE_NO;
	}

	public Date getA_SET_DATE() {
		return A_SET_DATE;
	}

	public void setA_SET_DATE(Date a_SET_DATE) {
		A_SET_DATE = a_SET_DATE;
	}

	public Date getB_INVOICE_DELI_DATE() {
		return B_INVOICE_DELI_DATE;
	}

	public void setB_INVOICE_DELI_DATE(Date b_INVOICE_DELI_DATE) {
		B_INVOICE_DELI_DATE = b_INVOICE_DELI_DATE;
	}

	public Date getB_INVOICE_DATE() {
		return B_INVOICE_DATE;
	}

	public void setB_INVOICE_DATE(Date b_INVOICE_DATE) {
		B_INVOICE_DATE = b_INVOICE_DATE;
	}

	public String getB_INVOICE_NO() {
		return B_INVOICE_NO;
	}

	public void setB_INVOICE_NO(String b_INVOICE_NO) {
		B_INVOICE_NO = b_INVOICE_NO;
	}

	public Date getB_SET_DATE() {
		return B_SET_DATE;
	}

	public void setB_SET_DATE(Date b_SET_DATE) {
		B_SET_DATE = b_SET_DATE;
	}

	public String getRESERVE6() {
		return RESERVE6;
	}

	public void setRESERVE6(String rESERVE6) {
		RESERVE6 = rESERVE6;
	}

	public BigDecimal getRESERVE7() {
		return RESERVE7;
	}

	public void setRESERVE7(BigDecimal rESERVE7) {
		RESERVE7 = rESERVE7;
	}

	public BigDecimal getRESERVE8() {
		return RESERVE8;
	}

	public void setRESERVE8(BigDecimal rESERVE8) {
		RESERVE8 = rESERVE8;
	}

	public Date getRESERVE9() {
		return RESERVE9;
	}

	public void setRESERVE9(Date rESERVE9) {
		RESERVE9 = rESERVE9;
	}

	public Date getRESERVE10() {
		return RESERVE10;
	}

	public void setRESERVE10(Date rESERVE10) {
		RESERVE10 = rESERVE10;
	}

	public String getAUDIT_STATUS() {
		return AUDIT_STATUS;
	}

	public void setAUDIT_STATUS(String aUDIT_STATUS) {
		AUDIT_STATUS = aUDIT_STATUS;
	}

	public String getCNTRCT_NO() {
		return CNTRCT_NO;
	}

	public void setCNTRCT_NO(String cNTRCT_NO) {
		CNTRCT_NO = cNTRCT_NO;
	}

	public String getCNTRCT_NM() {
		return CNTRCT_NM;
	}

	public void setCNTRCT_NM(String cNTRCT_NM) {
		CNTRCT_NM = cNTRCT_NM;
	}

	public String getPLAN_DOC_SND_TYPE() {
		return PLAN_DOC_SND_TYPE;
	}

	public void setPLAN_DOC_SND_TYPE(String pLAN_DOC_SND_TYPE) {
		PLAN_DOC_SND_TYPE = pLAN_DOC_SND_TYPE;
	}

	public String getBID_DOC_SND_TYPE() {
		return BID_DOC_SND_TYPE;
	}

	public void setBID_DOC_SND_TYPE(String bID_DOC_SND_TYPE) {
		BID_DOC_SND_TYPE = bID_DOC_SND_TYPE;
	}

	public String getSIGN_DOC_SND_TYPE() {
		return SIGN_DOC_SND_TYPE;
	}

	public void setSIGN_DOC_SND_TYPE(String sIGN_DOC_SND_TYPE) {
		SIGN_DOC_SND_TYPE = sIGN_DOC_SND_TYPE;
	}

	public String getSET_DOC_SND_TYPE() {
		return SET_DOC_SND_TYPE;
	}

	public void setSET_DOC_SND_TYPE(String sET_DOC_SND_TYPE) {
		SET_DOC_SND_TYPE = sET_DOC_SND_TYPE;
	}

	public BigDecimal getB_RATE() {
		return B_RATE;
	}

	public void setB_RATE(BigDecimal b_RATE) {
		B_RATE = b_RATE;
	}

	public String getCNTRCT_INFO() {
		return CNTRCT_INFO;
	}

	public void setCNTRCT_INFO(String cNTRCT_INFO) {
		CNTRCT_INFO = cNTRCT_INFO;
	}

	public String getPROJECT_NAME_PASS() {
		return PROJECT_NAME_PASS;
	}

	public void setPROJECT_NAME_PASS(String pROJECT_NAME_PASS) {
		PROJECT_NAME_PASS = pROJECT_NAME_PASS;
	}
	
	public String getPROF_INFO() {
		return PROF_INFO;
	}

	public void setPROF_INFO(String pROF_INFO) {
		PROF_INFO = pROF_INFO;
	}

}
