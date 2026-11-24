function rejectClaim()
{
	frmObj = document.frmRejectInsuranceClaim;

	frmObj.action = "../approver/rejectInsuranceClaimSubmit.jsp";
	frmObj.submit( );	
}
