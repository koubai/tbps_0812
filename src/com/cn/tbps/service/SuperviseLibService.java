package com.cn.tbps.service;

import java.util.List;

import com.cn.common.util.Page;
import com.cn.tbps.dto.SuperviseLibDto;

/**
 * @name SuperviseLibService.java
 * @author Frank
 * @time 2013-10-19下午9:10:41
 * @version 1.0
 */
public interface SuperviseLibService {
	
	public List<SuperviseLibDto> queryAllSuperviseLib();
	
	/**
	 * 翻页查询会审监管人信息
	 * @param SUPERVISE_NAME
	 * @param page
	 * @return
	 */
	public Page querySuperviseLibByPage(String SUPERVISE_NAME, Page page);
	
	/**
	 * 根据ID查询评审会审监管人列表
	 * @param ids
	 * @return
	 */
	public List<SuperviseLibDto> querySuperviseLibByIds(String ids);

	/**
	 * 根据ID查询会审监管人信息
	 * @param id
	 * @return
	 */
	public SuperviseLibDto querySuperviseLibByID(String id);
	
	/**
	 * 逻辑删除会审监管人信息
	 * @param id
	 * @param userid
	 */
	public void deleteSuperviseLib(String id, String userid);
	
	/**
	 * 新增会审监管人信息
	 * @param superviseLib
	 */
	public void insertSuperviseLib(SuperviseLibDto superviseLib);
	
	/**
	 * 修改会审监管人信息
	 * @param superviseLib
	 */
	public void updateSuperviseLib(SuperviseLibDto superviseLib);
}
