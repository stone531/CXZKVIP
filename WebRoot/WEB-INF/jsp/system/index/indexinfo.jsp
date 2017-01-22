<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

%>
<html>
<head >
<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">

	<!--  script src="static/main/js/jquery.js"></script -->
	<script src="static/main/js/index.js"></script>
	<script src="static/main/js/swiper.min.js"></script>
	<script type="text/javascript" src="static/js/jquery-1.7.2.js" ></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<%@ include file="../../ht.jsp"%>
  </head><body>
 <%@ include file="../../head.jsp"%>
 
 
 
    <div class="section" style="margin-bottom:100px; ">
      <div class="container">
        <div class="row">
          <div class="col-md-2">
            <div class="panel panel-danger">
              <div class="panel-heading">
                <a href="news/fg/newslist"><h3 class="panel-title text-muted">新闻</h3></a>
              </div>
              
              <c:choose>
					<c:when test="${not empty varList}">
						<c:forEach items="${varList}" var="var" varStatus="vs">
						 <c:if test = "${var.NEWS_STATUS == 1}">
							<div class="panel-body ">
                				<a href = "news/fg/show?NEWS_ID=${var.NEWS_ID}"><p class="text-muted">${var.NEWS_TITLE}</p></a>
              				</div>
						 </c:if>
						</c:forEach>
					</c:when>
				<c:otherwise>
					<div class="panel-body ">
						<p class="text-muted">没有新闻</p>
					</div>
				</c:otherwise>
			 </c:choose>
            </div>
          </div>
          <div class="col-md-7">
            <div class="row">
              <div class="col-md-12">
                <div id="fullcarousel-example" data-interval="false" class="carousel slide" data-ride="carousel">
                  <div class="carousel-inner">
                    <div class="item active">
                      <img src="http://adcdn.pingan.com/ad/chanxian/ZHENGCHENGCHENG5071479282126928.jpg">
                      <div class="carousel-caption">
                        <h2>鸟</h2>
                        <p>海鸥</p>
                      </div>
                    </div>
                    <div class="item">
                      <img src="http://adcdn.pingan.com/ad/chanxian/ZHENGCHENGCHENG5071479282168464.jpg">
                      <div class="carousel-caption">
                        <h2>Title</h2>
                        <p>Description</p>
                      </div>
                    </div>
                    <div class="item">
                      <img src="http://adcdn.pingan.com/ad/chanxian/ZHENGCHENGCHENG5071475129822155.jpg">
                      <div class="carousel-caption">
                        <h2>Title</h2>
                        <p>Description</p>
                      </div>
                    </div>
                    <div class="item">
                      <img src="http://adcdn.pingan.com/ad/chanxian/ZHENGCHENGCHENG5071475129865579.jpg">
                      <div class="carousel-caption">
                        <h2>Title</h2>
                        <p>Description</p>
                      </div>
                    </div>
                  </div>
                  <a class="left carousel-control" href="#fullcarousel-example" data-slide="prev"><i class="fa fa-angle-left icon-prev"></i></a>
                  <a class="right carousel-control" href="#fullcarousel-example" data-slide="next"><i class="fa fa-angle-right icon-next"></i></a>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12" style="margin-left:5%;">
                <div class="section">
                  <div class="container">
                    <div class="row">
                      <div class="col-md-2">
                        <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/yy_a_02.jpg" class="img-responsive"></a>
                      </div>
                      <div class="col-md-2">
                        <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/cc_a_yhk.jpg" class="img-responsive"></a>
                      </div>
                      <div class="col-md-2">
                        <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/ly_a_03.jpg" class="img-responsive"></a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="row" style="margin:2%;">
              <form action="cardinfo/fg/verifycard" name="Form" id="Form" method="post" class="center-block text-center">
                <h3 class="form-signin-heading text-center text-warning">服务卡激活</h3>
                <p class="center-block">
                  <input type="text" name="CARDID" id="CARDID" maxlength="255" class="form-control center-block" placeholder="输入服务卡号" title="服务卡号" style="width:100%;">
                </p>
                <p class="center-block">
                  <input type="password" name="PASSWORD" id="PASSWORD" maxlength="255" class="form-control center-block" placeholder="输入密码" title="密码" style="width:100%;">
                </p>
                <button type="button" class="btn btn-block btn-sm btn-warning center-block" onclick="save();" style="width:50%;">确定</button>
              </form>
            </div>
            <div class="row">
              <div class="col-md-12">
                <hr>
                <h3 class="text-muted">快捷服务</h3>
                <div class="row">
                  <div class="col-md-6">
                    <div class="section">
                      <div class="row text-center">
                        <div>
                          <a href="claimsys/fg/goSearch"><i class="fa fa-3x fa-apple fa-fw text-warning"></i></a>             
                          <h6>查询保单</h6>
                          <a href="http://www.baidu.com"><i class="fa fa-3x fa-automobile fa-fw text-warning"></i></a>
                          <h6>单证下载</h6> 	
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="section">
                      <div class="row text-center">
                        <a href="usermanage/personal/show"><i class="fa fa-3x fa-angellist fa-fw text-warning"></i></a>
                        <h6>个人中心</h6>
                        <a href="onlinemsg/fg/index" target="view_window"><i class="fa fa-3x fa-camera fa-fw text-warning"></i></a>
                        <h6>在线留言</h6>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
<div id=floater style="Z-INDEX: 100; RIGHT: 10px; VISIBILITY: visible; WIDTH: 100px; POSITION: fixed; TOP: 60%; left: 92%;" >   
	<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=963396570&amp;site=qq&amp;menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:963396570:53" alt="点击这里给我发消息" title="点击这里给我发消息"></a>
</div>

<div id="img" style="Z-INDEX: 100;position: absolute; left: 311; top: 815;visibility :hidden;" onmouseover="clearInterval(interval)" onmouseout="interval = setInterval('changePos()', delay)" align="middle">

<div id="fdck">
							<div class="btn-link btn-link btn-link btn-link panel panel-success">

<c:choose>
					<c:when test="${not empty varList}">
						<div class="panel-heading">
                			<h8 class="panel-title"><span style="CURSOR:hand;font-weight:bold;" onclick="clearInterval(interval);img.style.visibility = 'hidden'">关闭</span></h8>
             			</div>
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<c:if test = "${var.NEWS_STATUS == 2}">
								<div class="panel-body ">
                				<a style="color:red;" href = "news/fg/show?NEWS_ID=${var.NEWS_ID}"><p class="text-muted">${var.NEWS_TITLE}</p></a>
              					</div>
							</c:if>							
						</c:forEach>
					</c:when>
</c:choose>
							</div>
</div>
</div>
    <div class="col-md-12 text-center">
      <hr>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="btn-link panel panel-warning">
              <div class="panel-heading">
                <h1 class="panel-title text-danger">保险专题</h1>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-3">
            <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/tui_03.jpg" class="img-responsive"></a>
            <h3 class="text-center text-danger">乐龄退休</h3>
          </div>
          <div class="col-md-3">
            <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/tui_02.jpg" class="img-responsive"></a>
            <h3 class="text-center text-danger">财产保障</h3>
          </div>
          <div class="col-md-3">
            <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/tui_01.jpg" class="img-responsive"></a>
            <h3 class="text-center text-danger">潇洒出行</h3>
          </div>
          <div class="col-md-3">
            <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/tui_04.jpg" class="img-responsive"></a>
            <h3 class="text-center text-danger">守护家庭</h3>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="btn-link panel panel-info">
              <div class="panel-heading">
                <h1 class="panel-title text-danger">意外保险</h1>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <div class="well" style="margin-top:13%;">
              <h3 contenteditable="true" class="text-muted">银行卡被盗？</h3>
              <h3 contenteditable="true" class="text-muted">房屋遭受火灾？</h3>
            </div>
          </div>
          <div class="col-md-8">
            <div class="section">
              <div class="container">
                <div class="row">
                  <div class="col-md-4">
                    <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/yy_a_01.jpg" class="img-responsive"></a>
                  </div>
                  <div class="col-md-2">
                    <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/yy_a_02.jpg" class="img-responsive"></a>
                  </div>
                  <div class="col-md-2">
                    <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/yy_a_03.jpg" class="img-responsive"></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="btn-link panel panel-success">
              <div class="panel-heading">
                <h1 class="panel-title text-danger">财产保险</h1>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <div class="well" style="margin-top:10%;">
              <h3 contenteditable="true" class="text-muted">家庭财产被盗</h3>
              <h3 contenteditable="true" class="text-muted">再也不用担心了!</h3>
            </div>
          </div>
          <div class="col-md-8">
            <div class="section">
              <div class="container">
                <div class="row">
                  <div class="col-md-4">
                    <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/cc_a_01.jpg" class="img-responsive"></a>
                  </div>
                  <div class="col-md-2">
                    <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/cc_a_yhk.jpg" class="img-responsive"></a>
                  </div>
                  <div class="col-md-2">
                    <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/cc_a_03.jpg" class="img-responsive"></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section" style="margin-bottom:100px;">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="btn-link btn-link panel panel-info">
              <div class="panel-heading">
                <h1 class="panel-title text-danger">旅游保险</h1>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <div class="well" style="margin-top:10%;">
              <h3 class="text-muted">为什么买旅行险？</h3>
              <p class="text-muted">旅行中不仅有惊喜还有很多意想不到的状况。</p>
              <p class="text-muted">旅行险保证旅途平安</p>
              <p class="text-muted">提供救援服务,赔付医疗费用</p>
            </div>
          </div>
          <div class="col-md-8" >
            <div class="section">
              <div class="container">
                <div class="row">
                  <div class="col-md-4">
                    <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/ly_a_01.jpg" class="img-responsive"></a>
                  </div>
                  <div class="col-md-2">
                    <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/ly_a_02.jpg" class="img-responsive"></a>
                  </div>
                  <div class="col-md-2">
                    <a href="#"><img src="http://pimg1.4008000000.com/app_images/baoxian/v10/index_new/ly_a_03.jpg" class="img-responsive"></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  <%@ include file="../../tail.jsp"%>
  
  	<script type="text/javascript">
  	
var xPos = 20;
var yPos = document.body.clientHeight;
var step = 1;
var delay = 30;
var height = 0;
var Hoffset = 0;
var Woffset = 0;
var yon = 0;
var xon = 0;
var pause = true;
var interval;
img.style.top = yPos;
function changePos() {
width = document.body.clientWidth;
height = document.body.clientHeight;
Hoffset = img.offsetHeight;
Woffset = img.offsetWidth;
img.style.left = xPos + document.body.scrollLeft;
img.style.top = yPos + document.body.scrollTop;
if (yon) {
yPos = yPos + step;
}
else {
yPos = yPos - step;
}
if (yPos < 0) {
yon = 1;
yPos = 0;
}
if (yPos >= (height - Hoffset)) {
yon = 0;
yPos = (height - Hoffset);
}
if (xon) {
xPos = xPos + step;
}
else {
xPos = xPos - step;
}
if (xPos < 0) {
xon = 1;
xPos = 0;
}
if (xPos >= (width - Woffset)) {
xon = 0;
xPos = (width - Woffset);
}
}
function start() {
img.style.visibility = "visible";
interval = setInterval('changePos()', delay);
}
start();	
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
			}
	
	</script>

</body></html>