package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.tbps.dao.SuperviseLibDao;
import com.cn.tbps.dto.SuperviseLibDto;

public class SuperviseLibDaoImpl extends BaseDao implements SuperviseLibDao {
	
	@Override
	public List<SuperviseLibDto> queryAllSuperviseLib() {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		@SuppressWarnings("unchecked")
		List<SuperviseLibDto> list = getSqlMapClientTemplate().queryForList(
				"queryAllSuperviseLib", paramMap);
		return list;
	}

	@Override
	public List<SuperviseLibDto> querySuperviseLibByPage(String SUPERVISE_NAME, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("SUPERVISE_NAME", SUPERVISE_NAME);
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<SuperviseLibDto> list = getSqlMapClientTemplate().queryForList(
				"querySuperviseLibByPage", paramMap);
		return list;
	}

	@Override
	public int querySuperviseLibCountByPage(String SUPERVISE_NAME) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("SUPERVISE_NAME", SUPERVISE_NAME);
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"querySuperviseLibCountByPage", paramMap);
	}

	@Override
	public List<SuperviseLibDto> querySuperviseLibByIds(String ids) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("IDS", ids);
		@SuppressWarnings("unchecked")
		List<SuperviseLibDto> list = getSqlMapClientTemplate().queryForList(
				"querySuperviseLibByIds", paramMap);
		return list;
	}

	@Override
	public SuperviseLibDto querySuperviseLibByID(String id) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("SUPERVISE_SEQ", id);
		@SuppressWarnings("unchecked")
		List<SuperviseLibDto> list = getSqlMapClientTemplate().queryForList(
				"querySuperviseLibByID", paramMap);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void insertSuperviseLib(SuperviseLibDto superviseLib) {
		getSqlMapClientTemplate().insert("insertSuperviseLib", superviseLib);
	}

	@Override
	public void updateSuperviseLib(SuperviseLibDto superviseLib) {
		getSqlMapClientTemplate().update("updateSuperviseLib", superviseLib);
	}
}
