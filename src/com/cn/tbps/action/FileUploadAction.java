package com.cn.tbps.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;

import com.cn.common.action.BaseAction;
import com.cn.common.util.PropertiesConfig;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.AjaxDataDto;

import net.sf.json.JSONArray;

public class FileUploadAction extends BaseAction {

	private static final long serialVersionUID = 5035507530564729164L;
	private static final Logger log = LogManager.getLogger(FileUploadAction.class);
	
	//文件上传
	private File uploadFileObj;
	private String uploadFileName;
	//文件名前缀
	private String fileNamePre;

	/**
	 * 文件上传
	 * @return
	 * @throws IOException
	 */
	public String uploadFileAction() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		AjaxDataDto ajaxData = new AjaxDataDto();
		try {
			this.clearMessages();
			if(uploadFileObj != null) {
				//保存文件
				String savePath = PropertiesConfig.getPropertiesValueByKey("file_path");
				
				//判断路径是否存在
				File savePathFile = new File(savePath);
				if(!savePathFile.exists()) {
					savePathFile.mkdir();
				}
				
				//文件名
				String picSuffix = uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1, uploadFileName.length());
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
				String uuid = UUID.randomUUID().toString();
				if(StringUtil.isBlank(fileNamePre)) {
					fileNamePre = "";
				}
				String filename = fileNamePre + sdf.format(date) + uuid.substring(uuid.length() - 5, uuid.length()) + "." + picSuffix;
				
				//将上传的文件copy到指定目录下
				File newFile = new File(savePath + filename);
				FileUtil.copyFile(uploadFileObj, newFile);
				
				ajaxData.setResultCode(0);
				Map<String, String> data = new HashMap<String, String>();
				data.put("filename", filename);
				data.put("fileurl", PropertiesConfig.getPropertiesValueByKey("file_url"));
				ajaxData.setData(data);
			} else {
				ajaxData.setResultCode(1001);
				ajaxData.setResultMessage("文件不能为空！");
			}
			uploadFileObj = null;
			fileNamePre = "";
			uploadFileName = "";
		} catch(Exception e) {
			ajaxData.setResultCode(-1);
			ajaxData.setResultMessage("uploadFileAction error：" + e.getMessage());
			return ERROR;
		}
		out = response.getWriter();
		String result = JSONArray.fromObject(ajaxData).toString();
		result = result.substring(1, result.length() - 1);
		log.info(result);
		out.write(result);
		out.flush();
		return null;
	}

	public File getUploadFileObj() {
		return uploadFileObj;
	}

	public void setUploadFileObj(File uploadFileObj) {
		this.uploadFileObj = uploadFileObj;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getFileNamePre() {
		return fileNamePre;
	}

	public void setFileNamePre(String fileNamePre) {
		this.fileNamePre = fileNamePre;
	}
}
