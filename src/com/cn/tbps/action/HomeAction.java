package com.cn.tbps.action;

import com.cn.common.action.BaseAction;

/**
 * @name HomeAction.java
 * @author Frank
 * @time 2013-10-14下午11:06:43
 * @version 1.0
 */
public class HomeAction extends BaseAction {

	private static final long serialVersionUID = 303939388808414480L;

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
}
