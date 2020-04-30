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
<title><s:property value="strBidNo"/>投标公司一览</title>
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
					<s:property value="strBidNo"/>投标公司一览
				</div>
				<div class="tittle_right" style="width: 500px;">
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
				<table class="info_tab" width="170%" border="1" cellpadding="0" cellspacing="0" style="border-top:black solid 0px; border-bottom: 0px;">
					<tr class="tittle">
						<td width="20"></td>
						<td width="140">公司名称</td>
						<td width="80">负责人</td>
						<td width="100">联系电话</td>
						<td width="160">地址</td>
						<td width="120">邮箱</td>
						<td width="80">保证金</td>
						<td width="80">退还签名</td>
						<td width="80">支付形式</td>
						<td width="80">投标价</td>
						<td width="80">评审价</td>
						<td width="80">中标与否</td>
						<td width="80">中标价</td>
						<td width="80">标书费</td>
						<td width="80">到账日期</td>
						<td width="100">发票号码</td>
						<td width="160">备注</td>
					</tr>
					<s:iterator id="listBidComp" value="listBidComp" status="st1">
						<s:if test="#st1.odd==true">
							<tr class="tr_bg">
						</s:if>
						<s:else>
							<tr>
						</s:else>
							<td></td>
							<td><s:property value="BID_CO_NAME"/></td>
							<td><s:property value="BID_CO_MANAGER"/></td>
							<td><s:property value="BID_CO_TEL"/></td>
							<td><s:property value="BID_CO_ADD"/></td>
							<td><s:property value="BID_CO_PS"/></td>
							<td><s:property value="BID_BOND"/></td>
							<td><s:property value="BID_REFUND_SIGN"/></td>
							<td>
								<s:if test='BID_PAYMENT_TYPE == "1"'>
									现金
								</s:if>
								<s:elseif test='BID_PAYMENT_TYPE == "2"'>
									支票
								</s:elseif>
								<s:elseif test='BID_PAYMENT_TYPE == "3"'>
									转账
								</s:elseif>
								<s:elseif test='BID_PAYMENT_TYPE == "4"'>
									汇票
								</s:elseif>
								<s:elseif test='BID_PAYMENT_TYPE == "5"'>
									保函
								</s:elseif>
								<s:elseif test='BID_PAYMENT_TYPE == "6"'>
									现金2
								</s:elseif>
								<s:elseif test='BID_PAYMENT_TYPE == "9"'>
									/
								</s:elseif>
							</td>
							<td><s:property value="BID_PRICE"/></td>
							<td><s:property value="BID_CHECK_PRICE"/></td>
							<td>
								<s:if test='BID_RESULT == "Y"'>
									是
								</s:if>
								<s:else>
									否
								</s:else>
							</td>
							<td><s:property value="BID_WIN_PRICE"/></td>
							<td><s:property value="BID_APPLY_PRICE"/></td>
							<td><s:property value="BID_VALUE_DATE"/></td>
							<td><s:property value="BID_RECEIPT_NO"/></td>
							<td><s:property value="MEMO1"/></td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
	</div>
</s:form>
</body>
</html>
