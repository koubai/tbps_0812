package com.cn.common.factory;

import java.util.ArrayList;
import java.util.List;

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
import com.cn.tbps.dto.AgentCompDto;

/**
 * @name PoiAgentComp.java
 * @author Frank
 * @time 2013-10-18下午10:26:39
 * @version 1.0
 */
public class PoiAgentComp extends Poi2007Base {
	
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
		cell.setCellValue("委托公司一览");
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
		AgentCompDto agentcomp = new AgentCompDto();
		//式样
		XSSFCellStyle style = workbook.createCellStyle();
		//水平居中
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		//添加边框
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);

		//添加数据
		for(int i = 0; i < datas.size(); i++) {
			row = sheet.createRow(i + 3);
			agentcomp = (AgentCompDto) datas.get(i);
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
			cell0.setCellValue(agentcomp.getANGENT_COMP_NO());
			cell0.setCellStyle(style);
			cell1.setCellValue(agentcomp.getANGENT_COMP_NAME());
			cell1.setCellStyle(style);
			cell2.setCellValue(agentcomp.getCO_MANAGER1());
			cell2.setCellStyle(style);
			cell3.setCellValue(agentcomp.getCO_MANAGER2());
			cell3.setCellStyle(style);
			cell4.setCellValue(agentcomp.getCO_MANAGER3());
			cell4.setCellStyle(style);
			cell5.setCellValue(agentcomp.getCO_MANAGER4());
			cell5.setCellStyle(style);
			cell6.setCellValue(agentcomp.getCO_MANAGER5());
			cell6.setCellStyle(style);
			cell7.setCellValue(agentcomp.getMEMO1());
			cell7.setCellStyle(style);
			cell8.setCellValue(agentcomp.getUPDATE_USER());
			cell8.setCellStyle(style);
			cell9.setCellValue(DateUtil.dateToLogintime(agentcomp.getINSERT_DATE()));
			cell9.setCellStyle(style);
			cell10.setCellValue(DateUtil.dateToLogintime(agentcomp.getUPDATE_DATE()));
			cell10.setCellStyle(style);
		}
	}
	
	/**
	 * 输出Head部分
	 * @param sheet
	 */
	@Override
	public void writeHead(XSSFSheet sheet, XSSFWorkbook workbook) {
		heads = new ArrayList<String>();
		heads.add("委托公司代码");
		sheet.setColumnWidth(0, 15 * 256);
		heads.add("委托公司名称");
		sheet.setColumnWidth(1, 30 * 256);
		heads.add("联系人1");
		sheet.setColumnWidth(2, 10 * 256);
		heads.add("联系人2");
		sheet.setColumnWidth(3, 10 * 256);
		heads.add("联系人3");
		sheet.setColumnWidth(4, 10 * 256);
		heads.add("联系人4");
		sheet.setColumnWidth(5, 10 * 256);
		heads.add("联系人5");
		sheet.setColumnWidth(6, 10 * 256);
		heads.add("备注");
		sheet.setColumnWidth(7, 30 * 256);
		heads.add("更新者");
		sheet.setColumnWidth(8, 10 * 256);
		heads.add("新建日期");
		sheet.setColumnWidth(9, 22 * 256);
		heads.add("更新日期");
		sheet.setColumnWidth(10, 22 * 256);
		
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
		String name = "test.xlsx";
		String path = "d://";
		
		Poi2007Base poi = new PoiAgentComp();
		
		poi.setPath(path);
		poi.setName(name);
		
		poi.setSheetName("ceshi");
		poi.setTitle("哈哈哈哈");
		
		List<String> heads = new ArrayList<String>();
		heads.add("1111");
		heads.add("2222");
		heads.add("3333");
		heads.add("4444");
		heads.add("5555");
		poi.setHeads(heads);
		
		List<Object> datas = new ArrayList<Object>();
		datas.add("");
		datas.add("");
		poi.setDatas(datas);
		
		poi.createExcel();
	}
}
