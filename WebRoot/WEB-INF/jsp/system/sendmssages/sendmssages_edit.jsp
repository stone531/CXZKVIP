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
					
					<form action="sendmssages/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SENDMSSAGES_ID" id="SENDMSSAGES_ID" value="${pd.SENDMSSAGES_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户姓名:</td>
								<td><input type="text" name="USERNAME" id="USERNAME" value="${pd.USERNAME}" maxlength="255" placeholder="这里输入用户姓名" title="用户姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">手机号:</td>
								<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="255" placeholder="这里输入手机号" title="手机号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">信息内容:</td>
								<td><input type="text" name="MESSAGE" id="MESSAGE" value="${pd.MESSAGE}" maxlength="3000" placeholder="这里输入信息内容" title="信息内容" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发送时间:</td>
								<td><input class="span10 date-picker" name="STARTTIME" id="STARTTIME" value="${pd.STARTTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="发送时间" title="发送时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">排序号:</td>
								<td><input type="text" name="ORDERNO" id="ORDERNO" value="${pd.ORDERNO}" maxlength="255" placeholder="这里输入排序号" title="排序号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否成功收到:</td>
								<td><input type="text" name="ISOK" id="ISOK" value="${pd.ISOK}" maxlength="255" placeholder="这里输入是否成功收到" title="是否成功收到" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="OTHER" id="OTHER" value="${pd.OTHER}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否发送:</td>
								<td><input type="text" name="ISSEND" id="ISSEND" value="${pd.ISSEND}" maxlength="255" placeholder="这里输入是否发送" title="是否发送" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">错误标示:</td>
								<td><input type="text" name="ERRORNOTE" id="ERRORNOTE" value="${pd.ERRORNOTE}" maxlength="255" placeholder="这里输入错误标示" title="错误标示" style="width:98%;"/></td>
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
		            msg:'请输入用户姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERNAME").focus();
			return false;
			}
			if($("#PHONE").val()==""){
				$("#PHONE").tips({
					side:3,
		            msg:'请输入手机号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE").focus();
			return false;
			}
			if($("#MESSAGE").val()==""){
				$("#MESSAGE").tips({
					side:3,
		            msg:'请输入信息内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MESSAGE").focus();
			return false;
			}
			if($("#STARTTIME").val()==""){
				$("#STARTTIME").tips({
					side:3,
		            msg:'请输入发送时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STARTTIME").focus();
			return false;
			}
			if($("#ORDERNO").val()==""){
				$("#ORDERNO").tips({
					side:3,
		            msg:'请输入排序号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORDERNO").focus();
			return false;
			}
			if($("#ISOK").val()==""){
				$("#ISOK").tips({
					side:3,
		            msg:'请输入是否成功收到',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ISOK").focus();
			return false;
			}
			if($("#OTHER").val()==""){
				$("#OTHER").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OTHER").focus();
			return false;
			}
			if($("#ISSEND").val()==""){
				$("#ISSEND").tips({
					side:3,
		            msg:'请输入是否发送',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ISSEND").focus();
			return false;
			}
			if($("#ERRORNOTE").val()==""){
				$("#ERRORNOTE").tips({
					side:3,
		            msg:'请输入错误标示',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ERRORNOTE").focus();
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