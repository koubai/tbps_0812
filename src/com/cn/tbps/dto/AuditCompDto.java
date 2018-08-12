package com.cn.tbps.dto;

import java.util.Date;
import com.cn.common.dto.BaseDto;

/**
 * 合同
 * @author Pei
 * @time 2016-06-19上午1:06:36
 * @version 1.0
 */
public class AuditCompDto extends BaseDto {

	private static final long serialVersionUID = 3273669609937279890L;

	/**
	 * 公司号
	 */
	private String AUDIT_COMP_NO;

	/**
	 * 合同名称
	 */
	private String AUDIT_COMP_NAME;

	/**
	 * 合同甲方
	 */
	private String AUDIT_COMP_CLIENT;
	
	/**
	 * 合同甲方ID
	 */
	private String AUDIT_COMP_CLIENTID;

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
	
	/**
	 * 开票信息
	 */
	private String TAX_NO;

	
	public String getAUDIT_COMP_NO() {
		return AUDIT_COMP_NO;
	}

	public void setAUDIT_COMP_NO(String aUDIT_COMP_NO) {
		AUDIT_COMP_NO = aUDIT_COMP_NO;
	}

	public String getAUDIT_COMP_NAME() {
		return AUDIT_COMP_NAME;
	}

	public void setAUDIT_COMP_NAME(String aUDIT_COMP_NAME) {
		AUDIT_COMP_NAME = aUDIT_COMP_NAME;
	}

	public String getAUDIT_COMP_CLIENT() {
		return AUDIT_COMP_CLIENT;
	}

	public void setAUDIT_COMP_CLIENT(String aUDIT_COMP_CLIENT) {
		AUDIT_COMP_CLIENT = aUDIT_COMP_CLIENT;
	}

	public String getAUDIT_COMP_CLIENTID() {
		return AUDIT_COMP_CLIENTID;
	}

	public void setAUDIT_COMP_CLIENTID(String aUDIT_COMP_CLIENTID) {
		AUDIT_COMP_CLIENTID = aUDIT_COMP_CLIENTID;
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

	public String getTAX_NO() {
		return TAX_NO;
	}

	public void setTAX_NO(String tAX_NO) {
		TAX_NO = tAX_NO;
	}

}
