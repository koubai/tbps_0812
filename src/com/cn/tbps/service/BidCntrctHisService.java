package com.cn.tbps.service;

import com.cn.common.util.Page;
import com.cn.tbps.dto.BidCntrctHisDto;

public interface BidCntrctHisService {

	public Page queryBidCntrctHisByPage(String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_NO, Page page);
	
	public BidCntrctHisDto queryBidCntrctHisByID(String BID_CNTRCT_HIS_SEQ);
	
	public void insertBidCntrctHis(BidCntrctHisDto bidCntrctHis);
}
