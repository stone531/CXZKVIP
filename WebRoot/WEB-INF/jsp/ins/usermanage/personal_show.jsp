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
<html><head>
    <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

 <script src="static/usermanage/js/json2.js" type="text/javascript"></script>
    <script src="static/usermanage/js/jquery.base64.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="static/usermanage/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="static/usermanage/js/jquery.validate.js"></script>

	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<script src="static/usermanage/js/jquery-placeholder.js"></script>
    <script type="text/javascript" src="static/usermanage/js/rule.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
    
    <!--    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script> 
        -->
        
 <%@ include file="../../ht.jsp"%>
</head>
<body>
	<%@ include file="../../head.jsp"%>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section">
              <div class="container">
                <div class="row">
                  <div class="col-md-12">
                    <hr>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
         <div class="col-md-2"></div>
         <div class="col-md-10" ><h4 class="text-danger text-left" id="memberErrMsg"></h4></div>
          <div class="col-md-2">
            <ul class="list-group">
              <li class="list-group-item" id="li-info" style="cursor: pointer;">
                <a>账户信息</a>
              </li>
              <li class="list-group-item" id="li-pass" style="cursor: pointer;">
                <a>修改密码</a>
              </li>
            </ul>
          </div>
          <div class="col-md-10">
            <div class="row">
              <div id="welcome" style="text-align:center">
                <h1>欢迎~</h1>
              </div>
            </div>
            <input id = "Comp-UserType"  value="${pd.USERTYPE}" style="display:none;"></input>
            <div id="company-info" style="display:none;">
            <form role="form" class="form-horizontal" id="company-valid-form">
              <div class="form-group">
              	<div class="col-sm-2">
                   <label class="control-label">用户名</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="NICKNAME" value="${pd.NICKNAME }" placeholder="用户名" type="text" required="">
                </div>
              </div>
              <div class="form-group">
              <div class="col-sm-2">
                   <label class="control-label">公司名称</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="COMPNAME" value="${pd.COMPNAME}" placeholder="公司名称" type="text" required="">
                </div>
              </div>
              <div class="form-group">
              <div class="col-sm-2">
                   <label class="control-label">营业执照号码</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="COMPNUM" value="${pd.COMPNUM}" placeholder="营业执照号码" type="text" required="">
                </div>
              </div>
              <div class="form-group">
               <div class="col-sm-2">
                   <label class="control-label">联系地址</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="ADDRESS" value="${pd.ADDRESS}" placeholder="联系地址" type="text" required="">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                   <label class="control-label">办公电话</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="PHONE" value="${pd.PHONE}" placeholder="办公电话" type="digits">
                </div>
              </div>
              <div class="form-group">
               <div class="col-sm-2">
                   <label class="control-label">负责人姓名</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="REALNAME" value="${pd.REALNAME}" placeholder="负责人姓名" type="text" required="">
                </div>
              </div>
              <div class="form-group">
               <div class="col-sm-2">
                   <label class="control-label">邮箱</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="EMAIL" value="${pd.EMAIL}" placeholder="邮箱" type="email" required="">
                </div>
              </div>
              <div class="form-group">
                <label class="control-label" for="exampleInputPassword1">营业执照</label>
                <img id="PIC1" src="${pd.PIC1}"/>
              </div>
              <div class="form-group">
                <label class="control-label" for="exampleInputPassword1">税务登记证</label>
                <img id="PIC2" src="${pd.PIC2}"/>
              </div>
              <div class="form-group">
                <label class="control-label" for="exampleInputPassword1">组织结构代码证</label>
                <img id="PIC3" src="${pd.PIC3}"/>
              </div>
              <div class="col-sm-2">
              </div>
              <div class="col-sm-5">
              <a class="btn btn-primary" href="usermanage/personal/company" type="redit">重新编辑</a>
              </div>
              <div class="col-sm-5">
              <h3 id="notify-msg" style="color:red"></h3>
              </div>
              <div class="col-sm-10">
              <h5 style="color:red">${pd.REMARK}</h5>
              </div>
            </form>
          </div>
            <div id="pass-update" style="display:none;">
              <form role="form" id="pass_form">
              	<div class="form-group">
                  <h5 style="color:red" id="upPassMsg"></h5>
                </div>
                <div class="form-group">
                  <input class="form-control" id="PrePASS" name="PrePASS"  placeholder="原密码" type="password">
                </div>
                <div class="form-group">
                  <input class="form-control" id="PASS" name="PASS" placeholder="新密码" type="password">
                </div>
                <div class="form-group">
                  <input class="form-control" id="RePASS" name="RePASS" placeholder="确认新密码" type="password">
                </div>
                <a class="btn btn-primary" id="btn-pass-update">确认</a>
                 <a class="btn btn-primary" id="btn-pass-cancel">取消</a>
              </form>
            </div>
            <div id="personal_info" style="display:none;">
              
              <form  action="usermanage/personal/edit" method="post" role="form" class="form-horizontal" id="user_detail_info" enctype="multipart/form-data">
                <div class="form-group">
                 <div class="col-sm-2">
                   <label class="control-label">手机号</label>
                 </div>
                 <div class="col-sm-7">
                  <input class="form-control" id="MOBILE" name="MOBILE" value="${pd.MOBILE}" placeholder="手机号" readonly="readonly" type="text">
                 </div>
                 <div class="col-sm-3">
                  <a class="btn btn-primary" id="update-mobile">修改手机号</a>
                 </div>
                </div>
                 <div class="form-group" style="display:none;">
                <div class="col-sm-2">
                   <label class="control-label">用户积分</label>
                 </div>
                 <div class="col-sm-10">
                  <input class="form-control" id="SCORE" name="SCORE" placeholder="账户积分" value="${pd.SCORE}" readonly="readonly" type="text">
                </div>
                </div>
                <div class="form-group">
                 <div class="col-sm-2">
                   <label class="control-label">用户名</label>
                 </div>
                 <div class="col-sm-10">
                  <input class="form-control" id="NICKNAME" name="NICKNAME" value="${pd.NICKNAME}" placeholder="用户名" type="text" >
                 </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-2">
                   <label class="control-label">真实姓名</label>
                 </div>
                 <div class="col-sm-10">
                  <input class="form-control" id="REALNAME" name="REALNAME" value="${pd.REALNAME }" placeholder="真实姓名" type="text" >
                </div>
                </div>
                <div class="form-group">
                <div class="col-sm-2">
                   <label class="control-label">邮箱</label>
                 </div>
                 <div class="col-sm-10">
                  <input class="form-control" id="EMAIL" name="EMAIL" placeholder="邮箱" value="${pd.EMAIL}" type="email" >
                </div>
                </div>
                <div class="form-group">
                <div class="col-sm-2">
                   <label class="control-label">身份证件号</label>
                 </div>
                 <div class="col-sm-10">
                  <input class="form-control" id="CARDID" name="CARDID" placeholder="身份证件号" value="${pd.CARDID }" type="text">
                </div>
                </div>
                <div class="form-group">
                <div class="col-sm-2">
                   <label class="control-label">银行卡</label>
                 </div>
                 <div class="col-sm-10">
                  <input class="form-control" id="BANKCARD" name="BANKCARD" placeholder="银行卡" value="${pd.BANKCARD}" type="text">
                </div>
                </div>
                <div class="form-group">
                 <div class="col-sm-2">
                   <label class="control-label">地址</label>
                 </div>
                 <div class="col-sm-10">
                  <input class="form-control" id="ADDRESS" name="ADDRESS" placeholder="地址" value="${pd.ADDRESS}" type="text">
                </div>
                </div>
                <div class="form-group">
                <div class="col-sm-2">
                   <label class="control-label">微信号</label>
                 </div>
                 <div class="col-sm-10">
                  <input class="form-control" id="WECHAT" name="WECHAT" placeholder="微信号" value="${pd.WECHAT}" type="text">
                </div>
                <div class="col-sm-10">
                  <input class="form-control" id="USERMANAGE_ID" name="USERMANAGE_ID"  value="${pd.USERMANAGE_ID}" type="text" style="display:none;">
                  <input class="form-control" id="USERTYPE" name="USERTYPE" value="0" type="text"  style="display: none;"> 
                </div>
                </div>
                <div class="col-sm-2">
                </div>
                <div class="col-sm-10">
                <a class="btn btn-primary" id="edit" onclick="goEdit()">编辑</a>
                <a class="btn btn-primary" id="save" type="submit">保存</a>
                <a class="btn btn-primary" id="cancel">取消</a>
                <a href="usermanage/personal/company" style="float:right;">升级企业用户</a>
                </div>
              </form>
            </div>
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
  
<%@ include file="../../tail.jsp"%>
</body></html>