package com.cn.tbps.service.impl;

import java.util.List;

import com.cn.tbps.dao.BidCompApplyDao;
import com.cn.tbps.dto.BidCompApplyDto;
import com.cn.tbps.service.BidCompApplyService;

/**
 * @name BidCompApplyServiceImpl.java
 * @author Frank
 * @time 2016-5-26下午10:14:24
 * @version 1.0
 */
public class BidCompApplyServiceImpl implements BidCompApplyService {
	
	private BidCompApplyDao bidCompApplyDao;

	@Override
	public List<BidCompApplyDto> queryBidCompApplyByBidCoNo(String bidCoNo) {
		return bidCompApplyDao.queryBidCompApplyByBidCoNo(bidCoNo);
	}

	@Override
	public BidCompApplyDto queryBidCompApplyByID(String id) {
		return bidCompApplyDao.queryBidCompApplyByID(id);
	}

	@Override
	public void insertBidCompApply(BidCompApplyDto bidCompApply) {
		bidCompApplyDao.insertBidCompApply(bidCompApply);
	}

	@Override
	public void delBidCompApplyByBidCoNo(String bidNo, String bidCoNo) {
		bidCompApplyDao.delBidCompApplyByBidCoNo(bidNo, bidCoNo);
	}

	@Override
	public void updBidCompApplyStatusByBidCoNo(String bidNo, String bidCoNo) {
		bidCompApplyDao.updBidCompApplyStatusByBidCoNo(bidNo, bidCoNo);
	}

	@Override
	public void updBidCompApply(BidCompApplyDto bidCompApply) {
		bidCompApplyDao.updBidCompApply(bidCompApply);
	}

	public BidCompApplyDao getBidCompApplyDao() {
		return bidCompApplyDao;
	}

	public void setBidCompApplyDao(BidCompApplyDao bidCompApplyDao) {
		this.bidCompApplyDao = bidCompApplyDao;
	}
}
