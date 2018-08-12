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
<title>投标公司信息输入</title>
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
<script type="text/javascript">
	$(function() {
		//$("#bidNo").attr("value", window.dialogArguments.document.getElementById("BID_NO").value);
		//判断招标资料费是否需要显示
		var BID_NEED_MATERIAL_PRICE = dialogArguments.document.getElementById("BID_NEED_MATERIAL_PRICE").value;
		if(BID_NEED_MATERIAL_PRICE != "0") {
			//不需要则不可编辑
			$("#BID_APPLY_PRICE_WAN").attr("disabled", true);
		}
		
		
		//////////////////////////////
		$("#BID_CO_NAME").keyup(function (evt) {
			  ChangeCoords(); //控制查询结果div坐标
			  var k = window.event ? evt.keyCode : evt.which;
			  //输入框的id为txt_search，这里监听输入框的keyup事件
			  //不为空 && 不为上箭头或下箭头或回车
			  if ($("#BID_CO_NAME").val() != "" && k != 38 && k != 40 && k != 13) {
				  $.ajax({
			    	type: 'POST',
			    	//async: false, //同步执行，不然会有问题
			    	dataType: "json",
			    	url: '<c:url value="/tbpsServlet.servlet"></c:url>' + '?compname=' + encodeURI($("#BID_CO_NAME").val()) + "&&date" + new Date(), 			//提交的页面/方法名
			    	data: "{'compname':'" + encodeURI($("#BID_CO_NAME").val()) + "'}",    	//参数（如果没有参数：null）
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
			       				"</td><td style='display:none'>^^</td><td style='display:none'>" + item.RESERVE2 + 
			       				"</td><td style='display:none'>^^</td><td style='display:none'>" + item.RESERVE3 + 
			       				"</td><td style='display:none'>^^</td><td >" + item.RESERVE4 + 
			       				"</td><td style='display:none'>^^</td><td style='display:none'>" + item.RESERVE5 + 
			       				"</td><td style='display:none'>^^</td><td style='display:none'>" + item.RESERVE6 + 
			       				"</td><td style='display:none'>^^</td><td style='display:none'>" + item.RESERVE7 + 
			       				"</td><td style='display:none'>^^</td><td >" + item.RESERVE8 + "</td></tr>";			       				
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
			}
	  		else if (k == 38) {//上箭头
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
//   				$("#BID_CO_NAME").val($('#txt_search').val());
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
				$("#BID_CO_NAME").val(temArryStr[0]);
			else
				$("#BID_CO_NAME").val("");
			if (temArryStr[0]!= null && temArryStr[1]!="")
				$("#BID_CO_MANAGER").val(temArryStr[1]);
			else
				$("#BID_CO_MANAGER").val("");
			if (temArryStr[0]!= null && temArryStr[2]!="")
				$("#BID_CO_TEL").val(temArryStr[2]);
			else
				$("#BID_CO_TEL").val("");
			if (temArryStr[0]!= null && temArryStr[3]!="")
				$("#BID_CO_ADD").val(temArryStr[3]);
			else
				$("#BID_CO_ADD").val("");
			if (temArryStr[0]!= null && temArryStr[4]!="")
				$("#BID_CO_PS").val(temArryStr[4]);
			else
				$("#BID_CO_PS").val("");
			if (temArryStr[0]!= null && temArryStr[5]!="")
				$("#RESERVE2").val(temArryStr[5]);
			else
				$("#RESERVE2").val("");
			if (temArryStr[0]!= null && temArryStr[6]!="")
				$("#RESERVE3").val(temArryStr[6]);
			else
				$("#RESERVE3").val("");
			if (temArryStr[0]!= null && temArryStr[7]!="")
				$("#RESERVE4").val(temArryStr[7]);
			else
				$("#RESERVE4").val("");
			if (temArryStr[0]!= null && temArryStr[8]!="")
				$("#RESERVE5").val(temArryStr[8]);
			else
				$("#RESERVE5").val("");
			if (temArryStr[0]!= null && temArryStr[9]!="")
				$("#RESERVE6").val(temArryStr[9]);
			else
				$("#RESERVE6").val("");
			if (temArryStr[0]!= null && temArryStr[10]!="")
				$("#RESERVE7").val(temArryStr[10]);
			else
				$("#RESERVE7").val("");
			if (temArryStr[0]!= null && temArryStr[11]!="")
				$("#RESERVE8").val(temArryStr[11]);			
			else
				$("#RESERVE8").val("");
		}
	}
	
	//设置查询结果div坐标
	function ChangeCoords() {
		var left = $("#BID_CO_NAME").css("left");			//获取距离最左端的距离，像素，整型
		var top = $("#BID_CO_NAME").css("top")+ 20; ; 		//获取距离最顶端的距离，像素，整型（20为搜索输入框的高度）
		$("#searchresult").css("left", left + "px"); 		//重新定义CSS属性
		$("#searchresult").css("top", top + "px"); 			//同上
	}
	
	function addBidComp() {
		//是否需要招标资料费
		var BID_NEED_MATERIAL_PRICE = dialogArguments.document.getElementById("BID_NEED_MATERIAL_PRICE").value;
		setBidComp();
		var BID_NO = $("#BID_NO").val();
		var BID_CO_SEQ = $("#BID_CO_SEQ").val();
		var BID_CO_NAME = $("#BID_CO_NAME").val();
		var BID_CO_TEL = $("#BID_CO_TEL").val();
		var BID_BOND_WAN = $("#BID_BOND_WAN").val();
		var BID_BOND = $("#BID_BOND_WAN").val()*10000;
		var BID_PAYMENT_TYPE = $("#BID_PAYMENT_TYPE").val();
		var BID_PRICE_WAN = $("#BID_PRICE_WAN").val();
		var BID_PRICE = $("#BID_PRICE_WAN").val()*10000;
		var BID_CHECK_PRICE_WAN = $("#BID_CHECK_PRICE_WAN").val();
		var BID_CHECK_PRICE = $("#BID_CHECK_PRICE_WAN").val()*10000;
		var BID_WIN_PRICE_WAN = $("#BID_WIN_PRICE_WAN").val();
		var BID_WIN_PRICE = $("#BID_WIN_PRICE_WAN").val()*10000;
		var BID_RESULT = $("#BID_RESULT").val();
		var BID_APPLY_PRICE_WAN = $("#BID_APPLY_PRICE_WAN").val();
		var BID_APPLY_PRICE = $("#BID_APPLY_PRICE_WAN").val()*10000;
		var BID_VALUE_DATE = $("#BID_VALUE_DATE").val();
		var MEMO1 = $("#MEMO1").val();
		
		var BID_CO_MANAGER = $("#BID_CO_MANAGER").val();
		var BID_CO_ADD = $("#BID_CO_ADD").val();
		var BID_CO_PS = $("#BID_CO_PS").val();

		//负责人
		var RESERVE2 = $("#RESERVE2").val();
		//负责人联系方式
		var RESERVE3 = $("#RESERVE3").val();
		//组织机构代码证
		var RESERVE4 = $("#RESERVE4").val();
		//固定电话
		var RESERVE5 = $("#RESERVE5").val();
		//传真
		var RESERVE6 = $("#RESERVE6").val();
		//法定代表人
		var RESERVE7 = $("#RESERVE7").val();
		//企业注册资金
		var RESERVE8 = $("#RESERVE8").val();
		
		var BID_RECEIPT_NO = $("#BID_RECEIPT_NO").val();
		var RESERVE_DATE1 = $("#RESERVE_DATE1").val();
		//保证金入账日期
		var RESERVE_DATE2 = $("#RESERVE_DATE2").val();
		//退还签名
		var BID_REFUND_SIGN = $("#BID_REFUND_SIGN").val();

		//if(BID_NO == "") {
		//	alert("招标编号不能为空！");
		//	$("#BID_NO").focus();
		//	return;
		//}
		if(BID_CO_SEQ == "") {
			alert("序号不能为空！");
			$("#BID_CO_SEQ").focus();
			return;
		}
		if(BID_CO_NAME == "") {
			alert("投标公司名称不能为空！");
			$("#BID_CO_NAME").focus();
			return;
		}
		
		if(BID_CO_MANAGER.length > 20) {
			alert("授权人不能超过20个字！");
			$("#BID_CO_MANAGER").focus();
			return;
		}
		if(RESERVE7.length > 20) {
			alert("法定代表人不能超过20个字！");
			$("#RESERVE7").focus();
			return;
		}
		if(BID_REFUND_SIGN.length > 6) {
			alert("退还签名不能超过6个字！");
			$("#BID_REFUND_SIGN").focus();
			return;
		}
		
		/*
		if(BID_CO_MANAGER == "") {
			alert("授权人不能为空！");
			$("#BID_CO_NAME").focus();
			return;
		}
		if(BID_CO_TEL == "") {
			alert("联系电话不能为空！");
			$("#BID_CO_TEL").focus();
			return;
		}
		//if(!isMobile(BID_CO_TEL)) {
		if(!isMobile(BID_CO_TEL) && !isTelephone(BID_CO_TEL)) {
			alert("请输入正确的联系电话！");
			$("#BID_CO_TEL").focus();
			return;
		}
		if(BID_CO_ADD == "") {
			alert("地址不能为空！");
			$("#BID_CO_ADD").focus();
			return;
		}
		if(BID_CO_PS == "") {
			alert("邮箱不能为空！");
			$("#BID_CO_PS").focus();
			return;
		}
		if(!isMail(BID_CO_PS)) {
			alert("请输入正确的邮箱！");
			$("#BID_CO_PS").focus();
			return;
		}
		if(BID_BOND == "") {
			alert("保证金不能为空！");
			$("#BID_BOND").focus();
			return;
		}
		if(!isReal(BID_BOND)) {
			alert("保证金格式不正确！");
			$("#BID_BOND").focus();
			return;
		}
		if(BID_PAYMENT_TYPE == "") {
			alert("请选择支付形式！");
			$("#bidPaymentType").focus();
			return;
		}
		if(BID_PRICE == "") {
			alert("投标价不能为空！");
			$("#BID_PRICE").focus();
			return;
		}
		if(!isReal(BID_PRICE)) {
			alert("投标价格式不正确！");
			$("#BID_PRICE").focus();
			return;
		}
		if(BID_CHECK_PRICE == "") {
			alert("评审价不能为空！");
			$("#BID_CHECK_PRICE").focus();
			return;
		}
		if(!isReal(BID_CHECK_PRICE)) {
			alert("评审价格式不正确！");
			$("#BID_CHECK_PRICE").focus();
			return;
		}
		if(BID_RESULT == "Y") {
			if(BID_WIN_PRICE == "") {
				alert("中标价不能为空！");
				$("#BID_WIN_PRICE").focus();
				return;
			}
			if(!isReal(BID_WIN_PRICE)) {
				alert("中标价格式不正确！");
				$("#BID_WIN_PRICE").focus();
				return;
			}
		} else {
			BID_WIN_PRICE == "0";
			$("#BID_WIN_PRICE").attr("value", BID_WIN_PRICE);
		}
		if(BID_APPLY_PRICE == "") {
			alert("标书费不能为空！");
			$("#BID_APPLY_PRICE").focus();
			return;
		}
		if(!isReal(BID_APPLY_PRICE)) {
			alert("标书费格式不正确！");
			$("#BID_APPLY_PRICE").focus();
			return;
		}
		if(BID_VALUE_DATE == "") {
			alert("到账日期不能为空！");
			$("#BID_VALUE_DATE").focus();
			return;
		}
		if(BID_RECEIPT_NO == "") {
			alert("发票号码不能为空！");
			$("#BID_RECEIPT_NO").focus();
			return;
		}
		if(BID_REFUND_SIGN == "") {
			alert("退还签名不能为空！");
			$("#BID_REFUND_SIGN").focus();
			return;
		}
		if(MEMO1.length > 60) {
			alert("备注不能超过60个字！");
			$("#tempMemo1").focus();
			return;
		}//*/
/*		if(BID_CO_PS != "" && !isMail(BID_CO_PS)) {
			alert("请输入正确的邮箱！");
			//$("#mail_pr").focus();
			$("#BID_CO_PS").focus();
			return;
		}*/
		if(BID_BOND_WAN != "" && !isReal(BID_BOND_WAN)) {
			alert("保证金格式不正确！");
			$("#BID_BOND_WAN").focus();
			return;
		}
		if(BID_PRICE_WAN != "" && !isReal(BID_PRICE_WAN)) {
			alert("投标价格式不正确！");
			$("#BID_PRICE_WAN").focus();
			return;
		}
		if(BID_CHECK_PRICE_WAN != "" && !isReal(BID_CHECK_PRICE_WAN)) {
			alert("评审价格式不正确！");
			$("#BID_CHECK_PRICE_WAN").focus();
			return;
		}
		if(BID_RESULT == "Y") {
			if(BID_WIN_PRICE_WAN == "") {
				alert("中标价不能为空！");
				$("#BID_WIN_PRICE_WAN").focus();
				return;
			}
			if(!isReal(BID_WIN_PRICE_WAN)) {
				alert("中标价格式不正确！");
				$("#BID_WIN_PRICE_WAN").focus();
				return;
			}
		} else {
			BID_WIN_PRICE_WAN = "0";
			$("#BID_WIN_PRICE_WAN").attr("value", BID_WIN_PRICE_WAN);
		}
		if(BID_APPLY_PRICE_WAN != "" && !isReal(BID_APPLY_PRICE_WAN)) {
			alert("招标资料费格式不正确！");
			$("#BID_APPLY_PRICE_WAN").focus();
			return;
		}
		if(MEMO1.length > 60) {
			alert("备注不能超过60个字！");
			$("#tempMemo1").focus();
			return;
		}
/*  20170219 as user's requirement remove COMP REGISTER FUND for foreign currency support
if(RESERVE8 != "" && !isReal(RESERVE8)) {
			alert("企业注册资金格式不正确！");
			$("#RESERVE8").focus();
			return;
		}
*/		
		if(BID_BOND_WAN == "") {
			BID_BOND_WAN = "0";
			$("#BID_BOND_WAN").attr("value", BID_BOND_WAN);
			BID_BOND = "0";
			$("#BID_BOND").attr("value", BID_BOND);
		}
		if(BID_PRICE_WAN == "") {
			BID_PRICE_WAN = "0";
			$("#BID_PRICE_WAN").attr("value", BID_PRICE_WAN);
			BID_PRICE = "0";
			$("#BID_PRICE").attr("value", BID_PRICE);
		}
		if(BID_CHECK_PRICE_WAN == "") {
			BID_CHECK_PRICE_WAN = "0";
			$("#BID_CHECK_PRICE_WAN").attr("value", BID_CHECK_PRICE_WAN);
			BID_CHECK_PRICE = "0";
			$("#BID_CHECK_PRICE").attr("value", BID_CHECK_PRICE);
		}
		if(BID_WIN_PRICE_WAN == "") {
			BID_WIN_PRICE_WAN = "0";
			$("#BID_WIN_PRICE_WAN").attr("value", BID_WIN_PRICE_WAN);
			BID_WIN_PRICE = "0";
			$("#BID_WIN_PRICE").attr("value", BID_WIN_PRICE);
		}
		if(BID_APPLY_PRICE_WAN == "") {
			BID_APPLY_PRICE_WAN = "0";
			$("#BID_APPLY_PRICE_WAN").attr("value", BID_APPLY_PRICE_WAN);
			BID_APPLY_PRICE = "0";
			$("#BID_APPLY_PRICE").attr("value", BID_APPLY_PRICE);
		}
		
		/*/验证中标公司最多只能有一个
		var hasBidComp = false;
		var rows = window.dialogArguments.document.getElementById("bidCompData").rows;
		for(var i = 0; i < rows.length; i++) {
			var childs = rows[i].cells[0].getElementsByTagName("input");
			var result = childs[8].value;
			if(result == "Y") {
				hasBidComp = true;
				break;
			}
		}
		if(BID_RESULT == "Y" && hasBidComp == true) {
			alert("中标公司只能有一个！");
			$("#tmpResult").focus();
			return;
		}//*/

		var bidCompData = window.dialogArguments.document.getElementById("bidCompData");
		var len = window.dialogArguments.document.getElementById("compTable").childNodes.length;
		var childs = bidCompData.childNodes;
		//清空text节点
		for(var a = childs.length - 1; a >= 0; a--) {
			if(childs[a].nodeType == 3)
				bidCompData.removeChild(childs[a]);
		}
		
		//复制父页面投标公司数据
		for(var a = 0; a < len; a++) {
			var newRow = childs[a].cloneNode(true);
			bidCompData.appendChild(newRow);
		}
		
		//清空父页面原来的投标公司数据
		for(var a = len-1; a >= 0; a--) {
			bidCompData.removeChild(childs[a]);
		}
		
		var tmpBidStatus = window.dialogArguments.document.getElementById("tmpBidStatus").value;
		//添加投标公司
		var td0 = window.dialogArguments.document.createElement("td");
		td0.style.display = "none";
		var tr = window.dialogArguments.document.createElement("tr");
		tr.appendChild(td0);
		var td = window.dialogArguments.document.createElement("td");
		//单选框
		var radio = window.dialogArguments.document.createElement("input");
		radio.name = "bidCompRadio";
		radio.type = "radio";
		radio.value = BID_NO + "_" + BID_CO_SEQ;
		td.appendChild(radio);
		tr.appendChild(td);
		//
		td = createTd(BID_NO);
		tr.appendChild(td);
		td.style.display = "none";
		var input = createHidden(BID_NO);
		td0.appendChild(input);
		//
		td = createTd(BID_CO_SEQ);
		td.style.display = "none";
		tr.appendChild(td);
		input = createHidden(BID_CO_SEQ);
		td0.appendChild(input);
		//
		td = createTd(BID_CO_NAME);
		tr.appendChild(td);
		input = createHidden(BID_CO_NAME);
		td0.appendChild(input);
		//
		td = createTd(BID_CO_TEL);
		tr.appendChild(td);
		input = createHidden(BID_CO_TEL);
		td0.appendChild(input);
		//保证金
		if(tmpBidStatus == "30") {
			td = createInputTd(BID_BOND_WAN, 4, '1', '保证金');
		} else {
			td = createTd(BID_BOND_WAN);
		}
		tr.appendChild(td);
		input = createHidden(BID_BOND_WAN);
		td0.appendChild(input);
		//保证金入账日期
		if(tmpBidStatus == "30") {
			td = createCalendarTd(RESERVE_DATE2, "reserveDate2", BID_CO_SEQ);
		} else {
			if(tmpBidStatus == "20") {
				// td = createHiddenTd(RESERVE_DATE2);
				td = createTd(RESERVE_DATE2);
			} else {
				td = createTd(RESERVE_DATE2);
			}
		}
		tr.appendChild(td);
		//支付形式
		td = createPaymentType(BID_PAYMENT_TYPE, tmpBidStatus);
		tr.appendChild(td);
		input = createHidden(BID_PAYMENT_TYPE);
		td0.appendChild(input);
		
		if(tmpBidStatus == "30" || tmpBidStatus == "40") {
			//显示退定日期
			if(tmpBidStatus == "30") {
				td = createCalendarTd("", "refoundDepositDate", BID_CO_SEQ);
			} else {
				td = createTd("");
			}
			tr.appendChild(td);
		} else {
			//退定日期
			td = createHiddenTd("");
			tr.appendChild(td);
		}
		//投标价
		if(tmpBidStatus == "40") {
			td = createInputTd(BID_PRICE_WAN, 6, '1', '投标价');
		} else {
			td = createTd(BID_PRICE_WAN);
		}
		tr.appendChild(td);
		input = createHidden(BID_PRICE_WAN);
		td0.appendChild(input);
		//评审价
		if(tmpBidStatus == "40") {
			td = createInputTd(BID_CHECK_PRICE_WAN, 7, '1', '评审价');
		} else {
			td = createTd(BID_CHECK_PRICE_WAN);
		}
		tr.appendChild(td);
		input = createHidden(BID_CHECK_PRICE_WAN);
		td0.appendChild(input);

		//中标与否
		if(tmpBidStatus == "20" || tmpBidStatus == "30") {
			td = createHiddenTd(BID_RESULT);
			tr.appendChild(td);
		} else {
			td = createBidResult(BID_RESULT, tmpBidStatus);
			tr.appendChild(td);
		}
		input = createHidden(BID_RESULT);
		td0.appendChild(input);
		//中标价
		if(tmpBidStatus == "20" || tmpBidStatus == "30") {
			td = createHiddenTd(BID_WIN_PRICE_WAN);
			tr.appendChild(td);
		} else {
			td = createBidWinPriceTd(BID_WIN_PRICE_WAN, BID_RESULT, tmpBidStatus);
			tr.appendChild(td);
		}
		input = createHidden(BID_WIN_PRICE_WAN);
		td0.appendChild(input);
		//招标资料费
		if(BID_NEED_MATERIAL_PRICE == "0") {
			//需要标书费
			if(tmpBidStatus == "20") {
				td = createInputTd(BID_APPLY_PRICE_WAN, 10, '1', '招标资料费');
			} else {
				td = createTd(BID_APPLY_PRICE_WAN);
			}
		} else {
			//不需要标书费
			td = createTd(BID_APPLY_PRICE_WAN);
		}
		tr.appendChild(td);
		input = createHidden(BID_APPLY_PRICE_WAN);
		td0.appendChild(input);
		//到账日期
		if(tmpBidStatus == "30") {
			td = createCalendarTd(BID_VALUE_DATE, "bidValueDate", BID_CO_SEQ);
		} else {
			if(tmpBidStatus == "20") {
				td = createHiddenTd(BID_VALUE_DATE);
			} else {
				td = createTd(BID_VALUE_DATE);
			}
		}
		tr.appendChild(td);
		input = createHidden(BID_VALUE_DATE);
		td0.appendChild(input);
		//发票号码
		if(tmpBidStatus == "20") {
			td = createInputTd(BID_RECEIPT_NO, 12, '2', '');
		} else {
			td = createTd(BID_RECEIPT_NO);
		}
		tr.appendChild(td);
		input = createHidden(BID_RECEIPT_NO);
		td0.appendChild(input);
		
		if(tmpBidStatus == "30" || tmpBidStatus == "40") {
			//显示退定日期
			//开票日期
			td = createHiddenTd(RESERVE_DATE1);
			tr.appendChild(td);
			input = createHidden(RESERVE_DATE1);
			td0.appendChild(input);
			//退还签名
			td = createHiddenTd(BID_REFUND_SIGN);
			tr.appendChild(td);
			input = createHidden(BID_REFUND_SIGN);
			td0.appendChild(input);
			//退定日期
			input = createHidden("");
			td0.appendChild(input);
		} else {
			//显示退还签名
			//开票日期
			if(tmpBidStatus == "20") {
				td = createCalendarTd(RESERVE_DATE1, "reserveDate1", BID_CO_SEQ);
			} else {
				td = createTd(RESERVE_DATE1);
			}
			tr.appendChild(td);
			
			input = createHidden(RESERVE_DATE1);
			td0.appendChild(input);
			//退还签名
			if(tmpBidStatus == "20") {
				td = createHiddenTd(BID_REFUND_SIGN);
			} else {
				td = createTd(BID_REFUND_SIGN);
			}
			tr.appendChild(td);
			input = createHidden(BID_REFUND_SIGN);
			td0.appendChild(input);
			//退定日期
			input = createHidden("");
			td0.appendChild(input);
		}
		//
		td = createTd(MEMO1);
		tr.appendChild(td);
		input = createHidden(MEMO1);
		td0.appendChild(input);
		
		//授权人，地址，邮箱
		input = createHidden(BID_CO_MANAGER);
		td0.appendChild(input);
		input = createHidden(BID_CO_ADD);
		td0.appendChild(input);
		input = createHidden(BID_CO_PS);
		td0.appendChild(input);
		//BID_CO_NO
		input = createHidden("");
		td0.appendChild(input);
		//报名内容
		input = createApplyNoteHidden("", BID_CO_SEQ);
		td0.appendChild(input);
		td = createInputButton(BID_NO, "", BID_CO_SEQ);
		tr.appendChild(td);
		
		//负责人
		input = createHidden(RESERVE2);
		td0.appendChild(input);
		//负责人联系方式
		input = createHidden(RESERVE3);
		td0.appendChild(input);
		//组织机构代码证
		input = createHidden(RESERVE4);
		td0.appendChild(input);
		
		//固定电话+传真
		input = createHidden(RESERVE5);
		td0.appendChild(input);
		input = createHidden(RESERVE6);
		td0.appendChild(input);

		//法定代表人+企业注册资金
		input = createHidden(RESERVE7);
		td0.appendChild(input);
		input = createHidden(RESERVE8);
		td0.appendChild(input);
		//保证金入账日期
		input = createHidden(RESERVE_DATE2);
		td0.appendChild(input);
		
		//更改标志
		window.dialogArguments.document.getElementById("agentCompEditFlag").value = "1";
		
		window.dialogArguments.document.getElementById("bidCompData").appendChild(tr);
		//刷新父页面斑马线
		refreshParentBidCompData();
		window.close();
	}
	
	//刷新投标公司序号和斑马线
	function refreshParentBidCompData() {
		var rows = window.dialogArguments.document.getElementById("bidCompData").rows;
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
			var value = rows[i].cells[1].childNodes[0].value;
			rows[i].cells[1].childNodes[0].value = value;
			//alert(rows[i].cells[1].childNodes[0].value);
		}
	}
	
	function createHidden(s) {
		var input = window.dialogArguments.document.createElement("input");
		input.type = "hidden";
		input.value = s;
		return input;
	}
	
	function createApplyNoteHidden(s, id) {
		var input = window.dialogArguments.document.createElement("input");
		input.type = "hidden";
		input.id = "saveBidCompApply" + id;
		input.value = s;
		return input;
	}
	
	function createTd(s) {
		var td = window.dialogArguments.document.createElement("td");
		td.appendChild(window.dialogArguments.document.createTextNode(s));
		return td;
	}
	
	function createInputButton(bidno, bidcono, seq) {
		var td = window.dialogArguments.document.createElement("td");
		td.innerHTML = "<input id=\"applyNoteBtn" + seq + "\" type=\"button\" value=\"报名内容\" onclick=\"showApplyNote('" + bidno + "', '" + bidcono + "','" + seq + "');\"/>";
		return td;
	}
	
	function createInputTd(v, index, type, title) {
		var td = window.dialogArguments.document.createElement("td");
		td.innerHTML = "<input type=\"text\" style=\"width: 70px;\" maxlength=\"12\" onblur=\"setHideVal(this, " + index + ", '" + type + "', '" + title + "', '');\" value=\"" + v + "\"/>";
		return td;
	}
	
	//支付形式
	function createPaymentType(v, bidStatus) {
		var td = window.dialogArguments.document.createElement("td");
		var html = "";
		if(bidStatus == "30") {
			html += "<select style=\"width: 70px;\" onchange=\"setSelectVal(this, 5);\">";
			if(v == "2") {
				html += "<option value=\"1\">现金</option>";
				html += "<option value=\"2\" selected=\"selected\">支票</option>";
				html += "<option value=\"3\">转账</option>";
				html += "<option value=\"4\">汇票</option>";
				html += "<option value=\"5\">保函</option>";
				html += "<option value=\"6\">现金2</option>";
			} else if(v == "3") {
				html += "<option value=\"1\">现金</option>";
				html += "<option value=\"2\">支票</option>";
				html += "<option value=\"3\" selected=\"selected\">转账</option>";
				html += "<option value=\"4\">汇票</option>";
				html += "<option value=\"5\">保函</option>";
				html += "<option value=\"6\">现金2</option>";
			} else if(v == "4") {
				html += "<option value=\"1\">现金</option>";
				html += "<option value=\"2\">支票</option>";
				html += "<option value=\"3\">转账</option>";
				html += "<option value=\"4\" selected=\"selected\">汇票</option>";
				html += "<option value=\"5\">保函</option>";
				html += "<option value=\"6\">现金2</option>";
			} else if(v == "5") {
				html += "<option value=\"1\">现金</option>";
				html += "<option value=\"2\">支票</option>";
				html += "<option value=\"3\">转账</option>";
				html += "<option value=\"4\">汇票</option>";
				html += "<option value=\"5\" selected=\"selected\">保函</option>";
				html += "<option value=\"6\">现金2</option>";
			} else if(v == "6") {
				html += "<option value=\"1\">现金</option>";
				html += "<option value=\"2\">支票</option>";
				html += "<option value=\"3\">转账</option>";
				html += "<option value=\"4\">汇票</option>";
				html += "<option value=\"5\">保函</option>";
				html += "<option value=\"6\" selected=\"selected\">现金2</option>";
			} else {
				html += "<option value=\"1\" selected=\"selected\">现金</option>";
				html += "<option value=\"2\">支票</option>";
				html += "<option value=\"3\">转账</option>";
				html += "<option value=\"4\">汇票</option>";
				html += "<option value=\"5\">保函</option>";
				html += "<option value=\"6\">现金2</option>";
			}
			html += "</select>";
		} else {
			html = bidPaymentTypeCode2Name(v);
		}
		td.innerHTML = html;
		return td;
	}
	
	//中标与否
	function createBidResult(v, bidStatus) {
		var td = window.dialogArguments.document.createElement("td");
		var html = "";
		if(bidStatus == "40") {
			html += "<select style=\"width: 70px;\" onchange=\"changeBidResult(this, 8);\">";
			if(v == "Y") {
				html += "<option value=\"Y\" selected=\"selected\">是</option>";
				html += "<option value=\"N\">否</option>";
			} else {
				html += "<option value=\"Y\">是</option>";
				html += "<option value=\"N\" selected=\"selected\">否</option>";
			}
			html += "</select>";
		} else {
			if(v == "Y") {
				html = "是";
			} else {
				html = "否";
			}
		}
		td.innerHTML = html;
		return td;
	}
	
	//中标价TD
	function createBidWinPriceTd(v, bidResult, bidStatus) {
		var td = window.dialogArguments.document.createElement("td");
		var html = "";
		if(bidStatus == "40") {
			if(bidResult == "Y") {
				html += "<input type=\"text\" style=\"width: 70px;\" maxlength=\"12\" onblur=\"setHideVal(this, 9, '1', '中标价', '');\" value=\"" + v + "\"/>";
				html += "<span style=\"display: none;\">-</span>";
			} else {
				html += "<input type=\"text\" style=\"width: 70px; display: none;\" maxlength=\"12\" onblur=\"setHideVal(this, 9, '1', '中标价', '');\" value=\"" + v + "\"/>";
				html += "<span>-</span>";
			}
		} else {
			if(bidResult == "Y") {
				html = "" + v;
			} else {
				html = "-";
			}
		}
		td.innerHTML = html;
		return td;
	}
	
	//带日历的TD
	function createCalendarTd(v, s, index) {
		var td = window.dialogArguments.document.createElement("td");
		var id = s + "_" + index;
		var html = "";
		html += "<div class=\"box1_left\"></div>";
		html += "<div class=\"box1_center date_input\">";
		html += "	<input type=\"text\" name=\"" + s + "\" id=\"" + id + "\" style=\"width: 70px;\" maxlength=\"10\" disabled=\"disabled\" value=\"" + v + "\" />";
		html += "	<a class=\"date\" href=\"javascript:;\" onclick=\"new Calendar().show(document.getElementById('" + id + "'));\"></a>";
		html += "</div>";
		html += "<div class=\"box1_right\"></div>";
		td.innerHTML = html;
		return td;
	}
	
	function createHiddenTd(s) {
		var td = window.dialogArguments.document.createElement("td");
		td.style.display = "none";
		td.appendChild(window.dialogArguments.document.createTextNode(s));
		return td;
	}
	
	function checkBidResult(obj) {
		if(obj.checked) {
			if(obj.value == "N") {
				$("#BID_WIN_PRICE_WAN").attr("value", "0");
				$("#BID_WIN_PRICE_WAN").attr("disabled", true);
			} else {
				$("#BID_WIN_PRICE_WAN").attr("disabled", false);
			}
		}
	}
	
	function setBidComp() {
		//中标与否
		var bidResult = "";
		var list = document.getElementsByName("bidResult");
		for(var i = 0; i < list.length; i++) {
			if(list[i].checked) {
				bidResult = list[i].value;
				break;
			}
		}
		$("#BID_RESULT").attr("value", bidResult);
		if(bidResult == "N") {
			$("#BID_WIN_PRICE_WAN").attr("value", "0");
		}
		
		$("#BID_NO").attr("value", $("#bidNo").val());
		$("#BID_CO_SEQ").attr("value", $("#bidCoSeq").val());
		$("#BID_PAYMENT_TYPE").attr("value", $("#bidPaymentType").val());
		$("#BID_VALUE_DATE").attr("value", $("#bidValueDate").val());
		$("#RESERVE_DATE1").attr("value", $("#tmpReserveDate1").val());
		$("#RESERVE_DATE2").attr("value", $("#tmpReserveDate2").val());
		$("#MEMO1").attr("value", $("#tempMemo1").val());
		$("#BID_BOND").attr("value", $("#BID_BOND_WAN").val()*10000);
		$("#BID_PRICE").attr("value", $("#BID_PRICE_WAN").val()*10000);
		$("#BID_CHECK_PRICE").attr("value", $("#BID_CHECK_PRICE_WAN").val()*10000);
		$("#BID_WIN_PRICE").attr("value", $("#BID_WIN_PRICE_WAN").val()*10000);
		$("#BID_APPLY_PRICE").attr("value", $("#BID_APPLY_PRICE_WAN").val()*10000);

		/*
		var mail_pr = $("#" + "mail_pr").val();
		var mail_suffix = $("#" + "mail_suffix").val();
		if(mail_pr != "" || mail_suffix != "") {
			$("#" + "BID_CO_PS").attr("value", mail_pr + "@" + mail_suffix);
		} else {
			$("#" + "BID_CO_PS").attr("value", "");
		}//*/
	}

</script>
<base target="_self"/>
</head>
<body style="background: url(''); overflow-x:hidden;overflow-y:scroll;">
<s:form id="mainform" name="mainform" method="POST">

 <div>
  <input id="txt_search" type="text" style="width: 250px;display:none" />
  <div id="searchresult" style="display: none;">
  </div>
 </div>


	<s:hidden id="BID_NO" name="addBidCompDto.BID_NO"></s:hidden>
	<s:hidden id="BID_CO_SEQ" name="addBidCompDto.BID_CO_SEQ"></s:hidden>
	<s:hidden id="BID_BOND" name="addBidCompDto.BID_BOND"></s:hidden>
	<s:hidden id="BID_PRICE" name="addBidCompDto.BID_PRICE"></s:hidden>
	<s:hidden id="BID_CHECK_PRICE" name="addBidCompDto.BID_CHECK_PRICE"></s:hidden>
	<s:hidden id="BID_WIN_PRICE" name="addBidCompDto.BID_WIN_PRICE"></s:hidden>
	<s:hidden id="BID_PAYMENT_TYPE" name="addBidCompDto.BID_PAYMENT_TYPE"></s:hidden>
	<s:hidden id="BID_RESULT" name="addBidCompDto.BID_RESULT"></s:hidden>
	<s:hidden id="BID_VALUE_DATE" name="addBidCompDto.BID_VALUE_DATE"></s:hidden>
	<s:hidden id="MEMO1" name="addBidCompDto.MEMO1"></s:hidden>
	<s:hidden id="RESERVE_DATE1" name="addBidCompDto.RESERVE_DATE1"></s:hidden>
	<s:hidden id="RESERVE_DATE2" name="addBidCompDto.RESERVE_DATE2"></s:hidden>
	<s:hidden id="BID_APPLY_PRICE" name="addBidCompDto.BID_APPLY_PRICE"></s:hidden>
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					投标公司信息输入
				</div>
				<div class="tittle_right">
				</div>
			</div>
		</div>
		<table border="0" cellspacing="15" cellpadding="0" style="margin:20px auto">
			<tr style="display: none;">
				<td><font color="red">*</font>招标编号</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="bidNo" style="width:320px;" disabled="disabled" value="<s:property value="addBidCompDto.BID_NO"/>"/>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td><font color="red">*</font>序号</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="bidCoSeq" style="width:320px;" disabled="disabled" value="<s:property value="addBidCompDto.BID_CO_SEQ"/>"/>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td><font color="red">*</font>投标公司名称</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.BID_CO_NAME" id="BID_CO_NAME" cssStyle="width:320px;" maxlength="40" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>授权人</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.BID_CO_MANAGER" id="BID_CO_MANAGER" cssStyle="width:320px;" maxlength="24" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>联系电话</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.BID_CO_TEL" id="BID_CO_TEL" cssStyle="width:320px;" maxlength="40" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>地址</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.BID_CO_ADD" id="BID_CO_ADD" cssStyle="width:320px;" maxlength="40" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>邮箱</td>
				<td colspan="3">
					<div class="box1">
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="addBidCompDto.BID_CO_PS" id="BID_CO_PS" cssStyle="width:320px;" maxlength="60" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</div>
				</td>
			</tr>
			<tr style="display: none;">
				<td>邮箱</td>
				<td colspan="3">
					<div class="box1">
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="addBidCompDto.mail_pr" id="mail_pr" cssStyle="width:151px;" maxlength="29" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
						<label>@</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="addBidCompDto.mail_suffix" id="mail_suffix" cssStyle="width:151px;" maxlength="30" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</div>
				</td>
			</tr>
			<tr>
				<td>负责人</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.RESERVE2" id="RESERVE2" cssStyle="width:320px;" maxlength="20" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>负责人联系方式</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.RESERVE3" id="RESERVE3" cssStyle="width:320px;" maxlength="40" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>法定代表人</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.RESERVE7" id="RESERVE7" cssStyle="width:320px;" maxlength="40" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>组织机构代码证</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.RESERVE4" id="RESERVE4" cssStyle="width:320px;" maxlength="20" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>企业注册资金</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.RESERVE8" id="RESERVE8" cssStyle="width:280px;" maxlength="20" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
				<td align="left">万元</td>
			</tr>
			<tr>
				<td>固定电话</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.RESERVE5" id="RESERVE5" cssStyle="width:320px;" maxlength="40" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>传真</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.RESERVE6" id="RESERVE6" cssStyle="width:320px;" maxlength="30" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>保证金(万元)</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.BID_BOND_WAN" id="BID_BOND_WAN" cssStyle="width:320px;" maxlength="12" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>入账日期</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center date_input">
						<input type="text" id="tmpReserveDate2" style="width:305px;" disabled="disabled" value="<s:property value="addBidCompDto.RESERVE_DATE2"/>"/>
						<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('tmpReserveDate2'));"></a>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>支付形式</td>
				<td colspan="3"><div class="box1_left"></div>
					<div class="box1_center">
						<select id="bidPaymentType" style="width:320px;">
							<s:if test='addBidCompDto.BID_PAYMENT_TYPE == "1"'>
								<option value="1" selected="selected">现金</option>
								<option value="2">支票</option>
								<option value="3">转账</option>
								<option value="4">汇票</option>
								<option value="5">保函</option>
								<option value="6">现金2</option>
							</s:if>
							<s:elseif test='addBidCompDto.BID_PAYMENT_TYPE == "2"'>
								<option value="1">现金</option>
								<option value="2" selected="selected">支票</option>
								<option value="3">转账</option>
								<option value="4">汇票</option>
								<option value="5">保函</option>
								<option value="6">现金2</option>
							</s:elseif>
							<s:elseif test='addBidCompDto.BID_PAYMENT_TYPE == "3"'>
								<option value="1">现金</option>
								<option value="2">支票</option>
								<option value="3" selected="selected">转账</option>
								<option value="4">汇票</option>
								<option value="5">保函</option>
								<option value="6">现金2</option>
							</s:elseif>
							<s:elseif test='addBidCompDto.BID_PAYMENT_TYPE == "4"'>
								<option value="1">现金</option>
								<option value="2">支票</option>
								<option value="3">转账</option>
								<option value="4" selected="selected">汇票</option>
								<option value="5">保函</option>
								<option value="6">现金2</option>
							</s:elseif>
							<s:elseif test='addBidCompDto.BID_PAYMENT_TYPE == "5"'>
								<option value="1">现金</option>
								<option value="2">支票</option>
								<option value="3">转账</option>
								<option value="4">汇票</option>
								<option value="5" selected="selected">保函</option>
								<option value="6">现金2</option>
							</s:elseif>
							<s:elseif test='addBidCompDto.BID_PAYMENT_TYPE == "6"'>
								<option value="1">现金</option>
								<option value="2">支票</option>
								<option value="3">转账</option>
								<option value="4">汇票</option>
								<option value="5">保函</option>
								<option value="6" selected="selected">现金2</option>
							</s:elseif>
							<s:else>
								<option selected="selected" value="1">现金</option>
								<option value="2">支票</option>
								<option value="3">转账</option>
								<option value="4">汇票</option>
								<option value="5">保函</option>
								<option value="6">现金2</option>
							</s:else>
						</select>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>投标价(万元)</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.BID_PRICE_WAN" id="BID_PRICE_WAN" cssStyle="width:320px;" maxlength="12" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>评审价(万元)</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.BID_CHECK_PRICE_WAN" id="BID_CHECK_PRICE_WAN" cssStyle="width:320px;" maxlength="12" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>中标价(万元)</td>
				<td width="170">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:if test='addBidCompDto.BID_RESULT == "Y"'>
							<s:textfield name="addBidCompDto.BID_WIN_PRICE_WAN" id="BID_WIN_PRICE_WAN" cssStyle="width:150px;" maxlength="12" theme="simple"></s:textfield>
						</s:if>
						<s:else>
							<s:textfield name="addBidCompDto.BID_WIN_PRICE_WAN" id="BID_WIN_PRICE_WAN" disabled="true" value="0" cssStyle="width:150px;" maxlength="12" theme="simple"></s:textfield>
						</s:else>
					</div>
					<div class="box1_right"></div>
				</td>
				<td>中标与否</td>
				<td>
					<s:if test='addBidCompDto.BID_RESULT == "Y"'>
						<input name="bidResult" id="tmpResult" type="radio" onclick="checkBidResult(this)" value="N"/>
						<label>否</label>
						<input name="bidResult" type="radio" checked="checked" onclick="checkBidResult(this)" value="Y"/>
						<label>是</label>
					</s:if>
					<s:else>
						<input name="bidResult" id="tmpResult" type="radio" checked="checked" onclick="checkBidResult(this)" value="N"/>
						<label>否</label>
						<input name="bidResult" type="radio" onclick="checkBidResult(this)" value="Y"/>
						<label>是</label>
					</s:else>
				</td>
			</tr>
			<tr>
				<td>招标资料费(万元)</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.BID_APPLY_PRICE_WAN" id="BID_APPLY_PRICE_WAN" cssStyle="width:320px;" maxlength="12" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>到账日期</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center date_input">
						<input type="text" id="bidValueDate" style="width:305px;" disabled="disabled" value="<s:property value="addBidCompDto.BID_VALUE_DATE"/>"/>
						<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('bidValueDate'));"></a>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>发票号码</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.BID_RECEIPT_NO" id="BID_RECEIPT_NO" cssStyle="width:320px;" maxlength="8" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>开票日期</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center date_input">
						<input type="text" id="tmpReserveDate1" style="width:305px;" disabled="disabled" value="<s:property value="addBidCompDto.RESERVE_DATE1"/>"/>
						<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('tmpReserveDate1'));"></a>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>退还签名</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<s:textfield name="addBidCompDto.BID_REFUND_SIGN" id="BID_REFUND_SIGN" cssStyle="width:320px;" maxlength="24" theme="simple"></s:textfield>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>备注</td>
				<td colspan="3">
					<textarea id="tempMemo1" rows="4" cols="" style="width:320px;"><s:property value="addBidCompDto.MEMO1"/></textarea>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="3">
					<div class="btn">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input class="input80" type="button" value="追加" onclick="addBidComp();"/>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="btn">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input class="input80" type="button" value="关闭" onclick="window.close();"/>
						</div>
						<div class="box1_right"></div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</s:form>
</body>
</html>
