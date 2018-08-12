package com.cn.tbps.service;

import java.util.List;

import com.cn.common.util.Page;
import com.cn.tbps.dto.SettlementDto;
import com.cn.tbps.dto.WithholdDto;

/**
 * @name WithholdService.java
 * @author Frank
 * @time 2013-11-25下午11:35:34
 * @version 1.0
 */
public interface WithholdService {
	
	//费用结算清单
	/**
	 * 费用结算清单导出
	 * @param billDateLow
	 * @param billDateHigh
	 * @param types
	 * @param agentNo
	 * @return
	 */
	public List<SettlementDto> querySettlementExport(String billDateLow,
			String billDateHigh, String types, String agentNo);

	//代扣
	/**
	 * 代扣导出
	 * @param withholdDateLow
	 * @param withholdDateHigh
	 * @param withholdType
	 * @return
	 */
	public List<WithholdDto> queryWithholdExport(String withholdDateLow,
			String withholdDateHigh, String withholdType);
	
	/**
	 * 分页查询代扣
	 * @param withholdDateLow
	 * @param withholdDateHigh
	 * @param withholdType
	 * @param page
	 * @return
	 */
	public Page queryWithholdByPage(String withholdDateLow,
			String withholdDateHigh, String withholdType, Page page);
	
	/**
	 * 查询代扣（查询未删除的记录）
	 * @param WITHHOLD_NO
	 * @return
	 */
	public WithholdDto queryWithholdByID(String WITHHOLD_NO);
	
	/**
	 * 查询代扣（查询所有记录）
	 * @param WITHHOLD_NO
	 * @return
	 */
	public WithholdDto queryAllWithholdByID(String WITHHOLD_NO);
	
	/**
	 * 插入代扣
	 * @param withhold
	 */
	public void insertWithhold(WithholdDto withhold);
	
	/**
	 * 删除代扣
	 * @param WITHHOLD_NO
	 * @param username
	 */
	public void delWithholdById(String WITHHOLD_NO, String username);
	
	/**
	 * 更新代扣
	 * @param withhold
	 */
	public void updateWithhold(WithholdDto withhold);
}
