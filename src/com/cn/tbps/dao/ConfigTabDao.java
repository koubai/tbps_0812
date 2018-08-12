package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.ConfigTabDto;

/**
 * @name ConfigTabDao.java
 * @author Frank
 * @time 2014-1-19下午3:27:47
 * @version 1.0
 */
public interface ConfigTabDao {
	
	/**
	 * 根据类型查询配置数据
	 * @param type
	 * @return
	 */
	public List<ConfigTabDto> queryConfigTabByType(String type);
	
	/**
	 * 根据ID查询配置表记录
	 * @param id
	 * @return
	 */
	public ConfigTabDto queryConfigTabByID(String id);
	
	/**
	 * 根据key和类型查询配置表记录
	 * @param key
	 * @param type 类型
	 * @return
	 */
	public ConfigTabDto queryConfigTabByKey(String key, String type);
	
	/**
	 * 根据ID删除配置记录
	 * @param id
	 */
	public void deleteConfigTab(String id);
	
	/**
	 * 新增配置记录
	 * @param configTab
	 */
	public void insertConfigTab(ConfigTabDto configTab);
	
	/**
	 * 修改配置记录
	 * @param configTab
	 */
	public void updateConfigTab(ConfigTabDto configTab);
}
