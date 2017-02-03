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
	<title>惠保永泽</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="惠保永泽" />
	

	

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
							<h2>你的专属家庭保险服务经验顾问</h2>
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
						<h3></h3>
						<p></p>
						<p><a href="policy/fg/index" class="btn btn-primary">服务卡激活</a></p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-command"></i>
						</span>
						<h3></h3>
						<p></p>
						<p><a href="claimsys/fg/goSearch" class="btn btn-primary">保单查询</a></p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-power"></i>
						</span>
						<h3></h3>
						<p></p>
						<p><a href="onlinemsg/fg/index" class="btn btn-primary">在线留言</a></p>
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

								<span class="counter js-counter" data-from="0" data-to="22070932" data-speed="5000" data-refresh-interval="50">1</span>
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

								<span class="counter js-counter" data-from="0" data-to="2023" data-speed="5000" data-refresh-interval="50">1</span>
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
								<p>选择儿童保险,首先要从最基本的健康保险入手。</p>

								<p>第一需要留意的就是宝宝因为疾病和意外引起的住院医疗费用;</p>
								<p>第二就是随着环境污染和食品安全问题导致的少儿高发的重大疾病方面的保障;</p>
								<p>在孩子健康,医疗都规划好的情况下再考虑孩子的教育金保障。</p>

								<div class="row">
									<div class="col-md-6">
										<h2 class="uppercase">意外保险</h2>
										<p>意外伤害是指突然发生的各种实践或事故对人体所造成的损伤，包括各种物理、化学和生物因素</p>
									</div>
									<div class="col-md-6">
										<h2 class="uppercase">教育储备</h2>
										<p>为学生缴纳的一种特殊学费，其与普通学费的不同之处在于依照与学校间的书面约定或口头约定</p>
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
								<p>意外伤害类保险是成年人首先需要配置的,这是因为意外风险几乎无法防范,一旦发生会对您和您的家庭带来非常严重的影响。其次根据现有数据统计,成年人一生患重疾的概率为72.8%,所以配置含有重大疾病保障的健康保险也是您保障的重中之重。</p>

								<p>与此同时,您还需要考虑配置一定的定期寿险,保障额度以覆盖车、房贷偿还时间及赡养父母、抚养孩子所需费用为宜。最后,在您的预算范围内,考虑配置与养老和理财相关的产品。</p>

								<div class="row">
									<div class="col-md-6">
										<h2 class="uppercase">健康医疗</h2>
										<p>成人医疗险的选择,主要看产品的住院医疗的报销额度以及赔付比例的高低,另外有社保跟无社保人群选择的产品是不一样的,一个是做社保补充,另一个是代替社保。其次,需要注意的是是否有用药限制。最后,需要留意的就是免赔额。</p>
									</div>
									<div class="col-md-6">
										<h2 class="uppercase">储蓄理财</h2>
										<p>理财险的选择,保险理财产品大多数都是保本增值的,安全性更高,所以我们在选择理财产品的时候首先要看的就是在保本的基础上产品收益的高低。其次我们根据我们准备投入这笔资金的用途以及时间长短来确定我们选择的理财产品的类型。</p>
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
								<p>旅游保险针对不同的旅游场景都设计了相应的保障,因此我们可以根据行目的地、旅游期间从事的活动来选择保险产品,其次要考虑的是相关的保障额度是否符合出行地区的消费水平,特别提醒办理签证保险是有30万保额要求的。</p>

								<div class="row">
									<div class="col-md-6">
										<h2 class="uppercase">国内旅游</h2>
										<p>一般的旅游观光,仅购买普通旅游险产品即可,如出行较远且有老人或小孩子的则需要补充急性病、紧急救援和医疗送反保障的产品、当然保额的高低也是一个重要的参考条件,短期旅游险都比较便宜保额可以选择高一些。</p>
									</div>
									<div class="col-md-6">
										<h2 class="uppercase">户外运动</h2>
										<p>涉及户外运动的种类非常多,比如潜水、溯溪、徒步、登山、穿越、自驾等等,不同的户外类型风险不同保障侧重也各不相同,总体来说户外运动实际突发意外较多,尽量选择较高保额,且涵盖医疗运送和紧急救援的保障比较适合。另外在挑选户外险时也要注意核实从事的户外项目是否在保障责任中。</p>
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
								<h2>交通安全</h2>
								<p>在选择交通工具意外险时,主要评估出行乘坐交通工具的类型挑选适合的产品。经常出差的商务人士,可以购买一年期产品,价格便宜且免去经常投保的繁琐;偶尔出差、旅游的 用户,可以按天数购买短期的产品。如果日常生活工作建议投保综合意外保险会更加划算。</p>

								<div class="row">
									<div class="col-md-6">
										<h2 class="uppercase">飞机</h2>
										<p>我们可以根据实际的出行频次来选择航空保险会更加划算,作为经常飞行的空中飞人们直接投保一份全年的航意险会更加方便,而出行频次较低每次购买单次航意险会更加划算 。另外可以根据出行目的地和出发地的天气情况选择航班延误险作为补充,减少延误损失。</p>
									</div>
									<div class="col-md-6">
										<h2 class="uppercase">自驾</h2>
										<p>7座或7座以下非营运机动车才能投保自驾车保险,自驾出行除驾驶人员保障外还需要兼顾乘车人保障,同时还要留意的是否有提供自驾车服务保障等一系列紧急救援服务等。当 然停车后的娱乐活动也是选择产品的参考要素之一。</p>
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
						<a href="https://imgcache.qq.com/tencentvideo_v1/playerv3/TPout.swf?max_age=86400&v=20161117&vid=v0371cbkylt&auto=0" class="popup-vimeo"><i class="icon-video2"></i></a>
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
						<h2>企业文化</h2>
					</div>
				</div>
				<div class="row animate-box">
					
				
					<div class="owl-carousel owl-carousel-fullwidth ">
						<div class="item">
							<div class="testimony-slide active text-center">
								<figure>
									<img src="static/page/images/phone.jpg" alt="user">
								</figure>
								<span></span>
								<blockquote>
									<p>&ldquo;客户至上——帮助客户实现想法，协助客户提升更强的生产力与竞争力，坚信客户满意是事业发展的根基&rdquo;</p>
								</blockquote>
							</div>
						</div>
						<div class="item">
							<div class="testimony-slide active text-center">
								<figure>
									<img src="static/page/images/phone.jpg" alt="user">
								</figure>
								<span></span>
								<blockquote>
									<p>&ldquo;和谐共享——重视团队的功绩，将个人追求融入企业的长远发展，团结坦诚，永不言弃，共同发展&rdquo;</p>
								</blockquote>
							</div>
						</div>
						<div class="item">
							<div class="testimony-slide active text-center">
								<figure>
									<img src="static/page/images/phone.jpg" alt="user">
								</figure>
								<span></span>
								<blockquote>
									<p>&ldquo;疯狂创新——疯狂地学习，勇于异想天开，专注于能为客户和公司带来优势的创新，坚信创新才能带来真正成功&rdquo;</p>
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
	
	<div id=floater style="Z-INDEX: 100; RIGHT: 10px; VISIBILITY: visible; WIDTH: 100px; POSITION: fixed; TOP: 75%; left: 95%;" >   
		<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=963396570&amp;site=qq&amp;menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:963396570:53" alt="点击这里给我发消息" title="点击这里给我发消息"></a>
	</div>

	</body>
</html>

