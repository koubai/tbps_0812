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
<title>招标信息输入</title>
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
			if(confirm("确定追加吗？")) {
				$("#tmpUpdType").val("1");
				document.mainform.action = '<c:url value="/bid/addBidAction.action"></c:url>';
				document.mainform.submit();
			}
		}
	}
	
	//下一步
	function nextstep() {
		//报名
		$("#tmpBidStatus").val("20");
		document.mainform.action = '<c:url value="/bid/showUpdBidStatusAction.action"></c:url>';
		document.mainform.submit();
	}

	//验证招标编号，类型=竞价
	function isJJ(zbno) {
		//格式:LHJJ-YY-NNN
		var reg = /^LHJJ\-[0-9]{2}\-[0-9]{3}$/;
		return reg.test(zbno);
	}

	function checkdata() {
		var BID_NO = $("#BID_NO").val().trim();
		setBidValue();
		var IS_RANDOM = $("#IS_RANDOM").val();
		var PROJECT_TYPE = $("#PROJECT_TYPE").val();
		var PROJECT_NAME = $("#PROJECT_NAME").val();
		var PROJECT_MANAGER = $("#PROJECT_MANAGER").val();
		//委托公司信息
		var AGENT_NO = $("#AGENT_NO").val();
		var ANGENT_COMP_NAME = $("#ANGENT_COMP_NAME").val();
		var AGENT_CO_MANAGER = $("#AGENT_CO_MANAGER").val();
		var AGENT_CO_MANAGER_TEL = $("#AGENT_CO_MANAGER_TEL").val();
		var AGENT_CO_POST_ADDRESS = $("#AGENT_CO_POST_ADDRESS").val();
		var AGENT_CO_MAIL = $("#AGENT_CO_MAIL").val();
		//专业公司信息
		var PROF_NO = $("#PROF_NO").val();
		var PROF_CO_NAME = $("#PROF_CO_NAME").val();
		var PROF_CO_MANAGER = $("#PROF_CO_MANAGER").val();
		var PROF_CO_MANAGER_TEL = $("#PROF_CO_MANAGER_TEL").val();
		var PROF_CO_POST_ADDRESS = $("#PROF_CO_POST_ADDRESS").val();
		var PROF_CO_MAIL = $("#PROF_CO_MAIL").val();
		
		//计划价格
		var PROJ_PLAN_PRICE = $("#PROJ_PLAN_PRICE").val();
		//限价
		var PROJ_ASTRICT_PRICE = $("#PROJ_ASTRICT_PRICE").val();
		//招标代理支付方  
		var BID_AGENT_PAY = $("#BID_AGENT_PAY").val();
		var BID_NEED_MATERIAL_PRICE = $("#BID_NEED_MATERIAL_PRICE").val();
		
		//批文
		var tmpPROJ_APPROVAL = $("#tmpPROJ_APPROVAL").val();
		$("#PROJ_APPROVAL").attr("value", tmpPROJ_APPROVAL);
		var PROJ_APPROVAL = $("#PROJ_APPROVAL").val();
		
		if(PROJECT_TYPE == "3" || PROJECT_TYPE == "4" ) {
			//分类=招标办 or 分类=竞价,招标编号为自己输入
			if(BID_NO == "") {
				alert("招标编号不能为空！");
				$("#BID_NO").focus();
				return false;
			}
		} else {
			//分类!=招标办
			if(IS_RANDOM == "0") {
				//非随机生成招标编号
				if(BID_NO == "") {
					alert("招标编号不能为空！");
					$("#BID_NO").focus();
					return false;
				}
			}
		}
		if(PROJECT_TYPE == "") {
			alert("请选择分类！");
			$("#radioProjectType").focus();
			return false;
		}
		
		if(IS_RANDOM == "0") {
			//非随机生成招标编号时
			//分类=比选,招标时，招标编号不能为空
			if(PROJECT_TYPE == "1") {
				//验证招标编号格式是否正确
				if(!isZB(BID_NO)) {
					alert("招标编号格式不正确，应为：LHZB-YY-NNN！");
					$("#BID_NO").focus();
					return false;
				}
			} else if(PROJECT_TYPE == "2") {
				//验证招标编号格式是否正确
				if(!isBX(BID_NO)) {
					alert("招标编号格式不正确，应为：LHBX-YY-NNN！");
					$("#BID_NO").focus();
					return false;
				}
			} else if(PROJECT_TYPE == "4") {
				//验证招标编号格式是否正确
				if(!isJJ(BID_NO)) {
					alert("招标编号格式不正确，应为：LHJJ-YY-NNN！");
					$("#BID_NO").focus();
					return false;
				}
			}
		}
		
		if(PROJECT_MANAGER.length > 6) {
			alert("工程师不能超过6个字！");
			$("#PROJECT_MANAGER").focus();
			return false;
		}
		
		if(PROJECT_NAME == "") {
			alert("项目名称不能为空！");
			$("#PROJECT_NAME").focus();
			return false;
		}
		//if(AGENT_CO_MANAGER_TEL != "" && !isMobile(AGENT_CO_MANAGER_TEL) && !isTelephone(AGENT_CO_MANAGER_TEL)) {
		//	alert("请输入正确的委托公司电话！");
		//	$("#AGENT_CO_MANAGER_TEL").focus();
		//	return false;
		//}
		
		var agentCoManager = $("#agentCoManager").val();
		if(agentCoManager.length > 6) {
			alert("委托公司联系人不能超过6个字！");
			$("#agentCoManager").focus();
			return false;
		}
		
		if(AGENT_CO_MAIL != "" && !isMail(AGENT_CO_MAIL)) {
			alert("请输入正确的委托公司邮箱！");
			$("#AGENT_CO_MAIL").focus();
			//$("#agent_mail_pr").focus();
			return false;
		}
		//专业公司信息
		//if(PROF_CO_MANAGER_TEL != "" && !isMobile(PROF_CO_MANAGER_TEL) && !isTelephone(PROF_CO_MANAGER_TEL)) {
		//	alert("请输入正确的专业公司电话！");
		//	$("#PROF_CO_MANAGER_TEL").focus();
		//	return false;
		//}
		
		var profCoManager = $("#profCoManager").val();
		if(profCoManager.length > 6) {
			alert("专业公司联系人不能超过6个字！");
			$("#profCoManager").focus();
			return false;
		}
		
		if(PROF_CO_MAIL != "" && !isMail(PROF_CO_MAIL)) {
			alert("请输入正确的专业公司邮箱！");
			//$("#prof_mail_pr").focus();
			$("#PROF_CO_MAIL").focus();
			return false;
		}
		if(PROJ_APPROVAL.length > 60) {
			alert("批文不能超过60个字！");
			$("#tmpPROJ_APPROVAL").focus();
			return false;
		}
		if(PROJ_PLAN_PRICE != "" && !numberCheck(PROJ_PLAN_PRICE)) {
			alert("计划价格格式不正确！");
			$("#PROJ_PLAN_PRICE").focus();
			return false;
		}
		if(PROJ_ASTRICT_PRICE != "" && !numberCheck(PROJ_ASTRICT_PRICE)) {
			alert("限价格式不正确！");
			$("#PROJ_ASTRICT_PRICE").focus();
			return false;
		}
		if(BID_AGENT_PAY == "") {
			alert("请选择招标代理支付方！");
			$("#BID_AGENT_PAY").focus();
			return false;
		}
		if($("#BID_AGENT_PAY").val() != "其他") {
			$("#BID_AGENT_PAY2").attr("value", "");
		}

		//金额一律默认为0
		if(PROJ_PLAN_PRICE == "") {
			$("#PROJ_PLAN_PRICE").attr("value", 0);
		}
		if(PROJ_ASTRICT_PRICE == "") {
			$("#PROJ_ASTRICT_PRICE").attr("value", 0);
		}
		
		$("#RECEIPT1_AGENT_COMMISSION").val("0");
		$("#BID_COMMISION").val("0");
		$("#FINISH_NOTE").val("");
		$("#BID_AGENT_PRICE").val("0");
		return true;
	}
	
	function setBidValue() {
		var projectType = "";
		var list = document.getElementsByName("projectType");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				projectType = list[i].value;
				break;
			}
		}
		$("#PROJECT_TYPE").attr("value", projectType);
		
		//新增招标资料费
		var needMaterialPrice = "";
		var list1 = document.getElementsByName("needMaterialPrice");
		for(var i = 0; i < list1.length; i++) {
			if(list1[i].checked) {
				needMaterialPrice = list1[i].value;
				break;
			}
		}
		$("#BID_NEED_MATERIAL_PRICE").attr("value", needMaterialPrice);
		
		//委托公司
		$("#AGENT_NO").attr("value", $("#agentNo").val());
		$("#AGENT_CO_NAME").attr("value", $("#agentCoName").val());
		$("#AGENT_CO_MANAGER").attr("value", $("#agentCoManager").val());
		$("#AGENT_CO_MANAGER_TEL").attr("value", $("#agentCoManagerTel").val());
		$("#AGENT_CO_POST_ADDRESS").attr("value", $("#agentCoPostAddress").val());
		
		/*
		var agent_mail_pr = $("#agent_mail_pr").val();
		var agent_mail_suffix = $("#agent_mail_suffix").val();
		if(agent_mail_pr != "" || agent_mail_suffix != "") {
			$("#AGENT_CO_MAIL").attr("value", agent_mail_pr + "@" + agent_mail_suffix);
		} else {
			$("#AGENT_CO_MAIL").attr("value", "");
		}//*/
		
		//专业公司
		$("#PROF_NO").attr("value", $("#profNo").val());
		$("#PROF_CO_NAME").attr("value", $("#profCoName").val());
		$("#PROF_CO_MANAGER").attr("value", $("#profCoManager").val());
		$("#PROF_CO_MANAGER_TEL").attr("value", $("#profCoManagerTel").val());
		$("#PROF_CO_POST_ADDRESS").attr("value", $("#profCoPostAddress").val());
		
		/*
		var prof_mail_pr = $("#prof_mail_pr").val();
		var prof_mail_suffix = $("#prof_mail_suffix").val();
		if(prof_mail_pr != "" || prof_mail_suffix != "") {
			$("#PROF_CO_MAIL").attr("value", prof_mail_pr + "@" + prof_mail_suffix);
		} else {
			$("#PROF_CO_MAIL").attr("value", "");
		}//*/
		
		//是否随机
		if(document.getElementById("random").checked) {
			$("#IS_RANDOM").attr("value", "1");
		} else {
			$("#IS_RANDOM").attr("value", "0");
		}
		//承接项目日期
		$("#RESERVE_DATE6").attr("value", $("#reserveDate6").val());
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
	
	function selectAgentComp_bak() {
		var AGENT_NO = $("#AGENT_NO").val();
		if(AGENT_NO == "") {
			alert("请输入委托公司代码。");
			$("#AGENT_NO").focus();
			return;
		}
		$.ajax({
			url:'<c:url value="/agentcomp/queryAgentCompById.action"></c:url>' + "?date" + new Date(),
			type:"POST",
			dataType:"json",
			data:{
				"queryAgentCompNo":AGENT_NO
			},
			success:function(data) {
				if(data.result == "0") {
					$("#AGENT_CO_NAME").attr("value", data.ANGENT_COMP_NAME);
					$("#agentCoName").attr("value", data.ANGENT_COMP_NAME);
				} else {
					if(data.result == "-2") {
						alert("委托公司代码不存在。");
					}
					if(data.result == "-1") {
						alert("系统错误，查询委托公司错误。");
					}
				}
			}
		});
	}
	
	function selectExpertComp_bak() {
		var PROF_NO = $("#PROF_NO").val().trim();
		if(PROF_NO == "") {
			alert("请输入专业公司代码。");
			$("#PROF_NO").focus();
			return;
		}
		$.ajax({
			url:'<c:url value="/agentcomp/queryAgentCompById.action"></c:url>' + "?date" + new Date(),
			type:"POST",
			dataType:"json",
			data:{
				"queryAgentCompNo":PROF_NO
			},
			success:function(data) {
				if(data.result == "0") {
					$("#PROF_CO_NAME").attr("value", data.ANGENT_COMP_NAME);
					$("#profCoName").attr("value", data.ANGENT_COMP_NAME);
				} else {
					if(data.result == "-2") {
						alert("专业公司代码不存在。");
					}
					if(data.result == "-1") {
						alert("系统错误，查询专业公司错误。");
					}
				}
			}
		});
	}
	
	function goBidList() {
		window.location.href = '<c:url value="/bid/queryBidList.action"></c:url>';
		//document.mainform.submit();
	}
	
	function selectProjectType(obj) {
		if(obj.checked) {
//			if(obj.value == "3" || obj.value == "4" ) {
			if(obj.value == "3" ) {
				//招标办, 竞价，招标编号必须自己输入
				document.getElementById("random").checked = false;
				document.getElementById("random").disabled = true;
				$("#BID_NO").attr("disabled", false);
			} else {
				document.getElementById("random").disabled = false;
			}
		}
	}
	
	function randomBidNo(obj) {
		if(obj.checked) {
			var projectType = "";
			var list = document.getElementsByName("projectType");
			for(var i = 0; i < list.length; i++) {
				if(list[i].checked) {
					projectType = list[i].value;
					break;
				}
			}
			if(projectType == "3" || projectType == "4" ) {
				//招标办，招标编号可自己输入
				$("#BID_NO").attr("disabled", false);
			} else {
				$("#BID_NO").attr("value", "");
				$("#BID_NO").attr("disabled", true);
			}
		} else {
			$("#BID_NO").attr("disabled", false);
		}
	}
	
	function exportBidForm() {
		document.mainform.action = '<c:url value="/bid/exportBidFormAction.action"></c:url>' + "?projectMsgFlag=1";
		document.mainform.submit();
	}
	
	//更新保证金
	function updBidBond() {
		var bond = $("#tmpBoundPrice").val();
		if(bond != "" && !isReal(bond)) {
			alert("保证金格式不正确！");
			$("#tmpBoundPrice").focus();
			return;
		}
		alert("设定保证金为"+bond+"万元, 请按保存。");
		document.getElementById("RESERVE5").value = bond;
	}

</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<s:form id="mainform" name="mainform" method="POST">
			<s:hidden name="updateBidNo" id="updateBidNo"/>
			<s:hidden name="tmpUpdType" id="tmpUpdType"/>
			<s:hidden name="addBidDto.MEMO1" id="MEMO1"/>
			<s:hidden name="addBidDto.ONLINE_DATE" id="ONLINE_DATE"/> 
			<s:hidden name="addBidDto.SUBMIT_DATE" id="SUBMIT_DATE"/>
			<s:hidden name="addBidDto.SUBMIT_DATE2" id="SUBMIT_DATE2"/>
			<s:hidden name="addBidDto.TENDER_START_DATE" id="TENDER_START_DATE"/>
			<s:hidden name="addBidDto.TENDER_OPEN_DATE" id="TENDER_OPEN_DATE"/>
			<s:hidden name="addBidDto.RECEIPT1_DATE" id="RECEIPT1_DATE"/>
			<s:hidden name="addBidDto.RECEIPT1_VALUE_DATE" id="RECEIPT1_VALUE_DATE"/>
			<s:hidden name="addBidDto.RECEIPT2_DATE" id="RECEIPT2_DATE"/>
			<s:hidden name="addBidDto.RECEIPT2_EXPRESS_DATE" id="RECEIPT2_EXPRESS_DATE"/>
			<s:hidden name="addBidDto.TENDER_ONLINE" id="TENDER_ONLINE"/>
			<s:hidden name="addBidDto.TENDER_DOWNLOAD" id="TENDER_DOWNLOAD"/>
			<s:hidden name="addBidDto.APPLY_FORM_EDIT" id="APPLY_FORM_EDIT"/>
			<s:hidden name="addBidDto.APPLY_FORM_VERIFY" id="APPLY_FORM_VERIFY"/>
			<s:hidden name="addBidDto.APPLY_FORM_MERGE" id="APPLY_FORM_MERGE"/>
			<s:hidden name="addBidDto.EXPERT_NAME_OFFERED" id="EXPERT_NAME_OFFERED"/>
			<s:hidden name="addBidDto.EXPERT_INFORMED" id="EXPERT_INFORMED"/>
			<s:hidden name="addBidDto.EXPERT_NAME_CONFIRMED" id="EXPERT_NAME_CONFIRMED"/>
			<s:hidden name="addBidDto.CLARIFY_DOC" id="CLARIFY_DOC"/>
			<s:hidden name="addBidDto.SUPPORT_DOC" id="SUPPORT_DOC"/>
			<s:hidden name="addBidDto.SUPPORT_DOC_SENT" id="SUPPORT_DOC_SENT"/>
			<s:hidden name="addBidDto.BIDDER_REPLY" id="BIDDER_REPLY"/>
			<s:hidden name="addBidDto.OPEN_RESULT" id="OPEN_RESULT"/>
			<s:hidden name="addBidDto.OPEN_VERIFY" id="OPEN_VERIFY"/>
			<s:hidden name="addBidDto.INFORM_SENT" id="INFORM_SENT"/>
			<s:hidden name="addBidDto.INFORM_CONTRACT" id="INFORM_CONTRACT"/>
			<s:hidden name="addBidDto.ATTACH_POST_A" id="ATTACH_POST_A"/>
			<s:hidden name="addBidDto.CONTRACT_VERIFY" id="CONTRACT_VERIFY"/>
			<s:hidden name="addBidDto.COMMENT_POST" id="COMMENT_POST"/>
			<s:hidden name="addBidDto.BID_REOPRT_EDIT" id="BID_REOPRT_EDIT"/>
			<s:hidden name="addBidDto.BID_REPORT_VERIFY" id="BID_REPORT_VERIFY"/>
			<s:hidden name="addBidDto.BID_REPORT_SENT" id="BID_REPORT_SENT"/>
			<s:hidden name="addBidDto.BID_EXPERT_LIST" id="BID_EXPERT_LIST"/>
			<s:hidden name="addBidDto.FINISH_STATUS" id="FINISH_STATUS"/>
			<s:hidden name="addBidDto.MATERIAL_EXPRESS_DATE" id="MATERIAL_EXPRESS_DATE"/>
			<s:hidden name="addBidDto.BID_MESSAGE_DATE" id="BID_MESSAGE_DATE"/>
			<s:hidden name="addBidDto.APPLY_REQUIRE" id="APPLY_REQUIRE"/>
			<s:hidden name="addBidDto.BID_NOTICE_DATE" id="BID_NOTICE_DATE"/>
			<s:hidden name="addBidDto.BID_NOTICE_DATE2" id="BID_NOTICE_DATE2"/>
			
			<s:hidden name="addBidDto.BID_CO_LIST" id="BID_CO_LIST"/>
			<s:hidden name="addBidDto.RECEIPT2_POST_NO" id="RECEIPT2_POST_NO"/>
			<s:hidden name="addBidDto.RECEIPT2_NO" id="RECEIPT2_NO"/>
			<s:hidden name="addBidDto.RECEIPT1_RECEIVER" id="RECEIPT1_RECEIVER"/>
			<s:hidden name="addBidDto.RECEIPT1_NO" id="RECEIPT1_NO"/>
			<s:hidden name="addBidDto.RECEIPT1_STAFF" id="RECEIPT1_STAFF"/>
			<s:hidden name="addBidDto.PROF_CO_NAME" id="PROF_CO_NAME"/>
			<s:hidden name="addBidDto.AGENT_CO_NAME" id="AGENT_CO_NAME"/>
			
			<s:hidden name="tmpBidStatus" id="tmpBidStatus"/>
			<s:hidden name="addBidDto.PROJECT_TYPE" id="PROJECT_TYPE"/>
			<s:hidden name="addBidDto.IS_RANDOM" id="IS_RANDOM"/>
			
			<s:hidden name="addBidDto.AGENT_NO" id="AGENT_NO"/>
			<s:hidden name="addBidDto.PROF_NO" id="PROF_NO"/>
			<s:hidden name="addBidDto.PROJ_APPROVAL" id="PROJ_APPROVAL"/>
			
			<s:hidden name="addBidDto.AGENT_CO_MANAGER" id="AGENT_CO_MANAGER"/>
			<s:hidden name="addBidDto.AGENT_CO_MANAGER_TEL" id="AGENT_CO_MANAGER_TEL"/>
			<s:hidden name="addBidDto.AGENT_CO_POST_ADDRESS" id="AGENT_CO_POST_ADDRESS"/>
			<s:hidden name="addBidDto.PROF_CO_MANAGER" id="PROF_CO_MANAGER"/>
			<s:hidden name="addBidDto.PROF_CO_MANAGER_TEL" id="PROF_CO_MANAGER_TEL"/>
			<s:hidden name="addBidDto.PROF_CO_POST_ADDRESS" id="PROF_CO_POST_ADDRESS"/>
			
			<s:hidden name="addBidDto.BID_NEED_MATERIAL_PRICE" id="BID_NEED_MATERIAL_PRICE"/>
			<s:hidden name="addBidDto.STATUS" id="STATUS"/>
			
			<s:hidden name="addBidDto.RECEIPT1_AGENT_COMMISSION" id="RECEIPT1_AGENT_COMMISSION"/>
			<s:hidden name="addBidDto.BID_COMMISION" id="BID_COMMISION"/>
			<s:hidden name="addBidDto.FINISH_NOTE" id="FINISH_NOTE"/>
			<s:hidden name="addBidDto.BID_AGENT_PRICE" id="BID_AGENT_PRICE"/>
			<s:hidden name="addBidDto.RESERVE_DATE6" id="RESERVE_DATE6"/>

			<s:hidden name="addBidDto.RESERVE5" id="RESERVE5" />
			<div class="row">
				<div class="container-fluid">
					<h3 class="title">招标信息输入<a class="backHome" href="#" onclick="goBidList();"><i class="fa fa-arrow-left" aria-hidden="true"></i>返回</a></h3>
					<ul class="steps">
						<s:if test='addBidDto.STATUS == "10"'>
							<li class="active"><a href="#">项目信息</a><i>→</i></li>
						</s:if>
						<s:else>
							<li><a href="#">项目信息</a><i>→</i></li>
						</s:else>
						<li><a href="#">报名</a><i>→</i></li>
						<li><a href="#">保证金</a><i>→</i></li>
						<li><a href="#">开标评标</a><i>→</i></li>
						<li><a href="#">资料归档</a></li>
					</ul>
					<div class="clearfix"></div>
					<div class="row mgt15">
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label"><span class="red">*</span>招标编号</label>
							<div class="col-lg-9">
								<s:if test='addBidDto.PROJECT_TYPE != "3" && addBidDto.PROJECT_TYPE != "4" && addBidDto.IS_RANDOM == "1"'>
									<s:textfield name="addBidDto.BID_NO" id="BID_NO" disabled="true" cssClass="form-control" maxlength="13" theme="simple"></s:textfield>
								</s:if>
								<s:else>
									<s:textfield name="addBidDto.BID_NO" id="BID_NO" cssClass="form-control" maxlength="13" theme="simple"></s:textfield>
								</s:else>
							</div>
						</div>
						<div class="col-lg-2 form-group">
							<label for="" class="col-lg-4 form-label">是否随机</label>
							<div class="col-lg-8 checkBox">
								<s:if test='addBidDto.IS_RANDOM == "1"'>
									<input type="checkbox" id="random" checked="checked" onclick="randomBidNo(this);"/>是否随机
								</s:if>
								<s:else>
									<input type="checkbox" id="random" onclick="randomBidNo(this);"/>是否随机
								</s:else>
							</div>
						</div>
						<div class="col-lg-4 form-group">
							<label for="" class="col-lg-3 form-label">分类</label>
							<div class="col-lg-9 account">
								<s:if test='addBidDto.PROJECT_TYPE == "1"'>
									<input id="radioProjectType" name="projectType" checked="checked" onclick="selectProjectType(this);" type="radio" value="1"/>
									<label class="form-label" for="">招标</label>
									<input name="projectType" onclick="selectProjectType(this);" type="radio" value="2"/>
									<label class="form-label" for="">比选</label>
									<input name="projectType" onclick="selectProjectType(this);" type="radio" value="3"/>
									<label class="form-label" for="">招标办</label>
									<input name="projectType" onclick="selectProjectType(this);" type="radio" value="4"/>
									<label class="form-label" for="">竞价</label>
								</s:if>
								<s:elseif test='addBidDto.PROJECT_TYPE == "2"'>
									<input id="radioProjectType" name="projectType" onclick="selectProjectType(this);" type="radio" value="1"/>
									<label class="form-label" for="">招标</label>
									<input name="projectType" onclick="selectProjectType(this);" type="radio" checked="checked" value="2"/>
									<label class="form-label" for="">比选</label>
									<input name="projectType" onclick="selectProjectType(this);" type="radio" value="3"/>
									<label class="form-label" for="">招标办</label>
									<input name="projectType" onclick="selectProjectType(this);" type="radio" value="4"/>
									<label class="form-label" for="">竞价</label>
								</s:elseif>
								<s:elseif test='addBidDto.PROJECT_TYPE == "3"'>
									<input id="radioProjectType" onclick="selectProjectType(this);" name="projectType" type="radio" value="1"/>
									<label class="form-label" for="">招标</label>
									<input name="projectType" onclick="selectProjectType(this);" type="radio" value="2"/>
									<label class="form-label" for="">比选</label>
									<input name="projectType" onclick="selectProjectType(this);" type="radio" checked="checked" value="3"/>
									<label class="form-label" for="">招标办</label>
									<input name="projectType" onclick="selectProjectType(this);" type="radio" value="4"/>
									<label class="form-label" for="">竞价</label>
								</s:elseif>
								<s:elseif test='addBidDto.PROJECT_TYPE == "4"'>
									<input id="radioProjectType" onclick="selectProjectType(this);" name="projectType" type="radio" value="1"/>
									<label class="form-label" for="">招标</label>
									<input name="projectType" onclick="selectProjectType(this);" type="radio" value="2"/>
									<label class="form-label" for="">比选</label>
									<input name="projectType" onclick="selectProjectType(this);" type="radio" value="3"/>
									<label class="form-label" for="">招标办</label>
									<input name="projectType" onclick="selectProjectType(this);" type="radio" checked="checked" value="4"/>
									<label class="form-label" for="">竞价</label>
								</s:elseif>
								<s:else>
									<input id="radioProjectType" onclick="selectProjectType(this);" name="projectType" type="radio" value="1"/>
									<label class="form-label" for="">招标</label>
									<input name="projectType" onclick="selectProjectType(this);" type="radio" value="2"/>
									<label class="form-label" for="">比选</label>
									<input name="projectType" onclick="selectProjectType(this);" type="radio" value="3"/>
									<label class="form-label" for="">招标办</label>
									<input name="projectType" onclick="selectProjectType(this);" type="radio" value="4"/>
									<label class="form-label" for="">竞价</label>
								</s:else>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label"><span class="red">*</span>工程师</label>
							<div class="col-lg-9">
								<select name="addBidDto.PROJECT_MANAGER" id="PROJECT_MANAGER" class="form-control">
									<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
										<option value="<s:property value="LOGIN_NAME"/>" <s:if test="%{addBidDto.PROJECT_MANAGER == LOGIN_NAME}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
									</s:iterator>
								</select>
							</div>
						</div>
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-2 form-label"><span class="red">*</span>项目名称</label>
							<div class="col-lg-10">
								<s:textfield name="addBidDto.PROJECT_NAME" id="PROJECT_NAME" cssClass="form-control" maxlength="300" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-4 form-group">
							<label for="" class="col-lg-3 form-label">保证金(万元)</label>
							<div class="col-lg-9">
								<input type="text" id="tmpBoundPrice" class="form-control" maxlength="12" value="<s:property value="addBidDto.RESERVE5" />" />
							</div>
						</div>
						<div class="col-lg-2 form-group">
							<button class="btn btn-success form-control" onclick="updBidBond();">更新</button>
						</div>
					</div>
					<div class="">
						<div class="col-lg-4">
							<div class="box">
								<h5>委托公司信息</h5>
								<div class="row">
									<label class="col-lg-4 form-label">代码</label>
									<div class="col-lg-5">
										<input type="text" id="agentNo" disabled="disabled" maxlength="4" class="form-control" value="<s:property value="addBidDto.AGENT_NO" />" />
									</div>
									<div class="col-lg-3"><button class="btn btn-success form-control" onclick="selectAgentComp()">检索</button></div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">名称</label>
									<div class="col-lg-8">
										<input type="text" id="agentCoName" disabled="disabled" maxlength="40" class="form-control" value="<s:property value="addBidDto.AGENT_CO_NAME" />" />
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">联系人</label>
									<div class="col-lg-8">
										<input type="text" id="agentCoManager" maxlength="24" class="form-control" value="<s:property value="addBidDto.AGENT_CO_MANAGER" />" />
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">电话</label>
									<div class="col-lg-8">
										<input type="text" id="agentCoManagerTel" maxlength="30" class="form-control" value="<s:property value="addBidDto.AGENT_CO_MANAGER_TEL" />" />
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">地址</label>
									<div class="col-lg-8">
										<input type="text" id="agentCoPostAddress" maxlength="40" class="form-control" value="<s:property value="addBidDto.AGENT_CO_POST_ADDRESS" />" />
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">邮箱</label>
									<div class="col-lg-8">
										<s:textfield name="addBidDto.AGENT_CO_MAIL" id="AGENT_CO_MAIL" cssClass="form-control" maxlength="60" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row" style="display: none;">
									<label class="col-lg-4 form-label">邮箱</label>
									<div class="col-lg-8">
										<s:textfield name="addBidDto.agent_mail_pr" id="agent_mail_pr" cssClass="form-control" maxlength="29" theme="simple"></s:textfield>
									</div>
									<label class="col-lg-4 form-label">@</label>
									<div class="col-lg-8">
										<s:textfield name="addBidDto.agent_mail_suffix" id="agent_mail_suffix" cssClass="form-control" maxlength="30" theme="simple"></s:textfield>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="box">
								<h5>专业公司信息</h5>
								<div class="row">
									<label class="col-lg-4 form-label">代码</label>
									<div class="col-lg-5">
										<input type="text" id="profNo" disabled="disabled" maxlength="4" class="form-control" value="<s:property value="addBidDto.PROF_NO" />" />
									</div>
									<div class="col-lg-3">
										<button class="btn btn-success form-control" onclick="selectExpertComp()">检索</button>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">名称</label>
									<div class="col-lg-8">
										<input type="text" id="profCoName" disabled="disabled" class="form-control" maxlength="40" value="<s:property value="addBidDto.PROF_CO_NAME" />" />
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">联系人</label>
									<div class="col-lg-8">
										<input type="text" id="profCoManager" maxlength="24" class="form-control" value="<s:property value="addBidDto.PROF_CO_MANAGER" />" />
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">电话</label>
									<div class="col-lg-8">
										<input type="text" id="profCoManagerTel" maxlength="30" class="form-control" value="<s:property value="addBidDto.PROF_CO_MANAGER_TEL" />" />
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">地址</label>
									<div class="col-lg-8">
										<input type="text" id="profCoPostAddress" maxlength="40" class="form-control" value="<s:property value="addBidDto.PROF_CO_POST_ADDRESS" />" />
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">邮箱</label>
									<div class="col-lg-8">
										<s:textfield name="addBidDto.PROF_CO_MAIL" id="PROF_CO_MAIL" cssClass="form-control" maxlength="60" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row" style="display: none;">
									<label class="col-lg-4 form-label">邮箱</label>
									<div class="col-lg-8">
										<s:textfield name="addBidDto.prof_mail_pr" id="prof_mail_pr" cssClass="form-control" maxlength="29" theme="simple"></s:textfield>
									</div>
									<label class="col-lg-4 form-label">@</label>
									<div class="col-lg-8">
										<s:textfield name="addBidDto.prof_mail_suffix" id="prof_mail_suffix" cssClass="form-control" maxlength="30" theme="simple"></s:textfield>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="box">
								<h5>工程概况</h5>
								<div class="row">
									<label class="col-lg-4 form-label">批文</label>
									<div class="col-lg-8">
										<textarea id="tmpPROJ_APPROVAL" rows="3" cols="" class="form-control"><s:property value="addBidDto.PROJ_APPROVAL" /></textarea>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">计划价格(元)</label>
									<div class="col-lg-8">
										<s:textfield name="addBidDto.PROJ_PLAN_PRICE" id="PROJ_PLAN_PRICE" cssClass="form-control" maxlength="8" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">限价(元)</label>
									<div class="col-lg-8">
										<s:textfield name="addBidDto.PROJ_ASTRICT_PRICE" id="PROJ_ASTRICT_PRICE" cssClass="form-control" maxlength="8" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">招标代理费支付方</label>
									<div class="col-lg-8">
										<select name="addBidDto.BID_AGENT_PAY" id="BID_AGENT_PAY" class="form-control">
											<option value="">请选择</option>
											<s:iterator id="bidAgentCompList" value="bidAgentCompList" status="st1">
												<option value="<s:property value="CONFIG_KEY"/>" <s:if test="%{addBidDto.BID_AGENT_PAY == CONFIG_KEY}">selected</s:if>><s:property value="CONFIG_VAL"/></option>
											</s:iterator>
										</select>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">备注</label>
									<div class="col-lg-8">
										<s:textfield name="addBidDto.BID_AGENT_PAY2" id="BID_AGENT_PAY2" cssClass="form-control" maxlength="8" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">新增招标资料费</label>
									<div class="col-lg-8 account">
										<s:if test='addBidDto.BID_NEED_MATERIAL_PRICE == "1"'>
											<input name="needMaterialPrice" type="radio" value="0"/>
											<label class="form-label" for="">需要</label>
											<input name="needMaterialPrice" checked="checked" type="radio" value="1"/>
											<label class="form-label" for="">不需要</label>
										</s:if>
										<s:else>
											<input name="needMaterialPrice" checked="checked" type="radio" value="0"/>
											<label class="form-label" for="">需要</label>
											<input name="needMaterialPrice" type="radio" value="1"/>
											<label class="form-label" for="">不需要</label>
										</s:else>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">承接项目日期</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input type="text" id="reserveDate6" maxlength="10" class="form-control datepicker" readonly="" value="<s:date format="yyyy-MM-dd" name="addBidDto.RESERVE_DATE6"/>" />
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<label class="col-lg-4 form-label">项目性质</label>
									<div class="col-lg-8">
										<select id="RESERVE2" name="addBidDto.RESERVE2" class="form-control">
											<s:if test='addBidDto.RESERVE2 == "1"'>
												<option value="">请选择</option>
												<option value="1" selected="selected">成本内</option>
												<option value="2">成本外</option>
												<option value="3">其他</option>
											</s:if>
											<s:elseif test='addBidDto.RESERVE2 == "2"'>
												<option value="">请选择</option>
												<option value="1">成本内</option>
												<option value="2" selected="selected">成本外</option>
												<option value="3">其他</option>
											</s:elseif>
											<s:elseif test='addBidDto.RESERVE2 == "3"'>
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
								</div>
							</div>
						</div>
					</div>
					<div class="operationBtns addBtns mgt15 btn3">
						<button class="btn btn-success" onclick="exportBidForm();">导出流转单</button>
						<button class="btn btn-success" onclick="add();">保存</button>
						<s:if test='addBidDto.STATUS == "10"'>
							<button class="btn btn-success" onclick="nextstep();">下一步</button>
						</s:if>
						<button class="btn btn-success" onclick="goBidList();">返回</button>
					</div>
				</div>
			</div>
		</s:form>
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
