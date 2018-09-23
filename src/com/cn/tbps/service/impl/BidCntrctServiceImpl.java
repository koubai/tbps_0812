package com.cn.tbps.service.impl;

import java.math.BigDecimal;
import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.BidCntrctDao;
import com.cn.tbps.dao.BidCntrctHisDao;
import com.cn.tbps.dao.BidDao;
import com.cn.tbps.dto.BidCntrctDto;
import com.cn.tbps.dto.BidCntrctHisDto;
import com.cn.tbps.dto.BidDto;
import com.cn.tbps.service.BidCntrctService;

public class BidCntrctServiceImpl extends BaseService implements BidCntrctService {
	
	private BidCntrctDao bidCntrctDao;
	private BidCntrctHisDao bidCntrctHisDao;
	private BidDao bidDao;

	@Override
	public Page queryBidCntrctByPage(String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO,
			String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, Page page) {
		CNTRCT_NAME = StringUtil.replaceDatabaseKeyword_mysql(CNTRCT_NAME);
		
		//查询总记录数
		int totalCount = bidCntrctDao.queryBidCntrctCountByPage(CNTRCT_YEAR, CNTRCT_NO, BID_COMP_NO,
				CNTRCT_NAME, CNTRCT_TYPE, CNTRCT_ST_DATE, CNTRCT_ED_DATE);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<BidCntrctDto> list = bidCntrctDao.queryBidCntrctByPage(CNTRCT_YEAR, CNTRCT_NO, BID_COMP_NO,
				CNTRCT_NAME, CNTRCT_TYPE, CNTRCT_ST_DATE, CNTRCT_ED_DATE,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		//查询各个合同对应的招标数量以及对应状态、金额等
		if(list != null && list.size() > 0) {
			for(BidCntrctDto bidCntrct : list) {
				//项目总数量
				int totalProject = 0;
				//完成项目数量
				int finishProject = 0;
				//进行中项目数量
				int buildingProject = 0;
				//失败项目数量
				int failProject = 0;
				//标书费
				BigDecimal bidAmount = new BigDecimal(0);
				//专家费
				BigDecimal expertAmount = new BigDecimal(0);
				//应收代理费
				BigDecimal BID_AGENT_PRICE = new BigDecimal(0);
				//实收代理费
				BigDecimal BID_AGENT_PRICE_ACT = new BigDecimal(0);
				List<BidDto> bidList = bidDao.queryAllBidByCntrctNo(bidCntrct.getCNTRCT_NO());
				if(bidList != null && bidList.size() > 0) {
					for(BidDto bid : bidList) {
						//项目数量计算
						if(Constants.FINISH_STATUS_IN_DONE.equals(bid.getFINISH_STATUS())) {
							finishProject++;
						}
						if(Constants.FINISH_STATUS_IN_PROCESS.equals(bid.getFINISH_STATUS())) {
							buildingProject++;
						}
						if(Constants.FINISH_STATUS_IN_FAILED1.equals(bid.getFINISH_STATUS())
						|| Constants.FINISH_STATUS_IN_FAILED2.equals(bid.getFINISH_STATUS())
						|| Constants.FINISH_STATUS_IN_FAILED3.equals(bid.getFINISH_STATUS())) {
							failProject++;
						}
						
						if(!Constants.FINISH_STATUS_IN_CANCEL.equals(bid.getFINISH_STATUS())) {
							totalProject++;
						}
						
						//标书费
						if(bid.getBID_APPLY_PRICE() != null) {
							bidAmount = bidAmount.add(bid.getBID_APPLY_PRICE());
						}
						//专家费
						if(bid.getBID_EXPERT_COMMISION_ACT() != null) {
							expertAmount = expertAmount.add(bid.getBID_EXPERT_COMMISION_ACT());
						}
						//应收代理费
						if(bid.getBID_AGENT_PRICE() != null) {
							BID_AGENT_PRICE = BID_AGENT_PRICE.add(bid.getBID_AGENT_PRICE());
						}
						//实收代理费
						if(bid.getBID_AGENT_PRICE_ACT() != null) {
							BID_AGENT_PRICE_ACT = BID_AGENT_PRICE_ACT.add(bid.getBID_AGENT_PRICE_ACT());
						}
					}
				}
				bidCntrct.setTotalProject(totalProject);
				bidCntrct.setFinishProject(finishProject);
				bidCntrct.setBuildingProject(buildingProject);
				bidCntrct.setFailProject(failProject);
				bidCntrct.setBidAmount(bidAmount);
				bidCntrct.setExpertAmount(expertAmount);
				bidCntrct.setBID_AGENT_PRICE(BID_AGENT_PRICE);
				bidCntrct.setBID_AGENT_PRICE_ACT(BID_AGENT_PRICE_ACT);
			}
		}
		page.setItems(list);
		return page;
	}

	@Override
	public BidCntrctDto queryBidCntrctByID(String CNTRCT_NO) {
		return bidCntrctDao.queryBidCntrctByID(CNTRCT_NO);
	}

	@Override
	public void insertBidCntrct(BidCntrctDto bidCntrct) {
		bidCntrctDao.insertBidCntrct(bidCntrct);
		//插入bidCntrctHis
		insertBidCntrctHis(bidCntrct);
	}

	@Override
	public void updateBidCntrct(BidCntrctDto bidCntrct) {
		bidCntrctDao.updateBidCntrct(bidCntrct);
		//插入bidCntrctHis
		insertBidCntrctHis(bidCntrct);
	}
	
	private void insertBidCntrctHis(BidCntrctDto bidCntrct) {
		BidCntrctHisDto bidCntrctHis = new BidCntrctHisDto();
		bidCntrctHis.setCNTRCT_NO(bidCntrct.getCNTRCT_NO());
		bidCntrctHis.setCNTRCT_YEAR(bidCntrct.getCNTRCT_YEAR());
		bidCntrctHis.setCNTRCT_NAME(bidCntrct.getCNTRCT_NAME());
		bidCntrctHis.setCNTRCT_NM(bidCntrct.getCNTRCT_NM());
		bidCntrctHis.setCNTRCT_TYPE(bidCntrct.getCNTRCT_TYPE());
		bidCntrctHis.setBID_COMP_NO(bidCntrct.getBID_COMP_NO());
		bidCntrctHis.setBID_COMP_NAME(bidCntrct.getBID_COMP_NAME());
		bidCntrctHis.setCO_MANAGER1(bidCntrct.getCO_MANAGER1());
		bidCntrctHis.setCO_MANAGER_TEL1(bidCntrct.getCO_MANAGER_TEL1());
		bidCntrctHis.setCO_ADDRESS1(bidCntrct.getCO_ADDRESS1());
		bidCntrctHis.setCO_MANAGER_EMAIL1(bidCntrct.getCO_MANAGER_EMAIL1());
		bidCntrctHis.setCO_TAX(bidCntrct.getCO_TAX());
		bidCntrctHis.setCNTRCT_ST_DATE(bidCntrct.getCNTRCT_ST_DATE());
		bidCntrctHis.setCNTRCT_ED_DATE(bidCntrct.getCNTRCT_ED_DATE());
		bidCntrctHis.setCNTRCT_RATE_1(bidCntrct.getCNTRCT_RATE_1());
		bidCntrctHis.setCNTRCT_RATE_2(bidCntrct.getCNTRCT_RATE_2());
		bidCntrctHis.setCNTRCT_RATE_3(bidCntrct.getCNTRCT_RATE_3());
		bidCntrctHis.setCNTRCT_RATE_4(bidCntrct.getCNTRCT_RATE_4());
		bidCntrctHis.setCNTRCT_RATE_5(bidCntrct.getCNTRCT_RATE_5());
		bidCntrctHis.setCNTRCT_RATE_6(bidCntrct.getCNTRCT_RATE_6());
		bidCntrctHis.setCNTRCT_RATE_7(bidCntrct.getCNTRCT_RATE_7());
		bidCntrctHis.setCNTRCT_RATE_8(bidCntrct.getCNTRCT_RATE_8());
		bidCntrctHis.setCNTRCT_RATE_9(bidCntrct.getCNTRCT_RATE_9());
		bidCntrctHis.setCNTRCT_RATE_10(bidCntrct.getCNTRCT_RATE_10());
		bidCntrctHis.setCNTRCT_AMOUNT_1(bidCntrct.getCNTRCT_AMOUNT_1());
		bidCntrctHis.setCNTRCT_AMOUNT_2(bidCntrct.getCNTRCT_AMOUNT_2());
		bidCntrctHis.setCNTRCT_AMOUNT_3(bidCntrct.getCNTRCT_AMOUNT_3());
		bidCntrctHis.setCNTRCT_AMOUNT_4(bidCntrct.getCNTRCT_AMOUNT_4());
		bidCntrctHis.setCNTRCT_AMOUNT_5(bidCntrct.getCNTRCT_AMOUNT_5());
		bidCntrctHis.setCNTRCT_AMOUNT_6(bidCntrct.getCNTRCT_AMOUNT_6());
		bidCntrctHis.setCNTRCT_AMOUNT_7(bidCntrct.getCNTRCT_AMOUNT_7());
		bidCntrctHis.setCNTRCT_AMOUNT_8(bidCntrct.getCNTRCT_AMOUNT_8());
		bidCntrctHis.setCNTRCT_AMOUNT_9(bidCntrct.getCNTRCT_AMOUNT_9());
		bidCntrctHis.setCNTRCT_AMOUNT_10(bidCntrct.getCNTRCT_AMOUNT_10());
		bidCntrctHis.setCNTRCT_TOTAL_AMOUNT(bidCntrct.getCNTRCT_TOTAL_AMOUNT());
		bidCntrctHis.setCNTRCT_ALL_AMOUNT(bidCntrct.getCNTRCT_ALL_AMOUNT());
		bidCntrctHis.setCNTRCT_UNPAY_AMOUNT(bidCntrct.getCNTRCT_UNPAY_AMOUNT());
		bidCntrctHis.setTRIP_TOTAL_AMOUNT(bidCntrct.getTRIP_TOTAL_AMOUNT());
		bidCntrctHis.setESTIMATE_COST(bidCntrct.getESTIMATE_COST());
		bidCntrctHis.setESTIMATE_CONSTRUCT_SAFE_COST(bidCntrct.getESTIMATE_CONSTRUCT_SAFE_COST());
		bidCntrctHis.setPRE_CONSTRUCT_SAFE_COST(bidCntrct.getPRE_CONSTRUCT_SAFE_COST());
		bidCntrctHis.setCONSTRUCT_ST_DATE(bidCntrct.getCONSTRUCT_ST_DATE());
		bidCntrctHis.setPLAN_CONSTRUCT_ED_DATE(bidCntrct.getPLAN_CONSTRUCT_ED_DATE());
		bidCntrctHis.setCONSTRUCT_AREA(bidCntrct.getCONSTRUCT_AREA());
		bidCntrctHis.setEXCUTE_AMOUNT(bidCntrct.getEXCUTE_AMOUNT());
		bidCntrctHis.setCONSTRUCT_SAFE_COUNT(bidCntrct.getCONSTRUCT_SAFE_COUNT());
		bidCntrctHis.setCONSTRUCT_SAFE_CNTRCT_COST(bidCntrct.getCONSTRUCT_SAFE_CNTRCT_COST());
		bidCntrctHis.setCONSTRUCT_SAFE_CNTRCT_COST_PAID(bidCntrct.getCONSTRUCT_SAFE_CNTRCT_COST_PAID());
		bidCntrctHis.setCONSTRUCT_SAFE_CNTRCT_COST_CTRL(bidCntrct.getCONSTRUCT_SAFE_CNTRCT_COST_CTRL());
		bidCntrctHis.setBUDGETARY_OVERRUN_RISK(bidCntrct.getBUDGETARY_OVERRUN_RISK());
		bidCntrctHis.setMONTHLY_REPORT_CNT(bidCntrct.getMONTHLY_REPORT_CNT());
		bidCntrctHis.setSUGGEST_REPORT_CNT(bidCntrct.getSUGGEST_REPORT_CNT());
		bidCntrctHis.setCOMM_REPORT_CNT(bidCntrct.getCOMM_REPORT_CNT());
		bidCntrctHis.setFINISH_AUDIT_CNT(bidCntrct.getFINISH_AUDIT_CNT());
		bidCntrctHis.setPROJ_PROGRESS_MEET_CNT(bidCntrct.getPROJ_PROGRESS_MEET_CNT());
		bidCntrctHis.setPROGRESS_STATUS(bidCntrct.getPROGRESS_STATUS());
		bidCntrctHis.setPROJECT_SENIOR_MANAGER(bidCntrct.getPROJECT_SENIOR_MANAGER());
		bidCntrctHis.setRESERVE1(bidCntrct.getRESERVE1());
		bidCntrctHis.setRESERVE2(bidCntrct.getRESERVE2());
		bidCntrctHis.setRESERVE3(bidCntrct.getRESERVE3());
		bidCntrctHis.setRESERVE4(bidCntrct.getRESERVE4());
		bidCntrctHis.setRESERVE5(bidCntrct.getRESERVE5());
		bidCntrctHis.setRESERVE6(bidCntrct.getRESERVE6());
		bidCntrctHis.setRESERVE7(bidCntrct.getRESERVE7());
		bidCntrctHis.setRESERVE8(bidCntrct.getRESERVE8());
		bidCntrctHis.setRESERVE9(bidCntrct.getRESERVE9());
		bidCntrctHis.setRESERVE10(bidCntrct.getRESERVE10());
		bidCntrctHis.setLATEST_FLG(bidCntrct.getLATEST_FLG());
		bidCntrctHis.setDELETE_FLG(bidCntrct.getDELETE_FLG());
		bidCntrctHis.setUPDATE_USER(bidCntrct.getUPDATE_USER());
		bidCntrctHis.setINSERT_DATE(bidCntrct.getINSERT_DATE());
		bidCntrctHis.setUPDATE_DATE(bidCntrct.getUPDATE_DATE());
		bidCntrctHisDao.insertBidCntrctHis(bidCntrctHis);
	}

	public BidCntrctDao getBidCntrctDao() {
		return bidCntrctDao;
	}

	public void setBidCntrctDao(BidCntrctDao bidCntrctDao) {
		this.bidCntrctDao = bidCntrctDao;
	}

	public BidDao getBidDao() {
		return bidDao;
	}

	public void setBidDao(BidDao bidDao) {
		this.bidDao = bidDao;
	}

	public BidCntrctHisDao getBidCntrctHisDao() {
		return bidCntrctHisDao;
	}

	public void setBidCntrctHisDao(BidCntrctHisDao bidCntrctHisDao) {
		this.bidCntrctHisDao = bidCntrctHisDao;
	}
}
