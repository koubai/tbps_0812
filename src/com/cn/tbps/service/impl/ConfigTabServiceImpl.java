package com.cn.tbps.service.impl;

import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.tbps.dao.ConfigTabDao;
import com.cn.tbps.dto.ConfigTabDto;
import com.cn.tbps.service.ConfigTabService;

/**
 * @name ConfigTabServiceImpl.java
 * @author Frank
 * @time 2014-1-19下午3:35:42
 * @version 1.0
 */
public class ConfigTabServiceImpl extends BaseService implements ConfigTabService {
	
	private ConfigTabDao configTabDao;
	
	@Override
	public List<ConfigTabDto> queryConfigTabByType(String type) {
		return configTabDao.queryConfigTabByType(type);
	}

	@Override
	public ConfigTabDto queryConfigTabByID(String id) {
		return configTabDao.queryConfigTabByID(id);
	}

	@Override
	public ConfigTabDto queryConfigTabByKey(String key, String type) {
		return configTabDao.queryConfigTabByKey(key, type);
	}

	@Override
	public void deleteConfigTab(String id) {
		configTabDao.deleteConfigTab(id);
	}

	@Override
	public void insertConfigTab(ConfigTabDto configTab) {
		configTabDao.insertConfigTab(configTab);
	}

	@Override
	public void updateConfigTab(ConfigTabDto configTab) {
		configTabDao.updateConfigTab(configTab);
	}

	public ConfigTabDao getConfigTabDao() {
		return configTabDao;
	}

	public void setConfigTabDao(ConfigTabDao configTabDao) {
		this.configTabDao = configTabDao;
	}
}
