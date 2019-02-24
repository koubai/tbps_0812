package com.cn.tbps.service;

import com.cn.common.util.Page;
import com.cn.tbps.dto.BidCntrctDto;

public interface BidCntrctService {

	public Page queryBidCntrctByPage(String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO,
			String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, Page page);
	
	public BidCntrctDto queryBidCntrctByID(String CNTRCT_NO);
	
	public void insertBidCntrct(BidCntrctDto bidCntrct);
	
	public void updateBidCntrct(BidCntrctDto bidCntrct);
	
	/**
	 * 逻辑删除招标合同
	 * @param CNTRCT_NO
	 * @param username
	 */
	public void deleteBidCntrctLogic(String CNTRCT_NO, String username);
}
