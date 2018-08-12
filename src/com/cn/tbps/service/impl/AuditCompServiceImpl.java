package com.cn.tbps.service.impl;

import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.tbps.dao.AuditCompDao;
import com.cn.tbps.dto.AuditCompDto;
import com.cn.tbps.service.AuditCompService;

/**
 * @name AuditCompServiceImpl.java
 * @author Pei
 * @time 2016-07-02
 * @version 1.0
 */
public class AuditCompServiceImpl extends BaseService implements AuditCompService {

	private AuditCompDao auditCompDao;
	
	@Override
	public Page queryAuditCompByPage(Page page, String auditCompNo) {
		//查询总记录数
		int totalCount = auditCompDao.queryAuditCompCountByPage(auditCompNo);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		//List<AuditCompDto> list = auditCompDao.queryAuditCompByPage(auditCompNoLow, auditCompNoHigh,
		//		page.getStartIndex() * page.getPageSize(), (page.getStartIndex() + 1) * page.getPageSize());
		List<AuditCompDto> list = auditCompDao.queryAuditCompByPage(auditCompNo, page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}
	
	@Override
	public void deleteAuditComp(String auditCompNo, String username) {
		AuditCompDto auditcomp = auditCompDao.queryAuditCompByID(auditCompNo);
		if(auditcomp != null) {
			//删除标记=已删除
			auditcomp.setDELETE_FLG(Constants.IS_DELETE_DEL);
			auditcomp.setUPDATE_USER(username);
			auditCompDao.updateAuditComp(auditcomp);
		}
	}

	@Override
	public AuditCompDto queryAuditCompByID(String auditCompNo) {
		return auditCompDao.queryAuditCompByID(auditCompNo);
	}
	
	@Override
	public AuditCompDto queryAllAuditCompByID(String auditCompNo) {
		return auditCompDao.queryAllAuditCompByID(auditCompNo);
	}

	@Override
	public List<AuditCompDto> queryAllAuditComp() {
		return auditCompDao.queryAllAuditComp();
	}

	@Override
	public void insertAuditComp(AuditCompDto auditComp) {
		auditCompDao.insertAuditComp(auditComp);
	}

	@Override
	public void updateAuditComp(AuditCompDto auditComp) {
		auditCompDao.updateAuditComp(auditComp);
	}
	
	public AuditCompDao getAuditCompDao() {
		return auditCompDao;
	}

	public void setAuditCompDao(AuditCompDao auditCompDao) {
		this.auditCompDao = auditCompDao;
	}
}
