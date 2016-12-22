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
<html>
	<head>
	<base href="<%=basePath%>">
	<script type="text/javascript" src="static/js/jquery-1.7.2.js" ></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	 <%@ include file="../../ht.jsp"%>
	
	</head>
	
	
	<body>
	
	  <%@ include file="../../head.jsp"%>
	  
	 <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <br>
            <br>
          </div>
        </div>
      </div>
    </div>
<div class=" middle">	  
	 <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-4"></div>
          <div class="col-md-4">
            <form action="${action}" name="Form" id="Form" method="post" class="center-block text-center">
              <h2 class="form-signin-heading text-center text-info">服务卡激活</h2>
              <p class="center-block">
                <input type="text" name="CARDID" id="CARDID" maxlength="255" class="form-control center-block"
                placeholder="输入服务卡号" title="服务卡号" style="width:100%;">
              </p>
              <p class="center-block">
                <input type="password" name="PASSWORD" id="PASSWORD" maxlength="255" class="form-control center-block"
                placeholder="输入密码" title="密码" style="width:100%;">
              </p>
              <button type="button" class="btn btn-block btn-lg btn-success center-block"
              onclick="save();" style="width:50%;">确定</button>
            </form>
          </div>
          <div class="col-md-4"></div>
        </div>
                
      </div>
    </div>

    <div class="section" style="display: ${display};padding-top:60px;">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
            <div class="alert alert-dismissable alert-success">
              <strong>${msg}</strong></div>
          </div>
        </div>
      </div>
    </div>
 </div> 
	  <!--div class="section">
      <div class="container">
        <div class="row">
          <div class="">
			<form action="${action}" name="Form" id="Form" method="post">
			<table  class="table table-striped table-hover">
				<tr>
					<td style="width:75px;text-align: right;padding-top: 13px;">服务卡号:</td>
					<td><input type="text" name="CARDID" id="CARDID"  maxlength="255" placeholder="这里输入服务卡号" title="服务卡号" style="width:80%;"/></td>
				</tr>
								
				<tr>
					<td style="width:75px;text-align: right;padding-top: 13px;">密码:</td>
					<td><input type="password"  name="PASSWORD" id="PASSWORD"  maxlength="255" placeholder="这里输入密码" title="密码" style="width:80%;"/></td>
				</tr>
				<tr>			
					<td style="text-align: center;" colspan="10" style="width:80%;">
							<a  onclick="save();">确定</a>
					</td>
				</tr>
			</table>
								
			</form>
			
          </div>
        </div>
      </div -->	
				
					
		<script type="text/javascript">		
			function save(){
				if($("#CARDID").val()==""){
					$("#CARDID").tips({
						side:3,
			            msg:'请输入服务卡号',
			            bg:'#AE81FF',
			            time:2
			        });
					$("#CARDID").focus();
				return false;
				}
			
				if($("#PASSWORD").val()==""){
						$("#PASSWORD").tips({
							side:3,
				            msg:'请输入密码',
				            bg:'#AE81FF',
				            time:2
				        });
						$("#PASSWORD").focus();
					return false;
				}
			
				$("#Form").submit();
			}
	
		</script>

		<%@ include file="../../tail.jsp"%>	

	</body>
</html>


