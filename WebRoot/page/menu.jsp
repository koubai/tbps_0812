<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<s:if test='#session.toggle_menu_flag == "1"'>
	<div class="col-lg-2 left" style="display: none;">
</s:if>
<s:else>
	<div class="col-lg-2 left">
</s:else>
	<ul class="nav navbar-nav side-nav">
	<div class="panel-group" id="accordion">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><i class="fa fa-list-ul"></i> 审价</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse">
				<div class="panel-body">
					<ul>
						<li><a href="<%=request.getContextPath()%>/auditcntrct/showAuditCntrctAction.action">审价一览</a></li>
						<li><a href="<%=request.getContextPath()%>/auditcntrct/showAddAuditCntrctAction.action">合同新增</a></li>
						<li><a href="<%=request.getContextPath()%>/audit/showAuditAction.action">审价项目一览</a></li>
						<li><a href="<%=request.getContextPath()%>/audit/showAddAuditAction.action">审价项目（新增）</a></li>
						<li><a href="<%=request.getContextPath()%>/audit/showAuditAuth.action">项目情况检查</a></li>
						<li><a href="<%=request.getContextPath()%>/audit/showAuditStatistics.action">统计界面</a></li>
						<li><a href="<%=request.getContextPath()%>/audit/showAuditStatCost.action">项目收费统计输出</a></li>
						<li><a href="<%=request.getContextPath()%>/audit/showAuditStatPaid.action">到账统计</a></li>
						<li><a href="<%=request.getContextPath()%>/auditcntrct/showAuditCntrctBAction.action">投资监理B项目一览</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><i class="fa fa-list-ul"></i> 招标 </a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse">
				<div class="panel-body">
					<ul>
						<li><a href="<%=request.getContextPath()%>/bidcntrct/showBidCntrctPage.action">招标合同管理一览</a></li>
						<li><a href="<%=request.getContextPath()%>/bidcntrct/showAddBidCntrct.action">招标合同增加</a></li>
						<li><a href="<%=request.getContextPath()%>/bid/showBidAction.action">招标项目检索和一览</a></li>
						<li><a href="<%=request.getContextPath()%>/bid/showAddBidAction.action">项目信息（新增）</a></li>
						<li><a href="<%=request.getContextPath()%>/bidagentcost/showBidAgentCostAction.action">代理费计算</a></li>
						<li><a href="<%=request.getContextPath()%>/bidexpertcost/showBidExpertCostAction.action">专家费计算</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><i class="fa fa-list-ul"></i> 委托公司信息 </a>
				</h4>
			</div>
			<div id="collapseThree" class="panel-collapse collapse">
				<div class="panel-body">
					<ul>
						<li><a href="<%=request.getContextPath()%>/agentcomp/showAgentCompAction.action">委托公司信息</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"><i class="fa fa-list-ul"></i> 专家库信息 </a>
				</h4>
			</div>
			<div id="collapseFour" class="panel-collapse collapse">
				<div class="panel-body">
					<ul>
						<li><a href="<%=request.getContextPath()%>/expertlib/showExpertLibAction.action">专家库信息</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapseFive"><i class="fa fa-list-ul"></i> 用户信息管理 </a>
				</h4>
			</div>
			<div id="collapseFive" class="panel-collapse collapse">
				<div class="panel-body">
					<ul>
						<li><a href="<%=request.getContextPath()%>/userinfo/showUserInfoAction.action">用户信息管理</a></li>
						<li><a href="<%=request.getContextPath()%>/superviselib/showSuperviseLibAction.action">会审监管人管理</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</ul>
</div>