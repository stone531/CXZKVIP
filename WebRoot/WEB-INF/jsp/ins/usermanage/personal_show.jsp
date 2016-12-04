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
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script type="text/javascript" src="static/usermanage/js/rule.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
  </head><body>
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
              <li class="list-group-item" id="li-info">
                <a>账户信息</a>
              </li>
              <li class="list-group-item" id="li-pass">
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
            <div id="company-info">
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
                <input class="form-control" id="COMPNAME" value="${COMPNAME}" placeholder="公司名称" type="text" required="">
                </div>
              </div>
              <div class="form-group">
              <div class="col-sm-2">
                   <label class="control-label">营业执照号码</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="COMNUM" value="${COMNUM}" placeholder="营业执照号码" type="text" required="">
                </div>
              </div>
              <div class="form-group">
               <div class="col-sm-2">
                   <label class="control-label">联系地址</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="ADDRESS" value="${ADDRESS}" placeholder="联系地址" type="text" required="">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                   <label class="control-label">办公电话</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="PHONE" value="${PHONE}" placeholder="办公电话" type="digits">
                </div>
              </div>
              <div class="form-group">
               <div class="col-sm-2">
                   <label class="control-label">负责人姓名</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="REALNAME" value="${REALNAME}" placeholder="负责人姓名" type="text" required="">
                </div>
              </div>
              <div class="form-group">
               <div class="col-sm-2">
                   <label class="control-label">邮箱</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="EMAIL" value="${EMAIL}" placeholder="邮箱" type="email" required="">
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
            <div id="pass-update">
           
              <form role="form">
                <div class="form-group">
                  <input class="form-control" id="PrePASS" placeholder="原密码" type="password">
                </div>
                <div class="form-group">
                  <input class="form-control" id="PASS" placeholder="新密码" type="password">
                </div>
                <div class="form-group">
                  <input class="form-control" id="RePASS" placeholder="确认新密码" type="password">
                </div>
                <a class="btn btn-primary" id="btn-pass-update">确认修改</a>
              </form>
            </div>
            <div id="personal_info">
              
              <form  action="usermanage/personal/edit" method="post" role="form" class="form-horizontal" id="user_detail_info">
                <div class="form-group">
                 <div class="col-sm-2">
                   <label class="control-label">手机号</label>
                 </div>
                 <div class="col-sm-10">
                  <input class="form-control" id="MOBILE" name="MOBILE" value="${pd.MOBILE}" placeholder="手机号" readonly="readonly" type="text">
                  </div>
                </div>
                 <div class="form-group">
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
                  <input class="form-control" id="NICKNAME" name="NICKNAME" value="${pd.NICKNAME}" placeholder="用户名" type="text" required="">
                 </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-2">
                   <label class="control-label">真实姓名</label>
                 </div>
                 <div class="col-sm-10">
                  <input class="form-control" id="REALNAME" name="REALNAME" value="${pd.REALNAME }" placeholder="真实姓名" type="text" required="">
                </div>
                </div>
                <div class="form-group">
                <div class="col-sm-2">
                   <label class="control-label">邮箱</label>
                 </div>
                 <div class="col-sm-10">
                  <input class="form-control" id="EMAIL" name="EMAIL" placeholder="邮箱" value="${pd.EMAIL}" type="email" required="">
                </div>
                </div>
                <div class="form-group">
                <div class="col-sm-2">
                   <label class="control-label">身份证件号</label>
                 </div>
                 <div class="col-sm-10">
                  <input class="form-control" id="CARDID" name="CARDID" placeholder="身份证件号" value="${pd.CARDID }" type="text" required="">
                </div>
                </div>
                <div class="form-group">
                <div class="col-sm-2">
                   <label class="control-label">银行卡</label>
                 </div>
                 <div class="col-sm-10">
                  <input class="form-control" id="BANKCARD" name="BANKCARD" placeholder="银行卡" value="${pd.BANKCARD}"type="text">
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
  

</body></html>