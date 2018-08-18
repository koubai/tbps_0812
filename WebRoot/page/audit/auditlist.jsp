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
<title>审价信息一览</title>
<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/global.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
	function selectPreReport() {
		var strPreReport = $("#strPreReport").val();
		if(strPreReport == "") {
			$("#strReportLow").val("");
			$("#strReportHigh").val("");
			$("#strReportLow").attr("disabled", true);
			$("#strReportHigh").attr("disabled", true);
		} else {
			$("#strReportLow").attr("disabled", false);
			$("#strReportHigh").attr("disabled", false);
		}
	}
	
	function add() {
		document.mainform.action = '<c:url value="/audit/showAddAuditAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function upd() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			var url = '<c:url value="/audit/showUpdAuditAction.action"></c:url>' + "?updAuditNo=" + id;
			document.mainform.action = url;
			document.mainform.submit();
		}
	}
	
	function del() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			if(confirm("确定删除该记录吗？")) {
				setQueryDate();
				document.mainform.action = '<c:url value="/audit/delAuditAction.action"></c:url>' + "?delAuditNo=" + id;
				document.mainform.submit();
			}
		}
	}
	
	function showHis() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			var url = '<c:url value="/audit/showAllAuditHisAction.action"></c:url>' + "?strAuditNoHist=" + id + "&date=" + new Date();
			window.showModalDialog(url, window, "dialogheight:500px;dialogwidth:1000px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
		}
	}
	
	function showAuditDetail() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			var url = '<c:url value="/audit/showAuditDetail.action"></c:url>' + "?detailAuditNo=" + id + "&date=" + new Date();
			window.showModalDialog(url, window, "dialogheight:600px;dialogwidth:1024px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
		}
	}
	
	function getSelectedID() {
		var id = "";
		var list = document.getElementsByName("radioKey");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				id = list[i].value;
				break;
			}
		}
		return id;
	}

	//设置审价状态
	function setAuditStatus() {
		var auditstatus = "";
		var list = document.getElementsByName("auditStatus");
		for(var i = 2; i < list.length + 2; i++) {
			if(list[i - 2].checked) {
				auditstatus += "" + i;
			} else {
				auditstatus += "0";
			}
		}
		$("#strAuditStatus").attr("value", auditstatus);
	}
	
	function setQueryDate() {
		$("#strValueDateLow").attr("value", $("#valueDateLow").val());
		$("#strValueDateHigh").attr("value", $("#valueDateHigh").val());
		$("#strDocArrDateLow").attr("value", $("#docArrDateLow").val());
		$("#strDocArrDateHigh").attr("value", $("#docArrDateHigh").val());
		
		var strPreReport = $("#strPreReport").val();
		if(strPreReport == "") {
			$("#strReportLow").attr("value", "");
			$("#strReportHigh").attr("value", "");
		}
		setAuditStatus();
	}

	function queryList() {
		setQueryDate();
		document.mainform.action = '<c:url value="/audit/queryAuditList.action"></c:url>';
		document.mainform.submit();
	}
	

	//翻页
	function changePage(pageNum) {
		setQueryDate();
		document.getElementById("startIndex").value = pageNum;
		document.mainform.action = '<c:url value="/audit/turnAuditPage.action"></c:url>';
		document.mainform.submit();
	}

	//页跳转
	function turnPage() {
		var totalPage = "${page.totalPage}";
		var turnPage = document.getElementById("pagenum").value;
		//判断是否输入页码
		if ('' != turnPage) {
			//判断页码是否是大于0的数字
			if(!iscInteger(turnPage)){
				alert("页码必须是大于0的整数！");
				return;
			}
			turnPage = parseInt(turnPage);
			if(turnPage < 1){
				alert("页码必须是大于0的整数！");
				return;
			}
			//判断页码大小是否正确
			if(turnPage > parseInt(totalPage)){
				alert("页码不能超过最大页数！");
				return;
			}
			//换页
			changePage(turnPage - 1);
		} else {
			alert("页码不能为空！");
			return;
		}	
	}
	
	function exportAudit() {
		setQueryDate();
		document.mainform.action = '<c:url value="/audit/exportAuditListAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryAgentCommon() {
		setQueryDate();
		var url = '<c:url value="/agentcomp/showAgentCompCommonAction.action"></c:url>' + "?strKey=strAgentName&agentAddFlag=1&date=" + new Date();
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:1000px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function queryContractCommon() {
		setQueryDate();
		var url = '<c:url value="/agentcomp/showAgentCompCommonAction.action"></c:url>' + "?strKey=strContractName&agentAddFlag=3&date=" + new Date();
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:1000px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}

	function exportAuditReceipt() {
		setQueryDate();
		document.mainform.action = '<c:url value="/audit/exportAuditReceiptAction.action"></c:url>';
		document.mainform.submit();
	}
	
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<s:form id="mainform" name="mainform" method="POST">
			<s:hidden name="startIndex" id="startIndex"/>
			<s:hidden name="strValueDateLow" id="strValueDateLow"/>
			<s:hidden name="strValueDateHigh" id="strValueDateHigh"/>
			<s:hidden name="strDocArrDateLow" id="strDocArrDateLow"/>
			<s:hidden name="strDocArrDateHigh" id="strDocArrDateHigh"/>
			<s:hidden name="strAuditStatus" id="strAuditStatus"/>
			<div class="row">
				<%-- <jsp:include page="../menu.jsp" flush="true" /> --%>
				<div class="col-lg-10">
					<h3 class="title">审价信息一览<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
					<div class="row">
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">项目分类</label>
							<div class="col-lg-9">
								<select id="strProjectClass" name="strProjectClass" class="form-control">
									<s:if test='strProjectClass == "a"'>
										<option value="">请选择</option>
										<option value="a" selected="selected">地铁审价项目</option>
										<option value="b">地铁投资监理项目</option>
										<option value="c">地铁限价项目</option>
										<option value="d">邮政审价项目</option>
										<option value="e">投资监理项目</option>
										<option value="f">投资监理审价项目</option>
										<option value="g">其他项目</option>
									</s:if>
									<s:elseif test='strProjectClass == "b"'>
										<option value="">请选择</option>
										<option value="a">地铁审价项目</option>
										<option value="b" selected="selected">地铁投资监理项目</option>
										<option value="c">地铁限价项目</option>
										<option value="d">邮政审价项目</option>
										<option value="e">投资监理项目</option>
										<option value="f">投资监理审价项目</option>
										<option value="g">其他项目</option>
									</s:elseif>
									<s:elseif test='strProjectClass == "c"'>
										<option value="">请选择</option>
										<option value="a">地铁审价项目</option>
										<option value="b">地铁投资监理项目</option>
										<option value="c" selected="selected">地铁限价项目</option>
										<option value="d">邮政审价项目</option>
										<option value="e">投资监理项目</option>
										<option value="f">投资监理审价项目</option>
										<option value="g">其他项目</option>
									</s:elseif>
									<s:elseif test='strProjectClass == "d"'>
										<option value="">请选择</option>
										<option value="a">地铁审价项目</option>
										<option value="b">地铁投资监理项目</option>
										<option value="c">地铁限价项目</option>
										<option value="d" selected="selected">邮政审价项目</option>
										<option value="e">投资监理项目</option>
										<option value="f">投资监理审价项目</option>
										<option value="g">其他项目</option>
									</s:elseif>
									<s:elseif test='strProjectClass == "e"'>
										<option value="">请选择</option>
										<option value="a">地铁审价项目</option>
										<option value="b">地铁投资监理项目</option>
										<option value="c">地铁限价项目</option>
										<option value="d">邮政审价项目</option>
										<option value="e" selected="selected">投资监理项目</option>
										<option value="f">投资监理审价项目</option>
										<option value="g">其他项目</option>
									</s:elseif>
									<s:elseif test='strProjectClass == "f"'>
										<option value="">请选择</option>
										<option value="a">地铁审价项目</option>
										<option value="b">地铁投资监理项目</option>
										<option value="c">地铁限价项目</option>
										<option value="d">邮政审价项目</option>
										<option value="e">投资监理项目</option>
										<option value="f" selected="selected">投资监理审价项目</option>
										<option value="g">其他项目</option>
									</s:elseif>
									<s:elseif test='strProjectClass == "g"'>
										<option value="">请选择</option>
										<option value="a">地铁审价项目</option>
										<option value="b">地铁投资监理项目</option>
										<option value="c">地铁限价项目</option>
										<option value="d">邮政审价项目</option>
										<option value="e">投资监理项目</option>
										<option value="f">投资监理审价项目</option>
										<option value="g" selected="selected">其他项目</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="a">地铁审价项目</option>
										<option value="b">地铁投资监理项目</option>
										<option value="c">地铁限价项目</option>
										<option value="d">邮政审价项目</option>
										<option value="e">投资监理项目</option>
										<option value="f">投资监理审价项目</option>
										<option value="g">其他项目</option>
									</s:else>
								</select>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">项目进度</label>
							<div class="col-lg-9">
								<select id="strProjectStatus" name="strProjectStatus" class="form-control">
									<s:if test='strProjectStatus == "1"'>
										<option value="">请选择</option>
										<option value="1" selected="selected">在审</option>
										<option value="2">补交资料</option>
										<option value="3">初稿已出</option>
										<option value="4">审定单已出</option>
										<option value="5">出报告</option>
										<option value="6">快递</option>
										<option value="7">完成</option>
										<option value="8">终止</option>
										<!-- <option value="9">归档</option> -->
									</s:if>
									<s:elseif test='strProjectStatus == "2"'>
										<option value="">请选择</option>
										<option value="1">在审</option>
										<option value="2" selected="selected">补交资料</option>
										<option value="3">初稿已出</option>
										<option value="4">审定单已出</option>
										<option value="5">出报告</option>
										<option value="6">快递</option>
										<option value="7">完成</option>
										<option value="8">终止</option>
										<!-- <option value="9">归档</option> -->
									</s:elseif>
									<s:elseif test='strProjectStatus == "3"'>
										<option value="">请选择</option>
										<option value="1">在审</option>
										<option value="2">补交资料</option>
										<option value="3" selected="selected">初稿已出</option>
										<option value="4">审定单已出</option>
										<option value="5">出报告</option>
										<option value="6">快递</option>
										<option value="7">完成</option>
										<option value="8">终止</option>
										<!-- <option value="9">归档</option> -->
									</s:elseif>
									<s:elseif test='strProjectStatus == "4"'>
										<option value="">请选择</option>
										<option value="1">在审</option>
										<option value="2">补交资料</option>
										<option value="3">初稿已出</option>
										<option value="4" selected="selected">审定单已出</option>
										<option value="5">出报告</option>
										<option value="6">快递</option>
										<option value="7">完成</option>
										<option value="8">终止</option>
										<!-- <option value="9">归档</option> -->
									</s:elseif>
									<s:elseif test='strProjectStatus == "5"'>
										<option value="">请选择</option>
										<option value="1">在审</option>
										<option value="2">补交资料</option>
										<option value="3">初稿已出</option>
										<option value="4">审定单已出</option>
										<option value="5" selected="selected">出报告</option>
										<option value="6">快递</option>
										<option value="7">完成</option>
										<option value="8">终止</option>
										<!-- <option value="9">归档</option> -->
									</s:elseif>
									<s:elseif test='strProjectStatus == "6"'>
										<option value="">请选择</option>
										<option value="1">在审</option>
										<option value="2">补交资料</option>
										<option value="3">初稿已出</option>
										<option value="4">审定单已出</option>
										<option value="5">出报告</option>
										<option value="6" selected="selected">快递</option>
										<option value="7">完成</option>
										<option value="8">终止</option>
										<!-- <option value="9">归档</option> -->
									</s:elseif>
									<s:elseif test='strProjectStatus == "7"'>
										<option value="">请选择</option>
										<option value="1">在审</option>
										<option value="2">补交资料</option>
										<option value="3">初稿已出</option>
										<option value="4">审定单已出</option>
										<option value="5">出报告</option>
										<option value="6">快递</option>
										<option value="7" selected="selected">完成</option>
										<option value="8">终止</option>
										<!-- <option value="9">归档</option> -->
									</s:elseif>
									<s:elseif test='strProjectStatus == "8"'>
										<option value="">请选择</option>
										<option value="1">在审</option>
										<option value="2">补交资料</option>
										<option value="3">初稿已出</option>
										<option value="4">审定单已出</option>
										<option value="5">出报告</option>
										<option value="6">快递</option>
										<option value="7">完成</option>
										<option value="8" selected="selected">终止</option>
										<!-- <option value="9">归档</option> -->
									</s:elseif>
									<!-- <s:elseif test='strProjectStatus == "9"'>
										<option value="">请选择</option>
										<option value="1">在审</option>
										<option value="2">补交资料</option>
										<option value="3">初稿已出</option>
										<option value="4">审定单已出</option>
										<option value="5">出报告</option>
										<option value="6">快递</option>
										<option value="7">完成</option>
										<option value="8">终止</option>
										<option value="9" selected="selected">归档</option>
									</s:elseif> -->
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="1">在审</option>
										<option value="2">补交资料</option>
										<option value="3">初稿已出</option>
										<option value="4">审定单已出</option>
										<option value="5">出报告</option>
										<option value="6">快递</option>
										<option value="7">完成</option>
										<option value="8">终止</option>
										<!-- <option value="9">归档</option> -->
									</s:else>
								</select>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">担当者</label>
							<div class="col-lg-9">
								<select name="strProjectManager" id="strProjectManager" class="form-control">
									<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
										<option value="<s:property value="LOGIN_NAME"/>" <s:if test="%{strProjectManager == LOGIN_NAME}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
									</s:iterator>
								</select>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">合同号</label>
							<div class="col-lg-9">
								<select id="strPreReport" name="strPreReport" class="form-control" onchange="selectPreReport();">
									<option value="">请选择</option>
									<s:iterator id="auditCompList" value="auditCompList" status="st">
										<option value="<s:property value="AUDIT_COMP_NO"/>" <s:if test="%{strPreReport == AUDIT_COMP_NO}">selected</s:if>><s:property value="AUDIT_COMP_NO"/></option>
									</s:iterator>
								</select>
							</div>
						</div>
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-1 form-label">文号</label>
							<div class="col-lg-5">
								<s:if test='strPreReport == ""'>
									<input type="text" name="strReportLow" id="strReportLow" disabled="disabled" maxlength="10" value="" class="form-control"/>
								</s:if>
								<s:else>
									<input type="text" name="strReportLow" id="strReportLow" maxlength="10" value="<s:property value="strReportLow"/>" class="form-control"/>
								</s:else>
							</div>
							<label for="" class="col-lg-1 form-label to">---</label>
							<div class="col-lg-5">
								<s:if test='strPreReport == ""'>
									<input type="text" name="strReportHigh" id="strReportHigh" disabled="disabled" maxlength="8" value="" class="form-control"/>
								</s:if>
								<s:else>
									<input type="text" name="strReportHigh" id="strReportHigh" maxlength="8" value="<s:property value="strReportHigh"/>" class="form-control"/>
								</s:else>
							</div>
						</div>
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-3 form-label">审价状态</label>
							<div class="col-lg-9 account">
								<s:if test='%{strAuditStatus.substring(0, 1) == "2"}'>
									<input name="auditStatus" type="checkbox" checked="checked"/>
									<label class="form-label" for="">未到账</label>　
								</s:if>
								<s:else>
									<input name="auditStatus" type="checkbox"/>
									<label class="form-label" for="">未到账</label>　
								</s:else>
								<s:if test='%{strAuditStatus.substring(1, 2) == "3"}'>
									<input name="auditStatus" type="checkbox" checked="checked"/>
									<label class="form-label" for="">已到账</label>
								</s:if>
								<s:else>
									<input name="auditStatus" type="checkbox"/>
									<label class="form-label" for="">已到账</label>
								</s:else>
							</div>
						</div>
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-2 form-label">到账日期</label>
							<div class="col-lg-4">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="valueDateLow" value="<s:property value="strValueDateLow"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label to">---</label>
							<div class="col-lg-4">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="valueDateHigh" value="<s:property value="strValueDateHigh"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-3 form-label">资料到达日期</label>
							<div class="col-lg-4">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="docArrDateLow" value="<s:property value="strDocArrDateLow"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label to">---</label>
							<div class="col-lg-4">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="docArrDateHigh" value="<s:property value="strDocArrDateHigh"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-5 form-group">
							<label for="" class="col-lg-3 form-label">委托公司名称</label>
							<div class="col-lg-7">
								<s:textfield name="strAgentName" id="strAgentName" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-2">
								<button class="btn btn-success" onclick="queryAgentCommon();">选择</button>
							</div>
						</div>
						<div class="col-lg-5 form-group">
							<label for="" class="col-lg-3 form-label">承揽公司名称</label>
						 	<div class="col-lg-7">
						 		<s:textfield name="strContractName" id="strContractName" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-2">
								<button class="btn btn-success" onclick="queryContractCommon();">选择</button>
							</div>
						</div>
						<div class="col-lg-2 form-group">
							<button class="btn btn-success form-control" onclick="queryList();">检索</button>
						</div>
					</div>
					<div class="btns">
						<ul>
							<li><a href="#" onclick="add();"><i class="fa fa-plus" aria-hidden="true"></i>新增</a></li>
							<li><a href="#" onclick="upd();"><i class="fa fa-pencil" aria-hidden="true"></i>修改</a></li>
							<li><a href="#" onclick="del();"><i class="fa fa-trash" aria-hidden="true"></i>删除</a></li>
						</ul>
					</div>
					<table class="table table-bordered">
						<tr>
							<th></th>
							<th>文号</th>
							<th>担当者</th>
							<th>资料到达日期</th>
							<th>项目进度</th>
							<th>归档</th>
							<th>送审金额</th>
							<th>审定金额</th>
							<th>审定单发出日期</th>
							<th>审定单回复日期</th>
							<th>报告日期</th>
							<th>委托公司</th>
							<th>承包公司</th>
							<th>审价费</th>
							<th>开票日期</th>
							<th>发票号</th>
							<th>到帐日期</th>
						</tr>
						<s:iterator id="listAudit" value="listAudit" status="st1">
							<tr>
								<td><input name="radioKey" type="radio" value="<s:property value="AUDIT_NO"/>"/></td>
								<td><s:property value="REPORT_NO"/></td>
								<td align=middle ><s:property value="PROJECT_MANAGER"/></td>
								<td align=middle ><s:date name="DOC_ARR_DATE" format="yyyy/MM/dd" /></td>
								<td align=middle >
									<s:if test='PROJECT_STATUS == "1"'>
										在审
									</s:if>
									<s:elseif test='PROJECT_STATUS == "2"'>
										补交资料
									</s:elseif>
									<s:elseif test='PROJECT_STATUS == "3"'>
										初稿已出
									</s:elseif>
									<s:elseif test='PROJECT_STATUS == "4"'>
										审定单已出
									</s:elseif>
									<s:elseif test='PROJECT_STATUS == "5"'>
										出报告
									</s:elseif>
									<s:elseif test='PROJECT_STATUS == "6"'>
										快递
									</s:elseif>
									<s:elseif test='PROJECT_STATUS == "7"'>
										完成
									</s:elseif>
									<s:elseif test='PROJECT_STATUS == "8"'>
										终止
									</s:elseif>
									<s:elseif test='PROJECT_STATUS == "9"'>
										归档
									</s:elseif>
									<s:else>
										<s:property value="PROJECT_STATUS"/>
									</s:else>
								</td>
								<td align=middle >
									<s:if test='RESERVE4 == "1"'>
										归档
									</s:if>
									<s:else>
										<s:property value=""/>
									</s:else>
								</td>
								<td align=right><s:property value="VERIFY_PER_AMOUNT"/></td>
								<td align=right><s:property value="VERIFY_AMOUNT"/></td>
								<td align=middle ><s:date name="VERIFY_DOC_SEND_DATE" format="yyyy/MM/dd" /></td>
								<td align=middle ><s:date name="VERIFY_DOC_REPLY_DATE" format="yyyy/MM/dd" /></td>
								<td align=middle ><s:date name="LAST_REPORT_DATE" format="yyyy/MM/dd" /></td>
								<td><s:property value="AGENT_CO_NAME"/></td>
								<td><s:property value="CONTRACT_CO_NAME"/></td>
								<td align=right><s:property value="RECEIPT1_AMOUNT"/></td>
								<td align=middle ><s:date name="RECEIPT1_DATE" format="yyyy/MM/dd" /></td>
								<td><s:property value="RECEIPT1_NO"/></td>
								<td align=middle ><s:date name="VALUE_DATE" format="yyyy/MM/dd" /></td>
							</tr>
						</s:iterator>
					</table>
					<div class="pages">
						<ul>
							<li>第<strong>${page.startIndex + 1}</strong>页/共<strong>${page.totalPage==0?1:page.totalPage}</strong>页/共<strong>${page.totalCount}</strong>条记录</li>
							<li class="mgl15">跳转到
								<input type="text" id="pagenum" class="text" maxlength="4" size="4"/>
								<input type="button" value="GO" onclick="javascript:turnPage();"/>
							</li>
							<li class="mgl15">
								<a class="first" href="#" onclick="changePage(0);">首页</a>
							</li>
							<li>
								<s:if test="%{page.startIndex <= 0}">
									<a class="last" href="#">上一页</a>
								</s:if>
								<s:else>
									<a class="next" href="#" onclick="changePage('${page.previousIndex}');">上一页</a>
								</s:else>
							</li>
							<li>
								<s:if test="%{page.nextIndex > page.totalPage - 1}">
									<a class="last" href="#">下一页</a>
								</s:if>
								<s:else>
									<a class="next" href="#" onclick="changePage('${page.nextIndex}');">下一页</a>
								</s:else>
							</li>
							<li>
								<a class="next" href="#" onclick="changePage('${page.totalPage - 1}');">末页</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="operationBtns addBtns mgt15 btn3" style="width: 300px;">
				<button class="btn btn-success" onclick="showAuditDetail();">详细</button>
				<button class="btn btn-success" onclick="showHis();">履历</button>
				<button class="btn btn-success" onclick="exportAudit();">下载</button>
				<button class="btn btn-success" onclick="exportAuditReceipt();">下载(发票)</button>
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
