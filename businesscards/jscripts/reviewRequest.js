function reviewRequest(roleCode,ii,id,status){

	frmObj = document.frmApproveRequest;
	frmObj.reviewerStatus.value = status;
	frmObj.reviewerId.value = id;
	
	var remark = eval("frmObj.remarks"+ii);
	if (status=="R")
	{
		stat = checkNull("Remark", remark.value);

		if(!stat){
			remark.focus();
			return;
		}
	}
	frmObj.reviewerRemark.value = remark.value;
	if(roleCode =='3'){
		frmObj.action="../reviewer/reviewRequestSubmit.jsp";
	}else if(roleCode =='7'){
		frmObj.action="../pbchecker/reviewRequestSubmit.jsp";
	}
	frmObj.submit( );
}