package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.AuditCntrctDto;

public interface AuditCntrctDao {

	public int queryAuditCntrctCountByPage(String CNTRCT_NAME, String CNTRCT_TYPE);
	
	public List<AuditCntrctDto> queryAuditCntrctByPage(String CNTRCT_NAME, String CNTRCT_TYPE, int start, int end);
	
	public AuditCntrctDto queryAuditCntrctByID(String CNTRCT_NO);
	
	public void insertAuditCntrct(AuditCntrctDto auditCntrct);
	
	public void updateAuditCntrct(AuditCntrctDto auditCntrct);
}
