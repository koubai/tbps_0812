package com.cn.tbps.action;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.common.factory.Poi2007Base;
import com.cn.common.factory.PoiFactory;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.common.util.TbpsUtil;
import com.cn.tbps.dto.BidCompDto;
import com.cn.tbps.dto.BidDto;
import com.cn.tbps.dto.BidRptDto;
import com.cn.tbps.dto.ExpertLibDto;
import com.cn.tbps.dto.MajorDto;
import com.cn.tbps.dto.SuperviseLibDto;
import com.cn.tbps.dto.UserInfoDto;
import com.cn.tbps.service.AgentCompService;
import com.cn.tbps.service.BidCompApplyService;
import com.cn.tbps.service.BidCompService;
import com.cn.tbps.service.BidService;
import com.cn.tbps.service.ConfigTabService;
import com.cn.tbps.service.ExpertLibService;
import com.cn.tbps.service.MajorService;
import com.cn.tbps.service.SuperviseLibService;
import com.cn.tbps.service.UserInfoService;
import com.opensymphony.xwork2.ActionContext;

/**
 * @name BidAction.java
 * @author Frank
 * @time 2013-10-22下午10:38:00
 * @version 1.0
 */
public class BidAction extends BaseAction {

	private static final long serialVersionUID = 9187793131009663761L;
	
	private static final Logger log = LogManager.getLogger(BidAction.class);
	
	private BidService bidService;
	
	private SuperviseLibService superviseLibService;
	
	private BidCompService bidCompService;
	
	private BidCompApplyService bidCompApplyService;
	
	private ExpertLibService expertLibService;
	
	private AgentCompService agentCompService;
	
	private ConfigTabService configTabService;
	
	private UserInfoService userInfoService;
	
	private MajorService majorService;
	
	public boolean blBidCreateFlg = false;
	
	/**
	 * 页码
	 */
	private int startIndex;
	
	/**
	 * 翻页
	 */
	private Page page;
	
	/**
	 * 招标列表
	 */
	private List<BidDto> listBid;

	/**
	 * 招标列表(详细)
	 */
	private List<BidRptDto> listBidRpt;
	/**
	 * 查询条件-招标编号（起）
	 */
	private String strBidNoLow;
	
	/**
	 * 查询条件-招标编号（终）
	 */
	private String strBidNoHigh;
	
	/**
	 * 查询条件-项目名称
	 */
	private String strProjectName;
	
	/**
	 * 查询条件-分类
	 */
	private String strProjectType;
	
	/**
	 * 查询条件-开标日期（起）
	 */
	private String strOpenDateLow;
	
	/**
	 * 查询条件-开标日期（终）
	 */
	private String strOpenDateHigh;
	
	/**
	 * 查询条件-工程师
	 */
	private String strProjectManager;
	
	//新增
	/**
	 * 新增招标DTO
	 */
	private BidDto addBidDto;
	
	//投标公司列表
	private List<BidCompDto> listBidComp;
	//评审专家列表
	private List<ExpertLibDto> listExpertLib;
	//投标公司列表（临时）
	private List<BidCompDto> listBidCompTmp;
	//评审专家列表（临时）
	private List<ExpertLibDto> listExpertLibTmp;
	//查询就职公司信息
	private List<ExpertLibDto> listExpertComp;
	//所有专业
	private List<MajorDto> majorAllList;
	private List<MajorDto> major11List;
	private List<MajorDto> major21List;
	private List<MajorDto> major31List;
	private List<MajorDto> major41List;
	private List<MajorDto> major51List;
	
	//修改
	/**
	 * 修改招标编号
	 */
	private String updateBidNo;
	
	//显示TabIndex（取值1-8），默认显示第一个TAB页
	private String updBidTabIndex;
	
	private List<UserInfoDto> listUserInfo;
	
	private List<SuperviseLibDto> listSuperviseLib;
	
	/**
	 * 修改招标DTO
	 */
	private BidDto updateBidDto;
	
	/**
	 * 修改招标DTO（OLD提示修改内容用）
	 */
	private BidDto updateBidDtoOld;
	
	//删除
	/**
	 * 删除招标编号
	 */
	private String delBidNo;
	
	//招标公司编号
	private String strCompNo;
	
	//招标数据导出部分
	/**
	 * 标书费打印签收单
	 * @return
	 */
	public String exportBidSignAction() {
		try {
			this.clearMessages();
			String filename = "page/bidsign.xls";
			String name =  StringUtil.createFileName2(Constants.EXCEL_TYPE_ZBQS);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ZBQS);
			
			//查询数据
			List<BidDto> list = new ArrayList<BidDto>();
			list.add(updateBidDto);
			base.setDatas(list);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 导出标书费签收
	 * @return
	 */
	public String exportBidReceiveAction() {
		try {
			this.clearMessages();
			String filename = "page/bidreceive.xls";
			String name = StringUtil.createFileName2(Constants.EXCEL_TYPE_ZBSD);
			if (!StringUtil.isBlank(updateBidDto.getBID_NO()))
				name = StringUtil.createFileName2(updateBidDto.getBID_NO() + "-" + Constants.EXCEL_TYPE_ZBSD);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ZBSD);
			
			//查询数据
			List<Object> list = new ArrayList<Object>();
			list.add(updateBidDto);
			list.add(listBidComp);
			base.setDatas(list);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	
	/**
	 * 导出标书费收据
	 * @return
	 */
	public String exportBidBaseAction() {
		try {
			this.clearMessages();
			String filename = "page/bidbase.xls";
			String name = StringUtil.createFileName2(Constants.EXCEL_TYPE_ZBBS);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ZBBS);
			
			//查询数据
			List<Object> list = new ArrayList<Object>();
			list.add(updateBidDto);
			list.add(listBidComp);
			base.setDatas(list);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 导出招标保证金退定
	 * @return
	 */
	public String exportBidCancelAction() {
		try {
			this.clearMessages();
			String filename = "page/bidcancel.xls";
			String name =  StringUtil.createFileName2(Constants.EXCEL_TYPE_ZBTD);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ZBTD);
			
			//查询数据
			//List<BidDto> list = new ArrayList<BidDto>();
			List<Object> list = new ArrayList<Object>();
			list.add(updateBidDto);
			list.add(listBidComp);
			base.setDatas(list);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 导出招标保证金收据
	 * @return
	 */
	public String exportBidDepositAction() {
		try {
			this.clearMessages();
			String filename = "page/biddeposit.xls";
			String name = StringUtil.createFileName2(Constants.EXCEL_TYPE_ZBBZJ);
			if (!StringUtil.isBlank(updateBidDto.getBID_NO()))
				name = StringUtil.createFileName2(updateBidDto.getBID_NO() + "-" + Constants.EXCEL_TYPE_ZBBZJ);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ZBBZJ);
			
			//查询数据
			List<Object> list = new ArrayList<Object>();
			list.add(updateBidDto);
			list.add(listBidComp);
			base.setDatas(list);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 导出招标报名表（单个公司报名表）
	 * @return
	 */
	public String exportSingleBidRegisterAction() {
		try {
			this.clearMessages();
			String filename = "page/bidregister.xlsx";
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_ZBBM);
			if (!StringUtil.isBlank(updateBidDto.getBID_NO()))
				name = StringUtil.createFileName(updateBidDto.getBID_NO() + "-" + Constants.EXCEL_TYPE_ZBBM);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ZBBM);
			
			//查询数据
			List<Object> list = new ArrayList<Object>();
			list.add(updateBidDto);
			List<BidCompDto> compList = new ArrayList<BidCompDto>();
			BidCompDto bidComp = bidCompService.queryAllBidCompByID(strCompNo);
			if(bidComp != null) {
				compList.add(bidComp);
			}
			list.add(compList);
			base.setDatas(list);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
			
			//更新报名表日期
			updateBidDto.setGEN_REGISTE_RPT_DATE(new Date());
			bidService.updateBid(updateBidDto);
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 导出招标报名表回执
	 * @return
	 */
	public String exportBidReplyAction() {
		try {
			this.clearMessages();
			String filename = "page/bidreply.xls";
			String name = StringUtil.createFileName2(Constants.EXCEL_TYPE_ZBHZ);
			if (!StringUtil.isBlank(updateBidDto.getBID_NO()))
				name = StringUtil.createFileName2(updateBidDto.getBID_NO() + "-" + Constants.EXCEL_TYPE_ZBHZ);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ZBHZ);
			
			//查询数据
			List<BidDto> list = new ArrayList<BidDto>();
			list.add(updateBidDto);
			base.setDatas(list);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 导出招标报名表（所有公司报名表）
	 * @return
	 */
	public String exportBidRegisterAction() {
		try {
			this.clearMessages();
			String filename = "page/bidregister.xlsx";
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_ZBBM);
			if (!StringUtil.isBlank(updateBidDto.getBID_NO()))
				name = StringUtil.createFileName(updateBidDto.getBID_NO() + "-" + Constants.EXCEL_TYPE_ZBBM);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ZBBM);
			
			//查询数据
			List<Object> list = new ArrayList<Object>();
			list.add(updateBidDto);
			list.add(listBidComp);
			base.setDatas(list);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
			
			//更新报名表日期
			updateBidDto.setGEN_REGISTE_RPT_DATE(new Date());
			bidService.updateBid(updateBidDto);
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 导出招标审核表
	 * @return
	 */
	public String exportBidAuditAction() {
		try {
			this.clearMessages();
			String filename = "page/bidaudit.xlsx";
			String name =  StringUtil.createFileName(Constants.EXCEL_TYPE_ZBSH);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ZBSH);
			
			//查询数据
			List<Object> list = new ArrayList<Object>();
			//报名内容
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bidCompApplyService", bidCompApplyService);
			list.add(updateBidDto);
			list.add(listBidComp);
			base.setMap(map);
			base.setDatas(list);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
			
			//更新报名表日期
			updateBidDto.setGEN_VERIFY_RPT_DATE(new Date());
			bidService.updateBid(updateBidDto);
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 导出招标信息列表
	 * @return
	 */
	public String exportBidListAction() {
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_ZBYL);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ZBYL);
			
			//查询数据
			List<BidDto> list = bidService.queryAllBidExport("", "", "", "", "", strProjectName, strBidNoLow, strBidNoHigh,
					"", "", "", "", "", "", "",strProjectManager);
			
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_ZBYL);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示添加招标页面
	 * @return
	 */
	public String showAddBidAction() {
		try {
			if (blBidCreateFlg == false)
				this.clearMessages();
			blBidCreateFlg = false;
			listBidComp = new ArrayList<BidCompDto>();
			listExpertLib = new ArrayList<ExpertLibDto>();
			listBidCompTmp = new ArrayList<BidCompDto>();
			listExpertLibTmp = new ArrayList<ExpertLibDto>();
			
			listUserInfo = userInfoService.queryAllUser();
			listSuperviseLib = superviseLibService.queryAllSuperviseLib();
			//查询就职公司信息
			listExpertComp = expertLibService.queryExpertComp();
			//所有专业数据
			majorAllList = majorService.queryAllMajor("", "");
			major11List = majorService.queryAllMajor("1", "");
			major21List = majorService.queryAllMajor("1", "");
			major31List = majorService.queryAllMajor("1", "");
			major41List = majorService.queryAllMajor("1", "");
			major51List = majorService.queryAllMajor("1", "");
			
			addBidDto = new BidDto();
			//默认为不随机
//			addBidDto.setIS_RANDOM("0");
			addBidDto.setSTATUS("10");
			//承接项目日期默认=当天
			addBidDto.setPROJECT_DEVIEW_DATE(new Date());
			String userid = (String) ActionContext.getContext().getSession().get(Constants.USER_ID);
			//默认专家费申请人=当前用户
			addBidDto.setBID_EXPERT_COMMISION_APPLY(userid);
			//默认评审人=当前用户
			addBidDto.setBID_AUTH(userid);
			//标书费金额默认0.1万元
			addBidDto.setBID_APPLY_PRICE(TbpsUtil.bigDecimal2str(new BigDecimal(0.1).setScale(6, BigDecimal.ROUND_HALF_UP)));
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 添加招标
	 * @return
	 */
	public String addBidAction() {
		try {
			this.clearMessages();
			listUserInfo = userInfoService.queryAllUser();
			listSuperviseLib = superviseLibService.queryAllSuperviseLib();
			
			listBidComp = listBidCompTmp;
			listExpertLib = listExpertLibTmp;
			listBidCompTmp = new ArrayList<BidCompDto>();
			listExpertLibTmp = new ArrayList<ExpertLibDto>();
			//查询就职公司信息
			listExpertComp = expertLibService.queryExpertComp();
			//所有专业数据
			majorAllList = majorService.queryAllMajor("", "");
			major11List = majorService.queryAllMajor("1", "");
			major21List = majorService.queryAllMajor("1", "");
			major31List = majorService.queryAllMajor("1", "");
			major41List = majorService.queryAllMajor("1", "");
			major51List = majorService.queryAllMajor("1", "");
			//数据校验
			if(!checkUpdData(addBidDto)) {
				return "checkerror";
			}
			
			//分类=招标办，则校验招标编号是否存在
			if("3".equals(addBidDto.getCNTRCT_TYPE())) {
				//分类=招标办，则校验招标编号是否存在
				BidDto bid = bidService.queryAllBidByID2(addBidDto.getBID_NO());
				if(bid != null) {
					this.addActionMessage("招标编号" + addBidDto.getBID_NO() + "已经存在！");
					return "checkerror";
				}
			} else {
				if("0".equals(addBidDto.getIS_RANDOM())) {
					//非随机生成招标编号
					BidDto bid = bidService.queryAllBidByID2(addBidDto.getBID_NO());
					if(bid != null) {
						this.addActionMessage("招标编号" + addBidDto.getBID_NO() + "已经存在！");
						return "checkerror";
					}
				}
			}
			
			//保存数据
			addBidDto.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
			//投标状态=报名
			addBidDto.setSTATUS("10");
			//默认状态=20进行中
			addBidDto.setFINISH_STATUS(Constants.FINISH_STATUS_IN_PROCESS);
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			addBidDto.setUPDATE_USER(username);
			
			//预借专家费单位元转化为万元
			if(addBidDto.getBID_EXPERT_COMMISION_PRE_YUAN() != null) {
				addBidDto.setBID_EXPERT_COMMISION_PRE(
						TbpsUtil.bigDecimal2str(addBidDto.getBID_EXPERT_COMMISION_PRE_YUAN().divide(new BigDecimal(10000)).setScale(6, BigDecimal.ROUND_HALF_EVEN)));
			} else {
				addBidDto.setBID_EXPERT_COMMISION_PRE(null);
			}
			//实际专家费单位元转化为万元
			if(addBidDto.getBID_EXPERT_COMMISION_ACT_YUAN() != null) {
				addBidDto.setBID_EXPERT_COMMISION_ACT(
						TbpsUtil.bigDecimal2str(addBidDto.getBID_EXPERT_COMMISION_ACT_YUAN().divide(new BigDecimal(10000)).setScale(6, BigDecimal.ROUND_HALF_EVEN)));
			} else {
				addBidDto.setBID_EXPERT_COMMISION_ACT(null);
			}

			//承接项目日期默认=当天
			addBidDto.setPROJECT_DEVIEW_DATE(new Date());
			String userid = (String) ActionContext.getContext().getSession().get(Constants.USER_ID);
			//默认专家费申请人=项目工程师，否则为当前用户
			if (addBidDto.getPROJECT_MANAGER()!= null && addBidDto.getPROJECT_MANAGER()!="")
				addBidDto.setBID_EXPERT_COMMISION_APPLY(addBidDto.getPROJECT_MANAGER());
			else
				addBidDto.setBID_EXPERT_COMMISION_APPLY(userid);
			//默认评审人=项目工程师，否则为当前用户
			if (addBidDto.getPROJECT_MANAGER()!= null && addBidDto.getPROJECT_MANAGER()!="")
				addBidDto.setBID_AUTH(addBidDto.getPROJECT_MANAGER());
			else
				addBidDto.setBID_AUTH(userid);
			//标书费金额默认0.1万元
			addBidDto.setBID_APPLY_PRICE(TbpsUtil.bigDecimal2str(new BigDecimal(0.1).setScale(6, BigDecimal.ROUND_HALF_UP)));			
			
			String bidNo = bidService.insertBidNew(addBidDto, listBidComp, listExpertLib);
			this.addActionMessage("新增招标记录成功！招标编号：" + bidNo);
			//初始化数据
			addBidDto = new BidDto();
			//默认为不随机
//			addBidDto.setIS_RANDOM("0");
			addBidDto.setSTATUS("0");
			listBidComp = new ArrayList<BidCompDto>();
			listExpertLib = new ArrayList<ExpertLibDto>();
			
			blBidCreateFlg = true;
			response.sendRedirect("../bid/showUpdBidAction.action?updateBidNo=" + bidNo);
		} catch(RuntimeException e) {
			//运行异常
			this.addActionMessage(e.getMessage());
			log.error("addBidAction error:" + e);
			return "checkerror";
		} catch(Exception e) {
			this.addActionMessage("系统异常，添加招标失败！");
			log.error("addBidAction error:" + e);
			return "checkerror";
		}
		return SUCCESS;
	}
	
	/**
	 * 显示修改招标页面
	 * @return
	 */
	public String showUpdBidAction() {
		try {
			if (blBidCreateFlg == false)
				this.clearMessages();
			if (updBidTabIndex == null || updBidTabIndex.equals(""))
				updBidTabIndex = "1";
			
			updateBidDto = bidService.queryAllBidByID(updateBidNo);
			if(updateBidDto == null) {
				this.addActionMessage("该数据不存在！");
				return "checkerror";
			}
			
			listBidCompTmp = new ArrayList<BidCompDto>();
			listExpertLibTmp = new ArrayList<ExpertLibDto>();
			listUserInfo = userInfoService.queryAllUser();
			listSuperviseLib = superviseLibService.queryAllSuperviseLib();
			//查询就职公司信息
			listExpertComp = expertLibService.queryExpertComp();
			//所有专业数据
			majorAllList = majorService.queryAllMajor("", "");
			major11List = majorService.queryAllMajor("1", "");
			major21List = majorService.queryAllMajor("1", "");
			major31List = majorService.queryAllMajor("1", "");
			major41List = majorService.queryAllMajor("1", "");
			major51List = majorService.queryAllMajor("1", "");
			
			//查询招标公司列表
			listBidComp = bidCompService.queryAllBidCompExport(updateBidNo, "", "");
			//查询专家列表
			listExpertLib = expertLibService.queryExpertLibByIds(updateBidDto.getBID_EXPERT_LIST());
		} catch(Exception e) {
			this.addActionMessage("系统错误，查询招标异常！");
			log.error("showUpdBidAction error:" + e);
			return "checkerror";
		}
		return SUCCESS;
	}
	
	/**
	 * 修改招标
	 * @return
	 */
	public String updBidAction() {
		try {
			this.clearMessages();
			listUserInfo = userInfoService.queryAllUser();
			listSuperviseLib = superviseLibService.queryAllSuperviseLib();
			listBidComp = listBidCompTmp;
			listExpertLib = listExpertLibTmp;
			listBidCompTmp = new ArrayList<BidCompDto>();
			listExpertLibTmp = new ArrayList<ExpertLibDto>();
			//查询就职公司信息
			listExpertComp = expertLibService.queryExpertComp();
			//所有专业数据
			majorAllList = majorService.queryAllMajor("", "");
			major11List = majorService.queryAllMajor("1", "");
			major21List = majorService.queryAllMajor("1", "");
			major31List = majorService.queryAllMajor("1", "");
			major41List = majorService.queryAllMajor("1", "");
			major51List = majorService.queryAllMajor("1", "");
			//数据校验
			if(!checkUpdData(updateBidDto)) {
				return "checkerror";
			}
			//修改数据
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			updateBidDto.setUPDATE_USER(username);			
//			if (listExpertLib.size() != 0 && updateBidDto.getBID_EXPERT_NOTIFY_DATE()== null){
//				updateBidDto.setBID_EXPERT_NOTIFY_DATE(new Date());
//			}
			
			//预借专家费单位元转化为万元
			if(updateBidDto.getBID_EXPERT_COMMISION_PRE_YUAN() != null) {
				updateBidDto.setBID_EXPERT_COMMISION_PRE(
						TbpsUtil.bigDecimal2str(updateBidDto.getBID_EXPERT_COMMISION_PRE_YUAN().divide(new BigDecimal(10000)).setScale(6, BigDecimal.ROUND_HALF_UP)));
			} else {
				updateBidDto.setBID_EXPERT_COMMISION_PRE(null);
			}
			if(updateBidDto.getBID_EXPERT_COMMISION_PRE_YUAN2() != null) {
				updateBidDto.setBID_EXPERT_COMMISION_PRE2(
						TbpsUtil.bigDecimal2str(updateBidDto.getBID_EXPERT_COMMISION_PRE_YUAN2().divide(new BigDecimal(10000)).setScale(6, BigDecimal.ROUND_HALF_UP)));
			} else {
				updateBidDto.setBID_EXPERT_COMMISION_PRE2(null);
			}
			if(updateBidDto.getBID_EXPERT_COMMISION_PRE_YUAN3() != null) {
				updateBidDto.setBID_EXPERT_COMMISION_PRE3(
						TbpsUtil.bigDecimal2str(updateBidDto.getBID_EXPERT_COMMISION_PRE_YUAN3().divide(new BigDecimal(10000)).setScale(6, BigDecimal.ROUND_HALF_UP)));
			} else {
				updateBidDto.setBID_EXPERT_COMMISION_PRE3(null);
			}
			//实际专家费单位元转化为万元
			if(updateBidDto.getBID_EXPERT_COMMISION_ACT_YUAN() != null) {
				updateBidDto.setBID_EXPERT_COMMISION_ACT(
						TbpsUtil.bigDecimal2str(updateBidDto.getBID_EXPERT_COMMISION_ACT_YUAN().divide(new BigDecimal(10000)).setScale(6, BigDecimal.ROUND_HALF_UP)));
			} else {
				updateBidDto.setBID_EXPERT_COMMISION_ACT(null);
			}
			if(updateBidDto.getBID_EXPERT_COMMISION_ACT_YUAN2() != null) {
				updateBidDto.setBID_EXPERT_COMMISION_ACT2(
						TbpsUtil.bigDecimal2str(updateBidDto.getBID_EXPERT_COMMISION_ACT_YUAN2().divide(new BigDecimal(10000)).setScale(6, BigDecimal.ROUND_HALF_UP)));
			} else {
				updateBidDto.setBID_EXPERT_COMMISION_ACT2(null);
			}
			if(updateBidDto.getBID_EXPERT_COMMISION_ACT_YUAN3() != null) {
				updateBidDto.setBID_EXPERT_COMMISION_ACT3(
						TbpsUtil.bigDecimal2str(updateBidDto.getBID_EXPERT_COMMISION_ACT_YUAN3().divide(new BigDecimal(10000)).setScale(6, BigDecimal.ROUND_HALF_UP)));
			} else {
				updateBidDto.setBID_EXPERT_COMMISION_ACT3(null);
			}
			
			bidService.updateBidNew(updateBidDto, listBidComp, listExpertLib);
			this.addActionMessage("修改招标成功！");
			updateBidDtoOld = bidService.queryAllBidByID(updateBidNo);
			
			//查询招标公司列表
			listBidComp = bidCompService.queryBidCompByIds(updateBidDto.getBID_CO_LIST());
			//查询专家列表
			listExpertLib = expertLibService.queryExpertLibByIds(updateBidDto.getBID_EXPERT_LIST());
		} catch(Exception e) {
			this.addActionMessage("系统异常，修改招标失败！");
			log.error("updBidAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 删除招标
	 * @return
	 */
	public String delBidAction() {
		try {
			this.clearMessages();
			if(StringUtil.isBlank(delBidNo)) {
				this.addActionMessage("招标编号为空！");
				return "checkerror";
			}
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			//删除
			bidService.deleteBid(delBidNo, username);
			this.addActionMessage("删除招标成功！");
			delBidNo = "";
			//刷新页面
			startIndex = 0;
			queryBid();
		} catch(Exception e) {
			log.error("delBidAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示招标管理页面
	 * @return
	 */
	public String showBidAction() {
		try {
			this.clearMessages();
			//初期化
			strBidNoLow = "";
			strBidNoHigh = "";
			strProjectName = "";
			
			strProjectType = "";
			strOpenDateLow = "";
			strOpenDateHigh = "";
			updBidTabIndex = "";
			page = new Page();
			startIndex = 0;
			listBid = new ArrayList<BidDto>();
			addBidDto = new BidDto();
			updateBidNo = "";
			updateBidDto = new BidDto();
			updateBidDtoOld = new BidDto();
			delBidNo = "";
			listUserInfo = userInfoService.queryAllUser();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询招标列表
	 * @return
	 */
	public String queryBidList() {
		try {
			this.clearMessages();
			page = new Page();
			startIndex = 0;

			queryBid();
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
	public String turnBidPage() {
		try {
			this.clearMessages();
			queryBid();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 翻页查询招标列表
	 */
	@SuppressWarnings("unchecked")
	private void queryBid() {
		updBidTabIndex = "";
		listBid = new ArrayList<BidDto>();
		if(page == null) {
			page = new Page();
		}
		
		//翻页查询所有招标
		this.page.setStartIndex(startIndex);
		bidService.queryBidAndBidCntrctByPage("", "", "", "", "", strProjectName, strBidNoLow, strBidNoHigh,
				"", "", "", "", "", "", "", "", "", strProjectManager, "", page);
		listBid = (List<BidDto>) page.getItems();
		this.setStartIndex(page.getStartIndex());
	}
	
	/**
	 * 验证数据格式（更新操作）
	 * @param bid
	 * @return
	 */
	private boolean checkUpdData(BidDto bid) {
		if(StringUtil.isBlank(bid.getCNTRCT_NO())) {
			this.addActionMessage("合同编号不能为空！");
			return false;
		}
		if("3".equals(bid.getCNTRCT_TYPE())) {
			//分类=招标办,招标编号为自己输入
			if(StringUtil.isBlank(bid.getBID_NO())) {
				this.addActionMessage("招标编号不能为空！");
				return false;
			}
		} else {
			if("0".equals(bid.getIS_RANDOM())) {
				//非随机生成招标编号
				if(StringUtil.isBlank(bid.getBID_NO())) {
					this.addActionMessage("招标编号不能为空！");
					return false;
				}
			}
		}
		if(StringUtil.isBlank(bid.getPROJECT_NAME())) {
			this.addActionMessage("项目名称不能为空！");
			return false;
		}
		return true;
	}
	
	/**
	 * 验证数据格式
	 * @param bid
	 * @param status
	 * @return
	 */
	private boolean checkAddBidData(BidDto bid, String status) {
//		if("10".equals(status)) {
//		//新增
//			if("0".equals(bid.getIS_RANDOM())) {
//				//非随机生成招标编号时
//				if("1".equals(bid.getPROJECT_TYPE()) || "2".equals(bid.getPROJECT_TYPE())|| "4".equals(bid.getPROJECT_TYPE())) {
//					//分类=比选,招标时，招标编号不能为空
//					if(StringUtil.isBlank(bid.getBID_NO())) {
//						this.addActionMessage("招标编号不能为空！");
//						return false;
//					}
//				}
//				//验证招标编号格式是否正确
//				if("1".equals(bid.getPROJECT_TYPE())) {
//					//分类=比选,招标时，招标编号不能为空
//					if(!StringUtil.isZB(bid.getBID_NO())) {
//						this.addActionMessage("招标编号格式不正确，应为：LHZB-YY-NNN！");
//						return false;
//					}
//				}
//				//验证招标编号格式是否正确
//				if("2".equals(bid.getPROJECT_TYPE())) {
//					//分类=比选,招标时，招标编号不能为空
//					if(!StringUtil.isBX(bid.getBID_NO())) {
//						this.addActionMessage("招标编号格式不正确，应为：LHBX-YY-NNN！");
//						return false;
//					}
//				}
//				//验证招标编号格式是否正确
//				if("4".equals(bid.getPROJECT_TYPE())) {
//					//分类=竞价,招标时，招标编号不能为空
//					if(!StringUtil.isJJ(bid.getBID_NO())) {
//						this.addActionMessage("招标编号格式不正确，应为：LHJJ-YY-NNN！");
//						return false;
//					}
//				}
//			}
//			if("3".equals(bid.getPROJECT_TYPE())) {
//				//分类=招标办时，招标编号不能为空
//				if(StringUtil.isBlank(bid.getBID_NO())) {
//					this.addActionMessage("招标编号不能为空！");
//					return false;
//				}
//			}
//			if(StringUtil.isBlank(bid.getPROJECT_TYPE())) {
//				this.addActionMessage("请选择分类！");
//				return false;
//			}
//			if(!"1".equals(bid.getPROJECT_TYPE()) && !"2".equals(bid.getPROJECT_TYPE()) && !"3".equals(bid.getPROJECT_TYPE())&& !"4".equals(bid.getPROJECT_TYPE())) {
//				this.addActionMessage("请选择分类！");
//				return false;
//			}
//			if(StringUtil.isBlank(bid.getPROJECT_NAME())) {
//				this.addActionMessage("项目名称不能为空！");
//				return false;
//			}
//		} else if("20".equals(status)) {
//			//报名
//		} else if("30".equals(status)) {
//			//保证金
//		} else if("40".equals(status)) {
//			//开标评标
//		} else if("50".equals(status)) {
//			//资料归档
//		}
		return true;
	}
	
	// 数据源导出
	public String exportBidDataRptAction(){
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_BIDDATAREPORT);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_BIDDATAREPORT);
			
			listBidRpt = bidService.queryAllBidDetailExport(
					"", "", "",
					"", "", "", strBidNoLow, strBidNoHigh,
					"", "", "", "", "",
					"", "");
			
			base.setDatas(listBidRpt);
			base.setSheetName(Constants.EXCEL_TYPE_BIDDATAREPORT);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
		
	}
	
	// 工程师模板数据导出
	public String exportBidEngineerRptAction(){
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_BIDENGINEERREPORT);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_BIDENGINEERREPORT);
			
			listBidRpt = bidService.queryAllBidDetailExport(
					"", "", "",
					"", "", "", strBidNoLow, strBidNoHigh,
					"", "", "", "", "",
					"", "");
			
			base.setDatas(listBidRpt);
			base.setSheetName(Constants.EXCEL_TYPE_BIDENGINEERREPORT);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}

	// 财务模板数据导出
	public String exportBidAccountRptAction(){
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_BIDACCOUNTREPORT);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_BIDACCOUNTREPORT);
			
			listBidRpt = bidService.queryAllBidDetailExport(
					"", "", "",
					"", "", "", strBidNoLow, strBidNoHigh,
					"", "", "", "", "",
					"", "");
			
			base.setDatas(listBidRpt);
			base.setSheetName(Constants.EXCEL_TYPE_BIDACCOUNTREPORT);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	// 内业模板数据导出
	public String exportBidNeiyeRptAction(){
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_BIDNEIYEREPORT);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_BIDNEIYEREPORT);
			
			listBidRpt = bidService.queryAllBidDetailExport(
					"", "", "",
					"", "", "", strBidNoLow, strBidNoHigh,
					"", "", "", "", "",
					"", "");
			
			base.setDatas(listBidRpt);
			base.setSheetName(Constants.EXCEL_TYPE_BIDNEIYEREPORT);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/////////////////////////////////////////////
	/**
	 * 显示招标项目进展一览页面
	 * @return
	 */
	public String showBidProgressAction() {
		try {
			this.clearMessages();
			//初期化
			strBidNoLow = "";
			strBidNoHigh = "";
			strProjectName = "";
			
			strProjectType = "";
			strOpenDateLow = "";
			strOpenDateHigh = "";
			updBidTabIndex = "";
			page = new Page();
			startIndex = 0;
			listBid = new ArrayList<BidDto>();
			addBidDto = new BidDto();
			updateBidNo = "";
			updateBidDto = new BidDto();
			updateBidDtoOld = new BidDto();
			delBidNo = "";
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询招标进展列表
	 * @return
	 */
	public String queryBidProgressList() {
		try {
			this.clearMessages();
			page = new Page();
			startIndex = 0;
			queryBid();
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
	public String turnBidProgressPage() {
		try {
			this.clearMessages();
			queryBid();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	/////////////////////////////////////////////
	
	public BidService getBidService() {
		return bidService;
	}

	public void setBidService(BidService bidService) {
		this.bidService = bidService;
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

	public List<BidDto> getListBid() {
		return listBid;
	}

	public void setListBid(List<BidDto> listBid) {
		this.listBid = listBid;
	}

	public String getStrBidNoLow() {
		return strBidNoLow;
	}

	public void setStrBidNoLow(String strBidNoLow) {
		this.strBidNoLow = strBidNoLow;
	}

	public String getStrBidNoHigh() {
		return strBidNoHigh;
	}

	public void setStrBidNoHigh(String strBidNoHigh) {
		this.strBidNoHigh = strBidNoHigh;
	}

	public String getStrProjectType() {
		return strProjectType;
	}

	public void setStrProjectType(String strProjectType) {
		this.strProjectType = strProjectType;
	}

	public String getStrOpenDateLow() {
		return strOpenDateLow;
	}

	public void setStrOpenDateLow(String strOpenDateLow) {
		this.strOpenDateLow = strOpenDateLow;
	}

	public String getStrOpenDateHigh() {
		return strOpenDateHigh;
	}

	public void setStrOpenDateHigh(String strOpenDateHigh) {
		this.strOpenDateHigh = strOpenDateHigh;
	}

	public BidDto getAddBidDto() {
		return addBidDto;
	}

	public void setAddBidDto(BidDto addBidDto) {
		this.addBidDto = addBidDto;
	}

	public String getUpdateBidNo() {
		return updateBidNo;
	}

	public void setUpdateBidNo(String updateBidNo) {
		this.updateBidNo = updateBidNo;
	}

	public BidDto getUpdateBidDto() {
		return updateBidDto;
	}

	public void setUpdateBidDto(BidDto updateBidDto) {
		this.updateBidDto = updateBidDto;
	}

	public String getDelBidNo() {
		return delBidNo;
	}

	public void setDelBidNo(String delBidNo) {
		this.delBidNo = delBidNo;
	}


	public BidCompService getBidCompService() {
		return bidCompService;
	}

	public void setBidCompService(BidCompService bidCompService) {
		this.bidCompService = bidCompService;
	}

	public AgentCompService getAgentCompService() {
		return agentCompService;
	}


	public void setAgentCompService(AgentCompService agentCompService) {
		this.agentCompService = agentCompService;
	}

	public BidDto getUpdateBidDtoOld() {
		return updateBidDtoOld;
	}

	public void setUpdateBidDtoOld(BidDto updateBidDtoOld) {
		this.updateBidDtoOld = updateBidDtoOld;
	}

	public ConfigTabService getConfigTabService() {
		return configTabService;
	}

	public void setConfigTabService(ConfigTabService configTabService) {
		this.configTabService = configTabService;
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public BidCompApplyService getBidCompApplyService() {
		return bidCompApplyService;
	}

	public void setBidCompApplyService(BidCompApplyService bidCompApplyService) {
		this.bidCompApplyService = bidCompApplyService;
	}

	public ExpertLibService getExpertLibService() {
		return expertLibService;
	}

	public void setExpertLibService(ExpertLibService expertLibService) {
		this.expertLibService = expertLibService;
	}

	public MajorService getMajorService() {
		return majorService;
	}

	public void setMajorService(MajorService majorService) {
		this.majorService = majorService;
	}

	public String getStrProjectName() {
		return strProjectName;
	}

	public void setStrProjectName(String strProjectName) {
		this.strProjectName = strProjectName;
	}

	public List<UserInfoDto> getListUserInfo() {
		return listUserInfo;
	}

	public void setListUserInfo(List<UserInfoDto> listUserInfo) {
		this.listUserInfo = listUserInfo;
	}

	public List<BidCompDto> getListBidComp() {
		return listBidComp;
	}

	public void setListBidComp(List<BidCompDto> listBidComp) {
		this.listBidComp = listBidComp;
	}

	public List<ExpertLibDto> getListExpertLib() {
		return listExpertLib;
	}

	public void setListExpertLib(List<ExpertLibDto> listExpertLib) {
		this.listExpertLib = listExpertLib;
	}

	public List<BidCompDto> getListBidCompTmp() {
		return listBidCompTmp;
	}

	public void setListBidCompTmp(List<BidCompDto> listBidCompTmp) {
		this.listBidCompTmp = listBidCompTmp;
	}

	public List<ExpertLibDto> getListExpertLibTmp() {
		return listExpertLibTmp;
	}

	public void setListExpertLibTmp(List<ExpertLibDto> listExpertLibTmp) {
		this.listExpertLibTmp = listExpertLibTmp;
	}

	public SuperviseLibService getSuperviseLibService() {
		return superviseLibService;
	}

	public void setSuperviseLibService(SuperviseLibService superviseLibService) {
		this.superviseLibService = superviseLibService;
	}

	public List<SuperviseLibDto> getListSuperviseLib() {
		return listSuperviseLib;
	}

	public void setListSuperviseLib(List<SuperviseLibDto> listSuperviseLib) {
		this.listSuperviseLib = listSuperviseLib;
	}

	public String getStrCompNo() {
		return strCompNo;
	}

	public void setStrCompNo(String strCompNo) {
		this.strCompNo = strCompNo;
	}

	public List<ExpertLibDto> getListExpertComp() {
		return listExpertComp;
	}

	public void setListExpertComp(List<ExpertLibDto> listExpertComp) {
		this.listExpertComp = listExpertComp;
	}

	public List<MajorDto> getMajorAllList() {
		return majorAllList;
	}

	public void setMajorAllList(List<MajorDto> majorAllList) {
		this.majorAllList = majorAllList;
	}

	public List<MajorDto> getMajor11List() {
		return major11List;
	}

	public void setMajor11List(List<MajorDto> major11List) {
		this.major11List = major11List;
	}

	public List<MajorDto> getMajor21List() {
		return major21List;
	}

	public void setMajor21List(List<MajorDto> major21List) {
		this.major21List = major21List;
	}

	public List<MajorDto> getMajor31List() {
		return major31List;
	}

	public void setMajor31List(List<MajorDto> major31List) {
		this.major31List = major31List;
	}

	public List<MajorDto> getMajor41List() {
		return major41List;
	}

	public void setMajor41List(List<MajorDto> major41List) {
		this.major41List = major41List;
	}

	public List<MajorDto> getMajor51List() {
		return major51List;
	}

	public void setMajor51List(List<MajorDto> major51List) {
		this.major51List = major51List;
	}

	public String getUpdBidTabIndex() {
		return updBidTabIndex;
	}

	public void setUpdBidTabIndex(String updBidTabIndex) {
		this.updBidTabIndex = updBidTabIndex;
	}

	public List<BidRptDto> getListBidRpt() {
		return listBidRpt;
	}

	public void setListBidRpt(List<BidRptDto> listBidRpt) {
		this.listBidRpt = listBidRpt;
	}
	
	public String getStrProjectManager() {
		return strProjectManager;
	}

	public void setStrProjectManager(String strProjectManager) {
		this.strProjectManager = strProjectManager;
	}


}
