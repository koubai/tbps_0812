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
<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
	function showBidAction() {
		window.location.href = '<c:url value="/bid/showBidAction.action"></c:url>';
	}
	
	function showAgentCompAction() {
		window.location.href = '<c:url value="/agentcomp/showAgentCompAction.action"></c:url>';
	}

	function showAuditCompAction() {
		window.location.href = '<c:url value="/auditcomp/showAuditCompAction.action"></c:url>';
	}
	
	function showExpertLibAction() {
		window.location.href = '<c:url value="/expertlib/showExpertLibAction.action"></c:url>';
	}
	
	function manageUser() {
		window.location.href = '<c:url value="/userinfo/showUserInfoAction.action"></c:url>';
	}
	
	function settlement() {
		window.location.href = '<c:url value="/settlement/showSettlementAction.action"></c:url>';
	}
	
	function withhold() {
		window.location.href = '<c:url value="/withhold/showWithholdAction.action"></c:url>';
	}
	
	function audit() {
		window.location.href = '<c:url value="/audit/showAuditAction.action"></c:url>';
	}
	
	function auditcntrct() {
		window.location.href = '<c:url value="/auditcntrct/showAuditCntrctAction.action"></c:url>';
	}
	
	function showBond() {
		window.location.href = '<c:url value="/bond/showBondAction.action"></c:url>';
	}
	
	function showBidCntrctAction() {
		window.location.href = '<c:url value="/bidcntrct/showBidCntrcPage.action"></c:url>';
	}
	
	function showBidAgentCostAction() {
		window.location.href = '<c:url value="/bidagentcost/showBidAgentCostAction.action"></c:url>';
	}
	
	function showBidProgressAction() {
		window.location.href = '<c:url value="/bidprogress/showBidProgressAction.action"></c:url>';
	}
</script>
</head>
<body>
	<jsp:include page="head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="info.jsp" flush="true" />
		<div class="row menuList">
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="auditcntrct();">审计一览</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="showBond();">保证金汇总</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="showBidAction();">招标信息一览</a>
			</div>
			<s:if test='#session.user_rank == "L"'>
				<div class="col-lg-6">
					<a class="btn btn-primary" href="#" onclick="withhold();">代扣信息管理</a>
				</div>
			</s:if>
			<s:else>
				<div class="col-lg-6">
				</div>
			</s:else>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="showAgentCompAction();">委托公司信息</a>
			</div>
			<s:if test='#session.user_rank == "L"'>
				<div class="col-lg-6">
					<a class="btn btn-primary" href="#" onclick="manageUser();">用户信息管理</a>
				</div>
			</s:if>
			<s:else>
				<div class="col-lg-6">
				</div>
			</s:else>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="showExpertLibAction();">专家库信息</a>
			</div>
			<s:if test='#session.user_rank == "L"'>
				<div class="col-lg-6">
					<a class="btn btn-primary" href="#" onclick="settlement();">内部费用结算清单</a>
				</div>
			</s:if>
			<s:else>
				<div class="col-lg-6">
				</div>
			</s:else>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="showAuditCompAction();">合同登记</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="showBidCntrctAction();">招标合同管理一览</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="showBidAgentCostAction();">代理费设定</a>
			</div>
			<div class="col-lg-6">
				<a class="btn btn-primary" href="#" onclick="showBidProgressAction();">项目进度</a>
			</div>
		</div>
	</div>
	<div class="bottom">
		<div class="container">
			<img src="<%=request.getContextPath()%>/images/footer.gif" alt="">
		</div>
	</div>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="node_modules/jquery/dist/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
