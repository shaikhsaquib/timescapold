function cancelClaim()
{
	frmObj = document.frmInsuranceClaim;

	frmObj.action = "../includes/cancelClaimRequestSubmit.jsp";
	frmObj.submit( );	
}
