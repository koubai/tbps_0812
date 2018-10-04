package com.cn.tbps.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.BidDto;
import com.cn.tbps.service.BidService;
import com.opensymphony.xwork2.ActionContext;

/**
 * 招标代理费设定
 * @author Frank
 * @version 1.0
 * @createtime 2018年8月30日 上午7:14:34
 */
public class BidAgentCostAction extends BaseAction {

	private static final long serialVersionUID = -8524399330846182774L;

	private static final Logger log = LogManager.getLogger(BidAgentCostAction.class);
	
	private BidService bidService;
	
	/**
	 * 页码
	 */
	private int startIndex;
	
	/**
	 * 翻页
	 */
	private Page page;
	
	/**
	 * 招标列表
	 */
	private List<BidDto> listBid;
	
	//合同年份
	private String strCNTRCT_YEAR;
	//合同开始时间
	private String strCNTRCT_ST_DATE;
	//合同结束时间
	private String strCNTRCT_ED_DATE;
	//合同编号
	private String strCNTRCT_NO;
	//委托单位
	private String strBID_COMP_NO;
	//委托单位名
	private String strBID_COMP_NAME;
	
	//查询条件-招标编号（起）
	private String strBidNoLow;
	//查询条件-招标编号（终）
	private String strBidNoHigh;
	//项目名称
	private String strCNTRCT_NAME;
	//代理费计算情况，是否有实收代理费
	private String strBID_AGENT_PRICE_ACT;
	//开票情况，是否有开票日期
	private String strRECEIPT1_DATE;
	//到账情况，是否有到账日期
	private String strRECEIPT1_VALUE_DATE;
	
	//多个合同编号
	private String strCntrctNos;
	
	//代理费计算
	private List<BidDto> agentCostBidList;
	
	//暂时作废不用 update by frank
	private String strDiscount;
	//开票日期
	private String strCommonReceiptDate;
	private String strCommonReceiptValueDate;
	
	/**
	 * 计算代理费
	 * @return
	 */
	public String calcBidAgentCostAction() {
		try {
			this.clearMessages();
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			bidService.saveBidAgentCost(agentCostBidList, username);
			//刷新页面
			queryData();
			this.addActionMessage("代理费设定完成！");
		} catch(Exception e) {
			log.error("calcBidAgentCostAction:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示招标代理费设定页面
	 * @return
	 */
	public String showBidAgentCostByCntrctAction() {
		try {
			this.clearMessages();
			listBid = new ArrayList<BidDto>();
			agentCostBidList = new ArrayList<BidDto>();
			strDiscount = "";
			strCommonReceiptDate = "";
			strCommonReceiptValueDate = "";
			strBidNoLow = "";
			strBidNoHigh = "";
			strCNTRCT_NAME = "";
			strBID_AGENT_PRICE_ACT = "";
			strRECEIPT1_DATE = "";
			strRECEIPT1_VALUE_DATE = "";
			
			strCNTRCT_YEAR = "";
			strCNTRCT_ST_DATE = "";
			strCNTRCT_ED_DATE = "";
			strCNTRCT_NO = "";
			strBID_COMP_NO = "";
			strBID_COMP_NAME = "";
			page = new Page();
			startIndex = 0;
			if(StringUtil.isNotBlank(strCntrctNos)) {
				//查询招标列表
				queryData();
			}
		} catch(Exception e) {
			log.error("showBidAgentCostByCntrctAction:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示招标代理费设定页面
	 * @return
	 */
	public String showBidAgentCostAction() {
		try {
			this.clearMessages();
			listBid = new ArrayList<BidDto>();
			agentCostBidList = new ArrayList<BidDto>();
			strDiscount = "";
			strCommonReceiptDate = "";
			strCommonReceiptValueDate = "";
			
			strBidNoLow = "";
			strBidNoHigh = "";
			strCNTRCT_NAME = "";
			strBID_AGENT_PRICE_ACT = "";
			strRECEIPT1_DATE = "";
			strRECEIPT1_VALUE_DATE = "";
			
			strCNTRCT_YEAR = "";
			strCNTRCT_ST_DATE = "";
			strCNTRCT_ED_DATE = "";
			strCNTRCT_NO = "";
			strBID_COMP_NO = "";
			strBID_COMP_NAME = "";
			page = new Page();
			startIndex = 0;
		} catch(Exception e) {
			log.error("showBidAgentCostAction:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询招标列表
	 * @return
	 */
	public String queryBidAgentCostList() {
		try {
			this.clearMessages();
			//直接清空
			strCntrctNos = "";
			page = new Page();
			startIndex = 0;
			queryData();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 翻页
	 * @return
	 */
	public String turnBidAgentCostPage() {
		try {
			this.clearMessages();
			queryData();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	private void queryData() {
		listBid = new ArrayList<BidDto>();
		agentCostBidList = new ArrayList<BidDto>();
		strDiscount = "";
		strCommonReceiptDate = "";
		strCommonReceiptValueDate = "";
		if(page == null) {
			page = new Page();
		}
		//翻页查询所有招标
		this.page.setStartIndex(startIndex);
		page = bidService.queryBidAndBidCntrctByPage(strBID_AGENT_PRICE_ACT, strRECEIPT1_DATE, strRECEIPT1_VALUE_DATE,
				strCntrctNos, "'20','90'", "", strBidNoLow, strBidNoHigh, strCNTRCT_YEAR, strCNTRCT_NO, strBID_COMP_NO,
				strCNTRCT_NAME, "", strCNTRCT_ST_DATE, strCNTRCT_ED_DATE, page);
		listBid = (List<BidDto>) page.getItems();
		this.setStartIndex(page.getStartIndex());
	}

	public BidService getBidService() {
		return bidService;
	}

	public void setBidService(BidService bidService) {
		this.bidService = bidService;
	}

	public String getStrCNTRCT_YEAR() {
		return strCNTRCT_YEAR;
	}

	public void setStrCNTRCT_YEAR(String strCNTRCT_YEAR) {
		this.strCNTRCT_YEAR = strCNTRCT_YEAR;
	}

	public String getStrCNTRCT_ST_DATE() {
		return strCNTRCT_ST_DATE;
	}

	public void setStrCNTRCT_ST_DATE(String strCNTRCT_ST_DATE) {
		this.strCNTRCT_ST_DATE = strCNTRCT_ST_DATE;
	}

	public String getStrCNTRCT_ED_DATE() {
		return strCNTRCT_ED_DATE;
	}

	public void setStrCNTRCT_ED_DATE(String strCNTRCT_ED_DATE) {
		this.strCNTRCT_ED_DATE = strCNTRCT_ED_DATE;
	}

	public String getStrCNTRCT_NO() {
		return strCNTRCT_NO;
	}

	public void setStrCNTRCT_NO(String strCNTRCT_NO) {
		this.strCNTRCT_NO = strCNTRCT_NO;
	}

	public String getStrBID_COMP_NO() {
		return strBID_COMP_NO;
	}

	public void setStrBID_COMP_NO(String strBID_COMP_NO) {
		this.strBID_COMP_NO = strBID_COMP_NO;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public List<BidDto> getListBid() {
		return listBid;
	}

	public void setListBid(List<BidDto> listBid) {
		this.listBid = listBid;
	}

	public String getStrBID_COMP_NAME() {
		return strBID_COMP_NAME;
	}

	public void setStrBID_COMP_NAME(String strBID_COMP_NAME) {
		this.strBID_COMP_NAME = strBID_COMP_NAME;
	}

	public String getStrCntrctNos() {
		return strCntrctNos;
	}

	public void setStrCntrctNos(String strCntrctNos) {
		this.strCntrctNos = strCntrctNos;
	}

	public String getStrBidNoLow() {
		return strBidNoLow;
	}

	public void setStrBidNoLow(String strBidNoLow) {
		this.strBidNoLow = strBidNoLow;
	}

	public String getStrBidNoHigh() {
		return strBidNoHigh;
	}

	public void setStrBidNoHigh(String strBidNoHigh) {
		this.strBidNoHigh = strBidNoHigh;
	}

	public String getStrCNTRCT_NAME() {
		return strCNTRCT_NAME;
	}

	public void setStrCNTRCT_NAME(String strCNTRCT_NAME) {
		this.strCNTRCT_NAME = strCNTRCT_NAME;
	}

	public String getStrBID_AGENT_PRICE_ACT() {
		return strBID_AGENT_PRICE_ACT;
	}

	public void setStrBID_AGENT_PRICE_ACT(String strBID_AGENT_PRICE_ACT) {
		this.strBID_AGENT_PRICE_ACT = strBID_AGENT_PRICE_ACT;
	}

	public String getStrRECEIPT1_DATE() {
		return strRECEIPT1_DATE;
	}

	public void setStrRECEIPT1_DATE(String strRECEIPT1_DATE) {
		this.strRECEIPT1_DATE = strRECEIPT1_DATE;
	}

	public String getStrRECEIPT1_VALUE_DATE() {
		return strRECEIPT1_VALUE_DATE;
	}

	public void setStrRECEIPT1_VALUE_DATE(String strRECEIPT1_VALUE_DATE) {
		this.strRECEIPT1_VALUE_DATE = strRECEIPT1_VALUE_DATE;
	}

	public List<BidDto> getAgentCostBidList() {
		return agentCostBidList;
	}

	public void setAgentCostBidList(List<BidDto> agentCostBidList) {
		this.agentCostBidList = agentCostBidList;
	}

	public String getStrDiscount() {
		return strDiscount;
	}

	public void setStrDiscount(String strDiscount) {
		this.strDiscount = strDiscount;
	}

	public String getStrCommonReceiptDate() {
		return strCommonReceiptDate;
	}

	public void setStrCommonReceiptDate(String strCommonReceiptDate) {
		this.strCommonReceiptDate = strCommonReceiptDate;
	}

	public String getStrCommonReceiptValueDate() {
		return strCommonReceiptValueDate;
	}

	public void setStrCommonReceiptValueDate(String strCommonReceiptValueDate) {
		this.strCommonReceiptValueDate = strCommonReceiptValueDate;
	}
}
