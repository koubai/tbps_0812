package com.cn.tbps.dto;

public enum AuditListDispEnum {
	REPORT_NO(1,"REPORT_NO","项目文号"),
	PROJECT_NAME(2,"PROJECT_NAME","项目名称"),
	PROJECT_NAME_PASS(3,"PROJECT_NAME_PASS","曾用名"),
	CNTRCT_NO(4,"CNTRCT_NO","合同编号"),
//	CNTRCT_NAME(4,"CNTRCT_NAME","合同名称"),
	PROJECT_MANAGER(5,"PROJECT_MANAGER","工程师"),
	DOC_REC_DATE(6,"DOC_REC_DATE","资料收到日期"),
	PROGRESS_STATUS(7,"PROGRESS_STATUS","实施情况"),
	PRE_SET(8,"PRE_SET","预/结算"),
	PRE_PRICE(9,"PRE_PRICE","预算金额"),
	AGENT_INFO(10,"AGENT_INFO","委托方专业联系人及联系方式"),
	PROF_INFO(11,"PROF_INFO","专业公司专业联系人及联系方式"),
	CONTRACT_CO_ID(12,"CONTRACT_CO_NAME","承揽单位"),
	CONTRACT_CO_INFO(13,"CONTRACT_CO_INFO","承揽单位联系人及联系方式"),
	VERIFY_PER_AMOUNT(14,"VERIFY_PER_AMOUNT","送审价"),
	VERIFY_AMOUNT(15,"VERIFY_AMOUNT","审核价"),
	VERIFY_INCREASE(15,"VERIFY_INCREASE","核增额"),
	VERIFY_DECREASE(16,"VERIFY_DECREASE","核减额");

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
