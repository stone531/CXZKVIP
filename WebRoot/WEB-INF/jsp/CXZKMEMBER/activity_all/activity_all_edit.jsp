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
					
					<form action="activity_all/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ACTIVITY_ALL_ID" id="ACTIVITY_ALL_ID" value="${pd.ACTIVITY_ALL_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">活动名称:</td>
								<td><input type="text" name="MAA_NAME" id="MAA_NAME" value="${pd.MAA_NAME}" maxlength="255" placeholder="这里输入市场活动主题" title="市场活动主题" style="width:98%;"/></td>
							</tr>
							<!-- 
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">产品:</td>
								<td><input type="text" name="MAA_TYPE_ID" id="MAA_TYPE_ID" value="${pd.MAA_TYPE_ID}" maxlength="255" placeholder="产品" title="产品" style="width:98%;"/></td>
							</tr>
							 -->
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">开始日期:</td>
								<td><input type="text" class="span10 date-picker" name="MAA_BEGINNING_DATE" id="MAA_BEGINNING_DATE" value="${pd.MAA_BEGINNING_DATE}" data-date-format="yyyy-mm-dd" readonly="readonly" maxlength="255" placeholder="这里选择开始日期" title="开始日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">结束日期:</td>
								<td><input type="text" class="span10 date-picker" name="MAA_END_DATE" id="MAA_END_DATE" value="${pd.MAA_END_DATE}" data-date-format="yyyy-mm-dd" readonly="readonly" maxlength="255" placeholder="这里选择结束日期" title="结束日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">负责人:</td>
								<td><select class="chosen-select form-control" name="MAA_CHARGE_ID" id="MAA_CHARGE_ID"  data-placeholder="请选择负责人" style="vertical-align:top;" style="width:98%;" >
										<option value="">请选择</option>
										<c:forEach items="${userList}" var="user">
											<option value="${user.USER_ID }" <c:if test="${user.USER_ID == pd.MAA_CHARGE_ID }">selected</c:if>>${user.USERNAME }</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">活动地点:</td>
								<td><input type="text" name="MAA_ADDRESS" id="MAA_ADDRESS" value="${pd.MAA_ADDRESS}" maxlength="255" placeholder="这里输入活动地点" title="活动地点" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">活动描述:</td>
								<td><input type="text" name="MAA_DESC" id="MAA_DESC" value="${pd.MAA_DESC}" maxlength="255" placeholder="这里输入活动描述" title="活动描述" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建公司:</td>
								<td>
								<select class="chosen-select form-control" name="COA_ORG_ID" id="COA_ORG_ID" onchange="show_Dep($(this).val())" data-placeholder="请选择创建公司" style="vertical-align:top;" style="width:98%;" >
										<option value="">请选择</option>
										<c:forEach items="${depList}" var="dep">
											<option value="${dep.DEPARTMENT_ID }" <c:if test="${dep.DEPARTMENT_ID == pd.COA_ORG_ID }">selected</c:if>>${dep.NAME }</option>
										</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input type="text" class="span10 date-picker" name="CREATION_DATE" id="CREATION_DATE" value="${pd.CREATION_DATE}" data-date-format="yyyy-mm-dd" readonly="readonly" maxlength="255" placeholder="这里选择创建时间" title="创建时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建人:</td>
								<input type="hidden" value="${pd.USER_ID}" name="CREATED_BY" id="CREATED_BY"/>
								<td><input type="text"  readonly="readonly" value="${pd.USERNAME}" maxlength="255" placeholder="这里输入创建人" title="创建人" style="width:98%;"/></td>
							</tr>
							<!-- 
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">组织:</td>
								<td><input type="text" name="EXECUTE_ORG_ID" id="EXECUTE_ORG_ID" value="${pd.EXECUTE_ORG_ID}" maxlength="255" placeholder="这里输入组织" title="组织" style="width:98%;"/></td>
							</tr>
							 -->
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">举办公司:</td>
								<td>
									<select class="chosen-select form-control" name="EXECUTE_DEPT_ID" id="EXECUTE_DEPT_ID" onchange="show_Dep($(this).val())" data-placeholder="请选择举办公司" style="vertical-align:top;" style="width:98%;" >
											<option value="">请选择</option>
											<c:forEach items="${depList}" var="dep">
												<option value="${dep.DEPARTMENT_ID }" <c:if test="${dep.DEPARTMENT_ID == pd.EXECUTE_DEPT_ID }">selected</c:if>>${dep.NAME }</option>
											</c:forEach>
											</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">报名截止日期:</td>
								<td><input type="text" class="span10 date-picker" name="SIGN_UP_DATE" id="SIGN_UP_DATE" value="${pd.SIGN_UP_DATE}" data-date-format="yyyy-mm-dd" readonly="readonly" maxlength="255" placeholder="这里选择报名截止日期" title="截止日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">讲师:</td>
								<td><select class="chosen-select form-control" name="TEACHER_ID" id="TEACHER_ID"  data-placeholder="请选择讲师" style="vertical-align:top;" style="width:98%;" >
										<option value="">请选择</option>
										<c:forEach items="${userList}" var="user">
											<option value="${user.USER_ID }" <c:if test="${user.USER_ID == pd.TEACHER_ID }">selected</c:if>>${user.USERNAME }</option>
										</c:forEach>
								</select></td>
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
			if($("#MAA_NAME").val()==""){
				$("#MAA_NAME").tips({
					side:3,
		            msg:'请输入市场活动主题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MAA_NAME").focus();
			return false;
			}
			/*
			if($("#MAA_TYPE_ID").val()==""){
				$("#MAA_TYPE_ID").tips({
					side:3,
		            msg:'请输入市场活动类型ID(产品ID)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MAA_TYPE_ID").focus();
			return false;
			}
			*/
			if($("#MAA_BEGINNING_DATE").val()==""){
				$("#MAA_BEGINNING_DATE").tips({
					side:3,
		            msg:'请输入开始日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MAA_BEGINNING_DATE").focus();
			return false;
			}
			if($("#MAA_END_DATE").val()==""){
				$("#MAA_END_DATE").tips({
					side:3,
		            msg:'请输入结束日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MAA_END_DATE").focus();
			return false;
			}
			if($("#MAA_CHARGE_ID").val()==""){
				$("#MAA_CHARGE_ID").tips({
					side:3,
		            msg:'请输入负责人id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MAA_CHARGE_ID").focus();
			return false;
			}
			if($("#MAA_ADDRESS").val()==""){
				$("#MAA_ADDRESS").tips({
					side:3,
		            msg:'请输入活动地点',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MAA_ADDRESS").focus();
			return false;
			}
			if($("#MAA_DESC").val()==""){
				$("#MAA_DESC").tips({
					side:3,
		            msg:'请输入活动描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MAA_DESC").focus();
			return false;
			}
			if($("#COA_ORG_ID").val()==""){
				$("#COA_ORG_ID").tips({
					side:3,
		            msg:'请输入创建公司',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COA_ORG_ID").focus();
			return false;
			}
			if($("#CREATION_DATE").val()==""){
				$("#CREATION_DATE").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATION_DATE").focus();
			return false;
			}
			if($("#CREATED_BY").val()==""){
				$("#CREATED_BY").tips({
					side:3,
		            msg:'请输入创建人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATED_BY").focus();
			return false;
			}
			/*
			if($("#EXECUTE_ORG_ID").val()==""){
				$("#EXECUTE_ORG_ID").tips({
					side:3,
		            msg:'请输入组织id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXECUTE_ORG_ID").focus();
			return false;
			}
			*/
			if($("#EXECUTE_DEPT_ID").val()==""){
				$("#EXECUTE_DEPT_ID").tips({
					side:3,
		            msg:'请输入举办公司',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXECUTE_DEPT_ID").focus();
			return false;
			}
			if($("#SIGN_UP_DATE").val()==""){
				$("#SIGN_UP_DATE").tips({
					side:3,
		            msg:'请输入报名截止日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SIGN_UP_DATE").focus();
			return false;
			}
			if($("#TEACHER_ID").val()==""){
				$("#TEACHER_ID").tips({
					side:3,
		            msg:'请输入讲师id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEACHER_ID").focus();
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