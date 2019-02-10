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
		//审定单
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
		//核减金额
		row = sheet.getRow((short) 7);
		cell = row.getCell((short) 3);
		String hje = "";
		if(null != auditDto.getVERIFY_DECREASE()) {
			BigDecimal bignum = auditDto.getVERIFY_DECREASE().multiply(new BigDecimal("10000")).setScale(2,BigDecimal.ROUND_HALF_UP); 
			hje = bignum.toString();
		}
		cell.setCellValue(hje);
		//核增金额
		row = sheet.getRow((short) 7);
		cell = row.getCell((short) 10);
		String hze = "";
		if(null != auditDto.getVERIFY_INCREASE()) {
			BigDecimal bignum = auditDto.getVERIFY_INCREASE().multiply(new BigDecimal("10000")).setScale(2,BigDecimal.ROUND_HALF_UP); 
			hze = bignum.toString();
		}
		cell.setCellValue(hze);

		//净核减额
		row = sheet.getRow((short) 7);
		cell = row.getCell((short) 17);
		String jhje = "";
		if(null != auditDto.getVERIFY_DIFF()) {
			BigDecimal bignum = auditDto.getVERIFY_DIFF().multiply(new BigDecimal("10000")).setScale(2,BigDecimal.ROUND_HALF_UP); 
			jhje = bignum.toString();
		}
		cell.setCellValue(jhje);
		//审计资料登记表
		Sheet sheet1 = workbook.getSheetAt(1);
		writeSheet1(sheet1);
		//会商纪要
		Sheet sheet2 = workbook.getSheetAt(2);
		writeSheet2(sheet2);
		//封面
		Sheet sheet3 = workbook.getSheetAt(3);
		writeSheet3(sheet3);
		//签署页
		Sheet sheet4 = workbook.getSheetAt(4);
		writeSheet4(sheet4);
	}
	
	public void writeSheet1(Sheet sheet) {
		//审计资料登记表
		AuditDto auditDto = (AuditDto) datas.get(0);
		//项目名称
		Row row = sheet.getRow((short) 2);
		Cell cell = row.getCell((short) 2);
		String projectName = "";
		if(null != auditDto.getPROJECT_NAME()) {
			projectName = auditDto.getPROJECT_NAME();
		}
		cell.setCellValue(projectName);
	}
	
	public void writeSheet2(Sheet sheet) {
		//会商纪要
		AuditDto auditDto = (AuditDto) datas.get(0);
		//项目名称
		Row row = sheet.getRow((short) 3);
		Cell cell = row.getCell((short) 1);
		StringBuffer projectName = new StringBuffer("");
		if(null != auditDto.getPROJECT_NAME()) {
			projectName.append(auditDto.getPROJECT_NAME());
		}
		projectName.append("会议");	
		cell.setCellValue(projectName.toString());
		//当前时间
		row = sheet.getRow((short) 5);
		cell = row.getCell((short) 1);
		Calendar c = Calendar.getInstance();
		cell.setCellValue(DateUtil.dateToShortStr(c.getTime()));
		//委托单位
		row = sheet.getRow((short) 28);
		cell = row.getCell((short) 1);
		String agentCoName ="";
		if(null != auditDto.getAGENT_CO_NAME()) {
			agentCoName = auditDto.getAGENT_CO_NAME();
		}
		cell.setCellValue(agentCoName);
		//承揽单位
		row = sheet.getRow((short) 30);
		cell = row.getCell((short) 1);
		String contractCoName = "";
		if(null != auditDto.getCONTRACT_CO_NAME()) {
			contractCoName = auditDto.getCONTRACT_CO_NAME();
		}
		cell.setCellValue(contractCoName);
	}
	
	public void writeSheet3(Sheet sheet) {
		//封面
		AuditDto auditDto = (AuditDto) datas.get(0);
		//项目名称
		Row row = sheet.getRow((short) 2);
		Cell cell = row.getCell((short) 1);
		String projectName = "";
		if(null != auditDto.getPROJECT_NAME()) {
			projectName = auditDto.getPROJECT_NAME();
		}
		cell.setCellValue(projectName);
		//报告文号
		row = sheet.getRow((short) 6);
		cell = row.getCell((short) 3);
		String reportNo = "";
		if(null != auditDto.getREPORT_NO()) {
			reportNo = auditDto.getREPORT_NO();
		}
		cell.setCellValue(reportNo);
		//当前时间
		row = sheet.getRow((short) 7);
		cell = row.getCell((short) 3);
		Calendar c = Calendar.getInstance();
		cell.setCellValue(DateUtil.dateToShortStr(c.getTime()));
	}
	
	public void writeSheet4(Sheet sheet) {
		//签署页
		AuditDto auditDto = (AuditDto) datas.get(0);
		//项目名称
		Row row = sheet.getRow((short) 1);
		Cell cell = row.getCell((short) 1);
		StringBuffer projectName = new StringBuffer("");
		if(null != auditDto.getPROJECT_NAME()) {
			projectName.append(auditDto.getPROJECT_NAME());
		}
		projectName.append("结算审价报告");	
		cell.setCellValue(projectName.toString());
		//报告文号
		row = sheet.getRow((short) 3);
		cell = row.getCell((short) 2);
		String reportNo = "";
		if(null != auditDto.getREPORT_NO()) {
			reportNo = auditDto.getREPORT_NO();
		}
		cell.setCellValue(reportNo);
		//当前时间
		row = sheet.getRow((short) 4);
		cell = row.getCell((short) 2);
		Calendar c = Calendar.getInstance();
		cell.setCellValue(DateUtil.dateToShortStr(c.getTime()));
	}
	
	public static void main(String[] args) {
	}
}
