package com.cn.tbps.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.cn.common.action.BaseAction;
import com.cn.common.factory.Poi2007Base;
import com.cn.common.factory.PoiFactory;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.AuditCompDto;
import com.cn.tbps.dto.AuditDto;
import com.cn.tbps.dto.AuditHistDto;
import com.cn.tbps.dto.ConfigTabDto;
import com.cn.tbps.dto.UserInfoDto;
import com.cn.tbps.service.AuditCompService;
import com.cn.tbps.service.AuditService;
import com.cn.tbps.service.ConfigTabService;
import com.cn.tbps.service.UserInfoService;
import com.opensymphony.xwork2.ActionContext;

/**
 * 审价Action
 * @name AuditAction.java
 * @author Frank
 * @time 2014-2-15下午1:38:15
 * @version 1.0
 */
public class AuditAction extends BaseAction {

	private static final long serialVersionUID = 4471825910742160813L;
	
	private static final Logger log = LogManager.getLogger(AuditAction.class);
	
	private AuditService auditService;
	
	private ConfigTabService configTabService;

	private UserInfoService userInfoService;
	private List<UserInfoDto> listUserInfo;

	private AuditCompService auditCompService;
	/**
	 * 页码
	 */
	private int startIndex;
	
	/**
	 * 翻页
	 */
	private Page page;
	
	/**
	 * 报告文号对应的公司列表
	 */
	private List<AuditCompDto> auditCompList;
	
	/**
	 * 报告文号----公司
	 */
	private String strPreReport;
	
	/**
	 * 报告文号----子文号High
	 */
	private String strReportHigh;
	
	/**
	 * 报告文号----子文号Low
	 */
	private String strReportLow;
	
	/**
	 * 审价列表
	 */
	private List<AuditDto> listAudit;
	
	//查询条件
	/**
	 * 审价编号Low
	 */
	private String strAuditNoLow;

	/**
	 * 审价编号High
	 */
	private String strAuditNoHigh;

	/**
	 * 项目分类
	 */
	private String strProjectClass;

	/**
	 * 项目进度
	 */
	private String strProjectStatus;

	/**
	 * 担当者
	 */
	private String strProjectManager;

	/**
	 * 到账日期Low
	 */
	private String strValueDateLow;

	/**
	 * 到账日期High
	 */
	private String strValueDateHigh;

	/**
	 * 资料到达日期Low
	 */
	private String strDocArrDateLow;

	/**
	 * 资料到达日期High
	 */
	private String strDocArrDateHigh;

	/**
	 * 委托公司代码
	 */
	private String strAgentNo;
	
	/**
	 * 委托公司名称
	 */
	private String strAgentName;
	
	/**
	 * 承揽公司名称
	 */
	private String strContractName;
	
	/**
	 *  删除审价编号
	 */
	private String delAuditNo;
	
	//新增
	/**
	 * 新增审价Dto
	 */
	private AuditDto addAuditDto;
	
	//更新
	/**
	 * 更新审价编号
	 */
	private String updAuditNo;
	
	/**
	 * 更新审价Dto
	 */
	private AuditDto updAuditDto;
	
	/**
	 * 更新审价Dto（OLD提示修改内容用）
	 */
	private AuditDto updAuditDtoOld;
	
	//审价明细
	/**
	 * 审价编号（显示明细）
	 */
	private String detailAuditNo;
	
	/**
	 * 审价明细
	 */
	private AuditDto auditDtoDetail;
	
	//审价履历
	/**
	 * 审价履历查询条件-审价编号
	 */
	private String strAuditNoHist;
	
	/**
	 * 审价履历列表
	 */
	private List<AuditHistDto> listAuditHist;
	
	/**
	 * 审价履历SEQ
	 */
	private String detailAuditHisSeq;
	
	/**
	 * 审价履历明细
	 */
	private AuditHistDto auditHistDtoDetail;
	
	/**
	 * 审价状态
	 */
	private String strAuditStatus;
	
	
	//审价履历
	/**
	 * 导出审价履历
	 * @return
	 */
	public String exportAuditHist() {
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_SJLLYL);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_SJLLYL);
			
			//查询所有审价履历
			List<AuditHistDto> list = auditService.queryAllAuditHistExport(strAuditNoHist);
			
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_SJLLYL);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			log.error("exportAuditHist error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 审价履历明细页面
	 * @return
	 */
	public String showAuditHistDetail() {
		try {
			this.clearMessages();
			auditHistDtoDetail = new AuditHistDto();
			auditHistDtoDetail = auditService.queryAuditHistByID(detailAuditHisSeq);
		} catch(Exception e) {
			log.error("showAuditHistDetail error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示所有的履历（不翻页）
	 * @return
	 */
	public String showAllAuditHisAction() {
		try {
			this.clearMessages();
			detailAuditHisSeq = "";
			auditHistDtoDetail = new AuditHistDto();
			listAuditHist = new ArrayList<AuditHistDto>();
			//查询所有审价履历
			listAuditHist = auditService.queryAllAuditHistExport(strAuditNoHist);
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	//审价
	/**
	 * 导出审价信息列表
	 * @return
	 */
	public String exportAuditListAction() {
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_SJYL);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_SJYL);
			
			if(StringUtils.isBlank(strPreReport)) {
				strReportLow = "";
				strReportHigh = "";
			}
			
			System.out.print("strAuditStatus: "+strAuditStatus);
			//查询数据
			List<AuditDto> list = auditService.queryAllAuditExport(strAuditNoLow, strAuditNoHigh,
					strProjectStatus, strProjectManager, strValueDateLow, strValueDateHigh, strAgentNo,
					strPreReport, strReportLow, strReportHigh, strAuditStatus, 
					strProjectClass, strDocArrDateLow, strDocArrDateHigh, strAgentName, strContractName);
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_SJYL);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	//审价
	/**
	 * 导出审价流转表
	 * @return
	 */
	public String exportAuditTableAction() {
		try {
			this.clearMessages();
			String filename = "page/audit.xls";
			String name =  StringUtil.createFileName2(Constants.EXCEL_TYPE_SJLZ);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_SJLZ);
			
			//查询数据
			List<AuditDto> list = new ArrayList<AuditDto>();
			list.add(updAuditDto);
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_SJLZ);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}

	//审价发票
	/**
	 * 导出审价发票信息列表
	 * @return
	 */
	public String exportAuditReceiptAction() {
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_RECEIPT_SJYL);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_RECEIPT_SJYL);
			
			if(StringUtils.isBlank(strPreReport)) {
				strReportLow = "";
				strReportHigh = "";
			}
			
			//查询数据
			List<AuditDto> list = auditService.queryAllAuditExport(strAuditNoLow, strAuditNoHigh,
					strProjectStatus, strProjectManager, strValueDateLow, strValueDateHigh, strAgentNo,
					strPreReport, strReportLow, strReportHigh, strAuditStatus, 
					strProjectClass, strDocArrDateLow, strDocArrDateHigh, strAgentName, strContractName);
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_RECEIPT_SJYL);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}

	
	
	
	/**
	 * 显示审价明细
	 * @return
	 */
	public String showAuditDetail() {
		try {
			this.clearMessages();
			auditDtoDetail = auditService.queryAuditByID(detailAuditNo);
		} catch(Exception e) {
			log.error("showAuditDetail error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示审价更新页面
	 * @return
	 */
	public String showUpdAuditAction() {
		try {
			this.clearMessages();
			updAuditDto = auditService.queryAuditByID(updAuditNo);
			if(updAuditDto == null) {
				this.addActionMessage("该数据不存在！");
				return "checkerror";
			}
			updAuditDtoOld = auditService.queryAuditByID(updAuditNo);
		} catch(Exception e) {
			this.addActionMessage("系统错误，查询审价异常！");
			log.error("showUpdAuditAction error:" + e);
			return "checkerror";
		}
		return SUCCESS;
	}
	
	/**
	 * 更新审价
	 * @return
	 */
	public String updAuditAction() {
		try {
			this.clearMessages();
			//数据校验
			if(!checkData(updAuditDto)) {
				return "checkerror";
			}
			//更新审价
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			updAuditDto.setUPDATE_USER(username);
			auditService.updateAudit(updAuditDto);
			updAuditDtoOld = auditService.queryAuditByID(updAuditNo);
			this.addActionMessage("修改审价成功！");
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示添加审价页面
	 * @return
	 */
	public String showAddAuditAction() {
		try {
			this.clearMessages();
			addAuditDto = new AuditDto();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 添加审价
	 * @return
	 */
	public String addAuditAction() {
		try {
			this.clearMessages();
			//数据校验
			if(!checkData(addAuditDto)) {
				return "checkerror";
			}
			//新增审价
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			addAuditDto.setUPDATE_USER(username);
			String auditNo = auditService.insertAudit(addAuditDto);
			addAuditDto = new AuditDto();
			this.addActionMessage("添加审价成功！审价编号为：" + auditNo);
		} catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 删除审价
	 * @return
	 */
	public String delAuditAction() {
		try {
			this.clearMessages();
			if(StringUtil.isBlank(delAuditNo)) {
				this.addActionMessage("审价编号为空！");
				return "checkerror";
			}
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			//删除
			auditService.deleteAudit(delAuditNo, username);
			this.addActionMessage("删除审价成功！");
			delAuditNo = "";
			//刷新页面
			startIndex = 0;
			queryAudit();
		} catch(Exception e) {
			log.error("delAuditAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 显示审价管理页面
	 * @return
	 */
	public String showAuditAction() {
		try {
			this.clearMessages();
			strAuditStatus = "23";
			strAuditNoLow = "";
			strAuditNoHigh = "";
			strProjectStatus = "";
			strProjectManager = "";
			strValueDateLow = "";
			strValueDateHigh = "";
			strDocArrDateLow = "";
			strDocArrDateHigh = "";
			strAgentNo = "";
			listAudit = new ArrayList<AuditDto>();
			
			delAuditNo = "";
			addAuditDto = new AuditDto();
			updAuditNo = "";
			updAuditDto = new AuditDto();
			updAuditDtoOld = new AuditDto();
			
			page = new Page();
			startIndex = 0;
			
			//查询条件报告文号
			strPreReport = "";
			strReportHigh = "";
			strReportLow = "";
//			auditCompList = configTabService.queryConfigTabByType(Constants.CONFIG_TAB_AUDIT_COMP);
			auditCompList = auditCompService.queryAllAuditComp();
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
	 * 查询审价列表
	 * @return
	 */
	public String queryAuditList() {
		try {
			this.clearMessages();
			page = new Page();
			startIndex = 0;
			queryAudit();
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
	public String turnAuditPage() {
		try {
			this.clearMessages();
			queryAudit();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * check审价数据
	 * @param audit
	 * @return
	 */
	private boolean checkData(AuditDto audit) {
		if(StringUtil.isBlank(audit.getPROJECT_TYPE())) {
			this.addActionMessage("请选项目性质！");
			return false;
		}
		if(StringUtil.isBlank(audit.getREPORT_NO())) {
			this.addActionMessage("报告文号不能为空！");
			return false;
		}
		if(StringUtil.isBlank(audit.getPROJECT_STATUS())) {
			this.addActionMessage("请选择项目进度！");
			return false;
		}
		if(StringUtil.isBlank(audit.getPROJECT_NAME())) {
			this.addActionMessage("项目名称不能为空！");
			return false;
		}
		if(StringUtil.isBlank(audit.getPROJECT_MANAGER())) {
			this.addActionMessage("担当者不能为空！");
			return false;
		}
		if(StringUtil.isBlank(audit.getCONTRACT_NO())) {
			this.addActionMessage("合同编号不能为空！");
			return false;
		}
		return true;
	}
	
	@SuppressWarnings("unchecked")
	private void queryAudit() {
//		auditCompList = configTabService.queryConfigTabByType(Constants.CONFIG_TAB_AUDIT_COMP);
		auditCompList = auditCompService.queryAllAuditComp();
		listAudit = new ArrayList<AuditDto>();
		if(page == null) {
			page = new Page();
		}
		
		if(StringUtils.isBlank(strPreReport)) {
			strReportLow = "";
			strReportHigh = "";
		}
		
		//翻页查询所有审价
		this.page.setStartIndex(startIndex);
		page = auditService.queryAuditByPage(strAuditNoLow, strAuditNoHigh, strProjectStatus,
				strProjectManager, strValueDateLow, strValueDateHigh, strAgentNo,
				strPreReport, strReportLow, strReportHigh, page, strAuditStatus, 
				strProjectClass, strDocArrDateLow, strDocArrDateHigh, strAgentName, strContractName);
		listAudit = (List<AuditDto>) page.getItems();
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

	public AuditService getAuditService() {
		return auditService;
	}

	public void setAuditService(AuditService auditService) {
		this.auditService = auditService;
	}

	public List<AuditDto> getListAudit() {
		return listAudit;
	}

	public void setListAudit(List<AuditDto> listAudit) {
		this.listAudit = listAudit;
	}

	public String getStrAuditNoLow() {
		return strAuditNoLow;
	}

	public void setStrAuditNoLow(String strAuditNoLow) {
		this.strAuditNoLow = strAuditNoLow;
	}

	public String getStrAuditNoHigh() {
		return strAuditNoHigh;
	}

	public void setStrAuditNoHigh(String strAuditNoHigh) {
		this.strAuditNoHigh = strAuditNoHigh;
	}

	public String getStrProjectStatus() {
		return strProjectStatus;
	}

	public void setStrProjectStatus(String strProjectStatus) {
		this.strProjectStatus = strProjectStatus;
	}

	public String getStrProjectManager() {
		return strProjectManager;
	}

	public void setStrProjectManager(String strProjectManager) {
		this.strProjectManager = strProjectManager;
	}

	public String getStrValueDateLow() {
		return strValueDateLow;
	}

	public void setStrValueDateLow(String strValueDateLow) {
		this.strValueDateLow = strValueDateLow;
	}

	public String getStrValueDateHigh() {
		return strValueDateHigh;
	}

	public void setStrValueDateHigh(String strValueDateHigh) {
		this.strValueDateHigh = strValueDateHigh;
	}

	public String getStrAgentNo() {
		return strAgentNo;
	}

	public void setStrAgentNo(String strAgentNo) {
		this.strAgentNo = strAgentNo;
	}

	public String getDelAuditNo() {
		return delAuditNo;
	}

	public void setDelAuditNo(String delAuditNo) {
		this.delAuditNo = delAuditNo;
	}

	public AuditDto getAddAuditDto() {
		return addAuditDto;
	}

	public void setAddAuditDto(AuditDto addAuditDto) {
		this.addAuditDto = addAuditDto;
	}

	public String getUpdAuditNo() {
		return updAuditNo;
	}

	public void setUpdAuditNo(String updAuditNo) {
		this.updAuditNo = updAuditNo;
	}

	public AuditDto getUpdAuditDto() {
		return updAuditDto;
	}

	public void setUpdAuditDto(AuditDto updAuditDto) {
		this.updAuditDto = updAuditDto;
	}

	public AuditDto getUpdAuditDtoOld() {
		return updAuditDtoOld;
	}

	public void setUpdAuditDtoOld(AuditDto updAuditDtoOld) {
		this.updAuditDtoOld = updAuditDtoOld;
	}

	public String getDetailAuditNo() {
		return detailAuditNo;
	}

	public void setDetailAuditNo(String detailAuditNo) {
		this.detailAuditNo = detailAuditNo;
	}

	public AuditDto getAuditDtoDetail() {
		return auditDtoDetail;
	}

	public void setAuditDtoDetail(AuditDto auditDtoDetail) {
		this.auditDtoDetail = auditDtoDetail;
	}

	public String getStrAuditNoHist() {
		return strAuditNoHist;
	}

	public void setStrAuditNoHist(String strAuditNoHist) {
		this.strAuditNoHist = strAuditNoHist;
	}

	public List<AuditHistDto> getListAuditHist() {
		return listAuditHist;
	}

	public void setListAuditHist(List<AuditHistDto> listAuditHist) {
		this.listAuditHist = listAuditHist;
	}

	public String getDetailAuditHisSeq() {
		return detailAuditHisSeq;
	}

	public void setDetailAuditHisSeq(String detailAuditHisSeq) {
		this.detailAuditHisSeq = detailAuditHisSeq;
	}

	public AuditHistDto getAuditHistDtoDetail() {
		return auditHistDtoDetail;
	}

	public void setAuditHistDtoDetail(AuditHistDto auditHistDtoDetail) {
		this.auditHistDtoDetail = auditHistDtoDetail;
	}

	public ConfigTabService getConfigTabService() {
		return configTabService;
	}

	public void setConfigTabService(ConfigTabService configTabService) {
		this.configTabService = configTabService;
	}

	public List<AuditCompDto> getAuditCompList() {
		return auditCompList;
	}

	public void setAuditCompList(List<AuditCompDto> auditCompList) {
		this.auditCompList = auditCompList;
	}

	public String getStrPreReport() {
		return strPreReport;
	}

	public void setStrPreReport(String strPreReport) {
		this.strPreReport = strPreReport;
	}

	public String getStrReportHigh() {
		return strReportHigh;
	}

	public void setStrReportHigh(String strReportHigh) {
		this.strReportHigh = strReportHigh;
	}

	public String getStrReportLow() {
		return strReportLow;
	}

	public void setStrReportLow(String strReportLow) {
		this.strReportLow = strReportLow;
	}
	
	public String getStrAuditStatus() {
		return strAuditStatus;
	}

	public void setStrAuditStatus(String strAuditStatus) {
		this.strAuditStatus = strAuditStatus;
	}

	public String getStrDocArrDateLow() {
		return strDocArrDateLow;
	}

	public void setStrDocArrDateLow(String strDocArrDateLow) {
		this.strDocArrDateLow = strDocArrDateLow;
	}

	public String getStrDocArrDateHigh() {
		return strDocArrDateHigh;
	}

	public void setStrDocArrDateHigh(String strDocArrDateHigh) {
		this.strDocArrDateHigh = strDocArrDateHigh;
	}

	public String getStrProjectClass() {
		return strProjectClass;
	}

	public void setStrProjectClass(String strProjectClass) {
		this.strProjectClass = strProjectClass;
	}

	public String getStrAgentName() {
		return strAgentName;
	}

	public void setStrAgentName(String strAgentName) {
		this.strAgentName = strAgentName;
	}

	public String getStrContractName() {
		return strContractName;
	}

	public void setStrContractName(String strContractName) {
		this.strContractName = strContractName;
	}

	public List<UserInfoDto> getListUserInfo() {
		return listUserInfo;
	}

	public void setListUserInfo(List<UserInfoDto> listUserInfo) {
		this.listUserInfo = listUserInfo;
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public AuditCompService getAuditCompService() {
		return auditCompService;
	}

	public void setAuditCompService(AuditCompService auditCompService) {
		this.auditCompService = auditCompService;
	}

}