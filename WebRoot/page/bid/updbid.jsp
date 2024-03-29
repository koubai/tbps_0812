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
<title>招标信息更新</title>
<style type="text/css">
 #searchresult
 {
  width: 500px;
  position: absolute;
  z-index: 1;
  overflow: hidden;
  left: 270px;
  top: 153px;
  background: #E0E0E0;
  border-top: none;
 }
 .line
 {
  font-size: 12px;
  background: #E0E0E0;
  width: 130px;
  padding: 2px;
 }
 .hover
 {
  background: #007ab8;
  width: 130px;
  color: #fff;
 }
 .std
 {
  width: 200px;
 }
</style>
<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/global.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/local.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
	$(function() {
		//////////////////////////////
		$("#tmpBidCompName").keyup(function (evt) {
			  ChangeCoords(); //控制查询结果div坐标
			  var k = window.event ? evt.keyCode : evt.which;
			  //输入框的id为txt_search，这里监听输入框的keyup事件
			  //不为空 && 不为上箭头或下箭头或回车
			  if ($("#tmpBidCompName").val() != "" && k != 38 && k != 40 && k != 13) {
				  $.ajax({
			    	type: 'POST',
			    	//async: false, //同步执行，不然会有问题
			    	dataType: "json",
			    	url: '<c:url value="/tbpsServlet.servlet"></c:url>' + '?compname=' + encodeURI($("#tmpBidCompName").val()) + "&&date" + new Date(), 			//提交的页面/方法名
			    	data: "{'compname':'" + encodeURI($("#tmpBidCompName").val()) + "'}",    	//参数（如果没有参数：null）
			    	contentType: "application/json; charset=utf-8",
			    	error: function (msg) {//请求失败处理函数
			     		alert("数据加载失败");
			    	},
			    	success: function (data) { //请求成功后处理函数。
			     		var objData = eval(data);
			     		if (objData.length > 0) {
			      			var layer = "";
			      			layer = "<table id='aa'>";
			      			$.each(objData, function (idx, item) {
			       				layer += "<tr class='line'><td class='std'>" + item.BID_CO_NAME + 
			       				"</td><td style='display:none'>^^</td><td >" + item.BID_CO_MANAGER + 
			       				"</td><td style='display:none'>^^</td><td style='display:none'>" + item.BID_CO_TEL + 
			       				"</td><td style='display:none'>^^</td><td style='display:none'>" + item.BID_CO_ADD + 
			       				"</td><td style='display:none'>^^</td><td style='display:none'>" + item.BID_CO_PS + 
			       				"</td><td style='display:none'>^^</td><td style='display:none'>" + item.BID_CO_PRO_MANAGER + 
			       				"</td><td style='display:none'>^^</td><td style='display:none'>" + item.BID_CO_PRO_TEL + 
			       				"</td><td style='display:none'>^^</td><td >" + item.BID_CO_ORGCODE + 
			       				"</td><td style='display:none'>^^</td><td style='display:none'>" + item.BID_CO_LANDLINE_TEL + 
			       				"</td><td style='display:none'>^^</td><td style='display:none'>" + item.BID_CO_FAX + 
			       				"</td><td style='display:none'>^^</td><td style='display:none'>" + item.BID_CO_LEGAL + 
			       				"</td><td style='display:none'>^^</td><td >" + item.BID_CO_FUND + "</td></tr>";			       				
			      			});
			      			layer += "</table>";
			     			//将结果添加到div中
			      			$("#searchresult").empty();
			      			$("#searchresult").append(layer);
			      			$(".line:first").addClass("hover");
			      			$("#searchresult").css("display", "");
			      			//鼠标移动事件
			      			$(".line").hover(function () {
			       				$(".line").removeClass("hover");
			       				$(this).addClass("hover");
			      			}, function () {
			       				$(this).removeClass("hover");
			       				//$("#searchresult").css("display", "none");
			      			});
			      			//鼠标点击事件
			      			$(".line").click(function () {
			       				$("#txt_search").val($(this).text());
			       				$("#searchresult").css("display", "none");
			       				splitRec($(this).text());
			      			});
			     		} else {
			      			$("#searchresult").empty();
			     			$("#searchresult").css("display", "none");
			     		}			     		
			    	}
			   });
			} else if (k == 38) {//上箭头
					$('#aa tr.hover').prev().addClass("hover");
					$('#aa tr.hover').next().removeClass("hover");
					$('#txt_search').val($('#aa tr.hover').text());
			} else if (k == 40) {//下箭头
				$('#aa tr.hover').next().addClass("hover");
				$('#aa tr.hover').prev().removeClass("hover");
				$('#txt_search').val($('#aa tr.hover').text());
			}
			else if (k == 13) {//回车
				$('#txt_search').val($('#aa tr.hover').text());
				$("#searchresult").empty();
				$("#searchresult").css("display", "none");
		//			$("#tmpBidCompName").val($('#txt_search').val());
					splitRec($('#txt_search').val());
			}
			else {
				$("#searchresult").empty();
				$("#searchresult").css("display", "none");
			}
		});
		$("#searchresult").bind("mouseleave", function () {
			$("#searchresult").empty();
			$("#searchresult").css("display", "none");
		});
	});
	
	function splitRec(recdata) {
		if (recdata !=""){
			temArryStr = recdata.split("^^");
			if (temArryStr[0]!= null && temArryStr[0]!="")
				$("#tmpBidCompName").val(temArryStr[0]);
			else
				$("#tmpBidCompName").val("");
			if (temArryStr[0]!= null && temArryStr[1]!="")
				$("#tmpBidCompManager").val(temArryStr[1]);
			else
				$("#tmpBidCompManager").val("");
			if (temArryStr[0]!= null && temArryStr[2]!="")
				$("#tmpBidCompTel").val(temArryStr[2]);
			else
				$("#tmpBidCompTel").val("");
			if (temArryStr[0]!= null && temArryStr[3]!="")
				$("#tmpBidCompAdd").val(temArryStr[3]);
			else
				$("#tmpBidCompAdd").val("");				
			if (temArryStr[0]!= null && temArryStr[4]!="")
				$("#tmpBidCompPs").val(temArryStr[4]);
			else
				$("#tmpBidCompPs").val("");
			if (temArryStr[0]!= null && temArryStr[5]!="")
				$("#tmpBidCompProManager").val(temArryStr[5]);
			else
				$("#tmpBidCompProManager").val("");
			if (temArryStr[0]!= null && temArryStr[6]!="")
				$("#tmpBidCompProTel").val(temArryStr[6]);
			else
				$("#tmpBidCompProTel").val("");
			if (temArryStr[0]!= null && temArryStr[7]!="")
				$("#tmpBidCompOrgCode").val(temArryStr[7]);
			else
				$("#tmpBidCompOrgCode").val("");
			if (temArryStr[0]!= null && temArryStr[8]!="")
				$("#tmpBidCompLandlineTel").val(temArryStr[8]);
			else
				$("#tmpBidCompLandlineTel").val("");
			if (temArryStr[0]!= null && temArryStr[9]!="")
				$("#tmpBidCompFax").val(temArryStr[9]);
			else
				$("#tmpBidCompFax").val("");
			if (temArryStr[0]!= null && temArryStr[10]!="")
				$("#tmpBidCompLegal").val(temArryStr[10]);
			else
				$("#tmpBidCompLegal").val("");
			if (temArryStr[0]!= null && temArryStr[11]!="")
				$("#tmpBidCompFund").val(temArryStr[11]);			
			else
				$("#tmpBidCompFund").val("");
		}
	}
	
	//设置查询结果div坐标
	function ChangeCoords() {
		var left = $("#tmpBidCompName").css("left");			//获取距离最左端的距离，像素，整型
		var top = $("#tmpBidCompName").css("top")+ 20; ; 		//获取距离最顶端的距离，像素，整型（20为搜索输入框的高度）
		$("#searchresult").css("left", left + "px"); 		//重新定义CSS属性
		$("#searchresult").css("top", top + "px"); 			//同上
	}


	function upd() {
		if(checkdata()) {
			for(var i = 1; i <= 8; i++) {
				var css = $("#tab" + i).prop("className");
				if(css.indexOf("active") >= 0) {
					$("#updBidTabIndex").val(i);
					break;
				}
			}
			
			if(confirm("确定修改吗？")) {
				$("#uploadFileName").val("");
				document.mainform.action = '<c:url value="/bid/updBidAction.action"></c:url>';
				document.mainform.submit();
			}
		}
	}
	
	function progress(bidNo) {
		$("#strBID_NO").val(bidNo);
//		alert(bidNo);
		document.mainform.action = '<c:url value="/bidprogress/showBidProgressAction.action"></c:url>';
		document.mainform.submit();
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
		//var BID_PRICE = $("#BID_PRICE").val();
		//#tab8
		var BID_EXPERT_COMMISION_PRE_YUAN = $("#BID_EXPERT_COMMISION_PRE_YUAN").val();
		var BID_EXPERT_COMMISION_ACT_YUAN = $("#BID_EXPERT_COMMISION_ACT_YUAN").val();
		var BID_EXPERT_COMMISION_PRE_YUAN1 = $("#BID_EXPERT_COMMISION_PRE_YUAN1").val();
		var BID_EXPERT_COMMISION_ACT_YUAN1 = $("#BID_EXPERT_COMMISION_ACT_YUAN1").val();
		var BID_EXPERT_COMMISION_PRE_YUAN2 = $("#BID_EXPERT_COMMISION_PRE_YUAN2").val();
		var BID_EXPERT_COMMISION_ACT_YUAN2 = $("#BID_EXPERT_COMMISION_ACT_YUAN2").val();
		var BID_EXPERT_COMMISION_PRE_YUAN3 = $("#BID_EXPERT_COMMISION_PRE_YUAN3").val();
		var BID_EXPERT_COMMISION_ACT_YUAN3 = $("#BID_EXPERT_COMMISION_ACT_YUAN3").val();
		
		if(CNTRCT_NO == "") {
			alert("请选择合同编号！");
			$("#CNTRCT_NO").focus();
			return false;
		}
		
		if(CNTRCT_TYPE == "3") {
			//分类=招标办，招标编号为自己输入
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
		
		/* if(IS_RANDOM == "0") {
			//非随机生成招标编号时
			//分类=比选,招标时，招标编号不能为空
			if(CNTRCT_TYPE == "1") {
				//验证招标编号格式是否正确
				if(!isZB(BID_NO)) {
					alert("招标编号格式不正确，应为：LHZB-YYYY-NNNNN或LHZB-YYYY-NNNNN-NN！");
					$("#BID_NO").focus();
					return false;
				}
			} else if(CNTRCT_TYPE == "2") {
				//验证招标编号格式是否正确
				if(!isBX(BID_NO)) {
					alert("招标编号格式不正确，应为：LHBX-YYYY-NNNN或LHBX-YYYY-NNNN-NN！");
					$("#BID_NO").focus();
					return false;
				}
			} else if(CNTRCT_TYPE == "4") {
				//验证招标编号格式是否正确
				if(!isJJ(BID_NO)) {
					alert("招标编号格式不正确，应为：LHJJ-YYYY-NNNN或LHJJ-YYYY-NNNN-NN！");
					$("#BID_NO").focus();
					return false;
				}
			}
		} */
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
				//showtab("2");
				//alert("报名开始时间不能为空！");
				//registeStDateList[i].focus();
				//return false;
			}
			if(registeStDateList[i].value != "") {
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
		if(BID_AGENT_PRICE != "" && !isReal(BID_AGENT_PRICE)) {
			showtab("4");
			alert("代理费格式不正确！");
			$("#BID_AGENT_PRICE").focus();
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
		
		//开评标
		var tmpBID_CO_NO1 = $("[name='tmpBID_CO_NO1']");
		var tmpBidPrice = $("[name='tmpBidPrice']");
		var tmpBidCheckPrice = $("[name='tmpBidCheckPrice']");
		//是否中标
		var tmpBID_RESULT = $("input[name^='tmpBID_RESULT_']");
		var tmpBidWinPrice = $("[name='tmpBidWinPrice']");
		//开评标
		if(tmpBID_CO_NO1 != null && tmpBID_CO_NO1.length > 0) {
			for(var j = 0; j< tmpBID_CO_NO1.length; j++) {
				if(tmpBidPrice[j].value != "" && !isReal(tmpBidPrice[j].value)) {
					showtab("4");
					alert("投标价格式不正确！");
					tmpBidPrice[j].focus();
					return false;
				}
				if(tmpBidCheckPrice[j].value != "" && !isReal(tmpBidCheckPrice[j].value)) {
					showtab("4");
					alert("评审价格式不正确！");
					tmpBidCheckPrice[j].focus();
					return false;
				}
				if(tmpBID_RESULT[j].checked) {
					//中标checkbox选中后，中标价格不能为空
					if(tmpBidWinPrice[j].value == "") {
						showtab("4");
						alert("中标价不能为空！");
						tmpBidWinPrice[j].focus();
						return false;
					}
				}
				if(tmpBidWinPrice[j].value != "" && !isReal(tmpBidWinPrice[j].value)) {
					showtab("4");
					alert("中标价格式不正确！");
					tmpBidWinPrice[j].focus();
					return false;
				}
			}
		}
		
		//保证金
		var tmpBID_CO_NO2 = $("[name='tmpBID_CO_NO2']");
		var tmpBID_VALUE_DATE = $("[name='tmpBID_VALUE_DATE']");
		var tmpBID_PAYMENT_TYPE = $("[name='tmpBID_PAYMENT_TYPE']");
		var tmpREFOUND_BOND_STATUS = $("[name='tmpREFOUND_BOND_STATUS']");
		var tmpREFOUND_DEPOSIT_DATE = $("[name='tmpREFOUND_DEPOSIT_DATE']");
		var tmpRECEPT_UL_FILE1 = $("[name='tmpRECEPT_UL_FILE1']");
		var tmpRECEPT_UL_FILE1_BASENAME = $("[name='tmpRECEPT_UL_FILE1_BASENAME']");
		
		//标书费
		var tmpBID_CO_NO3 = $("[name='tmpBID_CO_NO3']");
		var tmpBID_APPLY_PRICE_DATE = $("[name='tmpBID_APPLY_PRICE_DATE']");
		var tmpBID_APPLY_PAYMENT_TYPE = $("[name='tmpBID_APPLY_PAYMENT_TYPE']");
		var tmpINVOICE_TYPE = $("[name='tmpINVOICE_TYPE']");
		var tmpINVOICE_DATE = $("[name='tmpINVOICE_DATE']");
		var tmpBID_RECEIPT_NO = $("[name='tmpBID_RECEIPT_NO']");
		
		
		setBidTableValue();
		
		if(BID_EXPERT_COMMISION_PRE_YUAN != "" && !isReal(BID_EXPERT_COMMISION_PRE_YUAN)) {
			showtab("8");
			alert("预借费用格式不正确！");
			$("#BID_EXPERT_COMMISION_PRE_YUAN").focus();
			return false;
		}
		if(BID_EXPERT_COMMISION_ACT_YUAN != "" && !isReal(BID_EXPERT_COMMISION_ACT_YUAN)) {
			showtab("8");
			alert("实际费用格式不正确！");
			$("#BID_EXPERT_COMMISION_ACT_YUAN").focus();
			return false;
		}
		if(BID_EXPERT_COMMISION_PRE_YUAN1 != "" && !isReal(BID_EXPERT_COMMISION_PRE_YUAN1)) {
			showtab("8");
			alert("预借费用1格式不正确！");
			$("#BID_EXPERT_COMMISION_PRE_YUAN1").focus();
			return false;
		}
		if(BID_EXPERT_COMMISION_ACT_YUAN1 != "" && !isReal(BID_EXPERT_COMMISION_ACT_YUAN1)) {
			showtab("8");
			alert("实际费用1格式不正确！");
			$("#BID_EXPERT_COMMISION_ACT_YUAN1").focus();
			return false;
		}
		if(BID_EXPERT_COMMISION_PRE_YUAN2 != "" && !isReal(BID_EXPERT_COMMISION_PRE_YUAN2)) {
			showtab("8");
			alert("预借费用2格式不正确！");
			$("#BID_EXPERT_COMMISION_PRE_YUAN2").focus();
			return false;
		}
		if(BID_EXPERT_COMMISION_ACT_YUAN2 != "" && !isReal(BID_EXPERT_COMMISION_ACT_YUAN2)) {
			showtab("8");
			alert("实际费用2格式不正确！");
			$("#BID_EXPERT_COMMISION_ACT_YUAN2").focus();
			return false;
		}
		if(BID_EXPERT_COMMISION_PRE_YUAN3 != "" && !isReal(BID_EXPERT_COMMISION_PRE_YUAN3)) {
			showtab("8");
			alert("预借费用3格式不正确！");
			$("#BID_EXPERT_COMMISION_PRE_YUAN3").focus();
			return false;
		}
		if(BID_EXPERT_COMMISION_ACT_YUAN3 != "" && !isReal(BID_EXPERT_COMMISION_ACT_YUAN3)) {
			showtab("8");
			alert("实际费用3格式不正确！");
			$("#BID_EXPERT_COMMISION_ACT_YUAN3").focus();
			return false;
		}
		return true;
	}
	
	function setBidTableValue() {
		//招标公司
		$("#bidCompListTable").empty();
		var rows = document.getElementById("bidCompBody").rows;
		
		//开评标
		var tmpBID_CO_NO1 = $("[name='tmpBID_CO_NO1']");
		var tmpBidPrice = $("[name='tmpBidPrice']");
		var tmpBidCheckPrice = $("[name='tmpBidCheckPrice']");
		//是否中标
		var tmpBID_RESULT = $("input[name^='tmpBID_RESULT_']");
		var tmpBidWinPrice = $("[name='tmpBidWinPrice']");
		
		//保证金
		var tmpBID_CO_NO2 = $("[name='tmpBID_CO_NO2']");
		var tmpBID_VALUE_DATE = $("[name='tmpBID_VALUE_DATE']");
		var tmpBID_PAYMENT_TYPE = $("[name='tmpBID_PAYMENT_TYPE']");
		var tmpREFOUND_BOND_STATUS = $("[name='tmpREFOUND_BOND_STATUS']");
		var tmpREFOUND_DEPOSIT_DATE = $("[name='tmpREFOUND_DEPOSIT_DATE']");
		var tmpRECEPT_UL_FILE1 = $("[name='tmpRECEPT_UL_FILE1']");
		var tmpRECEPT_UL_FILE1_BASENAME = $("[name='tmpRECEPT_UL_FILE1_BASENAME']");
		
		//标书费
		var tmpBID_CO_NO3 = $("[name='tmpBID_CO_NO3']");
		var tmpBID_APPLY_PRICE_DATE = $("[name='tmpBID_APPLY_PRICE_DATE']");
		var tmpBID_APPLY_PAYMENT_TYPE = $("[name='tmpBID_APPLY_PAYMENT_TYPE']");
		var tmpINVOICE_TYPE = $("[name='tmpINVOICE_TYPE']");
		var tmpINVOICE_DATE = $("[name='tmpINVOICE_DATE']");
		var tmpBID_RECEIPT_NO = $("[name='tmpBID_RECEIPT_NO']");
			
		for(var i = 0; i < rows.length; i++) {
			var childs = rows[i].cells[1].getElementsByTagName("input");
			var BID_CO_NO = childs[0].value;
			var BID_CO_NAME = childs[1].value;
			var BID_CO_MANAGER = childs[2].value;
			var BID_CO_TEL = childs[3].value;
			var BID_CO_ADD = childs[4].value;
			var BID_CO_PS = childs[5].value;
			var TAX_NO = childs[6].value;
			var tmpBidCompApply = childs[8].value;
			var tmpSaveBidCompApply = childs[9].value;
			var BID_CO_SEQ = rows[i].cells[2].innerHTML;
			
			var BID_CO_LEGAL = childs[10].value;
			var BID_CO_ORGCODE = childs[11].value;
			var BID_CO_PRO_TEL = childs[12].value;
			var BID_CO_PRO_MANAGER = childs[13].value;
			
			var BID_CO_LANDLINE_TEL = childs[14].value;
			var BID_CO_FAX = childs[15].value;
			var BID_CO_FUND = childs[16].value;
			
			var tr = document.createElement("tr");
			var td = document.createElement("td");
			
			//开评标
			if(tmpBID_CO_NO1 != null && tmpBID_CO_NO1.length > 0) {
				for(var j = 0; j< tmpBID_CO_NO1.length; j++) {
					if(tmpBID_CO_NO1[j].value == BID_CO_NO) {
						if(tmpBidPrice[j].value != "") {
							td.appendChild(createInput("listBidCompTmp[" + i + "].BID_PRICE", parseFloat(tmpBidPrice[j].value)));
						}
						if(tmpBidCheckPrice[j].value != "") {
							td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CHECK_PRICE", parseFloat(tmpBidCheckPrice[j].value)));
						}
						if(tmpBID_RESULT[j].checked) {
							td.appendChild(createInput("listBidCompTmp[" + i + "].BID_RESULT", "1"));
						} else {
							td.appendChild(createInput("listBidCompTmp[" + i + "].BID_RESULT", "0"));
						}
						if(tmpBidWinPrice[j].value != "") {
							td.appendChild(createInput("listBidCompTmp[" + i + "].BID_WIN_PRICE", parseFloat(tmpBidWinPrice[j].value)));
						}
						break;
					}
				}
			}
			//保证金
			if(tmpBID_CO_NO2 != null && tmpBID_CO_NO2.length > 0) {
				for(var j = 0; j< tmpBID_CO_NO2.length; j++) {
					if(tmpBID_CO_NO2[j].value == BID_CO_NO) {
						if(tmpBID_VALUE_DATE[j].value != "") {
							td.appendChild(createInput("listBidCompTmp[" + i + "].BID_VALUE_DATE", tmpBID_VALUE_DATE[j].value));
						}
						td.appendChild(createInput("listBidCompTmp[" + i + "].BID_PAYMENT_TYPE", tmpBID_PAYMENT_TYPE[j].value));
						td.appendChild(createInput("listBidCompTmp[" + i + "].REFOUND_BOND_STATUS", tmpREFOUND_BOND_STATUS[j].value));
						if(tmpREFOUND_DEPOSIT_DATE[j].value != "") {
							td.appendChild(createInput("listBidCompTmp[" + i + "].REFOUND_DEPOSIT_DATE", tmpREFOUND_DEPOSIT_DATE[j].value));
						}
						td.appendChild(createInput("listBidCompTmp[" + i + "].RECEPT_UL_FILE1", tmpRECEPT_UL_FILE1[j].value));
						td.appendChild(createInput("listBidCompTmp[" + i + "].RECEPT_UL_FILE1_BASENAME", tmpRECEPT_UL_FILE1_BASENAME[j].value));
						break;
					}
				}
			}
			//标书费
			if(tmpBID_CO_NO3 != null && tmpBID_CO_NO3.length > 0) {
				for(var j = 0; j< tmpBID_CO_NO3.length; j++) {
					if(tmpBID_CO_NO3[j].value == BID_CO_NO) {
						if(tmpBID_APPLY_PRICE_DATE[j].value != "") {
							td.appendChild(createInput("listBidCompTmp[" + i + "].BID_APPLY_PRICE_DATE", tmpBID_APPLY_PRICE_DATE[j].value));
						}
						td.appendChild(createInput("listBidCompTmp[" + i + "].BID_APPLY_PAYMENT_TYPE", tmpBID_APPLY_PAYMENT_TYPE[j].value));
						td.appendChild(createInput("listBidCompTmp[" + i + "].INVOICE_TYPE", tmpINVOICE_TYPE[j].value));
						if(tmpINVOICE_DATE[j].value != "") {
							td.appendChild(createInput("listBidCompTmp[" + i + "].INVOICE_DATE", tmpINVOICE_DATE[j].value));
						}
						td.appendChild(createInput("listBidCompTmp[" + i + "].BID_RECEIPT_NO", tmpBID_RECEIPT_NO[j].value));
						break;
					}
				}
			}
			
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_NO", BID_CO_NO));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_NAME", BID_CO_NAME));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_MANAGER", BID_CO_MANAGER));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_TEL", BID_CO_TEL));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_ADD", BID_CO_ADD));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_PS", BID_CO_PS));
			td.appendChild(createInput("listBidCompTmp[" + i + "].TAX_NO", TAX_NO));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_SEQ", BID_CO_SEQ));
			td.appendChild(createInput("listBidCompTmp[" + i + "].saveBidCompApply", tmpSaveBidCompApply));
			td.appendChild(createInput("listBidCompTmp[" + i + "].showBidCompApply", tmpBidCompApply));
			
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_LEGAL", BID_CO_LEGAL));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_ORGCODE", BID_CO_ORGCODE));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_PRO_TEL", BID_CO_PRO_TEL));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_PRO_MANAGER", BID_CO_PRO_MANAGER));
			
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_LANDLINE_TEL", BID_CO_LANDLINE_TEL));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_FAX", BID_CO_FAX));
			td.appendChild(createInput("listBidCompTmp[" + i + "].BID_CO_FUND", BID_CO_FUND));
			
			tr.appendChild(td);
			document.getElementById("bidCompListTable").appendChild(tr);

		}
		
		//专家列表
		$("#expertLibListTable").empty();
		var rows = document.getElementById("bidExpertLibBody").rows;
		for(var i = 0; i < rows.length; i++) {
			var childs = rows[i].cells[1].getElementsByTagName("input");
			var EXPERT_SEQ = childs[0].value;
			var EXPERT_NAME = childs[1].value;
			var EXPERT_COMP = childs[2].value;
			var EXPERT_MAJOR = childs[3].value;
			var EXPERT_MAJOR_NAME = childs[4].value;
			var EXPERT_QULI = childs[5].value;
			var EXPERT_TEL1 = childs[6].value;
			
			var tr = document.createElement("tr");
			var td = document.createElement("td");
			
			td.appendChild(createInput("listExpertLibTmp[" + i + "].EXPERT_SEQ", EXPERT_SEQ));
			td.appendChild(createInput("listExpertLibTmp[" + i + "].EXPERT_NAME", EXPERT_NAME));
			td.appendChild(createInput("listExpertLibTmp[" + i + "].EXPERT_COMP", EXPERT_COMP));
			td.appendChild(createInput("listExpertLibTmp[" + i + "].EXPERT_MAJOR", EXPERT_MAJOR));
			td.appendChild(createInput("listExpertLibTmp[" + i + "].EXPERT_MAJOR_NAME", EXPERT_MAJOR_NAME));
			td.appendChild(createInput("listExpertLibTmp[" + i + "].EXPERT_QULI", EXPERT_QULI));
			td.appendChild(createInput("listExpertLibTmp[" + i + "].EXPERT_TEL1", EXPERT_TEL1));
			
			tr.appendChild(td);
			document.getElementById("expertLibListTable").appendChild(tr);
		}
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
		$("#PROJECT_MANAGER").val($("#tmpPROJECT_MANAGER").val());
		
		$("#PROJECT_DEVIEW_DATE").val($("#tmpPROJECT_DEVIEW_DATE").val());
		$("#PROJ_APPROVAL").attr("value", $("#tmpPROJ_APPROVAL").val());
		$("#APPLY_REQUIRE").attr("value", $("#tmpAPPLY_REQUIRE").val());
		$("#TENDER_OPEN_DATE").attr("value", $("#tmpTENDER_OPEN_DATE").val());
		$("#TENDER_VERIFY_DATE").attr("value", $("#tmpTENDER_VERIFY_DATE").val());
		
		$("#RECEIPT1_DATE").attr("value", $("#tmpRECEIPT1_DATE").val());
		$("#RECEIPT1_VALUE_DATE").attr("value", $("#tmpRECEIPT1_VALUE_DATE").val());
		$("#BID_EXPERT_COMMISION_APPLY_DATE").attr("value", $("#tmpBID_EXPERT_COMMISION_PRE_DATE1").val());		
		$("#BID_EXPERT_COMMISION_DIFF_DATE").attr("value", $("#tmpBID_EXPERT_COMMISION_DIFF_DATE1").val());
		$("#BID_EXPERT_COMMISION_DIFF_DATE1").attr("value", $("#tmpBID_EXPERT_COMMISION_DIFF_DATE1").val());
		$("#BID_EXPERT_COMMISION_DIFF_DATE2").attr("value", $("#tmpBID_EXPERT_COMMISION_DIFF_DATE2").val());
		$("#BID_EXPERT_COMMISION_DIFF_DATE3").attr("value", $("#tmpBID_EXPERT_COMMISION_DIFF_DATE3").val());
		$("#BID_EXPERT_COMMISION_PRE_DATE").attr("value", $("#tmpBID_EXPERT_COMMISION_PRE_DATE1").val());
		$("#BID_EXPERT_COMMISION_PRE_DATE1").attr("value", $("#tmpBID_EXPERT_COMMISION_PRE_DATE1").val());		
		$("#BID_EXPERT_COMMISION_PRE_DATE2").attr("value", $("#tmpBID_EXPERT_COMMISION_PRE_DATE2").val());
		$("#BID_EXPERT_COMMISION_PRE_DATE3").attr("value", $("#tmpBID_EXPERT_COMMISION_PRE_DATE3").val());
		
		//默认0
		/* if($("#BID_AGENT_PRICE").val() == "") {
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
		if($("#BID_PRICE").val() == "") {
			$("#BID_PRICE").val("0");
		}
		if($("#BID_EXPERT_COMMISION_PRE_YUAN").val() == "") {
			$("#BID_EXPERT_COMMISION_PRE_YUAN").val("0");
		}
		if($("#BID_EXPERT_COMMISION_ACT_YUAN").val() == "") {
			$("#BID_EXPERT_COMMISION_ACT_YUAN").val("0");
		}
		if($("#BID_APPLY_PRICE").val() == "") {
			$("#BID_APPLY_PRICE").val("0");
		} */
		/* if($("#BID_EXPERT_COMMISION").val() == "") {
			$("#BID_EXPERT_COMMISION").val("0");
		} */
		/* if($("#BID_CO_PRICE").val() == "") {
			$("#BID_CO_PRICE").val("0");
		} */
		/* if($("#BID_WIN_PRICE").val() == "") {
			$("#BID_WIN_PRICE").val("0");
		} */
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
	
	//专家删除
	function delExpertLib() {
		var obj = null;
		var bidExpertLibRadioList = document.getElementsByName("bidExpertLibRadio");
		for(var j = 0; j < bidExpertLibRadioList.length; j++) {
			if(bidExpertLibRadioList[j].checked) {
				obj = bidExpertLibRadioList[j];
				if(confirm("确定删除吗?")) {
					var tr = bidExpertLibRadioList[j].parentNode.parentNode;
					var tbody = bidExpertLibRadioList[j].parentNode.parentNode.parentNode;
					tbody.removeChild(tr);
					
					//obj.parentNode.parentNode.remove();
					//刷新列表顺序
					var rows = document.getElementById("bidExpertLibBody").rows;
					for(var i = 0; i < rows.length; i++) {
						var num = i + 1;
						rows[i].cells[2].innerHTML = num;
					}
				}
				break;
			}
		}
		if(obj == null) {
			alert("请选择一条记录！");
		}
	}
	
	//显示专家选择
	function showSelectExpertLib() {
		$("#strExpertName").val("");
		$("#strExpertComp").val("");
		$("#include").attr("disabled", false);
		$("#strExpertComp").attr("disabled", false);
		$("#strExpertName").attr("disabled", false);
		$("#selectExpertCompBtn").attr("disabled", false);
		document.getElementById("exportrandom").checked = false;
		document.getElementById("include").checked = false;
		
		$("#expertLibData").empty();
		
		disabledMajor("11", true);
		disabledMajor("12", false);
		disabledMajor("13", false);
		disabledMajor("14", false);
		disabledMajor("21", true);
		disabledMajor("22", false);
		disabledMajor("23", false);
		disabledMajor("24", false);
		disabledMajor("31", true);
		disabledMajor("32", false);
		disabledMajor("33", false);
		disabledMajor("34", false);
		disabledMajor("41", true);
		disabledMajor("42", false);
		disabledMajor("43", false);
		disabledMajor("44", false);
		disabledMajor("51", true);
		disabledMajor("52", false);
		disabledMajor("53", false);
		disabledMajor("54", false);
		
		//queryExpertAjax();
		$("#expertLibData").empty();
		
		//禁用 Bootstrap 模态框(Modal) 点击空白时自动关闭
		$('#expertLibModal').modal({backdrop: 'static', keyboard: false});
		$('#expertLibModal').modal('show');
	}
	
	function disabledMajor(id, isFirst) {
		$("#tmpMajor" + id).val("");
		if(!isFirst) {
			//非一级专业，需要disabled
			$("#tmpMajor" + id).attr("disabled", true);
		}
		$("#tmpMajorNum" + id).val("");
		$("#tmpMajorNum" + id).attr("disabled", true);
	}
	
	/**
	 * 注：翻页函数，每个列表选择模态窗体必须实现这个函数
	 */
	function queryExpertAjax() {
		var majorQuery = "";
		//是否随机
		if(document.getElementById("exportrandom").checked) {
			//数据验证
			//这里最多只有5行数据
			for(var i = 1; i <= 5; i++) {
				//专家1-4，这里只check所选择最小专业的专家数量是否填写。对于父节点数量可不填
				var check = false;
				for(var j = 4; j >= 1; j--) {
					var vv = $("#" + "tmpMajor" + i + j).val();
					if(vv != "") {
						var num = $("#" + "tmpMajorNum" + i + j).val();
						if(num == "" && !check) {
							$("#" + "tmpMajorNum" + i + j).focus();
							alert("请输入专家个数！");
							return;
						}
						if(num != "" && !isNumber(num)) {
							$("#" + "tmpMajorNum" + i + j).focus();
							alert("专家个数必须为大于0的数字！");
							return;
						}
						check = true;
					} else {
					}
				}
			}
		} else {
			//不随机
		}
		//查询参数
		for(var i = 1; i <= 5; i++) {
			for(var j = 1; j <= 4; j++) {
				var vv = $("#" + "tmpMajor" + i + j).val();
				if(vv != "") {
					var num = $("#" + "tmpMajorNum" + i + j).val();
					$("#" + "majorNum" + i + j).val(num);
					if(num == "") {
						majorQuery += vv + "#" + "0" + ",";
					} else {
						majorQuery += vv + "#" + num + ",";
					}
					$("#" + "strMajor" + i + j).val(vv);
				} else {
					$("#" + "majorNum" + i + j).val("");
					$("#" + "strMajor" + i + j).val(vv);
				}
			}
		}
		
		if(document.getElementById("exportrandom").checked) {
			//随机时，专业条件不能为空
			if(majorQuery == "") {
				alert("请选择专业条件！");
				return;
			}
		}
		$("#expertMajorQuery").attr("value", majorQuery);
		
		//各个模块自己的参数
		var strExpertName = $("#strExpertName").val();
		var expertMajorQuery = $("#expertMajorQuery").val();
		if(document.getElementById("exportrandom").checked) {
			$("#strIsRandom").attr("value", "1");
		} else {
			$("#strIsRandom").attr("value", "0");
		}
		if(document.getElementById("include").checked) {
			$("#strIsInclude").attr("value", "1");
		} else {
			$("#strIsInclude").attr("value", "0");
		}
		var strIsRandom = $("#strIsRandom").val();
		var strIsInclude = $("#strIsInclude").val();
		var strExpertComp = $("#strExpertComp").val();
		var param = new Object();
		param.strExpertName = encodeURI(strExpertName,"utf-8");
		param.expertMajorQuery = encodeURI(expertMajorQuery,"utf-8");
		param.strExpertComp = encodeURI(strExpertComp,"utf-8");
		param.strIsRandom = strIsRandom;
		param.strIsInclude = strIsInclude;
		
		$.getJSON('<%=request.getContextPath()%>/expertlib/queryAllExpertLibAjax.action', param, function(data) {
			if(data.resultCode == 0) {
				var items = data.data;
				//数据列表
				$("#expertLibData").empty();
				$.each(items, function(i, n) {
					var html = "";
					html += '<tr onclick="checkCheckboxTr(this, event);">';
					html += '	<td><input name="expertLibKey" type="checkbox" value=""/></td>';
					html += '	<td style="display: none;">';
					html += '		<input type="hidden" value="' + n.EXPERT_SEQ + '">';
					html += '		<input type="hidden" value="' + n.EXPERT_NAME + '">';
					html += '		<input type="hidden" value="' + n.EXPERT_COMP + '">';
					html += '		<input type="hidden" value="' + n.EXPERT_MAJOR + '">';
					html += '		<input type="hidden" value="' + n.EXPERT_MAJOR_NAME + '">';
					html += '		<input type="hidden" value="' + n.EXPERT_QULI + '">';
					html += '		<input type="hidden" value="' + n.EXPERT_TEL1 + '">';
					html += '	</td>';
					html += '	<td>' + n.EXPERT_NAME + '</td>';
					html += '	<td>' + n.EXPERT_MAJOR_NAME + '</td>';
					html += '	<td>' + n.EXPERT_QULI + '</td>';
					html += '	<td>' + n.EXPERT_TEL1 + '</td>';
					if(n.EXPERT_GENDER == "1") {
						html += '	<td>' + '男' + '</td>';
					} else {
						html += '	<td>' + '女' + '</td>';
					}
					html += '	<td>' + n.EXPERT_COMP + '</td>';
					html += '</tr>';
					$("#expertLibData").append(html);
				});
				var btn = '<tr>';
				btn += '<td colspan="8">';
				btn += '<button type="button" class="btn btn-primary" onclick="selectExpertLib();">确定</button>';
				btn += '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>';
				btn += '</td>';
				btn += '</tr>';
				$("#expertLibData").append(btn);
			} else {
				alert(data.resultMessage);
			}
		});
	}
	
	//专家列表页选择确定按钮
	function selectExpertLib() {
		var obj = null;
		var list = document.getElementsByName("expertLibKey");
		if(list.length == 0) {
			alert("专家为空，请重新查询！");
			return;
		}
		
		var expertLib = false;
		for(var i = 0; i < list.length; i++) {
			//是否随机
			if(!document.getElementById("exportrandom").checked) {
				//非随机
				if(list[i].checked) {
					expertLib = true;
					break;
				}
			}
		}
		if(!document.getElementById("exportrandom").checked && !expertLib) {
			alert("请选择专家!");
			return;
		}
		
		var oldexpertlist = ",";
		//是否随机
		if(document.getElementById("exportrandom").checked) {
			//清空原来的专家数据----非随机则不清空
			$("#bidExpertLibBody").empty();
		} else {
			var rows = document.getElementById("bidExpertLibBody").rows;
			for(var i = 0; i < rows.length; i++) {
				var childs = rows[i].cells[1].getElementsByTagName("input");
				var EXPERT_SEQ = childs[0].value;
				oldexpertlist += EXPERT_SEQ + ",";
			}
		}
		
		for(var i = 0; i < list.length; i++) {
			//是否随机
			if(document.getElementById("exportrandom").checked) {
				//随机
				selectExpertlibToList(list[i], "");
			} else {
				//非随机
				if(list[i].checked) {
					selectExpertlibToList(list[i], oldexpertlist);
					expertLib = true;
				}
			}
		}
		//刷新列表序号
		var rows = document.getElementById("bidExpertLibBody").rows;
		for(var i = 0; i < rows.length; i++) {
			var num = i + 1;
			rows[i].cells[2].innerHTML = num;
		}
		
		//隐藏模态窗体
		$('#expertLibModal').modal('hide');
	}
	
	function selectExpertlibToList(obj, oldexpertlist) {
		var tr = obj.parentNode.parentNode;
		var tds = tr.getElementsByTagName("td");
		//第二列是隐藏列
		var inputs = tds[1].getElementsByTagName("input");
		var EXPERT_SEQ = inputs[0].value;
		var EXPERT_NAME = inputs[1].value;
		var EXPERT_COMP = inputs[2].value;
		var EXPERT_MAJOR = inputs[3].value;
		var EXPERT_MAJOR_NAME = inputs[4].value;
		var EXPERT_QULI = inputs[5].value;
		var EXPERT_TEL1 = inputs[6].value;
		
		//专家已存在，不添加专家
		if(oldexpertlist.indexOf("," + EXPERT_SEQ + ",") >= 0) {
			return;
		}
		
		//新增
		var bidExpertLibBody = document.getElementById("bidExpertLibBody");
		//验证专家是否存在
		var bidExpertLibRadioList = document.getElementsByName("bidExpertLibRadio");
		for(var j = 0; j < bidExpertLibRadioList.length; j++) {
			if(bidExpertLibRadioList[j].value == EXPERT_SEQ) {
				alert("该专家已存在！");
				return;
			}
		}
		var tr = document.createElement("tr");
		
		var td0 = document.createElement("td");
		//单选框
		var radio = document.createElement("input");
		radio.name = "bidExpertLibRadio";
		radio.type = "radio";
		radio.value = EXPERT_SEQ;
		td0.appendChild(radio);
		tr.appendChild(td0);
		
		var td1 = document.createElement("td");
		td1.style.display = "none";
		//EXPERT_SEQ
		var input = createHidden(EXPERT_SEQ);
		td1.appendChild(input);
		//EXPERT_NAME
		var input = createHidden(EXPERT_NAME);
		td1.appendChild(input);
		//EXPERT_COMP
		var input = createHidden(EXPERT_COMP);
		td1.appendChild(input);
		//EXPERT_MAJOR
		var input = createHidden(EXPERT_MAJOR);
		td1.appendChild(input);
		//EXPERT_MAJOR_NAME
		var input = createHidden(EXPERT_MAJOR_NAME);
		td1.appendChild(input);
		//EXPERT_QULI
		var input = createHidden(EXPERT_QULI);
		td1.appendChild(input);
		//EXPERT_TEL1
		var input = createHidden(EXPERT_TEL1);
		td1.appendChild(input);
		tr.appendChild(td1);
		
		//序号
		tr.appendChild(createTd(""));
		//姓名
		tr.appendChild(createTd(EXPERT_NAME));
		//就职公司
		tr.appendChild(createTd(EXPERT_COMP));
		//专业
		tr.appendChild(createTd(EXPERT_MAJOR_NAME));
		//职称
		tr.appendChild(createTd(EXPERT_QULI));
		//联系方式
		tr.appendChild(createTd(EXPERT_TEL1));
		
		bidExpertLibBody.appendChild(tr);
	}
	
	function checkMajor(obj) {
		var v = obj.value;
		if($("#strIsRandom").val() == "1") {
			if(obj.checked) {
				$("#" + "tmpmajornum" + v).attr("disabled", false);
			} else {
				$("#" + "tmpmajornum" + v).attr("disabled", true);
				$("#" + "tmpmajornum" + v).attr("value", "");
			}
		}
	}
	
	function isRandom(obj) {
		if(obj.checked) {
			for(var i = 1; i <= 5; i++) {
				for(var j = 1; j <= 4; j++) {
					var vv = $("#" + "tmpMajor" + i + j).val();
					if(vv != "") {
						$("#" + "tmpMajorNum" + i + j).attr("disabled", false);
					}
				}
			}
			$("#expertLibData").empty();
			document.getElementById("include").checked = false;
			$("#include").attr("disabled", true);
			$("#strExpertComp").val("");
			$("#strExpertComp").attr("disabled", true);
			$("#strExpertName").val("");
			$("#strExpertName").attr("disabled", true);
			$("#selectExpertCompBtn").attr("disabled", true);
		} else {
			for(var i = 1; i <= 5; i++) {
				for(var j = 1; j <= 4; j++) {
					$("#" + "tmpMajorNum" + i + j).val("");
					$("#" + "tmpMajorNum" + i + j).attr("disabled", true);
				}
			}
			$("#include").attr("disabled", false);
			$("#strExpertComp").attr("disabled", false);
			$("#strExpertName").attr("disabled", false);
			$("#selectExpertCompBtn").attr("disabled", false);
		}
	}
	
	function showSelectExpertComp() {
		var expertCompKeyList = $("[name='expertCompKey']");
		for(var i = 0; i < expertCompKeyList.length; i++) {
			expertCompKeyList[i].checked = false;
		}
		//禁用 Bootstrap 模态框(Modal) 点击空白时自动关闭
		$('#expertCompModal').modal({backdrop: 'static', keyboard: false});
		$('#expertCompModal').modal('show');
	}
	
	function selectExpertComp() {
		var expertCompKeyList = $("[name='expertCompKey']");
		var strcomp = "";
		for(var i = 0; i < expertCompKeyList.length; i++) {
			if(expertCompKeyList[i].checked) {
				strcomp += expertCompKeyList[i].value + ",";
			}
		}
		if(strcomp.length == 0) {
			alert("请选择专家公司！");
			return;
		} else {
			$("#strExpertComp").val(strcomp);
			$('#expertCompModal').modal('hide');
		}
	}
	
	function cancelExpertComp() {
		$('#expertCompModal').modal('hide');
	}
	
	function selectMajor(i, j) {
		var vv = $("#" + "tmpMajor" + i + j).val();
		if(vv != "" && document.getElementById("exportrandom").checked) {
			$("#" + "tmpMajorNum" + i + j).attr("disabled", false);
		} else {
			$("#" + "tmpMajorNum" + i + j).val("");
			$("#" + "tmpMajorNum" + i + j).attr("disabled", true);
		}
		//AJAX加载子专业（暂时只保留1-4列）
		if(j != "4") {
			var jj = parseInt(j) + 1;
			if(vv != "") {
				$.ajax({
					url:'<%=request.getContextPath()%>/expertlib/queryChildExpertLibByParentid.action',
					type:"GET",
					dataType:"json",
					data:{
						"strParentMajorType":jj,
						"strParentMajorCode":vv
					},
					success:function(data) {
						//对于子节点，先清空所有子节点数据
						for(var k = jj; k <= 4; k++) {
							var child = $("#" + "tmpMajor" + i + k);
							child.empty();
							$("<option value=''>" + '请选择' + "</option>").appendTo(child);
							child.attr("disabled", true);
							
							$("#" + "tmpMajorNum" + i + k).val("");
							$("#" + "tmpMajorNum" + i + k).attr("disabled", true);
						}
						//重新赋值
						var selObj = $("#" + "tmpMajor" + i + jj);
						selObj.removeAttr("disabled");
						selObj.empty();
						$("<option value=''>" + '请选择' + "</option>").appendTo(selObj);
						$.each(data, function(i, n){
							$("<option value='"+ n.MAJORCODE +"'>"+ n.MAJORNAME +"</option>").appendTo(selObj);
						});
					}
				});
			} else {
				//对于子节点，先清空所有子节点数据
				for(var k = jj; k <= 4; k++) {
					var child = $("#" + "tmpMajor" + i + k);
					child.empty();
					$("<option value=''>" + '请选择' + "</option>").appendTo(child);
					child.attr("disabled", true);
					
					$("#" + "tmpMajorNum" + i + k).val("");
					$("#" + "tmpMajorNum" + i + k).attr("disabled", true);
				}
			}
		}
	}
	
	//招标合同选择
	function showSelectBidCntrct() {
		$("#strCNTRCT_NO").val("");
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
		var strCNTRCT_NO = $("#strCNTRCT_NO").val();
		// var strCNTRCT_NM = $("#strCNTRCT_NM").val();
		var strCNTRCT_YEAR = $("#strCNTRCT_YEAR").val();
		var strCNTRCT_ST_DATE = $("#strCNTRCT_ST_DATE").val();
		var strCNTRCT_ED_DATE = $("#strCNTRCT_ED_DATE").val();
		var param = new Object();
		param.strCNTRCT_NO = strCNTRCT_NO;
		// param.strCNTRCT_NM = strCNTRCT_NM;
		param.strCNTRCT_NM = "";
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
					html += '<tr onclick="checkRadioTr(this, event);">';
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
					html += '		<input type="hidden" value="' + n.PROJECT_SENIOR_MANAGER + '">';
					html += '		<input type="hidden" value="' + n.CNTRCT_TYPE_NAME + '">';
					html += '	</td>';
					html += '	<td>' + n.CNTRCT_YEAR + '</td>';
					html += '	<td>' + n.CNTRCT_NO + '</td>';
					// html += '	<td>' + n.CNTRCT_NM + '</td>';
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
//			var PROJECT_SENIOR_MANAGER = inputs[12].value;
			var CNTRCT_TYPE_NAME = inputs[13].value;
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
//			$('#tmpPROJECT_MANAGER').val(PROJECT_SENIOR_MANAGER);
//			$('#PROJECT_MANAGER').val(PROJECT_SENIOR_MANAGER);
			$('#CNTRCT_TYPE_NAME').val("");
			if(CNTRCT_TYPE == "1") {
				$('#tmpCNTRCT_TYPE_NAME').val("招标");
			} else if(CNTRCT_TYPE == "5") {
				$('#tmpCNTRCT_TYPE_NAME').val("电子招标");
			} else if(CNTRCT_TYPE == "6") {
				$('#tmpCNTRCT_TYPE_NAME').val("核价竞价");
			} else if(CNTRCT_TYPE == "7") {
				$('#tmpCNTRCT_TYPE_NAME').val("公开竞价");
			} else if(CNTRCT_TYPE == "9") {
				//直接取类型名称
				$('#tmpCNTRCT_TYPE_NAME').val(CNTRCT_TYPE_NAME);
				$('#CNTRCT_TYPE_NAME').val(CNTRCT_TYPE_NAME);
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
		if(id != "") {
			for(var i = 1; i <= 8; i++) {
				$("#tabli" + i).removeClass("active");
				$("#tab" + i).removeClass("tab-pane fade in active");
				$("#tab" + i).addClass("tab-pane fade");
			}
			$("#tabli" + id).addClass("active");
			$("#tab" + id).addClass("tab-pane fade in active");
		}
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
				"autoclose":true,"format":"yyyy-mm-dd","language":"zh-CN","daysOfWeekHighlighted":"[0,6]",clearBtn: true
			});
		}
	}
	
	function showAddBidComp() {
		//初始化数据
		$('#tmpBidCompId').val("");
		$('#tmpBidCompSeq').val("");
		$('#tmpBidCompName').val("");
		$('#tmpBidCompOrgCode').val("");
		$('#tmpBidCompLegal').val("");
		$('#tmpBidCompProManager').val("");
		$('#tmpBidCompProTel').val("");
		$('#tmpBidCompManager').val("");
		$('#tmpBidCompTel').val("");
		$('#tmpBidCompPs').val("");
		$('#tmpBidCompLandlineTel').val("");
		$('#tmpBidCompFax').val("");
		$('#tmpBidCompFund').val("");
		$('#tmpBidCompAdd').val("");
		
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
			var BID_CO_LEGAL = inputs[10].value;
			var BID_CO_ORGCODE = inputs[11].value;
			var BID_CO_PRO_TEL = inputs[12].value;
			var BID_CO_PRO_MANAGER = inputs[13].value;
			var BID_CO_LANDLINE_TEL = inputs[14].value;
			var BID_CO_FAX = inputs[15].value;
			var BID_CO_FUND = inputs[16].value;
			
			var seq = tds[2].innerHTML;
			$('#tmpBidCompId').val(BID_CO_NO);
			$('#tmpBidCompSeq').val(seq);
			$('#tmpBidCompName').val(BID_CO_NAME);
			
			$('#tmpBidCompOrgCode').val(BID_CO_ORGCODE);
			$('#tmpBidCompLegal').val(BID_CO_LEGAL);
			$('#tmpBidCompProManager').val(BID_CO_PRO_MANAGER);
			$('#tmpBidCompProTel').val(BID_CO_PRO_TEL);
			
			$('#tmpBidCompManager').val(BID_CO_MANAGER);
			$('#tmpBidCompTel').val(BID_CO_TEL);
			$('#tmpBidCompPs').val(BID_CO_PS);
			
			$('#tmpBidCompLandlineTel').val(BID_CO_LANDLINE_TEL);
			$('#tmpBidCompFax').val(BID_CO_FAX);
			$('#tmpBidCompFund').val(BID_CO_FUND);
			$('#tmpBidCompAdd').val(BID_CO_ADD);
			
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
				obj = list[i];
				break;
			}
		}
		if(obj == null) {
			alert("请选择一条记录！");
		} else {
			if(confirm("确定删除吗?")) {
				obj.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode);
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
		
		var tmpBidCompOrgCode = $('#tmpBidCompOrgCode').val();
		var tmpBidCompLegal = $('#tmpBidCompLegal').val();
		var tmpBidCompProManager = $('#tmpBidCompProManager').val();
		var tmpBidCompProTel = $('#tmpBidCompProTel').val();
		
		var tmpBidCompManager = $('#tmpBidCompManager').val();
		var tmpBidCompTel = $('#tmpBidCompTel').val(); 
		var tmpBidCompPs = $('#tmpBidCompPs').val();
		
		var tmpBidCompLandlineTel = $('#tmpBidCompLandlineTel').val();
		var tmpBidCompFax = $('#tmpBidCompFax').val();
		var tmpBidCompFund = $('#tmpBidCompFund').val();
		var tmpBidCompAdd = $('#tmpBidCompAdd').val();
		if(tmpBidCompName == "") {
			alert("请输入单位名称！");
			$("#tmpBidCompName").focus();
			return;
		}
		
		if(tmpBidCompOrgCode == "") {
			alert("组织机构代码不能为空！");
			$("#tmpBidCompOrgCode").focus();
			return;
		}
		if(tmpBidCompFund == "") {
			alert("企业注册资金不能为空！");
			$("#tmpBidCompFund").focus();
			return;
		}
		if(tmpBidCompLegal == "") {
			alert("法定代表人不能为空！");
			$("#tmpBidCompLegal").focus();
			return;
		}
		if(tmpBidCompProManager == "") {
			alert("项目负责人不能为空！");
			$("#tmpBidCompProManager").focus();
			return;
		}
		if(tmpBidCompProTel == "") {
			alert("项目负责人联系方式不能为空！");
			$("#tmpBidCompProTel").focus();
			return;
		}
		
		if(tmpBidCompManager == "") {
			alert("联系人不能为空！");
			$("#tmpBidCompManager").focus();
			return;
		}
		/*
		if(tmpBidCompTel == "") {
			alert("负责人电话不能为空！");
			$("#tmpBidCompTel").focus();
			return;
		}
		if(tmpBidCompAdd == "") {
			alert("联系地址不能为空！");
			$("#tmpBidCompAdd").focus();
			return;
		}
		if(tmpBidCompPs == "") {
			alert("邮箱不能为空！");
			$("#tmpBidCompPs").focus();
			return;
		}
		//*/
		
		if(tmpBidCompSeq == "") {
			//新增
			var bidCompBody = document.getElementById("bidCompBody");
			var tr = document.createElement("tr");
			tr.onclick="checkRadioTr(this, event);";
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
			var input = createHidden(tmpBidCompAdd);
			td1.appendChild(input);
			//邮箱
			var input = createHidden(tmpBidCompPs);
			td1.appendChild(input);
			//开票信息
			var input = createHidden("");
			td1.appendChild(input);
			//seq
			var input = createHidden("");
			td1.appendChild(input);
			
			//为了保持和update页面一致，所以添加2个空的隐藏input
			var input = createHidden("");
			td1.appendChild(input);
			var input = createHidden("");
			td1.appendChild(input);
			
			
			//法定代表人
			var input = createHidden(tmpBidCompLegal);
			td1.appendChild(input);
			//组织机构代码
			var input = createHidden(tmpBidCompOrgCode);
			td1.appendChild(input);
			//项目负责人联系方式
			var input = createHidden(tmpBidCompProTel);
			td1.appendChild(input);
			//项目负责人
			var input = createHidden(tmpBidCompProManager);
			td1.appendChild(input);
			//固定电话
			var input = createHidden(tmpBidCompLandlineTel);
			td1.appendChild(input);
			//传真
			var input = createHidden(tmpBidCompFax);
			td1.appendChild(input);
			//企业注册资金
			var input = createHidden(tmpBidCompFund);
			td1.appendChild(input);
			tr.appendChild(td1);
			
			//序号
			tr.appendChild(createTd(""));
			//单位名称
			tr.appendChild(createTd(tmpBidCompName));
			//组织机构代码
			tr.appendChild(createTd(tmpBidCompOrgCode));
			//法定代表人
			tr.appendChild(createTd(tmpBidCompLegal));
			//项目负责人
			tr.appendChild(createTd(tmpBidCompProManager));
			//项目负责人联系方式
			tr.appendChild(createTd(tmpBidCompProTel));
			//单位负责人
			tr.appendChild(createTd(tmpBidCompManager));
			//负责人电话
			tr.appendChild(createTd(tmpBidCompTel));
			//邮箱
			tr.appendChild(createTd(tmpBidCompPs));
			//固定电话
			tr.appendChild(createTd(tmpBidCompLandlineTel));
			//传真
			tr.appendChild(createTd(tmpBidCompFax));
			//企业注册资金
			tr.appendChild(createTd(tmpBidCompFund));
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
			ii[4].value = tmpBidCompAdd;
			ii[5].value = tmpBidCompPs;
			ii[6].value = "";
			ii[7].value = "";
			
			ii[8].value = "";
			ii[9].value = "";
			
			ii[10].value = tmpBidCompLegal;
			ii[11].value = tmpBidCompOrgCode;
			ii[12].value = tmpBidCompProTel;
			ii[13].value = tmpBidCompProManager;
			ii[14].value = tmpBidCompLandlineTel;
			ii[15].value = tmpBidCompFax;
			ii[16].value = tmpBidCompFund;
			
			//更新显示的值
			rows[seq].cells[3].innerHTML = tmpBidCompName;
			rows[seq].cells[4].innerHTML = tmpBidCompOrgCode;
			rows[seq].cells[5].innerHTML = tmpBidCompLegal;
			rows[seq].cells[6].innerHTML = tmpBidCompProManager;
			rows[seq].cells[7].innerHTML = tmpBidCompProTel;
			rows[seq].cells[8].innerHTML = tmpBidCompManager;
			rows[seq].cells[9].innerHTML = tmpBidCompTel;
			rows[seq].cells[10].innerHTML = tmpBidCompPs;
			
			rows[seq].cells[11].innerHTML = tmpBidCompLandlineTel;
			rows[seq].cells[12].innerHTML = tmpBidCompFax;
			rows[seq].cells[13].innerHTML = tmpBidCompFund;
		}
		//刷新seq
		var rows = document.getElementById("bidCompBody").rows;
		for(var i = 0; i < rows.length; i++) {
			var num = i + 1;
			rows[i].cells[2].innerHTML = num;
		}
		$('#bidCompModal').modal('hide');
	}
	
	//导出审核表
	function exportBidAudit() {
		document.mainform.action = '<c:url value="/bid/exportBidAuditAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//导出所有公司报名表
	function exportBidRegister() {
		document.mainform.action = '<c:url value="/bid/exportBidRegisterAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//导出单个公司报名表
	function exportSingleBidRegister(compNo) {
		document.mainform.action = '<c:url value="/bid/exportSingleBidRegisterAction.action"></c:url>?strCompNo=' + compNo;
		document.mainform.submit();
	}
	
	//设置公司报名内容
	function setApplyContent(compNo) {
		$("#applyCompNo").val(compNo);
		var bidCompApply = $("#bidCompApply_" + compNo).val();
		$("#bidCompApplyData").empty();
		if(bidCompApply != "") {
			var list = bidCompApply.split("####");
			var n = 1;
			for(var i = 0; i < list.length; i++) {
				if(list[i] != "") {
					var ss = list[i].split("@@@@");
					var html = '<tr>';
					html += '<td>' + n + '</td>';
					html += '<td>';
					html += '	<input type="hidden" name="tmpApplyId" value="' + ss[0] + '">';
					html += '	<input type="text" disabled="disabled" name="tmpApplyRequire" class="form-control" value="' + ss[1] + '">';
					html += '</td>';
					html += '<td><input name="tmpApplyContent" type="text" class="form-control" value="' + ss[2] + '"></td>';
					html += '</tr>';
					$("#bidCompApplyData").append(html);
					n++;
				}
			}
			//禁用 Bootstrap 模态框(Modal) 点击空白时自动关闭
			$('#bidCompApplyModal').modal({backdrop: 'static', keyboard: false});
			$('#bidCompApplyModal').modal('show');
		} else {
			alert("请设置报名要求！");
		}
	}
	
	function setBidCompApply() {
		var compNo = $("#applyCompNo").val();
		var tmpApplyId = $("[name='tmpApplyId']");
		var tmpApplyRequire = $("[name='tmpApplyRequire']");
		var tmpApplyContent = $("[name='tmpApplyContent']");
		if(tmpApplyId != null && tmpApplyId.length > 0) {
			var tmpapplynote = "";
			for(var i = 0; i < tmpApplyId.length; i++) {
				if(tmpApplyContent[i].value == "") {
					alert("报名内容不能为空！");
					tmpApplyContent[i].focus();
					return;
				}
				tmpapplynote += tmpApplyId[i].value + "@@@@" + tmpApplyRequire[i].value + "@@@@" + tmpApplyContent[i].value + "####";
			}
			//
			$("#bidCompApply_" + compNo).val(tmpapplynote);
			$("#saveBidCompApply_" + compNo).val(tmpapplynote);
		}
		$('#bidCompApplyModal').modal('hide');
	}
	
	//导出单个公司报名回执
	function exportSingleBidRegisterReturn(compNo) {
		document.mainform.action = '<c:url value="/bid/exportBidReplyAction.action"></c:url>?strCompNo=' + compNo;
		document.mainform.submit();
	}
	
	//导出保证金收据
	function exportBidDeposit() {
		document.mainform.action = '<c:url value="/bid/exportBidDepositAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//导出保证金退订签收单
	function exportBidCancel() {
		document.mainform.action = '<c:url value="/bid/exportBidCancelAction.action"></c:url>';
		document.mainform.submit();
	}
	
	
	//导出标书费收据
	function exportBidBase() {
		document.mainform.action = '<c:url value="/bid/exportBidBaseAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//导出标书费签收收据
	function exportBidReceive() {
		document.mainform.action = '<c:url value="/bid/exportBidReceiveAction.action"></c:url>';
		document.mainform.submit();
	}
	
	//导出中标签收单
	function exportBidSign() {
		document.mainform.action = '<c:url value="/bid/exportBidSignAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function delFile(obj, compNo) {
		var filename = $("#tmpRECEPT_UL_FILE1_" + compNo).val();
		if(filename != "") {
			if(confirm("确定删除吗？")) {
				var param = new Object();
				param.delFileName = filename;
				$.getJSON('<%=request.getContextPath()%>/fileupload/delFileAction.action', param, function(data) {
					if(data.resultCode == 0) {
						alert("文件删除成功！");
						//清空页面数据
						$("#tmpRECEPT_UL_FILE1_" + compNo).val("");
						$("#tmpRECEPT_UL_FILE1_BASENAME_" + compNo).val("");
						$("#preview_" + compNo).remove();
						$("#del_file_" + compNo).remove();
					} else {
						alert(data.resultMessage);
					}
				});
			}
		}
	}
	
	function showUploadModel(obj, compNo) {
		$("#uploadFileName").val("");
		$("#uploadFileObj").val("");
		$("#fileNamePre").val("");
		$("#uploadFileCompNo").val(compNo);
		//禁用 Bootstrap 模态框(Modal) 点击空白时自动关闭
		$('#uploadFileModal').modal({backdrop: 'static', keyboard: false});
		$('#uploadFileModal').modal('show');
	}
	
	function uploadFile() {
		var uploadFileCompNo = $("#uploadFileCompNo").val();
		var uploadFileObj = $("#uploadFileObj").val();
		
		if(uploadFileObj == "") {
			alert("请选择文件！");
			$("#uploadFileObj").focus();
			return;
		}
		if(confirm("确定上传吗？")) {
			$("#uploadFileName").val(uploadFileObj);
			//前缀
			$("#fileNamePre").val("comp");
			//解决重复上传错误
			/* var formId = 'jUploadFrame' + 'uploadFileName';
			var test1 = jQuery('#' + formId);
			var test2 = $("iframe[id^='jUpload']");
			alert("test1.length=" + test1.length + "," + "test2.length=" + test2.length);
			if(test1.length > 0) {
				test1.remove();
			} */
			
			var formData = new FormData($("#file_form")[0]);
			$.ajax({
				url: '<c:url value="/fileupload/uploadFileAction.action"></c:url>',
				type: 'POST',
				data: formData,
				async: false,
				cache: false,
				contentType: false,
				processData: false,
				success: function (data) {
					if(data.resultCode == 0) {
						//上传成功
						var fileurl = data.data.fileurl;
						var filename = data.data.filename;
						var originalname = data.data.originalname;
						$("#tmpRECEPT_UL_FILE1_" + uploadFileCompNo).val(filename);
						//将文件原始名称记录下来
						$("#tmpRECEPT_UL_FILE1_BASENAME_" + uploadFileCompNo).val(originalname);
						
						var preview_html = '<a id="preview_' + uploadFileCompNo + '" target="_blank" href="' + fileurl + filename + '">' + originalname + '</a>';
						$("#file_td_" + uploadFileCompNo).append(preview_html);
						var del_html = '<a id="del_file_' + uploadFileCompNo + '" href="javascript:void(0);" onclick="delFile(this,\'' + uploadFileCompNo + '\');">删除</a>';
						$("#file_td_" + uploadFileCompNo).append(del_html);
						
						//隐藏模态窗体
						$('#uploadFileModal').modal('hide');
						$("#uploadFileName").val("");
					} else {
						alert("文件上传失败：" + data.resultMessage);
						return;
					}
				}
			});
			
			/*
			$.ajaxFileUpload({
				url:'<c:url value="/fileupload/uploadFileAction.action"></c:url>?time=' + new Date(),
				secureuri:false,
				fileElementId:"uploadFileName",
				dataType:"json",
				data:{
					"uploadFileName":uploadFileName,
					"fileNamePre":"comp"
				},
				success:function(data) {
					if(data.resultCode == 0) {
						//上传成功
						var fileurl = data.data.fileurl;
						var filename = data.data.filename;
						//alert(fileurl + filename);
						$("#tmpRECEPT_UL_FILE1_" + uploadFileCompNo).val(filename);
						$("#preview_" + uploadFileCompNo).attr("href", fileurl + filename);
						//隐藏模态窗体
						$('#uploadFileModal').modal('hide');
						$("#uploadFileName").val("");
					} else {
						alert("文件上传失败：" + data.resultMessage);
						return;
					}
				},
				error:function(XMLHttpRequest, textStatus, errorThrown) {
					alert(errorThrown);
				}
			});//*/
		}
	}
	
	function setTENDER_VERIFY_DATE(obj) {
		$("#tmpTENDER_VERIFY_DATE").val($(obj).val());
	}
	
	function setBidCheckPrice(obj) {
		var tr = obj.parentNode.parentNode.parentNode;
		var tds = tr.getElementsByTagName("td");
		var inputs = tds[3].getElementsByTagName("input");
		inputs[0].value = $(obj).val();
	}
	
	function selectResult(obj) {
		if($(obj).prop('checked')) {
			var tr = obj.parentNode.parentNode;
			var tds = tr.getElementsByTagName("td");
			var inputs3 = tds[3].getElementsByTagName("input");
			var inputs5 = tds[5].getElementsByTagName("input");
			inputs5[0].value = inputs3[0].value;
		}
	}
</script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true" />
	<div class="container-fluid">
		<jsp:include page="../info.jsp" flush="true" />
		<s:form id="mainform" name="mainform" method="POST" theme="simple">
			<s:hidden name="strBID_NO" id="strBID_NO"/>
			<s:hidden name="updateBidDto.IS_RANDOM" id="IS_RANDOM"/>
			<s:hidden name="updateBidDto.CNTRCT_NO" id="CNTRCT_NO"/>
			<s:hidden name="updateBidDto.CNTRCT_YEAR" id="CNTRCT_YEAR"/>
			<s:hidden name="updateBidDto.CNTRCT_ST_DATE" id="CNTRCT_ST_DATE"/>
			<s:hidden name="updateBidDto.CNTRCT_ED_DATE" id="CNTRCT_ED_DATE"/>
			<s:hidden name="updateBidDto.BID_COMP_NO" id="BID_COMP_NO"/>
			<s:hidden name="updateBidDto.BID_COMP_NAME" id="BID_COMP_NAME"/>
			<s:hidden name="updateBidDto.PROJECT_MANAGER" id="PROJECT_MANAGER"/>
			<s:hidden name="updateBidDto.CO_MANAGER1" id="CO_MANAGER1"/>
			<s:hidden name="updateBidDto.CO_MANAGER_TEL1" id="CO_MANAGER_TEL1"/>
			<s:hidden name="updateBidDto.CO_ADDRESS1" id="CO_ADDRESS1"/>
			<s:hidden name="updateBidDto.CO_MANAGER_EMAIL1" id="CO_MANAGER_EMAIL1"/>
			<s:hidden name="updateBidDto.CO_TAX" id="CO_TAX"/>
			<s:hidden name="updateBidDto.CNTRCT_TYPE" id="CNTRCT_TYPE"/>
			<s:hidden name="updateBidDto.PROJECT_DEVIEW_DATE" id="PROJECT_DEVIEW_DATE"/>
			<s:hidden name="updateBidDto.PROJ_APPROVAL" id="PROJ_APPROVAL"/>
			<s:hidden name="updateBidDto.REGISTE_ST_DATE1" id="REGISTE_ST_DATE1"/>
			<s:hidden name="updateBidDto.REGISTE_ED_DATE1" id="REGISTE_ED_DATE1"/>
			<s:hidden name="updateBidDto.REGISTE_ST_DATE2" id="REGISTE_ST_DATE2"/>
			<s:hidden name="updateBidDto.REGISTE_ED_DATE2" id="REGISTE_ED_DATE2"/>
			<s:hidden name="updateBidDto.REGISTE_ST_DATE3" id="REGISTE_ST_DATE3"/>
			<s:hidden name="updateBidDto.REGISTE_ED_DATE3" id="REGISTE_ED_DATE3"/>
			<s:hidden name="updateBidDto.REGISTE_ST_DATE4" id="REGISTE_ST_DATE4"/>
			<s:hidden name="updateBidDto.REGISTE_ED_DATE4" id="REGISTE_ED_DATE4"/>
			<s:hidden name="updateBidDto.REGISTE_ST_DATE5" id="REGISTE_ST_DATE5"/>
			<s:hidden name="updateBidDto.REGISTE_ED_DATE5" id="REGISTE_ED_DATE5"/>
			<s:hidden name="updateBidDto.APPLY_REQUIRE" id="APPLY_REQUIRE"/>
			<s:hidden name="updateBidDto.TENDER_OPEN_DATE" id="TENDER_OPEN_DATE"/>
			<s:hidden name="updateBidDto.TENDER_VERIFY_DATE" id="TENDER_VERIFY_DATE"/>
			<s:hidden name="updateBidDto.BID_EXPERT_COMMISION_PRE_DATE" id="BID_EXPERT_COMMISION_PRE_DATE"/>
			<s:hidden name="updateBidDto.BID_EXPERT_COMMISION_PRE_DATE1" id="BID_EXPERT_COMMISION_PRE_DATE1"/>
			<s:hidden name="updateBidDto.BID_EXPERT_COMMISION_PRE_DATE2" id="BID_EXPERT_COMMISION_PRE_DATE2"/>
			<s:hidden name="updateBidDto.BID_EXPERT_COMMISION_PRE_DATE3" id="BID_EXPERT_COMMISION_PRE_DATE3"/>
			<s:hidden name="updateBidDto.BID_EXPERT_COMMISION_APPLY_DATE" id="BID_EXPERT_COMMISION_APPLY_DATE"/>
			<s:hidden name="updateBidDto.RECEIPT1_DATE" id="RECEIPT1_DATE"/>
			<s:hidden name="updateBidDto.RECEIPT1_VALUE_DATE" id="RECEIPT1_VALUE_DATE"/>
			<s:hidden name="updateBidDto.BID_EXPERT_COMMISION_DIFF_DATE" id="BID_EXPERT_COMMISION_DIFF_DATE"/>
			<s:hidden name="updateBidDto.BID_EXPERT_COMMISION_DIFF_DATE1" id="BID_EXPERT_COMMISION_DIFF_DATE1"/>
			<s:hidden name="updateBidDto.BID_EXPERT_COMMISION_DIFF_DATE2" id="BID_EXPERT_COMMISION_DIFF_DATE2"/>
			<s:hidden name="updateBidDto.BID_EXPERT_COMMISION_DIFF_DATE3" id="BID_EXPERT_COMMISION_DIFF_DATE3"/>
			<s:hidden name="updateBidDto.BID_EXPERT_COMMISION_PRE_YUAN" id="BID_EXPERT_COMMISION_PRE_YUAN"/>
			<s:hidden name="updateBidDto.BID_EXPERT_COMMISION_ACT_YUAN" id="BID_EXPERT_COMMISION_ACT_YUAN"/>
	
			<s:hidden name="updBidTabIndex" id="updBidTabIndex"/>
			
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
								<input id="tmpCNTRCT_NO" value="<s:property value="updateBidDto.CNTRCT_NO"/>" type="text" class="form-control" readonly>
							</div>
							<div class="col-lg-2" style="z-index: 1;">
								<button type="button" class="btn btn-success" onclick="showSelectBidCntrct();">合同选择</button>
							</div>
						</div>
						 <div class="col-lg-3 form-group">
						 	<label for="" class="col-lg-3 form-label">年份</label>
							<div class="col-lg-9">
								<input id="tmpCNTRCT_YEAR" value="<s:property value="updateBidDto.CNTRCT_YEAR"/>" type="text" class="form-control" readonly>
							</div>
						 </div>
						 <div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">合同期限</label>
						 	<div class="col-lg-4">
						 		<input id="tmpCNTRCT_ST_DATE" value="<s:date name="updateBidDto.CNTRCT_ST_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control" readonly>
						 	</div>
						 	<label for="" class="col-lg-1 form-label to">---</label>
						 	<div class="col-lg-4">
						 		<input id="tmpCNTRCT_ED_DATE" value="<s:date name="updateBidDto.CNTRCT_ST_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control" readonly>
						 	</div>
						 </div>
						 <h5>委托合同信息</h5>
						 <div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">单位名称</label>
						 	<div class="col-lg-10">
						 		<input type="hidden" id="tmpBID_COMP_NO" value="<s:property value="updateBidDto.BID_COMP_NO"/>">
								<input id="tmpBID_COMP_NAME" value="<s:property value="updateBidDto.BID_COMP_NAME"/>" disabled="disabled" maxlength="40" type="text" class="form-control">
						 	</div>
						 </div>
						 <div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">地址</label>
						 	<div class="col-lg-10">
						 		<input id="tmpCO_ADDRESS1" value="<s:property value="updateBidDto.CO_ADDRESS1"/>" disabled="disabled" maxlength="40" type="text" class="form-control">
						 	</div>
						 </div>
						 <div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">联系人</label>
						 	<div class="col-lg-10">
						 		<input id="tmpCO_MANAGER1" value="<s:property value="updateBidDto.CO_MANAGER1"/>" disabled="disabled" maxlength="40" type="text" class="form-control">
						 	</div>
						 </div>
						 <div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">邮箱</label>
						 	<div class="col-lg-10">
						 		<input id="tmpCO_MANAGER_EMAIL1" value="<s:property value="updateBidDto.CO_MANAGER_EMAIL1"/>" disabled="disabled" maxlength="100" type="text" class="form-control">
						 	</div>
						 </div>
						  <div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">联系方式</label>
						 	<div class="col-lg-10">
						 		<input id="tmpCO_MANAGER_TEL1" value="<s:property value="updateBidDto.CO_MANAGER_TEL1"/>" disabled="disabled" maxlength="40" type="text" class="form-control">
						 	</div>
						 </div>
						  <div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">开票信息</label>
						 	<div class="col-lg-10">
						 		<input id="tmpCO_TAX" value="<s:property value="updateBidDto.CO_TAX"/>" disabled="disabled" maxlength="80" type="text" class="form-control">
						 	</div>
						 </div>
						 <div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">招标编号</label>
						 	<div class="col-lg-8">
						 		<s:if test='updateBidDto.CNTRCT_TYPE != "3" && updateBidDto.CNTRCT_TYPE != "4" && updateBidDto.IS_RANDOM == "1"'>
									<s:textfield name="updateBidDto.BID_NO" id="BID_NO" disabled="true" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
								</s:if>
								<s:else>
									<s:textfield name="updateBidDto.BID_NO" id="BID_NO" disabled="true" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
								</s:else>
						 	</div>
						 	<div class="col-lg-2 checkBox">
								<s:if test='updateBidDto.IS_RANDOM == "1"'>
									<input type="checkbox" id="random" disabled="disabled" checked="checked" onclick="randomBidNo(this);"/>是否随机
								</s:if>
								<s:else>
									<input type="checkbox" id="random" disabled="disabled" onclick="randomBidNo(this);"/>是否随机
								</s:else>
							</div>
						</div>
						<div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-2 form-label">类别</label>
						 	<div class="col-lg-10">
						 		<input id="tmpCNTRCT_TYPE" value="<s:property value="updateBidDto.CNTRCT_TYPE"/>" type="hidden" class="form-control">
						 		<s:if test='updateBidDto.CNTRCT_TYPE == "1"'>
						 			<input id="tmpCNTRCT_TYPE_NAME" value="招标" maxlength="80" type="text" class="form-control" disabled="disabled">
						 		</s:if>
						 		<s:elseif test='updateBidDto.CNTRCT_TYPE == "5"'>
						 			<input id="tmpCNTRCT_TYPE_NAME" value="电子招标" maxlength="80" type="text" class="form-control" disabled="disabled">
						 		</s:elseif>
						 		<s:elseif test='updateBidDto.CNTRCT_TYPE == "6"'>
						 			<input id="tmpCNTRCT_TYPE_NAME" value="核价竞价" maxlength="80" type="text" class="form-control" disabled="disabled">
						 		</s:elseif>
						 		<s:elseif test='updateBidDto.CNTRCT_TYPE == "7"'>
						 			<input id="tmpCNTRCT_TYPE_NAME" value="公开竞价" maxlength="80" type="text" class="form-control" disabled="disabled">
						 		</s:elseif>
						 		<s:elseif test='updateBidDto.CNTRCT_TYPE == "9"'>
						 			<input id="tmpCNTRCT_TYPE_NAME" value="<s:property value="updateBidDto.CNTRCT_TYPE_NAME"/>" maxlength="80" type="text" class="form-control" disabled="disabled">
						 		</s:elseif>
						 		<s:else>
						 			<input id="tmpCNTRCT_TYPE_NAME" value="" maxlength="80" type="text" class="form-control" disabled="disabled">
						 		</s:else>
						 	</div>
						</div>
						<div class="col-lg-4 form-group">
						 	<label for="" class="col-lg-3 form-label">工程师</label>
						 	<div class="col-lg-9">
						 		<!-- <select id="tmpPROJECT_MANAGER" class="form-control" disabled="disabled"> -->
						 		<select id="tmpPROJECT_MANAGER" class="form-control" >
						 			<option value="" selected="selected">请选择</option>
									<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
										<option value="<s:property value="LOGIN_ID"/>" <s:if test="%{updateBidDto.PROJECT_MANAGER == LOGIN_ID}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
									</s:iterator>
								</select>
						 	</div>
						</div>
						<div class="col-lg-6 form-group">
						 	<label for="" class="col-lg-3 form-label">项目名称</label>
						 	<div class="col-lg-9">
						 		<s:textfield name="updateBidDto.PROJECT_NAME" id="PROJECT_NAME" cssClass="form-control" maxlength="200" theme="simple"></s:textfield>
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
										<s:if test='#session.user_rank >= "B"'>
											<div class="input-group date" data-provide="datepicker">
												<input type="text" id="tmpPROJECT_DEVIEW_DATE" value="<s:date name="updateBidDto.PROJECT_DEVIEW_DATE" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
												<div class="input-group-addon">
													<span class="glyphicon glyphicon-th"></span>
												</div>
											</div>
										</s:if>
										<s:else>
											<input type="text" id="tmpPROJECT_DEVIEW_DATE" value="<s:date name="updateBidDto.PROJECT_DEVIEW_DATE" format="yyyy-MM-dd"/>" class="form-control" readonly>
										</s:else>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">项目性质</label>
									<div class="col-lg-9">
										<s:if test='#session.user_rank >= "B"'>
											<select class="form-control" name="updateBidDto.PROJECT_PROPERTY" id="PROJECT_PROPERTY">
												<option value="" selected="selected">请选择</option>
												<s:if test='updateBidDto.PROJECT_PROPERTY == "1"'>
													<option value="1" selected="selected">成本内</option>
													<option value="2">成本外</option>
													<option value="3">单独立项</option>
													<option value="9">其他</option>
												</s:if>
												<s:elseif test='updateBidDto.PROJECT_PROPERTY == "2"'>
													<option value="1">成本内</option>
													<option value="2" selected="selected">成本外</option>
													<option value="3">单独立项</option>
													<option value="9">其他</option>
												</s:elseif>
												<s:elseif test='updateBidDto.PROJECT_PROPERTY == "3"'>
													<option value="1">成本内</option>
													<option value="2">成本外</option>
													<option value="3" selected="selected">单独立项</option>
													<option value="9">其他</option>
												</s:elseif>
												<s:elseif test='updateBidDto.PROJECT_PROPERTY == "4"'>
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
										</s:if>
										<s:else>
											<select class="form-control" name="updateBidDto.PROJECT_PROPERTY" id="PROJECT_PROPERTY" disabled="disabled">
												<option value="" selected="selected">请选择</option>
												<s:if test='updateBidDto.PROJECT_PROPERTY == "1"'>
													<option value="1" selected="selected">成本内</option>
													<option value="2">成本外</option>
													<option value="3">单独立项</option>
													<option value="9">其他</option>
												</s:if>
												<s:elseif test='updateBidDto.PROJECT_PROPERTY == "2"'>
													<option value="1">成本内</option>
													<option value="2" selected="selected">成本外</option>
													<option value="3">单独立项</option>
													<option value="9">其他</option>
												</s:elseif>
												<s:elseif test='updateBidDto.PROJECT_PROPERTY == "3"'>
													<option value="1">成本内</option>
													<option value="2">成本外</option>
													<option value="3" selected="selected">单独立项</option>
													<option value="9">其他</option>
												</s:elseif>
												<s:elseif test='updateBidDto.PROJECT_PROPERTY == "4"'>
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
										</s:else>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">会审监管人</label>
									<div class="col-lg-9">
										<s:if test='#session.user_rank >= "B"'>
											<select class="form-control" name="updateBidDto.PROJECT_AUTH" id="PROJECT_AUTH">
												<option value="" selected="selected">请选择</option>
												<s:iterator id="listSuperviseLib" value="listSuperviseLib" status="st1">
													<option value="<s:property value="SUPERVISE_SEQ"/>" <s:if test="%{updateBidDto.PROJECT_AUTH == SUPERVISE_SEQ}">selected</s:if>><s:property value="SUPERVISE_NAME"/></option>
												</s:iterator>
											</select>
										</s:if>
										<s:else>
											<select class="form-control" name="updateBidDto.PROJECT_AUTH" id="PROJECT_AUTH" disabled="disabled">
												<option value="" selected="selected">请选择</option>
												<s:iterator id="listSuperviseLib" value="listSuperviseLib" status="st1">
													<option value="<s:property value="SUPERVISE_SEQ"/>" <s:if test="%{updateBidDto.PROJECT_AUTH == SUPERVISE_SEQ}">selected</s:if>><s:property value="SUPERVISE_NAME"/></option>
												</s:iterator>
											</select>
										</s:else>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">代理费支付方</label>
									<div class="col-lg-9">
										<s:if test='#session.user_rank >= "B"'>
											<select class="form-control" name="updateBidDto.BID_AGENT_PAY" id="BID_AGENT_PAY">
												<option value="" selected="selected">请选择</option>
												<s:if test='updateBidDto.BID_AGENT_PAY == "1"'>
													<option value="1" selected="selected">委托单位</option>
													<option value="2">中标单位</option>
													<option value="3">申通集团</option>
													<option value="4">维保公司</option>
												</s:if>
												<s:elseif test='updateBidDto.BID_AGENT_PAY == "2"'>
													<option value="1">委托单位</option>
													<option value="2" selected="selected">中标单位</option>
													<option value="3">申通集团</option>
													<option value="4">维保公司</option>
												</s:elseif>
												<s:elseif test='updateBidDto.BID_AGENT_PAY == "3"'>
													<option value="1">委托单位</option>
													<option value="2">中标单位</option>
													<option value="3" selected="selected">申通集团</option>
													<option value="4">维保公司</option>
												</s:elseif>
												<s:elseif test='updateBidDto.BID_AGENT_PAY == "4"'>
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
										</s:if>
										<s:else>
											<select class="form-control" name="updateBidDto.BID_AGENT_PAY" id="BID_AGENT_PAY" disabled="disabled">
												<option value="" selected="selected">请选择</option>
												<s:if test='updateBidDto.BID_AGENT_PAY == "1"'>
													<option value="1" selected="selected">委托单位</option>
													<option value="2">中标单位</option>
													<option value="3">申通集团</option>
													<option value="4">维保公司</option>
												</s:if>
												<s:elseif test='updateBidDto.BID_AGENT_PAY == "2"'>
													<option value="1">委托单位</option>
													<option value="2" selected="selected">中标单位</option>
													<option value="3">申通集团</option>
													<option value="4">维保公司</option>
												</s:elseif>
												<s:elseif test='updateBidDto.BID_AGENT_PAY == "3"'>
													<option value="1">委托单位</option>
													<option value="2">中标单位</option>
													<option value="3" selected="selected">申通集团</option>
													<option value="4">维保公司</option>
												</s:elseif>
												<s:elseif test='updateBidDto.BID_AGENT_PAY == "4"'>
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
										</s:else>
									</div>
								</div>
								<div class="col-lg-12 form-group">
									<label class="col-lg-1 form-label">工程概况批文</label>
									<div class="col-lg-11">
										<s:if test='#session.user_rank >= "B"'>
											<textarea id="tmpPROJ_APPROVAL" class="form-control"><s:property value="updateBidDto.PROJ_APPROVAL" /></textarea>
										</s:if>
										<s:else>
											<textarea id="tmpPROJ_APPROVAL" disabled="disabled" class="form-control"><s:property value="updateBidDto.PROJ_APPROVAL" /></textarea>
										</s:else>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab2">
							<div class="row" style="margin-top: 20px;">
								<div class="col-lg-12 form-group">
									<label class="col-lg-1 form-label">报名日期</label>
									<div id="registeDateDiv" class="col-lg-9">
										<s:if test='updateBidDto.REGISTE_ST_DATE1 != null'>
											<div class="row">
												<div class="col-lg-4">
													<s:if test='#session.user_rank >= "B"'>
														<div class="input-group date" data-provide="datepicker">
															<input type="text" name="registeStDate" value="<s:date name="updateBidDto.REGISTE_ST_DATE1" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
															<div class="input-group-addon">
																<span class="glyphicon glyphicon-th"></span>
															</div>
														</div>
													</s:if>
													<s:else>
														<input type="text" name="registeStDate" value="<s:date name="updateBidDto.REGISTE_ST_DATE1" format="yyyy-MM-dd"/>" class="form-control" readonly>
													</s:else>
												</div>
												<label for="" class="col-lg-1 form-label to">---</label>
												<div class="col-lg-4">
													<s:if test='#session.user_rank >= "B"'>
														<div class="input-group date" data-provide="datepicker">
															<input type="text" name="registeEdDate" value="<s:date name="updateBidDto.REGISTE_ED_DATE1" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
															<div class="input-group-addon">
																<span class="glyphicon glyphicon-th"></span>
															</div>
														</div>
													</s:if>
													<s:else>
														<input type="text" name="registeEdDate" value="<s:date name="updateBidDto.REGISTE_ED_DATE1" format="yyyy-MM-dd"/>" class="form-control" readonly>
													</s:else>
												</div>
												<div class="col-lg-2">
													<s:if test='#session.user_rank >= "B"'>
														<a href="javascript:void(0);" onclick="adddate();">
															<img src="<%=request.getContextPath()%>/images/add.png" />
														</a>
														<a href="javascript:void(0);" onclick="deldate(this);">
															<img src="<%=request.getContextPath()%>/images/minus.png" />
														</a>
													</s:if>
												</div>
											</div>
										</s:if>
										<s:else>
											<!-- 默认至少有一个日期 -->
											<div class="row">
												<div class="col-lg-4">
													<s:if test='#session.user_rank >= "B"'>
														<div class="input-group date" data-provide="datepicker">
															<input type="text" name="registeStDate" value="" class="form-control datepicker" readonly>
															<div class="input-group-addon">
																<span class="glyphicon glyphicon-th"></span>
															</div>
														</div>
													</s:if>
													<s:else>
														<input type="text" name="registeStDate" value="" class="form-control" readonly>
													</s:else>
												</div>
												<label for="" class="col-lg-1 form-label to">---</label>
												<div class="col-lg-4">
													<s:if test='#session.user_rank >= "B"'>
														<div class="input-group date" data-provide="datepicker">
															<input type="text" name="registeEdDate" value="" class="form-control datepicker" readonly>
															<div class="input-group-addon">
																<span class="glyphicon glyphicon-th"></span>
															</div>
														</div>
													</s:if>
													<s:else>
														<input type="text" name="registeEdDate" value="" class="form-control" readonly>
													</s:else>
												</div>
												<div class="col-lg-2">
													<s:if test='#session.user_rank >= "B"'>
														<a href="javascript:void(0);" onclick="adddate();">
															<img src="<%=request.getContextPath()%>/images/add.png" />
														</a>
														<a href="javascript:void(0);" onclick="deldate(this);">
															<img src="<%=request.getContextPath()%>/images/minus.png" />
														</a>
													</s:if>
												</div>
											</div>
										</s:else>
										<s:if test='updateBidDto.REGISTE_ST_DATE2 != null'>
											<div class="row">
												<div class="col-lg-4">
													<s:if test='#session.user_rank >= "B"'>
														<div class="input-group date" data-provide="datepicker">
															<input type="text" name="registeStDate" value="<s:date name="updateBidDto.REGISTE_ST_DATE2" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
															<div class="input-group-addon">
																<span class="glyphicon glyphicon-th"></span>
															</div>
														</div>
													</s:if>
													<s:else>
														<input type="text" name="registeStDate" value="<s:date name="updateBidDto.REGISTE_ST_DATE2" format="yyyy-MM-dd"/>" class="form-control" readonly>
													</s:else>
												</div>
												<label for="" class="col-lg-1 form-label to">---</label>
												<div class="col-lg-4">
													<s:if test='#session.user_rank >= "B"'>
														<div class="input-group date" data-provide="datepicker">
															<input type="text" name="registeEdDate" value="<s:date name="updateBidDto.REGISTE_ED_DATE2" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
															<div class="input-group-addon">
																<span class="glyphicon glyphicon-th"></span>
															</div>
														</div>
													</s:if>
													<s:else>
														<input type="text" name="registeEdDate" value="<s:date name="updateBidDto.REGISTE_ED_DATE2" format="yyyy-MM-dd"/>" class="form-control" readonly>
													</s:else>
												</div>
												<div class="col-lg-2">
													<s:if test='#session.user_rank >= "B"'>
														<a href="javascript:void(0);" onclick="adddate();">
															<img src="<%=request.getContextPath()%>/images/add.png" />
														</a>
														<a href="javascript:void(0);" onclick="deldate(this);">
															<img src="<%=request.getContextPath()%>/images/minus.png" />
														</a>
													</s:if>
												</div>
											</div>
										</s:if>
										<s:if test='updateBidDto.REGISTE_ST_DATE3 != null'>
											<div class="row">
												<div class="col-lg-4">
													<s:if test='#session.user_rank >= "B"'>
														<div class="input-group date" data-provide="datepicker">
															<input type="text" name="registeStDate" value="<s:date name="updateBidDto.REGISTE_ST_DATE3" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
															<div class="input-group-addon">
																<span class="glyphicon glyphicon-th"></span>
															</div>
														</div>
													</s:if>
													<s:else>
														<input type="text" name="registeStDate" value="<s:date name="updateBidDto.REGISTE_ST_DATE3" format="yyyy-MM-dd"/>" class="form-control" readonly>
													</s:else>
												</div>
												<label for="" class="col-lg-1 form-label to">---</label>
												<div class="col-lg-4">
													<s:if test='#session.user_rank >= "B"'>
														<div class="input-group date" data-provide="datepicker">
															<input type="text" name="registeEdDate" value="<s:date name="updateBidDto.REGISTE_ED_DATE3" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
															<div class="input-group-addon">
																<span class="glyphicon glyphicon-th"></span>
															</div>
														</div>
													</s:if>
													<s:else>
														<input type="text" name="registeEdDate" value="<s:date name="updateBidDto.REGISTE_ED_DATE3" format="yyyy-MM-dd"/>" class="form-control" readonly>
													</s:else>
												</div>
												<div class="col-lg-2">
													<s:if test='#session.user_rank >= "B"'>
														<a href="javascript:void(0);" onclick="adddate();">
															<img src="<%=request.getContextPath()%>/images/add.png" />
														</a>
														<a href="javascript:void(0);" onclick="deldate(this);">
															<img src="<%=request.getContextPath()%>/images/minus.png" />
														</a>
													</s:if>
												</div>
											</div>
										</s:if>
										<s:if test='updateBidDto.REGISTE_ST_DATE4 != null'>
											<div class="row">
												<div class="col-lg-4">
													<s:if test='#session.user_rank >= "B"'>
														<div class="input-group date" data-provide="datepicker">
															<input type="text" name="registeStDate" value="<s:date name="updateBidDto.REGISTE_ST_DATE4" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
															<div class="input-group-addon">
																<span class="glyphicon glyphicon-th"></span>
															</div>
														</div>
													</s:if>
													<s:else>
														<input type="text" name="registeStDate" value="<s:date name="updateBidDto.REGISTE_ST_DATE4" format="yyyy-MM-dd"/>" class="form-control" readonly>
													</s:else>
												</div>
												<label for="" class="col-lg-1 form-label to">---</label>
												<div class="col-lg-4">
													<s:if test='#session.user_rank >= "B"'>
														<div class="input-group date" data-provide="datepicker">
															<input type="text" name="registeEdDate" value="<s:date name="updateBidDto.REGISTE_ED_DATE4" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
															<div class="input-group-addon">
																<span class="glyphicon glyphicon-th"></span>
															</div>
														</div>
													</s:if>
													<s:else>
														<input type="text" name="registeEdDate" value="<s:date name="updateBidDto.REGISTE_ED_DATE4" format="yyyy-MM-dd"/>" class="form-control" readonly>
													</s:else>
												</div>
												<div class="col-lg-2">
													<s:if test='#session.user_rank >= "B"'>
														<a href="javascript:void(0);" onclick="adddate();">
															<img src="<%=request.getContextPath()%>/images/add.png" />
														</a>
														<a href="javascript:void(0);" onclick="deldate(this);">
															<img src="<%=request.getContextPath()%>/images/minus.png" />
														</a>
													</s:if>
												</div>
											</div>
										</s:if>
										<s:if test='updateBidDto.REGISTE_ST_DATE5 != null'>
											<div class="row">
												<div class="col-lg-4">
													<s:if test='#session.user_rank >= "B"'>
														<div class="input-group date" data-provide="datepicker">
															<input type="text" name="registeStDate" value="<s:date name="updateBidDto.REGISTE_ST_DATE5" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
															<div class="input-group-addon">
																<span class="glyphicon glyphicon-th"></span>
															</div>
														</div>
													</s:if>
													<s:else>
														<input type="text" name="registeStDate" value="<s:date name="updateBidDto.REGISTE_ST_DATE5" format="yyyy-MM-dd"/>" class="form-control" readonly>
													</s:else>
												</div>
												<label for="" class="col-lg-1 form-label to">---</label>
												<div class="col-lg-4">
													<s:if test='#session.user_rank >= "B"'>
														<div class="input-group date" data-provide="datepicker">
															<input type="text" name="registeEdDate" value="<s:date name="updateBidDto.REGISTE_ED_DATE5" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
															<div class="input-group-addon">
																<span class="glyphicon glyphicon-th"></span>
															</div>
														</div>
													</s:if>
													<s:else>
														<input type="text" name="registeEdDate" value="<s:date name="updateBidDto.REGISTE_ED_DATE5" format="yyyy-MM-dd"/>" class="form-control" readonly>
													</s:else>
												</div>
												<div class="col-lg-2">
													<s:if test='#session.user_rank >= "B"'>
														<a href="javascript:void(0);" onclick="adddate();">
															<img src="<%=request.getContextPath()%>/images/add.png" />
														</a>
														<a href="javascript:void(0);" onclick="deldate(this);">
															<img src="<%=request.getContextPath()%>/images/minus.png" />
														</a>
													</s:if>
												</div>
											</div>
										</s:if>
									</div>
								</div>
								<div class="col-lg-12 form-group">
									<label class="col-lg-1 form-label">报名要求</label>
									<div class="col-lg-11">
										<s:if test='#session.user_rank >= "B"'>
											<textarea id="tmpAPPLY_REQUIRE" class="form-control"><s:property value="updateBidDto.APPLY_REQUIRE" /></textarea>
										</s:if>
										<s:else>
											<textarea id="tmpAPPLY_REQUIRE" class="form-control" disabled="disabled"><s:property value="updateBidDto.APPLY_REQUIRE" /></textarea>
										</s:else>
									</div>
								</div>
								<div class="col-lg-12 form-group">
									<label class="col-lg-1 form-label">保证金</label>
									<div class="col-lg-8">
										<s:if test='#session.user_rank >= "B"'>
											<s:textfield name="updateBidDto.BID_BOND" id="BID_BOND" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
										</s:if>
										<s:else>
											<s:textfield name="updateBidDto.BID_BOND" disabled="true" id="BID_BOND" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
										</s:else>
									</div>
									<label for="" class="col-lg-3 form-label" style="text-align:left;">万元</label>
								</div>
							</div>
							<div class="operationBtns">
								<button type="button" onclick="exportBidRegister();" class="btn btn-success">生成报名表</button>
								<button type="button" class="btn btn-success" onclick="exportBidAudit();">生成审核表</button>
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
											<th>组织机构代码</th>
											<th>法定代表人</th>
											<th>项目负责人</th>
											<th>项目负责人联系方式</th>
											<th>联系人</th>
											<th>联系人联系方式</th>
											<th>邮箱</th>
											<th>固定电话</th>
											<th>传真</th>
											<th>固定资产</th>
											<th colspan="3">报名内容</th>
										</tr>
									</thead>
									<tbody id="bidCompBody">
										<s:iterator id="listBidComp" value="listBidComp" status="st1">
											<tr onclick="checkRadioTr(this, event);">
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
													<input id="bidCompApply_<s:property value="BID_CO_NO"/>" type="hidden" value="<s:property value="showBidCompApply"/>"/>
													<input id="saveBidCompApply_<s:property value="BID_CO_NO"/>" type="hidden" value="<s:property value="showBidCompApply"/>"/>
													<input type="hidden" value="<s:property value="BID_CO_LEGAL"/>"/>
													<input type="hidden" value="<s:property value="BID_CO_ORGCODE"/>"/>
													<input type="hidden" value="<s:property value="BID_CO_PRO_TEL"/>"/>
													<input type="hidden" value="<s:property value="BID_CO_PRO_MANAGER"/>"/>
													<input type="hidden" value="<s:property value="BID_CO_LANDLINE_TEL"/>"/>
													<input type="hidden" value="<s:property value="BID_CO_FAX"/>"/>
													<input type="hidden" value="<s:property value="BID_CO_FUND"/>"/>
												</td>
												<td><s:property value="%{#st1.index + 1}"/></td>
												<td><s:property value="BID_CO_NAME"/></td>
												<td><s:property value="BID_CO_ORGCODE"/></td>
												<td><s:property value="BID_CO_LEGAL"/></td>
												<td><s:property value="BID_CO_PRO_MANAGER"/></td>
												<td><s:property value="BID_CO_PRO_TEL"/></td>
												<td><s:property value="BID_CO_MANAGER"/></td>
												<td><s:property value="BID_CO_TEL"/></td>
												<td><s:property value="BID_CO_PS"/></td>
												<td><s:property value="BID_CO_LANDLINE_TEL"/></td>
												<td><s:property value="BID_CO_FAX"/></td>
												<td><s:property value="BID_CO_FUND"/></td>
												<td>
													<s:if test="BID_CO_NO != null">
														<button type="button" onclick="setApplyContent('<s:property value="BID_CO_NO"/>');" class="btn btn-success">报名内容</button>
														<button type="button" onclick="exportSingleBidRegister('<s:property value="BID_CO_NO"/>');" class="btn btn-success">打印报名表</button>
														<button type="button" onclick="exportSingleBidRegisterReturn('<s:property value="BID_CO_NO"/>');" class="btn btn-success">打印报名回执</button>
													</s:if>
												</td>
											</tr>
										</s:iterator>
									</tbody>
								</table>
							</div>
							<div class="operationBtns">
								<button type="button" onclick="exportBidRegister();" class="btn btn-success">生成报名表</button>
								<button type="button" onclick="exportBidAudit();" class="btn btn-success">生成审核表</button>
							</div>
						</div>
						<div class="tab-pane fade" id="tab4">
							<div class="row" style="margin-top: 20px;">
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">开标时间</label>
									<div class="col-lg-9">
										<div class="input-group date" data-provide="datepicker">
											<input id="tmpTENDER_OPEN_DATE" onchange="setTENDER_VERIFY_DATE(this);" value="<s:date name="updateBidDto.TENDER_OPEN_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">开评标地点</label>
									<div class="col-lg-9">
										<s:textfield name="updateBidDto.TENDER_OPEN_ADDRESS" id="TENDER_OPEN_ADDRESS" cssClass="form-control" maxlength="100" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">评审人</label>
									<div class="col-lg-9">
										<select class="form-control" id="BID_AUTH" name="updateBidDto.BID_AUTH">
											<option value="" selected="selected">请选择</option>
											<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
												<option value="<s:property value="LOGIN_ID"/>" <s:if test="%{updateBidDto.BID_AUTH == LOGIN_ID}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
											</s:iterator>
										</select>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">评标时间</label>
									<div class="col-lg-9">
										<div class="input-group date" data-provide="datepicker">
											<input id="tmpTENDER_VERIFY_DATE" value="<s:date name="updateBidDto.TENDER_VERIFY_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">限价</label>
									<div class="col-lg-7">
										<s:textfield name="updateBidDto.BID_LIMIT_PRICE" id="BID_LIMIT_PRICE" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
									</div>
									<label for="" class="col-lg-1 form-label" style="text-align:left;">万元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-3 form-label">代理费</label>
									<div class="col-lg-7">
										<s:if test='#session.user_rank >= "B"'>
											<s:textfield name="updateBidDto.BID_AGENT_PRICE" id="BID_AGENT_PRICE" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
										</s:if>
										<s:else>
											<s:textfield name="updateBidDto.BID_AGENT_PRICE" disabled="true" id="BID_AGENT_PRICE" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
										</s:else>
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
												<input name="tmpBID_CO_NO1" type="hidden" value="<s:property value="BID_CO_NO"/>">
												<div class="col-lg-8">
													<input name="tmpBidPrice" type="text" onchange="setBidCheckPrice(this);" value="<s:property value="BID_PRICE"/>" maxlength="18" class="form-control">
												</div>
												<label for="" class="col-lg-1 form-label">万元</label>
											</td>
											<td>
												<div class="col-lg-8">
													<input name="tmpBidCheckPrice" type="text" value="<s:property value="BID_CHECK_PRICE"/>" maxlength="18" class="form-control">
												</div>
												<label for="" class="col-lg-1 form-label">万元</label>
											</td>
											<td>
												<s:if test='%{BID_RESULT == "1"}'>
													<input name="tmpBID_RESULT_<s:property value="BID_CO_NO"/>" onclick="selectResult(this);" type="checkbox" checked="checked" value="1" />
												</s:if>
												<s:else>
													<input name="tmpBID_RESULT_<s:property value="BID_CO_NO"/>" onclick="selectResult(this);" type="checkbox" value="0" />
												</s:else>
											</td>
											<td>
												<div class="col-lg-8">
													<input name="tmpBidWinPrice" type="text" value="<s:property value="BID_WIN_PRICE"/>" maxlength="18" class="form-control">
												</div>
												<label for="" class="col-lg-1 form-label">万元</label>
											</td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
							<div class="row">
								<div class="col-lg-4">专家名单</div>
								<div class="col-lg-4">
									<label for="" class="col-lg-3 form-label">专家通知时间&nbsp;&nbsp;</label>
									<div class="input-group date" data-provide="datepicker">
										<input name="updateBidDto.BID_EXPERT_NOTIFY_DATE"  id="BID_EXPERT_NOTIFY_DATE" value="<s:date name="updateBidDto.BID_EXPERT_NOTIFY_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
										<div class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</div>
									</div>
								</div>
								<div class="col-lg-4">
									<label for="" class="col-lg-3 form-label">专家费支出</label>
									<div class="col-lg-6">
										<input type="text" disabled="disabled" class="form-control" value="<s:property value="updateBidDto.BID_EXPERT_COMMISION_ACT_YUAN" />">
									</div>
									<label for="" class="col-lg-3 form-label" style="text-align:left;">元</label>
								</div>
							</div>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th></th>
										<th style="display: none;"></th>
										<th>序号</th>
										<th>姓名</th>
										<th>就职公司</th>
										<th>专业</th>
										<th>职称</th>
										<th>联系方式</th>
									</tr>
								</thead>
								<tbody id="bidExpertLibBody">
									<s:iterator id="listExpertLib" value="listExpertLib" status="st1">
										<tr onclick="checkRadioTr(this, event);">
											<td><input type="radio" name="bidExpertLibRadio" value="<s:property value="EXPERT_SEQ"/>"></td>
											<td style="display: none;">
												<input type="hidden" value="<s:property value="EXPERT_SEQ"/>" />
												<input type="hidden" value="<s:property value="EXPERT_NAME"/>" />
												<input type="hidden" value="<s:property value="EXPERT_COMP"/>" />
												<input type="hidden" value="<s:property value="EXPERT_MAJOR"/>" />
												<input type="hidden" value="<s:property value="EXPERT_MAJOR_NAME"/>" />
												<input type="hidden" value="<s:property value="EXPERT_QULI"/>" />
												<input type="hidden" value="<s:property value="EXPERT_TEL1"/>" />
											</td>
											<td><s:property value="%{#st1.index + 1}"/></td>
											<td><s:property value="EXPERT_NAME"/></td>
											<td><s:property value="EXPERT_COMP"/></td>
											<td><s:property value="EXPERT_MAJOR_NAME"/></td>
											<td><s:property value="EXPERT_QULI"/></td>
											<td><s:property value="EXPERT_TEL1"/></td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
							<div class="operationBtns">
								<button type="button" class="btn btn-success" onclick="showSelectExpertLib();">选择专家</button>
								<button type="button" class="btn btn-danger" onclick="delExpertLib();">删除</button>
							</div>
						</div>
						<div class="tab-pane fade" id="tab5">
							<div class="col-lg-4 form-group" style="margin-top: 20px;">
								<label for="" class="col-lg-3 form-label">保证金</label>
								<div class="col-lg-7">
									<input type="text" class="form-control" maxlength="18" disabled="disabled" value="<s:property value="updateBidDto.BID_BOND"/>">
								</div>
								<label for="" class="col-lg-1 form-label" style="text-align:left;">万元</label>
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
											<td>
												<input name="tmpBID_CO_NO2" type="hidden" value="<s:property value="BID_CO_NO"/>">
												<s:property value="BID_CO_NAME"/>
											</td>
											<td>
												<div class="input-group date" data-provide="datepicker">
													<input type="text" name="tmpBID_VALUE_DATE" value="<s:date name="BID_VALUE_DATE" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
													<div class="input-group-addon">
														<span class="glyphicon glyphicon-th"></span>
													</div>
												</div>
											</td>
											<td>
												<select name="tmpBID_PAYMENT_TYPE" class="form-control">
													<s:if test='BID_PAYMENT_TYPE == "1"'>
														<option value="0">未支付</option>
														<option value="1" selected="selected">现金</option>
														<option value="2">支票</option>
														<option value="3">转账</option>
														<option value="4">汇票</option>
														<option value="5">保函</option>
														<option value="6">现金2</option>
														<option value="9">/</option>
													</s:if>
													<s:elseif test='BID_PAYMENT_TYPE == "2"'>
														<option value="0">未支付</option>
														<option value="1">现金</option>
														<option value="2" selected="selected">支票</option>
														<option value="3">转账</option>
														<option value="4">汇票</option>
														<option value="5">保函</option>
														<option value="6">现金2</option>
														<option value="9">/</option>
													</s:elseif>
													<s:elseif test='BID_PAYMENT_TYPE == "3"'>
														<option value="0">未支付</option>
														<option value="1">现金</option>
														<option value="2">支票</option>
														<option value="3" selected="selected">转账</option>
														<option value="4">汇票</option>
														<option value="5">保函</option>
														<option value="6">现金2</option>
														<option value="9">/</option>
													</s:elseif>
													<s:elseif test='BID_PAYMENT_TYPE == "4"'>
														<option value="0">未支付</option>
														<option value="1">现金</option>
														<option value="2">支票</option>
														<option value="3">转账</option>
														<option value="4" selected="selected">汇票</option>
														<option value="5">保函</option>
														<option value="6">现金2</option>
														<option value="9">/</option>
													</s:elseif>
													<s:elseif test='BID_PAYMENT_TYPE == "5"'>
														<option value="0">未支付</option>
														<option value="1">现金</option>
														<option value="2">支票</option>
														<option value="3">转账</option>
														<option value="4">汇票</option>
														<option value="5" selected="selected">保函</option>
														<option value="6">现金2</option>
														<option value="9">/</option>
													</s:elseif>
													<s:elseif test='BID_PAYMENT_TYPE == "6"'>
														<option value="0">未支付</option>
														<option value="1">现金</option>
														<option value="2">支票</option>
														<option value="3">转账</option>
														<option value="4">汇票</option>
														<option value="5">保函</option>
														<option value="6" selected="selected">现金2</option>
														<option value="9">/</option>
													</s:elseif>
													<s:elseif test='BID_PAYMENT_TYPE == "9"'>
														<option value="0">未支付</option>
														<option value="1">现金</option>
														<option value="2">支票</option>
														<option value="3">转账</option>
														<option value="4">汇票</option>
														<option value="5">保函</option>
														<option value="6">现金2</option>
														<option value="9" selected="selected">/</option>
													</s:elseif>
													<s:else>
														<option selected="selected" value="0">未支付</option>
														<option value="1">现金</option>
														<option value="2">支票</option>
														<option value="3">转账</option>
														<option value="4">汇票</option>
														<option value="5">保函</option>
														<option value="6">现金2</option>
														<option value="9">/</option>
													</s:else>
												</select>
											</td>
											<td>
												<select name="tmpREFOUND_BOND_STATUS" class="form-control">
													<option value="">请选择</option>
													<s:if test='REFOUND_BOND_STATUS == "1"'>
														<option value="1" selected="selected">审批</option>
														<option value="2">审批完了</option>
													</s:if>
													<s:elseif test='REFOUND_BOND_STATUS == "2"'>
														<option value="1">审批</option>
														<option value="2" selected="selected">审批完了</option>
													</s:elseif>
													<s:else>
														<option value="1">审批</option>
														<option value="2">审批完了</option>
													</s:else>
												</select>
											</td>
											<td>
												<div class="input-group date" data-provide="datepicker">
													<input type="text" name="tmpREFOUND_DEPOSIT_DATE" value="<s:date name="REFOUND_DEPOSIT_DATE" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
													<div class="input-group-addon">
														<span class="glyphicon glyphicon-th"></span>
													</div>
												</div>
											</td>
											<td id="file_td_<s:property value="BID_CO_NO"/>">
												<input name="tmpRECEPT_UL_FILE1" id="tmpRECEPT_UL_FILE1_<s:property value="BID_CO_NO"/>" type="hidden" value="<s:property value="RECEPT_UL_FILE1"/>">
												<input name="tmpRECEPT_UL_FILE1_BASENAME" id="tmpRECEPT_UL_FILE1_BASENAME_<s:property value="BID_CO_NO"/>" type="hidden" value="<s:property value="RECEPT_UL_FILE1_BASENAME"/>">
												<s:if test="BID_CO_NO != null">
													<a href="javascript:void(0);" onclick="showUploadModel(this, '<s:property value="BID_CO_NO"/>');">文件上传</a>
													<s:if test='RECEPT_UL_FILE1 != null && RECEPT_UL_FILE1 != ""'>
														<s:if test='RECEPT_UL_FILE1_BASENAME != null && RECEPT_UL_FILE1_BASENAME != ""'>
															<a id="preview_<s:property value="BID_CO_NO"/>" target="_blank" href="<s:property value="file_url"/><s:property value="RECEPT_UL_FILE1"/>"><s:property value="RECEPT_UL_FILE1_BASENAME"/></a>
														</s:if>
														<s:else>
															<a id="preview_<s:property value="BID_CO_NO"/>" target="_blank" href="<s:property value="file_url"/><s:property value="RECEPT_UL_FILE1"/>">预览</a>
														</s:else>
														<a id="del_file_<s:property value="BID_CO_NO"/>" href="javascript:void(0);" onclick="delFile(this,'<s:property value="BID_CO_NO"/>');">删除</a>
													</s:if>
													<s:else>
													</s:else>
												</s:if>
											</td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
							<div class="operationBtns">
								<button type="button" onclick="exportBidDeposit();" class="btn btn-success">保证金收据</button>
								<button type="button" onclick="exportBidCancel();" class="btn btn-success">退定签收单</button>
							</div>
						</div>
						<div class="tab-pane fade" id="tab6">
							<div class="col-lg-4 form-group" style="margin-top: 20px;">
								<label for="" class="col-lg-3 form-label">标书费金额</label>
								<div class="col-lg-7">
									<s:textfield name="updateBidDto.BID_APPLY_PRICE" id="BID_APPLY_PRICE" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
								</div>
								<label for="" class="col-lg-1 form-label" style="text-align:left;">万元</label>
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
										<th style="display:none">发票编号22</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator id="listBidComp" value="listBidComp" status="st1">
										<tr>
											<td><s:property value="%{#st1.index + 1}"/></td>
											<td>
												<input name="tmpBID_CO_NO3" type="hidden" value="<s:property value="BID_CO_NO"/>">
												<s:property value="BID_CO_NAME"/>
											</td>
											<td>
												<div class="input-group date" data-provide="datepicker">
													<input type="text" name="tmpBID_APPLY_PRICE_DATE" value="<s:date name="BID_APPLY_PRICE_DATE" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
													<div class="input-group-addon">
														<span class="glyphicon glyphicon-th"></span>
													</div>
												</div>
											</td>
											<td>
												<select name="tmpBID_APPLY_PAYMENT_TYPE" class="form-control">
													<s:if test='BID_APPLY_PAYMENT_TYPE == "1"'>
														<option value="0">未支付</option>
														<option value="1" selected="selected">现金</option>
														<option value="3">转账</option>
														<option value="9">/</option>
													</s:if>
													<s:elseif test='BID_APPLY_PAYMENT_TYPE == "3"'>
														<option value="0">未支付</option>
														<option value="1">现金</option>
														<option value="3" selected="selected">转账</option>
														<option value="9">/</option>
													</s:elseif>
													<s:elseif test='BID_APPLY_PAYMENT_TYPE == "9"'>
														<option value="0">未支付</option>
														<option value="1">现金</option>
														<option value="3">转账</option>
														<option value="9" selected="selected">/</option>
													</s:elseif>
													<s:else>
														<option value="0" selected="selected">未支付</option>
														<option value="1">现金</option>
														<option value="3">转账</option>
														<option value="9">/</option>
													</s:else>
												</select>
											</td>
											<td>
												<select name="tmpINVOICE_TYPE" class="form-control">
													<option value="0">请选择</option>
													<s:if test='INVOICE_TYPE == "1"'>
														<option value="1" selected="selected">专票</option>
														<option value="2">普票</option>
													</s:if>
													<s:elseif test='INVOICE_TYPE == "2"'>
														<option value="1">专票</option>
														<option value="2" selected="selected">普票</option>
													</s:elseif>
													<s:else>
														<option value="1">专票</option>
														<option value="2">普票</option>
													</s:else>
												</select>
											</td>
											<td>
												<div class="input-group date" data-provide="datepicker">
													<input type="text" name="tmpINVOICE_DATE" value="<s:date name="INVOICE_DATE" format="yyyy-MM-dd"/>" class="form-control datepicker" readonly>
													<div class="input-group-addon">
														<span class="glyphicon glyphicon-th"></span>
													</div>
												</div>
											</td>
											<td style="display:none">
												<input name="tmpBID_RECEIPT_NO" type="text" value="<s:property value="BID_RECEIPT_NO"/>" class="form-control">
											</td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
							<div class="operationBtns">
								<button type="button" onclick="exportBidBase();" class="btn btn-success">标书费收据</button>
								<button type="button" onclick="exportBidSign();" class="btn btn-success">中标签收单</button>
								<button type="button" onclick="exportBidReceive();" class="btn btn-success">标书费签收单</button>
							</div>
						</div>
						<div class="tab-pane fade" id="tab7">
							<div class="row" style="margin-top: 20px;">
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">保证金</label>
									<div class="col-lg-7">
										<input type="text" value="<s:property value="updateBidDto.BID_BOND"/>" class="form-control" readonly="readonly">
									</div>
									<label for="" class="col-lg-1 form-label" style="text-align:left;">万元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">承接项目日期</label>
									<div class="col-lg-8">
										<input type="text" value="<s:date name="updateBidDto.PROJECT_DEVIEW_DATE" format="yyyy-MM-dd" />" class="form-control" readonly="readonly">
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">项目性质</label>
									<div class="col-lg-8">
										<s:if test='updateBidDto.PROJECT_PROPERTY == "1"'>
											<input type="text" class="form-control" value="成本内" readonly="readonly">
										</s:if>
										<s:elseif test='updateBidDto.PROJECT_PROPERTY == "2"'>
											<input type="text" class="form-control" value="成本外" readonly="readonly">
										</s:elseif>
										<s:elseif test='updateBidDto.PROJECT_PROPERTY == "3"'>
											<input type="text" class="form-control" value="单独立项" readonly="readonly">
										</s:elseif>
										<s:elseif test='updateBidDto.PROJECT_PROPERTY == "4"'>
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
										<select class="form-control" disabled="disabled">
											<option value="" selected="selected">请选择</option>
											<s:iterator id="listSuperviseLib" value="listSuperviseLib" status="st1">
												<option value="<s:property value="SUPERVISE_SEQ"/>" <s:if test="%{updateBidDto.PROJECT_AUTH == SUPERVISE_SEQ}">selected</s:if>><s:property value="SUPERVISE_NAME"/></option>
											</s:iterator>
										</select>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">代理费支付方</label>
									<div class="col-lg-8">
										<s:if test='updateBidDto.BID_AGENT_PAY == "1"'>
											<input type="text" class="form-control" value="委托单位" readonly="readonly">
										</s:if>
										<s:elseif test='updateBidDto.BID_AGENT_PAY == "2"'>
											<input type="text" class="form-control" value="中标单位" readonly="readonly">
										</s:elseif>
										<s:elseif test='updateBidDto.BID_AGENT_PAY == "3"'>
											<input type="text" class="form-control" value="申通集团" readonly="readonly">
										</s:elseif>
										<s:elseif test='updateBidDto.BID_AGENT_PAY == "4"'>
											<input type="text" class="form-control" value="维保公司" readonly="readonly">
										</s:elseif>
										<s:else>
											<input type="text" class="form-control" value="" readonly="readonly">
										</s:else>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">应收代理费</label>
									<div class="col-lg-7">
										<input type="text" class="form-control" value="<s:property value="updateBidDto.BID_AGENT_PRICE"/>" readonly="readonly"/>
									</div>
									<label for="" class="col-lg-1 form-label" style="text-align:left;">万元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">中标单位</label>
									<div class="col-lg-8">
										<s:textfield name="updateBidDto.BID_CO_NAME" id="BID_CO_NAME" disabled="true" cssClass="form-control" theme="simple"></s:textfield>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">开票日期</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="tmpRECEIPT1_DATE" value="<s:date name="updateBidDto.RECEIPT1_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">实收代理费</label>
									<div class="col-lg-7">
										<s:textfield name="updateBidDto.BID_AGENT_PRICE_ACT" id="BID_AGENT_PRICE_ACT" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
									</div>
									<label for="" class="col-lg-1 form-label" style="text-align:left;">万元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">中标金额</label>
									<div class="col-lg-7">
										<s:textfield name="updateBidDto.BID_PRICE_LIST" id="BID_PRICE_LIST" disabled="true" cssClass="form-control" theme="simple"></s:textfield>
									</div>
									<label for="" class="col-lg-1 form-label" style="text-align:left;">万元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">到账日期</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="tmpRECEIPT1_VALUE_DATE" value="<s:date name="updateBidDto.RECEIPT1_VALUE_DATE" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">代理费发票</label>
									<div class="col-lg-7">
										<s:textfield name="updateBidDto.BID_AGENT_PRICE_INVOICE" id="BID_AGENT_PRICE_INVOICE" cssClass="form-control" theme="simple"></s:textfield>
									</div>
								</div>								
							</div>
						</div>
						<div class="tab-pane fade" id="tab8">
							<div class="row" style="margin-top: 20px;">
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">开评标日期</label>
									<div class="col-lg-8">
										<input type="text" value="<s:date name="updateBidDto.TENDER_VERIFY_DATE" format="yyyy-MM-dd" />" class="form-control" readonly="readonly">
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">预借费用1</label>
									<div class="col-lg-7">
										<s:textfield name="updateBidDto.BID_EXPERT_COMMISION_PRE_YUAN1" id="BID_EXPERT_COMMISION_PRE_YUAN1" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
									</div>
									<label for="" class="col-lg-1 form-label" style="text-align:left;">元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">申请日期1</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="tmpBID_EXPERT_COMMISION_PRE_DATE1" value="<s:date name="updateBidDto.BID_EXPERT_COMMISION_PRE_DATE1" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">申请人</label>
									<div class="col-lg-8">
										<select name="updateBidDto.BID_EXPERT_COMMISION_APPLY" id="BID_EXPERT_COMMISION_APPLY" class="form-control">
								 			<option value="" selected="selected">请选择</option>
											<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
												<option value="<s:property value="LOGIN_ID"/>" <s:if test="%{updateBidDto.BID_EXPERT_COMMISION_APPLY == LOGIN_ID}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
											</s:iterator>
										</select>
									</div>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">实际费用1</label>
									<div class="col-lg-7">
										<s:textfield name="updateBidDto.BID_EXPERT_COMMISION_ACT_YUAN1" id="BID_EXPERT_COMMISION_ACT_YUAN1" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
									</div>
									<label for="" class="col-lg-1 form-label" style="text-align:left;">元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">差价退还日期1</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="tmpBID_EXPERT_COMMISION_DIFF_DATE1" value="<s:date name="updateBidDto.BID_EXPERT_COMMISION_DIFF_DATE1" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div>
								<div class="col-lg-4 form-group">
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">预借费用2</label>
									<div class="col-lg-7">
										<s:textfield name="updateBidDto.BID_EXPERT_COMMISION_PRE_YUAN2" id="BID_EXPERT_COMMISION_PRE_YUAN2" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
									</div>
									<label for="" class="col-lg-1 form-label" style="text-align:left;">元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">申请日期2</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="tmpBID_EXPERT_COMMISION_PRE_DATE2" value="<s:date name="updateBidDto.BID_EXPERT_COMMISION_PRE_DATE2" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">实际费用2</label>
									<div class="col-lg-7">
										<s:textfield name="updateBidDto.BID_EXPERT_COMMISION_ACT_YUAN2" id="BID_EXPERT_COMMISION_ACT_YUAN2" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
									</div>
									<label for="" class="col-lg-1 form-label" style="text-align:left;">元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">差价退还日期2</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="tmpBID_EXPERT_COMMISION_DIFF_DATE2" value="<s:date name="updateBidDto.BID_EXPERT_COMMISION_DIFF_DATE2" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div>

								<div class="col-lg-4 form-group">
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">预借费用3</label>
									<div class="col-lg-7">
										<s:textfield name="updateBidDto.BID_EXPERT_COMMISION_PRE_YUAN3" id="BID_EXPERT_COMMISION_PRE_YUAN3" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
									</div>
									<label for="" class="col-lg-1 form-label" style="text-align:left;">元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">申请日期3</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="tmpBID_EXPERT_COMMISION_PRE_DATE3" value="<s:date name="updateBidDto.BID_EXPERT_COMMISION_PRE_DATE3" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 form-group">
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">实际费用3</label>
									<div class="col-lg-7">
										<s:textfield name="updateBidDto.BID_EXPERT_COMMISION_ACT_YUAN3" id="BID_EXPERT_COMMISION_ACT_YUAN3" cssClass="form-control" maxlength="18" theme="simple"></s:textfield>
									</div>
									<label for="" class="col-lg-1 form-label" style="text-align:left;">元</label>
								</div>
								<div class="col-lg-4 form-group">
									<label for="" class="col-lg-4 form-label">差价退还日期3</label>
									<div class="col-lg-8">
										<div class="input-group date" data-provide="datepicker">
											<input id="tmpBID_EXPERT_COMMISION_DIFF_DATE3" value="<s:date name="updateBidDto.BID_EXPERT_COMMISION_DIFF_DATE3" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
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
						<button type="button" class="btn btn-success" onclick="upd();">保存</button>
						<button type="button" class="btn btn-success" onclick="goBidList();">返回</button>
						&nbsp;&nbsp;<button type="button" class="btn btn-success" onclick="progress('<s:property value="updateBidDto.BID_NO"/>');">项目状态</button>
					</div>
			</div>
		</s:form>
	</div>
	<!-- 模拟模态框 -->
	<div class="modal fade" id="expertCompModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 1050;">
		<div class="modal-dialog" style="width: 700px;">
			<div class="modal-content">
				<form enctype="multipart/form-data" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							就职公司一览
						</h4>
					</div>
					<div class="modal-body" style="height: 300px; overflow-y: auto;">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th></th>
									<th>就职公司名称</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator id="listExpertComp" value="listExpertComp" status="st1">
								<tr onclick="checkCheckboxTr(this, event);">
									<td><input name="expertCompKey" type="checkbox" value="<s:property value="EXPERT_COMP"/>"/></td>
									<td><s:property value="EXPERT_COMP"/></td>
								</tr>
								</s:iterator>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="selectExpertComp();">确定</button>
						<button type="button" class="btn btn-primary" onclick="cancelExpertComp();">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="expertLibModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 1045;">
		<div class="modal-dialog" style="width: 1000px;">
			<div class="modal-content">
				<form class="form-horizontal" role="form">
					<input type="hidden" id="expertMajorQuery" name="expertMajorQuery"/>
					<input type="hidden" id="strIsRandom" name="strIsRandom"/>
					<input type="hidden" id="strIsInclude" name="strIsInclude"/>
					<input type="hidden" id="majorNum11" name="majorNum11"/>
					<input type="hidden" id="majorNum12" name="majorNum12"/>
					<input type="hidden" id="majorNum13" name="majorNum13"/>
					<input type="hidden" id="majorNum14" name="majorNum14"/>
					<input type="hidden" id="majorNum15" name="majorNum15"/>
					<input type="hidden" id="majorNum21" name="majorNum21"/>
					<input type="hidden" id="majorNum22" name="majorNum22"/>
					<input type="hidden" id="majorNum23" name="majorNum23"/>
					<input type="hidden" id="majorNum24" name="majorNum24"/>
					<input type="hidden" id="majorNum25" name="majorNum25"/>
					<input type="hidden" id="majorNum31" name="majorNum31"/>
					<input type="hidden" id="majorNum32" name="majorNum32"/>
					<input type="hidden" id="majorNum33" name="majorNum33"/>
					<input type="hidden" id="majorNum34" name="majorNum34"/>
					<input type="hidden" id="majorNum35" name="majorNum35"/>
					<input type="hidden" id="majorNum41" name="majorNum41"/>
					<input type="hidden" id="majorNum42" name="majorNum42"/>
					<input type="hidden" id="majorNum43" name="majorNum43"/>
					<input type="hidden" id="majorNum44" name="majorNum44"/>
					<input type="hidden" id="majorNum45" name="majorNum45"/>
					<input type="hidden" id="majorNum51" name="majorNum51"/>
					<input type="hidden" id="majorNum52" name="majorNum52"/>
					<input type="hidden" id="majorNum53" name="majorNum53"/>
					<input type="hidden" id="majorNum54" name="majorNum54"/>
					<input type="hidden" id="majorNum55" name="majorNum55"/>
					<input type="hidden" id="strMajor11" name="strMajor11"/>
					<input type="hidden" id="strMajor12" name="strMajor12"/>
					<input type="hidden" id="strMajor13" name="strMajor13"/>
					<input type="hidden" id="strMajor14" name="strMajor14"/>
					<input type="hidden" id="strMajor15" name="strMajor15"/>
					<input type="hidden" id="strMajor21" name="strMajor21"/>
					<input type="hidden" id="strMajor22" name="strMajor22"/>
					<input type="hidden" id="strMajor23" name="strMajor23"/>
					<input type="hidden" id="strMajor24" name="strMajor24"/>
					<input type="hidden" id="strMajor25" name="strMajor25"/>
					<input type="hidden" id="strMajor31" name="strMajor31"/>
					<input type="hidden" id="strMajor32" name="strMajor32"/>
					<input type="hidden" id="strMajor33" name="strMajor33"/>
					<input type="hidden" id="strMajor34" name="strMajor34"/>
					<input type="hidden" id="strMajor35" name="strMajor35"/>
					<input type="hidden" id="strMajor41" name="strMajor41"/>
					<input type="hidden" id="strMajor42" name="strMajor42"/>
					<input type="hidden" id="strMajor43" name="strMajor43"/>
					<input type="hidden" id="strMajor44" name="strMajor44"/>
					<input type="hidden" id="strMajor45" name="strMajor45"/>
					<input type="hidden" id="strMajor51" name="strMajor51"/>
					<input type="hidden" id="strMajor52" name="strMajor52"/>
					<input type="hidden" id="strMajor53" name="strMajor53"/>
					<input type="hidden" id="strMajor54" name="strMajor54"/>
					<input type="hidden" id="strMajor55" name="strMajor55"/>
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							专家信息查询
						</h4>
					</div>
					<div class="modal-body">
						<div class="col-lg-1 checkBox" style="z-index: 19;">
							<input id="exportrandom" type="checkbox" onclick="isRandom(this);"/>随机
						</div>
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-4 form-label">专家姓名</label>
							<div class="col-lg-8">
								<div class="input-group">
									<input id="strExpertName" maxlength="24" type="text" class="form-control">
								</div>
							</div>
						</div>
						<div class="col-lg-2 checkBox" style="z-index: 19;">
							<input id="include" type="checkbox"/>不包含
						</div>
						<div class="col-lg-6 form-group" style="z-index: 19;">
							<label for="" class="col-lg-2 form-label">单位选择</label>
							<div class="col-lg-8">
								<div class="input-group">
									<input id="strExpertComp" type="text" style="width: 250px;" class="form-control">
								</div>
							</div>
							<div class="col-lg-2" style="z-index: 11;">
								<button id="selectExpertCompBtn" type="button" class="btn btn-success" onclick="showSelectExpertComp();">选择</button>
							</div>
						</div>
						<div class="col-lg-2 form-group" style="z-index: 20; float: right;">
							<button type="button" class="btn btn-success form-control" onclick="queryExpertAjax();">检索</button>
						</div>
						<div class="col-lg-1 form-group" style="z-index: 20; float: left;">
							<label for="" class="form-label">专业</label>
						</div>
					</div>
					<div class="modal-body" style="height: 330px; width:100%;">
						<table class="table table-bordered">
							<tr>
								<td width="150" align="center">一级</td>
								<td width="40" align="center">人数</td>
								<td width="150" align="center">二级</td>
								<td width="40" align="center">人数</td>
								<td width="150" align="center">三级</td>
								<td width="40" align="center">人数</td>
								<td width="150" align="center">四级</td>
								<td width="40" align="center">人数</td>
							</tr>
							<tr>
								<td>
									<select id="tmpMajor11" style="width: 145px;" onchange="selectMajor('1', '1');">
										<option value="" selected="selected">请选择</option>
										<s:iterator id="major11List" value="major11List" status="st1">
											<option value="<s:property value="MAJORCODE"/>"><s:property value="MAJORNAME"/></option>
										</s:iterator>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum11" disabled="disabled" value=""/>
								</td>
								<td>
									<select id="tmpMajor12" style="width: 145px;" disabled="disabled" onchange="selectMajor('1', '2');">
										<option value="" selected="selected">请选择</option>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum12" disabled="disabled" value=""/>
								</td>
								<td>
									<select id="tmpMajor13" style="width: 145px;" disabled="disabled" onchange="selectMajor('1', '3');">
										<option value="" selected="selected">请选择</option>
									</select>
								</td>
								<td>
										<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum13" disabled="disabled" value=""/>
								</td>
								<td>
									<select id="tmpMajor14" style="width: 145px;" disabled="disabled" onchange="selectMajor('1', '4');">
										<option value="" selected="selected">请选择</option>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum14" disabled="disabled" value=""/>
								</td>
							</tr>
							<s:if test="major11List != null && major11List.size() > 1">
							<tr>
							</s:if>
							<s:else>
							<tr style="display: none;">
							</s:else>
								<td>
									<select id="tmpMajor21" style="width: 145px;" onchange="selectMajor('2', '1');">
										<option value="" selected="selected">请选择</option>
										<s:iterator id="major21List" value="major21List" status="st1">
											<option value="<s:property value="MAJORCODE"/>"><s:property value="MAJORNAME"/></option>
										</s:iterator>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum21" disabled="disabled" value=""/>
								</td>
								<td>
									<select id="tmpMajor22" style="width: 145px;" disabled="disabled" onchange="selectMajor('2', '2');">
										<option value="" selected="selected">请选择</option>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum22" disabled="disabled" value=""/>
								</td>
								<td>
									<select id="tmpMajor23" style="width: 145px;" disabled="disabled" onchange="selectMajor('2', '3');">
										<option value="" selected="selected">请选择</option>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum23" disabled="disabled" value=""/>
								</td>
								<td>
									<select id="tmpMajor24" style="width: 145px;" disabled="disabled" onchange="selectMajor('2', '4');">
										<option value="" selected="selected">请选择</option>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum24" disabled="disabled" value=""/>
								</td>
							</tr>
							<s:if test="major11List != null && major11List.size() > 2">
							<tr>
							</s:if>
							<s:else>
							<tr style="display: none;">
							</s:else>
								<td>
									<select id="tmpMajor31" style="width: 145px;" onchange="selectMajor('3', '1');">
										<option value="" selected="selected">请选择</option>
										<s:iterator id="major31List" value="major31List" status="st1">
											<option value="<s:property value="MAJORCODE"/>"><s:property value="MAJORNAME"/></option>
										</s:iterator>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum31" disabled="disabled" value=""/>
								</td>
								<td>
									<select id="tmpMajor32" style="width: 145px;" disabled="disabled" onchange="selectMajor('3', '2');">
										<option value="" selected="selected">请选择</option>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum32" disabled="disabled" value=""/>
								</td>
								<td>
									<select id="tmpMajor33" style="width: 145px;" disabled="disabled" onchange="selectMajor('3', '3');">
										<option value="" selected="selected">请选择</option>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum33" disabled="disabled" value=""/>
								</td>
								<td>
									<select id="tmpMajor34" style="width: 145px;" disabled="disabled" onchange="selectMajor('3', '4');">
										<option value="" selected="selected">请选择</option>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum34" disabled="disabled" value=""/>
								</td>
							</tr>
							<s:if test="major11List != null && major11List.size() > 3">
							<tr>
							</s:if>
							<s:else>
							<tr style="display: none;">
							</s:else>
								<td>
									<select id="tmpMajor41" style="width: 145px;" onchange="selectMajor('4', '1');">
										<option value="" selected="selected">请选择</option>
										<s:iterator id="major41List" value="major41List" status="st1">
											<option value="<s:property value="MAJORCODE"/>"><s:property value="MAJORNAME"/></option>
										</s:iterator>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum41" disabled="disabled" value=""/>
								</td>
								<td>
									<select id="tmpMajor42" style="width: 145px;" disabled="disabled" onchange="selectMajor('4', '2');">
										<option value="" selected="selected">请选择</option>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum42" disabled="disabled" value=""/>
								</td>
								<td>
									<select id="tmpMajor43" style="width: 145px;" disabled="disabled" onchange="selectMajor('4', '3');">
										<option value="" selected="selected">请选择</option>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum43" disabled="disabled" value=""/>
								</td>
								<td>
									<select id="tmpMajor44" style="width: 145px;" disabled="disabled" onchange="selectMajor('4', '4');">
										<option value="" selected="selected">请选择</option>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum44" disabled="disabled" value=""/>
								</td>
							</tr>
							<s:if test="major11List != null && major11List.size() > 4">
							<tr>
							</s:if>
							<s:else>
							<tr style="display: none;">
							</s:else>
								<td>
									<select id="tmpMajor51" style="width: 145px;" onchange="selectMajor('5', '1');">
										<option value="" selected="selected">请选择</option>
										<s:iterator id="major51List" value="major51List" status="st1">
											<option value="<s:property value="MAJORCODE"/>"><s:property value="MAJORNAME"/></option>
										</s:iterator>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum51" disabled="disabled" value=""/>
								</td>
								<td>
									<select id="tmpMajor52" style="width: 145px;" disabled="disabled" onchange="selectMajor('5', '2');">
										<option value="" selected="selected">请选择</option>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum52" disabled="disabled" value=""/>
								</td>
								<td>
									<select id="tmpMajor53" style="width: 145px;" disabled="disabled" onchange="selectMajor('5', '3');">
										<option value="" selected="selected">请选择</option>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum53" disabled="disabled" value=""/>
								</td>
								<td>
									<select id="tmpMajor54" style="width: 145px;" disabled="disabled" onchange="selectMajor('5', '4');">
										<option value="" selected="selected">请选择</option>
									</select>
								</td>
								<td>
									<input type="text" style="width: 30px;" maxlength="2" id="tmpMajorNum54" disabled="disabled" value=""/>
								</td>
							</tr>
						</table>
					</div>
					<div class="modal-body" style="height: 350px; overflow-y: auto;">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th></th>
									<th style="display: none;"></th>
									<th>姓名</th>
									<th>专业</th>
									<th>职称</th>
									<th>手机电话</th>
									<th>性别</th>
									<th>就职公司</th>
								</tr>
							</thead>
							<tbody id="expertLibData">
								<tr onclick="checkCheckboxTr(this, event);">
									<td><input name="expertLibKey" type="checkbox" style="" value=""/></td>
									<td style="display: none;">
										<input type="hidden" value="">
									</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="8">
										<button type="button" class="btn btn-primary" onclick="selectExpertLib();">确定</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
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
						<div class="col-lg-3 form-group">
							<label for="" class="col-lg-4 form-label">合同编号</label>
							<div class="col-lg-8">
								<div class="input-group">
									<input id="strCNTRCT_NO" maxlength="20" type="text" class="form-control">
								</div>
							</div>
						</div>
						<!-- <div class="col-lg-3 form-group">
							<label for="" class="col-lg-4 form-label">合同简称</label>
							<div class="col-lg-8">
								<div class="input-group">
									<input id="strCNTRCT_NM" maxlength="20" type="text" class="form-control">
								</div>
							</div>
						</div> -->
						<div class="col-lg-3 form-group">
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
									<!-- <th>合同简称</th> -->
									<th>委托单位</th>
								</tr>
							</thead>
							<tbody id="bidCntrctData">
								<tr onclick="checkRadioTr(this, event);">
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
										<input type="hidden" value="">
										<input type="hidden" value="">
									</td>
									<td></td>
									<td></td>
									<!--  <td></td> -->
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
 <div>
  <input id="txt_search" type="text" style="width: 250px;display:none" />
  <div id="searchresult" style="display: none;">
  </div>
 </div>
				
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
							<label class="col-sm-3 control-label">单位名称</label>
							<div class="col-sm-8">
								<input type="hidden" id="tmpBidCompId" class="form-control">
								<input type="hidden" id="tmpBidCompSeq" class="form-control">
								<input type="text" id="tmpBidCompName" class="form-control" maxlength="40" placeholder="请输入单位名称">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">组织机构代码</label>
							<div class="col-sm-8">
								<input type="text" id="tmpBidCompOrgCode" class="form-control" maxlength="32" placeholder="请输入组织机构代码">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">企业注册资金（万元）</label>
							<div class="col-sm-8">
								<input type="text" id="tmpBidCompFund" class="form-control" maxlength="32" placeholder="请输入企业注册资金">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">法定代表人</label>
							<div class="col-sm-8">
								<input type="text" id="tmpBidCompLegal" class="form-control" maxlength="32" placeholder="请输入法定代表人">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">项目负责人</label>
							<div class="col-sm-8">
								<input type="text" id="tmpBidCompProManager" class="form-control" maxlength="10" placeholder="请输入项目负责人">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">项目负责人联系方式</label>
							<div class="col-sm-8">
								<input type="text" id="tmpBidCompProTel" class="form-control" maxlength="50" placeholder="请输入项目负责人联系方式">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">联系人</label>
							<div class="col-sm-8">
								<input type="text" id="tmpBidCompManager" class="form-control" maxlength="8" placeholder="请输入联系人">
							</div>
						</div>
						<input type="hidden" id="tmpBidCompAdd" name="tmpBidCompAdd"/>
						<!-- <div class="form-group">
							<label class="col-sm-3 control-label">联系人地址</label>
							<div class="col-sm-8">
								<input type="text"  id="tmpBidCompAdd" class="form-control" maxlength="25" placeholder="请输入联系人地址">
							</div>
						</div> -->
						<div class="form-group">
							<label class="col-sm-3 control-label">联系人联系方式</label>
							<div class="col-sm-8">
								<input type="text"  id="tmpBidCompTel" class="form-control" maxlength="50" placeholder="请输入联系人联系方式">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">邮箱</label>
							<div class="col-sm-8">
								<input type="text"  id="tmpBidCompPs" class="form-control" maxlength="100" placeholder="请输入邮箱">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">固定电话</label>
							<div class="col-sm-8">
								<input type="text"  id="tmpBidCompLandlineTel" class="form-control" maxlength="32" placeholder="请输入固定电话">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">传真</label>
							<div class="col-sm-8">
								<input type="text"  id="tmpBidCompFax" class="form-control" maxlength="32" placeholder="请输入传真">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="saveBidComp();">确认</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="uploadFileModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 700px;">
			<div class="modal-content">
				<form id="file_form" name="file_form" enctype="multipart/form-data" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							文件上传
						</h4>
					</div>
					<div class="modal-body" style="height: 100px;">
						<div class="form-group">
							<label class="col-sm-2 control-label">文件</label>
							<div class="col-sm-9">
								<input type="hidden" id="uploadFileCompNo">
								<input type="hidden" id="fileNamePre" name="fileNamePre" value="">
								<input type="hidden" id="uploadFileName" name="uploadFileName">
								<input type="file" name="uploadFileObj" id="uploadFileObj" class="form-control">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="uploadFile();">上传</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="bidCompApplyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 900px;">
			<div class="modal-content">
				<form enctype="multipart/form-data" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							报名要求
						</h4>
						<input type="hidden" id="applyCompNo">
					</div>
					<div class="modal-body" style="height: 350px;">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>编号</th>
									<th>报名要求</th>
									<th>报名内容</th>
								</tr>
							</thead>
							<tbody id="bidCompApplyData">
								<tr>
									<td>1</td>
									<td>
										<input type="hidden" name="tmpApplyId">
										<input name="tmpApplyRequire" type="text" class="form-control">
									</td>
									<td>
										<input name="tmpApplyContent" type="text" class="form-control">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="setBidCompApply();">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath()%>/node_modules/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ajaxfileupload.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath()%>/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.zh-CN.min.js"></script>
<script>
	showtab('${updBidTabIndex}');
	
	$('.datepicker').parent().datepicker({
		"autoclose":true,
		"format":"yyyy-mm-dd",
		"language":"zh-CN",
		"daysOfWeekHighlighted":"[0,6]",
		clearBtn: true
	});
</script>
</body>
</html>
