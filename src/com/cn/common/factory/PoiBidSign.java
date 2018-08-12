package com.cn.common.factory;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.BidDto;

/**
 * @name PoiBidSign.java
 * @author lql
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiBidSign extends Poi2007Base {
	
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	@SuppressWarnings("deprecation")
	@Override
	public void writeData(Workbook workbook) {
		BidDto bidDto = (BidDto) datas.get(0);
		Sheet sheet = workbook.getSheetAt(0);
		//项目名称
		Row row = sheet.getRow((short) 2);
		Cell cell = row.getCell((short) 0);
		String projectName = bidDto.getPROJECT_NAME();
		if (projectName.endsWith("项目"))
			projectName = projectName.substring(0, projectName.length() - 2);
		String projectNameOld = String.valueOf(cell.getStringCellValue());
//		String replasePro = projectNameOld.substring(0, projectName.length());
//		String projectNameNew = projectNameOld.replaceFirst(replasePro, projectName);
		int endPro = projectNameOld.indexOf("项");
		String projectNameNew = " " + projectName + " " +projectNameOld.substring(endPro);		
		cell.setCellValue(projectNameNew);
		//项目编号
		row = sheet.getRow((short) 3);
		cell = row.getCell((short) 0);
		String bidNo = bidDto.getBID_NO();
		String bidNoOld = String.valueOf(cell.getStringCellValue());
		int startNo = bidNoOld.indexOf("：");
		String replaseNo = bidNoOld.substring(startNo+1, startNo+1+bidNo.length());
		String bidNoNew = bidNoOld.replaceFirst(replaseNo, bidNo);
		cell.setCellValue(bidNoNew);
	}
	
	public static void main(String arg[]) {
	}
}
