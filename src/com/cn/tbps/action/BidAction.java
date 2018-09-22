package com.cn.tbps.action;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.BidCompDto;
import com.cn.tbps.dto.BidDto;
import com.cn.tbps.dto.ExpertLibDto;
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
	
	//修改
	/**
	 * 修改招标编号
	 */
	private String updateBidNo;
	
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
	
	/**
	 * 显示添加招标页面
	 * @return
	 */
	public String showAddBidAction() {
		try {
			this.clearMessages();
			listBidComp = new ArrayList<BidCompDto>();
			listExpertLib = new ArrayList<ExpertLibDto>();
			listBidCompTmp = new ArrayList<BidCompDto>();
			listExpertLibTmp = new ArrayList<ExpertLibDto>();
			
			listUserInfo = userInfoService.queryAllUser();
			listSuperviseLib = superviseLibService.queryAllSuperviseLib();
			addBidDto = new BidDto();
			//默认为不随机
//			addBidDto.setIS_RANDOM("0");
			addBidDto.setSTATUS("0");
			//承接项目日期默认=当天
			addBidDto.setPROJECT_DEVIEW_DATE(new Date());
			String userid = (String) ActionContext.getContext().getSession().get(Constants.USER_ID);
			//默认专家费申请人=当前用户
			addBidDto.setBID_EXPERT_COMMISION_APPLY(userid);
			//默认评审人=当前用户
			addBidDto.setBID_AUTH(userid);
			//标书费金额默认0.1万元
			addBidDto.setBID_APPLY_PRICE(new BigDecimal(0.1).setScale(2, BigDecimal.ROUND_HALF_UP));
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
			//数据校验
			if(!checkUpdData(addBidDto)) {
				return "checkerror";
			}
			
			//分类=招标办，则校验招标编号是否存在
			if("3".equals(addBidDto.getCNTRCT_TYPE())) {
				//分类=招标办，则校验招标编号是否存在
				BidDto bid = bidService.queryAllBidByID(addBidDto.getBID_NO());
				if(bid != null) {
					this.addActionMessage("招标编号" + addBidDto.getBID_NO() + "已经存在！");
					return "checkerror";
				}
			} else {
				if("0".equals(addBidDto.getIS_RANDOM())) {
					//非随机生成招标编号
					BidDto bid = bidService.queryAllBidByID(addBidDto.getBID_NO());
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
			
			String bidNo = bidService.insertBidNew(addBidDto, listBidComp, listExpertLib);
			this.addActionMessage("新增招标记录成功！招标编号：" + bidNo);
			//初始化数据
			addBidDto = new BidDto();
			//默认为不随机
//			addBidDto.setIS_RANDOM("0");
			addBidDto.setSTATUS("0");
			//承接项目日期默认=当天
			addBidDto.setPROJECT_DEVIEW_DATE(new Date());
			String userid = (String) ActionContext.getContext().getSession().get(Constants.USER_ID);
			//默认专家费申请人=当前用户
			addBidDto.setBID_EXPERT_COMMISION_APPLY(userid);
			//默认评审人=当前用户
			addBidDto.setBID_AUTH(userid);
			//标书费金额默认0.1万元
			addBidDto.setBID_APPLY_PRICE(new BigDecimal(0.1).setScale(2, BigDecimal.ROUND_HALF_UP));
			
			listBidComp = new ArrayList<BidCompDto>();
			listExpertLib = new ArrayList<ExpertLibDto>();
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
			this.clearMessages();
			updateBidDto = bidService.queryAllBidByID(updateBidNo);
			if(updateBidDto == null) {
				this.addActionMessage("该数据不存在！");
				return "checkerror";
			}
			
			listBidCompTmp = new ArrayList<BidCompDto>();
			listExpertLibTmp = new ArrayList<ExpertLibDto>();
			listUserInfo = userInfoService.queryAllUser();
			listSuperviseLib = superviseLibService.queryAllSuperviseLib();
			
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
			
			//数据校验
			if(!checkUpdData(updateBidDto)) {
				return "checkerror";
			}
			//修改数据
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			updateBidDto.setUPDATE_USER(username);
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
		listBid = new ArrayList<BidDto>();
		if(page == null) {
			page = new Page();
		}
		//翻页查询所有招标
		this.page.setStartIndex(startIndex);
		bidService.queryBidAndBidCntrctByPage("", "", strProjectName, strBidNoLow, strBidNoHigh,
				"", "", "", "", "", "", "", page);
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
}
