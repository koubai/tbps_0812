<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>审价/招标管理系统</title> <!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/global.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/local.css" />

<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
	//审价一览
	function auditcntrct() {
		window.location.href = '<c:url value="/auditcntrct/showAuditCntrctAction.action"></c:url>';
	}
	// 招标合同管理一览
	function bidcntrct() {
		window.location.href = '<c:url value="/bidcntrct/showBidCntrctPage.action"></c:url>';
	}
	// 审价项目一览
	function audit() {
		window.location.href = '<c:url value="/audit/showAuditAction.action"></c:url>';
	}
	// 招标项目检索和一览
	function bid() {
		window.location.href = '<c:url value="/bid/showBidAction.action"></c:url>';
	}
	// 项目情况检查
	function auditinfo() {
		window.location.href = '<c:url value="/audit/showAuditAuth.action"></c:url>';
	}
	// 代理费计算
	function agentcalc() {
		window.location.href = '<c:url value="/bidagentcost/showBidAgentCostAction.action"></c:url>';
	}
	// 统计界面
	function accurate() {
		window.location.href = '<c:url value="/audit/showAuditStatistics.action"></c:url>';
	}
	// 专家费计算
	function expertcost() {
		window.location.href = '<c:url value="/bidexpertcost/showBidExpertCostAction.action"></c:url>';
	}
	// 项目收费统计输出
	function auditcostaccurate() {
		window.location.href = '<c:url value="/audit/showAuditStatCost.action"></c:url>';
	}
	// 委托公司信息
	function showAgentCompAction() {
		window.location.href = '<c:url value="/agentcomp/showAgentCompAction.action"></c:url>';
	}
	// 到账统计
	function accountaccurate() {
		window.location.href = '<c:url value="/audit/showAuditStatPaid.action"></c:url>';
	}
	// 专家库信息
	function showExpertLibAction() {
		window.location.href = '<c:url value="/expertlib/showExpertLibAction.action"></c:url>';
	}
	// 投资监理B项目一览
	function showauditB() {
		window.location.href = '<c:url value="/auditcntrct/showAuditCntrctBAction.action"></c:url>';
	}
	// 用户信息管理
	function manageUser() {
		window.location.href = '<c:url value="/userinfo/showUserInfoAction.action"></c:url>';
	}
	function manageSuperviselib() {
		window.location.href = '<c:url value="/superviselib/showSuperviseLibAction.action"></c:url>';
	}
</script>
</head>
<body>
	<jsp:include page="head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="info.jsp" flush="true" />
		<!-- <div class="row menuList">  -->
		<div class="row menuList">
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="auditcntrct();">审价一览</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="bidcntrct();">招标合同管理一览</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="audit();">审价项目一览</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="bid();">招标项目检索和一览</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="auditinfo();">项目情况检查</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="agentcalc();">代理费计算</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="accurate();">统计界面</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="expertcost();">专家费计算</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="auditcostaccurate();">项目收费统计输出</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="showAgentCompAction();">委托公司信息</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="accountaccurate();">到账统计</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="showExpertLibAction();">专家库信息</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="showauditB();">投资监理B项目一览</a>
			</div>
			<s:if test='#session.user_rank >= "B"'>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="manageUser();">用户信息管理</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="manageSuperviselib();">会审监管人管理</a>
			</div>
			</s:if>
		</div>
	</div>
	<!--  <div class="bottom">
		<div class="container">
			<img src="<%=request.getContextPath()%>/images/footer.gif" alt="">
		</div>
	</div> -->
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="node_modules/jquery/dist/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
