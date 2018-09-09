package com.cn.common.factory;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.cn.tbps.dto.AuditDto;

public class PoiAuditRegister extends Poi2007Base {
	
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	@Override
	public void writeData(Workbook workbook) {
		AuditDto auditDto = (AuditDto) datas.get(0);
		Sheet sheet = workbook.getSheetAt(0);
		//项目名称
		Row row = sheet.getRow((short) 2);
		Cell cell = row.getCell((short) 2);
		String projectName = "";
		if(null != auditDto.getPROJECT_NAME()) {
			projectName = auditDto.getPROJECT_NAME();
		}
		cell.setCellValue(projectName);
	}
	
	public static void main(String[] args) {
	}
}
