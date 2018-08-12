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
<title>委托公司信息一览</title>
<script type="text/javascript">
	$(document).ready(function(){
		var h = screen.availHeight; 
		$("#container").height(h - 60);
	});

	function add() {
		var url = '<c:url value="/agentcomp/showAddAgentCompAction.action"></c:url>' + "?date=" + new Date();
		//window.open(url);
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:750px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function upd() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			var url = '<c:url value="/agentcomp/showUpdAgentCompAction.action"></c:url>'
					+ "?updateAgentCompNo=" + id
					+ "&date=" + new Date();
			window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:750px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
		}
	}
	
	function del() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			if(confirm("确定删除该记录吗？")) {
				document.mainform.action = '<c:url value="/agentcomp/delAgentCompAction.action"></c:url>' + "?delAgentCompNo=" + id;
				document.mainform.submit();
			}
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
	
	function exportExcel() {
		document.mainform.action = '<c:url value="/agentcomp/exportAgentCompAction.action"></c:url>';
		document.mainform.submit();
	}

	function goHome() {
		document.mainform.action = '<c:url value="/home/goHomeAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryList() {
		document.mainform.action = '<c:url value="/agentcomp/queryAgentCompList.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		document.getElementById("startIndex").value = pageNum;
		document.mainform.action = '<c:url value="/agentcomp/turnAgentCompPage.action"></c:url>';
		document.mainform.submit();
	}

	//页跳转
	function turnPage() {
		var totalPage = "${page.totalPage}";
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
					委托公司信息一览
				</div>
				<div class="tittle_right">
				</div>
			</div>
			<s:form id="mainform" name="mainform" method="POST">
				<s:hidden name="startIndex" id="startIndex"/>
				<div class="searchbox update">
					<div class="box1">
					<!-- 
						<label class="pdf10">委托公司代码</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strAgentCompNoLow" id="strAgentCompNoLow" cssStyle="width:135px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
						<label>-</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strAgentCompNoHigh" id="strAgentCompNoHigh" cssStyle="width:135px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					 -->
						<label class="pdf10">委托公司名称</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strAgentCompName" id="strAgentCompName" cssStyle="width:135px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
						<div style="float:left; height:31px; margin-top:7px; position:relative;">
						<s:if test='%{radioCom == "1"}'>
							<input name="radioCom" type="radio" value="1" checked="checked"/>委托公司
							<input name="radioCom" type="radio" value="3"/>承揽公司
						</s:if>
						<s:elseif test='%{radioCom == "3"}'>
							<input name="radioCom" type="radio" value="1"/>委托公司
							<input name="radioCom" type="radio" value="3" checked="checked"/>承揽公司
						</s:elseif>
						<s:else>
							<input name="radioCom" type="radio" value="1"/>委托公司
							<input name="radioCom" type="radio" value="3"/>承揽公司
						</s:else>
						</div>
					</div>
					<div class="btn" style="margin-left: 360px;">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="button" class="input40" value="检索" onclick="queryList();"/>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="box1" style="margin-top:-3px; margin-left: -330px; color: red;">
						<s:actionmessage />
					</div>
					<div class="icons thums">
						<a class="add" onclick="add();">增加</a>
						<a class="edit" onclick="upd();">修改</a>
						<a class="delete" onclick="del();">删除</a>
					</div>
				</div>
				<div class="data_table" style="padding:0px;">
					<div class="tab_tittle">
						<table width="100%" border="1" cellpadding="5" cellspacing="0">
						</table>
					</div>
					<div class="tab_content">
						<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
							<tr class="tittle">
								<td width="3%"></td>
								<td width="8%">委托公司代码</td>
								<td width="15%">委托公司名称</td>
								<td width="8%">联系人1</td>
								<td width="8%">联系人2</td>
								<td width="8%">联系人3</td>
								<td width="8%">联系人4</td>
								<td width="8%">联系人5</td>
								<td width="10%">纳税人识别号</td>
								<td width="8%">开户行</td>
								<td width="10%">账号</td>
								<td width="8%">备注</td>
							</tr>
							<s:iterator id="listAgentComp" value="listAgentComp" status="st1">
								<s:if test="#st1.odd==true">
									<tr class="tr_bg">
								</s:if>
								<s:else>
									<tr>
								</s:else>
									<td><input name="radioKey" type="radio" value="<s:property value="ANGENT_COMP_NO"/>"/></td>
									<td><s:property value="ANGENT_COMP_NO"/></td>
									<td>
										<div noWrap style="width:180px;text-overflow:ellipsis;overflow:hidden">
											<s:property value="ANGENT_COMP_NAME"/>
										</div>
									</td>
									<td><s:property value="CO_MANAGER1"/></td>
									<td><s:property value="CO_MANAGER2"/></td>
									<td><s:property value="CO_MANAGER3"/></td>
									<td><s:property value="CO_MANAGER4"/></td>
									<td><s:property value="CO_MANAGER5"/></td>
									<td><s:property value="RESERVE1"/></td>
									<td><s:property value="RESERVE2"/></td>
									<td><s:property value="RESERVE3"/></td>
									<td>
										<div noWrap style="width:150px;text-overflow:ellipsis;overflow:hidden">
											<s:property value="MEMO1"/>
										</div>
									</td>
								</tr>
							</s:iterator>
						</table>
					</div>
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
