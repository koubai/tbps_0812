<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<div class="col-lg-2 left">
	<div class="panel-group" id="accordion">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"> 合同 </a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse">
				<div class="panel-body">
					<ul>
						<li><a href="javascript:;" onclick="queryAuditCntrctList()">审计合同一览</a></li>
						<li><a href="javascript:;" onclick="add()">审计合同新增</a></li>
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
			<div id="collapseThree" class="panel-collapse collapse in">
				<div class="panel-body">
					<ul>
						<li><a href="javascript:;" onclick="queryAuditList()">审价项目一览</a></li>
						<li><a href="javascript:;" onclick="addaudit()">审价项目新增</a></li>
						<li><a href="">项目情况检查</a></li>
						<li><a href="">统计界面</a></li>
						<li><a href="">项目收费统计输出</a></li>
						<li><a href="">到账统计</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>