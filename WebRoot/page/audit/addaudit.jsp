<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Calendar3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<title>审价信息输入</title>
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

	function checkRESERVE4(obj) {
		if(obj.checked) {
			$("#reserve4").attr("value", "1");
		} else {
			$("#reserve4").attr("value", "");
		}
	}

	function add() {
		setAuditValue();
		var PROJECT_TYPE = $("#PROJECT_TYPE").val();
		var REPORT_NO = $("#REPORT_NO").val();
		var PROJECT_STATUS = $("#PROJECT_STATUS").val();
		var PROJECT_NAME = $("#PROJECT_NAME").val();
		var PROJECT_MANAGER = $("#PROJECT_MANAGER").val();
		var CONTRACT_NO = $("#CONTRACT_NO").val();
		//项目分类
		var RESERVE1 = $("#RESERVE1").val();
		
		//审定单发出日期
		var VERIFY_DOC_SEND_DATE = $("#VERIFY_DOC_SEND_DATE").val();
		
		//送审金额
		var VERIFY_PER_AMOUNT = $("#VERIFY_PER_AMOUNT").val();
		//审定金额
		var VERIFY_AMOUNT = $("#VERIFY_AMOUNT").val();
		//净核减
		var VERIFY_DIFF = $("#VERIFY_DIFF").val();
		//核增
		var VERIFY_INCREASE = $("#VERIFY_INCREASE").val();
		//核减
		var VERIFY_DECREASE = $("#VERIFY_DECREASE").val();
		//增减理由
		var VERIFY_DIFF_REASON = $("#VERIFY_DIFF_REASON").val();
		
		//发票开票金额甲方
		var RECEIPT1_AMOUNT_A = $("#RECEIPT1_AMOUNT_A").val();
		//发票开票金额乙方
		var RECEIPT1_AMOUNT_B = $("#RECEIPT1_AMOUNT_B").val();
		
		//开票日期
		var RECEIPT1_DATE = $("#RECEIPT1_DATE").val();
		//发票号码
		var RECEIPT1_NO = $("#RECEIPT1_NO").val();
		
		//到账日期
		var VALUE_DATE = $("#VALUE_DATE").val();
		//补充
		var RESERVE3 = $("#RESERVE3").val();

		//归档
		var RESERVE4 = $("#RESERVE4").val();
		
		if(PROJECT_TYPE == "") {
			alert("请选择项目性质！");
			$("#PROJECT_TYPE").focus();
			return;
		}
		if(REPORT_NO == "") {
			alert("报告文号不能为空！");
			$("#REPORT_NO").focus();
			return;
		}
		if(PROJECT_STATUS == "") {
			alert("请选择项目进度！");
			$("#PROJECT_STATUS").focus();
			return;
		}
		if(PROJECT_NAME == "") {
			alert("项目名称不能为空！");
			$("#PROJECT_NAME").focus();
			return;
		}
		if(PROJECT_MANAGER == "") {
			alert("担当者不能为空！");
			$("#PROJECT_MANAGER").focus();
			return;
		}
		if(PROJECT_MANAGER.length > 6) {
			alert("担当者不能超过6个字！");
			$("#PROJECT_MANAGER").focus();
			return;
		}
		if(CONTRACT_NO == "") {
			alert("合同编号不能为空！");
			$("#CONTRACT_NO").focus();
			return;
		}
		if(RESERVE1 == "") {
			alert("项目分类不能为空！");
			$("#RESERVE1").focus();
			return;
		}
		
		//名字长度验证
		//委托公司负责人
		var agentCoManager = $("#agentCoManager").val();
		if(agentCoManager.length > 6) {
			alert("委托公司负责人不能超过6个字！");
			$("#agentCoManager").focus();
			return;
		}
		//委托公司项目负责人
		var AGENT_CO_STAFF = $("#AGENT_CO_STAFF").val();
		if(AGENT_CO_STAFF.length > 6) {
			alert("委托公司项目负责人不能超过6个字！");
			$("#AGENT_CO_STAFF").focus();
			return;
		}
		//专业公司负责人
		var profCoManager = $("#profCoManager").val();
		if(profCoManager.length > 6) {
			alert("专业公司负责人不能超过6个字！");
			$("#profCoManager").focus();
			return;
		}
		//专业公司项目负责人
		var PROF_CO_STAFF = $("#PROF_CO_STAFF").val();
		if(PROF_CO_STAFF.length > 6) {
			alert("专业公司项目负责人不能超过6个字！");
			$("#PROF_CO_STAFF").focus();
			return;
		}
		//承包公司负责人
		var contractCoManager = $("#contractCoManager").val();
		if(contractCoManager.length > 6) {
			alert("承包公司负责人不能超过6个字！");
			$("#contractCoManager").focus();
			return;
		}
		//承包公司项目负责人
		var CONTRACT_CO_STAFF = $("#CONTRACT_CO_STAFF").val();
		if(CONTRACT_CO_STAFF.length > 6) {
			alert("承包公司项目负责人不能超过6个字！");
			$("#CONTRACT_CO_STAFF").focus();
			return;
		}
		//开票人
		var RECEIPT1_STAFF = $("#RECEIPT1_STAFF").val();
		if(RECEIPT1_STAFF.length > 6) {
			alert("开票人不能超过6个字！");
			$("#RECEIPT1_STAFF").focus();
			return;
		}
		//接受人
		var RECEIPT2_RECEIVER = $("#RECEIPT2_RECEIVER").val();
		if(RECEIPT2_RECEIVER.length > 6) {
			alert("接受人不能超过6个字！");
			$("#RECEIPT2_RECEIVER").focus();
			return;
		}
		
		//审定单发出日期
		if(VERIFY_DOC_SEND_DATE == "") {
			//审定单发出日期为空时，部分数据不可以输入
			if(RECEIPT1_AMOUNT_A != "" && RECEIPT1_AMOUNT_A != "0") {
				alert("审定单发出日期为空，开票金额（甲方）不能输入！");
				$("#RECEIPT1_AMOUNT_A").focus();
				return;
			}
			if(RECEIPT1_AMOUNT_B != "" && RECEIPT1_AMOUNT_B != "0") {
				alert("审定单发出日期为空，开票金额（乙方）不能输入！");
				$("#RECEIPT1_AMOUNT_B").focus();
				return;
			}
			if(RECEIPT1_DATE != "") {
				alert("审定单发出日期为空，开票日期不能输入！");
				$("#receipt1DateBtn").focus();
				return;
			}
			if(RECEIPT1_STAFF != "") {
				alert("审定单发出日期为空，开票人不能输入！");
				$("#RECEIPT1_STAFF").focus();
				return;
			}
			if(RECEIPT1_NO != "") {
				alert("审定单发出日期为空，发票号码不能输入！");
				$("#RECEIPT1_NO").focus();
				return;
			}
		}
		
		if(VERIFY_PER_AMOUNT != "") {
			if(!isReal(VERIFY_PER_AMOUNT)) {
				alert("送审金额格式不正确！");
				$("#VERIFY_PER_AMOUNT").focus();
				return;
			}
		}
		if(VERIFY_AMOUNT != "") {
			if(!isReal(VERIFY_AMOUNT)) {
				alert("审定金额格式不正确！");
				$("#VERIFY_AMOUNT").focus();
				return;
			}
			//==========
			/*  as user Zhou Yun wish to remove below check. Pei 20160706
			if(parseFloat(VERIFY_AMOUNT) > parseFloat(VERIFY_PER_AMOUNT)) {
				alert("审定金额不能大于送审金额！");
				$("#VERIFY_AMOUNT").focus();
				return;
			}
			*/
		}
		if(VERIFY_INCREASE != "") {
			if(!numberCheck2(VERIFY_INCREASE)) {
				alert("核增格式不正确！");
				$("#VERIFY_INCREASE").focus();
				return;
			}
		}
		if(VERIFY_DIFF_REASON.length > 200) {
			alert("增减理由不能超过200个字！");
			$("#tVerifyDiffReason").focus();
			return;
		}
		
		//开票金额
		if(RECEIPT1_AMOUNT_A != "") {
			if(!numberCheck(RECEIPT1_AMOUNT_A)) {
				alert("开票金额（甲方）格式不正确！");
				$("#RECEIPT1_AMOUNT_A").focus();
				return;
			}
		}
		if(RECEIPT1_AMOUNT_B != "") {
			if(!numberCheck(RECEIPT1_AMOUNT_B)) {
				alert("开票金额（乙方）格式不正确！");
				$("#RECEIPT1_AMOUNT_B").focus();
				return;
			}
		}
		
		if(RECEIPT1_DATE == "") {
			if(VALUE_DATE != "") {
				alert("开票日期为空，到账日期不能输入！");
				$("#valueDateBtn").focus();
				return;
			}
		}
		if(RESERVE3.length > 200) {
			alert("补充不能超过200个字！");
			$("#reserve3").focus();
			return;
		}
		if(confirm("确定追加吗？")) {
			document.mainform.action = '<c:url value="/audit/addAuditAction.action"></c:url>';
			document.mainform.submit();
		}
	}
	
	function setAuditValue() {
		//委托公司
		$("#AGENT_NO").attr("value", $("#agentNo").val());
		$("#AGENT_CO_NAME").attr("value", $("#agentCoName").val());
		$("#AGENT_CO_MANAGER").attr("value", $("#agentCoManager").val());
		$("#AGENT_CO_MANAGER_TEL").attr("value", $("#agentCoManagerTel").val());
		$("#AGENT_CO_POST_ADDRESS").attr("value", $("#agentCoPostAddress").val());
		
		var agent_mail_pr = $("#agent_mail_pr").val();
		var agent_mail_suffix = $("#agent_mail_suffix").val();
		if(agent_mail_pr != "" || agent_mail_suffix != "") {
			$("#AGENT_CO_MAIL").attr("value", agent_mail_pr + "@" + agent_mail_suffix);
		} else {
			$("#AGENT_CO_MAIL").attr("value", "");
		}
		
		//专业公司
		$("#PROF_NO").attr("value", $("#profNo").val());
		$("#PROF_CO_NAME").attr("value", $("#profCoName").val());
		$("#PROF_CO_MANAGER").attr("value", $("#profCoManager").val());
		$("#PROF_CO_MANAGER_TEL").attr("value", $("#profCoManagerTel").val());
		$("#PROF_CO_POST_ADDRESS").attr("value", $("#profCoPostAddress").val());
		var prof_mail_pr = $("#prof_mail_pr").val();
		var prof_mail_suffix = $("#prof_mail_suffix").val();
		if(prof_mail_pr != "" || prof_mail_suffix != "") {
			$("#PROF_CO_MAIL").attr("value", prof_mail_pr + "@" + prof_mail_suffix);
		} else {
			$("#PROF_CO_MAIL").attr("value", "");
		}
		
		//承包公司
		$("#CONTRACT_CO_NO").attr("value", $("#contractCoNo").val());
		$("#CONTRACT_CO_NAME").attr("value", $("#contractCoName").val());
		$("#CONTRACT_CO_MANAGER").attr("value", $("#contractCoManager").val());
		$("#CONTRACT_CO_MANAGER_TEL").attr("value", $("#contractCoManagerTel").val());
		$("#CONTRACT_CO_POST_ADDRESS").attr("value", $("#contractCoPostAddress").val());
		$("#CONTRACT_CO_MAIL").attr("value", $("#contractCoMail").val());
		//各类日期
		$("#DOC_ARR_DATE").attr("value", $("#docArrDate").val());
		$("#DOC_MAIL_DATE").attr("value", $("#docMailDate").val());
		$("#VERIFY_DOC_SEND_DATE").attr("value", $("#verifyDocSendDate").val());
		$("#VERIFY_DOC_REPLY_DATE").attr("value", $("#verifyDocReplyDate").val());
		$("#LAST_REPORT_DATE").attr("value", $("#lastReportDate").val());
		$("#RECEIPT1_DATE").attr("value", $("#receipt1Date").val());
		$("#VALUE_DATE").attr("value", $("#valueDate").val());
		$("#RECEIPT2_DATE").attr("value", $("#receipt2Date").val());
		$("#RECEIPT2_POST_DATE").attr("value", $("#receipt2PostDate").val());
		//增减理由
		$("#VERIFY_DIFF_REASON").attr("value", $("#tVerifyDiffReason").val());
		//补充
		$("#RESERVE3").attr("value", $("#reserve3").val());
		//归档
		$("#RESERVE4").attr("value", $("#reserve4").val());
		//项目信息
 		var reserve2 = "";
 		var item = "";
		for (var i=0; i<17; i++){
			item = document.getElementById("reserve2_"+i);
			if(item.checked){
				reserve2 = reserve2 + "1";
			} else {
				reserve2 = reserve2 + "0";
			}
		}
		$("#RESERVE2").attr("value", reserve2);
		
		setDefaultValue("VERIFY_PER_AMOUNT");
		setDefaultValue("VERIFY_AMOUNT");
		setDefaultValue("VERIFY_DIFF");
		setDefaultValue("VERIFY_INCREASE");
		setDefaultValue("VERIFY_DECREASE");
		//开票金额
		setDefaultValue("RECEIPT1_AMOUNT_A");
		setDefaultValue("RECEIPT1_AMOUNT_B");
		
		//自动计算：净核减和核减
		calcVERIFY_DIFF();
		//计算开票金额
		calcRECEIPT1_AMOUNT_TOTAL();
	}
	
	//对数字类型的，为空时设为0
	function setDefaultValue(id) {
		if($("#" + id).val() == "") {
			$("#" + id).attr("value", "0");
		}
	}
	
	//承包公司
	function selectContractComp() {
		var url = '<c:url value="/bid/showAddBidAgentCompAction.action"></c:url>';
		url += "?agentAddFlag=3&date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	//专业公司
	function selectExpertComp() {
		var url = '<c:url value="/bid/showAddBidAgentCompAction.action"></c:url>';
		url += "?agentAddFlag=2&date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	//委托公司
	function selectAgentComp() {
		var url = '<c:url value="/bid/showAddBidAgentCompAction.action"></c:url>';
		url += "?agentAddFlag=1&date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	//计算发票开票金额合计=金额（甲方）+金额（乙方）
	function calcRECEIPT1_AMOUNT_TOTAL() {
		var tmp = 0;
		//发票开票金额甲方
		var RECEIPT1_AMOUNT_A = $("#RECEIPT1_AMOUNT_A").val();
		//发票开票金额乙方
		var RECEIPT1_AMOUNT_B = $("#RECEIPT1_AMOUNT_B").val();
		if(isInteger(RECEIPT1_AMOUNT_A)) {
			tmp += parseInt(RECEIPT1_AMOUNT_A);
		}
		if(isInteger(RECEIPT1_AMOUNT_B)) {
			tmp += parseInt(RECEIPT1_AMOUNT_B);
		}
		//发票开票金额合计=金额（甲方）+金额（乙方）
		$("#RECEIPT1_AMOUNT_TOTAL").attr("value", tmp);
		$("#receipt1AmountTotal").attr("value", tmp);
	}
	
	//计算净核减=送审金额 - 审定金额
	function calcVERIFY_DIFF() {
		var tmp = 0;
		//送审金额
		var VERIFY_PER_AMOUNT = $("#VERIFY_PER_AMOUNT").val();
		if(isReal2(VERIFY_PER_AMOUNT)) {
			tmp += parseFloat(VERIFY_PER_AMOUNT);
		}
		//审定金额
		var VERIFY_AMOUNT = $("#VERIFY_AMOUNT").val();
		if(isReal2(VERIFY_AMOUNT)) {
			tmp = tmp - parseFloat(VERIFY_AMOUNT);
		}
		tmp = tmp.toFixed(2);
		//净核减=送审金额 - 审定金额
		$("#VERIFY_DIFF").attr("value", tmp);
		$("#verifyDiff").attr("value", tmp);
		//计算核减
		calcVERIFY_DECREASE();
	}
	
	//计算核减=净核减  + 核增
	function calcVERIFY_DECREASE() {
		var tmp = 0;
		//净核减
		var VERIFY_DIFF = $("#VERIFY_DIFF").val();
		if(isReal2(VERIFY_DIFF)) {
			tmp += parseFloat(VERIFY_DIFF);
		}
		//核增
		var VERIFY_INCREASE = $("#VERIFY_INCREASE").val();
		if(isReal2(VERIFY_INCREASE)) {
			tmp += parseFloat(VERIFY_INCREASE);
		}
		tmp = tmp.toFixed(2);
		//核减=净核减  + 核增
		$("#VERIFY_DECREASE").attr("value", tmp);
		$("#verifyDecrease").attr("value", tmp);
	}
	
	function goAuditList() {
		window.location.href = '<c:url value="/audit/queryAuditList.action"></c:url>';
	}
</script>
</head>
<body>
	<div id="container">
		<div id="top">
			<div class="logobox">
				<div class="logo_tittle"></div>
				<div class="logo"></div>
			</div>
		</div>
		<div class="content">
			<jsp:include page="../info.jsp" flush="true" />
			<div class="tittle">
				<div class="icons"><a class="return" href="#" onclick="goAuditList();">返回</a><a class="quit" href="#" onclick="logout();">退出</a></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					<input type="hidden" id="agentCompEditFlag" value="0"/>
					审价信息输入
				</div>
				<div class="tittle_right">
				</div>
			</div>
			<s:form id="mainform" name="mainform" method="POST">
				
				<s:hidden name="addAuditDto.AGENT_NO" id="AGENT_NO"/>
				<s:hidden name="addAuditDto.AGENT_CO_NAME" id="AGENT_CO_NAME"/>
				<s:hidden name="addAuditDto.AGENT_CO_MANAGER" id="AGENT_CO_MANAGER"/>
				<s:hidden name="addAuditDto.AGENT_CO_MANAGER_TEL" id="AGENT_CO_MANAGER_TEL"/>
				<s:hidden name="addAuditDto.AGENT_CO_POST_ADDRESS" id="AGENT_CO_POST_ADDRESS"/>
				<s:hidden name="addAuditDto.AGENT_CO_MAIL" id="AGENT_CO_MAIL"/>
				
				<s:hidden name="addAuditDto.PROF_NO" id="PROF_NO"/>
				<s:hidden name="addAuditDto.PROF_CO_NAME" id="PROF_CO_NAME"/>
				<s:hidden name="addAuditDto.PROF_CO_MANAGER" id="PROF_CO_MANAGER"/>
				<s:hidden name="addAuditDto.PROF_CO_MANAGER_TEL" id="PROF_CO_MANAGER_TEL"/>
				<s:hidden name="addAuditDto.PROF_CO_POST_ADDRESS" id="PROF_CO_POST_ADDRESS"/>
				<s:hidden name="addAuditDto.PROF_CO_MAIL" id="PROF_CO_MAIL"/>
				
				<s:hidden name="addAuditDto.CONTRACT_CO_NO" id="CONTRACT_CO_NO"/>
				<s:hidden name="addAuditDto.CONTRACT_CO_NAME" id="CONTRACT_CO_NAME"/>
				<s:hidden name="addAuditDto.CONTRACT_CO_MANAGER" id="CONTRACT_CO_MANAGER"/>
				<s:hidden name="addAuditDto.CONTRACT_CO_MANAGER_TEL" id="CONTRACT_CO_MANAGER_TEL"/>
				<s:hidden name="addAuditDto.CONTRACT_CO_POST_ADDRESS" id="CONTRACT_CO_POST_ADDRESS"/>
				<s:hidden name="addAuditDto.CONTRACT_CO_MAIL" id="CONTRACT_CO_MAIL"/>
				
				<s:hidden name="addAuditDto.DOC_ARR_DATE" id="DOC_ARR_DATE"/>
				<s:hidden name="addAuditDto.DOC_MAIL_DATE" id="DOC_MAIL_DATE"/>
				<s:hidden name="addAuditDto.VERIFY_DOC_SEND_DATE" id="VERIFY_DOC_SEND_DATE"/>
				<s:hidden name="addAuditDto.VERIFY_DOC_REPLY_DATE" id="VERIFY_DOC_REPLY_DATE"/>
				<s:hidden name="addAuditDto.LAST_REPORT_DATE" id="LAST_REPORT_DATE"/>
				<s:hidden name="addAuditDto.RECEIPT1_DATE" id="RECEIPT1_DATE"/>
				<s:hidden name="addAuditDto.VALUE_DATE" id="VALUE_DATE"/>
				<s:hidden name="addAuditDto.RECEIPT2_DATE" id="RECEIPT2_DATE"/>
				<s:hidden name="addAuditDto.RECEIPT2_POST_DATE" id="RECEIPT2_POST_DATE"/>
				
				<s:hidden name="addAuditDto.VERIFY_DIFF_REASON" id="VERIFY_DIFF_REASON"/>
				
				<s:hidden name="addAuditDto.VERIFY_DIFF" id="VERIFY_DIFF"/>
				<s:hidden name="addAuditDto.VERIFY_DECREASE" id="VERIFY_DECREASE"/>
				<s:hidden name="addAuditDto.RECEIPT1_AMOUNT_TOTAL" id="RECEIPT1_AMOUNT_TOTAL"/>
				
				<s:hidden name="addAuditDto.RESERVE2" id="RESERVE2"/>
				<s:hidden name="addAuditDto.RESERVE3" id="RESERVE3"/>
				<s:hidden name="addAuditDto.RESERVE4" id="RESERVE4"/>
				
				<div class="searchbox update" style="height:0px;">
					<table width="100%" border="0" cellpadding="5" cellspacing="0">
						<tr>
							<td class="red" align="center" colspan="4"><s:actionmessage /></td>
						</tr>
						<tr>
							<td align="right">
								<label class="pdf10"><font color="red">*</font>审价编号</label>
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.AUDIT_NO" id="AUDIT_NO" disabled="true" cssStyle="width:300px;" maxlength="8" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">
								<label class="pdf10"><font color="red">*</font>项目性质</label>
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<select id="PROJECT_TYPE" name="addAuditDto.PROJECT_TYPE" style="width:300px;">
										<s:if test='addAuditDto.PROJECT_TYPE == "1"'>
											<option value="">请选择</option>
											<option value="1" selected="selected">土建</option>
											<option value="2">安装</option>
											<option value="3">房修</option>
											<option value="4">园林</option>
											<option value="5">咨询</option>
											<option value="6">限价</option>
											<option value="7">其他</option>
										</s:if>
										<s:elseif test='addAuditDto.PROJECT_TYPE == "2"'>
											<option value="">请选择</option>
											<option value="1">土建</option>
											<option value="2" selected="selected">安装</option>
											<option value="3">房修</option>
											<option value="4">园林</option>
											<option value="5">咨询</option>
											<option value="6">限价</option>
											<option value="7">其他</option>
										</s:elseif>
										<s:elseif test='addAuditDto.PROJECT_TYPE == "3"'>
											<option value="">请选择</option>
											<option value="1">土建</option>
											<option value="2">安装</option>
											<option value="3" selected="selected">房修</option>
											<option value="4">园林</option>
											<option value="5">咨询</option>
											<option value="6">限价</option>
											<option value="7">其他</option>
										</s:elseif>
										<s:elseif test='addAuditDto.PROJECT_TYPE == "4"'>
											<option value="">请选择</option>
											<option value="1">土建</option>
											<option value="2">安装</option>
											<option value="3">房修</option>
											<option value="4" selected="selected">园林</option>
											<option value="5">咨询</option>
											<option value="6">限价</option>
											<option value="7">其他</option>
										</s:elseif>
										<s:elseif test='addAuditDto.PROJECT_TYPE == "5"'>
											<option value="">请选择</option>
											<option value="1">土建</option>
											<option value="2">安装</option>
											<option value="3">房修</option>
											<option value="4">园林</option>
											<option value="5" selected="selected">咨询</option>
											<option value="6">限价</option>
											<option value="7">其他</option>
										</s:elseif>
										<s:elseif test='addAuditDto.PROJECT_TYPE == "6"'>
											<option value="">请选择</option>
											<option value="1">土建</option>
											<option value="2">安装</option>
											<option value="3">房修</option>
											<option value="4">园林</option>
											<option value="5">咨询</option>
											<option value="6" selected="selected">限价</option>
											<option value="7">其他</option>
										</s:elseif>
										<s:elseif test='addAuditDto.PROJECT_TYPE == "7"'>
											<option value="">请选择</option>
											<option value="1">土建</option>
											<option value="2">安装</option>
											<option value="3">房修</option>
											<option value="4">园林</option>
											<option value="5">咨询</option>
											<option value="6">限价</option>
											<option value="7" selected="selected">其他</option>
										</s:elseif>
										<s:else>
											<option value="" selected="selected">请选择</option>
											<option value="1">土建</option>
											<option value="2">安装</option>
											<option value="3">房修</option>
											<option value="4">园林</option>
											<option value="5">咨询</option>
											<option value="6">限价</option>
											<option value="7">其他</option>
										</s:else>
									</select>
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
						<tr>
							<td align="right">
								<label class="pdf10"><font color="red">*</font>报告文号</label>
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.REPORT_NO" id="REPORT_NO" cssStyle="width:300px;" maxlength="16" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">
								<label class="pdf10"><font color="red">*</font>项目进度</label>
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<select id="PROJECT_STATUS" name="addAuditDto.PROJECT_STATUS" style="width:300px;">
										<s:if test='addAuditDto.PROJECT_STATUS == "1"'>
											<option value="">请选择</option>
											<option value="1" selected="selected">在审</option>
											<option value="2">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6">快递</option>
											<option value="7">完成</option>
											<option value="8">终止</option>
											<option value="8">终止</option>
											<!-- <option value="9">归档</option> -->
										</s:if>
										<s:elseif test='addAuditDto.PROJECT_STATUS == "2"'>
											<option value="">请选择</option>
											<option value="1">在审</option>
											<option value="2" selected="selected">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6">快递</option>
											<option value="7">完成</option>
											<option value="8">终止</option>
											<!-- <option value="9">归档</option> -->
										</s:elseif>
										<s:elseif test='addAuditDto.PROJECT_STATUS == "3"'>
											<option value="">请选择</option>
											<option value="1">在审</option>
											<option value="2">补交资料</option>
											<option value="3" selected="selected">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6">快递</option>
											<option value="7">完成</option>
											<option value="8">终止</option>
											<!-- <option value="9">归档</option> -->
										</s:elseif>
										<s:elseif test='addAuditDto.PROJECT_STATUS == "4"'>
											<option value="">请选择</option>
											<option value="1">在审</option>
											<option value="2">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4" selected="selected">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6">快递</option>
											<option value="7">完成</option>
											<option value="8">终止</option>
											<!-- <option value="9">归档</option> -->
										</s:elseif>
										<s:elseif test='addAuditDto.PROJECT_STATUS == "5"'>
											<option value="">请选择</option>
											<option value="1">在审</option>
											<option value="2">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5" selected="selected">出报告</option>
											<option value="6">快递</option>
											<option value="7">完成</option>
											<option value="8">终止</option>
											<!-- <option value="9">归档</option> -->
										</s:elseif>
										<s:elseif test='addAuditDto.PROJECT_STATUS == "6"'>
											<option value="">请选择</option>
											<option value="1">在审</option>
											<option value="2">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6" selected="selected">快递</option>
											<option value="7">完成</option>
											<option value="8">终止</option>
											<!-- <option value="9">归档</option> -->
										</s:elseif>
										<s:elseif test='addAuditDto.PROJECT_STATUS == "7"'>
											<option value="">请选择</option>
											<option value="1">在审</option>
											<option value="2">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6">快递</option>
											<option value="7" selected="selected">完成</option>
											<option value="8">终止</option>
											<!-- <option value="9">归档</option> -->
										</s:elseif>
										<s:elseif test='addAuditDto.PROJECT_STATUS == "8"'>
											<option value="">请选择</option>
											<option value="1">在审</option>
											<option value="2">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6">快递</option>
											<option value="7">完成</option>
											<option value="8" selected="selected">终止</option>
											<!-- <option value="9">归档</option> -->
										</s:elseif>
										<!-- <s:elseif test='addAuditDto.PROJECT_STATUS == "9"'>
											<option value="">请选择</option>
											<option value="1">在审</option>
											<option value="2">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6">快递</option>
											<option value="7">完成</option>
											<option value="8">终止</option>
											<option value="9" selected="selected">归档</option>
										</s:elseif> -->
										<s:else>
											<option value="" selected="selected">请选择</option>
											<option value="1">在审</option>
											<option value="2">补交资料</option>
											<option value="3">初稿已出</option>
											<option value="4">审定单已出</option>
											<option value="5">出报告</option>
											<option value="6">快递</option>
											<option value="7">完成</option>
											<option value="8">终止</option>
											<!-- <option value="9">归档</option> -->
										</s:else>
									</select>
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
						<tr>
							<td align="right">
								<label class="pdf10"><font color="red">*</font>项目名称</label>
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.PROJECT_NAME" id="PROJECT_NAME" cssStyle="width:300px;" maxlength="40" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">
								<label class="pdf10"><font color="red">*</font>担当者</label>
							</td>
							<td>
<!--
 								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.PROJECT_MANAGER" id="PROJECT_MANAGER" cssStyle="width:300px;" maxlength="24" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
 -->
								<div class="box1_left"></div>
								<div class="box1_center">
									<select name="addAuditDto.PROJECT_MANAGER" id="PROJECT_MANAGER" style="width:300px;">
										<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
											<option value="<s:property value="LOGIN_NAME"/>" <s:if test="%{addAuditDto.PROJECT_MANAGER == LOGIN_NAME}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
										</s:iterator>
									</select>
								</div>
								<div class="box1_right"></div>
 							</td>
						</tr>
						<tr>
							<td align="right">
								<label class="pdf10"><font color="red">*</font>合同编号</label>
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.CONTRACT_NO" id="CONTRACT_NO" cssStyle="width:300px;" maxlength="16" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">
								<label class="pdf10"><font color="red">*</font>项目分类</label>
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<select id="RESERVE1" name="addAuditDto.RESERVE1" style="width: 150px;">
										<s:if test='addAuditDto.RESERVE1 == "a"'>
											<option value="">请选择</option>
											<option value="a" selected="selected">地铁审价项目</option>
											<option value="b">地铁投资监理项目</option>
											<option value="c">地铁限价项目</option>
											<option value="d">邮政审价项目</option>
											<option value="e">投资监理项目</option>
											<option value="f">投资监理审价项目</option>
											<option value="g">其他项目</option>
										</s:if>
										<s:elseif test='addAuditDto.RESERVE1 == "b"'>
											<option value="">请选择</option>
											<option value="a">地铁审价项目</option>
											<option value="b" selected="selected">地铁投资监理项目</option>
											<option value="c">地铁限价项目</option>
											<option value="d">邮政审价项目</option>
											<option value="e">投资监理项目</option>
											<option value="f">投资监理审价项目</option>
											<option value="g">其他项目</option>
										</s:elseif>
										<s:elseif test='addAuditDto.RESERVE1 == "c"'>
											<option value="">请选择</option>
											<option value="a">地铁审价项目</option>
											<option value="b">地铁投资监理项目</option>
											<option value="c" selected="selected">地铁限价项目</option>
											<option value="d">邮政审价项目</option>
											<option value="e">投资监理项目</option>
											<option value="f">投资监理审价项目</option>
											<option value="g">其他项目</option>
										</s:elseif>
										<s:elseif test='addAuditDto.RESERVE1 == "d"'>
											<option value="">请选择</option>
											<option value="a">地铁审价项目</option>
											<option value="b">地铁投资监理项目</option>
											<option value="c">地铁限价项目</option>
											<option value="d" selected="selected">邮政审价项目</option>
											<option value="e">投资监理项目</option>
											<option value="f">投资监理审价项目</option>
											<option value="g">其他项目</option>
										</s:elseif>
										<s:elseif test='addAuditDto.RESERVE1 == "e"'>
											<option value="">请选择</option>
											<option value="a">地铁审价项目</option>
											<option value="b">地铁投资监理项目</option>
											<option value="c">地铁限价项目</option>
											<option value="d">邮政审价项目</option>
											<option value="e" selected="selected">投资监理项目</option>
											<option value="f">投资监理审价项目</option>
											<option value="g">其他项目</option>
										</s:elseif>
										<s:elseif test='addAuditDto.RESERVE1 == "f"'>
											<option value="">请选择</option>
											<option value="a">地铁审价项目</option>
											<option value="b">地铁投资监理项目</option>
											<option value="c">地铁限价项目</option>
											<option value="d">邮政审价项目</option>
											<option value="e">投资监理项目</option>
											<option value="f" selected="selected">投资监理审价项目</option>
											<option value="g">其他项目</option>
										</s:elseif>
										<s:elseif test='addAuditDto.RESERVE1 == "g"'>
											<option value="">请选择</option>
											<option value="a">地铁审价项目</option>
											<option value="b">地铁投资监理项目</option>
											<option value="c">地铁限价项目</option>
											<option value="d">邮政审价项目</option>
											<option value="e">投资监理项目</option>
											<option value="f">投资监理审价项目</option>
											<option value="g" selected="selected">其他项目</option>
										</s:elseif>
										<s:else>
											<option value="" selected="selected">请选择</option>
											<option value="a">地铁审价项目</option>
											<option value="b">地铁投资监理项目</option>
											<option value="c">地铁限价项目</option>
											<option value="d">邮政审价项目</option>
											<option value="e">投资监理项目</option>
											<option value="f">投资监理审价项目</option>
											<option value="g">其他项目</option>
										</s:else>
									</select>
									</div>
								<div class="box1_right"></div>
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td align="right">归档</td>
							<td><input id="reserve4" type="checkbox" value="" onclick="checkRESERVE4(this);"/></td>
						</tr>
					</table>
				</div>
				<div class="companys">
					<table width="100%" border="0">
						<tr>
							<td width="33%">
								<table class="company_tab" width="100%" border="0">
									<tr>
										<td colspan="4" align="center" class="tittle"><strong>委托公司信息</strong></td>
									</tr>
									<tr>
										<td align="right">代码</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="agentNo" disabled="disabled" maxlength="4" style="width:100px;" value="<s:property value="addAuditDto.AGENT_NO" />" />
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
									</tr>
									<tr>
										<td align="right">名称</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="agentCoName" disabled="disabled" maxlength="40" style="width:180px;" value="<s:property value="addAuditDto.AGENT_CO_NAME" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">负责人</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="agentCoManager" maxlength="24" style="width:180px;" value="<s:property value="addAuditDto.AGENT_CO_MANAGER" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">负责人电话</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="agentCoManagerTel" maxlength="30" style="width:180px;" value="<s:property value="addAuditDto.AGENT_CO_MANAGER_TEL" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">项目负责人</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<s:textfield name="addAuditDto.AGENT_CO_STAFF" id="AGENT_CO_STAFF" cssStyle="width:180px;" maxlength="24" theme="simple"></s:textfield>
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">项目负责人电话</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<s:textfield name="addAuditDto.AGENT_CO_STAFF_TEL" id="AGENT_CO_STAFF_TEL" cssStyle="width:180px;" maxlength="30" theme="simple"></s:textfield>
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">快递地址</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="agentCoPostAddress" maxlength="40" style="width:180px;" value="<s:property value="addAuditDto.AGENT_CO_POST_ADDRESS" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr style="display: none;">
										<td align="right">邮箱</td>
										<td>
											<div class="box1">
												<div class="box1_left"></div>
												<div class="box1_center">
													<s:textfield name="addAuditDto.agent_mail_pr" id="agent_mail_pr" cssStyle="width:116px;" maxlength="29" theme="simple"></s:textfield>
												</div>
												<div class="box1_right"></div>
												<label>@</label>
												<div class="box1_left"></div>
												<div class="box1_center">
													<s:textfield name="addAuditDto.agent_mail_suffix" id="agent_mail_suffix" cssStyle="width:116px;" maxlength="30" theme="simple"></s:textfield>
												</div>
												<div class="box1_right"></div>
											</div>
										</td>
									</tr>
								</table>
							</td>
							<td width="33%">
								<table class="company_tab" width="100%" border="0">
									<tr>
										<td colspan="4" align="center" class="tittle"><strong>专业公司信息</strong></td>
									</tr>
									<tr>
										<td align="right">代码</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="profNo" disabled="disabled" maxlength="4" style="width:100px;" value="<s:property value="addAuditDto.PROF_NO" />" />
											</div>
											<div class="box1_right"></div>
											<div class="btn">
												<div class="box1_left"></div>
												<div class="box1_center">
													<input id="agentCompBtn" class="input40" type="button" value="检索" onclick="selectExpertComp()" />
												</div>
												<div class="box1_right"></div>
											</div>
										</td>
									</tr>
									<tr>
										<td align="right">名称</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="profCoName" disabled="disabled" maxlength="40" style="width:180px;" value="<s:property value="addAuditDto.PROF_CO_NAME" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">负责人</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="profCoManager" maxlength="24" style="width:180px;" value="<s:property value="addAuditDto.PROF_CO_MANAGER" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">负责人电话</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="profCoManagerTel" maxlength="30" style="width:180px;" value="<s:property value="addAuditDto.PROF_CO_MANAGER_TEL" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">项目负责人</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<s:textfield name="addAuditDto.PROF_CO_STAFF" id="PROF_CO_STAFF" cssStyle="width:180px;" maxlength="24" theme="simple"></s:textfield>
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">项目负责人电话</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<s:textfield name="addAuditDto.PROF_CO_STAFF_TEL" id="PROF_CO_STAFF_TEL" cssStyle="width:180px;" maxlength="30" theme="simple"></s:textfield>
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">快递地址</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="profCoPostAddress" maxlength="40" style="width:180px;" value="<s:property value="addAuditDto.PROF_CO_POST_ADDRESS" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr style="display: none;">
										<td align="right">邮箱</td>
										<td>
											<div class="box1">
												<div class="box1_left"></div>
												<div class="box1_center">
													<s:textfield name="addAuditDto.prof_mail_pr" id="prof_mail_pr" cssStyle="width:116px;" maxlength="29" theme="simple"></s:textfield>
												</div>
												<div class="box1_right"></div>
												<label>@</label>
												<div class="box1_left"></div>
												<div class="box1_center">
													<s:textfield name="addAuditDto.prof_mail_suffix" id="prof_mail_suffix" cssStyle="width:116px;" maxlength="30" theme="simple"></s:textfield>
												</div>
												<div class="box1_right"></div>
											</div>
										</td>
									</tr>
								</table>
							</td>
							<td width="33%">
								<table class="company_tab" width="100%" border="0">
									<tr>
										<td colspan="4" align="center" class="tittle"><strong>承包公司信息</strong></td>
									</tr>
									<tr>
										<td align="right">代码</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="contractCoNo" disabled="disabled" maxlength="4" style="width:100px;" value="<s:property value="addAuditDto.CONTRACT_CO_NO" />" />
											</div>
											<div class="box1_right"></div>
											<div class="btn">
												<div class="box1_left"></div>
												<div class="box1_center">
													<input id="contractCoBtn" class="input40" type="button" value="检索" onclick="selectContractComp()" />
												</div>
												<div class="box1_right"></div>
											</div>
										</td>
									</tr>
									<tr>
										<td align="right">名称</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="contractCoName" disabled="disabled" style="width:180px;" maxlength="40" value="<s:property value="addAuditDto.CONTRACT_CO_NAME" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">负责人</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="contractCoManager" maxlength="24" style="width:180px;" value="<s:property value="addAuditDto.CONTRACT_CO_MANAGER" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">负责人电话</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="contractCoManagerTel" maxlength="30" style="width:180px;" value="<s:property value="addAuditDto.CONTRACT_CO_MANAGER_TEL" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">项目负责人</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<s:textfield name="addAuditDto.CONTRACT_CO_STAFF" id="CONTRACT_CO_STAFF" cssStyle="width:180px;" maxlength="24" theme="simple"></s:textfield>
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">项目负责人电话</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<s:textfield name="addAuditDto.CONTRACT_CO_STAFF_TEL" id="CONTRACT_CO_STAFF_TEL" cssStyle="width:180px;" maxlength="30" theme="simple"></s:textfield>
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">快递地址</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="contractCoPostAddress" maxlength="40" style="width:180px;" value="<s:property value="addAuditDto.CONTRACT_CO_POST_ADDRESS" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr style="display: none;">
										<td align="right">邮箱</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="contractCoMail" maxlength="60" style="width:180px;" value="<s:property value="addAuditDto.CONTRACT_CO_MAIL" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<div class="ok">
					<table width="100%" border="0" cellpadding="5" cellspacing="0">
						<tr>
							<td align="right">
								<label class="pdf10">资料快递编号</label>
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.DOC_POST_NO" id="DOC_POST_NO" cssStyle="width:165px;" maxlength="12" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">
								<label class="pdf10">审定单发出日期</label>
							</td>
							<td class="date_input" width="20%">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="verifyDocSendDate" style="width:150px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="addAuditDto.VERIFY_DOC_SEND_DATE"/>" />
									<a id="verifyDocSendDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('verifyDocSendDate'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">
								<label class="pdf10">最终报告日期</label>
							</td>
							<td class="date_input" width="20%">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="lastReportDate" style="width:150px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="addAuditDto.LAST_REPORT_DATE"/>" />
									<a id="lastReportDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('lastReportDate'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
						<tr>
							<td align="right">
								<label class="pdf10">资料到达日期</label>
							</td>
							<td class="date_input" width="20%">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="docArrDate" style="width:150px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="addAuditDto.DOC_ARR_DATE"/>" />
									<a id="docArrDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('docArrDate'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">
								<label class="pdf10">审定单回复日期</label>
							</td>
							<td class="date_input" width="20%">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="verifyDocReplyDate" style="width:150px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="addAuditDto.VERIFY_DOC_REPLY_DATE"/>" />
									<a id="verifyDocReplyDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('verifyDocReplyDate'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">
								<label class="pdf10">报告快递编号</label>
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.REPORT_POST_NO" id="REPORT_POST_NO" cssStyle="width:165px;" maxlength="12" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
						<tr>
							<td align="right">
								<label class="pdf10">资料邮箱时间</label>
							</td>
							<td class="date_input" width="20%" colspan="5">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="docMailDate" style="width:150px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="addAuditDto.DOC_MAIL_DATE"/>" />
									<a id="docMailDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('docMailDate'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
						<tr>
							<td align="right">
								<label class="pdf10">送审金额（元）</label>
							</td>
							<td colspan="5">
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.VERIFY_PER_AMOUNT" id="VERIFY_PER_AMOUNT" cssStyle="width:165px;" maxlength="14" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
						<tr>
							<td align="right">
								<label class="pdf10">审定金额（元）</label>
							</td>
							<td colspan="5">
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.VERIFY_AMOUNT" id="VERIFY_AMOUNT" cssStyle="width:165px;" maxlength="14" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
						<tr>
							<td align="right">
								<label class="pdf10">净核减</label>
							</td>
							<td colspan="5">
								<div class="box1_left"></div>
								<div class="box1_center">
									<input type="text" id="verifyDiff" style="width:165px;" maxlength="15" disabled="disabled" value="<s:property value="addAuditDto.VERIFY_DIFF" />" />
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
						<tr>
							<td align="right">
								<label class="pdf10">核增</label>
							</td>
							<td colspan="5">
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.VERIFY_INCREASE" id="VERIFY_INCREASE" cssStyle="width:165px;" maxlength="10" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
						<tr>
							<td align="right">
								<label class="pdf10">核减</label>
							</td>
							<td colspan="5">
								<div class="box1_left"></div>
								<div class="box1_center">
									<input type="text" id="verifyDecrease" style="width:165px;" maxlength="15" disabled="disabled" value="<s:property value="addAuditDto.VERIFY_DECREASE" />" />
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
						<tr>
							<td align="right">
								<label class="pdf10">增减理由</label>
							</td>
							<td colspan="5">
								<textarea id="tVerifyDiffReason" rows="3" cols="" style="width:725px;"><s:property value="addAuditDto.VERIFY_DIFF_REASON" /></textarea>
							</td>
						</tr>
					</table>
				</div>
				<div class="trade">
					<table class="trade_tab" width="100%" border="0">
						<tr>
							<td align="right" width="8%"><strong>发票</strong></td>
							<td align="right" width="10%">开票日期</td>
							<td class="date_input" width="20%">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="receipt1Date" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="addAuditDto.RECEIPT1_DATE"/>" />
									<a id="receipt1DateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('receipt1Date'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right" width="10%">开票人</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.RECEIPT1_STAFF" id="RECEIPT1_STAFF" maxlength="24" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right" width="12%">开票金额（甲方）</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.RECEIPT1_AMOUNT_A" id="RECEIPT1_AMOUNT_A" maxlength="7" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="right">发票号码</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.RECEIPT1_NO" id="RECEIPT1_NO" maxlength="8" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">接受人</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.RECEIPT2_RECEIVER" id="RECEIPT2_RECEIVER" maxlength="24" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right" width="10%">开票金额（乙方）</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.RECEIPT1_AMOUNT_B" id="RECEIPT1_AMOUNT_B" maxlength="7" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="right">到账日期</td>
							<td class="date_input">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="valueDate" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="addAuditDto.VALUE_DATE"/>" />
									<a id="valueDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('valueDate'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td align="right">开票金额（合计）</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<input type="text" id="receipt1AmountTotal" style="width:165px;" maxlength="8" disabled="disabled" value="<s:property value="addAuditDto.RECEIPT1_AMOUNT_TOTAL" />" />
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
						<tr>
							<td colspan="6"><br /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td width="10%" align="right">签收单编号</td>
							<td width="20%">
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.RECEIPT2_NO" id="RECEIPT2_NO" maxlength="4" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td class="date_input" width="10%" align="right">签收时间</td>
							<td width="20%">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="receipt2Date" disabled="disabled" maxlength="10" value="<s:date format="yyyy-MM-dd" name="addAuditDto.RECEIPT2_DATE"/>" />
									<a id="receipt2DateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('receipt2Date'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td width="10%" align="right">&nbsp;</td>
							<td width="20%">&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="right">快递编号</td>
							<td width="20%">
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="addAuditDto.RECEIPT2_POST_NO" id="RECEIPT2_POST_NO" maxlength="12" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">快递时间</td>
							<td class="date_input">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="receipt2PostDate" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="addAuditDto.RECEIPT2_POST_DATE"/>" />
									<a id="receipt2PostDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('receipt2PostDate'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</div>
				<div class="trade">
					<table class="trade_tab" width="80%" border="0">
						<tr>
							<td align="left" width="35%">轨道交通类</td>
							<td width="5%" style="background-color:rgb(130,219,237)">
								<s:if test='%{addAuditDto.RESERVE2.substring(0, 1) == "1"}'>
									<input id="reserve2_0" style="vertical-align:middle;margin-top:10px" type="checkbox" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_0" type="checkbox"/>　
								</s:else></td>
							<td align="left" width="35%">其他类</td>
							<td width="5%" style="background-color:rgb(130,219,237)">
								<s:if test='%{addAuditDto.RESERVE2.substring(6, 7) == "1"}'>
									<input id="reserve2_6" type="checkbox" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_6" style="vertical-align:middle;margin-top:0px" type="checkbox"/>　
								</s:else></td>
						</tr><!--
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr> -->
						<tr>
							<td align="left">预（结）算书</td>
							<td style="background-color:rgb(130,219,237)">
								<s:if test='%{addAuditDto.RESERVE2.substring(1, 2) == "1"}'>
									<input id="reserve2_1" type="checkbox" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_1" type="checkbox"/>　
								</s:else></td>
							<td align="left">招标文件</td>
							<td style="background-color:rgb(130,219,237)">
								<s:if test='%{addAuditDto.RESERVE2.substring(7, 8) == "1"}'>
									<input id="reserve2_7" type="checkbox" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_7" type="checkbox"/>　
								</s:else></td>
						</tr>
						<tr>
							<td align="left">项目方案</td>
							<td style="background-color:rgb(130,219,237)">
								<s:if test='%{addAuditDto.RESERVE2.substring(2, 3) == "1"}'>
									<input id="reserve2_2" type="checkbox" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_2" type="checkbox"/>　
								</s:else></td>
							<td align="left">投标文件</td>
							<td style="background-color:rgb(130,219,237)">
								<s:if test='%{addAuditDto.RESERVE2.substring(8, 9) == "1"}'>
									<input id="reserve2_8" type="checkbox" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_8" type="checkbox"/>　
								</s:else></td>
						</tr>
						<tr>
							<td align="left">项目情况说明</td>
							<td style="background-color:rgb(130,219,237)">
								<s:if test='%{addAuditDto.RESERVE2.substring(3, 4) == "1"}'>
									<input id="reserve2_3" type="checkbox" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_3" type="checkbox"/>　
								</s:else></td>
							<td align="left">项目合同</td>
							<td style="background-color:rgb(130,219,237)">
								<s:if test='%{addAuditDto.RESERVE2.substring(9, 10) == "1"}'>
									<input id="reserve2_9" type="checkbox" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_9" type="checkbox"/>　
								</s:else></td>
						</tr>
						<tr>
							<td align="left">项目合同</td>
							<td style="background-color:rgb(130,219,237)">
								<s:if test='%{addAuditDto.RESERVE2.substring(4, 5) == "1"}'>
									<input id="reserve2_4" type="checkbox" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_4" type="checkbox"/>　
								</s:else></td>
							<td align="left">项目签证变更单</td>
							<td style="background-color:rgb(130,219,237)">
								<s:if test='%{addAuditDto.RESERVE2.substring(10, 11) == "1"}'>
									<input id="reserve2_10" type="checkbox" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_10" type="checkbox"/>　
								</s:else></td>
						</tr>
						<tr>
							<td align="left">相关发票及价格证明文件</td>
							<td style="background-color:rgb(130,219,237)">
								<s:if test='%{addAuditDto.RESERVE2.substring(5, 6) == "1"}'>
									<input id="reserve2_5" type="checkbox" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_5" type="checkbox"/>　
								</s:else></td>
							<td align="left">项目设计变更单</td>
							<td style="background-color:rgb(130,219,237)">
								<s:if test='%{addAuditDto.RESERVE2.substring(11, 12) == "1"}'>
									<input id="reserve2_11" type="checkbox" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_11" type="checkbox"/>　
								</s:else></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td align="left">开（竣）工报告</td>
							<td style="background-color:rgb(130,219,237)">
								<s:if test='%{addAuditDto.RESERVE2.substring(12, 13) == "1"}'>
									<input id="reserve2_12" type="checkbox" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_12" type="checkbox"/>　
								</s:else></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td align="left">结算书</td>
							<td style="background-color:rgb(130,219,237)">
								<s:if test='%{addAuditDto.RESERVE2.substring(13, 14) == "1"}'>
									<input id="reserve2_13" type="checkbox" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_13" type="checkbox"/>　
								</s:else></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td align="left">竣工图纸</td>
							<td style="background-color:rgb(130,219,237)">
								<s:if test='%{addAuditDto.RESERVE2.substring(14, 15) == "1"}'>
									<input id="reserve2_14" type="checkbox" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_14" type="checkbox"/>　
								</s:else></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td align="left">工程量确认单</td>
							<td style="background-color:rgb(130,219,237)">
								<s:if test='%{addAuditDto.RESERVE2.substring(15, 16) == "1"}'>
									<input id="reserve2_15" type="checkbox" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_15" type="checkbox"/>　
								</s:else></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td align="left"><label style="vertical-align:bottom">价格证明文件</label></td>
							<td style="background-color:rgb(130,219,237)" valign="bottom">
								<s:if test='%{addAuditDto.RESERVE2.substring(16, 17) == "1"}'>
									<input id="reserve2_16" type="checkbox" style="vertical-align:bottom" checked="checked"/>
								</s:if>
								<s:else>
									<input id="reserve2_16" type="checkbox" style="vertical-align:bottom"/>　
								</s:else></td>
						</tr>
						<tr>
							<td align="left" colspan="4">
								<label class="pdf10">补充：</label>
								<textarea id="reserve3" rows="3" cols="" style="width:650px;"><s:property value="addAuditDto.RESERVE3" /></textarea>
							</td>
						</tr>
					</table>
					<table cellpadding="10" style="margin:0 auto;">
						<tr>
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" type="button" value="追加" onclick="add();"/>
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" type="button" value="返回" onclick="goAuditList();"/>
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
						</tr>
					</table>
					<div style="height:225px;"></div>
				</div>
			</s:form>
		</div>
	</div>
</body>
</html>