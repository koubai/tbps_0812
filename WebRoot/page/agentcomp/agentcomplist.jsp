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
<title>委托公司信息一览</title>
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
		var url = '<c:url value="/agentcomp/showAddAgentCompAction.action"></c:url>' + "?date=" + new Date();
		window.open(url);
		//window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:750px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function upd() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			var url = '<c:url value="/agentcomp/showUpdAgentCompAction.action"></c:url>'
					+ "?updateAgentCompNo=" + id
					+ "&date=" + new Date();
			window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:750px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
		}
	}
	
	function del() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			if(confirm("确定删除该记录吗？")) {
				document.mainform.action = '<c:url value="/agentcomp/delAgentCompAction.action"></c:url>' + "?delAgentCompNo=" + id;
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
	
	function exportExcel() {
		document.mainform.action = '<c:url value="/agentcomp/exportAgentCompAction.action"></c:url>';
		document.mainform.submit();
	}

	function goHome() {
		document.mainform.action = '<c:url value="/home/goHomeAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryList() {
		document.mainform.action = '<c:url value="/agentcomp/queryAgentCompList.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		document.getElementById("startIndex").value = pageNum;
		document.mainform.action = '<c:url value="/agentcomp/turnAgentCompPage.action"></c:url>';
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
					<h3 class="title">委托公司信息一览<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
					<div class="row">
						<div class="col-lg-4 form-group">
							<label for="" class="col-lg-4 form-label">委托公司名称</label>
							<div class="col-lg-8">
								<s:textfield name="strAgentCompName" id="strAgentCompName" cssClass="form-control" maxlength="4" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-4 form-group">
							<label for="" class="col-lg-4 form-label">投标状态</label>
							<div class="col-lg-8">
								<s:if test='%{radioCom == "1"}'>
									<input name="radioCom" type="radio" value="1" checked="checked"/>
									<label class="form-label" for="">委托公司</label>
									<input name="radioCom" type="radio" value="3"/>
									<label class="form-label" for="">承揽公司</label>
								</s:if>
								<s:elseif test='%{radioCom == "3"}'>
									<input name="radioCom" type="radio" value="1"/>
									<label class="form-label" for="">委托公司</label>
									<input name="radioCom" type="radio" value="3" checked="checked"/>
									<label class="form-label" for="">承揽公司</label>
								</s:elseif>
								<s:else>
									<input name="radioCom" type="radio" value="1"/>
									<label class="form-label" for="">委托公司</label>
									<input name="radioCom" type="radio" value="3"/>
									<label class="form-label" for="">承揽公司</label>
								</s:else>
							</div>
						</div>
						<div class="col-lg-2 form-group">
							<button class="btn btn-success form-control" onclick="queryList();">检索</button>
						</div>
					</div>
					<div class="btns">
						<ul>
							<li><a href="javascript:;" onclick="add();"><i class="fa fa-plus" aria-hidden="true"></i>新增</a></li>
							<!-- <li><a href="javascript:;" onclick="upd();"><i class="fa fa-pencil" aria-hidden="true"></i>修改</a></li> -->
							<li><a href="javascript:;" onclick="del();"><i class="fa fa-trash" aria-hidden="true"></i>删除</a></li>
						</ul>
					</div>
					<table class="table table-bordered">
						<tr>
							<th></th>
							<th>委托公司代码</th>
							<th>委托公司名称</th>
							<th>联系人1</th>
							<th>联系人2</th>
							<th>联系人3</th>
							<th>联系人4</th>
							<th>联系人5</th>
							<th>纳税人识别号</th>
							<th>开户行</th>
							<th>账号</th>
							<th>备注</th>
						</tr>
						<s:iterator id="listAgentComp" value="listAgentComp" status="st1">
							<tr>
								<td><input name="radioKey" type="radio" value="<s:property value="ANGENT_COMP_NO"/>"/></td>
								<td><s:property value="ANGENT_COMP_NO"/></td>
								<td>
									<div noWrap style="width:180px;text-overflow:ellipsis;overflow:hidden">
										<s:property value="ANGENT_COMP_NAME"/>
									</div>
								</td>
								<td><s:property value="CO_MANAGER1"/></td>
								<td><s:property value="CO_MANAGER2"/></td>
								<td><s:property value="CO_MANAGER3"/></td>
								<td><s:property value="CO_MANAGER4"/></td>
								<td><s:property value="CO_MANAGER5"/></td>
								<td><s:property value="RESERVE1"/></td>
								<td><s:property value="RESERVE2"/></td>
								<td><s:property value="RESERVE3"/></td>
								<td>
									<div noWrap style="width:150px;text-overflow:ellipsis;overflow:hidden">
										<s:property value="MEMO1"/>
									</div>
								</td>
							</tr>
						</s:iterator>
					</table>
					<jsp:include page="../turning.jsp" flush="true" />
					<div class="operationBtns">
						<button type="button" class="btn btn-success" onclick="exportExcel();">下载</button>
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
