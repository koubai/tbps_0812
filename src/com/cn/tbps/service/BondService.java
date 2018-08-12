package com.cn.tbps.service;

import java.util.List;

import com.cn.tbps.dto.BondDetailDto;
import com.cn.tbps.dto.BondDto;
import com.cn.tbps.dto.BondExtendDto;

/**
 * @name BondService.java
 * @author Frank
 * @time 2014-2-20上午1:37:53
 * @version 1.0
 */
public interface BondService {

	/**
	 * 根据委托公司查询保证金汇总明细
	 * @param AGENT_NO
	 * @param tenderOpenDateLow
	 * @param tenderOpenDateHigh
	 * @return
	 */
	public List<BondDto> queryBondByAgentNo(String AGENT_NO, String tenderOpenDateLow, String tenderOpenDateHigh);
	
	/**
	 * 根据委托公司查询保证金汇总明细(新)
	 * @param AGENT_NO
	 * @param tenderOpenDateLow
	 * @param tenderOpenDateHigh
	 * @return
	 */
	public List<BondDetailDto> queryBondDetailByAgentNo(String AGENT_NO, String tenderOpenDateLow, String tenderOpenDateHigh);

	/**
	 * 保证金汇总（以委托公司为聚合条件）
	 * @param AGENT_NO
	 * @param projectType
	 * @param tenderOpenDateLow
	 * @param tenderOpenDateHigh
	 * @return
	 */
	public List<BondDto> queryAllBondGroupByAgentNo(String AGENT_NO, String projectType, String tenderOpenDateLow, String tenderOpenDateHigh);

	/**
	 * 保证金汇总
	 * @param AGENT_NO
	 * @param projectType
	 * @param tenderOpenDateLow
	 * @param tenderOpenDateHigh
	 * @param dateStart
	 * @param dateEnd
	 * @return
	 */
	public List<BondExtendDto> queryAllBondByBidNo(String AGENT_NO, String projectType, String tenderOpenDateLow, String tenderOpenDateHigh,
			String dateStart, String dateEnd);
}
