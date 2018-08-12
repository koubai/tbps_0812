package com.cn.tbps.dto;

import java.math.BigDecimal;
import java.util.Date;

import com.cn.common.dto.BaseDto;

/**
 * 代扣
 * @author Frank
 * @time 2013-10-14上午1:13:36
 * @version 1.0
 */
public class WithholdDto extends BaseDto {
	
	private static final long serialVersionUID = -5473334413749421673L;

	/**
	 * 代扣编号
	 */
	private String WITHHOLD_NO;

	/**
	 * 代扣分类（G：工资B：办公费F:房租D:电费Q:其他）
	 */
	private String WITHHOLD_TYPE;

	/**
	 * 代扣日期
	 */
	private Date WITHHOLD_DATE;

	/**
	 * 代扣金额
	 */
	private BigDecimal WITHHOLD_AMOUNT;

	/**
	 * 用途
	 */
	private String WITHHOLD_REASON;

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

	public String getWITHHOLD_NO() {
		return WITHHOLD_NO;
	}

	public void setWITHHOLD_NO(String wITHHOLD_NO) {
		WITHHOLD_NO = wITHHOLD_NO;
	}

	public String getWITHHOLD_TYPE() {
		return WITHHOLD_TYPE;
	}

	public void setWITHHOLD_TYPE(String wITHHOLD_TYPE) {
		WITHHOLD_TYPE = wITHHOLD_TYPE;
	}

	public Date getWITHHOLD_DATE() {
		return WITHHOLD_DATE;
	}

	public void setWITHHOLD_DATE(Date wITHHOLD_DATE) {
		WITHHOLD_DATE = wITHHOLD_DATE;
	}

	public BigDecimal getWITHHOLD_AMOUNT() {
		return WITHHOLD_AMOUNT;
	}

	public void setWITHHOLD_AMOUNT(BigDecimal wITHHOLD_AMOUNT) {
		WITHHOLD_AMOUNT = wITHHOLD_AMOUNT;
	}

	public String getWITHHOLD_REASON() {
		return WITHHOLD_REASON;
	}

	public void setWITHHOLD_REASON(String wITHHOLD_REASON) {
		WITHHOLD_REASON = wITHHOLD_REASON;
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
