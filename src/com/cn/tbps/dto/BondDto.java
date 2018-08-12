package com.cn.tbps.dto;

import java.math.BigDecimal;
import java.util.Date;

import com.cn.common.dto.BaseDto;

/**
 * 保证金
 * @name BondDto.java
 * @author Frank
 * @time 2014-2-20上午12:07:53
 * @version 1.0
 */
public class BondDto extends BaseDto {

	private static final long serialVersionUID = 126036541785781418L;

	/**
	 * 委托公司代码
	 */
	private String AGENT_NO;

	/**
	 * 委托公司名称
	 */
	private String AGENT_CO_NAME;
	
	/**
	 * 数据类型（1为招标，2为审价，3为合计）
	 */
	private String DATA_TYPE;
	
	/**
	 * 单据编号（审价和招标）
	 */
	private String BILL_NO;
	
	/**
	 * 单据名称（审价和招标）
	 */
	private String BILL_NAME;
	
	/**
	 * 支付形式=1金额（现金）
	 */
	private BigDecimal AMOUNT1;
	
	/**
	 * 支付形式=2金额（支票）
	 */
	private BigDecimal AMOUNT2;
	
	/**
	 * 支付形式=3金额（转账）
	 */
	private BigDecimal AMOUNT3;
	
	/**
	 * 支付形式=4金额（汇票）
	 */
	private BigDecimal AMOUNT4;
	
	/**
	 * 支付形式=3和4合计金额
	 */
	private BigDecimal AMOUNT34;
	
	/**
	 * 支付形式=5（保函）
	 */
	private BigDecimal AMOUNT5;
	
	/**
	 * 支付形式=6（现金2）
	 */
	private BigDecimal AMOUNT6;
	
	/**
	 * 汇总
	 */
	private BigDecimal TOTAL;
	
	/**
	 * 已退
	 */
	private BigDecimal REFUND;
	
	/**
	 * 代理费
	 */
	private BigDecimal AGENT_FEE;
	
	/**
	 * 专家费
	 */
	private BigDecimal EXPERT_FEE;
	
	/**
	 * 评标费
	 */
	private BigDecimal BID_COMMISION;
	
	/**
	 * 备注
	 */
	private String MEMO;

	/**
	 * 日期2 (投标文件)
	 */
	private Date RESERVE_DATE2;

	/**
	 * 日期3(招标文件)
	 */
	private Date RESERVE_DATE3;

	/**
	 * 日期4(评标报告/存档资料)
	 */
	private Date RESERVE_DATE4;

	/**
	 * 日期5(其他)
	 */
	private Date RESERVE_DATE5;


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

	public String getBILL_NO() {
		return BILL_NO;
	}

	public void setBILL_NO(String bILL_NO) {
		BILL_NO = bILL_NO;
	}

	public String getBILL_NAME() {
		return BILL_NAME;
	}

	public void setBILL_NAME(String bILL_NAME) {
		BILL_NAME = bILL_NAME;
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

	public BigDecimal getTOTAL() {
		return TOTAL;
	}

	public void setTOTAL(BigDecimal tOTAL) {
		TOTAL = tOTAL;
	}

	public BigDecimal getAGENT_FEE() {
		return AGENT_FEE;
	}

	public void setAGENT_FEE(BigDecimal aGENT_FEE) {
		AGENT_FEE = aGENT_FEE;
	}

	public BigDecimal getEXPERT_FEE() {
		return EXPERT_FEE;
	}

	public void setEXPERT_FEE(BigDecimal eXPERT_FEE) {
		EXPERT_FEE = eXPERT_FEE;
	}

	public String getMEMO() {
		return MEMO;
	}

	public void setMEMO(String mEMO) {
		MEMO = mEMO;
	}

	public BigDecimal getREFUND() {
		return REFUND;
	}

	public void setREFUND(BigDecimal rEFUND) {
		REFUND = rEFUND;
	}

	public String getDATA_TYPE() {
		return DATA_TYPE;
	}

	public void setDATA_TYPE(String dATA_TYPE) {
		DATA_TYPE = dATA_TYPE;
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

	public BigDecimal getBID_COMMISION() {
		return BID_COMMISION;
	}

	public void setBID_COMMISION(BigDecimal bID_COMMISION) {
		BID_COMMISION = bID_COMMISION;
	}

	public Date getRESERVE_DATE2() {
		return RESERVE_DATE2;
	}

	public void setRESERVE_DATE2(Date rESERVE_DATE2) {
		RESERVE_DATE2 = rESERVE_DATE2;
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
}
