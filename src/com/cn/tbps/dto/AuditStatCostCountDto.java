package com.cn.tbps.dto;

import java.math.BigDecimal;
import java.util.List;

import com.cn.common.dto.BaseDto;

public class AuditStatCostCountDto extends BaseDto {
	
	private static final long serialVersionUID = 9069915950284118498L;

	private BigDecimal ALL_PER_AMOUNT;
	
	private BigDecimal ALL_AMOUNT;
	
	private BigDecimal A_PER_AMOUNT;
	
	private BigDecimal A_AMOUNT;
	
	private BigDecimal B_PER_AMOUNT;
	
	private BigDecimal B_AMOUNT;
	
	private List<AuditCostCountDto> listCount;

	public BigDecimal getALL_PER_AMOUNT() {
		return ALL_PER_AMOUNT;
	}

	public void setALL_PER_AMOUNT(BigDecimal aLL_PER_AMOUNT) {
		ALL_PER_AMOUNT = aLL_PER_AMOUNT;
	}

	public BigDecimal getALL_AMOUNT() {
		return ALL_AMOUNT;
	}

	public void setALL_AMOUNT(BigDecimal aLL_AMOUNT) {
		ALL_AMOUNT = aLL_AMOUNT;
	}

	public BigDecimal getA_PER_AMOUNT() {
		return A_PER_AMOUNT;
	}

	public void setA_PER_AMOUNT(BigDecimal a_PER_AMOUNT) {
		A_PER_AMOUNT = a_PER_AMOUNT;
	}

	public BigDecimal getA_AMOUNT() {
		return A_AMOUNT;
	}

	public void setA_AMOUNT(BigDecimal a_AMOUNT) {
		A_AMOUNT = a_AMOUNT;
	}

	public BigDecimal getB_PER_AMOUNT() {
		return B_PER_AMOUNT;
	}

	public void setB_PER_AMOUNT(BigDecimal b_PER_AMOUNT) {
		B_PER_AMOUNT = b_PER_AMOUNT;
	}

	public BigDecimal getB_AMOUNT() {
		return B_AMOUNT;
	}

	public void setB_AMOUNT(BigDecimal b_AMOUNT) {
		B_AMOUNT = b_AMOUNT;
	}

	public List<AuditCostCountDto> getListCount() {
		return listCount;
	}

	public void setListCount(List<AuditCostCountDto> listCount) {
		this.listCount = listCount;
	}
}
