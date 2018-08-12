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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Calendar3.js"></script>
<title>审价信息一览</title>
<script type="text/javascript">
	$(document).ready(function(){
		var h = screen.availHeight; 
		$("#container").height(h + 45);
	});
	
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
	<div id="container">
		<div id="top">
			<div class="logobox">
				<div class="logo_tittle"></div>
				<div class="logo"></div>
			</div>
		</div>
		<div class="content">
			<jsp:include page="../info.jsp" flush="true" />
			<div class="tittle">
				<div class="icons"><a class="home" href="#" onclick="goHome();">返回首页</a><a class="quit" href="#" onclick="logout();">退出</a></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center">
					审价信息一览
				</div>
				<div class="tittle_right">
				</div>
			</div>
			<s:form id="mainform" name="mainform" method="POST">
				<s:hidden name="startIndex" id="startIndex"/>
				<s:hidden name="strValueDateLow" id="strValueDateLow"/>
				<s:hidden name="strValueDateHigh" id="strValueDateHigh"/>
				<s:hidden name="strDocArrDateLow" id="strDocArrDateLow"/>
				<s:hidden name="strDocArrDateHigh" id="strDocArrDateHigh"/>
				<s:hidden name="strAuditStatus" id="strAuditStatus"/>
				<div class="searchbox">
					<!-- 
					<div class="box1">
						<label class="pdf10">审价编号</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strAuditNoLow" id="strAuditNoLow" cssStyle="width: 100px;" maxlength="8" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
						<label>-</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strAuditNoHigh" id="strAuditNoHigh" cssStyle="width: 100px;" maxlength="8" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</div>
					 -->
					<div class="box1">
						<label class="pdf10">项目分类</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="strProjectClass" name="strProjectClass" style="width: 150px;">
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
						<div class="box1_right"></div>
					</div>
					<div class="box1">
						<label class="pdf10">项目进度</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="strProjectStatus" name="strProjectStatus" style="width: 100px;">
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
						<div class="box1_right"></div>
					</div>
					<div class="box1">
						<label class="pdf10">担当者</label>
<!-- 						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strProjectManager" id="strProjectManager" cssClass="input80" cssStyle="width: 120px;" maxlength="24" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
 -->
						<div class="box1_left"></div>
						<div class="box1_center">
							<select name="strProjectManager" id="strProjectManager" style="width:135px;">
								<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
									<option value="<s:property value="LOGIN_NAME"/>" <s:if test="%{strProjectManager == LOGIN_NAME}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
								</s:iterator>
							</select>
						</div>
						<div class="box1_right"></div>
					</div>
				</div>
				<div class="searchbox">
					<div class="box1">
						<label class="pdf10">合同号</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="strPreReport" name="strPreReport" style="width: 200px;" onchange="selectPreReport();">
								<option value="">请选择</option>
								<s:iterator id="auditCompList" value="auditCompList" status="st">
									<option value="<s:property value="AUDIT_COMP_NO"/>" <s:if test="%{strPreReport == AUDIT_COMP_NO}">selected</s:if>><s:property value="AUDIT_COMP_NO"/></option>
								</s:iterator>
							</select>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="box1">
						<label class="pdf10">文号</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:if test='strPreReport == ""'>
								<input type="text" name="strReportLow" id="strReportLow" disabled="disabled" maxlength="10" value="" style="width: 100px;"/>
							</s:if>
							<s:else>
								<input type="text" name="strReportLow" id="strReportLow" maxlength="10" value="<s:property value="strReportLow"/>" style="width: 100px;"/>
							</s:else>
						</div>
						<div class="box1_right"></div>
						<label>-</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:if test='strPreReport == ""'>
								<input type="text" name="strReportHigh" id="strReportHigh" disabled="disabled" maxlength="8" value="" style="width: 100px;"/>
							</s:if>
							<s:else>
								<input type="text" name="strReportHigh" id="strReportHigh" maxlength="8" value="<s:property value="strReportHigh"/>" style="width: 100px;"/>
							</s:else>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="box1" style="margin-left: 5px;">
						<label class="pdf10">审价状态</label>
						<div style="width: 300px; margin-top: 5px;">
							<s:if test='%{strAuditStatus.substring(0, 1) == "2"}'>
								<input name="auditStatus" type="checkbox" checked="checked"/>未到帐　
							</s:if>
							<s:else>
								<input name="auditStatus" type="checkbox"/>未到帐　
							</s:else>
							<s:if test='%{strAuditStatus.substring(1, 2) == "3"}'>
								<input name="auditStatus" type="checkbox" checked="checked"/>已到帐　
							</s:if>
							<s:else>
								<input name="auditStatus" type="checkbox"/>已到帐　
							</s:else>
						</div>
					</div>
				</div>
				<div class="searchbox">
					<div class="box1">
						<label class="pdf10">到账日期</label>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 105px;" id="valueDateLow" value="<s:property value="strValueDateLow"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('valueDateLow'));"></a>
						</div>
						<div class="box1_right"></div>
						<label>-</label>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 105px;" id="valueDateHigh" value="<s:property value="strValueDateHigh"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('valueDateHigh'));"></a>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="box1">
						<label class="pdf10">资料到达日期</label>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 105px;" id="docArrDateLow" value="<s:property value="strDocArrDateLow"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('docArrDateLow'));"></a>
						</div>
						<div class="box1_right"></div>
						<label>-</label>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 105px;" id="docArrDateHigh" value="<s:property value="strDocArrDateHigh"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('docArrDateHigh'));"></a>
						</div>
						<div class="box1_right"></div>
					</div>
				</div>
				<div class="searchbox">
					<div class="box1">
						<!-- <label class="pdf10">委托公司代码</label> -->
						<label class="pdf10">委托公司名称</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<!-- 
							<s:textfield name="strAgentNo" id="strAgentNo" cssClass="input80" cssStyle="width: 120px;" maxlength="4" theme="simple"></s:textfield>
							 -->
							<s:textfield name="strAgentName" id="strAgentName" cssClass="input180" cssStyle="width: 180px;" maxlength="40" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</div>
					
					<div class="btn" style="margin-left: 5px;">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="button" class="input40" value="选择" onclick="queryAgentCommon();"/>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="box1" style="margin-left: 15px;">
						<label class="pdf10">承揽公司名称</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strContractName" id="strContractName" cssClass="input180" cssStyle="width: 180px;" maxlength="40" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</div>
					
					<div class="btn" style="margin-left: 5px;">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="button" class="input40" value="选择" onclick="queryContractCommon();"/>
						</div>
						<div class="box1_right"></div>
					</div>
					
					<div class="btn" style="margin-left: 200px;">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="button" class="input40" value="检索" onclick="queryList();"/>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="box1" style="margin-top:0px; margin-left: -270px; color: red;">
						<s:actionmessage />
					</div>
					<div class="icons thums">
						<a class="add" onclick="add();">增加</a>
						<a class="edit" onclick="upd();">修改</a>
						<a class="delete" onclick="del();">删除</a>
					</div>
				</div>
				<div class="data_table" style="padding:0px;">
					<div class="tab_tittle">
						<table width="100%" border="1" cellpadding="5" cellspacing="0">
						</table>
					</div>
					<div class="tab_content">
						<table class="info_tab" width="120%" border="1" cellpadding="5" cellspacing="0">
							<tr class="tittle">
								<td width="20"  align=middle ></td>
								<td width="60" align=middle >文号</td>
								<td width="40" align=middle >担当者</td>
								<td width="40" align=middle >资料到达日期</td>
								<td width="60" align=middle >项目进度</td>
								<td width="20" align=middle >归档</td>
								<td width="40" align=middle >送审金额</td>
								<td width="40" align=middle >审定金额</td>
								<td width="40" align=middle >审定单发出日期</td>
								<td width="40" align=middle >审定单回复日期</td>
								<td width="40" align=middle >报告日期</td>
								<td width="100" align=middle >委托公司</td>
								<td width="100" align=middle >承包公司</td>
								<td width="40" align=middle >审价费</td>
								<td width="40" align=middle >开票日期</td>
								<td width="40" align=middle >发票号</td>
								<td width="40" align=middle >到帐日期</td>
							</tr>
							<s:iterator id="listAudit" value="listAudit" status="st1">
								<s:if test="#st1.odd==true">
									<tr class="tr_bg">
								</s:if>
								<s:else>
									<tr>
								</s:else>
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
					</div>
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
				<div class="btns" style="margin-top:-100px;">
					<table border="0" style="margin:0 auto;">
						<tr>
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" type="button" value="详细" onclick="showAuditDetail();" />
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" type="button" value="履历" onclick="showHis();" />
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" type="button" value="下载" onclick="exportAudit();" />
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" type="button" value="下载(发票)" onclick="exportAuditReceipt();" />
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</s:form>
		</div>
	</div>
</body>
</html>
