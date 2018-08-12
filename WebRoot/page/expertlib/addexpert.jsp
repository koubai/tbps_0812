<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base target="_self"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Calendar3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<title>专家信息输入</title>
<script type="text/javascript">
	function add() {
		//获得专业信息
		setmajor();
		var EXPERT_NAME = $("#EXPERT_NAME").val().trim();
		var gender = getGender();
//		var EXPERT_BIRTH = $("#EXPERT_BIRTH").val().trim();
		$("#EXPERT_BIRTH").attr("value", document.getElementById("tmpEXPERT_BIRTH").value);
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
/*		if(EXPERT_BIRTH == "") {
			alert("生日不能为空！");
			$("#EXPERT_BIRTH").focus();
			return;
		}*/
		
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
		if(EXPERT_MAJOR == "") {
			alert("请选择专业！");
			$("#tmpMajor11").focus();
			return;
		}
		if(EXPERT_QULI == "") {
			alert("职称不能为空！");
			$("#EXPERT_QULI").focus();
			return;
		}
		$("#EXPERT_GENDER").attr("value", gender);
		document.mainform.action = '<c:url value="/expertlib/addExpertLibAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//设置专业
	function setmajor() {
		var major = "";
		for(var i = 1; i <= 5; i++) {
			for(var j = 4; j >= 1; j--) {
				var vv = $("#" + "tmpMajor" + i + j).val();
				if(vv != "") {
					major += vv + ",";
					break;
				}
			}
		}
		
		for(var i = 1; i <= 5; i++) {
			for(var j = 4; j >= 1; j--) {
				var vv = $("#" + "tmpMajor" + i + j).val();
				if(vv != "") {
					$("#" + "strMajor" + i + j).val(vv);
				}
			}
		}
		
		if(major != "") {
			$("#EXPERT_MAJOR").attr("value", "," + major);
		} else {
			$("#EXPERT_MAJOR").attr("value", "");
		}
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
	
	function selectMajor(i, j) {
		var vv = $("#" + "tmpMajor" + i + j).val();
		//AJAX加载子专业（暂时只保留1-4列）
		if(j != "4") {
			var jj = parseInt(j) + 1;
			if(vv != "") {
				$.ajax({
					url:'<%=request.getContextPath()%>/expertlib/queryChildExpertLibByParentid.action',
					type:"GET",
					dataType:"json",
					data:{
						"strParentMajorType":jj,
						"strParentMajorCode":vv
					},
					success:function(data) {
						//对于子节点，先清空所有子节点数据
						for(var k = jj; k <= 4; k++) {
							var child = $("#" + "tmpMajor" + i + k);
							child.empty();
							$("<option value=''>" + '请选择' + "</option>").appendTo(child);
							child.attr("disabled", "disabled");
						}
						//重新赋值
						var selObj = $("#" + "tmpMajor" + i + jj);
						selObj.attr("disabled", "");
						selObj.empty();
						$("<option value=''>" + '请选择' + "</option>").appendTo(selObj);
						$.each(data, function(i, n){
							$("<option value='"+ n.MAJORCODE +"'>"+ n.MAJORNAME +"</option>").appendTo(selObj);
						});
					}
				});
			} else {
				//对于子节点，先清空所有子节点数据
				for(var k = jj; k <= 4; k++) {
					var child = $("#" + "tmpMajor" + i + k);
					child.empty();
					$("<option value=''>" + '请选择' + "</option>").appendTo(child);
					child.attr("disabled", "disabled");
				}
			}
		}
	}
	
	//页面关闭响应
	window.onunload = function() {
		//刷新父页面
		window.dialogArguments.document.mainform.action = '<c:url value="/expertlib/queryExpertLibList.action"></c:url>';
		window.dialogArguments.document.mainform.submit();
	};

</script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:scroll;">
<s:form id="mainform" name="mainform" method="POST">
	<s:hidden name="addExpertLibDto.EXPERT_GENDER" id="EXPERT_GENDER"/>
	<s:hidden name="addExpertLibDto.EXPERT_BIRTH" id="EXPERT_BIRTH"/>
	<s:hidden name="addExpertLibDto.EXPERT_MAJOR" id="EXPERT_MAJOR"/>
	<s:hidden name="addExpertLibDto.MEMO1" id="MEMO1"/>
	
	<s:hidden name="strMajor11" id="strMajor11"/>
	<s:hidden name="strMajor12" id="strMajor12"/>
	<s:hidden name="strMajor13" id="strMajor13"/>
	<s:hidden name="strMajor14" id="strMajor14"/>
	<s:hidden name="strMajor15" id="strMajor15"/>
	<s:hidden name="strMajor21" id="strMajor21"/>
	<s:hidden name="strMajor22" id="strMajor22"/>
	<s:hidden name="strMajor23" id="strMajor23"/>
	<s:hidden name="strMajor24" id="strMajor24"/>
	<s:hidden name="strMajor25" id="strMajor25"/>
	<s:hidden name="strMajor31" id="strMajor31"/>
	<s:hidden name="strMajor32" id="strMajor32"/>
	<s:hidden name="strMajor33" id="strMajor33"/>
	<s:hidden name="strMajor34" id="strMajor34"/>
	<s:hidden name="strMajor35" id="strMajor35"/>
	<s:hidden name="strMajor41" id="strMajor41"/>
	<s:hidden name="strMajor42" id="strMajor42"/>
	<s:hidden name="strMajor43" id="strMajor43"/>
	<s:hidden name="strMajor44" id="strMajor44"/>
	<s:hidden name="strMajor45" id="strMajor45"/>
	<s:hidden name="strMajor51" id="strMajor51"/>
	<s:hidden name="strMajor52" id="strMajor52"/>
	<s:hidden name="strMajor53" id="strMajor53"/>
	<s:hidden name="strMajor54" id="strMajor54"/>
	<s:hidden name="strMajor55" id="strMajor55"/>
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
						<s:textfield name="addExpertLibDto.EXPERT_NAME" id="EXPERT_NAME" cssStyle="width:270px;" maxlength="24" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
				<td align="right"><font color="red">*</font>性别：</td>
				<td>
					<s:if test='addExpertLibDto.EXPERT_GENDER == "0"'>
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
				<td align="right"><font color="red"></font>生日：</td>
				<td>
					<!--
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addExpertLibDto.EXPERT_BIRTH" id="EXPERT_BIRTH" cssStyle="width:270px;" maxlength="20" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
					-->
					<div class="box1_left"></div>
					<div class="box1_center date_input">
						<input style="width:255px;" type="text" id="tmpEXPERT_BIRTH" disabled="disabled" maxlength="10" value="<s:date name="addExpertLibDto.EXPERT_BIRTH" format="yyyy-MM-dd" />"/>
						<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('tmpEXPERT_BIRTH'));"></a>
					</div>
					<div class="box1_right"></div>
				</td>
				<td align="right"><font color="red">*</font>手机：</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addExpertLibDto.EXPERT_TEL1" id="EXPERT_TEL1" cssStyle="width:270px;" maxlength="12" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td align="right">固话：</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addExpertLibDto.EXPERT_TEL2" id="EXPERT_TEL2" cssStyle="width:270px;" maxlength="12" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
				<td align="right"><font color="red">*</font>就职公司：</td>
				<td>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addExpertLibDto.EXPERT_COMP" id="EXPERT_COMP" cssStyle="width:270px;" maxlength="40" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td align="right">
					<label class="pdf10"><font color="red">*</font>专业：</label>
				</td>
				<td colspan="3" class="lab15">
					<table>
						<tr>
							<td width="170" align="center">一级</td>
							<td width="170" align="center">二级</td>
							<td width="170" align="center">三级</td>
							<td width="170" align="center">四级</td>
						</tr>
						<tr>
							<td>
								<select id="tmpMajor11" style="width: 145px;" onchange="selectMajor('1', '1');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major11List" value="major11List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major11List[#st1.index].MAJORCODE == strMajor11}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<select id="tmpMajor12" style="width: 145px;" <s:if test="major12List == null || major12List.size() == 0">disabled</s:if> onchange="selectMajor('1', '2');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major12List" value="major12List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major12List[#st1.index].MAJORCODE == strMajor12}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<select id="tmpMajor13" style="width: 145px;" <s:if test="major13List == null || major13List.size() == 0">disabled</s:if> onchange="selectMajor('1', '3');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major13List" value="major13List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major13List[#st1.index].MAJORCODE == strMajor13}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<select id="tmpMajor14" style="width: 145px;" <s:if test="major14List == null || major14List.size() == 0">disabled</s:if> onchange="selectMajor('1', '4');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major14List" value="major14List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major14List[#st1.index].MAJORCODE == strMajor14}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
						</tr>
						<s:if test="major11List != null && major11List.size() > 1">
						<tr>
						</s:if>
						<s:else>
						<tr style="display: none;">
						</s:else>
							<td>
								<select id="tmpMajor21" style="width: 145px;" onchange="selectMajor('2', '1');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major21List" value="major21List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major21List[#st1.index].MAJORCODE == strMajor21}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<select id="tmpMajor22" style="width: 145px;" <s:if test="major22List == null || major22List.size() == 0">disabled</s:if> onchange="selectMajor('2', '2');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major22List" value="major22List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major22List[#st1.index].MAJORCODE == strMajor22}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<select id="tmpMajor23" style="width: 145px;" <s:if test="major23List == null || major23List.size() == 0">disabled</s:if> onchange="selectMajor('2', '3');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major23List" value="major23List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major23List[#st1.index].MAJORCODE == strMajor23}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<select id="tmpMajor24" style="width: 145px;" <s:if test="major24List == null || major24List.size() == 0">disabled</s:if> onchange="selectMajor('2', '4');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major24List" value="major24List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major24List[#st1.index].MAJORCODE == strMajor24}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
						</tr>
						<s:if test="major11List != null && major11List.size() > 2">
						<tr>
						</s:if>
						<s:else>
						<tr style="display: none;">
						</s:else>
							<td>
								<select id="tmpMajor31" style="width: 145px;" onchange="selectMajor('3', '1');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major31List" value="major31List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major31List[#st1.index].MAJORCODE == strMajor31}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<select id="tmpMajor32" style="width: 145px;" <s:if test="major32List == null || major32List.size() == 0">disabled</s:if> onchange="selectMajor('3', '2');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major32List" value="major32List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major32List[#st1.index].MAJORCODE == strMajor32}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<select id="tmpMajor33" style="width: 145px;" <s:if test="major33List == null || major33List.size() == 0">disabled</s:if> onchange="selectMajor('3', '3');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major33List" value="major33List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major33List[#st1.index].MAJORCODE == strMajor33}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<select id="tmpMajor34" style="width: 145px;" <s:if test="major34List == null || major34List.size() == 0">disabled</s:if> onchange="selectMajor('3', '4');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major34List" value="major34List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major34List[#st1.index].MAJORCODE == strMajor34}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
						</tr>
						<s:if test="major11List != null && major11List.size() > 3">
						<tr>
						</s:if>
						<s:else>
						<tr style="display: none;">
						</s:else>
							<td>
								<select id="tmpMajor41" style="width: 145px;" onchange="selectMajor('4', '1');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major41List" value="major41List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major41List[#st1.index].MAJORCODE == strMajor41}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<select id="tmpMajor42" style="width: 145px;" <s:if test="major42List == null || major42List.size() == 0">disabled</s:if> onchange="selectMajor('4', '2');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major42List" value="major42List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major42List[#st1.index].MAJORCODE == strMajor42}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<select id="tmpMajor43" style="width: 145px;" <s:if test="major43List == null || major43List.size() == 0">disabled</s:if> onchange="selectMajor('4', '3');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major43List" value="major43List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major43List[#st1.index].MAJORCODE == strMajor43}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<select id="tmpMajor44" style="width: 145px;" <s:if test="major44List == null || major44List.size() == 0">disabled</s:if> onchange="selectMajor('4', '4');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major44List" value="major44List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major44List[#st1.index].MAJORCODE == strMajor44}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
						</tr>
						<s:if test="major11List != null && major11List.size() > 4">
						<tr>
						</s:if>
						<s:else>
						<tr style="display: none;">
						</s:else>
							<td>
								<select id="tmpMajor51" style="width: 145px;" onchange="selectMajor('5', '1');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major51List" value="major51List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major51List[#st1.index].MAJORCODE == strMajor51}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<select id="tmpMajor52" style="width: 145px;" <s:if test="major52List == null || major52List.size() == 0">disabled</s:if> onchange="selectMajor('5', '2');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major52List" value="major52List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major52List[#st1.index].MAJORCODE == strMajor52}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<select id="tmpMajor53" style="width: 145px;" <s:if test="major53List == null || major53List.size() == 0">disabled</s:if> onchange="selectMajor('5', '3');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major53List" value="major53List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major53List[#st1.index].MAJORCODE == strMajor53}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<select id="tmpMajor54" style="width: 145px;" <s:if test="major54List == null || major54List.size() == 0">disabled</s:if> onchange="selectMajor('5', '4');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major54List" value="major54List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major54List[#st1.index].MAJORCODE == strMajor54}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right"><font color="red">*</font>职称：</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addExpertLibDto.EXPERT_QULI" id="EXPERT_QULI" cssStyle="width:450px;" maxlength="40" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td align="right">备注</td>
				<td colspan="3">
					<textarea id="tmpMEMO1" name="" cols="" rows="5" style="width:450px;"><s:property value="addExpertLibDto.MEMO1"/></textarea>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="3">
					<div class="btn">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input class="input80" type="button" value="追加" onclick="add();"/>
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
