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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/local.css" />
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
		var strPreReport = $("#strPreReport").val();
		if(strPreReport == "") {
			$("#strReportLow").attr("value", "");
			$("#strReportHigh").attr("value", "");
		}
		//setAuditStatus();
		var setFlag = document.getElementById("setFlag");
		var strSetFlag = "0";
		if(setFlag.checked) {
			strSetFlag = "1";
		}
		$("#strSetFlag").attr("value", strSetFlag);
	}

	function queryList() {
		setQueryDate();
		document.mainform.action = '<c:url value="/audit/queryAuditList.action"></c:url>';
		document.mainform.submit();
	}

	function queryListDisp() {
		setQueryDate();
		document.mainform.action = '<c:url value="/audit/showAuditListDisp.action"></c:url>';
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
		<div class="row">
			<jsp:include page="../menu.jsp" flush="true" />
			<s:if test='#session.toggle_menu_flag == "1"'>
				<div class="col-lg-10 right w100">
				<a class="toggle" href="javascript:;"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
			</s:if>
			<s:else>
				<div class="col-lg-10 right">
				<a class="toggle" href="javascript:;"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
			</s:else>
				<s:form id="mainform" name="mainform" method="POST">
					<s:hidden name="startIndex" id="startIndex"/>
					<s:hidden name="strSetFlag" id="strSetFlag"/>
					<h3 class="title">审价项目一览<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
					<div class="row">
						<s:if test="hasActionMessages()">
							<div class="row">
								<span style="color:red; text-align:center;"><s:actionmessage /></span>
							</div>
						</s:if>
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-1 form-label">工程师</label>
							<div class="col-lg-2">
								<select name="strProjectManager" id="strProjectManager" class="form-control">
									<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
										<option value="<s:property value="LOGIN_NAME"/>" <s:if test="%{strProjectManager == LOGIN_NAME}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
									</s:iterator>
								</select>
							</div>
							<label for="" class="col-lg-1 form-label">项目文号</label>
							<div class="col-lg-2">
								<s:textfield name="strReportNo" id="strReportNo" cssClass="form-control" maxlength="80" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-1 form-label">项目名称</label>
							<div class="col-lg-2">
								<s:textfield name="strProjectName" id="strProjectName" cssClass="form-control" maxlength="80" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label">委托内容</label>
							<div class="col-lg-2">
								<select id="strCntrctInfo" name="strCntrctInfo" class="form-control">
									<s:if test='strCntrctInfo == "1"'>
										<option value="1" selected="selected">审价</option>
										<option value="2">咨询</option>
										<option value="3">清单编制</option>
										<option value="4">控制价编制</option>
										<option value="5">全过程投资监理</option>
										<option value="">全类别</option>
									</s:if>
									<s:elseif test='strCntrctInfo == "2"'>
										<option value="1">审价</option>
										<option value="2" selected="selected">咨询</option>
										<option value="3">清单编制</option>
										<option value="4">控制价编制</option>
										<option value="5">全过程投资监理</option>
										<option value="">全类别</option>
									</s:elseif>
									<s:elseif test='strCntrctInfo == "3"'>
										<option value="1">审价</option>
										<option value="2">咨询</option>
										<option value="3" selected="selected">清单编制</option>
										<option value="4">控制价编制</option>
										<option value="5">全过程投资监理</option>
										<option value="">全类别</option>
									</s:elseif>
									<s:elseif test='strCntrctInfo == "4"'>
										<option value="1">审价</option>
										<option value="2">咨询</option>
										<option value="3">清单编制</option>
										<option value="4" selected="selected">控制价编制</option>
										<option value="5">全过程投资监理</option>
										<option value="">全类别</option>
									</s:elseif>
									<s:elseif test='strCntrctInfo == "5"'>
										<option value="1">审价</option>
										<option value="2">咨询</option>
										<option value="3">清单编制</option>
										<option value="4">控制价编制</option>
										<option value="5" selected="selected">全过程投资监理</option>
										<option value="">全类别</option>
									</s:elseif>
									<s:else>
										<option value="1" selected="selected">审价</option>
										<option value="2">咨询</option>
										<option value="3">清单编制</option>
										<option value="4">控制价编制</option>
										<option value="5">全过程投资监理</option>
										<option value=""  selected="selected">全类别</option>
									</s:else>
								</select>
							</div>
							<div class="col-lg-1 form-group">
							</div>
							<div class="col-lg-1 form-group">
								<button class="btn btn-success form-control" type="button" onclick="queryList();">检索</button>
							</div>
							<div class="col-lg-1 form-group">
								<button class="btn btn-success form-control" type="button" onclick="queryListDisp();">设定</button>
							</div>
							<div class="col-lg-2 form-group">
								<s:if test='%{strSetFlag == "1"}'>
									<input id="setFlag" type="checkbox" checked="checked"/>
									<label class="form-label" for="">使用设定值</label>　
								</s:if>
								<s:else>
									<input id="setFlag" type="checkbox"/>
									<label class="form-label" for="">使用设定值</label>　
								</s:else>
							</div>
						</div>
						<%-- <div class="col-lg-12 form-group">
							<label for="" class="col-lg-1 form-label">项目文号</label>
							<div class="col-lg-2">
								<select id="strPreReport" name="strPreReport" class="form-control" onchange="selectPreReport();">
									<option value="">请选择</option>
									<s:iterator id="auditCompList" value="auditCompList" status="st">
										<option value="<s:property value="AUDIT_COMP_NO"/>" <s:if test="%{strPreReport == AUDIT_COMP_NO}">selected</s:if>><s:property value="AUDIT_COMP_NO"/></option>
									</s:iterator>
								</select>
							</div>
							<div class="col-lg-2">
								<s:if test='strPreReport == ""'>
									<s:textfield name="strReportLow" id="strReportLow" cssClass="form-control" disabled="disabled" maxlength="16" theme="simple"></s:textfield>
								</s:if>
								<s:else>
									<s:textfield name="strReportLow" id="strReportLow" cssClass="form-control" maxlength="16" theme="simple"></s:textfield>
								</s:else>
							</div>
							<label for="" class="col-lg-1 form-label to">-</label>
							<div class="col-lg-2">
								<s:if test='strPreReport == ""'>
									<s:textfield name="strReportHigh" id="strReportHigh" cssClass="form-control" disabled="disabled" maxlength="16" theme="simple"></s:textfield>
								</s:if>
								<s:else>
									<s:textfield name="strReportHigh" id="strReportHigh" cssClass="form-control" maxlength="16" theme="simple"></s:textfield>
								</s:else>
							</div>
							<div class="col-lg-1">
							</div>
							<div class="col-lg-1 form-group">
								<button class="btn btn-success form-control" type="button" onclick="queryList();">检索</button>
							</div>
						</div> --%>
					</div>
					<div class="btns">
						<ul>
							<li><a href="#" onclick="add();"><i class="fa fa-plus" aria-hidden="true"></i>新增</a></li>
							<li><a href="#" onclick="upd();"><i class="fa fa-pencil" aria-hidden="true"></i>修改</a>
							<li><a href="#" onclick="del();"><i class="fa fa-trash" aria-hidden="true"></i>删除</a></li>
						</ul>
					</div>
					<table class="table table-bordered">
						<tr>
							<th></th>
							<s:iterator id="arrAuditShow" value="arrAuditShow" status="st1">
								<th><s:property value="#arrAuditShow[1]"/></th>
							</s:iterator>
						</tr>
						<s:iterator id="listAudit" value="listAudit" status="st1">
							<tr onclick="checkRadioTr(this, event);">
								<td><input name="radioKey" type="radio" value="<s:property value="AUDIT_NO"/>"/></td>
								<s:iterator id="arrAuditShow" value="arrAuditShow" status="st1">
									<s:if test='#arrAuditShow[0] == "REPORT_NO"'>
										<td><s:property value="REPORT_NO"/></td>
									</s:if> 
									<s:elseif test='#arrAuditShow[0] == "PROJECT_NAME"'>
										<td><s:property value="PROJECT_NAME"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "CNTRCT_NO"'>
										<td><s:property value="CNTRCT_NO"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "PROJECT_MANAGER"'>
										<td><s:property value="PROJECT_MANAGER"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "DOC_REC_DATE"'>
										<td align="center"><s:date name="DOC_REC_DATE" format="yyyy/MM/dd" /></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "APPROVAL_SND_DATE"'>
										<td align="center"><s:date name="APPROVAL_SND_DATE" format="yyyy/MM/dd" /></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "REPORT_RAISE_DATE"'>
										<td align="center"><s:date name="REPORT_RAISE_DATE" format="yyyy/MM/dd" /></td>
									</s:elseif>
									<s:elseif test='#arrAuditShow[0] == "REPORT_SEAL_DATE"'>
										<td align="center"><s:date name="REPORT_SEAL_DATE" format="yyyy/MM/dd" /></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "PROGRESS_STATUS"'>
									<td align="center">
									        <s:if test='PROGRESS_STATUS == "1"'>
									                实施
									        </s:if>
									        <s:elseif test='PROGRESS_STATUS == "2"'>
									                中止
									        </s:elseif>
									        <s:else>
									                <s:property value="PROGRESS_STATUS"/>
									        </s:else>
									</td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "PRE_SET"'>
									<td align="center">
									        <s:if test='PRE_SET == "1"'>
									                预算
									        </s:if>
									        <s:elseif test='PRE_SET == "2"'>
									                结算
									        </s:elseif>
									        <s:else>
									                <s:property value="PRE_SET"/>
									        </s:else>
									</td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "PRE_PRICE"'>
										<td><s:property value="PRE_PRICE"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "AGENT_CO_MANAGER"'>
										<td><s:property value="AGENT_CO_MANAGER"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "CONTRACT_CO_NAME"'>
										<td><s:property value="CONTRACT_CO_NAME"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "CONTRACT_CO_MANAGER"'>
										<td><s:property value="CONTRACT_CO_MANAGER"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "VERIFY_PER_AMOUNT"'>
										<td><s:property value="VERIFY_PER_AMOUNT"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "VERIFY_AMOUNT"'>
										<td><s:property value="VERIFY_AMOUNT"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "VERIFY_INCREASE"'>
										<td><s:property value="VERIFY_INCREASE"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "VERIFY_DECREASE"'>
										<td><s:property value="VERIFY_DECREASE"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "VERIFY_DIFF"'>
										<td><s:property value="VERIFY_DIFF"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "VERIFY_DIFF_RATE"'>
										<td><s:property value="VERIFY_DIFF_RATE"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "CNT_PRICE"'>
										<td><s:property value="CNT_PRICE"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "PROJ_PRICE"'>
										<td><s:property value="PROJ_PRICE"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "LIMIT_PRICE"'>
										<td><s:property value="LIMIT_PRICE"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "CNTRCT_PRICE"'>
										<td><s:property value="CNTRCT_PRICE"/></td>
									</s:elseif> 
									<s:elseif test='#arrAuditShow[0] == "PROGRESS_STATUS_MEMO"'>
										<td><s:property value="PROGRESS_STATUS_MEMO"/></td>
									</s:elseif>
									<s:elseif test='#arrAuditShow[0] == "AGENT_INFO"'>
										<td><s:property value="AGENT_INFO"/></td>
									</s:elseif>
									<s:elseif test='#arrAuditShow[0] == "PROF_INFO"'>
										<td><s:property value="PROF_INFO"/></td>
									</s:elseif>
									<s:elseif test='#arrAuditShow[0] == "CONTRACT_CO_NAME"'>
										<td><s:property value="CONTRACT_CO_NAME"/></td>
									</s:elseif>
									<s:elseif test='#arrAuditShow[0] == "CONTRACT_CO_INFO"'>
										<td><s:property value="CONTRACT_CO_INFO"/></td>
									</s:elseif>
									<s:elseif test='#arrAuditShow[0] == "PROJECT_NAME_PASS"'>
										<td><s:property value="PROJECT_NAME_PASS"/></td>
									</s:elseif>
									<s:else>
										<td></td>
									</s:else> 
								</s:iterator>
							</tr>
						</s:iterator>
					</table>
					<jsp:include page="../turning.jsp" flush="true" />
					<div class="operationBtns">
						<button class="btn btn-success" type="button" onclick="exportAudit();">导出</button>
					</div>
				</s:form>
			</div>
		</div>
	</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath()%>/node_modules/jquery/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath()%>/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.zh-CN.min.js"></script>
<script>
	$(function () { $('#collapseOne').collapse('toggle')});
	
	$('.datepicker').parent().datepicker({
		"autoclose":true,"format":"yyyy-mm-dd","daysOfWeekHighlighted":"[0,6]","language":"zh-CN",clearBtn: true
	});
	
	$('.toggle i').click(function(){
		var param = new Object();
		if($(this).hasClass('fa-angle-double-left')) {
			param.toggleMenuFlag = "1";
			$('.left').hide();
			$(this).removeClass('fa-angle-double-left');
			$(this).addClass('fa-angle-double-right');
			$(this).parent().parent('.right').addClass('w100');
		} else {
			param.toggleMenuFlag = "0";
			$('.left').show();
			$(this).addClass('fa-angle-double-left');
			$(this).removeClass('fa-angle-double-right');
			$(this).parent().parent('.right').removeClass('w100');
		}
		$.getJSON('<%=request.getContextPath()%>/home/toggleMenuAction.action', param, function(data) {
		});
	});
</script>
</body>
</html>
