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
<title>招标项目信息更新</title>
<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/global.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
	function add() {
		if(checkdata()) {
			if(confirm("确定修改吗？")) {
				document.mainform.action = '<c:url value="/bidcntrct/updBidCntrct.action"></c:url>';
				document.mainform.submit();
			}
		}
	}
	
	function checkdata() {
		var CNTRCT_NO = $("#CNTRCT_NO").val();
		var CNTRCT_YEAR = $("#CNTRCT_YEAR").val();
		$("#CNTRCT_ST_DATE").val($("#tmpCNTRCT_ST_DATE").val());
		$("#CNTRCT_ED_DATE").val($("#tmpCNTRCT_ED_DATE").val());
		
		$("#BID_COMP_NO").val($("#agentNo").val());
		$("#BID_COMP_NAME").val($("#agentCoName").val());
		$("#CO_MANAGER1").val($("#agentCoManager").val());
		$("#CO_MANAGER_TEL1").val($("#agentCoManagerTel").val());
		$("#CO_ADDRESS1").val($("#agentCoPostAddress").val());
		$("#CO_MANAGER_EMAIL1").val($("#AGENT_CO_MAIL").val());
		
		var CNTRCT_ST_DATE = $("#CNTRCT_ST_DATE").val();
		var CNTRCT_ED_DATE = $("#CNTRCT_ED_DATE").val();
		var CNTRCT_TYPE = $("#CNTRCT_TYPE").val();
		var BID_COMP_NO = $("#BID_COMP_NO").val();
		
		var CO_MANAGER1 = $("#CO_MANAGER1").val();
		var CO_MANAGER_TEL1 = $("#CO_MANAGER_TEL1").val();
		var CO_ADDRESS1 = $("#CO_ADDRESS1").val();
		var CO_MANAGER_EMAIL1 = $("#CO_MANAGER_EMAIL1").val();
		
		if(CNTRCT_NO == "") {
			alert("合同编号不能为空！");
			$("#CNTRCT_NO").focus();
			return false;
		}
		if(CNTRCT_YEAR == "") {
			alert("合同年份不能为空！");
			$("#CNTRCT_YEAR").focus();
			return false;
		}
		if(CNTRCT_ST_DATE == "") {
			alert("合同开始日期不能为空！");
			$("#CNTRCT_ST_DATE").focus();
			return false;
		}
		if(CNTRCT_ED_DATE == "") {
			alert("合同结束日期不能为空！");
			$("#CNTRCT_ED_DATE").focus();
			return false;
		}
		if(CNTRCT_TYPE == "") {
			alert("请选择合同类别！");
			$("#CNTRCT_TYPE").focus();
			return false;
		}
		if(BID_COMP_NO == "") {
			alert("请选择委托公司！");
			$("#agentNo").focus();
			return false;
		}
		if(CO_MANAGER1 == "") {
			alert("委托公司联系人不能为空！");
			$("#agentCoManager").focus();
			return false;
		}
		if(CO_MANAGER_TEL1 == "") {
			alert("委托公司联系方式不能为空！");
			$("#agentCoManagerTel").focus();
			return false;
		}
		if(CO_ADDRESS1 == "") {
			alert("委托公司地址不能为空！");
			$("#agentCoPostAddress").focus();
			return false;
		}
		if(CO_MANAGER_EMAIL1 != "" && !isMail(CO_MANAGER_EMAIL1)) {
			alert("请输入正确的委托公司邮箱！");
			$("#AGENT_CO_MAIL").focus();
			//$("#agent_mail_pr").focus();
			return false;
		}
		return true;
	}
	
	//显示列表选择模态窗体
	function showAgentComSelect() {
		$("#agentCompNoLow").val("");
		$("#agentCompNoHigh").val("");
		$("#agentCompName").val("");
		//查询委托公司
		querySelectPageAjax("0");
		//禁用 Bootstrap 模态框(Modal) 点击空白时自动关闭
		$('#agentCompModal').modal({backdrop: 'static', keyboard: false});
		$('#agentCompModal').modal('show');
	}
	
	/**
	 * 注：翻页函数，每个列表选择模态窗体必须实现这个函数
	 */
	function querySelectPageAjax(index) {
		//各个模块自己的参数
		var agentCompNoLow = $("#agentCompNoLow").val();
		var agentCompNoHigh = $("#agentCompNoHigh").val();
		var agentCompName = $("#agentCompName").val();
		var param = new Object();
		param.agentCompNoLow = agentCompNoLow;
		param.agentCompNoHigh = agentCompNoHigh;
		param.agentCompName = agentCompName;
		param.agentAddFlag = "1";
		
		//-----共通1 start-----
		//页码
		param.ajaxPageIndex = index;
		//总记录数
		var ajaxTotalCount = $("#ajaxTotalCount").val();
		if(ajaxTotalCount == "") {
			ajaxTotalCount = "0";
		}
		param.ajaxTotalCount = ajaxTotalCount;
		//-----共通1 end-----
		
		$.getJSON('<%=request.getContextPath()%>/agentcomp/queryAgentCompAjax.action', param, function(data) {
			if(data.resultCode == 0) {
				var items = data.data.items;
				//数据列表
				$("#agentCompData").empty();
				$.each(items, function(i, n) {
					var html = "";
					html += '<tr>';
					html += '	<td><input name="agentCompKey" type="radio" value=""/></td>';
					html += '	<td style="display: none;">';
					html += '		<input type="hidden" value="' + n.ANGENT_COMP_NO + '">';
					html += '		<input type="hidden" value="' + n.ANGENT_COMP_NAME + '">';
					html += '		<input type="hidden" value="' + n.CO_MANAGER1 + '">';
					html += '		<input type="hidden" value="' + n.CO_MANAGER_TEL1 + '">';
					html += '		<input type="hidden" value="' + n.CO_ADDRESS1 + '">';
					html += '		<input type="hidden" value="' + n.CO_MAIL1 + '">';
					html += '	</td>';
					html += '	<td>' + n.ANGENT_COMP_NO + '</td>';
					html += '	<td>' + n.ANGENT_COMP_NAME + '</td>';
					html += '	<td>' + n.CO_MANAGER1 + '</td>';
					html += '	<td>' + n.CO_MANAGER_TEL1 + '</td>';
					html += '</tr>';
					$("#agentCompData").append(html);
				});
				
				//-----共通2 start-----
				//分页页码
				$("#ajaxpagenum").val("");
				var totalPage = data.data.totalPage;
				//总数据量
				var totalCount = data.data.totalCount;
				totalPage = parseInt(totalPage);
				totalCount = parseInt(totalCount);
				$("#ajaxTotalPage").val(totalPage);
				$("#ajaxTotalCount").val(totalCount);
				//分页
				var skipList = data.data.skipList;
				$("#ajaxskiplist").empty();
				//第一页
				$("#ajaxskiplist").append('<li><a href="javascript:void(0);" onclick="turningAjaxPage(1);">&laquo;</a></li>');
				$.each(skipList, function(ii, nn) {
					if((parseInt(nn) - 1) == parseInt(index)) {
						$("#ajaxskiplist").append('<li class="active"><a href="javascript:void(0);">' + nn + '</a></li>');
					} else {
						$("#ajaxskiplist").append('<li><a href="javascript:void(0);" onclick="turningAjaxPage(' + nn + ');">' + nn + '</a></li>');
					}
				});
				//页信息
				$("#ajaxPageInfo").empty();
				var startIndex = data.data.startIndex;
				startIndex = parseInt(startIndex);
				if(totalPage == 0) {
					totalPage = 1;
				}
				var ajaxPageInfo = '第' + (startIndex + 1) + '页/共' + totalPage + '页&nbsp;&nbsp;&nbsp;&nbsp;共' + totalCount + '条记录';
				$("#ajaxPageInfo").append(ajaxPageInfo);
				//最后一页
				$("#ajaxskiplist").append('<li><a href="javascript:void(0);" onclick="turningLastPage();">&raquo;</a></li>');
				//-----共通2 end-----
			} else {
				alert(data.resultMessage);
			}
		});
		//agentCompData
	}
	
	//列表页选择确定按钮
	function selectAgentComp() {
		var obj = null;
		var list = document.getElementsByName("agentCompKey");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				obj = list[i];
				break;
			}
		}
		if(obj != null) {
			var tr = obj.parentNode.parentNode;
			var tds = tr.getElementsByTagName("td");
			//第二列是隐藏列
			var inputs = tds[1].getElementsByTagName("input");
			var ANGENT_COMP_NO = inputs[0].value;
			var ANGENT_COMP_NAME = inputs[1].value;
			var CO_MANAGER1 = inputs[2].value;
			var CO_MANAGER_TEL1 = inputs[3].value;
			var CO_ADDRESS1 = inputs[4].value;
			var CO_MANAGER_EMAIL1 = inputs[5].value;
			$('#agentNo').val(ANGENT_COMP_NO);
			$('#agentCoName').val(ANGENT_COMP_NAME);
			$('#agentCoManager').val(CO_MANAGER1);
			$('#agentCoManagerTel').val(CO_MANAGER_TEL1);
			$('#agentCoPostAddress').val(CO_ADDRESS1);
			$('#AGENT_CO_MAIL').val(CO_MANAGER_EMAIL1);
			//隐藏模态窗体
			$('#agentCompModal').modal('hide');
		} else {
			alert("请选择一条记录！");
		}
	}
	
	function goBidCntrctList() {
		window.location.href = '<c:url value="/bidcntrct/queryBidCntrctList.action"></c:url>';
	}
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<s:form id="mainform" name="mainform" method="POST">
			<s:hidden name="updBidCntrctDto.CNTRCT_ST_DATE" id="CNTRCT_ST_DATE"></s:hidden>
			<s:hidden name="updBidCntrctDto.CNTRCT_ED_DATE" id="CNTRCT_ED_DATE"></s:hidden>
			<s:hidden name="updBidCntrctDto.BID_COMP_NO" id="BID_COMP_NO"></s:hidden>
			<s:hidden name="updBidCntrctDto.BID_COMP_NAME" id="BID_COMP_NAME"></s:hidden>
			<s:hidden name="updBidCntrctDto.CO_MANAGER1" id="CO_MANAGER1"></s:hidden>
			<s:hidden name="updBidCntrctDto.CO_MANAGER_TEL1" id="CO_MANAGER_TEL1"></s:hidden>
			<s:hidden name="updBidCntrctDto.CO_ADDRESS1" id="CO_ADDRESS1"></s:hidden>
			<s:hidden name="updBidCntrctDto.CO_MANAGER_EMAIL1" id="CO_MANAGER_EMAIL1"></s:hidden>
			<div class="row">
				<div class="container-fluid">
					<s:if test="hasActionMessages()">
						<div class="row">
							<span style="color:red; text-align:center;"><s:actionmessage /></span>
						</div>
					</s:if>
					<div class="row mgt15">
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label"><span class="red">*</span>合同编号</label>
							<div class="col-lg-9">
								<s:textfield name="updBidCntrctDto.CNTRCT_NO" disabled="true" id="CNTRCT_NO" cssClass="form-control" maxlength="20" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label"><span class="red">*</span>年份</label>
							<div class="col-lg-9">
								<s:textfield name="updBidCntrctDto.CNTRCT_YEAR" id="CNTRCT_YEAR" cssClass="form-control" maxlength="20" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-2 form-label"><span class="red">*</span>合同期限</label>
							<div class="col-lg-4">
								<div class="input-group date" data-provide="datepicker">
									<input id="tmpCNTRCT_ST_DATE" value="<s:date name="updBidCntrctDto.CNTRCT_ST_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label to">---</label>
							<div class="col-lg-4">
								<div class="input-group date" data-provide="datepicker">
									<input id="tmpCNTRCT_ED_DATE" value="<s:date name="updBidCntrctDto.CNTRCT_ED_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label"><span class="red">*</span>合同类别</label>
							<div class="col-lg-9">
								<select name="updBidCntrctDto.CNTRCT_TYPE" id="CNTRCT_TYPE" class="form-control">
									<option value="">请选择</option>
									<s:if test='updBidCntrctDto.CNTRCT_TYPE == "1"'>
										<option value="1" selected="selected">招标</option>
										<option value="4">竞价</option>
									</s:if>
									<s:elseif test='updBidCntrctDto.CNTRCT_TYPE == "4"'>
										<option value="1">招标</option>
										<option value="4" selected="selected">竞价</option>
									</s:elseif>
									<s:else>
										<option value="1">招标</option>
										<option value="4">竞价</option>
									</s:else>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="box">
								<h5>委托公司信息</h5>
								<div class="row">
									<label class="col-lg-4 form-label">代码</label>
									<div class="col-lg-5">
										<input type="text" id="agentNo" disabled="disabled" maxlength="4" class="form-control" value="<s:property value="updBidCntrctDto.BID_COMP_NO" />" />
									</div>
									<div class="col-lg-3"><button type="button" class="btn btn-success form-control" onclick="showAgentComSelect();">检索</button></div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">单位名称</label>
									<div class="col-lg-8">
										<input type="text" id="agentCoName" disabled="disabled" maxlength="40" class="form-control" value="<s:property value="updBidCntrctDto.BID_COMP_NAME" />" />
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">联系人</label>
									<div class="col-lg-8">
										<input type="text" id="agentCoManager" maxlength="6" class="form-control" value="<s:property value="updBidCntrctDto.CO_MANAGER1" />" />
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">联系方式</label>
									<div class="col-lg-8">
										<input type="text" id="agentCoManagerTel" maxlength="30" class="form-control" value="<s:property value="updBidCntrctDto.CO_MANAGER_TEL1" />" />
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">地址</label>
									<div class="col-lg-8">
										<input type="text" id="agentCoPostAddress" maxlength="80" class="form-control" value="<s:property value="updBidCntrctDto.CO_ADDRESS1" />" />
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">邮箱</label>
									<div class="col-lg-8">
										<input type="text" id="AGENT_CO_MAIL" maxlength="100" class="form-control" value="<s:property value="updBidCntrctDto.CO_MANAGER_EMAIL1" />" />
										<input type="hidden" id="agent_mail_pr">
										<input type="hidden" id="agent_mail_suffix">
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">开票信息</label>
									<div class="col-lg-8">
										<s:textfield name="updBidCntrctDto.CO_TAX" id="CO_TAX" cssClass="form-control" maxlength="80" theme="simple"></s:textfield>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="operationBtns addBtns mgt15 btn3">
						<button type="button" class="btn btn-success" onclick="add();">保存</button>
						<button type="button" class="btn btn-success" onclick="goBidCntrctList();">返回</button>
					</div>
				</div>
			</div>
		</s:form>
	</div>
	<!-- 模拟模态框 -->
	<div class="modal fade" id="agentCompModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 1000px;">
			<div class="modal-content">
				<form class="form-horizontal" role="form">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							委托公司一览
						</h4>
					</div>
					<div class="modal-body">
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-3 form-label">委托公司代码</label>
							<div class="col-lg-4">
								<div class="input-group">
									<input id="agentCompNoLow" maxlength="4" type="text" class="form-control">
								</div>
							</div>
							<label for="" class="col-lg-1 form-label to">---</label>
							<div class="col-lg-4">
								<div class="input-group">
									<input id="agentCompNoHigh" maxlength="4" type="text" class="form-control">
								</div>
							</div>
						</div>
						<div class="col-lg-4 form-group">
							<label for="" class="col-lg-4 form-label">委托公司名称</label>
							<div class="col-lg-8">
								<div class="input-group">
									<input id="agentCompName" maxlength="20" type="text" class="form-control">
								</div>
							</div>
						</div>
						<div class="col-lg-2 form-group" style="z-index: 1;">
							<button type="button" class="btn btn-success form-control" onclick="querySelectPageAjax(0);">检索</button>
						</div>
					</div>
					<div class="modal-body" style="height: 430px;">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th></th>
									<th style="display: none;"></th>
									<th>公司编号</th>
									<th>公司名称</th>
									<th>联系人</th>
									<th>联系电话</th>
								</tr>
							</thead>
							<tbody id="agentCompData">
								<tr>
									<td><input name="agentCompKey" type="radio" value=""/></td>
									<td style="display: none;">
										<input type="hidden" value="">
										<input type="hidden" value="">
									</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
						<jsp:include page="../turning_select.jsp" flush="true" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="selectAgentComp();">确定</button>
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
</script>
</body>
</html>
