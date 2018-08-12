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
import com.cn.tbps.dto.BidDto;

/**
 * @name PoiBid.java
 * @author lql
 * @time 2017-08-20下午11:48:13
 * @version 1.0
 */
public class PoiBidAd01 extends Poi2007Base {
	
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
		sheet.addMergedRegion(new CellRangeAddress(1, 1, 0, 3));
		XSSFCell cell = row.createCell(0);
		cell.setCellValue("招标项目清单:");
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
		BidDto bid = new BidDto();
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
			bid = (BidDto) datas.get(i);
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
			
			cell0.setCellValue(i+1);
			cell0.setCellStyle(style);
			cell1.setCellValue(DateUtil.dateToStr(bid.getRESERVE_DATE6(), format));
			cell1.setCellStyle(style);
			cell2.setCellValue(nullToStr(bid.getBID_NO()));
			cell2.setCellStyle(style);
			if("1".equals(bid.getRESERVE2())) {
				cell3.setCellValue("成本内");
			} else if("2".equals(bid.getRESERVE2())) {
				cell3.setCellValue("成本外");
			} else if("3".equals(bid.getRESERVE2())) {
				cell3.setCellValue("其他");
			} else {
				cell3.setCellValue("");
			}
			cell3.setCellStyle(style);
			cell4.setCellValue(nullToStr(bid.getPROJECT_NAME()));
			cell4.setCellStyle(style);
//			cell5.setCellValue(nullToStr(bid.getAGENT_CO_NAME()));
//			cell5.setCellStyle(style);	
//			cell6.setCellValue(nullToStr(bid.getAGENT_CO_MANAGER()));
//			cell6.setCellStyle(style);
//			cell7.setCellValue("/");
//			cell7.setCellStyle(style);
//			cell8.setCellValue(nullToStr(bid.getBID_AGENT_PAY()));
//			cell8.setCellStyle(style);
//			cell9.setCellValue(nullToStr(bid.getBID_BOND_LIST()));
//			cell9.setCellStyle(style);
//			cell10.setCellValue(StringUtil.BigDecimal2Str(bid.getPROJ_ASTRICT_PRICE_WANYUAN(), 2));
//			cell10.setCellStyle(style);
			cell11.setCellValue(nullToStr(bid.getBID_CO_NAME()));
			cell11.setCellStyle(style);
			cell12.setCellValue(nullToStr(bid.getBID_PRICE_LIST()));
			cell12.setCellStyle(style);
			cell13.setCellValue(StringUtil.BigDecimal2Str(bid.getBID_APPLY_PRICE(), 2));
			cell13.setCellStyle(style);
//			cell14.setCellValue(StringUtil.BigDecimal2Str(bid.getBID_AGENT_PRICE_WANYUAN2(), 2));
//			cell14.setCellStyle(style);
//			cell15.setCellValue(StringUtil.BigDecimal2Str(bid.getBID_COMMISION(), 2));
//			cell15.setCellStyle(style);
//			cell16.setCellValue(nullToStr(bid.getPROJECT_MANAGER()));
//			cell16.setCellStyle(style);
//			cell17.setCellValue(DateUtil.dateToStr(bid.getRESERVE_DATE1(), format));
//			cell17.setCellStyle(style);
//			cell18.setCellValue(DateUtil.dateToStr(bid.getSUBMIT_DATE(), format));
//			cell18.setCellStyle(style);
//			cell19.setCellValue(DateUtil.dateToStr(bid.getSUBMIT_DATE2(), format));
//			cell19.setCellStyle(style);
//			cell20.setCellValue(DateUtil.dateToStr(bid.getBID_NOTICE_DATE(), format));
//			cell20.setCellStyle(style);
//			cell21.setCellValue(DateUtil.dateToStr(bid.getBID_NOTICE_DATE2(), format));
//			cell21.setCellStyle(style);
			cell22.setCellValue("/");
			cell22.setCellStyle(style);
			cell23.setCellValue(DateUtil.dateToStr(bid.getBID_MESSAGE_DATE(), format));
			cell23.setCellStyle(style);
			cell24.setCellValue(DateUtil.dateToStr(bid.getRESERVE_DATE4(), format));
			cell24.setCellStyle(style);
			cell25.setCellValue(DateUtil.dateToStr(bid.getRESERVE_DATE2(), format));
			cell25.setCellStyle(style);
			cell26.setCellValue(DateUtil.dateToStr(bid.getRESERVE_DATE3(), format));
			cell26.setCellStyle(style);
			cell27.setCellValue(DateUtil.dateToStr(bid.getRESERVE_DATE4(), format));
			cell27.setCellStyle(style);
//			cell28.setCellValue(DateUtil.dateToStr(bid.getRESERVE_DATE7(), format));
//			cell28.setCellStyle(style);
			String fs = bid.getFINISH_STATUS();
			if("1".equals(fs)){
				cell29.setCellValue("完成");
			} else{
				String reserve1 = bid.getRESERVE1();
				if("1".equals(reserve1)){
					cell29.setCellValue("取消");
				} else if("2".equals(reserve1)){
					cell29.setCellValue("失败（开标不满3家）");
				} else if("3".equals(reserve1)){
					cell29.setCellValue("失败（报名不满3家)");
				} else if("4".equals(reserve1)){
					cell29.setCellValue("失败（评审）");
				} else if("5".equals(reserve1)){
					cell29.setCellValue("终止");
				} else if("6".equals(reserve1)){
					cell29.setCellValue("空白");
				} else {
					cell29.setCellValue("");
				}
			}
			cell29.setCellStyle(style);
			cell30.setCellValue(nullToStr(bid.getFINISH_NOTE()));
			cell30.setCellStyle(style);
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
		for(int i = 0; i < 31; i++) {
			cell2 = row2.createCell(i);
			cell2.setCellStyle(style);
			cell3 = row3.createCell(i);
			cell3.setCellStyle(style);
		}
		
		//编号
		sheet.setColumnWidth(0, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 0, 0));
		XSSFCell cell = row2.createCell(0);
		cell.setCellValue("编号");
		cell.setCellStyle(style);
		//承接项目日期
		sheet.setColumnWidth(1, 25 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 1, 1));
		cell = row2.createCell(1);
		cell.setCellValue("承接项目日期");
		cell.setCellStyle(style);
		//招标编号
		sheet.setColumnWidth(2, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 2, 2));
		cell = row2.createCell(2);
		cell.setCellValue("招标编号");
		cell.setCellStyle(style);
		//项目性质
		sheet.setColumnWidth(3, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 3, 3));
		cell = row2.createCell(3);
		cell.setCellValue("项目性质");
		cell.setCellStyle(style);
		//项目名称
		sheet.setColumnWidth(4, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 4, 4));
		cell = row2.createCell(4);
		cell.setCellValue("项目名称");
		cell.setCellStyle(style);
		//委托单位
		sheet.setColumnWidth(5, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 5, 5));
		cell = row2.createCell(5);
		cell.setCellValue("委托单位");
		cell.setCellStyle(style);
		//联系人
		sheet.setColumnWidth(6, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 6, 6));
		cell = row2.createCell(6);
		cell.setCellValue("联系人");
		cell.setCellStyle(style);
		//会审监管人
		sheet.setColumnWidth(7, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 7, 7));
		cell = row2.createCell(7);
		cell.setCellValue("会审监管人");
		cell.setCellStyle(style);
		//代理费用支付方
		sheet.setColumnWidth(8, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 8, 8));
		cell = row2.createCell(8);
		cell.setCellValue("代理费用支付方");
		cell.setCellStyle(style);
		//保证金金额（万元）
		sheet.setColumnWidth(9, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 9, 9));
		cell = row2.createCell(9);
		cell.setCellValue("保证金金额（万元）");
		cell.setCellStyle(style);
		//限价（万元）
		sheet.setColumnWidth(10, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 10, 10));
		cell = row2.createCell(10);
		cell.setCellValue("限价（万元）");
		cell.setCellStyle(style);
		cell.setCellStyle(style);
		//中标单位
		sheet.setColumnWidth(11, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 11, 11));
		cell = row2.createCell(11);
		cell.setCellValue("中标单位");
		cell.setCellStyle(style);
		//中标价（万元）
		sheet.setColumnWidth(12, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 12, 12));
		cell = row2.createCell(12);
		cell.setCellValue("中标价（万元）");
		cell.setCellStyle(style);
		//收费
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 13, 14));
		cell = row2.createCell(13);
		cell.setCellValue("收费");
		cell.setCellStyle(style);
		//标书费(元）
		sheet.setColumnWidth(13, 15 * 256);
		cell = row3.createCell(13);
		cell.setCellValue("标书费(元）");
		cell.setCellStyle(style);
		//代理费（万元）
		sheet.setColumnWidth(14, 15 * 256);
		cell = row3.createCell(14);
		cell.setCellValue("代理费（万元）");
		cell.setCellStyle(style);
		//专家费（元）
		sheet.setColumnWidth(15, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 15, 15));
		cell = row2.createCell(15);
		cell.setCellValue("专家费（元）");
		cell.setCellStyle(style);
		//工程师
		sheet.setColumnWidth(16, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 16, 16));
		cell = row2.createCell(16);
		cell.setCellValue("工程师");
		cell.setCellStyle(style);
		//开评标时间
		sheet.setColumnWidth(17, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 17, 17));
		cell = row2.createCell(17);
		cell.setCellValue("开评标时间");
		cell.setCellStyle(style);
		//招标公告开始时间
		sheet.setColumnWidth(18, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 18, 18));
		cell = row2.createCell(18);
		cell.setCellValue("招标公告开始时间");
		cell.setCellStyle(style);
		//招标公告结束时间
		sheet.setColumnWidth(19, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 19, 19));
		cell = row2.createCell(19);
		cell.setCellValue("招标公告结束时间");
		cell.setCellStyle(style);
		//中标公示开始时间
		sheet.setColumnWidth(20, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 20, 20));
		cell = row2.createCell(20);
		cell.setCellValue("中标公示开始时间");
		cell.setCellStyle(style);
		//中标公示结束时间
		sheet.setColumnWidth(21, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 21, 21));
		cell = row2.createCell(21);
		cell.setCellValue("中标公示结束时间");
		cell.setCellStyle(style);
		//代理费到账情况
		sheet.setColumnWidth(22, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 22, 22));
		cell = row2.createCell(22);
		cell.setCellValue("代理费到账情况");
		cell.setCellStyle(style);

		//中标文件扫描
		sheet.setColumnWidth(23, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 23, 23));
		cell = row2.createCell(23);
		cell.setCellValue("中标文件扫描");
		cell.setCellStyle(style);
		//评标报告扫描归档
		sheet.setColumnWidth(24, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 24, 24));
		cell = row2.createCell(24);
		cell.setCellValue("评标报告扫描归档");
		cell.setCellStyle(style);
		
		//甲方资料归档
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 25, 27));
		cell = row2.createCell(25);
		cell.setCellValue("甲方资料归档");
		cell.setCellStyle(style);
		//招标文件
		sheet.setColumnWidth(25, 15 * 256);
		cell = row3.createCell(25);
		cell.setCellValue("招标文件");
		cell.setCellStyle(style);
		//投标文件
		sheet.setColumnWidth(26, 15 * 256);
		cell = row3.createCell(26);
		cell.setCellValue("投标文件");
		cell.setCellStyle(style);
		//评标报告
		sheet.setColumnWidth(27, 15 * 256);
		cell = row3.createCell(27);
		cell.setCellValue("评标报告");
		cell.setCellStyle(style);
		//失败项目日期
		sheet.setColumnWidth(28, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 28, 28));
		cell = row2.createCell(28);
		cell.setCellValue("失败项目日期");
		cell.setCellStyle(style);
		//项目完成情况
		sheet.setColumnWidth(29, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 29, 29));
		cell = row2.createCell(29);
		cell.setCellValue("项目完成情况");
		cell.setCellStyle(style);
		//备注
		sheet.setColumnWidth(30, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 30, 30));
		cell = row2.createCell(30);
		cell.setCellValue("备注");
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
