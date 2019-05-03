package com.cn.common.factory;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.AuditAnnualDataDto;

/**
 * @name PoiAuditAnnualData.java
 * @author Frank
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiAuditAnnualData extends Poi2007Base {
	
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
		font.setFontHeightInPoints((short)14);
		
		//第一行标题
		XSSFRow row = sheet.createRow(1);
		
		sheet.setColumnWidth(0, 20 * 256);
		sheet.setColumnWidth(1, 15 * 256);
		sheet.setColumnWidth(2, 15 * 256);
		sheet.setColumnWidth(3, 15 * 256);
		sheet.setColumnWidth(4, 15 * 256);
		sheet.setColumnWidth(5, 20 * 256);
		sheet.setColumnWidth(6, 15 * 256);
		sheet.setColumnWidth(7, 15 * 256);
		sheet.setColumnWidth(8, 15 * 256);
		sheet.setColumnWidth(9, 15 * 256);
		sheet.setColumnWidth(10, 20 * 256);
		sheet.setColumnWidth(11, 15 * 256);
		sheet.setColumnWidth(12, 20 * 256);
		sheet.setColumnWidth(13, 20 * 256);
		sheet.setColumnWidth(14, 15 * 256);
		sheet.setColumnWidth(15, 15 * 256);
		sheet.setColumnWidth(16, 15 * 256);
		sheet.setColumnWidth(17, 15 * 256);
		sheet.setColumnWidth(18, 15 * 256);
		sheet.setColumnWidth(19, 15 * 256);
		sheet.setColumnWidth(20, 15 * 256);
		sheet.setColumnWidth(21, 15 * 256);
		sheet.setColumnWidth(22, 15 * 256);
		
		//合并单元格
		sheet.addMergedRegion(cellRange(1, 1, 2, 3, sheet, workbook));
		sheet.addMergedRegion(cellRange(1, 1, 4, 5, sheet, workbook));
		sheet.addMergedRegion(cellRange(1, 1, 7, 8, sheet, workbook));
		sheet.addMergedRegion(cellRange(1, 1, 10, 12, sheet, workbook));
		sheet.addMergedRegion(cellRange(1, 1, 13, 16, sheet, workbook));
		sheet.addMergedRegion(cellRange(1, 1, 17, 18, sheet, workbook));
		sheet.addMergedRegion(cellRange(1, 1, 19, 20, sheet, workbook));
		sheet.addMergedRegion(cellRange(1, 1, 21, 22, sheet, workbook));
		//地铁审价项目
		sheet.addMergedRegion(cellRange(4, 4, 0, 15, sheet, workbook));
		
		//式样
		XSSFCellStyle style = workbook.createCellStyle();
		//水平居中
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setFont(font);
		//添加边框
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		//背景灰色
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		
		XSSFCell cell = row.createCell(0);
		cell.setCellValue("时间");
		cell.setCellStyle(style);
		
		cell = row.createCell(1);
		cell.setCellValue("收到审价");
		cell.setCellStyle(style);
		
		cell = row.createCell(2);
		cell.setCellValue("完成审价（个）");
		cell.setCellStyle(style);
		
		cell = row.createCell(4);
		cell.setCellValue("总金额（元）");
		cell.setCellStyle(style);
		
		cell = row.createCell(6);
		cell.setCellValue("审定总金额");
		cell.setCellStyle(style);
		
		cell = row.createCell(7);
		cell.setCellValue("未完成（个）");
		cell.setCellStyle(style);
		
		cell = row.createCell(9);
		cell.setCellValue("复核项目");
		cell.setCellStyle(style);
		
		cell = row.createCell(10);
		cell.setCellValue("审价费（元）");
		cell.setCellStyle(style);
		
		cell = row.createCell(13);
		cell.setCellValue("实收审价费（元）");
		cell.setCellStyle(style);
		
		cell = row.createCell(17);
		cell.setCellValue("本月总发票");
		cell.setCellStyle(style);
		
		cell = row.createCell(19);
		cell.setCellValue("本月未收");
		cell.setCellStyle(style);
		
		cell = row.createCell(21);
		cell.setCellValue("历史未收发票");
		cell.setCellStyle(style);
		
		//第二行标题
		row = sheet.createRow(2);
		cell = row.createCell(0);
		cell.setCellValue("累计");
		cell.setCellStyle(style);
		
		cell = row.createCell(1);
		cell.setCellValue("个");
		cell.setCellStyle(style);
		
		cell = row.createCell(2);
		cell.setCellValue("本月");
		cell.setCellStyle(style);
		
		cell = row.createCell(3);
		cell.setCellValue("历史");
		cell.setCellStyle(style);
		
		cell = row.createCell(4);
		cell.setCellValue("本月送审");
		cell.setCellStyle(style);
		
		cell = row.createCell(5);
		cell.setCellValue("本月完成送审");
		cell.setCellStyle(style);
		
		cell = row.createCell(6);
		cell.setCellValue("元");
		cell.setCellStyle(style);
		
		cell = row.createCell(7);
		cell.setCellValue("当月");
		cell.setCellStyle(style);
		
		cell = row.createCell(8);
		cell.setCellValue("历史");
		cell.setCellStyle(style);
		
		cell = row.createCell(9);
		cell.setCellValue("个");
		cell.setCellStyle(style);
		
		cell = row.createCell(10);
		cell.setCellValue("本月确认应收");
		cell.setCellStyle(style);
		
		cell = row.createCell(11);
		cell.setCellValue("未确认");
		cell.setCellStyle(style);
		
		cell = row.createCell(12);
		cell.setCellValue("未确认后确认");
		cell.setCellStyle(style);
		
		cell = row.createCell(13);
		cell.setCellValue("本月发票（张）");
		cell.setCellStyle(style);
		
		cell = row.createCell(14);
		cell.setCellValue("本月");
		cell.setCellStyle(style);
		
		cell = row.createCell(15);
		cell.setCellValue("历史（张）");
		cell.setCellStyle(style);
		
		cell = row.createCell(16);
		cell.setCellValue("历史");
		cell.setCellStyle(style);
		
		cell = row.createCell(17);
		cell.setCellValue("张");
		cell.setCellStyle(style);
		
		cell = row.createCell(18);
		cell.setCellValue("金额");
		cell.setCellStyle(style);
		
		cell = row.createCell(19);
		cell.setCellValue("张");
		cell.setCellStyle(style);
		
		cell = row.createCell(20);
		cell.setCellValue("金额");
		cell.setCellStyle(style);
		
		cell = row.createCell(21);
		cell.setCellValue("张");
		cell.setCellStyle(style);
		
		cell = row.createCell(22);
		cell.setCellValue("金额");
		cell.setCellStyle(style);
	}
	
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	@Override
	public void writeData(XSSFSheet sheet, XSSFWorkbook workbook) {
		XSSFRow row = null;
		AuditAnnualDataDto auditAnnualData = null;
		//式样
		XSSFCellStyle style = workbook.createCellStyle();
		//水平居中
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		//添加边框
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		
		//上一年未完成审价汇总
		auditAnnualData = (AuditAnnualDataDto) map.get("last_year_audit_sum");
		row = sheet.createRow(3);
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
		
		cell0.setCellValue(auditAnnualData.getShowtime());
		cell0.setCellStyle(style);
		cell1.setCellValue(auditAnnualData.getReceiveAudit());
		cell1.setCellStyle(style);
		cell2.setCellValue(auditAnnualData.getCompleteAuditCurrentMonth());
		cell2.setCellStyle(style);
		cell3.setCellValue(auditAnnualData.getCompleteAuditHis());
		cell3.setCellStyle(style);
		cell4.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getSubmitAuditAmount(), 2));
		cell4.setCellStyle(style);
		cell5.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getCompleteAuditAmount(), 2));
		cell5.setCellStyle(style);
		cell6.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getAuthorizeAuditAmount(), 2));
		cell6.setCellStyle(style);
		cell7.setCellValue(auditAnnualData.getIncompleteAuditCurrentMonth());
		cell7.setCellStyle(style);
		cell8.setCellValue(auditAnnualData.getIncompleteAuditHis());
		cell8.setCellStyle(style);
		cell9.setCellValue(auditAnnualData.getReviewAudit());
		cell9.setCellStyle(style);
		cell10.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getAuditAmountMonthConfirm(), 2));
		cell10.setCellStyle(style);
		cell11.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getAuditAmountMonthUnconfirmed(), 2));
		cell11.setCellStyle(style);
		cell12.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getAuditAmountMonthConfirming(), 2));
		cell12.setCellStyle(style);
		cell13.setCellValue(auditAnnualData.getReceiptAuditPieceMonth());
		cell13.setCellStyle(style);
		cell14.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getReceiptAuditAmountMonth(), 2));
		cell14.setCellStyle(style);
		cell15.setCellValue(auditAnnualData.getReceiptAuditPieceHis());
		cell15.setCellStyle(style);
		cell16.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getReceiptAuditAmountHis(), 2));
		cell16.setCellStyle(style);
		cell17.setCellValue(auditAnnualData.getTotalNumMonth());
		cell17.setCellStyle(style);
		cell18.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getTotalAmountMonth(), 2));
		cell18.setCellStyle(style);
		cell19.setCellValue(auditAnnualData.getUnreceivedNumMonth());
		cell19.setCellStyle(style);
		cell20.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getUnreceivedAmountMonth(), 2));
		cell20.setCellStyle(style);
		cell21.setCellValue(auditAnnualData.getUnreceivedNumHis());
		cell21.setCellStyle(style);
		cell22.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getUnreceivedAmountHis(), 2));
		cell22.setCellStyle(style);
		
		//地铁审价项目（标题）
		row = sheet.createRow(4);
		//Head部分颜色字体
		XSSFFont font = workbook.createFont();
		//加粗
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		//字体大小
		font.setFontHeightInPoints((short)14);
		//式样
		XSSFCellStyle styleTitle = workbook.createCellStyle();
		//水平居中
		styleTitle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		styleTitle.setFont(font);
		//添加边框
		styleTitle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		styleTitle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		styleTitle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		styleTitle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		//背景灰色
		styleTitle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		styleTitle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		
		//合并单元格
		cell0 = row.createCell(0);
		cell0.setCellValue("地铁审价项目");
		cell0.setCellStyle(styleTitle);
		cell15 = row.createCell(15);
		cell15.setCellStyle(styleTitle);
		cell16 = row.createCell(16);
		cell16.setCellStyle(styleTitle);
		cell17 = row.createCell(17);
		cell17.setCellStyle(styleTitle);
		cell18 = row.createCell(18);
		cell18.setCellStyle(styleTitle);
		cell19 = row.createCell(19);
		cell19.setCellStyle(styleTitle);
		cell20 = row.createCell(20);
		cell20.setCellStyle(styleTitle);
		cell21 = row.createCell(21);
		cell21.setCellStyle(styleTitle);
		cell22 = row.createCell(22);
		cell22.setCellStyle(styleTitle);
		
		//添加数据
		for(int i = 0; i < datas.size(); i++) {
			row = sheet.createRow(i + 5);
			auditAnnualData = (AuditAnnualDataDto) datas.get(i);
			cell0 = row.createCell(0);
			cell1 = row.createCell(1);
			cell2 = row.createCell(2);
			cell3 = row.createCell(3);
			cell4 = row.createCell(4);
			cell5 = row.createCell(5);
			cell6 = row.createCell(6);
			cell7 = row.createCell(7);
			cell8 = row.createCell(8);
			cell9 = row.createCell(9);
			cell10 = row.createCell(10);
			cell11 = row.createCell(11);
			cell12 = row.createCell(12);
			cell13 = row.createCell(13);
			cell14 = row.createCell(14);
			cell15 = row.createCell(15);
			cell16 = row.createCell(16);
			cell17 = row.createCell(17);
			cell18 = row.createCell(18);
			cell19 = row.createCell(19);
			cell20 = row.createCell(20);
			cell21 = row.createCell(21);
			cell22 = row.createCell(22);
			
			cell0.setCellValue(auditAnnualData.getShowtime());
			cell0.setCellStyle(style);
			cell1.setCellValue(auditAnnualData.getReceiveAudit());
			cell1.setCellStyle(style);
			cell2.setCellValue(auditAnnualData.getCompleteAuditCurrentMonth());
			cell2.setCellStyle(style);
			cell3.setCellValue(auditAnnualData.getCompleteAuditHis());
			cell3.setCellStyle(style);
			cell4.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getSubmitAuditAmount(), 2));
			cell4.setCellStyle(style);
			cell5.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getCompleteAuditAmount(), 2));
			cell5.setCellStyle(style);
			cell6.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getAuthorizeAuditAmount(), 2));
			cell6.setCellStyle(style);
			cell7.setCellValue(auditAnnualData.getIncompleteAuditCurrentMonth());
			cell7.setCellStyle(style);
			cell8.setCellValue(auditAnnualData.getIncompleteAuditHis());
			cell8.setCellStyle(style);
			cell9.setCellValue(auditAnnualData.getReviewAudit());
			cell9.setCellStyle(style);
			cell10.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getAuditAmountMonthConfirm(), 2));
			cell10.setCellStyle(style);
			cell11.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getAuditAmountMonthUnconfirmed(), 2));
			cell11.setCellStyle(style);
			cell12.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getAuditAmountMonthConfirming(), 2));
			cell12.setCellStyle(style);
			cell13.setCellValue(auditAnnualData.getReceiptAuditPieceMonth());
			cell13.setCellStyle(style);
			cell14.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getReceiptAuditAmountMonth(), 2));
			cell14.setCellStyle(style);
			cell15.setCellValue(auditAnnualData.getReceiptAuditPieceHis());
			cell15.setCellStyle(style);
			cell16.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getReceiptAuditAmountHis(), 2));
			cell16.setCellStyle(style);
			cell17.setCellValue(auditAnnualData.getTotalNumMonth());
			cell17.setCellStyle(style);
			cell18.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getTotalAmountMonth(), 2));
			cell18.setCellStyle(style);
			cell19.setCellValue(auditAnnualData.getUnreceivedNumMonth());
			cell19.setCellStyle(style);
			cell20.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getUnreceivedAmountMonth(), 2));
			cell20.setCellStyle(style);
			cell21.setCellValue(auditAnnualData.getUnreceivedNumHis());
			cell21.setCellStyle(style);
			cell22.setCellValue(StringUtil.BigDecimal2Str(auditAnnualData.getUnreceivedAmountHis(), 2));
			cell22.setCellStyle(style);
		}
	}
	
	/**
	 * 输出Head部分
	 * @param sheet
	 */
	@Override
	public void writeHead(XSSFSheet sheet, XSSFWorkbook workbook) {
	}
	
	public static void main(String arg[]) {
	}
}
