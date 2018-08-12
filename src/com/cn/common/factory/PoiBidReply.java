package com.cn.common.factory;


import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.cn.tbps.dto.BidDto;

/**
 * @name PoiBidReply.java
 * @author lql
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiBidReply extends Poi2007Base {
	
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
		Row row = sheet.getRow((short) 1);
		Cell cell = row.getCell((short) 0);
		String bidNo = bidDto.getBID_NO();
		String bidNoOld = String.valueOf(cell.getStringCellValue());
		int startNo = bidNoOld.indexOf("：");
		int endNo = bidNoOld.indexOf("）");
//		String replaceNo = bidNoOld.substring(startNo + 1, startNo + 1 + bidNo.length());
//		String bidNoNew = bidNoOld.replace(replaceNo, bidNo);
		String bidNoNew = bidNoOld.substring(0, startNo + 3)+ bidNo + bidNoOld.substring(endNo-1, bidNoOld.length());
		//项目编号加下划线
		HSSFCellStyle style = (HSSFCellStyle ) cell.getCellStyle();
		Font fontOld = style.getFont(workbook);
		Font font = workbook.createFont();
		font.setUnderline(Font.U_SINGLE); //下划线
		copyFont(fontOld, font);
		HSSFRichTextString  richString = new HSSFRichTextString (bidNoNew);
		richString.applyFont(startNo+1, startNo+3+bidNo.length(), font);
		cell.setCellValue(richString);
		
		
		//项目名称
		row = sheet.getRow((short) 1);
		cell = row.getCell((short) 0);
		String projectName = bidDto.getPROJECT_NAME();
		if (projectName.endsWith("项目"))
			projectName = projectName.substring(0, projectName.length() - 2);
		String projectNameOld = String.valueOf(cell.getStringCellValue());
		int startPro = projectNameOld.indexOf("于");
		int endPro = projectNameOld.indexOf("项");
//		String replacePro = projectNameOld.substring(startPro + 1, startPro + 1 + projectName.length());
//		String projectNameNew = projectNameOld.replaceFirst(replacePro, projectName);
		String projectNameNew = projectNameOld.substring(0, startPro + 1)+" " + projectName + " " +projectNameOld.substring(endPro);
		//项目名称加下划线
		style = (HSSFCellStyle ) cell.getCellStyle();
		fontOld = style.getFont(workbook);
		font = workbook.createFont();
		font.setUnderline(Font.U_SINGLE); //下划线
		copyFont(fontOld, font);
		richString = null;
		richString = new HSSFRichTextString (projectNameNew);
		richString.applyFont(startPro+1, startPro+3+projectName.length(), font);
		cell.setCellValue(richString);
		
		int prjnamelen=projectNameNew.length();
		int prjnamerow = 1;
		int rowStrlen = 40;
		int ROWHEIGHT = 28;
		if ((prjnamelen - (prjnamelen/rowStrlen)*rowStrlen)>0){
			prjnamerow = prjnamelen / rowStrlen + 1;
		}else{
			prjnamerow = prjnamelen / rowStrlen;			
		}
		row = sheet.getRow((short) 1);
		row.setHeightInPoints(prjnamerow * ROWHEIGHT);  		
		
		//日期
		row = sheet.getRow((short) 4);
		cell = row.getCell((short) 0);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日"); 
		String datastring = dateFormat.format(new Date());
		cell.setCellValue(datastring);
	}
	
	public static void copyFont(Font fontOld, Font fontNew){
		fontNew.setBoldweight(fontOld.getBoldweight());
		fontNew.setColor(fontOld.getColor());
		fontNew.setFontHeight(fontOld.getFontHeight());
		fontNew.setFontHeightInPoints(fontOld.getFontHeightInPoints());
		fontNew.setFontName(fontOld.getFontName());
	}
	public static void main(String arg[]) {
	}
}
