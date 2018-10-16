package com.cn.tbps.dto;

import java.util.Date;

import com.cn.common.dto.BaseDto;

public class MesgDto extends BaseDto {

	private static final long serialVersionUID = 5206281906143315554L;

	/**
	 * ID
	 */
	private Integer MSG_SEQ;

	/**
	 * 消息类型：10系统消息，20普通消息，30紧急消息
	 */
	private String MSG_TYPE;

	/**
	 * 消息标题
	 */
	private String MSG_TITLE;

	/**
	 * 消息内容
	 */
	private String MSG_CONTENT;

	/**
	 * 发件人账号
	 */
	private String SEND_USER;

	/**
	 * 收件人账号
	 */
	private String RECEIVE_USER;

	/**
	 * 发件状态：10新增，20已经发送，30删除
	 */
	private String SEND_STATUS;

	/**
	 * 收件状态：10未打开，20已打开，30删除
	 */
	private String RECEIVE_STATUS;

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

	public Integer getMSG_SEQ() {
		return MSG_SEQ;
	}

	public void setMSG_SEQ(Integer mSG_SEQ) {
		MSG_SEQ = mSG_SEQ;
	}

	public String getMSG_TYPE() {
		return MSG_TYPE;
	}

	public void setMSG_TYPE(String mSG_TYPE) {
		MSG_TYPE = mSG_TYPE;
	}

	public String getMSG_TITLE() {
		return MSG_TITLE;
	}

	public void setMSG_TITLE(String mSG_TITLE) {
		MSG_TITLE = mSG_TITLE;
	}

	public String getMSG_CONTENT() {
		return MSG_CONTENT;
	}

	public void setMSG_CONTENT(String mSG_CONTENT) {
		MSG_CONTENT = mSG_CONTENT;
	}

	public String getSEND_USER() {
		return SEND_USER;
	}

	public void setSEND_USER(String sEND_USER) {
		SEND_USER = sEND_USER;
	}

	public String getRECEIVE_USER() {
		return RECEIVE_USER;
	}

	public void setRECEIVE_USER(String rECEIVE_USER) {
		RECEIVE_USER = rECEIVE_USER;
	}

	public String getSEND_STATUS() {
		return SEND_STATUS;
	}

	public void setSEND_STATUS(String sEND_STATUS) {
		SEND_STATUS = sEND_STATUS;
	}

	public String getRECEIVE_STATUS() {
		return RECEIVE_STATUS;
	}

	public void setRECEIVE_STATUS(String rECEIVE_STATUS) {
		RECEIVE_STATUS = rECEIVE_STATUS;
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
