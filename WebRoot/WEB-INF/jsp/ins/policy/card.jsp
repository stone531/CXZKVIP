<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
	
	
	<!-- 投保页面头 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
    <!--diy css-->
    <style type="text/css">
      body{background:none repeat scroll 0 0 #FFF;}
                      
                      .daohang{
                      	margin:0 auto;
                      	height:90px;
                      	background-image:url(http://passport.zwbk.org/static/images/bag_04.jpg);
                      	background-repeat:repeat-x;
                      	width:100%;
                      }
                      
                      .daohang_con{width: 977px;
                      margin-left: auto;
                      margin-right: auto;
                      height: 80px;}
                    .index_logo{
                      display:block;
                      width:282px;
                      height:38px;
                      float:left;
                      padding-top:20px;}
                    .daohang_r{
                        font-size:14px;
                        font-family:微软雅黑;
                        width:150px;
                        float:right;
                        margin-top:42px;
                        }
                    .daohang_r a{
                        text-decoration:none;
                        color:#FFFFFF;
                    }
                
                      .cente{width:977px;margin:0 auto;}
                      
                    .foot {
                        border-top: 1px solid #e1e1e1;
                        font-size: 12px;
                        height: 100px;
                        width: 100%;
                    }
                    .foot ul {
                        height: 18px;
                        line-height: 18px;
                        list-style: outside none none;
                        margin: 0 auto;
                        padding-bottom: 10px;
                        padding-top: 29px;
                        text-align: center;
                        width: 320px;
                        box-sizing: content-box;
                    }
                    .foot ul li {
                        border-right: 1px solid rgb(112, 112, 112);
                        float: left;
                        height: 12px;
                        line-height: 12px;
                        list-style: outside none none;
                        padding-left: 12px;
                        padding-right: 12px;
                    }
                    .foot ul .footli_last {
                        border: 0 none;
                    }
                    .foot ul li a {
                        color: rgb(120, 120, 120);
                        font-family: "宋体";
                        font-size: 12px;
                        line-height: 12px;
                        margin: 0;
                        padding: 0;
                        text-align: center;
                    }
                    .foot .foot_t {
                        display: block;
                        margin: 0 auto;
                        text-align: center;
                        width: 980px;
                    }
                    .foot .foot_t li span {
                        background: rgba(0, 0, 0, 0) url("http://passport.zwbk.org/images/yhzx.png") no-repeat scroll -40px 0;
                        float: left;
                        height: 21px;
                        width: 21px;
                
                    }
                    .foot .foot_b {
                        color: rgb(112, 112, 112);
                        display: block;
                        margin: 0 auto;
                        text-align: center;
                        width: 980px;
                    }
                      
                    .ketup {
                    float: left;
                    height: 41px;
                	}
                      
                    .ketxt {
                    float: left;
                    font-family: 微软雅黑;
                    font-size: 18px;
                    height: 20px;
                    line-height: 20px;
                    margin-left: 10px;
                    margin-top: 8px;
                    overflow: hidden;
                    width: 200px;
                	}
                      .kecontent {
                    color: #797979;
                    font-family: 微软雅黑;
                    font-size: 12px;
                    height: 82px;
                    line-height: 1.7em;
                    width: 290px;
                	}
                      
                      
                      
                   .div11 {
                    background: rgba(0, 0, 0, 0) url("http://passport.zwbk.org/static/images/daohang3.jpg") no-repeat scroll 80px 20px;
                    height: 310px;
                    position: relative;
                    width: 507px;
                }
                     .div11 div {
                    background-color: #fdf4f4;
                    border: 1px solid #ffa189;
                    font-size: 18px;
                    height: 39px;
                    line-height: 39px;
                    padding-left: 10px;
                    padding-right: 10px;
                    position: absolute;
                    text-align: center;
                }
                      
                      .div01 {
                    margin-left: 180px;
                    margin-top: 110px;
                }
                      .div11 .div01 a {
                    color: #c80000;
                    font-family: 微软雅黑;
                    font-size: 24px;
                    text-decoration: none;
                }
                      
                
                
                      
                    .div02 {
                    margin-left: 190px;
                    margin-top: 12px;
                }
                .div02 a {
                    color: #d22e2e;
                    font-family: 微软雅黑;
                    font-size: 18px;
                    text-decoration: none;
                }
                .div03 {
                    margin-left: 380px;
                    margin-top: 1px;
                }
                .div04 {
                    margin-left: 325px;
                    margin-top: 65px;
                }
                .div05 {
                    margin-left: 385px;
                    margin-top: 140px;
                }
                .div06 {
                    margin-left: 395px;
                    margin-top: 195px;
                }
                .div07 {
                    margin-left: 265px;
                    margin-top: 235px;
                }
                .div08 {
                    margin-left: 150px;
                    margin-top: 185px;
                }
                .div09 {
                    margin-left: 65px;
                    margin-top: 253px;
                }
                .div10 {
                    margin-left: 9px;
                    margin-top: 135px;
                }
                .div101 {
                    margin-left: 65px;
                    margin-top: 57px;
                }
                   
                      
                .jia {
                    border: 1px solid #e1e1e1;
                    height: 402px;
                    width: 405px;
                }
                      .jia_wrap {
                    margin-left: 0px;
                    margin-top: 55px;
                    width: 355px;
                }
                      
                      
                .centrig {
                    border: 5px solid #f5f5f5;
                    float: left;
                    height: 314px;
                    margin-left: 30px;
                    width: 407px;
                }
    </style>

	
	
</head>
<body class="no-skin">
	<!-- header -->>
    <div class="daohang">
      <div class="daohang_con">
        <a class="index_logo" href="/"><img src="static/ips/static/img/head_logo.jpg"></a>
        <div class="daohang_r">
          <a href="#">惠泽首页</a>
        </div>
      </div>
    </div>
    
			
			<!--替换form表单-->
<div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-4"></div>
          <div class="col-md-4">
            <form class="form-horizontal" role="form">
              <div class="form-group">
                <div class="col-sm-2">
                  <label for="inputEmail3" class="control-label">卡号</label>
                </div>
                <div class="col-sm-10">
                  <input type="email" class="form-control" id="inputEmail3" placeholder="服务卡">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label for="inputPassword3" class="control-label">密码</label>
                </div>
                <div class="col-sm-10">
                  <input type="password" class="form-control" id="inputPassword3" placeholder="密码">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-block btn-danger" weight="300" data-toggle="modal">确定</button>
                </div>
              </div>
            </form>
          </div>
          <div class="col-md-4"></div>
        </div>
      </div>
    </div>
 


	<!-- foot -->>
    <div class="section">
        <div class="container">
          <div class="row">
            <div class="col-md-4">
              <div class="ketup">
                <img src="http://passport.zwbk.org/static/images/ke1.jpg">
              </div>
              <div class="ketxt">质量保证</div>
              <div style="height:5px;clear:both;"></div>
              <div class="kecontent">一句专业的分类方法，制定了中文百科在线的"知识体系"。在站点构建、内容录入以及文字编创等各方面都以科学性为标准。</div>
            </div>
            <div class="col-md-4">
              <div class="ketup">
                <img src="http://passport.zwbk.org/static/images/quwei3.jpg">
              </div>
              <div class="ketxt">售后服务</div>
              <div style="height:5px;clear:both;"></div>
              <div class="kecontent">拥有庞大的字典、词典、百科、问答知识库、而且兼有心里、法律、创意、考试等相关内容，您可以尽情在知识的海洋里翱翔。</div>
            </div>
            <div class="col-md-4">
              <div class="ketup">
                <img src="http://passport.zwbk.org/static/images/shi2.jpg">
              </div>
              <div class="ketxt">联系我们</div>
              <div style="height:5px;clear:both;"></div>
              <div class="kecontent">拥有动漫、美食、珠宝等趣味性的知识，而且，您还可以尽情的装饰您个性化的百科个人空间，在学习和娱乐中尽展您的魅力。</div>
            </div>
          </div>
        </div>
      </div>
      <div class="foot">
        <div class="foot_t">
          <ul>
            <li>
              <a target="_blank" href="#">联系我们</a>
            </li>
            <li>
              <a target="_blank" href="#">意见反馈</a>
            </li>
            <li>
              <a target="_blank" href="#">帮助中心</a>
            </li>
            <li class="footli_last">
              <a target="_blank" href="#">免责声明</a>
            </li>
          </ul>
        </div>
        <p style="box-sizing: unset;" class="foot_b">Copyright © 2016 littleflyman.org 惠保永泽科技 All rights reserverd.京ICP证090000号</p>
      </div>
    </div>



<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#POLICYNO").val()==""){
				$("#POLICYNO").tips({
					side:3,
		            msg:'请输入保单号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#POLICYNO").focus();
			return false;
			}
			if($("#CARDNO").val()==""){
				$("#CARDNO").tips({
					side:3,
		            msg:'请输入服务卡号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CARDNO").focus();
			return false;
			}
			if($("#CARDTYPE").val()==""){
				$("#CARDTYPE").tips({
					side:3,
		            msg:'请输入服务卡类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CARDTYPE").focus();
			return false;
			}
			if($("#IERNAME").val()==""){
				$("#IERNAME").tips({
					side:3,
		            msg:'请输入投保人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IERNAME").focus();
			return false;
			}
			if($("#IERPAPERTYPE").val()==""){
				$("#IERPAPERTYPE").tips({
					side:3,
		            msg:'请输入投保人证件类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IERPAPERTYPE").focus();
			return false;
			}
			if($("#IERPAPERNO").val()==""){
				$("#IERPAPERNO").tips({
					side:3,
		            msg:'请输入投保人证件号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IERPAPERNO").focus();
			return false;
			}
			if($("#IERPHONE").val()==""){
				$("#IERPHONE").tips({
					side:3,
		            msg:'请输入投保人手机号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IERPHONE").focus();
			return false;
			}
			if($("#IANTNAME").val()==""){
				$("#IANTNAME").tips({
					side:3,
		            msg:'请输入被保险人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IANTNAME").focus();
			return false;
			}
			if($("#IANTPAPERNO").val()==""){
				$("#IANTPAPERNO").tips({
					side:3,
		            msg:'请输入被保险人证件号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IANTPAPERNO").focus();
			return false;
			}
			if($("#IANTPROFESSION").val()==""){
				$("#IANTPROFESSION").tips({
					side:3,
		            msg:'请输入被保险人职业',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IANTPROFESSION").focus();
			return false;
			}
			if($("#IANTRELATION").val()==""){
				$("#IANTRELATION").tips({
					side:3,
		            msg:'请输入与被保险人关系',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IANTRELATION").focus();
			return false;
			}
			if($("#IANAGE").val()==""){
				$("#IANAGE").tips({
					side:3,
		            msg:'请输入被保险人年龄',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IANAGE").focus();
			return false;
			}
			if($("#BENNAME").val()==""){
				$("#BENNAME").tips({
					side:3,
		            msg:'请输入受益人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BENNAME").focus();
			return false;
			}
			if($("#BENPAPERNO").val()==""){
				$("#BENPAPERNO").tips({
					side:3,
		            msg:'请输入受益人证件号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BENPAPERNO").focus();
			return false;
			}
			if($("#SVRNAME").val()==""){
				$("#SVRNAME").tips({
					side:3,
		            msg:'请输入服务人员姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SVRNAME").focus();
			return false;
			}
			if($("#SVRPHONE").val()==""){
				$("#SVRPHONE").tips({
					side:3,
		            msg:'请输入服务人员手机号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SVRPHONE").focus();
			return false;
			}
			if($("#ISSENDMESSAGE").val()==""){
				$("#ISSENDMESSAGE").tips({
					side:3,
		            msg:'请输入是否发生短信',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ISSENDMESSAGE").focus();
			return false;
			}
			if($("#ISHASPOLICYNO").val()==""){
				$("#ISHASPOLICYNO").tips({
					side:3,
		            msg:'请输入是否已经生成保单号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ISHASPOLICYNO").focus();
			return false;
			}
			/*
			if($("#CREATED").val()==""){
				$("#CREATED").tips({
					side:3,
		            msg:'请输入投保时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATED").focus();
			return false;
			}
			if($("#UPDATED").val()==""){
				$("#UPDATED").tips({
					side:3,
		            msg:'请输入保单生效时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UPDATED").focus();
			return false;
			}
			if($("#INVALID").val()==""){
				$("#INVALID").tips({
					side:3,
		            msg:'请输入保单时效时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INVALID").focus();
			return false;
			}
			*/
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
		



</body>
</html>