package com.cn.tbps.service.impl;

import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.WithholdDao;
import com.cn.tbps.dto.SettlementDto;
import com.cn.tbps.dto.WithholdDto;
import com.cn.tbps.service.WithholdService;

/**
 * @name WithholdServiceImpl.java
 * @author Frank
 * @time 2013-11-25下午11:38:03
 * @version 1.0
 */
public class WithholdServiceImpl extends BaseService implements WithholdService {
	
	private WithholdDao withholdDao;
	
	//费用结算清单
	@Override
	public List<SettlementDto> querySettlementExport(String billDateLow,
			String billDateHigh, String types, String agentNo) {
		String type = formatType(types);
		agentNo = StringUtil.specEncoding(agentNo);
		return withholdDao.querySettlementExport(billDateLow, billDateHigh, type, agentNo);
	}
	
	//代扣
	@Override
	public List<WithholdDto> queryWithholdExport(String withholdDateLow,
			String withholdDateHigh, String withholdType) {
		return withholdDao.queryWithholdExport(withholdDateLow, withholdDateHigh, withholdType);
	}
	
	@Override
	public Page queryWithholdByPage(String withholdDateLow,
			String withholdDateHigh, String withholdType, Page page) {
		//查询总记录数
		int totalCount = withholdDao.queryWithholdCountByPage(withholdDateLow, withholdDateHigh, withholdType);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<WithholdDto> list = withholdDao.queryWithholdByPage(withholdDateLow, withholdDateHigh, withholdType,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}
	
	@Override
	public WithholdDto queryWithholdByID(String WITHHOLD_NO) {
		return withholdDao.queryWithholdByID(WITHHOLD_NO);
	}

	@Override
	public WithholdDto queryAllWithholdByID(String WITHHOLD_NO) {
		return withholdDao.queryAllWithholdByID(WITHHOLD_NO);
	}

	@Override
	public void insertWithhold(WithholdDto withhold) {
		withhold.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
		withholdDao.insertWithhold(withhold);
	}

	@Override
	public void delWithholdById(String WITHHOLD_NO, String username) {
		WithholdDto withhold = withholdDao.queryWithholdByID(WITHHOLD_NO);
		if(withhold != null) {
			withhold.setUPDATE_USER(username);
			withhold.setDELETE_FLG(Constants.IS_DELETE_DEL);
			withholdDao.updateWithhold(withhold);
		}
	}

	@Override
	public void updateWithhold(WithholdDto withhold) {
		withhold.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
		withholdDao.updateWithhold(withhold);
	}
	
	/**
	 * @param types
	 * @return
	 */
	private String formatType(String types) {
		String type = "";
		if(types != null && types.length() > 0) {
			if(types.indexOf("1") >= 0) {
				type += "'1',";
			}
			if(types.indexOf("2") >= 0) {
				type += "'2',";
			}
			if(types.indexOf("3") >= 0) {
				type += "'3',";
			}
			if(type.length() > 0) {
				type += "'4','5',";
				type = type.substring(0, type.length() - 1);
			} else {
				type = "'0'";
			}
		} else {
			type = "'0'";
		}
		return type;
	}

	public WithholdDao getWithholdDao() {
		return withholdDao;
	}

	public void setWithholdDao(WithholdDao withholdDao) {
		this.withholdDao = withholdDao;
	}
}
