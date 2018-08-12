package com.cn.tbps.service;

import com.cn.common.util.Page;
import com.cn.tbps.dto.AuditCntrctHisDto;

public interface AuditCntrctHisService {

	public Page queryAuditCntrctHisByPage(String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_NO, Page page);
	
	public AuditCntrctHisDto queryAuditCntrctHisByID(String CNTRCT_HIST_SEQ);
	
	public void insertAuditCntrctHis(AuditCntrctHisDto auditCntrctHis);
}
