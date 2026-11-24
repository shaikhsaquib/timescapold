function go( ){
	frmObj = document.frmViewInsuranceClaim;

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


/*--------------From Month check begins--------------*/
	/*
		Checks on From Month
		1) It should not be null
	*/
	// Checking the From Month for Null Value
	fromMonth   = frmObj.month.options[frmObj.month.selectedIndex].value;
	stat = checkNull("From Month", fromMonth);

	if(!stat){
		frmObj.month.focus( );
		return;
	}
/*--------------From Month check ends--------------*/

	frmObj.option.value="submit";
	frmObj.action = "../requestor/viewInsuranceClaim.jsp";
	frmObj.submit( );

}

function cancelClaim(claimRequestNo)
{
	frmObj = document.frmViewInsuranceClaim;

	/*monthYear = frmObj.option.value;
	result = confirm("Do you want to cancel this claim request!");
	if(result == true)
	{
		frmObj.action = "../includes/cancelClaimRequest.jsp?claimRequestNo="+claimRequestNo;
		frmObj.submit( );

	}else{
		frmObj.action = "../requestor/viewInsuranceClaim.jsp?option="+monthYear;
		frmObj.submit( );
	}*/

	var url = "../includes/cancelClaimRequest.jsp?claimRequestNo="+claimRequestNo;
	window.open(url,'','resizable=yes,toolbars=no,scrollbars=yes,width=800,height=600,top=50,left=50');
}