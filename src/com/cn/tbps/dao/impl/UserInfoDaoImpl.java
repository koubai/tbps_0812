package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.tbps.dao.UserInfoDao;
import com.cn.tbps.dto.UserInfoDto;

/**
 * @name UserInfoDaoImpl.java
 * @author Frank
 * @time 2013-10-10下午10:26:13
 * @version 1.0
 */
public class UserInfoDaoImpl extends BaseDao implements UserInfoDao {

	@Override
	public UserInfoDto queryUserByID(String login_id) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("LOGIN_ID", login_id);
		@SuppressWarnings("unchecked")
		List<UserInfoDto> list = getSqlMapClientTemplate().queryForList("queryUserByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<UserInfoDto> queryUserByPage(String login_name, int start,
			int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("login_name", login_name);
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<UserInfoDto> list = getSqlMapClientTemplate().queryForList("queryUserByPage", paramMap);
		return list;
	}

	@Override
	public int queryUserCountByPage(String login_name) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("login_name", login_name);
		return (Integer) getSqlMapClientTemplate().queryForObject("queryUserCountByPage", paramMap);
	}

	@Override
	public List<UserInfoDto> queryAllUser() {
		@SuppressWarnings("unchecked")
		List<UserInfoDto> list = getSqlMapClientTemplate().queryForList("queryAllUser");
		return list;
	}

	@Override
	public void insertUser(UserInfoDto userInfo) {
		getSqlMapClientTemplate().insert("insertUser", userInfo);
	}

	@Override
	public void updateUser(UserInfoDto userInfo) {
		getSqlMapClientTemplate().update("updateUser", userInfo);
	}

	@Override
	public void deleteUser(String login_id) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("LOGIN_ID", login_id);
		getSqlMapClientTemplate().delete("deleteUser", paramMap);
	}
}
