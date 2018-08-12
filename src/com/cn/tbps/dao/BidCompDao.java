package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.BidCompDto;

/**
 * @name BidCompDao.java
 * @author Frank
 * @time 2013-10-31下午11:36:05
 * @version 1.0
 */
public interface BidCompDao {
	
	/**
	 * 根据ID查询投标公司列表
	 * @param ids
	 * @return
	 */
	public List<BidCompDto> queryBidCompByIds(String ids);

	/**
	 * 翻页查询投标公司
	 * @param bidNo
	 * @param bidCoSeq
	 * @param bidCoNo
	 * @param start
	 * @param end
	 * @return
	 */
	public List<BidCompDto> queryBidCompByPage(String bidNo,
				String bidCoSeq, String bidCoNo, int start, int end);
	
	/**
	 * 查询总记录数
	 * @param bidNo
	 * @param bidCoSeq
	 * @param bidCoNo
	 * @return
	 */
	public int queryBidCompCountByPage(String bidNo, String bidCoSeq, String bidCoNo);
	
	/**
	 * 根据ID查询投标公司（查询未删除的记录）
	 * @param bidCoNo
	 * @return
	 */
	public BidCompDto queryBidCompByID(String bidCoNo);
	
	/**
	 * 根据ID查询投标公司（查询所有记录）
	 * @param bidCoNo
	 * @return
	 */
	public BidCompDto queryAllBidCompByID(String bidCoNo);
	
	/**
	 * 新增投标公司
	 * @param bidCompDto
	 */
	public void insertBidComp(BidCompDto bidCompDto);
	
	/**
	 * 修改投标公司
	 * @param bidCompDto
	 */
	public void updateBidComp(BidCompDto bidCompDto);
	
	/**
	 * 根据招标编号删除所有投标公司
	 * @param bidNo
	 * @param user
	 */
	public void delBidCompByBidNo(String bidNo, String user);
	
	/**
	 * 查询投标公司（Excel导出用）
	 * @param bidNo
	 * @param bidCoSeq
	 * @param bidCoNo
	 * @return
	 */
	public List<BidCompDto> queryAllBidCompExport(String bidNo, String bidCoSeq, String bidCoNo);
	
	
	/**
	 * 用投标公司名字查询投标公司（ajax用）
	 * @param bidCompName
	 * @return
	 */
	public List<BidCompDto> queryBidCompByName(String bidCompName);
}
