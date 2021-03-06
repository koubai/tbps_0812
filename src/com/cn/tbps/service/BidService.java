package com.cn.tbps.service;

import java.math.BigDecimal;
import java.util.List;

import com.cn.common.util.Page;
import com.cn.tbps.dto.BidCompApplyDto;
import com.cn.tbps.dto.BidCompDto;
import com.cn.tbps.dto.BidCompExportDto;
import com.cn.tbps.dto.BidDto;
import com.cn.tbps.dto.BidHistDto;
import com.cn.tbps.dto.BidRptDto;
import com.cn.tbps.dto.ExpertLibDto;

/**
 * @name BidService.java
 * @author Frank
 * @time 2013-10-23下午9:04:56
 * @version 1.0
 */
public interface BidService {
	
	/**
	 * 保存专家费
	 * @param bidExpertCostList
	 * @param userid
	 */
	public void saveBidExpertCost(List<BidDto> bidExpertCostList, String userid);
	
	/**
	 * 代理费计算（服务端计算代理费）
	 * @param bidAgentCostList
	 * @param userid
	 * @param discount
	 * @param receiptDate
	 * @param receiptValueDate
	 */
	public void saveBidAgentCost(List<BidDto> bidAgentCostList, String userid, String discount, String receiptDate, String receiptValueDate);
	
	/**
	 * 代理费前端计算完成，这里只做保存
	 * @param bidAgentCostList
	 * @param userid
	 */
	public void saveBidAgentCost(List<BidDto> bidAgentCostList, String userid);
	
	/**
	 * 查询bid列表（新）
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
	 * @param page
	 * @return
	 */
	public Page queryBidAndBidCntrctByPage(String strBID_AGENT_PRICE_ACT, String strRECEIPT1_DATE, String strRECEIPT1_VALUE_DATE,
			String cntrctNos, String finishStatuss, String PROJECT_NAME, String BID_NO_LOW,
			String BID_NO_HIGH, String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO,
			String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, 
			String BID_EXPERT_COMMISION_APPLY_ST_DATE,String BID_EXPERT_COMMISION_APPLY_ED_DATE,
			String PROJECT_MANAGER, String BID_NO, Page page);
	
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
	 * 根据合同编号查询招标记录
	 * @param CNTRCT_NO
	 * @return
	 */
	public List<BidDto> queryAllBidByCntrctNo(String CNTRCT_NO);
	
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
	 * 新增招标(新)
	 * @param bidDto
	 * @param listBidComp
	 * @param listExpertLib
	 * @return
	 */
	public String insertBidNew(BidDto bidDto, List<BidCompDto> listBidComp, List<ExpertLibDto> listExpertLib);
	
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
	public void updateBidNew(BidDto bidDto, List<BidCompDto> listBidComp, List<ExpertLibDto> listExpertLib);
	
	
	/**
	 * 修改招标
	 * @param bidDto
	 */
	public void updateBid(BidDto bidDto);

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
	 * 根据年份查询招标（Excel导出用）
	 * @param strBidNoStart
	 * @param strBidNoEnd
	 * @return
	 */
	public List<BidDto> queryBidExportByYear(String strBidNoStart, String strBidNoEnd);
	
	/**
	 * 根据招标编号查询记录
	 * @param bidNos
	 * @return
	 */
	public List<BidDto> queryBidByNos(String bidNos);
	
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
	public List<BidCompExportDto> queryAllBidCompExport(
			String strBID_AGENT_PRICE_ACT, String strRECEIPT1_DATE, String strRECEIPT1_VALUE_DATE,
			String cntrctNos, String finishStatuss, String PROJECT_NAME, String BID_NO_LOW, String BID_NO_HIGH,
			String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO, String CNTRCT_NAME, String CNTRCT_TYPE,
			String CNTRCT_ST_DATE, String CNTRCT_ED_DATE);

	
	/**
	 * 查询招标项目关联信息（Excel导出用）
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
	 * @param PROJECT_MANAGER
	 * @return
	 */
	public List<BidRptDto> queryAllBidDetailExport(
			String strBID_AGENT_PRICE_ACT, String strRECEIPT1_DATE, String strRECEIPT1_VALUE_DATE,
			String cntrctNos, String finishStatuss, String PROJECT_NAME, String BID_NO_LOW, String BID_NO_HIGH,
			String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO, String CNTRCT_NAME, String CNTRCT_TYPE,
			String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, String PROJECT_MANAGER);
		
	
	/**
	 * 查询所有的招标公司信息
	 * @param bidNo
	 * @return
	 */
	public List<BidCompDto> queryBidComp(BidDto bid);
	
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
