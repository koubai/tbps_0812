package com.cn.tbps.dto;

import com.cn.common.dto.BaseDto;

public class AuditListDisp extends BaseDto {
	private static final long serialVersionUID = -6184281875578665225L;

	/**
	 * 显示项目id
	 */
	private Integer id;

	/**
	 * 显示项目中文显示名字
	 */
	private String cnName;

	/**
	 * 显示项目名称
	 */
	private String enName;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCnName() {
		return cnName;
	}

	public void setCnName(String cnName) {
		this.cnName = cnName;
	}

	public String getEnName() {
		return enName;
	}

	public void setEnName(String enName) {
		this.enName = enName;
	}
}
