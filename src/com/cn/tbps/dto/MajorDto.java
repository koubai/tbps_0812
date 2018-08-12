package com.cn.tbps.dto;

import java.util.Date;

import com.cn.common.dto.BaseDto;

/**
 * @name 专业CODE表
 * @author Frank
 * @time 2016-7-19下午9:09:37
 * @version 1.0
 */
public class MajorDto extends BaseDto {

	private static final long serialVersionUID = 3294474538248517763L;

	/**
	 * ID
	 */
	private Integer ID;
	
	/**
	 * 专业CODE
	 */
	private String MAJORCODE;
	
	/**
	 * 专业名称
	 */
	private String MAJORNAME;
	
	/**
	 * 1为根节点，2为1的子节点，依次类推
	 */
	private Integer MAJORTYPE;
	
	/**
	 * 数据状态，1为有效
	 */
	private Integer STATUS;
	
	/**
	 * 更新者
	 */
	private String UPDATE_USER;
	
	/**
	 * 数据创建日期
	 */
	private Date INSERT_DATE;
	
	/**
	 * 数据更新日期
	 */
	private Date UPDATE_DATE;

	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public String getMAJORCODE() {
		return MAJORCODE;
	}

	public void setMAJORCODE(String mAJORCODE) {
		MAJORCODE = mAJORCODE;
	}

	public String getMAJORNAME() {
		return MAJORNAME;
	}

	public void setMAJORNAME(String mAJORNAME) {
		MAJORNAME = mAJORNAME;
	}

	public Integer getMAJORTYPE() {
		return MAJORTYPE;
	}

	public void setMAJORTYPE(Integer mAJORTYPE) {
		MAJORTYPE = mAJORTYPE;
	}

	public Integer getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(Integer sTATUS) {
		STATUS = sTATUS;
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
}
