package com.cn.tbps.dto;

import java.util.Date;

import com.cn.common.dto.BaseDto;

/**
 * 专家信息（招标）
 * @name BidExpertDto.java
 * @author Frank
 * @time 2014-3-31下午10:02:45
 * @version 1.0
 */
public class BidExpertDto extends BaseDto {

	private static final long serialVersionUID = -2121369677519500329L;

	/**
	 * 招标编号
	 */
	private String BID_NO;
	
	/**
	 * 委托公司代码
	 */
	private String AGENT_NO;

	/**
	 * 委托公司名称
	 */
	private String AGENT_CO_NAME;
	
	/**
	 * 项目名称
	 */
	private String PROJECT_NAME;
	
	//专家信息
	/**
	 * 姓名
	 */
	private String EXPERT_NAME;

	/**
	 * 专业
	 */
	private String EXPERT_MAJOR;
	
	/**
	 * 专业（显示名）
	 */
	private String EXPERT_MAJOR_NAME;

	/**
	 * 职称
	 */
	private String EXPERT_QULI;

	/**
	 * 手机电话
	 */
	private String EXPERT_TEL1;

	/**
	 * 固话
	 */
	private String EXPERT_TEL2;

	/**
	 * 性别
	 */
	private String EXPERT_GENDER;

	/**
	 * 出生日期
	 */
	private Date EXPERT_BIRTH;

	/**
	 * 就职公司
	 */
	private String EXPERT_COMP;

	/**
	 * 备注
	 */
	private String MEMO1;
	
	public String getBID_NO() {
		return BID_NO;
	}

	public void setBID_NO(String bID_NO) {
		BID_NO = bID_NO;
	}

	public String getAGENT_NO() {
		return AGENT_NO;
	}

	public void setAGENT_NO(String aGENT_NO) {
		AGENT_NO = aGENT_NO;
	}

	public String getAGENT_CO_NAME() {
		return AGENT_CO_NAME;
	}

	public void setAGENT_CO_NAME(String aGENT_CO_NAME) {
		AGENT_CO_NAME = aGENT_CO_NAME;
	}

	public String getPROJECT_NAME() {
		return PROJECT_NAME;
	}

	public void setPROJECT_NAME(String pROJECT_NAME) {
		PROJECT_NAME = pROJECT_NAME;
	}

	public String getEXPERT_NAME() {
		return EXPERT_NAME;
	}

	public void setEXPERT_NAME(String eXPERT_NAME) {
		EXPERT_NAME = eXPERT_NAME;
	}

	public String getEXPERT_MAJOR() {
		return EXPERT_MAJOR;
	}

	public void setEXPERT_MAJOR(String eXPERT_MAJOR) {
		EXPERT_MAJOR = eXPERT_MAJOR;
	}

	public String getEXPERT_QULI() {
		return EXPERT_QULI;
	}

	public void setEXPERT_QULI(String eXPERT_QULI) {
		EXPERT_QULI = eXPERT_QULI;
	}

	public String getEXPERT_TEL1() {
		return EXPERT_TEL1;
	}

	public void setEXPERT_TEL1(String eXPERT_TEL1) {
		EXPERT_TEL1 = eXPERT_TEL1;
	}

	public String getEXPERT_TEL2() {
		return EXPERT_TEL2;
	}

	public void setEXPERT_TEL2(String eXPERT_TEL2) {
		EXPERT_TEL2 = eXPERT_TEL2;
	}

	public String getEXPERT_GENDER() {
		return EXPERT_GENDER;
	}

	public void setEXPERT_GENDER(String eXPERT_GENDER) {
		EXPERT_GENDER = eXPERT_GENDER;
	}

	public String getEXPERT_COMP() {
		return EXPERT_COMP;
	}

	public void setEXPERT_COMP(String eXPERT_COMP) {
		EXPERT_COMP = eXPERT_COMP;
	}

	public String getMEMO1() {
		return MEMO1;
	}

	public void setMEMO1(String mEMO1) {
		MEMO1 = mEMO1;
	}

	public String getEXPERT_MAJOR_NAME() {
		return EXPERT_MAJOR_NAME;
	}

	public void setEXPERT_MAJOR_NAME(String eXPERT_MAJOR_NAME) {
		EXPERT_MAJOR_NAME = eXPERT_MAJOR_NAME;
	}

	public Date getEXPERT_BIRTH() {
		return EXPERT_BIRTH;
	}

	public void setEXPERT_BIRTH(Date eXPERT_BIRTH) {
		EXPERT_BIRTH = eXPERT_BIRTH;
	}
}
