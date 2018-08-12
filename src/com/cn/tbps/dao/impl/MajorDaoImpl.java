package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.tbps.dao.MajorDao;
import com.cn.tbps.dto.MajorDto;

/**
 * @name MajorDao.java
 * @author Frank
 * @time 2016-7-19下午9:24:15
 * @version 1.0
 */
public class MajorDaoImpl extends BaseDao implements MajorDao {

	@Override
	public List<MajorDto> queryMajorByPage(String MAJORCODE, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("MAJORCODE", MAJORCODE);
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<MajorDto> list = getSqlMapClientTemplate().queryForList("queryMajorByPage", paramMap);
		return list;
	}

	@Override
	public int queryMajorCountByPage(String MAJORCODE) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("MAJORCODE", MAJORCODE);
		return (Integer) getSqlMapClientTemplate().queryForObject("queryMajorCountByPage", paramMap);
	}

	@Override
	public MajorDto queryMajorByID(String ID) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ID", ID);
		@SuppressWarnings("unchecked")
		List<MajorDto> list = getSqlMapClientTemplate().queryForList("queryMajorByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public MajorDto queryMajorByCode(String code) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("MAJORCODE", code);
		@SuppressWarnings("unchecked")
		List<MajorDto> list = getSqlMapClientTemplate().queryForList("queryMajorByCode", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<MajorDto> queryAllMajor(String MAJORTYPE, String MAJORCODE) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("MAJORTYPE", MAJORTYPE);
		paramMap.put("MAJORCODE", MAJORCODE);
		@SuppressWarnings("unchecked")
		List<MajorDto> list = getSqlMapClientTemplate().queryForList("queryAllMajor", paramMap);
		return list;
	}

	@Override
	public void insertMajor(MajorDto major) {
		getSqlMapClientTemplate().insert("insertMajor", major);
	}

	@Override
	public void updateMajor(MajorDto major) {
		getSqlMapClientTemplate().update("updateMajor", major);
	}
}
