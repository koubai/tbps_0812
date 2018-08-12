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
<title>专家信息查询</title>
<script type="text/javascript">
	$(function() {
	});
	
	//添加评审专家
	function addBidExpert() {
		//清空父页面专家数据
		/* var bidExportData = window.dialogArguments.document.getElementById("bidExportData");
		var childs = bidExportData.childNodes;
		for(var a = childs.length - 1; a >= 0; a--) {
			bidExportData.removeChild(childs[a]);
		} */
		
		var strIsRandom = $("#strIsRandom").val();
		var ids = window.dialogArguments.document.getElementById("BID_EXPERT_LIST").value;
		
		//添加专家
		var obj = null;
		var id = "";
		var list = document.getElementsByName("radioKey");
		if(list.length == 0) {
			alert("专家为空，请重新查询！");
			return;
		}
		
		if(strIsRandom != "1") {
			var b = false;
			//非随机抽取，则必须选择专家
			for(var i = 0; i < list.length; i++) {
				obj = list[i];
				if(list[i].checked) {
					b = true;
					break;
				}
			}
			if(!b) {
				alert("请选择一个专家！");
				return;
			}
		}
		
		for(var i = 0; i < list.length; i++) {
			obj = list[i];
			id = list[i].value;
			//若不是随机抽取，则必须自己选择专家
			if(strIsRandom != "1") {
				//当前记录未被选中，则不添加到专家列表中
				if(!list[i].checked) {
					continue;
				}
			}
			//添加评审专家信息
			var tr = obj.parentNode.parentNode;
			var tds = tr.getElementsByTagName("td");
			var inputs = tds[0].getElementsByTagName("input");
			
			var td0 = window.dialogArguments.document.createElement("td");
			td0.style.display = "none";
			var tr = window.dialogArguments.document.createElement("tr");
			tr.appendChild(td0);
			var td = window.dialogArguments.document.createElement("td");
			//单选框
			var radio = window.dialogArguments.document.createElement("input");
			radio.name = "bidExpertRadio";
			radio.type = "radio";
			radio.value = id;
			td.appendChild(radio);
			tr.appendChild(td);
			//
			td = createTd("");
			td.style.display = "none";
			tr.appendChild(td);
			//var input = createHidden("");
			//td0.appendChild(input);
			//
			td = createTd(inputs[0].value);
			tr.appendChild(td);
			var input = createHidden(inputs[0].value);
			td0.appendChild(input);
			//
			td = createTd(inputs[1].value);
			tr.appendChild(td);
			var input = createHidden(inputs[1].value);
			td0.appendChild(input);
			//
			td = createTd(inputs[2].value);
			tr.appendChild(td);
			var input = createHidden(inputs[2].value);
			td0.appendChild(input);
			//
			td = createTd(inputs[3].value);
			tr.appendChild(td);
			var input = createHidden(inputs[3].value);
			td0.appendChild(input);
			//
			td = createTd(inputs[4].value);
			tr.appendChild(td);
			var input = createHidden(inputs[4].value);
			td0.appendChild(input);
			//
			td = createTd(inputs[5].value);
			tr.appendChild(td);
			var input = createHidden(inputs[5].value);
			td0.appendChild(input);
			//EXPERT_MAJOR
			//td = createTd(inputs[6].value);
			//tr.appendChild(td);
			var input = createHidden(inputs[6].value);
			td0.appendChild(input);
			var idstmp = "," + ids;
			if(idstmp.indexOf("," + id + ",") == -1){
				ids += id + ",";
				window.dialogArguments.document.getElementById("bidExportData").appendChild(tr);
			}
			
		}
		//专家ID
		window.dialogArguments.document.getElementById("BID_EXPERT_LIST").value = ids;
		//刷新父页面斑马线
		refreshParentBidExpertData();
		window.close();
	}
	
	function addBidExpertNew() {
		var bidExportData = window.dialogArguments.document.getElementById("bidExportData");
		var len = window.dialogArguments.document.getElementById("expertTable").childNodes.length;
		var childs = bidExportData.childNodes;
		//清空text节点
		for(var a = childs.length - 1; a >= 0; a--) {
			if(childs[a].nodeType == 3)
				bidExportData.removeChild(childs[a]);
		}
		
		//复制父页面专家数据
		for(var a = 0; a < len; a++) {
			var newRow = childs[a].cloneNode(true);
			bidExportData.appendChild(newRow);
		}
		
		//清空父页面原来的专家数据
		for(var a = len-1; a >= 0; a--) {
			bidExportData.removeChild(childs[a]);
		}
		
		var strIsRandom = $("#strIsRandom").val();
		var ids = window.dialogArguments.document.getElementById("BID_EXPERT_LIST").value;
		//var ids = "";
		
		//添加专家
		var obj = null;
		var id = "";
		var list = document.getElementsByName("radioKey");
		if(list.length == 0) {
			alert("专家为空，请重新查询！");
			return;
		}
		
		if(strIsRandom != "1") {
			var b = false;
			//非随机抽取，则必须选择专家
			for(var i = 0; i < list.length; i++) {
				obj = list[i];
				if(list[i].checked) {
					b = true;
					break;
				}
			}
			if(!b) {
				alert("请选择一个专家！");
				return;
			}
		}
		
		for(var i = 0; i < list.length; i++) {
			obj = list[i];
			id = list[i].value;
			//若不是随机抽取，则必须自己选择专家
			if(strIsRandom != "1") {
				//当前记录未被选中，则不添加到专家列表中
				if(!list[i].checked) {
					continue;
				}
			}
			//添加评审专家信息
			var tr = obj.parentNode.parentNode;
			var tds = tr.getElementsByTagName("td");
			var inputs = tds[0].getElementsByTagName("input");
			
			var td0 = window.dialogArguments.document.createElement("td");
			td0.style.display = "none";
			var tr = window.dialogArguments.document.createElement("tr");
			tr.appendChild(td0);
			var td = window.dialogArguments.document.createElement("td");
			//单选框
			var radio = window.dialogArguments.document.createElement("input");
			radio.name = "bidExpertRadio";
			radio.type = "radio";
			radio.value = id;
			td.appendChild(radio);
			tr.appendChild(td);
			//
			td = createTd("");
			td.style.display = "none";
			tr.appendChild(td);
			//var input = createHidden("");
			//td0.appendChild(input);
			//
			td = createTd(inputs[0].value);
			tr.appendChild(td);
			var input = createHidden(inputs[0].value);
			td0.appendChild(input);
			//
			td = createTd(inputs[1].value);
			tr.appendChild(td);
			var input = createHidden(inputs[1].value);
			td0.appendChild(input);
			//
			td = createTd(inputs[2].value);
			tr.appendChild(td);
			var input = createHidden(inputs[2].value);
			td0.appendChild(input);
			//
			td = createTd(inputs[3].value);
			tr.appendChild(td);
			var input = createHidden(inputs[3].value);
			td0.appendChild(input);
			//
			td = createTd(inputs[4].value);
			tr.appendChild(td);
			var input = createHidden(inputs[4].value);
			td0.appendChild(input);
			//
			td = createTd(inputs[5].value);
			tr.appendChild(td);
			var input = createHidden(inputs[5].value);
			td0.appendChild(input);
			//EXPERT_MAJOR
			//td = createTd(inputs[6].value);
			//tr.appendChild(td);
			var input = createHidden(inputs[6].value);
			td0.appendChild(input);
			var idstmp = "," + ids;
			if(idstmp.indexOf("," + id + ",") == -1){
				ids += id + ",";
				window.dialogArguments.document.getElementById("bidExportData").appendChild(tr);
			}
			
		}
		var childsTmp = window.dialogArguments.document.getElementById("bidExportData").childNodes;
		//专家ID
		window.dialogArguments.document.getElementById("BID_EXPERT_LIST").value = ids;
		//刷新父页面斑马线
		refreshParentBidExpertData();
		window.close();
	}
	
	//刷新投标公司序号和斑马线
	function refreshParentBidExpertData() {
		var rows = window.dialogArguments.document.getElementById("bidExportData").rows;
		for(var i = 0; i < rows.length; i++) {
			var num = i + 1;
			rows[i].cells[2].innerHTML = num;
			//斑马线
			var cls = "";
			if(i % 2 == 0) {
				cls = "tr_bg";
			} else {
				cls = "";
			}
			rows[i].className = cls;
		}
	}
	
	function createTd(s) {
		var td = window.dialogArguments.document.createElement("td");
		td.appendChild(window.dialogArguments.document.createTextNode(s));
		return td;
	}
	
	function createHidden(s) {
		var input = window.dialogArguments.document.createElement("input");
		input.type = "hidden";
		input.value = s;
		return input;
	}
	
	function queryList_old() {
		if($("#strIsRandom").val() == "1") {
			//随机抽取
			var list = document.getElementsByName("major");
			for(var i = 1; i <= list.length; i++) {
				var v = list[i - 1].value;
				if(document.getElementById("major" + v).checked) {
					//验证是否是数字
					var num = $("#" + "tmpmajornum" + v).val();
					if(num == "") {
						$("#" + "tmpmajornum" + v).focus();
						alert("请输入专家个数！");
						return;
					}
					if(!isNumber(num)) {
						$("#" + "tmpmajornum" + v).focus();
						alert("专家个数必须为大于0的数字！");
						return;
					}
				}
			}
		}
		setmajor();
		//document.mainform.action = '<c:url value="/bid/getBidExportActionNew.action"></c:url>';
		//document.mainform.submit();
	}
	
	function queryList() {
		var majorQuery = "";
		//是否随机
		if(document.getElementById("random").checked) {
			//数据验证
			//这里最多只有5行数据
			for(var i = 1; i <= 5; i++) {
				//专家1-4，这里只check所选择最小专业的专家数量是否填写。对于父节点数量可不填
				var check = false;
				for(var j = 4; j >= 1; j--) {
					var vv = $("#" + "tmpMajor" + i + j).val();
					if(vv != "") {
						var num = $("#" + "tmpMajorNum" + i + j).val();
						if(num == "" && !check) {
							$("#" + "tmpMajorNum" + i + j).focus();
							alert("请输入专家个数！");
							return;
						}
						if(num != "" && !isNumber(num)) {
							$("#" + "tmpMajorNum" + i + j).focus();
							alert("专家个数必须为大于0的数字！");
							return;
						}
						check = true;
					} else {
					}
				}
			}
		} else {
			//不随机
		}
		//查询参数
		for(var i = 1; i <= 5; i++) {
			for(var j = 1; j <= 4; j++) {
				var vv = $("#" + "tmpMajor" + i + j).val();
				if(vv != "") {
					var num = $("#" + "tmpMajorNum" + i + j).val();
					$("#" + "majorNum" + i + j).val(num);
					if(num == "") {
						majorQuery += vv + "#" + "0" + ",";
					} else {
						majorQuery += vv + "#" + num + ",";
					}
					$("#" + "strMajor" + i + j).val(vv);
				} else {
					$("#" + "majorNum" + i + j).val("");
					$("#" + "strMajor" + i + j).val(vv);
				}
			}
		}
		
		if(document.getElementById("random").checked) {
			//随机时，专业条件不能为空
			if(majorQuery == "") {
				alert("请选择专业条件！");
				return;
			}
		}
		
		$("#expertMajorQuery").attr("value", majorQuery);
		if(document.getElementById("random").checked) {
			$("#strIsRandom").attr("value", "1");
		} else {
			$("#strIsRandom").attr("value", "0");
		}
		if(document.getElementById("include").checked) {
			$("#strIsInclude").attr("value", "1");
		} else {
			$("#strIsInclude").attr("value", "0");
		}
		$("#strExpertComp").attr("value", $("#tmpExpertComp").val());
		document.mainform.action = '<c:url value="/bid/getBidExportActionNew.action"></c:url>';
		document.mainform.submit();
	}
	
	//设置专业
	function setmajor() {
		var major = "";
		var majorQuery = "";
		//选择的专业
		var list = document.getElementsByName("major");
		for(var i = 1; i < list.length + 1; i++) {
			if(list[i - 1].checked) {
				major += "" + list[i - 1].value;
				majorQuery += "" + list[i - 1].value + ",";
			} else {
				major += "0";
			}
		}
		$("#expertMajor").attr("value", major);
		$("#expertMajorQuery").attr("value", majorQuery);
		
		//专家个数
		for(var i = 1; i <= list.length; i++) {
			var v = list[i - 1].value;
			$("#" + "majornum" + v).attr("value", $("#" + "tmpmajornum" + v).val());
		}
		
		//是否随机
		if(document.getElementById("random").checked) {
			$("#strIsRandom").attr("value", "1");
		} else {
			$("#strIsRandom").attr("value", "0");
		}
	}
	
	function checkMajor(obj) {
		var v = obj.value;
		if($("#strIsRandom").val() == "1") {
			if(obj.checked) {
				$("#" + "tmpmajornum" + v).attr("disabled", "");
			} else {
				$("#" + "tmpmajornum" + v).attr("disabled", "disabled");
				$("#" + "tmpmajornum" + v).attr("value", "");
			}
		}
	}
	
	function isRandom(obj) {
		if(obj.checked) {
			for(var i = 1; i <= 5; i++) {
				for(var j = 1; j <= 4; j++) {
					var vv = $("#" + "tmpMajor" + i + j).val();
					if(vv != "") {
						$("#" + "tmpMajorNum" + i + j).attr("disabled", "");
					}
				}
			}
			document.getElementById("include").checked = false;
			$("#include").attr("disabled", true);
			$("#tmpExpertComp").val("");
			$("#selectExpertComp").attr("disabled", true);
		} else {
			for(var i = 1; i <= 5; i++) {
				for(var j = 1; j <= 4; j++) {
					$("#" + "tmpMajorNum" + i + j).val("");
					$("#" + "tmpMajorNum" + i + j).attr("disabled", "disabled");
				}
			}
			$("#selectExpertComp").attr("disabled", false);
			$("#include").attr("disabled", false);
		}
	}
	
	//就职公司
	function queryExpertComp() {
		var url = '<c:url value="/bid/showSelectExpertCompAction.action"></c:url>';
		url += "?date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function selectMajor(i, j) {
		var vv = $("#" + "tmpMajor" + i + j).val();
		if(vv != "" && document.getElementById("random").checked) {
			$("#" + "tmpMajorNum" + i + j).attr("disabled", "");
		} else {
			$("#" + "tmpMajorNum" + i + j).val("");
			$("#" + "tmpMajorNum" + i + j).attr("disabled", "disabled");
		}
		//AJAX加载子专业（暂时只保留1-4列）
		if(j != "4") {
			var jj = parseInt(j) + 1;
			if(vv != "") {
				$.ajax({
					url:'../expertlib/queryChildExpertLibByParentid.action',
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
							
							$("#" + "tmpMajorNum" + i + k).val("");
							$("#" + "tmpMajorNum" + i + k).attr("disabled", "disabled");
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
					
					$("#" + "tmpMajorNum" + i + k).val("");
					$("#" + "tmpMajorNum" + i + k).attr("disabled", "disabled");
				}
			}
		}
	}
</script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:hidden;">
<s:form id="mainform" name="mainform" method="POST">
	<s:hidden name="expertMajorQuery" id="expertMajorQuery"/>
	<s:hidden name="strIsRandom" id="strIsRandom"/>
	<s:hidden name="strIsInclude" id="strIsInclude"/>
	<s:hidden name="strExpertComp" id="strExpertComp"/>
	<s:hidden name="majorNum11" id="majorNum11"/>
	<s:hidden name="majorNum12" id="majorNum12"/>
	<s:hidden name="majorNum13" id="majorNum13"/>
	<s:hidden name="majorNum14" id="majorNum14"/>
	<s:hidden name="majorNum15" id="majorNum15"/>
	<s:hidden name="majorNum21" id="majorNum21"/>
	<s:hidden name="majorNum22" id="majorNum22"/>
	<s:hidden name="majorNum23" id="majorNum23"/>
	<s:hidden name="majorNum24" id="majorNum24"/>
	<s:hidden name="majorNum25" id="majorNum25"/>
	<s:hidden name="majorNum31" id="majorNum31"/>
	<s:hidden name="majorNum32" id="majorNum32"/>
	<s:hidden name="majorNum33" id="majorNum33"/>
	<s:hidden name="majorNum34" id="majorNum34"/>
	<s:hidden name="majorNum35" id="majorNum35"/>
	<s:hidden name="majorNum41" id="majorNum41"/>
	<s:hidden name="majorNum42" id="majorNum42"/>
	<s:hidden name="majorNum43" id="majorNum43"/>
	<s:hidden name="majorNum44" id="majorNum44"/>
	<s:hidden name="majorNum45" id="majorNum45"/>
	<s:hidden name="majorNum51" id="majorNum51"/>
	<s:hidden name="majorNum52" id="majorNum52"/>
	<s:hidden name="majorNum53" id="majorNum53"/>
	<s:hidden name="majorNum54" id="majorNum54"/>
	<s:hidden name="majorNum55" id="majorNum55"/>
	
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
					专家信息查询
				</div>
				<div class="tittle_right">
				</div>
			</div>
		</div>
		<div class="searchbox" style="height: 35px;">
			<div class="searchbox" style="height: 35px;">
				<div class="box1">
					<label class="pdf10">&nbsp;&nbsp;&nbsp;</label>
					<div style="margin-top: 5px; width: 160px;">
						<s:if test='strIsRandom == "1"'>
							<input id="random" type="checkbox" checked="checked" onclick="isRandom(this);"/>随机
						</s:if>
						<s:else>
							<input id="random" type="checkbox" onclick="isRandom(this);"/>随机
						</s:else>
					</div>
				</div>
				<div class="box1">
					<label class="pdf10">专家姓名</label>
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="strExpertName" id="strExpertName" cssClass="input80" cssStyle="width: 120px;" maxlength="20" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</div>
			</div>
			<div class="searchbox" style="height: 35px;">
				<div class="box1">
					<label class="pdf10">&nbsp;&nbsp;&nbsp;</label>
					<div style="margin-top: 5px; width: 160px;">
						<s:if test='strIsRandom == "1"'>
							<input id="include" type="checkbox" disabled="disabled" />不包含
						</s:if>
						<s:else>
							<s:if test='strIsInclude == "1"'>
								<input id="include" type="checkbox" checked="checked"/>不包含
							</s:if>
							<s:else>
								<input id="include" type="checkbox"/>不包含
							</s:else>
						</s:else>
					</div>
				</div>
				<div class="box1">
					<label class="pdf10">单位选择</label>
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="tmpExpertComp" disabled="disabled" maxlength="4" style="width:300px;" value="<s:property value="strExpertComp" />" />
					</div>
					<div class="box1_right"></div>
				</div>
				<div class="btn" style="margin-left: 5px;">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:if test='strIsRandom == "1"'>
							<input id="selectExpertComp" type="button" disabled="disabled" class="input80" value="选择" onclick="queryExpertComp();"/>
						</s:if>
						<s:else>
							<input id="selectExpertComp" type="button" class="input80" value="选择" onclick="queryExpertComp();"/>
						</s:else>
					</div>
					<div class="box1_right"></div>
				</div>
			</div>
			<div class="searchbox" style="height: 35px;">
				<div class="box1" style="margin-left: 40px;">
					<label class="pdf10">专业：</label>
				</div>
				<div class="btn" style="margin-left: 450px;">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="button" class="input80" value="查询" onclick="queryList();"/>
					</div>
					<div class="box1_right"></div>
				</div>
				<div class="box1">
					<table style="background:#F3F3F3; width: 100%;">
						<tr>
							<td width="150" align="center">一级</td>
							<td width="40" align="center">人数</td>
							<td width="150" align="center">二级</td>
							<td width="40" align="center">人数</td>
							<td width="150" align="center">三级</td>
							<td width="40" align="center">人数</td>
							<td width="150" align="center">四级</td>
							<td width="40" align="center">人数</td>
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
								<s:if test='strIsRandom == "1" && strMajor11 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum11" value="<s:property value="majorNum11"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum11" disabled="disabled" value=""/>
								</s:else>
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
								<s:if test='strIsRandom == "1" && strMajor12 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum12" value="<s:property value="majorNum12"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum12" disabled="disabled" value=""/>
								</s:else>
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
								<s:if test='strIsRandom == "1" && strMajor13 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum13" value="<s:property value="majorNum13"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum13" disabled="disabled" value=""/>
								</s:else>
							</td>
							<td>
								<select id="tmpMajor14" style="width: 145px;" <s:if test="major14List == null || major14List.size() == 0">disabled</s:if> onchange="selectMajor('1', '4');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major14List" value="major14List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major14List[#st1.index].MAJORCODE == strMajor14}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<s:if test='strIsRandom == "1" && strMajor14 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum14" value="<s:property value="majorNum14"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum14" disabled="disabled" value=""/>
								</s:else>
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
								<s:if test='strIsRandom == "1" && strMajor21 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum21" value="<s:property value="majorNum21"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum21" disabled="disabled" value=""/>
								</s:else>
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
								<s:if test='strIsRandom == "1" && strMajor22 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum22" value="<s:property value="majorNum22"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum22" disabled="disabled" value=""/>
								</s:else>
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
								<s:if test='strIsRandom == "1" && strMajor23 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum23" value="<s:property value="majorNum23"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum23" disabled="disabled" value=""/>
								</s:else>
							</td>
							<td>
								<select id="tmpMajor24" style="width: 145px;" <s:if test="major24List == null || major24List.size() == 0">disabled</s:if> onchange="selectMajor('2', '4');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major24List" value="major24List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major24List[#st1.index].MAJORCODE == strMajor24}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<s:if test='strIsRandom == "1" && strMajor24 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum24" value="<s:property value="majorNum24"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum24" disabled="disabled" value=""/>
								</s:else>
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
								<s:if test='strIsRandom == "1" && strMajor31 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum31" value="<s:property value="majorNum31"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum31" disabled="disabled" value=""/>
								</s:else>
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
								<s:if test='strIsRandom == "1" && strMajor32 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum32" value="<s:property value="majorNum32"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum32" disabled="disabled" value=""/>
								</s:else>
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
								<s:if test='strIsRandom == "1" && strMajor33 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum33" value="<s:property value="majorNum33"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum33" disabled="disabled" value=""/>
								</s:else>
							</td>
							<td>
								<select id="tmpMajor34" style="width: 145px;" <s:if test="major34List == null || major34List.size() == 0">disabled</s:if> onchange="selectMajor('3', '4');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major34List" value="major34List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major34List[#st1.index].MAJORCODE == strMajor34}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<s:if test='strIsRandom == "1" && strMajor34 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum34" value="<s:property value="majorNum34"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum34" disabled="disabled" value=""/>
								</s:else>
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
								<s:if test='strIsRandom == "1" && strMajor41 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum41" value="<s:property value="majorNum41"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum41" disabled="disabled" value=""/>
								</s:else>
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
								<s:if test='strIsRandom == "1" && strMajor42 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum42" value="<s:property value="majorNum42"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum42" disabled="disabled" value=""/>
								</s:else>
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
								<s:if test='strIsRandom == "1" && strMajor43 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum43" value="<s:property value="majorNum43"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum43" disabled="disabled" value=""/>
								</s:else>
							</td>
							<td>
								<select id="tmpMajor44" style="width: 145px;" <s:if test="major44List == null || major44List.size() == 0">disabled</s:if> onchange="selectMajor('4', '4');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major44List" value="major44List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major44List[#st1.index].MAJORCODE == strMajor44}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<s:if test='strIsRandom == "1" && strMajor44 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum44" value="<s:property value="majorNum44"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum44" disabled="disabled" value=""/>
								</s:else>
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
								<s:if test='strIsRandom == "1" && strMajor51 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum51" value="<s:property value="majorNum51"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum51" disabled="disabled" value=""/>
								</s:else>
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
								<s:if test='strIsRandom == "1" && strMajor52 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum52" value="<s:property value="majorNum52"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum52" disabled="disabled" value=""/>
								</s:else>
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
								<s:if test='strIsRandom == "1" && strMajor53 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum53" value="<s:property value="majorNum53"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum53" disabled="disabled" value=""/>
								</s:else>
							</td>
							<td>
								<select id="tmpMajor54" style="width: 145px;" <s:if test="major54List == null || major54List.size() == 0">disabled</s:if> onchange="selectMajor('5', '4');">
									<option value="" selected="selected">请选择</option>
									<s:iterator id="major54List" value="major54List" status="st1">
										<option value="<s:property value="MAJORCODE"/>" <s:if test='%{major54List[#st1.index].MAJORCODE == strMajor54}'>selected</s:if>><s:property value="MAJORNAME"/></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<s:if test='strIsRandom == "1" && strMajor54 != ""'>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum54" value="<s:property value="majorNum54"/>"/>
								</s:if>
								<s:else>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum54" disabled="disabled" value=""/>
								</s:else>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="data_table" style="padding:0px;">
				<div class="tab_tittle">
					<table width="100%" border="1" cellpadding="5" cellspacing="0">
					</table>
				</div>
				<div class="tab_content" style="height:300px">
					<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
						<tr class="tittle">
							<td style="display: none;"></td>
							<s:if test='strIsRandom == "1"'>
								<td style="display: none;"></td>
							</s:if>
							<s:else>
								<td></td>
							</s:else>
							<td width="80">姓名</td>
							<td width="160">就职公司</td>
							<td width="150">专业</td>
							<s:if test='strIsRandom == "1"'>
								<td width="80">抽取专业</td>
							</s:if>
							<td width="80">职称</td>
							<td width="80">手机电话</td>
							<td width="170">备注</td>
						</tr>
						<tbody id="bidExportDataNew">
							<s:iterator id="listBidCompTmp" value="listBidCompTmp" status="st1">
								<tr>
									<td style="width: 0px; display: none;">
										<input type="hidden" value="<s:property value="EXPERT_NAME"/>"/>
										<input type="hidden" value="<s:property value="EXPERT_COMP"/>"/>
										<input type="hidden" value="<s:property value="EXPERT_MAJOR_NAME"/>"/>
										<input type="hidden" value="<s:property value="EXPERT_QULI"/>"/>
										<input type="hidden" value="<s:property value="EXPERT_TEL1"/>"/>
										<input type="hidden" value="<s:property value="MEMO1"/>"/>
										<input type="hidden" value="<s:property value="EXPERT_MAJOR"/>"/>
										<input type="hidden" value="<s:property value="EXPERT_SEQ"/>"/>
									</td>
								</tr>
							</s:iterator>
						</tbody>
						<s:iterator id="expertLibList" value="expertLibList" status="st1">
							<s:if test="#st1.odd==true">
								<tr class="tr_bg">
							</s:if>
							<s:else>
								<tr>
							</s:else>
								<td style="display: none;">
									<input type="hidden" value="<s:property value="EXPERT_NAME"/>"/>
									<input type="hidden" value="<s:property value="EXPERT_COMP"/>"/>
									<input type="hidden" value="<s:property value="EXPERT_MAJOR_NAME"/>"/>
									<input type="hidden" value="<s:property value="EXPERT_QULI"/>"/>
									<input type="hidden" value="<s:property value="EXPERT_TEL1"/>"/>
									<input type="hidden" value="<s:property value="MEMO1"/>"/>
									<input type="hidden" value="<s:property value="EXPERT_MAJOR"/>"/>
								</td>
								<s:if test='strIsRandom == "1"'>
									<td style="display: none;">
								</s:if>
								<s:else>
									<td>
								</s:else>
									<input name="radioKey" type="checkbox" value="<s:property value="EXPERT_SEQ"/>"/>
								</td>
								<td><s:property value="EXPERT_NAME"/></td>
								<td><s:property value="EXPERT_COMP"/></td>
								<td><s:property value="EXPERT_MAJOR_NAME"/>
								</td>
								<s:if test='strIsRandom == "1"'>
									<td>
										<s:iterator id="majorAllList" value="majorAllList" status="st2">
											<s:if test='%{majorAllList[#st2.index].MAJORCODE == AUTO_MARJOR}'>
												<s:property value="MAJORNAME"/>
											</s:if>
										</s:iterator>
									</td>
								</s:if>
								<td><s:property value="EXPERT_QULI"/></td>
								<td><s:property value="EXPERT_TEL1"/></td>
								<td><s:property value="MEMO1"/></td>
							</tr>
						</s:iterator>
					</table>
				</div>
			</div>
		</div>
		<div class="btns" style="margin-top:40px; margin-left: 0px;">
			<table border="0" style="margin:0 auto;">
				<tr>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input type="button" class="input80" value="确定" onclick="addBidExpertNew();"/>
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
