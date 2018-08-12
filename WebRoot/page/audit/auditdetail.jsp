<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Calendar3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<title>审价明细</title>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:auto;">
	<s:form id="mainform" name="mainform" method="POST">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					审价明细
				</div>
				<div class="tittle_right">
				</div>
			</div>
		</div>
		<div class="searchbox update" style="height:0px;">
			<table width="100%" border="0" cellpadding="5" cellspacing="0">
				<tr>
					<td class="red" align="center" colspan="4"><s:actionmessage /></td>
				</tr>
				<tr>
					<td align="right">
						<label class="pdf10"><font color="red">*</font>审价编号</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.AUDIT_NO" id="AUDIT_NO" disabled="true" cssStyle="width:300px;" maxlength="8" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">
						<label class="pdf10"><font color="red">*</font>项目性质</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="PROJECT_TYPE" name="auditDtoDetail.PROJECT_TYPE" style="width:300px;" disabled="disabled">
								<s:if test='auditDtoDetail.PROJECT_TYPE == "1"'>
									<option value="">请选择</option>
									<option value="1" selected="selected">土建</option>
									<option value="2">安装</option>
									<option value="3">房修</option>
									<option value="4">园林</option>
									<option value="5">咨询</option>
									<option value="6">限价</option>
									<option value="7">其他</option>
								</s:if>
								<s:elseif test='auditDtoDetail.PROJECT_TYPE == "2"'>
									<option value="">请选择</option>
									<option value="1">土建</option>
									<option value="2" selected="selected">安装</option>
									<option value="3">房修</option>
									<option value="4">园林</option>
									<option value="5">咨询</option>
									<option value="6">限价</option>
									<option value="7">其他</option>
								</s:elseif>
								<s:elseif test='auditDtoDetail.PROJECT_TYPE == "3"'>
									<option value="">请选择</option>
									<option value="1">土建</option>
									<option value="2">安装</option>
									<option value="3" selected="selected">房修</option>
									<option value="4">园林</option>
									<option value="5">咨询</option>
									<option value="6">限价</option>
									<option value="7">其他</option>
								</s:elseif>
								<s:elseif test='auditDtoDetail.PROJECT_TYPE == "4"'>
									<option value="">请选择</option>
									<option value="1">土建</option>
									<option value="2">安装</option>
									<option value="3">房修</option>
									<option value="4" selected="selected">园林</option>
									<option value="5">咨询</option>
									<option value="6">限价</option>
									<option value="7">其他</option>
								</s:elseif>
								<s:elseif test='auditDtoDetail.PROJECT_TYPE == "5"'>
									<option value="">请选择</option>
									<option value="1">土建</option>
									<option value="2">安装</option>
									<option value="3">房修</option>
									<option value="4">园林</option>
									<option value="5" selected="selected">咨询</option>
									<option value="6">限价</option>
									<option value="7">其他</option>
								</s:elseif>
								<s:elseif test='auditDtoDetail.PROJECT_TYPE == "6"'>
									<option value="">请选择</option>
									<option value="1">土建</option>
									<option value="2">安装</option>
									<option value="3">房修</option>
									<option value="4">园林</option>
									<option value="5">咨询</option>
									<option value="6" selected="selected">限价</option>
									<option value="7">其他</option>
								</s:elseif>
								<s:elseif test='auditDtoDetail.PROJECT_TYPE == "7"'>
									<option value="">请选择</option>
									<option value="1">土建</option>
									<option value="2">安装</option>
									<option value="3">房修</option>
									<option value="4">园林</option>
									<option value="5">咨询</option>
									<option value="6">限价</option>
									<option value="7" selected="selected">其他</option>
								</s:elseif>
								<s:else>
									<option value="" selected="selected">请选择</option>
									<option value="1">土建</option>
									<option value="2">安装</option>
									<option value="3">房修</option>
									<option value="4">园林</option>
									<option value="5">咨询</option>
									<option value="6">限价</option>
									<option value="7">其他</option>
								</s:else>
							</select>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="pdf10"><font color="red">*</font>报告文号</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.REPORT_NO" id="REPORT_NO" disabled="true" cssStyle="width:300px;" maxlength="16" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">
						<label class="pdf10"><font color="red">*</font>项目进度</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="PROJECT_STATUS" name="auditDtoDetail.PROJECT_STATUS" style="width:300px;" disabled="disabled">
										<s:if test='auditDtoDetail.PROJECT_STATUS == "1"'>
											<option value="">请选择</option>
											<option value="1" selected="selected">在审</option>
											<option value="2">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6">快递</option>
											<option value="7">完成</option>
											<option value="8">终止</option>
											<option value="8">终止</option>
											<option value="9">归档</option>
										</s:if>
										<s:elseif test='auditDtoDetail.PROJECT_STATUS == "2"'>
											<option value="">请选择</option>
											<option value="1">在审</option>
											<option value="2" selected="selected">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6">快递</option>
											<option value="7">完成</option>
											<option value="8">终止</option>
											<option value="9">归档</option>
										</s:elseif>
										<s:elseif test='auditDtoDetail.PROJECT_STATUS == "3"'>
											<option value="">请选择</option>
											<option value="1">在审</option>
											<option value="2">补交资料</option>
											<option value="3" selected="selected">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6">快递</option>
											<option value="7">完成</option>
											<option value="8">终止</option>
											<option value="9">归档</option>
										</s:elseif>
										<s:elseif test='auditDtoDetail.PROJECT_STATUS == "4"'>
											<option value="">请选择</option>
											<option value="1">在审</option>
											<option value="2">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4" selected="selected">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6">快递</option>
											<option value="7">完成</option>
											<option value="8">终止</option>
											<option value="9">归档</option>
										</s:elseif>
										<s:elseif test='auditDtoDetail.PROJECT_STATUS == "5"'>
											<option value="">请选择</option>
											<option value="1">在审</option>
											<option value="2">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5" selected="selected">出报告</option>
											<option value="6">快递</option>
											<option value="7">完成</option>
											<option value="8">终止</option>
											<option value="9">归档</option>
										</s:elseif>
										<s:elseif test='auditDtoDetail.PROJECT_STATUS == "6"'>
											<option value="">请选择</option>
											<option value="1">在审</option>
											<option value="2">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6" selected="selected">快递</option>
											<option value="7">完成</option>
											<option value="8">终止</option>
											<option value="9">归档</option>
										</s:elseif>
										<s:elseif test='auditDtoDetail.PROJECT_STATUS == "7"'>
											<option value="">请选择</option>
											<option value="1">在审</option>
											<option value="2">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6">快递</option>
											<option value="7" selected="selected">完成</option>
											<option value="8">终止</option>
											<option value="9">归档</option>
										</s:elseif>
										<s:elseif test='auditDtoDetail.PROJECT_STATUS == "8"'>
											<option value="">请选择</option>
											<option value="1">在审</option>
											<option value="2">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6">快递</option>
											<option value="7">完成</option>
											<option value="8" selected="selected">终止</option>
											<option value="9">归档</option>
										</s:elseif>
										<s:elseif test='auditDtoDetail.PROJECT_STATUS == "9"'>
											<option value="">请选择</option>
											<option value="1">在审</option>
											<option value="2">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6">快递</option>
											<option value="7">完成</option>
											<option value="8">终止</option>
											<option value="9" selected="selected">归档</option>
										</s:elseif>
										<s:else>
											<option value="" selected="selected">请选择</option>
											<option value="1">在审</option>
											<option value="2">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6">快递</option>
											<option value="7">完成</option>
											<option value="8">终止</option>
											<option value="9">归档</option>
										</s:else>
							</select>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="pdf10"><font color="red">*</font>项目名称</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.PROJECT_NAME" id="PROJECT_NAME" disabled="true" cssStyle="width:300px;" maxlength="40" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">
						<label class="pdf10"><font color="red">*</font>担当者</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.PROJECT_MANAGER" id="PROJECT_MANAGER" disabled="true" cssStyle="width:300px;" maxlength="24" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="pdf10"><font color="red">*</font>合同编号</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.CONTRACT_NO" id="CONTRACT_NO" disabled="true" cssStyle="width:300px;" maxlength="16" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">
						<label class="pdf10"><font color="red">*</font>项目分类</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="RESERVE1" name="auditDtoDetail.RESERVE1" style="width: 150px;" disabled="disabled">
								<s:if test='auditDtoDetail.RESERVE1 == "a"'>
									<option value="">请选择</option>
									<option value="a" selected="selected">地铁审价项目</option>
									<option value="b">地铁投资监理项目</option>
									<option value="c">地铁限价项目</option>
									<option value="d">邮政审价项目</option>
									<option value="e">投资监理项目</option>
									<option value="f">投资监理审价项目</option>
									<option value="g">其他项目</option>
								</s:if>
								<s:elseif test='auditDtoDetail.RESERVE1 == "b"'>
									<option value="">请选择</option>
									<option value="a">地铁审价项目</option>
									<option value="b" selected="selected">地铁投资监理项目</option>
									<option value="c">地铁限价项目</option>
									<option value="d">邮政审价项目</option>
									<option value="e">投资监理项目</option>
									<option value="f">投资监理审价项目</option>
									<option value="g">其他项目</option>
								</s:elseif>
								<s:elseif test='auditDtoDetail.RESERVE1 == "c"'>
									<option value="">请选择</option>
									<option value="a">地铁审价项目</option>
									<option value="b">地铁投资监理项目</option>
									<option value="c" selected="selected">地铁限价项目</option>
									<option value="d">邮政审价项目</option>
									<option value="e">投资监理项目</option>
									<option value="f">投资监理审价项目</option>
									<option value="g">其他项目</option>
								</s:elseif>
								<s:elseif test='auditDtoDetail.RESERVE1 == "d"'>
									<option value="">请选择</option>
									<option value="a">地铁审价项目</option>
									<option value="b">地铁投资监理项目</option>
									<option value="c">地铁限价项目</option>
									<option value="d" selected="selected">邮政审价项目</option>
									<option value="e">投资监理项目</option>
									<option value="f">投资监理审价项目</option>
									<option value="g">其他项目</option>
								</s:elseif>
								<s:elseif test='auditDtoDetail.RESERVE1 == "e"'>
									<option value="">请选择</option>
									<option value="a">地铁审价项目</option>
									<option value="b">地铁投资监理项目</option>
									<option value="c">地铁限价项目</option>
									<option value="d">邮政审价项目</option>
									<option value="e" selected="selected">投资监理项目</option>
									<option value="f">投资监理审价项目</option>
									<option value="g">其他项目</option>
								</s:elseif>
								<s:elseif test='auditDtoDetail.RESERVE1 == "f"'>
									<option value="">请选择</option>
									<option value="a">地铁审价项目</option>
									<option value="b">地铁投资监理项目</option>
									<option value="c">地铁限价项目</option>
									<option value="d">邮政审价项目</option>
									<option value="e">投资监理项目</option>
									<option value="f" selected="selected">投资监理审价项目</option>
									<option value="g">其他项目</option>
								</s:elseif>
								<s:elseif test='auditDtoDetail.RESERVE1 == "g"'>
									<option value="">请选择</option>
									<option value="a">地铁审价项目</option>
									<option value="b">地铁投资监理项目</option>
									<option value="c">地铁限价项目</option>
									<option value="d">邮政审价项目</option>
									<option value="e">投资监理项目</option>
									<option value="f">投资监理审价项目</option>
									<option value="g" selected="selected">其他项目</option>
								</s:elseif>
								<s:else>
									<option value="" selected="selected">请选择</option>
									<option value="a">地铁审价项目</option>
									<option value="b">地铁投资监理项目</option>
									<option value="c">地铁限价项目</option>
									<option value="d">邮政审价项目</option>
									<option value="e">投资监理项目</option>
									<option value="f">投资监理审价项目</option>
									<option value="g">其他项目</option>
								</s:else>
							</select>
							</div>
						<div class="box1_right"></div>
					</td>
				</tr>
			</table>
		</div>
		<div class="companys">
			<table width="100%" border="0">
				<tr>
					<td width="33%">
						<table class="company_tab" width="100%" border="0">
							<tr>
								<td colspan="4" align="center" class="tittle"><strong>委托公司信息</strong></td>
							</tr>
							<tr>
								<td align="right">代码</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="agentNo" disabled="disabled" maxlength="4" style="width:100px;" value="<s:property value="auditDtoDetail.AGENT_NO" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">名称</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="agentCoName" disabled="disabled" maxlength="40" style="width:180px;" value="<s:property value="auditDtoDetail.AGENT_CO_NAME" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">负责人</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="agentCoManager" disabled="disabled" maxlength="24" style="width:180px;" value="<s:property value="auditDtoDetail.AGENT_CO_MANAGER" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">负责人电话</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="agentCoManagerTel" disabled="disabled" maxlength="30" style="width:180px;" value="<s:property value="auditDtoDetail.AGENT_CO_MANAGER_TEL" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">项目负责人</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="auditDtoDetail.AGENT_CO_STAFF" disabled="true" id="AGENT_CO_STAFF" cssStyle="width:180px;" maxlength="24" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">项目负责人电话</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="auditDtoDetail.AGENT_CO_STAFF_TEL" disabled="true" id="AGENT_CO_STAFF_TEL" cssStyle="width:180px;" maxlength="30" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">快递地址</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="agentCoPostAddress" maxlength="40" disabled="disabled" style="width:180px;" value="<s:property value="auditDtoDetail.AGENT_CO_POST_ADDRESS" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr style="display: none;">
								<td align="right">邮箱</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="agentCoMail" maxlength="30" disabled="disabled" style="width:180px;" value="<s:property value="auditDtoDetail.AGENT_CO_MAIL" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
						</table>
					</td>
					<td width="33%">
						<table class="company_tab" width="100%" border="0">
							<tr>
								<td colspan="4" align="center" class="tittle"><strong>专业公司信息</strong></td>
							</tr>
							<tr>
								<td align="right">代码</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="profNo" disabled="disabled" maxlength="4" style="width:100px;" value="<s:property value="auditDtoDetail.PROF_NO" />" />
									</div>
								</td>
							</tr>
							<tr>
								<td align="right">名称</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="profCoName" disabled="disabled" maxlength="40" style="width:180px;" value="<s:property value="auditDtoDetail.PROF_CO_NAME" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">负责人</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="profCoManager" maxlength="24" disabled="disabled" style="width:180px;" value="<s:property value="auditDtoDetail.PROF_CO_MANAGER" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">负责人电话</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="profCoManagerTel" maxlength="30" disabled="disabled" style="width:180px;" value="<s:property value="auditDtoDetail.PROF_CO_MANAGER_TEL" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">项目负责人</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="auditDtoDetail.PROF_CO_STAFF" disabled="true" id="PROF_CO_STAFF" cssStyle="width:180px;" maxlength="24" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">项目负责人电话</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="auditDtoDetail.PROF_CO_STAFF_TEL" disabled="true" id="PROF_CO_STAFF_TEL" cssStyle="width:180px;" maxlength="30" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">快递地址</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="profCoPostAddress" maxlength="40" disabled="disabled" style="width:180px;" value="<s:property value="auditDtoDetail.PROF_CO_POST_ADDRESS" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr style="display: none;">
								<td align="right">邮箱</td>
								<td>
									<div class="box1">
										<div class="box1_left"></div>
										<div class="box1_center">
											<s:textfield name="auditDtoDetail.prof_mail_pr" id="prof_mail_pr" cssStyle="width:116px;" maxlength="29" theme="simple"></s:textfield>
										</div>
										<div class="box1_right"></div>
										<label>@</label>
										<div class="box1_left"></div>
										<div class="box1_center">
											<s:textfield name="auditDtoDetail.prof_mail_suffix" id="prof_mail_suffix" cssStyle="width:116px;" maxlength="30" theme="simple"></s:textfield>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
							</tr>
						</table>
					</td>
					<td width="33%">
						<table class="company_tab" width="100%" border="0">
							<tr>
								<td colspan="4" align="center" class="tittle"><strong>承包公司信息</strong></td>
							</tr>
							<tr>
								<td align="right">代码</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="contractCoNo" disabled="disabled" maxlength="4" style="width:180px;" value="<s:property value="auditDtoDetail.CONTRACT_CO_NO" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">名称</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="contractCoName" disabled="disabled" style="width:180px;" maxlength="40" value="<s:property value="auditDtoDetail.CONTRACT_CO_NAME" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">负责人</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="contractCoManager" disabled="disabled" maxlength="24" style="width:180px;" value="<s:property value="auditDtoDetail.CONTRACT_CO_MANAGER" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">负责人电话</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="contractCoManagerTel" disabled="disabled" maxlength="30" style="width:180px;" value="<s:property value="auditDtoDetail.CONTRACT_CO_MANAGER_TEL" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">项目负责人</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="auditDtoDetail.CONTRACT_CO_STAFF" disabled="true" id="CONTRACT_CO_STAFF" cssStyle="width:180px;" maxlength="24" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">项目负责人电话</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="auditDtoDetail.CONTRACT_CO_STAFF_TEL" disabled="true" id="CONTRACT_CO_STAFF_TEL" cssStyle="width:180px;" maxlength="30" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td align="right">快递地址</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="contractCoPostAddress" disabled="disabled" maxlength="40" style="width:180px;" value="<s:property value="auditDtoDetail.CONTRACT_CO_POST_ADDRESS" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr style="display: none;">
								<td align="right">邮箱</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="text" id="contractCoMail" maxlength="30" disabled="disabled" style="width:180px;" value="<s:property value="auditDtoDetail.CONTRACT_CO_MAIL" />" />
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div class="ok">
			<table width="100%" border="0" cellpadding="5" cellspacing="0">
				<tr>
					<td align="right">
						<label class="pdf10">资料快递编号</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.DOC_POST_NO" id="DOC_POST_NO" disabled="true" cssStyle="width:165px;" maxlength="12" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">
						<label class="pdf10">审定单发出日期</label>
					</td>
					<td class="date_input" width="20%">
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" id="verifyDocSendDate" style="width:150px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="auditDtoDetail.VERIFY_DOC_SEND_DATE"/>" />
							<a id="verifyDocSendDateBtn" class="date" href="javascript:;" ></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">
						<label class="pdf10">最终报告日期</label>
					</td>
					<td class="date_input" width="20%">
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" id="lastReportDate" style="width:150px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="auditDtoDetail.LAST_REPORT_DATE"/>" />
							<a id="lastReportDateBtn" class="date" href="javascript:;" ></a>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="pdf10">资料到达日期</label>
					</td>
					<td class="date_input" width="20%">
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" id="docArrDate" style="width:150px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="auditDtoDetail.DOC_ARR_DATE"/>" />
							<a id="docArrDateBtn" class="date" href="javascript:;" ></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">
						<label class="pdf10">审定单回复日期</label>
					</td>
					<td class="date_input" width="20%">
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" id="verifyDocReplyDate" style="width:150px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="auditDtoDetail.VERIFY_DOC_REPLY_DATE"/>" />
							<a id="verifyDocReplyDateBtn" class="date" href="javascript:;" ></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">
						<label class="pdf10">报告快递编号</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.REPORT_POST_NO" id="REPORT_POST_NO" disabled="true" cssStyle="width:165px;" maxlength="12" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="pdf10">资料邮箱时间</label>
					</td>
					<td class="date_input" width="20%" colspan="5">
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" id="docMailDate" style="width:150px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="auditDtoDetail.DOC_MAIL_DATE"/>" />
							<a id="docMailDateBtn" class="date" href="javascript:;" ></a>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="pdf10">送审金额（元）</label>
					</td>
					<td colspan="5">
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.VERIFY_PER_AMOUNT" id="VERIFY_PER_AMOUNT" disabled="true" cssStyle="width:165px;" maxlength="14" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="pdf10">审定金额（元）</label>
					</td>
					<td colspan="5">
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.VERIFY_AMOUNT" id="VERIFY_AMOUNT" disabled="true" cssStyle="width:165px;" maxlength="14" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="pdf10">净核减</label>
					</td>
					<td colspan="5">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" id="verifyDiff" style="width:165px;" maxlength="15" disabled="disabled" value="<s:property value="auditDtoDetail.VERIFY_DIFF" />" />
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="pdf10">核增</label>
					</td>
					<td colspan="5">
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.VERIFY_INCREASE" id="VERIFY_INCREASE" disabled="true" cssStyle="width:165px;" maxlength="10" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="pdf10">核减</label>
					</td>
					<td colspan="5">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" id="verifyDecrease" style="width:165px;" maxlength="15" disabled="disabled" value="<s:property value="auditDtoDetail.VERIFY_DECREASE" />" />
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="pdf10">增减理由</label>
					</td>
					<td colspan="5">
						<textarea id="tVerifyDiffReason" rows="3" cols="" style="width:725px;" disabled="disabled"><s:property value="auditDtoDetail.VERIFY_DIFF_REASON" /></textarea>
					</td>
				</tr>
			</table>
		</div>
		<div class="trade">
			<table class="trade_tab" width="100%" border="0">
				<tr>
					<td align="right" width="8%"><strong>发票</strong></td>
					<td align="right" width="10%">开票日期</td>
					<td class="date_input" width="20%">
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" id="receipt1Date" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="auditDtoDetail.RECEIPT1_DATE"/>" />
							<a id="receipt1DateBtn" class="date" href="javascript:;"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right" width="10%">开票人</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.RECEIPT1_STAFF" id="RECEIPT1_STAFF" disabled="true" maxlength="24" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right" width="12%">开票金额（甲方）</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.RECEIPT1_AMOUNT_A" id="RECEIPT1_AMOUNT_A" disabled="true" maxlength="7" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td align="right">发票号码</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.RECEIPT1_NO" id="RECEIPT1_NO" disabled="true" maxlength="8" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">接受人</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.RECEIPT2_RECEIVER" id="RECEIPT2_RECEIVER" disabled="true" maxlength="24" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right" width="10%">开票金额（乙方）</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.RECEIPT1_AMOUNT_B" id="RECEIPT1_AMOUNT_B" disabled="true" maxlength="7" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td align="right">到账日期</td>
					<td class="date_input">
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" id="valueDate" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="auditDtoDetail.VALUE_DATE"/>" />
							<a id="valueDateBtn" class="date" href="javascript:;"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td align="right">开票金额（合计）</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" id="receipt1AmountTotal" style="width:165px;" maxlength="8" disabled="disabled" value="<s:property value="auditDtoDetail.RECEIPT1_AMOUNT_TOTAL" />" />
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td colspan="6"><br /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td width="10%" align="right">签收单编号</td>
					<td width="20%">
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.RECEIPT2_NO" id="RECEIPT2_NO" disabled="true" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td class="date_input" width="10%" align="right">签收时间</td>
					<td width="20%">
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" id="receipt2Date" disabled="disabled" maxlength="10" value="<s:date format="yyyy-MM-dd" name="auditDtoDetail.RECEIPT2_DATE"/>" />
							<a id="receipt2DateBtn" class="date" href="javascript:;"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td width="10%" align="right">&nbsp;</td>
					<td width="20%">&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td align="right">快递编号</td>
					<td width="20%">
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="auditDtoDetail.RECEIPT2_POST_NO" id="RECEIPT2_POST_NO" disabled="true" maxlength="12" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td align="right">快递时间</td>
					<td class="date_input">
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" id="receipt2PostDate" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="auditDtoDetail.RECEIPT2_POST_DATE"/>" />
							<a id="receipt2PostDateBtn" class="date" href="javascript:;"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
		<div class="trade">
			<table class="trade_tab" width="80%" border="0">
				<tr>
					<td align="left" width="35%">轨道交通类</td>
					<td width="5%" style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(0, 1) == "1"}'>
							<input id="reserve2_0" type="checkbox" disabled="disabled" checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_0" type="checkbox" disabled="disabled"/>　
						</s:else></td>
					<td align="left" width="35%">其他类</td>
					<td width="5%" style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(6, 7) == "1"}'>
							<input id="reserve2_6" type="checkbox" disabled="disabled" checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_6" type="checkbox" disabled="disabled"/>　
						</s:else></td>
				</tr>
				<!-- <tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr> -->
				<tr>
					<td align="left">预（结）算书</td>
					<td style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(1, 2) == "1"}'>
							<input id="reserve2_1" type="checkbox"  disabled="disabled"checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_1" type="checkbox" disabled="disabled"/>　
						</s:else></td>
					<td align="left">招标文件</td>
					<td style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(7, 8) == "1"}'>
							<input id="reserve2_7" type="checkbox" disabled="disabled" checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_7" type="checkbox" disabled="disabled"/>　
						</s:else></td>
				</tr>
				<tr>
					<td align="left">项目方案</td>
					<td style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(2, 3) == "1"}'>
							<input id="reserve2_2" type="checkbox" disabled="disabled" checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_2" type="checkbox" disabled="disabled"/>　
						</s:else></td>
					<td align="left">投标文件</td>
					<td style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(8, 9) == "1"}'>
							<input id="reserve2_8" type="checkbox" disabled="disabled" checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_8" type="checkbox" disabled="disabled"/>　
						</s:else></td>
				</tr>
				<tr>
					<td align="left">项目情况说明</td>
					<td style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(3, 4) == "1"}'>
							<input id="reserve2_3" type="checkbox" disabled="disabled" checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_3" type="checkbox" disabled="disabled"/>　
						</s:else></td>
					<td align="left">项目合同</td>
					<td style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(9, 10) == "1"}'>
							<input id="reserve2_9" type="checkbox" disabled="disabled" checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_9" type="checkbox" disabled="disabled"/>　
						</s:else></td>
				</tr>
				<tr>
					<td align="left">项目合同</td>
					<td style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(4, 5) == "1"}'>
							<input id="reserve2_4" type="checkbox" disabled="disabled" checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_4" type="checkbox" disabled="disabled"/>　
						</s:else></td>
					<td align="left">项目签证变更单</td>
					<td style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(10, 11) == "1"}'>
							<input id="reserve2_10" type="checkbox" disabled="disabled" checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_10" type="checkbox" disabled="disabled"/>　
						</s:else></td>
				</tr>
				<tr>
					<td align="left">相关发票及价格证明文件</td>
					<td style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(5, 6) == "1"}'>
							<input id="reserve2_5" type="checkbox" disabled="disabled" checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_5" type="checkbox" disabled="disabled"/>　
						</s:else></td>
					<td align="left">项目设计变更单</td>
					<td style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(11, 12) == "1"}'>
							<input id="reserve2_11" type="checkbox" disabled="disabled" checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_11" type="checkbox" disabled="disabled"/>　
						</s:else></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td align="left">开（竣）工报告</td>
					<td style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(12, 13) == "1"}'>
							<input id="reserve2_12" type="checkbox" disabled="disabled" checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_12" type="checkbox" disabled="disabled"/>　
						</s:else></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td align="left">结算书</td>
					<td style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(13, 14) == "1"}'>
							<input id="reserve2_13" type="checkbox" disabled="disabled" checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_13" type="checkbox" disabled="disabled"/>　
						</s:else></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td align="left">竣工图纸</td>
					<td style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(14, 15) == "1"}'>
							<input id="reserve2_14" type="checkbox" disabled="disabled" checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_14" type="checkbox" disabled="disabled"/>　
						</s:else></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td align="left">工程量确认单</td>
					<td style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(15, 16) == "1"}'>
							<input id="reserve2_15" type="checkbox" disabled="disabled" checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_15" type="checkbox" disabled="disabled"/>　
						</s:else></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td align="left">价格证明文件</td>
					<td style="background-color:rgb(130,219,237)">
						<s:if test='%{auditDtoDetail.RESERVE2.substring(16, 17) == "1"}'>
							<input id="reserve2_16" type="checkbox" disabled="disabled" checked="checked"/>
						</s:if>
						<s:else>
							<input id="reserve2_16" type="checkbox" disabled="disabled"/>　
						</s:else></td>
				</tr>
				<tr>
					<td align="left" colspan="4">
						<label class="pdf10">补充：</label>
						<textarea id="reserve3" disabled="disabled" rows="3" cols="" style="width:650px;"><s:property value="auditDtoDetail.RESERVE3" /></textarea>
					</td>
				</tr>
			</table>
			<div style="height:225px;"></div>
		</div>
	</s:form>
</body>
</html>
