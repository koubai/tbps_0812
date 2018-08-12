package com.cn.tbps.dto;

import java.math.BigDecimal;
import java.util.Date;

import com.cn.common.dto.BaseDto;

/**
 * 保证金
 * @name BondExtendlDto.java
 * @author Liu
 * @time 2017-08-28 20:07:53
 * @version 1.0
 */
public class BondExtendDto extends BaseDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4022938209928670010L;

	/**
	 * 招标编号
	 */
	private String BID_NO;

	/**
	 * 项目分类
	 */
	private String PROJECT_TYPE;

	/**
	 * 项目名称
	 */
	private String PROJECT_NAME;

	/**
	 * 工程师
	 */
	private String PROJECT_MANAGER;

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
	
	//专家费
	/**
	 * 专家费（专家评审费，单位元）实际支出	
	 */
	private BigDecimal BID_COMMISION;
	//专家费

	/**
	 * 投标单位公司号
	 */
	private Integer BID_CO_NO;

	/**
	 * 投标单位
	 */
	private String BID_CO_TB_NAME;

	/**
	 * 保证金入账日期
	 */
	private Date RESERVE_DATE2;
	
	//收入方式（单位：万元）
	/**
	 * 支付形式=1金额（现金）
	 */
	private BigDecimal AMOUNT1;
	private BigDecimal AMOUNT1_WAN;
	
	/**
	 * 支付形式=2金额（支票）
	 */
	private BigDecimal AMOUNT2;
	private BigDecimal AMOUNT2_WAN;
	
	/**
	 * 支付形式=3金额（转账）
	 */
	private BigDecimal AMOUNT3;
	private BigDecimal AMOUNT3_WAN;
	
	/**
	 * 支付形式=4金额（汇票）
	 */
	private BigDecimal AMOUNT4;
	private BigDecimal AMOUNT4_WAN;
	
	/**
	 * 支付形式=3和4合计金额
	 */
	private BigDecimal AMOUNT34;
	private BigDecimal AMOUNT34_WAN;
	
	/**
	 * 支付形式=5（保函）
	 */
	private BigDecimal AMOUNT5;
	private BigDecimal AMOUNT5_WAN;
	
	/**
	 * 支付形式=6（现金2）
	 */
	private BigDecimal AMOUNT6;
	private BigDecimal AMOUNT6_WAN;
	//收入方式（单位：万元）
	
	/**
	 * 保证金退还时间	
	 */
	private Date REFOUND_DEPOSIT_DATE;
	
	//标书费
	/**
	 * 标书费
	 */
	private BigDecimal BID_APPLY_PRICE;

	/**
	 * 发票日期
	 */
	private Date RESERVE_DATE1;

	/**
	 * 发票号码
	 */
	private String BID_RECEIPT_NO;

	/**
	 * 到账日期
	 */
	private Date BID_VALUE_DATE;
	//标书费

	//代理费
	/**
	 * 专业公司代码
	 */
	private String PROF_NO;

	/**
	 * 专业公司名称
	 */
	private String PROF_CO_NAME;
	
	/**
	 * 中标公司号
	 */
	private Integer BID_CO_SEQ;
	
	/**
	 * 中标公司名称
	 */
	private String BID_CO_NAME;

	/**
	 * 开票日期
	 */
	private Date RECEIPT1_DATE;

	/**
	 * 发票号
	 */
	private String RECEIPT1_NO;
	
	/**
	 * 代理费/发票金额（万元）
	 */
	private BigDecimal BID_AGENT_PRICE;
	private BigDecimal BID_AGENT_PRICE_WAN;

	/**
	 * 到账日期
	 */
	private Date RECEIPT1_VALUE_DATE;
	//代理费

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

	public BigDecimal getBID_COMMISION() {
		return BID_COMMISION;
	}

	public void setBID_COMMISION(BigDecimal bID_COMMISION) {
		BID_COMMISION = bID_COMMISION;
	}

	public Integer getBID_CO_NO() {
		return BID_CO_NO;
	}

	public void setBID_CO_NO(Integer bID_CO_NO) {
		BID_CO_NO = bID_CO_NO;
	}

	public String getBID_CO_TB_NAME() {
		return BID_CO_TB_NAME;
	}

	public void setBID_CO_TB_NAME(String bID_CO_TB_NAME) {
		BID_CO_TB_NAME = bID_CO_TB_NAME;
	}

	public Date getBID_VALUE_DATE() {
		return BID_VALUE_DATE;
	}

	public void setBID_VALUE_DATE(Date bID_VALUE_DATE) {
		BID_VALUE_DATE = bID_VALUE_DATE;
	}

	public BigDecimal getAMOUNT1() {
		return AMOUNT1;
	}

	public void setAMOUNT1(BigDecimal aMOUNT1) {
		AMOUNT1 = aMOUNT1;
	}

	public BigDecimal getAMOUNT2() {
		return AMOUNT2;
	}

	public void setAMOUNT2(BigDecimal aMOUNT2) {
		AMOUNT2 = aMOUNT2;
	}

	public BigDecimal getAMOUNT3() {
		return AMOUNT3;
	}

	public void setAMOUNT3(BigDecimal aMOUNT3) {
		AMOUNT3 = aMOUNT3;
	}

	public BigDecimal getAMOUNT4() {
		return AMOUNT4;
	}

	public void setAMOUNT4(BigDecimal aMOUNT4) {
		AMOUNT4 = aMOUNT4;
	}

	public BigDecimal getAMOUNT34() {
		AMOUNT34 = new BigDecimal(0);
		if(AMOUNT3 != null) {
			AMOUNT34 = AMOUNT34.add(AMOUNT3);
		}
		if(AMOUNT4 != null) {
			AMOUNT34 = AMOUNT34.add(AMOUNT4);
		}
		return AMOUNT34;
	}

	public void setAMOUNT34(BigDecimal aMOUNT34) {
		AMOUNT34 = aMOUNT34;
	}

	public BigDecimal getAMOUNT5() {
		return AMOUNT5;
	}

	public void setAMOUNT5(BigDecimal aMOUNT5) {
		AMOUNT5 = aMOUNT5;
	}

	public BigDecimal getAMOUNT6() {
		return AMOUNT6;
	}

	public void setAMOUNT6(BigDecimal aMOUNT6) {
		AMOUNT6 = aMOUNT6;
	}

	public Date getREFOUND_DEPOSIT_DATE() {
		return REFOUND_DEPOSIT_DATE;
	}

	public void setREFOUND_DEPOSIT_DATE(Date rEFOUND_DEPOSIT_DATE) {
		REFOUND_DEPOSIT_DATE = rEFOUND_DEPOSIT_DATE;
	}

	public BigDecimal getBID_APPLY_PRICE() {
		return BID_APPLY_PRICE;
	}

	public void setBID_APPLY_PRICE(BigDecimal bID_APPLY_PRICE) {
		BID_APPLY_PRICE = bID_APPLY_PRICE;
	}

	public String getBID_RECEIPT_NO() {
		return BID_RECEIPT_NO;
	}

	public void setBID_RECEIPT_NO(String bID_RECEIPT_NO) {
		BID_RECEIPT_NO = bID_RECEIPT_NO;
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

	public Date getRECEIPT1_DATE() {
		return RECEIPT1_DATE;
	}

	public void setRECEIPT1_DATE(Date rECEIPT1_DATE) {
		RECEIPT1_DATE = rECEIPT1_DATE;
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

	public String getPROJECT_TYPE() {
		return PROJECT_TYPE;
	}

	public void setPROJECT_TYPE(String pROJECT_TYPE) {
		PROJECT_TYPE = pROJECT_TYPE;
	}

	public BigDecimal getAMOUNT1_WAN() {
		if (AMOUNT1 != null)
			AMOUNT1_WAN = AMOUNT1.divide(new BigDecimal(10000));
		return AMOUNT1_WAN;
	}

	public void setAMOUNT1_WAN(BigDecimal aMOUNT1_WAN) {
		AMOUNT1_WAN = aMOUNT1_WAN;
	}

	public BigDecimal getAMOUNT2_WAN() {
		if (AMOUNT2 != null)
			AMOUNT2_WAN = AMOUNT2.divide(new BigDecimal(10000));
		return AMOUNT2_WAN;
	}

	public void setAMOUNT2_WAN(BigDecimal aMOUNT2_WAN) {
		AMOUNT2_WAN = aMOUNT2_WAN;
	}

	public BigDecimal getAMOUNT3_WAN() {
		if (AMOUNT3 != null)
			AMOUNT3_WAN = AMOUNT3.divide(new BigDecimal(10000));
		return AMOUNT3_WAN;
	}

	public void setAMOUNT3_WAN(BigDecimal aMOUNT3_WAN) {
		AMOUNT3_WAN = aMOUNT3_WAN;
	}

	public BigDecimal getAMOUNT4_WAN() {
		if (AMOUNT4 != null)
			AMOUNT4_WAN = AMOUNT4.divide(new BigDecimal(10000));
		return AMOUNT4_WAN;
	}

	public void setAMOUNT4_WAN(BigDecimal aMOUNT4_WAN) {
		AMOUNT4_WAN = aMOUNT4_WAN;
	}

	public BigDecimal getAMOUNT34_WAN() {
		AMOUNT34 = new BigDecimal(0);
		if(AMOUNT3 != null) {
			AMOUNT34 = AMOUNT34.add(AMOUNT3);
		}
		if(AMOUNT4 != null) {
			AMOUNT34 = AMOUNT34.add(AMOUNT4);
		}
		AMOUNT34_WAN = AMOUNT34.divide(new BigDecimal(10000));
		return AMOUNT34_WAN;
	}

	public void setAMOUNT34_WAN(BigDecimal aMOUNT34_WAN) {
		AMOUNT34_WAN = aMOUNT34_WAN;
	}

	public BigDecimal getAMOUNT5_WAN() {
		if (AMOUNT5 != null)
			AMOUNT5_WAN = AMOUNT5.divide(new BigDecimal(10000));
		return AMOUNT5_WAN;
	}

	public void setAMOUNT5_WAN(BigDecimal aMOUNT5_WAN) {
		AMOUNT5_WAN = aMOUNT5_WAN;
	}

	public BigDecimal getAMOUNT6_WAN() {
		if (AMOUNT6 != null)
			AMOUNT6_WAN = AMOUNT6.divide(new BigDecimal(10000));
		return AMOUNT6_WAN;
	}

	public void setAMOUNT6_WAN(BigDecimal aMOUNT6_WAN) {
		AMOUNT6_WAN = aMOUNT6_WAN;
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

	public BigDecimal getBID_AGENT_PRICE_WAN() {
		if (BID_AGENT_PRICE != null)
			BID_AGENT_PRICE_WAN = BID_AGENT_PRICE.divide(new BigDecimal(10000));
		return BID_AGENT_PRICE_WAN;
	}

	public void setBID_AGENT_PRICE_WAN(BigDecimal bID_AGENT_PRICE_WAN) {
		BID_AGENT_PRICE_WAN = bID_AGENT_PRICE_WAN;
	}

	public BigDecimal getBID_AGENT_PRICE() {
		return BID_AGENT_PRICE;
	}

	public void setBID_AGENT_PRICE(BigDecimal bID_AGENT_PRICE) {
		BID_AGENT_PRICE = bID_AGENT_PRICE;
	}

}
