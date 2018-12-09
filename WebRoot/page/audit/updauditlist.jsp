<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=11 ">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>审价项目新增</title><!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/node_modules/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/global.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/local.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<style type="text/css">
/*隐藏掉我们模型的checkbox*/
.my_protocol .input_agreement_protocol {
            display: none;
        }
/*未选中时*/        
.my_protocol .input_agreement_protocol+span {
            background-color: red;
        }
/*选中checkbox时,修改背景图片的位置*/            
.my_protocol .input_agreement_protocol:checked+span {
            background-color: green;
        }
</style>
<script type="text/javascript">
	function checkCheckboxTr(tr, evt) {
		var tds = tr.getElementsByTagName("td");
		var inputs = tds[0].getElementsByTagName("input");
		if(inputs[0].checked) {
			inputs[0].checked = false;
		} else {
			inputs[0].checked = true;
		}
	}
	
	function addAllList() {
		$("#setDisp").empty();
		var select = document.getElementById("listDisp").options;
		for(var i = 0; i < select.length; i++){
			var value = select[i].value;
			var text = select[i].text;
			$("#setDisp").append("<option value='" + value + "'>" + text + "</option>");
		}
	}
	
	function addList() {
		var strList = $("#listDisp").val();
		if(strList == "") {
			alert("请选择一条记录！");
			return;
		} else {
			alert(strList);
			var list = new Array();
			for(var i = 0; i < strList.length; i++){
				var selectset = document.getElementById("setDisp").options;
				for(var k = 0; k < selectset.length; k++){
					var valueset = selectset[k].value;
					if(strList[i] == valueset){
						strList.splice(i, 1);
					}
				}
			}
			alert(strList);
			for(var i = 0; i < strList.length; i++){
				var select = document.getElementById("listDisp").options;
				for(var j = 0; j < select.length; j++){
					var value = select[j].value;
					if(strList[i] == value){
						var text = select[j].text;
						$("#setDisp").append("<option value='" + value + "'>" + text + "</option>");
					}
				}
			}
		}
	}

	function delList() {
		var strList = $("#setDisp").val();
		if(strList == "") {
			alert("请选择一条记录！");
			return;
		} else {
			for(var i = 0; i < strList.length; i++){
				$("#setDisp option[value='" + strList[i] + "']").remove();
			}
		}
	}

	function delAllList() {
		$("#setDisp").empty();
	}

	function upd() {
		var list = "";
		var selectset = document.getElementById("setDisp").options;
		for(var k = 0; k < selectset.length; k++){
			var valueset = selectset[k].value;
			list = list + valueset + ",";
		}
		if(list != ""){
			list = list.substring(0,list.length-1);
		}
		$("#strSetList").attr("value", list);
		document.mainform.action = '<c:url value="/audit/updAuditListDisp.action"></c:url>';
		document.mainform.submit();
	}
	
	function goAuditList() {
		window.location.href = '<c:url value="/audit/showAuditAction.action"></c:url>';
	}
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<div class="row">
		<s:if test="hasActionMessages()">
			<div class="row">
				<span style="color:red; text-align:center;"><s:actionmessage /></span>
			</div>
		</s:if>
			<div class="col-lg-12 right">
				<s:form id="mainform" name="mainform" method="POST">
					<s:hidden name="strSetList" id="strSetList"/>
					<div class="row">
						<div class="col-lg-12 form-group">
							<div class="col-lg-2">
								<table id="listDispTable">
								<tbody id="">
									<tr>
										<td><label class="form-label" for="">显示及输出设定</label></td>
									</tr>
								</tbody>
								</table>
							</div>
							<div class="col-lg-5">
								<select multiple="multiple" size="16" name="listDisp" id="listDisp" class="form-control">
									<s:iterator id="auditAllDisp" value="auditAllDisp" status="st1">
										<option value="<s:property value="id"/>"><s:property value="cnName"/></option>
									</s:iterator>
								</select>
							</div>
							<div class="col-lg-1">
								<div class="col-lg-12">
									<button class="btn btn-success form-control" type="button" onclick="addAllList();">》》</button>
								</div>
								<div class="col-lg-12">
									<button class="btn btn-success form-control" type="button" onclick="addList();">》</button>
								</div>
								<div class="col-lg-12">
									<button class="btn btn-success form-control" type="button" onclick="delList();">《</button>
								</div>
								<div class="col-lg-12">
									<button class="btn btn-success form-control" type="button" onclick="delAllList();">《《</button>
								</div>
							</div>
							<div class="col-lg-5">
								<select multiple size="16" name="setDisp" id="setDisp" class="form-control">
									<s:iterator id="auditListDisp" value="auditListDisp" status="st1">
										<option value="<s:property value="id"/>"><s:property value="cnName"/></option>
									</s:iterator>
								</select>
							</div>
						</div>
						<div class="col-lg-12 form-group">
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-9">
							</div>
							<div class="col-lg-1">
								<button class="btn btn-success form-control" type="button" onclick="goAuditList();">返回</button>
							</div>
							<div class="col-lg-1">
								<button class="btn btn-success form-control" type="button" onclick="upd();">保存</button>
							</div>
						</div>
					</div>
				</s:form>
			</div>
		</div>
	</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath()%>/node_modules/jquery/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath()%>/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/node_modules/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.zh-CN.min.js"></script>
</body>
</html>
