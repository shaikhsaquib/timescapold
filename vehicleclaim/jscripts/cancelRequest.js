function cancel(reqNo)
{
	frmObj = document.frmCancelRequest;

	val = confirm("Do you wish to cancel this Vehicle Claim request ? ");

	if(val){
		//If "yes" then submit the page
		frmObj.action="../requestor/cancelRequestSubmit.jsp?id="+reqNo;
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


/*--------------From Month check begins--------------

	// Checking the From Month for Null Value
	fromMonth   = frmObj.month.options[frmObj.month.selectedIndex].value;
	stat = checkNull("From Month", fromMonth);

	if(!stat){
		frmObj.month.focus( );
		return;
	}
/*--------------From Month check ends--------------*/

	frmObj.option.value="submit";
	frmObj.action = "../requestor/cancelRequest.jsp";
	frmObj.submit( );

}