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
<title>招标信息一览</title>
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
	/*	
    var formId = 'mainform';
    window.onbeforeunload = function () {
        //用表单id做键名称
        $.jStorage.set(formId, $('#' + formId).serializeArray());
    }
    //提交成功后记得调用$.jStorage.deleteKey(formId)删除缓存数据
    window.onload = function () {
        var o = $.jStorage.get(formId);
        if (o) {//有缓存数据
            var elements = document.getElementById(formId).elements;
            for (var i = 0; i < o.length; i++) {
                elements[o[i].name].value = o[i].value;
            }
        }
    }
	*/
	function add() {
		//var url = '<c:url value="/bid/showAddBidAction.action"></c:url>' + "?date=" + new Date();
		//window.showModalDialog(url, window, "dialogheight:500px;dialogwidth:1000px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
		document.mainform.action = '<c:url value="/bid/showAddBidAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//投标更新
	function updbidstatus(bidno, bidstatus) {
		$("#updateBidNo").val(bidno);
		$("#tmpBidStatus").val(bidstatus);
		var url = '<c:url value="/bid/showUpdBidStatusAction.action"></c:url>';
		document.mainform.action = url;
		document.mainform.submit();
	}
	
	function upd() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			$("#updateBidNo").val(id);
			var url = '<c:url value="/bid/showUpdBidStatusAction.action"></c:url>';
			//var url = '<c:url value="/bid/showUpdBidAction.action"></c:url>' + "?updateBidNo=" + id;
			document.mainform.action = url;
			document.mainform.submit();
		}
	}
	
	function del() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			if(confirm("确定删除该记录吗？")) {
				setOpenDate();
				document.mainform.action = '<c:url value="/bid/delBidAction.action"></c:url>' + "?delBidNo=" + id;
				document.mainform.submit();
			}
		}
	}
	
	//设置投标状态
	function setBidStatus() {
		var bidstatus = "";
		var list = document.getElementsByName("bidStatus");
		for(var i = 1; i < list.length + 1; i++) {
			if(list[i - 1].checked) {
				bidstatus += "" + i;
			} else {
				bidstatus += "0";
			}
		}
		$("#strBidStatus").attr("value", bidstatus);
	}
	
	function showHis() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			var url = '<c:url value="/bid/showAllBidHisAction.action"></c:url>' + "?strBidNoHist=" + id + "&date=" + new Date();
			window.showModalDialog(url, window, "dialogheight:500px;dialogwidth:1000px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
		}
	}
	
	function showBidDetail() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			var url = '<c:url value="/bid/showBidDetailAction.action"></c:url>' + "?detailBidNo=" + id + "&date=" + new Date();
			window.showModalDialog(url, window, "dialogheight:600px;dialogwidth:1024px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
		}
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
		$("#strOpenDateLow").attr("value", $("#openDateLow").val());
		$("#strOpenDateHigh").attr("value", $("#openDateHigh").val());
		setBidStatus();
	}

	function queryList() {
		setOpenDate();
		document.mainform.action = '<c:url value="/bid/queryBidList.action"></c:url>';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		setOpenDate();
		document.getElementById("startIndex").value = pageNum;
		document.mainform.action = '<c:url value="/bid/turnBidPage.action"></c:url>';
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
	
	function exportBid() {
		document.mainform.action = '<c:url value="/bid/exportBidListAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function exportAllBidInfo() {
		exportPurchaseListAction
	}
	
	//专家信息下载
	function exportBidExpert() {
		var id = getSelectedID();
		if(id == "") {
			alert("请选择一条记录！");
			return;
		} else {
			//下载专家信息
			var url = '<c:url value="/bid/exportBidExpertAction.action"></c:url>' + "?exportExpertBidNo=" + id;
			document.mainform.action = url;
			document.mainform.submit();
		}
	}
	
	function queryAgentCommon() {
		var url = '<c:url value="/agentcomp/showAgentCompCommonAction.action"></c:url>' + "?strKey=strAgentNo&date=" + new Date();
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:1000px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function exportYear() {
		var url = '<c:url value="/bid/showExportYearAction.action"></c:url>' + "?date=" + new Date();
		//window.showModalDialog(url, window, "dialogheight:1000px;dialogwidth:1000px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
		window.open(url, window, 'height=1000, width=1000, top=5, left=100, status=0,resizable=no,scrollbars=yes');
	}
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<s:form id="mainform" name="mainform" method="POST">
			<s:hidden name="startIndex" id="startIndex"/>
			<s:hidden name="strOpenDateLow" id="strOpenDateLow"/>
			<s:hidden name="strOpenDateHigh" id="strOpenDateHigh"/>
			<s:hidden name="strBidStatus" id="strBidStatus"/>
			<s:hidden name="updateBidNo" id="updateBidNo"/>
			<s:hidden name="tmpBidStatus" id="tmpBidStatus"/>
			<div class="row">
				<div class="container-fluid">
					<h3 class="title">招标信息一览<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
					<div class="row">
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-2 form-label">招标编号</label>
							<div class="col-lg-4">
								<s:textfield name="strBidNoLow" id="strBidNoLow" cssClass="form-control" maxlength="13" theme="simple"></s:textfield>
							</div>
							<label for="" class="col-lg-1 form-label to">---</label>
							<div class="col-lg-4">
								<s:textfield name="strBidNoHigh" id="strBidNoHigh" cssClass="form-control" maxlength="13" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">委托公司</label>
							<div class="col-lg-9">
								<s:textfield name="strAgentName" id="strAgentName" cssClass="form-control" maxlength="20" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-5 form-group">
							<label for="" class="col-lg-3 form-label">委托公司代码</label>
							<div class="col-lg-7">
								<s:textfield name="strAgentNo" id="strAgentNo" cssClass="form-control" maxlength="4" theme="simple"></s:textfield>
							</div>
							<div class="col-lg-2">
								<button class="btn btn-success" onclick="queryAgentCommon();">选择</button>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">分类</label>
							<div class="col-lg-9">
								<select id="strProjectType" name="strProjectType" class="form-control">
									<s:if test='strProjectType == "1"'>
										<option value="">请选择</option>
										<option value="1" selected="selected">招标</option>
										<option value="2">比选</option>
										<option value="3">招标办</option>
										<option value="4">竞价</option>
									</s:if>
									<s:elseif test='strProjectType == "2"'>
										<option value="">请选择</option>
										<option value="1">招标</option>
										<option value="2" selected="selected">比选</option>
										<option value="3">招标办</option>
										<option value="4">竞价</option>
									</s:elseif>
									<s:elseif test='strProjectType == "3"'>
										<option value="">请选择</option>
										<option value="1">招标</option>
										<option value="2">比选</option>
										<option value="3" selected="selected">招标办</option>
										<option value="4">竞价</option>
									</s:elseif>
									<s:elseif test='strProjectType == "4"'>
										<option value="">请选择</option>
										<option value="1">招标</option>
										<option value="2">比选</option>
										<option value="3">招标办</option>
										<option value="4" selected="selected">竞价</option>
									</s:elseif>
									<s:else>
										<option value="" selected="selected">请选择</option>
										<option value="1">招标</option>
										<option value="2">比选</option>
										<option value="3">招标办</option>
										<option value="4">竞价</option>
									</s:else>
								</select>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">中标单位</label>
							<div class="col-lg-9">
								<s:textfield name="strBidCoName" id="strBidCoName" cssClass="form-control" maxlength="30" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">发票编号</label>
							<div class="col-lg-9">
								<s:textfield name="strReceipt1No" id="strReceipt1No" cssClass="form-control" maxlength="8" theme="simple"></s:textfield>
							</div>
						</div>
						<div class="col-lg-6 form-group">
							<label for="" class="col-lg-2 form-label">开标日期</label>
							<div class="col-lg-4">
								<div class="input-group date" data-provide="datepicker">
									<input id="openDateLow" value="<s:property value="strOpenDateLow"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label to">---</label>
							<div class="col-lg-4">
								<div class="input-group date" data-provide="datepicker">
									<input id="openDateHigh" value="<s:property value="strOpenDateHigh"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 form-group">
							<label for="" class="col-lg-3 form-label">投标状态</label>
							<div class="col-lg-9 account">
								<s:if test='%{strBidStatus.substring(0, 1) == "1"}'>
									<input name="bidStatus" type="checkbox" checked/>
									<label class="form-label" for="">未开标</label>
								</s:if>
								<s:else>
									<input name="bidStatus" type="checkbox"/>
									<label class="form-label" for="">未开标</label>
								</s:else>
								<s:if test='%{strBidStatus.substring(1, 2) == "2"}'>
									<input name="bidStatus" type="checkbox" checked/>
									<label class="form-label" for="">未到账</label>
								</s:if>
								<s:else>
									<input name="bidStatus" type="checkbox"/>
									<label class="form-label" for="">未到账</label>
								</s:else>
								<s:if test='%{strBidStatus.substring(2, 3) == "3"}'>
									<input name="bidStatus" type="checkbox" checked/>
									<label class="form-label" for="">已到账</label>
								</s:if>
								<s:else>
									<input name="bidStatus" type="checkbox"/>
									<label class="form-label" for="">已到账</label>
								</s:else>
							</div>
						</div>
						<div class="col-lg-2 form-group">
							<button class="btn btn-success form-control" onclick="queryList();">检索</button>
						</div>
					</div>
					<div class="btns">
						<ul>
							<li><a href="#" onclick="add();"><i class="fa fa-plus" aria-hidden="true"></i>新增</a></li>
							<!-- <li><a href="#" onclick="upd();"><i class="fa fa-pencil" aria-hidden="true"></i>修改</a></li> -->
							<li><a href="#" onclick="del();"><i class="fa fa-trash" aria-hidden="true"></i>删除</a></li>
						</ul>
					</div>
					<table class="table table-bordered">
						<tr>
							<th></th>
							<th>招标编号</th>
							<th>开标日期</th>
							<th>委托单位</th>
							<th>项目名称</th>
							<th>进展状态</th>
							<th>中标单位</th>
							<th>中标价(万元)</th>
							<th>发票日期</th>
							<th>发票号码</th>
							<th>代理费</th>
							<th>到账日期</th>
						</tr>
						<s:iterator id="listBid" value="listBid" status="st1">
							<tr>
								<td><input name="radioKey" type="radio" value="<s:property value="BID_NO"/>"/></td>
								<td><s:property value="BID_NO"/></td>
								<td><s:date name="TENDER_OPEN_DATE" format="yyyy/MM/dd" /></td> 
								<!-- <td><s:date name="BID_NOTICE_DATE" format="yyyy/MM/dd" /></td>-->
								<td><s:property value="AGENT_CO_NAME"/></td>
								<td><s:property value="PROJECT_NAME"/></td>
								<td>
									<ul>
										<s:if test='STATUS == "50"'>
											<li><a href="javascript:;" onclick="updbidstatus('<s:property value="BID_NO"/>', '10');">项目信息</a></li>
											<li><a href="javascript:;" onclick="updbidstatus('<s:property value="BID_NO"/>', '20');">报　　名</a></li>
											<li><a href="javascript:;" onclick="updbidstatus('<s:property value="BID_NO"/>', '30');">保  证  金</a></li>
											<li><a href="javascript:;" onclick="updbidstatus('<s:property value="BID_NO"/>', '40');">开标评标</a></li>
											<li><a href="javascript:;" onclick="updbidstatus('<s:property value="BID_NO"/>', '50');">资料归档</a></li>
										</s:if>
										<s:elseif test='STATUS == "40"'>
											<li><a href="javascript:;" onclick="updbidstatus('<s:property value="BID_NO"/>', '10');">项目信息</a></li>
											<li><a href="javascript:;" onclick="updbidstatus('<s:property value="BID_NO"/>', '20');">报　　名</a></li>
											<li><a href="javascript:;" onclick="updbidstatus('<s:property value="BID_NO"/>', '30');">保  证  金</a></li>
											<li><a href="javascript:;" onclick="updbidstatus('<s:property value="BID_NO"/>', '40');">开标评标</a></li>
											<li><a href="javascript:;" class="select">资料归档</a></li>
										</s:elseif>
										<s:elseif test='STATUS == "30"'>
											<li><a href="javascript:;" onclick="updbidstatus('<s:property value="BID_NO"/>', '10');">项目信息</a></li>
											<li><a href="javascript:;" onclick="updbidstatus('<s:property value="BID_NO"/>', '20');">报　　名</a></li>
											<li><a href="javascript:;" onclick="updbidstatus('<s:property value="BID_NO"/>', '30');">保  证  金</a></li>
											<li><a href="javascript:;" class="select">开标评标</a></li>
											<li><a href="javascript:;" class="select">资料归档</a></li>
										</s:elseif>
										<s:elseif test='STATUS == "20"'>
											<li><a href="javascript:;" onclick="updbidstatus('<s:property value="BID_NO"/>', '10');">项目信息</a></li>
											<li><a href="javascript:;" onclick="updbidstatus('<s:property value="BID_NO"/>', '20');">报　　名</a></li>
											<li><a href="javascript:;" class="select">保  证  金</a></li>
											<li><a href="javascript:;" class="select">开标评标</a></li>
											<li><a href="javascript:;" class="select">资料归档</a></li>
										</s:elseif>
										<s:elseif test='STATUS == "10"'>
											<li><a href="javascript:;" onclick="updbidstatus('<s:property value="BID_NO"/>', '10');">项目信息</a></li>
											<li><a href="javascript:;" class="select">报　　名</a></li>
											<li><a href="javascript:;" class="select">保  证  金</a></li>
											<li><a href="javascript:;" class="select">开标评标</a></li>
											<li><a href="javascript:;" class="select">资料归档</a></li>
										</s:elseif>
										<s:else>
											<li><a href="javascript:;" class="select">项目信息</a></li>
											<li><a href="javascript:;" class="select">报　　名</a></li>
											<li><a href="javascript:;" class="select">保  证  金</a></li>
											<li><a href="javascript:;" class="select">开标评标</a></li>
											<li><a href="javascript:;" class="select">资料归档</a></li>
										</s:else>
									</ul>
								</td>
								<td><s:property value="BID_CO_NAME"/></td>
								<!--
								<td><s:property value="BID_PRICE"/></td>
								-->
								<td align="right"><s:property value="BID_PRICE_LIST"/></td>
								<td><s:date name="RECEIPT1_DATE" format="yyyy/MM/dd" /></td>
								<td><s:property value="RECEIPT1_NO"/></td>
								<!-- <td align="right"><s:property value="RECEIPT1_AGENT_COMMISSION"/></td> -->
								<td align="right"><s:property value="BID_AGENT_PRICE"/></td>
								<td><s:date name="RECEIPT1_VALUE_DATE" format="yyyy/MM/dd" /></td>
							</tr>
						</s:iterator>
					</table>
					<div class="pages">
						<ul>
							<li>第<strong>${page.startIndex + 1}</strong>页/共<strong>${page.totalPage==0?1:page.totalPage}</strong>页/共<strong>${page.totalCount}</strong>条记录</li>
							<li class="mgl15">跳转到
								<input type="text" id="pagenum" class="text" maxlength="4" size="4"/>
								<input type="button" value="GO" onclick="javascript:turnPage();"/>
							</li>
							<li class="mgl15">
								<a class="first" href="#" onclick="changePage(0);">首页</a>
							</li>
							<li>
								<s:if test="%{page.startIndex <= 0}">
									<a class="last" href="#">上一页</a>
								</s:if>
								<s:else>
									<a class="next" href="#" onclick="changePage('${page.previousIndex}');">上一页</a>
								</s:else>
							</li>
							<li>
								<s:if test="%{page.nextIndex > page.totalPage - 1}">
									<a class="last" href="#">下一页</a>
								</s:if>
								<s:else>
									<a class="next" href="#" onclick="changePage('${page.nextIndex}');">下一页</a>
								</s:else>
							</li>
							<li>
								<a class="next" href="#" onclick="changePage('${page.totalPage - 1}');">末页</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="operationBtns addBtns mgt15 btn3" style="width: 300px;">
				<button class="btn btn-success" onclick="showHis();">履历</button>
				<button class="btn btn-success" onclick="exportYear();">下载</button>
				<button class="btn btn-success" onclick="exportBidExpert();">专家信息下载</button>
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
