package com.cn.common.factory;

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
import com.cn.tbps.dto.SettlementDto;

/**
 * @name PoiSettlementHist.java
 * @author Frank
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiSettlementHist extends Poi2007Base {
	
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
		
		String title = "费用结算清单";
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
		SettlementDto settlement = new SettlementDto();
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
			row = sheet.createRow(i + 4);
			settlement = (SettlementDto) datas.get(i);
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
			
			if("4".equals(settlement.getDATA_TYPE())) {
				//月小计
				
				//月小计式样
				XSSFCellStyle style1 = workbook.createCellStyle();
				//水平居中
				style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
				//添加边框
				style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
				style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
				style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
				style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
				//背景色
				style1.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
				style1.setFillForegroundColor(new XSSFColor(new java.awt.Color(255, 255, 0)));
				
				cell0.setCellValue(settlement.getTOTAL_DATE() + "小计");
				cell0.setCellStyle(style1);
				cell1.setCellValue(DateUtil.dateToStr(settlement.getRECEIPT_DATE(), format));
				cell1.setCellStyle(style1);
				cell2.setCellValue(settlement.getRECEIPT_NO());
				cell2.setCellStyle(style1);
				cell3.setCellValue(settlement.getBILL_NO());
				cell3.setCellStyle(style1);
				if(StringUtil.isNotBlank(settlement.getAGENT_NO())) {
					cell4.setCellValue(settlement.getAGENT_COMP() + "（" + settlement.getAGENT_NO() + "）");
				} else {
					cell4.setCellValue("");
				}
				cell4.setCellStyle(style1);
				cell5.setCellValue(settlement.getPROJECT_NAME());
				cell5.setCellStyle(style1);
				cell6.setCellValue(settlement.getPAY_COMP());
				cell6.setCellStyle(style1);
				cell7.setCellValue(StringUtil.totalPrice(settlement.getCHECK_PRICE()));
				cell7.setCellStyle(style1);
				cell8.setCellValue(StringUtil.totalPrice(settlement.getAPPLY_PRICE()));
				cell8.setCellStyle(style1);
				cell9.setCellValue(StringUtil.totalPrice(settlement.getCOMMISSION_PRICE()));
				cell9.setCellStyle(style1);
				cell10.setCellValue(StringUtil.totalPrice(settlement.getAMOUNT_PRICE()));
				cell10.setCellStyle(style1);
				cell11.setCellValue(StringUtil.totalPrice(settlement.getAT_PRICE()));
				cell11.setCellStyle(style1);
				cell12.setCellValue(StringUtil.totalPrice(settlement.getWITHHOLD_PRICE()));
				cell12.setCellStyle(style1);
				cell13.setCellValue(StringUtil.totalPrice(settlement.getREMAIN_PRICE()));
				cell13.setCellStyle(style1);
			} else if("5".equals(settlement.getDATA_TYPE())) {
				
				//总计式样
				XSSFCellStyle style1 = workbook.createCellStyle();
				//水平居中
				style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
				//添加边框
				style1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
				style1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
				style1.setBorderTop(HSSFCellStyle.BORDER_THIN);
				style1.setBorderRight(HSSFCellStyle.BORDER_THIN);
				//背景色
				style1.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
				style1.setFillForegroundColor(new XSSFColor(new java.awt.Color(64, 224, 208 )));
				
				//总计
				cell0.setCellValue("总计");
				cell0.setCellStyle(style1);
				cell1.setCellValue("");
				cell1.setCellStyle(style1);
				cell2.setCellValue(settlement.getRECEIPT_NO());
				cell2.setCellStyle(style1);
				cell3.setCellValue(settlement.getBILL_NO());
				cell3.setCellStyle(style1);
				if(StringUtil.isNotBlank(settlement.getAGENT_NO())) {
					cell4.setCellValue(settlement.getAGENT_COMP() + "（" + settlement.getAGENT_NO() + "）");
				} else {
					cell4.setCellValue("");
				}
				cell4.setCellStyle(style1);
				cell5.setCellValue(settlement.getPROJECT_NAME());
				cell5.setCellStyle(style1);
				cell6.setCellValue(settlement.getPAY_COMP());
				cell6.setCellStyle(style1);
				cell7.setCellValue(StringUtil.totalPrice(settlement.getCHECK_PRICE()));
				cell7.setCellStyle(style1);
				cell8.setCellValue(StringUtil.totalPrice(settlement.getAPPLY_PRICE()));
				cell8.setCellStyle(style1);
				cell9.setCellValue(StringUtil.totalPrice(settlement.getCOMMISSION_PRICE()));
				cell9.setCellStyle(style1);
				cell10.setCellValue(StringUtil.totalPrice(settlement.getAMOUNT_PRICE()));
				cell10.setCellStyle(style1);
				cell11.setCellValue(StringUtil.totalPrice(settlement.getAT_PRICE()));
				cell11.setCellStyle(style1);
				cell12.setCellValue(StringUtil.totalPrice(settlement.getWITHHOLD_PRICE()));
				cell12.setCellStyle(style1);
				cell13.setCellValue(StringUtil.totalPrice(settlement.getREMAIN_PRICE()));
				cell13.setCellStyle(style1);
			} else {
				//非合计
				cell0.setCellValue(DateUtil.dateToStr(settlement.getBILL_DATE(), format));
				cell0.setCellStyle(style);
				cell1.setCellValue(DateUtil.dateToStr(settlement.getRECEIPT_DATE(), format));
				cell1.setCellStyle(style);
				cell2.setCellValue(settlement.getRECEIPT_NO());
				cell2.setCellStyle(style);
				//只有招标和审价才显示编号
				if("2".equals(settlement.getDATA_TYPE()) || "3".equals(settlement.getDATA_TYPE())) {
					cell3.setCellValue(settlement.getBILL_NO());
				} else {
					cell3.setCellValue("");
				}
				cell3.setCellStyle(style);
				if(StringUtil.isNotBlank(settlement.getAGENT_NO())) {
					cell4.setCellValue(settlement.getAGENT_COMP() + "（" + settlement.getAGENT_NO() + "）");
				} else {
					cell4.setCellValue("");
				}
				cell4.setCellStyle(style);
				cell5.setCellValue(settlement.getPROJECT_NAME());
				cell5.setCellStyle(style);
				cell6.setCellValue(settlement.getPAY_COMP());
				cell6.setCellStyle(style);
				cell7.setCellValue(StringUtil.BigDecimal2Str(settlement.getCHECK_PRICE(), 2));
				cell7.setCellStyle(style);
				cell8.setCellValue(StringUtil.BigDecimal2Str(settlement.getAPPLY_PRICE(), 2));
				cell8.setCellStyle(style);
				cell9.setCellValue(StringUtil.BigDecimal2Str(settlement.getCOMMISSION_PRICE(), 2));
				cell9.setCellStyle(style);
				cell10.setCellValue(StringUtil.BigDecimal2Str(settlement.getAMOUNT_PRICE(), 2));
				cell10.setCellStyle(style);
				cell11.setCellValue(StringUtil.BigDecimal2Str(settlement.getAT_PRICE(), 2));
				cell11.setCellStyle(style);
				cell12.setCellValue(StringUtil.BigDecimal2Str(settlement.getWITHHOLD_PRICE(), 2));
				cell12.setCellStyle(style);
				cell13.setCellValue(StringUtil.BigDecimal2Str(settlement.getREMAIN_PRICE(), 2));
				cell13.setCellStyle(style);
			}
		}
	}
	
	/**
	 * 输出Head部分
	 * @param sheet
	 */
	@SuppressWarnings("deprecation")
	@Override
	public void writeHead(XSSFSheet sheet, XSSFWorkbook workbook) {
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
		
		XSSFRow row2 = sheet.createRow(2);
		XSSFRow row3 = sheet.createRow(3);
		
		XSSFCell cell2 = null;
		XSSFCell cell3 = null;
		for(int i = 0; i < 14; i++) {
			cell2 = row2.createCell(i);
			cell2.setCellStyle(style);
			cell3 = row3.createCell(i);
			cell3.setCellStyle(style);
		}
		
		//到账日期
		sheet.setColumnWidth(0, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 0, 0));
		XSSFCell cell = row2.createCell(0);
		cell.setCellValue("到账日期");
		cell.setCellStyle(style);
		
		//发票
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 1, 2));
		cell = row2.createCell(1);
		cell.setCellValue("发票");
		cell.setCellStyle(style);
		//发票日期
		sheet.setColumnWidth(1, 15 * 256);
		cell = row3.createCell(1);
		cell.setCellValue("发票日期");
		cell.setCellStyle(style);
		//发票号码
		sheet.setColumnWidth(2, 15 * 256);
		cell = row3.createCell(2);
		cell.setCellValue("发票号码");
		cell.setCellStyle(style);
		
		//项目
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 3, 6));
		cell = row2.createCell(3);
		cell.setCellValue("项目");
		cell.setCellStyle(style);
		//审价/招标编号
		sheet.setColumnWidth(3, 15 * 256);
		cell = row3.createCell(3);
		cell.setCellValue("审价/招标编号");
		cell.setCellStyle(style);
		//委托单位
		sheet.setColumnWidth(4, 15 * 256);
		cell = row3.createCell(4);
		cell.setCellValue("委托单位");
		cell.setCellStyle(style);
		//项目名称
		sheet.setColumnWidth(5, 15 * 256);
		cell = row3.createCell(5);
		cell.setCellValue("项目名称");
		cell.setCellStyle(style);
		//支付单位
		sheet.setColumnWidth(6, 15 * 256);
		cell = row3.createCell(6);
		cell.setCellValue("支付单位");
		cell.setCellStyle(style);
		
		//收入
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 7, 10));
		cell = row2.createCell(7);
		cell.setCellValue("收入");
		cell.setCellStyle(style);
		//审价
		sheet.setColumnWidth(7, 15 * 256);
		cell = row3.createCell(7);
		cell.setCellValue("审价");
		cell.setCellStyle(style);
		//标书费
		sheet.setColumnWidth(8, 15 * 256);
		cell = row3.createCell(8);
		cell.setCellValue("标书费");
		cell.setCellStyle(style);
		//代理费
		sheet.setColumnWidth(9, 15 * 256);
		cell = row3.createCell(9);
		cell.setCellValue("代理费");
		cell.setCellStyle(style);
		//合计
		sheet.setColumnWidth(10, 15 * 256);
		cell = row3.createCell(10);
		cell.setCellValue("合计");
		cell.setCellStyle(style);
		
		//联合
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 11, 13));
		cell = row2.createCell(11);
		cell.setCellValue("联合");
		cell.setCellStyle(style);
		//税后金额
		sheet.setColumnWidth(11, 15 * 256);
		cell = row3.createCell(11);
		cell.setCellValue("税后金额");
		cell.setCellStyle(style);
		//代扣
		sheet.setColumnWidth(12, 15 * 256);
		cell = row3.createCell(12);
		cell.setCellValue("代扣");
		cell.setCellStyle(style);
		//月余额
		sheet.setColumnWidth(13, 15 * 256);
		cell = row3.createCell(13);
		cell.setCellValue("月余额");
		cell.setCellStyle(style);
	}
	
	public static void main(String arg[]) {
	}
}
