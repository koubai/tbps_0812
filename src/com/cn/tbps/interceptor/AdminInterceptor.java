package com.cn.tbps.interceptor;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.util.Constants;
import com.cn.common.util.StringUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * @name AdminInterceptor.java
 * @author Frank
 * @time 2013-10-11下午10:36:15
 * @version 1.0
 */
public class AdminInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1165331167415902384L;
	private static final Logger log = LogManager.getLogger(AdminInterceptor.class);

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		//验证用户是否登录
		String islogin = (String) ActionContext.getContext().getSession().get(Constants.SESSION_ISLOGIN);
		if(StringUtil.isBlank(islogin)) {
			//未登录
			log.info("user is not login.");
			return "timeout";
		} else if(!Constants.FLAG_IS_LOGIN.equals(islogin)) {
			//session过期
			log.info("session is time out.");
			return "timeout";
		} else {
			//判断是否是超级用户
			String rank = (String) ActionContext.getContext().getSession().get(Constants.USER_RANK);
			if(!Constants.USER_RANK_ADMIN.equals(rank)) {
				log.info("user is not admin.");
				return "noauthority";
			}
		}
		return arg0.invoke();
	}
}
