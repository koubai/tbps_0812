package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.AgentCompDao;
import com.cn.tbps.dto.AgentCompDto;

/**
 * @name AgentCompDaoImpl.java
 * @author Frank
 * @time 2013-10-15下午10:08:31
 * @version 1.0
 */
public class AgentCompDaoImpl extends BaseDao implements AgentCompDao {
	
	@Override
	public List<AgentCompDto> queryAllAgentCompExport(String agentCompNoLow,
			String agentCompNoHigh, String agentAddFlag, String agentCompName) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		//这里按照需求，若委托公司名称存在，则忽略委托公司代码按委托公司来查询。
		if(StringUtil.isNotBlank(agentCompName)) {
			paramMap.put("ANGENT_COMP_NAME", StringUtil.replaceDatabaseKeyword_mysql(agentCompName));
		} else {
			paramMap.put("ANGENT_COMP_NO_LOW", agentCompNoLow);
			paramMap.put("ANGENT_COMP_NO_HIGH", agentCompNoHigh);
		}
		if("3".equals(agentAddFlag)) {
			//承包公司
			paramMap.put("ANGENT_COMP_NO_PRE", "Y");
		} else if("1".equals(agentAddFlag) || "2".equals(agentAddFlag)) {
			//专业公司或委托公司
			paramMap.put("ANGENT_COMP_NO_PRE", "J");
		} else {
			paramMap.put("ANGENT_COMP_NO_PRE", "");
		}
		@SuppressWarnings("unchecked")
		List<AgentCompDto> list = getSqlMapClientTemplate().queryForList("queryAllAgentCompExport", paramMap);
		return list;
	}

	@Override
	public List<AgentCompDto> queryAgentCompByPage(String agentCompNoLow,
			String agentCompNoHigh, String agentAddFlag, String agentCompName, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		//这里按照需求，若委托公司名称存在，则忽略委托公司代码按委托公司来查询。
		if(StringUtil.isNotBlank(agentCompName)) {
			paramMap.put("ANGENT_COMP_NAME", StringUtil.replaceDatabaseKeyword_mysql(agentCompName));
		} else {
			paramMap.put("ANGENT_COMP_NO_LOW", agentCompNoLow);
			paramMap.put("ANGENT_COMP_NO_HIGH", agentCompNoHigh);
		}
		paramMap.put("start", start);
		paramMap.put("end", end);
		if("3".equals(agentAddFlag)) {
			//承包公司
			paramMap.put("ANGENT_COMP_NO_PRE", "Y");
		} else if("1".equals(agentAddFlag) || "2".equals(agentAddFlag)) {
			//专业公司或委托公司
			paramMap.put("ANGENT_COMP_NO_PRE", "J");
		} else {
			paramMap.put("ANGENT_COMP_NO_PRE", "");
		}
		@SuppressWarnings("unchecked")
		List<AgentCompDto> list = getSqlMapClientTemplate().queryForList("queryAgentCompByPage", paramMap);
		return list;
	}

	@Override
	public int queryAgentCompCountByPage(String agentCompNoLow,
			String agentCompNoHigh, String agentAddFlag, String agentCompName) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		//这里按照需求，若委托公司名称存在，则忽略委托公司代码按委托公司来查询。
		if(StringUtil.isNotBlank(agentCompName)) {
			paramMap.put("ANGENT_COMP_NAME", StringUtil.replaceDatabaseKeyword_mysql(agentCompName));
		} else {
			paramMap.put("ANGENT_COMP_NO_LOW", agentCompNoLow);
			paramMap.put("ANGENT_COMP_NO_HIGH", agentCompNoHigh);
		}
		if("3".equals(agentAddFlag)) {
			//承包公司
			paramMap.put("ANGENT_COMP_NO_PRE", "Y");
		} else if("1".equals(agentAddFlag) || "2".equals(agentAddFlag)) {
			//专业公司或委托公司
			paramMap.put("ANGENT_COMP_NO_PRE", "J");
		} else {
			paramMap.put("ANGENT_COMP_NO_PRE", "");
		}
		return (Integer) getSqlMapClientTemplate().queryForObject("queryAgentCompCountByPage", paramMap);
	}

	@Override
	public AgentCompDto queryAgentCompByID(String agentCompNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ANGENT_COMP_NO", agentCompNo);
		@SuppressWarnings("unchecked")
		List<AgentCompDto> list = getSqlMapClientTemplate().queryForList("queryAgentCompByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public AgentCompDto queryAllAgentCompByID(String agentCompNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ANGENT_COMP_NO", agentCompNo);
		@SuppressWarnings("unchecked")
		List<AgentCompDto> list = getSqlMapClientTemplate().queryForList("queryAllAgentCompByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<AgentCompDto> queryAllAgentComp() {
		@SuppressWarnings("unchecked")
		List<AgentCompDto> list = getSqlMapClientTemplate().queryForList("queryAllAgentComp");
		return list;
	}

	@Override
	public void insertAgentComp(AgentCompDto agentComp) {
		getSqlMapClientTemplate().insert("insertAgentComp", agentComp);
	}

	@Override
	public void updateAgentComp(AgentCompDto agentComp) {
		getSqlMapClientTemplate().update("updateAgentComp", agentComp);
	}
}
