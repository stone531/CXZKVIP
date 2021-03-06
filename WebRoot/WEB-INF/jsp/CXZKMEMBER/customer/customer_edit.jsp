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
					<form action="customer/${msg}.do" name="Form" id="Form" method="post">
						<input type="hidden" name="CUSTOMER_ID" id="CUSTOMER_ID" value="${pd.CUSTOMER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">会员编号:</td>
								<td><input type="text" name="CUSTOMER_CODE" id="CUSTOMER_CODE" value="${pd.CUSTOMER_CODE}" maxlength="255" placeholder="这里输入会员编号" title="会员编号" style="width:98%;"/></td>
								<td style="height:126px;">会员照片</td>
								<td><img alt="" src="${pd.imagesrc}"></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">会员姓名:</td>
								<td><input type="text" name="CUSTOMER_NAME" id="CUSTOMER_NAME" value="${pd.CUSTOMER_NAME}" maxlength="255" placeholder="这里输入会员姓名" title="会员姓名" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">会员别名:</td>
								<td><input type="text" name="CUS_ALAIS" id="CUS_ALAIS" value="${pd.CUS_ALAIS}" maxlength="255" placeholder="这里输入会员别名" title="会员别名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">会员类型:</td>
								<td><select name="CUS_TYPE" id="CUS_TYPE" style="width:200px">
									<c:forEach items="${level}" var="trade">
									<option value="${trade.NAME }" <c:if test="${trade.DICTIONARIES_ID == pd.EDUCATION_ID }">selected</c:if>>${trade.NAME }</option>
									</c:forEach>
								</select></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">会员民族:</td>
								<td><input type="text" name="CUS_nation" id="CUS_nation" value="${pd.CUS_nation}" maxlength="255" placeholder="这里输入会员民族" title="会员民族" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">请选择会员生日:</td>
								<td><input type="text" class="span10 date-picker" name="CUS_YEAR" id="CUS_YEAR" value="${pd.CUS_YEAR}" data-date-format="yyyy-mm-dd" readonly="readonly" maxlength="255" placeholder="这里选择会员生日" title="出生年月日" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">会员期号:</td>
								<td><input type="text" name="CUSTOMER_NUMBER" id="CUSTOMER_NUMBER" value="${pd.CUSTOMER_NUMBER}" maxlength="255" placeholder="这里输入会员期号" title="会员期号" style="width:98%;"/></td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">教育程度:</td>
								<td><select class="chzn-select" name="EDUCATION_ID" id="EDUCATION_ID" data-placeholder="请选择教育程度" style="vertical-align:top;width:200px;">
								<option value="">请选择</option>
								<c:forEach items="${jycd}" var="trade">
									<option value="${trade.DICTIONARIES_ID }" <c:if test="${trade.DICTIONARIES_ID == pd.EDUCATION_ID }">selected</c:if>>${trade.NAME }</option>
								</c:forEach>
								</select>
								</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">公司名称:</td>
								<td><input type="text" name="CUS_COMPANY" id="CUS_COMPANY" value="${pd.CUS_COMPANY}" maxlength="255" placeholder="这里输入公司名称" title="公司名称" style="width:98%;"/></td>
								
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公司简介:</td>
								<td><input type="text" name="CUS_INTRODUCTION" id="CUS_INTRODUCTION" value="${pd.CUS_INTRODUCTION}" maxlength="255" placeholder="这里输入公司简介" title="公司简介" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">证件号码:</td>
								<td><input type="text" name="CUS_ID_CARD" id="CUS_ID_CARD" value="${pd.CUS_ID_CARD}" maxlength="255" placeholder="这里输入证件号码" title="证件号码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">性别:</td>
								<td><input type="radio" value="男" name="CUS_SEX" id="CUS_SEX" checked="checked"/>男<input type="radio" name="CUS_SEX" id="CUS_SEX" title="性别" value="女" <c:if test="${pd.CUS_SEX == '女'}">checked</c:if> />女</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">电话:</td>
								<td><input type="text" name="CUS_MOBILE_TEL" id="CUS_MOBILE_TEL" value="${pd.CUS_MOBILE_TEL}" maxlength="255" placeholder="这里输入电话" title="电话" style="width:98%;"/></td>	
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">请选择省份:</td>
				<td><select class="chzn-select" name="CUS_PROVINCE_ID" id="CUS_PROVINCE_ID" onchange="show_cityInfo($(this).val())" data-placeholder="请选择省份" style="vertical-align:top;width:200px;" >
						<option value="">请选择</option>
						<c:forEach items="${Province}" var="trade">
							<option value="${trade.DICTIONARIES_ID }"  <c:if test="${trade.DICTIONARIES_ID == pd.CUS_PROVINCE_ID }">selected</c:if>>${trade.NAME }</option>
						</c:forEach>
						</select></td>
				<td style="width:70px;text-align: right;padding-top: 13px;">请选择市县:</td>
				<td><select id="CUS_CITY" name="CUS_CITY" style="width:200px;" >
						<c:forEach items="${CityList}" var="trade">
							<option value="${trade.DICTIONARIES_ID }"  <c:if test="${trade.DICTIONARIES_ID == pd.CUS_PROVINCE_ID }">selected</c:if>>${trade.NAME }</option>
						</c:forEach>
						</select></td>
							</tr>
							<tr>
						<td style="width:70px;text-align: right;padding-top: 13px;">请选择区:</td>
							<td><select id="CUS_COUNTY" name="CUS_COUNTY" style="width:200px">
							<c:forEach items="${COUNTYList}" var="trade">
							<option value="${trade.DICTIONARIES_ID }"  <c:if test="${trade.DICTIONARIES_ID == pd.CUS_PROVINCE_ID }">selected</c:if>>${trade.NAME }</option>
						</c:forEach>
							</select></td>								
							<td style="width:75px;text-align: right;padding-top: 13px;">办公地址:</td>
								<td><input type="text" name="CUS_BUSINESS_ADDRESS" id="CUS_BUSINESS_ADDRESS" value="${pd.CUS_BUSINESS_ADDRESS}" maxlength="255" placeholder="这里输入办公地址" title="办公地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">传真:</td>
								<td><input type="text" name="CUS_FAX" id="CUS_FAX" value="${pd.CUS_FAX}" maxlength="255" placeholder="这里输入传真" title="传真" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">网址:</td>
								<td><input type="text" name="CUS_WEB_SITE" id="CUS_WEB_SITE" value="${pd.CUS_WEB_SITE}" maxlength="255" placeholder="这里输入网址" title="网址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">职务:</td>
								<td><select class="chzn-select" name="CUS_DUTY" id="CUS_DUTY" data-placeholder="请选择职务" style="vertical-align:top;width:200px;">
								<option value="">请选择</option>
								<c:forEach items="${ZW}" var="trade">
									<option value="${trade.DICTIONARIES_ID }" <c:if test="${trade.DICTIONARIES_ID == pd.CUS_DUTY }">selected</c:if>>${trade.NAME }</option>
								</c:forEach>
								</select>
								</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">行业:</td>
								<td><select class="chzn-select" name="CUS_TRADE_ID" id="CUS_TRADE_ID" data-placeholder="请选择行业" style="vertical-align:top;width:200px;">
								<option value="">请选择</option>
								<c:forEach items="${hy}" var="trade">
									<option value="${trade.DICTIONARIES_ID }" <c:if test="${trade.DICTIONARIES_ID == pd.CUS_TRADE_ID }">selected</c:if>>${trade.NAME }</option>
								</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建人:</td>
								<td><input type="text" name="CREATED_BY" id="CREATED_BY"  value="${pd.CREATED_BY}" maxlength="255" placeholder="这里输入创建人" title="创建人" style="width:98%;"/></td>	
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input class="span10 date-picker" type="text" name="CREATION_DATE" id="CREATION_DATE" value="${pd.CREATION_DATE}" data-date-format="yyyy-mm-dd" readonly="readonly" maxlength="255" placeholder="这里输入创建时间" title="创建时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td  style="width:75px;text-align: right;padding-top: 13px;">会场电话:</td>
								<td><input type="text" name="CUS_HC_TEL" id="CUS_HC_TEL" value="${pd.CUS_HC_TEL}" maxlength="255" placeholder="这里输入会场电话" title="会场电话" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">会员积分:</td>
								<td><input type="text" name="CUS_JF" id="CUS_JF" value="${pd.CUS_JF}" maxlength="255" placeholder="这里输入会员积分" title="会员积分" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">家庭地址:</td>
								<td colspan="3"><input type="text" name="CUS_HOME_ADDRESS" id="CUS_HOME_ADDRESS" value="${pd.CUS_HOME_ADDRESS}" maxlength="255" placeholder="这里输入家庭地址" title="家庭地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								
								<td colspan="3"><textarea rows="4" style="width: 95%;overflow: auto;" id="CUS_NOTE" name="CUS_NOTE" >${pd.CUS_NOTE}</textarea></td>
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
			if($("#CUSTOMER_CODE").val()==""){
				$("#CUSTOMER_CODE").tips({
					side:3,
		            msg:'请输入客户编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUSTOMER_CODE").focus();
			return false;
			}
			if($("#CUSTOMER_NAME").val()==""){
				$("#CUSTOMER_NAME").tips({
					side:3,
		            msg:'请输入客户姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUSTOMER_NAME").focus();
			return false;
			}
			if($("#CUS_TYPE").val()==""){
				$("#CUS_TYPE").tips({
					side:3,
		            msg:'请输入客户类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_TYPE").focus();
			return false;
			}
			if($("#CUS_STATUS").val()==""){
				$("#CUS_STATUS").tips({
					side:3,
		            msg:'请输入状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_STATUS").focus();
			return false;
			}
			if($("#CUS_COMPANY").val()==""){
				$("#CUS_COMPANY").tips({
					side:3,
		            msg:'请输入公司名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_COMPANY").focus();
			return false;
			}
			if($("#CUSTOMER_NUMBER").val()==""){
				$("#CUSTOMER_NUMBER").tips({
					side:3,
		            msg:'请输入会员期号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUSTOMER_NUMBER").focus();
			return false;
			}
			
			if($("#CUS_DUTY").val()==""){
				$("#CUS_DUTY").tips({
					side:3,
		            msg:'请选择职务',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_DUTY").focus();
			return false;
			}
			if($("#CUS_TRADE_ID").val()==""){
				$("#CUS_TRADE_ID").tips({
					side:3,
		            msg:'请选择行业',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_TRADE_ID").focus();
			return false;
			}
			if($("#CUS_INTRODUCTION").val()==""){
				$("#CUS_INTRODUCTION").tips({
					side:3,
		            msg:'请输入公司简介',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_INTRODUCTION").focus();
			return false;
			}
			var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
			if($("#CUS_ID_CARD").val()==""){
				$("#CUS_ID_CARD").tips({
					side:3,
		            msg:'请输入证件号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_ID_CARD").focus();
			return false;
			}else if(!reg.test($("#CUS_ID_CARD").val())){
				$("#CUS_ID_CARD").tips({
					side:3,
		            msg:'身份证号不合法',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_ID_CARD").focus();
			return false;
			}
			if($("#CUS_SEX").val()==""){
				$("#CUS_SEX").tips({
					side:3,
		            msg:'请输入性别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_SEX").focus();
			return false;
			}
			if($("#CUS_COUNTRY_ID").val()==""){
				$("#CUS_COUNTRY_ID").tips({
					side:3,
		            msg:'请输入国家',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_COUNTRY_ID").focus();
			return false;
			}
			if($("#CUS_PROVINCE_ID").val()==""){
				$("#CUS_PROVINCE_ID").tips({
					side:3,
		            msg:'请输入省份',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_PROVINCE_ID").focus();
			return false;
			}
			if($("#CUS_CITY").val()==""){
				$("#CUS_CITY").tips({
					side:3,
		            msg:'请输入城市',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_CITY").focus();
			return false;
			}
			if($("#CUS_COUNTY").val()==""){
				$("#CUS_COUNTY").tips({
					side:3,
		            msg:'请输入区县',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_COUNTY").focus();
			return false;
			}
			if($("#CUS_BUSINESS_ADDRESS").val()==""){
				$("#CUS_BUSINESS_ADDRESS").tips({
					side:3,
		            msg:'请输入办公地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_BUSINESS_ADDRESS").focus();
			return false;
			}
			if($("#CUS_FAX").val()==""){
				$("#CUS_FAX").tips({
					side:3,
		            msg:'请输入传真',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_FAX").focus();
			return false;
			}
			if($("#CUS_WEB_SITE").val()==""){
				$("#CUS_WEB_SITE").tips({
					side:3,
		            msg:'请输入网址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_WEB_SITE").focus();
			return false;
			}
			var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
		if($("#CUS_MOBILE_TEL").val()==""){
			$("#CUS_MOBILE_TEL").tips({
				side:3,
	            msg:'请输入移动电话',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CUS_MOBILE_TEL").focus();
			return false;
		}else if($("#CUS_MOBILE_TEL").val().length != 11 && !myreg.test($("#PHONE").val())){
			$("#CUS_MOBILE_TEL").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#CUS_MOBILE_TEL").focus();
			return false;
		}
			if($("#CUS_HOME_ADDRESS").val()==""){
				$("#CUS_HOME_ADDRESS").tips({
					side:3,
		            msg:'请输入家庭地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_HOME_ADDRESS").focus();
			return false;
			}
			if($("#CUS_NOTE").val()==""){
				$("#CUS_NOTE").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUS_NOTE").focus();
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
			if($("#EDUCATION_ID").val()==""){
				$("#EDUCATION_ID").tips({
					side:3,
		            msg:'请选择教育程度',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EDUCATION_ID").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		function show_cityInfo(provinceId)  
		{
		    var ss = Math.random();  
		    $.ajax(  
		    {  
		        type : 'POST',  
		        url : 'customer/getCityByProvince.do',  
		        data : 'id=' + ss + '&provinceId=' + provinceId,  
		        success : function(msg)  
		        {  
		            // 清空表格  
		            $("#CUS_CITY").empty();  
		              
		            // 转换成json对象  
		            var data = JSON.parse(msg);  
		              
		            var option = "";  
		            option += "<option value=\"\">请选择...</option>"; 
		            // 循环组装下拉框选项  
		            $.each(data, function(k, v)  
		            {  
		                option += "<option value=\"" + v['cityId'] + "\">" + v['cityName'] + "</option>";  
		            });  
		              
		            if (provinceId == "" || provinceId == null || provinceId == undefined)  
		            {  
		                option += "<option value=\"\">请选择...</option>";  
		            }  
		            
		            $("#CUS_CITY").append(option);  
		            $("#CUS_CITY").change(function()  
		            {  
		                show_areaInfo($(this).val());  
		            });
		           $("#CUS_CITY").attr("value",'${pd.CUS_CITY}');
		            if('${pd.CUS_CITY}'!=''){
		            show_areaInfo('${pd.CUS_CITY}');
		            }
		            
		        },  
		        error : function(msg, textStatus, e)  
		        {  
		            alert("当前登录用户失效，请重新登录。");  
		            window.location = path + "/login.jsp";  
		        }  
		    });  
		}  
		function show_areaInfo(cityId)  
		{  
		    var ss = Math.random();
		    
		    $.ajax(  
		    {  
		        type : 'POST',  
		        url : 'customer/getAreaByCity.do',  
		        data : 'id=' + ss + '&cityId=' + cityId,  
		        success : function(msg)  
		        {  
		            // 清空表格  
		            $("#CUS_COUNTY").empty();  
		              
		            // 转换成json对象  
		            var data = JSON.parse(msg);  
		              
		            var option = "";  
		            option += "<option value=\"\">请选择...</option>"; 
		            // 循环组装下拉框选项  
		            $.each(data, function(k, v)  
		            {  
		                option += "<option value=\"" + v['areaId'] + "\">" + v['areaName'] + "</option>";  
		            });  
		              
		            if (cityId == "" || cityId == null || cityId == undefined)  
		            {  
		                option += "<option value=\"\">请选择...</option>";  
		            }  
		              
		            $("#CUS_COUNTY").append(option);  
		             $("#CUS_COUNTY").attr("value",'${pd.CUS_COUNTY}');
		        },  
		        error : function(msg, textStatus, e)  
		        {  
		            alert("当前登录用户失效，请重新登录。");  
		            window.location = path + "/login.jsp";  
		        }  
		    });  
		}  
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>