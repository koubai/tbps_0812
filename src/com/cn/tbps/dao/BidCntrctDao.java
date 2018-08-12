package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.BidCntrctDto;

public interface BidCntrctDao {

	public int queryBidCntrctCountByPage(String CNTRCT_NAME, String CNTRCT_TYPE);
	
	public List<BidCntrctDto> queryBidCntrctByPage(String CNTRCT_NAME, String CNTRCT_TYPE, int start, int end);
	
	public BidCntrctDto queryBidCntrctByID(String CNTRCT_NO);
	
	public void insertBidCntrct(BidCntrctDto bidCntrct);
	
	public void updateBidCntrct(BidCntrctDto bidCntrct);
}
