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
<title>招标履历一览</title>
<script type="text/javascript">
	//导出
	function exportHist() {
		document.mainform.action = '<c:url value="/bid/exportBidHisAction.action"></c:url>';
		document.mainform.submit();
	}

	function showDetail() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			var url = '<c:url value="/bid/showBidHisDetailAction.action"></c:url>' + "?detailBidHisSeq=" + id + "&date=" + new Date();
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
	<s:hidden name="strBidNoHist" id="strBidNoHist"></s:hidden>
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					招标履历一览
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
				<table class="info_tab" width="460%" border="1" cellpadding="0" cellspacing="0" style="border-top:black solid 0px; border-bottom: 0px;">
					<tr class="tittle" style="height: 50px;">
						<td width="40"></td>
						<td width="80">更新者</td>
						<td width="135">更新日期</td>
						<td width="150">招标编号</td>
						<td width="80">分类</td>
						<td width="150">项目名称</td>
						<td width="310" valign="top">
							<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
								<tr style="background:rgb(238,238,238);">
									<td colspan="3" align="center">委托公司</td>
								</tr>
								<tr style="background:rgb(238,238,238);">
									<td width="60">代码</td>
									<td>名称</td>
									<td width="90">电话</td>
								</tr>
							</table>
						</td>
						<td width="80">担当者</td>
						<td width="80">发标日期</td>
						<td width="80">开标日期</td>
						<td width="80">上网公告</td>
						<td width="80">网页下载</td>
						<td width="80">报名表式<br />（编制）</td>
						<td width="80">报名表式<br />（审核）</td>
						<td width="80">报名表式<br />（汇总）</td>
						<td width="240">
							<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
								<tr style="background:rgb(238,238,238);">
									<td colspan="3" align="center">专家</td>
								</tr>
								<tr style="background:rgb(238,238,238);">
									<td width="80">名单提供</td>
									<td>通知与否</td>
									<td width="80">通知确认</td>
								</tr>
							</table>
						</td>
						<td width="80">澄清文件</td>
						<td width="80">补遗文件</td>
						<td width="80">补遗文件发出</td>
						<td width="80">投标人回复</td>
						<td width="320">
							<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
								<tr style="background:rgb(238,238,238);">
									<td colspan="4" align="center">中标</td>
								</tr>
								<tr style="background:rgb(238,238,238);">
									<td width="80">公示</td>
									<td width="80">公示审核</td>
									<td>通知书发出</td>
									<td width="80">合同告知书</td>
								</tr>
							</table>
						</td>
						<td width="240">
							<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
								<tr style="background:rgb(238,238,238);">
									<td colspan="3" align="center">合同</td>
								</tr>
								<tr style="background:rgb(238,238,238);">
									<td width="80">附件邮甲方</td>
									<td>合同审核</td>
									<td width="80">意见稿发出</td>
								</tr>
							</table>
						</td>
						<td width="240">
							<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
								<tr style="background:rgb(238,238,238);">
									<td colspan="3" align="center">评标报告</td>
								</tr>
								<tr style="background:rgb(238,238,238);">
									<td width="80">报告编制</td>
									<td>报告审核</td>
									<td width="80">报告发出</td>
								</tr>
							</table>
						</td>
						<td width="400">
							<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
								<tr style="background:rgb(238,238,238);">
									<td colspan="4" align="center">发票1</td>
								</tr>
								<tr style="background:rgb(238,238,238);">
									<td width="100">代理费</td>
									<td width="100">开票日期</td>
									<td>开票人</td>
									<td width="120">发票号码</td>
								</tr>
							</table>
						</td>
						<td width="520">
							<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
								<tr style="background:rgb(238,238,238);">
									<td colspan="5" align="center">发票2</td>
								</tr>
								<tr style="background:rgb(238,238,238);">
									<td width="80">接受人</td>
									<td width="120">签收单编号</td>
									<td>签收时间</td>
									<td width="120">快递编号</td>
									<td width="100">快递时间</td>
								</tr>
							</table>
						</td>
					</tr>
					<s:iterator id="listBidHist" value="listBidHist" status="st1">
						<tr>
							<td><input name="radioKey" type="radio" value="<s:property value="BID_HIS_SEQ"/>"/></td>
							<td><s:property value="UPDATE_USER"/></td>
							<td><s:date name="UPDATE_DATE" format="yyyy/MM/dd HH:mm:ss"/></td>
							<td><s:property value="BID_NO"/></td>
							<td>
								<s:if test='PROJECT_TYPE == "1"'>
									招标
								</s:if>
								<s:elseif test='PROJECT_TYPE == "2"'>
									比选
								</s:elseif>
								<s:elseif test='PROJECT_TYPE == "3"'>
									招标办
								</s:elseif>
							</td>
							<td><s:property value="PROJECT_NAME"/></td>
							<td valign="top">
								<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
									<tr style="height: 30px;">
										<td width="60"><s:property value="AGENT_NO"/></td>
										<td>
											<div noWrap style="width:120px;text-overflow:ellipsis;overflow:hidden">
												<s:property value="AGENT_CO_NAME"/>
											</div>
										</td>
										<td width="90"><s:property value="AGENT_CO_MANAGER_TEL"/></td>
									</tr>
								</table>
							</td>
							<td><s:property value="PROJECT_MANAGER"/></td>
							<td><s:date name="TENDER_START_DATE" format="yyyy/MM/dd"/></td>
							<td><s:date name="TENDER_OPEN_DATE" format="yyyy/MM/dd"/></td>
							<td><s:property value="TENDER_ONLINE"/></td>
							<td><s:property value="TENDER_DOWNLOAD"/></td>
							<td><s:property value="APPLY_FORM_EDIT"/></td>
							<td><s:property value="APPLY_FORM_VERIFY"/></td>
							<td><s:property value="APPLY_FORM_MERGE"/></td>
							<td valign="top">
								<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
									<tr style="height: 30px;">
										<td width="80"><s:property value="EXPERT_NAME_OFFERED"/></td>
										<td><s:property value="EXPERT_INFORMED"/></td>
										<td width="80"><s:property value="EXPERT_NAME_CONFIRMED"/></td>
									</tr>
								</table>
							</td>
							<td><s:property value="CLARIFY_DOC"/></td>
							<td><s:property value="SUPPORT_DOC"/></td>
							<td><s:property value="SUPPORT_DOC_SENT"/></td>
							<td><s:property value="BIDDER_REPLY"/></td>
							<td valign="top">
								<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
									<tr style="height: 30px;">
										<td width="80"><s:property value="OPEN_RESULT"/></td>
										<td width="80"><s:property value="OPEN_VERIFY"/></td>
										<td><s:property value="INFORM_SENT"/></td>
										<td width="80"><s:property value="INFORM_CONTRACT"/></td>
									</tr>
								</table>
							</td>
							<td valign="top">
								<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
									<tr style="height: 30px;">
										<td width="80"><s:property value="ATTACH_POST_A"/></td>
										<td><s:property value="CONTRACT_VERIFY"/></td>
										<td width="80"><s:property value="COMMENT_POST"/></td>
									</tr>
								</table>
							</td>
							<td valign="top">
								<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
									<tr style="height: 30px;">
										<td width="80"><s:property value="BID_REOPRT_EDIT"/></td>
										<td><s:property value="BID_REPORT_VERIFY"/></td>
										<td width="80"><s:property value="BID_REPORT_SENT"/></td>
									</tr>
								</table>
							</td>
							<td valign="top">
								<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
									<tr style="height: 30px;">
										<td width="100"><s:property value="RECEIPT1_AGENT_COMMISSION"/></td>
										<td width="100"><s:date name="RECEIPT1_DATE" format="yyyy/MM/dd" /></td>
										<td><s:property value="RECEIPT1_STAFF"/></td>
										<td width="120">
											<div noWrap style="width:110px;text-overflow:ellipsis;overflow:hidden">
												<s:property value="RECEIPT1_NO"/>
											</div>
										</td>
									</tr>
								</table>
							</td>
							<td valign="top">
								<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
									<tr style="height: 30px;">
										<td width="80"><s:property value="RECEIPT1_RECEIVER"/></td>
										<td width="120">
											<div noWrap style="width:110px;text-overflow:ellipsis;overflow:hidden">
												<s:property value="RECEIPT2_NO"/>
											</div>
										</td>
										<td><s:date name="RECEIPT2_DATE" format="yyyy/MM/dd" /></td>
										<td width="120">
											<div noWrap style="width:110px;text-overflow:ellipsis;overflow:hidden">
												<s:property value="RECEIPT2_POST_NO"/>
											</div>
										</td>
										<td width="100"><s:date name="RECEIPT2_EXPRESS_DATE" format="yyyy/MM/dd" /></td>
									</tr>
								</table>
							</td>
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
