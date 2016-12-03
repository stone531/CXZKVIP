$().ready(function(){
	
	$("#user_detail_info").validate();
	
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
		$("#user_detail_info").submit();
	});
	
	$("#btn-pass-update").click(function(){
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
	$("#CMOBILE,#BANKCARD,#CARDID,#EMAIL,#COMPNAME,#COMNUM,#PHONE,#NICKNAME,#SCORE,#WECHAT,#ADDRESS,#REALNAME").attr("readonly","readonly");
};

function updatepass(){
	
	if ($("#PASS").val()!=$("#RePASS").val()){
		 $("#memberErrMsg").text("两次密码输入不一致");
		 return;
	}
	
	$.ajax({
        type: "POST",
        async:false,
        url: "/CXZKVIP/usermanage/personal/do_updatepass",
        data: {USERMANAGE_ID:getCookie('id'), PREPASSWORD:$("#PrePASS").val(),PASSWORD:$("#RePASS").val()},
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