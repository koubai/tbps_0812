package com.cn.tbps.action;

import java.io.ByteArrayInputStream;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.common.util.Constants;
import com.cn.common.util.RandomNumUtil;
import com.opensymphony.xwork2.ActionContext;

/**
 * 验证码Action
 * @author ChenGuangQuan
 * @version 1.0
 */
public class ValidateCodeAction extends BaseAction {

	private static final long serialVersionUID = -3878770196579795834L;
	private ByteArrayInputStream inputStream;
	private static final Logger log = LogManager.getLogger(ValidateCodeAction.class);

	public String execute() throws Exception {
		RandomNumUtil rdnu = RandomNumUtil.Instance();
		this.setInputStream(rdnu.getImage());// 取得带有随机字符串的图片
		log.info("rand=" + rdnu.getString());
		ActionContext.getContext().getSession().put(Constants.RANDOM, rdnu.getString());// 取得随机字符串放入HttpSession
		return "success";
	}

	public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}

	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}

}
