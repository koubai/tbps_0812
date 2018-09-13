package com.cn.tbps.dto;

import java.util.List;

import com.cn.common.dto.BaseDto;

public class AuditStatisticsCountDto extends BaseDto {
	private static final long serialVersionUID = 9069915950284118498L;

	private Integer allCount;
	
	private Integer count;
	
	private List<AuditCountDto> listCount;

	public Integer getAllCount() {
		return allCount;
	}

	public void setAllCount(Integer allCount) {
		this.allCount = allCount;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public List<AuditCountDto> getListCount() {
		return listCount;
	}

	public void setListCount(List<AuditCountDto> listCount) {
		this.listCount = listCount;
	}
}
