package com.cn.tbps.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
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
import com.cn.tbps.dto.AgentCompDto;
import com.cn.tbps.dto.AjaxDataDto;
import com.cn.tbps.dto.AuditCntrctDto;
import com.cn.tbps.dto.AuditCntrctHisDto;
import com.cn.tbps.dto.AuditCompDto;
import com.cn.tbps.dto.UserInfoDto;
import com.cn.tbps.service.AuditCntrctService;
import com.cn.tbps.service.UserInfoService;
import com.opensymphony.xwork2.ActionContext;

import net.sf.json.JSONArray;

public class AuditCntrctAction extends BaseAction {

	private static final long serialVersionUID = 4471825910742160813L;
	
	private static final Logger log = LogManager.getLogger(AuditCntrctAction.class);
	
	private AuditCntrctService auditCntrctService;

	private UserInfoService userInfoService;
	
	private List<UserInfoDto> listUserInfo;

	/**
	 * 页码
	 */
	private int startIndex;
	
	/**
	 * 翻页
	 */
	private Page page;
	
	/**
	 * 委托公司列表
	 */
	private List<AuditCompDto> auditCompList;
	
	/**
	 * 审价列表
	 */
	private List<AuditCntrctDto> listAuditCntrct;
	
	//查询条件
	/**
	 * 合同归属
	 */
	private String strCntrctBelong;
	
	/**
	 * 合同编号
	 */
	private String strCntrctNO;
	
	/**
	 * 合同性质
	 */
	private String strCntrctType;
	
	/**
	 * 合同名称
	 */
	private String strCntrctName;
	
	/**
	 * 合同开始时间
	 */
	private String strCntrctStDate;

	/**
	 * 合同开始时间
	 */
	private String strCntrctEdDate;
	
	//删除
	/**
	 *  删除审价编号
	 */
	private String delAuditCntrctNo;
	
	//新增
	/**
	 * 新增审价Dto
	 */
	private AuditCntrctDto addAuditCntrctDto;
	
	//更新
	/**
	 * 更新审价编号
	 */
	private String updAuditCntrctNo;
	
	/**
	 * 更新审价Dto
	 */
	private AuditCntrctDto updAuditCntrctDto;
	
	/**
	 * 更新审价Dto（OLD提示修改内容用）
	 */
	private AuditCntrctDto updAuditCntrctDtoOld;
	
	//审价明细
	/**
	 * 审价编号（显示明细）
	 */
	private String detailAuditCntrctNo;
	
	/**
	 * 审价明细
	 */
	private AuditCntrctDto auditCntrctDtoDetail;
	
	//审价履历
	/**
	 * 审价履历查询条件-审价编号
	 */
	private String strAuditCntrctNoHist;
	
	/**
	 * 审价履历列表
	 */
	private List<AuditCntrctHisDto> listAuditCntrctHist;
	
	/**
	 * 审价履历SEQ
	 */
	private String detailAuditCntrctHisSeq;
	
	/**
	 * 审价履历明细
	 */
	private AuditCntrctHisDto auditCntrctHistDtoDetail;

	private List<AgentCompDto> agentCompList;
	
	private String agentAddFlag;
	

	//合同选择
	/**
	 * 合同开始时间
	 */
	private String cntrctStDate;

	/**
	 * 合同结束时间
	 */
	private String cntrctEdDate;

	/**
	 * 合同简称
	 */
	private String cntrctNm;
	
	private AuditCntrctDto auditCntrctDto;
	
	//ajax查询数据列表
	private Integer ajaxTotalCount;
	private Integer ajaxPageIndex;
	
	/**
	 * Ajax翻页查询函数
	 * @return
	 * @throws IOException
	 */
	public String queryAuditCntrAjax() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		AjaxDataDto ajaxData = new AjaxDataDto();
		try {
			this.clearMessages();
			Page pp = new Page(8);
			pp.setTotalCount(ajaxTotalCount);
			pp.setStartIndex(ajaxPageIndex);
			pp = auditCntrctService.queryAuditCntrctByPage("", "", "", "", cntrctStDate, cntrctEdDate, cntrctNm, pp);
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
	 * 显示审计明细
	 * @return
	 */
	public String showAuditCntrctDetail() {
		try {
			this.clearMessages();
			auditCntrctDtoDetail = auditCntrctService.queryAuditCntrctByID(detailAuditCntrctNo);
		} catch(Exception e) {
			log.error("showAuditCntrctDetail error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示审计更新页面
	 * @return
	 */
	public String showUpdAuditCntrctAction() {
		try {
			this.clearMessages();
			updAuditCntrctDto = auditCntrctService.queryAuditCntrctByID(updAuditCntrctNo);
			if(updAuditCntrctDto == null) {
				this.addActionMessage("该数据不存在！");
				return "checkerror";
			}
			//auditCntrctDto = auditCntrctService.queryAuditCntrctByID(updAuditCntrctNo);
			updAuditCntrctDtoOld = auditCntrctService.queryAuditCntrctByID(updAuditCntrctNo);
		} catch(Exception e) {
			this.addActionMessage("系统错误，查询审价异常！");
			log.error("showUpdAuditCntrctAction error:" + e);
			return "checkerror";
		}
		return SUCCESS;
	}
	
	/**
	 * 更新审计
	 * @return
	 */
	public String updAuditCntrctAction() {
		try {
			this.clearMessages();
			//数据校验
			if(!checkData(updAuditCntrctDto)) {
				return "checkerror";
			}
			//更新审价
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			updAuditCntrctDto.setUPDATE_USER(username);
			auditCntrctService.updateAuditCntrct(updAuditCntrctDto);
			updAuditCntrctDtoOld = auditCntrctService.queryAuditCntrctByID(updAuditCntrctNo);
			this.addActionMessage("修改审价成功！");
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示添加审计页面
	 * @return
	 */
	public String showAddAuditCntrctAction() {
		try {
			this.clearMessages();
			addAuditCntrctDto = new AuditCntrctDto();
			listUserInfo = userInfoService.queryAllUser();
			UserInfoDto userinfo = new UserInfoDto();
			userinfo.setLOGIN_NAME("");
			listUserInfo.add(userinfo);
			System.out.println("listUserInfo" + listUserInfo.size());
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 添加审计
	 * @return
	 */
	public String addAuditCntrctAction() {
		try {
			this.clearMessages();
			//数据校验
			if(!checkData(addAuditCntrctDto)) {
				return "checkerror";
			}
			//新增审价
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			
			addAuditCntrctDto.setUPDATE_USER(username);
			String auditCntrctNo = addAuditCntrctDto.getCNTRCT_NO();
			auditCntrctService.insertAuditCntrct(addAuditCntrctDto);
			addAuditCntrctDto = new AuditCntrctDto();
			//this.addActionMessage("添加审价成功！审价编号为：" + auditCntrctNo);
			log.info("添加审价成功！审价编号为：" + auditCntrctNo);
			//刷新页面
			startIndex = 0;
			queryAuditCntrct();
		} catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 删除审计
	 * @return
	 */
	public String delAuditCntrctAction() {
		try {
			this.clearMessages();
			if(StringUtil.isBlank(delAuditCntrctNo)) {
				this.addActionMessage("合同编号为空！");
				return "checkerror";
			}
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			//删除
			auditCntrctService.deleteAuditCntrct(delAuditCntrctNo, username);
			this.addActionMessage("删除审价成功！");
			delAuditCntrctNo = "";
			//刷新页面
			startIndex = 0;
			queryAuditCntrct();
		} catch(Exception e) {
			log.error("delAuditCntrctAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 显示审计管理页面
	 * @return
	 */
	public String showAuditCntrctAction() {
		try {
			this.clearMessages();
			strCntrctBelong = "";
			strCntrctNO = "";
			strCntrctType = "";
			strCntrctName = "";
			strCntrctStDate = "";
			strCntrctEdDate = "";
			listAuditCntrct = new ArrayList<AuditCntrctDto>();
			
			delAuditCntrctNo = "";
			addAuditCntrctDto = new AuditCntrctDto();
			updAuditCntrctNo = "";
			updAuditCntrctDto = new AuditCntrctDto();
			updAuditCntrctDtoOld = new AuditCntrctDto();
			
			page = new Page();
			startIndex = 0;
			
			listUserInfo = userInfoService.queryAllUser();
			UserInfoDto userinfo = new UserInfoDto();
			userinfo.setLOGIN_NAME("");
			listUserInfo.add(userinfo);
			System.out.println("listUserInfo" + listUserInfo.size());
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询审计列表
	 * @return
	 */
	public String queryAuditCntrctList() {
		try {
			this.clearMessages();
			page = new Page();
			startIndex = 0;
			queryAuditCntrct();
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
	public String turnAuditCntrctPage() {
		try {
			this.clearMessages();
			queryAuditCntrct();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 显示审计管理页面B
	 * @return
	 */
	public String showAuditCntrctBAction() {
		try {
			this.clearMessages();
			strCntrctBelong = "";
			strCntrctNO = "";
			strCntrctType = "";
			strCntrctName = "";
			strCntrctStDate = "";
			strCntrctEdDate = "";
			listAuditCntrct = new ArrayList<AuditCntrctDto>();
			
			delAuditCntrctNo = "";
			addAuditCntrctDto = new AuditCntrctDto();
			updAuditCntrctNo = "";
			updAuditCntrctDto = new AuditCntrctDto();
			updAuditCntrctDtoOld = new AuditCntrctDto();
			
			page = new Page();
			startIndex = 0;
			
			listUserInfo = userInfoService.queryAllUser();
			UserInfoDto userinfo = new UserInfoDto();
			userinfo.setLOGIN_NAME("");
			listUserInfo.add(userinfo);
			System.out.println("listUserInfo" + listUserInfo.size());
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询审计列表B
	 * @return
	 */
	public String queryAuditCntrctBList() {
		try {
			this.clearMessages();
			page = new Page();
			startIndex = 0;
			queryAuditCntrct();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 翻页B
	 * @return
	 */
	public String turnAuditCntrctBPage() {
		try {
			this.clearMessages();
			queryAuditCntrct();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	//审计合同选择
	/**
	 * 添加审计项目---显示审计合同信息选择页面
	 * @return
	 */
	public String showSelectAuditCntrctAction() {
		try {
			this.clearMessages();
			//查询审计合同信息
			cntrctStDate = "";
			cntrctEdDate = "";
			listAuditCntrct = new ArrayList<AuditCntrctDto>();
			page = new Page();
			startIndex = 0;
			queryAuditCntrct();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 审计合同信息（查询）
	 * @return
	 */
	public String querySelectAuditCntrctAction() {
		try {
			this.clearMessages();
			//查询审计合同信息
			startIndex = 0;
			queryAuditCntrct();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 选择审计合同信息（翻页）
	 * @return
	 */
	public String turnSelectAuditCntrctAction() {
		try {
			this.clearMessages();
			//查询审计合同信息
			queryAuditCntrct();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * check审计数据
	 * @param audit
	 * @return
	 */
	private boolean checkData(AuditCntrctDto auditCntrct) {
		if(StringUtil.isBlank(auditCntrct.getCNTRCT_NO())) {
			this.addActionMessage("合同编号不能为空！");
			return false;
		}
		if(StringUtil.isBlank(auditCntrct.getCNTRCT_TYPE())) {
			this.addActionMessage("请选择合同性质！");
			return false;
		}
		//if(StringUtil.isBlank(auditCntrct.getAUDIT_COMP_NO())) {
		if(StringUtil.isBlank(auditCntrct.getAUDIT_COMP_NAME())) {
			this.addActionMessage("委托单位不能为空！");
			return false;
		}
		return true;
	}
	
	@SuppressWarnings("unchecked")
	private void queryAuditCntrct() {
		//auditCompList = auditCompService.queryAllAuditComp();
		listAuditCntrct = new ArrayList<AuditCntrctDto>();
		if(page == null) {
			page = new Page();
		}
		
		if(StringUtil.isBlank(strCntrctType)) {
			strCntrctType = "";
		}
		
		//翻页查询所有审价
		this.page.setStartIndex(startIndex);
		page = auditCntrctService.queryAuditCntrctByPage(strCntrctBelong, strCntrctNO, strCntrctType,
				strCntrctName, strCntrctStDate, strCntrctEdDate, "", page);
		listAuditCntrct = (List<AuditCntrctDto>) page.getItems();
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

	public AuditCntrctService getAuditCntrctService() {
		return auditCntrctService;
	}

	public void setAuditCntrctService(AuditCntrctService auditCntrctService) {
		this.auditCntrctService = auditCntrctService;
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

	public List<AuditCompDto> getAuditCompList() {
		return auditCompList;
	}

	public void setAuditCompList(List<AuditCompDto> auditCompList) {
		this.auditCompList = auditCompList;
	}

	public List<AuditCntrctDto> getListAuditCntrct() {
		return listAuditCntrct;
	}

	public void setListAuditCntrct(List<AuditCntrctDto> listAuditCntrct) {
		this.listAuditCntrct = listAuditCntrct;
	}

	public String getStrCntrctBelong() {
		return strCntrctBelong;
	}

	public void setStrCntrctBelong(String strCntrctBelong) {
		this.strCntrctBelong = strCntrctBelong;
	}

	public String getStrCntrctNO() {
		return strCntrctNO;
	}

	public void setStrCntrctNO(String strCntrctNO) {
		this.strCntrctNO = strCntrctNO;
	}

	public String getStrCntrctType() {
		return strCntrctType;
	}

	public void setStrCntrctType(String strCntrctType) {
		this.strCntrctType = strCntrctType;
	}

	public String getStrCntrctName() {
		return strCntrctName;
	}

	public void setStrCntrctName(String strCntrctName) {
		this.strCntrctName = strCntrctName;
	}

	public String getDelAuditCntrctNo() {
		return delAuditCntrctNo;
	}

	public void setDelAuditCntrctNo(String delAuditCntrctNo) {
		this.delAuditCntrctNo = delAuditCntrctNo;
	}

	public AuditCntrctDto getAddAuditCntrctDto() {
		return addAuditCntrctDto;
	}

	public void setAddAuditCntrctDto(AuditCntrctDto addAuditCntrctDto) {
		this.addAuditCntrctDto = addAuditCntrctDto;
	}

	public String getUpdAuditCntrctNo() {
		return updAuditCntrctNo;
	}

	public void setUpdAuditCntrctNo(String updAuditCntrctNo) {
		this.updAuditCntrctNo = updAuditCntrctNo;
	}

	public AuditCntrctDto getUpdAuditCntrctDto() {
		return updAuditCntrctDto;
	}

	public void setUpdAuditCntrctDto(AuditCntrctDto updAuditCntrctDto) {
		this.updAuditCntrctDto = updAuditCntrctDto;
	}

	public AuditCntrctDto getUpdAuditCntrctDtoOld() {
		return updAuditCntrctDtoOld;
	}

	public void setUpdAuditCntrctDtoOld(AuditCntrctDto updAuditCntrctDtoOld) {
		this.updAuditCntrctDtoOld = updAuditCntrctDtoOld;
	}

	public String getDetailAuditCntrctNo() {
		return detailAuditCntrctNo;
	}

	public void setDetailAuditCntrctNo(String detailAuditCntrctNo) {
		this.detailAuditCntrctNo = detailAuditCntrctNo;
	}

	public AuditCntrctDto getAuditCntrctDtoDetail() {
		return auditCntrctDtoDetail;
	}

	public void setAuditCntrctDtoDetail(AuditCntrctDto auditCntrctDtoDetail) {
		this.auditCntrctDtoDetail = auditCntrctDtoDetail;
	}

	public String getStrAuditCntrctNoHist() {
		return strAuditCntrctNoHist;
	}

	public void setStrAuditCntrctNoHist(String strAuditCntrctNoHist) {
		this.strAuditCntrctNoHist = strAuditCntrctNoHist;
	}

	public List<AuditCntrctHisDto> getListAuditCntrctHist() {
		return listAuditCntrctHist;
	}

	public void setListAuditCntrctHist(List<AuditCntrctHisDto> listAuditCntrctHist) {
		this.listAuditCntrctHist = listAuditCntrctHist;
	}

	public String getDetailAuditCntrctHisSeq() {
		return detailAuditCntrctHisSeq;
	}

	public void setDetailAuditCntrctHisSeq(String detailAuditCntrctHisSeq) {
		this.detailAuditCntrctHisSeq = detailAuditCntrctHisSeq;
	}

	public AuditCntrctHisDto getAuditCntrctHistDtoDetail() {
		return auditCntrctHistDtoDetail;
	}

	public void setAuditCntrctHistDtoDetail(AuditCntrctHisDto auditCntrctHistDtoDetail) {
		this.auditCntrctHistDtoDetail = auditCntrctHistDtoDetail;
	}

	public List<AgentCompDto> getAgentCompList() {
		return agentCompList;
	}

	public void setAgentCompList(List<AgentCompDto> agentCompList) {
		this.agentCompList = agentCompList;
	}

	public String getAgentAddFlag() {
		return agentAddFlag;
	}

	public void setAgentAddFlag(String agentAddFlag) {
		this.agentAddFlag = agentAddFlag;
	}

	public String getCntrctStDate() {
		return cntrctStDate;
	}

	public void setCntrctStDate(String cntrctStDate) {
		this.cntrctStDate = cntrctStDate;
	}

	public String getCntrctEdDate() {
		return cntrctEdDate;
	}

	public void setCntrctEdDate(String cntrctEdDate) {
		this.cntrctEdDate = cntrctEdDate;
	}

	public String getStrCntrctStDate() {
		return strCntrctStDate;
	}

	public void setStrCntrctStDate(String strCntrctStDate) {
		this.strCntrctStDate = strCntrctStDate;
	}

	public String getStrCntrctEdDate() {
		return strCntrctEdDate;
	}

	public void setStrCntrctEdDate(String strCntrctEdDate) {
		this.strCntrctEdDate = strCntrctEdDate;
	}

	public AuditCntrctDto getAuditCntrctDto() {
		return auditCntrctDto;
	}

	public void setAuditCntrctDto(AuditCntrctDto auditCntrctDto) {
		this.auditCntrctDto = auditCntrctDto;
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


	public String getCntrctNm() {
		return cntrctNm;
	}


	public void setCntrctNm(String cntrctNm) {
		this.cntrctNm = cntrctNm;
	}

}
