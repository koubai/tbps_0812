package com.cn.common.factory;

import java.text.SimpleDateFormat;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.AuditDto;

/**
 * @name PoiAuditTable.java
 * @author lql
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiAuditTable extends Poi2007Base {
	
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	@SuppressWarnings("deprecation")
	@Override
	public void writeData(Workbook workbook) {
		AuditDto audioDto = (AuditDto) datas.get(0);
		Sheet sheet = workbook.getSheetAt(0);
		//项目编号
		Row row = sheet.getRow((short) 1);
		Cell cell = row.getCell((short) 2);
//		cell.setCellValue(audioDto.getAUDIT_NO());
		cell.setCellValue(audioDto.getREPORT_NO());
		//项目名称
		row = sheet.getRow((short) 2);
		cell = row.getCell((short) 2);
		cell.setCellValue(audioDto.getPROJECT_NAME());
		//委托单位
		row = sheet.getRow((short) 3);
		cell = row.getCell((short) 2);
		if(StringUtil.isNotBlank(audioDto.getAGENT_CO_NAME())){
			cell.setCellValue(audioDto.getAGENT_CO_NAME());
		}
		//委托人
		cell = row.getCell((short) 4);
		if(StringUtil.isNotBlank(audioDto.getAGENT_CO_MANAGER())){
			cell.setCellValue(audioDto.getAGENT_CO_MANAGER());
		}
		//委托人电话
		cell = row.getCell((short) 6);
		if(StringUtil.isNotBlank(audioDto.getAGENT_CO_MANAGER_TEL())){
			cell.setCellValue(audioDto.getAGENT_CO_MANAGER_TEL());
		}
		//委托项目负责人
		row = sheet.getRow((short) 4);
		cell = row.getCell((short) 2);
		if(StringUtil.isNotBlank(audioDto.getAGENT_CO_STAFF())){
			cell.setCellValue(audioDto.getAGENT_CO_STAFF());
		}
		//电话
		cell = row.getCell((short) 4);
		if(StringUtil.isNotBlank(audioDto.getAGENT_CO_STAFF_TEL())){
			cell.setCellValue(audioDto.getAGENT_CO_STAFF_TEL());
		}
		//施工单位名称
		row = sheet.getRow((short) 5);
		cell = row.getCell((short) 2);
		if(StringUtil.isNotBlank(audioDto.getCONTRACT_CO_NAME())){
			cell.setCellValue(audioDto.getCONTRACT_CO_NAME());
		}
		//项目负责人
		cell = row.getCell((short) 4);
		if(StringUtil.isNotBlank(audioDto.getCONTRACT_CO_STAFF())){
			cell.setCellValue(audioDto.getCONTRACT_CO_STAFF());
		}
		//电话
		cell = row.getCell((short) 6);
		if(StringUtil.isNotBlank(audioDto.getCONTRACT_CO_STAFF_TEL())){
			cell.setCellValue(audioDto.getCONTRACT_CO_STAFF_TEL());
		}
		//送审金额
		row = sheet.getRow((short) 6);
		cell = row.getCell((short) 2);
		if(StringUtil.isNotBlank(audioDto.getVERIFY_PER_AMOUNT().toString())){
			cell.setCellValue(audioDto.getVERIFY_PER_AMOUNT().toString());
		}
		//送审日期
//		cell = row.getCell((short) 4);
//		System.out.println("audioDto.getVERIFY_DOC_SEND_DATE():" + audioDto.getVERIFY_DOC_SEND_DATE());
//		if(audioDto.getVERIFY_DOC_SEND_DATE() != null){
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
//			String verify_doc_send_date = sdf.format(audioDto.getVERIFY_DOC_SEND_DATE());
//			cell.setCellValue(verify_doc_send_date);
//		}
	}
	
	public static void main(String arg[]) {
	}
}
