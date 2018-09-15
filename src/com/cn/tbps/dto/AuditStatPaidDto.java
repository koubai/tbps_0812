package com.cn.tbps.dto;

import java.math.BigDecimal;

import com.cn.common.dto.BaseDto;

public class AuditStatPaidDto extends BaseDto {
	
	private static final long serialVersionUID = -7240576059351253538L;

	private BigDecimal PER_AMOUNT;
	
	private String AMOUNT;
	
	private String ACT_AMOUNT;

	public BigDecimal getPER_AMOUNT() {
		return PER_AMOUNT;
	}

	public void setPER_AMOUNT(BigDecimal pER_AMOUNT) {
		PER_AMOUNT = pER_AMOUNT;
	}

	public String getAMOUNT() {
		return AMOUNT;
	}

	public void setAMOUNT(String aMOUNT) {
		AMOUNT = aMOUNT;
	}

	public String getACT_AMOUNT() {
		return ACT_AMOUNT;
	}

	public void setACT_AMOUNT(String aCT_AMOUNT) {
		ACT_AMOUNT = aCT_AMOUNT;
	}
	
}
