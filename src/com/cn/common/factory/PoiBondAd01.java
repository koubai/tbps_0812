package com.cn.common.factory;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.hssf.util.Region;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.cn.common.util.DateUtil;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.BondDetailDto;
import com.cn.tbps.dto.BondDto;
import com.cn.tbps.dto.BondExtendDto;

/**
 * @name PoiBondNew.java
 * @author Frank
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiBondAd01 extends Poi2007Base {
	
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
		
		String title = "保证金收入汇总表";
		String dateStart = map.get("dateStart").toString();
		String dateEnd = map.get("dateEnd").toString();
		if(!dateStart.equals("") || !dateEnd.equals("")){
			title = dateStart + dateEnd + "年保证金收入汇总表";
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
		XSSFCell cell0 = null;					
		XSSFCell cell1 = null;					
		XSSFCell cell2 = null;					
		XSSFCell cell3 = null;					
		XSSFCell cell4 = null;					
		XSSFCell cell5 = null;					
		XSSFCell cell6 = null;					
		XSSFCell cell7 = null;					
		XSSFCell cell8 = null;					
		XSSFCell cell9 = null;					
		XSSFCell cell10 = null;					
		XSSFCell cell11 = null;					
		XSSFCell cell12 = null;					
		XSSFCell cell13 = null;					
		XSSFCell cell14 = null;					
		XSSFCell cell15 = null;					
		XSSFCell cell16 = null;					
		XSSFCell cell17 = null;					
		XSSFCell cell18 = null;					
		XSSFCell cell19 = null;					
		XSSFCell cell20 = null;					
		XSSFCell cell21 = null;					
		XSSFCell cell22 = null;					
		XSSFCell cell23 = null;					
		XSSFCell cell24 = null;					
		XSSFCell cell25 = null;					
		XSSFCell cell26 = null;					
		XSSFCell cell27 = null;					
		XSSFCell cell28 = null;					
		XSSFCell cell29 = null;					
		XSSFCell cell30 = null;					
		XSSFCell cell31 = null;					
		XSSFCell cell32 = null;					
		XSSFCell cell33 = null;					
		XSSFCell cell34 = null;		

		BigDecimal wan = new BigDecimal(10000);

		BondExtendDto bond = new BondExtendDto();
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
		int i;
		int startRow;
		int endRow;
		for(i = 0; i < datas.size(); i++) {
					
			row = sheet.createRow(i + 4);
			bond = (BondExtendDto) datas.get(i);

			String format = "yyyy/MM/dd";
			// 招标编号
			cell0 = row.createCell(0);										
			cell0.setCellValue(bond.getBID_NO());
			cell0.setCellStyle(style);	

			// 项目名称
			cell1 = row.createCell(1);
			cell1.setCellValue(bond.getPROJECT_NAME());
			cell1.setCellStyle(style);

			// 工程师
			cell2 = row.createCell(2);
			cell2.setCellValue(bond.getPROJECT_MANAGER());
			cell2.setCellStyle(style);

			// 委托单位
			cell3 = row.createCell(3);
			cell3.setCellValue(bond.getAGENT_CO_NAME());
			cell3.setCellStyle(style);

			// 监管人
			cell4 = row.createCell(4);
			cell4.setCellValue(bond.getAGENT_CO_MANAGER());
			cell4.setCellStyle(style);

			// 预借时间
			cell5 = row.createCell(5);
			cell5.setCellValue("");
			cell5.setCellStyle(style);

			// 预借
			cell6 = row.createCell(6);
			cell6.setCellValue(StringUtil.BigDecimal2Str(bond.getBID_COMMISION(), 2));
			cell6.setCellStyle(style);

			// 退补时间
			cell7 = row.createCell(7);
			cell7.setCellValue("");
			cell7.setCellStyle(style);

			// 退（+）补（-）
			cell8 = row.createCell(8);
			cell8.setCellValue("");
			cell8.setCellStyle(style);

			// 实际支出
			cell9 = row.createCell(9);
			cell9.setCellValue(StringUtil.BigDecimal2Str(bond.getBID_COMMISION(), 2));
			cell9.setCellStyle(style);

			// 投标单位
			cell10 = row.createCell(10);
			cell10.setCellValue(nullToStr(bond.getBID_CO_TB_NAME()));
			cell10.setCellStyle(style);

			// 登记时间
			cell11 = row.createCell(11);
			cell11.setCellValue(DateUtil.dateToStr(bond.getRESERVE_DATE2(), format));
			cell11.setCellStyle(style);

			// 现金
			cell12 = row.createCell(12);
			cell12.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT1_WAN(), 2));
			cell12.setCellStyle(style);

			// 现金2
			cell13 = row.createCell(13);
			cell13.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT6_WAN(), 2));
			cell13.setCellStyle(style);

			// 支票
			cell14 = row.createCell(14);
			cell14.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT2_WAN(), 2));
			cell14.setCellStyle(style);

			// 汇款时间
			cell15 = row.createCell(15);
			cell15.setCellValue("");
			cell15.setCellStyle(style);

			// 汇款
			cell16 = row.createCell(16);
			String strAmount34In = StringUtil.BigDecimal2Str(bond.getAMOUNT34_WAN(), 2);
			if(strAmount34In.equals("0.00")){
				cell16.setCellValue("");
			} else {
				cell16.setCellValue(strAmount34In);
			}
			cell16.setCellStyle(style);

			// 保函
			cell17 = row.createCell(17);
			cell17.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT5_WAN(), 2));
			cell17.setCellStyle(style);
			
			// 退还时间
			cell18 = row.createCell(18);
			cell18.setCellValue(DateUtil.dateToStr(bond.getREFOUND_DEPOSIT_DATE(), format));
			cell18.setCellStyle(style);

			// 现金
			cell19 = row.createCell(19);
			cell19.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT1_WAN(), 2));
			cell19.setCellStyle(style);

			// 现金2
			cell20 = row.createCell(20);
			cell20.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT6_WAN(), 2));
			cell20.setCellStyle(style);

			// 支票
			cell21 = row.createCell(21);
			cell21.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT2_WAN(), 2));
			cell21.setCellStyle(style);

			// 汇款
			cell22 = row.createCell(22);
			String strAmount34 = StringUtil.BigDecimal2Str(bond.getAMOUNT34_WAN(), 2);
			if(strAmount34.equals("0.00")){
				cell22.setCellValue("");
			} else {
				cell22.setCellValue(strAmount34);
			}
			cell22.setCellStyle(style);

			// 保函
			cell23 = row.createCell(23);
			cell23.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT5_WAN(), 2));
			cell23.setCellStyle(style);

			// 收入
			cell24 = row.createCell(24);
			cell24.setCellValue(StringUtil.BigDecimal2Str(bond.getBID_APPLY_PRICE(), 2));
			cell24.setCellStyle(style);

			// 收入时间
			cell25 = row.createCell(25);
			cell25.setCellValue("");
			cell25.setCellStyle(style);

			// 开票时间
			cell26 = row.createCell(26);
			cell26.setCellValue(DateUtil.dateToStr(bond.getRESERVE_DATE1(), format));
			cell26.setCellStyle(style);

			// 发票号
			cell27 = row.createCell(27);
			cell27.setCellValue(nullToStr(bond.getBID_RECEIPT_NO()));
			cell27.setCellStyle(style);

			// 入账时间
			cell28 = row.createCell(28);
			cell28.setCellValue(DateUtil.dateToStr(bond.getBID_VALUE_DATE(), format));
			cell28.setCellStyle(style);

			// 甲方
			cell29 = row.createCell(29);
			cell29.setCellValue(nullToStr(bond.getPROF_CO_NAME()));
			cell29.setCellStyle(style);

			// 中标单位
			cell30 = row.createCell(30);
			cell30.setCellValue(nullToStr(bond.getBID_CO_NAME()));
			cell30.setCellStyle(style);

			// 开票日期
			cell31 = row.createCell(31);
			cell31.setCellValue(DateUtil.dateToStr(bond.getRECEIPT1_DATE(), format));
			cell31.setCellStyle(style);

			// 发票号
			cell32 = row.createCell(32);
			cell32.setCellValue(nullToStr(bond.getRECEIPT1_NO()));
			cell32.setCellStyle(style);

			// 发票金额（万元）
			cell33 = row.createCell(33);
			cell33.setCellValue(StringUtil.BigDecimal2Str(bond.getBID_AGENT_PRICE_WAN(), 2));
			cell33.setCellStyle(style);

			// 到账情况
			cell34 = row.createCell(34);
			cell34.setCellValue(DateUtil.dateToStr(bond.getRECEIPT1_VALUE_DATE(), format));
			cell34.setCellStyle(style);
		}
		if (i>1){
			startRow = i-1;
			endRow = i-1;
			for (int k=i-1; k>0; k--){
				BondExtendDto tmp_bond=(BondExtendDto) datas.get(k);
				String str_Bid_No = tmp_bond.getBID_NO();
				BondExtendDto tmp2_bond=(BondExtendDto) datas.get(k-1);
				String str_old_Bid_No = tmp2_bond.getBID_NO();
				if (str_Bid_No.equals(str_old_Bid_No)){
					startRow = k-1;
				} else {
					if (endRow - startRow > 0)
						mergeRg(sheet, startRow+4, endRow+4);
					endRow=k-1;
				} 
			}
			if (endRow - startRow > 0)
				mergeRg(sheet, startRow+4, endRow+4);
		}
	}
	
	
	public void mergeRg(XSSFSheet sheet, int startRow, int endRow){
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 0, 0));
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 1, 1));
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 2, 2));
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 3, 3));
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 4, 4));
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 5, 5));
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 6, 6));
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 7, 7));
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 8, 8));
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 9, 9));
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 29, 29));
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 30, 30));
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 31, 31));
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 32, 32));
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 33, 33));
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 34, 34));
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
		for(int i = 0; i < 35; i++) {
			cell2 = row2.createCell(i);
			cell2.setCellStyle(style);
			cell3 = row3.createCell(i);
			cell3.setCellStyle(style);
		}

		//招标编号
		sheet.setColumnWidth(0, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 0, 0));
		XSSFCell cell = row2.createCell(0);
		cell.setCellValue("招标编号");
		cell.setCellStyle(style);

		//项目名称
		sheet.setColumnWidth(1, 15 * 3 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 1, 1));
		cell = row2.createCell(1);
		cell.setCellValue("项目名称");
		cell.setCellStyle(style);

		//工程师
		sheet.setColumnWidth(2, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 2, 2));
		cell = row2.createCell(2);
		cell.setCellValue("工程师");
		cell.setCellStyle(style);

		//委托单位
		sheet.setColumnWidth(3, 15 * 3 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 3, 3));
		cell = row2.createCell(3);
		cell.setCellValue("委托单位");
		cell.setCellStyle(style);

		//会审监管人
		sheet.setColumnWidth(4, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 4, 4));
		cell = row2.createCell(4);
		cell.setCellValue("监管人");
		cell.setCellStyle(style);

		//专家费
		sheet.setColumnWidth(5, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 5, 9));
		cell = row2.createCell(5);
		cell.setCellValue("专家费");
		cell.setCellStyle(style);

		//预借时间
		sheet.setColumnWidth(5, 15 * 256);
		cell = row3.createCell(5);
		cell.setCellValue("预借时间");
		cell.setCellStyle(style);

		//预借
		sheet.setColumnWidth(6, 15 * 256);
		cell = row3.createCell(6);
		cell.setCellValue("预借");
		cell.setCellStyle(style);

		//退补时间
		sheet.setColumnWidth(7, 15 * 256);
		cell = row3.createCell(7);
		cell.setCellValue("退补时间");
		cell.setCellStyle(style);

		//退（+）补（-）
		sheet.setColumnWidth(8, 15 * 256);
		cell = row3.createCell(8);
		cell.setCellValue("退（+）补（-）");
		cell.setCellStyle(style);

		//实际支出
		sheet.setColumnWidth(9, 15 * 256);
		cell = row3.createCell(9);
		cell.setCellValue("实际支出");
		cell.setCellStyle(style);
		
		//投标单位
		sheet.setColumnWidth(10, 15 * 3 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 10, 10));
		cell = row2.createCell(10);
		cell.setCellValue("投标单位");
		cell.setCellStyle(style);

		//登记时间
		sheet.setColumnWidth(11, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 11, 11));
		cell = row2.createCell(11);
		cell.setCellValue("登记时间");
		cell.setCellStyle(style);

		//收入方式（单位：万元）
		sheet.setColumnWidth(12, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 12, 17));
		cell = row2.createCell(12);
		cell.setCellValue("收入方式（单位：万元）");
		cell.setCellStyle(style);

		//现金
		sheet.setColumnWidth(12, 15 * 256);
		cell = row3.createCell(12);
		cell.setCellValue("现金");
		cell.setCellStyle(style);

		//现金2 
		sheet.setColumnWidth(13, 15 * 256);
		cell = row3.createCell(13);
		cell.setCellValue("现金2 ");
		cell.setCellStyle(style);

		//支票
		sheet.setColumnWidth(14, 15 * 256);
		cell = row3.createCell(14);
		cell.setCellValue("支票");
		cell.setCellStyle(style);

		//汇款时间
		sheet.setColumnWidth(15, 15 * 256);
		cell = row3.createCell(15);
		cell.setCellValue("汇款时间");
		cell.setCellStyle(style);

		//汇款
		sheet.setColumnWidth(16, 15 * 256);
		cell = row3.createCell(16);
		cell.setCellValue("汇款");
		cell.setCellStyle(style);

		//保函
		sheet.setColumnWidth(17, 15 * 256);
		cell = row3.createCell(17);
		cell.setCellValue("保函");
		cell.setCellStyle(style);

		//退还时间
		sheet.setColumnWidth(18, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 18, 18));
		cell = row2.createCell(18);
		cell.setCellValue("退还时间");
		cell.setCellStyle(style);

		//退还方式（单位：万元）
		sheet.setColumnWidth(19, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 19, 23));
		cell = row2.createCell(19);
		cell.setCellValue("退还方式（单位：万元）");
		cell.setCellStyle(style);

		//现金
		sheet.setColumnWidth(19, 15 * 256);
		cell = row3.createCell(19);
		cell.setCellValue("现金");
		cell.setCellStyle(style);

		//现金2 
		sheet.setColumnWidth(20, 15 * 256);
		cell = row3.createCell(20);
		cell.setCellValue("现金2 ");
		cell.setCellStyle(style);

		//支票
		sheet.setColumnWidth(21, 15 * 256);
		cell = row3.createCell(21);
		cell.setCellValue("支票");
		cell.setCellStyle(style);

		//汇款
		sheet.setColumnWidth(22, 15 * 256);
		cell = row3.createCell(22);
		cell.setCellValue("汇款");
		cell.setCellStyle(style);

		//保函
		sheet.setColumnWidth(23, 15 * 256);
		cell = row3.createCell(23);
		cell.setCellValue("保函");
		cell.setCellStyle(style);

		//标书费
		sheet.setColumnWidth(24, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 24, 28));
		cell = row2.createCell(24);
		cell.setCellValue("标书费");
		cell.setCellStyle(style);

		//收入
		sheet.setColumnWidth(24, 15 * 256);
		cell = row3.createCell(24);
		cell.setCellValue("收入");
		cell.setCellStyle(style);

		//收入时间
		sheet.setColumnWidth(25, 15 * 256);
		cell = row3.createCell(25);
		cell.setCellValue("收入时间 ");
		cell.setCellStyle(style);

		//开票时间
		sheet.setColumnWidth(26, 15 * 256);
		cell = row3.createCell(26);
		cell.setCellValue("开票时间");
		cell.setCellStyle(style);

		//发票号
		sheet.setColumnWidth(27, 15 * 256);
		cell = row3.createCell(27);
		cell.setCellValue("发票号");
		cell.setCellStyle(style);

		//入账时间
		sheet.setColumnWidth(28, 15 * 256);
		cell = row3.createCell(28);
		cell.setCellValue("入账时间");
		cell.setCellStyle(style);

		//代理费
		sheet.setColumnWidth(29, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 29, 34));
		cell = row2.createCell(29);
		cell.setCellValue("代理费");
		cell.setCellStyle(style);

		//甲方
		sheet.setColumnWidth(29, 15 * 256);
		cell = row3.createCell(29);
		cell.setCellValue("甲方");
		cell.setCellStyle(style);

		//中标单位
		sheet.setColumnWidth(30, 15 * 3 * 256);
		cell = row3.createCell(30);
		cell.setCellValue("中标单位 ");
		cell.setCellStyle(style);

		//开票日期
		sheet.setColumnWidth(31, 15 * 256);
		cell = row3.createCell(31);
		cell.setCellValue("开票日期");
		cell.setCellStyle(style);

		//发票号
		sheet.setColumnWidth(32, 15 * 256);
		cell = row3.createCell(32);
		cell.setCellValue("发票号");
		cell.setCellStyle(style);

		//发票金额（万元）
		sheet.setColumnWidth(33, 18 * 256);
		cell = row3.createCell(33);
		cell.setCellValue("发票金额（万元）");
		cell.setCellStyle(style);

		//到账情况
		sheet.setColumnWidth(34, 15 * 256);
		cell = row3.createCell(34);
		cell.setCellValue("到账情况");
		cell.setCellStyle(style);
	}

	/**
	 * 返回格式化的字符串
	 * @param str 字符串
	 * @return 格式化的字符串
	 */
	private String nullToStr(String str) {
		if(str == null) {
			str = "";
		}
		return str;
	}
	
	public static void main(String arg[]) {
	}
}
