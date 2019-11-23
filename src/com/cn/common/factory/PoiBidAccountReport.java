package com.cn.common.factory;

import java.text.SimpleDateFormat;

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
import com.cn.common.util.TbpsUtil;
import com.cn.tbps.dto.BidRptDto;
import com.cn.tbps.dto.BondDto;

/**
 * @name PoiBidAccountReport
 * @author Pei 合同报告
 * @time 2018-10-14下午11:48:13
 * @version 1.0
 */
public class PoiBidAccountReport extends Poi2007Base {
	
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
		
		String title = "财务数据";
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
		SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd");
		
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
			// 代理费用支付方
			XSSFCell cell6 = row.createCell(6);
			// 保证金金额（万元）
			XSSFCell cell7 = row.createCell(7);
			// 投标单位
			XSSFCell cell8 = row.createCell(8);
			// 中标单位
			XSSFCell cell9 = row.createCell(9);
			// 中标价（万元）
			XSSFCell cell10 = row.createCell(10);
			// 标书费
			XSSFCell cell11 = row.createCell(11);
			// 应收代理费（万元）
			XSSFCell cell12 = row.createCell(12);
			// 实收代理费（万元）
			XSSFCell cell13 = row.createCell(13);
			// 工程师
			XSSFCell cell14 = row.createCell(14);
			// 开标时间
			XSSFCell cell15 = row.createCell(15);
			// 专家费预借日期
			XSSFCell cell16 = row.createCell(16);
			// 专家费预借费用
			XSSFCell cell17 = row.createCell(17);
			// 专家费实际费用
			XSSFCell cell18 = row.createCell(18);
			// 专家费差价退还日期
			XSSFCell cell19 = row.createCell(19);
			// 保证金支付形式
			XSSFCell cell20 = row.createCell(20);
			// 保证金入账日期
			XSSFCell cell21 = row.createCell(21);
			// 保证金退还日期
			XSSFCell cell22 = row.createCell(22);
			// 标书费入账日期
			XSSFCell cell23 = row.createCell(23);
			// 标书费开票形式
			XSSFCell cell24 = row.createCell(24);
			// 标书费开票日期
			XSSFCell cell25 = row.createCell(25);
			// 标书费发票编号
			XSSFCell cell26 = row.createCell(26);
			// 代理费开票日期
			XSSFCell cell27 = row.createCell(27);
			// 代理费发票编号
			XSSFCell cell28 = row.createCell(28);
			// 代理费入账日期
			XSSFCell cell29 = row.createCell(29);
			
			// 合同编号
			cell0.setCellValue(TbpsUtil.obj2string(biddata.getCNTRCT_NO()));
			cell0.setCellStyle(style);
			// 承接项目日期
			cell1.setCellValue(format0.format(biddata.getPROJECT_DEVIEW_DATE()));
			cell1.setCellStyle(style);
			// 招标编号
			cell2.setCellValue(TbpsUtil.obj2string(biddata.getBID_NO()));
			cell2.setCellStyle(style);
			// 分类
			cell3.setCellValue(TbpsUtil.obj2string(biddata.getCNTRCT_TYPE_NAME()));
			cell3.setCellStyle(style);
			// 项目名称
			cell4.setCellValue(TbpsUtil.obj2string(biddata.getPROJECT_NAME()));
			cell4.setCellStyle(style);
			// 委托单位
			cell5.setCellValue(TbpsUtil.obj2string(biddata.getBID_COMP_NAME()));
			cell5.setCellStyle(style);
			// 代理费用支付方
			if (biddata.getBID_AGENT_PAY() == null)
				cell6.setCellValue(TbpsUtil.obj2string(biddata.getBID_AGENT_PAY()));
			else {
				if (biddata.getBID_AGENT_PAY().equals("1"))
					cell6.setCellValue("委托单位");
				if (biddata.getBID_AGENT_PAY().equals("2"))
					cell6.setCellValue("中标单位");
				if (biddata.getBID_AGENT_PAY().equals("3"))
					cell6.setCellValue("申通集团");
				if (biddata.getBID_AGENT_PAY().equals("4"))
					cell6.setCellValue("维保公司");							
			}
//			cell6.setCellValue(biddata.getBID_AGENT_PAY());
			cell6.setCellStyle(style);
			// 保证金金额（万元）
			cell7.setCellValue(StringUtil.BigDecimal2Str(biddata.getBID_BOND(), 2));
			cell7.setCellStyle(style);
			// 投标单位
			cell8.setCellValue(biddata.getBID_CO_NAME());
			cell8.setCellStyle(style);
			// 中标单位
			if (biddata.getBID_RESULT() != null && biddata.getBID_RESULT().equals("1"))
				cell9.setCellValue(biddata.getBID_CO_NAME());
			else 
				cell9.setCellValue("");			
			cell9.setCellStyle(style);
			// 中标价（万元）
			if (biddata.getBID_RESULT() != null && biddata.getBID_RESULT().equals("1"))
				cell10.setCellValue(StringUtil.BigDecimal2Str(biddata.getBID_WIN_PRICE(),2));
			else 
				cell10.setCellValue("");			
			cell10.setCellStyle(style);
			// 标书费
			cell11.setCellValue(StringUtil.BigDecimal2Str(biddata.getBID_APPLY_PRICE(),2));
			cell11.setCellStyle(style);
			// 应收代理费（万元）
			cell12.setCellValue(StringUtil.BigDecimal2Str(biddata.getBID_AGENT_PRICE(),2));
			cell12.setCellStyle(style);
			// 实收代理费（万元）
			cell13.setCellValue(StringUtil.BigDecimal2Str(biddata.getBID_AGENT_PRICE_ACT(),2));
			cell13.setCellStyle(style);
			// 工程师
			cell14.setCellValue(biddata.getPROJECT_MANAGER_NAME());
			cell14.setCellStyle(style);
			// 开标时间
			if (biddata.getTENDER_OPEN_DATE() != null)
				cell15.setCellValue(format0.format(biddata.getTENDER_OPEN_DATE()));
			else
				cell15.setCellValue("");
			cell15.setCellStyle(style);
			// 专家费预借日期
//			cell16.setCellValue(biddata.getBID_EXPERT_COMMISION_PRE_DATE().toString());
			if (biddata.getBID_EXPERT_COMMISION_APPLY_DATE()!= null)
				cell16.setCellValue(format0.format(biddata.getBID_EXPERT_COMMISION_APPLY_DATE()));
			else
				cell16.setCellValue("");
			cell16.setCellStyle(style);
			// 专家费预借费用
			cell17.setCellValue(StringUtil.BigDecimal2Str(biddata.getBID_EXPERT_COMMISION_PRE_YUAN_SHOW(),2));
			cell17.setCellStyle(style);
			// 专家费实际费用
			cell18.setCellValue(StringUtil.BigDecimal2Str(biddata.getBID_EXPERT_COMMISION_ACT_YUAN_SHOW(),2));
			cell18.setCellStyle(style);			
			// 专家费差价退还日期
			if (biddata.getBID_EXPERT_COMMISION_DIFF_DATE()!=null)
				cell19.setCellValue(format0.format(biddata.getBID_EXPERT_COMMISION_DIFF_DATE()));
			else
				cell19.setCellValue("");
			cell19.setCellStyle(style);			
			// 保证金支付形式
			if (biddata.getBID_PAYMENT_TYPE()== null)
				cell20.setCellValue(biddata.getBID_PAYMENT_TYPE());				
			else {
				if (biddata.getBID_PAYMENT_TYPE().equals("1"))
					cell20.setCellValue("现金");
				if (biddata.getBID_PAYMENT_TYPE().equals("2"))
					cell20.setCellValue("支票");
				if (biddata.getBID_PAYMENT_TYPE().equals("3"))
					cell20.setCellValue("转账");
				if (biddata.getBID_PAYMENT_TYPE().equals("4"))
					cell20.setCellValue("汇票");
				if (biddata.getBID_PAYMENT_TYPE().equals("5"))
					cell20.setCellValue("保函");
				if (biddata.getBID_PAYMENT_TYPE().equals("6"))
					cell20.setCellValue("现金2");				
			}
//			cell20.setCellValue(biddata.getBID_PAYMENT_TYPE());
			cell20.setCellStyle(style);			
			// 保证金入账日期
			if (biddata.getBID_VALUE_DATE()!=null)
				cell21.setCellValue(format0.format(biddata.getBID_VALUE_DATE()));
			else
				cell21.setCellValue("");
			cell21.setCellStyle(style);			
			// 保证金退还日期
			if (biddata.getREFOUND_DEPOSIT_DATE()!= null)
				cell22.setCellValue(format0.format(biddata.getREFOUND_DEPOSIT_DATE()));
			else
				cell22.setCellValue("");
			cell22.setCellStyle(style);			
			// 标书费入账日期
			if (biddata.getBID_APPLY_PRICE_DATE()!=null)
				cell23.setCellValue(format0.format(biddata.getBID_APPLY_PRICE_DATE()));
			else
				cell23.setCellValue("");
			cell23.setCellStyle(style);			
			// 标书费开票形式
			if (biddata.getINVOICE_TYPE() == null)
				cell24.setCellValue(biddata.getINVOICE_TYPE());
			else {
				if (biddata.getINVOICE_TYPE().equals("0"))
					cell24.setCellValue("未支付");
				if (biddata.getINVOICE_TYPE().equals("1"))
					cell24.setCellValue("现金");
				if (biddata.getINVOICE_TYPE().equals("3"))
					cell24.setCellValue("转账");								
			}
//			cell24.setCellValue(biddata.getINVOICE_TYPE());
			cell24.setCellStyle(style);			
			// 标书费开票日期
			if (biddata.getINVOICE_DATE()!= null)
				cell25.setCellValue(format0.format(biddata.getINVOICE_DATE()));
			else
				cell25.setCellValue("");
			cell25.setCellStyle(style);			
			// 标书费发票编号
			cell26.setCellValue(biddata.getBID_RECEIPT_NO());
			cell26.setCellStyle(style);			
			// 代理费开票日期
			if (biddata.getRECEIPT1_DATE()!= null)
				cell27.setCellValue(format0.format(biddata.getRECEIPT1_DATE()));
			else 
				cell27.setCellValue("");
			cell27.setCellStyle(style);			
			// 代理费发票编号
			cell28.setCellValue(biddata.getBID_AGENT_PRICE_INVOICE());
			cell28.setCellStyle(style);			
			// 代理费入账日期
			if (biddata.getRECEIPT1_VALUE_DATE()!= null)
				cell29.setCellValue(format0.format(biddata.getRECEIPT1_VALUE_DATE()));
			else
				cell29.setCellValue("");
			cell29.setCellStyle(style);			
		}
		mergeCellData( sheet, workbook, 1, 4);
		mergeCellData( sheet, workbook, 2, 4);
		mergeCellData( sheet, workbook, 3, 4);
		mergeCellData( sheet, workbook, 4, 4);
		mergeCellData( sheet, workbook, 5, 4);
		mergeCellData( sheet, workbook, 6, 4);
		mergeCellData( sheet, workbook, 7, 4);
		mergeCellData( sheet, workbook, 8, 4);
		mergeCellData( sheet, workbook, 9, 4);
		mergeCellData( sheet, workbook, 10, 4);
		mergeCellData( sheet, workbook, 11, 4);
		mergeCellData( sheet, workbook, 12, 4);

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
		for(int i = 0; i < 30; i++) {
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

		// 项目名称
		sheet.setColumnWidth(4, 15 * 256);
		cell = row3.createCell(4);
		cell.setCellValue("项目名称");
		cell.setCellStyle(style);

		// 委托单位
		sheet.setColumnWidth(5, 15 * 256);
		cell = row3.createCell(5);
		cell.setCellValue("委托单位");
		cell.setCellStyle(style);
		
		// 代理费用支付方
		sheet.setColumnWidth(6, 15 * 256);
		cell = row3.createCell(6);
		cell.setCellValue("代理费用支付方");
		cell.setCellStyle(style);
		
		// 保证金金额（万元）
		sheet.setColumnWidth(7, 15 * 256);
		cell = row3.createCell(7);
		cell.setCellValue("保证金金额（万元）");
		cell.setCellStyle(style);
		
		// 投标单位
		sheet.setColumnWidth(8, 15 * 256);
		cell = row3.createCell(8);
		cell.setCellValue("投标单位");
		cell.setCellStyle(style);
		
		// 中标单位
		sheet.setColumnWidth(9, 15 * 256);
		cell = row3.createCell(9);
		cell.setCellValue("中标单位");
		cell.setCellStyle(style);
		
		// 中标价（万元）
		sheet.setColumnWidth(10, 15 * 256);
		cell = row3.createCell(10);
		cell.setCellValue("中标价（万元）");
		cell.setCellStyle(style);
		
		// 标书费
		sheet.setColumnWidth(11, 15 * 256);
		cell = row3.createCell(11);
		cell.setCellValue("标书费");
		cell.setCellStyle(style);
				
		// 应收代理费（万元）
		sheet.setColumnWidth(12, 15 * 256);
		cell = row3.createCell(12);
		cell.setCellValue("应收代理费（万元）");
		cell.setCellStyle(style);
		
		// 实收代理费（万元）
		sheet.setColumnWidth(13, 15 * 256);
		cell = row3.createCell(13);
		cell.setCellValue("实收代理费（万元）");
		cell.setCellStyle(style);
		
		// 工程师
		sheet.setColumnWidth(14, 15 * 256);
		cell = row3.createCell(14);
		cell.setCellValue("工程师");
		cell.setCellStyle(style);
		
		// 开标时间
		sheet.setColumnWidth(15, 15 * 256);
		cell = row3.createCell(15);
		cell.setCellValue("开标时间");
		cell.setCellStyle(style);
		
		// 专家费预借日期
		sheet.setColumnWidth(16, 15 * 256);
		cell = row3.createCell(16);
		cell.setCellValue("专家费预借日期");
		cell.setCellStyle(style);
		
		// 专家费预借费用
		sheet.setColumnWidth(17, 15 * 256);
		cell = row3.createCell(17);
		cell.setCellValue("专家费预借费用（元）");
		cell.setCellStyle(style);
		
		// 专家费实际费用
		sheet.setColumnWidth(18, 15 * 256);
		cell = row3.createCell(18);
		cell.setCellValue("专家费实际费用（元）");
		cell.setCellStyle(style);
		
		// 专家费差价退还日期
		sheet.setColumnWidth(19, 15 * 256);
		cell = row3.createCell(19);
		cell.setCellValue("专家费差价退还日期");
		cell.setCellStyle(style);
		
		// 保证金支付形式
		sheet.setColumnWidth(20, 15 * 256);
		cell = row3.createCell(20);
		cell.setCellValue("保证金支付形式");
		cell.setCellStyle(style);
		
		// 保证金入账日期
		sheet.setColumnWidth(21, 15 * 256);
		cell = row3.createCell(21);
		cell.setCellValue("保证金入账日期");
		cell.setCellStyle(style);
		
		// 保证金退还日期
		sheet.setColumnWidth(22, 15 * 256);
		cell = row3.createCell(22);
		cell.setCellValue("保证金退还日期");
		cell.setCellStyle(style);
		
		// 标书费入账日期
		sheet.setColumnWidth(23, 15 * 256);
		cell = row3.createCell(23);
		cell.setCellValue("标书费入账日期");
		cell.setCellStyle(style);
		
		// 标书费开票形式
		sheet.setColumnWidth(24, 15 * 256);
		cell = row3.createCell(24);
		cell.setCellValue("标书费开票形式");
		cell.setCellStyle(style);
		
		// 标书费开票日期
		sheet.setColumnWidth(25, 15 * 256);
		cell = row3.createCell(25);
		cell.setCellValue("标书费开票日期");
		cell.setCellStyle(style);
		
		// 标书费发票编号
		sheet.setColumnWidth(26, 15 * 256);
		cell = row3.createCell(26);
		cell.setCellValue("标书费发票编号");
		cell.setCellStyle(style);
		
		// 代理费开票日期
		sheet.setColumnWidth(27, 15 * 256);
		cell = row3.createCell(27);
		cell.setCellValue("代理费开票日期");
		cell.setCellStyle(style);
		
		// 代理费发票编号
		sheet.setColumnWidth(28, 15 * 256);
		cell = row3.createCell(28);
		cell.setCellValue("代理费发票编号");
		cell.setCellStyle(style);
		
		// 代理费入账日期
		sheet.setColumnWidth(29, 15 * 256);
		cell = row3.createCell(29);
		cell.setCellValue("代理费入账日期");
		cell.setCellStyle(style);		
	}
	
	public static void main(String arg[]) {
	}
}
