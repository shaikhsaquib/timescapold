function checkJunk(fieldName, val, junkString)
{
	for (var i = 0; i <val.length;i++){
			for(var j=0;j < junkString.length;j++){
				if(val.charAt(i)==junkString.charAt(j)){
					alert(fieldName + " cannot contain junk characters !");
					return false;
				}
			}
		}
	return true;
}

function checkMinLength(fieldName, val , minlength)
{
	valSize = val.length;
	if(valSize < minlength){
		alert(fieldName +  " should be atleast " + minlength + " characters ");
		return false;
	}
	return true;
}

function checkMaxLength(fieldName, val , maxlength)
{
	valSize = val.length;
	if(valSize > maxlength){
		alert(fieldName +  " cannot have more than " + maxlength + " characters ");
		return false;
	}
	return true;
}


function checkNull(fieldName, val)
{
	// Checking for null
	if((val == null) || (val== "") || (val =="0")){
		alert("Please enter / select  your " + fieldName + " !");
		return false;
	}
	return true;
}

function checkVal(fieldName, othField,  val, junk)
{
	// Checking for null
	if(val=="O"){
		val = othField.value;

		if((val==null) || (val=="") || (val =="0")){
			alert("Please select / enter a value for " + fieldName +" !");
			val="NA";
		}

		//Checking for junk characters
		stat = checkJunk(fieldName, val, junk);

		if(!stat){
			alert(fieldName + " cannot contain junk characters !");
			val="NA";
		}
	}
	else if(val=="x"){
		alert("Please select / enter a value for " + fieldName +" !");
		val="NB";
	}
	else
	{
		// Simply return the passed value
		//val = "NC"
	}
	return val;
}

function checkDate(dDown, dDown2, dDown3)
{
	selectedDay      = dDown.options[dDown.selectedIndex].value;
	selectedMonth = dDown2.options[dDown2.selectedIndex].value;
	selectedYear     = dDown3.options[dDown3.selectedIndex].value;

	if(selectedDay == 0){
		alert("Please select a valid date !");
		dDown.focus( );
		return false;
	}

	if(selectedMonth==0){
		alert("Please select a valid month !");
		dDown2.focus( );
		return false;
	}

	if(selectedYear==0){
		alert("Please select a valid year !");
		dDown3.focus( );
		return false;
	}

	if(selectedMonth == 2){
		  if(selectedDay > 29){
	    		alert("February cannot have more than 29 days !");
	    		dDown.focus( );
	    		return false;
	   	 }
	 }
	 else if(selectedMonth == 4 || selectedMonth == 6 || selectedMonth == 9 || selectedMonth == 11){
	 	 if(selectedDay > 30){
	 		   alert("The selected month cannot have more than 30 days !");
	 		   dDown.focus( );
	 		   return false;
	 	  }
	 }

	 if ((selectedYear % 4) == 0 ){
	 	 if ((selectedYear % 100) == 0){
	 		  if ((selectedYear % 400) == 0){
	 			   feb_days = 29;
	  		  }
	  		  else{
	   			 feb_days = 28;
	   			}
	  		}
	  		else{
	  		 	feb_days = 29;
	  		}
	 }
	 else{
	  	feb_days = 28;
	 }

	if ((selectedDay > feb_days) && (selectedMonth == 2)){
		   alert("The selected year is not a leap year !");
		   dDown.focus( );
		   return false;
	  }
	 return true;
}

function checkPhone(fieldName , val , goodChars)
{
	var stat= true;
	//Check for character values in Numbers only fields
	for (var i = 0; i < val.length;i++)
	{
		num = val.charAt(i);
		//Look for each character in the goodChars string
		pos = goodChars.indexOf(num);

		if(pos ==-1)
		{
			stat = false;
			alert(fieldName + " should contain "+goodChars+" only!" );
			break;
		}
	}
	return stat;
}

function getMonth(month)
{
	mth = "0";

	switch(month)
	{
		case '1':
			mth = "jan";
			break;

		case '2':
			mth = "feb";
			break;

		case '3':
			mth = "mar";
			break;

		case '4':
			mth = "apr";
			break;

		case '5':
			mth = "may";
			break;

		case '6':
			mth = "jun";
			break;

		case '7':
			mth = "jul";
			break;

		case '8':
			mth = "aug";
			break;

		case '9':
			mth = "sep";
			break;

		case '10':
			mth = "oct";
			break;

		case '11':
			mth = "nov";
			break;

		case '12':
			mth = "dec";
			break;
	}

	return mth;
}


function textCounter(field,cntfield,maxlimit)
{
if (field.value.length > maxlimit)
field.value = field.value.substring(0, maxlimit);
else cntfield.value = maxlimit - field.value.length;
}