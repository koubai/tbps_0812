package com.cn.tbps.service;

import java.util.List;

import com.cn.common.util.Page;
import com.cn.tbps.dto.BidCompApplyDto;
import com.cn.tbps.dto.BidCompDto;
import com.cn.tbps.dto.BidCompExportDto;
import com.cn.tbps.dto.BidDto;
import com.cn.tbps.dto.BidHistDto;
import com.cn.tbps.dto.ExpertLibDto;

/**
 * @name BidService.java
 * @author Frank
 * @time 2013-10-23下午9:04:56
 * @version 1.0
 */
public interface BidService {
	
	public Page queryBidAndBidCntrctByPage(String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO,
			String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, Page page);

	/**
	 * 翻页查询投标
	 * @param bidNoLow
	 * @param bidNoHigh
	 * @param projectType
	 * @param openDateLow
	 * @param openDateHigh
	 * @param agentNo
	 * @param agentName
	 * @param bidCoName
	 * @param receipt1No
	 * @param page
	 * @param bidStatus
	 * @return
	 */
	public Page queryBidByPage(String bidNoLow, String bidNoHigh, String projectType,
			String openDateLow, String openDateHigh, String agentNo, String agentName,
			String bidCoName, String receipt1No, Page page, String bidStatus);
	
	/**
	 * 根据ID查询投标（查询未删除的记录）
	 * @param bidNo
	 * @return
	 */
	public BidDto queryBidByID(String bidNo);
	
	/**
	 * 根据ID查询投标（查询所有记录）
	 * @param bidNo
	 * @return
	 */
	public BidDto queryAllBidByID(String bidNo);
	
	/**
	 * 根据投标ID查询报名要求
	 * @param bidNo
	 * @param bidCoNo
	 * @return
	 */
	public List<BidCompApplyDto> queryApplyByBidID(String bidNo, String bidCoNo);
	
	/**
	 * 新增招标
	 * @param bidDto
	 * @return
	 */
	public String insertBid(BidDto bidDto);
	
	/**
	 * 新增招标
	 * @param bidDto
	 * @param listBidComp
	 * @param listExpertLib
	 * @return
	 */
	public String insertBid(BidDto bidDto, List<BidCompDto> listBidComp, List<ExpertLibDto> listExpertLib) throws RuntimeException;
	
	/**
	 * 修改招标
	 * @param bidDto
	 * @param listBidComp
	 * @param listExpertLib
	 */
	public void updateBid(BidDto bidDto, List<BidCompDto> listBidComp, List<ExpertLibDto> listExpertLib);
	
	/**
	 * 删除招标
	 * @param bidNo
	 * @param username
	 */
	public void deleteBid(String bidNo, String username);
	
	/**
	 * 查询所有的招标（Excel导出用）
	 * @param bidNoLow
	 * @param bidNoHigh
	 * @param projectType
	 * @param openDateLow
	 * @param openDateHigh
	 * @param agentNo
	 * @param agentName
	 * @param bidCoName
	 * @param receipt1No
	 * @return
	 */
	public List<BidDto> queryAllBidExport(String bidNoLow, String bidNoHigh, String projectType,
			String openDateLow, String openDateHigh, String agentNo, String agentName, String bidCoName, String receipt1No);
	
	/**
	 * 根据年份查询招标（Excel导出用）
	 * @param strBidNoStart
	 * @param strBidNoEnd
	 * @return
	 */
	public List<BidDto> queryBidExportByYear(String strBidNoStart, String strBidNoEnd);
	
	/**
	 * 根据年份查询委托公司（Excel导出用）
	 * @param strBidNoStart
	 * @param strBidNoEnd
	 * @return
	 */
	public List<BidDto> queryAgentCo(String strBidNoStart, String strBidNoEnd);
	
	/**
	 * 根据年份查询中标公司（Excel导出用）
	 * @param strBidNoStart
	 * @param strBidNoEnd
	 * @return
	 */
	public List<BidDto> queryBidCo(String strBidNoStart, String strBidNoEnd);
	
	/**
	 * 根据年份查询工程师（Excel导出用）
	 * @param strBidNoStart
	 * @param strBidNoEnd
	 * @return
	 */
	public List<BidDto> queryProjectMg(String strBidNoStart, String strBidNoEnd);
	
	/**
	 * 查询招标（Excel导出用）
	 * @param bidDto
	 * @return
	 */
	public List<BidDto> queryBidExport(BidDto bidDto);
	
	/**
	 * 查询所有的招标（包含招标公司信息，Excel导出用）
	 * @param bidNoLow
	 * @param bidNoHigh
	 * @param projectType
	 * @param openDateLow
	 * @param openDateHigh
	 * @param agentNo
	 * @param agentName
	 * @param bidCoName
	 * @param receipt1No
	 * @return
	 */
	public List<BidCompExportDto> queryAllBidCompExport(String bidNoLow, String bidNoHigh, String projectType,
			String openDateLow, String openDateHigh, String agentNo, String agentName, String bidCoName, String receipt1No);
	
	/** 投标履历 **/
	
	/**
	 * 查询所有招标履历
	 * @param bidNo
	 * @return
	 */
	public List<BidHistDto> queryAllBidHist(String bidNo);
	
	/**
	 * 翻页查询投标履历
	 * @param bidNo
	 * @param page
	 * @return
	 */
	public Page queryBidHistByPage(String bidNo, Page page);
	
	/**
	 * 查询投标履历明细
	 * @param bidHisSeq
	 * @return
	 */
	public BidHistDto queryBidHistByID(String bidHisSeq);
	
	/**
	 * 新增招标履历
	 * @param bidDto
	 */
	public void insertBidHist(BidHistDto bidHistDto);
	
	/**
	 * 新增投标公司
	 * @param bidCompDto
	 */
	public void insertBidComp(BidCompDto bidCompDto);
}
