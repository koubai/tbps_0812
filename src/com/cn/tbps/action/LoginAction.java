package com.cn.tbps.action;

import java.util.Date;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.common.util.Constants;
import com.cn.common.util.DateUtil;
import com.cn.common.util.MD5Util;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.UserInfoDto;
import com.cn.tbps.service.UserInfoService;
import com.opensymphony.xwork2.ActionContext;

/**
 * 用户登录Action
 * @author Frank
 * @time 2013-9-24下午8:36:53
 * @version 1.0
 */
public class LoginAction extends BaseAction {

	private static final Logger log = LogManager.getLogger(LoginAction.class);
	
	private static final long serialVersionUID = -3307892137806702480L;
	
	private UserInfoService userInfoService;
	
	private UserInfoDto userLoginDto;
	
	/**
	 * 显示用户登录页
	 * @return
	 */
	public String showLoginAction() {
		try {
			this.clearMessages();
			String ip = this.getIP();
			log.info("ip=" + ip);
			userLoginDto = new UserInfoDto();
		} catch(Exception e) {
			log.error("showLoginAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 用户登录
	 * @return
	 */
	public String loginAction() {
		try {
			this.clearMessages();
			if(userLoginDto == null) {
				return ERROR;
			}
			if(StringUtil.isBlank(userLoginDto.getLOGIN_ID())) {
				this.addActionMessage("用户名不能为空！");
				return ERROR;
			}
			if(StringUtil.isBlank(userLoginDto.getLOGIN_PW())) {
				this.addActionMessage("登录密码不能为空！");
				return ERROR;
			}
			if(StringUtil.isBlank(userLoginDto.getVerificationcode())) {
				this.addActionMessage("验证码不能为空！");
				return ERROR;
			}
			String rand = (String) ActionContext.getContext().getSession().get(Constants.RANDOM);
			if(!userLoginDto.getVerificationcode().equals(rand)) {
				this.addActionMessage("验证码不正确！");
				return ERROR;
			}
			UserInfoDto userInfo = userInfoService.queryUserByID(userLoginDto.getLOGIN_ID());
			if(!MD5Util.md5(userLoginDto.getLOGIN_PW()).equals(userInfo.getLOGIN_PW())) {
				this.addActionMessage("登录密码不正确！");
				return ERROR;
			}
			ActionContext.getContext().getSession().put(Constants.USER_ID, userInfo.getLOGIN_ID());
			ActionContext.getContext().getSession().put(Constants.USER_NAME, userInfo.getLOGIN_NAME());
			ActionContext.getContext().getSession().put(Constants.USER_RANK, userInfo.getRANK());
			ActionContext.getContext().getSession().put(Constants.LOGIN_TIME, DateUtil.dateToLogintime(new Date()));
			ActionContext.getContext().getSession().put(Constants.SESSION_ISLOGIN, Constants.FLAG_IS_LOGIN);
			log.info(userInfo.getLOGIN_ID() + " login success.");
		} catch(Exception e) {
			log.error("loginAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示重置密码页
	 * @return
	 */
	public String showResetAction() {
		try {
			this.clearMessages();
			String ip = this.getIP();
			log.info("ip=" + ip);
			userLoginDto = new UserInfoDto();
		} catch(Exception e) {
			log.error("showResetAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 重置密码
	 * @return
	 */
	public String resetAction() {
		try {
			this.clearMessages();
			if(userLoginDto == null) {
				return ERROR;
			}
			if(StringUtil.isBlank(userLoginDto.getLOGIN_ID())) {
				this.addActionMessage("用户名不能为空！");
				return ERROR;
			}
			if(StringUtil.isBlank(userLoginDto.getLOGIN_PW_OLD())) {
				this.addActionMessage("旧密码不能为空！");
				return ERROR;
			}
			if(StringUtil.isBlank(userLoginDto.getLOGIN_PW())) {
				this.addActionMessage("新密码不能为空！");
				return ERROR;
			}
			if(StringUtil.isBlank(userLoginDto.getCONFIRM_PW())) {
				this.addActionMessage("确认密码不能为空！");
				return ERROR;
			}
			if(!userLoginDto.getCONFIRM_PW().equals(userLoginDto.getLOGIN_PW())) {
				this.addActionMessage("两次密码不一致！");
				return ERROR;
			}
			UserInfoDto userInfo = userInfoService.queryUserByID(userLoginDto.getLOGIN_ID());
			if(null == userInfo){
				this.addActionMessage("用户不存在！");
				return ERROR;
			}
			if(!MD5Util.md5(userLoginDto.getLOGIN_PW_OLD()).equals(userInfo.getLOGIN_PW())) {
				this.addActionMessage("旧密码不正确！");
				return ERROR;
			}
			userInfo.setLOGIN_PW(userLoginDto.getLOGIN_PW());
			userInfoService.updateUser(userInfo);
			this.addActionMessage("修改密码成功，请点击返回首页进入主页面！");
			ActionContext.getContext().getSession().put(Constants.USER_ID, userInfo.getLOGIN_ID());
			ActionContext.getContext().getSession().put(Constants.USER_NAME, userInfo.getLOGIN_NAME());
			ActionContext.getContext().getSession().put(Constants.USER_RANK, userInfo.getRANK());
			ActionContext.getContext().getSession().put(Constants.LOGIN_TIME, DateUtil.dateToLogintime(new Date()));
			ActionContext.getContext().getSession().put(Constants.SESSION_ISLOGIN, Constants.FLAG_IS_LOGIN);
			log.info(userInfo.getLOGIN_ID() + " login success.");
		} catch(Exception e) {
			log.error("resetAction error:" + e);
			this.addActionMessage("系统异常，请联系管理员！");
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 退出登录
	 * @return
	 */
	public String logout() {
		try {
			this.clearMessages();
			ActionContext.getContext().getSession().clear();
			userLoginDto = new UserInfoDto();
		} catch(Exception e) {
			log.error("logout error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public UserInfoDto getUserLoginDto() {
		return userLoginDto;
	}

	public void setUserLoginDto(UserInfoDto userLoginDto) {
		this.userLoginDto = userLoginDto;
	}
}
