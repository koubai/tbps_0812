package com.cn.tbps.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.AuditCompDto;
import com.cn.tbps.service.AuditCompService;
import com.opensymphony.xwork2.ActionContext;

/**
 * @name AuditCompAction.java
 * @author Pei
 * @time 2016-07-02
 * @version 1.0
 */
public class AuditCompAction extends BaseAction {

	private static final long serialVersionUID = 6638188984908505544L;

	private static final Logger log = LogManager.getLogger(AuditCompAction.class);
	
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
	 * 合同信息列表
	 */
	private List<AuditCompDto> listAuditComp;
	
	/**
	 * 合同代码
	 */
	private String strAuditCompNo;
	
	/**
	 * 合同甲方
	 */
	private String strAuditCompClient;

	
	/**
	 * 新增合同DTO
	 */
	private AuditCompDto addAuditCompDto;
	
	/**
	 * 修改合同信息的序号
	 */
	private String updateAuditCompNo;
	
	/**
	 * 修改合同信息DTO
	 */
	private AuditCompDto updateAuditCompDto;
	
	/**
	 * 删除的合同信息序号
	 */
	private String delAuditCompNo;

	/**
	 * 显示添加合同页面
	 * @return
	 */
	public String showAddAuditCompAction() {
		try {
			this.clearMessages();
			addAuditCompDto = new AuditCompDto();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 添加合同信息
	 * @return
	 */
	public String addAuditCompAction() {
		try {
			this.clearMessages();
			//数据校验
			if(!checkData(addAuditCompDto)) {
				return "checkerror";
			}
			//保存数据
			addAuditCompDto.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			addAuditCompDto.setUPDATE_USER(username);
			auditCompService.insertAuditComp(addAuditCompDto);
			this.addActionMessage("添加合同信息成功！");
			addAuditCompDto = new AuditCompDto();
		} catch(Exception e) {
			this.addActionMessage("系统异常，添加合同信息失败！");
			log.error("addAuditCompAction error:" + e);
			return "checkerror";
		}
		return SUCCESS;
	}
	
	/**
	 * 显示修改合同信息页面
	 * @return
	 */
	public String showUpdAuditCompAction() {
		try {
			this.clearMessages();
			System.out.println("updateAuditCompNo"+updateAuditCompNo);
			updateAuditCompDto = auditCompService.queryAuditCompByID(updateAuditCompNo);
			if(updateAuditCompDto == null) {
				this.addActionMessage("该数据不存在！");
				return "checkerror";
			}
		} catch(Exception e) {
			this.addActionMessage("系统错误，查询合同信息异常！");
			log.error("showAuditCompAction error:" + e);
			return "checkerror";
		}
		return SUCCESS;
	}
	
	/**
	 * 修改合同信息
	 * @return
	 */
	public String updAuditCompAction() {
		try {
			this.clearMessages();
			//数据校验
			System.out.println("updAuditCompAction3");
			if(!checkData(updateAuditCompDto)) {
				return "checkerror";
			}
			//修改数据
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			updateAuditCompDto.setUPDATE_USER(username);
			System.out.println("UPDATE_USER");
			auditCompService.updateAuditComp(updateAuditCompDto);
			this.addActionMessage("修改合同信息成功！");
		} catch(Exception e) {
			this.addActionMessage("系统异常，修改合同信息失败！");
			log.error("updAuditCompAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 删除合同信息
	 * @return
	 */
	public String delAuditCompAction() {
		try {
			this.clearMessages();
			if(StringUtil.isBlank(delAuditCompNo)) {
				this.addActionMessage("合同序号为空！");
				return "checkerror";
			}
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			//删除
			auditCompService.deleteAuditComp(delAuditCompNo, username);
			this.addActionMessage("删除合同信息成功！");
			delAuditCompNo = "";
			//刷新页面
			startIndex = 0;
			queryAuditComp();
		} catch(Exception e) {
			log.error("delAuditCompAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示合同管理页面
	 * @return
	 */
	public String showAuditCompAction() {
		try {
			this.clearMessages();
			strAuditCompNo = "";
			strAuditCompClient = "";
			addAuditCompDto = new AuditCompDto();
			updateAuditCompDto = new AuditCompDto();
			updateAuditCompNo = "";
			delAuditCompNo = "";
			page = new Page();
			startIndex = 0;
			listAuditComp = new ArrayList<AuditCompDto>();
			queryAuditCompList(); 
			log.debug("showAuditCompAction aaa:" );
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询合同列表
	 * @return
	 */
	public String queryAuditCompList() {
		try {
			System.out.println("queryAuditCompList");
			this.clearMessages();
			page = new Page();
			startIndex = 0;
			queryAuditComp();
			System.out.println("queryAuditComp");
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
	public String turnAuditCompPage() {
		try {
			this.clearMessages();
			queryAuditComp();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 翻页查询所有合同列表
	 */
	@SuppressWarnings("unchecked")
	private void queryAuditComp() {
		listAuditComp = new ArrayList<AuditCompDto>();
		if(page == null) {
			page = new Page();
		}
		//翻页查询所有信息
		this.page.setStartIndex(startIndex);
		page = auditCompService.queryAuditCompByPage(page, strAuditCompNo);
		listAuditComp = (List<AuditCompDto>) page.getItems();
		System.out.println("listAuditComp.size2:"+listAuditComp.size());
		log.debug("listAuditComp.size:"+listAuditComp.size());		
		this.setStartIndex(page.getStartIndex());
	}
	
	/**
	 * 验证数据格式
	 * @param expertlib
	 * @return
	 */
	private boolean checkData(AuditCompDto auditcomp) {
		if(auditcomp == null) {
			this.addActionMessage("合同不能为空！");
			return false;
		}
		if(StringUtil.isBlank(auditcomp.getAUDIT_COMP_NO())) {
			this.addActionMessage("合同号不能为空！");
			return false;
		}
		if(StringUtil.isBlank(auditcomp.getAUDIT_COMP_NAME())) {
			this.addActionMessage("合同名称不能为空！");
			return false;
		}
		if(StringUtil.isBlank(auditcomp.getAUDIT_COMP_CLIENT())) {
			this.addActionMessage("合同甲方不能为空！");
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

	public AuditCompService getAuditCompService() {
		return auditCompService;
	}

	public void setAuditCompService(AuditCompService auditCompService) {
		this.auditCompService = auditCompService;
	}

	public AuditCompDto getAddAuditCompDto() {
		return addAuditCompDto;
	}

	public void setAddAuditCompDto(AuditCompDto addAuditCompDto) {
		this.addAuditCompDto = addAuditCompDto;
	}

	public List<AuditCompDto> getListAuditComp() {
		return listAuditComp;
	}

	public void setListAuditComp(List<AuditCompDto> listAuditComp) {
		this.listAuditComp = listAuditComp;
	}

	public AuditCompDto getUpdateAuditCompDto() {
		return updateAuditCompDto;
	}

	public void setUpdateAuditCompDto(AuditCompDto updateAuditCompDto) {
		this.updateAuditCompDto = updateAuditCompDto;
	}

	public String getDelAuditCompNo() {
		return delAuditCompNo;
	}

	public void setDelAuditCompNo(String delAuditCompNo) {
		this.delAuditCompNo = delAuditCompNo;
	}

	public String getUpdateAuditCompNo() {
		return updateAuditCompNo;
	}

	public void setUpdateAuditCompNo(String updateAuditCompNo) {
		this.updateAuditCompNo = updateAuditCompNo;
	}

}
