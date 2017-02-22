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
    
     <%@ include file="../../ht.jsp"%>
</head>
<body>
	<%@ include file="../../head.jsp"%>
    <div class="section" >
      <div class="container">
        <div class="row">
          <div class="col-md-9">
            <h1 class="text-warning">在线报案登记</h1>
            <hr>
            <div class="panel panel-info">
              <div class="panel-heading">
                <h3 class="panel-title">个人保险案</h3>
              </div>
            </div>
            <form class="form-horizontal" role="form" id="claimForm">
              <!-- 日期框 -->
			  <link rel="stylesheet" href="static/ace/css/datepicker.css" />
			  <script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
              <h2 class="text-muted">基本信息</h2>
			    <hr>
                <div class="row" style="margin-left:5%">
                    <!--div class="col-md-2"></div-->
                  <div class="col-md-10">
                  <!--form class="form-horizontal" role="form"-->
                    <div class="form-group">
                        <label for="POLICYNO" class="col-sm-3 control-label">服务卡号</label>
                        <div class="col-sm-6">
                          <input type="text" class="form-control" id="POLICYNO" name="POLICYNO" readonly="readonly" placeholder="请输入服务卡号" value="${pd.POLICYNO}">
                        </div>
                        <div></div>
                    </div>
                    <div class="form-group">
                        <label for="INFORNAME" class="col-sm-3 control-label" style="display:block;">报案人姓名</label>
                        <div class="col-sm-6">
                          <input type="text" class="form-control" id="INFORNAME" name="INFORNAME" placeholder="请填写您的真实姓名，以便理赔">
                        </div>
                        <div></div>
                    </div>
                    <div class="form-group">
                        <label for="RELATION" class="col-sm-3 control-label">与出险人关系</label>
                        <div class="col-sm-6">
						  <select class="form-control"  id="RELATION" name="RELATION" title="请选择您与出险人的关系">
									  <option value="1">本人</option>
                                      <option value="2">配偶</option>
                                      <option value="3">子女</option>
                                      <option value="4">父母</option>
                                      <option value="5">亲属</option>
                                      <option value="6">其它</option>
                          </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="CLAIMERTEL" class="col-sm-3 control-label">联系电话</label>
                        <div class="col-sm-6">
                          <input type="text" class="form-control" id="CLAIMERTEL" name="CLAIMERTEL" placeholder="建议填写您的手机号码，以便及时取得联系">
                        </div>
                        <div></div>
                    </div>
                    <div class="form-group">
                          <label for="EMAIL" class="col-sm-3 control-label">Email</label>
                          <div class="col-sm-6">
                            <input type="text" class="form-control" id="EMAIL" name="EMAIL" placeholder="请输入电子邮箱">
                          </div>
                          <div></div>
                    </div>
                    <!--/form-->
                  </div>
                </div>
                <hr>
  
              <h2 class="text-muted">出险信息</h2>
                <hr>
                <div class="row" style="margin-left:5%">
                    <!--div class="col-md-2"></div-->
                    <div class="col-md-10">
                      <!--form class="form-horizontal" role="form"-->
                      <div class="form-group">
                          <label for="OCCURTIME" class="col-sm-3 control-label">出险时间</label>
                          <div class="col-sm-6">
                            <input type="text" class="form-control date-picker" data-date-format="yyyy-mm-dd" id="OCCURTIME" name="OCCURTIME" placeholder="请选择出险时间">
                          </div>
                          <div></div>
                      </div>
                      <div class="form-group">
                          <label for="OCCURPLACE" class="col-sm-3 control-label">出险地点</label>
                          <div class="col-sm-6">
                            <input type="text" class="form-control" id="OCCURPLACE" name="OCCURPLACE" placeholder="请尽量填写详细地址以方便理赔">
                          </div>
                          <div></div>
                      </div>
                      <div class="form-group">
                          <label for="POLICYNAME" class="col-sm-3 control-label">出险人姓名</label>
                          <div class="col-sm-6">
                            <input type="text" class="form-control" id="POLICYNAME" name="POLICYNAME" placeholder="请填写您的真实姓名，以便理赔">
                          </div>
                          <div></div>
                      </div>
                      <div class="form-group">
                          <label for="POLICERTEL" class="col-sm-3 control-label">联系电话</label>
                          <div class="col-sm-6">
                            <input type="text" class="form-control" id="POLICERTEL" name="POLICERTEL" placeholder="建议填写您的手机号码，以便及时取得联系">
                          </div>
                          <div></div>
                      </div>
					  <div class="form-group">
                          <label for="inputEmail3" class="col-sm-3 control-label">出险经过及现状</label>
                          <div class="col-sm-8">
                            <!--input type="email" class="form-control" id="inputEmail3" placeholder="Email"-->
                            <textarea class="form-control" rows="10" id="POLICEACCIDENT" name="POLICEACCIDENT" placeholder="请描述具体经过，以便理赔"></textarea>
                          </div>
                          <div></div>
                      </div>
                    </div>
                </div>
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-8">
						<button type="button" class="btn btn-lg btn-success" onclick="mysubmit();">提交信息</button>
					</div>
				</div>
				<div class="col-sm-offset-2">
                    <p class="form-group">
                        温馨提示：<br />
                        <span class="form-group">1、请务必真实详细填写以上信息，便于理赔；<br />
                            2、请您准备好您的电子保单、医院所有相关凭证、事故相关证明等理赔资料，以便协助办理理赔。</span><br />
                    </p>
				</div>

			    <hr>
            </form>
          </div>

		  
		  
          <div class="col-md-3">
			<br>
            <br>
            <p class="text-primary">Lorem ipsum dolor sit amet, consectetur adipisici elit,
              <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
              <br>Ut enim ad minim veniam, quis nostrud</p>
            <br>
            <br>
            <br>
            <p class="text-info">Lorem ipsum dolor sit amet, consectetur adipisici elit,
              <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
              <br>Ut enim ad minim veniam, quis nostrud</p>
            <br>
            <br>
			<br>
            <p class="text-success">Lorem ipsum dolor sit amet, consectetur adipisici elit,
              <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
              <br>Ut enim ad minim veniam, quis nostrud</p>
            <br>
            <br>
			<br>
            <p class="text-info">Lorem ipsum dolor sit amet, consectetur adipisici elit,
              <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
              <br>Ut enim ad minim veniam, quis nostrud</p>
            <br>
            <br>
			<br>
            <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisici elit,
              <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
              <br>Ut enim ad minim veniam, quis nostrud</p>
            <br>
            <br>
			<br>
            <p class="text-success">Lorem ipsum dolor sit amet, consectetur adipisici elit,
              <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
              <br>Ut enim ad minim veniam, quis nostrud</p>
            <br>
            <br>
            <br>
            <p class="text-warning">Lorem ipsum dolor sit amet, consectetur adipisici elit,
              <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
              <br>Ut enim ad minim veniam, quis nostrud</p>
          </div>
        </div>
      </div>

		<!--   测试对话框 -->
        <div id="successDiag" style="position:fixed;left:35%;top:30%;background:white;width:426px;height:282px;border:3px solid #444;border-radius:7px;z-index:10000;display:none;">
			<div class="panel-body">
			    <div class="row" style="background:#f7f7f7;padding:0px 20px;line-height:50px;height:50px;font-weight:bold;color:#666;font-size:20px;">
					申请理赔结果窗口<a href="javascript:void(0)" title="关闭窗口" class="close_btn" style="font-family:arial;font-size:30px;font-weight:700;color:#999;text-decoration:none;float:right;padding-right:4px;" id="closeBtn">×</a>
				</div>
									
				<div class="form-group row" style="margin:15px 30px 10px">
					<div class="row">您的报案我们已经受理,我们将尽快为您处理，谢谢！<br><br>&nbsp;&nbsp;&nbsp;详情请联系：<br></div>
                </div>
                <div class="form-group row" id="showMesg" style="margin:10px 100px 10px;">
                </div>
				<div style="margin: 30px 60px 10px">
					<button class="btn btn-block btn-sm btn-warning center-block" style="width:30%;" id="sureBtn">确定</button>
				</div>
			</div>
        </div>			
    </div>
	<script type="text/javascript">
	    var flag = 0;
	    function goCourierW(txt){
           	 	$("body").append("<div id='mask'></div>");
	       		$("#mask").addClass("mask").fadeIn("slow");
	       		$("#successDiag").fadeIn("slow");
				document.getElementById('showMesg').innerHTML = txt;
        };
	    
	    $("#sureBtn").on('click', function () {
	    	$("#successDiag").fadeOut("fast");
	    	$("#mask").css({ display: 'none' });
			if (1 == flag)
				window.location.href="page/index"; 
	    });
	    
	    //关闭
	    $(".close_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#999' }) }).on('click', function () {
	       	$("#successDiag").fadeOut("fast");
	       	$("#mask").css({ display: 'none' });
			if (1 == flag)
				window.location.href="page/index";
	    });	
		
		function validForm(){
			return $("#claimForm").validate({
				rules:{
					POLICYNO: {
						required:true,
						rangelength:[5,50],
						regex:/[^\u4e00-\u9fa5]/g
					},
					INFORNAME: {
						required:true,
						rangelength:[2,4],
                        regex:/^[\u4e00-\u9fa5a-zA-Z][\u4e00-\u9fa5a-zA-Z 　]*[\u4e00-\u9fa5a-zA-Z]$/
					},
					CLAIMERTEL: {
						required:true,
						rangelength:[5,20],
						regex:/[0-9\-－—]/g
					},
                    EMAIL: {
						required:true,
                        email:true
					},
                    OCCURTIME: {
						required:true
					},
                    OCCURPLACE: {
						required:true,
                        rangelength:[6,30]
					},
                    POLICYNAME: {
						required:true,
                        rangelength:[2,4],
                        regex:/^[\u4e00-\u9fa5a-zA-Z][\u4e00-\u9fa5a-zA-Z 　]*[\u4e00-\u9fa5a-zA-Z]$/
					},
                    POLICERTEL: {
                        required:true,
                        rangelength:[5,20],
                        regex:/[0-9\-－—]/g
					},
                     POLICEACCIDENT: {
						required:true,
						rangelength:[5,200]
					}
				},
				messages: {
					POLICYNO: {
						required: "请输入服务卡号",
						rangelength: "长度必须为5-50个字符",
						regex:"不允许为汉字"
					},
					INFORNAME: {
						required: "请填写您的真实姓名",
						rangelength: "长度必须为2-4个字符",
                        regex: "姓名只能为汉字或英文"
					},
                    CLAIMERTEL: {
						required: "建议填写您的手机号码",
						rangelength: "长度必须为5-20个字符",
						regex:"只能为数字及破折号"
					},
                    EMAIL: {
						required: "请输入电子邮箱",
                        email: "E-Mail格式不正确"
					},
                    OCCURTIME: {
						required: "请输入出险时间"
					},
                    OCCURPLACE: {
						required: "请填写详细地址以便理赔",
                        rangelength: "长度必须为6-30个字符",
					},
                    POLICYNAME: {
                        required: "请填写您的真实姓名",
                        rangelength: "长度必须为2-4个字符",
                        regex: "姓名只能为汉字或英文"
                    },
                    POLICERTEL: {
                        required: "建议填写您的手机号码",
                         rangelength: "长度必须为5-20个字符",
                         regex:"只能为数字及破折号"
					},
                    POLICEACCIDENT: {
						required: "请输入出险经过",
						rangelength: "长度必须为5-200个字符"
					}
				},
                errorPlacement:function(error,element){
                    error.appendTo(element.parent().next());
                }
			});	
		}
		
		$(document).ready(function() {
			$(validForm());
		});
		
		//检测用户姓名是否为汉字
        jQuery.validator.addMethod('isChar', function(value, element) {  
            var length = value.length;  
            var regName = /[^\u4e00-\u9fa5]/g;  
            return this.optional(element) || !regName.test( value );    
        }, "请正确格式的姓名(暂支持汉字)"); 
        
        // 自定义方法支持正则 ，例如手机号验证/^1([3578]\d|4[57])\d{8}$/ 
        jQuery.validator.addMethod("regex", function(value, element, param) {   
            var r = param;
            return r.test(value);
        }, "填写不正确");
        
        function mysubmit(){
			//if(!$("#claimForm").validationEngine("validate"))
			//	return ;
			if(!validForm().form())
				return;
            $.ajax({
                url: "claimsys/fg/${msg }.do",    //请求的url地址
                dataType: "json",   //返回格式为json
                async: false, //请求是否异步，默认为异步，这也是ajax重要特性
                data: $('#claimForm').serialize(),   //参数值
                type: "POST",   //请求方式
                beforeSend: function() {
                    //请求前的处理
                },
                success: function(data) {
                    if (data.IsSuccess == false) {
                        var txt=  "啊呀呀呀丫丫，失败了呢！";
						flag = 0;
						goCourierW(txt);
                    }
                    if (data.IsSuccess == true) { 
                        var txt=  "保险公司："+data.COMPANY+"<br/>联系电话："+data.COMPANYTEL+"<br/>";
						flag = 1;
						goCourierW(txt);
                        $("input").attr("value", "");
                        $("#POLICEACCIDENT").val('');
                    }
                },
                complete: function() {
                    //请求完成的处理
                },
                error: function() {
                    //请求出错处理
                }
            });
        }
        $(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
    </script>
    
 	<!-- 尾部-->	
<%@ include file="../../tail.jsp"%>
</body>
</html>