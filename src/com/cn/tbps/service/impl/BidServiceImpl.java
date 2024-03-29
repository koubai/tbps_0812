package com.cn.tbps.service.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.service.BaseService;
import com.cn.common.util.Constants;
import com.cn.common.util.DateUtil;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.common.util.TbpsUtil;
import com.cn.tbps.dao.BidCntrctDao;
import com.cn.tbps.dao.BidCompApplyDao;
import com.cn.tbps.dao.BidCompDao;
import com.cn.tbps.dao.BidDao;
import com.cn.tbps.dao.ConfigTabDao;
import com.cn.tbps.dao.ExpertLibDao;
import com.cn.tbps.dao.SuperviseLibDao;
import com.cn.tbps.dao.UserInfoDao;
import com.cn.tbps.dto.BidCntrctDto;
import com.cn.tbps.dto.BidCompApplyDto;
import com.cn.tbps.dto.BidCompDto;
import com.cn.tbps.dto.BidCompExportDto;
import com.cn.tbps.dto.BidDto;
import com.cn.tbps.dto.BidHistDto;
import com.cn.tbps.dto.BidRptDto;
import com.cn.tbps.dto.ConfigTabDto;
import com.cn.tbps.dto.ExpertLibDto;
import com.cn.tbps.dto.SuperviseLibDto;
import com.cn.tbps.dto.UserInfoDto;
import com.cn.tbps.service.BidService;

import net.sf.json.JSONArray;

/**
 * @name BidServiceImpl.java
 * @author Frank
 * @time 2013-10-23下午9:07:04
 * @version 1.0
 */
public class BidServiceImpl extends BaseService implements BidService {
	
	private static final Logger log = LogManager.getLogger(BidServiceImpl.class);
	
	private BidDao bidDao;
	
	private BidCntrctDao bidCntrctDao;
	
	private BidCompDao bidCompDao;
	
	private BidCompApplyDao bidCompApplyDao;
	
	private ExpertLibDao expertLibDao;
	
	private SuperviseLibDao superviseLibDao;
	
	private UserInfoDao userInfoDao;
	
	private ConfigTabDao configTabDao;
	
	@Override
	public void saveBidAgentCost(List<BidDto> bidAgentCostList, String userid, String discount, String receiptDate, String receiptValueDate) {
		if(bidAgentCostList != null && bidAgentCostList.size() > 0) {
			for(BidDto bid : bidAgentCostList) {
				if(StringUtil.isNotBlank(bid.getBID_NO())) {
					BidDto newBid = bidDao.queryAllBidByID(bid.getBID_NO());
					if(newBid != null) {
						newBid.setBID_AGENT_PRICE_ACT(TbpsUtil.bigDecimal2str(TbpsUtil.calcAgentPrice(newBid.getBID_AGENT_PRICE(), new BigDecimal(discount))));
						newBid.setUPDATE_USER(userid);
						newBid.setRECEIPT1_DATE(DateUtil.strToDate(receiptDate, DateUtil.DATE_FORMAT_SHORT));
						newBid.setRECEIPT1_VALUE_DATE(DateUtil.strToDate(receiptValueDate, DateUtil.DATE_FORMAT_SHORT));
						bidDao.updateBid(newBid);
					}
				}
			}
		}
	}
	
	@Override
	public void saveBidAgentCost(List<BidDto> bidAgentCostList, String userid) {
		if(bidAgentCostList != null && bidAgentCostList.size() > 0) {
			for(BidDto bid : bidAgentCostList) {
				if(StringUtil.isNotBlank(bid.getBID_NO())) {
					BidDto newBid = bidDao.queryAllBidByID(bid.getBID_NO());
					if(newBid != null) {
						newBid.setBID_AGENT_PRICE_ACT(TbpsUtil.bigDecimal2str(bid.getBID_AGENT_PRICE_ACT()));
						newBid.setUPDATE_USER(userid);
						newBid.setRECEIPT1_DATE(bid.getRECEIPT1_DATE());
						newBid.setRECEIPT1_VALUE_DATE(bid.getRECEIPT1_VALUE_DATE());
						bidDao.updateBid(newBid);
					}
				}
			}
		}
	}
	
	@Override
	public void saveBidExpertCost(List<BidDto> bidExpertCostList, String userid) {
		if(bidExpertCostList != null && bidExpertCostList.size() > 0) {
			for(BidDto bid : bidExpertCostList) {
				if(StringUtil.isNotBlank(bid.getBID_NO())) {
					BidDto newBid = bidDao.queryAllBidByID(bid.getBID_NO());
					if(newBid != null) {
						if(bid.getBID_EXPERT_COMMISION_ACT_YUAN() != null) {
							newBid.setBID_EXPERT_COMMISION_ACT(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_ACT_YUAN().divide(new BigDecimal(10000)).setScale(6, BigDecimal.ROUND_HALF_UP)));
						} else {
							newBid.setBID_EXPERT_COMMISION_ACT(TbpsUtil.bigDecimal2str(new BigDecimal(0)));
						}
						newBid.setBID_EXPERT_COMMISION_APPLY_DATE(bid.getBID_EXPERT_COMMISION_APPLY_DATE());
						newBid.setBID_EXPERT_COMMISION_APPLY(bid.getBID_EXPERT_COMMISION_APPLY());
						newBid.setUPDATE_USER(userid);
						bidDao.updateBid(newBid);
					}
				}
			}
		}
	}
	
	@Override
	public Page queryBidAndBidCntrctByPage(String strBID_AGENT_PRICE_ACT, String strRECEIPT1_DATE, String strRECEIPT1_VALUE_DATE,
			String cntrctNos, String finishStatuss, String PROJECT_NAME, String BID_NO_LOW, String BID_NO_HIGH,
			String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO, String CNTRCT_NAME, String CNTRCT_TYPE,
			String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, String BID_EXPERT_COMMISION_APPLY_ST_DATE,String BID_EXPERT_COMMISION_APPLY_ED_DATE,
			String PROJECT_MANAGER, String BID_NO, Page page) {
		String newCntrctNos = "";
		if(StringUtil.isNotBlank(cntrctNos)) {
			String[] cntrctNoList = cntrctNos.split(",");
			for(String s : cntrctNoList) {
				if(StringUtil.isNotBlank(s)) {
					newCntrctNos += "'" + s + "',";
				}
			}
			newCntrctNos = newCntrctNos.substring(0, newCntrctNos.length() - 1);
		}
		if("1".equals(strBID_AGENT_PRICE_ACT)) {
			strBID_AGENT_PRICE_ACT = " B.BID_AGENT_PRICE_ACT > 0 ";
		} else if ("2".equals(strBID_AGENT_PRICE_ACT)) {
			strBID_AGENT_PRICE_ACT = " (B.BID_AGENT_PRICE_ACT = 0 or B.BID_AGENT_PRICE_ACT is null) ";
		} else {
			strBID_AGENT_PRICE_ACT = "";
		}
		if("1".equals(strRECEIPT1_DATE)) {
			strRECEIPT1_DATE = " B.RECEIPT1_DATE is not null ";
		} else if ("2".equals(strRECEIPT1_DATE)) {
			strRECEIPT1_DATE = " B.RECEIPT1_DATE is null ";
		} else {
			strRECEIPT1_DATE = "";
		}
		if("1".equals(strRECEIPT1_VALUE_DATE)) {
			strRECEIPT1_VALUE_DATE = " B.RECEIPT1_VALUE_DATE is not null ";
		} else if ("2".equals(strRECEIPT1_VALUE_DATE)) {
			strRECEIPT1_VALUE_DATE = " B.RECEIPT1_VALUE_DATE is null ";
		} else {
			strRECEIPT1_VALUE_DATE = "";
		}
		PROJECT_NAME = StringUtil.replaceDatabaseKeyword_mysql(PROJECT_NAME);
		CNTRCT_NAME = StringUtil.replaceDatabaseKeyword_mysql(CNTRCT_NAME);
		//查询总记录数
		int totalCount = bidDao.queryBidAndBidCntrctCountByPage(strBID_AGENT_PRICE_ACT,
				strRECEIPT1_DATE, strRECEIPT1_VALUE_DATE, newCntrctNos, finishStatuss, PROJECT_NAME, BID_NO_LOW,
				BID_NO_HIGH, CNTRCT_YEAR, CNTRCT_NO, BID_COMP_NO, CNTRCT_NAME, CNTRCT_TYPE, CNTRCT_ST_DATE, CNTRCT_ED_DATE,
				BID_EXPERT_COMMISION_APPLY_ST_DATE,BID_EXPERT_COMMISION_APPLY_ED_DATE,PROJECT_MANAGER, BID_NO);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<BidDto> list = bidDao.queryBidAndBidCntrctByPage(strBID_AGENT_PRICE_ACT,
				strRECEIPT1_DATE, strRECEIPT1_VALUE_DATE, newCntrctNos, finishStatuss, PROJECT_NAME, BID_NO_LOW,
				BID_NO_HIGH, CNTRCT_YEAR, CNTRCT_NO, BID_COMP_NO, CNTRCT_NAME, CNTRCT_TYPE, CNTRCT_ST_DATE, CNTRCT_ED_DATE,
				BID_EXPERT_COMMISION_APPLY_ST_DATE,BID_EXPERT_COMMISION_APPLY_ED_DATE,PROJECT_MANAGER, BID_NO,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		//查询各个合同对应的招标数量以及对应状态、金额等
		if(list != null && list.size() > 0) {
			for(BidDto bid : list) {
				List<BidCompDto> joinBidCompList = bidCompDao.queryAllBidCompExport(bid.getBID_NO(), "", "");
				//缴纳保证金单位数
				List<BidCompDto> bondList = new ArrayList<BidCompDto>();
				if(joinBidCompList != null && joinBidCompList.size() > 0) {
					for(BidCompDto comp : joinBidCompList) {
						if(comp.getBID_VALUE_DATE() != null) {
							bondList.add(comp);
						}
					}
				}
				bid.setBondBidCompList(bondList);
				//报名单位数
				bid.setJoinBidCompList(joinBidCompList);
			}
		}
		
		page.setItems(list);
		return page;
	}
		
	@Override
	public List<BidCompExportDto> queryAllBidCompExport(
			String strBID_AGENT_PRICE_ACT, String strRECEIPT1_DATE, String strRECEIPT1_VALUE_DATE,
			String cntrctNos, String finishStatuss, String PROJECT_NAME, String BID_NO_LOW, String BID_NO_HIGH,
			String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO, String CNTRCT_NAME, String CNTRCT_TYPE,
			String CNTRCT_ST_DATE, String CNTRCT_ED_DATE) {
		String newCntrctNos = "";
		if(StringUtil.isNotBlank(cntrctNos)) {
			String[] cntrctNoList = cntrctNos.split(",");
			for(String s : cntrctNoList) {
				if(StringUtil.isNotBlank(s)) {
					newCntrctNos += "'" + s + "',";
				}
			}
			newCntrctNos = newCntrctNos.substring(0, newCntrctNos.length() - 1);
		}
		if("1".equals(strBID_AGENT_PRICE_ACT)) {
			strBID_AGENT_PRICE_ACT = " B.BID_AGENT_PRICE_ACT > 0 ";
		} else if ("2".equals(strBID_AGENT_PRICE_ACT)) {
			strBID_AGENT_PRICE_ACT = " (B.BID_AGENT_PRICE_ACT = 0 or B.BID_AGENT_PRICE_ACT is null) ";
		} else {
			strBID_AGENT_PRICE_ACT = "";
		}
		if("1".equals(strRECEIPT1_DATE)) {
			strRECEIPT1_DATE = " B.RECEIPT1_DATE is not null ";
		} else if ("2".equals(strRECEIPT1_DATE)) {
			strRECEIPT1_DATE = " B.RECEIPT1_DATE is null ";
		} else {
			strRECEIPT1_DATE = "";
		}
		if("1".equals(strRECEIPT1_VALUE_DATE)) {
			strRECEIPT1_VALUE_DATE = " B.RECEIPT1_VALUE_DATE is not null ";
		} else if ("2".equals(strRECEIPT1_VALUE_DATE)) {
			strRECEIPT1_VALUE_DATE = " B.RECEIPT1_VALUE_DATE is null ";
		} else {
			strRECEIPT1_VALUE_DATE = "";
		}
		PROJECT_NAME = StringUtil.replaceDatabaseKeyword_mysql(PROJECT_NAME);
		CNTRCT_NAME = StringUtil.replaceDatabaseKeyword_mysql(CNTRCT_NAME);
		List<BidCompExportDto> listall = new ArrayList<BidCompExportDto>();
		List<BidDto> list = bidDao.queryAllBidExport(strBID_AGENT_PRICE_ACT, strRECEIPT1_DATE, strRECEIPT1_VALUE_DATE,
				newCntrctNos, finishStatuss, PROJECT_NAME, BID_NO_LOW, BID_NO_HIGH, CNTRCT_YEAR, CNTRCT_NO,
				BID_COMP_NO, CNTRCT_NAME, CNTRCT_TYPE, CNTRCT_ST_DATE, CNTRCT_ED_DATE, "");
		if(list != null && list.size() > 0) {
			Map<String, String> userMap = new HashMap<String, String>();
			List<UserInfoDto> userList = userInfoDao.queryAllUser();
			if(userList != null) {
				for(UserInfoDto user : userList) {
					userMap.put(user.getLOGIN_ID(), user.getLOGIN_NAME());
				}
			}
			
			for(BidDto bid : list) {
				//会审监管人
				if(StringUtil.isNotBlank(bid.getPROJECT_AUTH())) {
					SuperviseLibDto superviseLib = superviseLibDao.querySuperviseLibByID(bid.getPROJECT_AUTH());
					if(superviseLib != null) {
						bid.setPROJECT_AUTH_NAME(superviseLib.getSUPERVISE_NAME());
					}
				}
				
				//专家费申请人
				bid.setBID_EXPERT_COMMISION_APPLY_NAME(userMap.get(bid.getBID_EXPERT_COMMISION_APPLY()));
				//担当者
				bid.setPROJECT_MANAGER_NAME(userMap.get(bid.getPROJECT_MANAGER()));
				//评审人
				bid.setBID_AUTH_NAME(userMap.get(bid.getBID_AUTH()));
				
				//查询评审专家
				String expertids = bid.getBID_EXPERT_LIST();
				if(StringUtil.isNotBlank(expertids)) {
					expertids = expertids.substring(0, expertids.length() - 1);
					List<ExpertLibDto> expertList = expertLibDao.queryExpertLibByIds(expertids);
					if(expertList != null && expertList.size() > 0) {
						String BID_EXPERT_NAME_LIST = "";
						for(ExpertLibDto expert : expertList) {
							BID_EXPERT_NAME_LIST += expert.getEXPERT_NAME() + ",";
						}
						bid.setBID_EXPERT_NAME_LIST(BID_EXPERT_NAME_LIST);
					}
				}
				//查询投标公司
				String compids = bid.getBID_CO_LIST();
				if(StringUtil.isNotBlank(compids)) {
					compids = compids.substring(0, compids.length() - 1);
					List<BidCompDto> bidCompList = bidCompDao.queryBidCompByIds(compids);
					if(bidCompList != null && bidCompList.size() > 0) {
						for(BidCompDto bidComp : bidCompList) {
							//查询报名内容
							bidComp.setListBidCompApply(bidCompApplyDao.queryBidCompApplyByBidCoNo("" + bidComp.getBID_CO_NO()));
							
							//拷贝招标信息
							BidCompExportDto bidCompExport = copyBid2BidCompExport(bid);
							//拷贝投标公司信息
							bidCompExport = copyBidComp2BidCompExport(bidCompExport, bidComp);
							listall.add(bidCompExport);
						}
					} else {
						//投标公司为空
						BidCompExportDto bidCompExport = copyBid2BidCompExport(bid);
						listall.add(bidCompExport);
					}
				} else {
					//投标公司为空
					BidCompExportDto bidCompExport = copyBid2BidCompExport(bid);
					listall.add(bidCompExport);
				}
			}
		}
		return listall;
	}
	
	@Override
	public List<BidCompDto> queryBidComp(BidDto bid){
		List<BidCompDto> bidCompList = null;
		
		//查询投标公司
		String compids = bid.getBID_CO_LIST();
		if(StringUtil.isNotBlank(compids)) {
			compids = compids.substring(0, compids.length() - 1);
			bidCompList = bidCompDao.queryBidCompByIds(compids);		
		}
		return bidCompList;
	}
	
	@Override
	public Page queryBidByPage(String bidNoLow, String bidNoHigh,
			String projectType, String openDateLow, String openDateHigh,
			String agentNo, String agentName, String bidCoName, String receipt1No, Page page, String bidStatus) {
		agentName = StringUtil.replaceDatabaseKeyword_mysql(agentName);
		bidCoName = StringUtil.replaceDatabaseKeyword_mysql(bidCoName);
		receipt1No = StringUtil.replaceDatabaseKeyword_mysql(receipt1No);
		if(StringUtil.isBlank(bidStatus) || "000".equals(bidStatus)) {
			bidStatus = "'1','2','3'";
		} else {
			String tmp = "";
			bidStatus = bidStatus.replace("0", "");
			for(int i = 0; i < bidStatus.length(); i++) {
				tmp += "'" + bidStatus.subSequence(i, i + 1) + "',";
			}
			if(StringUtil.isNotBlank(tmp)) {
				tmp = tmp.substring(0, tmp.length() - 1);
			}
			bidStatus = tmp;
		}
		bidNoLow = StringUtil.replaceDatabaseKeyword_mysql(bidNoLow);
		bidNoHigh = StringUtil.replaceDatabaseKeyword_mysql(bidNoHigh);
		agentNo = StringUtil.replaceDatabaseKeyword_mysql(agentNo);
		//查询总记录数
		int totalCount = bidDao.queryBidCountByPage(bidNoLow, bidNoHigh,
				projectType, openDateLow, openDateHigh, agentNo, agentName, bidStatus, bidCoName, receipt1No);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<BidDto> list = bidDao.queryBidByPage(bidNoLow, bidNoHigh, projectType, openDateLow,
				openDateHigh, agentNo, agentName, bidCoName, receipt1No, page.getStartIndex() * page.getPageSize(), page.getPageSize(), bidStatus);
		page.setItems(list);
		return page;
	}

	@Override
	public BidDto queryBidByID(String bidNo) {
		return bidDao.queryBidByID(bidNo);
	}
	
	@Override
	public List<BidDto> queryAllBidByCntrctNo(String CNTRCT_NO) {
		return bidDao.queryAllBidByCntrctNo(CNTRCT_NO);
	}

	@Override
	public BidDto queryAllBidByID(String bidNo) {
		BidDto bid = bidDao.queryAllBidByID(bidNo);
		if(bid != null) {
			bid.setBID_EXPERT_COMMISION_ACT_YUAN(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_ACT_YUAN_SHOW()));
			bid.setBID_EXPERT_COMMISION_PRE_YUAN(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_PRE_YUAN_SHOW()));
			bid.setBID_EXPERT_COMMISION_ACT_YUAN1(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_ACT_YUAN_SHOW1()));
			bid.setBID_EXPERT_COMMISION_PRE_YUAN1(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_PRE_YUAN_SHOW1()));
			bid.setBID_EXPERT_COMMISION_ACT_YUAN2(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_ACT_YUAN_SHOW2()));
			bid.setBID_EXPERT_COMMISION_PRE_YUAN2(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_PRE_YUAN_SHOW2()));
			bid.setBID_EXPERT_COMMISION_ACT_YUAN3(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_ACT_YUAN_SHOW3()));
			bid.setBID_EXPERT_COMMISION_PRE_YUAN3(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_PRE_YUAN_SHOW3()));
			BidCntrctDto bidCntrct = bidCntrctDao.queryBidCntrctByID(bid.getCNTRCT_NO());
			if(bidCntrct != null) {
				bid.setCNTRCT_NAME(bidCntrct.getCNTRCT_NAME());
				//合同类别名称从合同表中带出
				bid.setCNTRCT_TYPE_NAME(bidCntrct.getCNTRCT_TYPE_NAME());
				bid.setCNTRCT_YEAR(bidCntrct.getCNTRCT_YEAR());
				bid.setCNTRCT_ST_DATE(bidCntrct.getCNTRCT_ST_DATE());
				bid.setCNTRCT_ED_DATE(bidCntrct.getCNTRCT_ED_DATE());
				bid.setBID_COMP_NO(bidCntrct.getBID_COMP_NO());
				bid.setBID_COMP_NAME(bidCntrct.getBID_COMP_NAME());
				bid.setCO_MANAGER1(bidCntrct.getCO_MANAGER1());
				bid.setCO_MANAGER_TEL1(bidCntrct.getCO_MANAGER_TEL1());
				bid.setCO_ADDRESS1(bidCntrct.getCO_ADDRESS1());
				bid.setCO_MANAGER_EMAIL1(bidCntrct.getCO_MANAGER_EMAIL1());
				bid.setCO_TAX(bidCntrct.getCO_TAX());
			}
		}
		return bid;
	}
	
	@Override
	public BidDto queryAllBidByID2(String bidNo) {
		BidDto bid = bidDao.queryAllBidByID2(bidNo);
		if(bid != null) {
			bid.setBID_EXPERT_COMMISION_ACT_YUAN(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_ACT_YUAN_SHOW()));
			bid.setBID_EXPERT_COMMISION_PRE_YUAN(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_PRE_YUAN_SHOW()));
			bid.setBID_EXPERT_COMMISION_ACT_YUAN1(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_ACT_YUAN_SHOW1()));
			bid.setBID_EXPERT_COMMISION_PRE_YUAN1(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_PRE_YUAN_SHOW1()));
			bid.setBID_EXPERT_COMMISION_ACT_YUAN2(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_ACT_YUAN_SHOW2()));
			bid.setBID_EXPERT_COMMISION_PRE_YUAN2(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_PRE_YUAN_SHOW2()));
			bid.setBID_EXPERT_COMMISION_ACT_YUAN3(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_ACT_YUAN_SHOW3()));
			bid.setBID_EXPERT_COMMISION_PRE_YUAN3(TbpsUtil.bigDecimal2str(bid.getBID_EXPERT_COMMISION_PRE_YUAN_SHOW3()));
			BidCntrctDto bidCntrct = bidCntrctDao.queryBidCntrctByID(bid.getCNTRCT_NO());
			if(bidCntrct != null) {
				bid.setCNTRCT_NAME(bidCntrct.getCNTRCT_NAME());
				//合同类别名称从合同表中带出
				bid.setCNTRCT_TYPE_NAME(bidCntrct.getCNTRCT_TYPE_NAME());
				bid.setCNTRCT_YEAR(bidCntrct.getCNTRCT_YEAR());
				bid.setCNTRCT_ST_DATE(bidCntrct.getCNTRCT_ST_DATE());
				bid.setCNTRCT_ED_DATE(bidCntrct.getCNTRCT_ED_DATE());
				bid.setBID_COMP_NO(bidCntrct.getBID_COMP_NO());
				bid.setBID_COMP_NAME(bidCntrct.getBID_COMP_NAME());
				bid.setCO_MANAGER1(bidCntrct.getCO_MANAGER1());
				bid.setCO_MANAGER_TEL1(bidCntrct.getCO_MANAGER_TEL1());
				bid.setCO_ADDRESS1(bidCntrct.getCO_ADDRESS1());
				bid.setCO_MANAGER_EMAIL1(bidCntrct.getCO_MANAGER_EMAIL1());
				bid.setCO_TAX(bidCntrct.getCO_TAX());
			}
		}
		return bid;
	}
	
	@Override
	public String insertBidNew(BidDto bidDto, List<BidCompDto> listBidComp, List<ExpertLibDto> listExpertLib) {
		//招标编号
		String bidNo = "";
		
		if("3".equals(bidDto.getCNTRCT_TYPE())) {
			//招标办
			bidNo = bidDto.getBID_NO();
		} else {
			//非招标办
			if("1".equals(bidDto.getIS_RANDOM())) {
				//自动生产招标编号
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
				String key = sdf.format(new Date());
				int newValue = 1;
				ConfigTabDto config = null;
				if("1".equals(bidDto.getCNTRCT_TYPE())
					|| "5".equals(bidDto.getCNTRCT_TYPE())
					|| "9".equals(bidDto.getCNTRCT_TYPE())) {
					//类型=招标
					//其他类别9，默认为招标
					config = configTabDao.queryConfigTabByKey(key, Constants.CONFIG_TAB_BID_ZB_SEQ);
				} else if("2".equals(bidDto.getCNTRCT_TYPE())) {
					//类型=比选
					config = configTabDao.queryConfigTabByKey(key, Constants.CONFIG_TAB_BID_BX_SEQ);
				} else if("4".equals(bidDto.getCNTRCT_TYPE())
						|| "6".equals(bidDto.getCNTRCT_TYPE())
						|| "7".equals(bidDto.getCNTRCT_TYPE())) {
					//类型=竞价
					config = configTabDao.queryConfigTabByKey(key, Constants.CONFIG_TAB_BID_JJ_SEQ);
				}
				if(config == null) {
					newValue = 1;
				} else {
					newValue = Integer.valueOf(config.getCONFIG_VAL()) + 1;
				}
				
				while(true) {
					if("1".equals(bidDto.getCNTRCT_TYPE())
						|| "5".equals(bidDto.getCNTRCT_TYPE())
						|| "9".equals(bidDto.getCNTRCT_TYPE())) {
						//招标编号，类型=招标
						//其他类别9，默认为招标
						bidNo = "LHZB-" + key.substring(0, 4) + "-" + StringUtil.replenishStr("" + newValue, 3);
					} else if("2".equals(bidDto.getCNTRCT_TYPE())) {
						//招标编号，类型=比选
						bidNo = "LHBX-" + key.substring(0, 4) + "-" + StringUtil.replenishStr("" + newValue, 3);
					} else if("4".equals(bidDto.getCNTRCT_TYPE())
							|| "6".equals(bidDto.getCNTRCT_TYPE())
							|| "7".equals(bidDto.getCNTRCT_TYPE())) {
						//招标编号，类型=竞价
						bidNo = "LHJJ-" + key.substring(0, 4) + "-" + StringUtil.replenishStr("" + newValue, 3);
					}

					//验证自动生成的招标编号是否已存在
					BidDto b = bidDao.queryAllBidByID2(bidNo);
					//循环生成招标编号，直到招标编号不存在为止
					if(b == null) {
						//招标编号不存在，则更新配置标，并跳出循环
						if(config == null) {
							//新增配置表记录
							ConfigTabDto newConfig = new ConfigTabDto();
							if("1".equals(bidDto.getCNTRCT_TYPE())
								|| "5".equals(bidDto.getCNTRCT_TYPE())
								|| "9".equals(bidDto.getCNTRCT_TYPE())) {
								//类型=招标
								newConfig.setCONFIG_TYPE(Constants.CONFIG_TAB_BID_ZB_SEQ);
							} else if("2".equals(bidDto.getCNTRCT_TYPE())) {
								//类型=比选
								newConfig.setCONFIG_TYPE(Constants.CONFIG_TAB_BID_BX_SEQ);
							} else if("4".equals(bidDto.getCNTRCT_TYPE())
									|| "6".equals(bidDto.getCNTRCT_TYPE())
									|| "7".equals(bidDto.getCNTRCT_TYPE())) {
								//类型=竞价
								newConfig.setCONFIG_TYPE(Constants.CONFIG_TAB_BID_JJ_SEQ);
							}
							newConfig.setCONFIG_KEY(key);
							//新增时默认为1
							newConfig.setCONFIG_VAL("" + newValue);
							configTabDao.insertConfigTab(newConfig);
						} else {
							//更新配置
							config.setCONFIG_VAL("" + newValue);
							configTabDao.updateConfigTab(config);
						}
						break;
					}
					newValue++;
					//判断编号是否大于999
					if(newValue > 999) {
						throw new RuntimeException("自动生成的招标编号已超过999，请联系系统管理员！");
					}
				}
				bidDto.setBID_NO(bidNo);
			} else {
				//验证用户自己填的招标编号是否存在
				bidNo = bidDto.getBID_NO();
				int i = 1;
				while(true) {
					BidDto b = bidDao.queryAllBidByID2(bidNo);
					if(b == null) {
						break;
					} else {
						//该招标编号存在，则将招标编号转化为XXXX-YYYY-NNNN-A格式
						bidNo = bidDto.getBID_NO();
						bidNo = bidNo + "-" + i;
					}
					if(i > 9) {
						throw new RuntimeException(bidDto.getBID_NO() + "已存在，并且" + bidDto.getBID_NO() + "-1~" + bidDto.getBID_NO() + "-9" + "也已存在！");
					}
					i++;
				}
				bidDto.setBID_NO(bidNo);
			}
		}
		
		bidDao.insertBid(bidDto);

		String bidCompName = "";
		String bidCompIds = "";
		//中标金额一览
		String BID_PRICE_LIST = "";
		//保存招标公司信息
		if(listBidComp != null && listBidComp.size() > 0) {
			//报名要求
			String bidrequire = bidDto.getAPPLY_REQUIRE();
			String tmplist[] = null;
			if(StringUtil.isNotBlank(bidrequire)) {
				tmplist = bidrequire.split("\r\n");
			}
			
			for(BidCompDto bidcomp : listBidComp) {
				//保证金
				if(bidDto.getBID_BOND() != null) {
					//招标的保证金要保存到投标公司里去
					bidcomp.setBID_BOND(bidDto.getBID_BOND());
				} else {
					//说明招标清空了保证金，所以默认值=0
					bidcomp.setBID_BOND(new BigDecimal(0));
				}
				//标书费
				if(bidDto.getBID_APPLY_PRICE() != null) {
					//招标的标书费要保存到投标公司里去
					bidcomp.setBID_APPLY_PRICE(bidDto.getBID_APPLY_PRICE());
				} else {
					//说明招标清空了标书费，所以默认值=0
					bidcomp.setBID_APPLY_PRICE(new BigDecimal(0));
				}
				
				bidcomp.setBID_NO(bidNo);
				bidcomp.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
				bidcomp.setUPDATE_USER(bidDto.getUPDATE_USER());
				
				if("1".equals(bidcomp.getBID_RESULT())) {
					BID_PRICE_LIST += bidcomp.getBID_WIN_PRICE() + ";";
					bidCompName += bidcomp.getBID_CO_NAME() + ";";
				}
				
				bidCompDao.insertBidComp(bidcomp);
				
				//报名要求
				if(tmplist != null) {
					int i = 1;
					for(String s : tmplist) {
						if(StringUtil.isNotBlank(s)) {
							//新增
							BidCompApplyDto apply = new BidCompApplyDto();
							apply.setAPPLY_REQUIRE(s);
							apply.setAPPLY_NOTE("");
							apply.setAPPLY_SORT(i);
							//状态=有效
							apply.setSTATUS(1);
							apply.setBID_NO(bidNo);
							apply.setBID_CO_NO(bidcomp.getBID_CO_NO());
							bidCompApplyDao.insertBidCompApply(apply);
							i++;
						}
					}
				}
				
				bidCompIds += bidcomp.getBID_CO_NO() + ",";
			}
		}
		bidDto.setBID_CO_LIST(bidCompIds);
		bidDto.setBID_CO_NAME(bidCompName);
		bidDto.setBID_PRICE_LIST(BID_PRICE_LIST);
		
		//专家列表
		String expertLibIds = "";
		if(listExpertLib != null && listExpertLib.size() > 0) {
			for(ExpertLibDto expertLib : listExpertLib) {
				expertLibIds += expertLib.getEXPERT_SEQ() + ",";
			}
		}
		bidDto.setBID_EXPERT_LIST(expertLibIds);
		
		bidDao.updateBid(bidDto);
		
		//插入招标履历
		insertBidHistNew(bidDto);
		return bidNo;
	}

	@Override
	public void updateBidNew(BidDto bidDto, List<BidCompDto> listBidComp, List<ExpertLibDto> listExpertLib) {
		BidDto oldbid = bidDao.queryBidByID(bidDto.getBID_NO());
		if(oldbid != null) {
			bidDto.setGEN_VERIFY_RPT_DATE(oldbid.getGEN_VERIFY_RPT_DATE());
			bidDto.setGEN_REGISTE_RPT_DATE(oldbid.getGEN_REGISTE_RPT_DATE());
		}
		
		//先删除所有投标公司
		bidCompDao.delBidCompByBidNo(bidDto.getBID_NO(), bidDto.getUPDATE_USER());
		
		//BidDto oldbid = bidDao.queryBidByID(bidDto.getBID_NO());
		
		//更新投标公司
		String bidCompName = "";
		String bidCompIds = "";
		//中标金额一览
		String BID_PRICE_LIST = "";
		if(listBidComp != null && listBidComp.size() > 0) {
			//报名要求
			String tmplist[] = null;
			//报名要求
			String bidrequire = bidDto.getAPPLY_REQUIRE();
			if(StringUtil.isNotBlank(bidrequire)) {
				tmplist = bidrequire.split("\r\n");
			}
			
			for(BidCompDto bidcomp : listBidComp) {
				//保证金
				if(bidDto.getBID_BOND() != null) {
					//招标的保证金要保存到投标公司里去
					bidcomp.setBID_BOND(bidDto.getBID_BOND());
				} else {
					//说明招标清空了保证金，所以默认值=0
					bidcomp.setBID_BOND(new BigDecimal(0));
				}
				//标书费
				if(bidDto.getBID_APPLY_PRICE() != null) {
					//招标的标书费要保存到投标公司里去
					bidcomp.setBID_APPLY_PRICE(bidDto.getBID_APPLY_PRICE());
				} else {
					//说明招标清空了标书费，所以默认值=0
					bidcomp.setBID_APPLY_PRICE(new BigDecimal(0));
				}
				
				//这里重置下招标编号，从主表中获得
				bidcomp.setBID_NO(bidDto.getBID_NO());
				//删除标志
				bidcomp.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
				//更新人
				bidcomp.setUPDATE_USER(bidDto.getUPDATE_USER());
				
				if(bidcomp.getBID_CO_NO() != null) {
					//更新投标公司
					bidCompDao.updateBidComp(bidcomp);
				} else {
					//新增投标公司
					bidCompDao.insertBidComp(bidcomp);
				}
				
				if("1".equals(bidcomp.getBID_RESULT())) {
					BID_PRICE_LIST += bidcomp.getBID_WIN_PRICE() + ";";
					bidCompName += bidcomp.getBID_CO_NAME() + ";";
				}
				
				bidCompIds += bidcomp.getBID_CO_NO() + ",";
				
				//报名内容
				//将所有记录状态设置=0
				bidCompApplyDao.updBidCompApplyStatusByBidCoNo(bidDto.getBID_NO(), "" + bidcomp.getBID_CO_NO());
				String saveBidCompApply = bidcomp.getSaveBidCompApply();
				
				Map<String, String> map = new HashMap<String, String>();
				if(StringUtil.isNotBlank(saveBidCompApply)) {
					String ll[] = saveBidCompApply.split("####");
					for(String s : ll) {
						String lll[] = s.split("@@@@");
						String require = lll[1];
						map.put(require, s);
					}
				}
				
				int sort = 1;
				if (tmplist!= null){
					for(String rr : tmplist) {
						if(map.containsKey(rr)) {
							//该报名要求存在
							String lll[] = map.get(rr).split("@@@@");
							String id = lll[0];
							String require = lll[1];
							String note = "";
							if(lll.length == 3) {
								note = lll[2];
							}
							//更新
							BidCompApplyDto apply = bidCompApplyDao.queryBidCompApplyByID(id);
							if(apply != null) {
								apply.setAPPLY_REQUIRE(require);
								apply.setAPPLY_NOTE(note);
								apply.setAPPLY_SORT(sort);
								//状态=有效
								apply.setSTATUS(1);
								bidCompApplyDao.updBidCompApply(apply);
							}
						} else {
							//不存在，则新增
							BidCompApplyDto apply = new BidCompApplyDto();
							apply.setAPPLY_REQUIRE(rr);
							apply.setAPPLY_NOTE("");
							apply.setAPPLY_SORT(sort);
							//状态=有效
							apply.setSTATUS(1);
							apply.setBID_NO(bidDto.getBID_NO());
							apply.setBID_CO_NO(bidcomp.getBID_CO_NO());
							bidCompApplyDao.insertBidCompApply(apply);
						}
						sort++;
					}
					//删除所有无效的数据
					bidCompApplyDao.delBidCompApplyByBidCoNo(bidDto.getBID_NO(), "" + bidcomp.getBID_CO_NO());
				}		
			}
		}
		
		bidDto.setBID_CO_LIST(bidCompIds);
		bidDto.setBID_CO_NAME(bidCompName);
		bidDto.setBID_PRICE_LIST(BID_PRICE_LIST);
		
		//专家列表
		String expertLibIds = "";
		if(listExpertLib != null && listExpertLib.size() > 0) {
			for(ExpertLibDto expertLib : listExpertLib) {
				expertLibIds += expertLib.getEXPERT_SEQ() + ",";
			}
		}
		bidDto.setBID_EXPERT_LIST(expertLibIds);
				
		//更新招标
		bidDao.updateBid(bidDto);
		//插入招标履历
		insertBidHistNew(bidDto);
	}
	
	@Override
	public String insertBid(BidDto bidDto) {
		//招标编号
		String bidNo = "";
		
//		if("3".equals(bidDto.getPROJECT_TYPE())) {
		if("3".equals("")) {
			//招标办
			bidNo = bidDto.getBID_NO();
		} else {
			//非招标办
//			if("1".equals(bidDto.getIS_RANDOM())) {
			if("1".equals("")) {
				//自动生产招标编号
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
				String key = sdf.format(new Date());
				int newValue = 1;
				ConfigTabDto config = null;
//				if("1".equals(bidDto.getPROJECT_TYPE())) {
//					//类型=招标
//					config = configTabDao.queryConfigTabByKey(key, Constants.CONFIG_TAB_BID_ZB_SEQ);
//				} else if("2".equals(bidDto.getPROJECT_TYPE())) {
//					//类型=比选
//					config = configTabDao.queryConfigTabByKey(key, Constants.CONFIG_TAB_BID_BX_SEQ);
//				} else if("4".equals(bidDto.getPROJECT_TYPE())) {
//					//类型=竞价
//					config = configTabDao.queryConfigTabByKey(key, Constants.CONFIG_TAB_BID_JJ_SEQ);
//				}
				if (config == null) {
					newValue = 1;
				} else {
					newValue = Integer.valueOf(config.getCONFIG_VAL()) + 1;
				}
				
				while(true) {
//					if("1".equals(bidDto.getPROJECT_TYPE())) {
//						//招标编号，类型=招标
//						bidNo = "LHZB-" + key.substring(2, 4) + "-" + StringUtil.replenishStr("" + newValue, 3);
//					} else if("2".equals(bidDto.getPROJECT_TYPE())) {
//						//招标编号，类型=比选
//						bidNo = "LHBX-" + key.substring(2, 4) + "-" + StringUtil.replenishStr("" + newValue, 3);
//					} else if("4".equals(bidDto.getPROJECT_TYPE())) {
//						//招标编号，类型=竞价
//						bidNo = "LHJJ-" + key.substring(2, 4) + "-" + StringUtil.replenishStr("" + newValue, 3);
//					}

					//验证自动生成的招标编号是否已存在
					BidDto b = bidDao.queryAllBidByID2(bidNo);
					//循环生成招标编号，直到招标编号不存在为止
					if(b == null) {
						//招标编号不存在，则更新配置标，并跳出循环
						if(config == null) {
							//新增配置表记录
//							ConfigTabDto newConfig = new ConfigTabDto();
//							if("1".equals(bidDto.getPROJECT_TYPE())) {
//								//类型=招标
//								newConfig.setCONFIG_TYPE(Constants.CONFIG_TAB_BID_ZB_SEQ);
//							} else if("2".equals(bidDto.getPROJECT_TYPE())) {
//								//类型=比选
//								newConfig.setCONFIG_TYPE(Constants.CONFIG_TAB_BID_BX_SEQ);
//							} else if("4".equals(bidDto.getPROJECT_TYPE())) {
//								//类型=竞价
//								newConfig.setCONFIG_TYPE(Constants.CONFIG_TAB_BID_JJ_SEQ);
//							}
//							newConfig.setCONFIG_KEY(key);
//							//新增时默认为1
//							newConfig.setCONFIG_VAL("" + newValue);
//							configTabDao.insertConfigTab(newConfig);
						} else {
							//更新配置
							config.setCONFIG_VAL("" + newValue);
							configTabDao.updateConfigTab(config);
						}
						break;
					}
					newValue++;
					//判断编号是否大于999
					if(newValue > 999) {
						throw new RuntimeException("自动生成的招标编号已超过999，请联系系统管理员！");
					}
				}
				bidDto.setBID_NO(bidNo);
			} else {
				//验证用户自己填的招标编号是否存在
				bidNo = bidDto.getBID_NO();
				int i = 1;
				while(true) {
					BidDto b = bidDao.queryAllBidByID2(bidNo);
					if(b == null) {
						break;
					} else {
						//该招标编号存在，则将招标编号转化为XXXX-YY-NNN-A格式
						bidNo = bidDto.getBID_NO();
						bidNo = bidNo + "-" + i;
					}
					if(i > 9) {
						throw new RuntimeException(bidDto.getBID_NO() + "已存在，并且" + bidDto.getBID_NO() + "-1~" + bidDto.getBID_NO() + "-9" + "也已存在！");
					}
					i++;
				}
				bidDto.setBID_NO(bidNo);
			}
		}
		
		bidDao.insertBid(bidDto);
		//插入招标履历
		insertBidHist(bidDto);
		return bidNo;
	}

	@Override
	public String insertBid(BidDto bidDto, List<BidCompDto> listBidComp, List<ExpertLibDto> listExpertLib) throws RuntimeException {
		//招标编号
		String bidNo = "";
		
		//保存投标公司
		String BID_CO_LIST = "";
		
		Integer bidCoNo = null;
		String bidCoName = "";
		BigDecimal bidWinPrice = null;
		BigDecimal bidApplyPrice = null;
		String bidWinPriceList = "";
		
//		if("3".equals(bidDto.getPROJECT_TYPE())) {
//			//招标办
//			bidNo = bidDto.getBID_NO();
//		} else {
//			//非招标办
//			if("1".equals(bidDto.getIS_RANDOM())) {
//				//自动生产招标编号
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
//				String key = sdf.format(new Date());
//				int newValue = 1;
//				ConfigTabDto config = null;
//				if("1".equals(bidDto.getPROJECT_TYPE())) {
//					//类型=招标
//					config = configTabDao.queryConfigTabByKey(key, Constants.CONFIG_TAB_BID_ZB_SEQ);
//				} else if("2".equals(bidDto.getPROJECT_TYPE())) {
//					//类型=比选
//					config = configTabDao.queryConfigTabByKey(key, Constants.CONFIG_TAB_BID_BX_SEQ);
//				} else if("4".equals(bidDto.getPROJECT_TYPE())) {
//					//类型=竞价
//					config = configTabDao.queryConfigTabByKey(key, Constants.CONFIG_TAB_BID_JJ_SEQ);
//				}
//
//				if(config == null) {
//					newValue = 1;
//				} else {
//					newValue = Integer.valueOf(config.getCONFIG_VAL()) + 1;
//				}
//				
//				while(true) {
//					if("1".equals(bidDto.getPROJECT_TYPE())) {
//						//招标编号，类型=招标
//						bidNo = "LHZB-" + key.substring(2, 4) + "-" + StringUtil.replenishStr("" + newValue, 3);
//					} else if("2".equals(bidDto.getPROJECT_TYPE())) {
//						//招标编号，类型=比选
//						bidNo = "LHBX-" + key.substring(2, 4) + "-" + StringUtil.replenishStr("" + newValue, 3);
//					} else if("4".equals(bidDto.getPROJECT_TYPE())) {
//						//招标编号，类型=竞价
//						bidNo = "LHJJ-" + key.substring(2, 4) + "-" + StringUtil.replenishStr("" + newValue, 3);
//					}
//					//验证自动生成的招标编号是否已存在
//					BidDto b = bidDao.queryAllBidByID(bidNo);
//					//循环生成招标编号，直到招标编号不存在为止
//					if(b == null) {
//						//招标编号不存在，则更新配置标，并跳出循环
//						if(config == null) {
//							//新增配置表记录
//							ConfigTabDto newConfig = new ConfigTabDto();
//							if("1".equals(bidDto.getPROJECT_TYPE())) {
//								//类型=招标
//								newConfig.setCONFIG_TYPE(Constants.CONFIG_TAB_BID_ZB_SEQ);
//							} else if("2".equals(bidDto.getPROJECT_TYPE())) {
//								//类型=比选
//								newConfig.setCONFIG_TYPE(Constants.CONFIG_TAB_BID_BX_SEQ);
//							} else if("4".equals(bidDto.getPROJECT_TYPE())) {
//								//类型=竞价
//								newConfig.setCONFIG_TYPE(Constants.CONFIG_TAB_BID_JJ_SEQ);
//							}
//							newConfig.setCONFIG_KEY(key);
//							//新增时默认为1
//							newConfig.setCONFIG_VAL("" + newValue);
//							configTabDao.insertConfigTab(newConfig);
//						} else {
//							//更新配置
//							config.setCONFIG_VAL("" + newValue);
//							configTabDao.updateConfigTab(config);
//						}
//						break;
//					}
//					newValue++;
//					//判断编号是否大于999
//					if(newValue > 999) {
//						throw new RuntimeException("自动生成的招标编号已超过999，请联系系统管理员！");
//					}
//				}
//				bidDto.setBID_NO(bidNo);
//			} else {
//				//验证用户自己填的招标编号是否存在
//				bidNo = bidDto.getBID_NO();
//				int i = 1;
//				while(true) {
//					BidDto b = bidDao.queryAllBidByID(bidNo);
//					if(b == null) {
//						break;
//					} else {
//						//该招标编号存在，则将招标编号转化为XXXX-YY-NNN-A格式
//						bidNo = bidDto.getBID_NO();
//						bidNo = bidNo + "-" + i;
//					}
//					if(i > 9) {
//						throw new RuntimeException(bidDto.getBID_NO() + "已存在，并且" + bidDto.getBID_NO() + "-1~" + bidDto.getBID_NO() + "-9" + "也已存在！");
//					}
//					i++;
//				}
//				bidDto.setBID_NO(bidNo);
//			}
//		}
		
		if(listBidComp != null && listBidComp.size() > 0) {
			for(BidCompDto bidcomp : listBidComp) {
				//这里重置下招标编号，从主表中获得
				bidcomp.setBID_NO(bidDto.getBID_NO());
				//删除标志
				bidcomp.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
				//更新人
				bidcomp.setUPDATE_USER(bidDto.getUPDATE_USER());
				bidCompDao.insertBidComp(bidcomp);
				BID_CO_LIST += bidcomp.getBID_CO_NO() + ",";
				if(Constants.BID_RESULT_YES.equals(bidcomp.getBID_RESULT())) {
					//中标公司信息
					bidCoNo = bidcomp.getBID_CO_NO();
					bidCoName += bidcomp.getBID_CO_NAME() + ",";
					bidWinPrice = bidcomp.getBID_WIN_PRICE();
					bidWinPriceList += StringUtil.BigDecimal2Str(bidcomp.getBID_WIN_PRICE().divide(new BigDecimal(10000)), 6)+ ",";
							
					//标书费
					bidApplyPrice = bidcomp.getBID_APPLY_PRICE();
				}
			}
		}
		
		//中标公司信息
//		bidDto.setBID_CO_SEQ(bidCoNo);
		bidDto.setBID_CO_NAME(bidCoName);
		bidDto.setBID_PRICE(TbpsUtil.bigDecimal2str(bidWinPrice));
		bidDto.setBID_PRICE_LIST(bidWinPriceList);

		//标书费
		bidDto.setBID_APPLY_PRICE(TbpsUtil.bigDecimal2str(bidApplyPrice));
				
		log.info("BID_CO_LIST=" + BID_CO_LIST);
		bidDto.setBID_CO_LIST(BID_CO_LIST);
		
		bidDao.insertBid(bidDto);
		//插入招标履历
		insertBidHist(bidDto);
		return bidNo;
	}
	
	@Override
	public void updateBid(BidDto bidDto) {
		//更新招标
		bidDao.updateBid(bidDto);
		//插入招标履历
		System.out.println("before insertHist");
		insertBidHistNew(bidDto);
	}
	
	
	@Override
	public void updateBid(BidDto bidDto, List<BidCompDto> listBidComp, List<ExpertLibDto> listExpertLib) {
		//先删除所有投标公司
		bidCompDao.delBidCompByBidNo(bidDto.getBID_NO(), bidDto.getUPDATE_USER());
		
		//更新投标公司
		String BID_CO_LIST = "";
		
		Integer bidCoNo = null;
		String bidCoName = "";
		BigDecimal bidWinPrice = null;
		BigDecimal bidApplyPrice = null;
		String bidWinPriceList = "";
		
		if(listBidComp != null && listBidComp.size() > 0) {
			for(BidCompDto bidcomp : listBidComp) {
				//重新编号
				//bidcomp.setBID_CO_SEQ(i);
				//判断是否需要新增招标资料费
//				if(!"0".equals(bidDto.getBID_NEED_MATERIAL_PRICE())) {
//					//不需要，所以这里赋值0
//					bidcomp.setBID_APPLY_PRICE(new BigDecimal(0));
//				}
				
				//这里重置下招标编号，从主表中获得
				bidcomp.setBID_NO(bidDto.getBID_NO());
				//删除标志
				bidcomp.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
				//更新人
				bidcomp.setUPDATE_USER(bidDto.getUPDATE_USER());
				
				System.out.println("BID_CO_NO:"+ bidcomp.getBID_CO_NO());
				if(bidcomp.getBID_CO_NO() != null) {
					//更新投标公司
					bidCompDao.updateBidComp(bidcomp);
				} else {
					//新增投标公司
					bidCompDao.insertBidComp(bidcomp);
				}
				BID_CO_LIST += bidcomp.getBID_CO_NO() + ",";
				if(Constants.BID_RESULT_YES.equals(bidcomp.getBID_RESULT())) {
					//中标公司信息
					bidCoNo = bidcomp.getBID_CO_NO();
					bidCoName += bidcomp.getBID_CO_NAME() + ",";
					bidWinPrice = bidcomp.getBID_WIN_PRICE();
					bidWinPriceList += StringUtil.BigDecimal2Str(bidcomp.getBID_WIN_PRICE().divide(new BigDecimal(10000)), 6)+ ",";
					//标书费
					bidApplyPrice = bidcomp.getBID_APPLY_PRICE();
				}
				
				//报名内容
				//将所有记录状态设置=0
				bidCompApplyDao.updBidCompApplyStatusByBidCoNo(bidDto.getBID_NO(), "" + bidcomp.getBID_CO_NO());
				String saveBidCompApply = bidcomp.getSaveBidCompApply();
				
				String bidrequire = bidDto.getAPPLY_REQUIRE();
				Map<String, String> map = new HashMap<String, String>();
				if(StringUtil.isNotBlank(bidrequire)) {
					String tmplist[] = bidrequire.split("\r\n");				
					for(String s : tmplist) {
						map.put(s, "");
					}
/*					String s_buf;
					for(String s : tmplist) {
						s_buf = s;
						if (map.containsKey(s_buf)){
							while (map.containsKey(s_buf)){
								s_buf = s_buf + "1 ";
							}					
						}						
						map.put(s_buf, "");
					}
*/					
				}
				
				if(StringUtil.isNotBlank(saveBidCompApply)) {
					String ll[] = saveBidCompApply.split("####");
					int sort = 1;
					for(String s : ll) {
						if(StringUtil.isNotBlank(s)) {
							String lll[] = s.split("@@@@");
							String id = lll[0];
							String require = lll[1];
							String note = lll[2];
							if(map.get(require) != null) {
								//该报名要求存在
								if("0".equals(id)) {
									//新增
									BidCompApplyDto apply = new BidCompApplyDto();
									apply.setAPPLY_REQUIRE(require);
									apply.setAPPLY_NOTE(note);
									apply.setAPPLY_SORT(sort);
									//状态=有效
									apply.setSTATUS(1);
									apply.setBID_NO(bidDto.getBID_NO());
									apply.setBID_CO_NO(bidcomp.getBID_CO_NO());
									bidCompApplyDao.insertBidCompApply(apply);
								} else {
									//更新
									BidCompApplyDto apply = bidCompApplyDao.queryBidCompApplyByID(id);
									if(apply != null) {
										apply.setAPPLY_REQUIRE(require);
										apply.setAPPLY_NOTE(note);
										apply.setAPPLY_SORT(sort);
										//状态=有效
										apply.setSTATUS(1);
										bidCompApplyDao.updBidCompApply(apply);
									}
								}
							} else {
								//报名要求不存在，则需要删除
							}
							sort++;
						}
					}
					//更新投标公司
					bidcomp.setRESERVE1("1");
					bidCompDao.updateBidComp(bidcomp);
				} else {
					//更新投标公司
					bidcomp.setRESERVE1("0");
					bidCompDao.updateBidComp(bidcomp);
				}
				//删除所有无效的数据
				bidCompApplyDao.delBidCompApplyByBidCoNo(bidDto.getBID_NO(), "" + bidcomp.getBID_CO_NO());
			}
		}
		
		//中标公司信息
//		bidDto.setBID_CO_SEQ(bidCoNo);
		bidDto.setBID_CO_NAME(bidCoName);
		bidDto.setBID_PRICE(TbpsUtil.bigDecimal2str(bidWinPrice));
		bidDto.setBID_PRICE_LIST(bidWinPriceList);
		//标书费
		bidDto.setBID_APPLY_PRICE(TbpsUtil.bigDecimal2str(bidApplyPrice));
		
		log.info("BID_CO_LIST=" + BID_CO_LIST);
		bidDto.setBID_CO_LIST(BID_CO_LIST);
		//更新招标
		bidDao.updateBid(bidDto);
		//插入招标履历
		insertBidHist(bidDto);
	}
	
	@Override
	public void deleteBid(String bidNo, String username) {
		BidDto bid = bidDao.queryAllBidByID(bidNo);
		if(bid != null) {
			//删除标记=已删除
			bid.setDELETE_FLG(Constants.IS_DELETE_DEL);
			bid.setUPDATE_USER(username);
			bidDao.updateBid(bid);
			
			//删除招标合同
			List<BidCompDto> bidCompList = bidCompDao.queryAllBidCompExport(bidNo, "", "");
			if(bidCompList != null && bidCompList.size() > 0) {
				for(BidCompDto bidcomp : bidCompList) {
					//删除标记=已删除
					bidcomp.setDELETE_FLG(Constants.IS_DELETE_DEL);
					bidcomp.setUPDATE_USER(username);
					bidCompDao.updateBidComp(bidcomp);
				}
			}
			
			//插入招标履历
			insertBidHist(bid);
		}
	}

	@Override
	public List<BidDto> queryAllBidExport(String strBID_AGENT_PRICE_ACT, String strRECEIPT1_DATE, String strRECEIPT1_VALUE_DATE,
			String cntrctNos, String finishStatuss, String PROJECT_NAME, String BID_NO_LOW, String BID_NO_HIGH,
			String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO, String CNTRCT_NAME, String CNTRCT_TYPE,
			String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, String PROJECT_MANAGER) {
		String newCntrctNos = "";
		if(StringUtil.isNotBlank(cntrctNos)) {
			String[] cntrctNoList = cntrctNos.split(",");
			for(String s : cntrctNoList) {
				if(StringUtil.isNotBlank(s)) {
					newCntrctNos += "'" + s + "',";
				}
			}
			newCntrctNos = newCntrctNos.substring(0, newCntrctNos.length() - 1);
		}
		if("1".equals(strBID_AGENT_PRICE_ACT)) {
			strBID_AGENT_PRICE_ACT = " B.BID_AGENT_PRICE_ACT > 0 ";
		} else if ("2".equals(strBID_AGENT_PRICE_ACT)) {
			strBID_AGENT_PRICE_ACT = " (B.BID_AGENT_PRICE_ACT = 0 or B.BID_AGENT_PRICE_ACT is null) ";
		} else {
			strBID_AGENT_PRICE_ACT = "";
		}
		if("1".equals(strRECEIPT1_DATE)) {
			strRECEIPT1_DATE = " B.RECEIPT1_DATE is not null ";
		} else if ("2".equals(strRECEIPT1_DATE)) {
			strRECEIPT1_DATE = " B.RECEIPT1_DATE is null ";
		} else {
			strRECEIPT1_DATE = "";
		}
		if("1".equals(strRECEIPT1_VALUE_DATE)) {
			strRECEIPT1_VALUE_DATE = " B.RECEIPT1_VALUE_DATE is not null ";
		} else if ("2".equals(strRECEIPT1_VALUE_DATE)) {
			strRECEIPT1_VALUE_DATE = " B.RECEIPT1_VALUE_DATE is null ";
		} else {
			strRECEIPT1_VALUE_DATE = "";
		}
		PROJECT_NAME = StringUtil.replaceDatabaseKeyword_mysql(PROJECT_NAME);
		CNTRCT_NAME = StringUtil.replaceDatabaseKeyword_mysql(CNTRCT_NAME);
		List<BidDto> list = bidDao.queryAllBidExport(strBID_AGENT_PRICE_ACT, strRECEIPT1_DATE, strRECEIPT1_VALUE_DATE,
				newCntrctNos, finishStatuss, PROJECT_NAME, BID_NO_LOW, BID_NO_HIGH, CNTRCT_YEAR,
				CNTRCT_NO, BID_COMP_NO, CNTRCT_NAME, CNTRCT_TYPE, CNTRCT_ST_DATE, CNTRCT_ED_DATE, PROJECT_MANAGER);
		if(list != null && list.size() > 0) {
			Map<String, String> userMap = new HashMap<String, String>();
			List<UserInfoDto> userList = userInfoDao.queryAllUser();
			if(userList != null) {
				for(UserInfoDto user : userList) {
					userMap.put(user.getLOGIN_ID(), user.getLOGIN_NAME());
				}
			}
			for(BidDto bid : list) {
				BidCntrctDto bidCntrct = bidCntrctDao.queryBidCntrctByID(bid.getCNTRCT_NO());
				if(bidCntrct != null) {
					bid.setCNTRCT_NAME(bidCntrct.getCNTRCT_NAME());
					//合同类别名称从合同表中带出
					bid.setCNTRCT_TYPE_NAME(bidCntrct.getCNTRCT_TYPE_NAME());
					bid.setCNTRCT_YEAR(bidCntrct.getCNTRCT_YEAR());
					bid.setCNTRCT_ST_DATE(bidCntrct.getCNTRCT_ST_DATE());
					bid.setCNTRCT_ED_DATE(bidCntrct.getCNTRCT_ED_DATE());
					bid.setBID_COMP_NO(bidCntrct.getBID_COMP_NO());
					bid.setBID_COMP_NAME(bidCntrct.getBID_COMP_NAME());
					bid.setCO_MANAGER1(bidCntrct.getCO_MANAGER1());
					bid.setCO_MANAGER_TEL1(bidCntrct.getCO_MANAGER_TEL1());
					bid.setCO_ADDRESS1(bidCntrct.getCO_ADDRESS1());
					bid.setCO_MANAGER_EMAIL1(bidCntrct.getCO_MANAGER_EMAIL1());
					bid.setCO_TAX(bidCntrct.getCO_TAX());
				}
				
				//会审监管人
				if(StringUtil.isNotBlank(bid.getPROJECT_AUTH())) {
					SuperviseLibDto superviseLib = superviseLibDao.querySuperviseLibByID(bid.getPROJECT_AUTH());
					if(superviseLib != null) {
						bid.setPROJECT_AUTH_NAME(superviseLib.getSUPERVISE_NAME());
					}
				}
				
				//专家费申请人
				bid.setBID_EXPERT_COMMISION_APPLY_NAME(userMap.get(bid.getBID_EXPERT_COMMISION_APPLY()));
				//担当者
				bid.setPROJECT_MANAGER_NAME(userMap.get(bid.getPROJECT_MANAGER()));
				//评审人
				bid.setBID_AUTH_NAME(userMap.get(bid.getBID_AUTH()));
				
				bid.setBID_APPLY_PRICE_TOTPAID(new BigDecimal(0));
				//查询投标公司
				String compids = bid.getBID_CO_LIST();
				if(StringUtil.isNotBlank(compids)) {
					compids = compids.substring(0, compids.length() - 1);
					List<BidCompDto> bidCompList = bidCompDao.queryBidCompByIds(compids);
					if(bidCompList != null && bidCompList.size() > 0) {
						String BID_CO_NAME_LIST = "";
						for(BidCompDto bidComp : bidCompList) {
							BID_CO_NAME_LIST += bidComp.getBID_CO_NAME() + ",";
							if (bidComp.getBID_APPLY_PRICE()!= null && bidComp.getBID_APPLY_PRICE_DATE()!= null){
								bid.setBID_APPLY_PRICE_TOTPAID(bid.getBID_APPLY_PRICE_TOTPAID().add(bidComp.getBID_APPLY_PRICE()));
							}
						}
						bid.setBID_CO_NAME_LIST(BID_CO_NAME_LIST);
					}
				}
				//查询评审专家
				String expertids = bid.getBID_EXPERT_LIST();
				if(StringUtil.isNotBlank(expertids)) {
					expertids = expertids.substring(0, expertids.length() - 1);
					List<ExpertLibDto> expertList = expertLibDao.queryExpertLibByIds(expertids);
					if(expertList != null && expertList.size() > 0) {
						String BID_EXPERT_NAME_LIST = "";
						for(ExpertLibDto expert : expertList) {
							BID_EXPERT_NAME_LIST += expert.getEXPERT_NAME() + ",";
						}
						bid.setBID_EXPERT_NAME_LIST(BID_EXPERT_NAME_LIST);
					}
				}
			}
		}
		return list;
	}
	
	@Override
	public List<BidDto> queryBidByNos(String bidNos) {
		List<BidDto> list = new ArrayList<BidDto>();
		if(StringUtil.isNotBlank(bidNos)) {
			String ll[] = bidNos.split(",");
			for(String no : ll) {
				if(StringUtil.isNotBlank(no)) {
					BidDto bid = bidDao.queryBidByID(no);
					if(bid != null) {
						list.add(bid);
					}
				}
			}
		}
		return list;
	}

	@Override
	public List<BidDto> queryBidExportByYear(String strBidNoStart, String strBidNoEnd) {
		strBidNoStart = StringUtil.replaceDatabaseKeyword_mysql(strBidNoStart);
		strBidNoEnd = StringUtil.replaceDatabaseKeyword_mysql(strBidNoEnd);
		List<BidDto> list = bidDao.queryBidExportByYear(strBidNoStart, strBidNoEnd);
		if(list != null && list.size() > 0) {
			for(BidDto bid : list) {
				//查询投标公司
				String compids = bid.getBID_CO_LIST();
				if(StringUtil.isNotBlank(compids)) {
					compids = compids.substring(0, compids.length() - 1);
					List<BidCompDto> bidCompList = bidCompDao.queryBidCompByIds(compids);
					if(bidCompList != null && bidCompList.size() > 0) {
						String BID_CO_NAME_LIST = "";
						String BID_BOND_LIST = "";
						for(BidCompDto bidComp : bidCompList) {
							BID_CO_NAME_LIST += bidComp.getBID_CO_NAME() + ",";
							//保证金
							BigDecimal bidBondTmp = bidComp.getBID_BOND();
							if(bidBondTmp != null && Constants.BID_RESULT_YES.equals(bidComp.getBID_RESULT())){
								bidBondTmp = bidBondTmp.divide(new BigDecimal(10000));
								bidBondTmp = bidBondTmp.setScale(6, BigDecimal.ROUND_HALF_UP);
								BID_BOND_LIST += bidBondTmp + ",";
							}
						}
						bid.setBID_CO_NAME_LIST(BID_CO_NAME_LIST);
//						bid.setBID_BOND_LIST(BID_BOND_LIST);
					}
				}
				//查询评审专家
				String expertids = bid.getBID_EXPERT_LIST();
				if(StringUtil.isNotBlank(expertids)) {
					expertids = expertids.substring(0, expertids.length() - 1);
					List<ExpertLibDto> expertList = expertLibDao.queryExpertLibByIds(expertids);
					if(expertList != null && expertList.size() > 0) {
						String BID_EXPERT_NAME_LIST = "";
						for(ExpertLibDto expert : expertList) {
							BID_EXPERT_NAME_LIST += expert.getEXPERT_NAME() + ",";
						}
						bid.setBID_EXPERT_NAME_LIST(BID_EXPERT_NAME_LIST);
					}
				}
			}
		}
		return list;
	}

	@Override
	public List<BidDto> queryAgentCo(String strBidNoStart, String strBidNoEnd) {
		strBidNoStart = StringUtil.replaceDatabaseKeyword_mysql(strBidNoStart);
		strBidNoEnd = StringUtil.replaceDatabaseKeyword_mysql(strBidNoEnd);
		List<BidDto> list = bidDao.queryAgentCo(strBidNoStart, strBidNoEnd);
		return list;
	}

	@Override
	public List<BidDto> queryBidCo(String strBidNoStart, String strBidNoEnd) {
		strBidNoStart = StringUtil.replaceDatabaseKeyword_mysql(strBidNoStart);
		strBidNoEnd = StringUtil.replaceDatabaseKeyword_mysql(strBidNoEnd);
		List<BidDto> list = bidDao.queryBidCo(strBidNoStart, strBidNoEnd);
		return list;
	}

	@Override
	public List<BidDto> queryProjectMg(String strBidNoStart, String strBidNoEnd) {
		strBidNoStart = StringUtil.replaceDatabaseKeyword_mysql(strBidNoStart);
		strBidNoEnd = StringUtil.replaceDatabaseKeyword_mysql(strBidNoEnd);
		List<BidDto> list = bidDao.queryProjectMg(strBidNoStart, strBidNoEnd);
		return list;
	}

	@Override
	public List<BidDto> queryBidExport(BidDto bidDto) {
		bidDto.setRESERVE3(StringUtil.replaceDatabaseKeyword_mysql(bidDto.getRESERVE3()));
		bidDto.setRESERVE4(StringUtil.replaceDatabaseKeyword_mysql(bidDto.getRESERVE4()));
		bidDto.setBID_NO(StringUtil.replaceDatabaseKeyword_mysql(bidDto.getBID_NO()));
		bidDto.setPROJECT_NAME(StringUtil.replaceDatabaseKeyword_mysql(bidDto.getPROJECT_NAME()));
		bidDto.setFINISH_NOTE(StringUtil.replaceDatabaseKeyword_mysql(bidDto.getFINISH_NOTE()));
		List<BidDto> list = bidDao.queryBidExport(bidDto);
		if(list != null && list.size() > 0) {
			for(BidDto bid : list) {
				//查询投标公司
				String compids = bid.getBID_CO_LIST();
				if(StringUtil.isNotBlank(compids)) {
					compids = compids.substring(0, compids.length() - 1);
					List<BidCompDto> bidCompList = bidCompDao.queryBidCompByIds(compids);
					if(bidCompList != null && bidCompList.size() > 0) {
						String BID_CO_NAME_LIST = "";
						String BID_BOND_LIST = "";
						for(BidCompDto bidComp : bidCompList) {
							BID_CO_NAME_LIST += bidComp.getBID_CO_NAME() + ",";
							BigDecimal bidBondTmp = bidComp.getBID_BOND();
							if(bidBondTmp != null && Constants.BID_RESULT_YES.equals(bidComp.getBID_RESULT())){
								bidBondTmp = bidBondTmp.divide(new BigDecimal(10000));
								bidBondTmp = bidBondTmp.setScale(6, BigDecimal.ROUND_HALF_UP);
								BID_BOND_LIST += bidBondTmp + ",";
							}
						}
						bid.setBID_CO_NAME_LIST(BID_CO_NAME_LIST);
//						bid.setBID_BOND_LIST(BID_BOND_LIST);
					}
				}
				//查询评审专家
				String expertids = bid.getBID_EXPERT_LIST();
				if(StringUtil.isNotBlank(expertids)) {
					expertids = expertids.substring(0, expertids.length() - 1);
					List<ExpertLibDto> expertList = expertLibDao.queryExpertLibByIds(expertids);
					if(expertList != null && expertList.size() > 0) {
						String BID_EXPERT_NAME_LIST = "";
						for(ExpertLibDto expert : expertList) {
							BID_EXPERT_NAME_LIST += expert.getEXPERT_NAME() + ",";
						}
						bid.setBID_EXPERT_NAME_LIST(BID_EXPERT_NAME_LIST);
					}
				}
			}
		}
		return list;
	}
	
	/** 招标履历 **/
	
	@Override
	public List<BidHistDto> queryAllBidHist(String bidNo) {
		return bidDao.queryAllBidHist(bidNo);
	}
	
	@Override
	public Page queryBidHistByPage(String bidNo, Page page) {
		
		bidNo = StringUtil.replaceDatabaseKeyword_mysql(bidNo);
		//查询总记录数
		int totalCount = bidDao.queryBidHistCountByPage(bidNo);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<BidHistDto> list = bidDao.queryBidHistByPage(bidNo,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}

	@Override
	public BidHistDto queryBidHistByID(String bidHisSeq) {
		return bidDao.queryBidHistByID(bidHisSeq);
	}
	
	@Override
	public List<BidCompApplyDto> queryApplyByBidID(String bidNo, String bidCoNo) {
		BidDto bid = bidDao.queryAllBidByID(bidNo);
		List<BidCompApplyDto> listBidCompApply = new ArrayList<BidCompApplyDto>();
		if(bid != null) {
			String require = bid.getAPPLY_REQUIRE();
			if(StringUtil.isNotBlank(require)) {
				String ll[] = require.split("\r\n");
				for(String s : ll) {
					if(StringUtil.isNotBlank(s)) {
						//根据报名要求查询报名内容
						BidCompApplyDto apply = bidCompApplyDao.queryBidCompApplyByRequire(bidNo, bidCoNo, s);
						if(apply == null) {
							apply = new BidCompApplyDto();
							apply.setID(0);
							apply.setAPPLY_REQUIRE(s);
							apply.setAPPLY_NOTE("");
						}					
						listBidCompApply.add(apply);
					}
				}
			}
		}
		return listBidCompApply;
	}

	@Override
	public void insertBidHist(BidHistDto bidHistDto) {
		bidDao.insertBidHist(bidHistDto);
	}
	
	@Override
	public void insertBidComp(BidCompDto bidCompDto) {
		bidCompDao.insertBidComp(bidCompDto);
	}
	
	/**
	 * 插入招标履历
	 * @param bid
	 */
	private void insertBidHistNew(BidDto bid) {
		BidHistDto bidHistDto = Bid2BidHist(bid);
		//插入招标履历
		bidDao.insertBidHist(bidHistDto);
	}
	
	/**
	 * 插入招标履历
	 * @param bid
	 */
	private void insertBidHist(BidDto bid) {
		BidDto bidDto = bidDao.queryAllBidByID(bid.getBID_NO());
		if(bidDto != null) {
			//投标公司和评审专家明细
			String OTHER_DETAIL = "";
			//投标公司列表
			String bidcomids = bidDto.getBID_CO_LIST();
			if(StringUtil.isNotBlank(bidcomids)) {
				bidcomids = bidcomids.substring(0, bidcomids.length() - 1);
				List<BidCompDto> bidComplist = bidCompDao.queryBidCompByIds(bidcomids);
				if(bidComplist != null && bidComplist.size() > 0) {
					JSONArray s = JSONArray.fromObject(bidComplist.toArray());
					OTHER_DETAIL += "※※※投标公司信息※※※" + s;
				}
			}
			//评审专家列表
			String expertids = bidDto.getBID_EXPERT_LIST();
			if(StringUtil.isNotBlank(expertids)) {
				expertids = expertids.substring(0, expertids.length() - 1);
				List<ExpertLibDto> expertLibList = expertLibDao.queryExpertLibByIds(expertids);
				if(expertLibList != null && expertLibList.size() > 0) {
					JSONArray s = JSONArray.fromObject(expertLibList.toArray());
					OTHER_DETAIL += "※※※评审专家信息※※※" + s;
				}
			}
			
			BidHistDto bidHistDto = Bid2BidHist(bidDto);
			//插入招标履历
//			bidHistDto.setOTHER_DETAIL(OTHER_DETAIL);
			bidDao.insertBidHist(bidHistDto);
		}
	}
	
	/**
	 * @param bidCompExport
	 * @param bidComp
	 * @return
	 */
	private BidCompExportDto copyBidComp2BidCompExport(BidCompExportDto bidCompExport, BidCompDto bidComp) {
		bidCompExport.setBID_CO_NO(bidComp.getBID_CO_NO());
		bidCompExport.setBID_CO_NAME_1(bidComp.getBID_CO_NAME());
		bidCompExport.setBID_CO_MANAGER(bidComp.getBID_CO_MANAGER());
		bidCompExport.setBID_CO_TEL(bidComp.getBID_CO_TEL());
		bidCompExport.setBID_CO_ADD(bidComp.getBID_CO_ADD());
		bidCompExport.setBID_CO_PS(bidComp.getBID_CO_PS());
		bidCompExport.setMail_pr(bidComp.getMail_pr());
		bidCompExport.setMail_suffix(bidComp.getMail_suffix());
		bidCompExport.setBID_BOND(bidComp.getBID_BOND());
		bidCompExport.setBID_REFUND_SIGN(bidComp.getBID_REFUND_SIGN());
		bidCompExport.setBID_PAYMENT_TYPE(bidComp.getBID_PAYMENT_TYPE());
		bidCompExport.setBID_PRICE_1(bidComp.getBID_PRICE());
		bidCompExport.setBID_CHECK_PRICE(bidComp.getBID_CHECK_PRICE());
		bidCompExport.setBID_RESULT(bidComp.getBID_RESULT());
		bidCompExport.setBID_WIN_PRICE(bidComp.getBID_WIN_PRICE());
		bidCompExport.setBID_APPLY_PRICE_1(bidComp.getBID_APPLY_PRICE());
		bidCompExport.setBID_VALUE_DATE_1(bidComp.getBID_VALUE_DATE());
		bidCompExport.setBID_RECEIPT_NO(bidComp.getBID_RECEIPT_NO());
		return bidCompExport;
	}
	
	/**
	 * @param bid
	 * @return
	 */
	private BidCompExportDto copyBid2BidCompExport(BidDto bid) {
		BidCompExportDto bidCompExport = new BidCompExportDto();
		bidCompExport.setBID_NO(bid.getBID_NO());
//		bidCompExport.setIS_RANDOM(bid.getIS_RANDOM());
//		bidCompExport.setPROJECT_TYPE(bid.getPROJECT_TYPE());
//		bidCompExport.setPROJECT_TYPE_NAME(bid.getPROJECT_TYPE_NAME());
//		bidCompExport.setBID_STATUS(bid.getBID_STATUS());
//		bidCompExport.setBID_VALUE_DATE(bid.getBID_VALUE_DATE());
		bidCompExport.setPROJECT_NAME(bid.getPROJECT_NAME());
		bidCompExport.setPROJECT_MANAGER(bid.getPROJECT_MANAGER());
//		bidCompExport.setONLINE_DATE(bid.getONLINE_DATE());
//		bidCompExport.setSUBMIT_DATE(bid.getSUBMIT_DATE());
//		bidCompExport.setSUBMIT_DATE2(bid.getSUBMIT_DATE2());
//		bidCompExport.setTENDER_START_DATE(bid.getTENDER_START_DATE());
		bidCompExport.setTENDER_OPEN_DATE(bid.getTENDER_OPEN_DATE());
//		bidCompExport.setAGENT_NO(bid.getAGENT_NO());
//		bidCompExport.setAGENT_CO_NAME(bid.getAGENT_CO_NAME());
//		bidCompExport.setAGENT_CO_MANAGER(bid.getAGENT_CO_MANAGER());
//		bidCompExport.setAGENT_CO_MANAGER_TEL(bid.getAGENT_CO_MANAGER_TEL());
//		bidCompExport.setAGENT_CO_POST_ADDRESS(bid.getAGENT_CO_POST_ADDRESS());
//		bidCompExport.setAGENT_CO_MAIL(bid.getAGENT_CO_MAIL());
//		bidCompExport.setAgent_mail_pr(bid.getAgent_mail_pr());
//		bidCompExport.setAgent_mail_suffix(bid.getAgent_mail_suffix());
//		bidCompExport.setPROF_NO(bid.getPROF_NO());
//		bidCompExport.setPROF_CO_NAME(bid.getPROF_CO_NAME());
//		bidCompExport.setPROF_CO_MANAGER(bid.getPROF_CO_MANAGER());
//		bidCompExport.setPROF_CO_MANAGER_TEL(bid.getPROF_CO_MANAGER_TEL());
//		bidCompExport.setPROF_CO_POST_ADDRESS(bid.getPROF_CO_POST_ADDRESS());
//		bidCompExport.setPROF_CO_MAIL(bid.getPROF_CO_MAIL());
//		bidCompExport.setProf_mail_pr(bid.getProf_mail_pr());
//		bidCompExport.setProf_mail_suffix(bid.getProf_mail_suffix());
//		bidCompExport.setPROJ_APPROVAL(bid.getPROJ_APPROVAL());
//		bidCompExport.setPROJ_PLAN_PRICE(bid.getPROJ_PLAN_PRICE());
//		bidCompExport.setPROJ_ASTRICT_PRICE(bid.getPROJ_ASTRICT_PRICE());
//		bidCompExport.setTENDER_ONLINE(bid.getTENDER_ONLINE());
//		bidCompExport.setTENDER_DOWNLOAD(bid.getTENDER_DOWNLOAD());
//		bidCompExport.setAPPLY_FORM_EDIT(bid.getAPPLY_FORM_EDIT());
//		bidCompExport.setAPPLY_FORM_VERIFY(bid.getAPPLY_FORM_VERIFY());
//		bidCompExport.setAPPLY_FORM_MERGE(bid.getAPPLY_FORM_MERGE());
//		bidCompExport.setEXPERT_NAME_OFFERED(bid.getEXPERT_NAME_OFFERED());
//		bidCompExport.setEXPERT_INFORMED(bid.getEXPERT_INFORMED());
//		bidCompExport.setEXPERT_NAME_CONFIRMED(bid.getEXPERT_NAME_CONFIRMED());
//		bidCompExport.setCLARIFY_DOC(bid.getCLARIFY_DOC());
//		bidCompExport.setSUPPORT_DOC(bid.getSUPPORT_DOC());
//		bidCompExport.setSUPPORT_DOC_SENT(bid.getSUPPORT_DOC_SENT());
//		bidCompExport.setBIDDER_REPLY(bid.getBIDDER_REPLY());
//		bidCompExport.setOPEN_RESULT(bid.getOPEN_RESULT());
//		bidCompExport.setOPEN_VERIFY(bid.getOPEN_VERIFY());
//		bidCompExport.setINFORM_SENT(bid.getINFORM_SENT());
//		bidCompExport.setINFORM_CONTRACT(bid.getINFORM_CONTRACT());
//		bidCompExport.setATTACH_POST_A(bid.getATTACH_POST_A());
//		bidCompExport.setCONTRACT_VERIFY(bid.getCONTRACT_VERIFY());
//		bidCompExport.setCOMMENT_POST(bid.getCOMMENT_POST());
//		bidCompExport.setBID_REOPRT_EDIT(bid.getBID_REOPRT_EDIT());
//		bidCompExport.setBID_REPORT_VERIFY(bid.getBID_REPORT_VERIFY());
//		bidCompExport.setBID_REPORT_SENT(bid.getBID_REPORT_SENT());
		
		//投标版本修改，添加的字段
		bidCompExport.setBID_AGENT_PAY(bid.getBID_AGENT_PAY());
		bidCompExport.setBID_AGENT_PAY2(bid.getBID_AGENT_PAY2());
//		bidCompExport.setBID_NEED_MATERIAL_PRICE(bid.getBID_NEED_MATERIAL_PRICE());
//		bidCompExport.setAPPLY_REQUIRE(bid.getAPPLY_REQUIRE());
//		bidCompExport.setBID_NOTICE_DATE(bid.getBID_NOTICE_DATE());
//		bidCompExport.setBID_NOTICE_DATE2(bid.getBID_NOTICE_DATE2());
		bidCompExport.setBID_MESSAGE_DATE(bid.getBID_MESSAGE_DATE());
//		bidCompExport.setMATERIAL_EXPRESS_DATE(bid.getMATERIAL_EXPRESS_DATE());
		bidCompExport.setBID_AGENT_PRICE(bid.getBID_AGENT_PRICE());
		bidCompExport.setFINISH_STATUS(bid.getFINISH_STATUS());
		bidCompExport.setFINISH_NOTE(bid.getFINISH_NOTE());
		bidCompExport.setSTATUS(bid.getSTATUS());
		bidCompExport.setRESERVE_DATE1(bid.getRESERVE_DATE1());
		bidCompExport.setRESERVE_DATE2(bid.getRESERVE_DATE2());
				
//		bidCompExport.setPROJECT_PROCESS_02_04(bid.getPROJECT_PROCESS_02_04());
//		bidCompExport.setPROJECT_PROCESS_02_05(bid.getPROJECT_PROCESS_02_05());
//		bidCompExport.setPROJECT_PROCESS_03_05(bid.getPROJECT_PROCESS_03_05());
//		bidCompExport.setPROJECT_PROCESS_04_05(bid.getPROJECT_PROCESS_04_05());
//		bidCompExport.setPROJECT_PROCESS_05_04(bid.getPROJECT_PROCESS_05_04());
//		bidCompExport.setPROJECT_PROCESS_05_05(bid.getPROJECT_PROCESS_05_05());
//		bidCompExport.setPROJECT_PROCESS_06_04(bid.getPROJECT_PROCESS_06_04());
//		bidCompExport.setPROJECT_PROCESS_06_05(bid.getPROJECT_PROCESS_06_05());
//		bidCompExport.setBID_POST_NO(bid.getBID_POST_NO());
//		bidCompExport.setRECEIPT1_AGENT_COMMISSION(bid.getRECEIPT1_AGENT_COMMISSION());
//		bidCompExport.setRECEIPT1_DATE(bid.getRECEIPT1_DATE());
//		bidCompExport.setRECEIPT1_STAFF(bid.getRECEIPT1_STAFF());
//		bidCompExport.setRECEIPT1_NO(bid.getRECEIPT1_NO());
//		bidCompExport.setRECEIPT1_VALUE_DATE(bid.getRECEIPT1_VALUE_DATE());
//		bidCompExport.setBID_COMMISION(bid.getBID_COMMISION());
//		bidCompExport.setRECEIPT1_RECEIVER(bid.getRECEIPT1_RECEIVER());
//		bidCompExport.setRECEIPT2_NO(bid.getRECEIPT2_NO());
//		bidCompExport.setRECEIPT2_DATE(bid.getRECEIPT2_DATE());
//		bidCompExport.setRECEIPT2_POST_NO(bid.getRECEIPT2_POST_NO());
//		bidCompExport.setRECEIPT2_EXPRESS_DATE(bid.getRECEIPT2_EXPRESS_DATE());
//		bidCompExport.setMEMO1(bid.getMEMO1());
//		bidCompExport.setBID_CO_LIST(bid.getBID_CO_LIST());
//		bidCompExport.setBID_CO_NAME_LIST(bid.getBID_CO_NAME_LIST());
//		bidCompExport.setBID_EXPERT_LIST(bid.getBID_EXPERT_LIST());
//		bidCompExport.setBID_EXPERT_NAME_LIST(bid.getBID_EXPERT_NAME_LIST());
//		bidCompExport.setBID_CO_SEQ(bid.getBID_CO_SEQ());
		bidCompExport.setBID_CO_NAME(bid.getBID_CO_NAME());
		bidCompExport.setBID_APPLY_PRICE(bid.getBID_APPLY_PRICE());
		bidCompExport.setBID_PRICE(bid.getBID_PRICE());
		bidCompExport.setDELETE_FLG(bid.getDELETE_FLG());
		bidCompExport.setUPDATE_USER(bid.getUPDATE_USER());
		bidCompExport.setINSERT_DATE(bid.getINSERT_DATE());
		bidCompExport.setUPDATE_DATE(bid.getUPDATE_DATE());
		bidCompExport.setRESERVE1(bid.getRESERVE1());
		bidCompExport.setRESERVE2(bid.getRESERVE2());
		bidCompExport.setRESERVE3(bid.getRESERVE3());
		bidCompExport.setRESERVE4(bid.getRESERVE4());
		bidCompExport.setRESERVE5(bid.getRESERVE5());
		return bidCompExport;
	}
	
	/**
	 * 招标转换为招标履历
	 * @param bid
	 * @return
	 */
	private BidHistDto Bid2BidHist(BidDto bid) {
		BidHistDto bidHist = new BidHistDto();
		bidHist.setBID_NO(bid.getBID_NO());
		bidHist.setCNTRCT_NO(bid.getCNTRCT_NO());
		bidHist.setPROJECT_DEVIEW_DATE(bid.getPROJECT_DEVIEW_DATE());
		bidHist.setCNTRCT_TYPE(bid.getCNTRCT_TYPE());
		bidHist.setPROJECT_NAME(bid.getPROJECT_NAME());
		bidHist.setPROJECT_PROPERTY(bid.getPROJECT_PROPERTY());
		bidHist.setPROJ_APPROVAL(bid.getPROJ_APPROVAL());
		bidHist.setPROJECT_AUTH(bid.getPROJECT_AUTH());
		bidHist.setPROJECT_MANAGER(bid.getPROJECT_MANAGER());
		bidHist.setBID_AGENT_PAY(bid.getBID_AGENT_PAY());
		bidHist.setBID_AGENT_PAY2(bid.getBID_AGENT_PAY2());
		bidHist.setBID_AGENT_PRICE(bid.getBID_AGENT_PRICE());
		bidHist.setBID_AGENT_PRICE_ACT(bid.getBID_AGENT_PRICE_ACT());
		bidHist.setRECEIPT1_DATE(bid.getRECEIPT1_DATE());
		bidHist.setRECEIPT1_VALUE_DATE(bid.getRECEIPT1_VALUE_DATE());
		bidHist.setREGISTE_ST_DATE1(bid.getREGISTE_ST_DATE1());
		bidHist.setREGISTE_ED_DATE1(bid.getREGISTE_ED_DATE1());
		bidHist.setREGISTE_ST_DATE2(bid.getREGISTE_ST_DATE2());
		bidHist.setREGISTE_ED_DATE2(bid.getREGISTE_ED_DATE2());
		bidHist.setREGISTE_ST_DATE3(bid.getREGISTE_ST_DATE3());
		bidHist.setREGISTE_ED_DATE3(bid.getREGISTE_ED_DATE3());
		bidHist.setREGISTE_ST_DATE4(bid.getREGISTE_ST_DATE4());
		bidHist.setREGISTE_ED_DATE4(bid.getREGISTE_ED_DATE4());
		bidHist.setREGISTE_ST_DATE5(bid.getREGISTE_ST_DATE5());
		bidHist.setREGISTE_ED_DATE5(bid.getREGISTE_ED_DATE5());
		bidHist.setAPPLY_REQUIRE(bid.getAPPLY_REQUIRE());
		bidHist.setBID_BOND(bid.getBID_BOND());
		bidHist.setTENDER_OPEN_DATE(bid.getTENDER_OPEN_DATE());
		bidHist.setTENDER_OPEN_ADDRESS(bid.getTENDER_OPEN_ADDRESS());
		bidHist.setTENDER_VERIFY_DATE(bid.getTENDER_VERIFY_DATE());
		bidHist.setGEN_REGISTE_RPT_DATE(bid.getGEN_REGISTE_RPT_DATE());
		bidHist.setGEN_VERIFY_RPT_DATE(bid.getGEN_VERIFY_RPT_DATE());
		bidHist.setBID_AUTH(bid.getBID_AUTH());
		bidHist.setBID_LIMIT_PRICE(bid.getBID_LIMIT_PRICE());
		bidHist.setBID_CO_LIST(bid.getBID_CO_LIST());
		bidHist.setBID_EXPERT_LIST(bid.getBID_EXPERT_LIST());
		bidHist.setBID_CO_SEQ(bid.getBID_CO_SEQ());
		bidHist.setBID_CO_NAME(bid.getBID_CO_NAME());
		bidHist.setBID_CO_PRICE(bid.getBID_CO_PRICE());
		bidHist.setBID_PRICE(bid.getBID_PRICE());
		bidHist.setBID_PRICE_LIST(bid.getBID_PRICE_LIST());
		bidHist.setBID_EXPERT_COMMISION(bid.getBID_EXPERT_COMMISION());
		bidHist.setBID_EXPERT_COMMISION_PRE(bid.getBID_EXPERT_COMMISION_PRE());
		bidHist.setBID_EXPERT_COMMISION_PRE_DATE(bid.getBID_EXPERT_COMMISION_PRE_DATE());
		bidHist.setBID_EXPERT_COMMISION_ACT(bid.getBID_EXPERT_COMMISION_ACT());
		bidHist.setBID_EXPERT_COMMISION_DIFF_DATE(bid.getBID_EXPERT_COMMISION_DIFF_DATE());
		bidHist.setBID_EXPERT_COMMISION_PRE1(bid.getBID_EXPERT_COMMISION_PRE1());
		bidHist.setBID_EXPERT_COMMISION_PRE_DATE1(bid.getBID_EXPERT_COMMISION_PRE_DATE1());
		bidHist.setBID_EXPERT_COMMISION_ACT1(bid.getBID_EXPERT_COMMISION_ACT1());
		bidHist.setBID_EXPERT_COMMISION_DIFF_DATE1(bid.getBID_EXPERT_COMMISION_DIFF_DATE1());
		bidHist.setBID_EXPERT_COMMISION_PRE2(bid.getBID_EXPERT_COMMISION_PRE2());
		bidHist.setBID_EXPERT_COMMISION_PRE_DATE2(bid.getBID_EXPERT_COMMISION_PRE_DATE2());
		bidHist.setBID_EXPERT_COMMISION_ACT2(bid.getBID_EXPERT_COMMISION_ACT2());
		bidHist.setBID_EXPERT_COMMISION_DIFF_DATE2(bid.getBID_EXPERT_COMMISION_DIFF_DATE2());
		bidHist.setBID_EXPERT_COMMISION_PRE3(bid.getBID_EXPERT_COMMISION_PRE3());
		bidHist.setBID_EXPERT_COMMISION_PRE_DATE3(bid.getBID_EXPERT_COMMISION_PRE_DATE3());
		bidHist.setBID_EXPERT_COMMISION_ACT3(bid.getBID_EXPERT_COMMISION_ACT3());
		bidHist.setBID_EXPERT_COMMISION_DIFF_DATE3(bid.getBID_EXPERT_COMMISION_DIFF_DATE3());
		bidHist.setBID_APPLY_PRICE(bid.getBID_APPLY_PRICE());
		bidHist.setBID_EXPERT_COMMISION_APPLY(bid.getBID_EXPERT_COMMISION_APPLY());
		bidHist.setBID_EXPERT_COMMISION_APPLY_DATE(bid.getBID_EXPERT_COMMISION_APPLY_DATE());
		bidHist.setAPPLY_FORM_EDIT_DATE(bid.getAPPLY_FORM_EDIT_DATE());
		bidHist.setAPPLY_FORM_COLLECT_DATE(bid.getAPPLY_FORM_COLLECT_DATE());
		bidHist.setAPPLY_FORM_VERIFY_DATE(bid.getAPPLY_FORM_VERIFY_DATE());
		bidHist.setAPPLY_FORM_VERIFY(bid.getAPPLY_FORM_VERIFY());
		bidHist.setAPPLY_FORM_FIX_DATE(bid.getAPPLY_FORM_FIX_DATE());
		bidHist.setAPPLY_FORM_BOX_DATE(bid.getAPPLY_FORM_BOX_DATE());
		bidHist.setSUPPORT_DOC_DATE(bid.getSUPPORT_DOC_DATE());
		bidHist.setBID_NOTICE_ST_DATE(bid.getBID_NOTICE_ST_DATE());
		bidHist.setBID_NOTICE_ED_DATE(bid.getBID_NOTICE_ED_DATE());
		bidHist.setBID_MESSAGE_DATE(bid.getBID_MESSAGE_DATE());
		bidHist.setBID_DOC_DELI_DATE1(bid.getBID_DOC_DELI_DATE1());
		bidHist.setBID_DOC_DELI_FILE1(bid.getBID_DOC_DELI_FILE1());
		bidHist.setBID_DOC_DELI_DATE2(bid.getBID_DOC_DELI_DATE2());
		bidHist.setBID_DOC_DELI_FILE2(bid.getBID_DOC_DELI_FILE2());
		bidHist.setBID_DOC_DELI_DATE3(bid.getBID_DOC_DELI_DATE3());
		bidHist.setBID_DOC_DELI_FILE3(bid.getBID_DOC_DELI_FILE3());
		bidHist.setBID_DOC_DELI_DATE4(bid.getBID_DOC_DELI_DATE4());
		bidHist.setBID_DOC_DELI_FILE4(bid.getBID_DOC_DELI_FILE4());
		bidHist.setBID_DOC_DELI_DATE5(bid.getBID_DOC_DELI_DATE5());
		bidHist.setBID_DOC_DELI_FILE5(bid.getBID_DOC_DELI_FILE5());
		bidHist.setBID_DOC_DELI_DATE6(bid.getBID_DOC_DELI_DATE6());
		bidHist.setBID_DOC_DELI_FILE6(bid.getBID_DOC_DELI_FILE6());
		bidHist.setBID_DOC_DELI_DATE7(bid.getBID_DOC_DELI_DATE7());
		bidHist.setBID_DOC_DELI_FILE7(bid.getBID_DOC_DELI_FILE7());
		bidHist.setBID_DOC_DELI_DATE8(bid.getBID_DOC_DELI_DATE8());
		bidHist.setBID_DOC_DELI_FILE8(bid.getBID_DOC_DELI_FILE8());
		bidHist.setBID_DOC_DELI_DATE9(bid.getBID_DOC_DELI_DATE9());
		bidHist.setBID_DOC_DELI_FILE9(bid.getBID_DOC_DELI_FILE9());
		bidHist.setBID_DOC_DELI_DATE10(bid.getBID_DOC_DELI_DATE10());
		bidHist.setBID_DOC_DELI_FILE10(bid.getBID_DOC_DELI_FILE10());
		bidHist.setBID_INFORM_RCV_DATE(bid.getBID_INFORM_RCV_DATE());
		bidHist.setBID_INFORM_RCV(bid.getBID_INFORM_RCV());
		bidHist.setBID_VER_DOC_SCAN_DATE(bid.getBID_VER_DOC_SCAN_DATE());
		bidHist.setBID_VER_DOC_SCAN(bid.getBID_VER_DOC_SCAN());
		bidHist.setBID_VER_DOC_DELI_DATE1(bid.getBID_VER_DOC_DELI_DATE1());
		bidHist.setBID_VER_DOC_DELI_FILE1(bid.getBID_VER_DOC_DELI_FILE1());
		bidHist.setBID_VER_DOC_DELI_DATE2(bid.getBID_VER_DOC_DELI_DATE2());
		bidHist.setBID_VER_DOC_DELI_FILE2(bid.getBID_VER_DOC_DELI_FILE2());
		bidHist.setBID_VER_DOC_DELI_DATE3(bid.getBID_VER_DOC_DELI_DATE3());
		bidHist.setBID_VER_DOC_DELI_FILE3(bid.getBID_VER_DOC_DELI_FILE3());
		bidHist.setBID_VER_DOC_DELI_DATE4(bid.getBID_VER_DOC_DELI_DATE4());
		bidHist.setBID_VER_DOC_DELI_FILE4(bid.getBID_VER_DOC_DELI_FILE4());
		bidHist.setBID_VER_DOC_DELI_DATE5(bid.getBID_VER_DOC_DELI_DATE5());
		bidHist.setBID_VER_DOC_DELI_FILE5(bid.getBID_VER_DOC_DELI_FILE5());
		bidHist.setBID_VER_DOC_DELI_DATE6(bid.getBID_VER_DOC_DELI_DATE6());
		bidHist.setBID_VER_DOC_DELI_FILE6(bid.getBID_VER_DOC_DELI_FILE6());
		bidHist.setBID_VER_DOC_DELI_DATE7(bid.getBID_VER_DOC_DELI_DATE7());
		bidHist.setBID_VER_DOC_DELI_FILE7(bid.getBID_VER_DOC_DELI_FILE7());
		bidHist.setBID_VER_DOC_DELI_DATE8(bid.getBID_VER_DOC_DELI_DATE8());
		bidHist.setBID_VER_DOC_DELI_FILE8(bid.getBID_VER_DOC_DELI_FILE8());
		bidHist.setBID_VER_DOC_DELI_DATE9(bid.getBID_VER_DOC_DELI_DATE9());
		bidHist.setBID_VER_DOC_DELI_FILE9(bid.getBID_VER_DOC_DELI_FILE9());
		bidHist.setBID_VER_DOC_DELI_DATE10(bid.getBID_VER_DOC_DELI_DATE10());
		bidHist.setBID_VER_DOC_DELI_FILE10(bid.getBID_VER_DOC_DELI_FILE10());
		bidHist.setPROGRESS_STATUS(bid.getPROGRESS_STATUS());
		bidHist.setFINISH_STATUS(bid.getFINISH_STATUS());
		bidHist.setFINISH_DATE(bid.getFINISH_DATE());
		bidHist.setFINISH_NOTE(bid.getFINISH_NOTE());
		bidHist.setSTATUS(bid.getSTATUS());
		bidHist.setMEMO1(bid.getMEMO1());
		bidHist.setRESERVE1(bid.getRESERVE1());
		bidHist.setRESERVE2(bid.getRESERVE2());
		bidHist.setRESERVE3(bid.getRESERVE3());
		bidHist.setRESERVE4(bid.getRESERVE4());
		bidHist.setRESERVE5(bid.getRESERVE5());
		bidHist.setRESERVE_DATE1(bid.getRESERVE_DATE1());
		bidHist.setRESERVE_DATE2(bid.getRESERVE_DATE2());
		bidHist.setRESERVE_DATE3(bid.getRESERVE_DATE3());
		bidHist.setRESERVE_DATE4(bid.getRESERVE_DATE4());
		bidHist.setRESERVE_DATE5(bid.getRESERVE_DATE5());
		bidHist.setRESERVE_DATE6(bid.getRESERVE_DATE6());
		bidHist.setRESERVE_DATE7(bid.getRESERVE_DATE7());
		bidHist.setRESERVE_DATE8(bid.getRESERVE_DATE8());
		bidHist.setRESERVE_DATE9(bid.getRESERVE_DATE9());
		bidHist.setRESERVE_DATE10(bid.getRESERVE_DATE10());
		bidHist.setLATEST_FLG(bid.getLATEST_FLG());
		bidHist.setDELETE_FLG(bid.getDELETE_FLG());
		bidHist.setUPDATE_USER(bid.getUPDATE_USER());
		bidHist.setINSERT_DATE(bid.getINSERT_DATE());
		bidHist.setUPDATE_DATE(bid.getUPDATE_DATE());
		bidHist.setBID_WIN_DOC_SCAN_FLG(bid.getBID_WIN_DOC_SCAN_FLG());
		bidHist.setBID_AGENT_PRICE_INVOICE(bid.getBID_AGENT_PRICE_INVOICE());
		bidHist.setBID_EXPERT_NOTIFY_DATE(bid.getBID_EXPERT_NOTIFY_DATE());
		return bidHist;
	}
	
	
	public List<BidRptDto> queryAllBidDetailExport(
			String strBID_AGENT_PRICE_ACT, String strRECEIPT1_DATE, String strRECEIPT1_VALUE_DATE,
			String cntrctNos, String finishStatuss, String PROJECT_NAME, String BID_NO_LOW, String BID_NO_HIGH,
			String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO, String CNTRCT_NAME, String CNTRCT_TYPE,
			String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, String PROJECT_MANAGER){
		
		String newCntrctNos = "";
		if(StringUtil.isNotBlank(cntrctNos)) {
			String[] cntrctNoList = cntrctNos.split(",");
			for(String s : cntrctNoList) {
				if(StringUtil.isNotBlank(s)) {
					newCntrctNos += "'" + s + "',";
				}
			}
			newCntrctNos = newCntrctNos.substring(0, newCntrctNos.length() - 1);
		}
		if("1".equals(strBID_AGENT_PRICE_ACT)) {
			strBID_AGENT_PRICE_ACT = " B.BID_AGENT_PRICE_ACT > 0 ";
		} else if ("2".equals(strBID_AGENT_PRICE_ACT)) {
			strBID_AGENT_PRICE_ACT = " (B.BID_AGENT_PRICE_ACT = 0 or B.BID_AGENT_PRICE_ACT is null) ";
		} else {
			strBID_AGENT_PRICE_ACT = "";
		}
		if("1".equals(strRECEIPT1_DATE)) {
			strRECEIPT1_DATE = " B.RECEIPT1_DATE is not null ";
		} else if ("2".equals(strRECEIPT1_DATE)) {
			strRECEIPT1_DATE = " B.RECEIPT1_DATE is null ";
		} else {
			strRECEIPT1_DATE = "";
		}
		if("1".equals(strRECEIPT1_VALUE_DATE)) {
			strRECEIPT1_VALUE_DATE = " B.RECEIPT1_VALUE_DATE is not null ";
		} else if ("2".equals(strRECEIPT1_VALUE_DATE)) {
			strRECEIPT1_VALUE_DATE = " B.RECEIPT1_VALUE_DATE is null ";
		} else {
			strRECEIPT1_VALUE_DATE = "";
		}
		PROJECT_NAME = StringUtil.replaceDatabaseKeyword_mysql(PROJECT_NAME);
		CNTRCT_NAME = StringUtil.replaceDatabaseKeyword_mysql(CNTRCT_NAME);
		List<BidRptDto> list = bidDao.queryAllBidDetailExport(strBID_AGENT_PRICE_ACT, strRECEIPT1_DATE, strRECEIPT1_VALUE_DATE,
				newCntrctNos, finishStatuss, PROJECT_NAME, BID_NO_LOW, BID_NO_HIGH, CNTRCT_YEAR,
				CNTRCT_NO, BID_COMP_NO, CNTRCT_NAME, CNTRCT_TYPE, CNTRCT_ST_DATE, CNTRCT_ED_DATE, PROJECT_MANAGER);
		if(list != null && list.size() > 0) {
			Map<String, String> userMap = new HashMap<String, String>();
			List<UserInfoDto> userList = userInfoDao.queryAllUser();
			if(userList != null) {
				for(UserInfoDto user : userList) {
					userMap.put(user.getLOGIN_ID(), user.getLOGIN_NAME());
				}
			}
			for(BidRptDto bid : list) {
				//会审监管人
				if(StringUtil.isNotBlank(bid.getPROJECT_AUTH())) {
					SuperviseLibDto superviseLib = superviseLibDao.querySuperviseLibByID(bid.getPROJECT_AUTH());
					if(superviseLib != null) {
						bid.setPROJECT_AUTH_NAME(superviseLib.getSUPERVISE_NAME());
					}
				}
				
				//专家费申请人
				bid.setBID_EXPERT_COMMISION_APPLY_NAME(userMap.get(bid.getBID_EXPERT_COMMISION_APPLY()));
				//担当者
				bid.setPROJECT_MANAGER_NAME(userMap.get(bid.getPROJECT_MANAGER()));
				//评审人
				bid.setBID_AUTH_NAME(userMap.get(bid.getBID_AUTH()));
				
				//查询投标公司
				String compids = bid.getBID_CO_LIST();
				if(StringUtil.isNotBlank(compids)) {
					compids = compids.substring(0, compids.length() - 1);
					List<BidCompDto> bidCompList = bidCompDao.queryBidCompByIds(compids);
					if(bidCompList != null && bidCompList.size() > 0) {
						String BID_CO_NAME_LIST = "";
						for(BidCompDto bidComp : bidCompList) {
							BID_CO_NAME_LIST += bidComp.getBID_CO_NAME() + ",";
						}
						bid.setBID_CO_NAME_LIST(BID_CO_NAME_LIST);
					}
				}
				//查询评审专家
				String expertids = bid.getBID_EXPERT_LIST();
				if(StringUtil.isNotBlank(expertids)) {
					expertids = expertids.substring(0, expertids.length() - 1);
					List<ExpertLibDto> expertList = expertLibDao.queryExpertLibByIds(expertids);
					if(expertList != null && expertList.size() > 0) {
						String BID_EXPERT_NAME_LIST = "";
						for(ExpertLibDto expert : expertList) {
							BID_EXPERT_NAME_LIST += expert.getEXPERT_NAME() + ",";
						}
						bid.setBID_EXPERT_NAME_LIST(BID_EXPERT_NAME_LIST);
					}
				}
			}
		}
		return list;		
	}

	public BidDao getBidDao() {
		return bidDao;
	}

	public void setBidDao(BidDao bidDao) {
		this.bidDao = bidDao;
	}

	public BidCompDao getBidCompDao() {
		return bidCompDao;
	}

	public void setBidCompDao(BidCompDao bidCompDao) {
		this.bidCompDao = bidCompDao;
	}

	public ExpertLibDao getExpertLibDao() {
		return expertLibDao;
	}

	public void setExpertLibDao(ExpertLibDao expertLibDao) {
		this.expertLibDao = expertLibDao;
	}

	public ConfigTabDao getConfigTabDao() {
		return configTabDao;
	}

	public void setConfigTabDao(ConfigTabDao configTabDao) {
		this.configTabDao = configTabDao;
	}

	public BidCompApplyDao getBidCompApplyDao() {
		return bidCompApplyDao;
	}

	public void setBidCompApplyDao(BidCompApplyDao bidCompApplyDao) {
		this.bidCompApplyDao = bidCompApplyDao;
	}

	public BidCntrctDao getBidCntrctDao() {
		return bidCntrctDao;
	}

	public void setBidCntrctDao(BidCntrctDao bidCntrctDao) {
		this.bidCntrctDao = bidCntrctDao;
	}

	public SuperviseLibDao getSuperviseLibDao() {
		return superviseLibDao;
	}

	public void setSuperviseLibDao(SuperviseLibDao superviseLibDao) {
		this.superviseLibDao = superviseLibDao;
	}

	public UserInfoDao getUserInfoDao() {
		return userInfoDao;
	}

	public void setUserInfoDao(UserInfoDao userInfoDao) {
		this.userInfoDao = userInfoDao;
	}
}
