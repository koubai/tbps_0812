package com.cn.tbps.service.impl;

import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.AuditCntrctDao;
import com.cn.tbps.dto.AuditCntrctDto;
import com.cn.tbps.service.AuditCntrctService;

public class AuditCntrctServiceImpl extends BaseService implements AuditCntrctService {
	
	private AuditCntrctDao auditCntrctDao;

	@Override
	public Page queryAuditCntrctByPage(String CNTRCT_NAME, String CNTRCT_TYPE, Page page) {
		CNTRCT_NAME = StringUtil.replaceDatabaseKeyword_mysql(CNTRCT_NAME);
		
		//查询总记录数
		int totalCount = auditCntrctDao.queryAuditCntrctCountByPage(CNTRCT_NAME, CNTRCT_TYPE);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<AuditCntrctDto> list = auditCntrctDao.queryAuditCntrctByPage(CNTRCT_NAME, CNTRCT_TYPE,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}

	@Override
	public AuditCntrctDto queryAuditCntrctByID(String CNTRCT_NO) {
		return auditCntrctDao.queryAuditCntrctByID(CNTRCT_NO);
	}

	@Override
	public void insertAuditCntrct(AuditCntrctDto auditCntrct) {
		auditCntrctDao.insertAuditCntrct(auditCntrct);
	}

	@Override
	public void updateAuditCntrct(AuditCntrctDto auditCntrct) {
		auditCntrctDao.updateAuditCntrct(auditCntrct);
	}

	public AuditCntrctDao getAuditCntrctDao() {
		return auditCntrctDao;
	}

	public void setAuditCntrctDao(AuditCntrctDao auditCntrctDao) {
		this.auditCntrctDao = auditCntrctDao;
	}
}
