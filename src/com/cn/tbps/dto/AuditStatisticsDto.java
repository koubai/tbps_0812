package com.cn.tbps.dto;

import java.util.List;

import com.cn.common.dto.BaseDto;

public class AuditStatisticsDto extends BaseDto {

	private static final long serialVersionUID = -1215342672029431772L;

	/**
	 * 合同简称列表
	 */
	private List<String> listAuditCntrctNM;

	/**
	 * 审价
	 */
	private List<AuditStatisticsDetailDto> listAudit1;
	
	/**
	 * 审价合计
	 */
	private AuditStatisticsCountDto count1;
	
	/**
	 * 咨询
	 */
	private List<AuditStatisticsDetailDto> listAudit2;
	
	/**
	 * 咨询合计
	 */
	private AuditStatisticsCountDto count2;
	
	/**
	 * 控制价编制
	 */
	private List<AuditStatisticsDetailDto> listAudit4;
	
	/**
	 * 控制价编制合计
	 */
	private AuditStatisticsCountDto count4;
	
	/**
	 * 投资监理
	 */
	private List<AuditStatisticsDetailDto> listAudit5;
	
	/**
	 * 投资监理合计
	 */
	private AuditStatisticsCountDto count5;

	public List<String> getListAuditCntrctNM() {
		return listAuditCntrctNM;
	}

	public void setListAuditCntrctNM(List<String> listAuditCntrctNM) {
		this.listAuditCntrctNM = listAuditCntrctNM;
	}

	public List<AuditStatisticsDetailDto> getListAudit1() {
		return listAudit1;
	}

	public void setListAudit1(List<AuditStatisticsDetailDto> listAudit1) {
		this.listAudit1 = listAudit1;
	}

	public List<AuditStatisticsDetailDto> getListAudit2() {
		return listAudit2;
	}

	public void setListAudit2(List<AuditStatisticsDetailDto> listAudit2) {
		this.listAudit2 = listAudit2;
	}

	public List<AuditStatisticsDetailDto> getListAudit4() {
		return listAudit4;
	}

	public void setListAudit4(List<AuditStatisticsDetailDto> listAudit4) {
		this.listAudit4 = listAudit4;
	}

	public List<AuditStatisticsDetailDto> getListAudit5() {
		return listAudit5;
	}

	public void setListAudit5(List<AuditStatisticsDetailDto> listAudit5) {
		this.listAudit5 = listAudit5;
	}

	public AuditStatisticsCountDto getCount1() {
		return count1;
	}

	public void setCount1(AuditStatisticsCountDto count1) {
		this.count1 = count1;
	}

	public AuditStatisticsCountDto getCount2() {
		return count2;
	}

	public void setCount2(AuditStatisticsCountDto count2) {
		this.count2 = count2;
	}

	public AuditStatisticsCountDto getCount4() {
		return count4;
	}

	public void setCount4(AuditStatisticsCountDto count4) {
		this.count4 = count4;
	}

	public AuditStatisticsCountDto getCount5() {
		return count5;
	}

	public void setCount5(AuditStatisticsCountDto count5) {
		this.count5 = count5;
	}
}
