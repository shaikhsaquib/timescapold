function signoffAppr(size){

   var i = 0;
  // alert(size);
   frmObj = document.frmSaveChklist;
		//alert(frmObj);
	while (i < size )
		{ 

		temp = eval("frmObj.feedBackOptions"+i).value;
		//alert(temp);
		temp1 = eval("frmObj.overriddenRating"+i).value;
		//alert(temp);
		temp2 = eval("frmObj.remark"+i).value;
		//alert(temp2);
		temp3 = eval("frmObj.noncomplianceText"+i).value;
		//alert(temp3);
		//alert(temp);
	
		if (temp == 'Not Rated')
		{  
			alert("Please Enter Feedback for Question no: "+ (i+1))
			eval("frmObj.feedBackOptions"+i).focus();
			return;
		}
		
		if (temp == temp3 && (temp2 == "" || temp2 == "NA"))
		{  
			alert("Please Enter Remarks for Noncompliance!!");
			eval("frmObj.remark"+i).focus();
			return;
		}
		
		if(eval("frmObj.overriddenRating"+i).checked &&( eval("frmObj.overriddenRemarks"+i).value == '' || eval("frmObj.overriddenRemarks"+i).value == '-') ){
			//temp1 = eval("frmObj.overriddenRating"+i).value;
			alert("Please Enter Overriden Remarks for Question: " + (i+1));
			eval("frmObj.overriddenRemarks"+i).focus();
				return;
		}
		//temp1 = eval("frmObj.remarks"+i).value;

					
		
			i++;	
		} 
		   for(i=0;i<size;i++){
	
				eval("frmObj.overriddenRating"+i).disabled = false;
				eval("frmObj.overriddenRemarks"+i).disabled = false;

		}
		frmObj.action="../approver/governanceApproverSubmit.jsp?action=SignOff";
		frmObj.submit();
	}
	