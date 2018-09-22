<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=11 ">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>合同新增</title><!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/global.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/local.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript">
	/**
	 * 验证是否是数字2
	 * @param s
	 * @return
	 */
	function numberCheck2(s) {
		var reg = /^[-+]?\d+$/;
		return reg.test(s);
	}
	/**
	 * 判断是否是实数
	 * @param s
	 * @return
	 */
	function isReal2(s) {
		var reg;
		if(s.indexOf(".") >= 0) {
			reg = /^[-+]?\d+\.\d+$/;
		} else {
			reg = /^[-+]?\d+$/;
		}
		return reg.test(s);
	}

	function add() {
		setAuditValue();
		var CNTRCT_NO = $("#CNTRCT_NO").val();
		var CNTRCT_TYPE = $("#CNTRCT_TYPE").val();
		//var AUDIT_COMP_NO = $("#AUDIT_COMP_NO").val();
		var AUDIT_COMP_NAME = $("#AUDIT_COMP_NAME").val();

		if(CNTRCT_NO == "") {
			alert("合同编号不能为空！");
			$("#CNTRCT_NO").focus();
			return;
		}
		if(CNTRCT_TYPE == "") {
			alert("请选择合同性质！");
			$("#CNTRCT_TYPE").focus();
			return;
		}
		//if(AUDIT_COMP_NO == "") {
		if(AUDIT_COMP_NAME == "") {
			alert("委托单位不能为空！");
			$("#AUDIT_COMP_NAME").focus();
			return;
		}
		//委托内容费率1(审价)
		var CNTRCT_RATE_1 = $("#CNTRCT_RATE_1").val();
		if(CNTRCT_RATE_1 != "") {
			if(!isReal2(CNTRCT_RATE_1)) {
				alert("委托内容费率1(审价)格式不正确！");
				$("#CNTRCT_RATE_1").focus();
				return;
			}
		}
		//委托内容费率2(咨询)
		var CNTRCT_RATE_2 = $("#CNTRCT_RATE_2").val();
		if(CNTRCT_RATE_2 != "") {
			if(!isReal2(CNTRCT_RATE_2)) {
				alert("委托内容费率2(咨询)格式不正确！");
				$("#CNTRCT_RATE_2").focus();
				return;
			}
		}
		//委托内容费率4(控制价编制)
		var CNTRCT_RATE_4 = $("#CNTRCT_RATE_4").val();
		if(CNTRCT_RATE_4 != "") {
			if(!isReal2(CNTRCT_RATE_4)) {
				alert("委托内容费率4(控制价编制)格式不正确！");
				$("#CNTRCT_RATE_4").focus();
				return;
			}
		}
		//委托内容费率5(全过程投资监理)
		var CNTRCT_RATE_5 = $("#CNTRCT_RATE_5").val();
		if(CNTRCT_RATE_5 != "") {
			if(!isReal2(CNTRCT_RATE_5)) {
				alert("委托内容费率5(全过程投资监理)格式不正确！");
				$("#CNTRCT_RATE_5").focus();
				return;
			}
		}
		//委托内容金额1(审价)
		var CNTRCT_AMOUNT_1 = $("#CNTRCT_AMOUNT_1").val();
		if(CNTRCT_AMOUNT_1 != "") {
			if(!isReal2(CNTRCT_AMOUNT_1)) {
				alert("委托内容金额1(审价)格式不正确！");
				$("#CNTRCT_AMOUNT_1").focus();
				return;
			}
		}
		//委托内容金额2(咨询)
		var CNTRCT_AMOUNT_2 = $("#CNTRCT_AMOUNT_2").val();
		if(CNTRCT_AMOUNT_2 != "") {
			if(!isReal2(CNTRCT_AMOUNT_2)) {
				alert("委托内容金额2(咨询)格式不正确！");
				$("#CNTRCT_AMOUNT_2").focus();
				return;
			}
		}
		//委托内容金额3(清单编制)
		var CNTRCT_AMOUNT_3 = $("#CNTRCT_AMOUNT_3").val();
		if(CNTRCT_AMOUNT_3 != "") {
			if(!isReal2(CNTRCT_AMOUNT_3)) {
				alert("委托内容金额3(清单编制)格式不正确！");
				$("#CNTRCT_AMOUNT_3").focus();
				return;
			}
		}
		//委托内容金额4(控制价编制)
		var CNTRCT_AMOUNT_4 = $("#CNTRCT_AMOUNT_4").val();
		if(CNTRCT_AMOUNT_4 != "") {
			if(!isReal2(CNTRCT_AMOUNT_4)) {
				alert("委托内容金额4(控制价编制)格式不正确！");
				$("#CNTRCT_AMOUNT_4").focus();
				return;
			}
		}
		//委托内容金额5(全过程投资监理)
		var CNTRCT_AMOUNT_5 = $("#CNTRCT_AMOUNT_5").val();
		if(CNTRCT_AMOUNT_5 != "") {
			if(!isReal2(CNTRCT_AMOUNT_5)) {
				alert("委托内容金额5(全过程投资监理)格式不正确！");
				$("#CNTRCT_AMOUNT_5").focus();
				return;
			}
		}
		//合同金额
		var CNTRCT_ALL_AMOUNT = $("#CNTRCT_ALL_AMOUNT").val();
		if(CNTRCT_ALL_AMOUNT != "") {
			if(!isReal2(CNTRCT_ALL_AMOUNT)) {
				alert("合同金额格式不正确！");
				$("#CNTRCT_ALL_AMOUNT").focus();
				return;
			}
		}
		//未收金额
		var CNTRCT_UNPAY_AMOUNT = $("#CNTRCT_UNPAY_AMOUNT").val();
		if(CNTRCT_UNPAY_AMOUNT != "") {
			if(!isReal2(CNTRCT_UNPAY_AMOUNT)) {
				alert("未收金额格式不正确！");
				$("#CNTRCT_UNPAY_AMOUNT").focus();
				return;
			}
		}
		//差旅合计
		var TRIP_TOTAL_AMOUNT = $("#TRIP_TOTAL_AMOUNT").val();
		if(TRIP_TOTAL_AMOUNT != "") {
			if(!isReal2(TRIP_TOTAL_AMOUNT)) {
				alert("差旅合计格式不正确！");
				$("#TRIP_TOTAL_AMOUNT").focus();
				return;
			}
		}
		//总概算
		var ESTIMATE_COST = $("#ESTIMATE_COST").val();
		if(ESTIMATE_COST != "") {
			if(!isReal2(ESTIMATE_COST)) {
				alert("总概算格式不正确！");
				$("#ESTIMATE_COST").focus();
				return;
			}
		}
		//建安概算（不含物流设备及信息）
		var ESTIMATE_CONSTRUCT_SAFE_COST = $("#ESTIMATE_CONSTRUCT_SAFE_COST").val();
		if(ESTIMATE_CONSTRUCT_SAFE_COST != "") {
			if(!isReal2(ESTIMATE_CONSTRUCT_SAFE_COST)) {
				alert("建安概算（不含物流设备及信息）格式不正确！");
				$("#ESTIMATE_CONSTRUCT_SAFE_COST").focus();
				return;
			}
		}
		//建安对应预备费
		var PRE_CONSTRUCT_SAFE_COST = $("#PRE_CONSTRUCT_SAFE_COST").val();
		if(PRE_CONSTRUCT_SAFE_COST != "") {
			if(!isReal2(PRE_CONSTRUCT_SAFE_COST)) {
				alert("建安对应预备费格式不正确！");
				$("#PRE_CONSTRUCT_SAFE_COST").focus();
				return;
			}
		}
		//总建筑面积
		var CONSTRUCT_AREA = $("#CONSTRUCT_AREA").val();
		if(CONSTRUCT_AREA != "") {
			if(!isReal2(CONSTRUCT_AREA)) {
				alert("总建筑面积格式不正确！");
				$("#CONSTRUCT_AREA").focus();
				return;
			}
		}
		//执行总费用
		var EXCUTE_AMOUNT = $("#EXCUTE_AMOUNT").val();
		if(EXCUTE_AMOUNT != "") {
			if(!isReal2(EXCUTE_AMOUNT)) {
				alert("执行总费用格式不正确！");
				$("#EXCUTE_AMOUNT").focus();
				return;
			}
		}
		//执行建安（万元）
		var CONSTRUCT_SAFE_COUNT = $("#CONSTRUCT_SAFE_COUNT").val();
		if(CONSTRUCT_SAFE_COUNT != "") {
			if(!numberCheck2(CONSTRUCT_SAFE_COUNT)) {
				alert("执行建安（万元）格式不正确！");
				$("#CONSTRUCT_SAFE_COUNT").focus();
				return;
			}
		}
		//合同价
		var CONSTRUCT_SAFE_CNTRCT_COST = $("#CONSTRUCT_SAFE_CNTRCT_COST").val();
		if(CONSTRUCT_SAFE_CNTRCT_COST != "") {
			if(!isReal2(CONSTRUCT_SAFE_CNTRCT_COST)) {
				alert("合同价格式不正确！");
				$("#CONSTRUCT_SAFE_CNTRCT_COST").focus();
				return;
			}
		}
		//已支付
		var CONSTRUCT_SAFE_CNTRCT_COST_PAID = $("#CONSTRUCT_SAFE_CNTRCT_COST_PAID").val();
		if(CONSTRUCT_SAFE_CNTRCT_COST_PAID != "") {
			if(!isReal2(CONSTRUCT_SAFE_CNTRCT_COST_PAID)) {
				alert("已支付格式不正确！");
				$("#CONSTRUCT_SAFE_CNTRCT_COST_PAID").focus();
				return;
			}
		}
		//控制价
		var CONSTRUCT_SAFE_CNTRCT_COST_CTRL = $("#CONSTRUCT_SAFE_CNTRCT_COST_CTRL").val();
		if(CONSTRUCT_SAFE_CNTRCT_COST_CTRL != "") {
			if(!isReal2(CONSTRUCT_SAFE_CNTRCT_COST_CTRL)) {
				alert("控制价格式不正确！");
				$("#CONSTRUCT_SAFE_CNTRCT_COST_CTRL").focus();
				return;
			}
		}
		//超概的风险度
		var BUDGETARY_OVERRUN_RISK = $("#BUDGETARY_OVERRUN_RISK").val();
		if(BUDGETARY_OVERRUN_RISK != "") {
			if(!numberCheck2(BUDGETARY_OVERRUN_RISK)) {
				alert("超概的风险度格式不正确！");
				$("#BUDGETARY_OVERRUN_RISK").focus();
				return;
			}
		}
		//月报
		var MONTHLY_REPORT_CNT = $("#MONTHLY_REPORT_CNT").val();
		if(MONTHLY_REPORT_CNT != "") {
			if(!numberCheck2(MONTHLY_REPORT_CNT)) {
				alert("月报格式不正确！");
				$("#MONTHLY_REPORT_CNT").focus();
				return;
			}
		}
		//建议书
		var SUGGEST_REPORT_CNT = $("#SUGGEST_REPORT_CNT").val();
		if(SUGGEST_REPORT_CNT != "") {
			if(!numberCheck2(SUGGEST_REPORT_CNT)) {
				alert("建议书格式不正确！");
				$("#SUGGEST_REPORT_CNT").focus();
				return;
			}
		}
		//联系函
		var COMM_REPORT_CNT = $("#COMM_REPORT_CNT").val();
		if(COMM_REPORT_CNT != "") {
			if(!numberCheck2(COMM_REPORT_CNT)) {
				alert("联系函格式不正确！");
				$("#COMM_REPORT_CNT").focus();
				return;
			}
		}
		//已完审价
		var FINISH_AUDIT_CNT = $("#FINISH_AUDIT_CNT").val();
		if(FINISH_AUDIT_CNT != "") {
			if(!numberCheck2(FINISH_AUDIT_CNT)) {
				alert("已完审价格式不正确！");
				$("#FINISH_AUDIT_CNT").focus();
				return;
			}
		}
		//工程例会
		var PROJ_PROGRESS_MEET_CNT = $("#PROJ_PROGRESS_MEET_CNT").val();
		if(PROJ_PROGRESS_MEET_CNT != "") {
			if(!numberCheck2(PROJ_PROGRESS_MEET_CNT)) {
				alert("工程例会格式不正确！");
				$("#PROJ_PROGRESS_MEET_CNT").focus();
				return;
			}
		}
		
		if(confirm("确定追加吗？")) {
			document.mainform.action = '<c:url value="/auditcntrct/addAuditCntrctAction.action"></c:url>';
			document.mainform.submit();
		}
	}
	
	function setAuditValue() {
		//委托内容
 		var cntrctInfo = "";
 		var item = "";
		for (var i=0; i<5; i++){
			item = document.getElementById("CNTRCT_INFO_" + i);
			if(item.checked){
				cntrctInfo = cntrctInfo + "1";
			} else {
				cntrctInfo = cntrctInfo + "0";
			}
		}
		$("#CNTRCT_INFO").prop("value", cntrctInfo);
		
		//委托公司
		$("#AUDIT_COMP_NO").attr("value", $("#agentNo").val());
		$("#AUDIT_COMP_NAME").attr("value", $("#agentCoName").val());
		$("#CO_MANAGER1").attr("value", $("#agentCoManager").val());
		$("#CO_MANAGER_TEL1").attr("value", $("#agentCoManagerTel").val());
		$("#CO_ADDRESS1").attr("value", $("#agentCoPostAddress").val());
		$("#CO_MANAGER_ADDRESS1").attr("value", $("#agentInfo").val());
		
		//各类日期
		$("#CNTRCT_ST_DATE").prop("value", $("#cntrctStDate").val());
		$("#CNTRCT_ED_DATE").prop("value", $("#cntrctEdDate").val());
		$("#CONSTRUCT_ST_DATE").prop("value", $("#constructStDate").val());
		$("#PLAN_CONSTRUCT_ED_DATE").prop("value", $("#planConstructEdDate").val());
		
		setDefaultValue("CNTRCT_RATE_1");
		setDefaultValue("CNTRCT_RATE_2");
		//setDefaultValue("CNTRCT_RATE_3");
		setDefaultValue("CNTRCT_RATE_4");
		setDefaultValue("CNTRCT_RATE_5");
		setDefaultValue("CNTRCT_RATE_6");
		setDefaultValue("CNTRCT_RATE_7");
		setDefaultValue("CNTRCT_RATE_8");
		setDefaultValue("CNTRCT_RATE_9");
		setDefaultValue("CNTRCT_RATE_10");
		setDefaultValue("CNTRCT_AMOUNT_1");
		setDefaultValue("CNTRCT_AMOUNT_2");
		setDefaultValue("CNTRCT_AMOUNT_3");
		setDefaultValue("CNTRCT_AMOUNT_4");
		setDefaultValue("CNTRCT_AMOUNT_5");
		setDefaultValue("CNTRCT_AMOUNT_6");
		setDefaultValue("CNTRCT_AMOUNT_7");
		setDefaultValue("CNTRCT_AMOUNT_8");
		setDefaultValue("CNTRCT_AMOUNT_9");
		setDefaultValue("CNTRCT_AMOUNT_10");
		setDefaultValue("CNTRCT_TOTAL_AMOUNT");
		setDefaultValue("CNTRCT_ALL_AMOUNT");
		setDefaultValue("CNTRCT_UNPAY_AMOUNT");
		setDefaultValue("TRIP_TOTAL_AMOUNT");
		setDefaultValue("ESTIMATE_COST");
		setDefaultValue("ESTIMATE_CONSTRUCT_SAFE_COST");
		setDefaultValue("PRE_CONSTRUCT_SAFE_COST");
		setDefaultValue("CONSTRUCT_AREA");
		setDefaultValue("EXCUTE_AMOUNT");
		setDefaultValue("CONSTRUCT_SAFE_CNTRCT_COST");
		setDefaultValue("CONSTRUCT_SAFE_CNTRCT_COST_PAID");
		setDefaultValue("CONSTRUCT_SAFE_CNTRCT_COST_CTRL");
		//setDefaultValue("RESERVE7");
		//setDefaultValue("RESERVE8");
		setDefaultValue("CONSTRUCT_SAFE_COUNT");
		setDefaultValue("BUDGETARY_OVERRUN_RISK");
		setDefaultValue("MONTHLY_REPORT_CNT");
		setDefaultValue("SUGGEST_REPORT_CNT");
		setDefaultValue("COMM_REPORT_CNT");
		setDefaultValue("FINISH_AUDIT_CNT");
		setDefaultValue("PROJ_PROGRESS_MEET_CNT");

	}
	
	//对数字类型的，为空时设为0
	function setDefaultValue(id) {
		if($("#" + id).val() == "") {
			$("#" + id).prop("value", "0");
		}
	}
	
	function show() {
		var cntrctType = $("#CNTRCT_TYPE").val();
 		var cntrctInfo4 = document.getElementById("CNTRCT_INFO_4");
		if(cntrctType == 2 && cntrctInfo4.checked){
			document.getElementById('nometro').style.display='block';
		} else {
			cleardata();
			document.getElementById('nometro').style.display='none';
		}
	}

	function cleardata() {
		document.getElementById("CNTRCT_ALL_AMOUNT").value = "";
		document.getElementById("CNTRCT_UNPAY_AMOUNT").value = "";
		document.getElementById("TRIP_TOTAL_AMOUNT").value = "";
		document.getElementById("ESTIMATE_COST").value = "";
		document.getElementById("ESTIMATE_CONSTRUCT_SAFE_COST").value = "";
		document.getElementById("PRE_CONSTRUCT_SAFE_COST").value = "";
		document.getElementById("constructStDate").value = "";
		document.getElementById("planConstructEdDate").value = "";
		document.getElementById("CONSTRUCT_AREA").value = "";
		document.getElementById("EXCUTE_AMOUNT").value = "";
		document.getElementById("CONSTRUCT_SAFE_COUNT").value = "";
		document.getElementById("CONSTRUCT_SAFE_CNTRCT_COST").value = "";
		document.getElementById("CONSTRUCT_SAFE_CNTRCT_COST_PAID").value = "";
		document.getElementById("CONSTRUCT_SAFE_CNTRCT_COST_CTRL").value = "";
		document.getElementById("BUDGETARY_OVERRUN_RISK").value = "";
		document.getElementById("MONTHLY_REPORT_CNT").value = "";
		document.getElementById("SUGGEST_REPORT_CNT").value = "";
		document.getElementById("COMM_REPORT_CNT").value = "";
		document.getElementById("FINISH_AUDIT_CNT").value = "";
		document.getElementById("PROJ_PROGRESS_MEET_CNT").value = "";
		document.getElementById("PROGRESS_STATUS").value = "";
	}
	
	//委托公司
	function selectAgentComp() {
		var url = '<c:url value="/agentcomp/showAgentCompAuditAction.action"></c:url>';
		url += "?agentAddFlag=1&date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function goAuditCntrctList() {
		window.location.href = '<c:url value="/auditcntrct/queryAuditCntrctList.action"></c:url>';
	}
	
	function showByUserRank(){
		var userRank="<%=session.getAttribute("user_rank")%>";
		if(userRank == "A"){
			disableB();
			disableC();
		} else if(userRank == "B"){
			disableC();
		}
	}
	
	function disableB(){
		$('#ESTIMATE_COST').attr('disabled',"true");
		$('#ESTIMATE_CONSTRUCT_SAFE_COST').attr('disabled',"true");
		$('#PRE_CONSTRUCT_SAFE_COST').attr('disabled',"true");
		$('#constructStDate').attr('disabled',"disabled");
		$('#planConstructEdDate').attr('disabled',"disabled");
		$('#CONSTRUCT_AREA').attr('disabled',"true");
		$('#EXCUTE_AMOUNT').attr('disabled',"true");
		$('#CONSTRUCT_SAFE_COUNT').attr('disabled',"true");
		$('#CONSTRUCT_SAFE_CNTRCT_COST').attr('disabled',"true");
		$('#CONSTRUCT_SAFE_CNTRCT_COST_PAID').attr('disabled',"true");
		$('#CONSTRUCT_SAFE_CNTRCT_COST_CTRL').attr('disabled',"true");
		$('#BUDGETARY_OVERRUN_RISK').attr('disabled',"true");
		$('#MONTHLY_REPORT_CNT').attr('disabled',"true");
		$('#SUGGEST_REPORT_CNT').attr('disabled',"true");
		$('#COMM_REPORT_CNT').attr('disabled',"true");
		$('#FINISH_AUDIT_CNT').attr('disabled',"true");
		$('#PROJ_PROGRESS_MEET_CNT').attr('disabled',"true");
		$('#PROGRESS_STATUS').attr('disabled',"true");
	}
	
	function disableC(){
		$('#CNTRCT_BELONG').attr('disabled',"true");
		$('#CNTRCT_NO').attr('disabled',"true");
		$('#CNTRCT_NAME').attr('disabled',"true");
		$('#CNTRCT_NM').attr('disabled',"true");
		$('#CNTRCT_TYPE').attr('disabled',"true");
		$('#agentCoName').attr('disabled',"true");
		$('#agentInfo').attr('disabled',"true");
		$('#agentButton').attr('disabled',"true");
		$('#CNTRCT_INFO_0').attr('disabled',"disabled");
		$('#CNTRCT_INFO_1').attr('disabled',"disabled");
		$('#CNTRCT_INFO_2').attr('disabled',"disabled");
		$('#CNTRCT_INFO_3').attr('disabled',"disabled");
		$('#CNTRCT_INFO_4').attr('disabled',"disabled");
		$('#cntrctStDate').attr('disabled',"disabled");
		$('#cntrctEdDate').attr('disabled',"disabled");
		$('#CNTRCT_INFO').attr('disabled',"true");
		$('#CNTRCT_RATE_1').attr('disabled',"true");
		$('#CNTRCT_RATE_2').attr('disabled',"true");
		$('#CNTRCT_RATE_4').attr('disabled',"true");
		$('#CNTRCT_RATE_5').attr('disabled',"true");
		$('#CNTRCT_RATE_6').attr('disabled',"true");
		$('#CNTRCT_RATE_7').attr('disabled',"true");
		$('#CNTRCT_RATE_8').attr('disabled',"true");
		$('#CNTRCT_RATE_9').attr('disabled',"true");
		$('#CNTRCT_RATE_10').attr('disabled',"true");
		$('#CNTRCT_AMOUNT_1').attr('disabled',"true");
		$('#CNTRCT_AMOUNT_2').attr('disabled',"true");
		$('#CNTRCT_AMOUNT_3').attr('disabled',"true");
		$('#CNTRCT_AMOUNT_4').attr('disabled',"true");
		$('#CNTRCT_AMOUNT_5').attr('disabled',"true");
		$('#CNTRCT_AMOUNT_6').attr('disabled',"true");
		$('#CNTRCT_AMOUNT_7').attr('disabled',"true");
		$('#CNTRCT_AMOUNT_8').attr('disabled',"true");
		$('#CNTRCT_AMOUNT_9').attr('disabled',"true");
		$('#CNTRCT_AMOUNT_10').attr('disabled',"true");
		$('#CNTRCT_TOTAL_AMOUNT').attr('disabled',"true");
		$('#CNTRCT_ALL_AMOUNT').attr('disabled',"true");
		$('#CNTRCT_UNPAY_AMOUNT').attr('disabled',"true");
		$('#TRIP_TOTAL_AMOUNT').attr('disabled',"true");
		$('#PROJECT_SENIOR_MANAGER').attr('disabled',"true");
	}
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<div class="row">
		<s:if test="hasActionMessages()">
			<div class="row">
				<span style="color:red; text-align:center;"><s:actionmessage /></span>
			</div>
		</s:if>
			<div class="col-lg-12 right">
				<s:form id="mainform" name="mainform" method="POST">
					<s:hidden name="addAuditCntrctDto.CNTRCT_ST_DATE" id="CNTRCT_ST_DATE"/>
					<s:hidden name="addAuditCntrctDto.CNTRCT_ED_DATE" id="CNTRCT_ED_DATE"/>
					<s:hidden name="addAuditCntrctDto.CNTRCT_INFO" id="CNTRCT_INFO"/>
					<s:hidden name="addAuditCntrctDto.AUDIT_COMP_NO" id="AUDIT_COMP_NO"/>
					<s:hidden name="addAuditCntrctDto.AUDIT_COMP_NAME" id="AUDIT_COMP_NAME"/>
					<s:hidden name="addAuditCntrctDto.CO_MANAGER_ADDRESS1" id="CO_MANAGER_ADDRESS1"/>
					<s:hidden name="addAuditCntrctDto.CO_MANAGER1" id="CO_MANAGER1"/>
					<s:hidden name="addAuditCntrctDto.CO_MANAGER_TEL1" id="CO_MANAGER_TEL1"/>
					<s:hidden name="addAuditCntrctDto.CO_ADDRESS1" id="CO_ADDRESS1"/>
					<s:hidden name="addAuditCntrctDto.CONSTRUCT_ST_DATE" id="CONSTRUCT_ST_DATE"/>
					<s:hidden name="addAuditCntrctDto.PLAN_CONSTRUCT_ED_DATE" id="PLAN_CONSTRUCT_ED_DATE"/>
					<h3 class="title"><label for="" class="col-lg-2 form-label">合同新增</label></h3>
					<div class="row">
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-2 form-label">合同归属</label>
							<div class="col-lg-2">
								<select id="CNTRCT_BELONG" name="addAuditCntrctDto.CNTRCT_BELONG" class="form-control">
									<s:if test='addAuditCntrctDto.CNTRCT_BELONG == "1"'>
										<option value="">请选择</option>
										<option value="1" selected="selected">联合</option>
										<option value="2">XX</option>
									</s:if>
									<s:elseif test='addAuditCntrctDto.CNTRCT_BELONG == "2"'>
										<option value="">请选择</option>
										<option value="1">联合</option>
										<option value="2" selected="selected">XX</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="1">联合</option>
										<option value="2">XX</option>
									</s:else>
								</select>
							</div>
							<label for="" class="col-lg-1 form-label">合同编号</label>
							<div class="col-lg-2">
								<s:textfield name="addAuditCntrctDto.CNTRCT_NO" id="CNTRCT_NO" cssClass="form-control" maxlength="20" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label">合同性质</label>
							<div class="col-lg-2">
								<select id="CNTRCT_TYPE" name="addAuditCntrctDto.CNTRCT_TYPE" class="form-control" onclick="show();">
									<s:if test='addAuditCntrctDto.CNTRCT_TYPE == "1"'>
										<option value="">请选择</option>
										<option value="1" selected="selected">地铁</option>
										<option value="2">非地铁</option>
									</s:if>
									<s:elseif test='addAuditCntrctDto.CNTRCT_TYPE == "2"'>
										<option value="">请选择</option>
										<option value="1">地铁</option>
										<option value="2" selected="selected">非地铁</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="1">地铁</option>
										<option value="2">非地铁</option>
									</s:else>
								</select>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-2 form-label">合同名称</label>
							<div class="col-lg-5">
								<s:textfield name="addAuditCntrctDto.CNTRCT_NAME" id="CNTRCT_NAME" cssClass="form-control" maxlength="1000" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label">负责工程师</label>
							<div class="col-lg-2">
								<select name="addAuditCntrctDto.PROJECT_SENIOR_MANAGER" id="PROJECT_SENIOR_MANAGER" class="form-control">
									<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
										<option value="<s:property value="LOGIN_NAME"/>" <s:if test="%{addAuditCntrctDto.PROJECT_SENIOR_MANAGER == LOGIN_NAME}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
									</s:iterator>
								</select>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-2 form-label">合同简称</label>
							<div class="col-lg-5">
								<s:textfield name="addAuditCntrctDto.CNTRCT_NM" id="CNTRCT_NM" cssClass="form-control" maxlength="100" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-2 form-label">委托单位</label>
							<div class="col-lg-4">
								<input type="hidden" id="agentNo" value=""/>
								<input type="hidden" id="agentCoManager" value=""/>
								<input type="hidden" id="agentCoManagerTel" value=""/>
								<input type="hidden" id="agentCoPostAddress" value=""/>
								<input type="hidden" id="agentCoMail" value=""/>
								<s:textfield id="agentCoName" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-1">
								<button id="agentButton" class="btn btn-success form-control" type="button" onclick="selectAgentComp();">检索</button>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-2 form-label">联系人及联系方式</label>
							<div class="col-lg-5">
								<s:textfield id="agentInfo" cssClass="form-control" maxlength="100" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-2 form-label">合同开始时间</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="cntrctStDate" value="<s:date format="yyyy-MM-dd" name="addAuditCntrctDto.CNTRCT_ST_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label">合同结束时间</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="cntrctEdDate" value="<s:date format="yyyy-MM-dd" name="addAuditCntrctDto.CNTRCT_ED_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						 	<div class="col-lg-4"></div>
						</div>
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-2 form-label">委托内容</label>
							<div class="col-lg-5">
								<s:if test='%{addAuditCntrctDto.CNTRCT_INFO.substring(0, 1) == "1"}'>
									<input id="CNTRCT_INFO_0" type="checkbox" checked="checked"/>
									<label class="form-label" for="">审价</label>　
								</s:if>
								<s:else>
									<input id="CNTRCT_INFO_0" type="checkbox"/>
									<label class="form-label" for="">审价</label>　
								</s:else>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-2"></div>
							<div class="col-lg-5">
								<s:if test='%{addAuditCntrctDto.CNTRCT_INFO.substring(1, 2) == "1"}'>
									<input id="CNTRCT_INFO_1" type="checkbox" checked="checked"/>
									<label class="form-label" for="">咨询</label>　
								</s:if>
								<s:else>
									<input id="CNTRCT_INFO_1" type="checkbox"/>
									<label class="form-label" for="">咨询</label>　
								</s:else>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-2"></div>
							<div class="col-lg-5">
								<s:if test='%{addAuditCntrctDto.CNTRCT_INFO.substring(2, 3) == "1"}'>
									<input id="CNTRCT_INFO_2" type="checkbox" checked="checked"/>
									<label class="form-label" for="">清单编制</label>　
								</s:if>
								<s:else>
									<input id="CNTRCT_INFO_2" type="checkbox"/>
									<label class="form-label" for="">清单编制</label>　
								</s:else>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-2"></div>
							<div class="col-lg-5">
								<s:if test='%{addAuditCntrctDto.CNTRCT_INFO.substring(3, 4) == "1"}'>
									<input id="CNTRCT_INFO_3" type="checkbox" checked="checked"/>
									<label class="form-label" for="">控制价编制</label>　
								</s:if>
								<s:else>
									<input id="CNTRCT_INFO_3" type="checkbox"/>
									<label class="form-label" for="">控制价编制</label>　
								</s:else>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-2"></div>
							<div class="col-lg-5">
								<s:if test='%{addAuditCntrctDto.CNTRCT_INFO.substring(4, 5) == "1"}'>
									<input id="CNTRCT_INFO_4" type="checkbox" checked="checked" onclick="show();"/>
									<label class="form-label" for="">全过程投资监理</label>　
								</s:if>
								<s:else>
									<input id="CNTRCT_INFO_4" type="checkbox" onclick="show();"/>
									<label class="form-label" for="">全过程投资监理</label>　
								</s:else>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-2 form-label">委托方收费</label>
							<label for="" class="col-lg-1 form-label">审价：</label>
							<label for="" class="col-lg-1 form-label">送审价*费率</label>
							<div class="col-lg-2">
								<s:textfield name="addAuditCntrctDto.CNTRCT_RATE_1" id="CNTRCT_RATE_1" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-1">
								<label for="" class="form-label">%</label>
							</div>
							<div class="col-lg-1">
								<label for="" class="form-label">=</label>
							</div>
							<div class="col-lg-2">
								<s:textfield name="addAuditCntrctDto.CNTRCT_AMOUNT_1" id="CNTRCT_AMOUNT_1" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-1">
								<label for="" class="form-label">金额(万元)</label>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-1"></div>
							<label for="" class="col-lg-2 form-label">咨询：</label>
							<label for="" class="col-lg-1 form-label">送审价*费率</label>
							<div class="col-lg-2">
								<s:textfield name="addAuditCntrctDto.CNTRCT_RATE_2" id="CNTRCT_RATE_2" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-1">
								<label for="" class="form-label">%</label>
							</div>
							<div class="col-lg-1">
								<label for="" class="form-label">=</label>
							</div>
							<div class="col-lg-2">
								<s:textfield name="addAuditCntrctDto.CNTRCT_AMOUNT_2" id="CNTRCT_AMOUNT_2" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-1">
								<label for="" class="form-label">金额(万元)</label>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-1"></div>
							<label for="" class="col-lg-2 form-label">清单编制：</label>
							<div class="col-lg-5"></div>
							<div class="col-lg-2">
								<s:textfield name="addAuditCntrctDto.CNTRCT_AMOUNT_3" id="CNTRCT_AMOUNT_3" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-1">
								<label for="" class="form-label">金额(万元)</label>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-1"></div>
							<label for="" class="col-lg-2 form-label">控制价编制：</label>
							<label for="" class="col-lg-1 form-label">限价金额*费率</label>
							<div class="col-lg-2">
								<s:textfield name="addAuditCntrctDto.CNTRCT_RATE_4" id="CNTRCT_RATE_4" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-1">
								<label for="" class="form-label">%</label>
							</div>
							<div class="col-lg-1">
								<label for="" class="form-label">=</label>
							</div>
							<div class="col-lg-2">
								<s:textfield name="addAuditCntrctDto.CNTRCT_AMOUNT_4" id="CNTRCT_AMOUNT_4" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-1">
								<label for="" class="form-label">金额(万元)</label>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-1"></div>
							<label for="" class="col-lg-2 form-label">全过程投资监理：</label>
							<label for="" class="col-lg-1 form-label">预算金额*费率</label>
							<div class="col-lg-2">
								<s:textfield name="addAuditCntrctDto.CNTRCT_RATE_5" id="CNTRCT_RATE_5" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-1">
								<label for="" class="form-label">%</label>
							</div>
							<div class="col-lg-1">
								<label for="" class="form-label">=</label>
							</div>
							<div class="col-lg-2">
								<s:textfield name="addAuditCntrctDto.CNTRCT_AMOUNT_5" id="CNTRCT_AMOUNT_5" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-1">
								<label for="" class="form-label">金额(万元)</label>
							</div>
						</div>
						<div id="nometro" style="display:none">
							<div class="col-lg-12 form-group" style="background-color: #ACD6FF;">
								<label for="" class="col-lg-2 form-label">合同金额</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.CNTRCT_ALL_AMOUNT" id="CNTRCT_ALL_AMOUNT" cssClass="col-lg-10 form-control" style="width:80%" maxlength="14" theme="simple"></s:textfield>
									<label for="" class="col-lg-2 form-label">万元</label>
								</div>
								<label for="" class="col-lg-2 form-label">未收金额</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.CNTRCT_UNPAY_AMOUNT" id="CNTRCT_UNPAY_AMOUNT" cssClass="col-lg-10 form-control" style="width:80%" maxlength="14" theme="simple"></s:textfield>
									<label for="" class="col-lg-2 form-label">万元</label>
								</div>
								<label for="" class="col-lg-2 form-label">差旅合计</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.TRIP_TOTAL_AMOUNT" id="TRIP_TOTAL_AMOUNT" cssClass="col-lg-10 form-control" style="width:80%" maxlength="14" theme="simple"></s:textfield>
									<label for="" class="col-lg-2 form-label">万元</label>
								</div>
							</div>
							<div class="col-lg-12 form-group" style="background-color: #FFF0AC;">
								<label for="" class="col-lg-2 form-label">总概算</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.ESTIMATE_COST" id="ESTIMATE_COST" cssClass="col-lg-10 form-control" style="width:80%" maxlength="14" theme="simple"></s:textfield>
									<label for="" class="col-lg-2 form-label">万元</label>
								</div>
								<label for="" class="col-lg-2 form-label">建安概算（不含物流设备及信息）</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.ESTIMATE_CONSTRUCT_SAFE_COST" id="ESTIMATE_CONSTRUCT_SAFE_COST" cssClass="col-lg-10 form-control" style="width:80%" maxlength="14" theme="simple"></s:textfield>
									<label for="" class="col-lg-2 form-label">万元</label>
								</div>
								<label for="" class="col-lg-2 form-label">建安对应预备费</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.PRE_CONSTRUCT_SAFE_COST" id="PRE_CONSTRUCT_SAFE_COST" cssClass="col-lg-10 form-control" style="width:80%" maxlength="14" theme="simple"></s:textfield>
									<label for="" class="col-lg-2 form-label">万元</label>
								</div>
							</div>
							<div class="col-lg-12 form-group" style="background-color: #FFF0AC;">
								<label for="" class="col-lg-2 form-label">开工时间</label>
								<div class="col-lg-2">
									<div class="input-group date" data-provide="datepicker">
										<input type="text" class="form-control datepicker" readonly id="constructStDate" value="<s:property value="addAuditCntrctDto.CONSTRUCT_ST_DATE"/>" maxlength="10" />
										<div class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</div>
									</div>
								</div>
								<label for="" class="col-lg-2 form-label">预计完工时间</label>
								<div class="col-lg-2">
									<div class="input-group date" data-provide="datepicker">
										<input type="text" class="form-control datepicker" readonly id="planConstructEdDate" value="<s:property value="addAuditCntrctDto.PLAN_CONSTRUCT_ED_DATE"/>" maxlength="10" />
										<div class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-12 form-group" style="background-color: #FFF0AC;">
								<label for="" class="col-lg-2 form-label">总建筑面积</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.CONSTRUCT_AREA" id="CONSTRUCT_AREA" cssClass="col-lg-10 form-control" style="width:80%" maxlength="14" theme="simple"></s:textfield>
									<label for="" class="col-lg-2 form-label">m2</label>
								</div>
								<label for="" class="col-lg-2 form-label">执行总费用</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.EXCUTE_AMOUNT" id="EXCUTE_AMOUNT" cssClass="col-lg-10 form-control" style="width:80%" maxlength="14" theme="simple"></s:textfield>
									<label for="" class="col-lg-2 form-label">万元</label>
								</div>
							</div>
							<div class="col-lg-12 form-group" style="background-color: #FFF0AC;">
								<label for="" class="col-lg-2 form-label">执行建安（万元）合同（个）</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.CONSTRUCT_SAFE_COUNT" id="CONSTRUCT_SAFE_COUNT" cssClass="form-control" style="width:80%" maxlength="8" theme="simple"></s:textfield>
								</div>
								<label for="" class="col-lg-2 form-label">执行建安（万元）合同价</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.CONSTRUCT_SAFE_CNTRCT_COST" id="CONSTRUCT_SAFE_CNTRCT_COST" cssClass="form-control" style="width:80%" maxlength="14" theme="simple"></s:textfield>
								</div>
							</div>
							<div class="col-lg-12 form-group" style="background-color: #FFF0AC;">
								<label for="" class="col-lg-2 form-label">执行建安（万元）已支付</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.CONSTRUCT_SAFE_CNTRCT_COST_PAID" id="CONSTRUCT_SAFE_CNTRCT_COST_PAID" cssClass="form-control" style="width:80%" maxlength="14" theme="simple"></s:textfield>
								</div>
								<label for="" class="col-lg-2 form-label">执行建安（万元）控制价</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.CONSTRUCT_SAFE_CNTRCT_COST_CTRL" id="CONSTRUCT_SAFE_CNTRCT_COST_CTRL" cssClass="form-control" style="width:80%" maxlength="14" theme="simple"></s:textfield>
								</div>
							</div>
							<div class="col-lg-12 form-group" style="background-color: #FFF0AC;">
								<label for="" class="col-lg-2 form-label">超概的风险度</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.BUDGETARY_OVERRUN_RISK" id="BUDGETARY_OVERRUN_RISK" cssClass="form-control" style="width:80%" maxlength="5" theme="simple"></s:textfield>
								</div>
							</div>
							<div class="col-lg-12 form-group" style="background-color: #FFF0AC;">
								<label for="" class="col-lg-2 form-label">月报（累计）</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.MONTHLY_REPORT_CNT" id="MONTHLY_REPORT_CNT" cssClass="col-lg-10 form-control" style="width:80%" maxlength="8" theme="simple"></s:textfield>
									<label for="" class="col-lg-2 form-label">个</label>
								</div>
								<label for="" class="col-lg-2 form-label">建议书（累计）</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.SUGGEST_REPORT_CNT" id="SUGGEST_REPORT_CNT" cssClass="col-lg-10 form-control" style="width:80%" maxlength="8" theme="simple"></s:textfield>
									<label for="" class="col-lg-2 form-label">个</label>
								</div>
							</div>
							<div class="col-lg-12 form-group" style="background-color: #FFF0AC;">
								<label for="" class="col-lg-2 form-label">联系函（累计）</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.COMM_REPORT_CNT" id="COMM_REPORT_CNT" cssClass="col-lg-10 form-control" style="width:80%" maxlength="8" theme="simple"></s:textfield>
									<label for="" class="col-lg-2 form-label">个</label>
								</div>
								<label for="" class="col-lg-2 form-label">已完审价（累计）</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.FINISH_AUDIT_CNT" id="FINISH_AUDIT_CNT" cssClass="col-lg-10 form-control" style="width:80%" maxlength="8" theme="simple"></s:textfield>
									<label for="" class="col-lg-2 form-label">个</label>
								</div>
							</div>
							<div class="col-lg-12 form-group" style="background-color: #FFF0AC;">
								<label for="" class="col-lg-2 form-label">工程例会</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.PROJ_PROGRESS_MEET_CNT" id="PROJ_PROGRESS_MEET_CNT" cssClass="col-lg-10 form-control" style="width:80%" maxlength="8" theme="simple"></s:textfield>
									<label for="" class="col-lg-2 form-label">次</label>
								</div>
								<label for="" class="col-lg-2 form-label">大致进度及工作计划</label>
								<div class="col-lg-2">
									<s:textfield name="addAuditCntrctDto.PROGRESS_STATUS" id="PROGRESS_STATUS" cssClass="col-lg-10 form-control" style="width:80%" maxlength="2" theme="simple"></s:textfield>
								</div>
							</div>
						</div>
						<div class="col-lg-12 form-group">
						 	<div class="col-lg-9"></div>
							<div class="col-lg-1">
								<button class="btn btn-success form-control" type="button" onclick="goAuditCntrctList();">取消</button>
							</div>
							<div class="col-lg-1">
								<button class="btn btn-success form-control" type="button" onclick="add();">保存</button>
							</div>
						</div>
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
	showByUserRank();
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
