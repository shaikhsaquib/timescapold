function logoutUser() {
	
	$.ajax({
		type : 'POST',
		url : "/pw2/LogOutController",
		data : '',
		dataType : 'json',
		success : OnlogOut,
		error:OnlogOut
	});
}

function OnlogOut() {
	window.location = "login.jsp";
}

$(document).ready(function(){
	$('body').addClass('desktop_bg');
	$('.cart').click(function(){
		$("#cart_modal").show();
		$.ajax({
		        url: '/pw2/viewCart.jsp',
		        type: 'POST', 	       
		        success: function (response) {
		        	$("#accordion").html(response);
		        }
	 	 });
	 });
	
	 $('.close').click(function(){
			$("#cart_modal").hide();
	 });
});
