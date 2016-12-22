var mailSecond = 0;
var mobileSecond = 0;

$().ready(function() {
	
	mobile_initctrl();
	mail_initctrl();
	
	$(validMobileForm());
	$(validMailForm());
	
    $("#btn-mail").click(function() {
        mail_init();
    });
    $("#btn-mobile").click(function(){
    	mobile_init();
    });
  
});

function validMailForm(){
	return $("#mailForm").validate({
	rules:{
			txtMail: {
				required:true,
				email:true,
			},
			txtMailCode:{
				required:true,
				rangelength:[4,4],
			},
			txtMailPassword:{
				required:true,
				minlength:6,
			},
			txtMailConfirmPassword:{
				required:true,
				equalTo: "#txtMailPassword",
			}
		},
		messages: {
			txtMail: {
				required: "请输入邮箱",
				email:"邮箱格式不正确",
			},
			txtMailCode:{
				required:"请输入邮箱验证码",
				rangelength:"邮箱验证码不正确",
			},
			txtMailPassword:{
				required:"密码不能为空",
				minlength:"密码至少6位",
			},
			txtMailConfirmPassword:{
				required:"密码不能为空",
				equalTo: "两次密码不一致",
			}
			
		},
		errorElement: "em"
	});
}

function validMobileForm(){
	return $("#mobileForm").validate({
	rules:{
			txtMobile: {
				required:true,
				rangelength:[11,11],
				regex:/^1(3|4|5|7|8)\d{9}$/
			},
			txtMobileVerify:{
				required:true,
				rangelength:[4,4],
			},
			txtSmsCode:{
				required:true,
				rangelength:[4,4],
			},
			txtMobilePassword:{
				required:true,
				minlength:6,
			},
			txtMobileConfirmPassword:{
				required:true,
				equalTo: "#txtMobilePassword",
			}
		},
		messages: {
			txtMobile: {
				required: "请输入手机号",
				rangelength: "长度必须为11位",
				regex:"手机格式不正确",
			},
			txtMobileVerify:{
				required:"请输入图片验证码",
				rangelength:"验证码不正确",
			},
			txtSmsCode:{
				required:"请输入短信验证码",
				rangelength:"短信验证码不正确",
			},
			txtMobilePassword:{
				required:"密码不能为空",
				minlength:"密码至少6位",
			},
			txtMobileConfirmPassword:{
				required:"密码不能为空",
				equalTo: "两次密码不一致",
			}
			
		},
		errorElement: "em"
	});
}

jQuery.validator.addMethod("regex", function(value, element, param) {   
    var r = param;
    return r.test(value);
}, "填写不正确");

function mobile_initctrl(){
	refushVerifyByImgClass("verifyImg")
	$("#imgVerify").click(function(){
		refushVerifyByImgClass("verifyImg")
	})
	
	$("#getSmsCode").click(function(){
		if (false == verifyimag()) {
			return;
		}
		if (false == mobile_is_exist()) {
			$("#mobileErrMsg").text("手机号不存在！")
			return;
		}
		mobile_sendcode();
	})
	
	$("#btn-update-mobile").click(function(){
		mobile_update()
	})
}
function mobile_init(){
	$("#section-mail").hide();
	$("#section-mobile").show();
	
}

function mail_initctrl(){
	$("#getMailCode").click(function(){
		if (false == mail_is_exist()){
			$("#mailErrMsg").text("邮箱不存在！");
			return;
		}
		mail_sendcode();
	})
	
	$("#btn-update-mail").click(function(){
		mail_update()
	})
}

function mail_init(){
	$("#section-mail").show();
	$("#section-mobile").hide();

}

function mobile_is_exist(){
	var a = true;
    $.ajax({
        type: "POST",
        url: "/CXZKVIP/usermanage/register/do_isexisted",
        data: {MOBILE:$("#txtMobile").val(), PASSWORD:$("#txtMobilePassword").val(),smsCode:$("#txtSmsCode").val()},
        dataType: "json",
        success: function(data){
                   if (data.IsSuccess){
                	   a = true;
                   }else{
                	   a = false;
                   }
                 }
    });
    return a;
}

function mail_is_exist(){
	var a = true;
	$.ajax({
        type: "POST",
        async:false,
        url: "/CXZKVIP/usermanage/register/do_email_isexisted",
        data: {EMAIL:$("#txtMail").val()},
        dataType: "json",
        success: function(data){
            if (data.IsSuccess){
         	   a = true;
            }else{
         	   a = false;
            }
          }
    });
	return a;
}

function mobile_update(){
	if(!validMobileForm().form())
		return;
	
	$.ajax({
        type: "POST",
        async:false,
        url: "/CXZKVIP/usermanage/register/pass/do_update",
        data: {MOBILE:$("#txtMobile").val(), PASSWORD:$("#txtMobilePassword").val(),smsCode:$("#txtSmsCode").val(),type:"0"},
        dataType: "json",
        success: function(data){
                   if (data.IsSuccess){
                	   window.location.href="/CXZKVIP/main/index?rnd="+Math.random(); 
                   }else{
                	   $("#mobileErrMsg").text("短信验证码不正确");
                   }
                 }
    });
}



function mail_update(){
	if(!validMailForm().form())
		return;
	
	$.ajax({
        type: "POST",
        url: "/CXZKVIP/usermanage/register/pass/do_update",
        data: {EMAIL:$("#txtMail").val(), PASSWORD:$("#txtMailPassword").val(),smsCode:$("#txtMailCode").val(),type:"1"},
        dataType: "json",
        success: function(data){
                   if (data.IsSuccess){
                	   window.location.href="/CXZKVIP/main/index?rnd="+Math.random(); 
                   }else{
                	   $("#mailErrMsg").text("邮箱验证码不正确");
                   }
                 }
    });
}

function mobile_sendcode(){
	
	if (mobileSecond > 0){
		return false;
	}
	$.ajax({
        type: "GET",
        url: "/CXZKVIP/usermanage/register/do_sendsms",
        data: {MOBILE:$("#txtMobile").val(), "rand":$("#txtMobileVerify").val()},
        dataType: "json",
        success: function(data){
                   if (data.IsSuccess){
                	   $("#mobileErrMsg").text("");
                       mobileSecond = 120;
                       updateSendMobileStatus();
                       return true;
                   }else{
                	   $("#mobileErrMsg").text("验证码不正确");
                	   return false;
                   }
                 }
    });
}

function mail_sendcode(){
	if (mailSecond > 0) {
		return;
	}
	$.ajax({
	        type: "GET",
	        url: "/CXZKVIP/usermanage/register/do_sendEmail",
	        data: {EMAIL:$("#txtMail").val()},
	        dataType: "json",
	        success: function(data){
	                   if (data.IsSuccess){
	                	   $("#mailErrMsg").text("");
	                	   mailSecond = 120;
	                       updateSendMailStatus();
	                   }else{
	                	   $("#mailErrMsg").text(a.Message);
	                   }
	                 }
	    });
}


function updateSendMailStatus() {
    if (mailSecond < 1) {
        $("#getMailCode").text("重新发送")
    } else {
        $("#getMailCode").text(mailSecond + "秒后重新发送");
        mailSecond--;
        setTimeout(updateSendMailStatus, 1000)
    }
}

function updateSendMobileStatus() {
    if (mobileSecond < 1) {
        $("#getSmsCode").text("重新发送")
    } else {
        $("#getSmsCode").text(mobileSecond + "秒后重新发送");
        mobileSecond--;
        setTimeout(updateSendMobileStatus, 1000)
    }
}

function verifyimag() {
	    $.ajax({
	        type: "GET",
	        url: "/CXZKVIP/usermanage/register/do_verify",
	        data: {rand:$("#txtMobileVerify").val()},
	        dataType: "json",
	        success: function(data){
	                   if (data.IsSuccess){
	                	   $("#mobileErrMsg").text("");
	                	   return true;
	                   }else{
	                	   $("#mobileErrMsg").text(a.Message);
	                	   return false;
	                   }
	                 }
	    });
}

function refushVerifyByImgClass(a) {
    var b = "usermanage/register/rand?ts=" + Math.random();
    $("img[class='" + a + "']").attr("src", b);

}

