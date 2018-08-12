package com.cn.tbps.dto;

import java.math.BigDecimal;
import java.util.Date;

import com.cn.common.dto.BaseDto;

/**
 * 保证金
 * @name BondDto.java
 * @author Pei
 * @time 2016-10-28 20:07:53
 * @version 1.0
 */
public class BondDetailDto extends BaseDto {

	private static final long serialVersionUID = -2583013554891692140L;

	/**
	 * 分类
	 */
	private String DATA_TYPE;

	/**
	 * 招标编号
	 */
	private String BID_NO;

	/**
	 * 项目分类
	 */
	private String PROJECT_TYPE;

	/**
	 * 项目性质
	 */
	private String PROJECT_TYPE_NAME;

	/**
	 * 项目名称
	 */
	private String PROJECT_NAME;

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
	 * 会审监管人
	 */
	private String BOND_AUDIT;
	
	/**
	 * 代理费用支付方
	 */
	private String ANGENT_COST_PAYMENT;

	/**
	 * 投标单位公司号
	 */
	private Integer BID_CO_NO;

	/**
	 * 投标单位
	 */
	private String BID_CO_NAME;

	/**
	 * 保证金金额
	 */
	private BigDecimal BID_BOND;
	
	/**
	 * 保证金金额(万元)
	 */
	private BigDecimal BID_BOND_WAN;

	/**
	 * 到账日期(保证金收入时间BID_CO)
	 */
	private Date BID_CO_VALUE_DATE;
	
	/**
	 * 保证金退还时间	
	 */
	private Date REFOUND_DEPOSIT_DATE;

	/**
	 * 保证金支付形式
	 */
	private String BID_PAYMENT_TYPE;
	
	/**
	 * 中标公司号
	 */
	private Integer BID_CO_SEQ;
	
	/**
	 * 中标单位
	 */
	private String BID_WIN_CO_NAME;

	/**
	 * 中标价
	 */
	private BigDecimal BID_PRICE;

	/**
	 * 中标价(万元)LIST
	 */
	private String BID_PRICE_LIST;
	
	/**
	 * 中标公司标书费
	 */
	private BigDecimal BID_APPLY_PRICE;
	
	/**
	 * 代理费
	 */
	private BigDecimal RECEIPT1_AGENT_COMMISSION;

	/**
	 * 专家费（专家评审费，单位元）	
	 */
	private BigDecimal BID_COMMISION;

	/**
	 * 工程师
	 */
	private String PROJECT_MANAGER;

	/**
	 * 开标时间
	 */
	private Date TENDER_OPEN_DATE;
	
	
	/**
	 * 评标时间
	 */
	private Date RESERVE_DATE1;

	/**
	 * 招标公告开始时间
	 */
	private Date SUBMIT_DATE;

	/**
	 * 招标公告结束时间	
	 */
	private Date SUBMIT_DATE2;

	/**
	 * 中标公示开始时间	
	 */
	private Date BID_NOTICE_DATE;

	/**
	 * 中标公示结束时间
	 */
	private Date BID_NOTICE_DATE2;

	/**
	 * 代理费到账时间	
	 */
	private Date BID_VALUE_DATE;
	
	/**
	 * 中标文件扫描
	 */
	private String BID_WIN_SCAN_DATE;

	/**
	 * 评标报告扫描归档时间	
	 */
	private Date BID_AUDIT_SCAN_DATE;

	/**
	 * 甲方资料归档
	 * 招标文件移交时间
	 */
	private Date BID_CO_ZB_FM_DATE;

	/**
	 * 投标文件移交时间
	 */
	private Date BID_CO_TB_FM_DATE;
	/**
	 * 评标文件移交时间
	 */
	private Date BID_CO_PB_FM_DATE;

	/**
	 * 工程概况限价
	 */
	private String PROJ_ASTRICT_PRICE;
	
	/**
	 * 项目完成情况
	 */
	private String FINISH_STATUS;

	/**
	 * 项目完成情况的备注
	 */
	private String FINISH_NOTE;
	
	/**
	 * 投标状态（10新增项目信息，20报名，30保证金，40开标评标，50资料归档）
	 */
	private String STATUS;

	public String getDATA_TYPE() {
		return DATA_TYPE;
	}

	public void setDATA_TYPE(String dATA_TYPE) {
		DATA_TYPE = dATA_TYPE;
	}

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

	public String getPROJECT_TYPE_NAME() {
		if (getPROJECT_TYPE().equals("1"))
			PROJECT_TYPE_NAME = "招标";
		else if (getPROJECT_TYPE().equals("2"))
			PROJECT_TYPE_NAME = "比选";
		else if (getPROJECT_TYPE().equals("3"))
			PROJECT_TYPE_NAME = "招标办";
		else if (getPROJECT_TYPE().equals("4"))
			PROJECT_TYPE_NAME = "竞价";
		return PROJECT_TYPE_NAME;
	}

	public void setPROJECT_TYPE_NAME(String pROJECT_TYPE_NAME) {
		PROJECT_TYPE_NAME = pROJECT_TYPE_NAME;
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

	public String getBOND_AUDIT() {
		return BOND_AUDIT;
	}

	public void setBOND_AUDIT(String bOND_AUDIT) {
		BOND_AUDIT = bOND_AUDIT;
	}

	public String getANGENT_COST_PAYMENT() {
		return ANGENT_COST_PAYMENT;
	}

	public void setANGENT_COST_PAYMENT(String aNGENT_COST_PAYMENT) {
		ANGENT_COST_PAYMENT = aNGENT_COST_PAYMENT;
	}

	public Integer getBID_CO_NO() {
		return BID_CO_NO;
	}

	public void setBID_CO_NO(Integer bID_CO_NO) {
		BID_CO_NO = bID_CO_NO;
	}

	public String getBID_CO_NAME() {
		return BID_CO_NAME;
	}

	public void setBID_CO_NAME(String bID_CO_NAME) {
		BID_CO_NAME = bID_CO_NAME;
	}

	public BigDecimal getBID_BOND() {
		return BID_BOND;
	}

	public void setBID_BOND(BigDecimal bID_BOND) {
		BID_BOND = bID_BOND;
	}

	public Date getBID_CO_VALUE_DATE() {
		return BID_CO_VALUE_DATE;
	}

	public void setBID_CO_VALUE_DATE(Date bID_CO_VALUE_DATE) {
		BID_CO_VALUE_DATE = bID_CO_VALUE_DATE;
	}

	public Date getREFOUND_DEPOSIT_DATE() {
		return REFOUND_DEPOSIT_DATE;
	}

	public void setREFOUND_DEPOSIT_DATE(Date rEFOUND_DEPOSIT_DATE) {
		REFOUND_DEPOSIT_DATE = rEFOUND_DEPOSIT_DATE;
	}

	public String getBID_PAYMENT_TYPE() {
		if (BID_PAYMENT_TYPE != null){
			if (BID_PAYMENT_TYPE.equals("1") || BID_PAYMENT_TYPE.equals("现金"))
				BID_PAYMENT_TYPE = "现金";
			else if (BID_PAYMENT_TYPE.equals("2") || BID_PAYMENT_TYPE.equals("支票"))
				BID_PAYMENT_TYPE = "支票";
			else if (BID_PAYMENT_TYPE.equals("3") || BID_PAYMENT_TYPE.equals("转账"))
				BID_PAYMENT_TYPE = "转账";
			else if (BID_PAYMENT_TYPE.equals("4") || BID_PAYMENT_TYPE.equals("汇票"))
				BID_PAYMENT_TYPE = "汇票";
			else if (BID_PAYMENT_TYPE.equals("5") || BID_PAYMENT_TYPE.equals("保函"))
				BID_PAYMENT_TYPE = "保函";
			else if (BID_PAYMENT_TYPE.equals("6") || BID_PAYMENT_TYPE.equals("现金2"))
				BID_PAYMENT_TYPE = "现金2";			
		}
		return BID_PAYMENT_TYPE;

	}

	public void setBID_PAYMENT_TYPE(String bID_PAYMENT_TYPE) {
		BID_PAYMENT_TYPE = bID_PAYMENT_TYPE;
	}

	public Integer getBID_CO_SEQ() {
		return BID_CO_SEQ;
	}

	public void setBID_CO_SEQ(Integer bID_CO_SEQ) {
		BID_CO_SEQ = bID_CO_SEQ;
	}

	public String getBID_WIN_CO_NAME() {
		if (BID_WIN_CO_NAME != null && BID_WIN_CO_NAME.length() > 0){
			if (BID_WIN_CO_NAME.charAt(BID_WIN_CO_NAME.length()-1)==',')
				return BID_WIN_CO_NAME.substring(0, BID_WIN_CO_NAME.length()-1);			
		}
		return BID_WIN_CO_NAME;
	}

	public void setBID_WIN_CO_NAME(String bID_WIN_CO_NAME) {
		BID_WIN_CO_NAME = bID_WIN_CO_NAME;
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

	public BigDecimal getRECEIPT1_AGENT_COMMISSION() {
		return RECEIPT1_AGENT_COMMISSION;
	}

	public void setRECEIPT1_AGENT_COMMISSION(BigDecimal rECEIPT1_AGENT_COMMISSION) {
		RECEIPT1_AGENT_COMMISSION = rECEIPT1_AGENT_COMMISSION;
	}

	public BigDecimal getBID_COMMISION() {
		return BID_COMMISION;
	}

	public void setBID_COMMISION(BigDecimal bID_COMMISION) {
		BID_COMMISION = bID_COMMISION;
	}

	public Date getTENDER_OPEN_DATE() {
		return TENDER_OPEN_DATE;
	}

	public void setTENDER_OPEN_DATE(Date tENDER_OPEN_DATE) {
		TENDER_OPEN_DATE = tENDER_OPEN_DATE;
	}

	public Date getRESERVE_DATE1() {
		return RESERVE_DATE1;
	}

	public void setRESERVE_DATE1(Date rESERVE_DATE1) {
		RESERVE_DATE1 = rESERVE_DATE1;
	}

	public Date getSUBMIT_DATE() {
		return SUBMIT_DATE;
	}

	public void setSUBMIT_DATE(Date sUBMIT_DATE) {
		SUBMIT_DATE = sUBMIT_DATE;
	}

	public Date getSUBMIT_DATE2() {
		return SUBMIT_DATE2;
	}

	public void setSUBMIT_DATE2(Date sUBMIT_DATE2) {
		SUBMIT_DATE2 = sUBMIT_DATE2;
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

	public Date getBID_VALUE_DATE() {
		return BID_VALUE_DATE;
	}

	public void setBID_VALUE_DATE(Date bID_VALUE_DATE) {
		BID_VALUE_DATE = bID_VALUE_DATE;
	}

	public String getBID_WIN_SCAN_DATE() {
		return BID_WIN_SCAN_DATE;
	}

	public void setBID_WIN_SCAN_DATE(String bID_WIN_SCAN_DATE) {
		BID_WIN_SCAN_DATE = bID_WIN_SCAN_DATE;
	}

	public Date getBID_AUDIT_SCAN_DATE() {
		return BID_AUDIT_SCAN_DATE;
	}

	public void setBID_AUDIT_SCAN_DATE(Date bID_AUDIT_SCAN_DATE) {
		BID_AUDIT_SCAN_DATE = bID_AUDIT_SCAN_DATE;
	}


	public Date getBID_CO_ZB_FM_DATE() {
		return BID_CO_ZB_FM_DATE;
	}

	public void setBID_CO_ZB_FM_DATE(Date bID_CO_ZB_FM_DATE) {
		BID_CO_ZB_FM_DATE = bID_CO_ZB_FM_DATE;
	}

	public Date getBID_CO_TB_FM_DATE() {
		return BID_CO_TB_FM_DATE;
	}

	public void setBID_CO_TB_FM_DATE(Date bID_CO_TB_FM_DATE) {
		BID_CO_TB_FM_DATE = bID_CO_TB_FM_DATE;
	}

	public Date getBID_CO_PB_FM_DATE() {
		return BID_CO_PB_FM_DATE;
	}

	public void setBID_CO_PB_FM_DATE(Date bID_CO_PB_FM_DATE) {
		BID_CO_PB_FM_DATE = bID_CO_PB_FM_DATE;
	}

	public String getPROJ_ASTRICT_PRICE() {
		return PROJ_ASTRICT_PRICE;
	}

	public void setPROJ_ASTRICT_PRICE(String pROJ_ASTRICT_PRICE) {
		PROJ_ASTRICT_PRICE = pROJ_ASTRICT_PRICE;
	}

	public String getFINISH_STATUS() {
		if (FINISH_STATUS != null){
			if (FINISH_STATUS.equals("1") || FINISH_STATUS.equals("完成"))
				FINISH_STATUS = "完成";
			else
				FINISH_STATUS = "失败";
		}
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

	public BigDecimal getBID_BOND_WAN() {
		if (BID_BOND != null)
			BID_BOND_WAN = BID_BOND.divide(new BigDecimal(10000));
		return BID_BOND_WAN;
	}

	public void setBID_BOND_WAN(BigDecimal bID_BOND_WAN) {
		BID_BOND_WAN = bID_BOND_WAN;
	}

	public String getPROJECT_MANAGER() {
		return PROJECT_MANAGER;
	}

	public void setPROJECT_MANAGER(String pROJECT_MANAGER) {
		PROJECT_MANAGER = pROJECT_MANAGER;
	}

	public String getBID_PRICE_LIST() {
		if (BID_PRICE_LIST != null && BID_PRICE_LIST.length() > 0){
			if (BID_PRICE_LIST.charAt(BID_PRICE_LIST.length()-1)==',')
				return BID_PRICE_LIST.substring(0, BID_PRICE_LIST.length()-1);			
		}
		return BID_PRICE_LIST;
	}

	public void setBID_PRICE_LIST(String bID_PRICE_LIST) {
		BID_PRICE_LIST = bID_PRICE_LIST;
	}

}
