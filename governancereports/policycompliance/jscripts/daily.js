function validate(size,roleId){

   var i = 0;

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
	//	alert(temp3);
   // alert(temp4);
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
		
		if (temp3 == 'YES' && !stat && temp != 'Not Applicable' && temp != 'Not Acted' && temp != 'Yes')  {
	//      if(temp4 == 'NA'){
			a=i+1;
			alert("Please Attach File for Control No:"+ a);
		    return;
	//	 }
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

	//if(roleId==1){
		frmObj.action="../requestor/dailySubmit.jsp";
		frmObj.submit();
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
	frmObj.action="../requestor/daily.jsp?date="+dateVal;
	frmObj.submit();
	}

	if(frequency==2){
	frmObj.action="../requestor/weekly.jsp?date="+dateVal;
	frmObj.submit();
	}

	if(frequency==3){
	frmObj.action="../requestor/fortNightly.jsp?date="+dateVal;
	frmObj.submit();
	}

	if(frequency==4){
	frmObj.action="../requestor/monthly.jsp?date="+dateVal;
	frmObj.submit();
	}

	if(frequency==5){
	frmObj.action="../requestor/quarterly.jsp?date="+dateVal;
	frmObj.submit();
	}

	if(frequency==6){
	frmObj.action="../requestor/halfYearly.jsp?date="+dateVal;
	frmObj.submit();
	}

	if(frequency==7){
	frmObj.action="../requestor/annually.jsp?date="+dateVal;
	frmObj.submit();
	}
}

