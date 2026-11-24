function approveRequest(ii,id,status){

	frmObj = document.frmApproveRequest;
	
	frmObj.approverStatus.value = status;
	frmObj.approverId.value = id;
	
	var remark = eval("frmObj.remarks"+ii);
	if (status=="R")
	{
		stat = checkNull("Remark", remark.value);

		if(!stat){
			remark.focus();
			return;
		}
	}
	frmObj.approverRemark.value = remark.value;

	frmObj.action="../approver/approveRequestSubmit.jsp";
	frmObj.submit( );
}