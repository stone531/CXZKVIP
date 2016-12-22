$().ready(function(){
	
	$(validForm());
	$(validPassForm());
	
	initHide();
	
	$("li[id='li-info']").click(function(){
		if ($("#Comp-UserType").val()=="0"){
			showPersonal();
		}else {
			showCompnay();
		}
	});
	$("li[id='li-pass']").click(function(){
		showUpdatePass();
	});
	$("#save").click(function(){
		if(!validForm().form())
			return;
		$("#user_detail_info").submit();
	});
	
	$("#cancel").click(function(){
		if ($("#Comp-UserType").val()=="0"){
			showPersonal();
		}else {
			showCompnay();
		}
	});
	
	$("#btn-pass-update").click(function(){
		if(!validPassForm().form())
			return;
		updatepass();
	}
	);
});

function showUpdatePass(){
	$("#personal_info").hide();
	$("#pass-update").show();
	$("#welcome").hide();
	$("#company-info").hide();
}
function showPersonal() {
	$("#personal_info").show();
	$("#company-info").hide();
	$("#pass-update").hide();
	$("#welcome").hide();
	setPersonReadOnly();
}
function showCompnay(){
	$("#personal_info").hide();
	$("#company-info").show();
	$("#pass-update").hide();
	$("#welcome").hide();
	setCompnayReadOnly();
	if ($("#Comp-UserType").val()=="3") {
		$("#notify-msg").text("资料审核中");
	}
}

function initHide(){
	$("#personal_info").hide();
	$("#pass-update").hide();
	$("#company-info").hide();
	$("#welcome").show();
	setCompnayReadOnly();
	setPersonReadOnly();
}

function goEdit(){
	$("#BANKCARD,#CARDID,#EMAIL,#NICKNAME,#WECHAT,#ADDRESS,#REALNAME").removeAttr("readonly");
	$("#edit").hide();
	$("#save").show();
	$("#cancel").show();
};

function setPersonReadOnly(){
	$("#MOBILE,#BANKCARD,#CARDID,#EMAIL,#NICKNAME,#SCORE,#WECHAT,#ADDRESS,#REALNAME").attr("readonly","readonly");
	$("#edit").show();
	$("#save").hide();
	$("#cancel").hide();
};

function setCompnayReadOnly(){
	$("#CMOBILE,#BANKCARD,#CARDID,#EMAIL,#COMPNAME,#COMPNUM,#PHONE,#NICKNAME,#SCORE,#WECHAT,#ADDRESS,#REALNAME").attr("readonly","readonly");
};

function updatepass(){
	
	var uid = getCookie('id');
	
	if (uid==''){
		alert("cookies 超时");
		return;
	}
		
	$.ajax({
        type: "POST",
        async:false,
        url: "/CXZKVIP/usermanage/personal/do_updatepass",
        data: {USERMANAGE_ID:uid, PREPASSWORD:$("#PrePASS").val(),PASSWORD:$("#PASS").val()},
        dataType: "json",
        success: function(data){
                   if (data.IsSuccess == 1){
                	   window.location.href="/CXZKVIP/usermanage/show/result?IsSuccess=1"; 
                   }else if (data.IsSuccess == 2){
                	   $("#memberErrMsg").text("密码不正确");
                   }
                 }
    });
};

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

jQuery.validator.addMethod("regex", function(value, element, param) {   
    var r = param;
    return r.test(value);
}, "填写不正确");

function validForm(){
	return $("#user_detail_info").validate({
		rules:{
			NICKNAME: {
				required:true,
				rangelength:[3,8],
			},
			REALNAME:{
				required:true,
				rangelength:[2,8],
				regex:/[^\u0000-\u00FF]/,
			},
			EMAIL:{
				email:true
			},
			CARDID:{
				required:true,
				rangelength:[15,18],
				regex:/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,
			},
			BANKCARD:{
				required:true,
				minlength:10,
				regex:/[0-9]$/,
			}
		},
		messages: {
			NICKNAME: {
				required: "请输入昵称",
				rangelength: "长度必须为3-8位字符",
			},
			REALNAME:{
				required:"请输入真实姓名",
				rangelength:"长度不正确",
				regex:"格式不正确"
			},
			EMAIL:{
				email:"邮箱格式不正确"
			},
			CARDID:{
				required:"请输入证件号",
				rangelength:"长度不正确",
				regex:"身份证格式不正确",
			},
			BANKCARD:{
				required:"请输入银行卡号",
				minlength:"长度不正确",
				regex:"格式不正确",
			}
			
		},
		errorElement: "em"
	});
}

function validPassForm(){
	return $("#pass_form").validate({
		rules:{
			PrePASS:{
				required:true,
				minlength:6
			},
			PASS:{
				required:true,
				minlength:6
			},
			RePASS:{
				required:true,
				equalTo:"#PASS"
			}
		},
		messages: {
			PrePASS:{
				required:"请输入原密码",
				minlength:"密码长度不少于6"
			},
			PASS:{
				required:"请输入原密码",
				minlength:"密码长度不少于6"
			},
			RePASS:{
				required:"请输入确认密码",
				equalTo:"两次密码不同"
			}
		},
		errorElement: "em"
	});
}

