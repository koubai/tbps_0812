<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Calendar3.js"></script>
<!--<script type="text/javascript" src="<%=request.getContextPath()%>/js/jstorage.js"></script> -->
<title>招标信息一览</title>
<script type="text/javascript">
	$(document).ready(function(){
		var h = screen.availHeight; 
		$("#container").height(h - 20);
	});
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
				<div class="icons"><a class="home" href="#" onclick="goHome();">返回首页</a><a class="quit" href="#" onclick="logout();">退出</a></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center">
					招标信息一览
				</div>
				<div class="tittle_right">
				</div>
			</div>
			<s:form id="mainform" name="mainform" method="POST">
				<s:hidden name="startIndex" id="startIndex"/>
				<s:hidden name="strOpenDateLow" id="strOpenDateLow"/>
				<s:hidden name="strOpenDateHigh" id="strOpenDateHigh"/>
				<s:hidden name="strBidStatus" id="strBidStatus"/>
				
				<s:hidden name="updateBidNo" id="updateBidNo"/>
				<s:hidden name="tmpBidStatus" id="tmpBidStatus"/>
				
				<div class="searchbox">
					<div class="box1">
						<label class="pdf10">招标编号</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strBidNoLow" id="strBidNoLow" cssStyle="width: 120px;" maxlength="13" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
						<label>-</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strBidNoHigh" id="strBidNoHigh" cssStyle="width: 120px;" maxlength="13" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</div>
					
					<div class="box1">
						<label class="pdf10">委托公司</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strAgentName" id="strAgentName" cssClass="input80" cssStyle="width: 120px;" maxlength="20" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</div>
					
					<div class="box1" style="display: none;">
						<label class="pdf10">委托公司代码</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strAgentNo" id="strAgentNo" cssClass="input80" cssStyle="width: 120px;" maxlength="4" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</div>
					
					<div class="btn" style="margin-left: 5px; display: none;">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="button" class="input40" value="选择" onclick="queryAgentCommon();"/>
						</div>
						<div class="box1_right"></div>
					</div>
					
					<div class="box1">
						<label class="pdf10">分类</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<select id="strProjectType" name="strProjectType" style="width: 150px;">
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
						<div class="box1_right"></div>
					</div>
					<div class="box1">
						<label class="pdf10">中标单位</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strBidCoName" id="strBidCoName" cssClass="input80" cssStyle="width: 120px;" maxlength="30" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="box1">
						<label class="pdf10">发票编号</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="strReceipt1No" id="strReceipt1No" cssClass="input80" cssStyle="width: 120px;" maxlength="8" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</div>
				</div>
				<div class="searchbox">
					<div class="box1">
						<label class="pdf10">开标日期</label>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 105px;" id="openDateLow" value="<s:property value="strOpenDateLow"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('openDateLow'));"></a>
						</div>
						<div class="box1_right"></div>
						<label>-</label>
						<div class="box1_left"></div>
						<div class="box1_center date_input">
							<input type="text" disabled="disabled" style="width: 105px;" id="openDateHigh" value="<s:property value="strOpenDateHigh"/>" maxlength="10" />
							<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('openDateHigh'));"></a>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="box1" style="margin-left: 5px;">
						<label class="pdf10">投标状态</label>
						<div style="width: 300px; margin-top: 5px;">
							<s:if test='%{strBidStatus.substring(0, 1) == "1"}'>
								<input name="bidStatus" type="checkbox" checked="checked"/>未开标　
							</s:if>
							<s:else>
								<input name="bidStatus" type="checkbox"/>未开标　
							</s:else>
							<s:if test='%{strBidStatus.substring(1, 2) == "2"}'>
								<input name="bidStatus" type="checkbox" checked="checked"/>未到帐　
							</s:if>
							<s:else>
								<input name="bidStatus" type="checkbox"/>未到帐　
							</s:else>
							<s:if test='%{strBidStatus.substring(2, 3) == "3"}'>
								<input name="bidStatus" type="checkbox" checked="checked"/>已到帐　
							</s:if>
							<s:else>
								<input name="bidStatus" type="checkbox"/>已到帐　
							</s:else>
						</div>
					</div>
					<div class="btn" style="margin-left: 160px;">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="button" class="input40" value="检索" onclick="queryList();"/>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="box1" style="margin-top:-3px; margin-left: -240px; color: red;">
						<s:actionmessage />
					</div>
					<div class="icons thums">
						<a class="add" onclick="add();">增加</a>
						<!--
						<a class="edit" onclick="upd();">修改</a>
						-->
						<a class="delete" onclick="del();">删除</a>
					</div>
				</div>
				<div class="data_table" style="padding:0px;">
					<div class="tab_tittle">
						<table width="100%" border="1" cellpadding="5" cellspacing="0">
						</table>
					</div>
					<div class="tab_content">
						<table class="info_tab" width="140%" border="1" cellpadding="5" cellspacing="0">
							<tr class="tittle">
								<td width="20"></td>
								<td width="60">招标编号</td>
								<td width="40">开标日期</td>
								<td width="80">委托单位</td>
								<td width="80">项目名称</td>
								<td width="300">进展状态</td>
								<td width="60">中标单位</td>
								<td width="40">中标价(万元)</td>
								<td width="40">发票日期</td>
								<td width="60">发票号码</td>
								<td width="40">代理费</td>
								<td width="40">到账日期</td>
							</tr>
							<s:iterator id="listBid" value="listBid" status="st1">
								<s:if test="#st1.odd==true">
									<tr class="tr_bg">
								</s:if>
								<s:else>
									<tr>
								</s:else>
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
					</div>
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
				<div class="btns" style="margin-top:-100px;">
					<table border="0" style="margin:0 auto;">
						<tr>
							<td style="display: none;">
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" type="button" value="详细" onclick="showBidDetail();" />
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" type="button" value="履历" onclick="showHis();" />
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" type="button" value="下载" onclick="exportYear();" />
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
<!-- 						<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" style="width: 120px;" type="button" value="完整信息下载" onclick="exportAllBidInfo();" />
									</div>
									<div class="box1_right"></div>
								</div>
							</td> -->
							<td>
								<div class="btn">
									<div class="box1_left"></div>
									<div class="box1_center">
										<input class="input80" style="width: 120px;" type="button" value="专家信息下载" onclick="exportBidExpert();" />
									</div>
									<div class="box1_right"></div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</s:form>
		</div>
	</div>
</body>
</html>
