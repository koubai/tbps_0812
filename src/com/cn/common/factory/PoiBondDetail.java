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

import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.BondDetailDto;
import com.cn.tbps.dto.BondDto;

/**
 * @name PoiBondDetail.java
 * @author Frank
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiBondDetail extends Poi2007Base {
	
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
		
		String title = "保证金明细";
		if(datas != null && datas.size() > 0) {
			BondDetailDto bond = (BondDetailDto) datas.get(0);
			title = bond.getAGENT_CO_NAME() + "保证金汇总";
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
		XSSFRow old_row = null;
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

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");

		BigDecimal wan=new BigDecimal(10000);

		BondDetailDto bond = new BondDetailDto();
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
			bond = (BondDetailDto) datas.get(i);
			
			SimpleDateFormat strformatter = new SimpleDateFormat("yyyy/MM/dd");
			if("3".equals(bond.getDATA_TYPE())) {
				//合计
/*				cell0.setCellValue(bond.getBILL_NO());
				cell0.setCellStyle(style1);
				cell1.setCellValue(bond.getBILL_NAME());
				cell1.setCellStyle(style1);
				cell2.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT1(), 2));
				cell2.setCellStyle(style1);
				cell3.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT2(), 2));
				cell3.setCellStyle(style1);
				cell4.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT34(), 2));
				cell4.setCellStyle(style1);
				//汇票、网上银行
				cell5.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT5(), 2));
				cell5.setCellStyle(style1);
				cell6.setCellValue(StringUtil.BigDecimal2Str(bond.getAMOUNT6(), 2));
				cell6.setCellStyle(style1);
				cell7.setCellValue(StringUtil.BigDecimal2Str(bond.getTOTAL(), 2));
				cell7.setCellStyle(style1);
				cell8.setCellValue(StringUtil.BigDecimal2Str(bond.getREFUND(), 2));
				cell8.setCellStyle(style1);
				cell9.setCellValue(StringUtil.BigDecimal2Str(bond.getAGENT_FEE(), 2));
				cell9.setCellStyle(style1);
				//评标费
				cell10.setCellValue(StringUtil.BigDecimal2Str(bond.getBID_COMMISION(), 2));
				cell10.setCellStyle(style1);
				if (bond.getRESERVE_DATE2()!= null)
					strReserveDate2 = strformatter.format(bond.getRESERVE_DATE2());	
				cell11.setCellValue(strReserveDate2);
				cell11.setCellStyle(style1);
				if (bond.getRESERVE_DATE3()!= null)
					strReserveDate3 = strformatter.format(bond.getRESERVE_DATE3());
				cell12.setCellValue(strReserveDate3);
				cell12.setCellStyle(style1);
				if (bond.getRESERVE_DATE4()!= null)
					strReserveDate4 = strformatter.format(bond.getRESERVE_DATE4());
				cell13.setCellValue(strReserveDate4);
				cell13.setCellStyle(style1);
				if (bond.getRESERVE_DATE5()!= null)
					strReserveDate5 = strformatter.format(bond.getRESERVE_DATE5());
				cell14.setCellValue(strReserveDate5);
				cell14.setCellStyle(style1);
				cell15.setCellValue(bond.getMEMO());
				cell15.setCellStyle(style1);
				*/
			} else {
				// 招标编号;
				cell0 = row.createCell(0);										
				cell0.setCellValue(bond.getBID_NO());
				cell0.setCellStyle(style);					

				// 项目性质;
				cell1 = row.createCell(1);
				cell1.setCellValue(bond.getPROJECT_TYPE_NAME());
				cell1.setCellStyle(style);

				// 项目名称;
				cell2 = row.createCell(2);
				cell2.setCellValue(bond.getPROJECT_NAME());
				cell2.setCellStyle(style);

				// 委托单位;
				cell3 = row.createCell(3);
				cell3.setCellValue(bond.getAGENT_CO_NAME());
				cell3.setCellStyle(style);

				// 联系人;
				cell4 = row.createCell(4);
				cell4.setCellValue(bond.getAGENT_CO_MANAGER());
				cell4.setCellStyle(style);

				// 会审监管人;
				cell5 = row.createCell(5);
				cell5.setCellValue(bond.getBOND_AUDIT());
				cell5.setCellStyle(style);

				// 代理费用支付方;
				cell6 = row.createCell(6);
				cell6.setCellValue(bond.getANGENT_COST_PAYMENT());
				cell6.setCellStyle(style);

				// 投标单位;
				cell7 = row.createCell(7);
				cell7.setCellValue(bond.getBID_CO_NAME());
				cell7.setCellStyle(style);

				// 保证金金额（万元）;
				cell8 = row.createCell(8);
				if (bond.getBID_BOND() != null){
					cell8.setCellValue(StringUtil.BigDecimal2Str(bond.getBID_BOND_WAN(), 4));
				} else {
					cell8.setCellValue("");								
				}
				cell8.setCellStyle(style);

				// 保证金收入时间;
				cell9 = row.createCell(9);
				if (bond.getBID_CO_VALUE_DATE() != null){
					cell9.setCellValue(strformatter.format(bond.getBID_CO_VALUE_DATE()));
				} else{
					cell9.setCellValue("");			
				}
				cell9.setCellStyle(style);					

				// 保证金退还时间;
				cell10 = row.createCell(10);
				if (bond.getREFOUND_DEPOSIT_DATE() != null){				
					cell10.setCellValue(strformatter.format(bond.getREFOUND_DEPOSIT_DATE()));
				}else{
					cell10.setCellValue("");					
				}
				cell10.setCellStyle(style);

				// 保证金支付形式;
				cell11 = row.createCell(11);
				if (bond.getBID_PAYMENT_TYPE() != null){				
					cell11.setCellValue(bond.getBID_PAYMENT_TYPE());
				} else {
					cell11.setCellValue("");										
				}
				cell11.setCellStyle(style);

				// 中标单位;
				cell12 = row.createCell(12);
				if (bond.getBID_WIN_CO_NAME() != null){				
					cell12.setCellValue(bond.getBID_WIN_CO_NAME());
				}else{
					cell12.setCellValue("");
				}
				cell12.setCellStyle(style);

				// 中标价（万元）;
				cell13 = row.createCell(13);
				if (bond.getBID_PRICE_LIST() != null){				
					cell13.setCellValue(bond.getBID_PRICE_LIST());
				}else{
					cell13.setCellValue("");
				}
				cell13.setCellStyle(style);

				// 收费 标书费;
				cell14 = row.createCell(14);
				if (bond.getBID_APPLY_PRICE() != null){				
					cell14.setCellValue(StringUtil.BigDecimal2Str(bond.getBID_APPLY_PRICE(), 2));
				}else{
					cell14.setCellValue("");
				}
				cell14.setCellStyle(style);
				
				// 收费 代理费;
				cell15 = row.createCell(15);
				if (bond.getRECEIPT1_AGENT_COMMISSION() != null){				
					cell15.setCellValue(StringUtil.BigDecimal2Str(bond.getRECEIPT1_AGENT_COMMISSION(), 2));
				} else {
					cell15.setCellValue("");					
				}
				cell15.setCellStyle(style);

				// 专家费（元）;
				cell16 = row.createCell(16);
				if (bond.getBID_COMMISION() != null){				
					cell16.setCellValue(StringUtil.BigDecimal2Str(bond.getBID_COMMISION(), 2));
				} else {
					cell16.setCellValue("");					
				}
				cell16.setCellStyle(style);

				// 工程师;
				cell17 = row.createCell(17);
				if (bond.getPROJECT_MANAGER() != null){				
					cell17.setCellValue(bond.getPROJECT_MANAGER());
				} else {
					cell17.setCellValue("");					
				}
				cell17.setCellStyle(style);

				// 开标时间;
				cell18 = row.createCell(18);
				if (bond.getTENDER_OPEN_DATE() != null){				
					cell18.setCellValue(strformatter.format(bond.getTENDER_OPEN_DATE()));
				}else{
					cell18.setCellValue("");
				}
				cell18.setCellStyle(style);

				// 评标时间;
				cell19 = row.createCell(19);
				if (bond.getRESERVE_DATE1() != null){				
					cell19.setCellValue(strformatter.format(bond.getRESERVE_DATE1()));
				}else{
					cell19.setCellValue("");
				}
				cell19.setCellStyle(style);

				// 招标公告开始时间;
				cell20 = row.createCell(20);
				if (bond.getSUBMIT_DATE() != null){				
					cell20.setCellValue(strformatter.format(bond.getSUBMIT_DATE()));
				}else{
					cell20.setCellValue("");
				}
				cell20.setCellStyle(style);

				// 招标公告结束时间;
				cell21 = row.createCell(21);
				if (bond.getSUBMIT_DATE2() != null){				
					cell21.setCellValue(strformatter.format(bond.getSUBMIT_DATE2()));
				}else{
					cell21.setCellValue("");
				}
				cell21.setCellStyle(style);

				// 中标公示开始时间;
				cell22 = row.createCell(22);
				if (bond.getBID_NOTICE_DATE() != null){				
					cell22.setCellValue(strformatter.format(bond.getBID_NOTICE_DATE()));
				}else{
					cell22.setCellValue("");
				}
				cell22.setCellStyle(style);

				// 中标公示结束时间;
				cell23 = row.createCell(23);
				if (bond.getBID_NOTICE_DATE2() != null){				
					cell23.setCellValue(strformatter.format(bond.getBID_NOTICE_DATE2()));
				}else{
					cell23.setCellValue("");
				}
				cell23.setCellStyle(style);

				// 代理费到账时间;
				cell24 = row.createCell(24);
				if (bond.getBID_VALUE_DATE() != null){				
					cell24.setCellValue(strformatter.format(bond.getBID_VALUE_DATE()));
				}else{
					cell24.setCellValue("");
				}
				cell24.setCellStyle(style);

				// 中标文件扫描;
				cell25 = row.createCell(25);
				if (bond.getBID_WIN_SCAN_DATE() != null){				
					cell25.setCellValue(bond.getBID_WIN_SCAN_DATE());
				}else{
					cell25.setCellValue("");
				}
				cell25.setCellStyle(style);

				// 评标报告扫描归档时间;
				cell26 = row.createCell(26);
				if (bond.getBID_AUDIT_SCAN_DATE() != null){				
					cell26.setCellValue(strformatter.format(bond.getBID_AUDIT_SCAN_DATE()));
				}else{
					cell26.setCellValue("");
				}
				cell26.setCellStyle(style);

				// 甲方资料归档;
				cell27 = row.createCell(27);
				if (bond.getBID_CO_ZB_FM_DATE() != null){				
					cell27.setCellValue(strformatter.format(bond.getBID_CO_ZB_FM_DATE()));
				}else{
					cell27.setCellValue("");
				}
				cell27.setCellStyle(style);

				cell28 = row.createCell(28);
				if (bond.getBID_CO_TB_FM_DATE() != null){				
					cell28.setCellValue(strformatter.format(bond.getBID_CO_TB_FM_DATE()));
				}else{
					cell28.setCellValue("");
				}
				cell28.setCellStyle(style);

				cell29 = row.createCell(29);
				if (bond.getBID_CO_PB_FM_DATE() != null){				
					cell29.setCellValue(strformatter.format(bond.getBID_CO_PB_FM_DATE()));
				}else{
					cell29.setCellValue("");
				}
				cell29.setCellStyle(style);
				
				// 限价;
				cell30 = row.createCell(30);
				if (bond.getPROJ_ASTRICT_PRICE() != null){				
					cell30.setCellValue(bond.getPROJ_ASTRICT_PRICE());
				}else{
					cell30.setCellValue("");
				}
				cell30.setCellStyle(style);

				// 项目完成情况;
				cell31 = row.createCell(31);
				if (bond.getFINISH_STATUS() != null){				
					cell31.setCellValue(bond.getFINISH_STATUS());
				}else{
					cell31.setCellValue("");
				}
				cell31.setCellStyle(style);

				// 备注;
				cell32 = row.createCell(32);
				if (bond.getFINISH_NOTE() != null){				
					cell32.setCellValue(bond.getFINISH_NOTE());
				}else{
					cell32.setCellValue("");
				}
				cell32.setCellStyle(style);

			}
		}
		if (i>1){
			startRow = i-1;
			endRow = i-1;
			for (int k=i-1; k>0; k--){
				BondDetailDto tmp_bond=(BondDetailDto) datas.get(k);
				String str_Bid_No = tmp_bond.getBID_NO();
				BondDetailDto tmp2_bond=(BondDetailDto) datas.get(k-1);
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
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 12, 12));
		sheet.addMergedRegion(new CellRangeAddress(startRow, endRow, 13, 13));
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
		for(int i = 0; i < 33; i++) {
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

		//项目性质
		sheet.setColumnWidth(1, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 1, 1));
		cell = row2.createCell(1);
		cell.setCellValue("项目性质");
		cell.setCellStyle(style);

		//项目名称
		sheet.setColumnWidth(2, 15 * 3 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 2, 2));
		cell = row2.createCell(2);
		cell.setCellValue("项目名称");
		cell.setCellStyle(style);

		//委托单位
		sheet.setColumnWidth(3, 15 * 3 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 3, 3));
		cell = row2.createCell(3);
		cell.setCellValue("委托单位");
		cell.setCellStyle(style);

		//联系人
		sheet.setColumnWidth(4, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 4, 4));
		cell = row2.createCell(4);
		cell.setCellValue("联系人");
		cell.setCellStyle(style);

		//会审监管人
		sheet.setColumnWidth(5, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 5, 5));
		cell = row2.createCell(5);
		cell.setCellValue("会审监管人");
		cell.setCellStyle(style);

		//代理费用支付方
		sheet.setColumnWidth(6, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 6, 6));
		cell = row2.createCell(6);
		cell.setCellValue("代理费用支付方");
		cell.setCellStyle(style);

		//投标单位
		sheet.setColumnWidth(7, 15 * 3 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 7, 7));
		cell = row2.createCell(7);
		cell.setCellValue("投标单位");
		cell.setCellStyle(style);

		//保证金金额（万元）
		sheet.setColumnWidth(8, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 8, 8));
		cell = row2.createCell(8);
		cell.setCellValue("保证金金额（万元）");
		cell.setCellStyle(style);

		//保证金收入时间
		sheet.setColumnWidth(9, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 9, 9));
		cell = row2.createCell(9);
		cell.setCellValue("保证金收入时间");
		cell.setCellStyle(style);

		//保证金退还时间
		sheet.setColumnWidth(10, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 10, 10));
		cell = row2.createCell(10);
		cell.setCellValue("保证金退还时间");
		cell.setCellStyle(style);

		//保证金支付形式
		sheet.setColumnWidth(11, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 11, 11));
		cell = row2.createCell(11);
		cell.setCellValue("保证金支付形式");
		cell.setCellStyle(style);

		//中标单位
		sheet.setColumnWidth(12, 15 * 3 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 12, 12));
		cell = row2.createCell(12);
		cell.setCellValue("中标单位");
		cell.setCellStyle(style);

		//中标价（万元）
		sheet.setColumnWidth(13, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 13, 13));
		cell = row2.createCell(13);
		cell.setCellValue("中标价（万元）");
		cell.setCellStyle(style);

		//收费
		sheet.setColumnWidth(14, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 14, 15));
		cell = row2.createCell(14);
		cell.setCellValue("收费");
		cell.setCellStyle(style);

		//标书费(元）
		sheet.setColumnWidth(14, 15 * 256);
		cell = row3.createCell(14);
		cell.setCellValue("标书费(元）");
		cell.setCellStyle(style);

		//代理费（元）
		sheet.setColumnWidth(15, 15 * 256);
		cell = row3.createCell(15);
		cell.setCellValue("代理费（元）");
		cell.setCellStyle(style);
		
		//专家费（元）
		sheet.setColumnWidth(16, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 16, 16));
		cell = row2.createCell(16);
		cell.setCellValue("专家费（元）");
		cell.setCellStyle(style);

		//工程师
		sheet.setColumnWidth(17, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 17, 17));
		cell = row2.createCell(17);
		cell.setCellValue("工程师");
		cell.setCellStyle(style);

		//开标时间
		sheet.setColumnWidth(18, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 18, 18));
		cell = row2.createCell(18);
		cell.setCellValue("开标时间");
		cell.setCellStyle(style);

		//评标时间
		sheet.setColumnWidth(19, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 19, 19));
		cell = row2.createCell(19);
		cell.setCellValue("评标时间");
		cell.setCellStyle(style);

		//招标公告开始时间
		sheet.setColumnWidth(20, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 20, 20));
		cell = row2.createCell(20);
		cell.setCellValue("招标公告开始时间");
		cell.setCellStyle(style);

		//招标公告结束时间
		sheet.setColumnWidth(21, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 21, 21));
		cell = row2.createCell(21);
		cell.setCellValue("招标公告结束时间");
		cell.setCellStyle(style);

		//中标公示开始时间
		sheet.setColumnWidth(22, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 22, 22));
		cell = row2.createCell(22);
		cell.setCellValue("中标公示开始时间");
		cell.setCellStyle(style);

		//中标公示结束时间
		sheet.setColumnWidth(23, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 23, 23));
		cell = row2.createCell(23);
		cell.setCellValue("中标公示结束时间");
		cell.setCellStyle(style);

		//代理费到账时间
		sheet.setColumnWidth(24, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 24, 24));
		cell = row2.createCell(24);
		cell.setCellValue("代理费到账时间");
		cell.setCellStyle(style);

		//中标文件扫描
		sheet.setColumnWidth(25, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 25, 25));
		cell = row2.createCell(25);
		cell.setCellValue("中标文件扫描");
		cell.setCellStyle(style);

		//评标报告扫描归档时间
		sheet.setColumnWidth(26, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 26, 26));
		cell = row2.createCell(26);
		cell.setCellValue("评标报告扫描归档时间");
		cell.setCellStyle(style);

		//甲方资料归档
		sheet.setColumnWidth(27, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 27, 29));
		cell = row2.createCell(27);
		cell.setCellValue("甲方资料归档");
		cell.setCellStyle(style);

		//招标文件移交时间
		sheet.setColumnWidth(27, 15 * 256);
		cell = row3.createCell(27);
		cell.setCellValue("招标文件移交时间");
		cell.setCellStyle(style);

		//投标文件移交时间
		sheet.setColumnWidth(28, 15 * 256);
		cell = row3.createCell(28);
		cell.setCellValue("投标文件移交时间");
		cell.setCellStyle(style);

		//评标报告移交时间
		sheet.setColumnWidth(29, 15 * 256);
		cell = row3.createCell(29);
		cell.setCellValue("评标报告移交时间");
		cell.setCellStyle(style);

		//限价
		sheet.setColumnWidth(30, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 30, 30));
		cell = row2.createCell(30);
		cell.setCellValue("限价");
		cell.setCellStyle(style);

		//项目完成情况
		sheet.setColumnWidth(31, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 31, 31));
		cell = row2.createCell(31);
		cell.setCellValue("项目完成情况");
		cell.setCellStyle(style);

		//备注
		sheet.setColumnWidth(32, 15 * 256);
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 32, 32));
		cell = row2.createCell(32);
		cell.setCellValue("备注");
		cell.setCellStyle(style);
	}
	
	public static void main(String arg[]) {
	}
}
