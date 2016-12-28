var mobileSecond = 0;

$().ready(function() {
	
	mobile_initctrl();
	
	$(validMobileForm());
  
});


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
		if (true == mobile_is_exist()) {
			$("#mobileErrMsg").text("手机号已存在！");
			return;
		}
		mobile_sendcode();
	})
	
	$("#btn-update-mobile").click(function(){
		mobile_update();
	});
	$("#btn-update-cancel").click(function(){
		window.location.href="/CXZKVIP/usermanage/personal/show?rand=" + Math.random();
	});
}

function mobile_is_exist(){
	var a = true;
    $.ajax({
        type: "POST",
        async:false,
        url: "/CXZKVIP/usermanage/register/do_isexisted",
        data: {MOBILE:$("#txtMobile").val()},
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
	
	var uid = getCookie('id');
	
	if (uid==''){
		alert("cookies 超时，请重新登陆！");
		return;
	}
	
	$.ajax({
        type: "POST",
        async:false,
        url: "/CXZKVIP/usermanage/register/mobile/do_update",
        data: {MOBILE:$("#txtMobile").val(), USERMANAGE_ID:uid,smsCode:$("#txtSmsCode").val()},
        dataType: "json",
        success: function(data){
                   if (data.IsSuccess){
                	   window.location.href="/CXZKVIP/usermanage/show/result?IsSuccess=1"; 
                   }else{
                	   $("#mobileErrMsg").text("短信验证码不正确");
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
        async:false,
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
	        async:false,
	        url: "/CXZKVIP/usermanage/register/do_verify",
	        data: {rand:$("#txtMobileVerify").val()},
	        dataType: "json",
	        success: function(data){
	                   if (data.IsSuccess){
	                	   $("#mobileErrMsg").text("");
	                	   return true;
	                   }else{
	                	   $("#mobileErrMsg").text("验证码不正确");
	                	   return false;
	                   }
	                 }
	    });
}

function refushVerifyByImgClass(a) {
    var b = "usermanage/register/rand?ts=" + Math.random();
    $("img[class='" + a + "']").attr("src", b);

}
function getCookie(objName){
    var arrStr = document.cookie.split("; ");    
    for(var i = 0;i < arrStr.length;i ++){      
        var temp = arrStr[i].split("=");    
        if(temp[0] == objName){  
            if(temp.length>1){  
                return unescape(temp[1]);  
            }else{  
                return "";  
            }  
        };    
    }     
    return "";  
}  

