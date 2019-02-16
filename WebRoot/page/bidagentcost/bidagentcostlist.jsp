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
<title>代理费设定</title>
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
		//document.mainform.action = '<c:url value="/bidagentcost/showAddBidCntrc.action"></c:url>';
		//document.mainform.submit();
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
		document.mainform.action = '<c:url value="/bidagentcost/queryBidAgentCostList.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		setOpenDate();
		document.getElementById("startIndex").value = pageNum;
		document.mainform.action = '<c:url value="/bidagentcost/turnBidAgentCostPage.action"></c:url>';
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
					html += '<tr onclick="checkRadioTr(this, event);">';
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
	
	function save() {
		//组织bidlist
		$("#agentCostListTable").empty();
		var list = document.getElementsByName("radioKey");
		var tmpBID_NO = $("[name='tmpBID_NO']");
		var tmpBID_AGENT_PRICE_ACT = $("[name='tmpBID_AGENT_PRICE_ACT']");
		var tmpRECEIPT1_DATE = $("[name='tmpRECEIPT1_DATE']");
		var tmpRECEIPT1_VALUE_DATE = $("[name='tmpRECEIPT1_VALUE_DATE']");
		if(tmpBID_NO != null && tmpBID_NO.length > 0) {
			for(var j = 0; j< tmpBID_NO.length; j++) {
				var tr = document.createElement("tr");
				var td = document.createElement("td");
				td.appendChild(createInput("agentCostBidList[" + j + "].BID_NO", tmpBID_NO[j].value));
				if(tmpBID_AGENT_PRICE_ACT[j].value != "") {
					td.appendChild(createInput("agentCostBidList[" + j + "].BID_AGENT_PRICE_ACT", tmpBID_AGENT_PRICE_ACT[j].value));
				}
				if(tmpRECEIPT1_DATE[j].value != "") {
					td.appendChild(createInput("agentCostBidList[" + j + "].RECEIPT1_DATE", tmpRECEIPT1_DATE[j].value));
				}
				if(tmpRECEIPT1_VALUE_DATE[j].value != "") {
					td.appendChild(createInput("agentCostBidList[" + j + "].RECEIPT1_VALUE_DATE", tmpRECEIPT1_VALUE_DATE[j].value));
				}
				tr.appendChild(td);
				document.getElementById("agentCostListTable").appendChild(tr);
			}
		}
		if(confirm("确定提交吗？")) {
			document.mainform.action = '<c:url value="/bidagentcost/calcBidAgentCostAction.action"></c:url>';
			document.mainform.submit();
		}
	}
	
	//代理费计算
	function showCalcAgentCost() {
		var ids = "";
		var agentCost = "0";
		agentCost = parseFloat(agentCost);
		var list = document.getElementsByName("radioKey");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				var tr = list[i].parentNode.parentNode;
				var childs = tr.cells[1].getElementsByTagName("input");
				if(childs[1].value != "" && parseFloat(childs[1].value) > 0) {
					agentCost += parseFloat(childs[1].value);
				}
				ids += list[i].value + ",";
			}
		}
		if(ids == "") {
			alert("请选择一条记录！");
		} else {
			//计算总代理费
			$("#tmpTotalCost").val(agentCost.toFixed(6));
			$("#tmpDiscount").val("");
			$("#tmpDiscountPrice").val("");
			$("#tmpReceiptDate").val("");
			$("#tmpReceiptValueDate").val("");
			//弹出代理费计算页面
			//禁用 Bootstrap 模态框(Modal) 点击空白时自动关闭
			$('#calcAgentCostModal').modal({backdrop: 'static', keyboard: false});
			$('#calcAgentCostModal').modal('show');
		}
	}
	
	function calcAmount() {
		var tmpDiscount = $("#tmpDiscount").val();
		var tmpReceiptDate = $("#tmpReceiptDate").val();
		var tmpReceiptValueDate = $("#tmpReceiptValueDate").val();
		if(tmpDiscount == "") {
			alert("折扣率不能为空！");
			$("#tmpDiscount").focus();
			return;
		}
		if(!isReal(tmpDiscount)) {
			alert("折扣率格式不正确！");
			$("#tmpDiscount").focus();
			return;
		}
		if(tmpReceiptDate == "") {
			alert("请选择开票日期！");
			$("#tmpReceiptDate").focus();
			return;
		}
		if(tmpReceiptValueDate == "") {
			//alert("请选择到账日期！");
			//$("#tmpReceiptValueDate").focus();
			//return;
		}
		//计算并赋值
		var list = document.getElementsByName("radioKey");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				var ttr = list[i].parentNode.parentNode;
				var childs = ttr.cells[1].getElementsByTagName("input");
				var price = parseFloat(childs[1].value) * parseFloat(tmpDiscount);
				price = price.toFixed(6);
				
				var pricechilds = ttr.cells[8].getElementsByTagName("input");
				pricechilds[0].value = price;
				
				var date1childs = ttr.cells[9].getElementsByTagName("input");
				date1childs[0].value = tmpReceiptDate;
				
				var date2childs = ttr.cells[10].getElementsByTagName("input");
				date2childs[0].value = tmpReceiptValueDate;
			}
		}
		//隐藏
		$('#calcAgentCostModal').modal('hide');
	}
	
	function createInput(id, value) {
		var input = document.createElement("input");
		input.type = "text";
		input.name = id;
		input.value = value;
		return input;
	}
	
	function calcDiscountPrice() {
		var tmpDiscount = $("#tmpDiscount").val();
		var tmpTotalCost = $("#tmpTotalCost").val();
		if(tmpDiscount == "") {
			alert("折扣率不能为空！");
			//$("#tmpDiscount").focus();
			return;
		}
		if(!isReal(tmpDiscount)) {
			alert("折扣率格式不正确！");
			//$("#tmpDiscount").focus();
			return;
		}
		var tmpDiscountPrice = parseFloat(tmpTotalCost) * parseFloat(tmpDiscount);
		$("#tmpDiscountPrice").val(tmpDiscountPrice.toFixed(6));
	}
	
	function goBidUpd(strBID_NO, updBidTabIndex) {
		var url = '<c:url value="/bid/showUpdBidAction.action"></c:url>'+"?updateBidNo=" + strBID_NO + "&updBidTabIndex=" + updBidTabIndex+ "&date=" + new Date();
		document.mainform.action = url;
		document.mainform.submit();
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
					<s:hidden name="strDiscount" id="strDiscount"/>
					<s:hidden name="strCommonReceiptDate" id="strCommonReceiptDate"/>
					<s:hidden name="strCommonReceiptValueDate" id="strCommonReceiptValueDate"/>
					
					<h3 class="title">代理费设定<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
					<div class="row">
						<s:if test="hasActionMessages()">
							<div class="row">
								<span style="color:red; text-align:center;"><s:actionmessage /></span>
							</div>
						</s:if>
						<table id="agentCostListTable" style="display: none;">
						</table>
						<div class="col-lg-3 form-group" style="display: none;">
							<label for="" class="col-lg-3 form-label">合同年份</label>
							<div class="col-lg-9">
								<s:textfield name="strCNTRCT_YEAR" id="strCNTRCT_YEAR" cssClass="form-control" maxlength="4" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-6 form-group" style="display: none;">
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
							<label for="" class="col-lg-5 form-label">合同编号</label>
							<div class="col-lg-7">
								<s:textfield name="strCNTRCT_NO" id="strCNTRCT_NO" cssClass="form-control" maxlength="20" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">项目名称</label>
							<div class="col-lg-9">
								<s:textfield name="strCNTRCT_NAME" id="strCNTRCT_NAME" cssClass="form-control" maxlength="30" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-6 form-group">
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
							<label for="" class="col-lg-5 form-label">代理费计算情况</label>
							<div class="col-lg-7">
								<select class="form-control" name="strBID_AGENT_PRICE_ACT">
									<option value="" selected="selected">请选择</option>
									<s:if test='strBID_AGENT_PRICE_ACT == "1"'>
										<option value="1" selected="selected">已计算</option>
										<option value="2">未计算</option>
									</s:if>
									<s:elseif test='strBID_AGENT_PRICE_ACT == "2"'>
										<option value="1">已计算</option>
										<option value="2" selected="selected">未计算</option>
									</s:elseif>
									<s:else>
										<option value="1">已计算</option>
										<option value="2">未计算</option>
									</s:else>
								</select>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">开票情况</label>
							<div class="col-lg-9">
								<select class="form-control" name="strRECEIPT1_DATE">
									<option value="" selected="selected">请选择</option>
									<s:if test='strRECEIPT1_DATE == "1"'>
										<option value="1" selected="selected">已开票</option>
										<option value="2">未开票</option>
									</s:if>
									<s:elseif test='strRECEIPT1_DATE == "2"'>
										<option value="1">已开票</option>
										<option value="2" selected="selected">未开票</option>
									</s:elseif>
									<s:else>
										<option value="1">已开票</option>
										<option value="2">未开票</option>
									</s:else>
								</select>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">到账情况</label>
							<div class="col-lg-9">
								<select class="form-control" name="strRECEIPT1_VALUE_DATE">
									<option value="" selected="selected">请选择</option>
									<s:if test='strRECEIPT1_VALUE_DATE == "1"'>
										<option value="1" selected="selected">已到账</option>
										<option value="2">未到账</option>
									</s:if>
									<s:elseif test='strRECEIPT1_VALUE_DATE == "2"'>
										<option value="1">已到账</option>
										<option value="2" selected="selected">未到账</option>
									</s:elseif>
									<s:else>
										<option value="1">已到账</option>
										<option value="2">未到账</option>
									</s:else>
								</select>
							</div>
						</div>
						<div class="col-lg-5 form-group" style="display: none;">
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
							<th style="display: none;"></th>
							<th>招标编号</th>
							<th>项目名称</th>
							<th>委托单位</th>
							<th>项目进展</th>
							<th>中标价</th>
							<th>应收代理费</th>
							<th>实收代理费</th>
							<th>开票日期</th>
							<th>到账日期</th>
							<th>代理费支付方</th>
						</tr>
						<s:iterator id="listBid" value="listBid" status="st1">
							<tr onclick="checkRadioTr(this, event);">
								<td><input name="radioKey" type="checkbox" value="<s:property value="BID_NO"/>"/></td>
								<td style="display: none;">
									<input name="tmpBID_NO" type="hidden" value="<s:property value="BID_NO"/>">
									<input type="hidden" value="<s:property value="BID_AGENT_PRICE"/>">
								</td>
								<td>
									<a class="goBidUpd" href="#" onclick='goBidUpd("<s:property value="BID_NO"/>",7)'; ><s:property value="BID_NO"/></a>
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
								<td><s:property value="BID_PRICE"/></td>
								<td><s:property value="BID_AGENT_PRICE"/></td>
								<td>
									<div class="col-lg-10" style="width: 140px;">
										<input name="tmpBID_AGENT_PRICE_ACT" style="width: 130px;" disabled="disabled" type="text" value="<s:property value="BID_AGENT_PRICE_ACT"/>" maxlength="14" class="form-control">
									</div>
								</td>
								<td>
									<div class="input-group date" style="width: 140px;" data-provide="datepicker">
										<input type="text" name="tmpRECEIPT1_DATE" value="<s:date name="RECEIPT1_DATE" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
										<div class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</div>
									</div>
								</td>
								<td>
									<div class="input-group date" style="width: 140px;" data-provide="datepicker">
										<input type="text" name="tmpRECEIPT1_VALUE_DATE" value="<s:date name="RECEIPT1_VALUE_DATE" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
										<div class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</div>
									</div>
								</td>
								<td>
									<s:if test='BID_AGENT_PAY == "1"'>委托单位</s:if>
									<s:elseif test='BID_AGENT_PAY == "2"'>中标单位</s:elseif>
									<s:elseif test='BID_AGENT_PAY == "3"'>申通集团</s:elseif>
									<s:elseif test='BID_AGENT_PAY == "4"'>维保公司</s:elseif>
									<s:else><s:property value="BID_AGENT_PAY"/></s:else>
								</td>
							</tr>
						</s:iterator>
					</table>
					<jsp:include page="../turning.jsp" flush="true" />
					<div class="operationBtns">
						<button type="button" class="btn btn-success" onclick="showCalcAgentCost();">代理费计算</button>
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
								<tr onclick="checkRadioTr(this, event);">
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
	<div class="modal fade" id="calcAgentCostModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 700px;">
			<div class="modal-content">
				<form class="form-horizontal" role="form">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							代理费计算
						</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-2 control-label">总计</label>
							<div class="col-sm-9">
								<input type="text" id="tmpTotalCost" class="form-control" disabled="disabled" maxlength="18" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">折扣率</label>
							<div class="col-sm-9">
								<input type="text" id="tmpDiscount" onblur="calcDiscountPrice();" class="form-control" maxlength="8" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">折后总价</label>
							<div class="col-sm-9">
								<input type="text"  id="tmpDiscountPrice" disabled="disabled" class="form-control" maxlength="18" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">开票日期</label>
							<div class="col-sm-9">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" id="tmpReceiptDate" value="" class="form-control datepicker" readonly>
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">到账日期</label>
							<div class="col-sm-9">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" id="tmpReceiptValueDate" value="" class="form-control datepicker" readonly>
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="calcAmount();">计算</button>
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