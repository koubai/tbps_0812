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
<title>投标公司信息更新</title>
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
		//判断招标资料费是否需要显示
		var BID_NEED_MATERIAL_PRICE = dialogArguments.document.getElementById("BID_NEED_MATERIAL_PRICE").value;
		if(BID_NEED_MATERIAL_PRICE != "0") {
			//不需要时，则不可编辑
			$("#BID_APPLY_PRICE_WAN").attr("disabled", true);
		}
		
		$("#BID_NO").attr("value", window.dialogArguments.document.getElementById("tempBID_NO").value);
		$("#BID_CO_SEQ").attr("value", window.dialogArguments.document.getElementById("tempBID_CO_SEQ").value);
		$("#BID_CO_NAME").attr("value", window.dialogArguments.document.getElementById("tempBID_CO_NAME").value);
		$("#BID_CO_TEL").attr("value", window.dialogArguments.document.getElementById("tempBID_CO_TEL").value);
		$("#BID_BOND_WAN").attr("value", window.dialogArguments.document.getElementById("tempBID_BOND_WAN").value);
		$("#BID_PAYMENT_TYPE").attr("value", window.dialogArguments.document.getElementById("tempBID_PAYMENT_TYPE").value);
		$("#BID_PRICE_WAN").attr("value", window.dialogArguments.document.getElementById("tempBID_PRICE_WAN").value);
		$("#BID_CHECK_PRICE_WAN").attr("value", window.dialogArguments.document.getElementById("tempBID_CHECK_PRICE_WAN").value);
		$("#BID_WIN_PRICE_WAN").attr("value", window.dialogArguments.document.getElementById("tempBID_WIN_PRICE_WAN").value);
		var BID_RESULT = window.dialogArguments.document.getElementById("tempBID_RESULT").value;
		$("#BID_RESULT").attr("value", window.dialogArguments.document.getElementById("tempBID_RESULT").value);
		var list = document.getElementsByName("bidResult");
		if (window.dialogArguments.document.getElementById("tempBID_BOND_WAN").value != "")
			$("#BID_BOND_WAN").attr("value", window.dialogArguments.document.getElementById("tempBID_BOND_WAN").value);
		else 
			$("#BID_BOND_WAN").attr("value","");
		if (window.dialogArguments.document.getElementById("tempBID_PRICE_WAN").value != "")		
			$("#BID_PRICE_WAN").attr("value", window.dialogArguments.document.getElementById("tempBID_PRICE_WAN").value);
		else 
			$("#BID_PRICE_WAN").attr("value","");
		if (window.dialogArguments.document.getElementById("tempBID_CHECK_PRICE_WAN").value != "")		
			$("#BID_CHECK_PRICE_WAN").attr("value", window.dialogArguments.document.getElementById("tempBID_CHECK_PRICE_WAN").value);
		else 
			$("#BID_CHECK_PRICE_WAN").attr("value","");
		if (window.dialogArguments.document.getElementById("tempBID_WIN_PRICE_WAN").value != "")		
			$("#BID_WIN_PRICE_WAN").attr("value", window.dialogArguments.document.getElementById("tempBID_WIN_PRICE_WAN").value);
		else 
			$("#BID_WIN_PRICE_WAN").attr("value","");
		
		for(var i = 0; i < list.length; i++) {
			if(list[i].value == BID_RESULT) {
				list[i].checked = true;
				break;
			}
		}
		if(BID_RESULT == "Y") {
			$("#BID_WIN_PRICE_WAN").attr("disabled", false);
		} else {
			$("#BID_WIN_PRICE_WAN").attr("disabled", true);
		}
		$("#BID_APPLY_PRICE_WAN").attr("value", window.dialogArguments.document.getElementById("tempBID_APPLY_PRICE_WAN").value);
		$("#BID_VALUE_DATE").attr("value", window.dialogArguments.document.getElementById("tempBID_VALUE_DATE").value);
		//退还签名
		$("#BID_REFUND_SIGN").attr("value", window.dialogArguments.document.getElementById("tempBID_REFUND_SIGN").value);
		//退定日期
		$("#REFOUND_DEPOSIT_DATE").attr("value", window.dialogArguments.document.getElementById("tempREFOUND_DEPOSIT_DATE").value);
		
		$("#MEMO1").attr("value", window.dialogArguments.document.getElementById("tempMEMO1").value);
		
		$("#BID_CO_MANAGER").attr("value", window.dialogArguments.document.getElementById("tempBID_CO_MANAGER").value);
		$("#BID_CO_ADD").attr("value", window.dialogArguments.document.getElementById("tempBID_CO_ADD").value);
		
		//邮箱
		var tempBID_CO_PS = window.dialogArguments.document.getElementById("tempBID_CO_PS").value;
		$("#BID_CO_PS").attr("value", tempBID_CO_PS);
/*		if(tempBID_CO_PS != "") {
			var mail_pr = tempBID_CO_PS.substring(0, tempBID_CO_PS.indexOf("@"));
			var mail_suffix = tempBID_CO_PS.substring(tempBID_CO_PS.indexOf("@") + 1, tempBID_CO_PS.length);
			$("#mail_pr").attr("value", mail_pr);
			$("#mail_suffix").attr("value", mail_suffix);
		}
*/		
		//开票日期
		$("#RESERVE_DATE1").attr("value", window.dialogArguments.document.getElementById("tempRESERVE_DATE1").value);
		$("#BID_RECEIPT_NO").attr("value", window.dialogArguments.document.getElementById("tempBID_RECEIPT_NO").value);
		//退还签名
		$("#BID_REFUND_SIGN").attr("value", window.dialogArguments.document.getElementById("tempBID_REFUND_SIGN").value);
		
		//BID_CO_NO
		$("#BID_CO_NO").attr("value", window.dialogArguments.document.getElementById("tempBID_CO_NO").value);
		//saveBidCompApply
		$("#saveBidCompApply").attr("value", window.dialogArguments.document.getElementById("tempSaveBidCompApply").value);
		
		$("#RESERVE2").attr("value", window.dialogArguments.document.getElementById("tempRESERVE2").value);
		$("#RESERVE3").attr("value", window.dialogArguments.document.getElementById("tempRESERVE3").value);
		$("#RESERVE4").attr("value", window.dialogArguments.document.getElementById("tempRESERVE4").value);
		$("#RESERVE5").attr("value", window.dialogArguments.document.getElementById("tempRESERVE5").value);
		$("#RESERVE6").attr("value", window.dialogArguments.document.getElementById("tempRESERVE6").value);
		$("#RESERVE7").attr("value", window.dialogArguments.document.getElementById("tempRESERVE7").value);
		$("#RESERVE8").attr("value", window.dialogArguments.document.getElementById("tempRESERVE8").value);
		//保证金入账日期
		$("#RESERVE_DATE2").attr("value", window.dialogArguments.document.getElementById("tempRESERVE_DATE2").value);	
			
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
		
		
	
	
	function upd() {
		//是否需要招标资料费
		var BID_NEED_MATERIAL_PRICE = dialogArguments.document.getElementById("BID_NEED_MATERIAL_PRICE").value;
		setBidComp();
		var tmpBidStatus = window.dialogArguments.document.getElementById("tmpBidStatus").value;
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
		
		//报名要求
		var saveBidCompApply = $("#saveBidCompApply").val();
		
		//负责人
		var RESERVE2 = $("#RESERVE2").val();
		//负责人联系方式
		var RESERVE3 = $("#RESERVE3").val();
		//组织机构代码证
		var RESERVE4 = $("#RESERVE4").val();
		//法定代表人
		var RESERVE7 = $("#RESERVE7").val();
		//企业注册资金
		var RESERVE8 = $("#RESERVE8").val();

		//固定电话+传真
		var RESERVE5 = $("#RESERVE5").val();
		var RESERVE6 = $("#RESERVE6").val();
		
		//邮箱
		var BID_CO_PS = $("#BID_CO_PS").val();
		
		var BID_RECEIPT_NO = $("#BID_RECEIPT_NO").val();
		
		var RESERVE_DATE1 = $("#RESERVE_DATE1").val();
		var BID_REFUND_SIGN = $("#BID_REFUND_SIGN").val();
		var REFOUND_DEPOSIT_DATE = $("#REFOUND_DEPOSIT_DATE").val();
		//保证金入账日期
		var RESERVE_DATE2 = $("#RESERVE_DATE2").val();
		
		var BID_CO_NO = $("#BID_CO_NO").val();
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
			BID_WIN_PRICE = "0";
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
		}
		//*/
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
		var index = window.dialogArguments.document.getElementById("tempBID_COMP_INDEX").value;
		
		/*/验证中标公司最多只能有一个
		var hasBidComp = false;
		var tmpIndex = 0;
		var rows = window.dialogArguments.document.getElementById("bidCompData").rows;
		for(var i = 0; i < rows.length; i++) {
			var childs = rows[i].cells[0].getElementsByTagName("input");
			var result = childs[8].value;
			if(result == "Y") {
				hasBidComp = true;
				tmpIndex = i;
				break;
			}
		}
		if(BID_RESULT == "Y" && hasBidComp == true && tmpIndex != index) {
			alert("中标公司只能有一个！");
			$("#tmpResult").focus();
			return;
		}//*/
		
		//更新投标公司
		var trs = window.dialogArguments.document.getElementById("bidCompData").getElementsByTagName("tr");
		var td0 = trs[index].cells[0];
		//清空隐藏值对象
		var childs = td0.getElementsByTagName("input");
			for(var i = childs.length - 1; i >= 0; i--) {
			td0.removeChild(childs[i]);
		}
		trs[index].cells[2].innerHTML = BID_NO;
		trs[index].cells[3].innerHTML = BID_CO_SEQ;
		trs[index].cells[4].innerHTML = BID_CO_NAME;
		trs[index].cells[5].innerHTML = BID_CO_TEL;
		//保证金
		if(tmpBidStatus == "30") {
			trs[index].cells[6].innerHTML = createInputTd(BID_BOND_WAN, 4, '1', '保证金').innerHTML;
		} else {
			trs[index].cells[6].innerHTML = BID_BOND_WAN;
		}
		//保证金入账日期
		if(tmpBidStatus == "30") {
			trs[index].cells[7].innerHTML = createCalendarTd(RESERVE_DATE2, "reserveDate2", BID_CO_SEQ).innerHTML;
		} else {
			if(tmpBidStatus == "20") {
				trs[index].cells[7].innerHTML = createHiddenTd(RESERVE_DATE2).innerHTML;
			} else {
				trs[index].cells[7].innerHTML = RESERVE_DATE2;
			}
		}
		//支付形式
		trs[index].cells[8].innerHTML = createPaymentType(BID_PAYMENT_TYPE, tmpBidStatus).innerHTML;
		//投标价
		if(tmpBidStatus == "40") {
			trs[index].cells[10].innerHTML = createInputTd(BID_PRICE_WAN, 6, '1', '投标价').innerHTML;
		} else {
			trs[index].cells[10].innerHTML = BID_PRICE_WAN;
		}
		//评审价
		if(tmpBidStatus == "40") {
			trs[index].cells[11].innerHTML = createInputTd(BID_CHECK_PRICE_WAN, 7, '1', '评审价').innerHTML;
		} else {
			trs[index].cells[11].innerHTML = BID_CHECK_PRICE_WAN;
		}
		//中标与否
		if(tmpBidStatus == "20") {
			trs[index].cells[12].innerHTML = createHiddenTd(BID_RESULT).innerHTML;
		} else {
			trs[index].cells[12].innerHTML = createBidResult(BID_RESULT, tmpBidStatus).innerHTML;
		}
		//中标价
		if(tmpBidStatus == "20") {
			trs[index].cells[13].innerHTML = createHiddenTd(BID_WIN_PRICE_WAN).innerHTML;
		} else {
			trs[index].cells[13].innerHTML = createBidWinPriceTd(BID_WIN_PRICE_WAN, BID_RESULT, tmpBidStatus).innerHTML;
		}
		//招标资料费
		if(BID_NEED_MATERIAL_PRICE == "0") {
			//需要费用
			if(tmpBidStatus == "20") {
				trs[index].cells[14].innerHTML = createInputTd(BID_APPLY_PRICE_WAN, 10, '1', '招标资料费').innerHTML;
			} else {
				trs[index].cells[14].innerHTML = BID_APPLY_PRICE_WAN;
			}
		} else {
			trs[index].cells[14].innerHTML = BID_APPLY_PRICE_WAN;
		}
		//到账日期
		if(tmpBidStatus == "30") {
			trs[index].cells[15].innerHTML = createCalendarTd(BID_VALUE_DATE, "bidValueDate", BID_CO_SEQ).innerHTML;
		} else {
			if(tmpBidStatus == "20") {
				trs[index].cells[15].innerHTML = createHiddenTd(BID_VALUE_DATE).innerHTML;
			} else {
				trs[index].cells[15].innerHTML = BID_VALUE_DATE;
			}
		}
		//发票号码
		if(tmpBidStatus == "20") {
			trs[index].cells[16].innerHTML = createInputTd(BID_RECEIPT_NO, 12, '2', '').innerHTML;
		} else {
			trs[index].cells[16].innerHTML = BID_RECEIPT_NO;
		}
		if(tmpBidStatus == "30" || tmpBidStatus == "40") {
			//开票日期
			trs[index].cells[17].innerHTML = createHiddenTd(RESERVE_DATE1).innerHTML;
			//退还签名
			trs[index].cells[18].innerHTML = createHiddenTd(BID_REFUND_SIGN).innerHTML;
			//退定日期
			if(tmpBidStatus == "30") {
				trs[index].cells[9].innerHTML = createCalendarTd(REFOUND_DEPOSIT_DATE, "refoundDepositDate", BID_CO_SEQ).innerHTML;
			} else {
				trs[index].cells[9].innerHTML = REFOUND_DEPOSIT_DATE;
			}
		} else {
			//开票日期
			if(tmpBidStatus == "20") {
				trs[index].cells[17].innerHTML = createCalendarTd(RESERVE_DATE1, "reserveDate1", BID_CO_SEQ).innerHTML;
			} else {
				trs[index].cells[17].innerHTML = RESERVE_DATE1;
			}
			//退还签名
			if(tmpBidStatus == "20") {
				trs[index].cells[18].innerHTML = createHiddenTd(BID_REFUND_SIGN).innerHTML;
			} else {
				trs[index].cells[18].innerHTML = BID_REFUND_SIGN;
			}
			//退定日期
			trs[index].cells[9].innerHTML = createHiddenTd(REFOUND_DEPOSIT_DATE).innerHTML;
		}
		trs[index].cells[19].innerHTML = MEMO1;
		
		//修改隐藏值
		var input = createHidden(BID_NO);
		td0.appendChild(input);
		input = createHidden(BID_CO_SEQ);
		td0.appendChild(input);
		input = createHidden(BID_CO_NAME);
		td0.appendChild(input);
		input = createHidden(BID_CO_TEL);
		td0.appendChild(input);
		input = createHidden(BID_BOND_WAN);
		td0.appendChild(input);
		input = createHidden(BID_PAYMENT_TYPE);
		td0.appendChild(input);
		input = createHidden(BID_PRICE_WAN);
		td0.appendChild(input);
		input = createHidden(BID_CHECK_PRICE_WAN);
		td0.appendChild(input);
		input = createHidden(BID_RESULT);
		td0.appendChild(input);
		input = createHidden(BID_WIN_PRICE_WAN);
		td0.appendChild(input);
		input = createHidden(BID_APPLY_PRICE_WAN);
		td0.appendChild(input);
		input = createHidden(BID_VALUE_DATE);
		td0.appendChild(input);
		//发票号码
		input = createHidden(BID_RECEIPT_NO);
		td0.appendChild(input);
		//开票日期
		input = createHidden(RESERVE_DATE1);
		td0.appendChild(input);
		//退还签名
		input = createHidden(BID_REFUND_SIGN);
		td0.appendChild(input);
		//退定日期
		input = createHidden(REFOUND_DEPOSIT_DATE);
		td0.appendChild(input);
		
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
		input = createHidden(BID_CO_NO);
		td0.appendChild(input);
		//报名内容
		input = createApplyNoteHidden(saveBidCompApply, BID_CO_SEQ);
		td0.appendChild(input);
		//trs[index].cells[19].innerHTML = createInputButton(BID_NO, BID_CO_NO, BID_CO_SEQ).innerHTML;
		
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
		window.close();
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
				$("#BID_WIN_PRICE").attr("value", "0");
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
		
		$("#BID_BOND").attr("value", $("#BID_BOND_WAN").val()*10000);
		$("#BID_PRICE").attr("value", $("#BID_PRICE_WAN").val()*10000);
		$("#BID_CHECK_PRICE").attr("value", $("#BID_CHECK_PRICE_WAN").val()*10000);
		$("#BID_WIN_PRICE").attr("value", $("#BID_WIN_PRICE_WAN").val()*10000);

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
	<input type="hidden" id="BID_RESULT" value="" />
	<input type="hidden" id="BID_CO_NO" value="" />
	<input type="hidden" id="REFOUND_DEPOSIT_DATE" value="" />
	<input type="hidden" id="saveBidCompApply" value="" />
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<div class="tittle">
				<div class="icons"></div>
				<div class="tittle_left">
				</div>
				<div class="tittle_center" style="width:150px;">
					投标公司信息更新
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
						<input type="text" id="BID_NO" style="width:320px;" disabled="disabled" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td><font color="red">*</font>序号</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="BID_CO_SEQ" disabled="disabled" style="width:320px;" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td><font color="red">*</font>投标公司名称</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="BID_CO_NAME" style="width:320px;" maxlength="40" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>授权人</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="BID_CO_MANAGER" style="width:320px;" maxlength="24" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>联系电话</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="BID_CO_TEL" style="width:320px;" maxlength="40" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>地址</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="BID_CO_ADD" style="width:320px;" maxlength="40" value="" />
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
							<input type="text" id="BID_CO_PS" style="width:320px;" maxlength="60" value="" />
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
							<input type="text" id="mail_pr" style="width:151px;" maxlength="30" value="" />
						</div>
						<div class="box1_right"></div>
						<label>@</label>
						<div class="box1_left"></div>
						<div class="box1_center">
							<input type="text" id="mail_suffix" style="width:151px;" maxlength="30" value="" />
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
						<input type="text" id="RESERVE2" style="width:320px;" maxlength="20" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>负责人联系方式</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="RESERVE3" style="width:320px;" maxlength="40" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>法定代表人</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="RESERVE7" style="width:320px;" maxlength="40" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>组织机构代码证</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="RESERVE4" style="width:320px;" maxlength="20" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>			
			<tr>
				<td>企业注册资金</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="RESERVE8" style="width:280px;" maxlength="20" value="" />
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
						<input type="text" id="RESERVE5" style="width:320px;" maxlength="40" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>传真</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="RESERVE6" style="width:320px;" maxlength="20" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>保证金(万元)</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="BID_BOND_WAN" style="width:320px;" maxlength="12" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>入账日期</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center date_input">
						<input type="text" id="RESERVE_DATE2" style="width:305px;" disabled="disabled" value="" />
						<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('RESERVE_DATE2'));"></a>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>支付形式</td>
				<td colspan="3"><div class="box1_left"></div>
					<div class="box1_center">
						<select id="BID_PAYMENT_TYPE" style="width:320px;">
							<option value="1" >现金</option>
							<option value="2">支票</option>
							<option value="3">转账</option>
							<option value="4">汇票</option>
							<option value="5">保函</option>
							<option value="6">现金2</option>
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
						<input type="text" id="BID_PRICE_WAN" style="width:320px;" maxlength="12" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>评审价(万元)</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="BID_CHECK_PRICE_WAN" style="width:320px;" maxlength="12" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>中标价(万元)</td>
				<td width="170">
					<div class="box1_left"></div>
					<div class="box1_center">
						<!-- <input type="text" id="BID_WIN_PRICE_WAN" style="width:150px;" maxlength="12" value="" /> -->
                                                <s:if test='updBidCompDto.BID_RESULT == "Y"'>
                                                        <s:textfield name="updBidCompDto.BID_WIN_PRICE_WAN" id="BID_WIN_PRICE_WAN" cssStyle="width:150px;" maxlength="12" theme="simple"></s:textfield>
                                                </s:if>
                                                <s:else>
                                                        <s:textfield name="updBidCompDto.BID_WIN_PRICE_WAN" id="BID_WIN_PRICE_WAN" disabled="true" value="0" cssStyle="width:150px;" maxlength="12" theme="simple"></s:textfield>
                                                </s:else>

					</div>
					<div class="box1_right"></div>
				</td>
				<td>中标与否</td>
				<td>
					<input name="bidResult" id="tmpResult" type="radio" onclick="checkBidResult(this)" value="N"/>
					<label>否</label>
					<input name="bidResult" type="radio" checked="checked" onclick="checkBidResult(this)" value="Y"/>
					<label>是</label>
				</td>
			</tr>
			<tr>
				<td>招标资料费(万元)</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="BID_APPLY_PRICE_WAN" style="width:320px;" maxlength="12" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>到账日期</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center date_input">
						<input type="text" id="BID_VALUE_DATE" style="width:305px;" disabled="disabled" value="" />
						<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('BID_VALUE_DATE'));"></a>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>发票号码</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="BID_RECEIPT_NO" style="width:320px;" maxlength="8" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>开票日期</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center date_input">
						<input type="text" id="RESERVE_DATE1" style="width:305px;" disabled="disabled" value="" />
						<a class="date" href="javascript:;" onclick="new Calendar().show(document.getElementById('RESERVE_DATE1'));"></a>
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>退还签名</td>
				<td colspan="3">
					<div class="box1_left"></div>
					<div class="box1_center">
						<input type="text" id="BID_REFUND_SIGN" style="width:320px;" maxlength="24" value="" />
					</div>
					<div class="box1_right"></div>
				</td>
			</tr>
			<tr>
				<td>备注</td>
				<td colspan="3">
					<textarea id="MEMO1" rows="4" cols="" style="width:320px;"></textarea>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="3">
					<div class="btn">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input class="input80" type="button" value="修改" onclick="upd();"/>
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
