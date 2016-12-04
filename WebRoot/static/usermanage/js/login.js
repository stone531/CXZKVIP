$().ready(function() {

    $("#btn_login").click(function() {
       loginhandler();
    });

});

function loginhandler(){
	
	if ($("#LoginName").val() == ""||$("#txtPassword").val() == ""){
		$("#memberErrMsg").text("用户名密码不能为空");
		return;
	}
	if ($("#VerificationCode").val() == ""){
		return
	}
	$.ajax({
        type: "POST",
        async:false,
        url: "/CXZKVIP/usermanage/login/do_login",
        data: {MOBILE:$("#LoginName").val(), PASSWORD:$("#txtPassword").val(),"rand":$("#VerificationCode").val()},
        dataType: "json",
        beforeSend: function(){$("#btn_login").text("正在登陆");},
        complete: function(){$("#btn_login").text("立即登陆");},
        success: function(data){
                   if (data.IsSuccess == 1){
                	   window.location.href="/CXZKVIP/main/index?rnd="+Math.random(); 
                   }else if (data.IsSuccess == 3){
                	   $("#memberErrMsg").text("验证码不正确");
                   }else if (data.IsSuccess == 2){
                	   $("#memberErrMsg").text("用户不存在");
                   }else {
                	   $("#memberErrMsg").text("用户名密码不正确");
                   }
                 }
    });
}