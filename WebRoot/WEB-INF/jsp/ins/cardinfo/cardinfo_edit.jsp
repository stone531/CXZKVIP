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
								<td style="width:75px;text-align: right;padding-top: 13px;">服务卡号:</td>
								<td><input type="text" name="CARDID" id="CARDID" value="${pd.CARDID}" maxlength="255" placeholder="这里输入服务卡号" title="服务卡号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">卡的状态:</td>
								<td><input type="number" name="STATE" id="STATE" value="${pd.STATE}" maxlength="32" placeholder="这里输入卡的状态" title="卡的状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">卡类型:</td>
								<td>
								<!--  input type="text" name="TYPEID" id="TYPEID" value="${pd.TYPEID}" maxlength="100" placeholder="这里输入卡类型" title="卡类型" style="width:98%;"/-->
								<select id="TYPEID" name="TYPEID" title="卡类型" style="width:98%;" >																				
										<c:choose>
								            <c:when test="${not empty varList}">
								            	<c:forEach items="${varList}" var="var" varStatus="vs">
								            	<option value="${var.CARDTYPE_ID}">${var.NAME}</option>						
								            	</c:forEach>
								            </c:when>
								            <c:otherwise>
										        <option value="卡类型名">卡类型</option>                                         
								            </c:otherwise>
										</c:choose>
                                    </select>
								</td>
							</tr>
							<!-- 
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">有效日期:</td>
								<td><input class="span10 date-picker" name="EXPIRYTIME" id="EXPIRYTIME" value="${pd.EXPIRYTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="有效日期" title="有效日期" style="width:98%;"/></td>
							</tr>
							<tr>
							 -->
								<td style="width:75px;text-align: right;padding-top: 13px;">保单号:</td>
								<td><input type="text" name="POLICYNO" id="POLICYNO" value="${pd.POLICYNO}" maxlength="255" placeholder="这里输入保单号" title="保单号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">被保险人姓名:</td>
								<td><input type="text" name="IANTNAME" id="IANTNAME" value="${pd.IANTNAME}" maxlength="255" placeholder="这里输入被保险人姓名" title="被保险人姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">被保险人身份证号:</td>
								<td><input type="text" name="IANTPAPERNO" id="IANTPAPERNO" value="${pd.IANTPAPERNO}" maxlength="255" placeholder="这里输入被保险人身份证号" title="被保险人身份证号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">被保险人手机号:</td>
								<td><input type="text" name="IANTPHONE" id="IANTPHONE" value="${pd.IANTPHONE}" maxlength="255" placeholder="这里输入被保险人手机号" title="被保险人手机号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">密码:</td>
								<td><input type="text" name="PASSWORD" id="PASSWORD" value="${pd.PASSWORD}" maxlength="255" placeholder="这里输入密码" title="密码" style="width:98%;"/></td>
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
			if($("#CARDID").val()==""){
				$("#CARDID").tips({
					side:3,
		            msg:'请输入服务卡号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CARDID").focus();
			return false;
			}
			if($("#STATE").val()==""){
				$("#STATE").tips({
					side:3,
		            msg:'请输入卡的状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STATE").focus();
			return false;
			}
			if($("#TYPEID").val()==""){
				$("#TYPEID").tips({
					side:3,
		            msg:'请输入卡类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPEID").focus();
			return false;
			}
			if($("#EXPIRYTIME").val()==""){
				$("#EXPIRYTIME").tips({
					side:3,
		            msg:'请输入有效日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXPIRYTIME").focus();
			return false;
			}
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
		            msg:'请输入被保险人身份证号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IANTPAPERNO").focus();
			return false;
			}
			if($("#IANTPHONE").val()==""){
				$("#IANTPHONE").tips({
					side:3,
		            msg:'请输入被保险人手机号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IANTPHONE").focus();
			return false;
			}
			if($("#PASSWORD").val()==""){
				$("#PASSWORD").tips({
					side:3,
		            msg:'请输入密码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PASSWORD").focus();
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