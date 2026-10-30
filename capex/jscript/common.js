function toggle_visible(currentdiv){


	//height = document.getElementById(currentdiv).style.height;

	if(document.getElementById(currentdiv).style.display!="block"){
	    //document.getElementById(currentdiv).style.visibility="visible"; 
        document.getElementById(currentdiv).style.display="block"; 
    }else{
        //document.getElementById(currentdiv).style.visibility="hidden";
        document.getElementById(currentdiv).style.display="none";
    }
}

function submitViaEnter(evt, frmName) 
{ 
	//alert(frmName);
	evt = (evt) ? evt : event; 
	var target = (evt.target) ? evt.target : evt.srcElement;

	var form = eval("document."+frmName);

	var ch = (evt.charCode) ? evt.charCode : ((evt.which) ? evt.which : evt.keyCode); 
	if (ch == 13 || ch == 3) 
	{ 
		if(frmName=='frmChangePwd'){
			if (validateChangePwd(form)) 
			{ 
				form.submit( ); 
				return false; 
			}
		}else if(frmName=='frmLogin'){
			if (validate(form)) 
			{ 
				form.submit( ); 
				return false; 
			}
		}else{
			if (validate(form)) 
			{ 
				form.submit( ); 
				return false; 
			}
		}
	} 
	return true;
}

function loadFragment(fragment_url, element_id, for_what) {
	var xmlhttp = "";
	if (window.XMLHttpRequest) {
		// code for Mozilla, etc.
		xmlhttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		// code for IE
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}else {
		alert("Sorry Your Browser is not Supported");
	}
	var element = document.getElementById(element_id);
	//alert(element);
	var message = "";
	var processingRequest = '<table width="100%" height="100%"><tr><td align="center"><div align="center"><span class="table table-bordered table-hover"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'
	+ for_what + ' Loading...</span></div></td></tr></table>';
	$("#"+element_id).html(processingRequest);
	//element.innerHTML = processingRequest;
	try {
		xmlhttp.open("GET", fragment_url);
		xmlhttp.onreadystatechange = function(){
				 
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var gotresponse = xmlhttp.responseText;
				message = gotresponse;
				//alert(message);
				$("#"+element_id).html(message);
				//element.innerHTML = message;
			}
		}
		xmlhttp.send(null);
	}// display an error in case of failure
	catch (e) {
		alert("Can't connect to server:\n" + e.toString());
	}
}


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
	alert("Invalid Email Address, Check  in  "+ email);
	document.getElementById(email).focus();
	return false;
	}
	else{
		return true;
	}
}

 function checkNextNull(fieldName, val)
{
	frmObj = document.frmCreateRequest;
	// Checking for null
	if((val == null) || (val== "") || (val =="0"))
	{return false;
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

function imposeMaxLength(Event, Object, MaxLen, Id) {
	document.getElementById(Id).value = MaxLen - Object.value.length;
	return (Object.value.length < MaxLen)||(Event.keyCode == 8 ||Event.keyCode==46||(Event.keyCode>=35&&Event.keyCode<=40)) 
}


function logOut(){

	//alert("true");
	url = "../web/logout.jsp";
	window.open(url,"_parent","");
	
}

function loadFragmentPost(fragment_url, element_id, for_what, data){

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
    var processingRequest='<table width="100%" height="100%"><tr><td align="center"><div align="center"><span class="loading normal"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
    //alert(processingRequest);    
    element.innerHTML = processingRequest;

    try{
        xmlhttp.open("POST", fragment_url, true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.onreadystatechange = function(){

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
                var gotresponse	=	xmlhttp.responseText;
                
				//alert(data);
				message =  gotresponse;
                element.innerHTML = message;
				if(element_id.indexOf('showmsg')>-1){
					//var indexId = element_id.substring(element_id.indexOf("g")+1);
					var t = setTimeout("getBlank('"+element_id+"');", 2000);
					
				}
			}
		}
		xmlhttp.send(data);
	 }// display an error in case of failure
	 catch (e){
	  alert("Can't connect to server:\n" + e.toString());
	 }
}



function getBlank(whichdiv){
	document.getElementById(whichdiv).innerHTML ="";
}

function imposeMaxLength(Event, Object, MaxLen, field) {
	document.getElementById(field).value = MaxLen - Object.value.length;
	return (Object.value.length < MaxLen)||(Event.keyCode == 8 ||Event.keyCode==46||(Event.keyCode>=35&&Event.keyCode<=40)) 
}

function checkEmailnDomain(email, domainName)
{
	var regularExp = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
	if(!trim(email).match(regularExp))
	{
		alert("Invalid Email Address, kindly check in "+ email);
		//document.getElementById(email).focus();
		return false;
	}
	else{
		var domain = email.split('@');
		if(domain[1] != domainName){
			alert(" Invalid Email Address,\n Kindly key in "+domainName+" domain only for "+ email+" !!");
			return false;
		}else{

			return true;
		}
	}
}

