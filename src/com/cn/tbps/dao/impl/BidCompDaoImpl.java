package com.cn.tbps.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.common.util.Constants;
import com.cn.tbps.dao.BidCompDao;
import com.cn.tbps.dto.BidCompDto;

/**
 * @name BidCompDaoImpl.java
 * @author Frank
 * @time 2013-10-31下午11:42:32
 * @version 1.0
 */
public class BidCompDaoImpl extends BaseDao implements BidCompDao {
	
	@Override
	public void delBidCompByBidNo(String bidNo, String user) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("DELETE_FLG", Constants.IS_DELETE_DEL);
		paramMap.put("UPDATE_USER", user);
		paramMap.put("BID_NO", bidNo);
		getSqlMapClientTemplate().update("delBidCompByBidNo", paramMap);
	}
	
	@Override
	public List<BidCompDto> queryBidCompByIds(String ids) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("IDS", ids);
		@SuppressWarnings("unchecked")
		List<BidCompDto> list = getSqlMapClientTemplate().queryForList("queryBidCompByIds", paramMap);
		return list;
	}

	@Override
	public List<BidCompDto> queryBidCompByPage(String bidNo, String bidCoSeq,
			String bidCoNo, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_NO", bidNo);
		paramMap.put("BID_CO_SEQ", bidCoSeq);
		paramMap.put("BID_CO_NO", bidCoNo);
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<BidCompDto> list = getSqlMapClientTemplate().queryForList("queryBidCompByPage", paramMap);
		return list;
	}

	@Override
	public int queryBidCompCountByPage(String bidNo, String bidCoSeq,
			String bidCoNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_NO", bidNo);
		paramMap.put("BID_CO_SEQ", bidCoSeq);
		paramMap.put("BID_CO_NO", bidCoNo);
		return (Integer) getSqlMapClientTemplate().queryForObject("queryBidCompCountByPage", paramMap);
	}

	@Override
	public BidCompDto queryBidCompByID(String bidCoNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_CO_NO", bidCoNo);
		@SuppressWarnings("unchecked")
		List<BidCompDto> list = getSqlMapClientTemplate().queryForList("queryBidCompByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public BidCompDto queryAllBidCompByID(String bidCoNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_CO_NO", bidCoNo);
		@SuppressWarnings("unchecked")
		List<BidCompDto> list = getSqlMapClientTemplate().queryForList("queryAllBidCompByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<BidCompDto> queryBidCompByName(String bidCompName){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_CO_NAME", bidCompName);
		@SuppressWarnings("unchecked")
		List<BidCompDto> list = getSqlMapClientTemplate().queryForList("queryBidCompByName", paramMap);
		return list;
	}
	
	@Override
	public void insertBidComp(BidCompDto bidCompDto) {
		getSqlMapClientTemplate().insert("insertBidComp", bidCompDto);
	}

	@Override
	public void updateBidComp(BidCompDto bidCompDto) {
		getSqlMapClientTemplate().update("updateBidComp", bidCompDto);
	}

	@Override
	public List<BidCompDto> queryAllBidCompExport(String bidNo,
			String bidCoSeq, String bidCoNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_NO", bidNo);
		paramMap.put("BID_CO_SEQ", bidCoSeq);
		paramMap.put("BID_CO_NO", bidCoNo);
		@SuppressWarnings("unchecked")
		List<BidCompDto> list = getSqlMapClientTemplate().queryForList("queryAllBidCompExport", paramMap);
		return list;
	}
}
