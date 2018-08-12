<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base target="_self"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<title>专业</title>
<script type="text/javascript">
	$(function() {
	});
	
	//清空选择
	function clearSelect() {
		var list = document.getElementsByName("major");
		for(var i = 0; i < list.length; i++) {
			list[i].checked = false;
		}
	}
	
	function OK() {
		var list = document.getElementsByName("major");
		var querymajor = "";
		var querymajorname = "";
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				querymajorname += list[i].title + "，";
				querymajor += list[i].value + ",";
			}
		}
		if(querymajor != "") {
			querymajor = querymajor.substring(0, querymajor.length - 1);
			querymajorname = querymajorname.substring(0, querymajorname.length - 1);
			//专业查询条件
			window.dialogArguments.document.getElementById("strExpertMajor").value = querymajor;
			window.dialogArguments.document.getElementById("strExpertMajorName").value = querymajorname;
			window.dialogArguments.document.getElementById("expertMajorName").innerHTML = querymajorname;
			window.close();
		} else {
			alert("请选择专业！");
		}
	}
</script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:hidden;">
<s:form id="mainform" name="mainform" method="POST">
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					专业选择
				</div>
				<div class="tittle_right">
				</div>
			</div>
		</div>
		<div class="data_table" style="padding:0px;">
			<div class="tab_tittle">
				<table width="100%" border="1" cellpadding="5" cellspacing="0">
				</table>
			</div>
			<div class="tab_content">
				<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
					<s:iterator id="majorAllList" value="majorAllList" status="st1">
						<tr>
							<td width="80" align="right">
								<input type="checkbox" name="major" title="<s:property value="MAJORNAME"/>" value="<s:property value="MAJORCODE"/>"/>
							</td>
							<td width="120"><s:property value="MAJORCODE"/></td>
							<td><s:property value="MAJORNAME"/></td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
		<div class="btns" style="margin-top:40px; margin-left: 0px;">
			<table border="0" style="margin:0 auto;">
				<tr>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input type="button" class="input80" value="确定" onclick="OK();"/>
							</div>
							<div class="box1_right"></div>
						</div>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input type="button" class="input80" value="清除" onclick="clearSelect();"/>
							</div>
							<div class="box1_right"></div>
						</div>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input type="button" class="input80" value="关闭" onclick="window.close();"/>
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</s:form>
</body>
</html>
