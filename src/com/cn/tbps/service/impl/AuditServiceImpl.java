package com.cn.tbps.service.impl;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.cn.common.service.BaseService;
import com.cn.common.util.Constants;
import com.cn.common.util.DateUtil;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dao.AuditCntrctDao;
import com.cn.tbps.dao.AuditCntrctHisDao;
import com.cn.tbps.dao.AuditDao;
import com.cn.tbps.dao.ConfigTabDao;
import com.cn.tbps.dto.AuditAnnualDataDto;
import com.cn.tbps.dto.AuditAuthDto;
import com.cn.tbps.dto.AuditCntrctDto;
import com.cn.tbps.dto.AuditCntrctHisDto;
import com.cn.tbps.dto.AuditDto;
import com.cn.tbps.dto.AuditHistDto;
import com.cn.tbps.dto.AuditStatCostDto;
import com.cn.tbps.dto.AuditStatPaidDto;
import com.cn.tbps.dto.AuditStatisticsDto;
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
	
	private AuditCntrctDao auditCntrctDao;
	private AuditCntrctHisDao auditCntrctHisDao;
	
	private ConfigTabDao configTabDao;

	//审价
	@Override
	public Page queryAuditByPage(String auditNoLow, String auditNoHigh,
			String projectStatus, String projectManager, String valueDateLow,
			String valueDateHigh, String agentNo, String reportNoComp,
			String reportNoLow, String reportNoHigh, Page page, String auditStatus, 
			String projectClass, String docArrDateLow, String docArrDateHigh, String agentName, 
			String contractName, String reportNo, String projectName, String cntrctInfo, String cntYear) {
		
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
		
		String cntYear2 = "";
		if (cntYear.isEmpty())
			cntYear2 = "";
		else {
			if (cntYear.length() == 4)
				cntYear2 = cntYear.substring(2);
			else
				cntYear2 = "";			
		}
		System.out.println("queryAuditByPage  cntYear: "+cntYear);

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
		projectName = StringUtil.replaceDatabaseKeyword_mysql(projectName);
		//查询总记录数
		int totalCount = auditDao.queryAuditCountByPage(auditNoLow, auditNoHigh, projectStatus,
				projectManager, valueDateLow, valueDateHigh, agentNo, comp, reportlow, reporthigh, auditStatus, 
				projectClass, docArrDateLow, docArrDateHigh, agentName, contractName, reportNo, projectName, cntrctInfo, cntYear2);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<AuditDto> list = auditDao.queryAuditByPage(auditNoLow, auditNoHigh, projectStatus, projectManager,
				valueDateLow, valueDateHigh, agentNo, comp, reportlow, reporthigh, auditStatus,
				projectClass, docArrDateLow, docArrDateHigh, agentName, contractName, reportNo, projectName, cntrctInfo, cntYear2,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}

	@Override
//	public Page queryAuditByPage(String keyword, String auditStatus, Page page) {
	public Page queryAuditByPage(String keyword, String projectManager, String reportNo, String projectName, String cntrctInfo, String cntYear, String auditStatus, Page page){
	
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
		String cntYear2 = "";
		if (cntYear.isEmpty())
			cntYear2 = "";
		else {
			if (cntYear.length() == 4)
				cntYear2 = cntYear.substring(2);
			else
				cntYear2 = "";			
		}
		System.out.println("queryAuditByPage  cntYear: "+cntYear);

		keyword = StringUtil.replaceDatabaseKeyword_mysql(keyword);
		//查询总记录数
		int totalCount = auditDao.queryAuditCountByPage(keyword, projectManager, reportNo, projectName, cntrctInfo, cntYear2, auditStatus);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<AuditDto> list = auditDao.queryAuditByPage(keyword, projectManager, reportNo, projectName, cntrctInfo, cntYear2, auditStatus,
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
			String contractName, String reportNo, String projectName, String cntrctInfo, String cntYear) {
		
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
		String cntYear2 = "";
		if (cntYear.isEmpty())
			cntYear2 = "";
		else {
			if (cntYear.length() == 4)
				cntYear2 = cntYear.substring(2);
			else
				cntYear2 = "";			
		}
		System.out.println("queryAuditByPage  cntYear: "+cntYear);

		projectManager = StringUtil.replaceDatabaseKeyword_mysql(projectManager);
		projectName = StringUtil.replaceDatabaseKeyword_mysql(projectName);
		return auditDao.queryAllAuditExport(auditNoLow, auditNoHigh, projectStatus,
				projectManager, valueDateLow, valueDateHigh, agentNo,
				comp, reportlow, reporthigh, auditStatus, 
				projectClass, docArrDateLow, docArrDateHigh, agentName, contractName, reportNo, projectName, cntrctInfo, cntYear2);
	}

	@Override
	public List<AuditDto> queryAllAuditExport(String keyword, String projectManager, String reportNo, String projectName, String cntrctInfo, String cntYear, String auditStatus) {
		
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
		String cntYear2 = "";
		if (cntYear.isEmpty())
			cntYear2 = "";
		else {
			if (cntYear.length() == 4)
				cntYear2 = cntYear.substring(2);
			else
				cntYear2 = "";			
		}
		System.out.println("queryAuditByPage  cntYear: "+cntYear);

		keyword = StringUtil.replaceDatabaseKeyword_mysql(keyword);
		return auditDao.queryAllAuditExport(keyword, projectManager, reportNo, projectName, cntrctInfo, cntYear2, auditStatus);
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
	public String insertAudit(AuditDto audit) throws Exception {
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
		//计算甲方收费，乙方收费，合同委托方收费
		calcABAmount(audit);
		return auditNo;
	}

	@Override
	public void updateAudit(AuditDto audit) throws Exception {
		auditDao.updateAudit(audit);
		//新增审价履历
		insertAuditHist(audit);
		//计算甲方收费，乙方收费，合同委托方收费
		calcABAmount(audit);
	}
	
	/**
	 * 计算甲方收费，乙方收费，合同委托方收费
	 * @param audit
	 * @throws ParseException 
	 */
	private void calcABAmount(AuditDto audit) throws ParseException {
		AuditCntrctDto auditCntrctDto = auditCntrctDao.queryAuditCntrctByID(audit.getCNTRCT_NO());
		List<AuditDto> listAudit1 = auditDao.queryAllAuditByCntrctNo(audit.getCNTRCT_NO(), "1");
		List<AuditDto> listAudit2 = auditDao.queryAllAuditByCntrctNo(audit.getCNTRCT_NO(), "2");
		//List<AuditDto> listAudit3 = auditDao.queryAllAuditByCntrctNo(audit.getCNTRCT_NO(), "3");
		List<AuditDto> listAudit4 = auditDao.queryAllAuditByCntrctNo(audit.getCNTRCT_NO(), "4");
		List<AuditDto> listAudit5 = auditDao.queryAllAuditByCntrctNo(audit.getCNTRCT_NO(), "5");
		BigDecimal bAmountAll = new BigDecimal(0);
		BigDecimal amountTotal1 = new BigDecimal(0);
		BigDecimal amountTotal2 = new BigDecimal(0);
		//BigDecimal amountTotal3 = new BigDecimal(0);
		BigDecimal amountTotal4 = new BigDecimal(0);
		BigDecimal amountTotal5 = new BigDecimal(0);
		
		//审价送审价合计
		for(AuditDto auditDto : listAudit1) {
			amountTotal1 = amountTotal1.add(auditDto.getVERIFY_PER_AMOUNT());
		}
		//审价
		for(AuditDto auditDto : listAudit1) {
			//甲方收费
			BigDecimal AAmount = new BigDecimal(0);
			if(auditDto.getVERIFY_PER_AMOUNT().compareTo(BigDecimal.ZERO) == 1) {
				if(auditCntrctDto.getCNTRCT_RATE_1().compareTo(BigDecimal.ZERO) == 1) {
					//1、填写费率，根据费率计算得到
					AAmount = auditDto.getVERIFY_PER_AMOUNT().multiply(auditCntrctDto.getCNTRCT_RATE_1().divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP));
				} else if(auditCntrctDto.getCNTRCT_AMOUNT_1().compareTo(BigDecimal.ZERO) == 1) {
					//填写金额，根据“预算金额/本合同下所有项目预算金额合计*金额”计算
					AAmount = auditDto.getVERIFY_PER_AMOUNT().multiply(auditCntrctDto.getCNTRCT_AMOUNT_1()).divide(amountTotal1, 2, BigDecimal.ROUND_HALF_UP);
				}
			}
			auditDto.setA_AMOUNT(AAmount);
			
			//合同委托方收费合计
			bAmountAll = bAmountAll.add(AAmount);
			
			//乙方收费
			String bType = auditDto.getB_TYPE();
			BigDecimal bAmount = new BigDecimal(0);
			if(bType.equals("1")) {
				//标准收费
				BigDecimal standard = standardAmountCalc(auditDto);
				BigDecimal brate = standardRateCalc(auditDto);
				if(standard.compareTo(BigDecimal.ZERO) == 1) {
					if(auditDto.getB_RATE().compareTo(BigDecimal.ZERO) == 1) {
						bAmount = auditDto.getB_RATE().multiply(standard).divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP);
					} else {
						bAmount = standard;
					}

//					bAmount = standard;
//					auditDto.setB_RATE(brate);
				}
			} else if(bType.equals("2")) {
				//收费金额
				bAmount = auditDto.getB_RATE();
			} else if(bType.equals("3")) {
				//送审金额
				BigDecimal verifyPerAmount = auditDto.getVERIFY_PER_AMOUNT();
				if(verifyPerAmount.compareTo(BigDecimal.ZERO) == 1) {
					if(auditDto.getB_RATE().compareTo(BigDecimal.ZERO) == 1) {
						bAmount = auditDto.getB_RATE().multiply(verifyPerAmount).divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP);
					} else {
						bAmount = verifyPerAmount;
					}
				}
			}
			auditDto.setB_AMOUNT(bAmount);
			auditDao.updateAudit(auditDto);
			//新增审价履历
			insertAuditHist(auditDto);
		}
		
		//咨询送审价合计
		for(AuditDto auditDto : listAudit2) {
			amountTotal2 = amountTotal2.add(auditDto.getVERIFY_PER_AMOUNT());
		}
		//咨询
		for(AuditDto auditDto : listAudit2) {
			//甲方收费
			BigDecimal AAmount = new BigDecimal(0);
			if(auditDto.getVERIFY_PER_AMOUNT().compareTo(BigDecimal.ZERO) == 1) {
				if(auditCntrctDto.getCNTRCT_RATE_2().compareTo(BigDecimal.ZERO) == 1) {
					//1、填写费率，根据费率计算得到
					AAmount = auditDto.getVERIFY_PER_AMOUNT().multiply(auditCntrctDto.getCNTRCT_RATE_2().divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP));
				} else if(auditCntrctDto.getCNTRCT_AMOUNT_2().compareTo(BigDecimal.ZERO) == 1) {
					//填写金额，根据“预算金额/本合同下所有项目预算金额合计*金额”计算
					AAmount = auditDto.getVERIFY_PER_AMOUNT().multiply(auditCntrctDto.getCNTRCT_AMOUNT_2()).divide(amountTotal2, 2, BigDecimal.ROUND_HALF_UP);
				}
			}
			auditDto.setA_AMOUNT(AAmount);
			
			//合同委托方收费合计
			bAmountAll = bAmountAll.add(AAmount);
			
			//乙方收费
			String bType = auditDto.getB_TYPE();
			BigDecimal bAmount = new BigDecimal(0);
			if(bType.equals("1")) {
				//标准收费
				BigDecimal standard = standardAmountCalc(auditDto);
				if(standard.compareTo(BigDecimal.ZERO) == 1) {
					if(auditDto.getB_RATE().compareTo(BigDecimal.ZERO) == 1) {
						bAmount = auditDto.getB_RATE().multiply(standard).divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP);
					} else {
						bAmount = standard;
					}
				}
			} else if(bType.equals("2")) {
				//收费金额
				bAmount = auditDto.getB_RATE();
			} else if(bType.equals("3")) {
				//送审金额
				BigDecimal verifyPerAmount = auditDto.getVERIFY_PER_AMOUNT();
				if(verifyPerAmount.compareTo(BigDecimal.ZERO) == 1) {
					if(auditDto.getB_RATE().compareTo(BigDecimal.ZERO) == 1) {
						bAmount = auditDto.getB_RATE().multiply(verifyPerAmount).divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP);
					} else {
						bAmount = verifyPerAmount;
					}
				}
			}
			auditDto.setB_AMOUNT(bAmount);
			auditDao.updateAudit(auditDto);
			//新增审价履历
			insertAuditHist(auditDto);
		}
		
		//控制价编制限价金额合计
		for(AuditDto auditDto : listAudit4) {
			amountTotal4 = amountTotal4.add(auditDto.getCNT_PRICE());
		}
		//控制价编制
		for(AuditDto auditDto : listAudit4) {
			//甲方收费
			BigDecimal AAmount = new BigDecimal(0);
			if(auditDto.getCNT_PRICE().compareTo(BigDecimal.ZERO) == 1) {
				if(auditCntrctDto.getCNTRCT_RATE_4().compareTo(BigDecimal.ZERO) == 1) {
					//1、填写费率，根据费率计算得到
					AAmount = auditDto.getCNT_PRICE().multiply(auditCntrctDto.getCNTRCT_RATE_4().divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP));
				} else if(auditCntrctDto.getCNTRCT_AMOUNT_4().compareTo(BigDecimal.ZERO) == 1) {
					//填写金额，根据“预算金额/本合同下所有项目预算金额合计*金额”计算
					AAmount = auditDto.getCNT_PRICE().multiply(auditCntrctDto.getCNTRCT_AMOUNT_4()).divide(amountTotal4, 2, BigDecimal.ROUND_HALF_UP);
				}
			}
			auditDto.setA_AMOUNT(AAmount);
			
			//合同委托方收费合计
			bAmountAll = bAmountAll.add(AAmount);
			
			//乙方收费
			String bType = auditDto.getB_TYPE();
			BigDecimal bAmount = new BigDecimal(0);
			if(bType.equals("1")) {
				//标准收费
				BigDecimal standard = standardAmountCalc(auditDto);
				if(standard.compareTo(BigDecimal.ZERO) == 1) {
					if(auditDto.getB_RATE().compareTo(BigDecimal.ZERO) == 1) {
						bAmount = auditDto.getB_RATE().multiply(standard).divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP);
					} else {
						bAmount = standard;
					}
				}
			} else if(bType.equals("2")) {
				//收费金额
				bAmount = auditDto.getB_RATE();
			} else if(bType.equals("3")) {
				//送审金额
				BigDecimal verifyPerAmount = auditDto.getVERIFY_PER_AMOUNT();
				if(verifyPerAmount.compareTo(BigDecimal.ZERO) == 1) {
					if(auditDto.getB_RATE().compareTo(BigDecimal.ZERO) == 1) {
						bAmount = auditDto.getB_RATE().multiply(verifyPerAmount).divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP);
					} else {
						bAmount = verifyPerAmount;
					}
				}
			}
			auditDto.setB_AMOUNT(bAmount);
			auditDao.updateAudit(auditDto);
			//新增审价履历
			insertAuditHist(auditDto);
		}
		
		//投资监理预算金额合计
		for(AuditDto auditDto : listAudit5) {
			amountTotal5 = amountTotal5.add(auditDto.getPRE_PRICE());
		}
		//投资监理
		for(AuditDto auditDto : listAudit5) {
			//甲方收费
			BigDecimal AAmount = new BigDecimal(0);
			if(auditDto.getPRE_PRICE().compareTo(BigDecimal.ZERO) == 1) {
				if(auditCntrctDto.getCNTRCT_RATE_5().compareTo(BigDecimal.ZERO) == 1) {
					//1、填写费率，根据费率计算得到
					AAmount = auditDto.getPRE_PRICE().multiply(auditCntrctDto.getCNTRCT_RATE_5().divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP));
				} else if(auditCntrctDto.getCNTRCT_AMOUNT_5().compareTo(BigDecimal.ZERO) == 1) {
					//填写金额，根据“预算金额/本合同下所有项目预算金额合计*金额”计算
					AAmount = auditDto.getPRE_PRICE().multiply(auditCntrctDto.getCNTRCT_AMOUNT_5()).divide(amountTotal5, 2, BigDecimal.ROUND_HALF_UP);
				}
			}
			auditDto.setA_AMOUNT(AAmount);
			
			//合同委托方收费合计
			bAmountAll = bAmountAll.add(AAmount);
			
			//乙方收费
			String bType = auditDto.getB_TYPE();
			BigDecimal bAmount = new BigDecimal(0);
			if(bType.equals("1")) {
				//标准收费
				BigDecimal standard = standardAmountCalc(auditDto);
				if(standard.compareTo(BigDecimal.ZERO) == 1) {
					if(auditDto.getB_RATE().compareTo(BigDecimal.ZERO) == 1) {
						bAmount = auditDto.getB_RATE().multiply(standard).divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP);
					} else {
						bAmount = standard;
					}
				}
			} else if(bType.equals("2")) {
				//收费金额
				bAmount = auditDto.getB_RATE();
			} else if(bType.equals("3")) {
				//送审金额
				BigDecimal verifyPerAmount = auditDto.getVERIFY_PER_AMOUNT();
				if(verifyPerAmount.compareTo(BigDecimal.ZERO) == 1) {
					if(auditDto.getB_RATE().compareTo(BigDecimal.ZERO) == 1) {
						bAmount = auditDto.getB_RATE().multiply(verifyPerAmount).divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP);
					} else {
						bAmount = verifyPerAmount;
					}
				}
			}
			auditDto.setB_AMOUNT(bAmount);
			auditDao.updateAudit(auditDto);
			//新增审价履历
			insertAuditHist(auditDto);
		}
		
		//合同委托方收费
		auditCntrctDto.setCNTRCT_TOTAL_AMOUNT(bAmountAll);
		auditCntrctDao.updateAuditCntrct(auditCntrctDto);
		//新增审价履历
		insertAuditCntrctHist(auditCntrctDto);
		
	}
	
	
	//计算审价收费合计标准价
	public static BigDecimal totalAmountCalc(AuditDto audit){
		BigDecimal sum_tax_calc_amount = new BigDecimal(0);
		if (audit.getVERIFY_PER_AMOUNT()== null ||audit.getVERIFY_AMOUNT()== null||audit.getVERIFY_INCREASE()== null){
			return sum_tax_calc_amount ;			
		}
		
		// 各阶段的收费费率（%）
		// 100以下 （含100）	    7.3
		// 100~500 （含500）	    6.7
		// 500~1000（含1000）	    5.1
		// 1000~3000 （含3000）	4
		// 3000~5000 （含5000）	3.8
		// 5000~10000 （含10000）	3.6
		// 10000以上                      	3.2
		
		BigDecimal verify_per_amount = audit.getVERIFY_PER_AMOUNT();
		BigDecimal calc_amount = new BigDecimal(0);
		BigDecimal left_amount = new BigDecimal(0);
		BigDecimal tax_calc_amount = new BigDecimal(0);
		
		// 100以下 （含100）	   
		if (verify_per_amount.compareTo(new BigDecimal(100)) <= 0){
			calc_amount = verify_per_amount;
			left_amount = new BigDecimal(0);
		}else{
			// 100 以上
			calc_amount = new BigDecimal(100);
			left_amount = verify_per_amount.subtract(new BigDecimal(100));
		}
		tax_calc_amount = calc_amount.multiply(new BigDecimal(7.3)); 
		sum_tax_calc_amount=sum_tax_calc_amount.add(tax_calc_amount); 
//		System.out.println("tax_calc_amount" + tax_calc_amount);
//		System.out.println("sum_tax_calc_amount" + sum_tax_calc_amount);
		
		// 100~500 （含500）	   
		if (left_amount.compareTo(new BigDecimal(400)) < 0 ){
			calc_amount = left_amount ;
			left_amount = new BigDecimal(0);
		}else{
			// 500 以上
			calc_amount = new BigDecimal(400);
			left_amount = left_amount.subtract(new BigDecimal(400));
		}
		tax_calc_amount = calc_amount.multiply(new BigDecimal(6.7)); 
		sum_tax_calc_amount=sum_tax_calc_amount.add(tax_calc_amount); 
//		System.out.println("tax_calc_amount" + tax_calc_amount);
//		System.out.println("sum_tax_calc_amount" + sum_tax_calc_amount);
		
		// 500~1000 （含1000）	   
		if (left_amount.compareTo(new BigDecimal(500)) < 0 ){
			calc_amount = left_amount ;
			left_amount = new BigDecimal(0);
		}else{
			// 1000 以上
			calc_amount = new BigDecimal(500);
			left_amount = left_amount.subtract(new BigDecimal(500));
		}
		tax_calc_amount = calc_amount.multiply(new BigDecimal(5.1)); 
		sum_tax_calc_amount=sum_tax_calc_amount.add(tax_calc_amount); 
//		System.out.println("tax_calc_amount" + tax_calc_amount);
//		System.out.println("sum_tax_calc_amount" + sum_tax_calc_amount);
		
		// 1000~3000 （含1000）	   
		if (left_amount.compareTo(new BigDecimal(2000)) < 0 ){
			calc_amount = left_amount ;
			left_amount = new BigDecimal(0);
		}else{
			// 3000 以上
			calc_amount = new BigDecimal(2000);
			left_amount = left_amount.subtract(new BigDecimal(2000));
		}
		tax_calc_amount = calc_amount.multiply(new BigDecimal(4)); 
		sum_tax_calc_amount=sum_tax_calc_amount.add(tax_calc_amount); 
//		System.out.println("tax_calc_amount" + tax_calc_amount);
//		System.out.println("sum_tax_calc_amount" + sum_tax_calc_amount);
		
		// 3000~5000 （含5000）	   
		if (left_amount.compareTo(new BigDecimal(2000)) < 0 ){
			calc_amount = left_amount ;
			left_amount = new BigDecimal(0);
		}else{
			// 5000 以上
			calc_amount = new BigDecimal(2000);
			left_amount = left_amount.subtract(new BigDecimal(2000));
		}
		tax_calc_amount = calc_amount.multiply(new BigDecimal(3.8)); 
		sum_tax_calc_amount=sum_tax_calc_amount.add(tax_calc_amount); 
//		System.out.println("tax_calc_amount" + tax_calc_amount);
//		System.out.println("sum_tax_calc_amount" + sum_tax_calc_amount);
		
		// 5000~10000 （含10000）	   
		if (left_amount.compareTo(new BigDecimal(5000)) < 0 ){
			calc_amount = left_amount ;
			left_amount = new BigDecimal(0);
		}else{
			// 10000 以上
			calc_amount = new BigDecimal(5000);
			left_amount = left_amount.subtract(new BigDecimal(5000));
		}
		tax_calc_amount = calc_amount.multiply(new BigDecimal(3.6)); 
		sum_tax_calc_amount=sum_tax_calc_amount.add(tax_calc_amount); 
//		System.out.println("tax_calc_amount" + tax_calc_amount);
//		System.out.println("sum_tax_calc_amount" + sum_tax_calc_amount);

		// 10000 以上
		calc_amount = left_amount;
		tax_calc_amount = calc_amount.multiply(new BigDecimal(3.2)); 
		sum_tax_calc_amount=sum_tax_calc_amount.add(tax_calc_amount); 
//		System.out.println("tax_calc_amount" + tax_calc_amount);
//		System.out.println("sum_tax_calc_amount" + sum_tax_calc_amount);
		
		return sum_tax_calc_amount ;
	}

	//计算折算费率
	public static BigDecimal standardRateCalc(AuditDto audit){
		BigDecimal sum_tax_calc_amount = new BigDecimal(0);
		BigDecimal ori_rate = new BigDecimal(0);
		sum_tax_calc_amount =  totalAmountCalc(audit);
		
		//折算后税率%
		ori_rate = sum_tax_calc_amount.divide(audit.getVERIFY_PER_AMOUNT(),10,BigDecimal.ROUND_HALF_UP);
		return ori_rate ;
	}
	
	//计算标准价
	public static BigDecimal standardAmountCalc(AuditDto audit){
		BigDecimal stdAmount = new BigDecimal(0);
		BigDecimal sum_tax_calc_amount = new BigDecimal(0);
		BigDecimal ori_rate = new BigDecimal(0);
		sum_tax_calc_amount =  totalAmountCalc(audit);		
		
		//折算后税率%
		ori_rate = sum_tax_calc_amount.divide(audit.getVERIFY_PER_AMOUNT(),10,BigDecimal.ROUND_HALF_UP);
		
		// 标准收费额计算	（核增额*折算费率+（核减额-送审价*5%）*折算费率）%
		stdAmount = audit.getVERIFY_INCREASE().multiply(ori_rate).add((audit.getVERIFY_DECREASE().subtract(audit.getVERIFY_PER_AMOUNT().multiply(new BigDecimal(0.05))).multiply(ori_rate))).divide(new BigDecimal(100),2, BigDecimal.ROUND_HALF_UP);
		System.out.println("ori_rate" + ori_rate);
		System.out.println("stdAmount" + stdAmount);
		
		return stdAmount ;
	}
	
	@Override
	public void deleteAudit(String auditNo, String user) throws Exception {
		AuditDto audit = auditDao.queryAuditByID(auditNo);
		if(audit != null) {
			//删除标记=已删除
			audit.setDELETE_FLG(Constants.IS_DELETE_DEL);
			audit.setUPDATE_USER(user);
			auditDao.updateAudit(audit);
			//插入审价履历
			insertAuditHist(audit);
			//计算甲方收费，乙方收费，合同委托方收费
			calcABAmount(audit);
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
		auditHist.setCNTRCT_NO(audit.getCNTRCT_NO());
		auditHist.setCNTRCT_NM(audit.getCNTRCT_NM());
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
		auditHist.setPROF_INFO(audit.getPROF_INFO());
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
		auditHist.setPLAN_DOC_SND_TYPE(audit.getPLAN_DOC_SND_TYPE());
		auditHist.setPLAN_DOC_ARR_DATE(audit.getPLAN_DOC_ARR_DATE());
		auditHist.setBID_DOC_RCV_DATE(audit.getBID_DOC_RCV_DATE());
		auditHist.setBID_DOC_RPT_DATE(audit.getBID_DOC_RPT_DATE());
		auditHist.setBID_DOC_SND_TYPE(audit.getBID_DOC_SND_TYPE());
		auditHist.setBID_DOC_ARR_DATE(audit.getBID_DOC_ARR_DATE());
		auditHist.setSIGN_DOC_RCV_DATE(audit.getSIGN_DOC_RCV_DATE());
		auditHist.setSIGN_DOC_RPT_DATE(audit.getSIGN_DOC_RPT_DATE());
		auditHist.setSIGN_DOC_SND_TYPE(audit.getSIGN_DOC_SND_TYPE());
		auditHist.setSIGN_DOC_ARR_DATE(audit.getSIGN_DOC_ARR_DATE());
		auditHist.setSET_DOC_RCV_DATE(audit.getSET_DOC_RCV_DATE());
		auditHist.setSET_DOC_RPT_DATE(audit.getSET_DOC_RPT_DATE());
		auditHist.setSET_DOC_SND_TYPE(audit.getSET_DOC_SND_TYPE());
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
		auditHist.setB_RATE(audit.getB_RATE());
		auditHist.setCNTRCT_INFO(audit.getCNTRCT_INFO());
		auditHist.setPROJECT_NAME_PASS(audit.getPROJECT_NAME_PASS());
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
	
	/**
	 * 插入审价履历
	 * @param auditCntrct
	 * @throws ParseException 
	 */
	private void insertAuditCntrctHist(AuditCntrctDto auditCntrct) throws ParseException {
		try {
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
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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

	@Override
	public AuditAuthDto queryAuditAuth(String projectManager, String startDate, String endDate) {
		return auditDao.queryAuditAuth(projectManager, startDate, endDate);
	}

	@Override
	public AuditStatisticsDto queryAuditStatistics(String projectManager, String startDate, String endDate) {
		return auditDao.queryAuditStatistics(projectManager, startDate, endDate);
	}
	
	@Override
	public AuditAnnualDataDto queryAuditMonthData(String projectManager, String startDate, String endDate, String CNTRCT_TYPE) {
		AuditAnnualDataDto auditAnnualData = new AuditAnnualDataDto();
		BigDecimal zero = new BigDecimal(0);
		Date start = DateUtil.strToDate(startDate, DateUtil.DATE_FORMAT_SHORT);
		Date end = DateUtil.strToDate(endDate, DateUtil.DATE_FORMAT_SHORT);
		Date tmpdate = null;
		
		//本月收到项目
		int receiveAudit = 0;
		//本月完成项目
		int completeAuditCurrentMonth = 0;
		//历史完成项目
		int completeAuditHis = 0;
		//总金额本月送审（元）
		BigDecimal submitAuditAmount = new BigDecimal(0);
		//总金额本月完成送审（元）
		BigDecimal completeAuditAmount = new BigDecimal(0);
		//审定总额（元）
		BigDecimal authorizeAuditAmount = new BigDecimal(0);
		//未完成审价本月（个）
		Integer incompleteAuditCurrentMonth = 0;
		//未完成审价历史（个）
		Integer incompleteAuditHis = 0;
		//本月总发票（张）
		Integer totalNumMonth = 0;
		//本月总发票（元）
		BigDecimal totalAmountMonth = new BigDecimal(0);
		//本月未收（张）
		Integer unreceivedNumMonth = 0;
		//本月未收（元）
		BigDecimal unreceivedAmountMonth = new BigDecimal(0);
		//历史未收发票（张）
		Integer unreceivedNumHis = 0;
		//历史未收发票（元）
		BigDecimal unreceivedAmountHis = new BigDecimal(0);
		
		//本月收到项目
		//判断条件是“资料收到日期”为统计日期范围
		String dateCondition = " (T.PLAN_DOC_RCV_DATE >= '" + startDate + "' and T.PLAN_DOC_RCV_DATE <= '" + endDate + "') ";
		dateCondition += "or (T.DOC_REC_DATE >= '" + startDate + "' and T.DOC_REC_DATE <= '" + endDate + "') ";
		List<AuditDto> list1 = auditDao.queryAuditMonthSumList(projectManager, CNTRCT_TYPE, dateCondition);
		if(list1 != null) {
			receiveAudit = list1.size();
			for(AuditDto audit : list1) {
				//本月送审项目金额
				if(audit.getVERIFY_PER_AMOUNT() != null) {
					submitAuditAmount = submitAuditAmount.add(audit.getVERIFY_PER_AMOUNT());
					if(calcCompleteAudit(audit, start, end)) {
						//完成送审项目数
						completeAuditCurrentMonth++;
						//完成送审项目金额
						completeAuditAmount = completeAuditAmount.add(audit.getVERIFY_PER_AMOUNT());
						//本月完成送审
						authorizeAuditAmount = authorizeAuditAmount.add(audit.getVERIFY_AMOUNT());
					}
					
					//乙方发票号不为空
					if(StringUtil.isNotBlank(audit.getB_INVOICE_NO())) {
						//本月总发票数
						//本统计月的审价项目的“乙方发票号”不为空的件数，如果内容有；需要分割统计。（不会每个都加；只会在多个中间加；）
						if(audit.getB_INVOICE_NO().indexOf(";") >= 0) {
							String[] ss = audit.getB_INVOICE_NO().split(";");
							for(String s : ss) {
								if(StringUtil.isNotBlank(s)) {
									totalNumMonth++;
								}
							}
						} else {
							totalNumMonth++;
						}
						
						//本月总发票金额
						//本统计月的审价项目的“乙方发票号”不为空的“乙方收费”金额。
						if(audit.getB_AMOUNT() != null) {
							totalAmountMonth = totalAmountMonth.add(audit.getB_AMOUNT());
						}
						
						//本月未收发票
						//本统计月的审价项目的“乙方发票号”不为空但是“乙方到账日期”为空的件数，如果内容有；需要分割统计。
						if(audit.getB_SET_DATE() == null) {
							if(audit.getB_INVOICE_NO().indexOf(";") >= 0) {
								String[] ss = audit.getB_INVOICE_NO().split(";");
								for(String s : ss) {
									if(StringUtil.isNotBlank(s)) {
										unreceivedNumMonth++;
									}
								}
							} else {
								unreceivedNumMonth++;
							}
							
							//本月未收发票金额
							//本统计月的审价项目的“乙方发票号”不为空但是“乙方到账日期”为空的“乙方收费”金额。
							if(audit.getB_AMOUNT() != null) {
								unreceivedAmountMonth = unreceivedAmountMonth.add(audit.getB_AMOUNT());
							}
						}
					}
				}
			}
		}
		auditAnnualData.setReceiveAudit(receiveAudit);
		
		//本月完成项目
		//本月的判断条件是“资料收到日期”为统计日期范围，完成的判断条件是
		auditAnnualData.setCompleteAuditCurrentMonth(completeAuditCurrentMonth);
		
		//历史完成项目
		//历史的判断条件是“资料收到日期”在本统计日期范围以前即小于3/29， 完成条件同上
		dateCondition = "(T.PLAN_DOC_RCV_DATE < '" + startDate + "')";
		dateCondition += "or (T.DOC_REC_DATE < '" + startDate + "')";
		List<AuditDto> list2 = auditDao.queryAuditMonthSumList(projectManager, CNTRCT_TYPE, dateCondition);
		if(list2 != null) {
			for(AuditDto audit : list2) {
				//本月送审总金额
				if(audit.getVERIFY_PER_AMOUNT() != null) {
					if(calcCompleteAudit(audit, start, end)) {
						//历史完成送审
						completeAuditHis++;
					}
				}
				//乙方发票号不为空
				if(StringUtil.isNotBlank(audit.getB_INVOICE_NO())) {
					//历史未收发票（张）
					//3/29以前（不含3/29）的审价项目的“乙方发票号”不为空但是“乙方到账日期”为空的件数，如果内容有；需要分割统计。
					if(audit.getB_SET_DATE() == null) {
						if(audit.getB_INVOICE_NO().indexOf(";") >= 0) {
							String[] ss = audit.getB_INVOICE_NO().split(";");
							for(String s : ss) {
								if(StringUtil.isNotBlank(s)) {
									unreceivedNumHis++;
								}
							}
						} else {
							unreceivedNumHis++;
						}
						
						//历史未收发票金额
						//3/29以前（不含3/29）的审价项目的“乙方发票号”不为空但是“乙方到账日期”为空的“乙方收费”金额。
						if(audit.getB_AMOUNT() != null) {
							unreceivedAmountHis = unreceivedAmountHis.add(audit.getB_AMOUNT());
						}
					}
				}
			}
			//历史未完成项目数=历史项目数-历史完成项目数
			incompleteAuditHis = list2.size() - completeAuditHis;
		}
		auditAnnualData.setCompleteAuditHis(completeAuditHis);
		
		//总金额本月送审（元）
		//本统计月的收到项目的"送审价"合计
		auditAnnualData.setSubmitAuditAmount(submitAuditAmount.setScale(6, BigDecimal.ROUND_HALF_UP));
		
		//总金额本月完成送审（元）
		//本统计月的完成审价项目的"送审价"合计
		auditAnnualData.setCompleteAuditAmount(completeAuditAmount.setScale(6, BigDecimal.ROUND_HALF_UP));
		
		//审定总额（元）
		//本统计月的完成审价项目的"审核价"合计
		auditAnnualData.setAuthorizeAuditAmount(authorizeAuditAmount.setScale(6, BigDecimal.ROUND_HALF_UP));
		
		//本月未完成项目（个）=本月收到项目-本月完成审价项目
		incompleteAuditCurrentMonth = receiveAudit - completeAuditCurrentMonth;
		auditAnnualData.setIncompleteAuditCurrentMonth(incompleteAuditCurrentMonth);
		
		//历史未完成项目
		//3/29以前（不含3/29）的未完成项目个数
		auditAnnualData.setIncompleteAuditHis(incompleteAuditHis);
		
		//本月总发票（张）
		//本统计月的审价项目的“乙方发票号”不为空的件数，如果内容有；需要分割统计。（不会每个都加；只会在多个中间加；）
		auditAnnualData.setTotalNumMonth(totalNumMonth);
		
		//本月总发票金额
		//本统计月的审价项目的“乙方发票号”不为空的“乙方收费”金额。
		auditAnnualData.setTotalAmountMonth(totalAmountMonth.setScale(6, BigDecimal.ROUND_HALF_UP));
		
		//本月未收发票（张）
		//本统计月的审价项目的“乙方发票号”不为空但是“乙方到账日期”为空的件数，如果内容有；需要分割统计。
		auditAnnualData.setUnreceivedNumMonth(unreceivedNumMonth);
		
		//本月未收发票金额
		//本统计月的审价项目的“乙方发票号”不为空但是“乙方到账日期”为空的“乙方收费”金额。
		auditAnnualData.setUnreceivedAmountMonth(unreceivedAmountMonth.setScale(6, BigDecimal.ROUND_HALF_UP));
		
		//历史未收发票（张）
		//3/29以前（不含3/29）的审价项目的“乙方发票号”不为空但是“乙方到账日期”为空的件数，如果内容有；需要分割统计。
		auditAnnualData.setUnreceivedNumHis(unreceivedNumHis);
		
		//历史未收发票金额
		//3/29以前（不含3/29）的审价项目的“乙方发票号”不为空但是“乙方到账日期”为空的“乙方收费”金额。
		auditAnnualData.setUnreceivedAmountHis(unreceivedAmountHis.setScale(6, BigDecimal.ROUND_HALF_UP));
		return auditAnnualData;
	}
	
	@Override
	public AuditAnnualDataDto queryAuditMonthData(String projectManager, String startDate, String endDate, String CNTRCT_TYPE, String CNTRCT_INFO) {
		AuditAnnualDataDto auditAnnualData = new AuditAnnualDataDto();
		BigDecimal zero = new BigDecimal(0);
		Date start = DateUtil.strToDate(startDate, DateUtil.DATE_FORMAT_SHORT);
		Date end = DateUtil.strToDate(endDate, DateUtil.DATE_FORMAT_SHORT);
		Date tmpdate = null;
		
		//本月收到项目
		int receiveAudit = 0;
		//本月完成项目
		int completeAuditCurrentMonth = 0;
		//历史完成项目
		int completeAuditHis = 0;
		//总金额本月送审（元）
		BigDecimal submitAuditAmount = new BigDecimal(0);
		//总金额本月完成送审（元）
		BigDecimal completeAuditAmount = new BigDecimal(0);
		//审定总额（元）
		BigDecimal authorizeAuditAmount = new BigDecimal(0);
		//未完成审价本月（个）
		Integer incompleteAuditCurrentMonth = 0;
		//未完成审价历史（个）
		Integer incompleteAuditHis = 0;
		//审价费本月确认应收（万元）
		BigDecimal bAmount = new BigDecimal(0);
		//实收审价费本月发票（个）
		Integer bAmountNumMonth = 0;
		//实收审价费本月（万元）
		BigDecimal bAmountMonth = new BigDecimal(0);
		//实收审价费历史发票（个）
		Integer bAmountNumMonthHis = 0;
		//实收审价费历史（万元）
		BigDecimal bAmountMonthHis = new BigDecimal(0);
		//本月总发票（张）
		Integer totalNumMonth = 0;
		//本月总发票（元）
		BigDecimal totalAmountMonth = new BigDecimal(0);
		//本月未收（张）
		Integer unreceivedNumMonth = 0;
		//本月未收（元）
		BigDecimal unreceivedAmountMonth = new BigDecimal(0);
		//历史未收发票（张）
		Integer unreceivedNumHis = 0;
		//历史未收发票（元）
		BigDecimal unreceivedAmountHis = new BigDecimal(0);
		
		//本月收到项目
		//判断条件是“资料收到日期”为统计日期范围
		String dateCondition = " ((T.PLAN_DOC_RCV_DATE >= '" + startDate + "' and T.PLAN_DOC_RCV_DATE <= '" + endDate + "') ";
		dateCondition += "or (T.DOC_REC_DATE >= '" + startDate + "' and T.DOC_REC_DATE <= '" + endDate + "'))";
		switch(Integer.parseInt(CNTRCT_INFO)){
		case 1:
			//地铁审价以发出审定单时间作为完成节点
			//dateCondition = " (T.APPROVAL_SND_DATE >= '" + startDate + "' and T.APPROVAL_SND_DATE <= '" + endDate + "') ";
			break;
		case 2:
		case 4:
			//咨询及控制价以初稿日期作为完成节点
			dateCondition = " (T.DRAFT_DATE >= '" + startDate + "' and T.DRAFT_DATE <= '" + endDate + "') ";
			break;
		default:
			break;
		}
		List<AuditDto> list1 = auditDao.queryAuditMonthSumList(projectManager, CNTRCT_TYPE, dateCondition, CNTRCT_INFO);
		if(list1 != null) {
			receiveAudit = list1.size();
			for(AuditDto audit : list1) {
				//本月送审项目金额
				if(audit.getVERIFY_PER_AMOUNT() != null && !CNTRCT_INFO.equals("4")) {
					submitAuditAmount = submitAuditAmount.add(audit.getVERIFY_PER_AMOUNT());
					if(calcCompleteAuditSJ(audit, start, end)) {
						//完成送审项目数
						completeAuditCurrentMonth++;
						//完成送审项目金额
						completeAuditAmount = completeAuditAmount.add(audit.getVERIFY_PER_AMOUNT());
						//本月完成送审
						authorizeAuditAmount = authorizeAuditAmount.add(audit.getVERIFY_AMOUNT());
					}

					//本月应收指该月发出审定单的项目对应的乙方收费，未确认部分由人工填写
					if(audit.getB_AMOUNT() != null) {
						bAmount = bAmount.add(audit.getB_AMOUNT());
					}
					//实收审价费根据乙方开票日期，该月开具的当月送审项目发票计入本月，该月开具的之前月送审项目的发票计入历史，一个项目开具的发票数计为一张
					if((audit.getB_INVOICE_DATE() != null && audit.getB_INVOICE_DATE().after(start) && audit.getB_INVOICE_DATE().before(end))){
						bAmountMonth = bAmountMonth.add(audit.getB_AMOUNT());
						bAmountNumMonth++;
					}
					
					//乙方发票号不为空
					if(StringUtil.isNotBlank(audit.getB_INVOICE_NO())) {
						//本月总发票数
						//本统计月的审价项目的“乙方发票号”不为空的件数，如果内容有；需要分割统计。（不会每个都加；只会在多个中间加；）
						if(audit.getB_INVOICE_NO().indexOf(";") >= 0) {
							String[] ss = audit.getB_INVOICE_NO().split(";");
							for(String s : ss) {
								if(StringUtil.isNotBlank(s)) {
									totalNumMonth++;
								}
							}
						} else {
							totalNumMonth++;
						}
						
						//本月总发票金额
						//本统计月的审价项目的“乙方发票号”不为空的“乙方收费”金额。
						if(audit.getB_AMOUNT() != null) {
							totalAmountMonth = totalAmountMonth.add(audit.getB_AMOUNT());
						}
						
						//本月未收发票
						//本统计月的审价项目的“乙方发票号”不为空但是“乙方到账日期”为空的件数，如果内容有；需要分割统计。
						if(audit.getB_SET_DATE() == null) {
							if(audit.getB_INVOICE_NO().indexOf(";") >= 0) {
								String[] ss = audit.getB_INVOICE_NO().split(";");
								for(String s : ss) {
									if(StringUtil.isNotBlank(s)) {
										unreceivedNumMonth++;
									}
								}
							} else {
								unreceivedNumMonth++;
							}
							
							//本月未收发票金额
							//本统计月的审价项目的“乙方发票号”不为空但是“乙方到账日期”为空的“乙方收费”金额。
							if(audit.getB_AMOUNT() != null) {
								unreceivedAmountMonth = unreceivedAmountMonth.add(audit.getB_AMOUNT());
							}
						}
					}
				}

				if(audit.getCNT_PRICE() != null && audit.getCNT_PRICE().compareTo(BigDecimal.ZERO) > 0 && CNTRCT_INFO.equals("4")) {
					//完成送审项目数
					completeAuditCurrentMonth++;
					//本月完成送审
					authorizeAuditAmount = authorizeAuditAmount.add(audit.getCNT_PRICE());
				}
			}
		}
		auditAnnualData.setReceiveAudit(receiveAudit);
		
		//本月完成项目
		//本月的判断条件是“资料收到日期”为统计日期范围，完成的判断条件是
		auditAnnualData.setCompleteAuditCurrentMonth(completeAuditCurrentMonth);
		
		//历史完成项目
		//历史的判断条件是“资料收到日期”在本统计日期范围以前即小于3/29， 完成条件同上
		dateCondition = "(T.PLAN_DOC_RCV_DATE < '" + startDate+ "'";
		dateCondition += " or T.DOC_REC_DATE < '" + startDate + "')";
		switch(Integer.parseInt(CNTRCT_INFO)){
		case 1:
			//地铁审价以发出审定单时间作为完成节点
			//dateCondition = " T.APPROVAL_SND_DATE < '" + startDate + "'";
			break;
		case 2:
		case 4:
			//咨询及控制价以初稿日期作为完成节点
			dateCondition = " T.DRAFT_DATE < '" + startDate + "'";
			break;
		default:
			break;
		}
		List<AuditDto> list2 = auditDao.queryAuditMonthSumList(projectManager, CNTRCT_TYPE, dateCondition, CNTRCT_INFO);
		if(list2 != null) {
			for(AuditDto audit : list2) {
				//本月送审总金额
				if(audit.getVERIFY_PER_AMOUNT() != null && !CNTRCT_INFO.equals("4")) {
					if(calcCompleteAuditHisSJ(audit, start)) {
						//历史完成送审
						completeAuditHis++;
					}
				}
				if(audit.getCNT_PRICE() != null && audit.getCNT_PRICE().compareTo(BigDecimal.ZERO) > 0 && CNTRCT_INFO.equals("4")) {
					//历史完成送审
					completeAuditHis++;
				}
				//实收审价费根据乙方开票日期，该月开具的当月送审项目发票计入本月，该月开具的之前月送审项目的发票计入历史，一个项目开具的发票数计为一张
				if((audit.getB_INVOICE_DATE() != null && audit.getB_INVOICE_DATE().after(start) && audit.getB_INVOICE_DATE().before(end))){
					bAmountMonthHis = bAmountMonthHis.add(audit.getB_AMOUNT());
					bAmountNumMonthHis++;
				}
				//乙方发票号不为空
				if(StringUtil.isNotBlank(audit.getB_INVOICE_NO())) {
					//历史未收发票（张）
					//3/29以前（不含3/29）的审价项目的“乙方发票号”不为空但是“乙方到账日期”为空的件数，如果内容有；需要分割统计。
					if(audit.getB_SET_DATE() == null) {
						if(audit.getB_INVOICE_NO().indexOf(";") >= 0) {
							String[] ss = audit.getB_INVOICE_NO().split(";");
							for(String s : ss) {
								if(StringUtil.isNotBlank(s)) {
									unreceivedNumHis++;
								}
							}
						} else {
							unreceivedNumHis++;
						}
						
						//历史未收发票金额
						//3/29以前（不含3/29）的审价项目的“乙方发票号”不为空但是“乙方到账日期”为空的“乙方收费”金额。
						if(audit.getB_AMOUNT() != null) {
							unreceivedAmountHis = unreceivedAmountHis.add(audit.getB_AMOUNT());
						}
					}
				}
			}
			//历史未完成项目数=历史项目数-历史完成项目数
			incompleteAuditHis = list2.size() - completeAuditHis;
		}
		auditAnnualData.setCompleteAuditHis(completeAuditHis);
		
		//总金额本月送审（元）
		//本统计月的收到项目的"送审价"合计
		auditAnnualData.setSubmitAuditAmount(submitAuditAmount.setScale(6, BigDecimal.ROUND_HALF_UP));
		
		//总金额本月完成送审（元）
		//本统计月的完成审价项目的"送审价"合计
		auditAnnualData.setCompleteAuditAmount(completeAuditAmount.setScale(6, BigDecimal.ROUND_HALF_UP));
		
		//审定总额（元）
		//本统计月的完成审价项目的"审核价"合计
		auditAnnualData.setAuthorizeAuditAmount(authorizeAuditAmount.setScale(6, BigDecimal.ROUND_HALF_UP));
		
		//本月未完成项目（个）=本月收到项目-本月完成审价项目
		incompleteAuditCurrentMonth = receiveAudit - completeAuditCurrentMonth;
		auditAnnualData.setIncompleteAuditCurrentMonth(incompleteAuditCurrentMonth);
		
		//历史未完成项目
		//3/29以前（不含3/29）的未完成项目个数
		auditAnnualData.setIncompleteAuditHis(incompleteAuditHis);
		
		//本月总发票（张）
		//本统计月的审价项目的“乙方发票号”不为空的件数，如果内容有；需要分割统计。（不会每个都加；只会在多个中间加；）
		auditAnnualData.setTotalNumMonth(totalNumMonth);
		
		//本月总发票金额
		//本统计月的审价项目的“乙方发票号”不为空的“乙方收费”金额。
		auditAnnualData.setTotalAmountMonth(totalAmountMonth.setScale(6, BigDecimal.ROUND_HALF_UP));
		
		//本月未收发票（张）
		//本统计月的审价项目的“乙方发票号”不为空但是“乙方到账日期”为空的件数，如果内容有；需要分割统计。
		auditAnnualData.setUnreceivedNumMonth(unreceivedNumMonth);
		
		//本月未收发票金额
		//本统计月的审价项目的“乙方发票号”不为空但是“乙方到账日期”为空的“乙方收费”金额。
		auditAnnualData.setUnreceivedAmountMonth(unreceivedAmountMonth.setScale(6, BigDecimal.ROUND_HALF_UP));
		
		//历史未收发票（张）
		//3/29以前（不含3/29）的审价项目的“乙方发票号”不为空但是“乙方到账日期”为空的件数，如果内容有；需要分割统计。
		auditAnnualData.setUnreceivedNumHis(unreceivedNumHis);
		
		//历史未收发票金额
		//3/29以前（不含3/29）的审价项目的“乙方发票号”不为空但是“乙方到账日期”为空的“乙方收费”金额。
		auditAnnualData.setUnreceivedAmountHis(unreceivedAmountHis.setScale(6, BigDecimal.ROUND_HALF_UP));

		//审价费本月确认应收（万元）
		//本月应收指该月发出审定单的项目对应的乙方收费
		auditAnnualData.setAuditAmountMonthConfirm(bAmount.setScale(6, BigDecimal.ROUND_HALF_UP));
		
		//实收审价费根据乙方开票日期，该月开具的当月送审项目发票计入本月，该月开具的之前月送审项目的发票计入历史，一个项目开具的发票数计为一张
		//实收审价费本月发票（个）
		auditAnnualData.setReceiptAuditPieceMonth(bAmountNumMonth);
		//实收审价费本月（万元）
		auditAnnualData.setReceiptAuditAmountMonth(bAmountMonth.setScale(6, BigDecimal.ROUND_HALF_UP));
		//实收审价费历史发票（个）
		auditAnnualData.setReceiptAuditPieceHis(bAmountNumMonthHis);
		//实收审价费历史（万元）
		auditAnnualData.setReceiptAuditAmountHis(bAmountMonthHis.setScale(6, BigDecimal.ROUND_HALF_UP));
		return auditAnnualData;
	}
	
	/**
	 * 判断是否是完成审价
	 * @param audit
	 * @param start
	 * @param end
	 * @return
	 */
	private boolean calcCompleteAudit(AuditDto audit, Date start, Date end) {
		Date tmpdate = null;
		boolean isCompleteAudit = false;
		BigDecimal zero = new BigDecimal(0);
		
		//（如果“乙方收费”为0或空，“报告出具日期"不为空且在本统计日期范围内。）
		//或（如果"乙方收费"不为空也不为0，“乙方到账日期”也不为空，"报告出具日期"也不为空，取“乙方到账日期”和“报告出具日期”两者离现在近的那个判断是否落在本统计日期范围内）
		//乙方收费为0或空
		if(audit.getB_AMOUNT() == null || zero.setScale(6).equals(audit.getB_AMOUNT())) {
			//“报告出具日期"或"结算报告出具日期"不为空且在本统计日期范围内
			if((audit.getREPORT_RAISE_DATE() != null && audit.getREPORT_RAISE_DATE().after(start) && audit.getREPORT_RAISE_DATE().before(end)) ||
					(audit.getSET_DOC_RPT_DATE() != null && audit.getSET_DOC_RPT_DATE().after(start) && audit.getSET_DOC_RPT_DATE().before(end))){
				isCompleteAudit = true;
			}
		} else {
			//乙方收费不为空也不为0
			//“乙方到账日期”也不为空，"报告出具日期"也不为空
			if(audit.getB_SET_DATE() != null ){ 
				if (audit.getREPORT_RAISE_DATE() != null) {
					//取“乙方到账日期”和“报告出具日期”两者离现在近的那个判断是否落在本统计日期范围内
					tmpdate = (audit.getB_SET_DATE().after(audit.getREPORT_RAISE_DATE())) ? audit.getB_SET_DATE() : audit.getREPORT_RAISE_DATE();
					if(tmpdate.after(start) && tmpdate.before(end)) {
						isCompleteAudit = true;
					}
				}else{
					if (audit.getSET_DOC_RPT_DATE() != null) {
						//取“乙方到账日期”和“结算报告出具日期”两者离现在近的那个判断是否落在本统计日期范围内
						tmpdate = (audit.getB_SET_DATE().after(audit.getSET_DOC_RPT_DATE())) ? audit.getB_SET_DATE() : audit.getSET_DOC_RPT_DATE();
						if(tmpdate.after(start) && tmpdate.before(end)) {
							isCompleteAudit = true;
						}
					}					
				}
			}
		}
		return isCompleteAudit;
	}
	
	/**
	 * 判断历史是否是完成审价
	 * @param audit
	 * @param start
	 * @return
	 */
	private boolean calcCompleteAuditHis(AuditDto audit, Date start) {
		Date tmpdate = null;
		boolean isCompleteAudit = false;
		BigDecimal zero = new BigDecimal(0);
		
		//（如果“乙方收费”为0或空，“报告出具日期"不为空且在本统计日期范围内。）
		//或（如果"乙方收费"不为空也不为0，“乙方到账日期”也不为空，"报告出具日期"也不为空，取“乙方到账日期”和“报告出具日期”两者离现在近的那个判断是否落在本统计日期范围内）
		//乙方收费为0或空
		if(audit.getB_AMOUNT() == null || zero.setScale(6).equals(audit.getB_AMOUNT())) {
			//“报告出具日期"或"结算报告出具日期"不为空且在本统计日期范围内
			if((audit.getREPORT_RAISE_DATE() != null && audit.getREPORT_RAISE_DATE().before(start)) ||
					(audit.getSET_DOC_RPT_DATE() != null && audit.getSET_DOC_RPT_DATE().before(start))){
				isCompleteAudit = true;
			}
		} else {
			//乙方收费不为空也不为0
			//“乙方到账日期”也不为空，"报告出具日期"也不为空
			if(audit.getB_SET_DATE() != null ){ 
				if (audit.getREPORT_RAISE_DATE() != null) {
					//取“乙方到账日期”和“报告出具日期”两者离现在近的那个判断是否落在本统计日期范围内
					tmpdate = (audit.getB_SET_DATE().after(audit.getREPORT_RAISE_DATE())) ? audit.getB_SET_DATE() : audit.getREPORT_RAISE_DATE();
					if(tmpdate.before(start)) {
						isCompleteAudit = true;
					}
				}else{
					if (audit.getSET_DOC_RPT_DATE() != null) {
						//取“乙方到账日期”和“结算报告出具日期”两者离现在近的那个判断是否落在本统计日期范围内
						tmpdate = (audit.getB_SET_DATE().after(audit.getSET_DOC_RPT_DATE())) ? audit.getB_SET_DATE() : audit.getSET_DOC_RPT_DATE();
						if(tmpdate.before(start)) {
							isCompleteAudit = true;
						}
					}					
				}
			}
		}
		return isCompleteAudit;
	}
	
	/**
	 * 判断是否是完成审价(初稿时间)
	 * @param audit
	 * @param start
	 * @param end
	 * @return
	 */
	private boolean calcCompleteAuditSJ(AuditDto audit, Date start, Date end) {
		Date tmpdate = null;
		boolean isCompleteAudit = false;
		BigDecimal zero = new BigDecimal(0);
		
		//（如果“乙方收费”为0或空，“初稿时间"不为空且在本统计日期范围内。）
		//或（如果"乙方收费"不为空也不为0，“乙方到账日期”也不为空，"报告出具日期"也不为空，取“乙方到账日期”和“初稿时间”两者离现在近的那个判断是否落在本统计日期范围内）
		//乙方收费为0或空
		if(audit.getB_AMOUNT() == null || zero.setScale(6).equals(audit.getB_AMOUNT())) {
			//“初稿时间"不为空且在本统计日期范围内
			if((audit.getDRAFT_DATE() != null && audit.getDRAFT_DATE().after(start) && audit.getDRAFT_DATE().before(end))){
				isCompleteAudit = true;
			}
		} else {
			//乙方收费不为空也不为0
			//“乙方到账日期”也不为空，"初稿时间"也不为空
			if(audit.getB_SET_DATE() != null ){ 
				if (audit.getDRAFT_DATE() != null) {
					//取“乙方到账日期”和“初稿时间”两者离现在近的那个判断是否落在本统计日期范围内
					tmpdate = (audit.getB_SET_DATE().after(audit.getDRAFT_DATE())) ? audit.getB_SET_DATE() : audit.getDRAFT_DATE();
					if(tmpdate.after(start) && tmpdate.before(end)) {
						isCompleteAudit = true;
					}
				}
			}
		}
		return isCompleteAudit;
	}
	
	/**
	 * 判断历史是否是完成审价(初稿时间)
	 * @param audit
	 * @param start
	 * @return
	 */
	private boolean calcCompleteAuditHisSJ(AuditDto audit, Date start) {
		Date tmpdate = null;
		boolean isCompleteAudit = false;
		BigDecimal zero = new BigDecimal(0);
		
		//（如果“乙方收费”为0或空，“初稿时间"不为空且在本统计日期范围内。）
		//或（如果"乙方收费"不为空也不为0，“乙方到账日期”也不为空，"初稿时间"也不为空，取“乙方到账日期”和“初稿时间”两者离现在近的那个判断是否落在本统计日期范围内）
		//乙方收费为0或空
		if(audit.getB_AMOUNT() == null || zero.setScale(6).equals(audit.getB_AMOUNT())) {
			//“初稿时间"不为空且在本统计日期范围内
			if((audit.getDRAFT_DATE() != null && audit.getDRAFT_DATE().before(start)) ){
				isCompleteAudit = true;
			}
		} else {
			//乙方收费不为空也不为0
			//“乙方到账日期”也不为空，"初稿时间"也不为空
			if(audit.getB_SET_DATE() != null ){ 
				if (audit.getDRAFT_DATE() != null) {
					//取“乙方到账日期”和“初稿时间”两者离现在近的那个判断是否落在本统计日期范围内
					tmpdate = (audit.getB_SET_DATE().after(audit.getDRAFT_DATE())) ? audit.getB_SET_DATE() : audit.getDRAFT_DATE();
					if(tmpdate.before(start)) {
						isCompleteAudit = true;
					}
				}
			}
		}
		return isCompleteAudit;
	}

	@Override
	public AuditStatCostDto queryAuditStatCost(String projectManager, String startDate, String endDate) {
		return auditDao.queryAuditStatCost(projectManager, startDate, endDate);
	}

	@Override
	public AuditStatPaidDto queryAuditStatPaid(String projectManager, String startDate, String endDate) {
		return auditDao.queryAuditStatPaid(projectManager, startDate, endDate);
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
