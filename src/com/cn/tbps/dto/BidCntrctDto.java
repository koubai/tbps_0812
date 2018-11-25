package com.cn.tbps.dto;

import java.math.BigDecimal;
import java.util.Date;

import com.cn.common.dto.BaseDto;
import com.cn.common.util.DateUtil;

public class BidCntrctDto extends BaseDto {
	
	private static final long serialVersionUID = 1471422302029654562L;

	/**
	 * 合同编号
	 */
	private String CNTRCT_NO;

	/**
	 * 合同年份
	 */
	private String CNTRCT_YEAR;

	/**
	 * 合同名称
	 */
	private String CNTRCT_NAME;

	/**
	 * 合同简称
	 */
	private String CNTRCT_NM;

	/**
	 * 合同类别
	 * 1：招标，4：竞价，5：电子招标，6：核价竞价，7：公开竞价，9：其他
	 */
	private String CNTRCT_TYPE;
	
	//项目总数量
	private int totalProject;
	//完成项目数量
	private int finishProject;
	//进行中项目数量
	private int buildingProject;
	//失败项目数量
	private int failProject;
	//标书费
	private BigDecimal bidAmount;
	//专家费
	private BigDecimal expertAmount;
	//应收代理费
	private BigDecimal BID_AGENT_PRICE;
	//实收代理费
	private BigDecimal BID_AGENT_PRICE_ACT;
	
	/**
	 * 委托单位ID
	 */
	private String BID_COMP_NO;

	/**
	 * 委托单位
	 */
	private String BID_COMP_NAME;

	/**
	 * 联系人
	 */
	private String CO_MANAGER1;

	/**
	 * 联系方式(电话)
	 */
	private String CO_MANAGER_TEL1;

	/**
	 * 联系方式(地址)
	 */
	private String CO_ADDRESS1;

	/**
	 * 联系人邮箱
	 */
	private String CO_MANAGER_EMAIL1;

	/**
	 * 开票信息
	 */
	private String CO_TAX;

	/**
	 * 合同开始时间
	 */
	private Date CNTRCT_ST_DATE;
	private String showCNTRCT_ST_DATE;

	/**
	 * 合同结束时间
	 */
	private Date CNTRCT_ED_DATE;
	private String showCNTRCT_ED_DATE;

	/**
	 * 委托内容费率1(审价)
	 */
	private BigDecimal CNTRCT_RATE_1;

	/**
	 * 委托内容费率2(咨询)
	 */
	private BigDecimal CNTRCT_RATE_2;

	/**
	 * 委托内容费率3(清单编制)
	 */
	private BigDecimal CNTRCT_RATE_3;

	/**
	 * 委托内容费率4(控制价编制)
	 */
	private BigDecimal CNTRCT_RATE_4;

	/**
	 * 委托内容费率5(全过程投资监理)
	 */
	private BigDecimal CNTRCT_RATE_5;

	/**
	 * 委托内容费率6
	 */
	private BigDecimal CNTRCT_RATE_6;

	/**
	 * 委托内容费率7
	 */
	private BigDecimal CNTRCT_RATE_7;

	/**
	 * 委托内容费率8
	 */
	private BigDecimal CNTRCT_RATE_8;

	/**
	 * 委托内容费率9
	 */
	private BigDecimal CNTRCT_RATE_9;

	/**
	 * 委托内容费率10
	 */
	private BigDecimal CNTRCT_RATE_10;

	/**
	 * 委托内容金额1(审价)
	 */
	private BigDecimal CNTRCT_AMOUNT_1;

	/**
	 * 委托内容金额2(咨询)
	 */
	private BigDecimal CNTRCT_AMOUNT_2;

	/**
	 * 委托内容金额3(清单编制)
	 */
	private BigDecimal CNTRCT_AMOUNT_3;

	/**
	 * 委托内容金额4(控制价编制)
	 */
	private BigDecimal CNTRCT_AMOUNT_4;

	/**
	 * 委托内容金额5(全过程投资监理)
	 */
	private BigDecimal CNTRCT_AMOUNT_5;

	/**
	 * 委托内容金额6
	 */
	private BigDecimal CNTRCT_AMOUNT_6;

	/**
	 * 委托内容金额7
	 */
	private BigDecimal CNTRCT_AMOUNT_7;

	/**
	 * 委托内容金额8
	 */
	private BigDecimal CNTRCT_AMOUNT_8;

	/**
	 * 委托内容金额9
	 */
	private BigDecimal CNTRCT_AMOUNT_9;

	/**
	 * 委托内容金额10
	 */
	private BigDecimal CNTRCT_AMOUNT_10;

	/**
	 * 委托方收费
	 */
	private BigDecimal CNTRCT_TOTAL_AMOUNT;

	/**
	 * 合同金额
	 */
	private BigDecimal CNTRCT_ALL_AMOUNT;

	/**
	 * 未收金额
	 */
	private BigDecimal CNTRCT_UNPAY_AMOUNT;

	/**
	 * 差旅合计
	 */
	private BigDecimal TRIP_TOTAL_AMOUNT;

	/**
	 * 总概算
	 */
	private BigDecimal ESTIMATE_COST;

	/**
	 * 建安概算（不含物流设备及信息）
	 */
	private BigDecimal ESTIMATE_CONSTRUCT_SAFE_COST;

	/**
	 * 建安对应预备费
	 */
	private BigDecimal PRE_CONSTRUCT_SAFE_COST;

	/**
	 * 开工时间
	 */
	private Date CONSTRUCT_ST_DATE;

	/**
	 * 预计完工时间
	 */
	private Date PLAN_CONSTRUCT_ED_DATE;

	/**
	 * 总建筑面积
	 */
	private BigDecimal CONSTRUCT_AREA;

	/**
	 * 执行总费用
	 */
	private BigDecimal EXCUTE_AMOUNT;

	/**
	 * 执行建安（万元）
	 */
	private Integer CONSTRUCT_SAFE_COUNT;

	/**
	 * 合同价
	 */
	private BigDecimal CONSTRUCT_SAFE_CNTRCT_COST;

	/**
	 * 已支付
	 */
	private BigDecimal CONSTRUCT_SAFE_CNTRCT_COST_PAID;

	/**
	 * 控制价
	 */
	private BigDecimal CONSTRUCT_SAFE_CNTRCT_COST_CTRL;

	/**
	 * 超概的风险度
	 */
	private Integer BUDGETARY_OVERRUN_RISK;

	/**
	 * 月报
	 */
	private Integer MONTHLY_REPORT_CNT;

	/**
	 * 建议书
	 */
	private Integer SUGGEST_REPORT_CNT;

	/**
	 * 联系函
	 */
	private Integer COMM_REPORT_CNT;

	/**
	 * 已完审价
	 */
	private Integer FINISH_AUDIT_CNT;

	/**
	 * 工程例会
	 */
	private Integer PROJ_PROGRESS_MEET_CNT;

	/**
	 * 大致进度及工作计划
	 */
	private String PROGRESS_STATUS;

	/**
	 * 负责人
	 */
	private String PROJECT_SENIOR_MANAGER;

	/**
	 * 合同类型=9时，需要输入合同名称
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
	 * 备用6
	 */
	private String RESERVE6;

	/**
	 * 备用7
	 */
	private BigDecimal RESERVE7;

	/**
	 * 备用8
	 */
	private BigDecimal RESERVE8;

	/**
	 * 备用9
	 */
	private Date RESERVE9;

	/**
	 * 备用10
	 */
	private Date RESERVE10;

	/**
	 * 最新化
	 */
	private String LATEST_FLG;

	/**
	 * 删除
	 */
	private String DELETE_FLG;

	/**
	 * 更新者
	 */
	private String UPDATE_USER;

	/**
	 * 新增日期
	 */
	private Date INSERT_DATE;

	/**
	 * 更新日期
	 */
	private Date UPDATE_DATE;

	public String getCNTRCT_NO() {
		return CNTRCT_NO;
	}

	public void setCNTRCT_NO(String cNTRCT_NO) {
		CNTRCT_NO = cNTRCT_NO;
	}

	public String getCNTRCT_YEAR() {
		return CNTRCT_YEAR;
	}

	public void setCNTRCT_YEAR(String cNTRCT_YEAR) {
		CNTRCT_YEAR = cNTRCT_YEAR;
	}

	public String getCNTRCT_NAME() {
		return CNTRCT_NAME;
	}

	public void setCNTRCT_NAME(String cNTRCT_NAME) {
		CNTRCT_NAME = cNTRCT_NAME;
	}

	public String getCNTRCT_NM() {
		return CNTRCT_NM;
	}

	public void setCNTRCT_NM(String cNTRCT_NM) {
		CNTRCT_NM = cNTRCT_NM;
	}

	public String getCNTRCT_TYPE() {
		return CNTRCT_TYPE;
	}

	public void setCNTRCT_TYPE(String cNTRCT_TYPE) {
		CNTRCT_TYPE = cNTRCT_TYPE;
	}

	public String getBID_COMP_NO() {
		return BID_COMP_NO;
	}

	public void setBID_COMP_NO(String bID_COMP_NO) {
		BID_COMP_NO = bID_COMP_NO;
	}

	public String getBID_COMP_NAME() {
		return BID_COMP_NAME;
	}

	public void setBID_COMP_NAME(String bID_COMP_NAME) {
		BID_COMP_NAME = bID_COMP_NAME;
	}

	public String getCO_MANAGER1() {
		return CO_MANAGER1;
	}

	public void setCO_MANAGER1(String cO_MANAGER1) {
		CO_MANAGER1 = cO_MANAGER1;
	}

	public String getCO_MANAGER_TEL1() {
		return CO_MANAGER_TEL1;
	}

	public void setCO_MANAGER_TEL1(String cO_MANAGER_TEL1) {
		CO_MANAGER_TEL1 = cO_MANAGER_TEL1;
	}

	public String getCO_ADDRESS1() {
		return CO_ADDRESS1;
	}

	public void setCO_ADDRESS1(String cO_ADDRESS1) {
		CO_ADDRESS1 = cO_ADDRESS1;
	}

	public String getCO_MANAGER_EMAIL1() {
		return CO_MANAGER_EMAIL1;
	}

	public void setCO_MANAGER_EMAIL1(String cO_MANAGER_EMAIL1) {
		CO_MANAGER_EMAIL1 = cO_MANAGER_EMAIL1;
	}

	public String getCO_TAX() {
		return CO_TAX;
	}

	public void setCO_TAX(String cO_TAX) {
		CO_TAX = cO_TAX;
	}

	public Date getCNTRCT_ST_DATE() {
		return CNTRCT_ST_DATE;
	}

	public void setCNTRCT_ST_DATE(Date cNTRCT_ST_DATE) {
		CNTRCT_ST_DATE = cNTRCT_ST_DATE;
	}

	public Date getCNTRCT_ED_DATE() {
		return CNTRCT_ED_DATE;
	}

	public void setCNTRCT_ED_DATE(Date cNTRCT_ED_DATE) {
		CNTRCT_ED_DATE = cNTRCT_ED_DATE;
	}

	public BigDecimal getCNTRCT_RATE_1() {
		return CNTRCT_RATE_1;
	}

	public void setCNTRCT_RATE_1(BigDecimal cNTRCT_RATE_1) {
		CNTRCT_RATE_1 = cNTRCT_RATE_1;
	}

	public BigDecimal getCNTRCT_RATE_2() {
		return CNTRCT_RATE_2;
	}

	public void setCNTRCT_RATE_2(BigDecimal cNTRCT_RATE_2) {
		CNTRCT_RATE_2 = cNTRCT_RATE_2;
	}

	public BigDecimal getCNTRCT_RATE_3() {
		return CNTRCT_RATE_3;
	}

	public void setCNTRCT_RATE_3(BigDecimal cNTRCT_RATE_3) {
		CNTRCT_RATE_3 = cNTRCT_RATE_3;
	}

	public BigDecimal getCNTRCT_RATE_4() {
		return CNTRCT_RATE_4;
	}

	public void setCNTRCT_RATE_4(BigDecimal cNTRCT_RATE_4) {
		CNTRCT_RATE_4 = cNTRCT_RATE_4;
	}

	public BigDecimal getCNTRCT_RATE_5() {
		return CNTRCT_RATE_5;
	}

	public void setCNTRCT_RATE_5(BigDecimal cNTRCT_RATE_5) {
		CNTRCT_RATE_5 = cNTRCT_RATE_5;
	}

	public BigDecimal getCNTRCT_RATE_6() {
		return CNTRCT_RATE_6;
	}

	public void setCNTRCT_RATE_6(BigDecimal cNTRCT_RATE_6) {
		CNTRCT_RATE_6 = cNTRCT_RATE_6;
	}

	public BigDecimal getCNTRCT_RATE_7() {
		return CNTRCT_RATE_7;
	}

	public void setCNTRCT_RATE_7(BigDecimal cNTRCT_RATE_7) {
		CNTRCT_RATE_7 = cNTRCT_RATE_7;
	}

	public BigDecimal getCNTRCT_RATE_8() {
		return CNTRCT_RATE_8;
	}

	public void setCNTRCT_RATE_8(BigDecimal cNTRCT_RATE_8) {
		CNTRCT_RATE_8 = cNTRCT_RATE_8;
	}

	public BigDecimal getCNTRCT_RATE_9() {
		return CNTRCT_RATE_9;
	}

	public void setCNTRCT_RATE_9(BigDecimal cNTRCT_RATE_9) {
		CNTRCT_RATE_9 = cNTRCT_RATE_9;
	}

	public BigDecimal getCNTRCT_RATE_10() {
		return CNTRCT_RATE_10;
	}

	public void setCNTRCT_RATE_10(BigDecimal cNTRCT_RATE_10) {
		CNTRCT_RATE_10 = cNTRCT_RATE_10;
	}

	public BigDecimal getCNTRCT_AMOUNT_1() {
		return CNTRCT_AMOUNT_1;
	}

	public void setCNTRCT_AMOUNT_1(BigDecimal cNTRCT_AMOUNT_1) {
		CNTRCT_AMOUNT_1 = cNTRCT_AMOUNT_1;
	}

	public BigDecimal getCNTRCT_AMOUNT_2() {
		return CNTRCT_AMOUNT_2;
	}

	public void setCNTRCT_AMOUNT_2(BigDecimal cNTRCT_AMOUNT_2) {
		CNTRCT_AMOUNT_2 = cNTRCT_AMOUNT_2;
	}

	public BigDecimal getCNTRCT_AMOUNT_3() {
		return CNTRCT_AMOUNT_3;
	}

	public void setCNTRCT_AMOUNT_3(BigDecimal cNTRCT_AMOUNT_3) {
		CNTRCT_AMOUNT_3 = cNTRCT_AMOUNT_3;
	}

	public BigDecimal getCNTRCT_AMOUNT_4() {
		return CNTRCT_AMOUNT_4;
	}

	public void setCNTRCT_AMOUNT_4(BigDecimal cNTRCT_AMOUNT_4) {
		CNTRCT_AMOUNT_4 = cNTRCT_AMOUNT_4;
	}

	public BigDecimal getCNTRCT_AMOUNT_5() {
		return CNTRCT_AMOUNT_5;
	}

	public void setCNTRCT_AMOUNT_5(BigDecimal cNTRCT_AMOUNT_5) {
		CNTRCT_AMOUNT_5 = cNTRCT_AMOUNT_5;
	}

	public BigDecimal getCNTRCT_AMOUNT_6() {
		return CNTRCT_AMOUNT_6;
	}

	public void setCNTRCT_AMOUNT_6(BigDecimal cNTRCT_AMOUNT_6) {
		CNTRCT_AMOUNT_6 = cNTRCT_AMOUNT_6;
	}

	public BigDecimal getCNTRCT_AMOUNT_7() {
		return CNTRCT_AMOUNT_7;
	}

	public void setCNTRCT_AMOUNT_7(BigDecimal cNTRCT_AMOUNT_7) {
		CNTRCT_AMOUNT_7 = cNTRCT_AMOUNT_7;
	}

	public BigDecimal getCNTRCT_AMOUNT_8() {
		return CNTRCT_AMOUNT_8;
	}

	public void setCNTRCT_AMOUNT_8(BigDecimal cNTRCT_AMOUNT_8) {
		CNTRCT_AMOUNT_8 = cNTRCT_AMOUNT_8;
	}

	public BigDecimal getCNTRCT_AMOUNT_9() {
		return CNTRCT_AMOUNT_9;
	}

	public void setCNTRCT_AMOUNT_9(BigDecimal cNTRCT_AMOUNT_9) {
		CNTRCT_AMOUNT_9 = cNTRCT_AMOUNT_9;
	}

	public BigDecimal getCNTRCT_AMOUNT_10() {
		return CNTRCT_AMOUNT_10;
	}

	public void setCNTRCT_AMOUNT_10(BigDecimal cNTRCT_AMOUNT_10) {
		CNTRCT_AMOUNT_10 = cNTRCT_AMOUNT_10;
	}

	public BigDecimal getCNTRCT_TOTAL_AMOUNT() {
		return CNTRCT_TOTAL_AMOUNT;
	}

	public void setCNTRCT_TOTAL_AMOUNT(BigDecimal cNTRCT_TOTAL_AMOUNT) {
		CNTRCT_TOTAL_AMOUNT = cNTRCT_TOTAL_AMOUNT;
	}

	public BigDecimal getCNTRCT_ALL_AMOUNT() {
		return CNTRCT_ALL_AMOUNT;
	}

	public void setCNTRCT_ALL_AMOUNT(BigDecimal cNTRCT_ALL_AMOUNT) {
		CNTRCT_ALL_AMOUNT = cNTRCT_ALL_AMOUNT;
	}

	public BigDecimal getCNTRCT_UNPAY_AMOUNT() {
		return CNTRCT_UNPAY_AMOUNT;
	}

	public void setCNTRCT_UNPAY_AMOUNT(BigDecimal cNTRCT_UNPAY_AMOUNT) {
		CNTRCT_UNPAY_AMOUNT = cNTRCT_UNPAY_AMOUNT;
	}

	public BigDecimal getTRIP_TOTAL_AMOUNT() {
		return TRIP_TOTAL_AMOUNT;
	}

	public void setTRIP_TOTAL_AMOUNT(BigDecimal tRIP_TOTAL_AMOUNT) {
		TRIP_TOTAL_AMOUNT = tRIP_TOTAL_AMOUNT;
	}

	public BigDecimal getESTIMATE_COST() {
		return ESTIMATE_COST;
	}

	public void setESTIMATE_COST(BigDecimal eSTIMATE_COST) {
		ESTIMATE_COST = eSTIMATE_COST;
	}

	public BigDecimal getESTIMATE_CONSTRUCT_SAFE_COST() {
		return ESTIMATE_CONSTRUCT_SAFE_COST;
	}

	public void setESTIMATE_CONSTRUCT_SAFE_COST(BigDecimal eSTIMATE_CONSTRUCT_SAFE_COST) {
		ESTIMATE_CONSTRUCT_SAFE_COST = eSTIMATE_CONSTRUCT_SAFE_COST;
	}

	public BigDecimal getPRE_CONSTRUCT_SAFE_COST() {
		return PRE_CONSTRUCT_SAFE_COST;
	}

	public void setPRE_CONSTRUCT_SAFE_COST(BigDecimal pRE_CONSTRUCT_SAFE_COST) {
		PRE_CONSTRUCT_SAFE_COST = pRE_CONSTRUCT_SAFE_COST;
	}

	public Date getCONSTRUCT_ST_DATE() {
		return CONSTRUCT_ST_DATE;
	}

	public void setCONSTRUCT_ST_DATE(Date cONSTRUCT_ST_DATE) {
		CONSTRUCT_ST_DATE = cONSTRUCT_ST_DATE;
	}

	public Date getPLAN_CONSTRUCT_ED_DATE() {
		return PLAN_CONSTRUCT_ED_DATE;
	}

	public void setPLAN_CONSTRUCT_ED_DATE(Date pLAN_CONSTRUCT_ED_DATE) {
		PLAN_CONSTRUCT_ED_DATE = pLAN_CONSTRUCT_ED_DATE;
	}

	public BigDecimal getCONSTRUCT_AREA() {
		return CONSTRUCT_AREA;
	}

	public void setCONSTRUCT_AREA(BigDecimal cONSTRUCT_AREA) {
		CONSTRUCT_AREA = cONSTRUCT_AREA;
	}

	public BigDecimal getEXCUTE_AMOUNT() {
		return EXCUTE_AMOUNT;
	}

	public void setEXCUTE_AMOUNT(BigDecimal eXCUTE_AMOUNT) {
		EXCUTE_AMOUNT = eXCUTE_AMOUNT;
	}

	public Integer getCONSTRUCT_SAFE_COUNT() {
		return CONSTRUCT_SAFE_COUNT;
	}

	public void setCONSTRUCT_SAFE_COUNT(Integer cONSTRUCT_SAFE_COUNT) {
		CONSTRUCT_SAFE_COUNT = cONSTRUCT_SAFE_COUNT;
	}

	public BigDecimal getCONSTRUCT_SAFE_CNTRCT_COST() {
		return CONSTRUCT_SAFE_CNTRCT_COST;
	}

	public void setCONSTRUCT_SAFE_CNTRCT_COST(BigDecimal cONSTRUCT_SAFE_CNTRCT_COST) {
		CONSTRUCT_SAFE_CNTRCT_COST = cONSTRUCT_SAFE_CNTRCT_COST;
	}

	public BigDecimal getCONSTRUCT_SAFE_CNTRCT_COST_PAID() {
		return CONSTRUCT_SAFE_CNTRCT_COST_PAID;
	}

	public void setCONSTRUCT_SAFE_CNTRCT_COST_PAID(BigDecimal cONSTRUCT_SAFE_CNTRCT_COST_PAID) {
		CONSTRUCT_SAFE_CNTRCT_COST_PAID = cONSTRUCT_SAFE_CNTRCT_COST_PAID;
	}

	public BigDecimal getCONSTRUCT_SAFE_CNTRCT_COST_CTRL() {
		return CONSTRUCT_SAFE_CNTRCT_COST_CTRL;
	}

	public void setCONSTRUCT_SAFE_CNTRCT_COST_CTRL(BigDecimal cONSTRUCT_SAFE_CNTRCT_COST_CTRL) {
		CONSTRUCT_SAFE_CNTRCT_COST_CTRL = cONSTRUCT_SAFE_CNTRCT_COST_CTRL;
	}

	public Integer getBUDGETARY_OVERRUN_RISK() {
		return BUDGETARY_OVERRUN_RISK;
	}

	public void setBUDGETARY_OVERRUN_RISK(Integer bUDGETARY_OVERRUN_RISK) {
		BUDGETARY_OVERRUN_RISK = bUDGETARY_OVERRUN_RISK;
	}

	public Integer getMONTHLY_REPORT_CNT() {
		return MONTHLY_REPORT_CNT;
	}

	public void setMONTHLY_REPORT_CNT(Integer mONTHLY_REPORT_CNT) {
		MONTHLY_REPORT_CNT = mONTHLY_REPORT_CNT;
	}

	public Integer getSUGGEST_REPORT_CNT() {
		return SUGGEST_REPORT_CNT;
	}

	public void setSUGGEST_REPORT_CNT(Integer sUGGEST_REPORT_CNT) {
		SUGGEST_REPORT_CNT = sUGGEST_REPORT_CNT;
	}

	public Integer getCOMM_REPORT_CNT() {
		return COMM_REPORT_CNT;
	}

	public void setCOMM_REPORT_CNT(Integer cOMM_REPORT_CNT) {
		COMM_REPORT_CNT = cOMM_REPORT_CNT;
	}

	public Integer getFINISH_AUDIT_CNT() {
		return FINISH_AUDIT_CNT;
	}

	public void setFINISH_AUDIT_CNT(Integer fINISH_AUDIT_CNT) {
		FINISH_AUDIT_CNT = fINISH_AUDIT_CNT;
	}

	public Integer getPROJ_PROGRESS_MEET_CNT() {
		return PROJ_PROGRESS_MEET_CNT;
	}

	public void setPROJ_PROGRESS_MEET_CNT(Integer pROJ_PROGRESS_MEET_CNT) {
		PROJ_PROGRESS_MEET_CNT = pROJ_PROGRESS_MEET_CNT;
	}

	public String getPROGRESS_STATUS() {
		return PROGRESS_STATUS;
	}

	public void setPROGRESS_STATUS(String pROGRESS_STATUS) {
		PROGRESS_STATUS = pROGRESS_STATUS;
	}

	public String getPROJECT_SENIOR_MANAGER() {
		return PROJECT_SENIOR_MANAGER;
	}

	public void setPROJECT_SENIOR_MANAGER(String pROJECT_SENIOR_MANAGER) {
		PROJECT_SENIOR_MANAGER = pROJECT_SENIOR_MANAGER;
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

	public String getRESERVE6() {
		return RESERVE6;
	}

	public void setRESERVE6(String rESERVE6) {
		RESERVE6 = rESERVE6;
	}

	public BigDecimal getRESERVE7() {
		return RESERVE7;
	}

	public void setRESERVE7(BigDecimal rESERVE7) {
		RESERVE7 = rESERVE7;
	}

	public BigDecimal getRESERVE8() {
		return RESERVE8;
	}

	public void setRESERVE8(BigDecimal rESERVE8) {
		RESERVE8 = rESERVE8;
	}

	public Date getRESERVE9() {
		return RESERVE9;
	}

	public void setRESERVE9(Date rESERVE9) {
		RESERVE9 = rESERVE9;
	}

	public Date getRESERVE10() {
		return RESERVE10;
	}

	public void setRESERVE10(Date rESERVE10) {
		RESERVE10 = rESERVE10;
	}

	public String getLATEST_FLG() {
		return LATEST_FLG;
	}

	public void setLATEST_FLG(String lATEST_FLG) {
		LATEST_FLG = lATEST_FLG;
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

	public int getTotalProject() {
		return totalProject;
	}

	public void setTotalProject(int totalProject) {
		this.totalProject = totalProject;
	}

	public int getFinishProject() {
		return finishProject;
	}

	public void setFinishProject(int finishProject) {
		this.finishProject = finishProject;
	}

	public int getBuildingProject() {
		return buildingProject;
	}

	public void setBuildingProject(int buildingProject) {
		this.buildingProject = buildingProject;
	}

	public int getFailProject() {
		return failProject;
	}

	public void setFailProject(int failProject) {
		this.failProject = failProject;
	}

	public BigDecimal getBidAmount() {
		return bidAmount;
	}

	public void setBidAmount(BigDecimal bidAmount) {
		this.bidAmount = bidAmount;
	}

	public BigDecimal getExpertAmount() {
		return expertAmount;
	}

	public void setExpertAmount(BigDecimal expertAmount) {
		this.expertAmount = expertAmount;
	}

	public String getShowCNTRCT_ST_DATE() {
		showCNTRCT_ST_DATE = "";
		if(CNTRCT_ST_DATE != null) {
			showCNTRCT_ST_DATE = DateUtil.dateToShortStr(CNTRCT_ST_DATE);
		}
		return showCNTRCT_ST_DATE;
	}

	public void setShowCNTRCT_ST_DATE(String showCNTRCT_ST_DATE) {
		this.showCNTRCT_ST_DATE = showCNTRCT_ST_DATE;
	}

	public String getShowCNTRCT_ED_DATE() {
		showCNTRCT_ED_DATE = "";
		if(CNTRCT_ED_DATE != null) {
			showCNTRCT_ED_DATE = DateUtil.dateToShortStr(CNTRCT_ED_DATE);
		}
		return showCNTRCT_ED_DATE;
	}

	public void setShowCNTRCT_ED_DATE(String showCNTRCT_ED_DATE) {
		this.showCNTRCT_ED_DATE = showCNTRCT_ED_DATE;
	}

	public BigDecimal getBID_AGENT_PRICE() {
		return BID_AGENT_PRICE;
	}

	public void setBID_AGENT_PRICE(BigDecimal bID_AGENT_PRICE) {
		BID_AGENT_PRICE = bID_AGENT_PRICE;
	}

	public BigDecimal getBID_AGENT_PRICE_ACT() {
		return BID_AGENT_PRICE_ACT;
	}

	public void setBID_AGENT_PRICE_ACT(BigDecimal bID_AGENT_PRICE_ACT) {
		BID_AGENT_PRICE_ACT = bID_AGENT_PRICE_ACT;
	}
}
