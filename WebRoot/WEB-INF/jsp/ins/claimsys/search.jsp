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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="new-w-950">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/ace/js/claim/jquery-1.11.1.js"></script>
<script type="text/javascript" src="static/ace/js/claim/jquery.validate.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
 <%@ include file="../../ht.jsp"%>
</head>

<body>  
<%@ include file="../../head.jsp"%> 
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h2 class="text-primary">理赔查询</h2>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="col-md-12">
          <div class="col-md-4">
            <div class="page-header text-center text-success">
              <h4 class="">查询方式</h4>
            </div>
          </div>
          <div class="col-md-8">
            <ul class="nav nav-tabs" style="margin-top:4%">
              <li class="active" id="card">
                <a href="javascript:searchByCardNo()">卡号密码</a>
              </li>
              <li id="no">
                <a href="javascript:searchByNo()">身份证号</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-2"></div>
          <div class="col-md-8">
			<form action="claimsys/${msg }.do" name="formSearch" id="formSearch" method="post" >
                <div class="panel-body" id="byCard">
				    <div class="form-group">
                      <div class="col-sm-2">
                        <label for="CARDNO" class="control-label">卡号：</label>
                      </div>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="CARDID" name="CARDID" value="${pd.CARDID}" placeholder="请输入服务卡号">
                      </div>
				    </div>
                    <div class="form-group">
                      <div class="col-sm-2">
                        <label for="CARDPASSWD" class="control-label" >密码：</label>
                      </div>
                      <div class="col-sm-9">
                        <input type="password" class="form-control" id="PASSWORD" name="PASSWORD" value="${var.PASSWORD}" placeholder="请输入服务卡密码">
                      </div>
                    </div>
				</div>
				<input type="hidden" value="${pd.searchtype}" name="searchtype" id="searchtype" />
				<div class="panel-body" id="byNo" style="display: none;">
                    <div class="form-group">
                      <div class="col-sm-2">
                        <label for="PersonNo" class="control-label">身份证号：</label>
                      </div>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="IANTPAPERNO" name="IANTPAPERNO" placeholder="请输入被投保人身份证号" value="412728198904303231">
                      </div>
					</div>
                </div>
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-sm-10 btn-success" onclick="goSearch()" >查询</button>
                    <c:if test="${result == 1 }">
          				<label>	温馨提示：未查到卡信息！</label>
				  </c:if> 
		          <c:if test="${result == 2 }">               
                    	<label>	温馨提示：卡号密码不正确！</label>
				  </c:if>  
		    	  <c:if test="${result == 3 }">               
                    	<label>	温馨提示：您还尚未投保！</label>
				  </c:if>
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
        <!-- 开始循环 -->
		<c:choose>
        <c:when test="${not empty varList}">
        <div class="row" id="showPolicy">
          <div class="col-md-12 " style="border-top:groove ;border-color: beige; margin-top:30px;padding-left:15%;">
            <table class="table">
              <thead>
                <tr>
                  <th>序号</th>
                  <th>保单号</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
                    <c:forEach items="${varList}" var="var" varStatus="vs">          
                        <tr>
                          <td class="center">${vs.index+1}</td>
                          <td class="center"><a href="policy/detail?POLICY_ID=${var.POLICYNO}">${var.POLICYNO}</a></td>
                          <td class="center">
						  	<c:if test="${var.IsOrNo == 0 }">
	                            <div class="hidden-sm hidden-xs btn-group">
									<a class="btn btn-sm btn-success" onclick="goClaim('${var.POLICYNO}');">报险</a>
								</div>
							</c:if>
							<c:if test="${var.IsOrNo == 1 }">
                                <div class="hidden-sm hidden-xs btn-group">
                                  <a class="btn btn-sm btn-success" >${var.STATE_CONTENT}</a>
                                </div>
							</c:if>							
                          </td>
                        </tr>
					</c:forEach>
              </tbody>
            </table>
          </div>
        </div>
        </c:when>
		</c:choose>
      </div>
    </div>
    <script type="text/javascript">
    
        var liCard = document.getElementById("card");
        var liNo = document.getElementById("no");
        function searchByCardNo(){
        	liCard.setAttribute("class", "active");
        	liNo.setAttribute("class", "");
        	$("#searchtype").val("1"); 
        	$("#byCard").show();
        	$("#byNo").hide();
        }
        
        function searchByNo(){
        
        	liCard.setAttribute("class", "");
        	
        	liNo.setAttribute("class", "active");
        	$("#searchtype").val("2");        	
        	$("#byNo").show();
        	$("#byCard").hide();
        }
        $(function(){
	        if($("#searchtype").val()=="1"){
	        	searchByCardNo();
	        }else{
	        	searchByNo();
	        }
        });
        		//修改
        function goClaim(Id){
        	 window.location.href="<%=basePath%>claimsys/goAdd.do?POLICYNO="+Id;
        }
    </script>
    <script type="text/javascript" src="static/js/jquery.tips.js"></script>
    <script type="text/javascript">
		function goSearch(){
			if(document.getElementById("byNo").style.display =="none"){
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
			} else {
			    if($("#IANTPAPERNO").val()==""){
			    	$("#IANTPAPERNO").tips({
			    		side:3,
		                msg:'请输入身份证号',
		                bg:'#AE81FF',
		                time:2
		            });
			    	$("#IANTPAPERNO").focus();
			    return false;
				}	
			}
			$("#formSearch").submit();
		}
    </script>
 
<%@ include file="../../tail.jsp"%>
</body>
</html>


