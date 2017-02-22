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
					
					<form action="worker/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="WORKER_ID" id="WORKER_ID" value="${pd.WORKER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">worker id:</td>
								<td><input type="text" name="ID" id="ID" value="${pd.ID}" maxlength="255" placeholder="这里输入worker id" title="worker id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">worker name:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入worker name" title="worker name" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">职业类别:</td>
								<td><input type="text" name="WORKCLASS" id="WORKCLASS" value="${pd.WORKCLASS}" maxlength="255" placeholder="这里输入职业类别" title="职业类别" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">父id:</td>
								<td><input type="text" name="PARENTID" id="PARENTID" value="${pd.PARENTID}" maxlength="255" placeholder="这里输入父id" title="父id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备用:</td>
								<td><input type="text" name="EXT1" id="EXT1" value="${pd.EXT1}" maxlength="255" placeholder="这里输入备用" title="备用" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备用:</td>
								<td><input type="text" name="EXT2" id="EXT2" value="${pd.EXT2}" maxlength="255" placeholder="这里输入备用" title="备用" style="width:98%;"/></td>
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
			if($("#ID").val()==""){
				$("#ID").tips({
					side:3,
		            msg:'请输入worker id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ID").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入worker name',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#WORKCLASS").val()==""){
				$("#WORKCLASS").tips({
					side:3,
		            msg:'请输入职业类别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WORKCLASS").focus();
			return false;
			}
			if($("#PARENTID").val()==""){
				$("#PARENTID").tips({
					side:3,
		            msg:'请输入父id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARENTID").focus();
			return false;
			}
			if($("#EXT1").val()==""){
				$("#EXT1").tips({
					side:3,
		            msg:'请输入备用',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXT1").focus();
			return false;
			}
			if($("#EXT2").val()==""){
				$("#EXT2").tips({
					side:3,
		            msg:'请输入备用',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXT2").focus();
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