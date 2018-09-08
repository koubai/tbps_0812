package com.cn.common.factory;

import java.util.Calendar;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.cn.common.util.DateUtil;
import com.cn.tbps.dto.AuditDto;

public class PoiAuditSign extends Poi2007Base {
	
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	@Override
	public void writeData(Workbook workbook) {
		AuditDto auditDto = (AuditDto) datas.get(0);
		Sheet sheet = workbook.getSheetAt(0);
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
