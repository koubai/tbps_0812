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
			XSSFCell cell79 = row.createCell(79);
			XSSFCell cell80 = row.createCell(80);
			XSSFCell cell81 = row.createCell(81);
			XSSFCell cell82 = row.createCell(82);
			XSSFCell cell83 = row.createCell(83);
			XSSFCell cell84 = row.createCell(84);
			
			cell0.setCellValue(bid.getCNTRCT_NO());
			cell0.setCellStyle(style);
			cell1.setCellValue(bid.getBID_NO());
			cell1.setCellStyle(style);
			//1：招标，4：竞价，5：电子招标，6：核价竞价，7：公开竞价，9：其他
			if("9".equals(bid.getCNTRCT_TYPE())) {
				cell2.setCellValue("其他：" + bid.getCNTRCT_TYPE_NAME());
			} else {
				if("1".equals(bid.getCNTRCT_TYPE())) {
					cell2.setCellValue("招标");
				} else if("4".equals(bid.getCNTRCT_TYPE())) {
					cell2.setCellValue("竞价");
				} else if("5".equals(bid.getCNTRCT_TYPE())) {
					cell2.setCellValue("电子招标");
				} else if("6".equals(bid.getCNTRCT_TYPE())) {
					cell2.setCellValue("核价竞价");
				} else if("7".equals(bid.getCNTRCT_TYPE())) {
					cell2.setCellValue("公开竞价");
				} else {
					cell2.setCellValue(bid.getCNTRCT_TYPE());
				}
			}
			cell2.setCellStyle(style);
			cell3.setCellValue(bid.getPROJECT_NAME());
			cell3.setCellStyle(style);
			cell4.setCellValue(DateUtil.dateToStr(bid.getPROJECT_DEVIEW_DATE(), format));
			cell4.setCellStyle(style);
			cell5.setCellValue(bid.getPROJECT_PROPERTY_NAME());
			cell5.setCellStyle(style);
			cell6.setCellValue(bid.getPROJ_APPROVAL());
			cell6.setCellStyle(style);
			cell7.setCellValue(bid.getPROJECT_MANAGER_NAME());
			cell7.setCellStyle(style);
			cell8.setCellValue(bid.getBID_COMP_NO());
			cell8.setCellStyle(style);
			cell9.setCellValue(bid.getBID_COMP_NAME());
			cell9.setCellStyle(style);
			cell10.setCellValue(bid.getCO_MANAGER1());
			cell10.setCellStyle(style);
			cell11.setCellValue(bid.getCO_MANAGER_TEL1());
			cell11.setCellStyle(style);
			cell12.setCellValue(bid.getCO_ADDRESS1());
			cell12.setCellStyle(style);
			cell13.setCellValue(bid.getCO_MANAGER_EMAIL1());
			cell13.setCellStyle(style);
			cell14.setCellValue(bid.getPROJECT_AUTH_NAME());
			cell14.setCellStyle(style);
			cell15.setCellValue(bid.getBID_AGENT_PAY2());
			cell15.setCellStyle(style);
			cell16.setCellValue(StringUtil.BigDecimal2Str(bid.getBID_AGENT_PRICE(), 2));
			cell16.setCellStyle(style);
			cell17.setCellValue(StringUtil.BigDecimal2Str(bid.getBID_AGENT_PRICE_ACT(), 2));
			cell17.setCellStyle(style);
			cell18.setCellValue(DateUtil.dateToStr(bid.getRECEIPT1_DATE(), format));
			cell18.setCellStyle(style);
			cell19.setCellValue(DateUtil.dateToStr(bid.getRECEIPT1_VALUE_DATE(), format));
			cell19.setCellStyle(style);
			cell20.setCellValue(bid.getREGISTE_DATE());
			cell20.setCellStyle(style);
			cell21.setCellValue(bid.getAPPLY_REQUIRE());
			cell21.setCellStyle(style);
			cell22.setCellValue(StringUtil.BigDecimal2Str(bid.getBID_BOND(), 2));
			cell22.setCellStyle(style);
			cell23.setCellValue(DateUtil.dateToStr(bid.getTENDER_OPEN_DATE(), format));
			cell23.setCellStyle(style);
			cell24.setCellValue(bid.getTENDER_OPEN_ADDRESS());
			cell24.setCellStyle(style);
			cell25.setCellValue(DateUtil.dateToStr(bid.getTENDER_VERIFY_DATE(), format));
			cell25.setCellStyle(style);
			cell26.setCellValue(bid.getBID_AUTH_NAME());
			cell26.setCellStyle(style);
			cell27.setCellValue(StringUtil.BigDecimal2Str(bid.getBID_LIMIT_PRICE(), 2));
			cell27.setCellStyle(style);
			cell28.setCellValue(bid.getBID_CO_NAME_LIST());
			cell28.setCellStyle(style);
			cell29.setCellValue(bid.getBID_EXPERT_NAME_LIST());
			cell29.setCellStyle(style);
			cell30.setCellValue(bid.getBID_CO_SEQ());
			cell30.setCellStyle(style);
			cell31.setCellValue(bid.getBID_CO_NAME());
			cell31.setCellStyle(style);
			cell32.setCellValue(StringUtil.BigDecimal2Str(bid.getBID_CO_PRICE(), 2));
			cell32.setCellStyle(style);
			cell33.setCellValue(StringUtil.BigDecimal2Str(bid.getBID_PRICE(), 2));
			cell33.setCellStyle(style);
			cell34.setCellValue(bid.getBID_PRICE_LIST());
			cell34.setCellStyle(style);
			cell35.setCellValue(StringUtil.BigDecimal2Str(bid.getBID_EXPERT_COMMISION(), 2));
			cell35.setCellStyle(style);
			cell36.setCellValue(StringUtil.BigDecimal2Str(bid.getBID_EXPERT_COMMISION_PRE_YUAN_SHOW(), 2));
			cell36.setCellStyle(style);
			cell37.setCellValue(StringUtil.BigDecimal2Str(bid.getBID_EXPERT_COMMISION_ACT_YUAN_SHOW(), 2));
			cell37.setCellStyle(style);
			cell38.setCellValue(DateUtil.dateToStr(bid.getBID_EXPERT_COMMISION_DIFF_DATE(), format));
			cell38.setCellStyle(style);
			cell39.setCellValue(StringUtil.BigDecimal2Str(bid.getBID_APPLY_PRICE(), 2));
			cell39.setCellStyle(style);
			cell40.setCellValue(bid.getBID_EXPERT_COMMISION_APPLY_NAME());
			cell40.setCellStyle(style);
			cell41.setCellValue(DateUtil.dateToStr(bid.getBID_EXPERT_COMMISION_APPLY_DATE(), format));
			cell41.setCellStyle(style);
			cell42.setCellValue(DateUtil.dateToStr(bid.getAPPLY_FORM_EDIT_DATE(), format));
			cell42.setCellStyle(style);
			cell43.setCellValue(DateUtil.dateToStr(bid.getAPPLY_FORM_COLLECT_DATE(), format));
			cell43.setCellStyle(style);
			cell44.setCellValue(DateUtil.dateToStr(bid.getAPPLY_FORM_VERIFY_DATE(), format));
			cell44.setCellStyle(style);
			cell45.setCellValue(bid.getAPPLY_FORM_VERIFY());
			cell45.setCellStyle(style);
			cell46.setCellValue(DateUtil.dateToStr(bid.getAPPLY_FORM_FIX_DATE(), format));
			cell46.setCellStyle(style);
			cell47.setCellValue(DateUtil.dateToStr(bid.getAPPLY_FORM_BOX_DATE(), format));
			cell47.setCellStyle(style);
			cell48.setCellValue(DateUtil.dateToStr(bid.getSUPPORT_DOC_DATE(), format));
			cell48.setCellStyle(style);
			cell49.setCellValue(DateUtil.dateToStr(bid.getBID_NOTICE_ST_DATE(), format));
			cell49.setCellStyle(style);
			cell50.setCellValue(DateUtil.dateToStr(bid.getBID_NOTICE_ED_DATE(), format));
			cell50.setCellStyle(style);
			cell51.setCellValue(DateUtil.dateToStr(bid.getBID_MESSAGE_DATE(), format));
			cell51.setCellStyle(style);
			cell52.setCellValue(DateUtil.dateToStr(bid.getBID_DOC_DELI_DATE1(), format));
			cell52.setCellStyle(style);
			cell53.setCellValue(bid.getBID_DOC_DELI_FILE1());
			cell53.setCellStyle(style);
			cell54.setCellValue(DateUtil.dateToStr(bid.getBID_DOC_DELI_DATE2(), format));
			cell54.setCellStyle(style);
			cell55.setCellValue(bid.getBID_DOC_DELI_FILE2());
			cell55.setCellStyle(style);
			cell56.setCellValue(DateUtil.dateToStr(bid.getBID_DOC_DELI_DATE3(), format));
			cell56.setCellStyle(style);
			cell57.setCellValue(bid.getBID_DOC_DELI_FILE3());
			cell57.setCellStyle(style);
			cell58.setCellValue(DateUtil.dateToStr(bid.getBID_DOC_DELI_DATE4(), format));
			cell58.setCellStyle(style);
			cell59.setCellValue(bid.getBID_DOC_DELI_FILE4());
			cell59.setCellStyle(style);
			cell60.setCellValue(DateUtil.dateToStr(bid.getBID_DOC_DELI_DATE5(), format));
			cell60.setCellStyle(style);
			cell61.setCellValue(bid.getBID_DOC_DELI_FILE5());
			cell61.setCellStyle(style);
			cell62.setCellValue(DateUtil.dateToStr(bid.getBID_DOC_DELI_DATE6(), format));
			cell62.setCellStyle(style);
			cell63.setCellValue(bid.getBID_DOC_DELI_FILE6());
			cell63.setCellStyle(style);
			cell64.setCellValue(DateUtil.dateToStr(bid.getBID_DOC_DELI_DATE7(), format));
			cell64.setCellStyle(style);
			cell65.setCellValue(bid.getBID_DOC_DELI_FILE7());
			cell65.setCellStyle(style);
			cell66.setCellValue(DateUtil.dateToStr(bid.getBID_DOC_DELI_DATE8(), format));
			cell66.setCellStyle(style);
			cell67.setCellValue(bid.getBID_DOC_DELI_FILE8());
			cell67.setCellStyle(style);
			cell68.setCellValue(DateUtil.dateToStr(bid.getBID_DOC_DELI_DATE9(), format));
			cell68.setCellStyle(style);
			cell69.setCellValue(bid.getBID_DOC_DELI_FILE9());
			cell69.setCellStyle(style);
			cell70.setCellValue(DateUtil.dateToStr(bid.getBID_DOC_DELI_DATE10(), format));
			cell70.setCellStyle(style);
			cell71.setCellValue(bid.getBID_DOC_DELI_FILE10());
			cell71.setCellStyle(style);
			cell72.setCellValue(DateUtil.dateToStr(bid.getBID_INFORM_RCV_DATE(), format));
			cell72.setCellStyle(style);
			cell73.setCellValue(bid.getBID_INFORM_RCV());
			cell73.setCellStyle(style);
			cell74.setCellValue(DateUtil.dateToStr(bid.getBID_VER_DOC_SCAN_DATE(), format));
			cell74.setCellStyle(style);
			cell75.setCellValue(bid.getBID_VER_DOC_SCAN());
			cell75.setCellStyle(style);
			cell76.setCellValue(bid.getPROGRESS_STATUS_NAME());
			cell76.setCellStyle(style);
			cell77.setCellValue(bid.getFINISH_STATUS_NAME());
			cell77.setCellStyle(style);
			cell78.setCellValue(DateUtil.dateToStr(bid.getFINISH_DATE(), format));
			cell78.setCellStyle(style);
			cell79.setCellValue(bid.getFINISH_NOTE());
			cell79.setCellStyle(style);
			cell80.setCellValue(bid.getSTATUS_NAME());
			cell80.setCellStyle(style);
			cell81.setCellValue(bid.getMEMO1());
			cell81.setCellStyle(style);
			cell82.setCellValue(bid.getUPDATE_USER());
			cell82.setCellStyle(style);
			cell83.setCellValue(DateUtil.dateToStr(bid.getINSERT_DATE(), format));
			cell83.setCellStyle(style);
			cell84.setCellValue(DateUtil.dateToStr(bid.getUPDATE_DATE(), format));
			cell84.setCellStyle(style);
		}
	}
	
	/**
	 * 输出Head部分
	 * @param sheet
	 */
	@Override
	public void writeHead(XSSFSheet sheet, XSSFWorkbook workbook) {
		heads = new ArrayList<String>();
		heads.add("合同编号");
		heads.add("招标编号");
		heads.add("分类");
		heads.add("项目名称");
		heads.add("承接项目日期");
		heads.add("项目性质");
		heads.add("工程概况批文");
		heads.add("担当者");
		heads.add("委托公司代码");
		heads.add("委托公司名称");
		heads.add("委托公司联系人");
		heads.add("委托公司电话");
		heads.add("委托公司地址");
		heads.add("委托公司邮箱");
		heads.add("会审监管人");
		heads.add("招标代理支付方");
		heads.add("招标代理费");
		heads.add("实收代理费");
		heads.add("开票日期");
		heads.add("到账日期");
		heads.add("报名日期");
		heads.add("报名要求");
		heads.add("保证金");
		heads.add("开标时间");
		heads.add("开标地点");
		heads.add("评标时间");
		heads.add("评审人");
		heads.add("限价");
		heads.add("投标公司列表");
		heads.add("评审专家列表");
		heads.add("中标公司公司号");
		heads.add("中标公司公司名称");
		heads.add("中标公司标书费");
		heads.add("中标价");
		heads.add("中标价一览");
		heads.add("专家费（元）");
		heads.add("预借专家费（元）");
		heads.add("实际专家费（元）");
		heads.add("差价退还日期");
		heads.add("标书费");
		heads.add("专家费申请人");
		heads.add("专家费申日期");
		heads.add("招标文件编制日期");
		heads.add("招标文件统稿日期");
		heads.add("招标公告，文件校对日期");
		heads.add("招标公告，文件校对者");
		heads.add("招标文件定稿日期");
		heads.add("招标文件装订日期");
		heads.add("发送答疑，补充文件日期");
		heads.add("中标公告日期");
		heads.add("中标公告日期2");
		heads.add("中标通知书发出日");
		heads.add("招投标文件送至甲方日期1");
		heads.add("招投标文件送至甲方文件1");
		heads.add("招投标文件送至甲方日期2");
		heads.add("招投标文件送至甲方文件2");
		heads.add("招投标文件送至甲方日期3");
		heads.add("招投标文件送至甲方文件3");
		heads.add("招投标文件送至甲方日期4");
		heads.add("招投标文件送至甲方文件4");
		heads.add("招投标文件送至甲方日期5");
		heads.add("招投标文件送至甲方文件5");
		heads.add("招投标文件送至甲方日期6");
		heads.add("招投标文件送至甲方文件6");
		heads.add("招投标文件送至甲方日期7");
		heads.add("招投标文件送至甲方文件7");
		heads.add("招投标文件送至甲方日期8");
		heads.add("招投标文件送至甲方文件8");
		heads.add("招投标文件送至甲方日期9");
		heads.add("招投标文件送至甲方文件9");
		heads.add("招投标文件送至甲方日期10");
		heads.add("招投标文件送至甲方文件10");
		heads.add("中标通知书签收日");
		heads.add("中标通知书签收人");
		heads.add("评标报告装订扫描日");
		heads.add("评标报告装订扫描人");
		heads.add("项目进度情况");
		heads.add("项目完成情况");
		heads.add("项目完成日期");
		heads.add("项目完成情况的备注");
		heads.add("投标状态");
		heads.add("备注");
		heads.add("更新者");
		heads.add("新建日期");
		heads.add("更新日期");

		for(int i = 0; i < heads.size(); i++) {
			sheet.setColumnWidth(i, 15 * 256);
		}
		
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
