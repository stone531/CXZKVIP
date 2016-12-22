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
								<td style="width:75px;text-align: right;padding-top: 13px;">消息id:</td>
								<td><input type="number" name="MSGID" id="MSGID" value="${pd.MSGID}" maxlength="32" placeholder="这里输入消息id" title="消息id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户id:</td>
								<td><input type="text" name="CLIENTUSER" id="CLIENTUSER" value="${pd.CLIENTUSER}" maxlength="255" placeholder="这里输入用户id" title="用户id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">管理员id:</td>
								<td><input type="text" name="ADMINUSER" id="ADMINUSER" value="${pd.ADMINUSER}" maxlength="255" placeholder="这里输入管理员id" title="管理员id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">聊天内容:</td>
								<td><input type="text" name="CONTENT" id="CONTENT" value="${pd.CONTENT}" maxlength="2048" placeholder="这里输入聊天内容" title="聊天内容" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">操作时间:</td>
								<td><input class="span10 date-picker" name="OPTIME" id="OPTIME" value="${pd.OPTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="操作时间" title="操作时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">回复msgid:</td>
								<td><input type="number" name="REPLYID" id="REPLYID" value="${pd.REPLYID}" maxlength="32" placeholder="这里输入回复msgid" title="回复msgid" style="width:98%;"/></td>
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
			if($("#MSGID").val()==""){
				$("#MSGID").tips({
					side:3,
		            msg:'请输入消息id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MSGID").focus();
			return false;
			}
			if($("#CLIENTUSER").val()==""){
				$("#CLIENTUSER").tips({
					side:3,
		            msg:'请输入用户id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLIENTUSER").focus();
			return false;
			}
			if($("#ADMINUSER").val()==""){
				$("#ADMINUSER").tips({
					side:3,
		            msg:'请输入管理员id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADMINUSER").focus();
			return false;
			}
			if($("#CONTENT").val()==""){
				$("#CONTENT").tips({
					side:3,
		            msg:'请输入聊天内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTENT").focus();
			return false;
			}
			if($("#OPTIME").val()==""){
				$("#OPTIME").tips({
					side:3,
		            msg:'请输入操作时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OPTIME").focus();
			return false;
			}
			if($("#REPLYID").val()==""){
				$("#REPLYID").tips({
					side:3,
		            msg:'请输入回复msgid',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REPLYID").focus();
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