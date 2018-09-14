package com.cn.tbps.dto;

import java.util.List;

import com.cn.common.dto.BaseDto;

public class AuditStatCostDto extends BaseDto {

	private static final long serialVersionUID = -8421593431414541958L;

	/**
	 * 合同简称列表
	 */
	private List<String> listAuditCntrctNM;

	/**
	 * 审价
	 */
	private List<AuditStatCostDetailDto> listAudit1;
	
	/**
	 * 咨询
	 */
	private List<AuditStatCostDetailDto> listAudit2;
	
	/**
	 * 控制价编制
	 */
	private List<AuditStatCostDetailDto> listAudit4;
	
	/**
	 * 投资监理
	 */
	private List<AuditStatCostDetailDto> listAudit5;
	
	/**
	 * 合计
	 */
	private AuditStatCostCountDto count;

	public List<String> getListAuditCntrctNM() {
		return listAuditCntrctNM;
	}

	public void setListAuditCntrctNM(List<String> listAuditCntrctNM) {
		this.listAuditCntrctNM = listAuditCntrctNM;
	}

	public List<AuditStatCostDetailDto> getListAudit1() {
		return listAudit1;
	}

	public void setListAudit1(List<AuditStatCostDetailDto> listAudit1) {
		this.listAudit1 = listAudit1;
	}

	public List<AuditStatCostDetailDto> getListAudit2() {
		return listAudit2;
	}

	public void setListAudit2(List<AuditStatCostDetailDto> listAudit2) {
		this.listAudit2 = listAudit2;
	}

	public List<AuditStatCostDetailDto> getListAudit4() {
		return listAudit4;
	}

	public void setListAudit4(List<AuditStatCostDetailDto> listAudit4) {
		this.listAudit4 = listAudit4;
	}

	public List<AuditStatCostDetailDto> getListAudit5() {
		return listAudit5;
	}

	public void setListAudit5(List<AuditStatCostDetailDto> listAudit5) {
		this.listAudit5 = listAudit5;
	}

	public AuditStatCostCountDto getCount() {
		return count;
	}

	public void setCount(AuditStatCostCountDto count) {
		this.count = count;
	}
}
