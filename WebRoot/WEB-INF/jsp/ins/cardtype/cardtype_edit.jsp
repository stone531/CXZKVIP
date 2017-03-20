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
					
					<form action="cardtype/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="CARDTYPE_ID" id="CARDTYPE_ID" value="${pd.CARDTYPE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">类型名:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="100" placeholder="这里输入类型名" title="类型名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">卡类型限额:</td>
								<td><input type="number" name="LIMITAMOUNT" id="LIMITAMOUNT" value="${pd.LIMITAMOUNT}" maxlength="32" placeholder="这里输入卡类型限额" title="卡类型限额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">卡种的面值:</td>
								<td><input type="number" name="AMOUNT" id="AMOUNT" value="${pd.AMOUNT}" maxlength="32" placeholder="这里输入卡种的面值" title="卡种的面值" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">最小使用年龄:</td>
								<td><input type="number" name="MINAGE" id="MINAGE" value="${pd.MINAGE}" maxlength="32" placeholder="这里输入最小使用年龄" title="最小使用年龄" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">最大使用年龄:</td>
								<td><input type="number" name="MAXAGE" id="MAXAGE" value="${pd.MAXAGE}" maxlength="32" placeholder="这里输入最大使用年龄" title="最大使用年龄" style="width:98%;"/></td>
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
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入类型名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#LIMITAMOUNT").val()==""){
				$("#LIMITAMOUNT").tips({
					side:3,
		            msg:'请输入卡类型限额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LIMITAMOUNT").focus();
			return false;
			}
			if($("#AMOUNT").val()==""){
				$("#AMOUNT").tips({
					side:3,
		            msg:'请输入卡种的面值',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AMOUNT").focus();
			return false;
			}
			if($("#MINAGE").val()==""){
				$("#MINAGE").tips({
					side:3,
		            msg:'请输入最小使用年龄',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MINAGE").focus();
			return false;
			}
			if($("#MAXAGE").val()==""){
				$("#MAXAGE").tips({
					side:3,
		            msg:'请输入最大使用年龄',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MAXAGE").focus();
			return false;
			}
			if($("#PROFESSION").val()==""){
				$("#PROFESSION").tips({
					side:3,
		            msg:'请输入限制使用的职业列表',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROFESSION").focus();
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