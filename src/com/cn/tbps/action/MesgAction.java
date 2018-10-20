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
import com.cn.tbps.dto.AjaxDataDto;
import com.cn.tbps.dto.MesgDto;
import com.cn.tbps.dto.UserInfoDto;
import com.cn.tbps.service.MesgService;
import com.cn.tbps.service.UserInfoService;
import com.opensymphony.xwork2.ActionContext;

import net.sf.json.JSONArray;

public class MesgAction extends BaseAction {

	private static final long serialVersionUID = 9171505764448526159L;
	private static final Logger log = LogManager.getLogger(MesgAction.class);
	
	private MesgService mesgService;
	private UserInfoService userInfoService;
	
	/**
	 * 页码
	 */
	private int startIndex;
	
	/**
	 * 翻页
	 */
	private Page page;
	
	private List<MesgDto> mesgList;
	
	//消息标题
	private String strMesgTitle;
	//消息类型
	private String strMesgType;
	
	private List<UserInfoDto> userInfoList;
	
	//新增
	private MesgDto addMesgDto;
	
	//修改
	private String strUpdMesgId;
	private MesgDto updMesgDto;
	
	//删除
	private String delMesgId;
	
	private String showMesgId;
	
	/**
	 * Ajax查询消息函数
	 * @return
	 * @throws IOException
	 */
	public String queryMesgAjax() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		AjaxDataDto ajaxData = new AjaxDataDto();
		try {
			this.clearMessages();
			MesgDto msg = mesgService.queryMesgByID(showMesgId);
			if(msg != null) {
				//判断是否是未读邮件
				if("10".equals(msg.getRECEIVE_STATUS())) {
					//判断是否是收件人
					String userid = (String) ActionContext.getContext().getSession().get(Constants.USER_ID);
					if(userid.equals(msg.getRECEIVE_USER())) {
						//更新收件状态=20已读
						msg.setRECEIVE_STATUS("20");
						msg.setUPDATE_USER(userid);
						mesgService.updateMesg(msg);
						//已读标识
						msg.setIsRECEIVE("1");
					}
				}
				
				ajaxData.setResultCode(0);
				ajaxData.setData(msg);
			} else {
				ajaxData.setResultCode(1001);
				ajaxData.setResultMessage("不存在该消息记录！");
			}
		} catch(Exception e) {
			ajaxData.setResultCode(-1);
			ajaxData.setResultMessage("查询数据异常：" + e.getMessage());
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
	 * 删除
	 * @return
	 */
	public String delMesgAction() {
		try {
			this.clearMessages();
			MesgDto msg = mesgService.queryMesgByID(delMesgId);
			if(msg != null) {
				String userid = (String) ActionContext.getContext().getSession().get(Constants.USER_ID);
				//判断是否是收件人
				if(msg.getRECEIVE_USER().equals(userid)) {
					//收件人删除
					msg.setRECEIVE_STATUS("30");
				}
				//判断是否是发件人
				if(msg.getSEND_USER().equals(userid)) {
					//发件人删除
					msg.setSEND_STATUS("30");
				}
				msg.setUPDATE_USER(userid);
				mesgService.updateMesg(msg);
			}
			this.addActionMessage("删除成功！");
			//刷新列表
			queryMesg();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示修改页面
	 * @return
	 */
	public String showUpdMesgAction() {
		try {
			this.clearMessages();
			userInfoList = userInfoService.queryAllUser();
			updMesgDto = mesgService.queryMesgByID(strUpdMesgId);
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 修改
	 * @return
	 */
	public String updMesgAction() {
		try {
			this.clearMessages();
			userInfoList = userInfoService.queryAllUser();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示新增页面
	 * @return
	 */
	public String showAddMesgAction() {
		try {
			this.clearMessages();
			userInfoList = userInfoService.queryAllUser();
			addMesgDto = new MesgDto();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 新增
	 * @return
	 */
	public String addMesgAction() {
		try {
			this.clearMessages();
			userInfoList = userInfoService.queryAllUser();
			//发件人
			String userid = (String) ActionContext.getContext().getSession().get(Constants.USER_ID);
			mesgService.insertMesgBatch(addMesgDto, userid, "");
			addMesgDto = new MesgDto();
			this.addActionMessage("发送成功！");
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 显示消息管理页面
	 * @return
	 */
	public String showMesgAction() {
		try {
			this.clearMessages();
			strMesgTitle = "";
			strMesgType = "";
			addMesgDto = new MesgDto();
			strUpdMesgId = "";
			delMesgId = "";
			mesgList = new ArrayList<MesgDto>();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询列表
	 * @return
	 */
	public String queryMesgList() {
		try {
			this.clearMessages();
			page = new Page();
			startIndex = 0;
			queryMesg();
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
	public String turnMesgPage() {
		try {
			this.clearMessages();
			queryMesg();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	private void queryMesg() {
		delMesgId = "";
		mesgList = new ArrayList<MesgDto>();
		if(page == null) {
			page = new Page();
		}
		//翻页查询所有专家信息
		this.page.setStartIndex(startIndex);
		
		String userid = (String) ActionContext.getContext().getSession().get(Constants.USER_ID);
		String sendUser = "";
		String receiveUser = "";
		String sendStatus = "";
		String receiveStatus = "";
		if("10".equals(strMesgType)) {
			//接收
			sendUser = userid;
			sendStatus = "'10','20'";
		} else {
			//接收
			receiveUser = userid;
			receiveStatus = "'10','20'";
		}
		
		page = mesgService.queryMesgByPage(strMesgTitle, strMesgType, sendUser, receiveUser, sendStatus, receiveStatus, page);
		mesgList = (List<MesgDto>) page.getItems();
		this.setStartIndex(page.getStartIndex());
	}

	public MesgService getMesgService() {
		return mesgService;
	}

	public void setMesgService(MesgService mesgService) {
		this.mesgService = mesgService;
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

	public List<MesgDto> getMesgList() {
		return mesgList;
	}

	public void setMesgList(List<MesgDto> mesgList) {
		this.mesgList = mesgList;
	}

	public MesgDto getAddMesgDto() {
		return addMesgDto;
	}

	public void setAddMesgDto(MesgDto addMesgDto) {
		this.addMesgDto = addMesgDto;
	}

	public String getStrUpdMesgId() {
		return strUpdMesgId;
	}

	public void setStrUpdMesgId(String strUpdMesgId) {
		this.strUpdMesgId = strUpdMesgId;
	}

	public MesgDto getUpdMesgDto() {
		return updMesgDto;
	}

	public void setUpdMesgDto(MesgDto updMesgDto) {
		this.updMesgDto = updMesgDto;
	}

	public String getStrMesgTitle() {
		return strMesgTitle;
	}

	public void setStrMesgTitle(String strMesgTitle) {
		this.strMesgTitle = strMesgTitle;
	}

	public String getStrMesgType() {
		return strMesgType;
	}

	public void setStrMesgType(String strMesgType) {
		this.strMesgType = strMesgType;
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public List<UserInfoDto> getUserInfoList() {
		return userInfoList;
	}

	public void setUserInfoList(List<UserInfoDto> userInfoList) {
		this.userInfoList = userInfoList;
	}

	public String getShowMesgId() {
		return showMesgId;
	}

	public void setShowMesgId(String showMesgId) {
		this.showMesgId = showMesgId;
	}

	public String getDelMesgId() {
		return delMesgId;
	}

	public void setDelMesgId(String delMesgId) {
		this.delMesgId = delMesgId;
	}
	
	public static void main(String[] args) {
		String rank = "C";
		String rankB = "B";
		System.out.println(rank.compareTo(rankB));
	}
}
