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
    <style>
    body
	{
		background-color:#d0e4fe;
		padding-left:-200px;
		text-align:center;
		background:url(http://www.wallpapersking.com/top/class18/176/97f84048c5990dd4.htm) no-repeat 10px 10px;
	}
	h1
	{
		color:orange;
		text-align:center;
	}
	p
	{
		font-family:"Times New Roman";
		font-size:20px;
	}
	textarea
	{
		width:1135px;//初始宽度
		max-width:100px;//最大宽度
		height:20px;//初始高度
		max-height:30px;//最大高度
		overflow-y:auto;//让滚动条自适应，保证兼容性
		margin: 250px;
    }
	.div{ margin:0 auto; width:400px; height:100px; border:1px solid #F00}
    </style>
    
  	</head>
  	<body>

	<div class="section">
      <div class="container">
        <div class="row">
        <DIV class="div1"></div>

        <embed src="d:\a.mp3" hidden="true" autostart="true" loop="true">
          <p align=left style="margin-left:10px;">显示所有消息列表:</p>
          <div class="col-md-4"></div>
	        <div class="col-md-8 text-right">
				<c:forEach items="${varList}" var="var" varStatus="vs">
				    <div class="row" style="margin-left:-400px ;" >
				      <div class="col-md-12" >
						<c:if test="${var.ADMINUSER == null }">
				            <div class="well">
				              <h4 class="text-left text-warning">当前用户：${var.CLIENTUSER}</h4>
				              <h4 class="text-left text-warning">查看消息：${var.CONTENT}</h4>                 
				            </div>
				        </c:if>
				        <c:if test="${var.ADMINUSER != null }">
							<div class="well"">
							  <h4 class="text-left text-warning">管理员: ${var.ADMINUSER}回复消息：</h4>
							  <h4 class="text-center">${var.CONTENT}</h4>                  
				            </div>
				        </c:if>
				      </div>
				    </div>
				</c:forEach>
			</div>
         <hr>  
		    <form action="sendmsg">
		        <div class="row1" style="margin-left:2200px -400px;">
		         <p align=left style="margin-left:10px;">请输入您的所有疑虑:</p>
		          <div class="col-md-12 text-left" >		         
		            <textarea id="LIUYAN" name="LIUYAN" class="form-contro50" rows="10" cols="10" required></textarea>
		          </div>
		        </div>
		        <br>
		        <button type="submit" class="btn btn-lg btn-warning" >发送消息</button>
		    </form>
		   </div>
		  </div>
		 </div>
		</div>
	  </div>
	 </div>
  </div>
  
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
		
		
	function showOnlieMsg()
	{
		$.ajax({  
        url:"getUserName.do?uid="+index,  
        type:"post",  
        data:$("#userForm").serialize(),  
        success:function(data){  
            if(data==null){  
                data = "";  
            }  
            $(divuserhint).html("");  
            $(userId).attr("value",data);  
            clockradio("query");//callback "query"=method flag  
        },  
        error:function(){  
            $(userId).attr("value","");  
            $(divuserhint).html(user_info[3]);//js i18n  
        }  
    });  
	}

</script>
	
</body>
</html>