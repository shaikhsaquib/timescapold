function validate(size,roleId){

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
	}else if(roleId==4){
		frmObj.action="../approver/approverDailySubmit.jsp";
		frmObj.submit();
	}
}

function resetVal(){
	//alert("true");
	//frmObj = document.frmCreateRequest;
	//frmObj.reset();
}

function changeDate(whichPg){
	frmObj = document.frmCreateRequest;
	dateVal = frmObj.date.value;
	//frmObj = document.frmRequestSubmit;
	if(whichPg=='1'){
		//alert(whichPg);
		frmObj.action="../approver/approveDaily.jsp?date="+dateVal;
	}else if(whichPg=='2'){
		frmObj.action="../approver/approveWeekly.jsp?date="+dateVal;
	}else if(whichPg=='3'){
		frmObj.action="../approver/approveFortNightly.jsp?date="+dateVal;
	}else if(whichPg=='4'){
		frmObj.action="../approver/approveMonthly.jsp?date="+dateVal;
	}else if(whichPg=='5'){
		frmObj.action="../approver/approveQuarterly.jsp?date="+dateVal;
	}else if(whichPg=='6'){
		frmObj.action="../approver/approveHalfYearly.jsp?date="+dateVal;
	}else if(whichPg=='7'){
		frmObj.action="../approver/approveAnnually.jsp?date="+dateVal;
	}

	frmObj.submit();

	//frmObj.action="../approver/approveDaily.jsp?date="+dateVal;
	//frmObj.submit();
}

function goBack(whichPg){
	//alert("sss");
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
