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
<title>审价一览</title>
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
	}

	function queryList() {
		setQueryDate();
		document.mainform.action = '<c:url value="/auditcntrct/queryAuditCntrctList.action"></c:url>';
		document.mainform.submit();
	}

	//翻页
	function changePage(pageNum) {
		setQueryDate();
		document.getElementById("startIndex").value = pageNum;
		document.mainform.action = '<c:url value="/auditcntrct/turnAuditCntrctPage.action"></c:url>';
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
		<jsp:include page="../info.jsp" flush="true" />
		<div class="row">
			<div class="collapse navbar-collapse navbar-ex1-collapse">
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
					<s:hidden name="strCntrctStDate" id="strCntrctStDate"/>
					<s:hidden name="strCntrctEdDate" id="strCntrctEdDate"/>
					<h3 class="title">审价一览<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
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
								<select id="strCntrctType" name="strCntrctType" class="form-control">
									<s:if test='strCntrctType == "1"'>
										<option value="">请选择</option>
										<option value="1" selected="selected">地铁</option>
										<option value="2">非地铁</option>
									</s:if>
									<s:elseif test='strCntrctType == "2"'>
										<option value="">请选择</option>
										<option value="1">地铁</option>
										<option value="2" selected="selected">非地铁</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="1">地铁</option>
										<option value="2">非地铁</option>
									</s:else>
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
							<th>委托内容</th>
							<th>委托方收费</th>
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
								<td align="center"><s:property value="CNTRCT_INFO_SHOW"/></td>
								<td align="center"><s:property value="CNTRCT_TOTAL_AMOUNT"/></td>
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
	$(function () { $('#collapseOne').collapse('toggle')});
	
	$('.datepicker').parent().datepicker({
		"autoclose":true,"format":"yyyy-mm-dd","language":"zh-CN"
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
