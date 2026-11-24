function editUser( ){
    frmObj = document.frmProfile;
    frmObj.action= " ../profile/editProfile.jsp";
    frmObj.submit( );
}

function submitForm () {

    frmObj = document.frmProfile;
    frmObj.action= " ../profile/profileSubmit.jsp";
    frmObj.submit( );
}


function validateProfile()
{
	frmObj = document.frmProfile;
	var junk      = "@!~+%<>?`;:#$%^*=|[]{}\\&-_";
	var junkName  = "@!~+%<>?`;:#$%^*=|[]{}\\&0123456789-_";
	var junkEmail = "!~+%<>?`;:#$%^*=|[]{}\\&";

/*--------------Getting Values From All Form Field Elements--------------*/

	var title = frmObj.title.options[frmObj.title.selectedIndex].value;

	var firstName = frmObj.firstName.value;
	var middleName = frmObj.middleName.value;
	var lastName = frmObj.lastName.value;

	//var day = frmObj.day.options[frmObj.day.selectedIndex].text;
	//var month = frmObj.month.options[frmObj.month.selectedIndex].text;
	//var year = frmObj.year.options[frmObj.year.selectedIndex].text;

	var gender = frmObj.gender.options[frmObj.gender.selectedIndex].value;
	var maritalStatus = frmObj.maritalStatus.options[frmObj.maritalStatus.selectedIndex].value;
	var religion = frmObj.religion.value;

	var familyMembers = frmObj.noOfFamilyMembers.value;
	var motherTongue = frmObj.language.options[frmObj.language.selectedIndex].value;
	//var birthmark = frmObj.birthMark.value;

	//var handicapReason = frmObj.isHandicapped.value;

	var passportNumber = frmObj.passportNumber.value;

	var bloodGroup = frmObj.bloodGroup.options[frmObj.bloodGroup.selectedIndex].value;

	var panNumber = frmObj.panNumber.value;
	var pfAccountNumber = frmObj.pfAccountNumber.value;
	var emailId = frmObj.alternateEmailId.value;

/*--------------Getting Values Block Ends Here--------------*/

	var stat = "";

/*--------------Title Check Begins--------------*/

	stat = checkNull("Title",title);
	if(!stat){
		frmObj.title.focus();
		return;
	}

/*--------------Title Check Ends--------------*/


/*--------------First Name Check Begins--------------*/

	stat = checkNull("First Name",firstName);
	if(!stat){
		frmObj.firstName.focus();
		return;
	}

	stat = checkJunk("First Name",  firstName ,junkName);
	if(!stat){
		frmObj.firstName.focus( );
		return;
	}
/*--------------First Name Check Ends--------------*/


/*--------------Middle Name Check Begins--------------*/

	stat = checkJunk("Middle Name",  middleName ,junkName);
	if(!stat){
		frmObj.middleName.focus( );
		return;
	}

/*--------------Middle Name Check Ends--------------*/


/*--------------Last Name Check Begins--------------*/

	stat = checkNull("Last Name",lastName);
	if(!stat){
		frmObj.lastName.focus();
		return;
	}

	stat = checkJunk("Last Name",  lastName ,junkName);
	if(!stat){
		frmObj.lastName.focus( );
		return;
	}

/*--------------Last Name Check Ends--------------*/


/*--------------Date Check Begins--------------*/
	/*
		1. Date Should'nt Be Null
	*/
	/*
	stat = checkDate(frmObj.day,frmObj.month,frmObj.year)
	if(!stat){
		frmObj.day.focus();
		return;
	}
	*/

/*--------------Date Check Ends--------------*/

	stat = checkNull("Gender",gender);
	if(!stat){
		frmObj.gender.focus();
		return;
	}


/*--------------Marital Status Check Begins--------------*/

	stat = checkNull("Marital Status",maritalStatus);
	if(!stat){
		frmObj.maritalStatus.focus();
		return;
	}

/*--------------Marital Status Check Ends--------------*/


/*--------------Family Members Check Begins--------------*/

	stat = checkJunk("No of Dependents",familyMembers,junk);
	if(!stat){
		frmObj.noOfFamilyMembers.focus();
		return;
	}

	stat = isNaN(familyMembers);

	if(stat){
		alert("No of Dependents should contain a numeric value !");
		frmObj.noOfFamilyMembers.focus( );
		return;
	}


/*--------------Family Members Check Ends--------------*/

/*--------------Religion Check Begins--------------*/

	stat = checkNull("Religion",religion);
	if(!stat){
		frmObj.religion.focus();
		return;
	}

	stat = checkJunk("Religion",  religion ,junk);
	if(!stat){
		frmObj.religion.focus( );
		return;
	}

/*--------------Religion Check Ends--------------*/


/*--------------Mother Tongue Check Begins--------------*/


	stat = checkNull("Mother Tongue",  motherTongue);
	if(!stat){
		frmObj.language.focus( );
		return;
	}

	/*
	stat = checkJunk("Mother Tongue",  motherTongue ,junk);
	if(!stat){
		frmObj.language.focus( );
		return;
	}*/

/*--------------Mother Tongue Check Ends--------------*/


/*--------------Birthmark Check Begins--------------*/
	/*
	stat = checkJunk("birthmark",  birthmark ,junk);
	if(!stat){
		frmObj.birthmark.focus( );
		return;
	}
	*/

/*--------------Birthmark Check Ends--------------*/


/*--------------handicapReason Check Begins--------------*/
	/*
	stat = checkJunk("is handicap",  handicapReason ,junk);
	if(!stat){
		frmObj.handicapReason.focus( );
		return;
	}
	*/
/*--------------handicapReason Check ends--------------*/



/*--------------Passport Number Check Begins--------------*/

	stat = checkJunk("Passport Number",  passportNumber ,junk);
	if(!stat){
		frmObj.passportNumber.focus( );
		return;
	}

/*--------------Passport Number Check Ends--------------*/


/*--------------Blood Group Check Begins--------------*/

	stat = checkNull("Blood Group",bloodGroup);
	if(!stat){
		frmObj.bloodGroup.focus();
		return;
	}

/*--------------Blood Group Check Ends--------------*/



/*--------------Pan Number Check Begins--------------*/

	stat = checkJunk("Pan Number",  panNumber ,junk);
	if(!stat){
		frmObj.panNumber.focus( );
		return;
	}
/*--------------Pan Number Check Ends--------------*/


/*--------------PF Account Number Check Begins--------------*/

	stat = checkJunk("PF Account Number",  pfAccountNumber ,junk);
	if(!stat){
		frmObj.pfAccountNumber.focus( );
		return;
	}
/*--------------PF Account Number Check Ends--------------*/



/*--------------emailid Check Ends--------------*/

	stat = checkJunk("Email Id ",  emailId ,junkEmail);
	if(!stat){
		frmObj.alternateEmailId.focus();
		return;
	}

	if(emailId != ""){
		stat = isValidEmail(emailId);

		if(!stat){
		    alert("The email address may not be formatted correctly. Please verify.");
			frmObj.alternateEmailId.focus();
			return;
		}
	}
/*--------------emailid Check Ends--------------*/

    // Submit the form
    submitForm( );
}
