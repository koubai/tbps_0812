<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<title>合同信息修改</title>
<script type="text/javascript">
	function upd() {
		var AUDIT_COMP_NO = $("#AUDIT_COMP_NO").val().trim();
		var AUDIT_COMP_NAME = $("#AUDIT_COMP_NAME").val().trim();
		var AUDIT_COMP_CLIENT = $("#AUDIT_COMP_CLIENT").val().trim();
		if(AUDIT_COMP_NO == "") {
			alert("合同代码不能为空！");
			$("#AUDIT_COMP_NO").focus();
			return;
		}
		if(AUDIT_COMP_NAME == "") {
			alert("合同名称不能为空！");
			$("#AUDIT_COMP_NAME").focus();
			return;
		}		
		if(AUDIT_COMP_CLIENT == "") {
			alert("甲方不能为空！");
			$("#AUDIT_COMP_CLIENT").focus();
			return;
		}
		document.mainform.action = '<c:url value="/auditcomp/updAuditCompAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//委托公司
	function selectAgentComp() {
		var url = '<c:url value="/bid/showAddBidAgentCompAction.action"></c:url>';
		url += "?agentAddFlag=11&date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}

	//页面关闭响应
	window.onunload = function() {
		//刷新父页面
		window.dialogArguments.document.mainform.action = '<c:url value="/auditcomp/queryAuditCompList.action"></c:url>';
		window.dialogArguments.document.mainform.submit();
	};

</script>
<base target="_self"/>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:scroll;">
<s:form id="mainform" name="mainform" method="POST">
	<s:hidden name="updateAuditCompDto.AUDIT_COMP_NO" id="AUDIT_COMP_NO"></s:hidden>
	<s:hidden name="updateAuditCompDto.AUDIT_COMP_CLIENTID" id="AUDIT_COMP_CLIENTID"></s:hidden>
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					合同信息修改
				</div>
				<div class="tittle_right">
				</div>
			</div>
		</div>
		<div style="position:absolute; margin-left: 150px; margin-top: 10px; text-align: center; color: red;">
			<s:actionmessage />
		</div>
		<table style="margin-left: 50px; margin-top: 30px;" border="0" cellspacing="15" cellpadding="0">
			<tr>
				<td width="120"><font color="red">*</font>合同代码</td>
				<td width="500">&nbsp;<s:property value="updateAuditCompDto.AUDIT_COMP_NO"/></td>
			</tr>
			<tr>
				<td><font color="red">*</font>合同名称</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="updateAuditCompDto.AUDIT_COMP_NAME" id="AUDIT_COMP_NAME" cssStyle="width:350px;" maxlength="40" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td><font color="red">&nbsp</font>甲方</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="updateAuditCompDto.AUDIT_COMP_CLIENT" id="AUDIT_COMP_CLIENT" cssStyle="width:350px;" maxlength="40" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
					<div class="btn">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input id="agentCompBtn" class="input40" type="button" value="检索" onclick="selectAgentComp()" />
						</div>
						<div class="box1_right"></div>
					</div>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<div class="btn">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input class="input80" type="button" value="修改" onclick="upd();"/>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="btn">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input class="input80" type="button" value="关闭" onclick="window.close();"/>
						</div>
						<div class="box1_right"></div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</s:form>
</body>
</html>
