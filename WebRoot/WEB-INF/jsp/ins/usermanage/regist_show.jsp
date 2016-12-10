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
<html id="login-register-page" lang="zh-cmn">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="static/usermanage/js/click.js"></script>
<script src="static/usermanage/js/pv.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <title>用户注册</title>
    <meta http-equiv="Cache-Control" content="no-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">

    
   <!-- <script src="static/usermanage/js/hm.js"></script> 
    <script src="./user_register/hznewga.js" type="text/javascript"></script><script src="./user_register/hz-analytics.js"></script>
	<script async src="./user_register/analytics.js">-->
	<script src="static/usermanage/js/jquery.min.js" type="text/javascript"></script>
    <script src="static/usermanage/js/jquery.base64.min.js" type="text/javascript"></script>
    <script src="static/usermanage/js/json2.js" type="text/javascript"></script>
    <script src="static/usermanage/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="static/usermanage/js/jquery.validate.unobtrusive.js" type="text/javascript"></script>
    <script src="static/usermanage/js/jquery.unobtrusive-ajax.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="static/usermanage/js/formValidate.min.js"></script>
    
    <%@ include file="../../ht.jsp"%>
   
    <link rel="stylesheet" type="text/css" href="static/usermanage/css/register.css">
    <link rel="stylesheet" href="static/usermanage/css/base.css">
	<!--  link rel="stylesheet" href="static/usermanage/css/index.css" -->

	<link rel="stylesheet" href="static/usermanage/css/swiper.min.css">
    
<style id="placeholder__">.placeholder-wrap{position: relative;display: inline-block;}.placeholder-text{position: absolute; }.placeholder-input{position: relative;background-color: transparent; z-index: 1;}</style></head>
<body>  
 	<%@ include file="../../head.jsp"%>       
    <!--  div class="login-register-header pt25 pb25">
    <div class="layout">
        <div class="inline-block header-text f24 pl20 ml20 ">
        	
        </div>
    </div>
</div-->
    <div class="login-register-wrap register-wrap">
    <div class="layout pt20 clearfix">
        <form class="login-register-form bgfw">

        <ul class="hz-tab-menu hz-tab-style01 login-register-tab-menu">
            <li class="hz-tab-menu-item active" registertype="1"><a href="javascript:;" title="手机号注册">手机号注册</a></li>
        </ul>
        <div class="tab-container">
            <div class="tab-pane" registertype="1" id="divMobile">
                <div class="error-msg" id="mobileErrMsg"></div>

                <div class="">
                    <span class="placeholder-wrap"><span class="placeholder-text" id="placeholder-id-mobile" style="width: auto; height: 40px; left: 10px; top: 0px; z-index: 1; font-size: 14px; line-height: 40px; color: rgb(153, 153, 153);"></span><input class="input-text placeholder-item placeholder-input" type="text" validate="true" format="mobile" autoblurvalidate="true" errmsgid="mobileErrMsg" blurvalidateafter="existsTxtMobile" maxlength="11" minlength="11" notempty="true" placeholder-text="手机号" " id="txtMobile" style="z-index: 2;"></span>
                </div>

                <div class="mt10">
                    <span class="placeholder-wrap"><span class="placeholder-text" id="placeholder-id-verify" style="width: auto; height: 40px; left: 10px; top: 0px; z-index: 1; font-size: 14px; line-height: 40px; color: rgb(153, 153, 153);"></span><input class="input-text placeholder-item placeholder-input" style="width: 144px; z-index: 2;" type="text" id="txtMobileVerify" autoblurvalidate="true" errmsgid="mobileErrMsg" maxlength="4" minlength="4" validate="true" notempty="true" placeholder-text="图片验证码" "></span>
                    <img alt="验证码" class="verifyImg" id="imgVerify" title="换一张" width="103" height="40" style="cursor: pointer; margin-left: 7px;" src="static/usermanage/js/VerifyCode">
                </div>

                <div class="mt10">
                    <span class="placeholder-wrap"><span class="placeholder-text" style="width: auto; height: 40px; left: 10px; top: 0px; z-index: 1; font-size: 14px; line-height: 40px; color: rgb(153, 153, 153);"></span><input class="input-text placeholder-item placeholder-input" maxlength="6" minlength="6" style="width: 144px; z-index: 2;" id="txtSmsCode" validate="true" notempty="true" placeholder-text="短信验证码" type="text"></span>
                    <a class="hz-button get-code-button" href="javascript:;" id="getSmsCode">发送验证码</a>
                </div>

                <div class="mt10">
                    <span class="placeholder-wrap"><span class="placeholder-text" style="width: auto; height: 40px; left: 10px; top: 0px; z-index: 1; font-size: 14px; line-height: 40px; color: rgb(153, 153, 153);"></span><input class="input-text placeholder-input" type="password" validate="true" notempty="true" autoblurvalidate="true" errmsgid="mobileErrMsg" id="txtMobilePassword" minlength="6" maxlength="20" placeholder-text="密码（至少6位）" style="z-index: 2;"></span>
                </div>
                    <!--pwd-active-1 末尾数字分别代表弱中强-->
                    <div class="clearfix register-pwd-letter" id="divMobilePwd">
                        <span class="first-item">弱</span>
                        <span class="mid-item">中</span>
                        <span class="last-item">强</span>
                    </div>

                <div class="mt10">
                    <span class="placeholder-wrap"><span class="placeholder-text" style="width: auto; height: 40px; left: 10px; top: 0px; z-index: 1; font-size: 14px; line-height: 40px; color: rgb(153, 153, 153);"></span><input class="input-text placeholder-input" type="password" validate="true" notempty="true" autoblurvalidate="true" errmsgid="mobileErrMsg" minlength="6" maxlength="20" valueequalid="txtMobilePassword" id="txtMobileConfirmPassword" placeholder-text="密码确认" style="z-index: 2;"></span>
                </div>

                <!-- <div class="mt10">  注册即表示同意 《<a href="" target="_blank">会员协议</a>》</div> -->

                <div class="mt20 login-action">
                    <a class="hz-button hz-button-block hz-button-primary" href="javascript:;">立即注册</a>
                </div>

                <div class="login-meta mt20 tar">
                    <a href="usermanage/login/show" class="primary-link regnew-link">返回登录</a>
                </div>

            </div>

            <div class="tab-pane fn-hide" registertype="2" id="divMail">
                <div class="error-msg" id="mailErrMsg"></div>
                <div class="">
                    <span class="placeholder-wrap"><span class="placeholder-text" style="width: auto; height: 40px; left: 10px; top: 0px; z-index: 1; font-size: 14px; line-height: 40px; color: rgb(153, 153, 153);">邮箱</span><input id="txtMail" class="input-text placeholder-item placeholder-input" type="text" placeholder-text="邮箱" autoblurvalidate="true" errmsgid="mailErrMsg" validate="true" format="mail" maxlength="100" notempty="true" blurvalidateafter="existsTxtMail" style="z-index: 2;"></span>
                </div>

                <div class="mt10">
                    <span class="placeholder-wrap"><span class="placeholder-text" style="width: auto; height: 40px; left: 10px; top: 0px; z-index: 1; font-size: 14px; line-height: 40px; color: rgb(153, 153, 153);">邮件验证码</span><input class="input-text placeholder-item placeholder-input" id="txtMailCode" notempty="true" validate="true" maxlength="6" minlength="6" style="width: 144px; z-index: 2;" type="text" placeholder-text="邮件验证码"></span>
                    <a class="hz-button get-code-button" href="javascript:;" id="getMailCode">发送验证码</a>
                </div>

                <div class="mt10">
                    <span class="placeholder-wrap"><span class="placeholder-text" style="width: auto; height: 40px; left: 10px; top: 0px; z-index: 1; font-size: 14px; line-height: 40px; color: rgb(153, 153, 153);">密码（至少6位）</span><input class="input-text placeholder-item placeholder-input" type="password" id="txtMailPassword" autoblurvalidate="true" errmsgid="mailErrMsg" validate="true" notempty="true" minlength="6" maxlength="20" placeholder-text="密码（至少6位）" style="z-index: 2;"></span>
                </div>
                    <!--pwd-active-1 末尾数字分别代表弱中强-->
                    <div class="clearfix register-pwd-letter" id="divMailPwd">
                        <span class="first-item">弱</span>
                        <span class="mid-item">中</span>
                        <span class="last-item">强</span>
                    </div>

                <div class="mt10">
                    <span class="placeholder-wrap"><span class="placeholder-text" style="width: auto; height: 40px; left: 10px; top: 0px; z-index: 1; font-size: 14px; line-height: 40px; color: rgb(153, 153, 153);">密码确认</span><input class="input-text placeholder-item placeholder-input" type="password" id="txtMailConfirmPassword" autoblurvalidate="true" errmsgid="mailErrMsg" validate="true" notempty="true" minlength="6" maxlength="20" valueequalid="txtMailPassword" placeholder-text="密码确认" style="z-index: 2;"></span>
                </div>

                <div class="mt10">
                    注册即表示同意 《<a href="https://passport.huize.com/register/ReadContract" target="_blank">会员协议</a>》</div>
                <div class="mt20 login-action">
                    <a class="hz-button hz-button-block hz-button-primary" href="javascript:;">立即注册</a>
                </div>

                <div class="login-meta mt20 tar">
                    <span>|</span> <a href="https://passport.huize.com/signin/?returnurl=http://i.huize.com/?url=MySafe/PolicyAll" class="primary-link regnew-link">返回登录</a>
                </div>
            </div>
        </div>

    
        </form>
		</div>
		</div>

<%@ include file="../../tail.jsp"%>
    <!--  div class="hz-copyright tac">
<div class="footer_copy"><span>&copy;Matrix Cube 2015 北京中正陆人网络科技有限公司版权所有 - 京ICP备15000365号-2</span></div>
</div -->
<script src="static/usermanage/js/hm.js"></script>
<script async src="static/usermanage/js/analytics.js"></script>



<script src="static/usermanage/js/jquery-placeholder.js"></script>
<script type="text/javascript" src="static/usermanage/js/LoginRegisterCommon.min.js"></script>
<script type="text/javascript" src="static/usermanage/js/Register.min.js"></script>
</body></html>