function checkNum(fieldName, val, num)
{
	for (var i = 0; i <val.length;i++){
			for(var j=0;j < num.length;j++){
				if(val.charAt(i)==num.charAt(j)){
					alert(fieldName + " cannot contain Numbers !");
					return false;
				}
			}
		}
	return true;
}

function checkChar(fieldName, val, num)
{
	for (var i = 0; i <val.length;i++){
			for(var j=0;j < num.length;j++){
				if(val.charAt(i)==num.charAt(j)){
					alert(fieldName + " contain Numbers !");
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
var regularExp = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
if(!trim(document.getElementById(email).value).match(regularExp))
	{
	alert("Please enter a valid Email Address");
	document.getElementById(email).focus();
	return false;
	}
	else{
		return true;
	}
}

function checkSpace(fieldName, val, num)
{  var count = 0;

	for (var i = 0; i <val.length;i++)
		{
			
				if(val.charAt(i)==num)
					{
					count++;
					
				}// end of if
			}// end of for loop

if(val.length == count)
	{ alert(fieldName +" cannot contain only space(s).");
	return false;
	}// end of if
	else {
		return true;
		} // end of else

} // End of function


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
	//val = 0;
	//Check for character values in Numbers only fields
	for (var i = 0; i<val.length; i++)
	{
		num = val.charAt(i);
		if(num==".")
		{
			count++;
		}
		//Look for each character in the goodChars string
		pos = goodChars.indexOf(num);
		if(pos ==-1 || count>1){
			stat = false;
			alert(fieldName + " should contain "+goodChars+" & single decimal point only!" );
			return stat;
			break;
		}
	}
		N=val.indexOf(".");
		if(N!=-1){
			val1=val.substring(N+1);
			if(val1.length>2){
					stat=false;
					alert(fieldName+"should contain only 2 digit after decimal point!");
					return stat ;
				}
		}
	return stat;
}


// js for tooltip

function xstooltip_findPosX(obj) 
{
  var curleft = 0;
  if (obj.offsetParent) 
  {
    while (obj.offsetParent) 
        {
            curleft += obj.offsetLeft
            obj = obj.offsetParent;
        }
    }
    else if (obj.x)
        curleft += obj.x;
    return curleft;
}

function xstooltip_findPosY(obj) 
{
    var curtop = 0;
    if (obj.offsetParent) 
    {
        while (obj.offsetParent) 
        {
            curtop += obj.offsetTop
            obj = obj.offsetParent;
        }
    }
    else if (obj.y)
        curtop += obj.y;
    return curtop;
}

//js for tooltip
function xstooltip_show(tooltipId, parentId, posX, posY, width)
{
 
    it = document.getElementById(tooltipId);
    img = document.getElementById(parentId); 

    x = xstooltip_findPosX(img) + posX;
    y = xstooltip_findPosY(img) - posY;
    //alert(x+'&'+y);
    it.style.top = y + 'px';
    it.style.left = x + 'px';
    it.style.width = width +'px';
    it.style.visibility = 'visible'; 
}

function xstooltip_hide(id)
{
    it = document.getElementById(id); 
    it.style.visibility = 'hidden'; 
}
  
function show(ii){

    //alert(ii);
	loadFragment('../includes/info.jsp?which='+ii, 'tooltip','Info');
}

function loadFragment(fragment_url, element_id, for_what){
    var xmlhttp = "";
    if (window.XMLHttpRequest){
        // code for Mozilla, etc.
        xmlhttp=new XMLHttpRequest();
    }else if (window.ActiveXObject){ 
        // code for IE
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }else{
        alert("Sorry Your Browser is not Supported");
    }
    
    var element = document.getElementById(element_id);
    
    var message = "";
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center"><span class="loading normal"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
        
    element.innerHTML = processingRequest;

    try{
        xmlhttp.open("GET", fragment_url);
        xmlhttp.onreadystatechange = function(){

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
                var gotresponse	=	xmlhttp.responseText;
                
				message =  gotresponse;
                   
                element.innerHTML = message;
             }
		}
		xmlhttp.send(null);
	 }// display an error in case of failure
	 catch (e){
	  alert("Can't connect to server:\n" + e.toString());
	 }
}