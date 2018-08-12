package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.tbps.dao.BidCntrctDao;
import com.cn.tbps.dto.BidCntrctDto;

public class BidCntrctDaoImpl extends BaseDao implements BidCntrctDao {

	@Override
	public int queryBidCntrctCountByPage(String CNTRCT_NAME, String CNTRCT_TYPE) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("CNTRCT_NAME", CNTRCT_NAME);
		paramMap.put("CNTRCT_TYPE", CNTRCT_TYPE);
		return (Integer) getSqlMapClientTemplate().queryForObject("queryBidCntrctCountByPage", paramMap);
	}

	@Override
	public List<BidCntrctDto> queryBidCntrctByPage(String CNTRCT_NAME, String CNTRCT_TYPE, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("CNTRCT_NAME", CNTRCT_NAME);
		paramMap.put("CNTRCT_TYPE", CNTRCT_TYPE);
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
