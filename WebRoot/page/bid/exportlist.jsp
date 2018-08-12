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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Calendar3.js"></script>
<title>招标检索下载</title>
<script type="text/javascript">
	function showBidList(){
		checkdata();
		document.mainform.action = '<c:url value="/bid/showBidList.action"></c:url>';
		document.mainform.submit();
	}
	function checkdata(){
		$("#RESERVE_DATE6").attr("value", $("#reserveDate6").val());
		$("#AGENT_CO_NAME").attr("value", $("#agentCoName").val());
		$("#AGENT_CO_MANAGER").attr("value", $("#agentCoManager").val());
		$("#BID_CO_NAME").attr("value", $("#bidCoName").val());
		$("#TENDER_OPEN_DATE").attr("value", $("#tenderOpenDate").val());
		$("#SUBMIT_DATE").attr("value", $("#submitDate").val());
		$("#SUBMIT_DATE2").attr("value", $("#submitDate2").val());
		$("#BID_NOTICE_DATE").attr("value", $("#bidNoticeDate").val());
		$("#BID_NOTICE_DATE2").attr("value", $("#bidNoticeDate2").val());
		$("#RESERVE_DATE4").attr("value", $("#reserveDate4").val());
		$("#BID_MESSAGE_DATE").attr("value", $("#bidMessageDate").val());
		$("#PROJECT_MANAGER").attr("value", $("#projectManager").val());
		$("#RESERVE_DATE7").attr("value", $("#reserveDate7").val());

		//项目完成情况
		var FINISH_STATUS = $("#FINISH_STATUS").val();
		if(FINISH_STATUS != ""){
			if(FINISH_STATUS == 7){
				$("#FINISH_STATUS").attr("value", 1);
			} else {
				$("#FINISH_STATUS").attr("value", 2);
				//失败原因
				$("#RESERVE1").attr("value", FINISH_STATUS);
			}
		} else {
			$("#FINISH_STATUS").attr("value", "");
			$("#RESERVE1").attr("value", "");
		}
		//价格
		var BID_BOND = $("#BID_BOND_WANYUAN").val();
		var PROJ_ASTRICT_PRICE = $("#PROJ_ASTRICT_PRICE_WANYUAN").val();
		var BID_AGENT_PRICE = $("#BID_AGENT_PRICE_WANYUAN2").val();
		var BID_WIN_PRICE = $("#BID_WIN_PRICE_WANYUAN").val();
		var BID_APPLY_PRICE = $("#BID_APPLY_PRICE").val();
		var BID_COMMISION = $("#BID_COMMISION").val();

		if(BID_BOND != "" && !isReal(BID_BOND)) {
			alert("保证金格式不正确！");
			$("#BID_BOND").focus();
			return;
		}
		if(PROJ_ASTRICT_PRICE != "" && !isReal(PROJ_ASTRICT_PRICE)) {
			alert("限价格式不正确！");
			$("#PROJ_ASTRICT_PRICE").focus();
			return;
		}
		if(BID_WIN_PRICE != "" && !isReal(BID_WIN_PRICE)) {
			alert("中标价格式不正确！");
			$("#BID_WIN_PRICE").focus();
			return;
		}
		if(BID_AGENT_PRICE != "" && !isReal(BID_AGENT_PRICE)) {
			alert("代理费格式不正确！");
			$("#BID_AGENT_PRICE").focus();
			return;
		}
		if(BID_APPLY_PRICE != "" && !isReal(BID_APPLY_PRICE)) {
			alert("标书费格式不正确！");
			$("#BID_APPLY_PRICE").focus();
			return;
		}
		if(BID_COMMISION != "" && !isReal(BID_COMMISION)) {
			alert("专家费格式不正确！");
			$("#BID_COMMISION").focus();
			return;
		}

		//保证金
		if(BID_BOND == "") {
			$("#BID_BOND").attr("value", 0);
		} else {
			//数据库保存单位是元，页面显示是万元，所以这里要乘以10000
			$("#BID_BOND").attr("value", parseFloat(BID_BOND) * 10000);
		}

		//限价
		if(PROJ_ASTRICT_PRICE == "") {
			$("#PROJ_ASTRICT_PRICE").attr("value", 0);
		} else {
			//数据库保存单位是元，页面显示是万元，所以这里要乘以10000
			$("#PROJ_ASTRICT_PRICE").attr("value", parseFloat(PROJ_ASTRICT_PRICE) * 10000);
		}

		//中标价
		if(BID_WIN_PRICE == "") {
			$("#BID_WIN_PRICE").attr("value", 0);
		} else {
			//数据库保存单位是元，页面显示是万元，所以这里要乘以10000
			$("#BID_WIN_PRICE").attr("value", parseFloat(BID_WIN_PRICE) * 10000);
		}

		//代理费
		if(BID_AGENT_PRICE == "") {
			$("#BID_AGENT_PRICE").attr("value", 0);
		} else {
			//数据库保存单位是元，页面显示是万元，所以这里要乘以10000
			$("#BID_AGENT_PRICE").attr("value", parseFloat(BID_AGENT_PRICE) * 10000);
		}
		
		if(BID_COMMISION == "") {
			$("#BID_COMMISION").attr("value", 0);
		}
		
		if(BID_APPLY_PRICE == "") {
			$("#BID_APPLY_PRICE").attr("value", 0);
		}
		
		//取得排序等值
		var tb = document.getElementById("bidTable");
		var rows = tb.rows;
		var orderList = "";
		for(var i=2; i<rows.length; i++){
			var id = rows[i].id;
			id = id.substring(0, id.length-3);
			var value = "";
			if(i==9 || i==10 || i==12 || i==13 || i==14 || i==15){
				value = rows[i].cells[1].childNodes[9].childNodes[1].value;
			} else {
				value = rows[i].cells[1].childNodes[3].childNodes[1].value;
			}
			var orderNumber = rows[i].cells[2].childNodes[3].childNodes[1].value;
			var order = "";
			var orderNode = rows[i].cells[3].childNodes[1];
			var orderNode2 = rows[i].cells[3].childNodes[3];
			if(orderNode.checked){
				order = orderNode.value;
			}
			if(orderNode2.checked){
				order = orderNode2.value;
			}
			var orderOne = id + "-" + orderNumber + "-" + order;
			document.getElementById(id + "_ON").value = orderNumber;
			document.getElementById(id + "_O").value = order;
			var include = "0";
			if(rows[i].cells.length>5){
				var includeNode= rows[i].cells[5].childNodes[1].childNodes[1];
				if(includeNode.checked){
					include = "1";
				}
			}
			orderOne = orderOne + "-" + include;
			document.getElementById(id + "_I").value = include;
			var pd = "0";
			if(i==9 || i==10 || i==12 || i==13 || i==14 || i==15){
				pd = rows[i].cells[1].childNodes[3].childNodes[1].value;
				document.getElementById(id + "_PD").value = pd;
			}
			orderOne = orderOne + "-" + pd;
			orderList = orderList + "," + orderOne;
		}
		//alert(orderList);
		$("#BID_EXPORT").attr("value", orderList.substring(1,orderList.length));
	}
	
	//委托公司
	function selectAgentComp() {
		var url = '<c:url value="/bid/showSelectBidAgentCompAction.action"></c:url>';
		url += "?agentAddFlag=1&date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	//中标公司
	function selectBidComp() {
		var url = '<c:url value="/bid/showSelectBidCompAction.action"></c:url>';
		url += "?date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	//工程师
	function selectProjectManager() {
		var url = '<c:url value="/bid/showSelectProManagerAction.action"></c:url>';
		url += "?date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}

	function clearAll() {
		var len = document.getElementsByName("allClear").length;
		for(var i = 0; i < len; i++) {
			document.getElementsByName("allClear")[i].value = "";
		}
	}
	
	function clearOne(obj) {
		var tmpName = obj.id;
		var name = tmpName.substring(0,tmpName.length-6);
		var name_on = name + "_ordernumber";
		var name_o = name + "_order";
		if(name == "BID_BOND" || name == "PROJ_ASTRICT_PRICE" || name == "BID_WIN_PRICE" ){
			name = name + "_WANYUAN";
		} else if(name == "BID_AGENT_PRICE"){
			name = name + "_WANYUAN2";
		}
		document.getElementById(name).value = "";
		document.getElementById(name_on).value = "";
		document.getElementsByName(name_o)[0].checked = false;
		document.getElementsByName(name_o)[1].checked = false;
	}

	//导出
	function exportList() {
		checkdata();
		document.mainform.action = '<c:url value="/bid/exportBidList2Action.action"></c:url>';
		document.mainform.submit();
	}
</script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:auto;">
<s:form id="mainform" name="mainform" method="POST">
	<s:hidden name="startIndexHist" id="startIndexHist"/>
	<s:hidden name="exportBidDto.RESERVE_DATE6" id="RESERVE_DATE6"/>
	<s:hidden name="exportBidDto.AGENT_CO_NAME" id="AGENT_CO_NAME"/>
	<s:hidden name="exportBidDto.AGENT_CO_MANAGER" id="AGENT_CO_MANAGER"/>
	<s:hidden name="exportBidDto.BID_CO_NAME" id="BID_CO_NAME"/>
	<s:hidden name="exportBidDto.TENDER_OPEN_DATE" id="TENDER_OPEN_DATE"/> 
	<s:hidden name="exportBidDto.SUBMIT_DATE" id="SUBMIT_DATE"/> 
	<s:hidden name="exportBidDto.SUBMIT_DATE2" id="SUBMIT_DATE2"/> 
	<s:hidden name="exportBidDto.BID_NOTICE_DATE" id="BID_NOTICE_DATE"/> 
	<s:hidden name="exportBidDto.BID_NOTICE_DATE2" id="BID_NOTICE_DATE2"/> 
	<s:hidden name="exportBidDto.RESERVE_DATE4" id="RESERVE_DATE4"/>
	<s:hidden name="exportBidDto.BID_MESSAGE_DATE" id="BID_MESSAGE_DATE"/>
	<s:hidden name="exportBidDto.BID_EXPORT" id="BID_EXPORT"/>
	<s:hidden name="exportBidDto.PROJECT_MANAGER" id="PROJECT_MANAGER"/>
	<s:hidden name="exportBidDto.RESERVE_DATE7" id="RESERVE_DATE7"/>
	<s:hidden name="exportBidDto.RESERVE1" id="RESERVE1"/>
	<s:hidden name="exportBidDto.BID_BOND" id="BID_BOND"/>
	<s:hidden name="exportBidDto.PROJ_ASTRICT_PRICE" id="PROJ_ASTRICT_PRICE"/>
	<s:hidden name="exportBidDto.BID_WIN_PRICE" id="BID_WIN_PRICE"/>
	<s:hidden name="exportBidDto.BID_AGENT_PRICE" id="BID_AGENT_PRICE"/>
	
	<s:hidden name="bidExtendDto.RESERVE_DATE6_ON" id="RESERVE_DATE6_ON"/>
	<s:hidden name="bidExtendDto.BID_NO_ON" id="BID_NO_ON"/>
	<s:hidden name="bidExtendDto.RESERVE2_ON" id="RESERVE2_ON"/>
	<s:hidden name="bidExtendDto.PROJECT_NAME_ON" id="PROJECT_NAME_ON"/>
	<s:hidden name="bidExtendDto.AGENT_CO_NAME_ON" id="AGENT_CO_NAME_ON"/>
	<s:hidden name="bidExtendDto.AGENT_CO_MANAGER_ON" id="AGENT_CO_MANAGER_ON"/>
	<s:hidden name="bidExtendDto.BID_AGENT_PAY_ON" id="BID_AGENT_PAY_ON"/>
	<s:hidden name="bidExtendDto.BID_BOND_ON" id="BID_BOND_ON"/>
	<s:hidden name="bidExtendDto.PROJ_ASTRICT_PRICE_ON" id="PROJ_ASTRICT_PRICE_ON"/>
	<s:hidden name="bidExtendDto.BID_CO_NAME_ON" id="BID_CO_NAME_ON"/>
	<s:hidden name="bidExtendDto.BID_WIN_PRICE_ON" id="BID_WIN_PRICE_ON"/>
	<s:hidden name="bidExtendDto.BID_APPLY_PRICE_ON" id="BID_APPLY_PRICE_ON"/>
	<s:hidden name="bidExtendDto.BID_AGENT_PRICE_ON" id="BID_AGENT_PRICE_ON"/>
	<s:hidden name="bidExtendDto.BID_COMMISION_ON" id="BID_COMMISION_ON"/>
	<s:hidden name="bidExtendDto.PROJECT_MANAGER_ON" id="PROJECT_MANAGER_ON"/>
	<s:hidden name="bidExtendDto.TENDER_OPEN_DATE_ON" id="TENDER_OPEN_DATE_ON"/>
	<s:hidden name="bidExtendDto.SUBMIT_DATE_ON" id="SUBMIT_DATE_ON"/>
	<s:hidden name="bidExtendDto.SUBMIT_DATE2_ON" id="SUBMIT_DATE2_ON"/>
	<s:hidden name="bidExtendDto.BID_NOTICE_DATE_ON" id="BID_NOTICE_DATE_ON"/>
	<s:hidden name="bidExtendDto.BID_NOTICE_DATE2_ON" id="BID_NOTICE_DATE2_ON"/>
	<s:hidden name="bidExtendDto.BID_MESSAGE_DATE_ON" id="BID_MESSAGE_DATE_ON"/>
	<s:hidden name="bidExtendDto.RESERVE_DATE4_ON" id="RESERVE_DATE4_ON"/>
	<s:hidden name="bidExtendDto.FINISH_STATUS_ON" id="FINISH_STATUS_ON"/>
	<s:hidden name="bidExtendDto.FINISH_NOTE_ON" id="FINISH_NOTE_ON"/>
	<s:hidden name="bidExtendDto.RESERVE_DATE7_ON" id="RESERVE_DATE7_ON"/>
	
	<s:hidden name="bidExtendDto.RESERVE_DATE6_O" id="RESERVE_DATE6_O"/>
	<s:hidden name="bidExtendDto.BID_NO_O" id="BID_NO_O"/>
	<s:hidden name="bidExtendDto.RESERVE2_O" id="RESERVE2_O"/>
	<s:hidden name="bidExtendDto.PROJECT_NAME_O" id="PROJECT_NAME_O"/>
	<s:hidden name="bidExtendDto.AGENT_CO_NAME_O" id="AGENT_CO_NAME_O"/>
	<s:hidden name="bidExtendDto.AGENT_CO_MANAGER_O" id="AGENT_CO_MANAGER_O"/>
	<s:hidden name="bidExtendDto.BID_AGENT_PAY_O" id="BID_AGENT_PAY_O"/>
	<s:hidden name="bidExtendDto.BID_BOND_O" id="BID_BOND_O"/>
	<s:hidden name="bidExtendDto.PROJ_ASTRICT_PRICE_O" id="PROJ_ASTRICT_PRICE_O"/>
	<s:hidden name="bidExtendDto.BID_CO_NAME_O" id="BID_CO_NAME_O"/>
	<s:hidden name="bidExtendDto.BID_WIN_PRICE_O" id="BID_WIN_PRICE_O"/>
	<s:hidden name="bidExtendDto.BID_APPLY_PRICE_O" id="BID_APPLY_PRICE_O"/>
	<s:hidden name="bidExtendDto.BID_AGENT_PRICE_O" id="BID_AGENT_PRICE_O"/>
	<s:hidden name="bidExtendDto.BID_COMMISION_O" id="BID_COMMISION_O"/>
	<s:hidden name="bidExtendDto.PROJECT_MANAGER_O" id="PROJECT_MANAGER_O"/>
	<s:hidden name="bidExtendDto.TENDER_OPEN_DATE_O" id="TENDER_OPEN_DATE_O"/>
	<s:hidden name="bidExtendDto.SUBMIT_DATE_O" id="SUBMIT_DATE_O"/>
	<s:hidden name="bidExtendDto.SUBMIT_DATE2_O" id="SUBMIT_DATE2_O"/>
	<s:hidden name="bidExtendDto.BID_NOTICE_DATE_O" id="BID_NOTICE_DATE_O"/>
	<s:hidden name="bidExtendDto.BID_NOTICE_DATE2_O" id="BID_NOTICE_DATE2_O"/>
	<s:hidden name="bidExtendDto.BID_MESSAGE_DATE_O" id="BID_MESSAGE_DATE_O"/>
	<s:hidden name="bidExtendDto.RESERVE_DATE4_O" id="RESERVE_DATE4_O"/>
	<s:hidden name="bidExtendDto.FINISH_STATUS_O" id="FINISH_STATUS_O"/>
	<s:hidden name="bidExtendDto.FINISH_NOTE_O" id="FINISH_NOTE_O"/>
	<s:hidden name="bidExtendDto.RESERVE_DATE7_O" id="RESERVE_DATE7_O"/>
	
	<s:hidden name="bidExtendDto.RESERVE_DATE6_I" id="RESERVE_DATE6_I"/>
	<s:hidden name="bidExtendDto.BID_NO_I" id="BID_NO_I"/>
	<s:hidden name="bidExtendDto.RESERVE2_I" id="RESERVE2_I"/>
	<s:hidden name="bidExtendDto.PROJECT_NAME_I" id="PROJECT_NAME_I"/>
	<s:hidden name="bidExtendDto.AGENT_CO_NAME_I" id="AGENT_CO_NAME_I"/>
	<s:hidden name="bidExtendDto.AGENT_CO_MANAGER_I" id="AGENT_CO_MANAGER_I"/>
	<s:hidden name="bidExtendDto.BID_AGENT_PAY_I" id="BID_AGENT_PAY_I"/>
	<s:hidden name="bidExtendDto.BID_BOND_I" id="BID_BOND_I"/>
	<s:hidden name="bidExtendDto.PROJ_ASTRICT_PRICE_I" id="PROJ_ASTRICT_PRICE_I"/>
	<s:hidden name="bidExtendDto.BID_CO_NAME_I" id="BID_CO_NAME_I"/>
	<s:hidden name="bidExtendDto.BID_WIN_PRICE_I" id="BID_WIN_PRICE_I"/>
	<s:hidden name="bidExtendDto.BID_APPLY_PRICE_I" id="BID_APPLY_PRICE_I"/>
	<s:hidden name="bidExtendDto.BID_AGENT_PRICE_I" id="BID_AGENT_PRICE_I"/>
	<s:hidden name="bidExtendDto.BID_COMMISION_I" id="BID_COMMISION_I"/>
	<s:hidden name="bidExtendDto.PROJECT_MANAGER_I" id="PROJECT_MANAGER_I"/>
	<s:hidden name="bidExtendDto.TENDER_OPEN_DATE_I" id="TENDER_OPEN_DATE_I"/>
	<s:hidden name="bidExtendDto.SUBMIT_DATE_I" id="SUBMIT_DATE_I"/>
	<s:hidden name="bidExtendDto.SUBMIT_DATE2_I" id="SUBMIT_DATE2_I"/>
	<s:hidden name="bidExtendDto.BID_NOTICE_DATE_I" id="BID_NOTICE_DATE_I"/>
	<s:hidden name="bidExtendDto.BID_NOTICE_DATE2_I" id="BID_NOTICE_DATE2_I"/>
	<s:hidden name="bidExtendDto.BID_MESSAGE_DATE_I" id="BID_MESSAGE_DATE_I"/>
	<s:hidden name="bidExtendDto.RESERVE_DATE4_I" id="RESERVE_DATE4_I"/>
	<s:hidden name="bidExtendDto.FINISH_STATUS_I" id="FINISH_STATUS_I"/>
	<s:hidden name="bidExtendDto.FINISH_NOTE_I" id="FINISH_NOTE_I"/>
	<s:hidden name="bidExtendDto.RESERVE_DATE7_I" id="RESERVE_DATE7_I"/>
	
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
			<table width="100%" border="0" cellpadding="5" cellspacing="0" id="bidTable">
				<tr>
					<td width="25%"></td>
					<td width="30%"></td>
					<td width="10%">
						<label>选择顺序</label>
					</td>
					<td width="15%">
						<label>排列顺序</label>
					</td>
					<td width="10%"></td>
					<td width="10%"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="strAllClear" class="input40" type="button" value="清" onclick="clearAll();" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td colspan="3">
						<label>1 --> 9</label>&nbsp;
						<label>9 --> 1</label>
					</td>
				</tr>
				<tr id="RESERVE_DATE6_tr">
					<td align="right">
						<label>承接项目日期</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 135px;" id="reserveDate6" value="<s:property value="exportBidDto.RESERVE_DATE6"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('reserveDate6'));"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="reserveDate6_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.RESERVE_DATE6_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.RESERVE_DATE6_O == "0"}'>
							<input name="reserveDate6_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="reserveDate6_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.RESERVE_DATE6_O == "1"}'>
							<input name="reserveDate6_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="reserveDate6_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="reserveDate6_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="reserveDate6_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="reserveDate6_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="BID_NO_tr">
					<td align="right">
						<label>招标编号</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="exportBidDto.BID_NO" id="BID_NO" cssStyle="width: 150px;" maxlength="13" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="BID_NO_ordernumber" maxlength="13" style="width:50px;" value="<s:property value="bidExtendDto.BID_NO_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.BID_NO_O == "0"}'>
							<input name="BID_NO_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_NO_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.BID_NO_O == "1"}'>
							<input name="BID_NO_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_NO_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="BID_NO_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_NO_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="BID_NO_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="RESERVE2_tr">
					<td align="right">
						<label>项目性质</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="RESERVE2" name="exportBidDto.RESERVE2" style="width: 150px;">
								<s:if test='exportBidDto.RESERVE2 == "1"'>
									<option value="">请选择</option>
									<option value="1" selected="selected">成本内</option>
									<option value="2">成本外</option>
									<option value="3">其他</option>
								</s:if>
								<s:elseif test='exportBidDto.RESERVE2 == "2"'>
									<option value="">请选择</option>
									<option value="1">成本内</option>
									<option value="2" selected="selected">成本外</option>
									<option value="3">其他</option>
								</s:elseif>
								<s:elseif test='exportBidDto.RESERVE2 == "3"'>
									<option value="">请选择</option>
									<option value="1">成本内</option>
									<option value="2">成本外</option>
									<option value="3" selected="selected">其他</option>
								</s:elseif>
								<s:else>
									<option value="" selected="selected">请选择</option>
									<option value="1">成本内</option>
									<option value="2">成本外</option>
									<option value="3">其他</option>
								</s:else>
							</select>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="RESERVE2_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.RESERVE2_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.RESERVE2_O == "0"}'>
							<input name="RESERVE2_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="RESERVE2_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.RESERVE2_O == "1"}'>
							<input name="RESERVE2_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="RESERVE2_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="RESERVE2_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="RESERVE2_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="RESERVE2_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="PROJECT_NAME_tr">
					<td align="right">
						<label>项目名称</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="exportBidDto.PROJECT_NAME" id="PROJECT_NAME" cssStyle="width:150px;" maxlength="300" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="PROJECT_NAME_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.PROJECT_NAME_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.PROJECT_NAME_O == "0"}'>
							<input name="PROJECT_NAME_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="PROJECT_NAME_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.PROJECT_NAME_O == "1"}'>
							<input name="PROJECT_NAME_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="PROJECT_NAME_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="PROJECT_NAME_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="PROJECT_NAME_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="PROJECT_NAME_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="AGENT_CO_NAME_tr">
					<td align="right">
						<label>委托单位</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" id="agentCoName" disabled="disabled" maxlength="4" style="width:150px;" value="<s:property value="exportBidDto.AGENT_CO_NAME" />" />
						</div>
						<div class="box1_right"></div>
						<div class="btn">
							<div class="box1_left"></div> 
							<div class="box1_center">
								<input id="agentCompBtn" class="input40" type="button" value="检索" onclick="selectAgentComp()" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="agentCoName_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.AGENT_CO_NAME_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.AGENT_CO_NAME_O == "0"}'>
							<input name="agentCoName_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="agentCoName_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.AGENT_CO_NAME_O == "1"}'>
							<input name="agentCoName_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="agentCoName_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="agentCoName_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="agentCoName_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="agentCoName_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="AGENT_CO_MANAGER_tr">
					<td align="right">
						<label>联系人</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" id="agentCoManager" disabled="disabled" maxlength="4" style="width:150px;" value="<s:property value="exportBidDto.AGENT_CO_MANAGER" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="agentCoManager_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.AGENT_CO_MANAGER_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.AGENT_CO_MANAGER_O == "0"}'>
							<input name="agentCoManager_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="agentCoManager_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.AGENT_CO_MANAGER_O == "1"}'>
							<input name="agentCoManager_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="agentCoManager_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="agentCoManager_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="agentCoManager_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="agentCoManager_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="BID_AGENT_PAY_tr">
					<td align="right">
						<label>代理费用支付方</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="BID_AGENT_PAY" name="exportBidDto.BID_AGENT_PAY" style="width: 150px;">
								<s:if test='exportBidDto.BID_AGENT_PAY == "委托单位"'>
									<option value="">请选择</option>
									<option value="委托单位" selected="selected">委托单位</option>
									<option value="维保公司">维保公司</option>
									<option value="中标单位">中标单位</option>
								</s:if>
								<s:elseif test='exportBidDto.BID_AGENT_PAY == "维保公司"'>
									<option value="">请选择</option>
									<option value="委托单位">委托单位</option>
									<option value="维保公司" selected="selected">维保公司</option>
									<option value="中标单位">中标单位</option>
								</s:elseif>
								<s:elseif test='exportBidDto.BID_AGENT_PAY == "中标单位"'>
									<option value="">请选择</option>
									<option value="委托单位">委托单位</option>
									<option value="维保公司">维保公司</option>
									<option value="中标单位" selected="selected">中标单位</option>
								</s:elseif>
								<s:else>
									<option value="" selected="selected">请选择</option>
									<option value="委托单位">委托单位</option>
									<option value="维保公司">维保公司</option>
									<option value="中标单位">中标单位</option>
								</s:else>
							</select>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="BID_AGENT_PAY_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.BID_AGENT_PAY_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.BID_AGENT_PAY_O == "0"}'>
							<input name="BID_AGENT_PAY_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_AGENT_PAY_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.BID_AGENT_PAY_O == "1"}'>
							<input name="BID_AGENT_PAY_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_AGENT_PAY_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="BID_AGENT_PAY_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_AGENT_PAY_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="BID_AGENT_PAY_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="BID_BOND_tr">
					<td align="right">
						<label>保证金金额（万元）</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="BID_BOND_PD" name="bidExtendDto.BID_BOND_PD" style="width: 35px;">
								<s:if test='bidExtendDto.BID_BOND_PD == "1"'>
									<option value="1" selected="selected">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:if>
								<s:elseif test='bidExtendDto.BID_BOND_PD == "2"'>
									<option value="1">&gt;</option>
									<option value="2" selected="selected">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.BID_BOND_PD == "3"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3" selected="selected">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.BID_BOND_PD == "4"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4" selected="selected">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.BID_BOND_PD == "5"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5" selected="selected">=</option>
								</s:elseif>
								<s:else>
									<option value="1" selected="selected">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:else>
							</select>
						</div>
						<div class="box1_right"></div>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" id="BID_BOND_WANYUAN" maxlength="12" style="width:100px;" value="<s:property value="exportBidDto.BID_BOND_WANYUAN" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="BID_BOND_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.BID_BOND_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.BID_BOND_O == "0"}'>
							<input name="BID_BOND_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_BOND_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.RESERVE5_O == "1"}'>
							<input name="BID_BOND_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_BOND_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="BID_BOND_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_BOND_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="BID_BOND_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="PROJ_ASTRICT_PRICE_tr">
					<td align="right">
						<label>限价（万元）</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="PROJ_ASTRICT_PRICE_PD" name="bidExtendDto.PROJ_ASTRICT_PRICE_PD" style="width: 35px;">
								<s:if test='bidExtendDto.PROJ_ASTRICT_PRICE_PD == "1"'>
									<option value="1" selected="selected">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:if>
								<s:elseif test='bidExtendDto.PROJ_ASTRICT_PRICE_PD == "2"'>
									<option value="1">&gt;</option>
									<option value="2" selected="selected">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.PROJ_ASTRICT_PRICE_PD == "3"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3" selected="selected">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.PROJ_ASTRICT_PRICE_PD == "4"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4" selected="selected">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.PROJ_ASTRICT_PRICE_PD == "5"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5" selected="selected">=</option>
								</s:elseif>
								<s:else>
									<option value="1" selected="selected">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:else>
							</select>
						</div>
						<div class="box1_right"></div>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" id="PROJ_ASTRICT_PRICE_WANYUAN" maxlength="12" style="width:100px;" value="<s:property value="exportBidDto.PROJ_ASTRICT_PRICE_WANYUAN" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="PROJ_ASTRICT_PRICE_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.PROJ_ASTRICT_PRICE_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.PROJ_ASTRICT_PRICE_O == "0"}'>
							<input name="PROJ_ASTRICT_PRICE_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="PROJ_ASTRICT_PRICE_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.PROJ_ASTRICT_PRICE_O == "1"}'>
							<input name="PROJ_ASTRICT_PRICE_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="PROJ_ASTRICT_PRICE_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="PROJ_ASTRICT_PRICE_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="PROJ_ASTRICT_PRICE_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="PROJ_ASTRICT_PRICE_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="BID_CO_NAME_tr">
					<td align="right">
						<label>中标单位</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" id="bidCoName" disabled="disabled" maxlength="4" style="width:150px;" value="<s:property value="exportBidDto.BID_CO_NAME" />" />
						</div>
						<div class="box1_right"></div>
						<div class="btn">
							<div class="box1_left"></div> 
							<div class="box1_center">
								<input id="bidCoNameBtn" class="input40" type="button" value="检索" onclick="selectBidComp()" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="bidCoName_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.BID_CO_NAME_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.BID_CO_NAME_O == "0"}'>
							<input name="bidCoName_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="bidCoName_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.BID_CO_NAME_O == "1"}'>
							<input name="bidCoName_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="bidCoName_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="bidCoName_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="bidCoName_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="bidCoName_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<s:if test='%{bidExtendDto.BID_CO_NAME_I == "1"}'>
								<input type="checkbox" id="include" checked="checked"/>不包含
							</s:if>
							<s:else>
								<input type="checkbox" id="include"/>不包含
							</s:else>
						</div>
					</td>
				</tr>
				<tr id="BID_WIN_PRICE_tr">
					<td align="right">
						<label>中标价（万元）</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="BID_WIN_PRICE_PD" name="bidExtendDto.BID_WIN_PRICE_PD" style="width: 35px;">
								<s:if test='bidExtendDto.BID_WIN_PRICE_PD == "1"'>
									<option value="1" selected="selected">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:if>
								<s:elseif test='bidExtendDto.BID_WIN_PRICE_PD == "2"'>
									<option value="1">&gt;</option>
									<option value="2" selected="selected">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.BID_WIN_PRICE_PD == "3"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3" selected="selected">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.BID_WIN_PRICE_PD == "4"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4" selected="selected">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.BID_WIN_PRICE_PD == "5"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5" selected="selected">=</option>
								</s:elseif>
								<s:else>
									<option value="1" selected="selected">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:else>
							</select>
						</div>
						<div class="box1_right"></div>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" id="BID_WIN_PRICE_WANYUAN" maxlength="12" style="width:100px;" value="<s:property value="exportBidDto.BID_WIN_PRICE_WANYUAN" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="BID_WIN_PRICE_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.BID_WIN_PRICE_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.BID_WIN_PRICE_O == "0"}'>
							<input name="BID_WIN_PRICE_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_WIN_PRICE_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.BID_WIN_PRICE_O == "1"}'>
							<input name="BID_WIN_PRICE_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_WIN_PRICE_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="BID_WIN_PRICE_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_WIN_PRICE_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="BID_WIN_PRICE_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<s:if test='%{bidExtendDto.BID_WIN_PRICE_I == "1"}'>
								<input type="checkbox" id="include" checked="checked"/>不包含
							</s:if>
							<s:else>
								<input type="checkbox" id="include"/>不包含
							</s:else>
						</div>
					</td>
				</tr>
				<tr id="BID_APPLY_PRICE_tr">
					<td align="right">
						<label>标书费(元）</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="BID_APPLY_PRICE_PD" name="bidExtendDto.BID_APPLY_PRICE_PD" style="width: 35px;">
								<s:if test='bidExtendDto.BID_APPLY_PRICE_PD == "1"'>
									<option value="1" selected="selected">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:if>
								<s:elseif test='bidExtendDto.BID_APPLY_PRICE_PD == "2"'>
									<option value="1">&gt;</option>
									<option value="2" selected="selected">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.BID_APPLY_PRICE_PD == "3"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3" selected="selected">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.BID_APPLY_PRICE_PD == "4"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4" selected="selected">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.BID_APPLY_PRICE_PD == "5"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5" selected="selected">=</option>
								</s:elseif>
								<s:else>
									<option value="1" selected="selected">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:else>
							</select>
						</div>
						<div class="box1_right"></div>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="exportBidDto.BID_APPLY_PRICE" id="BID_APPLY_PRICE" cssStyle="width:100px;" maxlength="12" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="BID_APPLY_PRICE_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.BID_APPLY_PRICE_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.BID_APPLY_PRICE_O == "0"}'>
							<input name="BID_APPLY_PRICE_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_APPLY_PRICE_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.BID_APPLY_PRICE_O == "1"}'>
							<input name="BID_APPLY_PRICE_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_APPLY_PRICE_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="BID_APPLY_PRICE_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_APPLY_PRICE_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="BID_APPLY_PRICE_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<s:if test='%{bidExtendDto.BID_APPLY_PRICE_I == "1"}'>
								<input type="checkbox" id="include" checked="checked"/>不包含
							</s:if>
							<s:else>
								<input type="checkbox" id="include"/>不包含
							</s:else>
						</div>
					</td>
				</tr>
				<tr id="BID_AGENT_PRICE_tr">
					<td align="right">
						<label>代理费（万元）</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="BID_AGENT_PRICE_PD" name="bidExtendDto.BID_AGENT_PRICE_PD" style="width: 35px;">
								<s:if test='bidExtendDto.BID_AGENT_PRICE_PD == "1"'>
									<option value="1" selected="selected">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:if>
								<s:elseif test='bidExtendDto.BID_AGENT_PRICE_PD == "2"'>
									<option value="1">&gt;</option>
									<option value="2" selected="selected">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.BID_AGENT_PRICE_PD == "3"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3" selected="selected">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.BID_AGENT_PRICE_PD == "4"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4" selected="selected">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.BID_AGENT_PRICE_PD == "5"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5" selected="selected">=</option>
								</s:elseif>
								<s:else>
									<option value="1" selected="selected">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:else>
							</select>
						</div>
						<div class="box1_right"></div>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" id="BID_AGENT_PRICE_WANYUAN2" maxlength="12" style="width:100px;" value="<s:property value="exportBidDto.BID_AGENT_PRICE_WANYUAN2" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="BID_AGENT_PRICE_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.BID_AGENT_PRICE_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.BID_AGENT_PRICE_O == "0"}'>
							<input name="BID_AGENT_PRICE_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_AGENT_PRICE_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.BID_AGENT_PRICE_O == "1"}'>
							<input name="BID_AGENT_PRICE_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_AGENT_PRICE_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="BID_AGENT_PRICE_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_AGENT_PRICE_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="BID_AGENT_PRICE_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<s:if test='%{bidExtendDto.BID_AGENT_PRICE_I == "1"}'>
								<input type="checkbox" id="include" checked="checked"/>不包含
							</s:if>
							<s:else>
								<input type="checkbox" id="include"/>不包含
							</s:else>
						</div>
					</td>
				</tr>
				<tr id="BID_COMMISION_tr">
					<td align="right">
						<label>专家费（元）</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="BID_COMMISION_PD" name="bidExtendDto.BID_COMMISION_PD" style="width: 35px;">
								<s:if test='bidExtendDto.BID_COMMISION_PD == "1"'>
									<option value="1" selected="selected">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:if>
								<s:elseif test='bidExtendDto.BID_COMMISION_PD == "2"'>
									<option value="1">&gt;</option>
									<option value="2" selected="selected">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.BID_COMMISION_PD == "3"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3" selected="selected">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.BID_COMMISION_PD == "4"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4" selected="selected">&le;</option>
									<option value="5">=</option>
								</s:elseif>
								<s:elseif test='bidExtendDto.BID_COMMISION_PD == "5"'>
									<option value="1">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5" selected="selected">=</option>
								</s:elseif>
								<s:else>
									<option value="1" selected="selected">&gt;</option>
									<option value="2">&ge;</option>
									<option value="3">&lt;</option>
									<option value="4">&le;</option>
									<option value="5">=</option>
								</s:else>
							</select>
						</div>
						<div class="box1_right"></div>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="exportBidDto.BID_COMMISION" id="BID_COMMISION" cssStyle="width:100px;" maxlength="12" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="BID_COMMISION_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.BID_COMMISION_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.BID_COMMISION_O == "0"}'>
							<input name="BID_COMMISION_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_COMMISION_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.BID_COMMISION_O == "1"}'>
							<input name="BID_COMMISION_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_COMMISION_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="BID_COMMISION_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="BID_COMMISION_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="BID_COMMISION_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="PROJECT_MANAGER_tr">
					<td align="right">
						<label>工程师</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" id="projectManager" disabled="disabled" maxlength="4" style="width:150px;" value="<s:property value="exportBidDto.PROJECT_MANAGER" />" />
						</div>
						<div class="box1_right"></div>
						<div class="btn">
							<div class="box1_left"></div> 
							<div class="box1_center">
								<input id="projectMgBtn" class="input40" type="button" value="检索" onclick="selectProjectManager()" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="projectManager_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.PROJECT_MANAGER_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.PROJECT_MANAGER_O == "0"}'>
							<input name="projectManager_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="projectManager_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.PROJECT_MANAGER_O == "1"}'>
							<input name="projectManager_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="projectManager_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="projectManager_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="projectManager_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="projectManager_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="TENDER_OPEN_DATE_tr">
					<td align="right">
						<label>开评标时间</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 135px;" id="tenderOpenDate" value="<s:property value="exportBidDto.TENDER_OPEN_DATE"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('tenderOpenDate'));"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="tenderOpenDate_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.TENDER_OPEN_DATE_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.TENDER_OPEN_DATE_O == "0"}'>
							<input name="tenderOpenDate_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="tenderOpenDate_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.TENDER_OPEN_DATE_O == "1"}'>
							<input name="tenderOpenDate_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="tenderOpenDate_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="tenderOpenDate_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="tenderOpenDate_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="tenderOpenDate_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="SUBMIT_DATE_tr">
					<td align="right">
						<label>招标公告开始时间</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 135px;" id="submitDate" value="<s:property value="exportBidDto.SUBMIT_DATE"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('submitDate'));"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="submitDate_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.SUBMIT_DATE_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.SUBMIT_DATE_O == "0"}'>
							<input name="submitDate_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="submitDate_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.SUBMIT_DATE_O == "1"}'>
							<input name="submitDate_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="submitDate_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="submitDate_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="submitDate_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="submitDate_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<s:if test='%{bidExtendDto.SUBMIT_DATE_I == "1"}'>
								<input type="checkbox" id="include" checked="checked"/>不包含
							</s:if>
							<s:else>
								<input type="checkbox" id="include"/>不包含
							</s:else>
						</div>
					</td>
				</tr>
				<tr id="SUBMIT_DATE2_tr">
					<td align="right">
						<label>招标公告结束时间</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 135px;" id="submitDate2" value="<s:property value="exportBidDto.SUBMIT_DATE2"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('submitDate2'));"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="submitDate2_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.SUBMIT_DATE2_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.SUBMIT_DATE2_O == "0"}'>
							<input name="submitDate2_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="submitDate2_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.SUBMIT_DATE2_O == "1"}'>
							<input name="submitDate2_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="submitDate2_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="submitDate2_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="submitDate2_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="submitDate2_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<s:if test='%{bidExtendDto.SUBMIT_DATE2_I == "1"}'>
								<input type="checkbox" id="include" checked="checked"/>不包含
							</s:if>
							<s:else>
								<input type="checkbox" id="include"/>不包含
							</s:else>
						</div>
					</td>
				</tr>
				<tr id="BID_NOTICE_DATE_tr">
					<td align="right">
						<label>中标公示开始时间</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 135px;" id="bidNoticeDate" value="<s:property value="exportBidDto.BID_NOTICE_DATE"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('bidNoticeDate'));"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="bidNoticeDate_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.BID_NOTICE_DATE_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.BID_NOTICE_DATE_O == "0"}'>
							<input name="bidNoticeDate_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="bidNoticeDate_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.BID_NOTICE_DATE_O == "1"}'>
							<input name="bidNoticeDate_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="bidNoticeDate_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="bidNoticeDate_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="bidNoticeDate_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="bidNoticeDate_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<s:if test='%{bidExtendDto.BID_NOTICE_DATE_I == "1"}'>
								<input type="checkbox" id="include" checked="checked"/>不包含
							</s:if>
							<s:else>
								<input type="checkbox" id="include"/>不包含
							</s:else>
						</div>
					</td>
				</tr>
				<tr id="BID_NOTICE_DATE2_tr">
					<td align="right">
						<label>中标公示结束时间</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 135px;" id="bidNoticeDate2" value="<s:property value="exportBidDto.BID_NOTICE_DATE2"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('bidNoticeDate2'));"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="bidNoticeDate2_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.BID_NOTICE_DATE2_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.BID_NOTICE_DATE2_O == "0"}'>
							<input name="bidNoticeDate2_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="bidNoticeDate2_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.BID_NOTICE_DATE2_O == "1"}'>
							<input name="bidNoticeDate2_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="bidNoticeDate2_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="bidNoticeDate2_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="bidNoticeDate2_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="bidNoticeDate2_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<s:if test='%{bidExtendDto.BID_NOTICE_DATE2_I == "1"}'>
								<input type="checkbox" id="include" checked="checked"/>不包含
							</s:if>
							<s:else>
								<input type="checkbox" id="include"/>不包含
							</s:else>
						</div>
					</td>
				</tr>
				<tr id="BID_MESSAGE_DATE_tr">
					<td align="right">
						<label>中标文件扫描</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 135px;" id="bidMessageDate" value="<s:property value="exportBidDto.BID_MESSAGE_DATE"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('bidMessageDate'));"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="bidMessageDate_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.BID_MESSAGE_DATE_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.BID_MESSAGE_DATE_O == "0"}'>
							<input name="bidMessageDate_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="bidMessageDate_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.BID_MESSAGE_DATE_O == "1"}'>
							<input name="bidMessageDate_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="bidMessageDate_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="bidMessageDate_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="bidMessageDate_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="bidMessageDate_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="RESERVE_DATE4_tr">
					<td align="right">
						<label>评标报告扫描归档</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 135px;" id="reserveDate4" value="<s:property value="exportBidDto.RESERVE_DATE4"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('reserveDate4'));"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="reserveDate4_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.RESERVE_DATE4_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.RESERVE_DATE4_O == "0"}'>
							<input name="reserveDate4_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="reserveDate4_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.RESERVE_DATE4_O == "1"}'>
							<input name="reserveDate4_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="reserveDate4_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="reserveDate4_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="reserveDate4_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="reserveDate4_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="RESERVE_DATE7_tr">
					<td align="right">
						<label>失败项目日期</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 135px;" id="reserveDate7" value="<s:property value="exportBidDto.RESERVE_DATE7"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('reserveDate7'));"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="reserveDate7_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.RESERVE_DATE7_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.RESERVE_DATE7_O == "0"}'>
							<input name="reserveDate7_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="reserveDate7_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.RESERVE_DATE7_O == "1"}'>
							<input name="reserveDate7_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="reserveDate7_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="reserveDate7_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="reserveDate7_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="reserveDate7_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="FINISH_STATUS_tr">
					<td align="right">
						<label>项目完成情况</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="FINISH_STATUS" name="exportBidDto.FINISH_STATUS" style="width: 150px;">
								<s:if test='exportBidDto.FINISH_STATUS == "1"'>
									<option value="">请选择</option>
									<option value="7" selected="selected">完成</option>
									<option value="1">取消</option>
									<option value="2">失败（开标不满3家）</option>
									<option value="3">失败（报名不满3家)</option>
									<option value="4">失败（评审）</option>
									<option value="5">终止</option>
									<option value="6">空白</option>
								</s:if>
								<s:else>
									<s:if test='exportBidDto.RESERVE1 == "1"'>
										<option value="">请选择</option>
										<option value="7">完成</option>
										<option value="1" selected="selected">取消</option>
										<option value="2">失败（开标不满3家）</option>
										<option value="3">失败（报名不满3家)</option>
										<option value="4">失败（评审）</option>
										<option value="5">终止</option>
										<option value="6">空白</option>
									</s:if>
									<s:elseif test='exportBidDto.RESERVE1 == "2"'>
										<option value="">请选择</option>
										<option value="7">完成</option>
										<option value="1">取消</option>
										<option value="2" selected="selected">失败（开标不满3家）</option>
										<option value="3">失败（报名不满3家)</option>
										<option value="4">失败（评审）</option>
										<option value="5">终止</option>
										<option value="6">空白</option>
									</s:elseif>
									<s:elseif test='exportBidDto.RESERVE1 == "3"'>
										<option value="">请选择</option>
										<option value="7">完成</option>
										<option value="1">取消</option>
										<option value="2">失败（开标不满3家）</option>
										<option value="3" selected="selected">失败（报名不满3家)</option>
										<option value="4">失败（评审）</option>
										<option value="5">终止</option>
										<option value="6">空白</option>
									</s:elseif>
									<s:elseif test='exportBidDto.RESERVE1 == "4"'>
										<option value="">请选择</option>
										<option value="7">完成</option>
										<option value="1">取消</option>
										<option value="2">失败（开标不满3家）</option>
										<option value="3">失败（报名不满3家)</option>
										<option value="4" selected="selected">失败（评审）</option>
										<option value="5">终止</option>
										<option value="6">空白</option>
									</s:elseif>
									<s:elseif test='exportBidDto.RESERVE1 == "5"'>
										<option value="">请选择</option>
										<option value="7">完成</option>
										<option value="1">取消</option>
										<option value="2">失败（开标不满3家）</option>
										<option value="3">失败（报名不满3家)</option>
										<option value="4">失败（评审）</option>
										<option value="5" selected="selected">终止</option>
										<option value="6">空白</option>
									</s:elseif>
									<s:elseif test='exportBidDto.RESERVE1 == "6"'>
										<option value="">请选择</option>
										<option value="7">完成</option>
										<option value="1">取消</option>
										<option value="2">失败（开标不满3家）</option>
										<option value="3">失败（报名不满3家)</option>
										<option value="4">失败（评审）</option>
										<option value="5">终止</option>
										<option value="6" selected="selected">空白</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="7">完成</option>
										<option value="1">取消</option>
										<option value="2">失败（开标不满3家）</option>
										<option value="3">失败（报名不满3家)</option>
										<option value="4">失败（评审）</option>
										<option value="5">终止</option>
										<option value="6">空白</option>
									</s:else>
								</s:else>
							</select>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="FINISH_STATUS_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.FINISH_STATUS_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.FINISH_STATUS_O == "0"}'>
							<input name="FINISH_STATUS_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="FINISH_STATUS_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.FINISH_STATUS_O == "1"}'>
							<input name="FINISH_STATUS_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="FINISH_STATUS_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="FINISH_STATUS_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="FINISH_STATUS_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="FINISH_STATUS_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<s:if test='%{bidExtendDto.FINISH_STATUS_I == "1"}'>
								<input type="checkbox" id="include" checked="checked"/>不包含
							</s:if>
							<s:else>
								<input type="checkbox" id="include"/>不包含
							</s:else>
						</div>
					</td>
				</tr>
				<tr id="FINISH_NOTE_tr">
					<td align="right">
						<label>备注</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="exportBidDto.FINISH_NOTE" id="FINISH_NOTE" cssStyle="width:150px;" maxlength="50" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" name="allClear" id="FINISH_NOTE_ordernumber" maxlength="4" style="width:50px;" value="<s:property value="bidExtendDto.FINISH_NOTE_ON" />" />
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<s:if test='%{bidExtendDto.FINISH_NOTE_O == "0"}'>
							<input name="FINISH_NOTE_order" type="radio" value="0" checked="checked"/>&nbsp;&nbsp;&nbsp;
							<input name="FINISH_NOTE_order" type="radio" value="1"/>
						</s:if>
						<s:elseif test='%{bidExtendDto.FINISH_NOTE_O == "1"}'>
							<input name="FINISH_NOTE_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="FINISH_NOTE_order" type="radio" value="1" checked="checked"/>
						</s:elseif>
						<s:else>
							<input name="FINISH_NOTE_order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
							<input name="FINISH_NOTE_order" type="radio" value="1"/>
						</s:else>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="FINISH_NOTE_clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
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
								<input type="button" class="input80" value="检索" onclick="showBidList();"/>
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
		<div class="btns" style="margin-top:40px; margin-left: 0px;">
		</div>
		<div class="data_table" style="padding:0px;">
			<div class="tab_tittle">
				<table width="100%" border="1" cellpadding="5" cellspacing="0">
				</table>
			</div>
			<div class="tab_content">
				<table class="info_tab" width="300%" border="1" cellpadding="0" cellspacing="0" style="border-top:black solid 0px; border-bottom: 0px;">
					<tr class="tittle" style="height: 50px;">
						<td width="40">编号</td>
						<td width="80">承接项目日期</td>
						<td width="150">招标编号</td>
						<td width="80">项目性质</td>
						<td width="150">项目名称</td>
						<td width="150">委托单位</td>
						<td width="80">联系人</td>
						<td width="80">会审监管人</td>
						<td width="80">代理费用支付方</td>
						<td width="80">保证金金额（万元）</td>
						<td width="80">限价（万元）</td>
						<td width="150">中标单位</td>
						<td width="80">中标价（万元）</td>
						<td width="160">
							<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
								<tr style="background:rgb(238,238,238);">
									<td colspan="2" align="center">收费</td>
								</tr>
								<tr style="background:rgb(238,238,238);">
									<td width="80">标书费(元）</td>
									<td width="80">代理费（万元）</td>
								</tr>
							</table>
						</td>
						<td width="80">专家费（元）</td>
						<td width="80">工程师</td>
						<td width="80">开评标时间</td>
						<td width="80">招标公告开始时间</td>
						<td width="80">招标公告结束时间</td>
					</tr>
					<s:iterator id="listBidExport" value="listBidExport" status="st1">
						<tr>
							<td><s:property value="#st1.index + 1"/></td>
							<td><s:date name="RESERVE_DATE6" format="yyyy/MM/dd"/></td>
							<td><s:property value="BID_NO"/></td>
							<td>
								<s:if test='RESERVE2 == "1"'>
									成本内
								</s:if>
								<s:elseif test='RESERVE2 == "2"'>
									成本外
								</s:elseif>
								<s:elseif test='RESERVE2 == "3"'>
									其他
								</s:elseif>
								<s:else>
								</s:else>
							</td>
							<td><s:property value="PROJECT_NAME"/></td>
							<td><s:property value="AGENT_CO_NAME"/></td>
							<td><s:property value="AGENT_CO_MANAGER"/></td>
							<td>/</td>
							<td><s:property value="BID_AGENT_PAY"/></td>
							<td><s:property value="BID_BOND_LIST"/></td>
							<td><s:property value="PROJ_ASTRICT_PRICE_WANYUAN"/></td>
							<td><s:property value="BID_CO_NAME"/></td>
							<td><s:property value="BID_PRICE_LIST"/></td>
							<td valign="top">
								<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
									<tr style="height: 30px;">
										<td width="80"><s:property value="BID_APPLY_PRICE"/></td>
										<td width="80"><s:property value="BID_AGENT_PRICE_WANYUAN2"/></td>
									</tr>
								</table>
							</td>
							<td><s:property value="BID_COMMISION"/></td>
							<td><s:property value="PROJECT_MANAGER"/></td>
							<td><s:date name="TENDER_OPEN_DATE" format="yyyy/MM/dd"/></td>
							<td><s:date name="SUBMIT_DATE" format="yyyy/MM/dd"/></td>
							<td><s:date name="SUBMIT_DATE2" format="yyyy/MM/dd"/></td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
		<div class="btns" style="margin-top:40px; margin-left: 0px;">
			<table border="0" style="margin:0 auto;">
				<tr>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input type="button" class="input80" value="下载" onclick="exportList();"/>
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
