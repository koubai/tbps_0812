package com.cn.tbps.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.cn.common.action.BaseAction;
import com.cn.common.util.Constants;
import com.opensymphony.xwork2.ActionContext;

/**
 * @name HomeAction.java
 * @author Frank
 * @time 2013-10-14下午11:06:43
 * @version 1.0
 */
public class HomeAction extends BaseAction {

	private static final long serialVersionUID = 303939388808414480L;
	private String toggleMenuFlag;

	/**
	 * 回到首页Action
	 * @return
	 */
	public String goHomeAction() {
		try {
			this.clearMessages();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * ajax隐藏菜单
	 * @return
	 * @throws IOException 
	 */
	public String toggleMenuAction() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			this.clearMessages();
			if("1".equals(toggleMenuFlag)) {
				ActionContext.getContext().getSession().put(Constants.TOGGLE_MENU_FLAG, "1");
			} else {
				ActionContext.getContext().getSession().put(Constants.TOGGLE_MENU_FLAG, "0");
			}
		} catch(Exception e) {
		}
		out = response.getWriter();
		out.write("1");
		out.flush();
		return null;
	}

	public String getToggleMenuFlag() {
		return toggleMenuFlag;
	}

	public void setToggleMenuFlag(String toggleMenuFlag) {
		this.toggleMenuFlag = toggleMenuFlag;
	}
}
