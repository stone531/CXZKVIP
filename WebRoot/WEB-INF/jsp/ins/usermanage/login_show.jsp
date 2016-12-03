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
<html id="login-register-page" lang="zh-cmn">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="static/usermanage/js/click.js"></script>
<script src="static/usermanage/js/pv.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <title>用户登陆</title>
    <meta http-equiv="Cache-Control" content="no-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">


	<script src="static/usermanage/js/jquery.min.js" type="text/javascript"></script>
    <script src="static/usermanage/js/jquery.base64.min.js" type="text/javascript"></script>
    <script src="static/usermanage/js/json2.js" type="text/javascript"></script>
    <script src="static/usermanage/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="static/usermanage/js/jquery.validate.unobtrusive.js" type="text/javascript"></script>
    <script src="static/usermanage/js/jquery.unobtrusive-ajax.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="static/usermanage/js/formValidate.min.js"></script>
   
    <link rel="stylesheet" type="text/css" href="static/usermanage/css/register.css">
    	<link rel="stylesheet" href="static/usermanage/css/base.css">
	<link rel="stylesheet" href="static/usermanage/css/index.css">

	<link rel="stylesheet" href="static/usermanage/css/swiper.min.css">
    
<style id="placeholder__">.placeholder-wrap{position: relative;display: inline-block;}.placeholder-text{position: absolute; }.placeholder-input{position: relative;background-color: transparent; z-index: 1;}</style></head>
<body>        
    <div class="login-register-header pt25 pb25">
    <div class="layout">
    <div class="inline-block header-text f24 pl20 ml20 ">
        <%@ include file="../main/header.jsp"%>
        </div>
    </div>
</div>

<div class="login-register-wrap login-wrap" style="height:560px;overflow:hidden;">
    <div class="layout pt40 clearfix">
        <form action="https://passport.huize.com/SignIn/SignInP" data-ajax="true" data-ajax-failure="Failure" data-ajax-success="Success" id="form0" method="post" class="login-register-form bgfw">
        <ul class="hz-tab-menu hz-tab-style01 login-register-tab-menu">
            <li class="hz-tab-menu-item active" logintype="1"><a href="javascript:;" title="用户登录">
            用户登录</a></li>

        </ul>
        <div class="tab-container">
            <div class="tab-pane" logintype="1" id="divMemberLogin">
                <div class="error-msg" id="memberErrMsg">
                </div>
                <div class="">
                    <span class="placeholder-wrap"><span class="placeholder-text" style="width: auto; height: 40px; left: 10px; top: 0px; z-index: 1; font-size: 14px; line-height: 40px; color: rgb(153, 153, 153);"></span>
                    <input class="input-text placeholder-item placeholder-input" type="text" id="LoginName" name="LoginName" value="" validate="true" autoblurvalidate="true" errmsgid="memberErrMsg" notempty="true" placeholder="手机" style="z-index: 2;"></span>
                </div>
                <div class="mt10">
                    <span class="placeholder-text" style="width: auto; height: 40px; left: 10px; top: 0px; z-index: 1; font-size: 14px; line-height: 40px; color: rgb(153, 153, 153);"></span>
                    <input class="input-text placeholder-item placeholder-input" validate="true" id="txtPassword" name="txtPassword" notempty="true" autoblurvalidate="true" errmsgid="memberErrMsg" placeholder="密码" type="password" style="z-index: 2;">
                    </span>
                    <input type="hidden" id="Password" name="Password">
                </div>

                <div class="mt10" id="divVerificationCode">
                    <span class="placeholder-wrap"><span class="placeholder-text" style="width: auto; height: 40px; left: 10px; top: 0px; z-index: 1; font-size: 14px; line-height: 40px; color: rgb(153, 153, 153);"></span><input class="input-text placeholder-item placeholder-input" id="VerificationCode" name="VerificationCode" validate="true" autoblurvalidate="true" errmsgid="memberErrMsg" notempty="true" style="width: 144px; z-index: 2;" maxlength="4" minlength="4" validatedependvisibleid="divVerificationCode" type="text" placeholder="验证码"></span>
                    <img alt="验证码" class="verifyImg" title="换一张" width="103" height="40" style="cursor: pointer;
                        margin-left: 7px;" src="static/usermanage/js/VerifyCode">
                </div>
                <div class="mt20 login-action">
                    <a loginidentity="true" id="btn_login" class="hz-button hz-button-block hz-button-primary" >立即登录</a>
                </div>
                <div class="login-meta mt20 tar">
                    <a href="usermanage/register/show" class="primary-link regnew-link" target="_blank">注册新账号</a>
                    <a href="usermanage/register/pass/show" target="_blank">忘了密码 </a>
                </div>
            </div>
        </div>
        </form>
    </div>
</div>
 <div class="hz-copyright tac">
<div class="footer_copy"><span>&copy;Matrix Cube 2015 北京中正陆人网络科技有限公司版权所有 - 京ICP备15000365号-2</span></div>
</div>
<script src="static/usermanage/js/hm.js"></script>
<script async src="static/usermanage/js/analytics.js"></script>
<script src="static/usermanage/js/jquery-placeholder.js"></script>
<!--
<script type="text/javascript" src="static/usermanage/js/Register.min.js"></script> -->
 <script type="text/javascript" src="static/usermanage/js/LoginRegisterCommon.min.js"></script>
<script type="text/javascript" src="static/usermanage/js/login.js"></script>

	</body>
</html>