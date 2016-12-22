$().ready(function(){
	$(validForm())
	$("#comp-sub").click(function(){
		if(!validForm().form())
			return;
		$("#company-valid-form").submit();
	});
	
})

jQuery.validator.addMethod("regex", function(value, element, param) {   
    var r = param;
    return r.test(value);
}, "填写不正确");

function validForm(){
	return $("#company-valid-form").validate({
		rules:{
			NICKNAME: {
				required:true,
				rangelength:[3,8],
			},
			COMPNAME:{
				required:true,
			},
			COMPNUM:{
				required:true
			},
			REALNAME:{
				required:true,
				rangelength:[2,8],
				regex:/[^\u0000-\u00FF]/,
			},
			ADDRESS:{
				required:true
			},
			PIC:{
				required:true
			},
			EMAIL:{
				email:true
			}
		},
		messages: {
			NICKNAME: {
				required: "请输入昵称",
				rangelength: "长度必须为3-8位字符",
			},
			COMPNAME:{
				required:"请输入公司名称",
			},
			COMPNUM:{
				required:"请输入营业执照"
			},
			REALNAME:{
				required:"请输入真实姓名",
				rangelength:"长度不正确",
				regex:"格式不正确"
			},
			ADDRESS:{
				required:"请输入公司地址"
			},
			PIC:{
				required:"请选择图片"
			},
			EMAIL:{
				email:"邮箱格式不正确"
			}
			
		},
		errorElement: "em"
	});
}