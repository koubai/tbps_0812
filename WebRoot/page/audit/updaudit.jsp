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
<title>审价项目更新</title><!-- Bootstrap -->
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

	function checkRESERVE4(obj) {
		if(obj.checked) {
			$("#reserve4").attr("value", "1");
		} else {
			$("#reserve4").attr("value", "");
		}
	}

	function upd() {
		setAuditValue();
		var REPORT_NO = $("#REPORT_NO").val();
		var PROJECT_NAME = $("#PROJECT_NAME").val();
		var PROJECT_MANAGER = $("#PROJECT_MANAGER").val();
		var CNTRCT_NO = $("#CNTRCT_NO").val();
		//委托内容
		var CNTRCT_INFO = $("#CNTRCT_INFO").val();
		
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
		
		if(REPORT_NO == "") {
			alert("报告文号不能为空！");
			$("#REPORT_NO").focus();
			return;
		}
		if(PROJECT_NAME == "") {
			alert("项目名称不能为空！");
			$("#PROJECT_NAME").focus();
			return;
		}
		if(PROJECT_MANAGER == "") {
			alert("工程师不能为空！");
			$("#PROJECT_MANAGER").focus();
			return;
		}
		if(PROJECT_MANAGER.length > 6) {
			alert("工程师不能超过6个字！");
			$("#PROJECT_MANAGER").focus();
			return;
		}
		if(CNTRCT_NO == "") {
			alert("合同编号不能为空！");
			$("#CONTRACT_NO").focus();
			return;
		}
		if(CNTRCT_INFO == "") {
			alert("委托内容不能为空！");
			$("#CNTRCT_INFO").focus();
			return;
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
		}
		if(VERIFY_INCREASE != "") {
			if(!isReal(VERIFY_INCREASE)) {
				alert("核增格式不正确！");
				$("#VERIFY_INCREASE").focus();
				return;
			}
		}
		
		$('#CNTRCT_NO').removeAttr("disabled");
		$('#CNTRCT_NM').removeAttr("disabled");
		$('#VERIFY_DECREASE').removeAttr("disabled");
		$('#VERIFY_DIFF').removeAttr("disabled");
		$('#VERIFY_DIFF_RATE').removeAttr("disabled");
		$('#B_RATE').removeAttr("disabled");

		//提示修改内容
		var s = getAuditEditProject();

		if(s != "") {
			if(confirm("本次修改的内容有：\n" + s + "\n确定修改吗？")) {
				document.mainform.action = '<c:url value="/audit/updAuditAction.action"></c:url>';
				document.mainform.submit();
			}
		} else {
			alert("没有修改内容！");
		}
	}
	function getAuditEditProject() {
		var CNTRCT_NO_OLD = $("#CNTRCT_NO_OLD").val();
		var CNTRCT_NM_OLD = $("#CNTRCT_NM_OLD").val();
		var REPORT_NO_OLD = $("#REPORT_NO_OLD").val();
		var PROJECT_MANAGER_OLD = $("#PROJECT_MANAGER_OLD").val();
		var PROJECT_NAME_OLD = $("#PROJECT_NAME_OLD").val();
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
		var CONTRACT_CO_NO_OLD = $("#CONTRACT_CO_NO_OLD").val();
		var CONTRACT_CO_NAME_OLD = $("#CONTRACT_CO_NAME_OLD").val();
		var CONTRACT_CO_MANAGER_OLD = $("#CONTRACT_CO_MANAGER_OLD").val();
		var CONTRACT_CO_MANAGER_TEL_OLD = $("#CONTRACT_CO_MANAGER_TEL_OLD").val();
		var CONTRACT_CO_POST_ADDRESS_OLD = $("#CONTRACT_CO_POST_ADDRESS_OLD").val();
		var CONTRACT_CO_MAIL_OLD = $("#CONTRACT_CO_MAIL_OLD").val();
		var DOC_REC_DATE_OLD = $("#DOC_REC_DATE_OLD").val();
		var PROGRESS_STATUS_OLD = $("#PROGRESS_STATUS_OLD").val();
		var PRE_SET_OLD = $("#PRE_SET_OLD").val();
		var PRE_PRICE_OLD = $("#PRE_PRICE_OLD").val();
		var SUPPORT_DOC_DATE_OLD = $("#SUPPORT_DOC_DATE_OLD").val();
		var DRAFT_DATE_OLD = $("#DRAFT_DATE_OLD").val();
		var APPROVAL_SND_DATE_OLD = $("#APPROVAL_SND_DATE_OLD").val();
		var APPROVAL_RCV_DATE_OLD = $("#APPROVAL_RCV_DATE_OLD").val();
		var DELI_NO_OLD = $("#DELI_NO_OLD").val();
		var REPORT_RAISE_DATE_OLD = $("#REPORT_RAISE_DATE_OLD").val();
		var REPORT_SEAL_DATE_OLD = $("#REPORT_SEAL_DATE_OLD").val();
		var REPORT_ARR_TYPE_OLD = $("#REPORT_ARR_TYPE_OLD").val();
		var REPORT_ARR_DATE_OLD = $("#REPORT_ARR_DATE_OLD").val();
		var REG_DATE_OLD = $("#REG_DATE_OLD").val();
		var AGENT_INFO_OLD = $("#AGENT_INFO_OLD").val();
		var PROF_INFO_OLD = $("#PROF_INFO_OLD").val();
		var CONTRACT_CO_ID_OLD = $("#CONTRACT_CO_ID_OLD").val();
		var CONTRACT_CO_INFO_OLD = $("#CONTRACT_CO_INFO_OLD").val();
		var VERIFY_PER_AMOUNT_OLD = $("#VERIFY_PER_AMOUNT_OLD").val();
		var VERIFY_AMOUNT_OLD = $("#VERIFY_AMOUNT_OLD").val();
		var VERIFY_INCREASE_OLD = $("#VERIFY_INCREASE_OLD").val();
		var VERIFY_DECREASE_OLD = $("#VERIFY_DECREASE_OLD").val();
		var VERIFY_DIFF_OLD = $("#VERIFY_DIFF_OLD").val();
		var VERIFY_DIFF_RATE_OLD = $("#VERIFY_DIFF_RATE_OLD").val();
		var CNT_PRICE_OLD = $("#CNT_PRICE_OLD").val();
		var PROJ_PRICE_OLD = $("#PROJ_PRICE_OLD").val();
		var LIMIT_PRICE_OLD = $("#LIMIT_PRICE_OLD").val();
		var CNTRCT_PRICE_OLD = $("#CNTRCT_PRICE_OLD").val();
		var PLAN_DOC_RCV_DATE_OLD = $("#PLAN_DOC_RCV_DATE_OLD").val();
		var PLAN_DOC_RPT_DATE_OLD = $("#PLAN_DOC_RPT_DATE_OLD").val();
		var PLAN_DOC_SND_TYPE_OLD = $("#PLAN_DOC_SND_TYPE_OLD").val();
		var PLAN_DOC_ARR_DATE_OLD = $("#PLAN_DOC_ARR_DATE_OLD").val();
		var BID_DOC_RCV_DATE_OLD = $("#BID_DOC_RCV_DATE_OLD").val();
		var BID_DOC_RPT_DATE_OLD = $("#BID_DOC_RPT_DATE_OLD").val();
		var BID_DOC_SND_TYPE_OLD = $("#BID_DOC_SND_TYPE_OLD").val();
		var BID_DOC_ARR_DATE_OLD = $("#BID_DOC_ARR_DATE_OLD").val();
		var SIGN_DOC_RCV_DATE_OLD = $("#SIGN_DOC_RCV_DATE_OLD").val();
		var SIGN_DOC_RPT_DATE_OLD = $("#SIGN_DOC_RPT_DATE_OLD").val();
		var SIGN_DOC_SND_TYPE_OLD = $("#SIGN_DOC_SND_TYPE_OLD").val();
		var SIGN_DOC_ARR_DATE_OLD = $("#SIGN_DOC_ARR_DATE_OLD").val();
		var SET_DOC_RCV_DATE_OLD = $("#SET_DOC_RCV_DATE_OLD").val();
		var SET_DOC_RPT_DATE_OLD = $("#SET_DOC_RPT_DATE_OLD").val();
		var SET_DOC_SND_TYPE_OLD = $("#SET_DOC_SND_TYPE_OLD").val();
		var SET_DOC_ARR_DATE_OLD = $("#SET_DOC_ARR_DATE_OLD").val();
		var PROGRESS_STATUS_MEMO_OLD = $("#PROGRESS_STATUS_MEMO_OLD").val();
		var A_AMOUNT_OLD = $("#A_AMOUNT_OLD").val();
		var A_STATUS_OLD = $("#A_STATUS_OLD").val();
		var B_TYPE_OLD = $("#B_TYPE_OLD").val();
		var B_AMOUNT_OLD = $("#B_AMOUNT_OLD").val();
		var A_INVOICE_DELI_DATE_OLD = $("#A_INVOICE_DELI_DATE_OLD").val();
		var A_INVOICE_DATE_OLD = $("#A_INVOICE_DATE_OLD").val();
		var A_INVOICE_NO_OLD = $("#A_INVOICE_NO_OLD").val();
		var A_SET_DATE_OLD = $("#A_SET_DATE_OLD").val();
		var B_INVOICE_DELI_DATE_OLD = $("#B_INVOICE_DELI_DATE_OLD").val();
		var B_INVOICE_DATE_OLD = $("#B_INVOICE_DATE_OLD").val();
		var B_INVOICE_NO_OLD = $("#B_INVOICE_NO_OLD").val();
		var B_SET_DATE_OLD = $("#B_SET_DATE_OLD").val();
		var B_RATE_OLD = $("#B_RATE_OLD").val();
		var CNTRCT_INFO_OLD = $("#CNTRCT_INFO_OLD").val();
		var PROJECT_NAME_PASS_OLD = $("#PROJECT_NAME_PASS_OLD").val();

		var CNTRCT_NO = $("#CNTRCT_NO").val();
		var CNTRCT_NM = $("#CNTRCT_NM").val();
		var REPORT_NO = $("#REPORT_NO").val();
		var PROJECT_MANAGER = $("#PROJECT_MANAGER").val();
		var PROJECT_NAME = $("#PROJECT_NAME").val();
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
		var CONTRACT_CO_NO = $("#CONTRACT_CO_NO").val();
		var CONTRACT_CO_NAME = $("#CONTRACT_CO_NAME").val();
		var CONTRACT_CO_MANAGER = $("#CONTRACT_CO_MANAGER").val();
		var CONTRACT_CO_MANAGER_TEL = $("#CONTRACT_CO_MANAGER_TEL").val();
		var CONTRACT_CO_POST_ADDRESS = $("#CONTRACT_CO_POST_ADDRESS").val();
		var CONTRACT_CO_MAIL = $("#CONTRACT_CO_MAIL").val();
		var DOC_REC_DATE = $("#DOC_REC_DATE").val();
		var PROGRESS_STATUS = $("#PROGRESS_STATUS").val();
		var PRE_SET = $("#PRE_SET").val();
		var PRE_PRICE = $("#PRE_PRICE").val();
		var SUPPORT_DOC_DATE = $("#SUPPORT_DOC_DATE").val();
		var DRAFT_DATE = $("#DRAFT_DATE").val();
		var APPROVAL_SND_DATE = $("#APPROVAL_SND_DATE").val();
		var APPROVAL_RCV_DATE = $("#APPROVAL_RCV_DATE").val();
		var DELI_NO = $("#DELI_NO").val();
		var REPORT_RAISE_DATE = $("#REPORT_RAISE_DATE").val();
		var REPORT_SEAL_DATE = $("#REPORT_SEAL_DATE").val();
		var REPORT_ARR_TYPE = $("#REPORT_ARR_TYPE").val();
		var REPORT_ARR_DATE = $("#REPORT_ARR_DATE").val();
		var REG_DATE = $("#REG_DATE").val();
		var AGENT_INFO = $("#AGENT_INFO").val();
		var PROF_INFO = $("#PROF_INFO").val();
		var CONTRACT_CO_ID = $("#CONTRACT_CO_ID").val();
		var CONTRACT_CO_INFO = $("#CONTRACT_CO_INFO").val();
		var VERIFY_PER_AMOUNT = $("#VERIFY_PER_AMOUNT").val();
		var VERIFY_AMOUNT = $("#VERIFY_AMOUNT").val();
		var VERIFY_INCREASE = $("#VERIFY_INCREASE").val();
		var VERIFY_DECREASE = $("#VERIFY_DECREASE").val();
		var VERIFY_DIFF = $("#VERIFY_DIFF").val();
		var VERIFY_DIFF_RATE = $("#VERIFY_DIFF_RATE").val();
		var CNT_PRICE = $("#CNT_PRICE").val();
		var PROJ_PRICE = $("#PROJ_PRICE").val();
		var LIMIT_PRICE = $("#LIMIT_PRICE").val();
		var CNTRCT_PRICE = $("#CNTRCT_PRICE").val();
		var PLAN_DOC_RCV_DATE = $("#PLAN_DOC_RCV_DATE").val();
		var PLAN_DOC_RPT_DATE = $("#PLAN_DOC_RPT_DATE").val();
		var PLAN_DOC_SND_TYPE = $("#PLAN_DOC_SND_TYPE").val();
		var PLAN_DOC_ARR_DATE = $("#PLAN_DOC_ARR_DATE").val();
		var BID_DOC_RCV_DATE = $("#BID_DOC_RCV_DATE").val();
		var BID_DOC_RPT_DATE = $("#BID_DOC_RPT_DATE").val();
		var BID_DOC_SND_TYPE = $("#BID_DOC_SND_TYPE").val();
		var BID_DOC_ARR_DATE = $("#BID_DOC_ARR_DATE").val();
		var SIGN_DOC_RCV_DATE = $("#SIGN_DOC_RCV_DATE").val();
		var SIGN_DOC_RPT_DATE = $("#SIGN_DOC_RPT_DATE").val();
		var SIGN_DOC_SND_TYPE = $("#SIGN_DOC_SND_TYPE").val();
		var SIGN_DOC_ARR_DATE = $("#SIGN_DOC_ARR_DATE").val();
		var SET_DOC_RCV_DATE = $("#SET_DOC_RCV_DATE").val();
		var SET_DOC_RPT_DATE = $("#SET_DOC_RPT_DATE").val();
		var SET_DOC_SND_TYPE = $("#SET_DOC_SND_TYPE").val();
		var SET_DOC_ARR_DATE = $("#SET_DOC_ARR_DATE").val();
		var PROGRESS_STATUS_MEMO = $("#PROGRESS_STATUS_MEMO").val();
		var A_AMOUNT = $("#A_AMOUNT").val();
		var A_STATUS = $("#A_STATUS").val();
		var B_TYPE = $("#B_TYPE").val();
		var B_AMOUNT = $("#B_AMOUNT").val();
		var A_INVOICE_DELI_DATE = $("#A_INVOICE_DELI_DATE").val();
		var A_INVOICE_DATE = $("#A_INVOICE_DATE").val();
		var A_INVOICE_NO = $("#A_INVOICE_NO").val();
		var A_SET_DATE = $("#A_SET_DATE").val();
		var B_INVOICE_DELI_DATE = $("#B_INVOICE_DELI_DATE").val();
		var B_INVOICE_DATE = $("#B_INVOICE_DATE").val();
		var B_INVOICE_NO = $("#B_INVOICE_NO").val();
		var B_SET_DATE = $("#B_SET_DATE").val();
		var B_RATE = $("#B_RATE").val();
		var CNTRCT_INFO = $("#CNTRCT_INFO").val();
		var PROJECT_NAME_PASS = $("#PROJECT_NAME_PASS").val();
		var s="";
		if(CNTRCT_NO != CNTRCT_NO_OLD) { s += "合同编号\n"; }
		if(CNTRCT_NM != CNTRCT_NM_OLD) { s += "合同简称\n"; }
		if(REPORT_NO != REPORT_NO_OLD) { s += "报告文号\n"; }
		if(PROJECT_MANAGER != PROJECT_MANAGER_OLD) { s += "工程师\n"; }
		if(PROJECT_NAME != PROJECT_NAME_OLD) { s += "项目名称\n"; }
		/* if(AGENT_NO != AGENT_NO_OLD) { s += "委托公司代码\n"; }
		if(AGENT_CO_NAME != AGENT_CO_NAME_OLD) { s += "委托公司名称\n"; }
		if(AGENT_CO_MANAGER != AGENT_CO_MANAGER_OLD) { s += "委托公司负责人\n"; }
		if(AGENT_CO_MANAGER_TEL != AGENT_CO_MANAGER_TEL_OLD) { s += "委托公司负责人电话\n"; }
		if(AGENT_CO_POST_ADDRESS != AGENT_CO_POST_ADDRESS_OLD) { s += "委托公司快递地址\n"; }
		if(AGENT_CO_MAIL != AGENT_CO_MAIL_OLD) { s += "委托公负责人司邮箱\n"; }
		if(PROF_NO != PROF_NO_OLD) { s += "专业公司代码\n"; }
		if(PROF_CO_NAME != PROF_CO_NAME_OLD) { s += "专业公司名称\n"; }
		if(PROF_CO_MANAGER != PROF_CO_MANAGER_OLD) { s += "专业公司负责人\n"; }
		if(PROF_CO_MANAGER_TEL != PROF_CO_MANAGER_TEL_OLD) { s += "专业公司负责人电话\n"; }
		if(PROF_CO_POST_ADDRESS != PROF_CO_POST_ADDRESS_OLD) { s += "专业公司地址\n"; }
		if(PROF_CO_MAIL != PROF_CO_MAIL_OLD) { s += "专业公司邮箱\n"; }
		if(CONTRACT_CO_NO != CONTRACT_CO_NO_OLD) { s += "承包公司代码\n"; }
		if(CONTRACT_CO_NAME != CONTRACT_CO_NAME_OLD) { s += "承包公司名称\n"; }
		if(CONTRACT_CO_MANAGER != CONTRACT_CO_MANAGER_OLD) { s += "承包公司负责人\n"; }
		if(CONTRACT_CO_MANAGER_TEL != CONTRACT_CO_MANAGER_TEL_OLD) { s += "承包公司负责人电话\n"; }
		if(CONTRACT_CO_POST_ADDRESS != CONTRACT_CO_POST_ADDRESS_OLD) { s += "承包公司快递地址\n"; }
		if(CONTRACT_CO_MAIL != CONTRACT_CO_MAIL_OLD) { s += "承包公司负责人邮箱\n"; } */
		//alert("资料收到日期new is:" + DOC_REC_DATE + ",old is:" + DOC_REC_DATE_OLD)
		if(DOC_REC_DATE != DOC_REC_DATE_OLD) { s += "资料收到日期\n"; }
		if(PROGRESS_STATUS != PROGRESS_STATUS_OLD) { s += "实施情况\n"; }
		if(PRE_SET != PRE_SET_OLD) { s += "预/结算\n"; }
		if(PRE_PRICE != PRE_PRICE_OLD) { s += "预算金额\n"; }
		if(SUPPORT_DOC_DATE != SUPPORT_DOC_DATE_OLD) { s += "补充资料日期\n"; }
		if(DRAFT_DATE != DRAFT_DATE_OLD) { s += "初稿日期\n"; }
		if(APPROVAL_SND_DATE != APPROVAL_SND_DATE_OLD) { s += "审定单发出日期\n"; }
		if(APPROVAL_RCV_DATE != APPROVAL_RCV_DATE_OLD) { s += "审定单收到日期\n"; }
		if(DELI_NO != DELI_NO_OLD) { s += "快递单号\n"; }
		if(REPORT_RAISE_DATE != REPORT_RAISE_DATE_OLD) { s += "报告出具日期\n"; }
		if(REPORT_SEAL_DATE != REPORT_SEAL_DATE_OLD) { s += "报告敲章日期\n"; }
		if(REPORT_ARR_TYPE != REPORT_ARR_TYPE_OLD) { s += "报告送达方式\n"; }
		if(REPORT_ARR_DATE != REPORT_ARR_DATE_OLD) { s += "报告送达日期\n"; }
		if(REG_DATE != REG_DATE_OLD) { s += "入档日期\n"; }
		if(AGENT_INFO != AGENT_INFO_OLD) { s += "委托方专业联系人及联系方式\n"; }
		if(CONTRACT_CO_ID != CONTRACT_CO_ID_OLD) { s += "承揽单位\n"; }
		if(CONTRACT_CO_INFO != CONTRACT_CO_INFO_OLD) { s += "承揽单位联系人及联系方式\n"; }
		if(VERIFY_PER_AMOUNT != VERIFY_PER_AMOUNT_OLD) { s += "送审价\n"; }
		if(VERIFY_AMOUNT != VERIFY_AMOUNT_OLD) { s += "审核价\n"; }
		if(VERIFY_INCREASE != VERIFY_INCREASE_OLD) { s += "核增额\n"; }
		if(VERIFY_DECREASE != VERIFY_DECREASE_OLD) { s += "核减额\n"; }
		if(VERIFY_DIFF != VERIFY_DIFF_OLD) { s += "净核减额\n"; }
		if(VERIFY_DIFF_RATE != VERIFY_DIFF_RATE_OLD) { s += "净核减率\n"; }
		if(CNT_PRICE != CNT_PRICE_OLD) { s += "控制价金额\n"; }
		if(PROJ_PRICE != PROJ_PRICE_OLD) { s += "立项金额\n"; }
		if(LIMIT_PRICE != LIMIT_PRICE_OLD) { s += "限价金额\n"; }
		if(CNTRCT_PRICE != CNTRCT_PRICE_OLD) { s += "合同金额\n"; }
		if(PLAN_DOC_RCV_DATE != PLAN_DOC_RCV_DATE_OLD) { s += "资料收到时间（立项阶段）\n"; }
		if(PLAN_DOC_RPT_DATE != PLAN_DOC_RPT_DATE_OLD) { s += "立项报告时间（立项阶段）\n"; }
		if(PLAN_DOC_SND_TYPE != PLAN_DOC_SND_TYPE_OLD) { s += "报告送达方式（立项阶段）\n"; }
		if(PLAN_DOC_ARR_DATE != PLAN_DOC_ARR_DATE_OLD) { s += "报告送达日期（立项阶段）\n"; }
		if(BID_DOC_RCV_DATE != BID_DOC_RCV_DATE_OLD) { s += "资料收到时间（招标阶段）\n"; }
		if(BID_DOC_RPT_DATE != BID_DOC_RPT_DATE_OLD) { s += "限价报告时间（招标阶段）\n"; }
		if(BID_DOC_SND_TYPE != BID_DOC_SND_TYPE_OLD) { s += "报告送达方式（招标阶段）\n"; }
		if(BID_DOC_ARR_DATE != BID_DOC_ARR_DATE_OLD) { s += "报告送达日期（招标阶段）\n"; }
		if(SIGN_DOC_RCV_DATE != SIGN_DOC_RCV_DATE_OLD) { s += "资料收到时间（合同签订阶段）\n"; }
		if(SIGN_DOC_RPT_DATE != SIGN_DOC_RPT_DATE_OLD) { s += "合同审核报告时间（合同签订阶段)\n"; }
		if(SIGN_DOC_SND_TYPE != SIGN_DOC_SND_TYPE_OLD) { s += "报告送达方式（合同签订阶段)\n"; }
		if(SIGN_DOC_ARR_DATE != SIGN_DOC_ARR_DATE_OLD) { s += "报告送达日期（合同签订阶段)\n"; }
		if(SET_DOC_RCV_DATE != SET_DOC_RCV_DATE_OLD) { s += "资料收到时间（结算阶段）\n"; }
		if(SET_DOC_RPT_DATE != SET_DOC_RPT_DATE_OLD) { s += "结算报告出具时间（结算阶段）\n"; }
		if(SET_DOC_SND_TYPE != SET_DOC_SND_TYPE_OLD) { s += "报告送达方式（结算阶段）\n"; }
		if(SET_DOC_ARR_DATE != SET_DOC_ARR_DATE_OLD) { s += "报告送达日期（结算阶段）\n"; }
		if(PROGRESS_STATUS_MEMO != PROGRESS_STATUS_MEMO_OLD) { s += "项目大致进度简述\n"; }
		if(A_AMOUNT != A_AMOUNT_OLD) { s += "甲方收费\n"; }
		if(A_STATUS != A_STATUS_OLD) { s += "收费状态\n"; }
		if(B_TYPE != B_TYPE_OLD) { s += "乙方收费方式\n"; }
		if(B_AMOUNT != B_AMOUNT_OLD) { s += "乙方收费\n"; }
		if(A_INVOICE_DELI_DATE != A_INVOICE_DELI_DATE_OLD) { s += "甲方发票流转单日期\n"; }
		if(A_INVOICE_DATE != A_INVOICE_DATE_OLD) { s += "甲方开票日期\n"; }
		if(A_INVOICE_NO != A_INVOICE_NO_OLD) { s += "甲方发票号\n"; }
		if(A_SET_DATE != A_SET_DATE_OLD) { s += "甲方到账日期\n"; }
		if(B_INVOICE_DELI_DATE != B_INVOICE_DELI_DATE_OLD) { s += "乙方发票流转单日期\n"; }
		if(B_INVOICE_DATE != B_INVOICE_DATE_OLD) { s += "乙方开票日期\n"; }
		if(B_INVOICE_NO != B_INVOICE_NO_OLD) { s += "乙方发票号\n"; }
		if(B_SET_DATE != B_SET_DATE_OLD) { s += "乙方到账日期\n"; }
		if(B_RATE != B_RATE_OLD) { s += "乙方费率\n"; }
		if(PROF_INFO != PROF_INFO_OLD) { s += "专业公司内容\n"; }
		if(CNTRCT_INFO != CNTRCT_INFO_OLD) { s += "承揽内容\n"; }
		if(PROJECT_NAME_PASS != PROJECT_NAME_PASS_OLD) { s += "曾用名\n"; }
		return s;
	}
	
	function setAuditValue() {
		//委托公司
		$("#AGENT_NO").attr("value", $("#agentNo").val());
		$("#AGENT_CO_NAME").attr("value", $("#agentCoName").val());
		$("#AGENT_CO_MANAGER").attr("value", $("#agentCoManager").val());
		$("#AGENT_CO_MANAGER_TEL").attr("value", $("#agentCoManagerTel").val());
		$("#AGENT_CO_POST_ADDRESS").attr("value", $("#agentCoPostAddress").val());
		$("#AGENT_CO_MAIL").attr("value", $("#agentCoMail").val());
		$("#AGENT_INFO").attr("value", $("#agentInfo").val());
		
		//专业公司
		$("#PROF_NO").attr("value", $("#profNo").val());
		$("#PROF_CO_NAME").attr("value", $("#profCoName").val());
		$("#PROF_CO_MANAGER").attr("value", $("#profCoManager").val());
		$("#PROF_CO_MANAGER_TEL").attr("value", $("#profCoManagerTel").val());
		$("#PROF_CO_POST_ADDRESS").attr("value", $("#profCoPostAddress").val());
		$("#PROF_CO_MAIL").attr("value", $("#profCoMail").val());
		$("#PROF_INFO").attr("value", $("#profInfo").val())
		
		//承包公司
		$("#CONTRACT_CO_NO").attr("value", $("#contractCoNo").val());
		$("#CONTRACT_CO_NAME").attr("value", $("#contractCoName").val());
		$("#CONTRACT_CO_MANAGER").attr("value", $("#contractCoManager").val());
		$("#CONTRACT_CO_MANAGER_TEL").attr("value", $("#contractCoManagerTel").val());
		$("#CONTRACT_CO_POST_ADDRESS").attr("value", $("#contractCoPostAddress").val());
		$("#CONTRACT_CO_MAIL").attr("value", $("#contractCoMail").val());
		$("#CONTRACT_CO_INFO").attr("value", $("#contractCoInfo").val());
		$("#CONTRACT_CO_ID").attr("value", $("#contractCoId").val());
		
		//各类日期
		$("#DOC_REC_DATE").attr("value", $("#docRecDate").val());
		$("#SUPPORT_DOC_DATE").attr("value", $("#supportDocDate").val());
		$("#DRAFT_DATE").attr("value", $("#draftDate").val());
		$("#APPROVAL_SND_DATE").attr("value", $("#approvalSndDate").val());
		$("#APPROVAL_RCV_DATE").attr("value", $("#approvalRcvDate").val());
		$("#REPORT_RAISE_DATE").attr("value", $("#reportRaiseDate").val());
		var CNTRCT_INFO = $("#CNTRCT_INFO").val();
		if(CNTRCT_INFO == 5){
			$("#REPORT_SEAL_DATE").attr("value", $("#reportSealDate2").val());
		} else {
			$("#REPORT_SEAL_DATE").attr("value", $("#reportSealDate").val());
		}
		$("#REPORT_ARR_DATE").attr("value", $("#reportArrDate").val());
		$("#REG_DATE").attr("value", $("#regDate").val());
		$("#PLAN_DOC_RCV_DATE").attr("value", $("#planDocRcvDate").val());
		$("#PLAN_DOC_RPT_DATE").attr("value", $("#planDocRptDate").val());
		$("#PLAN_DOC_ARR_DATE").attr("value", $("#planDocArrDate").val());
		$("#BID_DOC_RCV_DATE").attr("value", $("#bidDocRcvDate").val());
		$("#BID_DOC_RPT_DATE").attr("value", $("#bidDocRptDate").val());
		$("#BID_DOC_ARR_DATE").attr("value", $("#bidDocArrDate").val());
		$("#SIGN_DOC_RCV_DATE").attr("value", $("#signDocRcvDate").val());
		$("#SIGN_DOC_RPT_DATE").attr("value", $("#signDocRptDate").val());
		$("#SIGN_DOC_ARR_DATE").attr("value", $("#signDocArrDate").val());
		$("#SET_DOC_RCV_DATE").attr("value", $("#setDocRcvDate").val());
		$("#SET_DOC_RPT_DATE").attr("value", $("#setDocRptDate").val());
		$("#SET_DOC_ARR_DATE").attr("value", $("#setDocArrDate").val());
		$("#A_INVOICE_DELI_DATE").attr("value", $("#aInvoiceDeliDate").val());
		$("#A_INVOICE_DATE").attr("value", $("#aInvoiceDate").val());
		$("#A_SET_DATE").attr("value", $("#aSetDate").val());
		$("#B_INVOICE_DELI_DATE").attr("value", $("#bInvoiceDeliDate").val());
		$("#B_INVOICE_DATE").attr("value", $("#bInvoiceDate").val());
		$("#B_SET_DATE").attr("value", $("#bSetDate").val());
		
		//setDefaultValue("PRE_SET");
		setDefaultValue("PRE_PRICE");
		setDefaultValue("VERIFY_PER_AMOUNT");
		setDefaultValue("VERIFY_AMOUNT");
		setDefaultValue("VERIFY_INCREASE");
		setDefaultValue("VERIFY_DECREASE");
		setDefaultValue("VERIFY_DIFF");
		setDefaultValue("VERIFY_DIFF_RATE");
		setDefaultValue("CNT_PRICE");
		setDefaultValue("PROJ_PRICE");
		setDefaultValue("LIMIT_PRICE");
		setDefaultValue("CNTRCT_PRICE");
		setDefaultValue("A_AMOUNT");
		setDefaultValue("B_AMOUNT");
		setDefaultValue("B_RATE");
		
		//自动计算：净核减和核减
		calcVERIFY_DIFF();
	}

	//对decimal类型的，为空时设为0.00
	function setDefaultValue(id) {
		if($("#" + id).val() == "") {
			$("#" + id).prop("value", "0.00");
		}
	}
	
	function getSelectCntrctInfo() {
		var list = document.getElementsByName("CNTRCT_INFO");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				$("#CNTRCT_INFO").val(i+1);
				break;
			}
		}
		showByCntrctInfo();
	}
	
	function showByCntrctInfo() {
		var list = document.getElementsByName("CNTRCT_INFO");
		var userRank="<%=session.getAttribute("user_rank")%>";
		if(userRank == "A" || userRank == "B"){
			for(var k = 0; k < list.length; k++) {
				list[k].disabled = true;
			}
		}

		var cntrctInfo = $("#CNTRCT_INFO").val();
		var userRank="<%=session.getAttribute("user_rank")%>";
		if(userRank == "A" || userRank == "B"){
			cntrctInfo.disabled = true;
		}
		
		if(cntrctInfo == 2) {//咨询
			//项目大致进度简述
			document.getElementById('progressStatusMemo').style.display='none';
			$("#PROGRESS_STATUS_MEMO").prop("value", "");
			//控制价金额
			document.getElementById('cntPrice').style.display='none';
			$("#CNT_PRICE").prop("value", "");
			//4个阶段
			document.getElementById('fourStage').style.display='none';$("#planDocRcvDate").prop("value", "");
			setFourStageBlack();
			//预算金额
			document.getElementById('prePriceLabel').innerhtml='初审金额';
			document.getElementById('prePriceLabel').style.display='block';
			document.getElementById('prePriceLabel2').style.display='none';
//			document.getElementById('prePrice').style.display='none';
			//初稿日期
			//document.getElementById('draftDateDiv').style.display='none';
			//$("#draftDate").prop("value", "");
			//审定单发出日期
			document.getElementById('approvalDiv').style.display='none';
			$("#approvalSndDate").prop("value", "");
			//快递单号
			document.getElementById('deliNo').style.display='none';
			$("#DELI_NO").prop("value", "");
			//预结算
			document.getElementById('preSet').style.display='block';
			//委托方
			document.getElementById('agent').style.display='block';
			//专业方
			document.getElementById('prof').style.display='block';
			//承揽单位
			document.getElementById('contract').style.display='block';
			//送审价等
			document.getElementById('verify').style.display='block';
			document.getElementById('verify2').style.display='block';
			//甲乙方
			document.getElementById('ab').style.display='block';
			//报告出具日期列
			document.getElementById('reportDiv').style.display='block';
			document.getElementById('reportDiv2').style.display='block';
			//资料收到时间
			document.getElementById('docRecDateDiv').style.display='block';
			//补充资料日期等
			document.getElementById('supportDocDateDiv').style.display='block';
			
		} else if(cntrctInfo == 3) {//清单编制
			//项目大致进度简述
			document.getElementById('progressStatusMemo').style.display='none';
			$("#PROGRESS_STATUS_MEMO").prop("value", "");
			//4个阶段
			document.getElementById('fourStage').style.display='none';
			setFourStageBlack();
			//预结算
			document.getElementById('preSet').style.display='none';
			$("#PRE_SET").prop("value", "");
			//预算金额
			document.getElementById('prePriceLabel').style.display='none';
			document.getElementById('prePriceLabel2').style.display='none';			
			document.getElementById('prePrice').style.display='none';
			
			//初稿日期
			document.getElementById('draftDateDiv').style.display='none';
			$("#draftDate").prop("value", "");
			//委托方
			document.getElementById('agent').style.display='none';
			$("#AGENT_INFO").prop("value", "");
			//专业方
			document.getElementById('prof').style.display='none';
			$("#PROF_INFO").prop("value", "");
			//承揽单位
			document.getElementById('contract').style.display='none';
			$("#CONTRACT_CO_ID").prop("value", "");
			$("#CONTRACT_CO_INFO").prop("value", "");
			//审定单发出日期
			document.getElementById('approvalDiv').style.display='none';
			$("#approvalSndDate").prop("value", "");
			//快递单号
			document.getElementById('deliNo').style.display='none';
			$("#DELI_NO").prop("value", "");
			//送审价等
			document.getElementById('verify').style.display='none';
			document.getElementById('verify2').style.display='none';
			$("#VERIFY_PER_AMOUNT").prop("value", "");
			$("#VERIFY_AMOUNT").prop("value", "");
			$("#VERIFY_INCREASE").prop("value", "");
			$("#VERIFY_DECREASE").prop("value", "");
			$("#VERIFY_DIFF").prop("value", "");
			$("#VERIFY_DIFF_RATE").prop("value", "");
			//控制价金额
			document.getElementById('cntPrice').style.display='none';
			$("#CNT_PRICE").prop("value", "");
			//甲乙方
//			document.getElementById('ab').style.display='none';
			document.getElementById('ab2').style.display='none';
			document.getElementById('ab3').style.display='none';
			document.getElementById('ab4').style.display='none';
			document.getElementById('ab5').style.display='none';			setABBlack();
			//报告出具日期列
			document.getElementById('reportDiv').style.display='block';
			document.getElementById('reportDiv2').style.display='block';
			//资料收到时间
			document.getElementById('docRecDateDiv').style.display='block';
			//补充资料日期等
			document.getElementById('supportDocDateDiv').style.display='block';
			
		} else if(cntrctInfo == 4) {//控制价编制
			//项目大致进度简述
			document.getElementById('progressStatusMemo').style.display='none';
			$("#PROGRESS_STATUS_MEMO").prop("value", "");
			//4个阶段
			document.getElementById('fourStage').style.display='none';
			setFourStageBlack();
			//预结算
			document.getElementById('preSet').style.display='none';
			$("#PRE_SET").prop("value", "");
			//预算金额
			document.getElementById('prePriceLabel').innerhtml='初审金额';
			document.getElementById('prePriceLabel').style.display='block';
			document.getElementById('prePriceLabel2').style.display='none';
			document.getElementById('prePrice').style.display='block';
//			document.getElementById('prePrice').style.display='none';
			
			//初稿日期
			//document.getElementById('draftDateDiv').style.display='none';
			//$("#draftDate").prop("value", "");
			//委托方
			document.getElementById('agent').style.display='none';
			$("#AGENT_INFO").prop("value", "");
			//专业方
			document.getElementById('prof').style.display='none';
			$("#PROF_INFO").prop("value", "");
			//承揽单位
			document.getElementById('contract').style.display='none';
			$("#CONTRACT_CO_ID").prop("value", "");
			$("#CONTRACT_CO_INFO").prop("value", "");
			//审定单发出日期
			document.getElementById('approvalDiv').style.display='none';
			$("#approvalSndDate").prop("value", "");
			//快递单号
			document.getElementById('deliNo').style.display='none';
			$("#DELI_NO").prop("value", "");
			//送审价等
			document.getElementById('verify').style.display='none';
			document.getElementById('verify2').style.display='none';
			$("#VERIFY_PER_AMOUNT").prop("value", "");
			$("#VERIFY_AMOUNT").prop("value", "");
			$("#VERIFY_INCREASE").prop("value", "");
			$("#VERIFY_DECREASE").prop("value", "");
			$("#VERIFY_DIFF").prop("value", "");
			$("#VERIFY_DIFF_RATE").prop("value", "");
			//甲乙方
//			document.getElementById('ab').style.display='none';
			document.getElementById('ab2').style.display='none';
			document.getElementById('ab3').style.display='none';
			document.getElementById('ab4').style.display='none';
			document.getElementById('ab5').style.display='none';			setABBlack();
			//控制价金额
			document.getElementById('cntPrice').style.display='block';	
			//报告出具日期列
			document.getElementById('reportDiv').style.display='block';
			document.getElementById('reportDiv2').style.display='block';
			//资料收到时间
			document.getElementById('docRecDateDiv').style.display='block';
			//补充资料日期等
			document.getElementById('supportDocDateDiv').style.display='block';
			
		} else if(cntrctInfo == 5) {//投资监理A
			//资料收到时间
			document.getElementById('docRecDateDiv').style.display='none';
			$("#docRecDate").prop("value", "");
			//补充资料日期等
			document.getElementById('supportDocDateDiv').style.display='none';
			$("#supportDocDate").prop("value", "");
			$("#draftDate").prop("value", "");
			//预结算
			document.getElementById('preSet').style.display='none';
			$("#PRE_SET").prop("value", "");
			//预算金额
			document.getElementById('prePrice').style.display='block';
			document.getElementById('prePriceLabel').style.display='none';
			document.getElementById('prePriceLabel2').style.display='block';

			//审定单发出日期
			document.getElementById('approvalDiv').style.display='none';
			$("#approvalSndDate").prop("value", "");
			//快递单号
			document.getElementById('deliNo').style.display='none';
			$("#DELI_NO").prop("value", "");
			//控制价金额
			document.getElementById('cntPrice').style.display='none';
			$("#CNT_PRICE").prop("value", "");
			//报告出具日期列
			document.getElementById('reportDiv').style.display='none';
			document.getElementById('reportDiv2').style.display='none';
			$("#reportRaiseDate").prop("value", "");
			$("#reportSealDate").prop("value", "");
			$("#REPORT_ARR_TYPE").prop("value", "");
			$("#reportArrDate").prop("value", "");
			$("#regDate").prop("value", "");
			//委托方
			document.getElementById('agent').style.display='none';
			$("#AGENT_INFO").prop("value", "");
			//专业方
			document.getElementById('prof').style.display='none';
			$("#PROF_INFO").prop("value", "");
			//承揽单位
			document.getElementById('contract').style.display='none';
			$("#CONTRACT_CO_ID").prop("value", "");
			$("#CONTRACT_CO_INFO").prop("value", "");
			//项目大致进度简述
			document.getElementById('progressStatusMemo').style.display='block';
			//4个阶段
			document.getElementById('fourStage').style.display='block';
			//送审价等
			document.getElementById('verify').style.display='block';
			document.getElementById('verify2').style.display='block';
			//甲乙方
//			document.getElementById('ab').style.display='block';
			
		} else {//审价
			//项目大致进度简述
			document.getElementById('progressStatusMemo').style.display='none';
			$("#PROGRESS_STATUS_MEMO").prop("value", "");
			//控制价金额
			document.getElementById('cntPrice').style.display='none';
			$("#CNT_PRICE").prop("value", "");
			//4个阶段
			document.getElementById('fourStage').style.display='none';
			setFourStageBlack();
			//初稿日期
			document.getElementById('draftDateDiv').style.display='block';
			//预结算
			document.getElementById('preSet').style.display='block';
			//预算金额
			document.getElementById('prePrice').style.display='block';
			document.getElementById('prePriceLabel').innerText='初审金额';
			document.getElementById('prePriceLabel').style.display='block';
			document.getElementById('prePriceLabel2').style.display='none';
			
			//委托方
			document.getElementById('agent').style.display='block';
			//专业方
			document.getElementById('prof').style.display='block';
			//承揽单位
			document.getElementById('contract').style.display='block';
			//审定单发出日期
			document.getElementById('approvalDiv').style.display='block';
			//快递单号
			document.getElementById('deliNo').style.display='block';
			//送审价等
			document.getElementById('verify').style.display='block';
			document.getElementById('verify2').style.display='block';
			//甲乙方
			document.getElementById('ab').style.display='block';
			//报告出具日期列
			document.getElementById('reportDiv').style.display='block';
			document.getElementById('reportDiv2').style.display='block';
			//资料收到时间
			document.getElementById('docRecDateDiv').style.display='block';
			//补充资料日期等
			document.getElementById('supportDocDateDiv').style.display='block';
		}
		reserve6Change();
	}
	
	function reserve6Change(){
		//计价方式
		var reserve6 = $("#RESERVE6").val();
		document.getElementById('RESERVE6').style.display='block';
		if (reserve6 =='2') {
			document.getElementById('PriceTypeTotal').style.display='block';
		} else {
			document.getElementById('PriceTypeTotal').style.display='none';				
		}
		
	}

	function setFourStageBlack(){
		$("#PROJ_PRICE").prop("value", "");
		$("#planDocRptDate").prop("value", "");
		$("#PLAN_DOC_SND_TYPE").prop("value", "");
		$("#planDocArrDate").prop("value", "");
		$("#bidDocRcvDate").prop("value", "");
		$("#LIMIT_PRICE").prop("value", "");
		$("#bidDocRptDate").prop("value", "");
		$("#BID_DOC_SND_TYPE").prop("value", "");
		$("#bidDocArrDate").prop("value", "");
		$("#signDocRcvDate").prop("value", "");
		$("#CNTRCT_PRICE").prop("value", "");
		$("#signDocRptDate").prop("value", "");
		$("#SIGN_DOC_SND_TYPE").prop("value", "");
		$("#signDocArrDate").prop("value", "");
		$("#setDocRcvDate").prop("value", "");
		$("#reportSealDate2").prop("value", "");
		$("#setDocRptDate").prop("value", "");
		$("#SET_DOC_SND_TYPE").prop("value", "");
		$("#setDocArrDate").prop("value", "");
	}
	
	function setABBlack(){
		$("#B_TYPE").prop("value", "");
		$("#B_AMOUNT").prop("value", "");
		$("#aInvoiceDeliDate").prop("value", "");
		$("#aInvoiceDate").prop("value", "");
		$("#A_INVOICE_NO").prop("value", "");
		$("#aSetDate").prop("value", "");
		$("#bInvoiceDeliDate").prop("value", "");
		$("#bInvoiceDate").prop("value", "");
		$("#B_INVOICE_NO").prop("value", "");
		$("#bSetDate").prop("value", "");
		$("#B_RATE").prop("value", "");
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
		//$('#docRecDate').removeAttr("disabled");
		$('#cntrct_sel').attr('disabled',"true");
		$('#PROGRESS_STATUS_MEMO').attr('disabled',"true");
		$('#PRE_SET').attr('disabled',"true");
		$('#PRE_PRICE').attr('disabled',"true");
		$('#supportDocDate').attr('disabled',"disabled");
		$('#draftDate').attr('disabled',"disabled");
		$('#approvalSndDate').attr('disabled',"disabled");
		$('#reportRaiseDate').attr('disabled',"disabled");
		$('#selectAgent').attr('disabled',"disabled");
		$('#selectProf').attr('disabled',"disabled");
		$('#selectContract').attr('disabled',"disabled");
		$('#VERIFY_PER_AMOUNT').attr('disabled',"true");
		$('#VERIFY_AMOUNT').attr('disabled',"true");
		$('#VERIFY_INCREASE').attr('disabled',"true");
		$('#CNT_PRICE').attr('disabled',"true");
		$('#PROJ_PRICE').attr('disabled',"true");
		$('#planDocRptDate').attr('disabled',"disabled");
		$('#LIMIT_PRICE').attr('disabled',"true");
		$('#bidDocRptDate').attr('disabled',"disabled");
		$('#CNTRCT_PRICE').attr('disabled',"true");
		$('#signDocRptDate').attr('disabled',"disabled");
		$('#setDocRptDate').attr('disabled',"disabled");
		$('#A_AMOUNT').attr('disabled',"true");
		$('#A_STATUS').attr('disabled',"true");
		$('#B_TYPE').attr('disabled',"true");
		$('#B_AMOUNT').attr('disabled',"true");
		$('#B_RATE').attr('disabled',"true");
		$('#aInvoiceDeliDate').attr('disabled',"disabled");
		$('#bInvoiceDeliDate').attr('disabled',"disabled");
	}
	
	function disableC(){
		$('#cntrct_sel').attr('disabled',"true");
		$('#REPORT_NO').attr('disabled',"true");
		$('#PROJECT_MANAGER').attr('disabled',"true");
		//$('#PROJECT_NAME_PASS').attr('disabled',"true");
		//$('#PROJECT_NAME').attr('disabled',"true");
		//$('#PROGRESS_STATUS').attr('disabled',"disabled");
		$('#docRecDate').attr('disabled',"disabled");
		$('#planDocRcvDate').attr('disabled',"disabled");
		$('#bidDocRcvDate').attr('disabled',"disabled");
		$('#signDocRcvDate').attr('disabled',"disabled");
		$('#setDocRcvDate').attr('disabled',"disabled");
		
	}
	
	//合同选择
	function selectAuditCntrct() {
		var url = '<c:url value="/auditcntrct/showSelectAuditCntrctAction.action"></c:url>';
		url += "?date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	//承包公司
	function selectContractComp() {
		var url = '<c:url value="/agentcomp/showAgentCompAuditAction.action"></c:url>';
		url += "?agentAddFlag=3&date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	//专业公司
	function selectProfComp() {
		var url = '<c:url value="/agentcomp/showAgentCompAuditAction.action"></c:url>';
		url += "?agentAddFlag=2&date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	//委托公司
	function selectAgentComp() {
		var url = '<c:url value="/agentcomp/showAgentCompAuditAction.action"></c:url>';
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
		tmp = tmp.toFixed(6);
		//净核减=送审金额 - 审定金额
		$("#VERIFY_DIFF").attr("value", tmp);
		//净核减率=净核减/送审金额
		var tmp2 = 0;
		if(VERIFY_PER_AMOUNT == '0.00' || VERIFY_PER_AMOUNT == '0.000000'){
			tmp2 = parseFloat('0.00');
		} else {
			if(isReal2(VERIFY_PER_AMOUNT)) {
				tmp2 = tmp / parseFloat(VERIFY_PER_AMOUNT);
			}
		}
		tmp2 = tmp2.toFixed(4);
		$("#VERIFY_DIFF_RATE").attr("value", tmp2);
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
		tmp = tmp.toFixed(6);
		//核减=净核减  + 核增
		$("#VERIFY_DECREASE").attr("value", tmp);
	}
	
	function showRate(){
		var B_TYPE = $("#B_TYPE").val();
		if(B_TYPE == 1){
			document.getElementById('rate1').style.display='block';
			document.getElementById('rate2').style.display='none';
			document.getElementById('rate3').style.display='none';
		} else if(B_TYPE == 2){
			document.getElementById('rate1').style.display='none';
			document.getElementById('rate2').style.display='block';
			document.getElementById('rate3').style.display='none';
		} else{
			document.getElementById('rate1').style.display='none';
			document.getElementById('rate2').style.display='none';
			document.getElementById('rate3').style.display='block';
		}
	}
	
	function goAuditList() {
		window.location.href = '<c:url value="/audit/showAuditAction.action"></c:url>';
	}
	
	function goAuditListDetail() {
		window.location.href = '<c:url value="/audit/queryAuditList.action"></c:url>';
	}
	
	function exportAudit() {
		var CNTRCT_TYPE = $("#CNTRCT_TYPE").val();
//		alert(CNTRCT_TYPE);
		if(CNTRCT_TYPE == 1){
			document.mainform.action = '<c:url value="/audit/exportAuditMetroAction.action"></c:url>';
		} else {
			document.mainform.action = '<c:url value="/audit/exportAuditNoMetroAction.action"></c:url>';
		}
		document.mainform.submit();
	}
	
	function exportAuditRegister() {
		document.mainform.action = '<c:url value="/audit/exportAuditRegisterAction.action"></c:url>';
		document.mainform.submit();
	}
	function exportAuditSummary() {
		document.mainform.action = '<c:url value="/audit/exportAuditSummaryAction.action"></c:url>';
		document.mainform.submit();
	}
	function exportAuditCover() {
		document.mainform.action = '<c:url value="/audit/exportAuditCoverAction.action"></c:url>';
		document.mainform.submit();
	}
	function exportAuditSign() {
		document.mainform.action = '<c:url value="/audit/exportAuditSignAction.action"></c:url>';
		document.mainform.submit();
	}
	function exportAuditReport() {
		document.mainform.action = '<c:url value="/audit/exportAuditReportAction.action"></c:url>';
		document.mainform.submit();
	}

	//委托公司
	//显示列表选择模态窗体
	function showAgentComSelect() {
		$("#agentCompNoLow").val("");
		$("#agentCompNoHigh").val("");
		$("#agentCompName").val("");
		//查询委托公司
		querySelectAgentPageAjax("0");
		//禁用 Bootstrap 模态框(Modal) 点击空白时自动关闭
		$('#agentCompModal').modal({backdrop: 'static', keyboard: false});
		$('#agentCompModal').modal('show');
	}
	
	//专业公司
	//显示列表选择模态窗体
	function showProfComSelect() {
		$("#profCompNoLow").val("");
		$("#profCompNoHigh").val("");
		$("#profCompName").val("");
		//查询委托公司
		querySelectProfPageAjax("0");
		//禁用 Bootstrap 模态框(Modal) 点击空白时自动关闭
		$('#profCompModal').modal({backdrop: 'static', keyboard: false});
		$('#profCompModal').modal('show');
	}
	
	/**
	 * 注：翻页函数，每个列表选择模态窗体必须实现这个函数
	 */
	function querySelectAgentPageAjax(index) {
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
		var ajaxTotalCount = $("#ajaxTotalCountAgent").val();
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
				$("#ajaxpagenumAgent").val("");
				var totalPage = data.data.totalPage;
				//总数据量
				var totalCount = data.data.totalCount;
				totalPage = parseInt(totalPage);
				totalCount = parseInt(totalCount);
				$("#ajaxTotalPageAgent").val(totalPage);
				$("#ajaxTotalCountAgent").val(totalCount);
				//分页
				var skipList = data.data.skipList;
				$("#ajaxskiplistAgent").empty();
				//第一页
				$("#ajaxskiplistAgent").append('<li><a href="javascript:void(0);" onclick="turningAjaxPageAgent(1);">&laquo;</a></li>');
				$.each(skipList, function(ii, nn) {
					if((parseInt(nn) - 1) == parseInt(index)) {
						$("#ajaxskiplistAgent").append('<li class="active"><a href="javascript:void(0);">' + nn + '</a></li>');
					} else {
						$("#ajaxskiplistAgent").append('<li><a href="javascript:void(0);" onclick="turningAjaxPageAgent(' + nn + ');">' + nn + '</a></li>');
					}
				});
				//页信息
				$("#ajaxPageInfoAgent").empty();
				var startIndex = data.data.startIndex;
				startIndex = parseInt(startIndex);
				if(totalPage == 0) {
					totalPage = 1;
				}
				var ajaxPageInfo = '第' + (startIndex + 1) + '页/共' + totalPage + '页&nbsp;&nbsp;&nbsp;&nbsp;共' + totalCount + '条记录';
				$("#ajaxPageInfoAgent").append(ajaxPageInfo);
				//最后一页
				$("#ajaxskiplistAgent").append('<li><a href="javascript:void(0);" onclick="turningLastPageAgent();">&raquo;</a></li>');
				//-----共通2 end-----
			} else {
				alert(data.resultMessage);
			}
		});
		//agentCompData
	}
	
	/**
	 * 注：翻页函数，每个列表选择模态窗体必须实现这个函数
	 */
	function querySelectProfPageAjax(index) {
		//各个模块自己的参数
		var profCompNoLow = $("#profCompNoLow").val();
		var profCompNoHigh = $("#profCompNoHigh").val();
		var profCompName = $("#profCompName").val();
		var param = new Object();
		param.agentCompNoLow = profCompNoLow;
		param.agentCompNoHigh = profCompNoHigh;
		param.agentCompName = encodeURI(profCompName,"utf-8");
		param.agentAddFlag = "1";
		
		//-----共通1 start-----
		//页码
		param.ajaxPageIndex = index;
		//总记录数
		var ajaxTotalCount = $("#ajaxTotalCountProf").val();
		if(ajaxTotalCount == "") {
			ajaxTotalCount = "0";
		}
		param.ajaxTotalCount = ajaxTotalCount;
		//-----共通1 end-----
		
		$.getJSON('<%=request.getContextPath()%>/agentcomp/queryAgentCompAjax.action', param, function(data) {
			if(data.resultCode == 0) {
				var items = data.data.items;
				//数据列表
				$("#profCompData").empty();
				$.each(items, function(i, n) {
					var html = "";
					html += '<tr onclick="checkRadioTr(this, event);">';
					html += '	<td><input name="profCompKey" type="radio" value=""/></td>';
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
					$("#profCompData").append(html);
				});
				
				//-----共通2 start-----
				//分页页码
				$("#ajaxpagenumProf").val("");
				var totalPage = data.data.totalPage;
				//总数据量
				var totalCount = data.data.totalCount;
				totalPage = parseInt(totalPage);
				totalCount = parseInt(totalCount);
				$("#ajaxTotalPageProf").val(totalPage);
				$("#ajaxTotalCountProf").val(totalCount);
				//分页
				var skipList = data.data.skipList;
				$("#ajaxskiplistProf").empty();
				//第一页
				$("#ajaxskiplistProf").append('<li><a href="javascript:void(0);" onclick="turningAjaxPageProf(1);">&laquo;</a></li>');
				$.each(skipList, function(ii, nn) {
					if((parseInt(nn) - 1) == parseInt(index)) {
						$("#ajaxskiplistProf").append('<li class="active"><a href="javascript:void(0);">' + nn + '</a></li>');
					} else {
						$("#ajaxskiplistProf").append('<li><a href="javascript:void(0);" onclick="turningAjaxPageProf(' + nn + ');">' + nn + '</a></li>');
					}
				});
				//页信息
				$("#ajaxPageInfoProf").empty();
				var startIndex = data.data.startIndex;
				startIndex = parseInt(startIndex);
				if(totalPage == 0) {
					totalPage = 1;
				}
				var ajaxPageInfo = '第' + (startIndex + 1) + '页/共' + totalPage + '页&nbsp;&nbsp;&nbsp;&nbsp;共' + totalCount + '条记录';
				$("#ajaxPageInfoProf").append(ajaxPageInfo);
				//最后一页
				$("#ajaxskiplistProf").append('<li><a href="javascript:void(0);" onclick="turningLastPageProf();">&raquo;</a></li>');
				//-----共通2 end-----
			} else {
				alert(data.resultMessage);
			}
		});
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
			$('#agentCoMail').val(CO_MANAGER_EMAIL1);
			var agent_info = CO_MANAGER1;
			if(CO_MANAGER1 != ""){
				agent_info = CO_MANAGER1 + "※" + CO_MANAGER_TEL1 + "※" + CO_ADDRESS1 + "※" + CO_MANAGER_EMAIL1;
			}
			$('#agentInfo').val(agent_info);
			//隐藏模态窗体
			$('#agentCompModal').modal('hide');
		} else {
			alert("请选择一条记录！");
		}
	}
	
	//列表页选择确定按钮
	function selectProfComp() {
		var obj = null;
		var list = document.getElementsByName("profCompKey");
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
			var PROF_COMP_NO = inputs[0].value;
			var PROF_COMP_NAME = inputs[1].value;
			var CO_MANAGER1 = inputs[2].value;
			var CO_MANAGER_TEL1 = inputs[3].value;
			var CO_ADDRESS1 = inputs[4].value;
			var CO_MANAGER_EMAIL1 = inputs[5].value;
			$('#profNo').val(PROF_COMP_NO);
			$('#profCoName').val(PROF_COMP_NAME);
			$('#profCoManager').val(CO_MANAGER1);
			$('#profCoManagerTel').val(CO_MANAGER_TEL1);
			$('#profCoPostAddress').val(CO_ADDRESS1);
			$('#profCoMail').val(CO_MANAGER_EMAIL1);
			var prof_info = CO_MANAGER1;
			if(CO_MANAGER1 != ""){
				prof_info = CO_MANAGER1 + "※" + CO_MANAGER_TEL1 + "※" + CO_ADDRESS1 + "※" + CO_MANAGER_EMAIL1;
			}
			$('#profInfo').val(prof_info);
			//隐藏模态窗体
			$('#profCompModal').modal('hide');
		} else {
			alert("请选择一条记录！");
		}
	}
	
	//承包公司
	//显示列表选择模态窗体
	function showContractComSelect() {
		$("#contractCompNoLow").val("");
		$("#contractCompNoHigh").val("");
		$("#contractCompName").val("");
		//查询委托公司
		queryContractSelectPageAjax("0");
		//禁用 Bootstrap 模态框(Modal) 点击空白时自动关闭
		$('#contractCompModal').modal({backdrop: 'static', keyboard: false});
		$('#contractCompModal').modal('show');
	}
	
	/**
	 * 注：翻页函数，每个列表选择模态窗体必须实现这个函数
	 */
	function queryContractSelectPageAjax(index) {
		//各个模块自己的参数
		var contractCompNoLow = $("#contractCompNoLow").val();
		var contractCompNoHigh = $("#contractCompNoHigh").val();
		var contractCompName = $("#contractCompName").val();
		var param = new Object();
		param.agentCompNoLow = contractCompNoLow;
		param.agentCompNoHigh = contractCompNoHigh;
		param.agentCompName = encodeURI(contractCompName,"utf-8");
		param.agentAddFlag = "3";
		
		//-----共通1 start-----
		//页码
		param.ajaxPageIndex = index;
		//总记录数
		var ajaxTotalCount = $("#ajaxTotalCountContract").val();
		if(ajaxTotalCount == "") {
			ajaxTotalCount = "0";
		}
		param.ajaxTotalCount = ajaxTotalCount;
		//-----共通1 end-----
		
		$.getJSON('<%=request.getContextPath()%>/agentcomp/queryAgentCompAjax.action', param, function(data) {
			if(data.resultCode == 0) {
				var items = data.data.items;
				//数据列表
				$("#contractCompData").empty();
				$.each(items, function(i, n) {
					var html = "";
					html += '<tr onclick="checkRadioTr(this, event);">';
					html += '	<td><input name="contractCompKey" type="radio" value=""/></td>';
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
					$("#contractCompData").append(html);
				});
				
				//-----共通2 start-----
				//分页页码
				$("#ajaxpagenumContract").val("");
				var totalPage = data.data.totalPage;
				//总数据量
				var totalCount = data.data.totalCount;
				totalPage = parseInt(totalPage);
				totalCount = parseInt(totalCount);
				$("#ajaxTotalPageContract").val(totalPage);
				$("#ajaxTotalCountContract").val(totalCount);
				//分页
				var skipList = data.data.skipList;
				$("#ajaxskiplistContract").empty();
				//第一页
				$("#ajaxskiplistContract").append('<li><a href="javascript:void(0);" onclick="turningAjaxPageContract(1);">&laquo;</a></li>');
				$.each(skipList, function(ii, nn) {
					if((parseInt(nn) - 1) == parseInt(index)) {
						$("#ajaxskiplistContract").append('<li class="active"><a href="javascript:void(0);">' + nn + '</a></li>');
					} else {
						$("#ajaxskiplistContract").append('<li><a href="javascript:void(0);" onclick="turningAjaxPageContract(' + nn + ');">' + nn + '</a></li>');
					}
				});
				//页信息
				$("#ajaxPageInfoContract").empty();
				var startIndex = data.data.startIndex;
				startIndex = parseInt(startIndex);
				if(totalPage == 0) {
					totalPage = 1;
				}
				var ajaxPageInfo = '第' + (startIndex + 1) + '页/共' + totalPage + '页&nbsp;&nbsp;&nbsp;&nbsp;共' + totalCount + '条记录';
				$("#ajaxPageInfoContract").append(ajaxPageInfo);
				//最后一页
				$("#ajaxskiplistContract").append('<li><a href="javascript:void(0);" onclick="turningLastPageContract();">&raquo;</a></li>');
				//-----共通2 end-----
			} else {
				alert(data.resultMessage);
			}
		});
		//agentCompData
	}
	
	//列表页选择确定按钮
	function selectContractComp() {
		var obj = null;
		var list = document.getElementsByName("contractCompKey");
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
			$('#contractCoNo').val(ANGENT_COMP_NO);
			$('#contractCoId').val(ANGENT_COMP_NO);
			$('#contractCoName').val(ANGENT_COMP_NAME);
			$('#contractCoManager').val(CO_MANAGER1);
			$('#contractCoManagerTel').val(CO_MANAGER_TEL1);
			$('#contractCoPostAddress').val(CO_ADDRESS1);
			$('#contractCoMail').val(CO_MANAGER_EMAIL1);
			var contract_info = CO_MANAGER1;
			if(CO_MANAGER1 != ""){
				contract_info = CO_MANAGER1 + "※" + CO_MANAGER_TEL1 + "※" + CO_ADDRESS1 + "※" + CO_MANAGER_EMAIL1;
			}
			$('#contractCoInfo').val(contract_info);
			//隐藏模态窗体
			$('#contractCompModal').modal('hide');
		} else {
			alert("请选择一条记录！");
		}
	}
	
	function addAgentCom() {
		document.mainform.action = '<c:url value="/agentcomp/showAddAgentComp2Action.action"></c:url>';
		document.mainform.submit();
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
					<s:hidden name="updAuditDto.AGENT_NO" id="AGENT_NO"/>
					<s:hidden name="updAuditDto.AGENT_CO_NAME" id="AGENT_CO_NAME"/>
					<s:hidden name="updAuditDto.AGENT_CO_MANAGER" id="AGENT_CO_MANAGER"/>
					<s:hidden name="updAuditDto.AGENT_CO_MANAGER_TEL" id="AGENT_CO_MANAGER_TEL"/>
					<s:hidden name="updAuditDto.AGENT_CO_POST_ADDRESS" id="AGENT_CO_POST_ADDRESS"/>
					<s:hidden name="updAuditDto.AGENT_CO_MAIL" id="AGENT_CO_MAIL"/>
					
					<s:hidden name="updAuditDto.PROF_NO" id="PROF_NO"/>
					<s:hidden name="updAuditDto.PROF_CO_NAME" id="PROF_CO_NAME"/>
					<s:hidden name="updAuditDto.PROF_CO_MANAGER" id="PROF_CO_MANAGER"/>
					<s:hidden name="updAuditDto.PROF_CO_MANAGER_TEL" id="PROF_CO_MANAGER_TEL"/>
					<s:hidden name="updAuditDto.PROF_CO_POST_ADDRESS" id="PROF_CO_POST_ADDRESS"/>
					<s:hidden name="updAuditDto.PROF_CO_MAIL" id="PROF_CO_MAIL"/>
					
					<s:hidden name="updAuditDto.CONTRACT_CO_NO" id="CONTRACT_CO_NO"/>
					<s:hidden name="updAuditDto.CONTRACT_CO_NAME" id="CONTRACT_CO_NAME"/>
					<s:hidden name="updAuditDto.CONTRACT_CO_MANAGER" id="CONTRACT_CO_MANAGER"/>
					<s:hidden name="updAuditDto.CONTRACT_CO_MANAGER_TEL" id="CONTRACT_CO_MANAGER_TEL"/>
					<s:hidden name="updAuditDto.CONTRACT_CO_POST_ADDRESS" id="CONTRACT_CO_POST_ADDRESS"/>
					<s:hidden name="updAuditDto.CONTRACT_CO_MAIL" id="CONTRACT_CO_MAIL"/>
					
					<s:hidden name="updAuditDto.DOC_REC_DATE" id="DOC_REC_DATE"/>
					<s:hidden name="updAuditDto.SUPPORT_DOC_DATE" id="SUPPORT_DOC_DATE"/>
					<s:hidden name="updAuditDto.DRAFT_DATE" id="DRAFT_DATE"/>
					<s:hidden name="updAuditDto.APPROVAL_SND_DATE" id="APPROVAL_SND_DATE"/>
					<s:hidden name="updAuditDto.APPROVAL_RCV_DATE" id="APPROVAL_RCV_DATE"/>
					<s:hidden name="updAuditDto.REPORT_RAISE_DATE" id="REPORT_RAISE_DATE"/>
					<s:hidden name="updAuditDto.REPORT_SEAL_DATE" id="REPORT_SEAL_DATE"/>
					<s:hidden name="updAuditDto.REPORT_ARR_DATE" id="REPORT_ARR_DATE"/>
					<s:hidden name="updAuditDto.REG_DATE" id="REG_DATE"/>
					<s:hidden name="updAuditDto.PLAN_DOC_RCV_DATE" id="PLAN_DOC_RCV_DATE"/>
					<s:hidden name="updAuditDto.PLAN_DOC_RPT_DATE" id="PLAN_DOC_RPT_DATE"/>
					<s:hidden name="updAuditDto.PLAN_DOC_ARR_DATE" id="PLAN_DOC_ARR_DATE"/>
					<s:hidden name="updAuditDto.BID_DOC_RCV_DATE" id="BID_DOC_RCV_DATE"/>
					<s:hidden name="updAuditDto.BID_DOC_RPT_DATE" id="BID_DOC_RPT_DATE"/>
					<s:hidden name="updAuditDto.BID_DOC_ARR_DATE" id="BID_DOC_ARR_DATE"/>
					<s:hidden name="updAuditDto.SIGN_DOC_RCV_DATE" id="SIGN_DOC_RCV_DATE"/>
					<s:hidden name="updAuditDto.SIGN_DOC_RPT_DATE" id="SIGN_DOC_RPT_DATE"/>
					<s:hidden name="updAuditDto.SIGN_DOC_ARR_DATE" id="SIGN_DOC_ARR_DATE"/>
					<s:hidden name="updAuditDto.SET_DOC_RCV_DATE" id="SET_DOC_RCV_DATE"/>
					<s:hidden name="updAuditDto.SET_DOC_RPT_DATE" id="SET_DOC_RPT_DATE"/>
					<s:hidden name="updAuditDto.SET_DOC_ARR_DATE" id="SET_DOC_ARR_DATE"/>
					<s:hidden name="updAuditDto.A_INVOICE_DELI_DATE" id="A_INVOICE_DELI_DATE"/>
					<s:hidden name="updAuditDto.A_INVOICE_DATE" id="A_INVOICE_DATE"/>
					<s:hidden name="updAuditDto.A_SET_DATE" id="A_SET_DATE"/>
					<s:hidden name="updAuditDto.B_INVOICE_DELI_DATE" id="B_INVOICE_DELI_DATE"/>
					<s:hidden name="updAuditDto.B_INVOICE_DATE" id="B_INVOICE_DATE"/>
					<s:hidden name="updAuditDto.B_SET_DATE" id="B_SET_DATE"/>
					<s:hidden name="updAuditDto.AGENT_INFO" id="AGENT_INFO"/>
					<s:hidden name="updAuditDto.PROF_INFO" id="PROF_INFO"/>
					<s:hidden name="updAuditDto.CONTRACT_CO_ID" id="CONTRACT_CO_ID"/>
					<s:hidden name="updAuditDto.CONTRACT_CO_INFO" id="CONTRACT_CO_INFO"/>
					<s:hidden name="updAuditDto.CNTRCT_INFO" id="CNTRCT_INFO"/>
					<s:hidden name="auditCntrctDto.CNTRCT_TYPE" id="CNTRCT_TYPE"/>
					<s:hidden name="updAuditDto.B_AMOUNT" id="B_AMOUNT"/>
					
					<s:hidden name="updAuditDtoOld.CNTRCT_NO" id="CNTRCT_NO_OLD"/>
					<s:hidden name="updAuditDtoOld.CNTRCT_NM" id="CNTRCT_NM_OLD"/>
					<s:hidden name="updAuditDtoOld.REPORT_NO" id="REPORT_NO_OLD"/>
					<s:hidden name="updAuditDtoOld.PROJECT_MANAGER" id="PROJECT_MANAGER_OLD"/>
					<s:hidden name="updAuditDtoOld.PROJECT_NAME" id="PROJECT_NAME_OLD"/>
					<s:hidden name="updAuditDtoOld.AGENT_NO" id="AGENT_NO_OLD"/>
					<s:hidden name="updAuditDtoOld.AGENT_CO_NAME" id="AGENT_CO_NAME_OLD"/>
					<s:hidden name="updAuditDtoOld.AGENT_CO_MANAGER" id="AGENT_CO_MANAGER_OLD"/>
					<s:hidden name="updAuditDtoOld.AGENT_CO_MANAGER_TEL" id="AGENT_CO_MANAGER_TEL_OLD"/>
					<s:hidden name="updAuditDtoOld.AGENT_CO_POST_ADDRESS" id="AGENT_CO_POST_ADDRESS_OLD"/>
					<s:hidden name="updAuditDtoOld.AGENT_CO_MAIL" id="AGENT_CO_MAIL_OLD"/>
					<s:hidden name="updAuditDtoOld.PROF_NO" id="PROF_NO_OLD"/>
					<s:hidden name="updAuditDtoOld.PROF_CO_NAME" id="PROF_CO_NAME_OLD"/>
					<s:hidden name="updAuditDtoOld.PROF_CO_MANAGER" id="PROF_CO_MANAGER_OLD"/>
					<s:hidden name="updAuditDtoOld.PROF_CO_MANAGER_TEL" id="PROF_CO_MANAGER_TEL_OLD"/>
					<s:hidden name="updAuditDtoOld.PROF_CO_POST_ADDRESS" id="PROF_CO_POST_ADDRESS_OLD"/>
					<s:hidden name="updAuditDtoOld.PROF_CO_MAIL" id="PROF_CO_MAIL_OLD"/>
					<s:hidden name="updAuditDtoOld.CONTRACT_CO_NO" id="CONTRACT_CO_NO_OLD"/>
					<s:hidden name="updAuditDtoOld.CONTRACT_CO_NAME" id="CONTRACT_CO_NAME_OLD"/>
					<s:hidden name="updAuditDtoOld.CONTRACT_CO_MANAGER" id="CONTRACT_CO_MANAGER_OLD"/>
					<s:hidden name="updAuditDtoOld.CONTRACT_CO_MANAGER_TEL" id="CONTRACT_CO_MANAGER_TEL_OLD"/>
					<s:hidden name="updAuditDtoOld.CONTRACT_CO_POST_ADDRESS" id="CONTRACT_CO_POST_ADDRESS_OLD"/>
					<s:hidden name="updAuditDtoOld.CONTRACT_CO_MAIL" id="CONTRACT_CO_MAIL_OLD"/>
					<s:hidden name="updAuditDtoOld.PROGRESS_STATUS" id="PROGRESS_STATUS_OLD"/>
					<s:hidden name="updAuditDtoOld.PRE_SET" id="PRE_SET_OLD"/>
					<s:hidden name="updAuditDtoOld.PRE_PRICE" id="PRE_PRICE_OLD"/>
					<s:hidden name="updAuditDtoOld.DELI_NO" id="DELI_NO_OLD"/>
					<s:hidden name="updAuditDtoOld.REPORT_ARR_TYPE" id="REPORT_ARR_TYPE_OLD"/>
					<s:hidden name="updAuditDtoOld.AGENT_INFO" id="AGENT_INFO_OLD"/>
					<s:hidden name="updAuditDtoOld.CONTRACT_CO_ID" id="CONTRACT_CO_ID_OLD"/>
					<s:hidden name="updAuditDtoOld.CONTRACT_CO_INFO" id="CONTRACT_CO_INFO_OLD"/>
					<s:hidden name="updAuditDtoOld.VERIFY_PER_AMOUNT" id="VERIFY_PER_AMOUNT_OLD"/>
					<s:hidden name="updAuditDtoOld.VERIFY_AMOUNT" id="VERIFY_AMOUNT_OLD"/>
					<s:hidden name="updAuditDtoOld.VERIFY_INCREASE" id="VERIFY_INCREASE_OLD"/>
					<s:hidden name="updAuditDtoOld.VERIFY_DECREASE" id="VERIFY_DECREASE_OLD"/>
					<s:hidden name="updAuditDtoOld.VERIFY_DIFF" id="VERIFY_DIFF_OLD"/>
					<s:hidden name="updAuditDtoOld.VERIFY_DIFF_RATE" id="VERIFY_DIFF_RATE_OLD"/>
					<s:hidden name="updAuditDtoOld.CNT_PRICE" id="CNT_PRICE_OLD"/>
					<s:hidden name="updAuditDtoOld.PROJ_PRICE" id="PROJ_PRICE_OLD"/>
					<s:hidden name="updAuditDtoOld.LIMIT_PRICE" id="LIMIT_PRICE_OLD"/>
					<s:hidden name="updAuditDtoOld.CNTRCT_PRICE" id="CNTRCT_PRICE_OLD"/>
					<s:hidden name="updAuditDtoOld.PROGRESS_STATUS_MEMO" id="PROGRESS_STATUS_MEMO_OLD"/>
					<s:hidden name="updAuditDtoOld.A_AMOUNT" id="A_AMOUNT_OLD"/>
					<s:hidden name="updAuditDtoOld.A_STATUS" id="A_STATUS_OLD"/>
					<s:hidden name="updAuditDtoOld.B_TYPE" id="B_TYPE_OLD"/>
					<s:hidden name="updAuditDtoOld.B_AMOUNT" id="B_AMOUNT_OLD"/>
					<s:hidden name="updAuditDtoOld.A_INVOICE_NO" id="A_INVOICE_NO_OLD"/>
					<s:hidden name="updAuditDtoOld.B_INVOICE_NO" id="B_INVOICE_NO_OLD"/>
					<s:hidden name="updAuditDtoOld.B_RATE" id="B_RATE_OLD"/>
					<s:hidden name="updAuditDtoOld.PROF_INFO" id="PROF_INFO_OLD"/>					
					<s:hidden name="updAuditDtoOld.CNTRCT_INFO" id="CNTRCT_INFO_OLD"/>
					<s:hidden name="updAuditDtoOld.PROJECT_NAME_PASS" id="PROJECT_NAME_PASS_OLD"/>
					<s:hidden name="updAuditDtoOld.PLAN_DOC_SND_TYPE" id="PLAN_DOC_SND_TYPE_OLD"/>
					<s:hidden name="updAuditDtoOld.BID_DOC_SND_TYPE" id="BID_DOC_SND_TYPE_OLD"/>
					<s:hidden name="updAuditDtoOld.SIGN_DOC_SND_TYPE" id="SIGN_DOC_SND_TYPE_OLD"/>
					<s:hidden name="updAuditDtoOld.SET_DOC_SND_TYPE" id="SET_DOC_SND_TYPE_OLD"/>
					
				<input id="DOC_REC_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.DOC_REC_DATE" format="yyyy-MM-dd"/>"/>
				<input id="SUPPORT_DOC_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.SUPPORT_DOC_DATE" format="yyyy-MM-dd"/>"/>
				<input id="DRAFT_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.DRAFT_DATE" format="yyyy-MM-dd"/>"/>
				<input id="APPROVAL_SND_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.APPROVAL_SND_DATE" format="yyyy-MM-dd"/>"/>
				<input id="APPROVAL_RCV_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.APPROVAL_RCV_DATE" format="yyyy-MM-dd"/>"/>
				<input id="REPORT_RAISE_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.REPORT_RAISE_DATE" format="yyyy-MM-dd"/>"/>
				<input id="REPORT_SEAL_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.REPORT_SEAL_DATE" format="yyyy-MM-dd"/>"/>
				<input id="REPORT_ARR_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.REPORT_ARR_DATE" format="yyyy-MM-dd"/>"/>
				<input id="REG_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.REG_DATE" format="yyyy-MM-dd"/>"/>
				<input id="PLAN_DOC_RCV_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.PLAN_DOC_RCV_DATE" format="yyyy-MM-dd"/>"/>
				<input id="PLAN_DOC_RPT_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.PLAN_DOC_RPT_DATE" format="yyyy-MM-dd"/>"/>
				<input id="PLAN_DOC_ARR_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.PLAN_DOC_ARR_DATE" format="yyyy-MM-dd"/>"/>
				<input id="BID_DOC_RCV_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.BID_DOC_RCV_DATE" format="yyyy-MM-dd"/>"/>
				<input id="BID_DOC_RPT_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.BID_DOC_RPT_DATE" format="yyyy-MM-dd"/>"/>
				<input id="BID_DOC_ARR_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.BID_DOC_ARR_DATE" format="yyyy-MM-dd"/>"/>
				<input id="SIGN_DOC_RCV_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.SIGN_DOC_RCV_DATE" format="yyyy-MM-dd"/>"/>
				<input id="SIGN_DOC_RPT_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.SIGN_DOC_RPT_DATE" format="yyyy-MM-dd"/>"/>
				<input id="SIGN_DOC_ARR_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.SIGN_DOC_ARR_DATE" format="yyyy-MM-dd"/>"/>
				<input id="SET_DOC_RCV_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.SET_DOC_RCV_DATE" format="yyyy-MM-dd"/>"/>
				<input id="SET_DOC_RPT_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.SET_DOC_RPT_DATE" format="yyyy-MM-dd"/>"/>
				<input id="SET_DOC_ARR_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.SET_DOC_ARR_DATE" format="yyyy-MM-dd"/>"/>
				<input id="A_INVOICE_DELI_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.A_INVOICE_DELI_DATE" format="yyyy-MM-dd"/>"/>
				<input id="A_INVOICE_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.A_INVOICE_DATE" format="yyyy-MM-dd"/>"/>
				<input id="B_INVOICE_DELI_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.B_INVOICE_DELI_DATE" format="yyyy-MM-dd"/>"/>
				<input id="B_INVOICE_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.B_INVOICE_DATE" format="yyyy-MM-dd"/>"/>
				<input id="A_SET_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.A_SET_DATE" format="yyyy-MM-dd"/>"/>
				<input id="B_SET_DATE_OLD" type="hidden" value="<s:date name="updAuditDtoOld.B_SET_DATE" format="yyyy-MM-dd"/>"/>
					
					<h3 class="title"><label for="" class="col-lg-2 form-label">审价项目更新</label></h3>
					<div class="row">
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-2 form-label">合同归属</label>
							<div class="col-lg-1">
								<s:if test='auditCntrctDto.CNTRCT_BELONG == "1"'>
									<s:textfield name="" id="CNTRCT_BELONG" value="联合" disabled="true" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
								</s:if>
								<s:elseif test='auditCntrctDto.CNTRCT_BELONG == "2"'>
									<s:textfield name="" id="CNTRCT_BELONG" value="XX" disabled="true" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
								</s:elseif>
								<s:else>
									<s:textfield name="" id="CNTRCT_BELONG" value="" disabled="true" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
								</s:else>
							</div>
							<div class="col-lg-1">
								<button class="btn btn-success form-control" disabled="disabled" type="button" id="cntrct_sel" onclick="selectAuditCntrct();">合同选择</button>
							</div>
							<label for="" class="col-lg-1 form-label">合同编号</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.CNTRCT_NO" id="CNTRCT_NO" disabled="true" cssClass="form-control" maxlength="20" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label">合同性质</label>
							<div class="col-lg-2">
								<s:if test='auditCntrctDto.CNTRCT_TYPE == "1"'>
									<s:textfield name="CNTRCT_TYPE" id="" value="地铁" disabled="true" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
								</s:if>
								<s:elseif test='auditCntrctDto.CNTRCT_TYPE == "2"'>
									<s:textfield name="CNTRCT_TYPE" id="" value="非地铁" disabled="true" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
								</s:elseif>
								<s:else>
									<s:textfield name="CNTRCT_TYPE" id="" value="" disabled="true" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
								</s:else>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-2 form-label">合同名称</label>
							<div class="col-lg-5">
								<s:textfield name="auditCntrctDto.CNTRCT_NAME" id="CNTRCT_NAME" disabled="true" cssClass="form-control" maxlength="1000" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label">合同简称</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.CNTRCT_NM" id="CNTRCT_NM" disabled="true" cssClass="form-control" maxlength="100" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-2 form-label">委托单位</label>
							<div class="col-lg-5">
								<s:textfield name="auditCntrctDto.AUDIT_COMP_NAME" id="AUDIT_COMP_NAME" disabled="true" cssClass="form-control" maxlength="40" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label">联系人联系方式</label>
							<div class="col-lg-2">
								<s:textfield name="auditCntrctDto.CO_MANAGER_ADDRESS1" id="CO_MANAGER_ADDRESS1" disabled="true" cssClass="form-control" maxlength="100" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<label for="" class="col-lg-2 form-label">合同开始时间</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" disabled="disabled" id="strCntrctStDate" value="<s:date format="yyyy-MM-dd" name="auditCntrctDto.CNTRCT_ST_DATE"/>"maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
								
							</div>
							<label for="" class="col-lg-1 form-label">合同结束时间</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" disabled="disabled" id="strCntrctEdDate" value="<s:date format="yyyy-MM-dd" name="auditCntrctDto.CNTRCT_ED_DATE"/>"maxlength="10" />
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
								<s:if test='%{updAuditDto.CNTRCT_INFO == "1"}'>
									<input name="CNTRCT_INFO" type="radio" checked="checked" onclick="getSelectCntrctInfo();"/>
									<label class="form-label" for="">审价</label>　
								</s:if>
								<s:else>
									<input name="CNTRCT_INFO" type="radio" onclick="getSelectCntrctInfo();"/>
									<label class="form-label" for="">审价</label>　
								</s:else>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-2"></div>
							<div class="col-lg-5">
								<s:if test='%{updAuditDto.CNTRCT_INFO == "2"}'>
									<input name="CNTRCT_INFO" type="radio" checked="checked" onclick="getSelectCntrctInfo();"/>
									<label class="form-label" for="">咨询</label>　
								</s:if>
								<s:else>
									<input name="CNTRCT_INFO" type="radio" onclick="getSelectCntrctInfo();"/>
									<label class="form-label" for="">咨询</label>　
								</s:else>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-2"></div>
							<div class="col-lg-5">
								<s:if test='%{updAuditDto.CNTRCT_INFO == "3"}'>
									<input name="CNTRCT_INFO" type="radio" checked="checked" onclick="getSelectCntrctInfo();"/>
									<label class="form-label" for="">清单编制</label>　
								</s:if>
								<s:else>
									<input name="CNTRCT_INFO" type="radio" onclick="getSelectCntrctInfo();"/>
									<label class="form-label" for="">清单编制</label>　
								</s:else>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-2"></div>
							<div class="col-lg-5">
								<s:if test='%{updAuditDto.CNTRCT_INFO == "4"}'>
									<input name="CNTRCT_INFO" type="radio" checked="checked" onclick="getSelectCntrctInfo();"/>
									<label class="form-label" for="">控制价编制</label>　
								</s:if>
								<s:else>
									<input name="CNTRCT_INFO" type="radio" onclick="getSelectCntrctInfo();"/>
									<label class="form-label" for="">控制价编制</label>　
								</s:else>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-2"></div>
							<div class="col-lg-5">
								<s:if test='%{updAuditDto.CNTRCT_INFO == "5"}'>
									<input name="CNTRCT_INFO" type="radio" checked="checked" onclick="getSelectCntrctInfo();"/>
									<label class="form-label" for="">全过程投资监理</label>　
								</s:if>
								<s:else>
									<input name="CNTRCT_INFO" type="radio" onclick="getSelectCntrctInfo();"/>
									<label class="form-label" for="">全过程投资监理</label>　
								</s:else>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorBlue">项目文号</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.REPORT_NO" id="REPORT_NO" cssClass="col-lg-10 form-control" maxlength="16" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label colorBlue">工程师</label>
							<div class="col-lg-2">
								<select name="updAuditDto.PROJECT_MANAGER" id="PROJECT_MANAGER" class="form-control">
									<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
										<option value="<s:property value="LOGIN_NAME"/>" <s:if test="%{updAuditDto.PROJECT_MANAGER == LOGIN_NAME}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
									</s:iterator>
								</select>
							</div>
							<label for="" class="col-lg-1 form-label colorBlue">曾用名</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.PROJECT_NAME_PASS" id="PROJECT_NAME_PASS" cssClass="col-lg-10 form-control" maxlength="80" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorBlue">项目名称</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.PROJECT_NAME" id="PROJECT_NAME" cssClass="col-lg-10 form-control" maxlength="80" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label colorBlue">实施情况</label>
							<div class="col-lg-2">
								<select id="PROGRESS_STATUS" name="updAuditDto.PROGRESS_STATUS" class="form-control">
									<s:if test='updAuditDto.PROGRESS_STATUS == "1"'>
										<option value="">请选择</option>
										<option value="1" selected="selected">实施</option>
										<option value="2">中止</option>
										<option value="3">暂停</option>
									</s:if>
									<s:elseif test='updAuditDto.PROGRESS_STATUS == "2"'>
										<option value="">请选择</option>
										<option value="1">实施</option>
										<option value="2" selected="selected">中止</option>
										<option value="3">暂停</option>
									</s:elseif>
									<s:elseif test='updAuditDto.PROGRESS_STATUS == "3"'>
										<option value="">请选择</option>
										<option value="1">实施</option>
										<option value="2">中止</option>
										<option value="3" selected="selected">暂停</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="1">实施</option>
										<option value="2">中止</option>
										<option value="3">暂停</option>
									</s:else>
								</select>
							</div>
						</div>
						<div class="col-lg-12 form-group" id="docRecDateDiv">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorBlue">资料收到时间</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="docRecDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.DOC_REC_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 form-group" id="progressStatusMemo">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorGold">项目大致进度简述</label>
							<div class="col-lg-5">
								<s:textfield name="updAuditDto.PROGRESS_STATUS_MEMO" id="PROGRESS_STATUS_MEMO" cssClass="col-lg-10 form-control" maxlength="200" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-5">
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-2"></div>
							<div id="preSet">
							<label for="" class="col-lg-2 form-label colorGold">预/结算</label>
							<div class="col-lg-2">
								<%-- <s:textfield name="updAuditDto.PRE_SET" id="PRE_SET" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield> --%>
								<select id="PRE_SET" name="updAuditDto.PRE_SET" class="form-control">
									<s:if test='updAuditDto.PRE_SET == "1"'>
										<option value="">请选择</option>
										<option value="1" selected="selected">预算</option>
										<option value="2">结算</option>
									</s:if>
									<s:elseif test='updAuditDto.PRE_SET == "2"'>
										<option value="">请选择</option>
										<option value="1">预算</option>
										<option value="2" selected="selected">结算</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="1">预算</option>
										<option value="2">结算</option>
									</s:else>
								</select>
							</div>
							</div>
							<div id="prePrice">
							<!-- <label for="" id="prePriceLabel" class="col-lg-1 form-label colorGold" style="display: block;">预算金额</label>
							<label for="" id="prePriceLabel2" class="col-lg-2 form-label colorGold" style="display: none;">预算金额</label> -->
							<label for="" id="prePriceLabel" class="col-lg-1 form-label colorGold" style="display: block;"></label>
							<label for="" id="prePriceLabel2" class="col-lg-2 form-label colorGold" style="display: none;">预算金额</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.PRE_PRICE" id="PRE_PRICE" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							</div>
						</div>
						<div class="col-lg-12 form-group" id="supportDocDateDiv">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorGold">补充资料日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="supportDocDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.SUPPORT_DOC_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<div id="draftDateDiv">
							<label for="" class="col-lg-1 form-label colorGold">初稿日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="draftDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.DRAFT_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							</div>
						</div>
						<div class="col-lg-12 form-group" id="approvalDiv">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorGold">审定单发出日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="approvalSndDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.APPROVAL_SND_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label colorGray">审定单收到日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="approvalRcvDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.APPROVAL_RCV_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 form-group" id="deliNo">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorGray">快递单号</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.DELI_NO" id="DELI_NO" cssClass="col-lg-10 form-control" maxlength="20" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-12 form-group" id="reportDiv">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorGold">报告出具日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="reportRaiseDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.REPORT_RAISE_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-11 form-group" id="agent">
							<div class="col-lg-1"></div>
							<label for="" class="col-lg-2 form-label colorGold">委托方专业联系人及联系方式</label>
							<div class="col-lg-4">
								<input type="hidden" id="agentNo" value="<s:property value="updAuditDto.AGENT_NO"/>"/>
								<input type="hidden" id="agentCoName" value="<s:property value="updAuditDto.AGENT_CO_NAME"/>"/>
								<input type="hidden" id="agentCoManager" value="<s:property value="updAuditDto.AGENT_CO_MANAGER"/>"/>
								<input type="hidden" id="agentCoManagerTel" value="<s:property value="updAuditDto.AGENT_CO_MANAGER_TEL"/>"/>
								<input type="hidden" id="agentCoPostAddress" value="<s:property value="updAuditDto.AGENT_CO_POST_ADDRESS"/>"/>
								<input type="hidden" id="agentCoMail" value="<s:property value="updAuditDto.AGENT_CO_MAIL"/>"/>
								<s:textfield name="" id="agentInfo" disabled="true" cssClass="col-lg-10 form-control" value="%{updAuditDto.AGENT_INFO}" maxlength="200" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-1">
								<button class="btn btn-success form-control" type="button" id="selectAgent" onclick="showAgentComSelect();">选择</button>
							</div>
							<div class="col-lg-1">
								<button class="btn btn-success form-control" type="button" id="addAgent" onclick="addAgentCom();">新增</button>								
							</div>
						</div>
						<div class="col-lg-11 form-group" id="prof">
							<div class="col-lg-1"></div>
							<label for="" class="col-lg-2 form-label colorGold">专业公司联系人及联系方式</label>
							<div class="col-lg-4">
								<input type="hidden" id="profNo" value="<s:property value="updAuditDto.PROF_NO"/>"/>
								<input type="hidden" id="profCoManager" value="<s:property value="updAuditDto.PROF_CO_MANAGER"/>"/>
								<input type="hidden" id="profCoManagerTel" value="<s:property value="updAuditDto.PROF_CO_MANAGER_TEL"/>"/>
								<input type="hidden" id="profCoPostAddress" value="<s:property value="updAuditDto.PROF_CO_POST_ADDRESS"/>"/>
								<input type="hidden" id="profCoMail" value="<s:property value="updAuditDto.PROF_CO_MAIL"/>"/>
								<s:textfield name="" id="profInfo" disabled="true" cssClass="col-lg-10 form-control" value="%{updAuditDto.PROF_INFO}" maxlength="200" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-1">
								<button class="btn btn-success form-control" type="button" id="selectProf" onclick="showProfComSelect();">选择</button>
							</div>
							<div class="col-lg-1">
								<button class="btn btn-success form-control" type="button" id="addAgent" onclick="addAgentCom();">新增</button>								
							</div>
							<label for="" class="col-lg-1 form-label colorGold">专业公司</label>
							<div class="col-lg-2">
								<s:textfield name="" id="profCoName" disabled="true" cssClass="col-lg-10 form-control" value="%{updAuditDto.PROF_CO_NAME}" maxlength="20" theme="simple"></s:textfield>
							</div>
						</div>						
						<div class="col-lg-11 form-group" id="contract">
							<div class="col-lg-1"></div>
							<label for="" class="col-lg-2 form-label colorGold">承揽单位联系人及联系方式</label>
							<div class="col-lg-4">
								<input type="hidden" id="contractCoNo" value="<s:property value="updAuditDto.CONTRACT_CO_NO"/>"/>
								<input type="hidden" id="contractCoId" value="<s:property value="updAuditDto.CONTRACT_CO_ID"/>"/>
								<input type="hidden" id="contractCoManager" value="<s:property value="updAuditDto.CONTRACT_CO_MANAGER"/>"/>
								<input type="hidden" id="contractCoManagerTel" value="<s:property value="updAuditDto.CONTRACT_CO_MANAGER_TEL"/>"/>
								<input type="hidden" id="contractCoPostAddress" value="<s:property value="updAuditDto.CONTRACT_CO_POST_ADDRESS"/>"/>
								<input type="hidden" id="contractCoMail" value="<s:property value="updAuditDto.CONTRACT_CO_MAIL"/>"/>
								<s:textfield name="" id="contractCoInfo" disabled="true" cssClass="col-lg-10 form-control" value="%{updAuditDto.CONTRACT_CO_INFO}" maxlength="200" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-1">
								<button class="btn btn-success form-control" type="button" id="selectContract" onclick="showContractComSelect();">选择</button>
							</div>
							<div class="col-lg-1">
								<button class="btn btn-success form-control" type="button" id="addAgent" onclick="addAgentCom();">新增</button>								
							</div>
							<label for="" class="col-lg-1 form-label colorGold">承揽单位</label>
							<div class="col-lg-2">
								<s:textfield name="" id="contractCoName" disabled="true" cssClass="col-lg-10 form-control" value="%{updAuditDto.CONTRACT_CO_NAME}" maxlength="20" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-12 form-group" id="pricetype">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorGold">计价方式</label>
							<div class="col-lg-2">
								<!-- <s:textfield name="updAuditDto.RESERVE6" id="RESERVE6" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield> -->
								<select id="RESERVE6" name="updAuditDto.RESERVE6" class="form-control" onchange="reserve6Change()" >
									<s:if test='updAuditDto.RESERVE6 == "1"'>
										<option value="">请选择</option>
										<option value="1" selected="selected">总价</option>
										<option value="2">单价</option>
									</s:if>
									<s:elseif test='updAuditDto.RESERVE6 == "2"'>
										<option value="">请选择</option>
										<option value="1">总价</option>
										<option value="2" selected="selected">单价</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="1">总价</option>
										<option value="2">单价</option>
									</s:else>
								</select>
							</div>
							<div id="PriceTypeTotal">
								<label for="" class="col-lg-1 form-label colorGold">总金额</label>
								<div class="col-lg-2">
									<s:textfield name="updAuditDto.RESERVE7" id="RESERVE7" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield>
								</div>
							</div>							
						</div>
						<div class="col-lg-12 form-group" id="verify">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorGold">送审价</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.VERIFY_PER_AMOUNT" id="VERIFY_PER_AMOUNT" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label colorGold">审核价</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.VERIFY_AMOUNT" id="VERIFY_AMOUNT" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label colorGold">核增额</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.VERIFY_INCREASE" id="VERIFY_INCREASE" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-12 form-group" id="verify2">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorGold">核减额</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.VERIFY_DECREASE" id="VERIFY_DECREASE" disabled="true" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label colorGold">净核减额</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.VERIFY_DIFF" id="VERIFY_DIFF" disabled="true" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label colorGold">净核减率</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.VERIFY_DIFF_RATE" id="VERIFY_DIFF_RATE" disabled="true" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-12 form-group" id="cntPrice">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorGold">控制价金额</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.CNT_PRICE" id="CNT_PRICE" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
						</div>
						<div id="fourStage">
						<div class="col-lg-12 form-group">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorBlue">资料收到时间（立项阶段）</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="planDocRcvDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.PLAN_DOC_RCV_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label colorGold">立项金额</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.PROJ_PRICE" id="PROJ_PRICE" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label colorGold">立项报告时间</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="planDocRptDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.PLAN_DOC_RPT_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-6">
							</div>
							<label for="" class="col-lg-1 form-label colorGray">报告送达方式</label>
							<div class="col-lg-2">
								<select id="PLAN_DOC_SND_TYPE" name="updAuditDto.PLAN_DOC_SND_TYPE" class="form-control">
									<s:if test='updAuditDto.PLAN_DOC_SND_TYPE == "1"'>
										<option value="">请选择</option>
										<option value="1" selected="selected">快递</option>
										<option value="2">自送</option>
										<option value="3">自取</option>
										<option value="4">附带</option>
									</s:if>
									<s:elseif test='updAuditDto.PLAN_DOC_SND_TYPE == "2"'>
										<option value="">请选择</option>
										<option value="1">快递</option>
										<option value="2" selected="selected">自送</option>
										<option value="3">自取</option>
										<option value="4">附带</option>
									</s:elseif>
									<s:elseif test='updAuditDto.PLAN_DOC_SND_TYPE == "3"'>
										<option value="">请选择</option>
										<option value="1">快递</option>
										<option value="2">自送</option>
										<option value="3" selected="selected">自取</option>
										<option value="4">附带</option>
									</s:elseif>
									<s:elseif test='updAuditDto.PLAN_DOC_SND_TYPE == "4"'>
										<option value="">请选择</option>
										<option value="1">快递</option>
										<option value="2">自送</option>
										<option value="3">自取</option>
										<option value="4" selected="selected">附带</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="1">快递</option>
										<option value="2">自送</option>
										<option value="3">自取</option>
										<option value="4">附带</option>
									</s:else>
								</select>
							</div>
							<label for="" class="col-lg-1 form-label colorGray">报告送达日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="planDocArrDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.PLAN_DOC_ARR_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorBlue">资料收到时间（招标阶段）</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="bidDocRcvDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.BID_DOC_RCV_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label colorGold">限价金额</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.LIMIT_PRICE" id="LIMIT_PRICE" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label colorGold">限价报告时间</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="bidDocRptDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.BID_DOC_RPT_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-6">
							</div>
							<label for="" class="col-lg-1 form-label colorGray">报告送达方式</label>
							<div class="col-lg-2">
								<select id="BID_DOC_SND_TYPE" name="updAuditDto.BID_DOC_SND_TYPE" class="form-control">
									<s:if test='updAuditDto.BID_DOC_SND_TYPE == "1"'>
										<option value="">请选择</option>
										<option value="1" selected="selected">快递</option>
										<option value="2">自送</option>
										<option value="3">自取</option>
										<option value="4">附带</option>
									</s:if>
									<s:elseif test='updAuditDto.BID_DOC_SND_TYPE == "2"'>
										<option value="">请选择</option>
										<option value="1">快递</option>
										<option value="2" selected="selected">自送</option>
										<option value="3">自取</option>
										<option value="4">附带</option>
									</s:elseif>
									<s:elseif test='updAuditDto.BID_DOC_SND_TYPE == "3"'>
										<option value="">请选择</option>
										<option value="1">快递</option>
										<option value="2">自送</option>
										<option value="3" selected="selected">自取</option>
										<option value="4">附带</option>
									</s:elseif>
									<s:elseif test='updAuditDto.BID_DOC_SND_TYPE == "4"'>
										<option value="">请选择</option>
										<option value="1">快递</option>
										<option value="2">自送</option>
										<option value="3">自取</option>
										<option value="4" selected="selected">附带</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="1">快递</option>
										<option value="2">自送</option>
										<option value="3">自取</option>
										<option value="4">附带</option>
									</s:else>
								</select>
							</div>
							<label for="" class="col-lg-1 form-label colorGray">报告送达日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="bidDocArrDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.BID_DOC_ARR_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorBlue">资料收到时间（合同签订阶段）</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="signDocRcvDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.SIGN_DOC_RCV_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label colorGold">合同金额</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.CNTRCT_PRICE" id="CNTRCT_PRICE" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label colorGold">审核报告时间</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="signDocRptDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.SIGN_DOC_RPT_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-6">
							</div>
							<label for="" class="col-lg-1 form-label colorGray">报告送达方式</label>
							<div class="col-lg-2">
								<select id="SIGN_DOC_SND_TYPE" name="updAuditDto.SIGN_DOC_SND_TYPE" class="form-control">
									<s:if test='updAuditDto.SIGN_DOC_SND_TYPE == "1"'>
										<option value="">请选择</option>
										<option value="1" selected="selected">快递</option>
										<option value="2">自送</option>
										<option value="3">自取</option>
										<option value="4">附带</option>
									</s:if>
									<s:elseif test='updAuditDto.SIGN_DOC_SND_TYPE == "2"'>
										<option value="">请选择</option>
										<option value="1">快递</option>
										<option value="2" selected="selected">自送</option>
										<option value="3">自取</option>
										<option value="4">附带</option>
									</s:elseif>
									<s:elseif test='updAuditDto.SIGN_DOC_SND_TYPE == "3"'>
										<option value="">请选择</option>
										<option value="1">快递</option>
										<option value="2">自送</option>
										<option value="3" selected="selected">自取</option>
										<option value="4">附带</option>
									</s:elseif>
									<s:elseif test='updAuditDto.SIGN_DOC_SND_TYPE == "4"'>
										<option value="">请选择</option>
										<option value="1">快递</option>
										<option value="2">自送</option>
										<option value="3">自取</option>
										<option value="4" selected="selected">附带</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="1">快递</option>
										<option value="2">自送</option>
										<option value="3">自取</option>
										<option value="4">附带</option>
									</s:else>
								</select>
							</div>
							<label for="" class="col-lg-1 form-label colorGray">报告送达日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="signDocArrDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.SIGN_DOC_ARR_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorBlue">资料收到时间（结算阶段）</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="setDocRcvDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.SET_DOC_RCV_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label colorGray">报告敲章日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="reportSealDate2" value="<s:date format="yyyy-MM-dd" name="updAuditDto.REPORT_SEAL_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label colorGold">报告出具时间</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="setDocRptDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.SET_DOC_RPT_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-6">
							</div>
							<label for="" class="col-lg-1 form-label colorGray">报告送达方式</label>
							<div class="col-lg-2">
								<select id="SET_DOC_SND_TYPE" name="updAuditDto.SET_DOC_SND_TYPE" class="form-control">
									<s:if test='updAuditDto.SET_DOC_SND_TYPE == "1"'>
										<option value="">请选择</option>
										<option value="1" selected="selected">快递</option>
										<option value="2">自送</option>
										<option value="3">自取</option>
										<option value="4">附带</option>
									</s:if>
									<s:elseif test='updAuditDto.SET_DOC_SND_TYPE == "2"'>
										<option value="">请选择</option>
										<option value="1">快递</option>
										<option value="2" selected="selected">自送</option>
										<option value="3">自取</option>
										<option value="4">附带</option>
									</s:elseif>
									<s:elseif test='updAuditDto.SET_DOC_SND_TYPE == "3"'>
										<option value="">请选择</option>
										<option value="1">快递</option>
										<option value="2">自送</option>
										<option value="3" selected="selected">自取</option>
										<option value="4">附带</option>
									</s:elseif>
									<s:elseif test='updAuditDto.SET_DOC_SND_TYPE == "4"'>
										<option value="">请选择</option>
										<option value="1">快递</option>
										<option value="2">自送</option>
										<option value="3">自取</option>
										<option value="4" selected="selected">附带</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="1">快递</option>
										<option value="2">自送</option>
										<option value="3">自取</option>
										<option value="4">附带</option>
									</s:else>
								</select>
							</div>
							<label for="" class="col-lg-1 form-label colorGray">报告送达日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="setDocArrDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.SET_DOC_ARR_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						</div>
						<div class="col-lg-12 form-group">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorGold">甲方收费</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.A_AMOUNT" id="A_AMOUNT" disabled="true" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label colorGold">收费状态</label>
							<div class="col-lg-2">
								<select id="A_STATUS" name="updAuditDto.A_STATUS" class="form-control">
									<s:if test='updAuditDto.A_STATUS == "1"'>
										<option value="">请选择</option>
										<option value="1" selected="selected">未收费</option>
										<option value="2">已收费</option>
									</s:if>
									<s:elseif test='updAuditDto.A_STATUS == "2"'>
										<option value="">请选择</option>
										<option value="1">未收费</option>
										<option value="2" selected="selected">已收费</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="1">未收费</option>
										<option value="2">已收费</option>
									</s:else>
								</select>
							</div>
						</div>
						<div id="ab">
						<div class="col-lg-12 form-group" id="ab2">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorGold">乙方收费方式</label>
							<div class="col-lg-2">
								<select id="B_TYPE" name="updAuditDto.B_TYPE" class="form-control" onchange="showRate();">
									<s:if test='updAuditDto.B_TYPE == "1"'>
										<option value="">请选择</option>
										<option value="1" selected="selected">标准收费</option>
										<option value="2">收费金额</option>
										<option value="3">送审金额</option>
									</s:if>
									<s:elseif test='updAuditDto.B_TYPE == "2"'>
										<option value="">请选择</option>
										<option value="1">标准收费</option>
										<option value="2" selected="selected">收费金额</option>
										<option value="3">送审金额</option>
									</s:elseif>
									<s:elseif test='updAuditDto.B_TYPE == "3"'>
										<option value="">请选择</option>
										<option value="1">标准收费</option>
										<option value="2">收费金额</option>
										<option value="3" selected="selected">送审金额</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="1">标准收费</option>
										<option value="2">收费金额</option>
										<option value="3">送审金额</option>
									</s:else>
								</select>
							</div>
							<label id="rate1" for="" class="col-lg-1 form-label colorGold">乙方折扣率(%)</label>
							<label id="rate2" for="" class="col-lg-1 form-label colorGold">乙方收费</label>
							<label id="rate3" for="" class="col-lg-1 form-label colorGold">乙方费率(%)</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.B_RATE" id="B_RATE" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label colorGold">乙方收费</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.B_AMOUNT" id="B_AMOUNT" disabled="true" cssClass="col-lg-10 form-control" maxlength="14" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-12 form-group" id="ab3">
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorGold">甲方发票流转单日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="aInvoiceDeliDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.A_INVOICE_DELI_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<div class="col-lg-2"></div>
							<label for="" class="col-lg-2 form-label colorGold">乙方发票流转单日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="bInvoiceDeliDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.B_INVOICE_DELI_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 form-group">
							<hr style="height:3px;border:none;border-top:1px solid #bbbcbc;" />
						<div class="col-lg-12 form-group" id="reportDiv2">
							<label for="" class="col-lg-1 form-label colorGray">报告敲章日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="reportSealDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.REPORT_SEAL_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label colorGray">报告送达方式</label>
							<div class="col-lg-2">
								<select id="REPORT_ARR_TYPE" name="updAuditDto.REPORT_ARR_TYPE" class="form-control">
									<s:if test='updAuditDto.REPORT_ARR_TYPE == "1"'>
										<option value="">请选择</option>
										<option value="1" selected="selected">快递</option>
										<option value="2">自送</option>
										<option value="3">自取</option>
										<option value="4">附带</option>
									</s:if>
									<s:elseif test='updAuditDto.REPORT_ARR_TYPE == "2"'>
										<option value="">请选择</option>
										<option value="1">快递</option>
										<option value="2" selected="selected">自送</option>
										<option value="3">自取</option>
										<option value="4">附带</option>
									</s:elseif>
									<s:elseif test='updAuditDto.REPORT_ARR_TYPE == "3"'>
										<option value="">请选择</option>
										<option value="1">快递</option>
										<option value="2">自送</option>
										<option value="3" selected="selected">自取</option>
										<option value="4">附带</option>
									</s:elseif>
									<s:elseif test='updAuditDto.REPORT_ARR_TYPE == "4"'>
										<option value="">请选择</option>
										<option value="1">快递</option>
										<option value="2">自送</option>
										<option value="3">自取</option>
										<option value="4" selected="selected">附带</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="1">快递</option>
										<option value="2">自送</option>
										<option value="3">自取</option>
										<option value="4">附带</option>
									</s:else>
								</select>
							</div>
							<div class="col-lg-6"></div>
							<label for="" class="col-lg-1 form-label colorGray">报告送达日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="reportArrDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.REPORT_ARR_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label colorGray">入档日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="regDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.REG_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 form-group"  id="ab4">
							<label for="" class="col-lg-1 form-label colorGray">甲方开票日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="aInvoiceDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.A_INVOICE_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label colorGray">甲方到账日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="aSetDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.A_SET_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label colorGray">乙方开票日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="bInvoiceDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.B_INVOICE_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label colorGray">乙方到账日期</label>
							<div class="col-lg-2">
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" readonly id="bSetDate" value="<s:date format="yyyy-MM-dd" name="updAuditDto.B_SET_DATE"/>" maxlength="10" />
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						</div>						
						<div class="col-lg-12 form-group"  id="ab5">
							<label for="" class="col-lg-1 form-label colorGray">甲方发票号</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.A_INVOICE_NO" id="A_INVOICE_NO" cssClass="col-lg-10 form-control" maxlength="20" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-3"></div>
							<label for="" class="col-lg-1 form-label colorGray">乙方发票号</label>
							<div class="col-lg-2">
								<s:textfield name="updAuditDto.B_INVOICE_NO" id="B_INVOICE_NO" cssClass="col-lg-10 form-control" maxlength="20" theme="simple"></s:textfield>
							</div>
						</div>
						</div>
						</div>
						<!-- <div class="col-lg-12 form-group">
							<div class="col-lg-2">
							</div>
							<div class="col-lg-2">
								<button class="btn btn-success form-control" type="button" onclick="exportAudit();">审定单</button>
							</div>
							<div class="col-lg-2">
								<button class="btn btn-success form-control" type="button" onclick="exportAuditRegister();">资料登记表</button>
							</div>
							<div class="col-lg-2">
								<button class="btn btn-success form-control" type="button" onclick="exportAuditSummary();">会商纪要</button>
							</div>
						</div> -->
						<div class="col-lg-12 form-group">
							<div class="col-lg-3">
							</div>
							<!-- <div class="col-lg-2">
								<button class="btn btn-success form-control" type="button" onclick="exportAuditCover();">审价报告封面</button>
							</div>
							<div class="col-lg-2">
								<button class="btn btn-success form-control" type="button" onclick="exportAuditSign();">签署页</button>
							</div> -->
							<div class="col-lg-1">
								<button class="btn btn-success form-control" type="button" onclick="exportAudit();">审定单</button>
							</div>
							<div class="col-lg-2">
								<button class="btn btn-success form-control" type="button" onclick="exportAuditReport();">审价报告文字稿</button>
							</div>
							<div class="col-lg-3">
							</div>
							<div class="col-lg-1">
								<button class="btn btn-success form-control" type="button" onclick="goAuditList();">取消</button>
							</div>
							<div class="col-lg-1">
								<button class="btn btn-success form-control" type="button" onclick="upd();">保存</button>
							</div>
							<div class="col-lg-1">
								<button class="btn btn-success form-control" type="button" onclick="goAuditListDetail();">返回上级</button>
							</div>
						</div>
					</div>
				</s:form>
			</div>
		</div>
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
							<button type="button" class="btn btn-success form-control" onclick="querySelectAgentPageAjax(0);">检索</button>
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
						<jsp:include page="../turning_agent_select.jsp" flush="true" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="selectAgentComp();">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 模拟模态框 -->
	<div class="modal fade" id="profCompModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 1000px;">
			<div class="modal-content">
				<form class="form-horizontal" role="form">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							专业公司一览
						</h4>
					</div>
					<div class="modal-body">
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-3 form-label">专业公司代码</label>
							<div class="col-lg-4">
								<div class="input-group">
									<input id="profCompNoLow" maxlength="4" type="text" class="form-control">
								</div>
							</div>
							<label for="" class="col-lg-1 form-label to">---</label>
							<div class="col-lg-4">
								<div class="input-group">
									<input id="profCompNoHigh" maxlength="4" type="text" class="form-control">
								</div>
							</div>
						</div>
						<div class="col-lg-4 form-group">
							<label for="" class="col-lg-4 form-label">专业公司名称</label>
							<div class="col-lg-8">
								<div class="input-group">
									<input id="profCompName" maxlength="20" type="text" class="form-control">
								</div>
							</div>
						</div>
						<div class="col-lg-2 form-group" style="z-index: 1;">
							<button type="button" class="btn btn-success form-control" onclick="querySelectProfPageAjax(0);">检索</button>
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
							<tbody id="profCompData">
								<tr onclick="checkRadioTr(this, event);">
									<td><input name="profCompKey" type="radio" value=""/></td>
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
						<jsp:include page="../turning_prof_select.jsp" flush="true" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="selectProfComp();">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 模拟模态框 -->
	<div class="modal fade" id="contractCompModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 1000px;">
			<div class="modal-content">
				<form class="form-horizontal" role="form">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							承包公司一览
						</h4>
					</div>
					<div class="modal-body">
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-3 form-label">承包公司代码</label>
							<div class="col-lg-4">
								<div class="input-group">
									<input id="contractCompNoLow" maxlength="4" type="text" class="form-control">
								</div>
							</div>
							<label for="" class="col-lg-1 form-label to">---</label>
							<div class="col-lg-4">
								<div class="input-group">
									<input id="contractCompNoHigh" maxlength="4" type="text" class="form-control">
								</div>
							</div>
						</div>
						<div class="col-lg-4 form-group">
							<label for="" class="col-lg-4 form-label">承包公司名称</label>
							<div class="col-lg-8">
								<div class="input-group">
									<input id="contractCompName" maxlength="20" type="text" class="form-control">
								</div>
							</div>
						</div>
						<div class="col-lg-2 form-group" style="z-index: 1;">
							<button type="button" class="btn btn-success form-control" onclick="queryContractSelectPageAjax(0);">检索</button>
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
							<tbody id="contractCompData">
								<tr onclick="checkRadioTr(this, event);">
									<td><input name="contractCompKey" type="radio" value=""/></td>
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
						<jsp:include page="../turning_contract_select.jsp" flush="true" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="selectContractComp();">确定</button>
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
	showByUserRank();
	
	showByCntrctInfo();
	
	showRate();
	
	$('#VERIFY_PER_AMOUNT').bind('input propertychange', function() {  
		calcVERIFY_DIFF();
	});
	$('#VERIFY_AMOUNT').bind('input propertychange', function() {  
		calcVERIFY_DIFF(); 
	});
	$('#VERIFY_INCREASE').bind('input propertychange', function() {  
		calcVERIFY_DIFF(); 
	});
	
	$('.datepicker').parent().datepicker({
		"autoclose":true,"format":"yyyy-mm-dd","daysOfWeekHighlighted":"[0,6]","language":"zh-CN",clearBtn: true
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
