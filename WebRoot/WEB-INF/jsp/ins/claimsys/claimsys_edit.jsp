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
					
					<form action="claimsys/${msg }.do" name="Form" id="Form" method="post">
						<!-- 日期框 -->
						<link rel="stylesheet" href="static/ace/css/datepicker.css" />
						<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
						<input type="hidden" name="CLAIMSYS_ID" id="CLAIMSYS_ID" value="${pd.CLAIMSYS_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">保单号:</td>
								<td><input type="text" name="POLICYNO" id="POLICYNO" value="${pd.POLICYNO}" maxlength="255" readonly="readonly" placeholder="这里输入保单号" title="保单号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">报案人:</td>
								<td><input type="text" name="INFORNAME" id="INFORNAME" value="${pd.INFORNAME}" maxlength="255" readonly="readonly" placeholder="这里输入报案人" title="报案人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">与被保人关系:</td>
								<td><input type="text" name="RELATION" id="RELATION" value="${pd.RELATION}" maxlength="255" readonly="readonly" placeholder="这里输入与被保人关系" title="与被保人关系" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">电子邮箱:</td>
								<td><input type="text" name="EMAIL" id="EMAIL" value="${pd.EMAIL}" maxlength="255" readonly="readonly" placeholder="这里输入电子邮箱" title="电子邮箱" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">报险人电话:</td>
								<td><input type="text" name="CLAIMERTEL" id="CLAIMERTEL" value="${pd.CLAIMERTEL}" maxlength="255" readonly="readonly" placeholder="这里输入报险人电话" title="报险人电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">出险时间:</td>
								<td><input type="text" name="OCCURTIME" id="OCCURTIME" value="${pd.OCCURTIME}" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="出险时间" title="出险时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">出险地点:</td>
								<td><input type="text" name="OCCURPLACE" id="OCCURPLACE" value="${pd.OCCURPLACE}" maxlength="255" readonly="readonly" placeholder="这里输入出险地点" title="出险地点" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">出险人:</td>
								<td><input type="text" name="POLICYNAME" id="POLICYNAME" value="${pd.POLICYNAME}" maxlength="255" readonly="readonly" placeholder="这里输入出险人" title="出险人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">出险人电话:</td>
								<td><input type="text" name="POLICERTEL" id="POLICERTEL" value="${pd.POLICERTEL}" maxlength="255" readonly="readonly" placeholder="这里输入出险人电话" title="出险人电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">出险经过:</td>
								<td><input type="text" name="POLICEACCIDENT" id="POLICEACCIDENT" value="${pd.POLICEACCIDENT}" maxlength="255" readonly="readonly" placeholder="这里输入出险经过" title="出险经过" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">理赔状态:</td>
								<td>
									<select id="CLAIMSSTATES" name="CLAIMSSTATES" title="理赔状态" style="width:98%;" >																				
										<c:choose>
								            <c:when test="${not empty varList}">
								            	<c:forEach items="${varList}" var="var" varStatus="vs">
								            	<option value="${var.CLAIM_INDEX}">${var.STATE_CONTENT}</option>						
								            	</c:forEach>
								            </c:when>
								            <c:otherwise>
										        <option value="0">报险</option>
                                                <option value="1">预审</option>
                                                <option value="2">待邮寄资料</option>
                                                <option value="3">收到资料</option>
                                                <option value="4">保险公司处理中</option>
                                                <option value="5">理赔完毕</option>                                           
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
		//if(${pd.CLAIMSSTATES} >=0 ){
		//	document.getElementById("CLAIMSSTATES")[${pd.CLAIMSSTATES}].selected=true;
		// 	getSelStates();
		//}

		 
		$(top.hangge());
		function getSelStates(){
			var oListbox = document.getElementById("CLAIMSSTATES");
			var indx = oListbox.selectedIndex;
			if(indx == 0){   
        		//alert("列表中无元素可删除");   
        		return ;   
    		} 
    		for(var i= indx-1;i>=0;i--){  //倒着删除是因为   
            	oListbox.remove(i);   
        	}    
		}
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
			if($("#INFORNAME").val()==""){
				$("#INFORNAME").tips({
					side:3,
		            msg:'请输入报案人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INFORNAME").focus();
			return false;
			}
			if($("#RELATION").val()==""){
				$("#RELATION").tips({
					side:3,
		            msg:'请输入与被保人关系',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RELATION").focus();
			return false;
			}
			if($("#EMAIL").val()==""){
				$("#EMAIL").tips({
					side:3,
		            msg:'请输入电子邮箱',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EMAIL").focus();
			return false;
			}
			if($("#CLAIMERTEL").val()==""){
				$("#CLAIMERTEL").tips({
					side:3,
		            msg:'请输入报险人电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLAIMERTEL").focus();
			return false;
			}
			if($("#OCCURTIME").val()==""){
				$("#OCCURTIME").tips({
					side:3,
		            msg:'请输入出险时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OCCURTIME").focus();
			return false;
			}
			if($("#OCCURPLACE").val()==""){
				$("#OCCURPLACE").tips({
					side:3,
		            msg:'请输入出险地点',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OCCURPLACE").focus();
			return false;
			}
			if($("#POLICYNAME").val()==""){
				$("#POLICYNAME").tips({
					side:3,
		            msg:'请输入出险人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#POLICYNAME").focus();
			return false;
			}
			if($("#POLICERTEL").val()==""){
				$("#POLICERTEL").tips({
					side:3,
		            msg:'请输入出险人电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#POLICERTEL").focus();
			return false;
			}
			if($("#POLICEACCIDENT").val()==""){
				$("#POLICEACCIDENT").tips({
					side:3,
		            msg:'请输入出险经过',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#POLICEACCIDENT").focus();
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