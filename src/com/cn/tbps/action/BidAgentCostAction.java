package com.cn.tbps.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.common.util.Page;
import com.cn.tbps.dto.BidDto;
import com.cn.tbps.service.BidService;

/**
 * 招标代理费设定
 * @author Frank
 * @version 1.0
 * @createtime 2018年8月30日 上午7:14:34
 */
public class BidAgentCostAction extends BaseAction {

	private static final long serialVersionUID = -8524399330846182774L;

	private static final Logger log = LogManager.getLogger(BidAction.class);
	
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
	
	/**
	 * 显示招标代理费设定页面
	 * @return
	 */
	public String showBidAgentCostAction() {
		try {
			this.clearMessages();
			listBid = new ArrayList<BidDto>();
			strCNTRCT_YEAR = "";
			strCNTRCT_ST_DATE = "";
			strCNTRCT_ED_DATE = "";
			strCNTRCT_NO = "";
			strBID_COMP_NO = "";
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
		if(page == null) {
			page = new Page();
		}
		//翻页查询所有招标
		this.page.setStartIndex(startIndex);
		page = bidService.queryBidAndBidCntrctByPage("", "", "", strCNTRCT_YEAR, strCNTRCT_NO, strBID_COMP_NO,
				"", "", strCNTRCT_ST_DATE, strCNTRCT_ED_DATE, page);
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
}
