package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.BidCompApplyDto;

/**
 * @name BidCompApplyDao.java
 * @author Frank
 * @time 2016-5-26下午10:01:56
 * @version 1.0
 */
public interface BidCompApplyDao {

	/**
	 * 根据投标公司ID查询报名内容数据
	 * @param bidCoNo
	 * @return
	 */
	public List<BidCompApplyDto> queryBidCompApplyByBidCoNo(String bidCoNo);
	
	/**
	 * 根据ID查询报名内容数据
	 * @param id
	 * @return
	 */
	public BidCompApplyDto queryBidCompApplyByID(String id);
	
	/**
	 * 根据报名要求查询报名内容
	 * @param BID_NO
	 * @param BID_CO_NO
	 * @param APPLY_REQUIRE
	 * @return
	 */
	public BidCompApplyDto queryBidCompApplyByRequire(String BID_NO, String BID_CO_NO, String APPLY_REQUIRE);
	
	/**
	 * 新增数据
	 * @param bidCompApply
	 */
	public void insertBidCompApply(BidCompApplyDto bidCompApply);
	
	/**
	 * 根据投标公司ID删除报名内容数据
	 * @param bidNo
	 * @param bidCoNo
	 */
	public void delBidCompApplyByBidCoNo(String bidNo, String bidCoNo);
	
	/**
	 * 根据投标公司ID删更新所有数据状态=0
	 * @param bidNo
	 * @param bidCoNo
	 */
	public void updBidCompApplyStatusByBidCoNo(String bidNo, String bidCoNo);
	
	/**
	 * 更新数据
	 * @param bidCompApply
	 */
	public void updBidCompApply(BidCompApplyDto bidCompApply);
}
