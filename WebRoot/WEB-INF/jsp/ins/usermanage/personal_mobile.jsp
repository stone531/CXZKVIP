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

    <script src="static/usermanage/js/json2.js" type="text/javascript"></script>
    <script src="static/usermanage/js/jquery.base64.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="static/usermanage/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="static/usermanage/js/jquery.validate.js"></script>
	<script type="text/javascript" src="static/usermanage/js/upmobile.js"></script>

	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<script src="static/usermanage/js/jquery-placeholder.js"></script>
   
    <link rel="stylesheet" type="text/css" href="static/usermanage/css/register.css">
    <link rel="stylesheet" href="static/usermanage/css/base.css">
	<link rel="stylesheet" href="static/usermanage/css/index.css">

	<link rel="stylesheet" href="static/usermanage/css/swiper.min.css">
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
    <%@ include file="../../ht.jsp"%> 
  </head><body>
   <%@ include file="../../head.jsp"%>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <hr>
          </div>
        </div>
      </div>
    </div>
    <div id="section-mobile">
      <div class="container">
        <div class="error-msg" id="mobileErrMsg" style="color:red"></div>
        <form role="form" id="mobileForm">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
			  <input  class="form-control" type="text"  placeholder="输入新手机号" id="txtMobile" name="txtMobile" style="z-index: 2;">           
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <input class="form-control " style="z-index: 2;" type="text" id="txtMobileVerify" name="txtMobileVerify" placeholder="图片验证码">
            </div>
          </div>
          <div class="col-md-2">
            <img alt="验证码" class="verifyImg" id="imgVerify" title="换一张" width="103" height="40" style="cursor: pointer; margin-left: 7px;" src="static/usermanage/js/VerifyCode">
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <input class="form-control" style=" z-index: 2;" id="txtSmsCode" name="txtSmsCode"  placeholder="短信验证码" type="text">
            </div>
          </div>
          <div class="col-md-2">
            <a class="hz-button get-code-button" href="javascript:;" id="getSmsCode">发送验证码</a>
          </div>
        </form>
        <div class="row">
          <div class="col-md-12">
            <a class="btn btn-lg btn-primary" id="btn-update-mobile">确认修改</a>
            <a class="btn btn-lg btn-primary" id="btn-update-cancel">取消修改</a>
          </div>
        </div>
        
      </div>
    </div>
     
    <%@ include file="../../tail.jsp"%>
    </body></html>