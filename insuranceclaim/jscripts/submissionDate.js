function validate(){
	frmObj = document.frmSubmissionDate;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789";


/*--------------Submission Date check begins--------------*/
	/*
		1) It should not be Null
		2) It should not be less than Current Date
	*/
	submissionDate = Trim(frmObj.submissionDate.value);

	stat = checkNull("Submission Date", submissionDate);

	if(!stat){
		frmObj.submissionDate.focus();
		return;
		}

/*--------------Submission Date check ends--------------*/

	frmObj.action = "../requestor/submissionDateSubmit.jsp";
	frmObj.submit();
}