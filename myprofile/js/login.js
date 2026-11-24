$(document).ready(function(){
	$('body').addClass('desktop_bg');
	//Form Group
	$('.form-control').on('focus blur', function (e) {
	    $(this).parents('.form-group').toggleClass('focused', (e.type === 'focus' || this.value.length > 0));
	}).trigger('blur');	
	//Count height of screen
});	

var errorEmailMessage = "Please Enter your Email ID";
function echeck(str) {

	var at = "@";
	var dot = ".";
	var lat = str.indexOf(at);
	var lstr = str.length;
	var ldot = str.indexOf(dot);
	//var domainName=str.slice((lat+1),lstr);
	if (str.indexOf(at) == -1) {
		$('#errorMsg').show();
		$('#errorMsg').html('Invalid E-mail ID');
		$('#userid').focus();
	}
	
	if (str.indexOf(at) == -1 || str.indexOf(at) == 0
			|| str.indexOf(at) == lstr) {
		$('#errorMsg').show();
		$('#errorMsg').html('Invalid E-mail ID');
		$('#userid').focus();
	}
	
	if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0
			|| str.indexOf(dot) == lstr) {
		$('#errorMsg').show();
		$('#errorMsg').html('Invalid E-mail ID');
		$('#userid').focus();
		return false;
		//alert("Invalid E-mail ID");
	}
	
	if (str.indexOf(at, (lat + 1)) != -1) {
		$('#errorMsg').show();
		$('#errorMsg').html('Invalid E-mail ID');
		$('#userid').focus();
		return false;
		//alert("Invalid E-mail ID");
	}
	
	if (str.substring(lat - 1, lat) == dot
			|| str.substring(lat + 1, lat + 2) == dot) {
		$('#errorMsg').show();
		$('#errorMsg').html('Invalid E-mail ID');
		$('#userid').focus();
		return false;
		//alert("Invalid E-mail ID");
	}
	
	if (str.indexOf(dot, (lat + 2)) == -1) {
		$('#errorMsg').show();
		$('#errorMsg').html('Invalid E-mail ID');
		$('#userid').focus();
		return false;
		//alert("Invalid E-mail ID");
	}
	
	if (str.indexOf(" ") != -1) {
		$('#errorMsg').show();
		$('#errorMsg').html('Invalid E-mail ID');
		$('#userid').focus();
		return false;
		//alert("Invalid E-mail ID");
	}
	return true;
}

function ValidateForm() {
	
	var emailID = $('#userid').val();   //document.getElementById("userid").value;
	if ((emailID == null) || (emailID == "")) {
		//alert("Please Enter your Email ID");
		$('#errorMsg').show();
		$('#errorMsg').html('Please enter your E-mail ID');
		$('#userid').focus();
		return false;
	}
	if (echeck(emailID) == false) {
		//emailID.value = "";
		//emailID.focus();
		return false;
	}
	var pass = $('#pass').val();  //document.getElementById("pass").value;
	if ((pass == null) || (pass == "")) {
		$('#errorMsg').show();
		$('#errorMsg').html('Password can not be blank');
		$('#pass').focus();
		return false;
	}
	return true;
}