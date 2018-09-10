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
<title>招标项目状态</title>
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
	function showProgressUtil(btn_no) {
//		var id = getSelectedID();
//		if(id == "") {
//			alert("请选择一条记录！");
//			return;
//		} else {
			$("#BTN_NO").attr("value", btn_no);
			alert($("#BTN_NO").val());
//			var url = '<c:url value="/bidprogress/showBidProgressUtilAction.action"></c:url>' + "?strBID_NO=" + strBID_COMP_NO + "&date=" + new Date();
			var url = '<c:url value="/bidprogress/showBidProgressUtilAction.action"></c:url>' + "?BTN_NO=" + btn_no + "&date=" + new Date();
			window.open(url, window, "dialogheight:500px;dialogwidth:800px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
//		}
	}
	
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<div class="row">
			<jsp:include page="../menu.jsp" flush="true" />
			<div class="col-lg-10 right">
			 	<a class="toggle" href="javascript:;"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
				<s:form id="mainform" name="mainform" method="POST">
					<s:hidden name="startIndex" id="startIndex"/>
					<s:hidden name="BTN_NO" id="BTN_NO"/>
					<s:hidden name="strBID_COMP_NO" id="strBID_COMP_NO"/>
					<h3 class="title">招标项目状态<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
					<div class="row">
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label"><span class="red">*</span>招标编号</label>
							<div class="col-lg-9">
								<s:if test='bidDto.PROJECT_TYPE != "3" && bidDto.PROJECT_TYPE != "4" && bidDto.IS_RANDOM == "1"'>
									<s:textfield name="bidDto.BID_NO" id="strBID_NO" disabled="true" cssClass="form-control" maxlength="13" theme="simple"></s:textfield>
								</s:if>
								<s:else>
									<s:textfield name="bidDto.BID_NO" id="strBID_NO" cssClass="form-control" maxlength="13" theme="simple"></s:textfield>
								</s:else>
							</div>
						</div>
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-2 form-label"><span class="red">*</span>项目名称</label>
							<div class="col-lg-10">
								<s:textfield name="bidDto.PROJECT_NAME" id="PROJECT_NAME" cssClass="form-control" maxlength="300" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">委托公司</label>
							<div class="col-lg-9">
								<input type="text" id="strAgentNo" class="form-control" value="<s:property value="strBID_COMP_NO"/>">
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">项目进展</label>
							<div class="col-lg-9">
							<input type="text" id="strBID_status" class="form-control" value="<s:property value="strBID_STATUS" />">
							</div>
						</div>
					</div>
					<BR/>
					<table class="table table-bordered">
						<tr>
							<th></th>
							<th>项目承接</th>
							<th><span class="glyphicon glyphicon-arrow-right"></span></th>
							<th>报名阶段</th>
							<th><span class="glyphicon glyphicon-arrow-right"></span></th>
							<th>投标中</th>
							<th><span class="glyphicon glyphicon-arrow-right"></span></th>
							<th>开评标</th>
							<th><span class="glyphicon glyphicon-arrow-right"></span></th>
							<th>资料归档</th>
							<th><span class="glyphicon glyphicon-arrow-right"></span></th>
							<th>项目完成情况</th>
							<th></th>
						</tr>
						<tr>
							<td></td>
							<td>
								<s:if test='Status0101 == "9"'>
									<button class="btn btn-success" id="0101" onclick="showProgressUtil('0101');">新项目登记&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0101 == "2"'>
									<button class="btn btn-warning" id="0101" onclick="showProgressUtil('0101');">新项目登记&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0101 == "0"'>
									<button class="btn btn-danger" id="0101" onclick="showProgressUtil('0101');">新项目登记&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0101" onclick="showProgressUtil('0101');">新项目登记&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td>
								<s:if test='Status0102 == "9"'>
									<button class="btn btn-success" id="0102" onclick="showProgressUtil('0102');">招标公告发布&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0102 == "2"'>
									<button class="btn btn-warning" id="0102" onclick="showProgressUtil('0102');">招标公告发布&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0102 == "0"'>
									<button class="btn btn-danger" id="0102" onclick="showProgressUtil('0102');">招标公告发布&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0102" onclick="showProgressUtil('0102');">招标公告发布&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td>
								<s:if test='Status0103 == "9"'>
									<button class="btn btn-success" id="0103" onclick="showProgressUtil('0103');">发送答疑、补充文件</button>
								</s:if>
								<s:elseif test='Status0103 == "2"'>
									<button class="btn btn-warning" id="0103" onclick="showProgressUtil('0103');">发送答疑、补充文件</button>
								</s:elseif>
								<s:elseif test='Status0103 == "0"'>
									<button class="btn btn-danger" id="0103" onclick="showProgressUtil('0103');">发送答疑、补充文件</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0103" onclick="showProgressUtil('0103');">发送答疑、补充文件</button>
								</s:else>
							</td>
							<td></td>
							<td>
								<s:if test='Status0104 == "9"'>
									<button class="btn btn-success" id="0104" onclick="showProgressUtil('0104');">专家抽取、通知</button>
								</s:if>
								<s:elseif test='Status0104 == "2"'>
									<button class="btn btn-warning" id="0104" onclick="showProgressUtil('0104');">专家抽取、通知</button>
								</s:elseif>
								<s:elseif test='Status0104 == "0"'>
									<button class="btn btn-danger" id="0104" onclick="showProgressUtil('0104');">专家抽取、通知</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0104" onclick="showProgressUtil('0104');">专家抽取、通知</button>
								</s:else>
							</td>
							<td></td>
							<td>
								<s:if test='Status0105 == "9"'>
									<button class="btn btn-success" id="0105" onclick="showProgressUtil('0105');">招投标文件送至甲方</button>
								</s:if>
								<s:elseif test='Status0105 == "2"'>
									<button class="btn btn-warning" id="0105" onclick="showProgressUtil('0105');">招投标文件送至甲方</button>
								</s:elseif>
								<s:elseif test='Status0105 == "0"'>
									<button class="btn btn-danger" id="0105" onclick="showProgressUtil('0105');">招投标文件送至甲方</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0105" onclick="showProgressUtil('0105');">招投标文件送至甲方</button>
								</s:else>
							</td>
							<td></td>
							<td>
								<s:if test='Status0106 == "9"'>
									<button class="btn btn-success" id="0106" onclick="showProgressUtil('0106');">完成</button>
								</s:if>
								<s:elseif test='Status0106 == "2"'>
									<button class="btn btn-warning" id="0106" onclick="showProgressUtil('0106');">完成</button>
								</s:elseif>
								<s:elseif test='Status0106 == "0"'>
									<button class="btn btn-danger" id="0106" onclick="showProgressUtil('0106');">完成</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0106" onclick="showProgressUtil('0106');">完成</button>
								</s:else>
							</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<s:if test='Status0201 == "9"'>
									<button class="btn btn-success" id="0201" onclick="showProgressUtil('0201');">招标文件编制&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0201 == "2"'>
									<button class="btn btn-warning" id="0201" onclick="showProgressUtil('0201');">招标文件编制&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0201 == "0"'>
									<button class="btn btn-danger" id="0201" onclick="showProgressUtil('0201');">招标文件编制&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0201" onclick="showProgressUtil('0201');">招标文件编制&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td>
								<s:if test='Status0202 == "9"'>
									<button class="btn btn-success" id="0202" onclick="showProgressUtil('0202');">报名登记表编制&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0202 == "2"'>
									<button class="btn btn-warning" id="0202" onclick="showProgressUtil('0202');">报名登记表编制&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0202 == "0"'>
									<button class="btn btn-danger" id="0202" onclick="showProgressUtil('0202');">报名登记表编制&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0202" onclick="showProgressUtil('0202');">报名登记表编制&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<s:if test='Status0204 == "9"'>
									<button class="btn btn-success" id="0204" onclick="showProgressUtil('0204');">专家费申请&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0204 == "2"'>
									<button class="btn btn-warning" id="0204" onclick="showProgressUtil('0204');">专家费申请&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0204 == "0"'>
									<button class="btn btn-danger" id="0204" onclick="showProgressUtil('0204');">专家费申请&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0204" onclick="showProgressUtil('0204');">专家费申请&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td>
								<s:if test='Status0205 == "9"'>
									<button class="btn btn-success" id="0205" onclick="showProgressUtil('0205');">中标通知书签收&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0205 == "2"'>
									<button class="btn btn-warning" id="0205" onclick="showProgressUtil('0205');">中标通知书签收&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0205 == "0"'>
									<button class="btn btn-danger" id="0205" onclick="showProgressUtil('0205');">中标通知书签收&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0205" onclick="showProgressUtil('0205');">中标通知书签收&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<s:if test='Status0301 == "9"'>
									<button class="btn btn-success" id="0301" onclick="showProgressUtil('0301');">统稿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0301 == "2"'>
									<button class="btn btn-warning" id="0301" onclick="showProgressUtil('0301');">统稿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0301 == "0"'>
									<button class="btn btn-danger" id="0301" onclick="showProgressUtil('0301');">统稿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0301" onclick="showProgressUtil('0301');">统稿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td>
								<s:if test='Status0302 == "9"'>
									<button class="btn btn-success" id="0302" onclick="showProgressUtil('0302');">投标单位录入&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0302 == "2"'>
									<button class="btn btn-warning" id="0302" onclick="showProgressUtil('0302');">投标单位录入&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0302 == "0"'>
									<button class="btn btn-danger" id="0302" onclick="showProgressUtil('0302');">投标单位录入&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0302" onclick="showProgressUtil('0302');">投标单位录入&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<s:if test='Status0304 == "9"'>
									<button class="btn btn-success" id="0304" onclick="showProgressUtil('0304');">开标完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0304 == "2"'>
									<button class="btn btn-warning" id="0304" onclick="showProgressUtil('0304');">开标完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0304 == "0"'>
									<button class="btn btn-danger" id="0304" onclick="showProgressUtil('0304');">开标完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0304" onclick="showProgressUtil('0304');">开标完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td>
								<s:if test='Status0305 == "9"'>
									<button class="btn btn-success" id="0305" onclick="showProgressUtil('0305');">评标报告装订扫描&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0305 == "2"'>
									<button class="btn btn-warning" id="0305" onclick="showProgressUtil('0305');">评标报告装订扫描&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0305 == "0"'>
									<button class="btn btn-danger" id="0305" onclick="showProgressUtil('0305');">评标报告装订扫描&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0305" onclick="showProgressUtil('0305');">评标报告装订扫描&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<s:if test='Status0401 == "9"'>
									<button class="btn btn-success" id="0401" onclick="showProgressUtil('0401');">招标公告、文件校对</button>
								</s:if>
								<s:elseif test='Status0401 == "2"'>
									<button class="btn btn-warning" id="0401" onclick="showProgressUtil('0401');">招标公告、文件校对</button>
								</s:elseif>
								<s:elseif test='Status0401 == "0"'>
									<button class="btn btn-danger" id="0401" onclick="showProgressUtil('0401');">招标公告、文件校对</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0401" onclick="showProgressUtil('0401');">招标公告、文件校对</button>
								</s:else>
							</td>
							<td></td>
							<td>
								<s:if test='Status0402 == "9"'>
									<button class="btn btn-success" id="0402" onclick="showProgressUtil('0402');">二次公告&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0402 == "2"'>
									<button class="btn btn-warning" id="0402" onclick="showProgressUtil('0402');">二次公告&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0402 == "0"'>
									<button class="btn btn-danger" id="0402" onclick="showProgressUtil('0402');">二次公告&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0402" onclick="showProgressUtil('0402');">二次公告&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<s:if test='Status0404 == "9"'>
									<button class="btn btn-success" id="0404" onclick="showProgressUtil('0404');">评标完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0404 == "2"'>
									<button class="btn btn-warning" id="0404" onclick="showProgressUtil('0404');">评标完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0404 == "0"'>
									<button class="btn btn-danger" id="0404" onclick="showProgressUtil('0404');">评标完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0404" onclick="showProgressUtil('0404');">评标完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td>
								<s:if test='Status0405 == "9"'>
									<button class="btn btn-success" id="0405" onclick="showProgressUtil('0405');">评标报告送至甲方&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0405 == "2"'>
									<button class="btn btn-warning" id="0405" onclick="showProgressUtil('0405');">评标报告送至甲方&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0405 == "0"'>
									<button class="btn btn-danger" id="0405" onclick="showProgressUtil('0405');">评标报告送至甲方&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0405" onclick="showProgressUtil('0405');">评标报告送至甲方&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<s:if test='Status0501 == "9"'>
									<button class="btn btn-success" id="0501" onclick="showProgressUtil('0501');">招标文件定稿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0501 == "2"'>
									<button class="btn btn-warning" id="0501" onclick="showProgressUtil('0501');">招标文件定稿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0501 == "0"'>
									<button class="btn btn-danger" id="0501" onclick="showProgressUtil('0501');">招标文件定稿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0501" onclick="showProgressUtil('0501');">招标文件定稿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td>
								<s:if test='Status0502 == "9"'>
									<button class="btn btn-success" id="0502" onclick="showProgressUtil('0502');">报名审核表编制&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0502 == "2"'>
									<button class="btn btn-warning" id="0502" onclick="showProgressUtil('0502');">报名审核表编制&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0502 == "0"'>
									<button class="btn btn-danger" id="0502" onclick="showProgressUtil('0502');">报名审核表编制&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0502" onclick="showProgressUtil('0502');">报名审核表编制&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<s:if test='Status0504 == "9"'>
									<button class="btn btn-success" id="0504" onclick="showProgressUtil('0504');">中标公告发布&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0504 == "2"'>
									<button class="btn btn-warning" id="0504" onclick="showProgressUtil('0504');">中标公告发布&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0504 == "0"'>
									<button class="btn btn-danger" id="0504" onclick="showProgressUtil('0504');">中标公告发布&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0504" onclick="showProgressUtil('0504');">中标公告发布&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td>
								<s:if test='Status0505 == "9"'>
									<button class="btn btn-success" id="0505" onclick="showProgressUtil('0505');">中标投标文件扫描&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0505 == "2"'>
									<button class="btn btn-warning" id="0505" onclick="showProgressUtil('0505');">中标投标文件扫描&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0505 == "0"'>
									<button class="btn btn-danger" id="0505" onclick="showProgressUtil('0505');">中标投标文件扫描&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0505" onclick="showProgressUtil('0505');">中标投标文件扫描&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<s:if test='Status0602 == "9"'>
									<button class="btn btn-success" id="0602" onclick="showProgressUtil('0602');">标书费收取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0602 == "2"'>
									<button class="btn btn-warning" id="0602" onclick="showProgressUtil('0602');">标书费收取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0602 == "0"'>
									<button class="btn btn-danger" id="0602" onclick="showProgressUtil('0602');">标书费收取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0602" onclick="showProgressUtil('0602');">标书费收取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<s:if test='Status0605 == "9"'>
									<button class="btn btn-success" id="0605" onclick="showProgressUtil('0605');">标书费开票完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0605 == "2"'>
									<button class="btn btn-warning" id="0605" onclick="showProgressUtil('0605');">标书费开票完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0605 == "0"'>
									<button class="btn btn-danger" id="0605" onclick="showProgressUtil('0605');">标书费开票完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0605" onclick="showProgressUtil('0605');">标书费开票完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<s:if test='Status0702 == "9"'>
									<button class="btn btn-success" id="0702" onclick="showProgressUtil('0702');">保证金收取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0702 == "2"'>
									<button class="btn btn-warning" id="0702" onclick="showProgressUtil('0702');">保证金收取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0702 == "0"'>
									<button class="btn btn-danger" id="0702" onclick="showProgressUtil('0702');">保证金收取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0702" onclick="showProgressUtil('0702');">保证金收取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<s:if test='Status0705 == "9"'>
									<button class="btn btn-success" id="0705" onclick="showProgressUtil('0705');">退保证金完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0705 == "2"'>
									<button class="btn btn-warning" id="0705" onclick="showProgressUtil('0705');">退保证金完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0705 == "0"'>
									<button class="btn btn-danger" id="0705" onclick="showProgressUtil('0705');">退保证金完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0705" onclick="showProgressUtil('0705');">退保证金完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<s:if test='Status0802 == "9"'>
									<button class="btn btn-success" id="0802" onclick="showProgressUtil('0802');">招标文件装订&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:if>
								<s:elseif test='Status0802 == "2"'>
									<button class="btn btn-warning" id="0802" onclick="showProgressUtil('0802');">招标文件装订&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:elseif test='Status0802 == "0"'>
									<button class="btn btn-danger" id="0802" onclick="showProgressUtil('0802');">招标文件装订&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:elseif>
								<s:else>
									<button class="btn btn-danger" id="0802" onclick="showProgressUtil('0802');">招标文件装订&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</s:else>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
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