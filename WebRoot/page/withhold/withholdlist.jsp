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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Calendar3.js"></script>
<title>代扣信息一览</title>
<script type="text/javascript">
	$(document).ready(function(){
		var h = screen.availHeight; 
		$("#container").height(h - 60);
	});
	
	function add() {
		var url = '<c:url value="/withhold/showAddWithholdAction.action"></c:url>' + "?date=" + new Date();
		window.showModalDialog(url, window, "dialogheight:460px;dialogwidth:550px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function upd() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			var url = '<c:url value="/withhold/showUpdWithholdAction.action"></c:url>'
					+ "?updWithholdNo=" + id
					+ "&date=" + new Date();
			window.showModalDialog(url, window, "dialogheight:460px;dialogwidth:550px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
		}
	}
	
	function del() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			if(confirm("确定删除该记录吗？")) {
				settype();
				document.mainform.action = '<c:url value="/withhold/delWithholdAction.action"></c:url>' + "?delWithholdNo=" + id;
				document.mainform.submit();
			}
		}
	}
	
	function exportWithhold() {
		//导出
		document.mainform.action = '<c:url value="/withhold/exportWithholdAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//设置专业
	function settype() {
		$("#strWithholdDateLow").attr("value", $("#withholdDateLow").val());
		$("#strWithholdDateHigh").attr("value", $("#withholdDateHigh").val());
	}
	
	function getSelectedID() {
		var id = "";
		var list = document.getElementsByName("radioKey");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				id = list[i].value;
				break;
			}
		}
		return id;
	}
	
	function goHome() {
		document.mainform.action = '<c:url value="/home/goHomeAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryList() {
		settype();
		document.mainform.action = '<c:url value="/withhold/queryWithholdAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		settype();
		document.getElementById("startIndex").value = pageNum;
		document.mainform.action = '<c:url value="/withhold/turnWithholdAction.action"></c:url>';
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
	<div id="container">
		<div id="top">
			<div class="logobox">
				<div class="logo_tittle"></div>
				<div class="logo"></div>
			</div>
		</div>
		<div class="content">
			<jsp:include page="../info.jsp" flush="true" />
			<div class="tittle">
				<div class="icons"><a class="home" href="#" onclick="goHome();">返回首页</a><a class="quit" href="#" onclick="logout();">退出</a></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center">
					代扣信息一览
				</div>
				<div class="tittle_right">
				</div>
			</div>
			<s:form id="mainform" name="mainform" method="POST">
				<s:hidden name="startIndex" id="startIndex"/>
				<s:hidden name="strWithholdDateLow" id="strWithholdDateLow"/>
				<s:hidden name="strWithholdDateHigh" id="strWithholdDateHigh"/>
				<div class="searchbox">
					<div class="box1">
						<label class="pdf10">代扣日期</label>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" id="withholdDateLow" value="<s:property value="strWithholdDateLow"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('withholdDateLow'));"></a>
						</div>
						<div class="box1_right"></div>
						<label>-</label>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" id="withholdDateHigh" value="<s:property value="strWithholdDateHigh"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('withholdDateHigh'));"></a>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="box1">
						<label class="pdf10">代扣分类：</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select style="width: 180px;" name="strWithholdType" id="strWithholdType">
								<s:if test='strWithholdType == "G"'>
									<option value="">请选择</option>
									<option value="G" selected="selected">工资</option>
									<option value="B">办公费</option>
									<option value="F">房租</option>
									<option value="D">电费</option>
									<option value="Q">其他</option>
								</s:if>
								<s:elseif test='strWithholdType == "B"'>
									<option value="">请选择</option>
									<option value="G">工资</option>
									<option value="B" selected="selected">办公费</option>
									<option value="F">房租</option>
									<option value="D">电费</option>
									<option value="Q">其他</option>
								</s:elseif>
								<s:elseif test='strWithholdType == "F"'>
									<option value="">请选择</option>
									<option value="G">工资</option>
									<option value="B">办公费</option>
									<option value="F" selected="selected">房租</option>
									<option value="D">电费</option>
									<option value="Q">其他</option>
								</s:elseif>
								<s:elseif test='strWithholdType == "D"'>
									<option value="">请选择</option>
									<option value="G">工资</option>
									<option value="B">办公费</option>
									<option value="F">房租</option>
									<option value="D" selected="selected">电费</option>
									<option value="Q">其他</option>
								</s:elseif>
								<s:elseif test='strWithholdType == "Q"'>
									<option value="">请选择</option>
									<option value="G">工资</option>
									<option value="B">办公费</option>
									<option value="F">房租</option>
									<option value="D">电费</option>
									<option value="Q" selected="selected">其他</option>
								</s:elseif>
								<s:else>
									<option value="" selected="selected">请选择</option>
									<option value="G">工资</option>
									<option value="B">办公费</option>
									<option value="F">房租</option>
									<option value="D">电费</option>
									<option value="Q">其他</option>
								</s:else>
							</select>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="btn" style="margin-left: 230px;">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="button" class="input40" value="检索" onclick="queryList();"/>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="icons thums">
						<a class="add" onclick="add();">增加</a>
						<a class="edit" onclick="upd();">修改</a>
						<a class="delete" onclick="del();">删除</a>
					</div>
					<div class="box1" style="position:absolute; margin-left: 550px; color: red;">
						<s:actionmessage />
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
								<td width="50"></td>
								<td width="130">代扣编号</td>
								<td width="100">代扣分类</td>
								<td width="130">代扣日期</td>
								<td width="100">代扣金额</td>
								<td width="200">用途</td>
								<td width="200">备注</td>
							</tr>
							<s:iterator id="listWithhold" value="listWithhold" status="st1">
								<s:if test="#st1.odd==true">
									<tr class="tr_bg">
								</s:if>
								<s:else>
									<tr>
								</s:else>
									<td><input name="radioKey" type="radio" value="<s:property value="WITHHOLD_NO"/>"/></td>
									<td>
										<s:property value="WITHHOLD_NO"/>
									</td>
									<td>
										<s:if test='WITHHOLD_TYPE == "G"'>
											工资
										</s:if>
										<s:elseif test='WITHHOLD_TYPE == "B"'>
											办公费
										</s:elseif>
										<s:elseif test='WITHHOLD_TYPE == "F"'>
											房租
										</s:elseif>
										<s:elseif test='WITHHOLD_TYPE == "D"'>
											电费
										</s:elseif>
										<s:elseif test='WITHHOLD_TYPE == "Q"'>
											其他
										</s:elseif>
										<s:else>
										</s:else>
									</td>
									<td><s:date name="WITHHOLD_DATE" format="yyyy-MM-dd" /></td>
									<td><s:property value="WITHHOLD_AMOUNT"/></td>
									<td><s:property value="WITHHOLD_REASON"/></td>
									<td><s:property value="MEMO1"/></td>
								</tr>
							</s:iterator>
						</table>
					</div>
					<div class="pages">
						<ul>
							<li>第<strong>${page.startIndex + 1}</strong>页/共<strong>${page.totalPage==0?1:page.totalPage}</strong>页/共<strong>${page.totalCount}</strong>条记录</li>
							<li class="mgl15">跳转到
								<input type="text" id="pagenum" class="text" maxlength="4" size="4"/>
								<input type="button" value="GO" onclick="javascript:turnPage();"/>
							</li>
							<li class="mgl15">
								<a class="first" href="#" onclick="changePage(0);">首页</a>
							</li>
							<li>
								<s:if test="%{page.startIndex <= 0}">
									<a class="last" href="#">上一页</a>
								</s:if>
								<s:else>
									<a class="next" href="#" onclick="changePage('${page.previousIndex}');">上一页</a>
								</s:else>
							</li>
							<li>
								<s:if test="%{page.nextIndex > page.totalPage - 1}">
									<a class="last" href="#">下一页</a>
								</s:if>
								<s:else>
									<a class="next" href="#" onclick="changePage('${page.nextIndex}');">下一页</a>
								</s:else>
							</li>
							<li>
								<a class="next" href="#" onclick="changePage('${page.totalPage - 1}');">末页</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="btns" style="margin-top:-50px;">
					<table border="0" style="margin:0 auto;">
						<tr>
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" type="button" value="下载" onclick="exportWithhold();"/>
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
							<!--
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input type="button" class="input80" value="追加" onclick="add();"/>
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" type="button" value="更改" onclick="upd();"/>
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" type="button" value="删除" onclick="del();"/>
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
							-->
						</tr>
					</table>
				</div>
			</s:form>
		</div>
	</div>
</body>
</html>
