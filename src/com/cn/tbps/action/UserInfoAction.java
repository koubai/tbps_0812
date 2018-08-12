package com.cn.tbps.action;

import java.util.ArrayList;
import java.util.List;

import com.cn.common.action.BaseAction;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.UserInfoDto;
import com.cn.tbps.service.UserInfoService;
import com.opensymphony.xwork2.ActionContext;

/**
 * @name UserInfoAction.java
 * @author Frank
 * @time 2013-11-18上午12:04:13
 * @version 1.0
 */
public class UserInfoAction extends BaseAction {

	private static final long serialVersionUID = -8878417382767578324L;
	
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
	 * 用户信息列表
	 */
	private List<UserInfoDto> listUserInfo;
	
	private String strLoginName;
	
	private UserInfoDto addUserInfoDto;
	
	private String updLoginId;
	
	private UserInfoDto updUserInfoDto;
	
	private String delLoginId;
	
	/**
	 * 删除用户
	 * @return
	 */
	public String delUserInfoAction() {
		try {
			this.clearMessages();
			if(StringUtil.isBlank(delLoginId)) {
				this.addActionMessage("用户登录ID不能为空！");
				return "checkerror";
			}
			//删除用户
			userInfoService.deleteUser(delLoginId);
			this.addActionMessage("删除用户成功！");
			//刷新页面
			startIndex = 0;
			queryUserInfo();
			delLoginId = "";
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示修改用户
	 * @return
	 */
	public String showUpdUserInfoAction() {
		try {
			this.clearMessages();
			//查询用户信息
			updUserInfoDto = userInfoService.queryUserByID(updLoginId);
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 修改用户
	 * @return
	 */
	public String updUserInfoAction() {
		try {
			this.clearMessages();
			//数据校验
			if(!checkData(updUserInfoDto)) {
				return "checkerror";
			}
			//修改
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			updUserInfoDto.setUPDATE_USER(username);
			userInfoService.updateUser(updUserInfoDto);
			this.addActionMessage("修改用户成功！");
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示添加用户
	 * @return
	 */
	public String showAddUserInfoAction() {
		try {
			this.clearMessages();
			addUserInfoDto = new UserInfoDto();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 添加用户
	 * @return
	 */
	public String addUserInfoAction() {
		try {
			this.clearMessages();
			//数据校验
			if(!checkData(addUserInfoDto)) {
				return "checkerror";
			}
			//验证ID是否存在
			UserInfoDto userinfo = userInfoService.queryUserByID(addUserInfoDto.getLOGIN_ID());
			if(userinfo != null) {
				this.addActionMessage("登录ID已存在！");
				return "checkerror";
			}
			//添加用户
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			addUserInfoDto.setUPDATE_USER(username);
			
			userInfoService.insertUser(addUserInfoDto);
			this.addActionMessage("添加用户成功！");
			addUserInfoDto = new UserInfoDto();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 用户信息管理页面
	 * @return
	 */
	public String showUserInfoAction() {
		try {
			this.clearMessages();
			page = new Page();
			startIndex = 0;
			strLoginName = "";
			updLoginId = "";
			delLoginId = "";
			addUserInfoDto = new UserInfoDto();
			updUserInfoDto = new UserInfoDto();
			listUserInfo = new ArrayList<UserInfoDto>();
			queryUserInfo();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询用户信息
	 * @return
	 */
	public String queryUserInfoAction() {
		try {
			this.clearMessages();
			startIndex = 0;
			queryUserInfo();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 翻页用户信息
	 * @return
	 */
	public String turnUserInfoAction() {
		try {
			this.clearMessages();
			queryUserInfo();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 验证数据格式
	 * @param userinfo
	 * @return
	 */
	private boolean checkData(UserInfoDto userinfo) {
		if(userinfo == null) {
			this.addActionMessage("登录ID不能为空！");
			return false;
		}
		if(StringUtil.isBlank(userinfo.getLOGIN_ID())) {
			this.addActionMessage("登录ID不能为空！");
			return false;
		}
		if(StringUtil.isBlank(userinfo.getLOGIN_NAME())) {
			this.addActionMessage("登录姓名不能为空！");
			return false;
		}
		if(StringUtil.isBlank(userinfo.getLOGIN_PW())) {
			this.addActionMessage("登录密码不能为空！");
			return false;
		}
		if(StringUtil.isBlank(userinfo.getCONFIRM_PW())) {
			this.addActionMessage("确认密码不能为空！");
			return false;
		}
		if(!userinfo.getCONFIRM_PW().equals(userinfo.getLOGIN_PW())) {
			this.addActionMessage("两次密码不一致！");
			return false;
		}
		if(StringUtil.isBlank(userinfo.getRANK())) {
			this.addActionMessage("用户类型不能为空！");
			return false;
		}
		if(userinfo.getMEMO1() != null && userinfo.getMEMO1().length() > 40) {
			this.addActionMessage("备注不能超过40个字！");
			return false;
		}
		return true;
	}
	
	/**
	 * 查询用户信息
	 */
	@SuppressWarnings("unchecked")
	private void queryUserInfo() {
		listUserInfo = new ArrayList<UserInfoDto>();
		if(page == null) {
			page = new Page();
		}
		//翻页查询所有委托公司
		this.page.setStartIndex(startIndex);
		page = userInfoService.queryUserByPage(page, strLoginName);
		listUserInfo = (List<UserInfoDto>) page.getItems();
		this.setStartIndex(page.getStartIndex());
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
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

	public List<UserInfoDto> getListUserInfo() {
		return listUserInfo;
	}

	public void setListUserInfo(List<UserInfoDto> listUserInfo) {
		this.listUserInfo = listUserInfo;
	}

	public String getStrLoginName() {
		return strLoginName;
	}

	public void setStrLoginName(String strLoginName) {
		this.strLoginName = strLoginName;
	}

	public UserInfoDto getAddUserInfoDto() {
		return addUserInfoDto;
	}

	public void setAddUserInfoDto(UserInfoDto addUserInfoDto) {
		this.addUserInfoDto = addUserInfoDto;
	}

	public String getUpdLoginId() {
		return updLoginId;
	}

	public void setUpdLoginId(String updLoginId) {
		this.updLoginId = updLoginId;
	}

	public UserInfoDto getUpdUserInfoDto() {
		return updUserInfoDto;
	}

	public void setUpdUserInfoDto(UserInfoDto updUserInfoDto) {
		this.updUserInfoDto = updUserInfoDto;
	}

	public String getDelLoginId() {
		return delLoginId;
	}

	public void setDelLoginId(String delLoginId) {
		this.delLoginId = delLoginId;
	}
}
