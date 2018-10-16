package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.tbps.dao.MesgDao;
import com.cn.tbps.dto.MesgDto;

public class MesgDaoImpl extends BaseDao implements MesgDao {

	@Override
	public List<MesgDto> queryMesgByPage(String MSG_TYPE, String SEND_USER, String RECEIVE_USER, String SEND_STATUS,
			String RECEIVE_STATUS, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("MSG_TYPE", MSG_TYPE);
		paramMap.put("SEND_USER", SEND_USER);
		paramMap.put("RECEIVE_USER", RECEIVE_USER);
		paramMap.put("SEND_STATUS", SEND_STATUS);
		paramMap.put("RECEIVE_STATUS", RECEIVE_STATUS);
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<MesgDto> list = getSqlMapClientTemplate().queryForList(
				"queryMesgByPage", paramMap);
		return list;
	}

	@Override
	public int queryMesgCountByPage(String MSG_TYPE, String SEND_USER, String RECEIVE_USER, String SEND_STATUS,
			String RECEIVE_STATUS) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("MSG_TYPE", MSG_TYPE);
		paramMap.put("SEND_USER", SEND_USER);
		paramMap.put("RECEIVE_USER", RECEIVE_USER);
		paramMap.put("SEND_STATUS", SEND_STATUS);
		paramMap.put("RECEIVE_STATUS", RECEIVE_STATUS);
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"queryMesgCountByPage", paramMap);
	}

	@Override
	public MesgDto queryMesgByID(String MSG_SEQ) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("MSG_SEQ", MSG_SEQ);
		@SuppressWarnings("unchecked")
		List<MesgDto> list = getSqlMapClientTemplate().queryForList("queryMesgByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<MesgDto> queryAllMesg(String SEND_USER, String RECEIVE_USER, String SEND_STATUS,
			String RECEIVE_STATUS) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("SEND_USER", SEND_USER);
		paramMap.put("RECEIVE_USER", RECEIVE_USER);
		paramMap.put("SEND_STATUS", SEND_STATUS);
		paramMap.put("RECEIVE_STATUS", RECEIVE_STATUS);
		@SuppressWarnings("unchecked")
		List<MesgDto> list = getSqlMapClientTemplate().queryForList("queryAllMesg", paramMap);
		return list;
	}

	@Override
	public void insertMesg(MesgDto mesg) {
		getSqlMapClientTemplate().insert("insertMesg", mesg);
	}

	@Override
	public void updateMesg(MesgDto mesg) {
		getSqlMapClientTemplate().update("updateMesg", mesg);
	}
}
