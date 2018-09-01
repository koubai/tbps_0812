package com.cn.tbps.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.AuditDao;
import com.cn.tbps.dao.ConfigTabDao;
import com.cn.tbps.dto.AuditDto;
import com.cn.tbps.dto.AuditHistDto;
import com.cn.tbps.dto.ConfigTabDto;
import com.cn.tbps.service.AuditService;

/**
 * @name AuditServiceImpl.java
 * @author Frank
 * @time 2014-2-15下午2:09:03
 * @version 1.0
 */
public class AuditServiceImpl extends BaseService implements AuditService {
	
	private AuditDao auditDao;
	
	private ConfigTabDao configTabDao;

	//审价
	@Override
	public Page queryAuditByPage(String auditNoLow, String auditNoHigh,
			String projectStatus, String projectManager, String valueDateLow,
			String valueDateHigh, String agentNo, String reportNoComp,
			String reportNoLow, String reportNoHigh, Page page, String auditStatus, 
			String projectClass, String docArrDateLow, String docArrDateHigh, String agentName, 
			String contractName, String projectName) {
		
		System.out.println("queryAuditByPage  auditStatus: "+auditStatus);

		//add auditStatus condition 20150425  start--->
		if(StringUtil.isBlank(auditStatus) || "00".equals(auditStatus)) {
			auditStatus = "'2','3'";
		} else {
			String tmp = "";
			auditStatus = auditStatus.replace("0", "");
			for(int i = 0; i < auditStatus.length(); i++) {
				tmp += "'" + auditStatus.subSequence(i, i + 1) + "',";
			}
			if(StringUtil.isNotBlank(tmp)) {
				tmp = tmp.substring(0, tmp.length() - 1);
			}
			auditStatus = tmp;
		}
		//add auditStatus condition 20150425  end<---------
		System.out.println("queryAuditByPage  auditStatus2: "+auditStatus);

		String comp = reportNoComp;
//		String reportlow = "";
//		String reporthigh = "";
		String reportlow = reportNoLow;
		String reporthigh = reportNoHigh;
/* AS user Zhou Yun want, change search condition as comp AND reportlow AND reporthigh  20170706 
		if(StringUtil.isNotBlank(reportNoLow) || StringUtil.isNotBlank(reportNoHigh)) {
			//子文号不为空，则不根据公司信息查询
			comp = "";
		}
		//判断子文号Low是否为空，不为空则查询子文号
		if(StringUtil.isNotBlank(reportNoLow)) {
			reportlow = StringUtil.replaceDatabaseKeyword_mysql(reportNoComp + "-" + reportNoLow);
		}
		//判断子文号High是否为空，不为空则查询子文号
		if(StringUtil.isNotBlank(reportNoHigh)) {
			reporthigh = StringUtil.replaceDatabaseKeyword_mysql(reportNoComp + "-" + reportNoHigh);
		}
		*/

		projectManager = StringUtil.replaceDatabaseKeyword_mysql(projectManager);
		//查询总记录数
		int totalCount = auditDao.queryAuditCountByPage(auditNoLow, auditNoHigh, projectStatus,
				projectManager, valueDateLow, valueDateHigh, agentNo, comp, reportlow, reporthigh, auditStatus, 
				projectClass, docArrDateLow, docArrDateHigh, agentName, contractName, projectName);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<AuditDto> list = auditDao.queryAuditByPage(auditNoLow, auditNoHigh, projectStatus, projectManager,
				valueDateLow, valueDateHigh, agentNo, comp, reportlow, reporthigh, auditStatus,
				projectClass, docArrDateLow, docArrDateHigh, agentName, contractName, projectName,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}

	@Override
	public List<AuditDto> queryAllAuditExport(String auditNoLow,
			String auditNoHigh, String projectStatus, String projectManager,
			String valueDateLow, String valueDateHigh, String agentNo,
			String reportNoComp, String reportNoLow, String reportNoHigh, String auditStatus, 
			String projectClass, String docArrDateLow, String docArrDateHigh, String agentName, 
			String contractName, String projectName) {
		
		//add auditStatus condition 20150425  start--->
		if(StringUtil.isBlank(auditStatus) || "00".equals(auditStatus)) {
			auditStatus = "'2','3'";
		} else {
			String tmp = "";
			auditStatus = auditStatus.replace("0", "");
			for(int i = 0; i < auditStatus.length(); i++) {
				tmp += "'" + auditStatus.subSequence(i, i + 1) + "',";
			}
			if(StringUtil.isNotBlank(tmp)) {
				tmp = tmp.substring(0, tmp.length() - 1);
			}
			auditStatus = tmp;
		}
		//add auditStatus condition 20150425  end<---------

		String comp = reportNoComp;
		String reportlow = "";
		String reporthigh = "";
		if(StringUtil.isNotBlank(reportNoLow) || StringUtil.isNotBlank(reportNoHigh)) {
			//子文号不为空，则不根据公司信息查询
			comp = "";
		}
		//判断子文号Low是否为空，不为空则查询子文号
		if(StringUtil.isNotBlank(reportNoLow)) {
			reportlow = StringUtil.replaceDatabaseKeyword_mysql(reportNoComp + "-" + reportNoLow);
		}
		//判断子文号High是否为空，不为空则查询子文号
		if(StringUtil.isNotBlank(reportNoHigh)) {
			reporthigh = StringUtil.replaceDatabaseKeyword_mysql(reportNoComp + "-" + reportNoHigh);
		}
		
		return auditDao.queryAllAuditExport(auditNoLow, auditNoHigh, projectStatus,
				projectManager, valueDateLow, valueDateHigh, agentNo,
				comp, reportlow, reporthigh, auditStatus, 
				projectClass, docArrDateLow, docArrDateHigh, agentName, contractName, projectName);
	}

	@Override
	public AuditDto queryAuditByID(String auditNo) {
		return auditDao.queryAuditByID(auditNo);
	}

	@Override
	public AuditDto queryAllAuditByID(String auditNo) {
		return auditDao.queryAllAuditByID(auditNo);
	}

	@Override
	public String insertAudit(AuditDto audit) {
		//生成审价编号
		String auditNo = "";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String key = sdf.format(new Date());
		int newValue = 1;
		ConfigTabDto config = configTabDao.queryConfigTabByKey(key, Constants.CONFIG_TAB_AUDIT_SEQ);
		if(config == null) {
			//新增配置表记录
			ConfigTabDto newConfig = new ConfigTabDto();
			newConfig.setCONFIG_TYPE(Constants.CONFIG_TAB_AUDIT_SEQ);
			newConfig.setCONFIG_KEY(key);
			//新增时默认为1
			newConfig.setCONFIG_VAL("1");
			configTabDao.insertConfigTab(newConfig);
		} else {
			//更新配置，值+1
			newValue = Integer.valueOf(config.getCONFIG_VAL()) + 1;
			config.setCONFIG_VAL("" + newValue);
			configTabDao.updateConfigTab(config);
		}
		//新的审价编号
		auditNo = key.substring(2, 4) + "-" + StringUtil.replenishStr("" + newValue, 5);
		
		audit.setDELETE_FLG(Constants.IS_DELETE_NORMAL);
		
		audit.setAUDIT_NO(auditNo);
		auditDao.insertAudit(audit);
		//新增审价履历
		insertAuditHist(audit);
		return auditNo;
	}

	@Override
	public void updateAudit(AuditDto audit) {
		auditDao.updateAudit(audit);
		//新增审价履历
		insertAuditHist(audit);
	}
	
	@Override
	public void deleteAudit(String auditNo, String user) {
		AuditDto audit = auditDao.queryAuditByID(auditNo);
		if(audit != null) {
			//删除标记=已删除
			audit.setDELETE_FLG(Constants.IS_DELETE_DEL);
			audit.setUPDATE_USER(user);
			auditDao.updateAudit(audit);
			//插入审价履历
			insertAuditHist(audit);
		}
	}

	//审价履历
	@Override
	public Page queryAuditHistByPage(String auditNo, Page page) {
		//查询总记录数
		int totalCount = auditDao.queryAuditHistCountByPage(auditNo);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<AuditHistDto> list = auditDao.queryAuditHistByPage(auditNo,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}

	@Override
	public List<AuditHistDto> queryAllAuditHistExport(String auditNo) {
		return auditDao.queryAllAuditHistExport(auditNo);
	}

	@Override
	public AuditHistDto queryAuditHistByID(String auditHisSeq) {
		return auditDao.queryAuditHistByID(auditHisSeq);
	}
	
	/**
	 * 插入审价履历
	 * @param audit
	 */
	private void insertAuditHist(AuditDto audit) {
		AuditHistDto auditHist = new AuditHistDto();
		auditHist.setAUDIT_NO(audit.getAUDIT_NO());
		auditHist.setCONTRACT_NO(audit.getCONTRACT_NO());
		auditHist.setCONTRACTSNM(audit.getCONTRACTSNM());
		auditHist.setREPORT_NO(audit.getREPORT_NO());
		auditHist.setPROJECT_MANAGER(audit.getPROJECT_MANAGER());
		auditHist.setPROJECT_NAME(audit.getPROJECT_NAME());
		auditHist.setPROJECT_TYPE(audit.getPROJECT_TYPE());
		auditHist.setPROJECT_STATUS(audit.getPROJECT_STATUS());
		auditHist.setAGENT_NO(audit.getAGENT_NO());
		auditHist.setAGENT_CO_NAME(audit.getAGENT_CO_NAME());
		auditHist.setAGENT_CO_MANAGER(audit.getAGENT_CO_MANAGER());
		auditHist.setAGENT_CO_MANAGER_TEL(audit.getAGENT_CO_MANAGER_TEL());
		auditHist.setAGENT_CO_STAFF(audit.getAGENT_CO_STAFF());
		auditHist.setAGENT_CO_STAFF_TEL(audit.getAGENT_CO_STAFF_TEL());
		auditHist.setAGENT_CO_POST_ADDRESS(audit.getAGENT_CO_POST_ADDRESS());
		auditHist.setAGENT_CO_MAIL(audit.getAGENT_CO_MAIL());
		auditHist.setPROF_NO(audit.getPROF_NO());
		auditHist.setPROF_CO_NAME(audit.getPROF_CO_NAME());
		auditHist.setPROF_CO_MANAGER(audit.getPROF_CO_MANAGER());
		auditHist.setPROF_CO_MANAGER_TEL(audit.getPROF_CO_MANAGER_TEL());
		auditHist.setPROF_CO_STAFF(audit.getPROF_CO_STAFF());
		auditHist.setPROF_CO_STAFF_TEL(audit.getPROF_CO_STAFF_TEL());
		auditHist.setPROF_CO_POST_ADDRESS(audit.getPROF_CO_POST_ADDRESS());
		auditHist.setPROF_CO_MAIL(audit.getPROF_CO_MAIL());
		auditHist.setCONTRACT_CO_NO(audit.getCONTRACT_CO_NO());
		auditHist.setCONTRACT_CO_NAME(audit.getCONTRACT_CO_NAME());
		auditHist.setCONTRACT_CO_MANAGER(audit.getCONTRACT_CO_MANAGER());
		auditHist.setCONTRACT_CO_MANAGER_TEL(audit.getCONTRACT_CO_MANAGER_TEL());
		auditHist.setCONTRACT_CO_STAFF(audit.getCONTRACT_CO_STAFF());
		auditHist.setCONTRACT_CO_STAFF_TEL(audit.getCONTRACT_CO_STAFF_TEL());
		auditHist.setCONTRACT_CO_POST_ADDRESS(audit.getCONTRACT_CO_POST_ADDRESS());
		auditHist.setCONTRACT_CO_MAIL(audit.getCONTRACT_CO_MAIL());
		auditHist.setDOC_REC_DATE(audit.getDOC_REC_DATE());
		auditHist.setPROGRESS_STATUS(audit.getPROGRESS_STATUS());
		auditHist.setPRE_SET(audit.getPRE_SET());
		auditHist.setPRE_PRICE(audit.getPRE_PRICE());
		auditHist.setSUPPORT_DOC_DATE(audit.getSUPPORT_DOC_DATE());
		auditHist.setDRAFT_DATE(audit.getDRAFT_DATE());
		auditHist.setAPPROVAL_SND_DATE(audit.getAPPROVAL_SND_DATE());
		auditHist.setAPPROVAL_RCV_DATE(audit.getAPPROVAL_RCV_DATE());
		auditHist.setDELI_NO(audit.getDELI_NO());
		auditHist.setREPORT_RAISE_DATE(audit.getREPORT_RAISE_DATE());
		auditHist.setREPORT_SEAL_DATE(audit.getREPORT_SEAL_DATE());
		auditHist.setREPORT_ARR_TYPE(audit.getREPORT_ARR_TYPE());
		auditHist.setREPORT_ARR_DATE(audit.getREPORT_ARR_DATE());
		auditHist.setREG_DATE(audit.getREG_DATE());
		auditHist.setAGENT_INFO(audit.getAGENT_INFO());
		auditHist.setCONTRACT_CO_ID(audit.getCONTRACT_CO_ID());
		auditHist.setCONTRACT_CO_INFO(audit.getCONTRACT_CO_INFO());
		auditHist.setVERIFY_PER_AMOUNT(audit.getVERIFY_PER_AMOUNT());
		auditHist.setVERIFY_AMOUNT(audit.getVERIFY_AMOUNT());
		auditHist.setVERIFY_INCREASE(audit.getVERIFY_INCREASE());
		auditHist.setVERIFY_DECREASE(audit.getVERIFY_DECREASE());
		auditHist.setVERIFY_DIFF(audit.getVERIFY_DIFF());
		auditHist.setVERIFY_DIFF_RATE(audit.getVERIFY_DIFF_RATE());
		auditHist.setCNT_PRICE(audit.getCNT_PRICE());
		auditHist.setPROJ_PRICE(audit.getPROJ_PRICE());
		auditHist.setLIMIT_PRICE(audit.getLIMIT_PRICE());
		auditHist.setCNTRCT_PRICE(audit.getCNTRCT_PRICE());
		auditHist.setPLAN_DOC_RCV_DATE(audit.getPLAN_DOC_RCV_DATE());
		auditHist.setPLAN_DOC_RPT_DATE(audit.getPLAN_DOC_RPT_DATE());
		auditHist.setPLAN_DOC_SND_DATE(audit.getPLAN_DOC_SND_DATE());
		auditHist.setPLAN_DOC_ARR_DATE(audit.getPLAN_DOC_ARR_DATE());
		auditHist.setBID_DOC_RCV_DATE(audit.getBID_DOC_RCV_DATE());
		auditHist.setBID_DOC_RPT_DATE(audit.getBID_DOC_RPT_DATE());
		auditHist.setBID_DOC_SND_DATE(audit.getBID_DOC_SND_DATE());
		auditHist.setBID_DOC_ARR_DATE(audit.getBID_DOC_ARR_DATE());
		auditHist.setSIGN_DOC_RCV_DATE(audit.getSIGN_DOC_RCV_DATE());
		auditHist.setSIGN_DOC_RPT_DATE(audit.getSIGN_DOC_RPT_DATE());
		auditHist.setSIGN_DOC_SND_DATE(audit.getSIGN_DOC_SND_DATE());
		auditHist.setSIGN_DOC_ARR_DATE(audit.getSIGN_DOC_ARR_DATE());
		auditHist.setSET_DOC_RCV_DATE(audit.getSET_DOC_RCV_DATE());
		auditHist.setSET_DOC_RPT_DATE(audit.getSET_DOC_RPT_DATE());
		auditHist.setSET_DOC_SND_DATE(audit.getSET_DOC_SND_DATE());
		auditHist.setSET_DOC_ARR_DATE(audit.getSET_DOC_ARR_DATE());
		auditHist.setPROGRESS_STATUS_MEMO(audit.getPROGRESS_STATUS_MEMO());
		auditHist.setA_AMOUNT(audit.getA_AMOUNT());
		auditHist.setA_STATUS(audit.getA_STATUS());
		auditHist.setB_TYPE(audit.getB_TYPE());
		auditHist.setB_AMOUNT(audit.getB_AMOUNT());
		auditHist.setA_INVOICE_DELI_DATE(audit.getA_INVOICE_DELI_DATE());
		auditHist.setA_INVOICE_DATE(audit.getA_INVOICE_DATE());
		auditHist.setA_INVOICE_NO(audit.getA_INVOICE_NO());
		auditHist.setA_SET_DATE(audit.getA_SET_DATE());
		auditHist.setB_INVOICE_DELI_DATE(audit.getB_INVOICE_DELI_DATE());
		auditHist.setB_INVOICE_DATE(audit.getB_INVOICE_DATE());
		auditHist.setB_INVOICE_NO(audit.getB_INVOICE_NO());
		auditHist.setB_SET_DATE(audit.getB_SET_DATE());
		auditHist.setRESERVE1(audit.getRESERVE1());
		auditHist.setRESERVE2(audit.getRESERVE2());
		auditHist.setRESERVE3(audit.getRESERVE3());
		auditHist.setRESERVE4(audit.getRESERVE4());
		auditHist.setRESERVE5(audit.getRESERVE5());
		auditHist.setRESERVE6(audit.getRESERVE6());
		auditHist.setRESERVE7(audit.getRESERVE7());
		auditHist.setRESERVE8(audit.getRESERVE8());
		auditHist.setRESERVE9(audit.getRESERVE9());
		auditHist.setRESERVE10(audit.getRESERVE10());
		auditHist.setLATEST_FLG(audit.getLATEST_FLG());
		auditHist.setDELETE_FLG(audit.getDELETE_FLG());
		auditHist.setUPDATE_USER(audit.getUPDATE_USER());
		auditHist.setINSERT_DATE(audit.getINSERT_DATE());
		auditHist.setUPDATE_DATE(audit.getUPDATE_DATE());
		auditDao.insertAuditHist(auditHist);
	}

	public AuditDao getAuditDao() {
		return auditDao;
	}

	public void setAuditDao(AuditDao auditDao) {
		this.auditDao = auditDao;
	}

	public ConfigTabDao getConfigTabDao() {
		return configTabDao;
	}

	public void setConfigTabDao(ConfigTabDao configTabDao) {
		this.configTabDao = configTabDao;
	}
}
