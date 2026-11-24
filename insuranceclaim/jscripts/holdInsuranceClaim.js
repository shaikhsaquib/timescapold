function holdClaim()
{
	frmObj = document.frmHoldInsuranceClaim;

	frmObj.action = "../approver/holdInsuranceClaimSubmit.jsp";
	frmObj.submit( );	
}
