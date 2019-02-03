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
<title>专家信息更新</title>
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
	function upd() {
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
		document.mainform.action = '<c:url value="/expertlib/updExpertLibAction.action"></c:url>';
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
							child.attr("disabled", true);
						}
						//重新赋值
						var selObj = $("#" + "tmpMajor" + i + jj);
						selObj.attr("disabled", false);
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
	
	function goExpertList() {
		document.mainform.action = '<c:url value="/expertlib/queryExpertLibList.action"></c:url>';
		document.mainform.submit();
	}
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<s:form id="mainform" name="mainform" method="POST" theme="simple">
			<s:hidden name="updateExpertLibDto.EXPERT_GENDER" id="EXPERT_GENDER"/>
			<s:hidden name="updateExpertLibDto.EXPERT_BIRTH" id="EXPERT_BIRTH"/>
			<s:hidden name="updateExpertLibDto.EXPERT_MAJOR" id="EXPERT_MAJOR"/>
			<s:hidden name="updateExpertLibDto.MEMO1" id="MEMO1"/>
			
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
								<h5>专家信息更新</h5>
								<div class="row">
									<label class="col-lg-2 form-label">专家姓名</label>
									<div class="col-lg-4">
										<s:textfield name="updateExpertLibDto.EXPERT_NAME" id="EXPERT_NAME" cssClass="form-control" maxlength="24" theme="simple"></s:textfield>
									</div>
									<label class="col-lg-2 form-label">性别</label>
									<div class="col-lg-4">
										<s:if test='updateExpertLibDto.EXPERT_GENDER == "0"'>
											<input name="gender" type="radio" value="1" /><label>男</label>
											<input name="gender" type="radio" checked="checked" value="0" /><label>女</label>
										</s:if>
										<s:else>
											<input name="gender" type="radio" checked="checked" value="1" /><label>男</label>
											<input name="gender" type="radio" value="0" /><label>女</label>
										</s:else>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">生日</label>
									<div class="col-lg-4">
										<div class="input-group date" data-provide="datepicker">
											<input id="tmpEXPERT_BIRTH" value="<s:date name="updateExpertLibDto.EXPERT_BIRTH" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
									<label class="col-lg-2 form-label">手机</label>
									<div class="col-lg-4">
										<s:textfield name="updateExpertLibDto.EXPERT_TEL1" id="EXPERT_TEL1" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">固话</label>
									<div class="col-lg-4">
										<s:textfield name="updateExpertLibDto.EXPERT_TEL2" id="EXPERT_TEL2" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
									</div>
									<label class="col-lg-2 form-label">就职公司</label>
									<div class="col-lg-4">
										<s:textfield name="updateExpertLibDto.EXPERT_COMP" id="EXPERT_COMP" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">专业</label>
									<div class="col-lg-10">
										<table align="center">
											<tr>
												<td width="270" align="center">一级</td>
												<td width="270" align="center">二级</td>
												<td width="270" align="center">三级</td>
												<td width="270" align="center">四级</td>
											</tr>
											<tr height="40">
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor11" class="form-control" onchange="selectMajor('1', '1');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major11List" value="major11List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major11List[#st1.index].MAJORCODE == strMajor11}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor12" class="form-control" <s:if test="major12List == null || major12List.size() == 0">disabled</s:if> onchange="selectMajor('1', '2');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major12List" value="major12List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major12List[#st1.index].MAJORCODE == strMajor12}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor13" class="form-control" <s:if test="major13List == null || major13List.size() == 0">disabled</s:if> onchange="selectMajor('1', '3');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major13List" value="major13List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major13List[#st1.index].MAJORCODE == strMajor13}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor14" class="form-control" <s:if test="major14List == null || major14List.size() == 0">disabled</s:if> onchange="selectMajor('1', '4');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major14List" value="major14List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major14List[#st1.index].MAJORCODE == strMajor14}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
											</tr>
											<s:if test="major11List != null && major11List.size() > 1">
											<tr height="40">
											</s:if>
											<s:else>
											<tr height="40" style="display: none;">
											</s:else>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor21" class="form-control" onchange="selectMajor('2', '1');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major21List" value="major21List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major21List[#st1.index].MAJORCODE == strMajor21}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor22" class="form-control" <s:if test="major22List == null || major22List.size() == 0">disabled</s:if> onchange="selectMajor('2', '2');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major22List" value="major22List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major22List[#st1.index].MAJORCODE == strMajor22}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor23" class="form-control" <s:if test="major23List == null || major23List.size() == 0">disabled</s:if> onchange="selectMajor('2', '3');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major23List" value="major23List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major23List[#st1.index].MAJORCODE == strMajor23}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor24" class="form-control" <s:if test="major24List == null || major24List.size() == 0">disabled</s:if> onchange="selectMajor('2', '4');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major24List" value="major24List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major24List[#st1.index].MAJORCODE == strMajor24}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
											</tr>
											<s:if test="major11List != null && major11List.size() > 2">
											<tr height="40">
											</s:if>
											<s:else>
											<tr height="40" style="display: none;">
											</s:else>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor31" class="form-control" onchange="selectMajor('3', '1');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major31List" value="major31List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major31List[#st1.index].MAJORCODE == strMajor31}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor32" class="form-control" <s:if test="major32List == null || major32List.size() == 0">disabled</s:if> onchange="selectMajor('3', '2');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major32List" value="major32List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major32List[#st1.index].MAJORCODE == strMajor32}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor33" class="form-control" <s:if test="major33List == null || major33List.size() == 0">disabled</s:if> onchange="selectMajor('3', '3');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major33List" value="major33List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major33List[#st1.index].MAJORCODE == strMajor33}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor34" class="form-control" <s:if test="major34List == null || major34List.size() == 0">disabled</s:if> onchange="selectMajor('3', '4');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major34List" value="major34List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major34List[#st1.index].MAJORCODE == strMajor34}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
											</tr>
											<s:if test="major11List != null && major11List.size() > 3">
											<tr height="40">
											</s:if>
											<s:else>
											<tr height="40" style="display: none;">
											</s:else>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor41" class="form-control" onchange="selectMajor('4', '1');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major41List" value="major41List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major41List[#st1.index].MAJORCODE == strMajor41}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor42" class="form-control" <s:if test="major42List == null || major42List.size() == 0">disabled</s:if> onchange="selectMajor('4', '2');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major42List" value="major42List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major42List[#st1.index].MAJORCODE == strMajor42}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor43" class="form-control" <s:if test="major43List == null || major43List.size() == 0">disabled</s:if> onchange="selectMajor('4', '3');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major43List" value="major43List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major43List[#st1.index].MAJORCODE == strMajor43}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor44" class="form-control" <s:if test="major44List == null || major44List.size() == 0">disabled</s:if> onchange="selectMajor('4', '4');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major44List" value="major44List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major44List[#st1.index].MAJORCODE == strMajor44}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
											</tr>
											<s:if test="major11List != null && major11List.size() > 4">
											<tr height="40">
											</s:if>
											<s:else>
											<tr height="40" style="display: none;">
											</s:else>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor51" class="form-control" onchange="selectMajor('5', '1');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major51List" value="major51List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major51List[#st1.index].MAJORCODE == strMajor51}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor52" class="form-control" <s:if test="major52List == null || major52List.size() == 0">disabled</s:if> onchange="selectMajor('5', '2');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major52List" value="major52List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major52List[#st1.index].MAJORCODE == strMajor52}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor53" class="form-control" <s:if test="major53List == null || major53List.size() == 0">disabled</s:if> onchange="selectMajor('5', '3');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major53List" value="major53List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major53List[#st1.index].MAJORCODE == strMajor53}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
												<td>
													<div class="col-lg-12">
														<select id="tmpMajor54" class="form-control" <s:if test="major54List == null || major54List.size() == 0">disabled</s:if> onchange="selectMajor('5', '4');">
															<option value="" selected="selected">请选择</option>
															<s:iterator id="major54List" value="major54List" status="st1">
																<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major54List[#st1.index].MAJORCODE == strMajor54}'>selected</s:if>><s:property value="MAJORNAME"/></option>
															</s:iterator>
														</select>
													</div>
												</td>
											</tr>
										</table>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">职称</label>
									<div class="col-lg-4">
										<s:textfield name="updateExpertLibDto.EXPERT_QULI" id="EXPERT_QULI" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-2 form-label">备注</label>
									<div class="col-lg-8">
										<textarea name="" id="tmpMEMO1" cols="" rows="5" class="form-control"><s:property value="updateExpertLibDto.MEMO1"/></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="operationBtns addBtns mgt15 btn3">
						<button type="button" class="btn btn-success" onclick="upd();">修改</button>
						<button type="button" class="btn btn-success" onclick="goExpertList();">返回</button>
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
		"autoclose":true,"format":"yyyy-mm-dd","language":"zh-CN","daysOfWeekHighlighted":"[0,6]",clearBtn: true
	});
</script>
</body>
</html>
