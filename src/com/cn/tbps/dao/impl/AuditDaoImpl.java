package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.tbps.dao.AuditDao;
import com.cn.tbps.dto.AuditDto;
import com.cn.tbps.dto.AuditHistDto;

/**
 * @name AuditDaoImpl.java
 * @author Frank
 * @time 2014-2-15下午1:51:09
 * @version 1.0
 */
public class AuditDaoImpl extends BaseDao implements AuditDao {

	//审价
	@Override
	public int queryAuditCountByPage(String auditNoLow, String auditNoHigh,
			String projectStatus, String projectManager, String valueDateLow,
			String valueDateHigh, String agentNo, String reportNoComp, String reportNoLow, String reportNoHigh, String auditStatus, 
			String projectClass, String docArrDateLow, String docArrDateHigh, String agentName, 
			String contractName, String projectName) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("AUDIT_NO_LOW", auditNoLow);
		paramMap.put("AUDIT_NO_HIGH", auditNoHigh);
		paramMap.put("PROJECT_STATUS", projectStatus);
		paramMap.put("PROJECT_MANAGER", projectManager);
		paramMap.put("VALUE_DATE_LOW", valueDateLow);
		paramMap.put("VALUE_DATE_HIGH", valueDateHigh);
		paramMap.put("AGENT_NO", agentNo);
		
		//报告文号（公司）
		paramMap.put("REPORT_NO_COMP", reportNoComp);
		//报告文号
		paramMap.put("REPORT_NO_LOW", reportNoLow);
		paramMap.put("REPORT_NO_HIGH", reportNoHigh);
		//审价状态
		paramMap.put("AUDIT_STATUS", auditStatus);
		//项目分类
		paramMap.put("RESERVE1", projectClass);
		//资料到达日期
		paramMap.put("DOC_ARR_DATE_LOW", docArrDateLow);
		paramMap.put("DOC_ARR_DATE_HIGH", docArrDateHigh);
		//委托公司名称
		paramMap.put("AGENT_CO_NAME", agentName);
		//承揽公司名称
		paramMap.put("CONTRACT_CO_NAME", contractName);
		//项目名称
		paramMap.put("PROJECT_NAME", projectName);
		
		return (Integer) getSqlMapClientTemplate().queryForObject("queryAuditCountByPage", paramMap);
	}

	@Override
	public List<AuditDto> queryAuditByPage(String auditNoLow,
			String auditNoHigh, String projectStatus, String projectManager,
			String valueDateLow, String valueDateHigh, String agentNo,
			String reportNoComp, String reportNoLow, String reportNoHigh, String auditStatus, 
			String projectClass, String docArrDateLow, String docArrDateHigh, String agentName,
			String contractName, String projectName, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("AUDIT_NO_LOW", auditNoLow);
		paramMap.put("AUDIT_NO_HIGH", auditNoHigh);
		paramMap.put("PROJECT_STATUS", projectStatus);
		paramMap.put("PROJECT_MANAGER", projectManager);
		paramMap.put("VALUE_DATE_LOW", valueDateLow);
		paramMap.put("VALUE_DATE_HIGH", valueDateHigh);
		paramMap.put("AGENT_NO", agentNo);
		
		//报告文号（公司）
		paramMap.put("REPORT_NO_COMP", reportNoComp);
		//报告文号
		paramMap.put("REPORT_NO_LOW", reportNoLow);
		paramMap.put("REPORT_NO_HIGH", reportNoHigh);
		//审价状态
		paramMap.put("AUDIT_STATUS", auditStatus);
		//项目分类
		paramMap.put("RESERVE1", projectClass);
		//资料到达日期
		paramMap.put("DOC_ARR_DATE_LOW", docArrDateLow);
		paramMap.put("DOC_ARR_DATE_HIGH", docArrDateHigh);
		//委托公司名称
		paramMap.put("AGENT_CO_NAME", agentName);
		//承揽公司名称
		paramMap.put("CONTRACT_CO_NAME", contractName);
		//项目名称
		paramMap.put("PROJECT_NAME", projectName);
				
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<AuditDto> list = getSqlMapClientTemplate().queryForList("queryAuditByPage", paramMap);
		return list;
	}

	@Override
	public List<AuditDto> queryAllAuditExport(String auditNoLow,
			String auditNoHigh, String projectStatus, String projectManager,
			String valueDateLow, String valueDateHigh, String agentNo,
			String reportNoComp, String reportNoLow, String reportNoHigh, String auditStatus, 
			String projectClass, String docArrDateLow, String docArrDateHigh, String agentName, 
			String contractName, String projectName) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("AUDIT_NO_LOW", auditNoLow);
		paramMap.put("AUDIT_NO_HIGH", auditNoHigh);
		paramMap.put("PROJECT_STATUS", projectStatus);
		paramMap.put("PROJECT_MANAGER", projectManager);
		paramMap.put("VALUE_DATE_LOW", valueDateLow);
		paramMap.put("VALUE_DATE_HIGH", valueDateHigh);
		paramMap.put("AGENT_NO", agentNo);
		
		//报告文号（公司）
		paramMap.put("REPORT_NO_COMP", reportNoComp);
		//报告文号
		paramMap.put("REPORT_NO_LOW", reportNoLow);
		paramMap.put("REPORT_NO_HIGH", reportNoHigh);
		//审价状态		
		paramMap.put("AUDIT_STATUS", auditStatus);
		//项目分类
		paramMap.put("RESERVE1", projectClass);
		//资料到达日期
		paramMap.put("DOC_ARR_DATE_LOW", docArrDateLow);
		paramMap.put("DOC_ARR_DATE_HIGH", docArrDateHigh);
		//委托公司名称
		paramMap.put("AGENT_CO_NAME", agentName);
		//承揽公司名称
		paramMap.put("CONTRACT_CO_NAME", contractName);
		//项目名称
		paramMap.put("PROJECT_NAME", projectName);
		@SuppressWarnings("unchecked")
		List<AuditDto> list = getSqlMapClientTemplate().queryForList("queryAllAuditExport", paramMap);
		return list;
	}

	@Override
	public AuditDto queryAuditByID(String auditNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("AUDIT_NO", auditNo);
		@SuppressWarnings("unchecked")
		List<AuditDto> list = getSqlMapClientTemplate().queryForList("queryAuditByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public AuditDto queryAllAuditByID(String auditNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("AUDIT_NO", auditNo);
		@SuppressWarnings("unchecked")
		List<AuditDto> list = getSqlMapClientTemplate().queryForList("queryAllAuditByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void insertAudit(AuditDto audit) {
		getSqlMapClientTemplate().insert("insertAudit", audit);
	}

	@Override
	public void updateAudit(AuditDto audit) {
		getSqlMapClientTemplate().update("updateAudit", audit);
	}

	//审价履历
	@Override
	public int queryAuditHistCountByPage(String auditNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("AUDIT_NO", auditNo);
		return (Integer) getSqlMapClientTemplate().queryForObject("queryAuditHistCountByPage", paramMap);
	}

	@Override
	public List<AuditHistDto> queryAuditHistByPage(String auditNo, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("AUDIT_NO", auditNo);
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<AuditHistDto> list = getSqlMapClientTemplate().queryForList("queryAuditHistByPage", paramMap);
		return list;
	}

	@Override
	public List<AuditHistDto> queryAllAuditHistExport(String auditNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("AUDIT_NO", auditNo);
		@SuppressWarnings("unchecked")
		List<AuditHistDto> list = getSqlMapClientTemplate().queryForList("queryAllAuditHistExport", paramMap);
		return list;
	}

	@Override
	public AuditHistDto queryAuditHistByID(String auditHisSeq) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("AUDIT_HIS_SEQ", auditHisSeq);
		@SuppressWarnings("unchecked")
		List<AuditHistDto> list = getSqlMapClientTemplate().queryForList("queryAuditHistByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void insertAuditHist(AuditHistDto auditHist) {
		getSqlMapClientTemplate().insert("insertAuditHist", auditHist);
	}

	@Override
	public List<AuditDto> queryAuditAuth(String projectManager, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AuditDto> queryAuditStatistics(String projectManager, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AuditDto> queryAuditStatPaid(String projectManager, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AuditDto> queryAuditStatCost(String projectManager, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return null;
	}
}
