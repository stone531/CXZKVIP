<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>


<html><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="/CXZKVIP/static/ace/css/bootstrap.css" rel="stylesheet" type="text/css">
  </head><body>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-4"></div>
          <p align=left style="margin-left:10px;">回复当前用户消息:</p>
          <div class="col-md-8 text-right">		  
            <div class="row">
              <div class="col-md-12" >
	            <div class="well">			 
				  <h4 class="text-left text-warning">当前用户：${cUser}</h4>
				  <h4 class="text-left text-warning">用户消息：${cMsg}</h4>                 
	            </div>

              </div>
            </div>
            <hr>
            <form action="adminReplyMsg">
			    <div class="col-md-12">
				   <textarea id="MSGUSERID" name="MSGUSERID" class="form-control" rows="0" style="display: none";>${cMsgID}</textarea>
				</div>  
	            <div class="row">
	              <div class="col-md-12">
	                <textarea id="ADMINRSP" name="ADMINRSP" class="form-control" rows="15"></textarea>
	              </div>
	            </div>
	            <br>
	            <button type="submit" class="btn btn-lg btn-warning" >发送回复消息</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div class="section"></div>
	
	<script type="text/javascript">
		function getTextAreaEx(){
			document.getElementByIdx_x('MSGUSERID').submit();
			var context = document.getElementById("adminrsp").value;
			if(!context)
			{
				alert("无法发送空消息，请检查");
			}
			else
			{
				alert(context);
			}
			
			var url = "<%=basePath%>onlinemsg/adminReplyMsg?MSGUSERID=1&context";
			
			document.form.action = url;   
			document.form.method = "post";   
			document.form.submit(); 
			document.getElementByIdx_x('MSGUSERID').submit();
			var userID = document.getElementById("msguserid").value;
		}
	</script>
  

</body></html>