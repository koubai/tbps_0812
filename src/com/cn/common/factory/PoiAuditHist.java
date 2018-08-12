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
import com.cn.tbps.dto.AuditHistDto;

/**
 * @name PoiAudit.java
 * @author Frank
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiAuditHist extends Poi2007Base {
	
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
		
		String title = "审价履历一览";
		if(datas != null && datas.size() > 0) {
			AuditHistDto auditHist = (AuditHistDto) datas.get(0);
			title += "（" + auditHist.getAUDIT_NO() + "）";
		}
		cell.setCellValue(title);
		
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
		AuditHistDto audit = new AuditHistDto();
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
			audit = (AuditHistDto) datas.get(i);
			XSSFCell cell0 = row.createCell(0);
			XSSFCell cell1 = row.createCell(1);
			XSSFCell cell2 = row.createCell(2);
			XSSFCell cell3 = row.createCell(3);
			XSSFCell cell4 = row.createCell(4);
			XSSFCell cell5 = row.createCell(5);
			XSSFCell cell6 = row.createCell(6);
			XSSFCell cell7 = row.createCell(7);
			XSSFCell cell8 = row.createCell(8);
			XSSFCell cell9 = row.createCell(9);
			XSSFCell cell10 = row.createCell(10);
			XSSFCell cell11 = row.createCell(11);
			XSSFCell cell12 = row.createCell(12);
			XSSFCell cell13 = row.createCell(13);
			XSSFCell cell14 = row.createCell(14);
			XSSFCell cell15 = row.createCell(15);
			XSSFCell cell16 = row.createCell(16);
			XSSFCell cell17 = row.createCell(17);
			XSSFCell cell18 = row.createCell(18);
			XSSFCell cell19 = row.createCell(19);
			XSSFCell cell20 = row.createCell(20);
			XSSFCell cell21 = row.createCell(21);
			XSSFCell cell22 = row.createCell(22);
			XSSFCell cell23 = row.createCell(23);
			XSSFCell cell24 = row.createCell(24);
			XSSFCell cell25 = row.createCell(25);
			XSSFCell cell26 = row.createCell(26);
			XSSFCell cell27 = row.createCell(27);
			XSSFCell cell28 = row.createCell(28);
			XSSFCell cell29 = row.createCell(29);
			XSSFCell cell30 = row.createCell(30);
			XSSFCell cell31 = row.createCell(31);
			XSSFCell cell32 = row.createCell(32);
			XSSFCell cell33 = row.createCell(33);
			
			cell0.setCellValue("" + (i + 1));
			cell0.setCellStyle(style);
			cell1.setCellValue(audit.getUPDATE_USER());
			cell1.setCellStyle(style);
			cell2.setCellValue(DateUtil.dateToLongStr(audit.getUPDATE_DATE()));
			cell2.setCellStyle(style);
			cell3.setCellValue(audit.getAUDIT_NO());
			cell3.setCellStyle(style);
//			cell4.setCellValue(DateUtil.dateToStr(audit.getDOC_ARR_DATE(), format));
//			cell4.setCellStyle(style);
//			cell5.setCellValue(audit.getPROJECT_STATUS_NAME());
//			cell5.setCellStyle(style);
//			cell6.setCellValue(DateUtil.dateToStr(audit.getVERIFY_DOC_SEND_DATE(), format));
//			cell6.setCellStyle(style);
//			cell7.setCellValue(DateUtil.dateToStr(audit.getVERIFY_DOC_REPLY_DATE(), format));
//			cell7.setCellStyle(style);
//			cell8.setCellValue(DateUtil.dateToStr(audit.getLAST_REPORT_DATE(), format));
//			cell8.setCellStyle(style);
//			cell9.setCellValue(audit.getREPORT_NO());
//			cell9.setCellStyle(style);
//			cell10.setCellValue(audit.getPROJECT_NAME());
//			cell10.setCellStyle(style);
//			cell11.setCellValue(audit.getCONTRACT_NO());
//			cell11.setCellStyle(style);
//			cell12.setCellValue(audit.getPROJECT_TYPE_NAME());
//			cell12.setCellStyle(style);
//			cell13.setCellValue(audit.getAGENT_CO_NAME());
//			cell13.setCellStyle(style);
//			cell14.setCellValue(audit.getAGENT_CO_MANAGER());
//			cell14.setCellStyle(style);
//			cell15.setCellValue(audit.getAGENT_CO_MANAGER_TEL());
//			cell15.setCellStyle(style);
//			cell16.setCellValue(audit.getAGENT_CO_STAFF());
//			cell16.setCellStyle(style);
//			cell17.setCellValue(audit.getAGENT_CO_STAFF_TEL());
//			cell17.setCellStyle(style);
//			cell18.setCellValue(audit.getCONTRACT_CO_NAME());
//			cell18.setCellStyle(style);
//			cell19.setCellValue(audit.getCONTRACT_CO_MANAGER());
//			cell19.setCellStyle(style);
//			cell20.setCellValue(audit.getCONTRACT_CO_MANAGER_TEL());
//			cell20.setCellStyle(style);
//			cell21.setCellValue(audit.getCONTRACT_CO_STAFF());
//			cell21.setCellStyle(style);
//			cell22.setCellValue(audit.getCONTRACT_CO_STAFF_TEL());
//			cell22.setCellStyle(style);
//			//送审价
//			cell23.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_PER_AMOUNT(), 2));
//			cell23.setCellStyle(style);
//			cell24.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_AMOUNT(), 2));
//			cell24.setCellStyle(style);
//			cell25.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_DIFF(), 2));
//			cell25.setCellStyle(style);
//			cell26.setCellValue(audit.getVERIFY_INCREASE());
//			cell26.setCellStyle(style);
//			cell27.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_DECREASE(), 2));
//			cell27.setCellStyle(style);
//			cell28.setCellValue(audit.getRECEIPT1_AMOUNT_A());
//			cell28.setCellStyle(style);
//			cell29.setCellValue(audit.getRECEIPT1_AMOUNT_B());
//			cell29.setCellStyle(style);
//			cell30.setCellValue(DateUtil.dateToStr(audit.getRECEIPT1_DATE(), format));
//			cell30.setCellStyle(style);
//			cell31.setCellValue(audit.getRECEIPT1_NO());
//			cell31.setCellStyle(style);
//			cell32.setCellValue(DateUtil.dateToStr(audit.getVALUE_DATE(), format));
//			cell32.setCellStyle(style);
//			cell33.setCellValue(audit.getPROJECT_MANAGER());
//			cell33.setCellStyle(style);
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
		heads.add("更新者");
		sheet.setColumnWidth(1, 15 * 256);
		heads.add("更新时间");
		sheet.setColumnWidth(2, 15 * 256);
		heads.add("审价编号");
		sheet.setColumnWidth(3, 15 * 256);
		heads.add("资料到达日期");
		sheet.setColumnWidth(4, 15 * 256);
		heads.add("项目进度");
		sheet.setColumnWidth(5, 15 * 256);
		heads.add("审定单发出日期");
		sheet.setColumnWidth(6, 15 * 256);
		heads.add("审定单回复日期");
		sheet.setColumnWidth(7, 15 * 256);
		heads.add("报告日期");
		sheet.setColumnWidth(8, 15 * 256);
		heads.add("文号");
		sheet.setColumnWidth(9, 15 * 256);
		heads.add("项目名称");
		sheet.setColumnWidth(10, 15 * 256);
		heads.add("项目合同编号");
		sheet.setColumnWidth(11, 15 * 256);
		heads.add("项目性质");
		sheet.setColumnWidth(12, 15 * 256);
		heads.add("委托公司");
		sheet.setColumnWidth(13, 15 * 256);
		heads.add("委托公司负责人");
		sheet.setColumnWidth(14, 15 * 256);
		heads.add("委托公司负责人电话");
		sheet.setColumnWidth(15, 15 * 256);
		heads.add("委托公司项目负责人");
		sheet.setColumnWidth(16, 15 * 256);
		heads.add("委托公司项目负责人电话");
		sheet.setColumnWidth(17, 15 * 256);
		heads.add("承包公司");
		sheet.setColumnWidth(18, 15 * 256);
		heads.add("承包公司负责人");
		sheet.setColumnWidth(19, 15 * 256);
		heads.add("承包公司负责人电话");
		sheet.setColumnWidth(20, 15 * 256);
		heads.add("承包公司项目负责人");
		sheet.setColumnWidth(21, 15 * 256);
		heads.add("承包公司项目负责人电话");
		sheet.setColumnWidth(22, 15 * 256);
		heads.add("送审价");
		sheet.setColumnWidth(23, 15 * 256);
		heads.add("审定价");
		sheet.setColumnWidth(24, 15 * 256);
		heads.add("净核减");
		sheet.setColumnWidth(25, 15 * 256);
		heads.add("核增");
		sheet.setColumnWidth(26, 15 * 256);
		heads.add("核减");
		sheet.setColumnWidth(27, 15 * 256);
		heads.add("审价费（甲方）");
		sheet.setColumnWidth(28, 15 * 256);
		heads.add("审价费（乙方）");
		sheet.setColumnWidth(29, 15 * 256);
		heads.add("开票日期");
		sheet.setColumnWidth(30, 15 * 256);
		heads.add("发票号");
		sheet.setColumnWidth(31, 15 * 256);
		heads.add("到帐日期");
		sheet.setColumnWidth(32, 15 * 256);
		heads.add("担当者");
		sheet.setColumnWidth(33, 15 * 256);
		
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
