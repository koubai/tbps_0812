package com.cn.tbps.service.impl;

import java.text.ParseException;
import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.AuditCntrctDao;
import com.cn.tbps.dao.AuditCntrctHisDao;
import com.cn.tbps.dto.AuditCntrctDto;
import com.cn.tbps.dto.AuditCntrctHisDto;
import com.cn.tbps.service.AuditCntrctService;

public class AuditCntrctServiceImpl extends BaseService implements AuditCntrctService {
	
	private AuditCntrctDao auditCntrctDao;
	private AuditCntrctHisDao auditCntrctHisDao;

	@Override
	public Page queryAuditCntrctByPage(String strCntrctBelong, String strCntrctNO, String strCntrctType,
			String strCntrctName, String strCntrctStDate, String strCntrctEdDate, String strCntrctNm, Page page) {
		strCntrctName = StringUtil.replaceDatabaseKeyword_mysql(strCntrctName);
		strCntrctNm = StringUtil.replaceDatabaseKeyword_mysql(strCntrctNm);
		
		//查询总记录数
		int totalCount = auditCntrctDao.queryAuditCntrctCountByPage(strCntrctBelong, strCntrctNO, strCntrctType,
				strCntrctName, strCntrctStDate, strCntrctEdDate, strCntrctNm);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<AuditCntrctDto> list = auditCntrctDao.queryAuditCntrctByPage(strCntrctBelong, strCntrctNO, strCntrctType,
				strCntrctName, strCntrctStDate, strCntrctEdDate, strCntrctNm,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}

	@Override
	public AuditCntrctDto queryAuditCntrctByID(String CNTRCT_NO) {
		return auditCntrctDao.queryAuditCntrctByID(CNTRCT_NO);
	}

	@Override
	public void insertAuditCntrct(AuditCntrctDto auditCntrct) throws Exception {
		auditCntrct.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
		auditCntrctDao.insertAuditCntrct(auditCntrct);
		//新增审价履历
		insertAuditCntrctHist(auditCntrct);
	}

	@Override
	public void updateAuditCntrct(AuditCntrctDto auditCntrct) throws Exception {
		auditCntrctDao.updateAuditCntrct(auditCntrct);
		//新增审价履历
		insertAuditCntrctHist(auditCntrct);
	}

	@Override
	public void deleteAuditCntrct(String cntrctNo, String user) throws Exception {
		AuditCntrctDto auditCntrct = auditCntrctDao.queryAuditCntrctByID(cntrctNo);
		if(auditCntrct != null) {
			//删除标记=已删除
			auditCntrct.setDELETE_FLG(Constants.IS_DELETE_DEL);
			auditCntrct.setUPDATE_USER(user);
			auditCntrctDao.updateAuditCntrct(auditCntrct);
			//插入审价履历
			insertAuditCntrctHist(auditCntrct);
		}
	}
	
	/**
	 * 插入审价履历
	 * @param auditCntrct
	 * @throws ParseException 
	 */
	private void insertAuditCntrctHist(AuditCntrctDto auditCntrct) throws ParseException {
		AuditCntrctHisDto auditCntrctHist = new AuditCntrctHisDto();
		auditCntrctHist.setCNTRCT_BELONG(auditCntrct.getCNTRCT_BELONG());
		auditCntrctHist.setCNTRCT_NO(auditCntrct.getCNTRCT_NO());
		auditCntrctHist.setCNTRCT_NAME(auditCntrct.getCNTRCT_NAME());
		auditCntrctHist.setCNTRCT_NM(auditCntrct.getCNTRCT_NM());
		auditCntrctHist.setCNTRCT_TYPE(auditCntrct.getCNTRCT_TYPE());
		auditCntrctHist.setAUDIT_COMP_NO(auditCntrct.getAUDIT_COMP_NO());
		auditCntrctHist.setAUDIT_COMP_NAME(auditCntrct.getAUDIT_COMP_NAME());
		auditCntrctHist.setCO_MANAGER_ADDRESS1(auditCntrct.getCO_MANAGER_ADDRESS1());
		auditCntrctHist.setCO_MANAGER1(auditCntrct.getCO_MANAGER1());
		auditCntrctHist.setCO_MANAGER_TEL1(auditCntrct.getCO_MANAGER_TEL1());
		auditCntrctHist.setCO_ADDRESS1(auditCntrct.getCO_ADDRESS1());
		auditCntrctHist.setCNTRCT_ST_DATE(auditCntrct.getCNTRCT_ST_DATE());
		auditCntrctHist.setCNTRCT_ED_DATE(auditCntrct.getCNTRCT_ED_DATE());
		auditCntrctHist.setCNTRCT_INFO(auditCntrct.getCNTRCT_INFO());
		auditCntrctHist.setCNTRCT_RATE_1(auditCntrct.getCNTRCT_RATE_1());
		auditCntrctHist.setCNTRCT_RATE_2(auditCntrct.getCNTRCT_RATE_2());
		auditCntrctHist.setCNTRCT_RATE_3(auditCntrct.getCNTRCT_RATE_3());
		auditCntrctHist.setCNTRCT_RATE_4(auditCntrct.getCNTRCT_RATE_4());
		auditCntrctHist.setCNTRCT_RATE_5(auditCntrct.getCNTRCT_RATE_5());
		auditCntrctHist.setCNTRCT_RATE_6(auditCntrct.getCNTRCT_RATE_6());
		auditCntrctHist.setCNTRCT_RATE_7(auditCntrct.getCNTRCT_RATE_7());
		auditCntrctHist.setCNTRCT_RATE_8(auditCntrct.getCNTRCT_RATE_8());
		auditCntrctHist.setCNTRCT_RATE_9(auditCntrct.getCNTRCT_RATE_9());
		auditCntrctHist.setCNTRCT_RATE_10(auditCntrct.getCNTRCT_RATE_10());
		auditCntrctHist.setCNTRCT_AMOUNT_1(auditCntrct.getCNTRCT_AMOUNT_1());
		auditCntrctHist.setCNTRCT_AMOUNT_2(auditCntrct.getCNTRCT_AMOUNT_2());
		auditCntrctHist.setCNTRCT_AMOUNT_3(auditCntrct.getCNTRCT_AMOUNT_3());
		auditCntrctHist.setCNTRCT_AMOUNT_4(auditCntrct.getCNTRCT_AMOUNT_4());
		auditCntrctHist.setCNTRCT_AMOUNT_5(auditCntrct.getCNTRCT_AMOUNT_5());
		auditCntrctHist.setCNTRCT_AMOUNT_6(auditCntrct.getCNTRCT_AMOUNT_6());
		auditCntrctHist.setCNTRCT_AMOUNT_7(auditCntrct.getCNTRCT_AMOUNT_7());
		auditCntrctHist.setCNTRCT_AMOUNT_8(auditCntrct.getCNTRCT_AMOUNT_8());
		auditCntrctHist.setCNTRCT_AMOUNT_9(auditCntrct.getCNTRCT_AMOUNT_9());
		auditCntrctHist.setCNTRCT_AMOUNT_10(auditCntrct.getCNTRCT_AMOUNT_10());
		auditCntrctHist.setCNTRCT_TOTAL_AMOUNT(auditCntrct.getCNTRCT_TOTAL_AMOUNT());
		auditCntrctHist.setCNTRCT_ALL_AMOUNT(auditCntrct.getCNTRCT_ALL_AMOUNT());
		auditCntrctHist.setCNTRCT_UNPAY_AMOUNT(auditCntrct.getCNTRCT_UNPAY_AMOUNT());
		auditCntrctHist.setTRIP_TOTAL_AMOUNT(auditCntrct.getTRIP_TOTAL_AMOUNT());
		auditCntrctHist.setESTIMATE_COST(auditCntrct.getESTIMATE_COST());
		auditCntrctHist.setESTIMATE_CONSTRUCT_SAFE_COST(auditCntrct.getESTIMATE_CONSTRUCT_SAFE_COST());
		auditCntrctHist.setPRE_CONSTRUCT_SAFE_COST(auditCntrct.getPRE_CONSTRUCT_SAFE_COST());
		auditCntrctHist.setCONSTRUCT_ST_DATE(auditCntrct.getCONSTRUCT_ST_DATE());
		auditCntrctHist.setPLAN_CONSTRUCT_ED_DATE(auditCntrct.getPLAN_CONSTRUCT_ED_DATE());
		auditCntrctHist.setCONSTRUCT_AREA(auditCntrct.getCONSTRUCT_AREA());
		auditCntrctHist.setEXCUTE_AMOUNT(auditCntrct.getEXCUTE_AMOUNT());
		auditCntrctHist.setCONSTRUCT_SAFE_COUNT(auditCntrct.getCONSTRUCT_SAFE_COUNT());
		auditCntrctHist.setCONSTRUCT_SAFE_CNTRCT_COST(auditCntrct.getCONSTRUCT_SAFE_CNTRCT_COST());
		auditCntrctHist.setCONSTRUCT_SAFE_CNTRCT_COST_PAID(auditCntrct.getCONSTRUCT_SAFE_CNTRCT_COST_PAID());
		auditCntrctHist.setCONSTRUCT_SAFE_CNTRCT_COST_CTRL(auditCntrct.getCONSTRUCT_SAFE_CNTRCT_COST_CTRL());
		auditCntrctHist.setBUDGETARY_OVERRUN_RISK(auditCntrct.getBUDGETARY_OVERRUN_RISK());
		auditCntrctHist.setMONTHLY_REPORT_CNT(auditCntrct.getMONTHLY_REPORT_CNT());
		auditCntrctHist.setSUGGEST_REPORT_CNT(auditCntrct.getSUGGEST_REPORT_CNT());
		auditCntrctHist.setCOMM_REPORT_CNT(auditCntrct.getCOMM_REPORT_CNT());
		auditCntrctHist.setFINISH_AUDIT_CNT(auditCntrct.getFINISH_AUDIT_CNT());
		auditCntrctHist.setPROJ_PROGRESS_MEET_CNT(auditCntrct.getPROJ_PROGRESS_MEET_CNT());
		auditCntrctHist.setPROGRESS_STATUS(auditCntrct.getPROGRESS_STATUS());
		auditCntrctHist.setPROJECT_SENIOR_MANAGER(auditCntrct.getPROJECT_SENIOR_MANAGER());
		auditCntrctHist.setRESERVE1(auditCntrct.getRESERVE1());
		auditCntrctHist.setRESERVE2(auditCntrct.getRESERVE2());
		auditCntrctHist.setRESERVE3(auditCntrct.getRESERVE3());
		auditCntrctHist.setRESERVE4(auditCntrct.getRESERVE4());
		auditCntrctHist.setRESERVE5(auditCntrct.getRESERVE5());
		auditCntrctHist.setRESERVE6(auditCntrct.getRESERVE6());
		auditCntrctHist.setRESERVE7(auditCntrct.getRESERVE7());
		auditCntrctHist.setRESERVE8(auditCntrct.getRESERVE8());
		auditCntrctHist.setRESERVE9(auditCntrct.getRESERVE9());
		auditCntrctHist.setRESERVE10(auditCntrct.getRESERVE10());
		auditCntrctHist.setLATEST_FLG(auditCntrct.getLATEST_FLG());
		auditCntrctHist.setDELETE_FLG(auditCntrct.getDELETE_FLG());
		auditCntrctHist.setUPDATE_USER(auditCntrct.getUPDATE_USER());
		auditCntrctHist.setINSERT_DATE(auditCntrct.getINSERT_DATE());
		auditCntrctHist.setUPDATE_DATE(auditCntrct.getUPDATE_DATE());
		auditCntrctHisDao.insertAuditCntrctHis(auditCntrctHist);
	}

	public AuditCntrctDao getAuditCntrctDao() {
		return auditCntrctDao;
	}

	public void setAuditCntrctDao(AuditCntrctDao auditCntrctDao) {
		this.auditCntrctDao = auditCntrctDao;
	}

	public AuditCntrctHisDao getAuditCntrctHisDao() {
		return auditCntrctHisDao;
	}

	public void setAuditCntrctHisDao(AuditCntrctHisDao auditCntrctHisDao) {
		this.auditCntrctHisDao = auditCntrctHisDao;
	}
}
