<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base target="_self"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<title>招标履历一览</title>
<script type="text/javascript">
	function getSelectedID() {
		var obj = null;
		var list = document.getElementsByName("radioKey");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				obj = list[i];
				break;
			}
		}
		return obj;
	}
	
	function queryList() {
		document.mainform.action = '<c:url value="/bid/queryBidHisAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		document.getElementById("startIndexHist").value = pageNum;
		document.mainform.action = '<c:url value="/bid/turnBidHisAction.action"></c:url>';
		document.mainform.submit();
	}

	//页跳转
	function turnPage() {
		var totalPage = "${pageHist.totalPage}";
		var turnPage = document.getElementById("pagenum").value;
		//判断是否输入页码
		if ('' != turnPage) {
			//判断页码是否是大于0的数字
			if(!iscInteger(turnPage)){
				alert("页码必须是大于0的整数！");
				return;
			}
			turnPage = parseInt(turnPage);
			if(turnPage < 1){
				alert("页码必须是大于0的整数！");
				return;
			}
			//判断页码大小是否正确
			if(turnPage > parseInt(totalPage)){
				alert("页码不能超过最大页数！");
				return;
			}
			//换页
			changePage(turnPage - 1);
		} else {
			alert("页码不能为空！");
			return;
		}	
	}
</script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:hidden;">
<s:form id="mainform" name="mainform" method="POST">
	<s:hidden name="startIndexHist" id="startIndexHist"/>
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
				<table class="info_tab" width="100%" border="1" cellpadding="0" cellspacing="0" style="border-top:black solid 0px; border-bottom: 0px;">
					<tr class="tittle">
						<td width="40">序号</td>
						<td width="100">招标编号</td>
						<td width="90">项目名称</td>
						<td width="150">委托单位</td>
						<td width="150">报名日期/<br />发标日期</td>
						<td width="150">开标日期/<br />评标日期</td>
						<td width="80">投标单位</td>
						<td width="80">投标保证金</td>
						<td width="80">支付形式</td>
					</tr>
					<s:if test="%{listBidHist != null && listBidHist.size() > 0}">
						<tr>
							<td valign="top">
								<table class="info_tab" width="100%" border="0" cellpadding="5" cellspacing="0">
									<s:iterator id="listBidHist" value="listBidHist" status="st1">
										<s:if test="#st1.odd==true">
											<s:if test="%{#st1.index + 1 == listBidHist.size()}">
												<tr class="tr_bg">
											</s:if>
											<s:else>
												<tr class="tr_bg" style="border-bottom:black solid 1px;">
											</s:else>
										</s:if>
										<s:else>
											<s:if test="%{#st1.index + 1 == listBidHist.size()}">
												<tr>
											</s:if>
											<s:else>
												<tr style="border-bottom:black solid 1px;">
											</s:else>
										</s:else>
											<td height="20"><input name="radioKey" type="radio" value="<s:property value="BID_HIS_SEQ"/>"/></td>
										</tr>
									</s:iterator>
								</table>
							</td>
							<td>
								<s:property value="listBidHist[0].BID_NO"/>
							</td>
							<td>
								<s:property value="listBidHist[0].PROJECT_NAME"/>
							</td>
							<td>
								<s:property value="listBidHist[0].AGENT_CO_NAME"/>
							</td>
							<td>
								<s:date name="listBidHist[0].TENDER_OPEN_DATE" format="yyyy-MM-dd" />/<br />
								<s:date name="listBidHist[0].TENDER_OPEN_DATE" format="yyyy-MM-dd" />
							</td>
							<td>
								<s:date name="listBidHist[0].TENDER_OPEN_DATE" format="yyyy-MM-dd" />/<br />
								<s:date name="listBidHist[0].TENDER_OPEN_DATE" format="yyyy-MM-dd" />
							</td>
							<td>
								<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
									<s:iterator id="listBidHist" value="listBidHist" status="st1">
										<s:if test="#st1.odd==true">
											<s:if test="%{#st1.index + 1 == listBidHist.size()}">
												<tr class="tr_bg">
											</s:if>
											<s:else>
												<tr class="tr_bg" style="border-bottom:black solid 1px;">
											</s:else>
										</s:if>
										<s:else>
											<s:if test="%{#st1.index + 1 == listBidHist.size()}">
												<tr>
											</s:if>
											<s:else>
												<tr style="border-bottom:black solid 1px;">
											</s:else>
										</s:else>
											<td height="20"><s:property value="BID_CO_NAME"/></td>
										</tr>
									</s:iterator>
								</table>
							</td>
							<td>
								<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
									<s:iterator id="listBidHist" value="listBidHist" status="st1">
										<s:if test="#st1.odd==true">
											<s:if test="%{#st1.index + 1 == listBidHist.size()}">
												<tr class="tr_bg">
											</s:if>
											<s:else>
												<tr class="tr_bg" style="border-bottom:black solid 1px;">
											</s:else>
										</s:if>
										<s:else>
											<s:if test="%{#st1.index + 1 == listBidHist.size()}">
												<tr>
											</s:if>
											<s:else>
												<tr style="border-bottom:black solid 1px;">
											</s:else>
										</s:else>
											<td height="20"><s:property value="BID_PRICE"/></td>
										</tr>
									</s:iterator>
								</table>
							</td>
							<td>
								<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
									<s:iterator id="listBidHist" value="listBidHist" status="st1">
										<s:if test="#st1.odd==true">
											<s:if test="%{#st1.index + 1 == listBidHist.size()}">
												<tr class="tr_bg">
											</s:if>
											<s:else>
												<tr class="tr_bg" style="border-bottom:black solid 1px;">
											</s:else>
										</s:if>
										<s:else>
											<s:if test="%{#st1.index + 1 == listBidHist.size()}">
												<tr>
											</s:if>
											<s:else>
												<tr style="border-bottom:black solid 1px;">
											</s:else>
										</s:else>
											<td height="20"><s:property value="BID_PRICE"/></td>
										</tr>
									</s:iterator>
								</table>
							</td>
						</tr>
					</s:if>
				</table>
			</div>
			<div class="pages">
				<ul>
					<li>第<strong>${pageHist.startIndex + 1}</strong>页/共<strong>${pageHist.totalPage==0?1:pageHist.totalPage}</strong>页/共<strong>${pageHist.totalCount}</strong>条记录</li>
					<li class="mgl15">跳转到
						<input type="text" id="pagenum" class="text" maxlength="4" size="4"/>
						<input type="button" value="GO" onclick="javascript:turnPage();"/>
					</li>
					<li class="mgl15">
						<a class="first" href="#" onclick="changePage(0);">首页</a>
					</li>
					<li>
						<s:if test="%{pageHist.startIndex <= 0}">
							<a class="last" href="#">上一页</a>
						</s:if>
						<s:else>
							<a class="next" href="#" onclick="changePage('${pageHist.previousIndex}');">上一页</a>
						</s:else>
					</li>
					<li>
						<s:if test="%{pageHist.nextIndex > pageHist.totalPage - 1}">
							<a class="last" href="#">下一页</a>
						</s:if>
						<s:else>
							<a class="next" href="#" onclick="changePage('${pageHist.nextIndex}');">下一页</a>
						</s:else>
					</li>
					<li>
						<a class="next" href="#" onclick="changePage('${pageHist.totalPage - 1}');">末页</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="btns" style="margin-top:40px; margin-left: 0px;">
			<table border="0" style="margin:0 auto;">
				<tr>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input type="button" class="input80" value="详细" onclick=""/>
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
