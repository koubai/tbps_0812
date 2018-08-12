package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.tbps.dao.BidCompApplyDao;
import com.cn.tbps.dto.BidCompApplyDto;

/**
 * @name BidCompApplyDaoImpl.java
 * @author Frank
 * @time 2016-5-26下午10:05:43
 * @version 1.0
 */
public class BidCompApplyDaoImpl extends BaseDao implements BidCompApplyDao {

	@Override
	public List<BidCompApplyDto> queryBidCompApplyByBidCoNo(String bidCoNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_CO_NO", bidCoNo);
		@SuppressWarnings("unchecked")
		List<BidCompApplyDto> list = getSqlMapClientTemplate().queryForList("queryBidCompApplyByBidCoNo", paramMap);
		return list;
	}

	@Override
	public BidCompApplyDto queryBidCompApplyByID(String id) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ID", id);
		@SuppressWarnings("unchecked")
		List<BidCompApplyDto> list = getSqlMapClientTemplate().queryForList("queryBidCompApplyByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public BidCompApplyDto queryBidCompApplyByRequire(String BID_NO,
			String BID_CO_NO, String APPLY_REQUIRE) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_NO", BID_NO);
		paramMap.put("BID_CO_NO", BID_CO_NO);
		paramMap.put("APPLY_REQUIRE", APPLY_REQUIRE);
//		System.out.println("APPLY_REQUIRE:" + APPLY_REQUIRE + "<-");
		@SuppressWarnings("unchecked")
		List<BidCompApplyDto> list = getSqlMapClientTemplate().queryForList("queryBidCompApplyByRequire", paramMap);
		if(list != null && list.size() > 0) {
//			System.out.println("APPLY_REQUIRE2:" + list.get(0).getAPPLY_REQUIRE() + "<-");
			return list.get(0);
		}
		return null;
	}

	@Override
	public void insertBidCompApply(BidCompApplyDto bidCompApply) {
		getSqlMapClientTemplate().insert("insertBidCompApply", bidCompApply);
	}

	@Override
	public void delBidCompApplyByBidCoNo(String bidNo, String bidCoNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_NO", bidNo);
		paramMap.put("BID_CO_NO", bidCoNo);
		getSqlMapClientTemplate().delete("delBidCompApplyByBidCoNo", paramMap);
	}

	@Override
	public void updBidCompApplyStatusByBidCoNo(String bidNo, String bidCoNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_NO", bidNo);
		paramMap.put("BID_CO_NO", bidCoNo);
		getSqlMapClientTemplate().update("updBidCompApplyStatusByBidCoNo", paramMap);
	}

	@Override
	public void updBidCompApply(BidCompApplyDto bidCompApply) {
		getSqlMapClientTemplate().update("updBidCompApply", bidCompApply);
	}
}
