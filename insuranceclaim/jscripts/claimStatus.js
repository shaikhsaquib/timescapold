function go( ){
	frmObj = document.frmClaimStatus;

/*--------------From Year check begins--------------*/
	/*
		Checks on From Year
		1) It should not be null
	*/
	// Checking the From Year for Null Value
	fromYear   = frmObj.year.options[frmObj.year.selectedIndex].value;
	stat = checkNull("From Year", fromYear);

	if(!stat){
		frmObj.year.focus( );
		return;
	}
/*--------------From Year check ends--------------*/


/*--------------From Month check begins--------------*/
	
		/*Checks on Status
		1) It should not be null*/

	// Checking the From Month for Null Value
	fromMonth   = frmObj.month.options[frmObj.month.selectedIndex].value;
	status   = frmObj.status.options[frmObj.status.selectedIndex].value;
	/*stat = checkNull("Status", status1);

	if(!stat){
		frmObj.status.focus( );
		return;
	}*/	
/*--------------From Month check ends--------------*/

	//alert(fromYear);
	frmObj.hiddstatus.value = status;
	frmObj.hiddyear.value = fromYear;
	frmObj.hiddmonth1.value = fromMonth;
	//alert(frmObj.hiddyear.value);

	frmObj.action = "../approver/claimStatus.jsp";
	frmObj.submit( );

}


function test(status){

	var opt = document.getElementById("company").value;
	if(opt == "0")
	{
		alert("Please Select Company");
		return;
	}
	var comp = document.getElementById("company").value;

	if(comp == "ALL"){
		var policy = "ALL";
	}else{
	var policy = document.getElementById("subPolicySelectBox").value;
	}
	frmObj = document.frmClaimStatus;
	var months = {	JAN: 01,
					FEB: 02, 
					MAR: 03, 
					APR: 04, 
					MAY: 05, 
					JUN: 06, 
					JUL: 07, 
					AUG: 8, 
					SEP: 9, 
					OCT: 10, 
					NOV: 11, 
					DEC: 12 };
//    alert("1");
	 //status = document.getElementById("status").value;
	
	 fromDate = frmObj.fromdate1.value;
	 toDate = frmObj.todate1.value;

	var str1 = document.getElementById("fromdate1").value;
	var str2 = document.getElementById("todate1").value;
  
	var dt1  = parseInt(str1.substring(0,2),11); 
	var mon1 = (String)(str1.substring(3,6),11);
	var yr1  = parseInt(str1.substring(7,11),11); 
	//alert(mon1);
	var mon1 = months[mon1]; 
	var dt2  = parseInt(str2.substring(0,2),11); 
	var mon2 = (String)(str2.substring(3,6),11); 
	var yr2  = parseInt(str2.substring(7,11),11); 
    var mon2 = months[mon2]; 
	var date1 = new Date(yr1, mon1, dt1); 
	var date2 = new Date(yr2, mon2, dt2); 
   

	 if (date2 < date1)
	 {
		 alert("To Date cannot be earlier than From Date !!!");
	 } 
	 else{
		 frmObj.action = "../approver/claimStatus.jsp?policy="+policy+"&comp="+comp+"&status="+status+"&fromDate="+fromDate+"&toDate="+toDate;
		 frmObj.submit( );
		}

	}

	function getPolicy(subValue, elementId, URL)
	{
	
		Ajax(subValue, elementId, URL );
	}

	function Ajax(subValue, elementId, URL)
	{
			if (window.XMLHttpRequest)
				  { // code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp=new XMLHttpRequest();
				  }
			else
				  {// code for IE6, IE5
				  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				  }
		
				  xmlhttp.onreadystatechange=function()
					{
						if (xmlhttp.readyState==4 && xmlhttp.status==200)
						{
							
							//alert(xmlhttp.responseText);
								document.getElementById(elementId).innerHTML = xmlhttp.responseText;
					
							}
					}
				  var random = Math.random();	
				  URL = URL+"?subValue="+subValue+"&randome="+random;
				  //alert(URL);
				  xmlhttp.open("GET",URL,true);
				  xmlhttp.send();

}