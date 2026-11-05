function cancel(txnId)
{
	frmObj = document.frmCancelRequest;

	val = confirm("Do you wish to cancel this allowance request ? ");

	if(val)
	{
		//If "yes" then submit the page
		frmObj.action="../requestor/cancelRequestSubmit.jsp?id="+txnId;

		frmObj.submit( );

	}else{
		return;
	}
}

function go( ){
	frmObj = document.frmCancelRequest;

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

	frmObj.option.value="submit";
	frmObj.action = "../requestor/cancelRequest.jsp";
	frmObj.submit( );

}