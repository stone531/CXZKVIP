//处理理赔进度查询用户卡号输入框获得焦点事件
function CnOnFocus(el) {
    if (el.value == "用户卡号") {
        el.style.color = "black";
        el.value = "";
    }
}

//处理理赔进度查询用户卡号输入框失去焦点事件
function CnOnBlur(el) {
    if (el.value == "") {
        el.style.color = "#e6e6e6";
        el.value = "用户卡号";
    }
}

//处理理赔进度查询密码输入框获得焦点事件
function CpOnFocus(el) {
    if (el.value == "密码") {
        el.style.color = "black";
        el.value = "";
    }
}

//处理理赔进度查询出险人证件号输入框失去焦点事件
function CpOnBlur(el) {
    if (el.value == "") {
        el.style.color = "#e6e6e6";
        el.value = "密码";
    }
}

//处理理赔进度查询保单号输入框获得焦点事件
function PnOnFocus(el) {
    if (el.value == "保单号") {
        el.style.color = "black";
        el.value = "";
    }
}

//处理理赔进度查询保单号输入框失去焦点事件
function PnOnBlur(el) {
    if (el.value == "") {
        el.style.color = "#e6e6e6";
        el.value = "保单号";
    }
}


//查询理赔进度
function searchClaimschedule() {
    if ($("#CARDNO").val() == "" || $("#CARDNO").val() == "用户卡号") {
        alert("请输入用户卡号");
        return false;
    }

    if ($("#CARDPASSWD").val() == "" || $("#CARDPASSWD").val() == "密码") {
        alert("请输入密码");
        return false;
    }
    
    if ($("#CARDNO").val() == "" || $("#CARDNO").val() == "用户卡号") {
        alert("请输入用户卡号");
        return false;
    }

    if ($("#POLICYNO").val() == "" || $("#POLICYNO").val() == "保单号") {
        alert("请输入保单号");
        return false;
    }

    $("#formSearch").submit();
}