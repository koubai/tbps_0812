package com.cn.tbps.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.cn.common.action.BaseAction;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.AjaxDataDto;
import com.cn.tbps.dto.BidCntrctDto;
import com.cn.tbps.dto.UserInfoDto;
import com.cn.tbps.service.BidCntrctService;
import com.cn.tbps.service.UserInfoService;
import com.opensymphony.xwork2.ActionContext;

import net.sf.json.JSONArray;

public class BidCntrctAction extends BaseAction {

	private static final long serialVersionUID = -7475126715789792874L;
	private static final Logger log = LogManager.getLogger(BidCntrctAction.class);
	
	private BidCntrctService bidCntrctService;
	
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
	private List<BidCntrctDto> listBidCntrct;
	
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
	private String strBID_COMP_NAME;
	
	private List<UserInfoDto> listUserInfo;
	
	//新增
	private BidCntrctDto addBidCntrctDto;
	//修改
	private String strUpdCNTRCT_NO;
	private BidCntrctDto updBidCntrctDto;
	
	//ajax查询数据列表
	private Integer ajaxTotalCount;
	private Integer ajaxPageIndex;
	
	/**
	 * Ajax翻页查询函数
	 * @return
	 * @throws IOException
	 */
	public String queryBidCntrctAjax() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		AjaxDataDto ajaxData = new AjaxDataDto();
		try {
			this.clearMessages();
			//ajax中文乱码处理
			//strCNTRCT_NO = URLDecoder.decode(strCNTRCT_NO, "UTF-8");
			//strBID_COMP_NO = URLDecoder.decode(strBID_COMP_NO, "UTF-8");
			Page pp = new Page(8);
			pp.setTotalCount(ajaxTotalCount);
			pp.setStartIndex(ajaxPageIndex);
			pp = bidCntrctService.queryBidCntrctByPage(strCNTRCT_YEAR, strCNTRCT_NO, strBID_COMP_NO, "",
					"", strCNTRCT_ST_DATE, strCNTRCT_ED_DATE, pp);
			ajaxData.setData(pp);
		} catch(Exception e) {
			ajaxData.setResultCode(-1);
			ajaxData.setResultMessage("查询数据异常：" + e.getMessage());
			return ERROR;
		}
		out = response.getWriter();
		String result = JSONArray.fromObject(ajaxData).toString();
		result = result.substring(1, result.length() - 1);
		log.info(result);
		out.write(result);
		out.flush();
		return null;
	}
	
	/**
	 * 显示修改页面
	 * @return
	 */
	public String showUpdBidCntrct() {
		try {
			this.clearMessages();
			listUserInfo = userInfoService.queryAllUser();
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
			listUserInfo = userInfoService.queryAllUser();
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
			listUserInfo = userInfoService.queryAllUser();
			addBidCntrctDto = new BidCntrctDto();
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
			listUserInfo = userInfoService.queryAllUser();
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
			strBID_COMP_NAME = "";
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

	public String getStrBID_COMP_NAME() {
		return strBID_COMP_NAME;
	}

	public void setStrBID_COMP_NAME(String strBID_COMP_NAME) {
		this.strBID_COMP_NAME = strBID_COMP_NAME;
	}

	public Integer getAjaxTotalCount() {
		return ajaxTotalCount;
	}

	public void setAjaxTotalCount(Integer ajaxTotalCount) {
		this.ajaxTotalCount = ajaxTotalCount;
	}

	public Integer getAjaxPageIndex() {
		return ajaxPageIndex;
	}

	public void setAjaxPageIndex(Integer ajaxPageIndex) {
		this.ajaxPageIndex = ajaxPageIndex;
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
}
