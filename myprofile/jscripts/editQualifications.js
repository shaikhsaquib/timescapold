function validate( )
{
    frmObj = document.frmProfile;
	var junk = "@!~+%<>?`;:#$%^*=|[]{}\\&";

	var len = frmObj.qualification.length

	var ctr = 0;


	for(i = 0; i < len;i++)
	{
		var qualification			= Trim( checkValue("qualification",i) );
		var specialization		= Trim( checkValue("specialization",i) );
		var institute					= Trim( checkValue("institute",i) );
		var university				= Trim( checkValue("university",i) );
		var type							= Trim( checkComboValue("studyType",i) );
		var marks						=  Trim(checkValue("percentAcquired",i)) ;
		var passingYear			= Trim( checkComboValue("passingYear",i) );

        var qualificationOID = checkValue("qualificationOID",i);

		var stat = "";
		var stat1 = "";
		var stat2 = "";

		if(qualification == "" && specialization == ""  && institute == "" &&  university == "" && type == "0" &&  marks == "" &&  passingYear == "0")
		{
			ctr++;
		}
		else
		{

            // This to check if the entered qualification does not have
            // a matching qualificationOID in the databse.
            // This scenario occurs when the qualifications is initially
            // loaded from the erp database.
            stat = isNaN(qualificationOID);

            if(qualificationOID == "" || stat){
                alert("Please select a valid qualification from the list");
				expr = "document.frmProfile.qualification[" + i + "].focus()";
				eval(expr);
				return false;
            }

			stat = checkControlValue("qualification",qualification);

			if(!stat){
				checkNull("Qualification",qualification);
				expr = "document.frmProfile.qualification[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat1 = checkControlValue("specialization",specialization);

			if(!stat1){
				checkNull("Specialization",specialization);
				expr = "document.frmProfile.specialization[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat1 = checkControlValue("institute",institute);

			if(!stat1){
				checkNull("Institute",institute);
				expr = "document.frmProfile.institute[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat1 = checkControlValue("university",university);

			if(!stat1){
				checkNull("University",university);
				expr = "document.frmProfile.university[" + i + "].focus()";
				eval(expr);
				return false;
			}
            /*
			stat = checkControlValue("marks",marks);

			if(!stat){
				checkNull("Marks/Grade",marks);
				expr = "document.frmProfile.percentAcquired[" + i + "].focus()";
				eval(expr);
				return false;
			}
            */
           
            /*if(marks == "") {
                
                marks = 0;   
                expr =  "document.frmProfile.percentAcquired[" + i + "] .value=0";
                eval(expr);
            }*/
            stat = isNaN(marks);

            if(stat){
                alert("Marks/CGPA cannot contain non-nnumeric values !");
				expr = "document.frmProfile.percentAcquired[" + i + "].focus()";
				eval(expr);
				return false;
            }

		  evalMarks = eval(marks);
            if(evalMarks >= 100) {
                alert("Marks/CGPA cannot be greater than 100 !");
				expr = "document.frmProfile.percentAcquired[" + i + "].focus()";
				eval(expr);
				return false;
            }

            if(evalMarks < 0) {
                alert("Please enter an appropriate value for Marks/CGPA");
				expr = "document.frmProfile.percentAcquired[" + i + "].focus()";
				eval(expr);
				return false;
            }



           	stat = checkControlValue("type",type);

			if(!stat){
				checkNull("Study Type",type);
				expr = "document.frmProfile.studyType[" + i + "].focus()";
				eval(expr);
				return false;
			}

			stat = checkControlValue("passingYear",passingYear);

			if(!stat){
				checkNull("Passing Year",passingYear);
				expr = "document.frmProfile.passingYear[" + i + "].focus()";
				eval(expr);
				return false;
			}

		}

	}
	if(ctr == len)
	{
		alert("Please enter atleast one experience");
		return false;
	}
	return true;
}

function checkComboValue( formElement, index)
{
	var expr = "document.frmProfile." + formElement + "[" + index + "].options[document.frmProfile" + "." + formElement + "[" + i + "].selectedIndex].value";
	var exprVal = eval(expr);
	return exprVal;
}

function checkValue(formElement, index)
{
	var expr = "document.frmProfile." +  formElement + "[" + index + "].value";
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

function editQualification() {

    frmObj = document.frmProfile;
    frmObj.action= " ../profile/editQualifications.jsp";
    frmObj.submit( );
}

function submitForm () {
	stat = validate( );


	if(stat){
	    frmObj = document.frmProfile;
	    frmObj.option.value="Add";
	    frmObj.action= " ../profile/qualificationSubmit.jsp";
	    frmObj.submit( );
	}else{
		return;
	}
}

function enable(controlName){
	expr = "document.frmProfile."+controlName;
	eval(expr).onfocus = disable(controlName);
}

function disable(controlName,index){
	expr = "document.frmProfile."+controlName+"[" + index +"]";
	eval(expr).blur( );
}

function addMore( ){
	stat = validate( );

	if(stat){
		frmObj = document.frmProfile;
		frmObj.option.value="AddMore";
		frmObj.action = "../profile/qualificationSubmit.jsp";
		frmObj.submit( );
	}else{
		return;
	}
}