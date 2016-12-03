<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>首页</title>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="static/main/css/base.css">
	<link rel="stylesheet" href="static/main/css/index.css">

	<link rel="stylesheet" href="static/main/css/swiper.min.css">
	<script src="static/main/js/jquery.js"></script>
	<style>
		.swiper-container {
			width: 100%;
			height: 100%;
		}
		.swiper-slide {
			text-align: center;
			font-size: 18px;
			background: #fff;
			display: -webkit-box;
			display: -ms-flexbox;
			display: -webkit-flex;
			display: flex;
			-webkit-box-pack: center;
			-ms-flex-pack: center;
			-webkit-justify-content: center;
			justify-content: center;
			-webkit-box-align: center;
			-ms-flex-align: center;
			-webkit-align-items: center;
			align-items: center;
		}
	</style>
	
</head>
<body>
	<%@ include file="header.jsp"%>
	<!-- 头部结束 -->
	<div class="viewport">
		<!-- 轮播图部分 -->
		<div class="banner">
			<div class="swiper-container swiper-container-horizontal">
				<div class="swiper-wrapper">
					<div class="swiper-slide swiper-slide-active" ><img style="width:100%;min-height: 633px" src="static/main/images/baner_bg1.jpg" alt=""></div>
					<div class="swiper-slide swiper-slide-next" ><img style="width:100%;min-height: 633px" src="static/main/images/baner_bg1.jpg" alt=""></div>
					<div class="swiper-slide" ><img style="width:100%;min-height: 633px" src="static/main/images/baner_bg1.jpg" alt=""></div>

				</div>
				<!-- 左右箭头 -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</div>
		<!-- 轮播图结束 -->
		<div class="create-use">
			<div class="create">
				<p>创建应用</p>
			</div>
			<div class="create-details">
				<ul class="create-ul">
					<li>
						<a href="javascript:;">技术支持<span></span></a>
						<p>开放智能POS特色接口，支持多种按支付方式，为您的应用开发提供有力支持。</p>
					</li>
					<li>
						<a href="javascript:;">应用推广<span></span></a>
						<p>开放智能POS特色接口，支持多种按支付方式，为您的应用开发提供有力支持。</p>
					</li>
					<li>
						<a href="javascript:;">轻松结算<span></span></a>
						<p>开放智能POS特色接口，支持多种按支付方式，为您的应用开发提供有力支持。</p>
					</li>
				</ul>

			</div>
		</div>
		<!--应用接入流程部分开始-->
		<table width="76%" height="230px" class="maintable">
			<tr class="maintr">
				<td width="40%" class="onetd">
					<h4>应用接入流程</h4>
					<img class="h4-img" src="static/main/images/flow_path_img.png" alt=""/>
				</td>
				<td width="60%" class="onetd">
					<table class="smalltable">
						<tr class="smalltr">
							<td class="smalltd one">
								<div class="tdone"><img src="static/main/images/three.png" alt=""><h3>注册开发者</h3></div>
								<div class="tdtwo"><img src="static/main/images/two.png" alt=""></div>
							</td>
							<td class="smalltd">
								<div class="tdone"><img src="static/main/images/one.png" alt=""><h3>注册开发者</h3></div>
								<div class="tdtwo"><img src="static/main/images/two.png" alt=""></div>
							</td>
							<td class="smalltd">
								<div class="tdone"><img src="static/main/images/four.png" alt=""><h3>注册开发者</h3></div>
								<div class="tdtwo"><img src="static/main/images/two.png" alt=""></div>
							</td>
							<td class="smalltd">
								<div class="tdone"><img src="static/main/images/five.png" alt=""><h3>注册开发者</h3></div>

							</td>
							<td class="smalltd"></td>
						</tr>

					</table>
				</td>
			</tr>
		</table>
		<!--应用接入流程部分结束-->
			<!--合作伙伴部分开始-->
			<div class="cooperation-partner">
				<div class="partner-content">
					<h3>合作伙伴</h3>
					<div class="box">
						<div class="screen">
							<ul>
								<li><img src="static/main/images/partner.png" width="140px" height="50px"/></li>
								<li><img src="static/main/images/partner.png" width="140px" height="50px"/></li>
								<li><img src="static/main/images/partner.png" width="140px" height="50px"/></li>
								<li><img src="static/main/images/partner.png" width="140px" height="50px"/></li>
								<li><img src="static/main/images/partner.png" width="140px" height="50px"/></li>
								<li><img src="static/main/images/partner.png" width="140px" height="50px"/></li>
								<li><img src="static/main/images/partner.png" width="140px" height="50px"/></li>
								<li><img src="static/main/images/partner.png" width="140px" height="50px"/></li>
							</ul>
						</div>
						<div class="arrow-btn">
							<span class="left"></span>
							<span class="right"></span>
						</div>
					</div>


			</div>
		</div>
	</div>
	<!--合作伙伴部分结束-->
	</div>
<!--底部-->
	<%@ include file="footer.jsp"%>
	<script>
	if (!("classList" in document.documentElement)) {
	Object.defineProperty(HTMLElement.prototype, 'classList', {
	get: function() {
	var self = this;
	function update(fn) {
	return function(value) {
	var classes = self.className.split(/\s+/g),
	index = classes.indexOf(value);

	fn(classes, index, value);
	self.className = classes.join(" ");
	}
	}

	return {
	add: update(function(classes, index, value) {
	if (!~index) classes.push(value);
	}),

	remove: update(function(classes, index) {
	if (~index) classes.splice(index, 1);
	}),

	toggle: update(function(classes, index, value) {
	if (~index)
	classes.splice(index, 1);
	else
	classes.push(value);
	}),

	contains: function(value) {
	return !!~self.className.split(/\s+/g).indexOf(value);
	},

	item: function(i) {
	return self.className.split(/\s+/g)[i] || null;
	}
	};
	}
	});
	}
	</script>
<script src="static/main/js/index.js"></script>
<script src="static/main/js/swiper.min.js"></script>
</body>
</html>
