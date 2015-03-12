

$(function(){
	
	
	$("#SelectTit").children("span").click(function(e){
		e.stopPropagation();
		$(this).find("div").toggleClass("hide");
	});
	$(document).click(function(){
//		if(!$("#SelectTit span div").hasClass("hide")){
//		   $("#SelectTit span div").addClass("hide");
//		}
		$("#SelectTit span div").addClass("hide");
	});
	
	
	
});