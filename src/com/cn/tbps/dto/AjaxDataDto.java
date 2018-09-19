package com.cn.tbps.dto;

public class AjaxDataDto {

	/**
	 * 返回值，默认为0，0为成功，1查询失败，2为数据check异常，-1为系统异常，其他为异常。
	 */
	private int resultCode = 0;
	
	/**
	 * 返回信息
	 */
	private String resultMessage = "";
	
	private Object data;

	public int getResultCode() {
		return resultCode;
	}

	public void setResultCode(int resultCode) {
		this.resultCode = resultCode;
	}

	public String getResultMessage() {
		return resultMessage;
	}

	public void setResultMessage(String resultMessage) {
		this.resultMessage = resultMessage;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
