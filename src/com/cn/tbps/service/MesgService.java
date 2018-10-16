package com.cn.tbps.service;

import java.util.List;

import com.cn.common.util.Page;
import com.cn.tbps.dto.MesgDto;

/**
 * @name MesgService.java
 * @author Frank
 * @time 2018-10-14下午9:20:42
 * @version 1.0
 */
public interface MesgService {

	/**
	 * 翻页查询数据
	 * @param MSG_TYPE
	 * @param SEND_USER
	 * @param RECEIVE_USER
	 * @param SEND_STATUS
	 * @param RECEIVE_STATUS
	 * @param page
	 * @return
	 */
	public Page queryMesgByPage(String MSG_TYPE, String SEND_USER, String RECEIVE_USER,
			String SEND_STATUS, String RECEIVE_STATUS, Page page);
	
	/**
	 * 根据ID查询数据
	 * @param MSG_SEQ
	 * @return
	 */
	public MesgDto queryMesgByID(String MSG_SEQ);
	
	/**
	 * 查询所有数据
	 * @param SEND_USER
	 * @param RECEIVE_USER
	 * @param SEND_STATUS
	 * @param RECEIVE_STATUS
	 * @return
	 */
	public List<MesgDto> queryAllMesg(String SEND_USER, String RECEIVE_USER, String SEND_STATUS, String RECEIVE_STATUS);
	
	/**
	 * 新增数据
	 * @param mesg
	 */
	public void insertMesg(MesgDto mesg);
	
	/**
	 * 修改数据
	 * @param mesg
	 */
	public void updateMesg(MesgDto mesg);
}
