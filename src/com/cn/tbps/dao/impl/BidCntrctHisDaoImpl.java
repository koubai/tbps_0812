package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.tbps.dao.BidCntrctHisDao;
import com.cn.tbps.dto.BidCntrctHisDto;

public class BidCntrctHisDaoImpl extends BaseDao implements BidCntrctHisDao {

	@Override
	public int queryBidCntrctHisCountByPage(String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_NO) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("CNTRCT_NAME", CNTRCT_NAME);
		paramMap.put("CNTRCT_TYPE", CNTRCT_TYPE);
		paramMap.put("CNTRCT_NO", CNTRCT_NO);
		return (Integer) getSqlMapClientTemplate().queryForObject("queryBidCntrctHisCountByPage", paramMap);
	}

	@Override
	public List<BidCntrctHisDto> queryBidCntrctHisByPage(String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_NO, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("CNTRCT_NAME", CNTRCT_NAME);
		paramMap.put("CNTRCT_TYPE", CNTRCT_TYPE);
		paramMap.put("CNTRCT_NO", CNTRCT_NO);
		@SuppressWarnings("unchecked")
		List<BidCntrctHisDto> list = getSqlMapClientTemplate().queryForList("queryBidCntrctHisByPage", paramMap);
		return list;
	}

	@Override
	public BidCntrctHisDto queryBidCntrctHisByID(String BID_CNTRCT_HIS_SEQ) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_CNTRCT_HIS_SEQ", BID_CNTRCT_HIS_SEQ);
		@SuppressWarnings("unchecked")
		List<BidCntrctHisDto> list = getSqlMapClientTemplate().queryForList("queryBidCntrctHisByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void insertBidCntrctHis(BidCntrctHisDto bidCntrctHis) {
		getSqlMapClientTemplate().insert("insertBidCntrctHis", bidCntrctHis);
	}
}
