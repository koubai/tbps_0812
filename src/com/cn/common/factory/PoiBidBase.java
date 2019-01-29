package com.cn.common.factory;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.BidCompDto;
import com.cn.tbps.dto.BidDto;

/**
 * @name PoiBidDeposit.java
 * @author lql
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiBidBase extends Poi2007Base {
	
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public void writeData(Workbook workbook) {
		BidDto bidDto = (BidDto) datas.get(0);
		String bidNo = bidDto.getBID_NO();
		String projectName = bidDto.getPROJECT_NAME();
		List<BidCompDto> bidCoList = (List<BidCompDto>) datas.get(1);
		if(bidCoList != null && bidCoList.size() > 1){
			for(int i=0; i<bidCoList.size()-1; i++){
				workbook.cloneSheet(0);
			}
		}
		
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(currentTime);

		int i = 0;
		for(BidCompDto bidComp : bidCoList) {
			Sheet sheet = workbook.getSheetAt(i);
			//公司名称
			Row row = sheet.getRow((short) 2);
			Cell cell = row.getCell((short) 0);
			String compName = bidComp.getBID_CO_NAME();
			String compNameOld = String.valueOf(cell.getStringCellValue());
			int startCompName = compNameOld.indexOf("到");
			int endCompName = compNameOld.indexOf("(");
			StringBuffer compNameNew = new StringBuffer(compNameOld);
			compNameNew = compNameNew.replace(startCompName + 1, startCompName + 1 +compName.length(), compName);
			//加下划线
			HSSFCellStyle style = (HSSFCellStyle ) cell.getCellStyle();
			Font fontOld = style.getFont(workbook);
			Font font = workbook.createFont();
			font.setUnderline(Font.U_SINGLE); //下划线
			PoiBidReply.copyFont(fontOld, font);
			HSSFRichTextString richStringComp = null;
			richStringComp = new HSSFRichTextString (compNameNew.toString());
			richStringComp.applyFont(startCompName + 1, endCompName, font);
			cell.setCellValue(richStringComp);
			
			//项目名称
			row = sheet.getRow((short) 3);
			cell = row.getCell((short) 0);
			String projectNameOld = String.valueOf(cell.getStringCellValue());
//			String replacePro = projectNameOld.substring(2, 2 + projectName.length());
//			String projectNameNew = projectNameOld.replaceFirst(replacePro, projectName);
			int startPro = projectNameOld.indexOf("于");
			int endPro = projectNameOld.indexOf("（");
			String projectNameNew = projectNameOld.substring(0, startPro+1)+" " + projectName + " " +projectNameOld.substring(endPro);
			//加下划线
			style = (HSSFCellStyle ) cell.getCellStyle();
			fontOld = style.getFont(workbook);
			font = workbook.createFont();
			font.setUnderline(Font.U_SINGLE); //下划线
			PoiBidReply.copyFont(fontOld, font);
			HSSFRichTextString richStringPro = null;
			richStringPro = new HSSFRichTextString (projectNameNew);
			richStringPro.applyFont(2, richStringPro.length(), font);
			cell.setCellValue(richStringPro);
			
			//项目编号、标书费
			row = sheet.getRow((short) 4);
			cell = row.getCell((short) 0);
			String bidNoOld = String.valueOf(cell.getStringCellValue());
			int startNo = bidNoOld.indexOf("：");
			int endNo = bidNoOld.indexOf("）");

			String bond = "";
			if (bidComp.getBID_APPLY_PRICE() == null)
				bond = "";
			else
//				bond = bidComp.getBID_APPLY_PRICE().divide(new BigDecimal("10000"),6,BigDecimal.ROUND_HALF_UP).toString();
				bond = bidComp.getBID_APPLY_PRICE().divide(new BigDecimal("1"),6,BigDecimal.ROUND_HALF_UP).toString();
			int startBond = bidNoOld.indexOf("币");
			int endBond = bidNoOld.indexOf("万");

			StringBuffer bidNoNew = new StringBuffer(bidNoOld);
			bidNoNew = bidNoNew.replace(startNo + 1, startNo + 1 + bidNo.length(), bidNo);
			bidNoNew = bidNoNew.replace(startBond + 1, endBond, bond);
			//加下划线
			style = (HSSFCellStyle ) cell.getCellStyle();
			fontOld = style.getFont(workbook);
			font = workbook.createFont();
			font.setUnderline(Font.U_SINGLE); //下划线
			PoiBidReply.copyFont(fontOld, font);
			HSSFRichTextString richStringNo = null;
			richStringNo = new HSSFRichTextString (bidNoNew.toString());
			int endBondNew = richStringNo.toString().indexOf("万");
			richStringNo.applyFont(startNo + 1, endNo, font);
			richStringNo.applyFont(startBond + 1, endBondNew, font);
			cell.setCellValue(richStringNo);
			
			//日期
			row = sheet.getRow((short) 7);
			cell = row.getCell((short) 0);
			cell.setCellValue("日期： " + dateString);

			//第二联
			//公司名称
			row = sheet.getRow((short) 11);
			cell = row.getCell((short) 0);
			cell.setCellValue(richStringComp);
			
			//项目名称
			row = sheet.getRow((short) 12);
			cell = row.getCell((short) 0);
			cell.setCellValue(richStringPro);
			
			//项目编号、标书费
			row = sheet.getRow((short) 13);
			cell = row.getCell((short) 0);
			cell.setCellValue(richStringNo);
			
			//日期
			row = sheet.getRow((short) 16);
			cell = row.getCell((short) 0);
			cell.setCellValue("日期： " + dateString);

			i++;
		}
		
		if(bidCoList != null && bidCoList.size() == 0){
			Sheet sheet = workbook.getSheetAt(0);
			//项目名称
			Row row = sheet.getRow((short) 3);
			Cell cell = row.getCell((short) 0);
			String projectNameOld = String.valueOf(cell.getStringCellValue());
			String replacePro = projectNameOld.substring(2, 2 + projectName.length());
			String projectNameNew = projectNameOld.replaceFirst(replacePro, projectName);
			//加下划线
			HSSFCellStyle style = (HSSFCellStyle ) cell.getCellStyle();
			Font fontOld = style.getFont(workbook);
			Font font = workbook.createFont();
			font.setUnderline(Font.U_SINGLE); //下划线
			PoiBidReply.copyFont(fontOld, font);
			HSSFRichTextString richStringPro = null;
			richStringPro = new HSSFRichTextString (projectNameNew);
			richStringPro.applyFont(2, richStringPro.length(), font);
			cell.setCellValue(richStringPro);
			
			//项目编号
			row = sheet.getRow((short) 4);
			cell = row.getCell((short) 0);
			String bidNoOld = String.valueOf(cell.getStringCellValue());
			int startNo = bidNoOld.indexOf("：");
			int endNo = bidNoOld.indexOf("）");
			StringBuffer bidNoNew = new StringBuffer(bidNoOld);
			bidNoNew = bidNoNew.replace(startNo + 1, startNo + 1 + bidNo.length(), bidNo);
			//加下划线
			int startBond = bidNoOld.indexOf("币");
			int endBond = bidNoOld.indexOf("万");
			style = (HSSFCellStyle ) cell.getCellStyle();
			fontOld = style.getFont(workbook);
			font = workbook.createFont();
			font.setUnderline(Font.U_SINGLE); //下划线
			PoiBidReply.copyFont(fontOld, font);
			HSSFRichTextString richStringNo = null;
			richStringNo = new HSSFRichTextString (bidNoNew.toString());
			richStringNo.applyFont(startNo + 1, endNo, font);
			richStringNo.applyFont(startBond + 1, endBond, font);
			cell.setCellValue(richStringNo);
			
			//第二联
			//项目名称
			row = sheet.getRow((short) 12);
			cell = row.getCell((short) 0);
			cell.setCellValue(richStringPro);
			
			//项目编号
			row = sheet.getRow((short) 13);
			cell = row.getCell((short) 0);
			cell.setCellValue(richStringNo);
		}
	}
	
	public static void main(String arg[]) {
	}
}
