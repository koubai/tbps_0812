package com.cn.tbps.service;

import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.context.ApplicationContext;

import com.cn.common.util.Page;
import com.cn.tbps.dto.BidCompDto;

/**
 * @name BidCompService.java
 * @author Frank
 * @time 2013-11-1下午8:57:10
 * @version 1.0
 */
public interface BidCompService {
	
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
	 * @param page
	 * @return
	 */
	public Page queryBidCompByPage(String bidNo,
				String bidCoSeq, String bidCoNo, Page page);
	
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
	
	
	public void setCtx(ApplicationContext ctx);
	
	public ApplicationContext getCtx();
	
	// 从数据库中取得各类数据，放入JSON，
    public JSONArray getCompNameData(String compName);

}
