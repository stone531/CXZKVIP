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
					
					<form action="relation/${msg}.do" name="Form" id="Form" method="post">
						<input type="hidden" name="RELATION_ID" id="RELATION_ID" value="${pd.RELATION_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">卡类型:</td>
								<td>
								<!--  input type="text" name="CARDTYPE" id="CARDTYPE" value="${pd.CARDTYPE}" maxlength="100" placeholder="这里输入卡类型" title="卡类型" style="width:98%;"/ -->
								<select id="CARDTYPE" name="CARDTYPE" title="卡类型" style="width:98%;" >																				
										<c:choose>
								            <c:when test="${not empty varListC}">
								            	<c:forEach items="${varListC}" var="var" varStatus="vs">
								            	<option value="${var.CARDTYPE_ID}">${var.NAME}</option>						
								            	</c:forEach>
								            </c:when>
								            <c:otherwise>
										        <option value="尚未录入">尚未录入</option>                                         
								            </c:otherwise>
										</c:choose>
                                    </select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">保险类型:</td>
								<td>
								<!--  input type="text" name="BUSINESSID" id="BUSINESSID" value="${pd.BUSINESSID}" maxlength="100" placeholder="这里输入业务id" title="业务id" style="width:98%;"/ -->
									<select id="BUSINESSID" name="BUSINESSID" title="险种" style="width:98%;" >																				
										<c:choose>
								            <c:when test="${not empty varListB}">
								            	<c:forEach items="${varListB}" var="var" varStatus="vs">
								            	<option value="${var.BUSINESS_ID}">${var.NAME}</option>						
								            	</c:forEach>
								            </c:when>
								            <c:otherwise>
										        <option value="尚未录入">尚未录入</option>                                         
								            </c:otherwise>
										</c:choose>
                                    </select>
								</td>
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
			if($("#CARDTYPE").val()==""){
				$("#CARDTYPE").tips({
					side:3,
		            msg:'请输入卡类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CARDTYPE").focus();
			return false;
			}
			if($("#BUSINESSID").val()==""){
				$("#BUSINESSID").tips({
					side:3,
		            msg:'请输入业务id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BUSINESSID").focus();
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