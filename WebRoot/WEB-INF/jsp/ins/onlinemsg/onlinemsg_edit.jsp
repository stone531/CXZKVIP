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
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="onlinemsg/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ONLINEMSG_ID" id="ONLINEMSG_ID" value="${pd.ONLINEMSG_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户名:</td>
								<td><input type="text" name="USERNAME" id="USERNAME" value="${pd.USERNAME}" maxlength="255" placeholder="这里输入用户名" title="用户名" readonly="readonly"
 style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">客户端发送的消息:</td>
								<td><input type="text" name="CLIENTMSG" id="CLIENTMSG" value="${pd.CLIENTMSG}" maxlength="2048" placeholder="这里输入客户端发送的消息" title="客户端发送的消息" readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">客户发送消息时间:</td>
								<td><input  name="CLIENTWRITETIME" id="CLIENTWRITETIME" value="${pd.CLIENTWRITETIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="客户发送消息时间" title="客户发送消息时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">操作管理员名称:</td>
								<td><input type="text" name="OPERATIONADMIN" id="OPERATIONADMIN" value="${pd.OPERATIONADMIN}" maxlength="255" placeholder="这里输入操作管理员名称" title="操作管理员名称" readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">管理员回复消息:</td>
								<td><input type="text" name="REPLYMSG" id="REPLYMSG" value="${pd.REPLYMSG}" maxlength="2048" placeholder="这里输入管理员回复消息" title="管理员回复消息" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">管理员回复时间:</td>
								<td><input class="span10 date-picker" name="REPLYTIEM" id="REPLYTIEM" value="${pd.REPLYTIEM}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="管理员回复时间" title="管理员回复时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
	
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
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
			if($("#USERNAME").val()==""){
				$("#USERNAME").tips({
					side:3,
		            msg:'请输入用户名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERNAME").focus();
			return false;
			}
			if($("#CLIENTMSG").val()==""){
				$("#CLIENTMSG").tips({
					side:3,
		            msg:'请输入客户端发送的消息',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLIENTMSG").focus();
			return false;
			}
			if($("#CLIENTWRITETIME").val()==""){
				$("#CLIENTWRITETIME").tips({
					side:3,
		            msg:'请输入客户发送消息时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLIENTWRITETIME").focus();
			return false;
			}
			if($("#OPERATIONADMIN").val()==""){
				$("#OPERATIONADMIN").tips({
					side:3,
		            msg:'请输入操作管理员名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OPERATIONADMIN").focus();
			return false;
			}
			if($("#REPLYMSG").val()==""){
				$("#REPLYMSG").tips({
					side:3,
		            msg:'请输入管理员回复消息',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REPLYMSG").focus();
			return false;
			}
			if($("#REPLYTIEM").val()==""){
				$("#REPLYTIEM").tips({
					side:3,
		            msg:'请输入管理员回复时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REPLYTIEM").focus();
			return false;
			}
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