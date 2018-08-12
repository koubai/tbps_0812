package com.cn.tbps.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.common.factory.Poi2007Base;
import com.cn.common.factory.PoiFactory;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.WithholdDto;
import com.cn.tbps.service.WithholdService;
import com.opensymphony.xwork2.ActionContext;

/**
 * @name WithholdAction.java
 * @author Frank
 * @time 2013-11-24下午10:05:57
 * @version 1.0
 */
public class WithholdAction extends BaseAction {

	private static final long serialVersionUID = 977397763781162455L;

	private static final Logger log = LogManager.getLogger(WithholdAction.class);
	
	private WithholdService withholdService;
	
	/**
	 * 页码
	 */
	private int startIndex;
	
	/**
	 * 翻页
	 */
	private Page page;
	
	/**
	 * 代扣列表
	 */
	private List<WithholdDto> listWithhold;
	
	//查询条件
	private String strWithholdDateLow;
	
	private String strWithholdDateHigh;
	
	private String strWithholdType;
	
	//新增代扣
	private WithholdDto addWithhold;
	
	//修改代扣编号
	private String updWithholdNo;
	//修改代扣
	private WithholdDto updWithhold;
	
	//删除代扣
	private String delWithholdNo;
	
	/**
	 * 导出代扣数据
	 * @return
	 */
	public String exportWithholdAction() {
		try {
			this.clearMessages();
			String name = StringUtil.createFileName(Constants.EXCEL_TYPE_DKYL);
			response.setHeader("Content-Disposition","attachment;filename=" + name);//指定下载的文件名
			response.setContentType("application/vnd.ms-excel");
			Poi2007Base base = PoiFactory.getPoi(Constants.EXCEL_TYPE_DKYL);
			
			//查询数据
			List<WithholdDto> list = withholdService.queryWithholdExport(strWithholdDateLow, strWithholdDateHigh, strWithholdType);
			
			base.setDatas(list);
			base.setSheetName(Constants.EXCEL_TYPE_DKYL);
			base.exportExcel(response.getOutputStream());
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示修改代扣页面
	 * @return
	 */
	public String showUpdWithholdAction() {
		try {
			this.clearMessages();
			updWithhold = withholdService.queryWithholdByID(updWithholdNo);
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 修改代扣
	 * @return
	 */
	public String updWithholdAction() {
		try {
			this.clearMessages();
			//数据校验
			if(!checkData(updWithhold)) {
				return "checkerror";
			}
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			updWithhold.setUPDATE_USER(username);
			withholdService.updateWithhold(updWithhold);
			this.addActionMessage("修改代扣成功！");
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 删除代扣
	 * @return
	 */
	public String delWithholdAction() {
		try {
			this.clearMessages();
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			withholdService.delWithholdById(delWithholdNo, username);
			//刷新数据
			queryData();
			this.addActionMessage("删除代扣成功！");
		} catch(Exception e) {
			log.error(e);
			this.addActionMessage("删除代扣失败！");
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示新增代扣页面
	 * @return
	 */
	public String showAddWithholdAction() {
		try {
			this.clearMessages();
			addWithhold = new WithholdDto();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 新增代扣
	 * @return
	 */
	public String addWithholdAction() {
		try {
			this.clearMessages();
			//数据校验
			if(!checkData(addWithhold)) {
				return "checkerror";
			}
			//验证代扣编号是否重复
			WithholdDto withhold = withholdService.queryAllWithholdByID(addWithhold.getWITHHOLD_NO());
			if(withhold != null) {
				this.addActionMessage("代扣编号已存在！");
				return "checkerror";
			}
			//新增代扣
			String username = (String) ActionContext.getContext().getSession().get(Constants.USER_NAME);
			addWithhold.setUPDATE_USER(username);
			withholdService.insertWithhold(addWithhold);
			addWithhold = new WithholdDto();
			this.addActionMessage("添加代扣成功！");
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示代扣列表
	 * @return
	 */
	public String showWithholdAction() {
		try {
			this.clearMessages();
			page = new Page();
			startIndex = 0;
			listWithhold = new ArrayList<WithholdDto>();
			strWithholdDateLow = "";
			strWithholdDateHigh = "";
			strWithholdType = "";
			//queryData();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询费用结算清单
	 * @return
	 */
	public String queryWithholdAction() {
		try {
			this.clearMessages();
			startIndex = 0;
			queryData();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 翻页费用结算清单
	 * @return
	 */
	public String turnWithholdAction() {
		try {
			this.clearMessages();
			queryData();
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 验证数据格式
	 * @param userinfo
	 * @return
	 */
	private boolean checkData(WithholdDto withhold) {
		if(withhold == null) {
			this.addActionMessage("代扣代码不能为空！");
			return false;
		}
		if(StringUtil.isBlank(withhold.getWITHHOLD_NO())) {
			this.addActionMessage("代扣代码不能为空！");
			return false;
		}
		if(StringUtil.isBlank(withhold.getWITHHOLD_TYPE())) {
			this.addActionMessage("请选择代扣分类！");
			return false;
		}
		if(withhold.getWITHHOLD_DATE() == null) {
			this.addActionMessage("代扣日期不能为空！");
			return false;
		}
		if(withhold.getWITHHOLD_AMOUNT() == null) {
			this.addActionMessage("代扣金额不能为空！");
			return false;
		}
		if(StringUtil.isBlank(withhold.getWITHHOLD_REASON())) {
			this.addActionMessage("用途不能为空！");
			return false;
		}
		return true;
	}
	
	/**
	 * 翻页查询
	 */
	@SuppressWarnings({ "unchecked"})
	private void queryData() {
		addWithhold = new WithholdDto();
		updWithholdNo = "";
		updWithhold = new WithholdDto();
		delWithholdNo = "";
		
		listWithhold = new ArrayList<WithholdDto>();
		if(page == null) {
			page = new Page();
		}
		//翻页查询代扣
		this.page.setStartIndex(startIndex);
		page = withholdService.queryWithholdByPage(strWithholdDateLow, strWithholdDateHigh, strWithholdType, page);
		listWithhold = (List<WithholdDto>) page.getItems();
		this.setStartIndex(page.getStartIndex());
	}
	
	public WithholdService getWithholdService() {
		return withholdService;
	}

	public void setWithholdService(WithholdService withholdService) {
		this.withholdService = withholdService;
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

	public WithholdDto getAddWithhold() {
		return addWithhold;
	}

	public void setAddWithhold(WithholdDto addWithhold) {
		this.addWithhold = addWithhold;
	}

	public String getUpdWithholdNo() {
		return updWithholdNo;
	}

	public void setUpdWithholdNo(String updWithholdNo) {
		this.updWithholdNo = updWithholdNo;
	}

	public WithholdDto getUpdWithhold() {
		return updWithhold;
	}

	public void setUpdWithhold(WithholdDto updWithhold) {
		this.updWithhold = updWithhold;
	}

	public String getDelWithholdNo() {
		return delWithholdNo;
	}

	public void setDelWithholdNo(String delWithholdNo) {
		this.delWithholdNo = delWithholdNo;
	}

	public List<WithholdDto> getListWithhold() {
		return listWithhold;
	}

	public void setListWithhold(List<WithholdDto> listWithhold) {
		this.listWithhold = listWithhold;
	}

	public String getStrWithholdDateLow() {
		return strWithholdDateLow;
	}

	public void setStrWithholdDateLow(String strWithholdDateLow) {
		this.strWithholdDateLow = strWithholdDateLow;
	}

	public String getStrWithholdDateHigh() {
		return strWithholdDateHigh;
	}

	public void setStrWithholdDateHigh(String strWithholdDateHigh) {
		this.strWithholdDateHigh = strWithholdDateHigh;
	}

	public String getStrWithholdType() {
		return strWithholdType;
	}

	public void setStrWithholdType(String strWithholdType) {
		this.strWithholdType = strWithholdType;
	}
}
