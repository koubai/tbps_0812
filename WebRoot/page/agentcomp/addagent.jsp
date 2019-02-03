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
<title>委托公司信息输入</title>
<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/global.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/local.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
	function add() {
		//初期化邮箱
		for(var i = 1; i <= 5; i++) {
			//邮箱
			var mail_pr = $("#" + "mail_pr" + i).val();
			var mail_suffix = $("#" + "mail_suffix" + i).val();
			if(mail_pr != "" || mail_suffix != "") {
				$("#" + "CO_MAIL" + i).attr("value", mail_pr + "@" + mail_suffix);
			} else {
				$("#" + "CO_MAIL" + i).attr("value", "");
			}
		}
	
		var ANGENT_COMP_NO = $("#ANGENT_COMP_NO").val().trim();
		var ANGENT_COMP_NAME = $("#ANGENT_COMP_NAME").val().trim();
		var tmpMEMO1 = $("#tmpMEMO1").val();
		$("#MEMO1").attr("value", tmpMEMO1);
		if(ANGENT_COMP_NO == "") {
			alert("委托公司代码不能为空！");
			$("#ANGENT_COMP_NO").focus();
			return;
		}
		//委托公司必须以J或者Y打头
		if(ANGENT_COMP_NO.substring(0, 1).toUpperCase() != "J" && ANGENT_COMP_NO.substring(0, 1).toUpperCase() != "Y") {
			alert("委托公司代码必须以J或者Y打头！");
			$("#ANGENT_COMP_NO").focus();
			return;
		}
		if(ANGENT_COMP_NAME == "") {
			alert("委托公司名称不能为空！");
			$("#ANGENT_COMP_NO").focus();
			return;
		}
		
		var CO_MANAGER1 = $("#CO_MANAGER1").val();
		if(CO_MANAGER1.trim() == "") {
			alert("联系人1不能为空！");
			$("#CO_MANAGER1").focus();
			return;
		}
		//联系人信息check
		var all = "";
		for(var i = 1; i <= 5; i++) {
			var CO_MANAGER = $("#" + "CO_MANAGER" + i).val();
			var CO_MANAGER_TEL = $("#" + "CO_MANAGER_TEL" + i).val();
			var CO_ADDRESS = $("#" + "CO_ADDRESS" + i).val();
			var CO_MAIL = $("#" + "CO_MAIL" + i).val();
			all += CO_MANAGER;
			if(CO_MANAGER.trim() != "") {
				if(CO_MANAGER.length > 6) {
					alert("联系人" + i + "姓名不能超过6个字！");
					$("#" + "CO_MANAGER" + i).focus();
					return;
				}
				if(CO_MANAGER_TEL.trim() == "") {
					alert("联系人" + i + "电话不能为空！");
					$("#" + "CO_MANAGER_TEL" + i).focus();
					return;
				}
				//邮箱
// 2016.06.19 as user requirement, contacter's mail and adress change to not mandatory.				
/*				if(CO_MAIL.trim() == "") {
					alert("联系人" + i + "邮箱不能为空！");
					$("#" + "mail_pr" + i).focus();
					return;
				}
				if(CO_ADDRESS.trim() == "") {
					alert("联系人" + i + "地址不能为空！");
					$("#" + "CO_ADDRESS" + i).focus();
					return;
				}
*/			
			}
			if(CO_MAIL != "" && !isMail(CO_MAIL)) {
				alert("联系人" + i + "邮箱格式不正确！");
				$("#" + "mail_pr" + i).focus();
				return;
			}
		}
		if(all == "") {
			alert("联系人不能为空！");
			$("#CO_MANAGER1").focus();
			return;
		}
		if(tmpMEMO1.length > 100) {
			alert("备注不能超过100个字！");
			$("#tmpMEMO1").focus();
			return;
		}
		if(tmpMEMO1.length > 100) {
			alert("备注不能超过100个字！");
			$("#tmpMEMO1").focus();
			return;
		}
		document.mainform.action = '<c:url value="/agentcomp/addAgentCompAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function goAgentList() {
		document.mainform.action = '<c:url value="/agentcomp/queryAgentCompList.action"></c:url>';
		document.mainform.submit();
	}
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<s:form id="mainform" name="mainform" method="POST" theme="simple">
			<s:hidden name="addAgentCompDto.MEMO1" id="MEMO1"></s:hidden>
			<s:hidden name="addAgentCompDto.CO_MAIL1" id="CO_MAIL1"></s:hidden>
			<s:hidden name="addAgentCompDto.CO_MAIL2" id="CO_MAIL2"></s:hidden>
			<s:hidden name="addAgentCompDto.CO_MAIL3" id="CO_MAIL3"></s:hidden>
			<s:hidden name="addAgentCompDto.CO_MAIL4" id="CO_MAIL4"></s:hidden>
			<s:hidden name="addAgentCompDto.CO_MAIL5" id="CO_MAIL5"></s:hidden>
			<div class="row">
				<div class="container-fluid">
					<s:if test="hasActionMessages()">
						<div class="row">
							<span style="color:red; text-align:center;"><s:actionmessage /></span>
						</div>
					</s:if>
					<div class="row">
						<div class="col-lg-12">
							<div class="box">
								<h5>委托公司信息输入</h5>
								<div class="row">
									<label class="col-lg-2 form-label">委托公司代码</label>
									<div class="col-lg-8">
										<s:textfield name="addAgentCompDto.ANGENT_COMP_NO" id="ANGENT_COMP_NO" cssClass="form-control" maxlength="4" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">委托公司名称</label>
									<div class="col-lg-8">
										<s:textfield name="addAgentCompDto.ANGENT_COMP_NAME" id="ANGENT_COMP_NAME" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">纳税人识别号</label>
									<div class="col-lg-8">
										<s:textfield name="addAgentCompDto.RESERVE1" id="RESERVE1" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">开户行</label>
									<div class="col-lg-8">
										<s:textfield name="addAgentCompDto.RESERVE2" id="RESERVE2" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">开户行账号</label>
									<div class="col-lg-8">
										<s:textfield name="addAgentCompDto.RESERVE3" id="RESERVE3" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<table class="trade_tab" align="center" width="70%" border="0">
										<tr>
											<td align="left" width="25%"><strong>联系人1</strong></td>
											<td><font color="red">*</font>联系人1姓名</td>
											<td>
												<div class="col-lg-11 form-group">
													<s:textfield name="addAgentCompDto.CO_MANAGER1" id="CO_MANAGER1" cssClass="form-control" maxlength="24" theme="simple"></s:textfield>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><font color="red">*</font>联系人1电话</td>
											<td>
												<div class="col-lg-11 form-group">
													<s:textfield name="addAgentCompDto.CO_MANAGER_TEL1" id="CO_MANAGER_TEL1" cssClass="form-control" maxlength="30" theme="simple"></s:textfield>
												</div>
											 </td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><font color="red">&nbsp</font>联系人1邮箱</td>
											<td>
												<div class="col-lg-11 form-group">
													<div class="col-lg-5">
														<s:textfield name="addAgentCompDto.mail_pr1" id="mail_pr1" cssClass="form-control" maxlength="29" theme="simple"></s:textfield>
													</div>
													<label for="" class="col-lg-1 form-label to">@</label>
													<div class="col-lg-5">
														<s:textfield name="addAgentCompDto.mail_suffix1" id="mail_suffix1" cssClass="form-control" maxlength="30" theme="simple"></s:textfield>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><font color="red">&nbsp</font>联系人1地址</td>
											<td>
												<div class="col-lg-11 form-group">
													<s:textfield name="addAgentCompDto.CO_ADDRESS1" id="CO_ADDRESS1" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="row">
									<table class="trade_tab" align="center" width="70%" border="0">
										<tr>
											<td align="left" width="25%"><strong>联系人2</strong></td>
											<td><font color="red">&nbsp</font>联系人2姓名</td>
											<td>
												<div class="col-lg-11 form-group">
													<s:textfield name="addAgentCompDto.CO_MANAGER2" id="CO_MANAGER2" cssClass="form-control" maxlength="24" theme="simple"></s:textfield>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><font color="red">&nbsp</font>联系人2电话</td>
											<td>
												<div class="col-lg-11 form-group">
													<s:textfield name="addAgentCompDto.CO_MANAGER_TEL2" id="CO_MANAGER_TEL2" cssClass="form-control" maxlength="30" theme="simple"></s:textfield>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><font color="red">&nbsp</font>联系人2邮箱</td>
											<td>
												<div class="col-lg-11 form-group">
													<div class="col-lg-5">
														<s:textfield name="addAgentCompDto.mail_pr2" id="mail_pr2" cssClass="form-control" maxlength="29" theme="simple"></s:textfield>
													</div>
													<label for="" class="col-lg-1 form-label to">@</label>
													<div class="col-lg-5">
														<s:textfield name="addAgentCompDto.mail_suffix2" id="mail_suffix2" cssClass="form-control" maxlength="30" theme="simple"></s:textfield>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><font color="red">&nbsp</font>联系人2地址</td>
											<td>
												<div class="col-lg-11 form-group">
													<s:textfield name="addAgentCompDto.CO_ADDRESS2" id="CO_ADDRESS2" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="row">
									<table class="trade_tab" align="center" width="70%" border="0">
										<tr>
											<td align="left" width="25%"><strong>联系人3</strong></td>
											<td><font color="red">&nbsp</font>联系人3姓名</td>
											<td>
												<div class="col-lg-11 form-group">
													<s:textfield name="addAgentCompDto.CO_MANAGER3" id="CO_MANAGER3" cssClass="form-control" maxlength="24" theme="simple"></s:textfield>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><font color="red">&nbsp</font>联系人3电话</td>
											<td>
												<div class="col-lg-11 form-group">
													<s:textfield name="addAgentCompDto.CO_MANAGER_TEL3" id="CO_MANAGER_TEL3" cssClass="form-control" maxlength="30" theme="simple"></s:textfield>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><font color="red">&nbsp</font>联系人3邮箱</td>
											<td>
												<div class="col-lg-11 form-group">
													<div class="col-lg-5">
														<s:textfield name="addAgentCompDto.mail_pr3" id="mail_pr3" cssClass="form-control" maxlength="29" theme="simple"></s:textfield>
													</div>
													<label for="" class="col-lg-1 form-label to">@</label>
													<div class="col-lg-5">
														<s:textfield name="addAgentCompDto.mail_suffix3" id="mail_suffix3" cssClass="form-control" maxlength="30" theme="simple"></s:textfield>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><font color="red">&nbsp</font>联系人3地址</td>
											<td>
												<div class="col-lg-11 form-group">
													<s:textfield name="addAgentCompDto.CO_ADDRESS3" id="CO_ADDRESS3" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="row">
									<table class="trade_tab" align="center" width="70%" border="0">
										<tr>
											<td align="left" width="25%"><strong>联系人4</strong></td>
											<td><font color="red">&nbsp</font>联系人4姓名</td>
											<td>
												<div class="col-lg-11 form-group">
													<s:textfield name="addAgentCompDto.CO_MANAGER4" id="CO_MANAGER4" cssClass="form-control" maxlength="24" theme="simple"></s:textfield>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><font color="red">&nbsp</font>联系人4电话</td>
											<td>
												<div class="col-lg-11 form-group">
													<s:textfield name="addAgentCompDto.CO_MANAGER_TEL4" id="CO_MANAGER_TEL4" cssClass="form-control" maxlength="30" theme="simple"></s:textfield>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><font color="red">&nbsp</font>联系人4邮箱</td>
											<td>
												<div class="col-lg-11 form-group">
													<div class="col-lg-5">
														<s:textfield name="addAgentCompDto.mail_pr4" id="mail_pr4" cssClass="form-control" maxlength="29" theme="simple"></s:textfield>
													</div>
													<label for="" class="col-lg-1 form-label to">@</label>
													<div class="col-lg-5">
														<s:textfield name="addAgentCompDto.mail_suffix4" id="mail_suffix4" cssClass="form-control" maxlength="30" theme="simple"></s:textfield>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><font color="red">&nbsp</font>联系人4地址</td>
											<td>
												<div class="col-lg-11 form-group">
													<s:textfield name="addAgentCompDto.CO_ADDRESS4" id="CO_ADDRESS4" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="row">
									<table class="trade_tab" align="center" width="70%" border="0">
										<tr>
											<td align="left" width="25%"><strong>联系人5</strong></td>
											<td><font color="red">&nbsp</font>联系人5姓名</td>
											<td>
												<div class="col-lg-11 form-group">
													<s:textfield name="addAgentCompDto.CO_MANAGER5" id="CO_MANAGER5" cssClass="form-control" maxlength="24" theme="simple"></s:textfield>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><font color="red">&nbsp</font>联系人5电话</td>
											<td>
												<div class="col-lg-11 form-group">
													<s:textfield name="addAgentCompDto.CO_MANAGER_TEL5" id="CO_MANAGER_TEL5" cssClass="form-control" maxlength="30" theme="simple"></s:textfield>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><font color="red">&nbsp</font>联系人5邮箱</td>
											<td>
												<div class="col-lg-11 form-group">
													<div class="col-lg-5">
														<s:textfield name="addAgentCompDto.mail_pr5" id="mail_pr5" cssClass="form-control" maxlength="29" theme="simple"></s:textfield>
													</div>
													<label for="" class="col-lg-1 form-label to">@</label>
													<div class="col-lg-5">
														<s:textfield name="addAgentCompDto.mail_suffix5" id="mail_suffix5" cssClass="form-control" maxlength="30" theme="simple"></s:textfield>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><font color="red">&nbsp</font>联系人5地址</td>
											<td>
												<div class="col-lg-11 form-group">
													<s:textfield name="addAgentCompDto.CO_ADDRESS5" id="CO_ADDRESS5" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">备注</label>
									<div class="col-lg-8 form-group">
										<textarea name="" id="tmpMEMO1" cols="" rows="5" class="form-control"><s:property value="addAgentCompDto.MEMO1"/></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="operationBtns addBtns mgt15 btn3">
						<button type="button" class="btn btn-success" onclick="add();">追加</button>
						<button type="button" class="btn btn-success" onclick="goAgentList();">返回</button>
					</div>
				</div>
			</div>
		</s:form>
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
</script>
</body>
</html>
