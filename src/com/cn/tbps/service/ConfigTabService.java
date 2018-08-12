package com.cn.tbps.service;

import java.util.List;

import com.cn.tbps.dto.ConfigTabDto;

/**
 * @name ConfigTabService.java
 * @author Frank
 * @time 2014-1-19下午3:34:54
 * @version 1.0
 */
public interface ConfigTabService {
	
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
	 * @param type
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
