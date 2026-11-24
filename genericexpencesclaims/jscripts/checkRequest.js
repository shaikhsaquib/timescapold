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

function release(claimTotal,id,claimDetailsSize){
	frmObj = document.frmCheckRequest;

	// Checking the claimDetailsSize for Null Value
    if(claimDetailsSize<=0){
        alert("There are no bills filled, Please edit and add bills first!!");
        return;

    }else{
        val = confirm("Do you wish to Submit this Request to the Finance Department?");
        if(val)
            { 
           // expr = "../requestor/updateRequestSubmit.jsp?claim="+claimTotal+"&actionNumber=sub_req&txnId="+txnId;
            expr = "../requestor/updateRequestSubmit.jsp?claim="+claimTotal+"&actionNumber=sub_req&id="+id;
            
            frmObj.action = expr;
            frmObj.submit( );
            }
    }
}