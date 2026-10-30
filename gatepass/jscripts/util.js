function checkJunk(fieldName, val)
{ 
	
	var junk ="";
	var junkString = "@!~+%<>?`;:#$%^&*()=|[]{}/\\";
	for (var i = 0; i <val.length;i++){
			for(var j=0;j < junkString.length;j++){
				if(val.charAt(i)==junkString.charAt(j)){
					alert("This field can't contain junk characters like: @!~+%<>?`;:#$%^&*()=|[]{}/\\");
					
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
		alert("Please enter the " + fieldName + " !");
		return false;
	}
	return true;
}



function checkVal(fieldName, othField,  val, junk)
{
	// Checking for null
  

	if(val=="0"){

	

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
	//Check for character values in Numbers only fields
	for (var i = 0; i < val.length;i++)
	{
		num = val.charAt(i);
		var stat= true;
		for(var j=0;j < goodChars.length;j++)
		{
			//Look for each character in the goodChars string
			pos = goodChars.indexOf(num);

			if(pos ==-1)
			{
				stat = false;
				break;
			}
		}
		if(!stat){
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

function isValidEmail(elem) 
{
    var str = elem;
    str = str.toLowerCase(  );
	var emailStatus = "";

	if (str.indexOf("@") > 1) 
	{

        var addr = str.substring(0, str.indexOf("@"));
        var domain = str.substring(str.indexOf("@") + 1, str.length);

        // at least one top level domain required

        if (domain.indexOf(".") == -1) 
		{
            emailStatus =  false;
			return false;
        }
        // parse address portion first, character by character

        for (var i = 0; i < addr.length; i++) 
		{
            oneChar = addr.charAt(i).charCodeAt(0);
            // dot or hyphen not allowed in first position; dot in last
            if ((i == 0 && (oneChar == 45 || oneChar == 46))  || (i == addr.length - 1 && oneChar == 46)) 
			{
                emailStatus =  false;
				return false;
            }
            // acceptable characters (- . _ 0-9 a-z)
            if (oneChar == 45 || oneChar == 46 || oneChar == 95 || (oneChar > 47 && oneChar < 58) || (oneChar > 96 && oneChar < 123)) 
			{
                continue;
            } 
			else 
			{
                emailStatus =  false;
				return false;
            }
        }

        for (i = 0; i < domain.length; i++) 
		{
            oneChar = domain.charAt(i).charCodeAt(0);
            if ((i == 0 && (oneChar == 45 || oneChar == 46)) || ((i == domain.length - 1  || i == domain.length - 2) && oneChar == 46)) 
			{
                emailStatus = false;
				return false;
            }
            if (oneChar == 45 || oneChar == 46 || oneChar == 95 || (oneChar > 47 && oneChar < 58) || (oneChar > 96 && oneChar < 123)) 
			{
                continue;
            } 
			else 
			{
                emailStatus =  false;
				return false;
            }
        }
        return true;
    }

	if(emailStatus == false)
	{
	    //alert("The email address may not be formatted correctly. Please verify.");
		return false;
	}
    return false;
}

function dateFormat(incomingData) { 
	
	var monthName	= new Array( "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC");
	incomingData	= incomingData.split("-");
	var day			= incomingData[0];
	var month		= incomingData[1];
	var year		= incomingData[2];
	var monthValue	= 0;

	if (month >= 1 || month <= 12) {


		month = monthName[month-1];

	}

	for(var i=0; i < monthName.length ;i++)	{

		if(monthName[i] == month) {

			var monthValue = i;

		}

	}
	var revisedFormat = new Date(year, monthValue ,day);
	return revisedFormat;
}	// end of function

