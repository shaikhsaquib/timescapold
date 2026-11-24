function confirmRequest( ){

	frmObj = document.frmPreview;
	compCode = frmObj.compCode.value;

	if(compCode == "1003" || compCode == "1024" || compCode == "1026" || compCode == "1032" || compCode == "1027"  || compCode == "1030" || compCode == "1036" || compCode == "1049"){

		var backDesignValue =	frmObj.backDesign.value;
		//alert("backDesignValue --> "+backDesignValue);
		if (backDesignValue == "NA")
		{	
			alert("Please Select the Back Design Template");
			return;
		}
	}else if (compCode == "1028")
		{
			frmObj.backDesign.value = "b4";
	
	}else if (compCode == "1029")
		{
			frmObj.backDesign.value = "b5";
	}else if (compCode == "1025")
		{
			frmObj.backDesign.value = "b6";
	}else if (compCode == "1031")
		{
			frmObj.backDesign.value = "b6";
		}
	else if (compCode == "1000")
		{
			frmObj.backDesign.value = "TGBG";
		}
		else if (compCode == "1007")
		{
			//alert("test");
			frmObj.backDesign.value = "b7";
		}
	
		
		

	var cardTemplate = frmObj.cardTemplate.options[frmObj.cardTemplate.selectedIndex].value;

	/*--------------Card Template check begins--------------*/
	/*
		Checks on Card Template
		1) It should not be null
	*/
	//alert(cardTemplate);
	//stat = checkNull("Card Template ", cardTemplate);
//	alert(stat);
	if(!stat){
		frmObj.cardTemplate.focus( );
		return;
	}
/*--------------Card Template check ends--------------*/

	val = confirm("Do you wish to file this requisition for Business Cards ? ");

	if(val){
		
		frmObj.action="../requestor/requestCardSubmit.jsp"
		frmObj.submit( );
	}else{
		return;
	}
}


function showCardDesign(firstName, lastName, designation, activityName, addressLine1, addressLine2, directPhoneNo, fax, mobileNumber, userBoardNumber, extensionNumber, workArea, compName, website, emailId) {
	
	frmObj = document.frmPreview;
	cardTemplate = frmObj.cardTemplate.value;
	// alert(cardTemplate);     
	stat = checkNull("Card Template ", cardTemplate);
	if (!stat) {
		frmObj.cardTemplate.focus();
		return;
	}
	if (cardTemplate == "NBTL") {
		//alert(cardTemplate);
		document.getElementById("add").style.display = "";
	} else {
		document.getElementById("add").style.display = "none";
	}
	lastName = frmObj.lastName.value; ///taking the hidden value for passing to next jsp
	activityName = frmObj.activityName.value; ///taking the hidden value for passing to next jsp
	loadFragment("../includes/cardTemplate.jsp?cardTemplate=" + cardTemplate + "&firstName=" + firstName + "&lastName=" + lastName + "&designation=" + designation + "&activityName=" + activityName + "&addressLine1=" + addressLine1 + "&addressLine2=" + addressLine2 + "&directPhoneNo=" + directPhoneNo + "&fax=" + fax + "&mobileNumber=" + mobileNumber + "&userBoardNumber=" + userBoardNumber + "&extensionNumber=" + extensionNumber + "&workArea=" + workArea + "&compName=" + compName + "&website=" + website + '&emailId=' + emailId, "Card-Area", "Business Card");
	if (cardTemplate == "LH") {
		document.getElementById("CardBack-Area-Default").style.display = "none";
	}
	if (cardTemplate == "TCLL" || cardTemplate == "TCL" || cardTemplate == "TML" || cardTemplate == "TMDT" || cardTemplate == "TG" || cardTemplate == "TGR" || cardTemplate == "BE" || cardTemplate == "SB" || cardTemplate == "BS" || cardTemplate == "BC" || cardTemplate == "WWM" ) {

		document.getElementById("CardBack-Area-Default").style.display = "";
		loadFragment('../includes/default.jsp?cardTemplate=' + cardTemplate + '&addressLine1=' + addressLine1 + '&addressLine2=' + addressLine2 + '&directPhoneNo=' + directPhoneNo + '&fax=' + fax + '&userBoardNumber=' + userBoardNumber + '&extensionNumber=' + extensionNumber + '&website=' + website + '&firstName=' + firstName + '&lastName=' + lastName + '&designation=' + designation + '&workArea=' + workArea + '&mobileNumber=' + mobileNumber + '&compName=' + compName + '&emailId=' + emailId, 'CardBack-Area-Default', 'Business Card');
	}
}

function loadFragment(fragment_url, element_id, for_what){
    var xmlhttp = "";
    if (window.XMLHttpRequest){
        // code for Mozilla, etc.
        xmlhttp=new XMLHttpRequest();
    }else if (window.ActiveXObject){ 
        // code for IE
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }else{
        alert("Sorry Your Browser is not Supported");
    }
    
    var element = document.getElementById(element_id);
    
    var message = "";
    var processingRequest='<table width="100%" border="1"><tr><td align="center"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+' Loading...</td></tr></table>';
        
    element.innerHTML = processingRequest;

    try{
        xmlhttp.open("GET", fragment_url);
        xmlhttp.onreadystatechange = function(){

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
                var gotresponse	=	xmlhttp.responseText;
                
				message =  gotresponse;
                   
                element.innerHTML = message;
             }
		}
		xmlhttp.send(null);
	 }// display an error in case of failure
	 catch (e){
	  alert("Can't connect to server:\n" + e.toString());
	 }
}

	function submitTemplate(compCode){

	frmObj = document.frmPreview;
	var backDesignValue = "";
	var backDesign = "";
	
	
	//var selection = document.frmBackDesign.radioGroup;
	var selection = document.getElementsByName('radioGroup');
	//console.log("selection -> "+document.getElementsByName('radioGroup')[0]);

	for (i=0; i<selection.length; i++)
		{
	  if (selection[i].checked == true)
		{
			//alert( selection[i].value );
			radioValue=selection[i].value;
			break;
		}
	}

	var b1="";
	var b2="";
	var b3="";
	var b4="";
	/*var fr="";
	var tc="";
	var cb="";
	var do1="";
	var dc="";
	var bs="";
	var dw="";
	var dp="";
	var db="";
	var lg="";

	if (radioValue== 'FlamingRed1.jpg')
	{
		backDesignValue = "fr";
	}else if (radioValue == 'TILcorporate1.jpg')
	{
		backDesignValue = "tc";
	}else if (radioValue == 'CorporateBlue1.jpg')
	{
		backDesignValue = "cb";
	}else if (radioValue == 'DigitalOrange1.jpg')
	{
		backDesignValue = "do1";
	}else if (radioValue == 'DigitalCells1.jpg')
	{
		backDesignValue = "dc";
	}else if (radioValue == 'BlueStripes1.jpg')
	{
		backDesignValue = "bs";
	}else if (radioValue == 'DigitalWave1.jpg')
	{
		backDesignValue = "dw";
	}else if (radioValue == 'DigitalPink1.jpg')
	{
		backDesignValue = "dp";
	}else if (radioValue == 'DigitalBlue1.jpg')
	{
		backDesignValue = "db";
	}else if (radioValue == 'LeafGreens1.jpg')
	{
		backDesignValue = "lg";
	}*/
		//alert(backDesignValue);

	if (radioValue== 'NewBackSide-1.jpg')
	{
		backDesignValue = "b1";
	}else if (radioValue == 'NewBackSide-2.jpg')
	{
		backDesignValue = "b2";
	}else if (radioValue == 'NewBackSide-3.jpg')
	{
		backDesignValue = "b3";
	}else if(radioValue == 'NewBackside-Option1.jpg'){
		backDesignValue = "b8";
	}else if(radioValue == 'NewBackside-Option2.jpg'){
		backDesignValue = "b9";
	}else if(radioValue == 'MX-Back.jpg'){
		backDesignValue = "b10";
	}


	self.opener.document.getElementById("CardBack-Area").style.display = "";
	self.opener.document.getElementById('CardBack-Area').innerHTML="<table width='394' height='238' cellpadding='0' cellspacing='0' border='1'><tr><td><img width = '394' height = '238' src='../images/"+radioValue+" '></td></tr></table>";
	//field.value = radioValue;
	//self.opener.document.getElementById('backDesign').value = backDesignValue;
	self.opener.frmObj.backDesign.value = backDesignValue;
	
	//showbackDesign();
	window.close();

	}

	/*function showbackDesign() {
		frmObj = document.frmPreview;
		loadFragment('../includes/showBackDesign.jsp?designValue='+radioValue,'CardBack-Area','Business Card');

	}*/