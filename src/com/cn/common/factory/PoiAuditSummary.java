package com.cn.common.factory;

import java.util.Calendar;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.cn.common.util.DateUtil;
import com.cn.tbps.dto.AuditDto;

public class PoiAuditSummary extends Poi2007Base {
	
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
	
	public static void main(String[] args) {
	}
}
