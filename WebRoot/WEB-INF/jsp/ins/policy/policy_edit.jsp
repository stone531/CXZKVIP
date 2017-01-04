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
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
	
	
	<!-- 投保页面头 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
    <!--diy css-->
	
	
</head>
<body class="no-skin">
    
    <!-- middle -->
        <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="col-md-2"></div>
            <div class="col-md-7">
			
			<!--替换form表单-->
 				<form action="policy/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="POLICY_ID" id="POLICY_ID" value="${pd.POLICY_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">保单号:</td>
								<td><input type="text" name="POLICYNO" id="POLICYNO" value="${pd.POLICYNO}" maxlength="255" placeholder="这里输入保单号" title="保单号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">服务卡号:</td>
								<td><input type="text" name="CARDNO" id="CARDNO" value="${pd.CARDNO}" maxlength="255" placeholder="这里输入服务卡号" title="服务卡号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">服务卡类型:</td>
								<td><input type="number" name="CARDTYPE" id="CARDTYPE" value="${pd.CARDTYPE}" maxlength="32" placeholder="这里输入服务卡类型" title="服务卡类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">投保人姓名:</td>
								<td><input type="text" name="IERNAME" id="IERNAME" value="${pd.IERNAME}" maxlength="255" placeholder="这里输入投保人姓名" title="投保人姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">投保人证件类型:</td>
								<td><input type="number" name="IERPAPERTYPE" id="IERPAPERTYPE" value="${pd.IERPAPERTYPE}" maxlength="32" placeholder="这里输入投保人证件类型" title="投保人证件类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">投保人证件号码:</td>
								<td><input type="text" name="IERPAPERNO" id="IERPAPERNO" value="${pd.IERPAPERNO}" maxlength="255" placeholder="这里输入投保人证件号码" title="投保人证件号码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">投保人手机号:</td>
								<td><input type="text" name="IERPHONE" id="IERPHONE" value="${pd.IERPHONE}" maxlength="255" placeholder="这里输入投保人手机号" title="投保人手机号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">被保险人姓名:</td>
								<td><input type="text" name="IANTNAME" id="IANTNAME" value="${pd.IANTNAME}" maxlength="255" placeholder="这里输入被保险人姓名" title="被保险人姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">被保险人证件号码:</td>
								<td><input type="text" name="IANTPAPERNO" id="IANTPAPERNO" value="${pd.IANTPAPERNO}" maxlength="255" placeholder="这里输入被保险人证件号码" title="被保险人证件号码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">被保险人职业:</td>
								<td><input type="text" name="IANTPROFESSION" id="IANTPROFESSION" value="${pd.IANTPROFESSION}" maxlength="255" placeholder="这里输入被保险人职业" title="被保险人职业" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">与被保险人关系:</td>
								<td><input type="text" name="IANTRELATION" id="IANTRELATION" value="${pd.IANTRELATION}" maxlength="255" placeholder="这里输入与被保险人关系" title="与被保险人关系" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">被保险人年龄:</td>
								<td><input type="number" name="IANAGE" id="IANAGE" value="${pd.IANAGE}" maxlength="32" placeholder="这里输入被保险人年龄" title="被保险人年龄" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">受益人姓名:</td>
								<td><input type="text" name="BENNAME" id="BENNAME" value="${pd.BENNAME}" maxlength="255" placeholder="这里输入受益人姓名" title="受益人姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">受益人证件号码:</td>
								<td><input type="text" name="BENPAPERNO" id="BENPAPERNO" value="${pd.BENPAPERNO}" maxlength="255" placeholder="这里输入受益人证件号码" title="受益人证件号码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">服务人员姓名:</td>
								<td><input type="text" name="SVRNAME" id="SVRNAME" value="${pd.SVRNAME}" maxlength="255" placeholder="这里输入服务人员姓名" title="服务人员姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">服务人员手机号码:</td>
								<td><input type="text" name="SVRPHONE" id="SVRPHONE" value="${pd.SVRPHONE}" maxlength="255" placeholder="这里输入服务人员手机号码" title="服务人员手机号码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否发生短信:</td>
								<td><input type="text" name="ISSENDMESSAGE" id="ISSENDMESSAGE" value="${pd.ISSENDMESSAGE}" maxlength="255" placeholder="这里输入是否发生短信" title="是否发生短信" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否已经生成保单号:</td>
								<td><input type="text" name="ISHASPOLICYNO" id="ISHASPOLICYNO" value="${pd.ISHASPOLICYNO}" maxlength="255" placeholder="这里输入是否已经生成保单号" title="是否已经生成保单号" style="width:98%;"/></td>
							</tr>
							<!--  
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">投保时间:</td>
								<td><input class="span10 date-picker" name="CREATED" id="CREATED" value="${pd.CREATED}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="投保时间" title="投保时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">保单生效时间:</td>
								<td><input class="span10 date-picker" name="UPDATED" id="UPDATED" value="${pd.UPDATED}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="保单生效时间" title="保单生效时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">保单时效时间:</td>
								<td><input class="span10 date-picker" name="INVALID" id="INVALID" value="${pd.INVALID}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="保单时效时间" title="保单时效时间" style="width:98%;"/></td>
							</tr>
							-->
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
 
            </div>
            <div class="col-md-3"></div>
          </div>
        </div>
      </div>
    
     
    </div>



<!-- /.main-container -->

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
			if($("#CARDNO").val()==""){
				$("#CARDNO").tips({
					side:3,
		            msg:'请输入服务卡号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CARDNO").focus();
			return false;
			}
			if($("#CARDTYPE").val()==""){
				$("#CARDTYPE").tips({
					side:3,
		            msg:'请输入服务卡类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CARDTYPE").focus();
			return false;
			}
			if($("#IERNAME").val()==""){
				$("#IERNAME").tips({
					side:3,
		            msg:'请输入投保人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IERNAME").focus();
			return false;
			}
			if($("#IERPAPERTYPE").val()==""){
				$("#IERPAPERTYPE").tips({
					side:3,
		            msg:'请输入投保人证件类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IERPAPERTYPE").focus();
			return false;
			}
			if($("#IERPAPERNO").val()==""){
				$("#IERPAPERNO").tips({
					side:3,
		            msg:'请输入投保人证件号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IERPAPERNO").focus();
			return false;
			}
			if($("#IERPHONE").val()==""){
				$("#IERPHONE").tips({
					side:3,
		            msg:'请输入投保人手机号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IERPHONE").focus();
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
		            msg:'请输入被保险人证件号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IANTPAPERNO").focus();
			return false;
			}
			if($("#IANTPROFESSION").val()==""){
				$("#IANTPROFESSION").tips({
					side:3,
		            msg:'请输入被保险人职业',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IANTPROFESSION").focus();
			return false;
			}
			if($("#IANTRELATION").val()==""){
				$("#IANTRELATION").tips({
					side:3,
		            msg:'请输入与被保险人关系',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IANTRELATION").focus();
			return false;
			}
			if($("#IANAGE").val()==""){
				$("#IANAGE").tips({
					side:3,
		            msg:'请输入被保险人年龄',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IANAGE").focus();
			return false;
			}
			if($("#BENNAME").val()==""){
				$("#BENNAME").tips({
					side:3,
		            msg:'请输入受益人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BENNAME").focus();
			return false;
			}
			if($("#BENPAPERNO").val()==""){
				$("#BENPAPERNO").tips({
					side:3,
		            msg:'请输入受益人证件号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BENPAPERNO").focus();
			return false;
			}
			if($("#SVRNAME").val()==""){
				$("#SVRNAME").tips({
					side:3,
		            msg:'请输入服务人员姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SVRNAME").focus();
			return false;
			}
			if($("#SVRPHONE").val()==""){
				$("#SVRPHONE").tips({
					side:3,
		            msg:'请输入服务人员手机号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SVRPHONE").focus();
			return false;
			}
			if($("#ISSENDMESSAGE").val()==""){
				$("#ISSENDMESSAGE").tips({
					side:3,
		            msg:'请输入是否发生短信',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ISSENDMESSAGE").focus();
			return false;
			}
			if($("#ISHASPOLICYNO").val()==""){
				$("#ISHASPOLICYNO").tips({
					side:3,
		            msg:'请输入是否已经生成保单号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ISHASPOLICYNO").focus();
			return false;
			}
			/*
			if($("#CREATED").val()==""){
				$("#CREATED").tips({
					side:3,
		            msg:'请输入投保时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATED").focus();
			return false;
			}
			if($("#UPDATED").val()==""){
				$("#UPDATED").tips({
					side:3,
		            msg:'请输入保单生效时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UPDATED").focus();
			return false;
			}
			if($("#INVALID").val()==""){
				$("#INVALID").tips({
					side:3,
		            msg:'请输入保单时效时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INVALID").focus();
			return false;
			}
			*/
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