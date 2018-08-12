package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.AgentCompDto;

/**
 * @name AgentCompDao.java
 * @author Frank
 * @time 2013-10-15下午9:55:02
 * @version 1.0
 */
public interface AgentCompDao {

	/**
	 * 翻页查询委托公司
	 * @param agentCompNoLow
	 * @param agentCompNoHigh
	 * @param agentAddFlag
	 * @param start
	 * @param end
	 * @return
	 */
	public List<AgentCompDto> queryAgentCompByPage(String agentCompNoLow,
				String agentCompNoHigh, String agentAddFlag, String agentCompName, int start, int end);
	
	/**
	 * 查询总记录数
	 * @param agentCompNoLow
	 * @param agentCompNoHigh
	 * @param agentAddFlag
	 * @return
	 */
	public int queryAgentCompCountByPage(String agentCompNoLow, String agentCompNoHigh, String agentAddFlag, String agentCompName);
	
	/**
	 * 根据ID查询委托公司（查询未删除的记录）
	 * @param agentCompNo
	 * @return
	 */
	public AgentCompDto queryAgentCompByID(String agentCompNo);
	
	/**
	 * 根据ID查询委托公司（查询所有记录）
	 * @param agentCompNo
	 * @return
	 */
	public AgentCompDto queryAllAgentCompByID(String agentCompNo);
	
	/**
	 * 查询所有的委托公司
	 * @return
	 */
	public List<AgentCompDto> queryAllAgentComp();
	
	/**
	 * 新增委托公司
	 * @param agentComp
	 */
	public void insertAgentComp(AgentCompDto agentComp);
	
	/**
	 * 修改委托公司
	 * @param agentComp
	 */
	public void updateAgentComp(AgentCompDto agentComp);
	
	/**
	 * 查询委托公司（Excel导出用）
	 * @param agentCompNoLow
	 * @param agentCompNoHigh
	 * @return
	 */
	public List<AgentCompDto> queryAllAgentCompExport(String agentCompNoLow, String agentCompNoHigh, String agentAddFlag, String agentCompName);
}
