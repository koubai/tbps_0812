package com.cn.tbps.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.BidCntrctDto;
import com.cn.tbps.service.BidCntrctService;
import com.opensymphony.xwork2.ActionContext;

public class BidCntrctAction extends BaseAction {

	private static final long serialVersionUID = -7475126715789792874L;
	private static final Logger log = LogManager.getLogger(BidCntrctAction.class);
	
	private BidCntrctService bidCntrctService;
	
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
	private List<BidCntrctDto> listBidCntrct;
	
	//选择招标合同页面
	//页码
	private int startIndex_select;
	//翻页
	private Page page_select;
	private List<BidCntrctDto> listSelectBidCntrct;
	
	//查询条件
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
	
	//新增
	private BidCntrctDto addBidCntrctDto;
	//修改
	private String strUpdCNTRCT_NO;
	private BidCntrctDto updBidCntrctDto;
	
	/**
	 * 选择页面
	 * @return
	 */
	public String showSelectBidCntrctPage() {
		try {
			this.clearMessages();
			strCNTRCT_YEAR = "";
			strCNTRCT_ST_DATE = "";
			strCNTRCT_ED_DATE = "";
			strCNTRCT_NO = "";
			strBID_COMP_NO = "";
			page_select = new Page();
			startIndex_select = 0;
			queryData_select();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 选择招标（查询）
	 * @return
	 */
	public String querySelectBidCntrctList() {
		try {
			this.clearMessages();
			page_select = new Page();
			startIndex_select = 0;
			queryData_select();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 选择招标（翻页）
	 * @return
	 */
	public String turnSelectBidCntrctPage() {
		try {
			this.clearMessages();
			queryData_select();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示修改页面
	 * @return
	 */
	public String showUpdBidCntrct() {
		try {
			this.clearMessages();
			updBidCntrctDto = bidCntrctService.queryBidCntrctByID(strUpdCNTRCT_NO);
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 修改
	 * @return
	 */
	public String updBidCntrct() {
		try {
			this.clearMessages();
			//数据校验
			if(!checkData(updBidCntrctDto)) {
				return "checkerror";
			}
			bidCntrctService.updateBidCntrct(updBidCntrctDto);
			this.addActionMessage("数据更新成功！");
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示新增招标合同页面
	 * @return
	 */
	public String showAddBidCntrct() {
		try {
			this.clearMessages();
			addBidCntrctDto = new BidCntrctDto();
			//页面调试数据
//			addBidCntrctDto.setBID_COMP_NO("1");
//			addBidCntrctDto.setBID_COMP_NAME("上海招标公司");
//			addBidCntrctDto.setCO_MANAGER1("王经理");
//			addBidCntrctDto.setCO_MANAGER_TEL1("13312121123");
//			addBidCntrctDto.setCO_ADDRESS1("宝山区");
//			addBidCntrctDto.setCO_MANAGER_EMAIL1("wang@tbps.com");
//			addBidCntrctDto.setCO_TAX("200012");
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 新增招标合同
	 * @return
	 */
	public String addBidCntrct() {
		try {
			this.clearMessages();
			//数据校验
			if(!checkData(addBidCntrctDto)) {
				return "checkerror";
			}
			//合同编号唯一
			BidCntrctDto bidCntrct = bidCntrctService.queryBidCntrctByID(addBidCntrctDto.getCNTRCT_NO());
			if(bidCntrct != null) {
				this.addActionMessage("合同编号已存在！");
				return "checkerror";
			}
			
			//保存数据
			addBidCntrctDto.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			addBidCntrctDto.setUPDATE_USER(username);
			
			bidCntrctService.insertBidCntrct(addBidCntrctDto);
			addBidCntrctDto = new BidCntrctDto();
			this.addActionMessage("添加数据成功！");
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 招标合同管理页面
	 * @return
	 */
	public String showBidCntrctPage() {
		try {
			this.clearMessages();
			listBidCntrct = new ArrayList<BidCntrctDto>();
			strUpdCNTRCT_NO = "";
			strCNTRCT_YEAR = "";
			strCNTRCT_ST_DATE = "";
			strCNTRCT_ED_DATE = "";
			strCNTRCT_NO = "";
			strBID_COMP_NO = "";
			page = new Page();
			startIndex = 0;
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询招标列表
	 * @return
	 */
	public String queryBidCntrctList() {
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
	public String turnBidCntrctPage() {
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
	 * 验证数据
	 * @param bidCntrct
	 * @return
	 */
	private boolean checkData(BidCntrctDto bidCntrct) {
		if(bidCntrct == null) {
			this.addActionMessage("合同编号不能为空！");
			return false;
		}
		if(StringUtil.isBlank(bidCntrct.getCNTRCT_NO())) {
			this.addActionMessage("合同编号不能为空！");
			return false;
		}
		if(StringUtil.isBlank(bidCntrct.getCNTRCT_YEAR())) {
			this.addActionMessage("合同年份不能为空！");
			return false;
		}
		if(bidCntrct.getCNTRCT_ST_DATE() == null) {
			this.addActionMessage("合同开始日期不能为空！");
			return false;
		}
		if(bidCntrct.getCNTRCT_ED_DATE() == null) {
			this.addActionMessage("合同结束日期不能为空！");
			return false;
		}
		if(StringUtil.isBlank(bidCntrct.getCNTRCT_TYPE())) {
			this.addActionMessage("请选择合同类别！");
			return false;
		}
		if(StringUtil.isBlank(bidCntrct.getBID_COMP_NO())) {
			this.addActionMessage("请选择委托公司！");
			return false;
		}
		return true;
	}
	
	@SuppressWarnings("unchecked")
	private void queryData() {
		listBidCntrct = new ArrayList<BidCntrctDto>();
		if(page == null) {
			page = new Page();
		}
		//翻页查询所有招标
		this.page.setStartIndex(startIndex);
		page = bidCntrctService.queryBidCntrctByPage(strCNTRCT_YEAR, strCNTRCT_NO, strBID_COMP_NO, "",
				"", strCNTRCT_ST_DATE, strCNTRCT_ED_DATE, page);
		listBidCntrct = (List<BidCntrctDto>) page.getItems();
		this.setStartIndex(page.getStartIndex());
	}
	
	@SuppressWarnings("unchecked")
	private void queryData_select() {
		listSelectBidCntrct = new ArrayList<BidCntrctDto>();
		if(page_select == null) {
			page_select = new Page();
		}
		//翻页查询所有招标
		this.page_select.setStartIndex(startIndex_select);
		page_select = bidCntrctService.queryBidCntrctByPage(strCNTRCT_YEAR, strCNTRCT_NO, strBID_COMP_NO, "",
				"", strCNTRCT_ST_DATE, strCNTRCT_ED_DATE, page_select);
		listSelectBidCntrct = (List<BidCntrctDto>) page_select.getItems();
		this.setStartIndex(page_select.getStartIndex());
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

	public List<BidCntrctDto> getListBidCntrct() {
		return listBidCntrct;
	}

	public void setListBidCntrct(List<BidCntrctDto> listBidCntrct) {
		this.listBidCntrct = listBidCntrct;
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

	public BidCntrctService getBidCntrctService() {
		return bidCntrctService;
	}

	public void setBidCntrctService(BidCntrctService bidCntrctService) {
		this.bidCntrctService = bidCntrctService;
	}

	public BidCntrctDto getAddBidCntrctDto() {
		return addBidCntrctDto;
	}

	public void setAddBidCntrctDto(BidCntrctDto addBidCntrctDto) {
		this.addBidCntrctDto = addBidCntrctDto;
	}

	public String getStrUpdCNTRCT_NO() {
		return strUpdCNTRCT_NO;
	}

	public void setStrUpdCNTRCT_NO(String strUpdCNTRCT_NO) {
		this.strUpdCNTRCT_NO = strUpdCNTRCT_NO;
	}

	public BidCntrctDto getUpdBidCntrctDto() {
		return updBidCntrctDto;
	}

	public void setUpdBidCntrctDto(BidCntrctDto updBidCntrctDto) {
		this.updBidCntrctDto = updBidCntrctDto;
	}

	public int getStartIndex_select() {
		return startIndex_select;
	}

	public void setStartIndex_select(int startIndex_select) {
		this.startIndex_select = startIndex_select;
	}

	public Page getPage_select() {
		return page_select;
	}

	public void setPage_select(Page page_select) {
		this.page_select = page_select;
	}

	public List<BidCntrctDto> getListSelectBidCntrct() {
		return listSelectBidCntrct;
	}

	public void setListSelectBidCntrct(List<BidCntrctDto> listSelectBidCntrct) {
		this.listSelectBidCntrct = listSelectBidCntrct;
	}
}
