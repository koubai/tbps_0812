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
<title>
中标公司一览
</title>
<script type="text/javascript">
	$(function() {
	});
	
	//选择中标公司
	function addBidComp() {
		var obj = null;
		var list = document.getElementsByName("checkKey");
		var querybidname = ",'";
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				obj = list[i];
				if(list[i].value != ""){
					if(querybidname.indexOf(",'" + list[i].value + "',") == -1){
						querybidname += list[i].value + "','";
					}
				}
			}
		}
		
		if(obj == null) {
			alert("请选择一个公司！");
			return;
		}
		
		querybidname = querybidname.substring(1, querybidname.length - 2);
		//中标公司
		window.dialogArguments.document.getElementById("bidCoName").value = querybidname;
		window.close();
	}
</script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:hidden;">
<s:form id="mainform" name="mainform" method="POST">
	<s:hidden name="startIndexAgentComp" id="startIndexAgentComp"/>
	<s:hidden name="agentAddFlag" id="agentAddFlag"/>
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
						中标公司信息一览
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
					<tr class="tittle">
						<td width="50"></td>
						<td width="160">
								中标公司名称
						</td>
					</tr>
					<s:iterator id="listBidCo" value="listBidCo" status="st1">
						<s:if test="#st1.odd==true">
							<tr class="tr_bg">
						</s:if>
						<s:else>
							<tr>
						</s:else>
							<td><input name="checkKey" type="checkbox" value="<s:property value="BID_CO_NAME"/>"/></td>
							<td><s:property value="BID_CO_NAME"/></td>
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
								<input type="button" class="input80" value="确定" onclick="addBidComp();"/>
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
