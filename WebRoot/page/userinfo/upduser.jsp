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
<title>用户信息修改</title>
<script type="text/javascript">
	function upd() {
		var LOGIN_ID = $("#LOGIN_ID").val().trim();
		var LOGIN_NAME = $("#LOGIN_NAME").val().trim();
		var LOGIN_PW = $("#LOGIN_PW").val().trim();
		var CONFIRM_PW = $("#CONFIRM_PW").val().trim();
		var RANK = $("#RANK").val().trim();
		var tmpMEMO1 = $("#tmpMEMO1").val();
		$("#MEMO1").attr("value", tmpMEMO1);
		if(LOGIN_ID == "") {
			alert("登录ID不能为空！");
			$("#LOGIN_ID").focus();
			return;
		}
		if(LOGIN_NAME == "") {
			alert("登录姓名不能为空！");
			$("#LOGIN_NAME").focus();
			return;
		}
		if(LOGIN_PW == "") {
			alert("登录密码不能为空！");
			$("#LOGIN_PW").focus();
			return;
		}
		if(CONFIRM_PW == "") {
			alert("确认密码不能为空！");
			$("#CONFIRM_PW").focus();
			return;
		}
		if(LOGIN_PW != CONFIRM_PW) {
			alert("两次密码不一致！");
			$("#LOGIN_PW").focus();
			return;
		}
		if(RANK == "") {
			alert("用户类型不能为空！");
			$("#RANK").focus();
			return;
		}
		if(tmpMEMO1.length > 40) {
			alert("备注不能超过40个字！");
			$("#tmpMEMO1").focus();
			return;
		}
		document.mainform.action = '<c:url value="/userinfo/updUserInfoAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//页面关闭响应
	window.onunload = function() {
		//刷新父页面
		//window.dialogArguments.document.mainform.action = '<c:url value="/userinfo/queryUserInfoAction.action"></c:url>';
		window.dialogArguments.document.mainform.action = '<c:url value="/userinfo/turnUserInfoAction.action"></c:url>';
		window.dialogArguments.document.mainform.submit();
	};

</script>
<base target="_self"/>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:scroll;">
<s:form id="mainform" name="mainform" method="POST">
	<s:hidden name="updUserInfoDto.MEMO1" id="MEMO1"></s:hidden>
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					用户信息修改
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
				<td><font color="red">*</font>登录ID</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="updUserInfoDto.LOGIN_ID" id="LOGIN_ID" disabled="true" cssStyle="width:300px;" maxlength="4" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td><font color="red">*</font>登录姓名</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="updUserInfoDto.LOGIN_NAME" id="LOGIN_NAME" cssStyle="width:300px;" maxlength="10" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td><font color="red">*</font>登录密码</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:password name="updUserInfoDto.LOGIN_PW" id="LOGIN_PW" cssStyle="width:300px;" theme="simple" maxlength="16"></s:password>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td><font color="red">*</font>确认密码</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:password name="updUserInfoDto.CONFIRM_PW" id="CONFIRM_PW" cssStyle="width:300px;" theme="simple" maxlength="16"></s:password>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td><font color="red">*</font>用户类型</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<select style="width: 300px;" name="updUserInfoDto.RANK" id="RANK">
							<s:if test='updUserInfoDto.RANK == "L"'>
								<option value="A">一般用户</option>
								<option value="L" selected="selected">管理员</option>
								<option value="C">负责人</option>
								<option value="B">工程师</option>
							</s:if>
							<s:elseif test='updUserInfoDto.RANK == "C"'>
								<option value="A">一般用户</option>
								<option value="L">管理员</option>
								<option value="C" selected="selected">负责人</option>
								<option value="B">工程师</option>
							</s:elseif>
							<s:elseif test='updUserInfoDto.RANK == "B"'>
								<option value="A">一般用户</option>
								<option value="L">管理员</option>
								<option value="C">负责人</option>
								<option value="B" selected="selected">工程师</option>
							</s:elseif>
							<s:else>
								<option value="A" selected="selected">一般用户</option>
								<option value="L">管理员</option>
								<option value="C">负责人</option>
								<option value="B">工程师</option>
							</s:else>
						</select>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>备注</td>
				<td>
					<textarea name="" id="tmpMEMO1" cols="" rows="5" style="width:300px;"><s:property value="updUserInfoDto.MEMO1"/></textarea>
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
