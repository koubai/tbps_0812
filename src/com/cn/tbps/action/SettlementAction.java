package com.cn.tbps.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.common.factory.Poi2007Base;
import com.cn.common.factory.PoiFactory;
import com.cn.common.util.Constants;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.SettlementDto;
import com.cn.tbps.service.WithholdService;

/**
 * 费用结算清单
 * @name SettlementAction.java
 * @author Frank
 * @time 2014-1-9下午9:44:02
 * @version 1.0
 */
public class SettlementAction extends BaseAction {

	private static final long serialVersionUID = -5301544274691308791L;
	
	private static final Logger log = LogManager.getLogger(SettlementAction.class);
	
	private WithholdService withholdService;
	
	/**
	 * 费用清单列表
	 */
	private List<SettlementDto> listSettlement;
	
	//查询条件
	private String strBillDateLow;
	
	private String strBillDateHigh;
	
	private String strTypes;
	
	/**
	 * 委托单位名称
	 */
	private String strAgentCompName;
	
	/**
	 * 委托单位Code
	 */
	private String strAgentNo;
	
	/**
	 * 显示费用结算清单页面
	 * @return
	 */
	public String showSettlementAction() {
		try {
			this.clearMessages();
			listSettlement = new ArrayList<SettlementDto>();
			strBillDateLow = "";
			strBillDateHigh = "";
			strAgentCompName = "";
			strAgentNo = "";
			strTypes = "123";
			//queryData();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询费用结算清单
	 * @return
	 */
	public String querySettlementAction() {
		try {
			this.clearMessages();
			queryData();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 导出费用结算清单
	 * @return
	 */
	public String exportSettlementAction() {
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_FYJSQD);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_FYJSQD);
			
			//查询数据
			List<SettlementDto> list = withholdService.querySettlementExport(strBillDateLow, strBillDateHigh, strTypes, strAgentNo);
			
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_FYJSQD);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询所有记录
	 */
	private void queryData() {
		listSettlement = withholdService.querySettlementExport(strBillDateLow, strBillDateHigh, strTypes, strAgentNo);
	}

	public WithholdService getWithholdService() {
		return withholdService;
	}

	public void setWithholdService(WithholdService withholdService) {
		this.withholdService = withholdService;
	}

	public List<SettlementDto> getListSettlement() {
		return listSettlement;
	}

	public void setListSettlement(List<SettlementDto> listSettlement) {
		this.listSettlement = listSettlement;
	}

	public String getStrBillDateLow() {
		return strBillDateLow;
	}

	public void setStrBillDateLow(String strBillDateLow) {
		this.strBillDateLow = strBillDateLow;
	}

	public String getStrBillDateHigh() {
		return strBillDateHigh;
	}

	public void setStrBillDateHigh(String strBillDateHigh) {
		this.strBillDateHigh = strBillDateHigh;
	}

	public String getStrTypes() {
		return strTypes;
	}

	public void setStrTypes(String strTypes) {
		this.strTypes = strTypes;
	}

	public String getStrAgentCompName() {
		return strAgentCompName;
	}

	public void setStrAgentCompName(String strAgentCompName) {
		this.strAgentCompName = strAgentCompName;
	}

	public String getStrAgentNo() {
		return strAgentNo;
	}

	public void setStrAgentNo(String strAgentNo) {
		this.strAgentNo = strAgentNo;
	}
}
