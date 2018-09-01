package com.cn.tbps.service;

import java.util.List;

import com.cn.common.util.Page;
import com.cn.tbps.dto.AuditDto;
import com.cn.tbps.dto.AuditHistDto;

/**
 * @name AuditService.java
 * @author Frank
 * @time 2014-2-15下午2:05:21
 * @version 1.0
 */
public interface AuditService {

	//审价
	/**
	 * 翻页查询审价
	 * @param auditNoLow
	 * @param auditNoHigh
	 * @param projectStatus
	 * @param projectManager
	 * @param valueDateLow
	 * @param valueDateHigh
	 * @param agentNo
	 * @param reportNoComp
	 * @param reportNoLow
	 * @param reportNoHigh
	 * @param page
	 * @param auditStatus
	 * @return
	 */
	public Page queryAuditByPage(String auditNoLow, String auditNoHigh, String projectStatus,
			String projectManager, String valueDateLow, String valueDateHigh, String agentNo,
			String reportNoComp, String reportNoLow, String reportNoHigh, Page page, String auditStatus, 
			String projectClass, String docArrDateLow, String docArrDateHigh, String agentName, 
			String contractName, String strProjectName);
	
	/**
	 * 查询审价（导出数据用）
	 * @param auditNoLow
	 * @param auditNoHigh
	 * @param projectStatus
	 * @param projectManager
	 * @param valueDateLow
	 * @param valueDateHigh
	 * @param agentNo
	 * @param reportNoComp
	 * @param reportNoLow
	 * @param reportNoHigh
	 * @param auditStatus
	 * @return
	 */
	public List<AuditDto> queryAllAuditExport(String auditNoLow, String auditNoHigh, String projectStatus,
			String projectManager, String valueDateLow, String valueDateHigh, String agentNo,
			String reportNoComp, String reportNoLow, String reportNoHigh, String auditStatus, 
			String projectClass, String docArrDateLow, String docArrDateHigh, String agentName, 
			String contractName, String projectName);
	
	/**
	 * 根据审价编号查询记录（查询未删除的记录）
	 * @param auditNo
	 * @return
	 */
	public AuditDto queryAuditByID(String auditNo);
	
	/**
	 * 根据审价编号查询记录（查询所有记录）
	 * @param auditNo
	 * @return
	 */
	public AuditDto queryAllAuditByID(String auditNo);
	
	/**
	 * 新增审价
	 * @param audit
	 * @return 审价编号
	 */
	public String insertAudit(AuditDto audit);
	
	/**
	 * 修改审价
	 * @param audit
	 */
	public void updateAudit(AuditDto audit);
	
	/**
	 * 删除审价（逻辑删除）
	 * @param auditNo
	 * @param user
	 */
	public void deleteAudit(String auditNo, String user);
	
	//审价履历
	/**
	 * 翻页查询审价履历
	 * @param auditNo
	 * @param page
	 * @return
	 */
	public Page queryAuditHistByPage(String auditNo, Page page);
	
	/**
	 * 根据审价编号查询所有审价履历（导出数据用）
	 * @param auditNo
	 * @return
	 */
	public List<AuditHistDto> queryAllAuditHistExport(String auditNo);
	
	/**
	 * 根据ID查询审价履历
	 * @param auditHisSeq
	 * @return
	 */
	public AuditHistDto queryAuditHistByID(String auditHisSeq);
}
