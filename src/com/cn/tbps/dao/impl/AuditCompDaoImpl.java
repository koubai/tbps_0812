package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.AuditCompDao;
import com.cn.tbps.dto.AuditCompDto;

/**
 * @name AuditCompDaoImpl.java
 * @author Pei
 * @time 2016-07-02
 * @version 1.0
 */
public class AuditCompDaoImpl extends BaseDao implements AuditCompDao {
	
	@Override
	public List<AuditCompDto> queryAuditCompByPage(String auditCompNo, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		//这里按照需求，若委托公司名称存在，则忽略委托公司代码按委托公司来查询。
		if(StringUtil.isNotBlank(auditCompNo)) {
			paramMap.put("AUDIT_COMP_NO", StringUtil.replaceDatabaseKeyword_mysql(auditCompNo));
		} 
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<AuditCompDto> list = getSqlMapClientTemplate().queryForList("queryAuditCompByPage", paramMap);
		return list;
	}

	@Override
	public int queryAuditCompCountByPage(String auditCompNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(StringUtil.isNotBlank(auditCompNo)) {
			paramMap.put("AUDIT_COMP_NO", StringUtil.replaceDatabaseKeyword_mysql(auditCompNo));
		}
		return (Integer) getSqlMapClientTemplate().queryForObject("queryAuditCompCountByPage", paramMap);
	}

	@Override
	public AuditCompDto queryAuditCompByID(String auditCompNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("AUDIT_COMP_NO", auditCompNo);
		@SuppressWarnings("unchecked")
		List<AuditCompDto> list = getSqlMapClientTemplate().queryForList("queryAuditCompByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public AuditCompDto queryAllAuditCompByID(String auditCompNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("AUDIT_COMP_NO", auditCompNo);
		@SuppressWarnings("unchecked")
		List<AuditCompDto> list = getSqlMapClientTemplate().queryForList("queryAllAuditCompByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<AuditCompDto> queryAllAuditComp() {
		@SuppressWarnings("unchecked")
		List<AuditCompDto> list = getSqlMapClientTemplate().queryForList("queryAllAuditComp");
		return list;
	}

	@Override
	public void insertAuditComp(AuditCompDto auditComp) {
		getSqlMapClientTemplate().insert("insertAuditComp", auditComp);
	}

	@Override
	public void updateAuditComp(AuditCompDto auditComp) {
		getSqlMapClientTemplate().update("updateAuditComp", auditComp);
	}
}
