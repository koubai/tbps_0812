<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<script type="text/javascript">
	function logout() {
		window.location.href = '<c:url value="/login/logout.action"></c:url>';
	}
	
	function goHome() {
		window.location.href = '<c:url value="/home/goHomeAction.action"></c:url>';
	}
</script>
<div class="row nav">
	<div class="col-lg-7">2018.10.1 Version</div>
	<div class="col-lg-5">
		<ul class=loginInfo>
			<li><i class="fa fa-clock-o" aria-hidden="true"></i>登录时间：<%=session.getAttribute("login_time")%></li>
			<!-- <li><i class="fa fa-user-circle-o" aria-hidden="true"></i>用户：<%=session.getAttribute("user_name")%></li>
			<li><i class="fa fa-clock-o" aria-hidden="true"></i>登录时间：<%=session.getAttribute("login_time")%></li>
			<li><i class="fa fa-sign-out" aria-hidden="true"></i><a href="#" onclick="logout();">退出</a></li> -->
		</ul>
	</div>
</div>