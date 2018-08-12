package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.tbps.dao.AuditCntrctDao;
import com.cn.tbps.dto.AuditCntrctDto;

public class AuditCntrctDaoImpl extends BaseDao implements AuditCntrctDao {

	@Override
	public int queryAuditCntrctCountByPage(String CNTRCT_NAME, String CNTRCT_TYPE) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("CNTRCT_NAME", CNTRCT_NAME);
		paramMap.put("CNTRCT_TYPE", CNTRCT_TYPE);
		return (Integer) getSqlMapClientTemplate().queryForObject("queryAuditCntrctCountByPage", paramMap);
	}

	@Override
	public List<AuditCntrctDto> queryAuditCntrctByPage(String CNTRCT_NAME, String CNTRCT_TYPE, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("CNTRCT_NAME", CNTRCT_NAME);
		paramMap.put("CNTRCT_TYPE", CNTRCT_TYPE);
		@SuppressWarnings("unchecked")
		List<AuditCntrctDto> list = getSqlMapClientTemplate().queryForList("queryAuditCntrctByPage", paramMap);
		return list;
	}

	@Override
	public AuditCntrctDto queryAuditCntrctByID(String CNTRCT_NO) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("CNTRCT_NO", CNTRCT_NO);
		@SuppressWarnings("unchecked")
		List<AuditCntrctDto> list = getSqlMapClientTemplate().queryForList("queryAuditCntrctByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void insertAuditCntrct(AuditCntrctDto auditCntrct) {
		getSqlMapClientTemplate().insert("insertAuditCntrct", auditCntrct);
	}

	@Override
	public void updateAuditCntrct(AuditCntrctDto auditCntrct) {
		getSqlMapClientTemplate().update("updateAuditCntrct", auditCntrct);
	}
}
