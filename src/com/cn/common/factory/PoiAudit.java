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
				if(one[0].equals("REPORT_NO")){ cell.setCellValue(audit.getREPORT_NO()); } 
				else if(one[0].equals("PROJECT_MANAGER")){ cell.setCellValue(audit.getPROJECT_MANAGER()); } 
				else if(one[0].equals("PROJECT_NAME")){ cell.setCellValue(audit.getPROJECT_NAME()); } 
				else if(one[0].equals("AGENT_CO_NAME")){ cell.setCellValue(audit.getAGENT_CO_NAME()); } 
				else if(one[0].equals("AGENT_CO_MANAGER")){ cell.setCellValue(audit.getAGENT_CO_MANAGER()); } 
				else if(one[0].equals("AGENT_CO_MANAGER_TEL")){ cell.setCellValue(audit.getAGENT_CO_MANAGER_TEL()); } 
				else if(one[0].equals("PROF_CO_NAME")){ cell.setCellValue(audit.getPROF_CO_NAME()); } 
				else if(one[0].equals("PROF_CO_MANAGER")){ cell.setCellValue(audit.getPROF_CO_MANAGER()); } 
				else if(one[0].equals("PROF_CO_MANAGER_TEL")){ cell.setCellValue(audit.getPROF_CO_MANAGER_TEL()); } 
				else if(one[0].equals("CONTRACT_CO_NAME")){ cell.setCellValue(audit.getCONTRACT_CO_NAME()); } 
				else if(one[0].equals("CONTRACT_CO_MANAGER")){ cell.setCellValue(audit.getCONTRACT_CO_MANAGER()); } 
				else if(one[0].equals("CONTRACT_CO_MANAGER_TEL")){ cell.setCellValue(audit.getCONTRACT_CO_MANAGER_TEL()); } 
				else if(one[0].equals("DOC_REC_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getDOC_REC_DATE(), format)); } 
				else if(one[0].equals("PROGRESS_STATUS")){ 
					String status = "";
					if("1".equals(audit.getPROGRESS_STATUS())){
						status = "实施";
					} else if("2".equals(audit.getPROGRESS_STATUS())){
						status = "中止";
					}
					cell.setCellValue(status);
				} 
				else if(one[0].equals("PRE_SET")){
					String set = "";
					if("1".equals(audit.getPRE_SET())){
						set = "预算";
					} else if("2".equals(audit.getPRE_SET())){
						set = "结算";
					}
					cell.setCellValue(set);
				} 
				else if(one[0].equals("PRE_PRICE")){ cell.setCellValue(StringUtil.BigDecimal2Str(audit.getPRE_PRICE(), 6)); } 
				else if(one[0].equals("SUPPORT_DOC_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getSUPPORT_DOC_DATE(), format)); } 
				else if(one[0].equals("DRAFT_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getDRAFT_DATE(), format)); } 
				else if(one[0].equals("APPROVAL_SND_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getAPPROVAL_SND_DATE(), format)); } 
				else if(one[0].equals("APPROVAL_RCV_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getAPPROVAL_RCV_DATE(), format)); } 
				else if(one[0].equals("DELI_NO")){ cell.setCellValue(audit.getDELI_NO()); } 
				else if(one[0].equals("REPORT_RAISE_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getREPORT_RAISE_DATE(), format)); } 
				else if(one[0].equals("REPORT_SEAL_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getREPORT_SEAL_DATE(), format)); } 
				else if(one[0].equals("REPORT_ARR_TYPE")){ 
					String type = "";
					if("1".equals(audit.getREPORT_ARR_TYPE())){
						type = "快递";
					} else if("2".equals(audit.getREPORT_ARR_TYPE())){
						type = "自送";
					} else if("3".equals(audit.getREPORT_ARR_TYPE())){
						type = "自取";
					} else if("4".equals(audit.getREPORT_ARR_TYPE())){
						type = "附带";
					}
					cell.setCellValue(type);
				} 
				else if(one[0].equals("REPORT_ARR_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getREPORT_ARR_DATE(), format)); } 
				else if(one[0].equals("REG_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getREG_DATE(), format)); } 
				else if(one[0].equals("AGENT_INFO")){ cell.setCellValue(audit.getAGENT_INFO()); } 
				else if(one[0].equals("PROF_INFO")){ cell.setCellValue(audit.getPROF_INFO()); } 
				else if(one[0].equals("CONTRACT_CO_ID")){ cell.setCellValue(audit.getCONTRACT_CO_ID()); } 
				else if(one[0].equals("CONTRACT_CO_INFO")){ cell.setCellValue(audit.getCONTRACT_CO_INFO()); } 
				else if(one[0].equals("VERIFY_PER_AMOUNT")){ cell.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_PER_AMOUNT(), 6)); } 
				else if(one[0].equals("VERIFY_AMOUNT")){ cell.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_AMOUNT(), 6)); } 
				else if(one[0].equals("VERIFY_INCREASE")){ cell.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_INCREASE(), 6)); } 
				else if(one[0].equals("VERIFY_DECREASE")){ cell.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_DECREASE(), 6)); } 
				else if(one[0].equals("VERIFY_DIFF")){ cell.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_DIFF(), 6)); } 
				else if(one[0].equals("VERIFY_DIFF_RATE")){ cell.setCellValue(StringUtil.BigDecimal2Str(audit.getVERIFY_DIFF_RATE(), 2)); } 
				else if(one[0].equals("CNT_PRICE")){ cell.setCellValue(StringUtil.BigDecimal2Str(audit.getCNT_PRICE(), 6)); } 
				else if(one[0].equals("PROJ_PRICE")){ cell.setCellValue(StringUtil.BigDecimal2Str(audit.getPROJ_PRICE(), 6)); } 
				else if(one[0].equals("LIMIT_PRICE")){ cell.setCellValue(StringUtil.BigDecimal2Str(audit.getLIMIT_PRICE(), 6)); } 
				else if(one[0].equals("CNTRCT_PRICE")){ cell.setCellValue(StringUtil.BigDecimal2Str(audit.getCNTRCT_PRICE(), 6)); } 
				else if(one[0].equals("PLAN_DOC_RCV_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getPLAN_DOC_RCV_DATE(), format)); } 
				else if(one[0].equals("PLAN_DOC_RPT_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getPLAN_DOC_RPT_DATE(), format)); } 
				else if(one[0].equals("PLAN_DOC_SND_TYPE")){ 
					String type = "";
					if("1".equals(audit.getPLAN_DOC_SND_TYPE())){
						type = "快递";
					} else if("2".equals(audit.getPLAN_DOC_SND_TYPE())){
						type = "自送";
					} else if("3".equals(audit.getPLAN_DOC_SND_TYPE())){
						type = "自取";
					} else if("4".equals(audit.getPLAN_DOC_SND_TYPE())){
						type = "附带";
					}
					cell.setCellValue(type);
				} 
				else if(one[0].equals("PLAN_DOC_ARR_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getPLAN_DOC_ARR_DATE(), format)); } 
				else if(one[0].equals("BID_DOC_RCV_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getBID_DOC_RCV_DATE(), format)); } 
				else if(one[0].equals("BID_DOC_RPT_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getBID_DOC_RPT_DATE(), format)); } 
				else if(one[0].equals("BID_DOC_SND_TYPE")){ 
					String type = "";
					if("1".equals(audit.getBID_DOC_SND_TYPE())){
						type = "快递";
					} else if("2".equals(audit.getBID_DOC_SND_TYPE())){
						type = "自送";
					} else if("3".equals(audit.getBID_DOC_SND_TYPE())){
						type = "自取";
					} else if("4".equals(audit.getBID_DOC_SND_TYPE())){
						type = "附带";
					}
					cell.setCellValue(type);
				} 
				else if(one[0].equals("BID_DOC_ARR_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getBID_DOC_ARR_DATE(), format)); } 
				else if(one[0].equals("SIGN_DOC_RCV_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getSIGN_DOC_RCV_DATE(), format)); } 
				else if(one[0].equals("SIGN_DOC_RPT_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getSIGN_DOC_RPT_DATE(), format)); } 
				else if(one[0].equals("SIGN_DOC_SND_TYPE")){ 
					String type = "";
					if("1".equals(audit.getSIGN_DOC_SND_TYPE())){
						type = "快递";
					} else if("2".equals(audit.getSIGN_DOC_SND_TYPE())){
						type = "自送";
					} else if("3".equals(audit.getSIGN_DOC_SND_TYPE())){
						type = "自取";
					} else if("4".equals(audit.getSIGN_DOC_SND_TYPE())){
						type = "附带";
					}
					cell.setCellValue(type);
				} 
				else if(one[0].equals("SIGN_DOC_ARR_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getSIGN_DOC_ARR_DATE(), format)); } 
				else if(one[0].equals("SET_DOC_RCV_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getSET_DOC_RCV_DATE(), format)); } 
				else if(one[0].equals("SET_DOC_RPT_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getSET_DOC_RPT_DATE(), format)); } 
				else if(one[0].equals("SET_DOC_SND_TYPE")){ 
					String type = "";
					if("1".equals(audit.getSET_DOC_SND_TYPE())){
						type = "快递";
					} else if("2".equals(audit.getSET_DOC_SND_TYPE())){
						type = "自送";
					} else if("3".equals(audit.getSET_DOC_SND_TYPE())){
						type = "自取";
					} else if("4".equals(audit.getSET_DOC_SND_TYPE())){
						type = "附带";
					}
					cell.setCellValue(type);
				} 
				else if(one[0].equals("SET_DOC_ARR_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getSET_DOC_ARR_DATE(), format)); } 
				else if(one[0].equals("PROGRESS_STATUS_MEMO")){ cell.setCellValue(audit.getPROGRESS_STATUS_MEMO()); } 
				else if(one[0].equals("A_AMOUNT")){ cell.setCellValue(StringUtil.BigDecimal2Str(audit.getA_AMOUNT(), 6)); } 
				else if(one[0].equals("A_STATUS")){ 
					String type = "";
					if("1".equals(audit.getA_STATUS())){
						type = "未收费";
					} else if("2".equals(audit.getA_STATUS())){
						type = "已收费";
					}
					cell.setCellValue(type);
				} 
				else if(one[0].equals("B_TYPE")){ 
					String type = "";
					if("1".equals(audit.getB_TYPE())){
						type = "标准收费";
					} else if("2".equals(audit.getB_TYPE())){
						type = "收费金额";
					} else if("3".equals(audit.getB_TYPE())){
						type = "送审金额";
					}
					cell.setCellValue(type);
				} 
				else if(one[0].equals("B_AMOUNT")){ cell.setCellValue(StringUtil.BigDecimal2Str(audit.getB_AMOUNT(), 6)); } 
				else if(one[0].equals("A_INVOICE_DELI_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getA_INVOICE_DELI_DATE(), format)); } 
				else if(one[0].equals("A_INVOICE_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getA_INVOICE_DATE(), format)); } 
				else if(one[0].equals("A_INVOICE_NO")){ cell.setCellValue(audit.getA_INVOICE_NO()); } 
				else if(one[0].equals("A_SET_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getA_SET_DATE(), format)); } 
				else if(one[0].equals("B_INVOICE_DELI_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getB_INVOICE_DELI_DATE(), format)); } 
				else if(one[0].equals("B_INVOICE_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getB_INVOICE_DATE(), format)); } 
				else if(one[0].equals("B_INVOICE_NO")){ cell.setCellValue(audit.getB_INVOICE_NO()); } 
				else if(one[0].equals("B_SET_DATE")){ cell.setCellValue(DateUtil.dateToStr(audit.getB_SET_DATE(), format)); } 
				else if(one[0].equals("B_RATE")){ cell.setCellValue(StringUtil.BigDecimal2Str(audit.getB_RATE(), 2)); } 
				else if(one[0].equals("CNTRCT_INFO")){ 
					String type = "";
					if("1".equals(audit.getCNTRCT_INFO())){
						type = "审价";
					} else if("2".equals(audit.getCNTRCT_INFO())){
						type = "咨询";
					} else if("3".equals(audit.getCNTRCT_INFO())){
						type = "清单编制";
					} else if("4".equals(audit.getCNTRCT_INFO())){
						type = "控制价编制";
					} else if("5".equals(audit.getCNTRCT_INFO())){
						type = "全过程投资监理";
					}
					cell.setCellValue(type);
				} 
				else if(one[0].equals("PROJECT_NAME_PASS")){ cell.setCellValue(audit.getPROJECT_NAME_PASS()); }
				else if(one[0].equals("RESERVE6")){ 
					String reserve6 = "";
					if("1".equals(audit.getRESERVE6())){
						reserve6 = "总价";
					} else if("2".equals(audit.getRESERVE6())){
						reserve6 = "单价";
					}
					cell.setCellValue(reserve6); 
				} 
				else if(one[0].equals("RESERVE7")){ cell.setCellValue(StringUtil.BigDecimal2Str(audit.getRESERVE7(), 6)); } 
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
