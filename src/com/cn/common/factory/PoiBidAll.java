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
import com.cn.tbps.dto.BidCompExportDto;
import com.cn.tbps.dto.BidDto;

/**
 * @name PoiBid.java
 * @author Frank
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiBidAll extends Poi2007Base {
	
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
		cell.setCellValue("招标完整信息一览");
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
		BidCompExportDto bidCompExport = new BidCompExportDto();
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
			bidCompExport = (BidCompExportDto) datas.get(i);
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
			XSSFCell cell43 = row.createCell(43);
			XSSFCell cell44 = row.createCell(44);
			XSSFCell cell45 = row.createCell(45);
			XSSFCell cell46 = row.createCell(46);
			XSSFCell cell47 = row.createCell(47);
			XSSFCell cell48 = row.createCell(48);
			XSSFCell cell49 = row.createCell(49);
			XSSFCell cell50 = row.createCell(50);
			XSSFCell cell51 = row.createCell(51);
			XSSFCell cell52 = row.createCell(52);
			XSSFCell cell53 = row.createCell(53);
			XSSFCell cell54 = row.createCell(54);
			XSSFCell cell55 = row.createCell(55);
			XSSFCell cell56 = row.createCell(56);
			XSSFCell cell57 = row.createCell(57);
			XSSFCell cell58 = row.createCell(58);
			XSSFCell cell59 = row.createCell(59);
			XSSFCell cell60 = row.createCell(60);
			XSSFCell cell61 = row.createCell(61);
			XSSFCell cell62 = row.createCell(62);
			XSSFCell cell63 = row.createCell(63);
			//投标公司信息
			XSSFCell cell64 = row.createCell(64);
			XSSFCell cell65 = row.createCell(65);
			XSSFCell cell66 = row.createCell(66);
			XSSFCell cell67 = row.createCell(67);
			XSSFCell cell68 = row.createCell(68);
			XSSFCell cell69 = row.createCell(69);
			XSSFCell cell70 = row.createCell(70);
			XSSFCell cell71 = row.createCell(71);
			XSSFCell cell72 = row.createCell(72);
			XSSFCell cell73 = row.createCell(73);
			XSSFCell cell74 = row.createCell(74);
			XSSFCell cell75 = row.createCell(75);
			XSSFCell cell76 = row.createCell(76);
			XSSFCell cell77 = row.createCell(77);
			XSSFCell cell78 = row.createCell(78);
			
			cell0.setCellValue(bidCompExport.getBID_NO());
			cell0.setCellStyle(style);
			cell1.setCellValue(bidCompExport.getPROJECT_TYPE_NAME());
			cell1.setCellStyle(style);
			cell2.setCellValue(bidCompExport.getPROJECT_NAME());
			cell2.setCellStyle(style);
			cell3.setCellValue(bidCompExport.getPROJECT_MANAGER());
			cell3.setCellStyle(style);
			cell4.setCellValue(DateUtil.dateToStr(bidCompExport.getONLINE_DATE(), format));
			cell4.setCellStyle(style);
			cell5.setCellValue(DateUtil.dateToStr(bidCompExport.getSUBMIT_DATE(), format)+DateUtil.dateToStr(bidCompExport.getSUBMIT_DATE2(), format));
			cell5.setCellStyle(style);
			cell6.setCellValue(DateUtil.dateToStr(bidCompExport.getTENDER_START_DATE(), format));
			cell6.setCellStyle(style);
			cell7.setCellValue(DateUtil.dateToStr(bidCompExport.getTENDER_OPEN_DATE(), format));
			cell7.setCellStyle(style);
			cell8.setCellValue(bidCompExport.getAGENT_NO());
			cell8.setCellStyle(style);
			cell9.setCellValue(bidCompExport.getAGENT_CO_NAME());
			cell9.setCellStyle(style);
			cell10.setCellValue(bidCompExport.getAGENT_CO_MANAGER());
			cell10.setCellStyle(style);
			cell11.setCellValue(bidCompExport.getAGENT_CO_MANAGER_TEL());
			cell11.setCellStyle(style);
			cell12.setCellValue(bidCompExport.getAGENT_CO_POST_ADDRESS());
			cell12.setCellStyle(style);
			cell13.setCellValue(bidCompExport.getAGENT_CO_MAIL());
			cell13.setCellStyle(style);
			cell14.setCellValue(bidCompExport.getPROF_NO());
			cell14.setCellStyle(style);
			cell15.setCellValue(bidCompExport.getPROF_CO_NAME());
			cell15.setCellStyle(style);
			cell16.setCellValue(bidCompExport.getPROF_CO_MANAGER());
			cell16.setCellStyle(style);
			cell17.setCellValue(bidCompExport.getPROF_CO_MANAGER_TEL());
			cell17.setCellStyle(style);
			cell18.setCellValue(bidCompExport.getPROF_CO_POST_ADDRESS());
			cell18.setCellStyle(style);
			cell19.setCellValue(bidCompExport.getPROF_CO_MAIL());
			cell19.setCellStyle(style);
			cell20.setCellValue(bidCompExport.getTENDER_ONLINE());
			cell20.setCellStyle(style);
			cell21.setCellValue(bidCompExport.getTENDER_DOWNLOAD());
			cell21.setCellStyle(style);
			cell22.setCellValue(bidCompExport.getAPPLY_FORM_EDIT());
			cell22.setCellStyle(style);
			cell23.setCellValue(bidCompExport.getAPPLY_FORM_VERIFY());
			cell23.setCellStyle(style);
			cell24.setCellValue(bidCompExport.getAPPLY_FORM_MERGE());
			cell24.setCellStyle(style);
			cell25.setCellValue(bidCompExport.getEXPERT_NAME_OFFERED());
			cell25.setCellStyle(style);
			cell26.setCellValue(bidCompExport.getEXPERT_INFORMED());
			cell26.setCellStyle(style);
			cell27.setCellValue(bidCompExport.getEXPERT_NAME_CONFIRMED());
			cell27.setCellStyle(style);
			cell28.setCellValue(bidCompExport.getCLARIFY_DOC());
			cell28.setCellStyle(style);
			cell29.setCellValue(bidCompExport.getSUPPORT_DOC());
			cell29.setCellStyle(style);
			cell30.setCellValue(bidCompExport.getSUPPORT_DOC_SENT());
			cell30.setCellStyle(style);
			cell31.setCellValue(bidCompExport.getBIDDER_REPLY());
			cell31.setCellStyle(style);
			cell32.setCellValue(bidCompExport.getOPEN_RESULT());
			cell32.setCellStyle(style);
			cell33.setCellValue(bidCompExport.getOPEN_VERIFY());
			cell33.setCellStyle(style);
			cell34.setCellValue(bidCompExport.getINFORM_SENT());
			cell34.setCellStyle(style);
			cell35.setCellValue(bidCompExport.getINFORM_CONTRACT());
			cell35.setCellStyle(style);
			cell36.setCellValue(bidCompExport.getATTACH_POST_A());
			cell36.setCellStyle(style);
			cell37.setCellValue(bidCompExport.getCONTRACT_VERIFY());
			cell37.setCellStyle(style);
			cell38.setCellValue(bidCompExport.getCOMMENT_POST());
			cell38.setCellStyle(style);
			cell39.setCellValue(bidCompExport.getBID_REOPRT_EDIT());
			cell39.setCellStyle(style);
			cell40.setCellValue(bidCompExport.getBID_REPORT_VERIFY());
			cell40.setCellStyle(style);
			cell41.setCellValue(bidCompExport.getBID_REPORT_SENT());
			cell41.setCellStyle(style);
			cell42.setCellValue(bidCompExport.getBID_POST_NO());
			cell42.setCellStyle(style);
			cell43.setCellValue(StringUtil.BigDecimal2Str(bidCompExport.getRECEIPT1_AGENT_COMMISSION(), 2));
			cell43.setCellStyle(style);
			cell44.setCellValue(DateUtil.dateToStr(bidCompExport.getRECEIPT1_DATE(), format));
			cell44.setCellStyle(style);
			cell45.setCellValue(bidCompExport.getRECEIPT1_STAFF());
			cell45.setCellStyle(style);
			cell46.setCellValue(bidCompExport.getRECEIPT1_NO());
			cell46.setCellStyle(style);
			cell47.setCellValue(DateUtil.dateToStr(bidCompExport.getRECEIPT1_VALUE_DATE(), format));
			cell47.setCellStyle(style);
			cell48.setCellValue(StringUtil.BigDecimal2Str(bidCompExport.getBID_COMMISION(), 2));
			cell48.setCellStyle(style);
			cell49.setCellValue(bidCompExport.getRECEIPT1_RECEIVER());
			cell49.setCellStyle(style);
			cell50.setCellValue(bidCompExport.getRECEIPT2_NO());
			cell50.setCellStyle(style);
			cell51.setCellValue(DateUtil.dateToStr(bidCompExport.getRECEIPT2_DATE(), format));
			cell51.setCellStyle(style);
			cell52.setCellValue(bidCompExport.getRECEIPT2_POST_NO());
			cell52.setCellStyle(style);
			cell53.setCellValue(DateUtil.dateToStr(bidCompExport.getRECEIPT2_EXPRESS_DATE(), format));
			cell53.setCellStyle(style);
			cell54.setCellValue(bidCompExport.getMEMO1());
			cell54.setCellStyle(style);
			//评审专家名称列表
			cell55.setCellValue(bidCompExport.getBID_EXPERT_NAME_LIST());
			cell55.setCellStyle(style);
			if(bidCompExport.getBID_CO_SEQ() != null) {
				cell56.setCellValue(bidCompExport.getBID_CO_SEQ());
			} else {
				cell56.setCellValue("");
			}
			cell56.setCellStyle(style);
			cell57.setCellValue(bidCompExport.getBID_CO_NAME());
			cell57.setCellStyle(style);
			//标书费
			cell58.setCellValue(StringUtil.BigDecimal2Str(bidCompExport.getBID_APPLY_PRICE(), 2));
			cell58.setCellStyle(style);
			
			cell59.setCellValue(StringUtil.BigDecimal2Str(bidCompExport.getBID_PRICE(), 2));
			cell59.setCellStyle(style);
			cell60.setCellValue(bidCompExport.getUPDATE_USER());
			cell60.setCellStyle(style);
			cell61.setCellValue(DateUtil.dateToLogintime(bidCompExport.getINSERT_DATE()));
			cell61.setCellStyle(style);
			cell62.setCellValue(DateUtil.dateToLogintime(bidCompExport.getUPDATE_DATE()));
			cell62.setCellStyle(style);
			
			//投标公司信息
			
			if(bidCompExport.getBID_CO_NO() != null) {
				cell63.setCellValue(bidCompExport.getBID_CO_NO());
			} else {
				cell63.setCellValue("");
			}
			cell63.setCellStyle(style);
			cell64.setCellValue(bidCompExport.getBID_CO_NAME_1());
			cell64.setCellStyle(style);
			cell65.setCellValue(bidCompExport.getBID_CO_MANAGER());
			cell65.setCellStyle(style);
			cell66.setCellValue(bidCompExport.getBID_CO_TEL());
			cell66.setCellStyle(style);
			cell67.setCellValue(bidCompExport.getBID_CO_ADD());
			cell67.setCellStyle(style);
			cell68.setCellValue(bidCompExport.getBID_CO_PS());
			cell68.setCellStyle(style);
			cell69.setCellValue(StringUtil.BigDecimal2Str(bidCompExport.getBID_BOND(), 2));
			cell69.setCellStyle(style);
			cell70.setCellValue(bidCompExport.getBID_REFUND_SIGN());
			cell70.setCellStyle(style);
			cell71.setCellValue(bidCompExport.getBID_PAYMENT_TYPE());
			cell71.setCellStyle(style);
			cell72.setCellValue(StringUtil.BigDecimal2Str(bidCompExport.getBID_PRICE_1(), 2));
			cell72.setCellStyle(style);
			cell73.setCellValue(StringUtil.BigDecimal2Str(bidCompExport.getBID_CHECK_PRICE(), 2));
			cell73.setCellStyle(style);
			cell74.setCellValue(bidCompExport.getBID_RESULT());
			cell74.setCellStyle(style);
			cell75.setCellValue(StringUtil.BigDecimal2Str(bidCompExport.getBID_WIN_PRICE(), 2));
			cell75.setCellStyle(style);
			cell76.setCellValue(StringUtil.BigDecimal2Str(bidCompExport.getBID_APPLY_PRICE_1(), 2));
			cell76.setCellStyle(style);
			cell77.setCellValue(DateUtil.dateToStr(bidCompExport.getBID_VALUE_DATE_1(), format));
			cell77.setCellStyle(style);
			cell78.setCellValue(bidCompExport.getBID_RECEIPT_NO());
			cell78.setCellStyle(style);
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
		heads.add("分类");
		sheet.setColumnWidth(1, 15 * 256);
		heads.add("项目名称");
		sheet.setColumnWidth(2, 15 * 256);
		heads.add("担当者");
		sheet.setColumnWidth(3, 15 * 256);
		heads.add("上网日期");
		sheet.setColumnWidth(4, 15 * 256);
		heads.add("报名截止日");
		sheet.setColumnWidth(5, 15 * 256);
		heads.add("发标日期");
		sheet.setColumnWidth(6, 15 * 256);
		heads.add("开标日期");
		sheet.setColumnWidth(7, 15 * 256);
		heads.add("委托公司代码");
		sheet.setColumnWidth(8, 15 * 256);
		heads.add("委托公司名称");
		sheet.setColumnWidth(9, 15 * 256);
		heads.add("委托公司联系人");
		sheet.setColumnWidth(10, 15 * 256);
		heads.add("委托公司电话");
		sheet.setColumnWidth(11, 15 * 256);
		heads.add("委托公司地址");
		sheet.setColumnWidth(12, 15 * 256);
		heads.add("委托公司邮箱");
		sheet.setColumnWidth(13, 15 * 256);
		heads.add("专业公司代码");
		sheet.setColumnWidth(14, 15 * 256);
		heads.add("专业公司名称");
		sheet.setColumnWidth(15, 15 * 256);
		heads.add("专业公司负责人");
		sheet.setColumnWidth(16, 15 * 256);
		heads.add("专业公司电话");
		sheet.setColumnWidth(17, 15 * 256);
		heads.add("专业公司地址");
		sheet.setColumnWidth(18, 15 * 256);
		heads.add("专业公司邮箱");
		sheet.setColumnWidth(19, 15 * 256);
		heads.add("担当者签名");
		sheet.setColumnWidth(20, 15 * 256);
		heads.add("网页下载");
		sheet.setColumnWidth(21, 15 * 256);
		heads.add("报名表式（编制）");
		sheet.setColumnWidth(22, 15 * 256);
		heads.add("报名表式（审核）");
		sheet.setColumnWidth(23, 15 * 256);
		heads.add("报名表式（汇总）");
		sheet.setColumnWidth(24, 15 * 256);
		heads.add("名单提供");
		sheet.setColumnWidth(25, 15 * 256);
		heads.add("通知与否");
		sheet.setColumnWidth(26, 15 * 256);
		heads.add("通知确认");
		sheet.setColumnWidth(27, 15 * 256);
		heads.add("澄清文件");
		sheet.setColumnWidth(28, 15 * 256);
		heads.add("补遗文件");
		sheet.setColumnWidth(29, 15 * 256);
		heads.add("补遗文件发出");
		sheet.setColumnWidth(30, 15 * 256);
		heads.add("投标人回复");
		sheet.setColumnWidth(31, 15 * 256);
		heads.add("公示");
		sheet.setColumnWidth(32, 15 * 256);
		heads.add("公示审核");
		sheet.setColumnWidth(33, 15 * 256);
		heads.add("通知书发出");
		sheet.setColumnWidth(34, 15 * 256);
		heads.add("合同告知书");
		sheet.setColumnWidth(35, 15 * 256);
		heads.add("附件邮甲方");
		sheet.setColumnWidth(36, 15 * 256);
		heads.add("合同审核");
		sheet.setColumnWidth(37, 15 * 256);
		heads.add("意见稿发出");
		sheet.setColumnWidth(38, 15 * 256);
		heads.add("报告编制");
		sheet.setColumnWidth(39, 15 * 256);
		heads.add("报告审核");
		sheet.setColumnWidth(40, 15 * 256);
		heads.add("报告发出");
		sheet.setColumnWidth(41, 15 * 256);
		heads.add("快递编号");
		sheet.setColumnWidth(42, 15 * 256);
		heads.add("代理费");
		sheet.setColumnWidth(43, 15 * 256);
		heads.add("开票日期");
		sheet.setColumnWidth(44, 15 * 256);
		heads.add("开票人");
		sheet.setColumnWidth(45, 15 * 256);
		heads.add("发票号码");
		sheet.setColumnWidth(46, 15 * 256);
		heads.add("到账日期");
		sheet.setColumnWidth(47, 15 * 256);
		heads.add("评标费");
		sheet.setColumnWidth(48, 15 * 256);
		heads.add("接受人");
		sheet.setColumnWidth(49, 15 * 256);
		heads.add("签收单编号");
		sheet.setColumnWidth(50, 15 * 256);
		heads.add("签收时间");
		sheet.setColumnWidth(51, 15 * 256);
		heads.add("快递编号");
		sheet.setColumnWidth(52, 15 * 256);
		heads.add("快递时间");
		sheet.setColumnWidth(53, 15 * 256);
		heads.add("备注");
		sheet.setColumnWidth(54, 15 * 256);
		heads.add("评审专家列表");
		sheet.setColumnWidth(55, 15 * 256);
		heads.add("中标公司公司号");
		sheet.setColumnWidth(56, 15 * 256);
		heads.add("中标公司公司名称");
		sheet.setColumnWidth(57, 15 * 256);
		
		heads.add("中标公司标书费");
		sheet.setColumnWidth(58, 15 * 256);
		
		heads.add("中标公司中标价(万元)");
		sheet.setColumnWidth(59, 15 * 256);
		heads.add("更新者");
		sheet.setColumnWidth(60, 15 * 256);
		heads.add("新建日期");
		sheet.setColumnWidth(61, 15 * 256);
		heads.add("更新日期");
		sheet.setColumnWidth(62, 15 * 256);
		
		//投标公司信息
		heads.add("公司号");
		sheet.setColumnWidth(63, 15 * 256);
		heads.add("公司名称");
		sheet.setColumnWidth(64, 15 * 256);
		heads.add("负责人");
		sheet.setColumnWidth(65, 15 * 256);
		heads.add("联系电话");
		sheet.setColumnWidth(66, 15 * 256);
		heads.add("地址");
		sheet.setColumnWidth(67, 15 * 256);
		heads.add("邮箱");
		sheet.setColumnWidth(68, 15 * 256);
		heads.add("保证金");
		sheet.setColumnWidth(69, 15 * 256);
		heads.add("退还签名");
		sheet.setColumnWidth(70, 15 * 256);
		heads.add("支付形式");
		sheet.setColumnWidth(71, 15 * 256);
		heads.add("投标价");
		sheet.setColumnWidth(72, 15 * 256);
		heads.add("评审价");
		sheet.setColumnWidth(73, 15 * 256);
		heads.add("中标与否");
		sheet.setColumnWidth(74, 15 * 256);
		heads.add("中标价");
		sheet.setColumnWidth(75, 15 * 256);
		heads.add("标书费");
		sheet.setColumnWidth(76, 15 * 256);
		heads.add("到账日期");
		sheet.setColumnWidth(77, 15 * 256);
		heads.add("发票号码");
		sheet.setColumnWidth(78, 15 * 256);
		
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
		
		//投标公司式样
		XSSFCellStyle styleComp = workbook.createCellStyle();
		//水平居中
		styleComp.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		//添加边框
		styleComp.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		styleComp.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		styleComp.setBorderTop(HSSFCellStyle.BORDER_THIN);
		styleComp.setBorderRight(HSSFCellStyle.BORDER_THIN);
		styleComp.setFont(font);
		//背景色
		styleComp.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		styleComp.setFillForegroundColor(new XSSFColor(new java.awt.Color(255, 255, 0)));
		
		XSSFRow row = sheet.createRow(2);
		
		XSSFCell cell = null;
		for(int i = 0; i < heads.size(); i++) {
			cell = row.createCell(i);
			cell.setCellValue(heads.get(i));
			if(i < 63) {
				cell.setCellStyle(style);
			} else {
				cell.setCellStyle(styleComp);
			}
		}
	}
	
	public static void main(String arg[]) {
	}
}
