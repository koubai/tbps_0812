package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.ExpertLibDto;

/**
 * @name ExpertLibDao.java
 * @author Frank
 * @time 2013-10-19下午9:10:41
 * @version 1.0
 */
public interface ExpertLibDao {
	
	//new start
	/**
	 * 查询所有专家信息New
	 * @param EXPERT_NAME
	 * @param QUERY_EXPERT_MAJOR
	 * @return
	 */
	public List<ExpertLibDto> queryAllExpertLibExportNew(String EXPERT_NAME, String QUERY_EXPERT_MAJOR);
	
	/**
	 * 翻页查询专家信息New
	 * @param EXPERT_NAME
	 * @param QUERY_EXPERT_MAJOR
	 * @param start
	 * @param end
	 * @return
	 */
	public List<ExpertLibDto> queryExpertLibByPageNew(String EXPERT_NAME,
			String QUERY_EXPERT_MAJOR, int start, int end);
	
	/**
	 * 查询总记录数New
	 * @param EXPERT_NAME
	 * @param QUERY_EXPERT_MAJOR
	 * @return
	 */
	public int queryExpertLibCountByPageNew(String EXPERT_NAME, String QUERY_EXPERT_MAJOR);
	//new end
	
	/**
	 * 根据所选专业自动选取专家（每个专业选一个专家）
	 * @param strWithoutExpertNameList
	 * @param strExpertMajor
	 * @return
	 */
	public List<ExpertLibDto> autoQueryExpertLib(String strWithoutExpertNameList, String strExpertMajor);
	
	/**
	 * 根据所选专业自动选取专家（每个专业选一个专家）
	 * @param strWithoutExpertNameList
	 * @param strExpertMajor
	 * @param expertName
	 * @param isInclude
	 * @param expertComp
	 * @return
	 */
	public List<ExpertLibDto> autoQueryExpertLibNew(String strWithoutExpertNameList, String strExpertMajor, String expertName, String isInclude, String expertComp);
	
	/**
	 * 根据ID查询评审专家列表
	 * @param ids
	 * @return
	 */
	public List<ExpertLibDto> queryExpertLibByIds(String ids);

	/**
	 * 翻页查询专家信息Or
	 * @param expertName
	 * @param strExpertMajor
	 * @param start
	 * @param end
	 * @return
	 */
	public List<ExpertLibDto> queryExpertLibByPageOr(String expertName,
				String strExpertMajor, int start, int end);
	
	/**
	 * 查询所有专家信息Or
	 * @param strExpertMajor
	 * @return
	 */
	public List<ExpertLibDto> queryAllExpertLibOr(String strExpertMajor);
	
	/**
	 * 查询总记录数Or
	 * @param expertName
	 * @param strExpertMajor
	 * @return
	 */
	public int queryExpertLibCountByPageOr(String expertName, String strExpertMajor);
	
	/**
	 * 翻页查询专家信息And
	 * @param expertName
	 * @param strExpertMajor
	 * @param start
	 * @param end
	 * @return
	 */
	public List<ExpertLibDto> queryExpertLibByPageAnd(String expertName,
				String strExpertMajor, int start, int end);
	
	/**
	 * 查询总记录数And
	 * @param expertName
	 * @param strExpertMajor
	 * @return
	 */
	public int queryExpertLibCountByPageAnd(String expertName, String strExpertMajor);
	
	/**
	 * 根据ID查询专家信息
	 * @param expertSeq
	 * @return
	 */
	public ExpertLibDto queryExpertLibByID(String expertSeq);
	
	/**
	 * 查询所有的专家信息
	 * @return
	 */
	public List<ExpertLibDto> queryAllExpertLib();
	
	/**
	 * 新增专家信息
	 * @param expertLib
	 */
	public void insertExpertLib(ExpertLibDto expertLib);
	
	/**
	 * 修改专家信息
	 * @param expertLib
	 */
	public void updateExpertLib(ExpertLibDto expertLib);
	
	/**
	 * 查询专家信息Or（Excel导出用）
	 * @param expertName
	 * @param strExpertMajor
	 * @return
	 */
	public List<ExpertLibDto> queryAllExpertLibExportOr(String expertName, String strExpertMajor);
	
	/**
	 * 查询专家信息And（Excel导出用）
	 * @param expertName
	 * @param strExpertMajor
	 * @return
	 */
	public List<ExpertLibDto> queryAllExpertLibExportAnd(String expertName, String strExpertMajor);
	
	/**
	 * 查询就职公司信息
	 * @return
	 */
	public List<ExpertLibDto> queryExpertComp();
}
