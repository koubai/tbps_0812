<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<script type="text/javascript">

	function auditcntrct() {
		document.mainform.action = '<c:url value="/auditcntrct/showAddAuditCntrctAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryAuditCntrctList() {
		setQueryDate();
		document.mainform.action = '<c:url value="/auditcntrct/showAuditCntrctAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryAuditCntrctBList() {
		setQueryDate();
		document.mainform.action = '<c:url value="/auditcntrct/showAuditCntrctBAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryAuditList() {
		setQueryDate();
		document.mainform.action = '<c:url value="/audit/showAuditAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function addaudit() {
		setQueryDate();
		document.mainform.action = '<c:url value="/audit/showAddAuditAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryAuditAuth() {
		setQueryDate();
		document.mainform.action = '<c:url value="/audit/showAuditAuth.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryAuditStatistics() {
		setQueryDate();
		document.mainform.action = '<c:url value="/audit/showAuditStatistics.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryAuditStatCost() {
		setQueryDate();
		document.mainform.action = '<c:url value="/audit/showAuditStatCost.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryAuditStatPaid() {
		setQueryDate();
		document.mainform.action = '<c:url value="/audit/showAuditStatPaid.action"></c:url>';
		document.mainform.submit();
	}

</script>
<div class="col-lg-2 left">
	<div class="panel-group" id="accordion">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"> 合同 </a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in">
				<div class="panel-body">
					<ul>
						<li><a href="javascript:;" onclick="queryAuditCntrctList()">审计合同一览</a></li>
						<li><a href="javascript:;" onclick="auditcntrct()">审计合同新增</a></li>
						<li><a href="javascript:;" onclick="queryAuditCntrctBList()">投资监理B项目一览</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"> 项目 </a>
				</h4>
			</div>
			<div id="collapseThree" class="panel-collapse collapse">
				<div class="panel-body">
					<ul>
						<li><a href="javascript:;" onclick="queryAuditList()">审价项目一览</a></li>
						<li><a href="javascript:;" onclick="addaudit()">审价项目新增</a></li>
						<li><a href="javascript:;" onclick="queryAuditAuth()">项目情况检查</a></li>
						<li><a href="javascript:;" onclick="queryAuditStatistics()">统计界面</a></li>
						<li><a href="javascript:;" onclick="queryAuditStatCost()">项目收费统计输出</a></li>
						<li><a href="javascript:;" onclick="queryAuditStatPaid()">到账统计</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>