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
		var strPreReport = $("#strPreReport").val();
		if(strPreReport == "") {
			$("#strReportLow").attr("value", "");
			$("#strReportHigh").attr("value", "");
		}
		//setAuditStatus();
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
		<div class="row">
			<jsp:include page="../auditmenu.jsp" flush="true" />
			<div class="col-lg-10 right">
				<a class="toggle" href="javascript:;"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
				<s:form id="mainform" name="mainform" method="POST">
					<s:hidden name="startIndex" id="startIndex"/>
					<h3 class="title">审价项目一览<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
					<div class="row">
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-1 form-label">工程师</label>
							<div class="col-lg-2">
								<select name="strProjectManager" id="strProjectManager" class="form-control">
									<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
										<option value="<s:property value="LOGIN_NAME"/>" <s:if test="%{strProjectManager == LOGIN_NAME}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
									</s:iterator>
								</select>
							</div>
							<label for="" class="col-lg-1 form-label">项目名称</label>
							<div class="col-lg-4">
								<s:textfield name="strProjectName" id="strProjectName" cssClass="form-control" maxlength="80" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-12 form-group">
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
						</div>
						<div class="col-lg-8">
						</div>
						<div class="col-lg-1 form-group">
							<button class="btn btn-success form-control" type="button" onclick="del();">删除</button>
						</div>
						<div class="col-lg-1">
						</div>
						<div class="col-lg-1 form-group">
							<button class="btn btn-success form-control" type="button" onclick="add();">增加</button>
						</div>
						<div class="col-lg-1 form-group">
							<button class="btn btn-success form-control" type="button" onclick="upd();">编辑</button>
						</div>
					</div>
					<table class="table table-bordered">
						<tr>
							<th></th>
							<th>项目文号</th>
							<th>项目名称</th>
							<th>合同编号</th>
							<th>工程师</th>
							<th>资料收到日期</th>
							<th>实施情况</th>
							<th>预/结算</th>
							<th>预算金额</th>
							<th>委托方专业联系人及联系方式</th>
							<th>承揽单位</th>
							<th>承揽单位联系人及联系方式</th>
							<th>送审价</th>
							<th>审核价</th>
							<th>核增额</th>
							<th>核减额</th>
							<th>净核减额</th>
							<th>净核减率</th>
							<th>控制价金额</th>
							<th>立项金额</th>
							<th>限价金额</th>
							<th>合同金额</th>
						</tr>
						<s:iterator id="listAudit" value="listAudit" status="st1">
							<tr>
								<td><input name="radioKey" type="radio" value="<s:property value="AUDIT_NO"/>"/></td>
								<td><s:property value="REPORT_NO"/></td>
								<td><s:property value="PROJECT_NAME"/></td>
								<td><s:property value="CNTRCT_NO"/></td>
								<td><s:property value="PROJECT_MANAGER"/></td>
								<td align="center"><s:date name="DOC_REC_DATE" format="yyyy/MM/dd" /></td>
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
								<td><s:property value="PRE_SET"/></td>
								<td><s:property value="PRE_PRICE"/></td>
								<td><s:property value="AGENT_CO_MANAGER"/></td>
								<td><s:property value="CONTRACT_CO_NAME"/></td>
								<td><s:property value="CONTRACT_CO_MANAGER"/></td>
								<td><s:property value="VERIFY_PER_AMOUNT"/></td>
								<td><s:property value="VERIFY_AMOUNT"/></td>
								<td><s:property value="VERIFY_INCREASE"/></td>
								<td><s:property value="VERIFY_DECREASE"/></td>
								<td><s:property value="VERIFY_DIFF"/></td>
								<td><s:property value="VERIFY_DIFF_RATE"/></td>
								<td><s:property value="CNT_PRICE"/></td>
								<td><s:property value="PROJ_PRICE"/></td>
								<td><s:property value="LIMIT_PRICE"/></td>
								<td><s:property value="CNTRCT_PRICE"/></td>
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
				</s:form>
			</div>
		</div>
		<div class="operationBtns addBtns mgt15 btn3" style="width: 300px;">
			<button class="btn btn-success" onclick="showAuditDetail();">详细</button>
			<button class="btn btn-success" onclick="showHis();">履历</button>
			<button class="btn btn-success" onclick="exportAudit();">下载</button>
			<button class="btn btn-success" onclick="exportAuditReceipt();">下载(发票)</button>
		</div>
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
	
	$('.toggle i').click(function(){
		$('.left').toggle();
		$(this).toggleClass('fa-angle-double-left');
		$(this).toggleClass('fa-angle-double-right');
		$(this).parent().parent('.right').toggleClass('w100');
	});
</script>
</body>
</html>
