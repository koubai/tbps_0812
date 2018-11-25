package com.cn.common.factory;

import java.math.BigDecimal;

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
import com.cn.tbps.dto.BidDto;

/**
 * @name PoiExpertPayReport
 * @author Pei 专家费
 * @time 2018-10-14下午11:48:13
 * @version 1.0
 */
@SuppressWarnings("deprecation")
public class PoiExpertPayReport extends Poi2007Base {
	
	/**
	 * 输出大标题
	 * @param sheet
	 */
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
		sheet.addMergedRegion(new CellRangeAddress(1, 1, 0, 6));
		XSSFCell cell = row.createCell(0);
		
		String title = "专家评审费申请发放表";
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
		BidDto bidrpt = new BidDto();
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
		XSSFCell cell0 = null;
		XSSFCell cell1 = null;
		XSSFCell cell2 = null;
		XSSFCell cell3 = null;
		XSSFCell cell4 = null;
		XSSFCell cell5 = null;
		XSSFCell cell6 = null;
		BigDecimal Total_BID_EXPERT_COMMISION_PRE = new BigDecimal(0);
		BigDecimal Total_BID_EXPERT_COMMISION_ACT = new BigDecimal(0);
		BigDecimal Total_BID_EXPERT_COMMISION_DIFF = new BigDecimal(0);
		int i;
		for(i = 0; i < datas.size(); i++) {
			row = sheet.createRow(i + 4);
			bidrpt = (BidDto) datas.get(i);
			cell0 = row.createCell(0);
			cell1 = row.createCell(1);
			cell2 = row.createCell(2);
			cell3 = row.createCell(3);
			cell4 = row.createCell(4);
			cell5 = row.createCell(5);
			cell6 = row.createCell(6);
			
			cell0.setCellValue((i + 1));
			cell0.setCellStyle(style);
			cell1.setCellValue(bidrpt.getPROJECT_NAME());
			cell1.setCellStyle(style);
			cell2.setCellValue(bidrpt.getBID_NO());
			cell2.setCellStyle(style);
			//专家费申请金额（元）
			cell3.setCellValue(StringUtil.BigDecimal2Str(bidrpt.getBID_EXPERT_COMMISION_PRE(), 2));
			cell3.setCellStyle(style);
			//专家费实际使用金额（元）
			cell4.setCellValue(StringUtil.BigDecimal2Str(bidrpt.getBID_EXPERT_COMMISION_ACT(), 2));
			cell4.setCellStyle(style);
			//退还差额（元）
			cell5.setCellValue(StringUtil.BigDecimal2Str(bidrpt.getBID_EXPERT_COMMISION_DIFF(), 2));
			cell5.setCellStyle(style);
			cell6.setCellValue("");
			cell6.setCellStyle(style);
			
			if (bidrpt.getBID_EXPERT_COMMISION_PRE() == null)
				Total_BID_EXPERT_COMMISION_PRE = Total_BID_EXPERT_COMMISION_PRE.add(new BigDecimal(0));
			else
				Total_BID_EXPERT_COMMISION_PRE = Total_BID_EXPERT_COMMISION_PRE.add(bidrpt.getBID_EXPERT_COMMISION_PRE());
			if (bidrpt.getBID_EXPERT_COMMISION_ACT() == null)
				Total_BID_EXPERT_COMMISION_ACT = Total_BID_EXPERT_COMMISION_ACT.add(new BigDecimal(0));
			else
				Total_BID_EXPERT_COMMISION_ACT = Total_BID_EXPERT_COMMISION_ACT.add(bidrpt.getBID_EXPERT_COMMISION_ACT());
			if (bidrpt.getBID_EXPERT_COMMISION_DIFF() == null || bidrpt.getBID_EXPERT_COMMISION_PRE() == null || bidrpt.getBID_EXPERT_COMMISION_ACT() == null )
				Total_BID_EXPERT_COMMISION_DIFF = Total_BID_EXPERT_COMMISION_DIFF.add(new BigDecimal(0));
			else 
				Total_BID_EXPERT_COMMISION_DIFF = Total_BID_EXPERT_COMMISION_DIFF.add(bidrpt.getBID_EXPERT_COMMISION_DIFF());
		}
		row = sheet.createRow(i + 4);
		cell0 = row.createCell(0);
		cell1 = row.createCell(1);
		cell2 = row.createCell(2);
		cell3 = row.createCell(3);
		cell4 = row.createCell(4);
		cell5 = row.createCell(5);
		cell6 = row.createCell(6);
		cell0.setCellValue("");
		cell0.setCellStyle(style1);
		cell1.setCellValue("合计");
		cell1.setCellStyle(style1);
		cell2.setCellValue("");
		cell2.setCellStyle(style1);
		//专家费申请金额（元）
		cell3.setCellValue(StringUtil.BigDecimal2Str(Total_BID_EXPERT_COMMISION_PRE, 2));
		cell3.setCellStyle(style1);
		//专家费实际使用金额（元）
		cell4.setCellValue(StringUtil.BigDecimal2Str(Total_BID_EXPERT_COMMISION_ACT, 2));
		cell4.setCellStyle(style1);
		//退还差额（元）
		cell5.setCellValue(StringUtil.BigDecimal2Str(Total_BID_EXPERT_COMMISION_DIFF, 2));
		cell5.setCellStyle(style1);
		cell6.setCellValue("");
		cell6.setCellStyle(style1);
	}
	
	/**
	 * 输出Head部分
	 * @param sheet
	 */
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
		for(int i = 0; i < 7; i++) {
			cell2 = row2.createCell(i);
			cell2.setCellStyle(style);
			cell3 = row3.createCell(i);
			cell3.setCellStyle(style);
		}
		
		//序号
		sheet.setColumnWidth(0, 15 * 256);
		XSSFCell cell = row3.createCell(0);
		cell.setCellValue("序号");
		cell.setCellStyle(style);
		
		//项目名称
		sheet.setColumnWidth(1, 15 * 256);
		cell = row3.createCell(1);
		cell.setCellValue("项目名称");
		cell.setCellStyle(style);
		//项目编号
		sheet.setColumnWidth(2, 15 * 256);
		cell = row3.createCell(2);
		cell.setCellValue("项目编号");
		cell.setCellStyle(style);
		//专家费申请金额（元）
		sheet.setColumnWidth(3, 15 * 256);
		cell = row3.createCell(3);
		cell.setCellValue("专家费申请金额（元）");
		cell.setCellStyle(style);
		//专家费实际使用金额（元）
		sheet.setColumnWidth(4, 15 * 256);
		cell = row3.createCell(4);
		cell.setCellValue("专家费实际使用金额（元）");
		cell.setCellStyle(style);
		//退还差额（元）
		sheet.setColumnWidth(5, 15 * 256);
		cell = row3.createCell(5);
		cell.setCellValue("退还差额（元）");
		cell.setCellStyle(style);
		
		//备注
		sheet.setColumnWidth(6, 15 * 256);
		cell = row3.createCell(6);
		cell.setCellValue("备注");
		cell.setCellStyle(style);
	}
	
	public static void main(String arg[]) {
	}
}
