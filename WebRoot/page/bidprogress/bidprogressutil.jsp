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
		alert($("#Date1").val()); 
		var form = document.getElementById('mainform');
	    form.action='<c:url value="/bidprogress/saveBidProgressUtilAction.action"></c:url>' + "?Date1=" + $("#Date1").val()+ "&Member1=" + $("#Member1").val() + "&date=" + new Date();
	    form.submit();//提交表单
	    window.close();//关闭窗口
		
	}

	//上传
	function uploadfile(number) {
		alert(number);
		var filename = "";
		if (number == 1)
			filename = document.getElementById('uploadFile01');
		else if (number == 2)
			filename = document.getElementById('uploadFile02');
		else if (number == 3)
			filename = document.getElementById('uploadFile03');
		else if (number == 4)
			filename = document.getElementById('uploadFile04');
		else if (number == 5)
			filename = document.getElementById('uploadFile05');
		
		if (filename.value == "")
			alert("请输入上传文件！");
		else{		
			$("#uploadFile").attr("value", filename.value);
			if (confirm("开始上传文件！"+filename.value)){
				var form = document.getElementById("mainform");
				form.action='<c:url value="/bidprogress/uploadBidProgressUtilAction.action"></c:url>';
				form.submit();//提交表单
			}
		}
		
	}
	
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
		<s:if test="hasActionMessages()">
			<div class="row">
				<span style="color:red; text-align:center;"><s:actionmessage /></span>
			</div>
		</s:if>
			<div class="col-lg-10 right">
				<s:form id="mainform" name="mainform" method="POST" enctype="multipart/form-data">
					<label for="" class="col-lg-3 form-label"><s:property value="BTN_NO" /></label>
					
					<s:hidden name="strBID_COMP_NO" id="strBID_COMP_NO"/>
					<s:hidden name="uploadFile" id="uploadFile"/>
					<h3 class="title">招标项目状态输入<a class="backHome" href="#" onclick="goHome();"><i class="fa fa-home" aria-hidden="true"></i>返回首页</a></h3>
					<div class="row">
						<table class="table table-bordered">
							<tr>
								<td>
								<div class="col-lg-8 form-group">
									<label for="" class="col-lg-3 form-label"><span class="red">*</span><s:property value="strHead1" /></label>
									<label for="" class="col-lg-3 form-label"><span class="red"></span>日期</label>
								</div>
								</td>
								<td>
								<div class="input-group date" data-provide="datepicker">
									<input id="Date1" name="Date1" value="<s:property value="Date1"/>" maxlength="10" type="text" class="form-control datepicker" readonly>
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
								</td>
								<td>
								</td>
							</tr>
							<tr>
								<td>
								<div class="col-lg-8 form-group">
									<label for="" class="col-lg-3 form-label"><span class="red">*</span><s:property value="strHead2" /></label>
									<label for="" class="col-lg-3 form-label"><span class="red"></span>者</label>
								</div>
								</td>
								<td>
								<div>
									<s:textfield name="Member1" id="Member1" cssClass="form-control" maxlength="300" theme="simple"><s:property value="Member1" /></s:textfield>
								</div>
								</td>
								<td>
								</td>
							</tr>
							<tr>
								<td>
								<div class="col-lg-7 form-group">
									<label class="pdf10">上传文件1</label>
									<label class="pdf10">目录</label>
								</div>
								</td>
								<td>
								<div>
									<input type="file" name="uploadFile01" style="width: 400px;" id="uploadFile01"/><br />
								</div>
								</td>
								<td>
								<div>
									<button class="btn btn-success" id="success" onclick="uploadfile(1);">上传</button>
								</div>
								</td>
							</tr>
							<tr>
								<td>
								<div class="col-lg-7 form-group">
									<label class="pdf10">上传文件2</label>
									<label class="pdf10">目录</label>
								</div>
								</td>
								<td>
								<div>
									<input type="file" name="uploadFile02" style="width: 400px;" id="uploadFile02"/><br />
								</div>
								</td>
								<td>
								<div>
									<button class="btn btn-success" id="success" onclick="uploadfile(2);">上传</button>
								</div>
								</td>
							</tr>
							<tr>
								<td>
								<div class="col-lg-7 form-group">
									<label class="pdf10">上传文件3</label>
									<label class="pdf10">目录</label>
								</div>
								</td>
								<td>
								<div>
									<input type="file" name="uploadFile03" style="width: 400px;" id="uploadFile03"/><br />
								</div>
								</td>
								<td>
								<div>
									<button class="btn btn-success" id="success" onclick="uploadfile(3);">上传</button>
								</div>
								</td>
							</tr>
							<tr>
								<td>
								<div class="col-lg-7 form-group">
									<label class="pdf10">上传文件4</label>
									<label class="pdf10">目录</label>
								</div>
								</td>
								<td>
								<div>
									<input type="file" name="uploadFile04" style="width: 400px;" id="uploadFile04"/><br />
								</div>
								</td>
								<td>
								<div>
									<button class="btn btn-success" id="success" onclick="uploadfile(4);">上传</button>
								</div>
								</td>
							</tr>
							<tr>
								<td>
								<div class="col-lg-7 form-group">
									<label class="pdf10">上传文件5</label>
									<label class="pdf10">目录</label>
								</div>
								</td>
								<td>
								<div>
									<input type="file" name="uploadFile05" style="width: 400px;" id="uploadFile05"/><br />
								</div>
								</td>
								<td>
								<div>
									<button class="btn btn-success" id="success" onclick="uploadfile(5);">上传</button>
								</div>						
							</td>
						</tr>
						<tr>
							<td>
							<div class="col-lg-8 form-group">
								<button class="btn btn-success" id="cancel" onclick="window.close();">取消</button>
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
					</div>
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
</script>
</body>
</html>