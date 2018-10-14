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

import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.BondDto;

/**
 * @name PoiBidAccountReport
 * @author Pei 合同报告
 * @time 2018-10-14下午11:48:13
 * @version 1.0
 */
public class PoiBidAccountReport extends Poi2007Base {
	
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
		
		String title = "保证金汇总表";
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
		BondDto bond = new BondDto();
		//式样
		XSSFCellStyle style = workbook.createCellStyle();
		//水平居中
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		//添加边框
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		
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
		
		//添加数据
		for(int i = 0; i < datas.size(); i++) {
			row = sheet.createRow(i + 4);
			bond = (BondDto) datas.get(i);
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
			
			if("3".equals(bond.getDATA_TYPE())) {
				//合计
				cell0.setCellValue(bond.getAGENT_CO_NAME());
				cell0.setCellStyle(style1);
				cell1.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT1(), 2));
				cell1.setCellStyle(style1);
				cell2.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT2(), 2));
				cell2.setCellStyle(style1);
				cell3.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT34(), 2));
				cell3.setCellStyle(style1);
				//汇票、网上银行
				cell4.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT5(), 2));
				cell4.setCellStyle(style1);
				cell5.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT6(), 2));
				cell5.setCellStyle(style1);
				cell6.setCellValue(StringUtil.BigDecimal2Str(bond.getTOTAL(), 2));
				cell6.setCellStyle(style1);
				cell7.setCellValue(StringUtil.BigDecimal2Str(bond.getREFUND(), 2));
				cell7.setCellStyle(style1);
				cell8.setCellValue(StringUtil.BigDecimal2Str(bond.getAGENT_FEE(), 2));
				cell8.setCellStyle(style1);
				//评标费
				cell9.setCellValue(StringUtil.BigDecimal2Str(bond.getBID_COMMISION(), 2));
				cell9.setCellStyle(style1);
				cell10.setCellValue(bond.getMEMO());
				cell10.setCellStyle(style1);
			} else {
				cell0.setCellValue(bond.getAGENT_CO_NAME() + "（" + bond.getAGENT_NO() + "）");
				cell0.setCellStyle(style);
				cell1.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT1(), 2));
				cell1.setCellStyle(style);
				cell2.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT2(), 2));
				cell2.setCellStyle(style);
				cell3.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT34(), 2));
				cell3.setCellStyle(style);
				//汇票、网上银行
				cell4.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT5(), 2));
				cell4.setCellStyle(style);
				cell5.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT6(), 2));
				cell5.setCellStyle(style);
				cell6.setCellValue(StringUtil.BigDecimal2Str(bond.getTOTAL(), 2));
				cell6.setCellStyle(style);
				cell7.setCellValue(StringUtil.BigDecimal2Str(bond.getREFUND(), 2));
				cell7.setCellStyle(style);
				cell8.setCellValue(StringUtil.BigDecimal2Str(bond.getAGENT_FEE(), 2));
				cell8.setCellStyle(style);
				//评标费
				cell9.setCellValue(StringUtil.BigDecimal2Str(bond.getBID_COMMISION(), 2));
				cell9.setCellStyle(style);
				cell10.setCellValue(bond.getMEMO());
				cell10.setCellStyle(style);
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
		for(int i = 0; i < 11; i++) {
			cell2 = row2.createCell(i);
			cell2.setCellStyle(style);
			cell3 = row3.createCell(i);
			cell3.setCellStyle(style);
		}
		
		//公司名称
		sheet.setColumnWidth(0, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 0, 0));
		XSSFCell cell = row2.createCell(0);
		cell.setCellValue("公司名称");
		cell.setCellStyle(style);
		
		//其中
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 1, 5));
		cell = row2.createCell(1);
		cell.setCellValue("其中");
		cell.setCellStyle(style);
		//现金
		sheet.setColumnWidth(1, 15 * 256);
		cell = row3.createCell(1);
		cell.setCellValue("现金");
		cell.setCellStyle(style);
		//支票
		sheet.setColumnWidth(2, 15 * 256);
		cell = row3.createCell(2);
		cell.setCellValue("支票");
		cell.setCellStyle(style);
		//汇票、网上银行
		sheet.setColumnWidth(3, 15 * 256);
		cell = row3.createCell(3);
		cell.setCellValue("汇票、网上银行");
		cell.setCellStyle(style);
		//保函
		sheet.setColumnWidth(4, 15 * 256);
		cell = row3.createCell(4);
		cell.setCellValue("保函");
		cell.setCellStyle(style);
		//现金2
		sheet.setColumnWidth(5, 15 * 256);
		cell = row3.createCell(5);
		cell.setCellValue("现金2");
		cell.setCellStyle(style);
		
		//总收
		sheet.setColumnWidth(6, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 6, 6));
		cell = row2.createCell(6);
		cell.setCellValue("总收");
		cell.setCellStyle(style);
		//已退
		sheet.setColumnWidth(7, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 7, 7));
		cell = row2.createCell(7);
		cell.setCellValue("已退");
		cell.setCellStyle(style);
		//转代理费
		sheet.setColumnWidth(8, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 8, 8));
		cell = row2.createCell(8);
		cell.setCellValue("转代理费");
		cell.setCellStyle(style);
		//专家费
		sheet.setColumnWidth(9, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 9, 9));
		cell = row2.createCell(9);
		cell.setCellValue("评标费");
		cell.setCellStyle(style);
		//备注
		sheet.setColumnWidth(10, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 10, 10));
		cell = row2.createCell(10);
		cell.setCellValue("备注");
		cell.setCellStyle(style);
	}
	
	public static void main(String arg[]) {
	}
}
