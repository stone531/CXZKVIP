<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE;chrome=1">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />


<div class="navbar">
	<div class="navbar_wrapInner">
		<div class="navbar_logo_img">
			<img src="static/ace/images/logo.png" class="img-responsive">
			<!--  span>惠保永泽</span -->
		</div>
		<div class="navbar_bottom">
			<ul>
				
				<li class="head_navigation_link" style="border-right: 1.5px solid #7f868b;"><a href="policy/index" >服务卡激活</a></li>
				<li class="head_navigation_link isIndex" style="border-right: 1.5px solid #7f868b;width: 16%;"><a href="page/index">首页</a></li>
			</ul>
		</div>
		<div class="navbar_bottom_right" >
			<ul class="unlogin" style="margin-top:-1.1%;">
				<li><a href="usermanage/login/show">登录</a></li><span style="color: #7a8186">|</span>
				<li><a href="usermanage/register/show">注册</a></li><span>&nbsp;&nbsp;</span>
			</ul>
			<ul class="welcom" style="display:none;padding-bottom:2%;margin-top:-5%;">
				<li><a id="mobile"></a></span></li>
				<li><a id="logout">退出</a></li>
			</ul>
			<ul id="REMIND" style="display:none;margin-top:5%;">
				<li><marquee id="REMINDMSG" style="color:red; font-size:small"></marquee></li>
			</ul>
		</div>
	</div>
</div>
