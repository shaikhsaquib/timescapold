function validate(size,roleId){

   var i = 0;

   frmObj = document.frmCreateRequest;

//   alert(size);
//   alert(roleId);
   while (i < size )
	{ 
	    
		temp = eval("frmObj.feedBackOption"+i).value;
		temp2 = eval("frmObj.remark"+i).value;
        temp3 = eval("frmObj.userFdbk"+i).value;
		temp4 = eval("frmObj.status"+i).value;
		//alert(temp2);
/*        if (temp == 'NR')
        {  
			alert("Please select Feedback!!")
			eval("frmObj.feedBackOption"+i).focus();
			return;
        } 
*/		 if (temp == 'No' && temp2=='')
		{  
			alert("Please select/enter Remark!!")
			eval("frmObj.remark"+i).focus();
			return;
		}
 alert(temp4);
 temp6 = 'L'
// 	if(temp4.match("L")){
		 if((temp=='Yes' && temp3=='No') || (temp=='No' && temp3=='Yes')){
	
			alert("Please enter Remark for Your No Feedback!!");
			eval("frmObj.remark"+i).focus();
			return;
		}		
//		 }
		i++;
	}

	
for(j=0;j<size;j++){
	
			if(eval("frmObj.feedBackOption"+j).disabled){
			//alert("true");
				eval("frmObj.feedBackOption"+j).disabled = false;
				//eval("frmObj.remark"+j).disabled = false;

		}

	}
	
	if(roleId==1){
		frmObj.action="../requestor/dailySubmit.jsp";
		frmObj.submit();
	}else if(roleId==2){
		frmObj.action="../approver/approverDailySubmit.jsp";
		frmObj.submit();
	}
}

function resetVal(){
	//alert("true");
	//frmObj = document.frmCreateRequest;
	//frmObj.reset();
}

function changeDate(){
	frmObj = document.frmCreateRequest;
	dateVal = frmObj.date.value;
	frmObj.action="../reviewer/dashBoardDaily.jsp?date="+dateVal;
	frmObj.submit();
}

function goBack(whichPg){
	//alert("true"+whichPg);
	frmObj = document.frmRequestSubmit;
	if(whichPg=='daily'){
		//alert(whichPg);
		frmObj.action="../approver/approveDaily.jsp";
	}else if(whichPg=='weekly'){
		frmObj.action="../approver/approveWeekly.jsp";
	}else if(whichPg=='fortNightly'){
		frmObj.action="../approver/approveFortNightly.jsp";
	}else if(whichPg=='monthly'){
		frmObj.action="../approver/approveMonthly.jsp";
	}else if(whichPg=='quarterly'){
		frmObj.action="../approver/approveQuarterly.jsp";
	}else if(whichPg=='halfYearly'){
		frmObj.action="../approver/approveHalfYearly.jsp";
	}else if(whichPg=='annually'){
		frmObj.action="../approver/approveAnnually.jsp";
	}

	frmObj.submit();

	//frmObj.reset();
}

function changeDate(frequency){
	frmObj = document.frmCreateRequest;
	dateVal = frmObj.date.value;
	
	if(frequency==1){
	frmObj.action="../approver/approveDaily.jsp?date="+dateVal;
	frmObj.submit();
	}

	if(frequency==2){
	frmObj.action="../approver/approverWeekly.jsp?date="+dateVal;
	frmObj.submit();
	}

	if(frequency==3){
	frmObj.action="../approver/approverFortNightly.jsp?date="+dateVal;
	frmObj.submit();
	}

	if(frequency==4){
	frmObj.action="../approver/approverMonthly.jsp?date="+dateVal;
	frmObj.submit();
	}

	if(frequency==5){
	frmObj.action="../approver/approverQuarterly.jsp?date="+dateVal;
	frmObj.submit();
	}

	if(frequency==6){
	frmObj.action="../approver/approverHalfYearly.jsp?date="+dateVal;
	frmObj.submit();
	}

	if(frequency==7){
	frmObj.action="../approver/approverAnnually.jsp?date="+dateVal;
	frmObj.submit();
	}
}