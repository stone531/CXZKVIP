	<%@page pageEncoding="UTF-8"%>  
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1">	
	<style>
		.swiper-container {
			width: 100%;
			height: 100%;
		}
		.swiper-slide {
			text-align: center;
			font-size: 18px;
			background: #fffff;
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
<div class="navbar">
	<div class="navbar_wrapInner">
		<div class="navbar_logo_img">
			<span>永保惠择</span>
		</div>
		<div class="navbar_bottom">
			<ul>
				<li class="head_navigation_link" style="border-right: 1.5px solid #7f868b;"><a href="claimsys/goSearch" target="kfz_center">进度查询</a></li>
				<li class="head_navigation_link"><a href="claimsys/goAdd" target="kfz_center">在线报险</a></li>
				<li class="head_navigation_link isIndex" style="border-right: 1.5px solid #7f868b;width: 16%;"><a href="page/index"  target="kfz_center">首页</a></li>
			</ul>
		</div>
		<div class="navbar_bottom_right">
			<ul class="unlogin">
				<li><a href="usermanage/login/show">登录</a></li><span style="color: #7a8186">|</span>
				<li><a href="usermanage/register/show">注册</a></li><span>&nbsp;&nbsp;</span>
			</ul>
			<ul class="welcom" style="display:none">
				<li><a id="mobile"></a></li>
				<li><a id="logout">退出</a></li>
			</ul>
			
		</div>
	</div>
</div>
