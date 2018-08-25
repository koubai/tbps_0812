package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.BidCntrctDto;

public interface BidCntrctDao {

	public int queryBidCntrctCountByPage(String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO,
			String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_ST_DATE, String CNTRCT_ED_DATE);
	
	public List<BidCntrctDto> queryBidCntrctByPage(String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO,
			String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, int start, int end);
	
	public BidCntrctDto queryBidCntrctByID(String CNTRCT_NO);
	
	public void insertBidCntrct(BidCntrctDto bidCntrct);
	
	public void updateBidCntrct(BidCntrctDto bidCntrct);
}
