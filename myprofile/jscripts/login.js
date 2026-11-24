function fnFormAction(){

	var txtEmailId = $('#txtEmailId1').val();
	var password = $('#txtPassword1').val();
	var varSubmit = $('#btnSubmit1').val();
	var varAmount = $('#txAmount1').val();
	var varpremiumamt = $('#txpremiumamt1').val();

	//alert("Ji"+txtEmailId);
	
	if($('#trPassword1').is(':visible') && (password==null || password=="")) {
		alert("Kindly enter the Password!");
		$('#txtPassword1').focus();
		return false;
	}

	password = encodeURIComponent(password);	
	if (varSubmit=="Submit") {
		//fnOnBlur();
		var random = Math.random();
		if(password != ''){
			$("#divAuthMessage").show();
			loadURL("loginSubmit.jsp?userName="+txtEmailId+"&random="+random+"&userPassword="+password, "divAuthMessage", "Authenticating..");
			//$("#dispEmailId").val(txtEmailId);
		} else {
			$("#divAuthMessage").hide();
		}

	} 
} 

function fnOnBlur() {

	var email = $.trim($('#txtEmailId1').val());
	var password = $.trim($('#txtPassword1').val());
	
	password = encodeURIComponent(password);
	var random = Math.random();

	if(password != ''){
		$("#divAuthMessage").show();

		loadURL("loginSubmit.jsp?userName="+email+"&random="+random+"&userPassword="+password, "divAuthMessage", "Validating data...");
		$("#dispEmailId").val(email);
	} else {

		$("#divAuthMessage").hide();

	}
}

function fnFormReset(){
	$("#divAuthMessage").hide();
	$('#txtPassword1').val("");
}

function loadURL(fragment_url, element_id, for_what){
	
	var xmlhttp = "";
	var varAmount = $('#amount').val();
	var varpremiumamt = $('#premiumamt').val();

	if (window.XMLHttpRequest){ // code for Mozilla, etc.
        xmlhttp=new XMLHttpRequest();
    }else if (window.ActiveXObject){ // code for IE
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");

    }else{
        alert("Sorry Your Browser is not Supported");
    }
	
	var element = document.getElementById(element_id);
	
	var message = for_what;
	element.innerHTML = message;

	try {

       	xmlhttp.open("POST", fragment_url);
	    xmlhttp.onreadystatechange = function() {		
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var text = xmlhttp.responseText;
				
				text = $.trim(text).replace("<br><br>", "");
				text = text.replace(/[^a-zA-Z 0-9]+/g,'');
				text = text.replace(/^\s+|\s+$/g,'');
				
				//alert($.trim(text));

				if($.trim(text)=='Authentication Successful'){
					$("#divAuthTickSucc").show();
					$("#divAuthTickFail").hide();
					$("#divAuthMessage").show().html(text);

					//loadURL("approvalsUpdated.jsp", "divAuthMessage", "Submitting Data...");
					val = confirm("Do You really want to Submit the Top Up of Amount Rs."+varAmount +" and Premium of Rs."+varpremiumamt);
					if (val)
					{
						$("#divAuthMessage").show();
						loadURL("approvalsUpdated.jsp", "divAuthMessage", "Submitting Data...");
						$("#btnSubmit1").val("Close");			
					}
					//submitOnConfirm();
					
				} else if($.trim(text)=='Authentication Failed'){
					//alert("am in ajax else");
					$("#divAuthMessage").show().html(text);
					$("#divAuthTickSucc").hide();
					$("#divAuthTickFail").show();

				}else if($.trim(text) =="already done"){
					$("#divAuthMessage").show().html("<br>You have already applied for Volentary Top Up Amount.<br>For any updation in Top Up Amount,<br>kindly connect with HR Department.").addClass("text-center");
					$("#btnSubmit1").val("Close");
				}else if($.trim(text) =="true"){
					$("#divAuthMessage").show().html("<br>You have successfully applied for Volentary Top Up Amount.");
					$("#btnSubmit1").val("Close");
				}else if($.trim(text) =="false"){
					$("#divAuthMessage").show().html("<br>Oops!! There was an error while submitting your request.");
					$("#btnSubmit1").val("Close");
				}else{
					submitOnConfirm();
				}			

			 }
		}
	xmlhttp.send(null);
	 } catch (e) {
		 alert("Can't connect to server:\n" + e.toString());
	 }
}

function submitOnConfirm(){
	var varAmount = $('#amount').val();
	var varpremiumamt = $('#premiumamt').val();
	//var txtEmailId = $('#txtEmailId1').val();

	val = confirm("Do You really want to Submit the Top Up of Amount Rs."+varAmount +" and Premium of Rs."+varpremiumamt);
	if (val)
	{
		$("#divAuthMessage").show();
		loadURL("approvalsUpdated.jsp", "divAuthMessage", "Submitting Data...");
		$("#btnSubmit1").val("Close");			
	}

}

function loadURL2(fragment_url, element_id, for_what){
	var xmlhttp = "";
    if (window.XMLHttpRequest){ // code for Mozilla, etc.
        xmlhttp=new XMLHttpRequest();
    }else if (window.ActiveXObject){ // code for IE
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		//alert("xmlhttp---"+xmlhttp);
    }else{
        alert("Sorry Your Browser is not Supported");
    }
	
	var element = document.getElementById(element_id);
	
	var message = for_what;
	
	element.innerHTML = "<br><br>"+message;

	try {
		//alert("yyy");
       	xmlhttp.open("POST", fragment_url);
		//alert("xmlhttp.readyState---"+xmlhttp.readyState);
		//alert("xmlhttp.status---"+xmlhttp.status);
        xmlhttp.onreadystatechange = function() {		
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var text = xmlhttp.responseText;
				text = $.trim(text).replace("<br><br>", "");
				text = text.replace(/[^a-zA-Z 0-9]+/g,'');
				text = text.replace(/^\s+|\s+$/g,'');	
				
				//alert($.trim(text));
				
				if($.trim(text)=='Authentication Successful'){
					$("#tramount1").show();
					$("#trpremiumamt1").show();
					$("#btnSubmit1").val("Submit");
					$("#trPassword1").hide();
				$("#tremailId1").hide();
					
				} else {
					//alert("Please enter valid Password");
					$("#tramount1").hide();
					$("#trpremiumamt1").hide();
				}
				
				var message = xmlhttp.responseText;
				element.innerHTML = message;
			 }
		}
		xmlhttp.send(null);
	 } catch (e) {
		 alert("Can't connect to server:\n" + e.toString());
	 }
}