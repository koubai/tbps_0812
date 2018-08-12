package com.cn.tbps.service;

import java.util.List;

import com.cn.common.util.Page;
import com.cn.tbps.dto.ExpertLibDto;

/**
 * @name ExpertLibService.java
 * @author Frank
 * @time 2013-10-19下午9:06:11
 * @version 1.0
 */
public interface ExpertLibService {
	
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
	 * @param page
	 * @return
	 */
	public Page queryExpertLibByPageNew(String EXPERT_NAME,
			String QUERY_EXPERT_MAJOR, Page page);
	//new end
	
	/**
	 * 根据所选专业自动选取专家（每个专业选一个专家）（新）
	 * @param expertMajor 格式：major#num,major#num,
	 * @param isRandom 是否随机
	 * @param expertName 专家姓名
	 * @param isInclude 包含
	 * @param expertComp 单位选择
	 * @return
	 */
	public List<ExpertLibDto> autoQueryExpertLibNew(String expertMajor, String isRandom, String expertName, String isInclude, String expertComp);
	
	/**
	 * 根据所选专业自动选取专家（每个专业选一个专家）
	 * @param expertMajor
	 * @param isRandom 是否随机
	 * @param majornumList 专家数量
	 * @return
	 */
	public List<ExpertLibDto> autoQueryExpertLib(String expertMajor, String isRandom, List<String> majornumList);
	
	/**
	 * 根据ID查询评审专家列表
	 * @param ids
	 * @return
	 */
	public List<ExpertLibDto> queryExpertLibByIds(String ids);

	/**
	 * 翻页查询专家信息（专业为or）
	 * @param page
	 * @param expertName
	 * @param expertMajor
	 * @return
	 */
	public Page queryExpertLibByPageOr(Page page, String expertName, String expertMajor);
	
	/**
	 * 翻页查询专家信息（专业为and）
	 * @param page
	 * @param expertName
	 * @param expertMajor
	 * @return
	 */
	public Page queryExpertLibByPageAnd(Page page, String expertName, String expertMajor);
	
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
	 * 删除专家信息
	 * @param expertSeq
	 * @param username
	 */
	public void deleteExpertLib(String expertSeq, String username);
	
	/**
	 * 查询专家信息OR（Excel导出用）
	 * @param expertName
	 * @param expertMajor
	 * @return
	 */
	public List<ExpertLibDto> queryAllExpertLibExportOr(String expertName, String expertMajor);
	
	/**
	 * 查询专家信息AND（Excel导出用）
	 * @param expertName
	 * @param expertMajor
	 * @return
	 */
	public List<ExpertLibDto> queryAllExpertLibExportAnd(String expertName, String expertMajor);
	
	/**
	 * 查询就职公司信息
	 * @return
	 */
	public List<ExpertLibDto> queryExpertComp();
}
