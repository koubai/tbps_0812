package com.cn.tbps.dto;

import com.cn.common.dto.BaseDto;

public class AuditCountDto extends BaseDto {
	private static final long serialVersionUID = -5294625702193861198L;
	
	private String CNTRCT_NM;
	
	private Integer CNTRCT_NM_COUNT;
	
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
}
