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
import com.cn.common.factory.Poi2007Base;
import com.cn.common.factory.PoiFactory;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.AgentCompDto;
import com.cn.tbps.dto.AjaxDataDto;
import com.cn.tbps.service.AgentCompService;
import com.opensymphony.xwork2.ActionContext;

import net.sf.json.JSONArray;

/**
 * 委托公司管理Action
 * @author Frank
 * @time 2013-10-14下午10:04:45
 * @version 1.0
 */
public class AgentCompAction extends BaseAction {

	private static final long serialVersionUID = -446028602607043389L;
	
	private static final Logger log = LogManager.getLogger(AgentCompAction.class);
	
	private AgentCompService agentCompService;
	
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
	private List<AgentCompDto> listAgentComp;
	
	/**
	 * 委托公司代码（起）
	 */
	private String strAgentCompNoLow;
	
	/**
	 * 委托公司代码（终）
	 */
	private String strAgentCompNoHigh;
	
	/**
	 * 委托公司名称
	 */
	private String strAgentCompName;
	
	/**
	 * 委托公司key
	 */
	private String radioCom;
	
	/**
	 * 新增委托公司对象
	 */
	private AgentCompDto addAgentCompDto;
	
	/**
	 * 修改的委托公司编号
	 */
	private String updateAgentCompNo;
	
	/**
	 * 修改委托公司对象
	 */
	private AgentCompDto updateAgentCompDto;
	
	/**
	 * 删除的委托公司编号
	 */
	private String delAgentCompNo;
	
	/**
	 * ajax查询条件-委托公司编号
	 */
	private String queryAgentCompNo;
	
	//委托公司查询页面（共通）
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
	
	private String agentCompName;
	
	private String agentAddFlag;

	/**
	 * 控件ID
	 */
	private String strKey;
	
	//ajax查询数据列表
	private Integer ajaxTotalCount;
	private Integer ajaxPageIndex;
	
	/**
	 * Ajax翻页查询函数
	 * @return
	 * @throws IOException
	 */
	public String queryAgentCompAjax() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		AjaxDataDto ajaxData = new AjaxDataDto();
		try {
			this.clearMessages();
			Page pp = new Page(8);
			pp.setTotalCount(ajaxTotalCount);
			pp.setStartIndex(ajaxPageIndex);
			pp = agentCompService.queryAgentCompByPage(pp, agentCompNoLow, agentCompNoHigh, agentAddFlag, agentCompName);
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
	 * 查询委托公司（选择委托公司）
	 * @return
	 */
	public String showAgentCompCommonAction() {
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
			queryAgentCommon();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询委托公司信息（选择委托公司）
	 * @return
	 */
	public String queryAgentCompCommonAction() {
		try {
			this.clearMessages();
			//查询评审专家信息
			startIndexAgentComp = 0;
			queryAgentCommon();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 委托公司信息翻页（选择委托公司）
	 * @return
	 */
	public String turnAgentCompCommonAction() {
		try {
			this.clearMessages();
			//查询委托公司信息
			queryAgentCommon();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询委托公司（选择委托公司）
	 * @return
	 */
	public String showAgentCompAuditAction() {
		try {
			this.clearMessages();
			//查询评审专家信息
			log.info("agentAddFlag=" + agentAddFlag);
			agentCompNoLow = "";
			agentCompNoHigh = "";
			agentCompName = "";
			agentCompList = new ArrayList<AgentCompDto>();
			page = new Page();
			startIndex = 0;
			queryAgentAudit();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询委托公司信息（选择委托公司）
	 * @return
	 */
	public String queryAgentCompAuditAction() {
		try {
			this.clearMessages();
			//查询评审专家信息
			startIndex = 0;
			queryAgentAudit();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 委托公司信息翻页（选择委托公司）
	 * @return
	 */
	public String turnAgentCompAuditAction() {
		try {
			this.clearMessages();
			//查询委托公司信息
			queryAgentAudit();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	private void queryAgentAudit() {
		agentCompList = new ArrayList<AgentCompDto>();
		if(page == null) {
			page = new Page();
		}
		//翻页查询所有招标
		this.page.setStartIndex(startIndex);
		//这里只查询委托公司：J打头的
		//pageAgentComp = agentCompService.queryAgentCompByPage(pageAgentComp, agentCompNoLow, agentCompNoHigh, "1", agentCompName);
		page = agentCompService.queryAgentCompByPage(page, agentCompNoLow, agentCompNoHigh, agentAddFlag, agentCompName);
		agentCompList = (List<AgentCompDto>) page.getItems();
		this.setStartIndex(page.getStartIndex());
	}
	
	/**
	 * ajax查询
	 * @return
	 * @throws IOException 
	 */
	public String queryAgentCompById() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		String result = "";
		try {
			this.clearMessages();
			log.info("queryAgentCompNo=" + queryAgentCompNo);
			AgentCompDto agentComp = agentCompService.queryAgentCompByID(queryAgentCompNo);
			if(agentComp != null) {
				result += "{\"result\":\"0\",\"ANGENT_COMP_NO\":\"" + agentComp.getANGENT_COMP_NO() + "\",";
				result += "\"ANGENT_COMP_NAME\":\"" + agentComp.getANGENT_COMP_NAME() + "\"}";
			} else {
				result = "{\"result\":\"-2\"}";
			}
		} catch(Exception e) {
			result = "{\"result\":\"-1\"}";
			log.error("queryAgentCompById error." + e);
		}
		out = response.getWriter();
		log.info("queryAgentCompById result=" + result);
		out.write(result);
		out.flush();
		return null;
	}
	
	/**
	 * 显示添加委托公司页面
	 * @return
	 */
	public String showAddAgentCompAction() {
		try {
			this.clearMessages();
			addAgentCompDto = new AgentCompDto();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 添加委托公司
	 * @return
	 */
	public String addAgentCompAction() {
		try {
			this.clearMessages();
			//数据校验
			if(!checkData(addAgentCompDto)) {
				return "checkerror";
			}
			log.info("addAgentCompDto.getANGENT_COMP_NO()=" + addAgentCompDto.getANGENT_COMP_NO());
			log.info("addAgentCompDto.getANGENT_COMP_NAME()=" + addAgentCompDto.getANGENT_COMP_NAME());
			//校验委托公司代码是否存在
			AgentCompDto agetncomp = agentCompService.queryAllAgentCompByID(addAgentCompDto.getANGENT_COMP_NO());
			if(agetncomp != null) {
				this.addActionMessage("委托公司代码已经存在！");
				return "checkerror";
			}
			//保存数据
			addAgentCompDto.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			addAgentCompDto.setUPDATE_USER(username);
			agentCompService.insertAgentComp(addAgentCompDto);
			this.addActionMessage("添加委托公司成功！");
			addAgentCompDto = new AgentCompDto();
		} catch(Exception e) {
			this.addActionMessage("系统异常，添加委托公司失败！");
			log.error("addAgentCompAction error:" + e);
			return "checkerror";
		}
		return SUCCESS;
	}
	
	/**
	 * 显示修改委托公司页面
	 * @return
	 */
	public String showUpdAgentCompAction() {
		try {
			this.clearMessages();
			updateAgentCompDto = agentCompService.queryAgentCompByID(updateAgentCompNo);
			if(updateAgentCompDto == null) {
				this.addActionMessage("该数据不存在！");
				return "checkerror";
			}
		} catch(Exception e) {
			this.addActionMessage("系统错误，查询委托公司异常！");
			log.error("showUpdAgentCompAction error:" + e);
			return "checkerror";
		}
		return SUCCESS;
	}
	
	/**
	 * 修改委托公司
	 * @return
	 */
	public String updAgentCompAction() {
		try {
			this.clearMessages();
			//数据校验
			if(!checkData(updateAgentCompDto)) {
				return "checkerror";
			}
			//修改数据
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			updateAgentCompDto.setUPDATE_USER(username);
			agentCompService.updateAgentComp(updateAgentCompDto);
			this.addActionMessage("修改委托公司成功！");
		} catch(Exception e) {
			this.addActionMessage("系统异常，修改委托公司失败！");
			log.error("updAgentCompAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 删除委托公司
	 * @return
	 */
	public String delAgentCompAction() {
		try {
			this.clearMessages();
			if(StringUtil.isBlank(delAgentCompNo)) {
				this.addActionMessage("委托公司代码为空！");
				return "checkerror";
			}
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			//删除
			agentCompService.deleteAgentComp(delAgentCompNo, username);
			this.addActionMessage("删除委托公司成功！");
			delAgentCompNo = "";
			//刷新页面
			startIndex = 0;
			queryAgentComp();
		} catch(Exception e) {
			log.error("delAgentCompAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 导出委托公司数据
	 * @return
	 */
	public String exportAgentCompAction() {
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_WTGSYL);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_WTGSYL);
			//查询数据
			List<AgentCompDto> list = agentCompService.queryAllAgentCompExport(strAgentCompNoLow, strAgentCompNoHigh, radioCom, strAgentCompName);
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_WTGSYL);
			base.exportExcel(response.getOutputStream());
			return SUCCESS;
		} catch(Exception e) {
			return ERROR;
		}
	}

	/**
	 * 显示委托公司管理页面
	 * @return
	 */
	public String showAgentCompAction() {
		try {
			this.clearMessages();
			strAgentCompNoLow = "";
			strAgentCompNoHigh = "";
			strAgentCompName = "";
			radioCom = "";
			addAgentCompDto = new AgentCompDto();
			updateAgentCompDto = new AgentCompDto();
			updateAgentCompNo = "";
			delAgentCompNo = "";
			page = new Page();
			startIndex = 0;
			listAgentComp = new ArrayList<AgentCompDto>();
			
			agentAddFlag = "";
			//queryAgentComp();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询委托公司列表
	 * @return
	 */
	public String queryAgentCompList() {
		try {
			this.clearMessages();
			page = new Page();
			startIndex = 0;
			queryAgentComp();
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
	public String turnAgentCompPage() {
		try {
			this.clearMessages();
			queryAgentComp();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	private void queryAgentCommon() {
		agentCompList = new ArrayList<AgentCompDto>();
		if(pageAgentComp == null) {
			pageAgentComp = new Page();
		}
		//翻页查询所有招标
		this.pageAgentComp.setStartIndex(startIndexAgentComp);
		//这里只查询委托公司：J打头的
		//pageAgentComp = agentCompService.queryAgentCompByPage(pageAgentComp, agentCompNoLow, agentCompNoHigh, "1", agentCompName);
		pageAgentComp = agentCompService.queryAgentCompByPage(pageAgentComp, agentCompNoLow, agentCompNoHigh, agentAddFlag, agentCompName);
		agentCompList = (List<AgentCompDto>) pageAgentComp.getItems();
		this.setStartIndexAgentComp(pageAgentComp.getStartIndex());
	}
	
	/**
	 * 翻页查询所有委托公司列表
	 */
	@SuppressWarnings("unchecked")
	private void queryAgentComp() {
		listAgentComp = new ArrayList<AgentCompDto>();
		if(page == null) {
			page = new Page();
		}
		//翻页查询所有委托公司
		this.page.setStartIndex(startIndex);
		//这里不需要委托公司名称（没有委托公司名称作为查询条件）
		//page = agentCompService.queryAgentCompByPage(page, strAgentCompNoLow, strAgentCompNoHigh, "", "");
		//这里需要委托公司名称，并且委托单位及承揽单位分开
		System.out.println("strAgentCompName: " + strAgentCompName);
		System.out.println("radioCom: " + radioCom);
		page = agentCompService.queryAgentCompByPage(page, strAgentCompNoLow, strAgentCompNoHigh, radioCom, strAgentCompName);
		listAgentComp = (List<AgentCompDto>) page.getItems();
		this.setStartIndex(page.getStartIndex());
	}
	
	/**
	 * 验证数据格式
	 * @param agentcomp
	 * @return
	 */
	private boolean checkData(AgentCompDto agentcomp) {
		if(agentcomp == null) {
			this.addActionMessage("委托公司代码不能为空！");
			return false;
		}
		if(StringUtil.isBlank(agentcomp.getANGENT_COMP_NO())) {
			this.addActionMessage("委托公司代码不能为空！");
			return false;
		}
		if(StringUtil.isBlank(agentcomp.getANGENT_COMP_NAME())) {
			this.addActionMessage("委托公司名称不能为空！");
			return false;
		}
		if(agentcomp.getANGENT_COMP_NAME().length() > 40) {
			this.addActionMessage("委托公司名称不能超过40个字符！");
			return false;
		}
		if(StringUtil.isNotBlank(agentcomp.getMEMO1()) && agentcomp.getMEMO1().length() > 100) {
			this.addActionMessage("备考不能超过100个字符！");
			return false;
		}
		return true;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public Integer getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}

	public List<AgentCompDto> getListAgentComp() {
		return listAgentComp;
	}

	public void setListAgentComp(List<AgentCompDto> listAgentComp) {
		this.listAgentComp = listAgentComp;
	}

	public AgentCompService getAgentCompService() {
		return agentCompService;
	}

	public void setAgentCompService(AgentCompService agentCompService) {
		this.agentCompService = agentCompService;
	}

	public String getStrAgentCompNoLow() {
		return strAgentCompNoLow;
	}

	public void setStrAgentCompNoLow(String strAgentCompNoLow) {
		this.strAgentCompNoLow = strAgentCompNoLow;
	}

	public String getStrAgentCompNoHigh() {
		return strAgentCompNoHigh;
	}

	public void setStrAgentCompNoHigh(String strAgentCompNoHigh) {
		this.strAgentCompNoHigh = strAgentCompNoHigh;
	}

	public AgentCompDto getAddAgentCompDto() {
		return addAgentCompDto;
	}

	public void setAddAgentCompDto(AgentCompDto addAgentCompDto) {
		this.addAgentCompDto = addAgentCompDto;
	}

	public AgentCompDto getUpdateAgentCompDto() {
		return updateAgentCompDto;
	}

	public void setUpdateAgentCompDto(AgentCompDto updateAgentCompDto) {
		this.updateAgentCompDto = updateAgentCompDto;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public String getUpdateAgentCompNo() {
		return updateAgentCompNo;
	}

	public void setUpdateAgentCompNo(String updateAgentCompNo) {
		this.updateAgentCompNo = updateAgentCompNo;
	}

	public String getDelAgentCompNo() {
		return delAgentCompNo;
	}

	public void setDelAgentCompNo(String delAgentCompNo) {
		this.delAgentCompNo = delAgentCompNo;
	}

	public String getQueryAgentCompNo() {
		return queryAgentCompNo;
	}

	public void setQueryAgentCompNo(String queryAgentCompNo) {
		this.queryAgentCompNo = queryAgentCompNo;
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

	public String getStrKey() {
		return strKey;
	}

	public void setStrKey(String strKey) {
		this.strKey = strKey;
	}

	public String getStrAgentCompName() {
		return strAgentCompName;
	}

	public void setStrAgentCompName(String strAgentCompName) {
		this.strAgentCompName = strAgentCompName;
	}

	public String getRadioCom() {
		return radioCom;
	}

	public void setRadioCom(String radioCom) {
		this.radioCom = radioCom;
	}

	public String getAgentCompName() {
		return agentCompName;
	}

	public void setAgentCompName(String agentCompName) {
		this.agentCompName = agentCompName;
	}
	
	public String getAgentAddFlag() {
		return agentAddFlag;
	}

	public void setAgentAddFlag(String agentAddFlag) {
		this.agentAddFlag = agentAddFlag;
	}

	public Integer getAjaxPageIndex() {
		return ajaxPageIndex;
	}

	public void setAjaxPageIndex(Integer ajaxPageIndex) {
		this.ajaxPageIndex = ajaxPageIndex;
	}

	public Integer getAjaxTotalCount() {
		return ajaxTotalCount;
	}

	public void setAjaxTotalCount(Integer ajaxTotalCount) {
		this.ajaxTotalCount = ajaxTotalCount;
	}
}
