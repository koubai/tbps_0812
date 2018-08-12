package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.tbps.dao.AuditCntrctHisDao;
import com.cn.tbps.dto.AuditCntrctHisDto;

public class AuditCntrctHisDaoImpl extends BaseDao implements AuditCntrctHisDao {

	@Override
	public int queryAuditCntrctHisCountByPage(String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_NO) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("CNTRCT_NAME", CNTRCT_NAME);
		paramMap.put("CNTRCT_TYPE", CNTRCT_TYPE);
		paramMap.put("CNTRCT_NO", CNTRCT_NO);
		return (Integer) getSqlMapClientTemplate().queryForObject("queryAuditCntrctHisCountByPage", paramMap);
	}

	@Override
	public List<AuditCntrctHisDto> queryAuditCntrctHisByPage(String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_NO, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("CNTRCT_NAME", CNTRCT_NAME);
		paramMap.put("CNTRCT_TYPE", CNTRCT_TYPE);
		paramMap.put("CNTRCT_NO", CNTRCT_NO);
		@SuppressWarnings("unchecked")
		List<AuditCntrctHisDto> list = getSqlMapClientTemplate().queryForList("queryAuditCntrctHisByPage", paramMap);
		return list;
	}

	@Override
	public AuditCntrctHisDto queryAuditCntrctHisByID(String CNTRCT_HIST_SEQ) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("CNTRCT_HIST_SEQ", CNTRCT_HIST_SEQ);
		@SuppressWarnings("unchecked")
		List<AuditCntrctHisDto> list = getSqlMapClientTemplate().queryForList("queryAuditCntrctHisByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void insertAuditCntrctHis(AuditCntrctHisDto auditCntrctHis) {
		getSqlMapClientTemplate().insert("insertAuditCntrctHis", auditCntrctHis);
	}
}
