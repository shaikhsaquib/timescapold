function validate(size,roleId){

	//alert("HHHHH");

   var i = 0;
   var flag = false;

   frmObj = document.frmCreateRequest;

//   alert(size);
//   alert(roleId);
   while (i < size )
	{ 
	    temp4= 'N0'
		temp = eval("frmObj.feedBackOption"+i).value;
		temp2 = eval("frmObj.remark"+i).value;
        temp3 = eval("frmObj.isAttach"+i).value;
		temp4 = eval("frmObj.attachmentName"+i).value;
        temp5= eval("frmObj.apprFdbk"+i).value;
        temp6= eval("frmObj.newFeedback1"+i).value;
		//alert("temp6--"+temp6);
/*        if (temp == 'NR')
        {  
			alert("Please select Feedback!!")
			eval("frmObj.feedBackOption"+i).focus();
			return;
        } 
*/		

		stat=checkMaxLength('Remark', temp2, 255)
		if(!stat){
			eval("frmObj.remark"+i).focus( );
			return;
		}
     	
		if ((temp == 'No' || temp == 'Not Applicable')&& temp2=='')
		{  
			alert("Please Enter Remarks!!")
			eval("frmObj.remark"+i).focus();
			return;
		}

		stat = checkNull("File ",temp4);
		
		if (temp3 == 'YES' && !stat && temp != 'Not Applicable' && temp != 'Not Acted' && temp != 'Yes')  
		{
		//      if(temp4 == 'NA'){
			a=i+1;
			alert("Please Attach File for Control No:"+ a);
		    return;
		//	 }
		} 

		if (temp6 == 'Yes' || temp6 == 'No' || temp6 == 'Not Applicable')
		{
			//alert("aaaa");
			val = confirm("You have already submitted your compliance to the OCA for this month.Would you like to submit again?");
			break;
			
		}else if (temp6 == 'Not Acted' )
		{
			frmObj.action="../requestor/dailySubmit.jsp";
			frmObj.submit();
		
		}
	i++;
	}

		if (val)
		{
			frmObj.action="../requestor/dailySubmit.jsp";
			frmObj.submit();
		}

	for(j=0;j<size;j++){
	
			if(eval("frmObj.feedBackOption"+j).disabled){
			//alert("true");
				eval("frmObj.feedBackOption"+j).disabled = false;
				//eval("frmObj.remark"+j).disabled = false;
		}

	}
	
		/*var k = 0;
		var count = 0;
		
		while (k < size )
		{
			temp = eval("frmObj.feedBackOption"+k).value;
			ntacount = temp;	
			//alert("gggg---"+ntacount);
			k++;
			//alert("vvv"+k);
			count++;
			//alert("count111---"+count);
			//alert("gggg---"+ntacount);
			if (( ntacount=='Not Acted') && count ==1)
			{
				//alert("countdd---"+count);
				//count++;
				frmObj.action="../requestor/dailySubmit.jsp";
				frmObj.submit();
				
			}else if ((ntacount=='Yes' || ntacount=='No' || ntacount=='Not Applicable' )&& count !=0)
			{
				alert("count---"+count);
			for (count==0;count<=1 ;count++ )
				{
					val = confirm("You have already submitted your compliance to the OCA for this month.Would you like to submit again?");
				}
			}
			
		}*/
			

	//val = confirm("You have already submitted your compliance to the OCA for this month.Would you like to submit again?");
	//if(val){
		//frmObj.action="../requestor/dailySubmit.jsp";
		//frmObj.submit();
	//}
	//}else if(roleId==2){
		//frmObj.action="../approver/approverDailySubmit.jsp";
		//frmObj.submit();
	//}
}

function resetVal(){
   //frmObj = document.frmCreateRequest;
   //frmObj.reset();
}

function changeDate(frequency){
	frmObj = document.frmCreateRequest;
	dateVal = frmObj.date.value;
	
	if(frequency==1){
	//frmObj.action="../requestor/daily.jsp?date="+dateVal;
	//frmObj.submit();
	var url = "../requestor/daily.jsp?date="+dateVal;
	loadFragment1(url, 'showdetails','Loading...');
	}

	if(frequency==2){

	var url = "../requestor/weekly.jsp?date="+dateVal;
	loadFragment1(url, 'showdetails','Loading...');
	//frmObj.action="../requestor/weekly.jsp?date="+dateVal;
	//frmObj.submit();
	}

	if(frequency==3){
	
	var url = "../requestor/fortNightly.jsp?date="+dateVal;
	loadFragment1(url, 'showdetails','Loading...');
	//frmObj.action="../requestor/fortNightly.jsp?date="+dateVal;
	//frmObj.submit();
	}

	if(frequency==4){
	
	var url = "../requestor/monthly.jsp?date="+dateVal;
	loadFragment1(url, 'showdetails','Loading...');
	//frmObj.action="../requestor/monthly.jsp?date="+dateVal;
	//frmObj.submit();
	}

	if(frequency==5){
	
	var url = "../requestor/quarterly.jsp?date="+dateVal;
	loadFragment1(url, 'showdetails','Loading...');
	//frmObj.action="../requestor/quarterly.jsp?date="+dateVal;
	//frmObj.submit();
	}

	if(frequency==6){

	var url = "../requestor/halfYearly.jsp?date="+dateVal;
	loadFragment1(url, 'showdetails','Loading...');
	//frmObj.action="../requestor/halfYearly.jsp?date="+dateVal;
	//frmObj.submit();
	}

	if(frequency==7){
	var url = "../requestor/annually.jsp?date="+dateVal;
	loadFragment1(url, 'showdetails','Loading...');
	//frmObj.action="../requestor/annually.jsp?date="+dateVal;
	//frmObj.submit();
	}
}







function validate1(size,roleId){

   var i = 0;

   frmObj = document.frmCreateRequest;

//   alert(size);
//   alert(roleId);
   while (i < size )
	{ 
	    
		userFdbk = eval("frmObj.userFdbk"+i).value;
		temp = eval("frmObj.feedBackOption"+i).value;
		//alert(userFdbk);
		temp2 = eval("frmObj.remark"+i).value;
		temp4 = eval("frmObj.attachmentName"+i).value;
		temp6= eval("frmObj.newFeedback2"+i).value;
		//alert(temp6);

		//alert(temp2);
/*        if (temp == 'NR')
        {  
			alert("Please select Feedback!!")
			eval("frmObj.feedBackOption"+i).focus();
			return;
        } 
*/		
		if ((temp == 'No' || temp == 'Not Applicable') && temp2=='')
		{  
			alert("Please Enter Remarks!!")
			eval("frmObj.remark"+i).focus();
			return;
		}

		if(((userFdbk=='No' && temp == 'Yes')|| (userFdbk=='Yes' && temp == 'No')) &&  temp2==''){
			alert("Please Enter Remarks!!")
			eval("frmObj.remark"+i).focus();
			return;
		}

		if (temp6 == 'Yes' || temp6 == 'No' || temp6 == 'Not Applicable')
		{
			//alert("aaaa");
			val = confirm("You have already submitted your compliance to the OCA for this month.Would you like to submit again?");
			break;
			
		}else if (temp6 == 'Not Acted')
		{
			frmObj.action="../approver/approverDailySubmit.jsp";
			frmObj.submit();
		}
		
		i++;
	}

	

	for(j=0;j<size;j++){
	
			if(eval("frmObj.feedBackOption"+j).disabled){
			//alert("true");
				eval("frmObj.feedBackOption"+j).disabled = false;
				//eval("frmObj.remark"+j).disabled = false;

		}

	}

	//val = confirm("You have already submitted your compliance to the OCA for this month.Would you like to submit again?");
	if(val){
	if(roleId==1){
		frmObj.action="../requestor/dailySubmit.jsp";
		frmObj.submit();
	}else if(roleId==2){
		frmObj.action="../approver/approverDailySubmit.jsp";
		frmObj.submit();


	}else if(roleId==4){
		frmObj.action="../approver/approverDailySubmit.jsp";
		frmObj.submit();
	}
	}
}



function changeDateApp(whichPg){

	//alert("hhisdf");
	frmObj = document.frmCreateRequest;
	dateVal = frmObj.date.value;
	//frmObj = document.frmRequestSubmit;
	if(whichPg=='1'){

		var url = "../approver/approveDaily.jsp?date="+dateVal;
		loadFragment1(url, 'showdetails','Loading...');
		//alert(whichPg);
		//frmObj.action="../approver/approveDaily.jsp?date="+dateVal;

	}else if(whichPg=='2'){

		var url = "../approver/approveWeekly.jsp?date="+dateVal;
		loadFragment1(url, 'showdetails','Loading...');

		//frmObj.action="../approver/approveWeekly.jsp?date="+dateVal;

	}else if(whichPg=='3'){

		var url = "../approver/approveFortNightly.jsp?date="+dateVal;
		loadFragment1(url, 'showdetails','Loading...');

		//frmObj.action="../approver/approveFortNightly.jsp?date="+dateVal;

	}else if(whichPg=='4'){

		var url = "../approver/approveMonthly.jsp?date="+dateVal;
		loadFragment1(url, 'showdetails','Loading...');

		//frmObj.action="../approver/approveMonthly.jsp?date="+dateVal;

	}else if(whichPg=='5'){

		var url = "../approver/approveQuarterly.jsp?date="+dateVal;
		loadFragment1(url, 'showdetails','Loading...');

		//frmObj.action="../approver/approveQuarterly.jsp?date="+dateVal;

	}else if(whichPg=='6'){

		var url = "../approver/approveHalfYearly.jsp?date="+dateVal;
		loadFragment1(url, 'showdetails','Loading...');

		//frmObj.action="../approver/approveHalfYearly.jsp?date="+dateVal;

	}else if(whichPg=='7'){

		var url = "../approver/approveAnnually.jsp?date="+dateVal;
		loadFragment1(url, 'showdetails','Loading...');

		//frmObj.action="../approver/approveAnnually.jsp?date="+dateVal;

	}

	//frmObj.submit();

	//frmObj.action="../approver/approveDaily.jsp?date="+dateVal;
	//frmObj.submit();
}


function goBack(whichPg){

	//alert("true"+whichPg);
	frmObj = document.frmRequestSubmit;

//	var url = "../requestor/commonHeader.jsp";
	//loadFragment1(url, 'showdetails','Loading...');
	//window.location.reload();
	//location.reload(true);
	//window.top.location.href = '../requestor/commonHeader.jsp';
	frmObj.action="../requestor/commonHeader.jsp";
	frmObj.submit();

	/*if(whichPg=='daily'){

		var url = "../approver/approveDaily.jsp";
		loadFragment1(url, 'showdetails','Loading...');
		//alert(whichPg);
		//frmObj.action="../approver/approveDaily.jsp";

	}else if(whichPg=='weekly'){

		var url = "../approver/approveWeekly.jsp";
		loadFragment1(url, 'showdetails','Loading...');

		//frmObj.action="../approver/approveWeekly.jsp";

	}else if(whichPg=='fortNightly'){

	var url = "../approver/approveFortNightly.jsp";
		loadFragment1(url, 'showdetails','Loading...');

	//	frmObj.action="../approver/approveFortNightly.jsp";

	}else if(whichPg=='monthly'){

		var url = "../approver/approveMonthly.jsp";
		loadFragment1(url, 'showdetails','Loading...');

		//frmObj.action="../approver/approveMonthly.jsp";

	}else if(whichPg=='quarterly'){

		var url = "../approver/approveQuarterly.jsp";
		loadFragment1(url, 'showdetails','Loading...');

		//frmObj.action="../approver/approveQuarterly.jsp";

	}else if(whichPg=='halfYearly'){

		var url = "../approver/approveHalfYearly.jsp";
		loadFragment1(url, 'showdetails','Loading...');

		//frmObj.action="../approver/approveHalfYearly.jsp";

	}else if(whichPg=='annually'){
		var url = "../approver/approveAnnually.jsp";
		loadFragment1(url, 'showdetails','Loading...');

		//frmObj.action="../approver/approveAnnually.jsp";

	}*/

	//frmObj.submit();

	//frmObj.reset();
}

function loadFragment1(fragment_url, element_id, for_what){
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
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center"><span class="loading normal"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+'</span></div></td></tr></table>';
        
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