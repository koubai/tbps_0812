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
import com.cn.tbps.dto.UserInfoDto;
import com.cn.tbps.service.BidService;
import com.cn.tbps.service.UserInfoService;
import com.opensymphony.xwork2.ActionContext;

/**
 * 专家费设定
 * @version 1.0
 * @createtime 2018年9月21日 下午4:15:16
 */
public class BidExpertCostAction extends BaseAction {

	private static final long serialVersionUID = 2614134238899107450L;

	private static final Logger log = LogManager.getLogger(BidExpertCostAction.class);
	
	private BidService bidService;
	
	private UserInfoService userInfoService;
	
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
	
	private List<BidDto> expertCostBidList;
	
	//多个合同编号
	private String strCntrctNos;
	
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
	
	private List<UserInfoDto> listUserInfo;
	
	/**
	 * 保存专家费设定
	 * @return
	 */
	public String saveBidExpertCostAction() {
		try {
			this.clearMessages();
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			//保存专家费
			bidService.saveBidExpertCost(expertCostBidList, username);
			//刷新页面
			queryData();
		} catch(Exception e) {
			log.error("saveBidExpertCost:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示招标代理费设定页面（从招标列表进来）
	 * @return
	 */
	public String showBidExpertCostByCntrctAction() {
		try {
			this.clearMessages();
			listBid = new ArrayList<BidDto>();
			expertCostBidList = new ArrayList<BidDto>();
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
			log.error("showBidExpertCostByCntrctAction:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示招标代理费设定页面
	 * @return
	 */
	public String showBidExpertCostAction() {
		try {
			this.clearMessages();
			listBid = new ArrayList<BidDto>();
			expertCostBidList = new ArrayList<BidDto>();
			strCNTRCT_YEAR = "";
			strCNTRCT_ST_DATE = "";
			strCNTRCT_ED_DATE = "";
			strCNTRCT_NO = "";
			strBID_COMP_NO = "";
			strBID_COMP_NAME = "";
			strCntrctNos = "";
			page = new Page();
			startIndex = 0;
		} catch(Exception e) {
			log.error("showBidExpertCostAction:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询招标列表
	 * @return
	 */
	public String queryBidExpertCostList() {
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
	public String turnBidExpertCostPage() {
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
		listUserInfo = userInfoService.queryAllUser();
		expertCostBidList = new ArrayList<BidDto>();
		listBid = new ArrayList<BidDto>();
		if(page == null) {
			page = new Page();
		}
		//翻页查询所有招标
		this.page.setStartIndex(startIndex);
		page = bidService.queryBidAndBidCntrctByPage("", "", "",
				strCntrctNos, "'20','90'", "", "", "", strCNTRCT_YEAR, strCNTRCT_NO, strBID_COMP_NO,
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

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public List<UserInfoDto> getListUserInfo() {
		return listUserInfo;
	}

	public void setListUserInfo(List<UserInfoDto> listUserInfo) {
		this.listUserInfo = listUserInfo;
	}

	public List<BidDto> getExpertCostBidList() {
		return expertCostBidList;
	}

	public void setExpertCostBidList(List<BidDto> expertCostBidList) {
		this.expertCostBidList = expertCostBidList;
	}
}
