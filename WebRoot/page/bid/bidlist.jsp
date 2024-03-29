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
<title>招标项目检索和一览</title>
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
	function add() {
		document.mainform.action = '<c:url value="/bid/showAddBidAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function updBid() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			$("#updateBidNo").val(id);
			var url = '<c:url value="/bid/showUpdBidAction.action"></c:url>';
			document.mainform.action = url;
			document.mainform.submit();
		}
	}
	
	function upd(bidNo) {
		$("#updateBidNo").val(bidNo);
		var url = '<c:url value="/bid/showUpdBidAction.action"></c:url>';
		document.mainform.action = url;
		document.mainform.submit();
	}
	
	function del() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			if(confirm("确定删除该记录吗？")) {
				document.mainform.action = '<c:url value="/bid/delBidAction.action"></c:url>' + "?delBidNo=" + id;
				document.mainform.submit();
			}
		}
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
	
	function queryList() {
		$("#strProjectManager").val($("#tmpPROJECT_MANAGER").val());
		document.mainform.action = '<c:url value="/bid/queryBidList.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		$("#strProjectManager").val($("#tmpPROJECT_MANAGER").val());
		document.getElementById("startIndex").value = pageNum;
		document.mainform.action = '<c:url value="/bid/turnBidPage.action"></c:url>';
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
	
	function exportBid() {
		$("#strProjectManager").val($("#tmpPROJECT_MANAGER").val());
		document.mainform.action = '<c:url value="/bid/exportBidListAction.action"></c:url>';
		document.mainform.submit();
	}
	
	// 数据源导出
	function exportBidDataRpt() {
		document.mainform.action = '<c:url value="/bid/exportBidDataRptAction.action"></c:url>';
		document.mainform.submit();
	}
	
	// 工程师模板导出
	function exportBidEngineerRpt() {
		document.mainform.action = '<c:url value="/bid/exportBidEngineerRptAction.action"></c:url>';
		document.mainform.submit();
	}
	
	// 财务模板导出
	function exportBidAccountRpt() {
		document.mainform.action = '<c:url value="/bid/exportBidAccountRptAction.action"></c:url>';
		document.mainform.submit();
	}
	
	// 内业模板导出
	function exportBidNeiyeRpt() {
		document.mainform.action = '<c:url value="/bid/exportBidNeiyeRptAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function goBidProgress(bidNo) {
		$("#strBID_NO").val(bidNo);
		document.mainform.action = '<c:url value="/bidprogress/showBidProgressAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function progressBid() {
		var bidNo = getSelectedID();
		if(bidNo == "") {
			alert("请选择一条记录！");
			return;
		} else {
			$("#strBID_NO").val(bidNo);
			document.mainform.action = '<c:url value="/bidprogress/showBidProgressAction.action"></c:url>';
			document.mainform.submit();
		}
	}
	
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />	
		<jsp:include page="../info.jsp" flush="true" />
		<div class="row">
			<div class="collapse navbar-collapse navbar-ex1-collapse">
			<jsp:include page="../menu.jsp" flush="true" />
			<s:if test='#session.toggle_menu_flag == "1"'>
				<div class="col-lg-10 right w100">
				<a class="toggle" href="javascript:;"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
			</s:if>
			<s:else>
				<div class="col-lg-10 right">
				<a class="toggle" href="javascript:;"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
			</s:else>
				<s:form id="mainform" name="mainform" method="POST">
					<s:hidden name="startIndex" id="startIndex"/>
					<s:hidden name="updateBidNo" id="updateBidNo"/>
					<s:hidden name="strProjectManager" id="strProjectManager"/>
					<s:hidden name="strBID_NO" id="strBID_NO"/>
					<h3 class="title">招标项目检索和一览<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
					<div class="row">
						<s:if test="hasActionMessages()">
							<div class="row">
								<span style="color:red; text-align:center;"><s:actionmessage /></span>
							</div>
						</s:if>
						<div class="col-lg-5 form-group">
							<label for="" class="col-lg-2 form-label">招标编号</label>
							<div class="col-lg-4">
								<s:textfield name="strBidNoLow" id="strBidNoLow" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label to">---</label>
							<div class="col-lg-4">
								<s:textfield name="strBidNoHigh" id="strBidNoHigh" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">项目名称</label>
							<div class="col-lg-9">
								<s:textfield name="strProjectName" id="strProjectName" cssClass="form-control" maxlength="30" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-3 form-group">
						 	<label for="" class="col-lg-4 form-label">工程师</label>
						 	<div class="col-lg-8">
						 		<select id="tmpPROJECT_MANAGER" class="form-control">
						 			<option value="" selected="selected">请选择</option>
									<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
										<option value="<s:property value="LOGIN_ID"/>" <s:if test="%{strProjectManager == LOGIN_ID}">selected</s:if>>><s:property value="LOGIN_NAME"/></option>
									</s:iterator>
								</select>
						 	</div>
						</div>
						
						<div class="col-lg-1 form-group">
							<button class="btn btn-success form-control" onclick="queryList();">检索</button>
						</div>
					</div>
					<div class="btns">
						<ul>
							<li><a href="javascript:;" onclick="add();"><i class="fa fa-plus" aria-hidden="true"></i>新增</a></li>
							<li><a href="javascript:;" onclick="updBid();"><i class="fa fa-pencil" aria-hidden="true"></i>修改</a></li>
							<li><a href="javascript:;" onclick="del();"><i class="fa fa-trash" aria-hidden="true"></i>删除</a></li>
						</ul>
					</div>
					<table class="table table-bordered">
						<tr>
							<th></th>
							<th>招标编号</th>
							<th>项目名称</th>
							<th>项目进展</th>
							<th>报名单位数</th>
							<th>缴纳保证金单位数</th>
						</tr>
						<s:iterator id="listBid" value="listBid" status="st1">
							<tr onclick="checkRadioTr(this, event);">
								<td><input name="radioKey" type="radio" value="<s:property value="BID_NO"/>"/></td>
								<td>
									<!-- <a href="javascript:void(0);" onclick="goBidProgress('<s:property value="BID_NO"/>');"><s:property value="BID_NO"/></a> -->
									<a href="javascript:void(0);" onclick="upd('<s:property value="BID_NO"/>');"><s:property value="BID_NO"/></a>
								</td>
								<td><s:property value="PROJECT_NAME"/></td>
								<td>
									<s:if test='FINISH_STATUS == "10"'>取消</s:if>
									<s:elseif test='FINISH_STATUS == "20"'>进行中</s:elseif>
									<s:elseif test='FINISH_STATUS == "52"'>失败（报名不满3家）</s:elseif>
									<s:elseif test='FINISH_STATUS == "54"'>失败（开标不满3家）</s:elseif>
									<s:elseif test='FINISH_STATUS == "56"'>失败（评审失败）</s:elseif>
									<s:elseif test='FINISH_STATUS == "70"'>终止</s:elseif>
									<s:elseif test='FINISH_STATUS == "90"'>完成</s:elseif>
									<s:else><s:property value="FINISH_STATUS"/></s:else>
								</td>
								<td>
									<s:property value="joinBidCompList.size()"/>
								</td>
								<td>
									<s:property value="bondBidCompList.size()"/>
								</td>
							</tr>
						</s:iterator>
					</table>
					<jsp:include page="../turning.jsp" flush="true" />
					<div class="operationBtns">
						<button type="button" class="btn btn-success" onclick="exportBid();">导出</button>
						<button type="button" class="btn btn-success" onclick="progressBid();">进展状态</button>
					</div>
					<div class="operationBtns">
						<button type="button" class="btn btn-success" onclick="exportBidDataRpt();">数据源导出</button>
						<button type="button" class="btn btn-success" onclick="exportBidEngineerRpt();">工程师模板导出</button>
						<button type="button" class="btn btn-success" onclick="exportBidAccountRpt();">财务模板导出</button>
						<button type="button" class="btn btn-success" onclick="exportBidNeiyeRpt();">内业模板导出</button>
					</div>
				</s:form>
			</div>
		</div>
	</div>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath()%>/node_modules/jquery/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath()%>/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.zh-CN.min.js"></script>
<script>
	$(function () { $('#collapseTwo').collapse('toggle')});
	
	$('.datepicker').parent().datepicker({
		"autoclose":true,"format":"yyyy-mm-dd","daysOfWeekHighlighted":"[0,6]","language":"zh-CN",clearBtn: true
	});
	
	$('.toggle i').click(function(){
		var param = new Object();
		if($(this).hasClass('fa-angle-double-left')) {
			param.toggleMenuFlag = "1";
			$('.left').hide();
			$(this).removeClass('fa-angle-double-left');
			$(this).addClass('fa-angle-double-right');
			$(this).parent().parent('.right').addClass('w100');
		} else {
			param.toggleMenuFlag = "0";
			$('.left').show();
			$(this).addClass('fa-angle-double-left');
			$(this).removeClass('fa-angle-double-right');
			$(this).parent().parent('.right').removeClass('w100');
		}
		$.getJSON('<%=request.getContextPath()%>/home/toggleMenuAction.action', param, function(data) {
		});
	});
</script>
</body>
</html>