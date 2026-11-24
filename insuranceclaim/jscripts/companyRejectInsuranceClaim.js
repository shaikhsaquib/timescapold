function rejectClaim()
{
	frmObj = document.frmRejectInsuranceClaim;
	var j = 0;

	rejectRemark = Trim(frmObj.rejectRemark.value);

	stat = checkNull("Remark", rejectRemark);

	if(!stat){
		frmObj.rejectRemark.focus();
		return;
	}

	if(document.getElementById("withdraw").checked == true)
		j += 1;

	frmObj.action = "../approver/companyRejectInsuranceClaimSubmit.jsp?value="+j;
	frmObj.submit( );	
}
