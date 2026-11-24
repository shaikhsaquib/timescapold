function validate(actionNumber,todayDay)
{
	frmObj = document.frmPreviewRequest;

	var entitlementCode = document.getElementById('entitlementCode').value;

	//alert(entitlementCode);

	if(entitlementCode == 'ENT'){
		entitlementCode = 'Entertainment';
	}
	if (entitlementCode == 'INT')
	{
		entitlementCode = 'Internet';
	}
	if (entitlementCode == 'BKP')
	{
		entitlementCode = 'Books And Periodicals';
	}
	if (entitlementCode == 'DRR')
	{
		entitlementCode = 'Driver'; 
	}
	if (entitlementCode == 'FRR')
	{
		entitlementCode = 'Fuel';
	}
	if (entitlementCode == 'VRR')
	{
		entitlementCode = 'Vehicle Repair';
	}


	if(actionNumber == 'add_req')
		{val = confirm("Do you wish to add these " +entitlementCode+ " Reimbursement Bills? ");
		if(val){
		frmObj.actionNumber.value = 'add_req';
		frmObj.action="../requestor/createRequest.jsp"
		frmObj.submit( );
				}
		else{return;}
		}
	else if(actionNumber == "sub_req" && todayDay > 12)
		{val = confirm("All claims (including ones claimed through TIMESCAPE) submitted on or after 13th of the month will be reimbursed in the next month's salary.");
		if(val){
		frmObj.actionNumber.value = 'sub_req';
		frmObj.action="../requestor/createRequestSubmit.jsp"
		frmObj.submit( );
				}
		else{return;}
		}
	else if(actionNumber == "sub_req" )
		{val = confirm("Do you wish to save these " +entitlementCode+ " Reimbursement Bills?");
		if(val){
		frmObj.actionNumber.value = 'sub_req';
		frmObj.action="../requestor/createRequestSubmit.jsp"
		frmObj.submit( );
				}
		else{return;}
		}
	else
		{val = confirm("Do you wish to save these " +entitlementCode+ " Reimbursement Bills? ");
		if(val){
		frmObj.action="../requestor/createRequestSubmit.jsp"
		frmObj.submit( );
				}
		else{return;}
		}

}


function showCurrentFile(fileName, emailid,str,attachment){
	var url			= "../common/popup.jsp?fileName="+fileName+"&emailid="+emailid+"&str="+str+"&attachment="+attachment;
	window.location.href = url;
}