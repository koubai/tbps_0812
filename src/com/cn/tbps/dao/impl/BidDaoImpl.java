package com.cn.tbps.dao.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.cn.common.dao.BaseDao;
import com.cn.common.util.DateUtil;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.BidDao;
import com.cn.tbps.dto.BidDto;
import com.cn.tbps.dto.BidHistDto;
import com.cn.tbps.dto.BidRptDto;

/**
 * @name BidDaoImpl.java
 * @author Frank
 * @time 2013-10-23下午8:55:57
 * @version 1.0
 */
public class BidDaoImpl extends BaseDao implements BidDao {
	
	@Override
	public int queryBidAndBidCntrctCountByPage(
			String strBID_AGENT_PRICE_ACT, String strRECEIPT1_DATE, String strRECEIPT1_VALUE_DATE,
			String cntrctNos, String finishStatuss, String PROJECT_NAME, String BID_NO_LOW, String BID_NO_HIGH,
			String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO, String CNTRCT_NAME, String CNTRCT_TYPE,
			String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, String BID_EXPERT_COMMISION_APPLY_ST_DATE, 
			String BID_EXPERT_COMMISION_APPLY_ED_DATE, String PROJECT_MANAGER, String BID_NO
			) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("strBID_AGENT_PRICE_ACT", strBID_AGENT_PRICE_ACT);
		paramMap.put("strRECEIPT1_DATE", strRECEIPT1_DATE);
		paramMap.put("strRECEIPT1_VALUE_DATE", strRECEIPT1_VALUE_DATE);
		paramMap.put("cntrctNos", cntrctNos);
		paramMap.put("finishStatuss", finishStatuss);
		paramMap.put("PROJECT_NAME", PROJECT_NAME);
		paramMap.put("BID_NO_LOW", BID_NO_LOW);
		paramMap.put("BID_NO_HIGH", BID_NO_HIGH);
		paramMap.put("CNTRCT_YEAR", CNTRCT_YEAR);
		paramMap.put("CNTRCT_NO", CNTRCT_NO);
		paramMap.put("BID_COMP_NO", BID_COMP_NO);
		paramMap.put("CNTRCT_NAME", CNTRCT_NAME);
		paramMap.put("CNTRCT_TYPE", CNTRCT_TYPE);
		paramMap.put("CNTRCT_ST_DATE", CNTRCT_ST_DATE);
		paramMap.put("CNTRCT_ED_DATE", CNTRCT_ED_DATE);
		paramMap.put("BID_EXPERT_COMMISION_APPLY_ST_DATE", BID_EXPERT_COMMISION_APPLY_ST_DATE);
		paramMap.put("BID_EXPERT_COMMISION_APPLY_ED_DATE", BID_EXPERT_COMMISION_APPLY_ED_DATE);
		paramMap.put("PROJECT_MANAGER", PROJECT_MANAGER);
		paramMap.put("BID_NO", BID_NO);
		return (Integer) getSqlMapClientTemplate().queryForObject("queryBidAndBidCntrctCountByPage", paramMap);
	}

	@Override
	public List<BidDto> queryBidAndBidCntrctByPage(
			String strBID_AGENT_PRICE_ACT, String strRECEIPT1_DATE, String strRECEIPT1_VALUE_DATE,
			String cntrctNos, String finishStatuss, String PROJECT_NAME, String BID_NO_LOW, String BID_NO_HIGH,
			String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO, String CNTRCT_NAME, String CNTRCT_TYPE,
			String CNTRCT_ST_DATE, String CNTRCT_ED_DATE,String BID_EXPERT_COMMISION_APPLY_ST_DATE, 
			String BID_EXPERT_COMMISION_APPLY_ED_DATE, String PROJECT_MANAGER, String BID_NO, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("strBID_AGENT_PRICE_ACT", strBID_AGENT_PRICE_ACT);
		paramMap.put("strRECEIPT1_DATE", strRECEIPT1_DATE);
		paramMap.put("strRECEIPT1_VALUE_DATE", strRECEIPT1_VALUE_DATE);
		paramMap.put("cntrctNos", cntrctNos);
		paramMap.put("finishStatuss", finishStatuss);
		paramMap.put("PROJECT_NAME", PROJECT_NAME);
		paramMap.put("BID_NO_LOW", BID_NO_LOW);
		paramMap.put("BID_NO_HIGH", BID_NO_HIGH);
		paramMap.put("CNTRCT_YEAR", CNTRCT_YEAR);
		paramMap.put("CNTRCT_NO", CNTRCT_NO);
		paramMap.put("BID_COMP_NO", BID_COMP_NO);
		paramMap.put("CNTRCT_NAME", CNTRCT_NAME);
		paramMap.put("CNTRCT_TYPE", CNTRCT_TYPE);
		paramMap.put("CNTRCT_ST_DATE", CNTRCT_ST_DATE);
		paramMap.put("CNTRCT_ED_DATE", CNTRCT_ED_DATE);
		paramMap.put("BID_EXPERT_COMMISION_APPLY_ST_DATE", BID_EXPERT_COMMISION_APPLY_ST_DATE);
		paramMap.put("BID_EXPERT_COMMISION_APPLY_ED_DATE", BID_EXPERT_COMMISION_APPLY_ED_DATE);
		paramMap.put("PROJECT_MANAGER", PROJECT_MANAGER);
		paramMap.put("BID_NO", BID_NO);
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<BidDto> list = getSqlMapClientTemplate().queryForList("queryBidAndBidCntrctByPage", paramMap);
		return list;
	}
	
	@Override
	public List<BidDto> queryBidByPage(String bidNoLow, String bidNoHigh,
			String projectType, String openDateLow, String openDateHigh,
			String agentNo, String agentName, String bidCoName, String receipt1No, int start, int end, String bidStatus) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_NO_LOW", bidNoLow);
		paramMap.put("BID_NO_HIGH", bidNoHigh);
		paramMap.put("PROJECT_TYPE", projectType);
		paramMap.put("TENDER_OPEN_DATE_LOW", openDateLow);
		paramMap.put("TENDER_OPEN_DATE_HIGH", openDateHigh);
		paramMap.put("AGENT_NO", agentNo);
		paramMap.put("AGENT_CO_NAME", agentName);
		paramMap.put("BID_CO_NAME", bidCoName);
		paramMap.put("RECEIPT1_NO", receipt1No);
		paramMap.put("start", start);
		paramMap.put("end", end);
		paramMap.put("BID_STATUS", bidStatus);
		@SuppressWarnings("unchecked")
		List<BidDto> list = getSqlMapClientTemplate().queryForList("queryBidByPage", paramMap);
		return list;
	}

	@Override
	public int queryBidCountByPage(String bidNoLow, String bidNoHigh,
			String projectType, String openDateLow, String openDateHigh,
			String agentNo, String agentName, String bidStatus, String bidCoName, String receipt1No) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_NO_LOW", bidNoLow);
		paramMap.put("BID_NO_HIGH", bidNoHigh);
		paramMap.put("PROJECT_TYPE", projectType);
		paramMap.put("TENDER_OPEN_DATE_LOW", openDateLow);
		paramMap.put("TENDER_OPEN_DATE_HIGH", openDateHigh);
		paramMap.put("AGENT_NO", agentNo);
		paramMap.put("AGENT_CO_NAME", agentName);
		paramMap.put("BID_CO_NAME", bidCoName);
		paramMap.put("RECEIPT1_NO", receipt1No);
		paramMap.put("BID_STATUS", bidStatus);
		return (Integer) getSqlMapClientTemplate().queryForObject("queryBidCountByPage", paramMap);
	}

	@Override
	public BidDto queryBidByID(String bidNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_NO", bidNo);
		@SuppressWarnings("unchecked")
		List<BidDto> list = getSqlMapClientTemplate().queryForList("queryBidByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public BidDto queryAllBidByID(String bidNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_NO", bidNo);
		@SuppressWarnings("unchecked")
		List<BidDto> list = getSqlMapClientTemplate().queryForList("queryAllBidByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public BidDto queryAllBidByID2(String bidNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_NO", bidNo);
		@SuppressWarnings("unchecked")
		List<BidDto> list = getSqlMapClientTemplate().queryForList("queryAllBidByID2", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public void insertBid(BidDto bidDto) {
		getSqlMapClientTemplate().insert("insertBid", bidDto);
	}

	@Override
	public void updateBid(BidDto bidDto) {
		getSqlMapClientTemplate().update("updateBid", bidDto);
	}

	@Override
	public List<BidDto> queryAllBidExport(
			String strBID_AGENT_PRICE_ACT, String strRECEIPT1_DATE, String strRECEIPT1_VALUE_DATE,
			String cntrctNos, String finishStatuss, String PROJECT_NAME, String BID_NO_LOW, String BID_NO_HIGH,
			String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO, String CNTRCT_NAME, String CNTRCT_TYPE,
			String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, String PROJECT_MANAGER) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("strBID_AGENT_PRICE_ACT", strBID_AGENT_PRICE_ACT);
		paramMap.put("strRECEIPT1_DATE", strRECEIPT1_DATE);
		paramMap.put("strRECEIPT1_VALUE_DATE", strRECEIPT1_VALUE_DATE);
		paramMap.put("cntrctNos", cntrctNos);
		paramMap.put("finishStatuss", finishStatuss);
		paramMap.put("PROJECT_NAME", PROJECT_NAME);
		paramMap.put("BID_NO_LOW", BID_NO_LOW);
		paramMap.put("BID_NO_HIGH", BID_NO_HIGH);
		paramMap.put("CNTRCT_YEAR", CNTRCT_YEAR);
		paramMap.put("CNTRCT_NO", CNTRCT_NO);
		paramMap.put("BID_COMP_NO", BID_COMP_NO);
		paramMap.put("CNTRCT_NAME", CNTRCT_NAME);
		paramMap.put("CNTRCT_TYPE", CNTRCT_TYPE);
		paramMap.put("CNTRCT_ST_DATE", CNTRCT_ST_DATE);
		paramMap.put("CNTRCT_ED_DATE", CNTRCT_ED_DATE);
		paramMap.put("PROJECT_MANAGER", PROJECT_MANAGER);
		
		@SuppressWarnings("unchecked")
		List<BidDto> list = getSqlMapClientTemplate().queryForList("queryAllBidExport", paramMap);
		return list;
	}
	
	public List<BidRptDto> queryAllBidDetailExport(
			String strBID_AGENT_PRICE_ACT, String strRECEIPT1_DATE, String strRECEIPT1_VALUE_DATE,
			String cntrctNos, String finishStatuss, String PROJECT_NAME, String BID_NO_LOW, String BID_NO_HIGH,
			String CNTRCT_YEAR, String CNTRCT_NO, String BID_COMP_NO, String CNTRCT_NAME, String CNTRCT_TYPE,
			String CNTRCT_ST_DATE, String CNTRCT_ED_DATE, String PROJECT_MANAGER){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("strBID_AGENT_PRICE_ACT", strBID_AGENT_PRICE_ACT);
		paramMap.put("strRECEIPT1_DATE", strRECEIPT1_DATE);
		paramMap.put("strRECEIPT1_VALUE_DATE", strRECEIPT1_VALUE_DATE);
		paramMap.put("cntrctNos", cntrctNos);
		paramMap.put("finishStatuss", finishStatuss);
		paramMap.put("PROJECT_NAME", PROJECT_NAME);
		paramMap.put("BID_NO_LOW", BID_NO_LOW);
		paramMap.put("BID_NO_HIGH", BID_NO_HIGH);
		paramMap.put("CNTRCT_YEAR", CNTRCT_YEAR);
		paramMap.put("CNTRCT_NO", CNTRCT_NO);
		paramMap.put("BID_COMP_NO", BID_COMP_NO);
		paramMap.put("CNTRCT_NAME", CNTRCT_NAME);
		paramMap.put("CNTRCT_TYPE", CNTRCT_TYPE);
		paramMap.put("CNTRCT_ST_DATE", CNTRCT_ST_DATE);
		paramMap.put("CNTRCT_ED_DATE", CNTRCT_ED_DATE);
		paramMap.put("PROJECT_MANAGER", PROJECT_MANAGER);
		
		@SuppressWarnings("unchecked")
		List<BidRptDto> list = getSqlMapClientTemplate().queryForList("queryAllBidDetailExport", paramMap);
		return list;
		
	}

	@Override
	public List<BidDto> queryBidExportByYear(String strBidNoStart, String strBidNoEnd) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		int yStart = 0;
		int yEnd = 0;
		if(StringUtil.isNotBlank(strBidNoStart)){
			yStart = Integer.parseInt(strBidNoStart.substring(0,2));
		}
		if(StringUtil.isNotBlank(strBidNoEnd)){
			yEnd = Integer.parseInt(strBidNoEnd.substring(0,2));
		}
		if(yStart >= 90 && yEnd < 90){
			paramMap.put("BID_NO_HIGH_MIDDLE", "99-999");
			paramMap.put("BID_NO_LOW_MIDDLE", "00-001");
		} else {
			paramMap.put("BID_NO_LOW_MIDDLE", strBidNoStart);
			paramMap.put("BID_NO_HIGH_MIDDLE", strBidNoEnd);
		}
		paramMap.put("BID_NO_LOW", strBidNoStart);
		paramMap.put("BID_NO_HIGH", strBidNoEnd);
		@SuppressWarnings("unchecked")
		List<BidDto> list = getSqlMapClientTemplate().queryForList("queryBidExportByYear", paramMap);
		return list;
	}

	@Override
	public List<BidDto> queryAgentCo(String strBidNoStart, String strBidNoEnd) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		int yStart = 0;
		int yEnd = 0;
		if(StringUtil.isNotBlank(strBidNoStart)){
			yStart = Integer.parseInt(strBidNoStart.substring(0,2));
		}
		if(StringUtil.isNotBlank(strBidNoEnd)){
			yEnd = Integer.parseInt(strBidNoEnd.substring(0,2));
		}
		if(yStart >= 90 && yEnd < 90){
			paramMap.put("BID_NO_HIGH_MIDDLE", "99-999");
			paramMap.put("BID_NO_LOW_MIDDLE", "00-001");
		} else {
			paramMap.put("BID_NO_LOW_MIDDLE", strBidNoStart);
			paramMap.put("BID_NO_HIGH_MIDDLE", strBidNoEnd);
		}
		paramMap.put("BID_NO_LOW", strBidNoStart);
		paramMap.put("BID_NO_HIGH", strBidNoEnd);
		@SuppressWarnings("unchecked")
		List<BidDto> list = getSqlMapClientTemplate().queryForList("queryAgentCo", paramMap);
		return list;
	}

	@Override
	public List<BidDto> queryBidCo(String strBidNoStart, String strBidNoEnd) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		int yStart = 0;
		int yEnd = 0;
		if(StringUtil.isNotBlank(strBidNoStart)){
			yStart = Integer.parseInt(strBidNoStart.substring(0,2));
		}
		if(StringUtil.isNotBlank(strBidNoEnd)){
			yEnd = Integer.parseInt(strBidNoEnd.substring(0,2));
		}
		if(yStart >= 90 && yEnd < 90){
			paramMap.put("BID_NO_HIGH_MIDDLE", "99-999");
			paramMap.put("BID_NO_LOW_MIDDLE", "00-001");
		} else {
			paramMap.put("BID_NO_LOW_MIDDLE", strBidNoStart);
			paramMap.put("BID_NO_HIGH_MIDDLE", strBidNoEnd);
		}
		paramMap.put("BID_NO_LOW", strBidNoStart);
		paramMap.put("BID_NO_HIGH", strBidNoEnd);
		@SuppressWarnings("unchecked")
		List<BidDto> list = getSqlMapClientTemplate().queryForList("queryBidCo", paramMap);
		return list;
	}

	@Override
	public List<BidDto> queryProjectMg(String strBidNoStart, String strBidNoEnd) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		int yStart = 0;
		int yEnd = 0;
		if(StringUtil.isNotBlank(strBidNoStart)){
			yStart = Integer.parseInt(strBidNoStart.substring(0,2));
		}
		if(StringUtil.isNotBlank(strBidNoEnd)){
			yEnd = Integer.parseInt(strBidNoEnd.substring(0,2));
		}
		if(yStart >= 90 && yEnd < 90){
			paramMap.put("BID_NO_HIGH_MIDDLE", "99-999");
			paramMap.put("BID_NO_LOW_MIDDLE", "00-001");
		} else {
			paramMap.put("BID_NO_LOW_MIDDLE", strBidNoStart);
			paramMap.put("BID_NO_HIGH_MIDDLE", strBidNoEnd);
		}
		paramMap.put("BID_NO_LOW", strBidNoStart);
		paramMap.put("BID_NO_HIGH", strBidNoEnd);
		@SuppressWarnings("unchecked")
		List<BidDto> list = getSqlMapClientTemplate().queryForList("queryProjectMg", paramMap);
		return list;
	}

	@Override
	public List<BidDto> queryBidExport(BidDto bidDto) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		int yStart = 0;
		int yEnd = 0;
		if(StringUtil.isNotBlank(bidDto.getRESERVE3())){
			yStart = Integer.parseInt(bidDto.getRESERVE3().substring(0,2));
		}
		if(StringUtil.isNotBlank(bidDto.getRESERVE4())){
			yEnd = Integer.parseInt(bidDto.getRESERVE4().substring(0,2));
		}
		if(yStart >= 90 && yEnd < 90){
			paramMap.put("BID_NO_HIGH_MIDDLE", "99-999");
			paramMap.put("BID_NO_LOW_MIDDLE", "00-001");
		} else {
			paramMap.put("BID_NO_HIGH_MIDDLE", bidDto.getRESERVE4());
			paramMap.put("BID_NO_LOW_MIDDLE", bidDto.getRESERVE3());
		}
		paramMap.put("BID_NO_LOW", bidDto.getRESERVE3());
		paramMap.put("BID_NO_HIGH", bidDto.getRESERVE4());
		paramMap.put("RESERVE_DATE6", DateUtil.dateToShortStr(bidDto.getRESERVE_DATE6()));
		paramMap.put("BID_NO", bidDto.getBID_NO());
		paramMap.put("RESERVE2", bidDto.getRESERVE2());
		paramMap.put("PROJECT_NAME", bidDto.getPROJECT_NAME());
//		paramMap.put("AGENT_CO_NAME", bidDto.getAGENT_CO_NAME());
//		paramMap.put("AGENT_CO_MANAGER", bidDto.getAGENT_CO_MANAGER());
		paramMap.put("BID_AGENT_PAY", bidDto.getBID_AGENT_PAY());
		if(bidDto.getBID_BOND().compareTo(BigDecimal.ZERO) == 0){
			paramMap.put("BID_BOND", "");
		} else {
			paramMap.put("BID_BOND", bidDto.getBID_BOND());
		}
//		if(bidDto.getPROJ_ASTRICT_PRICE().equals("0")){
//			paramMap.put("PROJ_ASTRICT_PRICE", "");
//		} else {
//			paramMap.put("PROJ_ASTRICT_PRICE", bidDto.getPROJ_ASTRICT_PRICE());
//		}
		paramMap.put("BID_CO_NAME", bidDto.getBID_CO_NAME());
//		if(bidDto.getBID_WIN_PRICE().equals("0")){
//			paramMap.put("BID_WIN_PRICE", "");
//		} else {
//			paramMap.put("BID_WIN_PRICE", bidDto.getBID_WIN_PRICE());
//		}
		if(bidDto.getBID_APPLY_PRICE().compareTo(BigDecimal.ZERO) == 0){
			paramMap.put("BID_APPLY_PRICE", "");
		} else {
			paramMap.put("BID_APPLY_PRICE", bidDto.getBID_APPLY_PRICE());
		}
		if(bidDto.getBID_AGENT_PRICE().compareTo(BigDecimal.ZERO) == 0){
			paramMap.put("BID_AGENT_PRICE", "");
		} else {
			paramMap.put("BID_AGENT_PRICE", bidDto.getBID_AGENT_PRICE());
		}
//		if(bidDto.getBID_COMMISION().compareTo(BigDecimal.ZERO) == 0){
//			paramMap.put("BID_COMMISION", "");
//		} else {
//			paramMap.put("BID_COMMISION", bidDto.getBID_COMMISION());
//		}
		paramMap.put("PROJECT_MANAGER", bidDto.getPROJECT_MANAGER());
		paramMap.put("TENDER_OPEN_DATE", DateUtil.dateToShortStr(bidDto.getTENDER_OPEN_DATE()));
//		paramMap.put("SUBMIT_DATE", DateUtil.dateToShortStr(bidDto.getSUBMIT_DATE()));
//		paramMap.put("SUBMIT_DATE2", DateUtil.dateToShortStr(bidDto.getSUBMIT_DATE2()));
//		paramMap.put("BID_NOTICE_DATE", DateUtil.dateToShortStr(bidDto.getBID_NOTICE_DATE()));
//		paramMap.put("BID_NOTICE_DATE2", DateUtil.dateToShortStr(bidDto.getBID_NOTICE_DATE2()));
		paramMap.put("BID_MESSAGE_DATE", DateUtil.dateToShortStr(bidDto.getBID_MESSAGE_DATE()));
		paramMap.put("RESERVE_DATE4", DateUtil.dateToShortStr(bidDto.getRESERVE_DATE4()));
//		paramMap.put("RESERVE_DATE7", DateUtil.dateToShortStr(bidDto.getRESERVE_DATE7()));
		if(bidDto.getFINISH_STATUS().equals("1")){
			paramMap.put("FINISH_STATUS", bidDto.getFINISH_STATUS());
			paramMap.put("RESERVE1", "");
		} else if(bidDto.getFINISH_STATUS().equals("2")){
			paramMap.put("FINISH_STATUS", "");
			paramMap.put("RESERVE1", bidDto.getRESERVE1());
		} else {
			paramMap.put("FINISH_STATUS", "");
			paramMap.put("RESERVE1", "");
		}
		paramMap.put("FINISH_NOTE", bidDto.getFINISH_NOTE());
		paramMap.put("BID_CO_NAME_I", "EXISTS");
		paramMap.put("BID_BOND_I", ">");
		paramMap.put("PROJ_ASTRICT_PRICE_I", ">");
		paramMap.put("BID_WIN_PRICE_I", ">");
		paramMap.put("BID_APPLY_PRICE_I", ">");
		paramMap.put("BID_AGENT_PRICE_I", ">");
		paramMap.put("BID_COMMISION_I", ">");
		paramMap.put("SUBMIT_DATE_I", "=");
		paramMap.put("SUBMIT_DATE2_I", "=");
		paramMap.put("BID_NOTICE_DATE_I", "=");
		paramMap.put("BID_NOTICE_DATE2_I", "=");
		paramMap.put("FINISH_STATUS_I", "=");
		
		String[] bidExportAll = {};
//		if(!bidDto.getBID_EXPORT().equals("")){
//			bidExportAll = bidDto.getBID_EXPORT().split(",");
//		}
		TreeMap<Integer, String> treeMapBid = new TreeMap<Integer, String>();
		for(String bidExport : bidExportAll ){
			String[] bidExportOne = bidExport.split("-");
			if(StringUtil.isNotBlank(bidExportOne[1])){
				String orderBy = bidExportOne[0];
				if(orderBy.equals("BID_WIN_PRICE")){
					orderBy = "BID_PRICE_LIST";
				}
				if(bidExportOne[2].equals("1")){
					orderBy = orderBy + " desc";
				}
				treeMapBid.put(Integer.valueOf(bidExportOne[1]), "B." + orderBy);
			}
			if(bidExportOne[0].equals("BID_CO_NAME") && bidExportOne[3].equals("1")){
				paramMap.put("BID_CO_NAME_I", "NOT EXISTS");
			}
			if(bidExportOne[0].equals("BID_WIN_PRICE") || bidExportOne[0].equals("BID_APPLY_PRICE") || bidExportOne[0].equals("BID_AGENT_PRICE")
					|| bidExportOne[0].equals("BID_BOND") || bidExportOne[0].equals("PROJ_ASTRICT_PRICE") || bidExportOne[0].equals("BID_COMMISION")){
				if(bidExportOne[3].equals("0")){
					if(bidExportOne[4].equals("1")){
						paramMap.put(bidExportOne[0] + "_I", ">");
					} else if(bidExportOne[4].equals("2")){
						paramMap.put(bidExportOne[0] + "_I", ">=");
					} else if(bidExportOne[4].equals("3")){
						paramMap.put(bidExportOne[0] + "_I", "<");
					} else if(bidExportOne[4].equals("4")){
						paramMap.put(bidExportOne[0] + "_I", "<=");
					} else if(bidExportOne[4].equals("5")){
						paramMap.put(bidExportOne[0] + "_I", "=");
					}
				} else {
					if(bidExportOne[4].equals("1")){
						paramMap.put(bidExportOne[0] + "_I", "<=");
					} else if(bidExportOne[4].equals("2")){
						paramMap.put(bidExportOne[0] + "_I", "<");
					} else if(bidExportOne[4].equals("3")){
						paramMap.put(bidExportOne[0] + "_I", ">=");
					} else if(bidExportOne[4].equals("4")){
						paramMap.put(bidExportOne[0] + "_I", ">");
					} else if(bidExportOne[4].equals("5")){
						paramMap.put(bidExportOne[0] + "_I", "<>");
					}
				}
			}
			if(bidExportOne[0].equals("SUBMIT_DATE") && bidExportOne[3].equals("1")){
				paramMap.put("SUBMIT_DATE_I", "<>");
			}
			if(bidExportOne[0].equals("SUBMIT_DATE2") && bidExportOne[3].equals("1")){
				paramMap.put("SUBMIT_DATE2_I", "<>");
			}
			if(bidExportOne[0].equals("BID_NOTICE_DATE") && bidExportOne[3].equals("1")){
				paramMap.put("BID_NOTICE_DATE_I", "<>");
			}
			if(bidExportOne[0].equals("BID_NOTICE_DATE2") && bidExportOne[3].equals("1")){
				paramMap.put("BID_NOTICE_DATE2_I", "<>");
			}
			if(bidExportOne[0].equals("FINISH_STATUS") && bidExportOne[3].equals("1")){
				paramMap.put("FINISH_STATUS_I", "<>");
			}
		}
	    String orderBy = "order by ";
	    if(treeMapBid.size()>0){
			for (Integer key : treeMapBid.keySet()) {
			    orderBy = orderBy + treeMapBid.get(key) + ",";
			}
	    } else {
	    	orderBy = "order by B.UPDATE_DATE desc,";
	    }
		paramMap.put("ORDER_BY", orderBy.substring(0, orderBy.length()-1));
		System.out.println("paramMap:" + paramMap);
		
		@SuppressWarnings("unchecked")
		List<BidDto> list = getSqlMapClientTemplate().queryForList("queryBidExport", paramMap);
		return list;
	}
	
	@Override
	public List<BidDto> queryAllBidByCntrctNo(String CNTRCT_NO) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("CNTRCT_NO", CNTRCT_NO);
		@SuppressWarnings("unchecked")
		List<BidDto> list = getSqlMapClientTemplate().queryForList("queryAllBidByCntrctNo", paramMap);
		return list;
	}

	/** 招标履历 **/
	@Override
	public List<BidHistDto> queryAllBidHist(String bidNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_NO", bidNo);
		@SuppressWarnings("unchecked")
		List<BidHistDto> list = getSqlMapClientTemplate().queryForList("queryAllBidHist", paramMap);
		return list;
	}
	
	@Override
	public List<BidHistDto> queryBidHistByPage(String bidNo, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_NO", bidNo);
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<BidHistDto> list = getSqlMapClientTemplate().queryForList("queryBidHistByPage", paramMap);
		return list;
	}

	@Override
	public int queryBidHistCountByPage(String bidNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_NO", bidNo);
		return (Integer) getSqlMapClientTemplate().queryForObject("queryBidHistCountByPage", paramMap);
	}

	@Override
	public BidHistDto queryBidHistByID(String bidHisSeq) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BID_HIS_SEQ", bidHisSeq);
		@SuppressWarnings("unchecked")
		List<BidHistDto> list = getSqlMapClientTemplate().queryForList("queryBidHistByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void insertBidHist(BidHistDto bidHistDto) {
		getSqlMapClientTemplate().insert("insertBidHist", bidHistDto);
	}
}
