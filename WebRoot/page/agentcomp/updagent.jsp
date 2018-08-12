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
<title>委托公司信息修改</title>
<script type="text/javascript">
	function upd() {
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
		var ANGENT_COMP_NAME = $("#ANGENT_COMP_NAME").val().trim();
		var tmpMEMO1 = $("#tmpMEMO1").val();
		$("#MEMO1").attr("value", tmpMEMO1);
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
			var CO_MAIL = $("#" + "CO_MAIL" + i).val();
			var CO_ADDRESS = $("#" + "CO_ADDRESS" + i).val();
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
		document.mainform.action = '<c:url value="/agentcomp/updAgentCompAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//页面关闭响应
	window.onunload = function() {
		//刷新父页面
		window.dialogArguments.document.mainform.action = '<c:url value="/agentcomp/queryAgentCompList.action"></c:url>';
		window.dialogArguments.document.mainform.submit();
	};

</script>
<base target="_self"/>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:scroll;">
<s:form id="mainform" name="mainform" method="POST">
	<s:hidden name="updateAgentCompDto.MEMO1" id="MEMO1"></s:hidden>
	<s:hidden name="updateAgentCompDto.CO_MAIL1" id="CO_MAIL1"></s:hidden>
	<s:hidden name="updateAgentCompDto.CO_MAIL2" id="CO_MAIL2"></s:hidden>
	<s:hidden name="updateAgentCompDto.CO_MAIL3" id="CO_MAIL3"></s:hidden>
	<s:hidden name="updateAgentCompDto.CO_MAIL4" id="CO_MAIL4"></s:hidden>
	<s:hidden name="updateAgentCompDto.CO_MAIL5" id="CO_MAIL5"></s:hidden>
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					委托公司信息修改
				</div>
				<div class="tittle_right">
				</div>
			</div>
		</div>
		<div style="position:absolute; margin-left: 150px; margin-top: 10px; text-align: center; color: red;">
			<s:actionmessage />
		</div>
		<table style="margin-left: 50px; margin-top: 30px;" border="0" cellspacing="15" cellpadding="0">
			<tr>
				<td width="120"><font color="red">*</font>委托公司代码</td>
				<td width="500">&nbsp;<s:property value="updateAgentCompDto.ANGENT_COMP_NO"/></td>
			</tr>
			<tr>
				<td><font color="red">*</font>委托公司名称</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="updateAgentCompDto.ANGENT_COMP_NAME" id="ANGENT_COMP_NAME" cssStyle="width:350px;" maxlength="40" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td><font color="red">&nbsp</font>纳税人识别号</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="updateAgentCompDto.RESERVE1" id="RESERVE1" cssStyle="width:350px;" maxlength="40" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td><font color="red">&nbsp</font>开户行</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="updateAgentCompDto.RESERVE2" id="RESERVE2" cssStyle="width:350px;" maxlength="40" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td><font color="red">&nbsp</font>开户行账号</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="updateAgentCompDto.RESERVE3" id="RESERVE3" cssStyle="width:350px;" maxlength="40" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="trade">
						<table class="trade_tab" width="80%" border="0">
							<tr>
								<td align="left" width="15%"><strong>联系人1</strong></td>
								<td><font color="red">*</font>联系人1姓名</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updateAgentCompDto.CO_MANAGER1" id="CO_MANAGER1" cssStyle="width:300px;" maxlength="24" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><font color="red">*</font>联系人1电话</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updateAgentCompDto.CO_MANAGER_TEL1" id="CO_MANAGER_TEL1" cssStyle="width:300px;" maxlength="30" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><font color="red">*</font>联系人1邮箱</td>
								<td>
									<div class="box1">
										<div class="box1_left"></div>
										<div class="box1_center">
											<s:textfield name="updateAgentCompDto.mail_pr1" id="mail_pr1" cssStyle="width:141px;" maxlength="29" theme="simple"></s:textfield>
										</div>
										<div class="box1_right"></div>
										<label>@</label>
										<div class="box1_left"></div>
										<div class="box1_center">
											<s:textfield name="updateAgentCompDto.mail_suffix1" id="mail_suffix1" cssStyle="width:141px;" maxlength="30" theme="simple"></s:textfield>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><font color="red">*</font>联系人1地址</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updateAgentCompDto.CO_ADDRESS1" id="CO_ADDRESS1" cssStyle="width:300px;" maxlength="40" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="trade">
						<table class="trade_tab" width="80%" border="0">
							<tr>
								<td align="left" width="15%"><strong>联系人2</strong></td>
								<td>联系人2姓名</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updateAgentCompDto.CO_MANAGER2" id="CO_MANAGER2" cssStyle="width:300px;" maxlength="24" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>联系人2电话</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updateAgentCompDto.CO_MANAGER_TEL2" id="CO_MANAGER_TEL2" cssStyle="width:300px;" maxlength="30" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>联系人2邮箱</td>
								<td>
									<div class="box1">
										<div class="box1_left"></div>
										<div class="box1_center">
											<s:textfield name="updateAgentCompDto.mail_pr2" id="mail_pr2" cssStyle="width:141px;" maxlength="29" theme="simple"></s:textfield>
										</div>
										<div class="box1_right"></div>
										<label>@</label>
										<div class="box1_left"></div>
										<div class="box1_center">
											<s:textfield name="updateAgentCompDto.mail_suffix2" id="mail_suffix2" cssStyle="width:141px;" maxlength="30" theme="simple"></s:textfield>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>联系人2地址</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updateAgentCompDto.CO_ADDRESS2" id="CO_ADDRESS2" cssStyle="width:300px;" maxlength="40" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="trade">
						<table class="trade_tab" width="80%" border="0">
							<tr>
								<td align="left" width="15%"><strong>联系人3</strong></td>
								<td>联系人3姓名</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updateAgentCompDto.CO_MANAGER3" id="CO_MANAGER3" cssStyle="width:300px;" maxlength="24" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>联系人3电话</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updateAgentCompDto.CO_MANAGER_TEL3" id="CO_MANAGER_TEL3" cssStyle="width:300px;" maxlength="30" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>联系人3邮箱</td>
								<td>
									<div class="box1">
										<div class="box1_left"></div>
										<div class="box1_center">
											<s:textfield name="updateAgentCompDto.mail_pr3" id="mail_pr3" cssStyle="width:141px;" maxlength="29" theme="simple"></s:textfield>
										</div>
										<div class="box1_right"></div>
										<label>@</label>
										<div class="box1_left"></div>
										<div class="box1_center">
											<s:textfield name="updateAgentCompDto.mail_suffix3" id="mail_suffix3" cssStyle="width:141px;" maxlength="30" theme="simple"></s:textfield>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>联系人3地址</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updateAgentCompDto.CO_ADDRESS3" id="CO_ADDRESS3" cssStyle="width:300px;" maxlength="40" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="trade">
						<table class="trade_tab" width="80%" border="0">
							<tr>
								<td align="left" width="15%"><strong>联系人4</strong></td>
								<td>联系人4姓名</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updateAgentCompDto.CO_MANAGER4" id="CO_MANAGER4" cssStyle="width:300px;" maxlength="24" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>联系人4电话</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updateAgentCompDto.CO_MANAGER_TEL4" id="CO_MANAGER_TEL4" cssStyle="width:300px;" maxlength="30" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>联系人4邮箱</td>
								<td>
									<div class="box1">
										<div class="box1_left"></div>
										<div class="box1_center">
											<s:textfield name="updateAgentCompDto.mail_pr4" id="mail_pr4" cssStyle="width:141px;" maxlength="29" theme="simple"></s:textfield>
										</div>
										<div class="box1_right"></div>
										<label>@</label>
										<div class="box1_left"></div>
										<div class="box1_center">
											<s:textfield name="updateAgentCompDto.mail_suffix4" id="mail_suffix4" cssStyle="width:141px;" maxlength="30" theme="simple"></s:textfield>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>联系人4地址</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updateAgentCompDto.CO_ADDRESS4" id="CO_ADDRESS4" cssStyle="width:300px;" maxlength="40" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="trade">
						<table class="trade_tab" width="80%" border="0">
							<tr>
								<td align="left" width="15%"><strong>联系人5</strong></td>
								<td>联系人5姓名</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updateAgentCompDto.CO_MANAGER5" id="CO_MANAGER5" cssStyle="width:300px;" maxlength="24" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>联系人5电话</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updateAgentCompDto.CO_MANAGER_TEL5" id="CO_MANAGER_TEL5" cssStyle="width:300px;" maxlength="30" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>联系人5邮箱</td>
								<td>
									<div class="box1">
										<div class="box1_left"></div>
										<div class="box1_center">
											<s:textfield name="updateAgentCompDto.mail_pr5" id="mail_pr5" cssStyle="width:141px;" maxlength="29" theme="simple"></s:textfield>
										</div>
										<div class="box1_right"></div>
										<label>@</label>
										<div class="box1_left"></div>
										<div class="box1_center">
											<s:textfield name="updateAgentCompDto.mail_suffix5" id="mail_suffix5" cssStyle="width:141px;" maxlength="30" theme="simple"></s:textfield>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>联系人5地址</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updateAgentCompDto.CO_ADDRESS5" id="CO_ADDRESS5" cssStyle="width:300px;" maxlength="40" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td>备注</td>
				<td>
					<textarea name="" id="tmpMEMO1" cols="" rows="5" style="width:350px;"><s:property value="updateAgentCompDto.MEMO1"/></textarea>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<div class="btn">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input class="input80" type="button" value="修改" onclick="upd();"/>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="btn">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input class="input80" type="button" value="关闭" onclick="window.close();"/>
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
