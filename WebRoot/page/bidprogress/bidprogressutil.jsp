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
	//上传
	function uploadfile(number) {

//		var uploadFileCompNo = $("#uploadFileCompNo").val();
		var uploadFileObj = $("#uploadFileObj").val();	
		alert(number);
		if ($("#uploadFileObj").val() == "")
			alert("请输入上传文件！");
		else{		
			if (confirm("开始上传文件！"+uploadFileObj)){
				var loc_filename = uploadFileObj.substring(uploadFileObj.lastIndexOf("\\")+1);
				$("#uploadFileName").val(uploadFileObj);
				//前缀
				$("#fileNamePre").val("comp");
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
							alert("文件上传成功：" + data.resultMessage);
//							$('#uploadFileModal').modal('hide');
							if (number == 1){
								$("#uploadFileName1").val(fileurl+filename);
								var lup1 = document.getElementById("lup1");
								lup1.innerText = loc_filename;
							}
							if (number == 2){
								$("#uploadFileName2").val(fileurl+filename);
								var lup2 = document.getElementById("lup2");
								lup2.innerText = loc_filename;
							}
							if (number == 3){
								$("#uploadFileName3").val(fileurl+filename);
								var lup3 = document.getElementById("lup3");
								lup3.innerText = loc_filename;
							}
							if (number == 4){
								$("#uploadFileName4").val(fileurl+filename);
								var lup4 = document.getElementById("lup4");
								lup4.innerText = loc_filename;
							}
							if (number == 5){
								$("#uploadFileName5").val(fileurl+filename);
								var lup5 = document.getElementById("lup5");
								lup5.innerText = loc_filename;
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

	function popup(){
		var msg = $("#uploadFileName1").val();
		window.open(msg);
	}
	
	function delfile(number){
		if (number == 1){
			$("#delFileName").val($("#uploadFileName1").val());
		}
		if (number == 2)
			$("#delFileName").val($("#uploadFileName2").val());
		if (number == 3)
			$("#delFileName").val($("#uploadFileName3").val());
		if (number == 4)
			$("#delFileName").val($("#uploadFileName4").val());
		if (number == 5)
			$("#delFileName").val($("#uploadFileName5").val());
	
		if ($("#delFileName").val() == "")
			alert("没有删除文件！");
		else{		
			if (confirm("开始删除文件！"+$("#delFileName").val())){
				var formData = new FormData($("#file_form")[0]);
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
								$("#uploadFileName1").val("");
								var lup1 = document.getElementById("lup1");
								lup1.innerText = "";
							}
							if (number == 2){
								$("#uploadFileName1").val("");
								var lup2 = document.getElementById("lup2");
								lup2.innerText = "";
							}
							if (number == 3){
								$("#uploadFileName1").val("");
								var lup3 = document.getElementById("lup3");
								lup3.innerText = "";
							}
							if (number == 4){
								$("#uploadFileName1").val("");
								var lup4 = document.getElementById("lup4");
								lup4.innerText = "";
							}
							if (number == 5){
								$("#uploadFileName1").val("");
								var lup5 = document.getElementById("lup5");
								lup5.innerText = "";
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
				<form id="file_form" name="file_form" enctype="multipart/form-data" method="post">
				<!-- <s:form id="mainform" name="mainform" method="POST" enctype="multipart/form-data"> -->
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
				
							<label for="" class="col-lg-3 form-label"><s:property value="strBID_NO" /></label>
												
							<input type="hidden" id="uploadFileCompNo">
							<input type="hidden" id="fileNamePre" name="fileNamePre" value="">
							<input type="hidden" id="uploadFileName" name="uploadFileName">
							<input type="hidden" id="delFileName" name="delFileName">
							<input type="hidden" id="upfile1" name="upfile1">
							
							<s:hidden name="uploadFile" id="uploadFile"/>
							
							<h3 class="title">招标项目状态输入</h3>
							<div class="row">
								<s:if test="hasActionMessages()">
									<div class="row">
										<span style="color:red; text-align:center;"><s:actionmessage /></span>
									</div>
								</s:if>
								<table class="table table-striped">
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
											<label for="" class="col-lg-3 form-label" id="lup1" onclick="popup()"></label>
										</td>
										<td>
											<input type="text" id="uploadFileName1" name="uploadFileName1">
											<button type="button" class="btn btn-primary" onclick="uploadfile(1);">上传</button>
											<button type="button" class="btn btn-primary" onclick="delfile(1);">删除</button>
										</td>
									</tr>
									<tr>
										<td>
											<label for="" class="col-lg-3 form-label" id="lup2" onclick="popup()"></label>
										</td>
										<td>
											<input type="text" id="uploadFileName2" name="uploadFileName2">
											<button type="button" class="btn btn-primary" onclick="uploadfile(2);">上传</button>
											<button type="button" class="btn btn-primary" onclick="delfile(2);">删除</button>
										</td>
									</tr>
									<tr>
										<td>
											<label for="" class="col-lg-3 form-label" id="lup3" onclick="popup()"></label>
										</td>
										<td>
											<input type="text" id="uploadFileName3" name="uploadFileName3">
											<button type="button" class="btn btn-primary" onclick="uploadfile(3);">上传</button>
											<button type="button" class="btn btn-primary" onclick="delfile(3);">删除</button>
										</td>
									</tr>
									<tr>
										<td>
											<label for="" class="col-lg-3 form-label" id="lup4" onclick="popup()"></label>
										</td>
										<td>
											<input type="text" id="uploadFileName4" name="uploadFileName4">
											<button type="button" class="btn btn-primary" onclick="uploadfile(4);">上传</button>
											<button type="button" class="btn btn-primary" onclick="delfile(4);">删除</button>
										</td>
									</tr>
									<tr>
										<td>
											<label for="" class="col-lg-3 form-label" id="lup5" onclick="popup()"></label>
										</td>
										<td>
											<input type="text" id="uploadFileName5" name="uploadFileName5">
											<button type="button" class="btn btn-primary" onclick="uploadfile(5);">上传</button>
											<button type="button" class="btn btn-primary" onclick="delfile(5);">删除</button>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" onclick="goBidProgress();">取消</button>
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
		"autoclose":true,"format":"yyyy-mm-dd","language":"zh-CN"
	});	
</script>
</body>
</html>