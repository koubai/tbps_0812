package com.cn.tbps.service.impl;

import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.BondDao;
import com.cn.tbps.dto.BondDetailDto;
import com.cn.tbps.dto.BondDto;
import com.cn.tbps.dto.BondExtendDto;
import com.cn.tbps.service.BondService;

/**
 * @name BondServiceImpl.java
 * @author Frank
 * @time 2014-2-20上午1:38:28
 * @version 1.0
 */
public class BondServiceImpl extends BaseService implements BondService {

	private BondDao bondDao;
	
	@Override
	public List<BondDto> queryBondByAgentNo(String AGENT_NO, String tenderOpenDateLow, String tenderOpenDateHigh) {
		return bondDao.queryBondByAgentNo(AGENT_NO, tenderOpenDateLow, tenderOpenDateHigh);
	}

	@Override
	public List<BondDetailDto> queryBondDetailByAgentNo(String AGENT_NO, String tenderOpenDateLow, String tenderOpenDateHigh) {
		return bondDao.queryBondDetailByAgentNo(AGENT_NO, tenderOpenDateLow, tenderOpenDateHigh);
	}
	
	@Override
	public List<BondDto> queryAllBondGroupByAgentNo(String AGENT_NO, String projectType, String tenderOpenDateLow, String tenderOpenDateHigh) {
		AGENT_NO = StringUtil.specEncoding(AGENT_NO);
		return bondDao.queryAllBondGroupByAgentNo(AGENT_NO, projectType, tenderOpenDateLow, tenderOpenDateHigh);
	}
	
	@Override
	public List<BondExtendDto> queryAllBondByBidNo(String AGENT_NO, String projectType, String tenderOpenDateLow, String tenderOpenDateHigh,
			String dateStart, String dateEnd) {
		AGENT_NO = StringUtil.specEncoding(AGENT_NO);
		return bondDao.queryAllBondByBidNo(AGENT_NO, projectType, tenderOpenDateLow, tenderOpenDateHigh, dateStart, dateEnd);
	}

	public BondDao getBondDao() {
		return bondDao;
	}

	public void setBondDao(BondDao bondDao) {
		this.bondDao = bondDao;
	}
}
