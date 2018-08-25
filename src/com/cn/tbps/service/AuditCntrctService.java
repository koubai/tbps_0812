package com.cn.tbps.service;

import com.cn.common.util.Page;
import com.cn.tbps.dto.AuditCntrctDto;

public interface AuditCntrctService {
	public Page queryAuditCntrctByPage(String strCntrctBelong, String strCntrctNO, String strCntrctType,
			String strCntrctName, String strCntrctStDateLow, String strCntrctStDateHigh, Page page);
	
	public AuditCntrctDto queryAuditCntrctByID(String CNTRCT_NO);
	
	public void insertAuditCntrct(AuditCntrctDto auditCntrct);
	
	public void updateAuditCntrct(AuditCntrctDto auditCntrct);
	
	public void deleteAuditCntrct(String cntrctNo, String userName);
}
