function validate()
	{

	frmObj = document.leaveApplication;
		alert('Hi');
/*--------------Reason check begins--------------*/
	/*
		1) It should not be Null
	*/
	//Reason = Trim(frmObj.Reason.value);

	// Checking for Null
	//stat = checkNull("Reason", Reason);

	//if(!stat){
	//	frmObj.Reason.focus();
	//	return;}
	

/*--------------Reason check ends--------------*/


	frmObj.action = "leaveApplicationSubmit.jsp";
	frmObj.submit();
}

/*function clear(){
	frmObj = document.leaveApplication;
	frmObj.reset();
}*/
