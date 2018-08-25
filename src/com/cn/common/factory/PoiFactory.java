package com.cn.common.factory;

import com.cn.common.util.Constants;

/**
 * @name PoiFactory.java
 * @author Frank
 * @time 2013-10-9下午8:34:00
 * @version 1.0
 */
public class PoiFactory {

	/**
	 * @param type
	 * @return
	 */
	public static Poi2007Base getPoi(String type) {
		if(Constants.EXCEL_TYPE_WTGSYL.equals(type)) {
			//委托公司一览
			return new PoiAgentComp();
		} else if(Constants.EXCEL_TYPE_ZBYL.equals(type)) {
			//招标一览
			return new PoiBid();
		} else if(Constants.EXCEL_TYPE_ZBYL_AD01.equals(type)) {
			//招标项目清单检索
			return new PoiBidAd01();
		} else if(Constants.EXCEL_TYPE_ZBLLYL.equals(type)) {
			//招标履历一览
			return new PoiBidHist();
		}  else if(Constants.EXCEL_TYPE_SJYL.equals(type)) {
			//审价一览
			return new PoiAudit();
		} else if(Constants.EXCEL_TYPE_SJLLYL.equals(type)) {
			//审价履历一览
			return new PoiAuditHist();
		} else if(Constants.EXCEL_TYPE_RECEIPT_SJYL.equals(type)) {
			//招标发票信息一览
			return new PoiAuditReceipt();
		} else if(Constants.EXCEL_TYPE_ZJXXYL.equals(type)) {
			//专家信息一览
			return new PoiExpertLib();
		} else if(Constants.EXCEL_TYPE_ZJXXDC.equals(type)) {
			//专家信息导出（招标页面）
			return new PoiBidExpert();
		} else if(Constants.EXCEL_TYPE_ALL_ZBYL.equals(type)) {
			//招标完整信息一览
			return new PoiBidAll();
		} else if(Constants.EXCEL_TYPE_RECEIPT_ZBYL.equals(type)) {
			//招标发票信息一览
			return new PoiBidReceipt();
		} else if(Constants.EXCEL_TYPE_SJLZ.equals(type)) {
			//审价流转表
			return new PoiAuditTable();
		} else if(Constants.EXCEL_TYPE_ZBLZ.equals(type)) {
			//招标流转表
			return new PoiBidTable();
		} else if(Constants.EXCEL_TYPE_ZBBM.equals(type)) {
			//招标报名表
			return new PoiBidRegister();
		} else if(Constants.EXCEL_TYPE_ZBSBM.equals(type)) {
			//单个投标公司报名表
			return new PoiSingleBidCompRegister();
		} else if(Constants.EXCEL_TYPE_ZBHZ.equals(type)) {
			//招标报名表回执
			return new PoiBidReply();
		} else if(Constants.EXCEL_TYPE_ZBSD.equals(type)) {
			//招标签收单
			return new PoiBidReceive();
		} else if(Constants.EXCEL_TYPE_ZBSH.equals(type)) {
			//招标审核表
			return new PoiBidAudit();
		} else if(Constants.EXCEL_TYPE_ZBBZJ.equals(type)) {
			//招标保证金收据
			return new PoiBidDeposit();
		} else if(Constants.EXCEL_TYPE_ZBTD.equals(type)) {
			//招标保证金签收
			return new PoiBidCancel();
		} else if(Constants.EXCEL_TYPE_ZBQS.equals(type)) {
			//招标中标签收
			return new PoiBidSign();
		} else if(Constants.EXCEL_TYPE_BZJHZ.equals(type)) {
			//保证金汇总表
			return new PoiBond();
		} else if(Constants.EXCEL_TYPE_BZJHZ_AD01.equals(type)) {
			//保证金汇总表
			return new PoiBondAd01();
		}else if(Constants.EXCEL_TYPE_BZJMX.equals(type)) {
			//保证金汇总详细表
			return new PoiBondDetail();
		}else if(Constants.EXCEL_TYPE_ZBBS.equals(type)) {
			//保证金汇总详细表
			return new PoiBidBase();
		}else if(Constants.EXCEL_TYPE_SIGN.equals(type)) {
			//审计签署页
			return new PoiAuditSign();
		}else if(Constants.EXCEL_TYPE_HSJY.equals(type)) {
			//审计会商纪要
			return new PoiAuditSummary();
		}else if(Constants.EXCEL_TYPE_COVER.equals(type)) {
			//审计封面
			return new PoiAuditCover();
		}else if(Constants.EXCEL_TYPE_SJDJ.equals(type)) {
			//审计资料登记表
			return new PoiAuditRegister();
		}else if(Constants.EXCEL_TYPE_SJSDD.equals(type)) {
			//审计审定单（地铁）
			return new PoiAuditMetro();
		}else if(Constants.EXCEL_TYPE_SJSDD2.equals(type)) {
			//审计审定单（非地铁）
			return new PoiAuditNoMetro();
		}else if(Constants.DOC_TYPE_REPORT.equals(type)) {
			//审计报告
			return new PoiAuditReport();
		}
		return null;
	}
}
