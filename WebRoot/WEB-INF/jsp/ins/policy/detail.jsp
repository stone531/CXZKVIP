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
<html><head>

	<base href="<%=basePath%>">
	
	<%@ include file="ht.jsp"%>
	
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
    
    
  </head><body>
  <%@ include file="../../head.jsp"%>
  
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-2"></div>
          <div class="col-md-8">
            <ul class="list-group detailh4">
              <h5 class="text-muted">卡号</h5>
              <li class="list-group-item">${CardNo}</li>
              <h5 class="text-muted">卡种</h5>
              <li class="list-group-item">${CardType}</li>
              <h5 class="text-muted">姓名</h5>
              <li class="list-group-item">${Name}</li>
               <h5 class="text-muted">证件类型</h5>
              <li class="list-group-item">身份证</li>
               <h5 class="text-muted">证件号码</h5>
              <li class="list-group-item">${PaperNo}</li>
              <h5 class="text-muted">持卡人员手机号</h5>
              <li class="list-group-item">${IantPhone}</li>
              <h5 class="text-muted">服务人员姓名</h5>
              <li class="list-group-item">${SvrName}</li>
              <h5 class="text-muted">服务人员手机号码</h5>
              <li class="list-group-item">${SvrPhone}</li>
              <h5 class="text-muted">激活日期</h5>
              <li class="list-group-item">${CreateTime}</li>
              <div style="display:${display}">
	              <h5 class="text-muted">保单号</h5>
	              <li class="list-group-item">${PolicyNo}</li>
	              <h5 class="text-muted">截止日期</h5>
	              <li class="list-group-item">${DataLine}</li>
              </div>
            </ul>
          </div>
          <div class="col-md-2"></div>
        </div>
      </div>
    </div>
    <div class="section text-right" style="padding-bottom: 8%;">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <br>
            <br>
            <h6>惠保永泽科技有限公司</h6>
          </div>
          <div class="col-md-6 text-center" style="">
            <img src="static/ace/images/yinzhang.png" class="img-responsive">
          </div>
        </div>
      </div>
    </div>
  
<%@ include file="../../tail.jsp"%>
</body></html>
