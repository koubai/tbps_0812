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
		
		$("#ONLINE_DATE").attr("value", $("#onlineDate").val());
		$("#AGENT_CO_NAME").attr("value", $("#agentCoName").val());
		$("#AGENT_CO_MANAGER").attr("value", $("#agentCoManager").val());
		$("#BID_CO_NAME").attr("value", $("#bidCoName").val());
		$("#RESERVE_DATE1").attr("value", $("#reserveDate1").val());
		$("#SUBMIT_DATE").attr("value", $("#submitDate").val());
		$("#SUBMIT_DATE2").attr("value", $("#submitDate2").val());
		$("#BID_NOTICE_DATE").attr("value", $("#bidNoticeDate").val());
		$("#BID_NOTICE_DATE2").attr("value", $("#bidNoticeDate2").val());
		$("#RESERVE_DATE4").attr("value", $("#reserveDate4").val());
		$("#BID_MESSAGE_DATE").attr("value", $("#bidMessageDate").val());

		//价格
		var RESERVE5 = $("#RESERVE5").val();
		var PROJ_ASTRICT_PRICE = $("#PROJ_ASTRICT_PRICE").val();
		var RECEIPT1_AGENT_COMMISSION = $("#RECEIPT1_AGENT_COMMISSION").val();
		var BID_PRICE = $("#BID_PRICE").val();
		var BID_APPLY_PRICE = $("#BID_APPLY_PRICE").val();
		var BID_COMMISION = $("#BID_COMMISION").val();

		if(RESERVE5 != "" && !numberCheck(RESERVE5)) {
			alert("保证金格式不正确！");
			$("#RESERVE5").focus();
			return;
		}
		if(PROJ_ASTRICT_PRICE != "" && !numberCheck(PROJ_ASTRICT_PRICE)) {
			alert("限价格式不正确！");
			$("#PROJ_ASTRICT_PRICE").focus();
			return;
		}
		if(BID_PRICE != "" && !isReal(BID_PRICE)) {
			alert("中标价格式不正确！");
			$("#BID_PRICE").focus();
			return;
		}
		if(RECEIPT1_AGENT_COMMISSION != "" && !isReal(RECEIPT1_AGENT_COMMISSION)) {
			alert("代理费格式不正确！");
			$("#RECEIPT1_AGENT_COMMISSION").focus();
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

		if(RESERVE5 == "") {
			$("#RESERVE5").attr("value", 0);
		} else {
			//数据库保存单位是元，页面显示是万元，所以这里要乘以10000
			$("#RESERVE5").attr("value", parseFloat(RESERVE5) * 10000);
		}

		if(PROJ_ASTRICT_PRICE == "") {
			$("#PROJ_ASTRICT_PRICE").attr("value", 0);
		} else {
			//数据库保存单位是元，页面显示是万元，所以这里要乘以10000
			$("#PROJ_ASTRICT_PRICE").attr("value", parseFloat(PROJ_ASTRICT_PRICE) * 10000);
		}

		if(BID_PRICE == "") {
			$("#BID_PRICE").attr("value", 0);
		} else {
			//数据库保存单位是元，页面显示是万元，所以这里要乘以10000
			$("#BID_PRICE").attr("value", parseFloat(BID_PRICE) * 10000);
		}

		if(RECEIPT1_AGENT_COMMISSION == "") {
			$("#RECEIPT1_AGENT_COMMISSION").attr("value", 0);
		} else {
			//数据库保存单位是元，页面显示是万元，所以这里要乘以10000
			$("#RECEIPT1_AGENT_COMMISSION").attr("value", parseFloat(RECEIPT1_AGENT_COMMISSION) * 10000);
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
		for(var i=2; i<rows.length; i++){
			var id = rows[i].id;
			var orderNumber = rows[i].cells[2].childNodes[3].childNodes[1].value;
			var order = 0;
			var orderNode = rows[i].cells[3].childNodes[1];
			var orderNode2 = rows[i].cells[3].childNodes[3];
			if(orderNode.checked){
				order = orderNode.value;
			}
			if(orderNode2.checked){
				order = orderNode2.value;
			}
			document.getElementById(id.substring(0,id.length-3)+"_ON").value = orderNumber;
			document.getElementById(id.substring(0,id.length-3)+"_O").value = order;
			if(rows[i].cells.length>5){
				var includeNode= rows[i].cells[5].childNodes[1].childNodes[1];
				var include = "0";
				if(includeNode.checked){
					include = "1";
				}
				document.getElementById(id.substring(0,id.length-3)+"_I").value = include;
			} else {
				document.getElementById(id.substring(0,id.length-3)+"_I").value = "0";
			}
		}
		
		document.mainform.action = '<c:url value="/bid/showBidList.action"></c:url>';
		document.mainform.submit();
	}
	
	//委托公司
	function selectAgentComp() {
		//alert("test");
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
		var clearName = tmpName.substring(0,tmpName.length-5);
		clearName = clearName + "OrderNumber";
		document.getElementById(clearName).value = "";
	}
</script>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:auto;">
<s:form id="mainform" name="mainform" method="POST">
	<s:hidden name="startIndexHist" id="startIndexHist"/>
	<s:hidden name="exportBidDto.ONLINE_DATE" id="ONLINE_DATE"/> 
	<s:hidden name="exportBidDto.AGENT_CO_NAME" id="AGENT_CO_NAME"/>
	<s:hidden name="exportBidDto.AGENT_CO_MANAGER" id="AGENT_CO_MANAGER"/>
	<s:hidden name="exportBidDto.BID_CO_NAME" id="BID_CO_NAME"/>
	<s:hidden name="exportBidDto.RESERVE_DATE1" id="RESERVE_DATE1"/> 
	<s:hidden name="exportBidDto.SUBMIT_DATE" id="SUBMIT_DATE"/> 
	<s:hidden name="exportBidDto.SUBMIT_DATE2" id="SUBMIT_DATE2"/> 
	<s:hidden name="exportBidDto.BID_NOTICE_DATE" id="BID_NOTICE_DATE"/> 
	<s:hidden name="exportBidDto.BID_NOTICE_DATE2" id="BID_NOTICE_DATE2"/> 
	<s:hidden name="exportBidDto.RESERVE_DATE4" id="RESERVE_DATE4"/>
	<s:hidden name="exportBidDto.BID_MESSAGE_DATE" id="BID_MESSAGE_DATE"/>
	
	<s:hidden name="exportBidDto.ONLINE_DATE_ON" id="ONLINE_DATE_ON"/>
	<s:hidden name="exportBidDto.BID_NO_ON" id="BID_NO_ON"/>
	<s:hidden name="exportBidDto.PROJECT_TYPE_ON" id="PROJECT_TYPE_ON"/>
	<s:hidden name="exportBidDto.PROJECT_NAME_ON" id="PROJECT_NAME_ON"/>
	<s:hidden name="exportBidDto.AGENT_CO_NAME_ON" id="AGENT_CO_NAME_ON"/>
	<s:hidden name="exportBidDto.AGENT_CO_MANAGER_ON" id="AGENT_CO_MANAGER_ON"/>
	<s:hidden name="exportBidDto.BID_AGENT_PAY_ON" id="BID_AGENT_PAY_ON"/>
	<s:hidden name="exportBidDto.RESERVE5_ON" id="RESERVE5_ON"/>
	<s:hidden name="exportBidDto.PROJ_ASTRICT_PRICE_ON" id="PROJ_ASTRICT_PRICE_ON"/>
	<s:hidden name="exportBidDto.BID_CO_NAME_ON" id="BID_CO_NAME_ON"/>
	<s:hidden name="exportBidDto.BID_PRICE_ON" id="BID_PRICE_ON"/>
	<s:hidden name="exportBidDto.BID_APPLY_PRICE_ON" id="BID_APPLY_PRICE_ON"/>
	<s:hidden name="exportBidDto.RECEIPT1_AGENT_COMMISSION_ON" id="RECEIPT1_AGENT_COMMISSION_ON"/>
	<s:hidden name="exportBidDto.BID_COMMISION_ON" id="BID_COMMISION_ON"/>
	<s:hidden name="exportBidDto.PROJECT_MANAGER_ON" id="PROJECT_MANAGER_ON"/>
	<s:hidden name="exportBidDto.RESERVE_DATE1_ON" id="RESERVE_DATE1_ON"/>
	<s:hidden name="exportBidDto.SUBMIT_DATE_ON" id="SUBMIT_DATE_ON"/>
	<s:hidden name="exportBidDto.SUBMIT_DATE2_ON" id="SUBMIT_DATE2_ON"/>
	<s:hidden name="exportBidDto.BID_NOTICE_DATE_ON" id="BID_NOTICE_DATE_ON"/>
	<s:hidden name="exportBidDto.BID_NOTICE_DATE2_ON" id="BID_NOTICE_DATE2_ON"/>
	<s:hidden name="exportBidDto.BID_MESSAGE_DATE_ON" id="BID_MESSAGE_DATE_ON"/>
	<s:hidden name="exportBidDto.RESERVE_DATE4_ON" id="RESERVE_DATE4_ON"/>
	<s:hidden name="exportBidDto.FINISH_STATUS_ON" id="FINISH_STATUS_ON"/>
	<s:hidden name="exportBidDto.FINISH_NOTE_ON" id="FINISH_NOTE_ON"/>
	
	<s:hidden name="exportBidDto.ONLINE_DATE_O" id="ONLINE_DATE_O"/>
	<s:hidden name="exportBidDto.BID_NO_O" id="BID_NO_O"/>
	<s:hidden name="exportBidDto.PROJECT_TYPE_O" id="PROJECT_TYPE_O"/>
	<s:hidden name="exportBidDto.PROJECT_NAME_O" id="PROJECT_NAME_O"/>
	<s:hidden name="exportBidDto.AGENT_CO_NAME_O" id="AGENT_CO_NAME_O"/>
	<s:hidden name="exportBidDto.AGENT_CO_MANAGER_O" id="AGENT_CO_MANAGER_O"/>
	<s:hidden name="exportBidDto.BID_AGENT_PAY_O" id="BID_AGENT_PAY_O"/>
	<s:hidden name="exportBidDto.RESERVE5_O" id="RESERVE5_O"/>
	<s:hidden name="exportBidDto.PROJ_ASTRICT_PRICE_O" id="PROJ_ASTRICT_PRICE_O"/>
	<s:hidden name="exportBidDto.BID_CO_NAME_O" id="BID_CO_NAME_O"/>
	<s:hidden name="exportBidDto.BID_PRICE_O" id="BID_PRICE_O"/>
	<s:hidden name="exportBidDto.BID_APPLY_PRICE_O" id="BID_APPLY_PRICE_O"/>
	<s:hidden name="exportBidDto.RECEIPT1_AGENT_COMMISSION_O" id="RECEIPT1_AGENT_COMMISSION_O"/>
	<s:hidden name="exportBidDto.BID_COMMISION_O" id="BID_COMMISION_O"/>
	<s:hidden name="exportBidDto.PROJECT_MANAGER_O" id="PROJECT_MANAGER_O"/>
	<s:hidden name="exportBidDto.RESERVE_DATE1_O" id="RESERVE_DATE1_O"/>
	<s:hidden name="exportBidDto.SUBMIT_DATE_O" id="SUBMIT_DATE_O"/>
	<s:hidden name="exportBidDto.SUBMIT_DATE2_O" id="SUBMIT_DATE2_O"/>
	<s:hidden name="exportBidDto.BID_NOTICE_DATE_O" id="BID_NOTICE_DATE_O"/>
	<s:hidden name="exportBidDto.BID_NOTICE_DATE2_O" id="BID_NOTICE_DATE2_O"/>
	<s:hidden name="exportBidDto.BID_MESSAGE_DATE_O" id="BID_MESSAGE_DATE_O"/>
	<s:hidden name="exportBidDto.RESERVE_DATE4_O" id="RESERVE_DATE4_O"/>
	<s:hidden name="exportBidDto.FINISH_STATUS_O" id="FINISH_STATUS_O"/>
	<s:hidden name="exportBidDto.FINISH_NOTE_O" id="FINISH_NOTE_O"/>
	
	<s:hidden name="exportBidDto.ONLINE_DATE_I" id="ONLINE_DATE_I"/>
	<s:hidden name="exportBidDto.BID_NO_I" id="BID_NO_I"/>
	<s:hidden name="exportBidDto.PROJECT_TYPE_I" id="PROJECT_TYPE_I"/>
	<s:hidden name="exportBidDto.PROJECT_NAME_I" id="PROJECT_NAME_I"/>
	<s:hidden name="exportBidDto.AGENT_CO_NAME_I" id="AGENT_CO_NAME_I"/>
	<s:hidden name="exportBidDto.AGENT_CO_MANAGER_I" id="AGENT_CO_MANAGER_I"/>
	<s:hidden name="exportBidDto.BID_AGENT_PAY_I" id="BID_AGENT_PAY_I"/>
	<s:hidden name="exportBidDto.RESERVE5_I" id="RESERVE5_I"/>
	<s:hidden name="exportBidDto.PROJ_ASTRICT_PRICE_I" id="PROJ_ASTRICT_PRICE_I"/>
	<s:hidden name="exportBidDto.BID_CO_NAME_I" id="BID_CO_NAME_I"/>
	<s:hidden name="exportBidDto.BID_PRICE_I" id="BID_PRICE_I"/>
	<s:hidden name="exportBidDto.BID_APPLY_PRICE_I" id="BID_APPLY_PRICE_I"/>
	<s:hidden name="exportBidDto.RECEIPT1_AGENT_COMMISSION_I" id="RECEIPT1_AGENT_COMMISSION_I"/>
	<s:hidden name="exportBidDto.BID_COMMISION_I" id="BID_COMMISION_I"/>
	<s:hidden name="exportBidDto.PROJECT_MANAGER_I" id="PROJECT_MANAGER_I"/>
	<s:hidden name="exportBidDto.RESERVE_DATE1_I" id="RESERVE_DATE1_I"/>
	<s:hidden name="exportBidDto.SUBMIT_DATE_I" id="SUBMIT_DATE_I"/>
	<s:hidden name="exportBidDto.SUBMIT_DATE2_I" id="SUBMIT_DATE2_I"/>
	<s:hidden name="exportBidDto.BID_NOTICE_DATE_I" id="BID_NOTICE_DATE_I"/>
	<s:hidden name="exportBidDto.BID_NOTICE_DATE2_I" id="BID_NOTICE_DATE2_I"/>
	<s:hidden name="exportBidDto.BID_MESSAGE_DATE_I" id="BID_MESSAGE_DATE_I"/>
	<s:hidden name="exportBidDto.RESERVE_DATE4_I" id="RESERVE_DATE4_I"/>
	<s:hidden name="exportBidDto.FINISH_STATUS_I" id="FINISH_STATUS_I"/>
	<s:hidden name="exportBidDto.FINISH_NOTE_I" id="FINISH_NOTE_I"/>
	
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
				<tr id="ONLINE_DATE_tr">
					<td align="right">
						<label>承接项目日期</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 135px;" id="onlineDate" value="<s:property value="exportBidDto.ONLINE_DATE"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('onlineDate'));"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="allClear" id="onlineDateOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="onlineDateOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="onlineDateOrder" type="radio" value="1"/>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="onlineDateClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
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
							<s:textfield name="allClear" id="bidNoOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="bidNoOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="bidNoOrder" type="radio" value="1"/>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="bidNoClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="PROJECT_TYPE_tr">
					<td align="right">
						<label>项目性质</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="PROJECT_TYPE" name="exportBidDto.PROJECT_TYPE" style="width: 150px;">
									<option value="" selected="selected">请选择</option>
									<option value="1">成本内</option>
									<option value="2">成本外</option>
									<option value="3">其他</option>
							</select>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="allClear" id="projectTypeOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="projectTypeOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="projectTypeOrder" type="radio" value="1"/>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="projectTypeClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
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
							<s:textfield name="exportBidDto.PROJECT_NAME" id="PROJECT_NAME" cssStyle="width:150px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="allClear" id="projectNameOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="projectNameOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="projectNameOrder" type="radio" value="1"/>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="projectNameClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
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
							<s:textfield name="allClear" id="agentCoNameOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="agentCoNameOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="agentCoNameOrder" type="radio" value="1"/>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="agentCoNameClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
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
							<s:textfield name="allClear" id="agentCoMgOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="agentCoMgOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="agentCoMgOrder" type="radio" value="1"/>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="agentCoMgClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
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
									<option value="" selected="selected">请选择</option>
									<option value="委托单位">委托单位</option>
									<option value="维保公司">维保公司</option>
									<option value="中标单位">中标单位</option>
							</select>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="allClear" id="bidAgentPayOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="bidAgentPayOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="bidAgentPayOrder" type="radio" value="1"/>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="bidAgentPayClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="RESERVE5_tr">
					<td align="right">
						<label>保证金金额（万元）</label>
					</td>
					<td>
						<div class="box1">
							<label>>=</label>
						</div>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="exportBidDto.RESERVE5" id="RESERVE5" cssStyle="width:135px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="allClear" id="bidBondOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="bidBondOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="bidBondOrder" type="radio" value="1"/>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="bidBondClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
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
						<div class="box1">
							<label>>=</label>
						</div>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="exportBidDto.PROJ_ASTRICT_PRICE" id="PROJ_ASTRICT_PRICE" cssStyle="width:135px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="allClear" id="projAPOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="projAPOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="projAPOrder" type="radio" value="1"/>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="projAPClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
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
							<s:textfield name="allClear" id="bidCoNameOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="bidCoNameOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="bidCoNameOrder" type="radio" value="1"/>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="bidCoNameClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<input type="checkbox" id="include" onclick="isInclude(this);"/>不包含
						</div>
					</td>
				</tr>
				<tr id="BID_PRICE_tr">
					<td align="right">
						<label>中标价（万元）</label>
					</td>
					<td>
						<div class="box1">
							<label>>=</label>
						</div>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="exportBidDto.BID_PRICE" id="BID_PRICE" cssStyle="width:135px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="allClear" id="bidPriceOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="bidPriceOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="bidPriceOrder" type="radio" value="1"/>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="bidPriceClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<input type="checkbox" id="include" onclick="isInclude(this);"/>不包含
						</div>
					</td>
				</tr>
				<tr id="BID_APPLY_PRICE_tr">
					<td align="right">
						<label>标书费(元）</label>
					</td>
					<td>
						<div class="box1">
							<label>>=</label>
						</div>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="exportBidDto.BID_APPLY_PRICE" id="BID_APPLY_PRICE" cssStyle="width:135px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="allClear" id="bidApplyPriceOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="bidApplyPriceOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="bidApplyPriceOrder" type="radio" value="1"/>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="bidApplyPriceClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<input type="checkbox" id="include" onclick="isInclude(this);"/>不包含
						</div>
					</td>
				</tr>
				<tr id="RECEIPT1_AGENT_COMMISSION_tr">
					<td align="right">
						<label>代理费（万元）</label>
					</td>
					<td>
						<div class="box1">
							<label>>=</label>
						</div>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="exportBidDto.RECEIPT1_AGENT_COMMISSION" id="RECEIPT1_AGENT_COMMISSION" cssStyle="width:135px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="allClear" id="receiptACOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="receiptACOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="receiptACOrder" type="radio" value="1"/>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="receiptACClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<input type="checkbox" id="include" onclick="isInclude(this);"/>不包含
						</div>
					</td>
				</tr>
				<tr id="BID_COMMISION_tr">
					<td align="right">
						<label>专家费（元）</label>
					</td>
					<td>
						<div class="box1">
							<label>>=</label>
						</div>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="exportBidDto.BID_COMMISION" id="BID_COMMISION" cssStyle="width:135px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="allClear" id="bidCommisionOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="bidCommisionOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="bidCommisionOrder" type="radio" value="1"/>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="bidCommisionClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
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
							<s:textfield name="allClear" id="projectMgOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="projectMgOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="projectMgOrder" type="radio" value="1"/>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="projectMgClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr id="RESERVE_DATE1_tr">
					<td align="right">
						<label>开评标时间</label>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 135px;" id="reserveDate1" value="<s:property value="exportBidDto.RESERVE_DATE1"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('reserveDate1'));"></a>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="allClear" id="reserveDate1OrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="reserveDate1Order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="reserveDate1Order" type="radio" value="1"/>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="reserveDate1Clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
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
							<s:textfield name="allClear" id="submitDateOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="submitDateOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="submitDateOrder" type="radio" value="1"/>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="submitDateClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<input type="checkbox" id="include" onclick="isInclude(this);"/>不包含
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
							<s:textfield name="allClear" id="submitDate2OrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="submitDate2Order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="submitDate2Order" type="radio" value="1"/>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="submitDate2Clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<input type="checkbox" id="include" onclick="isInclude(this);"/>不包含
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
							<s:textfield name="allClear" id="bidNoticeDateOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="bidNoticeDateOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="bidNoticeDateOrder" type="radio" value="1"/>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="bidNoticeDateClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<input type="checkbox" id="include" onclick="isInclude(this);"/>不包含
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
							<s:textfield name="allClear" id="bidNoticeDate2OrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="bidNoticeDate2Order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="bidNoticeDate2Order" type="radio" value="1"/>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="bidNoticeDate2Clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<input type="checkbox" id="include" onclick="isInclude(this);"/>不包含
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
							<s:textfield name="allClear" id="bidMsgDateOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="bidMsgDateOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="bidMsgDateOrder" type="radio" value="1"/>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="bidMsgDateClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
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
							<s:textfield name="allClear" id="reserveDate4OrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="reserveDate4Order" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="reserveDate4Order" type="radio" value="1"/>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="reserveDate4Clear" class="input40" type="button" value="清" onclick="clearOne(this);" />
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
									<option value="" selected="selected">请选择</option>
									<option value="1">取消</option>
									<option value="2">失败（开标不满3家）</option>
									<option value="3">失败（报名不满3家)</option>
									<option value="4">失败（评审）</option>
									<option value="5">完成</option>
									<option value="6">终止</option>
							</select>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="allClear" id="finishStatusOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="finishStatusOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="finishStatusOrder" type="radio" value="1"/>
					</td>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="finishStatusClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
					<td>
						<div class="box1" style="vertical-align: middle; margin-top: 5px;">
							<input type="checkbox" id="include" onclick="isInclude(this);"/>不包含
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
							<s:textfield name="exportBidDto.FINISH_NOTE" id="FINISH_NOTE" cssStyle="width:150px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="allClear" id="finishNoteOrderNumber" cssStyle="width:50px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
					<td>
						<input name="finishNoteOrder" type="radio" value="0"/>&nbsp;&nbsp;&nbsp;
						<input name="finishNoteOrder" type="radio" value="1"/>
					</td>
					<td colspan="2">
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input id="finishNoteClear" class="input40" type="button" value="清" onclick="clearOne(this);" />
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
	</div>
</s:form>
</body>
</html>
