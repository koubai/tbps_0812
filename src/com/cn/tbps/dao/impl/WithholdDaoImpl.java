package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.tbps.dao.WithholdDao;
import com.cn.tbps.dto.SettlementDto;
import com.cn.tbps.dto.WithholdDto;

/**
 * @name WithholdDaoImpl.java
 * @author Frank
 * @time 2013-11-25下午11:31:23
 * @version 1.0
 */
public class WithholdDaoImpl extends BaseDao implements WithholdDao {
	
	//费用结算清单
	@Override
	public List<SettlementDto> querySettlementExport(String billDateLow,
			String billDateHigh, String types, String agentNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BILL_DATE_LOW", billDateLow);
		paramMap.put("BILL_DATE_HIGH", billDateHigh);
		paramMap.put("DATA_TYPE", types);
		paramMap.put("AGENT_NO", agentNo);
		@SuppressWarnings("unchecked")
		List<SettlementDto> list = getSqlMapClientTemplate().queryForList("querySettlementExport", paramMap);
		return list;
	}

	//代扣
	@Override
	public List<WithholdDto> queryWithholdExport(String withholdDateLow,
			String withholdDateHigh, String withholdType) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("WITHHOLD_DATE_LOW", withholdDateLow);
		paramMap.put("WITHHOLD_DATE_HIGH", withholdDateHigh);
		paramMap.put("WITHHOLD_TYPE", withholdType);
		@SuppressWarnings("unchecked")
		List<WithholdDto> list = getSqlMapClientTemplate().queryForList("queryWithholdExport", paramMap);
		return list;
	}
	
	@Override
	public List<WithholdDto> queryWithholdByPage(String withholdDateLow,
			String withholdDateHigh, String withholdType, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("WITHHOLD_DATE_LOW", withholdDateLow);
		paramMap.put("WITHHOLD_DATE_HIGH", withholdDateHigh);
		paramMap.put("WITHHOLD_TYPE", withholdType);
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<WithholdDto> list = getSqlMapClientTemplate().queryForList("queryWithholdByPage", paramMap);
		return list;
	}

	@Override
	public int queryWithholdCountByPage(String withholdDateLow,
			String withholdDateHigh, String withholdType) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("WITHHOLD_DATE_LOW", withholdDateLow);
		paramMap.put("WITHHOLD_DATE_HIGH", withholdDateHigh);
		paramMap.put("WITHHOLD_TYPE", withholdType);
		return (Integer) getSqlMapClientTemplate().queryForObject("queryWithholdCountByPage", paramMap);
	}

	@Override
	public WithholdDto queryWithholdByID(String WITHHOLD_NO) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("WITHHOLD_NO", WITHHOLD_NO);
		@SuppressWarnings("unchecked")
		List<WithholdDto> list = getSqlMapClientTemplate().queryForList("queryWithholdByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public WithholdDto queryAllWithholdByID(String WITHHOLD_NO) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("WITHHOLD_NO", WITHHOLD_NO);
		@SuppressWarnings("unchecked")
		List<WithholdDto> list = getSqlMapClientTemplate().queryForList("queryAllWithholdByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void insertWithhold(WithholdDto withhold) {
		getSqlMapClientTemplate().insert("insertWithhold", withhold);
	}

	@Override
	public void delWithholdById(WithholdDto withhold) {
		getSqlMapClientTemplate().update("delWithholdById", withhold);
	}

	@Override
	public void updateWithhold(WithholdDto withhold) {
		getSqlMapClientTemplate().update("updateWithhold", withhold);
	}
}
