function submitForm () {

    frmObj = document.viewNomineeForm;
    frmObj.action= " ../profile/nomineeDetailsSubmit.jsp";
    frmObj.submit( );
}

function deleteNominee(nomineeId)
{
	val=confirm("Do you want to delete the selected nominee?");

	if(!val)
		return;
	else
	{
	//alert("deleteNominee()"+nomineeId);
	frmObj=document.viewNomineeForm;
	frmObj.nomineeId.value=nomineeId;
	//alert(frmObj.nomineeId.value);
	frmObj.action="../profile/nomineeDeleteSubmit.jsp";
	frmObj.submit();
	}
}

function addNominee(addIndex)
{	
	frmObj=document.viewNomineeForm;
//	alert("addNominee() "+addIndex);
	frmObj.addIndex.value=addIndex;
	
	frmObj.action="../profile/nomineeAddSubmit.jsp";
	frmObj.submit();
}

function validate(addIndex)
{
	frmObj = document.viewNomineeForm;
	var junk      = "@!~+%<>?`;:#$%^*=|[]{}\\&-_";
	var junkName  = "@!~+%<>?`;:#$%^*=|[]{}\\&0123456789-_";
	var junkEmail = "!~+%<>?`;:#$%^*=|[]{}\\&";
	
	var nomineeName;
	var nomineeLocationName;
	var nomineeRelatonship;
	var day;
	var year;
	var nomineeGender;
	var undefinedLength;

	var ctrLength = frmObj.nomineeName.length;

	if(ctrLength == undefinedLength){
		nomineeName=frmObj.nomineeName.value;
		nomineeLocationName=frmObj.nomineeLocationName.value;
		nomineeRelatonship=frmObj.nomineeRelationship.value;
		day=frmObj.value;
		month=frmObj.month.value;
		year=frmObj.year.value;
		nomineeGender=frmObj.nomineeGender.value;
	}else{
		nomineeName = frmObj.nomineeName[addIndex].value;
		nomineeLocationName =frmObj.nomineeLocationName[addIndex].value;
		nomineeRelatonship=frmObj.nomineeRelationship[addIndex].value;
		day=frmObj.day[addIndex].value;
		month=frmObj.month[addIndex].value;
		year=frmObj.year[addIndex].value;
		nomineeGender=frmObj.nomineeGender[addIndex].value;	
	}

	/*--------------Junk Name Check Begins--------------*/


	stat = checkJunk("Nominee Name",  nomineeName,junkName);
	if(!stat){		

		if(ctrLength == undefinedLength){
			frmObj.nomineeName.focus( );
		}else{
			frmObj.nomineeName[addIndex].focus( );
		}
		
		return;
	}

	stat = checkJunk("Location",  nomineeLocationName,junkName);
	if(!stat){
		
		if(ctrLength == undefinedLength){
			frmObj.nomineeLocationName.focus( );
		}else{
			frmObj.nomineeLocationName[addIndex].focus( );
		}
		
		return;
	}

	/*----------------Null Check begins-------------------*/
	stat = checkNull("Nominee Name",nomineeName);
	if(!stat){
		
		if(ctrLength == undefinedLength){
			frmObj.nomineeName.focus();
		}else{
			frmObj.nomineeName[addIndex].focus();
		}
		
		return;
	}


	stat = checkNull("Location",nomineeLocationName);
	if(!stat){
		
		if(ctrLength == undefinedLength){
			frmObj.nomineeLocationName.focus();
		}else{
			frmObj.nomineeLocationName[addIndex].focus();
		}
		
		return;
	}

	/*---------------------Date Check Begins-----------------*/

//	(day[addIndex].options[selectedIndex-1].value)

	if(ctrLength == undefinedLength){
		dDown  = frmObj.day;
		dDown2 = frmObj.month;
		dDown3 = frmObj.year;	
	}else{
		dDown  = frmObj.day[addIndex];
		dDown2 = frmObj.month[addIndex];
		dDown3 = frmObj.year[addIndex];
	}

	stat = checkDate(dDown, dDown2, dDown3)
	
	if(!stat){
		return;
	}

//	(nomineeName);
//	(nomineeLocationName);
	addNominee(addIndex);
}