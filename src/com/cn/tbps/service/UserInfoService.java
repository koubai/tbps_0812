package com.cn.tbps.service;

import java.util.List;

import com.cn.common.util.Page;
import com.cn.tbps.dto.UserInfoDto;

/**
 * @name UserInfoService.java
 * @author Frank
 * @time 2013-10-10下午10:25:50
 * @version 1.0
 */
public interface UserInfoService {

	/**
	 * 根据登录ID查询用户
	 * @param login_id
	 * @return
	 */
	public UserInfoDto queryUserByID(String login_id);
	
	/**
	 * 翻页查询用户
	 * @param page
	 * @param login_name
	 * @return
	 */
	public Page queryUserByPage(Page page, String login_name);
	
	/**
	 * 查询所有用户
	 * @return
	 */
	public List<UserInfoDto> queryAllUser();
	
	/**
	 * 删除用户
	 * @param login_id
	 */
	public void deleteUser(String login_id);
	
	/**
	 * 新增用户
	 * @param userInfo
	 */
	public void insertUser(UserInfoDto userInfo);
	
	/**
	 * 修改用户
	 * @param userInfo
	 */
	public void updateUser(UserInfoDto userInfo);
}
