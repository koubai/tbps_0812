package com.cn.tbps.dto;

import com.cn.common.dto.BaseDto;

/**
 * @name BidCompApplyDto.java
 * @author Frank
 * @time 2016-5-25下午10:15:25
 * @version 1.0
 */
public class BidCompApplyDto extends BaseDto {

	private static final long serialVersionUID = 1086113592339867465L;

	/**
	 * ID
	 */
	private Integer ID;
	
	/**
	 * 投标编号
	 */
	private String BID_NO;

	/**
	 * 投标公司ID
	 */
	private Integer BID_CO_NO;

	/**
	 * 排序
	 */
	private Integer APPLY_SORT;

	/**
	 * 报名要求
	 */
	private String APPLY_REQUIRE;

	/**
	 * 报名内容
	 */
	private String APPLY_NOTE;
	
	/**
	 * 数据状态
	 */
	private Integer STATUS;

	/**
	 * 备用1
	 */
	private String RESERVE1;

	/**
	 * 备用2
	 */
	private String RESERVE2;

	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public Integer getBID_CO_NO() {
		return BID_CO_NO;
	}

	public void setBID_CO_NO(Integer bID_CO_NO) {
		BID_CO_NO = bID_CO_NO;
	}

	public Integer getAPPLY_SORT() {
		return APPLY_SORT;
	}

	public void setAPPLY_SORT(Integer aPPLY_SORT) {
		APPLY_SORT = aPPLY_SORT;
	}

	public String getAPPLY_REQUIRE() {
		return APPLY_REQUIRE;
	}

	public void setAPPLY_REQUIRE(String aPPLY_REQUIRE) {
		APPLY_REQUIRE = aPPLY_REQUIRE;
	}

	public String getAPPLY_NOTE() {
		return APPLY_NOTE;
	}

	public void setAPPLY_NOTE(String aPPLY_NOTE) {
		APPLY_NOTE = aPPLY_NOTE;
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

	public Integer getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(Integer sTATUS) {
		STATUS = sTATUS;
	}

	public String getBID_NO() {
		return BID_NO;
	}

	public void setBID_NO(String bID_NO) {
		BID_NO = bID_NO;
	}
}
