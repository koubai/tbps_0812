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
<title>代扣信息输入</title>
<script type="text/javascript">
	function add() {
		$("#WITHHOLD_DATE").attr("value", document.getElementById("withholdDate").value);
		var WITHHOLD_NO = $("#WITHHOLD_NO").val();
		var WITHHOLD_TYPE = $("#WITHHOLD_TYPE").val();
		var WITHHOLD_DATE = $("#WITHHOLD_DATE").val();
		var WITHHOLD_AMOUNT = $("#WITHHOLD_AMOUNT").val();
		var WITHHOLD_REASON = $("#WITHHOLD_REASON").val();
		if(WITHHOLD_NO == "") {
			alert("代扣代码不能为空！");
			$("#WITHHOLD_NO").focus();
			return;
		}
		if(WITHHOLD_TYPE == "") {
			alert("请选择代扣分类！");
			$("#WITHHOLD_TYPE").focus();
			return;
		}
		if(WITHHOLD_DATE == "") {
			alert("代扣日期不能为空！");
			$("#WITHHOLD_DATE").focus();
			return;
		}
		if(WITHHOLD_AMOUNT == "") {
			alert("代扣金额不能为空！");
			$("#WITHHOLD_AMOUNT").focus();
			return;
		}
		if(!isReal(WITHHOLD_AMOUNT)) {
			alert("代扣金额格式不正确！");
			$("#WITHHOLD_AMOUNT").focus();
			return;
		}
		if(WITHHOLD_REASON == "") {
			alert("用途不能为空！");
			$("#RANK").focus();
			return;
		}
		document.mainform.action = '<c:url value="/withhold/addWithholdAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//页面关闭响应
	window.onunload = function() {
		//刷新父页面
		window.dialogArguments.document.mainform.action = '<c:url value="/withhold/queryWithholdAction.action"></c:url>';
		window.dialogArguments.document.mainform.submit();
	};

</script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:scroll;">
<s:form id="mainform" name="mainform" method="POST">
	<s:hidden name="addWithhold.WITHHOLD_DATE" id="WITHHOLD_DATE"></s:hidden>
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					代扣信息输入
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
				<td><font color="red">*</font>代扣代码</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addWithhold.WITHHOLD_NO" id="WITHHOLD_NO" cssStyle="width:300px;" maxlength="10" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td><font color="red">*</font>代扣分类</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<select style="width: 300px;" name="addWithhold.WITHHOLD_TYPE" id="RANK">
							<s:if test='addWithhold.WITHHOLD_TYPE == "G"'>
								<option value="G" selected="selected">工资</option>
								<option value="B">办公费</option>
								<option value="F">房租</option>
								<option value="D">电费</option>
								<option value="Q">其他</option>
							</s:if>
							<s:elseif test='addWithhold.WITHHOLD_TYPE == "B"'>
								<option value="G">工资</option>
								<option value="B" selected="selected">办公费</option>
								<option value="F">房租</option>
								<option value="D">电费</option>
								<option value="Q">其他</option>
							</s:elseif>
							<s:elseif test='addWithhold.WITHHOLD_TYPE == "F"'>
								<option value="G">工资</option>
								<option value="B">办公费</option>
								<option value="F" selected="selected">房租</option>
								<option value="D">电费</option>
								<option value="Q">其他</option>
							</s:elseif>
							<s:elseif test='addWithhold.WITHHOLD_TYPE == "D"'>
								<option value="G">工资</option>
								<option value="B">办公费</option>
								<option value="F">房租</option>
								<option value="D" selected="selected">电费</option>
								<option value="Q">其他</option>
							</s:elseif>
							<s:elseif test='addWithhold.WITHHOLD_TYPE == "Q"'>
								<option value="G">工资</option>
								<option value="B">办公费</option>
								<option value="F">房租</option>
								<option value="D">电费</option>
								<option value="Q" selected="selected">其他</option>
							</s:elseif>
							<s:else>
								<option value="G" selected="selected">工资</option>
								<option value="B">办公费</option>
								<option value="F">房租</option>
								<option value="D">电费</option>
								<option value="Q">其他</option>
							</s:else>
						</select>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td><font color="red">*</font>代扣日期</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center date_input">
						<input type="text" id="withholdDate" style="width:285px;" disabled="disabled" value="<s:date name="addWithhold.WITHHOLD_DATE" format="yyyy-MM-dd" />"/>
						<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('withholdDate'));"></a>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td><font color="red">*</font>代扣金额</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addWithhold.WITHHOLD_AMOUNT" id="WITHHOLD_AMOUNT" cssStyle="width:300px;" maxlength="12" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td><font color="red">*</font>用途</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addWithhold.WITHHOLD_REASON" id="WITHHOLD_REASON" cssStyle="width:300px;" maxlength="60" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<div class="btn">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input class="input80" type="button" value="追加" onclick="add();"/>
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
