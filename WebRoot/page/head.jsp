<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<script type="text/javascript">
	function goHome1() {
		window.location.href = '<c:url value="/home/goHomeAction.action"></c:url>';
	}
	
	function reset1() {
		window.location.href = '<c:url value="/login/showResetAction.action"></c:url>';
	}
	
	function logout1() {
		window.location.href = '<c:url value="/login/logout.action"></c:url>';
	}
	
	function goMesgPage() {
		window.location.href = '<c:url value="/mesg/queryMesgList.action"></c:url>';
	}
	
	window.onload = function() {
		queryMesgCount();
	}
	
	function queryMesgCount() {
		//两分钟刷新一次
		setTimeout(queryMesgCount, 1000 * 60 * 2);
		var param = new Object();
		$.getJSON('<%=request.getContextPath()%>/mesg/queryMesgCountAjax.action', param, function(data) {
			if(data.resultCode == 0) {
				$("#mesgCount").text(data.data + " New Messages");
				$("#mesgSpan1").text(data.data);
				$("#mesgSpan2").text(data.data);
			}
		});
	}
</script>
<div class="container-fluid">
<div class="top">
	<!-- <div class="container">
		<div class="col-lg-10 top-l">
			<img src="<%=request.getContextPath()%>/images/logo_tittle.png" alt="">
		</div>
		<div class="col-lg-2 top-r">
			<img src="<%=request.getContextPath()%>/images/logo.png" alt="">
		</div>
	</div>
	 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	    <div class="navbar-header">
	        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	        </button>                	        
	        <a class="navbar-brand" href="#" onclick="goHome1();">审价和招标管理系统</a>
	     </div>
              <ul class="nav navbar-nav navbar-right navbar-user">
                  <li class="dropdown messages-dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> Messages <span id="mesgSpan1" class="badge">0</span> <b class="caret"></b></a>
                      <ul class="dropdown-menu">
                          <li id="mesgCount" class="dropdown-header" onclick="goMesgPage();">0 New Messages</li>
                          <li class="divider"></li>
                          <li><a href="<%=request.getContextPath()%>/mesg/queryMesgList.action">消息&nbsp;&nbsp;&nbsp;&nbsp;<span id="mesgSpan2" class="badge">0</span></a></li>
                      </ul>
                  </li>
                   <li class="dropdown user-dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=session.getAttribute("user_name")%><b class="caret"></b></a>
                      <ul class="dropdown-menu">
                          <li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
                          <li><a href="#" onclick="reset1();"><i class="fa fa-gear"></i> Settings</a></li>
                          <li class="divider"></li>
                          <li><a href="#" onclick="logout1();"><i class="fa fa-power-off"></i> Log Out</a></li>
                      </ul>
                  </li>
              </ul>
	</nav>
</div>
</div>
