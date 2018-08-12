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
<s:if test='agentAddFlag == "1"'>
委托公司一览
</s:if>
<s:elseif test='agentAddFlag == "2"'>
专业公司一览
</s:elseif>
<s:else>
承包公司一览
</s:else>
</title>
<script type="text/javascript">
	$(function() {
	});
	
	//选择委托公司
	function addAgent() {
		var obj = null;
		var list = document.getElementsByName("checkKey");
		var queryagentname = ",'";
		var queryagentmamager = ",'";
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				obj = list[i];
				if(list[i].title != ""){
					if(queryagentname.indexOf(",'" + list[i].title + "',") == -1){
						queryagentname += list[i].title + "','";
					}
				}
				if(list[i].value != ""){
					if(queryagentmamager.indexOf(",'" + list[i].value + "',") == -1){
						queryagentmamager += list[i].value + "','";
					}
				}
			}
		}
		
		if(obj == null) {
			alert("请选择一个公司！");
			return;
		}
		
		queryagentname = queryagentname.substring(1, queryagentname.length - 2);
		queryagentmamager = queryagentmamager.substring(1, queryagentmamager.length - 2);
		//委托公司
		window.dialogArguments.document.getElementById("agentCoName").value = queryagentname;
		window.dialogArguments.document.getElementById("agentCoManager").value = queryagentmamager;
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
					<s:if test='agentAddFlag == "1"'>
						委托公司信息一览
					</s:if>
					<s:elseif test='agentAddFlag == "2"'>
						专业公司信息一览
					</s:elseif>
					<s:else>
						承包公司信息一览
					</s:else>
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
						<td width="90">
							<s:if test='agentAddFlag == "1"'>
								委托公司代码
							</s:if>
							<s:elseif test='agentAddFlag == "2"'>
								专业公司代码
							</s:elseif>
							<s:else>
								承包公司代码
							</s:else>
						</td>
						<td width="160">
							<s:if test='agentAddFlag == "1"'>
								委托公司名称
							</s:if>
							<s:elseif test='agentAddFlag == "2"'>
								专业公司名称
							</s:elseif>
							<s:else>
								承包公司名称
							</s:else>
						</td>
						<td width="400">联系人</td>
					</tr>
					<s:iterator id="listAgentCo" value="listAgentCo" status="st1">
						<s:if test="#st1.odd==true">
							<tr class="tr_bg">
						</s:if>
						<s:else>
							<tr>
						</s:else>
							<td><input name="checkKey" type="checkbox" title="<s:property value="AGENT_CO_NAME"/>" value="<s:property value="AGENT_CO_MANAGER"/>"/></td>
							<td><s:property value="AGENT_NO"/></td>
							<td><s:property value="AGENT_CO_NAME"/></td>
							<td><s:property value="AGENT_CO_MANAGER"/></td>
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
								<input type="button" class="input80" value="确定" onclick="addAgent();"/>
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
