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
<title>消息输入</title>
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
		var RECEIVE_USER = $("#RECEIVE_USER").val().trim();
		var MSG_TITLE = $("#MSG_TITLE").val().trim();
		var tmpMSG_CONTENT = $("#tmpMSG_CONTENT").val().trim();
		if(RECEIVE_USER == "") {
			alert("请选择收件人！");
			$("#RECEIVE_USER").focus();
			return;
		}
		if(MSG_TITLE == "") {
			alert("消息标题不能为空！");
			$("#MSG_TITLE").focus();
			return;
		}
		if(tmpMSG_CONTENT == "") {
			alert("消息内容不能为空！");
			$("#tmpMSG_CONTENT").focus();
			return;
		}
		if(tmpMSG_CONTENT.length > 1000) {
			alert("消息内容不能超过1000个字！");
			$("#tmpMSG_CONTENT").focus();
			return;
		}
		$("#MSG_CONTENT").attr("value", tmpMSG_CONTENT);
		document.mainform.action = '<c:url value="/mesg/addMesgAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function goUserList() {
		document.mainform.action = '<c:url value="/mesg/queryMesgList.action"></c:url>';
		document.mainform.submit();
	}
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<s:form id="mainform" name="mainform" method="POST">
			<s:hidden name="addMesgDto.MSG_CONTENT" id="MSG_CONTENT"></s:hidden>
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
								<h5>消息输入</h5>
								<div class="row">
									<label class="col-lg-2 form-label">收件人</label>
									<div class="col-lg-8">
										<select name="addMesgDto.RECEIVE_USER" id="RECEIVE_USER" class="form-control">
											<option value="">请选择</option>
											<s:iterator id="userInfoList" value="userInfoList" status="st1">
												<option value="<s:property value="LOGIN_ID"/>" <s:if test="%{addMesgDto.RECEIVE_USER == LOGIN_ID}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
											</s:iterator>
										</select>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">消息标题</label>
									<div class="col-lg-8">
										<s:textfield name="addMesgDto.MSG_TITLE" id="MSG_TITLE" cssClass="form-control" maxlength="64" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">消息内容</label>
									<div class="col-lg-8">
										<textarea name="" id="tmpMSG_CONTENT" cols="" rows="5" class="form-control"><s:property value="addMesgDto.MSG_CONTENT"/></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="operationBtns addBtns mgt15 btn3">
						<button type="button" class="btn btn-success" onclick="add();">发送</button>
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
