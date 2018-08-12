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
<title>招标信息更新</title>
<script type="text/javascript">
	//上一步
	function beforestep(status) {
		$("#tmpBidStatus").val(status);
		var url = '<c:url value="/bid/showUpdBidStatusAction.action"></c:url>';
		document.mainform.action = url;
		document.mainform.submit();
	}
	
	//下一步
	function nextstep(status) {
		var tmpstatus = parseInt(status) + 10;
		//报名
		$("#tmpBidStatus").val(tmpstatus);
		document.mainform.action = '<c:url value="/bid/showUpdBidStatusAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function save(status, type) {
		//*
		var BID_NO = $("#BID_NO").val().trim();
		setBidValue();
		var PROJECT_TYPE = $("#PROJECT_TYPE").val();
		var PROJECT_NAME = $("#PROJECT_NAME").val();
		var PROJECT_MANAGER = $("#PROJECT_MANAGER").val();
		var ONLINE_DATE = $("#ONLINE_DATE").val();
		var TENDER_START_DATE = $("#TENDER_START_DATE").val();
		var SUBMIT_DATE = $("#SUBMIT_DATE").val();
		var SUBMIT_DATE2 = $("#SUBMIT_DATE2").val();
		var TENDER_OPEN_DATE = $("#TENDER_OPEN_DATE").val();
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
		//项目过程确认信息
		//备注
		var tMemo1 = $("#tMemo1").val();
		$("#MEMO1").attr("value", tMemo1);
		var MEMO1 = $("#MEMO1").val();
		
		//计划价格
		var PROJ_PLAN_PRICE = $("#PROJ_PLAN_PRICE").val();
		//限价
		var PROJ_ASTRICT_PRICE = $("#PROJ_ASTRICT_PRICE").val();
		//批文
		var tmpPROJ_APPROVAL = $("#tmpPROJ_APPROVAL").val();
		$("#PROJ_APPROVAL").attr("value", tmpPROJ_APPROVAL);
		var PROJ_APPROVAL = $("#PROJ_APPROVAL").val();
		
		//发票1
		var RECEIPT1_DATE = $("#RECEIPT1_DATE").val();
		var RECEIPT1_STAFF = $("#RECEIPT1_STAFF").val();
		var RECEIPT1_AGENT_COMMISSION = $("#RECEIPT1_AGENT_COMMISSION").val();
		var RECEIPT1_NO = $("#RECEIPT1_NO").val();
		var RECEIPT1_RECEIVER = $("#RECEIPT1_RECEIVER").val();
		var RECEIPT1_VALUE_DATE = $("#RECEIPT1_VALUE_DATE").val();
		//var BID_COMMISION_WANYUAN = $("#BID_COMMISION_WANYUAN").val();
		var BID_COMMISION = $("#BID_COMMISION").val();
		//发票2
		var RECEIPT2_NO = $("#RECEIPT2_NO").val();
		var RECEIPT2_DATE = $("#RECEIPT2_DATE").val();
		var RECEIPT2_POST_NO = $("#RECEIPT2_POST_NO").val();
		var RECEIPT2_EXPRESS_DATE = $("#RECEIPT2_EXPRESS_DATE").val();
		
		var BID_AGENT_PRICE_WANYUAN = $("#BID_AGENT_PRICE_WANYUAN").val();
		
		if(BID_NO == "") {
			alert("招标编号不能为空！");
			$("#BID_NO").focus();
			return;
		}
		if(PROJECT_TYPE == "") {
			alert("请选择分类！");
			$("#radioProjectType").focus();
			return;
		}
		
		if(PROJECT_MANAGER.length > 6) {
			alert("担当者不能超过6个字！");
			$("#PROJECT_MANAGER").focus();
			return;
		}
		
		if(PROJECT_NAME == "") {
			alert("项目名称不能为空！");
			$("#PROJECT_NAME").focus();
			return;
		}
		//if(AGENT_CO_MANAGER_TEL != "" && !isMobile(AGENT_CO_MANAGER_TEL) && !isTelephone(AGENT_CO_MANAGER_TEL)) {
		//	alert("请输入正确的委托公司电话！");
		//	$("#AGENT_CO_MANAGER_TEL").focus();
		//	return;
		//}
		
		var agentCoManager = $("#agentCoManager").val();
		if(agentCoManager.length > 6) {
			alert("委托公司联系人不能超过6个字！");
			$("#agentCoManager").focus();
			return;
		}
		
		if(AGENT_CO_MAIL != "" && !isMail(AGENT_CO_MAIL)) {
			alert("请输入正确的委托公司邮箱！");
			$("#AGENT_CO_MAIL").focus();
			//$("#agent_mail_pr").focus();
			return;
		}
		//专业公司信息
		//if(PROF_CO_MANAGER_TEL != "" && !isMobile(PROF_CO_MANAGER_TEL) && !isTelephone(PROF_CO_MANAGER_TEL)) {
		//	alert("请输入正确的专业公司电话！");
		//	$("#PROF_CO_MANAGER_TEL").focus();
		//	return;
		//}
		
		var profCoManager = $("#profCoManager").val();
		if(profCoManager.length > 6) {
			alert("专业公司联系人不能超过6个字！");
			$("#profCoManager").focus();
			return;
		}
		
		if(PROF_CO_MAIL != "" && !isMail(PROF_CO_MAIL)) {
			alert("请输入正确的专业公司邮箱！");
			//$("#prof_mail_pr").focus();
			$("#PROF_CO_MAIL").focus();
			return;
		}
		if(PROJ_APPROVAL.length > 60) {
			alert("批文不能超过60个字！");
			$("#tmpPROJ_APPROVAL").focus();
			return;
		}
		if(PROJ_PLAN_PRICE != "" && !numberCheck(PROJ_PLAN_PRICE)) {
			alert("计划价格格式不正确！");
			$("#PROJ_PLAN_PRICE").focus();
			return;
		}
		if(PROJ_ASTRICT_PRICE != "" && !numberCheck(PROJ_ASTRICT_PRICE)) {
			alert("限价格式不正确！");
			$("#PROJ_ASTRICT_PRICE").focus();
			return;
		}
		if(MEMO1.length > 200) {
			alert("备注不能超过200个字！");
			$("#tMemo1").focus();
			return;
		}
		//项目过程确认信息
		//投标公司信息
		//var rows = document.getElementById("bidCompData").rows;
		//if(rows.length > 10) {
		//	alert("投标公司最多不能超过10个！");
		//	$("#bidCompData").focus();
		//	return;
		//}
		//投标公司信息列表
		setBidCompList();
		//评审专家信息列表
		setBidExpertLibList();
		//发票1
		if(RECEIPT1_STAFF.length > 6) {
			alert("开票人不能超过6个字！");
			$("#RECEIPT1_STAFF").focus();
			return;
		}
		if(RECEIPT1_AGENT_COMMISSION != "" && !isReal(RECEIPT1_AGENT_COMMISSION)) {
			alert("代理费格式不正确！");
			$("#RECEIPT1_AGENT_COMMISSION").focus();
			return;
		}
		if(RECEIPT1_RECEIVER.length > 6) {
			alert("接受人不能超过6个字！");
			$("#RECEIPT1_RECEIVER").focus();
			return;
		}
/*		if(BID_COMMISION_WANYUAN != "" && !isReal(BID_COMMISION_WANYUAN)) {
			//alert("评标费格式不正确！");
			alert("专家评审费格式不正确！");
			$("#BID_COMMISION_WANYUAN").focus();
			return;
		}*/
		if(BID_COMMISION != "" && !isReal(BID_COMMISION)) {
			//alert("评标费格式不正确！");
			alert("专家评审费格式不正确！");
			$("#BID_COMMISION").focus();
			return;
		}
		if(BID_AGENT_PRICE_WANYUAN != "" && !isReal(BID_AGENT_PRICE_WANYUAN)) {
			alert("招标代理费金额格式不正确！");
			$("#BID_AGENT_PRICE_WANYUAN").focus();
			return;
		}
		if(RECEIPT1_AGENT_COMMISSION == "") {
			$("#RECEIPT1_AGENT_COMMISSION").attr("value", 0);
		}
/*		if(BID_COMMISION_WANYUAN == "") {
			$("#BID_COMMISION").attr("value", 0);
			$("#BID_COMMISION_WANYUAN").attr("value", 0);
		} else {
			//数据库保存单位是元，页面显示是万元，所以这里要乘以10000
			$("#BID_COMMISION").attr("value", parseFloat(BID_COMMISION_WANYUAN) * 10000);
		}*/
		if(BID_COMMISION == "") {
			$("#BID_COMMISION").attr("value", 0);
			//$("#BID_COMMISION_WANYUAN").attr("value", 0);
		} else {
			//数据库保存单位是元，页面显示是万元，所以这里要乘以10000
			//$("#BID_COMMISION").attr("value", parseFloat(BID_COMMISION_WANYUAN) * 10000);
		}
		//招标代理费金额
		if(BID_AGENT_PRICE_WANYUAN == "") {
			$("#BID_AGENT_PRICE").attr("value", 0);
			$("#BID_AGENT_PRICE_WANYUAN").attr("value", 0);
		} else {
			//数据库保存单位是元，页面显示是万元，所以这里要乘以10000
			//$("#BID_AGENT_PRICE").attr("value", parseFloat(BID_AGENT_PRICE_WANYUAN) * 10000);
			// as user's requirement change 10000 unit to 1 . 20160711 Pei  Therefore BID_AGENT_PRICE_WANYUAN means YUAN
			$("#BID_AGENT_PRICE").attr("value", parseFloat(BID_AGENT_PRICE_WANYUAN));
		}
		
		if(PROJ_PLAN_PRICE == "") {
			$("#PROJ_PLAN_PRICE").attr("value", 0);
		}
		if(PROJ_ASTRICT_PRICE == "") {
			$("#PROJ_ASTRICT_PRICE").attr("value", 0);
		}

		var s = getBidEditProject();
		
		$("#tmpUpdType").val(type);
		$("#tmpBidStatus").val(status);
		
		//判断报名要求是否更改，更改了提示确定是否更改
		var APPLY_REQUIRE_OLD = $("#APPLY_REQUIRE_OLD").val();
		var APPLY_REQUIRE = $("#APPLY_REQUIRE").val();
		if(APPLY_REQUIRE_OLD != "") {
			if(APPLY_REQUIRE != APPLY_REQUIRE_OLD) {
				if(!confirm("报名要求被修改了，可能导致报名内容被删除，确定修改吗？")) {
					return;
				}
			}
		}
		
		if(s != "") {
			if(confirm("本次修改的内容有：\n" + s + "确定修改吗？")) {
				document.mainform.action = '<c:url value="/bid/updBidStatusAction.action"></c:url>';
				document.mainform.submit();
			}
		} else {
			//alert("没有修改内容！");
			//if(confirm("确定下一步吗？")) {
				document.mainform.action = '<c:url value="/bid/updBidStatusAction.action"></c:url>';
				document.mainform.submit();
			//}
		}
		//*/
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
		//日期
		$("#ONLINE_DATE").attr("value", $("#onlineDate").val());
		$("#SUBMIT_DATE").attr("value", $("#submitDate").val());
		$("#SUBMIT_DATE2").attr("value", $("#submitDate2").val());
		
		$("#RESERVE_DATE1").attr("value", $("#reserveDate1").val());
		$("#RESERVE_DATE2").attr("value", $("#reserveDate2").val());
		$("#RESERVE_DATE3").attr("value", $("#reserveDate3").val());
		$("#RESERVE_DATE4").attr("value", $("#reserveDate4").val());
		$("#RESERVE_DATE5").attr("value", $("#reserveDate5").val());
		$("#RESERVE_DATE6").attr("value", $("#reserveDate6").val());
		$("#RESERVE_DATE7").attr("value", $("#reserveDate7").val());
		
		$("#TENDER_START_DATE").attr("value", $("#tenderStartDate").val());
		$("#TENDER_OPEN_DATE").attr("value", $("#tenderOpenDate").val());
		$("#RECEIPT1_DATE").attr("value", $("#receipt1Date").val());
		$("#RECEIPT1_VALUE_DATE").attr("value", $("#receipt1ValueDate").val());
		$("#RECEIPT2_DATE").attr("value", $("#receipt2Date").val());
		$("#RECEIPT2_EXPRESS_DATE").attr("value", $("#receipt2ExpressDate").val());
		$("#INSERT_DATE").attr("value", $("#insertDate").val());
		$("#UPDATE_DATE").attr("value", $("#updateDate").val());
		
		$("#BID_NOTICE_DATE").val($("#bidNoticeDate").val());
		$("#BID_NOTICE_DATE2").val($("#bidNoticeDate2").val());
		$("#BID_MESSAGE_DATE").val($("#bidMessageDate").val());
		$("#MATERIAL_EXPRESS_DATE").val($("#materialExpressDate").val());
		
		//新增招标资料费
		var needMaterialPrice = "";
		var needMaterialPriceList = document.getElementsByName("needMaterialPrice");
		for(var i = 0; i < needMaterialPriceList.length; i++) {
			if(needMaterialPriceList[i].checked) {
				needMaterialPrice = needMaterialPriceList[i].value;
				break;
			}
		}
		$("#BID_NEED_MATERIAL_PRICE").val(needMaterialPrice);
		//报名要求
		$("#APPLY_REQUIRE").val($("#tmpApplyRequire").val());
		//项目完成情况
		var finishStatus = "";
		var finishStatusList = document.getElementsByName("finishStatus");
		for(var i = 0; i < finishStatusList.length; i++) {
			if(finishStatusList[i].checked) {
				finishStatus = finishStatusList[i].value;
				break;
			}
		}
		$("#FINISH_STATUS").val(finishStatus);
		$("#FINISH_NOTE").val($("#tmpFINISH_NOTE").val());
		
		
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
	
	//添加投标公司
	function addBidComp() {
		setBidCompList();
		var rows = document.getElementById("bidCompData").rows;
		var BID_CO_SEQ = rows.length + 1;
		if(BID_CO_SEQ > 10) {
			//alert("投标公司已经有10个了！");
			//return;
		}
		var BID_NO = $("#BID_NO").val().trim();
		//if(BID_NO == "") {
		//	alert("请输入招标编号！");
		//	$("#BID_NO").focus();
		//	return;
		//}
		var rows = document.getElementById("bidCompData").rows;
		var BID_CO_SEQ = rows.length + 1;
		var url = '<c:url value="/bid/showAddBidCompAction.action"></c:url>';
		url += "?showBidNo=" + BID_NO + "&showBidCoSeq=" + BID_CO_SEQ + "&date=" + new Date();
		
		//window.open(url);
		window.showModalDialog(url, window, "dialogheight:500px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	//更新投标公司
	function updBidComp() {
		//获得选择的投标公司
		var tr = null;
		var list = document.getElementsByName("bidCompRadio");
		var index = 0;
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				index = i;
				tr = list[i].parentNode.parentNode;
				break;
			}
		}
		if(tr != null) {
			var childs = tr.cells[0].getElementsByTagName("input");
			var tempBID_NO = childs[0].value;
			var tempBID_CO_SEQ = childs[1].value;
			var tempBID_CO_NAME = childs[2].value;
			var tempBID_CO_TEL = childs[3].value;
			var tempBID_BOND_WAN = childs[4].value;
			var tempBID_PAYMENT_TYPE = childs[5].value;
			var tempBID_PRICE_WAN = childs[6].value;
			var tempBID_CHECK_PRICE_WAN = childs[7].value;
			var tempBID_RESULT = childs[8].value;
			var tempBID_WIN_PRICE_WAN = childs[9].value;
			var tempBID_APPLY_PRICE_WAN = childs[10].value;
			var tempBID_VALUE_DATE = childs[11].value;
			var tempBID_RECEIPT_NO = childs[12].value;
			//发票日期
			var tempRESERVE_DATE1 = childs[13].value;
			var tempBID_REFUND_SIGN = childs[14].value;
			
			var tempREFOUND_DEPOSIT_DATE = childs[15].value;
			var tempMEMO1 = childs[16].value;
			
			var tempBID_CO_MANAGER = childs[17].value;
			var tempBID_CO_ADD = childs[18].value;
			var tempBID_CO_PS = childs[19].value;
			var tempBID_CO_NO = childs[20].value;
			var tempSaveBidCompApply = childs[21].value;
			
			//负责人
			var tempRESERVE2 = childs[22].value;
			var tempRESERVE3 = childs[23].value;
			var tempRESERVE4 = childs[24].value;
			var tempRESERVE5 = childs[25].value;
			var tempRESERVE6 = childs[26].value;
			var tempRESERVE7 = childs[27].value;
			var tempRESERVE8 = childs[28].value;
			//保证金入账日期
			var tempRESERVE_DATE2 = childs[29].value;
						
			$("#tempBID_COMP_INDEX").attr("value", index);
			$("#tempBID_NO").attr("value", tempBID_NO);
			$("#tempBID_CO_SEQ").attr("value", tempBID_CO_SEQ);
			$("#tempBID_CO_NAME").attr("value", tempBID_CO_NAME);
			$("#tempBID_CO_TEL").attr("value", tempBID_CO_TEL);
			$("#tempBID_BOND_WAN").attr("value", tempBID_BOND_WAN);
			$("#tempBID_PAYMENT_TYPE").attr("value", tempBID_PAYMENT_TYPE);
			$("#tempBID_PRICE_WAN").attr("value", tempBID_PRICE_WAN);
			$("#tempBID_CHECK_PRICE_WAN").attr("value", tempBID_CHECK_PRICE_WAN);
			$("#tempBID_RESULT").attr("value", tempBID_RESULT);
			$("#tempBID_WIN_PRICE_WAN").attr("value", tempBID_WIN_PRICE_WAN);
			$("#tempBID_APPLY_PRICE_WAN").attr("value", tempBID_APPLY_PRICE_WAN);
			$("#tempBID_VALUE_DATE").attr("value", tempBID_VALUE_DATE);
			$("#tempBID_RECEIPT_NO").attr("value", tempBID_RECEIPT_NO);
			
			$("#tempRESERVE_DATE1").attr("value", tempRESERVE_DATE1);
			$("#tempBID_REFUND_SIGN").attr("value", tempBID_REFUND_SIGN);
			$("#tempREFOUND_DEPOSIT_DATE").attr("value", tempREFOUND_DEPOSIT_DATE);
			
			$("#tempMEMO1").attr("value", tempMEMO1);
			
			$("#tempBID_CO_MANAGER").attr("value", tempBID_CO_MANAGER);
			$("#tempBID_CO_ADD").attr("value", tempBID_CO_ADD);
			$("#tempBID_CO_PS").attr("value", tempBID_CO_PS);
			$("#tempBID_CO_NO").attr("value", tempBID_CO_NO);
			$("#tempSaveBidCompApply").attr("value", tempSaveBidCompApply);

			$("#tempRESERVE2").attr("value", tempRESERVE2);
			$("#tempRESERVE3").attr("value", tempRESERVE3);
			$("#tempRESERVE4").attr("value", tempRESERVE4);
			$("#tempRESERVE5").attr("value", tempRESERVE5);
			$("#tempRESERVE6").attr("value", tempRESERVE6);
			$("#tempRESERVE7").attr("value", tempRESERVE7);
			$("#tempRESERVE8").attr("value", tempRESERVE8);
			$("#tempRESERVE_DATE2").attr("value", tempRESERVE_DATE2);
			
			var url = '<c:url value="/bid/showUpdBidCompAction.action"></c:url>' + "?date=" + new Date();
			window.showModalDialog(url, window, "dialogheight:500px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
		} else {
			alert("请选择投标公司！");
		}
	}
	
	//删除投标公司
	function delBidComp() {
		//获得选择的投标公司
		var list = document.getElementsByName("bidCompRadio");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				if(confirm("确定删除该投标公司吗？")) {
					var tr = list[i].parentNode.parentNode;
					var tbody = list[i].parentNode.parentNode.parentNode;
					tbody.removeChild(tr);
					break;
				}
				return;
			}
		}
		refreshBidCompData();
	}
	
	//刷新投标公司序号和斑马线
	function refreshBidCompData() {
		var rows = document.getElementById("bidCompData").rows;
		for(var i = 0; i < rows.length; i++) {
			var num = i + 1;
			rows[i].cells[3].innerHTML = num;
			//斑马线
			var cls = "";
			if(i % 2 == 0) {
				cls = "tr_bg";
			} else {
				cls = "";
			}
			rows[i].className = cls;
		}
	}
	
	//评审专家
	function showAddExpertLib() {
		setBidExpertLibList();
		//var url = '<c:url value="/bid/showAddBidExpertAction.action"></c:url>' + "?date=" + new Date();
		var url = '<c:url value="/bid/showGetBidExportActionNew.action"></c:url>' + "?date=" + new Date();
		window.showModalDialog(url, window, "dialogheight:730px;dialogwidth:920px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	//删除评审专家
	function delBidExpertLib() {
		//获得选择的投标公司
		var list = document.getElementsByName("bidExpertRadio");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				if(confirm("确定删除该评审专家吗？")) {
					var tr = list[i].parentNode.parentNode;
					var tbody = list[i].parentNode.parentNode.parentNode;
					tbody.removeChild(tr);
					break;
				}
				return;
			}
		}
		refreshBidExpertLibData();
	}
	
	//刷新评审专家列表序号和斑马线
	function refreshBidExpertLibData() {
		var rows = document.getElementById("bidExportData").rows;
		for(var i = 0; i < rows.length; i++) {
			var num = i + 1;
			rows[i].cells[2].innerHTML = num;
			//斑马线
			var cls = "";
			if(i % 2 == 0) {
				cls = "tr_bg";
			} else {
				cls = "";
			}
			rows[i].className = cls;
		}
		
		//刷新评审专家
		var list = document.getElementsByName("bidExpertRadio");
		var BID_EXPERT_LIST = "";
		for(var i = 0; i < list.length; i++) {
			BID_EXPERT_LIST += list[i].value + ",";
		}
		document.getElementById("BID_EXPERT_LIST").value = BID_EXPERT_LIST;
	}
	
	//专家列表
	function setBidExpertLibList() {
		$("#expertTable").empty();
		var rows = document.getElementById("bidExportData").rows;
		for(var i = 0; i < rows.length; i++) {
			var childs = rows[i].cells[0].getElementsByTagName("input");
			var EXPERT_NAME = childs[0].value;
			var EXPERT_COMP = childs[1].value;
			var EXPERT_MAJOR_NAME = childs[2].value;
			var EXPERT_QULI = childs[3].value;
			var EXPERT_TEL1 = childs[4].value;
			var MEMO1 = childs[5].value;
			var EXPERT_MAJOR = childs[6].value;
			
			var tr = document.createElement("tr");
			var td = document.createElement("td");
			
			td.appendChild(createInput("listExpertLibTmp[" + i + "].EXPERT_NAME", EXPERT_NAME));
			td.appendChild(createInput("listExpertLibTmp[" + i + "].EXPERT_COMP", EXPERT_COMP));
			td.appendChild(createInput("listExpertLibTmp[" + i + "].EXPERT_MAJOR_NAME", EXPERT_MAJOR_NAME));
			td.appendChild(createInput("listExpertLibTmp[" + i + "].EXPERT_QULI", EXPERT_QULI));
			td.appendChild(createInput("listExpertLibTmp[" + i + "].EXPERT_TEL1", EXPERT_TEL1));
			td.appendChild(createInput("listExpertLibTmp[" + i + "].MEMO1", MEMO1));
			td.appendChild(createInput("listExpertLibTmp[" + i + "].EXPERT_MAJOR", EXPERT_MAJOR));
			
			tr.appendChild(td);
			document.getElementById("expertTable").appendChild(tr);
		}
	}
	
	//投标公司列表
	function setBidCompList() {
		var BID_NEED_MATERIAL_PRICE = $("#BID_NEED_MATERIAL_PRICE").val();
		var tmpBidStatus = $("#tmpBidStatus").val();
		$("#compTable").empty();
		var rows = document.getElementById("bidCompData").rows;
		var bidValueDate = document.getElementsByName("bidValueDate");
		var refoundDepositDate = document.getElementsByName("refoundDepositDate");
		var reserveDate1 = document.getElementsByName("reserveDate1");
		var reserveDate2 = document.getElementsByName("reserveDate2");
		for(var i = 0; i < rows.length; i++) {
			var childs = rows[i].cells[0].getElementsByTagName("input");
			var BID_NO = childs[0].value;
			var BID_CO_SEQ = childs[1].value;
			var BID_CO_NAME = childs[2].value;
			var BID_CO_TEL = childs[3].value;
			var BID_BOND_WAN = childs[4].value;
			//保证金入账时间
			var RESERVE_DATE2 = "";
			if(tmpBidStatus == "30") {
				var RESERVE_DATE2 = reserveDate2[i].value;
			} else {
				RESERVE_DATE2 = childs[29].value;
			}
			var BID_PAYMENT_TYPE = childs[5].value;
			var BID_PRICE_WAN = childs[6].value;
			var BID_CHECK_PRICE_WAN = childs[7].value;
			var BID_RESULT = childs[8].value;
			var BID_WIN_PRICE_WAN = childs[9].value;
			var BID_APPLY_PRICE_WAN = childs[10].value;
			//到账日期
			var BID_VALUE_DATE = "";
			if(tmpBidStatus == "30") {
				BID_VALUE_DATE = bidValueDate[i].value;
			} else {
				BID_VALUE_DATE = childs[11].value;
			}
			
			var BID_RECEIPT_NO = childs[12].value;
			//开票日期
			var RESERVE_DATE1 = "";
			if(tmpBidStatus == "20") {
				RESERVE_DATE1 = reserveDate1[i].value;
			} else {
				RESERVE_DATE1 = childs[13].value;
			}

			var BID_REFUND_SIGN = childs[14].value;
			//退定日期
			var REFOUND_DEPOSIT_DATE = "";
			if(tmpBidStatus == "30") {
				REFOUND_DEPOSIT_DATE = refoundDepositDate[i].value;
			} else {
				REFOUND_DEPOSIT_DATE = childs[15].value;
			}
			var MEMO1 = childs[16].value;
			
			var BID_CO_MANAGER = childs[17].value;
			var BID_CO_ADD = childs[18].value;
			var BID_CO_PS = childs[19].value;
			var BID_CO_NO = childs[20].value;
			var saveBidCompApply = childs[21].value;
			
			var RESERVE2 = childs[22].value;
			var RESERVE3 = childs[23].value;
			var RESERVE4 = childs[24].value;
			var RESERVE5 = childs[25].value;
			var RESERVE6 = childs[26].value;
			var RESERVE7 = childs[27].value;
			var RESERVE8 = childs[28].value;

			var tr = document.createElement("tr");
			//投标公司
			var td = document.createElement("td");
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_NO", BID_NO));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_SEQ", BID_CO_SEQ));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_NAME", BID_CO_NAME));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_TEL", BID_CO_TEL));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_BOND_WAN", BID_BOND_WAN));
			td.appendChild(createInput("listBidCompTmp[" + i + "].RESERVE_DATE2", RESERVE_DATE2));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_PAYMENT_TYPE", BID_PAYMENT_TYPE));
			td.appendChild(createInput("listBidCompTmp[" + i + "].REFOUND_DEPOSIT_DATE", REFOUND_DEPOSIT_DATE));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_PRICE_WAN", BID_PRICE_WAN));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CHECK_PRICE_WAN", BID_CHECK_PRICE_WAN));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_RESULT", BID_RESULT));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_WIN_PRICE_WAN", BID_WIN_PRICE_WAN));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_APPLY_PRICE_WAN", BID_APPLY_PRICE_WAN));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_VALUE_DATE", BID_VALUE_DATE));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_RECEIPT_NO", BID_RECEIPT_NO));
			
			td.appendChild(createInput("listBidCompTmp[" + i + "].RESERVE_DATE1", RESERVE_DATE1));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_REFUND_SIGN", BID_REFUND_SIGN));
			
			td.appendChild(createInput("listBidCompTmp[" + i + "].MEMO1", MEMO1));
			
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_MANAGER", BID_CO_MANAGER));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_ADD", BID_CO_ADD));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_PS", BID_CO_PS));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_NO", BID_CO_NO));
			td.appendChild(createInput("listBidCompTmp[" + i + "].saveBidCompApply", saveBidCompApply));
			
			td.appendChild(createInput("listBidCompTmp[" + i + "].RESERVE2", RESERVE2));
			td.appendChild(createInput("listBidCompTmp[" + i + "].RESERVE3", RESERVE3));
			td.appendChild(createInput("listBidCompTmp[" + i + "].RESERVE4", RESERVE4));
			td.appendChild(createInput("listBidCompTmp[" + i + "].RESERVE5", RESERVE5));
			td.appendChild(createInput("listBidCompTmp[" + i + "].RESERVE6", RESERVE6));
			td.appendChild(createInput("listBidCompTmp[" + i + "].RESERVE7", RESERVE7));
			td.appendChild(createInput("listBidCompTmp[" + i + "].RESERVE8", RESERVE8));

			tr.appendChild(td);
			document.getElementById("compTable").appendChild(tr);
		}
	}
	
	function createInput(id, value) {
		var input = document.createElement("input");
		input.type = "text";
		input.name = id;
		input.value = value;
		return input;
	}
	
	function getBidEditProject() {
		var tmpBidStatus = $("#tmpBidStatus").val();
		var BID_NO_OLD = $("#BID_NO_OLD").val();
		var PROJECT_TYPE_OLD = $("#PROJECT_TYPE_OLD").val();
		var PROJECT_NAME_OLD = $("#PROJECT_NAME_OLD").val();
		var PROJECT_MANAGER_OLD = $("#PROJECT_MANAGER_OLD").val();
		var ONLINE_DATE_OLD = $("#ONLINE_DATE_OLD").val();
		var SUBMIT_DATE_OLD = $("#SUBMIT_DATE_OLD").val();
		var SUBMIT_DATE_OLD2 = $("#SUBMIT_DATE_OLD2").val();
		var TENDER_START_DATE_OLD = $("#TENDER_START_DATE_OLD").val();
		var TENDER_OPEN_DATE_OLD = $("#TENDER_OPEN_DATE_OLD").val();
		var AGENT_NO_OLD = $("#AGENT_NO_OLD").val();
		var AGENT_CO_NAME_OLD = $("#AGENT_CO_NAME_OLD").val();
		var AGENT_CO_MANAGER_OLD = $("#AGENT_CO_MANAGER_OLD").val();
		var AGENT_CO_MANAGER_TEL_OLD = $("#AGENT_CO_MANAGER_TEL_OLD").val();
		var AGENT_CO_POST_ADDRESS_OLD = $("#AGENT_CO_POST_ADDRESS_OLD").val();
		var AGENT_CO_MAIL_OLD = $("#AGENT_CO_MAIL_OLD").val();
		var PROF_NO_OLD = $("#PROF_NO_OLD").val();
		var PROF_CO_NAME_OLD = $("#PROF_CO_NAME_OLD").val();
		var PROF_CO_MANAGER_OLD = $("#PROF_CO_MANAGER_OLD").val();
		var PROF_CO_MANAGER_TEL_OLD = $("#PROF_CO_MANAGER_TEL_OLD").val();
		var PROF_CO_POST_ADDRESS_OLD = $("#PROF_CO_POST_ADDRESS_OLD").val();
		var PROF_CO_MAIL_OLD = $("#PROF_CO_MAIL_OLD").val();
		
		var PROJ_APPROVAL_OLD = $("#PROJ_APPROVAL_OLD").val();
		var PROJ_PLAN_PRICE_OLD = $("#PROJ_PLAN_PRICE_OLD").val();
		var PROJ_ASTRICT_PRICE_OLD = $("#PROJ_ASTRICT_PRICE_OLD").val();
		
		//招标代理支付方
		var BID_AGENT_PAY_OLD = $("#BID_AGENT_PAY_OLD").val();
		var BID_NEED_MATERIAL_PRICE_OLD = $("#BID_NEED_MATERIAL_PRICE_OLD").val();
		
		var FINISH_NOTE_OLD = $("#FINISH_NOTE_OLD").val();
		var FINISH_STATUS_OLD = $("#FINISH_STATUS_OLD").val();
		var BID_AGENT_PRICE_WANYUAN_OLD = $("#BID_AGENT_PRICE_WANYUAN_OLD").val();
		var MATERIAL_EXPRESS_DATE_OLD = $("#MATERIAL_EXPRESS_DATE_OLD").val();
		var BID_MESSAGE_DATE_OLD = $("#BID_MESSAGE_DATE_OLD").val();
		var APPLY_REQUIRE_OLD = $("#APPLY_REQUIRE_OLD").val();
		var BID_NOTICE_DATE_OLD = $("#BID_NOTICE_DATE_OLD").val();
		var BID_NOTICE_DATE_OLD2 = $("#BID_NOTICE_DATE_OLD2").val();
		
		var TENDER_ONLINE_OLD = $("#TENDER_ONLINE_OLD").val();
		var TENDER_DOWNLOAD_OLD = $("#TENDER_DOWNLOAD_OLD").val();
		var APPLY_FORM_EDIT_OLD = $("#APPLY_FORM_EDIT_OLD").val();
		var APPLY_FORM_VERIFY_OLD = $("#APPLY_FORM_VERIFY_OLD").val();
		var APPLY_FORM_MERGE_OLD = $("#APPLY_FORM_MERGE_OLD").val();
		var EXPERT_NAME_OFFERED_OLD = $("#EXPERT_NAME_OFFERED_OLD").val();
		var EXPERT_INFORMED_OLD = $("#EXPERT_INFORMED_OLD").val();
		var EXPERT_NAME_CONFIRMED_OLD = $("#EXPERT_NAME_CONFIRMED_OLD").val();
		var CLARIFY_DOC_OLD = $("#CLARIFY_DOC_OLD").val();
		var SUPPORT_DOC_OLD = $("#SUPPORT_DOC_OLD").val();
		var SUPPORT_DOC_SENT_OLD = $("#SUPPORT_DOC_SENT_OLD").val();
		var BIDDER_REPLY_OLD = $("#BIDDER_REPLY_OLD").val();
		var OPEN_RESULT_OLD = $("#OPEN_RESULT_OLD").val();
		var OPEN_VERIFY_OLD = $("#OPEN_VERIFY_OLD").val();
		var INFORM_SENT_OLD = $("#INFORM_SENT_OLD").val();
		var INFORM_CONTRACT_OLD = $("#INFORM_CONTRACT_OLD").val();
		var ATTACH_POST_A_OLD = $("#ATTACH_POST_A_OLD").val();
		var CONTRACT_VERIFY_OLD = $("#CONTRACT_VERIFY_OLD").val();
		var COMMENT_POST_OLD = $("#COMMENT_POST_OLD").val();
		var BID_REOPRT_EDIT_OLD = $("#BID_REOPRT_EDIT_OLD").val();
		var BID_REPORT_VERIFY_OLD = $("#BID_REPORT_VERIFY_OLD").val();
		var BID_REPORT_SENT_OLD = $("#BID_REPORT_SENT_OLD").val();
		var BID_POST_NO_OLD = $("#BID_POST_NO_OLD").val();
		var RECEIPT1_AGENT_COMMISSION_OLD = $("#RECEIPT1_AGENT_COMMISSION_OLD").val();
		var RECEIPT1_DATE_OLD = $("#RECEIPT1_DATE_OLD").val();
		var RECEIPT1_STAFF_OLD = $("#RECEIPT1_STAFF_OLD").val();
		var RECEIPT1_NO_OLD = $("#RECEIPT1_NO_OLD").val();
		var RECEIPT1_VALUE_DATE_OLD = $("#RECEIPT1_VALUE_DATE_OLD").val();
//		var BID_COMMISION_WANYUAN_OLD = $("#BID_COMMISION_WANYUAN_OLD").val();
		var BID_COMMISION_OLD = $("#BID_COMMISION_OLD").val();
		var RECEIPT1_RECEIVER_OLD = $("#RECEIPT1_RECEIVER_OLD").val();
		var RECEIPT2_NO_OLD = $("#RECEIPT2_NO_OLD").val();
		var RECEIPT2_DATE_OLD = $("#RECEIPT2_DATE_OLD").val();
		var RECEIPT2_POST_NO_OLD = $("#RECEIPT2_POST_NO_OLD").val();
		var RECEIPT2_EXPRESS_DATE_OLD = $("#RECEIPT2_EXPRESS_DATE_OLD").val();
		var MEMO1_OLD = $("#MEMO1_OLD").val();
		var BID_CO_LIST_OLD = $("#BID_CO_LIST_OLD").val();
		var BID_EXPERT_LIST_OLD = $("#BID_EXPERT_LIST_OLD").val();
		var RESERVE_DATE1_OLD = $("#RESERVE_DATE1_OLD").val();
		var RESERVE_DATE2_OLD = $("#RESERVE_DATE2_OLD").val();
		var RESERVE_DATE3_OLD = $("#RESERVE_DATE3_OLD").val();
		var RESERVE_DATE4_OLD = $("#RESERVE_DATE4_OLD").val();
		var RESERVE_DATE5_OLD = $("#RESERVE_DATE5_OLD").val();
		var RESERVE_DATE6_OLD = $("#RESERVE_DATE6_OLD").val();
		var RESERVE_DATE7_OLD = $("#RESERVE_DATE7_OLD").val();
		var RESERVE1_OLD = $("#RESERVE1_OLD").val();
		var RESERVE2_OLD = $("#RESERVE2_OLD").val();
		
		var BID_NO = $("#BID_NO").val();
		var PROJECT_TYPE = $("#PROJECT_TYPE").val();
		var PROJECT_NAME = $("#PROJECT_NAME").val();
		var PROJECT_MANAGER = $("#PROJECT_MANAGER").val();
		var ONLINE_DATE = $("#ONLINE_DATE").val();
		var SUBMIT_DATE = $("#SUBMIT_DATE").val();
		var SUBMIT_DATE2 = $("#SUBMIT_DATE2").val();
		var TENDER_START_DATE = $("#TENDER_START_DATE").val();
		var TENDER_OPEN_DATE = $("#TENDER_OPEN_DATE").val();
		var AGENT_NO = $("#AGENT_NO").val();
		var AGENT_CO_NAME = $("#AGENT_CO_NAME").val();
		var AGENT_CO_MANAGER = $("#AGENT_CO_MANAGER").val();
		var AGENT_CO_MANAGER_TEL = $("#AGENT_CO_MANAGER_TEL").val();
		var AGENT_CO_POST_ADDRESS = $("#AGENT_CO_POST_ADDRESS").val();
		var AGENT_CO_MAIL = $("#AGENT_CO_MAIL").val();
		var PROF_NO = $("#PROF_NO").val();
		var PROF_CO_NAME = $("#PROF_CO_NAME").val();
		var PROF_CO_MANAGER = $("#PROF_CO_MANAGER").val();
		var PROF_CO_MANAGER_TEL = $("#PROF_CO_MANAGER_TEL").val();
		var PROF_CO_POST_ADDRESS = $("#PROF_CO_POST_ADDRESS").val();
		var PROF_CO_MAIL = $("#PROF_CO_MAIL").val();
		
		var PROJ_APPROVAL = $("#PROJ_APPROVAL").val();
		var PROJ_PLAN_PRICE = $("#PROJ_PLAN_PRICE").val();
		var PROJ_ASTRICT_PRICE = $("#PROJ_ASTRICT_PRICE").val();
		
		//招标代理支付方
		var BID_AGENT_PAY = $("#BID_AGENT_PAY").val();
		var BID_NEED_MATERIAL_PRICE = $("#BID_NEED_MATERIAL_PRICE").val();
		var FINISH_NOTE = $("#FINISH_NOTE").val();
		var FINISH_STATUS = $("#FINISH_STATUS").val();
		var MATERIAL_EXPRESS_DATE = $("#MATERIAL_EXPRESS_DATE").val();
		var BID_MESSAGE_DATE = $("#BID_MESSAGE_DATE").val();
		var APPLY_REQUIRE = $("#APPLY_REQUIRE").val();
		var BID_NOTICE_DATE = $("#BID_NOTICE_DATE").val();
		var BID_NOTICE_DATE2 = $("#BID_NOTICE_DATE2").val();
		var BID_AGENT_PRICE_WANYUAN = $("#BID_AGENT_PRICE_WANYUAN").val();
		
		var TENDER_ONLINE = $("#TENDER_ONLINE").val();
		var TENDER_DOWNLOAD = $("#TENDER_DOWNLOAD").val();
		var APPLY_FORM_EDIT = $("#APPLY_FORM_EDIT").val();
		var APPLY_FORM_VERIFY = $("#APPLY_FORM_VERIFY").val();
		var APPLY_FORM_MERGE = $("#APPLY_FORM_MERGE").val();
		var EXPERT_NAME_OFFERED = $("#EXPERT_NAME_OFFERED").val();
		var EXPERT_INFORMED = $("#EXPERT_INFORMED").val();
		var EXPERT_NAME_CONFIRMED = $("#EXPERT_NAME_CONFIRMED").val();
		var CLARIFY_DOC = $("#CLARIFY_DOC").val();
		var SUPPORT_DOC = $("#SUPPORT_DOC").val();
		var SUPPORT_DOC_SENT = $("#SUPPORT_DOC_SENT").val();
		var BIDDER_REPLY = $("#BIDDER_REPLY").val();
		var OPEN_RESULT = $("#OPEN_RESULT").val();
		var OPEN_VERIFY = $("#OPEN_VERIFY").val();
		var INFORM_SENT = $("#INFORM_SENT").val();
		var INFORM_CONTRACT = $("#INFORM_CONTRACT").val();
		var ATTACH_POST_A = $("#ATTACH_POST_A").val();
		var CONTRACT_VERIFY = $("#CONTRACT_VERIFY").val();
		var COMMENT_POST = $("#COMMENT_POST").val();
		var BID_REOPRT_EDIT = $("#BID_REOPRT_EDIT").val();
		var BID_REPORT_VERIFY = $("#BID_REPORT_VERIFY").val();
		var BID_REPORT_SENT = $("#BID_REPORT_SENT").val();
		var BID_POST_NO = $("#BID_POST_NO").val();
		var RECEIPT1_AGENT_COMMISSION = $("#RECEIPT1_AGENT_COMMISSION").val();
		var RECEIPT1_DATE = $("#RECEIPT1_DATE").val();
		var RECEIPT1_STAFF = $("#RECEIPT1_STAFF").val();
		var RECEIPT1_NO = $("#RECEIPT1_NO").val();
		var RECEIPT1_VALUE_DATE = $("#RECEIPT1_VALUE_DATE").val();
		//var BID_COMMISION_WANYUAN = $("#BID_COMMISION_WANYUAN").val();
		var BID_COMMISION = $("#BID_COMMISION").val();		
		var RECEIPT1_RECEIVER = $("#RECEIPT1_RECEIVER").val();
		var RECEIPT2_NO = $("#RECEIPT2_NO").val();
		var RECEIPT2_DATE = $("#RECEIPT2_DATE").val();
		var RECEIPT2_POST_NO = $("#RECEIPT2_POST_NO").val();
		var RECEIPT2_EXPRESS_DATE = $("#RECEIPT2_EXPRESS_DATE").val();
		var MEMO1 = $("#MEMO1").val();
		var BID_CO_LIST = $("#BID_CO_LIST").val();
		var BID_EXPERT_LIST = $("#BID_EXPERT_LIST").val();
		var RESERVE_DATE1 = $("#RESERVE_DATE1").val();
		var RESERVE_DATE2 = $("#RESERVE_DATE2").val();
		var RESERVE_DATE3 = $("#RESERVE_DATE3").val();
		var RESERVE_DATE4 = $("#RESERVE_DATE4").val();
		var RESERVE_DATE5 = $("#RESERVE_DATE5").val();
		var RESERVE_DATE6 = $("#RESERVE_DATE6").val();
		var RESERVE_DATE7 = $("#RESERVE_DATE7").val();
		var RESERVE1 = $("#RESERVE1").val();
		var RESERVE2 = $("#RESERVE2").val();
		
		var s = "";
		if(BID_NO != BID_NO_OLD) {
			s += "招标编号\n";
		}
		if(PROJECT_TYPE != PROJECT_TYPE_OLD) {
			s += "招标分类\n";
		}
		if(PROJECT_NAME != PROJECT_NAME_OLD) {
			s += "项目名称\n";
		}
		if(PROJECT_MANAGER != PROJECT_MANAGER_OLD) {
			s += "担当者\n";
		}
		if(ONLINE_DATE != ONLINE_DATE_OLD) {
			s += "上网公告日\n";
		}
		if(SUBMIT_DATE != SUBMIT_DATE_OLD) {
			s += "报名日期\n";
		}
		if(SUBMIT_DATE2 != SUBMIT_DATE_OLD2) {
			s += "报名终了日期\n";
		}
		if(TENDER_START_DATE != TENDER_START_DATE_OLD) {
			s += "发标日期\n";
		}
		if(TENDER_OPEN_DATE != TENDER_OPEN_DATE_OLD) {
			s += "开标时间\n";
		}
		if(RESERVE_DATE1 != RESERVE_DATE1_OLD) {
			s += "评标时间\n";
		}
		if(AGENT_NO != AGENT_NO_OLD) {
			s += "委托公司代码\n";
		}
		if(AGENT_CO_NAME != AGENT_CO_NAME_OLD) {
			s += "委托公司名称\n";
		}
		if(AGENT_CO_MANAGER != AGENT_CO_MANAGER_OLD) {
			s += "委托公司联系人\n";
		}
		if(AGENT_CO_MANAGER_TEL != AGENT_CO_MANAGER_TEL_OLD) {
			s += "委托公司电话\n";
		}
		if(AGENT_CO_POST_ADDRESS != AGENT_CO_POST_ADDRESS_OLD) {
			s += "委托公司地址\n";
		}
		if(AGENT_CO_MAIL != AGENT_CO_MAIL_OLD) {
			s += "委托公司邮箱\n";
		}
		if(PROF_NO != PROF_NO_OLD) {
			s += "专业公司代码\n";
		}
		if(PROF_CO_NAME != PROF_CO_NAME_OLD) {
			s += "专业公司名称\n";
		}
		if(PROF_CO_MANAGER != PROF_CO_MANAGER_OLD) {
			s += "专业公司负责人\n";
		}
		if(PROF_CO_MANAGER_TEL != PROF_CO_MANAGER_TEL_OLD) {
			s += "专业公司电话\n";
		}
		if(PROF_CO_POST_ADDRESS != PROF_CO_POST_ADDRESS_OLD) {
			s += "专业公司地址\n";
		}
		if(PROF_CO_MAIL != PROF_CO_MAIL_OLD) {
			s += "专业公司邮箱\n";
		}
		
		if(PROJ_APPROVAL != PROJ_APPROVAL_OLD) {
			s += "工程概况批文\n";
		}
		if(PROJ_PLAN_PRICE != PROJ_PLAN_PRICE_OLD) {
			s += "工程概况计划价格\n";
		}
		if(PROJ_ASTRICT_PRICE != PROJ_ASTRICT_PRICE_OLD) {
			s += "工程概况限价\n";
		}
		
		//招标代理支付方
		if(BID_AGENT_PAY != BID_AGENT_PAY_OLD) {
			s += "招标代理支付方\n";
		}
		if(BID_NEED_MATERIAL_PRICE != BID_NEED_MATERIAL_PRICE_OLD) {
			s += "新增招标资料费\n";
		}
		if(APPLY_REQUIRE != APPLY_REQUIRE_OLD) {
			s += "报名要求\n";
		}
		
		if(TENDER_ONLINE != TENDER_ONLINE_OLD) {
			s += "担当者签名\n";
		}
		if(TENDER_DOWNLOAD != TENDER_DOWNLOAD_OLD) {
			s += "网页下载确认者\n";
		}
		if(APPLY_FORM_EDIT != APPLY_FORM_EDIT_OLD) {
			s += "报名表式（编制）确认者\n";
		}
		if(APPLY_FORM_VERIFY != APPLY_FORM_VERIFY_OLD) {
			s += "报名表式（审核）确认者\n";
		}
		if(APPLY_FORM_MERGE != APPLY_FORM_MERGE_OLD) {
			s += "报名表式（汇总）确认者\n";
		}
		if(EXPERT_NAME_OFFERED != EXPERT_NAME_OFFERED_OLD) {
			s += "名单提供确认者\n";
		}
		if(EXPERT_INFORMED != EXPERT_INFORMED_OLD) {
			s += "通知与否确认者\n";
		}
		if(EXPERT_NAME_CONFIRMED != EXPERT_NAME_CONFIRMED_OLD) {
			s += "通知确认确认者\n";
		}
		if(CLARIFY_DOC != CLARIFY_DOC_OLD) {
			s += "澄清文件确认者\n";
		}
		if(SUPPORT_DOC != SUPPORT_DOC_OLD) {
			s += "补遗文件确认者\n";
		}
		if(SUPPORT_DOC_SENT != SUPPORT_DOC_SENT_OLD) {
			s += "补遗文件发出确认者\n";
		}
		if(BIDDER_REPLY != BIDDER_REPLY_OLD) {
			s += "投标人回复确认者\n";
		}
		if(OPEN_RESULT != OPEN_RESULT_OLD) {
			s += "公示确认者\n";
		}
		if(OPEN_VERIFY != OPEN_VERIFY_OLD) {
			s += "公示审核确认者\n";
		}
		if(INFORM_SENT != INFORM_SENT_OLD) {
			s += "通知书发出确认者\n";
		}
		if(INFORM_CONTRACT != INFORM_CONTRACT_OLD) {
			s += "合同告知书确认者\n";
		}
		if(ATTACH_POST_A != ATTACH_POST_A_OLD) {
			s += "附件邮甲方确认者\n";
		}
		if(CONTRACT_VERIFY != CONTRACT_VERIFY_OLD) {
			s += "合同审核确认者\n";
		}
		if(COMMENT_POST != COMMENT_POST_OLD) {
			s += "意见稿发出确认者\n";
		}
		if(BID_REOPRT_EDIT != BID_REOPRT_EDIT_OLD) {
			s += "报告编制确认者\n";
		}
		if(BID_REPORT_VERIFY != BID_REPORT_VERIFY_OLD) {
			s += "报告审核确认者\n";
		}
		if(BID_REPORT_SENT != BID_REPORT_SENT_OLD) {
			s += "报告发出确认者\n";
		}
		//if(BID_POST_NO != BID_POST_NO_OLD) {
		//	s += "发票1快递编号\n";
		//}
		
		//新增的几个日期
		if(BID_NOTICE_DATE != BID_NOTICE_DATE_OLD) {
			s += "中标公告日期FROM\n";
		}
		if(BID_NOTICE_DATE2 != BID_NOTICE_DATE_OLD2) {
			s += "中标公告日期TO\n";
		}
		if(BID_MESSAGE_DATE != BID_MESSAGE_DATE_OLD) {
			s += "中标通知书发出日\n";
		}
		if(MATERIAL_EXPRESS_DATE != MATERIAL_EXPRESS_DATE_OLD) {
			s += "评标报告移交时间\n";
		}
		if(RESERVE_DATE2 != RESERVE_DATE2_OLD) {
			s += "投标文件时间\n";
		}
		if(RESERVE_DATE3 != RESERVE_DATE3_OLD) {
			s += "招标文件时间\n";
		}
		if(RESERVE_DATE4 != RESERVE_DATE4_OLD) {
			s += "评标报告/存档资料时间\n";
		}
		if(RESERVE_DATE5 != RESERVE_DATE5_OLD) {
			s += "其他时间\n";
		}
		if(RESERVE_DATE6 != RESERVE_DATE6_OLD) {
			s += "承接项目日期\n";
		}
		if(RESERVE_DATE7 != RESERVE_DATE7_OLD) {
			s += "项目失败日期\n";
		}
		if(BID_AGENT_PRICE_WANYUAN != BID_AGENT_PRICE_WANYUAN_OLD) {
			s += "招标代理费金额\n";
		}
		if(FINISH_STATUS != FINISH_STATUS_OLD) {
			s += "项目完成情况\n";
		}
		if(FINISH_NOTE != FINISH_NOTE_OLD) {
			s += "项目完成情况备注\n";
		}
		if(RESERVE1 != RESERVE1_OLD) {
			s += "失败原因\n";
		}
		if(RESERVE2 != RESERVE2_OLD) {
			s += "项目性质\n";
		}
		
		if(parseFloat(RECEIPT1_AGENT_COMMISSION) != parseFloat(RECEIPT1_AGENT_COMMISSION_OLD)) {
			s += "代理费\n";
		}
		if(RECEIPT1_DATE != RECEIPT1_DATE_OLD) {
			s += "开票日期\n";
		}
		if(RECEIPT1_STAFF != RECEIPT1_STAFF_OLD) {
			s += "开票人\n";
		}
		if(RECEIPT1_NO != RECEIPT1_NO_OLD) {
			s += "发票号码\n";
		}
		if(RECEIPT1_VALUE_DATE != RECEIPT1_VALUE_DATE_OLD) {
			s += "到账日期\n";
		}
		//if(parseFloat(BID_COMMISION_WANYUAN) != parseFloat(BID_COMMISION_WANYUAN_OLD)) {
		if(parseFloat(BID_COMMISION) != parseFloat(BID_COMMISION_OLD)) {
			//s += "评标费\n";
			s += "专家评审费\n";
		}
		if(RECEIPT1_RECEIVER != RECEIPT1_RECEIVER_OLD) {
			s += "接受人\n";
		}
		if(RECEIPT2_NO != RECEIPT2_NO_OLD) {
			s += "签收单编号\n";
		}
		if(RECEIPT2_DATE != RECEIPT2_DATE_OLD) {
			s += "签收时间\n";
		}
		if(RECEIPT2_POST_NO != RECEIPT2_POST_NO_OLD) {
			s += "发票2快递编号\n";
		}
		if(RECEIPT2_EXPRESS_DATE != RECEIPT2_EXPRESS_DATE_OLD) {
			s += "快递时间\n";
		}
		if(MEMO1 != MEMO1_OLD) {
			s += "备注\n";
		}
		
		var rows = document.getElementById("bidCompData").rows;
		var bidValueDate = document.getElementsByName("bidValueDate");
		var refoundDepositDate = document.getElementsByName("refoundDepositDate");
		var reserveDate1 = document.getElementsByName("reserveDate1");
		var reserveDate2 = document.getElementsByName("reserveDate2");
		var aim_bond_price_wan = document.getElementById("tmpBoundPrice");
		for(var i = 0; i < rows.length; i++) {
			var childs = rows[i].cells[0].getElementsByTagName("input");
			if(tmpBidStatus == "30") {
				if (aim_bond_price_wan.value != ""){
					if(childs[4].value - aim_bond_price_wan.value!=0) {
						alert("保证金金额不符！" + childs[4].value+"->目标保证金:"+aim_bond_price_wan.value);
					}					
				}
				if(childs[11].value != bidValueDate[i].value) {
					$("#agentCompEditFlag").val("1");
					break;
				}
			}
			if(tmpBidStatus == "20") {
				/*if (aim_bond_price_wan.value != ""){
					if(childs[4].value - aim_bond_price_wan.value!=0) {
						alert("保证金金额不符！" + childs[4].value+"->目标保证金:"+aim_bond_price_wan.value);
					}					
				}*/
				if(childs[13].value != reserveDate1[i].value) {
					$("#agentCompEditFlag").val("1");
					break;
				}
			}
			if(tmpBidStatus == "30") {
				if(childs[15].value != refoundDepositDate[i].value) {
					$("#agentCompEditFlag").val("1");
					break;
				}
			}
			if(tmpBidStatus == "30") {
				if(childs[29].value != reserveDate2[i].value) {
					$("#agentCompEditFlag").val("1");
					break;
				}
			}
		}
		
		var agentCompEditFlag = $("#agentCompEditFlag").val();
		if(agentCompEditFlag != "0") {
			s += "投标公司信息\n";
		}
		//if(BID_CO_LIST != BID_CO_LIST_OLD) {
		//	s += "投标公司信息\n";
		//}
		if(BID_EXPERT_LIST != BID_EXPERT_LIST_OLD) {
			s += "评审专家信息\n";
		}
		return s;
	}
	
	function goBidList() {
		//window.location.href = '<c:url value="/bid/queryBidList.action"></c:url>';
		window.location.href = '<c:url value="/bid/turnBidPage.action"></c:url>?startIndex=' + $("#startIndex").val();
		//document.mainform.submit();
	}
	
	//弹出隐藏层
	function ShowDiv(show_div, bg_div, title, id, obj) {
		//var cls = $(obj).attr("class");
		//if(cls == "select") {
		//	return;
		//}
		var s = $("#" + id).val();
		$("#ad_user").attr("value", s);
		document.getElementById(show_div).style.display = 'block';
		document.getElementById(bg_div).style.display = 'block' ;
		var bgdiv = document.getElementById(bg_div);
		bgdiv.style.width = document.body.scrollWidth;
		// bgdiv.style.height = $(document).height();
		$("#ad_id").attr("value", id);
		document.getElementById("ad_title").innerHTML = "请输入“" + title + "”确认者姓名：";
		$("#" + bg_div).height($(document).height());
		$("#ad_user").focus();
	};
	
	function userConfirm() {
		var ad_user = $("#ad_user").val().trim();
		var ad_id = $("#ad_id").val();
		if(ad_user == "") {
			//清空背景色
			$("#" + ad_id).attr("value", "");
			$("#ad_" + ad_id).attr("title", "");
			$("#ad_" + ad_id).removeClass("select");
			document.getElementById("MyDiv").style.display = 'none';
			document.getElementById("fade").style.display = 'none';
		} else {
			if(ad_user.length > 6) {
				alert("确认者名字不能超过6个字！");
				$("#ad_user").focus();
				return;
			}
			//确定用户
			$("#" + ad_id).attr("value", ad_user);
			$("#ad_" + ad_id).attr("title", ad_user);
			$("#ad_" + ad_id).attr("class", "select");
			
			document.getElementById("MyDiv").style.display = 'none';
			document.getElementById("fade").style.display = 'none';
		}
	}
	
	//关闭弹出层
	function CloseDiv(show_div, bg_div) {
		document.getElementById(show_div).style.display = 'none';
		document.getElementById(bg_div).style.display = 'none';
	};
	
	function selectProjectType(obj) {
		/*
		if(obj.checked) {
			if(obj.value == "3") {
				//招标办，招标编号可自己输入
				$("#BID_NO").attr("disabled", false);
			} else {
				$("#BID_NO").attr("disabled", true);
			}
		}//*/
	}
	
	function exchangeDiv(showid, hideid) {
		var showlist = showid.split(",");
		for(var i = 0; i < showlist.length; i++) {
			$("#" + showlist[i]).show();
		}
		var hidelist = hideid.split(",");
		for(var i = 0; i < hidelist.length; i++) {
			$("#" + hidelist[i]).hide();
		}
	}
	
	function selectFinishStatus(obj) {
		if(obj.checked) {
			if(obj.value == "2") {
				$("#tmpFINISH_NOTE").attr("disabled", false);
				$("#RESERVE1").attr("disabled", false);
				var reserveDate7Btn = document.getElementById("reserveDate7Btn");
				reserveDate7Btn.onclick = function(e){
					new Calendar().show(document.getElementById('reserveDate7'));
				}
			} else {
				$("#tmpFINISH_NOTE").val("");
				$("#tmpFINISH_NOTE").attr("disabled", true);
				$("#RESERVE1").val("");
				$("#RESERVE1").attr("disabled", true);
				$("#reserveDate7").val("");
				$("#reserveDate7Btn").removeAttr('onclick');
			}
		}
	}
	
	//是否中标下拉框改变
	function changeBidResult(obj, index) {
		var tr = obj.parentNode.parentNode;
		document.getElementById("agentCompEditFlag").value = "1";
		var td = tr.cells[11];
		//修改中标价显示内容
		if(obj.value == "Y") {
			td.getElementsByTagName("input")[0].style.display = "block";
			td.getElementsByTagName("span")[0].style.display = "none";
		} else {
			td.getElementsByTagName("input")[0].value = "0";
			td.getElementsByTagName("input")[0].style.display = "none";
			td.getElementsByTagName("span")[0].style.display = "block";
		}
		//隐藏域的值
		var childs = tr.cells[0].getElementsByTagName("input");
		childs[index].value = obj.value;
		if(obj.value == "Y") {
		} else {
			//未中标，则中标价默认为0
			childs[index + 1].value = "0";
		}
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
		/* document.getElementById("agentCompEditFlag").value = "1";
		var list = document.getElementsByName("bidCompRadio");
		for(var i = 0; i < list.length; i++) {
			var tr = list[i].parentNode.parentNode;
			//隐藏域保证金值
			var td0 = tr.cells[0];
			td0.getElementsByTagName("input")[4].value = bond;
			//显示的保证金
			var td = tr.cells[6];
			td.getElementsByTagName("input")[0].value = bond;
			td.getElementsByTagName("span")[0].innerHTML = bond;
		}
		*/
	}
	
	//下拉框选项更改，设置隐藏域的值
	function setSelectVal(obj, index) {
		document.getElementById("agentCompEditFlag").value = "1";
		var v = obj.value;
		var tr = obj.parentNode.parentNode;
		var childs = tr.cells[0].getElementsByTagName("input");
		childs[index].value = v;
	}
	
	//焦点失去时，设置隐藏域值
	function setHideVal(obj, index, type, title, oldval) {
		var v = obj.value;
		if(type == "1") {
			//金额
			if(v != "" && !isReal(v)) {
				alert("请输入正确的" + title + "！");
				obj.focus();
				return;
			}
		}
		if(oldval != v) {
			document.getElementById("agentCompEditFlag").value = "1";
		}
		var tr = obj.parentNode.parentNode;
		var childs = tr.cells[0].getElementsByTagName("input");
		childs[index].value = v;
	}
	
	function updbidstatus(status) {
		$("#tmpBidStatus").val(status);
		var url = '<c:url value="/bid/showUpdBidStatusAction.action"></c:url>';
		document.mainform.action = url;
		document.mainform.submit();
	}
	
	function exportBidForm() {
		document.mainform.action = '<c:url value="/bid/exportBidFormAction.action"></c:url>' + "?projectMsgFlag=2";
		document.mainform.submit();
	}

	function exportBidRegister() {
		document.mainform.action = '<c:url value="/bid/exportBidRegisterAction.action"></c:url>';
		document.mainform.submit();
	}

	//打印单个公司报名表
	function printBidRegister(bidNo, bidComNo) {
		document.mainform.action = '<c:url value="/bid/exportSingleBidCompRegisterAction.action"></c:url>?singleBidNo=' + bidNo + '&singleBidCompNo=' + bidComNo;
		document.mainform.submit();
	}
	
	function exportBidReply() {
		document.mainform.action = '<c:url value="/bid/exportBidReplyAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function exportBidReceive() {
		document.mainform.action = '<c:url value="/bid/exportBidReceiveAction.action"></c:url>';
		document.mainform.submit();
	}

	function exportBidAudit() {
		document.mainform.action = '<c:url value="/bid/exportBidAuditAction.action"></c:url>';
		document.mainform.submit();
	}

	function exportBidBase() {
		document.mainform.action = '<c:url value="/bid/exportBidBaseAction.action"></c:url>';
		document.mainform.submit();
	}

	function exportBidDeposit() {
		document.mainform.action = '<c:url value="/bid/exportBidDepositAction.action"></c:url>';
		document.mainform.submit();
	}

	function exportBidCancel() {
		document.mainform.action = '<c:url value="/bid/exportBidCancelAction.action"></c:url>';
		document.mainform.submit();
	}

	function exportBidSign() {
		document.mainform.action = '<c:url value="/bid/exportBidSignAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function showApplyNote(bidno, bidcono, seq) {
		var url = '<c:url value="/bid/showApplyNotePage.action"></c:url>' + "?applyNoteBidNo=" + bidno + "&applyNoteSeq=" + seq + "&applyNoteBidCoNo=" + bidcono + "&date=" + new Date();
		window.showModalDialog(url, window, "dialogheight:520px;dialogwidth:820px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
</script>
</head>
<body>
	<div id="container">
	<s:hidden name="updateBidDtoOld.BID_NO" id="BID_NO_OLD"/> 
	<s:hidden name="updateBidDtoOld.PROJECT_TYPE" id="PROJECT_TYPE_OLD"/>
	<s:hidden name="updateBidDtoOld.PROJECT_NAME" id="PROJECT_NAME_OLD"/>
	<s:hidden name="updateBidDtoOld.PROJECT_MANAGER" id="PROJECT_MANAGER_OLD"/>
	
	<input id="ONLINE_DATE_OLD" type="hidden" value="<s:date name="updateBidDtoOld.ONLINE_DATE" format="yyyy-MM-dd"/>"/>
	<input id="SUBMIT_DATE_OLD" type="hidden" value="<s:date name="updateBidDtoOld.SUBMIT_DATE" format="yyyy-MM-dd"/>"/>
	<input id="SUBMIT_DATE_OLD2" type="hidden" value="<s:date name="updateBidDtoOld.SUBMIT_DATE2" format="yyyy-MM-dd"/>"/>
	<input id="TENDER_START_DATE_OLD" type="hidden" value="<s:date name="updateBidDtoOld.TENDER_START_DATE" format="yyyy-MM-dd"/>"/>
	<input id="TENDER_OPEN_DATE_OLD" type="hidden" value="<s:date name="updateBidDtoOld.TENDER_OPEN_DATE" format="yyyy-MM-dd"/>"/>
	
	<input id="RESERVE_DATE1_OLD" type="hidden" value="<s:date name="updateBidDtoOld.RESERVE_DATE1" format="yyyy-MM-dd"/>"/>
	<input id="RESERVE_DATE2_OLD" type="hidden" value="<s:date name="updateBidDtoOld.RESERVE_DATE2" format="yyyy-MM-dd"/>"/>
	<input id="RESERVE_DATE3_OLD" type="hidden" value="<s:date name="updateBidDtoOld.RESERVE_DATE3" format="yyyy-MM-dd"/>"/>
	<input id="RESERVE_DATE4_OLD" type="hidden" value="<s:date name="updateBidDtoOld.RESERVE_DATE4" format="yyyy-MM-dd"/>"/>
	<input id="RESERVE_DATE5_OLD" type="hidden" value="<s:date name="updateBidDtoOld.RESERVE_DATE5" format="yyyy-MM-dd"/>"/>
	<input id="RESERVE_DATE6_OLD" type="hidden" value="<s:date name="updateBidDtoOld.RESERVE_DATE6" format="yyyy-MM-dd"/>"/>
	<input id="RESERVE_DATE7_OLD" type="hidden" value="<s:date name="updateBidDtoOld.RESERVE_DATE7" format="yyyy-MM-dd"/>"/>
	
	<s:hidden name="updateBidDtoOld.AGENT_NO" id="AGENT_NO_OLD"/>
	<s:hidden name="updateBidDtoOld.AGENT_CO_NAME" id="AGENT_CO_NAME_OLD"/>
	<s:hidden name="updateBidDtoOld.AGENT_CO_MANAGER" id="AGENT_CO_MANAGER_OLD"/>
	<s:hidden name="updateBidDtoOld.AGENT_CO_MANAGER_TEL" id="AGENT_CO_MANAGER_TEL_OLD"/>
	<s:hidden name="updateBidDtoOld.AGENT_CO_POST_ADDRESS" id="AGENT_CO_POST_ADDRESS_OLD"/>
	<s:hidden name="updateBidDtoOld.AGENT_CO_MAIL" id="AGENT_CO_MAIL_OLD"/>
	<s:hidden name="updateBidDtoOld.PROF_NO" id="PROF_NO_OLD"/>
	<s:hidden name="updateBidDtoOld.PROF_CO_NAME" id="PROF_CO_NAME_OLD"/>
	<s:hidden name="updateBidDtoOld.PROF_CO_MANAGER" id="PROF_CO_MANAGER_OLD"/>
	<s:hidden name="updateBidDtoOld.PROF_CO_MANAGER_TEL" id="PROF_CO_MANAGER_TEL_OLD"/>
	<s:hidden name="updateBidDtoOld.PROF_CO_POST_ADDRESS" id="PROF_CO_POST_ADDRESS_OLD"/>
	<s:hidden name="updateBidDtoOld.PROF_CO_MAIL" id="PROF_CO_MAIL_OLD"/>
	<s:hidden name="updateBidDtoOld.PROJ_APPROVAL" id="PROJ_APPROVAL_OLD"/>
	<s:hidden name="updateBidDtoOld.PROJ_PLAN_PRICE" id="PROJ_PLAN_PRICE_OLD"/>
	<s:hidden name="updateBidDtoOld.PROJ_ASTRICT_PRICE" id="PROJ_ASTRICT_PRICE_OLD"/>
	<s:hidden name="updateBidDtoOld.TENDER_ONLINE" id="TENDER_ONLINE_OLD"/>
	<s:hidden name="updateBidDtoOld.TENDER_DOWNLOAD" id="TENDER_DOWNLOAD_OLD"/>
	<s:hidden name="updateBidDtoOld.APPLY_FORM_EDIT" id="APPLY_FORM_EDIT_OLD"/>
	<s:hidden name="updateBidDtoOld.APPLY_FORM_VERIFY" id="APPLY_FORM_VERIFY_OLD"/>
	<s:hidden name="updateBidDtoOld.APPLY_FORM_MERGE" id="APPLY_FORM_MERGE_OLD"/>
	<s:hidden name="updateBidDtoOld.EXPERT_NAME_OFFERED" id="EXPERT_NAME_OFFERED_OLD"/>
	<s:hidden name="updateBidDtoOld.EXPERT_INFORMED" id="EXPERT_INFORMED_OLD"/>
	<s:hidden name="updateBidDtoOld.EXPERT_NAME_CONFIRMED" id="EXPERT_NAME_CONFIRMED_OLD"/>
	<s:hidden name="updateBidDtoOld.CLARIFY_DOC" id="CLARIFY_DOC_OLD"/>
	<s:hidden name="updateBidDtoOld.SUPPORT_DOC" id="SUPPORT_DOC_OLD"/>
	<s:hidden name="updateBidDtoOld.SUPPORT_DOC_SENT" id="SUPPORT_DOC_SENT_OLD"/>
	<s:hidden name="updateBidDtoOld.BIDDER_REPLY" id="BIDDER_REPLY_OLD"/>
	<s:hidden name="updateBidDtoOld.OPEN_RESULT" id="OPEN_RESULT_OLD"/>
	<s:hidden name="updateBidDtoOld.OPEN_VERIFY" id="OPEN_VERIFY_OLD"/>
	<s:hidden name="updateBidDtoOld.INFORM_SENT" id="INFORM_SENT_OLD"/>
	<s:hidden name="updateBidDtoOld.INFORM_CONTRACT" id="INFORM_CONTRACT_OLD"/>
	<s:hidden name="updateBidDtoOld.ATTACH_POST_A" id="ATTACH_POST_A_OLD"/>
	<s:hidden name="updateBidDtoOld.CONTRACT_VERIFY" id="CONTRACT_VERIFY_OLD"/>
	<s:hidden name="updateBidDtoOld.COMMENT_POST" id="COMMENT_POST_OLD"/>
	<s:hidden name="updateBidDtoOld.BID_REOPRT_EDIT" id="BID_REOPRT_EDIT_OLD"/>
	<s:hidden name="updateBidDtoOld.BID_REPORT_VERIFY" id="BID_REPORT_VERIFY_OLD"/>
	<s:hidden name="updateBidDtoOld.BID_REPORT_SENT" id="BID_REPORT_SENT_OLD"/>
	<s:hidden name="updateBidDtoOld.BID_POST_NO" id="BID_POST_NO_OLD"/>
	<s:hidden name="updateBidDtoOld.RECEIPT1_AGENT_COMMISSION" id="RECEIPT1_AGENT_COMMISSION_OLD"/>
	<input id="RECEIPT1_DATE_OLD" type="hidden" value="<s:date name="updateBidDtoOld.RECEIPT1_DATE" format="yyyy-MM-dd"/>"/>
	<s:hidden name="updateBidDtoOld.RECEIPT1_STAFF" id="RECEIPT1_STAFF_OLD"/>
	<s:hidden name="updateBidDtoOld.RECEIPT1_NO" id="RECEIPT1_NO_OLD"/>
	<input id="RECEIPT1_VALUE_DATE_OLD" type="hidden" value="<s:date name="updateBidDtoOld.RECEIPT1_VALUE_DATE" format="yyyy-MM-dd"/>"/>
	<s:hidden name="updateBidDtoOld.BID_COMMISION_WANYUAN" id="BID_COMMISION_WANYUAN_OLD"/>
	<s:hidden name="updateBidDtoOld.BID_COMMISION" id="BID_COMMISION_OLD"/>
	<s:hidden name="updateBidDtoOld.RECEIPT1_RECEIVER" id="RECEIPT1_RECEIVER_OLD"/>
	<s:hidden name="updateBidDtoOld.RECEIPT2_NO" id="RECEIPT2_NO_OLD"/>
	<input id="RECEIPT2_DATE_OLD" type="hidden" value="<s:date name="updateBidDtoOld.RECEIPT2_DATE" format="yyyy-MM-dd"/>"/>
	<s:hidden name="updateBidDtoOld.RECEIPT2_POST_NO" id="RECEIPT2_POST_NO_OLD"/>
	<input id="RECEIPT2_EXPRESS_DATE_OLD" type="hidden" value="<s:date name="updateBidDtoOld.RECEIPT2_EXPRESS_DATE" format="yyyy-MM-dd"/>"/>
	<s:hidden name="updateBidDtoOld.MEMO1" id="MEMO1_OLD"/>
	<s:hidden name="updateBidDtoOld.BID_CO_LIST" id="BID_CO_LIST_OLD"/>
	<s:hidden name="updateBidDtoOld.BID_EXPERT_LIST" id="BID_EXPERT_LIST_OLD"/>
	
	<s:hidden name="updateBidDtoOld.BID_AGENT_PAY" id="BID_AGENT_PAY_OLD"/>
	<s:hidden name="updateBidDtoOld.BID_NEED_MATERIAL_PRICE" id="BID_NEED_MATERIAL_PRICE_OLD"/>
	<s:hidden name="updateBidDtoOld.APPLY_REQUIRE" id="APPLY_REQUIRE_OLD"/>
	
	<input id="BID_NOTICE_DATE_OLD" type="hidden" value="<s:date name="updateBidDtoOld.BID_NOTICE_DATE" format="yyyy-MM-dd"/>"/>
	<input id="BID_NOTICE_DATE_OLD2" type="hidden" value="<s:date name="updateBidDtoOld.BID_NOTICE_DATE2" format="yyyy-MM-dd"/>"/>
	<input id="BID_MESSAGE_DATE_OLD" type="hidden" value="<s:date name="updateBidDtoOld.BID_MESSAGE_DATE" format="yyyy-MM-dd"/>"/>
	<input id="MATERIAL_EXPRESS_DATE_OLD" type="hidden" value="<s:date name="updateBidDtoOld.MATERIAL_EXPRESS_DATE" format="yyyy-MM-dd"/>"/>
	
	<s:hidden name="updateBidDtoOld.BID_AGENT_PRICE_WANYUAN" id="BID_AGENT_PRICE_WANYUAN_OLD"/>
	<s:hidden name="updateBidDtoOld.FINISH_STATUS" id="FINISH_STATUS_OLD"/>
	<s:hidden name="updateBidDtoOld.FINISH_NOTE" id="FINISH_NOTE_OLD"/>
	<s:hidden name="updateBidDtoOld.RESERVE1" id="RESERVE1_OLD"/>
	<s:hidden name="updateBidDtoOld.RESERVE2" id="RESERVE2_OLD"/>
	
		<div id="top">
			<div class="logobox">
				<div class="logo_tittle"></div>
				<div class="logo"></div>
			</div>
		</div>
		<div class="content">
			<jsp:include page="../info.jsp" flush="true" />
			<div class="tittle">
				<div class="icons"><a class="return" href="#" onclick="goBidList();">返回</a><a class="quit" href="#" onclick="logout();">退出</a></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					<input type="hidden" id="agentCompEditFlag" value="0"/>
					<s:if test='%{tmpBidStatus == "10"}'>
						招标信息更新--项目信息
					</s:if>
					<s:elseif test='%{tmpBidStatus == "20"}'>
						招标信息更新--报名
					</s:elseif>
					<s:elseif test='%{tmpBidStatus == "30"}'>
						招标信息更新--保证金
					</s:elseif>
					<s:elseif test='%{tmpBidStatus == "40"}'>
						招标信息更新--开标评标
					</s:elseif>
					<s:elseif test='%{tmpBidStatus == "50"}'>
						招标信息更新--资料归档
					</s:elseif>
				</div>
				<div class="tittle_right">
				</div>
			</div>
			<s:form id="mainform" name="mainform" method="POST">
				<s:hidden name="startIndex" id="startIndex"/>
				<s:hidden name="updateBidNo" id="updateBidNo"/>
				<s:hidden name="updateBidDto.PROJECT_TYPE" id="PROJECT_TYPE"/>
				<s:hidden name="updateBidDto.MEMO1" id="MEMO1"/>
				<s:hidden name="updateBidDto.ONLINE_DATE" id="ONLINE_DATE"/> 
				<s:hidden name="updateBidDto.SUBMIT_DATE" id="SUBMIT_DATE"/>
				<s:hidden name="updateBidDto.SUBMIT_DATE2" id="SUBMIT_DATE2"/>
				<s:hidden name="updateBidDto.TENDER_START_DATE" id="TENDER_START_DATE"/>
				<s:hidden name="updateBidDto.TENDER_OPEN_DATE" id="TENDER_OPEN_DATE"/>
				<s:hidden name="updateBidDto.RESERVE_DATE1" id="RESERVE_DATE1"/>
				<s:hidden name="updateBidDto.RESERVE_DATE2" id="RESERVE_DATE2"/>
				<s:hidden name="updateBidDto.RESERVE_DATE3" id="RESERVE_DATE3"/>
				<s:hidden name="updateBidDto.RESERVE_DATE4" id="RESERVE_DATE4"/>
				<s:hidden name="updateBidDto.RESERVE_DATE5" id="RESERVE_DATE5"/>
				<s:hidden name="updateBidDto.RESERVE_DATE6" id="RESERVE_DATE6"/>
				<s:hidden name="updateBidDto.RESERVE_DATE7" id="RESERVE_DATE7"/>
								
				<input name="updateBidDto.RECEIPT1_DATE" id="RECEIPT1_DATE" type="hidden" value="<s:date name="updateBidDto.RECEIPT1_DATE" format="yyyy-MM-dd"/>"/>
				
				<s:hidden name="updateBidDto.RECEIPT1_VALUE_DATE" id="RECEIPT1_VALUE_DATE"/>
				<s:hidden name="updateBidDto.RECEIPT2_DATE" id="RECEIPT2_DATE"/>
				<s:hidden name="updateBidDto.RECEIPT2_EXPRESS_DATE" id="RECEIPT2_EXPRESS_DATE"/>
				<s:hidden name="updateBidDto.INSERT_DATE" id="INSERT_DATE"/>
				<s:hidden name="updateBidDto.UPDATE_DATE" id="UPDATE_DATE"/>
				<s:hidden name="updateBidDto.AGENT_CO_NAME" id="AGENT_CO_NAME"/>
				<s:hidden name="updateBidDto.PROF_CO_NAME" id="PROF_CO_NAME"/>
				
				<s:hidden name="updateBidDto.TENDER_ONLINE" id="TENDER_ONLINE"/>
				<s:hidden name="updateBidDto.TENDER_DOWNLOAD" id="TENDER_DOWNLOAD"/>
				<s:hidden name="updateBidDto.APPLY_FORM_EDIT" id="APPLY_FORM_EDIT"/>
				<s:hidden name="updateBidDto.APPLY_FORM_VERIFY" id="APPLY_FORM_VERIFY"/>
				<s:hidden name="updateBidDto.APPLY_FORM_MERGE" id="APPLY_FORM_MERGE"/>
				<s:hidden name="updateBidDto.EXPERT_NAME_OFFERED" id="EXPERT_NAME_OFFERED"/>
				<s:hidden name="updateBidDto.EXPERT_INFORMED" id="EXPERT_INFORMED"/>
				<s:hidden name="updateBidDto.EXPERT_NAME_CONFIRMED" id="EXPERT_NAME_CONFIRMED"/>
				<s:hidden name="updateBidDto.CLARIFY_DOC" id="CLARIFY_DOC"/>
				<s:hidden name="updateBidDto.SUPPORT_DOC" id="SUPPORT_DOC"/>
				<s:hidden name="updateBidDto.SUPPORT_DOC_SENT" id="SUPPORT_DOC_SENT"/>
				<s:hidden name="updateBidDto.BIDDER_REPLY" id="BIDDER_REPLY"/>
				<s:hidden name="updateBidDto.OPEN_RESULT" id="OPEN_RESULT"/>
				<s:hidden name="updateBidDto.OPEN_VERIFY" id="OPEN_VERIFY"/>
				<s:hidden name="updateBidDto.INFORM_SENT" id="INFORM_SENT"/>
				<s:hidden name="updateBidDto.INFORM_CONTRACT" id="INFORM_CONTRACT"/>
				<s:hidden name="updateBidDto.ATTACH_POST_A" id="ATTACH_POST_A"/>
				<s:hidden name="updateBidDto.CONTRACT_VERIFY" id="CONTRACT_VERIFY"/>
				<s:hidden name="updateBidDto.COMMENT_POST" id="COMMENT_POST"/>
				<s:hidden name="updateBidDto.BID_REOPRT_EDIT" id="BID_REOPRT_EDIT"/>
				<s:hidden name="updateBidDto.BID_REPORT_VERIFY" id="BID_REPORT_VERIFY"/>
				<s:hidden name="updateBidDto.BID_REPORT_SENT" id="BID_REPORT_SENT"/>
				
				<s:hidden name="updateBidDto.BID_EXPERT_LIST" id="BID_EXPERT_LIST"/>
				
				<s:hidden name="updateBidDto.AGENT_NO" id="AGENT_NO"/>
				<s:hidden name="updateBidDto.PROF_NO" id="PROF_NO"/>
				<s:hidden name="updateBidDto.PROJ_APPROVAL" id="PROJ_APPROVAL"/>
				
				<s:hidden name="updateBidDto.AGENT_CO_MANAGER" id="AGENT_CO_MANAGER"/>
				<s:hidden name="updateBidDto.AGENT_CO_MANAGER_TEL" id="AGENT_CO_MANAGER_TEL"/>
				<s:hidden name="updateBidDto.AGENT_CO_POST_ADDRESS" id="AGENT_CO_POST_ADDRESS"/>
				<s:hidden name="updateBidDto.PROF_CO_MANAGER" id="PROF_CO_MANAGER"/>
				<s:hidden name="updateBidDto.PROF_CO_MANAGER_TEL" id="PROF_CO_MANAGER_TEL"/>
				<s:hidden name="updateBidDto.PROF_CO_POST_ADDRESS" id="PROF_CO_POST_ADDRESS"/>
				
				<s:hidden name="updateBidDto.STATUS" id="STATUS"/>
				<s:hidden name="updateBidDto.FINISH_STATUS" id="FINISH_STATUS"/>
				<s:hidden name="updateBidDto.APPLY_REQUIRE" id="APPLY_REQUIRE"/>
				
				<!--
				<s:hidden name="updateBidDto.BID_COMMISION" id="BID_COMMISION"/>
				-->
				<s:hidden name="updateBidDto.BID_AGENT_PRICE" id="BID_AGENT_PRICE"/>
				
				<input id="BID_NOTICE_DATE" name="updateBidDto.BID_NOTICE_DATE" type="hidden" value="<s:date name="updateBidDto.BID_NOTICE_DATE" format="yyyy-MM-dd"/>"/>
				<input id="BID_NOTICE_DATE2" name="updateBidDto.BID_NOTICE_DATE2" type="hidden" value="<s:date name="updateBidDto.BID_NOTICE_DATE2" format="yyyy-MM-dd"/>"/>
				<input id="BID_MESSAGE_DATE" name="updateBidDto.BID_MESSAGE_DATE" type="hidden" value="<s:date name="updateBidDto.BID_MESSAGE_DATE" format="yyyy-MM-dd"/>"/>
				<input id="MATERIAL_EXPRESS_DATE" name="updateBidDto.MATERIAL_EXPRESS_DATE" type="hidden" value="<s:date name="updateBidDto.MATERIAL_EXPRESS_DATE" format="yyyy-MM-dd"/>"/>
	
				<s:hidden name="updateBidDto.BID_NEED_MATERIAL_PRICE" id="BID_NEED_MATERIAL_PRICE"/>
				<s:hidden name="updateBidDto.FINISH_NOTE" id="FINISH_NOTE"/>
				
				<s:hidden name="tmpBidStatus" id="tmpBidStatus"/>
				<s:hidden name="tmpUpdType" id="tmpUpdType"/>
				
				<s:hidden name="updateBidDto.RESERVE5" id="RESERVE5" /> 
				
				<div class="searchbox update" style="height:0px;">
					<table id="expertTable" style="display: none;">
					</table>
					<table id="compTable" style="display: none;">
					</table>
					<table width="100%" border="0" cellpadding="5" cellspacing="0">
						<tr>
							<td class="red" align="center" colspan="8"><s:actionmessage /></td>
						</tr>
						<tr style="height: 73px;">
							<td colspan="8" width="100%">
								<table width="100%">
									<tr style="height: 64px;" valign="middle">
										<td width="3%">　</td>
										<s:if test='%{updateBidDto.STATUS == "10"}'>
											<s:if test='%{tmpBidStatus == "20"}'>
												<td width="18%"><div class="passstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="currentstep">报　　名</div></td>
												<td width="18%"><div class="unpassstep">保  证  金</div></td>
												<td width="18%"><div class="unpassstep">开标评标</div></td>
												<td width="18%"><div class="unpassstep">资料归档</div></td>
											</s:if>
											<s:elseif test='%{tmpBidStatus == "10"}'>
												<td width="18%"><div class="currentuptstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="unpassstep">报　　名</div></td>
												<td width="18%"><div class="unpassstep">保  证  金</div></td>
												<td width="18%"><div class="unpassstep">开标评标</div></td>
												<td width="18%"><div class="unpassstep">资料归档</div></td>
											</s:elseif>
										</s:if>
										<s:elseif test='%{updateBidDto.STATUS == "20"}'>
											<s:if test='%{tmpBidStatus == "30"}'>
												<td width="18%"><div class="passstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="currentstep">保  证  金</div></td>
												<td width="18%"><div class="unpassstep">开标评标</div></td>
												<td width="18%"><div class="unpassstep">资料归档</div></td>
											</s:if>
											<s:elseif test='%{tmpBidStatus == "20"}'>
												<td width="18%"><div class="passstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="currentuptstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="unpassstep">保  证  金</div></td>
												<td width="18%"><div class="unpassstep">开标评标</div></td>
												<td width="18%"><div class="unpassstep">资料归档</div></td>
											</s:elseif>
											<s:elseif test='%{tmpBidStatus == "10"}'>
												<td width="18%"><div class="currentuptstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="unpassstep">保  证  金</div></td>
												<td width="18%"><div class="unpassstep">开标评标</div></td>
												<td width="18%"><div class="unpassstep">资料归档</div></td>
											</s:elseif>
										</s:elseif>
										<s:elseif test='%{updateBidDto.STATUS == "30"}'>
											<s:if test='%{tmpBidStatus == "40"}'>
												<td width="18%"><div class="passstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('30');" style="cursor: pointer;">保  证  金</div></td>
												<td width="18%"><div class="currentstep">开标评标</div></td>
												<td width="18%"><div class="unpassstep">资料归档</div></td>
											</s:if>
											<s:elseif test='%{tmpBidStatus == "30"}'>
												<td width="18%"><div class="passstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="currentuptstep" onclick="updbidstatus('30');" style="cursor: pointer;">保  证  金</div></td>
												<td width="18%"><div class="unpassstep">开标评标</div></td>
												<td width="18%"><div class="unpassstep">资料归档</div></td>
											</s:elseif>
											<s:elseif test='%{tmpBidStatus == "20"}'>
												<td width="18%"><div class="passstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="currentuptstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('30');" style="cursor: pointer;">保  证  金</div></td>
												<td width="18%"><div class="unpassstep">开标评标</div></td>
												<td width="18%"><div class="unpassstep">资料归档</div></td>
											</s:elseif>
											<s:elseif test='%{tmpBidStatus == "10"}'>
												<td width="18%"><div class="currentuptstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('30');" style="cursor: pointer;">保  证  金</div></td>
												<td width="18%"><div class="unpassstep">开标评标</div></td>
												<td width="18%"><div class="unpassstep">资料归档</div></td>
											</s:elseif>
										</s:elseif>
										<s:elseif test='%{updateBidDto.STATUS == "40"}'>
											<s:if test='%{tmpBidStatus == "50"}'>
												<td width="18%"><div class="passstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('30');" style="cursor: pointer;">保  证  金</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('40');" style="cursor: pointer;">开标评标</div></td>
												<td width="18%"><div class="currentstep">资料归档</div></td>
											</s:if>
											<s:elseif test='%{tmpBidStatus == "40"}'>
												<td width="18%"><div class="passstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('30');" style="cursor: pointer;">保  证  金</div></td>
												<td width="18%"><div class="currentuptstep" onclick="updbidstatus('40');" style="cursor: pointer;">开标评标</div></td>
												<td width="18%"><div class="unpassstep">资料归档</div></td>
											</s:elseif>
											<s:elseif test='%{tmpBidStatus == "30"}'>
												<td width="18%"><div class="passstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="currentuptstep" onclick="updbidstatus('30');" style="cursor: pointer;">保  证  金</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('40');" style="cursor: pointer;">开标评标</div></td>
												<td width="18%"><div class="unpassstep">资料归档</div></td>
											</s:elseif>
											<s:elseif test='%{tmpBidStatus == "20"}'>
												<td width="18%"><div class="passstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="currentuptstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('30');" style="cursor: pointer;">保  证  金</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('40');" style="cursor: pointer;">开标评标</div></td>
												<td width="18%"><div class="unpassstep">资料归档</div></td>
											</s:elseif>
											<s:elseif test='%{tmpBidStatus == "10"}'>
												<td width="18%"><div class="currentuptstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('30');" style="cursor: pointer;">保  证  金</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('40');" style="cursor: pointer;">开标评标</div></td>
												<td width="18%"><div class="unpassstep">资料归档</div></td>
											</s:elseif>
										</s:elseif>
										<s:elseif test='%{updateBidDto.STATUS == "50"}'>
											<s:if test='%{tmpBidStatus == "50"}'>
												<td width="18%"><div class="passstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('30');" style="cursor: pointer;">保  证  金</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('40');" style="cursor: pointer;">开标评标</div></td>
												<td width="18%"><div class="currentuptstep" onclick="updbidstatus('50');" style="cursor: pointer;">资料归档</div></td>
											</s:if>
											<s:elseif test='%{tmpBidStatus == "40"}'>
												<td width="18%"><div class="passstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('30');" style="cursor: pointer;">保  证  金</div></td>
												<td width="18%"><div class="currentuptstep" onclick="updbidstatus('40');" style="cursor: pointer;">开标评标</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('50');" style="cursor: pointer;">资料归档</div></td>
											</s:elseif>
											<s:elseif test='%{tmpBidStatus == "30"}'>
												<td width="18%"><div class="passstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="currentuptstep" onclick="updbidstatus('30');" style="cursor: pointer;">保  证  金</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('40');" style="cursor: pointer;">开标评标</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('50');" style="cursor: pointer;">资料归档</div></td>
											</s:elseif>
											<s:elseif test='%{tmpBidStatus == "20"}'>
												<td width="18%"><div class="passstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="currentuptstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('30');" style="cursor: pointer;">保  证  金</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('40');" style="cursor: pointer;">开标评标</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('50');" style="cursor: pointer;">资料归档</div></td>
											</s:elseif>
											<s:elseif test='%{tmpBidStatus == "10"}'>
												<td width="18%"><div class="currentuptstep" onclick="updbidstatus('10');" style="cursor: pointer;">项目信息</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('20');" style="cursor: pointer;">报　　名</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('30');" style="cursor: pointer;">保  证  金</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('40');" style="cursor: pointer;">开标评标</div></td>
												<td width="18%"><div class="passstep" onclick="updbidstatus('50');" style="cursor: pointer;">资料归档</div></td>
											</s:elseif>
										</s:elseif>
										<td width="7%">　</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="right">
								<label class="pdf10"><font color="red">*</font>招标编号</label>
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="updateBidDto.BID_NO" id="BID_NO" disabled="true" cssStyle="width:135px;" maxlength="13" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">
								<label class="pdf10"><font color="red">*</font>分类</label>
							</td>
							<td>
								<s:if test='updateBidDto.PROJECT_TYPE == "1"'>
									<input id="radioProjectType" name="projectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" checked="checked" type="radio" value="1"/><label>招标</label>
									<input name="projectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" type="radio" value="2"/><label>比选</label>
									<input name="projectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" type="radio" value="3"/><label>招标办</label>
									<input name="projectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" type="radio" value="4"/><label>竞价</label>
								</s:if>
								<s:elseif test='updateBidDto.PROJECT_TYPE == "2"'>
									<input id="radioProjectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" name="projectType" type="radio" value="1"/><label>招标</label>
									<input name="projectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" type="radio" checked="checked" value="2"/><label>比选</label>
									<input name="projectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" type="radio" value="3"/><label>招标办</label>
									<input name="projectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" type="radio" value="4"/><label>竞价</label>
								</s:elseif>
								<s:elseif test='updateBidDto.PROJECT_TYPE == "3"'>
									<input id="radioProjectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" name="projectType" type="radio" value="1"/><label>招标</label>
									<input name="projectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" type="radio" value="2"/><label>比选</label>
									<input name="projectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" type="radio" checked="checked" value="3"/><label>招标办</label>
									<input name="projectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" type="radio" value="4"/><label>竞价</label>
								</s:elseif>
								<s:elseif test='updateBidDto.PROJECT_TYPE == "4"'>
									<input id="radioProjectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" name="projectType" type="radio" value="1"/><label>招标</label>
									<input name="projectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" type="radio" value="2"/><label>比选</label>
									<input name="projectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" type="radio" value="3"/><label>招标办</label>
									<input name="projectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" type="radio" checked="checked" value="4"/><label>竞价</label>
								</s:elseif>
								<s:else>
									<input id="radioProjectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" name="projectType" type="radio" value="1"/><label>招标</label>
									<input name="projectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" type="radio" value="2"/><label>比选</label>
									<input name="projectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" type="radio" value="3"/><label>招标办</label>
									<input name="projectType" <s:if test='%{tmpBidStatus != "10"}'>disabled</s:if> onclick="selectProjectType(this);" type="radio" value="4"/><label>竞价</label>
								</s:else>
							</td>
							<td align="right">
								<label class="pdf10">工程师</label>
							</td>
							<td colspan="3">
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:if test='%{tmpBidStatus != "10"}'>
										<select name="updateBidDto.PROJECT_MANAGER" disabled="disabled" id="PROJECT_MANAGER" style="width:135px;">
											<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
												<option value="<s:property value="LOGIN_NAME"/>" <s:if test="%{updateBidDto.PROJECT_MANAGER == LOGIN_NAME}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
											</s:iterator>
										</select>
									</s:if>
									<s:else>
										<select name="updateBidDto.PROJECT_MANAGER" id="PROJECT_MANAGER" style="width:135px;">
											<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
												<option value="<s:property value="LOGIN_NAME"/>" <s:if test="%{updateBidDto.PROJECT_MANAGER == LOGIN_NAME}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
											</s:iterator>
										</select>
									</s:else>
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
						<tr>
							<td align="right">
								<label class="pdf10"><font color="red">*</font>项目名称</label>
							</td>
							<td colspan="3">
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:if test='%{tmpBidStatus != "10"}'>
										<s:textfield name="updateBidDto.PROJECT_NAME" disabled="true" id="PROJECT_NAME" cssStyle="width:680px;" maxlength="300" theme="simple"></s:textfield>
									</s:if>
									<s:else>
										<s:textfield name="updateBidDto.PROJECT_NAME" id="PROJECT_NAME" cssStyle="width:680px;" maxlength="300" theme="simple"></s:textfield>
									</s:else>
								</div>
								<div class="box1_right"></div>
							</td>
							<td width="80" align="right">保证金(万元)</td>
								<s:if test='%{tmpBidStatus == "10"}'>
									<td width="180">
										<div class="box1_left"></div>
										<div class="box1_center">
											<input type="text" id="tmpBoundPrice" maxlength="12" style="width:165px;" value="<s:property value="updateBidDto.RESERVE5" />" />
										</div>
										<div class="box1_right"></div>
									</td>
									<td align="left">
										<div class="btn1">
										<div class="btn1_left"></div>
										<div class="btn1_center">
											<input class="input80" type="button" value="更新" onclick="updBidBond();"/>
										</div>
										<div class="btn1_right"></div>
										</div>
									</td>
								</s:if>
								<s:else>
									<td width="180">
										<div class="box1_left"></div>
										<div class="box1_center">
											<input type="text" id="tmpBoundPrice" maxlength="12" disabled="true" style="width:165px;" value="<s:property value="updateBidDto.RESERVE5" />" />
										</div>
										<div class="box1_right"></div>
									</td>
									<td align="left">
								</td>
							</s:else>
						</tr>						
					</table>					
				</div>
				<s:if test='%{tmpBidStatus == "10"}'>
				<div class="companys">
				</s:if>
				<s:else>
				<div class="companys" style="display: none;">
				</s:else>
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
												<input type="text" id="agentNo" disabled="disabled" maxlength="4" style="width:150px;" value="<s:property value="updateBidDto.AGENT_NO" />" />
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
												<input type="text" id="agentCoName" disabled="disabled" maxlength="40" style="width:250px;" value="<s:property value="updateBidDto.AGENT_CO_NAME" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">联系人</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="agentCoManager" maxlength="24" style="width:250px;" value="<s:property value="updateBidDto.AGENT_CO_MANAGER" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">电话</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="agentCoManagerTel" maxlength="20" style="width:250px;" value="<s:property value="updateBidDto.AGENT_CO_MANAGER_TEL" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">地址</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="agentCoPostAddress" maxlength="40" style="width:250px;" value="<s:property value="updateBidDto.AGENT_CO_POST_ADDRESS" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">邮箱</td>
										<td>
											<div class="box1">
												<div class="box1_left"></div>
												<div class="box1_center">
													<s:textfield name="updateBidDto.AGENT_CO_MAIL" id="AGENT_CO_MAIL" cssStyle="width:250px;" maxlength="60" theme="simple"></s:textfield>
												</div>
												<div class="box1_right"></div>
											</div>
										</td>
									</tr>
									<tr style="display: none;">
										<td align="right">邮箱</td>
										<td>
											<div class="box1">
												<div class="box1_left"></div>
												<div class="box1_center">
													<s:textfield name="updateBidDto.agent_mail_pr" id="agent_mail_pr" cssStyle="width:116px;" maxlength="29" theme="simple"></s:textfield>
												</div>
												<div class="box1_right"></div>
												<label>@</label>
												<div class="box1_left"></div>
												<div class="box1_center">
													<s:textfield name="updateBidDto.agent_mail_suffix" id="agent_mail_suffix" cssStyle="width:116px;" maxlength="30" theme="simple"></s:textfield>
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
												<input type="text" id="profNo" disabled="disabled" maxlength="4" style="width:150px;" value="<s:property value="updateBidDto.PROF_NO" />" />
											</div>
											<div class="box1_right"></div>
											<div class="btn">
												<div class="box1_left"></div>
												<div class="box1_center">
													<input id="expertCompBtn" class="input40" type="button" onclick="selectExpertComp()" value="检索" />
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
												<input type="text" id="profCoName" disabled="disabled" style="width:250px;" maxlength="40" value="<s:property value="updateBidDto.PROF_CO_NAME" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">联系人</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="profCoManager" maxlength="24" style="width:250px;" value="<s:property value="updateBidDto.PROF_CO_MANAGER" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">电话</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="profCoManagerTel" maxlength="20" style="width:250px;" value="<s:property value="updateBidDto.PROF_CO_MANAGER_TEL" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">地址</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<input type="text" id="profCoPostAddress" maxlength="40" style="width:250px;" value="<s:property value="updateBidDto.PROF_CO_POST_ADDRESS" />" />
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr>
										<td align="right">邮箱</td>
										<td>
											<div class="box1">
												<div class="box1_left"></div>
												<div class="box1_center">
													<s:textfield name="updateBidDto.PROF_CO_MAIL" id="PROF_CO_MAIL" cssStyle="width:250px;" maxlength="60" theme="simple"></s:textfield>
												</div>
												<div class="box1_right"></div>
											</div>
										</td>
									</tr>
									<tr style="display: none;">
										<td align="right">邮箱</td>
										<td>
											<div class="box1">
												<div class="box1_left"></div>
												<div class="box1_center">
													<s:textfield name="updateBidDto.prof_mail_pr" id="prof_mail_pr" cssStyle="width:116px;" maxlength="29" theme="simple"></s:textfield>
												</div>
												<div class="box1_right"></div>
												<label>@</label>
												<div class="box1_left"></div>
												<div class="box1_center">
													<s:textfield name="updateBidDto.prof_mail_suffix" id="prof_mail_suffix" cssStyle="width:116px;" maxlength="30" theme="simple"></s:textfield>
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
										<td colspan="4" align="center" class="tittle"><strong>工程概况</strong></td>
									</tr>
									<tr style="height: 60px;">
										<td align="right" width="110">批文</td>
										<td>
											<textarea id="tmpPROJ_APPROVAL" rows="3" cols="" style="width:255px;"><s:property value="updateBidDto.PROJ_APPROVAL" /></textarea>
										</td>
									</tr>
									<tr style="height: 35px;">
										<td align="right">计划价格</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<s:textfield name="updateBidDto.PROJ_PLAN_PRICE" id="PROJ_PLAN_PRICE" cssStyle="width:250px;" maxlength="8" theme="simple"></s:textfield>
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr style="height: 35px;">
										<td align="right">限价</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<s:textfield name="updateBidDto.PROJ_ASTRICT_PRICE" id="PROJ_ASTRICT_PRICE" cssStyle="width:250px;" maxlength="8" theme="simple"></s:textfield>
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr style="height: 35px;">
										<td align="right">招标代理支付方</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<select name="updateBidDto.BID_AGENT_PAY" id="BID_AGENT_PAY" style="width: 250px;">
													<option value="">请选择</option>
													<s:iterator id="bidAgentCompList" value="bidAgentCompList" status="st1">
														<option value="<s:property value="CONFIG_KEY"/>" <s:if test="%{updateBidDto.BID_AGENT_PAY == CONFIG_KEY}">selected</s:if>><s:property value="CONFIG_VAL"/></option>
													</s:iterator>
												</select>
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr style="height: 35px;">
										<td align="right">新增招标资料费</td>
										<td>
											<s:if test='updateBidDto.BID_NEED_MATERIAL_PRICE == "1"'>
												<input name="needMaterialPrice" type="radio" value="0"/>需要　<input name="needMaterialPrice" checked="checked" type="radio" value="1"/>不需要
											</s:if>
											<s:else>
												<input name="needMaterialPrice" checked="checked" type="radio" value="0"/>需要　<input name="needMaterialPrice" type="radio" value="1"/>不需要
											</s:else>
										</td>
									</tr>
									<tr style="height: 35px;">
										<td align="right">承接项目日期</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center date_input">
												<input type="text" id="reserveDate6" maxlength="10" style="width: 230px;" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.RESERVE_DATE6"/>" />
												<a id="reserveDate6Btn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('reserveDate6'));"></a>
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
									<tr style="height: 35px;">
										<td align="right">项目性质</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<select id="RESERVE2" name="updateBidDto.RESERVE2" style="width: 250px;">
													<s:if test='%{updateBidDto.RESERVE2 == "1"}'>
														<option value="">请选择</option>
														<option value="1" selected="selected">成本内</option>
														<option value="2">成本外</option>
														<option value="3">其他</option>
													</s:if>
													<s:elseif test='updateBidDto.RESERVE2 == "2"'>
														<option value="">请选择</option>
														<option value="1">成本内</option>
														<option value="2" selected="selected">成本外</option>
														<option value="3">其他</option>
													</s:elseif>
													<s:elseif test='updateBidDto.RESERVE2 == "3"'>
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
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<s:if test='%{tmpBidStatus == "20"}'>
				<div class="companys">
				</s:if>
				<s:else>
				<div class="companys" style="display: none;">
				</s:else>
					<table class="company_tab" width="100%" border="0">
						<tr>
							<td width="300">
								<div class="btn1">
									<div class="btn1_left"></div>
									<div class="btn1_center">
										<input class="input80" style="width: 150px;" type="button" value="报名要求" onclick="exchangeDiv('applyRequireDiv', 'bidCompDiv,inputBound');"/>
									</div>
									<div class="btn1_right"></div>
								</div>
							</td>
							<td>
								<div class="btn1">
									<div class="btn1_left"></div>
									<div class="btn1_center">
										<input class="input80" style="width: 150px;" type="button" value="审核表信息录入" onclick="exchangeDiv('bidCompDiv', 'applyRequireDiv,inputBound');"/>
									</div>
									<div class="btn1_right"></div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="btn1">
									<div class="btn1_left"></div>
									<div class="btn1_center">
										<input class="input80" style="width: 150px;" type="button" value="打印报名表" onclick="exportBidRegister()"/>
									</div>
									<div class="btn1_right"></div>
								</div>
							</td>
							<td>
								<div class="btn1">
									<div class="btn1_left"></div>
									<div class="btn1_center">
										<input class="input80" style="width: 150px;" type="button" value="打印审核表" onclick="exportBidAudit()"/>
									</div>
									<div class="btn1_right"></div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="btn1">
									<div class="btn1_left"></div>
									<div class="btn1_center">
										<input class="input80" style="width: 150px;" type="button" value="打印回执" onclick="exportBidReply()"/>
									</div>
									<div class="btn1_right"></div>
								</div>
							</td>
							<td>
								<div class="btn1">
									<div class="btn1_left"></div>
									<div class="btn1_center">
										<input class="input80" style="width: 150px;" type="button" value="打印签收单" onclick="exportBidReceive()"/>
									</div>
									<div class="btn1_right"></div>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<s:if test='%{tmpBidStatus == "20"}'>
				<div id="applyRequireDiv" class="companys">
				</s:if>
				<s:else>
				<div id="applyRequireDiv" class="companys" style="display: none;">
				</s:else>
					<table class="company_tab" width="100%" border="0">
						<tr>
							<td>报名要求</td>
						</tr>
						<tr>
							<td>
								<textarea id="tmpApplyRequire" rows="8" cols="" style="width: 100%;"><s:property value="updateBidDto.APPLY_REQUIRE" /></textarea>
							</td>
						</tr>
					</table>
				</div>
				<div class="ok" style="display: none;">
					<h3>项目过程确认信息</h3>
					<table class="ok_tab" width="100%" border="0">
						<tr>
							<td align="right" width="90">公告</td>
							<td>
								<ul>
									<s:if test='updateBidDto.TENDER_ONLINE != null && updateBidDto.TENDER_ONLINE != ""'>
										<li><a href="javascript:;" id="ad_TENDER_ONLINE" class="select" onclick="ShowDiv('MyDiv','fade', '上网公告', 'TENDER_ONLINE', this)" title="<s:property value="updateBidDto.TENDER_ONLINE"/>">上网公告</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_TENDER_ONLINE" title="" onclick="ShowDiv('MyDiv','fade', '上网公告', 'TENDER_ONLINE', this)">上网公告</a></li>
									</s:else>
									<s:if test='updateBidDto.TENDER_DOWNLOAD != null && updateBidDto.TENDER_DOWNLOAD != ""'>
										<li><a href="javascript:;" id="ad_TENDER_DOWNLOAD" class="select" onclick="ShowDiv('MyDiv','fade', '网页下载', 'TENDER_DOWNLOAD', this)" title="<s:property value="updateBidDto.TENDER_DOWNLOAD"/>">网页下载</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_TENDER_DOWNLOAD" title="" onclick="ShowDiv('MyDiv','fade', '网页下载', 'TENDER_DOWNLOAD', this)">网页下载</a></li>
									</s:else>
									<s:if test='updateBidDto.APPLY_FORM_EDIT != null && updateBidDto.APPLY_FORM_EDIT != ""'>
										<li><a href="javascript:;" id="ad_APPLY_FORM_EDIT" class="select" onclick="ShowDiv('MyDiv','fade', '报名表式（编制）', 'APPLY_FORM_EDIT', this)" title="<s:property value="updateBidDto.APPLY_FORM_EDIT"/>">报名表式（编制）</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_APPLY_FORM_EDIT" title="" onclick="ShowDiv('MyDiv','fade', '报名表式（编制）', 'APPLY_FORM_EDIT', this)">报名表式（编制）</a></li>
									</s:else>
									<s:if test='updateBidDto.APPLY_FORM_VERIFY != null && updateBidDto.APPLY_FORM_VERIFY != ""'>
										<li><a href="javascript:;" id="ad_APPLY_FORM_VERIFY" class="select" onclick="ShowDiv('MyDiv','fade', '报名表式（审核）', 'APPLY_FORM_VERIFY', this)" title="<s:property value="updateBidDto.APPLY_FORM_VERIFY"/>">报名表式（审核）</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_APPLY_FORM_VERIFY" title="" onclick="ShowDiv('MyDiv','fade', '报名表式（审核）', 'APPLY_FORM_VERIFY', this)">报名表式（审核）</a></li>
									</s:else>
									<s:if test='updateBidDto.APPLY_FORM_MERGE != null && updateBidDto.APPLY_FORM_MERGE != ""'>
										<li><a href="javascript:;" id="ad_APPLY_FORM_MERGE" class="select" onclick="ShowDiv('MyDiv','fade', '报名表式（汇总）', 'APPLY_FORM_MERGE', this)" title="<s:property value="updateBidDto.APPLY_FORM_MERGE"/>">报名表式（汇总）</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_APPLY_FORM_MERGE" title="" onclick="ShowDiv('MyDiv','fade', '报名表式（汇总）', 'APPLY_FORM_MERGE', this)">报名表式（汇总）</a></li>
									</s:else>
								</ul>
							</td>
						</tr>
						<tr>
							<td align="right" valign="top" style="padding-top:10px;">专家</td>
							<td>
								<ul>
									<s:if test='updateBidDto.EXPERT_NAME_OFFERED != null && updateBidDto.EXPERT_NAME_OFFERED != ""'>
										<li><a href="javascript:;" id="ad_EXPERT_NAME_OFFERED" class="select" onclick="ShowDiv('MyDiv','fade', '名单提供', 'EXPERT_NAME_OFFERED', this)" title="<s:property value="updateBidDto.EXPERT_NAME_OFFERED"/>">名单提供</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_EXPERT_NAME_OFFERED" title="" onclick="ShowDiv('MyDiv','fade', '名单提供', 'EXPERT_NAME_OFFERED', this)">名单提供</a></li>
									</s:else>
									<s:if test='updateBidDto.EXPERT_INFORMED != null && updateBidDto.EXPERT_INFORMED != ""'>
										<li><a href="javascript:;" id="ad_EXPERT_INFORMED" class="select" onclick="ShowDiv('MyDiv','fade', '通知与否', 'EXPERT_INFORMED', this)" title="<s:property value="updateBidDto.EXPERT_INFORMED"/>">通知与否</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_EXPERT_INFORMED" title="" onclick="ShowDiv('MyDiv','fade', '通知与否', 'EXPERT_INFORMED', this)">通知与否</a></li>
									</s:else>
									<s:if test='updateBidDto.EXPERT_NAME_CONFIRMED != null && updateBidDto.EXPERT_NAME_CONFIRMED != ""'>
										<li><a href="javascript:;" id="ad_EXPERT_NAME_CONFIRMED" class="select" onclick="ShowDiv('MyDiv','fade', '通知确认', 'EXPERT_NAME_CONFIRMED', this)" title="<s:property value="updateBidDto.EXPERT_NAME_CONFIRMED"/>">通知确认</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_EXPERT_NAME_CONFIRMED" title="" onclick="ShowDiv('MyDiv','fade', '通知确认', 'EXPERT_NAME_CONFIRMED', this)">通知确认</a></li>
									</s:else>
									<li><a href="javascript:;" class="select"></a></li>
									<li><a href="javascript:;" class="select"></a></li>
								</ul>
								<ul>
									<s:if test='updateBidDto.CLARIFY_DOC != null && updateBidDto.CLARIFY_DOC != ""'>
										<li><a href="javascript:;" id="ad_CLARIFY_DOC" class="select" onclick="ShowDiv('MyDiv','fade', '澄清文件', 'CLARIFY_DOC', this)" title="<s:property value="updateBidDto.CLARIFY_DOC"/>">澄清文件</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_CLARIFY_DOC" title="" onclick="ShowDiv('MyDiv','fade', '澄清文件', 'CLARIFY_DOC', this)">澄清文件</a></li>
									</s:else>
									<s:if test='updateBidDto.SUPPORT_DOC != null && updateBidDto.SUPPORT_DOC != ""'>
										<li><a href="javascript:;" id="ad_SUPPORT_DOC" class="select" onclick="ShowDiv('MyDiv','fade', '补遗文件', 'SUPPORT_DOC', this)" title="<s:property value="updateBidDto.SUPPORT_DOC"/>">补遗文件</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_SUPPORT_DOC" title="" onclick="ShowDiv('MyDiv','fade', '补遗文件', 'SUPPORT_DOC', this)">补遗文件</a></li>
									</s:else>
									<s:if test='updateBidDto.SUPPORT_DOC_SENT != null && updateBidDto.SUPPORT_DOC_SENT != ""'>
										<li><a href="javascript:;" id="ad_SUPPORT_DOC_SENT" class="select" onclick="ShowDiv('MyDiv','fade', '补遗文件确认', 'SUPPORT_DOC_SENT', this)" title="<s:property value="updateBidDto.SUPPORT_DOC_SENT"/>">补遗文件确认</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_SUPPORT_DOC_SENT" title="" onclick="ShowDiv('MyDiv','fade', '补遗文件确认', 'SUPPORT_DOC_SENT', this)">补遗文件确认</a></li>
									</s:else>
									<s:if test='updateBidDto.BIDDER_REPLY != null && updateBidDto.BIDDER_REPLY != ""'>
										<li><a href="javascript:;" id="ad_BIDDER_REPLY" class="select" onclick="ShowDiv('MyDiv','fade', '投标人回复', 'BIDDER_REPLY', this)" title="<s:property value="updateBidDto.BIDDER_REPLY"/>">投标人回复</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_BIDDER_REPLY" title="" onclick="ShowDiv('MyDiv','fade', '投标人回复', 'BIDDER_REPLY', this)">投标人回复</a></li>
									</s:else>
									<li><a href="javascript:;" class="select"></a></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td align="right">中标</td>
							<td>
								<ul>
									<s:if test='updateBidDto.OPEN_RESULT != null && updateBidDto.OPEN_RESULT != ""'>
										<li><a href="javascript:;" id="ad_OPEN_RESULT" class="select" onclick="ShowDiv('MyDiv','fade', '公示', 'OPEN_RESULT', this)" title="<s:property value="updateBidDto.OPEN_RESULT"/>">公示</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_OPEN_RESULT" title="" onclick="ShowDiv('MyDiv','fade', '公示', 'OPEN_RESULT', this)">公示</a></li>
									</s:else>
									<s:if test='updateBidDto.OPEN_VERIFY != null && updateBidDto.OPEN_VERIFY != ""'>
										<li><a href="javascript:;" id="ad_OPEN_VERIFY" class="select" onclick="ShowDiv('MyDiv','fade', '公示审核', 'OPEN_VERIFY', this)" title="<s:property value="updateBidDto.OPEN_VERIFY"/>">公示审核</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_OPEN_VERIFY" title="" onclick="ShowDiv('MyDiv','fade', '公示审核', 'OPEN_VERIFY', this)">公示审核</a></li>
									</s:else>
									<s:if test='updateBidDto.INFORM_SENT != null && updateBidDto.INFORM_SENT != ""'>
										<li><a href="javascript:;" id="ad_INFORM_SENT" class="select" onclick="ShowDiv('MyDiv','fade', '通知书发出', 'INFORM_SENT', this)" title="<s:property value="updateBidDto.INFORM_SENT"/>">通知书发出</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_INFORM_SENT" title="" onclick="ShowDiv('MyDiv','fade', '通知书发出', 'INFORM_SENT', this)">通知书发出</a></li>
									</s:else>
									<s:if test='updateBidDto.INFORM_CONTRACT != null && updateBidDto.INFORM_CONTRACT != ""'>
										<li><a href="javascript:;" id="ad_INFORM_CONTRACT" class="select" onclick="ShowDiv('MyDiv','fade', '合同告知书', 'INFORM_CONTRACT', this)" title="<s:property value="updateBidDto.INFORM_CONTRACT"/>">合同告知书</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_INFORM_CONTRACT" title="" onclick="ShowDiv('MyDiv','fade', '合同告知书', 'INFORM_CONTRACT', this)">合同告知书</a></li>
									</s:else>
									<li><a href="javascript:;" class="select"></a></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td align="right">合同</td>
							<td>
								<ul>
									<s:if test='updateBidDto.ATTACH_POST_A != null && updateBidDto.ATTACH_POST_A != ""'>
										<li><a href="javascript:;" id="ad_ATTACH_POST_A" class="select" onclick="ShowDiv('MyDiv','fade', '附件邮甲方', 'ATTACH_POST_A', this)" title="<s:property value="updateBidDto.ATTACH_POST_A"/>">附件邮甲方</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_ATTACH_POST_A" title="" onclick="ShowDiv('MyDiv','fade', '附件邮甲方', 'ATTACH_POST_A', this)">附件邮甲方</a></li>
									</s:else>
									<s:if test='updateBidDto.CONTRACT_VERIFY != null && updateBidDto.CONTRACT_VERIFY != ""'>
										<li><a href="javascript:;" id="ad_CONTRACT_VERIFY" class="select" onclick="ShowDiv('MyDiv','fade', '合同审核', 'CONTRACT_VERIFY', this)" title="<s:property value="updateBidDto.CONTRACT_VERIFY"/>">合同审核</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_CONTRACT_VERIFY" title="" onclick="ShowDiv('MyDiv','fade', '合同审核', 'CONTRACT_VERIFY', this)">合同审核</a></li>
									</s:else>
									<s:if test='updateBidDto.COMMENT_POST != null && updateBidDto.COMMENT_POST != ""'>
										<li><a href="javascript:;" id="ad_COMMENT_POST" class="select" onclick="ShowDiv('MyDiv','fade', '意见稿发出', 'COMMENT_POST', this)" title="<s:property value="updateBidDto.COMMENT_POST"/>">意见稿发出</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_COMMENT_POST" title="" onclick="ShowDiv('MyDiv','fade', '意见稿发出', 'COMMENT_POST', this)">意见稿发出</a></li>
									</s:else>
									<li><a href="javascript:;" class="select"></a></li>
									<li><a href="javascript:;" class="select"></a></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td align="right">评标报告</td>
							<td>
								<ul>
									<s:if test='updateBidDto.BID_REOPRT_EDIT != null && updateBidDto.BID_REOPRT_EDIT != ""'>
										<li><a href="javascript:;" id="ad_BID_REOPRT_EDIT" class="select" onclick="ShowDiv('MyDiv','fade', '报告编制', 'BID_REOPRT_EDIT', this)" title="<s:property value="updateBidDto.BID_REOPRT_EDIT"/>">报告编制</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_BID_REOPRT_EDIT" title="" onclick="ShowDiv('MyDiv','fade', '报告编制', 'BID_REOPRT_EDIT', this)">报告编制</a></li>
									</s:else>
									<s:if test='updateBidDto.BID_REPORT_VERIFY != null && updateBidDto.BID_REPORT_VERIFY != ""'>
										<li><a href="javascript:;" id="ad_BID_REPORT_VERIFY" class="select" onclick="ShowDiv('MyDiv','fade', '报告审核', 'BID_REPORT_VERIFY', this)" title="<s:property value="updateBidDto.BID_REPORT_VERIFY"/>">报告审核</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_BID_REPORT_VERIFY" title="" onclick="ShowDiv('MyDiv','fade', '报告审核', 'BID_REPORT_VERIFY', this)">报告审核</a></li>
									</s:else>
									<s:if test='updateBidDto.BID_REPORT_SENT != null && updateBidDto.BID_REPORT_SENT != ""'>
										<li><a href="javascript:;" id="ad_BID_REPORT_SENT" class="select" onclick="ShowDiv('MyDiv','fade', '报告发出', 'BID_REPORT_SENT', this)" title="<s:property value="updateBidDto.BID_REPORT_SENT"/>">报告发出</a></li>
									</s:if>
									<s:else>
										<li><a href="javascript:;" id="ad_BID_REPORT_SENT" title="" onclick="ShowDiv('MyDiv','fade', '报告发出', 'BID_REPORT_SENT', this)">报告发出</a></li>
									</s:else>
									<li><a href="javascript:;" class="select"></a></li>
									<li><a href="javascript:;" class="select"></a></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td align="right">备注</td>
							<td>
								<!--
								<textarea id="tMemo1" rows="3" cols="" style="width:825px;"><s:property value="updateBidDto.MEMO1" /></textarea>
								-->
							</td>
						</tr>
					</table>
				</div>
				<s:if test='%{tmpBidStatus == "30" || tmpBidStatus == "40"}'>
				<div id="bidCompDiv" class="info">
				</s:if>
				<s:else>
				<div id="bidCompDiv" class="info" style="display: none;">
				</s:else>
					<table width="100%" border="0">
						<tr>
							<td>
								<div class="tab_content" style="height: 44px;">
									<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
										<tr>
											<td colspan="11" align="center" class="tittle">
												<strong>投标公司信息</strong>
											</td>
										</tr>
									</table>
								</div>
								<div class="tab_content" style="height: 300px;">
									<table id="bidCompTable" class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
										<tr style="background:#eee; border-top:black solid 1px;">
											<td style="width: 0px; display: none"></td>
											<td width="40"></td>
											<td style="width: 0px; display: none">招标编号</td>
											<td style="width: 0px; display: none">序号</td>
											<s:if test='%{tmpBidStatus == "40"}'>
												<td width="90">公司名称</td>
												<td width="70">联系电话</td>
												<td width="50">保证金(万元)</td>
												<td width="70">入账日期</td>
												<td width="55">支付形式</td>
											</s:if>
											<s:else>
												<td>公司名称</td>
												<td>联系电话</td>
												<td width="80">保证金(万元)</td>
												<td width="100">入账日期</td>
												<td width="80">支付形式</td>
											</s:else>
											<s:if test='%{tmpBidStatus == "30" || tmpBidStatus == "40"}'>
												<s:if test='%{tmpBidStatus == "30"}'>
													<td width="100">退定日期</td>
												</s:if>
												<s:else>
													<td width="70">退定日期</td>
												</s:else>
											</s:if>
											<s:else>
												<td style="display: none;" width="100">退定日期</td>
											</s:else>
											<td width="80">投标价(万元)</td>
											<td width="80">评审价(万元)</td>
											<s:if test='%{tmpBidStatus == "20" || tmpBidStatus == "30"}'>
											<td style="display: none;" width="80">
											</s:if>
											<s:else>
											<td width="80">
											</s:else>
												中标与否
											</td>
											<s:if test='%{tmpBidStatus == "20" || tmpBidStatus == "30"}'>
											<td style="display: none;" width="80">
											</s:if>
											<s:else>
											<td width="80">
											</s:else>
												中标价(万元)
											</td>
											<s:if test='%{tmpBidStatus == "40"}'>
												<td width="70">招标资料费(万元)</td>
											</s:if>
											<s:else>
												<td width="100">招标资料费(万元)</td>
											</s:else>
											<s:if test='%{tmpBidStatus == "20"}'>
											<td style="display: none;" width="100">
											</s:if>
											<s:elseif test='%{tmpBidStatus == "40"}'>
											<td width="70">
											</s:elseif>
											<s:else>
											<td width="100">
											</s:else>
												到账日期	
											</td>
											<td width="50">发票号码</td>
											<s:if test='%{tmpBidStatus == "30" || tmpBidStatus == "40"}'>
												<td style="display: none;" width="100">开票日期</td>
												<td style="display: none;" width="80">退还签名</td>
											</s:if>
											<s:else>
												<td width="100">开票日期</td>
												<s:if test='%{tmpBidStatus == "20"}'>
												<td style="display: none;" width="80">
												</s:if>
												<s:else>
												<td width="80">
												</s:else>
													退还签名
												</td>
											</s:else>
											<s:elseif test='%{tmpBidStatus == "40"}'>
											</s:elseif>
											<s:else>
											</s:else>
											<td width="50">备注</td>
											<td width="180">报名内容</td>
										</tr>
										<tbody id="bidCompData">
											<s:iterator id="listBidComp" value="listBidComp" status="st1">
												<s:if test="#st1.odd==true">
													<tr class="tr_bg">
												</s:if>
												<s:else>
													<tr>
												</s:else>
													<td style="width: 0px; display: none;">
														<input type="hidden" value="<s:property value="BID_NO"/>" />
														<input type="hidden" value="<s:property value="#st1.index + 1"/>" />
														<input type="hidden" value="<s:property value="BID_CO_NAME"/>" />
														<input type="hidden" value="<s:property value="BID_CO_TEL"/>" />
														<input type="hidden" value="<s:property value="BID_BOND_WAN"/>" />
														<input type="hidden" value="<s:property value="BID_PAYMENT_TYPE"/>" />
														<input type="hidden" value="<s:property value="BID_PRICE_WAN"/>" />
														<input type="hidden" value="<s:property value="BID_CHECK_PRICE_WAN"/>" />
														<input type="hidden" value="<s:property value="BID_RESULT"/>" />
														<input type="hidden" value="<s:property value="BID_WIN_PRICE_WAN"/>" />
														<input type="hidden" value="<s:property value="BID_APPLY_PRICE_WAN"/>" />
														<input type="hidden" value="<s:date name="BID_VALUE_DATE" format="yyyy-MM-dd" />" />
														<input type="hidden" value="<s:property value="BID_RECEIPT_NO"/>" />
														
														<input type="hidden" value="<s:date name="RESERVE_DATE1" format="yyyy-MM-dd" />" />
														<input type="hidden" value="<s:property value="BID_REFUND_SIGN"/>" />
														<input type="hidden" value="<s:date name="REFOUND_DEPOSIT_DATE" format="yyyy-MM-dd" />" />
														
														<input type="hidden" value="<s:property value="MEMO1"/>" />
														<input type="hidden" value="<s:property value="BID_CO_MANAGER"/>" />
														<input type="hidden" value="<s:property value="BID_CO_ADD"/>" />
														<input type="hidden" value="<s:property value="BID_CO_PS"/>" />
														<input type="hidden" value="<s:property value="BID_CO_NO"/>" />
														<input type="hidden" id="saveBidCompApply<s:property value="#st1.index + 1"/>" value="<s:property value="showBidCompApply"/>" />
														
														<input type="hidden" value="<s:property value="RESERVE2"/>" />
														<input type="hidden" value="<s:property value="RESERVE3"/>" />
														<input type="hidden" value="<s:property value="RESERVE4"/>" />
														<input type="hidden" value="<s:property value="RESERVE5"/>" />
														<input type="hidden" value="<s:property value="RESERVE6"/>" />
														<input type="hidden" value="<s:property value="RESERVE7"/>" />
														<input type="hidden" value="<s:property value="RESERVE8"/>" />
														<input type="hidden" value="<s:date name="RESERVE_DATE2" format="yyyy-MM-dd" />" />
													</td>
													<td><input name="bidCompRadio" type="radio" value="<s:property value="BID_NO"/>_<s:property value="BID_CO_SEQ"/>"/></td>
													<td style="width: 0px; display: none;"><s:property value="BID_NO"/></td>
													<td style="display: none;"><s:property value="#st1.index + 1"/></td>
													<td><s:property value="BID_CO_NAME"/></td>
													<td><s:property value="BID_CO_TEL"/></td>
													<td>
														<s:if test='%{tmpBidStatus == "30"}'>
															<input type="text" style="width: 70px;" maxlength="12" onblur="setHideVal(this, 4, '1', '保证金', '<s:property value="BID_BOND_WAN"/>');" value="<s:property value="BID_BOND_WAN"/>"/>
															<span style="display: none;"><s:property value="BID_BOND_WAN"/></span>
														</s:if>
														<s:else>
															<input type="text" style="width: 70px; display: none;" maxlength="12" onblur="setHideVal(this, 4, '1', '保证金', '<s:property value="BID_BOND_WAN"/>');" value="<s:property value="BID_BOND_WAN"/>"/>
															<span><s:property value="BID_BOND_WAN"/></span>
														</s:else>
													</td>
													<s:if test='%{tmpBidStatus == "20"}'>
													<!-- <td style="display: none;"> -->
													<td>
													</s:if>
													<s:else>
													<td>
													</s:else>
														<s:if test='%{tmpBidStatus == "30"}'>
															<div class="box1_left"></div>
															<div class="box1_center date_input">
																<input type="text" name="reserveDate2" id="reserveDate2_<s:property value="#st1.index + 1"/>" style="width: 70px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="RESERVE_DATE2"/>" />
																<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('reserveDate2_<s:property value="#st1.index + 1"/>'));"></a>
															</div>
															<div class="box1_right"></div>
														</s:if>
														<s:else>
															<s:date name="RESERVE_DATE2" format="yyyy-MM-dd" />
														</s:else>
													</td>
													<td>
														<s:if test='%{tmpBidStatus == "30"}'>
															<select style="width: 70px;" onchange="setSelectVal(this, 5);">
																<s:if test='BID_PAYMENT_TYPE == "2"'>
																	<option value="1">现金</option>
																	<option value="2" selected="selected">支票</option>
																	<option value="3">转账</option>
																	<option value="4">汇票</option>
																	<option value="5">保函</option>
																	<option value="6">现金2</option>
																</s:if>
																<s:elseif test='BID_PAYMENT_TYPE == "3"'>
																	<option value="1">现金</option>
																	<option value="2">支票</option>
																	<option value="3" selected="selected">转账</option>
																	<option value="4">汇票</option>
																	<option value="5">保函</option>
																	<option value="6">现金2</option>
																</s:elseif>
																<s:elseif test='BID_PAYMENT_TYPE == "4"'>
																	<option value="1">现金</option>
																	<option value="2">支票</option>
																	<option value="3">转账</option>
																	<option value="4" selected="selected">汇票</option>
																	<option value="5">保函</option>
																	<option value="6">现金2</option>
																</s:elseif>
																<s:elseif test='BID_PAYMENT_TYPE == "5"'>
																	<option value="1">现金</option>
																	<option value="2">支票</option>
																	<option value="3">转账</option>
																	<option value="4">汇票</option>
																	<option value="5" selected="selected">保函</option>
																	<option value="6">现金2</option>
																</s:elseif>
																<s:elseif test='BID_PAYMENT_TYPE == "6"'>
																	<option value="1">现金</option>
																	<option value="2">支票</option>
																	<option value="3">转账</option>
																	<option value="4">汇票</option>
																	<option value="5">保函</option>
																	<option value="6" selected="selected">现金2</option>
																</s:elseif>
																<s:else>
																	<option value="1" selected="selected">现金</option>
																	<option value="2">支票</option>
																	<option value="3">转账</option>
																	<option value="4">汇票</option>
																	<option value="5">保函</option>
																	<option value="6">现金2</option>
																</s:else>
															</select>
														</s:if>
														<s:else>
															<s:if test='BID_PAYMENT_TYPE == "1"'>
																现金
															</s:if>
															<s:elseif test='BID_PAYMENT_TYPE == "2"'>
																支票
															</s:elseif>
															<s:elseif test='BID_PAYMENT_TYPE == "3"'>
																转账
															</s:elseif>
															<s:elseif test='BID_PAYMENT_TYPE == "4"'>
																汇票
															</s:elseif>
															<s:elseif test='BID_PAYMENT_TYPE == "5"'>
																保函
															</s:elseif>
															<s:elseif test='BID_PAYMENT_TYPE == "6"'>
																现金2
															</s:elseif>
														</s:else>
													</td>
													<s:if test='%{tmpBidStatus == "30" || tmpBidStatus == "40"}'>
														<td>
															<s:if test='%{tmpBidStatus == "30"}'>
																<div class="box1_left"></div>
																<div class="box1_center date_input">
																	<input type="text" name="refoundDepositDate" id="refoundDepositDate_<s:property value="#st1.index + 1"/>" style="width: 70px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="REFOUND_DEPOSIT_DATE"/>" />
																	<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('refoundDepositDate_<s:property value="#st1.index + 1"/>'));"></a>
																</div>
																<div class="box1_right"></div>
															</s:if>
															<s:else>
																<s:date name="REFOUND_DEPOSIT_DATE" format="yyyy-MM-dd" />
															</s:else>
														</td>
													</s:if>
													<s:else>
														<td style="display: none;"><s:date name="REFOUND_DEPOSIT_DATE" format="yyyy-MM-dd" /></td>
													</s:else>
													<td>
														<s:if test='%{tmpBidStatus == "40"}'>
															<input type="text" style="width: 70px;" maxlength="12" onblur="setHideVal(this, 6, '1', '投标价', '<s:property value="BID_PRICE_WAN"/>');" value="<s:property value="BID_PRICE_WAN"/>"/>
														</s:if>
														<s:else>
															<s:property value="BID_PRICE_WAN"/>
														</s:else>
													</td>
													<td>
														<s:if test='%{tmpBidStatus == "40"}'>
															<input type="text" style="width: 70px;" maxlength="12" onblur="setHideVal(this, 7, '1', '评审价', '<s:property value="BID_CHECK_PRICE_WAN"/>');" value="<s:property value="BID_CHECK_PRICE_WAN"/>"/>
														</s:if>
														<s:else>
															<s:property value="BID_CHECK_PRICE_WAN"/>
														</s:else>
													</td>
													<s:if test='%{tmpBidStatus == "20" || tmpBidStatus == "30"}'>
													<td style="display: none;">
													</s:if>
													<s:else>
													<td>
													</s:else>
														<s:if test='%{tmpBidStatus == "40"}'>
															<select style="width: 70px;" onchange="changeBidResult(this, 8);">
																<s:if test='BID_RESULT == "Y"'>
																	<option value="Y" selected="selected">是</option>
																	<option value="N">否</option>
																</s:if>
																<s:else>
																	<option value="Y">是</option>
																	<option value="N" selected="selected">否</option>
																</s:else>
															</select>
														</s:if>
														<s:else>
															<s:if test='BID_RESULT == "Y"'>
																是
															</s:if>
															<s:else>
																否
															</s:else>
														</s:else>
													</td>
													<s:if test='%{tmpBidStatus == "20" || tmpBidStatus == "30"}'>
													<td style="display: none;">
													</s:if>
													<s:else>
													<td>
													</s:else>
														<s:if test='%{tmpBidStatus == "40"}'>
															<s:if test='BID_RESULT == "Y"'>
																<input type="text" style="width: 70px;" maxlength="12" onblur="setHideVal(this, 9, '1', '中标价', '<s:property value="BID_WIN_PRICE_WAN"/>');" value="<s:property value="BID_WIN_PRICE_WAN"/>"/>
																<span style="display: none;">-</span>
															</s:if>
															<s:else>
																<input type="text" style="width: 70px; display: none;" maxlength="12" onblur="setHideVal(this, 9, '1', '中标价', '<s:property value="BID_WIN_PRICE_WAN"/>');" value="<s:property value="BID_WIN_PRICE_WAN"/>"/>
																<span>-</span>
															</s:else>
														</s:if>
														<s:else>
															<s:if test='BID_RESULT == "Y"'>
																<s:property value="BID_WIN_PRICE_WAN"/>
															</s:if>
															<s:else>
																-
															</s:else>
														</s:else>
													</td>
													<td>
														<s:if test='%{updateBidDto.BID_NEED_MATERIAL_PRICE == "0"}'>
															<s:if test='%{tmpBidStatus == "20" || tmpBidStatus == "30"}'>
																<input type="text" style="width: 70px;" maxlength="12" onblur="setHideVal(this, 10, '1', '招标资料费', '<s:property value="BID_APPLY_PRICE_WAN"/>');" value="<s:property value="BID_APPLY_PRICE_WAN"/>"/>
															</s:if>
															<s:else>
																<s:property value="BID_APPLY_PRICE_WAN"/>
															</s:else>
														</s:if>
														<s:else>
															<s:property value="BID_APPLY_PRICE_WAN"/>
														</s:else>
													</td>
													<s:if test='%{tmpBidStatus == "20"}'>
													<td style="display: none;">
													</s:if>
													<s:else>
													<td>
													</s:else>
														<s:if test='%{tmpBidStatus == "30"}'>
															<div class="box1_left"></div>
															<div class="box1_center date_input">
																<input type="text" name="bidValueDate" id="bidValueDate_<s:property value="#st1.index + 1"/>" style="width: 70px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="BID_VALUE_DATE"/>" />
																<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('bidValueDate_<s:property value="#st1.index + 1"/>'));"></a>
															</div>
															<div class="box1_right"></div>
														</s:if>
														<s:else>
															<s:date name="BID_VALUE_DATE" format="yyyy-MM-dd" />
														</s:else>
													</td>
													<td>
														<s:if test='%{tmpBidStatus == "20"}'>
															<input type="text" style="width: 70px;" maxlength="8" onblur="setHideVal(this, 12, '2', '', '<s:property value="BID_RECEIPT_NO"/>');" value="<s:property value="BID_RECEIPT_NO"/>"/>
														</s:if>
														<s:else>
															<s:property value="BID_RECEIPT_NO"/>
														</s:else>
													</td>
													<s:if test='%{tmpBidStatus == "30" || tmpBidStatus == "40"}'>
														<td style="display: none;"><s:date name="RESERVE_DATE1" format="yyyy-MM-dd" /></td>
														<td style="display: none;"><s:property value="BID_REFUND_SIGN"/></td>
													</s:if>
													<s:else>
														<td>
															<s:if test='%{tmpBidStatus == "20"}'>
																<div class="box1_left"></div>
																<div class="box1_center date_input">
																	<input type="text" name="reserveDate1" id="reserveDate1_<s:property value="#st1.index + 1"/>" style="width: 70px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="RESERVE_DATE1"/>" />
																	<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('reserveDate1_<s:property value="#st1.index + 1"/>'));"></a>
																</div>
																<div class="box1_right"></div>
															</s:if>
															<s:else>
																<s:date name="RESERVE_DATE1" format="yyyy-MM-dd" />
															</s:else>
														</td>
														<s:if test='%{tmpBidStatus == "20"}'>
														<td style="display: none;">
														</s:if>
														<s:else>
														<td>
														</s:else>
															<s:property value="BID_REFUND_SIGN"/>
														</td>
													</s:else>
													<td><s:property value="MEMO1"/></td>
													<td>
														<s:if test='RESERVE1 == "1"'>
															<input type="button" id="applyNoteBtn<s:property value="#st1.index + 1"/>" value="报名内容" style="background-color: #5BB65B;" onclick="showApplyNote('<s:property value="BID_NO"/>', '<s:property value="BID_CO_NO"/>', '<s:property value="#st1.index + 1"/>');"/>
															<input type="button" value="打印报名表" onclick="printBidRegister('<s:property value="BID_NO"/>', '<s:property value="BID_CO_NO"/>');"/>
														</s:if>
														<s:else>
															<input type="button" id="applyNoteBtn<s:property value="#st1.index + 1"/>" value="报名内容" onclick="showApplyNote('<s:property value="BID_NO"/>', '<s:property value="BID_CO_NO"/>', '<s:property value="#st1.index + 1"/>');"/>
														</s:else>
													</td>
												</tr>
											</s:iterator>
										</tbody>
									</table>
								</div>
								<table cellpadding="10" style="margin:0 auto;">
									<tr>
										<td>
											<div class="btn1">
												<div class="btn1_left"></div>
												<div class="btn1_center">
													<input class="input80" type="button" onclick="addBidComp();" value="追加" />
												</div>
												<div class="btn1_right"></div>
											</div>
										</td>
										<td>
											<div class="btn1">
												<div class="btn1_left"></div>
												<div class="btn1_center">
													<input class="input80" type="button" onclick="updBidComp();" value="更改" />
												</div>
												<div class="btn1_right"></div>
											</div>
										</td>
										<td>
											<div class="btn1">
												<div class="btn1_left"></div>
												<div class="btn1_center">
													<input class="input80" type="button" onclick="delBidComp();" value="删除" />
												</div>
												<div class="btn1_right"></div>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<s:if test='%{tmpBidStatus == "40"}'>
				<div class="info">
				</s:if>
				<s:else>
				<div class="info" style="display: none;">
				</s:else>
					<table width="100%" border="0">
						<tr>
							<td>
								<div class="tab_content" style="height: 44px;">
									<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
										<tr>
											<td colspan="11" align="center" class="tittle"><strong>评审专家信息</strong></td>
										</tr>
									</table>
								</div>
								<div class="tab_content" style="height: 300px;">
									<table class="info_tab" width="100%" border="1" cellpadding="5" cellspacing="0">
										<tr style="background:#eee; border-top:black solid 1px;">
											<td style="width: 0px; display: none;">
											</td>
											<td></td>
											<td style="width: 0px; display: none">序号</td>
											<td>姓名</td>
											<td>就职公司</td>
											<td>专业</td>
											<td>职称</td>
											<td>联系电话</td>
											<td>备注</td>
										</tr>
										<tbody id="bidExportData">
											<s:iterator id="listExpertLib" value="listExpertLib" status="st1">
												<s:if test="#st1.odd==true">
													<tr class="tr_bg">
												</s:if>
												<s:else>
													<tr>
												</s:else>
													<td style="width: 0px; display: none;">
														<input type="hidden" value="<s:property value="EXPERT_NAME"/>"/>
														<input type="hidden" value="<s:property value="EXPERT_COMP"/>"/>
														<input type="hidden" value="<s:property value="EXPERT_MAJOR_NAME"/>"/>
														<input type="hidden" value="<s:property value="EXPERT_QULI"/>"/>
														<input type="hidden" value="<s:property value="EXPERT_TEL1"/>"/>
														<input type="hidden" value="<s:property value="MEMO1"/>"/>
														<input type="hidden" value="<s:property value="EXPERT_MAJOR"/>"/>
													</td>
													<td><input name="bidExpertRadio" value="<s:property value="EXPERT_SEQ"/>" type="radio"/></td>
													<td style="width: 0px; display: none"><s:property value="#st1.index + 1" /></td>
													<td><s:property value="EXPERT_NAME"/></td>
													<td><s:property value="EXPERT_COMP"/></td>
													<td><s:property value="EXPERT_MAJOR_NAME"/></td>
													<td><s:property value="EXPERT_QULI"/></td>
													<td><s:property value="EXPERT_TEL1"/></td>
													<td><s:property value="MEMO1"/></td>
												</tr>
											</s:iterator>
										</tbody>
									</table>
								</div>
								<table cellpadding="10" style="margin:0 auto;">
									<tr>
										<td colspan="2">
											<div class="btn1">
												<div class="btn1_left"></div>
												<div class="btn1_center">
													<input class="input80" type="button" value="选择专家" onclick="showAddExpertLib();"/>
												</div>
												<div class="btn1_right"></div>
											</div>
										</td>
										<td colspan="2">
											<div class="btn1">
												<div class="btn1_left"></div>
												<div class="btn1_center">
													<input class="input80" type="button" value="删除" onclick="delBidExpertLib();" />
												</div>
												<div class="btn1_right"></div>
											</div>
										</td>
									</tr>
								</table>
								<table>
									<tr>
										<td width="70">
											专家评审费
										</td>
										<td width="180">
											<div class="box1_left"></div>
											<div class="box1_center">
												<s:textfield name="updateBidDto.BID_COMMISION" id="BID_COMMISION" cssStyle="width:165px;" maxlength="12" theme="simple"></s:textfield>
												<!--
												<s:textfield name="updateBidDto.BID_COMMISION_WANYUAN" id="BID_COMMISION_WANYUAN" cssStyle="width:165px;" maxlength="12" theme="simple"></s:textfield>
												-->
											</div>
											<div class="box1_right"></div>
										</td>
										<td>
											元
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
								
				<s:if test='%{tmpBidStatus == "20"}'>
				<div class="companys">
				</s:if>
				<s:else>
				<div class="companys" style="display: none;">
				</s:else>
					<table class="company_tab" width="100%" border="0">
						<tr align="center">
							<td align="right">
								报名日期
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="submitDate" maxlength="10" style="width: 160px;" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.SUBMIT_DATE"/>" />
									<a id="submitDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('submitDate'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="submitDate2" maxlength="10" style="width: 160px;" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.SUBMIT_DATE2"/>" />
									<a id="submitDateBtn2" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('submitDate2'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
					</table>
				</div>
				<s:if test='%{tmpBidStatus == "40"}'>
				<div class="companys">
				</s:if>
				<s:else>
				<div class="companys" style="display: none;">
				</s:else>
					<table class="company_tab" width="100%" border="0">
						<tr align="center">
							<td align="right">
								开标时间
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="tenderOpenDate" maxlength="10" style="width: 160px;" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.TENDER_OPEN_DATE"/>" />
									<a id="tenderOpenDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('tenderOpenDate'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="left"></td>
						</tr>
						<tr align="center">
							<td align="right">
								评标时间
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="reserveDate1" maxlength="10" style="width: 160px;" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.RESERVE_DATE1"/>" />
									<a id="reserveDate1Btn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('reserveDate1'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="left"></td>
						</tr>
					</table>
				</div>
				<s:if test='%{tmpBidStatus == "50"}'>
				<div class="companys">
				</s:if>
				<s:else>
				<div class="companys" style="display: none;">
				</s:else>
					<table class="company_tab" width="100%" border="0">
						<tr align="center">
							<td width="25%" align="right">
								中标公告：
							</td>
							<td class="date_input" width="190">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="bidNoticeDate" style="width: 160px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.BID_NOTICE_DATE"/>" />
									<a id="bidNoticeDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('bidNoticeDate'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td class="date_input">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="bidNoticeDate2" style="width: 160px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.BID_NOTICE_DATE2"/>" />
									<a id="bidNoticeDateBtn2" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('bidNoticeDate2'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
						<tr align="center">
							<td align="right">
								中标通知书发出日：
							</td>
							<td class="date_input">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="bidMessageDate" style="width: 160px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.BID_MESSAGE_DATE"/>" />
									<a id="bidMessageDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('bidMessageDate'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td>
							</td>
						</tr>
						<tr align="center">
							<td align="right">
								评标报告移交时间：
							</td>
							<td class="date_input">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="materialExpressDate" style="width: 160px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.MATERIAL_EXPRESS_DATE"/>" />
									<a id="materialExpressDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('materialExpressDate'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td>
							</td>
						</tr>
						<tr align="center">
							<td align="right">
								投标文件移交时间：
							</td>
							<td class="date_input">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="reserveDate2" style="width: 160px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.RESERVE_DATE2"/>" />
									<a id="reserveDate2Btn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('reserveDate2'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td>
							</td>
						</tr>
						<tr align="center">
							<td align="right">
								招标文件移交时间：
							</td>
							<td class="date_input">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="reserveDate3" style="width: 160px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.RESERVE_DATE3"/>" />
									<a id="reserveDate3Btn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('reserveDate3'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td>
							</td>
						</tr>
						<tr align="center">
							<td align="right">
								评标报告扫描归档时间：
							</td>
							<td class="date_input">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="reserveDate4" style="width: 160px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.RESERVE_DATE4"/>" />
									<a id="reserveDate4Btn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('reserveDate4'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td>
							</td>
						</tr>
						<tr align="center">
							<td align="right">
								 其他：
							</td>
							<td class="date_input">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="reserveDate5" style="width: 160px;" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.RESERVE_DATE5"/>" />
									<a id="reserveDate5Btn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('reserveDate5'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td>
							</td>
						</tr>
						<tr align="center">
							<td align="right">
								招标代理费金额：
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="updateBidDto.BID_AGENT_PRICE_WANYUAN" id="BID_AGENT_PRICE_WANYUAN" cssStyle="width:175px;" maxlength="12" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="left">元</td>
						</tr>
						<tr align="center">
							<td align="right">
								发票号码
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="updateBidDto.RECEIPT1_NO" id="RECEIPT1_NO" cssStyle="width:175px;" maxlength="8" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="left"></td>
						</tr>
						<tr align="center">
							<td align="right">
								开票日期
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="receipt1Date" maxlength="10" style="width: 160px;" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.RECEIPT1_DATE"/>" />
									<a id="receipt1DateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('receipt1Date'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="left"></td>
						</tr>
						<tr align="center">
							<td align="right">
								到帐日期
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="receipt1ValueDate" maxlength="10" style="width: 160px;" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.RECEIPT1_VALUE_DATE"/>" />
									<a id="receipt1ValueDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('receipt1ValueDate'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="left"></td>
						</tr>
						<tr align="center">
							<td align="right">
								备注：
							</td>
							<td colspan="2" align="left">
								<textarea id="tMemo1" rows="6" cols="" style="width:625px;"><s:property value="updateBidDto.MEMO1" /></textarea>
							</td>
						</tr>
						<tr align="center">
							<td align="right">项目完成情况：　
							</td>
							<td align="left" colspan="2">
								<table>
									<tr>
										<td width="150">
											<s:if test='updateBidDto.FINISH_STATUS == "2"'>
												<input name="finishStatus" onclick="selectFinishStatus(this);" type="radio" value="1"/><label>完成</label>　
												<input name="finishStatus" checked="checked" onclick="selectFinishStatus(this);" type="radio" value="2"/><label>失败</label>
											</s:if>
											<s:elseif test='updateBidDto.FINISH_STATUS == "1"'>
												<input name="finishStatus" checked="checked" onclick="selectFinishStatus(this);" type="radio" value="1"/><label>完成</label>　
												<input name="finishStatus" onclick="selectFinishStatus(this);" type="radio" value="2"/><label>失败</label>
											</s:elseif>
											<s:else>
												<input name="finishStatus" onclick="selectFinishStatus(this);" type="radio" value="1"/><label>完成</label>　
												<input name="finishStatus" onclick="selectFinishStatus(this);" type="radio" value="2"/><label>失败</label>
											</s:else>
										</td>
										<td>失败项目日期</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center date_input">
												<input type="text" id="reserveDate7" maxlength="10" style="width: 80px;" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.RESERVE_DATE7"/>" />
												<s:if test='updateBidDto.FINISH_STATUS == "2"'>
													<a id="reserveDate7Btn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('reserveDate7'));"></a>
												</s:if>
												<s:else>
													<a id="reserveDate7Btn" class="date" href="javascript:;"></a>
												</s:else>
											</div>
											<div class="box1_right"></div>
										</td>
										<td>失败原因</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<s:if test='updateBidDto.FINISH_STATUS == "2"'>
													<select id="RESERVE1" name="updateBidDto.RESERVE1" style="width: 150px;">
												</s:if>
												<s:else>
													<select id="RESERVE1" name="updateBidDto.RESERVE1" disabled="disabled" style="width: 150px;">
												</s:else>
													<s:if test='updateBidDto.RESERVE1 == "1"'>
														<option value="">请选择</option>
														<option value="1" selected="selected">取消</option>
														<option value="2">失败（开标不满3家）</option>
														<option value="3">失败（报名不满3家)</option>
														<option value="4">失败（评审）</option>
														<option value="5">终止</option>
														<option value="6">空白</option>
													</s:if>
													<s:elseif test='updateBidDto.RESERVE1 == "2"'>
														<option value="">请选择</option>
														<option value="1">取消</option>
														<option value="2" selected="selected">失败（开标不满3家）</option>
														<option value="3">失败（报名不满3家)</option>
														<option value="4">失败（评审）</option>
														<option value="5">终止</option>
														<option value="6">空白</option>
													</s:elseif>
													<s:elseif test='updateBidDto.RESERVE1 == "3"'>
														<option value="">请选择</option>
														<option value="1">取消</option>
														<option value="2">失败（开标不满3家）</option>
														<option value="3" selected="selected">失败（报名不满3家)</option>
														<option value="4">失败（评审）</option>
														<option value="5">终止</option>
														<option value="6">空白</option>
													</s:elseif>
													<s:elseif test='updateBidDto.RESERVE1 == "4"'>
														<option value="">请选择</option>
														<option value="1">取消</option>
														<option value="2">失败（开标不满3家）</option>
														<option value="3">失败（报名不满3家)</option>
														<option value="4" selected="selected">失败（评审）</option>
														<option value="5">终止</option>
														<option value="6">空白</option>
													</s:elseif>
													<s:elseif test='updateBidDto.RESERVE1 == "5"'>
														<option value="">请选择</option>
														<option value="1">取消</option>
														<option value="2">失败（开标不满3家）</option>
														<option value="3">失败（报名不满3家)</option>
														<option value="4">失败（评审）</option>
														<option value="5" selected="selected">终止</option>
														<option value="6">空白</option>
													</s:elseif>
													<s:elseif test='updateBidDto.RESERVE1 == "6"'>
														<option value="">请选择</option>
														<option value="1">取消</option>
														<option value="2">失败（开标不满3家）</option>
														<option value="3">失败（报名不满3家)</option>
														<option value="4">失败（评审）</option>
														<option value="5">终止</option>
														<option value="6" selected="selected">空白</option>
													</s:elseif>
													<s:else>
														<option value="" selected="selected">请选择</option>
														<option value="1">取消</option>
														<option value="2">失败（开标不满3家）</option>
														<option value="3">失败（报名不满3家)</option>
														<option value="4">失败（评审）</option>
														<option value="5">终止</option>
														<option value="6">空白</option>
													</s:else>
												</select>
											</div>
											<div class="box1_right"></div>
										</td>
										<td>备注：</td>
										<td>
											<div class="box1_left"></div>
											<div class="box1_center">
												<s:if test='updateBidDto.FINISH_STATUS == "2"'>
													<input type="text" id="tmpFINISH_NOTE" style="width: 275px;" maxlength="50" value="<s:property value="updateBidDto.FINISH_NOTE" />"/>
												</s:if>
												<s:else>
													<input type="text" id="tmpFINISH_NOTE" disabled="disabled" style="width: 275px;" maxlength="50" value="<s:property value="updateBidDto.FINISH_NOTE" />"/>
												</s:else>
											</div>
											<div class="box1_right"></div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<div class="trade">
					<table class="trade_tab" style="display: none;" width="100%" border="0">
						<tr>
							<td align="right" width="10%"><strong>发票</strong></td>
							<td align="right" width="10%">开票日期</td>
							<td class="date_input" width="20%">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<!--
									<input type="text" id="receipt1Date" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.RECEIPT1_DATE"/>" />
									<a id="receipt1DateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('receipt1Date'));"></a>
									-->
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right" width="10%">开票人</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="updateBidDto.RECEIPT1_STAFF" id="RECEIPT1_STAFF" maxlength="24" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right" width="10%">代理费</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="updateBidDto.RECEIPT1_AGENT_COMMISSION" id="RECEIPT1_AGENT_COMMISSION" maxlength="12" theme="simple"></s:textfield>
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
									<!--
									<s:textfield name="updateBidDto.RECEIPT1_NO" id="RECEIPT1_NO" maxlength="8" theme="simple"></s:textfield>
									-->
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">接受人</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="updateBidDto.RECEIPT1_RECEIVER" id="RECEIPT1_RECEIVER" maxlength="24" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="right">到账日期</td>
							<td class="date_input">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
<!-- Pei comment at 2016.07.31 for  receipt1ValueDate used in upper code
 									<input type="text" id="receipt1ValueDate" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.RECEIPT1_VALUE_DATE"/>" />
									<a id="receipt1ValueDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('receipt1ValueDate'));"></a>
 -->
 								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">评标费</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<!--
									<s:textfield name="updateBidDto.BID_COMMISION" id="BID_COMMISION" maxlength="12" theme="simple"></s:textfield>
									-->
								</div>
								<div class="box1_right"></div>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td width="10%" align="right">签收单编号</td>
							<td width="20%">
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="updateBidDto.RECEIPT2_NO" id="RECEIPT2_NO" maxlength="4" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td class="date_input" width="10%" align="right">签收时间</td>
							<td width="20%">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="receipt2Date" disabled="disabled" maxlength="10" value="<s:date format="yyyy-MM-dd" name="updateBidDto.RECEIPT2_DATE"/>" />
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
							<td>
								<div class="box1_left"></div>
								<div class="box1_center">
									<s:textfield name="updateBidDto.RECEIPT2_POST_NO" id="RECEIPT2_POST_NO" maxlength="12" theme="simple"></s:textfield>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">快递时间</td>
							<td class="date_input">
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" id="receipt2ExpressDate" maxlength="10" disabled="disabled" value="<s:date format="yyyy-MM-dd" name="updateBidDto.RECEIPT2_EXPRESS_DATE"/>" />
									<a id="receipt2ExpressDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('receipt2ExpressDate'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
					<table style="display: none;">
						<tr>
							<td align="right">
								<label class="pdf10">上网公告日</label>
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" disabled="disabled" id="onlineDate" value="<s:date format="yyyy-MM-dd" name="updateBidDto.ONLINE_DATE"/>" maxlength="10" />
									<a id="onlineDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('onlineDate'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">
								<label class="pdf10">发标日期</label>
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<input type="text" disabled="disabled" id="tenderStartDate" value="<s:date format="yyyy-MM-dd" name="updateBidDto.TENDER_START_DATE"/>" maxlength="10" />
									<a id="tenderStartDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('tenderStartDate'));"></a>
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">
								<label class="pdf10">报名截止日</label>
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<!--
									<input type="text" disabled="disabled" id="submitDate" value="<s:date format="yyyy-MM-dd" name="updateBidDto.SUBMIT_DATE"/>" maxlength="10" />
									<a id="submitDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('submitDate'));"></a>
									-->
								</div>
								<div class="box1_right"></div>
							</td>
							<td align="right">
								<label class="pdf10">开标日期</label>
							</td>
							<td>
								<div class="box1_left"></div>
								<div class="box1_center date_input">
									<!--
									<input type="text" disabled="disabled" id="tenderOpenDate" value="<s:date format="yyyy-MM-dd" name="updateBidDto.TENDER_OPEN_DATE"/>" maxlength="10" />
									<a id="tenderOpenDateBtn" class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('tenderOpenDate'));"></a>
									-->
								</div>
								<div class="box1_right"></div>
							</td>
						</tr>
					</table>
					<table cellpadding="10" style="margin:0 auto;">
						<tr>	
							<s:if test='%{tmpBidStatus == "10"}'>
								<td>
									<div class="btn">
										<div class="box1_left"></div>
										<div class="box1_center">
											<input class="input80" type="button" value="导出流转单" onclick="exportBidForm();"/>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
							</s:if>
							<s:if test='%{tmpBidStatus == "20"}'>
								<td>
									<div class="btn">
										<div class="box1_left"></div>
										<div class="box1_center">
											<input class="input80" type="button" value="上一步" onclick="beforestep('10');"/>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
							</s:if>
							<s:elseif test='%{tmpBidStatus == "30"}'>
								<td>
									<div class="btn">
										<div class="box1_left"></div>
										<div class="box1_center">
											<input class="input80" type="button" value="上一步" onclick="beforestep('20');"/>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
							</s:elseif>
							<s:elseif test='%{tmpBidStatus == "40"}'>
								<td>
									<div class="btn">
										<div class="box1_left"></div>
										<div class="box1_center">
											<input class="input80" type="button" value="上一步" onclick="beforestep('30');"/>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
							</s:elseif>
							<s:elseif test='%{tmpBidStatus == "50"}'>
								<td>
									<div class="btn">
										<div class="box1_left"></div>
										<div class="box1_center">
											<input class="input80" type="button" value="上一步" onclick="beforestep('40');"/>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
							</s:elseif>
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
											<input class="input80" type="button" value="保存" onclick="save('<s:property value="tmpBidStatus"/>', '1');"/>
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
							<s:if test='%{nextStepType == "1"}'>
								<td>
									<div class="btn">
										<div class="box1_left"></div>
										<div class="box1_center">
												<input class="input80" type="button" value="下一步" onclick="nextstep('<s:property value="tmpBidStatus"/>');"/>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
							</s:if>
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" type="button" value="返回" onclick="goBidList();"/>
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
							<s:if test='%{tmpBidStatus == "30"}'>
								<td>
									<div class="btn">
										<div class="box1_left"></div>
										<div class="box1_center">
												<input class="input80" type="button" value="标书费收据" onclick="exportBidBase();"/>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
								<td>
									<div class="btn">
										<div class="box1_left"></div>
										<div class="box1_center">
												<input class="input80" type="button" value="保证金收据" onclick="exportBidDeposit();"/>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
								<td>
									<div class="btn">
										<div class="box1_left"></div>
										<div class="box1_center">
												<input class="input80" type="button" value="打印签收单" onclick="exportBidCancel();"/>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
							</s:if>
							<s:if test='%{tmpBidStatus == "50"}'>
								<td>
									<div class="btn">
										<div class="box1_left"></div>
										<div class="box1_center">
												<input class="input80" type="button" value="打印签收单" onclick="exportBidSign();"/>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
							</s:if>
						</tr>
					</table>
					<table id="tempTable" style="display: none;">
						<tr>
							<td>
								<input type="hidden" id="tempBID_COMP_INDEX" value="" />
								<input type="hidden" id="tempBID_NO" value="" />
								<input type="hidden" id="tempBID_CO_SEQ" value="" />
								<input type="hidden" id="tempBID_CO_NO" value="" />
								<input type="hidden" id="tempBID_CO_NAME" value="" />
								<input type="hidden" id="tempBID_CO_MANAGER" value="" />
								<input type="hidden" id="tempBID_CO_TEL" value="" />
								<input type="hidden" id="tempBID_CO_ADD" value="" />
								<input type="hidden" id="tempBID_CO_PS" value="" />
								<input type="hidden" id="tempBID_BOND_WAN" value="" />
								<input type="hidden" id="tempRESERVE_DATE1" value="" />
								<input type="hidden" id="tempBID_REFUND_SIGN" value="" />
								<input type="hidden" id="tempREFOUND_DEPOSIT_DATE" value="" />
								<input type="hidden" id="tempBID_PAYMENT_TYPE" value="" />
								<input type="hidden" id="tempBID_PRICE_WAN" value="" />
								<input type="hidden" id="tempBID_CHECK_PRICE_WAN" value="" />
								<input type="hidden" id="tempBID_RESULT" value="" />
								<input type="hidden" id="tempBID_WIN_PRICE_WAN" value="" />
								<input type="hidden" id="tempBID_APPLY_PRICE_WAN" value="" />
								<input type="hidden" id="tempBID_VALUE_DATE" value="" />
								<input type="hidden" id="tempBID_RECEIPT_NO" value="" />
								<input type="hidden" id="tempMEMO1" value="" />
								<input type="hidden" id="tempDELETE_FLG" value="" />
								<input type="hidden" id="tempSaveBidCompApply" value="" />
								<input type="hidden" id="tempRESERVE2" value="" />
								<input type="hidden" id="tempRESERVE3" value="" />
								<input type="hidden" id="tempRESERVE4" value="" />
								<input type="hidden" id="tempRESERVE5" value="" />
								<input type="hidden" id="tempRESERVE6" value="" />
								<input type="hidden" id="tempRESERVE7" value="" />
								<input type="hidden" id="tempRESERVE8" value="" />
								<input type="hidden" id="tempRESERVE_DATE2" value="" />
							</td>
						</tr>
					</table>
					<div style="height:225px;"></div>
				</div>
			</s:form>
		</div>
	</div>
	<div id="fade" class="black_overlay">
	</div>
	<div id="MyDiv" class="white_content">
		<span class="close_divlayer" style="font-size: 16px;" onclick="CloseDiv('MyDiv','fade')"></span>
		<div class="layer_bgleft"></div>
		<div class="layer_bgcenter">
			<h3></h3>
			<table class="layer_box" border="0" cellpadding="5" cellspacing="0">
				<tr><td id="ad_title">请输入上网公告！</td></tr>
				<tr>
					<td>
						<input id="ad_id" type="hidden" value=""/>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input id="ad_user" type="text" maxlength="24" />
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input class="input80" type="button" value="确认" onclick="userConfirm();" />
							</div>
							<div class="box1_right"></div>
						</div>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input class="input80" type="button" value="取消"  onclick="CloseDiv('MyDiv','fade')"/>
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="layer_bgright"></div>
	</div>
</body>
</html>
