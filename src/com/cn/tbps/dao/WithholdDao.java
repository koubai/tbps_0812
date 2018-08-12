package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.SettlementDto;
import com.cn.tbps.dto.WithholdDto;

/**
 * @name WithholdDao.java
 * @author Frank
 * @time 2013-11-25下午10:13:49
 * @version 1.0
 */
public interface WithholdDao {
	
	/**
	 * 费用结算清单
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
	 * @param start
	 * @param end
	 * @return
	 */
	public List<WithholdDto> queryWithholdByPage(String withholdDateLow,
			String withholdDateHigh, String withholdType, int start, int end);
	
	/**
	 * 查询总记录数
	 * @param withholdDateLow
	 * @param withholdDateHigh
	 * @param withholdType
	 * @return
	 */
	public int queryWithholdCountByPage(String withholdDateLow,
			String withholdDateHigh, String withholdType);
	
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
	 * @param withhold
	 */
	public void delWithholdById(WithholdDto withhold);
	
	/**
	 * 更新代扣
	 * @param withhold
	 */
	public void updateWithhold(WithholdDto withhold);
}
