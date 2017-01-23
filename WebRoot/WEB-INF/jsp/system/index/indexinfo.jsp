<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

%>
<!DOCTYPE HTML>
<html>
	<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Oxygen &mdash; Free Website Template, Free HTML5 Template </title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	

	

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- <link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700' rel='stylesheet' type='text/css'> -->
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="static/page/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="static/page/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="static/page/css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="static/page/css/magnific-popup.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="static/page/css/owl.carousel.min.css">
	<link rel="stylesheet" href="static/page/css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="static/page/css/style.css">

	<!-- Modernizr JS -->
	<script src="static/page/js/modernizr-2.6.2.min.js"></script>
	<!-- jQuery -->
	<script src="static/page/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="static/page/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="static/page/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="static/page/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="static/page/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="static/page/js/jquery.countTo.js"></script>
	<!-- Magnific Popup -->
	<script src="static/page/js/jquery.magnific-popup.min.js"></script>
	<script src="static/page/js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="static/page/js/main.js"></script>
	
	<script src="static/main/js/index.js"></script>
	
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	<%@ include file="../../ht.jsp"%>
  	</head>
  	<body>
	<%@ include file="../../head.jsp"%>
		
	<div class="gtco-loader"></div>
	
	<div id="page">

	<header id="gtco-header" class="gtco-cover" role="banner" style="background-image:url(static/page/images/img_bg_1.jpg);">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>惠保永泽</h1>
							<h2>传递爱心，传承文明</h2>
							<p><a href="#" class="btn btn-default">在这里开启你的保险旅程</a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<div id="gtco-features">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-4 col-sm-4">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-eye"></i>
						</span>
						<h3>服务卡激活</h3>
						<p></p>
						<p><a href="policy/fg/index" class="btn btn-primary">开始</a></p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-command"></i>
						</span>
						<h3>保单查询</h3>
						<p></p>
						<p><a href="claimsys/fg/goSearch" class="btn btn-primary">开始</a></p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-power"></i>
						</span>
						<h3>在线留言</h3>
						<p></p>
						<p><a href="onlinemsg/fg/index" class="btn btn-primary">开始</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="gtco-counter" class="gtco-bg gtco-counter" style="background-image:url(static/page/images/img_bg_2.jpg);">
		<div class="gtco-container">
			<div class="row">
				<div class="display-t">
					<div class="display-tc">
						<div class="col-md-3 col-sm-6 animate-box">
							<div class="feature-center">
								<span class="icon">
									<i class="icon-eye"></i>
								</span>

								<span class="counter js-counter" data-from="0" data-to="22070" data-speed="5000" data-refresh-interval="50">1</span>
								<span class="counter-label">浏览次数</span>

							</div>
						</div>
						<div class="col-md-3 col-sm-6 animate-box">
							<div class="feature-center">
								<span class="icon">
									<i class="icon-anchor"></i>
								</span>

								<span class="counter js-counter" data-from="0" data-to="97" data-speed="5000" data-refresh-interval="50">1</span>
								<span class="counter-label">单日投保</span>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 animate-box">
							<div class="feature-center">
								<span class="icon">
									<i class="icon-briefcase"></i>
								</span>
								<span class="counter js-counter" data-from="0" data-to="402" data-speed="5000" data-refresh-interval="50">1</span>
								<span class="counter-label">会员数量</span>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 animate-box">
							<div class="feature-center">
								<span class="icon">
									<i class="icon-clock"></i>
								</span>

								<span class="counter js-counter" data-from="0" data-to="212023" data-speed="5000" data-refresh-interval="50">1</span>
								<span class="counter-label">服务记录</span>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div id="gtco-services">
		<div class="gtco-container">
			
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2>保险产品</h2>
					<p></p>
				</div>
			</div>

			<div class="row animate-box">
				
				<div class="gtco-tabs">
					<ul class="gtco-tab-nav">
						<li class="active"><a href="#" data-tab="1"><span class="icon visible-xs"><i class="icon-man"></i></span><span class="hidden-xs">儿童保险</span></a></li>
						<li><a href="#" data-tab="2"><span class="icon visible-xs"><i class="icon-user-tie"></i></span><span class="hidden-xs">成人保险</span></a></li>
						<li><a href="#" data-tab="3"><span class="icon visible-xs"><i class="icon-airplane"></i></span><span class="hidden-xs">旅游保险</span></a></li>
						<li><a href="#" data-tab="4"><span class="icon visible-xs"><i class="icon-car"></i></span><span class="hidden-xs">汽车保险</span></a></li>
					</ul>

					<!-- Tabs -->
					<div class="gtco-tab-content-wrap">

						<div class="gtco-tab-content tab-content active" data-tab-content="1">
							<div class="col-md-6">
								<div class="icon icon-xlg">
									<i class="icon-man"></i>
								</div>
							</div>
							<div class="col-md-6">
								<h2>儿童保险</h2>
								<p>Paragraph placeat quis fugiat provident veritatis quia iure a debitis adipisci dignissimos consectetur magni quas eius nobis reprehenderit soluta eligendi quo reiciendis fugit? Veritatis tenetur odio delectus quibusdam officiis est.</p>

								<p>Ullam dolorum iure dolore dicta fuga ipsa velit veritatis molestias totam fugiat soluta accusantium omnis quod similique placeat at. Dolorum ducimus libero fuga molestiae asperiores obcaecati corporis sint illo facilis.</p>

								<div class="row">
									<div class="col-md-6">
										<h2 class="uppercase">Keep it simple</h2>
										<p>Ullam dolorum iure dolore dicta fuga ipsa velit veritatis</p>
									</div>
									<div class="col-md-6">
										<h2 class="uppercase">Less is more</h2>
										<p>Ullam dolorum iure dolore dicta fuga ipsa velit veritatis</p>
									</div>
								</div>

							</div>
						</div>

						<div class="gtco-tab-content tab-content" data-tab-content="2">
							<div class="col-md-6">
								<div class="icon icon-xlg">
									<i class="icon-heart"></i>
								</div>
							</div>
							<div class="col-md-6">
								<h2>成人保险</h2>
								<p>Paragraph placeat quis fugiat provident veritatis quia iure a debitis adipisci dignissimos consectetur magni quas eius nobis reprehenderit soluta eligendi quo reiciendis fugit? Veritatis tenetur odio delectus quibusdam officiis est.</p>

								<p>Ullam dolorum iure dolore dicta fuga ipsa velit veritatis molestias totam fugiat soluta accusantium omnis quod similique placeat at. Dolorum ducimus libero fuga molestiae asperiores obcaecati corporis sint illo facilis.</p>

								<div class="row">
									<div class="col-md-6">
										<h2 class="uppercase">Ready to use</h2>
										<p>Ullam dolorum iure dolore dicta fuga ipsa velit veritatis</p>
									</div>
									<div class="col-md-6">
										<h2 class="uppercase">100% Satisfaction</h2>
										<p>Ullam dolorum iure dolore dicta fuga ipsa velit veritatis</p>
									</div>
								</div>

							</div>
						</div>

						<div class="gtco-tab-content tab-content" data-tab-content="3">
							<div class="col-md-6">
								<div class="icon icon-xlg">
									<i class="icon-paper-plane"></i>
								</div>
							</div>
							<div class="col-md-6">
								<h2>旅游保险</h2>
								<p>Ullam dolorum iure dolore dicta fuga ipsa velit veritatis molestias totam fugiat soluta accusantium omnis quod similique placeat at. Dolorum ducimus libero fuga molestiae asperiores obcaecati corporis sint illo facilis.</p>

								<p>Paragraph placeat quis fugiat provident veritatis quia iure a debitis adipisci dignissimos consectetur magni quas eius nobis reprehenderit soluta eligendi quo reiciendis fugit? Veritatis tenetur odio delectus quibusdam officiis est.</p>
								<div class="row">
									<div class="col-md-6">
										<h2 class="uppercase">Easy to shop</h2>
										<p>Ullam dolorum iure dolore dicta fuga ipsa velit veritatis</p>
									</div>
									<div class="col-md-6">
										<h2 class="uppercase">No credit card required</h2>
										<p>Ullam dolorum iure dolore dicta fuga ipsa velit veritatis</p>
									</div>
								</div>
								
							</div>
						</div>

						<div class="gtco-tab-content tab-content" data-tab-content="4">
							<div class="col-md-6">
								<div class="icon icon-xlg">
									<i class="icon-stack"></i>
								</div>
							</div>
							<div class="col-md-6">
								<h2>汽车保险</h2>
								<p>Paragraph placeat quis fugiat provident veritatis quia iure a debitis adipisci dignissimos consectetur magni quas eius nobis reprehenderit soluta eligendi quo reiciendis fugit? Veritatis tenetur odio delectus quibusdam officiis est.</p>

								<p>Ullam dolorum iure dolore dicta fuga ipsa velit veritatis molestias totam fugiat soluta accusantium omnis quod similique placeat at. Dolorum ducimus libero fuga molestiae asperiores obcaecati corporis sint illo facilis.</p>

								<div class="row">
									<div class="col-md-6">
										<h2 class="uppercase">Pixel perfect</h2>
										<p>Ullam dolorum iure dolore dicta fuga ipsa velit veritatis</p>
									</div>
									<div class="col-md-6">
										<h2 class="uppercase">User Interface Expert</h2>
										<p>Ullam dolorum iure dolore dicta fuga ipsa velit veritatis</p>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>

	<div id="gtco-features-2">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2>新闻中心</h2>
					<p></p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
				
				<c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
						 <c:if test = "${var.NEWS_STATUS == 1}">
						<div class="feature-left animate-box" data-animate-effect="fadeInLeft">
							<span class="icon">
								<i class="icon-check"></i>
							</span>
							<div class="feature-copy">
								<a href = "news/fg/show?NEWS_ID=${var.NEWS_ID}"><h3>${var.NEWS_TITLE}</h3></a>
								<p></p>
							</div>
						</div>
						 </c:if>
						</c:forEach>
					</c:when>
				<c:otherwise>
					<div class="feature-left animate-box" data-animate-effect="fadeInLeft">
							<span class="icon">
								<i class="icon-check"></i>
							</span>
							<div class="feature-copy">
								<h3>暂时没有新闻</h3>
								<p></p>
							</div>
						</div>
				</c:otherwise>
				</c:choose>

				</div>

				<div class="col-md-6">
					<div class="gtco-video gtco-bg" style="background-image: url(static/page/images/img_1.jpg); ">
						<a href="#/channels/staffpicks/93951774" class="popup-vimeo"><i class="icon-video2"></i></a>
						<div class="overlay"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

				
	

	<div id="gtco-testimonial">
		<div class="gtco-container">
			<!-- <div class="row"> -->
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
						<h2>成功案例</h2>
					</div>
				</div>
				<div class="row animate-box">
					
				
					<div class="owl-carousel owl-carousel-fullwidth ">
						<div class="item">
							<div class="testimony-slide active text-center">
								<figure>
									<img src="static/page/images/person_1.jpg" alt="user">
								</figure>
								<span></span>
								<blockquote>
									<p>&ldquo;我们尊崇“踏实、拼搏、责任”的企业精神，并以诚信、共赢、开创经营理念，创造良好的办公环境，以全新的管理模式，完善的技术，周到的服务，卓越的品质为生存根本&rdquo;</p>
								</blockquote>
							</div>
						</div>
						<div class="item">
							<div class="testimony-slide active text-center">
								<figure>
									<img src="static/page/images/person_2.jpg" alt="user">
								</figure>
								<span></span>
								<blockquote>
									<p>&ldquo;我们尊崇“踏实、拼搏、责任”的企业精神，并以诚信、共赢、开创经营理念，创造良好的办公环境，以全新的管理模式，完善的技术，周到的服务，卓越的品质为生存根本&rdquo;</p>
								</blockquote>
							</div>
						</div>
						<div class="item">
							<div class="testimony-slide active text-center">
								<figure>
									<img src="static/page/images/person_3.jpg" alt="user">
								</figure>
								<span></span>
								<blockquote>
									<p>&ldquo;我们尊崇“踏实、拼搏、责任”的企业精神，并以诚信、共赢、开创经营理念，创造良好的办公环境，以全新的管理模式，完善的技术，周到的服务，卓越的品质为生存根本&rdquo;</p>
								</blockquote>
							</div>
						</div>
					</div>
				</div>
			<!-- </div> -->
		</div>
	</div>


	<footer id="gtco-footer" role="contentinfo">
		<div class="gtco-container">

			<div class="row copyright">
				<div class="col-md-12">
					<p class="pull-left">
						<small class="block">&copy; 2016 Free HTML5. All Rights Reserved.</small> 
					</p>
				</div>
			</div>

		</div>
	</footer>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	

	</body>
</html>

