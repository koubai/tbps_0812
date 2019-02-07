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
<title>消息一览</title>
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
		document.mainform.action = '<c:url value="/mesg/showAddMesgAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function upd() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			$("#strUpdMesgId").val(id);
			document.mainform.action = '<c:url value="/mesg/showUpdMesgAction.action"></c:url>';
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
				document.mainform.action = '<c:url value="/mesg/delMesgAction.action"></c:url>' + "?delMesgId=" + id;
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
	
	function goHome() {
		document.mainform.action = '<c:url value="/home/goHomeAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function queryList() {
		document.mainform.action = '<c:url value="/mesg/queryMesgList.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		document.getElementById("startIndex").value = pageNum;
		document.mainform.action = '<c:url value="/mesg/turnMesgPage.action"></c:url>';
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
	
	function showMesgDetail(obj, showMesgId, MSG_TYPE) {
		$("#tmpReceiveUser").val("");
		$("#tmpSendUser").val("");
		$("#tmpSendTime").val("");
		$("#tmpMSG_TITLE").val("");
		$("#tmpMSG_CONTENT").val("");
		var param = new Object();
		param.showMesgId = showMesgId;
		$.getJSON('<%=request.getContextPath()%>/mesg/queryMesgAjax.action', param, function(data) {
			if(data.resultCode == 0) {
				//加载数据
				$("#tmpReceiveUser").val(data.data.RECEIVE_USER_NAME);
				$("#tmpSendUser").val(data.data.SEND_USER_NAME);
				$("#tmpSendTime").val(data.data.showINSERT_DATE);
				$("#tmpMSG_TITLE").val(data.data.MSG_TITLE);
				$("#tmpMSG_CONTENT").val(data.data.MSG_CONTENT);
				//已读标识
				if(data.data.isRECEIVE == "1") {
					//接收消息列表，需要把状态改成已读
					if(MSG_TYPE == "20") {
						var tr = obj.parentNode.parentNode;
						var tds = tr.getElementsByTagName("td");
						tds[3].innerHTML = "已读";
					}
				}
				//禁用 Bootstrap 模态框(Modal) 点击空白时自动关闭
				$('#mesgModal').modal({backdrop: 'static', keyboard: false});
				$('#mesgModal').modal('show');
			} else {
				alert(data.resultMessage);
			}
		});
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
					<s:hidden name="strUpdMesgId" id="strUpdMesgId"/>
					<s:hidden name="delMesgId" id="delMesgId"/>
					<h3 class="title">消息一览<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
					<div class="row">
						<s:if test="hasActionMessages()">
							<div class="row">
								<span style="color:red; text-align:center;"><s:actionmessage /></span>
							</div>
						</s:if>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">消息标题</label>
							<div class="col-lg-9">
								<s:textfield name="strMesgTitle" id="strMesgTitle" cssClass="form-control" maxlength="32" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">消息类型</label>
						 	<div class="col-lg-9">
						 		<select id="strMesgType" name="strMesgType" class="form-control">
						 			<s:if test='strMesgType == "10"'>
						 				<option value="10" selected="selected">发送</option>
						 				<option value="20">接收</option>
						 			</s:if>
						 			<s:elseif test='strMesgType == "20"'>
						 				<option value="10">发送</option>
						 				<option value="20" selected="selected">接收</option>
						 			</s:elseif>
						 			<s:else>
						 				<option value="10">发送</option>
						 				<option value="20" selected="selected">接收</option>
						 			</s:else>
								</select>
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
							<th>消息标题</th>
							<th>消息类型</th>
							<th>消息状态</th>
							<th>发送者</th>
							<th>接收者</th>
							<th>发送日期</th>
						</tr>
						<s:iterator id="mesgList" value="mesgList" status="st1">
							<tr>
								<td><input name="radioKey" type="radio" value="<s:property value="MSG_SEQ"/>"/></td>
								<td>
									<a href="javascript:;" onclick="showMesgDetail(this,'<s:property value="MSG_SEQ"/>', '<s:property value="MSG_TYPE"/>');"><s:property value="MSG_TITLE"/></a>
								</td>
								<td>
									<s:if test='MSG_TYPE == "10"'>
										发送
									</s:if>
									<s:elseif test='MSG_TYPE == "20"'>
										接收
									</s:elseif>
									<s:else>
										<s:property value="MSG_TYPE"/>
									</s:else>
								</td>
								<td>
									<s:if test='strMesgType == "10"'>
										<s:if test='SEND_STATUS == "10"'>
											未发送
										</s:if>
										<s:elseif test='SEND_STATUS == "20"'>
											已发送
										</s:elseif>
										<s:elseif test='SEND_STATUS == "30"'>
											废弃
										</s:elseif>
									</s:if>
									<s:elseif test='strMesgType == "20"'>
										<s:if test='RECEIVE_STATUS == "10"'>
											未读
										</s:if>
										<s:elseif test='RECEIVE_STATUS == "20"'>
											已读
										</s:elseif>
										<s:elseif test='RECEIVE_STATUS == "30"'>
											删除
										</s:elseif>
									</s:elseif>
								</td>
								<td><s:property value="SEND_USER_NAME"/></td>
								<td><s:property value="RECEIVE_USER_NAME"/></td>
								<td><s:date name="INSERT_DATE" format="yyyy/MM/dd HH:mm:ss"/></td>
							</tr>
						</s:iterator>
					</table>
					<jsp:include page="../turning.jsp" flush="true" />
					<div class="operationBtns">
					</div>
				</s:form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="mesgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 700px;">
			<div class="modal-content">
				<form class="form-horizontal" role="form">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							消息明细
						</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-2 control-label">收件人</label>
							<div class="col-sm-9">
								<input type="text" id="tmpReceiveUser" class="form-control" disabled="disabled">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">发件人</label>
							<div class="col-sm-9">
								<input type="text" id="tmpSendUser" class="form-control" disabled="disabled">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">发送时间</label>
							<div class="col-sm-9">
								<input type="text" id="tmpSendTime" class="form-control" disabled="disabled">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">消息标题</label>
							<div class="col-sm-9">
								<input type="text"  id="tmpMSG_TITLE" class="form-control" disabled="disabled">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">消息内容</label>
							<div class="col-sm-9">
								<textarea name="" id="tmpMSG_CONTENT" cols="" rows="5" disabled="disabled" class="form-control"><s:property value="addMesgDto.MSG_CONTENT"/></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
	$(function () { $('#collapseSix').collapse('toggle')});
	
	$('.datepicker').parent().datepicker({
		"autoclose":true,"format":"yyyy-mm-dd","language":"zh-CN","daysOfWeekHighlighted":"[0,6]",clearBtn: true
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
