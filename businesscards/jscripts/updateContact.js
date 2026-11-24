function validate(){

    frmObj = document.frmUpdateContact;

	// Declaration of junk variables
	var nameJunk = "@!~+%<>?`;:#$%^&*()=|[]{}\\";

	// Fetching the data from the form
	var firstName		= Trim(frmObj.firstName.value);
	var lastName		= Trim(frmObj.lastName.value);

	var directNumber	= Trim(frmObj.directNumber.value);
	var directNumber2	= Trim(frmObj.directNumber2.value);
	var boardNumber		= Trim(frmObj.boardNumber.value);
	var faxNumber		= Trim(frmObj.faxNumber.value);

	var extensionNumber	= Trim(frmObj.extensionNumber.value);
	//var hotline			= Trim(frmObj.hotline.value);
	var mobileNumber	= Trim(frmObj.mobileNumber.value);
	var residenceNumber	= Trim(frmObj.residenceNumber.value);


/*--------------First Name check begins--------------*/
	/*
		Checks on Name
		1) It should not be null
		2) It should not contain junk characters
	*/
	stat = checkNull("First Name ", firstName);

	if(!stat){
		frmObj.firstName.focus( );
		return;
	}

	stat = checkJunk("First Name ", firstName, nameJunk);

	if(!stat){
		frmObj.firstName.focus();
		return;
	}


/*--------------First Name check ends--------------*/

/*--------------Last Name check begins--------------*/
	/*
		Checks on Last Name
		1) It should not be null
		2) It should not contain junk characters
	*/
	stat = checkNull("Last Name ", lastName);

	if(!stat){
		frmObj.lastName.focus( );
		return;
	}

	stat = checkJunk("Last Name ", lastName, nameJunk);

	if(!stat){
		frmObj.lastName.focus();
		return;
	}


/*--------------Last Name check ends--------------*/


/*--------------Direct Phone No check begins--------------*/
	/*
		Checks on Phone Number
		1) It should not be null
		2) It should be with country and region code
	*/
	stat = checkNull("Direct Phone ",directNumber);
	if(!stat){
		frmObj.directNumber.focus();
		return;
	}

	var countryCode = directNumber.substring(0,directNumber.indexOf("-"));
	var regionCode = directNumber.substring(directNumber.indexOf("-")+1);

	if (countryCode == "" || (regionCode.indexOf("-") == -1))
	{
		alert("Please update your Direct Phone with Country and Region Code.");
		frmObj.directNumber.focus();
		return;
	}

/*--------------Direct Phone No check ends--------------*/

/*--------------Board Number check begins--------------*/
	/*
		Checks on Phone Number
		1) It should not be null
		2) It should be with country and region code
	*/
	stat = checkNull("Board Number ",boardNumber);
	if(!stat){
		frmObj.boardNumber.focus();
		return;
	}

	var countryCode = boardNumber.substring(0,boardNumber.indexOf("-"));
	var regionCode = boardNumber.substring(boardNumber.indexOf("-")+1);

	if (countryCode == "" || (regionCode.indexOf("-") == -1))
	{
		alert("Please update your Board Number with Country and Region Code.");
		frmObj.boardNumber.focus();
		return;
	}
/*--------------Board Number check ends--------------*/


/*--------------Fax Number check begins--------------*/
	/*
		Checks on Phone Number
		1) It should not be null
		2) It should be with country and region code
	*/
	/*stat = checkNull("Fax Number ",faxNumber);
	if(!stat){
		frmObj.faxNumber.focus();
		return;
	}

	var countryCode = faxNumber.substring(0,faxNumber.indexOf("-"));
	var regionCode = faxNumber.substring(faxNumber.indexOf("-")+1);

	if (countryCode == "" || (regionCode.indexOf("-") == -1))
	{
		alert("Please update your Fax Number with Country and Region Code.");
		frmObj.faxNumber.focus();
		return;
	}*/

/*--------------Fax Number check ends--------------*/


/*--------------Extension Number check begins--------------*/
	/*
		Checks on Extension number
		1) It should not be null
	*/
	stat = checkNull("Extension Number ",extensionNumber);
	if(!stat){
		frmObj.extensionNumber.focus();
		return;
	}
/*--------------Extension Number check ends--------------*/


/*--------------Fax Number check begins--------------*/
	/*
		Checks on Phone Number
		1) It should not be null
		2) It should be with country code
	*/
	stat = checkNull("Mobile Number ",mobileNumber);
	if(!stat){
		frmObj.mobileNumber.focus();
		return;
	}

	var countryCode = mobileNumber.substring(0,mobileNumber.indexOf("-"));

	if (countryCode == "")
	{
		alert("Please update your Mobile Number with Country Code.");
		frmObj.mobileNumber.focus();
		return;
	}

/*--------------Fax Number check ends--------------*/


    frmObj.action = "../utils/updateContactSubmit.jsp";
	frmObj.submit( );
}


function clear( ){
	frmObj = document.frmUpdateContact;
	frmObj.reset( );
}

