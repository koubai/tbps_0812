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
<title>专家信息一览</title>
<script type="text/javascript">
	$(document).ready(function(){
		var h = screen.availHeight; 
		$("#container").height(h - 50);
	});
	
	function add() {
		var url = '<c:url value="/expertlib/showAddExpertLibAction.action"></c:url>' + "?date=" + new Date();
		window.showModalDialog(url, window, "dialogheight:500px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function upd() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			var url = '<c:url value="/expertlib/showUpdExpertLibAction.action"></c:url>'
					+ "?updateExpertLibSeq=" + id
					+ "&date=" + new Date();
			window.showModalDialog(url, window, "dialogheight:500px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
		}
	}
	
	function del() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			if(confirm("确定删除该记录吗？")) {
				setmajor();
				document.mainform.action = '<c:url value="/expertlib/delExpertLibAction.action"></c:url>' + "?delExpertLibSeq=" + id;
				document.mainform.submit();
			}
		}
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
		$("#strExpertMajor").attr("value", major);
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
	
	function exportExcel() {
		setmajor();
		document.mainform.action = '<c:url value="/expertlib/exportExpertLibAction.action"></c:url>';
		document.mainform.submit();
	}

	function goHome() {
		document.mainform.action = '<c:url value="/home/goHomeAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryList() {
		setmajor();
		document.mainform.action = '<c:url value="/expertlib/queryExpertLibList.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		setmajor();
		document.getElementById("startIndex").value = pageNum;
		document.mainform.action = '<c:url value="/expertlib/turnExpertLibPage.action"></c:url>';
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
					专家信息一览
				</div>
				<div class="tittle_right">
				</div>
			</div>
			<s:form id="mainform" name="mainform" method="POST">
				<s:hidden name="startIndex" id="startIndex"/>
				<s:hidden name="strExpertMajor" id="strExpertMajor"/>
				<div class="searchbox" style="height: 60px;">
					<div class="box1">
						<label class="pdf10">姓名</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strExpertName" id="strExpertName" cssStyle="width:70px;" maxlength="24" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="box1" style="margin-left: 10px; height: 60px;">
						<label class="pdf10">专业：</label>
						<div style="width: 670px; margin-top: 5px;">
							<s:if test='%{strExpertMajor.substring(0, 1) == "1"}'>
								<input name="major" value="1" type="checkbox" checked="checked"/>建筑　
							</s:if>
							<s:else>
								<input name="major" value="1" type="checkbox"/>建筑　
							</s:else>
							<s:if test='%{strExpertMajor.substring(1, 2) == "2"}'>
								<input name="major" value="2" type="checkbox" checked="checked"/>结构　
							</s:if>
							<s:else>
								<input name="major" value="2" type="checkbox"/>结构　
							</s:else>
							<s:if test='%{strExpertMajor.substring(2, 3) == "3"}'>
								<input name="major" value="3" type="checkbox" checked="checked"/>给排水　
							</s:if>
							<s:else>
								<input name="major" value="3" type="checkbox"/>给排水　
							</s:else>
							<s:if test='%{strExpertMajor.substring(3, 4) == "4"}'>
								<input name="major" value="4" type="checkbox" checked="checked"/>电气　
							</s:if>
							<s:else>
								<input name="major" value="4" type="checkbox"/>电气　
							</s:else>
							<s:if test='%{strExpertMajor.substring(4, 5) == "5"}'>
								<input name="major" value="5" type="checkbox" checked="checked"/>环控　
							</s:if>
							<s:else>
								<input name="major" value="5" type="checkbox"/>环控　
							</s:else>
							<s:if test='%{strExpertMajor.substring(5, 6) == "6"}'>
								<input name="major" value="6" type="checkbox" checked="checked"/>车辆机械　
							</s:if>
							<s:else>
								<input name="major" value="6" type="checkbox"/>车辆机械　
							</s:else>
							<s:if test='%{strExpertMajor.substring(6, 7) == "7"}'>
								<input name="major" value="7" type="checkbox" checked="checked"/>车辆电气　
							</s:if>
							<s:else>
								<input name="major" value="7" type="checkbox"/>车辆电气　
							</s:else>
							<s:if test='%{strExpertMajor.substring(7, 8) == "8"}'>
								<input name="major" value="8" type="checkbox" checked="checked"/>智能化　
							</s:if>
							<s:else>
								<input name="major" value="8" type="checkbox"/>智能化　
							</s:else>
							<s:if test='%{strExpertMajor.substring(8, 9) == "9"}'>
								<input name="major" value="9" type="checkbox" checked="checked"/>其他
							</s:if>
							<s:else>
								<input name="major" value="9" type="checkbox"/>其他
							</s:else>
							<div>
								<s:if test='%{strExpertMajor.substring(9, 10) == "A"}'>
									<input name="major" value="A" type="checkbox" checked="checked"/>管线　
								</s:if>
								<s:else>
									<input name="major" value="A" type="checkbox"/>管线　
								</s:else>
								<s:if test='%{strExpertMajor.substring(10, 11) == "B"}'>
									<input name="major" value="B" type="checkbox" checked="checked"/>市政/交通　
								</s:if>
								<s:else>
									<input name="major" value="B" type="checkbox"/>市政/交通　
								</s:else>
								<s:if test='%{strExpertMajor.substring(11, 12) == "C"}'>
									<input name="major" value="C" type="checkbox" checked="checked"/>绿化　
								</s:if>
								<s:else>
									<input name="major" value="C" type="checkbox"/>绿化　
								</s:else>
								<s:if test='%{strExpertMajor.substring(12, 13) == "D"}'>
									<input name="major" value="D" type="checkbox" checked="checked"/>轨道　
								</s:if>
								<s:else>
									<input name="major" value="D" type="checkbox"/>轨道　
								</s:else>
								<s:if test='%{strExpertMajor.substring(13, 14) == "E"}'>
									<input name="major" value="E" type="checkbox" checked="checked"/>监测　
								</s:if>
								<s:else>
									<input name="major" value="E" type="checkbox"/>监测　
								</s:else>
								<s:if test='%{strExpertMajor.substring(14, 15) == "F"}'>
									<input name="major" value="F" type="checkbox" checked="checked"/>商务　
								</s:if>
								<s:else>
									<input name="major" value="F" type="checkbox"/>商务　
								</s:else>
							</div>
						</div>
					</div>
					<div class="btn">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="button" class="input40" value="检索" onclick="queryList();"/>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="box1" style="margin-top:-40px; margin-left: -450px; color: red;">
						<s:actionmessage />
					</div>
					<div class="icons thums">
						<a class="add" onclick="add();">增加</a>
						<a class="edit" onclick="upd();">修改</a>
						<a class="delete" onclick="del();">删除</a>
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
								<td width="40"></td>
								<td width="80">姓名</td>
								<td width="150">专业</td>
								<td width="80">职称</td>
								<td width="80">手机电话</td>
								<td width="80">固话</td>
								<td width="50">性别</td>
								<td width="140">出生日期</td>
								<td width="160">就职公司</td>
								<td width="110">备注</td>
							</tr>
							<s:iterator id="listExpertLib" value="listExpertLib" status="st1">
								<s:if test="#st1.odd==true">
									<tr class="tr_bg">
								</s:if>
								<s:else>
									<tr>
								</s:else>
									<td><input name="radioKey" type="radio" value="<s:property value="EXPERT_SEQ"/>"/></td>
									<td><s:property value="EXPERT_NAME"/></td>
									<td>
										<s:property value="EXPERT_MAJOR_NAME"/>
									</td>
									<td><s:property value="EXPERT_QULI"/></td>
									
									<td><s:property value="EXPERT_TEL1"/></td>
									<td><s:property value="EXPERT_TEL2"/></td>
									<td>
										<s:if test='EXPERT_GENDER == "1"'>男</s:if>
										<s:else>女</s:else>
									</td>
									<td>
										<s:property value="EXPERT_BIRTH"/>
									</td>
									<td><s:property value="EXPERT_COMP"/></td>
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
										<input class="input80" type="button" value="下载" onclick="exportExcel();" />
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</s:form>
		</div>
	</div>
</body>
</html>
