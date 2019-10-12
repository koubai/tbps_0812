package com.cn.tbps.service.impl;

import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.AgentCompDao;
import com.cn.tbps.dto.AgentCompDto;
import com.cn.tbps.service.AgentCompService;

/**
 * @name AgentCompServiceImpl.java
 * @author Frank
 * @time 2013-10-15下午10:13:38
 * @version 1.0
 */
public class AgentCompServiceImpl extends BaseService implements AgentCompService {

	private AgentCompDao agentCompDao;
	
	@Override
	public Page queryAgentCompByPage(Page page, String agentCompNoLow,
			String agentCompNoHigh, String agentAddFlag, String agentCompName) {
		agentCompNoLow = StringUtil.replaceDatabaseKeyword_mysql(agentCompNoLow);
		
		if (agentAddFlag.compareTo("11")==0)
			agentAddFlag="1";
		
		//查询总记录数
		int totalCount = agentCompDao.queryAgentCompCountByPage(agentCompNoLow, agentCompNoHigh, agentAddFlag, agentCompName);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		//List<AgentCompDto> list = agentCompDao.queryAgentCompByPage(agentCompNoLow, agentCompNoHigh,
		//		page.getStartIndex() * page.getPageSize(), (page.getStartIndex() + 1) * page.getPageSize());
		List<AgentCompDto> list = agentCompDao.queryAgentCompByPage(agentCompNoLow, agentCompNoHigh,
				agentAddFlag, agentCompName, page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}
	
	@Override
	public void deleteAgentComp(String agentCompNo, String username) {
		AgentCompDto agentcomp = agentCompDao.queryAgentCompByID(agentCompNo);
		if(agentcomp != null) {
			//删除标记=已删除
			agentcomp.setDELETE_FLG(Constants.IS_DELETE_DEL);
			agentcomp.setUPDATE_USER(username);
			agentCompDao.updateAgentComp(agentcomp);
		}
	}

	@Override
	public AgentCompDto queryAgentCompByID(String agentCompNo) {
		return agentCompDao.queryAgentCompByID(agentCompNo);
	}
	
	@Override
	public AgentCompDto queryAllAgentCompByID(String agentCompNo) {
		return agentCompDao.queryAllAgentCompByID(agentCompNo);
	}

	@Override
	public List<AgentCompDto> queryAllAgentComp() {
		return agentCompDao.queryAllAgentComp();
	}
	
	@Override
	public List<AgentCompDto> queryAllAgentComp2() {
		return agentCompDao.queryAllAgentComp2();
	}

	@Override
	public void insertAgentComp(AgentCompDto agentComp) {
		agentCompDao.insertAgentComp(agentComp);
	}

	@Override
	public void updateAgentComp(AgentCompDto agentComp) {
		agentCompDao.updateAgentComp(agentComp);
	}
	
	@Override
	public List<AgentCompDto> queryAllAgentCompExport(String agentCompNoLow,
			String agentCompNoHigh, String agentAddFlag, String agentCompName) {
		return agentCompDao.queryAllAgentCompExport(agentCompNoLow, agentCompNoHigh, agentAddFlag, agentCompName);
	}

	public AgentCompDao getAgentCompDao() {
		return agentCompDao;
	}

	public void setAgentCompDao(AgentCompDao agentCompDao) {
		this.agentCompDao = agentCompDao;
	}
}
