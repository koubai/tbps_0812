package com.cn.tbps.dto;

public enum AuditListDispEnum {
	REPORT_NO(1,"REPORT_NO","项目文号"),
	PROJECT_MANAGER(2,"PROJECT_MANAGER","工程师"),
	PROJECT_NAME(3,"PROJECT_NAME","项目名称"),
	AGENT_CO_NAME(4,"AGENT_CO_NAME","委托公司名称"),
	AGENT_CO_MANAGER(5,"AGENT_CO_MANAGER","委托公司负责人"),
	AGENT_CO_MANAGER_TEL(6,"AGENT_CO_MANAGER_TEL","委托公司负责人电话"),
	PROF_CO_NAME(7,"PROF_CO_NAME","专业公司名称"),
	PROF_CO_MANAGER(8,"PROF_CO_MANAGER","专业公司负责人"),
	PROF_CO_MANAGER_TEL(9,"PROF_CO_MANAGER_TEL","专业公司负责人电话"),
	CONTRACT_CO_NAME(10,"CONTRACT_CO_NAME","承包公司名称"),
	CONTRACT_CO_MANAGER(11,"CONTRACT_CO_MANAGER","承包公司负责人"),
	CONTRACT_CO_MANAGER_TEL(12,"CONTRACT_CO_MANAGER_TEL","承包公司负责人电话"),
	DOC_REC_DATE(13,"DOC_REC_DATE","资料收到日期"),
	PROGRESS_STATUS(14,"PROGRESS_STATUS","实施情况"),
	PRE_SET(15,"PRE_SET","预/结算"),
	PRE_PRICE(16,"PRE_PRICE","预算金额"),
	SUPPORT_DOC_DATE(17,"SUPPORT_DOC_DATE","补充资料日期"),
	DRAFT_DATE(18,"DRAFT_DATE","初稿日期"),
	APPROVAL_SND_DATE(19,"APPROVAL_SND_DATE","审定单发出日期"),
	APPROVAL_RCV_DATE(20,"APPROVAL_RCV_DATE","审定单收到日期"),
	DELI_NO(21,"DELI_NO","快递单号"),
	REPORT_RAISE_DATE(22,"REPORT_RAISE_DATE","报告出具日期"),
	REPORT_SEAL_DATE(23,"REPORT_SEAL_DATE","报告敲章日期"),
	REPORT_ARR_TYPE(24,"REPORT_ARR_TYPE","报告送达方式"),
	REPORT_ARR_DATE(25,"REPORT_ARR_DATE","报告送达日期"),
	REG_DATE(26,"REG_DATE","入档日期"),
	AGENT_INFO(27,"AGENT_INFO","委托方专业联系人及联系方式"),
	PROF_INFO(28,"PROF_INFO","专业方联系人及联系方式"),
	CONTRACT_CO_ID(29,"CONTRACT_CO_ID","承揽单位"),
	CONTRACT_CO_INFO(30,"CONTRACT_CO_INFO","承揽单位联系人及联系方式"),
	VERIFY_PER_AMOUNT(31,"VERIFY_PER_AMOUNT","送审价"),
	VERIFY_AMOUNT(32,"VERIFY_AMOUNT","审核价"),
	VERIFY_INCREASE(33,"VERIFY_INCREASE","核增额"),
	VERIFY_DECREASE(34,"VERIFY_DECREASE","核减额"),
	VERIFY_DIFF(35,"VERIFY_DIFF","净核减额"),
	VERIFY_DIFF_RATE(36,"VERIFY_DIFF_RATE","净核减率"),
	CNT_PRICE(37,"CNT_PRICE","控制价金额"),
	PROJ_PRICE(38,"PROJ_PRICE","立项金额"),
	LIMIT_PRICE(39,"LIMIT_PRICE","限价金额"),
	CNTRCT_PRICE(40,"CNTRCT_PRICE","合同金额"),
	PLAN_DOC_RCV_DATE(41,"PLAN_DOC_RCV_DATE","资料收到时间（立项阶段）"),
	PLAN_DOC_RPT_DATE(42,"PLAN_DOC_RPT_DATE","立项报告时间（立项阶段）"),
	PLAN_DOC_SND_TYPE(43,"PLAN_DOC_SND_TYPE","报告送达方式（立项阶段）"),
	PLAN_DOC_ARR_DATE(44,"PLAN_DOC_ARR_DATE","报告送达日期（立项阶段）"),
	BID_DOC_RCV_DATE(45,"BID_DOC_RCV_DATE","资料收到时间（招标阶段）"),
	BID_DOC_RPT_DATE(46,"BID_DOC_RPT_DATE","限价报告时间（招标阶段）"),
	BID_DOC_SND_TYPE(47,"BID_DOC_SND_TYPE","报告送达方式（招标阶段）"),
	BID_DOC_ARR_DATE(48,"BID_DOC_ARR_DATE","报告送达日期（招标阶段）"),
	SIGN_DOC_RCV_DATE(49,"SIGN_DOC_RCV_DATE","资料收到时间（合同签订阶段）"),
	SIGN_DOC_RPT_DATE(50,"SIGN_DOC_RPT_DATE","审核报告时间（合同签订阶段）"),
	SIGN_DOC_SND_TYPE(51,"SIGN_DOC_SND_TYPE","报告送达方式（合同签订阶段）"),
	SIGN_DOC_ARR_DATE(52,"SIGN_DOC_ARR_DATE","报告送达日期（合同签订阶段）"),
	SET_DOC_RCV_DATE(53,"SET_DOC_RCV_DATE","资料收到时间（结算阶段）"),
	SET_DOC_RPT_DATE(54,"SET_DOC_RPT_DATE","结算报告出具时间（结算阶段）"),
	SET_DOC_SND_TYPE(55,"SET_DOC_SND_TYPE","报告送达方式（结算阶段）"),
	SET_DOC_ARR_DATE(56,"SET_DOC_ARR_DATE","报告送达日期（结算阶段）"),
	PROGRESS_STATUS_MEMO(57,"PROGRESS_STATUS_MEMO","项目大致进度简述"),
	A_AMOUNT(58,"A_AMOUNT","甲方收费"),
	A_STATUS(59,"A_STATUS","收费状态"),
	B_TYPE(60,"B_TYPE","乙方收费方式"),
	B_AMOUNT(61,"B_AMOUNT","乙方收费"),
	A_INVOICE_DELI_DATE(62,"A_INVOICE_DELI_DATE","甲方发票流转单日期"),
	A_INVOICE_DATE(63,"A_INVOICE_DATE","甲方开票日期"),
	A_INVOICE_NO(64,"A_INVOICE_NO","甲方发票号"),
	A_SET_DATE(65,"A_SET_DATE","甲方到账日期"),
	B_INVOICE_DELI_DATE(66,"B_INVOICE_DELI_DATE","乙方发票流转单日期"),
	B_INVOICE_DATE(67,"B_INVOICE_DATE","乙方开票日期"),
	B_INVOICE_NO(68,"B_INVOICE_NO","乙方发票号"),
	B_SET_DATE(69,"B_SET_DATE","乙方到账日期"),
	B_RATE(70,"B_RATE","乙方费率"),
	CNTRCT_INFO(71,"CNTRCT_INFO","委托内容"),
	PROJECT_NAME_PASS(72,"PROJECT_NAME_PASS","曾用名");
	
    private final Integer id; 
    
    private final String enName;
    
    private final String cnName; 
    
    private AuditListDispEnum(Integer id, String enName, String cnName) { 
           this.id = id; 
           this.enName = enName; 
           this.cnName = cnName; 
    }
    
    public static AuditListDispEnum getNameByID(Integer id) {
    	AuditListDispEnum res = null;
    	for(AuditListDispEnum auditListDispEnum : AuditListDispEnum.values()) {
    		if(auditListDispEnum.getId() == id) {
    			res = auditListDispEnum;
    		}
    	}
    	return res;
    }

	public Integer getId() {
		return id;
	}

	public String getEnName() {
		return enName;
	}

	public String getCnName() {
		return cnName;
	} 
}
