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
<title>招标项目信息输入</title>
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
		if(checkdata()) {
			if(confirm("确定追加吗？")) {
				document.mainform.action = '<c:url value="/bidcntrct/addBidCntrct.action"></c:url>';
				document.mainform.submit();
			}
		}
	}
	
	function checkdata() {
		var CNTRCT_NO = $("#CNTRCT_NO").val();
		var CNTRCT_YEAR = $("#CNTRCT_YEAR").val();
		$("#CNTRCT_ST_DATE").val($("#tmpCNTRCT_ST_DATE").val());
		$("#CNTRCT_ED_DATE").val($("#tmpCNTRCT_ED_DATE").val());
		
		$("#BID_COMP_NO").val($("#agentNo").val());
		$("#BID_COMP_NAME").val($("#agentCoName").val());
		$("#CO_MANAGER1").val($("#agentCoManager").val());
		$("#CO_MANAGER_TEL1").val($("#agentCoManagerTel").val());
		$("#CO_ADDRESS1").val($("#agentCoPostAddress").val());
		$("#CO_MANAGER_EMAIL1").val($("#AGENT_CO_MAIL").val());
		
		var CNTRCT_ST_DATE = $("#CNTRCT_ST_DATE").val();
		var CNTRCT_ED_DATE = $("#CNTRCT_ED_DATE").val();
		var CNTRCT_TYPE = $("#CNTRCT_TYPE").val();
		var BID_COMP_NO = $("#BID_COMP_NO").val();
		
		var CO_MANAGER1 = $("#CO_MANAGER1").val();
		var CO_MANAGER_TEL1 = $("#CO_MANAGER_TEL1").val();
		var CO_ADDRESS1 = $("#CO_ADDRESS1").val();
		var CO_MANAGER_EMAIL1 = $("#CO_MANAGER_EMAIL1").val();
		
		if(CNTRCT_NO == "") {
			alert("合同编号不能为空！");
			$("#CNTRCT_NO").focus();
			return false;
		}
		if(CNTRCT_YEAR == "") {
			alert("合同年份不能为空！");
			$("#CNTRCT_YEAR").focus();
			return false;
		}
		if(CNTRCT_ST_DATE == "") {
			alert("合同开始日期不能为空！");
			$("#CNTRCT_ST_DATE").focus();
			return false;
		}
		if(CNTRCT_ED_DATE == "") {
			alert("合同结束日期不能为空！");
			$("#CNTRCT_ED_DATE").focus();
			return false;
		}
		if(CNTRCT_TYPE == "") {
			alert("请选择合同类别！");
			$("#CNTRCT_TYPE").focus();
			return false;
		}
		if(BID_COMP_NO == "") {
			alert("请选择委托公司！");
			$("#agentNo").focus();
			return false;
		}
		if(CO_MANAGER1 == "") {
			alert("委托公司联系人不能为空！");
			$("#agentCoManager").focus();
			return false;
		}
		if(CO_MANAGER_TEL1 == "") {
			alert("委托公司联系方式不能为空！");
			$("#agentCoManagerTel").focus();
			return false;
		}
		if(CO_ADDRESS1 == "") {
			alert("委托公司地址不能为空！");
			$("#agentCoPostAddress").focus();
			return false;
		}
		if(CO_MANAGER_EMAIL1 != "" && !isMail(CO_MANAGER_EMAIL1)) {
			alert("请输入正确的委托公司邮箱！");
			$("#AGENT_CO_MAIL").focus();
			//$("#agent_mail_pr").focus();
			return false;
		}
		return true;
	}
	
	//委托公司
	function selectAgentComp() {
		var url = '<c:url value="/bid/showAddBidAgentCompAction.action"></c:url>';
		url += "?agentAddFlag=1&date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function goBidCntrctList() {
		window.location.href = '<c:url value="/bidcntrct/queryBidCntrctList.action"></c:url>';
	}
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<s:form id="mainform" name="mainform" method="POST">
			<s:hidden name="addBidCntrctDto.CNTRCT_ST_DATE" id="CNTRCT_ST_DATE"></s:hidden>
			<s:hidden name="addBidCntrctDto.CNTRCT_ED_DATE" id="CNTRCT_ED_DATE"></s:hidden>
			<s:hidden name="addBidCntrctDto.BID_COMP_NO" id="BID_COMP_NO"></s:hidden>
			<s:hidden name="addBidCntrctDto.BID_COMP_NAME" id="BID_COMP_NAME"></s:hidden>
			<s:hidden name="addBidCntrctDto.CO_MANAGER1" id="CO_MANAGER1"></s:hidden>
			<s:hidden name="addBidCntrctDto.CO_MANAGER_TEL1" id="CO_MANAGER_TEL1"></s:hidden>
			<s:hidden name="addBidCntrctDto.CO_ADDRESS1" id="CO_ADDRESS1"></s:hidden>
			<s:hidden name="addBidCntrctDto.CO_MANAGER_EMAIL1" id="CO_MANAGER_EMAIL1"></s:hidden>
			<div class="row">
				<div class="container-fluid">
					<s:if test="hasActionMessages()">
						<div class="row">
							<span style="color:red; text-align:center;"><s:actionmessage /></span>
						</div>
					</s:if>
					<div class="row mgt15">
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label"><span class="red">*</span>合同编号</label>
							<div class="col-lg-9">
								<s:textfield name="addBidCntrctDto.CNTRCT_NO" id="CNTRCT_NO" cssClass="form-control" maxlength="20" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label"><span class="red">*</span>年份</label>
							<div class="col-lg-9">
								<s:textfield name="addBidCntrctDto.CNTRCT_YEAR" id="CNTRCT_YEAR" cssClass="form-control" maxlength="20" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-2 form-label"><span class="red">*</span>合同期限</label>
							<div class="col-lg-4">
								<div class="input-group date" data-provide="datepicker">
									<input id="tmpCNTRCT_ST_DATE" value="<s:date name="addBidCntrctDto.CNTRCT_ST_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label to">---</label>
							<div class="col-lg-4">
								<div class="input-group date" data-provide="datepicker">
									<input id="tmpCNTRCT_ED_DATE" value="<s:date name="addBidCntrctDto.CNTRCT_ED_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label"><span class="red">*</span>合同类别</label>
							<div class="col-lg-9">
								<select name="addBidCntrctDto.CNTRCT_TYPE" id="CNTRCT_TYPE" class="form-control">
									<option value="">请选择</option>
									<s:if test='addBidCntrctDto.CNTRCT_TYPE == "1"'>
										<option value="1" selected="selected">招标</option>
										<option value="4">竞价</option>
									</s:if>
									<s:elseif test='addBidCntrctDto.CNTRCT_TYPE == "4"'>
										<option value="1">招标</option>
										<option value="4" selected="selected">竞价</option>
									</s:elseif>
									<s:else>
										<option value="1">招标</option>
										<option value="4">竞价</option>
									</s:else>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="box">
								<h5>委托公司信息</h5>
								<div class="row">
									<label class="col-lg-4 form-label">代码</label>
									<div class="col-lg-5">
										<input type="text" id="agentNo" disabled="disabled" maxlength="4" class="form-control" value="<s:property value="addBidCntrctDto.BID_COMP_NO" />" />
									</div>
									<div class="col-lg-3"><button type="button" class="btn btn-success form-control" onclick="selectAgentComp()">检索</button></div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">单位名称</label>
									<div class="col-lg-8">
										<input type="text" id="agentCoName" disabled="disabled" maxlength="40" class="form-control" value="<s:property value="addBidCntrctDto.BID_COMP_NAME" />" />
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">联系人</label>
									<div class="col-lg-8">
										<input type="text" id="agentCoManager" maxlength="6" class="form-control" value="<s:property value="addBidCntrctDto.CO_MANAGER1" />" />
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">联系方式</label>
									<div class="col-lg-8">
										<input type="text" id="agentCoManagerTel" maxlength="30" class="form-control" value="<s:property value="addBidCntrctDto.CO_MANAGER_TEL1" />" />
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">地址</label>
									<div class="col-lg-8">
										<input type="text" id="agentCoPostAddress" maxlength="80" class="form-control" value="<s:property value="addBidCntrctDto.CO_ADDRESS1" />" />
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">邮箱</label>
									<div class="col-lg-8">
										<input type="text" id="AGENT_CO_MAIL" maxlength="100" class="form-control" value="<s:property value="addBidCntrctDto.CO_MANAGER_EMAIL1" />" />
										<input type="hidden" id="agent_mail_pr">
										<input type="hidden" id="agent_mail_suffix">
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">开票信息</label>
									<div class="col-lg-8">
										<s:textfield name="addBidCntrctDto.CO_TAX" id="CO_TAX" cssClass="form-control" maxlength="80" theme="simple"></s:textfield>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="operationBtns addBtns mgt15 btn3">
						<button type="button" class="btn btn-success" onclick="add();">保存</button>
						<button type="button" class="btn btn-success" onclick="goBidCntrctList();">返回</button>
					</div>
				</div>
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
