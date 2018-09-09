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
				document.mainform.action = '<c:url value="/bid/addBidAction.action"></c:url>';
				document.mainform.submit();
			}
		}
	}
	
	function checkdata() {
		setBidValue();
		var CNTRCT_NO = $("#CNTRCT_NO").val();
		var CNTRCT_YEAR = $("#CNTRCT_YEAR").val();
		var CNTRCT_ST_DATE = $("#CNTRCT_ST_DATE").val();
		var CNTRCT_ED_DATE = $("#CNTRCT_ED_DATE").val();
		var BID_COMP_NO = $("#BID_COMP_NO").val();
		var BID_COMP_NAME = $("#BID_COMP_NAME").val();
		var CO_MANAGER1 = $("#CO_MANAGER1").val();
		var CNTRCT_YEAR = $("#CNTRCT_YEAR").val();
		var IS_RANDOM = $("#IS_RANDOM").val();
		
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
		//是否随机
		if(document.getElementById("random").checked) {
			$("#IS_RANDOM").attr("value", "1");
		} else {
			$("#IS_RANDOM").attr("value", "0");
		}
		
		$("#CNTRCT_NO").val($("#tmpCNTRCT_NO").val());
		$("#CNTRCT_YEAR").val($("#tmpCNTRCT_YEAR").val());
		$("#CNTRCT_ST_DATE").val($("#tmpCNTRCT_ST_DATE").val());
		$("#CNTRCT_ED_DATE").val($("#tmpCNTRCT_ED_DATE").val());
		$("#BID_COMP_NO").val($("#tmpBID_COMP_NO").val());
		$("#BID_COMP_NAME").val($("#tmpBID_COMP_NAME").val());
		$("#CO_MANAGER1").val($("#tmpCO_MANAGER1").val());
		$("#CO_MANAGER_TEL1").val($("#tmpCO_MANAGER_TEL1").val());
		$("#CO_ADDRESS1").val($("#tmpCO_ADDRESS1").val());
		$("#CO_MANAGER_EMAIL1").val($("#tmpCO_MANAGER_EMAIL1").val());
		$("#CO_TAX").val($("#tmpCO_TAX").val());
	}
	
	function goBidList() {
		window.location.href = '<c:url value="/bid/queryBidList.action"></c:url>';
		//document.mainform.submit();
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
	
	function selectBidCntrct() {
		var url = '<c:url value="/bidcntrct/showSelectBidCntrctPage.action"></c:url>';
		url += "?date=" + new Date();
		//window.open(url, window, 'height=1000, width=1000, top=5, left=100, status=0,resizable=no,scrollbars=yes');
		window.showModalDialog(url, window, "dialogheight:850px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}

</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<s:form id="mainform" name="mainform" method="POST" theme="simple">
			<s:hidden name="addBidDto.IS_RANDOM" id="IS_RANDOM"/>
			<s:hidden name="addBidDto.CNTRCT_NO" id="CNTRCT_NO"/>
			<s:hidden name="addBidDto.CNTRCT_YEAR" id="CNTRCT_YEAR"/>
			<s:hidden name="addBidDto.CNTRCT_ST_DATE" id="CNTRCT_ST_DATE"/>
			<s:hidden name="addBidDto.CNTRCT_ED_DATE" id="CNTRCT_ED_DATE"/>
			<s:hidden name="addBidDto.BID_COMP_NO" id="BID_COMP_NO"/>
			<s:hidden name="addBidDto.BID_COMP_NAME" id="BID_COMP_NAME"/>
			<s:hidden name="addBidDto.CO_MANAGER1" id="CO_MANAGER1"/>
			<s:hidden name="addBidDto.CO_MANAGER_TEL1" id="CO_MANAGER_TEL1"/>
			<s:hidden name="addBidDto.CO_ADDRESS1" id="CO_ADDRESS1"/>
			<s:hidden name="addBidDto.CO_MANAGER_EMAIL1" id="CO_MANAGER_EMAIL1"/>
			<s:hidden name="addBidDto.CO_TAX" id="CO_TAX"/>
			<div class="row">
				<div class="col-lg-10 right w100">
					<h3 class="title">项目信息<a class="backHome" href="#" onclick="goBidList();"><i class="fa fa-arrow-left" aria-hidden="true"></i>返回</a></h3>
					<div class="row">
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">合同编号</label>
							<div class="col-lg-7">
								<input id="tmpCNTRCT_NO" value="<s:property value="addBidDto.CNTRCT_NO"/>" type="text" class="form-control" readonly>
							</div>
							<div class="col-lg-2">
								<button type="button" class="btn btn-success" onclick="selectBidCntrct();">合同选择</button>
							</div>
						</div>
						 <div class="col-lg-3 form-group">
						 	<label for="" class="col-lg-3 form-label">年份</label>
							<div class="col-lg-9">
								<input id="tmpCNTRCT_YEAR" value="<s:property value="addBidDto.CNTRCT_YEAR"/>" type="text" class="form-control" readonly>
							</div>
						 </div>
						 <div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">合同期限</label>
						 	<div class="col-lg-4">
						 		<input id="tmpCNTRCT_ST_DATE" value="<s:date name="addBidDto.CNTRCT_ST_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control" readonly>
						 	</div>
						 	<label for="" class="col-lg-1 form-label to">---</label>
						 	<div class="col-lg-4">
						 		<input id="tmpCNTRCT_ED_DATE" value="<s:date name="addBidDto.CNTRCT_ED_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control" readonly>
						 	</div>
						 </div>
						 <h5>委托合同信息</h5>
						 <div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">单位名称</label>
						 	<div class="col-lg-10">
						 		<input type="hidden" id="tmpBID_COMP_NO" value="<s:property value="addBidDto.BID_COMP_NO"/>">
								<input id="tmpBID_COMP_NAME" value="<s:property value="addBidDto.BID_COMP_NAME"/>" maxlength="40" type="text" class="form-control">
						 	</div>
						 </div>
						 <div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">地址</label>
						 	<div class="col-lg-10">
						 		<input id="tmpCO_ADDRESS1" value="<s:property value="addBidDto.CO_ADDRESS1"/>" maxlength="40" type="text" class="form-control">
						 	</div>
						 </div>
						 <div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">联系人</label>
						 	<div class="col-lg-10">
						 		<input id="tmpCO_MANAGER1" value="<s:property value="addBidDto.CO_MANAGER1"/>" maxlength="40" type="text" class="form-control">
						 	</div>
						 </div>
						 <div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">邮箱</label>
						 	<div class="col-lg-10">
						 		<input id="tmpCO_MANAGER_EMAIL1" value="<s:property value="addBidDto.CO_MANAGER_EMAIL1"/>" maxlength="100" type="text" class="form-control">
						 	</div>
						 </div>
						  <div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">联系方式</label>
						 	<div class="col-lg-10">
						 		<input id="tmpCO_MANAGER_TEL1" value="<s:property value="addBidDto.CO_MANAGER_TEL1"/>" maxlength="40" type="text" class="form-control">
						 	</div>
						 </div>
						  <div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">开票信息</label>
						 	<div class="col-lg-10">
						 		<input id="tmpCO_TAX" value="<s:property value="addBidDto.CO_TAX"/>" maxlength="80" type="text" class="form-control">
						 	</div>
						 </div>
						 <div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">招标编号</label>
						 	<div class="col-lg-8">
						 		<s:if test='addBidDto.PROJECT_TYPE != "3" && addBidDto.PROJECT_TYPE != "4" && addBidDto.IS_RANDOM == "1"'>
									<s:textfield name="addBidDto.BID_NO" id="BID_NO" disabled="true" cssClass="form-control" maxlength="13" theme="simple"></s:textfield>
								</s:if>
								<s:else>
									<s:textfield name="addBidDto.BID_NO" id="BID_NO" cssClass="form-control" maxlength="13" theme="simple"></s:textfield>
								</s:else>
						 	</div>
						 	<div class="col-lg-2 checkBox">
								<s:if test='addBidDto.IS_RANDOM == "1"'>
									<input type="checkbox" id="random" checked="checked" onclick="randomBidNo(this);"/>是否随机
								</s:if>
								<s:else>
									<input type="checkbox" id="random" onclick="randomBidNo(this);"/>是否随机
								</s:else>
							</div>
						</div>
						<div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">分类</label>
						 	<div class="col-lg-10">
						 		<select name="addBidDto.PROJECT_TYPE" id="PROJECT_TYPE" class="form-control">
									<option value="" selected="selected">请选择</option>
									<s:if test='addBidDto.PROJECT_TYPE == "1"'>
										<option value="1" selected="selected">招标</option>
										<option value="4">竞价</option>
									</s:if>
									<s:elseif test='addBidDto.PROJECT_TYPE == "4"'>
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
						<div class="col-lg-4 form-group">
						 	<label for="" class="col-lg-3 form-label">工程师</label>
						 	<div class="col-lg-9">
						 		<select name="addBidDto.PROJECT_MANAGER" id="PROJECT_MANAGER" class="form-control">
									<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
										<option value="<s:property value="LOGIN_NAME"/>" <s:if test="%{addBidDto.PROJECT_MANAGER == LOGIN_NAME}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
									</s:iterator>
								</select>
						 	</div>
						</div>
						<div class="col-lg-4 form-group">
						 	<label for="" class="col-lg-3 form-label">项目名称</label>
						 	<div class="col-lg-9">
						 		<s:textfield name="addBidDto.PROJECT_NAME" id="PROJECT_NAME" cssClass="form-control" maxlength="300" theme="simple"></s:textfield>
						 	</div>
						</div>
					</div>
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#tab1" data-toggle="tab">项目新增</a></li>
						<li><a href="#tab2" data-toggle="tab">报名要求</a></li>
						<li><a href="#tab3" data-toggle="tab">投标单位信息</a></li>
						<li><a href="#tab4" data-toggle="tab">开评标</a></li>
						<li><a href="#tab5" data-toggle="tab">保证金</a></li>
						<li><a href="#tab6" data-toggle="tab">标书费</a></li>
						<li><a href="#tab7" data-toggle="tab">代理费</a></li>
						<li><a href="#tab8" data-toggle="tab">专家费</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade in active" id="tab1">
							<div class="row" style="margin-top: 20px;">
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">承接项目日期</label>
									<div class="col-lg-9">
										<input type="text" class="form-control">
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">项目性质</label>
									<div class="col-lg-9">
										<select class="form-control">
											<option value="" selected="selected">请选择</option>
											<option value="1">成本内</option>
											<option value="2">成本外</option>
											<option value="3">单独立项</option>
											<option value="9">其他</option>
										</select>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">会审监管人</label>
									<div class="col-lg-9">
										<select class="form-control">
											<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
												<option value="<s:property value="LOGIN_NAME"/>" <s:if test="%{addBidDto.PROJECT_MANAGER == LOGIN_NAME}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
											</s:iterator>
										</select>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">代理费支付方</label>
									<div class="col-lg-7">
										<select class="form-control">
											<option value="" selected="selected">请选择</option>
											<option value="1">委托单位</option>
											<option value="2">中标单位</option>
											<option value="3">申通集团</option>
											<option value="4">维保公司</option>
										</select>
									</div>
									<div class="col-lg-2">
										<button type="button" class="btn btn-success" onclick="">委托单位选择</button>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">代理费</label>
									<div class="col-lg-7"><input type="text" class="form-control"></div>
									<label for="" class="col-lg-2 form-label">万元</label>
								</div>
								<div class="col-lg-12 form-group">
									<label class="col-lg-1 form-label">工程概况批文</label>
									<div class="col-lg-11">
										<textarea class="form-control"></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab2">
							<div class="row" style="margin-top: 20px;">
								<div class="col-lg-12 form-group">
									<label class="col-lg-1 form-label">报名日期</label>
									<div class="col-lg-9">
										<input type="text" class="form-control">
										<input type="text" class="form-control">
									</div>
									<div class="col-lg-2">
										<button type="button" class="btn">增加</button>
									</div>
								</div>
								<div class="col-lg-12 form-group">
									<label class="col-lg-1 form-label">报名要求</label>
									<div class="col-lg-11">
										<textarea class="form-control"></textarea>
									</div>
								</div>
								<div class="col-lg-12 form-group">
									<label class="col-lg-1 form-label">保证金</label>
									<div class="col-lg-10">
										<input type="text" class="form-control">
									</div>
									<label class="col-lg-1 form-label">万元</label>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab3">
							<div class="row" style="margin-top: 20px;">
								<div class="btns">
									<ul>
										<li><a href="javascript:;"><i class="fa fa-plus" aria-hidden="true"></i>新增</a></li>
										<li><a href="javascript:;"><i class="fa fa-edit" aria-hidden="true"></i>修改</a></li>
										<li><a href="javascript:;"><i class="fa fa-trash" aria-hidden="true"></i>删除</a></li>
									</ul>
								</div>
								<table class="table table-bordered">
									<tbody>
										<tr>
											<th></th>
											<th>序号</th>
											<th>公司名称</th>
											<th>委托人</th>
											<th>联系方式</th>
											<th>邮箱地址</th>
											<th colspan="3">报名内容</th>
										</tr>
										<tr>
											<td><input type="radio" name="selectTable"></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td><input type="radio" name="selectTable"></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="operationBtns">
								<button type="button" class="btn btn-success">生成报名表</button>
								<button type="button" class="btn btn-success">生成审核表</button>
								<button type="button" class="btn btn-success">标书费</button>
								<button type="button" class="btn btn-success">保证金</button>
							</div>
						</div>
						<div class="tab-pane fade" id="tab4">
							<div class="row" style="margin-top: 20px;">
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">开标时间</label>
									<div class="col-lg-9">
										<div class="input-group date" data-provide="datepicker">
											<input id="" value="" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">开评标地点</label>
									<div class="col-lg-9">
										<input type="text" class="form-control">
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">评审人</label>
									<div class="col-lg-9">
										<select class="form-control"></select>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">评标时间</label>
									<div class="col-lg-9">
										<div class="input-group date" data-provide="datepicker">
											<input id="" value="" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">限价</label>
									<div class="col-lg-8">
										<input type="text" class="form-control">
									</div>
									<label for="" class="col-lg-1 form-label">万元</label>
								</div>
							</div>
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>序号</th>
										<th>公司名称</th>
										<th>投标价</th>
										<th>评审价</th>
										<th>中标与否</th>
										<th>中标价</th>
									</tr>
									<tr>
										<td>1</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
							<div class="row">
								<div class="col-lg-7">专家名单</div>
								<div class="col-lg-5">
									<label for="" class="col-lg-2 form-label">专家费支出</label>
									<div class="col-lg-6">
										<input type="text" class="form-control">
									</div>
								</div>
							</div>
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th></th>
										<th>序号</th>
										<th>姓名</th>
										<th>就职公司</th>
										<th>专业</th>
										<th>职称</th>
										<th>联系方式</th>
									</tr>
									<tr>
										<td><input type="radio" name="selectTable"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
							<div class="operationBtns">
								<button type="button" class="btn btn-success">选择专家</button>
								<button type="button" class="btn btn-danger">删除</button>
							</div>
						</div>
						<div class="tab-pane fade" id="tab5">
							<div class="col-lg-4 form-group" style="margin-top: 20px;">
								<label for="" class="col-lg-3 form-label">保证金</label>
								<div class="col-lg-6"><input type="text" class="form-control"></div>
								<label for="" class="col-lg-3 form-label" style="text-align:left;">万元</label>
							</div>
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>序号</th>
										<th>公司名称</th>
										<th>保证金入账日期</th>
										<th>支付形式</th>
										<th>退保证金审批</th>
										<th>退定日期</th>
										<th>凭证上传</th>
									</tr>
									<tr>
										<td>1</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td><a href="">上传</a><a href="">预览</a></td>
									</tr>
									<tr>
										<td>2</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td><a href="">上传</a><a href="">预览</a></td>
									</tr>
								</tbody>
							</table>
							<div class="operationBtns">
								<button type="button" class="btn btn-success">保证金收据</button>
								<button type="button" class="btn btn-success">退定签收单</button>
							</div>
						</div>
						<div class="tab-pane fade" id="tab6">
							<div class="col-lg-4 form-group" style="margin-top: 20px;">
								<label for="" class="col-lg-3 form-label">标书费金额</label>
								<div class="col-lg-6"><input type="text" class="form-control"></div>
							</div>
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>序号</th>
										<th>公司名称</th>
										<th>标书费入账日期</th>
										<th>支付形式</th>
										<th>开票信息</th>
										<th>开票时间</th>
										<th>发票编号</th>
									</tr>
									<tr>
										<td>1</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
							            <td>2</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
							<div class="operationBtns">
								<button type="button" class="btn btn-success">标书费收据</button>
								<button type="button" class="btn btn-success">打印签收单</button>
							</div>
						</div>
						<div class="tab-pane fade" id="tab7">
							<div class="row" style="margin-top: 20px;">
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">保证金</label>
									<div class="col-lg-6"><input type="text" class="form-control"></div>
									<label for="" class="col-lg-2 form-label">万元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">承接项目日期</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="" value="" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">项目性质</label>
									<div class="col-lg-8"><input type="text" class="form-control"></div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">会审监管人</label>
									<div class="col-lg-8"><input type="text" class="form-control"></div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">代理费支付方</label>
									<div class="col-lg-8"><input type="text" class="form-control"></div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">应收代理费</label>
									<div class="col-lg-6">
										<input type="text" class="form-control">
									</div>
									<label for="" class="col-lg-2 form-label">万元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">中标单位</label>
									<div class="col-lg-8"><input type="text" class="form-control"></div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">开票日期</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="" value="" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">实收代理费</label>
									<div class="col-lg-6">
										<input type="text" class="form-control">
									</div>
									<label for="" class="col-lg-2 form-label">万元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">中标金额</label>
									<div class="col-lg-8"><input type="text" class="form-control"></div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">到账日期</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="" value="" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab8">
							<div class="row" style="margin-top: 20px;">
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">开评标日期</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="" value="" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">预借费用</label>
									<div class="col-lg-8"><input type="text" class="form-control"></div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">申请日期</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="" value="" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">申请人</label>
									<div class="col-lg-8"><input type="text" class="form-control"></div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">实际费用</label>
									<div class="col-lg-8"><input type="text" class="form-control"></div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">差价退还日期</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="" value="" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="operationBtns addBtns mgt15 btn3">
						<button type="button" class="btn btn-success" onclick="add();">保存</button>
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