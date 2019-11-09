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
<title>统计界面</title>
<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/node_modules/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
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
	
	function setQueryDate() {
		$("#strStartDate").attr("value", $("#startDate").val());
		$("#strEndDate").attr("value", $("#endDate").val());
		$("#strProjectManager").attr("value", $("#projectManager").val());
	}

	function queryList() {
		setQueryDate();
		document.mainform.action = '<c:url value="/audit/queryAuditMonthSumList.action"></c:url>';
		document.mainform.submit();
	}
	
	function exportAuditAnnualData() {
		document.mainform.action = '<c:url value="/audit/exportAuditAnnualStatistics.action"></c:url>';
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
					<s:hidden name="strStartDate" id="strStartDate"/>
					<s:hidden name="strEndDate" id="strEndDate"/>
					<s:hidden name="strProjectManager" id="strProjectManager"/>
					<h3 class="title">月报统计<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
					<div class="row">
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-1 form-label">工程师</label>
							<div class="col-lg-2">
								<select name="projectManager" id="projectManager" class="form-control">
									<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
										<option value="<s:property value="LOGIN_NAME"/>" <s:if test="%{strProjectManager == LOGIN_NAME}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
									</s:iterator>
								</select>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-1 form-label">开始时间</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="startDate" value="<s:property value="strStartDate"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label to">-</label>
							<label for="" class="col-lg-1 form-label">终了时间</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="endDate" value="<s:property value="strEndDate"/>" maxlength="10" />
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
					<div style="overflow-x: auto; width: 100%;">
						<table class="table table-bordered" style="width: 2580px;">
							<tr>
								<th colspan="1">时间</th>
								<th colspan="1">收到审价</th>
								<th colspan="2">完成审价（个）</th>
								<th colspan="2">总金额（万元）</th>
								<th colspan="1">审定总金额</th>
								<th colspan="2">未完成（个）</th>
								<th colspan="1">复核项目</th>
								<th colspan="2">审价费（万元）</th>
								<th colspan="4">实收审价费（万元）</th>
								<th colspan="2">本月总发票</th>
								<th colspan="2">本月未收</th>
								<th colspan="2">历史未收发票</th>
							</tr>
							<tr>
								<th style="width: 140px;">累计</th>
								<th style="width: 120px;">个</th>
								<th style="width: 100px;">本月</th>
								<th style="width: 100px;">历史</th>
								<th style="width: 100px;">本月送审</th>
								<th style="width: 120px;">本月完成送审</th>
								<th style="width: 120px;">万元</th>
								<th style="width: 100px;">当月</th>
								<th style="width: 100px;">历史</th>
								<th style="width: 100px;">个</th>
								<th style="width: 140px;">本月确认应收</th>
								<th style="width: 120px;">未确认</th>
								<th style="width: 140px;">本月发票（张）</th>
								<th style="width: 120px;">本月</th>
								<th style="width: 120px;">历史（张）</th>
								<th style="width: 120px;">历史</th>
								<th style="width: 100px;">张</th>
								<th style="width: 100px;">金额（万元）</th>
								<th style="width: 100px;">张</th>
								<th style="width: 100px;">金额（万元）</th>
								<th style="width: 100px;">张</th>
								<th style="width: 100px;">金额（万元）</th>
							</tr>
							<tr>
								<th colspan="14" style="text-align: center;">地铁审价项目</tg>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
							<s:iterator id="auditDataMonthSum_1" value="auditDataMonthSum_1" status="st1">
							<tr>
								<td><s:property value="showtime"/></td>
								<td><s:property value="receiveAudit"/></td>
								<td><s:property value="completeAuditCurrentMonth"/></td>
								<td><s:property value="completeAuditHis"/></td>
								<td><s:property value="submitAuditAmount"/></td>
								<td><s:property value="completeAuditAmount"/></td>
								<td><s:property value="authorizeAuditAmount"/></td>
								<td><s:property value="incompleteAuditCurrentMonth"/></td>
								<td><s:property value="incompleteAuditHis"/></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><s:property value="totalNumMonth"/></td>
								<td><s:property value="totalAmountMonth"/></td>
								<td><s:property value="unreceivedNumMonth"/></td>
								<td><s:property value="unreceivedAmountMonth"/></td>
								<td><s:property value="unreceivedNumHis"/></td>
								<td><s:property value="unreceivedAmountHis"/></td>
							</tr>
							</s:iterator>
							<tr>
								<td>总计</td>
								<td><s:property value="sumAuditAnnualData_1.receiveAudit"/></td>
								<td><s:property value="sumAuditAnnualData_1.completeAuditCurrentMonth"/></td>
								<td><s:property value="sumAuditAnnualData_1.completeAuditHis"/></td>
								<td><s:property value="sumAuditAnnualData_1.submitAuditAmount"/></td>
								<td><s:property value="sumAuditAnnualData_1.completeAuditAmount"/></td>
								<td><s:property value="sumAuditAnnualData_1.authorizeAuditAmount"/></td>
								<td><s:property value="sumAuditAnnualData_1.incompleteAuditCurrentMonth"/></td>
								<td><s:property value="sumAuditAnnualData_1.incompleteAuditHis"/></td>
								<td><s:property value="sumAuditAnnualData_1.reviewAudit"/></td>
								<td><s:property value="sumAuditAnnualData_1.auditAmountMonthConfirm"/></td>
								<td><s:property value="sumAuditAnnualData_1.auditAmountMonthUnconfirmed"/></td>
								<td><s:property value="sumAuditAnnualData_1.receiptAuditPieceMonth"/></td>
								<td><s:property value="sumAuditAnnualData_1.receiptAuditAmountMonth"/></td>
								<td><s:property value="sumAuditAnnualData_1.receiptAuditPieceHis"/></td>
								<td><s:property value="sumAuditAnnualData_1.receiptAuditAmountHis"/></td>
								<td><s:property value="sumAuditAnnualData_1.totalNumMonth"/></td>
								<td><s:property value="sumAuditAnnualData_1.totalAmountMonth"/></td>
								<td><s:property value="sumAuditAnnualData_1.unreceivedNumMonth"/></td>
								<td><s:property value="sumAuditAnnualData_1.unreceivedAmountMonth"/></td>
								<td><s:property value="sumAuditAnnualData_1.unreceivedNumHis"/></td>
								<td><s:property value="sumAuditAnnualData_1.unreceivedAmountHis"/></td>
							</tr>
							<tr>
								<th colspan="14" style="text-align: center;">地铁咨询项目</tg>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
							<s:iterator id="auditDataMonthSum_2" value="auditDataMonthSum_2" status="st1">
							<tr>
								<td><s:property value="showtime"/></td>
								<td><s:property value="receiveAudit"/></td>
								<td><s:property value="completeAuditCurrentMonth"/></td>
								<td><s:property value="completeAuditHis"/></td>
								<td><s:property value="submitAuditAmount"/></td>
								<td><s:property value="completeAuditAmount"/></td>
								<td><s:property value="authorizeAuditAmount"/></td>
								<td><s:property value="incompleteAuditCurrentMonth"/></td>
								<td><s:property value="incompleteAuditHis"/></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><s:property value="totalNumMonth"/></td>
								<td><s:property value="totalAmountMonth"/></td>
								<td><s:property value="unreceivedNumMonth"/></td>
								<td><s:property value="unreceivedAmountMonth"/></td>
								<td><s:property value="unreceivedNumHis"/></td>
								<td><s:property value="unreceivedAmountHis"/></td>
							</tr>
							</s:iterator>
							<tr>
								<td>总计</td>
								<td><s:property value="sumAuditAnnualData_2.receiveAudit"/></td>
								<td><s:property value="sumAuditAnnualData_2.completeAuditCurrentMonth"/></td>
								<td><s:property value="sumAuditAnnualData_2.completeAuditHis"/></td>
								<td><s:property value="sumAuditAnnualData_2.submitAuditAmount"/></td>
								<td><s:property value="sumAuditAnnualData_2.completeAuditAmount"/></td>
								<td><s:property value="sumAuditAnnualData_2.authorizeAuditAmount"/></td>
								<td><s:property value="sumAuditAnnualData_2.incompleteAuditCurrentMonth"/></td>
								<td><s:property value="sumAuditAnnualData_2.incompleteAuditHis"/></td>
								<td><s:property value="sumAuditAnnualData_2.reviewAudit"/></td>
								<td><s:property value="sumAuditAnnualData_2.auditAmountMonthConfirm"/></td>
								<td><s:property value="sumAuditAnnualData_2.auditAmountMonthUnconfirmed"/></td>
								<td><s:property value="sumAuditAnnualData_2.receiptAuditPieceMonth"/></td>
								<td><s:property value="sumAuditAnnualData_2.receiptAuditAmountMonth"/></td>
								<td><s:property value="sumAuditAnnualData_2.receiptAuditPieceHis"/></td>
								<td><s:property value="sumAuditAnnualData_2.receiptAuditAmountHis"/></td>
								<td><s:property value="sumAuditAnnualData_2.totalNumMonth"/></td>
								<td><s:property value="sumAuditAnnualData_2.totalAmountMonth"/></td>
								<td><s:property value="sumAuditAnnualData_2.unreceivedNumMonth"/></td>
								<td><s:property value="sumAuditAnnualData_2.unreceivedAmountMonth"/></td>
								<td><s:property value="sumAuditAnnualData_2.unreceivedNumHis"/></td>
								<td><s:property value="sumAuditAnnualData_2.unreceivedAmountHis"/></td>
							</tr>
							<tr>
								<th colspan="14" style="text-align: center;">地铁控制价项目</tg>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
							<s:iterator id="auditDataMonthSum_4" value="auditDataMonthSum_4" status="st1">
							<tr>
								<td><s:property value="showtime"/></td>
								<td><s:property value="receiveAudit"/></td>
								<td><s:property value="completeAuditCurrentMonth"/></td>
								<td><s:property value="completeAuditHis"/></td>
								<td><s:property value="submitAuditAmount"/></td>
								<td><s:property value="completeAuditAmount"/></td>
								<td><s:property value="authorizeAuditAmount"/></td>
								<td><s:property value="incompleteAuditCurrentMonth"/></td>
								<td><s:property value="incompleteAuditHis"/></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><s:property value="totalNumMonth"/></td>
								<td><s:property value="totalAmountMonth"/></td>
								<td><s:property value="unreceivedNumMonth"/></td>
								<td><s:property value="unreceivedAmountMonth"/></td>
								<td><s:property value="unreceivedNumHis"/></td>
								<td><s:property value="unreceivedAmountHis"/></td>
							</tr>
							</s:iterator>
							<tr>
								<td>总计</td>
								<td><s:property value="sumAuditAnnualData_4.receiveAudit"/></td>
								<td><s:property value="sumAuditAnnualData_4.completeAuditCurrentMonth"/></td>
								<td><s:property value="sumAuditAnnualData_4.completeAuditHis"/></td>
								<td><s:property value="sumAuditAnnualData_4.submitAuditAmount"/></td>
								<td><s:property value="sumAuditAnnualData_4.completeAuditAmount"/></td>
								<td><s:property value="sumAuditAnnualData_4.authorizeAuditAmount"/></td>
								<td><s:property value="sumAuditAnnualData_4.incompleteAuditCurrentMonth"/></td>
								<td><s:property value="sumAuditAnnualData_4.incompleteAuditHis"/></td>
								<td><s:property value="sumAuditAnnualData_4.reviewAudit"/></td>
								<td><s:property value="sumAuditAnnualData_4.auditAmountMonthConfirm"/></td>
								<td><s:property value="sumAuditAnnualData_4.auditAmountMonthUnconfirmed"/></td>
								<td><s:property value="sumAuditAnnualData_4.receiptAuditPieceMonth"/></td>
								<td><s:property value="sumAuditAnnualData_4.receiptAuditAmountMonth"/></td>
								<td><s:property value="sumAuditAnnualData_4.receiptAuditPieceHis"/></td>
								<td><s:property value="sumAuditAnnualData_4.receiptAuditAmountHis"/></td>
								<td><s:property value="sumAuditAnnualData_4.totalNumMonth"/></td>
								<td><s:property value="sumAuditAnnualData_4.totalAmountMonth"/></td>
								<td><s:property value="sumAuditAnnualData_4.unreceivedNumMonth"/></td>
								<td><s:property value="sumAuditAnnualData_4.unreceivedAmountMonth"/></td>
								<td><s:property value="sumAuditAnnualData_4.unreceivedNumHis"/></td>
								<td><s:property value="sumAuditAnnualData_4.unreceivedAmountHis"/></td>
							</tr>
						</table>
						<div class="operationBtns">
							<button type="button" class="btn btn-success" onclick="exportAuditAnnualData();">导出审价统计</button>
						</div>
					</div>
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
	
	$(function () { 
		$(".selectpicker").selectpicker({
			noneSelectedText : '请选择'//默认显示内容
		});
		var str = $("#strProjectManager").val();
	    var arr = str.split(',');
	    $('#projectManager').selectpicker('val', arr);
	});

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
