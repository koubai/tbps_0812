package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.tbps.dao.BondDao;
import com.cn.tbps.dto.BondDetailDto;
import com.cn.tbps.dto.BondDto;
import com.cn.tbps.dto.BondExtendDto;

/**
 * @name BondDaoImpl.java
 * @author Frank
 * @time 2014-2-20上午1:36:10
 * @version 1.0
 */
public class BondDaoImpl extends BaseDao implements BondDao {

	@Override
	public List<BondDto> queryBondByAgentNo(String AGENT_NO, String tenderOpenDateLow, String tenderOpenDateHigh) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("AGENT_NO", AGENT_NO);
		paramMap.put("tenderOpenDateLow", tenderOpenDateLow);
		paramMap.put("tenderOpenDateHigh", tenderOpenDateHigh);
		@SuppressWarnings("unchecked")
		List<BondDto> list = getSqlMapClientTemplate().queryForList("queryBondByAgentNo", paramMap);
		return list;
	}

	@Override
	public List<BondDetailDto> queryBondDetailByAgentNo(String AGENT_NO, String tenderOpenDateLow, String tenderOpenDateHigh) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("AGENT_NO", AGENT_NO);
		paramMap.put("tenderOpenDateLow", tenderOpenDateLow);
		paramMap.put("tenderOpenDateHigh", tenderOpenDateHigh);
		@SuppressWarnings("unchecked")
		List<BondDetailDto> list = getSqlMapClientTemplate().queryForList("queryBondDetailByAgentNo", paramMap);
		return list;
	}

	@Override
	public List<BondDto> queryAllBondGroupByAgentNo(String AGENT_NO, String projectType, String tenderOpenDateLow, String tenderOpenDateHigh) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("AGENT_NO", AGENT_NO);
		paramMap.put("PROJECT_TYPE", projectType);
		paramMap.put("tenderOpenDateLow", tenderOpenDateLow);
		paramMap.put("tenderOpenDateHigh", tenderOpenDateHigh);
		@SuppressWarnings("unchecked")
		List<BondDto> list = getSqlMapClientTemplate().queryForList("queryAllBondGroupByAgentNo", paramMap);
		return list;
	}

	@Override
	public List<BondExtendDto> queryAllBondByBidNo(String AGENT_NO, String projectType, String tenderOpenDateLow, String tenderOpenDateHigh,
			String dateStart, String dateEnd) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("AGENT_NO", AGENT_NO);
		paramMap.put("PROJECT_TYPE", projectType);
		paramMap.put("tenderOpenDateLow", tenderOpenDateLow);
		paramMap.put("tenderOpenDateHigh", tenderOpenDateHigh);
		paramMap.put("reserveDate2Low", dateStart);
		paramMap.put("reserveDate2High", dateEnd);
		@SuppressWarnings("unchecked")
		List<BondExtendDto> list = getSqlMapClientTemplate().queryForList("queryAllBondByBidNo", paramMap);
		return list;
	}
}
