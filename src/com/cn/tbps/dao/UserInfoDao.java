package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.UserInfoDto;

/**
 * @name UserInfoDao.java
 * @author Frank
 * @time 2013-10-10下午10:26:07
 * @version 1.0
 */
public interface UserInfoDao {
	
	/**
	 * 翻页查询用户
	 * @param login_name
	 * @param start
	 * @param end
	 * @return
	 */
	public List<UserInfoDto> queryUserByPage(String login_name, int start, int end);
	
	/**
	 * 查询总记录数
	 * @param login_name
	 * @return
	 */
	public int queryUserCountByPage(String login_name);

	/**
	 * 根据登录ID查询用户
	 * @param login_id
	 * @return
	 */
	public UserInfoDto queryUserByID(String login_id);
	
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
