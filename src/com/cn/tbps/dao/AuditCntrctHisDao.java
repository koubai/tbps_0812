package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.AuditCntrctHisDto;

public interface AuditCntrctHisDao {

	public int queryAuditCntrctHisCountByPage(String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_NO);
	
	public List<AuditCntrctHisDto> queryAuditCntrctHisByPage(String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_NO, int start, int end);
	
	public AuditCntrctHisDto queryAuditCntrctHisByID(String CNTRCT_HIST_SEQ);
	
	public void insertAuditCntrctHis(AuditCntrctHisDto auditCntrctHis);
}
