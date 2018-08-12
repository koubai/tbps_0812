package com.cn.tbps.dao;

import java.util.List;

import com.cn.tbps.dto.AuditCompDto;

/**
 * @name AuditCompDao.java
 * @author Pei
 * @time 2016-07-02
 * @version 1.0
 */
public interface AuditCompDao {

	/**
	 * 翻页查询委托公司
	 * @param auditCompNoLow
	 * @param auditCompNoHigh
	 * @param auditAddFlag
	 * @param start
	 * @param end
	 * @return
	 */
	public List<AuditCompDto> queryAuditCompByPage(String auditCompName, int start, int end);
	
	/**
	 * 查询总记录数
	 * @param auditCompNoLow
	 * @param auditCompNoHigh
	 * @param auditAddFlag
	 * @return
	 */
	public int queryAuditCompCountByPage(String auditCompNo);
	
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
	
}
