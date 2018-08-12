package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.MajorDto;

/**
 * @name MajorDao.java
 * @author Frank
 * @time 2016-7-19下午9:20:42
 * @version 1.0
 */
public interface MajorDao {

	/**
	 * 翻页查询数据
	 * @param MAJORCODE
	 * @param start
	 * @param end
	 * @return
	 */
	public List<MajorDto> queryMajorByPage(String MAJORCODE, int start, int end);
	
	/**
	 * 查询总记录数
	 * @param MAJORCODE
	 * @return
	 */
	public int queryMajorCountByPage(String MAJORCODE);
	
	/**
	 * 根据ID查询数据
	 * @param ID
	 * @return
	 */
	public MajorDto queryMajorByID(String ID);
	
	/**
	 * 根据code查询数据
	 * @param code
	 * @return
	 */
	public MajorDto queryMajorByCode(String code);
	
	/**
	 * 查询所有数据
	 * @param MAJORTYPE
	 * @param MAJORCODE
	 * @return
	 */
	public List<MajorDto> queryAllMajor(String MAJORTYPE, String MAJORCODE);
	
	/**
	 * 新增数据
	 * @param major
	 */
	public void insertMajor(MajorDto major);
	
	/**
	 * 修改数据
	 * @param major
	 */
	public void updateMajor(MajorDto major);
}
