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
承包公司一览
</s:else>
</title>
<script type="text/javascript">
	$(function() {
	});
	
	function selectManage(obj) {
		if(obj.checked) {
			var list = obj.value.split("※");
			var name = list[0];
			var tel = list[1];
			var addr = list[2];
			var mail = list[3];
			document.getElementById("LXR_NAME").value = name;
			document.getElementById("LXR_TEL").value = tel;
			document.getElementById("LXR_ADDR").value = addr;
			document.getElementById("LXR_MAIL").value = mail;
		} else {
			document.getElementById("LXR_NAME").value = "";
			document.getElementById("LXR_TEL").value = "";
			document.getElementById("LXR_ADDR").value = "";
			document.getElementById("LXR_MAIL").value = "";
		}
	}
	
	function selectAgent(obj, index) {
		document.getElementById("LXR_NAME").value = "";
		document.getElementById("LXR_TEL").value = "";
		document.getElementById("LXR_ADDR").value = "";
		document.getElementById("LXR_MAIL").value = "";
		for(var n = 0; n < 10; n++) {
			var radio = document.getElementsByName("manage_" + n);
			for(var i = 0; i < radio.length; i++) {
				radio[i].checked = false;
				radio[i].disabled = true;
			}
		}
		if(obj.checked) {
			var radio = document.getElementsByName("manage_" + index);
			for(var i = 0; i < radio.length; i++) {
				radio[i].disabled = false;
			}
		}
	}
	
	//选择委托公司
	function addAgent() {
		var obj = null;
		var list = document.getElementsByName("radioKey");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				obj = list[i];
				break;
			}
		}
		if(obj == null) {
			alert("请选择一个公司！");
			return;
		}
		
		var LXR_NAME = document.getElementById("LXR_NAME").value;
		var LXR_TEL = document.getElementById("LXR_TEL").value;
		var LXR_ADDR = document.getElementById("LXR_ADDR").value;
		var LXR_MAIL = document.getElementById("LXR_MAIL").value;
		if(LXR_NAME == "") {
			alert("请选择一个联系人！");
			return;
		}
			
		var tr = obj.parentNode.parentNode;
		var tds = tr.getElementsByTagName("td");
		var inputs = tds[0].getElementsByTagName("input");
		
		var ANGENT_COMP_NO = inputs[0].value;
		var ANGENT_COMP_NAME = inputs[1].value;
		
		var agentAddFlag = $("#agentAddFlag").val();
		
		if(agentAddFlag == "1") {
			//委托公司
			window.dialogArguments.document.getElementById("agentNo").value = ANGENT_COMP_NO;
			window.dialogArguments.document.getElementById("agentCoName").value = ANGENT_COMP_NAME;
			window.dialogArguments.document.getElementById("agentCoManager").value = LXR_NAME;
			window.dialogArguments.document.getElementById("agentCoManagerTel").value = LXR_TEL;
			window.dialogArguments.document.getElementById("agentCoPostAddress").value = LXR_ADDR;
			//window.dialogArguments.document.getElementById("agentCoMail").value = LXR_MAIL;
			window.dialogArguments.document.getElementById("AGENT_CO_MAIL").value = LXR_MAIL;
			if(LXR_MAIL != "") {
				var mail_pr = LXR_MAIL.substring(0, LXR_MAIL.indexOf("@"));
				var mail_suffix = LXR_MAIL.substring(LXR_MAIL.indexOf("@") + 1, LXR_MAIL.length);
				window.dialogArguments.document.getElementById("agent_mail_pr").value = mail_pr;
				window.dialogArguments.document.getElementById("agent_mail_suffix").value = mail_suffix;
			} else {
				window.dialogArguments.document.getElementById("agent_mail_pr").value = "";
				window.dialogArguments.document.getElementById("agent_mail_suffix").value = "";
			}
			//window.dialogArguments.document.getElementById("AGENT_NO").value = ANGENT_COMP_NO;
			//window.dialogArguments.document.getElementById("AGENT_CO_NAME").value = ANGENT_COMP_NAME;
			//window.dialogArguments.document.getElementById("AGENT_CO_MANAGER").value = LXR_NAME;
			//window.dialogArguments.document.getElementById("AGENT_CO_MANAGER_TEL").value = LXR_TEL;
			//window.dialogArguments.document.getElementById("AGENT_CO_POST_ADDRESS").value = LXR_ADDR;
			//window.dialogArguments.document.getElementById("AGENT_CO_MAIL").value = LXR_MAIL;
		} else if(agentAddFlag == "2") {
			//专业公司
			window.dialogArguments.document.getElementById("profNo").value = ANGENT_COMP_NO;
			window.dialogArguments.document.getElementById("profCoName").value = ANGENT_COMP_NAME;
			window.dialogArguments.document.getElementById("profCoManager").value = LXR_NAME;
			window.dialogArguments.document.getElementById("profCoManagerTel").value = LXR_TEL;
			window.dialogArguments.document.getElementById("profCoPostAddress").value = LXR_ADDR;
			//window.dialogArguments.document.getElementById("profCoMail").value = LXR_MAIL;
			window.dialogArguments.document.getElementById("PROF_CO_MAIL").value = LXR_MAIL;
			if(LXR_MAIL != "") {
				var mail_pr = LXR_MAIL.substring(0, LXR_MAIL.indexOf("@"));
				var mail_suffix = LXR_MAIL.substring(LXR_MAIL.indexOf("@") + 1, LXR_MAIL.length);
				window.dialogArguments.document.getElementById("prof_mail_pr").value = mail_pr;
				window.dialogArguments.document.getElementById("prof_mail_suffix").value = mail_suffix;
			} else {
				window.dialogArguments.document.getElementById("prof_mail_pr").value = "";
				window.dialogArguments.document.getElementById("prof_mail_suffix").value = "";
			}
			//window.dialogArguments.document.getElementById("PROF_NO").value = ANGENT_COMP_NO;
			//window.dialogArguments.document.getElementById("PROF_CO_NAME").value = ANGENT_COMP_NAME;
			//window.dialogArguments.document.getElementById("PROF_CO_MANAGER").value = LXR_NAME;
			//window.dialogArguments.document.getElementById("PROF_CO_MANAGER_TEL").value = LXR_TEL;
			//window.dialogArguments.document.getElementById("PROF_CO_POST_ADDRESS").value = LXR_ADDR;
			//window.dialogArguments.document.getElementById("PROF_CO_MAIL").value = LXR_MAIL;
		} else if (agentAddFlag == "11") {
			//合同公司甲方
			window.dialogArguments.document.getElementById("AUDIT_COMP_CLIENTID").value = ANGENT_COMP_NO;
			window.dialogArguments.document.getElementById("AUDIT_COMP_CLIENT").value = ANGENT_COMP_NAME;
		} else {
			//承包公司
			window.dialogArguments.document.getElementById("contractCoNo").value = ANGENT_COMP_NO;
			window.dialogArguments.document.getElementById("contractCoName").value = ANGENT_COMP_NAME;
			window.dialogArguments.document.getElementById("contractCoManager").value = LXR_NAME;
			window.dialogArguments.document.getElementById("contractCoManagerTel").value = LXR_TEL;
			window.dialogArguments.document.getElementById("contractCoPostAddress").value = LXR_ADDR;
			//window.dialogArguments.document.getElementById("contractCoMail").value = LXR_MAIL;
		}
		
		window.close();
	}
	
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
		document.mainform.action = '<c:url value="/bid/queryAddBidAgentCompAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		document.getElementById("startIndexAgentComp").value = pageNum;
		document.mainform.action = '<c:url value="/bid/turnAddBidAgentCompAction.action"></c:url>';
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
						承包公司信息一览
					</s:else>
				</div>
				<div class="tittle_right">
				</div>
			</div>
		</div>
		<div class="searchbox">
			<div class="box1">
				<label class="pdf10">
					<s:if test='agentAddFlag == "1"'>
						委托公司代码
					</s:if>
					<s:elseif test='agentAddFlag == "2"'>
						专业公司代码
					</s:elseif>
					<s:else>
						承包公司代码
					</s:else>
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
			</div>
			<div class="box1">
				<label class="pdf10">
					<s:if test='agentAddFlag == "1"'>
						委托公司名称
					</s:if>
					<s:elseif test='agentAddFlag == "2"'>
						专业公司名称
					</s:elseif>
					<s:else>
						承包公司名称
					</s:else>
				</label>
				<div class="box1_left"></div>
				<div class="box1_center">
					<s:textfield name="agentCompName" id="agentCompName" cssStyle="width:135px;" maxlength="20" theme="simple"></s:textfield>
				</div>
				<div class="box1_right"></div>
			</div>
			<div class="btn" style="margin-left: 0px;">
				<div class="box1_left"></div>
				<div class="box1_center">
					<input type="button" class="input40" value="检索" onclick="queryList();"/>
					<input type="hidden" id="LXR_NAME" value=""/>
					<input type="hidden" id="LXR_TEL" value=""/>
					<input type="hidden" id="LXR_ADDR" value=""/>
					<input type="hidden" id="LXR_MAIL" value=""/>
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
						<td style="display: none;"></td>
						<td width="50"></td>
						<td width="90">
							<s:if test='agentAddFlag == "1"'>
								委托公司代码
							</s:if>
							<s:elseif test='agentAddFlag == "2"'>
								专业公司代码
							</s:elseif>
							<s:else>
								承包公司代码
							</s:else>
						</td>
						<td width="160">
							<s:if test='agentAddFlag == "1"'>
								委托公司名称
							</s:if>
							<s:elseif test='agentAddFlag == "2"'>
								专业公司名称
							</s:elseif>
							<s:else>
								承包公司名称
							</s:else>
						</td>
						<td width="400">联系人</td>
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
							<td><input name="radioKey" type="radio" onclick="selectAgent(this, '<s:property value="#st1.index + 1"/>');" value="<s:property value="ANGENT_COMP_NO"/>"/></td>
							<td><s:property value="ANGENT_COMP_NO"/></td>
							<td><s:property value="ANGENT_COMP_NAME"/></td>
							<td>
								<s:iterator id="listManage" value="listManage" status="st2">
									<input name="manage_<s:property value="#st1.index + 1"/>" onclick="selectManage(this)" value="<s:property value="value"/>" disabled="disabled" type="radio"/><s:property value="key"/>　
								</s:iterator>
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
								<input type="button" class="input80" value="确定" onclick="addAgent();"/>
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
