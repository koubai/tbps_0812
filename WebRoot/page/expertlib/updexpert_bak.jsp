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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Calendar3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<title>专家信息输入</title>
<script type="text/javascript">
	function upd() {
		//获得专业信息
		setmajor();
		var EXPERT_NAME = $("#EXPERT_NAME").val().trim();
		var gender = getGender();
		var EXPERT_BIRTH = $("#EXPERT_BIRTH").val().trim();
		var EXPERT_TEL1 = $("#EXPERT_TEL1").val().trim();
		var EXPERT_COMP = $("#EXPERT_COMP").val().trim();
		var EXPERT_MAJOR = $("#EXPERT_MAJOR").val().trim();
		var EXPERT_QULI = $("#EXPERT_QULI").val().trim();
		if(EXPERT_NAME == "") {
			alert("专家姓名不能为空！");
			$("#EXPERT_NAME").focus();
			return;
		}
		if(EXPERT_NAME.length > 8) {
			alert("专家姓名不能超过8个字！");
			$("#EXPERT_NAME").focus();
			return;
		}
		if(gender == "") {
			alert("请选择性别！");
			$("#man").focus();
			return;
		}
		if(EXPERT_BIRTH == "") {
			alert("生日不能为空！");
			$("#EXPERT_BIRTH").focus();
			return;
		}
		if(EXPERT_TEL1 == "") {
			alert("手机不能为空！");
			$("#EXPERT_TEL1").focus();
			return;
		}
		if(!isMobile(EXPERT_TEL1)) {
			alert("手机号码格式不正确！");
			$("#EXPERT_TEL1").focus();
			return;
		}
		if(EXPERT_COMP == "") {
			alert("就职公司不能为空！");
			$("#EXPERT_COMP").focus();
			return;
		}
		if(EXPERT_MAJOR == "000000000") {
			alert("请选择专业不能为空！");
			$("#architect").focus();
			return;
		}
		if(EXPERT_QULI == "") {
			alert("职称不能为空！");
			$("#EXPERT_QULI").focus();
			return;
		}
		$("#EXPERT_GENDER").attr("value", gender);
		document.updexpertform.action = '<c:url value="/expertlib/updExpertLibAction.action"></c:url>';
		document.updexpertform.submit();
	}
	
	//设置专业
	function setmajor() {
		var major = "";
		var list = document.getElementsByName("major");
		for(var i = 1; i < list.length + 1; i++) {
			if(list[i - 1].checked) {
				major += "" + list[i - 1].value;
			} else {
				major += "0";
			}
		}
		$("#EXPERT_MAJOR").attr("value", major + "00000000000000000000");
		$("#MEMO1").attr("value", document.getElementById("tmpMEMO1").value);
		//$("#EXPERT_BIRTH").attr("value", document.getElementById("tmpEXPERT_BIRTH").value);
	}
	
	//性别
	function getGender() {
		var gender = "";
		var list = document.getElementsByName("gender");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				gender = list[i].value;
				break;
			}
		}
		return gender;
	}
	
	//页面关闭响应
	window.onunload = function() {
		//刷新父页面
		//window.dialogArguments.document.mainform.action = '<c:url value="/expertlib/queryExpertLibList.action"></c:url>';
		window.dialogArguments.document.mainform.action = '<c:url value="/expertlib/turnExpertLibPage.action"></c:url>';
		window.dialogArguments.document.mainform.submit();
	};

</script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:scroll;">
<s:form id="updexpertform" name="updexpertform" method="POST">
	<s:hidden name="updateExpertLibDto.EXPERT_GENDER" id="EXPERT_GENDER"/>
	<s:hidden name="updateExpertLibDto.EXPERT_MAJOR" id="EXPERT_MAJOR"/>
	<s:hidden name="updateExpertLibDto.MEMO1" id="MEMO1"/>
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					专家信息输入
				</div>
				<div class="tittle_right">
				</div>
			</div>
		</div>
		<div style="position:absolute; margin-left: 70px; margin-top: 7px; text-align: center; color: red;">
			<s:actionmessage />
		</div>
		<table border="0" cellspacing="15" cellpadding="0" style="margin:20px auto">
			<tr>
				<td align="right"><font color="red">*</font>专家姓名：</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="updateExpertLibDto.EXPERT_NAME" id="EXPERT_NAME" cssStyle="width:270px;" maxlength="24" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
				<td align="right"><font color="red">*</font>性别：</td>
				<td>
					<s:if test='updateExpertLibDto.EXPERT_GENDER == "0"'>
						<input name="gender" type="radio" value="1" /><label>男</label>
						<input name="gender" type="radio" checked="checked" value="0" /><label>女</label>
					</s:if>
					<s:else>
						<input name="gender" type="radio" checked="checked" value="1" /><label>男</label>
						<input name="gender" type="radio" value="0" /><label>女</label>
					</s:else>
				</td>
			</tr>
			<tr>
				<td align="right"><font color="red">*</font>生日：</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="updateExpertLibDto.EXPERT_BIRTH" id="EXPERT_BIRTH" cssStyle="width:270px;" maxlength="20" theme="simple"></s:textfield>
					</div>
					<!--
					<div class="box1_center date_input">
						<input style="width:255px;" type="text" id="tmpEXPERT_BIRTH" disabled="disabled" maxlength="10" value="<s:date name="updateExpertLibDto.EXPERT_BIRTH" format="yyyy-MM-dd" />"/>
						<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('tmpEXPERT_BIRTH'));"></a>
					</div>
					-->
					<div class="box1_right"></div>
				</td>
				<td align="right"><font color="red">*</font>手机：</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="updateExpertLibDto.EXPERT_TEL1" id="EXPERT_TEL1" cssStyle="width:270px;" maxlength="12" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td align="right">固话：</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="updateExpertLibDto.EXPERT_TEL2" id="EXPERT_TEL2" cssStyle="width:270px;" maxlength="12" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
				<td align="right"><font color="red">*</font>就职公司：</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="updateExpertLibDto.EXPERT_COMP" id="EXPERT_COMP" cssStyle="width:270px;" maxlength="40" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td align="right">
					<label class="pdf10"><font color="red">*</font>专业：</label>
				</td>
				<td colspan="3" class="lab15">
					<s:if test='%{updateExpertLibDto.EXPERT_MAJOR.substring(0, 1) == "1"}'>
						<input id="architect" value="1" name="major" type="checkbox" checked="checked"/>建筑　
					</s:if>
					<s:else>
						<input id="architect" value="1" name="major" type="checkbox"/>建筑　
					</s:else>
					<s:if test='%{updateExpertLibDto.EXPERT_MAJOR.substring(1, 2) == "2"}'>
						<input name="major" value="2" type="checkbox" checked="checked"/>结构　
					</s:if>
					<s:else>
						<input name="major" value="2" type="checkbox"/>结构　
					</s:else>
					<s:if test='%{updateExpertLibDto.EXPERT_MAJOR.substring(2, 3) == "3"}'>
						<input name="major" value="3" type="checkbox" checked="checked"/>给排水　
					</s:if>
					<s:else>
						<input name="major" value="3" type="checkbox"/>给排水　
					</s:else>
					<s:if test='%{updateExpertLibDto.EXPERT_MAJOR.substring(3, 4) == "4"}'>
						<input name="major" value="4" type="checkbox" checked="checked"/>电气　
					</s:if>
					<s:else>
						<input name="major" value="4" type="checkbox"/>电气　
					</s:else>
					<s:if test='%{updateExpertLibDto.EXPERT_MAJOR.substring(4, 5) == "5"}'>
						<input name="major" value="5" type="checkbox" checked="checked"/>环控　
					</s:if>
					<s:else>
						<input name="major" value="5" type="checkbox"/>环控　
					</s:else>
					<s:if test='%{updateExpertLibDto.EXPERT_MAJOR.substring(5, 6) == "6"}'>
						<input name="major" value="6" type="checkbox" checked="checked"/>车辆机械　
					</s:if>
					<s:else>
						<input name="major" value="6" type="checkbox"/>车辆机械　
					</s:else>
					<s:if test='%{updateExpertLibDto.EXPERT_MAJOR.substring(6, 7) == "7"}'>
						<input name="major" value="7" type="checkbox" checked="checked"/>车辆电气　
					</s:if>
					<s:else>
						<input name="major" value="7" type="checkbox"/>车辆电气　
					</s:else>
					<s:if test='%{updateExpertLibDto.EXPERT_MAJOR.substring(7, 8) == "8"}'>
						<input name="major" value="8" type="checkbox" checked="checked"/>智能化　
					</s:if>
					<s:else>
						<input name="major" value="8" type="checkbox"/>智能化　
					</s:else>
					<s:if test='%{updateExpertLibDto.EXPERT_MAJOR.substring(8, 9) == "9"}'>
						<input name="major" value="9" type="checkbox" checked="checked"/>其他
					</s:if>
					<s:else>
						<input name="major" value="9" type="checkbox"/>其他
					</s:else>
				</td>
			</tr>
			<tr>
				<td></td>
				<td colspan="3" class="lab15">
					<s:if test='%{updateExpertLibDto.EXPERT_MAJOR.substring(9, 10) == "A"}'>
						<input name="major" value="A" type="checkbox" checked="checked"/>管线　
					</s:if>
					<s:else>
						<input name="major" value="A" type="checkbox"/>管线　
					</s:else>
					<s:if test='%{updateExpertLibDto.EXPERT_MAJOR.substring(10, 11) == "B"}'>
						<input name="major" value="B" type="checkbox" checked="checked"/>市政/交通　
					</s:if>
					<s:else>
						<input name="major" value="B" type="checkbox"/>市政/交通　
					</s:else>
					<s:if test='%{updateExpertLibDto.EXPERT_MAJOR.substring(11, 12) == "C"}'>
						<input name="major" value="C" type="checkbox" checked="checked"/>绿化　
					</s:if>
					<s:else>
						<input name="major" value="C" type="checkbox"/>绿化　
					</s:else>
					<s:if test='%{updateExpertLibDto.EXPERT_MAJOR.substring(12, 13) == "D"}'>
						<input name="major" value="D" type="checkbox" checked="checked"/>轨道　
					</s:if>
					<s:else>
						<input name="major" value="D" type="checkbox"/>轨道　
					</s:else>
					<s:if test='%{updateExpertLibDto.EXPERT_MAJOR.substring(13, 14) == "E"}'>
						<input name="major" value="E" type="checkbox" checked="checked"/>监测　
					</s:if>
					<s:else>
						<input name="major" value="E" type="checkbox"/>监测　
					</s:else>
					<s:if test='%{updateExpertLibDto.EXPERT_MAJOR.substring(14, 15) == "F"}'>
						<input name="major" value="F" type="checkbox" checked="checked"/>商务　
					</s:if>
					<s:else>
						<input name="major" value="F" type="checkbox"/>商务　
					</s:else>
				</td>
			</tr>
			<tr>
				<td align="right"><font color="red">*</font>职称：</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="updateExpertLibDto.EXPERT_QULI" id="EXPERT_QULI" cssStyle="width:450px;" maxlength="40" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td align="right">备注</td>
				<td colspan="3">
					<textarea id="tmpMEMO1" name="" cols="" rows="5" style="width:450px;"><s:property value="updateExpertLibDto.MEMO1"/></textarea>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="3">
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
