package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.BidCntrctHisDto;

public interface BidCntrctHisDao {

	public int queryBidCntrctHisCountByPage(String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_NO);
	
	public List<BidCntrctHisDto> queryBidCntrctHisByPage(String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_NO, int start, int end);
	
	public BidCntrctHisDto queryBidCntrctHisByID(String BID_CNTRCT_HIS_SEQ);
	
	public void insertBidCntrctHis(BidCntrctHisDto bidCntrctHis);
}
