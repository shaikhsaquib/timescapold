var	rowCount = 0;
function showMyCols(){
	
	frmObj = document.frmCreateInwordRequest;
	
	if(frmObj.gatePassType[1].checked){

			gatePassType=frmObj.gatePassType[1].value;
			document.getElementById("showThisDate").style.display = 'none';
	}else{
			gatePassType="";
			document.getElementById("showThisDate").style.display = 'block';
	}


}

function validateRequest(){

	frmObj = document.frmCreateInwordRequest;
	
	var valid;
	var val;
	var monthName = new Array( "0", "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC");
	

	gatePassType = document.getElementsByName("gatePassType");

	if(!gatePassType[0].checked && !gatePassType[1].checked ){
		alert("Please select the gatepass type!!");
		return;
	}
	
	gatepassValue = gatePassType[0].checked ? "R" : "N";

	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\";
	var num = "0123456789";
	var alfa = "abcdefghijklmnopqrstuvwxyz";
//	var allowNum = "0123456789.";
	//checkNull();

	

	/*--------------Party's Name Field check begins------*/
	  
	  val = frmObj.partyName.value;
	  valid = checkNull("party Name",val);
	if(!valid){
		frmObj.partyName.focus();
		return;
	}
	
	valid = checkJunk("party Name", val);
	
	if(!valid){
		frmObj.partyName.focus();
		//frmObj.partyName.value = "";
		return;
	}

	valid = checkNum("party Name", val, num);
	
	if(!valid){
		frmObj.partyName.focus();
		//frmObj.partyName.value = "";
		return;
	}
	
/*--------------Party's Name Field check ends--------------*/

/*--------------Mobile number Dropdown check begins------*/

	var mobileNumber= frmObj.mobileNumber.value;

	valid = checkNull("mobile Number",mobileNumber);

	if(!valid){
		frmObj.mobileNumber.focus();
		return;
	}

	valid = checkChar("mobile Number", mobileNumber, alfa);
	if(!valid){
		frmObj.mobileNumber.focus();
		frmObj.mobileNumber.value = "";
		return;
	}

/*--------------Mobile number check ends--------------*/


/*--------------Party's Address Field check begins------*/
	  
	val = frmObj.partyAddress.value;
	valid = checkNull("party Address",val);
	if(!valid){
		frmObj.partyAddress.focus();
		return;
	}
	
	/*
	valid = checkJunk("partyAddress", val);
	if(!valid){
		frmObj.partyAddress.focus();
		frmObj.partyAddress.value = "";
		return;
	}
	*/

/*--------------Party's Address Field check ends--------------*/

/*--------------Location Field check begins------*/
	  
	  locnCode = frmObj.locnCode.value;

	  var locn = locnCode.substring(0,locnCode.indexOf("|"));
	  				
	  var comp = locnCode.substring(locnCode.indexOf("|")+1);
	 
	  if(locnCode=='0'){

		alert("Please select the Location!!");
		frmObj.locnCode.focus();
		return;
	
	}
	
/*--------------Location By Field check ends--------------*/

/*--------------deparment Field check begins------*/
	  
	  
	var deptCode = frmObj.deptCode.value;

	var deptCode = deptCode.substring(0,code.indexOf("|"));	

	 var emailId = frmObj.emailId.value;

	 var responseArray2 = emailId.split('|');

	 var timescapUserOID = responseArray2[0];
	 var emailid1 = responseArray2[2];
 
					
	//  var comp = locnCode.substring(locnCode.indexOf("|")+1);
	 // alert(comp);
	  /*if(locnCode=='0'){

		alert("Please select the Location!!");
		frmObj.locnCode.focus();
		return;
	
	}*/
	
/*--------------deparment By Field check ends--------------*/



	returnDate		= frmObj.returnDate.value;
	hideReturnDate		= frmObj.hideReturnDate.value;
	currentSysdate		= frmObj.currentSysdate.value;
	
	fromDate	=	dateFormat(currentSysdate);//new Date();

	fmtToDate 	=  dateFormat(returnDate);

	dayDiff = validatePeriod(fromDate, fmtToDate);

	if(gatepassValue=='R' &&  hideReturnDate != '0')
	{
		fmtToDate1 	=  dateFormat(hideReturnDate);

		if(fmtToDate > fmtToDate1)
		{
			alert("Modified Retrun Date should be less than Return Date!!");
			frmObj.returnDate.focus();
			return;
		}
	}

	if(dayDiff > 365)
	{
		alert("Return Date cannot be greater than 365 days !!");
		frmObj.returnDate.focus();
		return;
	}
		
	if(gatepassValue=='R' && returnDate==''){

		alert("Please select the Probable Date of Return!!");
		frmObj.returnDate.focus();
		return;
	
	}

	materialDesc = document.getElementsByName("materialDesc");
	purchaseOrderNo = document.getElementsByName("purchaseOrderNo");
	quantity = document.getElementsByName("quantity");
	remarks = document.getElementsByName("remarks");

	flag = 0;

	for(j = 1; j <= rowCount; j++) {

	var materialDesc = document.getElementById("materialDesc"+j).value;
	var purchaseOrderNo = document.getElementById("purchaseOrderNo"+j).value;

	//var quantity =  document.getElementById("quantity"+j).value;
	var quantity = eval("frmObj.quantity"+j+".value");
	var remarks = document.getElementById("remarks"+j).value;

		if(trim(purchaseOrderNo)!='')
		{
			flag++;
			if(trim(materialDesc)=='' || trim(remarks)=='' ){
				alert("Please fill the values in a respective row!!");
				purchaseOrderNo[j].focus();
				return;
		}	
		}
	}

	if(flag==0)
	{
		alert("Please enter at least one material details!");
		//purchaseOrderNo[1].focus();
		return;
	}

//"../common/updatePrintAction.jsp?spId="+spId+"&gatepassId="+gatepassId+"&pageName="+pageName+"&flag="+flag+"&type="+type;
	
	//frmObj.action = "../processor/createInwardSubmit.jsp?comp="+comp+"&locn="+locn+"&deptCode="+deptCode+"&timescapUserOID="+timescapUserOID;
	frmObj.action = "../processor/createInwardSubmit.jsp?comp="+comp+"&locn="+locn+"&deptCode="+deptCode+"&timescapUserOID="+timescapUserOID+"&rowCount="+rowCount+"&emailid1="+emailid1;
	frmObj.submit();    
} 

function showAll(cheatCode){

  if(cheatCode==1){
		
       showDepartments();

	   setTimeout("showEmailid()",600);
    }
}


function showEmailid(){

	frmObj = document.frmCreateInwordRequest;

	code = frmObj.locnCode.value;

	var locn = code.substring(0,code.indexOf("|"));
					
	var comp = code.substring(code.indexOf("|")+1);
	
	var deptCode = frmObj.deptCode.value;

	var deptCode = deptCode.substring(0,code.indexOf("|"));
	
	loadFragment('../includes/emailid.jsp?comp='+comp+'&locn='+locn+'&deptCode='+deptCode,'emailid','Emailid');
   //loadURL("../reviewer/reviewRequestsContainer.jsp?"+params, "showRequests", "Requests Loading...");

    
}


function showDepartments(){

	frmObj = document.frmCreateInwordRequest;
	
	code = frmObj.locnCode.value;

	var locn = code.substring(0,code.indexOf("|"));
					
	comp = code.substring(code.indexOf("|")+1);
		
	
	loadFragment('../includes/departments.jsp?locn='+locn+'&comp='+comp,'departments','Departments');
	//loadFragment('../includes/empType.jsp','grades','Grades');
    
} 

function validatePeriod(date1, date2) {
  // The number of milliseconds in one day
    var ONE_DAY = 1000 * 60 * 60 * 24;

    // Convert both dates to milliseconds
    var date1_ms = date1.getTime();
    var date2_ms = date2.getTime();
    // Calculate the difference in milliseconds
	
    var difference_ms = Math.abs(date1_ms - date2_ms);
    // Convert back to days and return
    return Math.round(difference_ms/ONE_DAY)
}

function onClickCheckMul(rows)
{
	rowCount = rows;
	frmObj = document.frmCreateInwordRequest;
	
	var alfa = "abcdefghijklmnopqrstuvwxyz";

	var result;
	var count = 0;
	var count1=0;

	purchaseOrderNo = document.getElementsByName("purchaseOrderNo");
	//quantity = document.getElementsByName("quantity");

	if(rows == "2")
	{
		for(j = 1; j <= rows; j++) 
		{
		/*--------------processor By Field check ends--------------*/
			//alert("NNNN");
			//var quantity = parseInt(frmObj.quantity[j].value);
			
			//var quantity =  document.getElementByName('quantity'+j).value;
			var quantity = eval("frmObj.quantity"+j+".value");
			//var rejectQuan = frmObj.rejectQuan[j].value;
			//alert(quantity);
			//var rejectQuan =  document.getElementById("rejectQuan"+j).value;
			var rejectQuan = eval("frmObj.rejectQuan"+j+".value");
			valid = checkChar("Quantity", quantity, alfa);
			if(!valid){
				frmObj.quantity[j-1].focus();
				frmObj.quantity[j-1].value = "";
				//document.getElementById("quantity"+j-1).focus() = "";
				//document.getElementById("quantity"+j-1).value = "";
				
				return;
				}		

			valid = checkChar("Reject quantity", rejectQuan, alfa);
			if(!valid){
				frmObj.rejectQuan[j-1].focus();
				frmObj.rejectQuan[j-1].value = "";
				//document.getElementById("quantity"+j-1).focus() = "";
				//document.getElementById("quantity"+j-1).value = "";
				
				return;
				}

			if(rejectQuan!="")
				{
				  result = quantity - rejectQuan;
				  	  
				  if(result < "0")
				  {
					   alert("Reject quantity cannot be greater than Quantity");
					   frmObj.rejectQuan[j-1].focus();
					   frmObj.rejectQuan[j-1].value = "";
					// document.getElementById("rejectQuan"+(j-1)).focus() = "";
					// document.getElementById("rejectQuan"+(j-1)).value = "";
					   return;
				   }
				  document.getElementById("receivedQuan"+j).value = result;
				  count = count + result;

				 }				
		}

	}
	else
	{
		//for(j = 0; j < rows; j++) 
		//{
			//var quantity = parseInt(frmObj.quantity[rows].value);
			
			var quantity = document.getElementById("quantity"+rows).value;
			//var rejectQuan = frmObj.rejectQuan[rows].value;
			var rejectQuan = document.getElementById("rejectQuan"+rows).value;
			valid = checkChar("Quantity", quantity, alfa);
			if(!valid)
			{
				document.getElementById("quantity"+rows).focus();

			    document.getElementById("quantity"+rows).value = "";
				return;
			}		
			
			valid = checkChar("Reject quantity", rejectQuan, alfa);
			if(!valid)
			{			
				document.getElementById("rejectQuan"+rows).focus();

			    document.getElementById("rejectQuan"+rows).value = "";
				return;
			}

			/*if(rejectQuan > quantity)
				{
				   alert("Reject quantity cannot be greater than Quantity");
				  // frmObj.rejectQuan[rows].focus();
				   return;
				}
			*/
			if(rejectQuan!="")
				{
				   result = quantity - rejectQuan;	
				    if(result < "0")
					  {
						   alert("Reject quantity cannot be greater than Quantity");

						   document.getElementById("rejectQuan"+rows).focus();

						   document.getElementById("rejectQuan"+rows).value = "";

						   return;
					   }
				  document.getElementById("receivedQuan"+rows).value = result;
				  count = count + result;

				 }				
		//}
	}
	document.getElementById("totalPendingQuan").value = count;
	
}

function onClickCheck(rows)
{
	rowCount = rows;
	frmObj = document.frmCreateInwordRequest;
	
	var alfa = "abcdefghijklmnopqrstuvwxyz";

	var result;
	var count = 0;
	var count1=0;

	purchaseOrderNo = document.getElementsByName("purchaseOrderNo");
	//quantity = document.getElementsByName("quantity");

	if(rows == "1")
	{
		//var quantity = parseInt(frmObj.quantity.value);
		var quantity = document.getElementById("quantity"+rows).value;
		//var rejectQuan = frmObj.rejectQuan.value;
		var rejectQuan = document.getElementById("rejectQuan"+rows).value;

		valid = checkChar("Quantity", quantity, alfa);
		if(!valid)
		{
			document.getElementById("quantity"+rows).focus();

			document.getElementById("quantity"+rows).value = "";
			return;
		}

		valid = checkChar("Reject quantity", rejectQuan, alfa);
		if(!valid)
		{
			document.getElementById("rejectQuan"+rows).focus();

			document.getElementById("rejectQuan"+rows).value = "";
			return;
		}

		var r = 0;
		
		if(rejectQuan!="" )
		{
		   result = quantity - rejectQuan;	
		   if(result < "0")
		  {
			   alert("Reject quantity cannot be greater than Quantity");

			   document.getElementById("rejectQuan"+rows).focus();

			   document.getElementById("rejectQuan"+rows).value = "";
			   return;
		   }
		   document.getElementById("receivedQuan"+rows).value = result;
		   count = result;
		 }
	}
	else
	{
		for(j = 1; j <= rows; j++) 
		{
		/*--------------processor By Field check ends--------------*/

			//var quantity = parseInt(frmObj.quantity[j].value);
			var quantity =  document.getElementById("quantity"+j).value;
			//var rejectQuan = frmObj.rejectQuan[j].value;

			var rejectQuan =  document.getElementById("rejectQuan"+j).value;
			
			valid = checkChar("Quantity", quantity, alfa);
			if(!valid){
				//frmObj.quantity[j].focus();
				//frmObj.quantity[j].value = "";
				document.getElementById("quantity"+j).focus();

			    document.getElementById("quantity"+j).value = "";
				return;
				}		

			valid = checkChar("Reject quantity", rejectQuan, alfa);
			if(!valid){
				//frmObj.rejectQuan[j].focus();
				//frmObj.rejectQuan[j].value = "";
				document.getElementById("rejectQuan"+j).focus();

			    document.getElementById("rejectQuan"+j).value = "";
				return;
				}

			/*if(rejectQuan > quantity)
				{
				   alert("Reject quantity cannot be greater than Quantity");
				   frmObj.rejectQuan[j].focus();
				   return;
				}*/

			if(rejectQuan!="")
				{
				  result = quantity - rejectQuan;
				  	  
				  if(result < "0")
				  {
					   alert("Reject quantity cannot be greater than Quantity");

					   document.getElementById("rejectQuan"+j).focus();

						document.getElementById("rejectQuan"+j).value = "";
					   return;
				   }
				  document.getElementById("receivedQuan"+j).value = result;
				  count = count + result;

				 }
		/*--------------processor By Field check ends--------------*/	
				
		}
	}
	document.getElementById("totalPendingQuan").value = count;
	
}





function onCheck(rows)
{
	frmObj = document.frmViewRequests;
	
	var alfa = "abcdefghijklmnopqrstuvwxyz";

	var count1 = 0;


	for(j = 0; j < rows; j++) 
	{
		if(rows=='1')
		{
			var inwardPendingQuan = parseInt(frmObj.inwardPendingQuan.value);

			var recQuantity = parseInt(frmObj.recQuantity.value);

			var sendQuan = parseInt(frmObj.sendQuan.value);

			var PendingQuan = parseInt(frmObj.PendingQuan.value);

			var result;

			if((sendQuan!="") && (sendQuan == '0'))
				{
			
					 result = recQuantity - sendQuan;

					document.getElementById("PendingQuan").value = result;	

					count1 = result + count1;

					document.getElementById("totalPendingQuan").value = count1;
				 }
			else
				{
			
					result = inwardPendingQuan - sendQuan;	
					
					document.getElementById("PendingQuan").value = result;	

					count1 = result + count1;

					document.getElementById("totalPendingQuan").value = count1;
						
				}
			
			if(result < '-1')
				{
				   alert("Sending quantity should be greater than Received Quantity");
				   frmObj.sendQuan.focus();
				   frmObj.sendQuan.value = "";
				   return;
				}

			valid = checkChar("Sending quantity", sendQuan, alfa);
			if(!valid){
				frmObj.sendQuan.focus();
				frmObj.sendQuan.value = "";
				return;
				}		
		  }
		  else{
					
			//var recQuantity = frmObj.recQuantity[j].value;                                      	

			var recQuantity = parseInt(frmObj.recQuantity[j].value);

			var inwardPendingQuan = parseInt(frmObj.inwardPendingQuan[j].value);

			var sendQuan = parseInt(frmObj.sendQuan[j].value);

			var PendingQuan = parseInt(frmObj.PendingQuan[j].value);
			
			valid = checkChar("Sending quantity", sendQuan, alfa);
			if(!valid){
				frmObj.sendQuan[j].focus();
				frmObj.sendQuan[j].value = "";
				return;
				}

			if(sendQuan > recQuantity)
				{
				   alert("Sending quantity should be greater than Received Quantity");
				   frmObj.sendQuan[j].focus();
				   frmObj.sendQuan[j].value = "";
				   return;
				}

			if((sendQuan!="") && (sendQuan == '0'))
				{
					 result = recQuantity - sendQuan;

					document.getElementById("PendingQuan"+j).value = result;

					count1 = result + count1;

					document.getElementById("totalPendingQuan").value = count1;

					
				 }
			else
				{	
					result = inwardPendingQuan - sendQuan;
									
					document.getElementById("PendingQuan"+j).value = result;
					
					count1 = result + count1;

					document.getElementById("totalPendingQuan").value = count1;
					
						
				}
				  				 
			 }
			 
		}

}

function getData()
{

	frmObj = document.frmCreateInwordRequest;
	
	var alfa = "abcdefghijklmnopqrstuvwxyz";

	gatePassType = document.getElementsByName("gatePassType");

	gatepassValue = gatePassType[0].checked ? "R" : "N";

	outWardNumber = frmObj.outReferenceNum.value;

	if(outWardNumber == '' || outWardNumber == 0){

		alert("Please select the Outward Number!!");
		frmObj.outReferenceNum.focus();
		return;
	
	}

	valid = checkChar("Outward Number", outWardNumber, alfa);

	if(!valid)
	{
		frmObj.outReferenceNum.focus();
		frmObj.outReferenceNum.value = "0";
		return;
	}

	loadURL("../processor/viewInwardRefNumber.jsp?outReferenceNum="+outWardNumber+"&gatepassValue="+gatepassValue, "showRequests", "Requests");

}

function getDataOnClick(outWardNumber,gatepassValue){

	frmObj = document.frmCreateInwordRequest;

	if(outWardNumber == "0")
	{
					
	loadURL("../processor/viewInwardRefNumber.jsp?outReferenceNum="+outWardNumber+"&gatepassValue="+gatepassValue, "showRequests", "Requests");

	}
}



function loadURL(fragment_url, element_id, for_what){
    
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

	processingRequest='<table width="100%" height="100%"><tr><td align="center"><div align="center"><span class="style3"><img src="../images/loading.gif" >&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
       
    element.innerHTML = processingRequest;

    try{
        
		xmlhttp.open("GET", fragment_url);
        xmlhttp.onreadystatechange = function(){
		//alert(xmlhttp.status);
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
                var gotresponse	=	xmlhttp.responseText;
                
				message =  gotresponse;
                   
                element.innerHTML = message;
				//alert(message);
             }
		}
		xmlhttp.send(null);
		//alert("testing2");
	 }// display an error in case of failure
	 catch (e){
	  alert("Can't connect to server:\n" + e.toString());
	 }
}