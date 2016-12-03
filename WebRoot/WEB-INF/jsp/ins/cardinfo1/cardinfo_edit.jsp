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
					
					<form action="cardinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="CARDINFO_ID" id="CARDINFO_ID" value="${pd.CARDINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">卡名称:</td>
								<td><input type="text" name="_CARDNAME" id="_CARDNAME" value="${pd._CARDNAME}" maxlength="255" placeholder="这里输入卡名称" title="卡名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">卡号:</td>
								<td><input type="number" name="_NUM" id="_NUM" value="${pd._NUM}" maxlength="32" placeholder="这里输入卡号" title="卡号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">卡密码:</td>
								<td><input type="text" name="_PASSWD" id="_PASSWD" value="${pd._PASSWD}" maxlength="255" placeholder="这里输入卡密码" title="卡密码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">当前状态:</td>
								<td><input type="text" name="_STATUS" id="_STATUS" value="${pd._STATUS}" maxlength="255" placeholder="这里输入当前状态" title="当前状态" style="width:98%;"/></td>
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
			if($("#_CARDNAME").val()==""){
				$("#_CARDNAME").tips({
					side:3,
		            msg:'请输入卡名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#_CARDNAME").focus();
			return false;
			}
			if($("#_NUM").val()==""){
				$("#_NUM").tips({
					side:3,
		            msg:'请输入卡号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#_NUM").focus();
			return false;
			}
			if($("#_PASSWD").val()==""){
				$("#_PASSWD").tips({
					side:3,
		            msg:'请输入卡密码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#_PASSWD").focus();
			return false;
			}
			if($("#_STATUS").val()==""){
				$("#_STATUS").tips({
					side:3,
		            msg:'请输入当前状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#_STATUS").focus();
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