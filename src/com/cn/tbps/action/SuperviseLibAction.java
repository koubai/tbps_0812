package com.cn.tbps.action;

import java.util.ArrayList;
import java.util.List;

import com.cn.common.action.BaseAction;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.SuperviseLibDto;
import com.cn.tbps.service.SuperviseLibService;
import com.opensymphony.xwork2.ActionContext;

public class SuperviseLibAction extends BaseAction {

	private static final long serialVersionUID = -1751230759901890239L;
	
	private SuperviseLibService superviseLibService;
	
	/**
	 * 页码
	 */
	private int startIndex;
	
	/**
	 * 翻页
	 */
	private Page page;
	
	/**
	 * 会审监管人列表
	 */
	private List<SuperviseLibDto> listSuperviseLib;
	
	private String strSUPERVISE_NAME;
	
	private SuperviseLibDto addSuperviseLibDto;
	
	private String updSUPERVISE_SEQ;
	
	private SuperviseLibDto updSuperviseLibDto;
	
	private String delSUPERVISE_SEQ;
	
	/**
	 * 删除用户
	 * @return
	 */
	public String delSuperviseLibAction() {
		try {
			this.clearMessages();
			if(StringUtil.isBlank(delSUPERVISE_SEQ)) {
				this.addActionMessage("会审监管人ID不能为空！");
				return "checkerror";
			}
			//删除用户
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			superviseLibService.deleteSuperviseLib(delSUPERVISE_SEQ, username);
			this.addActionMessage("删除成功！");
			//刷新页面
			startIndex = 0;
			querySuperviseLib();
			delSUPERVISE_SEQ = "";
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示修改用户
	 * @return
	 */
	public String showUpdSuperviseLibAction() {
		try {
			this.clearMessages();
			//查询用户信息
			updSuperviseLibDto = superviseLibService.querySuperviseLibByID(updSUPERVISE_SEQ);
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 修改
	 * @return
	 */
	public String updSuperviseLibAction() {
		try {
			this.clearMessages();
			//数据校验
			if(!checkData(updSuperviseLibDto)) {
				return "checkerror";
			}
			//修改
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			updSuperviseLibDto.setUPDATE_USER(username);
			superviseLibService.updateSuperviseLib(updSuperviseLibDto);
			this.addActionMessage("修改成功！");
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示添加会审监管人
	 * @return
	 */
	public String showAddSuperviseLibAction() {
		try {
			this.clearMessages();
			addSuperviseLibDto = new SuperviseLibDto();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 添加
	 * @return
	 */
	public String addSuperviseLibAction() {
		try {
			this.clearMessages();
			//数据校验
			if(!checkData(addSuperviseLibDto)) {
				return "checkerror";
			}
			//添加
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			addSuperviseLibDto.setUPDATE_USER(username);
			addSuperviseLibDto.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
			
			superviseLibService.insertSuperviseLib(addSuperviseLibDto);
			this.addActionMessage("添加成功！");
			addSuperviseLibDto = new SuperviseLibDto();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 用户信息管理页面
	 * @return
	 */
	public String showSuperviseLibAction() {
		try {
			this.clearMessages();
			page = new Page();
			startIndex = 0;
			strSUPERVISE_NAME = "";
			updSUPERVISE_SEQ = "";
			delSUPERVISE_SEQ = "";
			addSuperviseLibDto = new SuperviseLibDto();
			updSuperviseLibDto = new SuperviseLibDto();
			listSuperviseLib = new ArrayList<SuperviseLibDto>();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询用户信息
	 * @return
	 */
	public String querySuperviseLibAction() {
		try {
			this.clearMessages();
			startIndex = 0;
			querySuperviseLib();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 翻页用户信息
	 * @return
	 */
	public String turnSuperviseLibAction() {
		try {
			this.clearMessages();
			querySuperviseLib();
		} catch(Exception e) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 验证数据格式
	 * @param SuperviseLib
	 * @return
	 */
	private boolean checkData(SuperviseLibDto superviseLib) {
		if(superviseLib == null) {
			this.addActionMessage("会审监管人名不能为空！");
			return false;
		}
		if(StringUtil.isBlank(superviseLib.getSUPERVISE_NAME())) {
			this.addActionMessage("会审监管人名不能为空！");
			return false;
		}
		return true;
	}
	
	/**
	 * 查询信息
	 */
	@SuppressWarnings("unchecked")
	private void querySuperviseLib() {
		listSuperviseLib = new ArrayList<SuperviseLibDto>();
		if(page == null) {
			page = new Page();
		}
		//翻页查询所有委托公司
		this.page.setStartIndex(startIndex);
		page = superviseLibService.querySuperviseLibByPage(strSUPERVISE_NAME, page);
		listSuperviseLib = (List<SuperviseLibDto>) page.getItems();
		this.setStartIndex(page.getStartIndex());
	}

	public SuperviseLibService getSuperviseLibService() {
		return superviseLibService;
	}

	public void setSuperviseLibService(SuperviseLibService superviseLibService) {
		this.superviseLibService = superviseLibService;
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

	public List<SuperviseLibDto> getListSuperviseLib() {
		return listSuperviseLib;
	}

	public void setListSuperviseLib(List<SuperviseLibDto> listSuperviseLib) {
		this.listSuperviseLib = listSuperviseLib;
	}

	public String getStrSUPERVISE_NAME() {
		return strSUPERVISE_NAME;
	}

	public void setStrSUPERVISE_NAME(String strSUPERVISE_NAME) {
		this.strSUPERVISE_NAME = strSUPERVISE_NAME;
	}

	public SuperviseLibDto getAddSuperviseLibDto() {
		return addSuperviseLibDto;
	}

	public void setAddSuperviseLibDto(SuperviseLibDto addSuperviseLibDto) {
		this.addSuperviseLibDto = addSuperviseLibDto;
	}

	public String getUpdSUPERVISE_SEQ() {
		return updSUPERVISE_SEQ;
	}

	public void setUpdSUPERVISE_SEQ(String updSUPERVISE_SEQ) {
		this.updSUPERVISE_SEQ = updSUPERVISE_SEQ;
	}

	public SuperviseLibDto getUpdSuperviseLibDto() {
		return updSuperviseLibDto;
	}

	public void setUpdSuperviseLibDto(SuperviseLibDto updSuperviseLibDto) {
		this.updSuperviseLibDto = updSuperviseLibDto;
	}

	public String getDelSUPERVISE_SEQ() {
		return delSUPERVISE_SEQ;
	}

	public void setDelSUPERVISE_SEQ(String delSUPERVISE_SEQ) {
		this.delSUPERVISE_SEQ = delSUPERVISE_SEQ;
	}
}
