package com.cn.tbps.service;

import java.util.List;

import com.cn.common.util.Page;
import com.cn.tbps.dto.AuditCompDto;

/**
 * @name AuditCompService.java
 * @author Pei
 * @time 2016-07-02
 * @version 1.0
 */
public interface AuditCompService {
	
	/**
	 * 翻页查询委托公司
	 * @param page
	 * @param auditCompNo
	 * @return
	 */
	public Page queryAuditCompByPage(Page page, String auditCompNo);

	/**
	 * 根据ID查询合同公司（查询未删除的记录）
	 * @param auditCompNo
	 * @return
	 */
	public AuditCompDto queryAuditCompByID(String auditCompNo);
	
	/**
	 * 根据ID查询合同公司（查询所有记录）
	 * @param auditCompNo
	 * @return
	 */
	public AuditCompDto queryAllAuditCompByID(String auditCompNo);
	
	/**
	 * 查询所有的合同公司
	 * @return
	 */
	public List<AuditCompDto> queryAllAuditComp();
	
	/**
	 * 新增合同公司
	 * @param auditComp
	 */
	public void insertAuditComp(AuditCompDto auditComp);
	
	/**
	 * 修改合同公司
	 * @param auditComp
	 */
	public void updateAuditComp(AuditCompDto auditComp);
	
	/**
	 * 删除合同公司
	 * @param auditCompNo
	 * @param username
	 */
	public void deleteAuditComp(String auditCompNo, String username);
	
}
