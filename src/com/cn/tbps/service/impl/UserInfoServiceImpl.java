package com.cn.tbps.service.impl;

import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.common.util.MD5Util;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.UserInfoDao;
import com.cn.tbps.dto.UserInfoDto;
import com.cn.tbps.service.UserInfoService;

/**
 * @name UserInfoServiceImpl.java
 * @author Frank
 * @time 2013-10-10下午10:25:45
 * @version 1.0
 */
public class UserInfoServiceImpl extends BaseService implements UserInfoService {
	
	private UserInfoDao userInfoDao;
	
	@Override
	public Page queryUserByPage(Page page, String login_name) {
		login_name = StringUtil.replaceDatabaseKeyword_mysql(login_name);
		//查询总记录数
		int totalCount = userInfoDao.queryUserCountByPage(login_name);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<UserInfoDto> list = userInfoDao.queryUserByPage(login_name,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}

	@Override
	public List<UserInfoDto> queryAllUser() {
		return userInfoDao.queryAllUser();
	}

	@Override
	public void deleteUser(String login_id) {
		userInfoDao.deleteUser(login_id);
	}
	
	@Override
	public void insertUser(UserInfoDto userInfo) {
		userInfo.setLOGIN_PW(MD5Util.md5(userInfo.getLOGIN_PW()));
		userInfoDao.insertUser(userInfo);
	}

	@Override
	public void updateUser(UserInfoDto userInfo) {
		userInfo.setLOGIN_PW(MD5Util.md5(userInfo.getLOGIN_PW()));
		userInfoDao.updateUser(userInfo);
	}

	@Override
	public UserInfoDto queryUserByID(String login_id) {
		return userInfoDao.queryUserByID(login_id);
	}

	public UserInfoDao getUserInfoDao() {
		return userInfoDao;
	}

	public void setUserInfoDao(UserInfoDao userInfoDao) {
		this.userInfoDao = userInfoDao;
	}
}
