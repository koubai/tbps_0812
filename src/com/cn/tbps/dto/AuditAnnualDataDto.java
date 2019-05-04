package com.cn.tbps.dto;

import java.math.BigDecimal;

import com.cn.common.dto.BaseDto;

/**
 * 审价年度统计数据.java
 * @version 1.0
 * @createtime 2019年5月3日 上午9:35:07
 */
public class AuditAnnualDataDto extends BaseDto {

	private static final long serialVersionUID = 4638462936095436319L;

	/**
	 * 时间
	 */
	private String showtime = "";
	
	/**
	 * 收到审价（个）
	 */
	private Integer receiveAudit = 0;
	
	/**
	 * 完成审价本月（个）
	 */
	private Integer completeAuditCurrentMonth = 0;
	
	/**
	 * 完成审价历史（个）
	 */
	private Integer completeAuditHis = 0;
	
	/**
	 * 总金额本月送审（元）
	 */
	private BigDecimal submitAuditAmount = new BigDecimal(0);
	
	/**
	 * 总金额本月完成送审（元）
	 */
	private BigDecimal completeAuditAmount = new BigDecimal(0);
	
	/**
	 * 审定总额（元）
	 */
	private BigDecimal authorizeAuditAmount = new BigDecimal(0);
	
	/**
	 * 未完成审价本月（个）
	 */
	private Integer incompleteAuditCurrentMonth = 0;
	
	/**
	 * 未完成审价历史（个）
	 */
	private Integer incompleteAuditHis = 0;
	
	/**
	 * 复核项目（个）
	 */
	private Integer reviewAudit = 0;
	
	/**
	 * 审价费本月确认应收（元）
	 */
	private BigDecimal auditAmountMonthConfirm = new BigDecimal(0);
	
	/**
	 * 审价费本月未确认（元）
	 */
	private BigDecimal auditAmountMonthUnconfirmed = new BigDecimal(0);
	
	/**
	 * 审价费本月未确认后确认（元）
	 */
	private BigDecimal auditAmountMonthConfirming = new BigDecimal(0);
	
	/**
	 * 实收审价费本月发票（张）
	 */
	private Integer receiptAuditPieceMonth = 0;
	
	/**
	 * 实收审价费本月（元）
	 */
	private BigDecimal receiptAuditAmountMonth = new BigDecimal(0);
	
	/**
	 * 实收审价费历史（张）
	 */
	private Integer receiptAuditPieceHis = 0;
	
	/**
	 * 实收审价费历史（元）
	 */
	private BigDecimal receiptAuditAmountHis = new BigDecimal(0);
	
	/**
	 * 本月总发票（张）
	 */
	private Integer totalNumMonth = 0;
	
	/**
	 * 本月总发票（元）
	 */
	private BigDecimal totalAmountMonth = new BigDecimal(0);
	
	/**
	 * 本月未收（张）
	 */
	private Integer unreceivedNumMonth = 0;
	
	/**
	 * 本月未收（元）
	 */
	private BigDecimal unreceivedAmountMonth = new BigDecimal(0);
	
	/**
	 * 历史未收发票（张）
	 */
	private Integer unreceivedNumHis = 0;
	
	/**
	 * 历史未收发票（元）
	 */
	private BigDecimal unreceivedAmountHis = new BigDecimal(0);

	public String getShowtime() {
		return showtime;
	}

	public void setShowtime(String showtime) {
		this.showtime = showtime;
	}

	public Integer getReceiveAudit() {
		return receiveAudit;
	}

	public void setReceiveAudit(Integer receiveAudit) {
		this.receiveAudit = receiveAudit;
	}

	public Integer getCompleteAuditCurrentMonth() {
		return completeAuditCurrentMonth;
	}

	public void setCompleteAuditCurrentMonth(Integer completeAuditCurrentMonth) {
		this.completeAuditCurrentMonth = completeAuditCurrentMonth;
	}

	public Integer getCompleteAuditHis() {
		return completeAuditHis;
	}

	public void setCompleteAuditHis(Integer completeAuditHis) {
		this.completeAuditHis = completeAuditHis;
	}

	public BigDecimal getSubmitAuditAmount() {
		return submitAuditAmount;
	}

	public void setSubmitAuditAmount(BigDecimal submitAuditAmount) {
		this.submitAuditAmount = submitAuditAmount;
	}

	public BigDecimal getCompleteAuditAmount() {
		return completeAuditAmount;
	}

	public void setCompleteAuditAmount(BigDecimal completeAuditAmount) {
		this.completeAuditAmount = completeAuditAmount;
	}

	public BigDecimal getAuthorizeAuditAmount() {
		return authorizeAuditAmount;
	}

	public void setAuthorizeAuditAmount(BigDecimal authorizeAuditAmount) {
		this.authorizeAuditAmount = authorizeAuditAmount;
	}

	public Integer getIncompleteAuditCurrentMonth() {
		return incompleteAuditCurrentMonth;
	}

	public void setIncompleteAuditCurrentMonth(Integer incompleteAuditCurrentMonth) {
		this.incompleteAuditCurrentMonth = incompleteAuditCurrentMonth;
	}

	public Integer getIncompleteAuditHis() {
		return incompleteAuditHis;
	}

	public void setIncompleteAuditHis(Integer incompleteAuditHis) {
		this.incompleteAuditHis = incompleteAuditHis;
	}

	public Integer getReviewAudit() {
		return reviewAudit;
	}

	public void setReviewAudit(Integer reviewAudit) {
		this.reviewAudit = reviewAudit;
	}

	public BigDecimal getAuditAmountMonthConfirm() {
		return auditAmountMonthConfirm;
	}

	public void setAuditAmountMonthConfirm(BigDecimal auditAmountMonthConfirm) {
		this.auditAmountMonthConfirm = auditAmountMonthConfirm;
	}

	public BigDecimal getAuditAmountMonthUnconfirmed() {
		return auditAmountMonthUnconfirmed;
	}

	public void setAuditAmountMonthUnconfirmed(BigDecimal auditAmountMonthUnconfirmed) {
		this.auditAmountMonthUnconfirmed = auditAmountMonthUnconfirmed;
	}

	public BigDecimal getAuditAmountMonthConfirming() {
		return auditAmountMonthConfirming;
	}

	public void setAuditAmountMonthConfirming(BigDecimal auditAmountMonthConfirming) {
		this.auditAmountMonthConfirming = auditAmountMonthConfirming;
	}

	public Integer getReceiptAuditPieceMonth() {
		return receiptAuditPieceMonth;
	}

	public void setReceiptAuditPieceMonth(Integer receiptAuditPieceMonth) {
		this.receiptAuditPieceMonth = receiptAuditPieceMonth;
	}

	public BigDecimal getReceiptAuditAmountMonth() {
		return receiptAuditAmountMonth;
	}

	public void setReceiptAuditAmountMonth(BigDecimal receiptAuditAmountMonth) {
		this.receiptAuditAmountMonth = receiptAuditAmountMonth;
	}

	public Integer getReceiptAuditPieceHis() {
		return receiptAuditPieceHis;
	}

	public void setReceiptAuditPieceHis(Integer receiptAuditPieceHis) {
		this.receiptAuditPieceHis = receiptAuditPieceHis;
	}

	public BigDecimal getReceiptAuditAmountHis() {
		return receiptAuditAmountHis;
	}

	public void setReceiptAuditAmountHis(BigDecimal receiptAuditAmountHis) {
		this.receiptAuditAmountHis = receiptAuditAmountHis;
	}

	public Integer getTotalNumMonth() {
		return totalNumMonth;
	}

	public void setTotalNumMonth(Integer totalNumMonth) {
		this.totalNumMonth = totalNumMonth;
	}

	public BigDecimal getTotalAmountMonth() {
		return totalAmountMonth;
	}

	public void setTotalAmountMonth(BigDecimal totalAmountMonth) {
		this.totalAmountMonth = totalAmountMonth;
	}

	public Integer getUnreceivedNumMonth() {
		return unreceivedNumMonth;
	}

	public void setUnreceivedNumMonth(Integer unreceivedNumMonth) {
		this.unreceivedNumMonth = unreceivedNumMonth;
	}

	public BigDecimal getUnreceivedAmountMonth() {
		return unreceivedAmountMonth;
	}

	public void setUnreceivedAmountMonth(BigDecimal unreceivedAmountMonth) {
		this.unreceivedAmountMonth = unreceivedAmountMonth;
	}

	public Integer getUnreceivedNumHis() {
		return unreceivedNumHis;
	}

	public void setUnreceivedNumHis(Integer unreceivedNumHis) {
		this.unreceivedNumHis = unreceivedNumHis;
	}

	public BigDecimal getUnreceivedAmountHis() {
		return unreceivedAmountHis;
	}

	public void setUnreceivedAmountHis(BigDecimal unreceivedAmountHis) {
		this.unreceivedAmountHis = unreceivedAmountHis;
	}
}
