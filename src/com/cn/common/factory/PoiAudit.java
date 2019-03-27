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
import com.cn.tbps.dto.AuditDto;

/**
 * @name PoiAudit.java
 * @author Frank
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiAudit extends Poi2007Base {
	
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
		cell.setCellValue("审价项目一览");
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
		AuditDto audit = new AuditDto();
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
			audit = (AuditDto) datas.get(i);
			XSSFCell cell0 = row.createCell(0);
			cell0.setCellValue("" + (i + 1));
			cell0.setCellStyle(style);
			
			XSSFCell cell = null;

			String[][] arrAuditShow = (String[][]) map.get("arrAuditShow");
			int j = 0;
			for(String[] one : arrAuditShow){
				cell = row.createCell(j+1);
				if(one[0].equals("PROJECT_MANAGER")){
					cell.setCellValue(audit.getPROJECT_MANAGER());
				} else if(one[0].equals("REPORT_NO")){
					cell.setCellValue(audit.getREPORT_NO());
				} else if(one[0].equals("PROJECT_NAME")){
					cell.setCellValue(audit.getPROJECT_NAME());
				} else if(one[0].equals("PRE_PRICE")){
					cell.setCellValue(StringUtil.BigDecimal2Str(audit.getPRE_PRICE(), 2));
				} else if(one[0].equals("DOC_REC_DATE")){
					cell.setCellValue(DateUtil.dateToStr(audit.getDOC_REC_DATE(), format));
				} else if(one[0].equals("PROGRESS_STATUS_MEMO")){
					cell.setCellValue(audit.getPROGRESS_STATUS_MEMO());
				} else if(one[0].equals("APPROVAL_SND_DATE")){
					cell.setCellValue(DateUtil.dateToStr(audit.getAPPROVAL_SND_DATE(), format));
				} else if(one[0].equals("REPORT_RAISE_DATE")){
					cell.setCellValue(DateUtil.dateToStr(audit.getREPORT_RAISE_DATE(), format));
				} else if(one[0].equals("VERIFY_PER_AMOUNT")){
					cell.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_PER_AMOUNT(), 2));
				} else if(one[0].equals("VERIFY_AMOUNT")){
					cell.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_AMOUNT(), 2));
				} else if(one[0].equals("CNT_PRICE")){
					cell.setCellValue(StringUtil.BigDecimal2Str(audit.getCNT_PRICE(), 2));
				} else if(one[0].equals("PROJECT_NAME_PASS")){
					cell.setCellValue(audit.getPROJECT_NAME_PASS());
				} else if(one[0].equals("CNTRCT_NO")){
					cell.setCellValue(audit.getCNTRCT_NO());
				} else if(one[0].equals("PROGRESS_STATUS")){
					String status = "";
					if("1".equals(audit.getPROGRESS_STATUS())){
						status = "实施";
					} else if("2".equals(audit.getPROGRESS_STATUS())){
						status = "中止";
					}
					cell.setCellValue(status);
				} else if(one[0].equals("PRE_SET")){
					String set = "";
					if("1".equals(audit.getPROGRESS_STATUS())){
						set = "预算";
					} else if("2".equals(audit.getPROGRESS_STATUS())){
						set = "结算";
					}
					cell.setCellValue(set);
				} else if(one[0].equals("AGENT_INFO")){
					cell.setCellValue(audit.getAGENT_INFO());
				} else if(one[0].equals("PROF_INFO")){
					cell.setCellValue(audit.getPROF_INFO());
				} else if(one[0].equals("CONTRACT_CO_NAME")){
					cell.setCellValue(audit.getCONTRACT_CO_NAME());
				} else if(one[0].equals("CONTRACT_CO_INFO")){
					cell.setCellValue(audit.getCONTRACT_CO_INFO());
				} else if(one[0].equals("VERIFY_INCREASE")){
					cell.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_INCREASE(), 2));
				} else if(one[0].equals("VERIFY_DECREASE")){
					cell.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_DECREASE(), 2));
				}
				cell.setCellStyle(style);
				j++;
			}
		}
	}
	
	/**
	 * 输出Head部分
	 * @param sheet
	 */
	@Override
	public void writeHead(XSSFSheet sheet, XSSFWorkbook workbook) {
		heads = new ArrayList<String>();
		heads.add("序号");
		String[][] arrAuditShow = (String[][]) map.get("arrAuditShow");
		int j = 0;
		for(String[] one : arrAuditShow){
			sheet.setColumnWidth(j+1, 15 * 256);
			heads.add(one[1]);
			j++;
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
