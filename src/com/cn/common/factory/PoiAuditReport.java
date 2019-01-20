package com.cn.common.factory;

import java.math.BigDecimal;
import java.util.Calendar;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;

import com.cn.common.util.DateUtil;
import com.cn.tbps.dto.AuditDto;

public class PoiAuditReport extends Poi2007Base {
	
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	@Override
	public void writeData(HWPFDocument doc) {
		AuditDto auditDto = (AuditDto) datas.get(0);
		Range range = doc.getRange();
		//项目名称
		String projectName = "";
		if(null != auditDto.getPROJECT_NAME()) {
			projectName = auditDto.getPROJECT_NAME();
		}
		range.replaceText("（项目属性内的项目名称）", projectName);
		range.replaceText("(项目属性内的项目名称)", projectName);
		//报告文号
		String reportNo = "";
		if(null != auditDto.getREPORT_NO()) {
			reportNo = auditDto.getREPORT_NO();
		}
		range.replaceText("（项目属性内的项目文号）", reportNo);
		//委托单位
		String agentCoName = "";
		if(null != auditDto.getAGENT_CO_NAME()) {
			agentCoName = auditDto.getAGENT_CO_NAME();
		}
		range.replaceText("（合同属性内的委托单位）", agentCoName);
		//承揽单位
		String contractCoName = "";
		if(null != auditDto.getCONTRACT_CO_NAME()) {
			contractCoName = auditDto.getCONTRACT_CO_NAME();
		}
		range.replaceText("（项目属性内的承揽单位）", contractCoName);
		//当前时间
		Calendar c = Calendar.getInstance();
		range.replaceText("（生成日期）", DateUtil.dateToShortStr(c.getTime()));
		//送审价
		String ssj = "";
		if(null != auditDto.getVERIFY_PER_AMOUNT()) {
			BigDecimal bignum = auditDto.getVERIFY_PER_AMOUNT().multiply(new BigDecimal("10000")).setScale(2,BigDecimal.ROUND_HALF_UP); 
			ssj = bignum.toString();
		}
		range.replaceText("（项目属性内的送审价）", ssj);
		//审核价
		String shj = "";
		if(null != auditDto.getVERIFY_AMOUNT()) {
			BigDecimal bignum = auditDto.getVERIFY_AMOUNT().multiply(new BigDecimal("10000")).setScale(2,BigDecimal.ROUND_HALF_UP); 
			shj = bignum.toString();
		}
		range.replaceText("（项目属性内的审核价）", shj);
		//净核减额
		String jhje = "";
		if(null != auditDto.getVERIFY_DIFF()) {
			BigDecimal bignum = auditDto.getVERIFY_DIFF().multiply(new BigDecimal("10000")).setScale(2,BigDecimal.ROUND_HALF_UP); 
			jhje = bignum.toString();
		}
		range.replaceText("（项目属性内的净核减额）", jhje);
	}
	
	public static void main(String[] args) {
	}
}
