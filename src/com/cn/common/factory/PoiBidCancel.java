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
 * @name PoiBidCancel.java
 * @author lql
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiBidCancel extends Poi2007Base {
	
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	@SuppressWarnings("deprecation")
	@Override
	public void writeData(Workbook workbook) {
		BidDto bidDto = (BidDto) datas.get(0);
		String bidNo = bidDto.getBID_NO();
		String projectName = bidDto.getPROJECT_NAME();
		@SuppressWarnings("unchecked")
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
			Row row = sheet.getRow((short) 1);
			Cell cell = row.getCell((short) 0);
			String compName = bidComp.getBID_CO_NAME();
			String compNameOld = String.valueOf(cell.getStringCellValue());
			int startCompName = compNameOld.indexOf("还");
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
			row = sheet.getRow((short) 2);
			cell = row.getCell((short) 0);
			String projectNameOld = String.valueOf(cell.getStringCellValue());
			String replacePro = projectNameOld.substring(2, 2 + projectName.length());
			String projectNameNew = projectNameOld.replaceFirst(replacePro, projectName);
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
			
			//项目编号
			row = sheet.getRow((short) 3);
			cell = row.getCell((short) 0);
			String bidNoOld = String.valueOf(cell.getStringCellValue());
			int startNo = bidNoOld.indexOf("：");
			int endNo = bidNoOld.indexOf("）");
			
			StringBuffer bidNoNew = new StringBuffer(bidNoOld);
			bidNoNew = bidNoNew.replace(startNo + 1, startNo + 1 + bidNo.length(), bidNo);
			//加下划线
			style = (HSSFCellStyle ) cell.getCellStyle();
			fontOld = style.getFont(workbook);
			font = workbook.createFont();
			font.setUnderline(Font.U_SINGLE); //下划线
			PoiBidReply.copyFont(fontOld, font);
			HSSFRichTextString richStringNo = null;
			richStringNo = new HSSFRichTextString (bidNoNew.toString());
			richStringNo.applyFont(startNo + 1, endNo, font);
			cell.setCellValue(richStringNo);
			

			//保证金
			row = sheet.getRow((short) 4);
			cell = row.getCell((short) 0);
			String bondOld = String.valueOf(cell.getStringCellValue());
			String bond = "";
			if(bidComp.getBID_BOND() != null) {
//				bond = bidComp.getBID_BOND().divide(new BigDecimal("10000"),6,BigDecimal.ROUND_HALF_UP).toString();
				bond = bidComp.getBID_BOND().divide(new BigDecimal("1"),6,BigDecimal.ROUND_HALF_UP).toString();
			}
			int startBond = bondOld.indexOf("为");
			int endBond = bondOld.indexOf("万");

			StringBuffer bondNew = new StringBuffer(bondOld);
			bondNew = bondNew.replace(startBond + 1, endBond, bond);
			//加下划线
			style = (HSSFCellStyle ) cell.getCellStyle();
			fontOld = style.getFont(workbook);
			font = workbook.createFont();
			font.setUnderline(Font.U_SINGLE); //下划线
			PoiBidReply.copyFont(fontOld, font);
			richStringNo = new HSSFRichTextString (bondNew.toString());
			richStringNo.applyFont(startBond + 1, endBond, font);
			cell.setCellValue(richStringNo);
			
			//递交方式
			row = sheet.getRow((short) 5);
			cell = row.getCell((short) 0);
			String type = bidComp.getBID_PAYMENT_TYPE();
			String typeNew = "递交方式：□支票    □现金   □贷记凭证    □转账   □电汇     □保函    □现金2";
			if(type != null && type.equals("1")){
				typeNew = "递交方式：□支票    ■现金   □贷记凭证    □转账   □电汇     □保函    □现金2";
			} else if(type != null && type.equals("2")){
				typeNew = "递交方式：■支票    □现金   □贷记凭证    □转账   □电汇     □保函    □现金2";
			} else if(type != null && type.equals("3")){
				typeNew = "递交方式：□支票    □现金   □贷记凭证    ■转账   □电汇     □保函    □现金2";
			} else if(type != null && type.equals("4")){
				typeNew = "递交方式：□支票    □现金   □贷记凭证    □转账   ■电汇     □保函    □现金2";
			} else if(type != null && type.equals("5")){
				typeNew = "递交方式：□支票    □现金   □贷记凭证    □转账   □电汇     ■保函    □现金2";
			} else if(type != null && type.equals("6")){
				typeNew = "递交方式：□支票    □现金   □贷记凭证    □转账   □电汇     □保函    ■现金2";
			} else {
				typeNew = "递交方式：□支票    □现金   □贷记凭证    □转账   □电汇     □保函    □现金2";
			}
			cell.setCellValue(typeNew);
			i++;
		}
		
		if(bidCoList != null && bidCoList.size() == 0){
			Sheet sheet = workbook.getSheetAt(0);
			//项目名称
			Row row = sheet.getRow((short) 2);
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
			row = sheet.getRow((short) 3);
			cell = row.getCell((short) 0);
			String bidNoOld = String.valueOf(cell.getStringCellValue());
			int startNo = bidNoOld.indexOf("：");
			int endNo = bidNoOld.indexOf("）");
			
			StringBuffer bidNoNew = new StringBuffer(bidNoOld);
			bidNoNew = bidNoNew.replace(startNo + 1, startNo + 1 + bidNo.length(), bidNo);
			//加下划线
			style = (HSSFCellStyle ) cell.getCellStyle();
			fontOld = style.getFont(workbook);
			font = workbook.createFont();
			font.setUnderline(Font.U_SINGLE); //下划线
			PoiBidReply.copyFont(fontOld, font);
			HSSFRichTextString richStringNo = null;
			richStringNo = new HSSFRichTextString (bidNoNew.toString());
			richStringNo.applyFont(startNo + 1, endNo, font);
			cell.setCellValue(richStringNo);
			
		}
	}
	
	public static void main(String arg[]) {
	}
}
