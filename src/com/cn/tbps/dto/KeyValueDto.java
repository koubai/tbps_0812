package com.cn.tbps.dto;

import com.cn.common.dto.BaseDto;

/**
 * @name KeyValueDto.java
 * @author Frank
 * @time 2014-1-21下午10:55:54
 * @version 1.0
 */
public class KeyValueDto extends BaseDto {

	private static final long serialVersionUID = -310932824102625346L;

	/**
	 * KEY
	 */
	private String key;
	
	/**
	 * VALUE
	 */
	private String value;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
