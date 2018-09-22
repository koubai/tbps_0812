package com.cn.tbps.dto;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.cn.common.dto.BaseDto;

/**
 * 招标
 * @author Frank
 * @time 2013-10-14上午12:30:17
 * @version 1.0
 */
public class BidDto extends BaseDto {

	private static final long serialVersionUID = -1736740989779450662L;
	
	/**
	 * 招标编号
	 */
	private String BID_NO;
	
	/**
	 * 状态
	 */
	private String BID_STATUS;
	
	private Date BID_VALUE_DATE;

	/**
	 * 合同编号
	 */
	private String CNTRCT_NO;
	
	//是否随机
	private String IS_RANDOM;
	
	//关联招标合同字段
	//合同名称
	private String CNTRCT_NAME;
	//合同年份
	private String CNTRCT_YEAR;
	//合同开始时间
	private Date CNTRCT_ST_DATE;
	//合同结束时间
	private Date CNTRCT_ED_DATE;
	//委托单位ID
	private String BID_COMP_NO;
	//委托单位
	private String BID_COMP_NAME;
	//联系人
	private String CO_MANAGER1;
	//联系方式(电话)
	private String CO_MANAGER_TEL1;
	//联系方式(地址)
	private String CO_ADDRESS1;
	//联系人邮箱
	private String CO_MANAGER_EMAIL1;
	//开票信息
	private String CO_TAX;
	
	//报名单位列表
	private List<BidCompDto> joinBidCompList;
	//缴纳保证金单位列表
	private List<BidCompDto> bondBidCompList;

	/**
	 * 承接项目日期：
	 */
	private Date PROJECT_DEVIEW_DATE;

	/**
	 * 合同类别
	 */
	private String CNTRCT_TYPE;

	/**
	 * 项目名称
	 */
	private String PROJECT_NAME;

	/**
	 * 项目性质
	 */
	private String PROJECT_PROPERTY;

	/**
	 * 工程概况批文
	 */
	private String PROJ_APPROVAL;

	/**
	 * 会审监管人
	 */
	private String PROJECT_AUTH;

	/**
	 * 担当者
	 */
	private String PROJECT_MANAGER;

	/**
	 * 招标代理支付方
	 */
	private String BID_AGENT_PAY;

	/**
	 * 招标代理支付方(其他)
	 */
	private String BID_AGENT_PAY2;

	/**
	 * 招标代理费
	 */
	private BigDecimal BID_AGENT_PRICE;

	/**
	 * 实收代理费
	 */
	private BigDecimal BID_AGENT_PRICE_ACT;

	/**
	 * 开票日期
	 */
	private Date RECEIPT1_DATE;

	/**
	 * 到账日期
	 */
	private Date RECEIPT1_VALUE_DATE;

	/**
	 * 报名日期开始日1
	 */
	private Date REGISTE_ST_DATE1;

	/**
	 * 报名日期终了日1
	 */
	private Date REGISTE_ED_DATE1;

	/**
	 * 报名日期开始日2
	 */
	private Date REGISTE_ST_DATE2;

	/**
	 * 报名日期终了日2
	 */
	private Date REGISTE_ED_DATE2;

	/**
	 * 报名日期开始日3
	 */
	private Date REGISTE_ST_DATE3;

	/**
	 * 报名日期终了日3
	 */
	private Date REGISTE_ED_DATE3;

	/**
	 * 报名日期开始日4
	 */
	private Date REGISTE_ST_DATE4;

	/**
	 * 报名日期终了日4
	 */
	private Date REGISTE_ED_DATE4;

	/**
	 * 报名日期开始日5
	 */
	private Date REGISTE_ST_DATE5;

	/**
	 * 报名日期终了日5
	 */
	private Date REGISTE_ED_DATE5;

	/**
	 * 报名要求
	 */
	private String APPLY_REQUIRE;

	/**
	 * 保证金
	 */
	private BigDecimal BID_BOND;

	/**
	 * 生成报名表日期
	 */
	private Date GEN_REGISTE_RPT_DATE;

	/**
	 * 生成审核表日期
	 */
	private Date GEN_VERIFY_RPT_DATE;
		
	/**
	 * 开标时间
	 */
	private Date TENDER_OPEN_DATE;

	/**
	 * 开标地点
	 */
	private String TENDER_OPEN_ADDRESS;

	/**
	 * 评标时间
	 */
	private Date TENDER_VERIFY_DATE;

	/**
	 * 评审人
	 */
	private String BID_AUTH;

	/**
	 * 限价
	 */
	private BigDecimal BID_LIMIT_PRICE;

	/**
	 * 投标公司列表
	 */
	private String BID_CO_LIST;

	/**
	 * 评审专家列表
	 */
	private String BID_EXPERT_LIST;

	/**
	 * 中标公司号
	 */
	private String BID_CO_SEQ;

	/**
	 * 中标公司名称
	 */
	private String BID_CO_NAME;

	/**
	 * 中标公司标书费
	 */
	private BigDecimal BID_CO_PRICE;

	/**
	 * 中标价
	 */
	private BigDecimal BID_PRICE;

	/**
	 * 中标金额一览
	 */
	private String BID_PRICE_LIST;

	/**
	 * 专家费
	 */
	private BigDecimal BID_EXPERT_COMMISION;

	/**
	 * 预借专家费
	 */
	private BigDecimal BID_EXPERT_COMMISION_PRE;

	/**
	 * 实际专家费
	 */
	private BigDecimal BID_EXPERT_COMMISION_ACT;

	/**
	 * 差价退还日期
	 */
	private Date BID_EXPERT_COMMISION_DIFF_DATE;

	/**
	 * 标书费
	 */
	private BigDecimal BID_APPLY_PRICE;

	/**
	 * 专家费申请人
	 */
	private String BID_EXPERT_COMMISION_APPLY;

	/**
	 * 专家费申请日期
	 */
	private Date BID_EXPERT_COMMISION_APPLY_DATE;
	
	/**
	 * 招标文件编制日期
	 */
	private Date APPLY_FORM_EDIT_DATE;

	/**
	 * 招标文件统稿日期
	 */
	private Date APPLY_FORM_COLLECT_DATE;

	/**
	 * 招标公告，文件校对日期
	 */
	private Date APPLY_FORM_VERIFY_DATE;

	/**
	 * 招标公告，文件校对者
	 */
	private String APPLY_FORM_VERIFY;

	/**
	 * 招标文件定稿日期
	 */
	private Date APPLY_FORM_FIX_DATE;

	/**
	 * 招标文件装订日期
	 */
	private Date APPLY_FORM_BOX_DATE;

	/**
	 * 发送答疑，补充文件日期
	 */
	private Date SUPPORT_DOC_DATE;

	/**
	 * 中标公告日期
	 */
	private Date BID_NOTICE_ST_DATE;
	
	/**
	 * 中标公告日期2
	 */
	private Date BID_NOTICE_ED_DATE;

	/**
	 * 中标通知书发出日
	 */
	private Date BID_MESSAGE_DATE;

	/**
	 * 招投标文件送至甲方日期1
	 */
	private Date BID_DOC_DELI_DATE1;

	/**
	 * 招投标文件送至甲方文件1
	 */
	private String BID_DOC_DELI_FILE1;

	/**
	 * 招投标文件送至甲方日期2
	 */
	private Date BID_DOC_DELI_DATE2;

	/**
	 * 招投标文件送至甲方文件2
	 */
	private String BID_DOC_DELI_FILE2;

	/**
	 * 招投标文件送至甲方日期3
	 */
	private Date BID_DOC_DELI_DATE3;

	/**
	 * 招投标文件送至甲方文件3
	 */
	private String BID_DOC_DELI_FILE3;

	/**
	 * 招投标文件送至甲方日期4
	 */
	private Date BID_DOC_DELI_DATE4;

	/**
	 * 招投标文件送至甲方文件4
	 */
	private String BID_DOC_DELI_FILE4;

	/**
	 * 招投标文件送至甲方日期5
	 */
	private Date BID_DOC_DELI_DATE5;

	/**
	 * 招投标文件送至甲方文件5
	 */
	private String BID_DOC_DELI_FILE5;

	/**
	 * 招投标文件送至甲方日期6
	 */
	private Date BID_DOC_DELI_DATE6;

	/**
	 * 招投标文件送至甲方文件6
	 */
	private String BID_DOC_DELI_FILE6;

	/**
	 * 招投标文件送至甲方日期7
	 */
	private Date BID_DOC_DELI_DATE7;

	/**
	 * 招投标文件送至甲方文件7
	 */
	private String BID_DOC_DELI_FILE7;

	/**
	 * 招投标文件送至甲方日期8
	 */
	private Date BID_DOC_DELI_DATE8;

	/**
	 * 招投标文件送至甲方文件8
	 */
	private String BID_DOC_DELI_FILE8;

	/**
	 * 招投标文件送至甲方日期9
	 */
	private Date BID_DOC_DELI_DATE9;

	/**
	 * 招投标文件送至甲方文件9
	 */
	private String BID_DOC_DELI_FILE9;

	/**
	 * 招投标文件送至甲方日期10
	 */
	private Date BID_DOC_DELI_DATE10;

	/**
	 * 招投标文件送至甲方文件10
	 */
	private String BID_DOC_DELI_FILE10;

	/**
	 * 中标通知书签收日
	 */
	private Date BID_INFORM_RCV_DATE;

	/**
	 * 中标通知书签收人
	 */
	private String BID_INFORM_RCV;

	/**
	 * 评标报告装订扫描日
	 */
	private Date BID_VER_DOC_SCAN_DATE;

	/**
	 * 评标报告装订扫描人
	 */
	private String BID_VER_DOC_SCAN;

	/**
	 * 评标报告送至甲方日期1
	 */
	private Date BID_VER_DOC_DELI_DATE1;

	/**
	 * 评标报告送至甲方文件1
	 */
	private String BID_VER_DOC_DELI_FILE1;

	/**
	 * 评标报告送至甲方日期2
	 */
	private Date BID_VER_DOC_DELI_DATE2;

	/**
	 * 评标报告送至甲方文件2
	 */
	private String BID_VER_DOC_DELI_FILE2;

	/**
	 * 评标报告送至甲方日期3
	 */
	private Date BID_VER_DOC_DELI_DATE3;

	/**
	 * 评标报告送至甲方文件3
	 */
	private String BID_VER_DOC_DELI_FILE3;

	/**
	 * 评标报告送至甲方日期4
	 */
	private Date BID_VER_DOC_DELI_DATE4;

	/**
	 * 评标报告送至甲方文件4
	 */
	private String BID_VER_DOC_DELI_FILE4;

	/**
	 * 评标报告送至甲方日期5
	 */
	private Date BID_VER_DOC_DELI_DATE5;

	/**
	 * 评标报告送至甲方文件5
	 */
	private String BID_VER_DOC_DELI_FILE5;

	/**
	 * 评标报告送至甲方日期6
	 */
	private Date BID_VER_DOC_DELI_DATE6;

	/**
	 * 评标报告送至甲方文件6
	 */
	private String BID_VER_DOC_DELI_FILE6;

	/**
	 * 评标报告送至甲方日期7
	 */
	private Date BID_VER_DOC_DELI_DATE7;

	/**
	 * 评标报告送至甲方文件7
	 */
	private String BID_VER_DOC_DELI_FILE7;

	/**
	 * 评标报告送至甲方日期8
	 */
	private Date BID_VER_DOC_DELI_DATE8;

	/**
	 * 评标报告送至甲方文件8
	 */
	private String BID_VER_DOC_DELI_FILE8;

	/**
	 * 评标报告送至甲方日期9
	 */
	private Date BID_VER_DOC_DELI_DATE9;

	/**
	 * 评标报告送至甲方文件9
	 */
	private String BID_VER_DOC_DELI_FILE9;

	/**
	 * 评标报告送至甲方日期10
	 */
	private Date BID_VER_DOC_DELI_DATE10;

	/**
	 * 评标报告送至甲方文件10
	 */
	private String BID_VER_DOC_DELI_FILE10;

	/**
	 * 项目进度情况，10：取消，20：进行中（新建时状态=20），52：失败（报名不满6家）,54:失败（开标不满3家），56：失败（评审失败），70：终止，90：完成
	 */
	private String PROGRESS_STATUS;

	/**
	 * 项目完成情况
	 */
	private String FINISH_STATUS;

	/**
	 * 项目完成情况的备注
	 */
	private String FINISH_NOTE;

	/**
	 * 投标状态
	 */
	private String STATUS;

	/**
	 * 备注
	 */
	private String MEMO1;

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
	 * 备用日期1
	 */
	private Date RESERVE_DATE1;

	/**
	 * 备用日期2
	 */
	private Date RESERVE_DATE2;

	/**
	 * 备用日期3
	 */
	private Date RESERVE_DATE3;

	/**
	 * 备用日期4
	 */
	private Date RESERVE_DATE4;

	/**
	 * 备用日期5
	 */
	private Date RESERVE_DATE5;

	/**
	 * 备用日期6
	 */
	private Date RESERVE_DATE6;

	/**
	 * 备用日期7
	 */
	private String RESERVE_DATE7;

	/**
	 * 备用日期8
	 */
	private String RESERVE_DATE8;

	/**
	 * 备用日期9
	 */
	private String RESERVE_DATE9;

	/**
	 * 备用日期10
	 */
	private String RESERVE_DATE10;

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
	 * 新建日期
	 */
	private Date INSERT_DATE;

	/**
	 * 更新日期
	 */
	private Date UPDATE_DATE;
	
	/**
	 * 中标价
	 */
	private BigDecimal BID_WIN_PRICE;
	
	/**
	 * 委托公司（下载用）
	 */
	private List<String[]> AGENT_CO_LIST;
	
	/**
	 * 中标公司（下载用）
	 */
	private List<String[]> BID_WIN_CO_LIST;
	
	/**
	 * 工程师（下载用）
	 */
	private List<String> PM_LIST;

	
	
	public String getBID_NO() {
		return BID_NO;
	}

	public void setBID_NO(String bID_NO) {
		BID_NO = bID_NO;
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

	public Date getTENDER_OPEN_DATE() {
		return TENDER_OPEN_DATE;
	}

	public void setTENDER_OPEN_DATE(Date tENDER_OPEN_DATE) {
		TENDER_OPEN_DATE = tENDER_OPEN_DATE;
	}

	public String getAPPLY_FORM_VERIFY() {
		return APPLY_FORM_VERIFY;
	}

	public void setAPPLY_FORM_VERIFY(String aPPLY_FORM_VERIFY) {
		APPLY_FORM_VERIFY = aPPLY_FORM_VERIFY;
	}

	public Date getRECEIPT1_DATE() {
		return RECEIPT1_DATE;
	}

	public void setRECEIPT1_DATE(Date rECEIPT1_DATE) {
		RECEIPT1_DATE = rECEIPT1_DATE;
	}

	public Date getRECEIPT1_VALUE_DATE() {
		return RECEIPT1_VALUE_DATE;
	}

	public void setRECEIPT1_VALUE_DATE(Date rECEIPT1_VALUE_DATE) {
		RECEIPT1_VALUE_DATE = rECEIPT1_VALUE_DATE;
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

	public String getBID_CO_NAME() {
		if (BID_CO_NAME != null && BID_CO_NAME.length() > 0){
			if (BID_CO_NAME.charAt(BID_CO_NAME.length()-1)==',')
				return BID_CO_NAME.substring(0, BID_CO_NAME.length()-1);			
		}
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

	public String getBID_AGENT_PAY() {
		return BID_AGENT_PAY;
	}

	public void setBID_AGENT_PAY(String bID_AGENT_PAY) {
		BID_AGENT_PAY = bID_AGENT_PAY;
	}

	public String getAPPLY_REQUIRE() {
		return APPLY_REQUIRE;
	}

	public void setAPPLY_REQUIRE(String aPPLY_REQUIRE) {
		APPLY_REQUIRE = aPPLY_REQUIRE;
	}

	public Date getBID_MESSAGE_DATE() {
		return BID_MESSAGE_DATE;
	}

	public void setBID_MESSAGE_DATE(Date bID_MESSAGE_DATE) {
		BID_MESSAGE_DATE = bID_MESSAGE_DATE;
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

	public Date getRESERVE_DATE3() {
		return RESERVE_DATE3;
	}

	public void setRESERVE_DATE3(Date rESERVE_DATE3) {
		RESERVE_DATE3 = rESERVE_DATE3;
	}

	public Date getRESERVE_DATE4() {
		return RESERVE_DATE4;
	}

	public void setRESERVE_DATE4(Date rESERVE_DATE4) {
		RESERVE_DATE4 = rESERVE_DATE4;
	}

	public Date getRESERVE_DATE5() {
		return RESERVE_DATE5;
	}

	public void setRESERVE_DATE5(Date rESERVE_DATE5) {
		RESERVE_DATE5 = rESERVE_DATE5;
	}

	public Date getRESERVE_DATE6() {
		return RESERVE_DATE6;
	}

	public void setRESERVE_DATE6(Date rESERVE_DATE6) {
		RESERVE_DATE6 = rESERVE_DATE6;
	}

	public String getBID_PRICE_LIST() {
		if (BID_PRICE_LIST != null && BID_PRICE_LIST.length() > 0){
			if (BID_PRICE_LIST.charAt(BID_PRICE_LIST.length()-1)==',')
				return BID_PRICE_LIST.substring(0, BID_PRICE_LIST.length()-1);			
		}
		return BID_PRICE_LIST;
	}

	public String getBID_PRICE_LIST2() {
		return BID_PRICE_LIST;
	}

	public void setBID_PRICE_LIST(String bID_PRICE_LIST) {
		BID_PRICE_LIST = bID_PRICE_LIST;
	}

	public BigDecimal getBID_BOND() {
		return BID_BOND;
	}

	public void setBID_BOND(BigDecimal bID_BOND) {
		BID_BOND = bID_BOND;
	}

	public List<String[]> getAGENT_CO_LIST() {
		return AGENT_CO_LIST;
	}

	public void setAGENT_CO_LIST(List<String[]> aGENT_CO_LIST) {
		AGENT_CO_LIST = aGENT_CO_LIST;
	}

	public List<String[]> getBID_WIN_CO_LIST() {
		return BID_WIN_CO_LIST;
	}

	public void setBID_WIN_CO_LIST(List<String[]> bID_WIN_CO_LIST) {
		BID_WIN_CO_LIST = bID_WIN_CO_LIST;
	}

	public List<String> getPM_LIST() {
		return PM_LIST;
	}

	public void setPM_LIST(List<String> pM_LIST) {
		PM_LIST = pM_LIST;
	}

	public String getCNTRCT_NO() {
		return CNTRCT_NO;
	}

	public void setCNTRCT_NO(String cNTRCT_NO) {
		CNTRCT_NO = cNTRCT_NO;
	}

	public Date getPROJECT_DEVIEW_DATE() {
		return PROJECT_DEVIEW_DATE;
	}

	public void setPROJECT_DEVIEW_DATE(Date pROJECT_DEVIEW_DATE) {
		PROJECT_DEVIEW_DATE = pROJECT_DEVIEW_DATE;
	}

	public String getCNTRCT_TYPE() {
		return CNTRCT_TYPE;
	}

	public void setCNTRCT_TYPE(String cNTRCT_TYPE) {
		CNTRCT_TYPE = cNTRCT_TYPE;
	}

	public String getPROJECT_PROPERTY() {
		return PROJECT_PROPERTY;
	}

	public void setPROJECT_PROPERTY(String pROJECT_PROPERTY) {
		PROJECT_PROPERTY = pROJECT_PROPERTY;
	}

	public String getPROJECT_AUTH() {
		return PROJECT_AUTH;
	}

	public void setPROJECT_AUTH(String pROJECT_AUTH) {
		PROJECT_AUTH = pROJECT_AUTH;
	}

	public BigDecimal getBID_AGENT_PRICE_ACT() {
		return BID_AGENT_PRICE_ACT;
	}

	public void setBID_AGENT_PRICE_ACT(BigDecimal bID_AGENT_PRICE_ACT) {
		BID_AGENT_PRICE_ACT = bID_AGENT_PRICE_ACT;
	}

	public Date getREGISTE_ST_DATE1() {
		return REGISTE_ST_DATE1;
	}

	public void setREGISTE_ST_DATE1(Date rEGISTE_ST_DATE1) {
		REGISTE_ST_DATE1 = rEGISTE_ST_DATE1;
	}

	public Date getREGISTE_ED_DATE1() {
		return REGISTE_ED_DATE1;
	}

	public void setREGISTE_ED_DATE1(Date rEGISTE_ED_DATE1) {
		REGISTE_ED_DATE1 = rEGISTE_ED_DATE1;
	}

	public Date getREGISTE_ST_DATE2() {
		return REGISTE_ST_DATE2;
	}

	public void setREGISTE_ST_DATE2(Date rEGISTE_ST_DATE2) {
		REGISTE_ST_DATE2 = rEGISTE_ST_DATE2;
	}

	public Date getREGISTE_ED_DATE2() {
		return REGISTE_ED_DATE2;
	}

	public void setREGISTE_ED_DATE2(Date rEGISTE_ED_DATE2) {
		REGISTE_ED_DATE2 = rEGISTE_ED_DATE2;
	}

	public Date getREGISTE_ST_DATE3() {
		return REGISTE_ST_DATE3;
	}

	public void setREGISTE_ST_DATE3(Date rEGISTE_ST_DATE3) {
		REGISTE_ST_DATE3 = rEGISTE_ST_DATE3;
	}

	public Date getREGISTE_ED_DATE3() {
		return REGISTE_ED_DATE3;
	}

	public void setREGISTE_ED_DATE3(Date rEGISTE_ED_DATE3) {
		REGISTE_ED_DATE3 = rEGISTE_ED_DATE3;
	}

	public Date getREGISTE_ST_DATE4() {
		return REGISTE_ST_DATE4;
	}

	public void setREGISTE_ST_DATE4(Date rEGISTE_ST_DATE4) {
		REGISTE_ST_DATE4 = rEGISTE_ST_DATE4;
	}

	public Date getREGISTE_ED_DATE4() {
		return REGISTE_ED_DATE4;
	}

	public void setREGISTE_ED_DATE4(Date rEGISTE_ED_DATE4) {
		REGISTE_ED_DATE4 = rEGISTE_ED_DATE4;
	}

	public Date getREGISTE_ST_DATE5() {
		return REGISTE_ST_DATE5;
	}

	public void setREGISTE_ST_DATE5(Date rEGISTE_ST_DATE5) {
		REGISTE_ST_DATE5 = rEGISTE_ST_DATE5;
	}

	public Date getREGISTE_ED_DATE5() {
		return REGISTE_ED_DATE5;
	}

	public void setREGISTE_ED_DATE5(Date rEGISTE_ED_DATE5) {
		REGISTE_ED_DATE5 = rEGISTE_ED_DATE5;
	}

	public String getTENDER_OPEN_ADDRESS() {
		return TENDER_OPEN_ADDRESS;
	}

	public void setTENDER_OPEN_ADDRESS(String tENDER_OPEN_ADDRESS) {
		TENDER_OPEN_ADDRESS = tENDER_OPEN_ADDRESS;
	}

	public Date getTENDER_VERIFY_DATE() {
		return TENDER_VERIFY_DATE;
	}

	public void setTENDER_VERIFY_DATE(Date tENDER_VERIFY_DATE) {
		TENDER_VERIFY_DATE = tENDER_VERIFY_DATE;
	}

	public String getBID_AUTH() {
		return BID_AUTH;
	}

	public void setBID_AUTH(String bID_AUTH) {
		BID_AUTH = bID_AUTH;
	}

	public BigDecimal getBID_LIMIT_PRICE() {
		return BID_LIMIT_PRICE;
	}

	public void setBID_LIMIT_PRICE(BigDecimal bID_LIMIT_PRICE) {
		BID_LIMIT_PRICE = bID_LIMIT_PRICE;
	}

	public String getBID_CO_SEQ() {
		return BID_CO_SEQ;
	}

	public void setBID_CO_SEQ(String bID_CO_SEQ) {
		BID_CO_SEQ = bID_CO_SEQ;
	}

	public BigDecimal getBID_CO_PRICE() {
		return BID_CO_PRICE;
	}

	public void setBID_CO_PRICE(BigDecimal bID_CO_PRICE) {
		BID_CO_PRICE = bID_CO_PRICE;
	}

	public BigDecimal getBID_EXPERT_COMMISION() {
		return BID_EXPERT_COMMISION;
	}

	public void setBID_EXPERT_COMMISION(BigDecimal bID_EXPERT_COMMISION) {
		BID_EXPERT_COMMISION = bID_EXPERT_COMMISION;
	}

	public BigDecimal getBID_EXPERT_COMMISION_PRE() {
		return BID_EXPERT_COMMISION_PRE;
	}

	public void setBID_EXPERT_COMMISION_PRE(BigDecimal bID_EXPERT_COMMISION_PRE) {
		BID_EXPERT_COMMISION_PRE = bID_EXPERT_COMMISION_PRE;
	}

	public BigDecimal getBID_EXPERT_COMMISION_ACT() {
		return BID_EXPERT_COMMISION_ACT;
	}

	public void setBID_EXPERT_COMMISION_ACT(BigDecimal bID_EXPERT_COMMISION_ACT) {
		BID_EXPERT_COMMISION_ACT = bID_EXPERT_COMMISION_ACT;
	}

	public Date getBID_EXPERT_COMMISION_DIFF_DATE() {
		return BID_EXPERT_COMMISION_DIFF_DATE;
	}

	public void setBID_EXPERT_COMMISION_DIFF_DATE(Date bID_EXPERT_COMMISION_DIFF_DATE) {
		BID_EXPERT_COMMISION_DIFF_DATE = bID_EXPERT_COMMISION_DIFF_DATE;
	}

	public String getBID_EXPERT_COMMISION_APPLY() {
		return BID_EXPERT_COMMISION_APPLY;
	}

	public void setBID_EXPERT_COMMISION_APPLY(String bID_EXPERT_COMMISION_APPLY) {
		BID_EXPERT_COMMISION_APPLY = bID_EXPERT_COMMISION_APPLY;
	}

	public Date getAPPLY_FORM_EDIT_DATE() {
		return APPLY_FORM_EDIT_DATE;
	}

	public void setAPPLY_FORM_EDIT_DATE(Date aPPLY_FORM_EDIT_DATE) {
		APPLY_FORM_EDIT_DATE = aPPLY_FORM_EDIT_DATE;
	}

	public Date getAPPLY_FORM_COLLECT_DATE() {
		return APPLY_FORM_COLLECT_DATE;
	}

	public void setAPPLY_FORM_COLLECT_DATE(Date aPPLY_FORM_COLLECT_DATE) {
		APPLY_FORM_COLLECT_DATE = aPPLY_FORM_COLLECT_DATE;
	}

	public Date getAPPLY_FORM_VERIFY_DATE() {
		return APPLY_FORM_VERIFY_DATE;
	}

	public void setAPPLY_FORM_VERIFY_DATE(Date aPPLY_FORM_VERIFY_DATE) {
		APPLY_FORM_VERIFY_DATE = aPPLY_FORM_VERIFY_DATE;
	}

	public Date getAPPLY_FORM_FIX_DATE() {
		return APPLY_FORM_FIX_DATE;
	}

	public void setAPPLY_FORM_FIX_DATE(Date aPPLY_FORM_FIX_DATE) {
		APPLY_FORM_FIX_DATE = aPPLY_FORM_FIX_DATE;
	}

	public Date getAPPLY_FORM_BOX_DATE() {
		return APPLY_FORM_BOX_DATE;
	}

	public void setAPPLY_FORM_BOX_DATE(Date aPPLY_FORM_BOX_DATE) {
		APPLY_FORM_BOX_DATE = aPPLY_FORM_BOX_DATE;
	}

	public Date getSUPPORT_DOC_DATE() {
		return SUPPORT_DOC_DATE;
	}

	public void setSUPPORT_DOC_DATE(Date sUPPORT_DOC_DATE) {
		SUPPORT_DOC_DATE = sUPPORT_DOC_DATE;
	}

	public Date getBID_NOTICE_ST_DATE() {
		return BID_NOTICE_ST_DATE;
	}

	public void setBID_NOTICE_ST_DATE(Date bID_NOTICE_ST_DATE) {
		BID_NOTICE_ST_DATE = bID_NOTICE_ST_DATE;
	}

	public Date getBID_NOTICE_ED_DATE() {
		return BID_NOTICE_ED_DATE;
	}

	public void setBID_NOTICE_ED_DATE(Date bID_NOTICE_ED_DATE) {
		BID_NOTICE_ED_DATE = bID_NOTICE_ED_DATE;
	}

	public Date getBID_DOC_DELI_DATE1() {
		return BID_DOC_DELI_DATE1;
	}

	public void setBID_DOC_DELI_DATE1(Date bID_DOC_DELI_DATE1) {
		BID_DOC_DELI_DATE1 = bID_DOC_DELI_DATE1;
	}

	public String getBID_DOC_DELI_FILE1() {
		return BID_DOC_DELI_FILE1;
	}

	public void setBID_DOC_DELI_FILE1(String bID_DOC_DELI_FILE1) {
		BID_DOC_DELI_FILE1 = bID_DOC_DELI_FILE1;
	}

	public Date getBID_DOC_DELI_DATE2() {
		return BID_DOC_DELI_DATE2;
	}

	public void setBID_DOC_DELI_DATE2(Date bID_DOC_DELI_DATE2) {
		BID_DOC_DELI_DATE2 = bID_DOC_DELI_DATE2;
	}

	public String getBID_DOC_DELI_FILE2() {
		return BID_DOC_DELI_FILE2;
	}

	public void setBID_DOC_DELI_FILE2(String bID_DOC_DELI_FILE2) {
		BID_DOC_DELI_FILE2 = bID_DOC_DELI_FILE2;
	}

	public Date getBID_DOC_DELI_DATE3() {
		return BID_DOC_DELI_DATE3;
	}

	public void setBID_DOC_DELI_DATE3(Date bID_DOC_DELI_DATE3) {
		BID_DOC_DELI_DATE3 = bID_DOC_DELI_DATE3;
	}

	public String getBID_DOC_DELI_FILE3() {
		return BID_DOC_DELI_FILE3;
	}

	public void setBID_DOC_DELI_FILE3(String bID_DOC_DELI_FILE3) {
		BID_DOC_DELI_FILE3 = bID_DOC_DELI_FILE3;
	}

	public Date getBID_DOC_DELI_DATE4() {
		return BID_DOC_DELI_DATE4;
	}

	public void setBID_DOC_DELI_DATE4(Date bID_DOC_DELI_DATE4) {
		BID_DOC_DELI_DATE4 = bID_DOC_DELI_DATE4;
	}

	public String getBID_DOC_DELI_FILE4() {
		return BID_DOC_DELI_FILE4;
	}

	public void setBID_DOC_DELI_FILE4(String bID_DOC_DELI_FILE4) {
		BID_DOC_DELI_FILE4 = bID_DOC_DELI_FILE4;
	}

	public Date getBID_DOC_DELI_DATE5() {
		return BID_DOC_DELI_DATE5;
	}

	public void setBID_DOC_DELI_DATE5(Date bID_DOC_DELI_DATE5) {
		BID_DOC_DELI_DATE5 = bID_DOC_DELI_DATE5;
	}

	public String getBID_DOC_DELI_FILE5() {
		return BID_DOC_DELI_FILE5;
	}

	public void setBID_DOC_DELI_FILE5(String bID_DOC_DELI_FILE5) {
		BID_DOC_DELI_FILE5 = bID_DOC_DELI_FILE5;
	}

	public Date getBID_DOC_DELI_DATE6() {
		return BID_DOC_DELI_DATE6;
	}

	public void setBID_DOC_DELI_DATE6(Date bID_DOC_DELI_DATE6) {
		BID_DOC_DELI_DATE6 = bID_DOC_DELI_DATE6;
	}

	public String getBID_DOC_DELI_FILE6() {
		return BID_DOC_DELI_FILE6;
	}

	public void setBID_DOC_DELI_FILE6(String bID_DOC_DELI_FILE6) {
		BID_DOC_DELI_FILE6 = bID_DOC_DELI_FILE6;
	}

	public Date getBID_DOC_DELI_DATE7() {
		return BID_DOC_DELI_DATE7;
	}

	public void setBID_DOC_DELI_DATE7(Date bID_DOC_DELI_DATE7) {
		BID_DOC_DELI_DATE7 = bID_DOC_DELI_DATE7;
	}

	public String getBID_DOC_DELI_FILE7() {
		return BID_DOC_DELI_FILE7;
	}

	public void setBID_DOC_DELI_FILE7(String bID_DOC_DELI_FILE7) {
		BID_DOC_DELI_FILE7 = bID_DOC_DELI_FILE7;
	}

	public Date getBID_DOC_DELI_DATE8() {
		return BID_DOC_DELI_DATE8;
	}

	public void setBID_DOC_DELI_DATE8(Date bID_DOC_DELI_DATE8) {
		BID_DOC_DELI_DATE8 = bID_DOC_DELI_DATE8;
	}

	public String getBID_DOC_DELI_FILE8() {
		return BID_DOC_DELI_FILE8;
	}

	public void setBID_DOC_DELI_FILE8(String bID_DOC_DELI_FILE8) {
		BID_DOC_DELI_FILE8 = bID_DOC_DELI_FILE8;
	}

	public Date getBID_DOC_DELI_DATE9() {
		return BID_DOC_DELI_DATE9;
	}

	public void setBID_DOC_DELI_DATE9(Date bID_DOC_DELI_DATE9) {
		BID_DOC_DELI_DATE9 = bID_DOC_DELI_DATE9;
	}

	public String getBID_DOC_DELI_FILE9() {
		return BID_DOC_DELI_FILE9;
	}

	public void setBID_DOC_DELI_FILE9(String bID_DOC_DELI_FILE9) {
		BID_DOC_DELI_FILE9 = bID_DOC_DELI_FILE9;
	}

	public Date getBID_DOC_DELI_DATE10() {
		return BID_DOC_DELI_DATE10;
	}

	public void setBID_DOC_DELI_DATE10(Date bID_DOC_DELI_DATE10) {
		BID_DOC_DELI_DATE10 = bID_DOC_DELI_DATE10;
	}

	public String getBID_DOC_DELI_FILE10() {
		return BID_DOC_DELI_FILE10;
	}

	public void setBID_DOC_DELI_FILE10(String bID_DOC_DELI_FILE10) {
		BID_DOC_DELI_FILE10 = bID_DOC_DELI_FILE10;
	}

	public Date getBID_INFORM_RCV_DATE() {
		return BID_INFORM_RCV_DATE;
	}

	public void setBID_INFORM_RCV_DATE(Date bID_INFORM_RCV_DATE) {
		BID_INFORM_RCV_DATE = bID_INFORM_RCV_DATE;
	}

	public String getBID_INFORM_RCV() {
		return BID_INFORM_RCV;
	}

	public void setBID_INFORM_RCV(String bID_INFORM_RCV) {
		BID_INFORM_RCV = bID_INFORM_RCV;
	}

	public Date getBID_VER_DOC_SCAN_DATE() {
		return BID_VER_DOC_SCAN_DATE;
	}

	public void setBID_VER_DOC_SCAN_DATE(Date bID_VER_DOC_SCAN_DATE) {
		BID_VER_DOC_SCAN_DATE = bID_VER_DOC_SCAN_DATE;
	}

	public String getBID_VER_DOC_SCAN() {
		return BID_VER_DOC_SCAN;
	}

	public void setBID_VER_DOC_SCAN(String bID_VER_DOC_SCAN) {
		BID_VER_DOC_SCAN = bID_VER_DOC_SCAN;
	}

	public Date getBID_VER_DOC_DELI_DATE1() {
		return BID_VER_DOC_DELI_DATE1;
	}

	public void setBID_VER_DOC_DELI_DATE1(Date bID_VER_DOC_DELI_DATE1) {
		BID_VER_DOC_DELI_DATE1 = bID_VER_DOC_DELI_DATE1;
	}

	public String getBID_VER_DOC_DELI_FILE1() {
		return BID_VER_DOC_DELI_FILE1;
	}

	public void setBID_VER_DOC_DELI_FILE1(String bID_VER_DOC_DELI_FILE1) {
		BID_VER_DOC_DELI_FILE1 = bID_VER_DOC_DELI_FILE1;
	}

	public Date getBID_VER_DOC_DELI_DATE2() {
		return BID_VER_DOC_DELI_DATE2;
	}

	public void setBID_VER_DOC_DELI_DATE2(Date bID_VER_DOC_DELI_DATE2) {
		BID_VER_DOC_DELI_DATE2 = bID_VER_DOC_DELI_DATE2;
	}

	public String getBID_VER_DOC_DELI_FILE2() {
		return BID_VER_DOC_DELI_FILE2;
	}

	public void setBID_VER_DOC_DELI_FILE2(String bID_VER_DOC_DELI_FILE2) {
		BID_VER_DOC_DELI_FILE2 = bID_VER_DOC_DELI_FILE2;
	}

	public Date getBID_VER_DOC_DELI_DATE3() {
		return BID_VER_DOC_DELI_DATE3;
	}

	public void setBID_VER_DOC_DELI_DATE3(Date bID_VER_DOC_DELI_DATE3) {
		BID_VER_DOC_DELI_DATE3 = bID_VER_DOC_DELI_DATE3;
	}

	public String getBID_VER_DOC_DELI_FILE3() {
		return BID_VER_DOC_DELI_FILE3;
	}

	public void setBID_VER_DOC_DELI_FILE3(String bID_VER_DOC_DELI_FILE3) {
		BID_VER_DOC_DELI_FILE3 = bID_VER_DOC_DELI_FILE3;
	}

	public Date getBID_VER_DOC_DELI_DATE4() {
		return BID_VER_DOC_DELI_DATE4;
	}

	public void setBID_VER_DOC_DELI_DATE4(Date bID_VER_DOC_DELI_DATE4) {
		BID_VER_DOC_DELI_DATE4 = bID_VER_DOC_DELI_DATE4;
	}

	public String getBID_VER_DOC_DELI_FILE4() {
		return BID_VER_DOC_DELI_FILE4;
	}

	public void setBID_VER_DOC_DELI_FILE4(String bID_VER_DOC_DELI_FILE4) {
		BID_VER_DOC_DELI_FILE4 = bID_VER_DOC_DELI_FILE4;
	}

	public Date getBID_VER_DOC_DELI_DATE5() {
		return BID_VER_DOC_DELI_DATE5;
	}

	public void setBID_VER_DOC_DELI_DATE5(Date bID_VER_DOC_DELI_DATE5) {
		BID_VER_DOC_DELI_DATE5 = bID_VER_DOC_DELI_DATE5;
	}

	public String getBID_VER_DOC_DELI_FILE5() {
		return BID_VER_DOC_DELI_FILE5;
	}

	public void setBID_VER_DOC_DELI_FILE5(String bID_VER_DOC_DELI_FILE5) {
		BID_VER_DOC_DELI_FILE5 = bID_VER_DOC_DELI_FILE5;
	}

	public Date getBID_VER_DOC_DELI_DATE6() {
		return BID_VER_DOC_DELI_DATE6;
	}

	public void setBID_VER_DOC_DELI_DATE6(Date bID_VER_DOC_DELI_DATE6) {
		BID_VER_DOC_DELI_DATE6 = bID_VER_DOC_DELI_DATE6;
	}

	public String getBID_VER_DOC_DELI_FILE6() {
		return BID_VER_DOC_DELI_FILE6;
	}

	public void setBID_VER_DOC_DELI_FILE6(String bID_VER_DOC_DELI_FILE6) {
		BID_VER_DOC_DELI_FILE6 = bID_VER_DOC_DELI_FILE6;
	}

	public Date getBID_VER_DOC_DELI_DATE7() {
		return BID_VER_DOC_DELI_DATE7;
	}

	public void setBID_VER_DOC_DELI_DATE7(Date bID_VER_DOC_DELI_DATE7) {
		BID_VER_DOC_DELI_DATE7 = bID_VER_DOC_DELI_DATE7;
	}

	public String getBID_VER_DOC_DELI_FILE7() {
		return BID_VER_DOC_DELI_FILE7;
	}

	public void setBID_VER_DOC_DELI_FILE7(String bID_VER_DOC_DELI_FILE7) {
		BID_VER_DOC_DELI_FILE7 = bID_VER_DOC_DELI_FILE7;
	}

	public Date getBID_VER_DOC_DELI_DATE8() {
		return BID_VER_DOC_DELI_DATE8;
	}

	public void setBID_VER_DOC_DELI_DATE8(Date bID_VER_DOC_DELI_DATE8) {
		BID_VER_DOC_DELI_DATE8 = bID_VER_DOC_DELI_DATE8;
	}

	public String getBID_VER_DOC_DELI_FILE8() {
		return BID_VER_DOC_DELI_FILE8;
	}

	public void setBID_VER_DOC_DELI_FILE8(String bID_VER_DOC_DELI_FILE8) {
		BID_VER_DOC_DELI_FILE8 = bID_VER_DOC_DELI_FILE8;
	}

	public Date getBID_VER_DOC_DELI_DATE9() {
		return BID_VER_DOC_DELI_DATE9;
	}

	public void setBID_VER_DOC_DELI_DATE9(Date bID_VER_DOC_DELI_DATE9) {
		BID_VER_DOC_DELI_DATE9 = bID_VER_DOC_DELI_DATE9;
	}

	public String getBID_VER_DOC_DELI_FILE9() {
		return BID_VER_DOC_DELI_FILE9;
	}

	public void setBID_VER_DOC_DELI_FILE9(String bID_VER_DOC_DELI_FILE9) {
		BID_VER_DOC_DELI_FILE9 = bID_VER_DOC_DELI_FILE9;
	}

	public Date getBID_VER_DOC_DELI_DATE10() {
		return BID_VER_DOC_DELI_DATE10;
	}

	public void setBID_VER_DOC_DELI_DATE10(Date bID_VER_DOC_DELI_DATE10) {
		BID_VER_DOC_DELI_DATE10 = bID_VER_DOC_DELI_DATE10;
	}

	public String getBID_VER_DOC_DELI_FILE10() {
		return BID_VER_DOC_DELI_FILE10;
	}

	public void setBID_VER_DOC_DELI_FILE10(String bID_VER_DOC_DELI_FILE10) {
		BID_VER_DOC_DELI_FILE10 = bID_VER_DOC_DELI_FILE10;
	}

	public String getPROGRESS_STATUS() {
		return PROGRESS_STATUS;
	}

	public void setPROGRESS_STATUS(String pROGRESS_STATUS) {
		PROGRESS_STATUS = pROGRESS_STATUS;
	}

	public String getRESERVE_DATE7() {
		return RESERVE_DATE7;
	}

	public void setRESERVE_DATE7(String rESERVE_DATE7) {
		RESERVE_DATE7 = rESERVE_DATE7;
	}

	public String getRESERVE_DATE8() {
		return RESERVE_DATE8;
	}

	public void setRESERVE_DATE8(String rESERVE_DATE8) {
		RESERVE_DATE8 = rESERVE_DATE8;
	}

	public String getRESERVE_DATE9() {
		return RESERVE_DATE9;
	}

	public void setRESERVE_DATE9(String rESERVE_DATE9) {
		RESERVE_DATE9 = rESERVE_DATE9;
	}

	public String getRESERVE_DATE10() {
		return RESERVE_DATE10;
	}

	public void setRESERVE_DATE10(String rESERVE_DATE10) {
		RESERVE_DATE10 = rESERVE_DATE10;
	}

	public String getLATEST_FLG() {
		return LATEST_FLG;
	}

	public void setLATEST_FLG(String lATEST_FLG) {
		LATEST_FLG = lATEST_FLG;
	}

	public String getBID_STATUS() {
		return BID_STATUS;
	}

	public void setBID_STATUS(String bID_STATUS) {
		BID_STATUS = bID_STATUS;
	}

	public BigDecimal getBID_WIN_PRICE() {
		return BID_WIN_PRICE;
	}

	public void setBID_WIN_PRICE(BigDecimal bID_WIN_PRICE) {
		BID_WIN_PRICE = bID_WIN_PRICE;
	}

	public Date getBID_VALUE_DATE() {
		return BID_VALUE_DATE;
	}

	public void setBID_VALUE_DATE(Date bID_VALUE_DATE) {
		BID_VALUE_DATE = bID_VALUE_DATE;
	}

	public String getCNTRCT_YEAR() {
		return CNTRCT_YEAR;
	}

	public void setCNTRCT_YEAR(String cNTRCT_YEAR) {
		CNTRCT_YEAR = cNTRCT_YEAR;
	}

	public String getCNTRCT_NAME() {
		return CNTRCT_NAME;
	}

	public void setCNTRCT_NAME(String cNTRCT_NAME) {
		CNTRCT_NAME = cNTRCT_NAME;
	}

	public List<BidCompDto> getJoinBidCompList() {
		return joinBidCompList;
	}

	public void setJoinBidCompList(List<BidCompDto> joinBidCompList) {
		this.joinBidCompList = joinBidCompList;
	}

	public List<BidCompDto> getBondBidCompList() {
		return bondBidCompList;
	}

	public void setBondBidCompList(List<BidCompDto> bondBidCompList) {
		this.bondBidCompList = bondBidCompList;
	}

	public String getBID_COMP_NO() {
		return BID_COMP_NO;
	}

	public void setBID_COMP_NO(String bID_COMP_NO) {
		BID_COMP_NO = bID_COMP_NO;
	}

	public String getBID_COMP_NAME() {
		return BID_COMP_NAME;
	}

	public void setBID_COMP_NAME(String bID_COMP_NAME) {
		BID_COMP_NAME = bID_COMP_NAME;
	}

	public String getCO_MANAGER1() {
		return CO_MANAGER1;
	}

	public void setCO_MANAGER1(String cO_MANAGER1) {
		CO_MANAGER1 = cO_MANAGER1;
	}

	public String getCO_MANAGER_TEL1() {
		return CO_MANAGER_TEL1;
	}

	public void setCO_MANAGER_TEL1(String cO_MANAGER_TEL1) {
		CO_MANAGER_TEL1 = cO_MANAGER_TEL1;
	}

	public String getCO_ADDRESS1() {
		return CO_ADDRESS1;
	}

	public void setCO_ADDRESS1(String cO_ADDRESS1) {
		CO_ADDRESS1 = cO_ADDRESS1;
	}

	public String getCO_MANAGER_EMAIL1() {
		return CO_MANAGER_EMAIL1;
	}

	public void setCO_MANAGER_EMAIL1(String cO_MANAGER_EMAIL1) {
		CO_MANAGER_EMAIL1 = cO_MANAGER_EMAIL1;
	}

	public String getCO_TAX() {
		return CO_TAX;
	}

	public void setCO_TAX(String cO_TAX) {
		CO_TAX = cO_TAX;
	}

	public String getIS_RANDOM() {
		return IS_RANDOM;
	}

	public void setIS_RANDOM(String iS_RANDOM) {
		IS_RANDOM = iS_RANDOM;
	}
	
	public Date getGEN_REGISTE_RPT_DATE() {
		return GEN_REGISTE_RPT_DATE;
	}

	public void setGEN_REGISTE_RPT_DATE(Date gEN_REGISTE_RPT_DATE) {
		GEN_REGISTE_RPT_DATE = gEN_REGISTE_RPT_DATE;
	}

	public Date getGEN_VERIFY_RPT_DATE() {
		return GEN_VERIFY_RPT_DATE;
	}

	public void setGEN_VERIFY_RPT_DATE(Date gEN_VERIFY_RPT_DATE) {
		GEN_VERIFY_RPT_DATE = gEN_VERIFY_RPT_DATE;
	}

	public Date getBID_EXPERT_COMMISION_APPLY_DATE() {
		return BID_EXPERT_COMMISION_APPLY_DATE;
	}

	public void setBID_EXPERT_COMMISION_APPLY_DATE(
			Date bID_EXPERT_COMMISION_APPLY_DATE) {
		BID_EXPERT_COMMISION_APPLY_DATE = bID_EXPERT_COMMISION_APPLY_DATE;
	}

	public Date getCNTRCT_ST_DATE() {
		return CNTRCT_ST_DATE;
	}

	public void setCNTRCT_ST_DATE(Date cNTRCT_ST_DATE) {
		CNTRCT_ST_DATE = cNTRCT_ST_DATE;
	}

	public Date getCNTRCT_ED_DATE() {
		return CNTRCT_ED_DATE;
	}

	public void setCNTRCT_ED_DATE(Date cNTRCT_ED_DATE) {
		CNTRCT_ED_DATE = cNTRCT_ED_DATE;
	}
}
