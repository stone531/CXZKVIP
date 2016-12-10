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
          <div class="col-md-8 text-right">
            <div class="row">
              <div class="col-md-12" >
                <c:if test="${cState == 1}">
	                <div class="well">
	                  <h5 class="text-left text-warning">当前状态：${cState}</h5>
	                  <h4 class="text-left text-warning">当前用户：${cUser}</h4>
	                  <h2 class="text-left text-warning">查看消息：${cMsg}</h2>                 
	                </div>
                </c:if>
                <c:if test="${cState == 0}">
	                <div class="well" style="display: none;>
	                </div>
                </c:if>
                <c:if test="${sState == 0}">
					<div class="well" style="display: none;">                 
	                </div>
                </c:if>
                <c:if test="${sState == 1}">
					<div class="well"">
					  <h5 class="text-left text-warning">当前状态：${sState}</h5>
					  <h4 class="text-left text-warning">管理员${sUser}回复消息：</h4>
					  <h3 class="text-center">${sMsg}</h3>                  
	                </div>
                </c:if>
              </div>
            </div>
            <hr>
            <form action="sendmsg">
	            <div class="row">
	              <div class="col-md-12">
	                <textarea id="LIUYAN" name="LIUYAN" class="form-control" rows="10"></textarea>
	              </div>
	            </div>
	            <br>
	            <button type="submit" class="btn btn-lg btn-warning" >发送消息</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div class="section"></div>
	
	<script type="text/javascript">
		function getTextArea(){
			var context = document.getElementById("liuyan").value;
			if(!context)
			{
				alert("无法发送空消息，请检查");
			}
			else
			{
				alert(context);
			}
			
		}
	</script>
  

</body></html>