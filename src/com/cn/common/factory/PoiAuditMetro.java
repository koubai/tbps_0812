package com.cn.common.factory;

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
		Cell cell = row.getCell((short) 1);
		StringBuffer projectName = new StringBuffer("（");
		projectName.append(auditDto.getPROJECT_NAME());
		projectName.append("）会议");	
		cell.setCellValue(projectName.toString());
		//报告文号
		row = sheet.getRow((short) 3);
		cell = row.getCell((short) 3);
		StringBuffer reportNo = new StringBuffer("（");
		reportNo.append(auditDto.getREPORT_NO());
		reportNo.append("）");
		cell.setCellValue(reportNo.toString());
		//委托单位
		row = sheet.getRow((short) 4);
		cell = row.getCell((short) 1);
		StringBuffer agentCoName = new StringBuffer("（");
		agentCoName.append(auditDto.getAGENT_CO_NAME());
		agentCoName.append("）");
		cell.setCellValue(agentCoName.toString());
		//承揽单位
		row = sheet.getRow((short) 4);
		cell = row.getCell((short) 3);
		StringBuffer contractCoName = new StringBuffer("（");
		contractCoName.append(auditDto.getCONTRACT_CO_NAME());
		contractCoName.append("）");
		cell.setCellValue(contractCoName.toString());
		//当前时间
		row = sheet.getRow((short) 5);
		cell = row.getCell((short) 3);
		Calendar c = Calendar.getInstance();
		cell.setCellValue(DateUtil.dateToShortStr(c.getTime()));
		//送审价
		row = sheet.getRow((short) 5);
		cell = row.getCell((short) 1);
		StringBuffer ssj = new StringBuffer("（");
		ssj.append(auditDto.getVERIFY_PER_AMOUNT());
		ssj.append("）");
		cell.setCellValue(ssj.toString());
		//审核价
		row = sheet.getRow((short) 5);
		cell = row.getCell((short) 3);
		StringBuffer shj = new StringBuffer("（");
		shj.append(auditDto.getVERIFY_AMOUNT());
		shj.append("）");
		cell.setCellValue(shj.toString());
		//净核减额
		row = sheet.getRow((short) 7);
		cell = row.getCell((short) 8);
		StringBuffer jhje = new StringBuffer("（");
		jhje.append(auditDto.getVERIFY_DIFF());
		jhje.append("）");
		cell.setCellValue(jhje.toString());
	}
	
	public static void main(String[] args) {
	}
}
