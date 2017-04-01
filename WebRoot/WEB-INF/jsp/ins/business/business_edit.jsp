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
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
	<link href="static/news/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="static/news/third-party/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="static/news/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="static/news/umeditor.js"></script>
    <script type="text/javascript" src="static/news/lang/zh-cn/zh-cn.js"></script>
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
					
					<form action="business/${msg}.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="BUSINESS_ID" id="BUSINESS_ID" value="${pd.BUSINESS_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">具体业务名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="100" placeholder="这里输入具体业务名称" title="具体业务名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">业务所属公司:</td>
								<td>
								<select id="COMPANYID" name="COMPANYID" title="业务所属公司" style="width:98%;" >																				
										<c:choose>
								            <c:when test="${not empty varListComp}">
								            	<c:forEach items="${varListComp}" var="var" varStatus="vs">
								            	<option value="${var.COMPANY_ID}">${var.COMPNAME}</option>						
								            	</c:forEach>
								            </c:when>
								            <c:otherwise>
										        <option value="卡类型名">卡类型</option>                                         
								            </c:otherwise>
										</c:choose>
                                    </select>
								</td>							
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">业务状态:</td>
								<td>
								<select class="form-control"  id="STATE" name="STATE" title="业务状态">
									  <option value=1>启用</option>
                                      <option value=0>禁用</option>
                          		   </select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">可用职业类别:</td>
								<td><input type="text" name="PROFESSION_LIMIT" id="PROFESSION_LIMIT" value="${pd.PROFESSION_LIMIT}" maxlength="100" placeholder="这里添加或者删除可投的职业类别(多个类别之间分割分号)" title="具体业务名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">保险条款:</td>
								<td><input type="file" name="CLAIMTEXT" id="CLAIMTEXT" accept=".pdf" placeholder="请导入保险条款" /></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">服务条款:</td>
								 <input type="text" name="SERVERTEXT" id="SERVERTEXT" style="display:none;"/>
								 <script type="text/plain" id="myEditor" style="width:90%;height:30%;">${pd.SERVERTEXT}</script>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="CONTEXT" id="CONTEXT" value="${pd.CONTEXT}" maxlength="255" placeholder="这里输入具体内容" title="具体内容" style="width:98%;"/></td>
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
		var um = UM.getEditor('myEditor');
		 
		function save(){
		
		$("#SERVERTEXT").val(UM.getEditor('myEditor').getContent());
		
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入具体业务名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#COMPANYID").val()==""){
				$("#COMPANYID").tips({
					side:3,
		            msg:'请输入业务所属公司',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMPANYID").focus();
			return false;
			}
			if($("#STATE").val()==""){
				$("#STATE").tips({
					side:3,
		            msg:'请输入业务状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STATE").focus();
			return false;
			}
			if($("#PROFESSION_LIMIT").val()==""){
				$("#PROFESSION_LIMIT").tips({
					side:3,
		            msg:'请输入可用职业列表',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROFESSION_LIMIT").focus();
			return false;
			}
			if($("#CLAIMTEXT").val()==""){
				$("#CLAIMTEXT").tips({
					side:3,
		            msg:'请导入保险条款',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLAIMTEXT").focus();
			return false;
			}
			if($("#SERVERTEXT").val()==""){
				$("#SERVERTEXT").tips({
					side:3,
		            msg:'请输入条款内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SERVERTEXT").focus();
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