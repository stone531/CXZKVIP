<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>创享智库—中国最具影响力的创新商业智库</title>
<meta name="keywords" content="创享智库,创享智库公司,北京创享智库,商业模式创新">
<meta name="description" content="创享智库是一家具有全球视野的商业智库机构，致力于激活中国商业创新思想，再造中国企业商业模式，推动中国产业转型升级！" />
<link rel="stylesheet" type="text/css" href="static/show/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="static/show/css/default.css">
<link rel="stylesheet" type="text/css" href="static/show/css/styles.css">
<!--[if IE]>
<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
<![endif]-->
</head>
<body>
	<div class="main">
	  <div class="sidebar-hover">
	    <p class="pagination">
	      <span class="page">01</span> / <span class="total-pages">08</span>
	    </p>
	  </div>
	  <div class="sidebar-real">
	    <div data-page="1" class="nav-elem nav-1 active"></div>
	    <div data-page="2" class="nav-elem nav-2"></div>
	    <div data-page="3" class="nav-elem nav-3"></div>
	    <div data-page="4" class="nav-elem nav-4"></div>
	    <div data-page="5" class="nav-elem nav-5"></div>
	    <div data-page="6" class="nav-elem nav-6"></div>
	    <div data-page="7" class="nav-elem nav-7"></div>
	    <div data-page="8" class="nav-elem nav-8"></div>
	  </div>
	  <div class="sections">
	    <div class="section section-1">
	      <div class="left-part"></div>
	      <div class="content">
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <h2 class="section-heading"></h2>
	        <p class="additional-text"></p>
	      </div>
	    </div>
	    <div class="section section-2">
	      <div class="left-part"></div>
	      <div class="content">
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <h2 class="section-heading"></h2>
	        <p class="additional-text"></p>
	      </div>
	    </div>
	    <div class="section section-3">
	      <div class="left-part"></div>
	      <div class="content">
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <h2 class="section-heading"></h2>
	        <p class="additional-text"></p>
	      </div>
	    </div>
	    <div class="section section-4">
	      <div class="left-part"></div>
	      <div class="content">
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <h2 class="section-heading"></h2>
	        <p class="additional-text"></p>
	      </div>
	    </div>
	    <div class="section section-5">
	      <div class="left-part"></div>
	      <div class="content">
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <h2 class="section-heading"></h2>
	        <p class="additional-text"></p>
	      </div>
	    </div>
	    <div class="section section-6">
	      <div class="left-part"></div>
	      <div class="content">
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <h2 class="section-heading"></h2>
	        <p class="additional-text"></p>
	      </div>
	    </div>
	    <div class="section section-7">
	      <div class="left-part"></div>
	      <div class="content">
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <h2 class="section-heading"></h2>
	        <p class="additional-text"></p>
	      </div>
	    </div>
	    <div class="section section-8">
	      <div class="left-part"></div>
	      <div class="content">
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <div class="bg-part"></div>
	        <h2 class="section-heading"></h2>
	        <p class="additional-text"></p>
	      </div>
	    </div>
	  </div>
	  <h2 class="scroll-down"></h2>
	</div>
	
<script type="text/javascript" src='static/show/js/stopExecutionOnTimeout.js'></script>
<script type="text/javascript" src='static/show/js/jquery.min.js'></script>
<script type="text/javascript" src="static/show/js/main.js"></script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p></p>
<p></p>
</div>
</body>
</html>