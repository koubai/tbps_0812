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
import com.cn.common.util.Constants;
import com.cn.common.util.PropertiesConfig;
import com.cn.common.util.StringUtil;
import com.cn.tbps.dto.AjaxDataDto;
import com.opensymphony.xwork2.ActionContext;

import net.sf.json.JSONArray;

public class FileUploadAction extends BaseAction {

	private static final long serialVersionUID = 5035507530564729164L;
	private static final Logger log = LogManager.getLogger(FileUploadAction.class);
	
	//文件上传
	private File uploadFileObj;
	private String uploadFileName;
	//文件名前缀
	private String fileNamePre;
	private String delFileName;

	/**
	 * 文件上传
	 * @return
	 * @throws IOException
	 */
	public String uploadFileAction() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		PrintWriter out;
		AjaxDataDto ajaxData = new AjaxDataDto();
		try {
			this.clearMessages();
			//验证用户是否登录
			//这里不用拦截器，以防止拦截器会导致一些奇怪的异常。
			String islogin = (String) ActionContext.getContext().getSession().get(Constants.SESSION_ISLOGIN);
			if(Constants.FLAG_IS_LOGIN.equals(islogin)) {
				if(uploadFileObj != null) {
					//保存文件
					String savePath = PropertiesConfig.getPropertiesValueByKey("file_path");
					
					//判断路径是否存在
					File savePathFile = new File(savePath);
					if(!savePathFile.exists()) {
						savePathFile.mkdir();
					}
					
					//文件名
					System.out.println("org file:"+uploadFileName);
					String picSuffix = uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1, uploadFileName.length());
					String originalname = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1, uploadFileName.length());
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
					data.put("originalname", originalname);
					data.put("fileurl", PropertiesConfig.getPropertiesValueByKey("file_url"));
					ajaxData.setData(data);
				} else {
					ajaxData.setResultCode(1001);
					ajaxData.setResultMessage("文件不能为空！");
				}
				uploadFileObj = null;
				fileNamePre = "";
				uploadFileName = "";
			} else {
				ajaxData.setResultCode(1002);
				ajaxData.setResultMessage("您未登录或Session失效！");
			}
		} catch(Exception e) {
			ajaxData.setResultCode(-1);
			ajaxData.setResultMessage("uploadFileAction error：" + e.getMessage());
		}
		out = response.getWriter();
		String result = JSONArray.fromObject(ajaxData).toString();
		result = result.substring(1, result.length() - 1);
		log.info(result);
		out.write(result);
		out.flush();
		return null;
	}


	/**
	 * 文件删除
	 * @return
	 * @throws IOException
	 */
	public String delFileAction() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		PrintWriter out;
		AjaxDataDto ajaxData = new AjaxDataDto();
		try {
			this.clearMessages();
			//验证用户是否登录
			//这里不用拦截器，以防止拦截器会导致一些奇怪的异常。
			String islogin = (String) ActionContext.getContext().getSession().get(Constants.SESSION_ISLOGIN);
			if(Constants.FLAG_IS_LOGIN.equals(islogin)) {
				if(delFileName != null && !delFileName.equals("")) {
					//保存文件
					String savePath = PropertiesConfig.getPropertiesValueByKey("file_path");
					
					//判断路径是否存在
					File savePathFile = new File(savePath);
					if(!savePathFile.exists()) {
						savePathFile.mkdir();
					}
					
					String delFileName2 = savePathFile + "/" + delFileName;
					//判断文件名是不是显示路径
					if(delFileName.indexOf("/") >= 0) {
						//从路径中解析出文件名
						delFileName2 = savePathFile + "/" + delFileName.substring(delFileName.lastIndexOf("/") + 1);
					}
					//文件名
					System.out.println("del org file:" + delFileName2);
					
					File newFile = new File(delFileName2);
					if (newFile.exists()){
						FileUtil.deleteContents(newFile);						
						ajaxData.setResultCode(0);
						ajaxData.setResultMessage("文件删除成功！");	
					} else {
						ajaxData.setResultCode(1001);
						ajaxData.setResultMessage("文件不存在！");												
					}
				} else {
					ajaxData.setResultCode(1001);
					ajaxData.setResultMessage("文件名不能为空！");
				}
				delFileName = "";
			} else {
				ajaxData.setResultCode(1002);
				ajaxData.setResultMessage("您未登录或Session失效！");
			}
		} catch(Exception e) {
			ajaxData.setResultCode(-1);
			ajaxData.setResultMessage("delFileAction error：" + e.getMessage());
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
	
	public String getDelFileName() {
		return delFileName;
	}


	public void setDelFileName(String delFileName) {
		this.delFileName = delFileName;
	}



}
