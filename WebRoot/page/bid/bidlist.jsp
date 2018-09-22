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
	/*	
    var formId = 'mainform';
    window.onbeforeunload = function () {
        //用表单id做键名称
        $.jStorage.set(formId, $('#' + formId).serializeArray());
    }
    //提交成功后记得调用$.jStorage.deleteKey(formId)删除缓存数据
    window.onload = function () {
        var o = $.jStorage.get(formId);
        if (o) {//有缓存数据
            var elements = document.getElementById(formId).elements;
            for (var i = 0; i < o.length; i++) {
                elements[o[i].name].value = o[i].value;
            }
        }
    }
	*/
	function add() {
		document.mainform.action = '<c:url value="/bid/showAddBidAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function upd() {
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
	
	function del() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			if(confirm("确定删除该记录吗？")) {
				setOpenDate();
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
	
	function setOpenDate() {
		$("#strOpenDateLow").attr("value", $("#openDateLow").val());
		$("#strOpenDateHigh").attr("value", $("#openDateHigh").val());
	}

	function queryList() {
		setOpenDate();
		document.mainform.action = '<c:url value="/bid/queryBidList.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		setOpenDate();
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
		document.mainform.action = '<c:url value="/bid/exportBidListAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function exportAllBidInfo() {
		exportPurchaseListAction
	}
	
	//专家信息下载
	function exportBidExpert() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			//下载专家信息
			var url = '<c:url value="/bid/exportBidExpertAction.action"></c:url>' + "?exportExpertBidNo=" + id;
			document.mainform.action = url;
			document.mainform.submit();
		}
	}
	
	function queryAgentCommon() {
		var url = '<c:url value="/agentcomp/showAgentCompCommonAction.action"></c:url>' + "?strKey=strAgentNo&date=" + new Date();
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:1000px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function exportYear() {
		var url = '<c:url value="/bid/showExportYearAction.action"></c:url>' + "?date=" + new Date();
		//window.showModalDialog(url, window, "dialogheight:1000px;dialogwidth:1000px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
		window.open(url, window, 'height=1000, width=1000, top=5, left=100, status=0,resizable=no,scrollbars=yes');
	}
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />	
		<jsp:include page="../info.jsp" flush="true" />
		<div class="row">
			<div class="collapse navbar-collapse navbar-ex1-collapse">
			<jsp:include page="../menu.jsp" flush="true" />
			<div class="col-lg-10 right">
			 	<a class="toggle" href="javascript:;"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
				<s:form id="mainform" name="mainform" method="POST">
					<s:hidden name="startIndex" id="startIndex"/>
					<s:hidden name="updateBidNo" id="updateBidNo"/>
					<h3 class="title">招标项目检索和一览<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
					<div class="row">
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-2 form-label">招标编号</label>
							<div class="col-lg-4">
								<s:textfield name="strBidNoLow" id="strBidNoLow" cssClass="form-control" maxlength="13" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label to">---</label>
							<div class="col-lg-4">
								<s:textfield name="strBidNoHigh" id="strBidNoHigh" cssClass="form-control" maxlength="13" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">项目名称</label>
							<div class="col-lg-9">
								<s:textfield name="strProjectName" id="strProjectName" cssClass="form-control" maxlength="30" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-2 form-group">
							<button class="btn btn-success form-control" onclick="queryList();">检索</button>
						</div>
					</div>
					<div class="btns">
						<ul>
							<li><a href="javascript:;" onclick="add();"><i class="fa fa-plus" aria-hidden="true"></i>新增</a></li>
							<li><a href="javascript:;" onclick="upd();"><i class="fa fa-pencil" aria-hidden="true"></i>修改</a></li>
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
							<tr>
								<td><input name="radioKey" type="radio" value="<s:property value="BID_NO"/>"/></td>
								<td><s:property value="BID_NO"/></td>
								<td><s:property value="PROJECT_NAME"/></td>
								<td>
									<s:if test='FINISH_STATUS == "10"'>取消</s:if>
									<s:elseif test='FINISH_STATUS == "20"'>进行中</s:elseif>
									<s:elseif test='FINISH_STATUS == "52"'>失败（报名不满6家）</s:elseif>
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
						<button type="button" class="btn btn-success" onclick="">导出</button>
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
	$('.datepicker').parent().datepicker({
		"autoclose":true,"format":"yyyy-mm-dd","language":"zh-CN"
	});
	
	$('.toggle i').click(function(){
		$('.left').toggle();
		$(this).toggleClass('fa-angle-double-left');
		$(this).toggleClass('fa-angle-double-right');
		$(this).parent().parent('.right').toggleClass('w100');
	});
</script>
</body>
</html>