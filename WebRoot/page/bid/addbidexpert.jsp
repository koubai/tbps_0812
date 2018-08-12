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
<title>专家信息一览</title>
<script type="text/javascript">
	$(function() {
	});
	
	//添加评审专家
	function addBidExpert() {
		var obj = null;
		var id = "";
		var list = document.getElementsByName("radioKey");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				obj = list[i];
				id = list[i].value;
				break;
			}
		}
		if(obj == null) {
			alert("请选择一个专家！");
			return;
		}
		//验证该专家是否在评审专家列表中
		var BID_EXPERT_LIST = window.dialogArguments.document.getElementById("BID_EXPERT_LIST").value;
		var BID_EXPERT = "," + BID_EXPERT_LIST;
		if(BID_EXPERT.indexOf("," + id + ",") >= 0) {
			alert("该专家已存在！");
			return;
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
		
		window.dialogArguments.document.getElementById("BID_EXPERT_LIST").value = BID_EXPERT_LIST + id + ",";
		window.dialogArguments.document.getElementById("bidExportData").appendChild(tr);
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
		setmajor();
		document.mainform.action = '<c:url value="/bid/queryAddBidExpertAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		setmajor();
		document.getElementById("startIndexExpert").value = pageNum;
		document.mainform.action = '<c:url value="/bid/turnAddBidExpertAction.action"></c:url>';
		document.mainform.submit();
	}

	//页跳转
	function turnPage() {
		var totalPage = "${pageExpert.totalPage}";
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
	
	//设置专业
	function setmajor() {
		var major = "";
		var list = document.getElementsByName("major");
		for(var i = 1; i < list.length + 1; i++) {
			if(list[i - 1].checked) {
				major += "" + i;
			} else {
				major += "0";
			}
		}
		$("#expertMajor").attr("value", major);
	}
</script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:hidden;">
<s:form id="mainform" name="mainform" method="POST">
	<s:hidden name="startIndexExpert" id="startIndexExpert"/>
	<s:hidden name="expertMajor" id="expertMajor"/>
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					专家信息一览
				</div>
				<div class="tittle_right">
				</div>
			</div>
		</div>
		<div class="searchbox">
			<div class="box1">
				<label class="pdf10">姓名</label>
				<div class="box1_left"></div>
				<div class="box1_center">
					<s:textfield name="expertName" id="expertName" cssStyle="width:80px;" maxlength="8" theme="simple"></s:textfield>
				</div>
				<div class="box1_right"></div>
			</div>
			<div class="box1">
				<label class="pdf10">专业：</label>
				<div style="width: 700px; margin-top: 5px;">
					<s:if test='%{expertMajor.substring(0, 1) == "1"}'>
						<input name="major" type="checkbox" checked="checked"/>建筑　
					</s:if>
					<s:else>
						<input name="major" type="checkbox"/>建筑　
					</s:else>
					<s:if test='%{expertMajor.substring(1, 2) == "2"}'>
						<input name="major" type="checkbox" checked="checked"/>结构　
					</s:if>
					<s:else>
						<input name="major" type="checkbox"/>结构　
					</s:else>
					<s:if test='%{expertMajor.substring(2, 3) == "3"}'>
						<input name="major" type="checkbox" checked="checked"/>给排水　
					</s:if>
					<s:else>
						<input name="major" type="checkbox"/>给排水　
					</s:else>
					<s:if test='%{expertMajor.substring(3, 4) == "4"}'>
						<input name="major" type="checkbox" checked="checked"/>电气　
					</s:if>
					<s:else>
						<input name="major" type="checkbox"/>电气　
					</s:else>
					<s:if test='%{expertMajor.substring(4, 5) == "5"}'>
						<input name="major" type="checkbox" checked="checked"/>环控　
					</s:if>
					<s:else>
						<input name="major" type="checkbox"/>环控　
					</s:else>
					<s:if test='%{expertMajor.substring(5, 6) == "6"}'>
						<input name="major" type="checkbox" checked="checked"/>车辆机械　
					</s:if>
					<s:else>
						<input name="major" type="checkbox"/>车辆机械　
					</s:else>
					<s:if test='%{expertMajor.substring(6, 7) == "7"}'>
						<input name="major" type="checkbox" checked="checked"/>车辆电气　
					</s:if>
					<s:else>
						<input name="major" type="checkbox"/>车辆电气　
					</s:else>
					<s:if test='%{expertMajor.substring(7, 8) == "8"}'>
						<input name="major" type="checkbox" checked="checked"/>智能化　
					</s:if>
					<s:else>
						<input name="major" type="checkbox"/>智能化　
					</s:else>
					<s:if test='%{expertMajor.substring(8, 9) == "9"}'>
						<input name="major" type="checkbox" checked="checked"/>其他
					</s:if>
					<s:else>
						<input name="major" type="checkbox"/>其他
					</s:else>
				</div>
			</div>
			<div class="btn" style="margin-left: -15px;">
				<div class="box1_left"></div>
				<div class="box1_center">
					<input type="button" class="input40" value="检索" onclick="queryList();"/>
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
						<td width="40"></td>
						<td width="80">姓名</td>
						<td width="160">就职公司</td>
						<td width="150">专业</td>
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
							<td><input name="radioKey" type="radio" value="<s:property value="EXPERT_SEQ"/>"/></td>
							<td><s:property value="EXPERT_NAME"/></td>
							<td><s:property value="EXPERT_COMP"/></td>
							<td><s:property value="EXPERT_MAJOR_NAME"/></td>
							<td><s:property value="EXPERT_QULI"/></td>
							<td><s:property value="EXPERT_TEL1"/></td>
							<td><s:property value="MEMO1"/></td>
						</tr>
					</s:iterator>
				</table>
			</div>
			<div class="pages">
				<ul>
					<li>第<strong>${pageExpert.startIndex + 1}</strong>页/共<strong>${pageExpert.totalPage==0?1:pageExpert.totalPage}</strong>页/共<strong>${pageExpert.totalCount}</strong>条记录</li>
					<li class="mgl15">跳转到
						<input type="text" id="pagenum" class="text" maxlength="4" size="4"/>
						<input type="button" value="GO" onclick="javascript:turnPage();"/>
					</li>
					<li class="mgl15">
						<a class="first" href="#" onclick="changePage(0);">首页</a>
					</li>
					<li>
						<s:if test="%{pageExpert.startIndex <= 0}">
							<a class="last" href="#">上一页</a>
						</s:if>
						<s:else>
							<a class="next" href="#" onclick="changePage('${pageExpert.previousIndex}');">上一页</a>
						</s:else>
					</li>
					<li>
						<s:if test="%{pageExpert.nextIndex > pageExpert.totalPage - 1}">
							<a class="last" href="#">下一页</a>
						</s:if>
						<s:else>
							<a class="next" href="#" onclick="changePage('${pageExpert.nextIndex}');">下一页</a>
						</s:else>
					</li>
					<li>
						<a class="next" href="#" onclick="changePage('${pageExpert.totalPage - 1}');">末页</a>
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
								<input type="button" class="input80" value="追加" onclick="addBidExpert();"/>
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
