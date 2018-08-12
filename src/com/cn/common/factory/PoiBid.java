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
import com.cn.tbps.dto.BidDto;

/**
 * @name PoiBid.java
 * @author Frank
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiBid extends Poi2007Base {
	
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
		cell.setCellValue("招标信息一览");
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
			row = sheet.createRow(i + 3);
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
			
			cell0.setCellValue(bid.getBID_NO());
			cell0.setCellStyle(style);
//			cell1.setCellValue(bid.getPROJECT_TYPE_NAME());
//			cell1.setCellStyle(style);
			cell2.setCellValue(bid.getPROJECT_NAME());
			cell2.setCellStyle(style);
			cell3.setCellValue(bid.getPROJECT_MANAGER());
			cell3.setCellStyle(style);
//			cell4.setCellValue(DateUtil.dateToStr(bid.getONLINE_DATE(), format));
//			cell4.setCellStyle(style);
			// 20160928 pei update -->>
//			if (bid.getONLINE_DATE()== null && bid.getSUBMIT_DATE() != null){
//				cell4.setCellValue(DateUtil.dateToStr(bid.getSUBMIT_DATE(), format));
//				cell4.setCellStyle(style);				
//			}
//			cell5.setCellValue(DateUtil.dateToStr(bid.getSUBMIT_DATE2(), format));
//			cell5.setCellStyle(style);				
			//cell5.setCellValue(DateUtil.dateToStr(bid.getSUBMIT_DATE(), format)+DateUtil.dateToStr(bid.getSUBMIT_DATE2(), format));
			//cell5.setCellStyle(style);
			// 20160928 pei update --<<
//			cell6.setCellValue(DateUtil.dateToStr(bid.getTENDER_START_DATE(), format));
			cell6.setCellStyle(style);
			cell7.setCellValue(DateUtil.dateToStr(bid.getTENDER_OPEN_DATE(), format));
			cell7.setCellStyle(style);
//			cell8.setCellValue(bid.getAGENT_NO());
//			cell8.setCellStyle(style);
//			cell9.setCellValue(bid.getAGENT_CO_NAME());
//			cell9.setCellStyle(style);
//			cell10.setCellValue(bid.getAGENT_CO_MANAGER());
//			cell10.setCellStyle(style);
//			cell11.setCellValue(bid.getAGENT_CO_MANAGER_TEL());
//			cell11.setCellStyle(style);
//			cell12.setCellValue(bid.getAGENT_CO_POST_ADDRESS());
//			cell12.setCellStyle(style);
//			cell13.setCellValue(bid.getAGENT_CO_MAIL());
//			cell13.setCellStyle(style);
//			cell14.setCellValue(bid.getPROF_NO());
//			cell14.setCellStyle(style);
//			cell15.setCellValue(bid.getPROF_CO_NAME());
//			cell15.setCellStyle(style);
//			cell16.setCellValue(bid.getPROF_CO_MANAGER());
//			cell16.setCellStyle(style);
//			cell17.setCellValue(bid.getPROF_CO_MANAGER_TEL());
//			cell17.setCellStyle(style);
//			cell18.setCellValue(bid.getPROF_CO_POST_ADDRESS());
//			cell18.setCellStyle(style);
//			cell19.setCellValue(bid.getPROF_CO_MAIL());
//			cell19.setCellStyle(style);
//			cell20.setCellValue(bid.getTENDER_ONLINE());
//			cell20.setCellStyle(style);
//			cell21.setCellValue(bid.getTENDER_DOWNLOAD());
//			cell21.setCellStyle(style);
//			cell22.setCellValue(bid.getAPPLY_FORM_EDIT());
//			cell22.setCellStyle(style);
//			cell23.setCellValue(bid.getAPPLY_FORM_VERIFY());
//			cell23.setCellStyle(style);
//			cell24.setCellValue(bid.getAPPLY_FORM_MERGE());
//			cell24.setCellStyle(style);
//			cell25.setCellValue(bid.getEXPERT_NAME_OFFERED());
//			cell25.setCellStyle(style);
//			cell26.setCellValue(bid.getEXPERT_INFORMED());
//			cell26.setCellStyle(style);
//			cell27.setCellValue(bid.getEXPERT_NAME_CONFIRMED());
//			cell27.setCellStyle(style);
//			cell28.setCellValue(bid.getCLARIFY_DOC());
//			cell28.setCellStyle(style);
//			cell29.setCellValue(bid.getSUPPORT_DOC());
//			cell29.setCellStyle(style);
//			cell30.setCellValue(bid.getSUPPORT_DOC_SENT());
//			cell30.setCellStyle(style);
//			cell31.setCellValue(bid.getBIDDER_REPLY());
//			cell31.setCellStyle(style);
//			cell32.setCellValue(bid.getOPEN_RESULT());
//			cell32.setCellStyle(style);
//			cell33.setCellValue(bid.getOPEN_VERIFY());
//			cell33.setCellStyle(style);
//			cell34.setCellValue(bid.getINFORM_SENT());
//			cell34.setCellStyle(style);
//			cell35.setCellValue(bid.getINFORM_CONTRACT());
//			cell35.setCellStyle(style);
//			cell36.setCellValue(bid.getATTACH_POST_A());
//			cell36.setCellStyle(style);
//			cell37.setCellValue(bid.getCONTRACT_VERIFY());
//			cell37.setCellStyle(style);
//			cell38.setCellValue(bid.getCOMMENT_POST());
//			cell38.setCellStyle(style);
//			cell39.setCellValue(bid.getBID_REOPRT_EDIT());
//			cell39.setCellStyle(style);
//			cell40.setCellValue(bid.getBID_REPORT_VERIFY());
//			cell40.setCellStyle(style);
//			cell41.setCellValue(bid.getBID_REPORT_SENT());
//			cell41.setCellStyle(style);
//			cell42.setCellValue(bid.getBID_POST_NO());
//			cell42.setCellStyle(style);
//			cell43.setCellValue(StringUtil.BigDecimal2Str(bid.getRECEIPT1_AGENT_COMMISSION(), 2));
//			cell43.setCellStyle(style);
//			cell44.setCellValue(DateUtil.dateToStr(bid.getRECEIPT1_DATE(), format));
//			cell44.setCellStyle(style);
//			cell45.setCellValue(bid.getRECEIPT1_STAFF());
//			cell45.setCellStyle(style);
//			cell46.setCellValue(bid.getRECEIPT1_NO());
//			cell46.setCellStyle(style);
			cell47.setCellValue(DateUtil.dateToStr(bid.getRECEIPT1_VALUE_DATE(), format));
			cell47.setCellStyle(style);
//			cell48.setCellValue(StringUtil.BigDecimal2Str(bid.getBID_COMMISION(), 2));
//			cell48.setCellStyle(style);
//			cell49.setCellValue(bid.getRECEIPT1_RECEIVER());
//			cell49.setCellStyle(style);
//			cell50.setCellValue(bid.getRECEIPT2_NO());
//			cell50.setCellStyle(style);
//			cell51.setCellValue(DateUtil.dateToStr(bid.getRECEIPT2_DATE(), format));
//			cell51.setCellStyle(style);
//			cell52.setCellValue(bid.getRECEIPT2_POST_NO());
//			cell52.setCellStyle(style);
//			cell53.setCellValue(DateUtil.dateToStr(bid.getRECEIPT2_EXPRESS_DATE(), format));
//			cell53.setCellStyle(style);
//			cell54.setCellValue(bid.getMEMO1());
//			cell54.setCellStyle(style);
//			//投标公司名称列表
//			cell55.setCellValue(bid.getBID_CO_NAME_LIST());
//			cell55.setCellStyle(style);
//			//评审专家名称列表
//			cell56.setCellValue(bid.getBID_EXPERT_NAME_LIST());
//			cell56.setCellStyle(style);
			if(bid.getBID_CO_SEQ() != null) {
				cell57.setCellValue(bid.getBID_CO_SEQ());
			} else {
				cell57.setCellValue("");
			}
			cell57.setCellStyle(style);
			cell58.setCellValue(bid.getBID_CO_NAME());
			cell58.setCellStyle(style);
			//标书费
			cell59.setCellValue(StringUtil.BigDecimal2Str(bid.getBID_APPLY_PRICE(), 2));
			cell59.setCellStyle(style);
			
//			cell60.setCellValue(StringUtil.BigDecimal2Str(bid.getBID_PRICE(), 2));
			cell60.setCellValue(bid.getBID_PRICE_LIST());
			cell60.setCellStyle(style);
			cell61.setCellValue(bid.getUPDATE_USER());
			cell61.setCellStyle(style);
			cell62.setCellValue(DateUtil.dateToLogintime(bid.getINSERT_DATE()));
			cell62.setCellStyle(style);
			cell63.setCellValue(DateUtil.dateToLogintime(bid.getUPDATE_DATE()));
			cell63.setCellStyle(style);
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
		heads.add("投标公司列表");
		sheet.setColumnWidth(55, 15 * 256);
		heads.add("评审专家列表");
		sheet.setColumnWidth(56, 15 * 256);
		heads.add("中标公司公司号");
		sheet.setColumnWidth(57, 15 * 256);
		heads.add("中标公司公司名称");
		sheet.setColumnWidth(58, 15 * 256);
		
		heads.add("中标公司标书费");
		sheet.setColumnWidth(59, 15 * 256);
		
		heads.add("中标公司中标价(万元)");
		sheet.setColumnWidth(60, 15 * 256);
		heads.add("更新者");
		sheet.setColumnWidth(61, 15 * 256);
		heads.add("新建日期");
		sheet.setColumnWidth(62, 15 * 256);
		heads.add("更新日期");
		sheet.setColumnWidth(63, 15 * 256);
		
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
