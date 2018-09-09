package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.AuditDto;
import com.cn.tbps.dto.AuditHistDto;

/**
 * @name AuditDao.java
 * @author Frank
 * @time 2014-2-15下午1:55:31
 * @version 1.0
 */
public interface AuditDao {

	//审价
	/**
	 * 查询总记录数
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
	public int queryAuditCountByPage(String auditNoLow, String auditNoHigh, String projectStatus,
			String projectManager, String valueDateLow, String valueDateHigh, String agentNo,
			String reportNoComp, String reportNoLow, String reportNoHigh, String auditStatus, 
			String projectClass, String docArrDateLow, String docArrDateHigh, String agentName, 
			String contractName, String projectName);
	
	/**
	 * 翻页查询记录
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
	 * @param start
	 * @param end
	 * @return
	 */
	public List<AuditDto> queryAuditByPage(String auditNoLow, String auditNoHigh, String projectStatus,
			String projectManager, String valueDateLow, String valueDateHigh, String agentNo,
			String reportNoComp, String reportNoLow, String reportNoHigh, String auditStatus, 
			String projectClass, String docArrDateLow, String docArrDateHigh, String agentName, 
			String contractName, String projectName, int start, int end);
	
	/**
	 * 项目情况检查
	 * @param projectManager
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<AuditDto> queryAuditAuth(String projectManager, String startDate, String endDate);
	
	/**
	 * 统计界面
	 * @param projectManager
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<AuditDto> queryAuditStatistics(String projectManager, String startDate, String endDate);
	
	/**
	 * 到账统计
	 * @param projectManager
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<AuditDto> queryAuditStatPaid(String projectManager, String startDate, String endDate);
	
	/**
	 * 项目收费统计输出
	 * @param projectManager
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<AuditDto> queryAuditStatCost(String projectManager, String startDate, String endDate);
	
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
	 */
	public void insertAudit(AuditDto audit);
	
	/**
	 * 修改审价
	 * @param audit
	 */
	public void updateAudit(AuditDto audit);
	
	//审价履历
	/**
	 * 根据审价编号查询审价履历记录数
	 * @param auditNo
	 * @return
	 */
	public int queryAuditHistCountByPage(String auditNo);
	
	/**
	 * 根据审价编号查询审价履历（翻页）
	 * @param auditNo
	 * @param auditNo
	 * @param start
	 * @param end
	 * @return
	 */
	public List<AuditHistDto> queryAuditHistByPage(String auditNo, int start, int end);
	
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
	
	/**
	 * 新增审价履历
	 * @param auditHist
	 */
	public void insertAuditHist(AuditHistDto auditHist);
}
