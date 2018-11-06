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
import com.cn.tbps.dto.BidRptDto;

/**
 * @name PoiBidNeiyeReport
 * @author Pei
 * @time 2018-10-10下午11:48:13
 * @version 1.0
 */
public class PoiBidNeiyeReport extends Poi2007Base {
	
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
		
		String title = "内业数据";
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
		BidRptDto biddata = new BidRptDto();
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
			biddata = (BidRptDto) datas.get(i);
			// 合同编号
			XSSFCell cell0 = row.createCell(0);
			// 承接项目日期
			XSSFCell cell1 = row.createCell(1);
			// 招标编号
			XSSFCell cell2 = row.createCell(2);
			// 分类
			XSSFCell cell3 = row.createCell(3);
			// 项目名称
			XSSFCell cell4 = row.createCell(4);
			// 委托单位
			XSSFCell cell5 = row.createCell(5);
			// 投标单位
			XSSFCell cell6 = row.createCell(6);
			// 中标单位
			XSSFCell cell7 = row.createCell(7);
			// 工程师
			XSSFCell cell8 = row.createCell(8);
			// 开标时间
			XSSFCell cell9 = row.createCell(9);
			// 评标时间
			XSSFCell cell10 = row.createCell(10);
			// 招标公告开始时间
			XSSFCell cell11 = row.createCell(11);
			// 招标公告结束时间
			XSSFCell cell12 = row.createCell(12);
			// 是否二次公告
			XSSFCell cell13 = row.createCell(13);
			// 中标公示开始时间
			XSSFCell cell14 = row.createCell(14);
			// 中标公示结束时间
			XSSFCell cell15 = row.createCell(15);
			// 中标文件扫描
			XSSFCell cell16 = row.createCell(16);
			// 评标报告扫描归档
			XSSFCell cell17 = row.createCell(17);
			// 招投标文件送至甲方
			XSSFCell cell18 = row.createCell(18);
			// 评标报告送至甲方
			XSSFCell cell19 = row.createCell(19);
			// 失败项目日期
			XSSFCell cell20 = row.createCell(20);
			// 项目完成情况
			XSSFCell cell21 = row.createCell(21);
			// 公告打印
			XSSFCell cell22 = row.createCell(22);
			// 编制报名表
			XSSFCell cell23 = row.createCell(23);
			// 编制审核表
			XSSFCell cell24 = row.createCell(24);
			// 招标文件装订
			XSSFCell cell25 = row.createCell(25);
			// 发送答疑、补充文件
			XSSFCell cell26 = row.createCell(26);
			// 专家通知
			XSSFCell cell27 = row.createCell(27);
			// 中标通知书签收及录入
			XSSFCell cell28 = row.createCell(28);
			// 评标报告装订/扫描
			XSSFCell cell29 = row.createCell(29);

			// 合同编号
			cell0.setCellValue(biddata.getCNTRCT_NO());
			cell0.setCellStyle(style);
			// 承接项目日期
			cell1.setCellValue(biddata.getPROJECT_DEVIEW_DATE());
			cell1.setCellStyle(style);
			// 招标编号
			cell2.setCellValue(biddata.getBID_NO());
			cell2.setCellStyle(style);
			// 分类
			cell3.setCellValue(biddata.getCNTRCT_TYPE_NAME());
			cell3.setCellStyle(style);
			// 项目名称
			cell4.setCellValue(biddata.getPROJECT_NAME());
			cell4.setCellStyle(style);
			// 委托单位
			cell5.setCellValue(biddata.getBID_COMP_NAME());
			cell5.setCellStyle(style);
			// 投标单位
			cell6.setCellValue(biddata.getBID_CO_NAME());
			cell6.setCellStyle(style);
			// 中标单位
			cell7.setCellValue(biddata.getBID_CO_NAME());
			cell7.setCellStyle(style);
			// 工程师
			cell8.setCellValue(biddata.getPROJECT_MANAGER_NAME());
			cell8.setCellStyle(style);
			// 开标时间
			if (biddata.getTENDER_OPEN_DATE()!= null)
				cell9.setCellValue(biddata.getTENDER_OPEN_DATE().toString());
			else
				cell9.setCellValue("");
			cell9.setCellStyle(style);
			// 评标时间
			if (biddata.getTENDER_VERIFY_DATE()!= null)
				cell10.setCellValue(biddata.getTENDER_VERIFY_DATE().toString());
			else
				cell10.setCellValue("");
			cell10.setCellStyle(style);
			// 招标公告开始时间
			if (biddata.getREGISTE_ST_DATE1()!= null)
				cell11.setCellValue(biddata.getREGISTE_ST_DATE1().toString());
			else
				cell11.setCellValue("");
			cell11.setCellStyle(style);
			// 招标公告结束时间
			if (biddata.getREGISTE_ED_DATE1()!= null)
				cell12.setCellValue(biddata.getREGISTE_ED_DATE1().toString());
			else
				cell12.setCellValue("");
			cell12.setCellStyle(style);
			// 是否二次公告
			if (StringUtil.isBlank(biddata.getREGISTE_ST_DATE1().toString()))
				cell13.setCellValue("");
			else
				cell13.setCellValue("是");
			cell13.setCellStyle(style);
			// 中标公示开始时间
			if (biddata.getBID_NOTICE_ST_DATE()!= null)
				cell14.setCellValue(biddata.getBID_NOTICE_ST_DATE().toString());
			else
				cell14.setCellValue("");
			cell14.setCellStyle(style);
			// 中标公示结束时间
			if (biddata.getBID_NOTICE_ED_DATE()!= null)
				cell15.setCellValue(biddata.getBID_NOTICE_ED_DATE().toString());
			else
				cell15.setCellValue("");
			cell15.setCellStyle(style);
			// 中标文件扫描
			if (StringUtil.isBlank(biddata.getBID_WIN_DOC_SCAN_FLG()))
				cell16.setCellValue("");
			else{
				if (biddata.getBID_WIN_DOC_SCAN_FLG().equals("0"))
					cell16.setCellValue("无");
				else
					cell16.setCellValue("有");
			}
			cell16.setCellStyle(style);
			// 评标报告扫描归档
			if (biddata.getBID_VER_DOC_SCAN_DATE()!= null)
				cell17.setCellValue(biddata.getBID_VER_DOC_SCAN_DATE().toString());
			else
				cell17.setCellValue("");
			cell17.setCellStyle(style);
			// 招投标文件送至甲方
			if (biddata.getBID_DOC_DELI_DATE1() != null)
				cell18.setCellValue(biddata.getBID_DOC_DELI_DATE1().toString());
			else
				cell18.setCellValue("");
			cell18.setCellStyle(style);
			// 评标报告送至甲方
			if (biddata.getBID_VER_DOC_DELI_DATE1()!= null)
				cell19.setCellValue(biddata.getBID_VER_DOC_DELI_DATE1().toString());
			else
				cell19.setCellValue("");
			cell19.setCellStyle(style);
			// 失败项目日期
			if (biddata.getFINISH_DATE()!= null)
				cell20.setCellValue(biddata.getFINISH_DATE().toString());
			else
				cell20.setCellValue("");
			cell20.setCellStyle(style);
			// 项目完成情况
			cell21.setCellValue(biddata.getFINISH_STATUS_NAME());
			cell21.setCellStyle(style);
			// 公告打印
			if (biddata.getAPPLY_FORM_BOX_DATE()!= null)
				cell22.setCellValue(biddata.getAPPLY_FORM_BOX_DATE().toString());
			else
				cell22.setCellValue("");
			cell22.setCellStyle(style);
			// 编制报名表
			if (biddata.getGEN_REGISTE_RPT_DATE()!= null)
				cell23.setCellValue(biddata.getGEN_REGISTE_RPT_DATE().toString());
			else
				cell23.setCellValue("");
			cell23.setCellStyle(style);
			// 编制审核表
			if (biddata.getGEN_VERIFY_RPT_DATE()!= null)
				cell24.setCellValue(biddata.getGEN_VERIFY_RPT_DATE().toString());
			else
				cell24.setCellValue("");
			cell24.setCellStyle(style);
			// 招标文件装订
			if (biddata.getAPPLY_FORM_BOX_DATE()!= null)
				cell25.setCellValue(biddata.getAPPLY_FORM_BOX_DATE().toString());
			else
				cell25.setCellValue("");
			cell25.setCellStyle(style);
			// 发送答疑、补充文件
			if (biddata.getSUPPORT_DOC_DATE()!= null)
				cell26.setCellValue(biddata.getSUPPORT_DOC_DATE().toString());
			else
				cell26.setCellValue("");
			cell26.setCellStyle(style);
			// 专家通知
			if (biddata.getBID_EXPERT_NOTIFY_DATE()!=null)
				cell27.setCellValue(biddata.getBID_EXPERT_NOTIFY_DATE().toString());
			else
				cell27.setCellValue("");
			cell27.setCellStyle(style);
			// 中标通知书签收及录入
			if (biddata.getBID_INFORM_RCV_DATE() != null)
				cell28.setCellValue(biddata.getBID_INFORM_RCV_DATE().toString());
			else
				cell28.setCellValue("");
			cell28.setCellStyle(style);
			// 评标报告装订/扫描
			if (biddata.getBID_VER_DOC_SCAN_DATE()!= null)
				cell29.setCellValue(biddata.getBID_VER_DOC_SCAN_DATE().toString());
			else
				cell29.setCellValue("");
			cell29.setCellStyle(style);
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
		
		//合同编号
		sheet.setColumnWidth(0, 15 * 256);
		XSSFCell cell = row3.createCell(0);
		cell.setCellValue("合同编号");
		cell.setCellStyle(style);
		
		// 承接项目日期
		sheet.setColumnWidth(1, 15 * 256);
		cell = row3.createCell(1);
		cell.setCellValue("承接项目日期");
		cell.setCellStyle(style);

		// 招标编号
		sheet.setColumnWidth(2, 15 * 256);
		cell = row3.createCell(2);
		cell.setCellValue("招标编号");
		cell.setCellStyle(style);

		// 分类
		sheet.setColumnWidth(3, 15 * 256);
		cell = row3.createCell(3);
		cell.setCellValue("分类");
		cell.setCellStyle(style);

		// 项目性质
		sheet.setColumnWidth(4, 15 * 256);
		cell = row3.createCell(4);
		cell.setCellValue("项目性质");
		cell.setCellStyle(style);

		// 项目名称
		sheet.setColumnWidth(5, 15 * 256);
		cell = row3.createCell(5);
		cell.setCellValue("项目名称");
		cell.setCellStyle(style);
		
		// 委托单位
		sheet.setColumnWidth(6, 15 * 256);
		cell = row3.createCell(6);
		cell.setCellValue("委托单位");
		cell.setCellStyle(style);
		
		// 联系人
		sheet.setColumnWidth(7, 15 * 256);
		cell = row3.createCell(7);
		cell.setCellValue("联系人");
		cell.setCellStyle(style);
		
		// 会审监管人
		sheet.setColumnWidth(8, 15 * 256);
		cell = row3.createCell(8);
		cell.setCellValue("会审监管人");
		cell.setCellStyle(style);
		
		// 代理费用支付方
		sheet.setColumnWidth(9, 15 * 256);
		cell = row3.createCell(9);
		cell.setCellValue("代理费用支付方");
		cell.setCellStyle(style);
		
		// 保证金金额（万元）
		sheet.setColumnWidth(10, 15 * 256);
		cell = row3.createCell(10);
		cell.setCellValue("保证金金额（万元）");
		cell.setCellStyle(style);
		
		// 限价（万元）
		sheet.setColumnWidth(11, 15 * 256);
		cell = row3.createCell(11);
		cell.setCellValue("限价（万元）");
		cell.setCellStyle(style);
		
		// 投标单位
		sheet.setColumnWidth(12, 15 * 256);
		cell = row3.createCell(12);
		cell.setCellValue("投标单位");
		cell.setCellStyle(style);
		
		// 中标单位
		sheet.setColumnWidth(13, 15 * 256);
		cell = row3.createCell(13);
		cell.setCellValue("中标单位");
		cell.setCellStyle(style);
		
		// 中标价（万元）
		sheet.setColumnWidth(14, 15 * 256);
		cell = row3.createCell(14);
		cell.setCellValue("中标价（万元）");
		cell.setCellStyle(style);
		
		// 标书费
		sheet.setColumnWidth(15, 15 * 256);
		cell = row3.createCell(15);
		cell.setCellValue("标书费");
		cell.setCellStyle(style);
		
		// 应收代理费（万元）
		sheet.setColumnWidth(16, 15 * 256);
		cell = row3.createCell(16);
		cell.setCellValue("应收代理费（万元）");
		cell.setCellStyle(style);
		
		// 实收代理费（万元）
		sheet.setColumnWidth(17, 15 * 256);
		cell = row3.createCell(17);
		cell.setCellValue("实收代理费（万元）");
		cell.setCellStyle(style);
		
		// 工程师
		sheet.setColumnWidth(18, 15 * 256);
		cell = row3.createCell(18);
		cell.setCellValue("工程师");
		cell.setCellStyle(style);
		
		// 开标时间
		sheet.setColumnWidth(19, 15 * 256);
		cell = row3.createCell(19);
		cell.setCellValue("开标时间");
		cell.setCellStyle(style);
		
		// 评标时间
		sheet.setColumnWidth(20, 15 * 256);
		cell = row3.createCell(20);
		cell.setCellValue("评标时间");
		cell.setCellStyle(style);
		
		// 招标公告开始时间
		sheet.setColumnWidth(21, 15 * 256);
		cell = row3.createCell(21);
		cell.setCellValue("招标公告开始时间");
		cell.setCellStyle(style);
		
		// 招标公告结束时间
		sheet.setColumnWidth(22, 15 * 256);
		cell = row3.createCell(22);
		cell.setCellValue("招标公告结束时间");
		cell.setCellStyle(style);
		
		// 是否二次公告
		sheet.setColumnWidth(23, 15 * 256);
		cell = row3.createCell(23);
		cell.setCellValue("是否二次公告");
		cell.setCellStyle(style);
		
		// 中标公示开始时间
		sheet.setColumnWidth(24, 15 * 256);
		cell = row3.createCell(24);
		cell.setCellValue("中标公示开始时间");
		cell.setCellStyle(style);
		
		// 中标公示结束时间
		sheet.setColumnWidth(25, 15 * 256);
		cell = row3.createCell(25);
		cell.setCellValue("中标公示结束时间");
		cell.setCellStyle(style);
		
		// 中标文件扫描
		sheet.setColumnWidth(26, 15 * 256);
		cell = row3.createCell(26);
		cell.setCellValue("中标文件扫描");
		cell.setCellStyle(style);
		
		// 评标报告扫描归档
		sheet.setColumnWidth(27, 15 * 256);
		cell = row3.createCell(27);
		cell.setCellValue("评标报告扫描归档");
		cell.setCellStyle(style);
		
		// 招投标文件送至甲方
		sheet.setColumnWidth(28, 15 * 256);
		cell = row3.createCell(28);
		cell.setCellValue("招投标文件送至甲方");
		cell.setCellStyle(style);
		
		// 评标报告送至甲方
		sheet.setColumnWidth(29, 15 * 256);
		cell = row3.createCell(29);
		cell.setCellValue("评标报告送至甲方");
		cell.setCellStyle(style);
		
		// 失败项目日期
		sheet.setColumnWidth(30, 15 * 256);
		cell = row3.createCell(30);
		cell.setCellValue("失败项目日期");
		cell.setCellStyle(style);
		
		// 项目进度
		sheet.setColumnWidth(31, 15 * 256);
		cell = row3.createCell(31);
		cell.setCellValue("项目进度");
		cell.setCellStyle(style);
		
		// 公告打印
		sheet.setColumnWidth(32, 15 * 256);
		cell = row3.createCell(32);
		cell.setCellValue("公告打印");
		cell.setCellStyle(style);
		
		// 编制报名表
		sheet.setColumnWidth(33, 15 * 256);
		cell = row3.createCell(33);
		cell.setCellValue("编制报名表");
		cell.setCellStyle(style);
		
		// 编制审核表
		sheet.setColumnWidth(34, 15 * 256);
		cell = row3.createCell(34);
		cell.setCellValue("编制审核表");
		cell.setCellStyle(style);
		
		// 招标文件装订
		sheet.setColumnWidth(35, 15 * 256);
		cell = row3.createCell(35);
		cell.setCellValue("招标文件装订");
		cell.setCellStyle(style);
		
		// 发送答疑、补充文件
		sheet.setColumnWidth(36, 15 * 256);
		cell = row3.createCell(36);
		cell.setCellValue("发送答疑、补充文件");
		cell.setCellStyle(style);
		
		// 专家通知
		sheet.setColumnWidth(37, 15 * 256);
		cell = row3.createCell(37);
		cell.setCellValue("专家通知");
		cell.setCellStyle(style);
		
		// 中标通知书签收及录入
		sheet.setColumnWidth(38, 15 * 256);
		cell = row3.createCell(38);
		cell.setCellValue("中标通知书签收及录入");
		cell.setCellStyle(style);
		
		// 评标报告装订/扫描
		sheet.setColumnWidth(39, 15 * 256);
		cell = row3.createCell(39);
		cell.setCellValue("评标报告装订/扫描");
		cell.setCellStyle(style);
		
		// 专家费预借日期
		sheet.setColumnWidth(40, 15 * 256);
		cell = row3.createCell(40);
		cell.setCellValue("专家费预借日期");
		cell.setCellStyle(style);
		
		// 专家费预借费用
		sheet.setColumnWidth(41, 15 * 256);
		cell = row3.createCell(41);
		cell.setCellValue("专家费预借费用");
		cell.setCellStyle(style);
		
		// 专家费实际费用
		sheet.setColumnWidth(42, 15 * 256);
		cell = row3.createCell(42);
		cell.setCellValue("专家费实际费用");
		cell.setCellStyle(style);

	}
	
	public static void main(String arg[]) {
	}
}
