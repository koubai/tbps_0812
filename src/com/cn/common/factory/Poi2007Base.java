package com.cn.common.factory;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.xmlbeans.impl.piccolo.io.FileFormatException;

/**
 * Excel2007操作类基类
 * @author Frank
 * @time 2013-10-3下午3:32:06
 * @version 1.0
 */
public class Poi2007Base {
	
	private static final Logger log = LogManager.getLogger(Poi2007Base.class);
    private static final String EXTENSION_XLS = "xls";
    private static final String EXTENSION_XLSX = "xlsx";

	/**
	 * 文件路径
	 */
	protected String path;
	
	/**
	 * 文件名
	 */
	protected String name;
	
	/**
	 * Sheet名
	 */
	protected String sheetName;
	
	/**
	 * 数据标题
	 */
	protected String title;
	
	/**
	 * 数据头部
	 */
	protected List<String> heads;
	
	/**
	 * 数据列表
	 */
	protected List<?> datas;
	
	/**
	 * 文件路径
	 */
	protected String filepath;

	/**
	 * 其他备用数据
	 */
	protected Map<String, Object> map;

	/**
	 * 创建Excel2007
	 */
	public void createExcel() {
		OutputStream os = null;
		try {
			//创建Workbook
			XSSFWorkbook workbook = new XSSFWorkbook();
			//创建Sheet
			XSSFSheet sheet = createSheet(workbook);
			//输出title
			writeTitle(sheet, workbook);
			//输出Head部分
			writeHead(sheet, workbook);
			//输出数据部分
			writeData(sheet, workbook);
			
			//输出Excel
			os = new FileOutputStream(path + name);
			workbook.write(os);
			log.info("createExcel fileName=[" + path + name + "] success.");
		} catch (Exception e) {
			log.error("createExcel fileName=[" + path + name + "] error:" + e);
		} finally {
			try {
				os.close();
			} catch (Exception e) {
				log.error("createExcel close os error:" + e);
			}
		}
	}
	
	/**
	 * 导出Excel2007
	 * @param out
	 */
	public void exportExcel(OutputStream out) {
		try {
			//创建Workbook
			XSSFWorkbook workbook = new XSSFWorkbook();
			//创建Sheet
			XSSFSheet sheet = createSheet(workbook);
			//输出title
			writeTitle(sheet, workbook);
			//输出Head部分
			writeHead(sheet, workbook);
			//输出数据部分
			writeData(sheet, workbook);
			
			//输出Excel
			out.flush();
			workbook.write(out);
			out.close();
			log.info("exportExcel success.");
		} catch (Exception e) {
			log.error("exportExcel error:" + e);
		}
	}
	
	/**
	 * 创建Sheet
	 * @param workbook
	 */
	public XSSFSheet createSheet(XSSFWorkbook workbook) {
		return workbook.createSheet(sheetName);
	}
	
	/**
	 * 输出大标题
	 * @param sheet
	 */
	public void writeTitle(XSSFSheet sheet, XSSFWorkbook workbook) {
		XSSFRow row = sheet.createRow(1);
		//式样
		XSSFCellStyle style = workbook.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		row.createCell(0).setCellValue(title);
	}
	
	/**
	 * 输出Head部分
	 * @param sheet
	 */
	public void writeHead(XSSFSheet sheet, XSSFWorkbook workbook) {
		XSSFRow row = sheet.createRow(2);
		for(int i = 0; i < heads.size(); i++) {
			row.createCell(i).setCellValue(heads.get(i));
		}
	}
	
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	public void writeData(XSSFSheet sheet, XSSFWorkbook workbook) {
		XSSFRow row = null;
		for(int i = 0; i < datas.size(); i++) {
			row = sheet.createRow(i + 3);
			for(int j = 0; j < heads.size(); j++) {
				row.createCell(j).setCellValue(heads.get(j));
			}
		}
	}

    /***
     * <pre>
     * 取得Workbook对象(xls和xlsx对象不同,不过都是Workbook的实现类)
     *   xls:HSSFWorkbook
     *   xlsx：XSSFWorkbook
     * @param filePath
     * @return
     * @throws IOException
     * </pre>
     */
    private Workbook getWorkbook(String filePath) throws IOException {
        Workbook workbook = null;
        InputStream is = new FileInputStream(filePath);
        if (filePath.endsWith(EXTENSION_XLS)) {
            workbook = new HSSFWorkbook(is);
        } else if (filePath.endsWith(EXTENSION_XLSX)) {
            workbook = new XSSFWorkbook(is);
        }
        return workbook;
    }

    /**
     * 文件检查
     * @param filePath
     * @throws FileNotFoundException
     * @throws FileFormatException
     */
    private void preReadCheck(String filePath) throws FileNotFoundException, FileFormatException {
        // 常规检查
        File file = new File(filePath);
        if (!file.exists()) {
            throw new FileNotFoundException("传入的文件不存在：" + filePath);
        }

        if (!(filePath.endsWith(EXTENSION_XLS) || filePath.endsWith(EXTENSION_XLSX))) {
            throw new FileFormatException("传入的文件不是excel");
        }
    }

    /**
     * 读取excel文件内容
     * @param filePath
     * @throws FileNotFoundException
     * @throws FileFormatException
     */
    public Workbook readExcel() throws FileNotFoundException, FileFormatException {
        // 检查
    	String filePath = this.filepath;
        this.preReadCheck(filePath);
        // 获取workbook对象
        Workbook workbook = null;

        try {
            workbook = this.getWorkbook(filePath);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	
        }
        
        return workbook;
    }
	
	/**
	 * 导出Excel
	 * @param out
	 */
	public void exportExcel2(OutputStream out) {
		try {
			//创建Workbook
			Workbook workbook = readExcel();
			//输出数据部分
			writeData(workbook);
			
			//输出Excel
			out.flush();
			workbook.write(out);
			out.close();
			log.info("exportExcel2 success.");
		} catch (Exception e) {
			log.error("exportExcel2 error:" + e);
		}
	}
	
	//读取DOC
	private HWPFDocument readDoc(){
		HWPFDocument doc = null;
    	String filePath = this.filepath;
        try {
            FileInputStream fis = new FileInputStream(filePath);
            doc = new HWPFDocument(fis);
            fis.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return doc;
    }
	
	/**
	 * 导出word
	 * @param out
	 */
	public void exportWord(OutputStream out) {
		try {
			//创建doc
			HWPFDocument doc = readDoc();
			//输出数据部分
			writeData(doc);
			
			//输出Excel
			out.flush();
			doc.write(out);
			out.close();
			log.info("exportWord success.");
		} catch (Exception e) {
			log.error("exportWord error:" + e);
		}
	}
	
	
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	public void writeData(Workbook workbook) {
		
	}
	
	/**
	 * 输出数据部分
	 * @param sheet
	 */
	public void writeData(HWPFDocument doc) {
		
	}

	public String getSheetName() {
		return sheetName;
	}

	public void setSheetName(String sheetName) {
		this.sheetName = sheetName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<String> getHeads() {
		return heads;
	}

	public void setHeads(List<String> heads) {
		this.heads = heads;
	}

	public List<?> getDatas() {
		return datas;
	}

	public void setDatas(List<?> datas) {
		this.datas = datas;
	}
	
	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		//String template = "page/template.xml";
		String filename = "";
		try {
			filename = Poi2007Base.class.getClassLoader().getResource("").toURI().getPath();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		filename = filename.replace("WEB-INF/classes/", "");
        
	    String file = filename + filepath;
		this.filepath = file;
	    System.out.println("filepath=:"+file);
	}

	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
}
