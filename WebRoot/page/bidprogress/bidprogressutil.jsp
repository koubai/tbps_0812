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
<title>招标项目状态输入</title>
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

	//保存
	function save() {		
//		alert($("#Date1").val()); 
//		var form = document.getElementById('mainform');
		if ($("#strDate1").val() == null && $("#Date1").val() == null){
			$("#Date1").attr("value","");
		}else{
			$("#Date1").attr("value",$("#strDate1").val());
		}
		if ($("#strDate2").val() == null && $("#Date2").val() == null)
			$("#Date2").attr("value","");
		else
			$("#Date2").attr("value",$("#strDate2").val());
		if ($("#strMember1").val() == null && $("#Member1").val() == null){
			$("#Member1").attr("value","");
		}
		else{
			$("#Member1").attr("value",$("#strMember1").val());			
		}
		if ($("#lbFile01").innerText == null && $("#File01").val() == null)
			$("#File01").attr("value","");
		else
			$("#File01").attr("value", $("#lbFile01").html());
		if ($("#lbFile02").innerText == null && $("#File02").val() == null)
			$("#File02").attr("value","");
		else
			$("#File02").attr("value", $("#lbFile02").html());
		if ($("#lbFile03").innerText == null && $("#File03").val() == null)
			$("#File03").attr("value","");
		else
			$("#File03").attr("value", $("#lbFile03").html());
		if ($("#lbFile04").innerText == null && $("#File04").val() == null)
			$("#File04").attr("value","");
		else
			$("#File04").attr("value", $("#lbFile04").html());
		if ($("#lbFile05").innerText == null && $("#File05").val() == null)
			$("#File05").attr("value","");
		else
			$("#File05").attr("value", $("#lbFile05").html());
		
		
		$("#ScanFlg").attr("value","");
		var ob = document.getElementsByName("rdoScanflg");
		if (ob.length >0){
			if (ob[0].checked == true){
				$("#ScanFlg").attr("value","1");
			}
			if (ob[1].checked == true){
				$("#ScanFlg").attr("value","0");
			} 			
		}
		
		var receivers = "";
		var checkers = document.getElementsByName("RECEIVER");
		if (checkers.length > 0){
			var j = 0;
			for (var i=0; i<checkers.length; i++){
				if (checkers[i].checked == true){
					receivers += checkers[i].value+";";
					j++;
				}
			}
			$("#RECEIVERS").attr("value", receivers);			
		}
		
//		document.mainform.action='<c:url value="/bidprogress/saveBidProgressUtilAction.action"></c:url>' + "?Finish_status=" + $("#Finish_status").val() + "&Date1=" + $("#Date1").val() + "&Date2=" + $("#Date2").val()+ "&Member1=" + $("#Member1").val()+ "&lblbFile01=" + $("#lblbFile01").val()+ "&File02=" + $("#File02").val()+ "&File03=" + $("#File03").val()+ "&File04=" + $("#File04").val()+ "&File05=" + $("#File05").val() + "&date=" + new Date();
		document.mainform.action='<c:url value="/bidprogress/saveBidProgressUtilAction.action"></c:url>' + "?Finish_status=" + $("#Finish_status").val() + "&Date1=" + $("#Date1").val() + "&Date2=" + $("#Date2").val()+ "&Member1=" + $("#Member1").val() + "&date=" + new Date();
		document.mainform.action();//提交表单
	}


	//上传
	function uploadfile(number) {

//		var uploadFileCompNo = $("#uploadFileCompNo").val();
		var uploadFileObj = $("#uploadFileObj").val();	
//		alert(number);
		if ($("#uploadFileObj").val() == "")
			alert("请输入上传文件！");
		else{		
			if (confirm("开始上传文件！"+uploadFileObj)){
				var loc_filename = uploadFileObj.substring(uploadFileObj.lastIndexOf("\\")+1);
				$("#uploadFileName").val(uploadFileObj);
				//前缀
				$("#fileNamePre").val("comp");
				var formData = new FormData($("#mainform")[0]);
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
							alert("文件上传成功：" + data.resultMessage);
//							$('#uploadFileModal').modal('hide');
							if (number == 1){
								$("#File01_URL").val(fileurl+filename);
								var lbFile01 = document.getElementById("lbFile01");
								lbFile01.innerText = loc_filename;
							}
							if (number == 2){
								$("#File02_URL").val(fileurl+filename);
								var lbFile02 = document.getElementById("lbFile02");
								lbFile02.innerText = loc_filename;
							}
							if (number == 3){
								$("#File03_URL").val(fileurl+filename);
								var lbFile03 = document.getElementById("lbFile03");
								lbFile03.innerText = loc_filename;
							}
							if (number == 4){
								$("#File04_URL").val(fileurl+filename);
								var lbFile04 = document.getElementById("lbFile04");
								lbFile04.innerText = loc_filename;
							}
							if (number == 5){
								$("#File05_URL").val(fileurl+filename);
								var lbFile05 = document.getElementById("lbFile05");
								lbFile05.innerText = loc_filename;
							}
							$("#uploadFileObj").val("");
						} else {
							alert("文件上传失败：" + data.resultMessage);
							return;
						}
					}
				});
			}
		}
		
	}
	
	function goBidProgress() {
	    window.close();//关闭窗口
	}

	function popup(number){
		if (number == 1)
			window.open($("#File01_URL").val());
		if (number == 2)
			window.open($("#File02_URL").val());
		if (number == 3)
			window.open($("#File03_URL").val());
		if (number == 4)
			window.open($("#File04_URL").val());
		if (number == 5)
			window.open($("#File05_URL").val());
	}
	
	function delfile(number){
		if (number == 1)
			$("#delFileName").val($("#File01_URL").val());
		if (number == 2)
			$("#delFileName").val($("#File02_URL").val());
		if (number == 3)
			$("#delFileName").val($("#File03_URL").val());
		if (number == 4)
			$("#delFileName").val($("#File04_URL").val());
		if (number == 5)
			$("#delFileName").val($("#File05_URL").val());
	
		if ($("#delFileName").val() == "")
			alert("没有删除文件！");
		else{		
			if (confirm("开始删除文件！"+$("#delFileName").val())){
				var formData = new FormData($("#mainform")[0]);
				$.ajax({
					url: '<c:url value="/fileupload/delFileAction.action"></c:url>',
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
							alert("文件删除成功：" + data.resultMessage);
//							$('#uploadFileModal').modal('hide');
							if (number == 1){
								$("#File01_URL").val("");
								var lbFile01 = document.getElementById("lbFile01");
								lbFile01.innerText = "";
							}
							if (number == 2){
								$("#File02_URL").val("");
								var lbFile02 = document.getElementById("lbFile02");
								lbFile02.innerText = "";
							}
							if (number == 3){
								$("#File03_URL").val("");
								var lbFile03 = document.getElementById("lbFile03");
								lbFile03.innerText = "";
							}
							if (number == 4){
								$("#File04_URL").val("");
								var lbFile04 = document.getElementById("lbFile04");
								lbFile04.innerText = "";
							}
							if (number == 5){
								$("#File05_URL").val("");
								var lbFile05 = document.getElementById("lbFile05");
								lbFile05.innerText = "";
							}
							$("#delFileName").val("");
						} else {
							alert("文件删除失败：" + data.resultMessage);
							return;
						}
					}
				});
			}
		}
	}
</script>
</head>
<body>
	<div class="container-fluid1">
		<div class="row">
			<div class="col-lg-10 right">
				<form id="mainform" name="mainform" enctype="multipart/form-data method="post">
				<!-- <s:form id="mainform" name="mainform" method="POST" enctype="multipart/form-data"> 
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">
							文件上传
						</h4>
					</div>-->
					<div class="modal-body" style="height: 100px;">
						<div class="form-group">
				
							<label for="" class="col-lg-3 form-label"><s:property value="strBID_NO" /></label>
							<s:hidden name="BTN_NO" id="BTN_NO"/>
							<s:hidden name="RECEIVERS" id="RECEIVERS"/>
							<s:hidden name="strBID_NO" id="strBID_NO"/>
							<s:hidden name="strBID_COMP_NO" id="strBID_COMP_NO"/>
							<s:hidden name="Date1" id="Date1"/>
							<s:hidden name="Date2" id="Date2"/>
							<s:hidden name="Member1" id="Member1"/>
							<s:hidden name="ScanFlg" id="ScanFlg"/>
							
							<s:hidden name="File01" id="File01"/>
							<s:hidden name="File02" id="File02"/>
							<s:hidden name="File03" id="File03"/>
							<s:hidden name="File04" id="File04"/>
							<s:hidden name="File05" id="File05"/>
												
							<input type="hidden" id="uploadFileCompNo">
							<input type="hidden" id="fileNamePre" name="fileNamePre" value="">
							<input type="hidden" id="uploadFileName" name="uploadFileName">
							<input type="hidden" id="delFileName" name="delFileName">
							
							<h3 class="title">招标项目状态输入</h3>
							<div class="row">
								<s:if test="hasActionMessages()">
									<div class="row">
										<span style="color:red; text-align:center;"><s:actionmessage /></span>
									</div>
								</s:if>
								<table class="table table-striped">
								<s:if test='UTIL_TYP == "5"'>
									<tr>
										<td>
											<div class="col-lg-8 form-group">
												<label for="" class="col-lg-8 form-label"><span class="red">*</span>项目完成情况</label>
											</div>
										</td>
										<td>
											<!--  <div class="col-lg-8">  -->
												<select id="Finish_status" name="Finish_status" class="form-control">
													<s:if test='Finish_status == "10"'>
														<option value="">请选择</option>
														<option value="10" selected="selected">暂停</option>
														<option value="20">进行中</option>
														<option value="52">失败（报名不满3家）</option>
														<option value="54">失败（开标不满3家）</option>
														<option value="56">失败（评审失败）</option>
														<option value="70">终止</option>
														<option value="90">完成</option>
													</s:if>
													<s:elseif test='Finish_status == "20"'>
														<option value="">请选择</option>
														<option value="10">暂停</option>
														<option value="20" selected="selected">进行中</option>
														<option value="52">失败（报名不满3家）</option>
														<option value="54">失败（开标不满3家）</option>
														<option value="56">失败（评审失败）</option>
														<option value="70">终止</option>
														<option value="90">完成</option>
													</s:elseif>
													<s:elseif test='Finish_status == "52"'>
														<option value="">请选择</option>
														<option value="10">暂停</option>
														<option value="20">进行中</option>
														<option value="52" selected="selected">失败（报名不满3家）</option>
														<option value="54">失败（开标不满3家）</option>
														<option value="56">失败（评审失败）</option>
														<option value="70">终止</option>
														<option value="90">完成</option>
													</s:elseif>
													<s:elseif test='Finish_status == "54"'>
														<option value="">请选择</option>
														<option value="10">暂停</option>
														<option value="20">进行中</option>
														<option value="52">失败（报名不满3家）</option>
														<option value="54" selected="selected">失败（开标不满3家）</option>
														<option value="56">失败（评审失败）</option>
														<option value="70">终止</option>
														<option value="90">完成</option>
													</s:elseif>
													<s:elseif test='Finish_status == "56"'>
														<option value="">请选择</option>
														<option value="10">暂停</option>
														<option value="20">进行中</option>
														<option value="52">失败（报名不满3家）</option>
														<option value="54">失败（开标不满3家）</option>
														<option value="56" selected="selected">失败（评审失败）</option>
														<option value="70">终止</option>
														<option value="90">完成</option>
													</s:elseif>
													<s:elseif test='Finish_status == "70"'>
														<option value="">请选择</option>
														<option value="10">暂停</option>
														<option value="20">进行中</option>
														<option value="52">失败（报名不满3家）</option>
														<option value="54">失败（开标不满3家）</option>
														<option value="56">失败（评审失败）</option>
														<option value="70" selected="selected">终止</option>
														<option value="90">完成</option>
													</s:elseif>
													<s:elseif test='Finish_status == "90"'>
														<option value="">请选择</option>
														<option value="10">暂停</option>
														<option value="20">进行中</option>
														<option value="52">失败（报名不满3家）</option>
														<option value="54">失败（开标不满3家）</option>
														<option value="56">失败（评审失败）</option>
														<option value="70">终止</option>
														<option value="90" selected="selected">完成</option>
													</s:elseif>
													<s:else>
														<option value="" selected="selected">请选择</option>
														<option value="10">暂停</option>
														<option value="20">进行中</option>
														<option value="52">失败（报名不满3家）</option>
														<option value="54">失败（开标不满3家）</option>
														<option value="56">失败（评审失败）</option>
														<option value="70">终止</option>
														<option value="90">完成</option>
													</s:else>
												</select>
											<!--  </div>  -->
										</td>
										<td>
										</td>
									</tr>
								</s:if>			
								<s:if test='UTIL_TYP != "6"'>					
								<tr>
									<td>
									<div class="col-lg-8 form-group">
										<label for="" class="col-lg-8 form-label"><span class="red">*</span><s:property value="strHead1" />日期</label>
									</div>
									</td>
									<td>
									<div class="input-group date" data-provide="datepicker">
										<input id="strDate1" name="strDate1" value="<s:date name="Date1" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly />
										<div class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</div>
									</div>
									</td>
									<td>
									</td>
								</tr>
								</s:if>
								<s:if test='UTIL_TYP == "4"'>
									<tr>
										<td>
										<div class="col-lg-8 form-group">
											<label for="" class="col-lg-8 form-label"><span class="red">*</span><s:property value="strHead2" />日期</label>
										</div>
										</td>
										<td>
										<div class="input-group date" data-provide="datepicker">
											<input id="strDate2" name="strDate2" value="<s:date name="Date2" format="yyyy-MM-dd"/>" maxlength="10" type="text" class="form-control datepicker" readonly />
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
										</td>
										<td>
										</td>
									</tr>
								</s:if>								
								<s:if test='UTIL_TYP == "2"'>
									<tr>
										<td>
										<div class="col-lg-8 form-group">
											<label for="" class="col-lg-8 form-label"><span class="red">*</span><s:property value="strHead3" />者</label>
										</div>
										</td>
										<td>
										<div>
											<!-- <s:textfield name="strMember1" id="strMember1" cssClass="form-control" maxlength="300" theme="simple"><s:property value="Member1" /></s:textfield> -->
											<select name="strMember1" id="strMember1" class="form-control">
												<option value="">请选择</option>
												<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
													<option value="<s:property value="LOGIN_ID"/>" <s:if test="%{Member1 == LOGIN_ID}">selected</s:if>><s:property value="LOGIN_NAME"/></option>
												</s:iterator>
											</select>
										</div>
										</td>
										<td>
										</td>
									</tr>
								</s:if>			
								<s:if test='UTIL_TYP == "6"'>
									<tr>
										<td>
										<div class="col-lg-8 form-group">
											<label for="" class="col-lg-8 form-label"><span class="red">*</span>有无扫描选项</label>
										</div>
										</td>
										<td>
										<c:choose>
						                     <c:when test="${ScanFlg=='1'}">
							                     <input type="radio" name="rdoScanflg" id="Scanflg_t" value="1"  checked />有
						                     </c:when>
						                     <c:otherwise>
							                      <input type="radio" name="rdoScanflg" id="Scanflg_t" value="1"  />有
						                     </c:otherwise>
					                    </c:choose>
					                    &nbsp;&nbsp;&nbsp;&nbsp;
	            				        <c:choose>
											<c:when test="${ScanFlg=='0'}">
							                     <input type="radio" name="rdoScanflg" id="Scanflg_f" value="0"  checked />无
						                    </c:when>
							                <c:otherwise>
							                	<input type="radio" name="rdoScanflg" id="Scanflg_f" value="0"  />无
							                </c:otherwise>
					                     </c:choose>
										</td>
										<td>
										</td>
									</tr>
								</s:if>			
								<s:if test='UTIL_TYP == "3"'>
									<tr>
										<td>
										<div class="col-lg-7 form-group">
											<label class="pdf10">上传文件目录</label>
										</div>
										</td>
										<td>
											<input type="file" name="uploadFileObj" id="uploadFileObj" class="form-control">
										</td>
									</tr>
									<tr>
										<td>
											<label style="text-align:left;" for="<s:property value="File01"/>" class="col-lg-9 form-label" id="lbFile01" onclick="popup(1)"><s:property value="File01"/></label>
										</td>
										<td>
											<input type="hidden" id="File01_URL" name="File01_URL" value="<s:property value="File01_URL"/>">
											<button type="button" class="btn btn-primary" onclick="uploadfile(1);">上传</button>
											<button type="button" class="btn btn-primary" onclick="delfile(1);">删除</button>
											<s:if test='File01_URL != ""'><a href="<s:property value="File01_URL"/>">链接</a></s:if>
										</td>
									</tr>
									<tr>
										<td>
											<label style="text-align:left;" for="<s:property value="File02"/>" class="col-lg-9 form-label" id="lbFile02" onclick="popup(2)"><s:property value="File02"/></label>
										</td>
										<td>
											<input type="hidden" id="File02_URL" name="File02_URL" value="<s:property value="File02_URL"/>">
											<button type="button" class="btn btn-primary" onclick="uploadfile(2);">上传</button>
											<button type="button" class="btn btn-primary" onclick="delfile(2);">删除</button>
											<s:if test='File02_URL != ""'><a href="<s:property value="File02_URL"/>">链接</a></s:if>
										</td>
									</tr>
									<tr>
										<td>
											<label style="text-align:left;" for="<s:property value="File03"/>" class="col-lg-9 form-label" id="lbFile03" onclick="popup(3)"><s:property value="File03"/></label>
										</td>
										<td>
											<input type="hidden" id="File03_URL" name="File03_URL" value="<s:property value="File03_URL"/>">
											<button type="button" class="btn btn-primary" onclick="uploadfile(3);">上传</button>
											<button type="button" class="btn btn-primary" onclick="delfile(3);">删除</button>
											<s:if test='File03_URL != ""'><a href="<s:property value="File03_URL"/>">链接</a></s:if>
										</td>
									</tr>
									<tr>
										<td>
											<label style="text-align:left;" for="<s:property value="File04"/>" class="col-lg-9 form-label" id="lbFile04" onclick="popup(4)"><s:property value="File04"/></label>
										</td>
										<td>
											<input type="hidden" id="File04_URL" name="File04_URL" value="<s:property value="File04_URL"/>">
											<button type="button" class="btn btn-primary" onclick="uploadfile(4);">上传</button>
											<button type="button" class="btn btn-primary" onclick="delfile(4);">删除</button>
											<s:if test='File04_URL != ""'><a href="<s:property value="File04_URL"/>">链接</a></s:if>
										</td>
									</tr>
									<tr>
										<td>
											<label style="text-align:left;" for="<s:property value="File05"/>" class="col-lg-9 form-label" id="lbFile05" onclick="popup(5)"><s:property value="File05"/></label>
										</td>
										<td>
											<input type="hidden" id="File05_URL" name="File05_URL" value="<s:property value="File05_URL"/>">
											<button type="button" class="btn btn-primary" onclick="uploadfile(5);">上传</button>
											<button type="button" class="btn btn-primary" onclick="delfile(5);">删除</button>
											<s:if test='File05_URL != ""'><a href="<s:property value="File05_URL"/>">链接</a></s:if>
										</td>
									</tr>
								</s:if>	
								<tr>
									<td>
									<div class="col-lg-8 form-group">
										<button class="btn btn-success" id="cancel" onclick="goBidProgress();">关闭</button>
									</div>
									</td>
									<td>
									<div>
										<button class="btn btn-success" id="success" onclick="save();">保存</button>
									</div>
									</td>
									<td>
									</td>
								</tr>
								</table>
								<s:if test='BTN_NO== "0501" || BTN_NO== "0103" || BTN_NO== "0505"'>
								
									<div style="height:60;width:60;overflow:scroll">
									<!-- <table class="table table-bordered">  -->
									推送人员选择
									<table  class="table table-bordered" height="50" border="1" width="1400" cellpadding="0" cellspacing="0">
										<tr style="height:10">
											<th>姓名</th>
											<th>姓名</th>
											<th>姓名</th>
										</tr>
										<s:iterator id="listUserInfo" value="listUserInfo" status="st1">
											<s:if test='#st1.index%3 == 0'>
												<tr>
												<td>&nbsp;&nbsp;<input name="RECEIVER" type="checkbox" value="<s:property value="LOGIN_ID"/>"/>&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="LOGIN_NAME"/></td>										
											</s:if>
											<s:elseif test='#st1.index%3 == 1'>
												<td>&nbsp;&nbsp;<input name="RECEIVER" type="checkbox" value="<s:property value="LOGIN_ID"/>"/>&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="LOGIN_NAME"/></td>										
											</s:elseif>		
											<s:elseif test='#st1.index%3 == 2'>
												<td>&nbsp;&nbsp;<input name="RECEIVER" type="checkbox" value="<s:property value="LOGIN_ID"/>"/>&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="LOGIN_NAME"/></td>										
												</tr>
											</s:elseif>
										</s:iterator>
										<s:if test='#st1.index%3 != 2'>
											</tr>
										</s:if>									
									</table>
									</div>
								</s:if>
								</form>
							</div>
						</div>
					</div>
				<!-- </s:form>-->
				</form>
			</div>
		</div>
		
	</div>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath()%>/node_modules/jquery/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ajaxfileupload.js"></script>
<script src="<%=request.getContextPath()%>/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/node_modules/bootstrap-datetimepicker/bootstrap-datepicker.zh-CN.min.js"></script>
<script>
	$('.datepicker').parent().datepicker({
		"autoclose":true,"format":"yyyy-mm-dd","language":"zh-CN","daysOfWeekHighlighted":"[0,6]",clearBtn: true
	});	
</script>
</body>
</html>