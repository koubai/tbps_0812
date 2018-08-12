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
<title>招标检索年份</title>
<script type="text/javascript">
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
		var yearStart = $("#strYearStart").val();
		var yearEnd = $("#strYearEnd").val();
		var noStart = $("#strNumberStart").val();
		var noEnd = $("#strNumberEnd").val();
		var bidNoStart = "";
		var bidNoEnd = "";

		if(yearStart != ""){
			if(!numberCheck(yearStart) || yearStart.length != 4){
				alert("开始年份应该是4位数字！");
				$("#strYearStart").focus();
				return false;
			}
		}
		if(yearEnd != ""){
			if(!numberCheck(yearEnd) || yearEnd.length != 4){
				alert("结束年份应该是4位数字！");
				$("#strYearEnd").focus();
				return false;
			}
		}
		if(yearStart != "" && yearEnd != "" && yearEnd < yearStart) {
			alert("开始年份应该小于结束年份！");
			$("#strYearStart").focus();
			return false;
		}

		if(noStart != ""){
			if(!numberCheck(noStart) || noStart.length != 3){
				alert("编号请输入3位数字！");
				$("#strNumberStart").focus();
				return false;
			}
		}

		if(noEnd != ""){
			if(!numberCheck(noEnd) || noEnd.length != 3){
				alert("编号请输入3位数字！");
				$("#strNumberEnd").focus();
				return false;
			}
		}
		
		if(yearStart != "" && noStart == ""){
			bidNoStart = yearStart.substring(2,4) + "-001";
		} else if(yearStart == "" && noStart != ""){
			bidNoStart = "90-" + noStart;
		} else if(yearStart != "" && noStart != ""){
			bidNoStart = yearStart.substring(2,4) + "-" + noStart;
		} else {
			bidNoStart = "";
		}
		
		if(yearEnd != "" && noEnd == ""){
			bidNoEnd = yearEnd.substring(2,4) + "-999";
		} else if(yearEnd == "" && noEnd != ""){
			var myDate = new Date();
			var yearNow = "" + myDate.getFullYear();
			bidNoEnd = yearNow.substring(2,4) + "-" + noEnd;
		} else if(yearEnd != "" && noEnd != ""){
			bidNoEnd = yearEnd.substring(2,4) + "-" + noEnd;
		} else {
			bidNoEnd = "";
		}

		$("#strBidNoStart").attr("value",bidNoStart);
		$("#strBidNoEnd").attr("value", bidNoEnd);
		
		document.mainform.action = '<c:url value="/bid/exportYearAction.action"></c:url>';
		document.mainform.submit();
	}
</script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:hidden;">
<s:form id="mainform" name="mainform" method="POST">
	<s:hidden name="startIndexHist" id="startIndexHist"/>
	<s:hidden name="strBidNoStart" id="strBidNoStart"/>
	<s:hidden name="strBidNoEnd" id="strBidNoEnd"/>
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					招标项目清单检索条件
				</div>
				<div class="tittle_right">
				</div>
			</div>
		</div>
		<div class="searchbox update" style="height:0px;">
			<table width="100%" border="0" cellpadding="5" cellspacing="0">
				<tr>
					<td colspan="5">
						<label style="padding-left:300px;">请选择需要输出的年份 (如果不选择, 即全部)</label>
					</td>
				</tr>
				<tr>
					<td style="width:30px;">
						<label style="padding-left:300px;">开始</label>
					</td>
					<td style="width:80px;">
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strYearStart" id="strYearStart" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td style="width:30px;">
						<label>至</label>
					</td>
					<td style="width:80px;">
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strYearEnd" id="strYearEnd" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td style="width:350px;">
					</td>
				</tr>
				<tr>
					<td style="width:30px;">
						<label style="padding-left:300px;">编号</label>
					</td>
					<td style="width:80px;">
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strNumberStart" id="strNumberStart" cssStyle="width:50px;" maxlength="3" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td style="width:30px;">
						<label>至</label>
					</td>
					<td style="width:80px;">
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strNumberEnd" id="strNumberEnd" cssStyle="width:50px;" maxlength="3" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td style="width:350px;">
					</td>
				</tr>
			</table>
		</div>
		<div class="btns" style="margin-top:40px; margin-left: 0px;">
			<table border="0" style="margin:0 auto;">
				<tr>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input type="button" class="input80" value="检索" onclick="queryList();"/>
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
