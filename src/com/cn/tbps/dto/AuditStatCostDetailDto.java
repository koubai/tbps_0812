package com.cn.tbps.dto;

import java.math.BigDecimal;
import java.util.List;

import com.cn.common.dto.BaseDto;

public class AuditStatCostDetailDto extends BaseDto {

	private static final long serialVersionUID = 1321385598401533322L;

	private String PROJECT_MANAGER;
	
	private BigDecimal ALL_PER_AMOUNT;
	
	private BigDecimal ALL_AMOUNT;
	
	private String CNTRCT_NM;
	
	private Integer CNTRCT_NM_COUNT;

	private BigDecimal VERIFY_PER_AMOUNT;
	
	private BigDecimal A_PER_AMOUNT;
	
	private BigDecimal A_AMOUNT;
	
	private BigDecimal B_PER_AMOUNT;
	
	private BigDecimal B_AMOUNT;
	
	private BigDecimal B_AMOUNT_RATE;
	
	private List<AuditCostCountDto> listAuditCostCount;
	
	public String getPROJECT_MANAGER() {
		return PROJECT_MANAGER;
	}
	public void setPROJECT_MANAGER(String pROJECT_MANAGER) {
		PROJECT_MANAGER = pROJECT_MANAGER;
	}
	public String getCNTRCT_NM() {
		return CNTRCT_NM;
	}
	public void setCNTRCT_NM(String cNTRCT_NM) {
		CNTRCT_NM = cNTRCT_NM;
	}
	public Integer getCNTRCT_NM_COUNT() {
		return CNTRCT_NM_COUNT;
	}
	public void setCNTRCT_NM_COUNT(Integer cNTRCT_NM_COUNT) {
		CNTRCT_NM_COUNT = cNTRCT_NM_COUNT;
	}
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
	public BigDecimal getVERIFY_PER_AMOUNT() {
		return VERIFY_PER_AMOUNT;
	}
	public void setVERIFY_PER_AMOUNT(BigDecimal vERIFY_PER_AMOUNT) {
		VERIFY_PER_AMOUNT = vERIFY_PER_AMOUNT;
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
	public BigDecimal getB_AMOUNT_RATE() {
		return B_AMOUNT_RATE;
	}
	public void setB_AMOUNT_RATE(BigDecimal b_AMOUNT_RATE) {
		B_AMOUNT_RATE = b_AMOUNT_RATE;
	}
	public List<AuditCostCountDto> getListAuditCostCount() {
		return listAuditCostCount;
	}
	public void setListAuditCostCount(List<AuditCostCountDto> listAuditCostCount) {
		this.listAuditCostCount = listAuditCostCount;
	}
}
