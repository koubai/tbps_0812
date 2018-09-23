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
<title>审计一览</title>
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
		document.mainform.action = '<c:url value="/auditcntrct/showAddAuditCntrctAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function upd() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			var url = '<c:url value="/auditcntrct/showUpdAuditCntrctAction.action"></c:url>' + "?updAuditCntrctNo=" + id;
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
				document.mainform.action = '<c:url value="/auditcntrct/delAuditCntrctAction.action"></c:url>' + "?delAuditCntrctNo=" + id;
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
			var url = '<c:url value="/audit/showAllAuditCntrctHisAction.action"></c:url>' + "?strAuditCntrctNoHist=" + id + "&date=" + new Date();
			window.showModalDialog(url, window, "dialogheight:500px;dialogwidth:1000px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
		}
	}
	
	function showAuditCntrctDetail() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			var url = '<c:url value="/audit/showAuditCntrctDetail.action"></c:url>' + "?detailAuditNo=" + id + "&date=" + new Date();
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
	
	function setQueryDate() {
		$("#strCntrctStDate").attr("value", $("#cntrctStDate").val());
		$("#strCntrctEdDate").attr("value", $("#cntrctEdDate").val());
		$('#strCntrctType').removeAttr("disabled");
	}

	function queryList() {
		setQueryDate();
		document.mainform.action = '<c:url value="/auditcntrct/queryAuditCntrctBList.action"></c:url>';
		document.mainform.submit();
	}

	//翻页
	function changePage(pageNum) {
		setQueryDate();
		document.getElementById("startIndex").value = pageNum;
		document.mainform.action = '<c:url value="/auditcntrct/turnAuditCntrctBPage.action"></c:url>';
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
		document.mainform.action = '<c:url value="/auditcntrct/exportAuditCntrctListAction.action"></c:url>';
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
	
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<div class="row">
			<jsp:include page="../menu.jsp" flush="true" />
			<div class="col-lg-10 right">
				<a class="toggle" href="javascript:;"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
				<s:form id="mainform" name="mainform" method="POST">
					<s:hidden name="startIndex" id="startIndex"/>
					<s:hidden name="strCntrctStDate" id="strCntrctStDate"/>
					<s:hidden name="strCntrctEdDate" id="strCntrctEdDate"/>
					<h3 class="title">投资监理B项目一览<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
					<div class="row">
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-1 form-label">合同归属</label>
							<div class="col-lg-2">
								<select id="strCntrctBelong" name="strCntrctBelong" class="form-control">
									<s:if test='strCntrctBelong == "1"'>
										<option value="">请选择</option>
										<option value="1" selected="selected">联合</option>
										<option value="2">XX</option>
									</s:if>
									<s:elseif test='strCntrctBelong == "2"'>
										<option value="">请选择</option>
										<option value="1">联合</option>
										<option value="2" selected="selected">XX</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="1">联合</option>
										<option value="2">XX</option>
									</s:else>
								</select>
							</div>
							<label for="" class="col-lg-1 form-label">合同编号</label>
							<div class="col-lg-2">
								<s:textfield name="strCntrctNO" id="strCntrctNO" cssClass="form-control" maxlength="20" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label">合同性质</label>
							<div class="col-lg-2">
								<select id="strCntrctType" name="strCntrctType" disabled="disabled" class="form-control">
									<option value="">请选择</option>
									<option value="1">地铁</option>
									<option value="B" selected="selected">非地铁</option>
								</select>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-1 form-label">合同名称</label>
							<div class="col-lg-5">
								<s:textfield name="strCntrctName" id="strCntrctName" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-1 form-label">合同开始时间</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="cntrctStDate" value="<s:property value="strCntrctStDate"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label">合同完成时间</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="cntrctEdDate" value="<s:property value="strCntrctEdDate"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						 	<div class="col-lg-2"></div>
							<div class="col-lg-2">
								<button class="btn btn-success" type="button" onclick="queryList();">检索</button>
							</div>
						</div>
					</div>
					<table class="table table-bordered">
						<tr>
							<th></th>
							<th>合同归属</th>
							<th>合同编号</th>
							<th>合同名称</th>
							<th>合同简称</th>
							<th>合同性质</th>
							<th>负责工程师</th>
							<th>委托单位</th>
							<th>联系人及联系方式</th>
							<th>合同开始时间</th>
							<th>合同完成时间</th>
							<th>合同金额</th>
							<th>未收金额</th>
							<th>差旅合计</th>
							<th>总概算</th>
							<th>建安对应预备费</th>
							<th>建安概算（不含物流设备及信息）</th>
							<th>开工时间</th>
							<th>预计完工时间</th>
							<th>超概的风险度</th>
							<th>已完审价</th>
							<th>工程例会</th>
							<th>大致进度及工作计划</th>
						</tr>
						<s:iterator id="listAuditCntrct" value="listAuditCntrct" status="st1">
							<tr>
								<td><input name="radioKey" type="radio" value="<s:property value="CNTRCT_NO"/>"/></td>
								<td align="center">
									<s:if test='CNTRCT_BELONG == "1"'>
										联合
									</s:if>
									<s:elseif test='CNTRCT_BELONG == "2"'>
										XX
									</s:elseif>
									<s:else>
										<s:property value="CNTRCT_BELONG"/>
									</s:else>
								</td>
								<td><s:property value="CNTRCT_NO"/></td>
								<td align="center"><s:property value="CNTRCT_NAME"/></td>
								<td align="center"><s:property value="CNTRCT_NM"/></td>
								<td align="center">
									<s:if test='CNTRCT_TYPE == "1"'>
										地铁
									</s:if>
									<s:elseif test='CNTRCT_TYPE == "2"'>
										非地铁
									</s:elseif>
									<s:else>
										<s:property value="CNTRCT_TYPE"/>
									</s:else>
								</td>
								<td align="center"><s:property value="PROJECT_SENIOR_MANAGER"/></td>
								<td align="center"><s:property value="AUDIT_COMP_NAME"/></td>
								<td align="center"><s:property value="CO_MANAGER_ADDRESS1"/></td>
								<td align="center"><s:date name="CNTRCT_ST_DATE" format="yyyy/MM/dd" /></td>
								<td align="center"><s:date name="CNTRCT_ED_DATE" format="yyyy/MM/dd" /></td>
								<td align="center"><s:property value="CNTRCT_ALL_AMOUNT"/></td>
								<td align="center"><s:property value="CNTRCT_UNPAY_AMOUNT"/></td>
								<td align="center"><s:property value="TRIP_TOTAL_AMOUNT"/></td>
								<td align="center"><s:property value="ESTIMATE_COST"/></td>
								<td align="center"><s:property value="PRE_CONSTRUCT_SAFE_COST"/></td>
								<td align="center"><s:property value="ESTIMATE_CONSTRUCT_SAFE_COST"/></td>
								<td align="center"><s:date name="CONSTRUCT_ST_DATE" format="yyyy/MM/dd" /></td>
								<td align="center"><s:date name="PLAN_CONSTRUCT_ED_DATE" format="yyyy/MM/dd" /></td>
								<td align="center"><s:property value="BUDGETARY_OVERRUN_RISK"/></td>
								<td align="center"><s:property value="FINISH_AUDIT_CNT"/></td>
								<td align="center"><s:property value="PROJ_PROGRESS_MEET_CNT"/></td>
								<td align="center"><s:property value="PROGRESS_STATUS"/></td>
							</tr>
						</s:iterator>
					</table>
					<jsp:include page="../turning.jsp" flush="true" />
				</s:form>
			</div>
		</div>
		<!-- <div class="operationBtns addBtns mgt15 btn3" style="width: 300px;">
			<button class="btn btn-success" onclick="showAuditDetail();">详细</button>
			<button class="btn btn-success" onclick="showHis();">履历</button>
			<button class="btn btn-success" onclick="exportAudit();">下载</button>
			<button class="btn btn-success" onclick="exportAuditReceipt();">下载(发票)</button>
		</div> -->
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
