package com.cn.tbps.service;

import java.util.List;

import com.cn.common.util.Page;
import com.cn.tbps.dto.AuditAnnualDataDto;
import com.cn.tbps.dto.AuditAuthDto;
import com.cn.tbps.dto.AuditDto;
import com.cn.tbps.dto.AuditHistDto;
import com.cn.tbps.dto.AuditStatCostDto;
import com.cn.tbps.dto.AuditStatPaidDto;
import com.cn.tbps.dto.AuditStatisticsDto;

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
			String contractName, String strReportNo, String strProjectName, String strCntrctInfo, String strCntYear);

	//审价
	/**
	 * 翻页查询审价根据关键字
	 * @param strKeyword
	 * @return
	 */
	//public Page queryAuditByPage(String keyword, String auditStatus, Page page);
	public Page queryAuditByPage(String strKeyword, String strProjectManager, String strReportNo, String strProjectName, String strCntrctInfo, String strCntYear, String strAuditStatus, Page page);

	/**
	 * 项目情况检查
	 * @param projectManager
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public AuditAuthDto queryAuditAuth(String projectManager, String startDate, String endDate);
	
	/**
	 * 统计界面
	 * @param projectManager
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public AuditStatisticsDto queryAuditStatistics(String projectManager, String startDate, String endDate);
	
	/**
	 * 查询审价月度统计数据（只查询合同性质为地铁类）
	 * @param projectManager
	 * @param startDate
	 * @param endDate
	 * @param CNTRCT_TYPE 合同性质：1为地铁，2位非地铁
	 * @return
	 */
	public AuditAnnualDataDto queryAuditMonthData(String projectManager, String startDate, String endDate, String CNTRCT_TYPE);
	
	/**
	 * 查询审价月度统计数据（只查询合同性质为地铁类）
	 * @param projectManager
	 * @param startDate
	 * @param endDate
	 * @param CNTRCT_TYPE 合同性质：1为地铁，2位非地铁
	 * @param CNTRCT_INFO 委托内容
	 * @return
	 */
	public AuditAnnualDataDto queryAuditMonthData(String projectManager, String startDate, String endDate, String CNTRCT_TYPE, String CNTRCT_INFO);
	
	/**
	 * 项目收费统计输出
	 * @param projectManager
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public AuditStatCostDto queryAuditStatCost(String projectManager, String startDate, String endDate);
	
	/**
	 * 到账统计
	 * @param projectManager
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public AuditStatPaidDto queryAuditStatPaid(String projectManager, String startDate, String endDate);
	
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
			String contractName, String reportNo, String projectName, String cntrctInfo, String cntYear);
	
	/**
	 * 查询审价（导出数据用）使用关键字
	 * @param keyword
	 * @param auditStatus
	 * @return
	 */
	public List<AuditDto> queryAllAuditExport(String keyword, String projectManager, String reportNo, String projectName, String cntrctInfo, String cntYear, String auditStatus);
	
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
	 * @throws Exception 
	 */
	public String insertAudit(AuditDto audit) throws Exception;
	
	/**
	 * 修改审价
	 * @param audit
	 * @throws Exception 
	 */
	public void updateAudit(AuditDto audit) throws Exception;
	
	/**
	 * 删除审价（逻辑删除）
	 * @param auditNo
	 * @param user
	 * @throws Exception 
	 */
	public void deleteAudit(String auditNo, String user) throws Exception;
	
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
