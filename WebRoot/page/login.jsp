<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>login</title>

    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/global.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/local2.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
	$(document).ready(function(){
		var h = document.documentElement.clientHeight;
		$("#container").css("height", h);
	});

	function login() {
		document.mainform.action = '<c:url value="/login/loginAction.action"></c:url>';
		document.mainform.submit();
	}
	
	/**
	 * 获取验证码
	 * @param obj
	 * @return
	 */
	function changeValidateCode(obj) {
		//获取当前的时间作为参数，无具体意义
	    var timenow = new Date().getTime();
	    //每次请求需要一个不同的参数，否则可能会返回同样的验证码
	    //这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。
	    obj.src='<c:url value="/index/rand.action" />?d='+timenow;
	    return false;
	}

	/**
	 * 获取验证码
	 * @param obj
	 * @return
	 */
	function changeValidate(id) {
		var timenow = new Date().getTime();
		if(document.getElementById(id) != null) {
			document.getElementById(id).src='<c:url value="/index/rand.action" />?d='+timenow;
		}
	}
</script>
</head>
<body onload='createCode()' class="login">
	<label style="margin-left: 600px; margin-top: 20px; text-align: center; color: #fff; font: DFKai-SB, bold; font-size:30px;" >审价招标信息管理系统</label>	
	<br/><label style="margin-left: 850px; margin-top: 0px; text-align: center; color: #fff; font: DFKai-SB, bold; font-size:12px;" >ver 2022.01.10</label>
	<div class="container">
		<div style="position:absolute; margin-left: 430px; margin-top: 10px; text-align: center; color: red;">
			<s:actionmessage />
		</div>
		<s:form id="mainform" name="mainform" cssClass="form-horizontal loginBox" method="POST">
			<div class="form-group">
				<label for="userName" class="col-lg-3 control-label" style=" color: #fff; font: sans-serif, bold; font-size:16px;">用户名</label>
				<div class="col-lg-9">
					<input type="text" name="userLoginDto.LOGIN_ID" class="form-control" maxlength="4" id="LOGIN_ID" placeholder="请输入用户名">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-lg-3 control-label" style=" color: #fff; font: sans-serif, bold; font-size:16px;">密码</label>
				<div class="col-lg-9">
					<input type="password" name="userLoginDto.LOGIN_PW" class="form-control" maxlength="16" id="LOGIN_PW" placeholder="请输入密码">
				</div>
			</div>
			<div class="form-group">
				<label for="code" class="col-lg-3 control-label" style=" color: #fff; font:LiSu, bold; font-size:16px;">验证码</label>
				<div class="col-lg-6">
					<input type="text" name="userLoginDto.verificationcode" class="form-control" id="verificationcode" maxlength="4" value="<s:property value="userLoginDto.verificationcode"/>" placeholder="请输入验证码" />
				</div>
				<div class="col-lg-3">
					<img title="看不清点我" id="randomImg" style="height: 30px; margin-left: -19px;" name="random" src="<c:url value="/index/rand.action" />" onclick="changeValidateCode(this)" class="yzhm" />
					<!-- <input type="button" class="form-control" id="code" onclick="createCode()" /> -->
				</div>
			</div>
			<br/>
			<div class="form-group">
				<div class="col-lg-offset-3 col-lg-9">
					<button type="submit" class="btn btn-success" onclick="login();">登录</button>
					<button class="btn btn-default" style="margin-left: 100px">重置</button>
				</div>
			</div>
		</s:form>
	</div>
	<!-- <div class="bottom">
		<div class="container">
			<img src="<%=request.getContextPath()%>/images/footer.gif" alt="">
		</div>
	</div>  -->
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="<%=request.getContextPath()%>/node_modules/jquery/dist/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="<%=request.getContextPath()%>/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type='text/javascript'>
		var code; //在全局定义验证码  
	
		function createCode() {
			code = "";
			var codeLength = 4; //验证码的长度  
			var checkCode = document.getElementById("code");
			var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
				'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //随机数  
			for (var i = 0; i < codeLength; i++) { //循环操作  
				var index = Math.floor(Math.random() * 36); //取得随机数的索引（0~35）  
				code += random[index]; //根据索引取得随机数加到code上  
			}
			checkCode.value = code; //把code值赋给验证码  
		}
		//校验验证码  
		function validate() {
			var inputCode = document.getElementById("input").value.toUpperCase(); //取得输入的验证码并转化为大写     
			if (inputCode.length <= 0) { //若输入的验证码长度为0  
				alert("请输入验证码！"); //则弹出请输入验证码  
			} else if (inputCode != code) { //若输入的验证码与产生的验证码不一致时  
				alert("验证码输入错误！@_@"); //则弹出验证码输入错误  
				createCode(); //刷新验证码  
				document.getElementById("input").value = ""; //清空文本框  
			} else { //输入正确时  
				alert("合格！^-^");
			}
		}
	</script>
</body>
</html>



