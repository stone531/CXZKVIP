<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="static/usermanage/js/click.js"></script>
	<script src="static/usermanage/js/pv.js"></script>
	<script type="text/javascript" src="static/usermanage/js/formValidate.min.js"></script>
	<script src="static/usermanage/js/jquery.base64.min.js" type="text/javascript"></script>
    <script src="static/usermanage/js/json2.js" type="text/javascript"></script>
    <script src="static/usermanage/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="static/usermanage/js/jquery.validate.unobtrusive.js" type="text/javascript"></script>
    <script src="static/usermanage/js/jquery.unobtrusive-ajax.min.js" type="text/javascript"></script>
  
	<script async src="static/usermanage/js/analytics.js"></script>



<script src="static/usermanage/js/jquery-placeholder.js"></script>
<script type="text/javascript" src="static/usermanage/js/LoginRegisterCommon.min.js"></script>
<script type="text/javascript" src="static/usermanage/js/Register.min.js"></script>
   
    <link rel="stylesheet" type="text/css" href="static/usermanage/css/register.css">
    <link rel="stylesheet" href="static/usermanage/css/base.css">
	<link rel="stylesheet" href="static/usermanage/css/index.css">

	<link rel="stylesheet" href="static/usermanage/css/swiper.min.css">
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
  </head><body>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <hr>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
       <div class="error-msg" id="mobileErrMsg" style="color:red"></div>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
             <input id="mobile-type" value="1" style="display:none;">
             <input class="form-control input-text placeholder-item placeholder-input" type="text" validate="true" format="mobile" autoblurvalidate="true" errmsgid="mobileErrMsg" blurvalidateafter="existsTxtMobile" maxlength="11" minlength="11" notempty="true" placeholder="手机号" " id="txtMobile" style="z-index: 2;">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <input class="form-control input-text placeholder-item placeholder-input" style="z-index: 2;" type="text" id="txtMobileVerify" autoblurvalidate="true" errmsgid="mobileErrMsg" maxlength="4" minlength="4" validate="true" notempty="true" placeholder="图片验证码" ">
            </div>
          </div>
          <div class="col-md-2">
            <img alt="验证码" class="verifyImg" id="imgVerify" title="换一张" width="103" height="40" style="cursor: pointer; margin-left: 7px;" src="static/usermanage/js/VerifyCode">
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <input class="form-control input-text placeholder-item placeholder-input" maxlength="6" minlength="6" style=" z-index: 2;" id="txtSmsCode" validate="true" notempty="true" placeholder="短信验证码" type="text">
            </div>
          </div>
          <div class="col-md-2">
            <a class="hz-button get-code-button" href="javascript:;" id="getSmsCode">发送验证码</a>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <input class="form-control input-text placeholder-input" type="password" validate="true" notempty="true" autoblurvalidate="true" errmsgid="mobileErrMsg" id="txtMobilePassword" minlength="6" maxlength="20" placeholder="密码（至少6位）" style="z-index: 2;">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <input class="form-control input-text placeholder-input" type="password" validate="true" notempty="true" autoblurvalidate="true" errmsgid="mobileErrMsg" minlength="6" maxlength="20" valueequalid="txtMobilePassword" id="txtMobileConfirmPassword" placeholder="密码确认" style="z-index: 2;">
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <a class="btn btn-lg btn-primary" id="btn-update">确认修改</a>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <hr>
          </div>
        </div>
      </div>
    </div>
  

</div></body></html>