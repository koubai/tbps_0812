package com.cn.tbps.service;

import java.util.List;

import com.cn.common.util.Page;
import com.cn.tbps.dto.MajorDto;

/**
 * @name MajorService.java
 * @author Frank
 * @time 2016-7-19下午9:30:51
 * @version 1.0
 */
public interface MajorService {

	/**
	 * 翻页查询数据
	 * @param MAJORCODE
	 * @param page
	 * @return
	 */
	public Page queryMajorByPage(String MAJORCODE, Page page);
	
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