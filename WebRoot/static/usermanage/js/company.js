$().ready(function(){
	$("#company-valid-form").validate();
	
	$("#comp-sub").click(function(){
		$("#company-valid-form").submit();
	});
	
})