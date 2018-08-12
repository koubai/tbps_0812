package com.cn.common.factory;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.BidDto;

/**
 * @name PoiBidTable.java
 * @author lql
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiBidTable extends Poi2007Base {
	
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	@SuppressWarnings("deprecation")
	@Override
	public void writeData(Workbook workbook) {
		BidDto bidDto = (BidDto) datas.get(0);
		Sheet sheet = workbook.getSheetAt(0);
		//项目编号
		Row row = sheet.getRow((short) 2);
		Cell cell = row.getCell((short) 2);
		cell.setCellValue(bidDto.getBID_NO());
		//项目名称
		row = sheet.getRow((short) 3);
		cell = row.getCell((short) 2);
		cell.setCellValue(bidDto.getPROJECT_NAME());
		//委托单位
		row = sheet.getRow((short) 4);
		cell = row.getCell((short) 2);
//		if(StringUtil.isNotBlank(bidDto.getAGENT_CO_NAME())){
//			cell.setCellValue(bidDto.getAGENT_CO_NAME());
//		}
//		//委托人
//		cell = row.getCell((short) 4);
//		if(StringUtil.isNotBlank(bidDto.getAGENT_CO_MANAGER())){
//			cell.setCellValue(bidDto.getAGENT_CO_MANAGER());
//		}
//		//委托人电话
//		cell = row.getCell((short) 6);
//		if(StringUtil.isNotBlank(bidDto.getAGENT_CO_MANAGER_TEL())){
//			cell.setCellValue(bidDto.getAGENT_CO_MANAGER_TEL());
//		}
	}
	
	public static void main(String arg[]) {
	}
}
