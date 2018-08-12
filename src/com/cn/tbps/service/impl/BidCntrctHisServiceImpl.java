package com.cn.tbps.service.impl;

import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.BidCntrctHisDao;
import com.cn.tbps.dto.BidCntrctHisDto;
import com.cn.tbps.service.BidCntrctHisService;

public class BidCntrctHisServiceImpl extends BaseService implements BidCntrctHisService {
	
	private BidCntrctHisDao bidCntrctHisDao;

	@Override
	public Page queryBidCntrctHisByPage(String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_NO, Page page) {
		CNTRCT_NAME = StringUtil.replaceDatabaseKeyword_mysql(CNTRCT_NAME);
		
		//查询总记录数
		int totalCount = bidCntrctHisDao.queryBidCntrctHisCountByPage(CNTRCT_NAME, CNTRCT_TYPE, CNTRCT_NO);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<BidCntrctHisDto> list = bidCntrctHisDao.queryBidCntrctHisByPage(CNTRCT_NAME, CNTRCT_TYPE, CNTRCT_NO,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}

	@Override
	public BidCntrctHisDto queryBidCntrctHisByID(String BID_CNTRCT_HIS_SEQ) {
		return bidCntrctHisDao.queryBidCntrctHisByID(BID_CNTRCT_HIS_SEQ);
	}

	@Override
	public void insertBidCntrctHis(BidCntrctHisDto bidCntrctHis) {
		bidCntrctHisDao.insertBidCntrctHis(bidCntrctHis);
	}

	public BidCntrctHisDao getBidCntrctHisDao() {
		return bidCntrctHisDao;
	}

	public void setBidCntrctHisDao(BidCntrctHisDao bidCntrctHisDao) {
		this.bidCntrctHisDao = bidCntrctHisDao;
	}
}
