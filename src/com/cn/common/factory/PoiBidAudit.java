package com.cn.common.factory;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRichTextString;

import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.BidCompApplyDto;
import com.cn.tbps.dto.BidCompDto;
import com.cn.tbps.dto.BidDto;
import com.cn.tbps.service.BidCompApplyService;

/**
 * @name PoiBidAudit.java
 * @author lql
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiBidAudit extends Poi2007Base {
	
	private List<BidCompApplyDto> listApply;
	
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public void writeData(Workbook workbook) {
		BidDto bidDto = (BidDto) datas.get(0);
		Sheet sheet = workbook.getSheetAt(0);
		//项目编号
		Row row = sheet.getRow((short) 0);
		Cell cell = row.getCell((short) 0);
		System.out.println("headOld: " + String.valueOf(cell.getStringCellValue()));
		String projectName = bidDto.getPROJECT_NAME();
		if (projectName.endsWith("项目"))
			projectName = projectName.substring(0, projectName.length() - 2);
		String bidNo = bidDto.getBID_NO();
		String headOld = String.valueOf(cell.getStringCellValue());
		if (projectName.length() > 20){
			String spc_buf = "";
			for (int i=0; i<(projectName.length()-20); i++)
				spc_buf += " ";
			System.out.println("spc_buf"+ spc_buf.length());
			headOld = spc_buf + headOld;
		}
		System.out.println(headOld);
		StringBuffer headNew = new StringBuffer(headOld);
		int endPro = headOld.indexOf("项");
		int startNo = headOld.indexOf("：");
		headNew = headNew.replace(startNo + 1, startNo + 1 + bidNo.length(), bidNo);
		headNew = headNew.replace(0, 0 + projectName.length(), projectName);
		int prjnamelen=projectName.length();
		int prjnamerow = 1;
		int rowStrlen = 40;
		int ROWHEIGHT = 39;
		if ((prjnamelen - (prjnamelen/rowStrlen)*rowStrlen)>0){
			prjnamerow = prjnamelen / rowStrlen + 1;
		}else{
			prjnamerow = prjnamelen / rowStrlen;			
		}
		row = sheet.getRow((short) 0);
		row.setHeightInPoints(prjnamerow * ROWHEIGHT);    
		
		//项目名称加下划线
		XSSFCellStyle style = (XSSFCellStyle) cell.getCellStyle();
		Font fontOld = style.getFont();
		Font font = workbook.createFont();
		Font font2 = workbook.createFont();
		font.setUnderline(Font.U_SINGLE); //下划线
		PoiBidReply.copyFont(fontOld, font);
		PoiBidReply.copyFont(fontOld, font2);
		XSSFRichTextString richString = null;
		richString = new XSSFRichTextString (headNew.toString());
		richString.applyFont(1, endPro, font);
		richString.applyFont(endPro, richString.length(), font2);
		cell.setCellValue(richString);

		//报名要求
		String applyRequire = bidDto.getAPPLY_REQUIRE();
		int rowCount = 22;
		int rowMidCount = 10;
		if(StringUtil.isNotBlank(applyRequire)){
			System.out.println("applyRequire: " + applyRequire);
			String[] applyRequireList = applyRequire.split("\r\n");
			System.out.println("applyRequireList.length: " + applyRequireList.length);
			if(applyRequireList.length > 10){
				PoiBidRegister.insertRow(workbook, sheet, 13, applyRequireList.length-10, 6);
				rowCount = applyRequireList.length + 12;
				rowMidCount = applyRequireList.length;
			}
			for(int i = 0; i < applyRequireList.length; i++){
				row = sheet.getRow((short) i+4);
				cell = row.getCell((short) 0);
				cell.setCellValue(i+1);
				cell = row.getCell((short) 1);
				if(StringUtil.isNotBlank(applyRequireList[i])){
					cell.setCellValue(applyRequireList[i]);
				}
			}
		}
		//投标公司
		List<BidCompDto> bidCoList = (List<BidCompDto>) datas.get(1);
		if(bidCoList != null && bidCoList.size() > 0){
			BidCompApplyService bidCompApplyService = (BidCompApplyService) map.get("bidCompApplyService");
			if(bidCoList.size() > 5){
				insertCol(workbook, sheet, 2, 6, bidCoList.size()-5, rowCount);
				//合并单元格
				int lastCol = bidCoList.size() + 1;
		        CellRangeAddress region = null;
		        int lastRow = rowCount+2;
		        for (int i = 0; i < sheet.getNumMergedRegions(); i++) {
		            region = sheet.getMergedRegion(i);
		            if ((region.getFirstRow() == 0 || region.getFirstRow() == 1 || region.getFirstRow() == lastRow)) {
		            	sheet.removeMergedRegion(i);
		            	i = -1;
		            }
		        }
				sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, (short)lastCol));
				sheet.addMergedRegion(new CellRangeAddress((short)1, (short)1, 0, (short)lastCol));
				sheet.addMergedRegion(new CellRangeAddress((short)lastRow, (short)lastRow, (short)1, (short)lastCol));
			}
			int i = 0;
			for(BidCompDto bidComp : bidCoList) {
				row = sheet.getRow((short) 2);
				cell = row.getCell((short) i+2);
				cell.setCellValue(i+1);
				row = sheet.getRow((short) 3);
				cell = row.getCell((short) i+2);
				cell.setCellValue(bidComp.getBID_CO_NAME());
				
				if(StringUtil.isNotBlank(applyRequire)) {
					String[] applyRequireList = applyRequire.split("\r\n");
					for(int n = 0; n < applyRequireList.length; n++) {
						row = sheet.getRow((short) n + 4);
						cell = row.getCell((short) 2 + i);
						//报名内容
						List<BidCompApplyDto> listApply = bidCompApplyService.queryBidCompApplyByBidCoNo("" + bidComp.getBID_CO_NO());
						String applynote = "";
						if(listApply != null && listApply.size() > 0) {
							for(BidCompApplyDto apply : listApply) {
								if(applyRequireList[n].equals(apply.getAPPLY_REQUIRE())) {
									applynote = apply.getAPPLY_NOTE();
									break;
								}
							}
						}
						cell.setCellValue(applynote);
					}
				}
				
				// add 企业注册资金
				row = sheet.getRow((short) rowMidCount + 4);
				cell = row.getCell((short) i+2);
				// 万元单位，数据库万元单位
				String strFund ="";
				if (!StringUtil.isBlank(bidComp.getRESERVE8())){
					if (!StringUtil.isNumeric(bidComp.getRESERVE8())){
						strFund = String.valueOf(bidComp.getRESERVE8());								
					}else{
						BigDecimal bd_Fund = new BigDecimal(Double.parseDouble(bidComp.getRESERVE8())*10000);
						strFund = String.valueOf(bd_Fund);								
					}
				}
				cell.setCellValue(strFund);
				// add 组织机构代码
				row = sheet.getRow((short) rowMidCount + 5);
				cell = row.getCell((short) i+2);
				cell.setCellValue(bidComp.getRESERVE4());
				// add 法定代表人
				row = sheet.getRow((short) rowMidCount + 6);
				cell = row.getCell((short) i+2);
				cell.setCellValue(bidComp.getRESERVE7());
				// add 项目负责人
				row = sheet.getRow((short) rowMidCount + 7);
				cell = row.getCell((short) i+2);
				cell.setCellValue(bidComp.getRESERVE2());
				// add 项目负责人联系方式
				row = sheet.getRow((short) rowMidCount + 8);
				cell = row.getCell((short) i+2);
				cell.setCellValue(bidComp.getRESERVE3());
				// add 联系人
				// add 联系人联系方式
				row = sheet.getRow((short) rowMidCount + 9);
				cell = row.getCell((short) i+2);
				cell.setCellValue(bidComp.getBID_CO_MANAGER());
				row = sheet.getRow((short) rowMidCount + 10);
				cell = row.getCell((short) i+2);
				cell.setCellValue(bidComp.getBID_CO_TEL());
				// add 邮箱
				row = sheet.getRow((short) rowMidCount + 11);
				cell = row.getCell((short) i+2);
//					cell.setCellValue(bidComp.getMail_pr()+"@"+bidComp.getMail_suffix());
				cell.setCellValue(bidComp.getBID_CO_PS());
				// add 备注
				row = sheet.getRow((short) rowMidCount + 12);
				cell = row.getCell((short) i+2);
				cell.setCellValue(bidComp.getMEMO1());
				i++;
			}
//			if ((bidDto.getSUBMIT_DATE()!= null) || (bidDto.getSUBMIT_DATE2()!= null)){
//				String str_SubmitDate="";
//				SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
//				if (bidDto.getSUBMIT_DATE()!= null)
//						str_SubmitDate = formatter.format(bidDto.getSUBMIT_DATE());
//				if (bidDto.getSUBMIT_DATE2()!= null)
//						str_SubmitDate = str_SubmitDate + " - " + formatter.format(bidDto.getSUBMIT_DATE2());
//				// add 报名日期修改
//				row = sheet.getRow((short) rowMidCount + 14);
//				cell = row.getCell(4);
//				cell.setCellValue("报名日期: " + str_SubmitDate);			
//			}
		}
	}
    public static void insertCol(Workbook wb, Sheet sheet, int startRow, int startCol, int cols, int rowCount) {
    	for (int i=0; i<cols; i++){
    		for (int j=0; j<rowCount; j++){
    			Row sourceRow = sheet.getRow(startRow + j);
    			Cell oldCell = sourceRow.getCell(startCol + i - 1); 
            	Cell tmpCell = sourceRow.getCell(startCol + i); 
                Cell newCell = sourceRow.createCell(startCol + i + 1); 
                PoiBidRegister.copyCell(tmpCell, newCell, true); 
                PoiBidRegister.copyCell(oldCell, tmpCell, true); 
    		}
    		int colWidth = sheet.getColumnWidth(startCol);
    		sheet.setColumnWidth((short) startCol + i + 1, (short) colWidth);
    	}
    }
        
	
	public static void main(String arg[]) {
	}
	
	public List<BidCompApplyDto> getListApply() {
		return listApply;
	}
	public void setListApply(List<BidCompApplyDto> listApply) {
		this.listApply = listApply;
	}
		
}
