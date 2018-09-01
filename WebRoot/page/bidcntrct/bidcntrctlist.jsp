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
<title>招标合同管理一览</title>
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
	function add() {
		document.mainform.action = '<c:url value="/bidcntrct/showAddBidCntrc.action"></c:url>';
		document.mainform.submit();
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
	
	function setOpenDate() {
		$("#strCNTRCT_ST_DATE").attr("value", $("#tmpCNTRCT_ST_DATE").val());
		$("#strCNTRCT_ED_DATE").attr("value", $("#tmpCNTRCT_ED_DATE").val());
		$("#strBID_COMP_NO").attr("value", $("#strAgentNo").val());
	}

	function queryList() {
		setOpenDate();
		document.mainform.action = '<c:url value="/bidcntrct/queryBidCntrcList.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		setOpenDate();
		document.getElementById("startIndex").value = pageNum;
		document.mainform.action = '<c:url value="/bidcntrct/turnBidCntrcPage.action"></c:url>';
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
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<div class="row">
			<jsp:include page="../menu.jsp" flush="true" />
			<div class="col-lg-10 right">
			 	<a class="toggle" href="javascript:;"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
				<s:form id="mainform" name="mainform" method="POST">
					<s:hidden name="startIndex" id="startIndex"/>
					<s:hidden name="strCNTRCT_ST_DATE" id="strCNTRCT_ST_DATE"/>
					<s:hidden name="strCNTRCT_ED_DATE" id="strCNTRCT_ED_DATE"/>
					<s:hidden name="strBID_COMP_NO" id="strBID_COMP_NO"/>
					<h3 class="title">招标合同管理一览<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
					<div class="row">
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">合同年份</label>
							<div class="col-lg-9">
								<s:textfield name="strCNTRCT_YEAR" id="strCNTRCT_YEAR" cssClass="form-control" maxlength="4" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-2 form-label">合同期限</label>
							<div class="col-lg-4">
								<div class="input-group date" data-provide="datepicker">
									<input id="tmpCNTRCT_ST_DATE" value="<s:property value="strCNTRCT_ST_DATE"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label to">---</label>
							<div class="col-lg-4">
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
						<div class="col-lg-5 form-group">
							<label for="" class="col-lg-3 form-label">委托公司</label>
							<div class="col-lg-7">
								<input type="text" id="strAgentNo" class="form-control" value="<s:property value="strBID_COMP_NO"/>">
							</div>
							<div class="col-lg-2">
								<button type="button" class="btn btn-success" onclick="queryAgentCommon();">选择</button>
							</div>
						</div>
						<div class="col-lg-2 form-group">
							<button type="button" class="btn btn-success form-control" onclick="queryList();">检索</button>
						</div>
					</div>
					<div class="btns">
						<ul>
							<li><a href="#" onclick="add();"><i class="fa fa-plus" aria-hidden="true"></i>新增</a></li>
							<!-- <li><a href="#" onclick="upd();"><i class="fa fa-pencil" aria-hidden="true"></i>修改</a></li> -->
							<li><a href="#" onclick="del();"><i class="fa fa-trash" aria-hidden="true"></i>删除</a></li>
						</ul>
					</div>
					<table class="table table-bordered">
						<tr>
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
						<s:iterator id="listBidCntrct" value="listBidCntrct" status="st1">
							<tr>
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
					<jsp:include page="../turning.jsp" flush="true" />
				</s:form>
			</div>
		</div>
		<div class="operationBtns addBtns mgt15 btn3" style="width: 300px;">
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