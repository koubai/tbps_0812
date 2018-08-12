package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.tbps.dao.ConfigTabDao;
import com.cn.tbps.dto.ConfigTabDto;

/**
 * @name ConfigTabDaoImpl.java
 * @author Frank
 * @time 2014-1-19下午3:34:02
 * @version 1.0
 */
public class ConfigTabDaoImpl extends BaseDao implements ConfigTabDao {
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ConfigTabDto> queryConfigTabByType(String type) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("CONFIG_TYPE", type);
		return (List<ConfigTabDto>) getSqlMapClientTemplate().queryForList("queryConfigTabByType", paramMap);
	}

	@Override
	public ConfigTabDto queryConfigTabByID(String id) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ID", id);
		@SuppressWarnings("unchecked")
		List<ConfigTabDto> list = getSqlMapClientTemplate().queryForList("queryConfigTabByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public ConfigTabDto queryConfigTabByKey(String key, String type) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("CONFIG_KEY", key);
		paramMap.put("CONFIG_TYPE", type);
		@SuppressWarnings("unchecked")
		List<ConfigTabDto> list = getSqlMapClientTemplate().queryForList("queryConfigTabByKey", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void deleteConfigTab(String id) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ID", id);
		getSqlMapClientTemplate().delete("deleteConfigTab", paramMap);
	}

	@Override
	public void insertConfigTab(ConfigTabDto configTab) {
		getSqlMapClientTemplate().insert("insertConfigTab", configTab);
	}

	@Override
	public void updateConfigTab(ConfigTabDto configTab) {
		getSqlMapClientTemplate().update("updateConfigTab", configTab);
	}
}
