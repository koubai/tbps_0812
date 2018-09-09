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
<title>招标合同一览</title>
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
	function selectCntrct() {
		var obj = null;
		var id = "";
		var list = document.getElementsByName("radioKey");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				obj = list[i];
				id = list[i].value;
				break;
			}
		}
		if(obj == null) {
			alert("请选择一条记录！");
			return;
		}
		//添加产品信息
		var tr = obj.parentNode.parentNode;
		var tds = tr.getElementsByTagName("td");
		var inputs = tds[0].getElementsByTagName("input");
		
		var CNTRCT_NO = inputs[0].value;
		var CNTRCT_YEAR = inputs[1].value;
		var CNTRCT_ST_DATE = inputs[2].value;
		var CNTRCT_ED_DATE = inputs[3].value;
		var BID_COMP_NO = inputs[4].value;
		var BID_COMP_NAME = inputs[5].value;
		var CO_MANAGER1 = inputs[6].value;
		var CO_MANAGER_TEL1 = inputs[7].value;
		var CO_ADDRESS1 = inputs[8].value;
		var CO_MANAGER_EMAIL1 = inputs[9].value;
		var CO_TAX = inputs[10].value;
		
		var id = getSelectedID();
		window.dialogArguments.document.getElementById("tmpCNTRCT_NO").value = CNTRCT_NO;
		window.dialogArguments.document.getElementById("tmpCNTRCT_YEAR").value = CNTRCT_YEAR;
		window.dialogArguments.document.getElementById("tmpCNTRCT_ST_DATE").value = CNTRCT_ST_DATE;
		window.dialogArguments.document.getElementById("tmpCNTRCT_ED_DATE").value = CNTRCT_ED_DATE;
		window.dialogArguments.document.getElementById("tmpBID_COMP_NO").value = BID_COMP_NO;
		window.dialogArguments.document.getElementById("tmpBID_COMP_NAME").value = BID_COMP_NAME;
		window.dialogArguments.document.getElementById("tmpCO_MANAGER1").value = CO_MANAGER1;
		window.dialogArguments.document.getElementById("tmpCO_MANAGER_TEL1").value = CO_MANAGER_TEL1;
		window.dialogArguments.document.getElementById("tmpCO_ADDRESS1").value = CO_ADDRESS1;
		window.dialogArguments.document.getElementById("tmpCO_MANAGER_EMAIL1").value = CO_MANAGER_EMAIL1;
		window.dialogArguments.document.getElementById("tmpCO_TAX").value = CO_TAX;
		
		window.close();
	}

	function setOpenDate() {
		$("#strCNTRCT_ST_DATE").attr("value", $("#tmpCNTRCT_ST_DATE").val());
		$("#strCNTRCT_ED_DATE").attr("value", $("#tmpCNTRCT_ED_DATE").val());
		$("#strBID_COMP_NO").attr("value", $("#strAgentNo").val());
	}

	function queryList() {
		setOpenDate();
		document.mainform.action = '<c:url value="/bidcntrct/querySelectBidCntrctList.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		setOpenDate();
		document.getElementById("startIndex").value = pageNum;
		document.mainform.action = '<c:url value="/bidcntrct/turnSelectBidCntrctPage.action"></c:url>';
		document.mainform.submit();
	}

	//页跳转
	function turnPage() {
		var totalPage = "${page_select.totalPage}";
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
			<div class="col-lg-10 right">
				<s:form id="mainform" name="mainform" method="POST">
					<s:hidden name="startIndex_select" id="startIndex"/>
					<s:hidden name="strUpdCNTRCT_NO" id="strUpdCNTRCT_NO"/>
					<s:hidden name="strCNTRCT_ST_DATE" id="strCNTRCT_ST_DATE"/>
					<s:hidden name="strCNTRCT_ED_DATE" id="strCNTRCT_ED_DATE"/>
					<s:hidden name="strBID_COMP_NO" id="strBID_COMP_NO"/>
					<h3 class="title">招标合同一览</h3>
					<div class="row">
						<div class="col-lg-2 form-group">
							<label for="" class="col-lg-1 form-label">合同年份</label>
							<div class="col-lg-1">
								<s:textfield name="strCNTRCT_YEAR" id="strCNTRCT_YEAR" cssClass="form-control" maxlength="4" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-1 form-label">合同期限</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input id="tmpCNTRCT_ST_DATE" value="<s:property value="strCNTRCT_ST_DATE"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label to">---</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input id="tmpCNTRCT_ED_DATE" value="<s:property value="strCNTRCT_ED_DATE"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">合同编号</label>
							<div class="col-lg-9">
								<s:textfield name="strCNTRCT_NO" id="strCNTRCT_NO" cssClass="form-control" maxlength="20" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-2 form-group">
							<button type="button" class="btn btn-success form-control" onclick="queryList();">检索</button>
						</div>
					</div>
					<table class="table table-bordered">
						<tr>
							<th style="display: none;"></th>
							<th></th>
							<th>合同年份</th>
							<th>合同编号</th>
							<th>委托单位</th>
							<th>项目总数量</th>
							<th>完成数量</th>
							<th>进行中数量</th>
							<th>失败数量</th>
							<th>应收代理费</th>
							<th>实收代理费</th>
							<th>标书费</th>
							<th>专家费支出</th>
						</tr>
						<s:iterator id="listSelectBidCntrct" value="listSelectBidCntrct" status="st1">
							<tr>
								<td style="display: none;">
									<input type="hidden" value="<s:property value="CNTRCT_NO"/>"/>
									<input type="hidden" value="<s:property value="CNTRCT_YEAR"/>"/>
									<input type="hidden" value="<s:property value="CNTRCT_ST_DATE"/>"/>
									<input type="hidden" value="<s:property value="CNTRCT_ED_DATE"/>"/>
									<input type="hidden" value="<s:property value="BID_COMP_NO"/>"/>
									<input type="hidden" value="<s:property value="BID_COMP_NAME"/>"/>
									<input type="hidden" value="<s:property value="CO_MANAGER1"/>"/>
									<input type="hidden" value="<s:property value="CO_MANAGER_TEL1"/>"/>
									<input type="hidden" value="<s:property value="CO_ADDRESS1"/>"/>
									<input type="hidden" value="<s:property value="CO_MANAGER_EMAIL1"/>"/>
									<input type="hidden" value="<s:property value="CO_TAX"/>"/>
								</td>
								<td><input name="radioKey" type="radio" value="<s:property value="CNTRCT_NO"/>"/></td>
								<td><s:property value="CNTRCT_YEAR"/></td>
								<td><s:property value="CNTRCT_NO"/></td>
								<td><s:property value="BID_COMP_NAME"/></td>
								<td><s:property value="totalProject"/></td>
								<td><s:property value="finishProject"/></td>
								<td><s:property value="buildingProject"/></td>
								<td><s:property value="failProject"/></td>
								<td><s:property value="CNTRCT_ALL_AMOUNT"/></td>
								<td><s:property value="CNTRCT_UNPAY_AMOUNT"/></td>
								<td><s:property value="bidAmount"/></td>
								<td><s:property value="expertAmount"/></td>
							</tr>
						</s:iterator>
					</table>
					<jsp:include page="../turning_select.jsp" flush="true" />
				</s:form>
			</div>
		</div>
		<div class="operationBtns addBtns mgt15 btn3" style="width: 300px;">
			<button type="button" onclick="selectCntrct();">确定</button>
			<button type="button" onclick="window.close();">关闭</button>
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