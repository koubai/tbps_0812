package com.cn.tbps.service;

import com.cn.common.util.Page;
import com.cn.tbps.dto.BidCntrctDto;

public interface BidCntrctService {

	public Page queryBidCntrctByPage(String CNTRCT_NAME, String CNTRCT_TYPE, Page page);
	
	public BidCntrctDto queryBidCntrctByID(String CNTRCT_NO);
	
	public void insertBidCntrct(BidCntrctDto bidCntrct);
	
	public void updateBidCntrct(BidCntrctDto bidCntrct);
}
