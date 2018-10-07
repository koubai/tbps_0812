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
<title>会审监管人信息输入</title>
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
		var SUPERVISE_NAME = $("#SUPERVISE_NAME").val().trim();
		var SUPERVISE_TEL1 = $("#SUPERVISE_TEL1").val().trim();
		var SUPERVISE_GENDER = $("#SUPERVISE_GENDER").val().trim();
		var SUPERVISE_COMP = $("#SUPERVISE_COMP").val().trim();
		var tmpMEMO1 = $("#tmpMEMO1").val();
		$("#MEMO1").attr("value", tmpMEMO1);
		if(SUPERVISE_NAME == "") {
			alert("姓名不能为空！");
			$("#SUPERVISE_NAME").focus();
			return;
		}
		if(SUPERVISE_TEL1 == "") {
			alert("联系电话不能为空！");
			$("#SUPERVISE_TEL1").focus();
			return;
		}
		if(SUPERVISE_GENDER == "") {
			//alert("请选择性别！");
			//$("#SUPERVISE_GENDER").focus();
			//return;
		}
		if(SUPERVISE_COMP == "") {
			//alert("就职公司不能为空！");
			//$("#SUPERVISE_COMP").focus();
			//return;
		}
		if(tmpMEMO1.length > 40) {
			alert("备注不能超过40个字！");
			$("#tmpMEMO1").focus();
			return;
		}
		document.mainform.action = '<c:url value="/superviselib/addSuperviseLibAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function goSuperviseLibList() {
		document.mainform.action = '<c:url value="/superviselib/querySuperviseLibAction.action"></c:url>';
		document.mainform.submit();
	}
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<s:form id="mainform" name="mainform" method="POST">
			<s:hidden name="addSuperviseLibDto.MEMO1" id="MEMO1"></s:hidden>
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
								<h5>会审监管人信息输入</h5>
								<div class="row">
									<label class="col-lg-2 form-label">姓名</label>
									<div class="col-lg-8">
										<s:textfield name="addSuperviseLibDto.SUPERVISE_NAME" id="SUPERVISE_NAME" cssClass="form-control" maxlength="8" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">联系电话</label>
									<div class="col-lg-8">
										<s:textfield name="addSuperviseLibDto.SUPERVISE_TEL1" id="SUPERVISE_TEL1" cssClass="form-control" maxlength="12" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">性别</label>
									<div class="col-lg-8">
										<select name="addSuperviseLibDto.SUPERVISE_GENDER" id="SUPERVISE_GENDER" class="form-control">
											<option value="">请选择</option>
											<s:if test='addSuperviseLibDto.SUPERVISE_GENDER == "1"'>
												<option value="1" selected="selected">男</option>
												<option value="2">女</option>
											</s:if>
											<s:elseif test='addSuperviseLibDto.SUPERVISE_GENDER == "2"'>
												<option value="1">男</option>
												<option value="2" selected="selected">女</option>
											</s:elseif>
											<s:else>
												<option value="1">男</option>
												<option value="2">女</option>
											</s:else>
										</select>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">就职公司</label>
									<div class="col-lg-8">
										<s:textfield name="addSuperviseLibDto.SUPERVISE_COMP" id="SUPERVISE_COMP" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">备注</label>
									<div class="col-lg-8">
										<textarea name="" id="tmpMEMO1" cols="" rows="5" class="form-control"><s:property value="addSuperviseLibDto.MEMO1"/></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="operationBtns addBtns mgt15 btn3">
						<button type="button" class="btn btn-success" onclick="add();">追加</button>
						<button type="button" class="btn btn-success" onclick="goSuperviseLibList();">返回</button>
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
