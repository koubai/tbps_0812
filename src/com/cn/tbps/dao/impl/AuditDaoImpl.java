package com.cn.tbps.dao.impl;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.AuditDao;
import com.cn.tbps.dto.AuditCostCountDto;
import com.cn.tbps.dto.AuditCountDto;
import com.cn.tbps.dto.AuditDto;
import com.cn.tbps.dto.AuditHistDto;
import com.cn.tbps.dto.AuditStatCostCountDto;
import com.cn.tbps.dto.AuditStatCostDetailDto;
import com.cn.tbps.dto.AuditStatCostDto;
import com.cn.tbps.dto.AuditStatisticsCountDto;
import com.cn.tbps.dto.AuditStatisticsDetailDto;
import com.cn.tbps.dto.AuditStatisticsDto;

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
	public AuditStatisticsDto queryAuditStatistics(String projectManager, String startDate, String endDate) {
		AuditStatisticsDto auditStatisticsDto= new AuditStatisticsDto();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String pm = projectManager;
		if(StringUtil.isNotBlank(pm)) {
			pm = pm.replace(",", "','");
			pm = "'" + pm + "'";
		}
		paramMap.put("PROJECT_MANAGER", pm);
		paramMap.put("START_DATE", startDate);
		paramMap.put("END_DATE", endDate);
		//合同列表
		@SuppressWarnings("unchecked")
		List<String> listAuditCntrctNM = getSqlMapClientTemplate().queryForList("queryAuditCntrctNM", paramMap);
		auditStatisticsDto.setListAuditCntrctNM(listAuditCntrctNM);
		//审价
		paramMap.put("RESERVE1", "1");
		@SuppressWarnings("unchecked")
		List<AuditStatisticsDetailDto> listAudit1 = getSqlMapClientTemplate().queryForList("queryAuditStatistics", paramMap);
		@SuppressWarnings("unchecked")
		List<AuditStatisticsDetailDto> listAuditByMonth1 = getSqlMapClientTemplate().queryForList("queryAuditStatisticsByMonth", paramMap);
		for(AuditStatisticsDetailDto dtoByMonth1 : listAuditByMonth1) {
			List<AuditCountDto> listAuditCount = new ArrayList<AuditCountDto>();
			for(String s : listAuditCntrctNM) {
				AuditCountDto auditCountDto = new AuditCountDto();
				auditCountDto.setCNTRCT_NM(s);
				int count = 0;
				for(AuditStatisticsDetailDto dto1 : listAudit1) {
					if(s.equals(dto1.getCNTRCT_NM()) && dto1.getPROJECT_MANAGER().equals(dtoByMonth1.getPROJECT_MANAGER()) 
							&& dto1.getDOC_REC_DATE().equals(dtoByMonth1.getDOC_REC_DATE())) {
						count = dto1.getCNTRCT_NM_COUNT();
						break;
					}
				}
				auditCountDto.setCNTRCT_NM_COUNT(count);
				listAuditCount.add(auditCountDto);
			}
			dtoByMonth1.setListAuditCount(listAuditCount);;
		}
		auditStatisticsDto.setListAudit1(listAuditByMonth1);
		//审价合计
		AuditStatisticsCountDto auditStatisticsCountDto = new AuditStatisticsCountDto();
		int allCount = (Integer)getSqlMapClientTemplate().queryForObject("queryAuditStatisticsAllCount", paramMap);
		auditStatisticsCountDto.setAllCount(allCount);
		@SuppressWarnings("unchecked")
		List<AuditCountDto> listAuditCount = getSqlMapClientTemplate().queryForList("queryAuditStatisticsCount", paramMap);
		List<AuditCountDto> listCount1 = new ArrayList<AuditCountDto>();
		for(String s : listAuditCntrctNM) {
			AuditCountDto auditCountDto = new AuditCountDto();
			auditCountDto.setCNTRCT_NM(s);
			int count = 0;
			for(AuditCountDto dto1 : listAuditCount) {
				if(s.equals(dto1.getCNTRCT_NM())) {
					count = dto1.getCNTRCT_NM_COUNT();
					break;
				}
			}
			auditCountDto.setCNTRCT_NM_COUNT(count);
			listCount1.add(auditCountDto);
		}
		auditStatisticsCountDto.setListCount(listCount1);
		auditStatisticsDto.setCount1(auditStatisticsCountDto);
		
		//咨询
		paramMap.put("RESERVE1", "2");
		@SuppressWarnings("unchecked")
		List<AuditStatisticsDetailDto> listAudit2 = getSqlMapClientTemplate().queryForList("queryAuditStatistics", paramMap);
		@SuppressWarnings("unchecked")
		List<AuditStatisticsDetailDto> listAuditByMonth2 = getSqlMapClientTemplate().queryForList("queryAuditStatisticsByMonth", paramMap);
		for(AuditStatisticsDetailDto dtoByMonth2 : listAuditByMonth2) {
			List<AuditCountDto> listAuditCount2 = new ArrayList<AuditCountDto>();
			for(String s : listAuditCntrctNM) {
				AuditCountDto auditCountDto = new AuditCountDto();
				auditCountDto.setCNTRCT_NM(s);
				int count = 0;
				for(AuditStatisticsDetailDto dto2 : listAudit2) {
					if(s.equals(dto2.getCNTRCT_NM()) && dto2.getPROJECT_MANAGER().equals(dtoByMonth2.getPROJECT_MANAGER()) 
							&& dto2.getDOC_REC_DATE().equals(dtoByMonth2.getDOC_REC_DATE())) {
						count = dto2.getCNTRCT_NM_COUNT();
						break;
					}
				}
				auditCountDto.setCNTRCT_NM_COUNT(count);
				listAuditCount2.add(auditCountDto);
			}
			dtoByMonth2.setListAuditCount(listAuditCount2);;
		}
		auditStatisticsDto.setListAudit2(listAuditByMonth2);
		//咨询合计
		AuditStatisticsCountDto auditStatisticsCountDto2 = new AuditStatisticsCountDto();
		int allCount2 = (Integer)getSqlMapClientTemplate().queryForObject("queryAuditStatisticsAllCount", paramMap);
		auditStatisticsCountDto2.setAllCount(allCount2);
		@SuppressWarnings("unchecked")
		List<AuditCountDto> listAuditCount2 = getSqlMapClientTemplate().queryForList("queryAuditStatisticsCount", paramMap);
		List<AuditCountDto> listCount2 = new ArrayList<AuditCountDto>();
		for(String s : listAuditCntrctNM) {
			AuditCountDto auditCountDto = new AuditCountDto();
			auditCountDto.setCNTRCT_NM(s);
			int count = 0;
			for(AuditCountDto dto2 : listAuditCount2) {
				if(s.equals(dto2.getCNTRCT_NM())) {
					count = dto2.getCNTRCT_NM_COUNT();
					break;
				}
			}
			auditCountDto.setCNTRCT_NM_COUNT(count);
			listCount2.add(auditCountDto);
		}
		auditStatisticsCountDto2.setListCount(listCount2);
		auditStatisticsDto.setCount2(auditStatisticsCountDto2);
		//控制价编制
		paramMap.put("RESERVE1", "4");
		@SuppressWarnings("unchecked")
		List<AuditStatisticsDetailDto> listAudit4 = getSqlMapClientTemplate().queryForList("queryAuditStatistics", paramMap);
		@SuppressWarnings("unchecked")
		List<AuditStatisticsDetailDto> listAuditByMonth4 = getSqlMapClientTemplate().queryForList("queryAuditStatisticsByMonth", paramMap);
		for(AuditStatisticsDetailDto dtoByMonth4 : listAuditByMonth4) {
			List<AuditCountDto> listAuditCount4 = new ArrayList<AuditCountDto>();
			for(String s : listAuditCntrctNM) {
				AuditCountDto auditCountDto = new AuditCountDto();
				auditCountDto.setCNTRCT_NM(s);
				int count = 0;
				for(AuditStatisticsDetailDto dto4 : listAudit4) {
					if(s.equals(dto4.getCNTRCT_NM()) && dto4.getPROJECT_MANAGER().equals(dtoByMonth4.getPROJECT_MANAGER()) 
							&& dto4.getDOC_REC_DATE().equals(dtoByMonth4.getDOC_REC_DATE())) {
						count = dto4.getCNTRCT_NM_COUNT();
						break;
					}
				}
				auditCountDto.setCNTRCT_NM_COUNT(count);
				listAuditCount4.add(auditCountDto);
			}
			dtoByMonth4.setListAuditCount(listAuditCount4);;
		}
		auditStatisticsDto.setListAudit4(listAuditByMonth4);
		//控制价编制合计
		AuditStatisticsCountDto auditStatisticsCountDto4 = new AuditStatisticsCountDto();
		int allCount4 = (Integer)getSqlMapClientTemplate().queryForObject("queryAuditStatisticsAllCount", paramMap);
		auditStatisticsCountDto4.setAllCount(allCount4);
		@SuppressWarnings("unchecked")
		List<AuditCountDto> listAuditCount4 = getSqlMapClientTemplate().queryForList("queryAuditStatisticsCount", paramMap);
		List<AuditCountDto> listCount4 = new ArrayList<AuditCountDto>();
		for(String s : listAuditCntrctNM) {
			AuditCountDto auditCountDto = new AuditCountDto();
			auditCountDto.setCNTRCT_NM(s);
			int count = 0;
			for(AuditCountDto dto4 : listAuditCount4) {
				if(s.equals(dto4.getCNTRCT_NM())) {
					count = dto4.getCNTRCT_NM_COUNT();
					break;
				}
			}
			auditCountDto.setCNTRCT_NM_COUNT(count);
			listCount4.add(auditCountDto);
		}
		auditStatisticsCountDto4.setListCount(listCount4);
		auditStatisticsDto.setCount4(auditStatisticsCountDto4);
		//投资监理
		paramMap.put("RESERVE1", "5");
		@SuppressWarnings("unchecked")
		List<AuditStatisticsDetailDto> listAudit5 = getSqlMapClientTemplate().queryForList("queryAuditStatistics5", paramMap);
		@SuppressWarnings("unchecked")
		List<AuditStatisticsDetailDto> listAuditByMonth5 = getSqlMapClientTemplate().queryForList("queryAuditStatisticsByMonth5", paramMap);
		for(AuditStatisticsDetailDto dtoByMonth5 : listAuditByMonth5) {
			List<AuditCountDto> listAuditCount5 = new ArrayList<AuditCountDto>();
			for(String s : listAuditCntrctNM) {
				AuditCountDto auditCountDto = new AuditCountDto();
				auditCountDto.setCNTRCT_NM(s);
				int count = 0;
				for(AuditStatisticsDetailDto dto5 : listAudit5) {
					if(s.equals(dto5.getCNTRCT_NM()) && dto5.getPROJECT_MANAGER().equals(dtoByMonth5.getPROJECT_MANAGER()) 
							&& dto5.getDOC_REC_DATE().equals(dtoByMonth5.getDOC_REC_DATE())) {
						count = dto5.getCNTRCT_NM_COUNT();
						break;
					}
				}
				auditCountDto.setCNTRCT_NM_COUNT(count);
				listAuditCount5.add(auditCountDto);
			}
			dtoByMonth5.setListAuditCount(listAuditCount5);;
		}
		auditStatisticsDto.setListAudit5(listAuditByMonth5);
		//投资监理合计
		AuditStatisticsCountDto auditStatisticsCountDto5 = new AuditStatisticsCountDto();
		int allCount5 = (Integer)getSqlMapClientTemplate().queryForObject("queryAuditStatisticsAllCount5", paramMap);
		auditStatisticsCountDto5.setAllCount(allCount5);
		@SuppressWarnings("unchecked")
		List<AuditCountDto> listAuditCount5 = getSqlMapClientTemplate().queryForList("queryAuditStatisticsCount5", paramMap);
		List<AuditCountDto> listCount5 = new ArrayList<AuditCountDto>();
		for(String s : listAuditCntrctNM) {
			AuditCountDto auditCountDto = new AuditCountDto();
			auditCountDto.setCNTRCT_NM(s);
			int count = 0;
			for(AuditCountDto dto5 : listAuditCount5) {
				if(s.equals(dto5.getCNTRCT_NM())) {
					count = dto5.getCNTRCT_NM_COUNT();
					break;
				}
			}
			auditCountDto.setCNTRCT_NM_COUNT(count);
			listCount5.add(auditCountDto);
		}
		auditStatisticsCountDto5.setListCount(listCount5);
		auditStatisticsDto.setCount5(auditStatisticsCountDto5);
		return auditStatisticsDto;
	}

	@Override
	public List<AuditDto> queryAuditStatPaid(String projectManager, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AuditStatCostDto queryAuditStatCost(String projectManager, String startDate, String endDate) {
		AuditStatCostDto auditStatCostDto= new AuditStatCostDto();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String pm = projectManager;
		if(StringUtil.isNotBlank(pm)) {
			pm = pm.replace(",", "','");
			pm = "'" + pm + "'";
		}
		paramMap.put("PROJECT_MANAGER", pm);
		paramMap.put("START_DATE", startDate);
		paramMap.put("END_DATE", endDate);
		//合同列表
		@SuppressWarnings("unchecked")
		List<String> listAuditCntrctNM = getSqlMapClientTemplate().queryForList("queryAuditCntrctNM", paramMap);
		auditStatCostDto.setListAuditCntrctNM(listAuditCntrctNM);
		
		//合计
		AuditStatCostCountDto auditStatCostCountDto = new AuditStatCostCountDto();
		AuditStatCostDetailDto allCount = (AuditStatCostDetailDto) getSqlMapClientTemplate().queryForObject("queryAuditStatCostAllCount", paramMap);
		auditStatCostCountDto.setALL_PER_AMOUNT(allCount.getALL_PER_AMOUNT());
		auditStatCostCountDto.setALL_AMOUNT(allCount.getALL_AMOUNT());
		@SuppressWarnings("unchecked")
		List<AuditStatCostDetailDto> listAuditCostCount = getSqlMapClientTemplate().queryForList("queryAuditStatCostCount", paramMap);
		List<AuditCostCountDto> listCount = new ArrayList<AuditCostCountDto>();
		for(String s : listAuditCntrctNM) {
			AuditCostCountDto auditCostCountDto = new AuditCostCountDto();
			auditCostCountDto.setCNTRCT_NM(s);
			auditCostCountDto.setA_PER_AMOUNT(new BigDecimal("0.00"));
			auditCostCountDto.setA_AMOUNT(new BigDecimal("0.00"));
			auditCostCountDto.setB_PER_AMOUNT(new BigDecimal("0.00"));
			auditCostCountDto.setB_AMOUNT(new BigDecimal("0.00"));
			for(AuditStatCostDetailDto dto : listAuditCostCount) {
				if(s.equals(dto.getCNTRCT_NM())) {
					auditCostCountDto.setA_PER_AMOUNT(dto.getA_PER_AMOUNT());
					auditCostCountDto.setA_AMOUNT(dto.getA_AMOUNT());
					auditCostCountDto.setB_PER_AMOUNT(dto.getB_PER_AMOUNT());
					auditCostCountDto.setB_AMOUNT(dto.getB_AMOUNT());
					break;
				}
			}
			listCount.add(auditCostCountDto);
		}
		auditStatCostCountDto.setListCount(listCount);
		auditStatCostDto.setCount(auditStatCostCountDto);
		
		//审价
		paramMap.put("RESERVE1", "1");
		@SuppressWarnings("unchecked")
		List<AuditStatCostDetailDto> listAudit1 = getSqlMapClientTemplate().queryForList("queryAuditStatCost", paramMap);
		@SuppressWarnings("unchecked")
		List<AuditStatCostDetailDto> listAuditByManager1 = getSqlMapClientTemplate().queryForList("queryAuditStatCostByManager", paramMap);
		for(AuditStatCostDetailDto dtoByManager1 : listAuditByManager1) {
			List<AuditCostCountDto> listAuditCostCount1 = new ArrayList<AuditCostCountDto>();
			for(String s : listAuditCntrctNM) {
				AuditCostCountDto auditCountDto = new AuditCostCountDto();
				auditCountDto.setCNTRCT_NM(s);
				auditCountDto.setCNTRCT_NM_COUNT(0);
				auditCountDto.setVERIFY_PER_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setA_PER_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setA_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setB_PER_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setB_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setB_AMOUNT_RATE(new BigDecimal("0.00"));
				for(AuditStatCostDetailDto dto1 : listAudit1) {
					if(s.equals(dto1.getCNTRCT_NM()) && dto1.getPROJECT_MANAGER().equals(dtoByManager1.getPROJECT_MANAGER())) {
						auditCountDto.setCNTRCT_NM_COUNT(dto1.getCNTRCT_NM_COUNT());
						auditCountDto.setVERIFY_PER_AMOUNT(dto1.getVERIFY_PER_AMOUNT());
						auditCountDto.setA_PER_AMOUNT(dto1.getA_PER_AMOUNT());
						auditCountDto.setA_AMOUNT(dto1.getA_AMOUNT());
						auditCountDto.setB_PER_AMOUNT(dto1.getB_PER_AMOUNT());
						auditCountDto.setB_AMOUNT(dto1.getB_AMOUNT());
						if(!(dto1.getB_PER_AMOUNT().compareTo(BigDecimal.ZERO) == 0)) {
							BigDecimal rate = dto1.getB_PER_AMOUNT().divide(dto1.getVERIFY_PER_AMOUNT(), 2, RoundingMode.HALF_UP);
							auditCountDto.setB_AMOUNT_RATE(rate);
						}
						break;
					}
				}
				listAuditCostCount1.add(auditCountDto);
			}
			dtoByManager1.setListAuditCostCount(listAuditCostCount1);;
		}
		auditStatCostDto.setListAudit1(listAuditByManager1);
		
		//咨询
		paramMap.put("RESERVE1", "2");
		@SuppressWarnings("unchecked")
		List<AuditStatCostDetailDto> listAudit2 = getSqlMapClientTemplate().queryForList("queryAuditStatCost", paramMap);
		@SuppressWarnings("unchecked")
		List<AuditStatCostDetailDto> listAuditByManager2 = getSqlMapClientTemplate().queryForList("queryAuditStatCostByManager", paramMap);
		for(AuditStatCostDetailDto dtoByManager2 : listAuditByManager2) {
			List<AuditCostCountDto> listAuditCostCount2 = new ArrayList<AuditCostCountDto>();
			for(String s : listAuditCntrctNM) {
				AuditCostCountDto auditCountDto = new AuditCostCountDto();
				auditCountDto.setCNTRCT_NM(s);
				auditCountDto.setCNTRCT_NM_COUNT(0);
				auditCountDto.setVERIFY_PER_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setA_PER_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setA_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setB_PER_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setB_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setB_AMOUNT_RATE(new BigDecimal("0.00"));
				for(AuditStatCostDetailDto dto2 : listAudit2) {
					if(s.equals(dto2.getCNTRCT_NM()) && dto2.getPROJECT_MANAGER().equals(dtoByManager2.getPROJECT_MANAGER())) {
						auditCountDto.setCNTRCT_NM_COUNT(dto2.getCNTRCT_NM_COUNT());
						auditCountDto.setVERIFY_PER_AMOUNT(dto2.getVERIFY_PER_AMOUNT());
						auditCountDto.setA_PER_AMOUNT(dto2.getA_PER_AMOUNT());
						auditCountDto.setA_AMOUNT(dto2.getA_AMOUNT());
						auditCountDto.setB_PER_AMOUNT(dto2.getB_PER_AMOUNT());
						auditCountDto.setB_AMOUNT(dto2.getB_AMOUNT());
						if(!(dto2.getB_PER_AMOUNT().compareTo(BigDecimal.ZERO) == 0)) {
							BigDecimal rate = dto2.getB_PER_AMOUNT().divide(dto2.getVERIFY_PER_AMOUNT(), 2, RoundingMode.HALF_UP);
							auditCountDto.setB_AMOUNT_RATE(rate);
						}
						break;
					}
				}
				listAuditCostCount2.add(auditCountDto);
			}
			dtoByManager2.setListAuditCostCount(listAuditCostCount2);;
		}
		auditStatCostDto.setListAudit2(listAuditByManager2);
		
		//控制价编制
		paramMap.put("RESERVE1", "4");
		@SuppressWarnings("unchecked")
		List<AuditStatCostDetailDto> listAudit4 = getSqlMapClientTemplate().queryForList("queryAuditStatCost", paramMap);
		@SuppressWarnings("unchecked")
		List<AuditStatCostDetailDto> listAuditByManager4 = getSqlMapClientTemplate().queryForList("queryAuditStatCostByManager", paramMap);
		for(AuditStatCostDetailDto dtoByManager4 : listAuditByManager4) {
			List<AuditCostCountDto> listAuditCostCount4 = new ArrayList<AuditCostCountDto>();
			for(String s : listAuditCntrctNM) {
				AuditCostCountDto auditCountDto = new AuditCostCountDto();
				auditCountDto.setCNTRCT_NM(s);
				auditCountDto.setCNTRCT_NM_COUNT(0);
				auditCountDto.setVERIFY_PER_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setA_PER_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setA_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setB_PER_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setB_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setB_AMOUNT_RATE(new BigDecimal("0.00"));
				for(AuditStatCostDetailDto dto4 : listAudit4) {
					if(s.equals(dto4.getCNTRCT_NM()) && dto4.getPROJECT_MANAGER().equals(dtoByManager4.getPROJECT_MANAGER())) {
						auditCountDto.setCNTRCT_NM_COUNT(dto4.getCNTRCT_NM_COUNT());
						auditCountDto.setVERIFY_PER_AMOUNT(dto4.getVERIFY_PER_AMOUNT());
						auditCountDto.setA_PER_AMOUNT(dto4.getA_PER_AMOUNT());
						auditCountDto.setA_AMOUNT(dto4.getA_AMOUNT());
						auditCountDto.setB_PER_AMOUNT(dto4.getB_PER_AMOUNT());
						auditCountDto.setB_AMOUNT(dto4.getB_AMOUNT());
						if(!(dto4.getB_PER_AMOUNT().compareTo(BigDecimal.ZERO) == 0)) {
							BigDecimal rate = dto4.getB_PER_AMOUNT().divide(dto4.getVERIFY_PER_AMOUNT(), 2, RoundingMode.HALF_UP);
							auditCountDto.setB_AMOUNT_RATE(rate);
						}
						break;
					}
				}
				listAuditCostCount4.add(auditCountDto);
			}
			dtoByManager4.setListAuditCostCount(listAuditCostCount4);;
		}
		auditStatCostDto.setListAudit4(listAuditByManager4);
		
		//投资监理
		paramMap.put("RESERVE1", "5");
		@SuppressWarnings("unchecked")
		List<AuditStatCostDetailDto> listAudit5 = getSqlMapClientTemplate().queryForList("queryAuditStatCost", paramMap);
		@SuppressWarnings("unchecked")
		List<AuditStatCostDetailDto> listAuditByManager5 = getSqlMapClientTemplate().queryForList("queryAuditStatCostByManager", paramMap);
		for(AuditStatCostDetailDto dtoByManager5 : listAuditByManager5) {
			List<AuditCostCountDto> listAuditCostCount5 = new ArrayList<AuditCostCountDto>();
			for(String s : listAuditCntrctNM) {
				AuditCostCountDto auditCountDto = new AuditCostCountDto();
				auditCountDto.setCNTRCT_NM(s);
				auditCountDto.setCNTRCT_NM_COUNT(0);
				auditCountDto.setVERIFY_PER_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setA_PER_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setA_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setB_PER_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setB_AMOUNT(new BigDecimal("0.00"));
				auditCountDto.setB_AMOUNT_RATE(new BigDecimal("0.00"));
				for(AuditStatCostDetailDto dto5 : listAudit5) {
					if(s.equals(dto5.getCNTRCT_NM()) && dto5.getPROJECT_MANAGER().equals(dtoByManager5.getPROJECT_MANAGER())) {
						auditCountDto.setCNTRCT_NM_COUNT(dto5.getCNTRCT_NM_COUNT());
						auditCountDto.setVERIFY_PER_AMOUNT(dto5.getVERIFY_PER_AMOUNT());
						auditCountDto.setA_PER_AMOUNT(dto5.getA_PER_AMOUNT());
						auditCountDto.setA_AMOUNT(dto5.getA_AMOUNT());
						auditCountDto.setB_PER_AMOUNT(dto5.getB_PER_AMOUNT());
						auditCountDto.setB_AMOUNT(dto5.getB_AMOUNT());
						if(!(dto5.getB_PER_AMOUNT().compareTo(BigDecimal.ZERO) == 0)) {
							BigDecimal rate = dto5.getB_PER_AMOUNT().divide(dto5.getVERIFY_PER_AMOUNT(), 2, RoundingMode.HALF_UP);
							auditCountDto.setB_AMOUNT_RATE(rate);
						}
						break;
					}
				}
				listAuditCostCount5.add(auditCountDto);
			}
			dtoByManager5.setListAuditCostCount(listAuditCostCount5);;
		}
		auditStatCostDto.setListAudit5(listAuditByManager5);
		
		return auditStatCostDto;
	}
}
