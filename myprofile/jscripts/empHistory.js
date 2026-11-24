function editExperience()
{
    frmObj = document.frmProfile;
    frmObj.action= " ../profile/editExperience.jsp";
    frmObj.submit( );
}

function validate()
{
	frmObj = document.frmProfile;

	var len1 = document.frmProfile.departments.length;
	var len2 = document.frmProfile.companyName.length
	var ctr1 = 0;
	var ctr2 = 0;

	var junk = "@!~+%<>?`;:#$%^*=|[]{}\\";

	for(i = 0;i < len1 ;i++)
	{
		var departmentVal			= checkComboValue("departments",i);
		var jobDescVal				= Trim( checkValue("jobDesc",i));
		var designationVal			= Trim( checkComboValue("designation",i));
		var promotedDesignationVal	= Trim( checkComboValue("promotedDesignation",i));
		var fromMonthVal			= Trim( checkComboValue("fromMonth",i));
		var fromYearVal				= Trim( checkComboValue("fromYear",i));
		var toMonthVal				= Trim( checkComboValue("toMonth",i));
		var toYearVal				= Trim( checkComboValue("toYear",i));


		if(departmentVal == "0" && jobDescVal == "" && designationVal == "0" && promotedDesignationVal == "0" && fromMonthVal == "0" && fromYearVal == "0")
		{
			ctr1++;
		}
		else
		{
			var stat = ""

			stat = checkControlValue("departments",departmentVal);
			if(!stat)
			{
				stat = checkNull("Department",departmentVal);
				expr = "document.frmProfile.departments[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkControlValue("jobDescVal",jobDescVal);
			if(!stat)
			{
				stat = checkNull("Job Description",jobDescVal);
				expr = "document.frmProfile.jobDesc[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkJunk("Job Description",  jobDescVal ,junk);
			if(!stat)
			{
				expr = "document.frmProfile.jobDesc[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkControlValue("designationVal",designationVal);
			if(!stat)
			{
				stat = checkNull("Joined As Designation",designationVal);
				expr = "document.frmProfile.designation[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkControlValue("promotedDesignationVal",promotedDesignationVal);
			if(!stat)
			{
				stat = checkNull("Last Designation Held",promotedDesignationVal);
				expr = "document.frmProfile.promotedDesignation[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkControlValue("fromMonthVal",fromMonthVal);
			if(!stat)
			{
				stat = checkNull("From Month",fromMonthVal);
				expr = "document.frmProfile.fromMonth[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkControlValue("fromYearVal",fromYearVal);
			if(!stat)
			{
				stat = checkNull("From Year",fromYearVal);
				expr = "document.frmProfile.fromYear[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkControlValue("toMonthVal",toMonthVal);
			if(!stat)
			{
				stat = checkNull("To Month",toMonthVal);
				expr = "document.frmProfile.toMonth[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkControlValue("toYearVal",toYearVal);
			if(!stat)
			{
				stat = checkNull("To Year",toYearVal);
				expr = "document.frmProfile.toYear[" + i + "].focus()";
				eval(expr);
				return false;
			}

			var today = new Date;
			var current_month = today.getMonth()+1;
			var current_year = today.getYear();

			if (fromYearVal > current_year)
			{
				alert("Please check the year selected");
				expr = "document.frmProfile.fromYear[" + i +" ].focus()";
				eval(expr);
				return false;
			}

			if (fromYearVal > toYearVal)
			{
				alert("From Year cannot be greater than Current Year");
				expr = "document.frmProfile.fromYear[" + i +" ].focus()";
				eval(expr);
				return false;
			}
			if(fromMonthVal == toMonthVal && fromYearVal == toYearVal)
			{
				alert("Please check the Job Duration");
				expr = "document.frmProfile.fromYear[" + i +" ].focus()";
				eval(expr);
				return false;
			}

			if(fromMonthVal == toMonthVal && fromYearVal > toYearVal)
			{
				alert("Please check the Job Duration");
				expr = "document.frmProfile.fromYear[" + i +" ].focus()";
				eval(expr);
				return false;
			}

			if( (eval(fromMonthVal) > eval(toMonthVal) ) && ( eval(fromYearVal) == eval(toYearVal) ) )
			{
				alert("Please check the Job Duration");
				expr = "document.frmProfile.fromMonth[" + i +" ].focus()";
				eval(expr);
				return false;
			}

			if(fromMonthVal == toMonthVal && fromYearVal == toYearVal)
			{
				alert("Please check the Job Duration");
				expr = "document.frmProfile.fromMonth[" + i +" ].focus()";
				eval(expr);
				return false;
			}
		}
	}

	for( i = 0; i < frmObj.companyName.length;i++)
	{
		var companyNameVal			= Trim( checkValue("companyName",i));
		var jobDescVal				= Trim( checkValue("jobDesc1",i));
		var designationVal			= Trim( checkValue("joinedAs1",i));
		var promotedDesignationVal	= Trim( checkValue("designation1",i));
		var fromMonthVal			= Trim( checkComboValue("fromPrevMonth1",i));
		var fromYearVal				= Trim( checkComboValue("fromPrevYear1",i));
		var toMonthVal				= Trim( checkComboValue("toPrevMonth1",i));
		var toYearVal				= Trim( checkComboValue("toPrevYear1",i));

		if(companyNameVal == "" && jobDescVal == "" && designationVal == "" && promotedDesignationVal == "" && fromMonthVal == "0" && fromYearVal == "0")
		{
			ctr2++;
		}
		else
		{
			var stat = ""

			stat = checkControlValue("companyName",companyNameVal);
			if(!stat)
			{
				stat = checkNull("Company Name",companyNameVal);
				expr = "document.frmProfile.companyName[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkJunk("Company Name",  companyNameVal ,junk);
			if(!stat)
			{
				expr = "document.frmProfile.companyName[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkControlValue("jobDescVal",jobDescVal);
			if(!stat)
			{
				stat = checkNull("Job Description",jobDescVal);
				expr = "document.frmProfile.jobDesc1[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkJunk("Job Description",  jobDescVal ,junk);
			if(!stat)
			{
				expr = "document.frmProfile.jobDesc1[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkControlValue("designationVal",designationVal);
			if(!stat)
			{
				stat = checkNull("Joined As Designation",designationVal);
				expr = "document.frmProfile.joinedAs1[" + i + "].focus()";
				eval(expr);
				return false;
			}


			/*Junk String for designation*/
			var junkDesignation = "1234567890@!~+%<>?`;:#$%^*=|[]{}\\";

			stat = checkJunk("Joined As",  designationVal ,junkDesignation);
			if(!stat)
			{
				expr = "document.frmProfile.joinedAs1[" + i + "].focus()";
				eval(expr);
				return false;
			}
			
			stat = checkControlValue("promotedDesignationVal",promotedDesignationVal);
			if(!stat)
			{
				stat = checkNull("Last Designation Held",promotedDesignationVal);
				expr = "document.frmProfile.designation1[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkJunk("Last Designation Held",  promotedDesignationVal ,junkDesignation);
			if(!stat)
			{
				expr = "document.frmProfile.designation1[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkControlValue("fromMonthVal",fromMonthVal);
			if(!stat)
			{
				stat = checkNull("From Month",fromMonthVal);
				expr = "document.frmProfile.fromPrevMonth1[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkControlValue("fromYearVal",fromYearVal);
			if(!stat)
			{
				stat = checkNull("From Year",fromYearVal);
				expr = "document.frmProfile.fromPrevYear1[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkControlValue("toMonthVal",toMonthVal);
			if(!stat)
			{
				stat = checkNull("To Month",toMonthVal);
				expr = "document.frmProfile.toPrevMonth1[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkControlValue("toYearVal",toYearVal);
			if(!stat)
			{
				stat = checkNull("To Year",toYearVal);
				expr = "document.frmProfile.toPrevYear1[" + i + "].focus()";
				eval(expr);
				return false;
			}

			var today = new Date;
			var current_month = today.getMonth()+1;
			var current_year = today.getYear();

			if (fromYearVal > current_year)
			{
				alert("Please check the year selected");
				expr = "document.frmProfile.fromPrevYear1[" + i +" ].focus()";
				eval(expr);
				return false;
			}

			if (fromYearVal > toYearVal)
			{
				alert("From Year cannot be greater than Current Year");
				expr = "document.frmProfile.fromPrevYear1[" + i +" ].focus()";
				eval(expr);
				return;
			}

			if( (eval(fromMonthVal) > eval(toMonthVal) ) && ( eval(fromYearVal) == eval(toYearVal) ) )
			{
				alert("Please check the Job Duration");
				expr = "document.frmProfile.fromPrevMonth1[" + i +" ].focus()";
				eval(expr);
				return false;
			}

			if(fromMonthVal == toMonthVal && fromYearVal == toYearVal)
			{
				alert("Please check the Job Duration");
				expr = "document.frmProfile.fromPrevMonth1[" + i +" ].focus()";
				eval(expr);
				return false;
			}

		}
	}

	if(ctr1 == len1 && ctr2 == len2)
	{
		alert("Please enter atleast one Experience History");
		return false;
	}
	return true;
}


function checkValue(formElement, index)
{
	var expr = "document.frmProfile." +  formElement + "[" + index + "].value";
	var exprVal = eval(expr);
	return exprVal;
}

function checkComboValue( formElement, index)
{
	var expr = "document.frmProfile." + formElement + "[" + index + "].options[document.frmProfile" + "." + formElement + "[" + index + "].selectedIndex].value";
	var exprVal = eval(expr);
	return exprVal;
}

function checkControlValue(fieldName, val)
{
	// Checking for null
	if((val == null) || (val== "") || (val =="0")){
		return false;
	}
	return true;
}

function addMore( ) {
	var stat = validate( );

	if(stat){
		frmObj = document.frmProfile;
		frmObj.redirection.value = "AddMore";
		frmObj.action = "../profile/experienceSubmit.jsp";
		frmObj.submit( );
	}else{
		return;
	}
}

function submitForm () {

	var stat = validate( );

	if(stat) {
	    frmObj = document.frmProfile;
	    frmObj.redirection.value = "Add";
	     frmObj.action= " ../profile/experienceSubmit.jsp";
	    frmObj.submit( );
	}else{
		return;
	}
}
