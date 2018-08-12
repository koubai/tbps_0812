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
<title><s:property value="strAgentCompName"/>保证金汇总表</title>
<script type="text/javascript">
	function showBidComp(bidNo) {
		var url = '<c:url value="/bond/showBondBidCompAction.action"></c:url>' + "?strBidNo=" + bidNo + "&date=" + new Date();
		window.showModalDialog(url, window, "dialogheight:400px;dialogwidth:1024px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function exportExcel() {
		document.mainform.action = '<c:url value="/bond/exportBondDetailAction.action"></c:url>';
		document.mainform.submit();
	}
</script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:hidden;">
<s:form id="mainform" name="mainform" method="POST">
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					<s:property value="strAgentCompName"/>保证金汇总表
				</div>
				<div class="tittle_right" style="width: 800px;">
					<div class="box1" style="margin-top:0px; margin-left: 240px; color: red;">
						<s:actionmessage />
					</div>
				</div>
			</div>
		</div>
		<div class="data_table" style="padding:0px;">
			<div class="tab_tittle">
				<table width="100%" border="1" cellpadding="5" cellspacing="0">
				</table>
			</div>
			<div class="tab_content">
				<table class="info_tab" width="330%" border="1" cellpadding="0" cellspacing="0" style="border-top:black solid 0px; border-bottom: 0px;">
					<tr class="tittle" style="height: 50px;">
						<td width="20"></td>
						<td width="100">招标编号</td>
						<td width="40">项目性质</td>
						<td width="120">项目名称</td>
						<td width="100">委托单位</td>
						<td width="80">联系人</td>
						<td width="80">会审监管人</td>
						<td width="60">代理费用支付方</td>
						<td width="80">投标单位</td>
						<td width="80">保证金金额（万元）</td>
						<td width="60">保证金收入时间</td>
						<td width="60">保证金退还时间</td>
						<td width="60">保证金支付形式</td>
						<td width="100">中标单位</td>
						<td width="80">中标价（万元）</td>
						<td width="160" valign="top">
							<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
								<tr style="background:rgb(238,238,238);">
									<td colspan="5" align="center">收费</td>
								</tr>
								<tr style="background:rgb(238,238,238);">
									<td width="80">标书费</td>
									<td width="80">代理费</td>
								</tr>
							</table>
						</td>
						<td width="80">专家费（元）</td>
						<td width="60">工程师</td>
						<td width="60">开标时间</td>
						<td width="60">评标时间</td>
						<td width="60">招标公告开始时间</td>
						<td width="60">招标公告结束时间</td>
						<td width="60">中标公示开始时间</td>
						<td width="60">中标公示结束时间</td>
						<td width="60">代理费到账时间</td>
						<td width="60">中标文件扫描</td>
						<td width="60">评标报告扫描归档时间</td>
						<td width="180" valign="top">
							<table class="info_tab2" width="100%" border="1" cellpadding="5" cellspacing="0">
								<tr style="background:rgb(238,238,238);">
									<td colspan="5" align="center">甲方资料归档</td>
								</tr>
								<tr style="background:rgb(238,238,238);">
									<td width="60">招标文件移交时间</td>
									<td width="60">投标文件移交时间</td>
									<td width="60">评标报告移交时间</td>
								</tr>
							</table>
						</td>
						<td width="80">限价</td>
						<td width="60">项目完成情况</td>
						<td width="100">备注</td>
					</tr>
					<s:iterator id="listBondDtoDetail" value="listBondDtoDetail" status="st1">
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
									<s:property value="BID_NO"/>
								</s:if>
								<s:else>
									<a href="#" onclick="showBidComp('<s:property value="BID_NO"/>')"><s:property value="BID_NO"/></a>
								</s:else>
							</td>
							<td><s:property value="PROJECT_TYPE_NAME"/></td>
							<td><s:property value="PROJECT_NAME"/></td>
							<td><s:property value="AGENT_CO_NAME"/></td>
							<td><s:property value="AGENT_CO_MANAGER"/></td>
							<td><s:property value="BOND_AUDIT"/></td>
							<td><s:property value="ANGENT_COST_PAYMENT"/></td>
							<td><s:property value="BID_CO_NAME"/></td>
							<td><s:property value="BID_BOND_WAN"/></td>
							<td><s:property value="BID_CO_VALUE_DATE"/></td>
							<td><s:property value="REFOUND_DEPOSIT_DATE"/></td>
							<td><s:property value="BID_PAYMENT_TYPE"/></td>
							<td><s:property value="BID_WIN_CO_NAME"/></td>
							<td><s:property value="BID_PRICE_LIST"/></td>
							<td valign="top">
								<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
									<tr style="height: 30px;">
										<td width="80"><s:property value="BID_APPLY_PRICE"/></td>
										<td width="80"><s:property value="RECEIPT1_AGENT_COMMISSION"/></td>
									</tr>
								</table>
							</td>
							<td><s:property value="BID_COMMISION"/></td>
							<td><s:property value="PROJECT_MANAGER"/></td>
							<td><s:date name="TENDER_OPEN_DATE" format="yyyy/MM/dd" /></td>
							<td><s:date name="RESERVE_DATE1" format="yyyy/MM/dd" /></td>
							<td><s:date name="SUBMIT_DATE" format="yyyy/MM/dd" /></td>
							<td><s:date name="SUBMIT_DATE2" format="yyyy/MM/dd" /></td>
							<td><s:date name="BID_NOTICE_DATE" format="yyyy/MM/dd" /></td>
							<td><s:date name="BID_NOTICE_DATE2" format="yyyy/MM/dd" /></td>
							<td><s:date name="BID_VALUE_DATE" format="yyyy/MM/dd" /></td>
							<td><s:date name="BID_WIN_SCAN_DATE" format="yyyy/MM/dd" /></td>
							<td><s:date name="BID_AUDIT_SCAN_DATE" format="yyyy/MM/dd" /></td>
							<td valign="top">
								<table class="info_tab2" width="100%" border="1" cellpadding="5" cellspacing="0">
									<tr style="height: 30px;">
										<td width="60"><s:date name="BID_CO_ZB_FM_DATE" format="yyyy/MM/dd" /></td>
										<td width="60"><s:date name="BID_CO_TB_FM_DATE" format="yyyy/MM/dd" /></td>
										<td width="60"><s:date name="BID_CO_PB_FM_DATE" format="yyyy/MM/dd" /></td>
									</tr>
								</table>
							</td>
							<td><s:property value="PROJ_ASTRICT_PRICE"/></td>
							<td><s:property value="FINISH_STATUS"/></td>
							<td><s:property value="FINISH_NOTE"/></td>														
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
	</div>
	<div class="btns" style="margin-top:10px;">
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
</body>
</html>
