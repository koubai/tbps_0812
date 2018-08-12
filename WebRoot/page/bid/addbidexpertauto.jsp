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
		var bidExportData = window.dialogArguments.document.getElementById("bidExportData");
		var childs = bidExportData.childNodes;
		for(var a = childs.length - 1; a >= 0; a--) {
			bidExportData.removeChild(childs[a]);
		}
		
		var strIsRandom = $("#strIsRandom").val();
		
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
		
		var ids = "";
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
			ids += id + ",";
			
			window.dialogArguments.document.getElementById("bidExportData").appendChild(tr);
		}
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
	
	function queryList() {
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
		document.mainform.action = '<c:url value="/bid/getAutoBidExpertAction.action"></c:url>';
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
		var list = document.getElementsByName("major");
		if(obj.checked) {
			for(var i = 1; i <= list.length; i++) {
				var v = list[i - 1].value;
				if(document.getElementById("major" + v).checked) {
					$("#" + "tmpmajornum" + v).attr("disabled", "");
				} else {
					$("#" + "tmpmajornum" + v).attr("disabled", "disabled");
				}
			}
			$("#strIsRandom").attr("value", "1");
		} else {
			for(var i = 1; i <= list.length; i++) {
				var v = list[i - 1].value;
				$("#" + "tmpmajornum" + v).attr("value", "");
				$("#" + "tmpmajornum" + v).attr("disabled", "disabled");
				$("#" + "major" + v).attr("checked", false);
			}
			$("#strIsRandom").attr("value", "0");
		}
	}
</script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:hidden;">
<s:form id="mainform" name="mainform" method="POST">
	<s:hidden name="startIndexExpert" id="startIndexExpert"/>
	<s:hidden name="expertMajor" id="expertMajor"/>
	<s:hidden name="expertMajorQuery" id="expertMajorQuery"/>
	<s:hidden name="strIsRandom" id="strIsRandom"/>
	<s:hidden name="majornum1" id="majornum1"/>
	<s:hidden name="majornum2" id="majornum2"/>
	<s:hidden name="majornum3" id="majornum3"/>
	<s:hidden name="majornum4" id="majornum4"/>
	<s:hidden name="majornum5" id="majornum5"/>
	<s:hidden name="majornum6" id="majornum6"/>
	<s:hidden name="majornum7" id="majornum7"/>
	<s:hidden name="majornum8" id="majornum8"/>
	<s:hidden name="majornum9" id="majornum9"/>
	<s:hidden name="majornumA" id="majornumA"/>
	<s:hidden name="majornumB" id="majornumB"/>
	<s:hidden name="majornumC" id="majornumC"/>
	<s:hidden name="majornumD" id="majornumD"/>
	<s:hidden name="majornumE" id="majornumE"/>
	<s:hidden name="majornumF" id="majornumF"/>
	
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
		<div class="searchbox" style="height: 85px;">
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
			<div class="box1" style="margin-left: 20px;">
				<label class="pdf10">专业：</label>
				<div style="width: 600px; margin-top: 5px;">
					<s:if test='%{expertMajor.substring(0, 1) == "1"}'>
						<input name="major" type="checkbox" onclick="checkMajor(this);" checked="checked" id="major1" value="1"/>建筑
						<s:if test='strIsRandom == "1"'><input type="text" style="width: 30px;" maxlength="2" id="tmpmajornum1" value="<s:property value="majornum1"/>"/></s:if><s:else><input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum1" value="<s:property value="majornum1"/>"/></s:else>
					</s:if>
					<s:else>
						<input name="major" type="checkbox" onclick="checkMajor(this);" id="major1" value="1"/>建筑
						<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum1" value="<s:property value="majornum1"/>"/>　
					</s:else>
					<s:if test='%{expertMajor.substring(1, 2) == "2"}'>
						<input name="major" type="checkbox" onclick="checkMajor(this);" checked="checked" id="major2" value="2"/>结构
						<s:if test='strIsRandom == "1"'>
							<input type="text" style="width: 30px;" maxlength="2" id="tmpmajornum2" value="<s:property value="majornum2"/>"/>　
						</s:if>
						<s:else>
							<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum2" value="<s:property value="majornum2"/>"/>　
						</s:else>
					</s:if>
					<s:else>
						<input name="major" type="checkbox" onclick="checkMajor(this);" id="major2" value="2"/>结构<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum2" value="<s:property value="majornum2"/>"/>　
					</s:else>
					<s:if test='%{expertMajor.substring(2, 3) == "3"}'>
						<input name="major" type="checkbox" onclick="checkMajor(this);" checked="checked" id="major3" value="3"/>给排水
						<s:if test='strIsRandom == "1"'>
							<input type="text" style="width: 30px;" maxlength="2" id="tmpmajornum3" value="<s:property value="majornum3"/>"/>　
						</s:if>
						<s:else>
							<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum3" value="<s:property value="majornum3"/>"/>　
						</s:else>
					</s:if>
					<s:else>
						<input name="major" type="checkbox" onclick="checkMajor(this);" id="major3" value="3"/>给排水<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum3" value="<s:property value="majornum3"/>"/>　
					</s:else>
					<s:if test='%{expertMajor.substring(3, 4) == "4"}'>
						<input name="major" type="checkbox" onclick="checkMajor(this);" checked="checked" id="major4" value="4"/>电气
						<s:if test='strIsRandom == "1"'>
							<input type="text" style="width: 30px;" maxlength="2" id="tmpmajornum4" value="<s:property value="majornum4"/>"/>　
						</s:if>
						<s:else>
							<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum4" value="<s:property value="majornum4"/>"/>　
						</s:else>
					</s:if>
					<s:else>
						<input name="major" type="checkbox" onclick="checkMajor(this);" id="major4" value="4"/>电气<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum4" value="<s:property value="majornum4"/>"/>　
					</s:else>
					<s:if test='%{expertMajor.substring(4, 5) == "5"}'>
						<input name="major" type="checkbox" onclick="checkMajor(this);" checked="checked" id="major5" value="5"/>环控
						<s:if test='strIsRandom == "1"'>
							<input type="text" style="width: 30px;" maxlength="2" id="tmpmajornum5" value="<s:property value="majornum5"/>"/>　
						</s:if>
						<s:else>
							<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum5" value="<s:property value="majornum5"/>"/>　
						</s:else>　
					</s:if>
					<s:else>
						<input name="major" type="checkbox" onclick="checkMajor(this);" id="major5" value="5"/>环控<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum5" value="<s:property value="majornum5"/>"/>　
					</s:else>
				</div>
				<div style="width: 600px; margin-top: 5px; margin-left: 46px;">
					<s:if test='%{expertMajor.substring(5, 6) == "6"}'>
						<input name="major" type="checkbox" onclick="checkMajor(this);" checked="checked" id="major6" value="6"/>车辆机械
						<s:if test='strIsRandom == "1"'>
							<input type="text" style="width: 30px;" maxlength="2" id="tmpmajornum6" value="<s:property value="majornum6"/>"/>　
						</s:if>
						<s:else>
							<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum6" value="<s:property value="majornum6"/>"/>　
						</s:else>
					</s:if>
					<s:else>
						<input name="major" type="checkbox" onclick="checkMajor(this);" id="major6" value="6"/>车辆机械<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum6" value="<s:property value="majornum6"/>"/>　
					</s:else>
					<s:if test='%{expertMajor.substring(6, 7) == "7"}'>
						<input name="major" type="checkbox" onclick="checkMajor(this);" checked="checked" id="major7" value="7"/>车辆电气
						<s:if test='strIsRandom == "1"'>
							<input type="text" style="width: 30px;" maxlength="2" id="tmpmajornum7" value="<s:property value="majornum7"/>"/>　
						</s:if>
						<s:else>
							<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum7" value="<s:property value="majornum7"/>"/>　
						</s:else>
					</s:if>
					<s:else>
						<input name="major" type="checkbox" onclick="checkMajor(this);" id="major7" value="7"/>车辆电气<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum7" value="<s:property value="majornum7"/>"/>　
					</s:else>
					<s:if test='%{expertMajor.substring(7, 8) == "8"}'>
						<input name="major" type="checkbox" onclick="checkMajor(this);" id="major8" checked="checked" value="8"/>智能化
						<s:if test='strIsRandom == "1"'>
							<input type="text" style="width: 30px;" maxlength="2" id="tmpmajornum8" value="<s:property value="majornum8"/>"/>　
						</s:if>
						<s:else>
							<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum8" value="<s:property value="majornum8"/>"/>　
						</s:else>
					</s:if>
					<s:else>
						<input name="major" type="checkbox" onclick="checkMajor(this);" id="major8" value="8"/>智能化<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum8" value="<s:property value="majornum8"/>"/>　
					</s:else>
					<s:if test='%{expertMajor.substring(8, 9) == "9"}'>
						<input name="major" id="major9" type="checkbox" onclick="checkMajor(this);" checked="checked" value="9"/>其他
						<s:if test='strIsRandom == "1"'>
							<input type="text" style="width: 30px;" maxlength="2" id="tmpmajornum9" value="<s:property value="majornum9"/>"/>
						</s:if>
						<s:else>
							<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum9" value="<s:property value="majornum9"/>"/>
						</s:else>
					</s:if>
					<s:else>
						<input name="major" id="major9" type="checkbox" onclick="checkMajor(this);" value="9"/>其他<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornum9" value="<s:property value="majornum9"/>"/>
					</s:else>
				</div>
				<div style="width: 600px; margin-top: 5px; margin-left: 46px;">
					<s:if test='%{expertMajor.substring(9, 10) == "A"}'>
						<input name="major" id="majorA" type="checkbox" onclick="checkMajor(this);" checked="checked" value="A"/>管线
						<s:if test='strIsRandom == "1"'>
							<input type="text" style="width: 30px;" maxlength="2" id="tmpmajornumA" value="<s:property value="majornumA"/>"/>
						</s:if>
						<s:else>
							<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornumA" value="<s:property value="majornumA"/>"/>
						</s:else>
					</s:if>
					<s:else>
						<input name="major" id="majorA" type="checkbox" onclick="checkMajor(this);" value="A"/>管线<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornumA" value="<s:property value="majornumA"/>"/>
					</s:else>
					<s:if test='%{expertMajor.substring(10, 11) == "B"}'>
						<input name="major" id="majorB" type="checkbox" onclick="checkMajor(this);" checked="checked" value="B"/>市政/交通
						<s:if test='strIsRandom == "1"'>
							<input type="text" style="width: 30px;" maxlength="2" id="tmpmajornumB" value="<s:property value="majornumB"/>"/>
						</s:if>
						<s:else>
							<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornumB" value="<s:property value="majornumB"/>"/>
						</s:else>
					</s:if>
					<s:else>
						<input name="major" id="majorB" type="checkbox" onclick="checkMajor(this);" value="B"/>市政/交通<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornumB" value="<s:property value="majornumB"/>"/>
					</s:else>
					<s:if test='%{expertMajor.substring(11, 12) == "C"}'>
						<input name="major" id="majorC" type="checkbox" onclick="checkMajor(this);" checked="checked" value="C"/>绿化
						<s:if test='strIsRandom == "1"'>
							<input type="text" style="width: 30px;" maxlength="2" id="tmpmajornumC" value="<s:property value="majornumC"/>"/>
						</s:if>
						<s:else>
							<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornumC" value="<s:property value="majornumC"/>"/>
						</s:else>
					</s:if>
					<s:else>
						<input name="major" id="majorC" type="checkbox" onclick="checkMajor(this);" value="C"/>绿化<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornumC" value="<s:property value="majornumC"/>"/>
					</s:else>
					<s:if test='%{expertMajor.substring(12, 13) == "D"}'>
						<input name="major" id="majorD" type="checkbox" onclick="checkMajor(this);" checked="checked" value="D"/>轨道
						<s:if test='strIsRandom == "1"'>
							<input type="text" style="width: 30px;" maxlength="2" id="tmpmajornumD" value="<s:property value="majornumD"/>"/>
						</s:if>
						<s:else>
							<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornumD" value="<s:property value="majornumD"/>"/>
						</s:else>
					</s:if>
					<s:else>
						<input name="major" id="majorD" type="checkbox" onclick="checkMajor(this);" value="D"/>轨道<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornumD" value="<s:property value="majornumD"/>"/>
					</s:else>
					<s:if test='%{expertMajor.substring(13, 14) == "E"}'>
						<input name="major" id="majorE" type="checkbox" onclick="checkMajor(this);" checked="checked" value="E"/>监测
						<s:if test='strIsRandom == "1"'>
							<input type="text" style="width: 30px;" maxlength="2" id="tmpmajornumE" value="<s:property value="majornumE"/>"/>
						</s:if>
						<s:else>
							<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornumE" value="<s:property value="majornumE"/>"/>
						</s:else>
					</s:if>
					<s:else>
						<input name="major" id="majorE" type="checkbox" onclick="checkMajor(this);" value="E"/>监测<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornumE" value="<s:property value="majornumE"/>"/>
					</s:else>
					<s:if test='%{expertMajor.substring(14, 15) == "F"}'>
						<input name="major" id="majorF" type="checkbox" onclick="checkMajor(this);" checked="checked" value="F"/>商务
						<s:if test='strIsRandom == "1"'>
							<input type="text" style="width: 30px;" maxlength="2" id="tmpmajornumF" value="<s:property value="majornumF"/>"/>
						</s:if>
						<s:else>
							<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornumF" value="<s:property value="majornumF"/>"/>
						</s:else>
					</s:if>
					<s:else>
						<input name="major" id="majorF" type="checkbox" onclick="checkMajor(this);" value="F"/>商务<input type="text" style="width: 30px;" disabled="disabled" maxlength="2" id="tmpmajornumF" value="<s:property value="majornumF"/>"/>
					</s:else>
				</div>
			</div>
			<div class="btn" style="margin-left: -35px;">
				<div class="box1_left"></div>
				<div class="box1_center">
					<input type="button" class="input80" value="查询" onclick="queryList();"/>
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
							<td><s:property value="EXPERT_MAJOR_NAME"/></td>
							<s:if test='strIsRandom == "1"'>
								<td>
									<s:if test='AUTO_MARJOR == "1"'>
										建筑
									</s:if>
									<s:elseif test='AUTO_MARJOR == "2"'>
										结构
									</s:elseif>
									<s:elseif test='AUTO_MARJOR == "3"'>
										给排水
									</s:elseif>
									<s:elseif test='AUTO_MARJOR == "4"'>
										电气
									</s:elseif>
									<s:elseif test='AUTO_MARJOR == "5"'>
										环控
									</s:elseif>
									<s:elseif test='AUTO_MARJOR == "6"'>
										车辆机械
									</s:elseif>
									<s:elseif test='AUTO_MARJOR == "7"'>
										车辆电气
									</s:elseif>
									<s:elseif test='AUTO_MARJOR == "8"'>
										智能化
									</s:elseif>
									<s:elseif test='AUTO_MARJOR == "9"'>
										其他
									</s:elseif>
									<s:elseif test='AUTO_MARJOR == "A"'>
										管线
									</s:elseif>
									<s:elseif test='AUTO_MARJOR == "B"'>
										市政/交通
									</s:elseif>
									<s:elseif test='AUTO_MARJOR == "C"'>
										绿化
									</s:elseif>
									<s:elseif test='AUTO_MARJOR == "D"'>
										轨道
									</s:elseif>
									<s:elseif test='AUTO_MARJOR == "E"'>
										监测
									</s:elseif>
									<s:elseif test='AUTO_MARJOR == "F"'>
										商务
									</s:elseif>
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
		<div class="btns" style="margin-top:40px; margin-left: 0px;">
			<table border="0" style="margin:0 auto;">
				<tr>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input type="button" class="input80" value="确定" onclick="addBidExpert();"/>
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
