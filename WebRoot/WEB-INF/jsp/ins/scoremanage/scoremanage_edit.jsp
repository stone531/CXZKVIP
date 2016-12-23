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
					
					<form action="scoremanage/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SCOREMANAGE_ID" id="SCOREMANAGE_ID" value="${pd.SCOREMANAGE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">类型ID:</td>
								<td><input type="number" name="SCORE_ID" id="SCORE_ID" value="${pd.SCORE_ID}" maxlength="32" placeholder="这里输入类型ID" title="类型ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">类型名称:</td>
								<td><input type="text" name="SCORE_NAME" id="SCORE_NAME" value="${pd.SCORE_NAME}" maxlength="255" placeholder="这里输入类型名称" title="类型名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">积分值:</td>
								<td><input type="text" name="SCORE_VALUE" id="SCORE_VALUE" value="${pd.SCORE_VALUE}" maxlength="255" placeholder="这里输入积分值" title="积分值" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否生效:</td>
								<td><input type="text" name="IS_OK" id="IS_OK" value="${pd.IS_OK}" maxlength="255" placeholder="这里输入是否生效" title="是否生效" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="SCORE_REMARK" id="SCORE_REMARK" value="${pd.SCORE_REMARK}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备用:</td>
								<td><input type="text" name="SCORE_EXT" id="SCORE_EXT" value="${pd.SCORE_EXT}" maxlength="255" placeholder="这里输入备用" title="备用" style="width:98%;"/></td>
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
			if($("#SCORE_ID").val()==""){
				$("#SCORE_ID").tips({
					side:3,
		            msg:'请输入类型ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCORE_ID").focus();
			return false;
			}
			if($("#SCORE_NAME").val()==""){
				$("#SCORE_NAME").tips({
					side:3,
		            msg:'请输入类型名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCORE_NAME").focus();
			return false;
			}
			if($("#SCORE_VALUE").val()==""){
				$("#SCORE_VALUE").tips({
					side:3,
		            msg:'请输入积分值',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCORE_VALUE").focus();
			return false;
			}
			if($("#IS_OK").val()==""){
				$("#IS_OK").tips({
					side:3,
		            msg:'请输入是否生效',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_OK").focus();
			return false;
			}
			if($("#SCORE_REMARK").val()==""){
				$("#SCORE_REMARK").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCORE_REMARK").focus();
			return false;
			}
			if($("#SCORE_EXT").val()==""){
				$("#SCORE_EXT").tips({
					side:3,
		            msg:'请输入备用',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCORE_EXT").focus();
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