package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.tbps.dao.BidCntrctDao;
import com.cn.tbps.dto.BidCntrctDto;

public class BidCntrctDaoImpl extends BaseDao implements BidCntrctDao {

	@Override
	public int queryBidCntrctCountByPage(String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO,
			String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_ST_DATE, String CNTRCT_ED_DATE) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("CNTRCT_YEAR", CNTRCT_YEAR);
		paramMap.put("CNTRCT_NO", CNTRCT_NO);
		paramMap.put("BID_COMP_NO", BID_COMP_NO);
		paramMap.put("CNTRCT_NAME", CNTRCT_NAME);
		paramMap.put("CNTRCT_TYPE", CNTRCT_TYPE);
		paramMap.put("CNTRCT_ST_DATE", CNTRCT_ST_DATE);
		paramMap.put("CNTRCT_ED_DATE", CNTRCT_ED_DATE);
		return (Integer) getSqlMapClientTemplate().queryForObject("queryBidCntrctCountByPage", paramMap);
	}

	@Override
	public List<BidCntrctDto> queryBidCntrctByPage(String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO,
			String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("CNTRCT_YEAR", CNTRCT_YEAR);
		paramMap.put("CNTRCT_NO", CNTRCT_NO);
		paramMap.put("BID_COMP_NO", BID_COMP_NO);
		paramMap.put("CNTRCT_NAME", CNTRCT_NAME);
		paramMap.put("CNTRCT_TYPE", CNTRCT_TYPE);
		paramMap.put("CNTRCT_ST_DATE", CNTRCT_ST_DATE);
		paramMap.put("CNTRCT_ED_DATE", CNTRCT_ED_DATE);
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<BidCntrctDto> list = getSqlMapClientTemplate().queryForList("queryBidCntrctByPage", paramMap);
		return list;
	}

	@Override
	public BidCntrctDto queryBidCntrctByID(String CNTRCT_NO) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("CNTRCT_NO", CNTRCT_NO);
		@SuppressWarnings("unchecked")
		List<BidCntrctDto> list = getSqlMapClientTemplate().queryForList("queryBidCntrctByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void insertBidCntrct(BidCntrctDto bidCntrct) {
		getSqlMapClientTemplate().insert("insertBidCntrct", bidCntrct);
	}

	@Override
	public void updateBidCntrct(BidCntrctDto bidCntrct) {
		getSqlMapClientTemplate().update("updateBidCntrct", bidCntrct);
	}
}
