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
					
					<form action="insnum/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="INSNUM_ID" id="INSNUM_ID" value="${pd.INSNUM_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">最小年龄:</td>
								<td><input type="number" name="_MINAGE" id="_MINAGE" value="${pd._MINAGE}" maxlength="32" placeholder="这里输入最小年龄" title="最小年龄" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">最大年龄:</td>
								<td><input type="number" name="_MAXAGE" id="_MAXAGE" value="${pd._MAXAGE}" maxlength="32" placeholder="这里输入最大年龄" title="最大年龄" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">投保份数:</td>
								<td><input type="number" name="_INSCOPIES" id="_INSCOPIES" value="${pd._INSCOPIES}" maxlength="32" placeholder="这里输入投保份数" title="投保份数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">承保公司名称:</td>
								<td><input type="text" name="_INSURANCECOMNAME" id="_INSURANCECOMNAME" value="${pd._INSURANCECOMNAME}" maxlength="255" placeholder="这里输入承保公司名称" title="承保公司名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">保险起始时间:</td>
								<td><input class="span10 date-picker" name="_INSSTARTTIME" id="_INSSTARTTIME" value="${pd._INSSTARTTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="保险起始时间" title="保险起始时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">保险结束时间:</td>
								<td><input class="span10 date-picker" name="_INSENDTIME" id="_INSENDTIME" value="${pd._INSENDTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="保险结束时间" title="保险结束时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">当前卡单状态:</td>
								<td><input type="text" name="_STATUS" id="_STATUS" value="${pd._STATUS}" maxlength="255" placeholder="这里输入当前卡单状态" title="当前卡单状态" style="width:98%;"/></td>
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
			if($("#_MINAGE").val()==""){
				$("#_MINAGE").tips({
					side:3,
		            msg:'请输入最小年龄',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#_MINAGE").focus();
			return false;
			}
			if($("#_MAXAGE").val()==""){
				$("#_MAXAGE").tips({
					side:3,
		            msg:'请输入最大年龄',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#_MAXAGE").focus();
			return false;
			}
			if($("#_INSCOPIES").val()==""){
				$("#_INSCOPIES").tips({
					side:3,
		            msg:'请输入投保份数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#_INSCOPIES").focus();
			return false;
			}
			if($("#_INSURANCECOMNAME").val()==""){
				$("#_INSURANCECOMNAME").tips({
					side:3,
		            msg:'请输入承保公司名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#_INSURANCECOMNAME").focus();
			return false;
			}
			if($("#_INSSTARTTIME").val()==""){
				$("#_INSSTARTTIME").tips({
					side:3,
		            msg:'请输入保险起始时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#_INSSTARTTIME").focus();
			return false;
			}
			if($("#_INSENDTIME").val()==""){
				$("#_INSENDTIME").tips({
					side:3,
		            msg:'请输入保险结束时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#_INSENDTIME").focus();
			return false;
			}
			if($("#_STATUS").val()==""){
				$("#_STATUS").tips({
					side:3,
		            msg:'请输入当前卡单状态',
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