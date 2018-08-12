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
<title>内部费用结算清单</title>
<script type="text/javascript">
	$(document).ready(function(){
		var h = screen.availHeight; 
		$("#container").height(h - 60);
	});
	
	//设置专业
	function settype() {
		var major = "";
		var list = document.getElementsByName("type");
		for(var i = 1; i < list.length + 1; i++) {
			if(list[i - 1].checked) {
				major += "" + i;
			} else {
				major += "0";
			}
		}
		$("#strTypes").attr("value", major);
		$("#strBillDateLow").attr("value", $("#billDateLow").val());
		$("#strBillDateHigh").attr("value", $("#billDateHigh").val());
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
	
	function exportExcel() {
		settype();
		document.mainform.action = '<c:url value="/settlement/exportSettlementAction.action"></c:url>';
		document.mainform.submit();
	}

	function goHome() {
		document.mainform.action = '<c:url value="/home/goHomeAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryList() {
		settype();
		document.mainform.action = '<c:url value="/settlement/querySettlementAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryAgentCommon() {
		var url = '<c:url value="/agentcomp/showAgentCompCommonAction.action"></c:url>' + "?strKey=strAgentNo&date=" + new Date();
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:1000px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
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
					内部费用结算清单
				</div>
				<div class="tittle_right">
				</div>
			</div>
			<s:form id="mainform" name="mainform" method="POST">
				<s:hidden name="startIndex" id="startIndex"/>
				<s:hidden name="strBillDateLow" id="strBillDateLow"/>
				<s:hidden name="strBillDateHigh" id="strBillDateHigh"/>
				<s:hidden name="strTypes" id="strTypes"/>
				<div class="searchbox">
					<div class="box1">
						<label class="pdf10">查询日期</label>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" id="billDateLow" value="<s:property value="strBillDateLow"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('billDateLow'));"></a>
						</div>
						<div class="box1_right"></div>
						<label>-</label>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" id="billDateHigh" value="<s:property value="strBillDateHigh"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('billDateHigh'));"></a>
						</div>
						<div class="box1_right"></div>
					</div>
					
					<div class="box1">
						<label class="pdf10">委托公司</label>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<s:textfield name="strAgentNo" id="strAgentNo" cssStyle="width:120px;" maxlength="4" theme="simple"></s:textfield>
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
					
					<div class="box1" style="margin-left: 5px;">
						<label class="pdf10">查询分类：</label>
						<div style="width: 300px; margin-top: 5px;">
							<s:if test='%{strTypes.substring(0, 1) == "1"}'>
								<input name="type" type="checkbox" checked="checked"/>代扣　
							</s:if>
							<s:else>
								<input name="type" type="checkbox"/>代扣　
							</s:else>
							<s:if test='%{strTypes.substring(1, 2) == "2"}'>
								<input name="type" type="checkbox" checked="checked"/>审价　
							</s:if>
							<s:else>
								<input name="type" type="checkbox"/>审价　
							</s:else>
							<s:if test='%{strTypes.substring(2, 3) == "3"}'>
								<input name="type" type="checkbox" checked="checked"/>招标　
							</s:if>
							<s:else>
								<input name="type" type="checkbox"/>招标　
							</s:else>
						</div>
					</div>
					<div class="btn" style="">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="button" class="input40" value="检索" onclick="queryList();"/>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="box1" style="position:absolute; margin-left: 550px; color: red;">
						<s:actionmessage />
					</div>
				</div>
				<div class="data_table" style="padding:0px;">
					<div class="tab_tittle">
						<table width="100%" border="1" cellpadding="5" cellspacing="0">
						</table>
					</div>
					<div class="tab_content">
						<table class="info_tab" width="2048" border="1" cellpadding="0" cellspacing="0" style="border-top:black solid 0px; border-bottom: 0px;">
							<tr class="tittle" style="height: 50px;">
								<td width="20">　</td>
								<td width="100">到账日期</td>
								<td width="230" valign="top">
									<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
										<tr style="background:rgb(238,238,238);">
											<td colspan="2" align="center">发票</td>
										</tr>
										<tr style="background:rgb(238,238,238);">
											<td width="100">发票日期</td>
											<td>发票号码</td>
										</tr>
									</table>
								</td>
								<td width="720" valign="top">
									<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
										<tr style="background:rgb(238,238,238);">
											<td colspan="4" align="center">项目</td>
										</tr>
										<tr style="background:rgb(238,238,238);">
											<td width="130">审价/招标编号</td>
											<td width="160">委托单位</td>
											<td>项目名称</td>
											<td width="140">支付单位</td>
										</tr>
									</table>
								</td>
								<td width="450" valign="top">
									<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
										<tr style="background:rgb(238,238,238);">
											<td colspan="4" align="center">收入</td>
										</tr>
										<tr style="background:rgb(238,238,238);">
											<td width="100">审价</td>
											<td width="100">标书费</td>
											<td>代理费</td>
											<td width="100">合计</td>
										</tr>
									</table>
								</td>
								<td width="350" valign="top">
									<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
										<tr style="background:rgb(238,238,238);">
											<td colspan="3" align="center">联合</td>
										</tr>
										<tr style="background:rgb(238,238,238);">
											<td width="100">税后金额</td>
											<td>代扣</td>
											<td width="100">月余额</td>
										</tr>
									</table>
								</td>
							</tr>
							<s:iterator id="listSettlement" value="listSettlement" status="st1">
								<s:if test="#st1.odd==true">
									<s:if test='DATA_TYPE == "4"'>
										<tr style="background-color: yellow;">
									</s:if>
									<s:elseif test='DATA_TYPE == "5"'>
										<tr style="background-color: rgb(130,219,237);">
									</s:elseif>
									<s:else>
										<tr class="tr_bg">
									</s:else>
								</s:if>
								<s:else>
									<s:if test='DATA_TYPE == "4"'>
										<tr style="background-color: yellow;">
									</s:if>
									<s:elseif test='DATA_TYPE == "5"'>
										<tr style="background-color: rgb(130,219,237);">
									</s:elseif>
									<s:else>
										<tr>
									</s:else>
								</s:else>
									<td></td>
									<td>
										<s:if test='DATA_TYPE == "4"'>
											<s:property value="TOTAL_DATE"/>小计
										</s:if>
										<s:elseif test='DATA_TYPE == "5"'>
											总计
										</s:elseif>
										<s:else>
											<s:date name="BILL_DATE" format="yyyy/MM/dd"/>
										</s:else>
									</td>
									<td valign="top">
										<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
											<tr style="height: 30px;">
												<td width="100"><s:date name="RECEIPT_DATE" format="yyyy/MM/dd"/></td>
												<td>
													<div noWrap style="width:105px;text-overflow:ellipsis;overflow:hidden">
														<s:property value="RECEIPT_NO"/>
													</div>
												</td>
											</tr>
										</table>
									</td>
									<td valign="top">
										<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
											<tr style="height: 30px;">
												<td width="130">
													<s:if test='DATA_TYPE == "2" || DATA_TYPE == "3"'>
														<s:property value="BILL_NO"/>
													</s:if>
												</td>
												<td width="160">
													<s:if test='AGENT_NO != null && AGENT_NO != ""'>
														<s:property value="AGENT_COMP"/>（<s:property value="AGENT_NO"/>）
													</s:if>
												</td>
												<td>
													<div noWrap style="width:220px;text-overflow:ellipsis;overflow:hidden">
														<s:property value="PROJECT_NAME"/>
													</div>
												</td>
												<td width="140"><s:property value="PAY_COMP"/></td>
											</tr>
										</table>
									</td>
									<td valign="top">
										<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
											<tr style="height: 30px;">
												<td width="100">
													<s:property value="CHECK_PRICE"/>
												</td>
												<td width="100">
													<s:property value="APPLY_PRICE"/>
												</td>
												<td>
													<s:property value="COMMISSION_PRICE"/>
												</td>
												<td width="100">
													<s:property value="AMOUNT_PRICE"/>
												</td>
											</tr>
										</table>
									</td>
									<td valign="top">
										<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
											<tr style="height: 30px;">
												<td width="100">
													<s:property value="AT_PRICE"/>
												</td>
												<td>
													<s:property value="WITHHOLD_PRICE"/>
												</td>
												<td width="100">&nbsp;
													<s:property value="REMAIN_PRICE"/>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</s:iterator>
						</table>
					</div>
					<!--
					<div class="pages">
						<ul>
							<li>第<strong>${page.startIndex + 1}</strong>页/共<strong>${page.totalPage==0?1:page.totalPage}</strong>页/共<strong>${page.totalCount}</strong>条记录</li>
							<li class="mgl15">跳转到
								<input type="text" id="pagenum" class="text" maxlength="4" size="4"/>
								<input type="button" value="GO" onclick="javascript:turnPage();"/>
							</li>
							<li class="mgl15">
								<a class="first" href="#" onclick="changePage(0);">首页</a>
							</li>
							<li>
								<s:if test="%{page.startIndex <= 0}">
									<a class="last" href="#">上一页</a>
								</s:if>
								<s:else>
									<a class="next" href="#" onclick="changePage('${page.previousIndex}');">上一页</a>
								</s:else>
							</li>
							<li>
								<s:if test="%{page.nextIndex > page.totalPage - 1}">
									<a class="last" href="#">下一页</a>
								</s:if>
								<s:else>
									<a class="next" href="#" onclick="changePage('${page.nextIndex}');">下一页</a>
								</s:else>
							</li>
							<li>
								<a class="next" href="#" onclick="changePage('${page.totalPage - 1}');">末页</a>
							</li>
						</ul>
					</div>
					-->
				</div>
				<div class="btns" style="margin-top:-50px;">
					<table border="0" style="margin:0 auto;">
						<tr>
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" type="button" value="下载" onclick="exportExcel();"/>
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
