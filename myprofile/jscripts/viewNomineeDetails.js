function submitForm () {

    frmObj = document.viewNomineeForm;
    frmObj.action= " ../profile/nomineeDetailsSubmit.jsp";
    frmObj.submit( );
}

function deleteNominee(nomineeId, nomineeName, nomineeLoc, nomineeRel, nomineeDOB, nomineeGender)
{
	val=confirm("Do you want to delete the selected nominee?");
	if(!val)
		return;
	else
	{
	//alert("deleteNominee()"+nomineeId);
	frmObj=document.viewNomineeForm;
	frmObj.nomineeId.value=nomineeId;
	frmObj.nomineeNameHidden.value=nomineeName;
	frmObj.nomineeLocationHidden.value=nomineeLoc;
	frmObj.nomineeRelationHidden.value=nomineeRel;
	frmObj.nomineeDOBHidden.value=nomineeDOB;
	frmObj.nomineeGenderHidden.value=nomineeGender;
	alert("Alteration to the nomination is valid subject to \nsubmission of relevant documents to HR Dept.");
	frmObj.action="../profile/nomineeDeleteSubmit.jsp";
	frmObj.submit();
	}
}

function addNominee(addIndex)
{	
	frmObj=document.viewNomineeForm;
	//alert("addNominee() "+addIndex);
	frmObj.addIndex.value=addIndex;
	alert("Alteration to the nomination is valid subject to \nsubmission of relevant documents to HR Dept.");
	frmObj.action="../profile/nomineeAddSubmit.jsp";
	frmObj.submit();
}

function validate(addIndex){  
	//alert(addIndex);
	frmObj = document.viewNomineeForm;
	var junk      = "@!~+%<>?`;:#$%^*=|[]{}\\&-_";
	var junkName  = "@!~+%<>?`;:#$%^*=|[]{}\\&0123456789-_";
	var junkEmail = "!~+%<>?`;:#$%^*=|[]{}\\&";
	var space = " ";
	
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
	selfGender=frmObj.selfGender.value;
	parentGender=frmObj.parentGender.value;

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

	//(day[addIndex].options[selectedIndex-1].value)

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



/*End for Check of proper Age criteria*/

stat = checkDateDiff(nomineeRelatonship,year, month, day)
	if(!stat){
		return;
	}


	if(nomineeRelatonship == "Spouse" && nomineeGender == selfGender)
	{
		alert("The gender of your Spouse cannot be same as yours!!!");
		return;
	}


	if((nomineeRelatonship == "Parent" || nomineeRelatonship == "Parent-in-Law") && nomineeGender == parentGender)
	{
		alert("Both your Parents / In-Laws cannot be of the same gender!!!");
		return;
	}
//	(nomineeName);
//	(nomineeLocationName);
	addNominee(addIndex);

}// end of validate function

function checkDateDiff(nomineeType,year,month,day)
{
	var age =0;
var selectedDate = new Date();
selectedDate.setFullYear(selectedYear,(selectedMonth-1),selectedDay);
//alert(selectedMonth);

age = checkAge(nomineeType);

var currentDate = new Date();
//currentDate.setFullYear(selectedYear,(selectedMonth-1),selectedDay);
currentDate.setFullYear((currentDate.getFullYear()-age),4,31);

if( selectedDate < currentDate )
{
alert("The age of Nominee exceeds the eligibility criteria");
return false;
}
else{
return true;
}
}


function checkAge(nomineeType)
{
	age=0;
	if(nomineeType == "Child")
	{
		age=25;
	}
	else
	{
		if(nomineeType == "Parent")
		{
			age=80;
		}
		else return 100; // used for spouse
	}
return age;
}