package com.cn.tbps.action;

import java.util.ArrayList;
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
import com.cn.tbps.dto.AgentCompDto;
import com.cn.tbps.dto.BidCompApplyDto;
import com.cn.tbps.dto.BidCompDto;
import com.cn.tbps.dto.BidCompExportDto;
import com.cn.tbps.dto.BidDto;
import com.cn.tbps.dto.BidExpertDto;
import com.cn.tbps.dto.BidExtendDto;
import com.cn.tbps.dto.BidHistDto;
import com.cn.tbps.dto.ConfigTabDto;
import com.cn.tbps.dto.ExpertLibDto;
import com.cn.tbps.dto.MajorDto;
import com.cn.tbps.dto.UserInfoDto;
import com.cn.tbps.service.AgentCompService;
import com.cn.tbps.service.BidCompApplyService;
import com.cn.tbps.service.BidCompService;
import com.cn.tbps.service.BidService;
import com.cn.tbps.service.ConfigTabService;
import com.cn.tbps.service.ExpertLibService;
import com.cn.tbps.service.MajorService;
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
	
	private BidCompService bidCompService;
	
	private BidCompApplyService bidCompApplyService;
	
	private ExpertLibService expertLibService;
	
	private AgentCompService agentCompService;
	
	private ConfigTabService configTabService;
	
	private UserInfoService userInfoService;
	
	private MajorService majorService;
	
	//招标履历
	/**
	 * 页码
	 */
	private int startIndexHist;
	
	/**
	 * 翻页
	 */
	private Page pageHist;
	
	/**
	 * 招标履历列表
	 */
	private List<BidHistDto> listBidHist;
	
	/**
	 * 招标履历查询条件-招标编号
	 */
	private String strBidNoHist;
	
	//招标
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
	 * 投标状态
	 */
	private String strBidStatus;
	
	/**
	 * 查询条件-招标编号（起）
	 */
	private String strBidNoLow;
	
	/**
	 * 查询条件-招标编号（终）
	 */
	private String strBidNoHigh;
	
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
	 * 查询条件-委托公司代码
	 */
	private String strAgentNo;
	
	/**
	 * 查询条件-委托公司名称
	 */
	private String strAgentName;
	
	/**
	 * 查询条件-中标单位
	 */
	private String strBidCoName;
	
	/**
	 * 查询条件-发票编号
	 */
	private String strReceipt1No;
	
	/**
	 * 新增招标DTO
	 */
	private BidDto addBidDto;
	
	/**
	 * 修改招标编号
	 */
	private String updateBidNo;
	
	/**
	 * 修改招标DTO
	 */
	private BidDto updateBidDto;
	
	/**
	 * 修改招标DTO（OLD提示修改内容用）
	 */
	private BidDto updateBidDtoOld;
	
	/**
	 * 删除招标编号
	 */
	private String delBidNo;
	
	/**
	 * 招标编号（专家信息导出）
	 */
	private String exportExpertBidNo;
	
	/**
	 * 投标公司列表
	 */
	private List<BidCompDto> listBidComp;
	
	/**
	 * 评审专家列表
	 */
	private List<ExpertLibDto> listExpertLib;
	
	/**
	 * 投标公司列表（临时）
	 */
	private List<BidCompDto> listBidCompTmp;
	
	/**
	 * 评审专家列表（临时）
	 */
	private List<ExpertLibDto> listExpertLibTmp;
	
	private List<UserInfoDto> listUserInfo;
	
	/**
	 * 招标明细（招标编号）
	 */
	private String detailBidNo;
	
	private BidDto detailBidDto;
	
	/**
	 * 招标历史明细（招标历史序号）
	 */
	private String detailBidHisSeq;
	
	private BidHistDto detailBidHisDto;
	
	//投标公司
	/**
	 * 新增投标公司
	 */
	private BidCompDto addBidCompDto;
	
	/**
	 * 修改投标公司
	 */
	private BidCompDto updBidCompDto;
	
	/**
	 * 招标编号
	 */
	private String showBidNo;
	
	/**
	 * 序号
	 */
	private String showBidCoSeq;
	
	/**
	 * 删除投标公司Key
	 */
	private String delBidComKey;
	
	//评审专家信息ID列表
	/**
	 * 评审专家信息页码
	 */
	private int startIndexExpert;
	
	/**
	 * 评审专家信息翻页
	 */
	private Page pageExpert;
	
	private List<ExpertLibDto> expertLibList;
	
	/**
	 * 专家名
	 */
	private String expertName;
	
	/**
	 * 专业
	 */
	private String expertMajor;
	
	/**
	 * 专业（显示用）
	 */
	private String expertMajorQuery;
	
	/**
	 * 是否随机查询专家
	 */
	private String strIsRandom;
	
	private String majornum1;
	private String majornum2;
	private String majornum3;
	private String majornum4;
	private String majornum5;
	private String majornum6;
	private String majornum7;
	private String majornum8;
	private String majornum9;
	private String majornumA;
	private String majornumB;
	private String majornumC;
	private String majornumD;
	private String majornumE;
	private String majornumF;
	
	//专业列表
	private String strMajor11;
	private String strMajor12;
	private String strMajor13;
	private String strMajor14;
	private String strMajor15;
	private String majorNum11;
	private String majorNum12;
	private String majorNum13;
	private String majorNum14;
	private String majorNum15;
	private List<MajorDto> major11List;
	private List<MajorDto> major12List;
	private List<MajorDto> major13List;
	private List<MajorDto> major14List;
	private List<MajorDto> major15List;
	//
	private String strMajor21;
	private String strMajor22;
	private String strMajor23;
	private String strMajor24;
	private String strMajor25;
	private String majorNum21;
	private String majorNum22;
	private String majorNum23;
	private String majorNum24;
	private String majorNum25;
	private List<MajorDto> major21List;
	private List<MajorDto> major22List;
	private List<MajorDto> major23List;
	private List<MajorDto> major24List;
	private List<MajorDto> major25List;
	//
	private String strMajor31;
	private String strMajor32;
	private String strMajor33;
	private String strMajor34;
	private String strMajor35;
	private String majorNum31;
	private String majorNum32;
	private String majorNum33;
	private String majorNum34;
	private String majorNum35;
	private List<MajorDto> major31List;
	private List<MajorDto> major32List;
	private List<MajorDto> major33List;
	private List<MajorDto> major34List;
	private List<MajorDto> major35List;
	//
	private String strMajor41;
	private String strMajor42;
	private String strMajor43;
	private String strMajor44;
	private String strMajor45;
	private String majorNum41;
	private String majorNum42;
	private String majorNum43;
	private String majorNum44;
	private String majorNum45;
	private List<MajorDto> major41List;
	private List<MajorDto> major42List;
	private List<MajorDto> major43List;
	private List<MajorDto> major44List;
	private List<MajorDto> major45List;
	//
	private String strMajor51;
	private String strMajor52;
	private String strMajor53;
	private String strMajor54;
	private String strMajor55;
	private String majorNum51;
	private String majorNum52;
	private String majorNum53;
	private String majorNum54;
	private String majorNum55;
	private List<MajorDto> major51List;
	private List<MajorDto> major52List;
	private List<MajorDto> major53List;
	private List<MajorDto> major54List;
	private List<MajorDto> major55List;
	//所有专业
	private List<MajorDto> majorAllList;
	
	//委托公司
	/**
	 * 评审专家信息页码
	 */
	private int startIndexAgentComp;
	
	/**
	 * 评审专家信息翻页
	 */
	private Page pageAgentComp;
	
	private List<AgentCompDto> agentCompList;
	
	private String agentCompNoLow;
	
	private String agentCompNoHigh;
	
	private String agentAddFlag;
	
	private String agentCompName;
	//投标状态
	private String tmpBidStatus;
	//更新类型，1为保存，2为下一步
	private String tmpUpdType;
	//是否显示下一步按钮
	private String nextStepType;
	//招标代理支付方
	private List<ConfigTabDto> bidAgentCompList;
	
	//项目信息新增还是修改
	private String projectMsgFlag;
	
	//报名内容
	private String applyNoteBidNo;
	private String applyNoteBidCoNo;
	private String applyNoteSeq;
	private List<BidCompApplyDto> listBidCompApply;
	
	//打印单个投标公司报名表
	private String singleBidNo;
	private String singleBidCompNo;
	
	//招标项目清单检索条件
	private String strBidNoStart;
	private String strBidNoEnd;
	private List<BidDto> listBidExport;
	private BidDto exportBidDto;
	private BidExtendDto bidExtendDto;
	private List<BidDto> listAgentCo;
	private List<BidDto> listBidCo;
	private List<BidDto> listProjectMg;
	
	//就职公司
	private List<ExpertLibDto> listExpertComp;
	private String strIsInclude;
	private String strExpertName;
	private String strExpertComp;
	
	//专家信息导出
	/**
	 * 专家信息导出
	 * @return
	 */
	public String exportBidExpertAction() {
		try {
			this.clearMessages();
			//查询招标
			BidDto bid = bidService.queryBidByID(exportExpertBidNo);
			if(bid != null) {
				//查询评审专家
				List<ExpertLibDto> listExpert = expertLibService.queryExpertLibByIds(bid.getBID_EXPERT_LIST());
				
				List<BidExpertDto> list = new ArrayList<BidExpertDto>();
				if(listExpert != null && listExpert.size() > 0) {
					BidExpertDto bidExpert = null;
					for(ExpertLibDto expert : listExpert) {
						bidExpert = new BidExpertDto();
						bidExpert.setBID_NO(bid.getBID_NO());
//						bidExpert.setAGENT_NO(bid.getAGENT_NO());
//						bidExpert.setAGENT_CO_NAME(bid.getAGENT_CO_NAME());
						bidExpert.setPROJECT_NAME(bid.getPROJECT_NAME());
						bidExpert.setEXPERT_NAME(expert.getEXPERT_NAME());
						bidExpert.setEXPERT_MAJOR(expert.getEXPERT_MAJOR());
						bidExpert.setEXPERT_MAJOR_NAME(expert.getEXPERT_MAJOR_NAME());
						bidExpert.setEXPERT_QULI(expert.getEXPERT_QULI());
						bidExpert.setEXPERT_TEL1(expert.getEXPERT_TEL1());
						bidExpert.setEXPERT_TEL2(expert.getEXPERT_TEL2());
						bidExpert.setEXPERT_GENDER(expert.getEXPERT_GENDER());
						bidExpert.setEXPERT_BIRTH(expert.getEXPERT_BIRTH());
						bidExpert.setEXPERT_COMP(expert.getEXPERT_COMP());
						bidExpert.setMEMO1(expert.getMEMO1());
						list.add(bidExpert);
					}
				}
				String name = StringUtil.createFileName(Constants.EXCEL_TYPE_ZJXXDC);
				response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
				response.setContentType("application/vnd.ms-excel");
				Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ZJXXDC);
				
				base.setDatas(list);
				base.setSheetName(Constants.EXCEL_TYPE_ZJXXDC);
				base.exportExcel(response.getOutputStream());
			}
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	//履历
	/**
	 * 导出招标履历
	 * @return
	 */
	public String exportBidHisAction() {
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_ZBLLYL);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ZBLLYL);
			
			//查询所有招标履历
			List<BidHistDto> list = bidService.queryAllBidHist(strBidNoHist);
			
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_ZBLLYL);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示所有的履历（不翻页）
	 * @return
	 */
	public String showAllBidHisAction() {
		try {
			this.clearMessages();
			listBidHist = new ArrayList<BidHistDto>();
			//查询所有招标履历
			listBidHist = bidService.queryAllBidHist(strBidNoHist);
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示招标履历
	 * @return
	 */
	public String showBidHisAction() {
		try {
			this.clearMessages();
			startIndexHist = 0;
			pageHist = new Page();
			listBidHist = new ArrayList<BidHistDto>();
			queryBidHist();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询招标履历
	 * @return
	 */
	public String queryBidHisAction() {
		try {
			this.clearMessages();
			startIndexHist = 0;
			queryBidHist();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 翻页招标履历
	 * @return
	 */
	public String turnBidHisAction() {
		try {
			this.clearMessages();
			queryBidHist();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	//委托公司
	/**
	 * 添加招标---显示委托公司信息选择页面
	 * @return
	 */
	public String showAddBidAgentCompAction() {
		try {
			this.clearMessages();
			//查询评审专家信息
			log.info("agentAddFlag=" + agentAddFlag);
			agentCompNoLow = "";
			agentCompNoHigh = "";
			agentCompName = "";
			agentCompList = new ArrayList<AgentCompDto>();
			pageAgentComp = new Page();
			startIndexAgentComp = 0;
			queryAgentComp();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 委托公司信息（查询）
	 * @return
	 */
	public String queryAddBidAgentCompAction() {
		try {
			this.clearMessages();
			//查询评审专家信息
			startIndexAgentComp = 0;
			queryAgentComp();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 选择委托公司信息（翻页）
	 * @return
	 */
	public String turnAddBidAgentCompAction() {
		try {
			this.clearMessages();
			//查询委托公司信息
			queryAgentComp();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	//评审专家
	/**
	 * 查询评审专家（最新）
	 * @return
	 */
	public String showGetBidExportActionNew() {
		try {
			this.clearMessages();
			expertLibList = new ArrayList<ExpertLibDto>();
			expertMajorQuery = "";
			//默认随机选取
			strIsRandom = "1";
			//单位（包含不包含）
			strIsInclude = "0";
			//专家姓名
			strExpertName = "";
			//单位选择
			strExpertComp = "";
			//所有专业数据
			majorAllList = majorService.queryAllMajor("", "");
			
			strMajor11 = "";
			strMajor12 = "";
			strMajor13 = "";
			strMajor14 = "";
			strMajor15 = "";
			strMajor21 = "";
			strMajor22 = "";
			strMajor23 = "";
			strMajor24 = "";
			strMajor25 = "";
			strMajor31 = "";
			strMajor32 = "";
			strMajor33 = "";
			strMajor34 = "";
			strMajor35 = "";
			strMajor41 = "";
			strMajor42 = "";
			strMajor43 = "";
			strMajor44 = "";
			strMajor45 = "";
			strMajor51 = "";
			strMajor52 = "";
			strMajor53 = "";
			strMajor54 = "";
			strMajor55 = "";
			initMajorList();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询评审专家（最新）
	 * @return
	 */
	public String getBidExportActionNew() {
		try {
			this.clearMessages();
			expertLibList = new ArrayList<ExpertLibDto>();
			//所有专业数据
			majorAllList = majorService.queryAllMajor("", "");
			initMajorList();
			expertLibList = expertLibService.autoQueryExpertLibNew(expertMajorQuery, strIsRandom, strExpertName, strIsInclude, strExpertComp);
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 专家就职公司信息选择页面
	 * @return
	 */
	public String showSelectExpertCompAction() {
		try {
			this.clearMessages();
			listExpertComp = new ArrayList<ExpertLibDto>();
			//查询就职公司信息
			listExpertComp = expertLibService.queryExpertComp();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示随机取得评审专家页面（OLD）
	 * @return
	 */
	public String showGetAutoBidExpertAction() {
		try {
			this.clearMessages();
			//查询评审专家信息
			expertMajor = "000000000";
			expertMajorQuery = "";
			//默认随机选取
			strIsRandom = "1";
			majornum1 = "";
			majornum2 = "";
			majornum3 = "";
			majornum4 = "";
			majornum5 = "";
			majornum6 = "";
			majornum7 = "";
			majornum8 = "";
			majornum9 = "";
			majornumA = "";
			majornumB = "";
			majornumC = "";
			majornumD = "";
			majornumE = "";
			majornumF = "";
			expertLibList = new ArrayList<ExpertLibDto>();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 随机取得评审专家（OLD）
	 * @return
	 */
	public String getAutoBidExpertAction() {
		try {
			this.clearMessages();
			expertLibList = new ArrayList<ExpertLibDto>();
			//查询评审专家信息
			List<String> majornumList = new ArrayList<String>();
			majornumList.add(majornum1);
			majornumList.add(majornum2);
			majornumList.add(majornum3);
			majornumList.add(majornum4);
			majornumList.add(majornum5);
			majornumList.add(majornum6);
			majornumList.add(majornum7);
			majornumList.add(majornum8);
			majornumList.add(majornum9);
			majornumList.add(majornumA);
			majornumList.add(majornumB);
			majornumList.add(majornumC);
			majornumList.add(majornumD);
			majornumList.add(majornumE);
			majornumList.add(majornumF);
			log.info("strIsRandom=" + strIsRandom);
			expertLibList = expertLibService.autoQueryExpertLib(expertMajorQuery, strIsRandom, majornumList);
		} catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示选择评审专家信息（OLD）
	 * @return
	 */
	public String showAddBidExpertAction() {
		try {
			this.clearMessages();
			//查询评审专家信息
			expertName = "";
			expertMajor = "";
			expertLibList = new ArrayList<ExpertLibDto>();
			pageExpert = new Page();
			startIndexExpert = 0;
			queryExpertLib();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 选择评审专家信息（查询）（OLD）
	 * @return
	 */
	public String queryAddBidExpertAction() {
		try {
			this.clearMessages();
			//查询评审专家信息
			expertLibList = new ArrayList<ExpertLibDto>();
			pageExpert = new Page();
			startIndexExpert = 0;
			queryExpertLib();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 选择评审专家信息（翻页）（OLD）
	 * @return
	 */
	public String turnAddBidExpertAction() {
		try {
			this.clearMessages();
			//查询评审专家信息
			queryExpertLib();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	//投标公司
	/**
	 * 删除投标公司
	 * @return
	 */
	public String delBidComNoAction() {
		try {
			this.clearMessages();
			if(listBidComp != null && listBidComp.size() > 0) {
				for(BidCompDto bidcomp : listBidComp) {
					String key = bidcomp.getBID_NO() + "_" + bidcomp.getBID_CO_SEQ();
					if(key.equals(delBidComKey)) {
						listBidComp.remove(bidcomp);
					}
				}
			}
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示新增投标公司
	 * @return
	 */
	public String showAddBidCompAction() {
		try {
			this.clearMessages();
			addBidCompDto = new BidCompDto();
			addBidCompDto.setBID_NO(showBidNo);
			addBidCompDto.setBID_CO_SEQ(Integer.valueOf(showBidCoSeq));
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示修改投标公司
	 * @return
	 */
	public String showUpdBidCompAction() {
		try {
			this.clearMessages();
			//updBidCompDto
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	//招标
	/**
	 * 显示招标明细
	 * @return
	 */
	public String showBidDetailAction() {
		try {
			this.clearMessages();
			detailBidDto = new BidDto();
			listBidComp = new ArrayList<BidCompDto>();
			listExpertLib = new ArrayList<ExpertLibDto>();
			//查询招标
			detailBidDto = bidService.queryAllBidByID(detailBidNo);
			if(detailBidDto != null) {
				//查询投标公司
				listBidComp = bidCompService.queryBidCompByIds(detailBidDto.getBID_CO_LIST());
				//查询评审专家
				listExpertLib = expertLibService.queryExpertLibByIds(detailBidDto.getBID_EXPERT_LIST());
			}
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示招标履历明细
	 * @return
	 */
	public String showBidHisDetailAction() {
		try {
			this.clearMessages();
			detailBidHisDto = new BidHistDto();
			listBidComp = new ArrayList<BidCompDto>();
			listExpertLib = new ArrayList<ExpertLibDto>();
			//查询招标履历
			detailBidHisDto = bidService.queryBidHistByID(detailBidHisSeq);
			if(detailBidHisDto != null) {
				//查询投标公司
				listBidComp = bidCompService.queryBidCompByIds(detailBidHisDto.getBID_CO_LIST());
				//查询评审专家
				listExpertLib = expertLibService.queryExpertLibByIds(detailBidHisDto.getBID_EXPERT_LIST());
			}
		} catch(Exception e) {
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
			this.clearMessages();
			//招标代理支付方
			bidAgentCompList = configTabService.queryConfigTabByType(Constants.CONFIG_TAB_BID_AGENT_PAY_COMP);
			listUserInfo = userInfoService.queryAllUser();
			//默认投标状态=新增项目信息
			tmpBidStatus = "0";
			tmpUpdType = "0";
			listBidComp = new ArrayList<BidCompDto>();
			listExpertLib = new ArrayList<ExpertLibDto>();
			listBidCompTmp = new ArrayList<BidCompDto>();
			listExpertLibTmp = new ArrayList<ExpertLibDto>();
			
			addBidDto = new BidDto();
			//默认为不随机
//			addBidDto.setIS_RANDOM("0");
			addBidDto.setSTATUS("0");
			
			addBidCompDto = new BidCompDto();
			updBidCompDto = new BidCompDto();
			showBidNo = "";
			showBidCoSeq = "";
			delBidComKey = "";
			
			agentAddFlag = "";
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
			
			System.out.println("addBidAction start:");

			//招标代理支付方
			bidAgentCompList = configTabService.queryConfigTabByType(Constants.CONFIG_TAB_BID_AGENT_PAY_COMP);
			listUserInfo = userInfoService.queryAllUser();
			//数据校验
			if(!checkAddBidData(addBidDto, "10")) {
				return "checkerror";
			}
//			if("3".equals(addBidDto.getPROJECT_TYPE())||"4".equals(addBidDto.getPROJECT_TYPE())) {
			//分类=招标办/竞价，则校验招标编号是否存在
//			if("3".equals(addBidDto.getPROJECT_TYPE())) {
//				//分类=招标办，则校验招标编号是否存在
//				BidDto bid = bidService.queryAllBidByID(addBidDto.getBID_NO());
//				if(bid != null) {
//					this.addActionMessage("招标编号" + addBidDto.getBID_NO() + "已经存在！");
//					return "checkerror";
//				}
//			}
			//保存数据
			addBidDto.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
			//投标状态=报名
			addBidDto.setSTATUS("10");
			
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			addBidDto.setUPDATE_USER(username);
			//String bidNo = bidService.insertBid(addBidDto, listBidComp, listExpertLib);
			String bidNo = bidService.insertBid(addBidDto);
			System.out.println("addBidAction addBidDto.getRESERVE5():" + addBidDto.getRESERVE5());
			
//			addBidDto = new BidDto();
//			//默认为不随机
//			addBidDto.setIS_RANDOM("0");
			
//			if(!"3".equals(addBidDto.getPROJECT_TYPE()) && !"4".equals(addBidDto.getPROJECT_TYPE())) {
			//招标/比选
//			if(!"3".equals(addBidDto.getPROJECT_TYPE())) {
//				//招标/比选/竞价
//				this.addActionMessage("添加招标成功！招标编号为：" + bidNo);
//			} else {
//				this.addActionMessage("添加招标成功！");
//			}
			//新增成功
			updateBidNo = bidNo;
			if("1".equals(tmpUpdType)) {
				//进入更新页面
				tmpBidStatus = "10";
				//显示下一步按钮
				nextStepType = "1";
				//招标代理支付方
				bidAgentCompList = configTabService.queryConfigTabByType(Constants.CONFIG_TAB_BID_AGENT_PAY_COMP);
				listBidComp = new ArrayList<BidCompDto>();
				listExpertLib = new ArrayList<ExpertLibDto>();
				listBidCompTmp = new ArrayList<BidCompDto>();
				listExpertLibTmp = new ArrayList<ExpertLibDto>();
				updateBidDtoOld = bidService.queryBidByID(bidNo);
				updateBidDto = bidService.queryBidByID(bidNo);
				//查询投标公司
				listBidComp = bidCompService.queryBidCompByIds(updateBidDto.getBID_CO_LIST());
				//查询评审专家
				listExpertLib = expertLibService.queryExpertLibByIds(updateBidDto.getBID_EXPERT_LIST());
				return "nextstep";
			}
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
	 * 显示修改招标页面（新的修改页面）
	 * @return
	 */
	public String showUpdBidStatusAction() {
		try {
			this.clearMessages();
			log.info("updateBidNo=" + updateBidNo + ",tmpBidStatus=" + tmpBidStatus);
			updateBidDto = bidService.queryBidByID(updateBidNo);
			listUserInfo = userInfoService.queryAllUser();
			//招标代理支付方
			bidAgentCompList = configTabService.queryConfigTabByType(Constants.CONFIG_TAB_BID_AGENT_PAY_COMP);
			listBidComp = new ArrayList<BidCompDto>();
			listExpertLib = new ArrayList<ExpertLibDto>();
			listBidCompTmp = new ArrayList<BidCompDto>();
			listExpertLibTmp = new ArrayList<ExpertLibDto>();
			updateBidDtoOld = bidService.queryBidByID(updateBidNo);
			tmpUpdType = "1";
			if(!"50".equals(tmpBidStatus) && Integer.valueOf(tmpBidStatus) <= Integer.valueOf(updateBidDto.getSTATUS())) {
				//显示下一步按钮
				nextStepType = "1";
			} else {
				//不显示下一步按钮
				nextStepType = "0";
			}
			if(updateBidDto == null) {
				this.addActionMessage("该数据不存在！");
				return "checkerror";
			}
			//查询投标公司
			listBidComp = bidCompService.queryBidCompByIds(updateBidDto.getBID_CO_LIST());
			//查询评审专家
			listExpertLib = expertLibService.queryExpertLibByIds(updateBidDto.getBID_EXPERT_LIST());
		} catch(Exception e) {
			this.addActionMessage("系统错误，查询招标异常！");
			log.error("showUpdBidAction error:" + e);
			return "checkerror";
		}
		return SUCCESS;
	}
	
	/**
	 * 修改招标（新的修改页面）
	 * @return
	 */
	public String updBidStatusAction() {
		try {
			this.clearMessages();
			//招标代理支付方
			bidAgentCompList = configTabService.queryConfigTabByType(Constants.CONFIG_TAB_BID_AGENT_PAY_COMP);
			listUserInfo = userInfoService.queryAllUser();
			listBidComp = listBidCompTmp;
			listExpertLib = listExpertLibTmp;
			listBidCompTmp = new ArrayList<BidCompDto>();
			listExpertLibTmp = new ArrayList<ExpertLibDto>();
			//数据校验
			if(!checkUpdData(updateBidDto)) {
				return "checkerror";
			}
			//修改数据
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			updateBidDto.setUPDATE_USER(username);
			
			//status
			log.info("updBidStatusAction updateBidDto.getSTATUS()=" + updateBidDto.getSTATUS() + ",tmpBidStatus=" + tmpBidStatus);
			int tmpstatus = Integer.valueOf(tmpBidStatus);
			int status = Integer.valueOf(updateBidDto.getSTATUS());
			//判断状态
			if(status < 50 && tmpstatus > status) {
				status = status + 10;
				updateBidDto.setSTATUS("" + status);
			}
			
			bidService.updateBid(updateBidDto, listBidComp, listExpertLib);
			if("1".equals(tmpUpdType)) {
				this.addActionMessage("修改招标成功！");
			}
			
			if(!"50".equals(tmpBidStatus) && Integer.valueOf(tmpBidStatus) <= Integer.valueOf(updateBidDto.getSTATUS())) {
				//显示下一步按钮
				nextStepType = "1";
			} else {
				//不显示下一步按钮
				nextStepType = "0";
			}
			updateBidDtoOld = bidService.queryBidByID(updateBidNo);
			//查询投标公司
			listBidComp = bidCompService.queryBidCompByIds(updateBidDto.getBID_CO_LIST());
			//查询评审专家
			listExpertLib = expertLibService.queryExpertLibByIds(updateBidDto.getBID_EXPERT_LIST());
		} catch(Exception e) {
			this.addActionMessage("系统异常，修改招标失败！");
			log.error("updBidAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 报名内容页面
	 * @return
	 */
	public String showApplyNotePage() {
		try {
			this.clearMessages();
			listBidCompApply = bidService.queryApplyByBidID(applyNoteBidNo, applyNoteBidCoNo);

			for (int i = 0; i<listBidCompApply.size(); i++){
				BidCompApplyDto bb = listBidCompApply.get(i);
			}
			
		} catch(Exception e) {
			this.addActionMessage("系统异常！");
			log.error("showApplyNotePage error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	//之前版本
	/**
	 * 显示修改招标页面
	 * @return
	 */
	public String showUpdBidAction() {
		try {
			this.clearMessages();
			listBidComp = new ArrayList<BidCompDto>();
			listExpertLib = new ArrayList<ExpertLibDto>();
			listBidCompTmp = new ArrayList<BidCompDto>();
			listExpertLibTmp = new ArrayList<ExpertLibDto>();
			updateBidDtoOld = bidService.queryBidByID(updateBidNo);
			updateBidDto = bidService.queryBidByID(updateBidNo);
			if(updateBidDto == null) {
				this.addActionMessage("该数据不存在！");
				return "checkerror";
			}
			//查询投标公司
			listBidComp = bidCompService.queryBidCompByIds(updateBidDto.getBID_CO_LIST());
			
			//查询评审专家
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
			listBidComp = listBidCompTmp;
			listExpertLib = listExpertLibTmp;
			listBidCompTmp = new ArrayList<BidCompDto>();
			listExpertLibTmp = new ArrayList<ExpertLibDto>();
			//数据校验
			if(!checkUpdData(updateBidDto)) {
				return "checkerror";
			}
			//修改数据
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			updateBidDto.setUPDATE_USER(username);
			bidService.updateBid(updateBidDto, listBidComp, listExpertLib);
			this.addActionMessage("修改招标成功！");
			updateBidDtoOld = bidService.queryBidByID(updateBidNo);
			//查询投标公司
			listBidComp = bidCompService.queryBidCompByIds(updateBidDto.getBID_CO_LIST());
			//查询评审专家
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
			strBidStatus = "123";
			strBidNoLow = "";
			strBidNoHigh = "";
			strProjectType = "";
			strOpenDateLow = "";
			strOpenDateHigh = "";
			strAgentNo = "";
			detailBidNo = "";
			strAgentName = "";
			strBidCoName = "";
			strReceipt1No = "";
			detailBidHisSeq = "";
			detailBidDto = new BidDto();
			detailBidHisDto = new BidHistDto();
			page = new Page();
			startIndex = 0;
			listBid = new ArrayList<BidDto>();
			addBidDto = new BidDto();
			updateBidNo = "";
			updateBidDto = new BidDto();
			updateBidDtoOld = new BidDto();
			delBidNo = "";
			exportExpertBidNo = "";
			
			//履历
			strBidNoHist = "";
			pageHist = new Page();
			startIndexHist = 0;
			listBidHist = new ArrayList<BidHistDto>();
			strBidNoHist = "";
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
			List<BidDto> list = bidService.queryAllBidExport(strBidNoLow, strBidNoHigh, strProjectType,
					strOpenDateLow, strOpenDateHigh, strAgentNo, strAgentName, strBidCoName, strReceipt1No);
			
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
	 * 导出招标完整信息列表
	 * @return
	 */
	public String exportBidAllInfoAction() {
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_ALL_ZBYL);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ALL_ZBYL);
			
			//查询数据
			List<BidCompExportDto> list = bidService.queryAllBidCompExport(strBidNoLow, strBidNoHigh, strProjectType,
					strOpenDateLow, strOpenDateHigh, strAgentNo, strAgentName, strBidCoName, strReceipt1No);
			
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_ALL_ZBYL);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	//打印
	/**
	 * 导出招标项目流转表
	 * @return
	 */
	public String exportBidFormAction() {
		try {
			this.clearMessages();
			String filename = "page/bidform.xlsx";
			String name =  StringUtil.createFileName(Constants.EXCEL_TYPE_ZBLZ);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ZBLZ);
			
			//查询数据
			List<BidDto> list = new ArrayList<BidDto>();
			log.info("projectMsgFlag=" + projectMsgFlag);
			if(projectMsgFlag != null && projectMsgFlag.equals("2")){
				list.add(updateBidDto);
			} else {
				list.add(addBidDto);
			}
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
	 * 导出单个投标公司招标报名表
	 * @return
	 */
	public String exportSingleBidCompRegisterAction() {
		try {
			this.clearMessages();
			String filename = "page/bidregister.xlsx";
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_ZBSBM);
			if (!StringUtil.isBlank(updateBidDto.getBID_NO()))
				name = StringUtil.createFileName(updateBidDto.getBID_NO() + "-" + Constants.EXCEL_TYPE_ZBSBM);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ZBSBM);
			
			BidDto bid = bidService.queryBidByID(singleBidNo);
			BidCompDto bidComp = bidCompService.queryBidCompByID(singleBidCompNo);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bidComp", bidComp);
			List<BidCompApplyDto> listBidCompApply = bidCompApplyService.queryBidCompApplyByBidCoNo(singleBidCompNo);
			map.put("bidCompApply", listBidCompApply);
			
			//查询数据
			List<BidDto> list = new ArrayList<BidDto>();
			list.add(bid);
			base.setDatas(list);
			base.setMap(map);
			base.setFilepath(filename);
			base.exportExcel2(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 导出招标报名表
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
	 * 导出招标签收表
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
			if (!StringUtil.isBlank(updateBidDto.getBID_NO()))
				name = StringUtil.createFileName2(updateBidDto.getBID_NO() + "-" + Constants.EXCEL_TYPE_ZBBS);
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
	 * 导出中标签收
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
	 * 招标项目清单检索条件
	 * @return 
	 */
	public String exportYearAction() {
		try {
			this.clearMessages();
			listBidExport = new ArrayList<BidDto>();
			//查询数据
			listBidExport = bidService.queryBidExportByYear(strBidNoStart, strBidNoEnd);
			exportBidDto.setRESERVE3(strBidNoStart);
			exportBidDto.setRESERVE4(strBidNoEnd);
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 招标项目清单年份检索条件
	 * @return 
	 */
	public String showExportYearAction() {
		exportBidDto = new BidDto();
		bidExtendDto = new BidExtendDto();
		strBidNoStart = "";
		strBidNoEnd = "";
		return SUCCESS;
	}
	
	//委托公司
	/**
	 * 招标下载---显示委托公司信息选择页面
	 * @return
	 */
	public String showSelectBidAgentCompAction() {
		try {
			this.clearMessages();
			//查询委托公司信息
			listAgentCo = new ArrayList<BidDto>();
			listAgentCo = bidService.queryAgentCo(strBidNoStart, strBidNoEnd);
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	//中标公司
	/**
	 * 招标下载---显示中标公司信息选择页面
	 * @return
	 */
	public String showSelectBidCompAction() {
		try {
			this.clearMessages();
			//查询中标公司信息
			listBidCo = new ArrayList<BidDto>();
			listBidCo = bidService.queryBidCo(strBidNoStart, strBidNoEnd);
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	//工程师
	/**
	 * 招标下载---显示工程师信息选择页面
	 * @return
	 */
	public String showSelectProManagerAction() {
		try {
			this.clearMessages();
			//查询工程师信息
			listProjectMg = new ArrayList<BidDto>();
			listProjectMg = bidService.queryProjectMg(strBidNoStart, strBidNoEnd);
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 根据招标项目清单检索条件查询招标列表
	 * @return
	 */
	public String showBidList() {
		try {
			this.clearMessages();
			//查询招标列表
			listBidExport = new ArrayList<BidDto>();
			listBidExport = bidService.queryBidExport(exportBidDto);
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 导出招标信息列表
	 * @return
	 */
	public String exportBidList2Action() {
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_ZBYL);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ZBYL_AD01);

			//查询数据
			List<BidDto> list = bidService.queryBidExport(exportBidDto);
			
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
	 * 翻页查询招标列表
	 */
	@SuppressWarnings("unchecked")
	private void queryBid() {
		strBidNoHist = "";
		listBid = new ArrayList<BidDto>();
		if(page == null) {
			page = new Page();
		}
		//翻页查询所有招标
		this.page.setStartIndex(startIndex);
		page = bidService.queryBidByPage(strBidNoLow, strBidNoHigh, strProjectType,
				strOpenDateLow, strOpenDateHigh, strAgentNo, strAgentName, strBidCoName, strReceipt1No, page, strBidStatus);
		listBid = (List<BidDto>) page.getItems();
		this.setStartIndex(page.getStartIndex());
	}
	
	/**
	 * 翻页查询委托公司列表
	 */
	@SuppressWarnings("unchecked")
	private void queryAgentComp() {
		agentCompList = new ArrayList<AgentCompDto>();
		if(pageAgentComp == null) {
			pageAgentComp = new Page();
		}
		//翻页查询所有招标
		this.pageAgentComp.setStartIndex(startIndexAgentComp);
		pageAgentComp = agentCompService.queryAgentCompByPage(pageAgentComp, agentCompNoLow, agentCompNoHigh, agentAddFlag, agentCompName);
		agentCompList = (List<AgentCompDto>) pageAgentComp.getItems();
		this.setStartIndexAgentComp(pageAgentComp.getStartIndex());
	}
	
	/**
	 * 翻页查询评审专家列表
	 */
	@SuppressWarnings("unchecked")
	private void queryExpertLib() {
		expertLibList = new ArrayList<ExpertLibDto>();
		if(pageExpert == null) {
			pageExpert = new Page();
		}
		//翻页查询所有招标
		this.pageExpert.setStartIndex(startIndexExpert);
		pageExpert = expertLibService.queryExpertLibByPageOr(pageExpert, expertName, expertMajor);
		expertLibList = (List<ExpertLibDto>) pageExpert.getItems();
		this.setStartIndexExpert(pageExpert.getStartIndex());
	}
	
	/**
	 * 翻页查询招标履历列表
	 */
	@SuppressWarnings("unchecked")
	private void queryBidHist() {
		listBidHist = new ArrayList<BidHistDto>();
		if(pageHist == null) {
			pageHist = new Page();
		}
		//翻页查询招标履历列表
		this.pageHist.setStartIndex(startIndexHist);
		pageHist = bidService.queryBidHistByPage(strBidNoHist, pageHist);
		listBidHist = (List<BidHistDto>) pageHist.getItems();
		this.setStartIndex(pageHist.getStartIndex());
	}
	
	/**
	 * 验证数据格式
	 * @param bid
	 * @return
	 */
	@SuppressWarnings("unused")
	private boolean checkData_bak(BidDto bid) {
		if(StringUtil.isBlank(bid.getBID_NO())) {
			this.addActionMessage("招标编号不能为空！");
			return false;
		}
//		if(StringUtil.isBlank(bid.getPROJECT_TYPE())) {
//			this.addActionMessage("请选择分类！");
//			return false;
//		}
		if(StringUtil.isBlank(bid.getPROJECT_NAME())) {
			this.addActionMessage("项目名称不能为空！");
			return false;
		}
		if(StringUtil.isBlank(bid.getPROJECT_MANAGER())) {
			this.addActionMessage("担当者不能为空！");
			return false;
		}
//		if(bid.getONLINE_DATE() == null) {
//			this.addActionMessage("上网公告日不能为空！");
//			return false;
//		}
//		if(bid.getTENDER_START_DATE() == null) {
//			this.addActionMessage("发标日期不能为空！");
//			return false;
//		}
//		if(bid.getSUBMIT_DATE() == null) {
//			this.addActionMessage("报名开始日不能为空！");
//			return false;
//		}
//		if(bid.getSUBMIT_DATE2() == null) {
//			this.addActionMessage("报名截至日不能为空！");
//			return false;
//		}
		if(bid.getTENDER_OPEN_DATE() == null) {
			this.addActionMessage("开标日期不能为空！");
			return false;
		}
//		//委托公司信息
//		if(StringUtil.isBlank(bid.getAGENT_NO())) {
//			this.addActionMessage("委托公司代码不能为空！");
//			return false;
//		}
//		if(StringUtil.isBlank(bid.getAGENT_CO_NAME())) {
//			this.addActionMessage("委托公司名称不能为空！");
//			return false;
//		}
//		if(StringUtil.isBlank(bid.getAGENT_CO_MANAGER())) {
//			this.addActionMessage("委托公司联系人不能为空！");
//			return false;
//		}
//		if(StringUtil.isBlank(bid.getAGENT_CO_MANAGER_TEL())) {
//			this.addActionMessage("委托公司电话不能为空！");
//			return false;
//		}
//		if(!StringUtil.isMobile(bid.getAGENT_CO_MANAGER_TEL())) {
//			this.addActionMessage("请输入正确的委托公司电话！");
//			return false;
//		}
//		if(StringUtil.isBlank(bid.getAGENT_CO_POST_ADDRESS())) {
//			this.addActionMessage("委托公司地址不能为空！");
//			return false;
//		}
//		if(StringUtil.isBlank(bid.getAGENT_CO_MAIL())) {
//			this.addActionMessage("委托公司邮箱不能为空！");
//			return false;
//		}
//		if(!StringUtil.isEmail(bid.getAGENT_CO_MAIL())) {
//			this.addActionMessage("请输入正确的委托公司邮箱！");
//			return false;
//		}
//		//专业公司信息
//		if(StringUtil.isBlank(bid.getPROF_NO())) {
//			this.addActionMessage("专业公司代码不能为空！");
//			return false;
//		}
//		if(StringUtil.isBlank(bid.getPROF_CO_NAME())) {
//			this.addActionMessage("专业公司名称不能为空！");
//			return false;
//		}
//		if(StringUtil.isBlank(bid.getPROF_CO_MANAGER())) {
//			this.addActionMessage("授权人不能为空！");
//			return false;
//		}
//		if(StringUtil.isBlank(bid.getPROF_CO_MANAGER_TEL())) {
//			this.addActionMessage("专业公司电话不能为空！");
//			return false;
//		}
//		if(!StringUtil.isMobile(bid.getPROF_CO_MANAGER_TEL())) {
//			this.addActionMessage("请输入正确的专业公司电话！");
//			return false;
//		}
//		if(StringUtil.isBlank(bid.getPROF_CO_POST_ADDRESS())) {
//			this.addActionMessage("专业公司地址不能为空！");
//			return false;
//		}
//		if(StringUtil.isBlank(bid.getPROF_CO_MAIL())) {
//			this.addActionMessage("专业公司邮箱不能为空！");
//			return false;
//		}
//		if(!StringUtil.isEmail(bid.getPROF_CO_MAIL())) {
//			this.addActionMessage("请输入正确的专业公司邮箱！");
//			return false;
//		}
		if(StringUtil.isNotBlank(bid.getMEMO1()) && bid.getMEMO1().length() > 60) {
			this.addActionMessage("备注不能超过60个字！");
			return false;
		}
		//项目过程确认信息
		//发票1
		if(bid.getRECEIPT1_DATE() == null) {
			this.addActionMessage("开票日期不能为空！");
			return false;
		}
//		if(StringUtil.isBlank(bid.getRECEIPT1_STAFF())) {
//			this.addActionMessage("开票人不能为空！");
//			return false;
//		}
//		if(bid.getRECEIPT1_AGENT_COMMISSION() == null) {
//			this.addActionMessage("代理费不能为空！");
//			return false;
//		}
//		if(StringUtil.isBlank(bid.getRECEIPT1_NO())) {
//			this.addActionMessage("发票号码不能为空！");
//			return false;
//		}
//		if(StringUtil.isBlank(bid.getRECEIPT1_RECEIVER())) {
//			this.addActionMessage("接受人不能为空！");
//			return false;
//		}
//		if(bid.getRECEIPT1_VALUE_DATE() == null) {
//			this.addActionMessage("到账日期不能为空！");
//			return false;
//		}
//		if(bid.getBID_COMMISION() == null) {
//			this.addActionMessage("评标费不能为空！");
//			return false;
//		}
//		//发票2
//		if(StringUtil.isBlank(bid.getRECEIPT2_NO())) {
//			this.addActionMessage("签收单编号不能为空！");
//			return false;
//		}
//		if(bid.getRECEIPT2_DATE() == null) {
//			this.addActionMessage("签收时间不能为空！");
//			return false;
//		}
//		if(StringUtil.isBlank(bid.getRECEIPT2_POST_NO())) {
//			this.addActionMessage("快递编号不能为空！");
//			return false;
//		}
//		if(bid.getRECEIPT2_EXPRESS_DATE() == null) {
//			this.addActionMessage("快递时间不能为空！");
//			return false;
//		}
		return true;
	}
	
	/**
	 * 验证数据格式（更新操作）
	 * @param bid
	 * @return
	 */
	private boolean checkUpdData(BidDto bid) {
//		if("3".equals(bid.getPROJECT_TYPE())) {
//			//分类=招标办,招标编号为自己输入
//			if(StringUtil.isBlank(bid.getBID_NO())) {
//				this.addActionMessage("招标编号不能为空！");
//				return false;
//			}
//		}
//		if(StringUtil.isBlank(bid.getPROJECT_TYPE())) {
//			this.addActionMessage("请选择分类！");
//			return false;
//		}
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
	
	/**
	 * 专业列表初期化
	 */
	private void initMajorList() {
		//专业列表
		//第一行专业
		major11List = majorService.queryAllMajor("1", "");
		if(StringUtil.isNotBlank(strMajor11)) {
			major12List = majorService.queryAllMajor("2", strMajor11);
		} else {
			major12List = new ArrayList<MajorDto>();
		}
		if(StringUtil.isNotBlank(strMajor12)) {
			major13List = majorService.queryAllMajor("3", strMajor12);
		} else {
			major13List = new ArrayList<MajorDto>();
		}
		if(StringUtil.isNotBlank(strMajor13)) {
			major14List = majorService.queryAllMajor("4", strMajor13);
		} else {
			major14List = new ArrayList<MajorDto>();
		}
		if(StringUtil.isNotBlank(strMajor14)) {
			major15List = majorService.queryAllMajor("5", strMajor14);
		} else {
			major15List = new ArrayList<MajorDto>();
		}
		//第二行专业
		major21List = majorService.queryAllMajor("1", "");
		if(StringUtil.isNotBlank(strMajor21)) {
			major22List = majorService.queryAllMajor("2", strMajor21);
		} else {
			major22List = new ArrayList<MajorDto>();
		}
		if(StringUtil.isNotBlank(strMajor22)) {
			major23List = majorService.queryAllMajor("3", strMajor22);
		} else {
			major23List = new ArrayList<MajorDto>();
		}
		if(StringUtil.isNotBlank(strMajor23)) {
			major24List = majorService.queryAllMajor("4", strMajor23);
		} else {
			major24List = new ArrayList<MajorDto>();
		}
		if(StringUtil.isNotBlank(strMajor24)) {
			major25List = majorService.queryAllMajor("5", strMajor24);
		} else {
			major25List = new ArrayList<MajorDto>();
		}
		//第三行专业
		major31List = majorService.queryAllMajor("1", "");
		if(StringUtil.isNotBlank(strMajor31)) {
			major32List = majorService.queryAllMajor("2", strMajor31);
		} else {
			major32List = new ArrayList<MajorDto>();
		}
		if(StringUtil.isNotBlank(strMajor32)) {
			major33List = majorService.queryAllMajor("3", strMajor32);
		} else {
			major33List = new ArrayList<MajorDto>();
		}
		if(StringUtil.isNotBlank(strMajor33)) {
			major34List = majorService.queryAllMajor("4", strMajor33);
		} else {
			major34List = new ArrayList<MajorDto>();
		}
		if(StringUtil.isNotBlank(strMajor34)) {
			major35List = majorService.queryAllMajor("5", strMajor34);
		} else {
			major35List = new ArrayList<MajorDto>();
		}
		//第四行专业
		major41List = majorService.queryAllMajor("1", "");
		if(StringUtil.isNotBlank(strMajor41)) {
			major42List = majorService.queryAllMajor("2", strMajor41);
		} else {
			major42List = new ArrayList<MajorDto>();
		}
		if(StringUtil.isNotBlank(strMajor42)) {
			major43List = majorService.queryAllMajor("3", strMajor42);
		} else {
			major43List = new ArrayList<MajorDto>();
		}
		if(StringUtil.isNotBlank(strMajor43)) {
			major44List = majorService.queryAllMajor("4", strMajor43);
		} else {
			major44List = new ArrayList<MajorDto>();
		}
		if(StringUtil.isNotBlank(strMajor44)) {
			major45List = majorService.queryAllMajor("5", strMajor44);
		} else {
			major45List = new ArrayList<MajorDto>();
		}
		//第五行专业
		major51List = majorService.queryAllMajor("1", "");
		if(StringUtil.isNotBlank(strMajor51)) {
			major52List = majorService.queryAllMajor("2", strMajor51);
		} else {
			major52List = new ArrayList<MajorDto>();
		}
		if(StringUtil.isNotBlank(strMajor52)) {
			major53List = majorService.queryAllMajor("3", strMajor52);
		} else {
			major53List = new ArrayList<MajorDto>();
		}
		if(StringUtil.isNotBlank(strMajor53)) {
			major54List = majorService.queryAllMajor("4", strMajor53);
		} else {
			major54List = new ArrayList<MajorDto>();
		}
		if(StringUtil.isNotBlank(strMajor54)) {
			major55List = majorService.queryAllMajor("5", strMajor54);
		} else {
			major55List = new ArrayList<MajorDto>();
		}
	}
	
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

	public List<BidHistDto> getListBidHist() {
		return listBidHist;
	}

	public void setListBidHist(List<BidHistDto> listBidHist) {
		this.listBidHist = listBidHist;
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

	public String getStrAgentNo() {
		return strAgentNo;
	}

	public void setStrAgentNo(String strAgentNo) {
		this.strAgentNo = strAgentNo;
	}

	public int getStartIndexHist() {
		return startIndexHist;
	}

	public void setStartIndexHist(int startIndexHist) {
		this.startIndexHist = startIndexHist;
	}

	public Page getPageHist() {
		return pageHist;
	}

	public void setPageHist(Page pageHist) {
		this.pageHist = pageHist;
	}

	public String getStrBidNoHist() {
		return strBidNoHist;
	}

	public void setStrBidNoHist(String strBidNoHist) {
		this.strBidNoHist = strBidNoHist;
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

	public BidCompService getBidCompService() {
		return bidCompService;
	}

	public void setBidCompService(BidCompService bidCompService) {
		this.bidCompService = bidCompService;
	}

	public BidCompDto getAddBidCompDto() {
		return addBidCompDto;
	}

	public void setAddBidCompDto(BidCompDto addBidCompDto) {
		this.addBidCompDto = addBidCompDto;
	}

	public BidCompDto getUpdBidCompDto() {
		return updBidCompDto;
	}

	public void setUpdBidCompDto(BidCompDto updBidCompDto) {
		this.updBidCompDto = updBidCompDto;
	}

	public String getShowBidNo() {
		return showBidNo;
	}

	public void setShowBidNo(String showBidNo) {
		this.showBidNo = showBidNo;
	}

	public String getShowBidCoSeq() {
		return showBidCoSeq;
	}

	public void setShowBidCoSeq(String showBidCoSeq) {
		this.showBidCoSeq = showBidCoSeq;
	}

	public String getDelBidComKey() {
		return delBidComKey;
	}

	public void setDelBidComKey(String delBidComKey) {
		this.delBidComKey = delBidComKey;
	}

	public ExpertLibService getExpertLibService() {
		return expertLibService;
	}

	public void setExpertLibService(ExpertLibService expertLibService) {
		this.expertLibService = expertLibService;
	}

	public int getStartIndexExpert() {
		return startIndexExpert;
	}

	public void setStartIndexExpert(int startIndexExpert) {
		this.startIndexExpert = startIndexExpert;
	}

	public Page getPageExpert() {
		return pageExpert;
	}

	public void setPageExpert(Page pageExpert) {
		this.pageExpert = pageExpert;
	}

	public List<ExpertLibDto> getExpertLibList() {
		return expertLibList;
	}

	public void setExpertLibList(List<ExpertLibDto> expertLibList) {
		this.expertLibList = expertLibList;
	}

	public String getExpertName() {
		return expertName;
	}

	public void setExpertName(String expertName) {
		this.expertName = expertName;
	}

	public String getExpertMajor() {
		return expertMajor;
	}

	public void setExpertMajor(String expertMajor) {
		this.expertMajor = expertMajor;
	}

	public int getStartIndexAgentComp() {
		return startIndexAgentComp;
	}

	public void setStartIndexAgentComp(int startIndexAgentComp) {
		this.startIndexAgentComp = startIndexAgentComp;
	}

	public Page getPageAgentComp() {
		return pageAgentComp;
	}

	public void setPageAgentComp(Page pageAgentComp) {
		this.pageAgentComp = pageAgentComp;
	}

	public List<AgentCompDto> getAgentCompList() {
		return agentCompList;
	}

	public void setAgentCompList(List<AgentCompDto> agentCompList) {
		this.agentCompList = agentCompList;
	}

	public String getAgentCompNoLow() {
		return agentCompNoLow;
	}

	public void setAgentCompNoLow(String agentCompNoLow) {
		this.agentCompNoLow = agentCompNoLow;
	}

	public String getAgentCompNoHigh() {
		return agentCompNoHigh;
	}

	public void setAgentCompNoHigh(String agentCompNoHigh) {
		this.agentCompNoHigh = agentCompNoHigh;
	}


	public String getAgentAddFlag() {
		return agentAddFlag;
	}


	public void setAgentAddFlag(String agentAddFlag) {
		this.agentAddFlag = agentAddFlag;
	}


	public AgentCompService getAgentCompService() {
		return agentCompService;
	}


	public void setAgentCompService(AgentCompService agentCompService) {
		this.agentCompService = agentCompService;
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

	public String getDetailBidNo() {
		return detailBidNo;
	}

	public void setDetailBidNo(String detailBidNo) {
		this.detailBidNo = detailBidNo;
	}

	public String getDetailBidHisSeq() {
		return detailBidHisSeq;
	}

	public void setDetailBidHisSeq(String detailBidHisSeq) {
		this.detailBidHisSeq = detailBidHisSeq;
	}

	public BidDto getDetailBidDto() {
		return detailBidDto;
	}

	public void setDetailBidDto(BidDto detailBidDto) {
		this.detailBidDto = detailBidDto;
	}

	public BidHistDto getDetailBidHisDto() {
		return detailBidHisDto;
	}

	public void setDetailBidHisDto(BidHistDto detailBidHisDto) {
		this.detailBidHisDto = detailBidHisDto;
	}

	public BidDto getUpdateBidDtoOld() {
		return updateBidDtoOld;
	}

	public void setUpdateBidDtoOld(BidDto updateBidDtoOld) {
		this.updateBidDtoOld = updateBidDtoOld;
	}

	public String getStrBidStatus() {
		return strBidStatus;
	}

	public void setStrBidStatus(String strBidStatus) {
		this.strBidStatus = strBidStatus;
	}

	public String getExpertMajorQuery() {
		return expertMajorQuery;
	}

	public void setExpertMajorQuery(String expertMajorQuery) {
		this.expertMajorQuery = expertMajorQuery;
	}

	public String getStrIsRandom() {
		return strIsRandom;
	}

	public void setStrIsRandom(String strIsRandom) {
		this.strIsRandom = strIsRandom;
	}

	public String getMajornum1() {
		return majornum1;
	}

	public void setMajornum1(String majornum1) {
		this.majornum1 = majornum1;
	}

	public String getMajornum2() {
		return majornum2;
	}

	public void setMajornum2(String majornum2) {
		this.majornum2 = majornum2;
	}

	public String getMajornum3() {
		return majornum3;
	}

	public void setMajornum3(String majornum3) {
		this.majornum3 = majornum3;
	}

	public String getMajornum4() {
		return majornum4;
	}

	public void setMajornum4(String majornum4) {
		this.majornum4 = majornum4;
	}

	public String getMajornum5() {
		return majornum5;
	}

	public void setMajornum5(String majornum5) {
		this.majornum5 = majornum5;
	}

	public String getMajornum6() {
		return majornum6;
	}

	public void setMajornum6(String majornum6) {
		this.majornum6 = majornum6;
	}

	public String getMajornum7() {
		return majornum7;
	}

	public void setMajornum7(String majornum7) {
		this.majornum7 = majornum7;
	}

	public String getMajornum8() {
		return majornum8;
	}

	public void setMajornum8(String majornum8) {
		this.majornum8 = majornum8;
	}

	public String getMajornum9() {
		return majornum9;
	}

	public void setMajornum9(String majornum9) {
		this.majornum9 = majornum9;
	}

	public String getMajornumA() {
		return majornumA;
	}

	public void setMajornumA(String majornumA) {
		this.majornumA = majornumA;
	}

	public String getMajornumB() {
		return majornumB;
	}

	public void setMajornumB(String majornumB) {
		this.majornumB = majornumB;
	}

	public String getMajornumC() {
		return majornumC;
	}

	public void setMajornumC(String majornumC) {
		this.majornumC = majornumC;
	}

	public String getMajornumD() {
		return majornumD;
	}

	public void setMajornumD(String majornumD) {
		this.majornumD = majornumD;
	}

	public String getMajornumE() {
		return majornumE;
	}

	public void setMajornumE(String majornumE) {
		this.majornumE = majornumE;
	}

	public String getMajornumF() {
		return majornumF;
	}

	public void setMajornumF(String majornumF) {
		this.majornumF = majornumF;
	}

	public String getExportExpertBidNo() {
		return exportExpertBidNo;
	}

	public void setExportExpertBidNo(String exportExpertBidNo) {
		this.exportExpertBidNo = exportExpertBidNo;
	}

	public String getAgentCompName() {
		return agentCompName;
	}

	public void setAgentCompName(String agentCompName) {
		this.agentCompName = agentCompName;
	}

	public String getTmpBidStatus() {
		return tmpBidStatus;
	}

	public void setTmpBidStatus(String tmpBidStatus) {
		this.tmpBidStatus = tmpBidStatus;
	}

	public ConfigTabService getConfigTabService() {
		return configTabService;
	}

	public void setConfigTabService(ConfigTabService configTabService) {
		this.configTabService = configTabService;
	}

	public List<ConfigTabDto> getBidAgentCompList() {
		return bidAgentCompList;
	}

	public void setBidAgentCompList(List<ConfigTabDto> bidAgentCompList) {
		this.bidAgentCompList = bidAgentCompList;
	}

	public String getTmpUpdType() {
		return tmpUpdType;
	}

	public void setTmpUpdType(String tmpUpdType) {
		this.tmpUpdType = tmpUpdType;
	}

	public String getStrAgentName() {
		return strAgentName;
	}

	public void setStrAgentName(String strAgentName) {
		this.strAgentName = strAgentName;
	}

	public String getProjectMsgFlag() {
		return projectMsgFlag;
	}

	public void setProjectMsgFlag(String projectMsgFlag) {
		this.projectMsgFlag = projectMsgFlag;
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

	public String getStrBidCoName() {
		return strBidCoName;
	}

	public void setStrBidCoName(String strBidCoName) {
		this.strBidCoName = strBidCoName;
	}

	public String getStrReceipt1No() {
		return strReceipt1No;
	}

	public void setStrReceipt1No(String strReceipt1No) {
		this.strReceipt1No = strReceipt1No;
	}

	public String getNextStepType() {
		return nextStepType;
	}

	public void setNextStepType(String nextStepType) {
		this.nextStepType = nextStepType;
	}

	public String getApplyNoteBidNo() {
		return applyNoteBidNo;
	}

	public void setApplyNoteBidNo(String applyNoteBidNo) {
		this.applyNoteBidNo = applyNoteBidNo;
	}

	public String getApplyNoteSeq() {
		return applyNoteSeq;
	}

	public void setApplyNoteSeq(String applyNoteSeq) {
		this.applyNoteSeq = applyNoteSeq;
	}

	public List<BidCompApplyDto> getListBidCompApply() {
		return listBidCompApply;
	}

	public void setListBidCompApply(List<BidCompApplyDto> listBidCompApply) {
		this.listBidCompApply = listBidCompApply;
	}

	public String getApplyNoteBidCoNo() {
		return applyNoteBidCoNo;
	}

	public void setApplyNoteBidCoNo(String applyNoteBidCoNo) {
		this.applyNoteBidCoNo = applyNoteBidCoNo;
	}

	public BidCompApplyService getBidCompApplyService() {
		return bidCompApplyService;
	}

	public void setBidCompApplyService(BidCompApplyService bidCompApplyService) {
		this.bidCompApplyService = bidCompApplyService;
	}

	public String getSingleBidNo() {
		return singleBidNo;
	}

	public void setSingleBidNo(String singleBidNo) {
		this.singleBidNo = singleBidNo;
	}

	public String getSingleBidCompNo() {
		return singleBidCompNo;
	}

	public void setSingleBidCompNo(String singleBidCompNo) {
		this.singleBidCompNo = singleBidCompNo;
	}

	public MajorService getMajorService() {
		return majorService;
	}

	public void setMajorService(MajorService majorService) {
		this.majorService = majorService;
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

	public List<MajorDto> getMajor12List() {
		return major12List;
	}

	public void setMajor12List(List<MajorDto> major12List) {
		this.major12List = major12List;
	}

	public List<MajorDto> getMajor13List() {
		return major13List;
	}

	public void setMajor13List(List<MajorDto> major13List) {
		this.major13List = major13List;
	}

	public List<MajorDto> getMajor14List() {
		return major14List;
	}

	public void setMajor14List(List<MajorDto> major14List) {
		this.major14List = major14List;
	}

	public List<MajorDto> getMajor15List() {
		return major15List;
	}

	public void setMajor15List(List<MajorDto> major15List) {
		this.major15List = major15List;
	}

	public List<MajorDto> getMajor21List() {
		return major21List;
	}

	public void setMajor21List(List<MajorDto> major21List) {
		this.major21List = major21List;
	}

	public List<MajorDto> getMajor22List() {
		return major22List;
	}

	public void setMajor22List(List<MajorDto> major22List) {
		this.major22List = major22List;
	}

	public List<MajorDto> getMajor23List() {
		return major23List;
	}

	public void setMajor23List(List<MajorDto> major23List) {
		this.major23List = major23List;
	}

	public List<MajorDto> getMajor24List() {
		return major24List;
	}

	public void setMajor24List(List<MajorDto> major24List) {
		this.major24List = major24List;
	}

	public List<MajorDto> getMajor25List() {
		return major25List;
	}

	public void setMajor25List(List<MajorDto> major25List) {
		this.major25List = major25List;
	}

	public List<MajorDto> getMajor31List() {
		return major31List;
	}

	public void setMajor31List(List<MajorDto> major31List) {
		this.major31List = major31List;
	}

	public List<MajorDto> getMajor32List() {
		return major32List;
	}

	public void setMajor32List(List<MajorDto> major32List) {
		this.major32List = major32List;
	}

	public List<MajorDto> getMajor33List() {
		return major33List;
	}

	public void setMajor33List(List<MajorDto> major33List) {
		this.major33List = major33List;
	}

	public List<MajorDto> getMajor34List() {
		return major34List;
	}

	public void setMajor34List(List<MajorDto> major34List) {
		this.major34List = major34List;
	}

	public List<MajorDto> getMajor35List() {
		return major35List;
	}

	public void setMajor35List(List<MajorDto> major35List) {
		this.major35List = major35List;
	}

	public List<MajorDto> getMajor41List() {
		return major41List;
	}

	public void setMajor41List(List<MajorDto> major41List) {
		this.major41List = major41List;
	}

	public List<MajorDto> getMajor42List() {
		return major42List;
	}

	public void setMajor42List(List<MajorDto> major42List) {
		this.major42List = major42List;
	}

	public List<MajorDto> getMajor43List() {
		return major43List;
	}

	public void setMajor43List(List<MajorDto> major43List) {
		this.major43List = major43List;
	}

	public List<MajorDto> getMajor44List() {
		return major44List;
	}

	public void setMajor44List(List<MajorDto> major44List) {
		this.major44List = major44List;
	}

	public List<MajorDto> getMajor45List() {
		return major45List;
	}

	public void setMajor45List(List<MajorDto> major45List) {
		this.major45List = major45List;
	}

	public List<MajorDto> getMajor51List() {
		return major51List;
	}

	public void setMajor51List(List<MajorDto> major51List) {
		this.major51List = major51List;
	}

	public List<MajorDto> getMajor52List() {
		return major52List;
	}

	public void setMajor52List(List<MajorDto> major52List) {
		this.major52List = major52List;
	}

	public List<MajorDto> getMajor53List() {
		return major53List;
	}

	public void setMajor53List(List<MajorDto> major53List) {
		this.major53List = major53List;
	}

	public List<MajorDto> getMajor54List() {
		return major54List;
	}

	public void setMajor54List(List<MajorDto> major54List) {
		this.major54List = major54List;
	}

	public List<MajorDto> getMajor55List() {
		return major55List;
	}

	public void setMajor55List(List<MajorDto> major55List) {
		this.major55List = major55List;
	}

	public String getStrMajor11() {
		return strMajor11;
	}

	public void setStrMajor11(String strMajor11) {
		this.strMajor11 = strMajor11;
	}

	public String getStrMajor12() {
		return strMajor12;
	}

	public void setStrMajor12(String strMajor12) {
		this.strMajor12 = strMajor12;
	}

	public String getStrMajor13() {
		return strMajor13;
	}

	public void setStrMajor13(String strMajor13) {
		this.strMajor13 = strMajor13;
	}

	public String getStrMajor14() {
		return strMajor14;
	}

	public void setStrMajor14(String strMajor14) {
		this.strMajor14 = strMajor14;
	}

	public String getStrMajor15() {
		return strMajor15;
	}

	public void setStrMajor15(String strMajor15) {
		this.strMajor15 = strMajor15;
	}

	public String getStrMajor21() {
		return strMajor21;
	}

	public void setStrMajor21(String strMajor21) {
		this.strMajor21 = strMajor21;
	}

	public String getStrMajor22() {
		return strMajor22;
	}

	public void setStrMajor22(String strMajor22) {
		this.strMajor22 = strMajor22;
	}

	public String getStrMajor23() {
		return strMajor23;
	}

	public void setStrMajor23(String strMajor23) {
		this.strMajor23 = strMajor23;
	}

	public String getStrMajor24() {
		return strMajor24;
	}

	public void setStrMajor24(String strMajor24) {
		this.strMajor24 = strMajor24;
	}

	public String getStrMajor25() {
		return strMajor25;
	}

	public void setStrMajor25(String strMajor25) {
		this.strMajor25 = strMajor25;
	}

	public String getStrMajor31() {
		return strMajor31;
	}

	public void setStrMajor31(String strMajor31) {
		this.strMajor31 = strMajor31;
	}

	public String getStrMajor32() {
		return strMajor32;
	}

	public void setStrMajor32(String strMajor32) {
		this.strMajor32 = strMajor32;
	}

	public String getStrMajor33() {
		return strMajor33;
	}

	public void setStrMajor33(String strMajor33) {
		this.strMajor33 = strMajor33;
	}

	public String getStrMajor34() {
		return strMajor34;
	}

	public void setStrMajor34(String strMajor34) {
		this.strMajor34 = strMajor34;
	}

	public String getStrMajor35() {
		return strMajor35;
	}

	public void setStrMajor35(String strMajor35) {
		this.strMajor35 = strMajor35;
	}

	public String getStrMajor41() {
		return strMajor41;
	}

	public void setStrMajor41(String strMajor41) {
		this.strMajor41 = strMajor41;
	}

	public String getStrMajor42() {
		return strMajor42;
	}

	public void setStrMajor42(String strMajor42) {
		this.strMajor42 = strMajor42;
	}

	public String getStrMajor43() {
		return strMajor43;
	}

	public void setStrMajor43(String strMajor43) {
		this.strMajor43 = strMajor43;
	}

	public String getStrMajor44() {
		return strMajor44;
	}

	public void setStrMajor44(String strMajor44) {
		this.strMajor44 = strMajor44;
	}

	public String getStrMajor45() {
		return strMajor45;
	}

	public void setStrMajor45(String strMajor45) {
		this.strMajor45 = strMajor45;
	}

	public String getStrMajor51() {
		return strMajor51;
	}

	public void setStrMajor51(String strMajor51) {
		this.strMajor51 = strMajor51;
	}

	public String getStrMajor52() {
		return strMajor52;
	}

	public void setStrMajor52(String strMajor52) {
		this.strMajor52 = strMajor52;
	}

	public String getStrMajor53() {
		return strMajor53;
	}

	public void setStrMajor53(String strMajor53) {
		this.strMajor53 = strMajor53;
	}

	public String getStrMajor54() {
		return strMajor54;
	}

	public void setStrMajor54(String strMajor54) {
		this.strMajor54 = strMajor54;
	}

	public String getStrMajor55() {
		return strMajor55;
	}

	public void setStrMajor55(String strMajor55) {
		this.strMajor55 = strMajor55;
	}

	public String getMajorNum11() {
		return majorNum11;
	}

	public void setMajorNum11(String majorNum11) {
		this.majorNum11 = majorNum11;
	}

	public String getMajorNum12() {
		return majorNum12;
	}

	public void setMajorNum12(String majorNum12) {
		this.majorNum12 = majorNum12;
	}

	public String getMajorNum13() {
		return majorNum13;
	}

	public void setMajorNum13(String majorNum13) {
		this.majorNum13 = majorNum13;
	}

	public String getMajorNum14() {
		return majorNum14;
	}

	public void setMajorNum14(String majorNum14) {
		this.majorNum14 = majorNum14;
	}

	public String getMajorNum15() {
		return majorNum15;
	}

	public void setMajorNum15(String majorNum15) {
		this.majorNum15 = majorNum15;
	}

	public String getMajorNum21() {
		return majorNum21;
	}

	public void setMajorNum21(String majorNum21) {
		this.majorNum21 = majorNum21;
	}

	public String getMajorNum22() {
		return majorNum22;
	}

	public void setMajorNum22(String majorNum22) {
		this.majorNum22 = majorNum22;
	}

	public String getMajorNum23() {
		return majorNum23;
	}

	public void setMajorNum23(String majorNum23) {
		this.majorNum23 = majorNum23;
	}

	public String getMajorNum24() {
		return majorNum24;
	}

	public void setMajorNum24(String majorNum24) {
		this.majorNum24 = majorNum24;
	}

	public String getMajorNum25() {
		return majorNum25;
	}

	public void setMajorNum25(String majorNum25) {
		this.majorNum25 = majorNum25;
	}

	public String getMajorNum31() {
		return majorNum31;
	}

	public void setMajorNum31(String majorNum31) {
		this.majorNum31 = majorNum31;
	}

	public String getMajorNum32() {
		return majorNum32;
	}

	public void setMajorNum32(String majorNum32) {
		this.majorNum32 = majorNum32;
	}

	public String getMajorNum33() {
		return majorNum33;
	}

	public void setMajorNum33(String majorNum33) {
		this.majorNum33 = majorNum33;
	}

	public String getMajorNum34() {
		return majorNum34;
	}

	public void setMajorNum34(String majorNum34) {
		this.majorNum34 = majorNum34;
	}

	public String getMajorNum35() {
		return majorNum35;
	}

	public void setMajorNum35(String majorNum35) {
		this.majorNum35 = majorNum35;
	}

	public String getMajorNum41() {
		return majorNum41;
	}

	public void setMajorNum41(String majorNum41) {
		this.majorNum41 = majorNum41;
	}

	public String getMajorNum42() {
		return majorNum42;
	}

	public void setMajorNum42(String majorNum42) {
		this.majorNum42 = majorNum42;
	}

	public String getMajorNum43() {
		return majorNum43;
	}

	public void setMajorNum43(String majorNum43) {
		this.majorNum43 = majorNum43;
	}

	public String getMajorNum44() {
		return majorNum44;
	}

	public void setMajorNum44(String majorNum44) {
		this.majorNum44 = majorNum44;
	}

	public String getMajorNum45() {
		return majorNum45;
	}

	public void setMajorNum45(String majorNum45) {
		this.majorNum45 = majorNum45;
	}

	public String getMajorNum51() {
		return majorNum51;
	}

	public void setMajorNum51(String majorNum51) {
		this.majorNum51 = majorNum51;
	}

	public String getMajorNum52() {
		return majorNum52;
	}

	public void setMajorNum52(String majorNum52) {
		this.majorNum52 = majorNum52;
	}

	public String getMajorNum53() {
		return majorNum53;
	}

	public void setMajorNum53(String majorNum53) {
		this.majorNum53 = majorNum53;
	}

	public String getMajorNum54() {
		return majorNum54;
	}

	public void setMajorNum54(String majorNum54) {
		this.majorNum54 = majorNum54;
	}

	public String getMajorNum55() {
		return majorNum55;
	}

	public void setMajorNum55(String majorNum55) {
		this.majorNum55 = majorNum55;
	}

	public List<BidDto> getListBidExport() {
		return listBidExport;
	}

	public void setListBidExport(List<BidDto> listBidExport) {
		this.listBidExport = listBidExport;
	}

	public BidDto getExportBidDto() {
		return exportBidDto;
	}

	public void setExportBidDto(BidDto exportBidDto) {
		this.exportBidDto = exportBidDto;
	}

	public BidExtendDto getBidExtendDto() {
		return bidExtendDto;
	}

	public void setBidExtendDto(BidExtendDto bidExtendDto) {
		this.bidExtendDto = bidExtendDto;
	}

	public String getStrBidNoStart() {
		return strBidNoStart;
	}

	public void setStrBidNoStart(String strBidNoStart) {
		this.strBidNoStart = strBidNoStart;
	}

	public String getStrBidNoEnd() {
		return strBidNoEnd;
	}

	public void setStrBidNoEnd(String strBidNoEnd) {
		this.strBidNoEnd = strBidNoEnd;
	}

	public List<ExpertLibDto> getListExpertComp() {
		return listExpertComp;
	}

	public void setListExpertComp(List<ExpertLibDto> listExpertComp) {
		this.listExpertComp = listExpertComp;
	}

	public String getStrIsInclude() {
		return strIsInclude;
	}

	public void setStrIsInclude(String strIsInclude) {
		this.strIsInclude = strIsInclude;
	}

	public String getStrExpertName() {
		return strExpertName;
	}

	public void setStrExpertName(String strExpertName) {
		this.strExpertName = strExpertName;
	}

	public String getStrExpertComp() {
		return strExpertComp;
	}

	public void setStrExpertComp(String strExpertComp) {
		this.strExpertComp = strExpertComp;
	}

	public List<BidDto> getListAgentCo() {
		return listAgentCo;
	}

	public void setListAgentCo(List<BidDto> listAgentCo) {
		this.listAgentCo = listAgentCo;
	}

	public List<BidDto> getListBidCo() {
		return listBidCo;
	}

	public void setListBidCo(List<BidDto> listBidCo) {
		this.listBidCo = listBidCo;
	}

	public List<BidDto> getListProjectMg() {
		return listProjectMg;
	}

	public void setListProjectMg(List<BidDto> listProjectMg) {
		this.listProjectMg = listProjectMg;
	}
	
}
