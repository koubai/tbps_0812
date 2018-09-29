package com.cn.common.factory;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.cn.tbps.dto.BidDto;

public class PoiBidReceive extends Poi2007Base {

	// 标书费收据
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	@Override
	public void writeData(Workbook workbook) {
		
		System.out.println("Receive writeData");
		
		BidDto bidDto = (BidDto) datas.get(0);
		String bidNo = bidDto.getBID_NO();
		String projectName = bidDto.getPROJECT_NAME();
		if (projectName.endsWith("项目"))
			projectName = projectName.substring(0, projectName.length() - 2);
		
/*		List<BidCompDto> bidCoList = (List<BidCompDto>)datas.get(1);
		if(bidCoList != null && bidCoList.size() > 1){
//			System.out.println("bidCoList.size():" + bidCoList.size());
			for(int i=0; i<bidCoList.size()-1; i++){
				workbook.cloneSheet(0);
			}
		}
		
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(currentTime);

//		int i = 0;
//		for(BidCompDto bidComp : bidCoList) {
//			Sheet sheet = workbook.getSheetAt(i);
			System.out.println("i:" + i);
*/
			Sheet sheet = workbook.getSheetAt(0);
			
			//项目名称
			Row row = sheet.getRow((short) 1);
			Cell cell = row.getCell((short) 0);
			String projectNameOld = String.valueOf(cell.getStringCellValue());
			int endPro = projectNameOld.indexOf("项目");
			String projectNameNew = projectNameOld.substring(0, endPro)+ "" + projectName + "" +projectNameOld.substring(endPro);		
			cell.setCellValue(projectNameNew);
			
			//加下划线
			Font font = workbook.createFont();
			HSSFCellStyle style = (HSSFCellStyle ) cell.getCellStyle();
			Font fontOld = style.getFont(workbook);
			font.setUnderline(Font.U_SINGLE); //下划线
			PoiBidReply.copyFont(fontOld, font);
			HSSFRichTextString richStringPrj = null;
			richStringPrj = new HSSFRichTextString (projectNameNew.toString());
			richStringPrj.applyFont(endPro, endPro + projectName.length()+(new String("项目")).length(), font);
			cell.setCellValue(richStringPrj);
			
			//项目编号
			row = sheet.getRow((short) 2);
			cell = row.getCell((short) 0);
			String bidNoOld = String.valueOf(cell.getStringCellValue());
			int startNo = bidNoOld.indexOf("招标编号:");
			String bidNoNew = bidNoOld.substring(0,startNo)+ "招标编号:" + bidNo + "" +bidNoOld.substring(startNo+String.valueOf("招标编号:").length());		
			cell.setCellValue(bidNoNew);
			
			//投标单位名称
/*			row = sheet.getRow((short) 3);
			cell = row.getCell((short) 0);
			String CompNameOld = String.valueOf(cell.getStringCellValue());
			int startCompNameOld = CompNameOld.indexOf("投标单位：  ");
			String CompNameNew = CompNameOld.substring(0,startCompNameOld)+ "投标单位：  " + bidComp.getBID_CO_NAME() + " " +CompNameOld.substring(startCompNameOld+String.valueOf("投标单位：  ").length());
			cell.setCellValue(CompNameNew);
			
//			System.out.println(CompNameNew);
			
			//法定代表授权委托人
			row = sheet.getRow((short) 5);
			cell = row.getCell((short) 0);
			String CompManageOld = String.valueOf(cell.getStringCellValue());
			int startCompManageOld = CompManageOld.indexOf("法定代表授权委托人：   ");
			String CompManageNew = CompNameOld.substring(0,startCompManageOld)+ "法定代表授权委托人：   " + bidComp.getRESERVE2() + " " + CompManageOld.substring(startCompManageOld+String.valueOf("法定代表授权委托人：   ").length());
			cell.setCellValue(CompManageNew);
			
//			System.out.println(CompManageNew);
			
			//日期
			row = sheet.getRow((short) 7);
			cell = row.getCell((short) 0);
			String DateOld = String.valueOf(cell.getStringCellValue());
			int startDateOld = DateOld.indexOf("日期：    ");
			String DateNew = DateOld.substring(0,startDateOld)+ "日期：    " + dateString + " " + DateOld.substring(startDateOld+String.valueOf("日期：    ").length());
			cell.setCellValue(DateNew);
			
//			System.out.println(DateNew);
			
//			i++;
//		}

*/
	}
	
	
	public static void main(String arg[]) {
	}
}
