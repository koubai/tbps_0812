package com.cn.tbps.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.common.factory.Poi2007Base;
import com.cn.common.factory.PoiFactory;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.AuditAuthDto;
import com.cn.tbps.dto.AuditCntrctDto;
import com.cn.tbps.dto.AuditCompDto;
import com.cn.tbps.dto.AuditDto;
import com.cn.tbps.dto.AuditHistDto;
import com.cn.tbps.dto.AuditListDisp;
import com.cn.tbps.dto.AuditListDispEnum;
import com.cn.tbps.dto.AuditStatCostDto;
import com.cn.tbps.dto.AuditStatPaidDto;
import com.cn.tbps.dto.AuditStatisticsDto;
import com.cn.tbps.dto.ConfigTabDto;
import com.cn.tbps.dto.UserInfoDto;
import com.cn.tbps.service.AuditCntrctService;
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
	private AuditCntrctService auditCntrctService;
	
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
	 * 项目名称
	 */
	private String strProjectName;

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
	
	private AuditCntrctDto auditCntrctDto;
	
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
	
	private String strStartDate;
	private String strEndDate;
	//项目情况检查
	private AuditAuthDto auditAuth;
	//统计界面
	private AuditStatisticsDto auditStatistics;
	//项目收费统计输出
	private AuditStatCostDto auditStatCost;
	//到账统到账统计计
	private AuditStatPaidDto auditStatPaid;
	
	//审价
	private String[][] arrAuditShow1;
	//咨询
	private String[][] arrAuditShow2;
	//清单编制
	private String[][] arrAuditShow3;
	//控制价编制
	private String[][] arrAuditShow4;
	//全过程投资监理
	private String[][] arrAuditShow5;
	//项目文号
	private String strReportNo;
	//委托内容
	private String strCntrctInfo;
	
	private AuditCntrctDto updAuditCntrctDtoOld;
	private String updAuditCntrctNo;
	
	//审价显示项目
	private List<AuditListDisp> auditListDisp;
	
	//审价显示项目
	private List<AuditListDisp> auditAllDisp;
	
	private String strSetList;
	
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
			List<AuditDto> list = auditService.queryAllAuditExport("", "", "", strProjectManager, "", "", "",
					"", "", "", "", "", "", "", "", "", strReportNo, strProjectName, strCntrctInfo);
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_SJYL);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("cntrctInfo", strCntrctInfo);
			base.setMap(map);
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
					strProjectClass, strDocArrDateLow, strDocArrDateHigh, strAgentName, strContractName, strReportNo, strProjectName, strCntrctInfo);
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_RECEIPT_SJYL);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	//审价
	/**
	 * 导出审定单（地铁）
	 * @return
	 */
	public String exportAuditMetroAction() {
		try {
			this.clearMessages();
			String filename = "page/auditmetro.xlsx";
			String name =  StringUtil.createFileName(Constants.EXCEL_TYPE_SJSDD);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_SJSDD);
			
			//查询数据
			List<AuditDto> list = new ArrayList<AuditDto>();
			list.add(updAuditDto);
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_SJSDD);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	//审价
	/**
	 * 导出审定单（非地铁）
	 * @return
	 */
	public String exportAuditNoMetroAction() {
		try {
			this.clearMessages();
			String filename = "page/auditnometro.xlsx";
			String name =  StringUtil.createFileName(Constants.EXCEL_TYPE_SJSDD2);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_SJSDD2);
			
			//查询数据
			List<AuditDto> list = new ArrayList<AuditDto>();
			list.add(updAuditDto);
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_SJSDD2);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	//审价
	/**
	 * 资料登记表
	 * @return
	 */
	public String exportAuditRegisterAction() {
		try {
			this.clearMessages();
			String filename = "page/auditregister.xlsx";
			String name =  StringUtil.createFileName(Constants.EXCEL_TYPE_SJDJ);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_SJDJ);
			
			//查询数据
			List<AuditDto> list = new ArrayList<AuditDto>();
			list.add(updAuditDto);
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_SJDJ);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	//审价
	/**
	 * 会商纪要
	 * @return
	 */
	public String exportAuditSummaryAction() {
		try {
			this.clearMessages();
			String filename = "page/auditsummary.xlsx";
			String name =  StringUtil.createFileName(Constants.EXCEL_TYPE_HSJY);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_HSJY);
			
			//查询数据
			List<AuditDto> list = new ArrayList<AuditDto>();
			list.add(updAuditDto);
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_HSJY);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	//审价
	/**
	 * 封面
	 * @return
	 */
	public String exportAuditCoverAction() {
		try {
			this.clearMessages();
			String filename = "page/auditcover.xlsx";
			String name =  StringUtil.createFileName(Constants.EXCEL_TYPE_COVER);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_COVER);
			
			//查询数据
			List<AuditDto> list = new ArrayList<AuditDto>();
			list.add(updAuditDto);
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_COVER);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	//审价
	/**
	 * 签署页
	 * @return
	 */
	public String exportAuditSignAction() {
		try {
			this.clearMessages();
			String filename = "page/auditsign.xlsx";
			String name =  StringUtil.createFileName(Constants.EXCEL_TYPE_SIGN);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_SIGN);
			
			//查询数据
			List<AuditDto> list = new ArrayList<AuditDto>();
			list.add(updAuditDto);
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_SIGN);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	//审价
	/**
	 * 报告
	 * @return
	 */
	public String exportAuditReportAction() {
		try {
			this.clearMessages();
			String filename = "page/auditreport.doc";
			String name =  StringUtil.createFileName3(Constants.DOC_TYPE_REPORT);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/octet-stream");
			Poi2007Base base = PoiFactory.getPoi(Constants.DOC_TYPE_REPORT);
			
			//查询数据
			List<AuditDto> list = new ArrayList<AuditDto>();
			list.add(updAuditDto);
			base.setDatas(list);
			base.setSheetName(Constants.DOC_TYPE_REPORT);
			base.setFilepath(filename);
			base.exportWord(response.getOutputStream());
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
			listUserInfo = userInfoService.queryAllUser();
			UserInfoDto userinfo = new UserInfoDto();
			userinfo.setLOGIN_NAME("");
			listUserInfo.add(userinfo);
			System.out.println("listUserInfo" + listUserInfo.size());
			updAuditDto = auditService.queryAuditByID(updAuditNo);
			auditCntrctDto = auditCntrctService.queryAuditCntrctByID(updAuditDto.getCNTRCT_NO());
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
	
	public AuditCntrctService getAuditCntrctService() {
		return auditCntrctService;
	}

	public void setAuditCntrctService(AuditCntrctService auditCntrctService) {
		this.auditCntrctService = auditCntrctService;
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
			showUpdAuditAction();
//			updAuditDtoOld = auditService.queryAuditByID(updAuditNo);
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
			auditCntrctDto = new AuditCntrctDto();
			if(StringUtil.isNotBlank(updAuditCntrctNo)){
				auditCntrctDto = auditCntrctService.queryAuditCntrctByID(updAuditCntrctNo);
			}
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
			auditCntrctDto = new AuditCntrctDto();
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
			
			strReportNo = "";
			strProjectName = "";
			strCntrctInfo = "";
			updAuditCntrctNo = "";
			auditCntrctDto = new AuditCntrctDto();
			//审价
			arrAuditShow1 = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
				{"DOC_REC_DATE", "资料收到日期"},{"APPROVAL_SND_DATE", "审定单发出日期"},{"REPORT_RAISE_DATE", "报告出具日期"},
				{"VERIFY_PER_AMOUNT", "送审价"},{"VERIFY_AMOUNT", "审核价"}};
			//咨询
			arrAuditShow2 = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
				{"DOC_REC_DATE", "资料收到日期"},{"REPORT_RAISE_DATE", "报告出具日期"},
				{"VERIFY_PER_AMOUNT", "送审价"},{"VERIFY_AMOUNT", "审核价"}};
			//清单编制
			arrAuditShow3 = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
				{"DOC_REC_DATE", "资料收到日期"},{"REPORT_RAISE_DATE", "报告出具日期"}};
			//控制价编制
			arrAuditShow4 = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
				{"DOC_REC_DATE", "资料收到日期"},{"REPORT_RAISE_DATE", "报告出具日期"},{"CNT_PRICE", "控制价金额"}};
			//全过程投资监理
			arrAuditShow5 = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
				{"PRE_PRICE", "预算金额"},{"PROGRESS_STATUS_MEMO", "项目大致进程简述"}};
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 显示项目情况检查页面
	 * @return
	 */
	public String showAuditAuth() {
		try {
			this.clearMessages();
			strProjectManager = "";
			strStartDate = "";
			strEndDate = "";
			auditAuth = new AuditAuthDto();
			
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
	 * 查询项目情况检查
	 * @return
	 */
	public String queryAuditAuth() {
		try {
			this.clearMessages();
			auditAuth = new AuditAuthDto();
			auditAuth = auditService.queryAuditAuth(strProjectManager, strStartDate, strEndDate);
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 显示统计界面
	 * @return
	 */
	public String showAuditStatistics() {
		try {
			this.clearMessages();
			strProjectManager = "";
			strStartDate = "";
			strEndDate = "";
			auditStatistics = new AuditStatisticsDto();
			
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
	 * 查询统计界面
	 * @return
	 */
	public String queryAuditStatistics() {
		try {
			this.clearMessages();
			auditStatistics = new AuditStatisticsDto();
			auditStatistics = auditService.queryAuditStatistics(strProjectManager, strStartDate, strEndDate);
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 显示项目收费统计输出
	 * @return
	 */
	public String showAuditStatCost() {
		try {
			this.clearMessages();
			strProjectManager = "";
			strStartDate = "";
			strEndDate = "";
			auditStatCost = new AuditStatCostDto();
			
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
	 * 查询项目收费统计输出
	 * @return
	 */
	public String queryAuditStatCost() {
		try {
			this.clearMessages();
			auditStatCost = new AuditStatCostDto();
			auditStatCost = auditService.queryAuditStatCost(strProjectManager, strStartDate, strEndDate);
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 显示到账统计页面
	 * @return
	 */
	public String showAuditStatPaid() {
		try {
			this.clearMessages();
			strProjectManager = "";
			strStartDate = "";
			strEndDate = "";
			auditStatPaid = new AuditStatPaidDto();
			
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
	 * 查询显示到账统计页面
	 * @return
	 */
	public String queryAuditStatPaid() {
		try {
			this.clearMessages();
			auditStatPaid = new AuditStatPaidDto();
			auditStatPaid = auditService.queryAuditStatPaid(strProjectManager, strStartDate, strEndDate);
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 显示项目显示及输出设定
	 * @return
	 */
	public String showAuditListDisp() {
		try {
			this.clearMessages();
			//全项目
			auditAllDisp = new ArrayList<AuditListDisp>();
			ConfigTabDto auditAllDispConfig = configTabService.queryConfigTabByKey(Constants.CONFIG_TAB_AUDIT_ALLDISP, Constants.CONFIG_TAB_AUDIT_ALLDISP);
			String auditAllDispValue = auditAllDispConfig.getCONFIG_VAL();
			String[] valArrayAll = auditAllDispValue.split(",");
			for(String id : valArrayAll) {
				AuditListDisp auditDisp = new AuditListDisp();
				auditDisp.setId(Integer.parseInt(id));
				auditDisp.setEnName(AuditListDispEnum.getNameByID(Integer.parseInt(id)).getEnName());
				auditDisp.setCnName(AuditListDispEnum.getNameByID(Integer.parseInt(id)).getCnName());
				auditAllDisp.add(auditDisp);
			}
			//设定项目
			auditListDisp = new ArrayList<AuditListDisp>();
			ConfigTabDto auditListDispConfig = configTabService.queryConfigTabByKey(Constants.CONFIG_TAB_AUDIT_DISP, Constants.CONFIG_TAB_AUDIT_DISP);
			if(null != auditListDispConfig) {
				String auditListDispValue = auditListDispConfig.getCONFIG_VAL();
				if(StringUtils.isNotEmpty(auditListDispValue)) {
					String[] valArray = auditListDispValue.split(",");
					for(String id : valArray) {
						AuditListDisp auditDisp = new AuditListDisp();
						auditDisp.setId(Integer.parseInt(id));
						auditDisp.setEnName(AuditListDispEnum.getNameByID(Integer.parseInt(id)).getEnName());
						auditDisp.setCnName(AuditListDispEnum.getNameByID(Integer.parseInt(id)).getCnName());
						auditListDisp.add(auditDisp);
					}
				}
			}
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
	 * 显示项目显示及输出设定
	 * @return
	 */
	public String updAuditListDisp() {
		try {
			this.clearMessages();
			ConfigTabDto dto = configTabService.queryConfigTabByKey(Constants.CONFIG_TAB_AUDIT_DISP, Constants.CONFIG_TAB_AUDIT_DISP);
			if(StringUtils.isNotEmpty(strSetList)) {
				String[] strArray = strSetList.split(",");
				Integer[] ids = new Integer[strArray.length];
				for(int i=0;i<strArray.length;i++){
					ids[i]=Integer.parseInt(strArray[i]);
				}
				List<Integer> strlist = Arrays.asList(ids);
				Collections.sort(strlist);
				strSetList = StringUtils.join(strlist, ",");
			}
			dto.setCONFIG_VAL(strSetList);
			configTabService.updateConfigTab(dto);
			this.addActionMessage("设定成功！");
			//设定项目
			auditListDisp = new ArrayList<AuditListDisp>();
			ConfigTabDto auditListDispConfig = configTabService.queryConfigTabByKey(Constants.CONFIG_TAB_AUDIT_DISP, Constants.CONFIG_TAB_AUDIT_DISP);
			if(null != auditListDispConfig) {
				String auditListDispValue = auditListDispConfig.getCONFIG_VAL();
				if(StringUtils.isNotEmpty(auditListDispValue)) {
					String[] valArray = auditListDispValue.split(",");
					for(String id : valArray) {
						AuditListDisp auditDisp = new AuditListDisp();
						auditDisp.setId(Integer.parseInt(id));
						auditDisp.setEnName(AuditListDispEnum.getNameByID(Integer.parseInt(id)).getEnName());
						auditDisp.setCnName(AuditListDispEnum.getNameByID(Integer.parseInt(id)).getCnName());
						auditListDisp.add(auditDisp);
					}
				}
			}
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
			//审价
			arrAuditShow1 = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
				{"DOC_REC_DATE", "资料收到日期"},{"APPROVAL_SND_DATE", "审定单发出日期"},{"REPORT_RAISE_DATE", "报告出具日期"},
				{"VERIFY_PER_AMOUNT", "送审价"},{"VERIFY_AMOUNT", "审核价"}};
			//咨询
			arrAuditShow2 = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
				{"DOC_REC_DATE", "资料收到日期"},{"REPORT_RAISE_DATE", "报告出具日期"},
				{"VERIFY_PER_AMOUNT", "送审价"},{"VERIFY_AMOUNT", "审核价"}};
			//清单编制
			arrAuditShow3 = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
				{"DOC_REC_DATE", "资料收到日期"},{"REPORT_RAISE_DATE", "报告出具日期"}};
			//控制价编制
			arrAuditShow4 = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
				{"DOC_REC_DATE", "资料收到日期"},{"REPORT_RAISE_DATE", "报告出具日期"},{"CNT_PRICE", "控制价金额"}};
			//全过程投资监理
			arrAuditShow5 = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
				{"PRE_PRICE", "预算金额"},{"PROGRESS_STATUS_MEMO", "项目大致进程简述"}};
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
		if(StringUtil.isBlank(audit.getCNTRCT_INFO())) {
			this.addActionMessage("请选委托内容！");
			return false;
		}
		if(StringUtil.isBlank(audit.getREPORT_NO())) {
			this.addActionMessage("报告文号不能为空！");
			return false;
		}
		if(StringUtil.isBlank(audit.getPROJECT_NAME())) {
			this.addActionMessage("项目名称不能为空！");
			return false;
		}
		if(StringUtil.isBlank(audit.getPROJECT_MANAGER())) {
			this.addActionMessage("工程师不能为空！");
			return false;
		}
		if(StringUtil.isBlank(audit.getCNTRCT_NO())) {
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
				strProjectClass, strDocArrDateLow, strDocArrDateHigh, strAgentName, strContractName, 
				strReportNo, strProjectName, strCntrctInfo);
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

	public String getStrProjectName() {
		return strProjectName;
	}

	public void setStrProjectName(String strProjectName) {
		this.strProjectName = strProjectName;
	}

	public AuditCntrctDto getAuditCntrctDto() {
		return auditCntrctDto;
	}

	public void setAuditCntrctDto(AuditCntrctDto auditCntrctDto) {
		this.auditCntrctDto = auditCntrctDto;
	}

	public String getStrStartDate() {
		return strStartDate;
	}

	public void setStrStartDate(String strStartDate) {
		this.strStartDate = strStartDate;
	}

	public String getStrEndDate() {
		return strEndDate;
	}

	public void setStrEndDate(String strEndDate) {
		this.strEndDate = strEndDate;
	}

	public AuditStatisticsDto getAuditStatistics() {
		return auditStatistics;
	}

	public void setAuditStatistics(AuditStatisticsDto auditStatistics) {
		this.auditStatistics = auditStatistics;
	}

	public AuditStatCostDto getAuditStatCost() {
		return auditStatCost;
	}

	public void setAuditStatCost(AuditStatCostDto auditStatCost) {
		this.auditStatCost = auditStatCost;
	}

	public AuditAuthDto getAuditAuth() {
		return auditAuth;
	}

	public void setAuditAuth(AuditAuthDto auditAuth) {
		this.auditAuth = auditAuth;
	}

	public AuditStatPaidDto getAuditStatPaid() {
		return auditStatPaid;
	}

	public void setAuditStatPaid(AuditStatPaidDto auditStatPaid) {
		this.auditStatPaid = auditStatPaid;
	}

	public String[][] getArrAuditShow1() {
		return arrAuditShow1;
	}

	public void setArrAuditShow1(String[][] arrAuditShow1) {
		this.arrAuditShow1 = arrAuditShow1;
	}

	public String[][] getArrAuditShow2() {
		return arrAuditShow2;
	}

	public void setArrAuditShow2(String[][] arrAuditShow2) {
		this.arrAuditShow2 = arrAuditShow2;
	}

	public String[][] getArrAuditShow3() {
		return arrAuditShow3;
	}

	public void setArrAuditShow3(String[][] arrAuditShow3) {
		this.arrAuditShow3 = arrAuditShow3;
	}

	public String[][] getArrAuditShow4() {
		return arrAuditShow4;
	}

	public void setArrAuditShow4(String[][] arrAuditShow4) {
		this.arrAuditShow4 = arrAuditShow4;
	}

	public String[][] getArrAuditShow5() {
		return arrAuditShow5;
	}

	public void setArrAuditShow5(String[][] arrAuditShow5) {
		this.arrAuditShow5 = arrAuditShow5;
	}

	public String getStrReportNo() {
		return strReportNo;
	}

	public void setStrReportNo(String strReportNo) {
		this.strReportNo = strReportNo;
	}

	public String getStrCntrctInfo() {
		return strCntrctInfo;
	}

	public void setStrCntrctInfo(String strCntrctInfo) {
		this.strCntrctInfo = strCntrctInfo;
	}

	public AuditCntrctDto getUpdAuditCntrctDtoOld() {
		return updAuditCntrctDtoOld;
	}

	public void setUpdAuditCntrctDtoOld(AuditCntrctDto updAuditCntrctDtoOld) {
		this.updAuditCntrctDtoOld = updAuditCntrctDtoOld;
	}

	public String getUpdAuditCntrctNo() {
		return updAuditCntrctNo;
	}

	public void setUpdAuditCntrctNo(String updAuditCntrctNo) {
		this.updAuditCntrctNo = updAuditCntrctNo;
	}

	public List<AuditListDisp> getAuditListDisp() {
		return auditListDisp;
	}

	public void setAuditListDisp(List<AuditListDisp> auditListDisp) {
		this.auditListDisp = auditListDisp;
	}

	public List<AuditListDisp> getAuditAllDisp() {
		return auditAllDisp;
	}

	public void setAuditAllDisp(List<AuditListDisp> auditAllDisp) {
		this.auditAllDisp = auditAllDisp;
	}

	public String getStrSetList() {
		return strSetList;
	}

	public void setStrSetList(String strSetList) {
		this.strSetList = strSetList;
	}

}
