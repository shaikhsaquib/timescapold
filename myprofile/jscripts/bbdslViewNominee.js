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
	//alert("Alteration to the nomination is valid subject to \nsubmission of relevant documents to HR Dept.");
	frmObj.action="../profile/nomineeAddSubmit.jsp";
	frmObj.submit();
}

function validate(addIndex,empBDay,empBMonth,empBYear,curDay,curMonth,curYear){  
	//alert("11");

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
		day=frmObj.day.value;
		
		month=frmObj.month.value;
		year=frmObj.year.value;
		nomineeGender=frmObj.nomineeGender.value;
		//alert("nomineeGender=="+nomineeGender);
	}else{
		nomineeName = frmObj.nomineeName[addIndex].value;
		nomineeLocationName =frmObj.nomineeLocationName[addIndex].value;
		nomineeRelatonship=frmObj.nomineeRelationship[addIndex].value;
		day=frmObj.day[addIndex].value;
		month=frmObj.month[addIndex].value;
		year=frmObj.year[addIndex].value;
		nomineeGender=frmObj.nomineeGender[addIndex].value;
		//alert("nomineeGender=="+nomineeGender);
	}
	selfGender=frmObj.selfGender.value;
	selfGender=document.getElementById("selfGender").value;
	//alert("selfGender=="+selfGender);
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

stat = checkDateDiff(nomineeRelatonship,year, month, day)
	if(!stat){
		return;
	}

/*End for Check of proper Age criteria*/
if((nomineeRelatonship == "Parent" || nomineeRelatonship == "Parent-In-Law") && nomineeGender == parentGender)
{
		alert("Both your Parents / In-Laws cannot be of the same gender.");
		showDiv();
		return;
}
else if(nomineeRelatonship == "Parent-In-Law")
{
	$.ajax({
	  url: '../profile/ageDifference.jsp',
	  type: 'POST',
	  data: {day: day,month: month,year: year},
	  success: function(data) 
	  {
		var text = data;
			text = text.replace(/[^a-zA-Z 0-9]+/g,'');
			text = text.replace(/^\s+|\s+$/g,'');

		if(text!="OK")
		{
			alert(text);
			showDiv();
			return;
		}
		alert("day=="+day);
		alert("empBYear=="+empBYear);
		alert("year=="+year);
		alert("empBMonth=="+empBMonth);
		if((parseInt(empBYear) - parseInt(year)) == 10)
		{
			if(parseInt(empBMonth) == parseInt(month))
			{
				if(parseInt(empBDay) < parseInt(day))
				{
					alert("Age difference should be atleast 10 years between parent-in-law and employee");
					showDiv();
					return;
				}
			}
			else if(parseInt(empBMonth) < parseInt(month))
			{
				alert("Age difference should be atleast 10 years between parent-in-law and employee");
				showDiv();
				return;
			}
		}
		else if((parseInt(empBYear) - parseInt(year)) < 10)
		{
			alert("Age difference should be atleast 10 years between parent-in-law and employee");
			showDiv();
			return;
		}

		addNominee(addIndex);
		
	  },
	  error: function(e) 
	  {
		alert(e);
		return;
	  }
	});
}
else if(nomineeRelatonship == "Parent")
{
	$.ajax({
	  url: '../profile/ageDifference.jsp',
	  type: 'POST',
	  data: {day: day,month: month,year: year},
	  success: function(data) 
	  {
		var text = data;
			text = text.replace(/[^a-zA-Z 0-9]+/g,'');
			text = text.replace(/^\s+|\s+$/g,'');

		if(text!="OK")
		{
			alert(text);
			showDiv();
			return;
		}
		
		if((parseInt(empBYear) - parseInt(year)) == 18)
		{
			if(parseInt(empBMonth) == parseInt(month))
			{
				if(parseInt(empBDay) < parseInt(day))
				{
					alert("Age difference should be atleast 18 years between parent and employee");
					showDiv();
					return;
				}
			}
			else if(parseInt(empBMonth) < parseInt(month))
			{
				alert("Age difference should be atleast 18 years between parent and employee");
				showDiv();
				return;
			}
		}
		else if((parseInt(empBYear) - parseInt(year)) < 18)
		{
			alert("empBYear=="+empBYear);
			alert("year=="+year);
			alert("Age difference should be atleast 18 years between parent and employee");
			showDiv();
			return;
		}

		addNominee(addIndex);
		
	  },
	  error: function(e) 
	  {
		alert(e);
		return;
	  }
	});
}


else if(nomineeRelatonship == "Spouse" && nomineeGender == selfGender)
{
		alert("The gender of your Spouse cannot be same as yours.");
		showDiv();
		return;
}
else if(nomineeRelatonship == "Spouse")
{
		if((parseInt(curYear)-parseInt(year)) == 18)
		{
			if(parseInt(curMonth) == parseInt(month))
			{
				if(parseInt(curDay) < parseInt(day))
				{
					alert("DOB of spouse shouldn’t be less than 18 yrs");
					showDiv();
					return;
				}
			}
			else if(parseInt(month) < parseInt(curMonth))
			{
				alert("DOB of spouse shouldn’t be less than 18 yrs");
				showDiv();
				return;
			}
		}
		else if((parseInt(curYear)-parseInt(year))<18)
		{
			alert("DOB of spouse shouldn’t be less than 18 yrs");
			showDiv();
			return;
		}

		addNominee(addIndex);
}
else if(nomineeRelatonship == "Child")
{
	addNominee(addIndex);
}
		$("#addLink").hide();

}// end of validate function


function checkAge(nomineeType)
{age=0;
if(nomineeType == "Child")
	{
		age=25;
	}
	else{if(nomineeType == "Parent")
		{
			age=85;
		}
		else{if (nomineeType == "Parent-In-Law")
		{
			age=85;
		}
		else return 100; // used for spouse
		}
	}
return age;}

function showDiv()
{
	$("#addLink").show();
}

function checkDateDiff(nomineeType,year,month,day)
{
	var age =0;
var selectedDate = new Date();
selectedDate.setFullYear(selectedYear,(selectedMonth-1),selectedDay);
//alert(selectedMonth);

var currentDate = new Date();
	if(currentDate<selectedDate){

		alert("Please select the correct DOB of nominee.");
		return false;
	}

age = checkAge(nomineeType);

//alert(age);
//currentDate.setFullYear(selectedYear,(selectedMonth-1),selectedDay);
currentDate.setFullYear((2016-age),4,31);
//alert(selectedDate);
//alert(currentDate);
if( selectedDate < currentDate )
{
alert("The age of Nominee exceeds the eligibility criteria");
return false;
}
else{
return true;
}
}

