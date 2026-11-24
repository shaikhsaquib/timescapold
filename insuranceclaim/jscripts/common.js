function checkNum(fieldName, val, num)
{
	for (var i = 0; i <val.length;i++){
			for(var j=0;j < num.length;j++){
				if(val.charAt(i)!=num.charAt(j)){
					alert(fieldName + " can contain only Numbers !");
					return false;
				}
			}
		}
	return true;
}


function ltrim(str)
{
	for(var k = 0; k < str.length && isWhitespace(str.charAt(k)); k++);
	return str.substring(k, str.length);
}
function rtrim(str){
	for(var j=str.length-1; j>=0 && isWhitespace(str.charAt(j));j--);
	return str.substring(0,j+1);
	}
function trim(str){
	return ltrim(rtrim(str));
	}
function isWhitespace(charToCheck){var whitespaceChars = " \t\n\r\f";return (whitespaceChars.indexOf(charToCheck) != -1);
}


function checkEmail(email)
{
	//alert(document.getElementById(email).value);
	var regularExp = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
	if(!Trim(document.getElementById(email).value).match(regularExp))
	{
		alert("Invalid Email Address");
		document.getElementById(email).focus();
		return false;
	}
	else
		{
		return true;
	}
}

 function checkNextNull(fieldName, val)
{
	frmObj = document.frmCreateRequest;
	// Checking for null
	if((val == null) || (val== "") || (val =="0"))
	{
		return false;
	}
	return true;
}

function RoundTo(pdoubleNumber)
{
pRoundPlaces = 2;
vRnd = 1;
for(count=0; count<pRoundPlaces; count++){
vRnd = vRnd*10;
}
pdoubleNumber= pdoubleNumber*vRnd;
pdoubleNumber= Math.round(pdoubleNumber);
pdoubleNumber= pdoubleNumber/vRnd;
return pdoubleNumber;
}

function checkAmt(fieldName , val , goodChars)
{	
	var stat= true;
	count=0;
	//Check for character values in Numbers only fields
	for (var i = 0; i<val.length; i++)
	{	
		num = val.charAt(i);

		//Look for each character in the goodChars string
		pos = goodChars.indexOf(num);
		if(pos == -1){
			stat = false;
			alert(fieldName + " should contain numbers");
			return stat;
			break;
		}
	}
	return stat;
}

function checkNumInName(fieldName , val , badChars)
{	
	var stat= true;

	//Check for character values in Alphabets only field
	for (var i = 0; i < val.length; i++)
	{	
		num = val.charAt(i);

		//Look for each character in the badChars string
		pos = badChars.indexOf(num);
		if(pos != -1)
		{
			stat = false;
			alert(fieldName + " should not contain numbers");
			return stat;
			break;
		}
	}
	return stat;
}