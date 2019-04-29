<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>审价/招标管理系统</title> <!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/global.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/local.css" />

<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
$(document).ready(function(){
	var h = document.documentElement.clientHeight;
	$("#container").css("height", h);
});

function resetpwd() {
	document.mainform.action = '<c:url value="/login/resetAction.action"></c:url>';
	document.mainform.submit();
}
</script>
</head>
<body>
	<jsp:include page="head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="info.jsp" flush="true" /><div class="container">
		<h3 class="title">重置密码<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
		<s:form id="mainform" name="mainform" cssClass="form-horizontal loginBox" method="POST">
			<s:if test="hasActionMessages()">
				<div class="row">
					<span style="color:red; text-align:center;"><s:actionmessage /></span>
				</div>
			</s:if>
			<div class="form-group">
				<label for="userName" class="col-lg-3 control-label" style=" color: #fff; font: sans-serif, bold; font-size:16px;">用户名</label>
				<div class="col-lg-9">
					<input type="text" name="userLoginDto.LOGIN_ID" class="form-control" maxlength="4" id="LOGIN_ID" value="<s:property value="userLoginDto.LOGIN_ID"/>" placeholder="请输入用户名">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-lg-3 control-label" style=" color: #fff; font: sans-serif, bold; font-size:16px;">旧密码</label>
				<div class="col-lg-9">
					<input type="password" name="userLoginDto.LOGIN_PW_OLD" class="form-control" maxlength="16" id="LOGIN_PW_OLD" placeholder="请输入旧密码">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-lg-3 control-label" style=" color: #fff; font: sans-serif, bold; font-size:16px;">新密码</label>
				<div class="col-lg-9">
					<input type="password" name="userLoginDto.LOGIN_PW" class="form-control" maxlength="16" id="LOGIN_PW" placeholder="请输入新密码">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-lg-3 control-label" style=" color: #fff; font: sans-serif, bold; font-size:16px;">确认密码</label>
				<div class="col-lg-9">
					<input type="password" name="userLoginDto.CONFIRM_PW" class="form-control" maxlength="16" id="CONFIRM_PW" placeholder="请再次输入新密码">
				</div>
			</div>
			<br/>
			<div class="form-group">
				<div class="col-lg-offset-3 col-lg-9">
					<button type="submit" class="btn btn-success" onclick="resetpwd();">修改</button>
					<button class="btn btn-default" style="margin-left: 100px">重置</button>
				</div>
			</div>
		</s:form>
	</div>
	</div>
	<!--  <div class="bottom">
		<div class="container">
			<img src="<%=request.getContextPath()%>/images/footer.gif" alt="">
		</div>
	</div> -->
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath()%>/node_modules/jquery/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath()%>/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
