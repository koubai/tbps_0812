package com.cn.tbps.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.action.BaseAction;
import com.cn.common.factory.Poi2007Base;
import com.cn.common.factory.PoiFactory;
import com.cn.common.util.Constants;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.AgentCompDto;
import com.cn.tbps.dto.BidCompDto;
import com.cn.tbps.dto.BidDto;
import com.cn.tbps.dto.BidExtendDto;
import com.cn.tbps.dto.BondDetailDto;
import com.cn.tbps.dto.BondDto;
import com.cn.tbps.dto.BondExtendDto;
import com.cn.tbps.service.AgentCompService;
import com.cn.tbps.service.BidCompService;
import com.cn.tbps.service.BidService;
import com.cn.tbps.service.BondService;

/**
 * @name BondAction.java
 * @author Frank
 * @time 2014-2-20上午1:41:35
 * @version 1.0
 */
public class BondAction extends BaseAction {

	private static final long serialVersionUID = 9061612787849811535L;
	
	private BondService bondService;
	
	private AgentCompService agentCompService;
	
	private BidService bidService;
	
	private BidCompService bidCompService;
	
	/**
	 * 按委托公司汇总
	 */
	private List<BondDto> listBondDto;
	
	/**
	 * 委托公司名（查询条件）
	 */
	private String strAgentName;
	
	/**
	 * 委托公司CODE（查询条件）
	 */
	private String strAgentCode;
	
	/**
	 * 招标分类（查询条件）
	 */
	private String strProjectType;
	
	/**
	 * 开标日期起（查询条件）
	 */
	private String strTenderOpenDateLow;
	
	/**
	 * 开标日期终（查询条件）
	 */
	private String strTenderOpenDateHigh;
	
	/**
	 * 委托公司汇总明细
	 */
	private List<BondDetailDto> listBondDtoDetail;
	
	/**
	 * 委托公司名（明细页面显示用）
	 */
	private String strAgentCompName;
	
	/**
	 * 委托公司代码
	 */
	private String strAgentNo;
	
	/**
	 * 招标编号
	 */
	private String strBidNo;
	
	/**
	 * 投标公司列表
	 */
	private List<BidCompDto> listBidComp;
	
	//根据日期下载保证金
	private String strDateStart;
	private String strDateEnd;
	
	/**
	 * 保证金明细数据导出
	 * @return
	 */
	public String exportBondDetailAction() {
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_BZJMX);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_BZJMX);
			
			//查询明细
			List<BondDetailDto> list = bondService.queryBondDetailByAgentNo(strAgentNo, strTenderOpenDateLow, strTenderOpenDateHigh);
			
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_BZJMX);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 保证金汇总数据导出
	 * @return
	 */
	public String exportBondAction() {
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_BZJHZ);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_BZJHZ);
			
			//查询汇总
			List<BondDto> list = bondService.queryAllBondGroupByAgentNo(strAgentCode, strProjectType, strTenderOpenDateLow, strTenderOpenDateHigh);
			
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_BZJHZ);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示保证金日期检索
	 * @return 
	 */
	public String showExportDateAction() {
		setStrDateStart("");
		setStrDateEnd("");
		return SUCCESS;
	}
	
	/**
	 * 保证金汇总数据导出
	 * @return
	 */
	public String exportBond2Action() {
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_BZJHZ);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_BZJHZ_AD01);

			Map<String, Object> paramMap = new HashMap<String, Object>();
			String dateStart = "";
			String dateEnd = "";
			if(StringUtil.isNotBlank(strDateStart)){
				dateStart = strDateStart.substring(0, 4);
			}
			if(StringUtil.isNotBlank(strDateEnd)){
				dateEnd = strDateEnd.substring(0, 4);
			}
			if(dateStart.equals(dateEnd)){
				dateEnd = "";
			}
			if(!dateStart.equals("") && !dateEnd.equals("")){
				dateEnd = "-" + dateEnd;
			}
			paramMap.put("dateStart", dateStart);
			paramMap.put("dateEnd", dateEnd);
			
			//查询汇总
			List<BondExtendDto> list = bondService.queryAllBondByBidNo(strAgentCode, strProjectType, strTenderOpenDateLow, strTenderOpenDateHigh,
					strDateStart, strDateEnd);
			
			base.setDatas(list);
			base.setMap(paramMap);
			base.setSheetName(Constants.EXCEL_TYPE_BZJHZ);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 保证金汇总页面
	 * @return
	 */
	public String showBondAction() {
		try {
			this.clearMessages();
			listBondDto = new ArrayList<BondDto>();
//			listBondDtoDetail = new ArrayList<BondDto>();
			strAgentNo = "";
			strBidNo = "";
			strAgentName = "";
			strAgentCode = "";
			strProjectType = "";
			strAgentCompName = "";
			strTenderOpenDateLow = "";
			strTenderOpenDateHigh = "";
			//查询汇总
			listBondDto = bondService.queryAllBondGroupByAgentNo(strAgentCode, strProjectType, strTenderOpenDateLow, strTenderOpenDateHigh);
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询保证金汇总页面
	 * @return
	 */
	public String queryBondAction() {
		try {
			this.clearMessages();
			listBondDto = new ArrayList<BondDto>();
//			listBondDtoDetail = new ArrayList<BondDto>();
			strAgentNo = "";
			strAgentCompName = "";
			//查询汇总
			listBondDto = bondService.queryAllBondGroupByAgentNo(strAgentCode, strProjectType, strTenderOpenDateLow, strTenderOpenDateHigh);
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 委托公司保证金明细
	 * @return
	 */
	public String showBondDetailAction() {
		try {
			this.clearMessages();
			listBondDtoDetail = new ArrayList<BondDetailDto>();
			//查询委托公司
			AgentCompDto agentComp = agentCompService.queryAgentCompByID(strAgentNo);
			if(agentComp == null) {
				//查询被删除的委托公司
				//agentComp = agentCompService.queryAllAgentCompByID(strAgentNo);
				this.addActionMessage("该委托公司不存在或记录被删除！");
			} else {
				strAgentCompName = agentComp.getANGENT_COMP_NAME();
				//查询汇总明细
				listBondDtoDetail = bondService.queryBondDetailByAgentNo(strAgentNo, strTenderOpenDateLow, strTenderOpenDateHigh);
			}
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 根据招标编号，显示投标公司明细一览
	 * @return
	 */
	public String showBondBidCompAction() {
		try {
			this.clearMessages();
			listBidComp = new ArrayList<BidCompDto>();
			//查询招标
			BidDto bid = bidService.queryBidByID(strBidNo);
			if(bid != null) {
				//查询投标公司
				listBidComp = bidCompService.queryBidCompByIds(bid.getBID_CO_LIST());
			}
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}

	public BondService getBondService() {
		return bondService;
	}

	public void setBondService(BondService bondService) {
		this.bondService = bondService;
	}

	public List<BondDto> getListBondDto() {
		return listBondDto;
	}

	public void setListBondDto(List<BondDto> listBondDto) {
		this.listBondDto = listBondDto;
	}

	public List<BondDetailDto> getListBondDtoDetail() {
		return listBondDtoDetail;
	}

	public void setListBondDtoDetail(List<BondDetailDto> listBondDtoDetail) {
		this.listBondDtoDetail = listBondDtoDetail;
	}

	public String getStrAgentNo() {
		return strAgentNo;
	}

	public void setStrAgentNo(String strAgentNo) {
		this.strAgentNo = strAgentNo;
	}

	public AgentCompService getAgentCompService() {
		return agentCompService;
	}

	public void setAgentCompService(AgentCompService agentCompService) {
		this.agentCompService = agentCompService;
	}

	public String getStrAgentCompName() {
		return strAgentCompName;
	}

	public void setStrAgentCompName(String strAgentCompName) {
		this.strAgentCompName = strAgentCompName;
	}

	public String getStrAgentName() {
		return strAgentName;
	}

	public void setStrAgentName(String strAgentName) {
		this.strAgentName = strAgentName;
	}

	public String getStrProjectType() {
		return strProjectType;
	}

	public void setStrProjectType(String strProjectType) {
		this.strProjectType = strProjectType;
	}

	public String getStrBidNo() {
		return strBidNo;
	}

	public void setStrBidNo(String strBidNo) {
		this.strBidNo = strBidNo;
	}

	public BidService getBidService() {
		return bidService;
	}

	public void setBidService(BidService bidService) {
		this.bidService = bidService;
	}

	public BidCompService getBidCompService() {
		return bidCompService;
	}

	public void setBidCompService(BidCompService bidCompService) {
		this.bidCompService = bidCompService;
	}

	public List<BidCompDto> getListBidComp() {
		return listBidComp;
	}

	public void setListBidComp(List<BidCompDto> listBidComp) {
		this.listBidComp = listBidComp;
	}

	public String getStrAgentCode() {
		return strAgentCode;
	}

	public void setStrAgentCode(String strAgentCode) {
		this.strAgentCode = strAgentCode;
	}

	public String getStrTenderOpenDateLow() {
		return strTenderOpenDateLow;
	}

	public void setStrTenderOpenDateLow(String strTenderOpenDateLow) {
		this.strTenderOpenDateLow = strTenderOpenDateLow;
	}

	public String getStrTenderOpenDateHigh() {
		return strTenderOpenDateHigh;
	}

	public void setStrTenderOpenDateHigh(String strTenderOpenDateHigh) {
		this.strTenderOpenDateHigh = strTenderOpenDateHigh;
	}

	public String getStrDateStart() {
		return strDateStart;
	}

	public void setStrDateStart(String strDateStart) {
		this.strDateStart = strDateStart;
	}

	public String getStrDateEnd() {
		return strDateEnd;
	}

	public void setStrDateEnd(String strDateEnd) {
		this.strDateEnd = strDateEnd;
	}
}
