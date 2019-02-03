<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>合同选择一览</title>
<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/global.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
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
			window.dialogArguments.document.getElementById("agentCoMail").value = LXR_MAIL;
			var agent_info = LXR_NAME + "/ " + LXR_TEL + "/ " + LXR_ADDR + "/ " + LXR_MAIL;
			window.dialogArguments.document.getElementById("agentInfo").value = agent_info;
			
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
			window.dialogArguments.document.getElementById("contractCoMail").value = LXR_MAIL;
			var contract_info = LXR_NAME + "/ " + LXR_TEL + "/ " + LXR_ADDR + "/ " + LXR_MAIL;
			window.dialogArguments.document.getElementById("contractCoInfo").value = contract_info;
			window.dialogArguments.document.getElementById("contractCoId").value = ANGENT_COMP_NO;
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
		document.mainform.action = '<c:url value="/agentcomp/queryAgentCompAuditAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		document.getElementById("startIndex").value = pageNum;
		document.mainform.action = '<c:url value="/agentcomp/turnAgentCompAuditAction.action"></c:url>';
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12 right">
				<s:form id="mainform" name="mainform" method="POST">
					<s:hidden name="startIndex" id="startIndex"/>
					<s:hidden name="agentAddFlag" id="agentAddFlag"/>
					<div class="row">
						<div class="col-lg-12 form-group">
							<label for="" class="col-xs-2 form-label">
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
							<div class="col-xs-2">
								<s:textfield name="agentCompNoLow" id="agentCompNoLow" cssClass="form-control" maxlength="4" theme="simple"></s:textfield>
							</div>
							<div class="col-xs-2">
								<s:textfield name="agentCompNoHigh" id="agentCompNoHigh" cssClass="form-control" maxlength="4" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-xs-2 form-label">
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
							<div class="col-xs-2">
								<s:textfield name="agentCompName" id="agentCompName" cssClass="form-control" maxlength="20" theme="simple"></s:textfield>
							</div>
							<div class="col-xs-2 form-group">
								<button type="button" class="btn btn-success form-control" onclick="queryList();">检索</button>
								<input type="hidden" id="LXR_NAME" value=""/>
								<input type="hidden" id="LXR_TEL" value=""/>
								<input type="hidden" id="LXR_ADDR" value=""/>
								<input type="hidden" id="LXR_MAIL" value=""/>
							</div>
						</div>
					</div>
					<table class="table table-bordered">
						<tr>
							<th></th>
							<th>
							<s:if test='agentAddFlag == "1"'>
								委托公司代码
							</s:if>
							<s:elseif test='agentAddFlag == "2"'>
								专业公司代码
							</s:elseif>
							<s:else>
								承包公司代码
							</s:else>
							</th>
							<th>
							<s:if test='agentAddFlag == "1"'>
								委托公司名称
							</s:if>
							<s:elseif test='agentAddFlag == "2"'>
								专业公司名称
							</s:elseif>
							<s:else>
								承包公司名称
							</s:else>
							</th>
							<th>联系人</th>
						</tr>
						<s:iterator id="agentCompList" value="agentCompList" status="st1">
							<tr>
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
					<jsp:include page="../turning.jsp" flush="true" />
					<div class="operationBtns">
						<button class="btn btn-success" type="button" onclick="window.close();">取消</button>
						<button class="btn btn-success" type="button" onclick="addAgent();">确定</button>
					</div>
				</s:form>
			</div>
		</div>
	</div>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath()%>/node_modules/jquery/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath()%>/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.zh-CN.min.js"></script>
<script>
	$('.datepicker').parent().datepicker({
		"autoclose":true,"format":"yyyy-mm-dd","daysOfWeekHighlighted":"[0,6]","language":"zh-CN",clearBtn: true
	});
	
	$('.toggle i').click(function(){
		$('.left').toggle();
		$(this).toggleClass('fa-angle-double-left');
		$(this).toggleClass('fa-angle-double-right');
		$(this).parent().parent('.right').toggleClass('w100');
	});
</script>
</body>
</html>
