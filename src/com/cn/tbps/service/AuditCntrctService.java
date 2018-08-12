package com.cn.tbps.service;

import com.cn.common.util.Page;
import com.cn.tbps.dto.AuditCntrctDto;

public interface AuditCntrctService {

	public Page queryAuditCntrctByPage(String CNTRCT_NAME, String CNTRCT_TYPE, Page page);
	
	public AuditCntrctDto queryAuditCntrctByID(String CNTRCT_NO);
	
	public void insertAuditCntrct(AuditCntrctDto auditCntrct);
	
	public void updateAuditCntrct(AuditCntrctDto auditCntrct);
}
