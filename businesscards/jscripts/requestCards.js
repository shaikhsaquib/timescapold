function validate(compCode){

    frmObj = document.frmRequestCards;

	// Declaration of junk variables
	var nameJunk = "@!~+%<>?`;:#$%^&*()=|[]{}\\";

	// Fetching the data from the form
	var firstName			= Trim(frmObj.firstName.value);
	var lastName			= Trim(frmObj.lastName.value);
	var emailId				= Trim(frmObj.emailId.value);
	var activityCode		= Trim(frmObj.activityName.value);
	var designation			= Trim(frmObj.designation.value);
	var department			= Trim(frmObj.department.value);
	var workArea			= Trim(frmObj.workArea.value);

	var approverEmailId     = frmObj.approverEmailId.options[frmObj.approverEmailId.selectedIndex].value;

	// compCode			= frmObj.compCode.value;
/*--------------Name check begins--------------*/
	/*
		Checks on Name
		1) It should not be null
		2) It should be 45 characters max
		3) It should not contain junk characters
	*/
	//alert(compCode);
	stat = checkNull("First Name ", firstName);

	if(!stat){
		frmObj.firstName.focus();
		return;
	}

	stat = checkMaxLength("First Name ", firstName, 45);

	if(!stat){
		frmObj.firstName.focus();
		return;
	}

	stat = checkNull("Last Name ", lastName);

	if(!stat){
		frmObj.lastName.focus();
		return;
	}

	stat = checkMaxLength("Last Name ", lastName, 45);

	if(!stat){
		frmObj.lastName.focus();
		return;
	}

/*--------------Name check ends--------------*/

/*--------------Designation check begins--------------*/
	/*
		Checks on Designation
		1) It should not be null
	*/
	stat = checkNull("Designation ",designation);
	if(!stat){
		frmObj.designation.focus();
		return;
	}
/*--------------Designation check ends--------------*/

/*--------------Department check begins--------------*/
	/*
		Checks on Department
		1) It should not be null
	*/
	stat = checkNull("Department ",department);
	if(!stat){
		frmObj.department.focus();
		return;
	}
/*--------------Department check ends--------------*/

/*--------------Work Area check begins--------------*/
	/*
		Checks on Work Area
		1) It should not be null
		2) It should not be greater than 40 chars
	*/
	stat = checkNull("Work Area ",workArea);
	if(!stat){
		frmObj.workArea.focus();
		return;
	}
/*--------------Work Area check ends--------------*/


	var directNo = frmObj.directPhoneNo.value;
	var countryCode = directNo.substring(0,directNo.indexOf("-"));
	var regionCode = directNo.substring(directNo.indexOf("-")+1);

	if ((countryCode == null) || (countryCode== "") || (countryCode =="0") || regionCode.indexOf("-")==-1)
	{
		alert("Please update your Board Number with Country and Region Code. \nUse Update Contact Link for the same.");
		frmObj.directPhoneNo.focus();
		return;
	}


	var boardNo = frmObj.userBoardNumber.value;
	var countryCode = boardNo.substring(0,boardNo.indexOf("-"));
	var regionCode = boardNo.substring(boardNo.indexOf("-")+1);

	if ((countryCode == null) || (countryCode== "") || (countryCode =="0") || regionCode.indexOf("-")==-1)
	{
		alert("Please update your Board Number with Country and Region Code. \nUse Update Contact Link for the same.");
		return;
	}
//commented on 25062015

	if (compCode == '1000')
	{
		var faxNo = 'NA';
	}else
	{
		var faxNo = frmObj.fax.value;
		if(faxNo == null || faxNo == "")
		{
			alert("Please update your Fax Number.");
			return;
		}
		var countryCode = faxNo.substring(0,faxNo.indexOf("-"));
		var regionCode = faxNo.substring(faxNo.indexOf("-")+1);
	}


//commented on 25062015
	/*if ((countryCode == null) || (countryCode== "") || (countryCode =="0") || regionCode.indexOf("-")==-1)
	{
		alert("Please update your Fax Number with Country and Region Code. \nUse Update Contact Link for the same.");
		return;
	}*/

/*--------------Personal Belief check begins--------------*/
	/*
		Checks on personalBelief
		1) It should not be null
	*/
	/*personalBeliefDropdn = frmObj.personalBeliefDropdn.value;
	personalBelief = Trim(frmObj.personalBelief.value);
	
	if(personalBeliefDropdn==0 && personalBelief==""){
		alert("Please select your Personal Belief!");
		frmObj.personalBelief.value='';
		frmObj.personalBeliefDropdn.focus( );
		return;
	}else if(personalBeliefDropdn!=0 && personalBelief!=""){
		alert("Please select only one option for Personal Belief!");
		frmObj.personalBeliefDropdn.focus( );
		return;
	}*/

/*--------------Personal Belief check ends--------------*/


/*--------------Approver Email ID check begins--------------*/
	/*
		Checks on Approver Email ID
		1) It should not be null
	*/
	stat = checkNull("Approvers Email Id ", approverEmailId);

	if(!stat){
		frmObj.approverEmailId.focus( );
		return;
	}
	
	if(emailId.match("artha.in")&& emailId == approverEmailId && emailId!="suresh@artha.in" &&  emailId!="venky@artha.in" && emailId!="rahul@artha.in"){
		
		alert("You can not approve your own request.\n Please select another approver!!");
		frmObj.approverEmailId.focus( );
		return;

	}
/*--------------Approver Email ID check ends--------------*/

    frmObj.action = "../requestor/requestCardsPreview.jsp";
	frmObj.submit( );
}


var code='';

function showAddress(companyCode){

	frmObj = document.frmRequestCards;

	code = frmObj.branchCode.value;
	//companyCode = frmObj.compCode.value;
	compName = frmObj.compName.value;
	compName = compName.replace('&','amp;');
	stat = checkNull("Card Template ", code);
	if(!stat){
		frmObj.branchCode.focus();
		return;
	}
	loadFragment('../includes/addressDropdown.jsp?code='+code+'&compName='+compName+'&companyCode='+companyCode,'addressArea','Address');
    
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
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center"><span class="loading"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
        
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


function clear( ){
	frmObj = document.frmRequestCards;
	frmObj.reset( );
}