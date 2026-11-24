function validate(actionNumber,todayDay)
{
	frmObj = document.frmPreviewRequest;

	if(actionNumber == 'add_req')
		{val = confirm("Do you wish to add these Vehicle Lease Reimbursement Bills? ");
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
		{val = confirm("Do you wish to save these Vehicle Lease Reimbursement Bills?");
		if(val){
		frmObj.actionNumber.value = 'sub_req';
		frmObj.action="../requestor/createRequestSubmit.jsp"
		frmObj.submit( );
				}
		else{return;}
		}
	else
		{val = confirm("Do you wish to save these Vehicle Lease Reimbursement Bills? ");
		if(val){
		frmObj.action="../requestor/createRequestSubmit.jsp"
		frmObj.submit( );
				}
		else{return;}
		}

}