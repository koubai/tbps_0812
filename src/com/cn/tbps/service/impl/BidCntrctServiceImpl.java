package com.cn.tbps.service.impl;

import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.BidCntrctDao;
import com.cn.tbps.dto.BidCntrctDto;
import com.cn.tbps.service.BidCntrctService;

public class BidCntrctServiceImpl extends BaseService implements BidCntrctService {
	
	private BidCntrctDao bidCntrctDao;

	@Override
	public Page queryBidCntrctByPage(String CNTRCT_NAME, String CNTRCT_TYPE, Page page) {
		CNTRCT_NAME = StringUtil.replaceDatabaseKeyword_mysql(CNTRCT_NAME);
		
		//查询总记录数
		int totalCount = bidCntrctDao.queryBidCntrctCountByPage(CNTRCT_NAME, CNTRCT_TYPE);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<BidCntrctDto> list = bidCntrctDao.queryBidCntrctByPage(CNTRCT_NAME, CNTRCT_TYPE,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}

	@Override
	public BidCntrctDto queryBidCntrctByID(String CNTRCT_NO) {
		return bidCntrctDao.queryBidCntrctByID(CNTRCT_NO);
	}

	@Override
	public void insertBidCntrct(BidCntrctDto bidCntrct) {
		bidCntrctDao.insertBidCntrct(bidCntrct);
	}

	@Override
	public void updateBidCntrct(BidCntrctDto bidCntrct) {
		bidCntrctDao.updateBidCntrct(bidCntrct);
	}

	public BidCntrctDao getBidCntrctDao() {
		return bidCntrctDao;
	}

	public void setBidCntrctDao(BidCntrctDao bidCntrctDao) {
		this.bidCntrctDao = bidCntrctDao;
	}
}
