package com.cn.tbps.dto;

import java.util.Date;

import com.cn.common.dto.BaseDto;

/**
 * 会审监管人
 * @version 1.0
 * @createtime 2018年9月22日 上午9:51:20
 */
public class SuperviseLibDto extends BaseDto {

	private static final long serialVersionUID = -2121369677519500329L;

	/**
	 * 序号
	 */
	private Integer SUPERVISE_SEQ;

	/**
	 * 姓名
	 */
	private String SUPERVISE_NAME;
	
	/**
	 * 手机电话
	 */
	private String SUPERVISE_TEL1;

	/**
	 * 固话
	 */
	private String SUPERVISE_TEL2;

	/**
	 * 性别
	 */
	private String SUPERVISE_GENDER;

	/**
	 * 出生日期
	 */
	private Date SUPERVISE_BIRTH;

	/**
	 * 就职公司
	 */
	private String SUPERVISE_COMP;

	/**
	 * 备注
	 */
	private String MEMO1;

	/**
	 * 删除
	 */
	private String DELETE_FLG;

	/**
	 * 更新者
	 */
	private String UPDATE_USER;

	/**
	 * 新建日期
	 */
	private Date INSERT_DATE;

	/**
	 * 更新日期
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

	public Integer getSUPERVISE_SEQ() {
		return SUPERVISE_SEQ;
	}

	public void setSUPERVISE_SEQ(Integer sUPERVISE_SEQ) {
		SUPERVISE_SEQ = sUPERVISE_SEQ;
	}

	public String getSUPERVISE_NAME() {
		return SUPERVISE_NAME;
	}

	public void setSUPERVISE_NAME(String sUPERVISE_NAME) {
		SUPERVISE_NAME = sUPERVISE_NAME;
	}

	public String getSUPERVISE_TEL1() {
		return SUPERVISE_TEL1;
	}

	public void setSUPERVISE_TEL1(String sUPERVISE_TEL1) {
		SUPERVISE_TEL1 = sUPERVISE_TEL1;
	}

	public String getSUPERVISE_TEL2() {
		return SUPERVISE_TEL2;
	}

	public void setSUPERVISE_TEL2(String sUPERVISE_TEL2) {
		SUPERVISE_TEL2 = sUPERVISE_TEL2;
	}

	public String getSUPERVISE_GENDER() {
		return SUPERVISE_GENDER;
	}

	public void setSUPERVISE_GENDER(String sUPERVISE_GENDER) {
		SUPERVISE_GENDER = sUPERVISE_GENDER;
	}

	public Date getSUPERVISE_BIRTH() {
		return SUPERVISE_BIRTH;
	}

	public void setSUPERVISE_BIRTH(Date sUPERVISE_BIRTH) {
		SUPERVISE_BIRTH = sUPERVISE_BIRTH;
	}

	public String getSUPERVISE_COMP() {
		return SUPERVISE_COMP;
	}

	public void setSUPERVISE_COMP(String sUPERVISE_COMP) {
		SUPERVISE_COMP = sUPERVISE_COMP;
	}

	public String getMEMO1() {
		return MEMO1;
	}

	public void setMEMO1(String mEMO1) {
		MEMO1 = mEMO1;
	}

	public String getDELETE_FLG() {
		return DELETE_FLG;
	}

	public void setDELETE_FLG(String dELETE_FLG) {
		DELETE_FLG = dELETE_FLG;
	}

	public String getUPDATE_USER() {
		return UPDATE_USER;
	}

	public void setUPDATE_USER(String uPDATE_USER) {
		UPDATE_USER = uPDATE_USER;
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
