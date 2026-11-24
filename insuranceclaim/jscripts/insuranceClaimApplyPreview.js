function validate(){
	frmObj = document.frmInsuranceClaimApplyPreview;
	frmObj.action = "../requestor/insuranceClaimSubmit.jsp";
	frmObj.submit();
}
