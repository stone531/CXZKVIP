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
                <h1 class="panel-title text-danger">理赔查询</h1>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="col-md-12">
          <div class="col-md-4">
            <div class="page-header text-center text-success">
              <h3 class="">查询方式</h3>
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
                        <input type="text" class="form-control" id="IANTPAPERNO" name="IANTPAPERNO" placeholder="请输入被投保人身份证号" value="341225199008277732">
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
		
		<!--   测试对话框 -->
        <div id="LoginBox" style="position:fixed;left:35%;top:30%;background:white;width:426px;height:282px;border:3px solid #444;border-radius:7px;z-index:10000;display:none;">
			<form class="form-horizontal" role="form" id="CourierForm">
				<div class="panel-body">
				    <div class="row" style="background:#f7f7f7;padding:0px 20px;line-height:50px;height:50px;font-weight:bold;color:#666;font-size:20px;">
						添加快递单号窗口<a href="javascript:void(0)" title="关闭窗口" class="close_btn" style="font-family:arial;font-size:30px;font-weight:700;color:#999;text-decoration:none;float:right;padding-right:4px;" id="closeBtn">×</a>
					</div>
										
					<div class="form-group row" style="margin:30px 30px 10px">
                        <div class="col-sm-6" style="display:none">
                          <input type="text" class="form-control" id="POLICYNO1" name="POLICYNO1" value="">
                        </div>
                        <div class="col-sm-4">
							<label for="COURIERCOMPANY" class="control-label">公司名称：</label>
                        </div>
                        <div class="col-sm-6">
 						  <select class="form-control"  id="COURIERCOMPANY" name="COURIERCOMPANY" title="请选择快递公司">
							<option value="申通快递">申通快递</option>
                            <option value="顺丰速运">顺丰速运</option>
                            <option value="圆通速递">圆通速递</option>
                            <option value="韵达速递">韵达速递</option>
                            <option value="中通快递">中通快递</option>
                            <option value="天天快递">天天快递</option>
                          </select>
                        </div>
                    </div>
                    <div class="form-group row" style="margin:10px 30px 10px">
                        <div class="col-sm-4">
							<label for="COURIERNO" class="control-label">快递单号：</label>
                        </div>
                        <div class="col-sm-6">
                          <input type="text" class="form-control" id="COURIERNO" name="COURIERNO" placeholder="请输入快递单号">
                        </div>
                    </div>
					<div style="margin:30px 60px 10px">
						<a href="javascript:void(0)" class="btn btn-block btn-sm btn-warning center-block" style="width:30%;" id="addCourierNo">添加</a>
					</div>
				</div>
			</form>
        </div>		
		
        <!-- 开始循环 -->
		<c:choose>
        <c:when test="${not empty varList}">
        <div class="row" id="showPolicy">
          <div class="col-md-12 " style="border-top:groove ;border-color: beige; margin-top:30px;padding-left:10%;">
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
									<a class="btn btn-sm btn-success" onclick="goClaim('${var.POLICYNO}');">点击报险</a>
								</div>
							</c:if>
							<c:if test="${var.IsOrNo == 1 }">
                                <div class="hidden-sm hidden-xs btn-group">
                                  <label class="control-label">${var.STATE_CONTENT}</label>
                                </div>
								<c:if test="${var.CLAIMSSTATES == 2 }">
									<div class="hidden-sm hidden-xs btn-group">
										<a class="btn btn-sm btn-warning" onclick="goCourierW('${var.POLICYNO}');">点我</a>
									</div>
								</c:if>	
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
	
    <div class="section" style="margin-bottom:2%;">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="btn-link panel panel-warning">
              <div class="panel-heading">
                <h1 class="panel-title text-danger">理赔流程</h1>
              </div>
            </div>
          </div>
        </div>
        <div class="row" style="margin-top:2%;margin-left:8%;">
          <div class="col-md-1">
            <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/tui_03.jpg" class="img-responsive"></a>
            <h6 class="text-center text-danger">已报险</h6>
          </div>
          <div class="col-md-1">
            <a href="#"><img src="static/ace/img/claim/jiantou.jpg" class="img-responsive"></a>
          </div>
          <div class="col-md-1">
            <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/tui_02.jpg" class="img-responsive"></a>
            <h6 class="text-center text-danger">预审</h6>
          </div>
          <div class="col-md-1">
            <a href="#"><img src="static/ace/img/claim/jiantou.jpg" class="img-responsive"></a>
          </div>
          <div class="col-md-1">
            <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/tui_01.jpg" class="img-responsive"></a>
            <h6 class="text-center text-danger">待邮寄资料</h6>
          </div>
          <div class="col-md-1">
            <a href="#"><img src="static/ace/img/claim/jiantou.jpg" class="img-responsive"></a>
          </div>
          <div class="col-md-1">
            <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/tui_04.jpg" class="img-responsive"></a>
            <h6 class="text-center text-danger">收到资料</h6>
          </div>
          <div class="col-md-1">
            <a href="#"><img src="static/ace/img/claim/jiantou.jpg" class="img-responsive"></a>
          </div>
          <div class="col-md-1">
            <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/tui_01.jpg" class="img-responsive"></a>
            <h6 class="text-center text-danger">保险公司处理中</h6>
          </div>
          <div class="col-md-1">
            <a href="#"><img src="static/ace/img/claim/jiantou.jpg" class="img-responsive"></a>
          </div>
          <div class="col-md-1">
            <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/tui_04.jpg" class="img-responsive"></a>
            <h6 class="text-center text-danger">理赔完毕</h6>
          </div>
        </div>
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
	    function goCourierW(txt){
        	 	$("body").append("<div id='mask'></div>");
			$("#mask").addClass("mask").fadeIn("slow");
	    		$("#LoginBox").fadeIn("slow");
			$("#POLICYNO1").val(txt);
        }
	    $(function ($) {
	    	//弹出对话框
	    	$("#goCourierW").hover(function () {
	    		$(this).stop().animate({
	    			opacity: '1'
	    		}, 600);
	    	}, function () {
	    		$(this).stop().animate({
	    			opacity: '0.6'
	    		}, 1000);
	    	}).on('click', function () {

	    	});
	    	//
			
	    	$("#addCourierNo").on('click', function () {	
			    if($("#COURIERCOMPANY").val()==""){
			    	$("#COURIERCOMPANY").tips({
			    		side:3,
		                msg:'请输入快递公司',
		                bg:'#AE81FF',
		                time:2
		            });
			    	$("#COURIERCOMPANY").focus();
			    return false;
				}
				if($("#COURIERNO").val()==""){
			    	$("#COURIERNO").tips({
			    		side:3,
		                msg:'请输入快递单号',
		                bg:'#AE81FF',
		                time:2
		            });
			    	$("#COURIERNO").focus();
			    return false;
				}
				//$("#CourierForm").submit();
                $.ajax({
                    url: "claimsys/addCourier.do",    //请求的url地址
                    dataType: "json",   //返回格式为json
                    async: false, //请求是否异步，默认为异步，这也是ajax重要特性
                    data: $('#CourierForm').serialize(),   //参数值
                    type: "POST",   //请求方式
                    beforeSend: function() {
                        //请求前的处理
                    },
                    success: function(data) {
                        if (data.IsSuccess == false) {
                            alert("添加失败!");           
                        }                
                        if (data.IsSuccess == true) {
							$("#LoginBox").fadeOut("fast");
							$("#mask").css({ display: 'none' });
							$("#COURIERNO").val("");
							$('#COURIERCOMPANY')[0].selectedIndex = 0;
                        }
                    },
                    complete: function() {
                        //请求完成的处理
                    },
                    error: function() {
                        //请求出错处理
                    }
                });
	    	});
	    	//关闭
	    	$(".close_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#999' }) }).on('click', function () {
	    		$("#LoginBox").fadeOut("fast");
	    		$("#mask").css({ display: 'none' });
	    	});
	    });
		
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
			    if(!validateIdCard($("#IANTPAPERNO").val())){
			    	$("#IANTPAPERNO").tips({
			    		side:3,
		                msg:'身份证格式不对',
		                bg:'#AE81FF',
		                time:2
		            });
			    	$("#IANTPAPERNO").focus();
			    return false;
				}				
			}
			$("#formSearch").submit();
		}
		
		function validateIdCard(idCard) {  
		    //15位和18位身份证号码的正则表达式  
		    var regIdCard = /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;  
		    //如果通过该验证，说明身份证格式正确，但准确性还需计算  
		    if (regIdCard.test(idCard)) {  
		        if (idCard.length == 18) {  
		            var idCardWi = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); //将前17位加权因子保存在数组里  
		            var idCardY = new Array(1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2); //这是除以11后，可能产生的11位余数、验证码，也保存成数组  
		            var idCardWiSum = 0; //用来保存前17位各自乖以加权因子后的总和  
		            for (var i = 0; i < 17; i++) {  
		                idCardWiSum += idCard.substring(i, i + 1) * idCardWi[i];  
		            }  
		            var idCardMod = idCardWiSum % 11;//计算出校验码所在数组的位置  
		            var idCardLast = idCard.substring(17);//得到最后一位身份证号码  
		            //如果等于2，则说明校验码是10，身份证号码最后一位应该是X  
		            if (idCardMod == 2) {  
		                if (idCardLast == "X" || idCardLast == "x") {  
		                    return true;  
		                } else {  
		                    return false;  
		                }
		            } else {  
		                //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码  
		                if (idCardLast == idCardY[idCardMod]) {  
		                    return true;  
		                } else {  
		                    return false;  
		                }
		            }
				}
		    } else {  
		        return false;  
		    }
		}
    </script>
 
<%@ include file="../../tail.jsp"%>
</body>
</html>


