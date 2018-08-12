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
<title>
<s:if test='agentAddFlag == "1"'>
委托公司一览
</s:if>
<s:elseif test='agentAddFlag == "2"'>
专业公司一览
</s:elseif>
<s:else>
承揽公司一览
</s:else>
</title>
<script type="text/javascript">
	function selAgent() {
		/* var id = getSelectedID();
		if(id == "") {
			alert("请选择一个委托公司！");
			return
		} else {
			var key = document.getElementById("strKey").value;
			window.dialogArguments.document.getElementById(key).value = id;
			window.close();
		} */

		var obj = null;
		var list = document.getElementsByName("radioKey");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				obj = list[i];
				break;
			}
		}
		if(obj == null) {
			alert("请选择一条记录！");
			return;
		}
		//将客户数据添加到父页面中
		var tr = obj.parentNode.parentNode;
		var tds = tr.getElementsByTagName("td");
		var inputs = tds[0].getElementsByTagName("input");
		var id = inputs[1].value;
		var key = document.getElementById("strKey").value;
		window.dialogArguments.document.getElementById(key).value = id;
		window.close();
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
	
	function queryList() {
		document.mainform.action = '<c:url value="/agentcomp/queryAgentCompCommonAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		document.getElementById("startIndexAgentComp").value = pageNum;
		document.mainform.action = '<c:url value="/agentcomp/turnAgentCompCommonAction.action"></c:url>';
		document.mainform.submit();
	}

	//页跳转
	function turnPage() {
		var totalPage = "${pageAgentComp.totalPage}";
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
	<s:hidden name="startIndexAgentComp" id="startIndexAgentComp"/>
	<s:hidden name="strKey" id="strKey"/>
	<s:hidden name="agentAddFlag" id="agentAddFlag"/>
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					<s:if test='agentAddFlag == "1"'>
						委托公司信息一览
					</s:if>
					<s:elseif test='agentAddFlag == "2"'>
						专业公司信息一览
					</s:elseif>
					<s:else>
						承揽公司信息一览
					</s:else>
				</div>
				<div class="tittle_right">
				</div>
			</div>
		</div>
		<div class="searchbox">
			<div class="box1">
				<!--
				<label class="pdf10">
					委托公司代码
				</label>
				<div class="box1_left"></div>
				<div class="box1_center">
					<s:textfield name="agentCompNoLow" id="agentCompNoLow" cssStyle="width:135px;" maxlength="4" theme="simple"></s:textfield>
				</div>
				<div class="box1_right"></div>
				<label>-</label>
				<div class="box1_left"></div>
				<div class="box1_center">
					<s:textfield name="agentCompNoHigh" id="agentCompNoHigh" cssStyle="width:135px;" maxlength="4" theme="simple"></s:textfield>
				</div>
				<div class="box1_right"></div>
				<label class="pdf10">委托公司名称</label>
				-->
				<label class="pdf10">
					<s:if test='agentAddFlag == "1"'>
						委托公司名称
					</s:if>
					<s:elseif test='agentAddFlag == "2"'>
						专业公司名称
					</s:elseif>
					<s:else>
						承揽公司名称
					</s:else>
				</label>
				<div class="box1_left"></div>
				<div class="box1_center">
					<s:textfield name="agentCompName" id="agentCompName" cssStyle="width:135px;" maxlength="4" theme="simple"></s:textfield>
				</div>
				<div class="box1_right"></div>
			</div>
			<div class="btn" style="margin-left: 15px;">
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
				<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
					<tr class="tittle">
						<td width="5%"></td>
						<td width="10%">
							<s:if test='agentAddFlag == "1"'>
								委托公司代码
							</s:if>
							<s:elseif test='agentAddFlag == "2"'>
								专业公司代码
							</s:elseif>
							<s:else>
								承揽公司代码
							</s:else></td>
						<td width="20%">
							<s:if test='agentAddFlag == "1"'>
								委托公司名称
							</s:if>
							<s:elseif test='agentAddFlag == "2"'>
								专业公司名称
							</s:elseif>
							<s:else>
								承揽公司名称
							</s:else></td>
						<td width="10%">联系人1</td>
						<td width="10%">联系人2</td>
						<td width="10%">联系人3</td>
						<td width="10%">联系人4</td>
						<td width="10%">联系人5</td>
						<td width="15%">备注</td>
					</tr>
					<s:iterator id="agentCompList" value="agentCompList" status="st1">
						<s:if test="#st1.odd==true">
							<tr class="tr_bg">
						</s:if>
						<s:else>
							<tr>
						</s:else>
							<td style="display: none;">
								<input type="hidden" value="<s:property value="ANGENT_COMP_NO"/>"/>
								<input type="hidden" value="<s:property value="ANGENT_COMP_NAME"/>"/>
							</td>
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
					<li>第<strong>${pageAgentComp.startIndex + 1}</strong>页/共<strong>${pageAgentComp.totalPage==0?1:pageAgentComp.totalPage}</strong>页/共<strong>${pageAgentComp.totalCount}</strong>条记录</li>
					<li class="mgl15">跳转到
						<input type="text" id="pagenum" class="text" maxlength="4" size="4"/>
						<input type="button" value="GO" onclick="javascript:turnPage();"/>
					</li>
					<li class="mgl15">
						<a class="first" href="#" onclick="changePage(0);">首页</a>
					</li>
					<li>
						<s:if test="%{pageAgentComp.startIndex <= 0}">
							<a class="last" href="#">上一页</a>
						</s:if>
						<s:else>
							<a class="next" href="#" onclick="changePage('${pageAgentComp.previousIndex}');">上一页</a>
						</s:else>
					</li>
					<li>
						<s:if test="%{pageAgentComp.nextIndex > pageAgentComp.totalPage - 1}">
							<a class="last" href="#">下一页</a>
						</s:if>
						<s:else>
							<a class="next" href="#" onclick="changePage('${pageAgentComp.nextIndex}');">下一页</a>
						</s:else>
					</li>
					<li>
						<a class="next" href="#" onclick="changePage('${pageAgentComp.totalPage - 1}');">末页</a>
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
								<input type="button" class="input80" value="确定" onclick="selAgent();"/>
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
