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
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
  </head><body>
 <%@ include file="WEB-INF/jsp/ins/main/header.jsp"%>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-2">
            <div class="panel panel-danger">
              <div class="panel-heading">
                <h3 class="panel-title text-muted">新闻</h3>
              </div>
              <div class="panel-body ">
                <p class="text-muted">条目1</p>
              </div>
              <div class="panel-body">
                <p class="text-muted">条目2</p>
              </div>
              <div class="panel-body">
                <p class="text-muted">条目3</p>
              </div>
              <div class="panel-body">
                <p class="text-muted">条目5</p>
              </div>
              <div class="panel-body">
                <p class="text-muted">条目6</p>
              </div>
              <div class="panel-body">
                <p class="text-muted">条目7</p>
              </div>
              <div class="panel-body">
                <p class="text-muted">条目8</p>
              </div>
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
              <form action="${action}" name="Form" id="Form" method="post" class="center-block text-center">
                <h4 class="form-signin-heading text-center text-warning">服务卡激活</h4>
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
                <h4 class="text-muted">快捷服务</h4>
                <div class="row">
                  <div class="col-md-6">
                    <div class="section">
                      <div class="row text-center">
                        <div>
                          <a><i class="fa fa-3x fa-apple fa-fw text-warning"></i></a>
                          <h6>查询保单</h6>
                          <a><i class="fa fa-3x fa-automobile fa-fw text-warning"></i></a>
                          <h6>单证下载</h6>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="section">
                      <div class="row text-center">
                        <a><i class="fa fa-3x fa-angellist fa-fw text-warning"></i></a>
                        <h6>航延理赔</h6>
                        <a><i class="fa fa-3x fa-camera fa-fw text-warning"></i></a>
                        <h6>服务网点</h6>
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
              <h4 contenteditable="true" class="text-muted">银行卡被盗？</h4>
              <h4 contenteditable="true" class="text-muted">房屋遭受火灾？</h4>
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
              <h4 contenteditable="true" class="text-muted">家庭财产被盗</h4>
              <h4 contenteditable="true" class="text-muted">再也不用担心了!</h4>
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
    <div class="section">
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
          <div class="col-md-8">
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
  <%@ include file="WEB-INF/jsp/ins/main/footer.jsp"%>

</body></html>