package com.cn.tbps.service.impl;

import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.BidCntrctDao;
import com.cn.tbps.dao.BidDao;
import com.cn.tbps.dto.BidCntrctDto;
import com.cn.tbps.service.BidCntrctService;

public class BidCntrctServiceImpl extends BaseService implements BidCntrctService {
	
	private BidCntrctDao bidCntrctDao;
	private BidDao bidDao;

	@Override
	public Page queryBidCntrctByPage(String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO,
			String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, Page page) {
		CNTRCT_NAME = StringUtil.replaceDatabaseKeyword_mysql(CNTRCT_NAME);
		
		//查询总记录数
		int totalCount = bidCntrctDao.queryBidCntrctCountByPage(CNTRCT_YEAR, CNTRCT_NO, BID_COMP_NO,
				CNTRCT_NAME, CNTRCT_TYPE, CNTRCT_ST_DATE, CNTRCT_ED_DATE);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<BidCntrctDto> list = bidCntrctDao.queryBidCntrctByPage(CNTRCT_YEAR, CNTRCT_NO, BID_COMP_NO,
				CNTRCT_NAME, CNTRCT_TYPE, CNTRCT_ST_DATE, CNTRCT_ED_DATE,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		//查询各个合同对应的招标数量以及对应状态、金额等
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

	public BidDao getBidDao() {
		return bidDao;
	}

	public void setBidDao(BidDao bidDao) {
		this.bidDao = bidDao;
	}
}
