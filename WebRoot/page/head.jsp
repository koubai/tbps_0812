<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
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
	        <a class="navbar-brand" href="index.html">今天与明天</a>
	     </div>
              <ul class="nav navbar-nav navbar-right navbar-user">
                  <li class="dropdown messages-dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> Messages <span class="badge">2</span> <b class="caret"></b></a>
                      <ul class="dropdown-menu">
                          <li class="dropdown-header">2 New Messages</li>
                          <li class="message-preview">
                              <a href="#">
                                  <span class="avatar"><i class="fa fa-bell"></i></span>
                                  <span class="message">Security alert</span>
                              </a>
                          </li>
                          <li class="divider"></li>
                          <li class="message-preview">
                              <a href="#">
                                  <span class="avatar"><i class="fa fa-bell"></i></span>
                                  <span class="message">Security alert</span>
                              </a>
                          </li>
                          <li class="divider"></li>
                          <li><a href="#">Go to Inbox <span class="badge">2</span></a></li>
                      </ul>
                  </li>
                   <li class="dropdown user-dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Steve Miller<b class="caret"></b></a>
                      <ul class="dropdown-menu">
                          <li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
                          <li><a href="#"><i class="fa fa-gear"></i> Settings</a></li>
                          <li class="divider"></li>
                          <li><a href="#"><i class="fa fa-power-off"></i> Log Out</a></li>
                      </ul>
                  </li>
              </ul>
	</nav>
</div>
</div>
