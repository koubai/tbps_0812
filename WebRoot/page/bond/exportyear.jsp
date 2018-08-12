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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Calendar3.js"></script>
<title>保证金检索日期</title>
<script type="text/javascript">
	function exportList() {
		var strDateStart = $("#dateStart").val();
		$("#strDateStart").attr("value", strDateStart);
		var strDateEnd = $("#dateEnd").val();
		$("#strDateEnd").attr("value", strDateEnd);
		document.mainform.action = '<c:url value="/bond/exportBond2Action.action"></c:url>';
		document.mainform.submit();
	}
</script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:hidden;">
<s:form id="mainform" name="mainform" method="POST">
	<s:hidden name="startIndexHist" id="startIndexHist"/>
	<s:hidden name="strDateStart" id="strDateStart"/>
	<s:hidden name="strDateEnd" id="strDateEnd"/>
	<s:hidden name="strAgentCode" id="strAgentCode"/>
	<s:hidden name="strProjectType" id="strProjectType"/>
	<s:hidden name="strTenderOpenDateLow" id="strTenderOpenDateLow"/>
	<s:hidden name="strTenderOpenDateHigh" id="strTenderOpenDateHigh"/>
	<div id="container" style="width: 100%; height: 100%;">
		<div class="searchbox update" style="height:0px;">
			<table width="100%" border="0" cellpadding="5" cellspacing="0">
				<tr>
					<td colspan="5">
						<label style="padding-left:300px;">请选择需要输出的日期 (如果不选择, 即全部)</label>
					</td>
				</tr>
				<tr>
					<td style="width:30px;">
						<label style="padding-left:300px;">开始</label>
					</td>
					<td style="width:120px;">
						<div class="box1_left"></div>
						<div class="box1_center date_input"">
							<input type="text" disabled="disabled" style="width: 105px;" id="dateStart" value="<s:property value="strDateStart"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('dateStart'));"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td style="width:30px;">
						<label>至</label>
					</td>
					<td style="width:120px;">
						<div class="box1_left"></div>
						<div class="box1_center date_input"">
							<input type="text" disabled="disabled" style="width: 105px;" id="dateEnd" value="<s:property value="strDateEnd"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('dateEnd'));"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td style="width:250px;">
					</td>
				</tr>
			</table>
		</div>
		<div class="btns" style="margin-top:40px; margin-left: 0px;">
			<table border="0" style="margin:0 auto;">
				<tr>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input type="button" class="input80" value="OK" onclick="exportList();"/>
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
