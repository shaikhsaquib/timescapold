function go( ){
	frmObj = document.frmApproveInsuranceClaim;

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
	frmObj.action = "../approver/approveInsuranceClaim.jsp";
	frmObj.submit( );

}

function onLoadDetail(requestNo)
{	//alert(requestNo);
	loadFragment("../../common/attachment.jsp?requestNo="+requestNo,"attachment","Attachment");
}