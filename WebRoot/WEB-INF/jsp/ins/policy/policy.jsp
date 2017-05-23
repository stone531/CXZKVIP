<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<script src="static/main/js/index.js"></script>
		<script type="text/javascript" src="static/js/jquery-1.7.2.js" ></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script src="static/worker/jquery.cxselect.js"></script>
		 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">		
		
		
		 <%@ include file="../../ht.jsp"%>

		 
	
	</head>
	<body>
	<%@ include file="../../head.jsp"%>
	
	
	
	<!-- 业务类型选择-->	
	<div id="business"  class="section middle"  style="padding-top:100px;padding-bottom:18%;">
      <div class="container">
        <div class="row">
          		<div>
          					<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
									
										     <div class="col-md-12" >
									            <div class="panel panel-default  text-center" id="${vs.index+1}" onclick="divclick(this);">
									              <div class="panel-heading">
									                <h6 class="panel-title text-left text-primary">${var.NAME}-${var.COMPANY}</h6>
									              </div>
									              <div class="panel-body">
									                <p class="text-success">${var.CONTEXT}</p>
									              </div>
									              <div class="hidden">
									                <input type="text"  id="businessid${vs.index+1}"  value="${var.BUSINESS_ID}">
									              </div>
									            </div>
									          </div>						
									</c:forEach>
								</c:when>
								<c:otherwise>

								</c:otherwise>
							</c:choose>
							</tbody>
							
						    <div class="section">
						      <div class="container">
						        <div class="row">
						          <div class="col-md-12">
						           <a onclick="bussinessnext();" class="active btn center-block btn-lg btn-success " style="width:50%;">下一步</a>
						          </div>
						        </div>
						      </div>
						    </div>								
									
									

          		</div>
           </div>
        </div>
      </div>	         		
          		
  
 <!-- 告知协议条款 -->						
<div id="NOTICETEXT" style="display: none;" class="middle">	
	 <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h3 class="text-center text-info">告知书</h3>
          </div>
        </div>
      </div>
    </div>		
    
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-md-2"></div>
                  <div class="col-md-8">
                    <div id="NOTICECONTENT" name="NOTICECONTENT" ></div>
                    <h5 class="text-center text-info">完全符合
                      <input type="checkbox" id="ACCEPTNOTICE" onclick="acceptNotice(this);">
                    </h5>
                  </div>
                  <div class="col-md-2"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <br/>
    <br/>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6 text-right">
            <a class="btn btn-success btn-lg" onclick="NOTICEprev();">上一步</a>
          </div>
          <div class="col-md-6">
            <a class="btn btn-success btn-lg" disabled="disabled" onclick="NOTICEnext();"
            id="noticetextNext">下一步</a>
          </div>
        </div>
      </div>
    </div>
</div>    	
  
  <!-- 投保信息清单 -->	        		
   <div id="PolicyInfo" class="middle" style="display: none;padding-top:4%;">
      <div class="section ">
        <div class="container">
          <div class="row">
            <div class="col-md-12" style="">   
              <div class="form-horizontal has-warning has-feedback" >
                <div class="col-sm-12 text-left" style="margin-top:1%;">
                  <label for="inputEmail3" class="col-sm-4 control-label hidden-md hidden-sm">投保人姓名:</label>
                  <div class="col-sm-6">
                    <input type="text" maxlength="255" id="iename" class="form-control"
                    placeholder="投保人姓名">
                   </div>
                </div>

                <div class="col-sm-12 text-left" style="margin-top:1%;">
                  <label for="inputEmail3" class="col-sm-4 control-label hidden-md hidden-sm">投保人身份证号:</label>
				  <div class="col-sm-6">
                    <input type="text" maxlength="255" id="iepaperno" class="form-control"
                    placeholder="投保人身份证号" onblur="paperNOBlur(this);">
                  </div>
                </div>
                <div class="col-sm-12 text-left" style="margin-top:1%;">
                  <label for="inputEmail3" class="col-sm-4 control-label hidden-md hidden-sm">投保人手机号:</label>
				  <div class="col-sm-6">
                    <input type="text" maxlength="255" id="iephone" class="form-control"
                    placeholder="投保人手机号">
                  </div>
                </div>

              </div>
	          <div class="col-md-8" style="margin-left:20%;">
	            <hr>
	          </div>
              <div class="form-horizontal has-success" >
                <div class="col-sm-12 text-left" style="margin-top:1%;">
                  <label for="inputEmail3" class="col-sm-4 control-label hidden-md hidden-sm">与投保人关系:&nbsp;&nbsp;</label>
                  <input style="margin-left:2%;" type="checkbox" id="iarelation" value="其他"onclick="isOneSelf(this);">
                  <label for="inputEmail3" class="control-label hidden-md hidden-sm">本人</label>
                </div>

                <div class="col-sm-12 text-left" style="margin-top:1%;">
                  <label for="inputEmail3" class="col-sm-4 control-label hidden-md hidden-sm">被保险人姓名:</label>
				  <div class="col-sm-6">
                    <input type="text" id="ianame" maxlength="255" class="form-control"
                    placeholder="被保险人姓名">
                  </div>
                </div>

                <div class="col-sm-12 text-left" style="margin-top:1%;">
                  <label for="inputEmail3" class="col-sm-4 control-label hidden-md hidden-sm">被保险人证件号:</label>
				  <div class="col-sm-6">
                    <input type="text" id="iapaperno" maxlength="255" class="form-control"
                    placeholder="被保险人证件号" onblur="paperNOBlur(this);">
                  </div>
                </div>

                <div class="col-sm-12 text-left" style="margin-top:1%;">
                  <label for="inputEmail3" class="col-sm-4 control-label hidden-md hidden-sm">被保险人职业:<a href="worker/fg/goSearchwork" target="_blank" >(职业查询)</a></label> 
                  <input style="margin-left:2%;" type="checkbox" id="ischildren" value="儿童" onclick="isChildrenChecked(this);">
                  <label for="inputEmail3" class="control-label hidden-md hidden-sm">儿童</label> 
                  <div class="col-sm-6">                 
                    <fieldset id="work_filed" class="hidden-md hidden-sm">
				  	   <select class="province" data-first-title="选择" style="height:30px;">
				  	     <option value="">请选择</option>
				  	   </select>
				  	   <select class="city" data-first-title="选择" style="height:30px;">
				  	     <option value="">请选择</option>
				  	   </select>
				  	   <select id="iaprofession" class="area" data-first-title="选择" style="height:30px;">
				  	     <option value="">请选择</option>
				  	   </select>
				  	</fieldset>	
				  	<select id="child_select"  class="form-control" style="display: none;">
					    <option value ="学龄前儿童" selected="selected">学龄前儿童</option>
					    <option value ="学生">学生</option>
				    </select>			  			
                  </div>				  
                </div>

                <br>
                <div class="col-sm-12 text-left" style="margin-top:1%;">
                  <label for="inputEmail3" class="col-sm-4 control-label hidden-md hidden-sm">被保险人年龄:</label>
				  <div class="col-sm-6">
                    <input type="text" id="iaage" maxlength="32" disabled="disabled" class="form-control"
                    placeholder="被保险人年龄" >
                  </div>
                </div>

                <br>
                 <div class="col-sm-12 text-left" style="margin-top:1%;">
                  <label for="inputEmail3" class="col-sm-4 control-label hidden-md hidden-sm">投保份数:[<= ${copies}份]</label>
				  <div class="col-sm-6">
                    <input type="text" id="iacopy" maxlength="32"  class="form-control"
                    placeholder="份数" >
                  </div>
                </div>
                <br>
              </div>
              
              <div class="col-md-8" style="margin-left:20%;">
	            <hr>
	          </div>
	          
              <div class="form-horizontal has-warning" >
                <div class="col-sm-12 text-left">
                  <label for="inputEmail3" class="col-sm-4 control-label hidden-md hidden-sm">受益人姓名:</label>
				  <div class="col-sm-6">
                    <input type="text" id="bname" maxlength="255" value="法定受益人" disabled="disabled" class="form-control"
                    placeholder="受益人姓名">
                  </div>
                </div>

                <br>
                <div class="col-sm-12 text-left" style="margin-top:1%;">
                  <label for="inputEmail3" class="col-sm-4 control-label hidden-md hidden-sm">服务人员姓名:</label>
				  <div class="col-sm-6">
                    <input type="text" id="sname" maxlength="255" class="form-control"
                    placeholder="服务人员姓名">
                  </div>
                </div>

                <br>
                <div class="col-sm-12 text-left" style="margin-top:1%;">
                  <label for="inputEmail3" class="col-sm-4 control-label hidden-md hidden-sm">服务人员手机号:</label>
				  <div class="col-sm-6">
                    <input type="text" id="sphone" maxlength="255" class="form-control"
                    placeholder="服务人员手机号">
                  </div>
                </div>

                <br>
                <div class="col-sm-12 text-left" style="margin-top:1%;">
                  <label for="inputEmail3" class="col-sm-4 control-label hidden-md hidden-sm">是否发送短信:</label>
				  <div class="col-sm-6">
                    <!-- input type="text" id="ismessage" maxlength="255" style="width:50%;" class="form-control"
                    placeholder="是否发送短信"-->
                    <select id="ismessage" maxlength="255" class="form-control">
				    <option value ="是">是</option>
				    <option value ="否" selected="selected">否</option>
				    </select>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
	  <div class="col-md-8" style="margin-left:20%;">
	    <hr>
	  </div>
      <div class="section">
        <div class="container">
          <div class="row">
            <div class="col-md-12 text-center">
              <a class="btn btn-lg btn-success" onclick="PolicyInfoprev();">上一步</a>
              <a class="btn btn-lg btn-success" onclick="PolicyInfonext();">下一步</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    
    
       		
 

					
<!-- 服务协议条款 -->						
<div id="SERVICETEXT" style="display: none;" class="middle">	
	 <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h3 class="text-center text-info">服务条款</h3>
          </div>
        </div>
      </div>
    </div>		
    
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-md-2"></div>
                  <div class="col-md-8">
                    <div id="SERVERCONTENT" name="SERVERCONTENT" ></div>
                    <br>
                    <div>
                      <h5 class="text-left text-info">保险条款</h5>
                      <div id="claimtext" class="col-sm-offset-2"></div>
                    </div>
                    <br>
                    <h5 class="text-center text-info">同意
                      <input type="checkbox" id="ACCEPTSERVICE" disabled="disabled" onclick="acceptService(this);">
                    </h5>
                  </div>
                  <div class="col-md-2"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <br/>
    <br/>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6 text-right">
            <a class="btn btn-success btn-lg" onclick="SERVICETEXTprev();">上一步</a>
          </div>
          <div class="col-md-6">
            <a class="btn btn-success btn-lg" disabled="disabled" onclick="SERVICETEXTnext();"
            id="servicetextNext">下一步</a>
          </div>
        </div>
      </div>
    </div>
</div>    	


						
<!-- 确认信息栏 -->
<!--  
 <div id="Form" style="display: none;" class="form-group middle" >				
	    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-4"></div>
          <div class="col-md-4">

              <h3 class="text-center  text-warning">
                <strong>信息确认</strong>
              </h3>
              <form action="policy/${action}" name="Form" id="Form" method="post">
              	<div style="margin-left:20%;">
                <h5 class="text-info text-justify">投保人姓名:
               </h5>
                 <input type="text" name="IERNAME" id="IERNAME" maxlength="255" style="background: border-box;border:hidden;" class="text-right">
 
                <h5 class="text-info text-justify">投保人证件号码:
                </h5>
                 <input type="text" name="IERPAPERNO" id="IERPAPERNO" maxlength="255"
                  value="${pd.IERPAPERNO}" style="background: border-box;border:hidden;" class="text-right">
                <h5 class="text-info text-justify">投保人手机号:

                </h5>
                                  <input type="text" name="IERPHONE" id="IERPHONE" maxlength="255"
                  value="${pd.IERPHONE}" style="background: border-box;border:hidden;" class="text-right">
                <h5 class="text-info text-justify">被保险人姓名:
                  <input type="text" name="IANTNAME" id="IANTNAME" maxlength="255"
                  value="${pd.IANTNAME}" style="background: border-box;border:hidden;" class="text-right">
                </h5>
                <h5 class="text-info text-justify">被保险人证件号码::
                  <input type="text" name="IANTPAPERNO" id="IANTPAPERNO" maxlength="255"
                  value="${pd.IANTPAPERNO}" style="background: border-box;border:hidden;" class="text-right">
                </h5>
                <h5 class="text-info text-justify">被保险人职业:
                  <input type="text" name="IANTPROFESSION" id="IANTPROFESSION" maxlength="255"
                  value="${pd.IANTPROFESSION}" style="background: border-box;border:hidden;" class="text-right">
                </h5>
                <h5 class="text-info text-justify">与被保险人关系:
                  <input type="text" name="IANTRELATION" id="IANTRELATION" maxlength="255"
                  value="${pd.IANTRELATION}" style="background: border-box;border:hidden;" class="text-right">
                </h5>
                <h5 class="text-info text-justify">投保份数:
                  <input type="text" name="IANTCOPY" id="IANTCOPY" maxlength="255"
                  value="${pd.IANTCOPY}" style="background: border-box;border:hidden;" class="text-right">
                </h5>
                <h5 class="text-info text-justify">被保险人年龄:
                  <input type="text" name="IANAGE" id="IANAGE" maxlength="255" value="${pd.IANAGE}"
                  style="background: border-box;border:hidden;" class="text-right">
                </h5>
                <h5 class="text-info text-justify">受益人姓名:
                  <input type="text" name="BENNAME" id="BENNAME" maxlength="255" value="${pd.BENNAME}"
                  style="background: border-box;border:hidden;" class="text-right">
                </h5>
                <h5 class="text-info text-justify">服务人员姓名:
                  <input type="text" name="SVRNAME" id="SVRNAME" maxlength="255"
                  value="${pd.SVRNAME}" style="background: border-box;border:hidden;" class="text-right">
                </h5>
                <h5 class="text-info text-justify">服务人员手机号码:
                  <input type="text" name="SVRPHONE" id="SVRPHONE" maxlength="255"
                  value="${pd.SVRPHONE}" style="background: border-box;border:hidden;" class="text-right">
                </h5>
                <h5 class="text-info text-justify">是否短信提醒:
                  <input type="text" name="ISSENDMESSAGE" id="ISSENDMESSAGE" maxlength="255"
                  value="${pd.ISSENDMESSAGE}" style="background: border-box;border:hidden;" class="text-right">
                </h5>
                 <input type="text" name="CARDNO" id="CARDNO" maxlength="255"
                  value="${cardno}" style="display:none;" class="text-right">
                 <input type="text" name="BUSINESSID" id="BUSINESSID" maxlength="255"
                  value="" style="display:none;" class="text-right">
                <br>
                <br>
                </div>
                <div class="col-md-4"></div>
                <button type="button" class="btn btn-success btn-lg" onclick="FormPrev();">返回</button>
                <button type="submit" class="btn btn-success btn-lg">提交</button>
              </form>
            </div>
          </div>
          <div class="col-md-4"></div>
        </div>
      </div>
    </div>			
-->
    <div id="Form" style="display: none;" class="form-group middle">
      <div class="section">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="col-md-4"></div>
              <div class="col-md-4 text-center" style="background-color: aliceblue;border: groove;">
                <h3 class="text-center  text-warning">
                  <strong>信息确认单</strong>
                </h3>
                <form action="policy/fg/${action}" name="Form" id="Form" method="post">
                  <div style="margin-left:20%;">
                    <h5 class="text-info text-justify">投保人姓名:</h5>
                    <input type="text" name="IERNAME" id="IERNAME" maxlength="255"
                    style="background: border-box;border:hidden;" class="" value="" readonly="readonly">
                    <hr>
                    <h5 class="text-info text-justify">投保人证件号码:</h5>
                    <input type="text" name="IERPAPERNO" id="IERPAPERNO" maxlength="255"
                    value="" style="background: border-box;border:hidden;" class="" readonly="readonly">
                    <hr>
                    <h5 class="text-info text-justify">投保人手机号:</h5>
                    <input type="text" name="IERPHONE" id="IERPHONE" maxlength="255"
                    value="" style="background: border-box;border:hidden;" class="" readonly="readonly">
                    <hr>
                    <h5 class="text-info text-justify">与投保人关系:</h5>
                    <input type="text" name="IANTRELATION" id="IANTRELATION"
                    maxlength="255" value="" style="background: border-box;border:hidden;"
                    class="" readonly="readonly">
                    <hr>
                    <h5 class="text-info text-justify">被保险人姓名:</h5>
                    <input type="text" name="IANTNAME" id="IANTNAME" maxlength="255"
                    value="李治" style="background: border-box;border:hidden;" class="" readonly="readonly">
                    <hr>
                    <h5 class="text-info text-justify">被保险人证件号码:</h5>
                    <input type="text" name="IANTPAPERNO" id="IANTPAPERNO" maxlength="255"
                    value="" style="background: border-box;border:hidden;" class="" readonly="readonly">
                    <hr>
                    <h5 class="text-info text-justify">被保险人职业:</h5>
                    <input type="text" name="IANTPROFESSION" id="IANTPROFESSION"
                    maxlength="255" value="" style="background: border-box;border:hidden;"
                    class="" readonly="readonly">
                    <hr>
                    <h5 class="text-info text-justify">投保份数:</h5>
                    <input type="text" name="IANTCOPY" id="IANTCOPY" maxlength="255"
                    value="" style="background: border-box;border:hidden;" class="" readonly="readonly">
                    <hr>
                    <h5 class="text-info text-justify">被保险人年龄:</h5>
                    <input type="text" name="IANAGE" id="IANAGE" maxlength="255"
                    value="" style="background: border-box;border:hidden;" class="" readonly="readonly">
                    <hr>
                    <h5 class="text-info text-justify">受益人姓名:</h5>
                    <input type="text" name="BENNAME" id="BENNAME" maxlength="255"
                    value="" style="background: border-box;border:hidden;" class="" readonly="readonly">
                    <hr>
                    <h5 class="text-info text-justify">服务人员姓名:</h5>
                    <input type="text" name="SVRNAME" id="SVRNAME" maxlength="255"
                    value="" style="background: border-box;border:hidden;" class="" readonly="readonly">
                    <hr>
                    <h5 class="text-info text-justify">服务人员手机号码:</h5>
                    <input type="text" name="SVRPHONE" id="SVRPHONE" maxlength="255"
                    value="" style="background: border-box;border:hidden;" class="" readonly="readonly">
                    <hr>
                    <h5 class="text-info text-justify">是否短信提醒:</h5>
                    <input type="text" name="ISSENDMESSAGE" id="ISSENDMESSAGE"
                    maxlength="255" value="" style="background: border-box;border:hidden;"
                    class="" readonly="readonly">
                    <hr>
                    <!--hide value-->
                    <input type="text" name="CARDNO" id="CARDNO" maxlength="255" value="${cardno}"
                    style="display:none;" class="text-right">
                    <input type="text" name="BUSINESSID" id="BUSINESSID" maxlength="255" value=""
                    style="display:none;" class="text-right">
                    <br>
                    <br>
                  </div>
                  <button type="button" class="btn btn-success btn-lg" onclick="FormPrev();">返回</button>
                  <button type="submit" class="btn btn-success btn-lg">提交</button>
                </form>
              </div>
              <div class="col-md-4"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
	


	<!-- 尾部-->	
	<%@ include file="../../tail.jsp"%>
	
			

<!--javascript 脚本分割线********************************************************************************************************************  -->			
<script type="text/javascript">
		

		//馋看数组是否包含指定的元素
		function contains(a, obj) {
		    for (var i = 0; i < a.length; i++) {
		        if (a[i] === obj) {
		            return true;
		         }
		    }       
		     return false;
		}

		var curbusinessId = 1;
		var div = document.getElementById("1");
		div.setAttribute("class", "panel panel-primary  text-center"); 

		function divclick(param){
			//alert(param.id);
			param.setAttribute("class", "panel panel-primary  text-center");
			
			for (var i=1;i<=${businesslistSize};i++)
			{
				if (i==param.id)
				{
					curbusinessId=param.id;
					continue;
				}
				var div = document.getElementById(i);
				div.setAttribute("class", "panel panel-default  text-center"); 				
			}

		}
		
		function snameNOBlur(param){
			if ($("#sname").val() == '') {
				return;
			}
			$.ajax({
        		type: "POST",
        		url: '<%=basePath%>cardinfo/fg/hasSvrName.do',
       			data: {CARDID:$("#CARDNO").val(), SVRNAME:$("#sname").val()},
        		dataType: "json",
        		success: function(data){
                   if (data.IsSuccess){
                   }else{
                	  if (param.id=="sname"){
						$("#sname").tips({
							side:3,
			            	msg:'服务人员不匹配',
			            	bg:'#AE81FF',
			            	time:2
			        		});						
						}
						$("#sname").val('');
						$("#sname").focus();	
						return
                   }
                }
   			});		
		}
		
		function paperNOBlur(param){
			//alert(param.value);
			if (!validateIdCard(param.value)) {
				//alert(param.id);

				if (param.id=="iapaperno"){
					$("#iapaperno").tips({
						side:3,
			            msg:'证件号码无效',
			            bg:'#AE81FF',
			            time:2
			        });	
			        $("#iapaperno").val('');
			        $("#iapaperno").focus();					
				}else if(param.id=="iepaperno"){
					$("#iepaperno").tips({
						side:3,
			            msg:'证件号码无效',
			            bg:'#AE81FF',
			            time:2
			        });	
			        $("#iepaperno").val('');
			        $("#iepaperno").focus();				
				}			
			
				return
			}
			if (param.id=="iapaperno"){
				age=getAge(param.value);
				$("#iaage").val(age);
			}
		}
		
		
		function validateIdCard(idCard) {  
		    //15位和18位身份证号码的正则表达式  
		    var regIdCard = /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;  
		    //如果通过该验证，说明身份证格式正确，但准确性还需计算  
		    if (regIdCard.test(idCard)) {  
		        if (idCard.length == 18) {  
		            var idCardWi = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); //将前17位加权因子保存在数组里  
		            var idCardY = new Array(1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2); //这是除以11后，可能产生的11位余数、验证码，也保存成数组  
		            var idCardWiSum = 0; //用来保存前17位各自乖以加权因子后的总和  
		            for (var i = 0; i < 17; i++) {  
		                idCardWiSum += idCard.substring(i, i + 1) * idCardWi[i];  
		            }  
		            var idCardMod = idCardWiSum % 11;//计算出校验码所在数组的位置  
		            var idCardLast = idCard.substring(17);//得到最后一位身份证号码  
		            //如果等于2，则说明校验码是10，身份证号码最后一位应该是X  
		            if (idCardMod == 2) {  
		                if (idCardLast == "X" || idCardLast == "x") {  
		                    return true;  
		                } else {  
		                    return false;  
		                }
		            } else {  
		                //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码  
		                if (idCardLast == idCardY[idCardMod]) {  
		                    return true;  
		                } else {  
		                    return false;  
		                }
		            }
				}
		    } else {  
		        return false;  
		    }
		}
		
		
		function getAge(cardId){

            var myDate = new Date();
            var month = myDate.getMonth() + 1;
            var day = myDate.getDate();
            var age = myDate.getFullYear() - cardId.substring(6, 10) - 1;
            if (cardId.substring(10, 12) < month || cardId.substring(10, 12) == month && cardId.substring(12, 14) <= day) {
                age++;
            }
      		return age;

		}

		function acceptNotice(param){
			if (param.checked){
				$('#noticetextNext').attr("disabled",false);
			}else {
				$('#noticetextNext').attr("disabled",true);
			}
			 
			return 
		}
		function acceptService(param){
			if (param.checked){
				$('#servicetextNext').attr("disabled",false);
			}else {
				$('#servicetextNext').attr("disabled",true);
			}
			 
			return 
		}
		
		function isOneSelf(param){
			if (param.checked){
				document.getElementById("iarelation").value= "本人";
				document.getElementById("ianame").value= $("#iename").val();
				document.getElementById("ianame").readOnly=true;
				document.getElementById("iapaperno").value= $("#iepaperno").val();
				document.getElementById("ianame").readOnly=true;
				var idNo = document.getElementById("iapaperno");
				paperNOBlur(idNo);		
			}else{
				document.getElementById("iarelation").value= "其他";
				document.getElementById("ianame").value= "";
				document.getElementById("ianame").readOnly=false;
				document.getElementById("iapaperno").value= "";
				document.getElementById("iapaperno").readOnly=false;
			}
			 
			return 
		}
		
		function addWeb(param) {
			var ds=document.getElementById("claimtext");
			var a=document.createElement("a");
			a.setAttribute("href",'<%=basePath%>'+param); 
			a.setAttribute("target","_blank");

			var name = param.substring(param.lastIndexOf("/")+1);
			a.appendChild(document.createTextNode(name));  
			//var div=document.createElement("div");
			ds.appendChild(a);
			$('#claimtext a').click( function() {
				$('#ACCEPTSERVICE').attr("disabled",false);
			});
		}
		
		function bussinessnext(){
			$("#NOTICETEXT").show();
			$("#business").hide();
			divId="businessid"+curbusinessId;
			var inp=document.getElementById(divId);
			
			$.cxSelect.defaults.url = '<%=basePath%>worker/fg/getworkjson?businessid='+inp.value;
			
			$('#work_filed').cxSelect({selects: ['province', 'city', 'area'],emptyStyle: 'none' });
			
			//var name = inp.value;
			//alert(name);
			document.getElementById("BUSINESSID").value=inp.value;
			//alert(document.getElementById("BUSINESSID").value);
			$.ajax({
                    url: '<%=basePath%>business/fg/getNoticeText.do?BUSINESS_ID='+inp.value,   //请求的url地址
                    dataType: "json",   //返回格式为json
                    async: false, //请求是否异步，默认为异步，这也是ajax重要特性
                    type: "POST",   //请求方式
                    success: function(data) {
                        if (data.IsSuccess == false) {
                            alert("添加失败!");           
                        }                
                        if (data.IsSuccess == true) {
                        	$("#NOTICECONTENT").html(data.NoticText);
                        }
                    }
                  });
			$.ajax({
                    url: '<%=basePath%>business/fg/getServerText.do?BUSINESS_ID='+inp.value,   //请求的url地址
                    dataType: "json",   //返回格式为json
                    async: false, //请求是否异步，默认为异步，这也是ajax重要特性
                    type: "POST",   //请求方式
                    success: function(data) {
                        if (data.IsSuccess == false) {
                            alert("添加失败!");           
                        }                
                        if (data.IsSuccess == true) {
                        	$("#SERVERCONTENT").html(data.ServerText);
                        	addWeb(data.ClaimText);
                        }
                    }
                });
	
			return ;
		}

		
		function PolicyInfoprev(){
			$("#PolicyInfo").hide();
			$("#NOTICETEXT").show();	
		}	
		function PolicyInfonext(){
			
			if($("#iename").val()==""){
				$("#iename").tips({
					side:3,
		            msg:'请填写投保人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#iename").focus();
			return false;
			}
			if($("#iepaperno").val()==""){
				$("#iepaperno").tips({
					side:3,
		            msg:'请输入投保人身份证号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#iepaperno").focus();
			return false;
			}
			if($("#iephone").val()==""){
				$("#iephone").tips({
					side:3,
		            msg:'请输入投保人手机号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#iephone").focus();
				
			return false;
			}
			if($("#ianame").val()==""){
				$("#ianame").tips({
					side:3,
		            msg:'请输入被投保人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ianame").focus();
			return false;
			}
			if($("#iapaperno").val()==""){
				$("#iapaperno").tips({
					side:3,
		            msg:'请输入被投保人身份证号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#iapaperno").focus();
			return false;
			}
			var thirdprofession=$("#iaprofession").val();
			
			var child= document.getElementById("ischildren");
			if(child.checked){
				thirdprofession=$('#child_select option:selected').val();
			}
			
			//alert(thirdprofession);
			if(thirdprofession==null || thirdprofession==""){
				
				$("#work_filed").tips({
					side:3,
		            msg:'请输入被投保人职业',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#work_filed").focus();
			return false;
			}
			if($("#iarelation").val()==""){
				$("#iarelation").tips({
					side:3,
		            msg:'请输入被投保人与投保人关系',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#iarelation").focus();
			return false;
			}
			if($("#iaage").val()==""){
				$("#iaage").tips({
					side:3,
		            msg:'请输入被投保人年龄',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#iaage").focus();
			return false;
			}
			if($("#iacopy").val()==""){
				$("#iacopy").tips({
					side:3,
		            msg:'请输入投保份数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#iacopy").focus();
			return false;
			}
			
			if($("#bname").val()==""){
				$("#bname").tips({
					side:3,
		            msg:'请输入受益人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#bname").focus();
			return false;
			}
			if($("#sname").val()==""){
				$("#sname").tips({
					side:3,
		            msg:'请输入服务人员姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#sname").focus();
			return false;
			}
			if($("#sphone").val()==""){
				$("#sphone").tips({
					side:3,
		            msg:'请输入服务人员手机号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#sphone").focus();
			return false;
			}
			if($("#ismessage").val()==""){
				$("#ismessage").tips({
					side:3,
		            msg:'请选择是否发送短信',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ismessage").focus();
			return false;
			}
			
			//limit age
			//alert($("#iaage").val());
			if($("#iaage").val()<${minage} || $("#iaage").val()>${maxage}){
				$("#iaage").tips({
					side:3,
		            msg:'年龄不符合',
		            bg:'#AE81FF',
		            time:2
		        });
				return false;
			}
			
			/*
			//limit 职业
			var professions=${PROFESSIONS};
			//["警察","土匪","教师","学生"];
			//alert(professions);
			if(!contains(professions,$("#iaprofession").val())){
				//alert(professions);
				$("#iaprofession").tips({
					side:3,
		            msg:'职业不符合要求',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#iaprofession").focus();
				return false;
			}
			*/
			
			//limit份数
			if($("#iacopy").val()>${copies}){
				$("#iacopy").tips({
					side:3,
		            msg:'超过卡种份数上限',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#iacopy").focus();
			return false;
			}
			
			//alert($("#ismessage").val())
			
			$("#PolicyInfo").hide();
			$("#SERVICETEXT").show();
			
	
			return ;


		}	
		
		function SERVICETEXTprev(){
			$("#PolicyInfo").show();
			$("#SERVICETEXT").hide();
			return ;
		}
		
		function NOTICEprev() {
			$("#business").show();
			$("#NOTICETEXT").hide();
			return;
		}
		
		function NOTICEnext(){
			$("#PolicyInfo").show();
			$("#NOTICETEXT").hide();
		}
		
		function SERVICETEXTnext(){
			
			var iername=$("#iename").val();
			document.getElementById("IERNAME").value= iername;
			
			var ierpaperno=$("#iepaperno").val();
			document.getElementById("IERPAPERNO").value= ierpaperno;
			
			var ierphone=$("#iephone").val()
			document.getElementById("IERPHONE").value= ierphone;
			
			
			var iantname= $("#ianame").val();
			document.getElementById("IANTNAME").value= iantname;
			
			
			var iantpaperno=$("#iapaperno").val();
			document.getElementById("IANTPAPERNO").value= iantpaperno;
				

			var iantprofession=$("#iaprofession").val();
			var child= document.getElementById("ischildren");
			if(child.checked){
				iantprofession=$('#child_select option:selected').val();
			}
			document.getElementById("IANTPROFESSION").value= iantprofession;
		
			var iantrelation= $("#iarelation").val()
			document.getElementById("IANTRELATION").value= iantrelation;
			
			var iantage=$("#iaage").val();
			document.getElementById("IANAGE").value= iantage;
			
			var iantage=$("#iacopy").val();
			document.getElementById("IANTCOPY").value= iantage;
			
			var benname=$("#bname").val();
			document.getElementById("BENNAME").value= benname;
	
			var svrname=$("#sname").val()
			document.getElementById("SVRNAME").value= svrname;
			
			var svrphone=$("#sphone").val();
			document.getElementById("SVRPHONE").value= svrphone;
			
			var issendmessage=$("#ismessage").val();
			document.getElementById("ISSENDMESSAGE").value= issendmessage;
			
			
			$("#Form").show();
			$("#SERVICETEXT").hide();

			//alert("SERVICETEXTnext");
			return  ;
		}
		
		function FormPrev(){
			$("#SERVICETEXT").show();
			$("#Form").hide();
			return false;
		}
		
		function isChildrenChecked(child){
			if(child.checked){
				document.getElementById("work_filed").style.display="none";
				$("#child_select").show();
			}else{
				document.getElementById("work_filed").style.display="block";
				$("#child_select").hide();
			}
		}
		
</script>	

	
	
	</body>
</html>
