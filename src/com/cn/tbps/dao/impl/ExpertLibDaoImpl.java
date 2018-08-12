package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.ExpertLibDao;
import com.cn.tbps.dto.ExpertLibDto;

public class ExpertLibDaoImpl extends BaseDao implements ExpertLibDao {
	
	@Override
	public List<ExpertLibDto> queryAllExpertLibExportNew(String EXPERT_NAME,
			String QUERY_EXPERT_MAJOR) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("EXPERT_NAME", EXPERT_NAME);
		paramMap.put("QUERY_EXPERT_MAJOR", QUERY_EXPERT_MAJOR);
		@SuppressWarnings("unchecked")
		List<ExpertLibDto> list = getSqlMapClientTemplate().queryForList(
				"queryAllExpertLibExportNew", paramMap);
		return list;
	}

	@Override
	public List<ExpertLibDto> queryExpertLibByPageNew(String EXPERT_NAME,
			String QUERY_EXPERT_MAJOR, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("EXPERT_NAME", EXPERT_NAME);
		paramMap.put("QUERY_EXPERT_MAJOR", QUERY_EXPERT_MAJOR);
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<ExpertLibDto> list = getSqlMapClientTemplate().queryForList(
				"queryExpertLibByPageNew", paramMap);
		return list;
	}

	@Override
	public int queryExpertLibCountByPageNew(String EXPERT_NAME,
			String QUERY_EXPERT_MAJOR) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("EXPERT_NAME", EXPERT_NAME);
		paramMap.put("QUERY_EXPERT_MAJOR", QUERY_EXPERT_MAJOR);
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"queryExpertLibCountByPageNew", paramMap);
	}

	@Override
	public List<ExpertLibDto> autoQueryExpertLib(String strWithoutExpertNameList, String strExpertMajor) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("WITHOUT_EXPERT_SEQ_LIST", strWithoutExpertNameList);
		paramMap.put("EXPERT_MAJOR", strExpertMajor);
		@SuppressWarnings("unchecked")
		List<ExpertLibDto> list = getSqlMapClientTemplate().queryForList("autoQueryExpertLib", paramMap);
		return list;
	}

	@Override
	public List<ExpertLibDto> autoQueryExpertLibNew(String strWithoutExpertNameList, String strExpertMajor, 
			String expertName, String isInclude, String expertComp) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("WITHOUT_EXPERT_SEQ_LIST", strWithoutExpertNameList);
		paramMap.put("EXPERT_MAJOR", strExpertMajor);
		paramMap.put("EXPERT_NAME", expertName);
		paramMap.put("INCLUDE", "in");
		paramMap.put("EXPERT_COMP", expertComp);
		if(StringUtil.isNotBlank(isInclude)){
			if(isInclude.equals("1")){
				paramMap.put("INCLUDE", "not in");
			}
		}
		@SuppressWarnings("unchecked")
		List<ExpertLibDto> list = getSqlMapClientTemplate().queryForList("autoQueryExpertLibNew", paramMap);
		return list;
	}

	@Override
	public List<ExpertLibDto> queryExpertLibByIds(String ids) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("IDS", ids);
		@SuppressWarnings("unchecked")
		List<ExpertLibDto> list = getSqlMapClientTemplate().queryForList(
				"queryExpertLibByIds", paramMap);
		return list;
	}
	
	@Override
	public List<ExpertLibDto> queryAllExpertLibOr(String strExpertMajor) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("EXPERT_MAJOR", strExpertMajor);
		@SuppressWarnings("unchecked")
		List<ExpertLibDto> list = getSqlMapClientTemplate().queryForList(
				"queryAllExpertLibOr", paramMap);
		return list;
	}

	@Override
	public List<ExpertLibDto> queryExpertLibByPageOr(String expertName,
			String strExpertMajor, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("EXPERT_NAME", expertName);
		paramMap.put("EXPERT_MAJOR", strExpertMajor);
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<ExpertLibDto> list = getSqlMapClientTemplate().queryForList(
				"queryExpertLibByPageOr", paramMap);
		return list;
	}

	@Override
	public List<ExpertLibDto> queryExpertLibByPageAnd(String expertName,
			String strExpertMajor, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("EXPERT_NAME", expertName);
		paramMap.put("EXPERT_MAJOR", strExpertMajor);
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<ExpertLibDto> list = getSqlMapClientTemplate().queryForList(
				"queryExpertLibByPageAnd", paramMap);
		return list;
	}

	@Override
	public int queryExpertLibCountByPageOr(String expertName,
			String strExpertMajor) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("EXPERT_NAME", expertName);
		paramMap.put("EXPERT_MAJOR", strExpertMajor);
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"queryExpertLibCountByPageOr", paramMap);
	}
	
	@Override
	public int queryExpertLibCountByPageAnd(String expertName,
			String strExpertMajor) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("EXPERT_NAME", expertName);
		paramMap.put("EXPERT_MAJOR", strExpertMajor);
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"queryExpertLibCountByPageAnd", paramMap);
	}

	@Override
	public ExpertLibDto queryExpertLibByID(String expertSeq) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("EXPERT_SEQ", expertSeq);
		@SuppressWarnings("unchecked")
		List<ExpertLibDto> list = getSqlMapClientTemplate().queryForList(
				"queryExpertLibByID", paramMap);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<ExpertLibDto> queryAllExpertLib() {
		@SuppressWarnings("unchecked")
		List<ExpertLibDto> list = getSqlMapClientTemplate().queryForList(
				"queryAllExpertLib");
		return list;
	}

	@Override
	public void insertExpertLib(ExpertLibDto expertLib) {
		getSqlMapClientTemplate().insert("insertExpertLib", expertLib);
	}

	@Override
	public void updateExpertLib(ExpertLibDto expertLib) {
		getSqlMapClientTemplate().update("updateExpertLib", expertLib);
	}

	@Override
	public List<ExpertLibDto> queryAllExpertLibExportOr(String expertName,
			String strExpertMajor) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("EXPERT_NAME", expertName);
		paramMap.put("EXPERT_MAJOR", strExpertMajor);
		@SuppressWarnings("unchecked")
		List<ExpertLibDto> list = getSqlMapClientTemplate().queryForList(
				"queryAllExpertLibExportOr", paramMap);
		return list;
	}

	@Override
	public List<ExpertLibDto> queryAllExpertLibExportAnd(String expertName,
			String strExpertMajor) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("EXPERT_NAME", expertName);
		paramMap.put("EXPERT_MAJOR", strExpertMajor);
		@SuppressWarnings("unchecked")
		List<ExpertLibDto> list = getSqlMapClientTemplate().queryForList(
				"queryAllExpertLibExportAnd", paramMap);
		return list;
	}

	@Override
	public List<ExpertLibDto> queryExpertComp() {
		@SuppressWarnings("unchecked")
		List<ExpertLibDto> list = getSqlMapClientTemplate().queryForList(
				"queryExpertComp");
		return list;
	}
}
