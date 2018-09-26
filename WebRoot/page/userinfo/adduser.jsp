<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>用户信息输入</title>
<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/global.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/local.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
	function add() {
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
		document.mainform.action = '<c:url value="/userinfo/addUserInfoAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function goUserList() {
		document.mainform.action = '<c:url value="/userinfo/queryUserInfoAction.action"></c:url>';
		document.mainform.submit();
	}
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<s:form id="mainform" name="mainform" method="POST">
			<s:hidden name="addUserInfoDto.MEMO1" id="MEMO1"></s:hidden>
			<div class="row">
				<div class="container-fluid">
					<s:if test="hasActionMessages()">
						<div class="row">
							<span style="color:red; text-align:center;"><s:actionmessage /></span>
						</div>
					</s:if>
					<div class="row">
						<div class="col-lg-12">
							<div class="box">
								<h5>用户信息输入</h5>
								<div class="row">
									<label class="col-lg-2 form-label">登录ID</label>
									<div class="col-lg-8">
										<s:textfield name="addUserInfoDto.LOGIN_ID" id="LOGIN_ID" cssClass="form-control" maxlength="4" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">登录姓名</label>
									<div class="col-lg-8">
										<s:textfield name="addUserInfoDto.LOGIN_NAME" id="LOGIN_NAME" cssClass="form-control" maxlength="10" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">登录密码</label>
									<div class="col-lg-8">
										<s:password name="addUserInfoDto.LOGIN_PW" id="LOGIN_PW" cssClass="form-control" maxlength="16" theme="simple"></s:password>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">确认密码</label>
									<div class="col-lg-8">
										<s:password name="addUserInfoDto.CONFIRM_PW" id="CONFIRM_PW" cssClass="form-control" maxlength="16" theme="simple"></s:password>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">用户类型</label>
									<div class="col-lg-8">
										<select name="addUserInfoDto.RANK" id="RANK" class="form-control">
											<s:if test='addUserInfoDto.RANK == "L"'>
												<option value="A">一般用户</option>
												<option value="L" selected="selected">管理员</option>
												<option value="C">负责人</option>
												<option value="B">工程师</option>
											</s:if>
											<s:elseif test='addUserInfoDto.RANK == "C"'>
												<option value="A">一般用户</option>
												<option value="L">管理员</option>
												<option value="C" selected="selected">负责人</option>
												<option value="B">工程师</option>
											</s:elseif>
											<s:elseif test='addUserInfoDto.RANK == "B"'>
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
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">备注</label>
									<div class="col-lg-8">
										<textarea name="" id="tmpMEMO1" cols="" rows="5" class="form-control"><s:property value="addUserInfoDto.MEMO1"/></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="operationBtns addBtns mgt15 btn3">
						<button type="button" class="btn btn-success" onclick="add();">追加</button>
						<button type="button" class="btn btn-success" onclick="goUserList();">返回</button>
					</div>
				</div>
			</div>
		</s:form>
	</div>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath()%>/node_modules/jquery/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath()%>/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.zh-CN.min.js"></script>
<script>
	$('.datepicker').parent().datepicker({
		"autoclose":true,"format":"yyyy-mm-dd","language":"zh-CN"
	});
</script>
</body>
</html>
