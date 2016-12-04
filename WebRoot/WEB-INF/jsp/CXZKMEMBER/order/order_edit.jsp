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
					
					<form action="order/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ORDER_ID" id="ORDER_ID" value="${pd.ORDER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单日期:</td>
								<td><input class="span10 date-picker" type="text" name="OFA_DATE" id="OFA_DATE" value="${pd.OFA_DATE}" data-date-format="yyyy-mm-dd" readonly="readonly" maxlength="255" placeholder="这里输入订单日期" title="订单日期" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单编号:</td>
								<td><input type="text" name="OFA_CODE" id="OFA_CODE" value="${pd.OFA_CODE}" maxlength="255" placeholder="这里输入订单编号" title="订单编号" style="width:98%;"/></td>	
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单类型:</td>
								<td><input type="text" name="OFT_TYPE_ID" id="OFT_TYPE_ID" value="${pd.OFT_TYPE_ID}" maxlength="255" placeholder="这里输入订单类型" title="订单类型" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">客户:</td>
								<td><input type="text" name="OFA_CUSTOMER_ID" id="OFA_CUSTOMER_ID" value="${pd.OFA_CUSTOMER_ID}" maxlength="255" placeholder="这里输入客户" title="客户" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">缴费人:</td>
								<td><input type="text" name="MONEY_COUSOMER_ID" id="MONEY_COUSOMER_ID" value="${pd.MONEY_COUSOMER_ID}" maxlength="255" placeholder="这里输入缴费人" title="缴费人" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">成交产品:</td>
								<td><input type="text" name="OFA_ITEM_ID" id="OFA_ITEM_ID" value="${pd.OFA_ITEM_ID}" maxlength="255" placeholder="这里输入成交产品" title="成交产品" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right ;padding-top: 13px;">产品价格:</td>
								<td><input type="text" name="ITEM_PRICE" id="ITEM_PRICE" value="${pd.ITEM_PRICE}" maxlength="255" placeholder="这里输入产品价格" title="产品价格" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">折扣率:</td>
								<td><input type="text" name="FOR_SALE_RATE" id="FOR_SALE_RATE" value="${pd.FOR_SALE_RATE}" maxlength="255" placeholder="这里输入折扣率" title="折扣率" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成交数量:</td>
								<td><input type="text" name="OFA_QUANTITY" id="OFA_QUANTITY" value="${pd.OFA_QUANTITY}" maxlength="255" placeholder="这里输入成交数量" title="成交数量" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">成交单价(元):</td>
								<td><input type="text" name="OFA_PRICE" id="OFA_PRICE" value="${pd.OFA_PRICE}" maxlength="255" placeholder="这里输入成交单价(元)" title="成交单价(元)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成交金额:</td>
								<td><input type="text" name="OFA_SUM_AMOUNT" id="OFA_SUM_AMOUNT" value="${pd.OFA_SUM_AMOUNT}" maxlength="255" placeholder="这里输入成交金额" title="成交金额" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">到期时间:</td>
								<td><input type="text" name="LAST_UPDATED_DATE" id="LAST_UPDATED_DATE" value="${pd.LAST_UPDATED_DATE}" maxlength="255" placeholder="这里输入最后更新时间" title="最后更新时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">缴款日期:</td>
								<td><input type="text" name="REAL_DATE" id="REAL_DATE" value="${pd.REAL_DATE}" maxlength="255" placeholder="这里输入缴款日期" title="缴款日期" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">缴款金额:</td>
								<td><input type="text" name="OFA_AMOUNT" id="OFA_AMOUNT" value="${pd.OFA_AMOUNT}" maxlength="255" placeholder="这里输入缴款金额" title="缴款金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">有效期:</td>
								<td><input type="text" name="OFA_USE_PERIOD" id="OFA_USE_PERIOD" value="${pd.OFA_USE_PERIOD}" maxlength="255" placeholder="这里输入有效期" title="有效期" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">状态:</td>
								<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="255" placeholder="这里输入状态" title="状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input type="text" name="CREATION_DATE" id="CREATION_DATE" value="${pd.CREATION_DATE}" maxlength="255" placeholder="这里输入创建时间" title="创建时间" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建人:</td>
								<td><input type="text" name="CREATED_BY" id="CREATED_BY" value="${pd.CREATED_BY}" maxlength="255" placeholder="这里输入创建人" title="创建人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">缴款方式:</td>
								<td><input type="text" name="REAL_TYPE" id="REAL_TYPE" value="${pd.REAL_TYPE}" maxlength="255" placeholder="这里输入缴款方式" title="缴款方式" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">票据号:</td>
								<td><input type="text" name="OFA_POS" id="OFA_POS" value="${pd.OFA_POS}" maxlength="255" placeholder="这里输入票据号" title="票据号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td colspan="3"><textarea rows="4" style="width: 95%;overflow: auto;" id="NOTE" name="NOTE" >${pd.NOTE}</textarea></td>
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
			if($("#OFA_DATE").val()==""){
				$("#OFA_DATE").tips({
					side:3,
		            msg:'请输入订单日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OFA_DATE").focus();
			return false;
			}
			if($("#OFA_CODE").val()==""){
				$("#OFA_CODE").tips({
					side:3,
		            msg:'请输入订单编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OFA_CODE").focus();
			return false;
			}
			if($("#TRX_ORGANIZATION_ID").val()==""){
				$("#TRX_ORGANIZATION_ID").tips({
					side:3,
		            msg:'请输入组织id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TRX_ORGANIZATION_ID").focus();
			return false;
			}
			if($("#FIN_ORGANIZATION_ID").val()==""){
				$("#FIN_ORGANIZATION_ID").tips({
					side:3,
		            msg:'请输入公司id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FIN_ORGANIZATION_ID").focus();
			return false;
			}
			if($("#OFT_TYPE_ID").val()==""){
				$("#OFT_TYPE_ID").tips({
					side:3,
		            msg:'请输入订单类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OFT_TYPE_ID").focus();
			return false;
			}
			if($("#OFA_CUSTOMER_ID").val()==""){
				$("#OFA_CUSTOMER_ID").tips({
					side:3,
		            msg:'请输入客户',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OFA_CUSTOMER_ID").focus();
			return false;
			}
			if($("#MONEY_COUSOMER_ID").val()==""){
				$("#MONEY_COUSOMER_ID").tips({
					side:3,
		            msg:'请输入缴费人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MONEY_COUSOMER_ID").focus();
			return false;
			}
			if($("#OFA_ITEM_ID").val()==""){
				$("#OFA_ITEM_ID").tips({
					side:3,
		            msg:'请输入成交产品',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OFA_ITEM_ID").focus();
			return false;
			}
			if($("#ITEM_PRICE").val()==""){
				$("#ITEM_PRICE").tips({
					side:3,
		            msg:'请输入产品价格',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ITEM_PRICE").focus();
			return false;
			}
			if($("#FOR_SALE_RATE").val()==""){
				$("#FOR_SALE_RATE").tips({
					side:3,
		            msg:'请输入折扣率',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FOR_SALE_RATE").focus();
			return false;
			}
			if($("#OFA_QUANTITY").val()==""){
				$("#OFA_QUANTITY").tips({
					side:3,
		            msg:'请输入成交数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OFA_QUANTITY").focus();
			return false;
			}
			if($("#OFA_PRICE").val()==""){
				$("#OFA_PRICE").tips({
					side:3,
		            msg:'请输入成交单价(元)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OFA_PRICE").focus();
			return false;
			}
			if($("#OFA_SUM_AMOUNT").val()==""){
				$("#OFA_SUM_AMOUNT").tips({
					side:3,
		            msg:'请输入成交金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OFA_SUM_AMOUNT").focus();
			return false;
			}
			if($("#REAL_TYPE").val()==""){
				$("#REAL_TYPE").tips({
					side:3,
		            msg:'请输入缴款方式',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REAL_TYPE").focus();
			return false;
			}
			if($("#REAL_DATE").val()==""){
				$("#REAL_DATE").tips({
					side:3,
		            msg:'请输入缴款日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REAL_DATE").focus();
			return false;
			}
			if($("#OFA_AMOUNT").val()==""){
				$("#OFA_AMOUNT").tips({
					side:3,
		            msg:'请输入缴款金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OFA_AMOUNT").focus();
			return false;
			}
			if($("#OFA_USE_PERIOD").val()==""){
				$("#OFA_USE_PERIOD").tips({
					side:3,
		            msg:'请输入有效期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OFA_USE_PERIOD").focus();
			return false;
			}
			if($("#STATUS").val()==""){
				$("#STATUS").tips({
					side:3,
		            msg:'请输入状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STATUS").focus();
			return false;
			}
			if($("#NOTE").val()==""){
				$("#NOTE").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NOTE").focus();
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
			if($("#LAST_UPDATED_DATE").val()==""){
				$("#LAST_UPDATED_DATE").tips({
					side:3,
		            msg:'请输入最后更新时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LAST_UPDATED_DATE").focus();
			return false;
			}
			if($("#LAST_UPDATED_BY").val()==""){
				$("#LAST_UPDATED_BY").tips({
					side:3,
		            msg:'请输入最后更新人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LAST_UPDATED_BY").focus();
			return false;
			}
			if($("#TK_DATE").val()==""){
				$("#TK_DATE").tips({
					side:3,
		            msg:'请输入退款日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TK_DATE").focus();
			return false;
			}
			if($("#ISDELETE").val()==""){
				$("#ISDELETE").tips({
					side:3,
		            msg:'请输入是否删除',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ISDELETE").focus();
			return false;
			}
			if($("#OFA_POS").val()==""){
				$("#OFA_POS").tips({
					side:3,
		            msg:'请输入票据号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OFA_POS").focus();
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