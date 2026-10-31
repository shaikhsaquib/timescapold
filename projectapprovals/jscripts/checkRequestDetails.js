function acceptClaim(){
	frmObj = document.frmCheckRequestDetails;
	frmObj.action = "../approver/acceptInsuranceClaim.jsp";
	frmObj.submit( );
}

function rejectClaim()
{
	frmObj = document.frmCheckRequestDetails;

	frmObj.action = "../approver/rejectInsuranceClaim.jsp";
	frmObj.submit( );	
}

function submitClaim()
{
	frmObj = document.frmCheckRequestDetails;

	frmObj.action = "../approver/submitInsuranceClaim.jsp";
	frmObj.submit( );	
}

function settleClaim()
{
	frmObj = document.frmCheckRequestDetails;

	frmObj.action = "../approver/settleInsuranceClaim.jsp";
	frmObj.submit( );	
}

function rejectClaimRemark(){

	frmObj = document.frmCheckRequestDetails;

	self.close();
	requestNo = frmObj.hiddRequestNo.value;
	window.open('../approver/rejectInsuranceClaim.jsp?requestNo='+requestNo,'');
}
function companyRejectClaimRemark(){

	frmObj = document.frmCheckRequestDetails;

	self.close();
	requestNo = frmObj.hiddRequestNo.value;
	claimNo = frmObj.hiddClaimNo.value;
	window.open("../approver/companyRejectInsuranceClaim.jsp?requestNo="+requestNo+"&claimNo="+claimNo);
}