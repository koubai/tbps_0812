package com.cn.tbps.dto;

import java.util.List;

import com.cn.common.dto.BaseDto;

public class AuditStatisticsDetailDto extends BaseDto {

	private static final long serialVersionUID = 6638699386899999360L;
	
	private String PROJECT_MANAGER;
	
	private String DOC_REC_DATE;
	
	private String MONTH_ALL_COUNT;
	
	private String CNTRCT_NM;
	
	private Integer CNTRCT_NM_COUNT;
	
	private List<AuditCountDto> listAuditCount;
	
	public String getPROJECT_MANAGER() {
		return PROJECT_MANAGER;
	}
	public void setPROJECT_MANAGER(String pROJECT_MANAGER) {
		PROJECT_MANAGER = pROJECT_MANAGER;
	}
	public String getDOC_REC_DATE() {
		return DOC_REC_DATE;
	}
	public void setDOC_REC_DATE(String dOC_REC_DATE) {
		DOC_REC_DATE = dOC_REC_DATE;
	}
	public String getMONTH_ALL_COUNT() {
		return MONTH_ALL_COUNT;
	}
	public void setMONTH_ALL_COUNT(String mONTH_ALL_COUNT) {
		MONTH_ALL_COUNT = mONTH_ALL_COUNT;
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
	public List<AuditCountDto> getListAuditCount() {
		return listAuditCount;
	}
	public void setListAuditCount(List<AuditCountDto> listAuditCount) {
		this.listAuditCount = listAuditCount;
	}
}
