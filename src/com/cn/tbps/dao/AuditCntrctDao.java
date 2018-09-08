package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.AuditCntrctDto;

public interface AuditCntrctDao {

	public int queryAuditCntrctCountByPage(String strCntrctBelong, String strCntrctNO, String strCntrctType,
			String strCntrctName, String strCntrctStDate, String strCntrctEdDate);
	
	public List<AuditCntrctDto> queryAuditCntrctByPage(String strCntrctBelong, String strCntrctNO, String strCntrctType,
			String strCntrctName, String strCntrctStDate, String strCntrctEdDate, int start, int end);
	
	public AuditCntrctDto queryAuditCntrctByID(String CNTRCT_NO);
	
	public void insertAuditCntrct(AuditCntrctDto auditCntrct);
	
	public void updateAuditCntrct(AuditCntrctDto auditCntrct);
}
