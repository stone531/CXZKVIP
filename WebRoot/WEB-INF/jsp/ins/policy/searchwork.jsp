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
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="static/ace/js/claim/jquery-1.11.1.js"></script>
<script type="text/javascript" src="static/ace/js/claim/jquery.validate.js"></script>
<style>
	.mask{
		margin:0;
		padding:0;
		border:none;
		width:100%;
		height:100%;
		background:#333;
		opacity:0.6;
		filter:alpha(opacity=60);
		z-index:9999;
		position:fixed;
		top:0;
		left:0;
		display:none;
	}
</style>
<!-- jsp文件头和头部 -->
 <%@ include file="../../ht.jsp"%>
</head>

<body>  
<%@ include file="../../head.jsp"%> 
    <div class="section" style="margin-bottom:4%;">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="btn-link panel panel-warning">
              <div class="panel-heading">
                <h1 class="panel-title text-danger">职业查询</h1>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="row">
          <div class="col-md-8">
			<form name="formSearch" id="formSearch">
                <div class="panel-body" id="byCard">
				    <div class="form-inline">
                      <div class="col-sm-8">
                        <input type="text" class="form-control" style="width:70%;" id="keywords" name="keywords" value="${pd.keywords}" placeholder="请输入职业关键字">
						<button type="button"  class="btn btn-sm-2 btn-success" onclick="goSearch()" >查询</button>
                      </div>
					  <div class="col-sm-2" style="padding-left:1%;" id="showErr"></div>
				    </div>
				</div>					
			</form>
          </div>
          <div class="col-md-2"></div>
        </div>
        <div class="row">
          <div class="col-md-12">                                              
          </div>
        </div>
				
        <div class="row" id="showPolicy">
        </div>

      </div>
    </div>
	
    <script type="text/javascript" src="static/js/jquery.tips.js"></script>
    <script type="text/javascript">
		window.onload=function(){
			goSearch();			
		};
		
		function goSearch(){
			$.ajax({				
				url: 'worker/fg/searchWork.do?tm='+new Date().getTime(),    //请求的url地址
                dataType: "json",   //返回格式为json
                async: false, //请求是否异步，默认为异步，这也是ajax重要特性
                data: $('#formSearch').serialize(),   //参数值
				type: "POST",
				cache: false,
				success: function(data){
					if(data.result != 0){
						var sub="";
						if(data.result == 1)
          					sub += "<label>温馨提示：未查到职业信息,请联系服务人员！</label>";
          				//$("#showErr").append(sub);
						$("#showErr").html(sub);
						$("#showPolicy").html("");					
					}else{
						var subTable="";
						subTable += "<div class=\"col-md-12\" style=\"border-top:groove ;border-color: beige; margin-top:30px;padding-left:2%;\">"
						subTable += "<table class=\"table\"><thead><tr><th>职业大类</th><th>职业小类</th><th>职业名称</th><th>类别</th></tr></thead><tbody>";
			  
						$.each(data.varList, function(i, list){
							subTable += "<tr>";
							subTable += "<td class=\"center\">"+list.gName+"</td>";
							subTable += "<td class=\"center\">"+list.fName+"</td>";
							subTable += "<td class=\"center\">"+list.selfName+"</td>";
							subTable += "<td class=\"center\">"+list.workClass+"</td>";	
							subTable += "<tr>";					
						});
						subTable += "</tbody></table></div>";
						//$("#showPolicy").append(subTable);
						$("#showPolicy").html(subTable);
						$("#showErr").html("");
					}
				}
			});
		}
    </script>
 
<%@ include file="../../tail.jsp"%>
</body>
</html>


