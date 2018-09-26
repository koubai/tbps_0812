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
<title>专家费设定</title>
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
	function save() {
		//数据验证
		var tmpBID_NO = $("[name='tmpBID_NO']");
		var tmpBID_EXPERT_COMMISION_ACT = $("[name='tmpBID_EXPERT_COMMISION_ACT']");
		var tmpBID_EXPERT_COMMISION_APPLY_DATE = $("[name='tmpBID_EXPERT_COMMISION_APPLY_DATE']");
		var tmpBID_EXPERT_COMMISION_APPLY = $("[name='tmpBID_EXPERT_COMMISION_APPLY']");
		if(tmpBID_NO != null && tmpBID_NO.length > 0) {
			for(var j = 0; j< tmpBID_NO.length; j++) {
				if(tmpBID_EXPERT_COMMISION_ACT[j].value != "" && parseFloat(tmpBID_EXPERT_COMMISION_ACT[j].value) > 0) {
					if(!isReal(tmpBID_EXPERT_COMMISION_ACT[j].value)) {
						alert("实际费用格式不正确！");
						tmpBID_EXPERT_COMMISION_ACT[j].focus();
						return false;
					}
					if(tmpBID_EXPERT_COMMISION_APPLY_DATE[j].value == "") {
						alert("请选择专家费申请时间！");
						tmpBID_EXPERT_COMMISION_APPLY_DATE[j].focus();
						return false;
					}
					if(tmpBID_EXPERT_COMMISION_APPLY[j].value == "") {
						alert("请选择申请人！");
						tmpBID_EXPERT_COMMISION_APPLY[j].focus();
						return false;
					}
				}
			}
			$("#expertCostListTable").empty();
			//组织TABLE
			for(var j = 0; j< tmpBID_NO.length; j++) {
				var tr = document.createElement("tr");
				var td = document.createElement("td");
				td.appendChild(createInput("expertCostBidList[" + j + "].BID_NO", tmpBID_NO[j].value));
				if(tmpBID_EXPERT_COMMISION_ACT[j].value != "") {
					td.appendChild(createInput("expertCostBidList[" + j + "].BID_EXPERT_COMMISION_ACT", tmpBID_EXPERT_COMMISION_ACT[j].value));
				}
				if(tmpBID_EXPERT_COMMISION_APPLY_DATE[j].value != "") {
					td.appendChild(createInput("expertCostBidList[" + j + "].BID_EXPERT_COMMISION_APPLY_DATE", tmpBID_EXPERT_COMMISION_APPLY_DATE[j].value));
				}
				td.appendChild(createInput("expertCostBidList[" + j + "].BID_EXPERT_COMMISION_APPLY", tmpBID_EXPERT_COMMISION_APPLY[j].value));
				tr.appendChild(td);
				document.getElementById("expertCostListTable").appendChild(tr);
			}
			if(confirm("确定提交吗？")) {
				document.mainform.action = '<c:url value="/bidexpertcost/saveBidExpertCostAction.action"></c:url>';
				document.mainform.submit();
			}
		} else {
			//没有记录，什么都不做
		}
	}
	
	function createInput(id, value) {
		var input = document.createElement("input");
		input.type = "text";
		input.name = id;
		input.value = value;
		return input;
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
		$("#strCNTRCT_ST_DATE").attr("value", $("#tmpCNTRCT_ST_DATE").val());
		$("#strCNTRCT_ED_DATE").attr("value", $("#tmpCNTRCT_ED_DATE").val());
		$("#strBID_COMP_NO").attr("value", $("#strAgentNo").val());
	}

	function queryList() {
		setOpenDate();
		document.mainform.action = '<c:url value="/bidexpertcost/queryBidExpertCostList.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		setOpenDate();
		document.getElementById("startIndex").value = pageNum;
		document.mainform.action = '<c:url value="/bidexpertcost/turnBidExpertCostPage.action"></c:url>';
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
		param.agentCompName = encodeURI(agentCompName,"utf-8");
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
			$('#strBID_COMP_NO').val(ANGENT_COMP_NO);
			$('#strAgentName').val(ANGENT_COMP_NAME);
			$('#strBID_COMP_NAME').val(ANGENT_COMP_NAME);
			//隐藏模态窗体
			$('#agentCompModal').modal('hide');
		} else {
			alert("请选择一条记录！");
		}
	}
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<div class="row">
			<jsp:include page="../menu.jsp" flush="true" />
			<s:if test='#session.toggle_menu_flag == "1"'>
				<div class="col-lg-10 right w100">
				<a class="toggle" href="javascript:;"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
			</s:if>
			<s:else>
				<div class="col-lg-10 right">
				<a class="toggle" href="javascript:;"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
			</s:else>
				<s:form id="mainform" name="mainform" method="POST" theme="simple">
					<s:hidden name="startIndex" id="startIndex"/>
					<s:hidden name="strCNTRCT_ST_DATE" id="strCNTRCT_ST_DATE"/>
					<s:hidden name="strCNTRCT_ED_DATE" id="strCNTRCT_ED_DATE"/>
					<s:hidden name="strBID_COMP_NO" id="strBID_COMP_NO"/>
					<s:hidden name="strBID_COMP_NAME" id="strBID_COMP_NAME"/>
					<h3 class="title">专家费设定<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
					<div class="row">
						<table id="expertCostListTable" style="display: none;">
						</table>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">合同年份</label>
							<div class="col-lg-9">
								<s:textfield name="strCNTRCT_YEAR" id="strCNTRCT_YEAR" cssClass="form-control" maxlength="4" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-2 form-label">合同期限</label>
							<div class="col-lg-4">
								<div class="input-group date" data-provide="datepicker">
									<input id="tmpCNTRCT_ST_DATE" value="<s:property value="strCNTRCT_ST_DATE"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label to">---</label>
							<div class="col-lg-4">
								<div class="input-group date" data-provide="datepicker">
									<input id="tmpCNTRCT_ED_DATE" value="<s:property value="strCNTRCT_ED_DATE"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">合同编号</label>
							<div class="col-lg-9">
								<s:textfield name="strCNTRCT_NO" id="strCNTRCT_NO" cssClass="form-control" maxlength="20" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-5 form-group">
							<label for="" class="col-lg-3 form-label">委托公司</label>
							<div class="col-lg-7">
								<input type="text" id="strAgentName" disabled="disabled" class="form-control" value="<s:property value="strBID_COMP_NAME"/>">
							</div>
							<div class="col-lg-2">
								<button type="button" class="btn btn-success" onclick="showAgentComSelect();">选择</button>
							</div>
						</div>
						<div class="col-lg-2 form-group">
							<button type="button" class="btn btn-success form-control" onclick="queryList();">检索</button>
						</div>
					</div>
					<div class="btns">
						<ul>
						</ul>
					</div>
					<table class="table table-bordered">
						<tr>
							<th></th>
							<th>招标编号</th>
							<th>项目名称</th>
							<th>委托单位</th>
							<th>项目进展</th>
							<th>专家实际费用</th>
							<th>专家费申请时间</th>
							<th>申请人</th>
						</tr>
						<s:iterator id="listBid" value="listBid" status="st1">
							<tr>
								<td><input name="radioKey" type="radio" value="<s:property value="BID_NO"/>"/></td>
								<td>
									<input name="tmpBID_NO" type="hidden" value="<s:property value="BID_NO"/>">
									<s:property value="BID_NO"/>
								</td>
								<td><s:property value="PROJECT_NAME"/></td>
								<td><s:property value="BID_COMP_NAME"/></td>
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
									<div class="col-lg-10">
										<input name="tmpBID_EXPERT_COMMISION_ACT" type="text" value="<s:property value="BID_EXPERT_COMMISION_ACT"/>" maxlength="14" class="form-control">
									</div>
								</td>
								<td>
									<div class="input-group date" data-provide="datepicker">
										<input type="text" name="tmpBID_EXPERT_COMMISION_APPLY_DATE" value="<s:date name="BID_EXPERT_COMMISION_APPLY_DATE" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
										<div class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</div>
									</div>
								</td>
								<td>
									<select name="tmpBID_EXPERT_COMMISION_APPLY" class="form-control">
										<option value="" selected="selected">请选择</option>
										<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
											<option value="<s:property value="LOGIN_ID"/>" <s:if test="%{BID_EXPERT_COMMISION_APPLY == LOGIN_ID}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
										</s:iterator>
									</select>
								</td>
							</tr>
						</s:iterator>
					</table>
					<jsp:include page="../turning.jsp" flush="true" />
					<div class="operationBtns">
						<button type="button" class="btn btn-success" onclick="save();">保存</button>
					</div>
				</s:form>
			</div>
		</div>
	</div>
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