package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.SuperviseLibDto;

/**
 * @name SuperviseLibDao.java
 * @author Frank
 * @time 2013-10-19下午9:10:41
 * @version 1.0
 */
public interface SuperviseLibDao {
	
	public List<SuperviseLibDto> queryAllSuperviseLib();
	
	/**
	 * 翻页查询会审监管人信息
	 * @param SUPERVISE_NAME
	 * @param start
	 * @param end
	 * @return
	 */
	public List<SuperviseLibDto> querySuperviseLibByPage(String SUPERVISE_NAME, int start, int end);
	
	/**
	 * 查询总记录数
	 * @param SUPERVISE_NAME
	 * @return
	 */
	public int querySuperviseLibCountByPage(String SUPERVISE_NAME);
	
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
