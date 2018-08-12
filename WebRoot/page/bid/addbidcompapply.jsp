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
<title>报名内容</title>
<script type="text/javascript">
	$(function() {
		var applyNoteSeq = $("#applyNoteSeq").val();
		var tmp = window.dialogArguments.document.getElementById("saveBidCompApply" + applyNoteSeq).value;
		if(tmp != "") {
			//var list = tmp.split("####");
			/*
			for() {
			}//*/
		}
	});
	
	function addBidCompApply() {
		var list = document.getElementsByName("applynote");
		var prelist = document.getElementsByName("applynotepre");
		var applyNoteSeq = $("#applyNoteSeq").val();
		if(list.length == 0) {
			alert("报名要求为空！");
			return;
		}
		var tmpapplynote = "";
		for(var i = 0; i < list.length; i++) {
			if(list[i].value == "") {
				alert("报名内容不能为空！");
				list[i].focus();
				return;
			}
			tmpapplynote += prelist[i].value + "@@@@" + list[i].value + "####";
		}
		var id = "saveBidCompApply" + applyNoteSeq;
		window.dialogArguments.document.getElementById(id).value = tmpapplynote;
		
		window.dialogArguments.document.getElementById("applyNoteBtn" + applyNoteSeq).style.backgroundColor = "#5BB65B";
		//更改标志
		window.dialogArguments.document.getElementById("agentCompEditFlag").value = "1";
		window.close();
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:hidden;">
<s:form id="mainform" name="mainform" method="POST">
	<s:hidden id="applyNoteSeq" name="applyNoteSeq"></s:hidden>
	<s:hidden id="applyNoteBidNo" name="applyNoteBidNo"></s:hidden>
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					报名内容输入
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
						<td width="60">编号</td>
						<td width="350">报名要求</td>
						<td width="350">报名内容</td>
					</tr>
					<tbody id="bidCompApplyData">
						<s:iterator id="listBidCompApply" value="listBidCompApply" status="st1">
							<tr style="height: 30px;">
								<td><s:property value="#st1.index + 1"/></td>
								<td><s:property value="APPLY_REQUIRE"/></td>
								<td>
									<input name="applynotepre" type="hidden" value="<s:property value="ID"/>@@@@<s:property value="APPLY_REQUIRE"/>"/>
									<input name="applynote" type="text" style="width: 340px;" value="<s:property value="APPLY_NOTE"/>"/>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
		<table border="0" cellspacing="15" cellpadding="0" style="margin:20px auto">
			<tr>
				<td>&nbsp;</td>
				<td colspan="3">
					<div class="btn">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input class="input80" type="button" value="确定" onclick="addBidCompApply();"/>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="btn">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input class="input80" type="button" value="取消" onclick="window.close();"/>
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
