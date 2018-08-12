package com.cn.tbps.dto;

import java.math.BigDecimal;
import java.util.Date;

import com.cn.common.dto.BaseDto;

/**
 * 费用结算清单DTO
 * @author Frank
 * @time 2013-11-24下午10:37:59
 * @version 1.0
 */
public class SettlementDto extends BaseDto {

	private static final long serialVersionUID = 2764635280355590883L;

	/**
	 * 到账日期
	 */
	private Date BILL_DATE;
	
	/**
	 * 合计日期（yyyy年MM月）
	 */
	private String TOTAL_DATE;
	
	/**
	 * 发票日期
	 */
	private Date RECEIPT_DATE;
	
	/**
	 * 发票号码
	 */
	private String RECEIPT_NO;
	
	/**
	 * 单号（审价/招标/代扣）
	 */
	private String BILL_NO;
	
	/**
	 * 数据类型（1为代扣，2为审价，3为招标）
	 */
	private String DATA_TYPE;
	
	/**
	 * 委托单位
	 */
	private String AGENT_NO;
	
	/**
	 * 委托单位名
	 */
	private String AGENT_COMP;
	
	/**
	 * 项目名称
	 */
	private String PROJECT_NAME;
	
	/**
	 * 支付单位
	 */
	private String PAY_COMP;
	
	/**
	 * 审价
	 */
	private BigDecimal CHECK_PRICE;
	
	/**
	 * 标书费
	 */
	private BigDecimal APPLY_PRICE;
	
	/**
	 * 代理费
	 */
	private BigDecimal COMMISSION_PRICE;
	
	/**
	 * 合计
	 */
	private BigDecimal AMOUNT_PRICE;
	
	/**
	 * 税后金额
	 */
	private BigDecimal AT_PRICE;
	
	/**
	 * 代扣
	 */
	private BigDecimal WITHHOLD_PRICE;
	
	/**
	 * 月余额
	 */
	private BigDecimal REMAIN_PRICE;

	public Date getBILL_DATE() {
		return BILL_DATE;
	}

	public void setBILL_DATE(Date bILL_DATE) {
		BILL_DATE = bILL_DATE;
	}

	public Date getRECEIPT_DATE() {
		return RECEIPT_DATE;
	}

	public void setRECEIPT_DATE(Date rECEIPT_DATE) {
		RECEIPT_DATE = rECEIPT_DATE;
	}

	public String getRECEIPT_NO() {
		return RECEIPT_NO;
	}

	public void setRECEIPT_NO(String rECEIPT_NO) {
		RECEIPT_NO = rECEIPT_NO;
	}

	public String getBILL_NO() {
		return BILL_NO;
	}

	public void setBILL_NO(String bILL_NO) {
		BILL_NO = bILL_NO;
	}

	public String getAGENT_COMP() {
		return AGENT_COMP;
	}

	public void setAGENT_COMP(String aGENT_COMP) {
		AGENT_COMP = aGENT_COMP;
	}

	public String getPROJECT_NAME() {
		if("1".equals(DATA_TYPE)) {
			//代扣的项目名称=代扣分类
			if("G".equals(PROJECT_NAME)) {
				PROJECT_NAME = "工资";
			} else if("B".equals(PROJECT_NAME)) {
				PROJECT_NAME = "办公费";
			} else if("F".equals(PROJECT_NAME)) {
				PROJECT_NAME = "房租";
			} else if("D".equals(PROJECT_NAME)) {
				PROJECT_NAME = "电费";
			} else if("Q".equals(PROJECT_NAME)) {
				PROJECT_NAME = "其他";
			}
		}
		return PROJECT_NAME;
	}

	public void setPROJECT_NAME(String pROJECT_NAME) {
		PROJECT_NAME = pROJECT_NAME;
	}

	public String getPAY_COMP() {
		if("1".equals(DATA_TYPE)) {
			//代扣的支付单位固定=联合公司
			PAY_COMP = "联合公司";
		}
		return PAY_COMP;
	}

	public void setPAY_COMP(String pAY_COMP) {
		PAY_COMP = pAY_COMP;
	}

	public BigDecimal getCHECK_PRICE() {
		return CHECK_PRICE;
	}

	public void setCHECK_PRICE(BigDecimal cHECK_PRICE) {
		CHECK_PRICE = cHECK_PRICE;
	}

	public BigDecimal getAPPLY_PRICE() {
		return APPLY_PRICE;
	}

	public void setAPPLY_PRICE(BigDecimal aPPLY_PRICE) {
		APPLY_PRICE = aPPLY_PRICE;
	}

	public BigDecimal getCOMMISSION_PRICE() {
		return COMMISSION_PRICE;
	}

	public void setCOMMISSION_PRICE(BigDecimal cOMMISSION_PRICE) {
		COMMISSION_PRICE = cOMMISSION_PRICE;
	}

	public BigDecimal getAMOUNT_PRICE() {
		return AMOUNT_PRICE;
	}

	public void setAMOUNT_PRICE(BigDecimal aMOUNT_PRICE) {
		AMOUNT_PRICE = aMOUNT_PRICE;
	}

	public BigDecimal getAT_PRICE() {
		AT_PRICE = new BigDecimal(0);
		if(AT_PRICE != null) {
			AT_PRICE = AT_PRICE.setScale(2, BigDecimal.ROUND_HALF_UP);
		}
		return AT_PRICE;
	}

	public void setAT_PRICE(BigDecimal aT_PRICE) {
		AT_PRICE = aT_PRICE;
	}

	public BigDecimal getWITHHOLD_PRICE() {
		return WITHHOLD_PRICE;
	}

	public void setWITHHOLD_PRICE(BigDecimal wITHHOLD_PRICE) {
		WITHHOLD_PRICE = wITHHOLD_PRICE;
	}

	public BigDecimal getREMAIN_PRICE() {
		if(REMAIN_PRICE != null) {
			REMAIN_PRICE = REMAIN_PRICE.setScale(2, BigDecimal.ROUND_HALF_UP);
		}
		return REMAIN_PRICE;
	}

	public void setREMAIN_PRICE(BigDecimal rEMAIN_PRICE) {
		REMAIN_PRICE = rEMAIN_PRICE;
	}

	public String getDATA_TYPE() {
		return DATA_TYPE;
	}

	public void setDATA_TYPE(String dATA_TYPE) {
		DATA_TYPE = dATA_TYPE;
	}

	public String getTOTAL_DATE() {
		return TOTAL_DATE;
	}

	public void setTOTAL_DATE(String tOTAL_DATE) {
		TOTAL_DATE = tOTAL_DATE;
	}

	public String getAGENT_NO() {
		return AGENT_NO;
	}

	public void setAGENT_NO(String aGENT_NO) {
		AGENT_NO = aGENT_NO;
	}
}
