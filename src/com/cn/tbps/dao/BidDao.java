package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.BidDto;
import com.cn.tbps.dto.BidHistDto;
import com.cn.tbps.dto.BidRptDto;

/**
 * @name BidDao.java
 * @author Frank
 * @time 2013-10-22下午10:43:24
 * @version 1.0
 */
public interface BidDao {
	
	public int queryBidAndBidCntrctCountByPage(
			String strBID_AGENT_PRICE_ACT, String strRECEIPT1_DATE, String strRECEIPT1_VALUE_DATE,
			String cntrctNos, String finishStatuss, String PROJECT_NAME, String BID_NO_LOW, String BID_NO_HIGH,
			String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO, String CNTRCT_NAME, String CNTRCT_TYPE,
			String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, String BID_EXPERT_COMMISION_APPLY_ST_DATE, String BID_EXPERT_COMMISION_APPLY_ED_DATE, String PROJECT_MANAGER, String BID_NO);
	
	public List<BidDto> queryBidAndBidCntrctByPage(
			String strBID_AGENT_PRICE_ACT, String strRECEIPT1_DATE, String strRECEIPT1_VALUE_DATE,
			String cntrctNos, String finishStatuss, String PROJECT_NAME, String BID_NO_LOW, String BID_NO_HIGH,
			String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO, String CNTRCT_NAME, String CNTRCT_TYPE,
			String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, 
			String BID_EXPERT_COMMISION_APPLY_ST_DATE, String BID_EXPERT_COMMISION_APPLY_ED_DATE, String PROJECT_MANAGER, String BID_NO,
			int start, int end);
	
	/**
	 * 查询所有的招标（Excel导出用）
	 * @param strBID_AGENT_PRICE_ACT
	 * @param strRECEIPT1_DATE
	 * @param strRECEIPT1_VALUE_DATE
	 * @param cntrctNos
	 * @param finishStatuss
	 * @param PROJECT_NAME
	 * @param BID_NO_LOW
	 * @param BID_NO_HIGH
	 * @param CNTRCT_YEAR
	 * @param CNTRCT_NO
	 * @param BID_COMP_NO
	 * @param CNTRCT_NAME
	 * @param CNTRCT_TYPE
	 * @param CNTRCT_ST_DATE
	 * @param CNTRCT_ED_DATE
	 * @return
	 */
	public List<BidDto> queryAllBidExport(
			String strBID_AGENT_PRICE_ACT, String strRECEIPT1_DATE, String strRECEIPT1_VALUE_DATE,
			String cntrctNos, String finishStatuss, String PROJECT_NAME, String BID_NO_LOW, String BID_NO_HIGH,
			String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO, String CNTRCT_NAME, String CNTRCT_TYPE,
			String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, String PROJECT_MANAGER);
	
	/**
	 * 查询所有的招标详细信息（Excel导出用）
	 * @param strBID_AGENT_PRICE_ACT
	 * @param strRECEIPT1_DATE
	 * @param strRECEIPT1_VALUE_DATE
	 * @param cntrctNos
	 * @param finishStatuss
	 * @param PROJECT_NAME
	 * @param BID_NO_LOW
	 * @param BID_NO_HIGH
	 * @param CNTRCT_YEAR
	 * @param CNTRCT_NO
	 * @param BID_COMP_NO
	 * @param CNTRCT_NAME
	 * @param CNTRCT_TYPE
	 * @param CNTRCT_ST_DATE
	 * @param CNTRCT_ED_DATE
	 * @return
	 */
	public List<BidRptDto> queryAllBidDetailExport(
			String strBID_AGENT_PRICE_ACT, String strRECEIPT1_DATE, String strRECEIPT1_VALUE_DATE,
			String cntrctNos, String finishStatuss, String PROJECT_NAME, String BID_NO_LOW, String BID_NO_HIGH,
			String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO, String CNTRCT_NAME, String CNTRCT_TYPE,
			String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, String PROJECT_MANAGER);
	
	/**
	 * 根据合同编号查询招标记录
	 * @param CNTRCT_NO
	 * @return
	 */
	public List<BidDto> queryAllBidByCntrctNo(String CNTRCT_NO);
	
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
	 * @param start
	 * @param end
	 * @param bidStatus
	 * @return
	 */
	public List<BidDto> queryBidByPage(String bidNoLow, String bidNoHigh, String projectType,
			String openDateLow, String openDateHigh, String agentNo, String agentName,
			String bidCoName, String receipt1No, int start, int end, String bidStatus);
	
	/**
	 * 查询总记录数
	 * @param bidNoLow
	 * @param bidNoHigh
	 * @param projectType
	 * @param openDateLow
	 * @param openDateHigh
	 * @param agentNo
	 * @param agentName
	 * @param bidStatus
	 * @param bidCoName
	 * @param receipt1No
	 * @return
	 */
	public int queryBidCountByPage(String bidNoLow, String bidNoHigh, String projectType,
			String openDateLow, String openDateHigh, String agentNo, String agentName, String bidStatus, String bidCoName, String receipt1No);
	
	/**
	 * 根据ID查询投标（查询未删除的记录）
	 * @param bidNo
	 * @return
	 */
	public BidDto queryBidByID(String bidNo);
	
	/**
	 * 根据ID查询投标（查询所有记录，不含删除）
	 * @param bidNo
	 * @return
	 */
	public BidDto queryAllBidByID(String bidNo);
	
	/**
	 * 根据ID查询投标（查询所有记录，含删除）
	 * @param bidNo
	 * @return
	 */
	public BidDto queryAllBidByID2(String bidNo);
	
	/**
	 * 新增招标
	 * @param bidDto
	 */
	public void insertBid(BidDto bidDto);
	
	/**
	 * 修改招标
	 * @param bidDto
	 */
	public void updateBid(BidDto bidDto);
	
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
	 * @param start
	 * @param end
	 * @return
	 */
	public List<BidHistDto> queryBidHistByPage(String bidNo, int start, int end);
	
	/**
	 * 查询投标履历总记录数
	 * @param bidNo
	 * @return
	 */
	public int queryBidHistCountByPage(String bidNo);
	
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
}
