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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Calendar3.js"></script>
<title>保证金汇总表</title>
<script type="text/javascript">
	$(document).ready(function(){
		var h = screen.availHeight; 
		$("#container").height(h - 80);
	});
	
	function queryList() {
		setQueryDate();
		document.mainform.action = '<c:url value="/bond/queryBondAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function showDetail(agentNo) {
		var url = '<c:url value="/bond/showBondDetailAction.action"></c:url>' + "?strAgentNo=" + agentNo + "&date=" + new Date();
		window.showModalDialog(url, window, "dialogheight:500px;dialogwidth:1024px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function exportExcel() {
		setQueryDate();
		document.mainform.action = '<c:url value="/bond/exportBondAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function exportExcel() {
		setQueryDate();
		document.mainform.action = '<c:url value="/bond/exportBondAction.action"></c:url>';
		document.mainform.submit();
	}

	function goHome() {
		document.mainform.action = '<c:url value="/home/goHomeAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryAgentCommon() {
		var url = '<c:url value="/agentcomp/showAgentCompCommonAction.action"></c:url>' + "?strKey=strAgentCode&date=" + new Date();
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:1000px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function setQueryDate() {
		$("#strTenderOpenDateLow").attr("value", $("#tenderOpenDateLow").val());
		$("#strTenderOpenDateHigh").attr("value", $("#tenderOpenDateHigh").val());
	}
	
	function showExportDate() {
		setQueryDate();
		var strAgentCode = $("#strAgentCode").val();
		var strProjectType = $("#strProjectType").val();
		var strTenderOpenDateLow = $("#strTenderOpenDateLow").val();
		var strTenderOpenDateHigh = $("#strTenderOpenDateHigh").val();
		var url = '<c:url value="/bond/showExportDateAction.action"></c:url>' + "?date=" + new Date() + "&strAgentCode=" + strAgentCode + "&strProjectType=" + 
		strProjectType + "&strTenderOpenDateLow=" + strTenderOpenDateLow + "&strTenderOpenDateHigh=" + strTenderOpenDateHigh;
		//window.showModalDialog(url, window, "dialogheight:500px;dialogwidth:1000px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
		window.open(url, window, 'height=1000, width=1000, top=5, left=100, status=0,resizable=no,scrollbars=yes');
	}
</script>
</head>
<body>
	<div id="container">
		<div id="top">
			<div class="logobox">
				<div class="logo_tittle"></div>
				<div class="logo"></div>
			</div>
		</div>
		<div class="content">
			<jsp:include page="../info.jsp" flush="true" />
			<div class="tittle">
				<div class="icons"><a class="home" href="#" onclick="goHome();">返回首页</a><a class="quit" href="#" onclick="logout();">退出</a></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center">
					保证金汇总表
				</div>
				<div class="tittle_right">
				</div>
			</div>
			<s:form id="mainform" name="mainform" method="POST">
				<s:hidden id="strAgentName" name="strAgentName"></s:hidden>
				<s:hidden id="strTenderOpenDateLow" name="strTenderOpenDateLow"></s:hidden>
				<s:hidden id="strTenderOpenDateHigh" name="strTenderOpenDateHigh"></s:hidden>
				<div class="searchbox">
					<div class="box1">
						<label class="pdf10">开标日期</label>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 105px;" id="tenderOpenDateLow" value="<s:property value="strTenderOpenDateLow"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('tenderOpenDateLow'));"></a>
						</div>
						<div class="box1_right"></div>
						<label>-</label>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 105px;" id="tenderOpenDateHigh" value="<s:property value="strTenderOpenDateHigh"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('tenderOpenDateHigh'));"></a>
						</div>
						<div class="box1_right"></div>
					</div>
					
					<div class="box1">
						<label class="pdf10">委托公司代码</label>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<s:textfield name="strAgentCode" id="strAgentCode" cssStyle="width:120px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</div>
					
					<div class="btn" style="margin-left: 5px;">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="button" class="input40" value="选择" onclick="queryAgentCommon();"/>
						</div>
						<div class="box1_right"></div>
					</div>
					
					<div class="box1">
						<label class="pdf10">分类</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="strProjectType" name="strProjectType" style="width: 150px;">
								<s:if test='strProjectType == "1"'>
									<option value="">请选择</option>
									<option value="1" selected="selected">招标</option>
									<option value="2">比选</option>
									<option value="3">招标办</option>
									<option value="4">竞价</option>
								</s:if>
								<s:elseif test='strProjectType == "2"'>
									<option value="">请选择</option>
									<option value="1">招标</option>
									<option value="2" selected="selected">比选</option>
									<option value="3">招标办</option>
									<option value="4">竞价</option>
								</s:elseif>
								<s:elseif test='strProjectType == "3"'>
									<option value="">请选择</option>
									<option value="1">招标</option>
									<option value="2">比选</option>
									<option value="3" selected="selected">招标办</option>
									<option value="4">竞价</option>
								</s:elseif>
								<s:elseif test='strProjectType == "4"'>
									<option value="">请选择</option>
									<option value="1">招标</option>
									<option value="2">比选</option>
									<option value="3">招标办</option>
									<option value="4" selected="selected">竞价</option>
								</s:elseif>
								<s:else>
									<option value="" selected="selected">请选择</option>
									<option value="1">招标</option>
									<option value="2">比选</option>
									<option value="3">招标办</option>
									<option value="4">竞价</option>
								</s:else>
							</select>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="btn" style="margin-left: 150px; margin-top: 0px;">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="button" class="input40" value="检索" onclick="queryList();"/>
						</div>
						<div class="box1_right"></div>
					</div>
				</div>
				<div class="data_table" style="padding:0px;">
					<div class="tab_tittle">
						<table width="100%" border="1" cellpadding="5" cellspacing="0">
						</table>
					</div>
					<div class="tab_content">
						<table class="info_tab" width="100%" border="1" cellpadding="0" cellspacing="0" style="border-top:black solid 0px; border-bottom: 0px;">
							<tr class="tittle" style="height: 50px;">
								<td width="20"></td>
								<td width="180">公司名称</td>
								<td width="410" valign="top">
									<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
										<tr style="background:rgb(238,238,238);">
											<td colspan="5" align="center">其中</td>
										</tr>
										<tr style="background:rgb(238,238,238);">
											<td width="80">现金</td>
											<td width="80">支票</td>
											<td>汇票、网上银行</td>
											<td width="80">保函</td>
											<td width="80">现金2</td>
										</tr>
									</table>
								</td>
								<td width="80">总收</td>
								<td width="80">已退</td>
								<td width="80">转代理费</td>
								<td width="80">评标费</td>
								<td width="80">备注</td>
							</tr>
							<s:iterator id="listBondDto" value="listBondDto" status="st1">
								<s:if test="#st1.odd==true">
									<s:if test='DATA_TYPE == "3"'>
										<tr style="background-color: rgb(130,219,237);">
									</s:if>
									<s:else>
										<tr class="tr_bg">
									</s:else>
								</s:if>
								<s:else>
									<s:if test='DATA_TYPE == "3"'>
										<tr style="background-color: rgb(130,219,237);">
									</s:if>
									<s:else>
										<tr>
									</s:else>
								</s:else>
									<td></td>
									<td>
										<s:if test='DATA_TYPE == "3"'>
											<s:property value="AGENT_CO_NAME"/>
										</s:if>
										<s:else>
											<a href="#" onclick="showDetail('<s:property value="AGENT_NO"/>')"><s:property value="AGENT_CO_NAME"/>（<s:property value="AGENT_NO"/>）</a>
										</s:else>
									</td>
									<td valign="top">
										<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
											<tr style="height: 30px;">
												<td width="80"><s:property value="AMOUNT1"/></td>
												<td width="80"><s:property value="AMOUNT2"/></td>
												<td><s:property value="AMOUNT34"/></td>
												<td width="80"><s:property value="AMOUNT5"/></td>
												<td width="80"><s:property value="AMOUNT6"/></td>
											</tr>
										</table>
									</td>
									<td><s:property value="TOTAL"/></td>
									<td><s:property value="REFUND"/></td>
									<td><s:property value="AGENT_FEE"/></td>
									<td><s:property value="BID_COMMISION"/></td>
									<td><s:property value="MEMO"/></td>
								</tr>
							</s:iterator>
						</table>
					</div>
				</div>
				<div class="btns" style="margin-top:-70px;">
					<table border="0" style="margin:0 auto;">
						<tr>
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" type="button" value="下载" onclick="showExportDate();"/>
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</s:form>
		</div>
	</div>
</body>
</html>
