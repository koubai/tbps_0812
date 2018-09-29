package com.cn.common.factory;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRichTextString;

import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.BidDto;

/**
 * @name PoiBidRegister.java
 * @author lql
 * @time 2013-11-15下午11:48:13
 * @version 1.0
 */
public class PoiBidRegister extends Poi2007Base {
	
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	@SuppressWarnings("deprecation")
	@Override
	public void writeData(Workbook workbook) {
		BidDto bidDto = (BidDto) datas.get(0);
		Sheet sheet = workbook.getSheetAt(0);
		//项目编号
		Row row = sheet.getRow((short) 0);
		Cell cell = row.getCell((short) 0);
		String bidNo = bidDto.getBID_NO();
		String bidNoOld = String.valueOf(cell.getStringCellValue());
		int startNo = bidNoOld.indexOf("：");
		String bidNoNew = bidNoOld;
		
		bidNoNew = bidNoNew.substring(0, startNo + 1) + bidNo + bidNoNew.substring(startNo + 12, bidNoNew.length());
		
		//项目名称
		int nameStart = bidNoOld.indexOf("=");
		bidNoNew = bidNoOld.substring(0, nameStart + 1) + bidDto.getPROJECT_NAME() + bidNoNew.substring(nameStart + 2, bidNoOld.length());
		
		//cell.setCellValue(bidNoNew.toString());
		//删除多余下划线
		XSSFCellStyle style = (XSSFCellStyle ) cell.getCellStyle();
		Font fontOld = style.getFont();
		Font font = workbook.createFont();
		font.setUnderline(Font.U_NONE); //下划线
		PoiBidReply.copyFont(fontOld, font);
		XSSFRichTextString  richString = null;
		richString = new XSSFRichTextString (bidNoNew.toString());
		richString.applyFont(richString.length() - 5, richString.length(), font);
		cell.setCellValue(richString);
		//报名要求
		if(StringUtil.isNotBlank(bidDto.getAPPLY_REQUIRE())){
			String applyRequire = bidDto.getAPPLY_REQUIRE();
			System.out.println("applyRequire: " + applyRequire);
			String[] applyRequireList = applyRequire.split("\n");
			System.out.println("applyRequireList.length: " + applyRequireList.length);
			if(applyRequireList.length > 10){
				insertRow(workbook, sheet, 17, applyRequireList.length-10, 3);
			}
			for(int i = 0; i < applyRequireList.length; i++){
				row = sheet.getRow((short) i+8);
				cell = row.getCell((short) 0);
				if(StringUtil.isNotBlank(applyRequireList[i])){
					cell.setCellValue(applyRequireList[i]);
				}
			}
		}
	}
	/** 
     * insert row into the target sheet, the style of cell is the same as startRow 
     * @param wb 
     * @param sheet 
     * @param starRow - the row to start shifting 
     * @param rows 
     */  
     public static void insertRow(Workbook wb, Sheet sheet, int startRow, int rows, int colCount) {  
           
          sheet.shiftRows(startRow + 1, sheet.getLastRowNum(), rows ,true, false);  
          //  Parameters:  
          //   startRow - the row to start shifting  
          //   endRow - the row to end shifting  
          //   n - the number of rows to shift  
          //   copyRowHeight - whether to copy the row height during the shift  
          //   resetOriginalRowHeight - whether to set the original row's height to the default  
  
          for (int i = 0; i < rows; i++) {  
                
                Row sourceRow = null;  
                Row targetRow = null;  
                  
                sourceRow = sheet.getRow(startRow);  
                targetRow = sheet.createRow(++startRow);    
                targetRow.setHeight(sourceRow.getHeight());   
                
                copyRow(sheet, sourceRow, targetRow, colCount);  
          }  
            
    }  
     /** 
      * 行复制功能 
      * @param st
      * @param sourceRow 
      * @param targetRow 
      */  
    public static void copyRow(Sheet st, Row sourceRow, Row targetRow, int colCount) {
        int pSourceRow = sourceRow.getRowNum();
        int pTargetRow;
        CellRangeAddress region = null;
        int i;
        
        if(pSourceRow==-1) return;
        
        //merged cells
        System.out.println(st.getNumMergedRegions());
        
        for (i = 0; i < st.getNumMergedRegions(); i++) {
            region = st.getMergedRegion(i);
            if ((region.getFirstRow() == pSourceRow)) {
            	pTargetRow = targetRow.getRowNum();
                
                CellRangeAddress newRegion = region.copy();
                
                newRegion.setFirstRow(pTargetRow);
                newRegion.setFirstColumn(region.getFirstColumn());
                newRegion.setLastRow(pTargetRow);
                newRegion.setLastColumn(region.getLastColumn());
                st.addMergedRegion(newRegion);
            }
        } 
        
        for (i = 0; i <= colCount; i++) {
        	Cell tmpCell = sourceRow.getCell(i); 
            Cell newCell = targetRow.createCell(i); 
            copyCell(tmpCell, newCell, true);  
        }
    }  
	
    /** 
     * 复制单元格 
     *  
     * @param srcCell 
     * @param distCell 
     * @param copyValueFlag 
     *            true则连同cell的内容一起复制 
     */  
    public static void copyCell(Cell srcCell, Cell distCell, boolean copyValueFlag) {   
        //样式  
    	distCell.setCellStyle(srcCell.getCellStyle());
         //评论  
    	if(srcCell.getCellComment() != null) {
    		distCell.setCellComment(srcCell.getCellComment());        
    	}
        //distCell.setEncoding(srcCell.getEncoding()); 
        // 不同数据类型处理  
        int srcCellType = srcCell.getCellType();  
        distCell.setCellType(srcCellType);  
        if (copyValueFlag) {  
            if (srcCellType == Cell.CELL_TYPE_NUMERIC) {  
                distCell.setCellValue(srcCell.getNumericCellValue());  
            } else if (srcCellType == Cell.CELL_TYPE_STRING) {  
                distCell.setCellValue(srcCell.getRichStringCellValue());  
            } else if (srcCellType == Cell.CELL_TYPE_BLANK) {  
                // nothing21  
            } else if (srcCellType == Cell.CELL_TYPE_BOOLEAN) {  
                distCell.setCellValue(srcCell.getBooleanCellValue());  
            } else if (srcCellType == Cell.CELL_TYPE_ERROR) {  
                distCell.setCellErrorValue(srcCell.getErrorCellValue());  
            } else if (srcCellType == Cell.CELL_TYPE_FORMULA) {  
                distCell.setCellFormula(srcCell.getCellFormula());  
            } else { // nothing29  
            }  
        }  
    } 
    
	public static void main(String arg[]) {
	}
}
