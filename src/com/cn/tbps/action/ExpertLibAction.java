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
import com.cn.common.factory.Poi2007Base;
import com.cn.common.factory.PoiFactory;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.AjaxDataDto;
import com.cn.tbps.dto.ExpertLibDto;
import com.cn.tbps.dto.MajorDto;
import com.cn.tbps.service.ExpertLibService;
import com.cn.tbps.service.MajorService;
import com.opensymphony.xwork2.ActionContext;

import net.sf.json.JSONArray;

/**
 * @name ExpertLibAction.java
 * @author Frank
 * @time 2013-10-19下午4:27:27
 * @version 1.0
 */
public class ExpertLibAction extends BaseAction {

	private static final long serialVersionUID = -1393994706874360523L;
	
	private static final Logger log = LogManager.getLogger(ExpertLibAction.class);
	
	private ExpertLibService expertLibService;
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
	 * 专家信息列表
	 */
	private List<ExpertLibDto> listExpertLib;
	
	/**
	 * 专家名
	 */
	private String strExpertName;
	
	/**
	 * 专业
	 */
	private String strExpertMajor;
	private String strExpertMajorName;
	
	/**
	 * 新增专家信息DTO
	 */
	private ExpertLibDto addExpertLibDto;
	
	/**
	 * 修改专家信息的序号
	 */
	private String updateExpertLibSeq;
	
	/**
	 * 修改专家信息DTO
	 */
	private ExpertLibDto updateExpertLibDto;
	
	/**
	 * 删除的专家信息序号
	 */
	private String delExpertLibSeq;
	
	//专业列表
	private String strMajor11;
	private String strMajor12;
	private String strMajor13;
	private String strMajor14;
	private String strMajor15;
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
	private List<MajorDto> major51List;
	private List<MajorDto> major52List;
	private List<MajorDto> major53List;
	private List<MajorDto> major54List;
	private List<MajorDto> major55List;
	//所有专业
	private List<MajorDto> majorAllList;
	
	private String strParentMajorCode;
	private String strParentMajorType;
	
	//ajax查询数据列表
	private Integer ajaxTotalCount;
	private Integer ajaxPageIndex;
	
	/**
	 * Ajax翻页查询函数
	 * @return
	 * @throws IOException
	 */
	public String queryExpertLibAjax() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		AjaxDataDto ajaxData = new AjaxDataDto();
		try {
			this.clearMessages();
			//ajax中文乱码处理
			strExpertName = URLDecoder.decode(strExpertName, "UTF-8");
			strExpertMajor = URLDecoder.decode(strExpertMajor, "UTF-8");
			Page pp = new Page(8);
			pp.setTotalCount(ajaxTotalCount);
			pp.setStartIndex(ajaxPageIndex);
			pp = expertLibService.queryExpertLibByPageNew(strExpertName, strExpertMajor, pp);
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
	 * 显示专业选择页面
	 * @return
	 */
	public String showSelectMajorPage() {
		try {
			this.clearMessages();
			strExpertMajor = "";
			strExpertMajorName = "";
			majorAllList = majorService.queryAllMajor("", "");
		} catch(Exception e) {
			log.error("showSelectMajorPage error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 根据专业父节点code查询子节点
	 * @return
	 * @throws IOException 
	 */
	public String queryChildExpertLibByParentid() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		String result = "";
		try {
			this.clearMessages();
			List<MajorDto> list = majorService.queryAllMajor(strParentMajorType, strParentMajorCode);
			if(list != null && list.size() > 0) {
				result = JSONArray.fromObject(list).toString();
			}
		} catch(Exception e) {
			log.error("queryChildExpertLibByParentid error:" + e);
			return ERROR;
		}
		out = response.getWriter();
		out.write(result);
		out.flush();
		return null;
	}
	
	/**
	 * 导出专家信息
	 * @return
	 */
	public String exportExpertLibAction() {
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_ZJXXYL);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_ZJXXYL);
			
			//查询所有专家信息
			//List<ExpertLibDto> list = expertLibService.queryAllExpertLibExportOr(strExpertName, strExpertMajor);
			List<ExpertLibDto> list = expertLibService.queryAllExpertLibExportNew(strExpertName, strExpertMajor);
			
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_ZJXXYL);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			log.error("exportExpertLibAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示添加专家页面
	 * @return
	 */
	public String showAddExpertLibAction() {
		try {
			this.clearMessages();
			addExpertLibDto = new ExpertLibDto();
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
	 * 添加专家信息
	 * @return
	 */
	public String addExpertLibAction() {
		try {
			this.clearMessages();
			initMajorList();
			//数据校验
			if(!checkData(addExpertLibDto)) {
				return "checkerror";
			}
			if(addExpertLibDto.getEXPERT_BIRTH() == null || addExpertLibDto.getEXPERT_BIRTH().equals("")) 
				addExpertLibDto.setEXPERT_BIRTH(null);

			//保存数据
			addExpertLibDto.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			addExpertLibDto.setUPDATE_USER(username);
			expertLibService.insertExpertLib(addExpertLibDto);
			this.addActionMessage("添加专家信息成功！");
			
			addExpertLibDto = new ExpertLibDto();
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
		} catch(Exception e) {
			this.addActionMessage("系统异常，添加专家信息失败！");
			log.error("addExpertLibAction error:" + e);
			return "checkerror";
		}
		return SUCCESS;
	}
	
	/**
	 * 显示修改专家信息页面
	 * @return
	 */
	public String showUpdExpertLibAction() {
		try {
			this.clearMessages();
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
			
			updateExpertLibDto = expertLibService.queryExpertLibByID(updateExpertLibSeq);
			
			if(updateExpertLibDto == null) {
				this.addActionMessage("该数据不存在！");
				return "checkerror";
			}
			
			//根据专家的专业，初期化数据
			if(StringUtil.isNotBlank(updateExpertLibDto.getEXPERT_MAJOR())) {
				String EXPERT_MAJOR = updateExpertLibDto.getEXPERT_MAJOR();
				//去掉前后逗号
				if(EXPERT_MAJOR.startsWith(",")) {
					EXPERT_MAJOR = EXPERT_MAJOR.substring(1, EXPERT_MAJOR.length() - 1);
				}
				String[] majors = EXPERT_MAJOR.split(",");
				if(majors.length >= 1) {
					if(majors[0].length() >= 9) {
						strMajor14 = majors[0].substring(0, 9);
					}
					if(majors[0].length() >= 7) {
						strMajor13 = majors[0].substring(0, 7);
					}
					if(majors[0].length() >= 5) {
						strMajor12 = majors[0].substring(0, 5);
					}
					if(majors[0].length() >= 3) {
						strMajor11 = majors[0].substring(0, 3);
					}
				}
				if(majors.length >= 2) {
					if(majors[1].length() >= 9) {
						strMajor24 = majors[1].substring(0, 9);
					}
					if(majors[1].length() >= 7) {
						strMajor23 = majors[1].substring(0, 7);
					}
					if(majors[1].length() >= 5) {
						strMajor22 = majors[1].substring(0, 5);
					}
					if(majors[1].length() >= 3) {
						strMajor21 = majors[1].substring(0, 3);
					}
				}
				if(majors.length >= 3) {
					if(majors[2].length() >= 9) {
						strMajor34 = majors[2].substring(0, 9);
					}
					if(majors[2].length() >= 7) {
						strMajor33 = majors[2].substring(0, 7);
					}
					if(majors[2].length() >= 5) {
						strMajor32 = majors[2].substring(0, 5);
					}
					if(majors[2].length() >= 3) {
						strMajor31 = majors[2].substring(0, 3);
					}
				}
				if(majors.length >= 4) {
					if(majors[3].length() >= 9) {
						strMajor44 = majors[3].substring(0, 9);
					}
					if(majors[3].length() >= 7) {
						strMajor43 = majors[3].substring(0, 7);
					}
					if(majors[3].length() >= 5) {
						strMajor42 = majors[3].substring(0, 5);
					}
					if(majors[3].length() >= 3) {
						strMajor41 = majors[3].substring(0, 3);
					}
				}
				if(majors.length >= 5) {
					if(majors[4].length() >= 9) {
						strMajor54 = majors[4].substring(0, 9);
					}
					if(majors[4].length() >= 7) {
						strMajor53 = majors[4].substring(0, 7);
					}
					if(majors[4].length() >= 5) {
						strMajor52 = majors[4].substring(0, 5);
					}
					if(majors[4].length() >= 3) {
						strMajor51 = majors[4].substring(0, 3);
					}
				}
			}
			initMajorList();
		} catch(Exception e) {
			this.addActionMessage("系统错误，查询专家信息异常！");
			log.error("showUpdExpertLibAction error:" + e);
			return "checkerror";
		}
		return SUCCESS;
	}
	
	/**
	 * 修改专家信息
	 * @return
	 */
	public String updExpertLibAction() {
		try {
			this.clearMessages();
			initMajorList();
			//数据校验
			if(!checkData(updateExpertLibDto)) {
				return "checkerror";
			}
			if(updateExpertLibDto.getEXPERT_BIRTH() == null || updateExpertLibDto.getEXPERT_BIRTH().equals("")) 
				updateExpertLibDto.setEXPERT_BIRTH(null);
			//修改数据
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			updateExpertLibDto.setUPDATE_USER(username);
			
			expertLibService.updateExpertLib(updateExpertLibDto);
			this.addActionMessage("修改专家信息成功！");
		} catch(Exception e) {
			this.addActionMessage("系统异常，修改专家信息失败！");
			log.error("updExpertLibAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 删除专家信息
	 * @return
	 */
	public String delExpertLibAction() {
		try {
			this.clearMessages();
			if(StringUtil.isBlank(delExpertLibSeq)) {
				this.addActionMessage("专家序号为空！");
				return "checkerror";
			}
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			//删除
			expertLibService.deleteExpertLib(delExpertLibSeq, username);
			this.addActionMessage("删除专家信息成功！");
			delExpertLibSeq = "";
			//刷新页面
			startIndex = 0;
			queryExpertLib();
		} catch(Exception e) {
			log.error("delExpertLibAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示专家库管理页面
	 * @return
	 */
	public String showExpertLibAction() {
		try {
			this.clearMessages();
			strExpertName = "";
			strExpertMajor = "";
			addExpertLibDto = new ExpertLibDto();
			updateExpertLibDto = new ExpertLibDto();
			updateExpertLibSeq = "";
			delExpertLibSeq = "";
			page = new Page();
			startIndex = 0;
			majorAllList = majorService.queryAllMajor("", "");
			listExpertLib = new ArrayList<ExpertLibDto>();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询专家库管列表
	 * @return
	 */
	public String queryExpertLibList() {
		try {
			this.clearMessages();
			page = new Page();
			startIndex = 0;
			queryExpertLib();
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
	public String turnExpertLibPage() {
		try {
			this.clearMessages();
			queryExpertLib();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 初始化专业列表数据
	 */
	private void initMajorList() {
		//所有专业
		majorAllList = majorService.queryAllMajor("", "");
		
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
	
	/**
	 * 翻页查询所有专家库列表
	 */
	@SuppressWarnings("unchecked")
	private void queryExpertLib() {
		majorAllList = majorService.queryAllMajor("", "");
		listExpertLib = new ArrayList<ExpertLibDto>();
		if(page == null) {
			page = new Page();
		}
		//翻页查询所有专家信息
		this.page.setStartIndex(startIndex);
		//page = expertLibService.queryExpertLibByPageOr(page, strExpertName, strExpertMajor);
		page = expertLibService.queryExpertLibByPageNew(strExpertName, strExpertMajor, page);
		listExpertLib = (List<ExpertLibDto>) page.getItems();
		this.setStartIndex(page.getStartIndex());
	}
	
	/**
	 * 验证数据格式
	 * @param expertlib
	 * @return
	 */
	private boolean checkData(ExpertLibDto expertlib) {
		if(expertlib == null) {
			this.addActionMessage("专家名不能为空！");
			return false;
		}
		if(StringUtil.isBlank(expertlib.getEXPERT_NAME())) {
			this.addActionMessage("专家名不能为空！");
			return false;
		}
		if(StringUtil.isBlank(expertlib.getEXPERT_GENDER())) {
			this.addActionMessage("请选择性别！");
			return false;
		}
/*		if(expertlib.getEXPERT_BIRTH() == null) {
			this.addActionMessage("生日不能为空！");
			return false;
		}*/
		if(StringUtil.isBlank(expertlib.getEXPERT_TEL1())) {
			this.addActionMessage("手机不能为空！");
			return false;
		}
		if(!StringUtil.isMobile(expertlib.getEXPERT_TEL1())) {
			this.addActionMessage("手机号码格式不正确！");
			return false;
		}
		if(StringUtil.isBlank(expertlib.getEXPERT_COMP())) {
			this.addActionMessage("就职公司不能为空！");
			return false;
		}
		if(StringUtil.isBlank(expertlib.getEXPERT_MAJOR())) {
			this.addActionMessage("请选择专业！");
			return false;
		}
		if(StringUtil.isBlank(expertlib.getEXPERT_QULI())) {
			this.addActionMessage("职称不能为空！");
			return false;
		}
		return true;
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

	public ExpertLibService getExpertLibService() {
		return expertLibService;
	}

	public void setExpertLibService(ExpertLibService expertLibService) {
		this.expertLibService = expertLibService;
	}

	public List<ExpertLibDto> getListExpertLib() {
		return listExpertLib;
	}

	public void setListExpertLib(List<ExpertLibDto> listExpertLib) {
		this.listExpertLib = listExpertLib;
	}

	public String getStrExpertName() {
		return strExpertName;
	}

	public void setStrExpertName(String strExpertName) {
		this.strExpertName = strExpertName;
	}

	public String getStrExpertMajor() {
		return strExpertMajor;
	}

	public void setStrExpertMajor(String strExpertMajor) {
		this.strExpertMajor = strExpertMajor;
	}

	public ExpertLibDto getAddExpertLibDto() {
		return addExpertLibDto;
	}

	public void setAddExpertLibDto(ExpertLibDto addExpertLibDto) {
		this.addExpertLibDto = addExpertLibDto;
	}

	public ExpertLibDto getUpdateExpertLibDto() {
		return updateExpertLibDto;
	}

	public void setUpdateExpertLibDto(ExpertLibDto updateExpertLibDto) {
		this.updateExpertLibDto = updateExpertLibDto;
	}

	public String getDelExpertLibSeq() {
		return delExpertLibSeq;
	}

	public void setDelExpertLibSeq(String delExpertLibSeq) {
		this.delExpertLibSeq = delExpertLibSeq;
	}

	public String getUpdateExpertLibSeq() {
		return updateExpertLibSeq;
	}

	public void setUpdateExpertLibSeq(String updateExpertLibSeq) {
		this.updateExpertLibSeq = updateExpertLibSeq;
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

	public List<MajorDto> getMajorAllList() {
		return majorAllList;
	}

	public void setMajorAllList(List<MajorDto> majorAllList) {
		this.majorAllList = majorAllList;
	}

	public String getStrParentMajorCode() {
		return strParentMajorCode;
	}

	public void setStrParentMajorCode(String strParentMajorCode) {
		this.strParentMajorCode = strParentMajorCode;
	}

	public MajorService getMajorService() {
		return majorService;
	}

	public void setMajorService(MajorService majorService) {
		this.majorService = majorService;
	}

	public String getStrParentMajorType() {
		return strParentMajorType;
	}

	public void setStrParentMajorType(String strParentMajorType) {
		this.strParentMajorType = strParentMajorType;
	}

	public String getStrExpertMajorName() {
		return strExpertMajorName;
	}

	public void setStrExpertMajorName(String strExpertMajorName) {
		this.strExpertMajorName = strExpertMajorName;
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
}
