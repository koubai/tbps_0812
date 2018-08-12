package com.cn.tbps.service.impl;

import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.AuditCntrctHisDao;
import com.cn.tbps.dto.AuditCntrctHisDto;
import com.cn.tbps.service.AuditCntrctHisService;

public class AuditCntrctHisServiceImpl extends BaseService implements AuditCntrctHisService {
	
	private AuditCntrctHisDao auditCntrctHisDao;

	@Override
	public Page queryAuditCntrctHisByPage(String CNTRCT_NAME, String CNTRCT_TYPE, String CNTRCT_NO, Page page) {
		CNTRCT_NAME = StringUtil.replaceDatabaseKeyword_mysql(CNTRCT_NAME);
		
		//查询总记录数
		int totalCount = auditCntrctHisDao.queryAuditCntrctHisCountByPage(CNTRCT_NAME, CNTRCT_TYPE, CNTRCT_NO);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<AuditCntrctHisDto> list = auditCntrctHisDao.queryAuditCntrctHisByPage(CNTRCT_NAME, CNTRCT_TYPE, CNTRCT_NO,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}

	@Override
	public AuditCntrctHisDto queryAuditCntrctHisByID(String CNTRCT_HIST_SEQ) {
		return auditCntrctHisDao.queryAuditCntrctHisByID(CNTRCT_HIST_SEQ);
	}

	@Override
	public void insertAuditCntrctHis(AuditCntrctHisDto auditCntrctHis) {
		auditCntrctHisDao.insertAuditCntrctHis(auditCntrctHis);
	}

	public AuditCntrctHisDao getAuditCntrctHisDao() {
		return auditCntrctHisDao;
	}

	public void setAuditCntrctHisDao(AuditCntrctHisDao auditCntrctHisDao) {
		this.auditCntrctHisDao = auditCntrctHisDao;
	}
}
