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
    <script type="text/javascript" src="static/usermanage/js/company.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="static/usermanage/css/company.css" rel="stylesheet" type="text/css">
    <style>
      .error{
                    	color:red;
            }
    </style>
  </head><body>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <ul class="breadcrumb">
              <li>
                <a href="main/index">首页</a>
              </li>
              <li>
                <a href="usermanage/personal/show">个人中心</a>
              </li>
              <li class="active">企业会员</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12" id="company-redit">
            <form role="form" action="usermanage/personal/edit" method="post" id="company-valid-form" class="form-horizontal" enctype="multipart/form-data">
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
                   <label class="control-label">账户积分</label>
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
                <input class="form-control" id="NICKNAME" name="NICKNAME" value="${pd.NICKNAME }" placeholder="用户名" type="text"  required=""> 
                </div>
              </div>
              <div class="form-group">
              	 <div class="col-sm-2">
                   <label class="control-label">公司名称</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="COMPNAME" name="COMPNAME" value="${pd.COMPNAME}" placeholder="公司名称" type="text"  required="">
                </div>
              </div>
              <div class="form-group">
              	 <div class="col-sm-2">
                   <label class="control-label">营业执照</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="COMPNUM" name="COMPNUM" value="${pd.COMPNUM}" placeholder="营业执照" type="text"  required="">
                </div>
              </div>
              <div class="form-group">
              	 <div class="col-sm-2">
                   <label class="control-label">联系地址</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="ADDRESS" name="ADDRESS" value="${pd.ADDRESS}" placeholder="联系地址" type="text"  required="">
                </div>
              </div>
              <div class="form-group">
              	<div class="col-sm-2">
                   <label class="control-label">办公电话</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="PHONE" name="PHONE" value="${pd.PHONE}" placeholder="办公电话"  type="digits">
                </div>
              </div>
              <div class="form-group">
              	<div class="col-sm-2">
                   <label class="control-label">负责人</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="REALNAME" name="REALNAME" value="${pd.REALNAME}" placeholder="负责人" type="text"  required="">
                <input class="form-control" id="USERTYPE" name="USERTYPE" value="3" type="text" style="display: none;"> 
                </div>
              </div>
              <div class="form-group">
              	<div class="col-sm-2">
                   <label class="control-label">邮箱</label>
                 </div>
                 <div class="col-sm-10">
                <input class="form-control" id="EMAIL" name="EMAIL" value="${pd.EMAIL}" placeholder="邮箱" type="email" required="">
                <input class="form-control" id="USERMANAGE_ID" name="USERMANAGE_ID"  value="${pd.USERMANAGE_ID}" type="text" style="display:none;">
                </div>
              </div>
              <div class="form-group">
                <label class="control-label" for="exampleInputPassword1">营业执照</label>
                <input id="PIC1" name="PIC" placeholder="营业执照" type="file" accept="image/*" class="form-control" required="">
              </div>
              <div class="form-group">
                <label class="control-label" for="exampleInputPassword1">税务登记证</label>
                <input class="form-control" id="PIC2" name="PIC" placeholder="税务登记证" accept="image/*" type="file" required="">
              </div>
              <div class="form-group">
                <label class="control-label" for="exampleInputPassword1">组织结构代码证</label>
                <input class="form-control" id="PIC3" name="PIC" placeholder="组织结构代码证" accept="image/*" type="file" required="">
              </div>
              <a class="btn btn-primary" id="comp-sub" type="submit">提交材料</a>
            </form>
          </div>
        </div>
      </div>
    </div>
  

</body></html>