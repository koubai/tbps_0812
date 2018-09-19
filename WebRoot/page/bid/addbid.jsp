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
		var CNTRCT_TYPE = $("#CNTRCT_TYPE").val();
		var CNTRCT_YEAR = $("#CNTRCT_YEAR").val();
		var CNTRCT_ST_DATE = $("#CNTRCT_ST_DATE").val();
		var CNTRCT_ED_DATE = $("#CNTRCT_ED_DATE").val();
		var BID_COMP_NO = $("#BID_COMP_NO").val();
		var BID_COMP_NAME = $("#BID_COMP_NAME").val();
		var CO_MANAGER1 = $("#CO_MANAGER1").val();
		var CNTRCT_YEAR = $("#CNTRCT_YEAR").val();
		var IS_RANDOM = $("#IS_RANDOM").val();
		var BID_NO = $("#BID_NO").val();
		var PROJECT_NAME = $("#PROJECT_NAME").val();
		var PROJECT_MANAGER = $("#PROJECT_MANAGER").val();
		
		//#tab1
		var BID_AGENT_PRICE = $("#BID_AGENT_PRICE").val();
		var PROJ_APPROVAL = $("#PROJ_APPROVAL").val();
		//#tab2
		var APPLY_REQUIRE = $("#APPLY_REQUIRE").val();
		var BID_BOND = $("#BID_BOND").val();
		//#tab4
		var BID_LIMIT_PRICE = $("#BID_LIMIT_PRICE").val();
		//#tab6
		var BID_APPLY_PRICE = $("#BID_APPLY_PRICE").val();
		//#tab7
		var BID_AGENT_PRICE_ACT = $("#BID_AGENT_PRICE_ACT").val();
		var BID_PRICE = $("#BID_PRICE").val();
		//#tab8
		var BID_EXPERT_COMMISION_PRE = $("#BID_EXPERT_COMMISION_PRE").val();
		var BID_EXPERT_COMMISION_ACT = $("#BID_EXPERT_COMMISION_ACT").val();
		
		if(CNTRCT_NO == "") {
			alert("请选择合同编号！");
			$("#CNTRCT_NO").focus();
			return false;
		}
		
		if(CNTRCT_TYPE == "3" || CNTRCT_TYPE == "4" ) {
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
		
		if(IS_RANDOM == "0") {
			//非随机生成招标编号时
			//分类=比选,招标时，招标编号不能为空
			if(CNTRCT_TYPE == "1") {
				//验证招标编号格式是否正确
				if(!isZB(BID_NO)) {
					alert("招标编号格式不正确，应为：LHZB-YY-NNN！");
					$("#BID_NO").focus();
					return false;
				}
			} else if(CNTRCT_TYPE == "2") {
				//验证招标编号格式是否正确
				if(!isBX(BID_NO)) {
					alert("招标编号格式不正确，应为：LHBX-YY-NNN！");
					$("#BID_NO").focus();
					return false;
				}
			} else if(CNTRCT_TYPE == "4") {
				//验证招标编号格式是否正确
				if(!isJJ(BID_NO)) {
					alert("招标编号格式不正确，应为：LHJJ-YY-NNN！");
					$("#BID_NO").focus();
					return false;
				}
			}
		}
		if(PROJECT_MANAGER == "") {
			alert("请选择工程师！");
			$("#PROJECT_MANAGER").focus();
			return false;
		}
		if(PROJECT_NAME == "") {
			alert("项目名称不能为空！");
			$("#PROJECT_NAME").focus();
			return false;
		}
		
		if(BID_AGENT_PRICE != "" && !isReal(BID_AGENT_PRICE)) {
			showtab("1");
			alert("代理费格式不正确！");
			$("#BID_AGENT_PRICE").focus();
			return false;
		}
		if(PROJ_APPROVAL.length > 60) {
			showtab("1");
			alert("工程概况批文不能超过60个字！");
			$("#tmpPROJ_APPROVAL").focus();
			return false;
		}
		
		var registeStDateList = $("[name='registeStDate']");
		var registeEdDateList = $("[name='registeEdDate']");
		for(var i = 0; i < registeStDateList.length; i++) {
			if(registeStDateList[i].value == "") {
				showtab("2");
				alert("报名开始时间不能为空！");
				registeStDateList[i].focus();
				return false;
			}
			if(registeEdDateList[i].value == "") {
				showtab("2");
				alert("报名结束时间不能为空！");
				registeEdDateList[i].focus();
				return false;
			}
			if(registeStDateList[i].value > registeEdDateList[i].value) {
				showtab("2");
				alert("报名开始时间不能大于报名结束时间！");
				registeEdDateList[i].focus();
				return false;
			}
		}
		//清空报名日历
		$("#REGISTE_ST_DATE1").val("");
		$("#REGISTE_ED_DATE1").val("");
		$("#REGISTE_ST_DATE2").val("");
		$("#REGISTE_ED_DATE2").val("");
		$("#REGISTE_ST_DATE3").val("");
		$("#REGISTE_ED_DATE3").val("");
		$("#REGISTE_ST_DATE4").val("");
		$("#REGISTE_ED_DATE4").val("");
		$("#REGISTE_ST_DATE5").val("");
		$("#REGISTE_ED_DATE5").val("");
		//报名日历重新赋值
		for(var i = 0; i < registeStDateList.length; i++) {
			var n = i + 1;
			$("#REGISTE_ST_DATE" + n).val(registeStDateList[i].value);
			$("#REGISTE_ED_DATE" + n).val(registeEdDateList[i].value);
		}
		if(APPLY_REQUIRE.length > 1000) {
			showtab("2");
			alert("报名要求不能超过1000个字！");
			$("#tmpAPPLY_REQUIRE").focus();
			return false;
		}
		if(BID_BOND != "" && !isReal(BID_BOND)) {
			showtab("2");
			alert("保证金格式不正确！");
			$("#BID_BOND").focus();
			return false;
		}
		if(BID_LIMIT_PRICE != "" && !isReal(BID_LIMIT_PRICE)) {
			showtab("4");
			alert("限价格式不正确！");
			$("#BID_LIMIT_PRICE").focus();
			return false;
		}
		if(BID_APPLY_PRICE != "" && !isReal(BID_APPLY_PRICE)) {
			showtab("6");
			alert("标书费金额格式不正确！");
			$("#BID_APPLY_PRICE").focus();
			return false;
		}
		if(BID_AGENT_PRICE_ACT != "" && !isReal(BID_AGENT_PRICE_ACT)) {
			showtab("7");
			alert("实收代理费格式不正确！");
			$("#BID_APPLY_PRICE").focus();
			return false;
		}
		if(BID_PRICE != "" && !isReal(BID_PRICE)) {
			showtab("7");
			alert("中标金额格式不正确！");
			$("#BID_PRICE").focus();
			return false;
		}
		
		if(BID_EXPERT_COMMISION_PRE != "" && !isReal(BID_EXPERT_COMMISION_PRE)) {
			showtab("8");
			alert("预借费用格式不正确！");
			$("#BID_EXPERT_COMMISION_PRE").focus();
			return false;
		}
		if(BID_EXPERT_COMMISION_ACT != "" && !isReal(BID_EXPERT_COMMISION_ACT)) {
			showtab("8");
			alert("实际费用格式不正确！");
			$("#BID_EXPERT_COMMISION_ACT").focus();
			return false;
		}
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
		$("#CNTRCT_TYPE").val($("#tmpCNTRCT_TYPE").val());
		
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
		
		$("#PROJECT_DEVIEW_DATE").val($("#tmpPROJECT_DEVIEW_DATE").val());
		$("#PROJ_APPROVAL").attr("value", $("#tmpPROJ_APPROVAL").val());
		$("#APPLY_REQUIRE").attr("value", $("#tmpAPPLY_REQUIRE").val());
		$("#TENDER_OPEN_DATE").attr("value", $("#tmpTENDER_OPEN_DATE").val());
		$("#TENDER_VERIFY_DATE").attr("value", $("#tmpTENDER_VERIFY_DATE").val());
		
		$("#RECEIPT1_DATE").attr("value", $("#tmpRECEIPT1_DATE").val());
		$("#RECEIPT1_VALUE_DATE").attr("value", $("#tmpRECEIPT1_VALUE_DATE").val());
		
		$("#BID_EXPERT_COMMISION_DIFF_DATE").attr("value", $("#tmpBID_EXPERT_COMMISION_DIFF_DATE").val());
		
		//默认0
		if($("#BID_AGENT_PRICE").val() == "") {
			$("#BID_AGENT_PRICE").val("0");
		}
		if($("#BID_AGENT_PRICE_ACT").val() == "") {
			$("#BID_AGENT_PRICE_ACT").val("0");
		}
		if($("#BID_BOND").val() == "") {
			$("#BID_BOND").val("0");
		}
		if($("#BID_LIMIT_PRICE").val() == "") {
			$("#BID_LIMIT_PRICE").val("0");
		}
		/* if($("#BID_CO_PRICE").val() == "") {
			$("#BID_CO_PRICE").val("0");
		} */
		if($("#BID_PRICE").val() == "") {
			$("#BID_PRICE").val("0");
		}
		/* if($("#BID_EXPERT_COMMISION").val() == "") {
			$("#BID_EXPERT_COMMISION").val("0");
		} */
		if($("#BID_EXPERT_COMMISION_PRE").val() == "") {
			$("#BID_EXPERT_COMMISION_PRE").val("0");
		}
		if($("#BID_EXPERT_COMMISION_ACT").val() == "") {
			$("#BID_EXPERT_COMMISION_ACT").val("0");
		}
		if($("#BID_APPLY_PRICE").val() == "") {
			$("#BID_APPLY_PRICE").val("0");
		}
		/* if($("#BID_WIN_PRICE").val() == "") {
			$("#BID_WIN_PRICE").val("0");
		} */
		
		//招标公司
		$("#bidCompListTable").empty();
		var rows = document.getElementById("bidCompBody").rows;
		for(var i = 0; i < rows.length; i++) {
			var childs = rows[i].cells[1].getElementsByTagName("input");
			var BID_CO_NO = childs[0].value;
			var BID_CO_NAME = childs[1].value;
			var BID_CO_MANAGER = childs[2].value;
			var BID_CO_TEL = childs[3].value;
			var BID_CO_ADD = childs[4].value;
			var BID_CO_PS = childs[5].value;
			var TAX_NO = childs[6].value;
			var BID_CO_SEQ = rows[i].cells[2].innerHTML;
			
			var tr = document.createElement("tr");
			var td = document.createElement("td");
			
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_NO", BID_CO_NO));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_NAME", BID_CO_NAME));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_MANAGER", BID_CO_MANAGER));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_TEL", BID_CO_TEL));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_ADD", BID_CO_ADD));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_PS", BID_CO_PS));
			td.appendChild(createInput("listBidCompTmp[" + i + "].TAX_NO", TAX_NO));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_SEQ", BID_CO_SEQ));
			
			tr.appendChild(td);
			document.getElementById("bidCompListTable").appendChild(tr);
		}
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
	
	function showSelectBidCntrct() {
		$("#strCNTRCT_YEAR").val("");
		$("#strCNTRCT_ST_DATE").val("");
		$("#strCNTRCT_ED_DATE").val("");
		//查询委托公司
		querySelectPageAjax("0");
		//禁用 Bootstrap 模态框(Modal) 点击空白时自动关闭
		$('#bidCntrctModal').modal({backdrop: 'static', keyboard: false});
		$('#bidCntrctModal').modal('show');
	}
	
	/**
	 * 注：翻页函数，每个列表选择模态窗体必须实现这个函数
	 */
	function querySelectPageAjax(index) {
		//各个模块自己的参数
		var strCNTRCT_YEAR = $("#strCNTRCT_YEAR").val();
		var strCNTRCT_ST_DATE = $("#strCNTRCT_ST_DATE").val();
		var strCNTRCT_ED_DATE = $("#strCNTRCT_ED_DATE").val();
		var param = new Object();
		param.strCNTRCT_YEAR = strCNTRCT_YEAR;
		param.strCNTRCT_ST_DATE = strCNTRCT_ST_DATE;
		param.strCNTRCT_ED_DATE = strCNTRCT_ED_DATE;
		
		//-----共通1 start-----
		//页码
		param.ajaxPageIndex = index;
		//总记录数
		var ajaxTotalCount = $("#ajaxTotalCount").val();
		if(ajaxTotalCount == "") {
			ajaxTotalCount = "0";
		}
		param.ajaxTotalCount = ajaxTotalCount;
		//-----共通1 end-----
		
		$.getJSON('<%=request.getContextPath()%>/bidcntrct/queryBidCntrctAjax.action', param, function(data) {
			if(data.resultCode == 0) {
				var items = data.data.items;
				//数据列表
				$("#bidCntrctData").empty();
				$.each(items, function(i, n) {
					var html = "";
					html += '<tr>';
					html += '	<td><input name="bidCntrctKey" type="radio" value=""/></td>';
					html += '	<td style="display: none;">';
					html += '		<input type="hidden" value="' + n.CNTRCT_NO + '">';
					html += '		<input type="hidden" value="' + n.CNTRCT_YEAR + '">';
					html += '		<input type="hidden" value="' + n.showCNTRCT_ST_DATE + '">';
					html += '		<input type="hidden" value="' + n.showCNTRCT_ED_DATE + '">';
					html += '		<input type="hidden" value="' + n.BID_COMP_NO + '">';
					html += '		<input type="hidden" value="' + n.BID_COMP_NAME + '">';
					html += '		<input type="hidden" value="' + n.CO_ADDRESS1 + '">';
					html += '		<input type="hidden" value="' + n.CO_MANAGER1 + '">';
					html += '		<input type="hidden" value="' + n.CO_MANAGER_EMAIL1 + '">';
					html += '		<input type="hidden" value="' + n.CO_MANAGER_TEL1 + '">';
					html += '		<input type="hidden" value="' + n.CNTRCT_TYPE + '">';
					html += '		<input type="hidden" value="' + n.CO_TAX + '">';
					html += '	</td>';
					html += '	<td>' + n.CNTRCT_YEAR + '</td>';
					html += '	<td>' + n.CNTRCT_NO + '</td>';
					html += '	<td>' + n.BID_COMP_NAME + '</td>';
					html += '</tr>';
					$("#bidCntrctData").append(html);
				});
				
				//-----共通2 start-----
				//分页页码
				$("#ajaxpagenum").val("");
				var totalPage = data.data.totalPage;
				//总数据量
				var totalCount = data.data.totalCount;
				totalPage = parseInt(totalPage);
				totalCount = parseInt(totalCount);
				$("#ajaxTotalPage").val(totalPage);
				$("#ajaxTotalCount").val(totalCount);
				//分页
				var skipList = data.data.skipList;
				$("#ajaxskiplist").empty();
				//第一页
				$("#ajaxskiplist").append('<li><a href="javascript:void(0);" onclick="turningAjaxPage(1);">&laquo;</a></li>');
				$.each(skipList, function(ii, nn) {
					if((parseInt(nn) - 1) == parseInt(index)) {
						$("#ajaxskiplist").append('<li class="active"><a href="javascript:void(0);">' + nn + '</a></li>');
					} else {
						$("#ajaxskiplist").append('<li><a href="javascript:void(0);" onclick="turningAjaxPage(' + nn + ');">' + nn + '</a></li>');
					}
				});
				//页信息
				$("#ajaxPageInfo").empty();
				var startIndex = data.data.startIndex;
				startIndex = parseInt(startIndex);
				if(totalPage == 0) {
					totalPage = 1;
				}
				var ajaxPageInfo = '第' + (startIndex + 1) + '页/共' + totalPage + '页&nbsp;&nbsp;&nbsp;&nbsp;共' + totalCount + '条记录';
				$("#ajaxPageInfo").append(ajaxPageInfo);
				//最后一页
				$("#ajaxskiplist").append('<li><a href="javascript:void(0);" onclick="turningLastPage();">&raquo;</a></li>');
				//-----共通2 end-----
			} else {
				alert(data.resultMessage);
			}
		});
		//agentCompData
	}
	
	//列表页选择确定按钮
	function selectBidCntrct() {
		var obj = null;
		var list = document.getElementsByName("bidCntrctKey");
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
			var CNTRCT_NO = inputs[0].value;
			var CNTRCT_YEAR = inputs[1].value;
			var showCNTRCT_ST_DATE = inputs[2].value;
			var showCNTRCT_ED_DATE = inputs[3].value;
			var BID_COMP_NO = inputs[4].value;
			var BID_COMP_NAME = inputs[5].value;
			var CO_ADDRESS1 = inputs[6].value;
			var CO_MANAGER1 = inputs[7].value;
			var CO_MANAGER_EMAIL1 = inputs[8].value;
			var CO_MANAGER_TEL1 = inputs[9].value;
			var CNTRCT_TYPE = inputs[10].value;
			var CO_TAX = inputs[11].value;
			$('#tmpCNTRCT_NO').val(CNTRCT_NO);
			$('#tmpCNTRCT_YEAR').val(CNTRCT_YEAR);
			$('#tmpCNTRCT_ST_DATE').val(showCNTRCT_ST_DATE);
			$('#tmpCNTRCT_ED_DATE').val(showCNTRCT_ED_DATE);
			$('#tmpBID_COMP_NO').val(BID_COMP_NO);
			$('#tmpBID_COMP_NAME').val(BID_COMP_NAME);
			$('#tmpCO_ADDRESS1').val(CO_ADDRESS1);
			$('#tmpCO_MANAGER1').val(CO_MANAGER1);
			$('#tmpCO_MANAGER_EMAIL1').val(CO_MANAGER_EMAIL1);
			$('#tmpCO_MANAGER_TEL1').val(CO_MANAGER_TEL1);
			$('#tmpCNTRCT_TYPE').val(CNTRCT_TYPE);
			if(CNTRCT_TYPE == "1") {
				$('#tmpCNTRCT_TYPE_NAME').val("招标");
			} else if(CNTRCT_TYPE == "4") {
				$('#tmpCNTRCT_TYPE_NAME').val("竞价");
			} else {
				$('#tmpCNTRCT_TYPE_NAME').val("");
			}
			$('#tmpCO_TAX').val(CO_TAX);
			//隐藏模态窗体
			$('#bidCntrctModal').modal('hide');
		} else {
			alert("请选择一条记录！");
		}
	}
	
	function deldate(obj) {
		var registeStDateList = $("[name='registeStDate']");
		if(registeStDateList.length <= 1) {
			//保证至少有一条记录
			return;
		} else {
			//删除当前日期
			$(obj).parent().parent().remove();
		}
	}
	
	function showtab(id) {
		for(var i = 1; i <= 8; i++) {
			$("#tabli" + i).removeClass("active");
			$("#tab" + i).removeClass("tab-pane fade in active");
			$("#tab" + i).addClass("tab-pane fade");
		}
		$("#tabli" + id).addClass("active");
		$("#tab" + id).addClass("tab-pane fade in active");
	}

	function adddate() {
		var registeStDateList = $("[name='registeStDate']");
		if(registeStDateList.length >= 5) {
			//alert("报名日期不能超过5条记录！");
			return;
		} else {
			var html = "";
			html += '<div class="row">';
			html += '	<div class="col-lg-4">';
			html += '		<div class="input-group date" data-date-format="yyyy-mm-dd" data-provide="datepicker">';
			html += '			<input type="text" name="registeStDate" value="" class="form-control datepicker" readonly>';
			html += '			<div class="input-group-addon">';
			html += '				<span class="glyphicon glyphicon-th"></span>';
			html += '			</div>';
			html += '		</div>';
			html += '	</div>';
			html += '	<label for="" class="col-lg-1 form-label to">---</label>';
			html += '	<div class="col-lg-4">';
			html += '		<div class="input-group date" data-date-format="yyyy-mm-dd" data-provide="datepicker">';
			html += '			<input type="text" name="registeEdDate" value="" class="form-control datepicker" readonly>';
			html += '			<div class="input-group-addon">';
			html += '				<span class="glyphicon glyphicon-th"></span>';
			html += '			</div>';
			html += '		</div>';
			html += '	</div>';
			html += '	<div class="col-lg-2">';
			html += '		<a href="javascript:void(0);" onclick="adddate();">';
			html += '			<img src="<%=request.getContextPath()%>/images/add.png" />';
			html += '		</a>';
			html += '		<a href="javascript:void(0);" onclick="deldate(this);">';
			html += '			<img src="<%=request.getContextPath()%>/images/minus.png" />';
			html += '		</a>';
			html += '	</div>';
			html += '</div>';
			$("#registeDateDiv").append(html);
			$('.datepicker').parent().datepicker({
				"autoclose":true,"format":"yyyy-mm-dd","language":"zh-CN",clearBtn: true
			});
		}
	}
	
	function showAddBidComp() {
		//初始化数据
		$('#tmpBidCompId').val("");
		$('#tmpBidCompSeq').val("");
		$('#tmpBidCompName').val("");
		$('#tmpBidCompManager').val("");
		$('#tmpBidCompTel').val("");
		$('#tmpBidCompAddress').val("");
		$('#tmpBidCompPs').val("");
		$('#tmpBidCompTaxno').val("");
		//禁用 Bootstrap 模态框(Modal) 点击空白时自动关闭
		$('#bidCompModal').modal({backdrop: 'static', keyboard: false});
		$('#bidCompModal').modal('show');
	}
	
	function showUpdBidComp() {
		var obj = null;
		var list = document.getElementsByName("bidCompRadio");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				obj = list[i]
				break;
			}
		}
		if(obj == null) {
			alert("请选择一条记录！");
		} else {
			var tr = obj.parentNode.parentNode;
			var tds = tr.getElementsByTagName("td");
			var inputs = tds[1].getElementsByTagName("input");
			var BID_CO_NO = inputs[0].value;
			var BID_CO_NAME = inputs[1].value;
			var BID_CO_MANAGER = inputs[2].value;
			var BID_CO_TEL = inputs[3].value;
			var BID_CO_ADD = inputs[4].value;
			var BID_CO_PS = inputs[5].value;
			var TAX_NO = inputs[6].value;
			var seq = tds[2].innerHTML;
			$('#tmpBidCompId').val(BID_CO_NO);
			$('#tmpBidCompSeq').val(seq);
			$('#tmpBidCompName').val(BID_CO_NAME);
			$('#tmpBidCompManager').val(BID_CO_MANAGER);
			$('#tmpBidCompTel').val(BID_CO_TEL);
			$('#tmpBidCompAddress').val(BID_CO_ADD);
			$('#tmpBidCompPs').val(BID_CO_PS);
			$('#tmpBidCompTaxno').val(TAX_NO);
			//禁用 Bootstrap 模态框(Modal) 点击空白时自动关闭
			$('#bidCompModal').modal({backdrop: 'static', keyboard: false});
			$('#bidCompModal').modal('show');
		}
	}
	
	function delBidComp() {
		var obj = null;
		var list = document.getElementsByName("bidCompRadio");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				obj = list[i]
				break;
			}
		}
		if(obj == null) {
			alert("请选择一条记录！");
		} else {
			if(confirm("确定删除吗?")) {
				obj.parentNode.parentNode.remove();
				//刷新seq
				var rows = document.getElementById("bidCompBody").rows;
				for(var i = 0; i < rows.length; i++) {
					var num = i + 1;
					rows[i].cells[2].innerHTML = num;
				}
			}
		}
	}
	
	function createInput(id, value) {
		var input = document.createElement("input");
		input.type = "text";
		input.name = id;
		input.value = value;
		return input;
	}
	
	function createHidden(s) {
		var input = document.createElement("input");
		input.type = "hidden";
		input.value = s;
		return input;
	}
	
	function createTd(s) {
		var td = document.createElement("td");
		td.appendChild(document.createTextNode(s));
		return td;
	}
	
	function saveBidComp() {
		var tmpBidCompId = $('#tmpBidCompId').val(); 
		var tmpBidCompSeq = $('#tmpBidCompSeq').val(); 
		var tmpBidCompName = $('#tmpBidCompName').val(); 
		var tmpBidCompManager = $('#tmpBidCompManager').val();
		var tmpBidCompTel = $('#tmpBidCompTel').val(); 
		var tmpBidCompAddress = $('#tmpBidCompAddress').val();
		var tmpBidCompPs = $('#tmpBidCompPs').val(); 
		var tmpBidCompTaxno = $('#tmpBidCompTaxno').val(); 
		if(tmpBidCompName == "") {
			alert("请输入单位名称！");
			$("#tmpBidCompName").focus();
			return;
		}
		if(tmpBidCompManager == "") {
			alert("单位负责人不能为空！");
			$("#tmpBidCompManager").focus();
			return;
		}
		if(tmpBidCompTel == "") {
			alert("负责人电话不能为空！");
			$("#tmpBidCompTel").focus();
			return;
		}
		if(tmpBidCompAddress == "") {
			alert("联系地址不能为空！");
			$("#tmpBidCompAddress").focus();
			return;
		}
		if(tmpBidCompPs == "") {
			alert("邮箱不能为空！");
			$("#tmpBidCompPs").focus();
			return;
		}
		if(tmpBidCompTaxno == "") {
			alert("开票信息不能为空！");
			$("#tmpBidCompTaxno").focus();
			return;
		}
		
		if(tmpBidCompSeq == "") {
			//新增
			var bidCompBody = document.getElementById("bidCompBody");
			var tr = document.createElement("tr");
			
			var td0 = document.createElement("td");
			//单选框
			var radio = document.createElement("input");
			radio.name = "bidCompRadio";
			radio.type = "radio";
			radio.value = "";
			td0.appendChild(radio);
			tr.appendChild(td0);
			
			var td1 = document.createElement("td");
			td1.style.display = "none";
			//bidCompId
			var input = createHidden(tmpBidCompId);
			td1.appendChild(input);
			//公司名称
			var input = createHidden(tmpBidCompName);
			td1.appendChild(input);
			//公司联系人
			var input = createHidden(tmpBidCompManager);
			td1.appendChild(input);
			//公司联系电话
			var input = createHidden(tmpBidCompTel);
			td1.appendChild(input);
			//公司联系地址
			var input = createHidden(tmpBidCompAddress);
			td1.appendChild(input);
			//邮箱
			var input = createHidden(tmpBidCompPs);
			td1.appendChild(input);
			//开票信息
			var input = createHidden(tmpBidCompTaxno);
			td1.appendChild(input);
			//seq
			var input = createHidden("");
			td1.appendChild(input);
			tr.appendChild(td1);
			
			//序号
			tr.appendChild(createTd(""));
			//单位名称
			tr.appendChild(createTd(tmpBidCompName));
			//单位负责人
			tr.appendChild(createTd(tmpBidCompManager));
			//负责人电话
			tr.appendChild(createTd(tmpBidCompTel));
			//联系地址
			tr.appendChild(createTd(tmpBidCompAddress));
			//邮箱
			tr.appendChild(createTd(tmpBidCompPs));
			//报名内容
			tr.appendChild(createTd(""));
			
			bidCompBody.appendChild(tr);
		} else {
			//修改
			var rows = document.getElementById("bidCompBody").rows;
			var seq = parseInt(tmpBidCompSeq) - 1;
			//更新隐藏域的值
			var ii = rows[seq].cells[1].getElementsByTagName("input");
			ii[1].value = tmpBidCompName;
			ii[2].value = tmpBidCompManager;
			ii[3].value = tmpBidCompTel;
			ii[4].value = tmpBidCompAddress;
			ii[5].value = tmpBidCompPs;
			ii[6].value = tmpBidCompTaxno;
			//更新显示的值
			rows[seq].cells[3].innerHTML = tmpBidCompName;
			rows[seq].cells[4].innerHTML = tmpBidCompManager;
			rows[seq].cells[5].innerHTML = tmpBidCompTel;
			rows[seq].cells[6].innerHTML = tmpBidCompAddress;
			rows[seq].cells[7].innerHTML = tmpBidCompPs;
		}
		//刷新seq
		var rows = document.getElementById("bidCompBody").rows;
		for(var i = 0; i < rows.length; i++) {
			var num = i + 1;
			rows[i].cells[2].innerHTML = num;
		}
		$('#bidCompModal').modal('hide');
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
			<s:hidden name="addBidDto.CNTRCT_TYPE" id="CNTRCT_TYPE"/>
			<s:hidden name="addBidDto.PROJECT_DEVIEW_DATE" id="PROJECT_DEVIEW_DATE"/>
			<s:hidden name="addBidDto.PROJ_APPROVAL" id="PROJ_APPROVAL"/>
			<s:hidden name="addBidDto.REGISTE_ST_DATE1" id="REGISTE_ST_DATE1"/>
			<s:hidden name="addBidDto.REGISTE_ED_DATE1" id="REGISTE_ED_DATE1"/>
			<s:hidden name="addBidDto.REGISTE_ST_DATE2" id="REGISTE_ST_DATE2"/>
			<s:hidden name="addBidDto.REGISTE_ED_DATE2" id="REGISTE_ED_DATE2"/>
			<s:hidden name="addBidDto.REGISTE_ST_DATE3" id="REGISTE_ST_DATE3"/>
			<s:hidden name="addBidDto.REGISTE_ED_DATE3" id="REGISTE_ED_DATE3"/>
			<s:hidden name="addBidDto.REGISTE_ST_DATE4" id="REGISTE_ST_DATE4"/>
			<s:hidden name="addBidDto.REGISTE_ED_DATE4" id="REGISTE_ED_DATE4"/>
			<s:hidden name="addBidDto.REGISTE_ST_DATE5" id="REGISTE_ST_DATE5"/>
			<s:hidden name="addBidDto.REGISTE_ED_DATE5" id="REGISTE_ED_DATE5"/>
			<s:hidden name="addBidDto.APPLY_REQUIRE" id="APPLY_REQUIRE"/>
			<s:hidden name="addBidDto.TENDER_OPEN_DATE" id="TENDER_OPEN_DATE"/>
			<s:hidden name="addBidDto.TENDER_VERIFY_DATE" id="TENDER_VERIFY_DATE"/>
			
			<s:hidden name="addBidDto.RECEIPT1_DATE" id="RECEIPT1_DATE"/>
			<s:hidden name="addBidDto.RECEIPT1_VALUE_DATE" id="RECEIPT1_VALUE_DATE"/>
			<s:hidden name="addBidDto.BID_EXPERT_COMMISION_DIFF_DATE" id="BID_EXPERT_COMMISION_DIFF_DATE"/>
			<div class="row">
				<table id="bidCompListTable" style="display: none;">
				</table>
				<table id="expertLibListTable" style="display: none;">
				</table>
				<div class="col-lg-10 right w100">
					<s:if test="hasActionMessages()">
						<div class="row">
							<span style="color:red; text-align:center;"><s:actionmessage /></span>
						</div>
					</s:if>
					<h3 class="title">项目信息<a class="backHome" href="#" onclick="goBidList();"><i class="fa fa-arrow-left" aria-hidden="true"></i>返回</a></h3>
					<div class="row">
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-3 form-label">合同编号</label>
							<div class="col-lg-7">
								<input id="tmpCNTRCT_NO" value="<s:property value="addBidDto.CNTRCT_NO"/>" type="text" class="form-control" readonly>
							</div>
							<div class="col-lg-2" style="z-index: 1;">
								<button type="button" class="btn btn-success" onclick="showSelectBidCntrct();">合同选择</button>
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
						 		<input id="tmpCNTRCT_ED_DATE" value="<s:date name="addBidDto.CNTRCT_ST_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control" readonly>
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
						 		<s:if test='addBidDto.CNTRCT_TYPE != "3" && addBidDto.CNTRCT_TYPE != "4" && addBidDto.IS_RANDOM == "1"'>
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
						 		<input id="tmpCNTRCT_TYPE" value="<s:property value="addBidDto.CNTRCT_TYPE"/>" type="hidden" class="form-control">
						 		<s:if test='addBidDto.CNTRCT_TYPE == "1"'>
						 			<input id="tmpCNTRCT_TYPE_NAME" value="招标" maxlength="80" type="text" class="form-control" readonly>
						 		</s:if>
						 		<s:elseif test='addBidDto.CNTRCT_TYPE == "4"'>
						 			<input id="tmpCNTRCT_TYPE_NAME" value="竞价" maxlength="80" type="text" class="form-control" readonly>
						 		</s:elseif>
						 		<s:else>
						 			<input id="tmpCNTRCT_TYPE_NAME" value="" maxlength="80" type="text" class="form-control" readonly>
						 		</s:else>
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
						 		<s:textfield name="addBidDto.PROJECT_NAME" id="PROJECT_NAME" cssClass="form-control" maxlength="200" theme="simple"></s:textfield>
						 	</div>
						</div>
					</div>
					<ul id="myTab" class="nav nav-tabs">
						<li id="tabli1" class="active"><a href="#tab1" data-toggle="tab">项目新增</a></li>
						<li id="tabli2"><a href="#tab2" data-toggle="tab">报名要求</a></li>
						<li id="tabli3"><a href="#tab3" data-toggle="tab">投标单位信息</a></li>
						<li id="tabli4"><a href="#tab4" data-toggle="tab">开评标</a></li>
						<li id="tabli5"><a href="#tab5" data-toggle="tab">保证金</a></li>
						<li id="tabli6"><a href="#tab6" data-toggle="tab">标书费</a></li>
						<li id="tabli7"><a href="#tab7" data-toggle="tab">代理费</a></li>
						<li id="tabli8"><a href="#tab8" data-toggle="tab">专家费</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade in active" id="tab1">
							<div class="row" style="margin-top: 20px;">
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">承接项目日期</label>
									<div class="col-lg-9">
										<div class="input-group date" data-provide="datepicker">
											<input type="text" id="tmpPROJECT_DEVIEW_DATE" value="<s:date name="addBidDto.PROJECT_DEVIEW_DATE" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">项目性质</label>
									<div class="col-lg-9">
										<select class="form-control" name="addBidDto.PROJECT_PROPERTY" id="PROJECT_PROPERTY">
											<option value="" selected="selected">请选择</option>
											<s:if test='addBidDto.PROJECT_PROPERTY == "1"'>
												<option value="1" selected="selected">成本内</option>
												<option value="2">成本外</option>
												<option value="3">单独立项</option>
												<option value="9">其他</option>
											</s:if>
											<s:elseif test='addBidDto.PROJECT_PROPERTY == "2"'>
												<option value="1">成本内</option>
												<option value="2" selected="selected">成本外</option>
												<option value="3">单独立项</option>
												<option value="9">其他</option>
											</s:elseif>
											<s:elseif test='addBidDto.PROJECT_PROPERTY == "3"'>
												<option value="1">成本内</option>
												<option value="2">成本外</option>
												<option value="3" selected="selected">单独立项</option>
												<option value="9">其他</option>
											</s:elseif>
											<s:elseif test='addBidDto.PROJECT_PROPERTY == "4"'>
												<option value="1">成本内</option>
												<option value="2">成本外</option>
												<option value="3">单独立项</option>
												<option value="9" selected="selected">其他</option>
											</s:elseif>
											<s:else>
												<option value="1">成本内</option>
												<option value="2">成本外</option>
												<option value="3">单独立项</option>
												<option value="9">其他</option>
											</s:else>
										</select>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">会审监管人</label>
									<div class="col-lg-9">
										<select class="form-control" name="addBidDto.PROJECT_AUTH" id="PROJECT_AUTH">
											<option value="" selected="selected">请选择</option>
										</select>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">代理费支付方</label>
									<div class="col-lg-9">
										<select class="form-control" name="addBidDto.BID_AGENT_PAY" id="BID_AGENT_PAY">
											<option value="" selected="selected">请选择</option>
											<s:if test='addBidDto.BID_AGENT_PAY == "1"'>
												<option value="1" selected="selected">委托单位</option>
												<option value="2">中标单位</option>
												<option value="3">申通集团</option>
												<option value="4">维保公司</option>
											</s:if>
											<s:elseif test='addBidDto.BID_AGENT_PAY == "2"'>
												<option value="1">委托单位</option>
												<option value="2" selected="selected">中标单位</option>
												<option value="3">申通集团</option>
												<option value="4">维保公司</option>
											</s:elseif>
											<s:elseif test='addBidDto.BID_AGENT_PAY == "3"'>
												<option value="1">委托单位</option>
												<option value="2">中标单位</option>
												<option value="3" selected="selected">申通集团</option>
												<option value="4">维保公司</option>
											</s:elseif>
											<s:elseif test='addBidDto.BID_AGENT_PAY == "4"'>
												<option value="1">委托单位</option>
												<option value="2">中标单位</option>
												<option value="3">申通集团</option>
												<option value="4" selected="selected">维保公司</option>
											</s:elseif>
											<s:else>
												<option value="1">委托单位</option>
												<option value="2">中标单位</option>
												<option value="3">申通集团</option>
												<option value="4">维保公司</option>
											</s:else>
										</select>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">代理费</label>
									<div class="col-lg-7">
										<s:textfield name="addBidDto.BID_AGENT_PRICE" id="BID_AGENT_PRICE" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
									</div>
									<label for="" class="col-lg-2 form-label">万元</label>
								</div>
								<div class="col-lg-12 form-group">
									<label class="col-lg-1 form-label">工程概况批文</label>
									<div class="col-lg-11">
										<textarea id="tmpPROJ_APPROVAL" class="form-control"><s:property value="addBidDto.PROJ_APPROVAL" /></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab2">
							<div class="row" style="margin-top: 20px;">
								<div class="col-lg-12 form-group">
									<label class="col-lg-1 form-label">报名日期</label>
									<div id="registeDateDiv" class="col-lg-9">
										<s:if test='addBidDto.REGISTE_ST_DATE1 != null'>
											<div class="row">
												<div class="col-lg-4">
													<div class="input-group date" data-provide="datepicker">
														<input type="text" name="registeStDate" value="<s:date name="addBidDto.REGISTE_ST_DATE1" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
												</div>
												<label for="" class="col-lg-1 form-label to">---</label>
												<div class="col-lg-4">
													<div class="input-group date" data-provide="datepicker">
														<input type="text" name="registeEdDate" value="<s:date name="addBidDto.REGISTE_ED_DATE1" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
												</div>
												<div class="col-lg-2">
													<a href="javascript:void(0);" onclick="adddate();">
														<img src="<%=request.getContextPath()%>/images/add.png" />
													</a>
													<a href="javascript:void(0);" onclick="deldate(this);">
														<img src="<%=request.getContextPath()%>/images/minus.png" />
													</a>
												</div>
											</div>
										</s:if>
										<s:else>
											<!-- 默认至少有一个日期 -->
											<div class="row">
												<div class="col-lg-4">
													<div class="input-group date" data-provide="datepicker">
														<input type="text" name="registeStDate" value="" class="form-control datepicker" readonly>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
												</div>
												<label for="" class="col-lg-1 form-label to">---</label>
												<div class="col-lg-4">
													<div class="input-group date" data-provide="datepicker">
														<input type="text" name="registeEdDate" value="" class="form-control datepicker" readonly>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
												</div>
												<div class="col-lg-2">
													<a href="javascript:void(0);" onclick="adddate();">
														<img src="<%=request.getContextPath()%>/images/add.png" />
													</a>
													<a href="javascript:void(0);" onclick="deldate(this);">
														<img src="<%=request.getContextPath()%>/images/minus.png" />
													</a>
												</div>
											</div>
										</s:else>
										<s:if test='addBidDto.REGISTE_ST_DATE2 != null'>
											<div class="row">
												<div class="col-lg-4">
													<div class="input-group date" data-provide="datepicker">
														<input type="text" name="registeStDate" value="<s:date name="addBidDto.REGISTE_ST_DATE2" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
												</div>
												<label for="" class="col-lg-1 form-label to">---</label>
												<div class="col-lg-4">
													<div class="input-group date" data-provide="datepicker">
														<input type="text" name="registeEdDate" value="<s:date name="addBidDto.REGISTE_ED_DATE2" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
												</div>
												<div class="col-lg-2">
													<a href="javascript:void(0);" onclick="adddate();">
														<img src="<%=request.getContextPath()%>/images/add.png" />
													</a>
													<a href="javascript:void(0);" onclick="deldate(this);">
														<img src="<%=request.getContextPath()%>/images/minus.png" />
													</a>
												</div>
											</div>
										</s:if>
										<s:if test='addBidDto.REGISTE_ST_DATE3 != null'>
											<div class="row">
												<div class="col-lg-4">
													<div class="input-group date" data-provide="datepicker">
														<input type="text" name="registeStDate" value="<s:date name="addBidDto.REGISTE_ST_DATE3" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
												</div>
												<label for="" class="col-lg-1 form-label to">---</label>
												<div class="col-lg-4">
													<div class="input-group date" data-provide="datepicker">
														<input type="text" name="registeEdDate" value="<s:date name="addBidDto.REGISTE_ED_DATE3" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
												</div>
												<div class="col-lg-2">
													<a href="javascript:void(0);" onclick="adddate();">
														<img src="<%=request.getContextPath()%>/images/add.png" />
													</a>
													<a href="javascript:void(0);" onclick="deldate(this);">
														<img src="<%=request.getContextPath()%>/images/minus.png" />
													</a>
												</div>
											</div>
										</s:if>
										<s:if test='addBidDto.REGISTE_ST_DATE4 != null'>
											<div class="row">
												<div class="col-lg-4">
													<div class="input-group date" data-provide="datepicker">
														<input type="text" name="registeStDate" value="<s:date name="addBidDto.REGISTE_ST_DATE4" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
												</div>
												<label for="" class="col-lg-1 form-label to">---</label>
												<div class="col-lg-4">
													<div class="input-group date" data-provide="datepicker">
														<input type="text" name="registeEdDate" value="<s:date name="addBidDto.REGISTE_ED_DATE4" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
												</div>
												<div class="col-lg-2">
													<a href="javascript:void(0);" onclick="adddate();">
														<img src="<%=request.getContextPath()%>/images/add.png" />
													</a>
													<a href="javascript:void(0);" onclick="deldate(this);">
														<img src="<%=request.getContextPath()%>/images/minus.png" />
													</a>
												</div>
											</div>
										</s:if>
										<s:if test='addBidDto.REGISTE_ST_DATE5 != null'>
											<div class="row">
												<div class="col-lg-4">
													<div class="input-group date" data-provide="datepicker">
														<input type="text" name="registeStDate" value="<s:date name="addBidDto.REGISTE_ST_DATE5" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
												</div>
												<label for="" class="col-lg-1 form-label to">---</label>
												<div class="col-lg-4">
													<div class="input-group date" data-provide="datepicker">
														<input type="text" name="registeEdDate" value="<s:date name="addBidDto.REGISTE_ED_DATE5" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
														<div class="input-group-addon">
															<span class="glyphicon glyphicon-th"></span>
														</div>
													</div>
												</div>
												<div class="col-lg-2">
													<a href="javascript:void(0);" onclick="adddate();">
														<img src="<%=request.getContextPath()%>/images/add.png" />
													</a>
													<a href="javascript:void(0);" onclick="deldate(this);">
														<img src="<%=request.getContextPath()%>/images/minus.png" />
													</a>
												</div>
											</div>
										</s:if>
									</div>
								</div>
								<div class="col-lg-12 form-group">
									<label class="col-lg-1 form-label">报名要求</label>
									<div class="col-lg-11">
										<textarea id="tmpAPPLY_REQUIRE" class="form-control"><s:property value="addBidDto.APPLY_REQUIRE" /></textarea>
									</div>
								</div>
								<div class="col-lg-12 form-group">
									<label class="col-lg-1 form-label">保证金</label>
									<div class="col-lg-10">
										<s:textfield name="addBidDto.BID_BOND" id="BID_BOND" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
									</div>
									<label class="col-lg-1 form-label">万元</label>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab3">
							<div class="row" style="margin-top: 20px;">
								<div class="btns">
									<ul>
										<li><a href="javascript:;" onclick="showAddBidComp();"><i class="fa fa-plus" aria-hidden="true"></i>新增</a></li>
										<li><a href="javascript:;" onclick="showUpdBidComp();"><i class="fa fa-edit" aria-hidden="true"></i>修改</a></li>
										<li><a href="javascript:;" onclick="delBidComp();"><i class="fa fa-trash" aria-hidden="true"></i>删除</a></li>
									</ul>
								</div>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th></th>
											<th style="display: none;"></th>
											<th>序号</th>
											<th>单位名称</th>
											<th>单位负责人</th>
											<th>负责人电话</th>
											<th>联系地址</th>
											<th>邮箱</th>
											<th colspan="3">报名内容</th>
										</tr>
									</thead>
									<tbody id="bidCompBody">
										<s:iterator id="listBidComp" value="listBidComp" status="st1">
											<tr>
												<td><input type="radio" name="bidCompRadio" value=""></td>
												<td style="display: none;">
													<input type="hidden" value="<s:property value="BID_CO_NO"/>"/>
													<input type="hidden" value="<s:property value="BID_CO_NAME"/>"/>
													<input type="hidden" value="<s:property value="BID_CO_MANAGER"/>"/>
													<input type="hidden" value="<s:property value="BID_CO_TEL"/>"/>
													<input type="hidden" value="<s:property value="BID_CO_ADD"/>"/>
													<input type="hidden" value="<s:property value="BID_CO_PS"/>"/>
													<input type="hidden" value="<s:property value="TAX_NO"/>"/>
													<input type="hidden" value="<s:property value="BID_CO_SEQ"/>"/>
												</td>
												<td><s:property value="%{#st1.index + 1}"/></td>
												<td><s:property value="BID_CO_NAME"/></td>
												<td><s:property value="BID_CO_MANAGER"/></td>
												<td><s:property value="BID_CO_TEL"/></td>
												<td><s:property value="BID_CO_ADD"/></td>
												<td><s:property value="BID_CO_PS"/></td>
												<td></td>
											</tr>
										</s:iterator>
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
											<input id="tmpTENDER_OPEN_DATE" value="<s:date name="addBidDto.TENDER_OPEN_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">开评标地点</label>
									<div class="col-lg-9">
										<s:textfield name="addBidDto.TENDER_OPEN_ADDRESS" id="TENDER_OPEN_ADDRESS" cssClass="form-control" maxlength="100" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">评审人</label>
									<div class="col-lg-9">
										<select class="form-control" id="BID_AUTH" name="addBidDto.BID_AUTH">
											<option value="" selected="selected">请选择</option>
											<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
												<option value="<s:property value="LOGIN_NAME"/>" <s:if test="%{addBidDto.BID_AUTH == LOGIN_NAME}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
											</s:iterator>
										</select>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">评标时间</label>
									<div class="col-lg-9">
										<div class="input-group date" data-provide="datepicker">
											<input id="tmpTENDER_VERIFY_DATE" value="<s:date name="addBidDto.TENDER_VERIFY_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">限价</label>
									<div class="col-lg-8">
										<s:textfield name="addBidDto.BID_LIMIT_PRICE" id="BID_LIMIT_PRICE" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
									</div>
									<label for="" class="col-lg-1 form-label">万元</label>
								</div>
							</div>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>序号</th>
										<th>公司名称</th>
										<th>投标价</th>
										<th>评审价</th>
										<th>中标与否</th>
										<th>中标价</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator id="listBidComp" value="listBidComp" status="st1">
										<tr>
											<td><s:property value="%{#st1.index + 1}"/></td>
											<td><s:property value="BID_CO_NAME"/></td>
											<td>
												<input name="tmpBidPrice" type="text" value="<s:property value="BID_PRICE"/>">
											</td>
											<td>
												<input name="tmpBidCheckPrice" type="text" value="<s:property value="BID_CHECK_PRICE"/>">
											</td>
											<td>
												<s:if test='%{BID_RESULT == "1"}'>
													<input type="checkbox" checked="checked" value="1" />
												</s:if>
												<s:else>
													<input type="checkbox" checked="checked" value="0" />
												</s:else>
											</td>
											<td>
												<input name="tmpBidWinPrice" type="text" value="<s:property value="BID_WIN_PRICE"/>">
											</td>
										</tr>
									</s:iterator>
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
								<thead>
									<tr>
										<th></th>
										<th>序号</th>
										<th>姓名</th>
										<th>就职公司</th>
										<th>专业</th>
										<th>职称</th>
										<th>联系方式</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator id="listExpertLib" value="listExpertLib" status="st1">
										<tr>
											<td><input type="radio" name="bidExpertLibRadio"></td>
											<td><s:property value="%{#st1.index + 1}"/></td>
											<td><s:property value="EXPERT_NAME"/></td>
											<td><s:property value="EXPERT_COMP"/></td>
											<td><s:property value="EXPERT_MAJOR"/></td>
											<td><s:property value="EXPERT_QULI"/></td>
											<td><s:property value="EXPERT_TEL1"/></td>
										</tr>
									</s:iterator>
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
								<thead>
									<tr>
										<th>序号</th>
										<th>公司名称</th>
										<th>保证金入账日期</th>
										<th>支付形式</th>
										<th>退保证金审批</th>
										<th>退定日期</th>
										<th>凭证上传</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator id="listBidComp" value="listBidComp" status="st1">
										<tr>
											<td><s:property value="%{#st1.index + 1}"/></td>
											<td><s:property value="BID_CO_NAME"/></td>
											<td>
												<s:date name="BID_VALUE_DATE" format="yyyy-MM-dd"/>
											</td>
											<td><s:property value="BID_PAYMENT_TYPE"/></td>
											<td><s:property value="REFOUND_BOND_STATUS"/></td>
											<td><s:date name="REFOUND_DEPOSIT_DATE" format="yyyy-MM-dd"/></td>
											<td>
												<a href="">上传</a><a href="">预览</a>
											</td>
										</tr>
									</s:iterator>
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
								<div class="col-lg-6">
									<s:textfield name="addBidDto.BID_APPLY_PRICE" id="BID_APPLY_PRICE" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
								</div>
							</div>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>序号</th>
										<th>公司名称</th>
										<th>标书费入账日期</th>
										<th>支付形式</th>
										<th>开票信息</th>
										<th>开票时间</th>
										<th>发票编号</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator id="listBidComp" value="listBidComp" status="st1">
										<tr>
											<td><s:property value="%{#st1.index + 1}"/></td>
											<td><s:property value="BID_CO_NAME"/></td>
											<td><s:date name="BID_APPLY_PRICE_DATE" format="yyyy-MM-dd"/></td>
											<td><s:property value="BID_PAYMENT_TYPE"/></td>
											<td><s:property value="INVOICE_TYPE"/></td>
											<td><s:date name="INVOICE_DATE" format="yyyy-MM-dd"/></td>
											<td><s:property value="BID_RECEIPT_NO"/></td>
										</tr>
									</s:iterator>
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
									<div class="col-lg-6">
										<input type="text" value="<s:property value="addBidDto.BID_BOND"/>" class="form-control" readonly="readonly">
									</div>
									<label for="" class="col-lg-2 form-label">万元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">承接项目日期</label>
									<div class="col-lg-8">
										<input type="text" value="<s:date name="addBidDto.PROJECT_DEVIEW_DATE" format="yyyy-MM-dd" />" class="form-control" readonly="readonly">
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">项目性质</label>
									<div class="col-lg-8">
										<s:if test='addBidDto.PROJECT_PROPERTY == "1"'>
											<input type="text" class="form-control" value="成本内" readonly="readonly">
										</s:if>
										<s:elseif test='addBidDto.PROJECT_PROPERTY == "2"'>
											<input type="text" class="form-control" value="成本外" readonly="readonly">
										</s:elseif>
										<s:elseif test='addBidDto.PROJECT_PROPERTY == "3"'>
											<input type="text" class="form-control" value="单独立项" readonly="readonly">
										</s:elseif>
										<s:elseif test='addBidDto.PROJECT_PROPERTY == "4"'>
											<input type="text" class="form-control" value="其他" readonly="readonly">
										</s:elseif>
										<s:else>
											<input type="text" class="form-control" value="" readonly="readonly">
										</s:else>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">会审监管人</label>
									<div class="col-lg-8">
										<input type="text" class="form-control" value="<s:property value="addBidDto.PROJECT_AUTH"/>" readonly="readonly">
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">代理费支付方</label>
									<div class="col-lg-8">
										<s:if test='addBidDto.BID_AGENT_PAY == "1"'>
											<input type="text" class="form-control" value="委托单位" readonly="readonly">
										</s:if>
										<s:elseif test='addBidDto.BID_AGENT_PAY == "2"'>
											<input type="text" class="form-control" value="中标单位" readonly="readonly">
										</s:elseif>
										<s:elseif test='addBidDto.BID_AGENT_PAY == "3"'>
											<input type="text" class="form-control" value="申通集团" readonly="readonly">
										</s:elseif>
										<s:elseif test='addBidDto.BID_AGENT_PAY == "4"'>
											<input type="text" class="form-control" value="维保公司" readonly="readonly">
										</s:elseif>
										<s:else>
											<input type="text" class="form-control" value="" readonly="readonly">
										</s:else>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">应收代理费</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" value="<s:property value="addBidDto.BID_AGENT_PRICE"/>" readonly="readonly"/>
									</div>
									<label for="" class="col-lg-2 form-label">万元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">中标单位</label>
									<div class="col-lg-8">
										<s:textfield name="addBidDto.BID_CO_NAME" id="BID_CO_NAME" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">开票日期</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="tmpRECEIPT1_DATE" value="<s:date name="addBidDto.RECEIPT1_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">实收代理费</label>
									<div class="col-lg-6">
										<s:textfield name="addBidDto.BID_AGENT_PRICE_ACT" id="BID_AGENT_PRICE_ACT" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
									</div>
									<label for="" class="col-lg-2 form-label">万元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">中标金额</label>
									<div class="col-lg-8">
										<s:textfield name="addBidDto.BID_PRICE" id="BID_PRICE" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">到账日期</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="tmpRECEIPT1_VALUE_DATE" value="<s:date name="addBidDto.RECEIPT1_VALUE_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
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
									<div class="col-lg-8">
										<s:textfield name="addBidDto.BID_EXPERT_COMMISION_PRE" id="BID_EXPERT_COMMISION_PRE" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
									</div>
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
									<div class="col-lg-8">
										<s:textfield name="addBidDto.BID_EXPERT_COMMISION_APPLY" id="BID_EXPERT_COMMISION_APPLY" cssClass="form-control" maxlength="6" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">实际费用</label>
									<div class="col-lg-8">
										<s:textfield name="addBidDto.BID_EXPERT_COMMISION_ACT" id="BID_EXPERT_COMMISION_ACT" cssClass="form-control" maxlength="14" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">差价退还日期</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="tmpBID_EXPERT_COMMISION_DIFF_DATE" value="<s:date name="addBidDto.BID_EXPERT_COMMISION_DIFF_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
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
	<!-- 模拟模态框 -->
	<div class="modal fade" id="bidCntrctModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 1000px;">
			<div class="modal-content">
				<form class="form-horizontal" role="form">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							合同一览
						</h4>
					</div>
					<div class="modal-body">
						<div class="col-lg-4 form-group">
							<label for="" class="col-lg-4 form-label">合同年份</label>
							<div class="col-lg-8">
								<div class="input-group">
									<input id="strCNTRCT_YEAR" maxlength="20" type="text" class="form-control">
								</div>
							</div>
						</div>
						<div class="col-lg-7 form-group">
							<label for="" class="col-lg-2 form-label">合同期限</label>
							<div class="col-lg-4">
								<div class="input-group date" data-provide="datepicker">
									<input id="strCNTRCT_ST_DATE" value="" maxlength="10" type="text" class="form-control datepicker" readonly>
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
							<label for="" class="col-lg-1 form-label to">---</label>
							<div class="col-lg-4">
								<div class="input-group date" data-provide="datepicker">
									<input id="strCNTRCT_ED_DATE" value="" maxlength="10" type="text" class="form-control datepicker" readonly>
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-2 form-group" style="z-index: 1;">
							<button type="button" class="btn btn-success form-control" onclick="querySelectPageAjax(0);">检索</button>
						</div>
					</div>
					<div class="modal-body" style="height: 430px;">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th></th>
									<th style="display: none;"></th>
									<th>合同年份</th>
									<th>合同编号</th>
									<th>委托单位</th>
								</tr>
							</thead>
							<tbody id="bidCntrctData">
								<tr>
									<td><input name="bidCntrctKey" type="radio" value=""/></td>
									<td style="display: none;">
										<input type="hidden" value="">
										<input type="hidden" value="">
										<input type="hidden" value="">
										<input type="hidden" value="">
										<input type="hidden" value="">
										<input type="hidden" value="">
										<input type="hidden" value="">
										<input type="hidden" value="">
										<input type="hidden" value="">
										<input type="hidden" value="">
									</td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
						<jsp:include page="../turning_select.jsp" flush="true" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="selectBidCntrct();">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="bidCompModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 700px;">
			<div class="modal-content">
				<form class="form-horizontal" role="form">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							投标单位输入
						</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-2 control-label">单位名称</label>
							<div class="col-sm-9">
								<input type="hidden" id="tmpBidCompId" class="form-control">
								<input type="hidden" id="tmpBidCompSeq" class="form-control">
								<input type="text" id="tmpBidCompName" class="form-control" maxlength="40" placeholder="请输入单位名称">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">单位负责人</label>
							<div class="col-sm-9">
								<input type="text" id="tmpBidCompManager" class="form-control" maxlength="8" placeholder="请输入单位负责人">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">负责人电话</label>
							<div class="col-sm-9">
								<input type="text"  id="tmpBidCompTel" class="form-control" maxlength="25" placeholder="请输入负责人电话">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-9">
								<input type="text"  id="tmpBidCompAddress" class="form-control" maxlength="40" placeholder="请输入联系地址">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-9">
								<input type="text"  id="tmpBidCompPs" class="form-control" maxlength="100" placeholder="请输入邮箱">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">开票信息</label>
							<div class="col-sm-9">
								<input type="text"  id="tmpBidCompTaxno" class="form-control" maxlength="20" placeholder="请输入开票信息">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="saveBidComp();">保存</button>
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
	$('.datepicker').parent().datepicker({
		"autoclose":true,"format":"yyyy-mm-dd","language":"zh-CN",clearBtn: true
	});
</script>
</body>
</html>
