package com.cn.common.factory;

import java.util.ArrayList;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.cn.common.util.DateUtil;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.AuditDto;

/**
 * @name PoiAudit.java
 * @author Frank
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiAudit extends Poi2007Base {
	
	/**
	 * 输出大标题
	 * @param sheet
	 */
	@SuppressWarnings("deprecation")
	@Override
	public void writeTitle(XSSFSheet sheet, XSSFWorkbook workbook) {
		//Head部分颜色字体
		XSSFFont font = workbook.createFont();
		//加粗
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		//字体大小
		font.setFontHeightInPoints((short)18);
				
		XSSFRow row = sheet.createRow(1);
		//合并单元格
		sheet.addMergedRegion(new CellRangeAddress(1, 1, 0, 5));
		XSSFCell cell = row.createCell(0);
		cell.setCellValue("审价项目一览");
		//式样
		XSSFCellStyle style = workbook.createCellStyle();
		//水平居中
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setFont(font);
		cell.setCellStyle(style);
	}
	
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	@Override
	public void writeData(XSSFSheet sheet, XSSFWorkbook workbook) {
		XSSFRow row = null;
		AuditDto audit = new AuditDto();
		//式样
		XSSFCellStyle style = workbook.createCellStyle();
		//水平居中
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		//添加边框
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		
		String format = "yyyy/MM/dd";

		//添加数据
		for(int i = 0; i < datas.size(); i++) {
			row = sheet.createRow(i + 3);
			audit = (AuditDto) datas.get(i);
			XSSFCell cell0 = row.createCell(0);
			XSSFCell cell1 = row.createCell(1);
			XSSFCell cell2 = row.createCell(2);
			XSSFCell cell3 = row.createCell(3);
			XSSFCell cell4 = row.createCell(4);
			XSSFCell cell5 = row.createCell(5);

			cell0.setCellValue("" + (i + 1));
			cell0.setCellStyle(style);
			cell1.setCellValue(audit.getPROJECT_MANAGER());
			cell1.setCellStyle(style);
			cell2.setCellValue(audit.getREPORT_NO());
			cell2.setCellStyle(style);
			cell3.setCellValue(audit.getPROJECT_NAME());
			cell3.setCellStyle(style);
			if(map.get("cntrctInfo").equals("5")){
				cell4.setCellValue(StringUtil.BigDecimal2Str(audit.getPRE_PRICE(), 2));
				cell4.setCellStyle(style);
			} else {
				cell4.setCellValue(DateUtil.dateToStr(audit.getDOC_REC_DATE(), format));
				cell4.setCellStyle(style);
			}
			if(map.get("cntrctInfo").equals("5")){
				cell5.setCellValue(audit.getPROGRESS_STATUS_MEMO());
				cell5.setCellStyle(style);
			} else if(map.get("cntrctInfo").equals("1")) {
				cell5.setCellValue(DateUtil.dateToStr(audit.getAPPROVAL_SND_DATE(), format));
				cell5.setCellStyle(style);
			} else {
				cell5.setCellValue(DateUtil.dateToStr(audit.getREPORT_RAISE_DATE(), format));
				cell5.setCellStyle(style);
			}
			
			if(map.get("cntrctInfo").equals("1")){
				XSSFCell cell6 = row.createCell(6);
				XSSFCell cell7 = row.createCell(7);
				XSSFCell cell8 = row.createCell(8);
				cell6.setCellValue(DateUtil.dateToStr(audit.getREPORT_RAISE_DATE(), format));
				cell6.setCellStyle(style);
				cell7.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_PER_AMOUNT(), 2));
				cell7.setCellStyle(style);
				cell8.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_AMOUNT(), 2));
				cell8.setCellStyle(style);
			} else if(map.get("cntrctInfo").equals("2")){
				XSSFCell cell6 = row.createCell(6);
				XSSFCell cell7 = row.createCell(7);
				cell6.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_PER_AMOUNT(), 2));
				cell6.setCellStyle(style);
				cell7.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_AMOUNT(), 2));
				cell7.setCellStyle(style);
			} else if(map.get("cntrctInfo").equals("4")){
				XSSFCell cell6 = row.createCell(6);
				cell6.setCellValue(StringUtil.BigDecimal2Str(audit.getCNT_PRICE(), 2));
				cell6.setCellStyle(style);
			}
			
//			cell0.setCellValue("" + (i + 1));
//			cell0.setCellStyle(style);
//			cell1.setCellValue(DateUtil.dateToStr(audit.getDOC_ARR_DATE(), format));
//			cell1.setCellStyle(style);
//			cell2.setCellValue(audit.getPROJECT_STATUS_NAME());
//			cell2.setCellStyle(style);
//			cell3.setCellValue(DateUtil.dateToStr(audit.getVERIFY_DOC_SEND_DATE(), format));
//			cell3.setCellStyle(style);
//			cell4.setCellValue(DateUtil.dateToStr(audit.getVERIFY_DOC_REPLY_DATE(), format));
//			cell4.setCellStyle(style);
//			cell5.setCellValue(DateUtil.dateToStr(audit.getLAST_REPORT_DATE(), format));
//			cell5.setCellStyle(style);
//			cell6.setCellValue(audit.getREPORT_NO());
//			cell6.setCellStyle(style);
//			cell7.setCellValue(audit.getPROJECT_NAME());
//			cell7.setCellStyle(style);
//			cell8.setCellValue(audit.getCONTRACT_NO());
//			cell8.setCellStyle(style);
//			cell9.setCellValue(audit.getPROJECT_TYPE_NAME());
//			cell9.setCellStyle(style);
//			cell10.setCellValue(audit.getAGENT_CO_NAME());
//			cell10.setCellStyle(style);
//			cell11.setCellValue(audit.getAGENT_CO_MANAGER());
//			cell11.setCellStyle(style);
//			cell12.setCellValue(audit.getAGENT_CO_MANAGER_TEL());
//			cell12.setCellStyle(style);
//			cell13.setCellValue(audit.getAGENT_CO_STAFF());
//			cell13.setCellStyle(style);
//			cell14.setCellValue(audit.getAGENT_CO_STAFF_TEL());
//			cell14.setCellStyle(style);
//			//专业公司
//			cell15.setCellValue(audit.getPROF_CO_NAME());
//			cell15.setCellStyle(style);
//			cell16.setCellValue(audit.getPROF_CO_MANAGER());
//			cell16.setCellStyle(style);
//			cell17.setCellValue(audit.getPROF_CO_MANAGER_TEL());
//			cell17.setCellStyle(style);
//			cell18.setCellValue(audit.getPROF_CO_STAFF());
//			cell18.setCellStyle(style);
//			cell19.setCellValue(audit.getPROF_CO_STAFF_TEL());
//			cell19.setCellStyle(style);
//			//承包公司
//			cell20.setCellValue(audit.getCONTRACT_CO_NAME());
//			cell20.setCellStyle(style);
//			cell21.setCellValue(audit.getCONTRACT_CO_MANAGER());
//			cell21.setCellStyle(style);
//			cell22.setCellValue(audit.getCONTRACT_CO_MANAGER_TEL());
//			cell22.setCellStyle(style);
//			cell23.setCellValue(audit.getCONTRACT_CO_STAFF());
//			cell23.setCellStyle(style);
//			cell24.setCellValue(audit.getCONTRACT_CO_STAFF_TEL());
//			cell24.setCellStyle(style);
//			//送审价
//			cell25.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_PER_AMOUNT(), 2));
//			cell25.setCellStyle(style);
//			cell26.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_AMOUNT(), 2));
//			cell26.setCellStyle(style);
//			cell27.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_DIFF(), 2));
//			cell27.setCellStyle(style);
//			cell28.setCellValue(audit.getVERIFY_INCREASE());
//			cell28.setCellStyle(style);
//			cell29.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_DECREASE(), 2));
//			cell29.setCellStyle(style);
//			cell30.setCellValue(audit.getRECEIPT1_AMOUNT_A());
//			cell30.setCellStyle(style);
//			cell31.setCellValue(audit.getRECEIPT1_AMOUNT_B());
//			cell31.setCellStyle(style);
//			cell32.setCellValue(DateUtil.dateToStr(audit.getRECEIPT1_DATE(), format));
//			cell32.setCellStyle(style);
//			cell33.setCellValue(audit.getRECEIPT1_NO());
//			cell33.setCellStyle(style);
//			cell34.setCellValue(DateUtil.dateToStr(audit.getVALUE_DATE(), format));
//			cell34.setCellStyle(style);
//			cell35.setCellValue(audit.getPROJECT_MANAGER());
//			cell35.setCellStyle(style);
		}
	}
	
	/**
	 * 输出Head部分
	 * @param sheet
	 */
	@Override
	public void writeHead(XSSFSheet sheet, XSSFWorkbook workbook) {
		heads = new ArrayList<String>();
		heads.add("序号");
		sheet.setColumnWidth(0, 15 * 256);
		heads.add("工程师");
		sheet.setColumnWidth(1, 15 * 256);
		heads.add("项目文号");
		sheet.setColumnWidth(2, 15 * 256);
		heads.add("项目名称");
		sheet.setColumnWidth(3, 15 * 256);
		if(map.get("cntrctInfo").equals("1")){
			heads.add("资料收到日期");
			sheet.setColumnWidth(4, 15 * 256);
			heads.add("审定单发出日期");
			sheet.setColumnWidth(5, 15 * 256);
			heads.add("报告出具日期");
			sheet.setColumnWidth(6, 15 * 256);
			heads.add("送审价");
			sheet.setColumnWidth(7, 15 * 256);
			heads.add("审核价");
			sheet.setColumnWidth(8, 15 * 256);
		} else if(map.get("cntrctInfo").equals("2")){
			heads.add("资料收到日期");
			sheet.setColumnWidth(4, 15 * 256);
			heads.add("报告出具日期");
			sheet.setColumnWidth(5, 15 * 256);
			heads.add("送审价");
			sheet.setColumnWidth(6, 15 * 256);
			heads.add("审核价");
			sheet.setColumnWidth(7, 15 * 256);
		} else if(map.get("cntrctInfo").equals("3")){
			heads.add("资料收到日期");
			sheet.setColumnWidth(4, 15 * 256);
			heads.add("报告出具日期");
			sheet.setColumnWidth(5, 15 * 256);
		} else if(map.get("cntrctInfo").equals("4")){
			heads.add("资料收到日期");
			sheet.setColumnWidth(4, 15 * 256);
			heads.add("报告出具日期");
			sheet.setColumnWidth(5, 15 * 256);
			heads.add("控制价金额");
			sheet.setColumnWidth(6, 15 * 256);
		} else {
			heads.add("预算金额");
			sheet.setColumnWidth(4, 15 * 256);
			heads.add("项目大致进程简述");
			sheet.setColumnWidth(5, 15 * 256);
		}
		
		//Head部分颜色字体
		XSSFFont font = workbook.createFont();
		//加粗
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		//字体大小
		font.setFontHeightInPoints((short)12);
		
		//式样
		XSSFCellStyle style = workbook.createCellStyle();
		//水平居中
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		//添加边框
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setFont(font);
		//背景色
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style.setFillForegroundColor(new XSSFColor(new java.awt.Color(180, 180, 180)));
		XSSFRow row = sheet.createRow(2);
		
		XSSFCell cell = null;
		for(int i = 0; i < heads.size(); i++) {
			cell = row.createCell(i);
			cell.setCellValue(heads.get(i));
			cell.setCellStyle(style);
		}
	}
	
	public static void main(String arg[]) {
	}
}
