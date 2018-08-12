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
import com.cn.tbps.dto.BidExpertDto;

/**
 * @name PoiBidExpert.java
 * @author Frank
 * @time 2014-3-31下午11:27:06
 * @version 1.0
 */
public class PoiBidExpert extends Poi2007Base {
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
		cell.setCellValue("招标评审专家信息");
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
		BidExpertDto bidExpert = new BidExpertDto();
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
			bidExpert = (BidExpertDto) datas.get(i);
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
			cell0.setCellValue(bidExpert.getBID_NO());
			cell0.setCellStyle(style);
			cell1.setCellValue(bidExpert.getAGENT_NO());
			cell1.setCellStyle(style);
			cell2.setCellValue(bidExpert.getAGENT_CO_NAME());
			cell2.setCellStyle(style);
			cell3.setCellValue(bidExpert.getPROJECT_NAME());
			cell3.setCellStyle(style);
			cell4.setCellValue(bidExpert.getEXPERT_NAME());
			cell4.setCellStyle(style);
			cell5.setCellValue(bidExpert.getEXPERT_MAJOR_NAME());
			cell5.setCellStyle(style);
			cell6.setCellValue(bidExpert.getEXPERT_QULI());
			cell6.setCellStyle(style);
			cell7.setCellValue(bidExpert.getEXPERT_TEL1());
			cell7.setCellStyle(style);
			cell8.setCellValue(bidExpert.getEXPERT_TEL2());
			cell8.setCellStyle(style);
			if("1".equals(bidExpert.getEXPERT_GENDER())) {
				cell9.setCellValue("男");
			} else {
				cell9.setCellValue("女");
			}
			cell9.setCellStyle(style);
			//专家生日改为任意项目
			if (bidExpert.getEXPERT_BIRTH() != null)
				cell10.setCellValue(DateUtil.dateToStr(bidExpert.getEXPERT_BIRTH(), format));
			else 
				cell10.setCellValue("");
			//cell10.setCellValue(bidExpert.getEXPERT_BIRTH());
			cell10.setCellStyle(style);
			cell11.setCellValue(bidExpert.getEXPERT_COMP());
			cell11.setCellStyle(style);
			cell12.setCellValue(bidExpert.getMEMO1());
			cell12.setCellStyle(style);
		}
	}
	
	/**
	 * 输出Head部分
	 * @param sheet
	 */
	@Override
	public void writeHead(XSSFSheet sheet, XSSFWorkbook workbook) {
		heads = new ArrayList<String>();
		heads.add("招标编号");
		sheet.setColumnWidth(0, 15 * 256);
		heads.add("委托公司代码");
		sheet.setColumnWidth(1, 15 * 256);
		heads.add("委托公司名称");
		sheet.setColumnWidth(2, 15 * 256);
		heads.add("项目名称");
		sheet.setColumnWidth(3, 15 * 256);
		heads.add("姓名");
		sheet.setColumnWidth(4, 15 * 256);
		heads.add("专业");
		sheet.setColumnWidth(5, 15 * 256);
		heads.add("职称");
		sheet.setColumnWidth(6, 15 * 256);
		heads.add("手机电话");
		sheet.setColumnWidth(7, 15 * 256);
		heads.add("固话");
		sheet.setColumnWidth(8, 15 * 256);
		heads.add("性别");
		sheet.setColumnWidth(9, 15 * 256);
		heads.add("出生日期");
		sheet.setColumnWidth(10, 15 * 256);
		heads.add("就职公司");
		sheet.setColumnWidth(11, 15 * 256);
		heads.add("备注");
		sheet.setColumnWidth(12, 15 * 256);
		
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
