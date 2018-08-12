<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<title>审价履历一览</title>
<script type="text/javascript">
	//导出
	function exportHist() {
		document.mainform.action = '<c:url value="/audit/exportAuditHist.action"></c:url>';
		document.mainform.submit();
	}

	function showDetail() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			var url = '<c:url value="/audit/showAuditHistDetail.action"></c:url>' + "?detailAuditHisSeq=" + id + "&date=" + new Date();
			window.showModalDialog(url, window, "dialogheight:600px;dialogwidth:1024px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
		}
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
</script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:hidden;">
<s:form id="mainform" name="mainform" method="POST">
	<s:hidden name="strAuditNoHist" id="strAuditNoHist"></s:hidden>
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					审价履历一览
				</div>
				<div class="tittle_right">
				</div>
			</div>
		</div>
		<div class="data_table" style="padding:0px;">
			<div class="tab_tittle">
				<table width="100%" border="1" cellpadding="5" cellspacing="0">
				</table>
			</div>
			<div class="tab_content">
				<table class="info_tab" width="470%" border="1" cellpadding="0" cellspacing="0" style="border-top:black solid 0px; border-bottom: 0px;">
					<tr class="tittle" style="height: 50px;">
						<td width="40"></td>
						<td width="60">更新者</td>
						<td width="120">更新日期</td>
						<td width="80">审价编号</td>
						<td width="80">资料收到日期</td>
						<td width="80">项目进度</td>
						<td width="100">审定单发出日期</td>
						<td width="100">审定单回复日期</td>
						<td width="80">报告日期</td>
						<td width="100">文号</td>
						<td width="220">项目名称</td>
						<td width="100">项目合同编号</td>
						<td width="80">项目性质</td>
						<td width="180">委托公司</td>
						<td width="100">委托公司负责人</td>
						<td width="130">委托公司负责人电话</td>
						<td width="130">委托公司项目负责人</td>
						<td width="150">委托公司项目负责人电话</td>
						<td width="180">专业公司</td>
						<td width="100">专业公司负责人</td>
						<td width="130">专业公司负责人电话</td>
						<td width="130">专业公司项目负责人</td>
						<td width="150">专业公司项目负责人电话</td>
						<td width="180">承包公司</td>
						<td width="100">承包公司负责人</td>
						<td width="130">承包公司负责人电话</td>
						<td width="130">承包公司项目负责人</td>
						<td width="150">承包公司项目负责人电话</td>
						<td width="80">送审价</td>
						<td width="80">审定价</td>
						<td width="80">净核减</td>
						<td width="80">核增</td>
						<td width="80">核减</td>
						<td width="120">审价费（甲方）</td>
						<td width="120">审价费（乙方）</td>
						<td width="80">开票日期</td>
						<td width="80">发票号</td>
						<td width="80">到帐日期</td>
						<td width="80">担当者</td>
					</tr>
					<s:iterator id="listAuditHist" value="listAuditHist" status="st1">
						<tr>
							<td><input name="radioKey" type="radio" value="<s:property value="AUDIT_HIS_SEQ"/>"/></td>
							<td><s:property value="UPDATE_USER"/></td>
							<td><s:date name="UPDATE_DATE" format="yyyy/MM/dd HH:mm:ss"/></td>
							<td><s:property value="AUDIT_NO"/></td>
							<td><s:date name="DOC_ARR_DATE" format="yyyy/MM/dd"/></td>
							<td><s:property value="PROJECT_STATUS_NAME"/></td>
							<td><s:date name="VERIFY_DOC_SEND_DATE" format="yyyy/MM/dd"/></td>
							<td><s:date name="VERIFY_DOC_REPLY_DATE" format="yyyy/MM/dd"/></td>
							<td><s:date name="LAST_REPORT_DATE" format="yyyy/MM/dd"/></td>
							<td><s:property value="REPORT_NO"/></td>
							<td><s:property value="PROJECT_NAME"/></td>
							<td><s:property value="CONTRACT_NO"/></td>
							<td><s:property value="PROJECT_TYPE_NAME"/></td>
							<td><s:property value="AGENT_CO_NAME"/></td>
							<td><s:property value="AGENT_CO_MANAGER"/></td>
							<td><s:property value="AGENT_CO_MANAGER_TEL"/></td>
							<td><s:property value="AGENT_CO_STAFF"/></td>
							<td><s:property value="AGENT_CO_STAFF_TEL"/></td>
							<td><s:property value="PROF_CO_NAME"/></td>
							<td><s:property value="PROF_CO_MANAGER"/></td>
							<td><s:property value="PROF_CO_MANAGER_TEL"/></td>
							<td><s:property value="PROF_CO_STAFF"/></td>
							<td><s:property value="PROF_CO_STAFF_TEL"/></td>
							<td><s:property value="CONTRACT_CO_NAME"/></td>
							<td><s:property value="CONTRACT_CO_MANAGER"/></td>
							<td><s:property value="CONTRACT_CO_MANAGER_TEL"/></td>
							<td><s:property value="CONTRACT_CO_STAFF"/></td>
							<td><s:property value="CONTRACT_CO_STAFF_TEL"/></td>
							<td><s:property value="VERIFY_PER_AMOUNT"/></td>
							<td><s:property value="VERIFY_AMOUNT"/></td>
							<td><s:property value="VERIFY_DIFF"/></td>
							<td><s:property value="VERIFY_INCREASE"/></td>
							<td><s:property value="VERIFY_DECREASE"/></td>
							<td><s:property value="RECEIPT1_AMOUNT_A"/></td>
							<td><s:property value="RECEIPT1_AMOUNT_B"/></td>
							<td><s:date name="RECEIPT1_DATE" format="yyyy/MM/dd"/></td>
							<td><s:property value="RECEIPT1_NO"/></td>
							<td><s:date name="VALUE_DATE" format="yyyy/MM/dd"/></td>
							<td><s:property value="PROJECT_MANAGER"/></td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
		<div class="btns" style="margin-top:40px; margin-left: 0px;">
			<table border="0" style="margin:0 auto;">
				<tr>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input type="button" class="input80" value="详细" onclick="showDetail();"/>
							</div>
							<div class="box1_right"></div>
						</div>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input type="button" class="input80" value="下载" onclick="exportHist();"/>
							</div>
							<div class="box1_right"></div>
						</div>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input type="button" class="input80" value="关闭" onclick="window.close();"/>
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</s:form>
</body>
</html>
