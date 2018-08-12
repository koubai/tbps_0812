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
import com.cn.tbps.dto.BidHistDto;

/**
 * @name PoiBidHist.java
 * @author Frank
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiBidHist extends Poi2007Base {
	
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
		
		String title = "招标履历一览";
		if(datas != null && datas.size() > 0) {
			BidHistDto bid = (BidHistDto) datas.get(0);
			title += "（" + bid.getBID_NO() + "）";
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
		BidHistDto bid = new BidHistDto();
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
			bid = (BidHistDto) datas.get(i);
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
			XSSFCell cell34 = row.createCell(34);
			XSSFCell cell35 = row.createCell(35);
			XSSFCell cell36 = row.createCell(36);
			XSSFCell cell37 = row.createCell(37);
			XSSFCell cell38 = row.createCell(38);
			XSSFCell cell39 = row.createCell(39);
			XSSFCell cell40 = row.createCell(40);
			XSSFCell cell41 = row.createCell(41);
			XSSFCell cell42 = row.createCell(42);
			
			cell0.setCellValue(bid.getUPDATE_USER());
			cell0.setCellStyle(style);
			cell1.setCellValue(DateUtil.dateToLongStr(bid.getUPDATE_DATE()));
			cell1.setCellStyle(style);
			cell2.setCellValue(bid.getBID_NO());
			cell2.setCellStyle(style);
//			if("1".equals(bid.getPROJECT_TYPE())) {
//				cell3.setCellValue("招标");
//			} else if("2".equals(bid.getPROJECT_TYPE())) {
//				cell3.setCellValue("比选");
//			} else if("3".equals(bid.getPROJECT_TYPE())) {
//				cell3.setCellValue("招标办");
//			} else {
//				cell3.setCellValue("");
//			}
			cell3.setCellStyle(style);
			cell4.setCellValue(bid.getPROJECT_NAME());
			cell4.setCellStyle(style);
//			cell5.setCellValue(bid.getAGENT_NO());
//			cell5.setCellStyle(style);
//			cell6.setCellValue(bid.getAGENT_CO_NAME());
//			cell6.setCellStyle(style);
//			cell7.setCellValue(bid.getAGENT_CO_MANAGER_TEL());
//			cell7.setCellStyle(style);
//			cell8.setCellValue(bid.getPROJECT_MANAGER());
//			cell8.setCellStyle(style);
//			cell9.setCellValue(DateUtil.dateToStr(bid.getTENDER_START_DATE(), format));
//			cell9.setCellStyle(style);
//			cell10.setCellValue(DateUtil.dateToStr(bid.getTENDER_OPEN_DATE(), format));
//			cell10.setCellStyle(style);
//			cell11.setCellValue(bid.getTENDER_ONLINE());
//			cell11.setCellStyle(style);
//			cell12.setCellValue(bid.getTENDER_DOWNLOAD());
//			cell12.setCellStyle(style);
//			cell13.setCellValue(bid.getAPPLY_FORM_EDIT());
//			cell13.setCellStyle(style);
//			cell14.setCellValue(bid.getAPPLY_FORM_VERIFY());
//			cell14.setCellStyle(style);
//			cell15.setCellValue(bid.getAPPLY_FORM_MERGE());
//			cell15.setCellStyle(style);
//			cell16.setCellValue(bid.getEXPERT_NAME_OFFERED());
//			cell16.setCellStyle(style);
//			cell17.setCellValue(bid.getEXPERT_INFORMED());
//			cell17.setCellStyle(style);
//			cell18.setCellValue(bid.getEXPERT_NAME_CONFIRMED());
//			cell18.setCellStyle(style);
//			cell19.setCellValue(bid.getCLARIFY_DOC());
//			cell19.setCellStyle(style);
//			cell20.setCellValue(bid.getSUPPORT_DOC());
//			cell20.setCellStyle(style);
//			cell21.setCellValue(bid.getSUPPORT_DOC_SENT());
//			cell21.setCellStyle(style);
//			cell22.setCellValue(bid.getBIDDER_REPLY());
//			cell22.setCellStyle(style);
//			cell23.setCellValue(bid.getOPEN_RESULT());
//			cell23.setCellStyle(style);
//			cell24.setCellValue(bid.getOPEN_VERIFY());
//			cell24.setCellStyle(style);
//			cell25.setCellValue(bid.getINFORM_SENT());
//			cell25.setCellStyle(style);
//			cell26.setCellValue(bid.getINFORM_CONTRACT());
//			cell26.setCellStyle(style);
//			cell27.setCellValue(bid.getATTACH_POST_A());
//			cell27.setCellStyle(style);
//			cell28.setCellValue(bid.getCONTRACT_VERIFY());
//			cell28.setCellStyle(style);
//			cell29.setCellValue(bid.getCOMMENT_POST());
//			cell29.setCellStyle(style);
//			cell30.setCellValue(bid.getBID_REOPRT_EDIT());
//			cell30.setCellStyle(style);
//			cell31.setCellValue(bid.getBID_REPORT_VERIFY());
//			cell31.setCellStyle(style);
//			cell32.setCellValue(bid.getBID_REPORT_SENT());
//			cell32.setCellStyle(style);
//			cell33.setCellValue(StringUtil.BigDecimal2Str(bid.getRECEIPT1_AGENT_COMMISSION(), 2));
//			cell33.setCellStyle(style);
//			cell34.setCellValue(DateUtil.dateToStr(bid.getRECEIPT1_DATE(), format));
//			cell34.setCellStyle(style);
//			cell35.setCellValue(bid.getRECEIPT1_STAFF());
//			cell35.setCellStyle(style);
//			cell36.setCellValue(bid.getRECEIPT1_NO());
//			cell36.setCellStyle(style);
//			cell37.setCellValue(bid.getRECEIPT1_RECEIVER());
//			cell37.setCellStyle(style);
//			cell38.setCellValue(bid.getRECEIPT2_NO());
//			cell38.setCellStyle(style);
//			cell39.setCellValue(DateUtil.dateToStr(bid.getRECEIPT2_DATE(), format));
//			cell39.setCellStyle(style);
//			cell40.setCellValue(bid.getRECEIPT2_POST_NO());
//			cell40.setCellStyle(style);
//			cell41.setCellValue(DateUtil.dateToStr(bid.getRECEIPT2_EXPRESS_DATE(), format));
//			cell41.setCellStyle(style);
			cell42.setCellValue(bid.getMEMO1());
			cell42.setCellStyle(style);
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
		for(int i = 0; i < 43; i++) {
			cell2 = row2.createCell(i);
			cell2.setCellStyle(style);
			cell3 = row3.createCell(i);
			cell3.setCellStyle(style);
		}
		
		//更新者
		sheet.setColumnWidth(0, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 0, 0));
		XSSFCell cell = row2.createCell(0);
		cell.setCellValue("更新者");
		cell.setCellStyle(style);
		//更新日期
		sheet.setColumnWidth(1, 25 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 1, 1));
		cell = row2.createCell(1);
		cell.setCellValue("更新日期");
		cell.setCellStyle(style);
		//招标编号
		sheet.setColumnWidth(2, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 2, 2));
		cell = row2.createCell(2);
		cell.setCellValue("招标编号");
		cell.setCellStyle(style);
		//分类
		sheet.setColumnWidth(3, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 3, 3));
		cell = row2.createCell(3);
		cell.setCellValue("分类");
		cell.setCellStyle(style);
		//项目名称
		sheet.setColumnWidth(4, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 4, 4));
		cell = row2.createCell(4);
		cell.setCellValue("项目名称");
		cell.setCellStyle(style);
		
		//委托公司
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 5, 7));
		cell = row2.createCell(5);
		cell.setCellValue("委托公司");
		cell.setCellStyle(style);
		//代码
		sheet.setColumnWidth(5, 15 * 256);
		cell = row3.createCell(5);
		cell.setCellValue("代码");
		cell.setCellStyle(style);
		//名称
		sheet.setColumnWidth(6, 15 * 256);
		cell = row3.createCell(6);
		cell.setCellValue("名称");
		cell.setCellStyle(style);
		//电话
		sheet.setColumnWidth(7, 15 * 256);
		cell = row3.createCell(7);
		cell.setCellValue("电话");
		cell.setCellStyle(style);
		
		//担当者
		sheet.setColumnWidth(8, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 8, 8));
		cell = row2.createCell(8);
		cell.setCellValue("担当者");
		cell.setCellStyle(style);
		//发标日期
		sheet.setColumnWidth(9, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 9, 9));
		cell = row2.createCell(9);
		cell.setCellValue("发标日期");
		cell.setCellStyle(style);
		//开标日期
		sheet.setColumnWidth(10, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 10, 10));
		cell = row2.createCell(10);
		cell.setCellValue("开标日期");
		cell.setCellStyle(style);
		//上网公告
		sheet.setColumnWidth(11, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 11, 11));
		cell = row2.createCell(11);
		cell.setCellValue("上网公告");
		cell.setCellStyle(style);
		//网页下载
		sheet.setColumnWidth(12, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 12, 12));
		cell = row2.createCell(12);
		cell.setCellValue("网页下载");
		cell.setCellStyle(style);
		//报名表式（编制）
		sheet.setColumnWidth(13, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 13, 13));
		cell = row2.createCell(13);
		cell.setCellValue("报名表式（编制）");
		cell.setCellStyle(style);
		//报名表式（审核）
		sheet.setColumnWidth(14, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 14, 14));
		cell = row2.createCell(14);
		cell.setCellValue("报名表式（审核）");
		cell.setCellStyle(style);
		//报名表式（汇总）
		sheet.setColumnWidth(15, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 15, 15));
		cell = row2.createCell(15);
		cell.setCellValue("报名表式（汇总）");
		cell.setCellStyle(style);
		
		//专家
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 16, 18));
		cell = row2.createCell(16);
		cell.setCellValue("专家");
		cell.setCellStyle(style);
		//名单提供
		sheet.setColumnWidth(16, 15 * 256);
		cell = row3.createCell(16);
		cell.setCellValue("名单提供");
		cell.setCellStyle(style);
		//通知与否
		sheet.setColumnWidth(17, 15 * 256);
		cell = row3.createCell(17);
		cell.setCellValue("通知与否");
		cell.setCellStyle(style);
		//通知确认
		sheet.setColumnWidth(18, 15 * 256);
		cell = row3.createCell(18);
		cell.setCellValue("通知确认");
		cell.setCellStyle(style);
		
		//澄清文件
		sheet.setColumnWidth(19, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 19, 19));
		cell = row2.createCell(19);
		cell.setCellValue("澄清文件");
		cell.setCellStyle(style);
		//补遗文件
		sheet.setColumnWidth(20, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 20, 20));
		cell = row2.createCell(20);
		cell.setCellValue("补遗文件");
		cell.setCellStyle(style);
		//补遗文件发出
		sheet.setColumnWidth(21, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 21, 21));
		cell = row2.createCell(21);
		cell.setCellValue("补遗文件发出");
		cell.setCellStyle(style);
		//投标人回复
		sheet.setColumnWidth(22, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 22, 22));
		cell = row2.createCell(22);
		cell.setCellValue("投标人回复");
		cell.setCellStyle(style);
		
		//中标
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 23, 26));
		cell = row2.createCell(23);
		cell.setCellValue("中标");
		cell.setCellStyle(style);
		//公示
		sheet.setColumnWidth(23, 15 * 256);
		cell = row3.createCell(23);
		cell.setCellValue("公示");
		cell.setCellStyle(style);
		//公示审核
		sheet.setColumnWidth(24, 15 * 256);
		cell = row3.createCell(24);
		cell.setCellValue("公示审核");
		cell.setCellStyle(style);
		//通知书发出
		sheet.setColumnWidth(25, 15 * 256);
		cell = row3.createCell(25);
		cell.setCellValue("通知书发出");
		cell.setCellStyle(style);
		//合同告知书
		sheet.setColumnWidth(26, 15 * 256);
		cell = row3.createCell(26);
		cell.setCellValue("合同告知书");
		cell.setCellStyle(style);
		
		//合同
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 27, 29));
		cell = row2.createCell(27);
		cell.setCellValue("合同");
		cell.setCellStyle(style);
		//附件邮甲方
		sheet.setColumnWidth(27, 15 * 256);
		cell = row3.createCell(27);
		cell.setCellValue("附件邮甲方");
		cell.setCellStyle(style);
		//合同审核
		sheet.setColumnWidth(28, 15 * 256);
		cell = row3.createCell(28);
		cell.setCellValue("合同审核");
		cell.setCellStyle(style);
		//意见稿发出
		sheet.setColumnWidth(29, 15 * 256);
		cell = row3.createCell(29);
		cell.setCellValue("意见稿发出");
		cell.setCellStyle(style);
		
		//评标报告
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 30, 32));
		cell = row2.createCell(30);
		cell.setCellValue("评标报告");
		cell.setCellStyle(style);
		//报告编制
		sheet.setColumnWidth(30, 15 * 256);
		cell = row3.createCell(30);
		cell.setCellValue("报告编制");
		cell.setCellStyle(style);
		//报告审核
		sheet.setColumnWidth(31, 15 * 256);
		cell = row3.createCell(31);
		cell.setCellValue("报告审核");
		cell.setCellStyle(style);
		//报告发出
		sheet.setColumnWidth(32, 15 * 256);
		cell = row3.createCell(32);
		cell.setCellValue("报告发出");
		cell.setCellStyle(style);
		
		//发票1
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 33, 36));
		cell = row2.createCell(33);
		cell.setCellValue("发票1");
		cell.setCellStyle(style);
		//代理费
		sheet.setColumnWidth(33, 15 * 256);
		cell = row3.createCell(33);
		cell.setCellValue("代理费");
		cell.setCellStyle(style);
		//开票日期
		sheet.setColumnWidth(34, 15 * 256);
		cell = row3.createCell(34);
		cell.setCellValue("开票日期");
		cell.setCellStyle(style);
		//开票人
		sheet.setColumnWidth(35, 15 * 256);
		cell = row3.createCell(35);
		cell.setCellValue("开票人");
		cell.setCellStyle(style);
		//发票号码
		sheet.setColumnWidth(36, 15 * 256);
		cell = row3.createCell(36);
		cell.setCellValue("发票号码");
		cell.setCellStyle(style);
		
		//发票2
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 37, 41));
		cell = row2.createCell(37);
		cell.setCellValue("发票2");
		cell.setCellStyle(style);
		//接受人
		sheet.setColumnWidth(37, 15 * 256);
		cell = row3.createCell(37);
		cell.setCellValue("接受人");
		cell.setCellStyle(style);
		//签收单编号
		sheet.setColumnWidth(38, 15 * 256);
		cell = row3.createCell(38);
		cell.setCellValue("签收单编号");
		cell.setCellStyle(style);
		//签收时间
		sheet.setColumnWidth(39, 15 * 256);
		cell = row3.createCell(39);
		cell.setCellValue("签收时间");
		cell.setCellStyle(style);
		//快递编号
		sheet.setColumnWidth(40, 15 * 256);
		cell = row3.createCell(40);
		cell.setCellValue("快递编号");
		cell.setCellStyle(style);
		//快递时间
		sheet.setColumnWidth(41, 15 * 256);
		cell = row3.createCell(41);
		cell.setCellValue("快递时间");
		cell.setCellStyle(style);
		
		//备注1
		sheet.setColumnWidth(42, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 42, 42));
		cell = row2.createCell(42);
		cell.setCellValue("备注1");
		cell.setCellStyle(style);
	}
	
	public static void main(String arg[]) {
	}
}
