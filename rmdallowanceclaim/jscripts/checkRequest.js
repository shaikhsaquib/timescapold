function go( ){
	frmObj = document.frmCheckRequest;

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
	frmObj.action = "../requestor/checkRequest.jsp";
	frmObj.submit( );

}

function release(claimTotal,txnId){
	frmObj = document.frmCheckRequest;

	// Checking the From Year for Null Value
val = confirm("Do you wish to Submit this Request to the Finance Department?");
if(val)
	{ 
	expr = "../requestor/updateRequestSubmit.jsp?id1="+claimTotal+"&id2=sub_req&id3="+txnId;
	
	frmObj.action = expr;
	frmObj.submit( );
	}
}