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
					
					<form action="usermanage/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="USERMANAGE_ID" id="USERMANAGE_ID" value="${pd.USERMANAGE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户名:</td>
								<td><input type="text" name="MOBILE" id="MOBILE" value="${pd.MOBILE}" maxlength="32" placeholder="这里输入username" title="username" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">密码:</td>
								<td><input type="text" name="PASSWORD" id="PASSWORD" value="${pd.PASSWORD}" maxlength="64" placeholder="这里输入密码" title="密码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">积分:</td>
								<td><input type="number" name="SCORE" id="SCORE" value="${pd.SCORE}" maxlength="32" placeholder="这里输入积分" title="积分" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户类型:</td>
								<td><input type="number" name="USERTYPE" id="USERTYPE" value="${pd.USERTYPE}" maxlength="32" placeholder="这里输入用户类型" title="用户类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">昵称:</td>
								<td><input type="text" name="NICKNAME" id="NICKNAME" value="${pd.NICKNAME}" maxlength="255" placeholder="这里输入昵称" title="昵称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">邮箱:</td>
								<td><input type="text" name="EMAIL" id="EMAIL" value="${pd.EMAIL}" maxlength="128" placeholder="这里输入邮箱" title="邮箱" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">身份证信息:</td>
								<td><input type="text" name="CARDID" id="CARDID" value="${pd.CARDID}" maxlength="255" placeholder="这里输入身份证信息" title="身份证信息" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">银行卡:</td>
								<td><input type="text" name="BANKCARD" id="BANKCARD" value="${pd.BANKCARD}" maxlength="255" placeholder="这里输入银行卡" title="银行卡" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">微信号:</td>
								<td><input type="text" name="WECHAT" id="WECHAT" value="${pd.WECHAT}" maxlength="255" placeholder="这里输入微信号" title="微信号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">微信号二维码:</td>
								<td><input type="text" name="PICWECHAT" id="PICWECHAT" value="${pd.PICWECHAT}" maxlength="255" placeholder="这里输入微信号二维码" title="微信号二维码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公司名:</td>
								<td><input type="text" name="COMPNAME" id="COMPNAME" value="${pd.COMPNAME}" maxlength="255" placeholder="这里输入公司名" title="公司名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公司执照号码:</td>
								<td><input type="text" name="COMPNUM" id="COMPNUM" value="${pd.COMPNUM}" maxlength="255" placeholder="这里输入公司执照号码" title="公司执照号码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公司地址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="255" placeholder="这里输入公司地址" title="公司地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">电话号码:</td>
								<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="255" placeholder="这里输入电话号码" title="电话号码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">最后登录时间:</td>
								<td><input class="span10 date-picker" name="LASTLOGINTIME" id="LASTLOGINTIME" value="${pd.LASTLOGINTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="最后登录时间" title="最后登录时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input class="span10 date-picker" name="CREATETIME" id="CREATETIME" value="${pd.CREATETIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建时间" title="创建时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">更新时间:</td>
								<td><input class="span10 date-picker" name="UPDATETIME" id="UPDATETIME" value="${pd.UPDATETIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="更新时间" title="更新时间" style="width:98%;"/></td>
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
		//$(top.hangge());
		//保存
		function save(){
			/*if($("#MOBILE").val()==""){
				$("#MOBILE").tips({
					side:3,
		            msg:'请输入username',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MOBILE").focus();
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
			if($("#SCORE").val()==""){
				$("#SCORE").tips({
					side:3,
		            msg:'请输入积分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCORE").focus();
			return false;
			}
			if($("#USERTYPE").val()==""){
				$("#USERTYPE").tips({
					side:3,
		            msg:'请输入用户类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERTYPE").focus();
			return false;
			}
			if($("#NICKNAME").val()==""){
				$("#NICKNAME").tips({
					side:3,
		            msg:'请输入昵称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NICKNAME").focus();
			return false;
			}
			if($("#EMAIL").val()==""){
				$("#EMAIL").tips({
					side:3,
		            msg:'请输入邮箱',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EMAIL").focus();
			return false;
			}
			if($("#CARDID").val()==""){
				$("#CARDID").tips({
					side:3,
		            msg:'请输入身份证信息',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CARDID").focus();
			return false;
			}
			if($("#BANKCARD").val()==""){
				$("#BANKCARD").tips({
					side:3,
		            msg:'请输入银行卡',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BANKCARD").focus();
			return false;
			}
			if($("#WECHAT").val()==""){
				$("#WECHAT").tips({
					side:3,
		            msg:'请输入微信号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WECHAT").focus();
			return false;
			}
			if($("#PICWECHAT").val()==""){
				$("#PICWECHAT").tips({
					side:3,
		            msg:'请输入微信号二维码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PICWECHAT").focus();
			return false;
			}
			if($("#COMPNAME").val()==""){
				$("#COMPNAME").tips({
					side:3,
		            msg:'请输入公司名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMPNAME").focus();
			return false;
			}
			if($("#COMPNUM").val()==""){
				$("#COMPNUM").tips({
					side:3,
		            msg:'请输入公司执照号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMPNUM").focus();
			return false;
			}
			if($("#ADDRESS").val()==""){
				$("#ADDRESS").tips({
					side:3,
		            msg:'请输入公司地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDRESS").focus();
			return false;
			}
			if($("#PHONE").val()==""){
				$("#PHONE").tips({
					side:3,
		            msg:'请输入电话号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE").focus();
			return false;
			}
			if($("#REMARK").val()==""){
				$("#REMARK").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMARK").focus();
			return false;
			}
			if($("#LASTLOGINTIME").val()==""){
				$("#LASTLOGINTIME").tips({
					side:3,
		            msg:'请输入最后登录时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LASTLOGINTIME").focus();
			return false;
			}
			if($("#CREATETIME").val()==""){
				$("#CREATETIME").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATETIME").focus();
			return false;
			}
			if($("#UPDATETIME").val()==""){
				$("#UPDATETIME").tips({
					side:3,
		            msg:'请输入更新时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UPDATETIME").focus();
			return false;
			}*/
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