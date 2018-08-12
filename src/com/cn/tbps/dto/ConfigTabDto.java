package com.cn.tbps.dto;

import java.util.Date;

import com.cn.common.dto.BaseDto;

/**
 * @name ConfigTabDto.java
 * @author Frank
 * @time 2014-1-19下午3:16:23
 * @version 1.0
 */
public class ConfigTabDto extends BaseDto {

	private static final long serialVersionUID = -1311473064088859013L;

	/**
	 * 主键
	 */
	private Integer ID;
	
	/**
	 * 配置数据类型
	 */
	private String CONFIG_TYPE;
	
	/**
	 * KEY，逻辑主键
	 */
	private String CONFIG_KEY;
	
	/**
	 * 对应KEY的值
	 */
	private String CONFIG_VAL;
	
	/**
	 * 创建时间
	 */
	private Date INSERT_DATE;
	
	/**
	 * 更新时间
	 */
	private Date UPDATE_DATE;
	
	/**
	 * 备用1
	 */
	private String RESERVE1;

	/**
	 * 备用2
	 */
	private String RESERVE2;

	/**
	 * 备用3
	 */
	private String RESERVE3;

	/**
	 * 备用4
	 */
	private String RESERVE4;

	/**
	 * 备用5
	 */
	private String RESERVE5;

	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public String getCONFIG_TYPE() {
		return CONFIG_TYPE;
	}

	public void setCONFIG_TYPE(String cONFIG_TYPE) {
		CONFIG_TYPE = cONFIG_TYPE;
	}

	public String getCONFIG_KEY() {
		return CONFIG_KEY;
	}

	public void setCONFIG_KEY(String cONFIG_KEY) {
		CONFIG_KEY = cONFIG_KEY;
	}

	public String getCONFIG_VAL() {
		return CONFIG_VAL;
	}

	public void setCONFIG_VAL(String cONFIG_VAL) {
		CONFIG_VAL = cONFIG_VAL;
	}

	public Date getINSERT_DATE() {
		return INSERT_DATE;
	}

	public void setINSERT_DATE(Date iNSERT_DATE) {
		INSERT_DATE = iNSERT_DATE;
	}

	public Date getUPDATE_DATE() {
		return UPDATE_DATE;
	}

	public void setUPDATE_DATE(Date uPDATE_DATE) {
		UPDATE_DATE = uPDATE_DATE;
	}

	public String getRESERVE1() {
		return RESERVE1;
	}

	public void setRESERVE1(String rESERVE1) {
		RESERVE1 = rESERVE1;
	}

	public String getRESERVE2() {
		return RESERVE2;
	}

	public void setRESERVE2(String rESERVE2) {
		RESERVE2 = rESERVE2;
	}

	public String getRESERVE3() {
		return RESERVE3;
	}

	public void setRESERVE3(String rESERVE3) {
		RESERVE3 = rESERVE3;
	}

	public String getRESERVE4() {
		return RESERVE4;
	}

	public void setRESERVE4(String rESERVE4) {
		RESERVE4 = rESERVE4;
	}

	public String getRESERVE5() {
		return RESERVE5;
	}

	public void setRESERVE5(String rESERVE5) {
		RESERVE5 = rESERVE5;
	}
}
