package com.cn.common.factory;

import java.math.BigDecimal;
import java.util.Calendar;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.cn.common.util.DateUtil;
import com.cn.tbps.dto.AuditDto;

public class PoiAuditMetro extends Poi2007Base {
	
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	@Override
	public void writeData(Workbook workbook) {
		AuditDto auditDto = (AuditDto) datas.get(0);
		Sheet sheet = workbook.getSheetAt(0);
		//项目名称
		Row row = sheet.getRow((short) 3);
		Cell cell = row.getCell((short) 3);
		String projectName = "";
		if(null != auditDto.getPROJECT_NAME()) {
			projectName = auditDto.getPROJECT_NAME();
		}
		cell.setCellValue(projectName);
		//报告文号
		row = sheet.getRow((short) 3);
		cell = row.getCell((short) 14);
		String reportNo = "";
		if(null != auditDto.getREPORT_NO()) {
			reportNo = auditDto.getREPORT_NO();
		}
		cell.setCellValue(reportNo);
		//委托单位
		row = sheet.getRow((short) 4);
		cell = row.getCell((short) 3);
		String agentCoName ="";
		if(null != auditDto.getAGENT_CO_NAME()) {
			agentCoName = auditDto.getAGENT_CO_NAME();
		}
		cell.setCellValue(agentCoName);
		//承揽单位
		row = sheet.getRow((short) 4);
		cell = row.getCell((short) 14);
		String contractCoName = "";
		if(null != auditDto.getCONTRACT_CO_NAME()) {
			contractCoName = auditDto.getCONTRACT_CO_NAME();
		}
		cell.setCellValue(contractCoName);
		//当前时间
		row = sheet.getRow((short) 5);
		cell = row.getCell((short) 14);
		Calendar c = Calendar.getInstance();
		cell.setCellValue(DateUtil.dateToShortStr(c.getTime()));
		//送审价
		row = sheet.getRow((short) 6);
		cell = row.getCell((short) 3);
		String ssj = "";
		if(null != auditDto.getVERIFY_PER_AMOUNT()) {
			BigDecimal bignum = auditDto.getVERIFY_PER_AMOUNT().multiply(new BigDecimal("10000")).setScale(2,BigDecimal.ROUND_HALF_UP); 
			ssj = bignum.toString();
		}
		cell.setCellValue(ssj);
		//审核价
		row = sheet.getRow((short) 6);
		cell = row.getCell((short) 14);
		String shj = "";
		if(null != auditDto.getVERIFY_AMOUNT()) {
			BigDecimal bignum = auditDto.getVERIFY_AMOUNT().multiply(new BigDecimal("10000")).setScale(2,BigDecimal.ROUND_HALF_UP); 
			shj = bignum.toString();
		}
		cell.setCellValue(shj);
		//净核减额
		row = sheet.getRow((short) 7);
		cell = row.getCell((short) 17);
		String jhje = "";
		if(null != auditDto.getVERIFY_DIFF()) {
			BigDecimal bignum = auditDto.getVERIFY_DIFF().multiply(new BigDecimal("10000")).setScale(2,BigDecimal.ROUND_HALF_UP); 
			jhje = bignum.toString();
		}
		cell.setCellValue(jhje);
	}
	
	public static void main(String[] args) {
	}
}
