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
<title>专家信息一览</title>
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
	//清空专业查询条件
	function clearMajor() {
		document.getElementById("strExpertMajor").value = "";
		document.getElementById("strExpertMajorName").value = "";
		document.getElementById("expertMajorName").innerHTML = "";
	}
	
	function add() {
		document.mainform.action = '<c:url value="/expertlib/showAddExpertLibAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function upd() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			$("#updateExpertLibSeq").val(id);
			document.mainform.action = '<c:url value="/expertlib/showUpdExpertLibAction.action"></c:url>';
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
				document.mainform.action = '<c:url value="/expertlib/delExpertLibAction.action"></c:url>' + "?delExpertLibSeq=" + id;
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
		document.mainform.action = '<c:url value="/expertlib/exportExpertLibAction.action"></c:url>';
		document.mainform.submit();
	}

	function goHome() {
		document.mainform.action = '<c:url value="/home/goHomeAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryList() {
		document.mainform.action = '<c:url value="/expertlib/queryExpertLibList.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
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
	
	function clearMajor() {
		document.getElementById("strExpertMajor").value = "";
		document.getElementById("strExpertMajorName").value = "";
		document.getElementById("tmpExpertMajorName").value = "";
	}
	
	//显示列表选择模态窗体
	function showMajorSelect() {
		clearCheckBox();
		//禁用 Bootstrap 模态框(Modal) 点击空白时自动关闭
		$('#majorModal').modal({backdrop: 'static', keyboard: false});
		$('#majorModal').modal('show');
	}
	
	function selectMajor() {
		var list = document.getElementsByName("majorKey");
		var querymajor = "";
		var querymajorname = "";
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				querymajorname += list[i].title + "，";
				querymajor += list[i].value + ",";
			}
		}
		if(querymajor != "") {
			querymajor = querymajor.substring(0, querymajor.length - 1);
			querymajorname = querymajorname.substring(0, querymajorname.length - 1);
			//专业查询条件
			document.getElementById("strExpertMajor").value = querymajor;
			document.getElementById("strExpertMajorName").value = querymajorname;
			document.getElementById("tmpExpertMajorName").value = querymajorname;
			
			//隐藏模态窗体
			$('#majorModal').modal('hide');
		} else {
			alert("请选择专业！");
		}
	}
	
	function clearCheckBox() {
		var list = document.getElementsByName("majorKey");
		for(var i = 0; i < list.length; i++) {
			list[i].checked = false;
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
					<s:hidden name="updateExpertLibSeq" id="updateExpertLibSeq"/>
					
					<s:hidden name="strExpertMajor" id="strExpertMajor"/>
					<s:hidden name="strExpertMajorName" id="strExpertMajorName"/>
					<h3 class="title">专家信息一览<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
					<div class="row">
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">姓名</label>
							<div class="col-lg-9">
								<s:textfield name="strExpertName" id="strExpertName" cssClass="form-control" maxlength="24" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-3 form-label">专业：</label>
							<div class="col-lg-5">
								<input type="text" id="tmpExpertMajorName" disabled="disabled" class="form-control" value="<s:property value="strExpertMajorName"/>">
							</div>
							<div class="col-lg-3">
								<button type="button" class="btn btn-success" onclick="showMajorSelect();">选择</button>
								<button type="button" class="btn btn-success" onclick="clearMajor();">清空</button>
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
							<th>姓名</th>
							<th>专业</th>
							<th>职称</th>
							<th>手机电话</th>
							<th>性别</th>
							<th>就职公司</th>
							<th>备注</th>
						</tr>
						<s:iterator id="listExpertLib" value="listExpertLib" status="st1">
							<tr>
								<td><input name="radioKey" type="radio" value="<s:property value="EXPERT_SEQ"/>"/></td>
								<td><s:property value="EXPERT_NAME"/></td>
								<td>
									<s:property value="EXPERT_MAJOR_NAME"/>
								</td>
								<td><s:property value="EXPERT_QULI"/></td>
								
								<td><s:property value="EXPERT_TEL1"/></td>
								<td>
									<s:if test='EXPERT_GENDER == "1"'>男</s:if>
									<s:else>女</s:else>
								</td>
								<td><s:property value="EXPERT_COMP"/></td>
								<td><s:property value="MEMO1"/></td>
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
	<div class="modal fade" id="majorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 1000px;">
			<div class="modal-content">
				<form class="form-horizontal" role="form">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							专业选择
						</h4>
					</div>
					<div class="modal-body" style="height: 360px;">
						<div style="height: 335px; overflow-y: auto;">
							<table class="table table-bordered">
								<tbody id="majorData">
									<s:iterator id="majorAllList" value="majorAllList" status="st1">
										<tr>
											<td>
												<input type="checkbox" name="majorKey" title="<s:property value="MAJORNAME"/>" value="<s:property value="MAJORCODE"/>"/>
											</td>
											<td style="display: none;">
												<input type="hidden" value="<s:property value="MAJORCODE"/>">
												<input type="hidden" value="<s:property value="MAJORNAME"/>">
											</td>
											<td><s:property value="MAJORCODE"/></td>
											<td><s:property value="MAJORNAME"/></td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="selectMajor();">确定</button>
						<button type="button" class="btn btn-primary" onclick="clearCheckBox();">清除</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</form>
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
