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
<title>合同选择一览</title>
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
	function selAuditCntrct() {
		var obj = null;
		var list = document.getElementsByName("radioKey");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				obj = list[i];
				break;
			}
		}
		if(obj == null) {
			alert("请选择一条记录！");
			return;
		}
		//将客户数据添加到父页面中
		var tr = obj.parentNode.parentNode;
		var tds = tr.getElementsByTagName("td");
		var inputs = tds[0].getElementsByTagName("input");
		var CNTRCT_BELONG = inputs[0].value;
		if(CNTRCT_BELONG == 1){
			CNTRCT_BELONG = '联合';
		} else if(CNTRCT_BELONG == 2){
			CNTRCT_BELONG = 'XX';
		}
		var CNTRCT_NO = inputs[1].value;
		var CNTRCT_TYPE = inputs[2].value;
		if(CNTRCT_TYPE == 1){
			CNTRCT_TYPE = '地铁';
		} else if(CNTRCT_TYPE == 2){
			CNTRCT_TYPE = '非地铁';
		}
		var CNTRCT_NAME = inputs[3].value;
		var CNTRCT_NM = inputs[4].value;
		var AUDIT_COMP_NAME = inputs[5].value;
		var CO_MANAGER_ADDRESS1 = inputs[6].value;
		var strCntrctStDate = inputs[7].value;
		var strCntrctEdDate = inputs[8].value;
		window.dialogArguments.document.getElementById("CNTRCT_BELONG").value = CNTRCT_BELONG;
		window.dialogArguments.document.getElementById("CNTRCT_NO").value = CNTRCT_NO;
		window.dialogArguments.document.getElementById("CNTRCT_TYPE").value = CNTRCT_TYPE;
		window.dialogArguments.document.getElementById("CNTRCT_NAME").value = CNTRCT_NAME;
		window.dialogArguments.document.getElementById("CNTRCT_NM").value = CNTRCT_NM;
		window.dialogArguments.document.getElementById("AUDIT_COMP_NAME").value = AUDIT_COMP_NAME;
		window.dialogArguments.document.getElementById("CO_MANAGER_ADDRESS1").value = CO_MANAGER_ADDRESS1;
		window.dialogArguments.document.getElementById("strCntrctStDate").value = strCntrctStDate;
		window.dialogArguments.document.getElementById("strCntrctEdDate").value = strCntrctEdDate;
		window.close();
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

	function goHome() {
		document.mainform.action = '<c:url value="/home/goHomeAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryList() {
		document.mainform.action = '<c:url value="/auditcntrct/querySelectAuditCntrctAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		document.getElementById("startIndex").value = pageNum;
		document.mainform.action = '<c:url value="/auditcntrct/turnSelectAuditCntrctAction.action"></c:url>';
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
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12 right">
				<s:form id="mainform" name="mainform" method="POST">
					<s:hidden name="startIndex" id="startIndex"/>
					<div class="row">
						<div class="col-lg-12 form-group">
							<label for="" class="col-xs-1 form-label">开始日</label>
							<div class="col-xs-3">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="strCntrctStDate" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-xs-1 form-label to">---</label>
							<label for="" class="col-xs-1 form-label">终了日</label>
							<div class="col-xs-3">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="strCntrctEdDate" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<div class="col-xs-2 form-group">
								<button type="button" class="btn btn-success form-control" onclick="queryList();">检索</button>
							</div>
						</div>
					</div>
					<table class="table table-bordered">
						<tr>
							<th></th>
							<th>合同归属</th>
							<th>合同编号</th>
							<th>合同简称</th>
							<th>委托单位</th>
						</tr>
						<s:iterator id="listAuditCntrct" value="listAuditCntrct" status="st1">
							<tr>
								<td style="display: none;">
									<input type="hidden" value="<s:property value="CNTRCT_BELONG"/>"/>
									<input type="hidden" value="<s:property value="CNTRCT_NO"/>"/>
									<input type="hidden" value="<s:property value="CNTRCT_TYPE"/>"/>
									<input type="hidden" value="<s:property value="CNTRCT_NAME"/>"/>
									<input type="hidden" value="<s:property value="CNTRCT_NM"/>"/>
									<input type="hidden" value="<s:property value="AUDIT_COMP_NAME"/>"/>
									<input type="hidden" value="<s:property value="CO_MANAGER_ADDRESS1"/>"/>
									<input type="hidden" value="<s:property value="CNTRCT_ST_DATE"/>"/>
									<input type="hidden" value="<s:property value="CNTRCT_ED_DATE"/>"/>
								</td>
								<td><input name="radioKey" type="radio" value="<s:property value="CNTRCT_NO"/>"/></td>
								<td>
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
								<td><s:property value="CNTRCT_NM"/></td>
								<td><s:property value="AUDIT_COMP_NAME"/></td>
							</tr>
						</s:iterator>
					</table>
					<jsp:include page="../turning.jsp" flush="true" />
					<div class="operationBtns">
						<button class="btn btn-success" type="button" onclick="window.close();">取消</button>
						<button class="btn btn-success" type="button" onclick="selAuditCntrct();">确定</button>
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
