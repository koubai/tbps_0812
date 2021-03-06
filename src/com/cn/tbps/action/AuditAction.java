package com.cn.tbps.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
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
import com.cn.common.util.DateUtil;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.AuditAnnualDataDto;
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

	//显示项
	private String[][] arrAuditShow;
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
	//设定值
	private String[][] arrAuditShowSet;
	//设定值Flag
	private String strSetFlag;
	//关键字Flag
	private String strKeywordFlag;
	//项目文号
	private String strReportNo;
	//委托内容
	private String strCntrctInfo;
	
	//检索年度
	private String strCntYear;
	
	private AuditCntrctDto updAuditCntrctDtoOld;
	private String updAuditCntrctNo;
	
	//审价显示项目
	private List<AuditListDisp> auditListDisp;
	
	//审价显示项目
	private List<AuditListDisp> auditAllDisp;
	
	private String strSetList;
	//去年一年审价数据
	private AuditAnnualDataDto auditDataMonthSum;
	//月报统计按月数据审价
	private List<AuditAnnualDataDto> auditDataMonthSum_1;
	//月报统计总计数据审价
	private AuditAnnualDataDto sumAuditAnnualData_1;
	//月报统计按月数据咨询
	private List<AuditAnnualDataDto> auditDataMonthSum_2;
	//月报统计总计数据咨询
	private AuditAnnualDataDto sumAuditAnnualData_2;
	//月报统计按月数据控制价
	private List<AuditAnnualDataDto> auditDataMonthSum_4;
	//月报统计总计数据控制价
	private AuditAnnualDataDto sumAuditAnnualData_4;
	
	private String strKeyword;
	
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
			//显示列表
			arrAuditShow = null;
			if("1".equals(strSetFlag)){
				//设定项目
				auditListDisp = new ArrayList<AuditListDisp>();
				String userid = (String) ActionContext.getContext().getSession().get(Constants.USER_ID);
				ConfigTabDto auditListDispConfig = configTabService.queryConfigTabByKey(Constants.CONFIG_TAB_AUDIT_DISP+"_"+userid, Constants.CONFIG_TAB_AUDIT_DISP);
				if(null != auditListDispConfig) {
					String auditListDispValue = auditListDispConfig.getCONFIG_VAL();
					if(StringUtils.isNotEmpty(auditListDispValue)) {
						String[] valArray = auditListDispValue.split(",");
						arrAuditShow = new String[valArray.length][2];
						int i = 0;
						for(String id : valArray) {
							arrAuditShow[i][0] = AuditListDispEnum.getNameByID(Integer.parseInt(id)).getEnName();
							arrAuditShow[i][1] = AuditListDispEnum.getNameByID(Integer.parseInt(id)).getCnName();
							i++;
						}
					} else {
						//this.addActionMessage("请先设定显示列表！");
						//return SUCCESS;
					}
				}
			}
			if(null == arrAuditShow || arrAuditShow.length <= 0){
				if("2".equals(strCntrctInfo)){
					arrAuditShow  = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
							{"DOC_REC_DATE", "资料收到日期"},{"REPORT_RAISE_DATE", "报告出具日期"},
							{"VERIFY_PER_AMOUNT", "送审价"},{"VERIFY_AMOUNT", "审核价"}};//咨询
				} else if("3".equals(strCntrctInfo)){
					arrAuditShow = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
						{"DOC_REC_DATE", "资料收到日期"},{"REPORT_RAISE_DATE", "报告出具日期"}};//清单编制
				} else if("4".equals(strCntrctInfo)){
					arrAuditShow = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
							{"DOC_REC_DATE", "资料收到日期"},{"REPORT_RAISE_DATE", "报告出具日期"},{"CNT_PRICE", "控制价金额"}};//控制价编制
				} else if("5".equals(strCntrctInfo)){
					arrAuditShow = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
							{"PRE_PRICE", "预算金额"},{"PROGRESS_STATUS_MEMO", "项目大致进程简述"}};//全过程投资监理
				} else {
					arrAuditShow = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
							{"DOC_REC_DATE", "资料收到日期"},{"APPROVAL_SND_DATE", "审定单发出日期"},{"REPORT_RAISE_DATE", "报告出具日期"},
							{"VERIFY_PER_AMOUNT", "送审价"},{"VERIFY_AMOUNT", "审核价"}};//审价
				}
			}
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
			List<AuditDto> list = null;
			if("1".equals(strKeywordFlag)){
				list = auditService.queryAllAuditExport(strKeyword, strProjectManager, strReportNo, strProjectName, strCntrctInfo, strCntYear, "");
			} else {
				list = auditService.queryAllAuditExport("", "", "", strProjectManager, "", "", "",
						"", "", "", "", "", "", "", "", "", strReportNo, strProjectName, strCntrctInfo, strCntYear);
			}
			
			//2019.02.08 
			Collections.reverse(list);
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_SJYL);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("cntrctInfo", strCntrctInfo);
			map.put("arrAuditShow", arrAuditShow);
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
					strProjectClass, strDocArrDateLow, strDocArrDateHigh, strAgentName, strContractName, strReportNo, strProjectName, strCntrctInfo, "");
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
			//String filename = "page/auditmetro.xlsx";
			String filename = "page/audittempmetro.xlsx";
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
			String filename = "page/audittempnometro.xlsx";
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
			strSetFlag = "";
			strKeywordFlag = "";
			strKeyword = "";
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
			//显示项
			arrAuditShow = arrAuditShow1;
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
//			System.out.println(auditAuth.getAPPROVAL_RCV_DATE_NULL1_NU());
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
			
			//审价统计（新）--add by frank
			queryAnnualAuditStatistics();
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
			
			//审价统计（新）--add by frank
			queryAnnualAuditStatistics();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 显示月报统计
	 * @return
	 */
	public String showAuditMonthSumList() {
		try {
			this.clearMessages();
			strProjectManager = "";
			strStartDate = "";
			strEndDate = "";
			auditDataMonthSum_1 = new ArrayList<AuditAnnualDataDto>();
			auditDataMonthSum_2 = new ArrayList<AuditAnnualDataDto>();
			auditDataMonthSum_4 = new ArrayList<AuditAnnualDataDto>();
			sumAuditAnnualData_1 = new AuditAnnualDataDto();
			sumAuditAnnualData_2 = new AuditAnnualDataDto();
			sumAuditAnnualData_4 = new AuditAnnualDataDto();
			
			listUserInfo = userInfoService.queryAllUser();
			UserInfoDto userinfo = new UserInfoDto();
			userinfo.setLOGIN_NAME("");
			listUserInfo.add(userinfo);
			System.out.println("listUserInfo" + listUserInfo.size());

			//月报统计
			queryAuditMonthSum();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询月报统计
	 * @return
	 */
	public String queryAuditMonthSumList() {
		try {
			this.clearMessages();
			auditDataMonthSum_1 = new ArrayList<AuditAnnualDataDto>();
			auditDataMonthSum_2 = new ArrayList<AuditAnnualDataDto>();
			auditDataMonthSum_4 = new ArrayList<AuditAnnualDataDto>();
			sumAuditAnnualData_1 = new AuditAnnualDataDto();
			sumAuditAnnualData_2 = new AuditAnnualDataDto();
			sumAuditAnnualData_4 = new AuditAnnualDataDto();
			
			//月报统计
			queryAuditMonthSum();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 按年统计月报数据
	 */
	private void queryAuditMonthSum() {
		try {
			auditDataMonthSum_1 = new ArrayList<AuditAnnualDataDto>();
			auditDataMonthSum_2 = new ArrayList<AuditAnnualDataDto>();
			auditDataMonthSum_4 = new ArrayList<AuditAnnualDataDto>();
			sumAuditAnnualData_1 = new AuditAnnualDataDto();
			sumAuditAnnualData_2 = new AuditAnnualDataDto();
			sumAuditAnnualData_4 = new AuditAnnualDataDto();
			SimpleDateFormat sdftime = new SimpleDateFormat("yyyy-MM-dd");
			String startDate = strStartDate;
			String endDate = strEndDate;
			if(StringUtils.isEmpty(strStartDate)){
				Calendar calendar = Calendar.getInstance();  
		        int currentYear = calendar.get(Calendar.YEAR);
		        calendar.clear();
		        calendar.set(Calendar.YEAR, currentYear);
		        startDate = sdftime.format(calendar.getTime());
			}
			if(StringUtils.isEmpty(strEndDate)){
				Calendar calendar = Calendar.getInstance();  
		        int currentYear = calendar.get(Calendar.YEAR);
		        calendar.clear();
		        calendar.set(Calendar.YEAR, currentYear);
		        calendar.roll(Calendar.DAY_OF_YEAR, -1);
		        endDate = sdftime.format(calendar.getTime());
			}
			List<String> monthList = getMonthList(startDate, endDate);
			//只查询合同性质=地铁类的
			for(String month : monthList){
				Calendar calendar = Calendar.getInstance(); 
				//指定月份第一天
				calendar.set(Calendar.YEAR, Integer.valueOf(month.substring(0, 4)));
				calendar.set(Calendar.MONTH, Integer.valueOf(month.substring(5)) -1); 
				int firstDay = calendar.getMinimum(Calendar.DATE);
				calendar.set(Calendar.DAY_OF_MONTH, firstDay); 
				startDate = sdftime.format(calendar.getTime());
				//指定月份最后一天
		        int lastDay = calendar.getActualMaximum(Calendar.DATE);
		        calendar.set(Calendar.DAY_OF_MONTH, lastDay); 
		        endDate = sdftime.format(calendar.getTime()); 
				//委托内容审价
				AuditAnnualDataDto auditAnnualData = new AuditAnnualDataDto();
				auditAnnualData = auditService.queryAuditMonthData(strProjectManager, startDate, endDate, "1", "1");
				auditAnnualData.setShowtime(month.substring(5)+"月");
				auditDataMonthSum_1.add(auditAnnualData);
				//委托内容咨询
				auditAnnualData = auditService.queryAuditMonthData(strProjectManager, startDate, endDate, "1", "2");
				auditAnnualData.setShowtime(month.substring(5)+"月");
				auditDataMonthSum_2.add(auditAnnualData);
				//委托内容控制价
				auditAnnualData = auditService.queryAuditMonthData(strProjectManager, startDate, endDate, "1", "4");
				auditAnnualData.setShowtime(month.substring(5)+"月");
				auditDataMonthSum_4.add(auditAnnualData);
			}
			sumAuditAnnualData_1 = sumAuditAnnualData(auditDataMonthSum_1);
			auditDataMonthSum_1.add(sumAuditAnnualData_1);
			sumAuditAnnualData_2 = sumAuditAnnualData(auditDataMonthSum_2);
			auditDataMonthSum_2.add(sumAuditAnnualData_2);
			sumAuditAnnualData_4 = sumAuditAnnualData(auditDataMonthSum_4);
			auditDataMonthSum_4.add(sumAuditAnnualData_4);
			
		} catch(Exception e) {
			log.error(e);
		}
	}

	public List<String> getMonthList(String beginTime, String endTime) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat monthFormat = new SimpleDateFormat("yyyy-MM");
		List<String> monthList = new ArrayList<String>();
		try {
			Date begin = format.parse(beginTime);
			Date end = format.parse(endTime);
			int months = (end.getYear() - begin.getYear()) * 12
					+ (end.getMonth() - begin.getMonth());

			for (int i = 0; i <= months; i++) {
				Calendar calendar = Calendar.getInstance();  
				calendar.setTime(begin);  
				calendar.add(Calendar.MONTH, i);
				monthList.add(monthFormat.format(calendar.getTime()));
			}

		} catch (ParseException e) {
			e.printStackTrace();
		}

		return monthList;
	}
	
	/**
	 * 导出审价统计数据
	 * @return
	 */
	public String exportAuditAnnualStatistics() {
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_SJTJ);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_SJTJ);
			
			//查询审价统计数据
			queryAnnualAuditStatistics();
			
			//上一年份数据
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("audit_data_month_sum", auditDataMonthSum);
			base.setMap(map);
			
			base.setSheetName(Constants.EXCEL_TYPE_SJTJ);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 导出审价月报统计数据
	 * @return
	 */
	public String exportAuditMonthStatistics() {
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_SJTJ);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_YBTJ);
			
			//查询审价统计数据
			queryAuditMonthSum();
			
			//上一年份数据
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("project_manager", strProjectManager);
			map.put("audit_data_month_sum_1", auditDataMonthSum_1);
			map.put("audit_data_month_sum_2", auditDataMonthSum_2);
			map.put("audit_data_month_sum_4", auditDataMonthSum_4);
			base.setMap(map);
			
			base.setSheetName(Constants.EXCEL_TYPE_YBTJ);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 按年统计审价数据
	 */
	private void queryAnnualAuditStatistics() {
		try {
			Date now = new Date();
			SimpleDateFormat sdfmonth = new SimpleDateFormat("yyyy-MM");
			SimpleDateFormat sdfday = new SimpleDateFormat("dd");
			SimpleDateFormat sdfmonth1 = new SimpleDateFormat("M月");
			
			String startdate = "";
			String enddate = "";
			String showtime = "";
			//判断当前时间是否是大于28号
			int day = Integer.valueOf(sdfday.format(now));
			if(day > 28) {
				//大于28号，则取当前月的
				Date lastMonth = DateUtil.addMonths(now, -1);
				startdate = sdfmonth.format(lastMonth) + "-29";
				enddate = sdfmonth.format(now) + "-28";
				showtime = sdfmonth1.format(now);
			} else {
				//小于28号，则取上一个月的
				Date lastLastMonth = DateUtil.addMonths(now, -2);
				Date lastMonth = DateUtil.addMonths(now, -1);
				startdate = sdfmonth.format(lastLastMonth) + "-29";
				enddate = sdfmonth.format(lastMonth) + "-28";
				showtime = sdfmonth1.format(lastMonth);
			}
			
			//只查询合同性质=地铁类的
			auditDataMonthSum = auditService.queryAuditMonthData("", startdate, enddate, "1");
			auditDataMonthSum.setShowtime(showtime);
			
		} catch(Exception e) {
			log.error(e);
		}
	}
	
	/**
	 * 根据列表汇总数据
	 * @param list
	 * @return
	 */
	private AuditAnnualDataDto sumAuditAnnualData(List<AuditAnnualDataDto> list) {
		AuditAnnualDataDto sumAuditAnnualData = new AuditAnnualDataDto();
		sumAuditAnnualData.setShowtime("本年");
		if(list != null && list.size() > 0) {
			for(AuditAnnualDataDto auditAnnualData : list) {
				if(auditAnnualData.getReceiveAudit() != null) {
					sumAuditAnnualData.setReceiveAudit(sumAuditAnnualData.getReceiveAudit() + auditAnnualData.getReceiveAudit());
				}
				if(auditAnnualData.getCompleteAuditCurrentMonth() != null) {
					sumAuditAnnualData.setCompleteAuditCurrentMonth(sumAuditAnnualData.getCompleteAuditCurrentMonth() + auditAnnualData.getCompleteAuditCurrentMonth());
				}
				if(auditAnnualData.getCompleteAuditHis() != null) {
					sumAuditAnnualData.setCompleteAuditHis(sumAuditAnnualData.getCompleteAuditHis() + auditAnnualData.getCompleteAuditHis());
				}
				if(auditAnnualData.getSubmitAuditAmount() != null) {
					sumAuditAnnualData.setSubmitAuditAmount(sumAuditAnnualData.getSubmitAuditAmount().add(auditAnnualData.getSubmitAuditAmount()));
				}
				if(auditAnnualData.getCompleteAuditAmount() != null) {
					sumAuditAnnualData.setCompleteAuditAmount(sumAuditAnnualData.getCompleteAuditAmount().add(auditAnnualData.getCompleteAuditAmount()));
				}
				if(auditAnnualData.getAuthorizeAuditAmount() != null) {
					sumAuditAnnualData.setAuthorizeAuditAmount(sumAuditAnnualData.getAuthorizeAuditAmount().add(auditAnnualData.getAuthorizeAuditAmount()));
				}
				if(auditAnnualData.getIncompleteAuditCurrentMonth() != null) {
					sumAuditAnnualData.setIncompleteAuditCurrentMonth(sumAuditAnnualData.getIncompleteAuditCurrentMonth() + auditAnnualData.getIncompleteAuditCurrentMonth());
				}
				if(auditAnnualData.getIncompleteAuditHis() != null) {
					sumAuditAnnualData.setIncompleteAuditHis(sumAuditAnnualData.getIncompleteAuditHis() + auditAnnualData.getIncompleteAuditHis());
				}
				if(auditAnnualData.getReviewAudit() != null) {
					sumAuditAnnualData.setReviewAudit(sumAuditAnnualData.getReviewAudit() + auditAnnualData.getReviewAudit());
				}
				if(auditAnnualData.getAuditAmountMonthConfirm() != null) {
					sumAuditAnnualData.setAuditAmountMonthConfirm(sumAuditAnnualData.getAuditAmountMonthConfirm().add(auditAnnualData.getAuditAmountMonthConfirm()));
				}
				if(auditAnnualData.getAuditAmountMonthUnconfirmed() != null) {
					sumAuditAnnualData.setAuditAmountMonthUnconfirmed(sumAuditAnnualData.getAuditAmountMonthUnconfirmed().add(auditAnnualData.getAuditAmountMonthUnconfirmed()));
				}
				if(auditAnnualData.getAuditAmountMonthConfirming() != null) {
					sumAuditAnnualData.setAuditAmountMonthConfirming(sumAuditAnnualData.getAuditAmountMonthConfirming().add(auditAnnualData.getAuditAmountMonthConfirming()));
				}
				if(auditAnnualData.getReceiptAuditPieceMonth() != null) {
					sumAuditAnnualData.setReceiptAuditPieceMonth(sumAuditAnnualData.getReceiptAuditPieceMonth() + auditAnnualData.getReceiptAuditPieceMonth());
				}
				if(auditAnnualData.getReceiptAuditAmountMonth() != null) {
					sumAuditAnnualData.setReceiptAuditAmountMonth(sumAuditAnnualData.getReceiptAuditAmountMonth().add(auditAnnualData.getReceiptAuditAmountMonth()));
				}
				if(auditAnnualData.getReceiptAuditPieceHis() != null) {
					sumAuditAnnualData.setReceiptAuditPieceHis(sumAuditAnnualData.getReceiptAuditPieceHis() + auditAnnualData.getReceiptAuditPieceHis());
				}
				if(auditAnnualData.getReceiptAuditAmountHis() != null) {
					sumAuditAnnualData.setReceiptAuditAmountHis(sumAuditAnnualData.getReceiptAuditAmountHis().add(auditAnnualData.getReceiptAuditAmountHis()));
				}
				if(auditAnnualData.getTotalNumMonth() != null) {
					sumAuditAnnualData.setTotalNumMonth(sumAuditAnnualData.getTotalNumMonth() + auditAnnualData.getTotalNumMonth());
				}
				if(auditAnnualData.getTotalAmountMonth() != null) {
					sumAuditAnnualData.setTotalAmountMonth(sumAuditAnnualData.getTotalAmountMonth().add(auditAnnualData.getTotalAmountMonth()));
				}
				if(auditAnnualData.getUnreceivedNumMonth() != null) {
					sumAuditAnnualData.setUnreceivedNumMonth(sumAuditAnnualData.getUnreceivedNumMonth() + auditAnnualData.getUnreceivedNumMonth());
				}
				if(auditAnnualData.getUnreceivedAmountMonth() != null) {
					sumAuditAnnualData.setUnreceivedAmountMonth(sumAuditAnnualData.getUnreceivedAmountMonth().add(auditAnnualData.getUnreceivedAmountMonth()));
				}
				if(auditAnnualData.getUnreceivedNumHis() != null) {
					sumAuditAnnualData.setUnreceivedNumHis(sumAuditAnnualData.getUnreceivedNumHis() + auditAnnualData.getUnreceivedNumHis());
				}
				if(auditAnnualData.getUnreceivedAmountHis() != null) {
					sumAuditAnnualData.setUnreceivedAmountHis(sumAuditAnnualData.getUnreceivedAmountHis().add(auditAnnualData.getUnreceivedAmountHis()));
				}
			}
		}
		return sumAuditAnnualData;
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
			/*ConfigTabDto auditAllDispConfig = configTabService.queryConfigTabByKey(Constants.CONFIG_TAB_AUDIT_ALLDISP, Constants.CONFIG_TAB_AUDIT_ALLDISP);
			String auditAllDispValue = auditAllDispConfig.getCONFIG_VAL();
			String[] valArrayAll = auditAllDispValue.split(",");
			for(String id : valArrayAll) {
				AuditListDisp auditDisp = new AuditListDisp();
				auditDisp.setId(Integer.parseInt(id));
				auditDisp.setEnName(AuditListDispEnum.getNameByID(Integer.parseInt(id)).getEnName());
				auditDisp.setCnName(AuditListDispEnum.getNameByID(Integer.parseInt(id)).getCnName());
				auditAllDisp.add(auditDisp);
			}*/
			for(int id=1; id<=74; id++) {
				AuditListDisp auditDisp = new AuditListDisp();
				auditDisp.setId(id);
				auditDisp.setEnName(AuditListDispEnum.getNameByID(id).getEnName());
				auditDisp.setCnName(AuditListDispEnum.getNameByID(id).getCnName());
				auditAllDisp.add(auditDisp);
			}
			//设定项目
			auditListDisp = new ArrayList<AuditListDisp>();
			String userid = (String) ActionContext.getContext().getSession().get(Constants.USER_ID);
			ConfigTabDto auditListDispConfig = configTabService.queryConfigTabByKey(Constants.CONFIG_TAB_AUDIT_DISP+"_"+userid, Constants.CONFIG_TAB_AUDIT_DISP);
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
			log.error(e);
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
			String userid = (String) ActionContext.getContext().getSession().get(Constants.USER_ID);
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
			ConfigTabDto dto = configTabService.queryConfigTabByKey(Constants.CONFIG_TAB_AUDIT_DISP+"_"+userid, Constants.CONFIG_TAB_AUDIT_DISP);
			if(null == dto){
				dto = new ConfigTabDto();
				dto.setCONFIG_TYPE(Constants.CONFIG_TAB_AUDIT_DISP);
				dto.setCONFIG_KEY(Constants.CONFIG_TAB_AUDIT_DISP+"_"+userid);
				dto.setCONFIG_VAL(strSetList);
				dto.setINSERT_DATE(Calendar.getInstance().getTime());
				dto.setUPDATE_DATE(Calendar.getInstance().getTime());
				configTabService.insertConfigTab(dto);
			} else {
				dto.setCONFIG_VAL(strSetList);
				dto.setUPDATE_DATE(Calendar.getInstance().getTime());
				configTabService.updateConfigTab(dto);
			}
			this.addActionMessage("设定成功！");
			//设定项目
			auditListDisp = new ArrayList<AuditListDisp>();
			ConfigTabDto auditListDispConfig = configTabService.queryConfigTabByKey(Constants.CONFIG_TAB_AUDIT_DISP+"_"+userid, Constants.CONFIG_TAB_AUDIT_DISP);
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
			//显示值
			arrAuditShow = null;
			if("1".equals(strSetFlag)){
				//设定项目
				auditListDisp = new ArrayList<AuditListDisp>();
				String userid = (String) ActionContext.getContext().getSession().get(Constants.USER_ID);
				ConfigTabDto auditListDispConfig = configTabService.queryConfigTabByKey(Constants.CONFIG_TAB_AUDIT_DISP+"_"+userid, Constants.CONFIG_TAB_AUDIT_DISP);
				if(null != auditListDispConfig) {
					String auditListDispValue = auditListDispConfig.getCONFIG_VAL();
					if(StringUtils.isNotEmpty(auditListDispValue)) {
						String[] valArray = auditListDispValue.split(",");
						arrAuditShow = new String[valArray.length][2];
						int i = 0;
						for(String id : valArray) {
							arrAuditShow[i][0] = AuditListDispEnum.getNameByID(Integer.parseInt(id)).getEnName();
							arrAuditShow[i][1] = AuditListDispEnum.getNameByID(Integer.parseInt(id)).getCnName();
							i++;
						}
					} else {
						this.addActionMessage("请先设定显示列表！");
					}
				}
			}
			if(null == arrAuditShow || arrAuditShow.length <= 0){
				if("2".equals(strCntrctInfo)){
					arrAuditShow  = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
							{"DOC_REC_DATE", "资料收到日期"},{"REPORT_RAISE_DATE", "报告出具日期"},
							{"VERIFY_PER_AMOUNT", "送审价"},{"VERIFY_AMOUNT", "审核价"}};//咨询
				} else if("3".equals(strCntrctInfo)){
					arrAuditShow = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
						{"DOC_REC_DATE", "资料收到日期"},{"REPORT_RAISE_DATE", "报告出具日期"}};//清单编制
				} else if("4".equals(strCntrctInfo)){
					arrAuditShow = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
							{"DOC_REC_DATE", "资料收到日期"},{"REPORT_RAISE_DATE", "报告出具日期"},{"CNT_PRICE", "控制价金额"}};//控制价编制
				} else if("5".equals(strCntrctInfo)){
					arrAuditShow = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
							{"PRE_PRICE", "预算金额"},{"PROGRESS_STATUS_MEMO", "项目大致进程简述"}};//全过程投资监理
				} else {
					arrAuditShow = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
							{"DOC_REC_DATE", "资料收到日期"},{"APPROVAL_SND_DATE", "审定单发出日期"},{"REPORT_RAISE_DATE", "报告出具日期"},
							{"VERIFY_PER_AMOUNT", "送审价"},{"VERIFY_AMOUNT", "审核价"}};//审价
				}
			}
			queryAudit();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询审价列表by关键字
	 * @return
	 */
	public String queryAuditListByKeyword() {
		try {
			this.clearMessages();
			page = new Page();
			startIndex = 0;
			//显示值
			arrAuditShow = null;
			if("1".equals(strSetFlag)){
				//设定项目
				auditListDisp = new ArrayList<AuditListDisp>();
				String userid = (String) ActionContext.getContext().getSession().get(Constants.USER_ID);
				ConfigTabDto auditListDispConfig = configTabService.queryConfigTabByKey(Constants.CONFIG_TAB_AUDIT_DISP+"_"+userid, Constants.CONFIG_TAB_AUDIT_DISP);
				if(null != auditListDispConfig) {
					String auditListDispValue = auditListDispConfig.getCONFIG_VAL();
					if(StringUtils.isNotEmpty(auditListDispValue)) {
						String[] valArray = auditListDispValue.split(",");
						arrAuditShow = new String[valArray.length][2];
						int i = 0;
						for(String id : valArray) {
							arrAuditShow[i][0] = AuditListDispEnum.getNameByID(Integer.parseInt(id)).getEnName();
							arrAuditShow[i][1] = AuditListDispEnum.getNameByID(Integer.parseInt(id)).getCnName();
							i++;
						}
					} else {
						this.addActionMessage("请先设定显示列表！");
					}
				}
			}
			if(null == arrAuditShow || arrAuditShow.length <= 0){
				if("2".equals(strCntrctInfo)){
					arrAuditShow  = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
							{"DOC_REC_DATE", "资料收到日期"},{"REPORT_RAISE_DATE", "报告出具日期"},
							{"VERIFY_PER_AMOUNT", "送审价"},{"VERIFY_AMOUNT", "审核价"}};//咨询
				} else if("3".equals(strCntrctInfo)){
					arrAuditShow = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
						{"DOC_REC_DATE", "资料收到日期"},{"REPORT_RAISE_DATE", "报告出具日期"}};//清单编制
				} else if("4".equals(strCntrctInfo)){
					arrAuditShow = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
							{"DOC_REC_DATE", "资料收到日期"},{"REPORT_RAISE_DATE", "报告出具日期"},{"CNT_PRICE", "控制价金额"}};//控制价编制
				} else if("5".equals(strCntrctInfo)){
					arrAuditShow = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
							{"PRE_PRICE", "预算金额"},{"PROGRESS_STATUS_MEMO", "项目大致进程简述"}};//全过程投资监理
				} else {
					arrAuditShow = new String[][]{{"PROJECT_MANAGER","工程师"},{"REPORT_NO", "项目文号"},{"PROJECT_NAME", "项目名称"},
							{"DOC_REC_DATE", "资料收到日期"},{"APPROVAL_SND_DATE", "审定单发出日期"},{"REPORT_RAISE_DATE", "报告出具日期"},
							{"VERIFY_PER_AMOUNT", "送审价"},{"VERIFY_AMOUNT", "审核价"}};//审价
				}
			}
			queryAuditByKeyword();
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
	 * 翻页
	 * @return
	 */
	public String turnAuditByKeywordPage() {
		try {
			this.clearMessages();
			queryAuditByKeyword();
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
				strReportNo, strProjectName, strCntrctInfo, strCntYear);
		listAudit = (List<AuditDto>) page.getItems();
		this.setStartIndex(page.getStartIndex());
	}
	
	@SuppressWarnings("unchecked")
	private void queryAuditByKeyword() {
		listAudit = new ArrayList<AuditDto>();
		if(page == null) {
			page = new Page();
		}
		
		//翻页查询所有审价根据关键字
		this.page.setStartIndex(startIndex);
		page = auditService.queryAuditByPage(strKeyword,strProjectManager,strReportNo,strProjectName, strCntrctInfo, strCntYear, strAuditStatus, page);
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

	public String[][] getArrAuditShowSet() {
		return arrAuditShowSet;
	}

	public void setArrAuditShowSet(String[][] arrAuditShowSet) {
		this.arrAuditShowSet = arrAuditShowSet;
	}

	public String getStrSetFlag() {
		return strSetFlag;
	}

	public void setStrSetFlag(String strSetFlag) {
		this.strSetFlag = strSetFlag;
	}

	public String[][] getArrAuditShow() {
		return arrAuditShow;
	}

	public void setArrAuditShow(String[][] arrAuditShow) {
		this.arrAuditShow = arrAuditShow;
	}

	public String getStrKeyword() {
		return strKeyword;
	}

	public void setStrKeyword(String strKeyword) {
		this.strKeyword = strKeyword;
	}

	public String getStrKeywordFlag() {
		return strKeywordFlag;
	}

	public void setStrKeywordFlag(String strKeywordFlag) {
		this.strKeywordFlag = strKeywordFlag;
	}

	public AuditAnnualDataDto getAuditDataMonthSum() {
		return auditDataMonthSum;
	}

	public void setAuditDataMonthSum(AuditAnnualDataDto auditDataMonthSum) {
		this.auditDataMonthSum = auditDataMonthSum;
	}

	public List<AuditAnnualDataDto> getAuditDataMonthSum_1() {
		return auditDataMonthSum_1;
	}

	public void setAuditDataMonthSum_1(List<AuditAnnualDataDto> auditDataMonthSum_1) {
		this.auditDataMonthSum_1 = auditDataMonthSum_1;
	}

	public AuditAnnualDataDto getSumAuditAnnualData_1() {
		return sumAuditAnnualData_1;
	}

	public void setSumAuditAnnualData_1(AuditAnnualDataDto sumAuditAnnualData_1) {
		this.sumAuditAnnualData_1 = sumAuditAnnualData_1;
	}

	public List<AuditAnnualDataDto> getAuditDataMonthSum_2() {
		return auditDataMonthSum_2;
	}

	public void setAuditDataMonthSum_2(List<AuditAnnualDataDto> auditDataMonthSum_2) {
		this.auditDataMonthSum_2 = auditDataMonthSum_2;
	}

	public AuditAnnualDataDto getSumAuditAnnualData_2() {
		return sumAuditAnnualData_2;
	}

	public void setSumAuditAnnualData_2(AuditAnnualDataDto sumAuditAnnualData_2) {
		this.sumAuditAnnualData_2 = sumAuditAnnualData_2;
	}

	public List<AuditAnnualDataDto> getAuditDataMonthSum_4() {
		return auditDataMonthSum_4;
	}

	public void setAuditDataMonthSum_4(List<AuditAnnualDataDto> auditDataMonthSum_4) {
		this.auditDataMonthSum_4 = auditDataMonthSum_4;
	}

	public AuditAnnualDataDto getSumAuditAnnualData_4() {
		return sumAuditAnnualData_4;
	}

	public void setSumAuditAnnualData_4(AuditAnnualDataDto sumAuditAnnualData_4) {
		this.sumAuditAnnualData_4 = sumAuditAnnualData_4;
	}
	
	public String getStrCntYear() {
		return strCntYear;
	}

	public void setStrCntYear(String strCntYear) {
		this.strCntYear = strCntYear;
	}

}
